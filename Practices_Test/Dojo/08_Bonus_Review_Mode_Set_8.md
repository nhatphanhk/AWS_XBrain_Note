# AWS Certified Solutions Architect Associate (SAA-C03) - Bonus Practice Exam Set 8

> **Tổng số câu hỏi:** 24 câu  
> **Nguồn tài liệu:** Tutorials Dojo  
> **Chế độ:** Review Mode (Kèm đáp án & lời giải chi tiết vì sao đúng / sai)  

---

## Câu 1 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
An organization leverages Amazon VPC to host its multi-tier services. The organization aims to provide a web analytics service via RESTful APIs to a user base spanning millions. Access to these APIs requires user verification through an authentication service. The APIs will be exposed through secure HTTP endpoints.

What is the most operationally efficient approach to satisfy these requirements?

### Các lựa chọn (Choices)
- [x] **A.** Implement user authentication with an Amazon Cognito user pool and secure REST API access using Amazon API Gateway with a Cognito user pool authorizer.
- [ ] **B.** Launch Amazon API Gateway REST APIs and integrate with AWS Lambda for user authentication using a Lambda authorizer.
- [ ] **C.** Configure IAM users for authentication and integrate with Amazon API Gateway HTTP APIs using an IAM authorizer.
- [ ] **D.** Create an Amazon Cognito identity pool for federated identity management and secure HTTP APIs using Amazon API Gateway with an IAM authorizer.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Implement user authentication with an Amazon Cognito user pool and secure REST API access using Amazon API Gateway with a Cognito user pool authorizer.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Cognito** provides user pools, which are user directories, to help handle user registration, authentication, and account recovery. Amazon API Gateway supports Cognito user pool authorizers in authenticating API calls. Using Amazon Cognito user pools with API Gateway for RESTful APIs allows seamless security and identity management integration, ensuring operational efficiency and scalability suitable for millions of users.

 **Amazon Cognito user pool** is a comprehensive user directory that enables both authentication and authorization mechanisms for web and mobile applications. It operates as an OpenID Connect (OIDC) identity provider, facilitating robust identity verification and management. The user pool enhances security through multiple layers, supports identity federation to allow integrations with other systems, and offers extensive customization options to tailor the user experience and application integration according to specific business needs.

![Amazon Cognito User Pool](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/Amazon_Cognito_user_pool_13_April_2024.png)

To utilize an Amazon Cognito user pool for API integration, establish a `COGNITO_USER_POOLS` type authorizer and associate it with the relevant API methods. When the API is active, clients must authenticate users via the user pool to obtain an identity or access token. This token should then be included in the API request, usually in the Authorization header. Successful API access requires a valid token; otherwise, the request will be rejected if the token is absent or invalid, showing that the client’s credentials do not have authorization.

Hence, the correct answer is: **Implement user authentication with an Amazon Cognito user pool and secure REST API access using Amazon API Gateway with a Cognito user pool authorizer.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an Amazon Cognito identity pool for federated identity management and secure HTTP APIs using Amazon API Gateway with an IAM authorizer** is incorrect. Identity pools are typically intended for authorization and accessing AWS services, not for authenticating users directly to access APIs.

- The option that says: **Launch Amazon API Gateway REST APIs and integrate with AWS Lambda for user authentication using a Lambda authorizer** is incorrect. Lambda authorizer would add complexity and operational overhead, as it requires custom code for authentication. While feasible, the AWS Cognito user pool is the most straightforward authorizer to use.

- The option that says: **Configure IAM users for authentication and integrate with Amazon API Gateway HTTP APIs using an IAM authorizer** is incorrect because it is unsuitable for managing millions of end-users. IAM users are primarily designed to control access to AWS resources internally within organizations, not for large-scale user authentication. This option lacks the necessary scalability and would result in significant management complexity when applied to a large user base.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html)
- [https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-enable-cognito-user-pool.html](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-enable-cognito-user-pool.html)

**Check out these Amazon Cognito and Amazon API Gateway Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-cognito/](https://tutorialsdojo.com/amazon-cognito/)
- [https://tutorialsdojo.com/amazon-api-gateway/](https://tutorialsdojo.com/amazon-api-gateway/)

---

## Câu 2 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A consumer goods company runs its website, handling online orders from customers, and supporting microservices on an Amazon Elastic Kubernetes Service (Amazon EKS) cluster.

A solution is required to route requests to the hosted services based on URL paths.

Which option will meet this requirement with the LEAST amount of setup?

### Các lựa chọn (Choices)
- [ ] **A.** Provision a NGINX Ingress controller.
- [ ] **B.** Use an AWS Lambda function to proxy requests to EKS.
- [ ] **C.** Provision a Network Load Balancer (NLB) using the AWS Load Balancer Controller.
- [x] **D.** Provision an Application Load Balancer (ALB) using the AWS Load Balancer Controller.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Provision an Application Load Balancer (ALB) using the AWS Load Balancer Controller.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Elastic Kubernetes Service (Amazon EKS)** is a managed service that eliminates the need to install, operate, and maintain your own Kubernetes control plane on Amazon Web Services (AWS).

An **Amazon EKS add-on** is software that provides supporting operational capabilities to Kubernetes applications but is not specific to the application. This includes software like observability agents or Kubernetes drivers that allow the cluster to interact with underlying AWS resources for networking, compute, and storage. For instance, the community-initiated **AWS Load Balancer Controller** simplifies the managing and provisioning of load balancing resources on AWS, initially conceived for Ingress-related load balancing and later expanded to include Service-related load balancing, i.e., L4 and NLB.

![AWS Load Balancer Controller](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/aws_load_balancer_controller_steps.png)

 **AWS Elastic Load Balancing** automatically distributes your incoming traffic across multiple targets, such as EC2 instances, containers, and IP addresses, in one or more Availability Zones. It monitors the health of its registered targets, and routes traffic only to the healthy targets. Elastic Load Balancing scales your load balancer as your incoming traffic changes over time. It can automatically scale to the vast majority of workloads.

The ELB family of products includes:

– Application Load Balancer

– Network Load Balancer

– Gateway Load Balancer

In this scenario, using the AWS Load Balancer Controller add-on should help by provisioning the ALB and other AWS resources.

Hence, the correct answer is: **Provision an Application Load Balancer (ALB) using the AWS Load Balancer Controller.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Provision a NGINX Ingress Controller** is incorrect. It will only result in the same functionality as an ingress provisioned via AWS Load Balancer Controller but with a slightly more involved setup.

- The option that says: **Use an AWS Lambda function to proxy requests to EKS** is incorrect because an ingress resource would still only be required for the Lambda function to connect. Implementing the load balancing on Lambda would require a non-trivial engineering effort.

- The option that says: **Provision a Network Load Balancer (NLB) using the AWS Load Balancer Controller** is because NLBs operate at the transport layer (Layer 4) and primarily route traffic based on IP address and port, not on application layer data such as URL paths.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.7/](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.7/)
- [https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html)
- [https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html](https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html)
- [https://aws-controllers-k8s.github.io/community/docs/community/overview/](https://aws-controllers-k8s.github.io/community/docs/community/overview/)

**Check out this AWS Elastic Load Balancing Cheat Sheet:**
- [https://tutorialsdojo.com/aws-elastic-load-balancing-elb/](https://tutorialsdojo.com/aws-elastic-load-balancing-elb/)

**Check out this Amazon EKS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/](https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/)

---

## Câu 3 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company uses multiple Amazon Elastic Block Store (Amazon EBS) volumes of the Provisioned IOPS SSD (io2) Block Express type attached to Amazon EC2 instances in its production environment. Based on the AWS Cost and Usage Report, the company noticed a significant increase in storage costs. The report provides detailed usage data, including throughput and IOPS. To address this, the company wants to optimize EBS costs by analyzing these metrics and adjusting volumes without causing application downtime.

What actions can help the company achieve this goal? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Apply an Amazon S3 lifecycle policy to archive infrequently accessed backup data to S3 Glacier automatically.
- [x] **B.** Monitor performance metrics such as IOPS and throughput for the EBS volumes using Amazon CloudWatch `GetMetricData`.
- [x] **C.** Adjust the size or performance settings of the EBS volumes using the EC2 `ModifyVolume`.
- [ ] **D.** Set an Amazon CloudWatch Billing Alarm to receive notifications about increased EBS storage costs.
- [ ] **E.** Modify instance attributes to lower EBS performance using the EC2 `ModifyInstanceAttribute`.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, C**
> - **B.** Monitor performance metrics such as IOPS and throughput for the EBS volumes using Amazon CloudWatch `GetMetricData`.
> - **C.** Adjust the size or performance settings of the EBS volumes using the EC2 `ModifyVolume`.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon EBS** provides scalable, high-performance storage for Amazon EC2 instances. Cost optimization strategies for EBS include monitoring performance metrics to ensure the volumes are appropriately sized and modifying volume settings to avoid paying for unnecessary capacity or performance.

 **Amazon CloudWatch `GetMetricData`** allows the company to monitor key performance metrics such as IOPS and throughput for EBS volumes. This helps identify underutilized or overprovisioned volumes, which can then be adjusted to reduce costs.

![Amazon EBS Metrics](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/ebs-metrics-02feb2025.png)

 **Amazon EC2 `ModifyVolume`** enables users to change the size, performance, or volume type of EBS volumes without stopping the instance. This action helps optimize costs while maintaining application availability.

![Modify Volume](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/ec2-modify-volume-02feb2025.png)

Hence, the correct answers are:

 **– Monitor performance metrics such as IOPS and throughput for the EBS volumes using Amazon CloudWatch `GetMetricData.`**

– **Adjust the size or performance settings of the EBS volumes using the EC2 `ModifyVolume`.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Apply an Amazon S3 lifecycle policy to archive infrequently accessed backup data to S3 Glacier automatically** is incorrect because this only applies to Amazon S3 storage and does not help optimize Amazon EBS storage costs.

- The option that says: **Modify instance attributes to lower EBS performance using the EC2 `ModifyInstanceAttribute`** is incorrect because instance attributes do not primarily control EBS volume performance. This option is unrelated to the task of optimizing EBS costs.

- The option that says: **Set an Amazon CloudWatch Billing Alarm to receive notifications about increased EBS storage costs** is incorrect. Although it can alert the company to increased costs, it does not provide detailed performance metrics or allow for direct volume optimization actions.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyVolume.html](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyVolume.html)

**Check out these Amazon EBS and Amazon CloudWatch Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)
- [https://tutorialsdojo.com/amazon-cloudwatch/](https://tutorialsdojo.com/amazon-cloudwatch/)

---

## Câu 4 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A healthcare provider is expanding its operations by integrating various specialized medical applications into its AWS environment. Each application must operate within its own isolated VPC to maintain compliance with data security regulations. These applications need to access a central VPC that hosts shared services. Additionally, the applications should be able to communicate with each other for data synchronization and reporting purposes. The healthcare provider plans to integrate dozens more applications over the next year.

Which of the following will minimize administrative overhead while meeting these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Set up a connection between the application VPCs and the shared service VPC by using AWS Direct Connect. Update and add routes from the application VPCs to the shared services VPC and vice versa.
- [x] **B.** Implement an AWS Transit Gateway and connect it with the application VPCs and the shared services VPC. Update the route tables and add routes in the application VPCs and the shared services VPC to route traffic through the transit gateway.
- [ ] **C.** Connect the application VPCs and shared services VPC using the Amazon VPC peering connections. Configure the peering connection to add routes between the VPCs.
- [ ] **D.** Establish VPN tunnels linking each application VPC and the shared services VPC. Configure routing in the application VPC subnets to enable communication with the shared services VPC.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Implement an AWS Transit Gateway and connect it with the application VPCs and the shared services VPC. Update the route tables and add routes in the application VPCs and the shared services VPC to route traffic through the transit gateway.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Transit Gateway** simplifies network architecture by serving as a central hub for connecting Amazon VPCs and on-premises networks. With its hub-and-spoke model, each VPC only needs to connect to the Transit Gateway to access other VPCs. This architecture reduces the complexity of managing multiple peering connections and routing tables. It supports IPv4 and IPv6 traffic and ensures secure, private connections without traversing the public internet. AWS Transit Gateway also enables traffic segmentation through multiple route tables, allowing for separate management of production and non-production environments.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/td-transit-gateway-05-24-2024.png)

 **AWS Transit Gateway** provides centralized control over your network traffic, enhancing visibility and security. It is highly scalable, accommodating growth without significant changes to the existing setup. Transit Gateways can be peered across regions, leveraging AWS’s global infrastructure for efficient and secure data transfer. This reduces administrative overhead significantly compared to managing numerous VPC peering connections or VPN tunnels.

