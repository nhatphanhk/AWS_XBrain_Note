Question 1
Correct
A healthcare company wants to run its applications on single-tenant hardware to meet compliance guidelines.

Which of the following is the MOST cost-effective way of isolating the Amazon EC2 instances to a single tenant?

Your answer is correct
Dedicated Instances

Dedicated Hosts

On-Demand Instances

Spot Instances

Overall explanation
Correct option:

Dedicated Instances

Dedicated Instances are Amazon EC2 instances that run in a virtual private cloud (VPC) on hardware that's dedicated to a single customer. Dedicated Instances that belong to different AWS accounts are physically isolated at a hardware level, even if those accounts are linked to a single-payer account. However, Dedicated Instances may share hardware with other instances from the same AWS account that are not Dedicated Instances.

A Dedicated Host is also a physical server that's dedicated for your use. With a Dedicated Host, you have visibility and control over how instances are placed on the server.

Differences between Dedicated Hosts and Dedicated Instances:  via - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html#dedicated-hosts-dedicated-instances

Incorrect options:

Spot Instances - A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Your Spot Instance runs whenever capacity is available and the maximum price per hour for your request exceeds the Spot price. Any instance present with unused capacity will be allocated. Even though this is cost-effective, it does not fulfill the single-tenant hardware requirement of the client and hence is not the correct option.

Dedicated Hosts - An Amazon EC2 Dedicated Host is a physical server with Amazon EC2 instance capacity fully dedicated to your use. Dedicated Hosts allow you to use your existing software licenses on Amazon EC2 instances. With a Dedicated Host, you have visibility and control over how instances are placed on the server. This option is costlier than the Dedicated Instance and hence is not the right choice for the current requirement.

On-Demand Instances - With On-Demand Instances, you pay for the compute capacity by the second with no long-term commitments. You have full control over its lifecycle—you decide when to launch, stop, hibernate, start, reboot, or terminate it. Hardware isolation is not possible and on-demand has one of the costliest instance charges and hence is not the correct answer for current requirements.

High Level Overview of Amazon EC2 Instance Purchase Options:  via - https://aws.amazon.com/ec2/pricing/

References:

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html

Domain
Design Secure Architectures

Question 2
Correct
A company's real-time streaming application is running on AWS. As the data is ingested, a job runs on the data and takes 30 minutes to complete. The workload frequently experiences high latency due to large amounts of incoming data. A solutions architect needs to design a scalable and serverless solution to enhance performance.

Which combination of steps should the solutions architect take? (Select two)

Set up AWS Lambda with AWS Step Functions to process the data

Provision Amazon EC2 instances in an Auto Scaling group to process the data

Set up AWS Database Migration Service (AWS DMS) to ingest the data

Your selection is correct
Set up Amazon Kinesis Data Streams to ingest the data

Your selection is correct
Set up AWS Fargate with Amazon ECS to process the data

Overall explanation
Correct options:

Set up Amazon Kinesis Data Streams to ingest the data

Set up AWS Fargate with Amazon ECS to process the data

Amazon Kinesis Data Streams (KDS) is a massively scalable and durable real-time data streaming service. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events. The data collected is available in milliseconds to enable real-time analytics use cases such as real-time dashboards, real-time anomaly detection, dynamic pricing, and more.

AWS Fargate is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). Fargate makes it easy for you to focus on building your applications. Fargate removes the need to provision and manage servers, lets you specify and pay for resources per application, and improves security through application isolation by design.

For the given use case, we can use Kinesis Data Streams as the ingestion layer and the containerized ECS application on AWS Fargate as the processing layer. Both these components are serverless and can scale to offer the desired performance.

Incorrect options:

Set up AWS Database Migration Service (AWS DMS) to ingest the data - AWS Database Migration Service helps you migrate databases to AWS quickly and securely. DMS cannot be used for real-time data ingestion. Hence, this option is incorrect.

Set up AWS Lambda with AWS Step Functions to process the data - The maximum timeout value for any AWS Lambda function is 15 minutes. When the specified timeout is reached, AWS Lambda terminates the execution of your Lambda function. Since the use case talks about a job that runs for 30 minutes, Lambda is not an option here.

