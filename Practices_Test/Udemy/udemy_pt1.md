# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Practice Exam 1

> **Khóa học tham chiếu**: Ultimate AWS Certified Solutions Architect Associate (SAA-C03) - Stephane Maarek  
> **Bộ đề**: Practice Exam 1 (Full Exam Simulation - 65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **65 câu** | $\ge 47$ câu (72%) | Đạt tiêu chuẩn ✅ |
| **Số câu trả lời sai (Incorrect Answers)** | **0 câu** | $\le 18$ câu | Không có câu sai 🌟 |
| **Tỷ lệ chính xác (Overall Score)** | **100% (~1000 / 1000)** | $\ge 72.0\%$ (720 / 1000) | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |
| **Thời gian thi tiêu chuẩn** | **130 phút** | 130 phút *(160 phút nếu có ESL +30)* | Đạt tiến độ thời gian |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 17 câu | 17 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 13 câu | 13 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 24 câu | 24 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 11 câu | 11 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **65 câu** | **0 câu** | **100%** | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |

---

## 🎯 2. Danh Sách Các Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

> 🌟 **Tuyệt vời!** Bạn đã trả lời chính xác 100% tất cả các câu hỏi trong đề thi này (65 / 65 câu). Không có câu hỏi nào cần đưa vào danh sách ôn tập trọng tâm.

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ✅ Đúng | [Serverless Ingestion for Car Sensors with SQS and AWS Lambda](#question-01) | Domain 2 |
| [02](#question-02) | ✅ Đúng | [Secure Private Partner Database Access via AWS PrivateLink & NLB](#question-02) | Domain 1 |
| [03](#question-03) | ✅ Đúng | [Centralized Multi-Account Identity with AWS AD Connector and IAM Identity Center](#question-03) | Domain 1 |
| [04](#question-04) | ✅ Đúng | [Fine-Grained Least-Privilege Pod Permissions in EKS using IRSA](#question-04) | Domain 1 |
| [05](#question-05) | ✅ Đúng | [Data Transfer Cost Analysis for Inbound S3 Uploads (Free Ingress)](#question-05) | Domain 3 |
| [06](#question-06) | ✅ Đúng | [Caching Web Tier with CloudFront and DynamoDB Accelerator (DAX)](#question-06) | Domain 4 |
| [07](#question-07) | ✅ Đúng | [High-Throughput Low-Latency HPC Workloads using Cluster Placement Groups](#question-07) | Domain 3 |
| [08](#question-08) | ✅ Đúng | [Geolocation Routing with Route 53 to Restrict Media Distribution by Country](#question-08) | Domain 1 |
| [09](#question-09) | ✅ Đúng | [Restricting Maximum Delegated IAM Permissions using Permissions Boundaries](#question-09) | Domain 1 |
| [10](#question-10) | ✅ Đúng | [High-Speed Cross-Region Large Object Replication via S3 Multipart Uploads](#question-10) | Domain 4 |
| [11](#question-11) | ✅ Đúng | [Serverless Analytics Data Lake with AWS Glue & Redshift Serverless](#question-11) | Domain 3 |
| [12](#question-12) | ✅ Đúng | [Real-Time Cost Anomaly Monitoring and Stakeholder Alerts](#question-12) | Domain 4 |
| [13](#question-13) | ✅ Đúng | [Fastest Upload Strategy for Large Files via S3 Multipart with Transfer Acceleration](#question-13) | Domain 3 |
| [14](#question-14) | ✅ Đúng | [Cross-Account Serverless Genomics Processing with Amazon EFS Access Points](#question-14) | Domain 4 |
| [15](#question-15) | ✅ Đúng | [Overcoming S3 503 Slow Down API Rate Limits using Custom Prefixes](#question-15) | Domain 3 |
| [16](#question-16) | ✅ Đúng | [Cost Differences Between ECS on EC2 vs ECS on AWS Fargate](#question-16) | Domain 4 |
| [17](#question-17) | ✅ Đúng | [Stateless vs Stateful API Protocol Support with Amazon API Gateway (REST vs WebSocket)](#question-17) | Domain 3 |
| [18](#question-18) | ✅ Đúng | [Preserving Form Submission Order and Avoiding Duplicates using SQS FIFO](#question-18) | Domain 2 |
| [19](#question-19) | ✅ Đúng | [Securing Privileged IAM Users with Hardware/Virtual Multi-Factor Authentication (MFA)](#question-19) | Domain 1 |
| [20](#question-20) | ✅ Đúng | [Hybrid DNS Resolution for On-Premises Domains via Route 53 Resolver Outbound Endpoints](#question-20) | Domain 1 |
| [21](#question-21) | ✅ Đúng | [Hybrid Cloud NFS Migration to S3 using AWS Storage Gateway File Gateway](#question-21) | Domain 4 |
| [22](#question-22) | ✅ Đúng | [Suspending Auto Scaling ReplaceUnhealthy Process During EC2 Troubleshooting](#question-22) | Domain 2 |
| [23](#question-23) | ✅ Đúng | [Proactive Security Monitoring with CloudWatch Metric Filters on CloudTrail Error Codes](#question-23) | Domain 2 |
| [24](#question-24) | ✅ Đúng | [Visual Data Cleansing and Transformation Profiling with AWS Glue DataBrew](#question-24) | Domain 2 |
| [25](#question-25) | ✅ Đúng | [Inter-Region Shared Storage Access for Amazon EFS via Inter-Region VPC Peering](#question-25) | Domain 3 |
| [26](#question-26) | ✅ Đúng | [Ultra High-Performance Low-Latency Ephemeral Storage using EC2 Instance Store](#question-26) | Domain 3 |
| [27](#question-27) | ✅ Đúng | [Principle of Least Privilege S3 Object-Level Permissions (arn:aws:s3:::bucket/*)](#question-27) | Domain 1 |
| [28](#question-28) | ✅ Đúng | [Cost-Effective Millisecond-Retrieval Storage for Predictable Access using S3 Standard-IA](#question-28) | Domain 4 |
| [29](#question-29) | ✅ Đúng | [Securing Amazon EFS Mount Access using IAM Client Authorization Policies](#question-29) | Domain 1 |
| [30](#question-30) | ✅ Đúng | [Multi-Tier Resilient Architecture with ALB, Multi-AZ ASG, and Multi-AZ RDS](#question-30) | Domain 2 |
| [31](#question-31) | ✅ Đúng | [Pre-Warming Predictable End-of-Month Traffic Spikes with Auto Scaling Scheduled Actions](#question-31) | Domain 2 |
| [32](#question-32) | ✅ Đúng | [S3 Threat Detection with GuardDuty and EC2 Vulnerability Scanning with Inspector](#question-32) | Domain 1 |
| [33](#question-33) | ✅ Đúng | [Replication Differences Between RDS Multi-AZ (Synchronous) and Read Replicas (Asynchronous)](#question-33) | Domain 2 |
| [34](#question-34) | ✅ Đúng | [Resolving SNS-to-Lambda Message Delivery Bottlenecks by Increasing Account Concurrency](#question-34) | Domain 2 |
| [35](#question-35) | ✅ Đúng | [Automated Medical Entity Extraction Pipeline with S3 Events, Lambda, and Comprehend](#question-35) | Domain 3 |
| [36](#question-36) | ✅ Đúng | [Decoupling Monolithic Ticketing Systems using Amazon SQS Standard Queues](#question-36) | Domain 3 |
| [37](#question-37) | ✅ Đúng | [Accelerating Athena Query Performance with S3 Standard and Columnar Formats](#question-37) | Domain 4 |
| [38](#question-38) | ✅ Đúng | [Object-Level Compliance Governance using S3 Object Lock and Retention Periods](#question-38) | Domain 1 |
| [39](#question-39) | ✅ Đúng | [EBS HDD Volume Types Comparison: Throughput Optimized (st1) vs Cold HDD (sc1)](#question-39) | Domain 3 |
| [40](#question-40) | ✅ Đúng | [High-Throughput Ultra-Fast File System for EDA HPC Workloads with FSx for Lustre](#question-40) | Domain 3 |
| [41](#question-41) | ✅ Đúng | [S3 Lifecycle Transition Restrictions (Intelligent-Tiering to Standard Not Allowed)](#question-41) | Domain 4 |
| [42](#question-42) | ✅ Đúng | [Secure Encrypted High-Bandwidth Hybrid Connectivity via Direct Connect with VPN (IPsec)](#question-42) | Domain 3 |
| [43](#question-43) | ✅ Đúng | [Increasing SQS FIFO Queue Throughput with Batching Operations (Up to 3,000 msg/s)](#question-43) | Domain 2 |
| [44](#question-44) | ✅ Đúng | [Global Edge Caching for On-Premises Web Origins using Amazon CloudFront](#question-44) | Domain 3 |
| [45](#question-45) | ✅ Đúng | [Storage Cost Hierarchy: S3 Standard vs Amazon EFS vs Amazon EBS](#question-45) | Domain 4 |
| [46](#question-46) | ✅ Đúng | [Low-Latency Global Gaming Reads using Amazon Aurora Global Database](#question-46) | Domain 1 |
| [47](#question-47) | ✅ Đúng | [Decoupling Payment Processing with API Gateway, Lambda, and ECS Fargate](#question-47) | Domain 3 |
| [48](#question-48) | ✅ Đúng | [Decoupled Real-Time Gaming Leaderboards with Kinesis Data Streams & Lambda](#question-48) | Domain 3 |
| [49](#question-49) | ✅ Đúng | [Compliance and Audit Trails for Healthcare Data using SSE-KMS Encryption](#question-49) | Domain 1 |
| [50](#question-50) | ✅ Đúng | [Ultra-Fast Microsecond Leaderboards using Amazon ElastiCache for Redis](#question-50) | Domain 3 |
| [51](#question-51) | ✅ Đúng | [Resource Scope and Regional Isolation for EC2 Instances, AMIs, and EBS Snapshots](#question-51) | Domain 3 |
| [52](#question-52) | ✅ Đúng | [S3 Object Immutability and Accidental Deletion Protection via MFA Delete & Versioning](#question-52) | Domain 2 |
| [53](#question-53) | ✅ Đúng | [OS-Level Database Customization and High Availability with Amazon RDS Custom for Oracle](#question-53) | Domain 2 |
| [54](#question-54) | ✅ Đúng | [Dynamic EC2 Auto Scaling using Target Tracking Policy based on Average CPU](#question-54) | Domain 3 |
| [55](#question-55) | ✅ Đúng | [Real-Time Fleet Telemetry Ingestion and Streaming Analytics with API Gateway & Kinesis](#question-55) | Domain 3 |
| [56](#question-56) | ✅ Đúng | [Secure Cross-Environment Delegation using IAM Roles and AssumeRole](#question-56) | Domain 1 |
| [57](#question-57) | ✅ Đúng | [Auto Scaling Health Checks: Replacing Unhealthy EC2 Instances in Multi-AZ](#question-57) | Domain 3 |
| [58](#question-58) | ✅ Đúng | [Optimizing Global Gaming Traffic and Failover with AWS Global Accelerator](#question-58) | Domain 3 |
| [59](#question-59) | ✅ Đúng | [Routing Multiple Microservices on a Single ALB using Path-Based Routing Rules](#question-59) | Domain 2 |
| [60](#question-60) | ✅ Đúng | [Layer 7 Web Exploitation Protection for Application Load Balancers via AWS WAF](#question-60) | Domain 1 |
| [61](#question-61) | ✅ Đúng | [Database Migration to Aurora PostgreSQL using AWS DMS and AWS SCT](#question-61) | Domain 3 |
| [62](#question-62) | ✅ Đúng | [Fault-Tolerant Batch Workload Cost Minimization with EC2 Spot Instances](#question-62) | Domain 4 |
| [63](#question-63) | ✅ Đúng | [AWS Account Root User Best Practices: Strong Password and MFA Activation](#question-63) | Domain 1 |
| [64](#question-64) | ✅ Đúng | [Enterprise Windows DFS Migration to Fully Managed Amazon FSx for Windows File Server](#question-64) | Domain 3 |
| [65](#question-65) | ✅ Đúng | [On-Premises Modernized Kubernetes Stack with AWS APIs using AWS Outposts & EKS Anywhere](#question-65) | Domain 1 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: Serverless Ingestion for Car Sensors with SQS and AWS Lambda
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A leading carmaker would like to build a new car-as-a-sensor service by leveraging fully serverless components that are provisioned and managed automatically by AWS. The development team at the carmaker does not want an option that requires the capacity to be manually provisioned, as it does not want to respond manually to changing volumes of sensor data.
Given these constraints, which of the following solutions is the BEST fit to develop this car-as-a-sensor service?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Ingest the sensor data in Amazon Kinesis Data Firehose, which directly writes the data into an auto-scaled Amazon DynamoDB table for downstream processing
- **(B)** Ingest the sensor data in an Amazon Simple Queue Service (Amazon SQS) standard queue, which is polled by an AWS Lambda function in batches and the data is written into an auto-scaled Amazon DynamoDB table for downstream processing `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Ingest the sensor data in an Amazon Simple Queue Service (Amazon SQS) standard queue, which is polled by an application running on an Amazon EC2 instance and the data is written into an auto-scaled Amazon DynamoDB table for downstream processing
- **(D)** Ingest the sensor data in Amazon Kinesis Data Streams, which is polled by an application running on an Amazon EC2 instance and the data is written into an auto-scaled Amazon DynamoDB table for downstream processing

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume. Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. SQS queues are dynamically created and scale automatically so you can build and grow applications quickly and efficiently without manually provisioning capacity.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Ingest the sensor data in Amazon Kinesis Data Firehose, which directly writes the data into an auto-scaled Amazon DynamoDB table: Amazon Kinesis Data Firehose delivers real-time streaming data to destinations such as Amazon S3, Amazon Redshift, Amazon OpenSearch Service, Splunk, and custom HTTP endpoints. Firehose cannot directly write into a DynamoDB table.
Options using Amazon EC2 instances: Using an application on an Amazon EC2 instance is ruled out as the carmaker wants to use fully serverless components.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-02"></div>

### Question 02: Secure Private Partner Database Access via AWS PrivateLink & NLB
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A biotech research company needs to perform data analytics on real-time lab results provided by a partner organization. The partner stores these lab results in an Amazon RDS for MySQL instance within the partner’s own AWS account. The research company has a private VPC that does not have internet access, Direct Connect, or a VPN connection. However, the company must establish secure and private connectivity to the RDS database in the partner’s VPC. The solution must allow the research company to connect from its VPC while minimizing complexity and complying with data security requirements.
Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure a client VPN endpoint in the company’s account. Have researchers connect to the VPN from their local machines. Establish a Direct Connect gateway to the partner’s VPC and route RDS traffic via this connection
- **(B)** Instruct the partner to create a Network Load Balancer (NLB) in front of the Amazon RDS for MySQL instance. Use AWS PrivateLink to expose the NLB as an interface VPC endpoint in the research company’s VPC `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Instruct the partner to enable public access on the Amazon RDS instance and add a security group rule to allow inbound access from the company’s IP range. The company accesses the database over the public internet through a NAT Gateway configured in a private subnet
- **(D)** Set up VPC peering between the company’s VPC and the partner’s VPC. Use AWS Transit Gateway in the partner's account to route traffic from the company’s VPC to the database. Modify the RDS subnet route tables to allow access from the company’s CIDR block

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Since the RDS instance cannot be directly exposed via PrivateLink, the partner can create a Network Load Balancer (NLB) in front of a proxy or custom endpoint that connects to RDS. The partner then creates a PrivateLink service (interface endpoint service) that the research company can connect to privately via an interface VPC endpoint in its own VPC. This keeps traffic within the AWS network without requiring an internet gateway, VPN, or Direct Connect.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Public access on RDS + NAT Gateway: Violates the requirement for no internet access in the company's VPC. Also, a NAT Gateway requires an Internet Gateway.
VPC peering + Transit Gateway together: You cannot use Transit Gateway and VPC peering together for a single pair of VPCs—this is an architectural contradiction.
Client VPN + Direct Connect gateway: Direct Connect is not available per the question's conditions, and Client VPN is for user-based access rather than VPC-to-VPC communication.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-03"></div>

### Question 03: Centralized Multi-Account Identity with AWS AD Connector and IAM Identity Center
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A software company has a globally distributed team of developers, that requires secure and compliant access to AWS environments. The company manages multiple AWS accounts under AWS Organizations and uses an on-premises Microsoft Active Directory for user authentication. To simplify access control and identity governance across projects and accounts, the company wants a centrally managed solution that integrates with their existing infrastructure. The solution should require the least amount of ongoing operational management.
Which approach best meets the company’s requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an open-source identity provider (IdP) on Amazon EC2. Synchronize it with the on-premises Active Directory and use SAML to federate access to AWS accounts. Assign IAM roles to federated users based on SAML assertions
- **(B)** Deploy AWS Directory Service for Microsoft Active Directory in AWS. Establish a trust relationship with the on-premises Active Directory. Use IAM roles linked to AD groups to control access to AWS resources
- **(C)** Use AWS Directory Service AD Connector to connect AWS to the on-premises Active Directory. Integrate AD Connector with AWS IAM Identity Center. Use permission sets to assign access to AWS accounts and resources based on Active Directory group membership `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use AWS Control Tower to enable account access for developers. Create AWS IAM roles in each member account and manually assign permissions. Instruct developers to assume roles across accounts using the AWS CLI

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AD Connector acts as a proxy to the on-prem AD, eliminating the need to deploy or manage a separate directory in the cloud. By integrating IAM Identity Center (formerly AWS SSO) with AD Connector, the company can use existing AD group memberships to assign permission sets across multiple accounts managed by AWS Organizations with minimal operational overhead.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- AWS Directory Service for Microsoft AD with trust relationship: Managing an AWS-managed AD in the cloud and monitoring trust health adds unnecessary cost and operational overhead compared to AD Connector + IAM Identity Center.
Open-source IdP on EC2: High operational overhead (scaling, patching, HA, synchronization).
Control Tower + manual IAM roles: Manually creating and assigning IAM roles in each member account is not scalable and is operationally complex.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-04"></div>

### Question 04: Fine-Grained Least-Privilege Pod Permissions in EKS using IRSA
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An enterprise runs a microservices-based application on Amazon EKS, deployed on EC2 worker nodes. The application includes a frontend UI service that interacts with Amazon DynamoDB and a data-processing service that stores and retrieves files from Amazon S3. The organization needs to strictly enforce least privilege access: the UI Pods must access only DynamoDB, and the data-processing Pods must access only S3.
Which solution will best enforce these access controls within the EKS cluster?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create separate Kubernetes service accounts for the UI and data services. Use IAM Roles for Service Accounts (IRSA) to map each service account to an IAM role with only the required permissions. Assign DynamoDB access to the UI Pods and S3 access to the data Pods `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Attach an IAM policy directly to each Pod using Kubernetes annotations. Assign the S3 policy to data-service Pods and the DynamoDB policy to UI Pods
- **(C)** Create one Kubernetes service account shared across all Pods. Attach a single IAM role to this account with both AmazonS3FullAccess and AmazonDynamoDBFullAccess policies
- **(D)** Create IAM policies for DynamoDB and S3 access, and attach both to the EC2 instance profile used by the EKS nodes. Use Kubernetes role-based access control (RBAC) to control service-level permissions within the cluster

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
IAM Roles for Service Accounts (IRSA) is the AWS-recommended method for providing fine-grained IAM permissions to individual Pods in an Amazon EKS cluster. Creating separate Kubernetes service accounts and associating each with a scoped IAM role ensures Pod-level isolation and least privilege.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Shared service account with FullAccess policies: Violates least privilege by giving both services access to both S3 and DynamoDB.
Attach IAM policy directly via annotations: IAM policies cannot be directly attached to Pods using annotations outside of IRSA.
Attach policies to EC2 instance profile + Kubernetes RBAC: All Pods on the node inherit all permissions from the EC2 instance profile, and Kubernetes RBAC only controls cluster API access, not access to AWS services like S3 or DynamoDB.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-05"></div>

### Question 05: Data Transfer Cost Analysis for Inbound S3 Uploads (Free Ingress)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A junior scientist working with the Deep Space Research Laboratory at NASA is trying to upload a high-resolution image of a nebula into Amazon S3. The image size is approximately 3 gigabytes. The junior scientist is using Amazon S3 Transfer Acceleration (Amazon S3TA) for faster image upload. It turns out that Amazon S3TA did not result in an accelerated transfer.
Given this scenario, which of the following is correct regarding the charges for this image transfer?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The junior scientist needs to pay both S3 transfer charges and S3TA transfer charges for the image upload
- **(B)** The junior scientist only needs to pay Amazon S3 transfer charges for the image upload
- **(C)** The junior scientist only needs to pay S3TA transfer charges for the image upload
- **(D)** The junior scientist does not need to pay any transfer charges for the image upload `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
There are no S3 data transfer charges when data is transferred in from the internet. Also, with S3TA, you pay only for transfers that are accelerated. Since S3TA did not result in an accelerated transfer, no transfer charges apply.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-06"></div>

### Question 06: Caching Web Tier with CloudFront and DynamoDB Accelerator (DAX)
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A retail company has developed a REST API which is deployed in an Auto Scaling group behind an Application Load Balancer. The REST API stores the user data in Amazon DynamoDB and any static content, such as images, are served via Amazon Simple Storage Service (Amazon S3). On analyzing the usage trends, it is found that 90% of the read requests are for commonly accessed data across all users.
As a Solutions Architect, which of the following would you suggest as the MOST efficient solution to improve the application performance?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable ElastiCache Redis for DynamoDB and ElastiCache Memcached for Amazon S3
- **(B)** Enable Amazon DynamoDB Accelerator (DAX) for Amazon DynamoDB and Amazon CloudFront for Amazon S3 `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Enable ElastiCache Redis for DynamoDB and Amazon CloudFront for Amazon S3
- **(D)** Enable Amazon DynamoDB Accelerator (DAX) for Amazon DynamoDB and ElastiCache Memcached for Amazon S3

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon DynamoDB Accelerator (DAX) is a fully managed, native, API-compatible in-memory cache for DynamoDB that delivers up to a 10x performance improvement without requiring functional application code changes. Amazon CloudFront is a CDN that caches static content from S3 at edge locations close to users.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- ElastiCache Redis for DynamoDB: While possible, integrating Redis with DynamoDB is much more involved than using native DAX.
ElastiCache Memcached for S3: Memcached cannot be used as a CDN cache to serve static content from Amazon S3.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-07"></div>

### Question 07: High-Throughput Low-Latency HPC Workloads using Cluster Placement Groups
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An ivy-league university is assisting NASA to find potential landing sites for exploration vehicles of unmanned missions to our neighboring planets. The university uses High Performance Computing (HPC) driven application architecture to identify these landing sites.
Which of the following Amazon EC2 instance topologies should this application be deployed on?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The Amazon EC2 instances should be deployed in a partition placement group so that distributed workloads can be handled effectively
- **(B)** The Amazon EC2 instances should be deployed in a spread placement group so that there are no correlated failures
- **(C)** The Amazon EC2 instances should be deployed in a cluster placement group so that the underlying workload can benefit from low network latency and high network throughput `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** The Amazon EC2 instances should be deployed in an Auto Scaling group so that application meets high availability requirements

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
HPC workloads require low-latency network performance for tightly-coupled node-to-node communication. Cluster placement groups pack instances close together inside a single Availability Zone to provide low network latency and high network throughput.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Partition placement group: Spreads instances across logical partitions (and multiple AZs) for large distributed workloads like Hadoop, Cassandra, and Kafka.
Spread placement group: Places a small number of critical instances (max 7 per AZ) on distinct racks to reduce correlated failures.
Auto Scaling group: Manages automatic scaling and availability, not HPC network topology.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-08"></div>

### Question 08: Geolocation Routing with Route 53 to Restrict Media Distribution by Country
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (C) | **Đáp án đúng**: (A), (C)

#### 📋 Đề bài (Scenario)
One of the biggest football leagues in Europe has granted the distribution rights for live streaming its matches in the USA to a silicon valley based streaming services company. As per the terms of distribution, the company must make sure that only users from the USA are able to live stream the matches on their platform. Users from other countries in the world must be denied access to these live-streamed matches.
Which of the following options would allow the company to enforce these streaming restrictions? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Route 53 based geolocation routing policy to restrict distribution of content to only the locations in which you have distribution rights `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon Route 53 based latency-based routing policy to restrict distribution of content to only the locations in which you have distribution rights
- **(C)** Use georestriction to prevent users in specific geographic locations from accessing content that you're distributing through a Amazon CloudFront web distribution `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon Route 53 based weighted routing policy to restrict distribution of content to only the locations in which you have distribution rights
- **(E)** Use Amazon Route 53 based failover routing policy to restrict distribution of content to only the locations in which you have distribution rights

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Route 53 Geolocation routing lets you choose the resources that serve your traffic based on the geographic location of your users and restrict content distribution to locations where you have distribution rights.
CloudFront Georestriction (Geo-blocking) prevents users in specific geographic locations from accessing content distributed through a CloudFront web distribution using a whitelist or blacklist of countries.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Latency-based, weighted, and failover routing policies cannot restrict content distribution by geographic location.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-09"></div>

### Question 09: Restricting Maximum Delegated IAM Permissions using Permissions Boundaries
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An IT company wants to review its security best-practices after an incident was reported where a new developer on the team was assigned full access to Amazon DynamoDB. The developer accidentally deleted a couple of tables from the production environment while building out a new feature.
Which is the MOST effective way to address this issue so that such incidents do not recur?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Remove full database access for all IAM users in the organization
- **(B)** Use permissions boundary to control the maximum permissions employees can grant to the IAM principals `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** The CTO should review the permissions for each new developer's IAM user so that such incidents don't recur
- **(D)** Only root user should have full database access in the organization

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A permissions boundary controls the maximum permissions employees can grant to the IAM principals (users and roles) that they create and manage. The effective permissions of the principal are the intersection of the permissions boundary and the permissions policy.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Remove full database access for all IAM users: Impractical because database administrators need this access.
CTO review: Manual review by the CTO is not scalable or automated.
Only root user: As a best practice, the root user should not be used for everyday administrative tasks.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-10"></div>

### Question 10: High-Speed Cross-Region Large Object Replication via S3 Multipart Uploads
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (B), (C)

#### 📋 Đề bài (Scenario)
A news network uses Amazon Simple Storage Service (Amazon S3) to aggregate the raw video footage from its reporting teams across the US. The news network has recently expanded into new geographies in Europe and Asia. The technical teams at the overseas branch offices have reported huge delays in uploading large video files to the destination Amazon S3 bucket.
Which of the following are the MOST cost-effective options to improve the file upload speed into Amazon S3 (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create multiple AWS Direct Connect connections between the AWS Cloud and branch offices in Europe and Asia. Use the direct connect connections for faster file uploads into Amazon S3
- **(B)** Use multipart uploads for faster file uploads into the destination Amazon S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon S3 Transfer Acceleration (Amazon S3TA) to enable faster file uploads into the destination S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create multiple AWS Site-to-Site VPN connections between the AWS Cloud and branch offices in Europe and Asia. Use these VPN connections for faster file uploads into Amazon S3
- **(E)** Use AWS Global Accelerator for faster file uploads into the destination Amazon S3 bucket

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 Transfer Acceleration (S3TA) enables fast file transfers over long distances by routing data through CloudFront's globally distributed edge locations over an optimized network path.
Multipart upload uploads a single object as a set of parts independently and in parallel, improving throughput (recommended for objects reaching 100 MB).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- AWS Direct Connect: Takes months to provision and is expensive overkill for this use case.
Site-to-Site VPN: Operates over the public internet and does not accelerate S3 upload speeds.
AWS Global Accelerator: Provides static IP entry points for ALB, NLB, or EC2 instances, not S3 buckets.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-11"></div>

### Question 11: Serverless Analytics Data Lake with AWS Glue & Redshift Serverless
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A retail analytics company operates a large-scale data lake on Amazon S3, where they store daily logs of customer transactions, product views, and inventory updates. Each morning, they need to transform and load the data into a data warehouse to support fast analytical queries. The company also wants to enable data analysts to build and train machine learning (ML) models using familiar SQL syntax without writing custom Python code. The architecture must support massively parallel processing (MPP) for fast data aggregation and scoring, and must use serverless AWS services wherever possible to reduce infrastructure management and operational overhead.
Which solution best meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Run a daily AWS Glue job to process and transform the raw files in S3 and register the outputs as Amazon Athena tables in AWS Glue Data Catalog. Allow analysts to build ML models using Amazon Athena ML, with SQL-based predictions on top of S3 data without moving it to a warehouse
- **(B)** Use a daily AWS Glue job to transform and clean the data stored in Amazon S3. Load the transformed dataset into Amazon Redshift Serverless, which offers MPP capabilities in a serverless model. Enable analysts to use Amazon Redshift ML to build and train ML models `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use an AWS Glue job to transform and load data into Amazon RDS for PostgreSQL. Allow analysts to run machine learning models using Amazon Aurora ML integrated with PostgreSQL, leveraging Amazon SageMaker endpoints behind the scenes
- **(D)** Provision and run a daily Amazon EMR cluster with Apache Spark to process and transform the S3 data. Load the results into Amazon Redshift (provisioned). Enable ML model development by integrating Redshift with Amazon SageMaker notebooks for advanced modeling tasks

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Glue provides serverless ETL, Amazon Redshift Serverless offers a serverless Massively Parallel Processing (MPP) data warehouse, and Amazon Redshift ML lets analysts create, train, and deploy ML models using SQL (integrating with SageMaker under the hood).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- EMR + Provisioned Redshift + SageMaker notebooks: Requires managing clusters and writing Python code in notebooks.
Athena ML: Queries S3 in-place rather than loading into an MPP data warehouse, and Athena ML is for inference rather than training models via SQL.
RDS for PostgreSQL: Optimized for transactional workloads, not MPP warehouse-scale analytics.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-12"></div>

### Question 12: Real-Time Cost Anomaly Monitoring and Stakeholder Alerts
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A software company operates a customer analytics platform on a fleet of Amazon EC2 instances. During a quarterly cloud cost review, the finance team discovers an unexpected increase in AWS charges that had gone unnoticed for several days. The company wants to continuously identify abnormal spending patterns and automatically notify designated stakeholders when AWS detects unexpected cost increases.
Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a zero spend budget from an AWS Budgets template and configure the budget to notify stakeholders when spending exceeds the configured threshold
- **(B)** Enable Amazon CloudWatch billing metrics, create alarms for predetermined estimated charge thresholds, and configure Amazon SNS notifications for the finance team
- **(C)** Use AWS Pricing Calculator to model the expected cost of the existing EC2 workload and periodically compare the estimate with actual AWS charges
- **(D)** Create an AWS Cost Anomaly Detection monitor and configure an alert subscription to notify designated stakeholders when the monitor detects anomalous spending `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Cost Anomaly Detection uses machine learning models to evaluate historical spending behavior, account for normal growth/seasonality, and identify anomalous costs without requiring static monetary thresholds. It supports alert subscriptions via email or Amazon SNS.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- AWS Pricing Calculator: Used for pre-deployment cost estimation, not continuous monitoring.
CloudWatch billing metrics: Uses static thresholds rather than ML-based anomaly detection.
Zero spend budget: Alerts when spending exceeds AWS Free Tier limits, which is inappropriate for an active production workload.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-13"></div>

### Question 13: Fastest Upload Strategy for Large Files via S3 Multipart with Transfer Acceleration
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A data analytics company measures what the consumers watch and what advertising they’re exposed to. This real-time data is ingested into its on-premises data center and subsequently, the daily data feed is compressed into a single file and uploaded on Amazon S3 for backup. The typical compressed file size is around 2 gigabytes.
Which of the following is the fastest way to upload the daily compressed file into Amazon S3?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Upload the compressed file using multipart upload with Amazon S3 Transfer Acceleration (Amazon S3TA) `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** FTP the compressed file into an Amazon EC2 instance that runs in the same region as the Amazon S3 bucket. Then transfer the file from the Amazon EC2 instance into the Amazon S3 bucket
- **(C)** Upload the compressed file using multipart upload
- **(D)** Upload the compressed file in a single operation

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Combining Multipart upload (uploading parts in parallel for multi-threaded throughput) with Amazon S3 Transfer Acceleration (S3TA) (routing data through CloudFront edge locations over an optimized network path) provides the fastest upload speed for a 2 GB file.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Single operation or Multipart upload alone: Slower than combining multipart upload with S3TA.
FTP to EC2 then S3: Roundabout, requires custom scripting, and is slower.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-14"></div>

### Question 14: Cross-Account Serverless Genomics Processing with Amazon EFS Access Points
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A biotechnology firm runs genomics data analysis workloads using AWS Lambda functions deployed inside a VPC in their central AWS account. The input data for these workloads consists of large files stored in an Amazon Elastic File System (Amazon EFS) that resides in a separate AWS account managed by a research partner. The firm wants the Lambda function in their account to access the shared EFS storage directly. The access pattern and file volume are expected to grow as additional research datasets are added over time, so the solution must be scalable and cost-efficient, and should require minimal operational overhead.
Which solution best meets these requirements in the MOST cost-effective way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EFS resource policies to allow cross-account access to the file system from the central account. Attach the EFS mount target to a shared VPC or peered VPC, and mount the file system in the Lambda function configuration using an EFS access point `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Set up an Amazon S3 bucket in the research partner’s account and periodically copy EFS contents into the bucket using scheduled AWS DataSync jobs. Use Amazon S3 Access Points to expose the data to the Lambda function in the central account, allowing access via S3 API calls instead of file system mounts
- **(C)** Package the genomic input data as a Lambda layer and publish it in the research partner's account. Share the layer across accounts by modifying its resource policy and attach the layer to the Lambda function in the central account to access the data during execution
- **(D)** Create a second Lambda function in the research partner's account that mounts the EFS file system locally. Have the main Lambda function in the central account invoke this secondary Lambda via Amazon API Gateway for data access and computation. Use IAM cross-account permissions to allow invocation

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EFS supports cross-account access via resource policies, EFS access points, and VPC peering or shared VPCs. The Lambda function in the central account can mount the EFS file system directly without data duplication or intermediary compute costs.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- DataSync to S3: Introduces storage duplication, recurring transfer costs, and delay.
Secondary proxy Lambda + API Gateway: Adds latency, operational complexity, and additional compute/API costs.
Lambda layer: Lambda layers have a 250 MB unzipped limit and are meant for code/dependencies, not large dynamic datasets.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-15"></div>

### Question 15: Overcoming S3 503 Slow Down API Rate Limits using Custom Prefixes
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A file-hosting service uses Amazon Simple Storage Service (Amazon S3) under the hood to power its storage offerings. Currently all the customer files are uploaded directly under a single Amazon S3 bucket. The engineering team has started seeing scalability issues where customer file uploads have started failing during the peak access hours with more than 5000 requests per second.
Which of the following is the MOST resource efficient and cost-optimal way of addressing this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Change the application architecture to create a new Amazon S3 bucket for each customer and then upload each customer's files directly under the respective buckets
- **(B)** Change the application architecture to create a new Amazon S3 bucket for each day's data and then upload the daily files directly under that day's bucket
- **(C)** Change the application architecture to create customer-specific custom prefixes within the single Amazon S3 bucket and then upload the daily files into those prefixed locations `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Change the application architecture to use Amazon Elastic File System (Amazon EFS) instead of Amazon S3 for storing the customers' uploaded files

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 supports 3,500 PUT/COPY/POST/DELETE or 5,500 GET/HEAD requests per second per prefix in a bucket, and there are no limits to the number of prefixes in a bucket. Creating customer-specific prefixes scales I/O performance horizontally within the single bucket at no extra cost.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Creating a new bucket per customer or per day: Inefficient use of globally unique bucket names and account bucket quotas.
Using Amazon EFS: EFS is a much costlier storage option compared to Amazon S3.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-16"></div>

### Question 16: Cost Differences Between ECS on EC2 vs ECS on AWS Fargate
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A leading social media analytics company is contemplating moving its dockerized application stack into AWS Cloud. The company is not sure about the pricing for using Amazon Elastic Container Service (Amazon ECS) with the EC2 launch type compared to the Amazon Elastic Container Service (Amazon ECS) with the Fargate launch type.
Which of the following is correct regarding the pricing for these two services?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon ECS with EC2 launch type is charged based on EC2 instances and EBS volumes used. Amazon ECS with Fargate launch type is charged based on vCPU and memory resources that the containerized application requests `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Both Amazon ECS with EC2 launch type and Amazon ECS with Fargate launch type are charged based on vCPU and memory resources that the containerized application requests
- **(C)** Both Amazon ECS with EC2 launch type and Amazon ECS with Fargate launch type are charged based on Amazon EC2 instances and Amazon EBS Elastic Volumes used
- **(D)** Both Amazon ECS with EC2 launch type and Amazon ECS with Fargate launch type are just charged based on Elastic Container Service used per hour

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
With the EC2 launch type, there is no additional charge for ECS; you pay for the AWS resources (EC2 instances and EBS volumes) you create to store and run your application. With the Fargate launch type, you pay for the amount of vCPU and memory resources that your containerized application requests.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-17"></div>

### Question 17: Stateless vs Stateful API Protocol Support with Amazon API Gateway (REST vs WebSocket)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The product team at a startup has figured out a market need to support both stateful and stateless client-server communications via the application programming interface (APIs) developed using its platform. You have been hired by the startup as a solutions architect to build a solution to fulfill this market need using Amazon API Gateway.
Which of the following would you identify as correct?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon API Gateway creates RESTful APIs that enable stateless client-server communication and Amazon API Gateway also creates WebSocket APIs that adhere to the WebSocket protocol, which enables stateful, full-duplex communication between client and server `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon API Gateway creates RESTful APIs that enable stateful client-server communication and Amazon API Gateway also creates WebSocket APIs that adhere to the WebSocket protocol, which enables stateless, full-duplex communication between client and server
- **(C)** Amazon API Gateway creates RESTful APIs that enable stateful client-server communication and Amazon API Gateway also creates WebSocket APIs that adhere to the WebSocket protocol, which enables stateful, full-duplex communication between client and server
- **(D)** Amazon API Gateway creates RESTful APIs that enable stateless client-server communication and Amazon API Gateway also creates WebSocket APIs that adhere to the WebSocket protocol, which enables stateless, full-duplex communication between client and server

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon API Gateway creates HTTP-based RESTful APIs that enable stateless client-server communication, and WebSocket APIs that adhere to the WebSocket protocol to enable stateful, full-duplex communication between client and server.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-18"></div>

### Question 18: Preserving Form Submission Order and Avoiding Duplicates using SQS FIFO
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A government agency is developing a online application to assist users in submitting permit requests through a web-based interface. The system architecture consists of a front-end web application tier and a background processing tier that handles the validation and submission of the forms. The application is expected to see high traffic and it must ensure that every submitted request is processed exactly once, with no loss of data.
Which design choice best satisfies these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Leverage Amazon API Gateway to pass the form submissions to AWS Lambda for processing in real time
- **(B)** Implement an Amazon SQS FIFO queue to reliably buffer and deliver form submissions from the web application layer to the processing tier `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Implement an Amazon SQS standard queue to reliably buffer and deliver form submissions from the web application layer to the processing tier
- **(D)** Leverage Amazon EventBridge to send events from the web application to the processing tier for asynchronous form handling

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
SQS FIFO (First-In-First-Out) queues are designed for exactly-once message processing with strict order preservation, preventing duplicate deliveries and decoupling the web and processing tiers.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- SQS standard queue: Provides at-least-once delivery (risk of duplicate messages) and best-effort ordering.
Amazon EventBridge: Provides at-least-once delivery semantics and lacks built-in ordering.
API Gateway to Lambda in real time: Does not provide a durable queue to decouple tiers or guarantee asynchronous exactly-once processing.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-19"></div>

### Question 19: Securing Privileged IAM Users with Hardware/Virtual Multi-Factor Authentication (MFA)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
A new DevOps engineer has joined a large financial services company recently. As part of his onboarding, the IT department is conducting a review of the checklist for tasks related to AWS Identity and Access Management (AWS IAM).
As an AWS Certified Solutions Architect – Associate, which best practices would you recommend (Select two)?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Grant maximum privileges to avoid assigning privileges again
- **(B)** Use user credentials to provide access specific permissions for Amazon EC2 instances
- **(C)** Enable AWS Multi-Factor Authentication (AWS MFA) for privileged users `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a minimum number of accounts and share these account credentials among employees
- **(E)** Configure AWS CloudTrail to log all AWS Identity and Access Management (AWS IAM) actions `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS recommends enabling Multi-Factor Authentication (MFA) for privileged users and turning on AWS CloudTrail to log all IAM actions for monitoring and audit purposes.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Share account credentials: User credentials should never be shared.
Grant maximum privileges: Violates the principle of least privilege.
Use user credentials on EC2: IAM roles should be used to grant permissions to EC2 instances.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-20"></div>

### Question 20: Hybrid DNS Resolution for On-Premises Domains via Route 53 Resolver Outbound Endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A healthcare company is developing a secure internal web portal hosted on AWS. The application must communicate with legacy systems that reside in the company's on-premises data centers. These data centers are connected to AWS via a site-to-site VPN. The company uses Amazon Route 53 as its DNS solution and requires the application to resolve private DNS records for the on-premises services from within its Amazon VPC.
What is the MOST secure and appropriate way to meet these DNS resolution requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a Route 53 private hosted zone for the on-premises domain. Associate the hosted zone with the VPC to allow the application to resolve DNS names of the on-premises services
- **(B)** Create a Route 53 Resolver outbound endpoint. Define a forwarding rule that routes DNS queries for on-premises domains to the on-premises DNS server. Associate the rule with the VPC `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Configure a Route 53 Resolver inbound endpoint and create a DNS forwarding rule. Enable recursive DNS resolution in the VPC to access on-premises services
- **(D)** Create a hybrid connectivity gateway and attach the on-premises DNS servers to Route 53 as authoritative zones for internal domains

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A Route 53 Resolver outbound endpoint forwards DNS queries originating inside the VPC to the on-premises DNS server across the site-to-site VPN based on forwarding rules associated with the VPC.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Inbound endpoint: Allows DNS queries from the on-premises network to resolve AWS-hosted private domains, not the other way around.
Hybrid connectivity gateway: Non-existent AWS construct.
Route 53 private hosted zone: Designed for AWS-hosted domains; using it for on-premises domains would require manual duplication of records.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-21"></div>

### Question 21: Hybrid Cloud NFS Migration to S3 using AWS Storage Gateway File Gateway
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A video analytics company runs data-intensive batch processing workloads that generate large log files and metadata daily. These files are currently stored in an on-premises NFS-based storage system located in the company's primary data center. However, the storage system is becoming increasingly difficult to scale and is unable to meet the company's growing storage demands. The IT team wants to migrate to a cloud-based storage solution that minimizes costs, retains NFS compatibility, and supports automated tiering of rarely accessed data to lower-cost storage. The team prefers to continue using existing NFS-based tools and protocols for compatibility with their current application stack.
Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an AWS Storage Gateway Volume Gateway in cached mode. Attach it as a block device to an on-premises file server and mount NFS on top. Store snapshots in Amazon S3 Glacier Deep Archive, and use AWS Backup to manage recovery operations and tiering
- **(B)** Use Amazon FSx for Windows File Server to replace the NFS workload. Enable data deduplication and automatic backups. Use Amazon S3 Glacier to move snapshots to a cost-efficient storage tier. Reconfigure the analytics application to access files using SMB protocol
- **(C)** Deploy an AWS Storage Gateway File Gateway on premises. Configure it to present an NFS-compatible file share to the workloads. Store the uploaded files in Amazon S3, and use S3 Lifecycle policies to automatically transition infrequently accessed objects to lower-cost storage classes `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Provision an Amazon Elastic File System (Amazon EFS) file system with the One Zone–IA storage class. Use AWS DataSync to migrate the NFS data to EFS. Configure the application to mount the file system over NFS and activate lifecycle management to tier infrequently accessed files

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
File Gateway (Amazon S3 File Gateway) presents an NFS-compatible interface to on-premises applications while storing the files as objects in Amazon S3, where S3 Lifecycle policies can automatically transition infrequently accessed objects to lower-cost tiers like S3 Standard-IA or Glacier.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon EFS: More expensive than S3 and requires full migration/reconfiguration.
Volume Gateway: Provides iSCSI block storage, not native file-based NFS access.
FSx for Windows File Server: Uses the SMB protocol, not NFS.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-22"></div>

### Question 22: Suspending Auto Scaling ReplaceUnhealthy Process During EC2 Troubleshooting
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
The DevOps team at an e-commerce company wants to perform some maintenance work on a specific Amazon EC2 instance that is part of an Auto Scaling group using a step scaling policy. The team is facing a maintenance challenge - every time the team deploys a maintenance patch, the instance health check status shows as out of service for a few minutes. This causes the Auto Scaling group to provision another replacement instance immediately.
As a solutions architect, which are the MOST time/resource efficient steps that you would recommend so that the maintenance work can be completed at the earliest? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Delete the Auto Scaling group and apply the maintenance fix to the given instance. Create a new Auto Scaling group and add all the instances again using the manual scaling policy
- **(B)** Take a snapshot of the instance, create a new Amazon Machine Image (AMI) and then launch a new instance using this AMI. Apply the maintenance patch to this new instance and then add it back to the Auto Scaling Group by using the manual scaling policy. Terminate the earlier instance that had the maintenance issue
- **(C)** Suspend the ReplaceUnhealthy process type for the Auto Scaling group and apply the maintenance patch to the instance. Once the instance is ready, you can manually set the instance's health status back to healthy and activate the ReplaceUnhealthy process type again `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Suspend the ScheduledActions process type for the Auto Scaling group and apply the maintenance patch to the instance. Once the instance is ready, you can you can manually set the instance's health status back to healthy and activate the ScheduledActions process type again
- **(E)** Put the instance into the Standby state and then update the instance by applying the maintenance patch. Once the instance is ready, you can exit the Standby state and then return the instance to service `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Standby state: You can put an InService instance into the Standby state, update or troubleshoot the instance (it remains part of the ASG but does not handle traffic), and then exit Standby to return it to service.
Suspend ReplaceUnhealthy: Suspending the ReplaceUnhealthy process stops Amazon EC2 Auto Scaling from terminating and replacing instances that are marked as unhealthy during maintenance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Creating a new AMI/instance or deleting the ASG is not time/resource optimal, and ScheduledActions only suspends scheduled scaling actions.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-23"></div>

### Question 23: Proactive Security Monitoring with CloudWatch Metric Filters on CloudTrail Error Codes
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
While consolidating logs for the weekly reporting, a development team at an e-commerce company noticed that an unusually large number of illegal AWS application programming interface (API) queries were made sometime during the week. Due to the off-season, there was no visible impact on the systems. However, this event led the management team to seek an automated solution that can trigger near-real-time warnings in case such an event recurs.
Which of the following represents the best solution for the given scenario?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure AWS CloudTrail to stream event data to Amazon Kinesis. Use Amazon Kinesis stream-level metrics in the Amazon CloudWatch to trigger an AWS Lambda function that will trigger an error workflow
- **(B)** AWS Trusted Advisor publishes metrics about check results to Amazon CloudWatch. Create an alarm to track status changes for checks in the Service Limits category for the APIs. The alarm will then notify when the service quota is reached or exceeded
- **(C)** Run Amazon Athena SQL queries against AWS CloudTrail log files stored in Amazon S3 buckets. Use Amazon QuickSight to generate reports for managerial dashboards
- **(D)** Create an Amazon CloudWatch metric filter that processes AWS CloudTrail logs having API call details and looks at any errors by factoring in all the error codes that need to be tracked. Create an alarm based on this metric's rate to send an Amazon SNS notification to the required team `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS CloudTrail integrates with Amazon CloudWatch Logs to publish API call events. You can create CloudWatch metric filters to turn log data (such as unauthorized/illegal API error codes) into numerical CloudWatch metrics and trigger a CloudWatch Alarm to send an Amazon SNS notification in near-real-time.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- CloudTrail to Kinesis: CloudTrail cannot stream data directly to Amazon Kinesis (only S3 and CloudWatch Logs).
Athena + QuickSight: Used for ad-hoc querying and BI reporting, not automated near-real-time alerting.
Trusted Advisor Service Limits: Only alerts when service quotas are reached, not when illegal API queries occur.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-24"></div>

### Question 24: Visual Data Cleansing and Transformation Profiling with AWS Glue DataBrew
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A healthcare analytics company centralizes clinical and operational datasets in an Amazon S3–based data lake. Incoming data is ingested in Apache Parquet format from multiple hospitals and wearable health devices. To ensure quality and standardization, the company applies several transformation steps: anomaly filtering, datetime normalization, and aggregation by patient cohort. The company needs a solution to support a code-free interface that enables data engineers and business analysts to collaborate on data preparation workflows. The company also requires data lineage tracking, data profiling capabilities, and an easy way to share transformation logic across teams without writing or managing code.
Which AWS solution best meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Glue Studio’s visual canvas to design data transformation workflows on top of the Parquet files in Amazon S3. Configure Glue Studio jobs to run these transformations without writing code. Share the job definitions with team members for reuse. Use the visual job editor to track transformation progress and inspect profiling statistics for each dataset column
- **(B)** Create Amazon Athena SQL queries to perform transformation steps directly on S3. Store queries in AWS Glue Data Catalog and share saved queries with other users through Amazon Athena's query editor
- **(C)** Use Amazon AppFlow to move and transform Parquet files in S3. Configure AppFlow transformations and mappings within the visual interface. Share flows with collaborators through AWS IAM policies and scheduled executions
- **(D)** Use AWS Glue DataBrew to visually build transformation workflows on top of the raw Parquet files in S3. Use DataBrew recipes to track, audit, and share the transformation steps with others. Enable data profiling to inspect column statistics, null values, and data types across datasets `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Glue DataBrew is a visual, no-code data preparation tool that enables analysts and engineers to clean and normalize data using reusable "recipes", track visual data lineage, and run built-in data profiling (column statistics, null counts, distributions).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon AppFlow: Designed for SaaS-to-AWS data flows, not large-scale S3 data preparation and profiling.
Amazon Athena: Requires SQL coding and lacks visual transformation, profiling, and lineage features.
AWS Glue Studio: Primarily intended for developers building Spark ETL jobs and lacks built-in data profiling and shareable human-readable recipes compared to DataBrew.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-25"></div>

### Question 25: Inter-Region Shared Storage Access for Amazon EFS via Inter-Region VPC Peering
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
The sourcing team at the US headquarters of a global e-commerce company is preparing a spreadsheet of the new product catalog. The spreadsheet is saved on an Amazon Elastic File System (Amazon EFS) created in us-east-1 region. The sourcing team counterparts from other AWS regions such as Asia Pacific and Europe also want to collaborate on this spreadsheet.
As a solutions architect, what is your recommendation to enable this collaboration with the LEAST amount of operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The spreadsheet will have to be copied into Amazon EFS file systems of other AWS regions as Amazon EFS is a regional service and it does not allow access from other AWS regions
- **(B)** The spreadsheet data will have to be moved into an Amazon RDS for MySQL database which can then be accessed from any AWS region
- **(C)** The spreadsheet on the Amazon Elastic File System (Amazon EFS) can be accessed in other AWS regions by using an inter-region VPC peering connection `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** The spreadsheet will have to be copied in Amazon S3 which can then be accessed from any AWS region

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EC2 instances in other AWS regions can connect to and mount an Amazon EFS file system across regions using an inter-region VPC peering connection (or AWS Transit Gateway), enabling direct collaboration on the same file.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Copy to S3 or RDS: S3 does not support POSIX in-place edits, and moving a spreadsheet into RDS requires building custom application logic.
Copy into EFS in other regions: Each team would work on a separate copy rather than collaborating on a single file.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-26"></div>

### Question 26: Ultra High-Performance Low-Latency Ephemeral Storage using EC2 Instance Store
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A research group runs its flagship application on a fleet of Amazon EC2 instances for a specialized task that must deliver high random I/O performance. Each instance in the fleet would have access to a dataset that is replicated across the instances by the application itself. Because of the resilient application architecture, the specialized task would continue to be processed even if any instance goes down, as the underlying application would ensure the replacement instance has access to the required dataset.
Which of the following options is the MOST cost-optimal and resource-efficient solution to build this fleet of Amazon EC2 instances?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Instance Store based Amazon EC2 instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon EC2 instances with Amazon EFS mount points
- **(C)** Use Amazon EC2 instances with access to Amazon S3 based storage
- **(D)** Use Amazon Elastic Block Store (Amazon EBS) based EC2 instances

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
EC2 Instance Store provides temporary block-level storage physically attached to the host computer, delivering very high random I/O performance at no extra storage cost (included in the instance usage cost). It is ideal when data is replicated across a fleet of instances by the application.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon EBS: Would require Provisioned IOPS (io1/io2) volumes, incurring significant additional cost.
Amazon EFS / Amazon S3: Incur extra storage costs and do not match the low-cost, local high random I/O performance of Instance Store.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-27"></div>

### Question 27: Principle of Least Privilege S3 Object-Level Permissions (arn:aws:s3:::bucket/*)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A development team requires permissions to list an Amazon S3 bucket and delete objects from that bucket. A systems administrator has created the following IAM policy to provide access to the bucket and applied that policy to the group. The group is not able to delete objects in the bucket. The company follows the principle of least privilege.
    "Version": "2021-10-17",
    "Statement": [
        {
            "Action": [
                "s3:ListBucket",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::example-bucket"
            ],
            "Effect": "Allow"
        }
    ]
Which statement should a solutions architect add to the policy to address this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Option A:
{
    "Action": [
        "s3:DeleteObject"
    ],
    "Resource": [
        "arn:aws:s3:::example-bucket*"
    ],
    "Effect": "Allow"
}
- **(B)** Option B:
{
    "Action": [
        "s3:*Object"
    ],
    "Resource": [
        "arn:aws:s3:::example-bucket/*"
    ],
    "Effect": "Allow"
}
- **(C)** Option C:
{
    "Action": [
        "s3:*"
    ],
    "Resource": [
        "arn:aws:s3:::example-bucket/*"
    ],
    "Effect": "Allow"
}
- **(D)** Option D:
{
    "Action": [
        "s3:DeleteObject"
    ],
    "Resource": [
        "arn:aws:s3:::example-bucket/*"
    ],
    "Effect": "Allow"
} `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Bucket-level actions like s3:ListBucket apply to the bucket ARN (arn:aws:s3:::example-bucket), whereas object-level actions like s3:DeleteObject apply to the objects inside the bucket (arn:aws:s3:::example-bucket/*). Specifying s3:DeleteObject on arn:aws:s3:::example-bucket/* grants the required permission while adhering to least privilege.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-28"></div>

### Question 28: Cost-Effective Millisecond-Retrieval Storage for Predictable Access using S3 Standard-IA
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An audit department generates and accesses the audit reports only twice in a financial year. The department uses AWS Step Functions to orchestrate the report creating process that has failover and retry scenarios built into the solution. The underlying data to create these audit reports is stored on Amazon S3, runs into hundreds of Terabytes and should be available with millisecond latency.
As an AWS Certified Solutions Architect – Associate, which is the MOST cost-effective storage class that you would recommend to be used for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon S3 Intelligent-Tiering (S3 Intelligent-Tiering)
- **(B)** Amazon S3 Standard-Infrequent Access (S3 Standard-IA) `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Amazon S3 Standard
- **(D)** Amazon S3 Glacier Deep Archive

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Since the data is accessed only twice a year with a known access pattern and requires millisecond latency (and the Step Functions workflow handles retries for 99.9% availability), Amazon S3 Standard-IA is the most cost-effective choice among the options. (Note: If S3 Glacier Instant Retrieval were an option here, it would also be a strong candidate, but among the provided choices, S3 Standard-IA is the only infrequent-access tier offering millisecond latency without paying S3 Intelligent-Tiering monitoring fees or S3 Standard storage rates).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- S3 Standard: More expensive storage cost per GB for infrequently accessed data.
S3 Intelligent-Tiering: Incurs a monthly object monitoring and automation charge, which is unnecessary when access patterns are predictable.
S3 Glacier Deep Archive: Retrieval takes hours and does not support millisecond latency.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-29"></div>

### Question 29: Securing Amazon EFS Mount Access using IAM Client Authorization Policies
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (C) | **Đáp án đúng**: (A), (C)

#### 📋 Đề bài (Scenario)
A company has moved its business critical data to Amazon Elastic File System (Amazon EFS) which will be accessed by multiple Amazon EC2 instances.
As an AWS Certified Solutions Architect - Associate, which of the following would you recommend to exercise access control such that only the permitted Amazon EC2 instances can read from the Amazon EFS file system? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an IAM policy to control access for clients who can mount your file system with the required permissions `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon GuardDuty to curb unwanted access to Amazon EFS file system
- **(C)** Use VPC security groups to control the network traffic to and from your file system `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use network access control list (network ACL) to control the network traffic to and from your Amazon EC2 instance
- **(E)** Set up the IAM policy root credentials to control and configure the clients accessing the Amazon EFS file system

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You control which EC2 instances can access an Amazon EFS file system by using VPC security group rules (to control network traffic to/from the EFS mount targets) and IAM policies (to control which clients can mount the file system and with what permissions, such as read-only vs read/write).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Network ACL: Operates at the subnet level, not the instance level.
GuardDuty: Threat detection service, not an access control mechanism.
IAM policy root credentials: Distractor term.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-30"></div>

### Question 30: Multi-Tier Resilient Architecture with ALB, Multi-AZ ASG, and Multi-AZ RDS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An e-commerce company is looking for a solution with high availability, as it plans to migrate its flagship application to a fleet of Amazon Elastic Compute Cloud (Amazon EC2) instances. The solution should allow for content-based routing as part of the architecture.
As a Solutions Architect, which of the following will you suggest for the company?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use a Network Load Balancer for distributing traffic to the Amazon EC2 instances spread across different Availability Zones (AZs). Configure a Private IP address to mask any failure of an instance
- **(B)** Use an Auto Scaling group for distributing traffic to the Amazon EC2 instances spread across different Availability Zones (AZs). Configure an elastic IP address (EIP) to mask any failure of an instance
- **(C)** Use an Application Load Balancer for distributing traffic to the Amazon EC2 instances spread across different Availability Zones (AZs). Configure Auto Scaling group to mask any failure of an instance `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use an Auto Scaling group for distributing traffic to the Amazon EC2 instances spread across different Availability Zones (AZs). Configure a Public IP address to mask any failure of an instance

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The Application Load Balancer (ALB) operates at Layer 7 (HTTP/HTTPS) and supports content-based routing across targets in multiple Availability Zones. Pairing it with an Auto Scaling group automatically replaces unhealthy instances to maintain high availability.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Network Load Balancers operate at Layer 4 and do not support content-based routing, and Auto Scaling groups do not distribute traffic by themselves.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-31"></div>

### Question 31: Pre-Warming Predictable End-of-Month Traffic Spikes with Auto Scaling Scheduled Actions
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
The payroll department at a company initiates several computationally intensive workloads on Amazon EC2 instances at a designated hour on the last day of every month. The payroll department has noticed a trend of severe performance lag during this hour. The engineering team has figured out a solution by using Auto Scaling Group for these Amazon EC2 instances and making sure that 10 Amazon EC2 instances are available during this peak usage hour. For normal operations only 2 Amazon EC2 instances are enough to cater to the workload.
As a solutions architect, which of the following steps would you recommend to implement the solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure your Auto Scaling group by creating a scheduled action that kicks-off at the designated hour on the last day of the month. Set the min count as well as the max count of instances to 10. This causes the scale-out to happen before peak traffic kicks in at the designated hour
- **(B)** Configure your Auto Scaling group by creating a scheduled action that kicks-off at the designated hour on the last day of the month. Set the desired capacity of instances to 10. This causes the scale-out to happen before peak traffic kicks in at the designated hour `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Configure your Auto Scaling group by creating a simple tracking policy and setting the instance count to 10 at the designated hour. This causes the scale-out to happen before peak traffic kicks in at the designated hour
- **(D)** Configure your Auto Scaling group by creating a target tracking policy and setting the instance count to 10 at the designated hour. This causes the scale-out to happen before peak traffic kicks in at the designated hour

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Scheduled scaling allows you to scale your application proactively based on predictable, time-based traffic patterns by specifying the desired capacity (10 instances) at the designated time and date.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Min and max values define a range rather than the exact desired capacity, and target tracking/simple scaling policies are reactive metric-based policies rather than time-scheduled actions.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-32"></div>

### Question 32: S3 Threat Detection with GuardDuty and EC2 Vulnerability Scanning with Inspector
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An IT security consultancy is working on a solution to protect data stored in Amazon S3 from any malicious activity as well as check for any vulnerabilities on Amazon EC2 instances.
As a solutions architect, which of the following solutions would you suggest to help address the given requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon Inspector to check for vulnerabilities on Amazon EC2 instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon Inspector to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon Inspector to check for vulnerabilities on Amazon EC2 instances
- **(C)** Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon GuardDuty to check for vulnerabilities on Amazon EC2 instances
- **(D)** Use Amazon Inspector to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon GuardDuty to check for vulnerabilities on Amazon EC2 instances

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon GuardDuty provides intelligent threat detection to continuously monitor and protect AWS accounts, workloads, and data stored in Amazon S3 (via S3 Protection). Amazon Inspector performs automated vulnerability assessments on Amazon EC2 instances (and container images/Lambda functions).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-33"></div>

### Question 33: Replication Differences Between RDS Multi-AZ (Synchronous) and Read Replicas (Asynchronous)
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A new DevOps engineer has just joined a development team and wants to understand the replication capabilities for Amazon RDS Multi-AZ deployment as well as Amazon RDS Read-replicas.
Which of the following correctly summarizes these capabilities for the given database?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Multi-AZ follows synchronous replication and spans at least two Availability Zones (AZs) within a single region. Read replicas follow asynchronous replication and can be within an Availability Zone (AZ), Cross-AZ, or Cross-Region `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Multi-AZ follows asynchronous replication and spans at least two Availability Zones (AZs) within a single region. Read replicas follow synchronous replication and can be within an Availability Zone (AZ), Cross-AZ, or Cross-Region
- **(C)** Multi-AZ follows asynchronous replication and spans one Availability Zone (AZ) within a single region. Read replicas follow synchronous replication and can be within an Availability Zone (AZ), Cross-AZ, or Cross-Region
- **(D)** Multi-AZ follows asynchronous replication and spans at least two Availability Zones (AZs) within a single region. Read replicas follow asynchronous replication and can be within an Availability Zone (AZ), Cross-AZ, or Cross-Region

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS Multi-AZ deployments synchronously replicate data to a standby instance in a different AZ within the same region for high availability and automatic failover. Amazon RDS Read Replicas use asynchronous replication to scale read-heavy workloads and can be deployed within the same AZ, Cross-AZ, or Cross-Region.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-34"></div>

### Question 34: Resolving SNS-to-Lambda Message Delivery Bottlenecks by Increasing Account Concurrency
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
The engineering team at a Spanish professional football club has built a notification system for its website using Amazon Simple Notification Service (Amazon SNS) notifications which are then handled by an AWS Lambda function for end-user delivery. During the off-season, the notification systems need to handle about 100 requests per second. During the peak football season, the rate touches about 5000 requests per second and it is noticed that a significant number of the notifications are not being delivered to the end-users on the website.
As a solutions architect, which of the following would you suggest as the BEST possible solution to this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The engineering team needs to provision more servers running the AWS Lambda service
- **(B)** Amazon SNS has hit a scalability limit, so the team needs to contact AWS support to raise the account limit
- **(C)** The engineering team needs to provision more servers running the Amazon SNS service
- **(D)** Amazon SNS message deliveries to AWS Lambda have crossed the account concurrency quota for AWS Lambda, so the team needs to contact AWS support to raise the account limit `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
By default, AWS Lambda supports 1,000 concurrent executions per AWS account per Region. When Amazon SNS message deliveries cause Lambda to exceed this concurrency quota, deliveries are throttled. Contacting AWS Support (or using Service Quotas) to raise the account concurrency limit resolves the throttling.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Both SNS and Lambda are serverless, so you cannot manually provision servers for them, and SNS scales dynamically without hitting a 5,000 req/s account limit.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-35"></div>

### Question 35: Automated Medical Entity Extraction Pipeline with S3 Events, Lambda, and Comprehend
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An e-commerce company manages a digital catalog of consumer products submitted by third-party sellers. Each product submission includes a description stored as a text file in an Amazon S3 bucket. These descriptions may include ingredient information for consumable products like snacks, supplements, or beverages. The company wants to build a fully automated solution that extracts ingredient names from the uploaded product descriptions and uses those names to query an Amazon DynamoDB table, which returns precomputed health and safety scores for each ingredient. Non-food items and invalid submissions can be ignored without affecting application logic. The company has no in-house machine learning (ML) experts and is looking for the most cost-effective solution with minimal operational overhead.
Which solution meets these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure S3 Event Notifications to trigger an AWS Lambda function whenever a new product description is uploaded. Inside the function, use Amazon Comprehend's custom entity recognition feature to extract ingredient names. Store these names in the DynamoDB table and let the front-end application query for health scores `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon SageMaker with a custom-trained NLP model to identify ingredients from the uploaded descriptions. Use Amazon EventBridge to invoke a Lambda function that forwards the document content to a SageMaker endpoint and stores the results in DynamoDB. Fine-tune the model using labeled ingredient datasets from open-source repositories and retrain it monthly
- **(C)** Use Amazon Lookout for Vision to scan the uploaded text files in the S3 bucket and extract entities. Invoke this workflow using an S3-triggered Lambda function. Parse the output and use Amazon API Gateway to push updates to the frontend in real time
- **(D)** Create a workflow where Amazon Transcribe is used to convert synthetic audio versions (created from text of the product descriptions) back into text. Analyze the transcripts manually or using simple keyword matching within a Lambda function. Use Amazon SNS to notify the content moderation team for each processed file

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Comprehend is a managed Natural Language Processing (NLP) service that requires no ML expertise. Its custom entity recognition feature can extract specific domain entities like ingredient names from text files triggered via S3 Event Notifications and AWS Lambda.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon SageMaker: Requires ML expertise to train, tune, and maintain custom NLP models and endpoints.
Amazon Transcribe: Speech-to-text service, completely unnecessary for text files.
Amazon Lookout for Vision: Computer vision service for detecting visual defects in industrial images, not text entity extraction.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-36"></div>

### Question 36: Decoupling Monolithic Ticketing Systems using Amazon SQS Standard Queues
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
A digital event-ticketing platform hosts its core transaction-processing service on AWS. The service runs on Amazon EC2 instances and stores finalized transactions in an Amazon Aurora PostgreSQL database. During periods of high user activity - such as flash ticket sales or holiday promotions - the application begins timing out, causing failed or delayed purchases. A solutions architect has been asked to redesign the backend for scalability and cost-efficiency, without reengineering the database layer.
Which combination of actions will meet these goals in the most cost-effective and scalable manner? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy read replicas for the Aurora database in another Region and configure EC2 instances to read and write from the nearest replica based on latency
- **(B)** Deploy an Amazon API Gateway with throttling and usage plans to slow down incoming purchase requests during peak times and maintain application stability
- **(C)** Modify the application to publish purchase events to an Amazon SQS queue. Launch an Auto Scaling group of EC2 workers that poll the queue and process purchases asynchronously `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use an Amazon ElastiCache cluster to cache database queries. Configure the application to store purchase transactions in the cache before writing to the database
- **(E)** Implement Amazon RDS Proxy between the application and the Aurora PostgreSQL cluster. Deploy EC2 instances in an Auto Scaling group to retry transactions as needed `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS Proxy pools and shares database connections, preventing Aurora connection exhaustion and timeouts during flash sales while EC2 instances scale out in an Auto Scaling group.
Amazon SQS + Auto Scaling EC2 workers decouples the frontend from backend database writes, buffering traffic spikes and processing purchases asynchronously at a pace the database can handle.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- ElastiCache for storing purchase transactions: Volatile in-memory cache is not suitable for durable transactional writes.
API Gateway throttling: Rejects/delays customer purchases rather than scaling to process them.
Read replicas for writes: Read replicas are read-only and cannot accept write transactions.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-37"></div>

### Question 37: Accelerating Athena Query Performance with S3 Standard and Columnar Formats
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A leading video streaming service delivers billions of hours of content from Amazon Simple Storage Service (Amazon S3) to customers around the world. Amazon S3 also serves as the data lake for its big data analytics solution. The data lake has a staging zone where intermediary query results are kept only for 24 hours. These results are also heavily referenced by other parts of the analytics pipeline.
Which of the following is the MOST cost-effective strategy for storing this intermediary query data?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the intermediary query results in Amazon S3 Glacier Instant Retrieval storage class
- **(B)** Store the intermediary query results in Amazon S3 Standard storage class `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Store the intermediary query results in Amazon S3 Standard-Infrequent Access storage class
- **(D)** Store the intermediary query results in Amazon S3 One Zone-Infrequent Access storage class

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 Standard has no minimum storage duration charge and no per-GB retrieval fee. Since the data is kept for only 24 hours and is heavily referenced (frequently read), S3 Standard is the most cost-effective storage class.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- S3 Standard-IA and S3 One Zone-IA have a 30-day minimum storage duration charge (and S3 Glacier Instant Retrieval has a 90-day minimum storage duration charge), plus per-GB retrieval fees, making them much more expensive for short-lived, frequently accessed data.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-38"></div>

### Question 38: Object-Level Compliance Governance using S3 Object Lock and Retention Periods
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
A company uses Amazon S3 buckets for storing sensitive customer data. The company has defined different retention periods for different objects present in the Amazon S3 buckets, based on the compliance requirements. But, the retention rules do not seem to work as expected.
Which of the following options represent a valid configuration for setting up retention periods for objects in Amazon S3 buckets? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** When you use bucket default settings, you specify a Retain Until Date for the object version
- **(B)** You cannot place a retention period on an object version through a bucket default setting
- **(C)** Different versions of a single object can have different retention modes and periods `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** The bucket default settings will override any explicit retention mode or period you request on an object version
- **(E)** When you apply a retention period to an object version explicitly, you specify a Retain Until Date for the object version `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
In S3 Object Lock, when you apply a retention period to an object version explicitly, you specify a Retain Until Date for that object version.
Retention periods apply to individual object versions, and different versions of a single object can have different retention modes and periods.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- You can place a retention period through bucket default settings, but bucket default settings use a duration (in days or years), not a Retain Until Date.
Explicit retention settings on an object version override bucket default settings, not the other way around.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-39"></div>

### Question 39: EBS HDD Volume Types Comparison: Throughput Optimized (st1) vs Cold HDD (sc1)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (E) | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A software engineering intern at an e-commerce company is documenting the process flow to provision Amazon EC2 instances via the Amazon EC2 API. These instances are to be used for an internal application that processes Human Resources payroll data. He wants to highlight those volume types that cannot be used as a boot volume.
Can you help the intern by identifying those storage volume types that CANNOT be used as boot volumes while creating the instances? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provisioned IOPS Solid state drive (io1)
- **(B)** Throughput Optimized Hard disk drive (st1) `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Instance Store
- **(D)** General Purpose Solid State Drive (gp2)
- **(E)** Cold Hard disk drive (sc1) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
HDD-backed Amazon EBS volume types—Throughput Optimized HDD (st1) and Cold HDD (sc1)—cannot be used as boot volumes.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- General Purpose SSD (gp2/gp3), Provisioned IOPS SSD (io1/io2), Magnetic (standard), and Instance Store volumes can be used as boot volumes.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-40"></div>

### Question 40: High-Throughput Ultra-Fast File System for EDA HPC Workloads with FSx for Lustre
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An Electronic Design Automation (EDA) application produces massive volumes of data that can be divided into two categories. The 'hot data' needs to be both processed and stored quickly in a parallel and distributed fashion. The 'cold data' needs to be kept for reference with quick access for reads and updates at a low cost.
Which of the following AWS services is BEST suited to accelerate the aforementioned chip design process?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon FSx for Lustre `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon FSx for Windows File Server
- **(C)** Amazon EMR
- **(D)** AWS Glue

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for Lustre provides a high-performance parallel file system ideal for HPC and EDA workloads ('hot data') while natively integrating with Amazon S3 to transparently present S3 objects as files and write changed data back to S3 ('cold data' at low cost).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- FSx for Windows File Server does not natively link to S3 as a transparent POSIX data repository, and EMR/Glue are big data/ETL frameworks rather than high-performance parallel file systems.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-41"></div>

### Question 41: S3 Lifecycle Transition Restrictions (Intelligent-Tiering to Standard Not Allowed)
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (D) | **Đáp án đúng**: (A), (D)

#### 📋 Đề bài (Scenario)
The IT department at a consulting firm is conducting a training workshop for new developers. As part of an evaluation exercise on Amazon S3, the new developers were asked to identify the invalid storage class lifecycle transitions for objects stored on Amazon S3.
Can you spot the INVALID lifecycle transitions from the options below? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon S3 Intelligent-Tiering => Amazon S3 Standard `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon S3 Standard => Amazon S3 Intelligent-Tiering
- **(C)** Amazon S3 Standard-IA => Amazon S3 One Zone-IA
- **(D)** Amazon S3 One Zone-IA => Amazon S3 Standard-IA `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Amazon S3 Standard-IA => Amazon S3 Intelligent-Tiering

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Correct options (Invalid transitions): Amazon S3 lifecycle transitions follow a waterfall model moving down to lower-cost tiers:
You cannot transition from any storage class up to S3 Standard (S3 Intelligent-Tiering => S3 Standard is invalid).
You cannot transition from S3 One Zone-IA back to S3 Standard-IA or S3 Intelligent-Tiering (S3 One Zone-IA => S3 Standard-IA is invalid).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-42"></div>

### Question 42: Secure Encrypted High-Bandwidth Hybrid Connectivity via Direct Connect with VPN (IPsec)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
The engineering team at an e-commerce company wants to establish a dedicated, encrypted, low latency, and high throughput connection between its data center and AWS Cloud. The engineering team has set aside sufficient time to account for the operational overhead of establishing this connection.
As a solutions architect, which of the following solutions would you recommend to the company?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Transit Gateway to establish a connection between the data center and AWS Cloud
- **(B)** Use AWS Direct Connect plus virtual private network (VPN) to establish a connection between the data center and AWS Cloud `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use AWS site-to-site VPN to establish a connection between the data center and AWS Cloud
- **(D)** Use AWS Direct Connect to establish a connection between the data center and AWS Cloud

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Direct Connect provides a dedicated, low-latency, high-throughput physical network connection between on-premises and AWS, but it is not encrypted by default. Combining AWS Direct Connect plus VPN provides an IPsec-encrypted private connection over the dedicated Direct Connect link.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Site-to-Site VPN alone: Uses the public internet and cannot guarantee low latency and high throughput.
Direct Connect alone: Does not provide encryption by default.
Transit Gateway alone: Is a cloud network transit hub, not a physical connectivity link.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-43"></div>

### Question 43: Increasing SQS FIFO Queue Throughput with Batching Operations (Up to 3,000 msg/s)
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A major bank is using Amazon Simple Queue Service (Amazon SQS) to migrate several core banking applications to the cloud to ensure high availability and cost efficiency while simplifying administrative complexity and overhead. The development team at the bank expects a peak rate of about 1000 messages per second to be processed via SQS. It is important that the messages are processed in order.
Which of the following options can be used to implement this system?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon SQS FIFO (First-In-First-Out) queue to process the messages
- **(B)** Use Amazon SQS standard queue to process the messages
- **(C)** Use Amazon SQS FIFO (First-In-First-Out) queue in batch mode of 2 messages per operation to process the messages at the peak rate
- **(D)** Use Amazon SQS FIFO (First-In-First-Out) queue in batch mode of 4 messages per operation to process the messages at the peak rate `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Because messages must be processed in strict order, an SQS FIFO queue is required. By default (without high throughput mode), FIFO queues support up to 300 API operations per second without batching, or up to 3,000 messages per second when batching 10 messages per operation. Batching 4 messages per operation supports $300 \times 4 = 1,200$ messages per second, which meets the 1,000 messages/second peak requirement.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Standard queues do not guarantee strict ordering, unbatched FIFO only supports 300 messages/second, and batching 2 messages/operation only supports 600 messages/second.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-44"></div>

### Question 44: Global Edge Caching for On-Premises Web Origins using Amazon CloudFront
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A retail company's dynamic website is hosted using on-premises servers in its data center in the United States. The company is launching its website in Asia, and it wants to optimize the website loading times for new users in Asia. The website's backend must remain in the United States. The website is being launched in a few days, and an immediate solution is needed.
What would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon CloudFront with a custom origin pointing to the DNS record of the website on Amazon Route 53
- **(B)** Migrate the website to Amazon S3. Use S3 cross-region replication (S3 CRR) between AWS Regions in the US and Asia
- **(C)** Use Amazon CloudFront with a custom origin pointing to the on-premises servers `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Leverage a Amazon Route 53 geo-proximity routing policy pointing to on-premises servers

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon CloudFront can be configured with a custom origin (an on-premises HTTP web server) to cache content at edge locations close to viewers in Asia and optimize network routing over the AWS global network back to the US origin.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Migrate to Amazon S3: S3 only hosts static websites, not dynamic server-side websites.
Route 53 geo-proximity routing: Since the servers only exist in the US, DNS routing alone will not reduce latency for users in Asia.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-45"></div>

### Question 45: Storage Cost Hierarchy: S3 Standard vs Amazon EFS vs Amazon EBS
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A technology blogger wants to write a review on the comparative pricing for various storage types available on AWS Cloud. The blogger has created a test file of size 1 gigabytes with some random data. Next he copies this test file into AWS S3 Standard storage class, provisions an Amazon EBS volume (General Purpose SSD (gp2)) with 100 gigabytes of provisioned storage and copies the test file into the Amazon EBS volume, and lastly copies the test file into an Amazon EFS Standard Storage filesystem. At the end of the month, he analyses the bill for costs incurred on the respective storage types for the test file.
What is the correct order of the storage charges incurred for the test file on these three storage types?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Cost of test file storage on Amazon EFS < Cost of test file storage on Amazon S3 Standard < Cost of test file storage on Amazon EBS
- **(B)** Cost of test file storage on Amazon EBS < Cost of test file storage on Amazon S3 Standard < Cost of test file storage on Amazon EFS
- **(C)** Cost of test file storage on Amazon S3 Standard < Cost of test file storage on Amazon EBS < Cost of test file storage on Amazon EFS
- **(D)** Cost of test file storage on Amazon S3 Standard < Cost of test file storage on Amazon EFS < Cost of test file storage on Amazon EBS `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 Standard: Pay only for actual data stored (~USD 0.023 per GB-month). For a 1 GB file = USD 0.023/month.
Amazon EFS Standard: Pay only for actual data stored (~USD 0.30 per GB-month). For a 1 GB file = USD 0.30/month.
Amazon EBS (gp2): Pay for provisioned capacity (~USD 0.10 per GB-month) regardless of how much is used. For a 100 GB provisioned volume = $100 \times 0.10 =$ USD 10.00/month.
Therefore: S3 Standard (USD 0.023) < EFS (USD 0.30) < EBS (USD 10.00).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-46"></div>

### Question 46: Low-Latency Global Gaming Reads using Amazon Aurora Global Database
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
The flagship application for a gaming company connects to an Amazon Aurora database and the entire technology stack is currently deployed in the United States. Now, the company has plans to expand to Europe and Asia for its operations. It needs the games table to be accessible globally but needs the users and games_played tables to be regional only.
How would you implement this with minimal application refactoring?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an Amazon Aurora Global Database for the games table and use Amazon DynamoDB tables for the users and games_played tables
- **(B)** Use an Amazon Aurora Global Database for the games table and use Amazon Aurora for the users and games_played tables `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use a Amazon DynamoDB global table for the games table and use Amazon Aurora for the users and games_played tables
- **(D)** Use a Amazon DynamoDB global table for the games table and use Amazon DynamoDB tables for the users and games_played tables

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
To achieve minimal application refactoring, the company should continue using Amazon Aurora (SQL) rather than switching to Amazon DynamoDB (NoSQL). They can use an Amazon Aurora Global Database cluster for the globally accessible games table and regional Amazon Aurora clusters for the regional users and games_played tables.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-47"></div>

### Question 47: Decoupling Payment Processing with API Gateway, Lambda, and ECS Fargate
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A digital wallet company plans to launch a new cloud-based service for processing user cash transfers and peer-to-peer payments. The application will receive transaction requests from mobile clients via a secure endpoint. Each transaction request must go through a lightweight validation step before being forwarded for backend processing, which includes fraud detection, ledger updates, and notifications. The backend workload is compute- and memory-intensive, requires scaling based on volume, and must run for a longer duration than typical short-lived tasks. The engineering team prefers a fully managed solution that minimizes infrastructure maintenance, including provisioning and patching of virtual machines or containers.
Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon API Gateway endpoint to receive transaction requests from mobile devices. Use AWS Lambda to validate the transactions. For backend processing, deploy the application on Amazon EKS Anywhere, running on on-premises servers in the company’s data center. Use a custom provisioning script to scale Kubernetes worker nodes based on transaction volume
- **(B)** Configure Amazon SQS to receive encrypted payment notifications from mobile devices. Use Amazon EventBridge rules to extract the payload and perform validation. Route the messages to a backend system hosted on Amazon Lightsail instances with dynamic scaling policies based on memory thresholds and instance health checks
- **(C)** Build a REST API using Amazon API Gateway. Integrate it with an AWS Step Functions state machine for validation. Launch the backend application using Amazon EKS with self-managed nodes, and use Kubernetes Jobs to handle transaction processing workflows. Manually scale the cluster based on demand
- **(D)** Expose an Amazon API Gateway REST API endpoint to receive transaction requests from mobile clients. Integrate the API with AWS Lambda to perform basic validation. For backend processing, deploy the long-running application to Amazon ECS using the Fargate launch type, allowing ECS to manage compute and memory provisioning automatically, with no server management required `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon API Gateway + AWS Lambda handles the secure endpoint and lightweight validation serverlessly, while Amazon ECS with AWS Fargate runs the long-running, compute/memory-intensive backend containers without any server or cluster node management.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- EKS with self-managed nodes and EKS Anywhere require heavy infrastructure/node management, and Lightsail/EventBridge do not fit enterprise-grade validation and auto-scaling container requirements.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-48"></div>

### Question 48: Decoupled Real-Time Gaming Leaderboards with Kinesis Data Streams & Lambda
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A gaming company is developing a mobile game that streams score updates to a backend processor and then publishes results on a leaderboard. The company has hired you as an AWS Certified Solutions Architect Associate to design a solution that can handle major traffic spikes, process the mobile game updates in the order of receipt, and store the processed updates in a highly available database. The company wants to minimize the management overhead required to maintain the solution.
Which of the following will you recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Push score updates to an Amazon Simple Notification Service (Amazon SNS) topic, subscribe an AWS Lambda function to this Amazon SNS topic to process the updates and then store these processed updates in a SQL database running on Amazon EC2 instance
- **(B)** Push score updates to Amazon Kinesis Data Streams which uses a fleet of Amazon EC2 instances (with Auto Scaling) to process the updates in Amazon Kinesis Data Streams and then store these processed updates in Amazon DynamoDB
- **(C)** Push score updates to Amazon Kinesis Data Streams which uses an AWS Lambda function to process these updates and then store these processed updates in Amazon DynamoDB `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Push score updates to an Amazon Simple Queue Service (Amazon SQS) queue which uses a fleet of Amazon EC2 instances (with Auto Scaling) to process these updates in the Amazon SQS queue and then store these processed updates in an Amazon RDS MySQL database

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Kinesis Data Streams (KDS) ingests real-time streaming data at massive scale while preserving record ordering. AWS Lambda integrates natively with KDS to process records serverlessly, and Amazon DynamoDB stores the processed results in a fully managed, highly available database with minimal management overhead.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- All other options use Amazon EC2 instances, which increase operational and management overhead.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-49"></div>

### Question 49: Compliance and Audit Trails for Healthcare Data using SSE-KMS Encryption
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A US-based healthcare startup is building an interactive diagnostic tool for COVID-19 related assessments. The users would be required to capture their personal health records via this tool. As this is sensitive health information, the backup of the user data must be kept encrypted in Amazon Simple Storage Service (Amazon S3). The startup does not want to provide its own encryption keys but still wants to maintain an audit trail of when an encryption key was used and by whom.
Which of the following is the BEST solution for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use client-side encryption with client provided keys and then upload the encrypted user data to Amazon S3
- **(B)** Use server-side encryption with Amazon S3 managed keys (SSE-S3) to encrypt the user data on Amazon S3
- **(C)** Use server-side encryption with AWS Key Management Service keys (SSE-KMS) to encrypt the user data on Amazon S3 `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use server-side encryption with customer-provided keys (SSE-C) to encrypt the user data on Amazon S3

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
SSE-KMS manages the encryption keys within AWS KMS (so the startup does not need to provide its own external keys) and integrates with AWS CloudTrail to provide a complete audit trail showing when the KMS key was used and by whom.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- SSE-S3: Does not provide an audit trail of key usage.
SSE-C and Client-side encryption with client-provided keys: Require the customer to provide and manage their own encryption keys, and do not provide a KMS key usage audit trail.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-50"></div>

### Question 50: Ultra-Fast Microsecond Leaderboards using Amazon ElastiCache for Redis
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D), (E) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
The engineering team at an in-home fitness company is evaluating multiple in-memory data stores with the ability to power its on-demand, live leaderboard. The company's leaderboard requires high availability, low latency, and real-time processing to deliver customizable user data for the community of users working out together virtually from the comfort of their home.
As a solutions architect, which of the following solutions would you recommend? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Power the on-demand, live leaderboard using Amazon RDS for Aurora as it meets the in-memory, high availability, low latency requirements
- **(B)** Power the on-demand, live leaderboard using Amazon DynamoDB as it meets the in-memory, high availability, low latency requirements
- **(C)** Power the on-demand, live leaderboard using Amazon Neptune as it meets the in-memory, high availability, low latency requirements
- **(D)** Power the on-demand, live leaderboard using Amazon ElastiCache for Redis as it meets the in-memory, high availability, low latency requirements `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Power the on-demand, live leaderboard using Amazon DynamoDB with DynamoDB Accelerator (DAX) as it meets the in-memory, high availability, low latency requirements `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon ElastiCache for Redis is a blazing-fast in-memory data store providing sub-millisecond latency and sorted sets ideal for real-time gaming/fitness leaderboards.
Amazon DynamoDB with DAX adds a native, highly available in-memory cache in front of DynamoDB for microsecond read latency.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon Aurora, standalone Amazon DynamoDB, and Amazon Neptune are disk/SSD-backed databases, not in-memory data stores.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-51"></div>

### Question 51: Resource Scope and Regional Isolation for EC2 Instances, AMIs, and EBS Snapshots
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The solo founder at a tech startup has just created a brand new AWS account. The founder has provisioned an Amazon EC2 instance 1A which is running in AWS Region A. Later, he takes a snapshot of the instance 1A and then creates a new Amazon Machine Image (AMI) in Region A from this snapshot. This AMI is then copied into another Region B. The founder provisions an instance 1B in Region B using this new AMI in Region B.
At this point in time, what entities exist in Region B?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** 1 Amazon EC2 instance, 1 AMI and 1 snapshot exist in Region B `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** 1 Amazon EC2 instance and 2 AMIs exist in Region B
- **(C)** 1 Amazon EC2 instance and 1 snapshot exist in Region B
- **(D)** 1 Amazon EC2 instance and 1 AMI exist in Region B

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
When an EBS-backed AMI is copied from Region A to Region B, AWS automatically copies the underlying EBS snapshot to Region B as well. After launching instance 1B from that AMI in Region B, 1 Amazon EC2 instance, 1 AMI, and 1 EBS snapshot exist in Region B.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-52"></div>

### Question 52: S3 Object Immutability and Accidental Deletion Protection via MFA Delete & Versioning
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (E) | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A healthcare startup needs to enforce compliance and regulatory guidelines for objects stored in Amazon S3. One of the key requirements is to provide adequate protection against accidental deletion of objects.
As a solutions architect, what are your recommendations to address these guidelines? (Select two) ?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Change the configuration on Amazon S3 console so that the user needs to provide additional confirmation while deleting any Amazon S3 object
- **(B)** Enable versioning on the Amazon S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create an event trigger on deleting any Amazon S3 object. The event invokes an Amazon Simple Notification Service (Amazon SNS) notification via email to the IT manager
- **(D)** Establish a process to get managerial approval for deleting Amazon S3 objects
- **(E)** Enable multi-factor authentication (MFA) delete on the Amazon S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
S3 Versioning preserves every version of every object in the bucket; deleting an object only inserts a delete marker, allowing previous versions to be restored.
MFA Delete requires additional authentication (an MFA code) to permanently delete an object version or suspend versioning on the bucket.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-53"></div>

### Question 53: OS-Level Database Customization and High Availability with Amazon RDS Custom for Oracle
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A healthcare company uses its on-premises infrastructure to run legacy applications that require specialized customizations to the underlying Oracle database as well as its host operating system (OS). The company also wants to improve the availability of the Oracle database layer. The company has hired you as an AWS Certified Solutions Architect – Associate to build a solution on AWS that meets these requirements while minimizing the underlying infrastructure maintenance effort.
Which of the following options represents the best solution for this use case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the Oracle database layer on multiple Amazon EC2 instances spread across two Availability Zones (AZs). This deployment configuration guarantees high availability and also allows the Database Administrator (DBA) to access and customize the database environment and the underlying operating system
- **(B)** Leverage multi-AZ configuration of Amazon RDS Custom for Oracle that allows the Database Administrator (DBA) to access and customize the database environment and the underlying operating system `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Leverage cross AZ read-replica configuration of Amazon RDS for Oracle that allows the Database Administrator (DBA) to access and customize the database environment and the underlying operating system
- **(D)** Leverage multi-AZ configuration of Amazon RDS for Oracle that allows the Database Administrator (DBA) to access and customize the database environment and the underlying operating system

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS Custom for Oracle is a managed database service that automates database administration tasks while still granting DBAs administrative access to the underlying database environment and host operating system (OS) for legacy customizations. Configuring it in Multi-AZ provides high availability.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Standard Amazon RDS for Oracle: Does not allow access to the underlying host OS.
Oracle on EC2: Requires full manual maintenance of the instances, OS patching, backups, and high-availability clustering.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-54"></div>

### Question 54: Dynamic EC2 Auto Scaling using Target Tracking Policy based on Average CPU
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The engineering team at a data analytics company has observed that its flagship application functions at its peak performance when the underlying Amazon Elastic Compute Cloud (Amazon EC2) instances have a CPU utilization of about 50%. The application is built on a fleet of Amazon EC2 instances managed under an Auto Scaling group. The workflow requests are handled by an internal Application Load Balancer that routes the requests to the instances.
As a solutions architect, what would you recommend so that the application runs near its peak performance state?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the Auto Scaling group to use target tracking policy and set the CPU utilization as the target metric with a target value of 50% `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure the Auto Scaling group to use simple scaling policy and set the CPU utilization as the target metric with a target value of 50%
- **(C)** Configure the Auto Scaling group to use step scaling policy and set the CPU utilization as the target metric with a target value of 50%
- **(D)** Configure the Auto Scaling group to use a Amazon Cloudwatch alarm triggered on a CPU utilization threshold of 50%

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A target tracking scaling policy lets you select a predefined metric (such as ASGAverageCPUUtilization) and set a target value (50%). Amazon EC2 Auto Scaling automatically creates and manages the CloudWatch alarms and scales capacity in or out to keep the average CPU utilization at or near 50%.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-55"></div>

### Question 55: Real-Time Fleet Telemetry Ingestion and Streaming Analytics with API Gateway & Kinesis
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A logistics company is building a multi-tier application to track the location of its trucks during peak operating hours. The company wants these data points to be accessible in real-time in its analytics platform via a REST API. The company has hired you as an AWS Certified Solutions Architect Associate to build a multi-tier solution to store and retrieve this location data for analysis.
Which of the following options addresses the given use case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Leverage Amazon API Gateway with AWS Lambda
- **(B)** Leverage Amazon API Gateway with Amazon Kinesis Data Analytics `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Leverage Amazon Athena with Amazon S3
- **(D)** Leverage Amazon QuickSight with Amazon Redshift

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon API Gateway can expose a REST API to ingest real-time truck location data and integrate with Amazon Kinesis Data Analytics (Managed Service for Apache Flink) to transform, store (up to 50 GB per KPU of running application storage), and query streaming data in real time.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Athena and QuickSight cannot build a REST API, and AWS Lambda is stateless compute that cannot store location data by itself.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-56"></div>

### Question 56: Secure Cross-Environment Delegation using IAM Roles and AssumeRole
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An organization wants to delegate access to a set of users from the development environment so that they can access some resources in the production environment which is managed under another AWS account.
As a solutions architect, which of the following steps would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new IAM role with the required permissions to access the resources in the production environment. The users can then assume this IAM role while accessing the resources from the production environment `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** It is not possible to access cross-account resources
- **(C)** Both IAM roles and IAM users can be used interchangeably for cross-account access
- **(D)** Create new IAM user credentials for the production environment and share these credentials with the set of users from the development environment

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
IAM roles allow you to delegate cross-account access so users in the development account can assume a role (sts:AssumeRole) in the production account to obtain temporary security credentials without creating duplicate IAM users or sharing long-term credentials.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-57"></div>

### Question 57: Auto Scaling Health Checks: Replacing Unhealthy EC2 Instances in Multi-AZ
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (A), (B)

#### 📋 Đề bài (Scenario)
The DevOps team at an e-commerce company has deployed a fleet of Amazon EC2 instances under an Auto Scaling group (ASG). The instances under the ASG span two Availability Zones (AZ) within the us-east-1 region. All the incoming requests are handled by an Application Load Balancer (ALB) that routes the requests to the Amazon EC2 instances under the Auto Scaling Group. As part of a test run, two instances (instance 1 and 2, belonging to AZ A) were manually terminated by the DevOps team causing the Availability Zones (AZ) to have unbalanced resources. Later that day, another instance (belonging to AZ B) was detected as unhealthy by the Application Load Balancer's health check.
Can you identify the correct outcomes for these events? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon EC2 Auto Scaling creates a new scaling activity for terminating the unhealthy instance and then terminates it. Later, another scaling activity launches a new instance to replace the terminated instance `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** As the resources are unbalanced in the Availability Zones, Amazon EC2 Auto Scaling will compensate by rebalancing the Availability Zones. When rebalancing, Amazon EC2 Auto Scaling launches new instances before terminating the old ones, so that rebalancing does not compromise the performance or availability of your application `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Amazon EC2 Auto Scaling creates a new scaling activity for launching a new instance to replace the unhealthy instance. Later, Amazon EC2 Auto Scaling creates a new scaling activity for terminating the unhealthy instance and then terminates it
- **(D)** Amazon EC2 Auto Scaling creates a new scaling activity to terminate the unhealthy instance and launch the new instance simultaneously
- **(E)** As the resources are unbalanced in the Availability Zones, Amazon EC2 Auto Scaling will compensate by rebalancing the Availability Zones. When rebalancing, Amazon EC2 Auto Scaling terminates old instances before launching new instances, so that rebalancing does not cause extra instances to be launched

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AZ Rebalancing: When an Auto Scaling group becomes unbalanced across AZs, Amazon EC2 Auto Scaling launches new instances before terminating the old ones so that rebalancing does not compromise application availability or performance.
Unhealthy Instance Replacement: When an instance fails health checks, Amazon EC2 Auto Scaling first terminates the unhealthy instance and then launches a new instance to replace it.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-58"></div>

### Question 58: Optimizing Global Gaming Traffic and Failover with AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A gaming company is looking at improving the availability and performance of its global flagship application which utilizes User Datagram Protocol and needs to support fast regional failover in case an AWS Region goes down. The company wants to continue using its own custom Domain Name System (DNS) service.
Which of the following AWS services represents the best solution for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon Route 53
- **(B)** AWS Global Accelerator `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Amazon CloudFront
- **(D)** AWS Elastic Load Balancing (ELB)

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Global Accelerator improves availability and performance over TCP and UDP by routing traffic through the AWS global network, providing two static Anycast IP addresses (which can be used with any custom DNS service) and deterministic, fast regional failover across AWS Regions.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon CloudFront: Supports HTTP/HTTPS content delivery, not UDP gaming traffic.
AWS ELB: Operates within a single AWS Region, not across multiple Regions.
Amazon Route 53: The company wants to continue using its own custom DNS service.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-59"></div>

### Question 59: Routing Multiple Microservices on a Single ALB using Path-Based Routing Rules
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
The development team at an e-commerce startup has set up multiple microservices running on Amazon EC2 instances under an Application Load Balancer. The team wants to route traffic to multiple back-end services based on the URL path of the HTTP header. So it wants requests for https://www.example.com/orders to go to a specific microservice and requests for https://www.example.com/products to go to another microservice.
Which of the following features of Application Load Balancers can be used for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** HTTP header-based routing
- **(B)** Host-based Routing
- **(C)** Query string parameter-based routing
- **(D)** Path-based Routing `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Path-based Routing on an Application Load Balancer routes client requests based on the URL path in the HTTP request (such as /orders vs /products).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Host-based routing: Routes based on the Host domain name (e.g., orders.example.com).
HTTP header-based routing: Routes based on standard or custom HTTP headers.
Query string parameter-based routing: Routes based on URL query parameters (e.g., ?id=123).

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-60"></div>

### Question 60: Layer 7 Web Exploitation Protection for Application Load Balancers via AWS WAF
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A media company runs a photo-sharing web application that is accessed across three different countries. The application is deployed on several Amazon Elastic Compute Cloud (Amazon EC2) instances running behind an Application Load Balancer. With new government regulations, the company has been asked to block access from two countries and allow access only from the home country of the company.
Which configuration should be used to meet this changed requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the security group on the Application Load Balancer
- **(B)** Configure AWS Web Application Firewall (AWS WAF) on the Application Load Balancer in a Amazon Virtual Private Cloud (Amazon VPC) `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Geo Restriction feature of Amazon CloudFront in a Amazon Virtual Private Cloud (Amazon VPC)
- **(D)** Configure the security group for the Amazon EC2 instances

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS WAF can be attached directly to an Application Load Balancer (in a VPC) and configured with Geographic (Geo) Match Conditions to block or allow web requests based on the country of origin.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- CloudFront in a VPC: Amazon CloudFront is a global edge service and does not reside inside a VPC.
Security groups: Cannot restrict traffic based on geographic country codes.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-61"></div>

### Question 61: Database Migration to Aurora PostgreSQL using AWS DMS and AWS SCT
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (B), (C)

#### 📋 Đề bài (Scenario)
A retail company runs a customer management system backed by a Microsoft SQL Server database. The system is tightly integrated with applications that rely on T-SQL queries. The company wants to modernize its infrastructure by migrating to Amazon Aurora PostgreSQL, but it needs to avoid major modifications to the existing application logic.
Which combination of actions should the company take to achieve this goal with minimal application refactoring? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Aurora Global Database to replicate data across regions for compatibility
- **(B)** Use AWS Schema Conversion Tool (AWS SCT) along with AWS Database Migration Service (AWS DMS) to migrate the schema and data `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Deploy Babelfish for Aurora PostgreSQL to enable support for T-SQL commands `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Configure Amazon Aurora PostgreSQL with a custom endpoint that emulates Microsoft SQL Server behavior
- **(E)** Use AWS Glue to convert T-SQL queries to PostgreSQL-compatible SQL during the migration

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Babelfish for Aurora PostgreSQL enables Aurora PostgreSQL to understand Microsoft SQL Server's proprietary T-SQL language and Tabular Data Stream (TDS) wire protocol, minimizing application code changes.
AWS SCT and AWS DMS convert the database schema and migrate the data from Microsoft SQL Server to Amazon Aurora PostgreSQL.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-62"></div>

### Question 62: Fault-Tolerant Batch Workload Cost Minimization with EC2 Spot Instances
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs a data processing workflow that takes about 60 minutes to complete. The workflow can withstand disruptions and it can be started and stopped multiple times.
Which is the most cost-effective solution to build a solution for the workflow?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EC2 reserved instances to run the workflow processes
- **(B)** Use Amazon EC2 spot instances to run the workflow processes `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use AWS Lambda function to run the workflow processes
- **(D)** Use Amazon EC2 on-demand instances to run the workflow processes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EC2 Spot Instances offer up to 90% discount compared to On-Demand pricing and are ideal for fault-tolerant workloads that can withstand interruptions and be started/stopped multiple times.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- AWS Lambda: Has a maximum execution timeout of 15 minutes (60 minutes exceeds this limit) and costs more per hour for continuous compute than Spot instances.
On-Demand / Reserved Instances: More expensive than Spot instances, and Reserved Instances require a 1- or 3-year commitment.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-63"></div>

### Question 63: AWS Account Root User Best Practices: Strong Password and MFA Activation
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
An IT consultant is helping the owner of a medium-sized business set up an AWS account. What are the security recommendations he must follow while creating the AWS account root user? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Encrypt the access keys and save them on Amazon S3
- **(B)** Send an email to the business owner with details of the login username and password for the AWS root user. This will help the business owner to troubleshoot any login issues in future
- **(C)** Create a strong password for the AWS account root user `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create AWS account root user access keys and share those keys only with the business owner
- **(E)** Enable Multi Factor Authentication (MFA) for the AWS account root user account `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS security best practices for the root user include using a strong password and enabling Multi-Factor Authentication (MFA) on the root user account.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- You should never create root user access keys (or delete them if they exist) and never share root credentials via email or with others.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-64"></div>

### Question 64: Enterprise Windows DFS Migration to Fully Managed Amazon FSx for Windows File Server
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A large financial institution operates an on-premises data center with hundreds of petabytes of data managed on Microsoft’s Distributed File System (DFS). The CTO wants the organization to transition into a hybrid cloud environment and run data-intensive analytics workloads that support DFS.
Which of the following AWS services can facilitate the migration of these workloads?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD)
- **(B)** Microsoft SQL Server on AWS
- **(C)** Amazon FSx for Lustre
- **(D)** Amazon FSx for Windows File Server `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for Windows File Server provides fully managed Windows Server file storage over SMB and natively supports Microsoft's Distributed File System (DFS) namespaces and replication to organize file shares up to hundreds of petabytes in size.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-65"></div>

### Question 65: On-Premises Modernized Kubernetes Stack with AWS APIs using AWS Outposts & EKS Anywhere
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A financial services company operates a containerized microservices architecture using Kubernetes in its on-premises data center. Due to strict industry regulations and internal security policies, all application data and workloads must remain physically within the on-premises environment. The company’s infrastructure team wants to modernize its Kubernetes stack and take advantage of AWS-managed services and APIs, including automated Kubernetes upgrades, Amazon CloudWatch integration, and access to AWS IAM features — but without migrating any data or compute resources to the cloud.
Which AWS solution will best meet the company’s requirements for modernization while ensuring that all data remains on premises?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a dedicated AWS Direct Connect connection between the on-premises environment and an AWS Region. Deploy Amazon EKS in the cloud and connect it to the local Kubernetes cluster. Use IAM roles and API Gateway to integrate authentication and traffic flow for hybrid workloads
- **(B)** Install an AWS Outposts rack in the company’s data center. Use Amazon EKS Anywhere on Outposts to run containerized workloads locally while integrating with AWS APIs `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use an AWS Snowball Edge Compute Optimized device to run EKS-compatible Docker containers on-site. Periodically export application logs and container snapshots to Amazon S3 using Snowball’s offline data transfer features. Use the Snowball console to orchestrate workloads in batches
- **(D)** Deploy Amazon ECS with Fargate in a nearby AWS Local Zone. Use CloudWatch Logs to forward events to the primary region. Connect the Local Zone to the company’s data center over a VPN. Configure containers to pull data from on-premises storage through a mounted file share

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Installing an AWS Outposts rack physically inside the company's on-premises data center and running Amazon EKS (or EKS Anywhere / local clusters on Outposts) allows the company to keep all workloads and application data physically on premises while leveraging native AWS APIs, IAM, and CloudWatch integration.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Direct Connect + EKS in the cloud: Violates the requirement to keep all compute and data physically on premises.
ECS in an AWS Local Zone: AWS Local Zones are AWS-managed metro facilities outside the customer's physical data center.
AWS Snowball Edge: Designed for edge/offline data migration and temporary edge computing, not permanent enterprise Kubernetes clusters.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