For companies scaling their network infrastructure, **AWS Transit Gateway** is more efficient than traditional methods like VPC peering or VPN connections. It centralizes and simplifies network management, which is crucial when dealing with a large number of applications and VPCs.

Hence, the correct answer is: **Implement an AWS Transit Gateway and connect it with the application VPCs and the shared services VPC. Update the route tables and add routes in the application VPCs and the shared services VPC to route traffic through the transit gateway.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Establish VPN tunnels linking each application VPC and the shared services VPC. Configure routing in the application VPC subnets to enable communication with the shared services VPC** is incorrect. Establishing individual VPN tunnels for each VPC would create significant administrative overhead as the number of applications increases, making it less suitable for scalability.

- The option that says: **Connect the application VPCs and shared services VPC using the Amazon VPC peering connections. Configure the peering connection to add routes between the VPCs** is incorrect. While this option is feasible for a small number of applications, VPC peering does not efficiently scale in scenarios where many VPCs need to be interconnected due to the complexity of managing numerous paired connections.

- The option that says: **Set up a connection between the application VPCs and the shared service VPC by using AWS Direct Connect. Update and add routes from the application VPCs to the shared services VPC and vice versa** is incorrect. AWS Direct Connect is primarily used for connecting on-premises environments to AWS, not for inter-VPC communication within AWS, which is the primary requirement in this scenario.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)
- [https://docs.aws.amazon.com/vpc/latest/tgw/tgw-getting-started.html](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-getting-started.html)

**Check out these AWS Transit Gateway and Amazon VPC Cheat Sheets:**
- [https://tutorialsdojo.com/aws-transit-gateway/](https://tutorialsdojo.com/aws-transit-gateway/)
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 5 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company is looking to protect its mobile app’s sensitive data, which is encrypted using client-side encryption with AWS KMS managed keys (CSE-KMS). To enhance security, the company wishes to implement a mechanism that not only prevents the accidental deletion of KMS keys but also alerts administrators via email if there’s an attempt to delete a KMS key.

Which of the following solutions fulfills these requirements with minimal operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Implement an AWS Lambda function to block the deletion of KMS keys. Set up an Amazon CloudWatch alarm that triggers deletion attempts. Use Amazon EventBridge to call the Lambda function when a `DeleteKey` action is detected. Lastly, notify administrators via an Amazon Simple Notification Service (Amazon SNS) topic.
- [x] **B.** Configure an Amazon EventBridge rule to detect `DeleteKey` operations on AWS KMS. Link this rule to an AWS Systems Manager Automation runbook designed to cancel a key in pending deletion state. Additionally, set the EventBridge rule to notify administrators through an Amazon SNS topic upon such an attempt.
- [ ] **C.** Establish an AWS CloudTrail to monitor KMS key deletion attempts. Configure CloudTrail to send logs to Amazon CloudWatch Logs. Create a CloudWatch Logs metric filter to detect DeleteKey events and trigger an Amazon SNS notification to administrators.
- [ ] **D.** Set up an Amazon EventBridge rule that triggers attempts to delete a KMS key. Connect this rule to an AWS Config rule that reverses any deletion attempts. Then, configure an Amazon SNS topic to alert administrators whenever this event occurs.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Configure an Amazon EventBridge rule to detect `DeleteKey` operations on AWS KMS. Link this rule to an AWS Systems Manager Automation runbook designed to cancel a key in pending deletion state. Additionally, set the EventBridge rule to notify administrators through an Amazon SNS topic upon such an attempt.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon EventBridge** is a serverless event bus service that facilitates easy connection between applications using data from your own apps, integrated Software-as-a-Service (SaaS) apps, and AWS services. EventBridge can route specific events like KMS key deletion attempts to targets such as AWS Lambda, AWS Systems Manager or even directly to an Amazon SNS topic for notifications.

![Amazon EventBridge Event pattern](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/Amazon_EventBridge_rule_on_AWS_KMS_13_April_2024.png)

AWS Systems Manager Automation effectively responds to events detected by EventBridge. An Automation runbook can be configured to cancel the deletion of an AWS KMS key that is in a pending deletion state. This setup uses the AWS Systems Manager automation runbook `AWSConfigRemediation-CancelKeyDeletion` to facilitate canceling the deletion of an AWS KMS key. Aligning with the requirement to enhance security by blocking unwanted deletion attempts. Additionally, linking the EventBridge rule directly to an Amazon SNS topic ensures administrators are promptly alerted via email when a deletion attempt is detected.

Hence, the correct answer is: **Configure an Amazon EventBridge rule to detect `DeleteKey` operations on AWS KMS. Link this rule to an AWS Systems Manager Automation runbook designed to cancel a key in pending deletion state. Additionally, set the EventBridge rule to notify administrators through an Amazon SNS topic upon such an attempt.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up an Amazon EventBridge rule that triggers attempts to delete a KMS key. Connect this rule to an AWS Config rule that reverses any deletion attempts. Then, configure an Amazon SNS topic to alert administrators whenever this event occurs** is incorrect. While Amazon EventBridge can detect `DeleteKey` operations and AWS Config can evaluate the configuration of AWS resources, AWS Config rules cannot directly prevent actions. They are used for monitoring and compliance checks, not intercepting AWS service operations. Therefore, this option does not align with the requirements.

- The option that says: **Implement an AWS Lambda function to block the deletion of KMS keys. Set up an Amazon CloudWatch alarm that triggers deletion attempts. Use Amazon EventBridge to call the Lambda function when a `DeleteKey` action is detected. Lastly, notify administrators via an Amazon Simple Notification Service (Amazon SNS) topic** is incorrect because AWS Lambda primarily performs custom logic in response to AWS service events. However, Lambda functions cannot directly prevent the deletion of KMS keys; this can be used for notifications or to trigger other actions. As a result, this option introduces unnecessary complexity by using a CloudWatch alarm in this context.

- The option that says: **Establish an AWS CloudTrail to monitor KMS key deletion attempts. Configure CloudTrail to send logs to Amazon CloudWatch Logs. Create a CloudWatch Logs metric filter to detect DeleteKey events and trigger an Amazon SNS notification to administrators** is incorrect because this option simply uses AWS CloudTrail and Amazon CloudWatch Logs to monitor and alert specific API operations. However, they do not prevent actions from occurring. Furthermore, this setup is adequate for detection and notification but cannot cancel or reverse the deletion of KMS keys. It serves more as a post-action alert system rather than a preventive measure.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html)
- [https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation.html)
- [https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/monitor-and-remediate-scheduled-deletion-of-aws-kms-keys.html](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/monitor-and-remediate-scheduled-deletion-of-aws-kms-keys.html)

**Check out these Amazon EBS and AWS System Manager Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)
- [https://tutorialsdojo.com/aws-systems-manager/](https://tutorialsdojo.com/aws-systems-manager/)

---

## Câu 6 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
An organization wants to use Amazon Managed Grafana for data visualization tasks. The primary data source is an Amazon Relational Database Service (Amazon RDS) instance. The requirement is to ensure the visualization process is secure and the data is not exposed over the internet.

Which approach should the business take to meet these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Establish a Managed Grafana workspace outside a VPC. Implement a public endpoint for RDS, and assign this endpoint as the data connection within the Grafana workspace.
- [x] **B.** Establish a managed Grafana workspace within an Amazon Virtual Private Cloud, establish a private endpoint for RDS, and subsequently connect this endpoint as the data connection within the Grafana workspace.
- [ ] **C.** Set up a Managed Grafana workspace with a public endpoint. Configure an AWS PrivateLink endpoint to facilitate a secure connection to RDS, and integrate RDS as the data connection in the Grafana workspace.
- [ ] **D.** Configure an Amazon RDS Multi-AZ deployment with an Amazon S3 Inventory as the data connection for visualization in Managed Grafana.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Establish a managed Grafana workspace within an Amazon Virtual Private Cloud, establish a private endpoint for RDS, and subsequently connect this endpoint as the data connection within the Grafana workspace.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Managed Grafana** is a fully managed service that provides powerful data visualization tools. To integrate with an Amazon RDS database securely, ensuring that no data is exposed to the public internet, certain configurations are necessary. Amazon Managed Grafana can operate either within a Virtual Private Cloud (VPC) or with public internet access. However, for secure, private connections, especially when handling sensitive data, deploying within a VPC is advisable.

![Amazon Managed Grafana Workspace](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/Amazon_Managed_Grafana_workspace_14_April_2024.png)

When setting up Amazon Managed Grafana, it’s highly recommended that the workspace be deployed within a Virtual Private Cloud(VPC). This approach offers several benefits. Firstly, it ensures secure connectivity to other AWS services, such as Amazon RDS, by using private endpoints that are inaccessible via the public internet. This approach enhances data security as it prevents exposure to external threats. Secondly, operating within a VPC facilitates a more controlled and secure environment by using AWS networking features like VPC endpoints or PrivateLink. You can establish a private network pathway that further secures data transmission between AWS. This approach is particularly advantageous when handling sensitive data, as it adheres to stringent security protocols.

Hence, the correct answer is: **Establish a managed Grafana workspace within an Amazon Virtual Private Cloud, establish a private endpoint for RDS, and subsequently connect this endpoint as the data connection within the Grafana workspace.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Establish a Managed Grafana workspace outside a VPC. Implement a public endpoint for RDS, and assign this endpoint as the data connection within the Grafana workspace** is incorrect because this would not only expose the RDS database to the public internet but also potentially compromise the security of the data, increasing the risk of unauthorized access and breaches, which directly contradicts the aim of maintaining strict privacy and security protocols.

- The option that says: **Set up a Managed Grafana workspace with a public endpoint. Configure an AWS PrivateLink endpoint to facilitate a secure connection to RDS, and integrate RDS as the data connection in the Grafana workspace** is incorrect. Although AWS PrivateLink provides a private connection, deploying Grafana outside a VPC and relying solely on PrivateLink does not align with the best practices for maximizing security and compliance with the scenario’s requirements.

- The option that says: **Configure an Amazon RDS Multi-AZ deployment with an Amazon S3 Inventory as the data connection for visualization in Managed Grafana** is incorrect because Amazon S3 Inventory is primarily used for listing S3 objects, not for visualizing data from Amazon RDS. Grafana requires a direct connection to an RDS instance, not an S3 Inventory, for secure and real-time data visualization

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/grafana/latest/userguide/what-is-Amazon-Managed-Service-Grafana.html](https://docs.aws.amazon.com/grafana/latest/userguide/what-is-Amazon-Managed-Service-Grafana.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)

**Check out these Amazon Managed Grafana and Amazon VPC Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-managed-grafana/](https://tutorialsdojo.com/amazon-managed-grafana/)
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 7 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A logistics company manages a fleet of delivery trucks equipped with GPS devices that periodically upload location data to an Amazon S3 bucket. Historically, the company used an Amazon EC2 Spot Fleet to process the GPS data in batches every night.

The processing typically takes 3 minutes to complete and requires at least 64 MB of memory. The company’s solutions architect is tasked with modifying the application to process GPS data as it is uploaded to the S3 bucket.

Which modification will achieve this objective in the MOST cost-effective manner?

### Các lựa chọn (Choices)
- [ ] **A.** Set S3 Event Notifications to transmit GPS data files to an Amazon Kinesis Data Stream. Create a Lambda Function to periodically pull and process the data from the stream.
- [ ] **B.** Enable S3 Event Notifications to automatically forward the details of the GPS data file to an Amazon SNS topic. Set up an application in AWS Elastic Beanstalk wherein it processes the data files as they are uploaded after subscribing to the topic.
- [x] **C.** Configure S3 Event Notifications to populate an Amazon SQS queue with details of uploaded GPS data files. Assign an AWS Lambda function to process the data by retrieving the queue's messages.
- [ ] **D.** Configure S3 Event Notifications to send GPS data files to an Amazon SNS topic. Establish an Amazon ECS service that processes data by subscribing to the topic.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Configure S3 Event Notifications to populate an Amazon SQS queue with details of uploaded GPS data files. Assign an AWS Lambda function to process the data by retrieving the queue's messages.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon S3 Event Notifications** are configured to automatically send notifications when specific events happen in an S3 bucket. These events can include creating, deleting, or modifying an object in a bucket. Notifications can be sent to AWS Lambda, Amazon SQS, or Amazon SNS, allowing immediate action based on the event. This feature is critical in event-drive processing scenarios as it allows immediate downstream processing when data becomes available.

 **![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/td-s3-event-notification-05-24-2024.png)**

 **AWS Lambda** is a serverless platform that takes care of all the computing resources required by your code, making it an ideal solution for scenarios where quick, event-driven execution is required. It supports multiple programming languages and charges only for the compute time you consume, making it an extremely cost-effective option for tasks that have variable execution times and frequencies. For instance, you can use Lambda to process images as soon as they are uploaded without incurring any fees when your code is not running.

 **Amazon Simple Queue Service (Amazon SQS)** is a message queuing service that decouples and scales microservices, distributed systems, and serverless applications. By integrating SQS with Lambda via S3 Event Notifications, an architecture can be designed where messages (such as those signaling the upload of new images to an S3 bucket) are queued. This ensures that even if the volume of incoming messages is high, each one is processed reliably and in an orderly manner. AWS Lambda can poll these queues and process messages as they become available, ensuring that all images are processed, regardless of the load.

This combination of S3 Event Notifications, Lambda, and SQS provides a highly scalable, efficient, and cost-effective solution for event-driven data processing with minimal overhead.

Hence, the correct answer is: **Configure S3 Event Notifications to populate an Amazon SQS queue with details of uploaded GPS data files. Assign an AWS Lambda function to process the data by retrieving the queue’s messages.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set S3 Event Notifications to transmit GPS data files to an Amazon Kinesis Data Stream. Create a Lambda Function to periodically pull and process the data from the stream** is incorrect. While this option also uses AWS Lambda, the incorporation of Amazon Kinesis Data Stream is typically more suited for applications that need to handle large streams of data in real time, which adds unnecessary complexity and cost for this specific scenario.

- The option that says: **Configure S3 Event Notifications to send GPS data files to an Amazon SNS topic. Establish an Amazon ECS service that processes data by subscribing to the topic** is incorrect. This option requires setting up an Amazon ECS service, which involves containerizing the application. This process can be more complex and potentially increase costs compared to using Lambda, especially for such lightweight processing tasks.

- The option that says: **Enable S3 Event Notifications to automatically forward the details of the GPS data file to an Amazon SNS topic. Set up an application in AWS Elastic Beanstalk wherein it processes the data files as they are uploaded after subscribing to the topic** is incorrect. While Amazon SNS can trigger AWS services like Lambda, SQS, and email/SMS notifications, it cannot directly invoke custom applications hosted on services like AWS Elastic Beanstalk. For this to work, processing would typically involve polling or directly handling events via AWS Lambda, which could then interact with the application via API calls or other mechanisms.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/EventNotifications.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/EventNotifications.html)
- [https://docs.aws.amazon.com/lambda/latest/dg/with-s3.html](https://docs.aws.amazon.com/lambda/latest/dg/with-s3.html)

**Check out these Amazon S3, AWS Lambda, and Amazon SQS Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)
- [https://tutorialsdojo.com/aws-lambda/](https://tutorialsdojo.com/aws-lambda/)
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 8 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A multinational corporation is in the process of migrating its legacy applications from an on-premises Microsoft Active Directory to AWS. These applications are spread across multiple AWS accounts, which are managed collectively by AWS Organizations. The corporation is seeking a single sign-on (SSO) solution that allows the security team to use their current Active Directory credentials for authentication across all AWS accounts. Additionally, they need to maintain centralized user and group management in their existing on-premises Active Directory.

Which approach should the corporation take to fulfill these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Utilize AWS Directory Service to establish a two-way trust relationship with the corporation's self-managed Active Directory for mutual authentication and access control.
- [ ] **B.** Implement AWS Directory Service's Managed Microsoft AD (Enterprise Edition). Set up the Active Directory as the principal identity provider for AWS IAM Identity Center.
- [ ] **C.** Set up an external identity provider (IdP) on an Amazon EC2 instance. Integrate this IdP with AWS IAM Identity Center as the identity source.
- [x] **D.** Activate AWS IAM Identity Center and establish a two-way forest trust relationship. Link the corporation's Active Directory (AD) with the IAM Identity Center via AWS Managed Microsoft AD.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Activate AWS IAM Identity Center and establish a two-way forest trust relationship. Link the corporation's Active Directory (AD) with the IAM Identity Center via AWS Managed Microsoft AD.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS IAM Identity Center** is a service that simplifies the management of access to AWS accounts and applications. By centralizing user access control, the AWS IAM Identity Center enables users to sign in with a single set of credentials to access multiple AWS accounts and applications. It integrates with external identity providers, including Microsoft Active Directory, allowing organizations to leverage their existing user directories for authentication. This integration facilitates streamlined access management and enhances security by enforcing consistent access policies across all AWS resources and applications. The service supports automatically provisioning user accounts into AWS accounts, simplifying the user management lifecycle and reducing administrative overhead.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWS-Managed-Microsoft-AD-04-13-2024.png)

 **AWS Managed Microsoft AD** is a service that extends Microsoft Active Directory (AD) to the AWS Cloud. It provides a highly available and scalable Active Directory service, enabling AWS resources and directory-aware workloads to use standard AD administration features and tools. By deploying AWS Managed Microsoft AD, organizations can run directory-dependent applications in the AWS Cloud without requiring complex directory synchronization or federation setups. The service supports trust relationships, allowing seamless integration with an existing on-premises Microsoft Active Directory. This capability enables organizations to maintain a unified identity foundation, leveraging their existing investments in Microsoft AD while expanding their infrastructure into the cloud. Through trust relationships, users can access resources across both on-premises environments and AWS using their existing credentials, simplifying access control and improving security posture.

