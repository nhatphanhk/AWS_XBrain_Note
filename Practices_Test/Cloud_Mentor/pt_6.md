# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Cloud Mentor Practice Test 6

> **Nền tảng luyện thi**: Cloud Mentor AWS Practice Exams (SAA-C03)  
> **Bộ đề**: Practice Test 06 - Results & In-Depth Architecture Review (65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../../GLOSSARY.md) | [Cẩm nang từ vựng giải mã đề thi (EXAM_VOCABULARY.md)](./EXAM_VOCABULARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **34 câu** | $\ge 47$  câu (72%) | Chưa đạt tiêu chuẩn ❌ |
| **Số câu trả lời sai / bỏ qua (Incorrect & Skipped)** | **31 câu** | $\le 18$  câu | Cần tập trung ôn tập ⚠️ |
| **Tỷ lệ chính xác (Overall Score)** | **52.31% (~523 / 1000)** | $\ge 72.0\%$ (720 / 1000) | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 25 câu | 12 câu | 13 câu | **48%** | Cần củng cố 🔴 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 18 câu | 11 câu | 7 câu | **61.1%** | Cần củng cố 🔴 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 12 câu | 5 câu | 7 câu | **41.7%** | Cần củng cố 🔴 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 10 câu | 6 câu | 4 câu | **60%** | Cần củng cố 🔴 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **34 câu** | **31 câu** | **52.31%** | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

## 🎯 2. Danh Sách 31 Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp 31 câu trả lời chưa chính xác và bỏ qua trong bài thi thử này. Hãy rà soát kỹ các bẫy đề bài, nguyên lý kiến trúc cốt lõi và bài học thực tế trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 05** | Domain 3 | **S3 multipart uploads and Fetch multiple byte-ranges of an object in parallel** | Upload từ on-premises → S3<br>"Large files (GB-sized)" + "scale throughput upload" → S3 Multipart Upload | [👉 Xem](#question-05) |
| **Câu 11** | Domain 3 | **The applications in AWS Local Zones by extending the company's VPC from eu-central...** | chạy application với độ trễ single-digit millisecond (< 10ms)<br>"Single-digit millisecond latency" + "extend VPC" → AWS Local Zones | [👉 Xem](#question-11) |
| **Câu 13** | Domain 1 | **An IAM policy that allows users to create only encrypted Amazon Elastic Block Stor...** | Yêu cầu ít administrative overhead nhất<br>"Compliance + automatically detect" → AWS Config | [👉 Xem](#question-13) |
| **Câu 14** | Domain 1 | **A customer managed key** | mã hóa đầu cuối (encrypt at rest) với AWS KMS<br>"Control rotation" → Customer Managed Key (chỉ loại key này cho phép customer kiểm soát việc rotation của key) | [👉 Xem](#question-14) |
| **Câu 19** | Domain 3 | **A log group in Amazon CloudWatch Logs** | Cần thu thập traffic data từ network interfaces trong VPC (near real-time) của các service như NLB, EC2, v.v..<br>"Near real-time" → Nghĩ đến Firehose | [👉 Xem](#question-19) |
| **Câu 20** | Domain 1 | **Lock the EBS snapshots to prevent deletion** | Công ty tạo snapshot hàng ngày (daily snapshots) cho EBS volumes để đáp ứng compliance<br>"Prevent accidental deletion" + "snapshots" → EBS Snapshot Lock | [👉 Xem](#question-20) |
| **Câu 25** | Domain 1 | **Provision the AWS accounts by using AWS Control Tower** | LEAST operational overhead (ít vận hành nhất)<br>"Detect changes/drift in Organizations" → Control Tower drift notifications | [👉 Xem](#question-25) |
| **Câu 28** | Domain 1 | **Interface endpoints for Amazon S3** | traffic KHÔNG đi qua internet<br>"On-premises + Direct Connect/VPN + AWS service" → Interface Endpoints | [👉 Xem](#question-28) |
| **Câu 29** | Domain 2 | **The database to an Amazon RDS for MySQL Multi-AZ DB instance and an Application Lo...** | Startup đang chạy website trên 1 EC2 instance duy nhất<br>Đối với yêu cầu về tính khả dụng cao (high availability) thì nghĩ ngay đến Multi-AZ | [👉 Xem](#question-29) |
| **Câu 30** | Domain 1 | **AWS CloudFormation to set up the infrastructure** | Công ty muốn tự động hóa (automation) việc thiết lập hệ thống và hạ tầng mạng<br>"Automation + infrastructure" → Nghĩ đến CloudFormation (hoặc AWS CDK, SAM) | [👉 Xem](#question-30) |
| **Câu 31** | Domain 1 | **Organization units (OUs) for each department in AWS Organizations** | Giải pháp với LEAST operational overhead<br>Khi đề bài nhắc đến việc quản lý các account riêng lẻ, nghĩ đến Orgnizations | [👉 Xem](#question-31) |
| **Câu 32** | Domain 1 | **Implement an interface VPC endpoint for Amazon SQS** | Ứng dụng chạy trên EC2 trong private subnets<br>"Private subnet + AWS service" → Access từ private subnet đến service một cách an toàn thì nghĩ đến VPC Endpoint (Interface VPC Endpoint hoặc Gateway Endpoint) | [👉 Xem](#question-32) |
| **Câu 33** | Domain 1 | **Generate Amazon S3 presigned URLs in the application** | xử lý lưu lượng tăng đột biến (traffic surge) trong các sự kiện lớn<br>Đề bài yêu cầu upload ảnh cần có khả năng scale tốt, nghĩ đến S3 với Presigned URL | [👉 Xem](#question-33) |
| **Câu 34** | Domain 2 | **Storage autoscaling in RDS** | tự động tăng dung lượng không downtime (without downtime)<br>"Low on disk space" + RDS → Nghĩ đến Storage Autoscaling | [👉 Xem](#question-34) |
| **Câu 35** | Domain 3 | **A scheduled scaling policy for the Auto Scaling group to launch new instances befo...** | Ứng dụng chạy trên EC2 On-Demand trong Auto Scaling group<br>"Same time each day" / "predictable pattern" → Scheduled Scaling | [👉 Xem](#question-35) |
| **Câu 36** | Domain 1 | **AWS Snowball Edge Storage Optimized** | Công ty cần chuyển 50 TB dữ liệu lên AWS<br>Đối với dạng câu hỏi về việc migrate data từ on-premise lên AWS, cần xem xét các thông số sau: | [👉 Xem](#question-36) |
| **Câu 37** | Domain 3 | **Compute optimized EC2 instances into a cluster placement group and Attach the EC2 ...** | Yêu cầu solution phải có độ trễ thấp nhất (LEAST latency)<br>"HPC workloads" + "latency-sensitive" → Cluster Placement Group | [👉 Xem](#question-37) |
| **Câu 38** | Domain 2 | **An Amazon RDS proxy for the database** | giảm downtime khi scaling với ít operational overhead nhất<br>Để giảm thời gian downtime khi failover cho RDS / Aurora, sử dụng RDS Proxy | [👉 Xem](#question-38) |
| **Câu 39** | Domain 4 | **Images in Amazon S3 Standard-Infrequent Access (S3 Standard-IA)** | giải pháp lưu trữ có tính khả dụng cao highly available và cost-effective nhất<br>Cách lựa chọn các tầng lưu trữ cho S3: | [👉 Xem](#question-39) |
| **Câu 40** | Domain 1 | **A web ACL in AWS WAF and a public Application Load Balancer** | Yêu cầu 1: Cần solution support sticky session, cho phép truy cập tử internet vào<br>"Sticky sessions" + "Web application" → Application Load Balancer (ALB) | [👉 Xem](#question-40) |
| **Câu 41** | Domain 2 | **An Amazon CloudFront distribution with an Amazon S3 endpoint to an S3 bucket that ...** | Bao gồm: Apache (static content) → PHP app → local Redis (sessions)<br>"static content + high availability" → S3 + CloudFront | [👉 Xem](#question-41) |
| **Câu 42** | Domain 4 | **DynamoDB in on-demand mode by using the DynamoDB Standard table class** | cost-effective nhất<br>"Unpredictable traffic" → On-demand mode | [👉 Xem](#question-42) |
| **Câu 43** | Domain 4 | **A transient cluster that runs the primary node and core nodes on On-Demand Instanc...** | Workload chạy 6 giờ mỗi ngày<br>EMR đối với Primary Node & Core Node thì ưu tiên sử dụng loại EC2 có tính ổn định như On-demand | [👉 Xem](#question-43) |
| **Câu 45** | Domain 2 | **Amazon Transcribe to convert the audio recordings in any language into text and Am...** | Cần: chuyển đổi audio → text → dịch sang tiếng Anh → phân tích sentiment<br>"Audio/speech → text" → Amazon Transcribe | [👉 Xem](#question-45) |
| **Câu 46** | Domain 3 | **The General Purpose SSD (gp3) EBS volume storage type and provision 15,000 IOPS** | migrate sang RDS for PostgreSQL với khả năng setup IOPS độc lập không ràng buộc theo dung lượng ổ đĩa<br>"<64,000 IOPS + cost-effective" → gp3 | [👉 Xem](#question-46) |
| **Câu 48** | Domain 3 | **AWS Global Accelerator with health checks** | giảm thiểu độ trễ (minimize latency) cho users mà không dựa vào IP address caching trên thiết bị người dùng<br>"VoIP / real-time / UDP traffic" → AWS Global Accelerator | [👉 Xem](#question-48) |
| **Câu 49** | Domain 2 | **Amazon Machine Images (AMIs) to back up the EC2 instances** | Yêu cầu thời gian khôi phục RTO < 4 giờ<br>Khi nhắc đến DR thì cần nghĩ đến kiến trúc Multi-Region | [👉 Xem](#question-49) |
| **Câu 51** | Domain 2 | **AWS DataSync** | Cần transfer large amounts of data giữa NFS file systems ở 2 Regions cho mục đích DR (Disaster Recovery) định kỳ<br>"NFS/SMB file systems" + "transfer between regions" → AWS DataSync | [👉 Xem](#question-51) |
| **Câu 54** | Domain 4 | **Cost and Usage Reports in the management account** | scalable và cost-effective<br>Trong kiến trúc Organizations, các thao tác liên quan đến chi phí cần thực hiện từ management account, không thực hiện từ member account | [👉 Xem](#question-54) |
| **Câu 55** | Domain 1 | **Grant the decrypt permission for the Lambda IAM role in the KMS key's policy and a...** | Lambda function cần tải về và giải mã (decrypt) files từ S3<br>Để cấp quyền giải mã KMS, có thể thực hiện bằng một trong 2 cách: | [👉 Xem](#question-55) |
| **Câu 57** | Domain 1 | **Deleting Amazon EC2 instances** | Có 2 IAM policies gắn vào 1 IAM group như trên<br>Trong IAM Policy, các lệnh Deny luôn được ưu tiên hơn so với Allow | [👉 Xem](#question-57) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ✅ Đúng | [An Amazon Elastic Container Service (Amazon ECS) cluster with an Amazon EC2 launch...](#question-01) | Domain 4 |
| [02](#question-02) | ✅ Đúng | [Modify the Auto Scaling group to use EC2 instances across three Availability Zones](#question-02) | Domain 2 |
| [03](#question-03) | ✅ Đúng | [An A record with a latency policy](#question-03) | Domain 3 |
| [04](#question-04) | ✅ Đúng | [An Amazon S3 bucket to store the web content and an Amazon Elastic File System (Am...](#question-04) | Domain 2 |
| [05](#question-05) | ❌ Sai | [S3 multipart uploads and Fetch multiple byte-ranges of an object in parallel](#question-05) | Domain 3 |
| [06](#question-06) | ✅ Đúng | [An AWS Config rule for Amazon EBS to evaluate if a volume is encrypted and to flag...](#question-06) | Domain 1 |
| [07](#question-07) | ✅ Đúng | [Individual users in IAM Identity Center](#question-07) | Domain 1 |
| [08](#question-08) | ✅ Đúng | [AWS DataSync to migrate the data from the on-premises location to an S3 bucket](#question-08) | Domain 1 |
| [09](#question-09) | ✅ Đúng | [AWS CloudTrail](#question-09) | Domain 1 |
| [10](#question-10) | ✅ Đúng | [Point the client driver at an RDS proxy endpoint](#question-10) | Domain 1 |
| [11](#question-11) | ❌ Sai | [The applications in AWS Local Zones by extending the company's VPC from eu-central...](#question-11) | Domain 3 |
| [12](#question-12) | ✅ Đúng | [The database to an Amazon RDS Multi-AZ deployment and the web tier to Amazon EC2 i...](#question-12) | Domain 2 |
| [13](#question-13) | ❌ Sai | [An IAM policy that allows users to create only encrypted Amazon Elastic Block Stor...](#question-13) | Domain 1 |
| [14](#question-14) | ❌ Sai | [A customer managed key](#question-14) | Domain 1 |
| [15](#question-15) | ✅ Đúng | [The request to terminate the EC2 instance does not originate from the CIDR blocks 192](#question-15) | Domain 1 |
| [16](#question-16) | ✅ Đúng | [An AWS Glue crawler to discover the data](#question-16) | Domain 2 |
| [17](#question-17) | ✅ Đúng | [Amazon DynamoDB Accelerator (DAX) for the new messages table](#question-17) | Domain 3 |
| [18](#question-18) | ✅ Đúng | [Ensure that the customers create an IAM role in their account with read-only EC2 a...](#question-18) | Domain 1 |
| [19](#question-19) | ❌ Sai | [A log group in Amazon CloudWatch Logs](#question-19) | Domain 3 |
| [20](#question-20) | ❌ Sai | [Lock the EBS snapshots to prevent deletion](#question-20) | Domain 1 |
| [21](#question-21) | ✅ Đúng | [A read replica for the DB instance and an Amazon ElastiCache cluster](#question-21) | Domain 3 |
| [22](#question-22) | ✅ Đúng | [An Amazon S3 File Gateway to increase the company's storage space](#question-22) | Domain 4 |
| [23](#question-23) | ✅ Đúng | [An AWS Glue crawler to crawl the data](#question-23) | Domain 2 |
| [24](#question-24) | ✅ Đúng | [An AWS Cost Anomaly Detection monitor in the AWS Billing and Cost Management console](#question-24) | Domain 1 |
| [25](#question-25) | ❌ Sai | [Provision the AWS accounts by using AWS Control Tower](#question-25) | Domain 1 |
| [26](#question-26) | ✅ Đúng | [Integrate AWS Secrets Manager with Amazon RDS for PostgreSQL to automate password ...](#question-26) | Domain 1 |
| [27](#question-27) | ✅ Đúng | [A VPC peering connection between the VPCs](#question-27) | Domain 4 |
| [28](#question-28) | ❌ Sai | [Interface endpoints for Amazon S3](#question-28) | Domain 1 |
| [29](#question-29) | ❌ Sai | [The database to an Amazon RDS for MySQL Multi-AZ DB instance and an Application Lo...](#question-29) | Domain 2 |
| [30](#question-30) | ❌ Sai | [AWS CloudFormation to set up the infrastructure](#question-30) | Domain 1 |
| [31](#question-31) | ❌ Sai | [Organization units (OUs) for each department in AWS Organizations](#question-31) | Domain 1 |
| [32](#question-32) | ❌ Sai | [Implement an interface VPC endpoint for Amazon SQS](#question-32) | Domain 1 |
| [33](#question-33) | ❌ Sai | [Generate Amazon S3 presigned URLs in the application](#question-33) | Domain 1 |
| [34](#question-34) | ❌ Sai | [Storage autoscaling in RDS](#question-34) | Domain 2 |
| [35](#question-35) | ❌ Sai | [A scheduled scaling policy for the Auto Scaling group to launch new instances befo...](#question-35) | Domain 3 |
| [36](#question-36) | ❌ Sai | [AWS Snowball Edge Storage Optimized](#question-36) | Domain 1 |
| [37](#question-37) | ❌ Sai | [Compute optimized EC2 instances into a cluster placement group and Attach the EC2 ...](#question-37) | Domain 3 |
| [38](#question-38) | ❌ Sai | [An Amazon RDS proxy for the database](#question-38) | Domain 2 |
| [39](#question-39) | ❌ Sai | [Images in Amazon S3 Standard-Infrequent Access (S3 Standard-IA)](#question-39) | Domain 4 |
| [40](#question-40) | ❌ Sai | [A web ACL in AWS WAF and a public Application Load Balancer](#question-40) | Domain 1 |
| [41](#question-41) | ❌ Sai | [An Amazon CloudFront distribution with an Amazon S3 endpoint to an S3 bucket that ...](#question-41) | Domain 2 |
| [42](#question-42) | ❌ Sai | [DynamoDB in on-demand mode by using the DynamoDB Standard table class](#question-42) | Domain 4 |
| [43](#question-43) | ❌ Sai | [A transient cluster that runs the primary node and core nodes on On-Demand Instanc...](#question-43) | Domain 4 |
| [44](#question-44) | ✅ Đúng | [Transition the objects to S3 Standard-Infrequent Access (S3 Standard-IA) after 180...](#question-44) | Domain 4 |
| [45](#question-45) | ❌ Sai | [Amazon Transcribe to convert the audio recordings in any language into text and Am...](#question-45) | Domain 2 |
| [46](#question-46) | ❌ Sai | [The General Purpose SSD (gp3) EBS volume storage type and provision 15,000 IOPS](#question-46) | Domain 3 |
| [47](#question-47) | ✅ Đúng | [Amazon FSx for Lustre persistent file systems](#question-47) | Domain 3 |
| [48](#question-48) | ❌ Sai | [AWS Global Accelerator with health checks](#question-48) | Domain 3 |
| [49](#question-49) | ❌ Sai | [Amazon Machine Images (AMIs) to back up the EC2 instances](#question-49) | Domain 2 |
| [50](#question-50) | ✅ Đúng | [An AWS Key Management Service (AWS KMS) external key store backed by an external k...](#question-50) | Domain 1 |
| [51](#question-51) | ❌ Sai | [AWS DataSync](#question-51) | Domain 2 |
| [52](#question-52) | ✅ Đúng | [The logs in Amazon S3](#question-52) | Domain 4 |
| [53](#question-53) | ✅ Đúng | [Attach a Network Load Balancer to the Auto Scaling group](#question-53) | Domain 2 |
| [54](#question-54) | ❌ Sai | [Cost and Usage Reports in the management account](#question-54) | Domain 4 |
| [55](#question-55) | ❌ Sai | [Grant the decrypt permission for the Lambda IAM role in the KMS key's policy and a...](#question-55) | Domain 1 |
| [56](#question-56) | ✅ Đúng | [Versioning on the bucket and MFA Delete on the bucket](#question-56) | Domain 1 |
| [57](#question-57) | ❌ Sai | [Deleting Amazon EC2 instances](#question-57) | Domain 1 |
| [58](#question-58) | ✅ Đúng | [Amazon DynamoDB and AWS Lambda](#question-58) | Domain 2 |
| [59](#question-59) | ✅ Đúng | [An Amazon FSx for Windows File Server file system](#question-59) | Domain 2 |
| [60](#question-60) | ✅ Đúng | [Multi-factor authentication to the root user and Ensure the root user uses a stron...](#question-60) | Domain 1 |
| [61](#question-61) | ✅ Đúng | [Extend the application to add an attribute that has a value of the current timesta...](#question-61) | Domain 2 |
| [62](#question-62) | ✅ Đúng | [A read replica from the source DB instance](#question-62) | Domain 3 |
| [63](#question-63) | ✅ Đúng | [AWS Transfer Family with SFTP for Amazon S3](#question-63) | Domain 2 |
| [64](#question-64) | ✅ Đúng | [A target tracking policy to dynamically scale the Auto Scaling group](#question-64) | Domain 2 |
| [65](#question-65) | ✅ Đúng | [An AWS Lambda function triggered by an Amazon EventBridge scheduled event](#question-65) | Domain 4 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi & Phân Tích Kiến Trúc (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: An Amazon Elastic Container Service (Amazon ECS) cluster with an Amazon EC2 launch...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An ecommerce company needs to run a scheduled daily job to aggregate and filter sales records for analytics. The company stores the sales records in an Amazon S3 bucket. Each object can be up to 10 GB in size. Based on the number of sales events, the job can take up to an hour to complete. The CPU and memory usage of the job are constant and are known in advance.

A solutions architect needs to minimize the amount of operational effort that is needed for the job to run.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon Elastic Container Service (Amazon ECS) cluster with an AWS Fargate launch type. Create an Amazon EventBridge scheduled event that launches an ECS task on the cluster to run the job.
- **(B)** Create an AWS Lambda function. Create an Amazon API Gateway HTTP API, and integrate the API with the function. Create an Amazon EventBridge scheduled event that calls the API and invokes the function.
- **(C)** Create an Amazon Elastic Container Service (Amazon ECS) cluster with an Amazon EC2 launch type and an Auto Scaling group with at least one EC2 instance. Create an Amazon EventBridge scheduled event that launches an ECS task on the cluster to run the job. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an AWS Lambda function that has an Amazon EventBridge notification. Schedule the EventBridge event to run once a day.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty ecommerce cần chạy job hàng ngày theo lịch
> - Dữ liệu lưu trong S3 bucket, mỗi object lên đến 10 GB
> - Job có thể chạy đến 1 giờ
> - CPU và memory sử dụng ổn định và biết trước
> - Yêu cầu: tối thiểu hóa operational effort

**Phân tích giải pháp tối ưu:**
Create an Amazon Elastic Container Service (Amazon ECS) cluster with an AWS Fargate launch type. Create an Amazon EventBridge scheduled event that launches an ECS task on the cluster to run the job.

ECS Fargate phù hợp với job chạy lâu (1 giờ) và có Storage tối thiểu 20GB, đáp ứng yêu cầu xử lý file lớn (10 GB)

Fargate là platform chạy serverless container do đó có operational effort thấp nhất

EventBridge scheduled event kích hoạt task hàng ngày tự động

CPU/memory ổn định và biết trước → dễ dàng cấu hình task definition

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS Lambda function that has an Amazon EventBridge notification. Schedule the EventBridge event to run once a day.**:
  Lambda có timeout tối đa 15 phút, không thể chạy job 1 giờ

- **Create an AWS Lambda function. Create an Amazon API Gateway HTTP API, and integrate the API with the function. Create an Amazon EventBridge scheduled event that calls the API and invokes the function.**:
  Vẫn sử dụng Lambda → vẫn bị giới hạn 15 phút timeout

- **Create an Amazon Elastic Container Service (Amazon ECS) cluster with an Amazon EC2 launch type and an Auto Scaling group with at least one EC2 instance. Create an Amazon EventBridge scheduled event that launches an ECS task on the cluster to run the job.**:
  ECS chạy trên EC2 launch type sẽ tốn operational effort do phải maintain Auto Scaling group, patching, monitoring EC2
  Fargate serverless là sự lựa chọn tốt hơn khi cân nhắc về mặt effort vận hành

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Scheduled job/daily" → Nghĩ đến EventBridge Scheduler
- Đối với các câu hỏi về việc chạy job thì các solution thường nghĩ đến đó là AWS Lambda, ECS Fargate, Batch, EC2 Spot Instances.
- Đầu tiên cần xem thời gian chạy job là bao lâu, nếu trên 15 phút sẽ loại ngay Lambda, ưu tiên chọn các solution managed, serverless như ECS Fargate, Batch.
- Nếu thời gian dưới 15 phút thì thường sẽ lựa chọn Lambda

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using Amazon EventBridge Scheduler to schedule Amazon ECS tasks

</details>

---

<div id="question-02"></div>

### Question 02: Modify the Auto Scaling group to use EC2 instances across three Availability Zones
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has a web application that includes an embedded NoSQL database. The application runs on Amazon EC2 instances behind an Application Load Balancer (ALB). The instances run in an Amazon EC2 Auto Scaling group in a single Availability Zone.

A recent increase in traffic requires the application to be highly available and for the database to be eventually consistent.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Replace the ALB with a Network Load Balancer. Maintain the embedded NoSQL database with its replication service on the EC2 instances.
- **(B)** Replace the ALB with a Network Load Balancer. Migrate the embedded NoSQL database to Amazon DynamoDB by using AWS Database Migration Service (AWS DMS).
- **(C)** Modify the Auto Scaling group to use EC2 instances across three Availability Zones. Maintain the embedded NoSQL database with its replication service on the EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Modify the Auto Scaling group to use EC2 instances across three Availability Zones. Migrate the embedded NoSQL database to Amazon DynamoDB by using AWS Database Migration Service (AWS DMS).

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web app chạy trên EC2 instances sau Application Load Balancer (ALB)
> - Dùng embedded NoSQL database (database chạy cùng EC2)
> - Hiện tại chỉ chạy trong 1 Availability Zone
> - Traffic tăng → cần high availability và eventually consistent database
> - Yêu cầu: LEAST operational overhead (ít vận hành nhất)

**Phân tích giải pháp tối ưu:**
Modify the Auto Scaling group to use EC2 instances across three Availability Zones. Migrate the embedded NoSQL database to Amazon DynamoDB by using AWS Database Migration Service (AWS DMS).

Multi-AZ deployment (3 AZs) : Đề bài yêu cầu tính khả dụng cao mà EC2 chỉ chạy trên 1 zone, do đó cần sử dụng Auto Scaling Group để triển khai EC2 trên nhiều zone

DynamoDB là serverless NoSQL database có tính eventually consistent, tự động scale, không cần quản lý gì cả, đáp ứng yêu cầu ít effort vận hành

AWS DMS là service cho phép migrate database từ EC2 sang DynamoDB một cách tự động hoá, đáp ứng yêu cầu giảm effort vận hành

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Replace the ALB with a Network Load Balancer. Maintain the embedded NoSQL database with its replication service on the EC2 instances.**:
  Thay ALB → NLB vẫn không cải thiện gì về tính khả dụng cao high availability (vẫn chỉ 1 AZ)
  Vẫn sử dụng embedded database trong EC2 nên sẽ tốn operational overhead

- **(B) Replace the ALB with a Network Load Balancer. Migrate the embedded NoSQL database to Amazon DynamoDB by using AWS Database Migration Service (AWS DMS).**:
  Thay ALB → NLB vẫn không cải thiện gì về tính khả dụng cao high availability (vẫn chỉ 1 AZ)
  Chưa giải quyết được vấn đề Multi-AZ

- **(C) Modify the Auto Scaling group to use EC2 instances across three Availability Zones. Maintain the embedded NoSQL database with its replication service on the EC2 instances.**:
  Mặc dù triển khai EC2 trên Multi-AZ là đúng, nhưng embedded database vẫn chạy trong EC2, tốn effort vận hành
  Không tận dụng được managed service để giảm vận hành

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "LEAST operational overhead" → Ưu tiên các managed service, serverless service, tránh các solution tự deploy và vận hành trên EC2

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using an Amazon DynamoDB database as a target for AWS Database Migration Service

</details>

---

<div id="question-03"></div>

### Question 03: An A record with a latency policy
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is deploying an application in three AWS Regions using an Application Load Balancer. Amazon Route 53 will be used to distribute traffic between these Regions.

Which Route 53 configuration should a solutions architect use to provide the MOST high-performing experience?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a CNAME record with a geoproximity policy.
- **(B)** Create an A record with a geolocation policy.
- **(C)** Create a CNAME record with a failover policy.
- **(D)** Create an A record with a latency policy. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty deploy ứng dụng trên 3 AWS Regions với Application Load Balancer
> - Dùng Route 53 để phân phối traffic giữa các regions
> - Yêu cầu: chọn loại configuration Route53 có performance cao nhất (MOST high-performing)

**Phân tích giải pháp tối ưu:**
Create an A record with a latency policy.

Latency-based routing là routing policy giúp tự động điều hướng user đến region có độ trễ thấp nhất từ vị trí của họ, đảm bảo trải nghiệm nhanh nhất. Route 53 đo lường latency thực tế giữa user và các AWS regions, sau đó chọn region tối ưu.

A record có thể trỏ trực tiếp đến ALB (thông qua alias record), hiệu quả hơn CNAME.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an A record with a geolocation policy.**:
  Geolocation policy giúp routing dựa trên theo vị trí địa lý của người dùng nhưng không đo lường latency thực tế
  Có thể route user đến region gần về mặt địa lý nhưng không đảm bảo latency thấp nhất

- **Create a CNAME record with a failover policy.**:
  Failover policy chỉ dùng cho phục hồi sau sự cố disaster recovery, cho phép routing traffic sang region phụ khi region chính gặp sự cố
  Không có cơ chế tối ưu performance như latency based routing

- **Create a CNAME record with a geoproximity policy.**:
  Geoproximity routing cho phép định tuyến dựa theo resource. Ví dụ ở Mỹ có server to, ở VN có server nhỏ, khi người dùng VN quá nhiều không đáp ứng được thì có thể điều hướng một phần qua server to ở Mỹ.
  Không có cơ chế đo lường latency thực tế như latency-based routing

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Dùng A Record (Alias) để trỏ domain đến các service: ALB, NLB, CloudFront, API Gateway, S3 website, Elastic Beanstalk
- Dùng CNAME để trỏ subdomain đến domain khác (thường đối với các resource không nằm trong AWS)
- "high-performing" / "lowest latency" / "best performance" → Latency-based routing

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Choosing a routing policy

</details>

---

<div id="question-04"></div>

### Question 04: An Amazon S3 bucket to store the web content and an Amazon Elastic File System (Am...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (D) | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A solutions architect is designing a shared storage solution for a web application that is deployed across multiple Availability Zones. The web application runs on Amazon EC2 instances that are in an Auto Scaling group. The company plans to make frequent changes to the content. The solution must have strong consistency in returning the new content as soon as the changes occur.

Which solutions meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS DataSync to perform continuous synchronization of data between EC2 hosts in the Auto Scaling group.
- **(B)** Use AWS Storage Gateway Volume Gateway Internet Small Computer Systems Interface (iSCSI) block storage that is mounted to the individual EC2 instances.
- **(C)** Create an Amazon Elastic File System (Amazon EFS) file system. Mount the EFS file system on the individual EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Amazon S3 bucket to store the web content. Set the metadata for the Cache-Control header to no-cache. Use Amazon CloudFront to deliver the content. `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Create a shared Amazon Elastic Block Store (Amazon EBS) volume. Mount the EBS volume on the individual EC2 instances.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng web chạy nhiều EC2 instances trong Auto Scaling group trên nhiều AZs
> - Cần shared storage (lưu trữ dùng chung)
> - Các nội dung lưu trữ thay đổi thường xuyên (frequent changes)
> - Yêu cầu storage có tính strong consistency - tức là khi update thay đổi nội dung thì sẽ phản ánh ngay mà không có độ trễ

**Phân tích giải pháp tối ưu:**
Create an Amazon Elastic File System (Amazon EFS) file system. Mount the EFS file system on the individual EC2 instances.

EFS là dịch vụ shared file storage (NFS) của AWS, cho phép nhiều EC2 instances (Linux) trên nhiều AZs cùng gắn và truy cập đồng thời vào cùng một file system, tự động scale theo dung lượng sử dụng.

EFS có tính Strong consistency - data mới sau khi ghi sẽ được phản ánh để đọc ngay mà không có độ trễ

Create an Amazon S3 bucket to store the web content. Set the metadata for the Cache-Control header to no-cache. Use Amazon CloudFront to deliver the content.

S3 cũng có tính strong consistency giống như EFS, phù hợp cho việc lưu trữ file

Kết hợp với CloudFront sẽ giúp giảm độ trễ, tăng performance cho việc delivery file đến người dùng

Tuy nhiên CloudFront có cơ chế caching file, có thể sẽ ảnh hưởng đến tính strong consistency vì đôi khi sau khi udpate data bên S3 xong thì trong cache của CloudFront vẫn chưa phản ánh data mới nhất

Set Cache-Control: no-cache sẽ bắt buộc CloudFront luôn bỏ qua cache để lấy data mới nhất từ S3

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use AWS Storage Gateway Volume Gateway Internet Small Computer Systems Interface (iSCSI) block storage that is mounted to the individual EC2 instances.**:
  Storage Gateway Volume Gateway là service storage hybrid được thiết kế chủ yếu dùng cho môi trường on-premise, không phù hợp sử dụng cho môi trường cloud
  Sử dụng service sai mục đích

- **Create a shared Amazon Elastic Block Store (Amazon EBS) volume. Mount the EBS volume on the individual EC2 instances.**:
  EBS volume thường chỉ có thể attach vào một EC2 instance duy nhất tại một thời điểm
  EBS Multi-Attach (io1/io2) mặc dù có hỗ trợ attach nhiều instances nhưng chỉ trong cùng một AZ, chi phí rất cao

- **(A) Use AWS DataSync to perform continuous synchronization of data between EC2 hosts in the Auto Scaling group.**:
  DataSync là công cụ migration/transfer data giữa on-premises và AWS hoặc giữa các AWS services
  Không phải shared storage solution - chỉ là công cụ đồng bộ data
  Sử dụng service sai mục đích

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Shared storage + multiple EC2" → Amazon EFS
- "Web content + global delivery" → S3 + CloudFront

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon S3 Strong Consistency
- Amazon EFS provides the same file system access semantics, such as strong data consistency and file locking

</details>

---

<div id="question-05"></div>

### Question 05: S3 multipart uploads and Fetch multiple byte-ranges of an object in parallel
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C), (E)

#### 📋 Đề bài (Scenario)
A company regularly uploads GB-sized files to Amazon S3. After the company uploads the files, the company uses a fleet of Amazon EC2 Spot Instances to transcode the file format. The company needs to scale throughput when the company uploads data from the on-premises data center to Amazon S3 and when the company downloads data from Amazon S3 to the EC2 instances.

Which solutions will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Upload the files into multiple S3 buckets.
- **(B)** Use the S3 bucket access point instead of accessing the S3 bucket directly.
- **(C)** Fetch multiple byte-ranges of an object in parallel. `[Đáp án đúng ✅]`
- **(D)** Add a random prefix to each object when uploading the files.
- **(E)** Use S3 multipart uploads. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty upload file có kích thước hàng GB lên S3 thường xuyên
> - Sau khi upload, dùng fleet EC2 Spot Instances để xử lý file
> - Cần scale throughput cho 2 tác vụ:
> - Upload từ on-premises → S3
> - Download từ S3 → EC2 instances

**Phân tích giải pháp tối ưu:**
Use S3 multipart uploads.

S3 multipart upload cho phép chia file lớn thành nhiều phần và upload song song (parallel), giúp tăng throughput đáng kể

Đặc biệt hiệu quả với file có kích thước hàng GB (AWS khuyến nghị dùng multipart upload cho file >100MB)

Fetch multiple byte-ranges of an object in parallel.

Byte-range fetches cho phép download song song nhiều phần của object cùng lúc thay vì lần lượt từng phần, từ đó giúp tăng throughput khi download từ S3 xuống EC2

Đáp ứng yêu cầu "scale throughput when downloading"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use the S3 bucket access point instead of accessing the S3 bucket directly.**:
  S3 Access Point cho phép tạo ra các điểm truy cập S3, mỗi điểm có thể setup policy và kiểm soát quyền truy cập riêng (access control tốt hơn), nhưng không cải thiện throughput hay performance

- **(A) Upload the files into multiple S3 buckets.**:
  S3 bucket đã tự động scale throughput, không cần chia thành nhiều bucket
  Tạo thêm tính phức tạp không cần thiết trong quản lý và vận hành
  Không giải quyết vấn đề tăng tốc từng file upload/download

- **Add a random prefix to each object when uploading the files.**:
  AWS đã cải thiện S3 performance (từ 2018), hiện tại mỗi prefix có thể đáp ứng 3500 PUT Request và 5000 Get request, không còn cần random prefix để đảm bảo performance upload nữa (trước 2018 vẫn cần)
  S3 hiện tại tự động phân tán request, random prefix không còn cải thiện performance

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Large files (GB-sized)" + "scale throughput upload" → S3 Multipart Upload
- "Scale throughput download" + "parallel" → Byte-range fetches

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Uploading large objects to Amazon S3 using multipart upload and transfer acceleration

</details>

---

<div id="question-06"></div>

### Question 06: An AWS Config rule for Amazon EBS to evaluate if a volume is encrypted and to flag...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to standardize its Amazon Elastic Block Store (Amazon EBS) volume encryption strategy. The company also wants to minimize the cost and configuration effort required to operate the volume encryption check.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Write API calls to describe the EBS volumes and to confirm the EBS volumes are encrypted. Use Amazon EventBridge to schedule an AWS Lambda function to run the API calls.
- **(B)** Create an AWS Identity and Access Management (IAM) policy that requires the use of tags on EBS volumes. Use AWS Cost Explorer to display resources that are not properly tagged. Encrypt the untagged resources manually.
- **(C)** Write API calls to describe the EBS volumes and to confirm the EBS volumes are encrypted. Run the API calls on an AWS Fargate task.
- **(D)** Create an AWS Config rule for Amazon EBS to evaluate if a volume is encrypted and to flag the volume if it is not encrypted. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty muốn chuẩn hóa việc mã hóa cho EBS volumes
> - Yêu cầu giảm thiểu chi phí (cost) và effort config để vận hành việc kiểm tra mã hóa volume
> - Cần một giải pháp đáp ứng các yêu cầu trên

**Phân tích giải pháp tối ưu:**
Create an AWS Config rule for Amazon EBS to evaluate if a volume is encrypted and to flag the volume if it is not encrypted.

AWS Config là dịch vụ quản lý giúp đánh giá, kiểm tra và ghi lại cấu hình AWS resource theo thời gian, giúp đảm bảo tuân thủ (compliance) với các quy định và chính sách an ninh do công ty đặt ra

Cung cấp khả năng theo dõi resource tự động và liên tục mà không cần phải viết code

Giảm thiểu chi phí vì là managed service

Giảm thiểu effort config vì chỉ cần tạo rule một lần và AWS Config sẽ tự động giám sát tất cả các resource thuộc đối tượng giám sát được tạo ra sau này

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Write API calls to describe the EBS volumes and to confirm the EBS volumes are encrypted. Use Amazon EventBridge to schedule an AWS Lambda function to run the API calls.**:
  Yêu cầu viết code để gọi API và logic kiểm tra xem EBS có encryption hay không
  Cần cấu hình Lambda và EventBridge schedule
  Tốn effort config và coding Lambda

- **(C) Write API calls to describe the EBS volumes and to confirm the EBS volumes are encrypted. Run the API calls on an AWS Fargate task.**:
  Solution cần phải viết code tương tự như đáp án Lambda ở trên
  Cần cấu hình Fargate tasks và quản lý việc triển khai

- **Create an AWS Identity and Access Management (IAM) policy that requires the use of tags on EBS volumes. Use AWS Cost Explorer to display resources that are not properly tagged. Encrypt the untagged resources manually.**:
  IAM Policy không có cơ chế nào cho việc bắt buộc các EBS phải mã hoá cả
  Hơn nữa việc mã hoá thủ công các EBS sẽ rất tốn effort, không phù hợp yêu cầu

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Khi gặp câu hỏi về việc đảm bảo tuân thủ, chuẩn hoá cấu hình thì thường sẽ nghĩ đến AWS Config

#### 📚 Tài liệu tham khảo chính thức (Official References):
- ec2-ebs-encryption-by-default

</details>

---

<div id="question-07"></div>

### Question 07: Individual users in IAM Identity Center
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company manages AWS accounts in AWS Organizations. AWS IAM Identity Center (AWS Single Sign-On) and AWS Control Tower are configured for the accounts. The company wants to manage multiple user permissions across all the accounts.

The permissions will be used by multiple users and must be split between the developer and administrator teams. Each team requires different permissions. The company wants a solution that includes new users that are hired on both teams.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create individual users in IAM Identity Center for each account. Create separate developer and administrator groups in IAM Identity Center. Assign the users to the appropriate groups. Create a custom IAM policy for each group to set fine-grained permissions.
- **(B)** Create individual users in IAM Identity Center for each account. Create separate developer and administrator groups in IAM Identity Center. Assign the users to the appropriate groups. Attach AWS managed IAM policies to each user as needed for fine-grained permissions.
- **(C)** Create individual users in IAM Identity Center. Create new developer and administrator groups in IAM Identity Center. Create new permission sets that include the appropriate IAM policies for each group. Assign the new groups to the appropriate accounts. Assign the new permission sets to the new groups. When new users are hired, add them to the appropriate group. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create individual users in IAM Identity Center. Create new permission sets that include the appropriate IAM policies for each user. Assign the users to the appropriate accounts. Grant additional IAM permissions to the users from within specific accounts. When new users are hired, add them to IAM Identity Center and assign them to the accounts.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty dùng AWS Organizations với IAM Identity Center
> - Cần quản lý quyền cho nhiều user trên nhiều tài khoản AWS
> - Có 2 nhóm: developer và administrator - mỗi nhóm cần quyền khác nhau
> - Cần giải pháp cấp tài khoản dễ mở rộng khi có nhân viên mới
> - Yêu cầu: LEAST operational overhead (ít tác vụ vận hành nhất)

**Phân tích giải pháp tối ưu:**
Create individual users in IAM Identity Center. Create new developer and administrator groups in IAM Identity Center. Create new permission sets that include the appropriate IAM policies for each group. Assign the new groups to the appropriate accounts. Assign the new permission sets to the new groups. When new users are hired, add them to the appropriate group.

IAM Identity Center (trước gọi là AWS SSO) là dịch vụ quản lý Single Sign-On tập trung cho phép users đăng nhập một lần mà vẫn có thể truy cập nhiều AWS accounts hoặc ứng dụng mà không cần tạo IAM user riêng lẻ cho từng account.

IAM Identity Center có thể liên kết trực tiếp với AWS Organizations hiện tại, có thể quản lý quyền tập trung cho các account thông qua Permission sets (tương tự như IAM Policy, cho phép định nghĩa các quyền hạn đối tượng có thể sử dụng, liên kết theo từng account)

Có 2 nhóm là developer và administrator nên sẽ tạo 2 group tương ứng trong Identity Center, mỗi group sẽ có Permission Set riêng

Khi có user mới, chỉ cần add vào group → tự động kế thừa quyền trong Permission Set của Group đó và có quyền thao tác với các account đã liên kết trong Permission Set

Tổng thể kiến trúc này áp dụng best practice quản lý multi-account của AWS thông qua Identity Center, giúp giảm thiểu overhead, không phải cấu hình quyền cho từng account riêng lẻ

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create individual users in IAM Identity Center for each account. Create separate developer and administrator groups in IAM Identity Center. Assign the users to the appropriate groups. Create a custom IAM policy for each group to set fine-grained permissions.**:
  "users in IAM Identity Center for each account" → Tạo user cho mỗi account là không cần thiết, do Identity Center được thiết kế để một user có thể đăng nhập một lần và truy cập nhiều account
  Không sử dụng permission sets → thiếu cơ chế quản lý permissions cho nhiều accounts

- **Create individual users in IAM Identity Center for each account. Create separate developer and administrator groups in IAM Identity Center. Assign the users to the appropriate groups. Attach AWS managed IAM policies to each user as needed for fine-grained permissions.**:
  Sai tương tự như đáp án trên

- **Create individual users in IAM Identity Center. Create new permission sets that include the appropriate IAM policies for each user. Assign the users to the appropriate accounts. Grant additional IAM permissions to the users from within specific accounts. When new users are hired, add them to IAM Identity Center and assign them to the accounts.**:
  "permission sets for each user" → quản lý permission cho từng user sẽ làm tăng overhead so với quản lý theo từng group
  Không dùng chức năng groups của Identity Center → mỗi lần thêm user phải setup permissions riêng lẻ, gây tốn effort

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "IAM Identity Center + multiple accounts" → Permission Sets

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Manage multiple accounts using IAM Identity Center

</details>

---

<div id="question-08"></div>

### Question 08: AWS DataSync to migrate the data from the on-premises location to an S3 bucket
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company wants to migrate 100 GB of historical data from an on-premises location to an Amazon S3 bucket. The company has a 100 megabits per second (Mbps) internet connection on premises. The company needs to encrypt the data in transit to the S3 bucket. The company will store new data directly in Amazon S3.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use the s3 sync command in the AWS CLI to move the data directly to an S3 bucket
- **(B)** Use AWS DataSync to migrate the data from the on-premises location to an S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use AWS Snowball to move the data to an S3 bucket
- **(D)** Set up an IPsec VPN from the on-premises location to AWS. Use the s3 cp command in the AWS CLI to move the data directly to an S3 bucket

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần migrate 100 GB data từ on-premises lên S3 bucket
> - Băng thông: 100 Mbps internet connection
> - Yêu cầu: encrypt data in transit (mã hóa dữ liệu truyền tải)
> - Mục tiêu: LEAST operational overhead (ít vận hành nhất)

**Phân tích giải pháp tối ưu:**
Use AWS DataSync to migrate the data from the on-premises location to an S3 bucket

→ DataSync là dịch vụ được thiết kế sẵn cho data migration, tự động xử lý:

DataSync là service cho phép migrate data từ On-premise lên AWS, hoặc giữa các AWS service với nhau qua đường truyền online

Có support encryption in transit (TLS mặc định)

Có khả năng tự động xử lý & retry khi xảy ra lỗi

Có tối ưu băng thông qua việc tự động nén data trong quá trình truyển tải

Tự động hóa kiểm tra tính hợp lệ của file (validation) sau khi transfer

→ Chỉ cần cài DataSync agent về phía on-premises, cấu hình task transfer data và chạy. Operational overhead thấp nhất vì toàn bộ logic migration đã được AWS quản lý sẵn.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use the s3 sync command in the AWS CLI to move the data directly to an S3 bucket**:
  Sử dụng CLI thì cần tự viết script, tự xử lý retry, monitoring, error handling
  Không tối ưu và operational overhead cao hơn DataSync

- **(C) Use AWS Snowball to move the data to an S3 bucket**:
  Snowball phù hợp cho data lớn >10TB hoặc băng thông kém
  Với lượng data rất nhỏ là 100 GB thì băng thông hiện tại 100 Mbps hoàn toàn đáp ứng được (hết khoảng ~3 giờ)
  Snowball yêu cầu đặt device, chờ giao hàng, gửi lại → overhead cao, không cần thiết cho case này

- **(D) Set up an IPsec VPN from the on-premises location to AWS. Use the s3 cp command in the AWS CLI to move the data directly to an S3 bucket**:
  Setup VPN phức tạp (cấu hình VPN gateway, routing, security groups...)
  Vẫn cần tự code logic với AWS CLI
  Operational overhead rất cao, tăng độ phức tạp không cần thiết

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "100 GB + 100 Mbps" → Internet migration khả thi, không cần Snowball
- "LEAST operational overhead" + migration → AWS DataSync (managed service)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How AWS DataSync works

</details>

---

<div id="question-09"></div>

### Question 09: AWS CloudTrail
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An IAM user made several configuration changes to AWS resources in their company's account during a production deployment last week. A solutions architect learned that a couple of security group rules are not configured as desired. The solutions architect wants to confirm which IAM user was responsible for making changes.

Which service should the solutions architect use to find the desired information?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS CloudTrail `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Amazon Inspector
- **(C)** AWS Config
- **(D)** Amazon GuardDuty

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - IAM user đã thực hiện nhiều thay đổi cấu hình (configuration changes) trên AWS resources tuần trước
> - Một số security group rules không được cấu hình đúng như mong muốn
> - Solutions architect cần xác định IAM user nào chịu trách nhiệm (which IAM user was responsible) cho các thay đổi này

**Phân tích giải pháp tối ưu:**
AWS CloudTrail

CloudTrail là service giúp ghi lại tất cả API calls và hành động (actions) của user/service trong AWS account, bao gồm thông tin: ai đã làm gì, khi nào, từ đâu.

Đây là lựa chọn phù hợp để audit và tracking các thay đổi cấu hình, xác định chính xác IAM user nào đã thay đổi security group rules.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon GuardDuty**:
  GuardDuty là dịch vụ threat detection (phát hiện mối đe dọa) trong AWS account dựa trên machine learning, tập trung vào phát hiện hoạt động bất thường và độc hại.
  Không phải công cụ để tracking lịch sử thay đổi cấu hình hay audit user actions.

- **Amazon Inspector**:
  Inspector là dịch vụ đánh giá bảo mật (security assessment) cho EC2 instances và applications.
  Chỉ giúp scan các lỗ hổng bảo mật (vulnerabilities), không theo dõi ai đã thực hiện thay đổi cấu hình.

- **AWS Config**:
  Mặc dù Config giúp ghi lại các thay đổi của resource theo thời gian, tuy nhiên không lưu chi tiết ai là người thực hiện (which IAM user) như CloudTrail.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Who made changes" / "Which user" / "Audit actions" → AWS CloudTrail

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Track user activity and API usage on AWS

</details>

---

<div id="question-10"></div>

### Question 10: Point the client driver at an RDS proxy endpoint
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company’s ecommerce website has unpredictable traffic and uses AWS Lambda functions to directly access a private Amazon RDS for PostgreSQL DB instance. The company wants to maintain predictable database performance and ensure that the Lambda invocations do not overload the database with too many connections.

What should a solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Point the client driver at an RDS custom endpoint. Deploy the Lambda functions inside a VPC.
- **(B)** Point the client driver at an RDS proxy endpoint. Deploy the Lambda functions inside a VPC.
- **(C)** Point the client driver at an RDS custom endpoint. Deploy the Lambda functions outside a VPC.
- **(D)** Point the client driver at an RDS proxy endpoint. Deploy the Lambda functions outside a VPC. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website có lưu lượng không dự đoán trước được (unpredictable traffic)
> - Lambda functions truy cập trực tiếp vào RDS for PostgreSQL (trong private subnet)
> - Cần duy trì hiệu suất database ổn định (predictable performance)
> - Đảm bảo Lambda không làm quá tải database với quá nhiều kết nối (too many connections)

**Phân tích giải pháp tối ưu:**
Point the client driver at an RDS proxy endpoint. Deploy the Lambda functions inside a VPC.

RDS Proxy là service giúp cân bằng tải các connection đến RDS / Aurora, giúp giảm thiểu các vấn đề liên quan đến connection như tràn connection, timeout, v.v..

Phù hợp với use case như Lambda (khi chạy scale ra nhiều Lambda xử lý đồng thời, dẫn đến tăng conneciton)

RDS Proxy sẽ giữ hiệu suất database ổn định khi có traffic spike

Do RDS và RDS Proxy nằm trong private subnet nên bắt buộc Lambda phải đặt trong VPC thì mới có khả năng truy cập các resource này

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Point the client driver at an RDS custom endpoint. Deploy the Lambda functions inside a VPC.**:
  RDS custom endpoint là khái niệm không tồn tại, chỉ Aurora mới có chức năng này
  Đây cũng chỉ là cách routing traffic đến một cụm Aurora instances cụ thể trong cluster, không có cơ chế cân bằng tải connection
  Không giải quyết vấn đề quá tải kết nối từ Lambda

- **(C) Point the client driver at an RDS custom endpoint. Deploy the Lambda functions outside a VPC.**:
  Tương tự như giải thích phía trên
  Lambda đặt ngoài VPC không thể kết nối đến các resource private trong VPC được

- **(D) Point the client driver at an RDS proxy endpoint. Deploy the Lambda functions outside a VPC.**:
  Mặc dù RDS Proxy đúng nhưng Lambda ở ngoài VPC nên sẽ không thể kết nối đến private RDS

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Các câu hỏi liên quan đến tràn connection, quá nhiều connection thì nghĩ đến RDS Proxy

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon RDS Proxy

</details>

---

<div id="question-11"></div>

### Question 11: The applications in AWS Local Zones by extending the company's VPC from eu-central...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company wants to migrate its web applications from on premises to AWS. The company is located close to the eu-central-1 Region. Because of regulations, the company cannot launch some of its applications in eu-central-1. The company wants to achieve single-digit millisecond latency.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the applications in AWS Local Zones by extending the company's VPC from eu-central-1 to the chosen Local Zone. `[Đáp án đúng ✅]`
- **(B)** Deploy the applications in eu-central-1. Extend the company’s VPC from eu-central-1 to an edge location in Amazon CloudFront.
- **(C)** Deploy the applications in AWS Wavelength Zones by extending the company’s VPC from eu-central-1 to the chosen Wavelength Zone.
- **(D)** Deploy the applications in eu-central-1. Extend the company’s VPC from eu-central-1 to the regional edge caches in Amazon CloudFront.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty ở gần eu-central-1 Region
> - Một số app không được phép chạy trong region eu-central-1 (do quy định công ty)
> - Yêu cầu: chạy application với độ trễ single-digit millisecond (< 10ms)

**Phân tích giải pháp tối ưu:**
Deploy the applications in AWS Local Zones by extending the company's VPC from eu-central-1 to the chosen Local Zone.

AWS Local Zones là hạ tầng mở rộng của AWS được triển khai trên nhiều location khác nhau, cho phép chạy application với độ trễ thấp single-digit millisecond latency, vị trí cũng ở gần users hơn nhưng vẫn nằm ngoài region chính là eu-central-1 (đáp ứng quy định công ty)

Có thể hình dung Local Zones như một AWS region mini chạy ngay gần tại data center của công ty tại địa phương

Cho phép host VPC từ region chính (eu-central-1) sang Local Zone để đảm bảo kết nối an toàn

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy the applications in eu-central-1. Extend the company's VPC from eu-central-1 to an edge location in Amazon CloudFront.**:
  CloudFront edge locations chỉ là nơi CloudFront caching data, không phải nơi để deploy/chạy applications
  Edge locations không hỗ trợ chạy VPC ở đây

- **Deploy the applications in eu-central-1. Extend the company's VPC from eu-central-1 to the regional edge caches in Amazon CloudFront.**:
  Tương tự như đáp án sai ở trên

- **Deploy the applications in AWS Wavelength Zones by extending the company's VPC from eu-central-1 to the chosen Wavelength Zone.**:
  AWS Wavelength là infrastructure được triển khai bên trong data centers của nhà mạng 5G (Verizon, Vodafone...), cho phép deploy applications ngay tại điểm cung cấp dịch vụ của 5G network.
  Use case chính: mobile edge computing, IoT, real-time gaming trên 5G networks
  Không phù hợp cho tối ưu hóa độ trẽ truy cập application

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Single-digit millisecond latency" + "extend VPC" → AWS Local Zones

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Local Zones
- AWS Wavelength

</details>

---

<div id="question-12"></div>

### Question 12: The database to an Amazon RDS Multi-AZ deployment and the web tier to Amazon EC2 i...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (B), (C)

#### 📋 Đề bài (Scenario)
A company is migrating its multi-tier on-premises application to AWS. The application consists of a single-node MySQL database and a multi-node web tier. The company must minimize changes to the application during the migration. The company wants to improve application resiliency after the migration.

Which combination of steps will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the database to an Amazon DynamoDB table.
- **(B)** Migrate the database to an Amazon RDS Multi-AZ deployment. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Migrate the web tier to Amazon EC2 instances in an Auto Scaling group behind an Application Load Balancer. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Migrate the database to Amazon EC2 instances in an Auto Scaling group behind a Network Load Balancer.
- **(E)** Migrate the web tier to an AWS Lambda function.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty đang migrate ứng dụng multi-tier từ on-premises lên AWS
> - Kiến trúc hiện tại: single-node MySQL database + multi-node web tier
> - Yêu cầu: minimize changes (giảm thiểu thay đổi) trong quá trình migration
> - Mục tiêu: improve resiliency (tăng khả dụng) sau khi migrate

**Phân tích giải pháp tối ưu:**
Migrate the web tier to Amazon EC2 instances in an Auto Scaling group behind an Application Load Balancer.

Multi-node web tier → Do tầng web chạy trên nhiều node, do đó sử dụng Auto Scaling Group kết hợp việc scale nhiều EC2 trên nhiều zone sẽ là sự lựa chọn phù hợp, vừa tăng tính khả dụng vừa có khả năng scale đáp ứng traffic

Application Load Balancer (ALB) giúp đảm bảo traffic được cân bằng tải giữa các EC2

Migrate the database to an Amazon RDS Multi-AZ deployment.

Database MySQL đang chạy single node nên không có tính khả dụng cao, chuyển sang RDS MySQL và bật Multi-AZ sẽ đảm bảo tính khả dụng và khả năng tự động failover khi xảy ra sự cố trên zone

RDS cũng là managed service, cũng giúp giảm effort vận hành

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Migrate the database to Amazon EC2 instances in an Auto Scaling group behind a Network Load Balancer.**:
  Database chạy trong EC2 hoàn toàn không có tính khả dụng cao, sử dụng RDS sẽ hợp lý hơn
  Network Load Balancer cũng rất đắt và không cần thiết ở đây

- **(E) Migrate the web tier to an AWS Lambda function.**:
  Đề bài yêu cầu minimize changes - ít thay đổi nhất có thể, mà việc migrate sang Lambda đòi hỏi refactor toàn bộ code từ kiến trúc multi-node sang serverless architecture
  Không đáp ứng yêu cầu đề bài

- **(A) Migrate the database to an Amazon DynamoDB table.**:
  Đề bài yêu cầu minimize changes - ít thay đổi nhất có thể, mà việc chuyển từ MySQL (relational) sang DynamoDB (NoSQL) đòi hỏi thiết kế lại hoàn toàn data model
  Không đáp ứng yêu cầu đề bài

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Minimize changes" → Ưu tiên chọn giải pháp tương thích với kiến trúc hiện tại như cùng loại DB, cùng kiến trúc
- "improve resiliency" → Tránh việc chạy Database trên EC2, ưu tiên các managed service có support multi AZ như RDS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon RDS Multi-AZ
- Resilience in Amazon EC2 Auto Scaling

</details>

---

<div id="question-13"></div>

### Question 13: An IAM policy that allows users to create only encrypted Amazon Elastic Block Stor...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company needs a solution to enforce data encryption at rest on Amazon EC2 instances. The solution must automatically identify noncompliant resources and enforce compliance policies on findings.

Which solution will meet these requirements with the LEAST administrative overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Macie to detect unencrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Systems Manager Automation rules to automatically encrypt existing and new EBS volumes.
- **(B)** Use an IAM policy that allows users to create only encrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Config and AWS Systems Manager to automate the detection and remediation of unencrypted EBS volumes. `[Đáp án đúng ✅]`
- **(C)** Use Amazon inspector to detect unencrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Systems Manager Automation rules to automatically encrypt existing and new EBS volumes.
- **(D)** Use AWS Key Management Service (AWS KMS) to manage access to encrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Lambda and Amazon EventBridge to automate the detection and remediation of unencrypted EBS volumes.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty cần mã hóa đầu cuối (encryption at rest) cho EC2 instances
> - Cần tự động phát hiện (automatically identify) các resource không tuân thủ quy định mã hóa
> - Cần tự động đảm bảo tuân thủ đối với các resource đã phát hiện
> - Yêu cầu ít administrative overhead nhất

**Phân tích giải pháp tối ưu:**
Use an IAM policy that allows users to create only encrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Config and AWS Systems Manager to automate the detection and remediation of unencrypted EBS volumes.

Dùng IAM policy để giới hạn permission chỉ cho phép user tạo EBS đã được mã hóa sẽ giúp đảm bảo tuân thủ ngay từ đầu, giảm thiểu số lượng resource không tuân thủ phát sinh sau này

AWS Config là service được thiết kế chuyên để theo dõi và phát hiện resource không tuân thủ theo rule đã setup

AWS Systems Manager (SSM) có thể tự động remediate (xử lý resource không tuân thủ) thông qua Automation documents

Giải pháp này có ít overhead nhất vì AWS Config + SSM là best practice cho việc tự động hóa đảm bảo tuân thủ cho resource

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use AWS Key Management Service (AWS KMS) to manage access to encrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Lambda and Amazon EventBridge to automate the detection and remediation of unencrypted EBS volumes.**:
  AWS KMS không có khả năng quản lý quyền truy cập đến EBS, chỉ có khả năng quản lý quyền truy cập đến key mã hóa
  Lambda + EventBridge sẽ cần viết code, làm tăng effort không cần thiết
  Solution phức tạp, không phù hợp

- **(A) Use Amazon Macie to detect unencrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Systems Manager Automation rules to automatically encrypt existing and new EBS volumes.**:
  Amazon Macie được thiết kế để nhận diện các dữ liệu cá nhân của người dùng (PII) trong S3, không dùng cho EBS volumes cũng như không có khả năng nhận diện EBS có mã hóa hay không
  Service dùng sai mục đích

- **(C) Use Amazon Inspector to detect unencrypted Amazon Elastic Block Store (Amazon EBS) volumes. Use AWS Systems Manager Automation rules to automatically encrypt existing and new EBS volumes.**:
  Amazon Inspector là service quét bảo mật cho EC2, không có tác dụng nhận diện EBS có mã hóa hay không

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Compliance + automatically detect" → AWS Config
- Tự động hóa đảm bảo tuân thủ cho resource thì sử dụng AWS Config kết hợp SSM Automation

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Setting Up Auto Remediation for AWS Config

</details>

---

<div id="question-14"></div>

### Question 14: A customer managed key
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company uses Amazon EC2 instances and stores data on Amazon Elastic Block Store (Amazon EBS) volumes. The company must ensure that all data is encrypted at rest by using AWS Key Management Service (AWS KMS). The company must be able to control rotation of the encryption keys.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an AWS managed key to encrypt the EBS volumes. Use the key to configure automatic key rotation.
- **(B)** Create a customer managed key. Use the key to encrypt the EBS volumes. `[Đáp án đúng ✅]`
- **(C)** Use an AWS owned key to encrypt the EBS volumes.
- **(D)** Create an external KMS key with imported key material. Use the key to encrypt the EBS volumes.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty sử dụng EC2 instances và lưu data trên EBS volumes
> - Yêu cầu: mã hóa đầu cuối (encrypt at rest) với AWS KMS
> - Công ty phải có khả năng kiểm soát việc rotation của encryption keys
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create a customer managed key. Use the key to encrypt the EBS volumes.

KMS Customer managed key cho phép người sử dụng có toàn quyền kiểm soát việc rotation cho key (bật/tắt rotation tự động, kiểm soát thời gian rotation, v.v...)

Đồng thời giúp giảm thiểu operational overhead vì key mã hóa được quản lý hoàn toàn bên trong AWS KMS, không tốn công vận hành hay quản lý kiến trúc bên dưới

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use an AWS managed key to encrypt the EBS volumes. Use the key to configure automatic key rotation.**:
  → AWS managed key không cho phép người sử dụng kiểm soát rotation - AWS tự động rotate mỗi năm không thể kiểm soát được

- **Create an external KMS key with imported key material. Use the key to encrypt the EBS volumes.**:
  → Imported key material không hỗ trợ automatic rotation, người sử dụng phải tự rotation thủ công, làm tăng operational overhead đáng kể

- **(C) Use an AWS owned key to encrypt the EBS volumes.**:
  → AWS owned key là loại key do các service tự sở hữu và quản lý (vd SSE-S3, SSE-DynamoDB, v.v...) do đó người sử dụng không thể kiểm soát việc rotation

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Control rotation" → Customer Managed Key (chỉ loại key này cho phép customer kiểm soát việc rotation của key)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Rotate AWS KMS keys

</details>

---

<div id="question-15"></div>

### Question 15: The request to terminate the EC2 instance does not originate from the CIDR blocks 192
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company uses Amazon EC2 instances to host its internal systems. As part of a deployment operation, an administrator tries to use the AWS CLI to terminate an EC2 instance. However, the administrator receives a 403 (Access Denied) error message.

The administrator is using an IAM role that has the following IAM policy attached:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["ec2:TerminateInstances"],
      "Resource": ["*"]
    },
    {
      "Effect": "Deny",
      "Action": ["ec2:TerminateInstances"],
      "Condition": {
        "NotIpAddress": {
          "aws:SourceIp": [
            "192.0.2.0/24",
            "203.0.113.0/24"
          ]
        }
      },
      "Resource": ["*"]
    }
  ]
}
What is the cause of the unsuccessful request?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The EC2 instance has a resource-based policy with a Deny statement.
- **(B)** The principal has not been specified in the policy statement.
- **(C)** The request to terminate the EC2 instance does not originate from the CIDR blocks 192.0.2.0/24 or 203.0.113.0/24. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** The "Action" field does not grant the actions that are required to terminate the EC2 instance.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Administrator dùng IAM role với policy như ảnh trên
> - Khi cố terminate EC2 thì bị báo lỗi 403 Access Denied
> - Cần tìm ra nguyên nhân

**Phân tích giải pháp tối ưu:**
The request to terminate the EC2 instance does not originate from the CIDR blocks 192.0.2.0/24 or 203.0.113.0/24.

Mặc dù Statement thứ nhất cho phép terminate bất cứ EC2 nào, tuy nhiên Statement thứ 2 có Deny với điều kiện NotIpAddress, nghĩa là sẽ từ chối (Deny) nếu request không xuất phát từ 2 CIDR blocks được chỉ định.

Có thể administrator đang thực hiện request từ IP nằm ngoài 2 dải này nên bị Deny.

Lưu ý, Deny luôn được ưu tiên so với Allow. Dù có Allow ở statement 1, nhưng Deny ở statement 2 thì vẫn chặn request như bình thường

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) The EC2 instance has a resource-based policy with a Deny statement.**:
  → EC2 không có resource-based policy, vô lý

- **(B) The principal has not been specified in the policy statement.**:
  → IAM role policy không cần chỉ định trường Principal (đối tượng sử dụng) vì policy đã được gắn vào role, tự động áp dụng cho principal sử dụng role đó.

- **(D) The "Action" field does not grant the actions that are required to terminate the EC2 instance.**:
  → Action ec2:TerminateInstances đã được cấp quyền ở statement đầu tiên. Vấn đề không nằm ở thiếu action, mà là bị Deny do điều kiện IP.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Trong IAM Statement, Deny luôn được ưu tiên hơn Allow

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS IAM Policy Evaluation Logic

</details>

---

<div id="question-16"></div>

### Question 16: An AWS Glue crawler to discover the data
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company's reporting system delivers hundreds of .csv files to an Amazon S3 bucket each day. The company must convert these files to Apache Parquet format and must store the files in a transformed data bucket.

Which solution will meet these requirements with the LEAST development effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Lambda function to transform the data and output the data to the transformed data bucket. Configure an event notification for the S3 bucket. Specify the Lambda function as the destination for the event notification.
- **(B)** Create an Amazon EMR cluster with Apache Spark installed. Write a Spark application to transform the data. Use EMR File System (EMRFS) to write files to the transformed data bucket.
- **(C)** Create an AWS Glue crawler to discover the data. Create an AWS Glue extract, transform, and load (ETL) job to transform the data. Specify the transformed data bucket in the output step. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use AWS Batch to create a job definition with Bash syntax to transform the data and output the data to the transformed data bucket. Use the job definition to submit a job. Specify an array job as the job type.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Hệ thống báo cáo gửi hàng trăm file .csv vào S3 bucket mỗi ngày
> - Cần chuyển đổi csv sang định dạng Apache Parquet
> - Cần lưu trữ data đã chuyển đổi sang bucket khác
> - Yêu cầu: giải pháp với ít công sức phát triển nhất (LEAST development effort)

**Phân tích giải pháp tối ưu:**
Create an AWS Glue crawler to discover the data. Create an AWS Glue extract, transform, and load (ETL) job to transform the data. Specify the transformed data bucket in the output step.

AWS Glue là dịch vụ ETL serverless được sử dụng với mục đích chính là chuyển đổi dữ liệu

AWS Glue khi chạy thì cần tham chiếu định nghĩa kiểu dữ liệu đã lưu vào Data Catalog, vì vậy mà trước đó cần chạy Crawler để quét file csv có trong S3 rồi tự động đăng ký kiểu dữ liệu vào đó

AWS Glue có sẵn các chuyển đổi tích hợp (built-in transformations) cho việc chuyển định dạng từ CSV sang Parquet

Glue ETL cung cấp giao diện có thể tạo xử lý chuyển đổi thông qua việc kéo thả và setting bằng chuột, từ đó giúp giảm effort phát triển (LEAST development effort)

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon EMR cluster with Apache Spark installed. Write a Spark application to transform the data. Use EMR File System (EMRFS) to write files to the transformed data bucket.**:
  EMR chạy trên nền EC2, không phải service serverless, tốn effort vận hành
  Quá thừa thãi cho use case chuyển đổi data đơn giản
  Chi phí đắt hơn so với Glue

- **(D) Use AWS Batch to create a job definition with Bash syntax to transform the data and output the data to the transformed data bucket. Use the job definition to submit a job. Specify an array job as the job type.**:
  Đòi hỏi phải viết script Bash để xử lý chuyển đổi CSV sang Parquet, tốn effort phát triển
  Không có công cụ tích hợp sẵn cho việc chuyển đổi data
  Chi phí cao hơn so với Glue

- **Create an AWS Lambda function to transform the data and output the data to the transformed data bucket. Configure an event notification for the S3 bucket. Specify the Lambda function as the destination for the event notification.**:
  Lambda có giới hạn về thời gian thực thi (execution time) - max 15 phút, và bộ nhớ (memory) của Lambda có thể gây vấn đề với file lớn
  Cần viết code chuyển đổi CSV sang Parquet từ đầu, tốn effort
  Lambda không được tối ưu hóa cho các tác vụ ETL quy mô lớn

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "CSV to Parquet" → Nghĩ đến AWS Glue ETL jobs

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Three AWS Glue ETL job types for converting data to Apache Parquet

</details>

---

<div id="question-17"></div>

### Question 17: Amazon DynamoDB Accelerator (DAX) for the new messages table
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has a mobile chat application with a data store based in Amazon DynamoDB. Users would like new messages to be read with as little latency as possible. A solutions architect needs to design an optimal solution that requires minimal application changes.

Which method should the solutions architect select?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Double the number of read capacity units for the new messages table in DynamoDB. Continue to use the existing DynamoDB endpoint.
- **(B)** Add DynamoDB read replicas to handle the increased read load. Update the application to point to the read endpoint for the read replicas.
- **(C)** Add an Amazon ElastiCache for Redis cache to the application stack. Update the application to point to the Redis cache endpoint instead of DynamoDB.
- **(D)** Configure Amazon DynamoDB Accelerator (DAX) for the new messages table. Update the code to use the DAX endpoint. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chat trên mobile, dùng DynamoDB làm data store
> - Yêu cầu: đọc data từ DB với độ trễ thấp nhất (minimal latency) mà ít thay đổi code nhất có thể (minimal application changes)

**Phân tích giải pháp tối ưu:**
Configure Amazon DynamoDB Accelerator (DAX) for the new messages table. Update the code to use the DAX endpoint.

DAX là in-memory cache được thiết kế riêng cho DynamoDB, giảm độ trễ đọc từ milliseconds xuống microseconds

Tích hợp native, liên kết trực tiếp với DynamoDB, để sử dụng thì trong code chỉ cần đổi endpoint trỏ đến DAX thay vì DynamoDB (thay đổi tối thiểu)

Tự động xử lý cache hết hạn, không cần logic phức tạp

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Add DynamoDB read replicas to handle the increased read load. Update the application to point to the read endpoint for the read replicas.**:
  → Sai vì DynamoDB không có read replicas như RDS, vô lý

- **Double the number of read capacity units for the new messages table in DynamoDB. Continue to use the existing DynamoDB endpoint.**:
  → Sai vì tăng RCU chỉ giúp tăng khả năng xử lý nhiều request hơn, không giúp giảm độ trễ khi đọc data đối với mỗi request đọc

- **Add an Amazon ElastiCache for Redis cache to the application stack. Update the application to point to the Redis cache endpoint instead of DynamoDB.**:
  → Không tối ưu vì sẽ phát sinh thay đổi nhiều về code, phải tạo thêm các logic như cache data gì, cache invalidation như thế nào, v.v...

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "DynamoDB + low latency reads" → DAX
- DynamoDB mà cần giảm độ trễ request thì solution hầu như luôn là DAX

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon DynamoDB Accelerator (DAX)

</details>

---

<div id="question-18"></div>

### Question 18: Ensure that the customers create an IAM role in their account with read-only EC2 a...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs an infrastructure monitoring service. The company is building a new feature that will enable the service to monitor data in customer AWS accounts. The new feature will call AWS APIs in customer accounts to describe Amazon EC2 instances and read Amazon CloudWatch metrics.

What should the company do to obtain access to customer accounts in the MOST secure way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Ensure that the customers create an Amazon Cognito user in their account to use an IAM role with read-only EC2 and CloudWatch permissions. Encrypt and store the Amazon Cognito user and password in a secrets management system.
- **(B)** Create a serverless API that implements a token vending machine to provide temporary AWS credentials for a role with read-only EC2 and CloudWatch permissions.
- **(C)** Ensure that the customers create an IAM role in their account with read-only EC2 and CloudWatch permissions and a trust policy to the company's account. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Ensure that the customers create an IAM user in their account with read-only EC2 and CloudWatch permissions. Encrypt and store customer access and secret keys in a secrets management system.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty cần access đến EC2 instances và đọc CloudWatch metrics trong account khách hàng
> - Yêu cầu: đảm bảo an toàn nhất (MOST secure)

**Phân tích giải pháp tối ưu:**
Ensure that the customers create an IAM role in their account with read-only EC2 and CloudWatch permissions and a trust policy to the company's account.

Tạo IAM Role trong account khách hàng với các quyền cần thiết để truy cập EC2 và Cloudwatch, đóng vai trò là trung gian để cho account của công ty có thể assume role (mượn quyền) truy cập

Việc chỉ định đối tượng nào có thể assume role thì sẽ định nghĩa trong Trust policy, ở đây sẽ cho allow Company Account Id

Như vậy đảm bảo best practice của AWS về security vì credentials nhận được sau khi assume role để thao tác với service chỉ là tạm thời, không phải lâu dài, không cần phải quản lý dưới dạng username hay password

Đảm bảo nguyên tắc least privilege: chỉ cấp quyền cần thiết là read-only cho EC2 và CloudWatch, không cấp thừa quyền

Solution này là best practice cho việc truy cập cross-account access

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a serverless API that implements a token vending machine to provide temporary AWS credentials for a role with read-only EC2 and CloudWatch permissions.**:
  Build một sevice riêng đóng vai trò như token vending machine để cấp credentials tạm thời thì quá tốn effort
  Trung gian qua IAM role trực tiếp đơn giản và an toàn hơn nhiều

- **Ensure that the customers create an IAM user in their account with read-only EC2 and CloudWatch permissions. Encrypt and store customer access and secret keys in a secrets management system.**:
  Sử dụng credentials có tính lâu dài ít thay đổi (access key/secret key) nên sẽ kém an toàn
  Dù có mã hoá đi nữa, vẫn có nguy cơ lộ credentials
  Khó mở rộng khả năng quản lý khi có nhiều customers
  Vi phạm best practice: không chia sẻ credentials giữa accounts với nhau, dùng IAM Role vẫn là ưu tiên hơn

- **Ensure that the customers create an Amazon Cognito user in their account to use an IAM role with read-only EC2 and CloudWatch permissions. Encrypt and store the Amazon Cognito user and password in a secrets management system.**:
  Amazon Cognito dùng cho việc xác thực và đăng nhập cho web và application
  Không dùng cho mục đích cấp quyền truy cập giữa các account

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Access customer AWS accounts" → Nghĩ đến truy cập Cross-account thông qua assume role
- "MOST secure" → Tránh long-term credentials, dùng IAM Role

#### 📚 Tài liệu tham khảo chính thức (Official References):
- IAM tutorial: Delegate access across AWS accounts using IAM roles

</details>

---

<div id="question-19"></div>

### Question 19: A log group in Amazon CloudWatch Logs
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company's application uses Network Load Balancers, Auto Scaling groups, Amazon EC2 instances, and databases that are deployed in an Amazon VPC. The company wants to capture information about traffic to and from the network interfaces in near real time in its Amazon VPC. The company wants to send the information to Amazon OpenSearch Service for analysis.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a trail in AWS CloudTrail. Configure VPC Flow Logs to send the log data to the trail. Use Amazon Kinesis Data Streams to stream the logs from the trail to OpenSearch Service.
- **(B)** Create a log group in Amazon CloudWatch Logs. Configure VPC Flow Logs to send the log data to the log group. Use Amazon Kinesis Data Firehose to stream the logs from the log group to OpenSearch Service.
- **(C)** Create a trail in AWS CloudTrail. Configure VPC Flow Logs to send the log data to the trail. Use Amazon Kinesis Data Firehose to stream the logs from the trail to OpenSearch Service.
- **(D)** Create a log group in Amazon CloudWatch Logs. Configure VPC Flow Logs to send the log data to the log group. Use Amazon Kinesis Data Streams to stream the logs from the log group to OpenSearch Service. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần thu thập traffic data từ network interfaces trong VPC (near real-time) của các service như NLB, EC2, v.v..
> - Cần gửi data này đến Amazon OpenSearch Service để phân tích

**Phân tích giải pháp tối ưu:**
Create a log group in Amazon CloudWatch Logs. Configure VPC Flow Logs to send the log data to the log group. Use Amazon Kinesis Data Firehose to stream the logs from the log group to OpenSearch Service.

VPC Flow Logs là tính năng cho phép ghi lại log về IP traffic đi vào và ra khỏi network interfaces trong VPC (ghi lại source IP, destination IP, port, protocol, số lượng packets/bytes, v.v..)

VPC Flow Logs có support gửi log trực tiếp đến CloudWatch Logs

Kinesis Data Firehose là fully managed service cho phép truyền tải log từ Cloudwatch Log trực tiếp vào OpenSearch Service trong gần thời gian thực (near real-time)

Firehose tự động gộp (batch), nén (compress), chuyển đổi (transform) và deliver data, đơn giản hoá không cần code

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a log group in Amazon CloudWatch Logs. Configure VPC Flow Logs to send the log data to the log group. Use Amazon Kinesis Data Streams to stream the logs from the log group to OpenSearch Service.**:
  Kinesis Data Streams cần phải tự code consumer application để xử lý và gửi data đến OpenSearch. Phức tạp hơn và không cần thiết khi có Firehose làm việc này tự động.

- **Create a trail in AWS CloudTrail. Configure VPC Flow Logs to send the log data to the trail. Use Amazon Kinesis Data Streams to stream the logs from the trail to OpenSearch Service.**:
  CloudTrail dùng để log API calls (quản lý actions trong AWS), KHÔNG phải nơi chứa VPC Flow Logs
  Dùng service sai mục đích ngay từ đầu

- **Create a trail in AWS CloudTrail. Configure VPC Flow Logs to send the log data to the trail. Use Amazon Kinesis Data Firehose to stream the logs from the trail to OpenSearch Service.**:
  Sai do vẫn dùng CloudTrail, tương tự như đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Near real-time" → Nghĩ đến Firehose

#### 📚 Tài liệu tham khảo chính thức (Official References):
- VPC Flow Logs
- Kinesis Data Firehose to OpenSearch

</details>

---

<div id="question-20"></div>

### Question 20: Lock the EBS snapshots to prevent deletion
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company uses Amazon EC2 instances and Amazon Elastic Block Store (Amazon EBS) volumes to run an application. The company creates one snapshot of each EBS volume every day to meet compliance requirements. The company wants to implement an architecture that prevents the accidental deletion of EBS volume snapshots. The solution must not change the administrative rights of the storage administrator user.

Which solution will meet these requirements with the LEAST administrative effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Lock the EBS snapshots to prevent deletion. `[Đáp án đúng ✅]`
- **(B)** Add tags to the snapshots. Create retention rules in Recycle Bin for EBS snapshots that have the tags.
- **(C)** Create an IAM policy that denies snapshot deletion. Attach the policy to the storage administrator user.
- **(D)** Create an IAM role that has permission to delete snapshots. Attach the role to a new EC2 instance. Use the AWS CLI from the new EC2 instance to delete snapshots.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty tạo snapshot hàng ngày (daily snapshots) cho EBS volumes để đáp ứng compliance
> - Cần ngăn chặn xóa nhầm snapshots (accidental deletion)
> - Không được thay đổi quyền (administrative rights) của storage administrator
> - Cần giải pháp với ít effort nhất (LEAST administrative effort)

**Phân tích giải pháp tối ưu:**
Lock the EBS snapshots to prevent deletion.

→ EBS Snapshot Lock là tính năng cho phép lock snapshots để ngăn chặn deletion trong một thời gian nhất định. Một khi đã lock, không ai có thể xóa snapshot cho đến khi hết thời gian lock, bao gồm cả root user. Giải pháp đơn giản, trực tiếp và hiệu quả nhất.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an IAM role that has permission to delete snapshots. Attach the role to a new EC2 instance. Use the AWS CLI from the new EC2 instance to delete snapshots.**:
  Tạo thêm complexity không cần thiết với EC2 instance và workflow phức tạp
  Hoàn toàn không thực sự ngăn chặn việc xoá nhầm (accidental deletion)

- **Create an IAM policy that denies snapshot deletion. Attach the policy to the storage administrator user.**:
  Vi phạm yêu cầu "not change the administrative rights" của storage administrator do phát sinh thay đổi về quyền trong IAM Policy
  Sẽ block hoàn toàn việc xóa snapshot khi cần thiết

- **Add tags to the snapshots. Create retention rules in Recycle Bin for EBS snapshots that have the tags.**:
  Recycle Bin chỉ giúp restore snapshot sau khi đã bị xóa, không giúp ngăn chạn được việc xoá nhầm

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Prevent accidental deletion" + "snapshots" → EBS Snapshot Lock

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon EBS snapshot lock

</details>

---

<div id="question-21"></div>

### Question 21: A read replica for the DB instance and an Amazon ElastiCache cluster
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (A), (B)

#### 📋 Đề bài (Scenario)
A company runs a web application on Amazon EC2 instances in an Auto Scaling group. The application uses a database that runs on an Amazon RDS for PostgreSQL DB instance. The application performs slowly when traffic increases. The database experiences a heavy read load during periods of high traffic.

Which actions should a solutions architect take to resolve these performance issues? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon ElastiCache cluster. Configure the application to cache query results in the ElastiCache cluster. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create a read replica for the DB instance. Configure the application to send read traffic to the read replica. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Turn on auto scaling for the DB instance.
- **(D)** Configure the Auto Scaling group subnets to ensure that the EC2 instances are provisioned in the same Availability Zone as the DB instance.
- **(E)** Convert the DB instance to a Multi-AZ DB instance deployment. Configure the application to send read traffic to the standby DB instance.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web app trên EC2 với Auto Scaling group, sử dụng database: RDS PostgreSQL
> - Vấn đề: application chậm khi traffic tăng
> - Nguyên nhân: database gặp heavy read load trong high traffic
> - Yêu cầu: giải quyết vấn đề performance

**Phân tích giải pháp tối ưu:**
Create a read replica for the DB instance. Configure the application to send read traffic to the read replica.

Read replica là giải pháp giúp giảm tải bớt áp lực traffic đọc khỏi primary database

Giúp tăng khả năng scale đáp ứng traffic đọc

Phù hợp với trường hợp khi có nhiều traffic đọc mà nội dung khác nhau

Create an Amazon ElastiCache cluster. Configure the application to cache query results in the ElastiCache cluster.

Amazon ElastiCache là in-memory database thường được sử dụng để cache các data hay được truy cập, giúp giảm số lượng queries đến database

Đặc biệt hiệu quả cho các câu query giống nhau (frequent queries) và các data lặp lại (repeating data)

Giúp cải thiện response time đáng kể

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Turn on auto scaling for the DB instance.**:
  RDS không hỗ trợ auto scaling cho CPU hay memory, mà chỉ có auto scaling cho storage, do đó không giải quyết được vấn đề về performance
  Muốn scale thì bắt buộc phải thay đổi instance type thủ công bằng tay, lúc đó cần stop DB nên sẽ gây ra downtime

- **Convert the DB instance to a Multi-AZ DB instance deployment. Configure the application to send read traffic to the standby DB instance.**:
  Multi-AZ chỉ dùng để tăng tính khả dụng high availability, có khả năng failover khi xảy ra sự cố trên zone, KHÔNG dùng để cải thiện read traffic

- **Configure the Auto Scaling group subnets to ensure that the EC2 instances are provisioned in the same Availability Zone as the DB instance.**:
  Việc này chỉ giúp giảm nhẹ độ trễ kết nối từ EC2 đến RDS, không giải quyết được heavy read load trên database
  Không có cơ chế scale read capacity

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Heavy read load" → Nghĩ đến Read Replica + ElastiCache

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Creating an Amazon ElastiCache cache using Amazon RDS DB instance settings
- How do I create a read replica for an Amazon RDS DB instance?

</details>

---

<div id="question-22"></div>

### Question 22: An Amazon S3 File Gateway to increase the company's storage space
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs an SMB file server in its data center. The file server stores large files that the company frequently accesses for up to 7 days after the file creation date. After 7 days, the company needs to be able to access the files with a maximum retrieval time of 24 hours.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS DataSync to copy data that is older than 7 days from the SMB file server to AWS.
- **(B)** Create an Amazon S3 File Gateway to increase the company's storage space. Create an S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 7 days. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create an Amazon FSx File Gateway to increase the company's storage space. Create an Amazon S3 Lifecycle policy to transition the data after 7 days.
- **(D)** Configure access to Amazon S3 for each user. Create an S3 Lifecycle policy to transition the data to S3 Glacier Flexible Retrieval after 7 days.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty có SMB file server trong data center
> - File truy cập thường xuyên (frequently accesses) trong 7 ngày đầu
> - Sau 7 ngày: có thể chấp nhận truy cập với thời gian lấy dữ liệu tối đa 24 giờ (maximum retrieval time of 24 hours)
> - Cần giải pháp lưu trữ cho các file này

**Phân tích giải pháp tối ưu:**
Create an Amazon S3 File Gateway to increase the company's storage space. Create an S3 Lifecycle policy to transition the data to S3 Glacier Deep Archive after 7 days.

S3 File Gateway cho phép SMB file server kết nối lên AWS S3 thông qua giao thức SMB/NFS, giữ nguyên giao thức / workflow hiện tại.

S3 Glacier Deep Archive có thời gian chờ khi lấy file là dưới 12 tiếng (hình thức lấy file Standard), vẫn đáp ứng yêu cầu "tối đa 24 giờ".

S3 Lifecycle policy tự động chuyển dữ liệu sau 7 ngày, tiết kiệm chi phí.

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use AWS DataSync to copy data that is older than 7 days from the SMB file server to AWS.**:
  → DataSync chỉ là công cụ đồng bộ dữ liệu một lần, không có khả năng đồng bộ dữ liệu liên tục và không tích hợp với SMB workflow.

- **Create an Amazon FSx File Gateway to increase the company's storage space. Create an Amazon S3 Lifecycle policy to transition the data after 7 days.**:
  → Amazon FSx File Gateway mặc dù phù hợp, support đồng bộ data lên cloud nhưng mà là FSx for Windows File Server, không support S3. Do đó nhắc đến S3 lifecycle policy ở đây là không liên quan.

- **Configure access to Amazon S3 for each user. Create an S3 Lifecycle policy to transition the data to S3 Glacier Flexible Retrieval after 7 days.**:
  → Solution này thay đổi workflow của users (phải chuyển sang dùng S3 thay vì giao thức SMB như ban đầu), do đó không phù hợp

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SMB file server" → S3 File Gateway (giữ nguyên SMB protocol)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon S3 File Gateway

</details>

---

<div id="question-23"></div>

### Question 23: An AWS Glue crawler to crawl the data
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A marketing company receives a large amount of new clickstream data in Amazon S3 from a marketing campaign. The company needs to analyze the clickstream data in Amazon S3 quickly. Then the company needs to determine whether to process the data further in the data pipeline.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create external tables in a Spark catalog. Configure jobs in AWS Glue to query the data.
- **(B)** Configure an AWS Glue crawler to crawl the data. Configure Amazon Athena to query the data.
- **(C)** Create external tables in a Hive metastore. Configure Spark jobs in Amazon EMR to query the data.
- **(D)** Configure an AWS Glue crawler to crawl the data. Configure Amazon Managed Service for Apache Flink to use SQL to query the data. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty cần phân tích nhanh dữ liệu trong S3 để quyết định có xử lý tiếp trong data pipeline hay không
> - Yêu cầu: LEAST operational overhead (ít vận hành nhất)

**Phân tích giải pháp tối ưu:**
Configure an AWS Glue crawler to crawl the data. Configure Amazon Athena to query the data.

Athena là serverless query service cho phép query data trên S3 thông qua các câu lệnh SQL, chỉ trả tiền khi query (pay-per-query), không cần infrastructure chạy 24/7, giảm effort vận hành

Glue Crawler là service tự động quét S3 và đăng ký kiểu dữ liệu của data vào data catalog, Athena sẽ cần tham chiếu vào catalog để hiểu cấu trúc dữ liệu, từ đó mới có thể query được trên S3.

Ít effort vận hành nhất vì không cần maintain infrastructure, chỉ trả tiền theo lượng data scan.

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create external tables in a Spark catalog. Configure jobs in AWS Glue to query the data.**:
  Glue dùng cho mục đích chuyển đổi data, không dùng cho mục đích query
  Service sử dụng sai mục đích

- **Create external tables in a Hive metastore. Configure Spark jobs in Amazon EMR to query the data.**:
  EMR chạy trên EC2, tốn effort vận hành
  EMR dùng cho việc xử lý bigdata, không dùng cho mục đích query data trên S3
  Service sử dụng sai mục đích

- **Configure an AWS Glue crawler to crawl the data. Configure Amazon Managed Service for Apache Flink to use SQL to query the data.**:
  Amazon Managed Service for Apache Flink dùng cho việc query data trên luồng stream của Kinesis, không phải query dữ liệu đã có sẵn trong S3

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Nhắc đến việc query data trên S3 thì nghĩ ngay đến Athena
- Kết hợp với Glue Crawler để định nghĩa kiểu dữ liệu tham chiếu trước khi query

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Querying Amazon S3 Inventory with Amazon Athena

</details>

---

<div id="question-24"></div>

### Question 24: An AWS Cost Anomaly Detection monitor in the AWS Billing and Cost Management console
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs its applications on Amazon EC2 instances. The company performs periodic financial assessments of its AWS costs. The company recently identified unusual spending.

The company needs a solution to prevent unusual spending. The solution must monitor costs and notify responsible stakeholders in the event of unusual spending.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Cost Anomaly Detection monitor in the AWS Billing and Cost Management console. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon CloudWatch to monitor costs and to identify unusual spending.
- **(C)** Create AWS Pricing Calculator estimates for the current running workload pricing details.
- **(D)** Use an AWS Budgets template to create a zero spend budget.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty chạy ứng dụng trên EC2 instances
> - Phát hiện có chi phí bất thường (unusual spending)
> - Cần giải pháp: giám sát chi phí và thông báo khi có chi phí bất thường

**Phân tích giải pháp tối ưu:**
Create an AWS Cost Anomaly Detection monitor in the AWS Billing and Cost Management console.

→ AWS Cost Anomaly Detection là service được thiết kế chính xác cho mục đích này:

Tự động phát hiện chi phí bất thường bằng machine learning

Gửi thông báo (alert) tự động qua SNS/Email khi phát hiện bất thường

Đáp ứng cả 2 yêu cầu: giám sát bất thường + thông báo

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use an AWS Budgets template to create a zero spend budget.**:
  Nếu setting zero spend budget thì chỉ cần phát sinh chi phí dù là nhỏ nhất cũng sẽ thông báo
  Đề bài không yêu cầu mức chi tiêu = 0, do đó không cần thiết

- **Create AWS Pricing Calculator estimates for the current running workload pricing details.**:
  AWS Pricing Calculator chỉ dùng để ước tính chi phí trước khi triển khai application
  Dùng service sai mục đích

- **(B) Use Amazon CloudWatch to monitor costs and to identify unusual spending.**:
  CloudWatch theo dõi metrics về performance (CPU, memory, network...) của các service
  Không thể dùng để giám sát chi tiêu trong account
  Dùng service sai mục đích

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Unusual/abnormal spending" → AWS Cost Anomaly Detection

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Detecting unusual spend with AWS Cost Anomaly Detection

</details>

---

<div id="question-25"></div>

### Question 25: Provision the AWS accounts by using AWS Control Tower
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company's solutions architect is designing an AWS multi-account solution that uses AWS Organizations. The solutions architect has organized the company's accounts into organizational units (OUs).

The solutions architect needs a solution that will identify any changes to the OU hierarchy. The solution also needs to notify the company's operations team of any changes.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Service Catalog to create accounts in Organizations. Use an AWS CloudTrail organization trail to identify the changes to the OU hierarchy.
- **(B)** Provision the AWS accounts by using AWS Control Tower. Use account drift notifications to identify the changes to the OU hierarchy. `[Đáp án đúng ✅]`
- **(C)** Provision the AWS accounts by using AWS Control Tower. Use AWS Config aggregated rules to identify the changes to the OU hierarchy.
- **(D)** Use AWS CloudFormation templates to create accounts in Organizations. Use the drift detection operation on a stack to identify the changes to the OU hierarchy.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng AWS Organizations với với nhiều OUs (Organizational Units)
> - Cần giải pháp phát hiện thay đổi trong sơ đồ tổ chức (OU hierarchy)
> - Cần thông báo cho operations team khi có thay đổi
> - Yêu cầu: LEAST operational overhead (ít vận hành nhất)

**Phân tích giải pháp tối ưu:**
Provision the AWS accounts by using AWS Control Tower. Use account drift notifications to identify the changes to the OU hierarchy.

AWS Control Tower là dịch vụ managed service giúp thiết lập và quản lý môi trường AWS multi-account một cách tự động và tuân thủ best practices. Cung cấp sẵn landing zone (môi trường AWS đã được cấu hình sẵn), guardrails (policies đảm bảo tuân thủ), account factory (tạo accounts tự động), và drift detection (phát hiện thay đổi không mong muốn) - tất cả đều tích hợp sẵn với Organizations.

Account drift notifications tự động thông báo khi có thay đổi, đáp ứng đúng yêu cầu với operational overhead thấp nhất vì tính năng này có sẵn, có thể sử dụng luôn mà không cần config gì nhiều.

Ảnh AWS Console về lỗi khi phát hiện drift

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Provision the AWS accounts by using AWS Control Tower. Use AWS Config aggregated rules to identify the changes to the OU hierarchy.**:
  AWS Config aggregated rules không được thiết kế để theo dõi thay đổi OU hierarchy.
  Config dùng để theo dõi các thay đổi trong AWS resource, không phải cấu trúc Organizations.

- **(A) Use AWS Service Catalog to create accounts in Organizations. Use an AWS CloudTrail organization trail to identify the changes to the OU hierarchy.**:
  Service Catalog là service quản lý các solution được build sẵn bằng CloudFormation, cho phép customer có thể triển khai nhanh chóng, không sử dụng để tạo account trong Organizations
  CloudTrail thì chỉ ghi lại lịch sử thao tác trong account, không có cơ chế thông báo khi phát hiện drift

- **(D) Use AWS CloudFormation templates to create accounts in Organizations. Use the drift detection operation on a stack to identify the changes to the OU hierarchy.**:
  CloudFormation drift detection chỉ phát hiện thay đổi trong resources được tạo bằng chính CloudFormation stack đó.
  Không tự động phát hiện thay đổi OU hierarchy do manual changes bên ngoài stack. Cần setup thêm automation để trigger drift detection và notification → overhead cao.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Detect changes/drift in Organizations" → Control Tower drift notifications

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Detect and resolve drift in AWS Control Tower

</details>

---

<div id="question-26"></div>

### Question 26: Integrate AWS Secrets Manager with Amazon RDS for PostgreSQL to automate password ...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs its databases on Amazon RDS for PostgreSQL. The company wants a secure solution to manage the master user password by rotating the password every 30 days.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EventBridge to schedule a custom AWS Lambda function to rotate the password every 30 days.
- **(B)** Use the modify-db-instance command in the AWS CLI to change the password.
- **(C)** Integrate AWS Secrets Manager with Amazon RDS for PostgreSQL to automate password rotation. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Integrate AWS Systems Manager Parameter Store with Amazon RDS for PostgreSQL to automate password rotation.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty chạy database trên Amazon RDS for PostgreSQL
> - Cần giải pháp bảo mật để quản lý master user password
> - Yêu cầu tự động rotate password mỗi 30 ngày
> - Cần giải pháp với LEAST operational overhead (ít công sức vận hành nhất)

**Phân tích giải pháp tối ưu:**
Integrate AWS Secrets Manager with Amazon RDS for PostgreSQL to automate password rotation.

AWS Secrets Manager là managed service chuyên dụng để lưu trữ, quản lý và tự động rotate các secrets như database credentials, API keys, passwords một cách an toàn.

AWS Secrets Manager có liên kết trực tiếp với RDS, hỗ trợ tự động rotate password theo lịch (built-in rotation).

Chỉ cần enable rotation, Secrets Manager tự động xử lý toàn bộ quy trình: tạo password mới, cập nhật RDS, lưu trữ an toàn.

Ít operational overhead nhất vì không cần viết code hay quản lý infrastructure.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use Amazon EventBridge to schedule a custom AWS Lambda function to rotate the password every 30 days.**:
  Giải pháp này hoạt động được nhưng yêu cầu tự viết Lambda function, quản lý EventBridge rule, xử lý logic rotate password.
  Operational overhead cao hơn so với dùng Secrets Manager có sẵn tính năng này.

- **(B) Use the modify-db-instance command in the AWS CLI to change the password.**:
  Đây là cách thay đổi password thủ công, không có tự động hóa, tốn effort.

- **(D) Integrate AWS Systems Manager Parameter Store with Amazon RDS for PostgreSQL to automate password rotation.**:
  Parameter Store có thể lưu trữ password nhưng không có cơ chế rotation tự động cho RDS như Secrets Manager.
  Vẫn cần tự viết logic rotation → operational overhead cao hơn.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Rotate credentials/passwords" → Nghĩ ngay đến AWS Secrets Manager

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Secrets Manager - Rotating Secrets for RDS:

</details>

---

<div id="question-27"></div>

### Question 27: A VPC peering connection between the VPCs
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has two VPCs that are located in the us-west-2 Region within the same AWS account. The company needs to allow network traffic between these VPCs. Approximately 500 GB of data transfer will occur between the VPCs each month.

What is the MOST cost-effective solution to connect these VPCs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Implement AWS Transit Gateway to connect the VPCs. Update the route tables of each VPC to use the transit gateway for inter-VPC communication.
- **(B)** Implement an AWS Site-to-Site VPN tunnel between the VPCs. Update the route tables of each VPC to use the VPN tunnel for inter-VPC communication.
- **(C)** Set up a 1 GB AWS Direct Connect connection between the VPCs. Update the route tables of each VPC to use the Direct Connect connection for inter-VPC communication.
- **(D)** Set up a VPC peering connection between the VPCs. Update the route tables of each VPC to use the VPC peering connection for inter-VPC communication. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty có 2 VPCs trong cùng Region (us-west-2) và cùng AWS account
> - Cần kết nối network giữa 2 VPCs
> - Lưu lượng dữ liệu: ~500 GB/tháng
> - Yêu cầu: giải pháp tiết kiệm chi phí nhất (MOST cost-effective)

**Phân tích giải pháp tối ưu:**
Set up a VPC peering connection between the VPCs. Update the route tables of each VPC to use the VPC peering connection for inter-VPC communication.

VPC Peering là tính năng cho phép kết nối mạng trực tiếp giữa 2 VPCs, cho phép các resources trong 2 VPCs giao tiếp với nhau.

Đây là giải pháp đơn giản nhất và rẻ nhất để kết nối VPCs trong cùng hoặc khác Region/Account

Không tốn phí thiết lập (no setup fee), không tốn phí sử dụng

Đơn giản, kết nối trực tiếp, không cần thông qua service trung gian

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Implement AWS Transit Gateway to connect the VPCs. Update the route tables of each VPC to use the transit gateway for inter-VPC communication.**:
  Transit Gateway tốn phí sử dụng, tốn phí data đi qua nó
  Phù hợp hơn cho kết nối nhiều VPCs (2+) hoặc hybrid network phức tạp, không phù hợp cho chỉ 2 VPCs

- **(B) Implement an AWS Site-to-Site VPN tunnel between the VPCs. Update the route tables of each VPC to use the VPN tunnel for inter-VPC communication.**:
  VPN dùng cho kết nối on-premises với VPC, không dùng cho VPC với VPC
  Có tốn chi phí , độ. trễ cao hơn và băng thông thấp hơn VPC Peering

- **(C) Set up a 1 GB AWS Direct Connect connection between the VPCs. Update the route tables of each VPC to use the Direct Connect connection for inter-VPC communication.**:
  Direct Connect cực kỳ đắt đỏ, hơn nữa chỉ dùng cho kết nối on-premises với VPC, không dùng cho VPC với VPC
  Setup phức tạp, cần thời gian triển khai lâu

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Nhắc đến việc kết nối 2 VPC với nhau thì nghĩ ngay đến VPC Peering

#### 📚 Tài liệu tham khảo chính thức (Official References):
- VPC Peering

</details>

---

<div id="question-28"></div>

### Question 28: Interface endpoints for Amazon S3
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is moving its data and applications to AWS during a multiyear migration project. The company wants to securely access data on Amazon S3 from the company's AWS Region and from the company's on-premises location. The data must not traverse the internet. The company has established an AWS Direct Connect connection between its Region and its on-premises location.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an AWS Key Management Service (AWS KMS) key to access the data securely from the Region and the on-premises location.
- **(B)** Create gateway endpoints for Amazon S3. Use the gateway endpoints to securely access the data from the Region and the on-premises location.
- **(C)** Create interface endpoints for Amazon S3. Use the interface endpoints to securely access the data from the Region and the on-premises location. `[Đáp án đúng ✅]`
- **(D)** Create a gateway in AWS Transit Gateway to access Amazon S3 securely from the Region and the on-premises location.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang migration lên AWS, có AWS Direct Connect đã kết nối giữa on-premises và AWS Region
> - Cần truy cập Amazon S3 từ cả AWS Region và on-premises
> - Yêu cầu: traffic KHÔNG đi qua internet

**Phân tích giải pháp tối ưu:**
Create interface endpoints for Amazon S3. Use the interface endpoints to securely access the data from the Region and the on-premises location.

→ Interface Endpoints (VPC Endpoints) cho S3 tạo ra Endpoint trong VPC, cho phép:

Truy cập S3 từ trong VPC mà không cần đi qua internet

Truy cập từ on-premises qua Direct Connect vì endpoint có private IP trong VPC

Traffic đi hoàn toàn trong AWS private network

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create gateway endpoints for Amazon S3. Use the gateway endpoints to securely access the data from the Region and the on-premises location.**:
  Gateway Endpoints chỉ cho phép các resource bên trong trong VPC truy cập đến S3, không cho phép các resource từ private truy cập đến S3
  Chỉ đáp ứng được nửa yêu cầu (Access đến S3 cho resource trên AWS)

- **Create a gateway in AWS Transit Gateway to access Amazon S3 securely from the Region and the on-premises location.**:
  Transit Gateway là công cụ kết nối mạng giữa các VPC hay môi trường on-premises, không phải endpoint cho việc truy cập S3
  Service sử dụng sai mục đích

- **(A) Use an AWS Key Management Service (AWS KMS) key to access the data securely from the Region and the on-premises location.**:
  KMS là dịch vụ mã hóa dữ liệu, không liên quan đến việc access S3 không đi qua internet

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "On-premises + Direct Connect/VPN + AWS service" → Interface Endpoints
- Gateway Endpoint chỉ áp dụng cho việc access từ các resouce bên trong VPC

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS PrivateLink for Amazon S3

</details>

---

<div id="question-29"></div>

### Question 29: The database to an Amazon RDS for MySQL Multi-AZ DB instance and an Application Lo...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (C)

#### 📋 Đề bài (Scenario)
A startup company is hosting a website for its customers on an Amazon EC2 instance. The website consists of a stateless Python application and a MySQL database. The website serves only a small amount of traffic. The company is concerned about the reliability of the instance and needs to migrate to a highly available architecture. The company cannot modify the application code.

Which combination of actions should a solutions architect take to achieve high availability for the website? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provision an internet gateway in each Availability Zone in use.
- **(B)** Migrate the database to an Amazon RDS for MySQL Multi-AZ DB instance. `[Đáp án đúng ✅]`
- **(C)** Create an Application Load Balancer to distribute traffic to an Auto Scaling group of EC2 instances that are distributed across two Availability Zones. `[Đáp án đúng ✅]`
- **(D)** Migrate the database to Amazon DynamoDB, and enable DynamoDB auto scaling.
- **(E)** Use AWS DataSync to synchronize the database data across multiple EC2 instances.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Startup đang chạy website trên 1 EC2 instance duy nhất
> - Application dạng stateless chạy Python + MySQL database
> - Traffic nhỏ, cần tính khả dụng cao (high availability)
> - Không được sửa code ứng dụng

**Phân tích giải pháp tối ưu:**
Migrate the database to an Amazon RDS for MySQL Multi-AZ DB instance.

MySQL hiện tại chạy trên EC2 do đó không có tính khả dụng cao (dính single point of failure)

Chuyển sang RDS là managed service Database đỡ tốn effort vận hành, giảm thiểu rủi ro

RDS Multi-AZ giúp tự động failover khi có sự cố trên zone, đảm bảo high availability cho database

Không cần sửa code vì vẫn dùng MySQL, chỉ thay đổi connection string của DB trỏ đến RDS

Create an Application Load Balancer to distribute traffic to an Auto Scaling group of EC2 instances that are distributed across two Availability Zones.

Đối với EC2 để tăng tính khả dụng thì cần sử dụng Auto Scaling Group để scale trên nhiều AZ

Kết hợp với ALB để thực hiện cân bằng tải trên các instance này

Hoàn toàn phù hợp cho application stateless - không chứa data bên trong instance, nên có thể scale thoải mái

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Provision an internet gateway in each Availability Zone in use.**:
  Vô lý vì internet gateway gắn vào level VPC, không gắn vào Zone
  Không liên quan đến high availability của ứng dụng hay database

- **(D) Migrate the database to Amazon DynamoDB, and enable DynamoDB auto scaling.**:
  Chuyển từ MySQL sang DynamoDB = thay đổi database engine hoàn toàn
  Phải sửa code ứng dụng (từ SQL queries sang DynamoDB API)
  Vi phạm yêu cầu "cannot modify the application code"

- **(E) Use AWS DataSync to synchronize the database data across multiple EC2 instances.**:
  DataSync dùng để migrate và đồng bộ data qua đường truyền online
  Không dùng cho mục đích tăng tính khả dụng, không có khả năng đồng bộ data của DB

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đối với yêu cầu về tính khả dụng cao (high availability) thì nghĩ ngay đến Multi-AZ
- Đối với EC2 để tăng tính khả dụng thì cần sử dụng Auto Scaling Group để scale trên nhiều AZ, kết hợp cân bằng tải với Load Balancer
- Đối với RDS thì cần bật cơ chế Multi-AZ

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon RDS Multi-AZ
- Resilience in Amazon EC2 Auto Scaling

</details>

---

<div id="question-30"></div>

### Question 30: AWS CloudFormation to set up the infrastructure
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has customers located across the world. The company wants to use automation to secure its systems and network infrastructure. The company's security team must be able to track and audit all incremental changes to the infrastructure.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Organizations to set up the infrastructure. Use AWS Config to track changes.
- **(B)** Use AWS CloudFormation to set up the infrastructure. Use AWS Service Catalog to track changes.
- **(C)** Use AWS Organizations to set up the infrastructure. Use AWS Service Catalog to track changes.
- **(D)** Use AWS CloudFormation to set up the infrastructure. Use AWS Config to track changes. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty muốn tự động hóa (automation) việc thiết lập hệ thống và hạ tầng mạng
> - Team bảo mật cần theo dõi và audit tất cả thay đổi phát sinh từ giờ trở đi (incremental changes) trên hạ tầng

**Phân tích giải pháp tối ưu:**
Use AWS CloudFormation to set up the infrastructure. Use AWS Config to track changes.

AWS CloudFormation là service IaC (Infrastructure as Code) cho phép quản lý và triển khai kiến trúc tự động hóa hoàn toàn thông qua code, phù hợp với yêu cầu tự động hóa việc thiết lập hệ thống và hạ tầng mạng

AWS Config là service cho phép theo dõi, audit, và ghi lại mọi thay đổi cấu hình trên tài nguyên AWS theo thời gian,

Kết hợp 2 dịch vụ này đáp ứng đúng cả 2 yêu cầu: automation + tracking changes

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use AWS Organizations to set up the infrastructure. Use AWS Config to track changes.**:
  AWS Organizations chỉ dùng để quản lý nhiều AWS accounts (consolidate billing, policies), không dùng để triển khai/setup hạ tầng như CloudFormation
  Không có khả năng automation infrastructure deployment

- **(C) Use AWS Organizations to set up the infrastructure. Use AWS Service Catalog to track changes.**:
  Vẫn dùng Organization, sai như đáp án trên

- **(B) Use AWS CloudFormation to set up the infrastructure. Use AWS Service Catalog to track changes.**:
  Mặc dù dùng CloudFormation để setup kiến trúc là đúng nhưng AWS Service Catalog không có khả năng track/audit changes như AWS Config
  AWS Service Catalog là service giúp quản lý các solution đã được build bằng CloudFormation, cho phép user có thể triển khai các solution này thông qua 1 cú click

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Automation + infrastructure" → Nghĩ đến CloudFormation (hoặc AWS CDK, SAM)
- "Track changes + audit" → Nghĩ đến AWS Config

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS CloudFormation Documentation
- AWS Config Documentation

</details>

---

<div id="question-31"></div>

### Question 31: Organization units (OUs) for each department in AWS Organizations
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has separate AWS accounts for its finance, data analytics, and development departments. Because of costs and security concerns, the company wants to control which services each AWS account can use.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a list of products in AWS Service Catalog in the AWS accounts to manage and control the usage of specific AWS services.
- **(B)** Use AWS CloudFormation to automatically provision only the AWS services that each department can use.
- **(C)** Create organization units (OUs) for each department in AWS Organizations. Attach service control policies (SCPs) to the OUs. `[Đáp án đúng ✅]`
- **(D)** Use AWS Systems Manager templates to control which AWS services each department can use.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty có nhiều AWS accounts riêng biệt cho các phòng ban (finance, data analytics, development)
> - Muốn kiểm soát services mà mỗi account được phép sử dụng
> - Yêu cầu: Giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create organization units (OUs) for each department in AWS Organizations. Attach service control policies (SCPs) to the OUs.

Có thể thấy các AWS Account đang được quản lý riêng biệt theo từng phòng ban, như vậy sẽ tốn effort, do đó cần solution quản lý multi-account tập trung, chính là Organizations

Tạo ra các organization units (OUs) theo từng phòng ban để quản lý account của phòng ban đó sẽ hiệu quả hơn về mặt vận hành

Organizations có chức năng SCP (Service control policy) cho phép gán các Policy ở level account / OU (Organization Unit) để quản lý permissions

SCP khi áp dụng vào OU sẽ tự động kế thừa xuống các account trong OU đó, không cần cấu hình từng account, giảm effort vận hành

Solution đáp ứng đầy đủ yêu cầu về security (kiểm soát chặt chẽ) và cost (ngăn sử dụng services tốn kém)

Diagram minh họa về Organization và việc kế thừa SCP

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use AWS Systems Manager templates to control which AWS services each department can use.**:
  Systems Manager chủ yếu dùng để tự động hóa các tasks liên quan đến vận hành EC2 (patch, configuration), không dùng để hạn chế permissions hay chặn services
  Không có khả năng kiểm soát quyền truy cập services ở cấp độ account

- **(B) Use AWS CloudFormation to automatically provision only the AWS services that each department can use.**:
  CloudFormation chỉ giúp tự động hóa việc tạo resources, không ngăn chặn việc tạo resources trên từng account
  Không có khả năng kiểm soát quyền truy cập services ở cấp độ account

- **(A) Set up a list of products in AWS Service Catalog in the AWS accounts to manage and control the usage of specific AWS services.**:
  AWS Service Catalog là service giúp quản lý các solution đã được build bằng CloudFormation, cho phép user có thể triển khai các solution này thông qua 1 cú click
  Không có khả năng kiểm soát quyền truy cập services ở cấp độ account

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Khi đề bài nhắc đến việc quản lý các account riêng lẻ, nghĩ đến Orgnizations
- Muốn chặn action trong kiến trúc Organizations, luôn nghĩ đến SCP
- SCP chủ yếu sử dụng để chặn action, không dùng cho allow

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Service control policies (SCPs)

</details>

---

<div id="question-32"></div>

### Question 32: Implement an interface VPC endpoint for Amazon SQS
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company runs an application in a VPC with public and private subnets. The VPC extends across multiple Availability Zones. The application runs on Amazon EC2 instances in private subnets. The application uses an Amazon Simple Queue Service (Amazon SQS) queue.

A solutions architect needs to design a secure solution to establish a connection between the EC2 instances and the SQS queue.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Implement an interface VPC endpoint for Amazon SQS. Configure the endpoint to use the private subnets. Add to the endpoint a security group that has an inbound access rule that allows traffic from the EC2 instances that are in the private subnets.
- **(B)** Implement an interface VPC endpoint for Amazon SQS. Configure the endpoint to use the public subnets. Attach to the interface endpoint a VPC endpoint policy that allows access from the EC2 instances that are in the private subnets.
- **(C)** Implement a gateway endpoint for Amazon SQS. Add a NAT gateway to the private subnets. Attach an IAM role to the EC2 instances that allows access to the SQS queue.
- **(D)** Implement an interface VPC endpoint for Amazon SQS. Configure the endpoint to use the public subnets. Attach an Amazon SQS access policy to the interface VPC endpoint that allows requests from only a specified VPC endpoint. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên EC2 trong private subnets
> - Cần kết nối đến Amazon SQS queue một cách an toàn và bảo mật

**Phân tích giải pháp tối ưu:**
Implement an interface VPC endpoint for Amazon SQS. Configure the endpoint to use the private subnets. Add to the endpoint a security group that has an inbound access rule that allows traffic from the EC2 instances that are in the private subnets.

Interface VPC endpoint cho phép kết nối private đến các service AWS, cụ thể ở đây là SQS mà không cần qua Internet

Endpoint đặt trong private subnets nên không access được vào từ bên ngoài, đảm bảo tính security

Security group kiểm soát inbound traffic, cho phép chỉ EC2 instances trong private subnets truy cập

Đây là solution phù hợp, đảm bảo đúng best practice

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Implement an interface VPC endpoint for Amazon SQS. Configure the endpoint to use the public subnets. Attach to the interface endpoint a VPC endpoint policy that allows access from the EC2 instances that are in the private subnets.**:
  Đặt endpoint trong public subnets không đảm bảo tính security như đề bài yêu cầu

- **(D) Implement an interface VPC endpoint for Amazon SQS. Configure the endpoint to use the public subnets. Attach an Amazon SQS access policy to the interface VPC endpoint that allows requests from only a specified VPC endpoint.**:
  Tương tự như đáp án ở trên

- **(C) Implement a gateway endpoint for Amazon SQS. Add a NAT gateway to the private subnets. Attach an IAM role to the EC2 instances that allows access to the SQS queue.**:
  Gateway endpoint chỉ hỗ trợ S3 và DynamoDB, không hỗ trợ SQS, vô lý
  NAT Gateway cũng không cần thiết nếu dùng VPC endpoint

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Private subnet + AWS service" → Access từ private subnet đến service một cách an toàn thì nghĩ đến VPC Endpoint (Interface VPC Endpoint hoặc Gateway Endpoint)
- Đối với S3 hay DynamoDB thì ưu tiên sử dụng Gateway Endpoint
- Best practice đối với Interface Endpoint là đặt trong private subnet

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Access an AWS service using an interface VPC endpoint

</details>

---

<div id="question-33"></div>

### Question 33: Generate Amazon S3 presigned URLs in the application
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A social media company is building a feature for its website. The feature will give users the ability to upload photos. The company expects significant increases in demand during large events and must ensure that the website can handle the upload traffic from users.

Which solution meets these requirements with the MOST scalability?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Upload files from the user's browser to the application servers. Transfer the files to an Amazon S3 bucket.
- **(B)** Provision an Amazon Elastic File System (Amazon EFS) file system. Upload files directly from the user's browser to the file system.
- **(C)** Provision an AWS Storage Gateway file gateway. Upload files directly from the user's browser to the file gateway.
- **(D)** Generate Amazon S3 presigned URLs in the application. Upload files directly from the user's browser into an S3 bucket. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website cho phép user upload ảnh (photos)
> - Yêu cầu: xử lý lưu lượng tăng đột biến (traffic surge) trong các sự kiện lớn
> - Giải pháp cần có khả năng scale tốt nhất (MOST scalability)

**Phân tích giải pháp tối ưu:**
Generate Amazon S3 presigned URLs in the application. Upload files directly from the user's browser into an S3 bucket.

Presigned URL là chức năng của S3 cho phép một URL tạm thời có chữ ký xác thực, cho phép user upload hoặc download trực tiếp từ S3 mà không cần AWS credentials

Để cấp được Presigned URL thì cần application server có quyền IAM phù hợp (có thể sử dụng EC2 hoặc API GW + Lambda, v.v..)

User upload trực tiếp lên S3 thông qua presigned URL, bỏ qua hoàn toàn application server, giúp tránh tắc nghẽn, bottleneck cho application server

S3 là service có khả năng mở rộng rốt, đáp ứng traffic cao khi có nhiều request upload

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Upload files from the user's browser to the application servers. Transfer the files to an Amazon S3 bucket.**:
  Việc upload trung gian qua application server sẽ gây quá tải cho server, hơn nữa băng thông server có giới hạn nên không thể scale tốt được

- **(C) Provision an AWS Storage Gateway file gateway. Upload files directly from the user's browser to the file gateway.**:
  Storage Gateway là solution storage dành cho on-premise đồng bộ data lên cloud,
  Không dùng cho mục đích upload trực tiếp từ browser của end-user

- **(B) Provision an Amazon Elastic File System (Amazon EFS) file system. Upload files directly from the user's browser to the file system.**:
  EFS là shared file system, không được thiết kế để user upload trực tiếp từ browser
  Muốn upload thì bắt buộc phải trung gian qua application server, lại bị bottleneck
  Chi phí cao, khả năng mở rộng không tốt như S3

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đề bài yêu cầu upload ảnh cần có khả năng scale tốt, nghĩ đến S3 với Presigned URL

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Uploading objects with presigned URLs

</details>

---

<div id="question-34"></div>

### Question 34: Storage autoscaling in RDS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An application uses an Amazon RDS MySQL DB instance. The RDS database is becoming low on disk space. A solutions architect wants to increase the disk space without downtime.

Which solution meets these requirements with the LEAST amount of effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Back up the RDS database, increase the storage capacity, restore the database, and stop the previous instance
- **(B)** Change the RDS database instance storage type to Provisioned IOPS
- **(C)** Increase the RDS database instance size
- **(D)** Enable storage autoscaling in RDS `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng dùng Amazon RDS MySQL
> - RDS đang hết dung lượng ổ đĩa (low on disk space)
> - Yêu cầu: tự động tăng dung lượng không downtime (without downtime)
> - Ưu tiên: ít effort nhất (LEAST amount of effort)

**Phân tích giải pháp tối ưu:**
Enable storage autoscaling in RDS

→ Storage Autoscaling là tính năng tự động tăng dung lượng khi RDS sắp đầy, không gây ra downtime và không cần can thiệp thủ công.

Chỉ cần bật tính năng một lần, RDS sẽ tự động scale khi cần

Đáp ứng đúng yêu cầu: không downtime + ít effort nhất

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Increase the RDS database instance size**:
  → Tăng instance size (change instance type) sẽ gây downtime vì RDS cần restart để áp dụng thay đổi, hơn nữa việc này chỉ giúp tăng CPU và tăng Memory, không tăng được Storage

- **Change the RDS database instance storage type to Provisioned IOPS**:
  → Đổi loại storage cũng gây ra downtime, hơn nữa đáp án không nhắc đến việc tăng size storage thì cũng không giải quyết được gốc rễ vấn đề

- **Back up the RDS database, increase the storage capacity, restore the database, and stop the previous instance**:
  → Quy trình phức tạp, tốn công, tốn thời gian. Không nhất thiết phải làm như vậy đối với use case đơn giản là tăng storage

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Low on disk space" + RDS → Nghĩ đến Storage Autoscaling

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Managing capacity automatically with Amazon RDS storage autoscaling

</details>

---

<div id="question-35"></div>

### Question 35: A scheduled scaling policy for the Auto Scaling group to launch new instances befo...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company hosts an application on Amazon EC2 On-Demand Instances in an Auto Scaling group. Application peak hours occur at the same time each day. Application users report slow application performance at the start of peak hours. The application performs normally 2-3 hours after peak hours begin. The company wants to ensure that the application works properly at the start of peak hours.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an Application Load Balancer to distribute traffic properly to the instances.
- **(B)** Configure a dynamic scaling policy for the Auto Scaling group to launch new instances based on memory utilization.
- **(C)** Configure a dynamic scaling policy for the Auto Scaling group to launch new instances based on CPU utilization.
- **(D)** Configure a scheduled scaling policy for the Auto Scaling group to launch new instances before peak hours. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên EC2 On-Demand trong Auto Scaling group
> - Giờ cao điểm (peak hours) xảy ra cùng giờ mỗi ngày
> - Vấn đề: Performance chậm lúc BẮT ĐẦU giờ cao điểm, sau 2-3 tiếng thì bình thường trở lại
> - Mục tiêu: Đảm bảo ứng dụng hoạt động tốt NGAY TỪ ĐẦU giờ cao điểm

**Phân tích giải pháp tối ưu:**
Configure a scheduled scaling policy for the Auto Scaling group to launch new instances before peak hours.

Scheduled Scaling là tính năng của Auto Scaling cho phép tự động tăng/giảm số lượng instances theo lịch trình đã định trước.

Giờ cao điểm xảy ra cố định mỗi ngày → có thể dự đoán trước được thời gian, do đó scheduled scaling sẽ là giải pháp hợp lý

Scheduled scaling sẽ giúp scale đủ số lượng instance trước giờ cao điểm, tránh việc khi traffic tăng lên thì performance bị chậm, bị giảm

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an Application Load Balancer to distribute traffic properly to the instances.**:
  ALB chỉ là service cân bằng tải traffic giữa các EC2, không giúp gì cho việc scale để đáp ứng traffic cả

- **Configure a dynamic scaling policy for the Auto Scaling group to launch new instances based on memory utilization.**:
  Dynamic scaling chỉ scale SAU KHI phát hiện traffic tăng lên, các thông số vượt ngưỡng đã định nghĩa (vd vượt mức Memory 80%)
  Sẽ mất một khoảng thời gian từ khi phát hiện → scale thêm instance → chờ instances vào trạng thái sẵn sàng (2-3 phút trở lên)
  Không giải quyết được vấn đề chậm ngay từ đầu giờ cao điểm

- **Configure a dynamic scaling policy for the Auto Scaling group to launch new instances based on CPU utilization.**:
  Sai tương tự như đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Same time each day" / "predictable pattern" → Scheduled Scaling
- Với việc biết trước traffic sẽ lên cao vào một thời điểm cố định thì Scheduled scaling sẽ là lựa chọn phù hợp

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Scheduled scaling for Amazon EC2 Auto Scaling

</details>

---

<div id="question-36"></div>

### Question 36: AWS Snowball Edge Storage Optimized
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is relocating its data center and wants to securely transfer 50 TB of data to AWS within 2 weeks. The existing data center has a Site-to-Site VPN connection to AWS that is 90% utilized.

Which AWS service should a solutions architect use to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Direct Connect
- **(B)** AWS DataSync with a VPC endpoint
- **(C)** AWS Storage Gateway
- **(D)** AWS Snowball Edge Storage Optimized `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty cần chuyển 50 TB dữ liệu lên AWS
> - Thời gian: trong vòng 2 tuần
> - Đã có Site-to-Site VPN nhưng đang bị chiếm dụng mất 90% băng thông không sử dụng được
> - Cần solution phù hợp

**Phân tích giải pháp tối ưu:**
AWS Snowball Edge Storage Optimized

Với 50 TB dữ liệu và VPN đã dùng 90% băng thông, việc truyền qua đường truyền online sẽ không khả thi trong 2 tuần, do đó sẽ cần solution migrate qua đường vật lý

Snowball Edge là thiết bị vật lý cho phép chuyển dữ liệu lớn một cách nhanh chóng và an toàn qua hình thức shipping thiết bị lên AWS, không phụ thuộc vào băng thông mạng hiện tại

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **AWS DataSync with a VPC endpoint**:
  DataSync truyền dữ liệu qua mạng (VPN hoặc Direct Connect hoặc internet)
  VPN hiện tại đã dùng 90% → không đủ băng thông để truyền 50 TB trong 2 tuần
  Không đáp ứng được deadline

- **AWS Direct Connect**:
  Direct Connect cần thời gian setup từ vài tuần đến vài tháng
  Không phù hợp với yêu cầu hoàn thành trong 2 tuần
  Chỉ phù hợp cho nhu cầu truyền dữ liệu lâu dài giữa on-premise và AWS, không dùng cho use case migrate data một lần duy nhất

- **AWS Storage Gateway**:
  Storage Gateway cũng truyền dữ liệu qua mạng
  Tương tự DataSync, sẽ bị giới hạn bởi băng thông VPN hiện tại (90% utilized)
  Không đáp ứng được deadline

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đối với dạng câu hỏi về việc migrate data từ on-premise lên AWS, cần xem xét các thông số sau:
- Lượng dữ liệu
- Băng thông mạng hiện tại (*đôi khi đề không có)
- Thời gian cần để migrate (*đôi khi đề không đưa thông số này)
- Tính xem với lượng dữ liệu đó, với băng thông mạng hiện tại thì có migrate hết qua đường online được trong thời gian quy định hay không?
- Nếu có: Thường chọn các solution migrate online như Datasync, upload trực tiếp
- Nếu không: Thường chọn solution migrate qua đường vật lý như Snowball
- Mẹo: Data tầm chục / vài chục TB trở lên thì hầu như sẽ sử dụng Snowball

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Large data migration with Snowball Edge

</details>

---

<div id="question-37"></div>

### Question 37: Compute optimized EC2 instances into a cluster placement group and Attach the EC2 ...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A company uses an on-premises network-attached storage (NAS) system to provide file shares to its high performance computing (HPC) workloads. The company wants to migrate its latency-sensitive HPC workloads and its storage to the AWS Cloud. The company must be able to provide NFS and SMB multi-protocol access from the file system.

Which solution will meet these requirements with the LEAST latency? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Attach the EC2 instances to an Amazon FSx for OpenZFS file system.
- **(B)** Attach the EC2 instances to an Amazon FSx for Lustre file system.
- **(C)** Deploy compute optimized EC2 instances into a partition placement group.
- **(D)** Deploy compute optimized EC2 instances into a cluster placement group. `[Đáp án đúng ✅]`
- **(E)** Attach the EC2 instances to an Amazon FSx for NetApp ONTAP file system. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty đang dùng storage NAS on-premises cho các công việc cần compute performance cao (HPC)
> - Muốn migrate lên AWS
> - Solution storage trên AWS cần hỗ trợ cả 2 protocol (NFS và SMB)
> - Yêu cầu solution phải có độ trễ thấp nhất (LEAST latency)

**Phân tích giải pháp tối ưu:**
Deploy compute optimized EC2 instances into a cluster placement group.

Cluster placement group là hình thức cho phép đặt các EC2 instances nằm trên cùng một dàn server vật lý trong cùng 1 AZ, do đó đạt băng thông cao nhất và độ trễ thấp nhất cho việc truyền tải data giữa các instances

Đây là lựa chọn tối ưu cho HPC workloads cần networking độ trễ thấp

Attach the EC2 instances to an Amazon FSx for NetApp ONTAP file system.

FSx for NetApp ONTAP là dịch vụ storage duy nhất trong các lựa chọn hỗ trợ cả NFS và SMB (multi-protocol)

Phù hợp cho latency-sensitive workloads với hiệu năng cao

Đáp ứng đầy đủ yêu cầu đề bài

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy compute optimized EC2 instances into a partition placement group.**:
  Partition placement group dùng cho việc phân tán EC2 trên nhiều dàn vật lý khác nhau trên nhiều zone để tăng tính khả dụng availability
  Không tối ưu độ trễ thấp như cluster placement group

- **Attach the EC2 instances to an Amazon FSx for Lustre file system.**:
  FSx for Lustre tuy có hiệu năng rất cao cho HPC nhưng không hỗ trợ SMB
  Không đáp ứng yêu cầu multi-protocol (NFS + SMB)

- **Attach the EC2 instances to an Amazon FSx for OpenZFS file system.**:
  FSx for OpenZFS hỗ trợ NFS với hiệu năng tốt nhưng không hỗ trợ SMB natively
  Không đáp ứng yêu cầu multi-protocol (NFS + SMB)

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "HPC workloads" + "latency-sensitive" → Cluster Placement Group
- "NFS + SMB" (multi-protocol) → FSx for NetApp ONTAP

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Placement strategies for your placement groups
- Amazon FSx for NetApp ONTAP

</details>

---

<div id="question-38"></div>

### Question 38: An Amazon RDS proxy for the database
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A solutions architect is reviewing the resilience of an application. The solutions architect notices that a database administrator recently failed over the application's Amazon Aurora PostgreSQL database writer instance as part of a scaling exercise. The failover resulted in 3 minutes of downtime for the application.

Which solution will reduce the downtime for scaling exercises with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon ElastiCache for Memcached cluster to handle the load during failover.
- **(B)** Set up a secondary Aurora PostgreSQL cluster in the same AWS Region. During failover, update the application to use the secondary cluster's writer endpoint.
- **(C)** Set up an Amazon RDS proxy for the database. Update the application to use the proxy endpoint. `[Đáp án đúng ✅]`
- **(D)** Create more Aurora PostgreSQL read replicas in the cluster to handle the load during failover.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Database admin thực hiện test failover cho Aurora PostgreSQL writer instance
> - Kết quả: ứng dụng bị downtime 3 phút
> - Yêu cầu: giảm downtime khi scaling với ít operational overhead nhất

**Phân tích giải pháp tối ưu:**
Set up an Amazon RDS proxy for the database. Update the application to use the proxy endpoint.

RDS Proxy đóng vai trò đứng trước database, tự động quản lý connection pooling và duy trì kết nối khi writer instance thay đổi (instance bên zone còn lại lên làm writer instance) sau khi failover.

Khi failover xảy ra, RDS Proxy tự động chuyển hướng connection đến writer instance mới mà không cần ứng dụng phải reconnect, giảm đáng kể downtime.

Operational overhead thấp: chỉ cần setup một lần, không cần quản lý thêm infrastructure phức tạp.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create more Aurora PostgreSQL read replicas in the cluster to handle the load during failover.**:
  Read replica chỉ tăng khả năng xử lý read traffic, không liên quan đến vấn đề writer failover downtime.

- **(B) Set up a secondary Aurora PostgreSQL cluster in the same AWS Region. During failover, update the application to use the secondary cluster's writer endpoint..**:
  Tốn chi phí duy trì một cluster thứ hai chạy song song không cần thiết
  Thao tác failover thủ công, downtime cao, không giải quyết được vấn đề

- **Create an Amazon ElastiCache for Memcached cluster to handle the load during failover.**:
  ElastiCache chỉ đóng vai trò là caching layer, không thể thay thế writer database trong quá trình failover.
  Không giải quyết vấn đề giảm downtime cho database writer khi failover.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Để giảm thời gian downtime khi failover cho RDS / Aurora, sử dụng RDS Proxy

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Improving application availability with Amazon RDS Proxy

</details>

---

<div id="question-39"></div>

### Question 39: Images in Amazon S3 Standard-Infrequent Access (S3 Standard-IA)
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs a website that stores images of historical events. Website users need the ability to search and view images based on the year that the event in the image occurred. On average, users request each image only once or twice a year. The company wants a highly available solution to store and deliver the images to users.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store images in Amazon Elastic File System (Amazon EFS). Use a web server that runs on Amazon EC2.
- **(B)** Store images in Amazon Elastic Block Store (Amazon EBS). Use a web server that runs on Amazon EC2.
- **(C)** Store images in Amazon S3 Standard-Infrequent Access (S3 Standard-IA). Use S3 Standard-IA to directly deliver images by using a static website. `[Đáp án đúng ✅]`
- **(D)** Store images in Amazon S3 Standard. Use S3 Standard to directly deliver images by using a static website.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website lưu trữ ảnh
> - Tần suất truy cập: mỗi ảnh chỉ được xem 1-2 lần/năm
> - Yêu cầu: giải pháp lưu trữ có tính khả dụng cao highly available và cost-effective nhất

**Phân tích giải pháp tối ưu:**
Store images in Amazon S3 Standard-Infrequent Access (S3 Standard-IA). Use S3 Standard-IA to directly deliver images by using a static website.

Đối với việc lưu trữ các content tĩnh như ảnh, video, v.v... thì S3 là lựa chọn hợp lý

Với tần suất ít truy cập (1-2 lần/năm), sử dụng S3 Standard-IA sẽ giúp tiết kiệm chi phí hơn so với S3 Standard mà vẫn đảm bảo tính khả dụng cao

S3 static website hosting cho phép host web tĩnh để hiển thị ảnh trực tiếp mà không cần server như EC2 v.v.. giúp tiết kiệm chi phí compute

Pattern: infrequent access + static content → S3-IA + static website

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Store images in Amazon Elastic Block Store (Amazon EBS). Use a web server that runs on Amazon EC2.**:
  EBS chi phí cao hơn so với S3, không hiệu quả
  Sử dụng EC2 cũng tốn thêm chi phí

- **(A) Store images in Amazon Elastic File System (Amazon EFS). Use a web server that runs on Amazon EC2.**:
  EFS chi phí cao hơn so với S3, không hiệu quả
  Sử dụng EC2 cũng tốn thêm chi phí

- **(D) Store images in Amazon S3 Standard. Use S3 Standard to directly deliver images by using a static website.**:
  Chi phí S3 Standard cao hơn so với Standard-IA cho use case tần suất truy cập thấp

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-40"></div>

### Question 40: A web ACL in AWS WAF and a public Application Load Balancer
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A company runs a web application on Amazon EC2 instances in an Auto Scaling group that has a target group. The company designed the application to work with session affinity (sticky sessions) for a better user experience.

The application must be available publicly over the internet as an endpoint. A WAF must be applied to the endpoint for additional security. Session affinity (sticky sessions) must be configured on the endpoint.

Which combination of steps will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a second target group. Add Elastic IP addresses to the EC2 instances.
- **(B)** Create a public Network Load Balancer. Specify the application target group.
- **(C)** Create a Gateway Load Balancer. Specify the application target group.
- **(D)** Create a web ACL in AWS WAF. Associate the web ACL with the endpoint `[Đáp án đúng ✅]`
- **(E)** Create a public Application Load Balancer. Specify the application target group. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web app chạy trên EC2 trong Auto Scaling group
> - Yêu cầu 1: Cần solution support sticky session, cho phép truy cập tử internet vào
> - Yêu cầu 2: Áp dụng và triển khai WAF

**Phân tích giải pháp tối ưu:**
Create a public Application Load Balancer. Specify the application target group.

Application Load Balancer (ALB) hỗ trợ sticky sessions thông qua cookie-based routing

ALB hoạt động ở Layer 7 (HTTP/HTTPS), phù hợp cho web application

ALB có thể tích hợp trực tiếp với AWS WAF

Public ALB cho phép truy cập từ internet

Create a web ACL in AWS WAF. Associate the web ACL with the endpoint

WAF là service tường lửa giúp ngăn chặn các loại hình tấn công phổ biến như SQL Injection, XSS và cho phép tạo rules để filter traffic dựa trên IP, headers, body, hoặc URI patterns.

Để sử dụng AWS WAF, cần config thông qua Web ACL (Access Control List)

Web ACL chứa các rules bảo mật (SQL injection, XSS, rate limiting...)

Web ACL sau đó cần được gắn với ALB endpoint để hoạt động

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a public Network Load Balancer. Specify the application target group.**:
  Network Load Balancer (NLB) không hỗ trợ sticky sessions và KHÔNG tích hợp được với AWS WAF như ALB

- **Create a Gateway Load Balancer. Specify the application target group.**:
  Gateway Load Balancer (GWLB) dùng cho việc scan ip package, không dùng cho web application với sticky sessions
  GWLB không support sử dụng WAF

- **Create a second target group. Add Elastic IP addresses to the EC2 instances.**:
  Tạo thêm target group không giải quyết yêu cầu về sticky sessions hay WAF
  Elastic IP cũng chỉ là Public IP cố định cho EC2, ở đây không có mục đích sử dụng gì cả

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Sticky sessions" + "Web application" → Application Load Balancer (ALB)
- "WAF integration" → gắn cho ALB, không gắn cho NLB

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Web Application Firewall (WAF) for Application Load Balancers

</details>

---

<div id="question-41"></div>

### Question 41: An Amazon CloudFront distribution with an Amazon S3 endpoint to an S3 bucket that ...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company recently migrated its web application to the AWS Cloud. The company uses an Amazon EC2 instance to run multiple processes to host the application. The processes include an Apache web server that serves static content. The Apache web server makes requests to a PHP application that uses a local Redis server for user sessions.

The company wants to redesign the architecture to be highly available and to use AWS managed solutions.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Lambda to host the static content and the PHP application. Use an Amazon API Gateway REST API to proxy requests to the Lambda function. Set the API Gateway CORS configuration to respond to the domain name. Configure Amazon ElastiCache for Redis to handle session information.
- **(B)** Use AWS Elastic Beanstalk to host the static content and the PHP application. Configure Elastic Beanstalk to deploy its EC2 instance into a public subnet. Assign a public IP address.
- **(C)** Keep the backend code on the EC2 instance. Create an Amazon ElastiCache for Redis cluster that has Multi-AZ enabled. Configure the ElastiCache for Redis cluster in cluster mode. Copy the frontend resources to Amazon S3. Configure the backend code to reference the EC2 instance.
- **(D)** Configure an Amazon CloudFront distribution with an Amazon S3 endpoint to an S3 bucket that is configured to host the static content. Configure an Application Load Balancer that targets an Amazon Elastic Container Service (Amazon ECS) service that runs AWS Fargate tasks for the PHP application. Configure the PHP application to use an Amazon ElastiCache for Redis cluster that runs in multiple Availability Zones. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng web hiện chạy trên 1 EC2 instance
> - Bao gồm: Apache (static content) → PHP app → local Redis (sessions)
> - Yêu cầu: thiết kế lại để highly available + sử dụng AWS managed solutions

**Phân tích giải pháp tối ưu:**
Configure an Amazon CloudFront distribution with an Amazon S3 endpoint to an S3 bucket that is configured to host the static content. Configure an Application Load Balancer that targets an Amazon Elastic Container Service (Amazon ECS) service that runs AWS Fargate tasks for the PHP application. Configure the PHP application to use an Amazon ElastiCache for Redis cluster that runs in multiple Availability Zones.

CloudFront + S3: giải pháp AWS managed tốt nhất cho static content, vừa có tính khả dụng cao của S3, lại có tốc độ delivery content tốt của CloudFront

ALB + ECS Fargate: chạy PHP app dạng container, fully managed, dễ scale

ElastiCache for Redis Multi-AZ: thay thế cho Redis local, đảm bảo không mất session data và có tính khả dụng cao (high availability)

Solution này sử dụng toàn bộ đều là managed services, có tính khả dụng cao, giảm effort vận hành

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use AWS Elastic Beanstalk to host the static content and the PHP application. Configure Elastic Beanstalk to deploy its EC2 instance into a public subnet. Assign a public IP address.**:
  Elastic Beanstalk vẫn chạy trên EC2, không tối ưu về mặt chi phí cho việc chạy static content
  Không đề cập gì đến giải pháp cho Redis sessions
  Thiếu multi-AZ setup rõ ràng

- **(A) Use AWS Lambda to host the static content and the PHP application. Use an Amazon API Gateway REST API to proxy requests to the Lambda function. Set the API Gateway CORS configuration to respond to the domain name. Configure Amazon ElastiCache for Redis to handle session information.**:
  Lambda không phù hợp để host static content (S3 + CloudFront tốt hơn về cost và performance)

- **(C) Keep the backend code on the EC2 instance. Create an Amazon ElastiCache for Redis cluster that has Multi-AZ enabled. Configure the ElastiCache for Redis cluster in cluster mode. Copy the frontend resources to Amazon S3. Configure the backend code to reference the EC2 instance.**:
  Vẫn giữ backend trên một EC2 instance duy nhất, không đảm bảo high availability
  Không có load balancing hay auto-scaling cho backend để tăng tính khả dụng

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "static content + high availability" → S3 + CloudFront
- "local Redis + sessions + HA" → ElastiCache for Redis Multi-AZ
- "highly available" → ưu tiên các managed service, có tính khả dụng cao, support Multi-AZ

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Minimizing downtime in ElastiCache by using Multi-AZ with Valkey and Redis OSS
- Amazon S3 + Amazon CloudFront: A Match Made in the Cloud

</details>

---

<div id="question-42"></div>

### Question 42: DynamoDB in on-demand mode by using the DynamoDB Standard table class
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is designing a new web application that will run on Amazon EC2 Instances. The application will use Amazon DynamoDB for backend data storage. The application traffic will be unpredictable. The company expects that the application read and write throughput to the database will be moderate to high. The company needs to scale in response to application traffic.

Which DynamoDB table configuration will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure DynamoDB with provisioned read and write by using the DynamoDB Standard table class. Set DynamoDB auto scaling to a maximum defined capacity.
- **(B)** Configure DynamoDB in on-demand mode by using the DynamoDB Standard Infrequent Access (DynamoDB Standard-IA) table class.
- **(C)** Configure DynamoDB in on-demand mode by using the DynamoDB Standard table class. `[Đáp án đúng ✅]`
- **(D)** Configure DynamoDB with provisioned read and write by using the DynamoDB Standard Infrequent Access (DynamoDB Standard-IA) table class. Set DynamoDB auto scaling to a maximum defined capacity.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng web chạy trên EC2, backend dùng DynamoDB
> - Traffic không thể đoán trước (unpredictable)
> - Tần suất truy cập từ trung bình đến cao (read/write throughput moderate to high)
> - Cần scale theo traffic
> - Yêu cầu: cost-effective nhất

**Phân tích giải pháp tối ưu:**
Configure DynamoDB in on-demand mode by using the DynamoDB Standard table class.

On-demand mode là chế độ băng thông của DynamoDB giúp tự động scale để đáp ứng bất cứ lượng traffic nào, phù hợp với yêu cầu traffic unpredictable

DynamoDB Standard là tầng lưu trữ phù hợp với tần suất truy cập nhiều, đáp ứng yêu cầu read/write throughput moderate to high

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure DynamoDB with provisioned read and write by using the DynamoDB Standard table class. Set DynamoDB auto scaling to a maximum defined capacity.**:
  Provisioned mode phù hợp với traffic có tính ổn định, có thể thể ước tính trước được
  Do traffic không thể đoán trước nên sẽ không phù hợp

- **Configure DynamoDB with provisioned read and write by using the DynamoDB Standard Infrequent Access (DynamoDB Standard-IA) table class. Set DynamoDB auto scaling to a maximum defined capacity.**:
  Tương tự như đáp án trên, provisioned không phù hợp cho traffic không thể biết trước được

- **Configure DynamoDB in on-demand mode by using the DynamoDB Standard Infrequent Access (DynamoDB Standard-IA) table class.**:
  On-demand mode mặc dù đúng, nhưng Standard-IA sai
  Standard-IA chỉ hiệu quả, giúp tiết kiệm chi phí khi tần suất truy cập ít (access < 1-2 lần/tháng)
  Đề bài nói moderate to high throughput → dùng IA sẽ tốn kém hơn Standard

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Unpredictable traffic" → On-demand mode

#### 📚 Tài liệu tham khảo chính thức (Official References):
- DynamoDB throughput capacity

</details>

---

<div id="question-43"></div>

### Question 43: A transient cluster that runs the primary node and core nodes on On-Demand Instanc...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has a large data workload that runs for 6 hours each day. The company cannot lose any data while the process is running. A solutions architect is designing an Amazon EMR cluster configuration to support this critical data workload.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure a transient cluster that runs the primary node on an On-Demand Instance and the core nodes and task nodes on Spot Instances.
- **(B)** Configure a transient cluster that runs the primary node and core nodes on On-Demand Instances and the task nodes on Spot Instances. `[Đáp án đúng ✅]`
- **(C)** Configure a long-running cluster that runs the primary node on an On-Demand Instance, the core nodes on Spot Instances, and the task nodes on Spot Instances.
- **(D)** Configure a long-running cluster that runs the primary node and core nodes on On-Demand Instances and the task nodes on Spot Instances.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Workload chạy 6 giờ mỗi ngày
> - Không được để mất dữ liệu trong quá trình chạy (critical data)
> - Cần config Amazon EMR cluster với chi phí tối ưu

**Phân tích giải pháp tối ưu:**
Configure a transient cluster that runs the primary node and core nodes on On-Demand Instances and the task nodes on Spot Instances.

Transient cluster là cụm EMR được tạo tạm thời để chạy một công việc cụ thể, sau khi hoàn thành công việc thì tự động terminate để tiết kiệm chi phí - phù hợp cho workload chạy ngắn theo lịch, đáp ứng yêu cầu 6h/ngày

Primary và Core nodes là hai thành phần quan trọng trong kiến trúc cluster, để đảm bảo không mất dữ liệu thì cần sử dụng loại instance có tính ổn định, đó là On-demand

Task node chỉ xử lý những tác vụ phụ, không quan trọng nên có thể dùng Spot instance để tối ưu hóa chi phí. Spot instance có thể bị thu hồi bất cứ lúc nào, gây ra gián đoạn, nhưng sẽ không ảnh hưởng dữ liệu

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure a long-running cluster that runs the primary node and core nodes on On-Demand Instances and the task nodes on Spot Instances.**:
  Long-running cluster chạy liên tục 24/7, lãng phí chi phí cho workload chỉ cần 6h/ngày
  Mặc dù cấu hình node đúng nhưng không tối ưu chi phí (cost-effective)

- **Configure a transient cluster that runs the primary node on an On-Demand Instance and the core nodes and task nodes on Spot Instances.**:
  Core nodes dùng Spot Instances có thể bị terminate bất ngờ dẫn đến mất dữ liệu, không đáp ứng yêu cầu "cannot lose any data"

- **Configure a long-running cluster that runs the primary node on an On-Demand Instance, the core nodes on Spot Instances, and the task nodes on Spot Instances.**:
  Kết hợp cái sai của cả 2 đáp án ở trên là Long-running cluster và dùng Spot Instance cho Core node

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- EMR đối với Primary Node & Core Node thì ưu tiên sử dụng loại EC2 có tính ổn định như On-demand
- Task node không quan trọng có thể sử dụng Spot Instance để tiết kiệm chi phí

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Understand node types in Amazon EMR: primary, core, and task nodes

</details>

---

<div id="question-44"></div>

### Question 44: Transition the objects to S3 Standard-Infrequent Access (S3 Standard-IA) after 180...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company stores a large volume of image files in an Amazon S3 bucket. The images need to be readily available for the first 180 days. The images are infrequently accessed for the next 180 days. After 360 days, the images need to be archived but must be available instantly upon request. After 5 years, only auditors can access the images. The auditors must be able to retrieve the images within 12 hours. The images cannot be lost during this process.

A developer will use S3 Standard storage for the first 180 days. The developer needs to configure an S3 Lifecycle rule.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Transition the objects to S3 One Zone-Infrequent Access (S3 One Zone-IA) after 180 days. S3 Glacier Instant Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.
- **(B)** Transition the objects to S3 One Zone-Infrequent Access (S3 One Zone-IA) after 180 days. S3 Glacier Flexible Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.
- **(C)** Transition the objects to S3 Standard-Infrequent Access (S3 Standard-IA) after 180 days, S3 Glacier Instant Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Transition the objects to S3 Standard-Infrequent Access (S3 Standard-IA) after 180 days, S3 Glacier Flexible Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty lưu khối lượng lớn file ảnh trên S3
> - 0-180 ngày: cần truy cập thường xuyên → dùng S3 Standard
> - 180-360 ngày: truy cập không thường xuyên (infrequently accessed)
> - Sau 360 ngày: cần lưu trữ lâu dài (archived) nhưng phải có ngay lập tức khi yêu cầu (available instantly)
> - Sau 5 năm: chỉ có người auditor truy cập, lấy trong vòng 12 giờ (retrieve within 12 hours)
> - Không được mất dữ liệu (cannot be lost)
> - Yêu cầu: giải pháp TỐI ƯU CHI PHÍ NHẤT (MOST cost-effective)

**Phân tích giải pháp tối ưu:**
Transition the objects to S3 Standard-Infrequent Access (S3 Standard-IA) after 180 days, S3 Glacier Instant Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.

S3 Standard-IA (180-360 ngày): Phù hợp cho việc truy cập không thường xuyên, vẫn đảm bảo tính khả dụng cao (data được copy và lưu trên 3 zone), đáp ứng yêu cầu không được mất dữ liệu

S3 Glacier Instant Retrieval (sau 360 ngày): Phù hợp cho việc lưu trữ data lâu dài mà vẫn đảm bảo khi cần có thể lấy file ngay lập tức, đáp ứng yêu cầu "available instantly upon request"

S3 Glacier Deep Archive (sau 5 năm): Đây là tầng lưu trữ rẻ nhất, phù hợp lưu trữ lâu dài, khi cần file có thể lấy trong vòng 12 tiếng (Standard retrieval), đáp ứng yêu cầu "retrieve within 12 hours"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Transition the objects to S3 One Zone-Infrequent Access (S3 One Zone-IA) after 180 days. S3 Glacier Instant Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.**:
  One Zone-IA chỉ lưu data trên 1 AZ, không đáp ứng yêu cầu không được để mất dữ liệu "cannot be lost"

- **(B) Transition the objects to S3 One Zone-Infrequent Access (S3 One Zone-IA) after 180 days. S3 Glacier Flexible Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.**:
  Vẫn dùng One Zone-IA, sai tương tự như đáp án trên
  Glacier Flexible Retrieval cũng không có khả năng lấy file ngay lập tức như Glacier Instant Retrieval, không đáp ứng yêu cầu

- **(D) Transition the objects to S3 Standard-Infrequent Access (S3 Standard-IA) after 180 days, S3 Glacier Flexible Retrieval after 360 days, and S3 Glacier Deep Archive after 5 years.**:
  Sử dụng Glacier Flexible Retrieval, sai tương tự như đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Cách lựa chọn các tầng lưu trữ cho S3:
- Truy cập nhiều, thường xuyên → Standard
- Ít truy cập + khi cần truy cập phải lấy được file ngay (immediate access) → Standard-IA (độ bền cao và đắt hơn) hoặc One Zone-IA (độ bền thấp nhưng rẻ)
- Tiết kiệm chi phí hơn nữa, chấp nhận việc phải chờ mới lấy được file → Glacier Family (Instant Retrieval, Flexible Retrieval, Deep Archive), trong đó:
- Trả phí để được lấy file ngay lập tức: Glacier Instant Retrieval
- Có thể đợi từ vài phút đến vài giờ: Glacier Flexible Retrieval
- Chỉ để lưu trữ lâu dài: Glacier Deep Archive
- Tần suất truy cập không cố định, không biết trước (Unknown access pattern) → Intelligent-Tiering

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Managing the lifecycle of objects

</details>

---

<div id="question-45"></div>

### Question 45: Amazon Transcribe to convert the audio recordings in any language into text and Am...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C), (E), (F)

#### 📋 Đề bài (Scenario)
A company wants to use artificial intelligence (AI) to determine the quality of its customer service calls. The company currently manages calls in four different languages, including English. The company will offer new languages in the future. The company does not have the resources to regularly maintain machine learning (ML) models.

The company needs to create written sentiment analysis reports from the customer service call recordings. The customer service call recording text must be translated into English.

Which combination of steps will meet these requirements? (Choose three.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Comprehend to translate the audio recordings into English.
- **(B)** Use Amazon Lex to create the written sentiment analysis reports.
- **(C)** Use Amazon Comprehend to create the sentiment analysis reports. `[Đáp án đúng ✅]`
- **(D)** Use Amazon Polly to convert the audio recordings into text.
- **(E)** Use Amazon Translate to translate text in any language to English. `[Đáp án đúng ✅]`
- **(F)** Use Amazon Transcribe to convert the audio recordings in any language into text. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E), (F)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty muốn dùng AI phân tích chất lượng cuộc gọi dịch vụ khách hàng
> - Đang quản lý 4 ngôn ngữ khác nhau, sẽ có thêm ngôn ngữ mới trong tương lai
> - Không có nguồn lực để maintain ML models thường xuyên
> - Cần: chuyển đổi audio → text → dịch sang tiếng Anh → phân tích sentiment

**Phân tích giải pháp tối ưu:**
Use Amazon Transcribe to convert the audio recordings in any language into text.
Amazon Transcribe là dịch vụ speech-to-text, cho phép chuyển đổi âm thanh sang text tự động, hỗ trợ nhiều ngôn ngữ

Managed service, không cần maintain ML model → phù hợp với yêu cầu

Đáp ứng yêu cầu bước đầu tiên: chuyển đổi audio → text

Use Amazon Translate to translate text in any language to English.
Amazon Translate là service cho phép phiên dịch text giữa các ngôn ngữ, có support việc dịch từ nhiều ngôn ngữ sang tiếng Anh

Đáp ứng yêu cầu bước thứ hai: dịch text → tiếng Anh

Use Amazon Comprehend to create the sentiment analysis reports.
Amazon Comprehend là dịch vụ Natural Language Processing (NLP) giúp xử lý ngôn ngữ tự nhiên, nhận diện bối cảnh, đánh giá thái độ khách hàng (phân tích sentiment)

Managed service hoàn toàn, không cần maintain model

Đáp ứng yêu cầu bước cuối: phân tích sentiment từ text tiếng Anh

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use Amazon Comprehend to translate the audio recordings into English.**:
  Amazon Comprehend không phải dịch vụ để dịch ngôn ngữ
  Dịch vụ dịch thuật đúng là phải là Amazon Translate

- **(B) Use Amazon Lex to create the written sentiment analysis reports.**:
  Amazon Lex là dịch vụ xây dựng chatbot/conversational AI, không phải công cụ phân tích sentiment
  Không phù hợp cho use case này

- **(D) Use Amazon Polly to convert the audio recordings into text.**:
  Amazon Polly là dịch vụ text-to-speech (TTS) - chuyển text → audio
  Ngược lại với yêu cầu audio → text

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Audio/speech → text" → Amazon Transcribe
- "Text-to-speech/TTS" → Amazon Polly
- "Translate text" → Amazon Translate
- "Sentiment analysis / NLP" → Amazon Comprehend
- "Chatbot / conversational AI" → Amazon Lex
- "No resources to maintain ML models" → Chọn AWS Managed AI Services

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Transcribe - Speech to Text
- AWS Translate - Language Translation
- AWS Comprehend - NLP Service

</details>

---

<div id="question-46"></div>

### Question 46: The General Purpose SSD (gp3) EBS volume storage type and provision 15,000 IOPS
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An ecommerce company runs a PostgreSQL database on premises. The database stores data by using high IOPS Amazon Elastic Block Store (Amazon EBS) block storage. The daily peak I/O transactions per second do not exceed 15,000 IOPS. The company wants to migrate the database to Amazon RDS for PostgreSQL and provision disk IOPS performance independent of disk storage capacity.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the General Purpose SSD (gp2) EBS volume storage type and provision 15,000 IOPS.
- **(B)** Configure the EBS magnetic volume type to achieve maximum IOPS.
- **(C)** Configure the Provisioned IOPS SSD (io1) EBS volume storage type and provision 15,000 IOPS.
- **(D)** Configure the General Purpose SSD (gp3) EBS volume storage type and provision 15,000 IOPS. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty đang chạy PostgreSQL on-premises với high IOPS storage
> - Nhu cầu: cần băng thông 15,000 IOPS để đáp ứng traffic tăng cao (daily peak)
> - Yêu cầu: migrate sang RDS for PostgreSQL với khả năng setup IOPS độc lập không ràng buộc theo dung lượng ổ đĩa
> - Mục tiêu: giải pháp tiết kiệm chi phí nhất (MOST cost-effective)

**Phân tích giải pháp tối ưu:**
Configure the General Purpose SSD (gp3) EBS volume storage type and provision 15,000 IOPS.

gp3 là thế hệ mới cho phép set IOPS và băng thông độc lập với dung lượng (khác với gp2 phải tính theo ràng buộc cứ 3 IOPS phải đi với 1 GB storage).

gp3 cung cấp performance cơ bản là 3,000 IOPS và có thể tăng lên 64,000 IOPS với giá rẻ hơn io1/io2 đáng kể, đáp ứng đủ yêu cầu 15,000 IOPS và cost-effective nhất.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the General Purpose SSD (gp2) EBS volume storage type and provision 15,000 IOPS.**:
  → gp2 không cho phép provision IOPS độc lập. gp2 tính IOPS theo công thức 3 IOPS/GB, nghĩa là muốn đạt 15,000 IOPS cần tối thiểu 5,000 GB dung lượng (15000÷3), gây lãng phí và đắt hơn gp3.

- **Configure the Provisioned IOPS SSD (io1) EBS volume storage type and provision 15,000 IOPS.**:
  → Sai vì io1 đắt hơn gp3 nhiều. io1/io2 dùng cho workload cần >16,000 IOPS hoặc yêu cầu độ trễ tối thiểu và độ bền data cao hơn. Với 15,000 IOPS, gp3 đã đủ đáp ứng và rẻ hơn.

- **Configure the EBS magnetic volume type to achieve maximum IOPS.**:
  → Magnetic volumes (standard EBS) là công nghệ cũ, chỉ đạt ~100 IOPS, không thể đạt 15,000 IOPS. Đây là loại storage đã lỗi thời và không được AWS khuyến cáo sử dụng nữa.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "<64,000 IOPS + cost-effective" → gp3

#### 📚 Tài liệu tham khảo chính thức (Official References):
- General Purpose SSD storage for RDS

</details>

---

<div id="question-47"></div>

### Question 47: Amazon FSx for Lustre persistent file systems
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A weather forecasting company needs to process hundreds of gigabytes of data with sub-millisecond latency. The company has a high performance computing (HPC) environment in its data center and wants to expand its forecasting capabilities.

A solutions architect must identify a highly available cloud storage solution that can handle large amounts of sustained throughput. Files that are stored in the solution should be accessible to thousands of compute instances that will simultaneously access and process the entire dataset.

What should the solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon FSx for Lustre scratch file systems.
- **(B)** Use Amazon FSx for Lustre persistent file systems. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon Elastic File System (Amazon EFS) with Bursting Throughput mode.
- **(D)** Use Amazon Elastic File System (Amazon EFS) with Provisioned Throughput mode.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty cần xử lý hàng trăm GB dữ liệu với độ trễ dưới millisecond (sub-millisecond latency)
> - Đang sử dụng môi trường HPC (High Performance Computing) hiện có tại data center
> - Cần giải pháp về storage trên cloud với băng thông cao (sustained throughput)
> - Hàng nghìn compute instances sẽ đồng thời truy cập và xử lý toàn bộ dataset
> - Yêu cầu: có tính khả dụng cao highly available

**Phân tích giải pháp tối ưu:**
Use Amazon FSx for Lustre persistent file systems.

Amazon FSx for Lustre là dịch vụ file system hiệu năng cao được tối ưu hóa cho HPC workloads, machine learning, và xử lý dữ liệu lớn với sub-millisecond latency và throughput hàng trăm GB/s.

Persistent file systems trong FSx for Lustre là loại file system có thể lưu trữ data dài hạn, có khả năng replication data tự động trong cùng AZ, đảm bảo tính khả dụng và độ bền tốt

Hỗ trợ hàng nghìn instances đồng thời truy cập cùng một dataset mà không bị giảm performance.

Tối ưu cho workload cần băng thông cao (sustained throughput) liên tục.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use Amazon FSx for Lustre scratch file systems.**:
  FSx Lustre scratch file systems có performance tốt, nhưng data chỉ lưu tạm thời, không có tính khả dụng và độ bền data cao

- **(C) Use Amazon Elastic File System (Amazon EFS) with Bursting Throughput mode.**:
  EFS Bursting mode chỉ cung cấp băng thông cao trong thời gian ngắn, sau đó lại quay trở về như cũ.
  Latency của EFS cao hơn FSx for Lustre, không đạt sub-millisecond.
  EFS chủ yếu dùng cho use case file system phổ thông, không phù hợp với use case performance cao (HPC)

- **(D) Use Amazon Elastic File System (Amazon EFS) with Provisioned Throughput mode.**:
  Vẫn là EFS, như đáp án trên, có độ trễ cao và không phù hợp với use case HPC

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "HPC" + "sub-millisecond latency" → FSx for Lustre

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon FSx for Lustre

</details>

---

<div id="question-48"></div>

### Question 48: AWS Global Accelerator with health checks
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A gaming company is building an application with Voice over IP capabilities. The application will serve traffic to users across the world. The application needs to be highly available with an automated failover across AWS Regions. The company wants to minimize the latency of users without relying on IP address caching on user devices.

What should a solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon CloudFront distribution that includes multiple origins.
- **(B)** Create an Application Load Balancer that uses path-based routing.
- **(C)** Use AWS Global Accelerator with health checks. `[Đáp án đúng ✅]`
- **(D)** Use Amazon Route 53 with a geolocation routing policy.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty game xây dựng ứng dụng Voice over IP (VoIP) - cho phép trò chuyện, truyền tải âm thanh qua internet
> - Phục vụ người dùng trên toàn thế giới
> - Cần tính khả dụng cao highly available với khả năng tự động failover automated failover giữa các AWS Regions
> - Yêu cầu: giảm thiểu độ trễ (minimize latency) cho users mà không dựa vào IP address caching trên thiết bị người dùng

**Phân tích giải pháp tối ưu:**
Use AWS Global Accelerator with health checks.

AWS Global Accelerator là dịch vụ định tuyến traffic của người dùng qua mạng lưới toàn cầu của AWS đến endpoint gần nhất (EC2, ALB, NLB, Elastic IP) với độ trễ thấp nhất thông qua 2 static Anycast IP addresses (IP tĩnh), và tự động failover khi có sự cố

Không phụ thuộc DNS caching vì sử dụng IP tĩnh luôn trỏ đến endpoint gần nhất

Tối ưu cho real-time applications như VoIP vì giảm độ trễ mạng và cải thiện hiệu suất TCP/UDP

Phù hợp cho traffic toàn cầu nhờ khả năng tận dụng được mạng lưới toàn cầu của AWS

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use Amazon Route 53 with a geolocation routing policy.**:
  Route 53 sử dụng DNS resolution chứ không phải IP tĩnh, do đó bị phụ thuộc vào DNS caching trên thiết bị và nhà cung cấp mạng
  Khi failover xảy ra, phải đợi cache DNS hết hạn thì mới có thể chuyển sang endpoint mới
  Không đáp ứng yêu cầu đề bài

- **Create an Amazon CloudFront distribution that includes multiple origins.**:
  CloudFront chủ yếu sử dụng cho traffic (HTTP/HTTPS), không tối ưu cho VoIP (UDP/TCP real-time)
  CloudFront cũng dựa vào DNS resolution và caching, không tránh được IP caching

- **Create an Application Load Balancer that uses path-based routing.**:
  ALB hoạt động ở Layer 7 (HTTP/HTTPS), không tối ưu cho VoIP traffic
  Path-based routing chỉ là cơ chế điều hướng traffic đến các target khác nhau của ALB, không liên quan đến việc giảm latency toàn cầu

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "VoIP / real-time / UDP traffic" → AWS Global Accelerator

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Working with custom routing accelerators in AWS Global Accelerator

</details>

---

<div id="question-49"></div>

### Question 49: Amazon Machine Images (AMIs) to back up the EC2 instances
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs an application on Amazon EC2 instances. The company needs to implement a disaster recovery (DR) solution for the application. The DR solution needs to have a recovery time objective (RTO) of less than 4 hours. The DR solution also needs to use the fewest possible AWS resources during normal operations.

Which solution will meet these requirements in the MOST operationally efficient way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Launch EC2 instances in a secondary Availability Zone. Keep the EC2 instances in the secondary Availability Zone active at all times.
- **(B)** Create Amazon Machine Images (AMIs) to back up the EC2 instances. Copy the AMIs to a secondary AWS Region. Automate infrastructure deployment in the secondary Region by using AWS CloudFormation.
- **(C)** Create Amazon Machine Images (AMIs) to back up the EC2 instances. Copy the AMIs to a secondary AWS Region. Automate infrastructure deployment in the secondary Region by using AWS Lambda and custom scripts. `[Đáp án đúng ✅]`
- **(D)** Launch EC2 instances in a secondary AWS Region. Keep the EC2 instances in the secondary Region active at all times.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên EC2 instances
> - Cần giải pháp khôi phục sau thảm họa disaster recovery (DR)
> - Yêu cầu thời gian khôi phục RTO < 4 giờ
> - Yêu cầu sử dụng ít tài nguyên AWS nhất trong điều kiện hoạt động bình thường
> - Cần giải pháp operationally efficient (hiệu quả vận hành) nhất

**Phân tích giải pháp tối ưu:**
Create Amazon Machine Images (AMIs) to back up the EC2 instances. Copy the AMIs to a secondary AWS Region. Automate infrastructure deployment in the secondary Region by using AWS CloudFormation.

CloudFormation là dịch vụ Infrastructure as Code (IaC), giúp tự động hóa việc triển khai infrastructure một cách tự động và nhanh chóng, không cần làm thủ công

Tạo AMI backup và copy sang region phụ sẽ đảm bảo việc EC2 có thể phục hồi ở region đó

Không tốn chi nhiều phí khi chưa xảy ra sự cố (chỉ tốn phí lưu trữ AMI ở region phụ)

RTO < 4 giờ hoàn toàn khả thi vì dùng CloudFormation triển khai phục hồi EC2 tự động chỉ mất vài phút

Solution đáp ứng yêu cầu vận hành tốt (operationally efficient) bằng việc sử dụng các service tự động hóa như CloudFormation

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create Amazon Machine Images (AMIs) to back up the EC2 instances. Copy the AMIs to a secondary AWS Region. Automate infrastructure deployment in the secondary Region by using AWS Lambda and custom scripts.**:
  Về mặt kỹ thuật thì khả thi, nhưng kém hiệu quả vận hành hơn CloudFormation do phải tự viết và maintain custom scripts, tốn effort và dễ lỗi
  Không có tính tự động hóa như CloudFormation

- **(D) Launch EC2 instances in a secondary AWS Region. Keep the EC2 instances in the secondary Region active at all times.**:
  Phải trả phí cho EC2 instances chạy song song 24/7 ở secondary region ngay cả khi không cần thiết, không đáp ứng yêu cầu "fewest possible AWS resources during normal operations"
  Chi phí vận hành cao gấp đôi (chạy 2 môi trường song song)

- **(A) Launch EC2 instances in a secondary Availability Zone. Keep the EC2 instances in the secondary Availability Zone active at all times.**:
  Solution này không phải là DR, vì bản chất DR là phải multi-region
  Solution chỉ multi-zone trong cùng một region nên không đáp ứng yêu cầu
  Tương tự đáp án trên, cũng tốn chi phí chạy instances 24/7 không cần thiết

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Khi nhắc đến DR thì cần nghĩ đến kiến trúc Multi-Region
- Đối với EC2 thì có thể tạo AMI và copy sang region phụ, để khi xảy ra sự cố có thể dùng AMI đó để khôi phục
- Đối với RDS thì nghĩ đến việc tạo Read replica sang region phụ, khi xảy ra sự cố thì promote thành instance chính để sử dụng tiếp
- Đối với DynamoDB / Aurora thì nghĩ đến việc sử dụng DynamoDB Global / Aurora Global

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Disaster recovery options in the cloud

</details>

---

<div id="question-50"></div>

### Question 50: An AWS Key Management Service (AWS KMS) external key store backed by an external k...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is required to use cryptographic keys in its on-premises key manager. The key manager is outside of the AWS Cloud because of regulatory and compliance requirements. The company wants to manage encryption and decryption by using cryptographic keys that are retained outside of the AWS Cloud and that support a variety of external key managers from different vendors.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an AWS Key Management Service (AWS KMS) external key store backed by an external key manager. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use AWS CloudHSM key store backed by a CloudHSM cluster.
- **(C)** Use the default AWS Key Management Service (AWS KMS) managed key store.
- **(D)** Use a custom key store backed by an AWS CloudHSM cluster.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty bắt buộc phải sử dụng cryptographic keys lưu trữ ở on-premises (ngoài AWS Cloud) để đảm bảo yêu cầu pháp lý và tuân thủ (regulatory and compliance)
> - Cần quản lý encryption/decryption với keys ở bên ngoài AWS
> - Cần hỗ trợ nhiều external key managers từ nhiều vendors khác nhau
> - Yêu cầu: LEAST operational overhead (ít vận hành phức tạp nhất)

**Phân tích giải pháp tối ưu:**
Use an AWS Key Management Service (AWS KMS) external key store backed by an external key manager.

External Key Store cho phép AWS KMS sử dụng keys được lưu trữ hoàn toàn bên ngoài AWS, cụ thể trong câu hỏi này là key lưu trữ ở on-premise

Hỗ trợ nhiều vendors khác nhau của external key managers (đáp ứng yêu cầu "variety of vendors")

Keys không bao giờ rời khỏi on-premises environment → đáp ứng yêu cầu về tuân thủ

LEAST operational overhead vì AWS KMS đã tích hợp sẵn với external key stores, không cần tự quản lý infrastructure như CloudHSM

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use AWS CloudHSM key store backed by a CloudHSM cluster.**:
  AWS CloudHSM = Hardware Security Module (HSM) là service chạy trong VPC, cho phép tự tạo và quản lý keys trên hạ tầng phần cứng dành riêng
  Keys được lưu trong CloudHSM cluster bên trong AWS, không đáp ứng yêu cầu "keys retained outside of AWS Cloud"

- **(C) Use the default AWS Key Management Service (AWS KMS) managed key store.**:
  Default KMS key store lưu keys bên trong KMS, tức là vẫn nằm trong hạ tầng AWS
  Không đáp ứng yêu cầu keys phải ở ngoài AWS Cloud
  Không hỗ trợ external key managers

- **(D) Use a custom key store backed by an AWS CloudHSM cluster.**:
  Sai tương tự như đáp án sử dụng CloudHSM ở trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Keys outside AWS" + "on-premises key manager" → KMS External Key Store

#### 📚 Tài liệu tham khảo chính thức (Official References):
- KMS External key stores

</details>

---

<div id="question-51"></div>

### Question 51: AWS DataSync
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company recently created a disaster recovery site in a different AWS Region. The company needs to transfer large amounts of data back and forth between NFS file systems in the two Regions on a periodic basis.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS DataSync. `[Đáp án đúng ✅]`
- **(B)** Use AWS Snowball devices.
- **(C)** Set up an SFTP server on Amazon EC2.
- **(D)** Use AWS Database Migration Service (AWS DMS).

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần transfer large amounts of data giữa NFS file systems ở 2 Regions cho mục đích DR (Disaster Recovery) định kỳ
> - Tìm giải pháp LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Use AWS DataSync.

DataSync là service cho phép transfer data qua đường truyền online, support transfer dữ liệu lớn giữa các NFS/SMB file systems

Hỗ trợ đặt lịch để transfer data định kỳ

Quản lý đơn giản, mọi thứ có thể thao tác dễ dàng qua console, giảm operational overhead

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use AWS Snowball devices.**:
  Snowball là thiết bị vật lý dùng cho việc migrate data từ local lên AWS thông qua việc shipping thiết bị
  Không dùng cho mục đích transfer data giữa các region

- **(C) Set up an SFTP server on Amazon EC2.**:
  Không cần thiết phải setup SFTP server ở đây, hơn nữa sử dụng EC2 sẽ tốn effort vận hành

- **(D) Use AWS Database Migration Service (AWS DMS).**:
  DMS dùng cho database migration, không dùng cho việc transfer data giữa các file systems

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "NFS/SMB file systems" + "transfer between regions" → AWS DataSync
- "Least operational overhead" + "file transfer" → DataSync (fully managed), tránh đáp án sử dụng EC2

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Transferring file data across AWS Regions and accounts using AWS DataSync

</details>

---

<div id="question-52"></div>

### Question 52: The logs in Amazon S3
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company runs several websites on AWS for its different brands. Each website generates tens of gigabytes of web traffic logs each day. A solutions architect needs to design a scalable solution to give the company's developers the ability to analyze traffic patterns across all the company's websites. This analysis by the developers will occur on demand once a week over the course of several months. The solution must support queries with standard SQL.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the logs in Amazon OpenSearch Service. Use OpenSearch Service for analysis.
- **(B)** Store the logs in Amazon RDS. Use a database client for analysis.
- **(C)** Store the logs in an Amazon EMR cluster Use a supported open-source framework for SQL-based analysis.
- **(D)** Store the logs in Amazon S3. Use Amazon Athena for analysis. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty có nhiều website, mỗi site tạo ra hàng chục GB web traffic logs mỗi ngày
> - Developers cần phân tích log này thông qua việc sử dụng SQL queries
> - Việc phân tích thực hiện với tần suất khoảng 1 lần/tuần
> - Cần giải pháp mở rộng tốt (scalable ) và cost-effective nhất

**Phân tích giải pháp tối ưu:**
Store the logs in Amazon S3. Use Amazon Athena for analysis.

S3 là lựa chọn tối ưu nhất về chi phí để lưu trữ log data lớn (pay-per-GB, rất rẻ), có khả năng mở rộng tốt, đáp ứng lượng data lên đến vô hạn

Athena là service serverless cho phép chạy các câu lệnh SQL Query trực tiếp trên S3, chỉ tính phí dựa theo query thực tế (pay-per-query), phù hợp với tần suất thấp query không thường xuyên (1 lần/tuần)

Solution toàn bộ đều là các managed service, không cần quản lý kiến trúc nên sẽ tối ưu hóa effort vận hành

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Store the logs in Amazon RDS. Use a database client for analysis.**:
  RDS instance chạy 24/7, tốn chi phí liên tục ngay cả khi không dùng, không phù hợp với tần suất query 1 lần/tuần
  Không scale tốt với hàng chục GB logs mỗi ngày (RDS có giới hạn storage và không tối ưu cho log analytics)
  Chi phí cao hơn nhiều so với S3 + Athena cho use case này

- **(A) Store the logs in Amazon OpenSearch Service. Use OpenSearch Service for analysis.**:
  OpenSearch cũng yêu cầu cluster chạy 24/7, tốn chi phí liên tục
  OpenSearch tối ưu cho real-time search/analytics, không phù hợp với tần suất query 1 lần/tuần
  Chi phí cao hơn nhiều so với S3 + Athena cho use case này

- **Store the logs in an Amazon EMR cluster. Use a supported open-source framework for SQL-based analysis.**:
  EMR cluster chạy trên EC2, tốn effort vận hành, chi phí cao
  Quá phức tạp cho yêu cầu đơn giản là query data trên S3

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Query không thường xuyên → S3 + Athena

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Query Data in S3 Using SQL - Amazon Athena

</details>

---

<div id="question-53"></div>

### Question 53: Attach a Network Load Balancer to the Auto Scaling group
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to run a gaming application on Amazon EC2 instances that are part of an Auto Scaling group in the AWS Cloud. The application will transmit data by using UDP packets. The company wants to ensure that the application can scale out and in as traffic increases and decreases.

What should a solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an Amazon Route 53 record set with a weighted policy to route traffic appropriately.
- **(B)** Attach an Application Load Balancer to the Auto Scaling group.
- **(C)** Deploy a NAT instance that is configured with port forwarding to the EC2 instances in the Auto Scaling group.
- **(D)** Attach a Network Load Balancer to the Auto Scaling group. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng gaming chạy trên EC2 trong Auto Scaling group
> - Truyền dữ liệu bằng giao thức UDP
> - Cần scale out/in tự động theo traffic
> - Yêu cầu: giải pháp để phân phối traffic đến các instance

**Phân tích giải pháp tối ưu:**
Attach a Network Load Balancer to the Auto Scaling group.

Network Load Balancer (NLB) là service cân bằng tải và phân phối traffic hoạt động ở Layer 4 (Transport Layer), hỗ trợ cả TCP và UDP protocols.

NLB tích hợp tốt với Auto Scaling group, tự động register/deregister instances khi scale, đảm bảo traffic được phân phối đến các instance healthy.

NLB có khả năng xử lý traffic lớn, phù hợp với các use case như gaming

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Attach an Application Load Balancer to the Auto Scaling group.**:
  → Application Load Balancer (ALB) chỉ hoạt động ở Layer 7 (Application Layer) và chỉ hỗ trợ HTTP/HTTPS. Không hỗ trợ UDP

- **Deploy an Amazon Route 53 record set with a weighted policy to route traffic appropriately.**:
  → Route 53 chỉ là service DNS routing, không có khả năng phân phối traffic tự động đến các instance trong Auto Scaling group

- **Deploy a NAT instance that is configured with port forwarding to the EC2 instances in the Auto Scaling group.**:
  → NAT instance được dùng để cho phép private instances truy cập internet, không phải để cân bằng tải

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "UDP" hoặc "TCP" → Network Load Balancer (NLB)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Target groups for your Network Load Balancers

</details>

---

<div id="question-54"></div>

### Question 54: Cost and Usage Reports in the management account
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company wants to monitor its AWS costs for financial review. The cloud operations team is designing an architecture in the AWS Organizations management account to query AWS Cost and Usage Reports for all member accounts. The team must run this query once a month and provide a detailed analysis of the bill.

Which solution is the MOST scalable and cost-effective way to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Cost and Usage Reports in the management account. Deliver reports to Amazon Kinesis. Use Amazon EMR for analysis.
- **(B)** Enable Cost and Usage Reports in the management account. Deliver the reports to Amazon S3. Use Amazon Athena for analysis. `[Đáp án đúng ✅]`
- **(C)** Enable Cost and Usage Reports for member accounts. Deliver the reports to Amazon S3. Use Amazon Redshift for analysis.
- **(D)** Enable Cost and Usage Reports for member accounts. Deliver the reports to Amazon Kinesis. Use Amazon QuickSight tor analysis.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty muốn giám sát chi phí AWS để phân tích tài chính
> - Cần query AWS Cost and Usage Reports cho tất cả các member accounts
> - Chạy query 1 lần/tháng
> - Yêu cầu: scalable và cost-effective

**Phân tích giải pháp tối ưu:**
Enable Cost and Usage Reports in the management account. Deliver the reports to Amazon S3. Use Amazon Athena for analysis.

Trong kiến trúc Organizations, management account có thể tổng hợp chi phí của tất cả member accounts thông qua AWS Cost and Usage Reports mà không cần check theo từng account riêng lẻ

Report được tạo ra sẽ lưu vào S3, đây là lựa chọn lưu trữ giá rẻ và có khả năng mở rộng tốt

Amazon Athena là serverless query service, chỉ trả phí khi chạy query → phù hợp với việc query tần suất thấp 1 lần/tháng

Kết hợp S3 và Athena tạo ra solution query data serverless hoàn toàn, không tốn chi phí infrastructure, tiết kiệm và giảm effort vận hành

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable Cost and Usage Reports in the management account. Deliver reports to Amazon Kinesis. Use Amazon EMR for analysis.**:
  Kinesis và EMR là hai service có chi phí sử dụng rất cao, quá thừa thãi trong use case chỉ cần query file report đơn giản

- **Enable Cost and Usage Reports for member accounts. Deliver the reports to Amazon S3. Use Amazon Redshift for analysis.**:
  Trong kiến trúc Organizations, các thao tác liên quan đến chi phí cần thực hiện từ management account, không thực hiện từ member account
  Redshift đắt hơn Athena cho use case query tần suất thấp

- **Enable Cost and Usage Reports for member accounts. Deliver the reports to Amazon Kinesis. Use Amazon QuickSight for analysis.**:
  Trong kiến trúc Organizations, các thao tác liên quan đến chi phí cần thực hiện từ management account, không thực hiện từ member account
  Quicksight dùng để hiển thị hóa data, không dùng cho use case query data

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Trong kiến trúc Organizations, các thao tác liên quan đến chi phí cần thực hiện từ management account, không thực hiện từ member account
- Tần suất query thấp, tiết kiệm chi phí → S3 + Athena

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Query Data in S3 Using SQL - Amazon Athena

</details>

---

<div id="question-55"></div>

### Question 55: Grant the decrypt permission for the Lambda IAM role in the KMS key's policy and a...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (D)

#### 📋 Đề bài (Scenario)
A company has an application workflow that uses an AWS Lambda function to download and decrypt files from Amazon S3. These files are encrypted using AWS Key Management Service (AWS KMS) keys. A solutions architect needs to design a solution that will ensure the required permissions are set correctly.

Which combination of actions accomplish this? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new IAM policy with the kms:decrypt permission and attach the policy to the Lambda function.
- **(B)** Create a new IAM role with the kms:decrypt permission and attach the execution role to the Lambda function. `[Đáp án đúng ✅]`
- **(C)** Grant the decrypt permission for the Lambda resource policy in the KMS key's policy.
- **(D)** Grant the decrypt permission for the Lambda IAM role in the KMS key's policy `[Đáp án đúng ✅]`
- **(E)** Attach the kms:decrypt permission to the Lambda function’s resource policy

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Lambda function cần tải về và giải mã (decrypt) files từ S3
> - Files được mã hóa bằng AWS KMS keys
> - Cần thiết lập permissions cho Lambda có quyền giải mã

**Phân tích giải pháp tối ưu:**
Để cấp quyền giải mã file cho Lambda, có thể sử dụng một trong 2 cách tương ứng với 2 đáp án bên dưới. Cách nào cũng được, đều đáp ứng best practice của AWS, chỉ cần 1 trong 2 là đủ đáp ứng yêu cầu.

Grant the decrypt permission for the Lambda IAM role in the KMS key's policy

Đây là cách thiết lập permission từ phía KMS

KMS sử dụng resource-based policy (key policy) để định nghĩa đối tượng nào có quyền sử dụng key này

Create a new IAM role with the kms:decrypt permission and attach the execution role to the Lambda function.

Đây là cách thiết lập permission từ phía Lambda

Lambda cần có IAM policy gắn vào execution role của nó với quyền kms:decrypt để có thể giải mã file

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Attach the kms:decrypt permission to the Lambda function's resource policy**:
  Lambda's resource policy chỉ dùng để kiểm soát ai có thể invoke Lambda, không liên quan đến việc Lambda có thể dùng KMS để giải mã hay không
  Trong trường hượp này phải cấp quyền cho Lambda thông qua IAM role và policy mới đúng

- **Grant the decrypt permission for the Lambda resource policy in the KMS key's policy**:
  KMS key policy cần chỉ định đối tượng IAM để cấp quyền (trong trường hợp này là IAM role của Lambda, chứ không phải cho "Lambda resource policy")

- **Create a new IAM policy with the kms:decrypt permission and attach the policy to the Lambda function.**:
  IAM Policy không thể gắn trực tiếp vào Lambda, vô lý
  Bắt buộc IAM Policy phải gắn vào Role, rồi từ Role gắn vào Lambda

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Để cấp quyền giải mã KMS, có thể thực hiện bằng một trong 2 cách:
- Cấp quyền thông qua KMS Key Policy
- Cấp quyền thông qua IAM

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Key policies in AWS KMS
- Defining Lambda function permissions with an execution role

</details>

---

<div id="question-56"></div>

### Question 56: Versioning on the bucket and MFA Delete on the bucket
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (D) | **Đáp án đúng**: (B), (D)

#### 📋 Đề bài (Scenario)
A solutions architect is implementing a document review application using an Amazon S3 bucket for storage. The solution must prevent accidental deletion of the documents and ensure that all versions of the documents are available. Users must be able to download, modify, and upload documents.

Which combination of actions should be taken to meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Attach an IAM policy to the bucket.
- **(B)** Enable MFA Delete on the bucket. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Enable a read-only bucket ACL.
- **(D)** Enable versioning on the bucket. `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Encrypt the bucket using AWS KMS.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application sử dụng S3 bucket để lưu trữ tài liệu
> - Yêu cầu: ngăn chặn xóa nhầm (prevent accidental deletion)
> - Yêu cầu: giữ tất cả các phiên bản tài liệu (all versions available)
> - User cần có khả năng download, modify, và upload tài liệu

**Phân tích giải pháp tối ưu:**
Enable versioning on the bucket.

Versioning cho phép S3 lưu lại tất cả các phiên bản của object, kể cả khi bị ghi đè hoặc xóa

Khi xóa object với versioning bật, S3 chỉ thêm delete marker chứ không xóa hẳn → có thể khôi phục nếu cần thiết

Đáp ứng yêu cầu "ensure all versions are available"

Enable MFA Delete on the bucket.

MFA Delete yêu cầu xác thực 2 lớp (MFA) trước khi xóa vĩnh viễn object hoặc tắt versioning

Ngăn chặn việc xóa nhầm (accidental deletion) hiệu quả

Chỉ hoạt động khi versioning đã được bật

Thường sử dụng kết hợp với versioning

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable a read-only bucket ACL.**:
  Read-only ACL sẽ chặn luôn việc modify và upload → vi phạm yêu cầu "users must be able to modify and upload"

- **Attach an IAM policy to the bucket.**:
  S3 không có cơ chế gắn IAM Policy, vô lý
  Chỉ có cho phép gắn S3 Bucket Policy, kể cả thế thì cũng chỉ giúp giới hạn quyền truy cập đến S3, không có khả năng quản lý nhiều version của object

- **Encrypt the bucket using AWS KMS.**:
  Encryption chỉ làm tăng tính security cho việc lưu trữ data, không liên quan đến việc ngăn chặn xóa nhầm file hay quản lý nhiều version của object

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Prevent accidental deletion" → MFA Delete
- "All versions available" → Versioning
- "Protect from deletion + version history" → Versioning + MFA Delete

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Configuring MFA delete
- Enabling versioning on buckets

</details>

---

<div id="question-57"></div>

### Question 57: Deleting Amazon EC2 instances
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A solutions architect has created two IAM policies: Policy1 and Policy2. Both policies are attached to an IAM group.

Policy 1:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:Get*",
        "iam:List*",
        "kms:List*",
        "ec2:*",
        "ds:*",
        "logs:Get*",
        "logs:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
Policy 2:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "ds:Delete*",
      "Resource": "*"
    }
  ]
}
A cloud engineer is added as an IAM user to the IAM group. Which action will the cloud engineer be able to perform?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deleting logs from Amazon CloudWatch Logs
- **(B)** Deleting directories
- **(C)** Deleting IAM users
- **(D)** Deleting Amazon EC2 instances `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Có 2 IAM policies gắn vào 1 IAM group như trên
> - Cloud engineer được thêm vào group này
> - Engineer có thể làm hành động nào?

**Phân tích giải pháp tối ưu:**
Deleting Amazon EC2 instances

Policy 1 Allow action "ec2:*", như vậy đối tượng sẽ có tất cả quyền EC2 bao gồm cả xóa EC2 instances

Policy2 chỉ Deny ds:Delete*, tức là ngăn chặn các action liên quan đến xóa Active Directory, không liên quan gì đến EC2 cả

Như vậy kết hợp 2 policy này lại ta vẫn có quyền delete EC2, đúng như nội dung đáp án đang nhắc đến

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deleting IAM users**:
  Policy1 chỉ cho phép iam:Get* và iam:List*, tức là chỉ có quyền đọc thông tin liên quan đến IAM, không có quyền nào là iam:Delete* cả, do đó không có khả năng xóa IAM users

- **Deleting directories**:
  Policy1 cho phép ds:* (tất cả quyền Directory Service)
  NHƯNG Policy2 Deny ds:Delete* → chặn mọi hành động xóa DS
  Deny được ưu tiên hơn so với Allow → không thể xóa directories

- **Deleting logs from Amazon CloudWatch Logs**:
  Policy1 chỉ cho phép logs:Get* và logs:Describe* → chỉ đọc logs
  Không có quyền logs:Delete* do đó không thể xóa CloudWatch Logs

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Trong IAM Policy, các lệnh Deny luôn được ưu tiên hơn so với Allow

#### 📚 Tài liệu tham khảo chính thức (Official References):
- IAM Policy Evaluation Logic

</details>

---

<div id="question-58"></div>

### Question 58: Amazon DynamoDB and AWS Lambda
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (D) | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A solutions architect is designing a new service behind Amazon API Gateway. The request patterns for the service will be unpredictable and can change suddenly from 0 requests to over 500 per second. The total size of the data that needs to be persisted in a backend database is currently less than 1 GB with unpredictable future growth. Data can be queried using simple key-value requests.

Which combination of AWS services would meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS ECS Fargate
- **(B)** Amazon EC2 Auto Scaling
- **(C)** AWS Lambda `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Amazon DynamoDB `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** MySQL-compatible Amazon Aurora

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Thiết kế service đằng sau API Gateway
> - Traffic không thể đoán trước (unpredictable), có thể thay đổi đột ngột từ 0 → 500+ requests/giây
> - Data hiện tại < 1GB, tương lai có thể tăng không dự đoán được
> - Data đơn giản dạng key-value

**Phân tích giải pháp tối ưu:**
AWS Lambda:

Serverless hoàn toàn, có khả năng tự động scale từ 0 lên hàng nghìn requests/giây, đáp ứng yêu cầu unpredictable traffic (đột ngột 0 → 500+ req/s)

Có khả năng liên kết native với API Gateway

Amazon DynamoDB:

NoSQL serverless service, tự động scale throughput để đáp ứng traffic

Phù hợp với data dạng key-value đơn giản

Có khả năng scale storage không giới hạn, đáp ứng yêu cầu data trong tương lai có thể tăng không dự đoán được

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **AWS ECS Fargate**:
  Fargate phức tạp hơn so với Lambda trong use case đơn giản này, chi phí cũng cao hơn
  Fargate thường dùng kết hợp với ALB, không phải API Gateway

- **Amazon EC2 Auto Scaling**:
  Sử dụng EC2 tốn chi phí và effort vận hành hơn so với Lambda
  Khả năng scale cũng chậm, cần thời gian để launch instance mới, không nhanh bằng Lambda

- **(E) MySQL-compatible Amazon Aurora**:
  Aurora là database dạng quan hệ, với data dạng key-value đơn giản thì không phù hợp
  Chi phí chạy 24/7 liên tục tốn hơn so với DynamoDB

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Key-value queries" + "small data (<10GB)" → DynamoDB (NoSQL serverless)
- "Unpredictable traffic" → Lambda (scale tức thì, serverless)
- "Behind API Gateway" → Ưu tiên Lambda (native integration)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Tutorial: Create a CRUD HTTP API with Lambda and DynamoDB

</details>

---

<div id="question-59"></div>

### Question 59: An Amazon FSx for Windows File Server file system
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is implementing a shared storage solution for a media application that is hosted in the AWS Cloud. The company needs the ability to use SMB clients to access data. The solution must be fully managed.

Which AWS solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Storage Gateway volume gateway. Create a file share that uses the required client protocol. Connect the application server to the file share.
- **(B)** Create an AWS Storage Gateway tape gateway. Configure tapes to use Amazon S3. Connect the application server to the tape gateway.
- **(C)** Create an Amazon FSx for Windows File Server file system. Attach the file system to the origin server. Connect the application server to the file system. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Amazon EC2 Windows instance. Install and configure a Windows file share role on the instance. Connect the application server to the file share.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng media cần solution cho shared storage trên AWS
> - Yêu cầu: hỗ trợ SMB protocol (SMB clients)
> - Solution phải fully managed (quản lý hoàn toàn bởi AWS)

**Phân tích giải pháp tối ưu:**
Create an Amazon FSx for Windows File Server file system. Attach the file system to the origin server. Connect the application server to the file system.

→ FSx for Windows File Server là fully managed service, hỗ trợ native SMB protocol, phù hợp hoàn hảo cho workload cần shared storage với SMB clients trên môi trường cloud. Đây là giải pháp được AWS tối ưu hóa cho các application sử dụng OS Windows.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS Storage Gateway volume gateway. Create a file share that uses the required client protocol. Connect the application server to the file share.**:
  → Volume Gateway hay Storage Gateway nói chung là solution storage hybrid sử dụng cho môi trường on-premise, có khả năng đồng bộ data lên cloud. Tuy nhiên đề bài cần một solution chạy trên cloud AWS, do đó không phù hợp

- **Create an AWS Storage Gateway tape gateway. Configure tapes to use Amazon S3. Connect the application server to the tape gateway.**:
  → Vẫn là Storage Gateway, sai như đáp án trên

- **Create an Amazon EC2 Windows instance. Install and configure a Windows file share role on the instance. Connect the application server to the file share.**:
  → Giải pháp này mặc dù hợp lệ nhưng không fully managed - phải tự quản lý EC2 instance, và tự cài đặt File share server, không đáp ứng yêu cầu về solution quản lý hoàn toàn bởi AWS

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SMB protocol" + "fully managed" → Amazon FSx for Windows File Server

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon FSx for Windows File Server

</details>

---

<div id="question-60"></div>

### Question 60: Multi-factor authentication to the root user and Ensure the root user uses a stron...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (A), (B)

#### 📋 Đề bài (Scenario)
A solutions architect has created a new AWS account and must secure AWS account root user access.

Which combination of actions will accomplish this? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Ensure the root user uses a strong password. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable multi-factor authentication to the root user. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Store root user access keys in an encrypted Amazon S3 bucket.
- **(D)** Add the root user to a group containing administrative permissions.
- **(E)** Apply the required permissions to the root user with an inline policy document.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Solution Architect cần tạo tài khoản AWS mới
> - Cần bảo mật cho root user

**Phân tích giải pháp tối ưu:**
Ensure the root user uses a strong password.

Root user cần mật khẩu mạnh sẽ khó đoán, từ đó giúp tăng tính security

Đây là biện pháp bảo mật cơ bản cho mọi tài khoản được AWS khuyến cáo thiết lập

Enable multi-factor authentication to the root user.

MFA là lớp bảo mật thứ 2 ngoài việc nhập password thông thường

AWS khuyến cáo bật MFA cho root user để tăng tính bảo mật

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Store root user access keys in an encrypted Amazon S3 bucket.**:
  Sai. AWS không khuyến nghị tạo access keys cho root user
  Best practice: không bao giờ sử dụng root user access keys

- **Add the root user to a group containing administrative permissions.**:
  Sai. Root user không thể được thêm vào IAM group
  Root user đã có full permissions mặc định, không cần thêm vào group
  IAM groups chỉ áp dụng cho IAM users, không phải root user

- **Apply the required permissions to the root user with an inline policy document.**:
  Sai. Root user không thể gán IAM policies
  Root user mặc định đã có full permissions
  Không thể giới hạn hoặc mở rộng quyền của root user bằng policies được

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Root user security" → Strong password + MFA

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Root user best practices for your AWS account

</details>

---

<div id="question-61"></div>

### Question 61: Extend the application to add an attribute that has a value of the current timesta...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs an application on a large fleet of Amazon EC2 instances. The application reads and writes entries into an Amazon DynamoDB table. The size of the DynamoDB table continuously grows, but the application needs only data from the last 30 days. The company needs a solution that minimizes cost and development effort.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Extend the application to add an attribute that has a value of the current timestamp plus 30 days to each new item that is created in the table. Configure DynamoDB to use the attribute as the TTL attribute. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure Amazon DynamoDB Streams to invoke an AWS Lambda function when a new item is created in the table. Configure the Lambda function to delete items in the table that are older than 30 days.
- **(C)** Use an EC2 instance that runs a monitoring application from AWS Marketplace. Configure the monitoring application to use Amazon DynamoDB Streams to store the timestamp when a new item is created in the table. Use a script that runs on the EC2 instance to delete items that have a timestamp that is older than 30 days.
- **(D)** Use an AWS CloudFormation template to deploy the complete solution. Redeploy the CloudFormation stack every 30 days, and delete the original stack.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên nhiều EC2 instances, đọc/ghi dữ liệu vào DynamoDB
> - Bảng DynamoDB liên tục tăng kích thước
> - Ứng dụng chỉ cần dữ liệu từ 30 ngày gần nhất
> - Yêu cầu: giải pháp tối ưu chi phí và ít effort phát triển nhất

**Phân tích giải pháp tối ưu:**
Extend the application to add an attribute that has a value of the current timestamp plus 30 days to each new item that is created in the table. Configure DynamoDB to use the attribute as the TTL attribute.

DynamoDB TTL (Time To Live) là chức năng của DynamoDB cho phép tự động xóa các item đã hết hạn, không tốn chi phí và không cần code gì cả

Chỉ cần thêm 1 attribute chứa timestamp (hiện tại + 30 ngày) vào mỗi item mới

Bật TTL trên attribute đó → DynamoDB tự động xóa item sau 30 ngày

Đây là chức năng có sẵn của DynamoDB, chỉ cần config một lần duy nhất, do đó tốn ít effort

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use an AWS CloudFormation template to deploy the complete solution. Redeploy the CloudFormation stack every 30 days, and delete the original stack.**:
  Việc package toàn bộ hệ thống bằng CloudFormation sau đó cứ 30 ngày lại xóa đi rồi deploy mới một lần là solution quá phức tạp, dễ gây downtime, và không cần thiết.
  Đây không phải cách tối ưu chi phí hay effort vận hành.

- **(C) Use an EC2 instance that runs a monitoring application from AWS Marketplace. Configure the monitoring application to use Amazon DynamoDB Streams to store the timestamp when a new item is created in the table. Use a script that runs on the EC2 instance to delete items that have a timestamp that is older than 30 days.**:
  Sử dụng thêm một EC2 bên ngoài chỉ để thực hiện chức năng chạy script xóa data cũ làm tăng thêm effort vận hành không cần thiết
  Phức tạp hơn nhiều, trong khi sử dụng TTL vừa đơn giản mà vừa đáp ứng yêu cầu

- **Configure Amazon DynamoDB Streams to invoke an AWS Lambda function when a new item is created in the table. Configure the Lambda function to delete items in the table that are older than 30 days.**:
  Sử dụng thêm Lambda sẽ tốn effort coding
  Mỗi khi Lambda chạy sẽ cần query hoặc scan vào DB, gây tiêu tốn băng thông không cần thiết
  Solution phức tạp hơn so với việc chỉ dùng TTL đơn giản

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Tự động xóa dữ liệu cũ" + "DynamoDB" → DynamoDB TTL

#### 📚 Tài liệu tham khảo chính thức (Official References):
- DynamoDB TTL Documentation

</details>

---

<div id="question-62"></div>

### Question 62: A read replica from the source DB instance
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company manages an application that stores data on an Amazon RDS for PostgreSQL Multi-AZ DB instance. Increases in traffic are causing performance problems. The company determines that database queries are the primary reason for the slow performance.

What should a solutions architect do to improve the application's performance?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the DB instance to use Transfer Acceleration.
- **(B)** Serve read traffic from the Multi-AZ standby instance.
- **(C)** Use Amazon Kinesis Data Firehose between the application and Amazon RDS to increase the concurrency of database requests.
- **(D)** Create a read replica from the source DB instance. Serve read traffic from the read replica. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng lưu dữ liệu trên RDS PostgreSQL Multi-AZ
> - Lưu lượng tăng cao (increases in traffic) gây vấn đề hiệu suất
> - Nguyên nhân chính: do database queries (truy vấn cơ sở dữ liệu)
> - Cách cải thiện hiệu suất là gì?

**Phân tích giải pháp tối ưu:**
Create a read replica from the source DB instance. Serve read traffic from the read replica.

Read replica được thiết kế chuyên để xử lý read traffic (traffic đọc), giảm tải cho primary DB instance

Cho phép scale out khả năng đọc dữ liệu bằng cách phân tán queries sang replica

Giải quyết đúng vấn đề: queries gây chậm → tách read queries sang replica

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Serve read traffic from the Multi-AZ standby instance.**:
  Multi-AZ standby replica chỉ dùng cho việc tăng tính khả dụng, failover hệ thống, không có khả năng xử lý read traffic trong điều kiện bình thường
  Không giúp giảm tải được cho DB chính

- **Configure the DB instance to use Transfer Acceleration.**:
  Transfer Acceleration là tính năng của S3 giúp tăng tốc việc upload file, hoàn toàn không liên quan gì đến RDS

- **(C) Use Amazon Kinesis Data Firehose between the application and Amazon RDS to increase the concurrency of database requests.**:
  Kinesis Firehose không hỗ trợ truyền data vào RDS, hơn nữa mục đích chính của Firehose là để truyền tải data đến các destination khác nhau, không liên quan gì đến việc giải quyết vấn đề query performance

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Database queries slow/performance" → Sử dụng thêm Read Replica để giảm tải bớt read traffic

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Working with DB instance read replicas

</details>

---

<div id="question-63"></div>

### Question 63: AWS Transfer Family with SFTP for Amazon S3
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company wants to give a customer the ability to use on-premises Microsoft Active Directory to download files that are stored in Amazon S3. The customer’s application uses an SFTP client to download the files.

Which solution will meet these requirements with the LEAST operational overhead and no changes to the customer’s application?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up AWS Transfer Family with SFTP for Amazon S3. Configure integrated Active Directory authentication. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Set up AWS Database Migration Service (AWS DMS) to synchronize the on-premises client with Amazon S3. Configure integrated Active Directory authentication.
- **(C)** Set up AWS DataSync to synchronize between the on-premises location and the S3 location by using AWS IAM Identity Center (AWS Single Sign-On).
- **(D)** Set up a Windows Amazon EC2 instance with SFTP to connect the on-premises client with Amazon S3. Integrate AWS Identity and Access Management (IAM).

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Khách hàng muốn dùng on-premises Active Directory để tải file từ S3
> - Ứng dụng hiện tại dùng SFTP client
> - Yêu cầu: LEAST operational overhead + không thay đổi application

**Phân tích giải pháp tối ưu:**
Set up AWS Transfer Family with SFTP for Amazon S3. Configure integrated Active Directory authentication.

AWS Transfer Family là service cho phép upload file lên S3, EFS thông qua các giao thức SFTP, FTP, FTPS

Do có support giao thức SFTP nên không cần thay đổi client application hiện tại sử dụng giao thức này, đáp ứng yêu cầu

Có thể liên kết với Active Directory để xác thực người dùng

Đối với Active Directory ở phía on-premise thì có thể liên kết thông qua AD Connector

Transfer Family cũng là fully managed service, do đó có operational overhead thấp

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Set up AWS Database Migration Service (AWS DMS) to synchronize the on-premises client with Amazon S3. Configure integrated Active Directory authentication.**:
  AWS DMS là dịch vụ migrate/replicate database, không phải file transfer service
  Sai mục đích sử dụng hoàn toàn

- **(C) Set up AWS DataSync to synchronize between the on-premises location and the S3 location by using AWS IAM Identity Center (AWS Single Sign-On).**:
  DataSync mặc dù có khả năng đồng bộ file lên S3 thông qua đường truyền online, tuy nhiên không sử dụng giao thức SFTP, không đáp ứng yêu cầu

- **(D) Set up a Windows Amazon EC2 instance with SFTP to connect the on-premises client with Amazon S3. Integrate AWS Identity and Access Management (IAM).**:
  Solution không tối ưu hóa về mặt vận hành vì phải tự cài đặt và triển khai SFTP server riêng trên EC2, không đáp ứng yêu cầu "LEAST operational overhead"
  Không có khả năng liên kết trực tiếp với Active Directory như Transfer Family

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SFTP/FTP/FTPS" + S3 → AWS Transfer Family

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using AWS Directory Service for Microsoft Active Directory

</details>

---

<div id="question-64"></div>

### Question 64: A target tracking policy to dynamically scale the Auto Scaling group
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An application runs on Amazon EC2 instances across multiple Availability Zones. The instances run in an Amazon EC2 Auto Scaling group behind an Application Load Balancer. The application performs best when the CPU utilization of the EC2 instances is at or near 40%.

What should a solutions architect do to maintain the desired performance across all instances in the group?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use scheduled scaling actions to scale up and scale down the Auto Scaling group.
- **(B)** Use an AWS Lambda function ta update the desired Auto Scaling group capacity.
- **(C)** Use a target tracking policy to dynamically scale the Auto Scaling group. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use a simple scaling policy to dynamically scale the Auto Scaling group.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên EC2 Auto Scaling group phía sau Application Load Balancer
> - Ứng dụng hoạt động tốt nhất khi CPU utilization ở mức 40%
> - Yêu cầu: duy trì hiệu suất mong muốn (40% CPU) trên tất cả instances

**Phân tích giải pháp tối ưu:**
Use a target tracking policy to dynamically scale the Auto Scaling group.

Target Tracking là scaling policy cho phép bạn chỉ định một giá trị mục tiêu cho một metric cụ thể (VD: CPU trung bình của các EC2 = 40%, v.v...), và Auto Scaling sẽ tự động tăng/giảm số lượng instances để duy trì metric đó ở mức mong muốn.

Đây là giải pháp đơn giản nhất, tự động nhất cho trường hợp này

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use a simple scaling policy to dynamically scale the Auto Scaling group.**:
  Simple scaling policy cho phép hành động một lần (thêm/bớt instance) mỗi lần alarm trigger, sau đó phải chờ cooldown period (khoảng thời gian để Auto Scaling Group ổn định lại sau khi scale) thì mới scale tiếp được
  Do scale chậm, không tự động scale nhanh như Target Tracking nên không đáp ứng yêu cầu

- **Use an AWS Lambda function to update the desired Auto Scaling group capacity.**:
  Giải pháp phức tạp không cần thiết, yêu cầu code custom logic để theo dõi metric, tốn effort
  Không tận dụng tính năng scaling tự động sẵn có của Auto Scaling

- **(A) Use scheduled scaling actions to scale up and scale down the Auto Scaling group.**:
  Scheduled scaling chỉ phù hợp khi biết trước thời điểm tăng/giảm traffic (ví dụ: giờ cao điểm cố định).
  Không có cơ chế tự động scale để duy trì ở mức CPU 40%

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "maintain at X%" hoặc "keep CPU at X%" → Target Tracking Policy

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Target tracking scaling policies for Amazon EC2 Auto Scaling

</details>

---

<div id="question-65"></div>

### Question 65: An AWS Lambda function triggered by an Amazon EventBridge scheduled event
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A solutions architect is creating a data processing job that runs once daily and can take up to 2 hours to complete. If the job is interrupted, it has to restart from the beginning.

How should the solutions architect address this issue in the MOST cost-effective manner?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an Amazon Elastic Container Service (Amazon ECS) Fargate task triggered by an Amazon EventBridge scheduled event.
- **(B)** Create a script that runs locally on an Amazon EC2 Reserved Instance that is triggered by a cron job.
- **(C)** Create an AWS Lambda function triggered by an Amazon EventBridge scheduled event. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use an Amazon Elastic Container Service (Amazon ECS) task running on Amazon EC2 triggered by an Amazon EventBridge scheduled event.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Job chạy 1 lần/ngày (once daily)
> - Thời gian chạy tối đa 2 giờ (up to 2 hours)
> - Nếu bị gián đoạn phải chạy lại từ đầu (restart from beginning)
> - Yêu cầu: giải pháp chạy job tiết kiệm chi phí nhất (most cost-effective)

**Phân tích giải pháp tối ưu:**
Use an Amazon Elastic Container Service (Amazon ECS) Fargate task triggered by an Amazon EventBridge scheduled event.

Fargate là serverless container service, phù hợp cho việc chạy job ngắn vì chỉ phải trả tiền cho thời gian chạy thực tế (2 giờ/ngày)

EventBridge là service cho phép đặt lịch để thực hiện action, trong trường hợp này action có thể là run ECS Fargate task để chạy job theo lịch

Solution này là fully managed, serverless hoàn toàn nên không cần quản lý infrastructure, không tốn tiền khi không sử dụng

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a script that runs locally on an Amazon EC2 Reserved Instance that is triggered by a cron job.**:
  Reserved Instance phải trả tiền 24/7 dù job chỉ chạy 2 giờ/ngày
  Lãng phí chi phí cho 22 giờ còn lại không sử dụng, không tối ưu chi phí
  Chỉ phù hợp cho các hệ thống chạy 24/7

- **Create an AWS Lambda function triggered by an Amazon EventBridge scheduled event.**:
  Lambda có giới hạn timeout tối đa 15 phút
  Job cần chạy tới 2 giờ → vượt quá giới hạn của Lambda
  Không thể sử dụng được cho use case này

- **(D) Use an Amazon Elastic Container Service (Amazon ECS) task running on Amazon EC2 triggered by an Amazon EventBridge scheduled event.**:
  ECS chạy trên EC2 tốn effort vận hành hơn so với Fargate
  Hơn nữa EC2 instances phải chạy liên tục, phát sinh nhiều chi phí

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đối với các câu hỏi về việc chạy job thì các solution thường nghĩ đến đó là AWS Lambda, ECS Fargate, Batch, EC2 Spot Instances.
- Đầu tiên cần xem thời gian chạy job là bao lâu, nếu trên 15 phút sẽ loại ngay Lambda, ưu tiên chọn các solution managed, serverless như ECS Fargate, Batch.
- Nếu thời gian dưới 15 phút thì thường sẽ lựa chọn Lambda

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using Amazon EventBridge Scheduler to schedule Amazon ECS tasks

</details>

---

