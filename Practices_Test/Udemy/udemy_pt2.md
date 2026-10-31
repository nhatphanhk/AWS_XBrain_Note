# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Practice Exam 2

> **Khóa học tham chiếu**: Ultimate AWS Certified Solutions Architect Associate (SAA-C03) - Stephane Maarek  
> **Bộ đề**: Practice Exam 2 (Review Mode - 65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 cÃ¢u | HoÃ n thÃ nh 100% |
| **Số câu trả lời đúng (Correct Answers)** | **39 câu** | $\ge 47$ cÃ¢u (72%) | ChÆ°a Ä‘áº¡t tiÃªu chuáº©n âŒ |
| **Số câu trả lời sai (Incorrect Answers)** | **26 câu** | $\le 18$ cÃ¢u | Cáº§n táº­p trung Ã´n táº­p âš ï¸ |
| **Tỷ lệ chính xác (Overall Score)** | **60% (~600 / 1000)** | $\ge 72.0\%$ (720 / 1000) | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |
| **Thời gian thi tiêu chuẩn** | **130 phút** | 130 phút *(160 phút nếu có ESL +30)* | Đạt tiến độ thời gian |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 27 câu | 16 câu | 11 câu | **59.3%** | Cần củng cố 🔴 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 12 câu | 7 câu | 5 câu | **58.3%** | Cần củng cố 🔴 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 16 câu | 8 câu | 8 câu | **50%** | Cần củng cố 🔴 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 10 câu | 8 câu | 2 câu | **80%** | Tốt 🟡 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **39 câu** | **26 câu** | **60%** | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

## 🎯 2. Danh Sách Các Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp các câu trả lời chưa chính xác trong lần làm đề thi này. Hãy rà soát kỹ các bẫy câu hỏi và bài học kiến trúc cốt lõi trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 02** | Domain 3 | **Serverless Long-Running Script Orchestration with ECS Fargate and EventBridge** | AWS Lambda has a hard maximum execution timeout of 15 minutes, making it impossible to run scripts that take up to 30 minutes without major refactoring. | [👉 Xem](#question-02) |
| **Câu 04** | Domain 1 | **Hybrid S3 Ingestion for Legacy Systems via AWS Transfer Family SFTP & IAM** | AWS Transfer Family is a fully managed service that allows legacy SFTP clients to upload files directly into Amazon S3 buckets without managing EC2 SFTP servers. | [👉 Xem](#question-04) |
| **Câu 05** | Domain 3 | **Relational Multi-Region Low-Latency Global Database with Amazon Aurora** | Amazon Aurora Global Database is MySQL-compatible (preserving the relational schema) and replicates data across multiple AWS Regions with sub-second latency, enabling fast local reads for global branch offices. | [👉 Xem](#question-05) |
| **Câu 10** | Domain 3 | **Hybrid Windows File Sharing Migration to Managed Amazon FSx for Windows File Server** | Amazon FSx for Windows File Server is built on Windows Server, supports the SMB protocol, integrates with Microsoft Active Directory, and supports Multi-AZ Microsoft Distributed File System (DFS) namespaces and replication. | [👉 Xem](#question-10) |
| **Câu 14** | Domain 1 | **Application Load Balancer User Authentication Integration via Amazon Cognito User Pools** | Application Load Balancer (ALB) has native built-in support for authenticating users via Amazon Cognito User Pools (or OIDC) using listener rules, requiring zero custom code. | [👉 Xem](#question-14) |
| **Câu 16** | Domain 1 | **Remediating Unencrypted EBS Volumes via Encrypted Snapshot Copy and Volume Re-attachment** | You cannot encrypt an existing unencrypted Amazon RDS database in-place, and an unencrypted primary DB cannot have an encrypted Multi-AZ standby or encrypted read replica. | [👉 Xem](#question-16) |
| **Câu 21** | Domain 2 | **Centralized Shared POSIX Storage Across EC2 Fleets using Amazon EFS** | Because EBS volumes are local to individual EC2 instances, videos uploaded by a user are scattered across different servers. | [👉 Xem](#question-21) |
| **Câu 23** | Domain 1 | **Restricting Regional API Invocations via IAM Policy Condition aws:RequestedRegion** | The aws:RequestedRegion global condition key compares the target AWS Region of the API request (the Region where the resource is being created/acted upon) with the Region specified in the policy. | [👉 Xem](#question-23) |
| **Câu 25** | Domain 1 | **IAM Policy Evaluation: Explicit Deny Overriding Allow for EC2 Actions** | Just like in Question 12, aws:SourceIp refers to the caller's (user's) source IP address, not the IP address of the EC2 instance. | [👉 Xem](#question-25) |
| **Câu 29** | Domain 3 | **Amazon EC2 User Data Execution Lifecycle and Default Root User Privileges** | EC2 User Data scripts run only once during the initial launch boot cycle by default, and they always execute as the root user by default (you do not need sudo in user data scripts). | [👉 Xem](#question-29) |
| **Câu 33** | Domain 2 | **Decoupling Microservices with EventBridge and SQS Standard for Fan-Out Buffering** | Compute: Because the app is already Kubernetes-based, Amazon EKS with AWS Fargate lets the company migrate its Kubernetes manifests directly without managing EC2 worker nodes.<br>Messaging: Amazon SQS does not support industry-standard protocols like AMQP, MQTT, or JMS (it uses its own proprietary AWS API). | [👉 Xem](#question-33) |
| **Câu 35** | Domain 1 | **Automated SSL/TLS Certificate Expiration Auditing using AWS Config Managed Rules** | Two key points here:<br>Certificates created via ACM are renewed automatically by ACM; only imported third-party certificates require manual renewal monitoring.<br>AWS Config provides an off-the-shelf managed rule (acm-certificate-expiration-check) that evaluates imported ACM certificates against a specified number of days (e.g., 30 days) and can directly notify the team via Amazon SNS with minimal setup. | [👉 Xem](#question-35) |
| **Câu 36** | Domain 1 | **Auto Scaling Group with Application Load Balancer and Multi-AZ Subnets for HA Web Tier** | AWS WAF is a Layer 7 web application firewall. It can only be attached to an Application Load Balancer (ALB), Amazon CloudFront, Amazon API Gateway, AWS AppSync, Amazon Cognito User Pools, or AWS App Runner. | [👉 Xem](#question-36) |
| **Câu 38** | Domain 4 | **Cost-Effective File Storage for Infrequently Accessed Data with Amazon EFS Standard-IA** | While Amazon EFS is the right service for shared file storage concurrently mounted by hundreds of EC2 instances, the question specifically asks to store less frequently accessed files in the most cost-effective way. | [👉 Xem](#question-38) |
| **Câu 41** | Domain 3 | **NLP Entity Detection and Sentiment Analysis for Media Articles using Amazon Comprehend** | Amazon Comprehend is AWS's fully managed Natural Language Processing (NLP) service that extracts sentiment (emotional tone: positive, negative, neutral, mixed), key phrases, entities, and topics from text. | [👉 Xem](#question-41) |
| **Câu 42** | Domain 4 | **Cost-Effective Batch Workload Execution using EC2 Spot Fleet Diversified Allocation** | When a workload can run across multiple servers of various sizes with a variable number of CPUs and must withstand server failures, a Spot Fleet is superior to standalone Spot Instances. | [👉 Xem](#question-42) |
| **Câu 43** | Domain 2 | **Blue-Green Global Deployment and Traffic Weighting using AWS Global Accelerator** | An ELB is a single-Region resource and cannot distribute traffic across a global (multi-Region) application.<br>Route 53 weighted routing relies on DNS, which is hindered by mobile clients caching DNS records for long periods.<br>AWS Global Accelerator provides static Anycast IPs and uses traffic dials and endpoint weights to shift traffic across global endpoints within seconds, completely bypassing client-side DNS caching. | [👉 Xem](#question-43) |
| **Câu 45** | Domain 1 | **Secure EC2 S3 Object Uploads using IAM Roles and IAM Instance Profiles** | Storing static AWS credentials on an EC2 instance (whether in plain text, CLI config, or custom-encrypted files) is a major security anti-pattern. | [👉 Xem](#question-45) |
| **Câu 46** | Domain 1 | **Cross-Region Backup Replication and Archival using S3 Cross-Region Replication (CRR)** | To encrypt and decrypt data using the same KMS key across two AWS Regions, you must use an AWS KMS Multi-Region Key. | [👉 Xem](#question-46) |
| **Câu 54** | Domain 1 | **Two-Tier Security Architecture: Restricting DB Security Group to Web-Tier SG ID** | Security Group A (Web Servers): Accepts HTTPS requests from users on port 443 (inbound from 0.0.0.0/0 on port 443) and initiates database queries to the MSSQL servers in Security Group B on port 1433 (outbound to SG B on port 1433, not 443).<br>Security Group B (MSSQL Database): Should follow least privilege by allowing inbound traffic on port 1433 only from Security Group A (not from all sources). | [👉 Xem](#question-54) |
| **Câu 55** | Domain 2 | **Decoupling Unpredictable IoT Sensor Bursts using Amazon SQS Standard Queues** | When a backend EC2 application is overwhelmed by traffic surges and dropping messages, the standard pattern to decouple and buffer requests with minimal operational overhead is Amazon SQS. | [👉 Xem](#question-55) |
| **Câu 56** | Domain 3 | **Accelerating Global Gaming and Video Traffic with AWS Global Accelerator Anycast IPs** | Video conferencing and Network Load Balancers (NLBs) operate at Layer 4 (TCP/UDP). Amazon CloudFront is a Layer 7 CDN that only supports HTTP/HTTPS traffic and cannot accelerate UDP/non-HTTP TCP connections. | [👉 Xem](#question-56) |
| **Câu 58** | Domain 3 | **S3 Lifecycle Rules: Transitioning Raw Data to S3 Standard-IA and S3 Glacier** | Raw Zone: Data in the raw zone is processed once by the daily Glue ETL job and then only kept for 5 years to meet compliance rules. | [👉 Xem](#question-58) |
| **Câu 60** | Domain 1 | **VPC DNS Configuration Attributes Required for Route 53 Private Hosted Zones** | To use an Amazon Route 53 Private Hosted Zone with a VPC, two VPC attributes must be enabled (true): enableDnsHostnames (DNS hostnames) and enableDnsSupport (DNS resolution). | [👉 Xem](#question-60) |
| **Câu 61** | Domain 3 | **Shared Storage for Windows Video Editing Workloads using Amazon FSx for Windows File Server** | Just like in Question 10, whenever a cloud-based workload requires shared file storage over the SMB (Server Message Block) protocol with minimal administrative overhead, Amazon FSx for Windows File Server is the native, fully managed AWS service. | [👉 Xem](#question-61) |
| **Câu 65** | Domain 2 | **Amazon RDS Multi-AZ Database Engine Version Upgrade Maintenance Behavior and Downtime** | For a standard Amazon RDS Multi-AZ DB instance deployment (primary + 1 standby), database engine version upgrades upgrade both the primary and standby DB instances at the same time, which causes downtime until the upgrade completes. | [👉 Xem](#question-65) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ✅ Đúng | [Cost-Optimal High-Performance Static Web Hosting with S3, CloudFront & Route 53](#question-01) | Domain 3 |
| [02](#question-02) | ❌ Sai | [Serverless Long-Running Script Orchestration with ECS Fargate and EventBridge](#question-02) | Domain 3 |
| [03](#question-03) | ✅ Đúng | [Multi-Tier Web Migration with ALB, Auto Scaling, and Aurora Serverless v2](#question-03) | Domain 2 |
| [04](#question-04) | ❌ Sai | [Hybrid S3 Ingestion for Legacy Systems via AWS Transfer Family SFTP & IAM](#question-04) | Domain 1 |
| [05](#question-05) | ❌ Sai | [Relational Multi-Region Low-Latency Global Database with Amazon Aurora](#question-05) | Domain 3 |
| [06](#question-06) | ✅ Đúng | [Single-Tenant Regulatory Compliance with Cost-Effective Dedicated Instances](#question-06) | Domain 1 |
| [07](#question-07) | ✅ Đúng | [Aurora MySQL Read Replicas and Non-Disruptive Dev Clones via Automated Backups](#question-07) | Domain 2 |
| [08](#question-08) | ✅ Đúng | [Data Transfer Cost Rules for In-Region vs Cross-Region Amazon RDS Read Replicas](#question-08) | Domain 4 |
| [09](#question-09) | ✅ Đúng | [Amazon EFS Performance Modes: General Purpose vs Max I/O for Big Data](#question-09) | Domain 3 |
| [10](#question-10) | ❌ Sai | [Hybrid Windows File Sharing Migration to Managed Amazon FSx for Windows File Server](#question-10) | Domain 3 |
| [11](#question-11) | ✅ Đúng | [Enforcing Organization-Wide Compliance and Audit Trails with AWS Organizations SCP](#question-11) | Domain 1 |
| [12](#question-12) | ✅ Đúng | [Condition-Based Security Restriction in IAM Policies using aws:SourceIp](#question-12) | Domain 1 |
| [13](#question-13) | ✅ Đúng | [Granular Multi-Tenant Access Management via Dedicated Amazon S3 Access Points](#question-13) | Domain 1 |
| [14](#question-14) | ❌ Sai | [Application Load Balancer User Authentication Integration via Amazon Cognito User Pools](#question-14) | Domain 1 |
| [15](#question-15) | ✅ Đúng | [Decoupling Read and Write Database Workloads using Aurora Read Endpoints](#question-15) | Domain 2 |
| [16](#question-16) | ❌ Sai | [Remediating Unencrypted EBS Volumes via Encrypted Snapshot Copy and Volume Re-attachment](#question-16) | Domain 1 |
| [17](#question-17) | ✅ Đúng | [Global Latency Routing with Route 53 and In-Region Aurora Read Replicas](#question-17) | Domain 3 |
| [18](#question-18) | ✅ Đúng | [Amazon EC2 Auto Scaling Default Termination Policy Hierarchy and Evaluation](#question-18) | Domain 4 |
| [19](#question-19) | ✅ Đúng | [High Availability Multi-AZ Architecture Sizing for N+1 Server Redundancy](#question-19) | Domain 4 |
| [20](#question-20) | ✅ Đúng | [Regulatory Compliance and Key Rotation using Server-Side Encryption with KMS (SSE-KMS)](#question-20) | Domain 1 |
| [21](#question-21) | ❌ Sai | [Centralized Shared POSIX Storage Across EC2 Fleets using Amazon EFS](#question-21) | Domain 2 |
| [22](#question-22) | ✅ Đúng | [High Availability Enterprise Database Migration to Multi-AZ Amazon RDS for SQL Server](#question-22) | Domain 1 |
| [23](#question-23) | ❌ Sai | [Restricting Regional API Invocations via IAM Policy Condition aws:RequestedRegion](#question-23) | Domain 1 |
| [24](#question-24) | ✅ Đúng | [Restricting Private API Gateway Access to On-Premises IPs via Resource Policies](#question-24) | Domain 1 |
| [25](#question-25) | ❌ Sai | [IAM Policy Evaluation: Explicit Deny Overriding Allow for EC2 Actions](#question-25) | Domain 1 |
| [26](#question-26) | ✅ Đúng | [Cross-Account Encrypted RDS Snapshot Sharing using Customer Managed KMS Keys](#question-26) | Domain 1 |
| [27](#question-27) | ✅ Đúng | [Automated Serverless Ad Data Ingestion and Cataloging with AWS Glue and Athena](#question-27) | Domain 3 |
| [28](#question-28) | ✅ Đúng | [Enforcing Client-Side Key Custody via Server-Side Encryption with Customer-Provided Keys (SSE-C)](#question-28) | Domain 1 |
| [29](#question-29) | ❌ Sai | [Amazon EC2 User Data Execution Lifecycle and Default Root User Privileges](#question-29) | Domain 3 |
| [30](#question-30) | ✅ Đúng | [IAM Policy Evaluation for S3 Object Listing and Object Retrieval Permissions](#question-30) | Domain 1 |
| [31](#question-31) | ✅ Đúng | [High-Speed Automated On-Premises to S3 Data Transfer using AWS DataSync](#question-31) | Domain 3 |
| [32](#question-32) | ✅ Đúng | [Disaster Recovery RPO Under 1 Minute and Low Latency Global Reads with Aurora Global Database](#question-32) | Domain 3 |
| [33](#question-33) | ❌ Sai | [Decoupling Microservices with EventBridge and SQS Standard for Fan-Out Buffering](#question-33) | Domain 2 |
| [34](#question-34) | ✅ Đúng | [Scalable Video Upload Notification Fan-Out Pipeline with S3 Events, SNS, and SQS](#question-34) | Domain 1 |
| [35](#question-35) | ❌ Sai | [Automated SSL/TLS Certificate Expiration Auditing using AWS Config Managed Rules](#question-35) | Domain 1 |
| [36](#question-36) | ❌ Sai | [Auto Scaling Group with Application Load Balancer and Multi-AZ Subnets for HA Web Tier](#question-36) | Domain 1 |
| [37](#question-37) | ✅ Đúng | [Fault-Tolerant Multi-AZ EC2 Deployment Sizing for 100% Workload Capacity on AZ Outage](#question-37) | Domain 2 |
| [38](#question-38) | ❌ Sai | [Cost-Effective File Storage for Infrequently Accessed Data with Amazon EFS Standard-IA](#question-38) | Domain 4 |
| [39](#question-39) | ✅ Đúng | [Centralizing Inter-VPC Traffic Flow and Inspection with AWS Transit Gateway](#question-39) | Domain 1 |
| [40](#question-40) | ✅ Đúng | [Decoupling Image Uploads from Asynchronous Processing with S3 Events and SQS](#question-40) | Domain 4 |
| [41](#question-41) | ❌ Sai | [NLP Entity Detection and Sentiment Analysis for Media Articles using Amazon Comprehend](#question-41) | Domain 3 |
| [42](#question-42) | ❌ Sai | [Cost-Effective Batch Workload Execution using EC2 Spot Fleet Diversified Allocation](#question-42) | Domain 4 |
| [43](#question-43) | ❌ Sai | [Blue-Green Global Deployment and Traffic Weighting using AWS Global Accelerator](#question-43) | Domain 2 |
| [44](#question-44) | ✅ Đúng | [Cross-Account S3 Bucket Access Delegation for AWS Lambda using IAM Roles](#question-44) | Domain 1 |
| [45](#question-45) | ❌ Sai | [Secure EC2 S3 Object Uploads using IAM Roles and IAM Instance Profiles](#question-45) | Domain 1 |
| [46](#question-46) | ❌ Sai | [Cross-Region Backup Replication and Archival using S3 Cross-Region Replication (CRR)](#question-46) | Domain 1 |
| [47](#question-47) | ✅ Đúng | [Enforcing Maximum Privilege Ceilings on Developers using IAM Permissions Boundaries](#question-47) | Domain 1 |
| [48](#question-48) | ✅ Đúng | [Petabyte-Scale Offline Data Migration to Amazon S3 Glacier via AWS Snowball](#question-48) | Domain 4 |
| [49](#question-49) | ✅ Đúng | [Protecting Web Applications from Malicious Query Strings using AWS WAF IP Sets](#question-49) | Domain 1 |
| [50](#question-50) | ✅ Đúng | [Cost Optimization Portfolio for Stable vs Bursty Workloads: Reserved Instances + Spot](#question-50) | Domain 4 |
| [51](#question-51) | ✅ Đúng | [Buffering and Sequential Processing for Device Telemetry with Amazon SQS FIFO](#question-51) | Domain 3 |
| [52](#question-52) | ✅ Đúng | [Disaster Recovery Active-Passive Failover with Route 53 and Automated Health Checks](#question-52) | Domain 2 |
| [53](#question-53) | ✅ Đúng | [Cross-Account VPC Resource Sharing using AWS Resource Access Manager (AWS RAM)](#question-53) | Domain 4 |
| [54](#question-54) | ❌ Sai | [Two-Tier Security Architecture: Restricting DB Security Group to Web-Tier SG ID](#question-54) | Domain 1 |
| [55](#question-55) | ❌ Sai | [Decoupling Unpredictable IoT Sensor Bursts using Amazon SQS Standard Queues](#question-55) | Domain 2 |
| [56](#question-56) | ❌ Sai | [Accelerating Global Gaming and Video Traffic with AWS Global Accelerator Anycast IPs](#question-56) | Domain 3 |
| [57](#question-57) | ✅ Đúng | [Instantaneous In-Memory EC2 State Restoration using EC2 Instance Hibernate](#question-57) | Domain 3 |
| [58](#question-58) | ❌ Sai | [S3 Lifecycle Rules: Transitioning Raw Data to S3 Standard-IA and S3 Glacier](#question-58) | Domain 3 |
| [59](#question-59) | ✅ Đúng | [Dynamic Storage Auto-Scaling for Amazon RDS MySQL Without Operational Downtime](#question-59) | Domain 2 |
| [60](#question-60) | ❌ Sai | [VPC DNS Configuration Attributes Required for Route 53 Private Hosted Zones](#question-60) | Domain 1 |
| [61](#question-61) | ❌ Sai | [Shared Storage for Windows Video Editing Workloads using Amazon FSx for Windows File Server](#question-61) | Domain 3 |
| [62](#question-62) | ✅ Đúng | [Three-Tier Web Application Security Group Rules: ALB (443), EC2 (80), RDS (5432)](#question-62) | Domain 1 |
| [63](#question-63) | ✅ Đúng | [Cost-Optimal EC2 Purchasing Strategy: Reserved Instances for Baseline, On-Demand for Surges](#question-63) | Domain 4 |
| [64](#question-64) | ✅ Đúng | [Troubleshooting EC2 Auto Scaling Health Check Grace Period and Impaired Instance State](#question-64) | Domain 2 |
| [65](#question-65) | ❌ Sai | [Amazon RDS Multi-AZ Database Engine Version Upgrade Maintenance Behavior and Downtime](#question-65) | Domain 2 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: Cost-Optimal High-Performance Static Web Hosting with S3, CloudFront & Route 53
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A Hollywood studio is planning a series of promotional events leading up to the launch of the trailer of its next sci-fi thriller. The executives at the studio want to create a static website with lots of animations in line with the theme of the movie. The studio has hired you as a solutions architect to build a scalable serverless solution. Which of the following represents the MOST cost-optimal and high-performance solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Build the website as a static website hosted on Amazon S3. Create an Amazon CloudFront distribution with Amazon S3 as the origin. Use Amazon Route 53 to create an alias record that points to your Amazon CloudFront distribution. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 natively hosts static websites (HTML, CSS, client-side scripts, animations) serverlessly and cost-effectively. Amazon CloudFront caches those files at global edge locations to provide low latency and high transfer speeds, and Amazon Route 53 uses an Alias record to route domain traffic to the CloudFront distribution. AWS Lambda cannot host a website or act as a CloudFront origin in this way, and EC2/on-premises instances are not serverless.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-02"></div>

### Question 02: Serverless Long-Running Script Orchestration with ECS Fargate and EventBridge
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A manufacturing analytics company has a large collection of automated scripts that perform data cleanup, validation, and system integration tasks. These scripts are currently run by a local Linux cron scheduler and have an execution time of up to 30 minutes. The company wants to migrate these scripts to AWS without significant changes, and would prefer a containerized, serverless architecture that automatically scales and can respond to event-based triggers in the future. The solution must minimize infrastructure management. Which solution will best meet these requirements with minimal refactoring and operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Convert each script into a Lambda function and package it in a zip archive. Use Amazon EventBridge Scheduler to run the functions on a fixed schedule. Use Amazon S3 to store function outputs and logs. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Package the scripts into a container image. Use Amazon EventBridge Scheduler to define cron-based recurring schedules. Configure EventBridge Scheduler to invoke AWS Fargate tasks using Amazon ECS. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Lambda has a hard maximum execution timeout of 15 minutes, making it impossible to run scripts that take up to 30 minutes without major refactoring. Packaging the existing scripts into containers and running them on Amazon ECS with AWS Fargate provides a serverless container environment with no 15-minute execution cap. Amazon EventBridge Scheduler natively triggers ECS Fargate tasks on cron schedules and supports future event-driven triggers.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-03"></div>

### Question 03: Multi-Tier Web Migration with ALB, Auto Scaling, and Aurora Serverless v2
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A media publishing company is migrating its legacy content management application to AWS. Currently, the application and its MySQL database run on a single on-premises virtual machine, which creates a single point of failure and limits scalability. As traffic has increased due to growing reader engagement and video uploads, the company needs to redesign the solution to ensure automatic scaling, high availability, and separation of application and database layers. The company wants to continue using a MySQL-compatible engine and needs a cost-effective, managed solution that minimizes operational overhead. Which AWS architecture will best fulfill these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the application to Amazon EC2 instances in an Auto Scaling group behind an Application Load Balancer. Use Amazon Aurora Serverless v2 for MySQL to manage the database layer with auto-scaling and built-in high availability. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
An EC2 Auto Scaling group behind an Application Load Balancer (ALB) provides horizontal scaling and high availability for the application tier, while Amazon Aurora Serverless v2 for MySQL provides instantaneous, granular compute auto-scaling and Multi-AZ high availability for the database tier without manual instance resizing.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-04"></div>

### Question 04: Hybrid S3 Ingestion for Legacy Systems via AWS Transfer Family SFTP & IAM
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A multinational logistics company is migrating its core systems to AWS. As part of this migration, the company has built an Amazon S3–based data lake to ingest and analyze supply chain data from external carriers and vendors. While some vendors have adopted the company’s modern REST-based APIs for S3 uploads, others operate legacy systems that rely exclusively on SFTP for file transfers. These vendors are unable or unwilling to modify their workflows to support S3 APIs. The company wants to provide these vendors with an SFTP-compatible solution that allows direct uploads to Amazon S3, and must use fully managed AWS services to avoid managing any infrastructure. It must also support identity federation so that internal teams can map vendor access securely to specific S3 buckets or prefixes. Which combination of options will provide a scalable and low-maintenance solution for this use case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Only selected 1 option (Configure Amazon S3 bucket policies to use IAM role-based access control for each vendor. Combine this with Transfer Family identity provider integration using Amazon Cognito or a custom identity provider for fine-grained permissions). `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Deploy a fully managed AWS Transfer Family endpoint with SFTP enabled. Configure it to store uploaded files directly in an Amazon S3 bucket. Set up IAM roles mapped to each vendor for secure bucket or prefix access. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Transfer Family is a fully managed service that allows legacy SFTP clients to upload files directly into Amazon S3 buckets without managing EC2 SFTP servers. Integrating Transfer Family with an identity provider (like Amazon Cognito or a custom IdP) and mapping each vendor to specific IAM roles enforces least-privilege access to individual S3 buckets or prefixes. (Exam tip: Always verify you have selected the required number of checkboxes on multi-select questions!)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-05"></div>

### Question 05: Relational Multi-Region Low-Latency Global Database with Amazon Aurora
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An IT company has an Access Control Management (ACM) application that uses Amazon RDS for MySQL but is running into performance issues despite using Read Replicas. The company has hired you as a solutions architect to address these performance-related challenges without moving away from the underlying relational database schema. The company has branch offices across the world, and it needs the solution to work on a global scale. Which of the following will you recommend as the MOST cost-effective and high-performance solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Spin up a Amazon Redshift cluster in each AWS region. Migrate the existing data into Redshift clusters. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Use Amazon Aurora Global Database to enable fast local reads with low latency in each region. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Aurora Global Database is MySQL-compatible (preserving the relational schema) and replicates data across multiple AWS Regions with sub-second latency, enabling fast local reads for global branch offices. Amazon Redshift is an OLAP (analytical data warehouse) service, not an OLTP (transactional) database. DynamoDB Global Tables is NoSQL and would break the requirement to keep the relational schema.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-06"></div>

### Question 06: Single-Tenant Regulatory Compliance with Cost-Effective Dedicated Instances
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A health-care solutions company wants to run their applications on single-tenant hardware to meet regulatory guidelines. Which of the following is the MOST cost-effective way of isolating their Amazon Elastic Compute Cloud (Amazon EC2) instances to a single tenant?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Dedicated Instances `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Dedicated Instances run on hardware dedicated to a single customer and are more cost-effective than Dedicated Hosts when you only need hardware isolation and do not require visibility into physical sockets/cores or server-bound BYOL licensing.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-07"></div>

### Question 07: Aurora MySQL Read Replicas and Non-Disruptive Dev Clones via Automated Backups
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A media company is migrating its flagship application from its on-premises data center to AWS for improving the application's read-scaling capability as well as its availability. The existing architecture leverages a Microsoft SQL Server database that sees a heavy read load. The engineering team does a full copy of the production database at the start of the business day to populate a dev database. During this period, application users face high latency leading to a bad user experience. The company is looking at alternate database options and migrating database engines if required. What would you suggest?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Leverage Amazon Aurora MySQL with Multi-AZ Aurora Replicas and create the dev database by restoring from the automated backups of Amazon Aurora. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Aurora MySQL Multi-AZ Replicas scale read workloads and provide high availability. Because Aurora's automated backups are continuous, incremental, and stored in S3, restoring a dev database from automated backups causes zero performance impact on the primary database (whereas mysqldump causes heavy load, and read replicas/standby instances are read-only and cannot be used as a dev database).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-08"></div>

### Question 08: Data Transfer Cost Rules for In-Region vs Cross-Region Amazon RDS Read Replicas
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The engineering manager for a content management application wants to set up Amazon RDS read replicas to provide enhanced performance and read scalability. The manager wants to understand the data transfer charges while setting up Amazon RDS read replicas. Which of the following would you identify as correct regarding the data transfer charges for Amazon RDS read replicas?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** There are data transfer charges for replicating data across AWS Regions. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS does not charge for data transfer when replicating data between a source DB instance and a read replica within the same AWS Region, but cross-Region read replica data transfer incurs standard inter-Region data transfer charges.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-09"></div>

### Question 09: Amazon EFS Performance Modes: General Purpose vs Max I/O for Big Data
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An analytics company wants to improve the performance of its big data processing workflows running on Amazon Elastic File System (Amazon EFS). Which of the following performance modes should be used for Amazon EFS to address this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Max I/O `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
EFS offers two performance modes: General Purpose (low latency for web serving/CMS) and Max I/O (scales to higher levels of aggregate throughput and IOPS for highly parallelized big data and media workloads). Bursting and Provisioned are throughput modes, not performance modes.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-10"></div>

### Question 10: Hybrid Windows File Sharing Migration to Managed Amazon FSx for Windows File Server
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Your company has an on-premises Distributed File System Replication (DFSR) service to keep files synchronized on multiple Windows servers, and would like to migrate to AWS cloud. What do you recommend as a replacement for the DFSR?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon Elastic File System (Amazon EFS) `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Amazon FSx for Windows File Server `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon FSx for Windows File Server is built on Windows Server, supports the SMB protocol, integrates with Microsoft Active Directory, and supports Multi-AZ Microsoft Distributed File System (DFS) namespaces and replication. Amazon EFS and FSx for Lustre are Linux-only (NFS/POSIX) file systems.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-11"></div>

### Question 11: Enforcing Organization-Wide Compliance and Audit Trails with AWS Organizations SCP
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A security consultant is designing a solution for a company that wants to provide developers with individual AWS accounts through AWS Organizations, while also maintaining standard security controls. Since the individual developers will have AWS account root user-level access to their own accounts, the consultant wants to ensure that the mandatory AWS CloudTrail configuration that is applied to new developer accounts is not modified. Which of the following actions meets the given requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a service control policy (SCP) that prohibits changes to AWS CloudTrail, and attach it to the developer accounts. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Service Control Policies (SCPs) in AWS Organizations define the maximum available permissions for member accounts, including the member account's root user. An explicit Deny on CloudTrail modification actions in an SCP prevents even the member root user from altering CloudTrail.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-12"></div>

### Question 12: Condition-Based Security Restriction in IAM Policies using aws:SourceIp
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
What does this IAM policy do?
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Mystery Policy",
      "Action": ["ec2:RunInstances"],
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "34.50.31.0/24"
        }
      }
    }
  ]
}

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** It allows starting an Amazon EC2 instance only when the IP where the call originates is within the 34.50.31.0/24 CIDR block. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The aws:SourceIp IAM condition key checks the public IP address of the client making the API request, not the IP address assigned to the EC2 instance being launched.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-13"></div>

### Question 13: Granular Multi-Tenant Access Management via Dedicated Amazon S3 Access Points
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An enterprise uses a centralized Amazon S3 bucket to store logs and reports generated by multiple analytics services. Each service writes to and reads from a dedicated prefix (folder path) in the bucket. The company wants to enforce fine-grained access control so that each service can access only its own prefix, without being able to see or modify other services' data. The solution must support scalable and maintainable permissions management with minimal operational overhead. Which approach will best meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure individual S3 access points for each analytics service. Attach access point policies that restrict access to only the relevant prefix in the S3 bucket. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon S3 Access Points simplify managing access to shared data sets on S3. Creating a dedicated access point per service with its own access point policy scoped to a specific prefix avoids maintaining a massive, complex single bucket policy.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-14"></div>

### Question 14: Application Load Balancer User Authentication Integration via Amazon Cognito User Pools
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A social media application is hosted on an Amazon EC2 fleet running behind an Application Load Balancer. The application traffic is fronted by an Amazon CloudFront distribution. The engineering team wants to decouple the user authentication process for the application, so that the application servers can just focus on the business logic. As a Solutions Architect, which of the following solutions would you recommend to the development team so that it requires minimal development effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Cognito Authentication via Cognito User Pools for your Amazon CloudFront distribution. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Use Amazon Cognito Authentication via Cognito User Pools for your Application Load Balancer. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Application Load Balancer (ALB) has native built-in support for authenticating users via Amazon Cognito User Pools (or OIDC) using listener rules, requiring zero custom code. CloudFront does not natively integrate with Cognito User Pools without developing custom Lambda@Edge functions. (Also note: Cognito User Pools handle authentication, whereas Cognito Identity Pools provide temporary AWS credentials for authorization).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-15"></div>

### Question 15: Decoupling Read and Write Database Workloads using Aurora Read Endpoints
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An e-commerce application uses an Amazon Aurora Multi-AZ deployment for its database. While analyzing the performance metrics, the engineering team has found that the database reads are causing high input/output (I/O) and adding latency to the write requests against the database. As an AWS Certified Solutions Architect Associate, what would you recommend to separate the read requests from the write requests?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a read replica and modify the application to use the appropriate endpoint. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Aurora clusters provide a Reader Endpoint that automatically load-balances read-only queries across Aurora Replicas, offloading read I/O from the Primary (writer) instance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-16"></div>

### Question 16: Remediating Unencrypted EBS Volumes via Encrypted Snapshot Copy and Volume Re-attachment
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Upon a security review of your AWS account, an AWS consultant has found that a few Amazon RDS databases are unencrypted. As a Solutions Architect, what steps must be taken to encrypt the Amazon RDS databases?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Multi-AZ for the database, and make sure the standby instance is encrypted. Stop the main database to that the standby database kicks in, then disable Multi-AZ. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Take a snapshot of the database, copy it as an encrypted snapshot, and restore a database from the encrypted snapshot. Terminate the previous database. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You cannot encrypt an existing unencrypted Amazon RDS database in-place, and an unencrypted primary DB cannot have an encrypted Multi-AZ standby or encrypted read replica. To encrypt an existing RDS DB:
Take a snapshot of the unencrypted DB instance.
Copy the snapshot and enable encryption on the snapshot copy.
Restore a new DB instance from the encrypted snapshot.
Point your application to the new DB and terminate the old unencrypted DB.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-17"></div>

### Question 17: Global Latency Routing with Route 53 and In-Region Aurora Read Replicas
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A silicon valley based startup has a content management application with the web-tier running on Amazon EC2 instances and the database tier running on Amazon Aurora. Currently, the entire infrastructure is located in us-east-1 region. The startup has 90% of its customers in the US and Europe. The engineering team is getting reports of deteriorated application performance from customers in Europe with high application load time. As a solutions architect, which of the following would you recommend addressing these performance issues? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Setup another fleet of Amazon EC2 instances for the web tier in the eu-west-1 region. Enable latency routing policy in Amazon Route 53. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Route 53 Latency-based routing directs users to the AWS Region that provides the lowest network latency, and cross-Region Amazon Aurora Read Replicas allow read queries in Europe to be served locally from eu-west-1.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-18"></div>

### Question 18: Amazon EC2 Auto Scaling Default Termination Policy Hierarchy and Evaluation
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
Amazon EC2 Auto Scaling needs to terminate an instance from Availability Zone (AZ) us-east-1a as it has the most number of instances amongst the Availability Zone (AZs) being used currently. There are 4 instances in the Availability Zone (AZ) us-east-1a like so: Instance A has the oldest launch template, Instance B has the oldest launch configuration, Instance C has the newest launch configuration and Instance D is closest to the next billing hour. Which of the following instances would be terminated per the default termination policy?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Instance B `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
In the EC2 Auto Scaling default termination policy, instances launched from a launch configuration are terminated before instances launched from a launch template. If multiple instances use a launch configuration, the one with the oldest launch configuration (Instance B) is selected first.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-19"></div>

### Question 19: High Availability Multi-AZ Architecture Sizing for N+1 Server Redundancy
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An application is currently hosted on four Amazon EC2 instances (behind Application Load Balancer) deployed in a single Availability Zone (AZ). To maintain an acceptable level of end-user experience, the application needs at least 4 instances to be always available. As a solutions architect, which of the following would you recommend so that the application achieves high availability with MINIMUM cost?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the instances in three Availability Zones (AZs). Launch two instances in each Availability Zone (AZ). `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Deploying 2 instances across 3 AZs requires only 6 instances total. If any 1 AZ fails, 4 instances remain active in the other two AZs, meeting the 4-instance minimum at a lower cost than running 4 instances in each of 2 AZs (8 instances total).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-20"></div>

### Question 20: Regulatory Compliance and Key Rotation using Server-Side Encryption with KMS (SSE-KMS)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial services company wants to store confidential data in Amazon S3 and it needs to meet the following data security and compliance norms: 1) Encryption key usage must be logged for auditing purposes, 2) Encryption Keys must be rotated every year, 3) The data must be encrypted at rest. Which is the MOST operationally efficient solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Server-side encryption with AWS Key Management Service (AWS KMS) keys (SSE-KMS) with automatic key rotation. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
SSE-KMS logs all key usage in AWS CloudTrail for auditing and supports automatic annual key rotation with a single checkbox. (SSE-S3 does not allow auditing individual key usage in CloudTrail).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-21"></div>

### Question 21: Centralized Shared POSIX Storage Across EC2 Fleets using Amazon EFS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A startup has just developed a video backup service hosted on a fleet of Amazon EC2 instances. The Amazon EC2 instances are behind an Application Load Balancer and the instances are using Amazon Elastic Block Store (Amazon EBS) Volumes for storage. The service provides authenticated users the ability to upload videos that are then saved on the EBS volume attached to a given instance. On the first day of the beta launch, users start complaining that they can see only some of the videos in their uploaded videos backup. Every time the users log into the website, they claim to see a different subset of their uploaded videos. Which of the following is the MOST optimal solution to make sure that users can view all the uploaded videos? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Write a one time job to copy the videos from all Amazon EBS volumes to Amazon S3 Glacier Deep Archive and then modify the application to use Amazon S3 Glacier Deep Archive for storing the videos. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Write a one time job to copy the videos from all Amazon EBS volumes to Amazon DynamoDB and then modify the application to use Amazon DynamoDB for storing the videos. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Mount Amazon Elastic File System (Amazon EFS) on all Amazon EC2 instances. Write a one time job to copy the videos from all Amazon EBS volumes to Amazon EFS. Modify the application to use Amazon EFS for storing the videos. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Because EBS volumes are local to individual EC2 instances, videos uploaded by a user are scattered across different servers. To give all EC2 instances shared access to all videos for immediate playback, you must store the videos in Amazon S3 Standard (shared object storage) or Amazon EFS (shared network file system mounted across all instances). S3 Glacier Deep Archive is for cold archival (takes hours to restore), and DynamoDB is a NoSQL database (400 KB max item size, not meant for video files).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-22"></div>

### Question 22: High Availability Enterprise Database Migration to Multi-AZ Amazon RDS for SQL Server
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial institution is transitioning its critical back-office systems to AWS. These systems currently rely on Microsoft SQL Server databases hosted on on-premises infrastructure. The data is highly sensitive and subject to regulatory compliance. The organization wants to enhance security and minimize database management tasks as part of the migration. Which solution will best meet these goals with the least operational burden?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the SQL Server databases to a Multi-AZ Amazon RDS for SQL Server deployment. Enable encryption at rest by using an AWS Key Management Service (AWS KMS) managed key. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS for SQL Server with Multi-AZ and KMS encryption is fully managed, handling patching, backups, failover, and encryption at rest with minimal operational overhead.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-23"></div>

### Question 23: Restricting Regional API Invocations via IAM Policy Condition aws:RequestedRegion
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
What does this IAM policy do?
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Mystery Policy",
      "Action": ["ec2:RunInstances"],
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": "eu-west-1"
        }
      }
    }
  ]
}

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** It allows running Amazon EC2 instances in any region when the API call is originating from the eu-west-1 region. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** It allows running Amazon EC2 instances only in the eu-west-1 region, and the API call can be made from anywhere in the world. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The aws:RequestedRegion global condition key compares the target AWS Region of the API request (the Region where the resource is being created/acted upon) with the Region specified in the policy. The user can make the API call from anywhere in the world, provided they are launching the EC2 instance inside eu-west-1.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-24"></div>

### Question 24: Restricting Private API Gateway Access to On-Premises IPs via Resource Policies
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An enterprise is building a secure business intelligence API using Amazon API Gateway to serve internal users with confidential analytics data. The API must be accessible only from a set of trusted IP addresses that are part of the organization's internal network ranges. No external IP traffic should be able to invoke the API. A solutions architect must design this access control mechanism with the least operational complexity. What should the architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a resource policy for the API Gateway API that explicitly denies access to all IP addresses except those listed in an allow list. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
API Gateway resource policies are JSON policy documents attached directly to an API that can restrict access by IP address ranges (aws:SourceIp) without provisioning network appliances.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-25"></div>

### Question 25: IAM Policy Evaluation: Explicit Deny Overriding Allow for EC2 Actions
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Consider the following policy associated with an IAM group containing several users:
{
    "Version":"2012-10-17",
    "Id":"EC2TerminationPolicy",
    "Statement":[
        {
            "Effect":"Deny",
            "Action":"ec2:*",
            "Resource":"*",
            "Condition":{
                "StringNotEquals":{
                    "ec2:Region":"us-west-1"
                }
            }
        },
        {
            "Effect":"Allow",
            "Action":"ec2:TerminateInstances",
            "Resource":"*",
            "Condition":{
                "IpAddress":{
                    "aws:SourceIp":"10.200.200.0/24"
                }
            }
        }
    ]
}
Which of the following options is correct?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Users belonging to the IAM user group can terminate an Amazon EC2 instance in the us-west-1 region when the EC2 instance's IP address is 10.200.200.200. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Users belonging to the IAM user group can terminate an Amazon EC2 instance in the us-west-1 region when the user's source IP is 10.200.200.200. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Just like in Question 12, aws:SourceIp refers to the caller's (user's) source IP address, not the IP address of the EC2 instance. Combined with the first statement (which denies any EC2 action outside us-west-1), users in the group can terminate EC2 instances in us-west-1 when the user's request originates from 10.200.200.200.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-26"></div>

### Question 26: Cross-Account Encrypted RDS Snapshot Sharing using Customer Managed KMS Keys
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A retail company wants to share sensitive accounting data that is stored in an Amazon RDS database instance with an external auditor. The auditor has its own AWS account and needs its own copy of the database. Which of the following would you recommend to securely share the database with the auditor?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an encrypted snapshot of the database, share the snapshot, and allow access to the AWS Key Management Service (AWS KMS) encryption key. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Sharing an encrypted RDS DB snapshot across AWS accounts requires sharing the manual snapshot with the target account and granting the target account permissions in the customer-managed AWS KMS key policy.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-27"></div>

### Question 27: Automated Serverless Ad Data Ingestion and Cataloging with AWS Glue and Athena
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A digital media company stores several terabytes of newly generated advertising interaction logs in an Amazon S3 bucket each day. The development team needs to inspect the new dataset quickly by running ad hoc queries before deciding whether the records should enter a downstream transformation workflow. The company wants to minimize infrastructure management and operational effort. Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an AWS Glue crawler to catalog the S3 dataset, and use Amazon Athena to run ad hoc SQL queries directly against the data. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Glue crawlers automatically discover schema metadata in S3, and Amazon Athena is a serverless interactive query service that runs standard SQL directly against S3 objects with zero infrastructure management.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-28"></div>

### Question 28: Enforcing Client-Side Key Custody via Server-Side Encryption with Customer-Provided Keys (SSE-C)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial services company has developed its flagship application on AWS Cloud with data security requirements such that the encryption key must be stored in a custom application running on-premises. The company wants to offload the data storage as well as the encryption process to Amazon S3 but continue to use the existing encryption key. Which of the following Amazon S3 encryption options allows the company to leverage Amazon S3 for storing data with given constraints?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Server-Side Encryption with Customer-Provided Keys (SSE-C) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
With SSE-C, the customer stores and manages the encryption keys (on-premises) and passes the key to S3 with each read/write request, while S3 performs the CPU-intensive encryption and decryption server-side.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-29"></div>

### Question 29: Amazon EC2 User Data Execution Lifecycle and Default Root User Privileges
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An engineering team wants to examine the feasibility of the user data feature of Amazon EC2 for an upcoming project. Which of the following are true about the Amazon EC2 user data configuration? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** By default, user data runs only during the boot cycle when you first launch an instance (Correct) `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** By default, scripts entered as user data do not have root user privileges for executing (Incorrect) `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** By default, scripts entered as user data are executed with root user privileges. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
EC2 User Data scripts run only once during the initial launch boot cycle by default, and they always execute as the root user by default (you do not need sudo in user data scripts). Additionally, to modify user data on an existing instance, the instance must first be stopped.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-30"></div>

### Question 30: IAM Policy Evaluation for S3 Object Listing and Object Retrieval Permissions
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
Which of the following IAM policies provides read-only access to the Amazon S3 bucket mybucket and its content?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** { `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Bucket-level operations like s3:ListBucket apply to the bucket ARN (arn:aws:s3:::mybucket), whereas object-level operations like s3:GetObject apply to objects inside the bucket (arn:aws:s3:::mybucket/*).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-31"></div>

### Question 31: High-Speed Automated On-Premises to S3 Data Transfer using AWS DataSync
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A media company has created an AWS Direct Connect connection for migrating its flagship application to the AWS Cloud. The on-premises application writes hundreds of video files into a mounted NFS file system daily. Post-migration, the company will host the application on an Amazon EC2 instance with a mounted Amazon Elastic File System (Amazon EFS) file system. Before the migration cutover, the company must build a process that will replicate the newly created on-premises video files to the Amazon EFS file system. Which of the following represents the MOST operationally efficient way to meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an AWS DataSync agent on the on-premises server that has access to the NFS file system. Transfer data over the AWS Direct Connect connection to an AWS PrivateLink interface VPC endpoint for Amazon EFS by using a private VIF. Set up an AWS DataSync scheduled task to send the video files to the Amazon EFS file system every 24 hours. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS DataSync natively replicates NFS file systems to Amazon EFS on a recurring schedule, and can route privately over Direct Connect using a Private VIF and an Interface VPC Endpoint (AWS PrivateLink).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-32"></div>

### Question 32: Disaster Recovery RPO Under 1 Minute and Low Latency Global Reads with Aurora Global Database
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is developing a global healthcare application that requires the least possible latency for database read/write operations from users in several geographies across the world. The company has hired you as an AWS Certified Solutions Architect Associate to build a solution using Amazon Aurora that offers an effective recovery point objective (RPO) of seconds and a recovery time objective (RTO) of a minute. Which of the following options would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an Amazon Aurora Global Database cluster `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Aurora Global Database spans multiple AWS Regions with dedicated storage-level replication, delivering an RPO of ~1 second and an RTO of < 1 minute during Regional failover.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-33"></div>

### Question 33: Decoupling Microservices with EventBridge and SQS Standard for Fan-Out Buffering
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A financial services company runs a Kubernetes-based microservices application in its on-premises data center. The application uses the Advanced Message Queuing Protocol (AMQP) to interact with a message queue. The company is experiencing rapid growth and its on-prem infrastructure cannot scale fast enough. The company wants to migrate the application to AWS with minimal code changes and reduce infrastructure management overhead. The messaging component must continue using AMQP, and the solution should offer high scalability and low operational effort. Which combination of options will together meet these requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Simple Queue Service (Amazon SQS) as the replacement for the AMQP message broker. Refactor the application to use SQS SDKs and polling logic. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Run the application on Amazon EC2 Auto Scaling groups and use a self-hosted RabbitMQ instance on EC2 to preserve AMQP compatibility. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Deploy the containerized application to Amazon Elastic Kubernetes Service (Amazon EKS) using AWS Fargate to avoid managing EC2 nodes. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Compute: Because the app is already Kubernetes-based, Amazon EKS with AWS Fargate lets the company migrate its Kubernetes manifests directly without managing EC2 worker nodes.
Messaging: Amazon SQS does not support industry-standard protocols like AMQP, MQTT, or JMS (it uses its own proprietary AWS API). Whenever a question requires preserving AMQP, MQTT, OpenWire, or STOMP with minimal code changes and managed infrastructure, choose Amazon MQ (managed ActiveMQ / RabbitMQ).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-34"></div>

### Question 34: Scalable Video Upload Notification Fan-Out Pipeline with S3 Events, SNS, and SQS
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An enterprise organization is expanding its cloud footprint and needs to centralize its security event data from various AWS accounts and services. The goal is to evaluate security posture across all environments and improve threat detection and response — without requiring significant custom code or manual integration. Which solution will fulfill these needs with the least development effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Security Lake to create a centralized data lake that automatically collects security-related logs and events from AWS services and third-party sources. Store the data in an Amazon S3 bucket managed by Security Lake. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Security Lake is purpose-built to automatically collect, normalize (using OCSF), and centralize security logs across AWS accounts, Regions, and third-party providers into Amazon S3.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-35"></div>

### Question 35: Automated SSL/TLS Certificate Expiration Auditing using AWS Config Managed Rules
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A financial services company has deployed its flagship application on Amazon EC2 instances. Since the application handles sensitive customer data, the security team at the company wants to ensure that any third-party Secure Sockets Layer certificate (SSL certificate) SSL/Transport Layer Security (TLS) certificates configured on Amazon EC2 instances via the AWS Certificate Manager (ACM) are renewed before their expiry date. The company has hired you as an AWS Certified Solutions Architect Associate to build a solution that notifies the security team 30 days before the certificate expiration. The solution should require the least amount of scripting and maintenance effort. What will you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Monitor the days to expiry Amazon CloudWatch metric for certificates created via ACM. Create a CloudWatch alarm to monitor such certificates based on the days to expiry metric and then trigger a custom action of notifying the security team. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Leverage AWS Config managed rule to check if any third-party SSL/TLS certificates imported into ACM are marked for expiration within 30 days. Configure the rule to trigger an Amazon SNS notification to the security team if any certificate expires within 30 days. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Two key points here:
Certificates created via ACM are renewed automatically by ACM; only imported third-party certificates require manual renewal monitoring.
AWS Config provides an off-the-shelf managed rule (acm-certificate-expiration-check) that evaluates imported ACM certificates against a specified number of days (e.g., 30 days) and can directly notify the team via Amazon SNS with minimal setup.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-36"></div>

### Question 36: Auto Scaling Group with Application Load Balancer and Multi-AZ Subnets for HA Web Tier
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A SaaS company is modernizing one of its legacy web applications by migrating it to AWS. The company aims to improve the availability of the application during both normal and peak traffic periods. Additionally, the company wants to implement protection against common web exploits and malicious traffic. The architecture must be scalable and integrate AWS WAF to secure incoming traffic. Which solution will best meet these requirements with high availability and minimal configuration complexity?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Auto Scaling group with EC2 instances in multiple Availability Zones. Attach a Network Load Balancer (NLB) to distribute incoming traffic. Integrate AWS WAF directly with the Auto Scaling group for traffic filtering. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Deploy the application on multiple Amazon EC2 instances in an Auto Scaling group that spans two Availability Zones. Place an Application Load Balancer (ALB) in front of the group. Associate AWS WAF with the ALB. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS WAF is a Layer 7 web application firewall. It can only be attached to an Application Load Balancer (ALB), Amazon CloudFront, Amazon API Gateway, AWS AppSync, Amazon Cognito User Pools, or AWS App Runner. It cannot be attached to a Network Load Balancer (NLB) or an EC2 Auto Scaling group.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-37"></div>

### Question 37: Fault-Tolerant Multi-AZ EC2 Deployment Sizing for 100% Workload Capacity on AZ Outage
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An IT company is working on a client project to build a Supply Chain Management application. The web-tier of the application runs on an Amazon EC2 instance and the database tier is on Amazon RDS MySQL. For beta testing, all the resources are currently deployed in a single Availability Zone (AZ). The development team wants to improve application availability before the go-live. Given that all end users of the web application would be located in the US, which of the following would be the MOST resource-efficient solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the web-tier Amazon EC2 instances in two Availability Zones (AZs), behind an Elastic Load Balancer. Deploy the Amazon RDS MySQL database in Multi-AZ configuration. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Deploying EC2 instances across two AZs behind an ELB and configuring RDS MySQL in Multi-AZ mode provides high availability and automatic failover for both tiers. (RDS Read Replicas are for read scalability, not automatic HA failover).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-38"></div>

### Question 38: Cost-Effective File Storage for Infrequently Accessed Data with Amazon EFS Standard-IA
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is looking at storing their less frequently accessed files on AWS that can be concurrently accessed by hundreds of Amazon EC2 instances. The company needs the most cost-effective file storage service that provides immediate access to data whenever needed. Which of the following options represents the best solution for the given requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon Elastic File System (EFS) Standard storage class `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Amazon Elastic File System (EFS) Standard–IA storage class `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
While Amazon EFS is the right service for shared file storage concurrently mounted by hundreds of EC2 instances, the question specifically asks to store less frequently accessed files in the most cost-effective way. EFS Standard–Infrequent Access (Standard–IA) is much cheaper per GB than EFS Standard while still providing immediate access across multiple AZs.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-39"></div>

### Question 39: Centralizing Inter-VPC Traffic Flow and Inspection with AWS Transit Gateway
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An e-commerce company operates multiple AWS accounts and has interconnected these accounts in a hub-and-spoke style using the AWS Transit Gateway. Amazon Virtual Private Cloud (Amazon VPCs) have been provisioned across these AWS accounts to facilitate network isolation. Which of the following solutions would reduce both the administrative overhead and the costs while providing shared access to services required by workloads in each of the VPCs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Build a shared services Amazon Virtual Private Cloud (Amazon VPC) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
A Shared Services VPC connected to the AWS Transit Gateway centralizes shared resources (such as interface VPC endpoints and directory services), avoiding the cost and administrative overhead of provisioning duplicate endpoints in every spoke VPC.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-40"></div>

### Question 40: Decoupling Image Uploads from Asynchronous Processing with S3 Events and SQS
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A mobile app allows users to submit photos, which are stored in an Amazon S3 bucket. Currently, a batch of Amazon EC2 Spot Instances is launched nightly to process all the day’s uploads. Each photo requires approximately 3 minutes and 512 MB of memory to process. To improve responsiveness and minimize costs, the company wants to shift to near real-time image processing that begins as soon as an image is uploaded. Which solution will provide the MOST cost-effective and scalable architecture to meet these new requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon S3 to send event notifications to an Amazon SQS queue each time a photo is uploaded. Set up an AWS Lambda function to poll the queue and process images asynchronously. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Because each image takes 3 minutes and 512 MB of RAM (well within Lambda's 15-minute and 10 GB limits), triggering AWS Lambda via S3 Event Notifications and an SQS buffer provides near real-time, serverless, pay-per-use processing.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-41"></div>

### Question 41: NLP Entity Detection and Sentiment Analysis for Media Articles using Amazon Comprehend
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A global media agency is developing a cultural analysis project to explore how major sports stories have evolved over the last five years. The team has collected thousands of archived news bulletins and magazine spreads stored in PDF format. These documents are rich in unstructured text and come from various sources with differing layouts and font styles. The agency wants to better understand how public tone and narrative have shifted over time. The team has chosen to use Amazon Textract for its ability to accurately extract printed and scanned text from complex PDF layouts. They need a solution that can then analyze the emotional tone and subject matter of the extracted text with the least possible operational burden, using fully managed AWS services where possible. Which solution will best meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Ingest the extracted data into Amazon Redshift using AWS Glue, and use Amazon Rekognition to analyze the tone of the document layouts for sentiment classification. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Send the extracted text to Amazon Comprehend for entity detection and sentiment analysis. Store the results in Amazon S3 for further access or visualization. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Comprehend is AWS's fully managed Natural Language Processing (NLP) service that extracts sentiment (emotional tone: positive, negative, neutral, mixed), key phrases, entities, and topics from text. Amazon Rekognition is a computer vision service for images and videos, not text sentiment analysis.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-42"></div>

### Question 42: Cost-Effective Batch Workload Execution using EC2 Spot Fleet Diversified Allocation
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Your company has a monthly big data workload, running for about 2 hours, which can be efficiently distributed across multiple servers of various sizes, with a variable number of CPUs. The solution for the workload should be able to withstand server failures. Which is the MOST cost-optimal solution for this workload?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Run the workload on Spot Instances `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Run the workload on a Spot Fleet `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
When a workload can run across multiple servers of various sizes with a variable number of CPUs and must withstand server failures, a Spot Fleet is superior to standalone Spot Instances. A Spot Fleet automatically selects the cheapest combination of Spot Instance pools (lowestPrice strategy) across diverse instance types and automatically launches replacement instances if any Spot Instance is interrupted.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-43"></div>

### Question 43: Blue-Green Global Deployment and Traffic Weighting using AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A retail company wants to rollout and test a blue-green deployment for its global application in the next 48 hours. Most of the customers use mobile phones which are prone to Domain Name System (DNS) caching. The company has only two days left for the annual Thanksgiving sale to commence. As a Solutions Architect, which of the following options would you recommend to test the deployment on as many users as possible in the given time frame?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Elastic Load Balancing (ELB) to distribute traffic across deployments `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Use AWS Global Accelerator to distribute a portion of traffic to a particular deployment `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
An ELB is a single-Region resource and cannot distribute traffic across a global (multi-Region) application.
Route 53 weighted routing relies on DNS, which is hindered by mobile clients caching DNS records for long periods.
AWS Global Accelerator provides static Anycast IPs and uses traffic dials and endpoint weights to shift traffic across global endpoints within seconds, completely bypassing client-side DNS caching.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-44"></div>

### Question 44: Cross-Account S3 Bucket Access Delegation for AWS Lambda using IAM Roles
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A developer needs to implement an AWS Lambda function in AWS account A that accesses an Amazon Simple Storage Service (Amazon S3) bucket in AWS account B. As a Solutions Architect, which of the following will you recommend to meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an IAM role for the AWS Lambda function that grants access to the Amazon S3 bucket. Set the IAM role as the AWS Lambda function's execution role. Make sure that the bucket policy also grants access to the AWS Lambda function's execution role. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Cross-account S3 access from a Lambda function requires explicit permissions on both the IAM execution role in Account A and the S3 Bucket Policy in Account B.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-45"></div>

### Question 45: Secure EC2 S3 Object Uploads using IAM Roles and IAM Instance Profiles
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A social photo-sharing web application is hosted on Amazon Elastic Compute Cloud (Amazon EC2) instances behind an Elastic Load Balancer. The app gives the users the ability to upload their photos and also shows a leaderboard on the homepage of the app. The uploaded photos are stored in Amazon Simple Storage Service (Amazon S3) and the leaderboard data is maintained in Amazon DynamoDB. The Amazon EC2 instances need to access both Amazon S3 and Amazon DynamoDB for these features. As a solutions architect, which of the following solutions would you recommend as the MOST secure option?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Encrypt the AWS credentials via a custom encryption library and save it in a secret directory on the Amazon EC2 instances. The application code can then safely decrypt the AWS credentials to make the API calls to Amazon S3 and Amazon DynamoDB. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Attach the appropriate IAM role to the Amazon EC2 instance profile so that the instance can access Amazon S3 and Amazon DynamoDB. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Storing static AWS credentials on an EC2 instance (whether in plain text, CLI config, or custom-encrypted files) is a major security anti-pattern. Always attach an IAM Role to the EC2 instance (via an instance profile) so the instance receives temporary, automatically rotated credentials from AWS STS.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-46"></div>

### Question 46: Cross-Region Backup Replication and Archival using S3 Cross-Region Replication (CRR)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has historically operated only in the us-east-1 region and stores encrypted data in Amazon S3 using SSE-KMS. As part of enhancing its security posture as well as improving the backup and recovery architecture, the company wants to store the encrypted data in Amazon S3 that is replicated into the us-west-1 AWS region. The security policies mandate that the data must be encrypted and decrypted using the same key in both AWS regions. Which of the following represents the best solution to address these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon CloudWatch scheduled rule to invoke an AWS Lambda function to copy the daily data from the source bucket in us-east-1 region to the destination bucket in us-west-1 region. Provide AWS KMS key access to the AWS Lambda function for encryption and decryption operations on the data in the source and destination Amazon S3 buckets. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Create a new Amazon S3 bucket in the us-east-1 region with replication enabled from this new bucket into another bucket in us-west-1 region. Enable SSE-KMS encryption on the new bucket in us-east-1 region by using an AWS KMS multi-region key. Copy the existing data from the current Amazon S3 bucket in us-east-1 region into this new Amazon S3 bucket in us-east-1 region. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
To encrypt and decrypt data using the same KMS key across two AWS Regions, you must use an AWS KMS Multi-Region Key. However, AWS KMS does not allow converting an existing single-Region key into a Multi-Region key. Therefore, you must configure a new Multi-Region KMS key, enable S3 Cross-Region Replication (CRR), and copy the existing objects so they are encrypted with the Multi-Region key and replicated to us-west-1.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-47"></div>

### Question 47: Enforcing Maximum Privilege Ceilings on Developers using IAM Permissions Boundaries
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
You have a team of developers in your company, and you would like to ensure they can quickly experiment with AWS Managed Policies by attaching them to their accounts, but you would like to prevent them from doing an escalation of privileges, by granting themselves the AdministratorAccess managed policy. How should you proceed?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** For each developer, define an IAM permission boundary that will restrict the managed policies they can attach to themselves. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
An IAM Permissions Boundary defines the maximum permissions an IAM user or role can have, preventing privilege escalation even if the developer attaches AdministratorAccess to their user. (Note: Permissions boundaries can only be attached to IAM users or roles, never to IAM groups).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-48"></div>

### Question 48: Petabyte-Scale Offline Data Migration to Amazon S3 Glacier via AWS Snowball
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
You would like to use AWS Snowball to move on-premises backups into a long term archival tier on AWS. Which solution provides the MOST cost savings?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Snowball job and target an Amazon S3 bucket. Create a lifecycle policy to transition this data to Amazon S3 Glacier Deep Archive on the same day. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Snowball cannot load data directly into S3 Glacier vaults. It must first import data into an Amazon S3 bucket, where a same-day (0-day) S3 Lifecycle rule transitions the objects to Amazon S3 Glacier Deep Archive (the lowest-cost archival storage class).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-49"></div>

### Question 49: Protecting Web Applications from Malicious Query Strings using AWS WAF IP Sets
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
To improve the performance and security of the application, the engineering team at a company has created an Amazon CloudFront distribution with an Application Load Balancer as the custom origin. The team has also set up an AWS Web Application Firewall (AWS WAF) with Amazon CloudFront distribution. The security team at the company has noticed a surge in malicious attacks from a specific IP address to steal sensitive data stored on the Amazon EC2 instances. As a solutions architect, which of the following actions would you recommend to stop the attacks?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an IP match condition in the AWS WAF to block the malicious IP address. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Because traffic enters via CloudFront with AWS WAF attached, adding an IP match condition rule in AWS WAF immediately blocks requests from the malicious IP at the edge. (Security Groups cannot create Deny rules, and NACLs associate with subnets rather than instances).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-50"></div>

### Question 50: Cost Optimization Portfolio for Stable vs Bursty Workloads: Reserved Instances + Spot
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An IT company wants to optimize the costs incurred on its fleet of 100 Amazon EC2 instances for the next year. Based on historical analyses, the engineering team observed that 70 of these instances handle the compute services of its flagship application and need to be always available. The other 30 instances are used to handle batch jobs that can afford a delay in processing. As a solutions architect, which of the following would you recommend as the MOST cost-optimal solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase 70 reserved instances (RIs) and 30 spot instances `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Reserved Instances (RIs) provide significant discounts for the 70 steady-state 24/7 instances, while Spot Instances provide the deepest discount (up to 90%) for the 30 interruption-tolerant batch instances.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-51"></div>

### Question 51: Buffering and Sequential Processing for Device Telemetry with Amazon SQS FIFO
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
You are establishing a monitoring solution for desktop systems, that will be sending telemetry data into AWS every 1 minute. Data for each system must be processed in order, independently, and you would like to scale the number of consumers to be possibly equal to the number of desktop systems that are being monitored. What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an Amazon Simple Queue Service (Amazon SQS) FIFO (First-In-First-Out) queue, and make sure the telemetry data is sent with a Group ID attribute representing the value of the Desktop ID. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
SQS FIFO queues guarantee ordering per MessageGroupId. Setting MessageGroupId to the Desktop ID ensures each desktop's telemetry is processed in exact order while allowing parallel consumers up to the number of distinct Desktop IDs.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-52"></div>

### Question 52: Disaster Recovery Active-Passive Failover with Route 53 and Automated Health Checks
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A manufacturing company receives unreliable service from its data center provider because the company is located in an area prone to natural disasters. The company is not ready to fully migrate to the AWS Cloud, but it wants a failover environment on AWS in case the on-premises data center fails. The company runs web servers that connect to external vendors. The data available on AWS and on-premises must be uniform. Which of the following solutions would have the LEAST amount of downtime?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a Amazon Route 53 failover record. Run application servers on Amazon EC2 instances behind an Application Load Balancer in an Auto Scaling group. Set up AWS Storage Gateway with stored volumes to back up data to Amazon S3. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Having pre-provisioned EC2 instances in an Auto Scaling group behind an ALB with Route 53 failover and Storage Gateway stored volumes minimizes RTO (downtime), whereas executing CloudFormation templates after a disaster strikes takes significant time to provision resources.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-53"></div>

### Question 53: Cross-Account VPC Resource Sharing using AWS Resource Access Manager (AWS RAM)
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
You have multiple AWS accounts within a single AWS Region managed by AWS Organizations and you would like to ensure all Amazon EC2 instances in all these accounts can communicate privately. Which of the following solutions provides the capability at the CHEAPEST cost?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a virtual private cloud (VPC) in an account and share one or more of its subnets with the other accounts using Resource Access Manager. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Sharing VPC subnets across accounts in an AWS Organization via AWS Resource Access Manager (AWS RAM) incurs no additional service cost and allows EC2 instances in different accounts to communicate within the same VPC without paying for Transit Gateway attachments or data processing.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-54"></div>

### Question 54: Two-Tier Security Architecture: Restricting DB Security Group to Web-Tier SG ID
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A silicon valley based startup has a two-tier architecture using Amazon EC2 instances for its flagship application. The web servers (listening on port 443), which have been assigned security group A, are in public subnets across two Availability Zones (AZs) and the MSSQL based database instances (listening on port 1433), which have been assigned security group B, are in two private subnets across two Availability Zones (AZs). The DevOps team wants to review the security configurations of the application architecture. As a solutions architect, which of the following options would you select as the MOST secure configuration? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** For security group A: Add an inbound rule that allows traffic from all sources on port 443. Add an outbound rule with the destination as security group B on port 443. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** For security group B: Add an inbound rule that allows traffic only from all sources on port 1433. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** For security group A: Add an inbound rule that allows traffic from all sources on port 443. Add an outbound rule with the destination as security group B on port 1433. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Security Group A (Web Servers): Accepts HTTPS requests from users on port 443 (inbound from 0.0.0.0/0 on port 443) and initiates database queries to the MSSQL servers in Security Group B on port 1433 (outbound to SG B on port 1433, not 443).
Security Group B (MSSQL Database): Should follow least privilege by allowing inbound traffic on port 1433 only from Security Group A (not from all sources).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-55"></div>

### Question 55: Decoupling Unpredictable IoT Sensor Bursts using Amazon SQS Standard Queues
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A wildlife research organization uses IoT-based motion sensors attached to thousands of migrating animals to monitor their movement across regions. Every few minutes, a sensor checks for significant movement and sends updated location data to a backend application running on Amazon EC2 instances spread across multiple Availability Zones in a single AWS Region. Recently, an unexpected surge in motion data overwhelmed the application, leading to lost location records with no mechanism to replay missed data. A solutions architect must redesign the ingestion mechanism to prevent future data loss and to minimize operational overhead. What should the solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an Amazon Data Firehose delivery stream to collect the motion data. Configure it to deliver data to an S3 bucket where the application scans and processes the files periodically. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Create an Amazon Simple Queue Service (Amazon SQS) queue to buffer the incoming location data. Configure the backend application to poll the queue and process messages. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
When a backend EC2 application is overwhelmed by traffic surges and dropping messages, the standard pattern to decouple and buffer requests with minimal operational overhead is Amazon SQS. SQS durably stores incoming messages and allows the EC2 instances to poll and process records at their own pace with built-in retry/DLQ support. (Firehose to S3 is meant for batching streaming data into data lakes/warehouses rather than buffering individual application events for EC2 workers).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-56"></div>

### Question 56: Accelerating Global Gaming and Video Traffic with AWS Global Accelerator Anycast IPs
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A video conferencing platform serves users worldwide through a globally distributed deployment of Amazon EC2 instances behind Network Load Balancers (NLBs) in several AWS Regions. The platform's architecture currently allows clients to connect to any Region via public endpoints, depending on how DNS resolves. However, users in regions far from the load balancers frequently experience high latency and slow connection times, especially during session initiation. The company wants to optimize the experience for global users by reducing end-to-end latency and load time while keeping the existing NLBs and EC2-based application infrastructure in place. Which solution will best meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon CloudFront with HTTP caching enabled in front of the NLBs. Use CloudFront edge locations to serve user requests faster and reduce the load on the backend EC2 instances. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Deploy a standard accelerator in AWS Global Accelerator and register the existing regional NLBs as endpoints. Use the accelerator to route user requests through AWS’s global edge network to the closest healthy Regional NLB. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Video conferencing and Network Load Balancers (NLBs) operate at Layer 4 (TCP/UDP). Amazon CloudFront is a Layer 7 CDN that only supports HTTP/HTTPS traffic and cannot accelerate UDP/non-HTTP TCP connections. AWS Global Accelerator supports both TCP and UDP at Layer 4, provides static Anycast IPs, and routes global user traffic onto the AWS global network to the closest healthy Regional NLB.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-57"></div>

### Question 57: Instantaneous In-Memory EC2 State Restoration using EC2 Instance Hibernate
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A Machine Learning research group uses a proprietary computer vision application hosted on an Amazon EC2 instance. Every time the instance needs to be stopped and started again, the application takes about 3 minutes to start as some auxiliary software programs need to be executed so that the application can function. The research group would like to minimize the application boostrap time whenever the system needs to be stopped and then started at a later point in time. As a solutions architect, which of the following solutions would you recommend for this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EC2 Instance Hibernate `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
EC2 Instance Hibernate saves the contents of the instance's memory (RAM) to the Amazon EBS root volume when stopped. When the instance is started again, the RAM state is reloaded and previously running processes resume immediately without re-running the 3-minute application initialization.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-58"></div>

### Question 58: S3 Lifecycle Rules: Transitioning Raw Data to S3 Standard-IA and S3 Glacier
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A big data consulting firm needs to set up a data lake on Amazon S3 for a Health-Care client. The data lake is split in raw and refined zones. For compliance reasons, the source data needs to be kept for a minimum of 5 years. The source data arrives in the raw zone and is then processed via an AWS Glue based extract, transform, and load (ETL) job into the refined zone. The business analysts run ad-hoc queries only on the data in the refined zone using Amazon Athena. The team is concerned about the cost of data storage in both the raw and refined zones as the data is increasing at a rate of 1 terabyte daily in each zone. As a solutions architect, which of the following would you recommend as the MOST cost-optimal solution? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Setup a lifecycle policy to transition the refined zone data into Amazon S3 Glacier Deep Archive after 1 day of object creation (Incorrect) `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Use AWS Glue ETL job to write the transformed data in the refined zone using a compressed file format (Correct) `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Setup a lifecycle policy to transition the raw zone data into Amazon S3 Glacier Deep Archive after 1 day of object creation. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Raw Zone: Data in the raw zone is processed once by the daily Glue ETL job and then only kept for 5 years to meet compliance rules. Therefore, the raw zone should be transitioned to Amazon S3 Glacier Deep Archive after 1 day.
Refined Zone: Business analysts run ad-hoc Amazon Athena queries against the refined zone. Athena cannot query objects stored in S3 Glacier Deep Archive (and S3 Glacier has a 180-day minimum storage duration charge). Therefore, the refined zone must stay in an active S3 tier, and the Glue ETL job should write the refined data in a compressed format (such as Parquet or ORC) to reduce both storage and Athena query costs.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-59"></div>

### Question 59: Dynamic Storage Auto-Scaling for Amazon RDS MySQL Without Operational Downtime
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company has recently launched a new mobile gaming application that the users are adopting rapidly. The company uses Amazon RDS MySQL as the database. The engineering team wants an urgent solution to this issue where the rapidly increasing workload might exceed the available database storage. As a solutions architect, which of the following solutions would you recommend so that it requires minimum development and systems administration effort to address this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable storage auto-scaling for Amazon RDS MySQL `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS Storage Autoscaling automatically expands database storage capacity with zero downtime when free space drops below 10% for 5 minutes (and at least 6 hours have passed since the last modification).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-60"></div>

### Question 60: VPC DNS Configuration Attributes Required for Route 53 Private Hosted Zones
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A systems administrator has created a private hosted zone and associated it with a Virtual Private Cloud (VPC). However, the Domain Name System (DNS) queries for the private hosted zone remain unresolved. As a Solutions Architect, can you identify the Amazon Virtual Private Cloud (Amazon VPC) options to be configured in order to get the private hosted zone to work?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Fix conflicts between your private hosted zone and any Resolver rule that routes traffic to your network for the same domain name, as it results in ambiguity over the route to be taken. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Enable DNS hostnames and DNS resolution for private hosted zones. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
To use an Amazon Route 53 Private Hosted Zone with a VPC, two VPC attributes must be enabled (true): enableDnsHostnames (DNS hostnames) and enableDnsSupport (DNS resolution). For custom (non-default) VPCs, enableDnsHostnames is disabled by default, which causes private hosted zone DNS queries to fail until enabled.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-61"></div>

### Question 61: Shared Storage for Windows Video Editing Workloads using Amazon FSx for Windows File Server
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A media production studio is building a content rendering and editing platform on AWS. The editing workstations and rendering tools require access to shared files over the SMB (Server Message Block) protocol. The studio wants a managed storage solution that is simple to set up, integrates easily with SMB clients, and minimizes ongoing operational tasks. Which solution will best meet the requirements with the LEAST administrative overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an AWS Storage Gateway Volume Gateway in cached volume mode. Attach the volume as an iSCSI device to the application server and configure a file system with SMB sharing enabled. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Provision an Amazon FSx for Windows File Server file system. Mount the file system using the SMB protocol on the media servers. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Just like in Question 10, whenever a cloud-based workload requires shared file storage over the SMB (Server Message Block) protocol with minimal administrative overhead, Amazon FSx for Windows File Server is the native, fully managed AWS service. Storage Gateway Volume Gateway exposes block storage via iSCSI (not SMB) and is intended for hybrid on-premises setups.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-62"></div>

### Question 62: Three-Tier Web Application Security Group Rules: ALB (443), EC2 (80), RDS (5432)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An HTTP application is deployed on an Auto Scaling Group, is accessible from an Application Load Balancer (ALB) that provides HTTPS termination, and accesses a PostgreSQL database managed by Amazon RDS. How should you configure the security groups? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The security group of the Application Load Balancer should have an inbound rule from anywhere on port 443. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Users connect to the ALB via HTTPS (443) from anywhere (0.0.0.0/0).
The ALB terminates SSL/HTTPS and forwards plain HTTP (80) to the EC2 instances, so the EC2 SG allows port 80 from the ALB SG.
The EC2 instances query the RDS PostgreSQL DB on port 5432, so the RDS SG allows port 5432 from the EC2 SG.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-63"></div>

### Question 63: Cost-Optimal EC2 Purchasing Strategy: Reserved Instances for Baseline, On-Demand for Surges
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An application runs big data workloads on Amazon Elastic Compute Cloud (Amazon EC2) instances. The application runs 24x7 all round the year and needs at least 20 instances to maintain a minimum acceptable performance threshold and the application needs 300 instances to handle spikes in the workload. Based on historical workloads processed by the application, it needs 80 instances 80% of the time. As a solutions architect, which of the following would you recommend as the MOST cost-optimal solution so that it can meet the workload demand in a steady state?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase 80 reserved instances (RIs). Provision additional on-demand and spot instances per the workload demand (Use Auto Scaling Group with launch template to provision the mix of on-demand and spot instances). `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Purchasing 80 Reserved Instances covers the steady-state baseline (80% of the time) at a steep discount, while an Auto Scaling Group with a mixed-instances Launch Template scales out using On-Demand and Spot Instances for traffic spikes up to 300 instances.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-64"></div>

### Question 64: Troubleshooting EC2 Auto Scaling Health Check Grace Period and Impaired Instance State
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The engineering team at a logistics company has noticed that the Auto Scaling group (ASG) is not terminating an unhealthy Amazon EC2 instance. As a Solutions Architect, which of the following options would you suggest to troubleshoot the issue? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The instance maybe in Impaired status. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Grace period: ASG does not terminate unhealthy instances until their health check grace period has expired.
Impaired status: ASG waits a few minutes before terminating an Impaired instance to see if it recovers.
ELB health check ignored: By default, an ASG's health check type is set to EC2 only, so it ignores ELB health check failures unless you explicitly enable ELB health checks on the ASG.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-65"></div>

### Question 65: Amazon RDS Multi-AZ Database Engine Version Upgrade Maintenance Behavior and Downtime
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
The DevOps team at a major financial services company uses Multi-Availability Zone (Multi-AZ) deployment for its MySQL Amazon RDS database in order to automate its database replication and augment data durability. The DevOps team has scheduled a maintenance window for a database engine level upgrade for the coming weekend. Which of the following is the correct outcome during the maintenance window?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Any database engine level upgrade for an Amazon RDS database instance with Multi-AZ deployment triggers the primary database instance to be upgraded which is then followed by the upgrade of the standby database instance. This does not cause any downtime for the duration of the upgrade. `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Any database engine level upgrade for an Amazon RDS database instance with Multi-AZ deployment triggers both the primary and standby database instances to be upgraded at the same time. This causes downtime until the upgrade is complete. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
For a standard Amazon RDS Multi-AZ DB instance deployment (primary + 1 standby), database engine version upgrades upgrade both the primary and standby DB instances at the same time, which causes downtime until the upgrade completes. (Note: Operating system/hardware patching upgrades the standby first and fails over to minimize downtime, but DB engine upgrades upgrade both simultaneously).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- KhÃ´ng cÃ³ phÃ¢n tÃ­ch báº«y bá»• sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