The combination of AWS IAM Identity Center and AWS Managed Microsoft AD through a two-way forest trust relationship offers a powerful solution for managing user access across a multi-account AWS environment while retaining user and group management administration within an existing on-premises Active Directory. This setup allows organizations to extend their identity and access management practices to the cloud, ensuring a consistent and secure user experience.

Hence, the correct answer is: **Activate AWS IAM Identity Center and establish a two-way forest trust relationship. Link the corporation’s Active Directory (AD) with the IAM Identity Center via AWS Managed Microsoft AD.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Implement AWS Directory Service’s Managed Microsoft AD (Enterprise Edition). Set up the Active Directory as the principal identity provider for AWS IAM Identity Center** is incorrect. This option is focused on implementing AWS Managed Microsoft AD and setting it up as the principal identity provider for AWS IAM Identity Center. While it provides a robust solution for utilizing Active Directory in the AWS Cloud, it does not explicitly mention establishing a trust relationship with the on-premises AD. This lack of a direct trust relationship may hinder seamless integration and management of user identities and access controls between the on-premises and cloud environments, limiting the ability to maintain administration within the existing on-premises AD.

- The option that says: **Utilize AWS Directory Service to establish a two-way trust relationship with the corporation’s self-managed Active Directory for mutual authentication and access control** is incorrect. While this option promotes mutual authentication and access control, it primarily facilitates access between on-premises and AWS resources rather than providing a comprehensive solution for managing access across multiple AWS accounts. It lacks integration with the AWS IAM Identity Center, which is critical for centralized access management to AWS accounts and applications, making it less suitable for creating a unified authentication framework across the corporation’s entire AWS environment.

- The option that says: **Set up an external identity provider (IdP) on an Amazon EC2 instance. Integrate this IdP with AWS IAM Identity Center as the identity source** is incorrect. Setting up an external identity provider on an Amazon EC2 instance can only introduce complexity and security concerns. Developing, securing, and maintaining the IdP software running on EC2 requires significant effort, detracting from the simplicity and security benefits of using AWS-managed services. This approach could also lead to latency and reliability issues and diverges from leveraging the corporation’s existing Microsoft Active Directory, potentially complicating user and group management within its on-premises infrastructure.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_setup_trust.html](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_setup_trust.html)
- [https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-ad.html](https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-identity-source-ad.html)

**Check out this AWS Identity and Access Management Cheat Sheet:**
- [https://tutorialsdojo.com/aws-identity-and-access-management-iam/](https://tutorialsdojo.com/aws-identity-and-access-management-iam/)

---

## Câu 9 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company seeks to rearchitect its subsystem to an event-driven design using AWS Lambda. However, the company has some hesitations, being that their workloads are all container-based Java services. The company wants to minimize cold starts and outlier latencies when serving requests in the most cost-effective manner.

Which would meet the requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Configure response streaming for Lambda functions.
- [ ] **B.** Enable Lambda provisioned concurrency.
- [ ] **C.** Set up Lambda layers for dependencies.
- [x] **D.** Enable Lambda SnapStart.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Enable Lambda SnapStart.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Lambda** is a compute service that lets you run code without provisioning or managing servers.

Lambda runs your code on a high-availability compute infrastructure and performs all of the administration of the compute resources, including server and operating system maintenance, capacity provisioning and automatic scaling and logging. With Lambda, all you need to do is supply your code in one of the language runtimes that Lambda supports.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSLambdaSnapstart_08Feb2024.png)

With **Lambda SnapStart** for Java, Lambda initializes functions as new versions are published. Lambda then takes a Firecracker microVM snapshot of the memory and disk state of the initialized execution environment, encrypts the snapshot, and caches it for low-latency access.

In this scenario, leveraging the cached initialized environment in Lambda SnapStart is, in a way, cheating cold starts.

