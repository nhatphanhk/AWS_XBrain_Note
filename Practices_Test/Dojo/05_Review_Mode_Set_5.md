# AWS Certified Solutions Architect Associate (SAA-C03) - Practice Exam Set 5

> **Tổng số câu hỏi:** 65 câu  
> **Nguồn tài liệu:** Tutorials Dojo  
> **Chế độ:** Review Mode (Kèm đáp án & lời giải chi tiết vì sao đúng / sai)  

---

## Câu 1 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company has 10 TB of infrequently accessed financial data files that would need to be stored in AWS. These data would be accessed infrequently during specific weeks when they are retrieved for auditing purposes. The retrieval time is not strict as long as it does not exceed 24 hours.

Which of the following would be a secure, durable, and cost-effective solution for this scenario?

### Các lựa chọn (Choices)
- [ ] **A.** Upload the data to S3 then use a lifecycle policy to transfer data to S3 One Zone-IA.
- [ ] **B.** Upload the data to Amazon FSx for Windows File Server using the Server Message Block (SMB) protocol.
- [x] **C.** Upload the data to S3 and set a lifecycle policy to transition data to Glacier after `0` days.
- [ ] **D.** Upload the data to S3 then use a lifecycle policy to transfer data to S3-IA.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Upload the data to S3 and set a lifecycle policy to transition data to Glacier after `0` days.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Glacier** is a cost-effective archival solution for large amounts of data. Bulk retrievals are S3 Glacier’s lowest-cost retrieval option, enabling you to retrieve large amounts, even petabytes, of data inexpensively in a day. Bulk retrievals typically complete within 5 – 12 hours. You can specify an absolute or relative time period (including 0 days) after which the specified Amazon S3 objects should be transitioned to Amazon Glacier.

Hence, the correct answer is the option that says: **Upload the data to S3 and set a lifecycle policy to transition data to Glacier after `0` days.**

Glacier has a management console that you can use to create and delete vaults. However, you cannot directly upload archives to Glacier by using the management console. To upload data such as photos, videos, and other documents, you must either use the AWS CLI or write code to make requests by using either the REST API directly or by using the AWS SDKs.

Take note that uploading data to the S3 Console and setting its storage class of “Glacier” is a different story as the proper way to upload data to Glacier is still via its API or CLI. In this way, you can set up your vaults and configure your retrieval options. If you uploaded your data using the S3 console then it will be managed via S3 even though it is internally using a Glacier storage class.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Uploading the data to S3 then using a lifecycle policy to transfer data to S3-IA** is incorrect because using Glacier would be a more cost-effective solution than using S3-IA. Since the required retrieval period should not exceed more than a day, Glacier would be the best choice.

- **Uploading the data to Amazon FSx for Windows File Server using the Server Message Block (SMB) protocol** is incorrect because this option costs more than Amazon Glacier, which is more suitable for storing infrequently accessed data. Amazon FSx for Windows File Server provides fully managed, highly reliable, and scalable file storage that is accessible over the industry-standard Server Message Block (SMB) protocol.

- **Uploading the data to S3 then using a lifecycle policy to transfer data to S3 One Zone-IA** is incorrect because with S3 One Zone-IA, the data will only be stored in a single availability zone and thus, this storage solution is not durable. It also costs more compared to Glacier.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/glacier/faqs/](https://aws.amazon.com/glacier/faqs/)
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html)
- [https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-an-archive.html](https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-an-archive.html)

**Check out this Amazon S3 Glacier Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-glacier/](https://tutorialsdojo.com/amazon-glacier/)

---

## Câu 2 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A Solutions Architect is working for a fast-growing startup that just started operations during the past 3 months. They currently have an on-premises Active Directory and 10 computers. To save costs in procuring physical workstations, they decided to deploy virtual desktops for their new employees in a virtual private cloud in AWS. The new cloud infrastructure should leverage the existing security controls in AWS but can still communicate with their on-premises network.

Which set of AWS services will the Architect use to meet these requirements?

### Các lựa chọn (Choices)
- [ ] **A.** AWS Directory Services, VPN connection, and ClassicLink
- [ ] **B.** AWS Directory Services, VPN connection, and Amazon S3
- [ ] **C.** AWS Directory Services, VPN connection, and AWS Identity and Access Management
- [x] **D.** AWS Directory Services, VPN connection, and Amazon Workspaces

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** AWS Directory Services, VPN connection, and Amazon Workspaces

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
For this scenario, the best answer is: **AWS Directory Services, VPN connection, and Amazon Workspaces** .

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/standardedition_usecases_1017_large.png)

First, you need a VPN connection to connect the VPC and your on-premises network. Second, you need AWS Directory Services to integrate with your on-premises Active Directory, and lastly, you need to use Amazon Workspace to create the needed virtual desktops in your VPC.

The given scenario involves a startup looking to deploy virtual desktops in AWS while leveraging existing security controls and maintaining connectivity with their on-premises network. The incorrect options include combinations of services like **AWS Directory Services** , **VPN connection** , **and irrelevant services like ClassicLink** , **IAM** , or **Amazon S3** .

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/directoryservice/](https://aws.amazon.com/directoryservice/)
- [https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpn-connections.html](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpn-connections.html)
- [https://aws.amazon.com/workspaces/](https://aws.amazon.com/workspaces/)

**Check out these cheat sheets on AWS Directory Service, Amazon VPC, and Amazon WorkSpaces:**
- [https://tutorialsdojo.com/aws-directory-service/](https://tutorialsdojo.com/aws-directory-service/)
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)
- [https://tutorialsdojo.com/amazon-workspaces/](https://tutorialsdojo.com/amazon-workspaces/)

---

## Câu 3 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A local bank has an in-house application that handles sensitive financial data in a private subnet. After the data is processed by the EC2 worker instances, they will be delivered to S3 for ingestion by other services.

How should you design this solution so that the data does not pass through the public Internet?

### Các lựa chọn (Choices)
- [x] **A.** Configure a VPC Endpoint along with a corresponding route entry that directs the data to S3.
- [ ] **B.** Provision a NAT gateway in the private subnet with a corresponding route entry that directs the data to S3.
- [ ] **C.** Configure a Transit gateway along with a corresponding route entry that directs the data to S3.
- [ ] **D.** Create an Internet gateway in the public subnet with a corresponding route entry that directs the data to S3.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Configure a VPC Endpoint along with a corresponding route entry that directs the data to S3.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The important concept that you have to understand in this scenario is that your VPC and your S3 bucket are located within the larger AWS network. However, the traffic coming from your VPC to your S3 bucket is traversing the public Internet by default. To better protect your data in transit, you can set up a VPC endpoint so the incoming traffic from your VPC will not pass through the public Internet, but instead through the private AWS network.

A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an Internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other services does not leave the Amazon network.

Endpoints are virtual devices. They are horizontally scaled, redundant, and highly available VPC components that allow communication between instances in your VPC and services without imposing availability risks or bandwidth constraints on your network traffic.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-s3-vpc-endpoint.PNG)

Hence, the correct answer is: **Configure a VPC Endpoint along with a corresponding route entry that directs the data to S3.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an Internet gateway in the public subnet with a corresponding route entry that directs the data to S3** is incorrect because the Internet gateway is used for instances in the public subnet to have accessibility to the Internet.

- The option that says: **Configure a Transit gateway along with a corresponding route entry that directs the data to S3** is incorrect because the Transit Gateway is used for interconnecting VPCs and on-premises networks through a central hub. Since Amazon S3 is outside of VPC, you still won’t be able to connect to it privately.

- The option that says: **Provision a NAT gateway in the private subnet with a corresponding route entry that directs the data to S3** is incorrect because NAT Gateway allows instances in the private subnet to gain access to the Internet, but not vice versa.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References** :
- [https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html](https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 4 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A health organization is using a large Dedicated Amazon EC2 instance with multiple Amazon EBS volumes to host its health records web application. To ensure compliance and consistency, the organization uses AWS Systems Manager State Manager to automatically enforce baseline configurations.

The EBS volumes must be encrypted to protect the confidentiality of the data and to comply with the HIPAA (Health Insurance Portability and Accountability Act) standard.

In EBS encryption, which of the following does AWS use to secure data at rest on the volume? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** By using your own keys in AWS Key Management Service (KMS).
- [ ] **B.** By using a password stored in AWS CloudHSM.
- [ ] **C.** By using the SSL certificates provided by the AWS Certificate Manager (ACM).
- [x] **D.** By using Amazon-managed keys in AWS Key Management Service (KMS).
- [ ] **E.** By using Amazon S3 Server-Side Encryption and S3 Client-Side Encryption.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, D**
> - **A.** By using your own keys in AWS Key Management Service (KMS).
> - **D.** By using Amazon-managed keys in AWS Key Management Service (KMS).

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon EBS encryption offers seamless encryption of EBS data volumes, boot volumes, and snapshots, eliminating the need to build and maintain a secure key management infrastructure. EBS encryption enables data at rest security by encrypting your data using Amazon-managed keys, or keys you create and manage using the AWS Key Management Service (KMS). The encryption occurs on the servers that host EC2 instances, providing encryption of data as it moves between EC2 instances and EBS storage.

![Amazon EBS encryption](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Amazon EBS encryption-19MAR2026.png)

Hence, the correct answers are:

 **– By using your own keys in AWS Key Management Service (KMS)**

 **– By using Amazon-managed keys in AWS Key Management Service (KMS).**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **By using Amazon S3 Server-Side Encryption and** **S3 Client-Side Encryption** is incorrect because these relate only to S3.

- The option that says: **By using a password stored in AWS CloudHSM** is incorrect because you can only store keys in CloudHSM and not passwords.

- The option that says: **By using the SSL certificates provided by the AWS Certificate Manager (ACM)** is incorrect because ACM typically provides SSL certificates and not data encryption of EBS Volumes.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/ebs/faqs/](https://aws.amazon.com/ebs/faqs/)
- [https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption.html](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption.html)

**Check out this Amazon EBS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)

---

## Câu 5 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company needs to accelerate the development of its GraphQL APIs for its new customer service portal. The solution must be serverless to lower the monthly operating cost of the business. Their GraphQL APIs must be accessible via HTTPS and have a custom domain.

What solution should the Solutions Architect implement to meet the above requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Launch an AWS Elastic Beanstalk environment and use Amazon Route 53 for the custom domain. Configure Domain Name System Security Extensions (DNSSEC) in the Route 53 hosted zone to enable HTTPS communication.
- [ ] **B.** Host the application in the VMware Cloud on AWS service. Associate a custom domain to the GraphSQL APIs via the AWS Directory Service for Microsoft Active Directory and provide multiple domain controllers to enable HTTPS communication.
- [ ] **C.** Deploy the GraphQL APIs as Kubernetes pods to AWS Fargate and AWS Outposts using Amazon EKS Anywhere for deployment. Create a custom domain using Amazon CloudFront and enable the Origin Shield feature to allow HTTPS communication to the GraphQL APIs.
- [x] **D.** Develop the application using the AWS AppSync service and use its built-in custom domain feature. Associate an SSL certificate to the AWS AppSync API using the AWS Certificate Manager (ACM) service to enable HTTPS communication.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Develop the application using the AWS AppSync service and use its built-in custom domain feature. Associate an SSL certificate to the AWS AppSync API using the AWS Certificate Manager (ACM) service to enable HTTPS communication.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
AWS AppSync is a serverless GraphQL and Pub/Sub API service that simplifies building modern web and mobile applications. It provides a robust, scalable GraphQL interface for application developers to combine data from multiple sources, including Amazon DynamoDB, AWS Lambda, and HTTP APIs.

GraphQL is a data language to enable client apps to fetch, change and subscribe to data from servers. In a GraphQL query, the client specifies how the data is to be structured when it is returned by the server. This makes it possible for the client to query only for the data it needs, in the format that it needs it in.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-appsync-custom-domain.png)

With AWS AppSync, you can use custom domain names to configure a single, memorable domain that works for both your GraphQL and real-time APIs.

In other words, you can utilize simple and memorable endpoint URLs with domain names of your choice by creating custom domain names that you associate with the AWS AppSync APIs in your account.

When you configure an AWS AppSync API, two endpoints are provisioned:

 **AWS AppSync GraphQL endpoint:**
`https://example1234567890000.appsync-api.us-east-1.amazonaws.com/graphql`
 **AWS AppSync real-time endpoint:**
`wss://example1234567890000.appsync-realtime-api.us-east-1.amazonaws.com/graphql`

Hence, the correct answer is: **Develop the application using the AWS AppSync service and use its built-in custom domain feature. Associate an SSL certificate to the AWS AppSync API using the AWS Certificate Manager (ACM) service to enable HTTPS communication.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Launch an AWS Elastic Beanstalk environment and use Amazon Route 53 for the custom domain. Configure Domain Name System Security Extensions (DNSSEC) in the Route 53 hosted zone to enable HTTPS communication** is incorrect because the AWS Elastic Beanstalk service is not a serverless solution. This will launch Amazon EC2 instances in your AWS account for your application. Take note that the requirements explicitly mentioned that the solution should be serverless. In addition, the primary function of the DNSSEC feature is to authenticate the responses of domain name lookups and not for HTTPS communication.

- The option that says: **Host the application in the VMware Cloud on AWS service. Associate a custom domain to the GraphSQL APIs via the AWS Directory Service for Microsoft Active Directory and provide multiple domain controllers to enable HTTPS communication** is incorrect. The VMware Cloud on AWS is only a service for vSphere-based workloads and not for GraphQL use cases. Moreover, the main use case for AWS Directory Service is to enable your directory-aware workloads and AWS resources to use managed Active Directory (AD) in AWS and not for HTTPS communication.

- The option that says: **Deploy the GraphQL APIs as Kubernetes pods to AWS Fargate and AWS Outposts using Amazon EKS Anywhere for deployment. Create a custom domain using Amazon CloudFront and enable the Origin Shield feature to allow HTTPS communication to the GraphQL APIs** is incorrect. Although the AWS Fargate service is serverless, the AWS Outposts service is not. Furthermore, the Origin Shield feature in Amazon CloudFront is simply a centralized caching layer that helps increase your cache hit ratio which effectively reduces the load on your origin. A better solution is to use AWS AppSync and use its built-in custom domain.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/appsync/latest/devguide/custom-domain-name.html](https://docs.aws.amazon.com/appsync/latest/devguide/custom-domain-name.html)
- [https://docs.aws.amazon.com/appsync/latest/devguide/what-is-appsync.html](https://docs.aws.amazon.com/appsync/latest/devguide/what-is-appsync.html)
- [https://aws.amazon.com/appsync/](https://aws.amazon.com/appsync/)

---

## Câu 6 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A top investment bank is in the process of building a new Forex trading platform. To ensure high availability and scalability, the trading platform is designed with an active-passive failover architecture across multiple Availability Zones, using an AWS Elastic Load Balancer in front of an AWS Auto Scaling group of Amazon EC2 On-Demand instances. For its database tier, a single Amazon Aurora instance was chosen to take advantage of its distributed, fault-tolerant, and self-healing storage system.

In the event of system failure on the primary database instance, what happens to Aurora during the failover?

### Các lựa chọn (Choices)
- [ ] **A.** Aurora flips the canonical name record (CNAME) for your DB Instance to point at the healthy replica, which in turn is promoted to become the new primary.
- [x] **B.** Aurora will attempt to create a new DB Instance in the same Availability Zone as the original instance and is done on a best-effort basis.
- [ ] **C.** Aurora flips the A record of your DB Instance to point at the healthy replica, which in turn is promoted to become the new primary.
- [ ] **D.** Aurora will first attempt to create a new DB Instance in a different Availability Zone of the original instance. If unable to do so, Aurora will attempt to create a new DB Instance in the original Availability Zone in which the instance was first launched.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Aurora will attempt to create a new DB Instance in the same Availability Zone as the original instance and is done on a best-effort basis.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Failover is automatically handled by Amazon Aurora so that your applications can resume database operations as quickly as possible without manual administrative intervention.

![Aurora Architecture](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Aurora-Arch.jpg)

If you have an Amazon Aurora Replica in the same or a different Availability Zone, when failing over, Amazon Aurora flips the canonical name record (CNAME) for your DB Instance to point at the healthy replica, which in turn is promoted to become the new primary. Start-to-finish failover typically completes within 30 seconds.

If you are running Aurora Serverless and the DB instance or AZ becomes unavailable, Aurora will automatically recreate the DB instance in a different AZ.

If you do not have an Amazon Aurora Replica (i.e., single instance) and are not running Aurora Serverless, Aurora will attempt to create a new DB Instance in the same Availability Zone as the original instance. This replacement of the original instance is done on a best-effort basis and may not succeed, for example, if there is an issue that is broadly affecting the Availability Zone.

Hence, the correct answer is: **Aurora will attempt to create a new DB Instance in the same Availability Zone as the original instance, and this is done on a best-effort basis.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The options that say: **Aurora flips the canonical name record (CNAME) for your DB Instance to point at the healthy replica, which in turn is promoted to become the new primary** and ** Aurora flips the A record of your DB Instance to point at the healthy replica, which in turn is promoted to become the new primary** are incorrect because this will only happen if you are using an Amazon Aurora Replica. In addition, Amazon Aurora flips the canonical name record (CNAME) and not the A record (IP address) of the instance.

- The option that says: **Aurora will first attempt to create a new DB Instance in a different Availability Zone of the original instance. If unable to do so, Aurora will attempt to create a new DB Instance in the original Availability Zone in which the instance was first launched** is incorrect because Aurora will first attempt to create a new DB Instance in the same Availability Zone as the original instance. If unable to do so, Aurora will attempt to create a new DB Instance in a different Availability Zone and not the other way around.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/rds/aurora/faqs/](https://aws.amazon.com/rds/aurora/faqs/)
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html)

**Check out this Amazon Aurora Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-aurora/](https://tutorialsdojo.com/amazon-aurora/)

---

## Câu 7 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A healthcare company stores sensitive patient health records in their on-premises storage systems. These records must be kept indefinitely and protected from any type of modifications once they are stored. Compliance regulations mandate that the records must have granular access control and each data access must be audited at all levels. Currently, there are millions of obsolete records that are not accessed by their web application, and their on-premises storage is quickly running out of space. The Solutions Architect must design a solution to immediately move existing records to AWS and support the ever-growing number of new health records.

Which of the following is the most suitable solution that the Solutions Architect should implement to meet the above requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Set up AWS Storage Gateway to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Management Events and Amazon S3 Object Lock in the bucket.
- [x] **B.** Set up AWS DataSync to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Data Events and Amazon S3 Object Lock in the bucket.
- [ ] **C.** Set up AWS DataSync to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Management Events and Amazon S3 Object Lock in the bucket.
- [ ] **D.** Set up AWS Storage Gateway to move the existing health records from the on-premises network to the AWS Cloud. Launch an Amazon EBS-backed EC2 instance to store both the existing and new records. Enable Amazon S3 server access logging and S3 Object Lock in the bucket.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Set up AWS DataSync to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Data Events and Amazon S3 Object Lock in the bucket.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Storage Gateway** is a set of hybrid cloud services that gives you on-premises access to virtually unlimited cloud storage. Customers use Storage Gateway to **integrate** AWS Cloud storage with existing on-site workloads so they can simplify storage management and reduce costs for key hybrid cloud storage use cases. These include moving backups to the cloud, using on-premises file shares backed by cloud storage, and providing low latency access to data in AWS for on-premises applications.

 **AWS DataSync** is an online data transfer service that simplifies, automates, and accelerates **moving** data between on-premises storage systems and AWS Storage services, as well as between AWS Storage services. You can use DataSync to **migrate** active datasets to AWS, archive data to free up on-premises storage capacity, replicate data to AWS for business continuity, or transfer data to the cloud for analysis and processing.

Both AWS Storage Gateway and AWS DataSync can send data from your on-premises data center to AWS and vice versa. However, AWS Storage Gateway is more suitable to be used in integrating your storage services by replicating your data while AWS DataSync is better for workloads that require you to move or migrate your data.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Storage+Gateway+vs+DataSync.png)

You can also use a combination of DataSync and File Gateway to minimize your on-premises infrastructure while seamlessly connecting on-premises applications to your cloud storage. AWS DataSync enables you to automate and accelerate online data transfers to AWS storage services. File Gateway is a fully managed solution that will automate and accelerate the replication of data between the on-premises storage systems and AWS storage services.

 **AWS CloudTrail** is an AWS service that helps you enable governance, compliance, and operational and risk auditing of your AWS account. Actions taken by a user, role, or an AWS service are recorded as events in CloudTrail. Events include actions taken in the AWS Management Console, AWS Command Line Interface, and AWS SDKs and APIs.

There are two types of events that you configure your CloudTrail for:

– Management Events

– Data Events

 **Management Events** provide visibility into management operations that are performed on resources in your AWS account. These are also known as control plane operations. Management events can also include non-API events that occur in your account.

 **Data Events** , on the other hand, provide visibility into the resource operations performed on or within a resource. These are also known as data plane operations. It allows granular control of data event logging with advanced event selectors. You can currently log data events on different resource types such as Amazon S3 object-level API activity (e.g. GetObject, DeleteObject, and PutObject API operations), AWS Lambda function execution activity (the Invoke API), DynamoDB Item actions, and many more.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/cloudtrail-data-events.png)

With **S3 Object Lock** , you can store objects using a *write-once-read-many* (WORM) model. Object Lock can help prevent objects from being deleted or overwritten for a fixed amount of time or indefinitely. You can use Object Lock to help meet regulatory requirements that require WORM storage or to simply add another layer of protection against object changes and deletion.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/CloudTrail_vs_S3_server_access_logs.png)

You can record the actions that are taken by users, roles, or AWS services on Amazon S3 resources and maintain log records for auditing and compliance purposes. To do this, you can use server access logging, AWS CloudTrail logging, or a combination of both. AWS recommends that you use AWS CloudTrail for logging bucket and object-level actions for your Amazon S3 resources.

Hence, the correct answer is: **Set up AWS DataSync to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Data Events and Amazon S3 Object Lock in the bucket.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up AWS Storage Gateway to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Management Events and Amazon S3 Object Lock in the bucket** is incorrect. The requirement explicitly says that the Solutions Architect must immediately move the existing records to AWS and not integrate or replicate the data. Using AWS DataSync is a more suitable service to use here since the primary objective is to migrate or move data. You also have to use Data Events here and not Management Events in CloudTrail, to properly track all the data access and changes to your objects.

- The option that says: **Set up AWS Storage Gateway to move the existing health records from the on-premises network to the AWS Cloud. Launch an Amazon EBS-backed EC2 instance to store both the existing and new records. Enable Amazon S3 server access logging and S3 Object Lock in the bucket** is incorrect. Just as mentioned in the previous option, using AWS Storage Gateway is not a recommended service to use in this situation since the objective is to move the obsolete data. Moreover, using Amazon EBS to store health records is not a scalable solution compared with Amazon S3. Enabling server access logging can help audit the stored objects. However, it is better to CloudTrail as it provides more granular access control and tracking.

