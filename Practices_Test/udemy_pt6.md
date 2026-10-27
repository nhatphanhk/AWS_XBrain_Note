# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Practice Exam 6

> **Khóa học tham chiếu**: Ultimate AWS Certified Solutions Architect Associate (SAA-C03) - Stephane Maarek  
> **Bộ đề**: Practice Exam 6 (Full Exam Simulation - 65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **56 câu** | $\ge 47$ câu (72%) | Đạt tiêu chuẩn ✅ |
| **Số câu trả lời sai (Incorrect Answers)** | **9 câu** | $\le 18$ câu | Cần tập trung ôn tập ⚠️ |
| **Tỷ lệ chính xác (Overall Score)** | **86.15% (~862 / 1000)** | $\ge 72.0\%$ (720 / 1000) | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |
| **Thời gian thi tiêu chuẩn** | **130 phút** | 130 phút *(160 phút nếu có ESL +30)* | Đạt tiến độ thời gian |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 19 câu | 17 câu | 2 câu | **89.5%** | Xuất sắc 🟢 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 19 câu | 16 câu | 3 câu | **84.2%** | Tốt 🟡 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 13 câu | 11 câu | 2 câu | **84.6%** | Tốt 🟡 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 14 câu | 12 câu | 2 câu | **85.7%** | Xuất sắc 🟢 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **56 câu** | **9 câu** | **86.15%** | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |

---

## 🎯 2. Danh Sách 9 Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp 9 câu trả lời chưa chính xác trong lần làm đề thi này. Hãy rà soát kỹ các bẫy câu hỏi và bài học kiến trúc cốt lõi trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 03** | Domain 1 | **Direct Connect Public VIF for High-Bandwidth Private Access to Amazon S3** | Khi cần kết nối trực tiếp từ On-premises tới các dịch vụ AWS Public (như S3, DynamoDB) qua Direct Connect mà không đi qua Internet công cộng, bắt buộc phải cấu hình Public Virtual Interface (Public VIF). Private VIF chỉ dùng để kết nối vào VPC tư nhân. | [👉 Xem](#question-03) |
| **Câu 20** | Domain 2 | **Prioritizing Workload Processing Using Multiple SQS Queues (Pro vs Lite)** | Để phân tách mức độ ưu tiên xử lý tin nhắn (Pro vs Lite), giải pháp chuẩn AWS là dùng 2 hàng đợi SQS Standard độc lập (Pro Queue & Lite Queue) và cấu hình worker EC2 luôn ưu tiên poll Pro Queue trước khi poll Lite Queue. | [👉 Xem](#question-20) |
| **Câu 34** | Domain 4 | **Hardware Isolation and Host-Level Visibility Compliance with Dedicated Hosts** | Khi bài thi yêu cầu: Đảm bảo phần cứng vật lý chuyên biệt (Single-tenant), kiểm soát chính xác vị trí máy chủ (Socket/Core visibility) và mang theo bản quyền phần mềm hiện có (BYOL - Bring Your Own License), Dedicated Hosts là lựa chọn duy nhất. Dedicated Instances không cho phép kiểm soát socket/core. | [👉 Xem](#question-34) |
| **Câu 39** | Domain 1 | **Fine-Grained S3 Course Uploads via Cognito Identity Pools & Gateway Endpoints** | Amazon Cognito User Pool chỉ đóng vai trò Xác thực (Authentication) cấp ID/Access Token, KHÔNG cấp quyền AWS trực tiếp. Phải kết hợp với Cognito Identity Pool (Federated Identities) để đổi token lấy AWS Temporary Credentials (IAM Role) có quyền ghi vào S3. | [👉 Xem](#question-39) |
| **Câu 40** | Domain 2 | **High Availability Architecture for Multi-Tier Web App: ALB, ASG & Multi-AZ RDS** | Kiến trúc High Availability (HA) chuẩn AWS cho ứng dụng web đa tầng với ít công quản trị nhất là: ALB + Auto Scaling Group (đa AZ) + Amazon RDS Multi-AZ (đồng bộ tự động failover). Tuyệt đối không dùng custom script đồng bộ thủ công giữa 2 RDS riêng lẻ. | [👉 Xem](#question-40) |
| **Câu 43** | Domain 3 | **Least-Privilege Role Management with AWS IAM Identity Center Permission Sets** | Quản lý quyền truy cập tập trung theo vai trò (Role-based) từ thư mục doanh nghiệp (Active Directory/Okta) với ít công vận hành nhất: Tích hợp AWS IAM Identity Center và định nghĩa các Permission Sets gắn trực tiếp vào các Nhóm (Groups). | [👉 Xem](#question-43) |
| **Câu 44** | Domain 2 | **High Availability Single-Instance Monolith Auto-Recovery (ASG Min=1, Max=1 + EIP)** | Khôi phục tự động máy chủ đơn khối (Monolith) chạy trên 1 instance duy nhất với chi phí rẻ nhất: Thiết lập Auto Scaling Group Multi-AZ với Min=1, Max=1, Desired=1 kết hợp gán Elastic IP (EIP) tự động thông qua script User Data khi instance mới khởi tạo. | [👉 Xem](#question-44) |
| **Câu 50** | Domain 3 | **Understanding Amazon EC2 Ephemeral Instance Store Limitations and Lifecycle** | Bộ nhớ cục bộ Instance Store: Là ổ cứng vật lý gắn trực tiếp vào máy chủ máy chủ EC2. Đặc tính cốt lõi: KHÔNG THỂ gỡ (detach) khỏi instance này để gắn vào instance khác; dữ liệu bị xóa sạch khi Stop/Terminate và không được lưu vào AMI. | [👉 Xem](#question-50) |
| **Câu 52** | Domain 4 | **Minimizing Multi-AZ Database Replication Costs Using Private IP Addresses** | Tối ưu chi phí sao chép dữ liệu giữa các Availability Zone (Cross-AZ replication): Sử dụng Private IP thay vì Public IP / Elastic IP. Truyền qua Public IP tính phí cả Inbound/Outbound theo giá Internet; truyền qua Private IP có chi phí thấp hơn đáng kể. | [👉 Xem](#question-52) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ✅ Đúng | [Dedicated Instances vs Dedicated Hosts for Single-Tenant Compliance](#question-01) | Domain 1 |
| [02](#question-02) | ✅ Đúng | [Kinesis Data Streams & ECS on Fargate for Real-Time Streaming Ingestion](#question-02) | Domain 3 |
| [03](#question-03) | ❌ Sai | [Direct Connect Public VIF for High-Bandwidth Private Access to Amazon S3](#question-03) | Domain 1 |
| [04](#question-04) | ✅ Đúng | [Migrating RabbitMQ Message Brokers to Managed Amazon MQ](#question-04) | Domain 2 |
| [05](#question-05) | ✅ Đúng | [Amazon EC2 Spot Instances and Spot Fleet Architecture Characteristics](#question-05) | Domain 4 |
| [06](#question-06) | ✅ Đúng | [Compute Savings Plans vs SageMaker Savings Plans for Cost Optimization](#question-06) | Domain 4 |
| [07](#question-07) | ✅ Đúng | [Multi-Account Governance using AWS Control Tower & Shared VPC via AWS RAM](#question-07) | Domain 1 |
| [08](#question-08) | ✅ Đúng | [Auditing Multi-Region Unversioned S3 Buckets via S3 Storage Lens](#question-08) | Domain 1 |
| [09](#question-09) | ✅ Đúng | [Amazon S3 Analytics: Storage Class Analysis Transition Recommendations](#question-09) | Domain 4 |
| [10](#question-10) | ✅ Đúng | [Centralized Security Management with AWS Firewall Manager Supported Resources](#question-10) | Domain 1 |
| [11](#question-11) | ✅ Đúng | [Orchestrating Serverless Batch Image Processing with AWS Step Functions & Batch](#question-11) | Domain 3 |
| [12](#question-12) | ✅ Đúng | [Connecting Remote Branch Offices to Corporate HQ via AWS VPN CloudHub](#question-12) | Domain 1 |
| [13](#question-13) | ✅ Đúng | [Scaling RDS Read Workloads for Analytics with In-Region Read Replicas](#question-13) | Domain 4 |
| [14](#question-14) | ✅ Đúng | [Secure Public Web Tier: NLB in Public Subnet with EC2 in Private Subnet](#question-14) | Domain 1 |
| [15](#question-15) | ✅ Đúng | [Accelerating Global S3 Static Site with CloudFront & Transfer Acceleration](#question-15) | Domain 3 |
| [16](#question-16) | ✅ Đúng | [Cost-Effective Batch Nightly Processing Using Spot Instances Persistent Requests](#question-16) | Domain 4 |
| [17](#question-17) | ✅ Đúng | [Protecting Video Streaming Downloads with CloudFront Signed URLs](#question-17) | Domain 2 |
| [18](#question-18) | ✅ Đúng | [Required VPC DNS Attributes for Amazon Route 53 Private Hosted Zones](#question-18) | Domain 2 |
| [19](#question-19) | ✅ Đúng | [Handling Viral Traffic Surges with Aurora Read Replicas & CloudFront Caching](#question-19) | Domain 2 |
| [20](#question-20) | ❌ Sai | [Prioritizing Workload Processing Using Multiple SQS Queues (Pro vs Lite)](#question-20) | Domain 2 |
| [21](#question-21) | ✅ Đúng | [Centralized IAM Permissions Management via IAM Groups](#question-21) | Domain 1 |
| [22](#question-22) | ✅ Đúng | [Deploying Microsoft Active Directory Dependent Workloads via AWS Managed Microsoft AD](#question-22) | Domain 1 |
| [23](#question-23) | ✅ Đúng | [Low-Latency Inter-Node HPC Communication Using Elastic Fabric Adapter (EFA)](#question-23) | Domain 3 |
| [24](#question-24) | ✅ Đúng | [Automatic Storage Cost Optimization for Unknown Access Patterns with S3 Intelligent-Tiering](#question-24) | Domain 4 |
| [25](#question-25) | ✅ Đúng | [Automating EC2 Custom Initialization via EC2 User Data Scripts](#question-25) | Domain 2 |
| [26](#question-26) | ✅ Đúng | [Highly Available Bastion Host Architecture with Auto Scaling Group & Network Load Balancer](#question-26) | Domain 3 |
| [27](#question-27) | ✅ Đúng | [Sub-Millisecond Multithreaded In-Memory Caching with ElastiCache for Memcached](#question-27) | Domain 2 |
| [28](#question-28) | ✅ Đúng | [Migrating Legacy TCP/UDP Stateful Workloads to Multi-AZ EC2 Behind NLB](#question-28) | Domain 2 |
| [29](#question-29) | ✅ Đúng | [Highly Available Multi-AZ NAT Gateway Architecture for Private Subnets](#question-29) | Domain 2 |
| [30](#question-30) | ✅ Đúng | [Minimizing Maintenance Downtime in Amazon RDS Multi-AZ Failover Strategy](#question-30) | Domain 2 |
| [31](#question-31) | ✅ Đúng | [Enforcing Regulatory Key Management with S3 Client-Side Encryption (CSE)](#question-31) | Domain 1 |
| [32](#question-32) | ✅ Đúng | [Cost-Effective On-Premises Backup Archiving with Amazon EFS Infrequent Access](#question-32) | Domain 4 |
| [33](#question-33) | ✅ Đúng | [Microsecond Read Caching for High-Throughput DynamoDB with DAX](#question-33) | Domain 3 |
| [34](#question-34) | ❌ Sai | [Hardware Isolation and Host-Level Visibility Compliance with Dedicated Hosts](#question-34) | Domain 4 |
| [35](#question-35) | ✅ Đúng | [Secure Zero-Cost Private S3 Access Using Gateway VPC Endpoints](#question-35) | Domain 4 |
| [36](#question-36) | ✅ Đúng | [Automating Redshift Historical Snapshot Archiving to S3 Standard-IA](#question-36) | Domain 4 |
| [37](#question-37) | ✅ Đúng | [Postponing New Message Delivery in Amazon SQS Using Delay Queues](#question-37) | Domain 2 |
| [38](#question-38) | ✅ Đúng | [Centralized Multi-Account Root User Aliases & Alternate Notification Contacts](#question-38) | Domain 1 |
| [39](#question-39) | ❌ Sai | [Fine-Grained S3 Course Uploads via Cognito Identity Pools & Gateway Endpoints](#question-39) | Domain 1 |
| [40](#question-40) | ❌ Sai | [High Availability Architecture for Multi-Tier Web App: ALB, ASG & Multi-AZ RDS](#question-40) | Domain 2 |
| [41](#question-41) | ✅ Đúng | [Dynamic Queue-Based Scaling for SQS Workers Using Target Tracking Policy](#question-41) | Domain 3 |
| [42](#question-42) | ✅ Đúng | [Restricting Direct S3 Bucket Access by Enforcing CloudFront Origin Access Identity (OAI)](#question-42) | Domain 1 |
| [43](#question-43) | ❌ Sai | [Least-Privilege Role Management with AWS IAM Identity Center Permission Sets](#question-43) | Domain 3 |
| [44](#question-44) | ❌ Sai | [High Availability Single-Instance Monolith Auto-Recovery (ASG Min=1, Max=1 + EIP)](#question-44) | Domain 2 |
| [45](#question-45) | ✅ Đúng | [High-Performance Multi-Instance I/O Workloads with Provisioned IOPS (io2) EBS Multi-Attach](#question-45) | Domain 2 |
| [46](#question-46) | ✅ Đúng | [Cost-Effective Infrequent OLTP Workloads Using Amazon Aurora Serverless](#question-46) | Domain 2 |
| [47](#question-47) | ✅ Đúng | [Automating Experimental Dataset Lifecycle: S3 Standard-IA & Scheduled Expiration](#question-47) | Domain 4 |
| [48](#question-48) | ✅ Đúng | [Multi-Region Traffic Distribution Limitations of Classic Elastic Load Balancing](#question-48) | Domain 2 |
| [49](#question-49) | ✅ Đúng | [Monitoring Compute Savings Plans Coverage with Daily AWS Budgets Alerts](#question-49) | Domain 4 |
| [50](#question-50) | ❌ Sai | [Understanding Amazon EC2 Ephemeral Instance Store Limitations and Lifecycle](#question-50) | Domain 3 |
| [51](#question-51) | ✅ Đúng | [Sub-Second Cross-Region Disaster Recovery Using Amazon Aurora Global Database](#question-51) | Domain 2 |
| [52](#question-52) | ❌ Sai | [Minimizing Multi-AZ Database Replication Costs Using Private IP Addresses](#question-52) | Domain 4 |
| [53](#question-53) | ✅ Đúng | [Security Groups (Stateful) vs Network ACLs (Stateless) Return Traffic Mechanics](#question-53) | Domain 1 |
| [54](#question-54) | ✅ Đúng | [Mitigating Web Layer DoS / DDoS HTTP Flood Attacks with AWS WAF Rate-Based Rules](#question-54) | Domain 1 |
| [55](#question-55) | ✅ Đúng | [Implementing Request-Response Messaging Patterns with SQS Temporary Queues](#question-55) | Domain 3 |
| [56](#question-56) | ✅ Đúng | [Configuring Multi-Service Private Access via S3 & DynamoDB Gateway Endpoints](#question-56) | Domain 1 |
| [57](#question-57) | ✅ Đúng | [Optimizing S3 Object Metadata Indexing Using HTTP Byte-Range Fetches](#question-57) | Domain 3 |
| [58](#question-58) | ✅ Đúng | [Real-Time User Engagement Analytics Ingestion via Kinesis Data Streams On-Demand & Lambda](#question-58) | Domain 3 |
| [59](#question-59) | ✅ Đúng | [Decoupling EC2 Storage: Ephemeral OS on EBS & Persistent Files in Amazon S3](#question-59) | Domain 2 |
| [60](#question-60) | ✅ Đúng | [Agent-Based Physical and VM Server Migration Using AWS Application Migration Service (MGN)](#question-60) | Domain 3 |
| [61](#question-61) | ✅ Đúng | [Hub-and-Spoke Inter-VPC Network Interconnection Using AWS Transit Gateway](#question-61) | Domain 1 |
| [62](#question-62) | ✅ Đúng | [Enforcing Cost Governance in Developer Accounts Using AWS Budgets & Automated DenyAll Action](#question-62) | Domain 4 |
| [63](#question-63) | ✅ Đúng | [Intelligent Threat Detection and Unauthorized Crypto-Mining Identification via Amazon GuardDuty](#question-63) | Domain 1 |
| [64](#question-64) | ✅ Đúng | [Offloading Analytics Reporting from Production RDS MySQL to Dedicated Read Replicas](#question-64) | Domain 2 |
| [65](#question-65) | ✅ Đúng | [Low-Throughput Rapid On-Premises to AWS Interconnection via Site-to-Site VPN](#question-65) | Domain 1 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: Dedicated Instances vs Dedicated Hosts for Single-Tenant Compliance
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A healthcare company wants to run its applications on single-tenant hardware to meet compliance guidelines.

Which of the following is the MOST cost-effective way of isolating the Amazon EC2 instances to a single tenant?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Dedicated Instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Dedicated Hosts
- **(C)** On-Demand Instances
- **(D)** Spot Instances

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Dedicated Instances

Dedicated Instances are Amazon EC2 instances that run in a virtual private cloud (VPC) on hardware that's dedicated to a single customer. Dedicated Instances that belong to different AWS accounts are physically isolated at a hardware level, even if those accounts are linked to a single-payer account. However, Dedicated Instances may share hardware with other instances from the same AWS account that are not Dedicated Instances.

A Dedicated Host is also a physical server that's dedicated for your use. With a Dedicated Host, you have visibility and control over how instances are placed on the server.

> 🔗 **Tài liệu tham khảo trực quan**: [Differences between Dedicated Hosts and Dedicated Instances:](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html#dedicated-hosts-dedicated-instances)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Spot Instances**:
  A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Your Spot Instance runs whenever capacity is available and the maximum price per hour for your request exceeds the Spot price. Any instance present with unused capacity will be allocated. Even though this is cost-effective, it does not fulfill the single-tenant hardware requirement of the client and hence is not the correct option.

- **Dedicated Hosts**:
  An Amazon EC2 Dedicated Host is a physical server with Amazon EC2 instance capacity fully dedicated to your use. Dedicated Hosts allow you to use your existing software licenses on Amazon EC2 instances. With a Dedicated Host, you have visibility and control over how instances are placed on the server. This option is costlier than the Dedicated Instance and hence is not the right choice for the current requirement.

- **On-Demand Instances**:
  With On-Demand Instances, you pay for the compute capacity by the second with no long-term commitments. You have full control over its lifecycle—you decide when to launch, stop, hibernate, start, reboot, or terminate it. Hardware isolation is not possible and on-demand has one of the costliest instance charges and hence is not the correct answer for current requirements.

> 🔗 **Tài liệu tham khảo trực quan**: [High Level Overview of Amazon EC2 Instance Purchase Options:](https://aws.amazon.com/ec2/pricing/)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - dedicated instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html)
- 🌐 [AWS Docs: AWSEC2 - instance purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)

</details>

---

<div id="question-02"></div>

### Question 02: Kinesis Data Streams & ECS on Fargate for Real-Time Streaming Ingestion
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D), (E) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A company's real-time streaming application is running on AWS. As the data is ingested, a job runs on the data and takes 30 minutes to complete. The workload frequently experiences high latency due to large amounts of incoming data. A solutions architect needs to design a scalable and serverless solution to enhance performance.

Which combination of steps should the solutions architect take? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up AWS Lambda with AWS Step Functions to process the data
- **(B)** Provision Amazon EC2 instances in an Auto Scaling group to process the data
- **(C)** Set up AWS Database Migration Service (AWS DMS) to ingest the data
- **(D)** Set up Amazon Kinesis Data Streams to ingest the data `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Set up AWS Fargate with Amazon ECS to process the data `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up Amazon Kinesis Data Streams to ingest the data

Set up AWS Fargate with Amazon ECS to process the data

Amazon Kinesis Data Streams (KDS) is a massively scalable and durable real-time data streaming service. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events. The data collected is available in milliseconds to enable real-time analytics use cases such as real-time dashboards, real-time anomaly detection, dynamic pricing, and more.

AWS Fargate is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). Fargate makes it easy for you to focus on building your applications. Fargate removes the need to provision and manage servers, lets you specify and pay for resources per application, and improves security through application isolation by design.

For the given use case, we can use Kinesis Data Streams as the ingestion layer and the containerized ECS application on AWS Fargate as the processing layer. Both these components are serverless and can scale to offer the desired performance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up AWS Database Migration Service (AWS DMS) to ingest the data**:
  AWS Database Migration Service helps you migrate databases to AWS quickly and securely. DMS cannot be used for real-time data ingestion. Hence, this option is incorrect.

- **Set up AWS Lambda with AWS Step Functions to process the data**:
  The maximum timeout value for any AWS Lambda function is 15 minutes. When the specified timeout is reached, AWS Lambda terminates the execution of your Lambda function. Since the use case talks about a job that runs for 30 minutes, Lambda is not an option here.

- **Provision Amazon EC2 instances in an Auto Scaling group to process the data**:
  The given requirement is for a serverless solution to process the data. Hence, provisioning an Amazon EC2 instance is clearly not the right solution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: building a scalable streaming data processor with amazon kinesis data streams on aws fargate](https://aws.amazon.com/blogs/big-data/building-a-scalable-streaming-data-processor-with-amazon-kinesis-data-streams-on-aws-fargate/)

</details>

---

<div id="question-03"></div>

### Question 03: Direct Connect Public VIF for High-Bandwidth Private Access to Amazon S3
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A global enterprise maintains a hybrid cloud environment and wants to transfer large volumes of data between its on-premises data center and Amazon S3 for backup and analytics workflows. The company has already established a Direct Connect (DX) connection to AWS and wants to ensure high-bandwidth, low-latency, and secure private connectivity without traversing the public internet. The architecture must be designed to access Amazon S3 directly from on-premises systems using this DX connection.

Which configuration should the network engineering team implement to allow direct access to Amazon S3 from the on-premises data center using Direct Connect?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provision a Public Virtual Interface (Public VIF) on the Direct Connect connection to access Amazon S3 public IP addresses from the on-premises data center `[Đáp án đúng ✅]`
- **(B)** Use a Private Virtual Interface (Private VIF) on the Direct Connect connection and create a VPC endpoint to route traffic to S3 over the private network `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Use a Transit Gateway with Direct Connect Gateway to route on-premises traffic through a VPC and then to Amazon S3 using private IP addressing
- **(D)** Configure a VPN connection over the public internet to AWS and route S3 traffic through the tunnel instead of using Direct Connect

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Provision a Public Virtual Interface (Public VIF) on the Direct Connect connection to access Amazon S3 public IP addresses from the on-premises data center

> 🔗 **Tài liệu tham khảo trực quan**: [To access Amazon S3 from an on-premises data center using AWS Direct Connect, the correct approach is to configure a Public Virtual Interface (Public VIF). A Public VIF allows your on-premises router to access public AWS services, such as Amazon S3 and DynamoDB, over the dedicated Direct Connect connection rather than the public internet. When you establish a Public VIF, AWS advertises a set of public IP prefixes corresponding to its services, including Amazon S3. This allows your data center to communicate with these services using public IPs routed privately over Direct Connect, delivering improved performance, lower latency, and enhanced security. Public VIFs are specifically designed for scenarios where you want to connect on-premises infrastructure to AWS public endpoints over private, high-bandwidth links.](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use a Private Virtual Interface (Private VIF) on the Direct Connect connection and create a VPC endpoint to route traffic to S3 over the private network**:
  A Private Virtual Interface (Private VIF) is used to connect an on-premises network to VPC resources, such as EC2 instances or RDS databases, over private IP space. However, Amazon S3 is a public AWS service, and Private VIFs cannot natively route traffic to public S3 endpoints. While S3 access via interface VPC endpoints is possible from within the VPC, it does not extend to on-premises access over Private VIF. Therefore, Private VIF is not suitable for directly accessing S3 from on-prem.

- **Configure a VPN connection over the public internet to AWS and route S3 traffic through the tunnel instead of using Direct Connect**:
  Using a VPN connection over the public internet to route traffic to S3 bypasses the benefits of Direct Connect, such as low latency, dedicated bandwidth, and private connectivity. VPN traffic traverses the public internet and therefore violates the requirements of the given use case.

- **Use a Transit Gateway with Direct Connect Gateway to route on-premises traffic through a VPC and then to Amazon S3 using private IP addressing**:
  While Transit Gateway with Direct Connect Gateway is a valid solution for routing on-premises traffic to multiple VPCs over a private Direct Connect connection, it does not enable direct private IP access to Amazon S3, because S3 is a public AWS service with public IP addresses. Even if you configure interface VPC endpoints (AWS PrivateLink) to S3 in a connected VPC, the traffic remains local to that VPC and is not extended to the on-premises network via Transit Gateway. To access S3 from on-premises using Direct Connect, you must provision a Public Virtual Interface, which advertises AWS public service IP ranges to your data center.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: directconnect - Welcome](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html)

</details>

---

<div id="question-04"></div>

### Question 04: Migrating RabbitMQ Message Brokers to Managed Amazon MQ
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is experiencing stability issues with their cluster of self-managed RabbitMQ message brokers and the company now wants to explore an alternate solution on AWS.

As a solutions architect, which of the following AWS services would you recommend that can provide support for quick and easy migration from RabbitMQ?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon MQ `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon SQS FIFO (First-In-First-Out)
- **(C)** Amazon Simple Notification Service (Amazon SNS)
- **(D)** Amazon Simple Queue Service (Amazon SQS) Standard

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon MQ

Amazon MQ is a managed message broker service for Apache ActiveMQ that makes it easy to set up and operate message brokers in the cloud. Message brokers allow different software systems–often using different programming languages, and on different platforms–to communicate and exchange information. If an organization is using messaging with existing applications and wants to move the messaging service to the cloud quickly and easily, AWS recommends Amazon MQ for such a use case. So this is the correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon Simple Notification Service (Amazon SNS)**:
  Amazon Simple Notification Service (Amazon SNS) is a highly available, durable, secure, fully managed pub/sub messaging service that enables you to decouple microservices, distributed systems, and serverless applications. Amazon SNS provides topics for high-throughput, push-based, many-to-many messaging. SNS does not provide support for migration from RabbitMQ as its a fully managed pub/sub messaging service. Hence this option is incorrect.

- **Amazon Simple Queue Service (Amazon SQS) Standard**:
  Amazon SQS Standard offers a reliable, highly scalable hosted queue for storing messages as they travel between computers. Amazon SQS lets you easily move data between distributed application components and helps you build applications in which messages are processed independently (with message-level ack/fail semantics), such as automated workflows. SQS Standard does not provide support for migration from RabbitMQ. Hence this option is incorrect.

- **Amazon SQS FIFO (First-In-First-Out)**:
  Amazon SQS FIFO (First-In-First-Out) has all the capabilities of the standard queue. They are used when the order of operations and events is critical, or where duplicates can't be tolerated. SQS FIFO does not provide support for migration from RabbitMQ. Hence this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: amazon-mq](https://aws.amazon.com/amazon-mq/)
- 🌐 [AWS Architecture Blog: migrating from rabbitmq to amazon mq](https://aws.amazon.com/blogs/compute/migrating-from-rabbitmq-to-amazon-mq/)

</details>

---

<div id="question-05"></div>

### Question 05: Amazon EC2 Spot Instances and Spot Fleet Architecture Characteristics
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (D) | **Đáp án đúng**: (B), (D)

#### 📋 Đề bài (Scenario)
A software engineering intern at a company is documenting the features offered by Amazon EC2 Spot instances and Spot fleets.

Can you help the intern by selecting the correct options that identify the key characteristics of these two types of Spot entities? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** A Spot fleet can only consist of a set of Spot Instances that are launched to meet your target capacity
- **(B)** A Spot fleet can consist of a set of Spot Instances and optionally On-Demand Instances that are launched to meet your target capacity `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Spot fleets allow you to request Amazon EC2 Spot instances for 1 to 6 hours at a time to avoid being interrupted
- **(D)** Spot instances are spare Amazon EC2 capacity that can save you up 90% off of On-Demand prices. Spot instances can be interrupted by Amazon EC2 for capacity requirements with a 2-minute notification `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Spot fleets are spare EC2 capacity that can save you up 90% off of On-Demand prices. Spot fleets are usually interrupted by Amazon EC2 for capacity requirements with a 2-minute notification

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Spot instances are spare Amazon EC2 capacity that can save you up 90% off of On-Demand prices. Spot instances can be interrupted by Amazon EC2 for capacity requirements with a 2-minute notification

Spot instances are spare Amazon EC2 capacity that can save you up 90% off of On-Demand prices that Amazon Web Services can interrupt with a 2-minute notification. Because Spot Instances enable you to request unused EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly. Spot Instances are a cost-effective choice if you can be flexible about when your applications run and if your applications can be interrupted.

A Spot fleet can consist of a set of Spot Instances and optionally On-Demand Instances that are launched to meet your target capacity

> 🔗 **Tài liệu tham khảo trực quan**: [A Spot fleet is a collection, or fleet, of Spot Instances, and optionally On-Demand Instances. The Spot fleet attempts to launch the number of Spot Instances and On-Demand Instances to meet the target capacity that you specified in the Spot fleet request. A Spot fleet allows you to automatically request and manage multiple Spot instances that provide the lowest price per unit of capacity for your cluster or application, like a batch processing job, a Hadoop workflow, or an HPC grid computing job.](https://docs.amazonaws.cn/en_us/AWSEC2/latest/UserGuide/how-spot-fleet-works.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- A Spot fleet can only consist of a set of Spot Instances that are launched to meet your target capacity

- Spot fleets are spare EC2 capacity that can save you up 90% off of On-Demand prices. Spot fleets are usually interrupted by Amazon EC2 for capacity requirements with a 2-minute notification

- These two options contradict the explanation provided above, so these options are incorrect.

- **Spot fleets allow you to request Amazon EC2 Spot instances for 1 to 6 hours at a time to avoid being interrupted**:
  You could use Spot blocks (now deprecated) to request Amazon EC2 Spot instances for 1 to 6 hours to avoid being interrupted. So, Spot fleets cannot be used for this purpose.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [www.amazonaws.cn/en/ec2/spot-instances/faqs](https://www.amazonaws.cn/en/ec2/spot-instances/faqs/)
- 🌐 [docs.amazonaws.cn/en_us/AWSEC2/latest/UserGuide/how-spot-fleet-works.html](https://docs.amazonaws.cn/en_us/AWSEC2/latest/UserGuide/how-spot-fleet-works.html)

</details>

---

<div id="question-06"></div>

### Question 06: Compute Savings Plans vs SageMaker Savings Plans for Cost Optimization
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D), (E) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A technology startup has stabilized its cloud infrastructure after a successful product launch. The backend services are now running at a predictable rate with minimal scaling events. The application architecture includes workloads running on Amazon EC2, AWS Lambda functions for asynchronous processing, container workloads on AWS Fargate, and machine learning inference models deployed with Amazon SageMaker. The company is now focusing on reducing long-term operational expenses without redesigning its architecture. The company wants to apply long-term pricing discounts with the least administrative overhead and the broadest service coverage possible using the fewest number of savings plans.

Which combination of savings plans will satisfy these requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Subscribe to a hybrid deployment discount plan that includes discounts for both AWS and on-premises Kubernetes workloads
- **(B)** Create a Reserved Instance for each EC2 instance and subscribe to AWS Support to monitor Reserved Instance utilization monthly
- **(C)** Purchase an EC2 Instance Savings Plan that covers EC2 and containerized tasks on Amazon ECS running with Fargate launch type
- **(D)** Purchase a SageMaker Savings Plan that applies discounted pricing to SageMaker training, inference, and notebook instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Purchase a Compute Savings Plan that provides cost savings for usage across EC2, Fargate, and Lambda services `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Purchase a Compute Savings Plan that provides cost savings for usage across EC2, Fargate, and Lambda services

The Compute Savings Plan is the most flexible type of Savings Plan offered by AWS, and it applies to a broad range of compute services—including Amazon EC2, AWS Fargate, and AWS Lambda. Unlike EC2 Instance Savings Plans, Compute Savings Plans are not tied to a specific instance family or Region, making them ideal for organizations with varied or evolving compute needs. In this scenario, since the company is using EC2, Fargate, and Lambda in a steady state, a Compute Savings Plan provides a unified way to reduce costs across all three services with minimal administrative effort. It allows the company to maintain its existing architecture without modification while achieving long-term cost savings.

Purchase a SageMaker Savings Plan that applies discounted pricing to SageMaker training, inference, and notebook instances

Amazon SageMaker is not included under Compute Savings Plans, so workloads running on SageMaker require a SageMaker-specific Savings Plan for cost optimization. The SageMaker Savings Plan provides flexible discounts for various SageMaker components including training jobs, real-time inference, batch transform, and SageMaker Studio notebooks. By committing to a one- or three-year usage plan, companies can achieve significant cost reductions—up to 64%—compared to On-Demand pricing. In this use case, since SageMaker is used for inference workloads that are stable and predictable, a dedicated SageMaker Savings Plan is the most efficient and operationally simple approach to reduce costs.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a Reserved Instance for each EC2 instance and subscribe to AWS Support to monitor Reserved Instance utilization monthly**:
  While Reserved Instances can offer discounts for EC2, they are less flexible than Savings Plans and do not cover services like Fargate, Lambda, or SageMaker. Additionally, subscribing to AWS Support does not contribute to cost savings.

- **Subscribe to a hybrid deployment discount plan that includes discounts for both AWS and on-premises Kubernetes workloads**:
  No such hybrid deployment savings plan currently exists that combines AWS native compute resources with on-premises services. This option is not technically valid and does not address the company's AWS-only workload requirements.

- **Purchase an EC2 Instance Savings Plan that covers EC2 and containerized tasks on Amazon ECS running with Fargate launch type**:
  EC2 Instance Savings Plans apply only to EC2 instance families and do not apply to Fargate workloads. Fargate usage requires Compute Savings Plans for cost optimization.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: savingsplans - what is savings plans](https://docs.aws.amazon.com/savingsplans/latest/userguide/what-is-savings-plans.html)
- 🌐 [AWS Service Overview: savingsplans](https://aws.amazon.com/savingsplans/ml-pricing/)

</details>

---

<div id="question-07"></div>

### Question 07: Multi-Account Governance using AWS Control Tower & Shared VPC via AWS RAM
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A digital media firm is scaling its cloud footprint and wants to isolate development, testing, and production workloads using separate AWS accounts. It also wants a centralized approach to managing networking infrastructure such as subnets and gateways, without repeating configurations in every account. Additionally, the solution must enforce security best practices—like mandatory logging and guardrails—when new accounts are created. The firm prefers a low-maintenance, governance-driven setup.

Which solution best meets these goals while minimizing operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Control Tower to launch accounts. Deploy separate VPCs in each workload account and centralize security inspection by using Gateway Load Balancers to route traffic through a shared security appliance
- **(B)** Use AWS Service Catalog to define pre-approved VPC templates. Launch one VPC per workload account from the catalog, and enforce networking guardrails using AWS Config conformance packs
- **(C)** Use AWS Organizations to create new accounts and a shared networking account with a central VPC. Share the VPC subnets via AWS RAM and rely on service control policies (SCPs) to enforce guardrails manually
- **(D)** Use AWS Control Tower to create and govern accounts. Deploy a centralized VPC in a shared networking account and share its subnets across workload accounts using AWS Resource Access Manager (AWS RAM) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Control Tower to create and govern accounts. Deploy a centralized VPC in a shared networking account and share its subnets across workload accounts using AWS Resource Access Manager (AWS RAM)

> 🔗 **Tài liệu tham khảo trực quan**: [This approach aligns perfectly with AWS multi-account best practices. AWS Control Tower handles account creation and governance while applying automatic guardrails such as Service Control Policies (SCPs), AWS Config rules, and CloudTrail logging. A centralized VPC in a separate networking account can host shared resources, and subnets can be shared across accounts using AWS RAM. This design centralizes NAT gateways, internet access, and routing configuration—reducing duplication and cost. It provides isolation, control, and compliance—all with minimal administrative burden.](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS Organizations to create new accounts and a shared networking account with a central VPC. Share the VPC subnets via AWS RAM and rely on service control policies (SCPs) to enforce guardrails manually**:
  While using AWS Organizations and RAM to share a centralized VPC is technically valid, this option lacks automation and governance features like those provided by AWS Control Tower. SCPs can be used to enforce some guardrails, but applying them manually introduces operational overhead and increases the risk of misconfiguration. Control Tower automates these tasks, including audit logging, baseline configuration, and landing zone deployment, making it the better fit for minimal effort.

- **Use AWS Control Tower to launch accounts. Deploy separate VPCs in each workload account and centralize security inspection by using Gateway Load Balancers to route traffic through a shared security appliance**:
  Although Gateway Load Balancer (GWLB) is an advanced solution for centralized traffic inspection (e.g., for firewalls), this architecture significantly increases complexity. Managing and maintaining GWLB across multiple workload VPCs, setting up route tables, and integrating third-party appliances require deep networking expertise and ongoing effort. While Control Tower simplifies account creation, it doesn’t mitigate the operational burden introduced by deploying and managing distributed VPCs and inspection paths. This is over-engineered for the given use case, which prioritizes low operational overhead.

- **Use AWS Service Catalog to define pre-approved VPC templates. Launch one VPC per workload account from the catalog, and enforce networking guardrails using AWS Config conformance packs**:
  While AWS Service Catalog and Config conformance packs offer strong governance, this approach requires each workload account to maintain its own VPC. This leads to duplicated NAT gateways, internet gateways, and routing policies, which increase cost and management effort. Additionally, Service Catalog lacks native account provisioning or centralized logging — both of which are automatically handled by Control Tower. This solution introduces more complexity than necessary for the stated goal of central networking with guardrails.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: controltower - what is control tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- 🌐 [AWS Docs: ram - getting started sharing](https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html)
- 🌐 [AWS Docs: vpc - vpc sharing](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html)
- 🌐 [AWS Docs: organizations - orgs_introduction](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- 🌐 [AWS Docs: organizations - orgs_manage_policies_scps](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- 🌐 [AWS Docs: servicecatalog - introduction](https://docs.aws.amazon.com/servicecatalog/latest/adminguide/introduction.html)

</details>

---

<div id="question-08"></div>

### Question 08: Auditing Multi-Region Unversioned S3 Buckets via S3 Storage Lens
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A global financial services provider operates data analytics workloads across multiple AWS Regions. The company stores regulated datasets in Amazon S3 buckets and requires visibility into security and compliance configurations. As part of a new audit initiative, the compliance team must identify all S3 buckets across the environment that do not have versioning enabled. The solution must scale across all Regions and accounts with minimal manual intervention.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Amazon S3 Storage Lens with advanced metrics and recommendations. Use the per-bucket dashboard to filter and view versioning status across Regions and identify all buckets that do not have versioning enabled `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable IAM Access Analyzer for all Regions. Review the analyzer reports to identify S3 buckets without versioning enabled and configure IAM policies to restrict access to such buckets
- **(C)** Create a centralized Amazon S3 Multi-Region Access Point for all buckets. Use this access point to perform versioning checks programmatically by inspecting objects' metadata from each bucket
- **(D)** Configure an AWS CloudTrail trail across all Regions. Create an Amazon EventBridge rule that filters for PutBucketVersioning and DeleteBucketVersioning API calls. Trigger an AWS Lambda function to analyze the bucket configurations and generate a report of unversioned buckets

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Enable Amazon S3 Storage Lens with advanced metrics and recommendations. Use the per-bucket dashboard to filter and view versioning status across Regions and identify all buckets that do not have versioning enabled

S3 Storage Lens provides a centralized, organization-wide view of storage usage and activity metrics, including versioning status. When advanced metrics are enabled, the dashboard offers per-bucket insights that allow users to filter and identify buckets where versioning is not turned on. This capability spans all Regions and accounts within an organization, making it highly scalable and efficient. The visual dashboard and downloadable CSV reports simplify compliance and operational reviews, helping teams detect misconfigured buckets quickly without needing to manually inspect each one. This solution offers minimal operational overhead and aligns well with the requirement to monitor versioning across a large-scale, distributed S3 environment.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an AWS CloudTrail trail across all Regions. Create an Amazon EventBridge rule that filters for PutBucketVersioning and DeleteBucketVersioning API calls. Trigger an AWS Lambda function to analyze the bucket configurations and generate a report of unversioned buckets**:
  CloudTrail logs only capture changes and API activity. It does not continuously monitor or provide a current-state overview of versioning settings across all buckets. This approach requires custom scripting and does not scale well across accounts and Regions.

- **Enable IAM Access Analyzer for all Regions. Review the analyzer reports to identify S3 buckets without versioning enabled and configure IAM policies to restrict access to such buckets**:
  IAM Access Analyzer is used to evaluate resource sharing and access configurations. It does not check for or report on bucket-level settings such as versioning.

- **Create a centralized Amazon S3 Multi-Region Access Point for all buckets. Use this access point to perform versioning checks programmatically by inspecting objects' metadata from each bucket**:
  S3 Multi-Region Access Points simplify cross-Region data access but do not provide visibility into bucket configuration or versioning status. It is not designed for compliance checks.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - Welcome](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-lens/)

</details>

---

<div id="question-09"></div>

### Question 09: Amazon S3 Analytics: Storage Class Analysis Transition Recommendations
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
The data engineering team at a company wants to analyze Amazon S3 storage access patterns to decide when to transition the right data to the right storage class.

Which of the following represents a correct option regarding the capabilities of Amazon S3 Analytics storage class analysis?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Storage class analysis only provides recommendations for Standard to Standard One-Zone IA classes
- **(B)** Storage class analysis only provides recommendations for Standard to Glacier Deep Archive classes
- **(C)** Storage class analysis only provides recommendations for Standard to Glacier Flexible Retrieval classes
- **(D)** Storage class analysis only provides recommendations for Standard to Standard IA classes `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Storage class analysis only provides recommendations for Standard to Standard IA classes

By using Amazon S3 analytics Storage Class Analysis you can analyze storage access patterns to help you decide when to transition the right data to the right storage class. This new Amazon S3 analytics feature observes data access patterns to help you determine when to transition less frequently accessed STANDARD storage to the STANDARD_IA (IA, for infrequent access) storage class.

Storage class analysis only provides recommendations for Standard to Standard IA classes.

After storage class analysis observes the infrequent access patterns of a filtered set of data over a period of time, you can use the analysis results to help you improve your lifecycle configurations. You can configure storage class analysis to analyze all the objects in a bucket. Or, you can configure filters to group objects together for analysis by common prefix (that is, objects that have names that begin with a common string), by object tags, or by both prefix and tags.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Storage class analysis only provides recommendations for Standard to Standard One-Zone IA classes

- Storage class analysis only provides recommendations for Standard to Glacier Deep Archive classes

- Storage class analysis only provides recommendations for Standard to Glacier Flexible Retrieval classes

- These three options contradict the explanation provided above, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - Welcome](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- 🌐 [AWS Docs: AmazonS3 - analytics storage class](https://docs.aws.amazon.com/AmazonS3/latest/userguide/analytics-storage-class.html)

</details>

---

<div id="question-10"></div>

### Question 10: Centralized Security Management with AWS Firewall Manager Supported Resources
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (D), (E) | **Đáp án đúng**: (B), (D), (E)

#### 📋 Đề bài (Scenario)
The engineering team at a multi-national company uses AWS Firewall Manager to centrally configure and manage firewall rules across its accounts and applications using AWS Organizations.

Which of the following AWS resources can the AWS Firewall Manager configure rules on? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon GuardDuty
- **(B)** VPC Security Group `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Amazon Inspector
- **(D)** AWS Web Application Firewall (AWS WAF) `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** AWS Shield Advanced `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** VPC Route Table

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Web Application Firewall (AWS WAF)

AWS Shield Advanced

VPC Security Group

AWS Firewall Manager is a security management service which allows you to centrally configure and manage firewall rules across your accounts and applications in AWS Organizations. As new applications are created, Firewall Manager makes it easy to bring new applications and resources into compliance by enforcing a common set of security rules. Now you have a single service to build firewall rules, create security policies, and enforce them in a consistent, hierarchical manner across your entire infrastructure.

> 🔗 **Tài liệu tham khảo trực quan**: [Using AWS Firewall Manager, you can centrally configure AWS WAF rules, AWS Shield Advanced protection, Amazon Virtual Private Cloud (VPC) security groups, AWS Network Firewalls, and Amazon Route 53 Resolver DNS Firewall rules across accounts and resources in your organization. It does not support Network ACLs as of today.](https://aws.amazon.com/firewall-manager/faqs/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon GuardDuty**:
  Amazon GuardDuty offers threat detection that enables you to continuously monitor and protect your AWS accounts, workloads, and data stored in Amazon S3. Amazon GuardDuty analyzes continuous streams of meta-data generated from your account and network activity found in AWS CloudTrail Events, Amazon VPC Flow Logs, and DNS Logs.

- How Amazon GuardDuty Works:

- **Amazon Inspector**:
  Amazon Inspector is an automated security assessment service that helps you test the network accessibility of your Amazon EC2 instances and the security state of your applications running on the instances.

- **VPC Route Table**:
  A route table serves as the traffic controller for your virtual private cloud (VPC). Each route table contains a set of rules, called routes, that determine where network traffic from your subnet or gateway is directed.

- These three options are not in the list of AWS resources supported by AWS Firewall Manager, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: firewall-manager](https://aws.amazon.com/firewall-manager/faqs/)
- 🌐 [AWS Service Overview: guardduty](https://aws.amazon.com/guardduty/)
- 🌐 [AWS Service Overview: inspector](https://aws.amazon.com/inspector/)

</details>

---

<div id="question-11"></div>

### Question 11: Orchestrating Serverless Batch Image Processing with AWS Step Functions & Batch
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A media company is modernizing its legacy image processing application by migrating it from an on-premises environment to AWS. The application handles a high volume of image transformation jobs, generating large output files. To support rapid growth, the company wants a cloud-native solution that automatically scales, minimizes manual intervention, and avoids managing servers or infrastructure. The team also wants to improve workflow automation to handle task sequencing and job state transitions.

Which solution best meets these requirements while ensuring the least operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Batch to process image jobs. Orchestrate the workflow using AWS Step Functions and store output files in Amazon S3 `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy Amazon Elastic Kubernetes Service (Amazon EKS) with self-managed EC2 worker nodes for image processing. Use Amazon SQS to queue jobs and store processed outputs in Amazon EBS volumes
- **(C)** Use a combination of AWS Lambda functions and EC2 Spot Instances for processing. Store processed images in Amazon FSx
- **(D)** Use Amazon EC2 Auto Scaling groups with a static fleet of instances for image processing. Trigger each job through Step Functions and store results on attached EBS volumes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Batch to process image jobs. Orchestrate the workflow using AWS Step Functions and store output files in Amazon S3

This solution offers the least operational overhead and fully leverages AWS-managed services. AWS Batch automatically provisions and scales compute resources for job execution without requiring infrastructure management. Step Functions provides a visual, serverless way to orchestrate complex workflows with built-in state management and retries. Amazon S3 is ideal for storing large output files due to its durability, scalability, and integration with Batch and Step Functions. This stack meets all requirements: scalable, automated, and infrastructure-free.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon Elastic Kubernetes Service (Amazon EKS) with self-managed EC2 worker nodes for image processing. Use Amazon SQS to queue jobs and store processed outputs in Amazon EBS volumes**:
  While Amazon EKS offers powerful orchestration for containerized workloads, self-managed EC2 nodes introduce significant infrastructure management burden—contradicting the company's goal of minimal operational overhead. This setup requires patching, capacity planning, and node lifecycle management. Additionally, using Amazon EBS for storing large shared outputs is not optimal for distributed processing scenarios. The operational complexity of EKS with EC2 makes this solution less desirable for a serverless-first use case.

- **Use a combination of AWS Lambda functions and EC2 Spot Instances for processing. Store processed images in Amazon FSx**:
  Although AWS Lambda is great for lightweight processing, it's not designed for compute-heavy or long-running image processing workloads - especially those involving large file sizes. EC2 Spot Instances are cost-effective but can be interrupted at any time, making them risky for non-idempotent or large processing jobs. Additionally, Amazon FSx is better suited for Windows-based or high-performance POSIX-compliant file systems, which adds complexity unless strictly required. This hybrid setup also requires managing Spot capacity and lifecycle.

- **Use Amazon EC2 Auto Scaling groups with a static fleet of instances for image processing. Trigger each job through Step Functions and store results on attached EBS volumes**:
  Even though EC2 Auto Scaling automates instance launch and termination, it still requires manual management of instance images, EBS volume provisioning, software patching, and monitoring. The need to orchestrate instance behavior and EBS lifecycle management increases operational effort. EBS is not a good fit for scalable or concurrent access to processed files, and managing storage at the instance level introduces complexity. This architecture contradicts the requirement to avoid infrastructure management.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: batch - what is batch](https://docs.aws.amazon.com/batch/latest/userguide/what-is-batch.html)
- 🌐 [AWS Docs: step-functions - welcome](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- 🌐 [AWS Docs: eks - what is eks](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)

</details>

---

<div id="question-12"></div>

### Question 12: Connecting Remote Branch Offices to Corporate HQ via AWS VPN CloudHub
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A media company has its corporate headquarters in Los Angeles with an on-premises data center using an AWS Direct Connect connection to the AWS VPC. The branch offices in San Francisco and Miami use AWS Site-to-Site VPN connections to connect to the AWS VPC. The company is looking for a solution to have the branch offices send and receive data with each other as well as with their corporate headquarters.

As a solutions architect, which of the following AWS services would you recommend addressing this use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Software VPN
- **(B)** VPC Endpoint
- **(C)** AWS VPN CloudHub `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** VPC Peering connection

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS VPN CloudHub

If you have multiple AWS Site-to-Site VPN connections, you can provide secure communication between sites using the AWS VPN CloudHub. This enables your remote sites to communicate with each other, and not just with the VPC. Sites that use AWS Direct Connect connections to the virtual private gateway can also be part of the AWS VPN CloudHub. The VPN CloudHub operates on a simple hub-and-spoke model that you can use with or without a VPC. This design is suitable if you have multiple branch offices and existing internet connections and would like to implement a convenient, potentially low-cost hub-and-spoke model for primary or backup connectivity between these remote offices.

Per the given use-case, the corporate headquarters has an AWS Direct Connect connection to the VPC and the branch offices have Site-to-Site VPN connections to the VPC. Therefore using the AWS VPN CloudHub, branch offices can send and receive data with each other as well as with their corporate headquarters.

> 🔗 **Tài liệu tham khảo trực quan**: [AWS VPN CloudHub:](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPN_CloudHub.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **VPC Endpoint**:
  A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. AWS PrivateLink simplifies the security of data shared with cloud-based applications by eliminating the exposure of data to the public Internet. When you use VPC endpoint, the traffic between your VPC and the other AWS service does not leave the Amazon network, therefore this option cannot be used to send and receive data between the remote branch offices of the company.

- **VPC Peering connection**:
  A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network. VPC peering facilitates a connection between two VPCs within the AWS network, therefore this option cannot be used to send and receive data between the remote branch offices of the company.

- **Software VPN**:
  Amazon VPC offers you the flexibility to fully manage both sides of your Amazon VPC connectivity by creating a VPN connection between your remote network and a software VPN appliance running in your Amazon VPC network. Since Software VPN just handles connectivity between the remote network and Amazon VPC, therefore it cannot be used to send and receive data between the remote branch offices of the company.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: whitepapers - aws vpn cloudhub network to amazon](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-vpn-cloudhub-network-to-amazon.html)
- 🌐 [AWS Docs: vpn - VPN_CloudHub](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPN_CloudHub.html)

</details>

---

<div id="question-13"></div>

### Question 13: Scaling RDS Read Workloads for Analytics with In-Region Read Replicas
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Your e-commerce application is using an Amazon RDS PostgreSQL database and an analytics workload also runs on the same database. When the analytics workload is run, your e-commerce application slows down which further affects your sales.

Which of the following is the MOST cost-optimal solution to fix this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Multi-AZ for the Amazon RDS database and run the analytics workload on the standby database
- **(B)** Create a Read Replica in the same Region as the Master database and point the analytics workload there `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a Read Replica in another Region as the Master database and point the analytics workload there
- **(D)** Migrate the analytics application to AWS Lambda

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a Read Replica in the same Region as the Master database and point the analytics workload there

Amazon RDS Read Replicas provide enhanced performance and durability for RDS database (DB) instances. They make it easy to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads. For the MySQL, MariaDB, PostgreSQL, Oracle, and SQL Server database engines, Amazon RDS creates a second DB instance using a snapshot of the source DB instance. It then uses the engines' native asynchronous replication to update the read replica whenever there is a change to the source database instance. Read replicas can be within an Availability Zone, Cross-AZ, or Cross-Region.

Creating a Read Replica is the answer. As we want to minimize the costs, we need to launch the Read Replica in the same Region as you are not charged for the data transfer incurred in replicating data between your source database instance and read replica within the same AWS Region.

Exam Alert:

> 🔗 **Tài liệu tham khảo trực quan**: [Please review this comparison vis-a-vis Multi-AZ vs Read Replica for Amazon RDS:](https://aws.amazon.com/rds/features/multi-az/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable Multi-AZ for the Amazon RDS database and run the analytics workload on the standby database**:
  Amazon RDS Multi-AZ deployments provide enhanced availability and durability for RDS database (DB) instances, making them a natural fit for production database workloads. When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). Multi-AZ spans at least two Availability Zones within a single region.

- Enabling Multi-AZ helps make our database highly-available, but the standby database is not accessible and cannot be used for reads or write. It's just a database that will become primary when the other database encounters a failure. So this option is not correct.

- Migrate the analytics application to AWS Lambda- AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume.

- Running the application on AWS Lambda will not help, as it will still run against the main database and slow down our e-commerce application.

- **Create a Read Replica in another Region as the Master database and point the analytics workload there**:
  This is incorrect because we have to pay for inter-Region data replication charges for the Read Replica, whereas the replication of data within a single Region is free.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/multi-az/)
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/read-replicas/)

</details>

---

<div id="question-14"></div>

### Question 14: Secure Public Web Tier: NLB in Public Subnet with EC2 in Private Subnet
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is deploying a publicly accessible web application. To accomplish this, the engineering team has designed the VPC with a public subnet and a private subnet. The application will be hosted on several Amazon EC2 instances in an Auto Scaling group. The team also wants Transport Layer Security (TLS) termination to be offloaded from the Amazon EC2 instances.

Which solution should a solutions architect implement to address these requirements in the most secure manner?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a Network Load Balancer in the private subnet. Create an Auto Scaling group in the private subnet and associate it with the Network Load Balancer
- **(B)** Set up a Network Load Balancer in the public subnet. Create an Auto Scaling group in the private subnet and associate it with the Network Load Balancer `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Set up a Network Load Balancer in the public subnet. Create an Auto Scaling group in the public subnet and associate it with the Network Load Balancer
- **(D)** Set up a Network Load Balancer in the private subnet. Create an Auto Scaling group in the public subnet and associate it with the Network Load Balancer

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up a Network Load Balancer in the public subnet. Create an Auto Scaling group in the private subnet and associate it with the Network Load Balancer

A load balancer serves as the single point of contact for clients. The load balancer distributes incoming traffic across multiple targets, such as Amazon EC2 instances. This increases the availability of your application. You add one or more listeners to your load balancer.

With a Network Load Balancer, you can offload the decryption/encryption of Transport Layer Security (TLS) traffic from your application servers to the Network Load Balancer, which helps you optimize the performance of your backend application servers while keeping your workloads secure. Additionally, Network Load Balancers preserve the source IP of the clients to the back-end applications, while terminating Transport Layer Security (TLS) on the load balancer.

An Auto Scaling group contains a collection of Amazon EC2 instances that are treated as a logical grouping for the purposes of automatic scaling and management. An Auto Scaling group also enables you to use Amazon EC2 Auto Scaling features such as health check replacements and scaling policies. Both maintaining the number of instances in an Auto Scaling group and automatic scaling are the core functionality of the Amazon EC2 Auto Scaling service.

The NLB has to be accessible over the internet and hence has to be in a public subnet and will act as a single point-of-contact for all incoming traffic. NLB will forward the incoming traffic to the Amazon EC2 instances managed by the ASG in the private subnet.

Exam Alert:

You should note that the Application Load Balancer also supports Transport Layer Security (TLS) offloading. The Classic Load Balancer supports SSL offloading.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up a Network Load Balancer in the public subnet. Create an Auto Scaling group in the public subnet and associate it with the Network Load Balancer**:
  The Auto Scaling group with its target EC2 instances should be in the private subnet to avoid access to EC2 instances over the public internet. Having EC2 instances in the public subnet would weaken the security posture of the application. Hence, this option is incorrect.

- Set up a Network Load Balancer in the private subnet. Create an Auto Scaling group in the public subnet and associate it with the Network Load Balancer

- Set up a Network Load Balancer in the private subnet. Create an Auto Scaling group in the private subnet and associate it with the Network Load Balancer

- NLB should be in the public subnet as it represents the internet-facing component of the web tier. Therefore, both these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: new tls termination for network load balancers](https://aws.amazon.com/blogs/aws/new-tls-termination-for-network-load-balancers/)

</details>

---

<div id="question-15"></div>

### Question 15: Accelerating Global S3 Static Site with CloudFront & Transfer Acceleration
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A global photography startup hosts a static image-sharing site on an Amazon S3 bucket. The website allows users from different parts of the world to upload, view, and download photos through their mobile devices. As the platform has gained popularity, users have started experiencing latency issues, especially when uploading and downloading images. The team needs a solution to enhance global performance but wants to implement it with minimal development effort and without redesigning the application.

Which solution will most effectively address the performance issues with the least operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create multiple S3 buckets in different Regions and replicate image data based on user location. Configure CloudFront to upload and download from the nearest bucket
- **(B)** Migrate the website from S3 to Amazon EC2 instances in multiple Regions. Use an Application Load Balancer with AWS Global Accelerator to distribute global traffic and reduce latency
- **(C)** Deploy an Amazon CloudFront distribution with the S3 bucket as the origin to improve download speeds. Enable S3 Transfer Acceleration to reduce upload latency for global users `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Enable AWS Global Accelerator on the S3 bucket to accelerate both uploads and downloads. Reconfigure the website to route requests through the accelerator

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Deploy an Amazon CloudFront distribution with the S3 bucket as the origin to improve download speeds. Enable S3 Transfer Acceleration to reduce upload latency for global users

This solution provides a low-effort, AWS-native solution that significantly improves the performance of both downloads and uploads for a global user base—without requiring changes to the application architecture. By configuring Amazon CloudFront, a content delivery network (CDN), the company ensures that image downloads are served from edge locations close to the users, reducing latency and improving load times. To address upload performance, enabling S3 Transfer Acceleration allows users to upload images via AWS edge locations, which then route data over optimized AWS backbone networks to the S3 bucket. This minimizes latency for uploads, especially from distant regions. Both features are simple to enable, require no infrastructure provisioning, and are specifically designed for S3-based static sites—making this solution the most effective and efficient choice.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Migrate the website from S3 to Amazon EC2 instances in multiple Regions. Use an Application Load Balancer with AWS Global Accelerator to distribute global traffic and reduce latency**:
  While technically feasible, this approach involves significant infrastructure changes, including deploying and managing EC2 instances, setting up web servers, maintaining application code, and configuring load balancing. It also deviates from the static website model hosted in S3, increasing operational complexity and cost. This option is over-engineered for the problem and does not meet the requirement for minimal implementation effort.

- **Create multiple S3 buckets in different Regions and replicate image data based on user location. Configure CloudFront to upload and download from the nearest bucket**:
  This approach attempts to manually geo-distribute data using cross-Region replication and routing logic. However, it introduces significant configuration complexity, including replication management, custom logic to determine upload destinations, and download redirection. Additionally, CloudFront is designed for read-only access, not for direct uploads. Uploads via CloudFront require advanced signed URLs and are not recommended for typical user-submitted content. This option fails the simplicity requirement.

- **Enable AWS Global Accelerator on the S3 bucket to accelerate both uploads and downloads. Reconfigure the website to route requests through the accelerator**:
  AWS Global Accelerator does not support S3 buckets as direct endpoints. It’s designed for improving performance for global applications deployed on EC2, ALB, or NLB, not for S3 static websites. There’s no direct integration between Global Accelerator and S3 unless the S3 bucket is fronted by another service like CloudFront or ALB. Therefore, this option is not technically valid and doesn’t meet the stated requirements.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudFront - DownloadDistS3AndCustomOrigins](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DownloadDistS3AndCustomOrigins.html)
- 🌐 [AWS Docs: AmazonS3 - transfer acceleration](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transfer-acceleration.html)
- 🌐 [AWS Docs: global-accelerator - about endpoints](https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints.html)

</details>

---

<div id="question-16"></div>

### Question 16: Cost-Effective Batch Nightly Processing Using Spot Instances Persistent Requests
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
The development team at a company manages a Python based nightly process with a runtime of 30 minutes. The process can withstand any interruptions in its execution and start over again. The process currently runs on the on-premises infrastructure and it needs to be migrated to AWS.

Which of the following options do you recommend as the MOST cost-effective solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Run on an Application Load Balancer
- **(B)** Run on AWS Lambda
- **(C)** Run on Amazon EMR
- **(D)** Run on a Spot Instance with a persistent request type `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Run on a Spot Instance with a persistent request type

A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Because Spot Instances enable you to request unused Amazon EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly. The hourly price for a Spot Instance is called a Spot price. The request type (one-time or persistent) determines whether the request is opened again when Amazon EC2 interrupts a Spot Instance or if you stop a Spot Instance. If the request is persistent, the request is opened again after your Spot Instance is interrupted. If the request is persistent and you stop your Spot Instance, the request only opens after you start your Spot Instance.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Run on an Application Load Balancer**:
  Application Load Balancer operates at the request level (layer 7), routing traffic to targets – Amazon EC2 instances, containers, IP addresses, and AWS Lambda functions based on the content of the request. Ideal for advanced load balancing of HTTP and HTTPS traffic, Application Load Balancer provides advanced request routing targeted at delivery of modern application architectures, including microservices and container-based applications.

- Application Load Balancer helps distribute load for HTTP(S) requests. This option has been added as a distractor.

- **Run on Amazon EMR**:
  Amazon EMR is the industry-leading cloud big data platform for processing vast amounts of data using open source tools such as Apache Spark, Apache Hive, Apache HBase, Apache Flink, Apache Hudi, and Presto. Amazon EMR uses Hadoop, an open-source framework, to distribute your data and processing across a resizable cluster of Amazon EC2 instances.

- Amazon EMR is to run Big Data load that is meant to be run on Hadoop, this is also a distractor.

- **Run on AWS Lambda**:
  AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume.

- AWS Lambda would be the perfect fit if our script could run in less than 15 minutes, as this is the maximum timeout for AWS Lambda.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - spot requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html)

</details>

---

<div id="question-17"></div>

### Question 17: Protecting Video Streaming Downloads with CloudFront Signed URLs
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (D) | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A digital media streaming company wants to use Amazon CloudFront to distribute its content only to its service subscribers. As a solutions architect, which of the following solutions would you suggest to deliver restricted content to the bona fide end users? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Require HTTPS for communication between Amazon CloudFront and your S3 origin
- **(B)** Require HTTPS for communication between Amazon CloudFront and your custom origin
- **(C)** Use Amazon CloudFront signed URLs `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon CloudFront signed cookies `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Forward HTTPS requests to the origin server by using the ECDSA or RSA ciphers

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon CloudFront signed URLs

Many companies that distribute content over the internet want to restrict access to documents, business data, media streams, or content that is intended for selected users, for example, users who have paid a fee.

To securely serve this private content by using Amazon CloudFront, you can do the following:

Require that your users access your private content by using special Amazon CloudFront signed URLs or signed cookies.

A signed URL includes additional information, for example, expiration date and time, that gives you more control over access to your content. So this is a correct option.

Use Amazon CloudFront signed cookies

Amazon CloudFront signed cookies allow you to control who can access your content when you don't want to change your current URLs or when you want to provide access to multiple restricted files, for example, all of the files in the subscribers' area of a website. So this is also a correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Require HTTPS for communication between Amazon CloudFront and your custom origin

- Require HTTPS for communication between Amazon CloudFront and your S3 origin

- Requiring HTTPS for communication between Amazon CloudFront and your custom origin (or S3 origin) only enables secure access to the underlying content. You cannot use HTTPS to restrict access to your private content. So both these options are incorrect.

- **Forward HTTPS requests to the origin server by using the ECDSA or RSA ciphers**:
  This option is just added as a distractor. You cannot use HTTPS to restrict access to your private content.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudFront - private content signed urls](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-signed-urls.html)
- 🌐 [AWS Docs: AmazonCloudFront - private content signed cookies](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-signed-cookies.html)

</details>

---

<div id="question-18"></div>

### Question 18: Required VPC DNS Attributes for Amazon Route 53 Private Hosted Zones
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (E) | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
The engineering team at an e-commerce company wants to set up a custom domain for internal usage such as internaldomainexample.com. The team wants to use the private hosted zones feature of Amazon Route 53 to accomplish this.

Which of the following settings of the VPC need to be enabled? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** enableDnsDomain
- **(B)** enableDnsSupport `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** enableVpcSupport
- **(D)** enableVpcHostnames
- **(E)** enableDnsHostnames `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
enableDnsHostnames

enableDnsSupport

A private hosted zone is a container for records for a domain that you host in one or more Amazon virtual private clouds (VPCs). You create a hosted zone for a domain (such as example.com), and then you create records to tell Amazon Route 53 how you want traffic to be routed for that domain within and among your VPCs.

For each VPC that you want to associate with the Route 53 hosted zone, change the following VPC settings to true:

enableDnsHostnames

enableDnsSupport

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- enableVpcSupport

- enableVpcHostnames

- enableDnsDomain

- The options enableVpcSupport, enableVpcHostnames and enableDnsDomain have been added as distractors.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: Route53 - hosted zone private creating](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zone-private-creating.html)

</details>

---

<div id="question-19"></div>

### Question 19: Handling Viral Traffic Surges with Aurora Read Replicas & CloudFront Caching
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (D) | **Đáp án đúng**: (A), (D)

#### 📋 Đề bài (Scenario)
A company manages a multi-tier social media application that runs on Amazon Elastic Compute Cloud (Amazon EC2) instances behind an Application Load Balancer. The instances run in an Amazon EC2 Auto Scaling group across multiple Availability Zones (AZs) and use an Amazon Aurora database. As an AWS Certified Solutions Architect – Associate, you have been tasked to make the application more resilient to periodic spikes in read request rates.

Which of the following solutions would you recommend for the given use-case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon CloudFront distribution in front of the Application Load Balancer `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use AWS Global Accelerator
- **(C)** Use AWS Direct Connect
- **(D)** Use Amazon Aurora Replica `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Use AWS Shield

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You can use Amazon Aurora replicas and Amazon CloudFront distribution to make the application more resilient to spikes in request rates.

Use Amazon Aurora Replica

Amazon Aurora Replicas have two main purposes. You can issue queries to them to scale the read operations for your application. You typically do so by connecting to the reader endpoint of the cluster. That way, Aurora can spread the load for read-only connections across as many Aurora Replicas as you have in the cluster. Amazon Aurora Replicas also help to increase availability. If the writer instance in a cluster becomes unavailable, Aurora automatically promotes one of the reader instances to take its place as the new writer. Up to 15 Aurora Replicas can be distributed across the Availability Zones (AZs) that a DB cluster spans within an AWS Region.

Use Amazon CloudFront distribution in front of the Application Load Balancer

Amazon CloudFront is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, all within a developer-friendly environment. CloudFront points of presence (POPs) (edge locations) make sure that popular content can be served quickly to your viewers. Amazon CloudFront also has regional edge caches that bring more of your content closer to your viewers, even when the content is not popular enough to stay at a POP, to help improve performance for that content.

Amazon CloudFront offers an origin failover feature to help support your data resiliency needs. Amazon CloudFront is a global service that delivers your content through a worldwide network of data centers called edge locations or points of presence (POPs). If your content is not already cached in an edge location, Amazon CloudFront retrieves it from an origin that you've identified as the source for the definitive version of the content.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS Shield**:
  AWS Shield is a managed Distributed Denial of Service (DDoS) protection service that safeguards applications running on AWS. AWS Shield provides always-on detection and automatic inline mitigations that minimize application downtime and latency. There are two tiers of AWS Shield - Standard and Advanced. AWS Shield cannot be used to improve application resiliency to handle spikes in traffic.

- **Use AWS Global Accelerator**:
  AWS Global Accelerator is a service that improves the availability and performance of your applications with local or global users. It provides static IP addresses that act as a fixed entry point to your application endpoints in a single or multiple AWS Regions, such as your Application Load Balancers, Network Load Balancers or Amazon EC2 instances. Amazon Global Accelerator is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP, as well as for HTTP use cases that specifically require static IP addresses or deterministic, fast regional failover. Since Amazon CloudFront is better for improving application resiliency to handle spikes in traffic, so this option is ruled out.

- **Use AWS Direct Connect**:
  AWS Direct Connect lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. Using industry-standard 802.1q VLANs, this dedicated connection can be partitioned into multiple virtual interfaces. AWS Direct Connect does not involve the Internet; instead, it uses dedicated, private network connections between your intranet and Amazon VPC. AWS Direct Connect cannot be used to improve application resiliency to handle spikes in traffic.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonRDS - disaster recovery resiliency](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/disaster-recovery-resiliency.html)
- 🌐 [AWS Docs: AmazonRDS - Aurora.Replication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Replication.html)
- 🌐 [AWS Service Overview: global-accelerator](https://aws.amazon.com/global-accelerator/faqs/)
- 🌐 [AWS Docs: global-accelerator - disaster recovery resiliency](https://docs.aws.amazon.com/global-accelerator/latest/dg/disaster-recovery-resiliency.html)

</details>

---

<div id="question-20"></div>

### Question 20: Prioritizing Workload Processing Using Multiple SQS Queues (Pro vs Lite)
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A social media application lets users upload photos and perform image editing operations. The application offers two classes of service: pro and lite. The product team wants the photos submitted by pro users to be processed before those submitted by lite users. Photos are uploaded to Amazon S3 and the job information is sent to Amazon SQS.

As a solutions architect, which of the following solutions would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create two Amazon SQS standard queues: one for pro and one for lite. Set the lite queue to use short polling and the pro queue to use long polling `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Create two Amazon SQS standard queues: one for pro and one for lite. Set up Amazon EC2 instances to prioritize polling for the pro queue over the lite queue `[Đáp án đúng ✅]`
- **(C)** Create one Amazon SQS standard queue. Set the visibility timeout of the pro photos to zero. Set up Amazon EC2 instances to prioritize visibility settings so pro photos are processed first
- **(D)** Create two Amazon SQS FIFO queues: one for pro and one for lite. Set the lite queue to use short polling and the pro queue to use long polling

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create two Amazon SQS standard queues: one for pro and one for lite. Set up Amazon EC2 instances to prioritize polling for the pro queue over the lite queue

> 🔗 **Tài liệu tham khảo trực quan**: [AWS recommends using separate queues to provide prioritization of work. Therefore, for the given use case, you need to create an Amazon SQS standard queue for processing pro users' photos and another Amazon SQS standard queue for processing lite users' photos. Then you can configure Amazon EC2 instances to prioritize polling for the pro queue over the lite queue.](https://aws.amazon.com/sqs/features/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Create two Amazon SQS standard queues: one for pro and one for lite. Set the lite queue to use short polling and the pro queue to use long polling

- Create two Amazon SQS FIFO queues: one for pro and one for lite. Set the lite queue to use short polling and the pro queue to use long polling

- Amazon SQS long polling is a way to retrieve messages from your Amazon SQS queues. While the regular short polling returns immediately, even if the message queue being polled is empty, long-polling doesn’t return a response until a message arrives in the message queue, or the long poll times out. Since long polling or short polling cannot impact the priority of processing for the two queues, so both these options are incorrect.

- **> 🔗 **Tài liệu tham khảo trực quan**: [Create one Amazon SQS standard queue. Set the visibility timeout of the pro photos to zero. Set up Amazon EC2 instances to prioritize visibility settings so pro photos are processed first**:
  To prevent other consumers from processing the message again, Amazon SQS sets a visibility timeout, a period of time during which Amazon SQS prevents other consumers from receiving and processing the message. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. Setting visibility timeout to zero can result in the same pro photo being processed by more than one consumer. This does not help in prioritizing the processing of pro photos over the lite photos.](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: sqs](https://aws.amazon.com/sqs/features/)
- 🌐 [AWS Docs: AWSSimpleQueueService - sqs visibility timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)

</details>

---

<div id="question-21"></div>

### Question 21: Centralized IAM Permissions Management via IAM Groups
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A team has around 200 users, each of these having an IAM user account in AWS. Currently, they all have read access to an Amazon S3 bucket. The team wants 50 among them to have write and read access to the buckets.

How can you provide these users access in the least possible time, with minimal changes?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Multi-Factor Authentication (AWS MFA) user with read / write access and link 50 IAM with AWS MFA
- **(B)** Create a group, attach the policy to the group and place the users in the group `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a policy and assign it manually to the 50 users
- **(D)** Update the Amazon S3 bucket policy

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a group, attach the policy to the group and place the users in the group

An IAM group is a collection of IAM users. You can use groups to specify permissions for a collection of users, which can make those permissions easier to manage for those users. For example, you could have a group called Admins and give that group the types of permissions that administrators typically need. Any user in that group automatically has the permissions that are assigned to the group. If a new user joins your organization and should have administrator privileges, you can assign the appropriate permissions by adding the user to that group.

Here creating a group, assigning users to that group and attaching policies to that group is the best way.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Update the Amazon S3 bucket policy**:
  Updating the Amazon S3 bucket policy could work but would not scale, as the size of the S3 bucket policy is limited (Bucket policies are limited to 20 KB in size).

- **Create a policy and assign it manually to the 50 users**:
  An IAM user is an entity that you create in AWS. The IAM user represents the person or service who uses the IAM user to interact with AWS. Primary use for IAM users is to give people the ability to sign in to the AWS Management Console for interactive tasks and to make programmatic requests to AWS services using the API or CLI. A user in AWS consists of a name, a password to sign in to the AWS Management Console, and up to two access keys that can be used with the API or CLI.

- A policy is an object in AWS that, when associated with an identity or resource, defines their permissions. AWS evaluates these policies when an IAM principal (user or role) makes a request. Permissions in the policies determine whether the request is allowed or denied.

- Identity-based policies – Attach managed and inline policies to IAM identities (users, groups to which users belong, or roles). Identity-based policies grant permissions to an identity.

- Resource-based policies – Attach inline policies to resources. The most common examples of resource-based policies are Amazon S3 bucket policies and IAM role trust policies. Resource-based policies grant permissions to the principal that is specified in the policy. Principals can be in the same account as the resource or in other accounts.

- Creating a policy and assigning it manually to users would work but would be hard to scale and manage.

- **Create an AWS Multi-Factor Authentication (AWS MFA) user with read / write access and link 50 IAM with AWS MFA**:
  AWS MFA adds extra security because it requires users to provide unique authentication from an AWS supported MFA mechanism in addition to their regular sign-in credentials when they access AWS websites or services. AWS MFA cannot help in terms of granting read/write access to only 50 of the IAM users.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: IAM - id](https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html)
- 🌐 [AWS Docs: IAM - access_policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)

</details>

---

<div id="question-22"></div>

### Question 22: Deploying Microsoft Active Directory Dependent Workloads via AWS Managed Microsoft AD
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company needs an Active Directory service to run directory-aware workloads in the AWS Cloud and it should also support configuring a trust relationship with any existing on-premises Microsoft Active Directory.

Which AWS Directory Service is the best fit for this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Transit Gateway
- **(B)** Active Directory Connector
- **(C)** Simple Active Directory (Simple AD)
- **(D)** AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD) `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD)

AWS Directory Service lets you run Microsoft Active Directory (AD) as a managed service. AWS Directory Service for Microsoft Active Directory, also referred to as AWS Managed Microsoft AD, is powered by Windows Server 2012 R2. When you select and launch this directory type, it is created as a highly available pair of domain controllers connected to your virtual private cloud (VPC).

With AWS Managed Microsoft AD, you can run directory-aware workloads in the AWS Cloud, including Microsoft SharePoint and custom .NET and SQL Server-based applications. You can also configure a trust relationship between AWS Managed Microsoft AD in the AWS Cloud and your existing on-premises Microsoft Active Directory, providing users and groups with access to resources in either domain, using single sign-on (SSO).

AWS Managed Microsoft AD is your best choice if you need actual Active Directory features to support AWS applications or Windows workloads, including Amazon Relational Database Service for Microsoft SQL Server. It's also best if you want a standalone AD in the AWS Cloud that supports Office 365 or you need an LDAP directory to support your Linux applications.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Active Directory Connector**:
  AD Connector is a directory gateway with which you can redirect directory requests to your on-premises Microsoft Active Directory without caching any information in the cloud. AD Connector is your best choice when you want to use your existing on-premises directory with compatible AWS services.

- **Simple Active Directory (Simple AD)**:
  Simple AD is a standalone directory in the cloud, where you create and manage user identities and manage access to applications. Simple AD provides a subset of the features offered by AWS Managed Microsoft AD. However, note that Simple AD does not support features such as multi-factor authentication (MFA), trust relationships with other domains, Active Directory Administrative Center, PowerShell support, Active Directory recycle bin, group managed service accounts, and schema extensions for POSIX and Microsoft applications.

- **AWS Transit Gateway**:
  AWS Transit Gateway connects VPCs and on-premises networks through a central hub. Transit Gateway is not an Active Directory service.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: directoryservice - what_is](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html)
- 🌐 [AWS Docs: directoryservice - directory_simple_ad](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html)
- 🌐 [AWS Docs: directoryservice - directory_ad_connector](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_ad_connector.html)

</details>

---

<div id="question-23"></div>

### Question 23: Low-Latency Inter-Node HPC Communication Using Elastic Fabric Adapter (EFA)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A biotechnology company has multiple High Performance Computing (HPC) workflows that quickly and accurately process and analyze genomes for hereditary diseases. The company is looking to migrate these workflows from their on-premises infrastructure to AWS Cloud.

As a solutions architect, which of the following networking components would you recommend on the Amazon EC2 instances running these HPC workflows?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Elastic Network Interface (ENI)
- **(B)** Elastic IP Address (EIP)
- **(C)** Elastic Fabric Adapter (EFA) `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Elastic Network Adapter (ENA)

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Elastic Fabric Adapter (EFA)

An Elastic Fabric Adapter (EFA) is a network device that you can attach to your Amazon EC2 instance to accelerate High Performance Computing (HPC) and machine learning applications. It enhances the performance of inter-instance communication that is critical for scaling HPC and machine learning applications. EFA devices provide all Elastic Network Adapter (ENA) devices functionalities plus a new OS bypass hardware interface that allows user-space applications to communicate directly with the hardware-provided reliable transport functionality.

> 🔗 **Tài liệu tham khảo trực quan**: [How Elastic Fabric Adapter Works:](https://aws.amazon.com/hpc/efa/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Elastic Network Interface (ENI)**:
  An Elastic Network Interface (ENI) is a logical networking component in a VPC that represents a virtual network card. You can create a network interface, attach it to an instance, detach it from an instance, and attach it to another instance. The ENI is the simplest networking component available on AWS and is insufficient for HPC workflows.

- **Elastic Network Adapter (ENA)**:
  Elastic Network Adapter (ENA) devices support enhanced networking via single root I/O virtualization (SR-IOV) to provide high-performance networking capabilities. Although enhanced networking provides higher bandwidth, higher packet per second (PPS) performance, and consistently lower inter-instance latencies, still EFA is a better fit for the given use-case because the EFA device provides all the functionality of an ENA device, plus hardware support for applications to communicate directly with the EFA device without involving the instance kernel (OS-bypass communication) using an extended programming interface.

- **Elastic IP Address (EIP)**:
  An Elastic IP address (EIP) is a static IPv4 address associated with your AWS account. An Elastic IP address is a public IPv4 address, which is reachable from the internet. It is not a networking device that can be used to facilitate HPC workflows.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - efa](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa.html)
- 🌐 [AWS Service Overview: hpc](https://aws.amazon.com/hpc/efa/)

</details>

---

<div id="question-24"></div>

### Question 24: Automatic Storage Cost Optimization for Unknown Access Patterns with S3 Intelligent-Tiering
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The engineering team at a social media company has noticed that while some of the images stored in Amazon S3 are frequently accessed, others sit idle for a considerable span of time.

As a solutions architect, what is your recommendation to build the MOST cost-effective solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the images using the Amazon S3 Intelligent-Tiering storage class `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Store the images using the Amazon S3 Standard-IA storage class
- **(C)** Create a data monitoring application on an Amazon EC2 instance in the same region as the bucket storing the images. The application is triggered daily via Amazon CloudWatch and it changes the storage class of infrequently accessed objects to Amazon S3 Standard-IA and the frequently accessed objects are migrated to Amazon S3 Standard class
- **(D)** Create a data monitoring application on an Amazon EC2 instance in the same region as the bucket storing the images. The application is triggered daily via Amazon CloudWatch and it changes the storage class of infrequently accessed objects to Amazon S3 One Zone-IA and the frequently accessed objects are migrated to Amazon S3 Standard class

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Store the images using the Amazon S3 Intelligent-Tiering storage class

The Amazon S3 Intelligent-Tiering storage class is designed to optimize costs by automatically moving data to the most cost-effective access tier, without performance impact or operational overhead. It works by storing objects in two access tiers: one tier that is optimized for frequent access and another lower-cost tier that is optimized for infrequent access.

For a small monthly monitoring and automation fee per object, Amazon S3 monitors access patterns of the objects in S3 Intelligent-Tiering and moves the ones that have not been accessed for 30 consecutive days to the infrequent access tier. If an object in the infrequent access tier is accessed, it is automatically moved back to the frequent access tier. Therefore using the Amazon S3 Intelligent-Tiering storage class is the correct solution for the given problem statement.

Amazon S3 Storage Classes Overview:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Store the images using the Amazon S3 Standard-IA storage class

- Amazon S3 Standard-IA is for data that is accessed less frequently but requires rapid access when needed. Amazon S3 Standard-IA offers high durability, high throughput, and low latency of Amazon S3 Standard, with a low per GB storage price and per GB retrieval fee. This combination of low cost and high performance makes Amazon S3 Standard-IA ideal for long-term storage, backups, and as a data store for disaster recovery files. The minimum storage duration charge is 30 days. As some of the objects are frequently accessed, the per GB retrieval fee for Amazon S3 Standard-IA can cause the costs to shoot up, hence this option is incorrect.

- Create a data monitoring application on an Amazon EC2 instance in the same region as the bucket storing the images. The application is triggered daily via Amazon CloudWatch and it changes the storage class of infrequently accessed objects to Amazon S3 One Zone-IA and the frequently accessed objects are migrated to Amazon S3 Standard class

- Create a data monitoring application on an Amazon EC2 instance in the same region as the bucket storing the images. The application is triggered daily via Amazon CloudWatch and it changes the storage class of infrequently accessed objects to Amazon S3 Standard-IA and the frequently accessed objects are migrated to Amazon S3 Standard class

- Creating a data monitoring application on an Amazon EC2 instance for managing the desired Amazon S3 storage class entails significant development cost as well as infrastructure maintenance effort. The Amazon S3 Intelligent-Tiering storage class does the job in a cost-effective way. Therefore both these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-classes/)

</details>

---

<div id="question-25"></div>

### Question 25: Automating EC2 Custom Initialization via EC2 User Data Scripts
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A systems administration team has a requirement to run certain custom scripts only once during the launch of the Amazon Elastic Compute Cloud (Amazon EC2) instances that host their application.

Which of the following represents the best way of configuring a solution for this requirement with minimal effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Run the custom scripts as instance metadata scripts on the Amazon EC2 instances
- **(B)** Use AWS CLI to run the user data scripts only once while launching the instance
- **(C)** Run the custom scripts as user data scripts on the Amazon EC2 instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Update Amazon EC2 instance configuration to ensure that the custom scripts, added as user data scripts, are run only during the boot process

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Run the custom scripts as user data scripts on the Amazon EC2 instances

When you launch an instance in Amazon EC2, you have the option of passing user data to the instance that can be used to perform common automated configuration tasks and even run scripts after the instance starts. You can pass two types of user data to Amazon EC2: shell scripts and cloud-init directives.

By default, user data scripts and cloud-init directives run only during the boot cycle when you first launch an instance. Hence, no extra configuration is needed, apart from including the custom scripts in user data scripts.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Update Amazon EC2 instance configuration to ensure that the custom scripts, added as user data scripts, are run only during the boot process**:
  You can update your configuration to ensure that your user data scripts and cloud-init directives run every time you restart your instance. By default, the scripts are run, only once during the boot process while first launching the instance.

- Run the custom scripts as instance metadata scripts on the Amazon EC2 instances- Instance metadata is data about your instance that you can use to configure or manage the running instance. Metadata cannot be used to run custom scripts.

- **Use AWS CLI to run the user data scripts only once while launching the instance**:
  This statement is incorrect and used only as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
- 🌐 [AWS Docs: AWSEC2 - ec2 instance metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

</details>

---

<div id="question-26"></div>

### Question 26: Highly Available Bastion Host Architecture with Auto Scaling Group & Network Load Balancer
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The systems administrator at a company wants to set up a highly available architecture for a bastion host solution.

As a solutions architect, which of the following options would you recommend as the solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a public Network Load Balancer that links to Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create an elastic IP address (EIP) and assign it to all Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group
- **(C)** Create a VPC Endpoint for a fleet of Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group
- **(D)** Create a public Application Load Balancer that links to Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a public Network Load Balancer that links to Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group

Network Load Balancer is best suited for use-cases involving low latency and high throughput workloads that involve scaling to millions of requests per second. Network Load Balancer operates at the connection level (Layer 4), routing connections to targets - Amazon EC2 instances, microservices, and containers – within Amazon Virtual Private Cloud (Amazon VPC) based on IP protocol data.

Including bastion hosts in your VPC environment enables you to securely connect to your Linux instances without exposing your environment to the Internet. After you set up your bastion hosts, you can access the other instances in your VPC through Secure Shell (SSH) connections on Linux. Bastion hosts are also configured with security groups to provide fine-grained ingress control.

You need to remember that Bastion Hosts are using the SSH protocol, which is a TCP based protocol on port 22. They must be publicly accessible.

Here, the correct answer is to use a Network Load Balancer, which supports TCP traffic, and will automatically allow you to connect to the Amazon EC2 instance in the backend.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an elastic IP address (EIP) and assign it to all Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group**:
  An elastic IP address (EIP) can only be attached to one Amazon EC2 instance at a time, so it won't provide you a highly available setup on its own. Note that if we had two Elastic IPs and two Bastion Hosts, this would work.

- **Create a VPC Endpoint for a fleet of Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group**:
  A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other service does not leave the Amazon network.

- VPC Endpoints are not used on top of Amazon EC2 instances. They're a way to access AWS services privately within your VPC (without using the public internet). This is a distractor.

- **Create a public Application Load Balancer that links to Amazon EC2 instances that are bastion hosts managed by an Auto Scaling Group**:
  Application Load Balancer (ALB) operates at the request level (layer 7), routing traffic to targets – Amazon EC2 instances, containers, IP addresses and AWS Lambda functions based on the content of the request. Ideal for advanced load balancing of HTTP and HTTPS traffic, Application Load Balancer provides advanced request routing targeted at delivery of modern application architectures, including microservices and container-based applications.

- An Application Load Balancer only supports HTTP traffic, which is layer 7, while the SSH protocol is based on TCP and is layer 4. So, the Application Load Balancer doesn't work.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: quickstart - architecture](https://docs.aws.amazon.com/quickstart/latest/linux-bastion/architecture.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- 🌐 [AWS Docs: vpc - vpc endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)

</details>

---

<div id="question-27"></div>

### Question 27: Sub-Millisecond Multithreaded In-Memory Caching with ElastiCache for Memcached
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An e-commerce application uses a relational database that runs several queries that perform joins on multiple tables. The development team has found that these queries are slow and expensive, therefore these are a good candidate for caching. The application needs to use a caching service that supports multi-threading.

As a solutions architect, which of the following services would you recommend for the given use case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon DynamoDB Accelerator (DAX)
- **(B)** Amazon ElastiCache for Redis
- **(C)** Amazon ElastiCache for Memcached `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** AWS Global Accelerator

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon ElastiCache for Memcached

Amazon ElastiCache is a web service that makes it easy to deploy, operate, and scale an in-memory data store and cache in the cloud. The service improves the performance of web applications by allowing you to retrieve information from fast, managed, in-memory data stores, instead of relying entirely on slower disk-based databases.

Memcached is an open-source, distributed, in-memory key-value store that can retrieve data in milliseconds. Caching site information with Memcached can help you improve the performance and scalability of your site while controlling cost.

Choose Memcached if the following apply to you:

You need the simplest model possible.

You need to run large nodes with multiple cores or threads (support for multi-threading).

You need the ability to scale out and in, adding and removing nodes as demand on your system increases and decreases.

> 🔗 **Tài liệu tham khảo trực quan**: [You need to cache objects.](https://aws.amazon.com/elasticache/redis-vs-memcached/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon ElastiCache for Redis**:
  Redis, which stands for Remote Dictionary Server, is a fast, open-source, in-memory key-value data store for use as a database, cache, message broker, and queue. Redis now delivers sub-millisecond response times enabling millions of requests per second for real-time applications in Gaming, Ad-Tech, Financial Services, Healthcare, and IoT. Redis is a popular choice for caching, session management, gaming, leaderboards, real-time analytics, geospatial, ride-hailing, chat/messaging, media streaming, and pub/sub apps.

- Redis does not support multi-threading, so this option is not the right fit for the given use case.

- **Amazon DynamoDB Accelerator (DAX)**:
  Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache for Amazon DynamoDB. DAX does not support relational databases.

- **AWS Global Accelerator**:
  AWS Global Accelerator is a networking service that helps you improve the availability and performance of the applications that you offer to your global users. This option has been added as a distractor, it has nothing to do with database caching.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: caching](https://aws.amazon.com/caching/aws-caching/)
- 🌐 [AWS Docs: AmazonElastiCache - elasticache use cases](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/elasticache-use-cases.html)
- 🌐 [AWS Service Overview: elasticache](https://aws.amazon.com/elasticache/redis-vs-memcached/)

</details>

---

<div id="question-28"></div>

### Question 28: Migrating Legacy TCP/UDP Stateful Workloads to Multi-AZ EC2 Behind NLB
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A media company is relocating its legacy infrastructure to AWS. The on-premises environment consists of multiple virtualized workloads that are tightly coupled to their host operating systems and cannot be containerized or re-architected due to software constraints. Each workload currently runs on a standalone virtual machine. The engineering team plans to run these workloads on Amazon EC2 instances without modifying their core design. The company needs a solution that ensures high availability and fault tolerance in the AWS Cloud.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Backup to schedule hourly backups of each EC2 instance to Amazon S3 in a separate Availability Zone. Create a recovery plan that includes manual restoration of instances from backup in the event of a failure
- **(B)** Containerize the legacy applications and deploy them to Amazon ECS using the Fargate launch type. Define a task for each workload, and use an Application Load Balancer to route traffic across multiple Fargate tasks running in separate Availability Zones
- **(C)** Create Amazon Machine Images (AMIs) for each legacy workload. Use the AMIs to launch Auto Scaling groups with a minimum and maximum capacity of 1 EC2 instance. Place an Application Load Balancer (ALB) in front of the Auto Scaling group to provide routing and health check-based failover.
- **(D)** Generate an Amazon Machine Image (AMI) for each legacy server. Launch two EC2 instances from this AMI, placing one instance in each of two different Availability Zones. Set up a Network Load Balancer (NLB) to route traffic to the instances and to monitor instance health for automatic traffic redirection in case of failure `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Generate an Amazon Machine Image (AMI) for each legacy server. Launch two EC2 instances from this AMI, placing one instance in each of two different Availability Zones. Set up a Network Load Balancer (NLB) to route traffic to the instances and to monitor instance health for automatic traffic redirection in case of failure

This option is correct as it recommends creating an Amazon Machine Image (AMI) of each legacy application server and launching two EC2 instances from that AMI, each in a different Availability Zone. This setup ensures high availability and fault tolerance by distributing the workload across multiple fault-isolated zones. A Network Load Balancer (NLB) is configured to route incoming traffic to the healthy instances based on real-time health checks, providing seamless failover in case one instance becomes unavailable. This solution is ideal for legacy applications that cannot be re-architected, and it complies with the requirement to run on EC2 while minimizing disruption and ensuring resiliency in a cost-effective and operationally efficient manner.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create Amazon Machine Images (AMIs) for each legacy workload. Use the AMIs to launch Auto Scaling groups with a minimum and maximum capacity of 1 EC2 instance. Place an Application Load Balancer (ALB) in front of the Auto Scaling group to provide routing and health check-based failover.**:
  This option is incorrect because it configures only one EC2 instance in the Auto Scaling group, which does not provide multi-AZ fault tolerance. If the Availability Zone fails, the application becomes unavailable, violating the requirement for high availability.

- **Use AWS Backup to schedule hourly backups of each EC2 instance to Amazon S3 in a separate Availability Zone. Create a recovery plan that includes manual restoration of instances from backup in the event of a failure**:
  While this solution offers point-in-time recovery, it does not provide fault tolerance or high availability. Restoration from backup is a manual and time-consuming process that can lead to significant downtime — violating the requirement for reliable, resilient operation.

- **Containerize the legacy applications and deploy them to Amazon ECS using the Fargate launch type. Define a task for each workload, and use an Application Load Balancer to route traffic across multiple Fargate tasks running in separate Availability Zones**:
  This option proposes containerizing the legacy applications and running them on ECS with the Fargate launch type, which is a serverless compute engine for containers. However, the question explicitly states that the legacy applications must run on EC2 instances and cannot be modified. Fargate requires applications to be containerized, which involves re-architecting or packaging the workloads into Docker containers — a process not feasible in this case due to application constraints. Furthermore, Fargate does not provide direct control over EC2 instances, which violates the architectural requirement. This makes the option technically inappropriate for the scenario.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- 🌐 [AWS Docs: autoscaling - what is amazon ec2 auto scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- 🌐 [AWS Docs: AmazonECS - AWS_Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html)

</details>

---

<div id="question-29"></div>

### Question 29: Highly Available Multi-AZ NAT Gateway Architecture for Private Subnets
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A healthcare company runs a fleet of Amazon EC2 instances in two private subnets (named PR1 and PR2) across two Availability Zones (AZs) named A1 and A2. The Amazon EC2 instances need access to the internet for operating system patch management and third-party software maintenance. To facilitate this, the engineering team at the company wants to set up two Network Address Translation gateways (NAT gateways) in a highly available configuration.

Which of the following options would you suggest?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a total of one NAT gateway. NAT gateway N1 should be set up in public subnet PU1 in any of the Availability Zones A1 or A2
- **(B)** Set up a total of two NAT gateways. Both NAT gateways N1 and N2 should be set up in a single public subnet PU1 in any of the Availability Zones A1 or A2
- **(C)** Set up a total of two NAT gateways. NAT gateway N1 should be set up in public subnet PU1 in Availability Zone A1. NAT gateway N2 should be set up in public subnet PU2 in Availability Zone A2 `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Set up a total of two NAT gateways. NAT gateway N1 should be set up in private subnet PR1 in Availability Zone A1. NAT gateway N2 should be set up in private subnet PR2 in Availability Zone A2

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up a total of two NAT gateways. NAT gateway N1 should be set up in public subnet PU1 in Availability Zone A1. NAT gateway N2 should be set up in public subnet PU2 in Availability Zone A2

A NAT gateway is a Network Address Translation (NAT) service. You can use a NAT gateway so that instances in a private subnet can connect to services outside your VPC but external services cannot initiate a connection with those instances.

For the given use case, the Amazon EC2 instances in the private subnets can connect to the internet through public NAT gateways in their respective Availability Zones (AZ). You should create public NAT gateway in the public subnet of each AZ and must associate an elastic IP address with the NAT gateway at creation. Then, you can route traffic from the NAT gateway to the internet gateway for the VPC.

> 🔗 **Tài liệu tham khảo trực quan**: [If you have resources in multiple Availability Zones and they share one NAT gateway, and if the NAT gateway’s Availability Zone is down, resources in the other Availability Zones lose internet access. To create a highly available or an Availability Zone independent architecture, create a NAT gateway in each Availability Zone and configure your routing to ensure that resources use the NAT gateway in the same Availability Zone.](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up a total of two NAT gateways. NAT gateway N1 should be set up in private subnet PR1 in Availability Zone A1. NAT gateway N2 should be set up in private subnet PR2 in Availability Zone A2**:
  For the Amazon EC2 instances in the private subnet, you can facilitate outbound internet connectivity in a highly available configuration by creating a public NAT gateway in the public subnet of each AZ. You cannot create NAT gateways in the private subnet for the given use case.

- **Set up a total of two NAT gateways. Both NAT gateways N1 and N2 should be set up in a single public subnet PU1 in any of the Availability Zones A1 or A2**:
  For the Amazon EC2 instances in the private subnet, you can facilitate outbound internet connectivity in a highly available configuration by creating a public NAT gateway in the public subnet of each AZ. You cannot create both NAT gateways in a single public subnet, as this configuration would not be highly available.

- **Set up a total of one NAT gateway. NAT gateway N1 should be set up in public subnet PU1 in any of the Availability Zones A1 or A2**:
  For the Amazon EC2 instances in the private subnet, you can facilitate outbound internet connectivity in a highly available configuration by creating a public NAT gateway in the public subnet of each AZ. You cannot create a single NAT gateway, as this configuration would not be highly available.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc nat gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

</details>

---

<div id="question-30"></div>

### Question 30: Minimizing Maintenance Downtime in Amazon RDS Multi-AZ Failover Strategy
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (E) | **Đáp án đúng**: (A), (E)

#### 📋 Đề bài (Scenario)
The engineering team at a retail company is planning to migrate to AWS Cloud from the on-premises data center. The team is evaluating Amazon Relational Database Service (Amazon RDS) as the database tier for its flagship application. The team has hired you as an AWS Certified Solutions Architect Associate to advise on Amazon RDS Multi-AZ capabilities.

Which of the following would you identify as correct for Amazon RDS Multi-AZ? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon RDS automatically initiates a failover to the standby, in case primary database fails for any reason `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** To enhance read scalability, a Multi-AZ standby instance can be used to serve read requests
- **(C)** For automated backups, I/O activity is suspended on your primary database since backups are not taken from standby database
- **(D)** Updates to your database Instance are asynchronously replicated across the Availability Zone to the standby in order to keep both in sync
- **(E)** Amazon RDS applies operating system updates by performing maintenance on the standby, then promoting the standby to primary and finally performing maintenance on the old primary, which becomes the new standby `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon RDS applies operating system updates by performing maintenance on the standby, then promoting the standby to primary and finally performing maintenance on the old primary, which becomes the new standby

Running a DB instance as a Multi-AZ deployment can further reduce the impact of a maintenance event because Amazon RDS applies operating system updates by following these steps:

Perform maintenance on the standby.

Promote the standby to primary.

Perform maintenance on the old primary, which becomes the new standby.

When you modify the database engine for your DB instance in a Multi-AZ deployment, then Amazon RDS upgrades both the primary and secondary DB instances at the same time. In this case, the database engine for the entire Multi-AZ deployment is shut down during the upgrade.

Amazon RDS automatically initiates a failover to the standby, in case primary database fails for any reason

You also benefit from enhanced database availability when running your DB instance as a Multi-AZ deployment. If an Availability Zone failure or DB instance failure occurs, your availability impact is limited to the time automatic failover takes to complete.

Another implied benefit of running your DB instance as a Multi-AZ deployment is that DB instance failover is automatic and requires no administration. In an Amazon RDS context, this means you are not required to monitor DB instance events and initiate manual DB instance recovery in the event of an Availability Zone failure or DB instance failure.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **For automated backups, I/O activity is suspended on your primary database since backups are not taken from standby database**:
  The availability benefits of Multi-AZ also extend to planned maintenance. For example, with automated backups, I/O activity is no longer suspended on your primary during your preferred backup window, since backups are taken from the standby.

- **To enhance read scalability, a Multi-AZ standby instance can be used to serve read requests**:
  A Multi-AZ standby cannot serve read requests. Multi-AZ deployments are designed to provide enhanced database availability and durability, rather than read scaling benefits. As such, the feature uses synchronous replication between primary and standby. AWS implementation makes sure the primary and the standby are constantly in sync, but precludes using the standby for read or write operations.

- **Updates to your database Instance are asynchronously replicated across the Availability Zone to the standby in order to keep both in sync**:
  When you create your DB instance to run as a Multi-AZ deployment, Amazon RDS automatically provisions and maintains a synchronous “standby” replica in a different Availability Zone. Updates to your DB Instance are synchronously replicated across the Availability Zone to the standby in order to keep both in sync and protect your latest database updates against DB instance failure.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/faqs/)

</details>

---

<div id="question-31"></div>

### Question 31: Enforcing Regulatory Key Management with S3 Client-Side Encryption (CSE)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company helps its customers legally sign highly confidential contracts. To meet the strong industry requirements, the company must ensure that the signed contracts are encrypted using the company's proprietary algorithm. The company is now migrating to AWS Cloud using Amazon Simple Storage Service (Amazon S3) and would like you, the solution architect, to advise them on the encryption scheme to adopt.

What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Server-side encryption with Amazon S3 managed keys (SSE-S3)
- **(B)** Client Side Encryption `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Server-side encryption with customer-provided keys (SSE-C)
- **(D)** Server-side encryption with AWS KMS keys (SSE-KMS)

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Client Side Encryption

Client-side encryption is the act of encrypting your data locally to help ensure its security in transit and at rest. To encrypt your objects before you send them to Amazon S3, use the Amazon S3 Encryption Client. When your objects are encrypted in this manner, your objects aren't exposed to any third party, including AWS. Amazon S3 receives your objects already encrypted; Amazon S3 does not play a role in encrypting or decrypting your objects. You can use both the Amazon S3 Encryption Client and server-side encryption to encrypt your data. When you send encrypted objects to Amazon S3, Amazon S3 doesn't recognize the objects as being encrypted, it only detects typical objects.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Server-side encryption with AWS KMS keys (SSE-KMS)**:
  AWS Key Management Service (AWS KMS) is a service that combines secure, highly available hardware and software to provide a key management system scaled for the cloud. When you use server-side encryption with AWS KMS (SSE-KMS), you can specify a customer-managed CMK that you have already created. SSE-KMS provides you with an audit trail that shows when your CMK was used and by whom.

- **Server-side encryption with Amazon S3 managed keys (SSE-S3)**:
  When you use Server-Side Encryption with Amazon S3-Managed Keys (SSE-S3), each object is encrypted with a unique key.

- **Server-side encryption with customer-provided keys (SSE-C)**:
  With Server-Side Encryption with Customer-Provided Keys (SSE-C), you manage the encryption keys and Amazon S3 manages the encryption, as it writes to disks, and decryption when you access your objects.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - UsingKMSEncryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html)
- 🌐 [AWS Docs: AmazonS3 - UsingClientSideEncryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html)
- 🌐 [AWS Docs: AmazonS3 - serv side encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html)

</details>

---

<div id="question-32"></div>

### Question 32: Cost-Effective On-Premises Backup Archiving with Amazon EFS Infrequent Access
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A big data analytics company is looking to archive the on-premises data into a POSIX compliant file storage system on AWS Cloud. The archived data would be accessed for just about a week in a year.

As a solutions architect, which of the following AWS services would you recommend as the MOST cost-optimal solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon EFS Standard
- **(B)** Amazon S3 Standard-IA
- **(C)** Amazon S3 Standard
- **(D)** Amazon EFS Infrequent Access `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EFS Infrequent Access

Amazon Elastic File System (Amazon EFS) provides a simple, scalable, fully managed, elastic, NFS file system for use with AWS Cloud services and on-premises resources. Amazon EFS Infrequent Access (EFS IA) is a storage class that provides price/performance that is cost-optimized for files not accessed every day, with storage prices up to 92% lower compared to Amazon EFS Standard. The EFS IA storage class costs only $0.025/GB-month. To get started with EFS IA, simply enable EFS Lifecycle Management for your file system by selecting a lifecycle policy that matches your needs.

> 🔗 **Tài liệu tham khảo trực quan**: [How Amazon EFS Infrequent Access Works:](https://aws.amazon.com/efs/features/infrequent-access/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon EFS Standard**:
  Amazon EFS Infrequent Access is more cost-effective than EFS Standard for the given use-case, therefore this option is incorrect.

- Amazon S3 Standard

- Amazon S3 Standard-IA

- Both these options are object-based storage, whereas the given use-case requires a POSIX compliant file storage solution. Hence these two options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: efs](https://aws.amazon.com/efs/features/infrequent-access/)

</details>

---

<div id="question-33"></div>

### Question 33: Microsecond Read Caching for High-Throughput DynamoDB with DAX
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E) | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
A company uses Amazon DynamoDB as a data store for various kinds of customer data, such as user profiles, user events, clicks, and visited links. Some of these use-cases require a high request rate (millions of requests per second), low predictable latency, and reliability. The company now wants to add a caching layer to support high read volumes.

As a solutions architect, which of the following AWS services would you recommend as a caching layer for this use-case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon Relational Database Service (Amazon RDS)
- **(B)** Amazon Redshift
- **(C)** Amazon DynamoDB Accelerator (DAX) `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Amazon OpenSearch Service
- **(E)** Amazon ElastiCache `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon DynamoDB Accelerator (DAX)

Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache for DynamoDB that delivers up to a 10x performance improvement – from milliseconds to microseconds – even at millions of requests per second. DAX does all the heavy lifting required to add in-memory acceleration to your DynamoDB tables, without requiring developers to manage cache invalidation, data population, or cluster management. Therefore, this is a correct option.

> 🔗 **Tài liệu tham khảo trực quan**: [DAX Overview:](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.concepts.html)
Amazon ElastiCache

Amazon ElastiCache for Memcached is an ideal front-end for data stores like Amazon RDS or Amazon DynamoDB, providing a high-performance middle tier for applications with extremely high request rates and/or low latency requirements. Therefore, this is also a correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon Relational Database Service (Amazon RDS)**:
  Amazon Relational Database Service (Amazon RDS) makes it easy to set up, operate, and scale a relational database in the cloud. It provides cost-efficient and resizable capacity while automating time-consuming administration tasks such as hardware provisioning, database setup, patching, and backups. Amazon RDS cannot be used as a caching layer for Amazon DynamoDB.

- **Amazon OpenSearch Service**:
  Amazon OpenSearch Service is a managed service that makes it easy for you to perform interactive log analytics, real-time application monitoring, website search, and more. OpenSearch is an open source, distributed search and analytics suite derived from Elasticsearch. It cannot be used as a caching layer for Amazon DynamoDB.

- **Amazon Redshift**:
  Amazon Redshift is a fully-managed petabyte-scale cloud-based data warehouse product designed for large scale data set storage and analysis. It cannot be used as a caching layer for Amazon DynamoDB.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: dynamodb](https://aws.amazon.com/dynamodb/dax/)
- 🌐 [AWS Service Overview: elasticache](https://aws.amazon.com/elasticache/faqs/)

</details>

---

<div id="question-34"></div>

### Question 34: Hardware Isolation and Host-Level Visibility Compliance with Dedicated Hosts
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial services company is looking to move its on-premises IT infrastructure to AWS Cloud. The company has multiple long-term server bound licenses across the application stack and the CTO wants to continue to utilize those licenses while moving to AWS.

As a solutions architect, which of the following would you recommend as the MOST cost-effective solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EC2 dedicated hosts `[Đáp án đúng ✅]`
- **(B)** Use Amazon EC2 dedicated instances `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Use Amazon EC2 reserved instances (RI)
- **(D)** Use Amazon EC2 on-demand instances

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon EC2 dedicated hosts

You can use Dedicated Hosts to launch Amazon EC2 instances on physical servers that are dedicated for your use. Dedicated Hosts give you additional visibility and control over how instances are placed on a physical server, and you can reliably use the same physical server over time. As a result, Dedicated Hosts enable you to use your existing server-bound software licenses like Windows Server and address corporate compliance and regulatory requirements.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EC2 dedicated instances**:
  Dedicated instances are Amazon EC2 instances that run in a VPC on hardware that's dedicated to a single customer. Your dedicated instances are physically isolated at the host hardware level from instances that belong to other AWS accounts. Dedicated instances may share hardware with other instances from the same AWS account that are not dedicated instances. Dedicated instances cannot be used for existing server-bound software licenses.

- Use Amazon EC2 on-demand instances

- Use Amazon EC2 reserved instances (RI)

- Amazon EC2 presents a virtual computing environment, allowing you to use web service interfaces to launch instances with a variety of operating systems, load them with your custom application environment, manage your network’s access permissions, and run your image using as many or few systems as you desire.

- Amazon EC2 provides the following purchasing options to enable you to optimize your costs based on your needs:

- On-Demand Instances – Pay, by the second, for the instances that you launch.

- Reserved Instances (RI) – Reduce your Amazon EC2 costs by making a commitment to a consistent instance configuration, including instance type and Region, for a term of 1 or 3 years.

- Neither on-demand instances nor reserved instances can be used for existing server-bound software licenses.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: ec2](https://aws.amazon.com/ec2/dedicated-hosts/)
- 🌐 [AWS Service Overview: ec2](https://aws.amazon.com/ec2/dedicated-hosts/faqs/)
- 🌐 [AWS Service Overview: ec2](https://aws.amazon.com/ec2/pricing/dedicated-instances/)

</details>

---

<div id="question-35"></div>

### Question 35: Secure Zero-Cost Private S3 Access Using Gateway VPC Endpoints
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A healthcare analytics firm operates a backend application within a private subnet of its VPC. The application is fronted by an Application Load Balancer (ALB) and accesses Amazon S3 to store medical reports. The VPC includes both a NAT gateway and an internet gateway, but the company's strict compliance policy prohibits any data traffic from traversing the internet. The team must redesign the architecture to comply with the security policy and improve cost-efficiency.

Which solution best satisfies these requirements in the most cost-effective manner?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an S3 interface VPC endpoint and modify the security group to allow access from the application’s private subnet. Route all S3 traffic through the interface endpoint
- **(B)** Modify the S3 bucket policy to allow requests only from the Elastic IP address associated with the NAT gateway
- **(C)** Create a VPC peering connection with another VPC that has direct access to S3. Forward the S3 API requests through the peered VPC using proxy EC2 instances
- **(D)** Create a gateway VPC endpoint for Amazon S3 and update the route table for the private subnet to direct S3 traffic through the endpoint `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a gateway VPC endpoint for Amazon S3 and update the route table for the private subnet to direct S3 traffic through the endpoint

> 🔗 **Tài liệu tham khảo trực quan**: [This solution provides a secure and cost-effective method for private workloads in a VPC to access Amazon S3 without routing traffic over the internet. A gateway VPC endpoint for S3 integrates directly with the VPC route tables, enabling communication between EC2 instances and S3 over the AWS private network. This eliminates the need for a NAT gateway or internet gateway for S3 API calls, aligning with the company's security policy that prohibits internet-based traffic. Moreover, gateway endpoints are free of hourly and per-GB data processing charges, making them more cost-efficient than interface endpoints or NAT-based solutions. This solution offers high scalability, no operational complexity, and strong compliance with security requirements.](https://docs.aws.amazon.com/vpc/latest/privatelink/gateway-endpoints.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
> 🔗 **Tài liệu tham khảo trực quan**: [Create an S3 interface VPC endpoint and modify the security group to allow access from the application’s private subnet. Route all S3 traffic through the interface endpoint - While an interface VPC endpoint (powered by AWS PrivateLink) is valid for many AWS services, it is not the most cost-effective or appropriate choice for accessing Amazon S3. For S3, AWS recommends using a gateway VPC endpoint, which is purpose-built, incurs no hourly data processing charges, and integrates directly with route tables. In contrast, interface endpoints for S3 introduce per-hour and per-GB data processing fees and are more commonly used when you need fine-grained control with security groups, and not for high-volume object storage access. Choosing an interface endpoint here violates both the cost-efficiency and minimal overhead goals of the question.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html#types-of-vpc-endpoints-for-s3)
Modify the S3 bucket policy to allow requests only from the Elastic IP address associated with the NAT gateway - While this restricts access from specific IPs, it still causes S3 API calls to traverse the public internet via the NAT gateway, violating the security policy that prohibits internet-based traffic. Furthermore, it incurs additional NAT gateway data processing costs. This approach may restrict access, but does not solve the core compliance issue.

- **Create a VPC peering connection with another VPC that has direct access to S3. Forward the S3 API requests through the peered VPC using proxy EC2 instances**:
  This approach is overly complex and expensive. VPC peering does not support transitive routing or S3-specific integration. Proxying S3 traffic through EC2 instances introduces unnecessary latency, potential bottlenecks, and violates AWS's best practice of using native integration points like VPC endpoints for accessing S3. Additionally, it involves managing EC2 proxy infrastructure, which increases cost and operational burden.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - gateway endpoints](https://docs.aws.amazon.com/vpc/latest/privatelink/gateway-endpoints.html)
- 🌐 [AWS Docs: AmazonS3 - privatelink interface endpoints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html#types-of-vpc-endpoints-for-s3)
- 🌐 [AWS Docs: vpc - concepts](https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html)

</details>

---

<div id="question-36"></div>

### Question 36: Automating Redshift Historical Snapshot Archiving to S3 Standard-IA
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (E) | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
Your company has created a data warehouse using Amazon Redshift that is used to analyze data from Amazon S3. From the usage pattern, you have detected that after 30 days, the data is rarely queried in Amazon Redshift and it's not "hot data" anymore. You would like to preserve the SQL querying capability on your data and get the queries started immediately. Also, you want to adopt a pricing model that allows you to save the maximum amount of cost on Amazon Redshift.

What do you recommend? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the Amazon Redshift underlying storage to Amazon S3 IA
- **(B)** Analyze the cold data with Amazon Athena `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Move the data to Amazon S3 Glacier Deep Archive after 30 days
- **(D)** Create a smaller Amazon Redshift Cluster with the cold data
- **(E)** Move the data to Amazon S3 Standard IA after 30 days `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Move the data to Amazon S3 Standard IA after 30 days

Amazon S3 Standard-IA is for data that is accessed less frequently but requires rapid access when needed. Amazon S3 Standard-IA offers high durability, high throughput, and low latency of S3 Standard, with a low per GB storage price and per GB retrieval fee. This combination of low cost and high performance makes S3 Standard-IA ideal for long-term storage, backups, and as a data store for disaster recovery files. The minimum storage duration charge is 30 days.

Analyze the cold data with Amazon Athena

Amazon Athena is an interactive query service that makes it easy to analyze data directly in Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to set up or manage, and customers pay only for the queries they run. You can use Amazon Athena to process logs, perform ad-hoc analysis, and run interactive queries.

Moving the data to Amazon S3 glacier will prevent us from being able to query it. Therefore, we should migrate the data to Amazon S3 Standard IA and use Amazon Athena to analyze the cold data.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Migrate the Amazon Redshift underlying storage to Amazon S3 IA**:
  Amazon Redshift is a fully-managed petabyte-scale cloud-based data warehouse product designed for large scale data set storage and analysis. An Amazon Redshift data warehouse is a collection of computing resources called nodes, which are organized into a group called a cluster. Each cluster runs an Amazon Redshift engine and contains one or more databases. An Amazon Redshift cluster consists of nodes. Each cluster has a leader node and one or more compute nodes. The leader node receives queries from client applications, parses the queries, and develops query execution plans. The leader node then coordinates the parallel execution of these plans with the compute nodes and aggregates the intermediate results from these nodes. It then finally returns the results to the client applications.

- Redshift's internal storage does not have "tiers" of storage classes like Amazon S3, so this option is also ruled out.

- **Create a smaller Amazon Redshift Cluster with the cold data**:
  Creating a smaller cluster with the cold data would not decrease the storage cost of Amazon Redshift, which will only increase with time as we keep on creating data. Therefore this option is ruled out.

- **Move the data to Amazon S3 Glacier Deep Archive after 30 days**:
  Amazon S3 Glacier Deep Archive (GDA) is a secure, durable, and extremely low-cost Amazon S3 cloud storage class for data archiving and long-term backup. It is designed to deliver 99.999999999% durability, and provide comprehensive security and compliance capabilities that can help meet even the most stringent regulatory requirements. GDA has a first-byte latency of several hours, so this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: athena](https://aws.amazon.com/athena/)
- 🌐 [AWS Docs: redshift - working with clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)

</details>

---

<div id="question-37"></div>

### Question 37: Postponing New Message Delivery in Amazon SQS Using Delay Queues
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An IT company is using Amazon Simple Queue Service (Amazon SQS) queues for decoupling the various components of application architecture. As the consuming components need additional time to process Amazon Simple Queue Service (Amazon SQS) messages, the company wants to postpone the delivery of new messages to the queue for a few seconds.

As a solutions architect, which of the following solutions would you suggest to the company?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use visibility timeout to postpone the delivery of new messages to the queue for a few seconds
- **(B)** Use dead-letter queues to postpone the delivery of new messages to the queue for a few seconds
- **(C)** Use Amazon SQS FIFO queues to postpone the delivery of new messages to the queue for a few seconds
- **(D)** Use delay queues to postpone the delivery of new messages to the queue for a few seconds `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use delay queues to postpone the delivery of new messages to the queue for a few seconds

Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. Amazon SQS offers two types of message queues. Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery. Amazon SQS FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent.

> 🔗 **Tài liệu tham khảo trực quan**: [Delay queues let you postpone the delivery of new messages to a queue for several seconds, for example, when your consumer application needs additional time to process messages. If you create a delay queue, any messages that you send to the queue remain invisible to consumers for the duration of the delay period. The default (minimum) delay for a queue is 0 seconds. The maximum is 15 minutes.](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-delay-queues.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon SQS FIFO queues to postpone the delivery of new messages to the queue for a few seconds**:
  Amazon SQS FIFO (First-In-First-Out) queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent. You cannot use Amazon SQS FIFO queues to postpone the delivery of new messages to the queue for a few seconds.

- **Use dead-letter queues to postpone the delivery of new messages to the queue for a few seconds**:
  Dead-letter queues can be used by other queues (source queues) as a target for messages that can't be processed (consumed) successfully. Dead-letter queues are useful for debugging your application or messaging system because they let you isolate problematic messages to determine why their processing doesn't succeed. You cannot use dead-letter queues to postpone the delivery of new messages to the queue for a few seconds.

- **Use visibility timeout to postpone the delivery of new messages to the queue for a few seconds**:
  Visibility timeout is a period during which Amazon SQS prevents other consumers from receiving and processing a given message. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. You cannot use visibility timeout to postpone the delivery of new messages to the queue for a few seconds.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSSimpleQueueService - sqs delay queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-delay-queues.html)

</details>

---

<div id="question-38"></div>

### Question 38: Centralized Multi-Account Root User Aliases & Alternate Notification Contacts
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A global enterprise has onboarded multiple departments into isolated AWS accounts that are part of a unified AWS Organizations structure. Recently, a critical operational alert was missed because it was delivered to the root user’s email address of an account, which is only monitored intermittently. The enterprise wants to redesign its notification handling process to ensure that future communications - categorized by billing, security, and operational relevance - are received promptly by the appropriate teams. The solution should align with AWS security best practices and offer centralized oversight without depending on individual users.

Which solution meets these requirements in the most secure and scalable way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Change each AWS account’s root email to a unique departmental email list and configure IAM notification settings to send alerts based on service type. Do not use AWS alternate contacts since notifications are already routed by service in the IAM console
- **(B)** Assign each AWS account’s root user email to a single designated member of the respective department (e.g., security lead or billing analyst). Encourage these individuals to monitor the email accounts regularly. Also configure alternate contacts with the same individual email addresses
- **(C)** Configure each AWS account’s root user to use an alias that redirects messages to a centralized mailbox monitored by platform administrators. Then assign alternate contacts for each account using company-managed distribution lists for billing, security, and operations to handle service-specific notifications `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Set up a centralized email forwarding service with rules that inspect notification content and forward emails to the appropriate team based on keywords such as “billing,” “security,” or “operations.” Keep the current root email addresses as they are, and rely on this service to triage alerts

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Configure each AWS account’s root user to use an alias that redirects messages to a centralized mailbox monitored by platform administrators. Then assign alternate contacts for each account using company-managed distribution lists for billing, security, and operations to handle service-specific notifications

This option outlines a secure and scalable approach by combining two AWS best practices: centralized root email aliasing and the use of alternate contacts. By configuring each AWS account’s root user email as an alias that redirects to a centrally monitored mailbox, the organization maintains control over critical notifications without relying on individual users. This ensures availability, continuity, and a clear audit trail. Simultaneously, assigning AWS alternate contacts with team-based distribution lists for billing, security, and operations enables role-specific alerts to reach the appropriate teams directly. This approach prevents alert fatigue, improves response time, and aligns with AWS-recommended practices for separating duties and minimizing root user reliance. Overall, it ensures that notifications are handled efficiently, securely, and in a way that scales with organizational growth.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Change each AWS account’s root email to a unique departmental email list and configure IAM notification settings to send alerts based on service type. Do not use AWS alternate contacts since notifications are already routed by service in the IAM console**:
  While routing messages through departmental distribution lists may appear beneficial, AWS does not allow IAM settings to route operational alerts by service type. Critical AWS notifications such as billing suspension alerts and security findings are sent only to the root email or the alternate contacts, not through IAM configurations. Moreover, ignoring the alternate contacts feature misses the opportunity to use AWS-native role-based routing.

- **Set up a centralized email forwarding service with rules that inspect notification content and forward emails to the appropriate team based on keywords such as “billing,” “security,” or “operations.” Keep the current root email addresses as they are, and rely on this service to triage alerts**:
  This option depends on keyword-based filtering and a custom forwarding solution, which introduces operational overhead, potential delays, and risk of misrouting critical notifications. It also retains reliance on root email addresses without formally assigning alternate contacts in AWS, meaning AWS service notifications (e.g., billing alerts) may still go only to the root email. This violates the principle of using AWS-native contact configuration mechanisms for high-assurance routing.

- **Assign each AWS account’s root user email to a single designated member of the respective department (e.g., security lead or billing analyst). Encourage these individuals to monitor the email accounts regularly. Also configure alternate contacts with the same individual email addresses**:
  This solution introduces significant risk by binding critical communications to individuals. It creates a single point of failure—if the individual is unavailable, on leave, or leaves the company, essential alerts might be missed. It also makes auditing and account recovery more difficult. This setup does not scale well and violates security best practices for root account usage, which should be strictly limited.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: prescriptive-guidance - acct 01](https://docs.aws.amazon.com/prescriptive-guidance/latest/aws-startup-security-baseline/acct-01.html)
- 🌐 [AWS Docs: organizations - orgs_best practices](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_best-practices.html)
- 🌐 [AWS Docs: accounts - accounts welcome](https://docs.aws.amazon.com/accounts/latest/reference/accounts-welcome.html)

</details>

---

<div id="question-39"></div>

### Question 39: Fine-Grained S3 Course Uploads via Cognito Identity Pools & Gateway Endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B), (D) | **Đáp án đúng**: (A), (B)

#### 📋 Đề bài (Scenario)
An edtech startup runs its course-management platform inside a private subnet in a VPC on AWS. The application uses Amazon Cognito user pools for authentication. Now, the team wants to extend the application so that authenticated users can upload and access personal course-related documents in Amazon S3. The solution must ensure scalable, fine-grained and secure access control to the S3 bucket and maintain private network architecture for the application.

Which combination of steps will enable secure S3 integration for this workload? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon S3 VPC endpoint in the VPC where the application is hosted to enable private connectivity between the application and S3 `[Đáp án đúng ✅]`
- **(B)** Create an Amazon Cognito identity pool to allow federated identities. Use it to generate temporary AWS credentials that grant S3 access when users successfully authenticate `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Attach an S3 bucket policy that allows access only if requests include a custom HTTP header containing a valid Cognito user ID
- **(D)** Use the existing Amazon Cognito user pool to directly grant users permission to upload and download objects in the S3 bucket `[Lựa chọn của bạn - Không chính xác ❌]`
- **(E)** Configure an AWS Lambda function that proxies user uploads to S3. Invoke the Lambda function after each user login to isolate the S3 access

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an Amazon Cognito identity pool to allow federated identities. Use it to generate temporary AWS credentials that grant S3 access when users successfully authenticate

> 🔗 **Tài liệu tham khảo trực quan**: [This option represents the standard and secure pattern for enabling Amazon Cognito–authenticated users to access AWS services like Amazon S3. While the Cognito user pool handles user authentication (e.g., verifying usernames and passwords), it cannot itself issue AWS credentials for service access. For this, a Cognito identity pool is required. The identity pool integrates with the user pool and generates temporary AWS credentials. These credentials can then be scoped using IAM roles and policies to allow secure, fine-grained access to S3—such as granting users permission to upload documents only to specific S3 prefixes based on their identity. This approach adheres to the principle of least privilege and avoids long-lived credentials.](https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html)
Create an Amazon S3 VPC endpoint in the VPC where the application is hosted to enable private connectivity between the application and S3

The application is running in a private subnet, which lacks internet access. Without internet access or a NAT gateway, the application cannot reach public AWS services like Amazon S3 unless an alternative route is provided. A VPC Gateway Endpoint for S3 enables private, secure communication between the VPC and S3 over the AWS backbone, without requiring internet access or exposing traffic to the public internet. This also ensures lower latency and enhances security by avoiding traversal through external networks. It is a highly recommended practice when workloads in private subnets need access to S3, especially in regulated or production environments.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
> 🔗 **Tài liệu tham khảo trực quan**: [Use the existing Amazon Cognito user pool to directly grant users permission to upload and download objects in the S3 bucket - Amazon Cognito user pools provide authentication, not authorization for AWS resources like S3. You cannot directly assign S3 permissions using user pools alone. You must integrate the user pool with an identity pool, which generates temporary AWS credentials mapped to IAM roles with S3 access. This option omits a critical step and would not allow secure access to S3.](https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html)
Configure an AWS Lambda function that proxies user uploads to S3. Invoke the Lambda function after each user login to isolate the S3 access - While technically possible, using a Lambda function as a proxy for every upload or download introduces unnecessary latency, cost, and operational complexity. It also doesn't leverage native Cognito + IAM integration for scalable, fine-grained access control. This pattern may be used in tightly controlled environments but is not ideal or scalable for typical user-based S3 access patterns.

- **Attach an S3 bucket policy that allows access only if requests include a custom HTTP header containing a valid Cognito user ID**:
  While adding conditional logic to S3 bucket policies using request headers might sound like a custom access control strategy, Amazon S3 bucket policies do not natively support evaluating Cognito user IDs via custom headers for authorization. S3 supports conditions based on IAM policy context keys, such as aws:userid or aws:username, but those must be passed via authenticated requests with IAM credentials, not manually crafted headers. Trusting user-provided headers introduces security risks and does not securely validate identity. Proper integration relies on IAM roles tied to Cognito identity pools, not custom header logic.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: cognito - what is amazon cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html)
- 🌐 [AWS Docs: AmazonS3 - amazon s3 policy keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/amazon-s3-policy-keys.html)
- 🌐 [AWS Docs: service-authorization - list_amazons3](https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazons3.html#amazons3-policy-keys)
- 🌐 [AWS Docs: vpc - vpc endpoints s3](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html)

</details>

---

<div id="question-40"></div>

### Question 40: High Availability Architecture for Multi-Tier Web App: ALB, ASG & Multi-AZ RDS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A startup wants to create a highly available architecture for its multi-tier application. Currently, the startup manages a single Amazon EC2 instance along with a single Amazon RDS MySQL DB instance. The startup has hired you as an AWS Certified Solutions Architect - Associate to build a solution that meets these requirements while minimizing the underlying infrastructure maintenance effort.

What will you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances in a single Availability Zone. Configure an Application Load Balancer having a target group of these Amazon EC2 instances. Set up Amazon RDS MySQL DB in a multi-AZ configuration
- **(B)** Create an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances across two Availability Zones. Configure an Application Load Balancer having a target group of these Amazon EC2 instances. Set up a read replica of the Amazon RDS MySQL DB in another Availability Zone
- **(C)** Provision a second Amazon EC2 instance in another Availability Zone. Provision a second Amazon RDS MySQL DB in another Availabililty Zone. Leverage Amazon Route 53 for equal distribution of incoming traffic to the Amazon EC2 instances. Use a custom script to sync data across the two MySQL DBs `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Create an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances across two Availability Zones. Configure an Application Load Balancer having a target group of these Amazon EC2 instances. Set up Amazon RDS MySQL DB in a multi-AZ configuration `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances across two Availability Zones. Configure an Application Load Balancer having a target group of these Amazon EC2 instances. Set up Amazon RDS MySQL DB in a multi-AZ configuration

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon EC2 Auto Scaling is a fully managed service designed to launch or terminate Amazon EC2 instances automatically to help ensure you have the correct number of Amazon EC2 instances available to handle the load for your application.](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
> 🔗 **Tài liệu tham khảo trực quan**: [Application Load Balancer automatically distributes your incoming traffic across multiple targets, such as Amazon EC2 instances, containers, and IP addresses, in one or more Availability Zones. It monitors the health of its registered targets, and routes traffic only to the healthy targets.](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
> 🔗 **Tài liệu tham khảo trực quan**: [In a multi-AZ deployment, Amazon RDS automatically provisions and maintains a synchronous “standby” replica in a different Availability Zone. Updates to your DB Instance are synchronously replicated across Availability Zones to the standby to keep both in sync and protect your latest database updates against DB instance failure.](https://aws.amazon.com/rds/features/multi-az/)
To create a highly available architecture for the given use case, you need to set up an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances across two Availability Zones and then point the Application Load Balancer to the target group having the Amazon EC2 instances.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances across two Availability Zones. Configure an Application Load Balancer having a target group of these Amazon EC2 instances. Set up a read replica of the Amazon RDS MySQL DB in another Availability Zone**:
  A read replica cannot be used to enhance the availability of an Amazon RDS MySQL DB. You must use the multi-AZ configuration of Amazon RDS MySQL for this use case.

- **Create an Auto-Scaling group with a desired capacity of a total of two Amazon EC2 instances in a single Availability Zone. Configure an Application Load Balancer having a target group of these Amazon EC2 instances. Set up Amazon RDS MySQL DB in a multi-AZ configuration**:
  Having the Amazon EC2 instances in a single Availability Zone will not create a highly available solution. In the case of an outage for the entire Availability Zone, the Amazon EC2 instances would be unreachable. Hence this option is incorrect.

- **Provision a second Amazon EC2 instance in another Availability Zone. Provision a second Amazon RDS MySQL DB in another Availabililty Zone. Leverage Amazon Route 53 for equal distribution of incoming traffic to the Amazon EC2 instances. Use a custom script to sync data across the two MySQL DBs**:
  This option has been added as a distractor. It requires significant monitoring and development effort to keep the Amazon EC2 instances highly available as well as keep the MySQL DBs in sync.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - what is amazon ec2 auto scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/multi-az/)

</details>

---

<div id="question-41"></div>

### Question 41: Dynamic Queue-Based Scaling for SQS Workers Using Target Tracking Policy
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A retail startup runs a high-traffic order processing system on AWS. The architecture includes a frontend web tier using EC2 instances behind an Application Load Balancer, a processing tier powered by EC2 instances, and a data layer using Amazon DynamoDB. The frontend and processing tiers are decoupled using Amazon SQS. Recently, the engineering team observed that during unpredictable traffic surges, order processing slows down significantly, SQS queue depth increases rapidly, and the processing-tier EC2 instances hit 100% CPU usage.

Which solution will help improve the application’s responsiveness and scalability during peak load periods?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an EC2 Auto Scaling group with a target tracking policy to automatically scale the processing tier. Configure the policy to monitor the ApproximateNumberOfMessages in the SQS queue `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon EventBridge to schedule batch processing jobs for the queue. Configure the event rule to invoke EC2-based workers every 10 minutes to process messages in the SQS queue
- **(C)** Add Amazon Kinesis Data Streams to buffer order events from the web tier. Configure the processing tier to consume records from the stream and use enhanced fan-out for high throughput
- **(D)** Use scheduled Auto Scaling for the processing tier based on past peak periods. Use average CPU utilization to define scaling thresholds

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use an EC2 Auto Scaling group with a target tracking policy to automatically scale the processing tier. Configure the policy to monitor the ApproximateNumberOfMessages in the SQS queue

This option directly addresses the root cause of the performance issue - CPU saturation in the processing tier and message backlog in the SQS queue - while aligning with best practices for decoupled architectures on AWS. In this design, Amazon EC2 Auto Scaling uses a target tracking policy to dynamically adjust the number of EC2 instances based on the ApproximateNumberOfMessages metric from the SQS queue. As the queue depth grows due to surging customer activity, Auto Scaling automatically launches additional worker instances to handle the increased load, ensuring that the backlog is processed quickly and efficiently. This approach is ideal for workloads with unpredictable or bursty traffic patterns, and it removes the need for manual intervention or fixed scaling schedules. It ensures better responsiveness, system resilience, and cost efficiency.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EventBridge to schedule batch processing jobs for the queue. Configure the event rule to invoke EC2-based workers every 10 minutes to process messages in the SQS queue**:
  While Amazon EventBridge can trigger actions on a schedule, this design is incompatible with real-time, high-volume message processing requirements. Using a fixed interval batch model (e.g., every 10 minutes) delays response time and fails to handle variable or sudden traffic spikes effectively. SQS is built for near-real-time decoupling, and EC2 workers should be automatically scaled based on queue depth, not on static time-based triggers. This method would cause inconsistent latency and accumulation of unprocessed messages under load.

- **Add Amazon Kinesis Data Streams to buffer order events from the web tier. Configure the processing tier to consume records from the stream and use enhanced fan-out for high throughput**:
  Although Amazon Kinesis Data Streams is a powerful solution for high-throughput event ingestion, this approach changes the core architecture and introduces unnecessary complexity for a system that already uses Amazon SQS for decoupling. The challenge in the scenario is not the ingestion layer but the under-provisioned EC2 processing tier that fails to scale during unpredictable peak traffic. Migrating to Kinesis requires new consumers, partitioning logic, and data retention management, which is not justified when the existing queue-based design can be easily scaled using Auto Scaling policies tied to the SQS queue depth. Therefore, switching to Kinesis adds operational burden without solving the root cause: CPU bottlenecks in the processing tier.

- **Use scheduled Auto Scaling for the processing tier based on past peak periods. Use average CPU utilization to define scaling thresholds**:
  Scheduled scaling assumes that peak times are predictable, but the scenario explicitly states they are variable and unpredictable. While CPU utilization is a valid metric, it lags behind and only reflects stress once it occurs, not proactively. Also, scheduled scaling doesn’t adapt in real-time, making it ineffective for responding to dynamic queue growth.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - as using sqs queue](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)
- 🌐 [AWS Docs: autoscaling - ec2 auto scaling scheduled scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html)
- 🌐 [AWS Docs: eventbridge - eb what is](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html)
- 🌐 [AWS Docs: streams - introduction](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)

</details>

---

<div id="question-42"></div>

### Question 42: Restricting Direct S3 Bucket Access by Enforcing CloudFront Origin Access Identity (OAI)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
As a Solutions Architect, you would like to completely secure the communications between your Amazon CloudFront distribution and your Amazon S3 bucket which contains the static files for your website. Users should only be able to access the Amazon S3 bucket through Amazon CloudFront and not directly.

What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Update the Amazon S3 bucket security groups to only allow traffic from the Amazon CloudFront security group
- **(B)** Create a bucket policy to only authorize the IAM role attached to the Amazon CloudFront distribution
- **(C)** Create an origin access identity (OAI) and update the Amazon S3 Bucket Policy `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Make the Amazon S3 bucket public

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an origin access identity (OAI) and update the Amazon S3 Bucket Policy

To restrict access to content that you serve from Amazon S3 buckets, you need to follow the following steps:

Create a special Amazon CloudFront user called an origin access identity (OAI) and associate it with your distribution.
Configure your Amazon S3 bucket permissions so that Amazon CloudFront can use the OAI to access the files in your bucket and serve them to your users. Make sure that users can’t use a direct URL to the Amazon S3 bucket to access a file there.
After you take these steps, users can only access your files through Amazon CloudFront, not directly from the Amazon S3 bucket.

In general, if you’re using an Amazon S3 bucket as the origin for a Amazon CloudFront distribution, you can either allow everyone to have access to the files there, or you can restrict access. If you restrict access by using, for example, Amazon CloudFront signed URLs or signed cookies, you also won’t want people to be able to view files by simply using the direct Amazon S3 URL for the file. Instead, you want them to only access the files by using the Amazon CloudFront URL, so your content remains protected.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Update the Amazon S3 bucket security groups to only allow traffic from the Amazon CloudFront security group**:
  Amazon S3 buckets don't have security groups, hence this is an incorrect option.

- **Make the Amazon S3 bucket public**:
  If the Amazon S3 bucket is made public, it can be accessed by anyone directly. This is not the requirement.

- **Create a bucket policy to only authorize the IAM role attached to the Amazon CloudFront distribution**:
  You cannot attach IAM roles to the Amazon CloudFront distribution. Here you need to use an OAI.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudFront - private content restricting access to s3](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)

</details>

---

<div id="question-43"></div>

### Question 43: Least-Privilege Role Management with AWS IAM Identity Center Permission Sets
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A healthcare startup is deploying an AWS-based analytics platform that processes sensitive patient records. The application backend uses Amazon RDS for structured data and Amazon S3 for storing medical files. S3 Event Notifications trigger AWS Lambda for real-time data classification and alerting. The startup uses AWS IAM Identity Center to manage federated access from their enterprise directory. Development, operations, and compliance teams require granular and secure access to RDS and S3 resources, based strictly on their job roles. The company must follow the principle of least privilege while minimizing manual administrative work.

Which solution should the company implement to meet these requirements with the least operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS IAM Identity Center integrated with the organization’s directory. Define permission sets with least-privilege policies for Amazon RDS and Amazon S3. Assign users to groups based on their team roles and map those groups to the appropriate permission sets `[Đáp án đúng ✅]`
- **(B)** Use AWS Organizations to group team accounts under a single organizational unit (OU). Attach Service Control Policies (SCPs) to the OU that define access boundaries for Amazon RDS and Amazon S3 based on each team’s responsibilities. Assign users to accounts and let SCPs enforce the required access
- **(C)** Create an IAM identity provider that integrates with the company's IdP (e.g., Azure AD or Okta). Use SAML federation to grant access to IAM roles that are manually assigned to each user. Create and maintain inline IAM policies for each role to access RDS and S3
- **(D)** Create individual IAM users for each team member. Attach role-based IAM policies granting permissions to RDS and S3 based on team roles. Use AWS IAM Access Analyzer to monitor for unused permissions and rotate access keys periodically `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS IAM Identity Center integrated with the organization’s directory. Define permission sets with least-privilege policies for Amazon RDS and Amazon S3. Assign users to groups based on their team roles and map those groups to the appropriate permission sets

> 🔗 **Tài liệu tham khảo trực quan**: [This solution provides a scalable and centralized way to manage user access by leveraging AWS IAM Identity Center (formerly AWS SSO), which integrates directly with external identity providers (e.g., Active Directory). By defining granular permission sets, administrators can assign precise AWS resource access (e.g., RDS read-only, S3 write) to each team according to their job functions, ensuring compliance with the principle of least privilege. Group memberships in the identity source can be mapped directly to those permission sets, allowing seamless onboarding, offboarding, and role changes without managing individual IAM users or credentials. This minimizes operational overhead while providing centralized visibility, governance, and security over access permissions.](https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an IAM identity provider that integrates with the company's IdP (e.g., Azure AD or Okta). Use SAML federation to grant access to IAM roles that are manually assigned to each user. Create and maintain inline IAM policies for each role to access RDS and S3**:
  Although SAML-based federation provides a secure way to authenticate users, it lacks the automation and manageability offered by IAM Identity Center. Managing inline policies for individual roles increases administrative burden and does not scale well. This solution partially overlaps with IAM Identity Center’s capabilities but delivers less efficiency and more manual effort.

- **Create individual IAM users for each team member. Attach role-based IAM policies granting permissions to RDS and S3 based on team roles. Use AWS IAM Access Analyzer to monitor for unused permissions and rotate access keys periodically**:
  While this setup enforces the principle of least privilege at the user level, it introduces high operational overhead: individual IAM users must be managed, keys rotated, and policies updated manually. Even with IAM Access Analyzer, this model does not scale well for larger teams or frequent access changes, and does not utilize IAM Identity Center, which is already part of the organization’s identity strategy.

- **Use AWS Organizations to group team accounts under a single organizational unit (OU). Attach Service Control Policies (SCPs) to the OU that define access boundaries for Amazon RDS and Amazon S3 based on each team’s responsibilities. Assign users to accounts and let SCPs enforce the required access**:
  While SCPs are useful for setting permission guardrails at the organizational level, they do not grant permissions themselves — they only define what actions are allowed or denied for IAM identities within an account. To actually grant access to Amazon RDS and Amazon S3, you still need IAM roles, users, or permission sets configured within each account. Relying solely on SCPs to enforce access violates the principle of least privilege because it provides no actual identity-level permission management, and would lead to incomplete or nonfunctional access control unless paired with proper IAM configurations. This also introduces unnecessary operational overhead and does not leverage AWS IAM Identity Center, which is already in use.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: singlesignon - getting started](https://docs.aws.amazon.com/singlesignon/latest/userguide/getting-started.html)
- 🌐 [AWS Docs: singlesignon - permissionsetsconcept](https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html)
- 🌐 [AWS Docs: IAM - id_roles_providers_saml](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html)
- 🌐 [AWS Docs: organizations - orgs_manage_policies_scps](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)

</details>

---

<div id="question-44"></div>

### Question 44: High Availability Single-Instance Monolith Auto-Recovery (ASG Min=1, Max=1 + EIP)
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B), (E), (F) | **Đáp án đúng**: (C), (D), (E)

#### 📋 Đề bài (Scenario)
You are deploying a critical monolith application that must be deployed on a single web server, as it hasn't been created to work in distributed mode. Still, you want to make sure your setup can automatically recover from the failure of an Availability Zone (AZ).

Which of the following options should be combined to form the MOST cost-efficient solution? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Application Load Balancer and a target group with the instance(s) of the Auto Scaling Group
- **(B)** Create a Spot Fleet request `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Create an elastic IP address (EIP) and use the Amazon EC2 user-data script to attach it `[Đáp án đúng ✅]`
- **(D)** Create an auto-scaling group that spans across 2 Availability Zones, which min=1, max=1, desired=1 `[Đáp án đúng ✅]`
- **(E)** Assign an Amazon EC2 Instance Role to perform the necessary API calls `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** Create an auto-scaling group that spans across 2 Availability Zones, which min=1, max=2, desired=2 `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an auto-scaling group that spans across 2 Availability Zones, which min=1, max=1, desired=1

Amazon EC2 Auto Scaling helps you ensure that you have the correct number of Amazon EC2 instances available to handle the load for your application. You create collections of EC2 instances, called Auto Scaling groups. You can specify the minimum number of instances in each Auto Scaling group, and Amazon EC2 Auto Scaling ensures that your group never goes below this size.

So we have an Auto Scaling Group with desired=1, across two AZ, so that if an instance goes down, it is automatically recreated in another AZ. So this option is correct.

Create an elastic IP address (EIP) and use the Amazon EC2 user-data script to attach it

Application Load Balancer (ALB) operates at the request level (layer 7), routing traffic to targets – Amazon EC2 instances, containers, IP addresses, and Lambda functions based on the content of the request. Ideal for advanced load balancing of HTTP and HTTPS traffic, Application Load Balancer provides advanced request routing targeted at delivery of modern application architectures, including microservices and container-based applications.

An Elastic IP address is a static IPv4 address designed for dynamic cloud computing. An Elastic IP address is associated with your AWS account. With an Elastic IP address, you can mask the failure of an instance or software by rapidly remapping the address to another instance in your account.

Now, between the ALB and the Elastic IP. If we use an ALB, things will still work, but we will have to pay for the provisioned ALB which sends traffic to only one Amazon EC2 instance. Instead, to minimize costs, we must use an Elastic IP.

Assign an Amazon EC2 Instance Role to perform the necessary API calls

For that Elastic IP to be attached to our Amazon EC2 instance, we must use an EC2 user data script, and our Amazon EC2 instance must have the correct IAM permissions to perform the API call, so we need an Amazon EC2 instance role.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a Spot Fleet request**:
  A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Because Spot Instances enable you to request unused EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly. The hourly price for a Spot Instance is called a Spot price.

- The Spot Fleet selects the Spot Instance pools that meet your needs and launches Spot Instances to meet the target capacity for the fleet. By default, Spot Fleets are set to maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated.

- Spot Fleets requests would not fit our purpose as we are looking at a critical application. Spot instances can be terminated. So this option is incorrect.

- **Create an auto-scaling group that spans across 2 Availability Zones, which min=1, max=2, desired=2**:
  An Auto Scaling Group with desired=2 would create two instances, and this won't work for us as our monolith application is not made to work with two instances as per the given use-case.

- **Create an Application Load Balancer and a target group with the instance(s) of the Auto Scaling Group**:
  If we use an Application Load Balancer (ALB), things will still work, but we will have to pay for the provisioned ALB which sends traffic to only one Amazon EC2 instance. So this option is not correct.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - using spot instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
- 🌐 [AWS Docs: AWSEC2 - elastic ip addresses eip](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)

</details>

---

<div id="question-45"></div>

### Question 45: High-Performance Multi-Instance I/O Workloads with Provisioned IOPS (io2) EBS Multi-Attach
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An application is hosted on multiple Amazon EC2 instances in the same Availability Zone (AZ). The engineering team wants to set up shared data access for these Amazon EC2 instances using Amazon EBS Multi-Attach volumes.

Which Amazon EBS volume type is the correct choice for these Amazon EC2 instances?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provisioned IOPS SSD Amazon EBS volumes `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Throughput Optimized HDD Amazon EBS volumes
- **(C)** Cold HDD Amazon EBS volumes
- **(D)** General-purpose SSD-based Amazon EBS volumes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Provisioned IOPS SSD Amazon EBS volumes

Amazon EBS Multi-Attach enables you to attach a single Provisioned IOPS SSD (io1 or io2) volume to multiple instances that are in the same Availability Zone. You can attach multiple Multi-Attach enabled volumes to an instance or set of instances. Each instance to which the volume is attached has full read and write permission to the shared volume. Multi-Attach makes it easier for you to achieve higher application availability in clustered Linux applications that manage concurrent write operations.

Multi-Attach is supported exclusively on Provisioned IOPS SSD volumes.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **General-purpose SSD-based Amazon EBS volumes**:
  These SSD-backed Amazon EBS volumes provide a balance of price and performance. AWS recommends these volumes for most workloads. These volume types are not supported for Multi-Attach functionality.

- **Throughput Optimized HDD Amazon EBS volumes**:
  These HDD-backed volumes provide a low-cost HDD designed for frequently accessed, throughput-intensive workloads. These volume types are not supported for Multi-Attach functionality.

- **Cold HDD Amazon EBS volumes**:
  These HDD-backed volumes provide a lowest-cost HDD design for less frequently accessed workloads. These volume types are not supported for Multi-Attach functionality.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - ebs volumes multi](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes-multi.html)

</details>

---

<div id="question-46"></div>

### Question 46: Cost-Effective Infrequent OLTP Workloads Using Amazon Aurora Serverless
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The engineering team at an IT company is deploying an Online Transactional Processing (OLTP) application that needs to support relational queries. The application will have unpredictable spikes of usage that the team does not know in advance.

Which database would you recommend using?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon Aurora Serverless `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon ElastiCache
- **(C)** Amazon DynamoDB with Provisioned Capacity and Auto Scaling
- **(D)** Amazon DynamoDB with On-Demand Capacity

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Aurora Serverless

Amazon Aurora Serverless is an on-demand, auto-scaling configuration for Amazon Aurora (MySQL-compatible and PostgreSQL-compatible editions), where the database will automatically start up, shut down, and scale capacity up or down based on your application's needs. It enables you to run your database in the cloud without managing any database instances. It's a simple, cost-effective option for infrequent, intermittent, or unpredictable workloads. The database design for an OLTP application fits the relational model, therefore you can infer an OLTP system as a Relational Database.

Amazon Aurora Serverless is the perfect way to create a database that can scale down to 0 servers, and scale up to many servers, as an OLTP database. So this is the correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon DynamoDB with Provisioned Capacity and Auto Scaling

- Amazon DynamoDB with On-Demand Capacity

- Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale. It's a fully managed, multi-region, multi-master, durable database with built-in security, backup and restore, and in-memory caching for internet-scale applications.

- Amazon DynamoDB is a NoSQL database and doesn't do relational queries, therefore it's a choice we have to eliminate, even though the two modes proposed here help us cope with an unpredictable amount of usage. So both these options are incorrect.

- **Amazon ElastiCache**:
  Amazon ElastiCache allows you to seamlessly set up, run, and scale popular open-Source compatible in-memory data stores in the cloud. Build data-intensive apps or boost the performance of your existing databases by retrieving data from high throughput and low latency in-memory data stores. Amazon ElastiCache is a popular choice for real-time use cases like Caching, Session Stores, Gaming, Geospatial Services, Real-Time Analytics, and Queuing. Amazon Elasticache is used as a caching layer in front of relational databases. Amazon ElastiCache is a NoSQL database and doesn't facilitate relational queries, so this option is ruled out.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/aurora/serverless/)
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/)

</details>

---

<div id="question-47"></div>

### Question 47: Automating Experimental Dataset Lifecycle: S3 Standard-IA & Scheduled Expiration
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A research firm archives experimental datasets generated by automated laboratory equipment. Each dataset is about 10 MB in size and is initially accessed frequently for analysis within the first month. After this period, the access rate drops significantly, but the data must remain immediately retrievable if needed. Due to compliance policies, each dataset must be retained in AWS storage for exactly 4 years before deletion. The firm currently stores the data in Amazon S3 Standard storage and wants to minimize costs without compromising data availability or retrieval speed.

Which solution meets these requirements most cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an S3 Lifecycle configuration to transfer all datasets to S3 One Zone-Infrequent Access (S3 One Zone-IA) after 30 days, and permanently delete them 4 years after creation
- **(B)** Configure an S3 Lifecycle policy to migrate datasets to S3 Glacier Flexible Retrieval after 30 days and delete them automatically 4 years after creation
- **(C)** Define an S3 Lifecycle policy that transitions datasets to S3 Standard-Infrequent Access (S3 Standard-IA) 30 days after creation and schedules the deletion of each object exactly 4 years after its creation `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Define an S3 Lifecycle policy that transitions datasets to S3 Glacier Instant Retrieval 30 days after creation and schedules the deletion of each object exactly 4 years after its creation

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Define an S3 Lifecycle policy that transitions datasets to S3 Standard-Infrequent Access (S3 Standard-IA) 30 days after creation and schedules the deletion of each object exactly 4 years after its creation

This solution provides a balanced cost-saving strategy and meets all business requirements. S3 Standard-IA offers significantly lower storage costs than S3 Standard for objects that are infrequently accessed but still need to be retrieved instantly. Since the files are accessed frequently only in the first 30 days and must remain available thereafter, moving them to S3 Standard-IA after 30 days is appropriate. Deleting the files after 4 years using a lifecycle rule ensures compliance and cost efficiency.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Define an S3 Lifecycle policy that transitions datasets to S3 Glacier Instant Retrieval 30 days after creation and schedules the deletion of each object exactly 4 years after its creation**:
  Though S3 Glacier Instant Retrieval (GIR) allows instant access, it is more expensive per GB than S3 Standard-IA for infrequent access. It is typically used for archival data that needs occasional but instant access, not as a substitute for IA. S3 Glacier Instant Retrieval offers significantly lower storage costs at $0.004 per GB per month, compared to $0.0125 per GB per month for S3 Standard-IA—making it about 68% cheaper for storage. However, Glacier Instant Retrieval charges $0.03 per GB retrieved and $0.01 per 1,000 GET requests, while Standard-IA charges only $0.01 per GB retrieved and $0.001 per 1,000 GETs. So, retrieving 100 GB with 10,000 GET requests would cost just $1.01 with Standard-IA, but $3.10 with Glacier Instant Retrieval. Therefore, while GIR is cheaper to store, Standard-IA is more cost-effective when data is accessed even occasionally.

- **Configure an S3 Lifecycle policy to migrate datasets to S3 Glacier Flexible Retrieval after 30 days and delete them automatically 4 years after creation**:
  S3 Glacier Flexible Retrieval is designed for archiving data that does not require instant access. Although it is low-cost, its retrieval latency is not immediate and can take minutes to hours depending on the retrieval tier. The requirement clearly states that files must be immediately accessible throughout the 4-year retention period, making this storage class unsuitable.

- **Set up an S3 Lifecycle configuration to transfer all datasets to S3 One Zone-Infrequent Access (S3 One Zone-IA) after 30 days, and permanently delete them 4 years after creation**:
  Although One Zone-IA offers a lower storage price than S3 Standard-IA, it stores data in only one Availability Zone. This poses a data durability risk, especially since the datasets cannot be recreated. The scenario requires resilience and immediate retrieval, which One Zone-IA may not reliably provide if an AZ failure occurs.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - Welcome](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/pricing/)
- 🌐 [AWS Docs: AmazonS3 - storage class intro](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html#sc-infreq-data-access)

</details>

---

<div id="question-48"></div>

### Question 48: Multi-Region Traffic Distribution Limitations of Classic Elastic Load Balancing
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A startup uses a fleet of Amazon EC2 servers to manage its CRM application. These Amazon EC2 servers are behind Elastic Load Balancing (ELB). Which of the following configurations are NOT allowed for Elastic Load Balancing?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. All the four instances are deployed in Availability Zone A of us-east-1 region
- **(B)** Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. All the four instances are deployed across two Availability Zones of us-east-1 region
- **(C)** Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. All the four instances are deployed in Availability Zone B of us-west-1 region
- **(D)** Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. Two of these instances are deployed in Availability Zone A of us-east-1 region and the other two instances are deployed in Availability Zone B of us-west-1 region `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. Two of these instances are deployed in Availability Zone A of us-east-1 region and the other two instances are deployed in Availability Zone B of us-west-1 region

Elastic Load Balancer automatically distributes incoming traffic across multiple targets – Amazon EC2 instances, containers, IP addresses, and Lambda functions – in multiple Availability Zones and ensures only healthy targets receive traffic. ELB cannot distribute incoming traffic for targets deployed in different regions. This configuration is NOT allowed for the Elastic Load Balancer and therefore this is the correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. All the four instances are deployed across two Availability Zones of us-east-1 region

- Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. All the four instances are deployed in Availability Zone A of us-east-1 region

- Use the Elastic Load Balancing to distribute traffic for four Amazon EC2 instances. All the four instances are deployed in Availability Zone B of us-west-1 region

- These three options are valid configurations for the Elastic Load Balancing to distribute traffic (either within an Availability Zone or between two Availability Zones).

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: elasticloadbalancing](https://aws.amazon.com/elasticloadbalancing/)

</details>

---

<div id="question-49"></div>

### Question 49: Monitoring Compute Savings Plans Coverage with Daily AWS Budgets Alerts
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A tech enterprise operates several workloads using Amazon EC2, AWS Fargate, and AWS Lambda across various teams. To optimize compute costs, the company has purchased Compute Savings Plans. The cloud operations team needs to implement a solution that not only monitors utilization but also sends automated alerts when coverage levels of the Compute Savings Plans fall below a defined threshold.

What is the MOST operationally efficient way to achieve this?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Budgets to create a daily coverage budget specifically for Compute Savings Plans. Define a coverage threshold and configure notifications to alert relevant stakeholders `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable Compute Optimizer recommendations for EC2 and Fargate. Configure automatic notifications for cost optimization opportunities and Savings Plans coverage drops
- **(C)** Create a standalone dashboard in Amazon CloudWatch to track EC2 and Fargate usage. Use metric math to estimate coverage and trigger alarms
- **(D)** Configure a custom script that queries the Savings Plans utilization API and pushes results to an Amazon S3 bucket. Use Amazon QuickSight to visualize coverage and email reports weekly

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Budgets to create a daily coverage budget specifically for Compute Savings Plans. Define a coverage threshold and configure notifications to alert relevant stakeholders

> 🔗 **Tài liệu tham khảo trực quan**: [AWS Budgets allows organizations to create Savings Plans coverage budgets, which track how much of their compute usage is covered by active Savings Plans. These budgets can be configured to monitor coverage percentages on a daily basis and can trigger alerts via Amazon SNS or email when the coverage drops below a defined threshold (e.g., 90%). This approach requires no custom scripting or infrastructure maintenance and integrates seamlessly with AWS services. It ensures that stakeholders are notified proactively about potential cost inefficiencies without adding administrative overhead.](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure a custom script that queries the Savings Plans utilization API and pushes results to an Amazon S3 bucket. Use Amazon QuickSight to visualize coverage and email reports weekly**:
  While technically feasible, this solution introduces unnecessary complexity by requiring custom scripting, manual reporting, and delayed insights via weekly visualizations. This approach does not provide real-time alerting or low operational overhead compared to native features in AWS Budgets. It's less efficient and more difficult to maintain.

- **Enable Compute Optimizer recommendations for EC2 and Fargate. Configure automatic notifications for cost optimization opportunities and Savings Plans coverage drops**:
  AWS Compute Optimizer offers instance type recommendations based on performance metrics but does not track or notify on Savings Plans coverage. It helps right-size workloads but does not integrate with Savings Plans metrics or budgets. Therefore, it cannot fulfill the requirement of alerting on under-coverage.

- **Create a standalone dashboard in Amazon CloudWatch to track EC2 and Fargate usage. Use metric math to estimate coverage and trigger alarms**:
  Although Amazon CloudWatch is powerful for metrics and alarms, Savings Plans coverage metrics are not directly available in CloudWatch. You would need to implement a complex estimation process using usage metrics, which is both error-prone and operationally inefficient. AWS Budgets is purpose-built for this use case and is much simpler to implement.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: cost-management - budgets managing costs](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html)

</details>

---

<div id="question-50"></div>

### Question 50: Understanding Amazon EC2 Ephemeral Instance Store Limitations and Lifecycle
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (E) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
The engineering team at a startup is evaluating the most optimal block storage volume type for the Amazon EC2 instances hosting its flagship application. The storage volume should support very low latency but it does not need to persist the data when the instance terminates. As a solutions architect, you have proposed using Instance Store volumes to meet these requirements.

Which of the following would you identify as the key characteristics of the Instance Store volumes? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Instance store is reset when you stop or terminate an instance. Instance store data is preserved during hibernation `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** You can specify instance store volumes for an instance when you launch or restart it
- **(C)** An instance store is a network storage type
- **(D)** You can't detach an instance store volume from one instance and attach it to a different instance `[Đáp án đúng ✅]`
- **(E)** If you create an Amazon Machine Image (AMI) from an instance, the data on its instance store volumes isn't preserved `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
You can't detach an instance store volume from one instance and attach it to a different instance

You can specify instance store volumes for an instance only when you launch it. You can't detach an instance store volume from one instance and attach it to a different instance. The data in an instance store persists only during the lifetime of its associated instance. If an instance reboots (intentionally or unintentionally), data in the instance store persists.

If you create an Amazon Machine Image (AMI) from an instance, the data on its instance store volumes isn't preserved

If you create an AMI from an instance, the data on its instance store volumes isn't preserved and isn't present on the instance store volumes of the instances that you launch from the AMI.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Instance store is reset when you stop or terminate an instance. Instance store data is preserved during hibernation**:
  When you stop, hibernate, or terminate an instance, every block of storage in the instance store is reset. Therefore, this option is incorrect.

- **You can specify instance store volumes for an instance when you launch or restart it**:
  You can specify instance store volumes for an instance only when you launch it.

- **An instance store is a network storage type**:
  An instance store provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - InstanceStorage](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)

</details>

---

<div id="question-51"></div>

### Question 51: Sub-Second Cross-Region Disaster Recovery Using Amazon Aurora Global Database
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A financial services firm operates a mission-critical transaction processing platform hosted in the AWS us-east-2 Region. The backend is powered by a MySQL-compatible Amazon Aurora cluster, with high transaction volumes throughout the day. As part of its business continuity planning, the firm has selected us-west-2 as its designated disaster recovery (DR) Region.

The firm has defined strict DR objectives:

Recovery Point Objective (RPO): ≤ 5 minutes

Recovery Time Objective (RTO): ≤ 15 minutes

Leadership has asked for a DR solution that ensures fast cross-regional failover with minimal operational overhead and configuration effort. What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy a separate Aurora cluster in us-west-2, and use scheduled AWS Lambda functions with custom scripts to export and import snapshots from us-east-2 every 5 minutes
- **(B)** Provision a separate Aurora MySQL-compatible cluster in us-west-2, and configure AWS Database Migration Service (AWS DMS) to replicate data from the primary database to the DR cluster continuously. Perform manual failover during DR events
- **(C)** Convert the Aurora cluster to an Aurora global database, with the secondary cluster deployed in us-west-2. Rely on Aurora global database managed failover to meet RTO and RPO objectives `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Aurora read replica in us-west-2 with equivalent capacity to the primary cluster's writer node in us-east-2. Monitor replication health and configure a manual promotion process for failover

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Convert the Aurora cluster to an Aurora global database, with the secondary cluster deployed in us-west-2. Rely on Aurora global database managed failover to meet RTO and RPO objectives

> 🔗 **Tài liệu tham khảo trực quan**: [This solution is the most operationally efficient and fully meets the company’s disaster recovery (DR) objectives. Aurora global databases are specifically designed for cross-Region deployments that require low-latency replication and high availability. By converting the existing Aurora MySQL cluster to a global database, the primary Region (us-east-2) replicates data to a secondary Aurora cluster in the DR Region (us-west-2) with typically less than 1 second of replication lag, ensuring the company’s RPO of 5 minutes is comfortably met. Additionally, managed failover capabilities allow for a fast, coordinated promotion of the secondary cluster to primary with minimal downtime, satisfying the RTO of 15 minutes. This approach requires minimal configuration changes and automates much of the failover process, significantly reducing operational burden while maintaining data consistency and business continuity.](https://aws.amazon.com/blogs/storage/protecting-data-with-amazon-s3-object-lock/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Provision a separate Aurora MySQL-compatible cluster in us-west-2, and configure AWS Database Migration Service (AWS DMS) to replicate data from the primary database to the DR cluster continuously. Perform manual failover during DR events**:
  While DMS supports near-real-time replication, it does not guarantee low-latency replication suitable for a 5-minute RPO, especially during high loads. DMS also introduces additional operational complexity and lacks native Aurora integration for seamless failover. AWS Database Migration Service (AWS DMS) is generally designed for database migrations or light-weight replication tasks, not for high-throughput, low-latency disaster recovery needs. While DMS can perform ongoing replication, it does not guarantee latency under 5 minutes, especially during peak traffic or write-heavy workloads. Moreover, DMS lacks the tight native integration with Amazon Aurora that global databases offer — meaning failover must be manually orchestrated, increasing operational complexity and potentially pushing the RTO beyond 15 minutes. Additionally, managing DMS tasks at scale (monitoring, restarting, troubleshooting) requires more administrative effort compared to the managed, built-in replication and failover mechanisms of Aurora global databases.

- **Create an Aurora read replica in us-west-2 with equivalent capacity to the primary cluster's writer node in us-east-2. Monitor replication health and configure a manual promotion process for failover**:
  Aurora cross-Region read replicas do not offer managed failover and require manual intervention and additional orchestration during a disaster. Although replication latency is low, managing failover manually adds operational burden and increases risk of human error, affecting RTO.

- **Deploy a separate Aurora cluster in us-west-2, and use scheduled AWS Lambda functions with custom scripts to export and import snapshots from us-east-2 every 5 minutes**:
  Snapshot export/import is not near real-time, and even with scripting, this method cannot guarantee a 5-minute RPO. Snapshot-based DR also requires manual failover orchestration, violating both the RPO and RTO requirements.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonRDS - aurora global database](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database.html)
- 🌐 [AWS Docs: prescriptive-guidance - implement cross region disaster recovery with aws dms and amazon aurora](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/implement-cross-region-disaster-recovery-with-aws-dms-and-amazon-aurora.html)
- 🌐 [AWS Docs: dms - Welcome](https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html)

</details>

---

<div id="question-52"></div>

### Question 52: Minimizing Multi-AZ Database Replication Costs Using Private IP Addresses
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
You have deployed a database technology that has a synchronous replication mode to survive disasters in data centers. The database is therefore deployed on two Amazon EC2 instances in two Availability Zones (AZs). The database must be publicly available so you have deployed the Amazon EC2 instances in public subnets. The replication protocol currently uses the Amazon EC2 public IP addresses.

What can you do to decrease the replication cost?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an Elastic Fabric Adapter (EFA) `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Create a Private Link between the two Amazon EC2 instances
- **(C)** Use the Amazon EC2 instances private IP for the replication `[Đáp án đúng ✅]`
- **(D)** Assign elastic IP address (EIP) to the Amazon EC2 instances and use them for the replication

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use the Amazon EC2 instances private IP for the replication

The source of the cost is that traffic between two EC2 instances is going over the public internet, thus incurring high costs. Here, the correct answer is to use Private IP, so that the network remains private, for a minimal cost.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Assign elastic IP address (EIP) to the Amazon EC2 instances and use them for the replication**:
  Using Elastic IPs will not solve the problem as the traffic will still be going over the public internet.

- **Create a Private Link between the two Amazon EC2 instances**:
  AWS PrivateLink simplifies the security of data shared with cloud-based applications by eliminating the exposure of data to the public Internet. AWS PrivateLink provides private connectivity between VPCs, AWS services, and on-premises applications, securely on the Amazon network.

- Private Link is a distractor in this question. Private Link is leveraged to create a private connection between an application that is fronted by an NLB in an account, and an Elastic Network Interface (ENI) in another account, without the need of VPC peering and allowing the connections between the two to remain within the AWS network.

- **Use an Elastic Fabric Adapter (EFA)**:
  The Elastic Fabric Adapter (EFA) is a network interface for Amazon EC2 instances that enables customers to run HPC applications requiring high levels of inter-instance communications, like computational fluid dynamics, weather modeling, and reservoir simulation, at scale on AWS. This option is not relevant to the given use-case.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: privatelink](https://aws.amazon.com/privatelink/)
- 🌐 [AWS Service Overview: hpc](https://aws.amazon.com/hpc/efa/)

</details>

---

<div id="question-53"></div>

### Question 53: Security Groups (Stateful) vs Network ACLs (Stateless) Return Traffic Mechanics
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A developer has configured inbound traffic for the relevant ports in both the Security Group of the Amazon EC2 instance as well as the network access control list (network ACL) of the subnet for the Amazon EC2 instance. The developer is, however, unable to connect to the service running on the Amazon EC2 instance.

As a solutions architect, how will you fix this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** IAM Role defined in the Security Group is different from the IAM Role that is given access in the network access control list (network ACL)
- **(B)** Network access control list (network ACL) are stateful, so allowing inbound traffic to the necessary ports enables the connection. Security Groups are stateless, so you must allow both inbound and outbound traffic
- **(C)** Rules associated with network access control list (network ACL) should never be modified from command line. An attempt to modify rules from command line blocks the rule and results in an erratic behavior
- **(D)** Security Groups are stateful, so allowing inbound traffic to the necessary ports enables the connection. Network access control list (network ACL) are stateless, so you must allow both inbound and outbound traffic `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Security Groups are stateful, so allowing inbound traffic to the necessary ports enables the connection. Network access control list (network ACL) are stateless, so you must allow both inbound and outbound traffic

Security groups are stateful, so allowing inbound traffic to the necessary ports enables the connection. Network ACLs are stateless, so you must allow both inbound and outbound traffic.

To enable the connection to a service running on an instance, the associated network ACL must allow both inbound traffic on the port that the service is listening on as well as allow outbound traffic from ephemeral ports. When a client connects to a server, a random port from the ephemeral port range (1024-65535) becomes the client's source port.

The designated ephemeral port then becomes the destination port for return traffic from the service, so outbound traffic from the ephemeral port must be allowed in the network ACL.

By default, network ACLs allow all inbound and outbound traffic. If your network ACL is more restrictive, then you need to explicitly allow traffic from the ephemeral port range.

If you accept traffic from the internet, then you also must establish a route through an internet gateway. If you accept traffic over VPN or AWS Direct Connect, then you must establish a route through a virtual private gateway.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Network access control list (network ACL) are stateful, so allowing inbound traffic to the necessary ports enables the connection. Security Groups are stateless, so you must allow both inbound and outbound traffic**:
  This is incorrect as already discussed.

- **IAM Role defined in the Security Group is different from the IAM Role that is given access in the network access control list (network ACL)**:
  This is a made-up option and just added as a distractor.

- **Rules associated with network access control list (network ACL) should never be modified from command line. An attempt to modify rules from command line blocks the rule and results in an erratic behavior**:
  This option is a distractor. AWS does not support modifying rules of Network ACLs from the command line tool.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: premiumsupport](https://aws.amazon.com/premiumsupport/knowledge-center/resolve-connection-sg-acl-inbound/)

</details>

---

<div id="question-54"></div>

### Question 54: Mitigating Web Layer DoS / DDoS HTTP Flood Attacks with AWS WAF Rate-Based Rules
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
Your application is deployed on Amazon EC2 instances fronted by an Application Load Balancer. Recently, your infrastructure has come under attack. Attackers perform over 100 requests per second, while your normal users only make about 5 requests per second.

How can you efficiently prevent attackers from overwhelming your application?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Shield Advanced and setup a rate-based rule
- **(B)** Use an AWS Web Application Firewall (AWS WAF) and setup a rate-based rule `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Define a network access control list (network ACL) on your Application Load Balancer
- **(D)** Configure Sticky Sessions on the Application Load Balancer

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use an AWS Web Application Firewall (AWS WAF) and setup a rate-based rule

AWS Web Application Firewall (AWS WAF) is a web application firewall that helps protect your web applications or APIs against common web exploits that may affect availability, compromise security, or consume excessive resources. AWS WAF gives you control over how traffic reaches your applications by enabling you to create security rules that block common attack patterns, such as SQL injection or cross-site scripting, and rules that filter out specific traffic patterns you define.

The correct answer is to use WAF (which has integration on top of your ALB) and define a rate-based rule.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure Sticky Sessions on the Application Load Balancer**:
  Application Load Balancer (ALB) operates at the request level (layer 7), routing traffic to targets – Amazon EC2 instances, containers, IP addresses and Lambda functions based on the content of the request. Ideal for advanced load balancing of HTTP and HTTPS traffic, Application Load Balancer provides advanced request routing targeted at delivery of modern application architectures, including microservices and container-based applications.

- Sticky Sessions on your Application Load Balancer is a distractor here. Sticky sessions are a mechanism to route requests from the same client to the same target. Application Load Balancer supports sticky sessions using load balancer generated cookies. If you enable sticky sessions, the same target receives the request and can use the cookie to recover the session context.

- **Define a network access control list (network ACL) on your Application Load Balancer**:
  A network access control list (network ACL) does not work, as this only helps to block specific IPs. On top of things, network access control list (network ACL) is defined at the subnet level, and not for an Application Load Balancer.

- **Use AWS Shield Advanced and setup a rate-based rule**:
  AWS Shield is a managed Distributed Denial of Service (DDoS) protection service that safeguards applications running on AWS. AWS Shield provides always-on detection and automatic inline mitigations that minimize application downtime and latency, so there is no need to engage AWS Support to benefit from DDoS protection. There are two tiers of AWS Shield - Standard and Advanced.

- AWS Shield Advanced provides enhanced resource-specific detection and employs advanced mitigation and routing techniques for sophisticated or larger attacks.

- AWS Shield Advanced will give you DDoS protection overall, and you cannot set up rate-based rules in Shield.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: waf](https://aws.amazon.com/waf/)
- 🌐 [AWS Docs: waf - waf rule statement type rate based](https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-rate-based.html)
- 🌐 [AWS Service Overview: shield](https://aws.amazon.com/shield/)
- 🌐 [AWS Docs: elasticloadbalancing - load balancer target groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#sticky-sessions)

</details>

---

<div id="question-55"></div>

### Question 55: Implementing Request-Response Messaging Patterns with SQS Temporary Queues
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A development team is looking for a solution that saves development time and deployment costs for an application that uses a high-throughput request-response message pattern.

Which of the following Amazon SQS queue types is the best fit to meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon Simple Queue Service (Amazon SQS) dead-letter queues
- **(B)** Amazon Simple Queue Service (Amazon SQS) temporary queues `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Amazon Simple Queue Service (Amazon SQS) delay queues
- **(D)** Amazon Simple Queue Service (Amazon SQS) FIFO queues

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon Simple Queue Service (Amazon SQS) temporary queues

Temporary queues help you save development time and deployment costs when using common message patterns such as request-response. You can use the Temporary Queue Client to create high-throughput, cost-effective, application-managed temporary queues.

The client maps multiple temporary queues—application-managed queues created on demand for a particular process—onto a single Amazon SQS queue automatically. This allows your application to make fewer API calls and have a higher throughput when the traffic to each temporary queue is low. When a temporary queue is no longer in use, the client cleans up the temporary queue automatically, even if some processes that use the client aren't shut down cleanly.

The following are the benefits of temporary queues:

They serve as lightweight communication channels for specific threads or processes.

They can be created and deleted without incurring additional costs.

They are API-compatible with static (normal) Amazon SQS queues. This means that existing code that sends and receives messages can send messages to and receive messages from virtual queues.

To better support short-lived, lightweight messaging destinations, AWS recommends Amazon SQS Temporary Queue Client. This client makes it easy to create and delete many temporary messaging destinations without inflating your AWS bill. The key concept behind the client is the virtual queue. Virtual queues let you multiplex many low-traffic queues onto a single Amazon SQS queue. Creating a virtual queue only instantiates a local buffer to hold messages for consumers as they arrive; there is no API call to SQS and no costs associated with creating a virtual queue.

> 🔗 **Tài liệu tham khảo trực quan**: [End-to-end process for sending messages through virtual queues:](https://aws.amazon.com/blogs/compute/simple-two-way-messaging-using-the-amazon-sqs-temporary-queue-client/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon Simple Queue Service (Amazon SQS) dead-letter queues**:
  Amazon SQS supports dead-letter queues, which other queues (source queues) can target for messages that can't be processed (consumed) successfully. Dead-letter queues are useful for debugging your application or messaging system because they let you isolate problematic messages to determine why their processing doesn't succeed. Amazon SQS does not create the dead-letter queue automatically. You must first create the queue before using it as a dead-letter queue.

- **Amazon Simple Queue Service (Amazon SQS) FIFO queues**:
  Amazon SQS FIFO (First-In-First-Out) queues are designed to enhance messaging between applications when the order of operations and events is critical, or where duplicates can't be tolerated. FIFO queues also provide exactly-once processing but have a limited number of transactions per second (TPS).

- **Amazon Simple Queue Service (Amazon SQS) delay queues**:
  Delay queues let you postpone the delivery of new messages to a queue for a number of seconds, for example, when your consumer application needs additional time to process messages. If you create a delay queue, any messages that you send to the queue remain invisible to consumers for the duration of the delay period. The default (minimum) delay for a queue is 0 seconds. The maximum is 15 minutes.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSSimpleQueueService - sqs temporary queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-temporary-queues.html)
- 🌐 [AWS Architecture Blog: simple two way messaging using the amazon sqs temporary queue client](https://aws.amazon.com/blogs/compute/simple-two-way-messaging-using-the-amazon-sqs-temporary-queue-client/)

</details>

---

<div id="question-56"></div>

### Question 56: Configuring Multi-Service Private Access via S3 & DynamoDB Gateway Endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has multiple Amazon EC2 instances operating in a private subnet which is part of a custom VPC. These instances are running an image processing application that needs to access images stored on Amazon S3. Once each image is processed, the status of the corresponding record needs to be marked as completed in a Amazon DynamoDB table.

How would you go about providing private access to these AWS resources which are not part of this custom VPC?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a separate interface endpoint for Amazon S3 and Amazon DynamoDB each. Then connect to these services by adding these as targets in the route table of the custom VPC
- **(B)** Create a gateway endpoint for Amazon DynamoDB and add it as a target in the route table of the custom VPC. Create an Origin Access Identity for Amazon S3 and then connect to the S3 service using the private IP address
- **(C)** Create a gateway endpoint for Amazon S3 and add it as a target in the route table of the custom VPC. Create an interface endpoint for Amazon DynamoDB and then add it as a target in the route table of the custom VPC
- **(D)** Create a separate gateway endpoint for Amazon S3 and Amazon DynamoDB each. Add two new target entries for these two gateway endpoints in the route table of the custom VPC `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a separate gateway endpoint for Amazon S3 and Amazon DynamoDB each. Add two new target entries for these two gateway endpoints in the route table of the custom VPC

Endpoints are virtual devices. They are horizontally scaled, redundant, and highly available VPC components. They allow communication between instances in your VPC and services without imposing availability risks or bandwidth constraints on your network traffic.

A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other service does not leave the Amazon network.

There are two types of VPC endpoints: interface endpoints and gateway endpoints. An interface endpoint is an elastic network interface with a private IP address from the IP address range of your subnet that serves as an entry point for traffic destined to a supported service.

A gateway endpoint is a gateway that you specify as a target for a route in your route table for traffic destined to a supported AWS service. The following AWS services are supported:

Amazon S3

Amazon DynamoDB

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Create a gateway endpoint for Amazon S3 and add it as a target in the route table of the custom VPC. Create an interface endpoint for Amazon DynamoDB and then add it as a target in the route table of the custom VPC

- Create a separate interface endpoint for Amazon S3 and Amazon DynamoDB each. Then connect to these services by adding these as targets in the route table of the custom VPC

- Amazon DynamoDB supports AWS PrivateLink. With AWS PrivateLink, you can simplify private network connectivity between virtual private clouds (VPCs), DynamoDB, and your on-premises data centers using interface VPC endpoints and private IP addresses. So, Amazon DynamoDB supports both interface endpoints as well as gateway endpoints. However, to use the interface endpoints, you need to connect to the given services using the private IP address, instead of creating an entry as a target in the route table of the custom VPC. Therefore, both these options are incorrect.

- **Create a gateway endpoint for Amazon DynamoDB and add it as a target in the route table of the custom VPC. Create an Origin Access Identity for Amazon S3 and then connect to the S3 service using the private IP address**:
  Origin Access Identity (OAI) is used within the context of Amazon CloudFront. To restrict access to content that you serve from Amazon S3 buckets, you can create a special Amazon CloudFront user called an origin access identity (OAI) and associate it with your distribution. You cannot use OAI to facilitate access to Amazon S3 from a VPC.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)
- 🌐 [AWS Service Overview: about-aws](https://aws.amazon.com/about-aws/whats-new/2024/03/amazon-dynamodb-aws-privatelink/)

</details>

---

<div id="question-57"></div>

### Question 57: Optimizing S3 Object Metadata Indexing Using HTTP Byte-Range Fetches
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
You are looking to build an index of your files in Amazon S3, using Amazon RDS PostgreSQL. To build this index, it is necessary to read the first 250 bytes of each object in Amazon S3, which contains some metadata about the content of the file itself. There are over 100,000 files in your S3 bucket, amounting to 50 terabytes of data.

How can you build this index efficiently?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an application that will traverse the S3 bucket, issue a Byte Range Fetch for the first 250 bytes, and store that information in Amazon RDS `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create an application that will traverse the Amazon S3 bucket, then use S3 Select Byte Range Fetch parameter to get the first 250 bytes, and store that information in Amazon RDS
- **(C)** Use the Amazon RDS Import feature to load the data from Amazon S3 to PostgreSQL, and run a SQL query to build the index
- **(D)** Create an application that will traverse the Amazon S3 bucket, read all the files one by one, extract the first 250 bytes, and store that information in Amazon RDS

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an application that will traverse the S3 bucket, issue a Byte Range Fetch for the first 250 bytes, and store that information in Amazon RDS

Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance.

Using the Range HTTP header in a GET Object request, you can fetch a byte-range from an object, transferring only the specified portion. You can use concurrent connections to Amazon S3 to fetch different byte ranges from within the same object. This helps you achieve higher aggregate throughput versus a single whole-object request. Fetching smaller ranges of a large object also allows your application to improve retry times when requests are interrupted.

A byte-range request is a perfect way to get the beginning of a file and ensuring we remain efficient during our scan of our Amazon S3 bucket. So this is the correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use the Amazon RDS Import feature to load the data from Amazon S3 to PostgreSQL, and run a SQL query to build the index**:
  You cannot import data from Amazon S3 into Amazon RDS, so this option is incorrect.

- **Create an application that will traverse the Amazon S3 bucket, read all the files one by one, extract the first 250 bytes, and store that information in Amazon RDS**:
  If you build an application that loads all the files from Amazon S3, that would work, but you would read 50TB of data and that may be very expensive and slow. So this option is incorrect.

- **Create an application that will traverse the Amazon S3 bucket, then use S3 Select Byte Range Fetch parameter to get the first 250 bytes, and store that information in Amazon RDS**:
  Amazon S3 Select is a new Amazon S3 capability designed to pull out only the data you need from an object, which can dramatically improve the performance and reduce the cost of applications that need to access data in Amazon S3. You cannot use Byte Range Fetch parameter with S3 Select to traverse the Amazon S3 bucket and get the first bytes of a file. So this option is incorrect.

- Exam Alert:

> 🔗 **Tài liệu tham khảo trực quan**: [Please note that with Amazon S3 Select, you can scan a subset of an object by specifying a range of bytes to query using the ScanRange parameter. This capability lets you parallelize scanning the whole object by splitting the work into separate Amazon S3 Select requests for a series of non-overlapping scan ranges. Use the Amazon S3 Select ScanRange parameter and Start at (Byte) and End at (Byte).](https://docs.aws.amazon.com/AmazonS3/latest/dev/selecting-content-from-objects.html)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - optimizing performance guidelines](https://docs.aws.amazon.com/AmazonS3/latest/dev/optimizing-performance-guidelines.html#optimizing-performance-guidelines-get-range)

</details>

---

<div id="question-58"></div>

### Question 58: Real-Time User Engagement Analytics Ingestion via Kinesis Data Streams On-Demand & Lambda
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A digital media company wants to track user engagement across its streaming platform by capturing events such as video starts, pauses, and search queries. These events must be ingested and analyzed in real time to improve user experience and optimize recommendations. The platform experiences unpredictable spikes in traffic during popular content releases. The company needs a highly scalable and serverless solution that can seamlessly adjust to changing workloads without manual provisioning.

Which solution will meet these requirements in the MOST efficient and scalable way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Kinesis Data Firehose to ingest user events. Set the destination as Amazon S3. Use Amazon Athena with scheduled queries to analyze the data periodically
- **(B)** Use Amazon Simple Notification Service (Amazon SNS) to publish clickstream events. Subscribe an Amazon SQS standard queue to receive the events. Process the events in batches with AWS Glue jobs scheduled at fixed intervals
- **(C)** Use an Amazon Kinesis Data Streams stream in on-demand capacity mode to ingest user engagement data. Configure an AWS Lambda function as a consumer to process the events in real time `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Deploy a fleet of Amazon EC2 instances running Apache Kafka to ingest clickstream data. Set up custom scripts to manually scale the Kafka cluster based on CPU usage. Use Amazon Athena to run periodic queries on stored clickstream logs

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use an Amazon Kinesis Data Streams stream in on-demand capacity mode to ingest user engagement data. Configure an AWS Lambda function as a consumer to process the events in real time

Amazon Kinesis Data Streams with on-demand capacity mode is ideal for workloads with unpredictable or spiky traffic. It automatically provisions and manages the capacity needed to handle varying ingestion volumes without manual intervention. Paired with AWS Lambda as a consumer, it enables real-time processing of clickstream data in a serverless fashion. This combination ensures low-latency ingestion and processing with minimal operational overhead, making it highly suitable for real-time analytics use cases with fluctuating traffic.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon Kinesis Data Firehose to ingest user events. Set the destination as Amazon S3. Use Amazon Athena with scheduled queries to analyze the data periodically**:
  Amazon Kinesis Data Firehose is a fully managed service for delivering streaming data to destinations like Amazon S3 and Amazon Redshift. However, it does not support real-time event processing directly; it buffers data before delivery. Furthermore, AWS Glue is not optimized for low-latency, real-time processing of streaming events. This approach introduces delays and does not meet the requirement for real-time analysis.

- **Use Amazon Simple Notification Service (Amazon SNS) to publish clickstream events. Subscribe an Amazon SQS standard queue to receive the events. Process the events in batches with AWS Glue jobs scheduled at fixed intervals**:
  This approach uses Amazon SNS and SQS for message delivery and AWS Glue for batch processing. While SNS and SQS can distribute messages, they are not ideal for high-throughput real-time ingestion of clickstream data. AWS Glue is primarily suited for batch ETL jobs, not for low-latency real-time processing. This solution does not provide the scalability and responsiveness required for real-time analytics on fluctuating clickstream traffic.

- **Deploy a fleet of Amazon EC2 instances running Apache Kafka to ingest clickstream data. Set up custom scripts to manually scale the Kafka cluster based on CPU usage. Use Amazon Athena to run periodic queries on stored clickstream logs**:
  Using self-managed Apache Kafka on EC2 introduces significant operational overhead and manual scaling challenges, especially under unpredictable traffic spikes. While Kafka is a capable ingestion tool, managing EC2-based clusters lacks the elasticity and serverless benefits provided by managed AWS services like Kinesis. Additionally, Athena is designed for querying static data stored in Amazon S3, not for real-time streaming analytics.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: streams - introduction](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)
- 🌐 [AWS Architecture Blog: amazon kinesis data streams on demand stream data at scale without managing capacity](https://aws.amazon.com/blogs/aws/amazon-kinesis-data-streams-on-demand-stream-data-at-scale-without-managing-capacity/)
- 🌐 [AWS Docs: msk - what is msk](https://docs.aws.amazon.com/msk/latest/developerguide/what-is-msk.html)

</details>

---

<div id="question-59"></div>

### Question 59: Decoupling EC2 Storage: Ephemeral OS on EBS & Persistent Files in Amazon S3
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is developing a document management application on AWS. The application runs on Amazon EC2 instances in multiple Availability Zones (AZs). The company requires the document store to be highly available and the documents need to be returned immediately when requested. The engineering team has configured the application to use Amazon Elastic Block Store (Amazon EBS) to store the documents but the team is willing to consider other options to meet the availability requirement.

As a solutions architect, which of the following will you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up Amazon EBS as the Amazon EC2 instance root volume and then configure the application to use Amazon S3 Glacier as the document store
- **(B)** Provision at least three Provisioned IOPS Amazon Instance Store volumes for the Amazon EC2 instances and then mount these volumes to multiple Amazon EC2 instances
- **(C)** Set up Amazon EBS as the Amazon EC2 instance root volume and then configure the application to use Amazon S3 as the document store `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create snapshots for the Amazon EBS volumes regularly and then build new volumes using those snapshots in additional Availability Zones

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up Amazon EBS as the Amazon EC2 instance root volume and then configure the application to use Amazon S3 as the document store

Instances that use Amazon EBS for the root device automatically have an Amazon EBS volume attached. When you launch an Amazon EBS-backed instance, AWS creates an Amazon EBS volume for each Amazon EBS snapshot referenced by the AMI you use. An Amazon EBS-backed instance can be stopped and later restarted without affecting data stored in the attached volumes.

Amazon S3 provides access to reliable, fast, and inexpensive data storage infrastructure. It is designed to make web-scale computing easier by enabling you to store and retrieve any amount of data, at any time, from within Amazon EC2 or anywhere on the web. S3 is highly available and can be configured to work as a document store for the given use case.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up Amazon EBS as the Amazon EC2 instance root volume and then configure the application to use Amazon S3 Glacier as the document store**:
  As the documents need to be returned immediately when requested, Amazon S3 Glacier is not the right fit, since there is a lag of several minutes/hours when you want to read data from Glacier.

- **Create snapshots for the Amazon EBS volumes regularly and then build new volumes using those snapshots in additional Availability Zones**:
  You can back up the data on your Amazon EBS volumes to Amazon S3 by taking point-in-time snapshots. Snapshots are incremental backups, which means that only the blocks on the device that have changed after your most recent snapshot are saved. Hence, using Amazon EBS volumes as a primary storage solution is ineffective, and creating recurring snapshots is a management nightmare for the current use case.

- **Provision at least three Provisioned IOPS Amazon Instance Store volumes for the Amazon EC2 instances and then mount these volumes to multiple Amazon EC2 instances**:
  You cannot mount Instance Store volumes to multiple Amazon EC2 instances. An instance store provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - InstanceStorage](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-classes/)

</details>

---

<div id="question-60"></div>

### Question 60: Agent-Based Physical and VM Server Migration Using AWS Application Migration Service (MGN)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C), (E) | **Đáp án đúng**: (B), (C), (E)

#### 📋 Đề bài (Scenario)
A global logistics provider operates several legacy applications on virtual machines (VMs) within a private data center. Due to accelerated business growth and limited capacity in its existing infrastructure, the provider decides to migrate select applications to AWS. The company opts for a lift-and-shift strategy for its non-mission-critical systems to meet tight migration deadlines. The solution must support rapid migration without requiring extensive application refactoring.

Which combination of actions will best support this migration approach? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS CloudEndure Disaster Recovery to continuously replicate the VMs to AWS and then promote the target instances for production use
- **(B)** Use AWS Application Migration Service (MGN). Install the AWS Replication Agent on the source VMs `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Launch a cutover instance after completing testing and confirming that replication is up-to-date `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon EC2 Auto Scaling to automatically re-create the VMs in AWS by launching replacement instances with matching configurations
- **(E)** Perform the initial replication. Launch test instances in AWS to validate the migrated VMs before final cutover `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** Shut down the source virtual machines and immediately provision EC2 replacement instances using manual AMI creation

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Application Migration Service (MGN). Install the AWS Replication Agent on the source VMs

AWS Application Migration Service (MGN) is a highly automated lift-and-shift (rehost) solution that simplifies, expedites, and reduces the cost of migrating applications to AWS. It allows companies to lift-and-shift a large number of physical, virtual, or cloud servers without compatibility issues, performance disruption, or long cutover windows. Application Migration Service replicates source servers into your AWS account.

AWS Application Migration Service (MGN) is the recommended AWS tool for lift-and-shift VM migrations. It supports real-time replication of on-premises workloads to AWS with minimal disruption. The Replication Agent is installed on each source VM to handle continuous data transfer. This eliminates the need for image creation or application rewrites, making it ideal for quick, large-scale migrations.

Perform the initial replication. Launch test instances in AWS to validate the migrated VMs before final cutover

> 🔗 **Tài liệu tham khảo trực quan**: [This reflects a standard step in AWS MGN migration workflows. After the initial sync is complete, test instances are launched to validate the integrity and functionality of the migrated VMs. This is critical for quality assurance before moving workloads into production and helps reduce the risk of failure after cutover.](https://docs.aws.amazon.com/mgn/latest/ug/migration-workflow-gs.html)
Launch a cutover instance after completing testing and confirming that replication is up-to-date

This represents the final step in AWS MGN migrations. After validation testing and a final sync of changes from the on-premises environment, a cutover instance is launched to go live in production. The original VM can be decommissioned once the EC2 instance is confirmed to be working as intended.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS CloudEndure Disaster Recovery to continuously replicate the VMs to AWS and then promote the target instances for production use**:
  While CloudEndure Disaster Recovery provides continuous replication and rapid failover to AWS, it is intended primarily for disaster recovery scenarios, not one-time lift-and-shift migrations. It lacks the account structure, automation, and built-in testing workflows offered by AWS Application Migration Service (MGN), which is optimized specifically for migration use cases. Choosing this option adds unnecessary operational complexity and misuses the DR tooling for a migration task.

- **Use Amazon EC2 Auto Scaling to automatically re-create the VMs in AWS by launching replacement instances with matching configurations**:
  Amazon EC2 Auto Scaling is designed for horizontal scaling of stateless applications based on performance metrics like CPU or memory usage. It does not support importing or replicating on-premises VMs, nor does it facilitate image migration or workload conversion. Attempting to use Auto Scaling as a migration mechanism would require manual image creation and deep customization, defeating the purpose of a rapid, low-effort lift-and-shift.

- **Shut down the source virtual machines and immediately provision EC2 replacement instances using manual AMI creation**:
  Manually shutting down VMs and creating Amazon Machine Images (AMIs) adds significant risk and overhead. This approach introduces downtime, requires manual reconfiguration, and increases the chance of misalignment between source and target systems. Moreover, it contradicts the benefit of non-disruptive, live migration provided by AWS MGN. This method is not suited for time-sensitive lift-and-shift efforts.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: mgn - what is application migration service](https://docs.aws.amazon.com/mgn/latest/ug/what-is-application-migration-service.html)
- 🌐 [AWS Docs: mgn - migration workflow gs](https://docs.aws.amazon.com/mgn/latest/ug/migration-workflow-gs.html)

</details>

---

<div id="question-61"></div>

### Question 61: Hub-and-Spoke Inter-VPC Network Interconnection Using AWS Transit Gateway
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company has many Amazon Virtual Private Cloud (Amazon VPC) in various accounts, that need to be connected in a star network with one another and connected with on-premises networks through AWS Direct Connect.

What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Transit Gateway `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** AWS PrivateLink
- **(C)** Virtual private gateway (VGW)
- **(D)** VPC Peering Connection

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
AWS Transit Gateway

AWS Transit Gateway is a service that enables customers to connect their Amazon Virtual Private Clouds (VPCs) and their on-premises networks to a single gateway. With AWS Transit Gateway, you only have to create and manage a single connection from the central gateway into each Amazon VPC, on-premises data center, or remote office across your network. Transit Gateway acts as a hub that controls how traffic is routed among all the connected networks which act like spokes. So, this is a perfect use-case for the Transit Gateway.

> 🔗 **Tài liệu tham khảo trực quan**: [Without AWS Transit Gateway](https://aws.amazon.com/transit-gateway/)
> 🔗 **Tài liệu tham khảo trực quan**: [With AWS Transit Gateway](https://aws.amazon.com/transit-gateway/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **VPC Peering Connection**:
  A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network. You can create a VPC peering connection between your VPCs, or with a VPC in another AWS account. The VPCs can be in different regions (also known as an inter-region VPC peering connection).

- VPC Peering helps connect two VPCs and is not transitive. It would require to create many peering connections between all the VPCs to have them connect. This alone wouldn't work, because we would need to also connect the on-premises data center through Direct Connect and Direct Connect Gateway, but that's not mentioned in this answer.

- **Virtual private gateway (VGW)**:
  A virtual private gateway (VGW), also known as a VPN Gateway, is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself. VPN Gateway is a distractor here because we haven't mentioned a VPN.

- **AWS PrivateLink**:
  AWS PrivateLink simplifies the security of data shared with cloud-based applications by eliminating the exposure of data to the public Internet. AWS PrivateLink provides private connectivity between VPCs, AWS services, and on-premises applications, securely on the Amazon network. Private Link is utilized to create a private connection between an application that is fronted by an NLB in an account, and an Elastic Network Interface (ENI) in another account, without the need of VPC peering, and allowing the connections between the two to remain within the AWS network.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: transit-gateway](https://aws.amazon.com/transit-gateway/)
- 🌐 [AWS Docs: vpc - what is vpc peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html)
- 🌐 [AWS Docs: AWSEC2 - API_CreateVpnGateway](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVpnGateway.html)

</details>

---

<div id="question-62"></div>

### Question 62: Enforcing Cost Governance in Developer Accounts Using AWS Budgets & Automated DenyAll Action
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An organization has rolled out a multi-account architecture using AWS Control Tower to isolate development environments. Each developer has their own dedicated AWS account to provision and test workloads. However, the company is concerned about unexpected spikes in resource usage and AWS spending from individual developer accounts. The leadership team wants to implement a cost control mechanism that can proactively enforce budget limits, ensure automatic responses to overspending, and require minimal ongoing administrative effort.

What is the most efficient solution to meet this goal with the least operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Service Catalog to restrict developers to predefined resource templates with pricing limits. In each developer account, create a scheduled Lambda function that stops all running resources at the end of the day and and restart these resources at the start of next business day
- **(B)** Deploy an AWS Lambda function to run daily in each developer’s account. Use the function to analyze cost usage reports via the Cost Explorer API. If costs exceed a predefined threshold, the function invokes an AWS Config remediation rule
- **(C)** Use AWS Cost Explorer to enable detailed usage and cost reports for each developer account. Configure daily usage reports to be emailed to developers. Create dashboards for each developer in Cost Explorer, and require them to monitor their resource consumption and take action if they approach spending thresholds
- **(D)** Use AWS Budgets to define spending thresholds for each developer’s account. Configure budget alerts to notify developers when actual or forecasted usage exceeds the set limit. Attach Budgets actions to automatically apply a restrictive DenyAll IAM policy to the developer’s primary IAM role when the budget threshold is crossed `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Budgets to define spending thresholds for each developer’s account. Configure budget alerts to notify developers when actual or forecasted usage exceeds the set limit. Attach Budgets actions to automatically apply a restrictive DenyAll IAM policy to the developer’s primary IAM role when the budget threshold is crossed

This solution is optimal because it combines cost visibility, real-time notifications, and automated enforcement in a single, low-maintenance workflow. AWS Budgets allows administrators to define both actual and forecasted budget thresholds at the account level and set up alerts that are automatically triggered when spending exceeds defined limits. By attaching Budgets actions, administrators can enforce access control dynamically — for example, by attaching a DenyAll IAM policy to a user or role when their budget is breached. This ensures that developers cannot launch new costly resources beyond their allocation, providing a proactive and automated way to control costs. Since the setup is centralized and integrated with AWS Organizations and Control Tower, it minimizes operational overhead while maintaining governance.

This option combines budget tracking, notification, and enforcement using native AWS Budgets capabilities. With Budgets actions, administrators can define automated responses (e.g., applying a DenyAll policy) when a user’s spend exceeds the defined budget. This solution is fully serverless, scalable, and low maintenance — ideal for controlling developer costs without requiring daily manual intervention.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an AWS Lambda function to run daily in each developer’s account. Use the function to analyze cost usage reports via the Cost Explorer API. If costs exceed a predefined threshold, the function invokes an AWS Config remediation rule**:
  This approach is operationally intensive and not scalable. It relies on building and maintaining custom Lambda logic in each account and introduces complexity with parsing cost data via API. AWS Budgets provides a better way to control cost thresholds and actions using native automation.

- **Use AWS Service Catalog to restrict developers to predefined resource templates with pricing limits. In each developer account, create a scheduled Lambda function that stops all running resources at the end of the day and and restart these resources at the start of next business day**:
  Although Service Catalog can enforce standardized deployments, it doesn't prevent developers from incurring costs outside the template constraints. Scheduled resource stoppage helps reduce idle costs but does not prevent overspending due to resource scaling or intensive workloads. Also, maintaining separate Lambda functions per account adds operational complexity.

- **Use AWS Cost Explorer to enable detailed usage and cost reports for each developer account. Configure daily usage reports to be emailed to developers. Create dashboards for each developer in Cost Explorer, and require them to monitor their resource consumption and take action if they approach spending thresholds**:
  While AWS Cost Explorer is useful for visualizing and analyzing cost data, it is a passive monitoring tool — it does not provide enforcement capabilities. There is no built-in way to automatically restrict or deny actions when budgets are exceeded. Requiring developers to monitor their own spending is also not scalable and introduces high operational risk. This approach violates the requirement for automated budget enforcement with minimal overhead.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: get started with aws budgets actions](https://aws.amazon.com/blogs/aws-cloud-financial-management/get-started-with-aws-budgets-actions/)
- 🌐 [AWS Docs: cost-management - ce what is](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-what-is.html)

</details>

---

<div id="question-63"></div>

### Question 63: Intelligent Threat Detection and Unauthorized Crypto-Mining Identification via Amazon GuardDuty
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
During a review, a security team has flagged concerns over an Amazon EC2 instance querying IP addresses used for cryptocurrency mining. The Amazon EC2 instance does not host any authorized application related to cryptocurrency mining.

Which AWS service can be used to protect the Amazon EC2 instances from such unauthorized behavior in the future?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Firewall Manager
- **(B)** AWS Shield Advanced
- **(C)** Amazon GuardDuty `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** AWS Web Application Firewall (AWS WAF)

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon GuardDuty

Amazon GuardDuty continuously monitors for malicious or unauthorized behavior to help protect your AWS resources, including your AWS accounts and access keys. Amazon GuardDuty identifies any unusual or unauthorized activity, like cryptocurrency mining or infrastructure deployments in a region that has never been used. Powered by threat intelligence and machine learning, GuardDuty is continuously evolving to help you protect your AWS environment.

The cryptocurrency finding expands the service’s ability to detect Amazon EC2 instances querying IP addresses associated with the cryptocurrency-related activity. The finding type is: CryptoCurrency:EC2/BitcoinTool.B, CryptoCurrency:EC2/BitcoinTool.B!DNS.

This finding informs you that the listed Amazon EC2 instance in your AWS environment is querying a domain name that is associated with Bitcoin or other cryptocurrency-related activity. Bitcoin is a worldwide cryptocurrency and digital payment system that can be exchanged for other currencies, products, and services. Bitcoin is a reward for bitcoin mining and is highly sought after by threat actors.

If you use the Amazon EC2 instance to mine or manage cryptocurrency, or this instance is otherwise involved in blockchain activity, this finding could represent expected activity for your environment. If this is the case in your AWS environment, AWS recommends that you set up a suppression rule for this finding.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **AWS Web Application Firewall (AWS WAF)**:
  AWS WAF is a web application firewall that helps protect your web applications or APIs against common web exploits and bots that may affect availability, compromise security, or consume excessive resources. AWS WAF gives you control over how traffic reaches your applications by enabling you to create security rules that control bot traffic and block common attack patterns, such as SQL injection or cross-site scripting.

- **AWS Shield Advanced**:
  For higher levels of protection against attacks targeting your applications running on Amazon Elastic Compute Cloud (EC2), Elastic Load Balancing (ELB), Amazon CloudFront, AWS Global Accelerator, and Amazon Route 53 resources, you can subscribe to AWS Shield Advanced. In addition to the network and transport layer protections that come with Standard, AWS Shield Advanced provides additional detection and mitigation against large and sophisticated DDoS attacks, near real-time visibility into attacks, and integration with AWS WAF, a web application firewall. AWS Shield Advanced also gives you 24x7 access to the AWS DDoS Response Team (DRT) and protection against DDoS-related spikes in your Amazon Elastic Compute Cloud (EC2), Elastic Load Balancing (ELB), Amazon CloudFront, AWS Global Accelerator, and Amazon Route 53 charges.

- **AWS Firewall Manager**:
  AWS Firewall Manager is a security management service that allows you to centrally configure and manage firewall rules across your accounts and applications in AWS Organizations. As new applications are created, Firewall Manager makes it easy to bring new applications and resources into compliance by enforcing a common set of security rules. Now you have a single service to build firewall rules, create security policies, and enforce them in a consistent, hierarchical manner across your entire infrastructure, from a central administrator account.

- None of these three services can detect unauthorized cryptocurrency mining activity on EC2 instances, so these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: guardduty - guardduty_finding types ec2](https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_finding-types-ec2.html#cryptocurrency-ec2-bitcointoolbdns)

</details>

---

<div id="question-64"></div>

### Question 64: Offloading Analytics Reporting from Production RDS MySQL to Dedicated Read Replicas
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An e-commerce company uses Amazon RDS MySQL DB to store the data. The analytics department at the company runs its reports on the same database. The engineering team has noticed sluggish performance on the database when the analytics reporting process is in progress.

As an AWS Certified Solutions Architect - Associate, which of the following would you suggest as the MOST cost-optimal solution to improve the performance?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a read-replica with half compute capacity and half storage capacity as the primary. Point the reporting queries to run against the read replica
- **(B)** Create a read-replica with the same compute capacity and the same storage capacity as the primary. Point the reporting queries to run against the read replica `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a standby instance in a multi-AZ configuration with half compute capacity and half storage capacity as the primary. Point the reporting queries to run against the standby instance
- **(D)** Create a standby instance in a multi-AZ configuration with the same compute capacity and the same storage capacity as the primary. Point the reporting queries to run against the standby instance

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a read-replica with the same compute capacity and the same storage capacity as the primary. Point the reporting queries to run against the read replica

Amazon RDS uses the MariaDB, Microsoft SQL Server, MySQL, Oracle, and PostgreSQL DB engines' built-in replication functionality to create a special type of database instance called a read replica from a source database instance. The source database instance becomes the primary database instance. Updates made to the primary database instance are asynchronously copied to the read replica. You can reduce the load on your primary DB instance by routing read queries from your applications to the read replica.

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon RDS Read Replicas:](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
> 🔗 **Tài liệu tham khảo trực quan**: [](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
You can use read replicas to improve the performance of your Amazon RDS MySQL DB by handling business reporting or data warehousing scenarios where you might want business reporting queries to run against your read replica, rather than your production database instance.

> 🔗 **Tài liệu tham khảo trực quan**: [You can create up to five read replicas from one DB instance. For replication to operate effectively, each read replica should have the same amount of compute and storage resources as the source database instance. If you scale the source database instance, also scale the read replicas.](https://docs.amazonaws.cn/en_us/AmazonRDS/latest/UserGuide/USER_MySQL.Replication.ReadReplicas.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a read-replica with half compute capacity and half storage capacity as the primary. Point the reporting queries to run against the read replica**:
  As mentioned in the explanation above, you should create a read-replica with the same compute capacity and the same storage capacity as the primary.

- Create a standby instance in a multi-AZ configuration with the same compute capacity and the same storage capacity as the primary. Point the reporting queries to run against the standby instance

- Create a standby instance in a multi-AZ configuration with half compute capacity and half storage capacity as the primary. Point the reporting queries to run against the standby instance

- Multi-AZ deployments are not a read scaling solution, so you cannot use a standby to serve read traffic. The standby is there just for failover. Hence both these options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonRDS - USER_ReadRepl](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
- 🌐 [docs.amazonaws.cn/en_us/AmazonRDS/latest/UserGuide/USER_MySQL.Replication.ReadReplicas.html](https://docs.amazonaws.cn/en_us/AmazonRDS/latest/UserGuide/USER_MySQL.Replication.ReadReplicas.html)

</details>

---

<div id="question-65"></div>

### Question 65: Low-Throughput Rapid On-Premises to AWS Interconnection via Site-to-Site VPN
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A retail company needs a secure connection between its on-premises data center and AWS Cloud. This connection does not need high bandwidth and will handle a small amount of traffic. The company wants a quick turnaround time to set up the connection.

What is the MOST cost-effective way to establish such a connection?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a bastion host on Amazon EC2
- **(B)** Set up an Internet Gateway between the on-premises data center and AWS cloud
- **(C)** Set up AWS Direct Connect
- **(D)** Set up an AWS Site-to-Site VPN connection `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up an AWS Site-to-Site VPN connection

By default, instances that you launch into an Amazon VPC can't communicate with your own (remote) network. You can enable access to your remote network from your VPC by creating an AWS Site-to-Site VPN (Site-to-Site VPN) connection, and configuring routing to pass traffic through the connection. A VPN connection refers to the connection between your VPC and your own on-premises network.

An AWS Site-to-Site VPN connection offers two VPN tunnels between a virtual private gateway or a transit gateway on the AWS side, and a customer gateway (which represents a VPN device) on the remote (on-premises) side.

A virtual private gateway (VGW) is the VPN concentrator on the Amazon side of the AWS Site-to-Site VPN connection. You create a virtual private gateway and attach it to the VPC from which you want to create the AWS Site-to-Site VPN connection.

> 🔗 **Tài liệu tham khảo trực quan**: [How virtual private gateway works:](https://docs.aws.amazon.com/vpn/latest/s2svpn/how_it_works.html)
An AWS transit gateway is a transit hub that you can use to interconnect your virtual private clouds (VPC) and on-premises networks. For more information, see Amazon VPC Transit Gateways. You can create a Site-to-Site VPN connection as an attachment on a transit gateway.

> 🔗 **Tài liệu tham khảo trực quan**: [How AWS transit gateway works:](https://docs.aws.amazon.com/vpn/latest/s2svpn/how_it_works.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up a bastion host on Amazon EC2**:
  A bastion host is a server whose purpose is to provide access to a private network from an external network, such as the Internet. The bastion host runs on an Amazon EC2 instance that is typically in a public subnet of your Amazon VPC. Other Amazon EC2 instances can be in a subnet that is not publicly accessible, and they are set up with a security group that allows SSH access from the security group attached to the underlying Amazon EC2 instance running the bastion host. A bastion host cannot be used to set up a connection between its on-premises data center and AWS Cloud.

- **Set up AWS Direct Connect**:
  AWS Direct Connect is a network service that provides an alternative to using the Internet to utilize AWS cloud services. AWS Direct Connect enables customers to have low latency, secure and private connections to AWS for workloads that require higher speed or lower latency than the internet. A Dedicated Connection is made through a 1 Gbps, 10 Gbps, or 100 Gbps Ethernet port dedicated to a single customer. AWS Direct Connect takes about a month to provision the connection, so this option is ruled out for the given use case.

- **Set up an Internet Gateway between the on-premises data center and AWS cloud**:
  An Internet Gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet. An Internet Gateway cannot be used to set up a connection between its on-premises data center and AWS Cloud.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpn - how_it_works](https://docs.aws.amazon.com/vpn/latest/s2svpn/how_it_works.html)
- 🌐 [AWS Docs: vpc - VPC_Internet_Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)

</details>

---