Hence, the correct answer is: **Enable Lambda SnapStart** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Enable Lambda provisioned concurrency** is incorrect. On the aspect of cold start times alone, this may be a viable option. However, running with provisioned concurrency incurs overhead costs that may not be warranted during periods when the function experiences minimal to zero invocations.

- The option that says: **Configure response streaming for Lambda functions** is incorrect. Streaming responses should improve overall time-to-first-byte latencies. However, in cases where startup time drowns all other latencies, as in the case of Java runtimes, this solution is insufficient.

- The option that says: **Set up Lambda layers for dependencies** is incorrect. Using Lambda layers may yield some startup time deduction, but it is more commonly utilized for build/space optimization or dependency reuse.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/lambda/](https://docs.aws.amazon.com/lambda/)
- [https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html](https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html)

**Check out this AWS Lambda Cheat Sheet:**
- [https://tutorialsdojo.com/aws-lambda/](https://tutorialsdojo.com/aws-lambda/)

---

## Câu 10 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company manages an on-premises Server Message Block (SMB) file server, which is used to store large files. These files are typically accessed within the first 10 days after they are created. After this period, the files will no longer be accessed. However, the company requires that they remain accessible with a maximum retrieval time of 12 hours.

Which solution will meet these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Configure user access to Amazon S3. Create an S3 Lifecycle policy to transition the data to S3 Glacier Flexible Retrieval after 10 days.
- [ ] **B.** Set up an AWS DataSync task to transfer data that is older than 10 days from the SMB file server to AWS.
- [ ] **C.** Set up an Amazon FSx File Gateway. Configure an Amazon S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 10 days.
- [x] **D.** Set up an Amazon S3 File Gateway. Configure an S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 10 days.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Set up an Amazon S3 File Gateway. Configure an S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 10 days.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Storage Gateway** is a service that connects an on-premises software appliance with cloud-based storage to provide seamless and secure integration between your on-premises IT environment and the AWS storage infrastructure in the AWS Cloud.

There are four types of storage gateways, each one integrating a different kind of storage in AWS.

– S3 File Gateway

– FSx File Gateway

– Tape Gateway

– Volume Gateway

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSFileGateway_S3_06Feb2024.png)

Of particular note are S3 File Gateway and FSx File Gateway. Although both have the word `file` in their names, they are very different kinds of products. Aside from bridging the cloud and local storage, **S3 File Gateway** also acts as a kind of adapter for S3, an object/blob storage, exposing file-related protocols such as NFS and SMB. **FSx File Gateway** on the other hand is not a single solution but itself also a family of solutions bringing cloud and local storage closer for more native file systems.

 **Amazon Simple Storage Service (Amazon S3)** offers a range of storage classes that you can choose from based on the performance, data access, resiliency, and cost requirements of your workloads. S3 storage classes are purpose-built to provide the lowest cost storage for different access patterns. S3 storage classes are ideal for virtually any use case, including those with demanding performance needs, data lakes, residency requirements, unknown or changing access patterns, or archival storage.

The S3 storage classes include:

– *S3 Intelligent-Tiering* for automatic cost savings for data with unknown or changing access patterns,

–* S3 Standard* for frequently accessed data,

– *S3 Express One Zone* for your most frequently accessed data,

– *S3 Standard-Infrequent Access (S3 Standard-IA)*,

– *S3 One Zone-Infrequent Access (S3 One Zone-IA)* for less frequently accessed data,

– *S3 Glacier Instant Retrieval* for archive data that needs immediate access,

– *S3 Glacier Flexible Retrieval (formerly S3 Glacier)* for rarely accessed long-term data that does not require immediate access,

– and *Amazon S3 Glacier Deep Archive (S3 Glacier Deep Archive)* for long-term archive and digital preservation with retrieval in hours at the lowest cost storage in the cloud.

In this scenario, albeit requiring certain file operations to be carefully considered, S3 File Gateway enables S3 to be used as a file system. S3 Glacier Deep Archive also being the correct storage class option as it is able to fulfill the required 12-hour retrieval time with a shorter 12-hour retrieval time SLA.

Hence, the correct answer is: **Set up an Amazon S3 File Gateway. Configure an S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 10 days.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up an AWS DataSync task to transfer data that is older than 10 days from the SMB file server to AWS** is incorrect because DataSync does not offer a way to filter/discover data to be transferred by their creation date.

- The option that says: **Setup an Amazon FSx File Gateway. Configure an Amazon S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 10 days** is incorrect because FSx File Gateway is a gateway for file system solutions like Windows File Server or OpenZFS and not for S3.

- The option that says: **Configure user access to Amazon S3. Create an S3 Lifecycle policy to transition the data to S3 Glacier Flexible Retrieval after 10 days** is incorrect because S3 is an object/blob storage solution not a file system and as such cannot be used as one, at least not directly. Also, using the Glacier Flexible Retrieval storage class is unnecessary because a more affordable storage class, ie. Glacier Deep Archive, has retrieval time that is less than 24 hours.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/storagegateway/](https://docs.aws.amazon.com/storagegateway/)
- [https://docs.aws.amazon.com/filegateway/latest/filefsxw/file-gateway-fsx-concepts.html](https://docs.aws.amazon.com/filegateway/latest/filefsxw/file-gateway-fsx-concepts.html)
- [https://docs.aws.amazon.com/filegateway/latest/files3/file-gateway-concepts.html](https://docs.aws.amazon.com/filegateway/latest/files3/file-gateway-concepts.html)
- [https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html](https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html)
- [https://aws.amazon.com/s3/storage-classes/](https://aws.amazon.com/s3/storage-classes/)

**Check out this Amazon Storage Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-storage-gateway/](https://tutorialsdojo.com/aws-storage-gateway/)

---

## Câu 11 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
An e-commerce company stores a large amount of sales data in Amazon S3. The company needs to run ad-hoc SQL queries on the data to quickly gain insights into different business metrics.

Which solution will meet these requirements with the LEAST operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Run a Spark job on Amazon EMR Serverless and use Amazon Aurora MySQL as an external Hive Metastore.
- [x] **B.** Run an AWS Glue Crawler to populate tables in the AWS Glue Data Catalog, then query the data using Amazon Athena.
- [ ] **C.** Set up tables in Amazon Redshift. Load data from S3. Use Redshift SQL to query the data.
- [ ] **D.** Create an AWS Glue crawler to crawl the data. Set up an Amazon Managed Service for Apache Flink application to query the data using SQL.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Run an AWS Glue Crawler to populate tables in the AWS Glue Data Catalog, then query the data using Amazon Athena.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Glue** is a serverless data integration service that makes it easy for analytics users to discover, prepare, move, and integrate data from multiple sources. You can use it for analytics, machine learning, and application development. It also includes additional productivity and data ops tooling for authoring, running jobs, and implementing business workflows.

AWS Glue enables you to visually create, run, and monitor extract, transform, and load (ETL) pipelines to load data into your data lakes. and to immediately search and query cataloged data using Amazon Athena, Amazon EMR, and Amazon Redshift Spectrum.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSGlue_Athena_S3_06Feb2024.png)

 **Amazon Athena** is an interactive query service that makes it easy to analyze data directly in Amazon S3 using standard SQL. With minimal setup, you can point Athena at your data stored in Amazon S3 and begin using standard SQL to run ad-hoc queries and get results in seconds.

Amazon Athena also makes it easy to interactively run data analytics using Apache Spark without having to plan for, configure, or manage resources. Running Apache Spark applications on Athena is simply submitting Spark code for processing and receiving the results directly.

In this scenario, AWS Glue handles data crawling, classification, and cataloging. Amazon Athena then uses the metadata created by AWS Glue in the AWS Glue Data Catalog to query and analyze the actual data in S3.

Therefore, the correct answer is: **Run an AWS Glue Crawler to populate tables in the AWS Glue Data Catalog, then query the data using Amazon Athena.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Run a Spark job on Amazon EMR Serverless and use Amazon Aurora MySQL as an external Hive Metastore** is incorrect. This option involves more operational overhead due to managing the configuration of an external Hive Metastore. You can simply crawl the data and use the AWS Glue Data Catalog as your metastore. Amazon Athena has direct integration with the AWS Glue Data Catalog, allowing for an easier way to run ad-hoc queries.

- The option that says: **Set up tables in Amazon Redshift. Load data from S3. Use Redshift SQL to query the data** is incorrect. Loading data from an object storage such as S3 to a data warehouse solution such as Amazon Redshift is a classic example of an Extract-Transform-Load (ETL) workflow and requires a non-trivial engineering effort including, but not limited to, understanding the structure of the data and mapping that structure into a table schema.

- The option that says: **Create an AWS Glue crawler to crawl the data. Set up an Amazon Managed Service for Apache Flink application to query the data using SQL** is incorrect because Amazon Managed Service for Apache Flink works mostly on data streams from sources such as Amazon Kinesis Data Streams and Amazon MSK, rather than on static data sources like Amazon S3.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/glue/latest/dg/components-key-concepts.html](https://docs.aws.amazon.com/glue/latest/dg/components-key-concepts.html)
- [https://docs.aws.amazon.com/athena/latest/ug/what-is.html](https://docs.aws.amazon.com/athena/latest/ug/what-is.html)
- [https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-what-is-emr.html](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-what-is-emr.html)

**Check out this AWS Glue Cheat Sheet:**
- [https://tutorialsdojo.com/aws-glue/](https://tutorialsdojo.com/aws-glue/)

**Check out this Amazon Athena Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-athena/](https://tutorialsdojo.com/amazon-athena/)

---

## Câu 12 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A global enterprise leverages AWS to manage its operations. The organization’s application stores sensitive information across multiple Amazon S3 buckets distributed across various AWS Regions. Every day, the organization handles thousands of objects in these S3 buckets. The organization needs a solution to determine all S3 buckets that do not have versioning enabled.

Which approach will satisfy this requirement?

### Các lựa chọn (Choices)
- [x] **A.** Utilize Amazon S3 Storage Lens to detect all S3 buckets that do not have versioning enabled.
- [ ] **B.** Create an Amazon S3 Multi-Region Access Point to aggregate and analyze the versioning status of S3 buckets across multiple regions.
- [ ] **C.** Implement an AWS CloudTrail event to automatically determine all S3 buckets without versioning enabled.
- [ ] **D.** Set up an IAM Access Analyzer to identify all S3 buckets that do not have versioning enabled by using an external access analyzer to analyze bucket policies.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Utilize Amazon S3 Storage Lens to detect all S3 buckets that do not have versioning enabled.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon S3 Storage Lens** offers a robust analytics solution that provides comprehensive visibility into object storage usage and activity across an organization. Through an interactive dashboard on the S3 Management Console, users can access metrics like storage usage, object counts, and versioning status, along with actionable recommendations for cost optimization and security improvement. Data can also be exported for deeper analysis using tools such as Amazon QuickSight, Athena, or Redshift.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/Amazon_S3_Storage_Lens_4June2024.png)

This tool simplifies storage management by providing detailed insights into storage configurations, categorized by data protection and cost efficiency. Users can explore specific accounts, regions, buckets, or prefixes to understand storage trends and make informed decisions. This tool can identify all S3 buckets that do not have versioning enabled, offering a comprehensive view of data protection status across regions. With both a free tier and an advanced tier, S3 Storage Lens is invaluable for enterprises aiming to optimize storage practices and ensure compliance.

Hence, the correct answer is: **Utilize Amazon S3 Storage Lens to detect all S3 buckets that do not have versioning enabled.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: ** Implement an AWS CloudTrail event to automatically determine all S3 buckets without versioning enabled** is incorrect because CloudTrail only tracks API calls and logs activity but does not continuously monitor the configuration state of resources, such as the versioning status of S3 buckets across multiple Regions. CloudTrail is more suited for auditing and compliance purposes rather than ongoing configuration management.

- The option that says: **Set up an IAM Access Analyzer to identify all S3 buckets that do not have versioning enabled by using an external access analyzer to analyze bucket policies** is incorrect because IAM Access Analyzer helps simply identify resources shared with an external entity but is not designed to report on the versioning status of S3 buckets.

- The option that says: **Create an Amazon S3 Multi-Region Access Point to aggregate and analyze the versioning status of S3 buckets across multiple regions** is incorrect. This option is intended to simplify data access across multiple Regions but do not provide the analysis capabilities required to report on the versioning status of S3 buckets. It’s more focused on enhancing access performance and availability rather than configuration analysis.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/blogs/aws/s3-storage-lens/](https://aws.amazon.com/blogs/aws/s3-storage-lens/)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_basics_metrics_recommendations.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_basics_metrics_recommendations.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 13 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
An organization operates a high-traffic static website hosted on Amazon S3, which is distributed via Amazon CloudFront. The current CloudFront distribution has a default Time-to-Live (TTL) of 10 seconds, leading to no caching. The company aims to implement caching to enhance website performance while ensuring that outdated content is not served for more than a few minutes post-deployment.

Which caching strategies should a solutions architect apply to achieve these objectives?

### Các lựa chọn (Choices)
- [ ] **A.** Deploy an AWS Lambda@Edge function to insert an Expires header into HTTP responses. Set this function to trigger on viewer response.
- [ ] **B.** Set up Amazon S3 lifecycle policies to automatically delete objects older than 7 days, ensuring that CloudFront edge caches are regularly purged of stale content.
- [x] **C.** Set the CloudFront default TTL to 4 minutes and implement a Cache-Control private directive on objects stored within Amazon S3.
- [ ] **D.** Apply a default TTL of 4 minutes on the S3 bucket.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Set the CloudFront default TTL to 4 minutes and implement a Cache-Control private directive on objects stored within Amazon S3.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon CloudFront** is a global content delivery network (CDN) service provided by AWS, designed to accelerate the delivery of static and dynamic web content to users worldwide with low latency and high transfer speeds. It works by caching content at edge locations distributed globally, reducing the distance between users and content, which in turn improves the overall performance and responsiveness of websites and applications. CloudFront integrates seamlessly with other AWS services like Amazon S3, enabling organizations to deliver content more efficiently while reducing the load on their origin servers.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/Amazon_CloudFront_Policies_4June2024.png)

Setting the CloudFront default TTL (Time-to-Live) to 4 minutes and implementing a Cache-Control private directive on objects stored within Amazon S3 leverages CloudFront’s caching capabilities to enhance website performance. With the TTL set to 4 minutes, CloudFront caches content at edge locations for up to 4 minutes before checking the origin (S3) for updates. This reduces latency for subsequent requests from users accessing the same content within the caching period. Additionally, implementing the Cache-Control private directive on S3 objects ensures that content is cached by CloudFront and individual user browsers but not by shared caches, thereby maintaining control over content freshness. As a result, these measures optimize the delivery of static content while ensuring that updated content is quickly served to users, enhancing both the performance and reliability of the website or application globally.

Hence, the correct answer is: **Set the CloudFront default TTL to 4 minutes and implement a Cache-Control private directive on objects stored within Amazon S3.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Apply a default TTL of 4 minutes on the S3 bucket** is incorrect because S3 does not support setting a default TTL directly on the bucket. Moreover, TTL settings are managed via headers that CloudFront uses.

- The option that says: **Deploy an AWS Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) function to insert an Expires header into HTTP responses. Set this function to trigger on viewer response** is incorrect because this approach primarily allows customization of caching behavior through Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) and also introduces additional complexity. While functional, this option may be overly complex for the given requirements.

- The option that says: **Set up Amazon S3 lifecycle policies to automatically delete objects older than 7 days, ensuring that CloudFront edge caches are regularly purged of stale content** is incorrect because CloudFront only manages its own cache independently of S3 lifecycle policies. In addition, S3 lifecycle policies do not directly manage CloudFront’s cache duration.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
- [https://docs.aws.amazon.com/whitepapers/latest/amazon-cloudfront-media/cloudfront-configuration-best-practices.html](https://docs.aws.amazon.com/whitepapers/latest/amazon-cloudfront-media/cloudfront-configuration-best-practices.html)

**Check out this Amazon CloudFront Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-cloudfront/](https://tutorialsdojo.com/amazon-cloudfront/)

---

## Câu 14 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company operates a three-tier application with all its components hosted on AWS, except for the data layer. This data layer consists of a MySQL-compatible database located on-premises, connected to AWS through a Site-to-Site VPN. The database’s memory consumption ranges from 2 to 16 GiB.

On the other hand, the application experiences unpredictable traffic patterns, including spikes and periods of zero activity, which translates to irregular load on the database. The company wants to replace the on-premises database with a managed service that can automatically adapt to varying demands through serverless capacity scaling.

Which option will meet these requirements?

### Các lựa chọn (Choices)
- [x] **A.** Configure an Amazon Aurora Serverless v2 database with a minimum capacity of 1 and a maximum of 8 Aurora capacity units (ACUs).
- [ ] **B.** Set up an Amazon DynamoDB table with auto-scaling enabled. Configure the table with a minimum of 2 and a maximum of 16 capacity units.
- [ ] **C.** Set up an Amazon RDS for the MySQL database with 4 gigabytes of memory.
- [ ] **D.** Set up an Amazon Aurora database with a memory-optimized DB instance class type.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Configure an Amazon Aurora Serverless v2 database with a minimum capacity of 1 and a maximum of 8 Aurora capacity units (ACUs).

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Aurora** is a relational database service that combines the speed and availability of high-end commercial databases with the simplicity and cost-effectiveness of open-source databases. Aurora is fully compatible with MySQL and PostgreSQL, allowing existing applications and tools to run without requiring modification.

![Amazon Aurora Serverless v2](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AmazonAuroraServerlessv2_09Feb2024.png)

With **Aurora Serverless V2** , you can mix and match provisioned capacity writer/reader instances with serverless writer/reader that match your workloads. Taking an example of a read-heavy but consistent workload with erratic writes, the cluster can be configured to include provisioned reader instance/s and a serverless writer.

In this scenario, due to the unpredictable traffic pattern and the fact that only the range of memory consumption is known, it is best to simply allocate the corresponding number of ACUs and let Aurora Serverless handle the scaling up/down. The unit of measure for Aurora Serverless v2 is the Aurora capacity unit (ACU). Each ACU includes about 2 gibibytes (GiB) of memory, along with the necessary CPU and networking. By setting a range with a minimum of 1 ACU and a maximum of 8 ACUs, you can ensure that the database scales efficiently to meet demand, from minimal to peak usage.

Hence, the correct answer is: **Configure an Amazon Aurora Serverless v2 database with a minimum capacity of 1 and a maximum of 8 Aurora capacity units (ACUs).**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up an Amazon DynamoDB table with auto-scaling enabled. Configure the table with a minimum of 2 and a maximum of 16 capacity units** is incorrect. Although DynamoDB fits the requirements of a serverless solution that can scale together with your application, DynamoDB is not a MySQL-compatible database. It is a NoSQL database service, which would require significant changes to the application if it’s currently designed for a MySQL-compatible database.

- The option that says: **Set up an Amazon Aurora database with a memory-optimized DB instance class type** is incorrect. While Amazon Aurora is a MySQL-compatible database that can scale storage costs with usage, a provisioned DB instance is fixed and will not scale up/down with usage. This will simply lead to the same issue of over-provisioning during low activity periods or under-provisioning during spikes.

- The option that says: **Set up an Amazon RDS for the MySQL database with 4 gigabytes of memory** is incorrect. With RDS for MySQL, the compute and memory capacity are fixed. While it does satisfy the requirement for a managed service, it lacks the capability to automatically scale in response to application usage, making it primarily less ideal for handling unpredictable traffic patterns cost-effectively.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2.html)

**Check out this Amazon Aurora vs Amazon RDS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-aurora-vs-amazon-rds/](https://tutorialsdojo.com/amazon-aurora-vs-amazon-rds/)

---

## Câu 15 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A startup wants to improve service availability and fault tolerance by distributing incoming traffic across multiple servers. The company uses Auto Scaling Group (ASG) of Amazon EC2 instances in the ` us-east-1` region. They plan to deploy the same setup in the `us-west-2` region.

The company wants to automatically redirect traffic away from unhealthy instances, irrespective of their region.

Which of the following policies fulfills the company’s needs?

### Các lựa chọn (Choices)
- [ ] **A.** Use Amazon Route 53's geoproximity routing policy to distribute incoming traffic to the other region.
- [x] **B.** Configure Route 53 and opt for a multivalue answer routing policy.
- [ ] **C.** Set up an Application Load Balancer in the us-east-1 region and configure it with a target group containing EC2 instances from both regions, identified by their instance IDs.
- [ ] **D.** Launch an Application Load Balancer within the us-east-1 region. Configure the target group to include the IP addresses of Amazon EC2 instances across the two regions.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Configure Route 53 and opt for a multivalue answer routing policy.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Route 53’s multivalue answer routing policy** offers a simple solution to improve your web services’ availability and fault tolerance. This policy allows Route 53 to respond to DNS queries with multiple resource records for a single domain, such as IP addresses for web servers. This enables the distribution of incoming traffic across several resources, similar to a load balancer at the DNS level. The key distinction is that it can include up to eight healthy resources in response to each DNS query, spreading the load and potentially reducing the chance of any single point of failure.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/configuring-multivalue-routing-policy.png)