Provision Amazon EC2 instances in an Auto Scaling group to process the data - The given requirement is for a serverless solution to process the data. Hence, provisioning an Amazon EC2 instance is clearly not the right solution.

Reference:

https://aws.amazon.com/blogs/big-data/building-a-scalable-streaming-data-processor-with-amazon-kinesis-data-streams-on-aws-fargate/

Domain
Design High-Performing Architectures

Question 3
Incorrect
A global enterprise maintains a hybrid cloud environment and wants to transfer large volumes of data between its on-premises data center and Amazon S3 for backup and analytics workflows. The company has already established a Direct Connect (DX) connection to AWS and wants to ensure high-bandwidth, low-latency, and secure private connectivity without traversing the public internet. The architecture must be designed to access Amazon S3 directly from on-premises systems using this DX connection.

Which configuration should the network engineering team implement to allow direct access to Amazon S3 from the on-premises data center using Direct Connect?

Correct answer
Provision a Public Virtual Interface (Public VIF) on the Direct Connect connection to access Amazon S3 public IP addresses from the on-premises data center

Your answer is incorrect
Use a Private Virtual Interface (Private VIF) on the Direct Connect connection and create a VPC endpoint to route traffic to S3 over the private network

Use a Transit Gateway with Direct Connect Gateway to route on-premises traffic through a VPC and then to Amazon S3 using private IP addressing

Configure a VPN connection over the public internet to AWS and route S3 traffic through the tunnel instead of using Direct Connect

Overall explanation
Correct option:

Provision a Public Virtual Interface (Public VIF) on the Direct Connect connection to access Amazon S3 public IP addresses from the on-premises data center

To access Amazon S3 from an on-premises data center using AWS Direct Connect, the correct approach is to configure a Public Virtual Interface (Public VIF). A Public VIF allows your on-premises router to access public AWS services, such as Amazon S3 and DynamoDB, over the dedicated Direct Connect connection rather than the public internet. When you establish a Public VIF, AWS advertises a set of public IP prefixes corresponding to its services, including Amazon S3. This allows your data center to communicate with these services using public IPs routed privately over Direct Connect, delivering improved performance, lower latency, and enhanced security. Public VIFs are specifically designed for scenarios where you want to connect on-premises infrastructure to AWS public endpoints over private, high-bandwidth links.

 via - https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html

Incorrect options:

Use a Private Virtual Interface (Private VIF) on the Direct Connect connection and create a VPC endpoint to route traffic to S3 over the private network - A Private Virtual Interface (Private VIF) is used to connect an on-premises network to VPC resources, such as EC2 instances or RDS databases, over private IP space. However, Amazon S3 is a public AWS service, and Private VIFs cannot natively route traffic to public S3 endpoints. While S3 access via interface VPC endpoints is possible from within the VPC, it does not extend to on-premises access over Private VIF. Therefore, Private VIF is not suitable for directly accessing S3 from on-prem.

Configure a VPN connection over the public internet to AWS and route S3 traffic through the tunnel instead of using Direct Connect - Using a VPN connection over the public internet to route traffic to S3 bypasses the benefits of Direct Connect, such as low latency, dedicated bandwidth, and private connectivity. VPN traffic traverses the public internet and therefore violates the requirements of the given use case.

Use a Transit Gateway with Direct Connect Gateway to route on-premises traffic through a VPC and then to Amazon S3 using private IP addressing - While Transit Gateway with Direct Connect Gateway is a valid solution for routing on-premises traffic to multiple VPCs over a private Direct Connect connection, it does not enable direct private IP access to Amazon S3, because S3 is a public AWS service with public IP addresses. Even if you configure interface VPC endpoints (AWS PrivateLink) to S3 in a connected VPC, the traffic remains local to that VPC and is not extended to the on-premises network via Transit Gateway. To access S3 from on-premises using Direct Connect, you must provision a Public Virtual Interface, which advertises AWS public service IP ranges to your data center.

Reference:

https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html

Domain
Design Secure Architectures
