import boto3
import json
from datetime import datetime

ecs = boto3.client('ecs', region_name='us-east-1')

def lambda_handler(event, context):
    """
    Scale ECS services down to 0 tasks if:
    1. Service is ACTIVE
    2. desiredCount > 0
    3. NOT tagged with keep=true

    This stops ECS tasks by setting desiredCount = 0.
    """

    stopped_resources = []
    errors = []

    try:
        print("[INFO] Checking ECS clusters...")

        cluster_arns = []

        paginator = ecs.get_paginator('list_clusters')
        for page in paginator.paginate():
            cluster_arns.extend(page.get('clusterArns', []))

        if not cluster_arns:
            print("[INFO] No ECS clusters found")

        for cluster_arn in cluster_arns:
            print(f"[INFO] Checking ECS cluster: {cluster_arn}")

            service_arns = []

            service_paginator = ecs.get_paginator('list_services')
            for page in service_paginator.paginate(cluster=cluster_arn):
                service_arns.extend(page.get('serviceArns', []))

            if not service_arns:
                print(f"[INFO] No ECS services found in cluster {cluster_arn}")
                continue

            # describe_services supports up to 10 services per request
            for i in range(0, len(service_arns), 10):
                batch_service_arns = service_arns[i:i + 10]

                try:
                    response = ecs.describe_services(
                        cluster=cluster_arn,
                        services=batch_service_arns
                    )
                except Exception as e:
                    errors.append(f"ECS describe_services {cluster_arn}: {str(e)}")
                    print(f"[ERROR] Failed to describe services in {cluster_arn}: {str(e)}")
                    continue

                for service in response.get('services', []):
                    service_name = service.get('serviceName')
                    service_arn = service.get('serviceArn')
                    desired_count = service.get('desiredCount', 0)
                    running_count = service.get('runningCount', 0)
                    status = service.get('status')

                    if status != 'ACTIVE':
                        print(f"[SKIP] ECS service {service_name} status is {status}")
                        continue

                    if desired_count == 0:
                        print(f"[SKIP] ECS service {service_name} already desiredCount=0")
                        continue

                    # Get ECS service tags
                    try:
                        tag_response = ecs.list_tags_for_resource(
                            resourceArn=service_arn
                        )

                        # ECS tags use lowercase key/value
                        tags = {
                            tag.get('key'): tag.get('value')
                            for tag in tag_response.get('tags', [])
                        }
                    except Exception as e:
                        tags = {}
                        print(f"[WARN] Could not get tags for ECS service {service_name}: {str(e)}")

                    # Check if keep=true tag exists
                    if tags.get('keep') == 'true':
                        print(f"[SKIP] ECS service {service_name} has keep=true tag")
                        continue

                    # OPTIONAL: Only stop dev services
                    # Uncomment if you only want to stop dev services
                    # if tags.get('Environment') != 'dev':
                    #     print(f"[SKIP] ECS service {service_name} is not Environment=dev")
                    #     continue

                    try:
                        ecs.update_service(
                            cluster=cluster_arn,
                            service=service_name,
                            desiredCount=0
                        )

                        stopped_resources.append({
                            'type': 'ECS',
                            'clusterArn': cluster_arn,
                            'serviceName': service_name,
                            'serviceArn': service_arn,
                            'previousDesiredCount': desired_count,
                            'previousRunningCount': running_count,
                            'newDesiredCount': 0,
                            'tags': tags,
                            'timestamp': datetime.utcnow().isoformat()
                        })

                        print(
                            f"[STOP] ECS service {service_name} in cluster {cluster_arn} "
                            f"scaled from desiredCount={desired_count} to 0"
                        )

                    except Exception as e:
                        errors.append(f"ECS {service_name}: {str(e)}")
                        print(f"[ERROR] Failed to scale ECS service {service_name} to 0: {str(e)}")

    except Exception as e:
        print(f"[FATAL] {str(e)}")
        errors.append(f"Fatal error: {str(e)}")

    response_body = {
        'statusCode': 200,
        'stopped_count': len(stopped_resources),
        'stopped_resources': stopped_resources,
        'errors': errors,
        'timestamp': datetime.utcnow().isoformat()
    }

    print(f"[RESULT] {json.dumps(response_body, indent=2)}")

    return response_body