The multivalue answer routing policy ensures high service availability and a smooth user experience. Route 53 automatically checks the health of your resources and only includes healthy resources in the DNS response. This prevents traffic from being directed to unhealthy or downed servers. Health checks are conducted periodically, and if a resource becomes unhealthy, it is promptly removed from the pool of responses until it is deemed healthy again.

This policy is beneficial for applications that require high availability and resilience against individual instance failures without the complexity of managing cross-region load-balancing solutions. It’s easy to implement, requiring no additional infrastructure changes beyond the DNS configuration and health checks in Route 53. This makes it an appealing option for startups and enterprises that want to ensure the robustness and reliability of their web services across geographic regions or within a single region but across multiple resources.

Hence, the correct answer is: **Configure Route 53 and opt for a multivalue answer routing policy.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use Amazon Route 53’s geoproximity routing policy to distribute incoming traffic to the other region** is incorrect. Geoproximity routing policy is primarily designed to route traffic based on geographic location, which could help distribute traffic across regions. However, it doesn’t inherently focus on health checks or seamlessly redirect traffic away from unhealthy instances. This policy is more about geographical distribution than about ensuring high availability and resilience against individual instance failures.

- The option that says: **Set up an Application Load Balancer in the us-east-1 region and configure it with a target group containing EC2 instances from both regions, identified by their instance IDs** is incorrect. Application Load Balancers (ALBs) are regional services that only route traffic within the same region. Although you can route traffic to multiple back-end instances, ALBs do not support cross-region load balancing directly through instance IDs. Thus, ALBs can’t manage instances outside the region of deployment without additional, complex configurations like setting up a global accelerator or using Route 53 in a more intricate setup.