- The option that says: **Set up AWS DataSync to move the existing health records from the on-premises network to the AWS Cloud. Launch a new Amazon S3 bucket to store existing and new records. Enable AWS CloudTrail with Management Events and Amazon S3 Object Lock in the bucket** is incorrect. Although it is right to use AWS DataSync to move the health records, you still have to configure Data Events in AWS CloudTrail and not Management Events. This type of event only provides visibility into management operations that are performed on resources in your AWS account and not the data events that are happening in the individual objects in Amazon S3.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/datasync/faqs/](https://aws.amazon.com/datasync/faqs/)
- [https://aws.amazon.com/about-aws/whats-new/2020/12/aws-cloudtrail-provides-more-granular-control-of-data-event-logging/](https://aws.amazon.com/about-aws/whats-new/2020/12/aws-cloudtrail-provides-more-granular-control-of-data-event-logging/)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html)

**Check out this AWS DataSync Cheat Sheet:**
- [https://tutorialsdojo.com/aws-datasync/](https://tutorialsdojo.com/aws-datasync/)

---

## Câu 8 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A healthcare company manages patient data using a distributed system. The organization utilizes a microservice-based serverless application to handle various aspects of patient care. Data has to be retrieved and written from multiple Amazon DynamoDB tables.

The primary goal is to enable efficient retrieval and writing of data without impacting the baseline performance of the application as well as ensuring seamless access to patient information for healthcare professionals.

Which of the following is the MOST operationally efficient solution?

### Các lựa chọn (Choices)
- [ ] **A.** Launched AWS Lambda functions with an edge-optimized Amazon API Gateway
- [ ] **B.** Use CloudFront functions
- [x] **C.** Utilize AWS AppSync pipeline resolvers
- [ ] **D.** Set up DynamoDB connector for Amazon Athena Federated Query

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Utilize AWS AppSync pipeline resolvers

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AppSync pipeline resolvers** offer an elegant server-side solution to address the common challenge faced in web applications—aggregating data from multiple database tables. Instead of invoking multiple API calls across different data sources, which can degrade application performance and user experience, AppSync pipeline resolvers enable easy retrieval of data from multiple sources with just a single call. By leveraging Pipeline functions, these resolvers streamline the process of consolidating and presenting data to end-users.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-appsync-pipeline-resolver-07-18-23-0807PM.png)

AWS AppSync is a managed service that makes it easy to build scalable APIs that connect applications to data. Developers use AppSync every day to build GraphQL APIs that interact with data sources like Amazon DynamoDB, AWS Lambda, and HTTP APIs. With AppSync, developers can write their resolvers using JavaScript, and run their code on AppSync’s APPSYNC_JS runtime.

Hence, the correct answer is: **Utilize AWS AppSync pipeline resolvers.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Launched AWS Lambda functions with an edge-optimized Amazon API Gateway** is incorrect because an edge-optimized API endpoint in API Gateway just leverages a CloudFront distribution to facilitate client access to improve connection time for geographically diverse clients. The solution is more on improving the connection time for the end-users instead of providing access to multiple DynamoDB tables as data sources.

- The option that says: **Set up DynamoDB connector for Amazon Athena Federated Query** is incorrect. Although Amazon Athena can allow the application to access multiple DynamoDB tables, it does not support write operations. Take note that the scenario explicitly mentioned that the goal is to enable efficient data input and retrieval. In addition, Athena Federated Query simply gives you the option to query the data in place or build pipelines that extract data from multiple data sources and store them in Amazon S3.

- The option that says: **Use CloudFront functions** is incorrect because CloudFront Functions are designed to perform lightweight processing of web requests such as Cache-key manipulations and normalization, URL rewrites & redirects, HTTP header manipulation, and Access authorization. CloudFront functions are not suitable for fetching data from multiple DynamoDB tables.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/appsync/latest/devguide/resolver-mapping-template-reference-dynamodb.html](https://docs.aws.amazon.com/appsync/latest/devguide/resolver-mapping-template-reference-dynamodb.html)
- [https://aws.amazon.com/blogs/mobile/appsync-pipeline-resolvers-2/](https://aws.amazon.com/blogs/mobile/appsync-pipeline-resolvers-2/)
- [https://aws.amazon.com/blogs/mobile/aws-appsync-pipeline-resolvers-and-functions-now-support-additional-array-methods-and-arrow-functions/](https://aws.amazon.com/blogs/mobile/aws-appsync-pipeline-resolvers-and-functions-now-support-additional-array-methods-and-arrow-functions/)

**Check out this AWS AppSync Cheat Sheet:**
- [https://tutorialsdojo.com/aws-appsync/](https://tutorialsdojo.com/aws-appsync/)

---

## Câu 9 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A Solutions Architect is working for a multinational telecommunications company. The IT Manager wants to consolidate their log streams including the access, application, and security logs in one single system. Once consolidated, the company will analyze these logs in real-time based on heuristics. There will be some time in the future where the company will need to validate heuristics, which requires going back to data samples extracted from the last 12 hours.

What is the best approach to meet this requirement?

### Các lựa chọn (Choices)
- [ ] **A.** First, set up an Auto Scaling group of EC2 servers then store the logs on Amazon S3 then finally, use EMR to apply heuristics on the logs.
- [ ] **B.** First, configure Amazon Cloud Trail to receive custom logs and then use EMR to apply heuristics on the logs.
- [x] **C.** First, send all of the log events to Amazon Kinesis then afterwards, develop a client process to apply heuristics on the logs.
- [ ] **D.** First, send all the log events to Amazon SQS then set up an Auto Scaling group of EC2 servers to consume the logs and finally, apply the heuristics.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** First, send all of the log events to Amazon Kinesis then afterwards, develop a client process to apply heuristics on the logs.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In this scenario, you need a service that can collect, process, and analyze data in real-time hence, the right service to use here is **Amazon Kinesis** .

Amazon Kinesis makes it easy to collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information. Amazon Kinesis offers key capabilities to cost-effectively process streaming data at any scale, along with the flexibility to choose the tools that best suit the requirements of your application.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/product-page-diagram_Amazon-Kinesis_Evolve-from-batch-to-real-time-Analytics.d7ed76be304a30be5720fd159469f157e7c09ede.png)

With Amazon Kinesis, you can ingest real-time data such as video, audio, application logs, website clickstreams, and IoT telemetry data for machine learning, analytics, and other applications. Amazon Kinesis enables you to process and analyze data as it arrives and responds instantly instead of having to wait until all your data is collected before the processing can begin.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- All other options are incorrect since these services do not have real-time processing capability, unlike Amazon Kinesis.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [https://aws.amazon.com/kinesis/](https://aws.amazon.com/kinesis/)

**Check out this Amazon Kinesis Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-kinesis/](https://tutorialsdojo.com/amazon-kinesis/)

---

## Câu 10 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A web application is hosted on an EC2 instance that processes sensitive financial information. The EC2 instance is launched in a private subnet, and all data is stored in an Amazon S3 bucket. Users access financial information over the Internet through pre-signed URLs generated by the web application. The company’s security team is concerned that internet connectivity to Amazon S3 poses a security risk.

In this scenario, what will you do to resolve this security vulnerability in the most cost-effective manner?

### Các lựa chọn (Choices)
- [ ] **A.** Change the web architecture to access the financial data in S3 through an interface VPC endpoint, which is powered by AWS PrivateLink.
- [x] **B.** Change the web architecture to access the financial data through a Gateway VPC Endpoint.
- [ ] **C.** Change the web architecture to access the financial data hosted in your S3 bucket by creating a custom VPC endpoint service.
- [ ] **D.** Change the web architecture to access the financial data in your S3 bucket through a VPN connection.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Change the web architecture to access the financial data through a Gateway VPC Endpoint.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Take note that your VPC lives within a larger AWS network and the services, such as S3, DynamoDB, RDS, and many others, are located outside of your VPC, but still within the AWS network. By default, the connection that your VPC uses to connect to your S3 bucket or any other service traverses the public Internet via your Internet Gateway.

A **VPC endpoint** enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other service does not leave the Amazon network.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-s3-vpc-endpoint.PNG)

There are two types of VPC endpoints: *interface endpoints* and *gateway endpoints*. You have to create the type of VPC endpoint required by the supported service.

An **interface endpoint** is an elastic network interface with a private IP address that serves as an entry point for traffic destined to a supported service. A **gateway endpoint** is a gateway that is a target for a specified route in your route table, used for traffic destined to a supported AWS service.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Interface-vs-Gateway-VPC-Endpoint.png)

Hence, the correct answer is: **Change the web architecture to access the financial data through a Gateway VPC Endpoint.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Changing the web architecture to access the financial data in your S3 bucket through a VPN connection** is incorrect because a VPN connection still goes through the public Internet. You have to use a VPC Endpoint in this scenario and not VPN, to privately connect your VPC to supported AWS services such as S3.

- The option that says: **Changing the web architecture to access the financial data hosted in your S3 bucket by creating a custom VPC endpoint service** is incorrect because a “VPC endpoint **service** ” is quite different from a “VPC endpoint”. With the VPC endpoint service, you are the service provider where you can primarily create your own application in your VPC and configure it as an AWS PrivateLink-powered service (referred to as an endpoint service). Other AWS principals can create a connection from their VPC to your endpoint service using an interface VPC endpoint.

- The option that says: **Changing the web architecture to access the financial data in S3 through an interface VPC endpoint, which is powered by AWS PrivateLink** is incorrect. Although you can use an Interface VPC Endpoint to satisfy the requirement, this type just entails an associated cost, unlike a Gateway VPC Endpoint. Remember that you won’t get billed if you use a Gateway VPC endpoint for your Amazon S3 bucket, unlike an Interface VPC endpoint that is billed for hourly usage and data processing charges. Take note that the scenario explicitly asks for the most cost-effective solution.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html](https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 11 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company has a web-based ticketing service that utilizes Amazon SQS and a fleet of EC2 instances. The EC2 instances that consume messages from the SQS queue are configured to poll the queue as often as possible to keep end-to-end throughput as high as possible. The Solutions Architect noticed that polling the queue in tight loops is using unnecessary CPU cycles, resulting in increased operational costs due to empty responses.

In this scenario, what should the Solutions Architect do to make the system more cost-effective?

### Các lựa chọn (Choices)
- [ ] **A.** Configure Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to zero.
- [ ] **B.** Configure Amazon SQS to use short polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero.
- [ ] **C.** Configure Amazon SQS to use short polling by setting the ReceiveMessageWaitTimeSeconds to zero.
- [x] **D.** Configure Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Configure Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In this scenario, the application is deployed in a fleet of EC2 instances that are polling messages from a single SQS queue. Amazon SQS uses short polling by default, querying only a subset of the servers (based on a weighted random distribution) to determine whether any messages are available for inclusion in the response. Short polling works for scenarios that require higher throughput. However, you can also configure the queue to use Long polling instead, to reduce cost.

The ReceiveMessageWaitTimeSeconds is the queue attribute that determines whether you are using Short or Long polling. By default, its value is zero which means it is using Short polling. If it is set to a value greater than zero, then it is Long polling.

Hence, **configuring Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero is the correct answer.**

Quick facts about SQS Long Polling:

– Long polling helps reduce your cost of using Amazon SQS by reducing the number of empty responses when there are no messages available to return in reply to a *ReceiveMessage* request sent to an Amazon SQS queue and eliminating false empty responses when messages are available in the queue but aren’t included in the response.

– Long polling reduces the number of empty responses by allowing Amazon SQS to wait until a message is available in the queue before sending a response. Unless the connection times out, the response to the `ReceiveMessage` request contains at least one of the available messages, up to the maximum number of messages specified in the `ReceiveMessage` action.

– Long polling eliminates false empty responses by querying all (rather than a limited number) of the servers. Long polling returns messages as soon any message becomes available.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 12 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company has multiple research departments that independently provision AWS resources for its projects. As resource usage continues to increase, the company wants to proactively monitor AWS service quota utilization and prevent unexpected disruptions caused by reaching service quota limits.

The solution must automatically monitor supported service quotas, notify cloud administrators when utilization approaches the configured thresholds, and minimize operational overhead. The company does not require automatic quota increases.

Which combination of actions should a Solutions Architect implement to meet these requirements? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Utilize the AWS managed rule on AWS Config to monitor AWS resource service quotas. Schedule this checking using an AWS Lambda function.
- [ ] **B.** Create an Amazon Simple Notification Service (Amazon SNS) topic and configure it as a target for notifications.
- [x] **C.** Enable AWS Service Quotas Automatic Management in Notify Only mode to continuously monitor supported service quota utilization and identify when configured thresholds are reached.
- [x] **D.** Configure AWS User Notifications with the preferred notification channels to alert cloud administrators when AWS Service Quotas Automatic Management detects quota utilization thresholds being reached.
- [ ] **E.** Query the AWS Trusted Advisor Service Limits check every 24 hours by calling the `DescribeTrustedAdvisorChecks` API operation. Ensure that your AWS account has a Business Support+ plan.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C, D**
> - **C.** Enable AWS Service Quotas Automatic Management in Notify Only mode to continuously monitor supported service quota utilization and identify when configured thresholds are reached.
> - **D.** Configure AWS User Notifications with the preferred notification channels to alert cloud administrators when AWS Service Quotas Automatic Management detects quota utilization thresholds being reached.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Service Quotas Automatic Management** helps organizations proactively monitor AWS service quota utilization and avoid unexpected operational disruptions. It automatically tracks usage patterns for supported service quotas and sends notifications when utilization approaches configured thresholds. This eliminates the need to develop and maintain custom monitoring solutions using AWS Lambda, Amazon EventBridge Scheduler, or AWS Trusted Advisor checks.

AWS Service Quotas Automatic Management supports two operating modes:

– Notify Only: Monitors supported service quota utilization and sends notifications when usage approaches configured thresholds without automatically requesting quota increases.

– Notify and Auto-Adjust: Monitors quota utilization, sends notifications, and automatically requests quota increases for eligible quotas when configured thresholds are reached.

Only service quotas with available usage metrics support Automatic Management. While both adjustable and non-adjustable quotas can be monitored, automatic quota adjustments are supported only for certain eligible quotas.

By enabling Automatic Management in Notify Only mode, administrators can receive quota utilization alerts through AWS Health Dashboard. AWS User Notifications can also be configured to deliver these alerts through preferred communication channels, such as email, chat applications, or the AWS Console Mobile Application. This provides centralized visibility into quota utilization without requiring custom monitoring scripts or scheduled Lambda functions.

![AWS Service Qouta Monitoring Workflow](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/TD-AWS-Service-Qouta-Monitoring-Workflow-10-12-2026.png)

For the given scenario, the company has multiple research departments that independently provision AWS resources. Since resource usage may increase unexpectedly, the company needs a proactive monitoring solution that identifies approaching service quota limits and notifies administrators before operational disruptions occur.

Enabling AWS Service Quotas Automatic Management in Notify Only mode provides automated monitoring for supported service quotas without requiring administrators to maintain custom scripts or monitoring infrastructure. Configuring AWS User Notifications ensures that quota utilization alerts are delivered through the preferred communication channels. Since the company does not require automatic quota increases, Notify Only mode is the most appropriate choice.

Hence, the correct answers are:

 **– Enable AWS Service Quotas Automatic Management in Notify Only mode to continuously monitor supported service quota utilization and identify when configured thresholds are reached.**

 **– Configure AWS User Notifications with the preferred notification channels to alert cloud administrators when AWS Service Quotas Automatic Management detects quota utilization thresholds being reached.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an Amazon Simple Notification Service (Amazon SNS) topic and configure it as a target for notifications** is incorrect. Although Amazon CloudWatch supports monitoring service quota utilization and sending alerts through Amazon SNS, this approach requires administrators to configure and maintain alarms for individual supported quotas. AWS Service Quotas Automatic Management provides a more streamlined monitoring solution that reduces administrative overhead.

- The option that says: **Query the AWS Trusted Advisor Service Limits check every 24 hours by calling the `DescribeTrustedAdvisorChecks` API operation. Ensure that your AWS account has a Business Support+ plan** is incorrect because although the Trusted Advisor APIs (AWS Support APIs) are available with a Business Support+ plan, this API only returns information about all available AWS Trusted Advisor checks, making it difficult to extract specific “service limits” data. Additionally, the API doesn’t directly provide a focused view on service limits, requiring extra steps to filter out irrelevant information, which complicates the process.

- The option that says: **Utilize the AWS managed rule on AWS Config to monitor AWS resource service quotas. Schedule this checking using an AWS Lambda function** is incorrect because AWS Config rules are primarily designed for compliance purposes rather than for real-time monitoring of quota usage. Additionally, depending on AWS Config adds both costs and complexity, as it requires a separate service to schedule and trigger these checks.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/servicequotas/latest/userguide/getting-started-auto-mgmt.html](https://docs.aws.amazon.com/servicequotas/latest/userguide/getting-started-auto-mgmt.html)
- [https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management-faq.html](https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management-faq.html)
- [https://docs.aws.amazon.com/servicequotas/latest/userguide/updating-automatic-management.html](https://docs.aws.amazon.com/servicequotas/latest/userguide/updating-automatic-management.html)
- [https://docs.aws.amazon.com/servicequotas/latest/userguide/eventbridge-integration.html](https://docs.aws.amazon.com/servicequotas/latest/userguide/eventbridge-integration.html)

**Check out these Amazon CloudWatch and AWS Trusted Advisor Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-cloudwatch/](https://tutorialsdojo.com/amazon-cloudwatch/)
- [https://tutorialsdojo.com/aws-trusted-advisor/](https://tutorialsdojo.com/aws-trusted-advisor/)

---

## Câu 13 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A data analytics startup is collecting clickstream data and stores them in an S3 bucket. You need to launch an AWS Lambda function to trigger the ETL jobs to run as soon as new data becomes available in Amazon S3.

Which of the following services can you use as an extract, transform, and load (ETL) service in this scenario?

### Các lựa chọn (Choices)
- [ ] **A.** S3 Select
- [ ] **B.** AWS Step Functions
- [x] **C.** AWS Glue
- [ ] **D.** Redshift Spectrum

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** AWS Glue

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Glue** is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. You can create and run an ETL job with a few clicks in the AWS Management Console. You simply point AWS Glue to your data stored on AWS, and AWS Glue discovers your data and stores the associated metadata (e.g., table definition and schema) in the AWS Glue Data Catalog. Once cataloged, your data is immediately searchable, queryable, and available for ETL. AWS Glue generates the code to execute your data transformations and data loading processes.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/product-page-diagram_Glue_Event-driven-ETL-Pipelines.e24d59bb79a9e24cdba7f43ffd234ec0482a60e2.png)

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [https://aws.amazon.com/glue/](https://aws.amazon.com/glue/)

**Check out this AWS Glue Cheat Sheet:**
- [https://tutorialsdojo.com/aws-glue/](https://tutorialsdojo.com/aws-glue/)

---

## Câu 14 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A top IT Consultancy has a VPC with two On-Demand EC2 instances with Elastic IP addresses. You were notified that the EC2 instances are currently under SSH brute force attacks over the Internet. The IT Security team has identified the IP addresses where these attacks originated. You have to immediately implement a temporary fix to stop these attacks while the team is setting up AWS WAF, GuardDuty, and AWS Shield Advanced to permanently fix the security vulnerability.

Which of the following provides the quickest way to stop the attacks to the instances?

### Các lựa chọn (Choices)
- [ ] **A.** Place the EC2 instances into private subnets
- [ ] **B.** Assign a static Anycast IP address to each EC2 instance
- [ ] **C.** Remove the Internet Gateway from the VPC
- [x] **D.** Block the IP addresses in the Network Access Control List

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Block the IP addresses in the Network Access Control List

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A **network access control list (ACL)** is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets. You might set up network ACLs with rules similar to your security groups in order to add an additional layer of security to your VPC.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/security-diagram.png)

The following are the basic things that you need to know about network ACLs:

 – Your VPC automatically comes with a modifiable default network ACL. By default, it allows all inbound and outbound IPv4 traffic and, if applicable, IPv6 traffic.

 – You can create a custom network ACL and associate it with a subnet. By default, each custom network ACL denies all inbound and outbound traffic until you add rules.

 – Each subnet in your VPC must be associated with a network ACL. If you don’t explicitly associate a subnet with a network ACL, the subnet is automatically associated with the default network ACL.

 – You can associate a network ACL with multiple subnets; however, a subnet can be associated with only one network ACL at a time. When you associate a network ACL with a subnet, the previous association is removed.

 – A network ACL contains a numbered list of rules that we evaluate in order, starting with the lowest numbered rule, to determine whether traffic is allowed in or out of any subnet associated with the network ACL. The highest number that you can use for a rule is 32766. We recommend that you start by creating rules in increments (for example, increments of 10 or 100) so that you can insert new rules where you need to later on.

 – A network ACL has separate inbound and outbound rules, and each rule can either allow or deny traffic.

 – Network ACLs are stateless; responses to allowed inbound traffic are subject to the rules for outbound traffic (and vice versa).

The scenario clearly states that it requires the **quickest** way to fix the security vulnerability. In this situation, you can manually block the offending IP addresses using Network ACLs since the IT Security team has already identified the list of offending IP addresses. Alternatively, you can set up a bastion host, however, this option entails additional time to properly set up as you have to configure the security configurations of your bastion host.

Hence, **blocking the IP addresses in the Network Access Control List** is the best answer since it can quickly resolve the issue by blocking the IP addresses using Network ACL.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Placing the EC2 instances into private subnets** is incorrect because if you deploy the EC2 instance in the private subnet without a public or EIP address, it would not be accessible over the Internet, even to you.

- **Removing the Internet Gateway from the VPC** is incorrect because doing this will also make your EC2 instance inaccessible to you as it will cut down the connection to the Internet.

- **Assigning a static Anycast IP address to each EC2 instance** is incorrect because a static Anycast IP address is primarily used by AWS Global Accelerator to enable organizations to route traffic seamlessly to multiple regions and improve availability and performance for their end-users.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Security.html](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Security.html)

**Security Group vs. NACL:**
- [https://tutorialsdojo.com/security-group-vs-nacl/](https://tutorialsdojo.com/security-group-vs-nacl/)

---

## Câu 15 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company needs to use Amazon S3 to store irreproducible financial documents. For their quarterly reporting, the files are required to be retrieved after a period of 3 months. There will be some occasions when a surprise audit will be held, which requires access to the archived data that they need to present immediately.

What will you do to satisfy this requirement in a cost-effective way?

### Các lựa chọn (Choices)
- [ ] **A.** Use Amazon S3 Standard
- [x] **B.** Use Amazon S3 Standard – Infrequent Access
- [ ] **C.** Use Amazon Glacier Deep Archive
- [ ] **D.** Use Amazon S3 -Intelligent Tiering

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use Amazon S3 Standard – Infrequent Access

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In this scenario, the requirement is to have a storage option that is cost-effective and has the ability to access or retrieve the archived data immediately. The cost-effective options are Amazon Glacier Deep Archive and Amazon S3 Standard- Infrequent Access (Standard – IA). However, the former option is not designed for rapid retrieval of data which is required for the surprise audit.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- Hence, **using Amazon Glacier Deep Archive** is incorrect and the best answer is to **use Amazon S3 Standard – Infrequent Access** .

- ![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/s3-object-storage.png)

- **Using Amazon S3 Standard** is incorrect because the standard storage class is not cost-efficient in this scenario. It costs more than Glacier Deep Archive and S3 Standard – Infrequent Access.

- **Using Amazon S3 -Intelligent Tiering** is incorrect because the Intelligent Tiering storage class entails an additional fee for monitoring and automation of each object in your S3 bucket vs. the Standard storage class and S3 Standard – Infrequent Access.

- Amazon S3 Standard – Infrequent Access is an Amazon S3 storage class for data that is accessed less frequently but requires rapid access when needed. Standard – IA offers the high durability, throughput, and low latency of Amazon S3 Standard, with a low per GB storage price and per GB retrieval fee.

- This combination of low cost and high performance makes Standard – IA ideal for long-term storage, backups, and as a data store for disaster recovery. The Standard – IA storage class is set at the object level and can exist in the same bucket as Standard, allowing you to use lifecycle policies to automatically transition objects between storage classes without any application changes.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/s3/storage-classes/](https://aws.amazon.com/s3/storage-classes/)
- [https://aws.amazon.com/s3/faqs/](https://aws.amazon.com/s3/faqs/)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

**S3 Standard vs S3 Standard-IA vs S3 One Zone IA vs S3 Intelligent Tiering:**
- [https://tutorialsdojo.com/s3-standard-vs-s3-standard-ia-vs-s3-one-zone-ia/](https://tutorialsdojo.com/s3-standard-vs-s3-standard-ia-vs-s3-one-zone-ia/)

---

## Câu 16 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has a UAT and production EC2 instances running on AWS. They want to ensure that employees who are responsible for the UAT instances don’t have access to work on the production instances to minimize security risks.

Which of the following would be the best way to achieve this?

### Các lựa chọn (Choices)
- [ ] **A.** Launch the UAT and production instances in different Availability Zones and use Multi Factor Authentication.
- [ ] **B.** Launch the UAT and production EC2 instances in separate VPC's connected by VPC peering.
- [x] **C.** Define the tags on the UAT and production servers and add a condition to the IAM policy which allows access to specific tags.
- [ ] **D.** Provide permissions to the users via the AWS Resource Access Manager (RAM) service to only access EC2 instances that are used for production or development.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Define the tags on the UAT and production servers and add a condition to the IAM policy which allows access to specific tags.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
For this scenario, the best way to achieve the required solution is to use a combination of Tags and IAM policies. You can define the tags on the UAT and production EC2 instances and add a condition to the IAM policy which allows access to specific tags.

Tags enable you to categorize your AWS resources in different ways, for example, by purpose, owner, or environment. This is useful when you have many resources of the same type — you can quickly identify a specific resource based on the tags you’ve assigned to it.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Tag_Example.png)

By default, IAM users don’t have permission to create or modify Amazon EC2 resources or perform tasks using the Amazon EC2 API. (This means that they also can’t do so using the Amazon EC2 console or CLI.) To allow IAM users to create or modify resources and perform tasks, you must create IAM policies that grant IAM users permission to use the specific resources and API actions they’ll need and then attach those policies to the IAM users or groups that require those permissions.

Hence, the correct answer is:* * **Define the tags on the UAT and production servers and add a condition to the IAM policy which allows access to specific tags.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: *** *Launch the UAT and production EC2 instances in separate VPC’s connected by VPC peering** is incorrect because these are just network changes to your cloud architecture and don’t have any effect on the security permissions of your users to access your EC2 instances.

- The option that says: **Provide permissions to the users via the AWS Resource Access Manager (RAM) service to only access EC2 instances that are used for production or development** is incorrect because the AWS Resource Access Manager (RAM) is primarily used to securely share your resources across AWS accounts or within your Organization and not on a single AWS account. You also have to set up a custom IAM Policy in order for this to work.

- The option that says: **Launch the UAT and production instances in different Availability Zones and use Multi Factor Authentication** is incorrect because placing the EC2 instances to different AZs will only improve the availability of the systems but won’t have any significance in terms of security. You have to set up an IAM Policy that allows access to EC2 instances based on their tags. In addition, a Multi-Factor Authentication is not a suitable security feature to be implemented for this scenario.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policies-for-amazon-ec2.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policies-for-amazon-ec2.html)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 17 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A leading e-commerce company is in need of a storage solution that can be simultaneously accessed by 1000 Linux servers in multiple availability zones. The servers are hosted in EC2 instances that use a hierarchical directory structure via the NFSv4 protocol. The service should be able to handle the rapidly changing data at scale while still maintaining high performance. It should also be highly durable and highly available whenever the servers will pull data from it, with little need for management.

As the Solutions Architect, which of the following services is the most cost-effective choice that you should use to meet the above requirement?

### Các lựa chọn (Choices)
- [x] **A.** Amazon EFS
- [ ] **B.** Amazon FSx for Windows File Server
- [ ] **C.** Amazon S3
- [ ] **D.** Amazon EBS

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Amazon EFS

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon Web Services (AWS) offers cloud storage services to support a wide range of storage workloads such as EFS, S3, and EBS. You have to understand when you should use Amazon EFS, Amazon S3, and Amazon Elastic Block Store (EBS) based on the specific workloads. In this scenario, the keywords are * **rapidly changing data** * and 1000 Linux servers.

Amazon EFS is a file storage service for use with Amazon EC2. Amazon EFS provides a file system interface, file system access semantics (such as strong consistency and file locking), and concurrently-accessible storage for **up to thousands of Amazon EC2 instances** . EFS provides the same level of high availability and high scalability like S3 however, this service is more suitable for scenarios where it is required to have a POSIX-compatible file system or if you are storing rapidly changing data.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/product-page-diagram-Amazon-EFS-Launch_How-It-Works.cf947858f0ef3557b9fc14077bdf3f65b3f9ff43.png)

Data that must be updated very frequently might be better served by storage solutions that take into account read and write latencies, such as Amazon EBS volumes, Amazon RDS, Amazon DynamoDB, Amazon EFS, or relational databases running on Amazon EC2.

Amazon EBS is a block-level storage service for use with Amazon EC2. Amazon EBS can deliver performance for workloads that require the lowest-latency access to data from a single EC2 instance.

Amazon S3 is an object storage service. Amazon S3 makes data available through an Internet API that can be accessed anywhere.

In this scenario, **Amazon EFS** is the best answer. As stated above, Amazon EFS provides a file system interface, file system access semantics (such as strong consistency and file locking), and concurrently-accessible storage for **up to thousands of Amazon EC2 instances** . EFS provides the performance, durability, high availability, and storage capacity needed by the 1000 Linux servers in the scenario.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon S3** is incorrect. Although this provides the same level of high availability and high scalability like EFS, this service is not suitable for storing data that is rapidly changing, just as mentioned in the above explanation. It is still more effective to use EFS as it offers strong consistency and file locking, which the S3 service lacks.

- **Amazon EBS** is incorrect because an EBS Volume cannot be shared by multiple instances.

- **Amazon FSx for Windows File Server** is incorrect. Although this storage service can be connected to multiple EC2 instances, it is still constrained to Windows OS only. Take note that the scenario mentions that the Amazon EC2 instances are Linux servers and not Windows machines.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html](https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html)
- [https://aws.amazon.com/efs/features/](https://aws.amazon.com/efs/features/)
- [https://d1.awsstatic.com/whitepapers/AWS%20Storage%20Services%20Whitepaper-v9.pdf#page=9](https://d1.awsstatic.com/whitepapers/AWS%20Storage%20Services%20Whitepaper-v9.pdf#page=9)

**Check out this Amazon EFS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-efs/](https://tutorialsdojo.com/amazon-efs/)

---

## Câu 18 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A financial company wants to store its data in Amazon S3 while also keeping frequently accessed data locally on its on-premises server. The company does not have the option to extend its on-premises storage, so it is looking for a durable and scalable storage service to use in AWS.

What is the best solution for this scenario?

### Các lựa chọn (Choices)
- [x] **A.** Use AWS Storage Gateway – Cached Volumes.
- [ ] **B.** Use a fleet of Amazon EC2 instances with Amazon EBS volumes to store the commonly used data.
- [ ] **C.** Use Amazon Glacier.
- [ ] **D.** Use Amazon ElastiCache with a lazy loading (cache-aside) pattern while storing the primary data in S3.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Use AWS Storage Gateway – Cached Volumes.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
By using **Cached volumes** , you store your data in Amazon S3 and retain a copy of frequently accessed data subsets locally in your on-premises network. Cached volumes offer substantial cost savings on primary storage and minimize the need to scale your storage on-premises. You also retain low-latency access to your frequently accessed data. This is the best solution for this scenario.

![Storage Gateway cached volumes](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-storage-gateway-cached-volumes-24Sept2024.png)

Cached volumes are designed for hybrid storage environments where organizations want to extend their local infrastructure to the cloud without expanding their on-premises storage capacity. Since the primary data resides in Amazon S3, the company benefits from highly durable and scalable cloud storage while the local cache ensures fast access to frequently used datasets.

Hence, the correct answer is: **Use AWS Storage Gateway – Cached Volumes.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use a fleet of Amazon EC2 instances with Amazon EBS volumes to store the commonly used data** is incorrect because an EC2 instance is simply not a storage service, and it does not provide the required durability and scalability.

- The option that says: **Use Amazon ElastiCache with a lazy loading (cache-aside) pattern while storing the primary data in S3** is incorrect because ElastiCache is designed for application-level in-memory caching only, not for providing local storage access to on-premises servers.

- The option that says: **Use Amazon Glacier** is incorrect because Glacier is primarily designed for archival and long-term storage with high retrieval latency, not for frequently accessed data or on-premises caching.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/storagegateway/faqs/](https://aws.amazon.com/storagegateway/faqs/)
- [https://docs.aws.amazon.com/storagegateway/](https://docs.aws.amazon.com/storagegateway/)
- [https://docs.aws.amazon.com/storagegateway/latest/vgw/WhatIsStorageGateway.html](https://docs.aws.amazon.com/storagegateway/latest/vgw/WhatIsStorageGateway.html)

**Check out this AWS Storage Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-storage-gateway/](https://tutorialsdojo.com/aws-storage-gateway/)

---

## Câu 19 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company plans to deploy a Docker-based batch application in AWS. The application will be used to process both mission-critical data and non-essential batch jobs.

Which of the following is the most cost-effective option to use in implementing this architecture?

### Các lựa chọn (Choices)
- [ ] **A.** Use Amazon ECS as the container management service, then set up Reserved Amazon EC2 Instances for processing both mission-critical and non-essential batch jobs.
- [ ] **B.** Use Amazon ECS as the container management service, then set up On-Demand Amazon EC2 Instances for processing both mission-critical and non-essential batch jobs.
- [ ] **C.** Use Amazon ECS as the container management service, then set up Spot Amazon EC2 Instances for processing both mission-critical and non-essential batch jobs.
- [x] **D.** Use Amazon ECS as the container management service, then set up a combination of Reserved and Spot Amazon EC2 Instances for processing mission-critical and non-essential batch jobs, respectively.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Use Amazon ECS as the container management service, then set up a combination of Reserved and Spot Amazon EC2 Instances for processing mission-critical and non-essential batch jobs, respectively.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon ECS** lets you run batch workloads with managed or custom schedulers on Amazon EC2 On-Demand Instances, Reserved Instances, or Spot Instances. You can launch a combination of EC2 instances to set up a cost-effective architecture depending on your workload. You can launch Reserved EC2 instances to process the mission-critical data and Spot EC2 instances for processing non-essential batch jobs.

There are two different charge models for Amazon Elastic Container Service (ECS): Fargate Launch Type Model and EC2 Launch Type Model. With Fargate, you pay for the amount of vCPU and memory resources that your containerized application requests while for EC2 launch type model, there is no additional charge. You pay for AWS resources (e.g., EC2 instances or EBS volumes) you create to store and run your application. You only pay for what you use, as you use it; there are no minimum fees and no upfront commitments.

![Amazon ECS](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Amazon ECS -12MAR2026.png)

In this scenario, the most cost-effective solution is to use ECS as the container management service, then set up a combination of Reserved Instances for mission-critical processing and Spot EC2 Instances for non-essential batch jobs.

Reserved Instances offer considerable savings on your Amazon EC2 costs when compared to On-Demand Instance pricing. It’s important to note that Reserved Instances are not physical instances; they are a billing discount applied to the usage of On-Demand Instances within your account. To take advantage of this discount, the On-Demand Instances must match specific attributes, such as instance type and region.

Hence, the correct answer is: **Use Amazon ECS as the container management service, then set up a combination of Reserved and Spot Amazon EC2 Instances for processing mission-critical and non-essential batch jobs, respectively.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use Amazon ECS as the container management service, then set up Reserved Amazon EC2 Instances for processing both mission-critical and non-essential batch jobs** is incorrect because processing the non-essential batch jobs can be handled much cheaper by using Spot EC2 instances instead of Reserved Instances.

- The option that says: **Use Amazon ECS as the container management service, then set up On-Demand Amazon EC2 Instances for processing both mission-critical and non-essential batch jobs** is incorrect because an On-Demand instance costs more compared to Reserved and Spot EC2 instances. Processing the non-essential batch jobs can be handled much cheaper by using Spot EC2 instances instead of On-Demand instances.

- The option that says: **Use Amazon ECS as the container management service, then set up Spot Amazon EC2 Instances for processing both mission-critical and non-essential batch jobs** is incorrect. Although this setup provides the cheapest solution among other options, it will not be able to meet the required workload. Using Spot instances to process mission-critical workloads is not suitable since these types of instances can be terminated by AWS at any time, which can affect critical processing.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
- [https://aws.amazon.com/ec2/spot/containers-for-less/get-started/](https://aws.amazon.com/ec2/spot/containers-for-less/get-started/)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-reserved-instances.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-reserved-instances.html)

**Check out this Amazon ECS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-container-service-amazon-ecs/](https://tutorialsdojo.com/amazon-elastic-container-service-amazon-ecs/)

---

## Câu 20 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A data analytics company keeps a massive volume of data stored in its on-premises data center. The company uses AWS PrivateLink through a VPC endpoint to establish private connectivity to AWS services.

To scale its storage systems, the company looking for cloud-backed storage volumes that can be mounted using Internet Small Computer System Interface (iSCSI) devices from its on-premises application servers. Its on-site data analytics application frequently accesses the latest data subsets locally, while older data is rarely accessed. The solution must minimize the need to scale the on-premises storage infrastructure while still providing the application with low-latency access to the data.

Which type of AWS Storage Gateway solution should be used to meet the above requirements?

### Các lựa chọn (Choices)
- [x] **A.** Volume Gateway in cached mode
- [ ] **B.** Tape Gateway
- [ ] **C.** File Gateway
- [ ] **D.** Volume Gateway in stored mode

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Volume Gateway in cached mode

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The **Volume Gateway** is a cloud-based iSCSI block storage volume for your on-premises applications. The Volume Gateway provides either a local cache or full volumes on-premises while also storing full copies of your volumes in the AWS cloud.

![AWS Volume Gateway stored mode and cache mode](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-volume-gateway-stored-&-cache-mode.jpg)

There are two options for Volume Gateway:

 **Cached Volumes** – you store volume data in AWS, with a small portion of recently accessed data in the cache on-premises.

 **Stored Volumes** – you store the entire set of volume data on-premises and store periodic point-in-time backups (snapshots) in AWS.

In this scenario, the technology company is looking for a storage service that will enable their analytics application to frequently access the latest data subsets and not the entire data set (as it was mentioned that the old data are rarely being used). This requirement can be fulfilled by setting up a Cached Volume Gateway in AWS Storage Gateway.

By using cached volumes, you can use Amazon S3 as your primary data storage while retaining frequently accessed data locally in your storage gateway. Cached volumes minimize the need to scale your on-premises storage infrastructure while still providing your applications with low-latency access to frequently accessed data. You can create storage volumes up to 32 TiB in size and afterward, attach these volumes as iSCSI devices to your on-premises application servers. When you write to these volumes, your gateway stores the data in Amazon S3. It retains the recently read data in your on-premises storage gateway’s cache and uploads buffer storage.

Cached volumes can range from 1 GiB to 32 TiB in size and must be rounded to the nearest GiB. Each gateway configured for cached volumes can support up to 32 volumes for a total maximum storage volume of 1,024 TiB (1 PiB).

In the cached volumes solution, AWS Storage Gateway stores all your on-premises application data in a storage volume in Amazon S3.

Hence, the correct answer is: **Volume Gateway in cached mode.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Volume Gateway in stored mode** is incorrect because the requirement is to provide low latency access to the frequently accessed data subsets locally. Stored Volumes are used if you need low-latency access to your entire dataset.

- **Tape Gateway** is incorrect because this is just a cost-effective, durable, long-term offsite alternative for data archiving, which is not needed in this scenario.

- **File Gateway** is incorrect because the scenario requires you to mount volumes as iSCSI devices. File Gateway is used to store and retrieve Amazon S3 objects through NFS and SMB protocols.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html#volume-gateway-concepts](https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html#volume-gateway-concepts)
- [https://docs.aws.amazon.com/storagegateway/latest/userguide/WhatIsStorageGateway.html](https://docs.aws.amazon.com/storagegateway/latest/userguide/WhatIsStorageGateway.html)

**Check out this AWS Storage Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-storage-gateway/](https://tutorialsdojo.com/aws-storage-gateway/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c03/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c03/)

---

## Câu 21 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company deployed a web application that stores static assets in an Amazon Simple Storage Service (S3) bucket. The Solutions Architect expects the S3 bucket to immediately receive over 2000 PUT requests and 3500 GET requests per second at peak hour.

What should the Solutions Architect do to ensure optimal performance?

### Các lựa chọn (Choices)
- [ ] **A.** Use a predictable naming scheme in the key names such as sequential numbers or date time sequences.
- [ ] **B.** Add a random prefix to the key names.
- [ ] **C.** Use Byte-Range Fetches to retrieve multiple ranges of an object data per GET request.
- [x] **D.** Do nothing. Amazon S3 will automatically manage performance at this scale.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Do nothing. Amazon S3 will automatically manage performance at this scale.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon S3 now provides increased performance to support at least 3,500 requests per second to add data and 5,500 requests per second to retrieve data, which can save significant processing time for no additional charge. Each S3 prefix can support these request rates, making it simple to increase performance significantly.

Applications running on Amazon S3 today will enjoy this performance improvement with no changes, and customers building new applications on S3 do not have to make any application customizations to achieve this performance. Amazon S3’s support for parallel requests means you can scale your S3 performance by the factor of your compute cluster without making any customizations to your application. Performance scales per prefix, so you can use as many prefixes as you need in parallel to achieve the required throughput. There are no limits to the number of prefixes.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/S3BatchOperationsHowitworks.99e5996f5d9dc4648160489412900a2106d1673c.png)

This S3 request rate performance increase removes any previous guidance to randomize object prefixes to achieve faster performance. That means you can now use logical or sequential naming patterns in S3 object naming without any performance implications. This improvement is now available in all AWS Regions.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Using Byte-Range Fetches to retrieve multiple ranges of an object data per GET request** is incorrect. Although a Byte-Range Fetch helps you achieve higher aggregate throughput, Amazon S3 does **not** support retrieving multiple ranges of data per GET request. Using the Range HTTP header in a GET Object request, you can fetch a byte range from an object, transferring only the specified portion. You can use concurrent connections to Amazon S3 to fetch different byte ranges from within the same object. Fetching smaller ranges of a large object also allows your application to improve retry times when requests are interrupted.

- **Adding a random prefix to the key names** is incorrect. Adding a random prefix is not required in this scenario because S3 can now scale automatically to adjust performance. You do not need to add a random prefix anymore for this purpose since S3 has increased performance to support at least 3,500 requests per second to add data and 5,500 requests per second to retrieve data, which covers the workload in the scenario.

- **Using a predictable naming scheme in the key names such as sequential numbers or date time sequences** is incorrect because Amazon S3 already maintains an index of object key names in each AWS region. S3 stores key names in alphabetical order. The key name dictates which partition the key is stored in. Using a sequential prefix increases the likelihood that Amazon S3 will target a specific partition for a large number of your keys, overwhelming the I/O capacity of the partition.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/request-rate-perf-considerations.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/request-rate-perf-considerations.html)
- [https://d1.awsstatic.com/whitepapers/AmazonS3BestPractices.pdf](https://d1.awsstatic.com/whitepapers/AmazonS3BestPractices.pdf)
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/GettingObjectsUsingAPIs.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/GettingObjectsUsingAPIs.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 22 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
Amazon Elastic Kubernetes Service (Amazon EKS) with IAM Role for Service Accounts (IRSA) is used by an e-commerce company to deploy and manage its containerized applications. The website experiences a surge in traffic around the holidays, which significantly adds to the effort. The goal is to ensure that its underlying infrastructure automatically scales in and out in response to demand.

Which of the following would meet the requirements with the LEAST amount of operational overhead? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** Install the Kubernetes Metrics Server on the EKS cluster and activate the Horizontal Pod Autoscaling.
- [ ] **B.** Use Amazon CloudWatch Alarms to trigger scaling for containerized applications.
- [ ] **C.** Install the Kubernetes Metrics Server on the EKS cluster and activate Vertical Pod Autoscaler.
- [ ] **D.** Enable the Cluster Autoscaler for EKS to automatically manage the number of nodes based on the resource needs of the pods.
- [x] **E.** Set up Karpenter to automatically adjust the number of nodes in the EKS cluster when pods fail or are rescheduled onto other nodes.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, E**
> - **A.** Install the Kubernetes Metrics Server on the EKS cluster and activate the Horizontal Pod Autoscaling.
> - **E.** Set up Karpenter to automatically adjust the number of nodes in the EKS cluster when pods fail or are rescheduled onto other nodes.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The Kubernetes Horizontal Pod Autoscaler automatically scales the number of Pods in a deployment, replication controller, or replica set based on that resource’s CPU utilization. This can help your applications scale out to meet increased demand or scale in when resources are not needed, thus freeing up your nodes for other applications. When you set a target CPU utilization percentage, the Horizontal Pod Autoscaler scales your application in or out to try to meet that target.

![Horizontal Pod Autoscaler](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/horizontal-pad-autoscaler-072623-0703PM.png)

Autoscaling is a function that automatically scales your resources up or down to meet changing demands. This is a major Kubernetes function that would otherwise require extensive human resources to perform manually.

Amazon EKS supports two autoscaling products:

– Karpenter

– Cluster Autoscaler

The Kubernetes Cluster Autoscaler automatically adjusts the number of nodes in your cluster when pods fail or are rescheduled onto other nodes. The Cluster Autoscaler uses Auto Scaling groups.

![Kubernetes Cluster Autoscaler](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/eks-072623-0752pm.png)

Karpenter is a flexible, high-performance Kubernetes cluster autoscaler that launches appropriately sized compute resources, like Amazon EC2 instances, in response to changing application load. It integrates with AWS to provision compute resources that precisely match workload requirements.

Hence, the correct answers are:

 **–** **Install the Kubernetes Metrics Server on the EKS cluster and activate the Horizontal Pod Autoscaling.**

 **– ** **Set up Karpenter to automatically adjust the number of nodes in the EKS cluster when pods fail or are rescheduled onto other nodes.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Install the Kubernetes Metrics Server on the EKS cluster and activate Vertical Pod Autoscaler ** is incorrect. The scenario in the given question explicitly mentions “scale in and out,” which is associated with horizontal scaling. Vertical scaling (scale up and down) is not relevant here. The correct approach should primarily focus on horizontal scaling solutions like Amazon EKS Cluster AutoScaler and Amazon EKS Horizontal Pod Autoscaler to handle automatic scaling of both the underlying infrastructure (nodes) and application pods based on demand.

- The option that says: **Use Amazon CloudWatch Alarms to trigger scaling for containerized applications** is incorrect. Although this approach adds some level of automation, it lacks the dynamic response required to handle rapidly changing traffic patterns. The delay between the alarm trigger and the scaling action could only lead to performance issues during traffic surges.

- The option that says: **Enable the Cluster Autoscaler for EKS to automatically manage the number of nodes based on the resource needs of the pods** is incorrect. The Cluster Autoscaler is a native Kubernetes tool typically used for scaling the number of nodes in an EKS cluster. While it does help manage node resources, it is generally slower to respond to changes in demand compared to Karpenter, and it may require more manual configuration and tuning. Karpenter optimizes node utilization by dynamically selecting instance types and provisioning them based on workload requirements, thus reducing operational overhead. Cluster Autoscaler, while effective, may not reduce operational overhead to the same extent, especially when compared with the automatic and responsive nature of Karpenter.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/eks/latest/userguide/horizontal-pod-autoscaler.html](https://docs.aws.amazon.com/eks/latest/userguide/horizontal-pod-autoscaler.html)
- [https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html](https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html)

**Check out this Amazon EKS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/](https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/)

---

## Câu 23 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A social media company needs to capture the detailed information of all HTTP requests that went through its public-facing Application Load Balancer every five minutes. The client’s IP address and network latencies must also be tracked, while the load balancer’s availability is monitored separately through the ELB health check. The captured data should be used for analyzing traffic patterns and for troubleshooting Docker applications orchestrated by the Amazon ECS Anywhere service.

Which of the following options meets the customer requirements with the LEAST amount of overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Enable AWS CloudTrail for their Application Load Balancer. Use the CloudTrail Lake to analyze and troubleshoot the application traffic.
- [ ] **B.** Install and run the AWS X-Ray daemon on the ECS cluster. Use the Amazon CloudWatch ServiceLens to analyze the traffic that goes through the application.
- [ ] **C.** Integrate Amazon EventBridge metrics on the Application Load Balancer to capture the client IP address. Use Amazon CloudWatch `GetMetricData` to retrieve and analyze traffic-related metrics.
- [x] **D.** Enable access logs on the Application Load Balancer. Integrate the ECS cluster with Amazon CloudWatch Application Insights to analyze traffic patterns and simplify troubleshooting.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Enable access logs on the Application Load Balancer. Integrate the ECS cluster with Amazon CloudWatch Application Insights to analyze traffic patterns and simplify troubleshooting.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon CloudWatch Application Insights** facilitates observability for your applications and underlying AWS resources. It helps you set up the best monitors for your application resources to continuously analyze data for signs of problems with your applications. Application Insights, which is powered by SageMaker and other AWS technologies, provides automated dashboards that show potential problems with monitored applications, which help you to quickly isolate ongoing issues with your applications and infrastructure. The enhanced visibility into the health of your applications that Application Insights provides helps reduce the “mean time to repair” (MTTR) to troubleshoot your application issues.

![Amazon CloudWatch Applications Insights](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-cloudwatch-application-insights.png)

When you add your applications to Amazon CloudWatch Application Insights, it scans the resources in the applications and recommends and configures metrics and logs on CloudWatch for application components. Example application components include SQL Server backend databases and Microsoft IIS/Web tiers. Application Insights analyzes metric patterns using historical data to detect anomalies and continuously detects errors and exceptions from your application, operating system, and infrastructure logs. It correlates these observations using a combination of classification algorithms and built-in rules. Then, it automatically creates dashboards that show the relevant observations and problem severity information to help you prioritize your actions.

 **Elastic Load Balancing** provides **access logs** that capture detailed information about requests sent to your load balancer. Each log contains information such as the time the request was received, the client’s IP address, latencies, request paths, and server responses. You can use these access logs to analyze traffic patterns and troubleshoot issues.

![ELB access logs](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/td-elb-access-logs.png)

Access logging is an optional feature of Elastic Load Balancing that is disabled by default. After you enable access logging for your load balancer, Elastic Load Balancing captures the logs and stores them in the Amazon S3 bucket that you specify as compressed files. You can disable access logging at any time.

Hence, the correct answer is: **Enable access logs on the Application Load Balancer. Integrate the ECS cluster with Amazon CloudWatch Application Insights to analyze traffic patterns and simplify troubleshooting.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Enable AWS CloudTrail for their Application Load Balancer. Use the CloudTrail Lake to analyze and troubleshoot the application traffic** is incorrect because AWS CloudTrail is primarily used to monitor and record the account activity across your AWS resources and not your web applications. You cannot use CloudTrail to capture the detailed information of all HTTP requests that go through your public-facing Application Load Balancer (ALB). CloudTrail can only track the resource changes made to your ALB, but not the actual IP traffic that goes through it. For this use case, you have to enable the access logs feature instead. In addition, the AWS CloudTrail Lake feature is more suitable for running SQL-based queries on your API events and not for analyzing application traffic.

- The option that says: **Install and run the AWS X-Ray daemon on the ECS cluster. Use the Amazon CloudWatch ServiceLens to analyze the traffic that goes through the application** is incorrect. Although this solution is possible, this won’t track the client’s IP address since the access log feature in the ALB is not enabled. Take note that the scenario explicitly mentioned that the client’s IP address and network latencies must also be tracked.

- The option that says: **Integrate Amazon EventBridge metrics on the Application Load Balancer to capture the client IP address. Use Amazon CloudWatch `GetMetricData` to retrieve and analyze traffic-related metrics** is incorrect because EventBridge is not designed to capture detailed HTTP request data like client IPs. Instead, ALB access logs should be enabled to capture such information. Additionally, CloudWatch `GetMetricData` only retrieves pre-existing metrics rather than capturing real-time request-level data such as client IP addresses or latencies, which are essential for the customer’s requirements.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-application-insights.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-application-insights.html)
- [http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html](http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html)
- [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-monitoring.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-monitoring.html)

**Check out this AWS Elastic Load Balancing (ELB) Cheat Sheet:**
- [https://tutorialsdojo.com/aws-elastic-load-balancing-elb/](https://tutorialsdojo.com/aws-elastic-load-balancing-elb/)

**Application Load Balancer vs Network Load Balancer vs Gateway Load Balancer:**
- [https://tutorialsdojo.com/application-load-balancer-vs-network-load-balancer-vs-classic-load-balancer/](https://tutorialsdojo.com/application-load-balancer-vs-network-load-balancer-vs-classic-load-balancer/)

---

## Câu 24 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has an On-Demand EC2 instance with an attached EBS volume. There is a scheduled job that creates a snapshot of this EBS volume every midnight at 12 AM when the instance is not used. One night, there has been a production incident where you need to perform a change on both the instance and on the EBS volume at the same time when the snapshot is currently taking place.

Which of the following scenario is true when it comes to the usage of an EBS volume while the snapshot is in progress?

### Các lựa chọn (Choices)
- [x] **A.** The EBS volume can be used while the snapshot is in progress.
- [ ] **B.** The EBS volume cannot be detached or attached to an EC2 instance until the snapshot completes
- [ ] **C.** The EBS volume cannot be used until the snapshot completes.
- [ ] **D.** The EBS volume can be used in read-only mode while the snapshot is in progress.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** The EBS volume can be used while the snapshot is in progress.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Snapshots occur asynchronously; the point-in-time snapshot is created immediately, but the status of the snapshot is `pending` until the snapshot is complete (when all of the modified blocks have been transferred to Amazon S3), which can take several hours for large initial snapshots or subsequent snapshots where many blocks have changed.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/CreateSnapshots.png)

While it is completing, an in-progress snapshot is not affected by ongoing reads and writes to the volume hence, you can still use the EBS volume normally.

When you create an EBS volume based on a snapshot, the new volume begins as an exact replica of the original volume that was used to create the snapshot. The replicated volume loads data lazily in the background so that you can begin using it immediately. If you access data that hasn’t been loaded yet, the volume immediately downloads the requested data from Amazon S3 and then continues loading the rest of the volume’s data in the background.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-snapshot.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-snapshot.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)

**Check out this Amazon EBS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)

---

## Câu 25 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company plans to use Route 53 instead of an ELB to load balance the incoming request to the web application. The system is deployed to two EC2 instances to which the traffic needs to be distributed. You want to set a specific percentage of traffic to go to each instance.

Which routing policy would you use?

### Các lựa chọn (Choices)
- [ ] **A.** Failover
- [ ] **B.** Geolocation
- [x] **C.** Weighted
- [ ] **D.** Latency

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Weighted

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Weighted routing** lets you associate multiple resources with a single domain name (tutorialsdojo.com) or subdomain name (portal.tutorialsdojo.com) and choose how much traffic is routed to each resource. This can be useful for a variety of purposes including load balancing and testing new versions of software. You can set a specific percentage of how much traffic will be allocated to the resource by specifying the weights.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS-Route53-Weighted.PNG)

For example, if you want to send a tiny portion of your traffic to one resource and the rest to another resource, you might specify weights of 1 and 255. The resource with a weight of 1 gets 1/256th of the traffic (1/1+255), and the other resource gets 255/256ths (255/1+255).

You can gradually change the balance by changing the weights. If you want to stop sending traffic to a resource, you can change the weight for that record to 0.

Hence, the correct answer is **Weighted.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Latency** is incorrect because you cannot set a specific percentage of traffic for the 2 EC2 instances with this routing policy. Latency routing policy is primarily used when you have resources in multiple AWS Regions and if you need to automatically route traffic to a specific AWS Region that provides the best latency with less round-trip time.

- **Failover** is incorrect because this type is commonly used if you want to set up an active-passive failover configuration for your web application.

- **Geolocation** is incorrect because this is more suitable for routing traffic based on the location of your users, and not for distributing a specific percentage of traffic to two AWS resources.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html)

**Check out this Amazon Route 53 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-route-53/](https://tutorialsdojo.com/amazon-route-53/)

---

## Câu 26 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company has several microservices that send messages to an Amazon SQS queue and a backend application that poll the queue to process the messages. The company also has a Service Level Agreement (SLA) which defines the acceptable amount of time that can elapse from the point when the messages are received until a response is sent. The backend operations are I/O-intensive as the number of messages is constantly growing, causing the company to miss its SLA. The Solutions Architect must implement a new architecture that improves the application’s processing time and load management.

Which of the following is the MOST effective solution that can satisfy the given requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Create an AMI of the backend application's EC2 instance and replace it with a larger instance size.
- [ ] **B.** Create an AMI of the backend application's EC2 instance and launch it to a cluster placement group.
- [ ] **C.** Create an AMI of the backend application’s EC2 instance. Use the image to set up an Auto Scaling group and configure a target tracking scaling policy based on the `CPUUtilization` metric with a target value of 80%.
- [x] **D.** Create an AMI of the backend application’s EC2 instance. Use the image to set up an Auto Scaling group and configure a target tracking scaling policy based on the `ApproximateAgeOfOldestMessage` metric.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create an AMI of the backend application’s EC2 instance. Use the image to set up an Auto Scaling group and configure a target tracking scaling policy based on the `ApproximateAgeOfOldestMessage` metric.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Simple Queue Service (SQS)** is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. SQS eliminates the complexity and overhead associated with managing and operating message-oriented middleware and empowers developers to focus on differentiating work. Using SQS, you can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS-SQS-AgeOfOldestMessage.png)

The `ApproximateAgeOfOldestMessage` metric is useful when applications have time-sensitive messages and you need to ensure that messages are processed within a specific time period. You can use this metric to set Amazon CloudWatch alarms that issue alerts when messages remain in the queue for extended periods of time. You can also use alerts to take action, such as increasing the number of consumers to process messages more quickly.

With a target tracking scaling policy, you can scale (increase or decrease capacity) a resource based on a target value for a specific CloudWatch metric. To create a custom metric for this policy, you need to use AWS CLI or AWS SDKs. Take note that you need to create an AMI from the instance first before you can create an Auto Scaling group to scale the instances based on the `ApproximateAgeOfOldestMessage` metric.

Hence, the correct answer is: **Create an AMI of the backend application’s EC2 instance. Use the image to set up an Auto Scaling Group and configure a target tracking scaling policy based on the `ApproximateAgeOfOldestMessage` metric.
**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an AMI of the backend application’s EC2 instance. Use the image to set up an Auto Scaling Group and configure a target tracking scaling policy based on the `CPUUtilization` metric with a target value of 80%** is incorrect. Although this will improve the backend processing, the scaling policy based on the `CPUUtilization` metric is not meant for time-sensitive messages where you need to ensure that the messages are processed within a specific time period. It will only trigger the scale-out activities based on the CPU Utilization of the current instances, and not based on the age of the message, which is a crucial factor in meeting the SLA. To satisfy the requirement in the scenario, you should use the `ApproximateAgeOfOldestMessage` metric.

- The option that says: **Create an AMI of the backend application’s EC2 instance and replace it with a larger instance size** is incorrect because replacing the instance with a large size won’t be enough to dynamically handle workloads at any level. You need to implement an Auto Scaling group to automatically adjust the capacity of your computing resources.

- The option that says: **Create an AMI of the backend application’s EC2 instance and launch it to a cluster placement group** is incorrect because a cluster placement group is just a logical grouping of EC2 instances. Instead of launching the instance in a placement group, you must set up an Auto Scaling group for your EC2 instances and configure a target tracking scaling policy based on the `ApproximateAgeOfOldestMessage` metric.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/about-aws/whats-new/2016/08/new-amazon-cloudwatch-metric-for-amazon-sqs-monitors-the-age-of-the-oldest-message/](https://aws.amazon.com/about-aws/whats-new/2016/08/new-amazon-cloudwatch-metric-for-amazon-sqs-monitors-the-age-of-the-oldest-message/)
- [https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-available-cloudwatch-metrics.html](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-available-cloudwatch-metrics.html)
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 27 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A business plans to deploy an application on EC2 instances within an Amazon VPC and is considering adopting a Network Load Balancer to distribute incoming traffic among the instances. A solutions architect needs to suggest a solution that will enable the security team to inspect traffic entering and exiting their VPC.

Which approach satisfies the requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Create a firewall at the subnet level using the Amazon Detective service. Inspect the ingress and egress traffic using the VPC Reachability Analyzer.
- [ ] **B.** Use the Network Access Analyzer service on the application’s VPC for inspecting ingress and egress traffic. Create a new Network Access Scope to filter and analyze all incoming and outgoing requests.
- [x] **C.** Create a firewall using the AWS Network Firewall service at the VPC level then add custom rule groups for inspecting ingress and egress traffic. Update the necessary VPC route tables.
- [ ] **D.** Enable Traffic Mirroring on the Network Load Balancer and forward traffic to the instances. Create a traffic mirror filter to inspect the ingress and egress of data that traverses your Amazon VPC.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Create a firewall using the AWS Network Firewall service at the VPC level then add custom rule groups for inspecting ingress and egress traffic. Update the necessary VPC route tables.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
AWS Network Firewall is a stateful, managed, network firewall, and intrusion detection and prevention service for your virtual private cloud (VPC). With Network Firewall, you can filter traffic at the perimeter of your VPC. This includes traffic going to and coming from an internet gateway, NAT gateway, or over VPN or AWS Direct Connect. Network Firewall uses Suricata — an open-source intrusion prevention system (IPS) for stateful inspection.

The diagram below shows an AWS Network firewall deployed in a single availability zone and traffic flow for a workload in a public subnet:

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-network-firewall-single-az-deployment-diagram.jpg)

You can use Network Firewall to monitor and protect your Amazon VPC traffic in a number of ways, including the following:

– Pass traffic through only from known AWS service domains or IP address endpoints, such as Amazon S3.

– Use custom lists of known bad domains to limit the types of domain names that your applications can access.

– Perform deep packet inspection on traffic entering or leaving your VPC.

– Use stateful protocol detection to filter protocols like HTTPS, independent of the port used.

Therefore, the correct answer is: **Create a firewall using the AWS Network Firewall service at the VPC level then add custom rule groups for inspecting ingress and egress traffic. Update the necessary VPC route tables.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use the Network Access Analyzer service on the application’s VPC for inspecting ingress and egress traffic. Create a new Network Access Scope to filter and analyze all incoming and outgoing requests** is incorrect. Network Access Analyzer is a feature of VPC that reports on unintended access to your AWS resources based on the security and compliance that you set. This service is not capable of performing deep packet inspection on traffic entering or leaving your VPC, unlike AWS Network Firewall.

- The option that says: **Create a firewall at the subnet level using the Amazon Detective service. Inspect the ingress and egress traffic using the VPC Reachability Analyzer** is incorrect because a firewall must be created at the VPC level and not at the subnet level. Moreover, Amazon Detective can’t be used to create a firewall. This service just automatically collects log data from your AWS resources to analyze, investigate, and quickly identify the root cause of potential security issues or suspicious activities in your AWS account. For this scenario, you have to use the AWS Network Firewall instead.

- The option that says: **Enable Traffic Mirroring on the Network Load Balancer and forward traffic to the instances. Create a traffic mirror filter to inspect the ingress and egress of data that traverses your Amazon VPC** is incorrect as this alone accomplishes nothing. It would make more sense if you redirect the traffic to an EC2 instance where an Intrusion Detection System (IDS) is running. Remember that Traffic Mirroring is simply an Amazon VPC feature that you can use to copy network traffic from an elastic network interface. Traffic mirror filters can’t inspect the actual packet of the incoming and outgoing traffic.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/blogs/networking-and-content-delivery/deployment-models-for-aws-network-firewall/](https://aws.amazon.com/blogs/networking-and-content-delivery/deployment-models-for-aws-network-firewall/)
- [https://docs.aws.amazon.com/network-firewall/latest/developerguide/what-is-aws-network-firewall.html](https://docs.aws.amazon.com/network-firewall/latest/developerguide/what-is-aws-network-firewall.html)

---

## Câu 28 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
An application is hosted in an On-Demand EC2 instance and is using Amazon SDK to communicate to other AWS services such as S3, DynamoDB, and many others. As part of the upcoming IT audit, you need to ensure that all API calls to your AWS resources are logged and durably stored.

Which is the most suitable service that you should use to meet this requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Amazon API Gateway
- [x] **B.** AWS CloudTrail
- [ ] **C.** Amazon CloudWatch
- [ ] **D.** AWS X-Ray

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** AWS CloudTrail

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
AWS CloudTrail increases visibility into your user and resource activity by recording AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from which the calls were made, and when the calls occurred.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon CloudWatch** is incorrect because this is primarily used for systems monitoring based on the server metrics. It does not have the capability to track API calls to your AWS resources.

- **AWS X-Ray** is incorrect because this is usually used to debug and analyze your microservices applications with request tracing so you can find the root cause of issues and performance. Unlike CloudTrail, it does not record the API calls that were made to your AWS resources.

- **Amazon API Gateway** is incorrect because this is not used for logging each and every API call to your AWS resources. It is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [https://aws.amazon.com/cloudtrail/](https://aws.amazon.com/cloudtrail/)

**Check out this AWS CloudTrail Cheat Sheet:**
- [https://tutorialsdojo.com/aws-cloudtrail/](https://tutorialsdojo.com/aws-cloudtrail/)

---

## Câu 29 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company is running a batch job on an EC2 instance inside a private subnet. The instance gathers input data from an S3 bucket in the same region through a NAT Gateway. The company is looking for a solution that will reduce costs without imposing risks on redundancy or availability.

Which solution will accomplish this?

### Các lựa chọn (Choices)
- [ ] **A.** Replace the NAT Gateway with a NAT instance hosted on a burstable instance type.
- [ ] **B.** Re-assign the NAT Gateway to a lower EC2 instance type.
- [ ] **C.** Deploy a Transit Gateway to peer connection between the instance and the S3 bucket.
- [x] **D.** Remove the NAT Gateway and use a Gateway VPC endpoint to access the S3 bucket from the instance.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Remove the NAT Gateway and use a Gateway VPC endpoint to access the S3 bucket from the instance.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A **gateway endpoint** is a gateway that you specify in your route table to access Amazon S3 from your VPC over the AWS network. Interface endpoints extend the functionality of gateway endpoints by using private IP addresses to route requests to Amazon S3 from within your VPC, on-premises, or from a different AWS Region. Interface endpoints are compatible with gateway endpoints. If you have an existing gateway endpoint in the VPC, you can use both types of endpoints in the same VPC.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-s3-vpc-endpoint.PNG)

There is no additional charge for using gateway endpoints. However, standard charges for data transfer and resource usage still apply.

Hence, the correct answer is: **Remove the NAT Gateway and use a Gateway VPC endpoint to access the S3 bucket from the instance.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Replace the NAT Gateway with a NAT instance hosted on burstable instance type** is incorrect. This solution may possibly reduce costs, but the availability and redundancy will be compromised.

- The option that says: **Deploy a Transit Gateway to peer connection between the instance and the S3 bucket** is incorrect. Transit Gateway is a service that is specifically used for connecting multiple VPCs through a central hub.

- The option that says: **Re-assign the NAT Gateway to a lower EC2 instance type** is incorrect. NAT Gateways are fully managed resources. You cannot access nor modify the underlying instance that hosts it.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html)
- [https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway.html](https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 30 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company plans to implement a hybrid architecture. A dedicated connection needs to be created from the Amazon Virtual Private Cloud (VPC) to the on-premises network. This connection must provide high bandwidth throughput and a more consistent network experience than Internet-based solutions.

Which of the following can be used to create a private connection between the VPC and the company’s on-premises network?

### Các lựa chọn (Choices)
- [ ] **A.** AWS Site-to-Site VPN
- [x] **B.** AWS Direct Connect
- [ ] **C.** Transit VPC
- [ ] **D.** Transit Gateway with equal-cost multipath routing (ECMP)

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** AWS Direct Connect

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Direct Connect** links your internal network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an AWS Direct Connect router.

![AWS Direct Connect diagram](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-direct-connect-tutorialsdojo-saa-c02-aws.png)

With this connection, you can create virtual interfaces directly to public AWS services (for example, to Amazon S3) or to Amazon VPC, bypassing internet service providers in your network path. An AWS Direct Connect location provides access to AWS in the region with which it is associated. You can use a single connection in a public Region or AWS GovCloud (US) to access public AWS services in all other public Regions

Hence, the correct answer is: **AWS Direct Connect.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Transit VPC** is incorrect because this in itself is not enough to integrate your on-premises network to your VPC. You have to either use a VPN or a Direct Connect connection. A transit VPC is primarily used to connect multiple VPCs and remote networks in order to create a global network transit center and not for establishing a dedicated connection to your on-premises network.

- **Transit Gateway with equal-cost multipath routing (ECMP)** is incorrect because a transit gateway is commonly used to connect multiple VPCs and on-premises networks through a central hub. Just like transit VPC, a transit gateway is not capable of establishing a direct and dedicated connection to your on-premises network.

- **AWS Site-to-Site VPN** is incorrect because this type of connection traverses the public Internet. Moreover, it doesn’t provide a high bandwidth throughput and a more consistent network experience than Internet-based solutions.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/premiumsupport/knowledge-center/connect-vpc/](https://aws.amazon.com/premiumsupport/knowledge-center/connect-vpc/)
- [https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html)

**Check out this AWS Direct Connect Cheat Sheet:**
- [https://tutorialsdojo.com/aws-direct-connect/](https://tutorialsdojo.com/aws-direct-connect/)

**Comparison of AWS Services Cheat Sheets:**
- [https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

---

## Câu 31 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A client is hosting their company website on a cluster of web servers that are behind a public-facing Application Load Balancer (AWS ALB). The client also uses Amazon Route 53 to manage their public DNS.

How should the client configure the DNS zone apex record to point to the load balancer?

### Các lựa chọn (Choices)
- [ ] **A.** Create a CNAME record pointing to the load balancer DNS name.
- [ ] **B.** Create an alias for CNAME record to the load balancer DNS name.
- [x] **C.** Create an A record aliased to the load balancer DNS name.
- [ ] **D.** Create an A record pointing to the IP address of the load balancer.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Create an A record aliased to the load balancer DNS name.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Route 53’s DNS implementation connects user requests to infrastructure running inside (and outside) of Amazon Web Services (AWS). For example, if you have multiple web servers running on EC2 instances behind an Elastic Load Balancing load balancer, Route 53 will route all traffic addressed to your website (e.g. `www.tutorialsdojo.com`) to the load balancer DNS name (e.g. `elbtutorialsdojo123.elb.amazonaws.com`).

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/r53-cf-elb.png)

Additionally, Route 53 supports the alias resource record set, which lets you map your **zone apex (** e.g. `tutorialsdojo.com`) DNS name to your load balancer DNS name. IP addresses associated with Elastic Load Balancing can change at any time due to scaling or software updates. Route 53 responds to each request for an Alias resource record set with one IP address for the load balancer.

Hence, the correct answer is: **Create an A record aliased to the load balancer DNS name.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Creating an A record pointing to the IP address of the load balancer** is incorrect. You should be using an Alias record pointing to the DNS name of the load balancer since the IP address of the load balancer can change at any time.

- The option that says: **Creating a CNAME record pointing to the load balancer DNS name** and **creating an alias for CNAME record to the load balancer DNS name** are incorrect because CNAME records cannot be created for your **zone** apex. You should create an alias record at the top node of a DNS namespace which is also known as the *zone apex*. For example, if you register the DNS name tutorialsdojo.com, the zone apex is tutorialsdojo.com. You can’t create a CNAME record directly for tutorialsdojo.com, but you can create an alias record for tutorialsdojo.com that routes traffic to **www** .tutorialsdojo.com.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References** :
- [http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/setting-up-route53-zoneapex-elb.html](http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/setting-up-route53-zoneapex-elb.html)
- [https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html)

**Check out this Amazon Route 53 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-route-53/](https://tutorialsdojo.com/amazon-route-53/)

---

## Câu 32 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company has a web application hosted in their on-premises infrastructure that they want to migrate to AWS cloud. Your manager has instructed you to ensure that there is no downtime while the migration process is on-going. In order to achieve this, your team decided to divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure. Once the migration is over and the application works with no issues, a full diversion to AWS will be implemented. The company’s VPC is connected to its on-premises network via an AWS Direct Connect connection.

Which of the following are the possible solutions that you can implement to satisfy the above requirement? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** Use Route 53 with Weighted routing policy to divert the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.
- [ ] **B.** Use AWS Global Accelerator to divert and proportion the HTTP and HTTPS traffic between the on-premises and AWS-hosted application. Ensure that the on-premises network has an AnyCast static IP address and is connected to your VPC via a Direct Connect Gateway.
- [ ] **C.** Use a Network Load balancer with Weighted Target Groups to divert the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.
- [x] **D.** Use an Application Elastic Load balancer with Weighted Target Groups to divert and proportion the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.
- [ ] **E.** Use Route 53 with Failover routing policy to divert and proportion the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, D**
> - **A.** Use Route 53 with Weighted routing policy to divert the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.
> - **D.** Use an Application Elastic Load balancer with Weighted Target Groups to divert and proportion the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Application Load Balancers support Weighted Target Groups routing. With this feature, you will be able to do weighted routing of the traffic forwarded by a rule to multiple target groups. This enables various use cases like blue-green, canary, and hybrid deployments without the need for multiple load balancers. It even enables zero-downtime migration between on-premises and cloud or between different compute types like EC2 and Lambda.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2019-10-06_17-27-58.png)

To divert 50% of the traffic to the new application in AWS and the other 50% to the application, you can also use Route 53 with Weighted routing policy. This will divert the traffic between the on-premises and AWS-hosted applications accordingly.

Weighted routing lets you associate multiple resources with a single domain name (tutorialsdojo.com) or subdomain name (portal.tutorialsdojo.com) and choose how much traffic is routed to each resource. This can be useful for a variety of purposes, including load balancing and testing new versions of software. You can set a specific percentage of how much traffic will be allocated to the resource by specifying the weights.

For example, if you want to send a tiny portion of your traffic to one resource and the rest to another resource, you might specify weights of 1 and 255. The resource with a weight of 1 gets 1/256th of the traffic (1/1+255), and the other resource gets 255/256ths (255/1+255).

You can gradually change the balance by changing the weights. If you want to stop sending traffic to a resource, you can change the weight for that record to 0.

When you create a target group in your Application Load Balancer, you specify its target type. This determines the type of target you specify when registering with this target group. You can select the following target types:

1. **instance** – The targets are specified by instance ID.

2. **ip** – The targets are IP addresses.

3. **Lambda** – The target is a Lambda function.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/alb_add_ip_targets_2.png)

When the target type is **ip** , you can specify IP addresses from one of the following CIDR blocks:

– `10.0.0.0/8` (RFC 1918)

– `100.64.0.0/10` (RFC 6598)

– `172.16.0.0/12` (RFC 1918)

– `192.168.0.0/16` (RFC 1918)

– The subnets of the VPC for the target group

These supported CIDR blocks enable you to register the following with a target group: ClassicLink instances, instances in a VPC that is peered to the load balancer VPC, AWS resources that are addressable by IP address and port (for example, databases), and on-premises resources linked to AWS through AWS Direct Connect or a VPN connection.

Take note that you can not specify publicly routable IP addresses. If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. If you specify targets using IP addresses, you can route traffic to an instance using any private IP address from one or more network interfaces. This enables multiple applications on an instance to use the same port. Each network interface can have its own security group.

Hence, the correct answers are the following options:

 **– Use an Application Elastic Load balancer with Weighted Target Groups to divert and proportion the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.**

 **– Use Route 53 with Weighted routing policy to divert the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use a Network Load balancer with Weighted Target Groups to divert the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure** is incorrect because a Network Load balancer doesn’t have Weighted Target Groups to divert the traffic between the on-premises and AWS-hosted application.

- The option that says: **Use Route 53 with Failover routing policy to divert and proportion the traffic between the on-premises and AWS-hosted application. Divert 50% of the traffic to the new application in AWS and the other 50% to the application hosted in their on-premises infrastructure** is incorrect because you cannot divert and proportion the traffic between the on-premises and AWS-hosted application using Route 53 with Failover routing policy. This is primarily used if you want to configure active-passive failover to your application architecture.

- The option that says: **Use AWS Global Accelerator to divert and proportion the HTTP and HTTPS traffic between the on-premises and AWS-hosted application. Ensure that the on-premises network has an AnyCast static IP address and is connected to your VPC via a Direct Connect Gateway** is incorrect. Although you can control the proportion of traffic directed to each endpoint using AWS Global Accelerator by assigning weights across the endpoints, it is still wrong to use a Direct Connect Gateway and an AnyCast IP address since these are not required at all. You can only associate static IP addresses provided by AWS Global Accelerator to regional AWS resources or endpoints, such as Network Load Balancers, Application Load Balancers, EC2 Instances, and Elastic IP addresses. Take note that a Direct Connect Gateway, per se, doesn’t establish a connection from your on-premises network to your Amazon VPCs. It simply enables you to use your AWS Direct Connect connection to connect to two or more VPCs that are located in different AWS Regions.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html)
- [https://aws.amazon.com/blogs/aws/new-application-load-balancer-simplifies-deployment-with-weighted-target-groups/](https://aws.amazon.com/blogs/aws/new-application-load-balancer-simplifies-deployment-with-weighted-target-groups/)
- [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html)

**Check out this Amazon Route 53 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-route-53/](https://tutorialsdojo.com/amazon-route-53/)

---

## Câu 33 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A startup launched a fleet of on-demand Amazon EC2 instances to host a massively multiplayer online role-playing game (MMORPG). The EC2 instances are configured with Auto Scaling and AWS Systems Manager.

What can be used to configure the EC2 instances without having to establish an RDP or SSH connection to each instance?

### Các lựa chọn (Choices)
- [ ] **A.** AWS App Runner
- [ ] **B.** AWS CodePipeline
- [x] **C.** Run Command
- [ ] **D.** EC2Config

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Run Command

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You can use AWS Systems Manager **Run Command** to configure and manage Amazon EC2 instances without establishing direct SSH or RDP connections. Run Command allows administrators to remotely execute commands on one or more instances from the AWS Management Console or through programmatic interfaces. This capability enables teams to apply configuration updates, install software, or run scripts across a fleet of instances in a centralized and consistent manner, which significantly simplifies operational management in environments that use Auto Scaling or large groups of EC2 instances.

![AWS Systems Manager](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/product-page-diagram-AWS-Systems-Manager_how-it-works.2e7c5d550e833eed0f49fb8dc1872de23b09d183.png)

Run Command works with managed instances, which are Amazon EC2 instances or on-premises machines that are configured with the SSM Agent and appropriate IAM permissions so they can communicate with AWS Systems Manager. By sending commands through Systems Manager instead of opening inbound management ports, administrators can securely perform maintenance tasks, automate administrative operations, and run ad hoc commands at scale using the AWS Management Console, AWS CLI, AWS Tools for Windows PowerShell, or AWS SDKs.

Hence, the correct answer is: **Run Command.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **AWS App Runner** is incorrect because it primarily provides a managed service for deploying and running containerized web applications and APIs from source code or container images. It does not provide a way to remotely execute commands or configure existing EC2 instances.

- **AWS CodePipeline** is incorrect because it typically automates the build, test, and deployment stages of application release pipelines in CI/CD workflows. It does not allow administrators to directly run configuration commands on EC2 instances.

- **EC2Config** is incorrect because it only acts as an initialization service for older Windows-based EC2 instances, handling tasks such as setting administrator passwords and basic instance configuration. It does not support centralized command execution or remote configuration across multiple instances.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html)
- [https://docs.aws.amazon.com/systems-manager/latest/userguide/running-commands-console.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/running-commands-console.html)
- [https://docs.aws.amazon.com/systems-manager/latest/userguide/execute-remote-commands.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/execute-remote-commands.html)

**Check out this AWS Systems Manager Cheat Sheet:**
- [https://tutorialsdojo.com/aws-systems-manager/](https://tutorialsdojo.com/aws-systems-manager/)

---

## Câu 34 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A leading media company has recently adopted a hybrid cloud architecture, requiring the migration of application servers and databases to AWS. One of its applications requires a heterogeneous database migration, where an on-premises Oracle database needs to be transformed to PostgreSQL in AWS. This entails a schema and code transformation before the proper data migration begins.

Which of the following options is the most suitable approach to migrate the database to AWS?

### Các lựa chọn (Choices)
- [ ] **A.** Use Amazon Neptune to convert the source schema and code to match that of the target database in Amazon RDS. Leverage AWS Batch jobs to efficiently migrate data from the source database to the target database in a streamlined batch process.
- [ ] **B.** Configure a Launch Template that automatically converts the source schema and code to match that of the target database. Then, use the AWS Database Migration Service to migrate data from the source database to the target database.
- [ ] **C.** Heterogeneous migrations of databases are not supported in AWS. The database must first be transformed to PostgreSQL and then migrated to Amazon RDS.
- [x] **D.** Use the AWS Schema Conversion Tool to convert the source schema and application code to match that of the target database, and then use the AWS Database Migration Service to migrate data from the source database to the target database.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Use the AWS Schema Conversion Tool to convert the source schema and application code to match that of the target database, and then use the AWS Database Migration Service to migrate data from the source database to the target database.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Database Migration Service** helps you migrate databases to AWS quickly and securely. The source database remains fully operational during the migration, minimizing downtime to applications that rely on the database. The AWS Database Migration Service can migrate your data to and from most widely used commercial and open-source databases.

![AWS Database Migration Service (DMS)](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/TD-AWSDatabaseMigrationServiceDMS-06Nov2025.png)

AWS Database Migration Service can migrate your data to and from most of the widely used commercial and open source databases. It supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms, such as Oracle to Amazon Aurora. Migrations can be from on-premises databases to Amazon RDS or Amazon EC2, databases running on EC2 to RDS, or vice versa, as well as from one RDS database to another RDS database. It can also move data between SQL, NoSQL, and text based targets.

In heterogeneous database migrations, the source and target database engines are different, like in the case of Oracle to Amazon Aurora, Oracle to PostgreSQL, or Microsoft SQL Server to MySQL migrations. In this case, the schema structure, data types, and database code of source and target databases can be quite different, requiring a schema and code transformation before the data migration starts. This makes heterogeneous migrations a two-step process. The **AWS Schema Conversion Tool (SCT)** is used in the first step to convert the source schema and application code to match that of the target database. Then, in the second step, AWS Database Migration Service migrates the data, handling the necessary data type conversions during the process.

Hence, the correct answer is: **Use the AWS Schema Conversion Tool to convert the source schema and application code to match that of the target database, and then use the AWS Database Migration Service to migrate data from the source database to the target database** . All the required data type conversions will automatically be done by the AWS Database Migration Service during the migration. The source database can be located in your own premises outside of AWS, running on an Amazon EC2 instance, or it can be an Amazon RDS database. The target can be a database in Amazon EC2 or Amazon RDS.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Configure a Launch Template that automatically converts the source schema and code to match that of the target database. Then, use the AWS Database Migration Service to migrate data from the source database to the target database** is incorrect because Launch Templates are only used for configuring EC2 instance settings and do not provide any functionality for schema or code conversion. Schema and code transformation are essential for heterogeneous database migrations and require specialized tools like the AWS Schema Conversion Tool (SCT), not a Launch Template.

- The option that says: **Use Amazon Neptune to convert the source schema and code to match that of the target database in RDS. Leverage AWS Batch jobs to efficiently migrate data from the source database to the target database in a streamlined batch process** is incorrect because Amazon Neptune is a graph database service, not a tool designed for converting or migrating relational database schemas and application code. It is not suited for the transformation required for heterogeneous database migrations such as Oracle to PostgreSQL. Additionally, AWS Batch jobs are typically used for running batch processing tasks, not for database migration or schema transformation.

- The option that says: **Heterogeneous migrations of databases are not supported in AWS. The database must first be transformed to PostgreSQL and then migrated to Amazon RDS.** is incorrect because AWS fully supports heterogeneous database migrations. Tools like the AWS Schema Conversion Tool (SCT) allow for schema and code transformation between different database engines, and AWS Database Migration Service (DMS) enables the migration of data across different database platforms. Therefore, there is no need to manually transform the database to PostgreSQL before migrating it to RDS, as AWS primarily provides the necessary tools to handle the conversion and migration seamlessly.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/dms/](https://aws.amazon.com/dms/)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html)
- [https://aws.amazon.com/batch/](https://aws.amazon.com/batch/)

**Check out this AWS Database Migration Service Cheat Sheet:**
- [https://tutorialsdojo.com/aws-database-migration-service/](https://tutorialsdojo.com/aws-database-migration-service/)

---

## Câu 35 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A research institute has developed simulation software that requires significant computational power. Currently, the software runs on a local server with limited resources, taking several hours to complete each simulation. The server has 32 virtual CPUs (vCPUs) and 256 GiB of memory. The institute plans to migrate the software to AWS. Their objective is to speed up the simulations by running them in parallel.

As a Solutions Architect, which solution will achieve this goal with the LEAST operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Run the simulations using AWS Fargate.
- [x] **B.** Utilize AWS Batch to manage the execution of the software.
- [ ] **C.** Use Lambda functions to process simulation tasks in parallel.
- [ ] **D.** Consider using Amazon EC2 Spot Instances to run the simulations.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Utilize AWS Batch to manage the execution of the software.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Batch** is a powerful tool for developers, scientists, and engineers who need to run a large number of batch and ML computing jobs. By optimizing compute resources, AWS Batch enables you to focus on analyzing outcomes and resolving issues, rather than worrying about the technical details of running jobs.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-batch-06-18-23.png)

With AWS Batch, you can define and submit multiple simulation jobs to be executed concurrently. AWS Batch will take care of distributing the workload across multiple EC2 instances, scaling up or down based on the demand, and managing the execution environment. It provides an easy-to-use interface and automation for managing the simulations, allowing you to focus on the software itself rather than the underlying infrastructure.

Hence, the correct answer is: **Utilize AWS Batch to manage the execution of the software.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Consider using Amazon EC2 Spot Instances to run the simulations** is incorrect. Spot Instances are not guaranteed to be available at all times. AWS may interrupt the usage of Spot Instances if the spot price exceeds your bid. This can potentially impact the simulations that are running.

- The option that says: **Use Lambda functions to process simulation tasks in parallel ** is incorrect. ** ** If you need to perform complex simulations that require significant computational power and longer execution times, AWS Lambda functions is not the best solution. While they work well for event-driven and short-lived tasks, Lambda functions have limitations on execution duration that could prevent you from completing simulations within your desired timeframe.

- The option that says: **Run the simulations using AWS Fargate ** is incorrect. For complex jobs, this approach might not be enough because of the limited processing power that can be allocated to a Fargate task. Moreover, AWS Fargate doesn’t have its own system to manage tasks and timing, so you would need to use another system for this, which creates more work.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/batch/](https://aws.amazon.com/batch/)
- [https://docs.aws.amazon.com/batch/](https://docs.aws.amazon.com/batch/)

**Checkout this AWS Batch Cheat Sheet:**
- [https://tutorialsdojo.com/aws-batch/](https://tutorialsdojo.com/aws-batch/)

---

## Câu 36 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company needs to accelerate the performance of its AI-powered medical diagnostic application by running its machine learning workloads on the edge of telecommunication carriers’ 5G networks. The application must be deployed to a Kubernetes cluster and have role-based access control (RBAC) access to IAM users and roles for cluster authentication.

Which of the following should the Solutions Architect implement to ensure single-digit millisecond latency for the application?

### Các lựa chọn (Choices)
- [ ] **A.** Host the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Set up node groups in AWS Wavelength Zones for the EKS cluster. Attach the EKS connector agent role (`AmazonECSConnectorAgentRole`) to your cluster and use AWS Control Tower for RBAC access.
- [x] **B.** Launch the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Create node groups in AWS Wavelength Zones for the EKS cluster via the Wavelength service. Configure the EKS Cluster Access Management (CAM) API and create access entries and access policies to grant IAM users and roles the required Kubernetes permissions.
- [ ] **C.** Launch the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Configure the Amazon VPC CNI plugin for Kubernetes to manage pod networking in AWS Wavelength Zones. Install the AWS IAM Authenticator for Kubernetes (`aws-iam-authenticator`) to your cluster.
- [ ] **D.** Host the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster and run the Kubernetes pods on AWS Fargate. Create node groups in AWS Wavelength Zones for the EKS cluster. Add the EKS pod execution IAM role (`AmazonEKSFargatePodExecutionRole`) to your cluster and ensure that the Fargate profile has the same IAM role as your Amazon EC2 node groups.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Launch the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Create node groups in AWS Wavelength Zones for the EKS cluster via the Wavelength service. Configure the EKS Cluster Access Management (CAM) API and create access entries and access policies to grant IAM users and roles the required Kubernetes permissions.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
AWS Wavelength combines the high bandwidth and ultralow latency of 5G networks with AWS compute and storage services so that developers can innovate and build a new class of applications.

Wavelength Zones are AWS infrastructure deployments that embed AWS compute and storage services within telecommunications providers’ data centers at the edge of the 5G network, so application traffic can reach application servers running in Wavelength Zones without leaving the mobile providers’ network. This prevents the latency that would result from multiple hops to the internet and enables customers to take full advantage of 5G networks. Wavelength Zones extend AWS to the 5G edge, delivering a consistent developer experience across multiple 5G networks around the world. Wavelength Zones also allow developers to build the next generation of ultra-low latency applications using the same familiar AWS services, APIs, tools, and functionality they already use today.

![AWS Wavelength](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-wavelength.png)

Amazon EKS uses IAM to provide authentication to your Kubernetes cluster, but it still relies on native Kubernetes Role-Based Access Control (RBAC) for authorization. This means that IAM is only used for the authentication of valid IAM entities. All permissions for interacting with your Amazon EKS cluster’s Kubernetes API are managed through the native Kubernetes RBAC system.

Access to your cluster using AWS Identity and Access Management (IAM) entities is enabled by the [AWS IAM Authenticator for Kubernetes](https://github.com/kubernetes-sigs/aws-iam-authenticator#readme), which runs on the Amazon EKS control plane. You can manage the Kubernetes permissions of IAM principals from outside the cluster using access entries. Access management can be done through the EKS API, AWS Command Line Interface (CLI), AWS SDKs, AWS CloudFormation, and the AWS Management Console. This allows you to manage users using the same tools you used to create the cluster.

The Cluster Access Management (CAM) API is available for managing cluster access. The CAM API uses access entries to link AWS IAM principals (users or roles) to the EKS cluster. These entries are compatible with IAM Identity Center’s managed identities, enabling administrators to control cluster access for users and groups defined within Identity Center.

Hence, the correct answer is: **Launch the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Create node groups in AWS Wavelength Zones for the EKS cluster via the Wavelength service. Configure the EKS Cluster Access Management (CAM) API and create access entries and access policies to grant IAM users and roles the required Kubernetes permissions.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Host the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Set up node groups in AWS Wavelength Zones for the EKS cluster. Attach the EKS connector agent role (`AmazonECSConnectorAgentRole`) to your cluster and use AWS Control Tower for RBAC access** is incorrect. An Amazon EKS connector agent is only used to connect your externally hosted Kubernetes clusters and to allow them to be viewed in your AWS Management Console. The AWS Control Tower doesn’t provide RBAC access to your EKS cluster. This service is commonly used for setting up a secure multi-account AWS environment and not for providing cluster authentication using IAM users and roles.

- The option that says: **Launch the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster. Configure the Amazon VPC CNI plugin for Kubernetes to manage pod networking in AWS Wavelength Zones. Install the AWS IAM Authenticator for Kubernetes (`aws-iam-authenticator`) to your cluster** is incorrect. The VPC CNI plugin is primarily for enabling pods to get IP addresses from the VPC and is the default networking model for EKS. It is not explicitly tied to Wavelength deployment. Similarly, installing the IAM Authenticator manually is unnecessary since EKS already integrates IAM authentication by default. This option, therefore, adds extra steps that are typically irrelevant in this context.

- The option that says: **Host the application to an Amazon Elastic Kubernetes Service (Amazon EKS) cluster and run the Kubernetes pods on AWS Fargate. Create node groups in AWS Wavelength Zones for the EKS cluster. Add the EKS pod execution IAM role (`AmazonEKSFargatePodExecutionRole`) to your cluster and ensure that the Fargate profile has the same IAM role as your Amazon EC2 node groups** is incorrect. Although this solution is possible, the security configuration of the Amazon EKS control plane is wrong. You have to ensure that the Fargate profile has a different IAM role from your Amazon EC2 node groups, and not the other way around.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/wavelength/](https://aws.amazon.com/wavelength/)
- [https://docs.aws.amazon.com/eks/latest/userguide/cluster-auth.html](https://docs.aws.amazon.com/eks/latest/userguide/cluster-auth.html)
- [https://docs.aws.amazon.com/eks/latest/best-practices/cluster-access-management.html](https://docs.aws.amazon.com/eks/latest/best-practices/cluster-access-management.html)
- [https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html](https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html)

**Check out this Amazon EKS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/](https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/)

---

## Câu 37 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A Solutions Architect is migrating several Windows-based applications to AWS that require a scalable file system storage for high-performance computing (HPC). The storage service must have full support for the SMB protocol and Windows NTFS, Active Directory (AD) integration, and Distributed File System (DFS).

Which of the following is the MOST suitable storage service that the Architect should use to fulfill this scenario?

### Các lựa chọn (Choices)
- [ ] **A.** Amazon S3 Glacier Deep Archive
- [ ] **B.** AWS DataSync
- [ ] **C.** Amazon FSx for Lustre
- [x] **D.** Amazon FSx for Windows File Server

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Amazon FSx for Windows File Server

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon FSx** provides fully managed third-party file systems. Amazon FSx provides you with the native compatibility of third-party file systems with feature sets for workloads such as Windows-based storage, high-performance computing (HPC), machine learning, and electronic design automation (EDA). You don’t have to worry about managing file servers and storage, as Amazon FSx automates time-consuming administration tasks such as hardware provisioning, software configuration, patching, and backups. Amazon FSx integrates the file systems with cloud-native AWS services, making them even more useful for a broader set of workloads.

Amazon FSx provides you with two file systems to choose from: Amazon FSx for Windows File Server for Windows-based applications and Amazon FSx for Lustre for compute-intensive workloads.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/FSx_Windows_File_Server_How-it-Works.9396055e727c3903de991e7f3052ec295c86f274.png)

For Windows-based applications, Amazon FSx provides fully managed Windows file servers with features and performance optimized for “lift-and-shift” business-critical application workloads including home directories (user shares), media workflows, and ERP applications. It is accessible from Windows and Linux instances via the SMB protocol. If you have Linux-based applications, Amazon EFS is a cloud-native fully managed file system that provides simple, scalable, elastic file storage accessible from Linux instances via the NFS protocol.

For compute-intensive and fast processing workloads, like high-performance computing (HPC), machine learning, EDA, and media processing, Amazon FSx for Lustre, provides a file system that’s optimized for performance, with input and output stored on Amazon S3.

Hence, the correct answer is: **Amazon FSx for Windows File Server.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon S3 Glacier Deep Archive** is incorrect because this service is primarily used as a secure, durable, and extremely low-cost cloud storage for data archiving and long-term backup.

- **AWS DataSync** is incorrect because this service simply provides a fast way to move large amounts of data online between on-premises storage and Amazon S3 or Amazon Elastic File System (Amazon EFS).

- **Amazon FSx for Lustre** is incorrect because this service doesn’t support Windows-based applications as well as Windows servers.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/fsx/](https://aws.amazon.com/fsx/)
- [https://aws.amazon.com/getting-started/use-cases/hpc/3/](https://aws.amazon.com/getting-started/use-cases/hpc/3/)

**Check out this Amazon FSx Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-fsx/](https://tutorialsdojo.com/amazon-fsx/)

---

## Câu 38 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A logistics company based in the USA runs its web application on a fleet of Amazon EC2 instances in an Auto Scaling group. The company uses an Application Load Balancer to distribute traffic among the EC2 instances. The company runs the same application in multiple AWS regions to cater to clients across several countries. A recent government policy has been enacted that prohibits the company from servicing a specific country.

Which of the following options is the recommended action to comply with the government requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Update the Network Access Control Lists of all subnets used by the Amazon EC2 instances to “deny” all IP addresses from the specific country.
- [ ] **B.** Update the Network Access Control Lists of all subnets used by the Application Load Balancers to “deny” all IP addresses from the specific country.
- [x] **C.** Create a Web ACL rule in AWS WAF to block the specified country. Associate the rule to the Application Load Balancers.
- [ ] **D.** Update the route tables to forward all outbound traffic to AWS Network Firewall and configure a stateful domain list rule group to block the specified country

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Create a Web ACL rule in AWS WAF to block the specified country. Associate the rule to the Application Load Balancers.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS WAF** is a web application firewall that lets you monitor the HTTP(S) requests that are forwarded to an Amazon CloudFront distribution, an Amazon API Gateway REST API, an Application Load Balancer, or an AWS AppSync GraphQL API.

You use a **web access control list (ACL)** to protect a set of AWS resources. You create a web ACL and define its protection strategy by adding rules. Rules define criteria for inspecting web requests and specify how to handle requests that match the criteria. A web access control list (web ACL) gives you fine-grained control over all of the HTTP(S) web requests that your protected resource responds to.

You can use criteria like the following to allow or block requests:

-IP address origin of the request

-Country of origin of the request

-String match or regular expression (regex) match in a part of the request

-Size of a particular part of the request

-Detection of malicious SQL code or scripting

You can also test for any combination of these conditions. You can block or count web requests that not only meet the specified conditions but also exceed a specified number of requests in any 5-minute period. You can combine conditions using logical operators. You can also run CAPTCHA controls against requests.

To allow or block web requests based on country of origin, create one or more geographical, or geo, match statements. You can use this to block access to your site from specific countries or to only allow access from specific countries.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/saa_waf_georestriction.jpeg)

Therefore, the correct answer is: **Create a Web ACL rule in AWS WAF to block the specified country. Associate this rule to the Application Load Balancers.** In AWS WAF, you can use the Geographic match rule statement to block access to your site from specific countries or to allow access only from specific countries.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Update the route tables to forward all outbound traffic to AWS Network Firewall and configure a stateful domain list rule group to block the specified country** is incorrect. Domain List Rules block HTTP or HTTPS traffic to domains identified as low-reputation, or that are known or suspected to be associated with malware or botnets. This can’t be used to block a particular country.

- The option that says: **Update the Network Access Control Lists of all subnets used by the Amazon EC2 instances to “deny” all IP addresses from the specific country** is incorrect. The EC2 instances are behind the Application Load Balancers, thus, if you need to modify NACL for incoming requests you should modify the ALB subnet NACLs.

- The option that says: **Update the Network Access Control Lists of all subnets used by the Application Load Balancers to “deny” all IP addresses from the specific country** is incorrect. This may be possible, however, this is not recommended as there will be a lot of IP addresses assigned to a country. The IP addresses list may also change regularly which is difficult to track.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/premiumsupport/knowledge-center/waf-allow-block-country-geolocation/](https://aws.amazon.com/premiumsupport/knowledge-center/waf-allow-block-country-geolocation/)
- [https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html](https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html)
- [https://docs.aws.amazon.com/waf/latest/developerguide/web-acl.html](https://docs.aws.amazon.com/waf/latest/developerguide/web-acl.html)

**Check out this AWS WAF Sheet:**
- [https://tutorialsdojo.com/aws-waf/](https://tutorialsdojo.com/aws-waf/)

---

## Câu 39 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
An operations team has an application running on EC2 instances inside two custom VPCs. The VPCs are located in the Ohio and N.Virginia Region respectively. The team wants to transfer data between the instances without traversing the public internet.

Which combination of steps will achieve this? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** Set up a VPC peering connection between the VPCs.
- [ ] **B.** Launch a NAT Gateway in the public subnet of each VPC.
- [ ] **C.** Create an Egress-only Internet Gateway.
- [ ] **D.** Deploy a VPC endpoint on each region to enable a private connection.
- [x] **E.** Re-configure the route table’s target and destination of the instances’ subnet.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, E**
> - **A.** Set up a VPC peering connection between the VPCs.
> - **E.** Re-configure the route table’s target and destination of the instances’ subnet.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A **VPC peering connection** is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network. You can create a VPC peering connection between your own VPCs, or with a VPC in another AWS account. The VPCs can be in different regions (also known as an inter-region VPC peering connection).

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/peering-intro-diagram.png)

 **Inter-Region VPC Peering** provides a simple and cost-effective way to share resources between regions or replicate data for geographic redundancy. Built on the same horizontally scaled, redundant, and highly available technology that powers VPC today, Inter-Region VPC Peering encrypts inter-region traffic with no single point of failure or bandwidth bottleneck. Traffic using Inter-Region VPC Peering always stays on the global AWS backbone and never traverses the public internet, thereby reducing threat vectors, such as common exploits and DDoS attacks.

Hence, the correct answers are:

 **– Set up a VPC peering connection between the VPCs.**

 **– Re-configure the route table’s target and destination of the instances’ subnet.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an Egress only Internet Gateway** is incorrect because this will just enable outbound IPv6 communication from instances in a VPC to the internet. Take note that the scenario requires private communication to be enabled between VPCs from two different regions.

- The option that says: **Launch a NAT Gateway in the public subnet of each VPC** is incorrect because NAT Gateways are used to allow instances in private subnets to access the public internet. Note that the requirement is to make sure that communication between instances will not traverse the internet.

- The option that says: **Deploy a VPC endpoint on each region to enable private connection** is incorrect. VPC endpoints are region-specific only and do not support inter-region communication.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html)
- [https://aws.amazon.com/about-aws/whats-new/2017/11/announcing-support-for-inter-region-vpc-peering/](https://aws.amazon.com/about-aws/whats-new/2017/11/announcing-support-for-inter-region-vpc-peering/)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 40 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A web application hosted in an Auto Scaling group of EC2 instances in AWS. The application receives a burst of traffic every morning, and a lot of users are complaining about request timeouts. The EC2 instance takes 1 minute to boot up before it can respond to user requests. The cloud architecture must be redesigned to better respond to the changing traffic of the application.

How should the Solutions Architect redesign the architecture?

### Các lựa chọn (Choices)
- [ ] **A.** Create a Network Load Balancer with slow-start mode.
- [ ] **B.** Create a new launch template and upgrade the size of the instance.
- [ ] **C.** Create a CloudFront distribution and set the EC2 instance as the origin.
- [x] **D.** Create a step scaling policy and configure an instance warm-up time condition.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create a step scaling policy and configure an instance warm-up time condition.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon EC2 Auto Scaling** helps you maintain application availability and allows you to automatically add or remove EC2 instances according to conditions you define. You can use the fleet management features of EC2 Auto Scaling to maintain the health and availability of your fleet. You can also use the dynamic and predictive scaling features of EC2 Auto Scaling to add or remove EC2 instances. Dynamic scaling responds to changing demand and predictive scaling automatically schedules the right number of EC2 instances based on predicted demand. Dynamic scaling and predictive scaling can be used together to scale faster.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/autoscaling-instance-warmup-time.png)

Step scaling applies “step adjustments” which means you can set multiple actions to vary the scaling depending on the size of the alarm breach. When you create a step scaling policy, you can also specify the number of seconds that it takes for a newly launched instance to warm up.

Hence, the correct answer is: **Create a step scaling policy and configure an instance warm-up time condition.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create a Network Load Balancer with slow start mode** is incorrect because Network Load Balancer does not support slow start mode. If you need to enable slow start mode, you should use Application Load Balancer.

- The option that says: **Create a new launch template and upgrade the size of the instance** is incorrect because a larger instance does not always improve the boot time. Instead of upgrading the instance, you should create a step scaling policy and add a warm-up time.

- The option that says: **Create a CloudFront distribution and set the EC2 instance as the origin** is incorrect because this approach only resolves the traffic latency. Take note that the requirement in the scenario is to resolve the timeout issue and not the traffic latency.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html)
- [https://aws.amazon.com/ec2/autoscaling/faqs/](https://aws.amazon.com/ec2/autoscaling/faqs/)

**Check out these AWS Cheat Sheets:**
- [https://tutorialsdojo.com/aws-auto-scaling/](https://tutorialsdojo.com/aws-auto-scaling/)
- [https://tutorialsdojo.com/step-scaling-vs-simple-scaling-policies-in-amazon-ec2/](https://tutorialsdojo.com/step-scaling-vs-simple-scaling-policies-in-amazon-ec2/)

---

## Câu 41 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has a web application hosted on a fleet of EC2 instances located in two Availability Zones that are all placed behind an Application Load Balancer. As a Solutions Architect, you have to add a health check configuration to ensure your application is highly-available.

Which health checks will you implement?

### Các lựa chọn (Choices)
- [ ] **A.** FTP health check
- [x] **B.** HTTP or HTTPS health check
- [ ] **C.** TCP health check
- [ ] **D.** ICMP health check

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** HTTP or HTTPS health check

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A load balancer takes requests from clients and distributes them across the EC2 instances that are registered with the load balancer. You can create a load balancer that listens to both the HTTP (80) and HTTPS (443) ports. If you specify that the HTTPS listener sends requests to the instances on port 80, the load balancer terminates the requests, and communication from the load balancer to the instances is not encrypted. If the HTTPS listener sends requests to the instances on port 443, communication from the load balancer to the instances is encrypted.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/DefineLB_Protocols_Backend_Auth.png)

If your load balancer uses an encrypted connection to communicate with the instances, you can optionally enable authentication of the instances. This ensures that the load balancer communicates with an instance only if its public key matches the key that you specified to the load balancer for this purpose.

The type of ELB that is mentioned in this scenario is an Application Elastic Load Balancer. This is used if you want a flexible feature set for your web applications with HTTP and HTTPS traffic. Conversely, it only allows 2 types of health check: HTTP and HTTPS.

Hence, the correct answer is: **HTTP or HTTPS health check.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **ICMP health check** and **FTP health check** are incorrect as these are not supported.

- **TCP health check** is incorrect. A TCP health check is only offered in Network Load Balancers and Classic Load Balancers.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html)
- [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)

**Check out this AWS Elastic Load Balancing (ELB) Cheat Sheet:**
- [https://tutorialsdojo.com/aws-elastic-load-balancing-elb/](https://tutorialsdojo.com/aws-elastic-load-balancing-elb/)

**EC2 Instance Health Check vs. ELB Health Check vs. Auto Scaling and Custom Health Check:**
- [https://tutorialsdojo.com/ec2-instance-health-check-vs-elb-health-check-vs-auto-scaling-and-custom-health-check/](https://tutorialsdojo.com/ec2-instance-health-check-vs-elb-health-check-vs-auto-scaling-and-custom-health-check/)

**Comparison of AWS Services Cheat Sheets:**
- [https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

---

## Câu 42 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
In a startup company you are working for, you are asked to design a web application that requires a NoSQL database that has no limit on the storage size for a given table. The startup is still new in the market and it has very limited human resources who can take care of the database infrastructure.

Which is the most suitable service that you can implement that provides a fully managed, scalable and highly available NoSQL service?

### Các lựa chọn (Choices)
- [x] **A.** DynamoDB
- [ ] **B.** Amazon Aurora
- [ ] **C.** SimpleDB
- [ ] **D.** Amazon Neptune

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** DynamoDB

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The term “ **fully managed** ” means that Amazon will manage the underlying infrastructure of the service hence, you don’t need an additional human resource to support or maintain the service. Therefore, Amazon DynamoDB is the right answer. Remember that Amazon RDS is a managed service but not “fully managed” as you still have the option to maintain and configure the underlying server of the database.

 **Amazon DynamoDB** is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale. It is a fully managed cloud database and supports both document and key-value store models. Its flexible data model, reliable performance, and automatic scaling of throughput capacity make it a great fit for mobile, web, gaming, ad tech, IoT, and many other applications.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon Neptune** is incorrect because this is primarily used as a graph database.

- **Amazon Aurora** is incorrect because this is a relational database and not a NoSQL database.

- **SimpleDB** is incorrect. Although SimpleDB is also a highly available and scalable NoSQL database, it has a limit on the request capacity or storage size for a given table, unlike DynamoDB.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [https://aws.amazon.com/dynamodb/](https://aws.amazon.com/dynamodb/)

**Check out this Amazon DynamoDB Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-dynamodb/](https://tutorialsdojo.com/amazon-dynamodb/)

**Amazon DynamoDB Overview:**

---

## Câu 43 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
The start-up company that you are working for has a batch job application that is currently hosted on an EC2 instance. It is set to process messages from a queue created in SQS with default settings. You configured the application to process the messages once a week. After 2 weeks, you noticed that not all messages are being processed by the application.

What is the root cause of this issue?

### Các lựa chọn (Choices)
- [x] **A.** Amazon SQS has automatically deleted the messages that have been in a queue for more than the maximum message retention period.
- [ ] **B.** The batch job application is configured to long polling.
- [ ] **C.** Missing permissions in SQS.
- [ ] **D.** The SQS queue is set to short-polling.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Amazon SQS has automatically deleted the messages that have been in a queue for more than the maximum message retention period.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon SQS automatically deletes messages that have been in a queue for more than the maximum message retention period. The default message retention period is 4 days. Since the queue is configured to the default settings and the batch job application only processes the messages once a week, the messages that are in the queue for more than 4 days are deleted. This is the root cause of the issue.

To fix this, you can increase the message retention period to a maximum of 14 days using the [SetQueueAttributes](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SetQueueAttributes.html) action.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/sqs/faqs/](https://aws.amazon.com/sqs/faqs/)
- [https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-lifecycle.html](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-lifecycle.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 44 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
An e-commerce company’s Chief Information Security Officer (CISO) has taken necessary measures to ensure that sensitive customer data is secure in the cloud. However, the company recently discovered that some customer Personally Identifiable Information (PII) was mistakenly uploaded to an S3 bucket.

The company aims to rectify this mistake and prevent any similar incidents from happening again in the future. Additionally, the company would like to be notified if this error occurs again.

As the Solutions Architect, which combination of options should you implement in this scenario? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Identify sensitive data using Amazon GuardDuty by creating an Amazon EventBridge (Amazon CloudWatch Events) rule to include the `CRITICAL` event types from GuardDuty findings.
- [x] **B.** Identify sensitive data using Amazon Macie and create an Amazon EventBridge (Amazon CloudWatch Events) rule to capture the `SensitiveData` event type.
- [x] **C.** Set up an Amazon SNS topic as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the error occurs again.
- [ ] **D.** Set up an Amazon SQS as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the error occurs again.
- [ ] **E.** Set up an AWS IoT Message Broker as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the `SensitiveData:S3Object/Personal` event occurs again.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, C**
> - **B.** Identify sensitive data using Amazon Macie and create an Amazon EventBridge (Amazon CloudWatch Events) rule to capture the `SensitiveData` event type.
> - **C.** Set up an Amazon SNS topic as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the error occurs again.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Macie** is a security service that uses machine learning to automatically discover, classify, and protect sensitive data in AWS. Amazon Macie recognizes sensitive data such as personally identifiable information (PII) or intellectual property and provides you with dashboards and alerts that give visibility into how these data are being accessed or moved.

You can use Amazon Macie to automatically detect a large and growing list of sensitive data types, including personally identifiable information (PII) such as names, addresses, and credit card numbers.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon_eventbridge_macie_findings_17jul2023.png)

Amazon S3 can automatically send events to Amazon EventBridge (Amazon CloudWatch Events), eliminating the need to manually select event types. EventBridge rules can then be used to route events to multiple destinations.

Amazon SNS lets publishers send messages to subscribers through various endpoints like email, mobile push notifications, and more.

A target is an endpoint or resource that EventBridge sends events to when they match the event pattern defined by a rule. The rule processes the event data and sends relevant information to the target.

Hence, the correct answers are:

 **– Identify sensitive data using Amazon Macie and create an Amazon EventBridge (Amazon CloudWatch Events) rule to capture the `SensitiveData` event type.**

 **– ** **Set up an Amazon SNS topic as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the error occurs again.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: ** Identify sensitive data using Amazon GuardDuty by creating an Amazon EventBridge (Amazon CloudWatch Events) rule to include the `CRITICAL` event types from GuardDuty findings ** is incorrect because Amazon GuardDuty is not well-equipped in identifying PII in Amazon S3. You have to use Amazon Macie findings in the Amazon EventBridge rule instead.

- The option that says: ** Set up an Amazon SQS as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the error occurs again.** is incorrect. Amazon SQS is useful for decoupling components and handling asynchronous communication but not for real-time notifications. The objective is to rectify the mistake of uploading sensitive customer data to an S3 bucket and prevent similar incidents in the future in AWS.

- The option that says: ** Set up an AWS IoT Message Broker as the target for an Amazon EventBridge (Amazon CloudWatch Events) rule that sends notifications when the `SensitiveData:S3Object/Personal` event occurs again ** is incorrect because AWS IoT Message Broker is not listed as a supported event target in the EventBridge console. Also, the primary use of AWS IoT Message Broker is IoT device communication and message routing within the AWS IoT service.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/EventBridge.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/EventBridge.html)
- [https://docs.aws.amazon.com/macie/latest/user/findings-types.html#findings-sensitive-data-types](https://docs.aws.amazon.com/macie/latest/user/findings-types.html#findings-sensitive-data-types)
- [https://docs.aws.amazon.com/macie/latest/user/findings-publish-event-schemas.html](https://docs.aws.amazon.com/macie/latest/user/findings-publish-event-schemas.html)

**Check out this Amazon Macie Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-macie/](https://tutorialsdojo.com/amazon-macie/)

---

## Câu 45 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company runs an application in an AWS Auto Scaling group of Amazon EC2 instances distributed across multiple Availability Zones behind an Application Load Balancer. The operations team regularly applies patches and maintenance to the fleet of EC2 instances using the <code>AWSEC2-PatchLoadBalancerInstance</code> AWS Systems Manager Automation document scheduled through Systems Manager Maintenance Windows.

On several occasions, some instances have been automatically terminated after failing HTTPS health checks in the Application Load Balancer, which results in the loss of ephemeral logs stored locally on the instance. A Solutions Architect must design a solution that ensures application and server logs are collected reliably. The solution must allow root cause analysis based on the logs, even if the Auto Scaling group immediately terminates the instance.

What is the EASIEST way for the Architect to automate the log collection from the EC2 instances?

### Các lựa chọn (Choices)
- [x] **A.** Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance-terminate Lifecycle Action` Auto Scaling Event with an associated AWS Lambda function. Trigger the Amazon CloudWatch agent to push the application logs and then resume the instance termination once all the logs are sent to CloudWatch Logs.
- [ ] **B.** Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Pending:Wait` state to delay the termination of the unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance-terminate Lifecycle Action` Auto Scaling Event with an associated AWS Lambda function. Set up a Systems Manager Automation script that collects and uploads the application logs from the instance to an Amazon CloudWatch Logs group. Configure the solution to only resume the instance termination once all the logs were successfully sent.
- [ ] **C.** Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of the unhealthy EC2 instances. Set up AWS Step Functions to collect the application logs and send them to an Amazon CloudWatch Log group. Configure the solution to resume the instance termination as soon as all the logs were successfully sent to CloudWatch Logs.
- [ ] **D.** Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of the unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance Terminate Successful` Auto Scaling Event with an associated AWS Lambda function. Set up the Systems Manager Run Command service to run a script that collects and uploads the application logs from the instance to an Amazon CloudWatch Logs group. Resume the instance termination once all the logs are sent.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance-terminate Lifecycle Action` Auto Scaling Event with an associated AWS Lambda function. Trigger the Amazon CloudWatch agent to push the application logs and then resume the instance termination once all the logs are sent to CloudWatch Logs.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The EC2 instances in an Auto Scaling group have a path, or lifecycle, that differs from that of other EC2 instances. The lifecycle starts when the Auto Scaling group launches an instance and puts it into service. The lifecycle ends when you terminate the instance, or the Auto Scaling group takes the instance out of service and terminates it.

You can add a lifecycle hook to your Auto Scaling group so that you can perform custom actions when instances launch or terminate.

When Amazon EC2 Auto Scaling responds to a scale-out event, it launches one or more instances. These instances start in the `Pending` state. If you added an `autoscaling:EC2_INSTANCE_LAUNCHING` lifecycle hook to your Auto Scaling group, the instances move from the `Pending` state to the `Pending:Wait` state. After you complete the lifecycle action, the instances enter the `Pending:Proceed` state. When the instances are fully configured, they are attached to the Auto Scaling group and they enter the `InService` state.

When Amazon EC2 Auto Scaling responds to a scale-in event, it terminates one or more instances. These instances are detached from the Auto Scaling group and enter the `Terminating` state. If you added an `autoscaling:EC2_INSTANCE_TERMINATING` lifecycle hook to your Auto Scaling group, the instances move from the `Terminating` state to the `Terminating:Wait` state. After you complete the lifecycle action, the instances enter the `Terminating:Proceed` state. When the instances are fully terminated, they enter the `Terminated` state.

![Auto Scaling Lifecycle](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/auto_scaling_lifecycle.png)

Using CloudWatch agent is the most suitable tool to use to collect the logs. The unified CloudWatch agent enables you to do the following:

– Collect more system-level metrics from Amazon EC2 instances across operating systems. The metrics can include in-guest metrics, in addition to the metrics for EC2 instances. The additional metrics that can be collected are listed in [Metrics Collected by the CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html).

– Collect system-level metrics from on-premises servers. These can include servers in a hybrid environment as well as servers not managed by AWS.

– Retrieve custom metrics from your applications or services using the `StatsD` and `collectd` protocols. `StatsD` is supported on both Linux servers and servers running Windows Server. `collectd` is supported only on Linux servers.

– Collect logs from Amazon EC2 instances and on-premises servers, running either Linux or Windows Server.

You can store and view the metrics that you collect with the CloudWatch agent in CloudWatch just as you can with any other CloudWatch metrics. The default namespace for metrics collected by the CloudWatch agent is `CWAgent`, although you can specify a different namespace when you configure the agent.

![Amazon EventBridge Rules](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Amazon EventBridge Rules-25MAR2026.png)

Amazon EventBridge allows you to create event-driven rules that monitor resources and trigger actions in other AWS services. Events from Amazon EC2 Auto Scaling are delivered to EventBridge in near real time. You can set up EventBridge rules that initiate programmatic actions and send notifications in response to various events. For example, while instances are launching or terminating, you can invoke an AWS Lambda function to carry out a preconfigured task.

Hence, the correct answer is: **Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance-terminate Lifecycle Action` Auto Scaling Event with an associated AWS Lambda function. Trigger the Amazon CloudWatch agent to push the application logs and then resume the instance termination once all the logs are sent to CloudWatch Logs.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Pending:Wait` state to delay the termination of the unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance-terminate Lifecycle Action` Auto Scaling Event with an associated AWS Lambda function. Set up a Systems Manager Automation script that collects and uploads the application logs from the instance to an Amazon CloudWatch Logs group. Configure the solution to only resume the instance termination once all the logs were successfully sent** is incorrect because the ***`Pending:Wait` *** state primarily refers to the scale-out action in Amazon EC2 Auto Scaling and not for scale-in or for terminating the instances.

- The option that says: **Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of the unhealthy EC2 instances. Set up AWS Step Functions to collect the application logs and send them to an Amazon CloudWatch Log group. Configure the solution to resume the instance termination as soon as all the logs were successfully sent to CloudWatch Logs** is incorrect because using AWS Step Functions is inappropriate for collecting the logs from your EC2 instances. You should use a CloudWatch agent instead.

- The option that says: **Add a lifecycle hook to your Auto Scaling group to move instances in the `Terminating` state to the `Terminating:Wait` state to delay the termination of the unhealthy EC2 instances. Configure an Amazon EventBridge rule for the `EC2 Instance Terminate Successful` Auto Scaling Event with an associated AWS Lambda function. Set up the Systems Manager Run Command service to run a script that collects and uploads the application logs from the instance to an Amazon CloudWatch Logs group. Resume the instance termination once all the logs are sent** is incorrect. Although this solution could typically work, it entails a lot of effort to write a custom script that the AWS Systems Manager Run Command will run. Remember that the scenario asks for a solution that you can implement with the least amount of effort. This solution can be simplified by automatically uploading the logs using a CloudWatch Agent. You have to use the `EC2 Instance-terminate Lifecycle Action` event instead.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html)
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/automating-ec2-auto-scaling-with-eventbridge.html#terminate-successful](https://docs.aws.amazon.com/autoscaling/ec2/userguide/automating-ec2-auto-scaling-with-eventbridge.html#terminate-successful)
- [https://aws.amazon.com/premiumsupport/knowledge-center/auto-scaling-delay-termination/](https://aws.amazon.com/premiumsupport/knowledge-center/auto-scaling-delay-termination/)

**Check out this AWS Auto Scaling Cheat Sheet:**
- [https://tutorialsdojo.com/aws-auto-scaling/](https://tutorialsdojo.com/aws-auto-scaling/)

---

## Câu 46 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company has recently adopted a hybrid cloud architecture and is planning to migrate a database hosted on-premises to AWS. The database currently has over 50 TB of consumer data, handles highly transactional (Online Transaction Processing – OLTP) workloads, and is expected to grow. The Solutions Architect should ensure that the database is ACID-compliant and can handle complex application queries.

Which type of database service should the Architect use?

### Các lựa chọn (Choices)
- [ ] **A.** Amazon Redshift
- [ ] **B.** Amazon DynamoDB
- [x] **C.** Amazon Aurora
- [ ] **D.** Amazon RDS

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Amazon Aurora

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Aurora** is a fully managed relational database engine compatible with MySQL and PostgreSQL. You already know how MySQL and PostgreSQL combine the speed and reliability of high-end commercial databases with the simplicity and cost-effectiveness of open-source databases. The code, tools, and applications you use today with your existing MySQL and PostgreSQL databases can be used with Aurora. With some workloads, Aurora can deliver up to five times the throughput of MySQL and up to three times the throughput of PostgreSQL without requiring changes to most of your existing applications.

Aurora uses a highly efficient, distributed storage architecture designed for performance and resilience. Its MySQL- and PostgreSQL-compatible engines are enhanced to leverage a durable, self-repairing storage layer that maintains synchronous copies of data across multiple Availability Zones. This storage layer can expand automatically in 10 GB increments, supporting up to 128 TiB per database cluster. In addition, Aurora manages clustering, replication, automated backups, and failover seamlessly, reducing the operational complexity often involved in traditional database management.

![RDS vs NoSQL Database Table](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-01-04_04-04-51-474a73beda1fc209d60e63ed8d226b6a.png)

In Amazon RDS for MariaDB, when using InnoDB file-per-table tablespaces (which is enabled by default), each table resides in its own tablespace. AWS documentation notes that the maximum table size under this configuration is 16 TB, and that the system tablespace is similarly limited. Larger table sizes may necessitate partitioning to avoid performance or recovery issues.

![Amazon Aurora](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/td-amazon-aurora-28Oct2025.png)

Hence, the correct answer is: **Amazon Aurora.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon Redshift** is incorrect because this is primarily used for OLAP applications and not for OLTP. Moreover, it doesn’t scale automatically to handle the exponential growth of the database.

- **Amazon DynamoDB** is incorrect. Although you can typically use this to have an ACID-compliant database, it cannot handle complex queries and highly transactional (OLTP) workloads.

- **Amazon RDS** is incorrect. Although this service can host an ACID-compliant relational database that can handle complex queries and transactional (OLTP) workloads, it is still not scalable to handle the growth of the database. Amazon Aurora is the better choice as its underlying storage can grow automatically as needed.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/rds/aurora/](https://aws.amazon.com/rds/aurora/)
- [https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SQLtoNoSQL.html](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SQLtoNoSQL.html)
- [https://aws.amazon.com/nosql/](https://aws.amazon.com/nosql/)

**Check out this Amazon Aurora Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-aurora/](https://tutorialsdojo.com/amazon-aurora/)

---

## Câu 47 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company troubleshoots the operational issues of their cloud architecture by logging the AWS API call history of all AWS resources. The Solutions Architect must implement a solution to quickly identify the most recent changes made to resources in their environment, including creation, modification, and deletion of AWS resources. One of the requirements is that the generated log files should be encrypted to avoid any security issues.

Which of the following is the most suitable approach to implement the encryption?

### Các lựa chọn (Choices)
- [ ] **A.** Use CloudTrail and configure the destination S3 bucket to use Server Side Encryption (SSE) with AES-128 encryption algorithm.
- [x] **B.** Use CloudTrail with its default settings.
- [ ] **C.** Use CloudTrail and configure the destination Amazon Glacier archive to use Server-Side Encryption (SSE).
- [ ] **D.** Use CloudTrail and configure the destination S3 bucket to use Server-Side Encryption (SSE).

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use CloudTrail with its default settings.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
By default, CloudTrail event log files are encrypted using Amazon S3 server-side encryption (SSE). You can also choose to encrypt your log files with an AWS Key Management Service (AWS KMS) key. You can store your log files in your bucket for as long as you want. You can also define Amazon S3 lifecycle rules to archive or delete log files automatically. If you want notifications about log file delivery and validation, you can set up Amazon SNS notifications.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/cloudtrail_flow_9.png)

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Using CloudTrail and configuring the destination Amazon Glacier archive to use Server-Side Encryption (SSE)** is incorrect because CloudTrail stores the log files to S3 and not in Glacier. Take note that by default, CloudTrail event log files are already encrypted using Amazon S3 server-side encryption (SSE).

- **Using CloudTrail and configuring the destination S3 bucket to use Server-Side Encryption (SSE)** is incorrect because CloudTrail event log files are already encrypted using the Amazon S3 server-side encryption (SSE) which is why you do not have to do this anymore.

- **Use CloudTrail and configure the destination S3 bucket to use Server Side Encryption (SSE) with AES-128 encryption algorithm** is incorrect because Cloudtrail event log files are already encrypted using the Amazon S3 server-side encryption (SSE) by default. Additionally, SSE-S3 only uses the AES-256 encryption algorithm and not the AES-128.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/awscloudtrail/latest/userguide/how-cloudtrail-works.html](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/how-cloudtrail-works.html)
- [https://aws.amazon.com/blogs/aws/category/cloud-trail/](https://aws.amazon.com/blogs/aws/category/cloud-trail/)

**Check out this AWS CloudTrail Cheat Sheet:**
- [https://tutorialsdojo.com/aws-cloudtrail/](https://tutorialsdojo.com/aws-cloudtrail/)

---

## Câu 48 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A Solutions Architect joined a large tech company with an existing Amazon VPC. When reviewing the Auto Scaling events, the Architect noticed that their web application is scaling up and down multiple times within the hour.

What design change could the Architect make to optimize cost while preserving elasticity?

### Các lựa chọn (Choices)
- [ ] **A.** Add provisioned IOPS to the instances
- [x] **B.** Change the cooldown period of the Auto Scaling group and set the CloudWatch metric to a higher threshold
- [ ] **C.** Increase the base number of Auto Scaling instances for the Auto Scaling group
- [ ] **D.** Upgrade the instance type in the launch template.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Change the cooldown period of the Auto Scaling group and set the CloudWatch metric to a higher threshold

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Since the application is scaling up and down multiple times within the hour, the issue lies in the cooldown period of the Auto Scaling group.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/lifecycle_hooks.png)

The cooldown period is a configurable setting for your Auto Scaling group that helps to ensure that it doesn’t launch or terminate additional instances before the previous scaling activity takes effect. After the Auto Scaling group dynamically scales using a simple scaling policy, it waits for the cooldown period to complete before resuming scaling activities.

When you manually scale your Auto Scaling group, the default is not to wait for the cooldown period, but you can override the default and honor the cooldown period. If an instance becomes unhealthy, the Auto Scaling group does not wait for the cooldown period to complete before replacing the unhealthy instance.

Hence, the correct answer is: **Change the cooldown period of the Auto Scaling group and set the CloudWatch metric to a higher threshold.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Upgrade the instance type in the launch** **template** is incorrect because upgrading the instance type could lead to higher costs, which contradicts the goal of optimizing costs. Moreover, it doesn’t address the issue of the application scaling up and down multiple times within the hour.

- The option that says: **Increase the base number of Auto Scaling instances for the Auto Scaling group** is incorrect because increasing the base number of instances would mean that there are more instances running at all times, even during periods of low demand. This could lead to unnecessary costs if the demand doesn’t require that many instances, again contradicting the goal of cost optimization.

- The option that says: **Add provisioned IOPS to the instances** is incorrect because it is a feature that allows you to specify a certain number of IOPS for your database. It doesn’t directly address the issue of the application scaling up and down frequently. Moreover, provisioned IOPS comes with additional costs, so this could increase rather than optimize costs.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [http://docs.aws.amazon.com/autoscaling/latest/userguide/as-scale-based-on-demand.html](http://docs.aws.amazon.com/autoscaling/latest/userguide/as-scale-based-on-demand.html)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 49 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A startup needs to use a shared file system for its .NET web application running on an Amazon EC2 Windows instance. The file system must provide a high level of throughput and IOPS that can also be integrated with Microsoft Active Directory.

Which is the MOST suitable service that you should use to achieve this requirement?

### Các lựa chọn (Choices)
- [x] **A.** Amazon FSx for Windows File Server
- [ ] **B.** AWS Storage Gateway – File Gateway
- [ ] **C.** Amazon EBS Provisioned IOPS SSD volumes
- [ ] **D.** Amazon Elastic File System

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Amazon FSx for Windows File Server

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon FSx for Windows File Server** provides fully managed, highly reliable, and scalable file storage accessible over the industry-standard Service Message Block (SMB) protocol. It is built on Windows Server, delivering a wide range of administrative features such as user quotas, end-user file restore, and Microsoft Active Directory (AD) integration.

Amazon FSx supports the use of Microsoft’s Distributed File System (DFS) Namespaces to scale-out performance across multiple file systems in the same namespace up to tens of Gbps and millions of IOPS.

![FSx_Windows_File_Server_How-it-Works](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/FSx_Windows_File_Server_How-it-Works.9396055e727c3903de991e7f3052ec295c86f274.png)

The key phrases in this scenario are “file system” and “Active Directory integration.” You need to implement a solution that will meet these requirements. Among the options given, the possible answers are FSx Windows File Server and File Gateway. But you need to consider that the question also states that you need to provide a high level of throughput and IOPS. Amazon FSx Windows File Server can scale out storage to hundreds of petabytes of data with tens of GB/s of throughput performance and millions of IOPS.

Hence, the correct answer is: **Amazon FSx for Windows File Server** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon EBS Provisioned IOPS SSD volumes** is incorrect because this is just a block storage volume and not a full-fledged file system. Amazon EBS is primarily used as persistent block storage for EC2 instances.

- **Amazon Elastic File System** is incorrect because it is stated in the scenario that the startup uses an Amazon EC2 Windows instance. Remember that Amazon EFS can only handle Linux workloads.

- **AWS Storage Gateway – File Gateway** is incorrect. Although it can be used as a shared file system for Windows and can also be integrated with Microsoft Active Directory, Amazon FSx still has a higher level of throughput and IOPS compared with AWS Storage Gateway. Amazon FSX is capable of providing hundreds of thousands (or even millions) of IOPS.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/fsx/windows/faqs/](https://aws.amazon.com/fsx/windows/faqs/)
- [https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html)

**Check out this Amazon FSx Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-fsx/](https://tutorialsdojo.com/amazon-fsx/)

---

## Câu 50 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company is using AWS IAM to manage access to AWS services. The Solutions Architect of the company created the following IAM policy for AWS Lambda:

`

{

"Version": "2012-10-17",

"Statement": [

{

"Effect": "Allow",

"Action": [

"lambda:CreateFunction",

"lambda:DeleteFunction"

],

"Resource": "*"

},

{

"Effect": "Deny",

"Action": [

"lambda:CreateFunction",

"lambda:DeleteFunction",

"lambda:InvokeFunction",

"lambda:TagResource"

],

"Resource": "*",

"Condition": {

"IpAddress": {

"aws:SourceIp": "187.5.104.11/32"

}

}

}

]

}

`

Which of the following options is allowed by this policy?

### Các lựa chọn (Choices)
- [ ] **A.** Create an AWS Lambda function using the `187.5.104.11/32` address.
- [x] **B.** Create an AWS Lambda function using the `100.220.0.11/32` address.
- [ ] **C.** Delete an AWS Lambda function using the `187.5.104.11/32` address.
- [ ] **D.** Delete an AWS Lambda function from any network address.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Create an AWS Lambda function using the `100.220.0.11/32` address.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You manage access in AWS by creating policies and attaching them to IAM identities (users, groups of users, or roles) or AWS resources. A policy is an object in AWS that, when associated with an identity or resource, defines their permissions. AWS evaluates these policies when an IAM principal (user or role) makes a request. Permissions in the policies determine whether the request is allowed or denied. Most policies are stored in AWS as JSON documents.

![ JSON policy document structure ](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AccessPolicyLanguage_General_Policy_Structure.diagram.png)

You can use AWS Identity and Access Management (IAM) to manage access to the Lambda API and resources like functions and layers. Based on the given IAM policy, you can create and delete a Lambda function from any network address except for the IP address 187.5.104.11/32. Since the IP address 100.220.0.11/32 is not denied in the policy, you can use this address to create a Lambda function.

Hence, the correct answer is: **Create an AWS Lambda function using the `100.220.0.11/32` address** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Delete an AWS Lambda function using the `187.5.104.11/32` address** is incorrect because the source IP used in this option is denied by the IAM policy.

- The option that says: **Delete an AWS Lambda function from any network address** is incorrect. You can’t delete a Lambda function from any network address because the address `187.5.104.11/32` is denied by the policy.

- The option that says: **Create an AWS Lambda function using the `187.5.104.11/32` address** is incorrect. Just like the option above, the IAM policy denied the IP address 187.5.104.11/32.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)
- [https://docs.aws.amazon.com/lambda/latest/dg/lambda-permissions.html](https://docs.aws.amazon.com/lambda/latest/dg/lambda-permissions.html)

**Check out this AWS IAM Cheat Sheet:**
- [https://tutorialsdojo.com/aws-identity-and-access-management-iam/](https://tutorialsdojo.com/aws-identity-and-access-management-iam/)

---

## Câu 51 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
An application is hosted on an EC2 instance with multiple EBS Volumes attached and uses Amazon Neptune as its database. To improve data security, you encrypted all of the EBS volumes attached to the instance to protect the confidential data stored in the volumes.

Which of the following statements are true about encrypted Amazon Elastic Block Store volumes? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Only the data in the volume is encrypted and not all the data moving between the volume and the instance.
- [ ] **B.** Snapshots are not automatically encrypted.
- [x] **C.** All data moving between the volume and the instance are encrypted.
- [ ] **D.** The volumes created from the encrypted snapshot are not encrypted.
- [x] **E.** Snapshots are automatically encrypted.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C, E**
> - **C.** All data moving between the volume and the instance are encrypted.
> - **E.** Snapshots are automatically encrypted.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Elastic Block Store (Amazon EBS)** provides block-level storage volumes for use with EC2 instances. EBS volumes are highly available and reliable storage volumes that can be attached to any running instance that is in the same Availability Zone. EBS volumes that are attached to an EC2 instance are exposed as storage volumes that persist independently from the life of the instance.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/architecture_storage.png)

When you create an encrypted EBS volume and attach it to a supported instance type, the following types of data are encrypted:

– Data at rest inside the volume

– All data moving between the volume and the instance

– All snapshots created from the volume

– All volumes created from those snapshots

Encryption operations occur on the servers that host EC2 instances, ensuring the security of both data-at-rest and data-in-transit between an instance and its attached EBS storage. You can encrypt both the boot and data volumes of an EC2 instance.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)

**Check out this Amazon EBS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)

---

## Câu 52 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company needs secure access to its Amazon RDS for MySQL database that is used by multiple applications. Each IAM user must use a short-lived authentication token to connect to the database.

Which of the following is the most suitable solution in this scenario?

### Các lựa chọn (Choices)
- [ ] **A.** Use AWS IAM Identity Center to access the RDS database.
- [ ] **B.** Use AWS Secrets Manager to generate and store short-lived authentication tokens.
- [x] **C.** Use IAM DB Authentication and create database accounts using the AWS-provided `AWSAuthenticationPlugin` plugin in MySQL.
- [ ] **D.** Use an MFA token to access and connect to a database.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Use IAM DB Authentication and create database accounts using the AWS-provided `AWSAuthenticationPlugin` plugin in MySQL.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You can authenticate to your DB instance using AWS Identity and Access Management (IAM) database authentication. IAM database authentication works with MySQL and PostgreSQL. With this authentication method, you don’t need to use a password when you connect to a DB instance.

An **authentication token** is a string of characters that you use instead of a password. After you generate an authentication token, it’s valid for 15 minutes before it expires. If you try to connect using an expired token, the connection request is denied.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2019-01-13_07-04-06-a2157247b0fa129795001208504fcb51.png)

Since the scenario asks you to create a short-lived authentication token to access an Amazon RDS database, you can use an IAM database authentication when connecting to a database instance. Authentication is handled by `AWSAuthenticationPlugin`—an AWS-provided plugin that works seamlessly with IAM to authenticate your IAM users. **``**

IAM database authentication provides the following benefits:

- Network traffic to and from the database is encrypted using Secure Sockets Layer (SSL).

- You can use IAM to centrally manage access to your database resources instead of managing access individually on each DB instance.

- For applications running on Amazon EC2, you can use profile credentials specific to your EC2 instance to access your database instead of a password for greater security

Hence, the correct answer is the option that says: ** Use IAM DB Authentication and create database accounts using the AWS-provided `AWSAuthenticationPlugin` plugin in MySQL.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use AWS IAM Identity Center to access the RDS database** is incorrect because AWS IAM Identity Center just enables you to centrally manage workforce access for all of your AWS accounts managed through AWS Organizations. It does not provide a centralized access point for RDS databases.

- The option that says: **Use AWS Secrets Manager to generate and store short-lived authentication tokens** is incorrect because AWS Secrets Manager is not a suitable service to create an authentication token to access an Amazon RDS database. It’s primarily used to store passwords, secrets, and other sensitive credentials. It can’t generate a short-lived token either. You have to use IAM DB Authentication instead.

- The option that says: **Use an MFA token to access and connect to a database** is incorrect because you can’t use an MFA token to connect to your database. You have to set up IAM DB Authentication instead.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.Connecting.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.Connecting.html)
- [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.DBAccounts.html](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.DBAccounts.html)

**Check out this AWS IAM Cheat Sheet:**
- [https://tutorialsdojo.com/aws-identity-and-access-management-iam/](https://tutorialsdojo.com/aws-identity-and-access-management-iam/)

---

## Câu 53 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company has multiple AWS Site-to-Site VPN connections placed between its VPCs and its remote network. During peak hours, many employees are experiencing slow connectivity issues, which limits productivity. The company has asked a solutions architect to scale the throughput of the VPN connections.

Which solution should the architect carry out?

### Các lựa chọn (Choices)
- [x] **A.** Associate the VPCs with an Equal Cost Multipath (ECMP) routing-enabled transit gateway and attach additional VPN tunnels.
- [ ] **B.** Re-route some of the VPN connections to a secondary customer gateway device on the remote network’s end.
- [ ] **C.** Add more virtual private gateways to a VPC and enable Equal Cost Multipath (ECMP) routing to get higher VPN bandwidth.
- [ ] **D.** Modify the VPN configuration by increasing the number of tunnels to scale the throughput.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Associate the VPCs with an Equal Cost Multipath (ECMP) routing-enabled transit gateway and attach additional VPN tunnels.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
With AWS Transit Gateway, you can simplify the connectivity between multiple VPCs and also connect to any VPC attached to AWS Transit Gateway with a single VPN connection.

![Multiple-Tunnels](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Multiple-Tunnels.png)

AWS Transit Gateway also enables you to scale the IPsec VPN throughput with equal-cost multi-path (ECMP) routing support over multiple VPN tunnels. A single VPN tunnel still has a maximum throughput of 1.25 Gbps. If you establish multiple VPN tunnels to an ECMP-enabled transit gateway, it can scale beyond the default limit of 1.25 Gbps.

Hence, the correct answer is: **Associate the VPCs with an Equal Cost Multipath (ECMP) routing-enabled transit gateway and attach additional VPN tunnels.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Add more virtual private gateways to a VPC and enable Equal Cost Multipath (ECMP) routing to get higher VPN bandwidth** is incorrect because a VPC can only have a single virtual private gateway attached to it at a time. Also, there is no option to enable ECMP in a virtual private gateway.

- The option that says: **Modify the VPN configuration by increasing the number of tunnels to scale the throughput** is incorrect. The maximum number of tunnels for a VPN connection is two. You cannot increase this beyond its limit.

- The option that says: **Re-route some of the VPN connections to a secondary customer gateway device on the remote network’s end** is incorrect. This would simply increase connection redundancy and won’t increase throughput. For example, connections can fail over to the secondary customer gateway device in case the primary customer gateway device becomes unavailable.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/premiumsupport/knowledge-center/transit-gateway-ecmp-multiple-tunnels/](https://aws.amazon.com/premiumsupport/knowledge-center/transit-gateway-ecmp-multiple-tunnels/)
- [https://aws.amazon.com/blogs/networking-and-content-delivery/scaling-vpn-throughput-using-aws-transit-gateway/](https://aws.amazon.com/blogs/networking-and-content-delivery/scaling-vpn-throughput-using-aws-transit-gateway/)

**Check out this AWS Transit Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-transit-gateway/](https://tutorialsdojo.com/aws-transit-gateway/)

---

## Câu 54 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company is planning to launch a High Performance Computing (HPC) cluster in AWS that does Computational Fluid Dynamics (CFD) simulations. The solution should scale-out their simulation jobs to experiment with more tunable parameters for faster and more accurate results. The cluster is composed of Windows servers hosted on t3a.medium EC2 instances. As the Solutions Architect, you should ensure that the architecture provides higher bandwidth, higher packet per second (PPS) performance, and consistently lower inter-instance latencies.

Which is the MOST suitable and cost-effective solution that the Architect should implement to achieve the above requirements?

### Các lựa chọn (Choices)
- [x] **A.** Enable Enhanced Networking with Elastic Network Adapter (ENA) on the Windows EC2 Instances.
- [ ] **B.** Enable Enhanced Networking with Elastic Fabric Adapter (EFA) on the Windows EC2 Instances.
- [ ] **C.** Use AWS ParallelCluster to deploy and manage the HPC cluster to provide higher bandwidth, higher packet per second (PPS) performance, and lower inter-instance latencies.
- [ ] **D.** Enable Enhanced Networking with Intel 82599 Virtual Function (VF) interface on the Windows EC2 Instances.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Enable Enhanced Networking with Elastic Network Adapter (ENA) on the Windows EC2 Instances.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Enhanced networking uses single root I/O virtualization (SR-IOV) to provide high-performance networking capabilities on supported instance types. SR-IOV is a method of device virtualization that provides higher I/O performance and lower CPU utilization when compared to traditional virtualized network interfaces. Enhanced networking provides higher bandwidth, higher packet per second (PPS) performance, and consistently lower inter-instance latencies. There is no additional charge for using enhanced networking.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-01-10_11-44-29-f938be2240ccd0493d45bd80ca276619.png)

Amazon EC2 provides enhanced networking capabilities through the Elastic Network Adapter (ENA). It supports network speeds of up to 100 Gbps for supported instance types. Elastic Network Adapters (ENAs) provide traditional IP networking features that are required to support VPC networking.

An Elastic Fabric Adapter (EFA) is simply an Elastic Network Adapter (ENA) with added capabilities. It provides all of the functionality of an ENA, with additional OS-bypass functionality. OS-bypass is an access model that allows HPC and machine learning applications to communicate directly with the network interface hardware to provide low-latency, reliable transport functionality.

The OS-bypass capabilities of EFAs are not supported on Windows instances. If you attach an EFA to a Windows instance, the instance functions as an Elastic Network Adapter without the added EFA capabilities.

Hence, the correct answer is to **Enable Enhanced Networking with Elastic Network Adapter (ENA) on the Windows EC2 Instances** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Enabling Enhanced Networking with Elastic Fabric Adapter (EFA) on the Windows EC2 Instances** is incorrect because the OS-bypass capabilities of the Elastic Fabric Adapter (EFA) are not supported on Windows instances. Although you can attach EFA to your Windows instances, this will just act as a regular Elastic Network Adapter without the added EFA capabilities. Moreover, it doesn’t support the t3a.medium instance type that is being used in the HPC cluster.

- **Enabling Enhanced Networking with Intel 82599 Virtual Function (VF) interface on the Windows EC2 Instances** is incorrect. Although you can attach an Intel 82599 Virtual Function (VF) interface to your Windows EC2 Instances to improve its networking capabilities, it doesn’t support the t3a.medium instance type that is being used in the HPC cluster.

- **Using AWS ParallelCluster to deploy and manage the HPC cluster to provide higher bandwidth, higher packet per second (PPS) performance, and lower inter-instance latencies** is incorrect because an AWS ParallelCluster is just an AWS-supported open-source cluster management tool that makes it easy for you to deploy and manage High-Performance Computing (HPC) clusters on AWS. It does not provide higher bandwidth, higher packet per second (PPS) performance, and lower inter-instance latencies, unlike ENA or EFA.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa.html)

---

## Câu 55 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
An organization plans to run an application in a dedicated physical server that doesn’t use virtualization. The application data will be stored in a storage solution that uses an NFS protocol. To prevent data loss, you need to use a durable cloud storage service to store a copy of your data.

Which of the following is the most suitable solution to meet the requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Use AWS Storage Gateway with a gateway VM appliance for your compute resources. Configure File Gateway to store the application data and backup data.
- [ ] **B.** Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data.
- [ ] **C.** Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and backup data.
- [x] **D.** Use an AWS Storage Gateway hardware appliance for your compute resources. Configure File Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Use an AWS Storage Gateway hardware appliance for your compute resources. Configure File Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Storage Gateway** is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage by linking it to S3. Storage Gateway provides 3 types of storage solutions for your on-premises applications: file, volume, and tape gateways. The AWS Storage Gateway Hardware Appliance is a physical, standalone, validated server configuration for on-premises deployments.

![How File Gateway works](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/File-Gateway-How-it-Works.6a5ce3c54688864e5b951df9cb8732fc4f2926b4.png)

The AWS Storage Gateway Hardware Appliance is a physical hardware appliance with the Storage Gateway software preinstalled on a validated server configuration. The hardware appliance is a high-performance 1U server that you can deploy in your data center or on-premises inside your corporate firewall. When you buy and activate your hardware appliance, the activation process associates your hardware appliance with your AWS account. After activation, your hardware appliance appears in the console as a gateway on the *Hardware* page. You can configure your hardware appliance as a file gateway, tape gateway, or volume gateway type. The procedure that you use to deploy and activate these gateway types on a hardware appliance is the same as on a virtual platform.

Since the company needs to run a dedicated physical appliance, you can use an AWS Storage Gateway Hardware Appliance. It comes pre-loaded with Storage Gateway software and provides all the required resources to create a file gateway. A file gateway can be configured to store and retrieve objects in Amazon S3 using the protocols NFS and SMB.

Hence, the correct answer in this scenario is: **Use an AWS Storage Gateway hardware appliance for your compute resources. Configure File Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use AWS Storage Gateway with a gateway VM appliance for your compute resources. Configure File Gateway to store the application data and backup data** is incorrect because as per the scenario, the company needs to use an on-premises hardware appliance and not just a Virtual Machine (VM).

- The options that say: **Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and backup data ** and ** ** **Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data** are both incorrect. As per the scenario, the requirement is a file system that uses an NFS protocol and not iSCSI devices. Among the AWS Storage Gateway storage solutions, only file gateway can store and retrieve objects in Amazon S3 using the protocols NFS and SMB.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/storagegateway/latest/userguide/hardware-appliance.html](https://docs.aws.amazon.com/storagegateway/latest/userguide/hardware-appliance.html)
- [https://docs.aws.amazon.com/storagegateway/latest/userguide/WhatIsStorageGateway.html](https://docs.aws.amazon.com/storagegateway/latest/userguide/WhatIsStorageGateway.html)

**Check out this AWS Storage Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-storage-gateway/](https://tutorialsdojo.com/aws-storage-gateway/)

---

## Câu 56 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
An application is hosted in an Auto Scaling group of EC2 instances. To improve the monitoring process, you have to configure the current capacity to increase or decrease based on a set of scaling adjustments. This should be done by specifying the scaling metrics and threshold values for the CloudWatch alarms that trigger the scaling process.

Which of the following is the most suitable type of scaling policy that you should use?

### Các lựa chọn (Choices)
- [ ] **A.** Scheduled Scaling
- [x] **B.** Step scaling
- [ ] **C.** Target tracking scaling
- [ ] **D.** Simple scaling

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Step scaling

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
With step scaling, you choose scaling metrics and threshold values for the CloudWatch alarms that trigger the scaling process as well as define how your scalable target should be scaled when a threshold is in breach for a specified number of evaluation periods. Step scaling policies increase or decrease the current capacity of a scalable target based on a set of scaling adjustments, known as step adjustments. The adjustments vary based on the size of the alarm breach. After a scaling activity is started, the policy continues to respond to additional alarms, even while a scaling activity is in progress. Therefore, all alarms that are breached are evaluated by Application Auto Scaling as it receives the alarm messages.

When you configure dynamic scaling, you must define how to scale in response to changing demand. For example, you have a web application that currently runs on two instances and you want the CPU utilization of the Auto Scaling group to stay at around 50 percent when the load on the application changes. This gives you extra capacity to handle traffic spikes without maintaining an excessive amount of idle resources. You can configure your Auto Scaling group to scale automatically to meet this need. The policy type determines how the scaling action is performed.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/as_create_stepped_group_5.png)

 Amazon EC2 Auto Scaling supports the following types of scaling policies:

 **Target tracking scaling –** Increase or decrease the current capacity of the group based on a target value for a specific metric. This is similar to the way that your thermostat maintains the temperature of your home – you select a temperature and the thermostat does the rest.

 **Step scaling –** Increase or decrease the current capacity of the group based on a set of scaling adjustments, known as *step adjustments*, that vary based on the size of the alarm breach.

 **Simple scaling –** Increase or decrease the current capacity of the group based on a single scaling adjustment.

If you are scaling based on a utilization metric that increases or decreases proportionally to the number of instances in an Auto Scaling group, then it is recommended that you use target tracking scaling policies. Otherwise, it is better to use step scaling policies instead.

Hence, the correct answer in this scenario is **Step Scaling** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Target tracking scaling** is incorrect because the target tracking scaling policy increases or decreases the current capacity of the group based on a **target value for a specific metric** instead of a set of scaling adjustments.

- **Simple scaling** is incorrect because the simple scaling policy increases or decreases the current capacity of the group based on a **single** scaling adjustment instead of a set of scaling adjustments.

- **Scheduled Scaling** is incorrect because the scheduled scaling policy is based on a schedule that allows you to set your own scaling schedule for **predictable** load changes. This is not considered as one of the types of dynamic scaling.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html)
- [https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html)

---

## Câu 57 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company plans to design a highly available architecture in AWS. They have two target groups with three EC2 instances each, which are added to an Application Load Balancer. In the security group of the EC2 instance, you have verified that port 80 for HTTP is allowed. However, the instances are still showing out of service from the load balancer.

What could be the root cause of this issue?

### Các lựa chọn (Choices)
- [ ] **A.** The wrong subnet was used in your VPC
- [x] **B.** The health check configuration is not properly defined.
- [ ] **C.** The instances are using the wrong AMI.
- [ ] **D.** The wrong instance type was used for the EC2 instance.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** The health check configuration is not properly defined.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Since the security group is properly configured, the issue may be caused by a wrong **health check configuration** in the Target Group.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS-ELB-HealthCheck.png)

Your **Application Load Balancer** periodically sends requests to its registered targets to test their status. These tests are called *health checks*. Each load balancer node routes requests only to the healthy targets in the enabled Availability Zones for the load balancer. Each load balancer node checks the health of each target, using the health check settings for the target group with which the target is registered. After your target is registered, it must pass one health check to be considered healthy. After each health check is completed, the load balancer node closes the connection that was established for the health check.

Hence, the options such as **using the wrong AMI** , **instance type** , or **subnet** , are less likely to be the cause of the problem, as they wouldn’t directly affect the health check status reported by the load balancer.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html)

**Check out this AWS Elastic Load Balancing (ELB) Cheat Sheet:**
- [https://tutorialsdojo.com/aws-elastic-load-balancing-elb/](https://tutorialsdojo.com/aws-elastic-load-balancing-elb/)

**ELB Health Checks vs Route 53 Health Checks For Target Health Monitoring:**
- [https://tutorialsdojo.com/elb-health-checks-vs-route-53-health-checks-for-target-health-monitoring/](https://tutorialsdojo.com/elb-health-checks-vs-route-53-health-checks-for-target-health-monitoring/)

---

## Câu 58 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A news company is planning to use a Hardware Security Module (CloudHSM) in AWS for secure key storage of their web applications. You have launched the CloudHSM cluster but after just a few hours, a support staff mistakenly attempted to log in as the administrator three times using an invalid password in the Hardware Security Module. This has caused the HSM to be zeroized, which means that the encryption keys on it have been wiped. Unfortunately, you did not have a copy of the keys stored anywhere else.

How can you obtain a new copy of the keys that you have stored on Hardware Security Module?

### Các lựa chọn (Choices)
- [ ] **A.** Use the Amazon CLI to get a copy of the keys.
- [x] **B.** The keys are lost permanently if you did not have a copy.
- [ ] **C.** Restore a snapshot of the Hardware Security Module.
- [ ] **D.** Contact AWS Support and they will provide you a copy of the keys.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** The keys are lost permanently if you did not have a copy.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Attempting to log in as the administrator more than twice with the wrong password zeroizes your HSM appliance. When an HSM is zeroized, all keys, certificates, and other data on the HSM is destroyed. You can use your cluster’s security group to prevent an unauthenticated user from zeroizing your HSM.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/CloudHSM_Diagrams_2-final.6f427ebb14d021b9cd6120aeee72cf4d3723e89b.jpg)

Amazon does not have access to your keys nor to the credentials of your Hardware Security Module (HSM) and therefore has no way to recover your keys if you lose your credentials. Amazon strongly recommends that you use two or more HSMs in separate Availability Zones in any production CloudHSM Cluster to avoid loss of cryptographic keys.

Refer to the CloudHSM FAQs for reference:

 **Q: Could I lose my keys if a single HSM instance fails?**

Yes. It is possible to lose keys that were created since the most recent daily backup if the CloudHSM cluster that you are using fails and you are not using two or more HSMs. Amazon strongly recommends that you use two or more HSMs, in separate Availability Zones, in any production CloudHSM Cluster to avoid loss of cryptographic keys.

 **Q: Can Amazon recover my keys if I lose my credentials to my HSM?**

No. Amazon does not have access to your keys or credentials and therefore has no way to recover your keys if you lose your credentials.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/premiumsupport/knowledge-center/stop-cloudhsm/](https://aws.amazon.com/premiumsupport/knowledge-center/stop-cloudhsm/)
- [https://aws.amazon.com/cloudhsm/faqs/](https://aws.amazon.com/cloudhsm/faqs/)
- [https://d1.awsstatic.com/whitepapers/Security/security-of-aws-cloudhsm-backups.pdf](https://d1.awsstatic.com/whitepapers/Security/security-of-aws-cloudhsm-backups.pdf)

---

## Câu 59 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
An On-Demand EC2 instance is launched into a VPC subnet with the Network ACL configured to allow all inbound traffic and deny all outbound traffic. The instance’s security group has an inbound rule to allow SSH from any IP address and does not have any outbound rules.

In this scenario, what are the changes needed to allow SSH connection to the instance?

### Các lựa chọn (Choices)
- [ ] **A.** No action needed. It can already be accessed from any IP address using SSH.
- [ ] **B.** The outbound security group needs to be modified to allow outbound traffic.
- [ ] **C.** Both the outbound security group and outbound network ACL need to be modified to allow outbound traffic.
- [x] **D.** The network ACL needs to be modified to allow outbound traffic.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** The network ACL needs to be modified to allow outbound traffic.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In order for you to establish an SSH connection from your home computer to your EC2 instance, you need to do the following:

– On the Security Group, add an Inbound Rule to allow SSH traffic to your EC2 instance.

– On the NACL, add both an Inbound and Outbound Rule to allow SSH traffic to your EC2 instance.

The reason why you have to add both Inbound and Outbound SSH rule is due to the fact that Network ACLs are stateless which means that responses to allow inbound traffic are subject to the rules for outbound traffic (and vice versa). In other words, if you only enabled an Inbound rule in NACL, the traffic can only go in but the SSH response will not go out since there is no Outbound rule.

Security groups are stateful which means that if an incoming request is granted, then the outgoing traffic will be automatically granted as well, regardless of the outbound rules.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/authorizing-access-to-an-instance.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/authorizing-access-to-an-instance.html)

---

## Câu 60 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A financial analytics application that collects, processes, and analyzes stock data in real-time uses Amazon Kinesis Data Streams. The producers continually push data to Kinesis Data Streams while the consumers process the data in real time.

In Kinesis, where can the consumers store the results? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Amazon EMR
- [x] **B.** Amazon S3
- [ ] **C.** AWS Glue
- [x] **D.** Amazon Redshift
- [ ] **E.** Amazon Athena

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, D**
> - **B.** Amazon S3
> - **D.** Amazon Redshift

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In Amazon Kinesis, the producers continually push data to Kinesis Data Streams and the consumers process the data in real-time. Consumers (*such as a custom application running on Amazon EC2, or an Amazon Data Firehose stream*) can store their results using an AWS service such as Amazon DynamoDB, Amazon Redshift, or Amazon S3.

The following diagram illustrates the high-level architecture of Kinesis Data Streams:

![Kinesis Data Streams](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/architecture.png)

Hence, the correct answers are:

 **– Amazon S3**

 **– Amazon Redshift**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon EMR** is incorrect because it is primarily used for big data processing with frameworks like Apache Spark and Hadoop. While it can process data from Kinesis, it is not a direct storage solution for consumer results.

- **AWS Glue** is incorrect because this is not a storage service. It is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics.

- **Amazon Athena** is incorrect because this is just an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. It is not a storage service where you can store the results processed by the consumers.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/streams/latest/dev/key-concepts.html](http://docs.aws.amazon.com/streams/latest/dev/key-concepts.html)
- [https://docs.aws.amazon.com/streams/latest/dev/using-other-services-redshift.html](https://docs.aws.amazon.com/streams/latest/dev/using-other-services-redshift.html)
- [https://aws.amazon.com/blogs/big-data/streaming-data-from-amazon-s3-to-amazon-kinesis-data-streams-using-aws-dms/](https://aws.amazon.com/blogs/big-data/streaming-data-from-amazon-s3-to-amazon-kinesis-data-streams-using-aws-dms/)

**Amazon Redshift Overview:**

**Check out this Amazon Kinesis Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-kinesis/](https://tutorialsdojo.com/amazon-kinesis/)

---

## Câu 61 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
An investment bank has a distributed batch processing application that is hosted in an AWS Auto Scaling group of Amazon EC2 Spot instances with an Amazon SQS queue. The SQS queue is currently configured to use short polling to retrieve messages, and the components are configured to use client-side buffering so that the calls made from the client will be buffered first and then sent as a batch request to SQS.

What is a period of time during which the SQS queue prevents other consuming components from receiving and processing a message?

### Các lựa chọn (Choices)
- [x] **A.** Visibility Timeout
- [ ] **B.** Receiving Timeout
- [ ] **C.** Component Timeout
- [ ] **D.** Processing Timeout

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Visibility Timeout

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The visibility timeout is a period of time during which Amazon SQS prevents other consuming components from receiving and processing a message.

When a consumer receives and processes a message from a queue, the message remains in the queue. Amazon SQS doesn’t automatically delete the message. Because Amazon SQS is a distributed system, there’s no guarantee that the consumer actually receives the message (for example, due to a connectivity issue, or due to an issue in the consumer application). Thus, the consumer must delete the message from the queue after receiving and processing it.

![Visibility Timeout](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/td-visibility-timeout-28March2026.png)

Immediately after the message is received, it remains in the queue. To prevent other consumers from processing the message again, Amazon SQS sets a ***visibility timeout*** , a period of time during which Amazon SQS prevents other consumers from receiving and processing the message. The default visibility timeout for a message is 30 seconds. The maximum is 12 hours.

Hence, the correct answer is: **Visibility Timeout.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Component Timeout** is incorrect because this is simply not a concept or configurable parameter that exists in Amazon SQS. There is no such timeout mechanism that governs message visibility between consumers in the SQS service.

- **Processing Timeout** is incorrect. While the visibility timeout is closely related to how long it takes your application to process and delete a message, the only actual SQS parameter is called Visibility Timeout, not Processing Timeout.

- **Receiving Timeout** is incorrect because the relevant receive-related setting in SQS is the Receive message wait time, which controls short or long polling behavior; it has nothing to do with preventing other consumers from processing the same message.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/sqs/faqs/](https://aws.amazon.com/sqs/faqs/)
- [https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 62 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has an application hosted in an Amazon ECS Cluster behind an Application Load Balancer. The Solutions Architect is building a sophisticated web filtering solution that allows or blocks web requests based on the country that the requests originate from. However, the solution should still allow specific IP addresses from that country.

Which combination of steps should the Architect implement to satisfy this requirement? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Set up a geo match condition in the Application Load Balancer that blocks requests from a specific country.
- [x] **B.** Add another rule in the AWS WAF web ACL with a geo match condition that blocks requests that originate from a specific country.
- [x] **C.** Using AWS WAF, create a web ACL with a rule that explicitly allows requests from approved IP addresses declared in an IP Set.
- [ ] **D.** Place a Transit Gateway in front of the VPC where the application is hosted and set up Network ACLs that block requests that originate from a specific country.
- [ ] **E.** In the Application Load Balancer, create a listener rule that explicitly allows requests from approved IP addresses.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, C**
> - **B.** Add another rule in the AWS WAF web ACL with a geo match condition that blocks requests that originate from a specific country.
> - **C.** Using AWS WAF, create a web ACL with a rule that explicitly allows requests from approved IP addresses declared in an IP Set.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
If you want to allow or block web requests based on the country that the requests originate from, create one or more geo-match conditions. A geo match condition lists countries that your requests originate from. Later in the process, when you create a web ACL, you specify whether to allow or block requests from those countries.

You can use geo-match conditions with other **AWS WAF** Classic conditions or rules to build sophisticated filtering. For example, if you want to block certain countries but still allow specific IP addresses from that country, you could create a rule containing a geo match condition and an IP match condition. Configure the rule to block requests that originate from that country and do not match the approved IP addresses. As another example, if you want to prioritize resources for users in a particular country, you could include a geo-match condition in two different rate-based rules. Set a higher rate limit for users in the preferred country and set a lower rate limit for all other users.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-05-18_02-02-15-d61e11a7ef49c4e090a2d3a70b524779.png)

If you are using the CloudFront geo restriction feature to block a country from accessing your content, any request from that country is blocked and is not forwarded to AWS WAF Classic. So if you want to allow or block requests based on geography plus other AWS WAF Classic conditions, you should *not* use the CloudFront geo restriction feature. Instead, you should use an AWS WAF Classic geo match condition.

Hence, the correct answers are:

 **– Using AWS WAF, create a web ACL with a rule that explicitly allows requests from approved IP addresses declared in an IP Set.**

 **– Add another rule in the AWS WAF web ACL with a geo match condition that blocks requests that originate from a specific country.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **In the Application Load Balancer, create a listener rule that explicitly allows requests from approved IP addresses** is incorrect because a listener rule just checks for connection requests using the protocol and port that you configure. It only determines how the load balancer routes the requests to its registered targets.

- The option that says: **Set up a geo match condition in the Application Load Balancer that block requests that originate from a specific country** is incorrect because you can’t configure a geo match condition in an Application Load Balancer. You have to use AWS WAF instead.

- The option that says: **Place a Transit Gateway in front of the VPC where the application is hosted and set up Network ACLs that block requests that originate from a specific country** is incorrect because AWS Transit Gateway is simply a service that enables customers to connect their Amazon Virtual Private Clouds (VPCs) and their on-premises networks to a single gateway. Using this type of gateway is not warranted in this scenario. Moreover, Network ACLs are not suitable for blocking requests from a specific country. You have to use AWS WAF instead.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-geo-conditions.html](https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-geo-conditions.html)
- [https://docs.aws.amazon.com/waf/latest/developerguide/how-aws-waf-works.html](https://docs.aws.amazon.com/waf/latest/developerguide/how-aws-waf-works.html)

**Check out this AWS WAF Cheat Sheet:**
- [https://tutorialsdojo.com/aws-waf/](https://tutorialsdojo.com/aws-waf/)

---

## Câu 63 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A wellness company is currently working on a wearable device that monitors key health metrics such as heart rate, sleep, and steps per day. The device is designed to send data to an Amazon S3 bucket for storage and analysis. On a daily basis, the device produces 1 MB of data. In order to quickly process and summarize this data, the company requires 512 MB of memory and must complete the task within a maximum of 10 seconds.

Which solution can fulfill these requirements in the MOST cost-effective manner?

### Các lựa chọn (Choices)
- [ ] **A.** Create an AWS Glue PySpark job to process the data.
- [ ] **B.** Use Amazon Data Firehose to send the data from the device to Amazon S3. Process the data on an EC2 instance with at least 512 MB of memory.
- [ ] **C.** Store the data in Amazon Redshift and process it with AWS Lambda.
- [x] **D.** Use AWS Lambda with a Python library for processing.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Use AWS Lambda with a Python library for processing.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
With **AWS Lambda** , you pay only for what you use. You are charged based on the number of requests for your functions and the duration of the time it takes for your code to execute.

Lambda counts a request each time it starts executing in response to an event notification or invoke call, including test invokes from the console. You are charged for the total number of requests across all your functions.

Duration is calculated from the time your code begins executing until it returns or otherwise terminates, rounded up to the nearest 1ms. The price depends on the amount of memory you allocate to your function. The Lambda free tier includes 1M free requests per month and over 400,000 GB seconds of compute time per month.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Serverlesswebapp.45052e1feb8f1748d96a678311d73434599095b1.png)

The seamless integration of AWS Lambda with other AWS services, like Amazon S3 where health data is stored, enables effortless data transfer and processing. This guarantees smooth retrieval of data from the wearable device and its subsequent analysis.

With serverless computing, AWS Lambda eliminates the need for infrastructure management, and automatic scaling based on workload is possible. Python is a versatile and widely-used programming language with extensive libraries, making it ideal for efficient data processing, analysis, and summarization due to its simplicity.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/lambda-python-060723-0939PM.png)

Hence, the correct answer is: **Use AWS Lambda with a Python library for processing.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an AWS Glue PySpark job to process the data** is incorrect. While it’s a valid solution, it’s a bit of overkill to use AWS Glue for processing 1 MB of data per day. AWS Glue has a minimum billing duration of 1 minute (Glue version 2.0 and later), which is not cost-effective for processing small amounts of data quickly (in 10 seconds).

- The option that says: **Use Amazon Data Firehose to send the data from the device to Amazon S3. Process the data on an EC2 instance with at least 512 MB of memory** is incorrect. Data Firehose is meant for delivering streaming data to a storage. Using it to transport 1 MB of data per day is not cost-effective and would only complicate the process. Additionally, processing data on an EC2 instance requires more management and can be more costly in comparison to a serverless solution like AWS Lambda.

- The option that says: **Store the data in Amazon Redshift and process it with AWS Lambda. ** is incorrect. If you’re looking for a reliable data warehousing service to handle analytics workloads on large datasets, Amazon Redshift is a great option. Given the scale of the data being generated (1 MB per day), using Redshift would be a poor fit. It would be significantly more expensive than necessary for this small amount of data, and it would not offer any significant benefit over using S3 as the storage backend and processing with AWS Lambda.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/what-is/python/](https://aws.amazon.com/what-is/python/)
- [https://aws.amazon.com/lambda/pricing/](https://aws.amazon.com/lambda/pricing/)

**Check out this AWS Lambda Cheat Sheet:**
- [https://tutorialsdojo.com/aws-lambda/](https://tutorialsdojo.com/aws-lambda/)

---

## Câu 64 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
An e-commerce application is using a fanout messaging pattern for its order management system. For every order, it sends an Amazon SNS message to an SNS topic, and the message is replicated and pushed to multiple Amazon SQS queues for parallel asynchronous processing. A Spot EC2 instance retrieves the message from each SQS queue and processes the message. There was an incident that while an EC2 instance is currently processing a message, the instance was abruptly terminated, and the processing was not completed in time.

In this scenario, what happens to the SQS message?

### Các lựa chọn (Choices)
- [x] **A.** When the message visibility timeout expires, the message becomes available for processing by other EC2 instances
- [ ] **B.** The message will be sent to a Dead Letter Queue in AWS DataSync.
- [ ] **C.** The message is deleted and becomes duplicated in the SQS when the EC2 instance comes online.
- [ ] **D.** The message will automatically be assigned to the same EC2 instance when it comes back online within or after the visibility timeout.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** When the message visibility timeout expires, the message becomes available for processing by other EC2 instances

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A “fanout” pattern is when an Amazon SNS message is sent to a topic and then replicated and pushed to multiple Amazon SQS queues, HTTP endpoints, or email addresses. This allows for parallel asynchronous processing. For example, you could develop an application that sends an Amazon SNS message to a topic whenever an order is placed for a product. Then, the Amazon SQS queues that are subscribed to that topic would receive identical notifications for the new order. The Amazon EC2 server instance attached to one of the queues could handle the processing or fulfillment of the order, while the other server instance could be attached to a data warehouse for analysis of all orders received.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/sns-fanout.png)

When a consumer receives and processes a message from a queue, the message remains in the queue. Amazon SQS doesn’t automatically delete the message. Because Amazon SQS is a distributed system, there’s no guarantee that the consumer actually receives the message (for example, due to a connectivity issue or due to an issue in the consumer application). Thus, the consumer must delete the message from the queue after receiving and processing it.

Immediately after the message is received, it remains in the queue. To prevent other consumers from processing the message again, Amazon SQS sets a *visibility timeout*, a period of time during which Amazon SQS prevents other consumers from receiving and processing the message. The default visibility timeout for a message is 30 seconds. The maximum is 12 hours.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **The message will automatically be assigned to the same EC2 instance when it comes back online within or after the visibility timeout** is incorrect because the message will not be automatically assigned to the same EC2 instance once it is abruptly terminated. When the message visibility timeout expires, the message becomes available for processing by other EC2 instances.

- The option that says: **The message is deleted and becomes duplicated in the SQS when the EC2 instance comes online** is incorrect because the message will not be deleted and won’t be duplicated in the SQS queue when the EC2 instance comes online.

- The option that says: **The message will be sent to a Dead Letter Queue in AWS DataSync** is incorrect because although the message could be programmatically sent to a Dead Letter Queue (DLQ), it won’t be handled by AWS DataSync but by Amazon SQS instead. AWS DataSync is primarily used to simplify your migration with AWS. It makes it simple and fast to move large amounts of data online between on-premises storage and Amazon S3 or Amazon Elastic File System (Amazon EFS).

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
- [https://docs.aws.amazon.com/sns/latest/dg/sns-common-scenarios.html](https://docs.aws.amazon.com/sns/latest/dg/sns-common-scenarios.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 65 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has an infrastructure that allows EC2 instances from a private subnet to fetch objects from Amazon S3 via a NAT Instance. The company’s Solutions Architect was instructed to lower down the cost incurred by the current solution.

How should the Solutions Architect redesign the architecture in the most cost-efficient manner?

### Các lựa chọn (Choices)
- [ ] **A.** Replace the NAT instance with NAT Gateway to access S3 objects.
- [ ] **B.** Remove the NAT instance and create an S3 interface endpoint to access S3 objects.
- [ ] **C.** Use a smaller instance type for the NAT instance.
- [x] **D.** Remove the NAT instance and create an S3 gateway endpoint to access S3 objects.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Remove the NAT instance and create an S3 gateway endpoint to access S3 objects.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A **VPC endpoint** enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an Internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other services does not leave the Amazon network.

Endpoints are virtual devices. They are horizontally scaled, redundant, and highly available VPC components that allow communication between instances in your VPC and services without imposing availability risks or bandwidth constraints on your network traffic.

There are two types of VPC endpoints: *interface endpoints* and *gateway endpoints*. You should create the type of VPC endpoint required by the supported service. As a rule of thumb, most AWS services use VPC *Interface* Endpoint except for S3 and DynamoDB, which use VPC *Gateway* Endpoint.

![](../Review Mode Set 5 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-s3-vpc-endpoint.PNG)

There is no additional charge for using gateway endpoints. However, standard charges for data transfer and resource usage still apply.

Let’s assume you created a NAT gateway and you have an EC2 instance routing to the Internet through the NAT gateway. Your EC2 instance behind the NAT gateway sends a 1 GB file to one of your S3 buckets. The EC2 instance, NAT gateway, and S3 Bucket are in the same region US East (Ohio), and the NAT gateway and EC2 instance are in the same availability zone.

Your cost will be calculated as follows:

 **– NAT Gateway Hourly Charge:** NAT Gateway is charged on an hourly basis. For example, the rate is $0.045 per hour in this region.

 **– NAT Gateway Data Processing Charge:** 1 GB data went through NAT gateway. The NAT Gateway Data Processing charge is applied and will result in a charge of $0.045.

 **– Data Transfer Charge:** This is the standard EC2 Data Transfer charge. 1 GB data was transferred from the EC2 instance to S3 via the NAT gateway. There was no charge for the data transfer from the EC2 instance to S3 as it is Data Transfer Out to Amazon EC2 to S3 in the same region. There was also no charge for the data transfer between the NAT Gateway and the EC2 instance since the traffic stays in the same availability zone using private IP addresses. There will be a data transfer charge between your NAT Gateway and EC2 instance if they are in the different availability zone.

In summary, your charge will be $0.045 for 1 GB of data processed by the NAT gateway and a charge of $0.045 per hour will always apply once the NAT gateway is provisioned and available. The data transfer has no charge in this example. However, if you send the file to a non-AWS Internet location instead, there will be a data transfer charge as it is data transfer out from Amazon EC2 to the Internet.

To avoid the NAT Gateway Data Processing charge in this example, you could set up a Gateway Type VPC endpoint and route the traffic to/from S3 through the VPC endpoint instead of going through the NAT Gateway.

There is no data processing or hourly charges for using Gateway Type VPC endpoints.

Hence, the correct answer is the option that says: **Remove the NAT instance and create an S3 gateway endpoint to access S3 objects.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Replace the NAT instance with NAT Gateway to access S3 objects** is incorrect. A NAT Gateway is just a NAT instance that is managed for you by AWS. It provides less operational management and you pay for the hour that your NAT Gateway is running. This is not the most effective solution since you will still pay for the idle time.

- The option that says: **Use a smaller instance type for the NAT instance** is incorrect. Although this might reduce the cost, it still is not the most cost-efficient solution. An S3 Gateway endpoint is still the best solution because it comes with no additional charge.

- The option that says: **Remove the NAT instance and create an S3 interface endpoint to access S3 objects** is incorrect. An interface endpoint is an elastic network interface with a private IP address from the IP address range of your subnet. Unlike a Gateway endpoint, you still get billed for the time your interface endpoint is running and the GB data it has processed. From a cost standpoint, using the S3 Gateway endpoint is the most favorable solution.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway.html](https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway.html)
- [https://aws.amazon.com/blogs/architecture/reduce-cost-and-increase-security-with-amazon-vpc-endpoints/](https://aws.amazon.com/blogs/architecture/reduce-cost-and-increase-security-with-amazon-vpc-endpoints/)
- [https://aws.amazon.com/vpc/pricing/](https://aws.amazon.com/vpc/pricing/)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-elastic-container-service-amazon-ecs/)

---
