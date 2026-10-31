# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Practice Exam 3

> **Khóa học tham chiếu**: Ultimate AWS Certified Solutions Architect Associate (SAA-C03) - Stephane Maarek  
> **Bộ đề**: Practice Exam 3 (Full Exam Simulation - 65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 cÃ¢u | HoÃ n thÃ nh 100% |
| **Số câu trả lời đúng (Correct Answers)** | **65 câu** | $\ge 47$ cÃ¢u (72%) | Äáº¡t tiÃªu chuáº©n âœ… |
| **Số câu trả lời sai (Incorrect Answers)** | **0 câu** | $\le 18$ cÃ¢u | KhÃ´ng cÃ³ cÃ¢u sai ðŸŒŸ |
| **Tỷ lệ chính xác (Overall Score)** | **100% (~1000 / 1000)** | $\ge 72.0\%$ (720 / 1000) | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |
| **Thời gian thi tiêu chuẩn** | **130 phút** | 130 phút *(160 phút nếu có ESL +30)* | Đạt tiến độ thời gian |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 19 câu | 19 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 13 câu | 13 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 25 câu | 25 câu | 0 câu | **100%** | Xuất sắc 🟢 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 8 câu | 8 câu | 0 câu | **100%** | Xuất sắc 🟢 |
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
| [01](#question-01) | ✅ Đúng | [Amazon Machine Image (AMI) Capabilities: Cross-Region Copy and Account Sharing](#question-01) | Domain 1 |
| [02](#question-02) | ✅ Đúng | [Migrating from Amazon SQS Standard to SQS FIFO Queues with Batching](#question-02) | Domain 2 |
| [03](#question-03) | ✅ Đúng | [Restricting CloudFront Static S3 Website Access to Specific Supplier IP Ranges with WAF & OAI](#question-03) | Domain 1 |
| [04](#question-04) | ✅ Đúng | [High-Throughput Windows File Storage with Amazon FSx for Windows File Server](#question-04) | Domain 3 |
| [05](#question-05) | ✅ Đúng | [Serverless Containerized Risk Analytics with Amazon ECS Fargate and EFS Storage](#question-05) | Domain 3 |
| [06](#question-06) | ✅ Đúng | [Eliminating Empty SQS Responses and Minimizing Costs using SQS Long Polling](#question-06) | Domain 4 |
| [07](#question-07) | ✅ Đúng | [Inheritance Rules for Launch Template Tenancy vs VPC Tenancy in EC2](#question-07) | Domain 3 |
| [08](#question-08) | ✅ Đúng | [Monetizing and Rate-Limiting Partner API Invocations with API Gateway Usage Plans](#question-08) | Domain 3 |
| [09](#question-09) | ✅ Đúng | [Securing Serverless Microservices with API Gateway HTTP API and JWT Authorizers](#question-09) | Domain 3 |
| [10](#question-10) | ✅ Đúng | [Accelerating Low-Latency UDP Proprietary Gaming Traffic via AWS Global Accelerator](#question-10) | Domain 3 |
| [11](#question-11) | ✅ Đúng | [Resolving Availability Zone Name Mapping Differences using Availability Zone IDs (AZ IDs)](#question-11) | Domain 3 |
| [12](#question-12) | ✅ Đúng | [Global Acceleration for S3 Static Website using S3 Transfer Acceleration](#question-12) | Domain 3 |
| [13](#question-13) | ✅ Đúng | [Private In-VPC SQS Access Without Traversing Public Internet via VPC Endpoints](#question-13) | Domain 1 |
| [14](#question-14) | ✅ Đúng | [Ultra High-Performance Sub-Millisecond Database Storage with Provisioned IOPS SSD (io1)](#question-14) | Domain 3 |
| [15](#question-15) | ✅ Đúng | [EC2 Spot Request Lifecycle: Canceling Spot Requests vs Running Spot Instances](#question-15) | Domain 4 |
| [16](#question-16) | ✅ Đúng | [Enforcing Regulatory S3 Server-Side Encryption with Customer-Provided Keys (SSE-C)](#question-16) | Domain 1 |
| [17](#question-17) | ✅ Đúng | [VPC Security Group Rules: Disallowed Sources and Custom Destination IP Restrictions](#question-17) | Domain 1 |
| [18](#question-18) | ✅ Đúng | [High-Performance NetApp ONTAP Cloud Migration using Amazon FSx for NetApp ONTAP](#question-18) | Domain 1 |
| [19](#question-19) | ✅ Đúng | [Real-Time Streaming Log Ingestion and Dynamic Multi-AZ Scaling with Kinesis Data Streams](#question-19) | Domain 2 |
| [20](#question-20) | ✅ Đúng | [High-Availability Multi-AZ Architecture with Dedicated NAT Gateways per AZ](#question-20) | Domain 1 |
| [21](#question-21) | ✅ Đúng | [Centralized Multi-Account Networking Governance with VPC Sharing via AWS RAM](#question-21) | Domain 1 |
| [22](#question-22) | ✅ Đúng | [Auto Scaling Dynamic Backlog Scaling based on Custom SQS Queue Length Metric](#question-22) | Domain 1 |
| [23](#question-23) | ✅ Đúng | [Traffic Routing Behavior for Secondary Private IP Addresses on Elastic Network Interfaces (ENI)](#question-23) | Domain 3 |
| [24](#question-24) | ✅ Đúng | [Service Control Policy (SCP) Scope and Restrictions on AWS Service-Linked Roles](#question-24) | Domain 1 |
| [25](#question-25) | ✅ Đúng | [Restricting S3 Access to Private EC2 Instances via Gateway VPC Endpoints & Endpoint Policies](#question-25) | Domain 4 |
| [26](#question-26) | ✅ Đúng | [Dynamic Autoscaling for Amazon ECS Tasks based on Target Tracking Utilization Metrics](#question-26) | Domain 3 |
| [27](#question-27) | ✅ Đúng | [Amazon CloudWatch EC2 Auto-Recovery Characteristics: Preserving IP, Metadata, and Storage](#question-27) | Domain 2 |
| [28](#question-28) | ✅ Đúng | [Accelerating Global Game Asset Downloads with Amazon CloudFront and S3 Origin](#question-28) | Domain 3 |
| [29](#question-29) | ✅ Đúng | [Stateful vs Stateless Traffic Filtering: Security Groups vs Network Access Control Lists (NACL)](#question-29) | Domain 1 |
| [30](#question-30) | ✅ Đúng | [Automated Multi-Account CloudFormation Template Deployment using CloudFormation StackSets](#question-30) | Domain 3 |
| [31](#question-31) | ✅ Đúng | [Hybrid Multi-VPC Routing via AWS Direct Connect Transit VIF and Transit Gateway](#question-31) | Domain 1 |
| [32](#question-32) | ✅ Đúng | [Decoupling Large File Uploads from Asynchronous Thumbnail Processing via S3 Events and SQS](#question-32) | Domain 2 |
| [33](#question-33) | ✅ Đúng | [Cost-Effective Predictable Access Storage Tiering using Amazon S3 Standard-IA](#question-33) | Domain 3 |
| [34](#question-34) | ✅ Đúng | [Managing Active Directory Workloads with AWS Directory Service for Microsoft AD](#question-34) | Domain 1 |
| [35](#question-35) | ✅ Đúng | [Sub-Millisecond In-Memory Caching for Real-Time Gaming Leaderboards using ElastiCache Redis](#question-35) | Domain 3 |
| [36](#question-36) | ✅ Đúng | [Secure Hybrid IPsec VPN Connection using Virtual Private Gateway (VGW) and Customer Gateway](#question-36) | Domain 1 |
| [37](#question-37) | ✅ Đúng | [Proactive Enterprise DDoS Mitigation and 24/7 Response Team with AWS Shield Advanced](#question-37) | Domain 1 |
| [38](#question-38) | ✅ Đúng | [Shared POSIX Multi-User Storage for Windows Workloads using FSx for Windows File Server](#question-38) | Domain 2 |
| [39](#question-39) | ✅ Đúng | [Elastic Load Balancing (ELB) Cross-Zone Load Balancing Traffic Distribution Mechanics](#question-39) | Domain 2 |
| [40](#question-40) | ✅ Đúng | [Restricting S3 Public Access and Caching Static Training Assets with CloudFront OAI](#question-40) | Domain 4 |
| [41](#question-41) | ✅ Đúng | [Automated Monolithic EC2 Instance Recovery with CloudWatch System Status Alarms](#question-41) | Domain 2 |
| [42](#question-42) | ✅ Đúng | [Automated PII Discovery and Data Privacy Auditing in Amazon S3 using Amazon Macie](#question-42) | Domain 1 |
| [43](#question-43) | ✅ Đúng | [Serverless Containerized Python Microservices with AWS Lambda and Amazon API Gateway](#question-43) | Domain 3 |
| [44](#question-44) | ✅ Đúng | [DNS Routing for Naked/Apex Domain Names to ALB using Route 53 Alias Records](#question-44) | Domain 4 |
| [45](#question-45) | ✅ Đúng | [DNS Canonical Name (CNAME) vs Alias Records for Subdomain Routing](#question-45) | Domain 4 |
| [46](#question-46) | ✅ Đúng | [Automated Scheduled EC2 AMI Backup Pipelines via EventBridge and AWS Lambda](#question-46) | Domain 4 |
| [47](#question-47) | ✅ Đúng | [Automated Systems Manager Agent (SSM Agent) Fleet Management via Default Host Configuration](#question-47) | Domain 2 |
| [48](#question-48) | ✅ Đúng | [Decoupling Monolithic Ordering Services with Amazon SQS Standard Queues](#question-48) | Domain 2 |
| [49](#question-49) | ✅ Đúng | [Multi-Region Anycast IP Routing and Failover using AWS Global Accelerator](#question-49) | Domain 3 |
| [50](#question-50) | ✅ Đúng | [Serverless Web Tier Migration using Amazon S3, AWS Lambda, and DynamoDB](#question-50) | Domain 3 |
| [51](#question-51) | ✅ Đúng | [High Availability Relational Database Tiering with Amazon RDS MySQL Multi-AZ Deployment](#question-51) | Domain 2 |
| [52](#question-52) | ✅ Đúng | [Private Multi-AZ SFTP File Exchange Service using AWS Transfer Family and VPC Endpoints](#question-52) | Domain 3 |
| [53](#question-53) | ✅ Đúng | [Real-Time Patient Vitals Ingestion and Transformation with Kinesis Data Firehose](#question-53) | Domain 2 |
| [54](#question-54) | ✅ Đúng | [Enterprise Windows Active Directory Single Sign-On with AWS Managed Microsoft AD](#question-54) | Domain 3 |
| [55](#question-55) | ✅ Đúng | [Public Subnet Bastion Host and Security Group Reference Architecture in Amazon VPC](#question-55) | Domain 3 |
| [56](#question-56) | ✅ Đúng | [Offloading Reporting Workloads from Primary Database to Amazon RDS Read Replicas](#question-56) | Domain 3 |
| [57](#question-57) | ✅ Đúng | [Hybrid File Storage and Server Migration with AWS Storage Gateway File Gateway and FSx](#question-57) | Domain 2 |
| [58](#question-58) | ✅ Đúng | [Zero-Downtime Database Migration from RDS MySQL to Aurora MySQL via Aurora Read Replicas](#question-58) | Domain 3 |
| [59](#question-59) | ✅ Đúng | [Enabling Outbound-Only Internet Access for Private Subnets using Amazon VPC NAT Gateway](#question-59) | Domain 1 |
| [60](#question-60) | ✅ Đúng | [Hybrid On-Premises File Storage Caching with AWS Storage Gateway Cached Volumes](#question-60) | Domain 3 |
| [61](#question-61) | ✅ Đúng | [Heterogeneous Database Migration to Amazon Aurora using AWS SCT and AWS DMS](#question-61) | Domain 4 |
| [62](#question-62) | ✅ Đúng | [Automated Accelerated Online Data Migration to Amazon S3 using AWS DataSync](#question-62) | Domain 3 |
| [63](#question-63) | ✅ Đúng | [Hybrid Bi-Directional DNS Resolution with Amazon Route 53 Resolver Inbound & Outbound Endpoints](#question-63) | Domain 1 |
| [64](#question-64) | ✅ Đúng | [Enabling Internet Connectivity for Custom VPCs via Internet Gateway (IGW) and Route Tables](#question-64) | Domain 2 |
| [65](#question-65) | ✅ Đúng | [Continuous Compliance Auditing and Drift Detection using AWS Config Managed Rules](#question-65) | Domain 1 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: Amazon Machine Image (AMI) Capabilities: Cross-Region Copy and Account Sharing
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (D), (F) | **Đáp án đúng**: (A), (D), (F)

#### 📋 Đề bài (Scenario)
The DevOps team at a multi-national company is helping its subsidiaries standardize Amazon EC2 instances by using the same Amazon Machine Image (AMI). Some of these subsidiaries are in the same AWS region but use different AWS accounts whereas others are in different AWS regions but use the same AWS account as the parent company. The DevOps team has hired you as a solutions architect for this project.

Which of the following would you identify as CORRECT regarding the capabilities of an Amazon Machine Image (AMI)? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot cannot result in an unencrypted target snapshot `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot results in an unencrypted target snapshot
- **(C)** You cannot share an Amazon Machine Image (AMI) with another AWS account
- **(D)** You can copy an Amazon Machine Image (AMI) across AWS Regions `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** You cannot copy an Amazon Machine Image (AMI) across AWS Regions
- **(F)** You can share an Amazon Machine Image (AMI) with another AWS account `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (D), (F)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
An Amazon Machine Image (AMI) provides the information required to launch an instance. An AMI includes the following:
One or more Amazon EBS snapshots, or, for instance-store-backed AMIs, a template for the root volume of the instance.
Launch permissions that control which AWS accounts can use the AMI to launch instances.
A block device mapping that specifies the volumes to attach to the instance when it's launched.
You can copy an AMI within or across AWS Regions using the AWS Management Console, the AWS Command Line Interface or SDKs, or the Amazon EC2 API, all of which support the CopyImage action. You can copy both Amazon EBS-backed AMIs and instance-store-backed AMIs. You can copy AMIs with encrypted snapshots and also change encryption status during the copy process. Therefore, the option - "You can copy an AMI across AWS Regions" - is correct.
While it is possible to copy an unencrypted snapshot to yield an encrypted snapshot, you cannot copy an encrypted snapshot to yield an unencrypted one. Therefore, the option - "Copying an AMI backed by an encrypted snapshot cannot result in an unencrypted target snapshot" is correct.
You can share an AMI with another AWS account. To copy an AMI that was shared with you from another account, the owner of the source AMI must grant you read permissions for the storage that backs the AMI, either the associated Amazon EBS snapshot (for an Amazon EBS-backed AMI) or an associated S3 bucket (for an instance store-backed AMI). Therefore, the option - "You can share an AMI with another AWS account" - is correct.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- You cannot copy an Amazon Machine Image (AMI) across AWS Regions

- You cannot share an Amazon Machine Image (AMI) with another AWS account

- Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot results in an unencrypted target snapshot These three options contradict the details provided in the explanation above.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - CopyingAMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html)

</details>

---

<div id="question-02"></div>

### Question 02: Migrating from Amazon SQS Standard to SQS FIFO Queues with Batching
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (D), (E) | **Đáp án đúng**: (C), (D), (E)

#### 📋 Đề bài (Scenario)
The engineering team at an e-commerce company wants to migrate from Amazon Simple Queue Service (Amazon SQS) Standard queues to FIFO (First-In-First-Out) queues with batching.

As a solutions architect, which of the following steps would you have in the migration checklist? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Convert the existing standard queue into a FIFO (First-In-First-Out) queue
- **(B)** Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 300 messages per second
- **(C)** Delete the existing standard queue and recreate it as a FIFO (First-In-First-Out) queue `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Make sure that the name of the FIFO (First-In-First-Out) queue ends with the .fifo suffix `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 3,000 messages per second `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** Make sure that the name of the FIFO (First-In-First-Out) queue is the same as the standard queue

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. Amazon SQS eliminates the complexity and overhead associated with managing and operating message oriented middleware, and empowers developers to focus on differentiating work. Using Amazon SQS, you can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available.
Amazon SQS offers two types of message queues. Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery. SQS FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent.
By default, FIFO queues support up to 3,000 messages per second with batching, or up to 300 messages per second (300 send, receive, or delete operations per second) without batching. Therefore, using batching you can meet a throughput requirement of upto 3,000 messages per second.
The name of a FIFO queue must end with the .fifo suffix. The suffix counts towards the 80-character queue name limit. To determine whether a queue is FIFO, you can check whether the queue name ends with the suffix.
If you have an existing application that uses standard queues and you want to take advantage of the ordering or exactly-once processing features of FIFO queues, you need to configure the queue and your application correctly. You can't convert an existing standard queue into a FIFO queue. To make the move, you must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Convert the existing standard queue into a FIFO (First-In-First-Out) queue

- **Make sure that the name of the FIFO (First-In-First-Out) queue is the same as the standard queue**:
  The name of a FIFO queue must end with the .fifo suffix.

- **Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 300 messages per second**:
  By default, FIFO queues support up to 3,000 messages per second with batching.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: sqs](https://aws.amazon.com/sqs/faqs/)
- 🌐 [AWS Docs: AWSSimpleQueueService - FIFO queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html)

</details>

---

<div id="question-03"></div>

### Question 03: Restricting CloudFront Static S3 Website Access to Specific Supplier IP Ranges with WAF & OAI
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
The engineering team at a company is moving the static content from the company's logistics website hosted on Amazon EC2 instances to an Amazon S3 bucket. The team wants to use an Amazon CloudFront distribution to deliver the static content. The security group used by the Amazon EC2 instances allows the website to be accessed by a limited set of IP ranges from the company's suppliers. Post-migration to Amazon CloudFront, access to the static content should only be allowed from the aforementioned IP addresses.

Which options would you combine to build a solution to meet these requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new NACL that allows traffic from the same IPs as specified in the current Amazon EC2 security group. Associate this new NACL with the Amazon CloudFront distribution
- **(B)** Create an AWS Web Application Firewall (AWS WAF) ACL and use an IP match condition to allow traffic only from those IPs that are allowed in the Amazon EC2 security group. Associate this new AWS WAF ACL with the Amazon S3 bucket policy
- **(C)** Configure an origin access identity (OAI) and associate it with the Amazon CloudFront distribution. Set up the permissions in the Amazon S3 bucket policy so that only the OAI can read the objects `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a new security group that allows traffic from the same IPs as specified in the current Amazon EC2 security group. Associate this new security group with the Amazon CloudFront distribution
- **(E)** Create an AWS WAF ACL and use an IP match condition to allow traffic only from those IPs that are allowed in the Amazon EC2 security group. Associate this new AWS WAF ACL with the Amazon CloudFront distribution `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
When you use Amazon CloudFront with an Amazon S3 bucket as the origin, you can configure Amazon CloudFront and Amazon S3 in a way that provides the following benefits:
Restricts access to the Amazon S3 bucket so that it's not publicly accessible
Makes sure that viewers (users) can access the content in the bucket only through the specified Amazon CloudFront distribution—that is, prevents them from accessing the content directly from the bucket, or through an unintended CloudFront distribution.
To do this, configure Amazon CloudFront to send authenticated requests to Amazon S3, and configure Amazon S3 to only allow access to authenticated requests from Amazon CloudFront. Amazon CloudFront provides two ways to send authenticated requests to an Amazon S3 origin: origin access control (OAC) and origin access identity (OAI).
Exam Alert: Please note that AWS recommends using OAC because it supports:
All Amazon S3 buckets in all AWS Regions, including opt-in Regions launched after December 2022
Amazon S3 server-side encryption with AWS KMS (SSE-KMS)
Dynamic requests (POST, PUT, etc.) to Amazon S3 OAI doesn't work for the scenarios in the preceding list, or it requires extra workarounds in those scenarios. However, you will continue to see answers enlisting OAI as the preferred option in the actual exam as it takes about 6 months/1 year for a new feature to appear in the exam.
AWS WAF is a web application firewall that lets you monitor the HTTP and HTTPS requests that are forwarded to your protected web application resources. You can protect the following resource types:
Amazon CloudFront distribution
Amazon API Gateway REST API
Application Load Balancer
AWS AppSync GraphQL API
Amazon Cognito user pool
AWS WAF also lets you control access to your content. Based on conditions that you specify, such as the IP addresses that requests originate from or the values of query strings, your protected resource responds to requests either with the requested content, with an HTTP 403 status code (Forbidden), or with a custom response.
If you want to allow or block web requests based on the IP addresses that the requests originate from, create one or more IP match conditions via your AWS WAF. An IP match condition lists up to 10,000 IP addresses or IP address ranges that your requests originate from. For the given use case, you should add those IP addresses that are allowed in the Amazon EC2 security group into the IP match condition.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS Web Application Firewall (AWS WAF) ACL and use an IP match condition to allow traffic only from those IPs that are allowed in the Amazon EC2 security group. Associate this new AWS WAF ACL with the Amazon S3 bucket policy**:
  You cannot associate an AWS WAF ACL with an Amazon S3 bucket policy.

- **Create a new NACL that allows traffic from the same IPs as specified in the current Amazon EC2 security group. Associate this new NACL with the Amazon CloudFront distribution**:
  NACL is associated with a subnet within a VPC. Amazon CloudFront delivers your content through a worldwide network of data centers called edge locations. So a NACL cannot be associated with a Amazon CloudFront distribution.

- **Create a new security group that allows traffic from the same IPs as specified in the current Amazon EC2 security group. Associate this new security group with the Amazon CloudFront distribution**:
  A security group acts as a virtual firewall for your Amazon EC2 instances to control incoming and outgoing traffic. Inbound rules control the incoming traffic to your instance, and outbound rules control the outgoing traffic from your instance. Amazon CloudFront delivers your content through a worldwide network of data centers called edge locations. So a security group cannot be associated with Amazon CloudFront distribution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudFront - private content restricting access to s3](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)
- 🌐 [AWS Docs: waf - what is aws waf](https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html)
- 🌐 [AWS Docs: waf - classic web acl ip conditions](https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-ip-conditions.html)

</details>

---

<div id="question-04"></div>

### Question 04: High-Throughput Windows File Storage with Amazon FSx for Windows File Server
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial services company is modernizing its analytics platform on AWS. Their legacy data processing scripts, built for both Windows and Linux environments, require shared access to a file system that supports Windows ACLs and SMB protocol for compatibility with existing Windows workloads. At the same time, their Linux-based applications need to read from and write to the same shared storage to maintain cross-platform consistency. The solutions architect needs to design a storage solution that allows both Windows and Linux EC2 instances to access the shared file system simultaneously, while preserving Windows-specific features like NTFS permissions and Active Directory (AD) integration.

Which solution will best meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon FSx for Windows File Server and mount it using the SMB protocol from both Windows and Linux EC2 instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy Amazon FSx for Lustre and mount the file system using a POSIX-compliant client from both platforms
- **(C)** Use Amazon EFS with the Standard storage class and mount the file system using NFS from both Windows and Linux instances
- **(D)** Create an S3 bucket and mount it on EC2 instances using Mountpoint for Amazon S3, managing access through IAM policies to support both Windows and Linux workloads

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for Windows File Server is the best choice for enabling shared file access between both Windows and Linux EC2 instances while preserving Windows-native features like SMB protocol support, NTFS file system permissions, and Active Directory (AD) integration. Windows instances can seamlessly mount the file system using SMB, and Linux instances can also connect using SMB clients (e.g., via cifs-utils). This allows Linux applications to access and interact with the same file system used by Windows applications, maintaining consistent permissions and supporting cross-platform collaboration. FSx for Windows is purpose-built for such hybrid environments, making it a fully managed and feature-rich solution that aligns with enterprise-grade security and interoperability requirements.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EFS with the Standard storage class and mount the file system using NFS from both Windows and Linux instances**:
  Amazon EFS is a POSIX-compliant file system that uses the NFS protocol, which is not natively supported by Windows. While EFS works well for Linux-based workloads, it cannot be accessed by Windows EC2 instances without complex workarounds or third-party tools. Additionally, EFS does not support Windows-specific features like NTFS permissions, SMB, or Active Directory integration, making it unsuitable for hybrid Windows-Linux environments that need shared access and Windows ACLs.

- **Deploy Amazon FSx for Lustre and mount the file system using a POSIX-compliant client from both platforms**:
  Amazon FSx for Lustre is optimized for high-performance computing (HPC) and throughput-heavy workloads, particularly for integration with S3. It supports POSIX-compliant access via Lustre clients, which are compatible with Linux, but not natively supported on Windows. It lacks Windows ACLs, SMB support, and Active Directory integration, making it unsuitable for mixed environments where Windows compatibility is essential.

- **Create an S3 bucket and mount it on EC2 instances using Mountpoint for Amazon S3, managing access through IAM policies to support both Windows and Linux workloads**:
  Although Mountpoint for Amazon S3 is an AWS-supported open-source tool that allows Linux EC2 instances to access S3 buckets via a file system interface, it is not a shared file system and does not support Windows clients. It lacks features such as file locking, concurrent file access control, and NTFS permissions, which are essential for shared access across platforms. Additionally, S3 is object storage, not a POSIX-compliant file system or SMB-compatible storage layer, making it unsuitable for use cases that involve cross-platform file sharing and Windows ACLs.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: access file shares on amazon fsx for windows file server from a linux environment](https://aws.amazon.com/blogs/storage/access-file-shares-on-amazon-fsx-for-windows-file-server-from-a-linux-environment/)
- 🌐 [AWS Docs: fsx - what is](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/features/mountpoint/)
- 🌐 [AWS Docs: fsx - what is](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)

</details>

---

<div id="question-05"></div>

### Question 05: Serverless Containerized Risk Analytics with Amazon ECS Fargate and EFS Storage
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A financial services firm runs a containerized risk analytics tool in its on-premises data center using Docker. The tool depends on persistent data storage for maintaining customer simulation results and operates on a single host machine where the volume is locally mounted. The infrastructure team is looking to replatform the tool to AWS using a fully managed service because they want to avoid managing EC2 instances, volumes, or underlying servers.

Which AWS solution best meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EKS with managed node groups. Provision an Amazon EBS volume and mount it inside the container by creating a Kubernetes persistent volume and claim. Manage storage lifecycle manually
- **(B)** Use Amazon ECS with Fargate launch type. Attach an Amazon S3 bucket using a shared access script that mounts the S3 bucket into the container for data storage
- **(C)** Use Amazon ECS with Fargate launch type. Provision an Amazon Elastic File System (Amazon EFS) file system. Mount the EFS volume inside the container at runtime to provide persistent storage access `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use AWS Lambda with a container image runtime. Store stateful data in temporary local storage (/tmp) and sync with Amazon S3 periodically

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
This is the most suitable and fully managed solution. ECS with Fargate allows you to run containers without managing EC2 infrastructure, and it integrates natively with Amazon EFS to support persistent, shared storage for stateful applications. You define the EFS volume in the task definition and mount it to the container, allowing multiple tasks to access shared data. This setup requires no server or storage lifecycle management and aligns perfectly with the company's requirements.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EKS with managed node groups. Provision an Amazon EBS volume and mount it inside the container by creating a Kubernetes persistent volume and claim. Manage storage lifecycle manually**:
  Although EKS supports Kubernetes-native persistent storage with EBS volumes, this approach still requires provisioning and managing EC2 instances and storage volumes, which contradicts the requirement to avoid managing infrastructure.

- **Use Amazon ECS with Fargate launch type. Attach an Amazon S3 bucket using a shared access script that mounts the S3 bucket into the container for data storage**:
  Amazon S3 is object storage, not a block or file system, and cannot be mounted directly into a container like a file system volume. While applications can access S3 via API, this does not fulfill the requirement for a persistent storage volume that functions like a mounted file system.

- **Use AWS Lambda with a container image runtime. Store stateful data in temporary local storage (/tmp) and sync with Amazon S3 periodically**:
  AWS Lambda supports custom container images and provides ephemeral /tmp storage during execution, but this storage is limited in size (512 MB) and not persistent across invocations. Syncing to S3 would require custom logic, and this setup is inappropriate for long-running or stateful microservices. Lambda is best suited for stateless, event-driven functions, not for applications requiring mounted persistent volumes.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonECS - efs volumes](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html)
- 🌐 [AWS Architecture Blog: developers guide to using amazon efs with amazon ecs and aws fargate part 1](https://aws.amazon.com/blogs/containers/developers-guide-to-using-amazon-efs-with-amazon-ecs-and-aws-fargate-part-1/)
- 🌐 [AWS Docs: eks - managed node groups](https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html)
- 🌐 [AWS Docs: lambda - lambda runtime environment](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtime-environment.html)

</details>

---

<div id="question-06"></div>

### Question 06: Eliminating Empty SQS Responses and Minimizing Costs using SQS Long Polling
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial services company is migrating their messaging queues from self-managed message-oriented middleware systems to Amazon Simple Queue Service (Amazon SQS). The development team at the company wants to minimize the costs of using Amazon SQS.

As a solutions architect, which of the following options would you recommend for the given use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use SQS long polling to retrieve messages from your Amazon SQS queues `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use SQS short polling to retrieve messages from your Amazon SQS queues
- **(C)** Use SQS visibility timeout to retrieve messages from your Amazon SQS queues
- **(D)** Use SQS message timer to retrieve messages from your Amazon SQS queues

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Simple Queue Service (Amazon SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications.
Amazon SQS provides short polling and long polling to receive messages from a queue. By default, queues use short polling. With short polling, Amazon SQS sends the response right away, even if the query found no messages. With long polling, Amazon SQS sends a response after it collects at least one available message, up to the maximum number of messages specified in the request. Amazon SQS sends an empty response only if the polling wait time expires.
Long polling makes it inexpensive to retrieve messages from your Amazon SQS queue as soon as the messages are available. Using long polling can reduce the cost of using SQS because you can reduce the number of empty receives.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use SQS short polling to retrieve messages from your Amazon SQS queues**:
  With short polling, Amazon SQS sends the response right away, even if the query found no messages. You end up paying more because of the increased number of empty receives.

- **Use SQS visibility timeout to retrieve messages from your Amazon SQS queues**:
  Visibility timeout is a period during which Amazon SQS prevents other consumers from receiving and processing a given message. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. You cannot use visibility timeout to retrieve messages from your Amazon SQS queues. This option has been added as a distractor.

- **Use SQS message timer to retrieve messages from your Amazon SQS queues**:
  You can use message timers to set an initial invisibility period for a message added to a queue. So, if you send a message with a 60-second timer, the message isn't visible to consumers for its first 60 seconds in the queue. The default (minimum) delay for a message is 0 seconds. The maximum is 15 minutes. You cannot use message timer to retrieve messages from your Amazon SQS queues. This option has been added as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSSimpleQueueService - sqs short and long polling](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-short-and-long-polling.html)
- 🌐 [AWS Service Overview: sqs](https://aws.amazon.com/sqs/faqs/)

</details>

---

<div id="question-07"></div>

### Question 07: Inheritance Rules for Launch Template Tenancy vs VPC Tenancy in EC2
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A video conferencing application is hosted on a fleet of EC2 instances which are part of an Auto Scaling group. The Auto Scaling group uses a Launch Template (LT1) with "dedicated" instance tenancy but the VPC (V1) used by the Launch Template LT1 has the instance tenancy set to default. Later the DevOps team creates a new Launch Template (LT2) with shared (default) instance tenancy but the VPC (V2) used by the Launch Template LT2 has the instance tenancy set to dedicated.

Which of the following is correct regarding the instances launched via Launch Template LT1 and Launch Template LT2?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The instances launched by both Launch Template LT1 and Launch Template LT2 will have dedicated instance tenancy `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** The instances launched by Launch Template LT1 will have default instance tenancy while the instances launched by the Launch Template LT2 will have dedicated instance tenancy
- **(C)** The instances launched by Launch Template LT1 will have dedicated instance tenancy while the instances launched by the Launch Template LT2 will have shared (default) instance tenancy
- **(D)** The instances launched by both Launch Template LT1 and Launch Template LT2 will have default instance tenancy

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A launch template specifies instance configuration information. It includes the ID of the Amazon Machine Image (AMI), the instance type, a key pair, security groups, and other parameters used to launch EC2 instances. If you've launched an EC2 instance before, you specified the same information to launch the instance.
When you create a Launch Template, the default value for the instance tenancy is shared and the instance tenancy is controlled by the tenancy attribute of the VPC. If you set the Launch Template Tenancy to shared (default) and the VPC Tenancy is set to dedicated, then the instances have dedicated tenancy. If you set the Launch Template Tenancy to dedicated and the VPC Tenancy is set to default, then again the instances have dedicated tenancy.
Amazon EC2 provides three options for the tenancy of your EC2 instances:
Shared (Shared) – Multiple AWS accounts may share the same physical hardware. This is the default tenancy option when launching an instance.
Dedicated instances (Dedicated) – Your instance runs on single-tenant hardware. No other AWS customer shares the same physical server.
Dedicated Hosts (Dedicated host) – The instance runs on a physical server that is dedicated to your use. Using Dedicated Hosts makes it easier to bring your own licenses (BYOL) that have dedicated hardware requirements to EC2 and meet compliance use cases. If you choose this option, you must provide a host resource group for Tenancy host resource group.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **The instances launched by Launch Template LT1 will have dedicated instance tenancy while the instances launched by the Launch Template LT2 will have shared (default) instance tenancy**:
  If either Launch Template Tenancy or VPC Tenancy is set to dedicated, then the instance tenancy is also dedicated. Therefore, this option is incorrect.

- **The instances launched by Launch Template LT1 will have default instance tenancy while the instances launched by the Launch Template LT2 will have dedicated instance tenancy**:
  If either Launch Template Tenancy or VPC Tenancy is set to dedicated, then the instance tenancy is also dedicated. Therefore, this option is incorrect.

- **The instances launched by both Launch Template LT1 and Launch Template LT2 will have default instance tenancy**:
  If either Launch Template Tenancy or VPC Tenancy is set to dedicated, then the instance tenancy is also dedicated. Therefore, this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - advanced settings for your launch template](https://docs.aws.amazon.com/autoscaling/ec2/userguide/advanced-settings-for-your-launch-template.html)

</details>

---

<div id="question-08"></div>

### Question 08: Monetizing and Rate-Limiting Partner API Invocations with API Gateway Usage Plans
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A media streaming startup is building a set of backend APIs that will be consumed by external mobile applications. To prevent API abuse, protect downstream resources, and ensure fair usage across clients, the architecture must enforce rate limiting and throttling on a per-client basis. The team also wants to define usage quotas and apply different limits to different API consumers.

Which solution should the team implement to enforce rate limiting and usage quotas at the API layer?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an Application Load Balancer (ALB) with path-based routing and configure listener rules to enforce request limits
- **(B)** Use a Network Load Balancer (NLB) to terminate TLS and apply rate-limiting logic within backend EC2 instances
- **(C)** Use a Gateway Load Balancer to inspect and control incoming HTTP traffic and throttle requests by integrating with third-party firewall appliances
- **(D)** Use Amazon API Gateway and configure usage plans with API keys to apply rate limits and quotas per client `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon API Gateway natively supports rate limiting and throttling through the use of usage plans and API keys. By assigning API keys to clients and associating them with usage plans, developers can control the number of requests per second (rate) and the total number of requests over a period (quota). This enables fine-grained traffic control and ensures fair usage across clients, making it ideal for public-facing APIs. Throttling settings are enforced at the API Gateway layer, protecting downstream resources such as Lambda functions or backend services from overload.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use an Application Load Balancer (ALB) with path-based routing and configure listener rules to enforce request limits**:
  Application Load Balancers (ALBs) offer path-based and host-based routing, support WebSocket and HTTP/HTTPS traffic, and can perform request-level routing. However, ALBs do not provide built-in rate limiting or throttling capabilities. Any rate-limiting logic must be implemented at the backend or using WAF rules, which lack per-client usage plans or quota control. ALBs are optimized for load balancing, not API rate control.

- **Use a Gateway Load Balancer to inspect and control incoming HTTP traffic and throttle requests by integrating with third-party firewall appliances**:
  Gateway Load Balancers (GWLB) are designed to integrate with third-party security appliances, such as intrusion prevention systems or firewalls. While they can be used for traffic inspection and filtering, GWLBs do not provide application-layer rate limiting and are not intended for managing client usage quotas or request throttling. They operate at Layer 3/4 and are not suited for fine-grained API access control.

- **Use a Network Load Balancer (NLB) to terminate TLS and apply rate-limiting logic within backend EC2 instances**:
  Network Load Balancers (NLBs) are optimized for ultra-low latency and high-throughput TCP/UDP traffic, and they operate at Layer 4 (Transport Layer). NLBs do not have built-in capabilities to throttle or limit requests. Any rate-limiting would need to be implemented at the application level on the target EC2 instances, which defeats the purpose of centralized API rate limiting and adds unnecessary complexity to backend services.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: apigateway - api gateway api usage plans](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/introduction.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)

</details>

---

<div id="question-09"></div>

### Question 09: Securing Serverless Microservices with API Gateway HTTP API and JWT Authorizers
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A startup is building a serverless microservices architecture where client applications (web and mobile) authenticate users via a third-party OIDC-compliant identity provider. The backend APIs must validate JSON Web Tokens (JWTs) issued by this provider, enforce scope-based access control, and be cost-effective with minimal latency. The development team wants to use a fully managed service that supports JWT validation natively, without writing custom authentication logic.

Which solution should the team implement to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon API Gateway HTTP API with a native JWT authorizer configured to validate tokens from the OIDC provider `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy a gRPC backend on Amazon ECS Fargate and expose it through AWS App Runner, handling JWT validation inside the containerized services
- **(C)** Use Amazon API Gateway REST API with a Lambda function that manually validates JWT tokens
- **(D)** Use Amazon API Gateway WebSocket API with JWT claims validated by a Lambda authorizer

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon API Gateway HTTP APIs support native JWT authorizers, allowing developers to configure the API to automatically validate JWT tokens issued by an OIDC-compliant identity provider, such as Auth0, Okta, or Amazon Cognito. This eliminates the need for custom authentication logic in Lambda functions and reduces both latency and cost. HTTP APIs are optimized for low-latency, high-performance workloads and are more cost-effective than REST APIs, making them ideal for modern, serverless applications that require standard JWT validation and claim-based access control.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon API Gateway REST API with a Lambda function that manually validates JWT tokens**:
  Although API Gateway REST APIs support custom Lambda authorizers, using them to validate JWT tokens requires writing, deploying, and maintaining custom authentication logic in Lambda functions. This introduces additional latency, increases costs, and violates the requirement for a native, no-code solution. Moreover, REST APIs are more expensive and designed for full-featured API management use cases, making them less optimal for lightweight JWT validation scenarios compared to HTTP APIs.

- **Use Amazon API Gateway WebSocket API with JWT claims validated by a Lambda authorizer**:
  WebSocket APIs in API Gateway are designed for bidirectional communication, not stateless HTTP request-response models. While a Lambda authorizer can inspect tokens during the $connect phase, WebSocket APIs do not natively support JWT authorizers, and authorization is not enforced per message. This approach lacks the stateless, per-request token validation required by the startup’s microservices. It also adds complexity and is not aligned with standard RESTful JWT use cases.

- **Deploy a gRPC backend on Amazon ECS Fargate and expose it through AWS App Runner, handling JWT validation inside the containerized services**:
  Deploying a gRPC backend on ECS Fargate and handling JWT validation within the container logic shifts the responsibility of authentication to the application layer, which increases complexity and violates the requirement for a fully managed JWT validation solution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: apigateway - http api jwt authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-jwt-authorizer.html)
- 🌐 [AWS Docs: apigateway - apigateway use lambda authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html)
- 🌐 [AWS Docs: apigateway - apigateway websocket api lambda auth](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-lambda-auth.html)

</details>

---

<div id="question-10"></div>

### Question 10: Accelerating Low-Latency UDP Proprietary Gaming Traffic via AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A media company wants a low-latency way to distribute live sports results which are delivered via a proprietary application using UDP protocol.

As a solutions architect, which of the following solutions would you recommend such that it offers the BEST performance for this use case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Elastic Load Balancing (ELB) to provide a low latency way to distribute live sports results
- **(B)** Use Amazon CloudFront to provide a low latency way to distribute live sports results
- **(C)** Use Auto Scaling group to provide a low latency way to distribute live sports results
- **(D)** Use AWS Global Accelerator to provide a low latency way to distribute live sports results `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Global Accelerator is a networking service that helps you improve the availability and performance of the applications that you offer to your global users. AWS Global Accelerator is easy to set up, configure, and manage. It provides static IP addresses that provide a fixed entry point to your applications and eliminate the complexity of managing specific IP addresses for different AWS Regions and Availability Zones (AZs). AWS Global Accelerator always routes user traffic to the optimal endpoint based on performance, reacting instantly to changes in application health, your user’s location, and policies that you configure. Global Accelerator is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP. Therefore, this option is correct.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon CloudFront to provide a low latency way to distribute live sports results**:
  Amazon CloudFront is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, all within a developer-friendly environment. Amazon CloudFront points of presence (POPs) (edge locations) make sure that popular content can be served quickly to your viewers. Amazon CloudFront also has regional edge caches that bring more of your content closer to your viewers, even when the content is not popular enough to stay at a POP, to help improve performance for that content. CloudFront supports HTTP/RTMP protocol based requests, therefore this option is incorrect.

- **Use Elastic Load Balancing (ELB) to provide a low latency way to distribute live sports results**:
  Elastic Load Balancing (ELB) automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, IP addresses, and AWS Lambda functions. It can handle the varying load of your application traffic in a single Availability Zone or across multiple Availability Zones. Elastic Load Balancer cannot help with decreasing latency of incoming traffic from the source.

- **Use Auto Scaling group to provide a low latency way to distribute live sports results**:
  Amazon EC2 Auto Scaling helps you ensure that you have the correct number of Amazon EC2 instances available to handle the load for your application. Auto Scaling group cannot help with decreasing latency of incoming traffic from the source.

- **Exam Alert**:
  Please note the differences between the capabilities of AWS Global Accelerator and Amazon CloudFront: AWS Global Accelerator and Amazon CloudFront are separate services that use the AWS global network and its edge locations around the world. Amazon CloudFront improves performance for both cacheable content (such as images and videos) and dynamic content (such as API acceleration and dynamic site delivery). AWS Global Accelerator improves performance for a wide range of applications over TCP or UDP by proxying packets at the edge to applications running in one or more AWS Regions. AWS Global Accelerator is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP, as well as for HTTP use cases that specifically require static IP addresses or deterministic, fast regional failover. Both services integrate with AWS Shield for DDoS protection.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: global-accelerator](https://aws.amazon.com/global-accelerator/)
- 🌐 [AWS Service Overview: cloudfront](https://aws.amazon.com/cloudfront/faqs/)

</details>

---

<div id="question-11"></div>

### Question 11: Resolving Availability Zone Name Mapping Differences using Availability Zone IDs (AZ IDs)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An IT consultant is helping a small business revamp their technology infrastructure on the AWS Cloud. The business has two AWS accounts and all resources are provisioned in the us-west-2 region. The IT consultant is trying to launch an Amazon EC2 instance in each of the two AWS accounts such that the instances are in the same Availability Zone (AZ) of the us-west-2 region. Even after selecting the same default subnet (us-west-2a) while launching the instances in each of the AWS accounts, the IT consultant notices that the Availability Zones (AZs) are still different.

As a solutions architect, which of the following would you suggest resolving this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Reach out to AWS Support for creating the Amazon EC2 instances in the same Availability Zone (AZ) across the two AWS accounts
- **(B)** Use the default subnet to uniquely identify the Availability Zones across the two AWS Accounts
- **(C)** Use the default VPC to uniquely identify the Availability Zones across the two AWS Accounts
- **(D)** Use Availability Zone (AZ) ID to uniquely identify the Availability Zones across the two AWS Accounts `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
An Availability Zone is represented by a region code followed by a letter identifier; for example, us-east-1a. To ensure that resources are distributed across the Availability Zones for a region, AWS maps Availability Zones to names for each AWS account. For example, the Availability Zone us-west-2a for one AWS account might not be the same location as us-west-2a for another AWS account.
To coordinate Availability Zones across accounts, you must use the AZ ID, which is a unique and consistent identifier for an Availability Zone. For example, usw2-az2 is an AZ ID for the us-west-2 region and it has the same location in every AWS account.
Viewing AZ IDs enables you to determine the location of resources in one account relative to the resources in another account. For example, if you share a subnet in the Availability Zone with the AZ ID usw2-az2 with another account, this subnet is available to that account in the Availability Zone whose AZ ID is also usw2-az2.
You can view the AZ IDs by going to the service health section of the Amazon EC2 Dashboard via your AWS Management Console.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use the default VPC to uniquely identify the Availability Zones across the two AWS Accounts**:
  A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. It is logically isolated from other virtual networks in the AWS Cloud. Since a VPC spans an AWS region, it cannot be used to uniquely identify an Availability Zone. Therefore, this option is incorrect.

- **Use the default subnet to uniquely identify the Availability Zones across the two AWS Accounts**:
  A subnet is a range of IP addresses in your VPC. A subnet spans an Availability Zone of an AWS region. The default subnet representing the Availability Zone us-west-2a for one AWS account might not be the same location as us-west-2a for another AWS account. Therefore, this option is incorrect.

- **Reach out to AWS Support for creating the Amazon EC2 instances in the same Availability Zone (AZ) across the two AWS accounts**:
  Since the AZ ID is a unique and consistent identifier for an Availability Zone, there is no need to contact AWS Support. Therefore, this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - using regions availability zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)

</details>

---

<div id="question-12"></div>

### Question 12: Global Acceleration for S3 Static Website using S3 Transfer Acceleration
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A media startup is looking at hosting their web application on AWS Cloud. The application will be accessed by users from different geographic regions of the world to upload and download video files that can reach a maximum size of 10 gigabytes. The startup wants the solution to be cost-effective and scalable with the lowest possible latency for a great user experience.

As a Solutions Architect, which of the following will you suggest as an optimal solution to meet the given requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon S3 for hosting the web application and use Amazon CloudFront for faster distribution of content to geographically dispersed users
- **(B)** Use Amazon EC2 with Amazon ElastiCache for faster distribution of content, while Amazon S3 can be used as a storage service
- **(C)** Use Amazon EC2 with AWS Global Accelerator for faster distribution of content, while using Amazon S3 as storage service
- **(D)** Use Amazon S3 for hosting the web application and use Amazon S3 Transfer Acceleration (Amazon S3TA) to reduce the latency that geographically dispersed users might face `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 Transfer Acceleration (S3TA) can speed up content transfers to and from Amazon S3 by as much as 50-500% for long-distance transfer of larger objects. Customers who have either web or mobile applications with widespread users or applications hosted far away from their S3 bucket can experience long and variable upload and download speeds over the Internet. S3 Transfer Acceleration (S3TA) reduces the variability in Internet routing, congestion, and speeds that can affect transfers, and logically shortens the distance to S3 for remote applications.
S3TA improves transfer performance by routing traffic through Amazon CloudFront’s globally distributed Edge Locations and over AWS backbone networks, and by using network protocol optimizations.
For applications interacting with your Amazon S3 buckets through the S3 API from outside of your bucket’s region, S3TA helps avoid the variability in Internet routing and congestion. It does this by routing your uploads and downloads over the AWS global network infrastructure, so you get the benefit of AWS network optimizations.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon S3 for hosting the web application and use Amazon CloudFront for faster distribution of content to geographically dispersed users**:
  Amazon S3 with Amazon CloudFront is a very powerful way of distributing static content to geographically dispersed users with low latency speeds. If you have objects that are smaller than 1GB or if the data set is less than 1GB in size, you should consider using Amazon CloudFront's PUT/POST commands for optimal performance. The given use case has data larger than 1GB and hence S3 Transfer Acceleration is a better option.

- **Use Amazon EC2 with AWS Global Accelerator for faster distribution of content, while using Amazon S3 as storage service**:
  AWS Global Accelerator is a networking service that sends your user’s traffic through Amazon Web Service’s global network infrastructure, improving your internet user performance by up to 60%. AWS Global Accelerator is meant for a different use case and is not meant for increasing the speed of Amazon S3 uploads or downloads.

- **Use Amazon EC2 with Amazon ElastiCache for faster distribution of content, while Amazon S3 can be used as a storage service**:
  Amazon ElastiCache allows you to seamlessly set up, run, and scale popular open-Source compatible in-memory data stores in the cloud. Amazon S3 Transfer Acceleration is a better performing option than opting for Amazon EC2 with Amazon ElastiCache, which is not meant to address the given use-case.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/transfer-acceleration/)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/faqs/)

</details>

---

<div id="question-13"></div>

### Question 13: Private In-VPC SQS Access Without Traversing Public Internet via VPC Endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
The engineering team at a company wants to use Amazon Simple Queue Service (Amazon SQS) to decouple components of the underlying application architecture. However, the team is concerned about the VPC-bound components accessing Amazon Simple Queue Service (Amazon SQS) over the public internet.

As a solutions architect, which of the following solutions would you recommend to address this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Network Address Translation (NAT) instance to access Amazon SQS
- **(B)** Use Internet Gateway to access Amazon SQS
- **(C)** Use VPC endpoint to access Amazon SQS `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use VPN connection to access Amazon SQS

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS customers can access Amazon Simple Queue Service (Amazon SQS) from their Amazon Virtual Private Cloud (Amazon VPC) using VPC endpoints, without using public IPs, and without needing to traverse the public internet. VPC endpoints for Amazon SQS are powered by AWS PrivateLink, a highly available, scalable technology that enables you to privately connect your VPC to supported AWS services.
Amazon VPC endpoints are easy to configure. They also provide reliable connectivity to Amazon SQS without requiring an internet gateway, Network Address Translation (NAT) instance, VPN connection, or AWS Direct Connect connection. With VPC endpoints, the data between your Amazon VPC and Amazon SQS queue is transferred within the Amazon network, helping protect your instances from internet traffic.
AWS PrivateLink simplifies the security of data shared with cloud-based applications by eliminating the exposure of data to the public Internet. AWS PrivateLink provides private connectivity between VPCs, AWS services, and on-premises applications, securely on the Amazon network. AWS PrivateLink makes it easy to connect services across different accounts and VPCs to significantly simplify the network architecture.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Internet Gateway to access Amazon SQS**:
  An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet. This option is ruled out as the team does not want to use the public internet to access Amazon SQS.

- **Use VPN connection to access Amazon SQS**:
  AWS Site-to-Site VPN (aka VPN Connection) enables you to securely connect your on-premises network or branch office site to your Amazon Virtual Private Cloud (Amazon VPC). As the existing infrastructure is within AWS Cloud, therefore a VPN connection is not required.

- **Use Network Address Translation (NAT) instance to access Amazon SQS**:
  You can use a network address translation (NAT) instance in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the Internet or other AWS services, but prevent the instances from receiving inbound traffic initiated by someone on the Internet. This option is ruled out because NAT instances are used to provide internet access to any instances in a private subnet.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: privatelink](https://aws.amazon.com/privatelink/)
- 🌐 [AWS Service Overview: about-aws](https://aws.amazon.com/about-aws/whats-new/2018/12/amazon-sqs-vpc-endpoints-aws-privatelink/)

</details>

---

<div id="question-14"></div>

### Question 14: Ultra High-Performance Sub-Millisecond Database Storage with Provisioned IOPS SSD (io1)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A big data analytics company is working on a real-time vehicle tracking solution. The data processing workflow involves both I/O intensive and throughput intensive database workloads. The development team needs to store this real-time data in a NoSQL database hosted on an Amazon EC2 instance and needs to support up to 25,000 IOPS per volume.

As a solutions architect, which of the following Amazon Elastic Block Store (Amazon EBS) volume types would you recommend for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Throughput Optimized HDD (st1)
- **(B)** General Purpose SSD (gp2)
- **(C)** Cold HDD (sc1)
- **(D)** Provisioned IOPS SSD (io1) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Provisioned IOPS SSD (io1) is backed by solid-state drives (SSDs) and is a high-performance Amazon EBS storage option designed for critical, I/O intensive database and application workloads, as well as throughput-intensive database workloads. io1 is designed to deliver a consistent baseline performance of up to 50 IOPS/GB to a maximum of 64,000 IOPS and provide up to 1,000 MB/s of throughput per volume. Therefore, the io1 volume type would be able to meet the requirement of 25,000 IOPS per volume for the given use-case.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **General Purpose SSD (gp2)**:
  gp2 is backed by solid-state drives (SSDs) and is suitable for a broad range of transactional workloads, including dev/test environments, low-latency interactive applications, and boot volumes. It supports max IOPS/Volume of 16,000.

- **Cold HDD (sc1)**:
  sc1 is backed by hard disk drives (HDDs). It is ideal for less frequently accessed workloads with large, cold datasets. It supports max IOPS/Volume of 250.

- **Throughput Optimized HDD (st1)**:
  st1 is backed by hard disk drives (HDDs) and is ideal for frequently accessed, throughput-intensive workloads with large datasets and large I/O sizes, such as MapReduce, Kafka, log processing, data warehouse, and ETL workloads. It supports max IOPS/Volume of 500.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: ebs](https://aws.amazon.com/ebs/volume-types/)

</details>

---

<div id="question-15"></div>

### Question 15: EC2 Spot Request Lifecycle: Canceling Spot Requests vs Running Spot Instances
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (B), (D) | **Đáp án đúng**: (A), (B), (D)

#### 📋 Đề bài (Scenario)
The development team at a retail company wants to optimize the cost of Amazon EC2 instances. The team wants to move certain nightly batch jobs to spot instances. The team has hired you as a solutions architect to provide the initial guidance.

Which of the following would you identify as CORRECT regarding the capabilities of spot instances? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** When you cancel an active spot request, it does not terminate the associated instance `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** If a spot request is persistent, then it is opened again after your Spot Instance is interrupted `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** If a spot request is persistent, then it is opened again after you stop the Spot Instance
- **(D)** Spot Fleets can maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** When you cancel an active spot request, it terminates the associated instance as well
- **(F)** Spot Fleets cannot maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Because Spot Instances enable you to request unused Amazon EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly. The hourly price for a Spot Instance is called a Spot price. The Spot price of each instance type in each Availability Zone is set by Amazon EC2 and adjusted gradually based on the long-term supply of and demand for Spot Instances.
A Spot Instance request is either one-time or persistent. If the spot request is persistent, the request is opened again after your Spot Instance is interrupted. If the request is persistent and you stop your Spot Instance, the request only opens after you start your Spot Instance.
A Spot Fleet is a set of Spot Instances and optionally On-Demand Instances that is launched based on criteria that you specify. The Spot Fleet selects the Spot capacity pools that meet your needs and launches Spot Instances to meet the target capacity for the fleet. By default, Spot Fleets are set to maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated. You can submit a Spot Fleet as a one-time request, which does not persist after the instances have been terminated. You can include On-Demand Instance requests in a Spot Fleet request.
If your Spot Instance request is active and has an associated running Spot Instance, or your Spot Instance request is disabled and has an associated stopped Spot Instance, canceling the request does not terminate the instance; you must terminate the running Spot Instance manually. Moreover, to cancel a persistent Spot request and terminate its Spot Instances, you must cancel the Spot request first and then terminate the Spot Instances.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **When you cancel an active spot request, it terminates the associated instance as well**:
  If your Spot Instance request is active and has an associated running Spot Instance, then canceling the request does not terminate the instance; you must terminate the running Spot Instance manually. So, this option is incorrect.

- **If a spot request is persistent, then it is opened again after you stop the Spot Instance**:
  If the request is persistent and you stop your Spot Instance, the request only opens after you start your Spot Instance. So, this option is incorrect.

- **Spot Fleets cannot maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated**:
  As mentioned above, Spot Fleets can maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - spot requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html)
- 🌐 [AWS Docs: AWSEC2 - spot fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet.html)

</details>

---

<div id="question-16"></div>

### Question 16: Enforcing Regulatory S3 Server-Side Encryption with Customer-Provided Keys (SSE-C)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company maintains its business-critical customer data on an on-premises system in an encrypted format. Over the years, the company has transitioned from using a single encryption key to multiple encryption keys by dividing the data into logical chunks. With the decision to move all the data to an Amazon S3 bucket, the company is now looking for a technique to encrypt each file with a different encryption key to provide maximum security to the migrated on-premises data.

How will you implement this requirement without adding the overhead of splitting the data into logical groups?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure a single Amazon S3 bucket to hold all data. Use server-side encryption with AWS KMS (SSE-KMS) and use encryption context to generate a different key for each file/object that you store in the S3 bucket
- **(B)** Use Multi-Region keys for client-side encryption in the AWS S3 Encryption Client to generate unique keys for each file of data
- **(C)** Store the logically divided data into different Amazon S3 buckets. Use server-side encryption with Amazon S3 managed keys (SSE-S3) to encrypt the data
- **(D)** Configure a single Amazon S3 bucket to hold all data. Use server-side encryption with Amazon S3 managed keys (SSE-S3) to encrypt the data `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Server-side encryption is the encryption of data at its destination by the application or service that receives it. Amazon S3 encrypts your data at the object level as it writes it to disks in its data centers and decrypts it for you when you access it. When you use server-side encryption with Amazon S3 managed keys (SSE-S3), each object is encrypted with a unique key. As an additional safeguard, it encrypts the key itself with a root key that it regularly rotates.
Note: Amazon S3 now applies server-side encryption with Amazon S3 managed keys (SSE-S3) as the base level of encryption for every bucket in Amazon S3. Starting January 5, 2023, all new object uploads to Amazon S3 will be automatically encrypted at no additional cost and with no impact on performance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Store the logically divided data into different Amazon S3 buckets. Use server-side encryption with Amazon S3 managed keys (SSE-S3) to encrypt the data**:
  Server-side encryption with Amazon S3 managed keys (SSE-S3) is the easiest way to implement the given requirement, as there is no additional overhead of splitting data. Multiple S3 buckets are redundant for this requirement.

- **Use Multi-Region keys for client-side encryption in the AWS S3 Encryption Client to generate unique keys for each file of data**:
  Server-side encryption is the encryption of data at its destination by the application or service that receives it. The requirement is about server-side encryption and not about client-side encryption, hence this choice is incorrect.

- **Configure a single Amazon S3 bucket to hold all data. Use server-side encryption with AWS KMS (SSE-KMS) and use encryption context to generate a different key for each file/object that you store in the S3 bucket**:
  An encryption context is a set of key-value pairs that contain additional contextual information about the data. When an encryption context is specified for an encryption operation, Amazon S3 must specify the same encryption context for the decryption operation. The encryption context offers another level of security for the encryption key. However, it is not useful for generating unique keys.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - serv side encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/serv-side-encryption.html)
- 🌐 [AWS Docs: AmazonS3 - UsingKMSEncryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html)

</details>

---

<div id="question-17"></div>

### Question 17: VPC Security Group Rules: Disallowed Sources and Custom Destination IP Restrictions
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
The DevOps team at an IT company has recently migrated to AWS and they are configuring security groups for their two-tier application with public web servers and private database servers. The team wants to understand the allowed configuration options for an inbound rule for a security group.

As a solutions architect, which of the following would you identify as an INVALID option for setting up such a configuration?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** You can use a security group as the custom source for the inbound rule
- **(B)** You can use an Internet Gateway ID as the custom source for the inbound rule `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** You can use a range of IP addresses in CIDR block notation as the custom source for the inbound rule
- **(D)** You can use an IP address as the custom source for the inbound rule

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A security group acts as a virtual firewall that controls the traffic for one or more instances. When you launch an instance, you can specify one or more security groups; otherwise, you can use the default security group. You can add rules to each security group that allows traffic to or from its associated instances. You can modify the rules for a security group at any time; the new rules are automatically applied to all instances that are associated with the security group.
Therefore, you cannot use an Internet Gateway ID as the custom source for the inbound rule.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- You can use a security group as the custom source for the inbound rule

- You can use a range of IP addresses in CIDR block notation as the custom source for the inbound rule

- You can use an IP address as the custom source for the inbound rule As described in the list of allowed sources or destinations for security group rules, the above options are supported.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - ec2 security groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html)

</details>

---

<div id="question-18"></div>

### Question 18: High-Performance NetApp ONTAP Cloud Migration using Amazon FSx for NetApp ONTAP
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is transferring a significant volume of data from on-site storage to AWS, where it will be accessed by Windows, Mac, and Linux-based Amazon EC2 instances within the same AWS region using both SMB and NFS protocols. Part of this data will be accessed regularly, while the rest will be accessed less frequently. The company requires a hosting solution for this data that minimizes operational overhead.

What solution would best meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an Amazon Elastic File System (Amazon EFS) volume that uses EFS Infrequent Access. Use AWS DataSync to migrate the data to the EFS volume
- **(B)** Set up an Amazon FSx for ONTAP instance. Configure an FSx for ONTAP file system on the root volume and migrate the data to the FSx for ONTAP volume `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Set up an Amazon Elastic File System (Amazon EFS) volume that uses EFS Intelligent-Tiering. Use AWS DataSync to migrate the data to the EFS volume
- **(D)** Set up an Amazon FSx for OpenZFS instance. Configure an FSx for OpenZFS file ystem on the root volume and migrate the data to the FSx for OpenZFS volume

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for NetApp ONTAP is a storage service that allows customers to launch and run fully managed ONTAP file systems in the cloud. ONTAP is NetApp’s file system technology that provides a widely adopted set of data access and data management capabilities.
The given use case mandates that the storage on AWS will be accessed by Windows, Mac, and Linux-based Amazon EC2 instances within the same AWS region using both SMB and NFS protocols. Amongst the Amazon FSx family, FSx for ONTAP is the only file system that supports this key requirement.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Set up an Amazon Elastic File System (Amazon EFS) volume that uses EFS Intelligent-Tiering. Use AWS DataSync to migrate the data to the EFS volume

- Set up an Amazon Elastic File System (Amazon EFS) volume that uses EFS Infrequent Access. Use AWS DataSync to migrate the data to the EFS volume Amazon EFS is not supported on Windows instances. So, both these options are incorrect.

- **Set up an Amazon FSx for OpenZFS instance. Configure an FSx for OpenZFS file ystem on the root volume and migrate the data to the FSx for OpenZFS volume**:
  Amazon FSx for OpenZFS is a fully managed file storage service that lets you launch, run, and scale fully managed file systems built on the open-source OpenZFS file system. FSx for OpenZFS is compatible with Windows, Linux, macOS clients. It supports NFS 3, 4.0, 4.1, 4.2 protocols, however, it does NOT support the SMB protocol.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: fsx](https://aws.amazon.com/fsx/netapp-ontap/)
- 🌐 [AWS Service Overview: fsx](https://aws.amazon.com/fsx/when-to-choose-fsx/)
- 🌐 [AWS Service Overview: fsx](https://aws.amazon.com/fsx/openzfs/faqs/)
- 🌐 [AWS Docs: AWSEC2 - AmazonEFS](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/AmazonEFS.html)

</details>

---

<div id="question-19"></div>

### Question 19: Real-Time Streaming Log Ingestion and Dynamic Multi-AZ Scaling with Kinesis Data Streams
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has hired you as an AWS Certified Solutions Architect – Associate to help with redesigning a real-time data processor. The company wants to build custom applications that process and analyze the streaming data for its specialized needs.

Which solution will you recommend to address this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Kinesis Data Firehose to process the data streams as well as decouple the producers and consumers for the real-time data processor
- **(B)** Use Amazon Kinesis Data Streams to process the data streams as well as decouple the producers and consumers for the real-time data processor `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon Simple Notification Service (Amazon SNS) to process the data streams as well as decouple the producers and consumers for the real-time data processor
- **(D)** Use Amazon Simple Queue Service (Amazon SQS) to process the data streams as well as decouple the producers and consumers for the real-time data processor

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Kinesis Data Streams is useful for rapidly moving data off data producers and then continuously processing the data, be it to transform the data before emitting to a data store, run real-time metrics and analytics, or derive more complex data streams for further processing. Kinesis data streams can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon Simple Notification Service (Amazon SNS) to process the data streams as well as decouple the producers and consumers for the real-time data processor**:
  Amazon Simple Notification Service (Amazon SNS) is a highly available, durable, secure, fully managed pub/sub messaging service that enables you to decouple microservices, distributed systems, and serverless applications. SNS cannot be used to decouple the producers and consumers for the real-time data processor as described in the given use-case.

- **Use Amazon Simple Queue Service (Amazon SQS) to process the data streams as well as decouple the producers and consumers for the real-time data processor**:
  Amazon Simple Queue Service (Amazon SQS) offers a secure, durable, and available hosted queue that lets you integrate and decouple distributed software systems and components. SQS cannot be used to decouple the producers and consumers for the real-time data processor as described in the given use-case.

- **Use Amazon Kinesis Data Firehose to process the data streams as well as decouple the producers and consumers for the real-time data processor**:
  Amazon Kinesis Data Firehose is the easiest way to load streaming data into data stores and analytics tools. Kinesis Firehose cannot be used to process and analyze the streaming data in custom applications. It can capture, transform, and load streaming data into Amazon S3, Amazon Redshift, Amazon Elasticsearch Service, and Splunk, enabling near real-time analytics.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-streams/)
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-firehose/)

</details>

---

<div id="question-20"></div>

### Question 20: High-Availability Multi-AZ Architecture with Dedicated NAT Gateways per AZ
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An engineering lead is designing a VPC with public and private subnets. The VPC and subnets use IPv4 CIDR blocks. There is one public subnet and one private subnet in each of three Availability Zones (AZs) for high availability. An internet gateway is used to provide internet access for the public subnets. The private subnets require access to the internet to allow Amazon EC2 instances to download software updates.

Which of the following options represents the correct solution to set up internet access for the private subnets?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up three NAT gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Set up three egress-only internet gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the egress-only internet gateway in its AZ
- **(C)** Set up three NAT gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ
- **(D)** Set up three Internet gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the Internet gateway in its AZ

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You can use a network address translation (NAT) gateway to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances.
To create a NAT gateway, you must specify the public subnet in which the NAT gateway should reside. You must also specify an Elastic IP address to associate with the NAT gateway when you create it. The Elastic IP address cannot be changed after you associate it with the NAT Gateway. After you've created a NAT gateway, you must update the route table associated with one or more of your private subnets to point internet-bound traffic to the NAT gateway. This enables instances in your private subnets to communicate with the internet.
Each NAT gateway is created in a specific Availability Zone and implemented with redundancy in that zone.
If you have resources in multiple Availability Zones and they share one NAT gateway, and if the NAT gateway’s Availability Zone is down, resources in the other Availability Zones lose internet access. To create an Availability Zone-independent architecture, create a NAT gateway in each Availability Zone and configure your routing to ensure that resources use the NAT gateway in the same Availability Zone.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up three NAT gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ**:
  NAT gateways need to be set up in public subnets, so this option is incorrect.

- **Set up three Internet gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the Internet gateway in its AZ**:
  Internet gateways cannot be provisioned in private subnets of a VPC.

- **Set up three egress-only internet gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the egress-only internet gateway in its AZ**:
  An Egress-only Internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows outbound communication over IPv6 from instances in your VPC to the internet, and prevents the internet from initiating an IPv6 connection with your instances. The given use-case is for IPv4 traffic, hence an Egress-only Internet gateway is not an option.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc nat gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

</details>

---

<div id="question-21"></div>

### Question 21: Centralized Multi-Account Networking Governance with VPC Sharing via AWS RAM
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A retail company uses AWS Cloud to manage its IT infrastructure. The company has set up AWS Organizations to manage several departments running their AWS accounts and using resources such as Amazon EC2 instances and Amazon RDS databases. The company wants to provide shared and centrally-managed VPCs to all departments using applications that need a high degree of interconnectivity.

As a solutions architect, which of the following options would you choose to facilitate this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use VPC peering to share one or more subnets with other AWS accounts belonging to the same parent organization from AWS Organizations
- **(B)** Use VPC sharing to share one or more subnets with other AWS accounts belonging to the same parent organization from AWS Organizations `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use VPC peering to share a VPC with other AWS accounts belonging to the same parent organization from AWS Organizations
- **(D)** Use VPC sharing to share a VPC with other AWS accounts belonging to the same parent organization from AWS Organizations

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
VPC sharing (part of Resource Access Manager) allows multiple AWS accounts to create their application resources such as Amazon EC2 instances, Amazon RDS databases, Amazon Redshift clusters, and AWS Lambda functions, into shared and centrally-managed Amazon Virtual Private Clouds (VPCs). To set this up, the account that owns the VPC (owner) shares one or more subnets with other accounts (participants) that belong to the same organization from AWS Organizations. After a subnet is shared, the participants can view, create, modify, and delete their application resources in the subnets shared with them. Participants cannot view, modify, or delete resources that belong to other participants or the VPC owner.
You can share Amazon VPCs to leverage the implicit routing within a VPC for applications that require a high degree of interconnectivity and are within the same trust boundaries. This reduces the number of VPCs that you create and manage while using separate accounts for billing and access control.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use VPC sharing to share a VPC with other AWS accounts belonging to the same parent organization from AWS Organizations**:
  Using VPC sharing, an account that owns the VPC (owner) shares one or more subnets with other accounts (participants) that belong to the same organization from AWS Organizations. The owner account cannot share the VPC itself. Therefore this option is incorrect.

- **Use VPC peering to share a VPC with other AWS accounts belonging to the same parent organization from AWS Organizations**:
  A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. VPC peering does not facilitate centrally managed VPCs. Therefore this option is incorrect.

- **Use VPC peering to share one or more subnets with other AWS accounts belonging to the same parent organization from AWS Organizations**:
  A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. VPC peering does not facilitate centrally managed VPCs. Moreover, an AWS owner account cannot share the VPC itself with another AWS account. Therefore this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc sharing](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html)
- 🌐 [AWS Docs: vpc - what is vpc peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html)

</details>

---

<div id="question-22"></div>

### Question 22: Auto Scaling Dynamic Backlog Scaling based on Custom SQS Queue Length Metric
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An e-commerce company runs its web application on Amazon EC2 instances in an Auto Scaling group and it's configured to handle consumer orders in an Amazon Simple Queue Service (Amazon SQS) queue for downstream processing. The DevOps team has observed that the performance of the application goes down in case of a sudden spike in orders received.

As a solutions architect, which of the following solutions would you recommend to address this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use a simple scaling policy based on a custom Amazon SQS queue metric
- **(B)** Use a step scaling policy based on a custom Amazon SQS queue metric
- **(C)** Use a scheduled scaling policy based on a custom Amazon SQS queue metric
- **(D)** Use a target tracking scaling policy based on a custom Amazon SQS queue metric `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
If you use a target tracking scaling policy based on a custom Amazon SQS queue metric, dynamic scaling can adjust to the demand curve of your application more effectively. You may use an existing CloudWatch Amazon SQS metric like ApproximateNumberOfMessagesVisible for target tracking but you could still face an issue so that the number of messages in the queue might not change proportionally to the size of the Auto Scaling group that processes messages from the queue. The solution is to use a backlog per instance metric with the target value being the acceptable backlog per instance to maintain.
To calculate your backlog per instance, divide the ApproximateNumberOfMessages queue attribute by the number of instances in the InService state for the Auto Scaling group. Then set a target value for the Acceptable backlog per instance.
To illustrate with an example, let's say that the current ApproximateNumberOfMessages is 1500 and the fleet's running capacity is 10. If the average processing time is 0.1 seconds for each message and the longest acceptable latency is 10 seconds, then the acceptable backlog per instance is 10 / 0.1, which equals 100. This means that 100 is the target value for your target tracking policy. If the backlog per instance is currently at 150 (1500 / 10), your fleet scales out, and it scales out by five instances to maintain proportion to the target value.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use a simple scaling policy based on a custom Amazon SQS queue metric**:
  With simple scaling, you choose scaling metrics and threshold values for the Amazon CloudWatch alarms that trigger the scaling process. The main issue with simple scaling is that after a scaling activity is started, the policy must wait for the scaling activity or health check replacement to complete and the cooldown period to expire before responding to additional alarms. This implies that the application would not be able to react quickly to sudden spikes in orders.

- **Use a step scaling policy based on a custom Amazon SQS queue metric**:
  With step scaling, you choose scaling metrics and threshold values for the Amazon CloudWatch alarms that trigger the scaling process. When step adjustments are applied, they increase or decrease the current capacity of your Auto Scaling group, and the adjustments vary based on the size of the alarm breach. For the given use-case, step scaling would try to approximate the correct number of instances by increasing/decreasing the steps as per the policy. This is not as efficient as the target tracking policy where you can calculate the exact number of instances required to handle the spike in orders.

- **Use a scheduled scaling policy based on a custom Amazon SQS queue metric**:
  Scheduled scaling allows you to set your scaling schedule. Scaling actions are performed automatically as a function of time and date. You cannot use scheduled scaling policies to address the sudden spike in orders.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - as using sqs queue](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)

</details>

---

<div id="question-23"></div>

### Question 23: Traffic Routing Behavior for Secondary Private IP Addresses on Elastic Network Interfaces (ENI)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A leading online gaming company is migrating its flagship application to AWS Cloud for delivering its online games to users across the world. The company would like to use a Network Load Balancer to handle millions of requests per second. The engineering team has provisioned multiple instances in a public subnet and specified these instance IDs as the targets for the NLB.

As a solutions architect, can you help the engineering team understand the correct routing mechanism for these target instances?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Traffic is routed to instances using the instance ID specified in the primary network interface for the instance
- **(B)** Traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Traffic is routed to instances using the primary elastic IP address specified in the primary network interface for the instance
- **(D)** Traffic is routed to instances using the primary public IP address specified in the primary network interface for the instance

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A Network Load Balancer functions at the fourth layer of the Open Systems Interconnection (OSI) model. It can handle millions of requests per second. After the load balancer receives a connection request, it selects a target from the target group for the default rule. It attempts to open a TCP connection to the selected target on the port specified in the listener configuration.
Request Routing and IP Addresses:
If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. The load balancer rewrites the destination IP address from the data packet before forwarding it to the target instance.
If you specify targets using IP addresses, you can route traffic to an instance using any private IP address from one or more network interfaces. This enables multiple applications on an instance to use the same port. Note that each network interface can have its security group. The load balancer rewrites the destination IP address before forwarding it to the target.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Traffic is routed to instances using the primary public IP address specified in the primary network interface for the instance**:
  If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. So public IP address cannot be used to route the traffic to the instance.

- **Traffic is routed to instances using the primary elastic IP address specified in the primary network interface for the instance**:
  If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. So elastic IP address cannot be used to route the traffic to the instance.

- **Traffic is routed to instances using the instance ID specified in the primary network interface for the instance**:
  You cannot use instance ID to route traffic to the instance. This option is just added as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- 🌐 [AWS Docs: elasticloadbalancing - load balancer target groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html)

</details>

---

<div id="question-24"></div>

### Question 24: Service Control Policy (SCP) Scope and Restrictions on AWS Service-Linked Roles
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (D), (E) | **Đáp án đúng**: (B), (D), (E)

#### 📋 Đề bài (Scenario)
An AWS Organization is using Service Control Policies (SCPs) for central control over the maximum available permissions for all accounts in their organization. This allows the organization to ensure that all accounts stay within the organization’s access control guidelines.

Which of the given scenarios are correct regarding the permissions described below? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Service control policy (SCP) affects all users and roles in the member accounts, excluding root user of the member accounts
- **(B)** Service control policy (SCP) does not affect service-linked role `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Service control policy (SCP) affects service-linked roles
- **(D)** Service control policy (SCP) affects all users and roles in the member accounts, including root user of the member accounts `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** If a user or role has an IAM permission policy that grants access to an action that is either not allowed or explicitly denied by the applicable service control policy (SCP), the user or role can't perform that action `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** If a user or role has an IAM permission policy that grants access to an action that is either not allowed or explicitly denied by the applicable service control policy (SCP), the user or role can still perform that action

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Service control policy (SCP) are one type of policy that can be used to manage your organization. Service control policy (SCP) offers central control over the maximum available permissions for all accounts in your organization, allowing you to ensure your accounts stay within your organization’s access control guidelines.
In service control policy (SCP), you can restrict which AWS services, resources, and individual API actions the users and roles in each member account can access. You can also define conditions for when to restrict access to AWS services, resources, and API actions. These restrictions even override the administrators of member accounts in the organization.
Please note the following effects on permissions vis-a-vis the service control policy (SCP):
If a user or role has an IAM permission policy that grants access to an action that is either not allowed or explicitly denied by the applicable service control policy (SCP), the user or role can't perform that action.
Service control policy (SCP) affects all users and roles in the member accounts, including root user of the member accounts.
Service control policy (SCP) does not affect any service-linked role.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- If a user or role has an IAM permission policy that grants access to an action that is either not allowed or explicitly denied by the applicable service control policy (SCP), the user or role can still perform that action

- Service control policy (SCP) affects all users and roles in the member accounts, excluding root user of the member accounts

- Service control policy (SCP) affects service-linked roles These three options contradict the details provided in the explanation above.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: organizations - orgs_manage_policies_scp](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)

</details>

---

<div id="question-25"></div>

### Question 25: Restricting S3 Access to Private EC2 Instances via Gateway VPC Endpoints & Endpoint Policies
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An e-commerce company has deployed its application on several Amazon EC2 instances that are configured in a private subnet using IPv4. These Amazon EC2 instances read and write a huge volume of data to and from Amazon S3 in the same AWS region. The company has set up subnet routing to direct all the internet-bound traffic through a Network Address Translation gateway (NAT gateway). The company wants to build the most cost-optimal solution without impacting the application's ability to communicate with Amazon S3 or the internet.

As an AWS Certified Solutions Architect Associate, which of the following would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a Gateway Load Balancer (GWLB) endpoint for Amazon S3. Update the route table in the private subnet to direct the S3-bound traffic via the Gateway Load Balancer (GWLB) endpoint
- **(B)** Set up an egress-only internet gateway in the public subnet. Update the route table in the private subnet to route traffic to the internet gateway. Update the network ACL to allow the S3-bound traffic
- **(C)** Provision an internet gateway. Update the route table in the private subnet to route traffic to the internet gateway. Update the network ACL (NACL) to allow the S3-bound traffic
- **(D)** Set up a VPC gateway endpoint for Amazon S3. Attach an endpoint policy to the endpoint. Update the route table to direct the S3-bound traffic to the VPC endpoint `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Gateway endpoints provide reliable connectivity to Amazon S3 without requiring an internet gateway or a NAT device for your VPC. After you create the gateway endpoint, you can add it as a target in your route table for traffic destined from your VPC to Amazon S3. There is no additional charge for using gateway endpoints.
The VPC endpoint policy for the gateway endpoint controls access to Amazon S3 from the VPC through the endpoint. The default policy allows full access.
Using the VPC gateway endpoint allows the Amazon EC2 instances to reach Amazon S3 without using the public internet. Since the data transfer remains within the same AWS region, so there is no data transfer costs for ingress as well as egress traffic. Hence this is the most cost-optimal solution.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Provision an internet gateway. Update the route table in the private subnet to route traffic to the internet gateway. Update the network ACL (NACL) to allow the S3-bound traffic**:
  If a subnet is associated with a route table that has a route to an internet gateway, it's known as a public subnet. If a subnet is associated with a route table that does not have a route to an internet gateway, it's known as a private subnet. This option has been added as a distractor as adding a route to the internet gateway in the route table associated with the private subnet would make the subnet public. This would also make the internet-bound routing to the NAT gateway redundant.

- **Set up an egress-only internet gateway in the public subnet. Update the route table in the private subnet to route traffic to the internet gateway. Update the network ACL to allow the S3-bound traffic**:
  An egress-only internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows outbound communication over IPv6 from instances in your VPC to the internet, and prevents the internet from initiating an IPv6 connection with your instances. Since the use case talks about only IPv4 traffic, so this option is incorrect.

- **Set up a Gateway Load Balancer (GWLB) endpoint for Amazon S3. Update the route table in the private subnet to direct the S3-bound traffic via the Gateway Load Balancer (GWLB) endpoint**:
  Gateway Load Balancers use Gateway Load Balancer endpoints to securely exchange traffic across VPC boundaries. You cannot set up a gateway load balancer endpoint to access Amazon S3. This option has been added as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - gateway endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/gateway-endpoints.html)
- 🌐 [AWS Service Overview: premiumsupport](https://aws.amazon.com/premiumsupport/knowledge-center/vpc-reduce-nat-gateway-transfer-costs/)
- 🌐 [AWS Docs: vpc - vpce gateway load balancer](https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway-load-balancer.html)
- 🌐 [AWS Docs: vpc - egress only internet gateway](https://docs.aws.amazon.com/vpc/latest/userguide/egress-only-internet-gateway.html)

</details>

---

<div id="question-26"></div>

### Question 26: Dynamic Autoscaling for Amazon ECS Tasks based on Target Tracking Utilization Metrics
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A healthcare company has deployed its web application on Amazon Elastic Container Service (Amazon ECS) container instances running behind an Application Load Balancer. The website slows down when the traffic spikes and the website availability is also reduced. The development team has configured Amazon CloudWatch alarms to receive notifications whenever there is an availability constraint so the team can scale out resources. The company wants an automated solution to respond to such events.

Which of the following addresses the given use case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the ECS service's CPU utilization rises above a threshold `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the CloudWatch alarm's CPU utilization rises above a threshold
- **(C)** Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the Application Load Balancer's target group's CPU utilization rises above a threshold
- **(D)** Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the Application Load Balancer's CPU utilization rises above a threshold

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You use the Amazon ECS first-run wizard to create a cluster and a service that runs behind an Elastic Load Balancing load balancer. Then you can configure a target tracking scaling policy that scales your service automatically based on the current application load as measured by the service's CPU utilization (from the ECS, ClusterName, and ServiceName category in CloudWatch).
When the average CPU utilization of your service rises above 75% (meaning that more than 75% of the CPU that is reserved for the service is being used), a scale out alarm triggers Service Auto Scaling to add another task to your service to help out with the increased load. Conversely, when the average CPU utilization of your service drops below the target utilization for a sustained period, a scale-in alarm triggers a decrease in the service's desired count to free up those cluster resources for other tasks and services.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the Application Load Balancer's target group's CPU utilization rises above a threshold

- Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the Application Load Balancer's CPU utilization rises above a threshold

- Configure AWS Auto Scaling to scale out the Amazon ECS cluster when the CloudWatch alarm's CPU utilization rises above a threshold These three options contradict the explanation provided above, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonECS - service autoscaling targettracking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-autoscaling-targettracking.html)
- 🌐 [AWS Docs: AmazonECS - service configure auto scaling](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-configure-auto-scaling.html)

</details>

---

<div id="question-27"></div>

### Question 27: Amazon CloudWatch EC2 Auto-Recovery Characteristics: Preserving IP, Metadata, and Storage
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (E) | **Đáp án đúng**: (A), (E)

#### 📋 Đề bài (Scenario)
The engineering team at a social media company wants to use Amazon CloudWatch alarms to automatically recover Amazon EC2 instances if they become impaired. The team has hired you as a solutions architect to provide subject matter expertise.

As a solutions architect, which of the following statements would you identify as CORRECT regarding this automatic recovery process? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** A recovered instance is identical to the original instance, including the instance ID, private IP addresses, Elastic IP addresses, and all instance metadata `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Terminated Amazon EC2 instances can be recovered if they are configured at the launch of instance
- **(C)** If your instance has a public IPv4 address, it does not retain the public IPv4 address after recovery
- **(D)** During instance recovery, the instance is migrated during an instance reboot, and any data that is in-memory is retained
- **(E)** If your instance has a public IPv4 address, it retains the public IPv4 address after recovery `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You can create an Amazon CloudWatch alarm to automatically recover the Amazon EC2 instance if it becomes impaired due to an underlying hardware failure or a problem that requires AWS involvement to repair. Terminated instances cannot be recovered. A recovered instance is identical to the original instance, including the instance ID, private IP addresses, Elastic IP addresses, and all instance metadata. If the impaired instance is in a placement group, the recovered instance runs in the placement group. If your instance has a public IPv4 address, it retains the public IPv4 address after recovery. During instance recovery, the instance is migrated during an instance reboot, and any data that is in-memory is lost.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Terminated Amazon EC2 instances can be recovered if they are configured at the launch of instance**:
  This is incorrect as terminated instances cannot be recovered.

- **During instance recovery, the instance is migrated during an instance reboot, and any data that is in-memory is retained**:
  As mentioned above, during instance recovery, the instance is migrated during an instance reboot, and any data that is in-memory is lost.

- **If your instance has a public IPv4 address, it does not retain the public IPv4 address after recovery**:
  As mentioned above, if your instance has a public IPv4 address, it retains the public IPv4 address after recovery.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - ec2 instance recover](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-recover.html)

</details>

---

<div id="question-28"></div>

### Question 28: Accelerating Global Game Asset Downloads with Amazon CloudFront and S3 Origin
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An online gaming application has a large chunk of its traffic coming from users who download static assets such as historic leaderboard reports and the game tactics for various games. The current infrastructure and design are unable to cope up with the traffic and application freezes on most of the pages.

Which of the following is a cost-optimal solution that does not need provisioning of infrastructure?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon CloudFront with Amazon S3 as the storage solution for the static assets `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use AWS Lambda with Amazon ElastiCache and Amazon RDS for serving static assets at high speed and low latency
- **(C)** Configure AWS Lambda with an Amazon RDS database to provide a serverless architecture
- **(D)** Use Amazon CloudFront with Amazon DynamoDB for greater speed and low latency access to static assets

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
When you put your content in an Amazon S3 bucket in the cloud, a lot of things become much easier. First, you don’t need to plan for and allocate a specific amount of storage space because Amazon S3 buckets scale automatically. As Amazon S3 is a serverless service, you don’t need to manage or patch servers that store files yourself; you just put and get your content. Finally, even if you require a server for your application (for example, because you have a dynamic application), the server can be smaller because it doesn’t have to handle requests for static content.
Amazon CloudFront is a content delivery network (CDN) service that delivers static and dynamic web content, video streams, and APIs around the world, securely and at scale. By design, delivering data out of Amazon CloudFront can be more cost-effective than delivering it from Amazon S3 directly to your users. Amazon CloudFront serves content through a worldwide network of data centers called Edge Locations. Using edge servers to cache and serve content improves performance by providing content closer to where viewers are located.
When a user requests content that you serve with Amazon CloudFront, their request is routed to a nearby Edge Location. If Amazon CloudFront has a cached copy of the requested file, CloudFront delivers it to the user, providing a fast (low-latency) response. If the file they’ve requested isn’t yet cached, CloudFront retrieves it from your origin – for example, the Amazon S3 bucket where you’ve stored your content. Then, for the next local request for the same content, it’s already cached nearby and can be served immediately.
By caching your content in Edge Locations, Amazon CloudFront reduces the load on your Amazon S3 bucket and helps ensure a faster response for your users when they request content. Also, data transfer out for content by using Amazon CloudFront is often more cost-effective than serving files directly from Amazon S3, and there is no data transfer fee from Amazon S3 to Amazon CloudFront. You only pay for what is delivered to the internet from Amazon CloudFront, plus request fees.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure AWS Lambda with an Amazon RDS database to provide a serverless architecture**:
  Amazon RDS is not the right choice for the current scenario because of the overhead of a database management system, as the given use-case can be addressed by using Amazon S3 storage solution.

- **Use Amazon CloudFront with Amazon DynamoDB for greater speed and low latency access to static assets**:
  Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale. But, Amazon DynamoDB is overkill for the given use-case and will prove to be a very costly solution.

- **Use AWS Lambda with Amazon ElastiCache and Amazon RDS for serving static assets at high speed and low latency**:
  As discussed above, Amazon RDS is not needed for this use case where web application needs to display static pages and facilitate downloads of historic data. Amazon S3 is much better suited for this requirement.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: amazon s3 amazon cloudfront a match made in the cloud](https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/)

</details>

---

<div id="question-29"></div>

### Question 29: Stateful vs Stateless Traffic Filtering: Security Groups vs Network Access Control Lists (NACL)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A developer has configured inbound traffic for the relevant ports in both the Security Group of the Amazon EC2 instance as well as the Network Access Control List (Network ACL) of the subnet for the Amazon EC2 instance. The developer is, however, unable to connect to the service running on the Amazon EC2 instance.

As a solutions architect, how will you fix this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Security Groups are stateful, so allowing inbound traffic to the necessary ports enables the connection. Network ACLs are stateless, so you must allow both inbound and outbound traffic `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Rules associated with Network ACLs should never be modified from command line. An attempt to modify rules from command line blocks the rule and results in an erratic behavior
- **(C)** Network ACLs are stateful, so allowing inbound traffic to the necessary ports enables the connection. Security Groups are stateless, so you must allow both inbound and outbound traffic
- **(D)** IAM Role defined in the Security Group is different from the IAM Role that is given access in the Network ACLs

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Security groups are stateful, so allowing inbound traffic to the necessary ports enables the connection. Network ACLs are stateless, so you must allow both inbound and outbound traffic.
To enable the connection to a service running on an instance, the associated network ACL must allow both inbound traffic on the port that the service is listening on as well as allow outbound traffic from ephemeral ports. When a client connects to a server, a random port from the ephemeral port range (1024-65535) becomes the client's source port.
The designated ephemeral port then becomes the destination port for return traffic from the service, so outbound traffic from the ephemeral port must be allowed in the network ACL.
By default, network ACLs allow all inbound and outbound traffic. If your network ACL is more restrictive, then you need to explicitly allow traffic from the ephemeral port range.
If you accept traffic from the internet, then you also must establish a route through an internet gateway. If you accept traffic over VPN or AWS Direct Connect, then you must establish a route through a virtual private gateway (VGW).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Network ACLs are stateful, so allowing inbound traffic to the necessary ports enables the connection. Security Groups are stateless, so you must allow both inbound and outbound traffic**:
  This is incorrect as already discussed.

- **IAM Role defined in the Security Group is different from the IAM Role that is given access in the Network ACLs**:
  This is a made-up option and just added as a distractor.

- **Rules associated with Network ACLs should never be modified from command line. An attempt to modify rules from command line blocks the rule and results in an erratic behavior**:
  This option is a distractor. AWS does not support modifying rules of Network ACLs from the command line tool.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: premiumsupport](https://aws.amazon.com/premiumsupport/knowledge-center/resolve-connection-sg-acl-inbound/)

</details>

---

<div id="question-30"></div>

### Question 30: Automated Multi-Account CloudFormation Template Deployment using CloudFormation StackSets
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has set up AWS Organizations to manage several departments running their own AWS accounts. The departments operate from different countries and are spread across various AWS Regions. The company wants to set up a consistent resource provisioning process across departments so that each resource follows pre-defined configurations such as using a specific type of Amazon EC2 instances, specific IAM roles for AWS Lambda functions, etc.

As a solutions architect, which of the following options would you recommend for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS CloudFormation stacks to deploy the same template across AWS accounts and regions
- **(B)** Use AWS CloudFormation templates to deploy the same template across AWS accounts and regions
- **(C)** Use AWS CloudFormation StackSets to deploy the same template across AWS accounts and regions `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use AWS Resource Access Manager (AWS RAM) to deploy the same template across AWS accounts and regions

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS CloudFormation StackSet extends the functionality of stacks by enabling you to create, update, or delete stacks across multiple accounts and regions with a single operation. A stack set lets you create stacks in AWS accounts across regions by using a single AWS CloudFormation template. Using an administrator account of an "AWS Organization", you define and manage an AWS CloudFormation template, and use the template as the basis for provisioning stacks into selected target accounts of an "AWS Organization" across specified regions.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS CloudFormation templates to deploy the same template across AWS accounts and regions**:
  AWS Cloudformation template is a JSON or YAML-format, text-based file that describes all the AWS resources you need to deploy to run your application. A template acts as a blueprint for a stack. AWS CloudFormation templates cannot be used to deploy the same template across AWS accounts and regions.

- **Use AWS CloudFormation stacks to deploy the same template across AWS accounts and regions**:
  AWS CloudFormation stack is a set of AWS resources that are created and managed as a single unit when AWS CloudFormation instantiates a template. A stack cannot be used to deploy the same template across AWS accounts and regions.

- **Use AWS Resource Access Manager (AWS RAM) to deploy the same template across AWS accounts and regions**:
  AWS Resource Access Manager (AWS RAM) is a service that enables you to easily and securely share AWS resources with any AWS account or within your AWS Organization. Resource Access Manager cannot be used to deploy the same template across AWS accounts and regions.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSCloudFormation - stacksets concepts](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html)
- 🌐 [AWS Docs: AWSCloudFormation - cfn whatis howdoesitwork](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-whatis-howdoesitwork.html)

</details>

---

<div id="question-31"></div>

### Question 31: Hybrid Multi-VPC Routing via AWS Direct Connect Transit VIF and Transit Gateway
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (B), (C)

#### 📋 Đề bài (Scenario)
A national logistics company has a dedicated AWS Direct Connect connection from its corporate data center to AWS. Within its AWS account, the company operates 25 Amazon VPCs in the same Region, each supporting different regional distribution services. The VPCs were configured with non-overlapping CIDR blocks and currently use private VIFs for Direct Connect access to on-premises resources. As the architecture scales, the company wants to enable communication across all VPCs and the on-premises environment. The solution must scale efficiently, support full-mesh connectivity, and reduce the complexity of maintaining separate private VIFs for each VPC.

Which combination of solutions will best fulfill these requirements with the least amount of operational overhead? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create individual Site-to-Site VPN connections from the data center to each VPC. Set up BGP route propagation for every tunnel to facilitate on-premises-to-VPC routing
- **(B)** Create a transit virtual interface (VIF) from the Direct Connect connection and associate it with the transit gateway `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create an AWS Transit Gateway and attach all 25 VPCs to it. Enable route propagation for each attachment to automatically manage inter-VPC routing `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Reconfigure each VPC to connect through AWS PrivateLink endpoints to a central networking service VPC. Share the service with other VPCs using VPC endpoint services
- **(E)** Convert each existing private VIF into a new Direct Connect gateway association by attaching a virtual private gateway (VGW) to each VPC. Manually configure routing between VGWs

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Attaching all VPCs to a single AWS Transit Gateway centralizes routing and allows for transitive communication between the VPCs. Enabling route propagation eliminates the need to manually update route tables for every VPC. This design supports scalable, full-mesh VPC connectivity with low operational burden.
Using a transit VIF from the Direct Connect connection to the transit gateway enables on-premises-to-VPC connectivity through a single, centralized path. This eliminates the need to maintain multiple private VIFs and simplifies BGP management and route aggregation. Combined, this forms a highly efficient hub-and-spoke architecture.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create individual Site-to-Site VPN connections from the data center to each VPC. Set up BGP route propagation for every tunnel to facilitate on-premises-to-VPC routing**:
  Creating 25 individual VPN connections adds significant operational complexity, introduces higher latency, and does not make use of the existing high-throughput Direct Connect connection. While VPNs can provide connectivity, they are inferior in performance and scalability for this use case.

- **Reconfigure each VPC to connect through AWS PrivateLink endpoints to a central networking service VPC. Share the service with other VPCs using VPC endpoint services**:
  AWS PrivateLink is used to expose services privately, not to enable full VPC-to-VPC or on-premises routing. It supports one-way access to a specific service, and cannot be used to facilitate general network-level communication between all VPCs and the data center.

- **Convert each existing private VIF into a new Direct Connect gateway association by attaching a virtual private gateway (VGW) to each VPC. Manually configure routing between VGWs**:
  While a Direct Connect gateway allows centralized on-premises access, it does not support transitive routing between VPCs. You would also need to deploy and manage 25 separate virtual private gateways (VGWs), which increases complexity and operational burden. Inter-VPC communication would still require peering or another layer of routing.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: transit-gateway](https://aws.amazon.com/transit-gateway/)
- 🌐 [AWS Docs: directconnect - WorkingWithVirtualInterfaces](https://docs.aws.amazon.com/directconnect/latest/UserGuide/WorkingWithVirtualInterfaces.html)
- 🌐 [AWS Docs: directconnect - Welcome](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html)
- 🌐 [AWS Docs: whitepapers - aws dx dxgw with vgw multi regions and aws public peering](https://docs.aws.amazon.com/whitepapers/latest/hybrid-connectivity/aws-dx-dxgw-with-vgw-multi-regions-and-aws-public-peering.html)

</details>

---

<div id="question-32"></div>

### Question 32: Decoupling Large File Uploads from Asynchronous Thumbnail Processing via S3 Events and SQS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A data analytics company manages an application that stores user data in a Amazon DynamoDB table. The development team has observed that once in a while, the application writes corrupted data in the Amazon DynamoDB table. As soon as the issue is detected, the team needs to remove the corrupted data at the earliest.

What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon DynamoDB Streams to restore the table to the state just before corrupted data was written
- **(B)** Use Amazon DynamoDB point in time recovery to restore the table to the state just before corrupted data was written `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon DynamoDB on-demand backup to restore the table to the state just before corrupted data was written
- **(D)** Configure the Amazon DynamoDB table as a global table and point the application to use the table from another AWS region that has no corrupted data

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon DynamoDB enables you to back up your table data continuously by using point-in-time recovery (PITR). When you enable PITR, DynamoDB backs up your table data automatically with per-second granularity so that you can restore to any given second in the preceding 35 days.
PITR helps protect you against accidental writes and deletes. For example, if a test script writes accidentally to a production DynamoDB table or someone mistakenly issues a "DeleteItem" call, PITR has you covered.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon DynamoDB on-demand backup to restore the table to the state just before corrupted data was written**:
  On-demand backup is created upon request. So this option is not correct since an on-demand backup cannot be created pre-emptively to handle data corruption issues that happen once in a while.

- **Configure the Amazon DynamoDB table as a global table and point the application to use the table from another AWS region that has no corrupted data**:
  Global tables build on the global Amazon DynamoDB footprint to provide you with a fully managed, multi-Region, and multi-active database that delivers fast, local, read and write performance for massively scaled, global applications. Any changes made to any item in any replica table are replicated to all the other replicas within the same global table. This option has been added as a distractor since you cannot point the application to use the table from another AWS region, since there is no "other" table in another region. It's just a single logical Global table.

- **Use Amazon DynamoDB Streams to restore the table to the state just before corrupted data was written**:
  Amazon DynamoDB Streams captures a time-ordered sequence of item-level modifications in any Amazon DynamoDB table and stores this information in a log for up to 24 hours. It will take considerable effort and custom coding to reliably rebuild table data to the state just before any corrupted data was written. So this option is not the best fit.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: amazondynamodb - BackupRestore](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/BackupRestore.html)
- 🌐 [AWS Docs: amazondynamodb - PointInTimeRecovery_Howitworks](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/PointInTimeRecovery_Howitworks.html)
- 🌐 [AWS Service Overview: dynamodb](https://aws.amazon.com/dynamodb/global-tables/)
- 🌐 [AWS Docs: amazondynamodb - Streams](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html)

</details>

---

<div id="question-33"></div>

### Question 33: Cost-Effective Predictable Access Storage Tiering using Amazon S3 Standard-IA
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An engineering team wants to orchestrate multiple Amazon ECS task types running on Amazon EC2 instances that are part of the Amazon ECS cluster. The output and state data for all tasks need to be stored. The amount of data output by each task is approximately 20 megabytes and there could be hundreds of tasks running at a time. As old outputs are archived, the storage size is not expected to exceed 1 terabyte.

As a solutions architect, which of the following would you recommend as an optimized solution for high-frequency reading and writing?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EFS with Bursting Throughput mode
- **(B)** Use Amazon DynamoDB table that is accessible by all ECS cluster instances
- **(C)** Use Amazon EFS with Provisioned Throughput mode `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use an Amazon EBS volume mounted to the Amazon ECS cluster instances

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EFS file systems are distributed across an unconstrained number of storage servers. This distributed data storage design enables file systems to grow elastically to petabyte scale. It also enables massively parallel access from compute instances, including Amazon EC2, Amazon ECS, and AWS Lambda, to your data.
Provisioned Throughput mode is available for applications with high throughput to storage (MiB/s per TiB) ratios, or with requirements greater than those allowed by the Bursting Throughput mode. For example, say you're using Amazon EFS for development tools, web serving, or content management applications where the amount of data in your file system is low relative to throughput demands. Your file system can now get the high levels of throughput your applications require without having to pad your file system.
If your file system is in the Provisioned Throughput mode, you can increase the Provisioned Throughput of your file system as often as you want. You can decrease your file system throughput in Provisioned Throughput mode as long as it's been more than 24 hours since the last decrease. Additionally, you can change between Provisioned Throughput mode and the default Bursting Throughput mode as long as it’s been more than 24 hours since the last throughput mode change.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EFS with Bursting Throughput mode**:
  With Bursting Throughput mode, a file system's throughput scales as the amount of data stored in the standard storage class grows. The use-case mentions that the solution should be optimized for high-frequency reading and writing even when the old outputs are archived, therefore Provisioned Throughput mode is a better fit as it guarantees high levels of throughput your applications require without having to pad your file system.

- **Use an Amazon EBS volume mounted to the Amazon ECS cluster instances**:
  Amazon EFS has a higher throughput than Amazon EBS. In addition, Amazon EBS can be attached to multiple Amazon EC2 instances when the underlying EBS type is io1/io2 and the instance is of Nitro type. The use-case does not provide any such details, so this option is ruled out.

- **Use Amazon DynamoDB table that is accessible by all ECS cluster instances**:
  Amazon DynamoDB is not a fit for this scenario as each task output is 20 MB but the storage limit for each item in a Amazon DynamoDB table is 400 KB. You could write custom code to split the task output data into multiple items but it is not an optimal solution compared to using Amazon EFS in Provisioned Throughput mode.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: efs - performance](https://docs.aws.amazon.com/efs/latest/ug/performance.html)
- 🌐 [AWS Docs: amazondynamodb - Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html#limits-items)

</details>

---

<div id="question-34"></div>

### Question 34: Managing Active Directory Workloads with AWS Directory Service for Microsoft AD
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An application running on an Amazon EC2 instance needs to access a Amazon DynamoDB table in the same AWS account.

Which of the following solutions should a solutions architect configure for the necessary permissions?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an IAM user with the appropriate permissions to allow access to the Amazon DynamoDB table. Store the access credentials in the local storage and read them from within the application code directly
- **(B)** Set up an IAM user with the appropriate permissions to allow access to the Amazon DynamoDB table. Store the access credentials in an Amazon S3 bucket and read them from within the application code directly
- **(C)** Set up an IAM service role with the appropriate permissions to allow access to the Amazon DynamoDB table. Add the Amazon EC2 instance to the trust relationship policy document so that the instance can assume the role
- **(D)** Set up an IAM service role with the appropriate permissions to allow access to the Amazon DynamoDB table. Configure an instance profile to assign this IAM role to the Amazon EC2 instance `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A service role is an IAM role that a service assumes to perform actions on your behalf. Service roles provide access only within your account and cannot be used to grant access to services in other accounts. An IAM administrator can create, modify, and delete a service role from within IAM. When you create the service role, you define the trusted entity in the definition.
If you are going to use the role with Amazon EC2 or another AWS service that uses Amazon EC2, you must store the role in an instance profile. An instance profile is a container for a role that can be attached to an Amazon EC2 instance when launched. An instance profile can contain only one role, and that limit cannot be increased. If you create the role using the AWS Management Console, the instance profile is created for you with the same name as the role.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Set up an IAM user with the appropriate permissions to allow access to the Amazon DynamoDB table. Store the access credentials in an Amazon S3 bucket and read them from within the application code directly

- Set up an IAM user with the appropriate permissions to allow access to the Amazon DynamoDB table. Store the access credentials in the local storage and read them from within the application code directly You should never store the IAM access credentials for a user in Amazon S3 or local storage or a database. It's a security bad practice. It is always recommended to use IAM roles to configure access to other AWS resources from Amazon EC2 instances. Therefore both these options are incorrect.

- **Set up an IAM service role with the appropriate permissions to allow access to the Amazon DynamoDB table. Add the Amazon EC2 instance to the trust relationship policy document so that the instance can assume the role**:
  There is no need for this option because when you create an IAM service role for Amazon EC2, the role automatically has Amazon EC2 identified as a trusted entity. Therefore this option is not correct.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: IAM - id_roles_create_for service](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-service.html)
- 🌐 [AWS Docs: AWSEC2 - iam roles for amazon ec2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html)

</details>

---

<div id="question-35"></div>

### Question 35: Sub-Millisecond In-Memory Caching for Real-Time Gaming Leaderboards using ElastiCache Redis
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (D) | **Đáp án đúng**: (A), (D)

#### 📋 Đề bài (Scenario)
A company wants to improve its gaming application by adding a leaderboard that uses a complex proprietary algorithm based on the participating user's performance metrics to identify the top users on a real-time basis. The technical requirements mandate high elasticity, low latency, and real-time processing to deliver customizable user data for the community of users. The leaderboard would be accessed by millions of users simultaneously.

Which of the following options support the case for using Amazon ElastiCache to meet the given requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon ElastiCache to improve the performance of compute-intensive workloads `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon ElastiCache to improve the performance of Extract-Transform-Load (ETL) workloads
- **(C)** Use Amazon ElastiCache to run highly complex JOIN queries
- **(D)** Use Amazon ElastiCache to improve latency and throughput for read-heavy application workloads `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Use Amazon ElastiCache to improve latency and throughput for write-heavy application workloads

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon ElastiCache allows you to run in-memory data stores in the AWS cloud. Amazon ElastiCache is a popular choice for real-time use cases like Caching, Session Stores, Gaming, Geospatial Services, Real-Time Analytics, and Queuing.
Amazon ElastiCache can be used to significantly improve latency and throughput for many read-heavy application workloads (such as social networking, gaming, media sharing, leaderboard, and Q&A portals) or compute-intensive workloads (such as a recommendation engine) by allowing you to store the objects that are often read in the cache.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon ElastiCache to improve latency and throughput for write-heavy application workloads**:
  Amazon ElastiCache can be used to significantly improve latency and throughput for many read-heavy application workloads. Caching is not a good fit for write-heavy applications as the cache goes stale at a very fast rate.

- **Use Amazon ElastiCache to improve the performance of Extract-Transform-Load (ETL) workloads**:
  ETL workloads involve reading and transforming high-volume data which is not a good fit for caching. You should use AWS Glue or Amazon EMR to facilitate ETL workloads.

- **Use Amazon ElastiCache to run highly complex JOIN queries**:
  Complex JOIN queries can be run on relational databases such as Amazon RDS or Amazon Aurora. Amazon ElastiCache is not a good fit for this use case.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonElastiCache - elasticache use cases](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/elasticache-use-cases.html)
- 🌐 [AWS Service Overview: elasticache](https://aws.amazon.com/elasticache/features/)

</details>

---

<div id="question-36"></div>

### Question 36: Secure Hybrid IPsec VPN Connection using Virtual Private Gateway (VGW) and Customer Gateway
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A retail organization is moving some of its on-premises data to AWS Cloud. The DevOps team at the organization has set up an AWS Managed IPSec VPN Connection between their remote on-premises network and their Amazon VPC over the internet.

Which of the following represents the correct configuration for the IPSec VPN Connection?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a virtual private gateway (VGW) on both the AWS side of the VPN as well as the on-premises side of the VPN
- **(B)** Create a virtual private gateway (VGW) on the AWS side of the VPN and a Customer Gateway on the on-premises side of the VPN `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a virtual private gateway (VGW) on the on-premises side of the VPN and a Customer Gateway on the AWS side of the VPN
- **(D)** Create a Customer Gateway on both the AWS side of the VPN as well as the on-premises side of the VPN

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon VPC provides the facility to create an IPsec VPN connection (also known as AWS site-to-site VPN) between remote customer networks and their Amazon VPC over the internet. The following are the key concepts for a site-to-site VPN:
Virtual private gateway: A virtual private gateway (VGW), also known as a VPN Gateway is the endpoint on the AWS VPC side of your VPN connection.
VPN connection: A secure connection between your on-premises equipment and your VPCs.
VPN tunnel: An encrypted link where data can pass from the customer network to or from AWS.
Customer Gateway: An AWS resource that provides information to AWS about your Customer Gateway device.
Customer Gateway device: A physical device or software application on the customer side of the Site-to-Site VPN connection.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Create a virtual private gateway (VGW) on the on-premises side of the VPN and a Customer Gateway on the AWS side of the VPN

- Create a Customer Gateway on both the AWS side of the VPN as well as the on-premises side of the VPN

- Create a virtual private gateway (VGW) on both the AWS side of the VPN as well as the on-premises side of the VPN You need to create a virtual private gateway (VGW) on the AWS side of the VPN and a Customer Gateway on the on-premises side of the VPN. Therefore, these options are wrong.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: whitepapers - aws managed vpn network to amazon](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-managed-vpn-network-to-amazon.html)
- 🌐 [AWS Docs: vpn - VPC_VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)

</details>

---

<div id="question-37"></div>

### Question 37: Proactive Enterprise DDoS Mitigation and 24/7 Response Team with AWS Shield Advanced
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A regional transportation authority operates a high-traffic public information portal hosted on AWS. The backend consists of Amazon EC2 instances behind an Application Load Balancer (ALB). In recent weeks, the operations team has observed intermittent slowdowns and performance issues. After investigation, the team suspect the application is being targeted by distributed denial-of-service (DDoS) attacks coming from a wide range of IP addresses. The team needs a solution that provides DDoS mitigation, detailed logs for audit purposes, and requires minimal changes to the existing architecture.

Which solution best addresses these needs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Subscribe to AWS Shield Advanced to gain proactive DDoS protection. Engage the AWS DDoS Response Team (DRT) to analyze traffic patterns and apply mitigations. Use the built-in logging and reporting to maintain an audit trail of detected events `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable Amazon Inspector for the EC2 instances. Use its vulnerability findings to detect potential DDoS attack vectors and patch the EC2 environments accordingly
- **(C)** Create an Amazon CloudFront distribution in front of the ALB. Enable AWS WAF on the distribution and configure custom rules to filter traffic from known malicious IP ranges and geographies. Use CloudFront access logs for analysis
- **(D)** Deploy Amazon GuardDuty and integrate with the EC2 environment. Use GuardDuty findings to manually block suspected IP addresses at the ALB level or within EC2 security groups

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Shield Advanced provides advanced, always-on DDoS protection for resources like ALBs, CloudFront, and Route 53. It includes detailed telemetry, real-time detection, automated application-layer DDoS mitigation, and most importantly, access to the AWS DDoS Response Team (DRT). The DRT can assist with rule creation and response during active events. Shield Advanced also supports detailed logging and event reports through AWS CloudWatch and AWS WAF logs, enabling complete auditing of DDoS attempts.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon GuardDuty and integrate with the EC2 environment. Use GuardDuty findings to manually block suspected IP addresses at the ALB level or within EC2 security groups**:
  While Amazon GuardDuty can detect anomalies and suspicious activity across your AWS environment, it is not designed for real-time DDoS mitigation. It identifies threats such as reconnaissance or credential exfiltration, not volume-based attacks. It also lacks native integration with ALB to automatically block high-volume attacks. Any mitigation must be manually scripted or reactive, which increases operational complexity.

- **Enable Amazon Inspector for the EC2 instances. Use its vulnerability findings to detect potential DDoS attack vectors and patch the EC2 environments accordingly**:
  Amazon Inspector focuses on vulnerability scanning and application security assessment for EC2 instances and container workloads. It does not detect or prevent network-layer attacks like DDoS. Although it helps improve overall security posture, it does nothing to address volumetric or bot-based attacks, making it irrelevant for this scenario.

- **Create an Amazon CloudFront distribution in front of the ALB. Enable AWS WAF on the distribution and configure custom rules to filter traffic from known malicious IP ranges and geographies. Use CloudFront access logs for analysis**:
  Placing Amazon CloudFront in front of the ALB and using AWS WAF for traffic filtering can improve latency and offer some DDoS protection, especially at Layer 7. However, this introduces architectural changes that may require reworking DNS, caching logic, and content delivery behavior. It also does not offer access to the DDoS Response Team (DRT) or the automated event-based analytics provided by Shield Advanced. This option increases operational complexity and does not meet the goal of minimal architectural disruption.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: category](https://aws.amazon.com/blogs/aws/category/aws-shield/)
- 🌐 [AWS Docs: waf - ddos overview](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html)
- 🌐 [AWS Docs: guardduty - what is guardduty](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html)
- 🌐 [AWS Docs: inspector - what is inspector](https://docs.aws.amazon.com/inspector/latest/user/what-is-inspector.html)
- 🌐 [AWS Docs: waf - waf chapter](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html)

</details>

---

<div id="question-38"></div>

### Question 38: Shared POSIX Multi-User Storage for Windows Workloads using FSx for Windows File Server
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An IT company hosts windows based applications on its on-premises data center. The company is looking at moving the business to the AWS Cloud. The cloud solution should offer shared storage space that multiple applications can access without a need for replication. Also, the solution should integrate with the company's self-managed Active Directory domain.

Which of the following solutions addresses these requirements with the minimal integration effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Elastic File System (Amazon EFS) as a shared storage solution
- **(B)** Use File Gateway of AWS Storage Gateway to create a hybrid storage solution
- **(C)** Use Amazon FSx for Lustre as a shared storage solution with millisecond latencies
- **(D)** Use Amazon FSx for Windows File Server as a shared storage solution `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for Windows File Server provides fully managed, highly reliable, and scalable file storage that is accessible over the industry-standard Server Message Block (SMB) protocol. It is built on Windows Server, delivering a wide range of administrative features such as user quotas, end-user file restore, and Microsoft Active Directory (AD) integration. It offers single-AZ and multi-AZ deployment options, fully managed backups, and encryption of data at rest and in transit. You can optimize cost and performance for your workload needs with SSD and HDD storage options; and you can scale storage and change the throughput performance of your file system at any time.
With Amazon FSx, you get highly available and durable file storage starting from $0.013 per GB-month. Data deduplication enables you to optimize costs even further by removing redundant data. You can increase your file system storage and scale throughput capacity at any time, making it easy to respond to changing business needs. There are no upfront costs or licensing fees.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use File Gateway of AWS Storage Gateway to create a hybrid storage solution**:
  AWS Storage Gateway connects an on-premises software appliance with cloud-based storage to provide seamless integration between your on-premises IT environment and the AWS storage infrastructure. Storage Gateway uses Amazon S3 to store data on AWS Cloud and from here the on-premises data can seamlessly integrate with Cloud services. It is not suited to be used as a shared storage space that multiple applications can access in parallel.

- **Use Amazon FSx for Lustre as a shared storage solution with millisecond latencies**:
  Amazon FSx for Lustre is a fully managed service that provides cost-effective, high-performance storage for compute workloads. Lustre is Linux based, hence it is not the right choice since the use case is about Windows-based applications.

- **Use Amazon Elastic File System (Amazon EFS) as a shared storage solution**:
  Amazon Elastic File System (Amazon EFS) provides a simple, scalable, fully managed elastic NFS file system for use with AWS Cloud services and on-premises resources. Amazon EFS is compatible with only Linux-based AMIs for Amazon EC2.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: fsx](https://aws.amazon.com/fsx/windows/)

</details>

---

<div id="question-39"></div>

### Question 39: Elastic Load Balancing (ELB) Cross-Zone Load Balancing Traffic Distribution Mechanics
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An e-commerce company is using Elastic Load Balancing (ELB) for its fleet of Amazon EC2 instances spread across two Availability Zones (AZs), with one instance as a target in Availability Zone A and four instances as targets in Availability Zone B. The company is doing benchmarking for server performance when cross-zone load balancing is enabled compared to the case when cross-zone load balancing is disabled.

As a solutions architect, which of the following traffic distribution outcomes would you identify as correct?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** With cross-zone load balancing enabled, one instance in Availability Zone A receives 20% traffic and four instances in Availability Zone B receive 20% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives no traffic and four instances in Availability Zone B receive 25% traffic each
- **(B)** With cross-zone load balancing enabled, one instance in Availability Zone A receives 20% traffic and four instances in Availability Zone B receive 20% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives 50% traffic and four instances in Availability Zone B receive 12.5% traffic each `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** With cross-zone load balancing enabled, one instance in Availability Zone A receives 50% traffic and four instances in Availability Zone B receive 12.5% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives 20% traffic and four instances in Availability Zone B receive 20% traffic each
- **(D)** With cross-zone load balancing enabled, one instance in Availability Zone A receives no traffic and four instances in Availability Zone B receive 25% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives 50% traffic and four instances in Availability Zone B receive 12.5% traffic each

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The nodes for your load balancer distribute requests from clients to registered targets. When cross-zone load balancing is enabled, each load balancer node distributes traffic across the registered targets in all enabled Availability Zones. Therefore, one instance in Availability Zone A receives 20% traffic and four instances in Availability Zone B receive 20% traffic each. When cross-zone load balancing is disabled, each load balancer node distributes traffic only across the registered targets in its Availability Zone. Therefore, one instance in Availability Zone A receives 50% traffic and four instances in Availability Zone B receive 12.5% traffic each.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- With cross-zone load balancing enabled, one instance in Availability Zone A receives 50% traffic and four instances in Availability Zone B receive 12.5% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives 20% traffic and four instances in Availability Zone B receive 20% traffic each

- With cross-zone load balancing enabled, one instance in Availability Zone A receives no traffic and four instances in Availability Zone B receive 25% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives 50% traffic and four instances in Availability Zone B receive 12.5% traffic each

- With cross-zone load balancing enabled, one instance in Availability Zone A receives 20% traffic and four instances in Availability Zone B receive 20% traffic each. With cross-zone load balancing disabled, one instance in Availability Zone A receives no traffic and four instances in Availability Zone B receive 25% traffic each These three options contradict the details provided in the explanation above, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: elasticloadbalancing - how elastic load balancing works](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html)

</details>

---

<div id="question-40"></div>

### Question 40: Restricting S3 Public Access and Caching Static Training Assets with CloudFront OAI
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An IT training company hosted its website on Amazon S3 a couple of years ago. Due to COVID-19 related travel restrictions, the training website has suddenly gained traction. With an almost 300% increase in the requests served per day, the company's AWS costs have sky-rocketed for just the Amazon S3 outbound data costs.

As a Solutions Architect, can you suggest an alternate method to reduce costs while keeping the latency low?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EFS service, as it provides a shared, scalable, fully managed elastic NFS file system for storing AWS Cloud or on-premises data
- **(B)** Configure Amazon S3 Batch Operations to read data in bulk at one go, to reduce the number of calls made to Amazon S3 buckets
- **(C)** To reduce Amazon S3 cost, the data can be saved on an Amazon EBS volume connected to an Amazon EC2 instance that can host the application
- **(D)** Configure Amazon CloudFront to distribute the data hosted on Amazon S3 cost-effectively `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Storing content with Amazon S3 provides a lot of advantages. But to help optimize your application’s performance and security while effectively managing cost, AWS recommends that you also set up Amazon CloudFront to work with your Amazon S3 bucket to serve and protect the content.
Amazon CloudFront is a content delivery network (CDN) service that delivers static and dynamic web content, video streams, and APIs around the world, securely and at scale. By design, delivering data out of Amazon CloudFront can be more cost-effective than delivering it from Amazon S3 directly to your users.
Amazon CloudFront serves content through a worldwide network of data centers called Edge Locations. Using edge servers to cache and serve content improves performance by providing content closer to where viewers are located.
By caching your content in Edge Locations, Amazon CloudFront reduces the load on your Amazon S3 bucket and helps ensure a faster response for your users when they request content. Also, data transfer out for content by using CloudFront is often more cost-effective than serving files directly from Amazon S3, and there is no data transfer fee from Amazon S3 to CloudFront. You only pay for what is delivered to the internet from Amazon CloudFront, plus request fees.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **To reduce Amazon S3 cost, the data can be saved on an Amazon EBS volume connected to an Amazon EC2 instance that can host the application**:
  Amazon EBS volumes are fast and are relatively cheap (though Amazon S3 is still a cheaper alternative). But, Amazon EBS volumes are accessible only through Amazon EC2 instances and are bound to a specific region.

- **Use Amazon EFS service, as it provides a shared, scalable, fully managed elastic NFS file system for storing AWS Cloud or on-premises data**:
  Amazon EFS is a shareable file system that can be mounted onto Amazon EC2 instances. Amazon EFS is costlier than Amazon EBS and not a solution if the company is looking at reducing costs.

- **Configure Amazon S3 Batch Operations to read data in bulk at one go, to reduce the number of calls made to Amazon S3 buckets**:
  This statement is incorrect and given only as a distractor. You can use Amazon S3 Batch Operations to perform large-scale batch operations on Amazon S3 objects, and it has nothing to do with content distribution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: amazon s3 amazon cloudfront a match made in the cloud](https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/)

</details>

---

<div id="question-41"></div>

### Question 41: Automated Monolithic EC2 Instance Recovery with CloudWatch System Status Alarms
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A startup has recently moved their monolithic web application to AWS Cloud. The application runs on a single Amazon EC2 instance. Currently, the user base is small and the startup does not want to spend effort on elaborate disaster recovery strategies or Auto Scaling Group. The application can afford a maximum downtime of 10 minutes.

In case of a failure, which of these options would you suggest as a cost-effective and automatic recovery procedure for the instance?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure AWS Trusted Advisor to monitor the health check of Amazon EC2 instance and provide a remedial action in case an unhealthy flag is detected
- **(B)** Configure an Amazon CloudWatch alarm that triggers the recovery of the Amazon EC2 instance, in case the instance fails. The instance, however, should only be configured with an Amazon EBS volume `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Configure an Amazon CloudWatch alarm that triggers the recovery of the Amazon EC2 instance, in case the instance fails. The instance can be configured with Amazon Elastic Block Store (Amazon EBS) or with instance store volumes
- **(D)** Configure Amazon EventBridge events that can trigger the recovery of the Amazon EC2 instance, in case the instance or the application fails

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
If your instance fails a system status check, you can use Amazon CloudWatch alarm actions to automatically recover it. The recover option is available for over 90% of deployed customer Amazon EC2 instances. The Amazon CloudWatch recovery option works only for system check failures, not for instance status check failures. Also, if you terminate your instance, then it can't be recovered.
You can create an Amazon CloudWatch alarm that monitors an Amazon EC2 instance and automatically recovers the instance if it becomes impaired due to an underlying hardware failure or a problem that requires AWS involvement to repair. Terminated instances cannot be recovered. A recovered instance is identical to the original instance, including the instance ID, private IP addresses, Elastic IP addresses, and all instance metadata. If the impaired instance is in a placement group, the recovered instance runs in the placement group.
The automatic recovery process attempts to recover your instance for up to three separate failures per day. Your instance may subsequently be retired if automatic recovery fails and a hardware degradation is determined to be the root cause for the original system status check failure.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure Amazon EventBridge events that can trigger the recovery of the Amazon EC2 instance, in case the instance or the application fails**:
  You cannot use Amazon EventBridge events to directly trigger the recovery of the Amazon EC2 instance.

- **Configure an Amazon CloudWatch alarm that triggers the recovery of the Amazon EC2 instance, in case the instance fails. The instance can be configured with Amazon Elastic Block Store (Amazon EBS) or with instance store volumes**:
  The recover action is supported only on instances that have Amazon EBS volumes configured on them, instance store volumes are not supported for automatic recovery by Amazon CloudWatch alarms.

- **Configure AWS Trusted Advisor to monitor the health check of Amazon EC2 instance and provide a remedial action in case an unhealthy flag is detected**:
  You can use Amazon EventBridge events to detect and react to changes in the status of AWS Trusted Advisor checks. This support is only available with AWS Business Support and AWS Enterprise Support. AWS Trusted Advisor by itself does not support health checks of Amazon EC2 instances or their recovery.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - ec2 instance recover](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-recover.html)

</details>

---

<div id="question-42"></div>

### Question 42: Automated PII Discovery and Data Privacy Auditing in Amazon S3 using Amazon Macie
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A financial services company wants to identify any sensitive data stored on its Amazon S3 buckets. The company also wants to monitor and protect all data stored on Amazon S3 against any malicious activity.

As a solutions architect, which of the following solutions would you recommend to help address the given requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3 as well as to identify any sensitive data stored on Amazon S3
- **(B)** Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use Amazon Macie to identify any sensitive data stored on Amazon S3 `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon Macie to monitor any malicious activity on data stored in Amazon S3. Use Amazon GuardDuty to identify any sensitive data stored on Amazon S3
- **(D)** Use Amazon Macie to monitor any malicious activity on data stored in Amazon S3 as well as to identify any sensitive data stored on Amazon S3

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon GuardDuty offers threat detection that enables you to continuously monitor and protect your AWS accounts, workloads, and data stored in Amazon S3. GuardDuty analyzes continuous streams of meta-data generated from your account and network activity found in AWS CloudTrail Events, Amazon VPC Flow Logs, and DNS Logs. It also uses integrated threat intelligence such as known malicious IP addresses, anomaly detection, and machine learning to identify threats more accurately.
Amazon Macie is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data on Amazon S3. Macie automatically detects a large and growing list of sensitive data types, including personally identifiable information (PII) such as names, addresses, and credit card numbers. It also gives you constant visibility of the data security and data privacy of your data stored in Amazon S3.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3 as well as to identify any sensitive data stored on Amazon S3

- Use Amazon Macie to monitor any malicious activity on data stored in Amazon S3 as well as to identify any sensitive data stored on Amazon S3

- Use Amazon Macie to monitor any malicious activity on data stored in Amazon S3. Use Amazon GuardDuty to identify any sensitive data stored on Amazon S3 These three options contradict the explanation provided above, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: guardduty](https://aws.amazon.com/guardduty/)
- 🌐 [AWS Service Overview: macie](https://aws.amazon.com/macie/)

</details>

---

<div id="question-43"></div>

### Question 43: Serverless Containerized Python Microservices with AWS Lambda and Amazon API Gateway
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A healthcare startup is modernizing its monolithic Python-based analytics application by transitioning to a microservices architecture on AWS. As a pilot, the team wants to refactor one module into a standalone microservice that can handle hundreds of requests per second. They are seeking an AWS-native solution that supports Python, scales automatically with traffic, and requires minimal infrastructure management and operational overhead to build, test, and deploy the service efficiently.

Which AWS solution best meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS App Runner to build and deploy the Python application directly from a GitHub repository. Allow App Runner to manage traffic scaling and deployments
- **(B)** Use AWS Lambda to run the Python-based microservice. Integrate it with Amazon API Gateway for HTTP access and enable provisioned concurrency for performance during peak loads `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Deploy the microservice in an AWS Fargate task using Amazon ECS. Package the code in a Docker container image with a Python runtime and configure ECS Service Auto Scaling to respond to CPU utilization metrics
- **(D)** Use Amazon EC2 Spot Instances in an Auto Scaling group. Launch the Python application as a background service and install all required dependencies at instance startup

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Lambda is a fully managed serverless compute service that natively supports Python runtimes. It is ideal for event-driven and API-based microservices. Lambda automatically scales based on request volume, requires no server provisioning or patching, and integrates easily with API Gateway for RESTful access. The company can also enable provisioned concurrency to reduce cold start latency for high-throughput workloads. This approach aligns perfectly with the requirement for minimal infrastructure and high scalability.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy the microservice in an AWS Fargate task using Amazon ECS. Package the code in a Docker container image with a Python runtime and configure ECS Service Auto Scaling to respond to CPU utilization metrics**:
  AWS Fargate is a serverless container service that works with ECS and supports auto scaling, but it requires containerization of the application, Dockerfile management, and more setup complexity than Lambda. Although suitable for microservices, it involves more operational overhead, especially during initial development and testing phases.

- **Use AWS App Runner to build and deploy the Python application directly from a GitHub repository. Allow App Runner to manage traffic scaling and deployments**:
  AWS App Runner provides simple deployment from source code or container images and supports Python apps via containerized runtimes. However, App Runner is more suitable for long-running web applications rather than event-driven functions. It also incurs costs during idle time and requires setting up build and deployment configurations, which may not be ideal for rapid experimentation.

- **Use Amazon EC2 Spot Instances in an Auto Scaling group. Launch the Python application as a background service and install all required dependencies at instance startup**:
  While Spot Instances are cost-effective, they are not reliable for production workloads due to the risk of interruption. Additionally, managing EC2 Auto Scaling groups and instance health checks introduces high operational overhead, which contradicts the goal of minimal infrastructure and low maintenance.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: lambda - services apigateway](https://docs.aws.amazon.com/lambda/latest/dg/services-apigateway.html)
- 🌐 [AWS Architecture Blog: creating low latency high volume apis with provisioned concurrency](https://aws.amazon.com/blogs/compute/creating-low-latency-high-volume-apis-with-provisioned-concurrency/)
- 🌐 [AWS Docs: AWSEC2 - using spot instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
- 🌐 [AWS Docs: apprunner - what is apprunner](https://docs.aws.amazon.com/apprunner/latest/dg/what-is-apprunner.html)
- 🌐 [AWS Docs: AmazonECS - AWS_Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html)

</details>

---

<div id="question-44"></div>

### Question 44: DNS Routing for Naked/Apex Domain Names to ALB using Route 53 Alias Records
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A startup has created a new web application for users to complete a risk assessment survey for COVID-19 symptoms via a self-administered questionnaire. The startup has purchased the domain covid19survey.com using Amazon Route 53. The web development team would like to create Amazon Route 53 record so that all traffic for covid19survey.com is routed to www.covid19survey.com.

As a solutions architect, which of the following is the MOST cost-effective solution that you would recommend to the web development team?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an alias record for covid19survey.com that routes traffic to www.covid19survey.com `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create an MX record for covid19survey.com that routes traffic to www.covid19survey.com
- **(C)** Create an NS record for covid19survey.com that routes traffic to www.covid19survey.com
- **(D)** Create a CNAME record for covid19survey.com that routes traffic to www.covid19survey.com

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Alias records provide Amazon Route 53–specific extension to DNS functionality. Alias records let you route traffic to selected AWS resources, such as Amazon CloudFront distributions and Amazon S3 buckets.
You can create an alias record at the top node of a DNS namespace, also known as the zone apex, however, you cannot create a CNAME record for the top node of the DNS namespace. So, if you register the DNS name covid19survey.com, the zone apex is covid19survey.com. You can't create a CNAME record for covid19survey.com, but you can create an alias record for covid19survey.com that routes traffic to www.covid19survey.com.
Exam Alert: You should also note that Amazon Route 53 doesn't charge for alias queries to AWS resources but Route 53 does charge for CNAME queries. Additionally, an alias record can only redirect queries to selected AWS resources such as Amazon S3 buckets, Amazon CloudFront distributions, and another record in the same Amazon Route 53 hosted zone; however a CNAME record can redirect DNS queries to any DNS record. So, you can create a CNAME record that redirects queries from app.covid19survey.com to app.covid19survey.net.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a CNAME record for covid19survey.com that routes traffic to www.covid19survey.com**:
  You cannot create a CNAME record for the top node of the DNS namespace, so this option is incorrect.

- **Create an MX record for covid19survey.com that routes traffic to www.covid19survey.com**:
  An MX record specifies the names of your mail servers and, if you have two or more mail servers, the priority order. It cannot be used to create Amazon Route 53 record to route traffic for the top node of the DNS namespace, so this option is incorrect.

- **Create an NS record for covid19survey.com that routes traffic to www.covid19survey.com**:
  An NS record identifies the name servers for the hosted zone. It cannot be used to create Amazon Route 53 record to route traffic for the top node of the DNS namespace, so this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: Route53 - resource record sets choosing alias non alias](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html)
- 🌐 [AWS Docs: Route53 - ResourceRecordTypes](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html)

</details>

---

<div id="question-45"></div>

### Question 45: DNS Canonical Name (CNAME) vs Alias Records for Subdomain Routing
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Your application is hosted by a provider on yourapp.provider.com. You would like to have your users access your application using www.your-domain.com, which you own and manage under Amazon Route 53.

Which Amazon Route 53 record should you create?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an A record
- **(B)** Create a CNAME record `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a PTR record
- **(D)** Create an Alias Record

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A CNAME record maps DNS queries for the name of the current record, such as acme.example.com, to another domain (example.com or example.net) or subdomain (acme.example.com or zenith.example.org).
CNAME records can be used to map one domain name to another. Although you should keep in mind that the DNS protocol does not allow you to create a CNAME record for the top node of a DNS namespace, also known as the zone apex. For example, if you register the DNS name example.com, the zone apex is example.com. You cannot create a CNAME record for example.com, but you can create CNAME records for www.example.com, newproduct.example.com, and so on.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an A record**:
  Used to point a domain or subdomain to an IP address. 'A record' cannot be used to map one domain name to another.

- **Create a PTR record**:
  A Pointer (PTR) record resolves an IP address to a fully-qualified domain name (FQDN) as an opposite to what A record does. PTR records are also called Reverse DNS records. 'PTR record' cannot be used to map one domain name to another.

- **Create an Alias Record**:
  Alias records let you route traffic to selected AWS resources, such as Amazon CloudFront distributions and Amazon S3 buckets. They also let you route traffic from one record in a hosted zone to another record. 3rd party websites do not qualify for these as we have no control over those. 'Alias record' cannot be used to map one domain name to another.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: Route53 - resource record sets choosing alias non alias](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html)

</details>

---

<div id="question-46"></div>

### Question 46: Automated Scheduled EC2 AMI Backup Pipelines via EventBridge and AWS Lambda
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A social media startup uses AWS Cloud to manage its IT infrastructure. The engineering team at the startup wants to perform weekly database rollovers for a MySQL database server using a serverless cron job that typically takes about 5 minutes to execute the database rollover script written in Python. The database rollover will archive the past week’s data from the production database to keep the database small while still keeping its data accessible.

As a solutions architect, which of the following would you recommend as the MOST cost-efficient and reliable solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a time-based schedule option within an AWS Glue job to invoke itself every week and run the database rollover script
- **(B)** Provision an Amazon EC2 spot instance to run the database rollover script to be run via an OS-based weekly cron expression
- **(C)** Schedule a weekly Amazon EventBridge event cron expression to invoke an AWS Lambda function that runs the database rollover job `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Provision an Amazon EC2 scheduled reserved instance to run the database rollover script to be run via an OS-based weekly cron expression

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume. AWS Lambda supports standard rate and cron expressions for frequencies of up to once per minute.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a time-based schedule option within an AWS Glue job to invoke itself every week and run the database rollover script**:
  AWS Glue is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. AWS Glue job is meant to be used for batch ETL data processing and it's not the right fit for running a database rollover script. Although AWS Glue is also serverless, AWS Lambda is a more cost-effective option compared to AWS Glue.

- **Provision an Amazon EC2 spot instance to run the database rollover script to be run via an OS-based weekly cron expression**:
  As the Spot Instance runs whenever capacity is available, there is no guarantee that the weekly job will be executed during the defined time window. Additionally, the given use-case requires a serverless solution, therefore this option is incorrect.

- **Provision an Amazon EC2 scheduled reserved instance to run the database rollover script to be run via an OS-based weekly cron expression**:
  Scheduled Reserved Instances run on a part-time basis. As the given use-case requires a serverless solution, therefore this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: lambda](https://aws.amazon.com/lambda/)
- 🌐 [AWS Docs: lambda - services cloudwatchevents expressions](https://docs.aws.amazon.com/lambda/latest/dg/services-cloudwatchevents-expressions.html)

</details>

---

<div id="question-47"></div>

### Question 47: Automated Systems Manager Agent (SSM Agent) Fleet Management via Default Host Configuration
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A software company manages a fleet of Amazon EC2 instances that support internal analytics applications. These instances use an IAM role with custom policies to connect to Amazon RDS and AWS Secrets Manager for secure access to credentials and database endpoints. The IT operations team wants to implement a centralized patch management solution that simplifies compliance and security tasks. Their goal is to automate OS patching across EC2 instances without disrupting the running applications.

Which approach will allow the company to meet these goals with the least administrative overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Detach the existing IAM role from all EC2 instances. Replace it with a new role that has both the original permissions and the AmazonSSMManagedInstanceCore policy to enable Systems Manager features
- **(B)** Manually install the Systems Manager Agent (SSM Agent) on each EC2 instance. Schedule daily patch jobs using cron scripts
- **(C)** Enable Default Host Management Configuration in AWS Systems Manager Quick Setup `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a second IAM role with the AmazonSSMManagedInstanceCore policy and attach both the new and the existing IAM roles to each EC2 instance using Systems Manager Hybrid Activation

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
This is the simplest and most reliable solution that aligns with the company's requirement for zero disruption and minimal administrative effort. AWS Systems Manager’s Default Host Management Configuration (part of Quick Setup) automatically applies the necessary Systems Manager permissions, activates inventory collection, and enables patching without needing to alter existing IAM roles manually. It simplifies onboarding by using AWS best practices and auto-configures EC2 instances with the required SSM settings behind the scenes.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a second IAM role with the AmazonSSMManagedInstanceCore policy and attach both the new and the existing IAM roles to each EC2 instance using Systems Manager Hybrid Activation**:
  Hybrid Activations are designed for non-EC2 resources or on-premises servers, not for managing standard EC2 instances within an AWS account. EC2 instances can only be attached to one IAM role at a time, making the dual-role approach unfeasible. This method adds unnecessary complexity and does not align with standard AWS EC2 management practices.

- **Manually install the Systems Manager Agent (SSM Agent) on each EC2 instance. Schedule daily patch jobs using cron scripts**:
  Manually scripting patching operations using cron jobs introduces high operational overhead and does not leverage native AWS integrations. This method lacks scalability, centralized compliance reporting, and the benefit of automated remediation provided by Systems Manager.

- **Detach the existing IAM role from all EC2 instances. Replace it with a new role that has both the original permissions and the AmazonSSMManagedInstanceCore policy to enable Systems Manager features**:
  Detaching and replacing the existing IAM role risks disrupting application functionality that depends on the role’s current policies (e.g., RDS access). This introduces downtime and manual changes to launch templates or running instances, violating the requirement to avoid disruption.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: enable management of your amazon ec2 instances in aws systems manager using default host management configuration](https://aws.amazon.com/blogs/mt/enable-management-of-your-amazon-ec2-instances-in-aws-systems-manager-using-default-host-management-configuration/)
- 🌐 [AWS Docs: systems-manager - quick setup host management](https://docs.aws.amazon.com/systems-manager/latest/userguide/quick-setup-host-management.html)
- 🌐 [AWS Docs: IAM - id_roles_use_switch role ec2](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html)

</details>

---

<div id="question-48"></div>

### Question 48: Decoupling Monolithic Ordering Services with Amazon SQS Standard Queues
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A legacy application is built using a tightly-coupled monolithic architecture. Due to a sharp increase in the number of users, the application performance has degraded. The company now wants to decouple the architecture and adopt AWS microservices architecture. Some of these microservices need to handle fast running processes whereas other microservices need to handle slower processes.

Which of these options would you identify as the right way of connecting these microservices?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon Kinesis Data Streams to decouple microservices running faster processes from the microservices running slower ones
- **(B)** Add Amazon EventBridge to decouple the complex architecture
- **(C)** Configure Amazon Simple Queue Service (Amazon SQS) queue to decouple microservices running faster processes from the microservices running slower ones `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon Simple Notification Service (Amazon SNS) to decouple microservices running faster processes from the microservices running slower ones

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Simple Queue Service (Amazon SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. Amazon SQS eliminates the complexity and overhead associated with managing and operating message-oriented middleware and empowers developers to focus on differentiating work. Using SQS, you can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available.
Use Amazon SQS to transmit any volume of data, at any level of throughput, without losing messages or requiring other services to be available. Amazon SQS lets you decouple application components so that they run and fail independently, increasing the overall fault tolerance of the system. Multiple copies of every message are stored redundantly across multiple availability zones so that they are available whenever needed. Being able to store the messages and replay them is a very important feature in decoupling the system architecture, as is needed in the current use case.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon Simple Notification Service (Amazon SNS) to decouple microservices running faster processes from the microservices running slower ones**:
  Amazon SNS follows the "publish-subscribe" (pub-sub) messaging paradigm, with notifications being delivered to clients using a "push" mechanism. Whereas Amazon SQS is a polling mechanism, that gives applications the chance to poll at their own comfort, the push mechanism assumes the other applications are present. For the current requirement, we need messages to be stored till they are processed by the downstream applications. Hence, Amazon SQS is the right choice.

- **Configure Amazon Kinesis Data Streams to decouple microservices running faster processes from the microservices running slower ones**:
  Amazon Kinesis Data Streams are used for streaming real-time high-volume data. Amazon Kinesis is a publish-subscribe model, used when publisher applications need to publish the same data to different consumers in parallel. Amazon SQS is the right fit for the current use case.

- **Add Amazon EventBridge to decouple the complex architecture**:
  This event-based service is extremely useful for connecting non-AWS SaaS (Software as a Service) services to AWS services. With Amazon Eventbridge, the downstream application would need to immediately process the events whenever they arrive, thereby making it a tightly coupled scenario. Hence, this option is not correct.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: sqs](https://aws.amazon.com/sqs/)

</details>

---

<div id="question-49"></div>

### Question 49: Multi-Region Anycast IP Routing and Failover using AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A gaming company uses Application Load Balancers in front of Amazon EC2 instances for different services and microservices. The architecture has now become complex with too many Application Load Balancers in multiple AWS Regions. Security updates, firewall configurations, and traffic routing logic have become complex with too many IP addresses and configurations.

The company is looking at an easy and effective way to bring down the number of IP addresses allowed by the firewall and easily manage the entire network infrastructure. Which of these options represents an appropriate solution for this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Launch AWS Global Accelerator and create endpoints for all the Regions. Register the Application Load Balancers of each Region to the corresponding endpoints `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Set up a Network Load Balancer with elastic IP address. Register the private IPs of all the Application Load Balancers as targets of this Network Load Balancer
- **(C)** Configure Elastic IPs for each of the Application Load Balancers in each Region
- **(D)** Assign an Elastic IP to an Auto Scaling Group (ASG), and set up multiple Amazon EC2 instances to run behind the Auto Scaling Groups, for each of the Regions

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Global Accelerator is a networking service that sends your user’s traffic through Amazon Web Service’s global network infrastructure, improving your internet user performance by up to 60%. When the internet is congested, Global Accelerator’s automatic routing optimizations will help keep your packet loss, jitter, and latency consistently low.
With AWS Global Accelerator, you are provided two global static customer-facing IPs to simplify traffic management. On the back end, add or remove your AWS application origins, such as Network Load Balancers, Application Load Balancers, elastic IP address (EIP), and Amazon EC2 Instances, without making user-facing changes. To mitigate endpoint failure, AWS Global Accelerator automatically re-routes your traffic to your nearest healthy available endpoint.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure Elastic IPs for each of the Application Load Balancers in each Region**:
  An Application Load Balancer cannot be assigned an Elastic IP address (static IP address).

- **Set up a Network Load Balancer with elastic IP address. Register the private IPs of all the Application Load Balancers as targets of this Network Load Balancer**:
  A Network Load Balancer can be configured to take an Elastic IP address. However, with hundreds of Application Load Balancers and Network Load Balancers, the solution will be equally cumbersome to manage.

- **Assign an Elastic IP to an Auto Scaling Group (ASG), and set up multiple Amazon EC2 instances to run behind the Auto Scaling Groups, for each of the Regions**:
  You cannot assign an elastic IP address to an Auto Scaling Group (ASG), since ASG just manages a collection of Amazon EC2 instances.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: global-accelerator](https://aws.amazon.com/global-accelerator/)
- 🌐 [AWS Architecture Blog: using static ip addresses for application load balancers](https://aws.amazon.com/blogs/networking-and-content-delivery/using-static-ip-addresses-for-application-load-balancers/)

</details>

---

<div id="question-50"></div>

### Question 50: Serverless Web Tier Migration using Amazon S3, AWS Lambda, and DynamoDB
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A small business has been running its IT systems on the on-premises infrastructure but the business now plans to migrate to AWS Cloud for operational efficiencies.

As a Solutions Architect, can you suggest a cost-effective serverless solution for its flagship application that has both static and dynamic content?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Host both the static and dynamic content of the web application on Amazon S3 and use Amazon CloudFront for distribution across diverse regions/countries
- **(B)** Host both the static and dynamic content of the web application on Amazon EC2 with Amazon RDS as database. Amazon CloudFront should be configured to distribute the content across geographically disperse regions
- **(C)** Host the static content on Amazon S3 and use AWS Lambda with Amazon DynamoDB for the serverless web application that handles dynamic content. Amazon CloudFront will sit in front of AWS Lambda for distribution across diverse regions `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Host the static content on Amazon S3 and use Amazon EC2 with Amazon RDS for generating the dynamic content. Amazon CloudFront can be configured in front of Amazon EC2 instance, to make global distribution easy

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Lambda with Amazon DynamoDB is the right answer for a serverless solution. Amazon CloudFront will help in enhancing user experience by delivering content, across different geographic locations with low latency. Amazon S3 is a cost-effective and faster way of distributing static content for web applications.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Host both the static and dynamic content of the web application on Amazon S3 and use Amazon CloudFront for distribution across diverse regions/countries**:
  Amazon S3 is not the right fit for hosting Dynamic content, so this option is incorrect.

- **Host the static content on Amazon S3 and use Amazon EC2 with Amazon RDS for generating the dynamic content. Amazon CloudFront can be configured in front of Amazon EC2 instance, to make global distribution easy**:
  The company is looking for a serverless solution, and Amazon EC2 is not a serverless service as the Amazon EC2 instances have to be managed by AWS customers.

- **Host both the static and dynamic content of the web application on Amazon EC2 with Amazon RDS as database. Amazon CloudFront should be configured to distribute the content across geographically disperse regions**:
  This is a possible solution, but not a cost-effective or optimal one. Since static content can be cost-effectively managed on Amazon S3 and can be accessed and distributed faster when compared to fetching the content from the Amazon EC2 server.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: deliver your apps dynamic content using amazon cloudfront getting started template](https://aws.amazon.com/blogs/networking-and-content-delivery/deliver-your-apps-dynamic-content-using-amazon-cloudfront-getting-started-template/)

</details>

---

<div id="question-51"></div>

### Question 51: High Availability Relational Database Tiering with Amazon RDS MySQL Multi-AZ Deployment
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company recently experienced a database outage in its on-premises data center. The company now wants to migrate to a reliable database solution on AWS that minimizes data loss and stores every transaction on at least two nodes.

Which of the following solutions meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an Amazon EC2 instance with a MySQL DB engine installed that triggers an AWS Lambda function to synchronously replicate the data to an Amazon RDS MySQL DB instance
- **(B)** Set up an Amazon RDS MySQL DB instance and then create a read replica in another Availability Zone that synchronously replicates the data
- **(C)** Set up an Amazon RDS MySQL DB instance and then create a read replica in a separate AWS Region that synchronously replicates the data
- **(D)** Set up an Amazon RDS MySQL DB instance with Multi-AZ functionality enabled to synchronously replicate the data `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
When you provision an RDS Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). Each AZ runs on its own physically distinct, independent infrastructure, and is engineered to be highly reliable. Running a DB instance with high availability can enhance availability during planned system maintenance, and help protect your databases against DB instance failure and Availability Zone disruption. In the event of a planned or unplanned outage of your DB instance, Amazon RDS automatically switches to a standby replica in another Availability Zone if you have enabled Multi-AZ. The time it takes for the failover to complete depends on the database activity and other conditions at the time the primary DB instance became unavailable. Failover times are typically 60–120 seconds.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Set up an Amazon RDS MySQL DB instance and then create a read replica in another Availability Zone that synchronously replicates the data

- Set up an Amazon RDS MySQL DB instance and then create a read replica in a separate AWS Region that synchronously replicates the data Amazon RDS uses the MariaDB, Microsoft SQL Server, MySQL, Oracle, and PostgreSQL DB engines' built-in replication functionality to create a special type of DB instance called a read replica from a source DB instance. The source DB instance becomes the primary DB instance. Updates made to the primary DB instance are asynchronously copied to the read replica. Both these options talk about creating a read replica that synchronously replicates the data, but in reality, any updates made to the primary DB instance are asynchronously copied to the read replica. So both these options are incorrect.

- **Set up an Amazon EC2 instance with a MySQL DB engine installed that triggers an AWS Lambda function to synchronously replicate the data to an Amazon RDS MySQL DB instance**:
  Setting up a database on an Amazon EC2 instance would not be reliable as you would have to monitor and manage the underlying Amazon EC2 instance for any issues or outages. In addition, using AWS Lambda to replicate the data from EC2 based MySQL DB to an Amazon RDS MySQL DB would make the solution really complex since the same functionality can be achieved out-of-the-box using RDS Multi-AZ configuration.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/multi-az/)
- 🌐 [AWS Docs: AmazonRDS - USER_ReadRepl](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)

</details>

---

<div id="question-52"></div>

### Question 52: Private Multi-AZ SFTP File Exchange Service using AWS Transfer Family and VPC Endpoints
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is migrating a legacy workload from on premises to AWS. The application receives customer order files from an on premises ERP system by using the SFTP protocol. After files arrive, the application must process them immediately rather than relying on periodic polling. The company already has secure network connectivity between AWS and the on premises environment. The new solution must remain highly available, secure, and resilient across infrastructure failures.

Which solution should you implement to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an internal AWS Transfer Family SFTP server across two Availability Zones backed by Amazon S3. Configure a Transfer Family managed workflow to invoke an AWS Lambda function immediately after file upload completes `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy an internet facing AWS Transfer Family SFTP server across two Availability Zones backed by Amazon S3. Configure Amazon S3 Event Notifications to invoke an AWS Lambda function when new objects are created
- **(C)** Deploy an internal AWS Transfer Family SFTP server across two Availability Zones backed by Amazon EFS. Use Amazon EventBridge Scheduler to periodically trigger an AWS Step Functions state machine that scans for new files
- **(D)** Deploy an internet facing AWS Transfer Family SFTP server in a single Availability Zone backed by Amazon EFS. Configure a Transfer Family managed workflow to invoke an AWS Lambda function after file upload completes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Transfer Family supports internal endpoints that integrate with VPC connectivity, making them suitable for private integrations with on premises systems over existing network connections. Deploying the server across multiple Availability Zones provides resilience against infrastructure failures. Using Amazon S3 as the storage backend allows high durability and native event integration. Transfer Family managed workflows can invoke AWS Lambda directly after file uploads complete, enabling immediate processing without polling.
This solution meets all requirements for security, resilience, and immediate order processing while minimizing operational overhead. It leverages native service integrations designed for SFTP based file ingestion workflows.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an internal AWS Transfer Family SFTP server across two Availability Zones backed by Amazon EFS. Use Amazon EventBridge Scheduler to periodically trigger an AWS Step Functions state machine that scans for new files**:
  EventBridge Scheduler triggering Step Functions introduces periodic polling behavior. The requirement specifies that orders must be processed immediately rather than on a schedule. This architecture increases complexity and delays processing compared to event driven workflows. It does not align with the requirement to process order files immediately after ingestion.

- **Deploy an internet facing AWS Transfer Family SFTP server in a single Availability Zone backed by Amazon EFS. Configure a Transfer Family managed workflow to invoke an AWS Lambda function after file upload completes**:
  Deploying the server in a single Availability Zone reduces resilience and creates a single point of failure. The requirement explicitly calls for a resilient solution. Although Transfer Family managed workflows can invoke Lambda after upload, the lack of multi Availability Zone deployment prevents the solution from meeting the resilience requirement.

- **Deploy an internet facing AWS Transfer Family SFTP server across two Availability Zones backed by Amazon S3. Configure Amazon S3 Event Notifications to invoke an AWS Lambda function when new objects are created**:
  An internet facing Transfer Family endpoint exposes the SFTP server publicly, which is unnecessary when secure private connectivity already exists. Using an internal endpoint better aligns with security best practices for private integrations. While S3 Event Notifications can trigger Lambda functions, this architecture introduces additional event configuration complexity compared to using Transfer Family managed workflows. The solution does not optimally align with the secure connectivity requirement.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: transfer - what is aws transfer family](https://docs.aws.amazon.com/transfer/latest/userguide/what-is-aws-transfer-family.html)

</details>

---

<div id="question-53"></div>

### Question 53: Real-Time Patient Vitals Ingestion and Transformation with Kinesis Data Firehose
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A health care application processes the real-time health data of the patients into an analytics workflow. With a sharp increase in the number of users, the system has become slow and sometimes even unresponsive as it does not have a retry mechanism. The startup is looking at a scalable solution that has minimal implementation overhead.

Which of the following would you recommend as a scalable alternative to the current solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Simple Notification Service (Amazon SNS) for data ingestion and configure AWS Lambda to trigger logic for downstream processing
- **(B)** Use Amazon Kinesis Data Streams to ingest the data, process it using AWS Lambda or run analytics using Amazon Kinesis Data Analytics `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon Simple Queue Service (Amazon SQS) for data ingestion and configure AWS Lambda to trigger logic for downstream processing
- **(D)** Use Amazon API Gateway with the existing REST-based interface to create a high performing architecture

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Kinesis Data Streams (KDS) is a massively scalable and durable real-time data streaming service with support for retry mechanism. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events. The data collected is available in milliseconds to enable real-time analytics use cases such as real-time dashboards, real-time anomaly detection, dynamic pricing, and more.
KDS makes sure your streaming data is available to multiple real-time analytics applications, to Amazon S3, or AWS Lambda within 70 milliseconds of the data being collected. Amazon Kinesis data streams scale from megabytes to terabytes per hour and scale from thousands to millions of PUT records per second. You can dynamically adjust the throughput of your stream at any time based on the volume of your input data.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon Simple Notification Service (Amazon SNS) for data ingestion and configure AWS Lambda to trigger logic for downstream processing**:
  Amazon Simple Notification Service (Amazon SNS) is a fully managed messaging service for both application-to-application (A2A) and application-to-person (A2P) communication. Amazon SNS is a push mechanism that does not support robust retry mechanisms, as is needed in the current use case.

- **Use Amazon Simple Queue Service (Amazon SQS) for data ingestion and configure AWS Lambda to trigger logic for downstream processing**:
  Amazon Simple Queue Service (Amazon SQS) is a messaging service that helps in decoupling systems and reducing the complexity of architecture. Amazon SQS can still work but Amazon Kinesis Data streams is custom made for streaming real-time data.

- **Use Amazon API Gateway with the existing REST-based interface to create a high performing architecture**:
  Amazon API Gateway is not meant for handling real-time streaming data.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-streams/?nc=sn&loc=2&dn=2)

</details>

---

<div id="question-54"></div>

### Question 54: Enterprise Windows Active Directory Single Sign-On with AWS Managed Microsoft AD
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An e-commerce company uses Microsoft Active Directory to provide users and groups with access to resources on the on-premises infrastructure. The company has extended its IT infrastructure to AWS in the form of a hybrid cloud. The engineering team at the company wants to run directory-aware workloads on AWS for a SQL Server-based application. The team also wants to configure a trust relationship to enable single sign-on (SSO) for its users to access resources in either domain.

As a solutions architect, which of the following AWS services would you recommend for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD) `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Simple Active Directory (Simple AD)
- **(C)** Active Directory Connector
- **(D)** Amazon Cloud Directory

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Directory Service provides multiple ways to use Amazon Cloud Directory and Microsoft Active Directory (AD) with other AWS services.
AWS Directory Service for Microsoft Active Directory (aka AWS Managed Microsoft AD) is powered by an actual Microsoft Windows Server Active Directory (AD), managed by AWS. With AWS Managed Microsoft AD, you can run directory-aware workloads in the AWS Cloud such as SQL Server-based applications. You can also configure a trust relationship between AWS Managed Microsoft AD in the AWS Cloud and your existing on-premises Microsoft Active Directory, providing users and groups with access to resources in either domain, using single sign-on (SSO).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Active Directory Connector**:
  Use AD Connector if you only need to allow your on-premises users to log in to AWS applications and services with their Active Directory credentials. AD Connector simply connects your existing on-premises Active Directory to AWS. You cannot use it to run directory-aware workloads on AWS, hence this option is not correct.

- **Simple Active Directory (Simple AD)**:
  Simple AD provides a subset of the features offered by AWS Managed Microsoft AD. Simple AD is a standalone managed directory that is powered by a Samba 4 Active Directory Compatible Server. Simple AD does not support features such as trust relationships with other domains. Therefore, this option is not correct.

- **Amazon Cloud Directory**:
  Amazon Cloud Directory is a cloud-native directory that can store hundreds of millions of application-specific objects with multiple relationships and schemas. You cannot use it to establish trust relationships with other domains on the on-premises infrastructure. Therefore, this option is not correct.

- **Exam Alert**:
  You may see questions on choosing "AWS Managed Microsoft AD" vs "AD Connector" vs "Simple AD" on the exam. Just remember that you should use AD Connector if you only need to allow your on-premises users to log in to AWS applications with their Active Directory credentials. AWS Managed Microsoft AD would also allow you to run directory-aware workloads in the AWS Cloud. AWS Managed Microsoft AD is your best choice if you have more than 5,000 users and need a trust relationship set up between an AWS hosted directory and your on-premises directories. Simple AD is the least expensive option and your best choice if you have 5,000 or fewer users and don’t need the more advanced Microsoft Active Directory features such as trust relationships with other domains.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: directoryservice - what_is](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html)

</details>

---

<div id="question-55"></div>

### Question 55: Public Subnet Bastion Host and Security Group Reference Architecture in Amazon VPC
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D), (E), (F) | **Đáp án đúng**: (D), (E), (F)

#### 📋 Đề bài (Scenario)
The DevOps team at an IT company is provisioning a two-tier application in a VPC with a public subnet and a private subnet. The team wants to use either a Network Address Translation (NAT) instance or a Network Address Translation (NAT) gateway in the public subnet to enable instances in the private subnet to initiate outbound IPv4 traffic to the internet but needs some technical assistance in terms of the configuration options available for the Network Address Translation (NAT) instance and the Network Address Translation (NAT) gateway.

As a solutions architect, which of the following options would you identify as CORRECT? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Security Groups can be associated with a NAT gateway
- **(B)** NAT gateway supports port forwarding
- **(C)** NAT gateway can be used as a bastion server
- **(D)** NAT instance can be used as a bastion server `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Security Groups can be associated with a NAT instance `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** NAT instance supports port forwarding `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E), (F)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A NAT instance or a NAT Gateway can be used in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the Internet.
NAT instance can be used as a bastion server
Security Groups can be associated with a NAT instance
NAT instance supports port forwarding

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- NAT gateway supports port forwarding

- Security Groups can be associated with a NAT gateway

- NAT gateway can be used as a bastion server These three options contradict the details provided in the explanation above, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc nat comparison](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html)

</details>

---

<div id="question-56"></div>

### Question 56: Offloading Reporting Workloads from Primary Database to Amazon RDS Read Replicas
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
The application maintenance team at a company has noticed that the production application is very slow when the business reports are run on the Amazon RDS database. These reports fetch a large amount of data and have complex queries with multiple joins, spanning across multiple business-critical core tables. CPU, memory, and storage metrics are around 50% of the total capacity.

Can you recommend an improved and cost-effective way of generating the business reports while keeping the production application unaffected?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate from General Purpose SSD to magnetic storage to enhance IOPS
- **(B)** Increase the size of Amazon RDS instance
- **(C)** Create a read replica and connect the report generation tool/application to it `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Configure the Amazon RDS instance to be Multi-AZ DB instance, and connect the report generation tool to the DB instance in a different AZ

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS Read Replicas provide enhanced performance and durability for Amazon RDS database (DB) instances. They make it easy to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads. You can create one or more replicas of a given source DB Instance and serve high-volume application read traffic from multiple copies of your data, thereby increasing aggregate read throughput. Read replicas can also be promoted when needed to become standalone DB instances.
Common reasons for deploying a read replica include:
Scaling beyond the compute or I/O capacity of a single DB instance for read-heavy database workloads. This excess read traffic can be directed to one or more read replicas.
Serving read traffic while the source DB instance is unavailable. If your source DB Instance cannot take I/O requests (e.g. due to I/O suspension for backups or scheduled maintenance), you can direct read traffic to your read replica(s). For this use case, keep in mind that the data on the read replica may be “stale” since the source DB Instance is unavailable.
Business reporting or data warehousing scenarios; you may want business reporting queries to run against a read replica, rather than your primary, production DB Instance.
You may use a read replica for disaster recovery of the source DB instance, either in the same AWS Region or in another Region.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Increase the size of Amazon RDS instance**:
  This will not help as it's mentioned that the CPU, memory, and storage are running at only 50% of the total capacity.

- **Migrate from General Purpose SSD to magnetic storage to enhance IOPS**:
  This is incorrect. Amazon RDS supports magnetic storage for backward compatibility only. AWS recommends that you use General Purpose SSD or Provisioned IOPS for any storage needs.

- **Configure the Amazon RDS instance to be Multi-AZ DB instance, and connect the report generation tool to the DB instance in a different AZ**:
  When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). However, you cannot read from the standby database, making multi-AZ, an incorrect option for the given scenario.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/read-replicas/)

</details>

---

<div id="question-57"></div>

### Question 57: Hybrid File Storage and Server Migration with AWS Storage Gateway File Gateway and FSx
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (E) | **Đáp án đúng**: (A), (E)

#### 📋 Đề bài (Scenario)
A financial services company wants to move the Windows file server clusters out of their datacenters. They are looking for cloud file storage offerings that provide full Windows compatibility. Can you identify the AWS storage services that provide highly reliable file storage that is accessible over the industry-standard Server Message Block (SMB) protocol compatible with Windows systems? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** File Gateway Configuration of AWS Storage Gateway `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon Elastic File System (Amazon EFS)
- **(C)** Amazon Simple Storage Service (Amazon S3)
- **(D)** Amazon Elastic Block Store (Amazon EBS)
- **(E)** Amazon FSx for Windows File Server `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for Windows File Server: Amazon FSx for Windows File Server is a fully managed, highly reliable file storage that is accessible over the industry-standard Server Message Block (SMB) protocol. It is built on Windows Server, delivering a wide range of administrative features such as user quotas, end-user file restore, and Microsoft Active Directory (AD) integration.
File Gateway Configuration of AWS Storage Gateway: Depending on the use case, AWS Storage Gateway provides 3 types of storage interfaces for on-premises applications: File, Volume, and Tape. The File Gateway enables you to store and retrieve objects in Amazon S3 using file protocols such as Network File System (NFS) and Server Message Block (SMB).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon Elastic File System (Amazon EFS)**:
  Amazon EFS is a file storage service for use with Amazon EC2. Amazon EFS uses the Network File System protocol. EFS does not support SMB protocol.

- **Amazon Elastic Block Store (Amazon EBS)**:
  Amazon EBS is a block-level storage service for use with Amazon EC2. EBS does not support SMB protocol.

- **Amazon Simple Storage Service (Amazon S3)**:
  Amazon Simple Storage Service (Amazon S3) is an object storage service. S3 does not support SMB protocol.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: fsx](https://aws.amazon.com/fsx/windows/)
- 🌐 [AWS Service Overview: storagegateway](https://aws.amazon.com/storagegateway/file/)

</details>

---

<div id="question-58"></div>

### Question 58: Zero-Downtime Database Migration from RDS MySQL to Aurora MySQL via Aurora Read Replicas
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The database backend for a retail company's website is hosted on Amazon RDS for MySQL having a primary instance and three read replicas to support read scalability. The company has mandated that the read replicas should lag no more than 1 second behind the primary instance to provide the best possible user experience. The read replicas are falling further behind during periods of peak traffic spikes, resulting in a bad user experience as the searches produce inconsistent results.

You have been hired as an AWS Certified Solutions Architect - Associate to reduce the replication lag as much as possible with minimal changes to the application code or the effort required to manage the underlying resources.

Which of the following will you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up database migration from Amazon RDS MySQL to Amazon Aurora MySQL. Swap out the MySQL read replicas with Aurora Replicas. Configure Aurora Auto Scaling `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Set up database migration from Amazon RDS MySQL to Amazon DynamoDB. Provision a large number of read capacity units (RCUs) to support the required throughput and enable Auto-Scaling
- **(C)** Host the MySQL primary database on a memory-optimized Amazon EC2 instance. Spin up additional compute-optimized Amazon EC2 instances to host the read replicas
- **(D)** Set up an Amazon ElastiCache for Redis cluster in front of the MySQL database. Update the website to check the cache before querying the read replicas

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Aurora features a distributed, fault-tolerant, and self-healing storage system that is decoupled from compute resources and auto-scales up to 128 TiB per database instance. It delivers high performance and availability with up to 15 low-latency read replicas, point-in-time recovery, continuous backup to Amazon Simple Storage Service (Amazon S3), and replication across three Availability Zones (AZs).
Since Amazon Aurora Replicas share the same data volume as the primary instance in the same AWS Region, there is virtually no replication lag. The replica lag times are in the 10s of milliseconds (compared to the replication lag of seconds in the case of MySQL read replicas). Therefore, this is the right option to ensure that the read replicas lag no more than 1 second behind the primary instance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Host the MySQL primary database on a memory-optimized Amazon EC2 instance. Spin up additional compute-optimized Amazon EC2 instances to host the read replicas**:
  Hosting the MySQL primary database and the read replicas on the Amazon EC2 instances would result in significant overhead to manage the underlying resources such as OS patching, database patching, etc. So this option is incorrect.

- **Set up an Amazon ElastiCache for Redis cluster in front of the MySQL database. Update the website to check the cache before querying the read replicas**:
  Introducing a caching layer would result in significant changes to the application code, so this option is incorrect.

- **Set up database migration from Amazon RDS MySQL to Amazon DynamoDB. Provision a large number of read capacity units (RCUs) to support the required throughput and enable Auto-Scaling**:
  Introducing a NoSQL database, such as Amazon DynamoDB, would result in significant changes to the application code since the database queries would have to be re-written for Amazon DynamoDB. Therefore, this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/aurora/faqs/)

</details>

---

<div id="question-59"></div>

### Question 59: Enabling Outbound-Only Internet Access for Private Subnets using Amazon VPC NAT Gateway
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has its application servers in the public subnet that connect to the database instances in the private subnet. For regular maintenance, the database instances need patch fixes that need to be downloaded from the internet.

Considering the company uses only IPv4 addressing and is looking for a fully managed service, which of the following would you suggest as an optimal solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an Egress-only internet gateway for the resources in the private subnet of the VPC
- **(B)** Configure a Network Address Translation gateway (NAT gateway) in the public subnet of the VPC `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Configure the Internet Gateway of the VPC to be accessible to the private subnet resources by changing the route tables
- **(D)** Configure a Network Address Translation instance (NAT instance) in the public subnet of the VPC

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You can use a Network Address Translation gateway (NAT gateway) to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances. To create a NAT gateway, you must specify the public subnet in which the NAT gateway should reside.
You must also specify an Elastic IP address to associate with the NAT gateway when you create it. The Elastic IP address cannot be changed after you associate it with the NAT Gateway. After you've created a NAT gateway, you must update the route table associated with one or more of your private subnets to point internet-bound traffic to the NAT gateway. This enables instances in your private subnets to communicate with the internet. If you no longer need a NAT gateway, you can delete it. Deleting a NAT gateway disassociates its Elastic IP address, but does not release the address from your account.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an Egress-only internet gateway for the resources in the private subnet of the VPC**:
  An Egress-only internet gateway is an Internet Gateway that supports IPv6 traffic, so this option is not correct for the given use-case.

- **Configure a Network Address Translation instance (NAT instance) in the public subnet of the VPC**:
  You can use a network address translation (NAT) instance in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the internet or other AWS services, but prevent the instances from receiving inbound traffic initiated by someone on the internet. NAT instances are not a managed service, it has to be managed and maintained by the customer.

- **Configure the Internet Gateway of the VPC to be accessible to the private subnet resources by changing the route tables**:
  Internet Gateway cannot be used directly with a private subnet. It is not possible to set up this configuration, without a NAT instance or a NAT gateway in the public subnet.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc nat gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
- 🌐 [AWS Docs: vpc - VPC_NAT_Instance](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html)
- 🌐 [AWS Docs: vpc - egress only internet gateway](https://docs.aws.amazon.com/vpc/latest/userguide/egress-only-internet-gateway.html)

</details>

---

<div id="question-60"></div>

### Question 60: Hybrid On-Premises File Storage Caching with AWS Storage Gateway Cached Volumes
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company has a hybrid cloud structure for its on-premises data center and AWS Cloud infrastructure. The company wants to build a web log archival solution such that only the most frequently accessed logs are available as cached data locally while backing up all logs on Amazon S3.

As a solutions architect, which of the following solutions would you recommend for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Volume Gateway - Cached Volume - to store the most frequently accessed logs locally for low-latency access while storing the full volume with all logs in its Amazon S3 service bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use AWS Direct Connect to store the most frequently accessed logs locally for low-latency access while storing the full backup of logs in an Amazon S3 bucket
- **(C)** Use AWS Snowball Edge Storage Optimized device to store the most frequently accessed logs locally for low-latency access while storing the full backup of logs in an Amazon S3 bucket
- **(D)** Use AWS Volume Gateway - Stored Volume - to store the most frequently accessed logs locally for low-latency access while storing the full volume with all logs in its Amazon S3 service bucket

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Storage Gateway is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage. The service provides three different types of gateways – Tape Gateway, File Gateway, and Volume Gateway – that seamlessly connect on-premises applications to cloud storage, caching data locally for low-latency access. With cached volumes, the AWS Volume Gateway stores the full volume in its Amazon S3 service bucket, and just the recently accessed data is retained in the gateway’s local cache for low-latency access.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS Direct Connect to store the most frequently accessed logs locally for low-latency access while storing the full backup of logs in an Amazon S3 bucket**:
  AWS Direct Connect lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. AWS Direct connect cannot be used to store the most frequently accessed logs locally for low-latency access.

- **Use AWS Volume Gateway**:
  Stored Volume - to store the most frequently accessed logs locally for low-latency access while storing the full volume with all logs in its Amazon S3 service bucket - With stored volumes, your entire data volume is available locally in the gateway, for fast read access. Volume Gateway also maintains an asynchronous copy of your stored volume in the service’s Amazon S3 bucket. This does not fit the requirements per the given use-case, hence this option is not correct.

- **Use AWS Snowball Edge Storage Optimized device to store the most frequently accessed logs locally for low-latency access while storing the full backup of logs in an Amazon S3 bucket**:
  You can use Snowball Edge Storage Optimized device to securely and quickly transfer dozens of terabytes to petabytes of data to AWS. Snowball Edge Storage Optimized device cannot be used to store the most frequently accessed logs locally for low-latency access.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: storagegateway](https://aws.amazon.com/storagegateway/volume/)

</details>

---

<div id="question-61"></div>

### Question 61: Heterogeneous Database Migration to Amazon Aurora using AWS SCT and AWS DMS
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
A company has a license-based, expensive, legacy commercial database solution deployed at its on-premises data center. The company wants to migrate this database to a more efficient, open-source, and cost-effective option on AWS Cloud. The CTO at the company wants a solution that can handle complex database configurations such as secondary indexes, foreign keys, and stored procedures.

As a solutions architect, which of the following AWS services should be combined to handle this use-case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Glue
- **(B)** AWS Snowball Edge
- **(C)** AWS Database Migration Service (AWS DMS) `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Basic Schema Copy
- **(E)** AWS Schema Conversion Tool (AWS SCT) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Database Migration Service helps you migrate databases to AWS quickly and securely. The source database remains fully operational during the migration, minimizing downtime to applications that rely on the database. AWS Database Migration Service supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms, such as Oracle or Microsoft SQL Server to Amazon Aurora.
Given the use-case where the CTO at the company wants to move away from license-based, expensive, legacy commercial database solutions deployed at the on-premises data center to more efficient, open-source, and cost-effective options on AWS Cloud, this is an example of heterogeneous database migrations.
For such a scenario, the source and target databases engines are different, like in the case of Oracle to Amazon Aurora, Oracle to PostgreSQL, or Microsoft SQL Server to MySQL migrations. In this case, the schema structure, data types, and database code of source and target databases can be quite different, requiring a schema and code transformation before the data migration starts.
That makes heterogeneous migrations a two-step process. First use the AWS Schema Conversion Tool to convert the source schema and code to match that of the target database, and then use the AWS Database Migration Service to migrate data from the source database to the target database. All the required data type conversions will automatically be done by the AWS Database Migration Service during the migration. The source database can be located on your on-premises environment outside of AWS, running on an Amazon EC2 instance, or it can be an Amazon RDS database. The target can be a database in Amazon EC2 or Amazon RDS.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **AWS Snowball Edge**:
  AWS Snowball Edge Storage Optimized is the optimal choice if you need to securely and quickly transfer dozens of terabytes to petabytes of data to AWS. AWS Snowball Edge cannot be used for database migrations.

- **AWS Glue**:
  AWS Glue is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. AWS Glue job is meant to be used for batch ETL data processing. Therefore, it cannot be used for database migrations.

- **Basic Schema Copy**:
  Basic Schema Copy will automatically create tables and primary keys in the target instance if the target does not already contain tables with the same names. Basic Schema Copy will not migrate secondary indexes, foreign keys or stored procedures. When you need to use a more customizable schema migration process (e.g. when you are migrating your production database and need to move your stored procedures and secondary database objects), you must use the AWS Schema Conversion Tool.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: dms](https://aws.amazon.com/dms/)
- 🌐 [AWS Service Overview: dms](https://aws.amazon.com/dms/faqs/)
- 🌐 [AWS Service Overview: dms](https://aws.amazon.com/dms/schema-conversion-tool/)

</details>

---

<div id="question-62"></div>

### Question 62: Automated Accelerated Online Data Migration to Amazon S3 using AWS DataSync
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A global pharmaceutical company wants to move most of the on-premises data into Amazon S3, Amazon Elastic File System (Amazon EFS), and Amazon FSx for Windows File Server easily, quickly, and cost-effectively.

As a solutions architect, which of the following solutions would you recommend as the BEST fit to automate and accelerate online data transfers to these AWS storage services?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use File Gateway to automate and accelerate online data transfers to the given AWS storage services
- **(B)** Use AWS Transfer Family to automate and accelerate online data transfers to the given AWS storage services
- **(C)** Use AWS Snowball Edge Storage Optimized device to automate and accelerate online data transfers to the given AWS storage services
- **(D)** Use AWS DataSync to automate and accelerate online data transfers to the given AWS storage services `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS DataSync is an online data transfer service that simplifies, automates, and accelerates copying large amounts of data to and from AWS storage services over the internet or AWS Direct Connect.
AWS DataSync fully automates and accelerates moving large active datasets to AWS, up to 10 times faster than command-line tools. It is natively integrated with Amazon S3, Amazon EFS, Amazon FSx for Windows File Server, Amazon CloudWatch, and AWS CloudTrail, which provides seamless and secure access to your storage services, as well as detailed monitoring of the transfer.
AWS DataSync uses a purpose-built network protocol and scale out architecture to transfer data. A single DataSync agent is capable of saturating a 10 Gbps network link.
AWS DataSync fully automates the data transfer. It comes with retry and network resiliency mechanisms, network optimizations, built-in task scheduling, monitoring via the DataSync API and Console, and Amazon CloudWatch metrics, events, and logs that provide granular visibility into the transfer process. AWS DataSync performs data integrity verification both during the transfer and at the end of the transfer.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS Snowball Edge Storage Optimized device to automate and accelerate online data transfers to the given AWS storage services**:
  AWS Snowball Edge is suitable for offline data transfers, for customers who are bandwidth constrained or transferring data from remote, disconnected, or austere environments. Therefore, it cannot support automated and accelerated online data transfers.

- **Use AWS Transfer Family to automate and accelerate online data transfers to the given AWS storage services**:
  The AWS Transfer Family provides fully managed support for file transfers directly into and out of Amazon S3 and Amazon EFS. Therefore, it cannot support migration into the other AWS storage services mentioned in the given use-case (Amazon FSx for Windows File Server).

- **Use File Gateway to automate and accelerate online data transfers to the given AWS storage services**:
  File gateway offers SMB or NFS-based access to data in Amazon S3 with local caching. Therefore, it cannot support migration into the other AWS storage services mentioned in the given use-case (such as EFS and Amazon FSx for Windows File Server).

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: datasync](https://aws.amazon.com/datasync/faqs/)
- 🌐 [AWS Service Overview: storagegateway](https://aws.amazon.com/storagegateway/file/)
- 🌐 [AWS Service Overview: aws-transfer-family](https://aws.amazon.com/aws-transfer-family/)

</details>

---

<div id="question-63"></div>

### Question 63: Hybrid Bi-Directional DNS Resolution with Amazon Route 53 Resolver Inbound & Outbound Endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D), (E) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A retail company has connected its on-premises data center to the AWS Cloud via AWS Direct Connect. The company wants to be able to resolve Domain Name System (DNS) queries for any resources in the on-premises network from the AWS VPC and also resolve any DNS queries for resources in the AWS VPC from the on-premises network.

As a solutions architect, which of the following solutions can be combined to address the given use case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an outbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint
- **(B)** Create a universal endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can receive and forward queries to resolvers on the on-premises network via this endpoint
- **(C)** Create an inbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint
- **(D)** Create an inbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Create an outbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) web service. Amazon Route 53 effectively connects user requests to infrastructure running in AWS – such as Amazon EC2 instances – and can also be used to route users to infrastructure outside of AWS. By default, Amazon Route 53 Resolver automatically answers DNS queries for local VPC domain names for Amazon EC2 instances. You can integrate DNS resolution between Resolver and DNS resolvers on your on-premises network by configuring forwarding rules.
To resolve any DNS queries for resources in the AWS VPC from the on-premises network, you can create an inbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint.
To resolve DNS queries for any resources in the on-premises network from the AWS VPC, you can create an outbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint. To conditionally forward queries, you need to create Resolver rules that specify the domain names for the DNS queries that you want to forward (such as example.com) and the IP addresses of the DNS resolvers on the on-premises network that you want to forward the queries to.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an outbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint**:
  DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via an inbound endpoint. Hence, this option is incorrect.

- **Create an inbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint**:
  Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via an outbound endpoint. Hence, this option is incorrect.

- **Create a universal endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can receive and forward queries to resolvers on the on-premises network via this endpoint**:
  There is no such thing as a universal endpoint on Amazon Route 53 Resolver. This option has been added as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: Route53 - resolver getting started](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-getting-started.html)
- 🌐 [AWS Docs: Route53 - resolver](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html)

</details>

---

<div id="question-64"></div>

### Question 64: Enabling Internet Connectivity for Custom VPCs via Internet Gateway (IGW) and Route Tables
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
The DevOps team at an IT company has created a custom VPC (V1) and attached an Internet Gateway (I1) to the VPC. The team has also created a subnet (S1) in this custom VPC and added a route to this subnet's route table (R1) that directs internet-bound traffic to the Internet Gateway. Now the team launches an Amazon EC2 instance (E1) in the subnet S1 and assigns a public IPv4 address to this instance. Next the team also launches a Network Address Translation (NAT) instance (N1) in the subnet S1.

Under the given infrastructure setup, which of the following entities is doing the Network Address Translation for the Amazon EC2 instance E1?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Network Address Translation (NAT) instance (N1)
- **(B)** Subnet (S1)
- **(C)** Internet Gateway (I1) `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Route Table (R1)

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
An Internet Gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.
An Internet Gateway serves two purposes: to provide a target in your VPC route tables for internet-routable traffic and to perform network address translation (NAT) for instances that have been assigned public IPv4 addresses. Therefore, for instance E1, the Network Address Translation is done by Internet Gateway I1.
Additionally, an Internet Gateway supports IPv4 and IPv6 traffic. It does not cause availability risks or bandwidth constraints on your network traffic.
To enable access to or from the internet for instances in a subnet in a VPC, you must do the following:
Attach an Internet gateway to your VPC.
Add a route to your subnet's route table that directs internet-bound traffic to the internet gateway. If a subnet is associated with a route table that has a route to an internet gateway, it's known as a public subnet. If a subnet is associated with a route table that does not have a route to an internet gateway, it's known as a private subnet.
Ensure that instances in your subnet have a globally unique IP address (public IPv4 address, Elastic IP address, or IPv6 address).
Ensure that your network access control lists and security group rules allow the relevant traffic to flow to and from your instance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Network Address Translation (NAT) instance (N1)**:
  You can use a network address translation (NAT) instance in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the Internet or other AWS services, but prevent the instances from receiving inbound traffic initiated by someone on the Internet. As the instance E1 is in a public subnet, therefore this option is not correct.

- Subnet (S1)

- Route Table (R1) A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. A subnet is a range of IP addresses in your VPC. A route table contains a set of rules, called routes, that are used to determine where network traffic is directed. Therefore neither Subnet nor Route Table can be used for Network Address Translation.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - VPC_Internet_Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)
- 🌐 [AWS Docs: vpc - VPC_NAT_Instance](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html)

</details>

---

<div id="question-65"></div>

### Question 65: Continuous Compliance Auditing and Drift Detection using AWS Config Managed Rules
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A financial services company has recently migrated from on-premises infrastructure to AWS Cloud. The DevOps team wants to implement a solution that allows all resource configurations to be reviewed and make sure that they meet compliance guidelines. Also, the solution should be able to offer the capability to look into the resource configuration history across the application stack.

As a solutions architect, which of the following solutions would you recommend to the team?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon CloudWatch to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes
- **(B)** Use AWS Config to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use AWS Systems Manager to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes
- **(D)** Use AWS CloudTrail to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Config is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources. With Config, you can review changes in configurations and relationships between AWS resources, dive into detailed resource configuration histories, and determine your overall compliance against the configurations specified in your internal guidelines. You can use Config to answer questions such as - “What did my AWS resource look like at xyz point in time?”

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon CloudWatch to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes**:
  AWS CloudWatch provides you with data and actionable insights to monitor your applications, respond to system-wide performance changes, optimize resource utilization, and get a unified view of operational health. You cannot use Amazon CloudWatch to maintain a history of resource configuration changes.

- **Use AWS CloudTrail to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes**:
  With AWS CloudTrail, you can log, continuously monitor, and retain account activity related to actions across your AWS infrastructure. You can use AWS CloudTrail to answer questions such as - “Who made an API call to modify this resource?”. You cannot use AWS CloudTrail to maintain a history of resource configuration changes.

- **Use AWS Systems Manager to review resource configurations to meet compliance guidelines and maintain a history of resource configuration changes**:
  Using AWS Systems Manager, you can group resources, like Amazon EC2 instances, Amazon S3 buckets, or Amazon RDS instances, by application, view operational data for monitoring and troubleshooting, and take action on your groups of resources. You cannot use AWS Systems Manager to maintain a history of resource configuration changes.

- **Exam Alert**:
  You may see scenario-based questions asking you to select one of Amazon CloudWatch vs AWS CloudTrail vs AWS Config. Just remember this thumb rule:

- Think resource performance monitoring, events, and alerts; think Amazon CloudWatch.

- Think account-specific activity and audit; think AWS CloudTrail.

- Think resource-specific history, audit, and compliance; think AWS Config.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: config](https://aws.amazon.com/config/)
- 🌐 [AWS Service Overview: cloudwatch](https://aws.amazon.com/cloudwatch/)
- 🌐 [AWS Service Overview: cloudtrail](https://aws.amazon.com/cloudtrail/)
- 🌐 [AWS Service Overview: systems-manager](https://aws.amazon.com/systems-manager/)

</details>

---