- The option that says: **Launch an Application Load Balancer within the us-east-1 region. Configure the target group to include the IP addresses of Amazon EC2 instances across the two regions** is incorrect. While you can specify IP addresses as targets in an ALB’s target group, these IPs must belong to resources within the load balancer’s region. It does not support cross-region traffic distribution in the manner described, making it ineffective for the goal of distributing incoming traffic across resources in both the us-east-1 and us-west-2 regions.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-multivalue.html](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-multivalue.html)
- [https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)

**Check out this Amazon Route 53 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-route-53/](https://tutorialsdojo.com/amazon-route-53/)

---

## Câu 16 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company is developing a scheduled job that copies a backup of its virtual machines (VMs) to an Amazon S3 bucket. To avoid tampering, these backups must be protected against overwrites. They should also be retained for 20 days before being automatically deleted.

Which combination of actions will meet these requirements? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Make a new S3 bucket and enable Versioning.
- [ ] **B.** Make a new S3 bucket and enable S3 Object Lock. Set a 20-day legal hold.
- [ ] **C.** Create an automated solution that tags objects to be covered by a 20-day retention policy.
- [x] **D.** Make a new S3 bucket and enable S3 Object Lock. Set a 20-day retention period.
- [x] **E.** Set the objects to expire after 20 days using an S3 Lifecycle policy.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D, E**
> - **D.** Make a new S3 bucket and enable S3 Object Lock. Set a 20-day retention period.
> - **E.** Set the objects to expire after 20 days using an S3 Lifecycle policy.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Simple Storage Service (Amazon S3)** is an object storage service that offers industry-leading scalability, data availability, security, and performance.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AmazonS3_waterfall_transition_05Feb2024.png)

With *lifecycle rules*, objects can be managed so that they are stored cost-effectively throughout their lifecycle. An *S3 Lifecycle configuration* is a set of rules that define actions that Amazon S3 applies to a group of objects.

There are two types of actions:

*Transition* actions — define when objects transition to another storage class. They are usually leveraged to save costs when object storage shifts to less strict requirements, eg. less availability guarantee, higher retrieval latency, etc.

*Expiration* actions — define when objects can be deleted by Amazon S3 on your behalf. The exact time for when objects are actually deleted is not guaranteed but storage cost is incurred only up to set expiration.

To ensure backups are protected against overwrites for 20 days, the company should create a new S3 bucket with Object Lock enabled. S3 Object Lock safeguards Amazon S3 objects from being deleted or overwritten for a fixed amount of time or indefinitely. By setting a retention period of 20 days, the objects will be “locked” and remain immutable during this time. Additionally, the company can implement an S3 Lifecycle policy to automatically delete the objects after the 20-day period.

Hence, the following options are correct:

 **– Make a new S3 bucket and enable S3 Object Lock. Set a 20-day retention period.**

 **– Set the objects to expire after 20 days using an S3 Lifecycle policy.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Make a new S3 bucket and enable Versioning** is incorrect. Although S3 Object Lock only works on versioning-enabled buckets, you don’t have to explicitly turn on Versioning. Object versioning is implicitly enabled when you enable S3 Object on a new bucket.

- The option that says: **Create an automated solution that tags objects to be covered by a 20-day retention policy** is incorrect. Tagging objects for a retention policy is unnecessary because all backups stored in the S3 bucket are meant to be protected. There’s no need to selectively tag them since they all require the same level of protection through S3 Object Lock.

- The option that says: **Make a new S3 bucket and enable S3 Object Lock. Set a 20-day legal hold** is incorrect. While this does protect the backups from tampering, a legal hold is not automatically removed after a specific period like a retention period is. This would not ensure the backups are automatically deleted after 20 days.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 17 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company uses Amazon EC2 instances, Amazon RDS, and Amazon S3 to run its application. During a recent review of its infrastructure costs, the company noticed unusual spending patterns.

The company wants to monitor usage costs and send alerts to the appropriate departments when there is unusual spending from its workload.

Which option will meet these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Enable Amazon CloudWatch to monitor costs and detect unusual spending.
- [ ] **B.** Use AWS Cost Explorer and enable multi-year data at monthly granularity.
- [ ] **C.** Create a zero spend budget template in AWS Budgets.
- [x] **D.** In the AWS Billing and Cost Management console, create a cost monitor using AWS Cost Anomaly Detection.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** In the AWS Billing and Cost Management console, create a cost monitor using AWS Cost Anomaly Detection.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Cost Anomaly Detection** is an AWS Cost Management feature. This feature uses machine learning models to detect and alert on anomalous spend patterns in your deployed AWS services.

![AWS Cost Anomaly Detection](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSCostAnomalyDetection_08Feb2024.png)

Using AWS Cost Anomaly Detection includes the following benefits:

– receive alerts individually in aggregated reports either in an email message or an Amazon SNS topic.

– evaluate spending patterns using machine learning methods to minimize false positive alerts. For example, you can evaluate weekly or monthly seasonality and natural growth.

– investigate the root cause of the anomaly, such as the AWS account, service, Region, or usage type that’s driving the cost increase.

– configure how to evaluate your costs. Choose whether you want to analyze all of your AWS services independently or analyze specific member accounts, cost allocation tags, or cost categories.

Hence, the correct answer is: **In the AWS Billing and Cost Management console, create a cost monitor using AWS Cost Anomaly Detection.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create a zero spend budget template in AWS Budgets** is incorrect because the zero spend budget template merely gives you an alert when your spending exceeds AWS Free Tier limits. However, it only provides basic alerts and lacks advanced monitoring or anomaly detection.

- The option that says: **Use AWS Cost Explorer and enable multi-year data at monthly granularity** is incorrect. This solution would help in analyzing spending over time, but it primarily won’t actively alert you to anomalies or unusual spending patterns.

- The option that says: **Enable Amazon CloudWatch to monitor costs and detect unusual spending** is incorrect. Although the Amazon Cloudwatch can be configured to alert based on the `EstimateCharges` metric, it has no capability of determining whether breaches of a set limit are due to unusual spending or normal/expected increases.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/cost-management/latest/userguide/manage-ad.html](https://docs.aws.amazon.com/cost-management/latest/userguide/manage-ad.html)
- [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/gs_monitor_estimated_charges_with_cloudwatch.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/gs_monitor_estimated_charges_with_cloudwatch.html)

**Check out this AWS Billing and Cost Management Cheat Sheet:**
- [https://tutorialsdojo.com/aws-billing-and-cost-management/](https://tutorialsdojo.com/aws-billing-and-cost-management/)

---

## Câu 18 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
An animation company conducts storyboard experiments using a Linux-based rendering engine and an editing application running on Windows. The rendering engine saves its output on a Network File System (NFS) share, while the editing application uses a Server Message Block (SMB) file system.

To share files between these applications, the company synchronizes data across the file systems. This method doubles their storage needs and causes difficulty in data management. The company wants to migrate its environment to AWS to solve these issues.

How can the company meet the requirements with the LEAST amount of changes?

### Các lựa chọn (Choices)
- [ ] **A.** Use AWS Lambda for both applications. Configure both applications to save data in an Amazon SQS queue.
- [x] **B.** Use Linux Amazon EC2 instances for the rendering engine and Windows EC2 instances for the editing application. Set up Amazon FSx for NetApp ONTAP for storage.
- [ ] **C.** Use Linux Amazon EC2 instances for the rendering engine and Windows EC2 instances for the editing application. Set up Amazon Elastic File System (EFS) and Amazon FSx for Windows File Server for storage.
- [ ] **D.** Use Amazon Elastic Container Service (ECS) for both applications. Set up Amazon FSx for Lustre for storage.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use Linux Amazon EC2 instances for the rendering engine and Windows EC2 instances for the editing application. Set up Amazon FSx for NetApp ONTAP for storage.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon FSx** is a family of file system solutions that makes it easy and cost effective to launch, run, and scale feature-rich, high-performance file systems in the cloud. It supports a wide range of workloads with its reliability, security, scalability, and broad set of capabilities.

Sample use cases:

– migrating workloads to the cloud

– machine learning, analytics, and HPC applications

– simplifying availability requirements

– media & entertainment workloads

Amazon FSx lets you choose between four widely used file systems: **Lustre** , **NetApp ONTAP** , **OpenZFS** , and **Windows File Server** . This choice is typically based on your familiarity with a given file system or on matching the file system’s feature sets, performance profiles, and data management capabilities to the requirements of your workload.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSFSxNetappONTAP_SMB_NFS_06Mar2024.png)

In this scenario, the company can use Amazon FSx for NetApp ONTAP as a unified storage for both the rendering and editing applications. This would enable both applications to continue communicating with the storage using their respective protocols (NFS and SMB). Consolidating storage with FSx for NetApp ONTAP eliminates the complexity of managing separate storage systems and eradicates the need for data synchronization.

Hence, the correct answer is: **Use Linux Amazon EC2 instances for the rendering engine and Windows EC2 instances for the editing application. Set up Amazon FSx for NetApp ONTAP for storage.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use Amazon Elastic Container Service (ECS) for both applications. Set up Amazon FSx for Lustre for storage** is incorrect because using ECS would require some code change to containerize the workloads. Moreover, Amazon FSx for Lustre only works for Linux-based instances and is not compatible with Windows. Hence, you would have to reconfigure the editing application to work with a Lustre file system.

- The option that says: **Use AWS Lambda for both applications. Configure both applications to save data in an Amazon SQS queue** is incorrect because, unlike the rendering engine, the editing application cannot be modeled as an event-driven system, so using AWS Lambda as a single solution for both workloads is not viable. Additionally, SQS is not suitable for data sharing between applications due to its design and intended use case. SQS operates on a message-based model where messages are sent to a queue, stored temporarily, and then consumed by another component. Building around it as storage for both applications is impractical and would require extensive customization and workarounds.

- The option that says: **Use Linux Amazon EC2 instances for the rendering engine and Windows EC2 instances for the editing application. Set up Amazon Elastic File System (EFS) and Amazon FSx for Windows File Server for storage** is incorrect. This approach would still involve managing two separate storage systems for NFS and SMB, which is no different than the original setup. Also, it would require developing a solution to enable the applications to access each other’s output.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/fsx/](https://aws.amazon.com/fsx/)
- [https://aws.amazon.com/fsx/netapp-ontap/](https://aws.amazon.com/fsx/netapp-ontap/)
- [https://docs.aws.amazon.com/AmazonECS/latest/developerguide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide)

**Check out this Amazon FSx Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-fsx/](https://tutorialsdojo.com/amazon-fsx/)

---

## Câu 19 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
The CTO of an e-commerce company wants to implement a continuous integration (CI) pipeline using AWS CodePipeline. The CTO wants to design the pipeline so that it automatically triggers whenever developers push code to the company’s private GitHub repository. The CTO also wants to ensure that the integration between AWS and GitHub is secure and auditable out of the box.

What is the easiest way to trigger CodePipeline automatically upon a code commit while satisfying security and auditability requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Use Amazon EventBridge to poll the GitHub repository periodically and trigger the pipeline. Use AWS CloudTrail logs for monitoring and auditing.
- [ ] **B.** Set up Amazon API Gateway to expose a webhook endpoint that GitHub can call. Configure API Gateway to trigger CodePipeline via AWS Lambda. In the Lambda source code, invoke Amazon CloudWatch Logs APIs to perform logging.
- [x] **C.** Configure AWS CodeConnections to integrate a private GitHub repository with CodePipeline. Use AWS CloudTrail logs for monitoring and auditing.
- [ ] **D.** Deploy a GitHub webhook listener application written in Python on AWS Elastic Beanstalk, and configure it to call CodePipeline. Ensure that the application writes logs to Amazon CloudWatch Logs.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Configure AWS CodeConnections to integrate a private GitHub repository with CodePipeline. Use AWS CloudTrail logs for monitoring and auditing.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
AWS CodeConnections, formerly AWS CodeStar Connections, is designed to securely connect AWS services, such as CodePipeline, with third-party source control systems like GitHub, Bitbucket, and GitLab. It allows the automatic triggering of pipelines based on events such as code push and pull requests. All communications between AWS and the source control system are encrypted using Transport Layer Security (TLS 1.0 or later). All CodeConnections API calls are logged automatically via AWS CloudTrail, ensuring the integration is auditable.

![AWS CodeConnections](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/aws-codeconnections-2025Apr28.png)

Hence, the correct answer is: **Configure AWS CodeConnections to integrate a private GitHub repository with CodePipeline. Use AWS CloudTrail logs for monitoring and auditing.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use Amazon EventBridge to poll the GitHub repository periodically and trigger the pipeline. Use AWS CloudTrail logs for monitoring and auditing** is incorrect. EventBridge is a serverless event bus that can schedule periodic events using Scheduled Rules. Still, it lacks built-in GitHub integration, requiring a custom Lambda or third-party bridge for polling. Since we prefer the simplest solution, EventBridge is a weak candidate. Additionally, polling only triggers on a fixed schedule and may miss commits between intervals, making it unreliable for detecting code changes.

- The option that says: **Set up Amazon API Gateway to expose a webhook endpoint that GitHub can call. Configure API Gateway to trigger CodePipeline via AWS Lambda. In the Lambda source code, invoke Amazon CloudWatch Logs APIs to perform logging** is incorrect. This solution, in fact, is technically workable. It uses event-driven webhooks and thus does not have the shortcomings of a polling solution that misses code commits between intervals. However, this method is not only manual but also less secure. Again, we are looking for the easiest solution, and if one exists, this option needs to be eliminated.

- The option that says: **Deploy a GitHub webhook listener application written in Python on AWS Elastic Beanstalk, and configure it to call CodePipeline. Ensure that the application writes logs to Amazon CloudWatch Logs** is incorrect. Like the option above, this solution is non-polling and can work. However, the setup is needlessly manual and complicated, and it requires effort not only to build but also to maintain. As we search for the easiest solution, we eliminate this option once a more straightforward route is available.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/about-aws/whats-new/2024/03/aws-codeconnections-formerly-codestar-connections/](https://aws.amazon.com/about-aws/whats-new/2024/03/aws-codeconnections-formerly-codestar-connections/)
- [https://docs.aws.amazon.com/codepipeline/latest/userguide/connections-github.html](https://docs.aws.amazon.com/codepipeline/latest/userguide/connections-github.html)
- [https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)

**Check out this AWS CodePipeline Cheat Sheet:**
- [https://tutorialsdojo.com/aws-codepipeline/](https://tutorialsdojo.com/aws-codepipeline/)

---

## Câu 20 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company is refactoring an application’s architecture to leverage an AWS Lambda function and Amazon API Gateway. The application receives 5 KB JSON blobs, processes it, and stores the result to an Amazon Aurora database. The application only needs to acknowledge when it has accepted a request, not when it has processed it.

Initially, the application failed to meet acceptance criteria due to numerous throttling errors during data processing. To resolve this issue, the company had to raise the default number of Lambda concurrent executions several times.

How can a solutions architect improve the scalability of the infrastructure to reduce throttling errors?

### Các lựa chọn (Choices)
- [ ] **A.** Rewrite the Lambda function code into a Go application that runs on an Amazon EC2 instance. Use native Go drivers for database connection.
- [ ] **B.** Migrate the data store from Aurora to Amazon DynamoDB. Set up a DynamoDB Accelerator (DAX) cluster between the application and the DynamoDB database. Configure the read capacity units (RCUs) of the DynamoDB table to match the expected read throughput. Configure the application to route DynamoDB requests to the DAX cluster using the DAX client SDK.
- [ ] **C.** Rewrite the Lambda function code into 2 functions – one function to receive the information and another function to persist the information into the database. Use Amazon Simple Notification Service (Amazon SNS) to signal available work to the second Lambda function.
- [x] **D.** Rewrite the Lambda function code into 2 functions – one function to receive the information and another function to persist the information into the database. Use Amazon Simple Queue Service (Amazon SQS) to signal available work to the second Lambda function.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Rewrite the Lambda function code into 2 functions – one function to receive the information and another function to persist the information into the database. Use Amazon Simple Queue Service (Amazon SQS) to signal available work to the second Lambda function.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Simple Queue Service (Amazon SQS)** offers a secure, durable, and available hosted queue that lets you integrate and decouple distributed software systems and components. Amazon SQS offers common constructs such as dead-letter queues and cost allocation tags.

Amazon SQS provides a generic web services API that you can access using any programming language supported by AWS SDK. A single subscriber typically processes messages in the queue. This does not necessarily mean a single consumer consuming the whole queue serially. For example, there could be concurrent executions of an AWS Lambda function, each consuming a different queue item. The important thing is that queue items are usually consumed only once. In some use cases, several subscribers need to act on the same item; Amazon SQS and Amazon SNS are often used together to create a fanout messaging application in such scenarios.

![AWS Lambda Producer SQS Consumer](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSLambda_producer_SQS_consumer_10Feb2024.png)

 **Amazon SNS** is a publish-subscribe service that provides message delivery from publishers (also known as producers) to multiple subscriber endpoints(also known as consumers). Publishers communicate asynchronously with subscribers by sending messages to a topic, which is a logical access point and communication channel. Subscribers can subscribe to an Amazon SNS topic and receive published messages using a supported endpoint type, such as Amazon Data Firehose, Amazon SQS, Lambda, HTTP, email, mobile push notifications, and mobile text messages (SMS). Amazon SNS acts as a message router and delivers messages to subscribers in real-time. If a subscriber is not available at the time of message publication, the message is not stored for later retrieval.

In this scenario, we can split the application’s logic into two Lambda functions: one for receiving requests and another for processing them, with Amazon SQS serving as a bridge between them. This setup allows SQS to act as a buffer, holding incoming data when the processing function is busy. It effectively manages traffic spikes, ensuring no data is lost during periods of high demand. You can create an event source mapping for the SQS queue to invoke the processing Lambda function. If the function fails due to throttling, Lambda will implement a back-off strategy to retry the function, reducing the occurrence of throttling errors.

Hence, the correct answer is: **Rewrite the Lambda function code into 2 functions – one function to receive the information and another function to persist the information into the database. Use Amazon Simple Queue Service (Amazon SQS) to signal available work to the second Lambda function.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Rewrite the Lambda function code into a Go application that runs on an Amazon EC2 instance. Use native Go drivers for database connection** is incorrect. This approach would only shift the application from a serverless architecture to a server-based one, which introduces a different set of scalability and management challenges. While Go is known for its efficient performance and concurrency support, merely porting the application’s logic to Go entails significant development efforts with minimal returns.

- The option that says: **Migrate the data store from Aurora to Amazon DynamoDB. Set up a DynamoDB Accelerator (DAX) cluster between the application and the DynamoDB database. Configure the read capacity units (RCUs) of the DynamoDB table to match the expected read throughput. Configure the application to route DynamoDB requests to the DAX cluster using the DAX client SDK** is incorrect because the root cause of the throttling errors is the high number of concurrent Lambda executions, not database read performance. DAX is an in-memory cache designed to accelerate DynamoDB read operations, and provisioning RCUs only controls read throughput capacity; it does not address the Lambda concurrency bottleneck causing the throttling issue.

- The option that says: **Rewrite the Lambda function code into 2 functions – one function to receive the information and another function to persist the information into the database. Use Amazon Simple Notification Service (Amazon SNS) to signal available work to the second Lambda function** is incorrect because SNS is generally used to do fanout / one-to-many push-based communication. Meanwhile, the information to be received by the second function has to be processed only once and only received when the receiver can process it.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AWSSimpleQueueService/](https://docs.aws.amazon.com/AWSSimpleQueueService/)
- [https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.html](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 21 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company operates a data lake on Amazon S3, integrating data in Apache Parquet format from various sources. To enhance the data for analysis, the company employs multiple transformation steps. These include filtering anomalies, standardizing date and time formats, and generating analytical aggregates. The transformed data is stored in S3 buckets for access by data analysts.

The company seeks a pre-built, non-coding solution for these data transformations. This solution must include data lineage and profiling features. Additionally, the data transformation steps must be transparent and shareable across the entire organization.

What is the most suitable AWS solution to fulfill these specific needs?

### Các lựa chọn (Choices)
- [ ] **A.** Leverage AWS Glue Studio's visual interface for data transformation. Use Amazon Redshift ML to generate predictive aggregates from the transformed data. Distribute the transformation process across the organization by utilizing Glue jobs.
- [x] **B.** Utilize AWS Glue DataBrew for the data transformation tasks. Make the transformation steps available to employees through the use of DataBrew recipes.
- [ ] **C.** Query data using Amazon Athena to execute the data transformation using SQL queries. Facilitate the sharing of these Athena SQL queries among employees.
- [ ] **D.** Set up Amazon EMR to manage data transformation. Document and share the transformation steps with employees through EMR Studio notebooks.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Utilize AWS Glue DataBrew for the data transformation tasks. Make the transformation steps available to employees through the use of DataBrew recipes.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Glue DataBrew** is essentially a no-code tool that streamlines the process of preparing data for analysis and machine learning. It’s especially valuable for data professionals looking to clean, normalize, and transform their data more efficiently. One of the standout features of DataBrew is its ability to cut down data preparation time by up to 80% compared to traditional manual methods. This efficiency boost not only accelerates the data preparation process but also allows data analysts and scientists to focus more on extracting insights rather than getting stuck in the initial stages of data processing.

![AWS Glue DataBrew](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWS_Glue-DataBrew_13_April_2024.png)

Hence, the correct answer is: **Utilize AWS Glue DataBrew for the data transformation tasks. Make the transformation steps available to employees through the use of DataBrew recipes.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Leverage AWS Glue Studio’s visual interface for data transformation. Use Amazon Redshift ML to generate predictive aggregates from the transformed data. Distribute the transformation process across the organization by utilizing Glue jobs** is incorrect because while AWS Glue Studio provides a visual interface for building transformation pipelines, it lacks the built-in data profiling and lineage tracking features required by the scenario. Additionally, Amazon Redshift ML is a machine learning service that trains and deploys predictive models using SQL. It is not a data transformation tool and is irrelevant to the requirement of generating analytical aggregates in a no-code transformation workflow.

- The option that says: **Query data using Amazon Athena to execute the data transformation using SQL queries. Facilitate the sharing of these Athena SQL queries among employees** is incorrect because Amazon Athena primarily serves as an interactive query service and lacks the built-in, visual data transformation, data lineage, and profiling capabilities that DataBrew offers. Sharing Athena SQL queries does not provide the same level of collaboration or ease of use for non-technical users as DataBrew recipes.

- The option that says: **Set up Amazon EMR to manage data transformation. Document and share the transformation steps with employees through EMR Studio notebooks** is incorrect because this option simply requires technical expertise, which contradicts the scenario’s requirement for a non-coding solution. Additionally, EMR does not offer built-in data profiling and lineage tracking, which is essential for easy management and transparency, making it less suitable compared to AWS Glue DataBrew, which meets these needs directly.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/databrew/latest/dg/what-is.html](https://docs.aws.amazon.com/databrew/latest/dg/what-is.html)
- [https://docs.aws.amazon.com/prescriptive-guidance/latest/serverless-etl-aws-glue/databrew.html](https://docs.aws.amazon.com/prescriptive-guidance/latest/serverless-etl-aws-glue/databrew.html)

**Check out this AWS Glue Cheat Sheet:**
- [https://tutorialsdojo.com/aws-glue/#glue-databrew](https://tutorialsdojo.com/aws-glue/#glue-databrew)

---

## Câu 22 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company needs to limit the visibility and discoverability of workloads across AWS accounts with differing administrative requirements. Using AWS Organizations, a solutions architect and accounts stakeholders grouped accounts into organizational units (OU).

A solution is required that will monitor changes to the OU hierarchy and allow stakeholders to subscribe to related alerts.

Which option meets these requirements with the LEAST administrative overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Use AWS CloudFormation stacksets to create resources across Organizations. Initiate the drift detection operation on a stack to identify changes.
- [ ] **B.** Use AWS Control Tower to provision the AWS accounts. Set up AWS Config aggregated rules.
- [x] **C.** Use AWS Control Tower to provision the AWS accounts. Enable account drift notifications.
- [ ] **D.** Use AWS Service Catalog to create accounts in Organizations. Configure an AWS CloudTrail organization trail to consolidate changes across accounts.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Use AWS Control Tower to provision the AWS accounts. Enable account drift notifications.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Organizations** is an account management service that enables you to consolidate multiple AWS accounts into an *organization* that you create and centrally manage. AWS Organizations includes account management and consolidated billing capabilities that enable you to better meet the budgetary, security, and compliance needs of your business.

![AWS Control Tower](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSControlTower_overview_12Feb2024.png)

 **AWS Control Tower** is a high-level service offering a straightforward way to set up and govern an AWS multi-account environment, following prescriptive best practices. AWS Control Tower *orchestrates* the capabilities of several other AWS services, including AWS Organizations, AWS Service Catalog, and AWS IAM Identity Center, to build a *landing zone* in less than an hour.

In this scenario, the feature mechanisms that enable the management of account drift are already built into the Control Tower. It requires no further engineering setup and avoids fragmenting administration to yet another service. This directly supports monitoring changes in the OU hierarchy, such as accounts being added or removed, enabling stakeholders to easily subscribe to alerts on these events.

Hence, the correct answer is: **Use AWS Control Tower to provision the AWS accounts. Enable account drift notifications.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use AWS Control Tower to provision the AWS accounts. Set up AWS Config aggregated rules** is incorrect. Although AWS Config Rules are able to span multiple accounts, it’s primarily designed for evaluating resource configurations across accounts, not changes to an OU hierarchy.

- The option that says: **Use AWS Service Catalog to create accounts in Organizations. Configure an AWS CloudTrail organization trail to consolidate changes across accounts** is incorrect because organization trails log all events for the management account and all accounts in the organization. Simply making sense of such a log for a very specific concern, such as OU hierarchy changes, would require additional tooling.

- The option that says: **Use AWS CloudFormation stacksets to create resources across Organizations. Initiate the drift detection operation on a stack to identify changes** is incorrect. Although this could detect changes in resources, it’s only focused on infrastructure as code and resource configurations, not specifically on monitoring OU hierarchy changes.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/organizations/](https://docs.aws.amazon.com/organizations/)
- [https://docs.aws.amazon.com/controltower/latest/userguide/integrated-services.html](https://docs.aws.amazon.com/controltower/latest/userguide/integrated-services.html)
- [https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-aws-environment/understanding-landing-zones.html](https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-aws-environment/understanding-landing-zones.html)

**Check out this AWS Organizations Cheat Sheet:**
- [https://tutorialsdojo.com/aws-organizations/](https://tutorialsdojo.com/aws-organizations/)

---

## Câu 23 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company has a web crawler that regularly stores artifacts in an Amazon S3 bucket. An initial copy of the artifacts has been uploaded to another S3 bucket and an EFS volume. The company needs to ensure that any changes in the source bucket are replicated in the target resources.

Which solution will meet these requirements with the LEAST operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** In the same VPC, launch an Amazon EC2 instance and mount the EFS file system. Write a cron job that synchronizes changes between the source and destination S3 buckets and file systems.
- [ ] **B.** Create an AWS Privatelink endpoint for Amazon S3. Configure an AWS Lambda function to copy files to the EFS file system and the destination S3 bucket. Set up an EventBridge rule that invokes the function when the `PutObject` action occurs in the source bucket.
- [ ] **C.** Create an AWS DataSync `location` and `task` for both the destination S3 bucket and the EFS file system. Configure transfer mode to `transfer all data`.
- [x] **D.** Create an AWS DataSync `location` and `task` for both the destination S3 bucket and the EFS file system. Configure transfer mode to `transfer only data that has changed`.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create an AWS DataSync `location` and `task` for both the destination S3 bucket and the EFS file system. Configure transfer mode to `transfer only data that has changed`.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS DataSync** is an online data movement and discovery service that simplifies data migration and helps you quickly, easily, and securely transfer your file or object data to, from, and between AWS storage services.

DataSync employs an AWS-designed transfer protocol—decoupled from the storage protocol—to accelerate data movement. The protocol performs optimizations on how, when, and what data is sent over the network. Network optimizations performed by DataSync include incremental transfers, in-line compression, and sparse file detection, as well as in-line data validation and encryption. A single DataSync task is capable of fully utilizing 10 Gbps over a network link between your on-premises environment and AWS.

![](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSDataSync_agentless_03Feb2024.png)

DataSync transfers can be configured in 2 ways:

– transfer only data that has changed

– transfer all data

In the scenario, since an initial copy of the artifacts has already been made to both the target S3 bucket and EFS volume, the most efficient approach is to create a DataSync task configured to transfer only the changed data. This configuration ensures that after the initial replication, only subsequent modifications, additions, or deletions to the artifacts in the source bucket trigger data transfers. This method reduces bandwidth consumption and storage costs, as it avoids redundant data transfer.

Hence, the correct answer is: **Create an AWS DataSync `location` and `task` for both the destination S3 bucket and the EFS file system. Configure transfer mode to `transfer only data that has changed.`**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option **Create an AWS DataSync `location` and `task` for both the destination S3 bucket and the EFS file system. Configure transfer mode to `transfer all data`** is incorrect. Configuring DataSync to transfer all data instead of only the data that has changed leads to unnecessary data transfer and, therefore, cost. Keep in mind that aside from DataSync per-gigabyte cost, storage services such as S3 also charge a per-gigabyte cost for egress.

- The option **Create an AWS Privatelink endpoint for Amazon S3. Configure an AWS Lambda function to copy files to the EFS file system and the destination S3 bucket. Set up an EventBridge rule that invokes the function when the `PutObject` action occurs in the source bucket** is incorrect because writing a performant Lambda function that is at least at par with DataSync would entail a significant development overhead.

- The option **In the same VPC, launch an Amazon EC2 instance and mount the EFS file system. Write a cron job that synchronizes changes between the source and destination S3 buckets and file systems** is also incorrect. This is even worse than the Lambda option as it increases the responsibility of the cron job polling S3 to discover recent changes aside from requiring an always-on EC2 instance that may not be fully utilized if such changes occur in infrequent spikes.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/datasync/latest/userguide/what-is-datasync.html](https://docs.aws.amazon.com/datasync/latest/userguide/what-is-datasync.html)
- [https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html](https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html)
- [https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html](https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html)

**

Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 24 (Chọn 1 đáp án (Single Choice))
**Domain:** *AWS Certified Solutions Architect Associate*

### Đề bài (Question)
A company runs an internal application on AWS which uses Amazon EC2 instances for compute and Amazon RDS for PostgreSQL for its data store. Considering the application only runs during working hours on weekdays, a solution is required to optimize costs with minimal operational overhead.

Which solution would satisfy these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Purchase a compute savings plan for EC2 and RDS.
- [ ] **B.** Create an Amazon CloudWatch alarm that triggers an AWS Lambda function when CPU utilization falls below an idle threshold. In the function, implement logic for stopping both the EC2 instance and the RDS database.
- [x] **C.** Deploy the AWS CloudFormation template of the `Instance Scheduler on AWS`. Set up the start and stop schedules of the EC2 instance and RDS DB instance.
- [ ] **D.** Purchase reserved instance subscriptions for EC2 and RDS

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Deploy the AWS CloudFormation template of the `Instance Scheduler on AWS`. Set up the start and stop schedules of the EC2 instance and RDS DB instance.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The **Instance Scheduler on AWS** solution automates the starting and stopping of Amazon Elastic Compute Cloud (Amazon EC2) and Amazon Relational Database Service (Amazon RDS) instances.

This solution helps reduce operational costs by stopping resources that are not in use and starting resources when their capacity is needed. For example, a company can use an Instance Scheduler on AWS in a production environment to automatically stop instances outside of business hours every day. If you leave all of your instances running at full utilization, this solution can result in up to 70% cost savings for those instances that are only necessary during regular business hours (weekly utilization reduced from 168 hours to 50 hours).

![AWS Instance Scheduler CloudFormation solution](../Bonus Review Mode Set 8 - AWS Solutions Architect Associate - Tutorials Dojo_files/AWSCloudFormation_InstanceScheduler_12Feb2024.png)

*AWS Instance Scheduler CloudFormation solution*

The important aspect in this scenario is the usage pattern, which doesn’t fit the continuous usage model assumed by Reserved Instance subscriptions or compute savings plans. It’s essential to understand that the Instance Scheduler is not an AWS service or feature per se, but a CloudFormation template provided by AWS. By deploying this template, you can simply set the desired start and stop schedules for your EC2 and RDS instances to match your application’s operating hours.

Hence, the correct answer is: **Deploy the AWS CloudFormation template of the `Instance Scheduler on AWS`. Set up the start and stop schedules of the EC2 instance and RDS DB instance.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Purchase a compute savings plan for EC2 and RDS** is incorrect because compute savings plans are only applicable for consistent hourly use of compute instances. This means that for periods where the instances could be in `Stopped` status, it is still billed, albeit at a discounted rate. Also, there is no compute savings plan that applies to RDS db instance types.

- The option that says: **Create an Amazon CloudWatch alarm that triggers an AWS Lambda function when CPU utilization falls below an idle threshold. In the function, implement logic for stopping both the EC2 instance and the RDS database** is incorrect. This approach just provides a dynamic way to stop instances based on usage rather than a fixed schedule. Additionally, stopping RDS instances based on CPU utilization could lead to unintended downtime during work hours if the utilization drops temporarily.

- The option that says: **Purchase reserved instance subscriptions for EC2 and RDS** is incorrect because, similar to compute savings plans, reserved instance subscriptions apply only for consistent hourly use of compute. Thus, the always-on assumption would forfeit, if not defeat, the benefit of the discount.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/solutions/latest/instance-scheduler-on-aws/solution-overview.html](https://docs.aws.amazon.com/solutions/latest/instance-scheduler-on-aws/solution-overview.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-reserved-instances.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-reserved-instances.html)

**Check out this AWS CloudFormation Cheat Sheet:**
- [https://tutorialsdojo.com/aws-cloudformation/](https://tutorialsdojo.com/aws-cloudformation/)

---
