# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Cloud Mentor Practice Test 3

> **Nền tảng luyện thi**: Cloud Mentor AWS Practice Exams (SAA-C03)  
> **Bộ đề**: Practice Test 03 - Results & In-Depth Architecture Review (65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../../GLOSSARY.md) | [Cẩm nang từ vựng giải mã đề thi (EXAM_VOCABULARY.md)](./EXAM_VOCABULARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **46 câu** | $\ge 47$  câu (72%) | Chưa đạt tiêu chuẩn ❌ |
| **Số câu trả lời sai / bỏ qua (Incorrect & Skipped)** | **19 câu** | $\le 18$  câu | Cần tập trung ôn tập ⚠️ |
| **Tỷ lệ chính xác (Overall Score)** | **70.77% (~708 / 1000)** | $\ge 72.0\%$ (720 / 1000) | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 27 câu | 20 câu | 7 câu | **74.1%** | Cần củng cố 🔴 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 16 câu | 13 câu | 3 câu | **81.2%** | Tốt 🟡 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 13 câu | 8 câu | 5 câu | **61.5%** | Cần củng cố 🔴 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 9 câu | 5 câu | 4 câu | **55.6%** | Cần củng cố 🔴 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **46 câu** | **19 câu** | **70.77%** | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

## 🎯 2. Danh Sách 19 Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp 19 câu trả lời chưa chính xác và bỏ qua trong bài thi thử này. Hãy rà soát kỹ các bẫy đề bài, nguyên lý kiến trúc cốt lõi và bài học thực tế trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 02** | Domain 3 | **A data stream in Amazon Kinesis Data Streams in on-demand mode to capture the clic...** | Yêu cầu phân tích real-time<br>"Real-time analysis" → Kinesis Data Streams + Lambda | [👉 Xem](#question-02) |
| **Câu 03** | Domain 1 | **The EC2 account attributes to always encrypt new EBS volumes** | tất cả EBS volumes mới phải được mã hóa mặc định (encrypted by default)<br>"encrypt by default" → EC2 account attributes setting | [👉 Xem](#question-03) |
| **Câu 05** | Domain 4 | **A Compute Savings Plan for Lambda, Fargate, and Amazon EC2 and a SageMaker Savings...** | Công ty sử dụng 4 dịch vụ: EC2, Lambda, Fargate, SageMaker<br>EC2 Instance Savings Plan → Chỉ EC2 | [👉 Xem](#question-05) |
| **Câu 07** | Domain 1 | **AWS Budgets to establish budgets for each developer account** | LEAST operational overhead (ít phức tạp vận hành nhất)<br>"LEAST operational overhead" → AWS managed services với automation | [👉 Xem](#question-07) |
| **Câu 12** | Domain 1 | **AWS WAF** | Yêu cầu giải pháp most operationally efficient<br>"SQL injection + XSS" → AWS WAF (Web Application Firewall) | [👉 Xem](#question-12) |
| **Câu 14** | Domain 2 | **A Network Load Balancer in front of the EC2 instances and an Auto Scaling group fo...** | Yêu cầu MOST cost-effectively<br>"Transport layer OSI" → Layer 4 → TCP/UDP → Network Load Balancer | [👉 Xem](#question-14) |
| **Câu 17** | Domain 1 | **AWS Systems Manager Patch Manager to manage all the EC2 instances** | Đã migrated Hundreds of EC2 instances (từ on-premises VMs)<br>Automate OS updates/patching → AWS Systems Manager Patch Manager | [👉 Xem](#question-17) |
| **Câu 22** | Domain 4 | **An AWS Glue crawler to create a table based on the data that is in Amazon S3 and a...** | Yêu cầu MOST cost-effectively (chọn 3 đáp án)<br>"SMB file share" → S3 File Gateway (NFS/SMB interface) | [👉 Xem](#question-22) |
| **Câu 25** | Domain 3 | **The memory optimized instance family for both the application and the database** | SAP application với SQL Server database trong on-premises environment<br>"SAP" + "high memory utilization" → Memory optimized instances | [👉 Xem](#question-25) |
| **Câu 31** | Domain 1 | **Review the Trusted Advisor checks for Amazon RDS Reserved Instance Optimization an...** | Company chạy several RDS for Oracle On-Demand DB instances với high utilization<br>"High utilization" + "cost optimization" → Reserved Instance recommendations | [👉 Xem](#question-31) |
| **Câu 33** | Domain 3 | **The EC2 instances to be part of a cluster placement group** | Yêu cầu low-latency network performance<br>"HPC workload" + "low latency" + "high throughput" → Cluster placement groups | [👉 Xem](#question-33) |
| **Câu 35** | Domain 3 | **Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in ...** | Yêu cầu deploy certificate without incurring additional costs<br>"CloudFront" + "SSL certificate" → ACM certificate trong us-east-1 | [👉 Xem](#question-35) |
| **Câu 41** | Domain 2 | **AWS Backup to configure and monitor all backups for the services in use** | Large international university deploy tất cả compute services trên AWS Cloud<br>"Centralize management" + "automate backups" → AWS Backup | [👉 Xem](#question-41) |
| **Câu 42** | Domain 4 | **The database to Amazon RDS Custom for Oracle by using native tools** | Yêu cầu MOST cost-effectively<br>"Third-party features" + "privileged access" → RDS Custom | [👉 Xem](#question-42) |
| **Câu 43** | Domain 1 | **The password in AWS Secrets Manager** | Yêu cầu LEAST operational overhead<br>"Password rotation" + "RDS" → AWS Secrets Manager | [👉 Xem](#question-43) |
| **Câu 46** | Domain 3 | **AWS Storage Gateway** | On-premises business application tạo ra hundreds of files mỗi ngày<br>"SMB file share" + "copy to AWS" + "no code changes" → AWS Storage Gateway | [👉 Xem](#question-46) |
| **Câu 48** | Domain 4 | **AWS Backup to create a backup plan with a rule that takes a daily backup and repli...** | Yêu cầu MOST cost-effectively<br>"AWS managed service" + "cost-effective" → AWS Backup | [👉 Xem](#question-48) |
| **Câu 62** | Domain 2 | **Copy the code into an AWS Lambda function that has 1 GB of memory** | Java-based job chạy trên EC2 instance<br>"10 seconds every hour" → Lambda optimal cho short, infrequent tasks | [👉 Xem](#question-62) |
| **Câu 65** | Domain 1 | **An AWS Key Management Service (AWS KMS) customer managed key** | Yêu cầu LEAST operational overhead<br>"Automatically every year" → KMS customer managed keys với documented 365-day rotation | [👉 Xem](#question-65) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ✅ Đúng | [Amazon S3 Storage Lens to identify all S3 buckets that are not versioning-enabled ...](#question-01) | Domain 2 |
| [02](#question-02) | ❌ Sai | [A data stream in Amazon Kinesis Data Streams in on-demand mode to capture the clic...](#question-02) | Domain 3 |
| [03](#question-03) | ❌ Sai | [The EC2 account attributes to always encrypt new EBS volumes](#question-03) | Domain 1 |
| [04](#question-04) | ✅ Đúng | [Babelfish on Aurora PostgreSQL to run the SQL queries from the applications and th...](#question-04) | Domain 2 |
| [05](#question-05) | ❌ Sai | [A Compute Savings Plan for Lambda, Fargate, and Amazon EC2 and a SageMaker Savings...](#question-05) | Domain 4 |
| [06](#question-06) | ✅ Đúng | [The security group for the application tier to allow outbound HTTPS traffic and Mi...](#question-06) | Domain 1 |
| [07](#question-07) | ❌ Sai | [AWS Budgets to establish budgets for each developer account](#question-07) | Domain 1 |
| [08](#question-08) | ✅ Đúng | [A Compute Savings Plan](#question-08) | Domain 1 |
| [09](#question-09) | ✅ Đúng | [A Cache-Control max-age directive of 24 hours to the objects in Amazon S3 and Set ...](#question-09) | Domain 3 |
| [10](#question-10) | ✅ Đúng | [Share an Amazon QuickSight dashboard that includes the requested table visual](#question-10) | Domain 1 |
| [11](#question-11) | ✅ Đúng | [Update the application to send the purchase requests to an Amazon Simple Queue Ser...](#question-11) | Domain 4 |
| [12](#question-12) | ❌ Sai | [AWS WAF](#question-12) | Domain 1 |
| [13](#question-13) | ✅ Đúng | [An Amazon API Gateway endpoint that returns the contact form from an AWS Lambda fu...](#question-13) | Domain 4 |
| [14](#question-14) | ❌ Sai | [A Network Load Balancer in front of the EC2 instances and an Auto Scaling group fo...](#question-14) | Domain 2 |
| [15](#question-15) | ✅ Đúng | [An S3 gateway endpoint to access the S3 buckets](#question-15) | Domain 1 |
| [16](#question-16) | ✅ Đúng | [An Auto Scaling group and an ELB in the DR Region](#question-16) | Domain 2 |
| [17](#question-17) | ❌ Sai | [AWS Systems Manager Patch Manager to manage all the EC2 instances](#question-17) | Domain 1 |
| [18](#question-18) | ✅ Đúng | [An organization in AWS Organizations in the management account with the default po...](#question-18) | Domain 1 |
| [19](#question-19) | ✅ Đúng | [Amazon Cognito for authentication](#question-19) | Domain 3 |
| [20](#question-20) | ✅ Đúng | [An IAM role in the Production account](#question-20) | Domain 1 |
| [21](#question-21) | ✅ Đúng | [An Amazon Simple Queue Service (Amazon SQS) FIFO queue](#question-21) | Domain 2 |
| [22](#question-22) | ❌ Sai | [An AWS Glue crawler to create a table based on the data that is in Amazon S3 and a...](#question-22) | Domain 4 |
| [23](#question-23) | ✅ Đúng | [AWS Compute Optimizer to generate EBS volume recommendations for optimization](#question-23) | Domain 2 |
| [24](#question-24) | ✅ Đúng | [A gateway VPC endpoint for Amazon S3](#question-24) | Domain 1 |
| [25](#question-25) | ❌ Sai | [The memory optimized instance family for both the application and the database](#question-25) | Domain 3 |
| [26](#question-26) | ✅ Đúng | [An Aurora read replica in the existing Aurora DB cluster](#question-26) | Domain 3 |
| [27](#question-27) | ✅ Đúng | [Modify the RDS database to have a retention period of 30 days for automated backups](#question-27) | Domain 2 |
| [28](#question-28) | ✅ Đúng | [The application to use client-side encryption with a key stored in AWS Key Managem...](#question-28) | Domain 1 |
| [29](#question-29) | ✅ Đúng | [Provision an Amazon RDS for MySQL DB instance with Provisioned IOPS SSD storage](#question-29) | Domain 3 |
| [30](#question-30) | ✅ Đúng | [A gateway endpoint for Amazon S3 in the VPC](#question-30) | Domain 1 |
| [31](#question-31) | ❌ Sai | [Review the Trusted Advisor checks for Amazon RDS Reserved Instance Optimization an...](#question-31) | Domain 1 |
| [32](#question-32) | ✅ Đúng | [Two AWS Direct Connect connections from each of the primary and secondary data cen...](#question-32) | Domain 1 |
| [33](#question-33) | ❌ Sai | [The EC2 instances to be part of a cluster placement group](#question-33) | Domain 3 |
| [34](#question-34) | ✅ Đúng | [Generate a presigned URL that has the required access to the location of the repor...](#question-34) | Domain 1 |
| [35](#question-35) | ❌ Sai | [Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in ...](#question-35) | Domain 3 |
| [36](#question-36) | ✅ Đúng | [The DB cluster to use IAM database authentication](#question-36) | Domain 1 |
| [37](#question-37) | ✅ Đúng | [Amazon GuardDuty to perform threat detection](#question-37) | Domain 1 |
| [38](#question-38) | ✅ Đúng | [Copy the website assets to an Amazon Elastic File System (Amazon EFS) file system](#question-38) | Domain 2 |
| [39](#question-39) | ✅ Đúng | [An Amazon Aurora Serverless cluster](#question-39) | Domain 4 |
| [40](#question-40) | ✅ Đúng | [Amazon Neptune to store the data](#question-40) | Domain 1 |
| [41](#question-41) | ❌ Sai | [AWS Backup to configure and monitor all backups for the services in use](#question-41) | Domain 2 |
| [42](#question-42) | ❌ Sai | [The database to Amazon RDS Custom for Oracle by using native tools](#question-42) | Domain 4 |
| [43](#question-43) | ❌ Sai | [The password in AWS Secrets Manager](#question-43) | Domain 1 |
| [44](#question-44) | ✅ Đúng | [A recurring scheduled action to scale up the Auto Scaling group before the expecte...](#question-44) | Domain 3 |
| [45](#question-45) | ✅ Đúng | [An AWS Lambda function that scans the DynamoDB table and uses Amazon Simple Notifi...](#question-45) | Domain 2 |
| [46](#question-46) | ❌ Sai | [AWS Storage Gateway](#question-46) | Domain 3 |
| [47](#question-47) | ✅ Đúng | [The web application to Amazon EC2 instances that run in an Auto Scaling group acro...](#question-47) | Domain 2 |
| [48](#question-48) | ❌ Sai | [AWS Backup to create a backup plan with a rule that takes a daily backup and repli...](#question-48) | Domain 4 |
| [49](#question-49) | ✅ Đúng | [Amazon Macie in each Region](#question-49) | Domain 1 |
| [50](#question-50) | ✅ Đúng | [AWS Global Accelerator](#question-50) | Domain 3 |
| [51](#question-51) | ✅ Đúng | [Provision a gateway endpoint for Amazon S3 in the VPC](#question-51) | Domain 1 |
| [52](#question-52) | ✅ Đúng | [Amazon Elastic Block Store (Amazon EBS) encryption and Amazon RDS encryption with ...](#question-52) | Domain 1 |
| [53](#question-53) | ✅ Đúng | [Mount an Amazon Elastic File System (Amazon EFS) file system across all the EC2 in...](#question-53) | Domain 2 |
| [54](#question-54) | ✅ Đúng | [An Amazon Route 53 multivalue answer routing policy](#question-54) | Domain 2 |
| [55](#question-55) | ✅ Đúng | [An AWS Transit Gateway in the networking team's AWS account](#question-55) | Domain 2 |
| [56](#question-56) | ✅ Đúng | [An Amazon Aurora MySQL Multi-AZ DB cluster with multiple read replicas](#question-56) | Domain 3 |
| [57](#question-57) | ✅ Đúng | [The AWS Snow Family console to order several AWS Snowball Edge Storage Optimized d...](#question-57) | Domain 4 |
| [58](#question-58) | ✅ Đúng | [An AWS Transfer Family server with SFTP endpoints](#question-58) | Domain 1 |
| [59](#question-59) | ✅ Đúng | [Implement an AWS Site-to-Site VPN connection](#question-59) | Domain 1 |
| [60](#question-60) | ✅ Đúng | [Amazon Neptune to store the datasets with edges and vertices](#question-60) | Domain 3 |
| [61](#question-61) | ✅ Đúng | [An S3 Lifecycle rule to transition objects to the S3 Intelligent-Tiering storage c...](#question-61) | Domain 2 |
| [62](#question-62) | ❌ Sai | [Copy the code into an AWS Lambda function that has 1 GB of memory](#question-62) | Domain 2 |
| [63](#question-63) | ✅ Đúng | [The cluster to use the Aurora I/O-Optimized storage configuration](#question-63) | Domain 4 |
| [64](#question-64) | ✅ Đúng | [AWS IAM Identity Center](#question-64) | Domain 1 |
| [65](#question-65) | ❌ Sai | [An AWS Key Management Service (AWS KMS) customer managed key](#question-65) | Domain 1 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi & Phân Tích Kiến Trúc (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: Amazon S3 Storage Lens to identify all S3 buckets that are not versioning-enabled ...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A global company runs its workloads on AWS. The company's application uses Amazon S3 buckets across AWS Regions for sensitive data storage and analysis. The company stores millions of objects in multiple S3 buckets daily. The company wants to identify all S3 buckets that are not versioning-enabled.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an S3 Multi-Region Access Point to identify all S3 buckets that are not versioning-enabled across Regions.
- **(B)** Use Amazon S3 Storage Lens to identify all S3 buckets that are not versioning-enabled across Regions. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Set up an AWS CloudTrail event that has a rule to identify all S3 buckets that are not versioning-enabled across Regions.
- **(D)** Enable IAM Access Analyzer for S3 to identify all S3 buckets that are not versioning-enabled across Regions.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty global có workload trên AWS
> - Sử dụng S3 buckets trên nhiều regions để lưu dữ liệu nhạy cảm
> - Lưu hàng triệu objects hàng ngày trong nhiều S3 buckets
> - Cần identify all S3 buckets không bật versioning across regions

**Phân tích giải pháp tối ưu:**
Use Amazon S3 Storage Lens to identify all S3 buckets that are not versioning-enabled across Regions.

S3 Storage Lens là công cụ analytics and monitoring chính thức của AWS để theo dõi cấu hình S3 trên toàn bộ organization

Cung cấp dashboard tổng quan về tất cả buckets across regions, bao gồm versioning status, encryption status

Đây là giải pháp native AWS được thiết kế chính xác cho use case cross-region configuration monitoring

Hình ảnh bên dưới là cách xác định các bucket đã enabled versioning, các bucket còn lại thì chưa enabled

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Set up an AWS CloudTrail event that has a rule to identify all S3 buckets that are not versioning-enabled across Regions.**:
  CloudTrail ghi log API calls, không phải công cụ để phân tích trạng thái cấu hình
  CloudTrail Events Rules không thể identify configuration states như versioning status

- **Enable IAM Access Analyzer for S3 to identify all S3 buckets that are not versioning-enabled across Regions.**:
  IAM Access Analyzer for S3 được thiết kế để analyze bucket policies và public access
  Không phải để check versioning configuration

- **Create an S3 Multi-Region Access Point to identify all S3 buckets that are not versioning-enabled across Regions.**:
  Multi-Region Access Point là để simplify cross-region access
  Không phải công cụ monitoring hay analysis

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Identify S3 configuration across regions" → S3 Storage Lens
- "S3 analytics + insights + dashboard" → S3 Storage Lens
- "Monitor S3 compliance" → S3 Storage Lens

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - storage lens data protection](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-lens-data-protection.html#storage-lens-data-protection-versioning)

</details>

---

<div id="question-02"></div>

### Question 02: A data stream in Amazon Kinesis Data Streams in on-demand mode to capture the clic...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An ecommerce company wants to collect user clickstream data from the company's website for real-time analysis. The website experiences fluctuating traffic patterns throughout the day. The company needs a scalable solution that can adapt to varying levels of traffic.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Managed Service for Apache Flink (previously known as Amazon Kinesis Data Analytics) to capture the clickstream data. Use AWS Lambda to process the data in real time.
- **(B)** Use Amazon Kinesis Video Streams to capture the clickstream data. Use AWS Glue to process the data in real time.
- **(C)** Use Amazon Kinesis Data Firehose to capture the clickstream data. Use AWS Glue to process the data in real time.
- **(D)** Use a data stream in Amazon Kinesis Data Streams in on-demand mode to capture the clickstream data. Use AWS Lambda to process the data in real time. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty ecommerce cần thu thập clickstream data từ website
> - Yêu cầu phân tích real-time
> - Website có lưu lượng dao động (fluctuating traffic patterns) trong ngày
> - Cần giải pháp có thể scale thích ứng với traffic thay đổi

**Phân tích giải pháp tối ưu:**
Use a data stream in Amazon Kinesis Data Streams in on-demand mode to capture the clickstream data. Use AWS Lambda to process the data in real time.



Kinesis Data Streams on-demand mode tự động scale theo traffic mà không cần provisioning capacity trước.

Lambda xử lý real-time hoàn hảo với event-driven architecture, tự động scale theo số lượng records.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use Amazon Kinesis Data Firehose to capture the clickstream data. Use AWS Glue to process the data in real time.**:
  → Firehose là near real-time (60 giây buffer tối thiểu), không phải real-time. AWS Glue là batch processing, không phù hợp real-time analysis.

- **(B) Use Amazon Kinesis Video Streams to capture the clickstream data. Use AWS Glue to process the data in real time.**:
  → Kinesis Video Streams dành cho video data, không phải clickstream text/JSON data. AWS Glue vẫn là batch processing.

- **Use Amazon Managed Service for Apache Flink to capture the clickstream data. Use AWS Lambda to process the data in real time.**:
  → Apache Flink dùng để xử lý stream, không phải thu thập (capture) dữ liệu. Cần có data source trước khi đưa vào Flink.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-03"></div>

### Question 03: The EC2 account attributes to always encrypt new EBS volumes
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company plans to rehost an application to Amazon EC2 instances that use Amazon Elastic Block Store (Amazon EBS) as the attached storage.

A solutions architect must design a solution to ensure that all newly created Amazon EBS volumes are encrypted by default. The solution must also prevent the creation of unencrypted EBS volumes.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a customer managed key in AWS Key Management Service (AWS KMS). Configure AWS Migration Hub to use the key when the company migrates workloads.
- **(B)** Configure AWS Systems Manager to create encrypted copies of the EBS volumes. Reconfigure the EC2 instances to use the encrypted volumes.
- **(C)** Use AWS Config. Configure the encrypted-volumes identifier. Apply the default AWS Key Management Service (AWS KMS) key.
- **(D)** Configure the EC2 account attributes to always encrypt new EBS volumes. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty muốn rehost application lên EC2 instances với EBS storage
> - Yêu cầu: tất cả EBS volumes mới phải được mã hóa mặc định (encrypted by default)
> - Yêu cầu: ngăn chặn tạo EBS volumes không mã hóa (prevent unencrypted volumes)
> - Cần giải pháp đảm bảo encryption cho tất cả EBS volumes mới

**Phân tích giải pháp tối ưu:**
Configure the EC2 account attributes to always encrypt new EBS volumes.

Đây là cách chính thức và đơn giản nhất để bật mã hóa mặc định cho tất cả EBS volumes ở account level. Khi enable "EBS encryption by default", mọi EBS volume mới sẽ tự động được mã hóa và không thể tạo unencrypted volumes.

Cách thực hiện:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use AWS Config. Configure the encrypted-volumes identifier. Apply the default AWS Key Management Service (AWS KMS) key.**:
  AWS Config chỉ monitoring và compliance, không thể enforce việc tạo encrypted volumes mặc định. Nó chỉ detect vi phạm sau khi đã tạo unencrypted volume.

- **Configure AWS Systems Manager to create encrypted copies of the EBS volumes. Reconfigure the EC2 instances to use the encrypted volumes.**:
  Đây là giải pháp reactive (xử lý sau khi tạo), không proactive (ngăn chặn từ đầu). Không đáp ứng yêu cầu "prevent creation of unencrypted volumes".

- **Create a customer managed key in AWS Key Management Service (AWS KMS). Configure AWS Migration Hub to use the key when the company migrates workloads.**:
  AWS Migration Hub chỉ dùng cho migration process, không liên quan đến việc enforce encryption cho EBS volumes thường ngày.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-04"></div>

### Question 04: Babelfish on Aurora PostgreSQL to run the SQL queries from the applications and th...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (D) | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A company uses a Microsoft SQL Server database. The company's applications are connected to the database. The company wants to migrate to an Amazon Aurora PostgreSQL database with minimal changes to the application code.

Which combination of steps will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Database Migration Service (AWS DMS) to rewrite the SQL queries in the applications.
- **(B)** Use Amazon RDS Proxy to connect the applications to Aurora PostgreSQL.
- **(C)** Migrate the database schema and data by using the AWS Schema Conversion Tool (AWS SCT) and AWS Database Migration Service (AWS DMS). `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Enable Babelfish on Aurora PostgreSQL to run the SQL queries from the applications. `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Use the AWS Schema Conversion Tool (AWS SCT) to rewrite the SQL queries in the applications.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Microsoft SQL Server database
> - Muốn migrate sang Amazon Aurora PostgreSQL
> - Yêu cầu: minimal changes to application code (thay đổi ít nhất code ứng dụng)
> - Cần chọn 2 đáp án đúng

**Phân tích giải pháp tối ưu:**
Enable Babelfish on Aurora PostgreSQL to run the SQL queries from the applications.

Babelfish là tính năng cho phép Aurora PostgreSQL hiểu và thực thi SQL Server T-SQL syntax

Giúp applications có thể chạy SQL queries hiện tại mà không cần thay đổi code

Migrate the database schema and data by using the AWS Schema Conversion Tool (AWS SCT) and AWS Database Migration Service (AWS DMS).

AWS SCT: convert schema từ SQL Server sang PostgreSQL

AWS DMS: migrate dữ liệu từ source sang target database

Đây là combo chuẩn cho database migration

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(E) Use the AWS Schema Conversion Tool (AWS SCT) to rewrite the SQL queries in the applications.**:
  Sai vì AWS SCT chỉ convert database schema, không rewrite application code
  Nếu rewrite queries thì vi phạm yêu cầu "minimal changes"

- **(B) Use Amazon RDS Proxy to connect the applications to Aurora PostgreSQL.**:
  RDS Proxy chỉ giúp connection pooling và failover, không giải quyết compatibility giữa SQL Server và PostgreSQL syntax

- **(A) Use AWS Database Migration Service (AWS DMS) to rewrite the SQL queries in the applications.**:
  DMS chỉ migrate dữ liệu, không có chức năng rewrite application queries

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SQL Server to PostgreSQL + minimal code changes" → Babelfish
- "Database migration" → AWS SCT + AWS DMS combo
- "Schema conversion" → AWS SCT
- "Data migration" → AWS DMS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/aurora/babelfish/)
- 🌐 [AWS Docs: AmazonRDS - babelfish](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/babelfish.html)

</details>

---

<div id="question-05"></div>

### Question 05: A Compute Savings Plan for Lambda, Fargate, and Amazon EC2 and a SageMaker Savings...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A company has released a new version of its production application. The company's workload uses Amazon EC2, AWS Lambda, AWS Fargate, and Amazon SageMaker.

The company wants to cost optimize the workload now that usage is at a steady state. The company wants to cover the most services with the fewest savings plans.

Which combination of savings plans will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase an EC2 Instance Savings Plan for Amazon EC2 and SageMaker.
- **(B)** Purchase a Compute Savings Plan for Amazon EC2, Lambda, and SageMaker.
- **(C)** Purchase a SageMaker Savings Plan. `[Đáp án đúng ✅]`
- **(D)** Purchase a Compute Savings Plan for Lambda, Fargate, and Amazon EC2. `[Đáp án đúng ✅]`
- **(E)** Purchase an EC2 Instance Savings Plan for Amazon EC2 and Fargate.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty sử dụng 4 dịch vụ: EC2, Lambda, Fargate, SageMaker
> - Mục tiêu: tối ưu chi phí với ít savings plans nhất nhưng cover nhiều services nhất
> - Workload đã ở trạng thái ổn định (steady state)

**Phân tích giải pháp tối ưu:**
Purchase a SageMaker Savings Plan.

SageMaker Savings Plan cho mức giảm giá cao nhất cho SageMaker (lên tới 64%) so với Compute Savings Plan chỉ ~17% cho SageMaker. Khi đã có steady workload, việc dùng dedicated plan sẽ tối ưu cost hơn.

Purchase a Compute Savings Plan for Lambda, Fargate, and Amazon EC2.

Compute Savings Plan là lựa chọn duy nhất có thể cover cả 3 dịch vụ Lambda, Fargate và EC2 trong 1 plan duy nhất. EC2 Instance Savings Plan không cover được Lambda và Fargate.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Purchase a Compute Savings Plan for Amazon EC2, Lambda, and SageMaker**:
  Sai. Mặc dù cover được 3 services, nhưng không cover Fargate. Cần thêm plan khác để cover Fargate
  không đạt mục tiêu "fewest plans".

- **(A) Purchase an EC2 Instance Savings Plan for Amazon EC2 and SageMaker**:
  Sai. EC2 Instance Savings Plan chỉ áp dụng cho EC2, không cover SageMaker. Và cũng không cover Lambda, Fargate.

- **(E) Purchase an EC2 Instance Savings Plan for Amazon EC2 and Fargate**:
  Sai. EC2 Instance Savings Plan không cover Fargate. Fargate cần Compute Savings Plan.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- EC2 Instance Savings Plan → Chỉ EC2
- SageMaker Savings Plan → Chỉ SageMaker
- Compute Savings Plan → EC2, Lambda, Fargate

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: savingsplans](https://aws.amazon.com/savingsplans/ml-pricing/)
- 🌐 [AWS Service Overview: savingsplans](https://aws.amazon.com/savingsplans/compute-pricing/)

</details>

---

<div id="question-06"></div>

### Question 06: The security group for the application tier to allow outbound HTTPS traffic and Mi...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (E), (F) | **Đáp án đúng**: (C), (E), (F)

#### 📋 Đề bài (Scenario)
A solutions architect is designing a three-tier web application. The architecture consists of an internet-facing Application Load Balancer (ALB) and a web tier that is hosted on Amazon EC2 instances in private subnets. The application tier with the business logic runs on EC2 instances in private subnets. The database tier consists of Microsoft SQL Server that runs on EC2 instances in private subnets. Security is a high priority for the company.

Which combination of security group configurations should the solutions architect use? (Choose three.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the security group for the database tier to allow outbound HTTPS traffic and Microsoft SQL Server traffic to the security group for the web tier.
- **(B)** Configure the security group for the database tier to allow inbound Microsoft SQL Server traffic from the security group for the application tier.
- **(C)** Configure the security group for the application tier to allow inbound HTTPS traffic from the security group for the web tier. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Configure the security group for the web tier to allow outbound HTTPS traffic to 0.0.0.0/0.
- **(E)** Configure the security group for the application tier to allow outbound HTTPS traffic and Microsoft SQL Server traffic to the security group for the web tier. `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** Configure the security group for the web tier to allow inbound HTTPS traffic from the security group for the ALB. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (E), (F)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ba tầng ứng dụng web (three-tier web application): ALB → Web tier → Application tier → Database tier
> - Tất cả EC2 instances đều ở private subnets
> - Database là Microsoft SQL Server
> - Security là ưu tiên cao
> - Cần chọn 3 cấu hình security group đúng

**Phân tích giải pháp tối ưu:**
Configure the security group for the web tier to allow inbound HTTPS traffic from the security group for the ALB.

→ Đúng vì ALB cần gửi traffic HTTPS đến web tier. Web tier chỉ nhận traffic từ ALB, không phải từ internet.

Configure the security group for the database tier to allow inbound Microsoft SQL Server traffic from the security group for the application tier.

→ Đúng vì application tier cần kết nối đến database để xử lý business logic. Database chỉ nhận kết nối từ application tier.

Configure the security group for the application tier to allow inbound HTTPS traffic from the security group for the web tier.

→ Đúng vì web tier cần forward request đến application tier để xử lý business logic.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the security group for the web tier to allow outbound HTTPS traffic to 0.0.0.0/0.**:
  → Sai vì không cần thiết và vi phạm nguyên tắc least privilege. Web tier chỉ cần gửi traffic đến application tier, không cần ra internet.

- **Configure the security group for the database tier to allow outbound HTTPS traffic and Microsoft SQL Server traffic to the security group for the web tier.**:
  → Sai vì database không cần gửi traffic ngược lại. Database tier chỉ nhận kết nối, không khởi tạo outbound connections đến web tier.

- **Configure the security group for the application tier to allow outbound HTTPS traffic and Microsoft SQL Server traffic to the security group for the web tier.**:
  → Sai vì application tier không gửi SQL Server traffic về web tier. Traffic flow chỉ một chiều từ web → application → database.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-07"></div>

### Question 07: AWS Budgets to establish budgets for each developer account
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has deployed a multi-account strategy on AWS by using AWS Control Tower. The company has provided individual AWS accounts to each of its developers. The company wants to implement controls to limit AWS resource costs that the developers incur.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Service Catalog to allow developers to launch resources within a limited cost range. Create AWS Lambda functions in each AWS account to stop running resources at the end of each work day. Configure the Lambda functions to resume the resources at the start of each work day.
- **(B)** Use AWS Cost Explorer to monitor and report on costs for each developer account. Configure Cost Explorer to send a daily report to each developer to monitor their spending. Use AWS Cost Anomaly Detection to detect anomalous spending and provide alerts.
- **(C)** Use AWS Budgets to establish budgets for each developer account. Set up budget alerts for actual and forecast values to notify developers when they exceed or expect to exceed their assigned budget. Use AWS Budgets actions to apply a DenyAll policy to the developer's IAM role to prevent additional resources from being launched when the assigned budget is reached. `[Đáp án đúng ✅]`
- **(D)** Instruct each developer to tag all their resources with a tag that has a key of CostCenter and a value of the developer's name. Use the required-tags AWS Config managed rule to check for the tag. Create an AWS Lambda function to terminate resources that do not have the tag. Configure AWS Cost Explorer to send a daily report to each developer to monitor their spending.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng AWS Control Tower với chiến lược multi-account
> - Mỗi developer có riêng một AWS account
> - Muốn kiểm soát chi phí (limit AWS resource costs) mà developer tạo ra
> - Yêu cầu: LEAST operational overhead (ít phức tạp vận hành nhất)

**Phân tích giải pháp tối ưu:**
Use AWS Budgets to establish budgets for each developer account. Set up budget alerts for actual and forecast values to notify developers when they exceed or expect to exceed their assigned budget. Use AWS Budgets actions to apply a DenyAll policy to the developer's IAM role to prevent additional resources from being launched when the assigned budget is reached.

AWS Budgets cung cấp giải pháp tự động hoá hoàn chỉnh: thiết lập ngân sách cho từng account, cảnh báo khi vượt ngưỡng, và quan trọng nhất là tự động ngăn chặn việc tạo thêm resource khi đạt giới hạn ngân sách thông qua AWS Budgets Actions. Điều này đảm bảo cost control mà không cần can thiệp thủ công.

Tham khảo tài liệu trong link đính kèm để hiểu rõ cách config budget actions

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Instruct each developer to tag all their resources with a tag that has a key of CostCenter and a value of the developer's name. Use the required-tags AWS Config managed rule to check for the tag. Create an AWS Lambda function to terminate resources that do not have the tag. Configure AWS Cost Explorer to send a daily report to each developer to monitor their spending.**:
  Giải pháp này yêu cầu quá nhiều thao tác thủ công: developer phải tag resources, tạo Lambda function để terminate resources, và chỉ có monitoring qua Cost Explorer mà không có automatic enforcement.

- **(B) Use AWS Cost Explorer to monitor and report on costs for each developer account. Configure Cost Explorer to send a daily report to each developer to monitor their spending. Use AWS Cost Anomaly Detection to detect anomalous spending and provide alerts.**:
  Chỉ là monitoring và alerting solution, không có khả năng prevent việc chi tiêu vượt ngân sách. Cost Anomaly Detection chỉ phát hiện bất thường chứ không ngăn chặn.

- **(A) Use AWS Service Catalog to allow developers to launch resources within a limited cost range. Create AWS Lambda functions in each AWS account to stop running resources at the end of each work day. Configure the Lambda functions to resume the resources at the start of each work day.**:
  Approach phức tạp với việc tạo Lambda functions để stop/start resources hàng ngày. Không thực sự kiểm soát chi phí mà chỉ tạm dừng resources, và có operational overhead cao.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "LEAST operational overhead" → AWS managed services với automation
- "Multi-account cost control" → AWS Budgets với Budgets Actions
- "Prevent resource creation" → IAM policies được apply tự động qua Budgets Actions
- "Developer individual accounts" → Per-account budget setup

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: cost-management - budgets controls](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-controls.html)

</details>

---

<div id="question-08"></div>

### Question 08: A Compute Savings Plan
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company runs its application by using Amazon EC2 instances and AWS Lambda functions. The EC2 instances run in private subnets of a VPC. The Lambda functions need direct network access to the EC2 instances for the application to work.

The application will run for 1 year. The number of Lambda functions that the application uses will increase during the 1-year period. The company must minimize costs on all application resources.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase an EC2 Instance Savings Plan. Connect the Lambda functions to new public subnets in the same VPC where the EC2 instances run.
- **(B)** Purchase an EC2 Instance Savings Plan. Connect the Lambda functions to the private subnets that contain the EC2 instances.
- **(C)** Purchase a Compute Savings Plan. Keep the Lambda functions in the Lambda service VPC.
- **(D)** Purchase a Compute Savings Plan. Connect the Lambda functions to the private subnets that contain the EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên EC2 instances (private subnets) và Lambda functions
> - Lambda cần direct network access đến EC2 instances
> - Chạy trong 1 năm, số lượng Lambda functions sẽ tăng
> - Yêu cầu: minimize costs trên tất cả tài nguyên

**Phân tích giải pháp tối ưu:**
Purchase a Compute Savings Plan. Connect the Lambda functions to the private subnets that contain the EC2 instances.

→ Đây là đáp án tối ưu vì:

Compute Savings Plan áp dụng được cho cả EC2 và Lambda, giảm chi phí tổng thể khi số lượng Lambda tăng

Kết nối Lambda vào private subnets cho phép direct access đến EC2 instances như yêu cầu

Tiết kiệm được chi phí NAT Gateway vì không cần truy cập internet

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Purchase an EC2 Instance Savings Plan. Connect the Lambda functions to the private subnets that contain the EC2 instances.**:
  EC2 Instance Savings Plan chỉ áp dụng cho EC2, không giảm chi phí Lambda đang tăng. Không tối ưu cost cho toàn bộ workload.

- **(A) Purchase an EC2 Instance Savings Plan. Connect the Lambda functions to new public subnets in the same VPC where the EC2 instances run.**:
  EC2 Instance Savings Plan không cover Lambda. Lambda trong public subnet vẫn cần NAT Gateway để access private EC2, tăng chi phí.

- **(C) Purchase a Compute Savings Plan. Keep the Lambda functions in the Lambda service VPC.**:
  Khi Lambda được tạo mà không config VPC, nó được đặt trong Lambda service VPC như default. Lambda ở service VPC không thể direct access đến EC2 trong private subnets. Không có cách nào để Lambda từ service VPC kết nối đến private resources trong VPC riêng của bạn mà không cần VPC connection.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Lambda + EC2 + minimize costs" → Compute Savings Plan (covers both)
- "Direct network access to private EC2" → Lambda cần VPC connection
- "Number of Lambda increasing" → Compute Savings Plan tốt hơn EC2-only plan
- Cost Optimization Pattern:
- EC2 Instance Savings Plan: chỉ cho EC2 instances cụ thể
- Compute Savings Plan: flexible hơn, áp dụng cho EC2, Lambda, Fargate
- Lambda trong private subnet: direct access + không cần NAT Gateway
- Lambda trong public/service VPC: cần NAT Gateway → tăng chi phí
- Lambda VPC Connection:
- Lambda cần ENI để connect đến VPC
- Private subnet: direct access đến private resources
- Public subnet: vẫn cần NAT cho outbound internet traffic

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: savingsplans](https://aws.amazon.com/savingsplans/compute-pricing/)
- 🌐 [AWS Docs: lambda - configuration vpc](https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html)

</details>

---

<div id="question-09"></div>

### Question 09: A Cache-Control max-age directive of 24 hours to the objects in Amazon S3 and Set ...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D), (E) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A company is hosting a high-traffic static website on Amazon S3 with an Amazon CloudFront distribution that has a default TTL of 0 seconds. The company wants to implement caching to improve performance for the website. However, the company also wants to ensure that stale content is not served for more than a few minutes after a deployment.

Which combination of caching methods should a solutions architect implement to meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Add a Cache-Control private directive to the objects in Amazon S3.
- **(B)** Create an AWS Lambda@Edge function to add an Expires header to HTTP responses. Configure the function to run on viewer response.
- **(C)** Set a default TTL of 2 minutes on the S3 bucket.
- **(D)** Add a Cache-Control max-age directive of 24 hours to the objects in Amazon S3. On deployment, create a CloudFront invalidation to clear any changed files from edge caches. `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Set the CloudFront default TTL to 2 minutes. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Trang web tĩnh (static website) trên S3 + CloudFront
> - CloudFront default TTL = 0 giây (không cache)
> - Cần caching để cải thiện performance
> - Đảm bảo nội dung cũ không được phục vụ quá vài phút sau deployment
> - Chọn 2 đáp án

**Phân tích giải pháp tối ưu:**
Set the CloudFront default TTL to 2 minutes.

Thiết lập TTL 2 phút cho CloudFront đáp ứng yêu cầu cache để tăng performance, đồng thời đảm bảo nội dung cũ không tồn tại quá lâu (chỉ vài phút).

Add a Cache-Control max-age directive of 24 hours to the objects in Amazon S3. On deployment, create a CloudFront invalidation to clear any changed files from edge caches.

Cache-Control max-age=24h cho phép cache lâu hơn để tối ưu performance. Khi deployment, dùng CloudFront invalidation để xóa ngay nội dung cũ, đảm bảo không phục vụ stale content.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Set a default TTL of 2 minutes on the S3 bucket.**:
  → S3 bucket không có tính năng set TTL. TTL chỉ được cấu hình ở CloudFront level.

- **Add a Cache-Control private directive to the objects in Amazon S3.**:
  → Cache-Control private ngăn không cho cache tại shared caches (như CloudFront), trái ngược với yêu cầu muốn caching.

- **Create an AWS Lambda@Edge function to add an Expires header to HTTP responses.**:
  → Lambda@Edge phức tạp và không cần thiết khi có thể dùng CloudFront TTL và Cache-Control headers đơn giản hơn.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Static website + performance" → CloudFront caching
- "Stale content + deployment" → CloudFront invalidation
- "TTL control" → Cache-Control max-age headers
- CloudFront Caching Strategy:
- TTL ngắn (vài phút) cho nội dung thay đổi thường xuyên
- TTL dài (24h) + invalidation cho nội dung ít thay đổi
- Best Practice cho Static Website:
- Dùng Cache-Control max-age dài để tối ưu bandwidth
- Kết hợp CloudFront invalidation khi deployment để đảm bảo fresh content
- Tránh TTL = 0 vì mất lợi ích caching

#### 📚 Tài liệu tham khảo chính thức (Official References):
- CloudFront Expiration Individual Objects
- Controlling how long Amazon S3 content is cached by Amazon CloudFront

</details>

---

<div id="question-10"></div>

### Question 10: Share an Amazon QuickSight dashboard that includes the requested table visual
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company that uses AWS Organizations runs 150 applications across 30 different AWS accounts. The company used AWS Cost and Usage Report to create a new report in the management account. The report is delivered to an Amazon S3 bucket that is replicated to a bucket in the data collection account.

The company’s senior leadership wants to view a custom dashboard that provides NAT gateway costs each day starting at the beginning of the current month.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Share an Amazon QuickSight dashboard that includes the requested table visual. Configure QuickSight to use AWS DataSync to query the new report.
- **(B)** Share an Amazon CloudWatch dashboard that includes the requested table visual. Configure CloudWatch to use Amazon Athena to query the new report.
- **(C)** Share an Amazon QuickSight dashboard that includes the requested table visual. Configure QuickSight to use Amazon Athena to query the new report. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Share an Amazon CloudWatch dashboard that includes the requested table visual. Configure CloudWatch to use AWS DataSync to query the new report.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có 150 ứng dụng trên 30 AWS accounts, sử dụng AWS Organizations
> - Đã tạo AWS Cost and Usage Report trong management account
> - Report được gửi tới S3 bucket và replicate sang data collection account
> - Yêu cầu: tạo custom dashboard hiển thị NAT gateway costs hàng ngày từ đầu tháng hiện tại

**Phân tích giải pháp tối ưu:**
Share an Amazon QuickSight dashboard that includes the requested table visual. Configure QuickSight to use Amazon Athena to query the new report.

→ Đây là giải pháp tối ưu vì:

QuickSight là dịch vụ BI chuyên dụng cho việc tạo dashboard và visualization từ dữ liệu cost

Athena là công cụ phù hợp nhất để query Cost and Usage Report (định dạng CSV/Parquet) trực tiếp từ S3

QuickSight + Athena là pattern chuẩn của AWS cho cost analytics và reporting

Có thể share dashboard dễ dàng cho senior leadership

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Share an Amazon QuickSight dashboard that includes the requested table visual. Configure QuickSight to use AWS DataSync to query the new report.**:
  → Sai vì DataSync là dịch vụ đồng bộ dữ liệu, không phải query engine. DataSync không thể query Cost and Usage Report.

- **(D) Share an Amazon CloudWatch dashboard that includes the requested table visual. Configure CloudWatch to use AWS DataSync to query the new report.**:
  → Sai vì CloudWatch dashboard chủ yếu cho monitoring metrics/logs, không phù hợp cho custom cost analysis phức tạp. DataSync cũng không thể query data.

- **(B) Share an Amazon CloudWatch dashboard that includes the requested table visual. Configure CloudWatch to use Amazon Athena to query the new report.**:
  → Sai vì CloudWatch không thể integrate với Athena để query external data sources như Cost and Usage Report trong S3.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-11"></div>

### Question 11: Update the application to send the purchase requests to an Amazon Simple Queue Ser...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C), (D) | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A company runs an ecommerce application on AWS. Amazon EC2 instances process purchases and store the purchase details in an Amazon Aurora PostgreSQL DB cluster.

Customers are experiencing application timeouts during times of peak usage. A solutions architect needs to rearchitect the application so that the application can scale to meet peak usage demands.

Which combination of actions will meet these requirements MOST cost-effectively? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an Auto Scaling group of new EC2 instances to retry the purchases until the processing is complete. Update the applications to connect to the DB cluster by using Amazon RDS Proxy.
- **(B)** Configure an AWS Lambda function to retry the ticket purchases until the processing is complete.
- **(C)** Configure the application to use an Amazon ElastiCache cluster in front of the Aurora PostgreSQL DB cluster. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Update the application to send the purchase requests to an Amazon Simple Queue Service (Amazon SQS) queue. Configure an Auto Scaling group of new EC2 instances that read from the SQS queue. `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Configure an Amazon AP! Gateway REST API with a usage plan.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng ecommerce chạy trên EC2 instances xử lý mua hàng
> - Lưu trữ trong Aurora PostgreSQL DB cluster
> - Khách hàng gặp application timeouts trong peak usage
> - Cần rearchitect để scale đáp ứng peak demand
> - Yêu cầu: MOST cost-effectively và chọn 2 đáp án

**Phân tích giải pháp tối ưu:**
Configure the application to use an Amazon ElastiCache cluster in front of the Aurora PostgreSQL DB cluster.

ElastiCache caching layer giảm tải cho database bằng cách lưu trữ dữ liệu thường xuyên truy cập trong memory. Điều này giúp giảm response time và số lượng queries đến Aurora, giải quyết timeout issues một cách cost-effective.

Update the application to send the purchase requests to an Amazon Simple Queue Service (Amazon SQS) queue. Configure an Auto Scaling group of new EC2 instances that read from the SQS queue.

SQS decoupling architecture cho phép xử lý asynchronous, tránh overload hệ thống trong peak time. Auto Scaling group chỉ scale khi cần thiết, tối ưu chi phí và đảm bảo không bị timeout do traffic surge.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Đáp án 1: Configure an Auto Scaling group of new EC2 instances to retry the purchases until the processing is complete. Update the applications to connect to the DB cluster by using Amazon RDS Proxy.**:
  → Mặc dù RDS Proxy tốt cho connection pooling, nhưng retry logic có thể làm tình hình tệ hơn khi hệ thống đã quá tải. Không giải quyết căn bản vấn đề database bottleneck.

- **(B) Đáp án 4: Configure an AWS Lambda function to retry the ticket purchases until the processing is complete.**:
  → Lambda retry không giải quyết root cause của timeout. Thậm chí có thể tạo thêm load cho database khi retry liên tục, làm timeout tệ hơn.

- **Đáp án 5: Configure an Amazon API Gateway REST API with a usage plan.**:
  → API Gateway với usage plan chỉ throttling/giới hạn requests, không giúp scale để handle peak demand. Thực tế còn có thể từ chối requests hợp lệ của khách hàng.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-12"></div>

### Question 12: AWS WAF
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company uses Amazon API Gateway to manage its REST APIs that third-party service providers access. The company must protect the REST APIs from SQL injection and cross-site scripting attacks.

What is the MOST operationally efficient solution that meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up API Gateway with an Amazon CloudFront distribution. Configure AWS WAF in CloudFront.
- **(B)** Set up API Gateway with an Amazon CloudFront distribution. Configure AWS Shield in CloudFront.
- **(C)** Configure AWS Shield.
- **(D)** Configure AWS WAF. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng API Gateway để quản lý REST APIs
> - Third-party service providers truy cập APIs
> - Cần bảo vệ khỏi SQL injection và cross-site scripting (XSS) attacks
> - Yêu cầu giải pháp most operationally efficient

**Phân tích giải pháp tối ưu:**
Configure AWS WAF.

AWS WAF được thiết kế chuyên biệt để bảo vệ web applications khỏi các cuộc tấn công layer 7 như SQL injection và XSS.

WAF có thể tích hợp trực tiếp với API Gateway mà không cần thêm infrastructure phức tạp.

Đây là giải pháp đơn giản nhất và hiệu quả nhất cho yêu cầu bảo mật cụ thể này.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure AWS Shield.**:
  → AWS Shield chỉ bảo vệ chống DDoS attacks (layer 3/4), không có khả năng phát hiện và chặn SQL injection hay XSS attacks ở application layer.

- **(B) Set up API Gateway with an Amazon CloudFront distribution. Configure AWS Shield in CloudFront.**:
  → Tương tự trên, Shield chỉ chống DDoS, không giải quyết được SQL injection/XSS. Thêm CloudFront làm tăng complexity không cần thiết.

- **(A) Set up API Gateway with an Amazon CloudFront distribution. Configure AWS WAF in CloudFront.**:
  → Mặc dù WAF có thể hoạt động với CloudFront, nhưng việc thêm CloudFront distribution làm tăng operational overhead và chi phí mà không mang lại lợi ích gì thêm cho use case này.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SQL injection + XSS" → AWS WAF (Web Application Firewall)
- "DDoS attacks" → AWS Shield
- "Layer 7 attacks" → WAF
- "Layer 3/4 attacks" → Shield

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon API Gateway adds support for AWS WAF

</details>

---

<div id="question-13"></div>

### Question 13: An Amazon API Gateway endpoint that returns the contact form from an AWS Lambda fu...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company uses Amazon S3 to host its static website. The company wants to add a contact form to the webpage. The contact form will have dynamic server-side components for users to input their name, email address, phone number, and user message.

The company expects fewer than 100 site visits each month. The contact form must notify the company by email when a customer fills out the form.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Host the website by using AWS Amplify Hosting for static content and dynamic content. Use server-side scripting to build the contact form. Configure Amazon Simple Queue Service (Amazon SQS) to deliver the message to the company.
- **(B)** Host the dynamic contact form in Amazon Elastic Container Service (Amazon ECS). Set up Amazon Simple Email Service (Amazon SES) to connect to a third-party email provider.
- **(C)** Migrate the website from Amazon S3 to Amazon EC2 instances that run Windows Server. Use Internet Information Services (IIS) for Windows Server to host the webpage. Use client-side scripting to build the contact form. Integrate the form with Amazon WorkMail.
- **(D)** Create an Amazon API Gateway endpoint that returns the contact form from an AWS Lambda function. Configure another Lambda function on the API Gateway to publish a message to an Amazon Simple Notification Service (Amazon SNS) topic. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng S3 để host static website
> - Muốn thêm contact form với dynamic server-side components
> - Form có các field: name, email, phone, message
> - Expect fewer than 100 site visits each month (low traffic)
> - Cần email notification khi customer điền form
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Create an Amazon API Gateway endpoint that returns the contact form from an AWS Lambda function. Configure another Lambda function on the API Gateway to publish a message to an Amazon Simple Notification Service (Amazon SNS) topic.

Serverless architecture phù hợp với low traffic (< 100 visits/month)

Lambda chỉ charge khi có request, rất cost-effective cho use case ít traffic

API Gateway + Lambda có thể handle dynamic form processing

SNS có thể gửi email notification trực tiếp hoặc integrate với SES

Không cần maintain server infrastructure

Kiến trúc theo đáp án:



Trong thực tế có thể sử dụng kiến trúc tham khảo sau:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Host the dynamic contact form in Amazon Elastic Container Service (Amazon ECS). Set up Amazon Simple Email Service (Amazon SES) to connect to a third-party email provider.**:
  → ECS cần chạy containers 24/7, tốn chi phí cao cho low traffic. Over-engineering cho 100 visits/month.

- **Host the website by using AWS Amplify Hosting for static content and dynamic content. Use server-side scripting to build the contact form. Configure Amazon Simple Queue Service (Amazon SQS) to deliver the message to the company.**:
  → SQS không thể gửi email trực tiếp, cần thêm components. Amplify hosting có chi phí cao hơn S3 cho static content.

- **(C) Migrate the website from Amazon S3 to Amazon EC2 instances that run Windows Server. Use Internet Information Services (IIS) for Windows Server to host the webpage. Use client-side scripting to build the contact form. Integrate the form with Amazon WorkMail.**:
  → EC2 + Windows Server rất expensive cho low traffic. Client-side scripting không secure cho form processing. WorkMail cần licensing cost.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Low traffic" + "cost-effective" → Serverless (Lambda + API Gateway)
- "< 100 requests/month" → Lambda Free Tier covers this
- "Email notification" → SNS (có thể gửi email) hoặc SES
- "Static website + dynamic form" → Keep static on S3, add serverless backend
- Avoid always-on services (ECS, EC2) cho low traffic scenarios

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [dev.to/yash_sonawane25/build-a-serverless-contact-form-with-lambda-api-gateway-ses-22on](https://dev.to/yash_sonawane25/build-a-serverless-contact-form-with-lambda-api-gateway-ses-22on)
- 🌐 [coady.tech/aws-serverless-contact-form](https://coady.tech/aws-serverless-contact-form/)
- 🌐 [medium.com/@oceansindhu200/building-a-serverless-contact-form-using-aws-lambda-react-api-gateway-and-sns-a49bd3cf87f6](https://medium.com/@oceansindhu200/building-a-serverless-contact-form-using-aws-lambda-react-api-gateway-and-sns-a49bd3cf87f6)

</details>

---

<div id="question-14"></div>

### Question 14: A Network Load Balancer in front of the EC2 instances and an Auto Scaling group fo...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A), (E)

#### 📋 Đề bài (Scenario)
A company hosts an application on Amazon EC2 instances that run in a single Availability Zone. The application is accessible by using the transport layer of the Open Systems Interconnection (OSI) model. The company needs the application architecture to have high availability.

Which combination of steps will meet these requirements MOST cost-effectively? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Auto Scaling group for the EC2 instances. Configure the Auto Scaling group to use multiple Availability Zones. Configure the Auto Scaling group to run application health checks on the instances. `[Đáp án đúng ✅]`
- **(B)** Create an Amazon CloudWatch alarm. Configure the alarm to restart EC2 instances that transition to a stopped state.
- **(C)** Configure a Network Load Balancer for TCP traffic to the instances. Configure an Application Load Balancer for HTTP and HTTPS traffic to the instances.
- **(D)** Configure new EC2 instances in a different Availability Zone. Use Amazon Route 53 to route traffic to all instances.
- **(E)** Configure a Network Load Balancer in front of the EC2 instances. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên EC2 instances trong single AZ
> - Application accessible qua transport layer của OSI model (Layer 4 - TCP/UDP)
> - Cần high availability architecture
> - Yêu cầu MOST cost-effectively
> - Chọn 2 đáp án

**Phân tích giải pháp tối ưu:**
Configure a Network Load Balancer in front of the EC2 instances.

Transport layer (Layer 4) → cần Network Load Balancer để handle TCP/UDP traffic

NLB cung cấp high availability và distribute traffic across instances

Cost-effective vì chỉ cần 1 load balancer cho cả architecture

Create an Auto Scaling group for the EC2 instances. Configure the Auto Scaling group to use multiple Availability Zones. Configure the Auto Scaling group to run application health checks on the instances.

Auto Scaling group with multiple AZs đảm bảo high availability

Tự động replace unhealthy instances

Application health checks đảm bảo only healthy instances receive traffic

Cost-effective vì chỉ chạy instances khi cần thiết

Kiến trúc:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure new EC2 instances in a different Availability Zone. Use Amazon Route 53 to route traffic to all instances.**:
  → Route 53 DNS routing không phù hợp cho transport layer traffic. Route 53 chủ yếu cho web applications (HTTP/HTTPS), không tối ưu cho TCP/UDP.

- **Configure a Network Load Balancer for TCP traffic to the instances. Configure an Application Load Balancer for HTTP and HTTPS traffic to the instances.**:
  → Redundant (dư thừa) và expensive. Application chỉ cần 1 type load balancer. Nếu là transport layer thì chỉ cần NLB, không cần ALB.

- **Create an Amazon CloudWatch alarm. Configure the alarm to restart EC2 instances that transition to a stopped state.**:
  → CloudWatch alarm chỉ restart instances, không giải quyết single AZ problem. Không tạo true high availability architecture.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Transport layer OSI" → Layer 4 → TCP/UDP → Network Load Balancer
- "Single AZ" + "High Availability" → Multi-AZ deployment + Auto Scaling
- "Cost-effectively" + "High Availability" → Auto Scaling (pay for what you use) + Load Balancer
- Layer 4 traffic → NLB, không phải ALB (Layer 7)
- High Availability pattern: Multi-AZ + Auto Scaling + Load Balancer

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)

</details>

---

<div id="question-15"></div>

### Question 15: An S3 gateway endpoint to access the S3 buckets
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs an application on Amazon EC2 instances in a private subnet. The application needs to store and retrieve data in Amazon S3 buckets. According to regulatory requirements, the data must not travel across the public internet.

What should a solutions architect do to meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy a NAT gateway to access the S3 buckets.
- **(B)** Deploy an S3 interface endpoint to access the S3 buckets.
- **(C)** Deploy an S3 gateway endpoint to access the S3 buckets. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Deploy AWS Storage Gateway to access the S3 buckets.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên EC2 instances trong private subnet
> - Cần store và retrieve data trong S3 buckets
> - Regulatory requirements: data must not travel across public internet
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Deploy an S3 gateway endpoint to access the S3 buckets.

S3 Gateway Endpoint cho phép private access tới S3 mà không qua public internet

Completely free - không tính phí cho Gateway Endpoint

Traffic routing thông qua AWS backbone network, không qua internet

Đảm bảo regulatory compliance về data privacy

Simplest và most cost-effective solution cho S3 access

2 loại endpoint của S3:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy a NAT gateway to access the S3 buckets.**:
  → NAT Gateway vẫn route traffic qua public internet để reach S3, vi phạm regulatory requirements. Ngoài ra NAT Gateway có cost cao ($45+/month).

- **Deploy AWS Storage Gateway to access the S3 buckets.**:
  → Storage Gateway là hybrid cloud storage service, không phù hợp cho direct S3 access từ EC2. Over-engineering và expensive cho use case này.

- **Deploy an S3 interface endpoint to access the S3 buckets.**:
  → S3 Interface Endpoint (VPC Endpoint) hoạt động được nhưng có cost ($7.20+/month per endpoint). Gateway Endpoint free và đủ đáp ứng requirements.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Private subnet" + "S3 access" + "not public internet" → VPC Endpoints
- "Cost-effectively" + "S3" → Gateway Endpoint (free) thay vì Interface Endpoint (paid)
- S3 Gateway Endpoint: Free, chỉ support S3 và DynamoDB
- S3 Interface Endpoint: Paid, support nhiều services hơn
- Regulatory compliance + private → VPC Endpoints, không phải NAT Gateway
- NAT Gateway = public internet routing → vi phạm compliance requirements

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Gateway endpoints for Amazon S3
- Choosing Your VPC Endpoint Strategy for Amazon S3

</details>

---

<div id="question-16"></div>

### Question 16: An Auto Scaling group and an ELB in the DR Region
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company hosts its application in the AWS Cloud. The application runs on Amazon EC2 instances in an Auto Scaling group behind an Elastic Load Balancing (ELB) load balancer. The application connects to an Amazon DynamoDB table.

For disaster recovery (DR) purposes, the company wants to ensure that the application is available from another AWS Region with minimal downtime.

Which solution will meet these requirements with the LEAST downtime?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Auto Scaling group and an ELB in the DR Region. Configure the DynamoDB table as a global table. Configure DNS failover to point to the new DR Region's ELB.
- **(B)** Create an AWS CloudFormation template to create EC2 instances and an ELB to be launched when necessary. Configure the DynamoDB table as a global table. Configure DNS failover to point to the new DR Region's ELB.
- **(C)** Create an Auto Scaling group and an ELB in the DR Region. Configure the DynamoDB table as a global table. Create an Amazon CloudWatch alarm with an evaluation period of 10 minutes to invoke an AWS Lambda function that updates Amazon Route 53 to point to the DR Region's ELB. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an AWS CloudFormation template to create EC2 instances, ELBs, and DynamoDB tables to be launched when necessary. Configure DNS failover to point to the new DR Region's ELB.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên EC2 trong Auto Scaling group + ELB
> - Connect tới Amazon DynamoDB table
> - Cần disaster recovery (DR) từ another AWS Region
> - Yêu cầu minimal downtime (LEAST downtime)

**Phân tích giải pháp tối ưu:**
Create an Auto Scaling group and an ELB in the DR Region. Configure the DynamoDB table as a global table. Configure DNS failover to point to the new DR Region's ELB.

Pre-deployed infrastructure trong DR region → fastest failover

Auto Scaling group + ELB đã sẵn sàng, chỉ cần activate

DynamoDB Global Tables đảm bảo data replication real-time cross-region

DNS failover automatic và fast switching (seconds to minutes)

Minimal downtime vì không cần launch resources during disaster

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS CloudFormation template to create EC2 instances, ELBs, and DynamoDB tables to be launched when necessary. Configure DNS failover to point to the new DR Region's ELB.**:
  → CloudFormation deployment mất nhiều thời gian (10-30 minutes). Creating DynamoDB table từ scratch sẽ mất data. Không đảm bảo minimal downtime.

- **Create an AWS CloudFormation template to create EC2 instances and an ELB to be launched when necessary. Configure the DynamoDB table as a global table. Configure DNS failover to point to the new DR Region's ELB.**:
  → Mặc dù có Global Table, nhưng vẫn phải launch EC2 + ELB khi disaster xảy ra, gây downtime significant.

- **Create an Auto Scaling group and an ELB in the DR Region. Configure the DynamoDB table as a global table. Create an Amazon CloudWatch alarm with an evaluation period of 10 minutes to invoke an AWS Lambda function that updates Amazon Route 53 to point to the DR Region's ELB.**:
  → CloudWatch alarm với 10 minutes evaluation period quá chậm. DNS failover tự động nhanh hơn manual Lambda trigger.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "LEAST downtime" + "DR" → Pre-deployed infrastructure (Warm Standby)
- "Minimal downtime" → Avoid CloudFormation deployment during disaster
- DynamoDB cross-region → Global Tables (automatic replication)
- Fastest DNS switching → Route 53 Health Checks + DNS Failover
- DR Strategy tiers: Cold < Warm < Hot standby (warm = pre-deployed but scaled down)
- Auto Scaling có thể start với min capacity = 0, scale up khi needed

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Global tables - multi-active, multi-Region replication
- Configuring DNS failover

</details>

---

<div id="question-17"></div>

### Question 17: AWS Systems Manager Patch Manager to manage all the EC2 instances
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has migrated a fleet of hundreds of on-premises virtual machines (VMs) to Amazon EC2 instances. The instances run a diverse fleet of Windows Server versions along with several Linux distributions. The company wants a solution that will automate inventory and updates of the operating systems. The company also needs a summary of common vulnerabilities of each instance for regular monthly reviews.

What should a solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up Amazon GuardDuty in the account to monitor all EC2 instances. Deploy AWS Config to automate patch installations on the EC2 instances.
- **(B)** Set up AWS Systems Manager Patch Manager to manage all the EC2 instances. Configure AWS Security Hub to produce monthly reports.
- **(C)** Set up AWS Systems Manager Patch Manager to manage all the EC2 instances. Deploy Amazon Inspector, and configure monthly reports. `[Đáp án đúng ✅]`
- **(D)** Set up AWS Shield Advanced, and configure monthly reports. Deploy AWS Config to automate patch installations on the EC2 instances.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Đã migrated Hundreds of EC2 instances (từ on-premises VMs)
> - Mixed OS: Windows Server + Linux distributions
> - Cần tự động hóa inventory và update operating systems
> - Cần báo cáo monthly về common vulnerabilities của từng instance

**Phân tích giải pháp tối ưu:**
Set up AWS Systems Manager Patch Manager to manage all the EC2 instances. Deploy Amazon Inspector, and configure monthly reports.

Systems Manager Patch Manager được thiết kế chuyên biệt để automate OS patching và inventory management cho cả Windows và Linux

Amazon Inspector chuyên về vulnerability assessment và security findings cho EC2 instances

Inspector có thể generate monthly reports về common vulnerabilities và compliance status

Kết hợp 2 services này đáp ứng đầy đủ requirements: patching automation + vulnerability reporting

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Set up AWS Systems Manager Patch Manager to manage all the EC2 instances. Configure AWS Security Hub to produce monthly reports.**:
  Security Hub là central security dashboard tổng hợp từ nhiều sources, nhưng không chuyên về vulnerability assessment chi tiết như Inspector.
  Security Hub cần input từ các security services khác.

- **(D) Set up AWS Shield Advanced, and configure monthly reports. Deploy AWS Config to automate patch installations on the EC2 instances.**:
  Shield Advanced chỉ bảo vệ DDoS attacks, không liên quan đến OS vulnerabilities.
  Config là compliance monitoring, không có khả năng automate patch installations.

- **(A) Set up Amazon GuardDuty in the account to monitor all EC2 instances. Deploy AWS Config to automate patch installations on the EC2 instances.**:
  GuardDuty detect malicious activities và threats, không assess vulnerabilities.
  Config không thể automate patching - chỉ monitor compliance.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-18"></div>

### Question 18: An organization in AWS Organizations in the management account with the default po...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A development team uses multiple AWS accounts for its development, staging, and production environments. Team members have been launching large Amazon EC2 instances that are underutilized. A solutions architect must prevent large instances from being launched in all accounts.

How can the solutions architect meet this requirement with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Update the IAM policies to deny the launch of large EC2 instances. Apply the policies to all users.
- **(B)** Define a resource in AWS Resource Access Manager that prevents the launch of large EC2 instances.
- **(C)** Create an IAM role in each account that denies the launch of large EC2 instances. Grant the developers IAM group access to the role.
- **(D)** Create an organization in AWS Organizations in the management account with the default policy. Create a service control policy (SCP) that denies the launch of large EC2 instances, and apply it to the AWS accounts. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Development team sử dụng multiple AWS accounts (dev, staging, production)
> - Team members launch large EC2 instances nhưng underutilized (không sử dụng hết)
> - Cần prevent large instances được launch trong all accounts
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an organization in AWS Organizations in the management account with the default policy. Create a service control policy (SCP) that denies the launch of large EC2 instances, and apply it to the AWS accounts.

AWS Organizations với Service Control Policies (SCPs) được thiết kế để manage permissions across multiple accounts

SCP có thể deny specific actions (như launch large instances) ở organization level

Centralized management - chỉ cần config 1 lần, apply cho tất cả accounts

LEAST operational overhead vì không cần update từng account riêng lẻ

Inherit by default - new accounts sẽ tự động có policy này

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Update the IAM policies to deny the launch of large EC2 instances. Apply the policies to all users.**:
  → Phải update IAM policies trong từng account riêng lẻ cho tất cả users. High operational overhead và khó maintain khi có nhiều accounts.

- **Define a resource in AWS Resource Access Manager that prevents the launch of large EC2 instances.**:
  → Resource Access Manager (RAM) dùng để share resources across accounts, không có khả năng prevent/deny actions như launch instances.

- **Create an IAM role in each account that denies the launch of large EC2 instances. Grant the developers IAM group access to the role.**:
  → Phải tạo IAM role trong từng account, rất nhiều operational overhead. Ngoài ra logic này cũng không đúng - role để deny thì không practical.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Multiple AWS accounts" + "centralized control" → AWS Organizations + SCP
- "LEAST operational overhead" + "all accounts" → SCP (1 policy applies to many accounts)
- "Prevent/deny actions across accounts" → Service Control Policies
- AWS RAM = resource sharing, không phải permission control
- SCP = organizational level permissions, IAM = account level permissions
- Organizations pattern: Management account → Create SCP → Apply to OUs/accounts

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Managing AWS Organizations Service Control Policies

</details>

---

<div id="question-19"></div>

### Question 19: Amazon Cognito for authentication
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to restrict access to the content of its web application. The company needs to protect the content by using authorization techniques that are available on AWS. The company also wants to implement a serverless architecture for authorization and authentication that has low login latency.

The solution must integrate with the web application and serve web content globally. The application currently has a small user base, but the company expects the application's user base to increase.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon Cognito for authentication. Implement AWS Lambda for authorization. Use Amazon S3 Transfer Acceleration to serve the web application globally.
- **(B)** Configure AWS Directory Service for Microsoft Active Directory for authentication. Implement Lambda@Edge for authorization. Use AWS Elastic Beanstalk to serve the web application globally.
- **(C)** Configure AWS Directory Service for Microsoft Active Directory for authentication. Implement AWS Lambda for authorization. Use an Application Load Balancer to serve the web application globally.
- **(D)** Configure Amazon Cognito for authentication. Implement Lambda@Edge for authorization. Configure Amazon CloudFront to serve the web application globally. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần restrict access và protect content của web application
> - Yêu cầu authorization techniques available trên AWS
> - Cần serverless architecture cho auth/authz với low login latency
> - Solution phải integrate với web app và serve content globally
> - Small user base hiện tại nhưng expect increase

**Phân tích giải pháp tối ưu:**
Configure Amazon Cognito for authentication. Implement Lambda@Edge for authorization. Configure Amazon CloudFront to serve the web application globally.

Amazon Cognito là serverless authentication service, perfect cho scalable user management

Lambda@Edge chạy tại CloudFront edge locations → low latency authorization

CloudFront global CDN → serve content globally với performance tốt

Serverless architecture → auto-scale với user growth, no server management

Integration tốt: Cognito + Lambda@Edge + CloudFront work seamlessly together

Example: High-level architecture of authentication & authorization with Lambda@Edge with Amazon Cognito

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure AWS Directory Service for Microsoft Active Directory for authentication. Implement AWS Lambda for authorization. Use an Application Load Balancer to serve the web application globally.**:
  → Directory Service không phải serverless (cần manage directory infrastructure). ALB không serve globally như CloudFront. Lambda thường (không phải @Edge) có latency cao hơn.

- **Configure Amazon Cognito for authentication. Implement AWS Lambda for authorization. Use Amazon S3 Transfer Acceleration to serve the web application globally.**:
  → S3 Transfer Acceleration chỉ tăng tốc upload, không serve web applications. Lambda thường không tối ưu cho low latency authorization.

- **Configure AWS Directory Service for Microsoft Active Directory for authentication. Implement Lambda@Edge for authorization. Use AWS Elastic Beanstalk to serve the web application globally.**:
  → Directory Service không serverless. Elastic Beanstalk không serve globally, chỉ deploy trong specific regions.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Serverless auth/authz" → Amazon Cognito + Lambda@Edge
- "Low login latency" → Lambda@Edge (runs at edge locations)
- "Serve globally" → CloudFront CDN
- "Scalable user base" → Cognito scales automatically
- Directory Service = managed AD, không phải serverless
- Transfer Acceleration = faster uploads, không phải web serving
- Lambda@Edge = low latency, regular Lambda = higher latency

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Step-by-Step Guide: Setting Up Lambda@Edge for Authentication & Authorization with Amazon Cognito

</details>

---

<div id="question-20"></div>

### Question 20: An IAM role in the Production account
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company has two AWS accounts: Production and Development. The company needs to push code changes in the Development account to the Production account. In the alpha phase, only two senior developers on the development team need access to the Production account. In the beta phase, more developers will need access to perform testing.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an IAM role in the Production account. Define a trust policy that specifies the Development account. Allow developers to assume the role. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create two policy documents by using the AWS Management Console in each account. Assign the policy to developers who need access.
- **(C)** Create an IAM role in the Development account. Grant the IAM role access to the Production account. Allow developers to assume the role.
- **(D)** Create an IAM group in the Production account. Add the group as a principal in a trust policy that specifies the Production account. Add developers to the group.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Two AWS accounts: Production và Development
> - Cần push code changes từ Development account tới Production account
> - Alpha phase: chỉ 2 senior developers cần access Production
> - Beta phase: more developers sẽ cần access để testing
> - Cần solution scale được theo phases

**Phân tích giải pháp tối ưu:**
Create an IAM role in the Production account. Define a trust policy that specifies the Development account. Allow developers to assume the role.

Cross-account role là best practice cho access giữa multiple AWS accounts

IAM role trong Production account đảm bảo Production account control permissions

Trust policy specify Development account cho phép users từ Development assume role

Scalable: có thể add/remove developers dễ dàng bằng cách modify trust policy hoặc group membership

Security: temporary credentials thay vì permanent access keys



🔧 Setup Phase:

Create IAM Role "ProdDeployRole" in Production Account (222222222222)

Define Trust Policy allowing Development Account (111111111111) to assume role

Attach permissions policies to role (EC2, S3, Lambda deployment permissions)

Create IAM Group "ProdAccess" in Development Account with AssumeRole permission

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create two policy documents by using the AWS Management Console in each account. Assign the policy to developers who need access.**:
  → Không rõ ràng về cross-account access mechanism. Policy documents alone không giải quyết được cross-account authentication.

- **Create an IAM role in the Development account. Grant the IAM role access to the Production account. Allow developers to assume the role.**:
  → Sai direction. Role nên tạo trong Production account để Production control access permissions, không phải Development account control Production.

- **Create an IAM group in the Production account. Add the group as a principal in a trust policy that specifies the Production account. Add developers to the group.**:
  → Developers không thể directly join group trong Production account khi họ là users của Development account. Trust policy specify Production account cũng sai logic.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Cross-account access" → IAM Role với Trust Policy
- "Production account control" → Role tạo trong Production account
- "Development account users" → Trust policy specify Development account
- Cross-account pattern: Role in target account + Trust policy specify source account
- Best practice: Production account always controls who can access Production resources
- Scalability: Role-based access dễ manage hơn individual user permissions

#### 📚 Tài liệu tham khảo chính thức (Official References):
- IAM tutorial: Delegate access across AWS accounts using IAM roles

</details>

---

<div id="question-21"></div>

### Question 21: An Amazon Simple Queue Service (Amazon SQS) FIFO queue
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company wants to enhance its ecommerce order-processing application that is deployed on AWS. The application must process each order exactly once without affecting the customer experience during unpredictable traffic surges.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure AWS X-Ray in the application to track the order requests. Configure the application to process the orders by pulling the orders from Amazon CloudWatch.
- **(B)** Create an Amazon Simple Queue Service (Amazon SQS) FIFO queue. Put all the orders in the SQS queue. Configure an AWS Lambda function as the target to process the orders. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a flow by using Amazon AppFlow. Send the orders to the flow. Configure an AWS Lambda function as the target to process the orders.
- **(D)** Create an Amazon Simple Notification Service (Amazon SNS) standard topic. Publish all the orders to the SNS standard topic. Configure the application as a notification target.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng xử lý đơn hàng ecommerce triển khai trên AWS
> - Cần xử lý each order exactly once (mỗi đơn hàng đúng một lần)
> - Không ảnh hưởng customer experience khi có unpredictable traffic surges
> - Cần solution xử lý được traffic spikes một cách mượt mà

**Phân tích giải pháp tối ưu:**
Create an Amazon Simple Queue Service (Amazon SQS) FIFO queue. Put all the orders in the SQS queue. Configure an AWS Lambda function as the target to process the orders.

SQS FIFO queue đảm bảo exactly-once processing với tính năng deduplication tích hợp sẵn

Decoupling architecture - queue hấp thụ traffic surges, bảo vệ quá trình processing phía sau

Lambda auto-scaling xử lý workloads thay đổi mà không ảnh hưởng customer experience

Reliable message delivery với visibility timeout và dead letter queue support

Order preservation với FIFO guarantee nếu cần duy trì thứ tự đơn hàng

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon Simple Notification Service (Amazon SNS) standard topic. Publish all the orders to the SNS standard topic. Configure the application as a notification target.**:
  SNS standard topic có thể deliver messages nhiều lần, không đảm bảo exactly-once processing.
  SNS là push-based, không có built-in retry/dead letter queue mechanism.

- **Create a flow by using Amazon AppFlow. Send the orders to the flow. Configure an AWS Lambda function as the target to process the orders.**:
  AppFlow chủ yếu cho data integration giữa SaaS applications và AWS services, không phù hợp cho real-time order processing.
  Không có exactly-once guarantee.

- **Configure AWS X-Ray in the application to track the order requests. Configure the application to process the orders by pulling the orders from Amazon CloudWatch.**:
  X-Ray là tracing service, CloudWatch là monitoring service - không phải message processing solutions.
  Không giải quyết exactly-once processing hay traffic surge handling.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Exactly once processing" → SQS FIFO với deduplication
- "Traffic surges" + "customer experience" → Queue-based decoupling
- "Order processing" → SQS + Lambda pattern
- FIFO vs Standard SQS: FIFO = exactly-once + ordering, Standard = at-least-once
- SNS = pub/sub notification, SQS = reliable message processing
- AppFlow = data integration, không phải real-time processing

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Benefits of using Amazon SQS
- Amazon SQS FIFO queue and Lambda concurrency behavior

</details>

---

<div id="question-22"></div>

### Question 22: An AWS Glue crawler to create a table based on the data that is in Amazon S3 and a...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A), (D), (E)

#### 📋 Đề bài (Scenario)
A research company uses on-premises devices to generate data for analysis. The company wants to use the AWS Cloud to analyze the data. The devices generate .csv files and support writing the data to an SMB file share. Company analysts must be able to use SQL commands to query the data. The analysts will run queries periodically throughout the day.

Which combination of steps will meet these requirements MOST cost-effectively? (Choose three.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Setup Amazon Athena to query the data that is in Amazon S3. Provide access to analysts. `[Đáp án đúng ✅]`
- **(B)** Set up an Amazon Redshift cluster to query the data that is in Amazon S3. Provide access to analysts.
- **(C)** Deploy an AWS Storage Gateway on premises in Amazon FSx File Gateway made.
- **(D)** Set up an AWS Glue crawler to create a table based on the data that is in Amazon S3. `[Đáp án đúng ✅]`
- **(E)** Deploy an AWS Storage Gateway on premises in Amazon S3 File Gateway mode. `[Đáp án đúng ✅]`
- **(F)** Set up an Amazon EMR cluster with EMR File System (EMRFS) to query the data that is in Amazon S3. Provide access to analysts.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - On-premises devices tạo data để phân tích
> - Devices tạo .csv files và support SMB file share
> - Company analysts cần dùng SQL commands để query data
> - Analysts chạy queries periodically trong ngày
> - Yêu cầu MOST cost-effectively (chọn 3 đáp án)

**Phân tích giải pháp tối ưu:**
Deploy an AWS Storage Gateway on premises in Amazon S3 File Gateway mode.

S3 File Gateway cung cấp SMB interface để devices có thể write data trực tiếp

Data được store trong S3 với cost-effective storage pricing

Seamless integration giữa on-premises SMB và S3

Set up an AWS Glue crawler to create a table based on the data that is in Amazon S3.

Glue crawler tự động discover schema của .csv files trong S3

Tạo metadata tables cho data catalog

Enable SQL querying capabilities cho downstream services

Setup Amazon Athena to query the data that is in Amazon S3. Provide access to analysts.

Athena là serverless SQL query service, chỉ pay per query

Cost-effective cho periodic queries thay vì always-on cluster

Analysts có thể dùng standard SQL commands để query data

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an AWS Storage Gateway on premises in Amazon FSx File Gateway mode.**:
  → FSx File Gateway dành cho high-performance workloads, expensive hơn S3 File Gateway cho use case này.

- **(F) Set up an Amazon EMR cluster with EMR File System (EMRFS) to query the data that is in Amazon S3. Provide access to analysts.**:
  → EMR cluster phải chạy continuously (liên tục), cost cao cho periodic queries (định kỳ). Over-engineering cho simple SQL queries.

- **(B) Set up an Amazon Redshift cluster to query the data that is in Amazon S3. Provide access to analysts.**:
  → Redshift cluster cần provision và chạy 24/7, expensive cho periodic analytical queries. Athena cost-effective hơn.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SMB file share" → S3 File Gateway (NFS/SMB interface)
- "Periodic queries" + "cost-effective" → Athena (pay per query)
- ".csv files" + "SQL queries" → Glue crawler + Athena
- Always-on clusters (EMR, Redshift) expensive cho periodic workloads
- Serverless analytics (Athena) cost-effective cho intermittent usage
- S3 File Gateway cheaper than FSx File Gateway cho simple file storage

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is Amazon S3 File Gateway
- Using crawlers to populate the Data Catalog

</details>

---

<div id="question-23"></div>

### Question 23: AWS Compute Optimizer to generate EBS volume recommendations for optimization
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs its production workload on Amazon EC2 instances with Amazon Elastic Block Store (Amazon EBS) volumes. A solutions architect needs to analyze the current EBS volume cost and to recommend optimizations. The recommendations need to include estimated monthly saving opportunities.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Compute Optimizer to generate EBS volume recommendations for optimization. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon Inspector reporting to generate EBS volume recommendations for optimization.
- **(C)** Use AWS Systems Manager reporting to determine EBS volume recommendations for optimization.
- **(D)** Use Amazon CloudWatch metrics reporting to determine EBS volume recommendations for optimization.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy production workload trên EC2 instances với EBS volumes
> - Solutions architect cần analyze current EBS volume cost
> - Cần recommend optimizations với estimated monthly saving opportunities
> - Yêu cầu solution cung cấp cost optimization recommendations

**Phân tích giải pháp tối ưu:**
Use AWS Compute Optimizer to generate EBS volume recommendations for optimization.

AWS Compute Optimizer được thiết kế chuyên biệt để analyze và recommend optimizations cho AWS resources bao gồm EBS volumes

Cung cấp detailed cost analysis và estimated monthly savings based trên historical utilization data

Recommend right-sizing cho EBS volumes (volume type, size, IOPS) based trên actual usage patterns

Machine learning-powered recommendations với specific dollar amounts cho potential savings

Cách xem:



Minh hoạ (Ảnh mượn trên internet)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use Amazon Inspector reporting to generate EBS volume recommendations for optimization.**:
  → Amazon Inspector là security assessment service, focus vào vulnerabilities và security findings, không phải cost optimization cho EBS volumes.

- **(C) Use AWS Systems Manager reporting to determine EBS volume recommendations for optimization.**:
  → Systems Manager chủ yếu cho operational management và patching, không có built-in cost optimization recommendations cho EBS volumes.

- **(D) Use Amazon CloudWatch metrics reporting to determine EBS volume recommendations for optimization.**:
  → CloudWatch cung cấp metrics và monitoring data nhưng không automatically generate cost optimization recommendations hay estimated savings. Chỉ là raw data, không phải actionable recommendations.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Cost optimization" + "estimated monthly savings" → AWS Compute Optimizer
- "EBS volume recommendations" → Compute Optimizer covers EBS, EC2, Lambda
- "Right-sizing recommendations" → Compute Optimizer specialty
- Inspector = security assessment, Systems Manager = operational management
- CloudWatch = monitoring data, Compute Optimizer = ML-powered recommendations

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Viewing Amazon EBS volume recommendations

</details>

---

<div id="question-24"></div>

### Question 24: A gateway VPC endpoint for Amazon S3
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs a web application on multiple Amazon EC2 instances in a VPC. The application needs to write sensitive data to an Amazon S3 bucket. The data cannot be sent over the public internet.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a gateway VPC endpoint for Amazon S3. Create a route in the VPC route table to the endpoint. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create an AWS Direct Connect connection between the VPC and an S3 regional endpoint.
- **(C)** Deploy the S3 bucket inside the VPCreate a route in the VPC route table to the bucket.
- **(D)** Create an internal Network Load Balancer that has the S3 bucket as the target.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web application chạy trên multiple EC2 instances trong VPC
> - Application cần write sensitive data to S3 bucket
> - Data cannot be sent over public internet
> - Yêu cầu private connectivity đến S3

**Phân tích giải pháp tối ưu:**
Create a gateway VPC endpoint for Amazon S3. Create a route in the VPC route table to the endpoint.

S3 Gateway VPC Endpoint cho phép private connectivity từ VPC đến S3 mà không qua public internet

Traffic routing hoàn toàn thông qua AWS backbone network

Completely free - không tính phí cho Gateway Endpoint

Tự động update route table để direct S3 traffic qua endpoint

Đảm bảo sensitive data không bao giờ traverse public internet

Architecture diagram

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an internal Network Load Balancer that has the S3 bucket as the target.**:
  → Network Load Balancer không thể có S3 bucket làm target. NLB chỉ support EC2 instances, IP addresses, và Application Load Balancers làm targets.

- **Deploy the S3 bucket inside the VPC. Create a route in the VPC route table to the bucket.**:
  → S3 buckets không thể deploy inside VPC. S3 là global service, buckets exist outside của VPC boundaries. Không thể tạo route table entry đến S3 bucket trực tiếp.

- **Create an AWS Direct Connect connection between the VPC and an S3 regional endpoint.**:
  → Over-engineering và expensive solution. Direct Connect dành cho on-premises connectivity, không cần thiết cho VPC-to-S3 communication. Gateway VPC Endpoint đơn giản và free hơn.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Private connectivity to S3" → VPC Endpoints (Gateway hoặc Interface)
- "Cannot send over public internet" → VPC Endpoint requirement
- "S3 Gateway Endpoint" = free, chỉ support S3 và DynamoDB
- "S3 Interface Endpoint" = paid, support nhiều services

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Gateway endpoints for Amazon S3

</details>

---

<div id="question-25"></div>

### Question 25: The memory optimized instance family for both the application and the database
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company's SAP application has a backend SQL Server database in an on-premises environment. The company wants to migrate its on-premises application and database server to AWS. The company needs an instance type that meets the high demands of its SAP database. On-premises performance data shows that both the SAP application and the database have high memory utilization.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use the compute optimized instance family for the application. Use the memory optimized instance family for the database.
- **(B)** Use the high performance computing (HPC) optimized instance family for the application. Use the memory optimized instance family for the database.
- **(C)** Use the storage optimized instance family for both the application and the database.
- **(D)** Use the memory optimized instance family for both the application and the database. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - SAP application với SQL Server database trong on-premises environment
> - Muốn migrate application và database server lên AWS
> - Cần instance type đáp ứng high demands của SAP database
> - Performance data cho thấy both SAP application và database có high memory utilization

**Phân tích giải pháp tối ưu:**
Use the memory optimized instance family for both the application and the database.

SAP applications nổi tiếng về yêu cầu high memory để cache data và maintain performance

SQL Server database cũng benefit greatly từ large memory cho buffer pools và caching

Performance data confirms cả hai components đều có high memory utilization

Memory optimized instances (R-series, X-series) được thiết kế specifically cho workloads như SAP và in-memory databases

Consistent instance family cho cả app và DB giúp simplified management và cost optimization

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use the compute optimized instance family for the application. Use the memory optimized instance family for the database.**:
  → SAP applications cũng require high memory, không chỉ compute power. Performance data đã confirm high memory usage cho cả application.

- **(C) Use the storage optimized instance family for both the application and the database.**:
  → Storage optimized instances (I-series) focus vào high sequential read/write performance, không address memory requirements mà performance data đã chỉ ra.

- **(B) Use the high performance computing (HPC) optimized instance family for the application. Use the memory optimized instance family for the database.**:
  → HPC optimized instances designed cho scientific computing workloads, không phù hợp cho SAP business applications. SAP cần memory hơn là HPC capabilities.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-26"></div>

### Question 26: An Aurora read replica in the existing Aurora DB cluster
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company that runs its application on AWS uses an Amazon Aurora DB cluster as its database. During peak usage hours when multiple users access and read the data, the monitoring system shows degradation of database performance for the write queries. The company wants to increase the scalability of the application to meet peak usage demands.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon DynamoDB Accelerator (DAX) cluster in front of the existing Aurora DB cluster. Update the application to use the DAX cluster for read-only queries. Write data directly to the Aurora DB cluster.
- **(B)** Create a second Aurora DB cluster. Configure a copy job to replicate the users’ data to the new database. Update the application to use the second database to read the data.
- **(C)** Create an Aurora read replica in the existing Aurora DB cluster. Update the application to use the replica endpoint for read-only queries and to use the cluster endpoint for write queries. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Amazon Redshift cluster. Copy the users' data to the Redshift cluster. Update the application to connect to the Redshift cluster and to perform read-only queries on the Redshift cluster.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application sử dụng Amazon Aurora DB cluster làm database
> - Peak usage hours khi multiple users access và read data
> - Database performance degradation cho write queries during peak times
> - Cần increase scalability để meet peak usage demands
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Create an Aurora read replica in the existing Aurora DB cluster. Update the application to use the replica endpoint for read-only queries and to use the cluster endpoint for write queries.

Aurora Read Replicas được thiết kế specifically để offload read traffic từ primary instance

Cost-effective vì chỉ cần thêm read replica instances, không cần duplicate entire cluster

Built-in Aurora feature với automatic failover và minimal latency

Separation of read/write traffic giải quyết chính xác vấn đề write performance degradation

Easy application update với different endpoints cho read vs write operations

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a second Aurora DB cluster. Configure a copy job to replicate users' data to the new database. Update the application to use the second database to read the data.**:
  → Expensive và complex solution. Duplicate entire cluster cost gấp đôi và cần maintain data synchronization manually. Over-engineering cho read scaling problem.

- **Create an Amazon DynamoDB Accelerator (DAX) cluster in front of the existing Aurora DB cluster. Update the application to use the DAX cluster for read-only queries. Write data directly to the Aurora DB cluster.**:
  → DAX chỉ work với DynamoDB, không compatible với Aurora/MySQL/PostgreSQL. Technical incompatibility.

- **Create an Amazon Redshift cluster. Copy the users' data to the Redshift cluster. Update the application to connect to the Redshift cluster and to perform read-only queries on the Redshift cluster.**:
  → Redshift là data warehouse solution cho analytics, không phù hợp cho operational read queries. Expensive và architectural mismatch.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-27"></div>

### Question 27: Modify the RDS database to have a retention period of 30 days for automated backups
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company uses Amazon RDS with default backup settings for its database tier. The company needs to make a daily backup of the database to meet regulatory requirements. The company must retain the backups for 30 days.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Modify the RDS database to have a retention period of 30 days for automated backups. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use AWS Systems Manager Maintenance Windows to modify the RDS backup retention period.
- **(C)** Create a manual snapshot every day by using the AWS CLI. Modify the RDS backup retention period.
- **(D)** Write an AWS Lambda function to create an RDS snapshot every day.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Amazon RDS với default backup settings
> - Cần daily backup của database để meet regulatory requirements
> - Phải retain backups for 30 days
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Modify the RDS database to have a retention period of 30 days for automated backups.

RDS automated backups đã có sẵn tính năng daily backup automatically

Chỉ cần modify backup retention period từ default (thường 7 days) lên 30 days

Zero operational overhead - RDS tự động handle backup schedule và retention

Built-in feature không cần additional services hay custom scripts

Cost-effective và reliable với automated backup management

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Write an AWS Lambda function to create an RDS snapshot every day.**:
  → Unnecessary operational overhead. Cần viết code, schedule Lambda, monitor executions. RDS đã có automated backup built-in.

- **(B) Use AWS Systems Manager Maintenance Windows to modify the RDS backup retention period.**:
  → Systems Manager Maintenance Windows không cần thiết cho simple backup retention modification. Thêm complexity không cần thiết.

- **Create a manual snapshot every day by using the AWS CLI. Modify the RDS backup retention period.**:
  → Manual snapshots require operational maintenance, scheduling, và monitoring. High overhead compared với automated backups.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Daily backup" + "RDS" → RDS automated backups (đã có sẵn daily)
- "LEAST operational overhead" → Use built-in features, avoid custom solutions
- "Retention period" → Modify RDS backup retention setting
- RDS automated backups default enabled với configurable retention (1-35 days)
- Manual snapshots require operational maintenance và monitoring
- Lambda solutions add complexity khi built-in features đã sufficient

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Managing automated backups

</details>

---

<div id="question-28"></div>

### Question 28: The application to use client-side encryption with a key stored in AWS Key Managem...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs an application in the AWS Cloud that generates sensitive archival data files. The company wants to rearchitect the application's data storage. The company wants to encrypt the data files and to ensure that third parties do not have access to the data before the data is encrypted and sent to AWS. The company has already created an Amazon S3 bucket.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the application to use client-side encryption with a key stored in AWS Key Management Service (AWS KMS). Configure the application to store the archival files in the S3 bucket. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure the S3 bucket to use dual-layer server-side encryption with AWS KMS keys (SSE-KMS). Configure the application to use the S3 bucket to store the archival files.
- **(C)** Configure the S3 bucket to use server-side encryption with AWS KMS keys (SSE-KMS). Configure the application to use the S3 bucket to store the archival files.
- **(D)** Configure the S3 bucket to use client-side encryption with an Amazon S3 managed encryption key. Configure the application to use the S3 bucket to store the archival files.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application tạo sensitive archival data files
> - Muốn encrypt data files và đảm bảo third parties không có access to data before encryption
> - Data phải được encrypted trước khi sent to AWS
> - Đã tạo S3 bucket sẵn

**Phân tích giải pháp tối ưu:**
Configure the application to use client-side encryption with a key stored in AWS Key Management Service (AWS KMS). Configure the application to store the archival files in the S3 bucket.

Client-side encryption đảm bảo data được encrypt trước khi leave application environment

Third parties không có access đến unencrypted data vì encryption happens tại client side

KMS key management provides secure key storage và rotation capabilities

Data encrypted in transit và at rest với complete control over encryption process

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the S3 bucket to use client-side encryption with an Amazon S3 managed encryption key. Configure the application to use the S3 bucket to store the archival files.**:
  → "Client-side encryption with S3 managed key" không chính xác. S3 managed keys dành cho server-side encryption. Client-side encryption cần customer-managed keys.

- **Configure the S3 bucket to use server-side encryption with AWS KMS keys (SSE-KMS). Configure the application to use the S3 bucket to store the archival files.**:
  → Server-side encryption nghĩa là data travel unencrypted đến AWS, sau đó mới được encrypt. Vi phạm requirement về third parties không access data before encryption.

- **Configure the S3 bucket to use dual-layer server-side encryption with AWS KMS keys (SSE-KMS). Configure the application to use the S3 bucket to store the archival files.**:
  → Vẫn là server-side encryption, không giải quyết requirement về encrypting data before sending to AWS.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Third parties không access before encryption" → Client-side encryption
- "Encrypt before sent to AWS" → Client-side encryption required
- Server-side encryption = data encrypted after reaching AWS
- Client-side encryption = data encrypted before leaving customer environment

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Protecting data by using client-side encryption

</details>

---

<div id="question-29"></div>

### Question 29: Provision an Amazon RDS for MySQL DB instance with Provisioned IOPS SSD storage
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company wants to relocate its on-premises MySQL database to AWS. The database accepts regular imports from a client-facing application, which causes a high volume of write operations. The company is concerned that the amount of traffic might be causing performance issues within the application.

How should a solutions architect design the architecture on AWS?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provision an Amazon RDS for MySQL DB instance with General Purpose SSD storage. Place an Amazon ElastiCache cluster in front of the DB instance. Configure the application to query ElastiCache instead.
- **(B)** Provision an Amazon RDS for MySQL DB instance with Provisioned IOPS SSD storage. Monitor write operation metrics by using Amazon CloudWatch. Adjust the provisioned IOPS if necessary. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Provision an Amazon DocumentDB (with MongoDB compatibility) instance with a memory optimized instance type. Monitor Amazon CloudWatch for performance-related issues. Change the instance class if necessary.
- **(D)** Provision an Amazon Elastic File System (Amazon EFS) file system in General Purpose performance mode. Monitor Amazon CloudWatch for IOPS bottlenecks. Change to Provisioned Throughput performance mode if necessary.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Muốn relocate on-premises MySQL database lên AWS
> - Database nhận regular imports từ client-facing application
> - High volume of write operations gây ra performance issues
> - Cần thiết kế architecture để handle write-heavy workload

**Phân tích giải pháp tối ưu:**
Provision an Amazon RDS for MySQL DB instance with Provisioned IOPS SSD storage. Monitor write operation metrics by using Amazon CloudWatch. Adjust the provisioned IOPS if necessary.

Provisioned IOPS SSD storage được thiết kế đặc biệt cho high-performance, write-heavy workloads

Consistent IOPS performance thay vì burstable performance của General Purpose SSD

CloudWatch monitoring cho phép track write performance metrics và optimize accordingly

Adjustable IOPS cho phép fine-tune performance based trên actual workload patterns

Direct solution cho write performance problem được xác định

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Provision an Amazon RDS for MySQL DB instance with General Purpose SSD storage. Place an Amazon ElastiCache cluster in front of the DB instance. Configure the application to query ElastiCache instead.**:
  → ElastiCache giúp read performance, không giải quyết write performance issues. General Purpose SSD có giới hạn burst cho duy trì write workloads.

- **(C) Provision an Amazon DocumentDB (with MongoDB compatibility) instance with a memory optimized instance type. Monitor Amazon CloudWatch for performance-related issues. Change the instance class if necessary.**:
  → DocumentDB không tương thích với MySQL applications. Require significant application rewrite và không address core write performance issue.

- **(D) Provision an Amazon Elastic File System (Amazon EFS) file system in General Purpose performance mode. Monitor Amazon CloudWatch for IOPS bottlenecks. Change to Provisioned Throughput performance mode if necessary.**:
  → EFS là file storage system, không phải database solution. Không thể replace MySQL database functionality.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "High volume write operations" → Provisioned IOPS SSD storage
- "Write performance issues" → Storage performance optimization, không phải caching
- "MySQL database" → RDS for MySQL, không phải DocumentDB
- ElastiCache helps reads, không phải writes
- Provisioned IOPS = consistent performance, General Purpose = burstable performance
- Write-heavy workloads cần dedicated IOPS allocation

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon EBS Provisioned IOPS SSD volumes
- Optimize Amazon RDS performance with io2 Block Express storage for production workloads

</details>

---

<div id="question-30"></div>

### Question 30: A gateway endpoint for Amazon S3 in the VPC
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A solutions architect is creating an application. The application will run on Amazon EC2 instances in private subnets across multiple Availability Zones in a VPC. The EC2 instances will frequently access large files that contain confidential information. These files are stored in Amazon S3 buckets for processing. The solutions architect must optimize the network architecture to minimize data transfer costs.

What should the solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a gateway endpoint for Amazon S3 in the VPC. In the route tables for the private subnets, add an entry for the gateway endpoint. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create an AWS PrivateLink interface endpoint for Amazon S3 in the VPIn the route tables for the private subnets, add an entry for the interface endpoint.
- **(C)** Create a single NAT gateway in a public subnet. In the route tables for the private subnets, add a default route that points to the NAT gateway.
- **(D)** Create one NAT gateway for each Availability Zone in public subnets. In each of the route tables for the private subnets, add a default route that points to the NAT gateway in the same Availability Zone.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên EC2 instances trong private subnets across multiple AZs
> - EC2 instances frequently access large files từ Amazon S3 buckets
> - Files chứa confidential information
> - Cần optimize network architecture để minimize data transfer costs

**Phân tích giải pháp tối ưu:**
Create a gateway endpoint for Amazon S3 in the VPC. In the route tables for the private subnets, add an entry for the gateway endpoint.

S3 Gateway Endpoint completely free - không tính phí data transfer

Traffic routing qua AWS backbone network thay vì public internet

Minimize costs vì không cần NAT Gateway charges cho S3 traffic

Private connectivity đảm bảo confidential data không traverse public internet

Route table entries direct S3 traffic qua gateway endpoint automatically

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a single NAT gateway in a public subnet. In the route tables for the private subnets, add a default route that points to the NAT gateway.**:
  → NAT Gateway có hourly charges + data processing charges. Expensive cho large file transfers. Single NAT gateway cũng tạo single point of failure.

- **Create an AWS PrivateLink interface endpoint for Amazon S3 in the VPC. In the route tables for the private subnets, add an entry for the interface endpoint.**:
  → Interface endpoints có hourly charges và data processing charges. More expensive than free Gateway Endpoint cho S3 access.

- **Create one NAT gateway for each Availability Zone in public subnets. In each of the route tables for the private subnets, add a default route that points to the NAT gateway in the same Availability Zone.**:
  → Multiple NAT Gateways = higher costs (hourly + data processing charges). Không optimal cho cost minimization requirement.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Minimize data transfer costs" + "S3 access" → S3 Gateway Endpoint (free)
- "Large files" + "frequently access" → Avoid NAT Gateway charges
- "Private subnets" + "S3" → VPC Endpoints cho private connectivity
- Gateway Endpoint = free, Interface Endpoint = paid
- NAT Gateway charges = hourly + per GB processed
- S3 Gateway Endpoint chỉ support S3 và DynamoDB

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Gateway endpoints for Amazon S3

</details>

---

<div id="question-31"></div>

### Question 31: Review the Trusted Advisor checks for Amazon RDS Reserved Instance Optimization an...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A company runs several Amazon RDS for Oracle On-Demand DB instances that have high utilization. The RDS DB instances run in member accounts that are in an organization in AWS Organizations.

The company's finance team has access to the organization's management account and member accounts. The finance team wants to find ways to optimize costs by using AWS Trusted Advisor.

Which combination of steps will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Review the Trusted Advisor checks for Amazon RDS Idle DB Instances.
- **(B)** Review the Trusted Advisor checks for Amazon RDS Reserved Instance Optimization. `[Đáp án đúng ✅]`
- **(C)** Use the Trusted Advisor recommendations in the member accounts where the RDS DB instances are running.
- **(D)** Review the Trusted Advisor checks for compute optimization. Crosscheck the results by using AWS Compute Optimizer.
- **(E)** Use the Trusted Advisor recommendations in the management account. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy several RDS for Oracle On-Demand DB instances với high utilization
> - RDS instances chạy trong member accounts của AWS Organizations
> - Finance team có access đến management account và member accounts
> - Muốn optimize costs bằng AWS Trusted Advisor
> - Chọn 2 đáp án

**Phân tích giải pháp tối ưu:**
Use the Trusted Advisor recommendations in the management account.

Organizations management account có consolidated (hợp nhất) view của all member accounts

Centralized cost optimization recommendations across entire organization

Finance team có access và có thể thấy organization-wide recommendations

Better visibility cho cost optimization decisions

Review the Trusted Advisor checks for Amazon RDS Reserved Instance Optimization.

High utilization RDS instances là ứng viên hoàn hảo cho Reserved Instances

RDS RI Optimization recommendations show potential savings từ On-Demand sang Reserved

Significant cost savings (up to 75%) cho predictable, high-utilization workloads

Minh hoạ: (cần phải Upgrade your AWS Support plan to get all Trusted Advisor checks)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use the Trusted Advisor recommendations in the member accounts where the RDS DB instances are running.**:
  → Member account recommendations không provide consolidated view. Finance team cần organization-wide perspective để make optimal decisions.

- **(A) Review the Trusted Advisor checks for Amazon RDS Idle DB Instances.**:
  → Instances có high utilization, không phải idle (nhàn rỗi - không sử dụng). Idle DB instance checks không liên quan cho high-utilization scenarios.

- **(D) Review the Trusted Advisor checks for compute optimization. Crosscheck the results by using AWS Compute Optimizer.**:
  → RDS instances không covered bởi Compute Optimizer. Compute optimization checks focus vào EC2, không phải RDS cost optimization.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "High utilization" + "cost optimization" → Reserved Instance recommendations
- "Organizations" + "finance team" → Management account consolidated view
- "RDS On-Demand" với high usage → Perfect cho Reserved Instance savings
- Compute Optimizer không support RDS instances

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon Relational Database Service (RDS) Reserved Instance optimization

</details>

---

<div id="question-32"></div>

### Question 32: Two AWS Direct Connect connections from each of the primary and secondary data cen...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has primary and secondary data centers that are 500 miles (804.7 km) apart and interconnected with high-speed fiber-optic cable. The company needs a highly available and secure network connection between its data centers and a VPC on AWS for a mission-critical workload. A solutions architect must choose a connection solution that provides maximum resiliency.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** A single AWS Direct Connect connection from each of the primary and secondary data centers terminating at one Direct Connect location on two separate devices.
- **(B)** Two AWS Direct Connect connections from each of the primary and secondary data centers terminating at two Direct Connect locations on two separate devices. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Two AWS Direct Connect connections from the primary data center terminating at two Direct Connect locations on two separate devices.
- **(D)** A single AWS Direct Connect connection from each of the primary and secondary data centers terminating at one Direct Connect location on the same device.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có primary và secondary data centers cách nhau 500 miles
> - Kết nối với high-speed cáp quang
> - Cần highly available và secure network connection giữa data centers và VPC on AWS
> - Mission-critical workload yêu cầu maximum resiliency

**Phân tích giải pháp tối ưu:**
Two AWS Direct Connect connections from each of the primary and secondary data centers terminating at two Direct Connect locations on two separate devices.

Maximum resiliency với multiple layers dự phòng

4 total Direct Connect connections (2 từ mỗi data center)

2 separate Direct Connect locations loại bỏ rủi ro lỗi từ một địa điểm

2 separate devices tại mỗi location loại bỏ rủi ro lỗi từ một thiết bị

Geographic redundancy với cả primary và secondary data centers được kết nối

Mission-critical workload protection với mức độ chịu lỗi cao nhất

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Two AWS Direct Connect connections from the primary data center terminating at two Direct Connect locations on two separate devices.**:
  → Chỉ kết nối từ primary data center, thiếu tính dự phòng về mặt địa lý. Nếu primary data center gặp sự cố thì mất kết nối hoàn toàn.

- **A single AWS Direct Connect connection from each of the primary and secondary data centers terminating at one Direct Connect location on the same device.**:
  → Single point of failure tại Direct Connect location và device level. Không đạt maximum resiliency requirement.

- **A single AWS Direct Connect connection from each of the primary and secondary data centers terminating at one Direct Connect location on two separate devices.**:
  → Vẫn có single point of failure tại Direct Connect location level. Separate devices không đủ khi chỉ có 1 location.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Maximum resiliency" + "mission-critical" → Multiple redundancy layers
- "Primary và secondary data centers" → Both locations cần connectivity
- Direct Connect resiliency = Multiple connections + Multiple locations + Multiple devices
- Single point of failure elimination across all components
- Geographic redundancy important cho mission-critical workloads

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Direct Connect Resiliency Toolkit

</details>

---

<div id="question-33"></div>

### Question 33: The EC2 instances to be part of a cluster placement group
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company plans to run a high performance computing (HPC) workload on Amazon EC2 Instances. The workload requires low-latency network performance and high network throughput with tightly coupled node-to-node communication.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Launch the EC2 instances as Spot Instances.
- **(B)** Launch the EC2 instances with Dedicated Instance tenancy.
- **(C)** Configure an On-Demand Capacity Reservation when the EC2 instances are launched.
- **(D)** Configure the EC2 instances to be part of a cluster placement group. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - High performance computing (HPC) workload trên EC2 instances
> - Yêu cầu low-latency network performance
> - Cần high network throughput
> - Tightly coupled node-to-node communication

**Phân tích giải pháp tối ưu:**
Configure the EC2 instances to be part of a cluster placement group.

Cluster placement groups được thiết kế chuyên biệt cho HPC workloads

Low latency với instances được đặt gần nhau physically trong cùng AZ

High bandwidth (10 Gbps network performance) giữa instances

Tightly coupled communication được optimize với minimal network hops

Same rack placement khi có thể để minimize latency

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Launch the EC2 instances with Dedicated Instance tenancy.**:
  → Dedicated tenancy cung cấp hardware isolation nhưng không optimize network performance hay latency giữa instances. Không address HPC communication requirements.

- **(A) Launch the EC2 instances as Spot Instances.**:
  → Spot instances là pricing model, không ảnh hưởng đến network performance. HPC workloads thường cần stability, Spot instances có thể bị interrupted.

- **Configure an On-Demand Capacity Reservation when the EC2 instances are launched.**:
  → Capacity reservation đảm bảo availability nhưng không improve network performance hay latency cho HPC workloads.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "HPC workload" + "low latency" + "high throughput" → Cluster placement groups
- "Tightly coupled node-to-node" → Physical proximity cần thiết
- "Network performance" cho HPC → Placement groups optimize này
- Dedicated tenancy = hardware isolation, không phải network optimization
- Spot instances = cost optimization, không phải performance optimization
- Capacity reservation = availability guarantee, không phải performance

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Placement groups for your Amazon EC2 instances

</details>

---

<div id="question-34"></div>

### Question 34: Generate a presigned URL that has the required access to the location of the repor...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company creates operations data and stores the data in an Amazon S3 bucket. For the company's annual audit, an external consultant needs to access an annual report that is stored in the S3 bucket. The external consultant needs to access the report for 7 days.

The company must implement a solution to allow the external consultant access to only the report.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new S3 bucket that is configured to host a public static website. Migrate the operations data to the new S3 bucket. Share the S3 website URL with the external consultant.
- **(B)** Enable public access to the S3 bucket for 7 days. Remove access to the S3 bucket when the external consultant completes the audit.
- **(C)** Generate a presigned URL that has the required access to the location of the report on the S3 bucket. Share the presigned URL with the external consultant. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a new IAM user that has access to the report in the S3 bucket. Provide the access keys to the external consultant. Revoke the access keys after 7 days.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company lưu operations data trong S3 bucket
> - External consultant cần access annual report trong S3 bucket
> - Consultant chỉ cần access for 7 days cho annual audit
> - Cần allow access only to the report (không phải toàn bộ bucket)
> - Yêu cầu MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Generate a presigned URL that has the required access to the location of the report on the S3 bucket. Share the presigned URL with the external consultant.

Presigned URL cho phép temporary access đến specific object trong S3

Time-limited (có thể set expiration exactly 7 days)

Object-specific access - chỉ access được report, không phải entire bucket

No IAM management cần thiết cho external user

Automatically expires sau 7 days, không cần manual cleanup

Most operationally efficient - minimal setup và automatic cleanup

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a new S3 bucket that is configured to host a public static website. Migrate the operations data to the new S3 bucket. Share the S3 website URL with the external consultant.**:
  → Migrate toàn bộ data là unnecessary và complex. Public website expose data publicly, không secure cho confidential operations data.

- **Enable public access to the S3 bucket for 7 days. Remove access to the S3 bucket when the external consultant completes the audit.**:
  → Expose entire bucket publicly là rủi ro security lớn. Ví phạm nguyên tắc đặc quyền tối thiểu - consultant chỉ cần access to specific report.

- **Create a new IAM user that has access to the report in the S3 bucket. Provide the access keys to the external consultant. Revoke the access keys after 7 days.**:
  → High operational overhead: create IAM user, manage permissions, distribute keys, manual cleanup. Security risk với long-lived access keys.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "External consultant" + "temporary access" → Presigned URLs
- "Only the report" + "7 days" → Object-specific, time-limited access
- "MOST operational efficiency" → Automatic expiration, no manual cleanup
- Presigned URLs perfect cho temporary, granular access
- Avoid public access cho sensitive operations data
- IAM users add unnecessary management overhead cho short-term access

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Download and upload objects with presigned URLs
- Sharing objects with presigned URLs

</details>

---

<div id="question-35"></div>

### Question 35: Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in ...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company wants to configure its Amazon CloudFront distribution to use SSL/TLS certificates. The company does not want to use the default domain name for the distribution. Instead, the company wants to use a different domain name for the distribution.

Which solution will deploy the certificate without incurring any additional costs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Request an Amazon issued private certificate from AWS Certificate Manager (ACM) in the us-east-1 Region.
- **(B)** Request an Amazon issued private certificate from AWS Certificate Manager (ACM) in the us-west-1 Region.
- **(C)** Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in the us-east-1 Region. `[Đáp án đúng ✅]`
- **(D)** Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in the us-west-1 Region.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Muốn configure CloudFront distribution để sử dụng SSL/TLS certificates
> - Không muốn dùng default domain name cho distribution
> - Muốn sử dụng different domain name (custom domain)
> - Yêu cầu deploy certificate without incurring additional costs

**Phân tích giải pháp tối ưu:**
Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in the us-east-1 Region.

Amazon-issued public certificates từ ACM là hoàn toàn free

us-east-1 region required cho CloudFront certificates - đây là requirement bắt buộc

Public certificate cần thiết để validate custom domain name publicly

No additional costs vì ACM public certificates không tính phí

Custom domain support với public certificate validation

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Request an Amazon issued private certificate from AWS Certificate Manager (ACM) in the us-east-1 Region.**:
  → Private certificates từ ACM có monthly charges ($400/month cho private CA). Không meet requirement "without additional costs".

- **(B) Request an Amazon issued private certificate from AWS Certificate Manager (ACM) in the us-west-1 Region.**:
  → Sai region (CloudFront requires us-east-1) và private certificates có cost.

- **(D) Request an Amazon issued public certificate from AWS Certificate Manager (ACM) in the us-west-1 Region.**:
  → Sai region. CloudFront chỉ accept certificates từ us-east-1 region.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "CloudFront" + "SSL certificate" → ACM certificate trong us-east-1
- "Custom domain" + "no additional costs" → Public certificate (free)
- "Private certificate" = paid service ($400+/month)
- "Public certificate" = free từ ACM
- CloudFront certificate region requirement = us-east-1 only
- Custom domain cần public certificate để domain validation

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Requirements for using SSL/TLS certificates with CloudFront

</details>

---

<div id="question-36"></div>

### Question 36: The DB cluster to use IAM database authentication
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is planning to run a group of Amazon EC2 instances that connect to an Amazon Aurora database. The company has built an AWS CloudFormation template to deploy the EC2 instances and the Aurora DB cluster. The company wants to allow the instances to authenticate to the database in a secure way. The company does not want to maintain static database credentials.

Which solution meets these requirements with the LEAST operational effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the DB cluster to use IAM database authentication with an IAM user. Create a database user that has a name that matches the IAM user. Associate the IAM user with the EC2 instances to allow applications on the instances to access the database.
- **(B)** Create a database user with a user name and password. Add parameters for the database user name and password to the CloudFormation template. Pass the parameters to the EC2 instances when the instances are launched.
- **(C)** Create a database user with a user name and password. Store the user name and password in AWS Systems Manager Parameter Store. Configure the EC2 instances to retrieve the database credentials from Parameter Store.
- **(D)** Configure the DB cluster to use IAM database authentication. Create a database user to use with IAM authentication. Associate a role with the EC2 instances to allow applications on the instances to access the database. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - EC2 instances kết nối đến Amazon Aurora database
> - Sử dụng CloudFormation template để deploy
> - Cần allow instances authenticate to database securely
> - Không muốn maintain static database credentials
> - Yêu cầu LEAST operational effort

**Phân tích giải pháp tối ưu:**
Configure the DB cluster to use IAM database authentication. Create a database user to use with IAM authentication. Associate a role with the EC2 instances to allow applications on the instances to access the database.

IAM database authentication loại bỏ hoàn toàn static credentials

EC2 instance roles provide temporary credentials automatically

No credential management cần thiết - AWS handles token generation và rotation

Secure authentication với temporary tokens thay vì static passwords

Least operational effort vì không cần store, rotate, hay manage credentials

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a database user with a user name and password. Add parameters for the database user name and password to the CloudFormation template. Pass the parameters to the EC2 instances when the instances are launched.**:
  → Vẫn sử dụng static credentials. CloudFormation parameters expose passwords trong template, không secure và vi phạm requirement về avoiding static credentials.

- **Create a database user with a user name and password. Store the user name and password in AWS Systems Manager Parameter Store. Configure the EC2 instances to retrieve the database credentials from Parameter Store.**:
  → Vẫn maintain static credentials trong Parameter Store. Cần operational overhead để rotate passwords và manage credential lifecycle.

- **Configure the DB cluster to use IAM database authentication with an IAM user. Create a database user that has a name that matches the IAM user. Associate the IAM user with the EC2 instances to allow applications on the instances to access the database.**:
  → IAM users require access key management, không phải best practice cho EC2 instances. EC2 roles secure hơn IAM users cho instance authentication.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "No static credentials" + "secure authentication" → IAM database authentication
- "EC2 instances" + "database access" → EC2 IAM roles
- Aurora IAM authentication supports MySQL và PostgreSQL
- EC2 roles better than IAM users cho instance permissions

#### 📚 Tài liệu tham khảo chính thức (Official References):
- IAM database authentication

</details>

---

<div id="question-37"></div>

### Question 37: Amazon GuardDuty to perform threat detection
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company's web application consists of multiple Amazon EC2 instances that run behind an Application Load Balancer in a VPC. An Amazon RDS for MySQL DB instance contains the data. The company needs the ability to automatically detect and respond to suspicious or unexpected behavior in its AWS environment. The company already has added AWS WAF to its architecture.

What should a solutions architect do next to protect against threats?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Firewall Manager to perform threat detection. Configure Amazon EventBridge to filter for Firewall Manager findings and to invoke an AWS Lambda function to adjust the AWS WAF web ACL.
- **(B)** Use Amazon Macie to perform threat detection and to update the AWS WAF rules. Create a VPC network ACL to limit access to the web application.
- **(C)** Use Amazon GuardDuty to perform threat detection. Configure Amazon EventBridge to filter for GuardDuty findings and to invoke an AWS Lambda function to adjust the AWS WAF rules. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon Inspector to perform threat detection and to update the AWS WAF rules. Create a VPC network ACL to limit access to the web application.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web application với EC2 instances sau Application Load Balancer trong VPC
> - RDS MySQL chứa data
> - Cần automatically detect và respond to suspicious/unexpected behavior
> - Đã có AWS WAF trong architecture
> - Cần thêm threat detection solution

**Phân tích giải pháp tối ưu:**
Use Amazon GuardDuty to perform threat detection. Configure Amazon EventBridge to filter for GuardDuty findings and to invoke an AWS Lambda function to adjust the AWS WAF rules.

Amazon GuardDuty là managed threat detection service được thiết kế để detect suspicious behavior (hành vi đáng ngờ)

Continuous monitoring của VPC flow logs, DNS logs, CloudTrail events

EventBridge integration cho automated response workflows

Lambda function có thể automatically update WAF rules based trên GuardDuty findings

Complete automated response từ detection đến remediation (khắc phục)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use AWS Firewall Manager to perform threat detection. Configure Amazon EventBridge to filter for Firewall Manager findings and to invoke an AWS Lambda function to adjust the AWS WAF web ACL.**:
  → Firewall Manager là management tool cho firewall policies across accounts, không phải threat detection service. Không generate security findings để trigger automated responses.

- **(D) Use Amazon Inspector to perform threat detection and to update the AWS WAF rules. Create a VPC network ACL to limit access to the web application.**:
  → Inspector focus vào vulnerability assessment của applications và EC2 instances, không phải real-time threat detection. Không có built-in WAF integration.

- **(B) Use Amazon Macie to perform threat detection and to update the AWS WAF rules. Create a VPC network ACL to limit access to the web application.**:
  → Macie specialized cho data privacy và sensitive data discovery trong S3, không phải general threat detection cho web applications. Không relevant cho EC2/RDS architecture này.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Threat detection" + "suspicious behavior" → Amazon GuardDuty
- "Automated response" + "WAF rules" → EventBridge + Lambda integration
- Firewall Manager = policy management, không phải detection
- Inspector = vulnerability scanning, không phải threat detection
- Macie = S3 data discovery, không phải infrastructure threats

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-38"></div>

### Question 38: Copy the website assets to an Amazon Elastic File System (Amazon EFS) file system
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is building a web application that serves a content management system. The content management system runs on Amazon EC2 instances behind an Application Load Balancer (ALB). The EC2 instances run in an Auto Scaling group across multiple Availability Zones. Users are constantly adding and updating files, blogs, and other website assets in the content management system.

A solutions architect must implement a solution in which all the EC2 instances share up-to-date website content with the least possible lag time.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Copy the website assets to an Amazon S3 bucket. Ensure that each EC2 instance downloads the website assets from the S3 bucket to the attached Amazon Elastic Block Store (Amazon EBS) volume. Run the S3 sync command once each hour to keep files up to date.
- **(B)** Restore an Amazon Elastic Block Store (Amazon EBS) snapshot with the website assets. Attach the EBS snapshot as a secondary EBS volume when a new EC2 instance is launched. Configure the website hosting application to reference the website assets that are stored in the secondary EBS volume.
- **(C)** Copy the website assets to an Amazon Elastic File System (Amazon EFS) file system. Configure each EC2 instance to mount the EFS file system locally. Configure the website hosting application to reference the website assets that are stored in the EFS file system. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Update the EC2 user data in the Auto Scaling group lifecycle policy to copy the website assets from the EC2 instance that was launched most recently. Configure the ALB to make changes to the website assets only in the newest EC2 instance.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Content management system chạy trên EC2 instances sau ALB
> - EC2 instances trong Auto Scaling group across multiple AZs
> - Users liên tục adding và updating files, blogs, website assets
> - Cần all EC2 instances share up-to-date content với least possible lag time

**Phân tích giải pháp tối ưu:**
Copy the website assets to an Amazon Elastic File System (Amazon EFS) file system. Configure each EC2 instance to mount the EFS file system locally. Configure the website hosting application to reference the website assets that are stored in the EFS file system.

Amazon EFS là shared file system có thể mount đồng thời trên multiple EC2 instances

Real-time sharing - tất cả instances thấy updates ngay lập tức

POSIX-compliant file system hoạt động như local storage cho applications

Automatic scaling và high availability across multiple AZs

Least lag time vì changes visible ngay lập tức across all instances

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Update the EC2 user data in the Auto Scaling group lifecycle policy to copy the website assets from the EC2 instance that was launched most recently. Configure the ALB to make changes to the website assets only in the newest EC2 instance.**:
  → Complex và giải pháp không đáng tin cậy. ALB không thể restrict updates to specific instances. Copying files giữa instances tạo lag time và complexity.

- **Copy the website assets to an Amazon S3 bucket. Ensure that each EC2 instance downloads the website assets from the S3 bucket to the attached Amazon Elastic Block Store (Amazon EBS) volume. Run the S3 sync command once each hour to keep files up to date.**:
  → Hourly sync tạo significant lag time (up to 1 hour). Không meet requirement về "least possible lag time". Manual sync process cũng unreliable.

- **(B) Restore an Amazon Elastic Block Store (Amazon EBS) snapshot with the website assets. Attach the EBS snapshot as a secondary EBS volume when a new EC2 instance is launched. Configure the website hosting application to reference the website assets that are stored in the secondary EBS volume.**:
  → EBS snapshots là static point-in-time copies. Không update automatically khi có new content. Không share giữa instances.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-39"></div>

### Question 39: An Amazon Aurora Serverless cluster
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A large company wants to provide its globally located developers separate, limited size, managed PostgreSQL databases for development purposes. The databases will be low volume. The developers need the databases only when they are actively working.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Give the developers the ability to launch separate Amazon Aurora instances. Set up a process to shut down Aurora instances at the end of the workday and to start Aurora instances at the beginning of the next workday.
- **(B)** Monitor AWS Trusted Advisor checks for idle Amazon RDS databases. Create a process to terminate identified idle RDS databases.
- **(C)** Develop an AWS Service Catalog product that enforces size restrictions for launching Amazon Aurora instances. Give the developers access to launch the product when they need a development database.
- **(D)** Create an Amazon Aurora Serverless cluster. Develop an AWS Service Catalog product to launch databases in the cluster with the default capacity settings. Grant the developers access to the product. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Large company có developers ở nhiều nước khác nhau
> - Cần cung cấp database PostgreSQL riêng biệt cho mỗi developer để phát triển
> - Database có kích thước giới hạn, ít dữ liệu và chỉ dùng khi developers đang làm việc
> - Tìm giải pháp tiết kiệm chi phí nhất

**Phân tích giải pháp tối ưu:**
Create an Amazon Aurora Serverless cluster. Develop an AWS Service Catalog product to launch databases in the cluster with the default capacity settings. Grant the developers access to the product.

Aurora Serverless tự động scale down to zero khi không sử dụng - perfect cho intermittent usage

Pay only for actual usage thay vì provisioned capacity 24/7

Automatic pause/resume khi developers start/stop working

AWS Service Catalog provides governance và standardization cho database launches

No manual shutdown processes cần thiết - serverless tự động handle

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Give the developers the ability to launch separate Amazon Aurora instances. Set up a process to shut down Aurora instances at the end of the workday and to start Aurora instances at the beginning of the next workday.**:
  Aurora instances vẫn có minimum costs ngay cả khi shutdown.
  Manual processes tạo operational overhead và có thể fail.
  Không optimal cho global developers với different time zones.

- **Develop an AWS Service Catalog product that enforces size restrictions for launching Amazon Aurora instances. Give the developers access to launch the product when they need a development database.**:
  Regular Aurora instances vẫn charge liên tục ngay cả khi idle (nhàn rỗi).
  Size restrictions không giải quyết cost issue khi databases chạy 24/7.

- **(B) Monitor AWS Trusted Advisor checks for idle Amazon RDS databases. Create a process to terminate identified idle RDS databases.**:
  Reactive approach với operational overhead.
  Risk of accidentally terminating databases khi developers đang work.
  Không address root cause của continuous charging.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Only when actively working" → Aurora Serverless (auto pause/resume)
- "MOST cost-effectively" → Pay per usage thay vì provisioned
- Aurora Serverless automatically scales to zero capacity khi idle
- Service Catalog provides governance without restricting cost optimization

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon Aurora Serverless
- AWS Service Catalog features

</details>

---

<div id="question-40"></div>

### Question 40: Amazon Neptune to store the data
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company wants to build a map of its IT infrastructure to identify and enforce policies on resources that pose security risks. The company's security team must be able to query data in the IT infrastructure map and quickly identify security risks.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon RDS to store the data. Use SQL to query the data to identify security risks.
- **(B)** Use Amazon DynamoDB to store the data. Use PartiQL to query the data to identify security risks.
- **(C)** Use Amazon Neptune to store the data. Use SPARQL to query the data to identify security risks. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon Redshift to store the data. Use SQL to query the data to identify security risks.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company muốn xây dựng bản đồ IT infrastructure để identify và enforce policies
> - Cần xác định resources có security risks
> - Security team phải có khả năng query data và nhanh chóng identify security risks
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Use Amazon Neptune to store the data. Use SPARQL to query the data to identify security risks.

Neptune là graph database được thiết kế chuyên biệt cho việc lập bản đồ relationships

IT infrastructure mapping về bản chất là graph problem với các mối quan hệ phức tạp

SPARQL queries được tối ưu hóa để tìm kiếm patterns và relationships trong dữ liệu có kết nối

Graph structure phù hợp tự nhiên cho security risk analysis thông qua resource relationships

Managed service với ít operational overhead nhất cho graph workloads

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use Amazon RDS to store the data. Use SQL to query the data to identify security risks.**:
  Relational databases không tối ưu cho complex relationship queries.
  SQL joins trở nên phức tạp và chậm khi phân tích interconnected infrastructure relationships.

- **(D) Use Amazon Redshift to store the data. Use SQL to query the data to identify security risks.**:
  Redshift là data warehouse cho analytics, không phù hợp cho real-time security risk queries.
  Over-engineering và expensive cho use case này.

- **(B) Use Amazon DynamoDB to store the data. Use PartiQL to query the data to identify security risks.**:
  DynamoDB là NoSQL database không optimize cho complex relationship queries.
  PartiQL không có graph traversal capabilities cần thiết cho infrastructure mapping.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "IT infrastructure map" + "relationships" → Graph database (Neptune)
- "Security risks" + "connected resources" → Graph pattern matching

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Visualize your AWS Infrastructure with Amazon Neptune and AWS Config

</details>

---

<div id="question-41"></div>

### Question 41: AWS Backup to configure and monitor all backups for the services in use
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A large international university has deployed all of its compute services in the AWS Cloud. These services include Amazon EC2, Amazon RDS, and Amazon DynamoDB. The university currently relies on many custom scripts to back up its infrastructure. However, the university wants to centralize management and automate data backups as much as possible by using AWS native options.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Backup to configure and monitor all backups for the services in use. `[Đáp án đúng ✅]`
- **(B)** Use AWS Systems Manager State Manager to manage the configuration and monitoring of backup tasks.
- **(C)** Use third-party backup software with an AWS Storage Gateway tape gateway virtual tape library.
- **(D)** Use AWS Config to set lifecycle management to take snapshots of all data sources on a schedule.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Large international university deploy tất cả compute services trên AWS Cloud
> - Services bao gồm EC2, RDS, và DynamoDB
> - Hiện tại dựa vào many custom scripts để backup infrastructure
> - Muốn centralize management và automate data backups bằng AWS native options

**Phân tích giải pháp tối ưu:**
Use AWS Backup to configure and monitor all backups for the services in use.

AWS Backup là centralized backup service được thiết kế chuyên biệt cho multi-service backup management

Native support cho EC2, RDS, và DynamoDB trong một single solution

Centralized dashboard để configure và monitor tất cả backup activities

Policy-based backup với automated scheduling và retention management

Cost-effective và eliminates need cho custom scripts

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use third-party backup software with an AWS Storage Gateway tape gateway virtual tape library.**:
  Third-party solution không phải AWS native option.
  Tape gateway phức tạp và không cần thiết cho modern cloud backup requirements. Higher operational overhead.

- **(D) Use AWS Config to set lifecycle management to take snapshots of all data sources on a schedule.**:
  AWS Config là compliance và configuration monitoring service, không phải backup solution.
  Config không có scheduling capabilities cho automated backups across multiple services.

- **(B) Use AWS Systems Manager State Manager to manage the configuration and monitoring of backup tasks.**:
  State Manager quản lý configuration compliance, không phải backup orchestration.
  Vẫn require custom scripts để implement actual backup logic.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Centralize management" + "automate backups" → AWS Backup
- "AWS native options" → Built-in AWS services thay vì third-party
- "EC2, RDS, DynamoDB" → AWS Backup supports tất cả services này
- AWS Config = compliance monitoring, không phải backup
- Systems Manager = configuration management, không phải backup orchestration

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How AWS Backup works with supported AWS services
- Automate centralized backup at scale across AWS services using AWS Backup

</details>

---

<div id="question-42"></div>

### Question 42: The database to Amazon RDS Custom for Oracle by using native tools
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company runs its application on Oracle Database Enterprise Edition. The company needs to migrate the application and the database to AWS. The company can use the Bring Your Own License (BYOL) model while migrating to AWS. The application uses third-party database features that require privileged access.

A solutions architect must design a solution for the database migration.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the database to Amazon DynamoDB by using AWS Database Migration Service (AWS DMS). Customize the new database settings to support the third-party features.
- **(B)** Migrate the database to Amazon RDS for PostgreSQL by using AWS Database Migration Service (AWS DMS). Rewrite the application code to remove the dependency on third-party features.
- **(C)** Migrate the database to Amazon RDS for Oracle by using native tools. Replace the third-party features with AWS Lambda.
- **(D)** Migrate the database to Amazon RDS Custom for Oracle by using native tools. Customize the new database settings to support the third-party features. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên Oracle Database Enterprise Edition
> - Cần migrate application và database lên AWS
> - Có thể sử dụng Bring Your Own License (BYOL) model
> - Application sử dụng third-party database features cần privileged access
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Migrate the database to Amazon RDS Custom for Oracle by using native tools. Customize the new database settings to support the third-party features.

RDS Custom for Oracle cho phép privileged access và customization cần thiết cho third-party features

BYOL support giúp tiết kiệm licensing costs so với license-included options

Native Oracle tools đảm bảo khả năng tương thích và minimize migration complexity

Managed service benefits với flexibility để customize cho third-party requirements

Cost-effective vì giữ được existing Oracle licenses và avoid application rewrites

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Migrate the database to Amazon RDS for Oracle by using native tools. Replace the third-party features with AWS Lambda**:
  Standard RDS for Oracle không cho phép privileged access cần thiết cho third-party features.
  Replacing với Lambda require application rewrite và có thể không cung cấp chức năng tương đương.

- **(A) Migrate the database to Amazon DynamoDB by using AWS Database Migration Service (AWS DMS). Customize the new database settings to support the third-party features.**:
  DynamoDB là NoSQL database hoàn toàn khác với Oracle relational database.
  Cần phải rewrite application và không support Oracle third-party features.

- **(B) Migrate the database to Amazon RDS for PostgreSQL by using AWS Database Migration Service (AWS DMS). Rewrite the application code to remove the dependency on third-party features.**:
  Switching từ Oracle sang PostgreSQL require rewrite application và mất quyền lợi BYOL.
  Third-party features có thể không có tương đương trong PostgreSQL.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Third-party features" + "privileged access" → RDS Custom
- "BYOL model" → Keep existing Oracle licenses với RDS Custom
- "MOST cost-effectively" → Avoid major application rewrites
- RDS Custom allows OS-level access cho third-party software
- Standard RDS không support privileged access
- Database engine changes (Oracle → PostgreSQL/DynamoDB) expensive và risky

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon RDS Custom
- Amazon RDS Custom for Oracle – New Control Capabilities in Database Environment
- Working with RDS Custom for Oracle

</details>

---

<div id="question-43"></div>

### Question 43: The password in AWS Secrets Manager
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company uses Amazon RDS for PostgreSQL databases for its data tier. The company must implement password rotation for the databases.

Which solution meets this requirement with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the password in AWS Key Management Service (AWS KMS). Enable automatic rotation on the AWS KMS key.
- **(B)** Store the password in AWS Systems Manager Parameter Store. Write an AWS Lambda function that rotates the password.
- **(C)** Store the password in AWS Systems Manager Parameter Store. Enable automatic rotation on the parameter.
- **(D)** Store the password in AWS Secrets Manager. Enable automatic rotation on the secret. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Amazon RDS for PostgreSQL databases
> - Cần implement password rotation cho databases
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Store the password in AWS Secrets Manager. Enable automatic rotation on the secret.

AWS Secrets Manager được thiết kế chuyên biệt cho password và credential management

Built-in automatic rotation cho RDS databases với zero operational overhead

Native integration với RDS PostgreSQL for seamless password updates

Managed rotation process không cần custom code hay manual intervention

Least operational overhead vì AWS handles toàn bộ rotation lifecycle

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Store the password in AWS Systems Manager Parameter Store. Enable automatic rotation on the parameter.**:
  → Parameter Store không có built-in automatic rotation capabilities. Cần additional setup và custom logic để implement rotation.

- **(B) Store the password in AWS Systems Manager Parameter Store. Write an AWS Lambda function that rotates the password.**:
  → Require custom Lambda function development và maintenance. Higher operational overhead với custom code, scheduling, error handling, và monitoring.

- **(A) Store the password in AWS Key Management Service (AWS KMS). Enable automatic rotation on the AWS KMS key.**:
  → KMS là encryption key management service, không phải password storage solution. KMS key rotation không liên quan đến database password rotation.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Password rotation" + "RDS" → AWS Secrets Manager
- "LEAST operational overhead" → Built-in features thay vì custom solutions
- "Automatic rotation" → Secrets Manager native capability
- Parameter Store = configuration storage, không phải password rotation
- KMS = encryption keys, không phải database passwords
- Secrets Manager có pre-built rotation functions cho RDS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Bên dưới mình họa cách rotation của Secret Manager và Parameter Store.
- Lưu ý:
- Trong trường hợp khi tạo RDS và chọn option lưu password sử dụng Seccret Manager, thì secret đó gọi là managed secrets và cơ chế rotation vô cùng dễ dàng, chỉ cần seting schedule là được (không cần quan tâm đến Lambda).
- Một số trường hợp không phải managed secrets thì sẽ phải chuẩn bị Lambda
- Rotate AWS Secrets Manager secrets
- How Amazon RDS uses AWS Secrets Manager

</details>

---

<div id="question-44"></div>

### Question 44: A recurring scheduled action to scale up the Auto Scaling group before the expecte...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company’s application is running on Amazon EC2 instances within an Auto Scaling group behind an Elastic Load Balancing (ELB) load balancer. Based on the application's history, the company anticipates a spike in traffic during a holiday each year. A solutions architect must design a strategy to ensure that the Auto Scaling group proactively increases capacity to minimize any performance impact on application users.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Increase the minimum and maximum number of EC2 instances in the Auto Scaling group during the peak demand period.
- **(B)** Configure an Amazon Simple Notification Service (Amazon SNS) notification to send alerts when there are autoscaling:EC2_INSTANCE_LAUNCH events.
- **(C)** Create an Amazon CloudWatch alarm to scale up the EC2 instances when CPU utilization exceeds 90%.
- **(D)** Create a recurring scheduled action to scale up the Auto Scaling group before the expected period of peak demand. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên EC2 instances trong Auto Scaling group sau ELB load balancer
> - Company anticipates spike in traffic during holiday hàng năm dựa trên application history
> - Cần strategy để Auto Scaling group proactively increases capacity
> - Mục tiêu minimize performance impact cho application users

**Phân tích giải pháp tối ưu:**
Create a recurring scheduled action to scale up the Auto Scaling group before the expected period of peak demand.

Scheduled scaling cho phép mở rộng chủ động trước khi traffic tăng đột biến xảy ra

Recurring action có thể thiết lập cho mô hình holiday hàng năm

Proactive approach đảm bảo capacity sẵn sàng trước peak demand

Minimize performance impact vì instances đã được provision trước

Predictable pattern phù hợp với traffic spikes trong holiday đã biết

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon CloudWatch alarm to scale up the EC2 instances when CPU utilization exceeds 90%.**:
  Đây là reactive scaling (phản ứng), không phải proactive(chủ động). Khi CPU đạt 90% thì performance đã bị impact.
  Scaling takes time để provision new instances.

- **(A) Increase the minimum and maximum number of EC2 instances in the Auto Scaling group during the peak demand period.**:
  Manual process require human intervention để change configuration.
  Không tự động và có nguy cơ lỗi người dùng hoặc vấn đề về thời gian.

- **Configure an Amazon Simple Notification Service (Amazon SNS) notification to send alerts when there are autoscaling:EC2_INSTANCE_LAUNCH events.**:
  SNS notification chỉ là monitoring tool, không thực sự scale capacity.
  Không giải quyết yêu cầu mở rộng chủ động.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Proactively increases capacity" → Scheduled scaling
- "Predictable traffic spike" → Schedule trước known events
- "Holiday each year" → Recurring scheduled actions
- "Minimize performance impact" → Scale trước khi cần, không react sau

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Scheduled scaling for Amazon EC2 Auto Scaling

</details>

---

<div id="question-45"></div>

### Question 45: An AWS Lambda function that scans the DynamoDB table and uses Amazon Simple Notifi...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has 15 employees. The company stores employee start dates in an Amazon DynamoDB table. The company wants to send an email message to each employee on the day of the employee's work anniversary.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Lambda function that scans the DynamoDB table and uses Amazon Simple Queue Service (Amazon SQS) to send email messages to employees when necessary. Schedule this Lambda function to run every day.
- **(B)** Create a script that scans the DynamoDB table and uses Amazon Simple Notification Service (Amazon SNS) to send email messages to employees when necessary. Use a cron job to run this script every day on an Amazon EC2 instance.
- **(C)** Create a script that scans the DynamoDB table and uses Amazon Simple Queue Service (Amazon SQS) to send email messages to employees when necessary. Use a cron job to run this script every day on an Amazon EC2 instance.
- **(D)** Create an AWS Lambda function that scans the DynamoDB table and uses Amazon Simple Notification Service (Amazon SNS) to send email messages to employees when necessary. Schedule this Lambda function to run every day. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có 15 employees
> - Lưu employee start dates trong DynamoDB table
> - Muốn send email message cho mỗi employee vào ngày kỷ niệm làm việc
> - Yêu cầu MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Create an AWS Lambda function that scans the DynamoDB table and uses Amazon Simple Notification Service (Amazon SNS) to send email messages to employees when necessary. Schedule this Lambda function to run every day.

AWS Lambda là serverless solution với operational efficiency cao nhất

No server management cần thiết, tự động scale và chỉ pay khi chạy

Amazon SNS có thể send email trực tiếp đến employees

Scheduled Lambda với EventBridge/CloudWatch Events cho daily execution

Cost-effective cho 15 employees - minimal compute time cần thiết

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a script that scans the DynamoDB table and uses Amazon Simple Notification Service (Amazon SNS) to send email messages to employees when necessary. Use a cron job to run this script every day on an Amazon EC2 instance.**:
  → EC2 instance yêu cầu server management, patching, và chạy 24/7 cho task chỉ chạy once daily. Higher operational overhead và costs.

- **Create a script that scans the DynamoDB table and uses Amazon Simple Queue Service (Amazon SQS) to send email messages to employees when necessary. Use a cron job to run this script every day on an Amazon EC2 instance.**:
  → SQS không thể send email trực tiếp, cần additional service để process messages. EC2 cũng có higher operational overhead.

- **Create an AWS Lambda function that scans the DynamoDB table and uses Amazon Simple Queue Service (Amazon SQS) to send email messages to employees when necessary. Schedule this Lambda function to run every day.**:
  → SQS không send email trực tiếp. Cần additional components để consume SQS messages và send actual emails, tăng complexity.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-46"></div>

### Question 46: AWS Storage Gateway
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company has an on-premises business application that generates hundreds of files each day. These files are stored on an SMB file share and require a low-latency connection to the application servers. A new company policy states all application-generated files must be copied to AWS. There is already a VPN connection to AWS.

The application development team does not have time to make the necessary code modifications to move the application to AWS.

Which service should a solutions architect recommend to allow the application to copy files to AWS?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Storage Gateway `[Đáp án đúng ✅]`
- **(B)** Amazon FSx for Windows File Server
- **(C)** AWS Snowball
- **(D)** Amazon Elastic File System (Amazon EFS)

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - On-premises business application tạo ra hundreds of files mỗi ngày
> - Files được lưu trên SMB file share và cần low-latency connection đến application servers
> - Company policy mới: tất cả files phải được copy to AWS
> - Đã có VPN connection to AWS
> - Development team không có thời gian để modify code để move application lên AWS

**Phân tích giải pháp tối ưu:**
AWS Storage Gateway

AWS Storage Gateway được thiết kế chuyên biệt cho hybrid cloud storage scenarios

File Gateway mode cung cấp SMB interface cho on-premises applications

Seamless integration với existing SMB file shares mà không cần code changes

Automatic copying files đến S3 thông qua VPN connection có sẵn

Low-latency access cho on-premises applications với local caching

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon Elastic File System (Amazon EFS)**:
  → EFS là fully managed NFS file system trong AWS cloud. Không giải quyết việc copy files từ existing on-premises SMB shares lên AWS mà không modify application.

- **Amazon FSx for Windows File Server**:
  → FSx là fully managed Windows file system trong AWS. Sẽ require migrate toàn bộ application và data lên AWS, không phải copy files từ existing on-premises setup.

- **AWS Snowball**:
  → Snowball là physical data transfer device cho one-time large data migrations. Không phù hợp cho ongoing daily file copying requirements với hundreds of files mỗi ngày.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SMB file share" + "copy to AWS" + "no code changes" → AWS Storage Gateway
- "Hybrid storage" → Storage Gateway specialty
- "Low-latency" + "on-premises" → Storage Gateway với local caching
- "Ongoing file copying" → Storage Gateway, không phải Snowball
- Storage Gateway File Gateway = SMB/NFS interface + S3 backend
- No application modifications required với Storage Gateway

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Storage Gateway File Gateway Hybrid Cloud Storage with Storage Gateway

</details>

---

<div id="question-47"></div>

### Question 47: The web application to Amazon EC2 instances that run in an Auto Scaling group acro...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An ecommerce company is migrating its on-premises workload to the AWS Cloud. The workload currently consists of a web application and a backend Microsoft SQL database for storage.

The company expects a high volume of customers during a promotional event. The new infrastructure in the AWS Cloud must be highly available and scalable.

Which solution will meet these requirements with the LEAST administrative overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the web application to two Amazon EC2 instances across two Availability Zones behind an Application Load Balancer. Migrate the database to Amazon RDS for Microsoft SQL Server with read replicas in both Availability Zones.
- **(B)** Migrate the web application to three Amazon EC2 instances across three Availability Zones behind an Application Load Balancer. Migrate the database to three EC2 instances across three Availability Zones.
- **(C)** Migrate the web application to an Amazon EC2 instance that runs in an Auto Scaling group across two Availability Zones behind an Application Load Balancer. Migrate the database to two EC2 instances across separate AWS Regions with database replication.
- **(D)** Migrate the web application to Amazon EC2 instances that run in an Auto Scaling group across two Availability Zones behind an Application Load Balancer. Migrate the database to Amazon RDS with Multi-AZ deployment. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ecommerce company migrate on-premises workload lên AWS Cloud
> - Workload hiện tại có web application và Microsoft SQL database backend
> - Expect high volume customers trong khuyến mại event
> - Infrastructure mới cần highly available và scalable
> - Yêu cầu LEAST administrative overhead

**Phân tích giải pháp tối ưu:**
Migrate the web application to Amazon EC2 instances that run in an Auto Scaling group across two Availability Zones behind an Application Load Balancer. Migrate the database to Amazon RDS with Multi-AZ deployment.

Auto Scaling group tự động handle traffic spikes during promotional (khuyến mại) events

Application Load Balancer distribute traffic across multiple AZs

Amazon RDS with Multi-AZ cung cấp high availability với automatic failover

Managed service (RDS) có least administrative overhead so với self-managed databases

Scalable architecture handle varying customer volumes

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Migrate the web application to two Amazon EC2 instances across two Availability Zones behind an Application Load Balancer. Migrate the database to Amazon RDS for Microsoft SQL Server with read replicas in both Availability Zones.**:
  Fixed number of EC2 instances (2) không scale với high volume traffic.
  Read replicas không provide automatic failover for write operations.

- **(C) Migrate the web application to an Amazon EC2 instance that runs in an Auto Scaling group across two Availability Zones behind an Application Load Balancer. Migrate the database to two EC2 instances across separate AWS Regions with database replication.**:
  Database trên EC2 instances có high administrative overhead (patching, backup, replication management).
  Cross-region database adds complexity và latency.

- **(B) Migrate the web application to three Amazon EC2 instances across three Availability Zones behind an Application Load Balancer. Migrate the database to three EC2 instances across three Availability Zones.**:
  Fixed number of EC2 instances không auto-scale.
  Database trên EC2 có very high administrative overhead với manual clustering và replication management.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-48"></div>

### Question 48: AWS Backup to create a backup plan with a rule that takes a daily backup and repli...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs an application on several Amazon EC2 instances that store persistent data on an Amazon Elastic File System (Amazon EFS) file system. The company needs to replicate the data to another AWS Region by using an AWS managed service solution.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use the EFS-to-EFS backup solution to replicate the data to an EFS file system in another Region.
- **(B)** Use AWS Backup to create a backup plan with a rule that takes a daily backup and replicates it to another Region. Assign the EFS file system resource to the backup plan. `[Đáp án đúng ✅]`
- **(C)** Run a nightly script to copy data from the EFS file system to an Amazon S3 bucket. Enable S3 Cross-Region Replication on the S3 bucket.
- **(D)** Create a VPC in another Region. Establish a cross-Region VPC peer. Run a nightly rsync to copy data from the original Region to the new Region.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy trên EC2 instances lưu persistent data trên Amazon EFS
> - Cần replicate data to another AWS Region bằng AWS managed service
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Use AWS Backup to create a backup plan with a rule that takes a daily backup and replicates it to another Region. Assign the EFS file system resource to the backup plan.

AWS Backup là fully managed service cho cross-region replication

Cost-effective vì chỉ pay cho backup storage và cross-region transfer

Automated daily backups với built-in cross-region replication capabilities

No additional infrastructure hay custom scripts cần maintain

EFS native integration với AWS Backup cho operation liền mạch

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use the EFS-to-EFS backup solution to replicate the data to an EFS file system in another Region.**:
  EFS-to-EFS replication không phải native AWS managed service.
  Require custom implementation và có thể expensive hơn AWS Backup approach.

- **(C) Run a nightly script to copy data from the EFS file system to an Amazon S3 bucket. Enable S3 Cross-Region Replication on the S3 bucket.**:
  Custom script require maintenance và monitoring.
  S3 storage costs có thể higher than backup storage.
  Additional operational overhead với script management.

- **Create a VPC in another Region. Establish a cross-Region VPC peer. Run a nightly rsync to copy data from the original Region to the new Region.**:
  Very high operational overhead với VPC peering setup, EC2 instances trong destination region, và custom rsync scripts.
  Most expensive option với continuous EC2 costs.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "AWS managed service" + "cost-effective" → AWS Backup
- "Cross-region replication" → AWS Backup có built-in capability
- "EFS replication" → AWS Backup natively supports EFS
- Custom scripts = operational overhead và higher costs
- VPC peering + rsync = most complex và expensive
- AWS Backup optimized cho cross-region backup replication

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Backing up EFS file systems

</details>

---

<div id="question-49"></div>

### Question 49: Amazon Macie in each Region
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A solutions architect needs to review a company's Amazon S3 buckets to discover personally identifiable information (PII). The company stores the PII data in the us-east-1 Region and us-west-2 Region.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon Macie in each Region. Create a job to analyze the data that is in Amazon S3. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure AWS Security Hub for all Regions. Create an AWS Config rule to analyze the data that is in Amazon S3.
- **(C)** Configure Amazon Inspector to analyze the data that is in Amazon S3.
- **(D)** Configure Amazon GuardDuty to analyze the data that is in Amazon S3.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Solutions architect cần review company's S3 buckets để discover personally identifiable information (PII)
> - Company lưu PII data trong us-east-1 và us-west-2 Regions
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Configure Amazon Macie in each Region. Create a job to analyze the data that is in Amazon S3.

Amazon Macie được thiết kế chuyên biệt cho PII discovery và data classification trong S3

Native S3 integration với built-in PII detection capabilities

Automated analysis với machine learning để identify sensitive data patterns

Regional service nên cần configure trong cả hai regions where data được stored

Least operational overhead vì purpose-built cho exact use case này

Validation system for data classification

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure AWS Security Hub for all Regions. Create an AWS Config rule to analyze the data that is in Amazon S3.**:
  Security Hub là security findings aggregation service, không có built-in PII discovery capabilities.
  AWS Config rules không có native ability để scan S3 content cho PII.

- **Configure Amazon Inspector to analyze the data that is in Amazon S3.**:
  Amazon Inspector là vulnerability assessment service cho EC2 instances và container images, không phải S3 data analysis tool.
  Không có PII discovery functionality.

- **Configure Amazon GuardDuty to analyze the data that is in Amazon S3.**:
  GuardDuty là threat detection service focus vào malicious activities và security threats, không phải data classification hay PII discovery trong S3 content.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "PII discovery" + "S3 buckets" → Amazon Macie
- Macie = data privacy và protection service
- Inspector = vulnerability assessment
- GuardDuty = threat detection
- Security Hub = security findings aggregation

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Discovering sensitive data with Macie
- Using Amazon Macie to Validate S3 Bucket Data Classification

</details>

---

<div id="question-50"></div>

### Question 50: AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A news company that has reporters all over the world is hosting its broadcast system on AWS. The reporters send live broadcasts to the broadcast system. The reporters use software on their phones to send live streams through the Real Time Messaging Protocol (RTMP).

A solutions architect must design a solution that gives the reporters the ability to send the highest quality streams. The solution must provide accelerated TCP connections back to the broadcast system.

What should the solutions architect use to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** AWS Client VPN
- **(B)** AWS Global Accelerator `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Amazon CloudFront
- **(D)** Amazon EC2 instances and AWS Elastic IP addresses

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - News company có reporters all over the world hosting broadcast system trên AWS
> - Reporters send live broadcasts từ phones sử dụng Real Time Messaging Protocol (RTMP)
> - Cần highest quality streams với accelerated TCP connections back to broadcast system
> - Reporters ở globally distributed locations

**Phân tích giải pháp tối ưu:**
AWS Global Accelerator

AWS Global Accelerator được thiết kế chuyên biệt cho accelerated TCP connections

Global network optimization với AWS edge locations để improve performance

Anycast IP addresses route traffic đến nearest healthy endpoint

TCP acceleration specifically addresses requirement về accelerated TCP connections

Global reach phù hợp cho reporters "all over the world"

Consistent performance cho live streaming applications

Ảnh minh hoạ AWS Global Accelerator

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon CloudFront**:
  → CloudFront là CDN service optimize cho HTTP/HTTPS content delivery, không phải TCP acceleration cho RTMP live streaming. RTMP requires persistent TCP connections mà CloudFront không optimize.

- **AWS Client VPN**:
  → Client VPN là VPN solution cho secure private network access, không phải network acceleration service. Không address requirement về TCP acceleration cho live streaming.

- **Amazon EC2 instances and AWS Elastic IP addresses**:
  → Static EC2 instances với Elastic IPs không provide global network acceleration. Reporters sẽ connect trực tiếp qua public internet mà không có optimization benefits.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Accelerated TCP connections" → AWS Global Accelerator
- "Global reporters" + "live streaming" → Global network optimization
- "Highest quality streams" → Network performance optimization
- RTMP protocol requires persistent TCP connections
- CloudFront = HTTP/HTTPS CDN, không phải TCP acceleration
- Global Accelerator = Layer 4 acceleration, CloudFront = Layer 7 CDN

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: global-accelerator](https://aws.amazon.com/global-accelerator/)

</details>

---

<div id="question-51"></div>

### Question 51: Provision a gateway endpoint for Amazon S3 in the VPC
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs an AWS Lambda function in private subnets in a VPC. The subnets have a default route to the internet through an Amazon EC2 NAT instance. The Lambda function processes input data and saves its output as an object to Amazon S3.

Intermittently, the Lambda function times out while trying to upload the object because of saturated traffic on the NAT instance's network. The company wants to access Amazon S3 without traversing the internet.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provision a transit gateway. Place transit gateway attachments in the private subnets where the Lambda function is running.
- **(B)** Provision a gateway endpoint for Amazon S3 in the VPC. Update the route tables of the subnets accordingly. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Increase the size of the EC2 NAT instance in the VPC to a network optimized instance type.
- **(D)** Replace the EC2 NAT instance with an AWS managed NAT gateway.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Lambda function chạy trong private subnets trong VPC
> - Subnets có default route to internet qua EC2 NAT instance
> - Lambda processes data và saves output to S3
> - Lambda timeout khi upload object do bão hoà traffic trên NAT instance
> - Muốn access S3 KHÔNG đi qua internet

**Phân tích giải pháp tối ưu:**
Provision a gateway endpoint for Amazon S3 in the VPC. Update the route tables of the subnets accordingly.

S3 Gateway Endpoint cho phép private connectivity từ VPC đến S3 mà không qua internet

Completely free - không tính phí cho Gateway Endpoint

Eliminates NAT instance traffic cho S3 access, giải quyết saturation issue

Direct routing từ private subnets đến S3 qua AWS backbone network

No internet traversal - traffic routing hoàn toàn trong AWS network

Không cho Lambda đi Internet, kết nối với S3 thông qua S3 Gateway Endpoint

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Replace the EC2 NAT instance with an AWS managed NAT gateway.**:
  → NAT Gateway vẫn route traffic qua internet để reach S3. Không giải quyết requirement về "without traversing internet". Cost cũng cao hơn.

- **(C) Increase the size of the EC2 NAT instance in the VPC to a network optimized instance type.**:
  → Chỉ temporarily giải quyết saturation issue nhưng vẫn route qua internet. Không address root requirement về private S3 access. Higher costs.

- **(A) Provision a transit gateway. Place transit gateway attachments in the private subnets where the Lambda function is running.**:
  → Transit Gateway không provide direct S3 connectivity. Vẫn cần route qua NAT cho internet access. Over-engineering và expensive cho simple S3 access requirement.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-52"></div>

### Question 52: Amazon Elastic Block Store (Amazon EBS) encryption and Amazon RDS encryption with ...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is running a highly sensitive application on Amazon EC2 backed by an Amazon RDS database. Compliance regulations mandate that all personally identifiable information (PII) be encrypted at rest.

Which solution should a solutions architect recommend to meet this requirement with the LEAST amount of changes to the infrastructure?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon Elastic Block Store (Amazon EBS) encryption and Amazon RDS encryption with AWS Key Management Service (AWS KMS) keys to encrypt instance and database volumes. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy AWS CloudHSM, generate encryption keys, and use the keys to encrypt database volumes.
- **(C)** Deploy AWS Certificate Manager to generate certificates. Use the certificates to encrypt the database volume.
- **(D)** Configure SSL encryption using AWS Key Management Service (AWS KMS) keys to encrypt database volumes.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Highly sensitive application trên EC2 với RDS database backend
> - Compliance regulations yêu cầu all PII encrypted at rest
> - Cần solution với LEAST amount of changes to infrastructure

**Phân tích giải pháp tối ưu:**
Configure Amazon Elastic Block Store (Amazon EBS) encryption and Amazon RDS encryption with AWS Key Management Service (AWS KMS) keys to encrypt instance and database volumes.

EBS encryption cho EC2 instance volumes và RDS encryption cho database

AWS KMS provide centralized key management cho both services

Least infrastructure changes vì chỉ enable encryption features có sẵn

Encryption at rest cho cả application layer (EC2) và database layer (RDS)

Native AWS integration với minimal configuration changes required

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy AWS Certificate Manager to generate certificates. Use the certificates to encrypt the database volume.**:
  → AWS Certificate Manager tạo SSL/TLS certificates cho transit encryption, không phải encryption at rest. Certificates không được sử dụng để encrypt storage volumes.

- **Deploy AWS CloudHSM, generate encryption keys, and use the keys to encrypt database volumes.**:
  → CloudHSM provide dedicated hardware security modules nhưng require significant infrastructure changes và higher complexity. Over-engineering cho requirement này khi KMS đã đáp ứng được.

- **Configure SSL encryption using AWS Key Management Service (AWS KMS) keys to encrypt database volumes.**:
  → SSL encryption là cho data in transit, không phải data at rest. KMS keys không được sử dụng trực tiếp cho SSL encryption configuration.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-53"></div>

### Question 53: Mount an Amazon Elastic File System (Amazon EFS) file system across all the EC2 in...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs its applications on Amazon EC2 instances that are backed by Amazon Elastic Block Store (Amazon EBS). The EC2 instances run the most recent Amazon Linux release. The applications are experiencing availability issues when the company's employees store and retrieve files that are 25 GB or larger. The company needs a solution that does not require the company to transfer files between EC2 instances. The files must be available across many EC2 instances and across multiple Availability Zones.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Mount an Amazon Elastic File System (Amazon EFS) file system across all the EC2 instances. Instruct the employees to access the files from the EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Migrate all the files to an Amazon S3 bucket. Instruct the employees to access the files from the S3 bucket.
- **(C)** Create an Amazon Machine Image (AMI) from the EC2 instances. Configure new EC2 instances from the AMI that use an instance store volume. Instruct the employees to access the files from the EC2 instances.
- **(D)** Take a snapshot of the existing EBS volume. Mount the snapshot as an EBS volume across the EC2 instances. Instruct the employees to access the files from the EC2 instances.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - EC2 instances backed by EBS chạy Amazon Linux
> - Availability issues khi employees store/retrieve files 25 GB or larger
> - Cần solution không require transfer files giữa EC2 instances
> - Files phải available across many EC2 instances và multiple AZs

**Phân tích giải pháp tối ưu:**
Mount an Amazon Elastic File System (Amazon EFS) file system across all the EC2 instances. Instruct the employees to access the files from the EC2 instances.

Amazon EFS là shared file system có thể mount đồng thời trên multiple EC2 instances

Multi-AZ availability built-in với automatic replication across AZs

No file transfers cần thiết giữa instances vì tất cả access same file system

Large file support được optimize cho files lớn như 25 GB+

POSIX-compliant file system hoạt động seamlessly với existing applications

How Amazon EFS works with Amazon EC2

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Migrate all the files to an Amazon S3 bucket. Instruct the employees to access the files from the S3 bucket.**:
  → S3 không phải file system, require application changes để access files. Employees sẽ cần different workflow thay vì accessing qua EC2 instances như current setup.

- **(D) Take a snapshot of the existing EBS volume. Mount the snapshot as an EBS volume across the EC2 instances. Instruct the employees to access the files from the EC2 instances.**:
  → EBS volumes không thể mount across multiple instances đồng thời. EBS volumes are single-instance attached storage, không shared storage.

- **Create an Amazon Machine Image (AMI) from the EC2 instances. Configure new EC2 instances from the AMI that use an instance store volume. Instruct the employees to access the files from the EC2 instances.**:
  → Instance store volumes không persistent và không shared across instances. Files sẽ lost khi instance stops và không solve sharing requirement.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Files available across many instances" → Shared file system (EFS)
- "Multiple AZs" → EFS automatic multi-AZ replication
- "Large files" + "availability issues" → EFS optimized cho large file performance
- EBS = single instance, EFS = shared across instances
- S3 = object storage, EFS = file system
- Instance store = ephemeral, không persistent

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How Amazon EFS works

</details>

---

<div id="question-54"></div>

### Question 54: An Amazon Route 53 multivalue answer routing policy
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company serves its website by using an Auto Scaling group of Amazon EC2 instances in a single AWS Region. The website does not require a database.

The company is expanding, and the company's engineering team deploys the website to a second Region. The company wants to distribute traffic across both Regions to accommodate growth and for disaster recovery purposes. The solution should not serve traffic from a Region in which the website is unhealthy.

Which policy or resource should the company use to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** An Amazon Route 53 simple routing policy
- **(B)** An Amazon Route 53 multivalue answer routing policy `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** An Application Load Balancer in one Region with a target group that specifies the EC2 instance IDs from both Regions
- **(D)** An Application Load Balancer in one Region with a target group that specifies the IP addresses of the EC2 instances from both Regions

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website sử dụng Auto Scaling group of EC2 instances trong single AWS Region
> - Website không require database
> - Company mở rộng và deploy website to second Region
> - Muốn distribute traffic across both Regions cho growth và disaster recovery
> - Solution không serve traffic từ Region where website is unhealthy

**Phân tích giải pháp tối ưu:**
An Amazon Route 53 multivalue answer routing policy.

Route 53 multivalue answer routing có thể return multiple IP addresses cho single DNS query

Built-in health checks để detect unhealthy endpoints và automatically remove from responses

Cross-region traffic distribution với ability để route traffic away từ unhealthy regions

Disaster recovery support với automatic failover khi one region becomes unhealthy

Cost-effective solution cho multi-region traffic distribution

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **An Amazon Route 53 simple routing policy.**:
  → Simple routing policy không support health checks và không thể automatically remove unhealthy regions từ DNS responses. Không meet requirement về avoiding unhealthy regions.

- **An Application Load Balancer in one Region with a target group that specifies the EC2 instance IDs from both Regions.**:
  → ALB không thể có targets trong different regions. ALB chỉ route traffic within same region, không support cross-region load balancing.

- **An Application Load Balancer in one Region with a target group that specifies the IP addresses of the EC2 instances from both Regions.**:
  → Tương tự, ALB không support cross-region targets. Target group members phải trong same region với ALB.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Distribute traffic across Regions" → Route 53 routing policies
- "Not serve from unhealthy Region" → Health checks required
- "Disaster recovery" → Multivalue answer routing với health checks
- ALB chỉ work within single region
- Simple routing không có health check capabilities
- Multivalue routing = multiple answers + health checks

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Multivalue answer routing

</details>

---

<div id="question-55"></div>

### Question 55: An AWS Transit Gateway in the networking team's AWS account
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company needs to connect several VPCs in the us-east-1 Region that span hundreds of AWS accounts. The company's networking team has its own AWS account to manage the cloud network.

What is the MOST operationally efficient solution to connect the VPCs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Transit Gateway in the networking team's AWS account. Configure static routes from each VPC. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy VPN gateways in each VPC. Create a transit VPC in the networking team's AWS account to connect to each VPC.
- **(C)** Configure a NAT gateway and an internet gateway in each VPC to connect each VPC through the internet
- **(D)** Set up VPC peering connections between each VPC. Update each associated subnet's route table

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần connect several VPCs trong us-east-1 Region
> - VPCs span hundreds of AWS accounts
> - Networking team có own AWS account để manage cloud network
> - Yêu cầu MOST operationally efficient solution

**Phân tích giải pháp tối ưu:**
Create an AWS Transit Gateway in the networking team's AWS account. Configure static routes from each VPC.

AWS Transit Gateway được thiết kế chuyên biệt cho large-scale VPC connectivity

Centralized management trong networking team's account

Hub-and-spoke model thay vì mesh connectivity giữa hundreds of VPCs

Cross-account sharing cho phép VPCs từ different accounts connect đến central Transit Gateway

Most operationally efficient cho scale lớn với hundreds of accounts

Architectural diagram

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Set up VPC peering connections between each VPC. Update each associated subnet's route table.**:
  VPC peering tạo mesh topology với n(n-1)/2 connections.
  Với hundreds of VPCs = thousands of peering connections.
  Extremely complex route table management và operational overhead.

- **Configure a NAT gateway and an internet gateway in each VPC to connect each VPC through the internet.**:
  Routing qua internet không secure cho internal VPC communication.
  Higher latency, security risks, và không phải best practice cho VPC-to-VPC connectivity.

- **Deploy VPN gateways in each VPC. Create a transit VPC in the networking team's AWS account to connect to each VPC.**:
  VPN gateways trong each VPC tạo high operational overhead.
  Transit VPC approach là older pattern được replaced bởi Transit Gateway với better performance và management.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-56"></div>

### Question 56: An Amazon Aurora MySQL Multi-AZ DB cluster with multiple read replicas
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is migrating a three-tier application to AWS. The application requires a MySQL database. In the past, the application users reported poor application performance when creating new entries. These performance issues were caused by users generating different real-time reports from the application during working hours.

Which solution will improve the performance of the application when it is moved to AWS?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon Aurora MySQL Multi-AZ DB cluster with multiple read replicas. Configure the application to use the reader endpoint for reports. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create the database on a compute optimized Amazon EC2 instance. Ensure compute resources exceed the on-premises database.
- **(C)** Import the data into an Amazon DynamoDB table with provisioned capacity. Refactor the application to use DynamoDB for reports.
- **(D)** Create an Amazon Aurora MySQL Multi-AZ DB cluster. Configure the application to use the backup instance of the cluster as an endpoint for the reports.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company migrate three-tier application lên AWS với MySQL database
> - Poor application performance khi creating new entries
> - Performance issues do users generating real-time reports during working hours
> - Cần solution để improve performance when moved to AWS

**Phân tích giải pháp tối ưu:**
Create an Amazon Aurora MySQL Multi-AZ DB cluster with multiple read replicas. Configure the application to use the reader endpoint for reports.

Read replicas tách biệt read traffic (reports) khỏi write traffic (creating entries)

Reader endpoint automatically distribute report queries across multiple read replicas

Write operations vẫn route đến primary instance, không bị impact bởi report queries

Aurora MySQL compatible với existing MySQL application

Multi-AZ cung cấp high availability cho production workload

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Import the data into an Amazon DynamoDB table with provisioned capacity. Refactor the application to use DynamoDB for reports.**:
  Require significant application refactoring từ relational MySQL sang NoSQL DynamoDB.
  High development effort và risk khi migrate existing three-tier application.

- **Create the database on a compute optimized Amazon EC2 instance. Ensure compute resources exceed the on-premises database.**:
  Chỉ tăng compute power không giải quyết root cause.
  Issue là resource contention giữa write operations và report queries, không phải thiếu compute resources.

- **Create an Amazon Aurora MySQL Multi-AZ DB cluster. Configure the application to use the backup instance of the cluster as an endpoint for the reports.**:
  Backup instance trong Multi-AZ setup không available cho read operations.
  Multi-AZ backup chỉ activate during failover, không phải read replica.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Poor performance" + "reports during working hours" → Read replicas để separate workloads
- "Creating entries" vs "generating reports" → Write vs Read separation

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Scaling reads for your MySQL database with Amazon Aurora

</details>

---

<div id="question-57"></div>

### Question 57: The AWS Snow Family console to order several AWS Snowball Edge Storage Optimized d...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company needs to transfer 600 TB of data from its on-premises network-attached storage (NAS) system to the AWS Cloud. The data transfer must be complete within 2 weeks. The data is sensitive and must be encrypted in transit. The company’s internet connection can support an upload speed of 100 Mbps.

Which solution meets these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a 10 Gbps AWS Direct Connect connection between the company location and the nearest AWS Region. Transfer the data over a VPN connection into the Region to store the data in Amazon S3.
- **(B)** Use Amazon S3 multi-part upload functionality to transfer the files over HTTPS.
- **(C)** Use the AWS Snow Family console to order several AWS Snowball Edge Storage Optimized devices. Use the devices to transfer the data to Amazon S3. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a VPN connection between the on-premises NAS system and the nearest AWS Region. Transfer the data over the VPN connection.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần transfer 600 TB data từ on-premises NAS lên AWS Cloud
> - Data transfer phải hoàn thành trong 2 weeks
> - Data sensitive và must be encrypted in transit
> - Internet connection support 100 Mbps upload speed
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Use the AWS Snow Family console to order several AWS Snowball Edge Storage Optimized devices. Use the devices to transfer the data to Amazon S3.

600 TB trong 2 weeks = impossible với 100 Mbps connection (would take ~138 days)

Snowball Edge Storage Optimized có capacity 80 TB per device, cần ~8 devices

Physical transfer bypass bandwidth limitations và complete trong 2 tuần

Cost-effective cho large data volumes so với network transfer costs

Encryption in transit built-in với Snowball devices

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon S3 multi-part upload functionality over HTTPS.**:
  → 100 Mbps = ~600 TB sẽ mất khoảng 138 days để transfer. Không meet 2-week requirement. HTTPS encryption đúng nhưng bandwidth insufficient.

- **Create a VPN connection between the on-premises NAS system and the nearest AWS Region. Transfer the data over the VPN connection.**:
  → VPN vẫn limited bởi 100 Mbps internet connection. Timeframe vẫn ~138 days, không meet 2-week deadline.

- **(A) Set up a 10 Gbps AWS Direct Connect connection between the company location and the nearest AWS Region. Transfer the data over a VPN connection into the Region to store the data in Amazon S3.**:
  → Direct Connect setup takes weeks/months để provision. High cost và không available trong 2-week timeframe. Over-engineering cho one-time transfer.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-58"></div>

### Question 58: An AWS Transfer Family server with SFTP endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has an on-premises SFTP file transfer solution. The company is migrating to the AWS Cloud to scale the file transfer solution and to optimize costs by using Amazon S3. The company's employees will use their credentials for the on-premises Microsoft Active Directory (AD) to access the new solution. The company wants to keep the current authentication and file access mechanisms.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an S3 File Gateway. Create SMB file shares on the file gateway that use the existing Active Directory to authenticate.
- **(B)** Configure an Auto Scaling group with Amazon EC2 instances to run an SFTP solution. Configure the group to scale up at 60% CPU utilization.
- **(C)** Create an AWS Transfer Family SFTP endpoint. Configure the endpoint to use the AWS Directory Service option as the identity provider to connect to the existing Active Directory.
- **(D)** Create an AWS Transfer Family server with SFTP endpoints. Choose the AWS Directory Service option as the identity provider. Use AD Connector to connect the on-premises Active Directory. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có on-premises SFTP file transfer solution
> - Migrate lên AWS Cloud để scale và optimize costs bằng S3
> - Employees sử dụng credentials từ on-premises Microsoft AD
> - Muốn keep current authentication và file access mechanisms
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an AWS Transfer Family server with SFTP endpoints. Choose the AWS Directory Service option as the identity provider. Use AD Connector to connect the on-premises Active Directory.

AWS Transfer Family được thiết kế chuyên biệt cho managed SFTP services

Native integration với existing Microsoft AD qua AD Connector

Least operational overhead vì fully managed service, không cần maintain servers

Keep current authentication - employees continue using AD credentials

SFTP protocol compatibility với existing file transfer mechanisms

Automatic S3 integration cho cost optimization

Architecture

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an S3 File Gateway. Create SMB file shares on the file gateway that use the existing Active Directory to authenticate.**:
  S3 File Gateway cung cấp SMB/NFS access, không phải SFTP protocol.
  Không maintain current SFTP file access mechanisms.

- **Configure an Auto Scaling group with Amazon EC2 instances to run an SFTP solution. Configure the group to scale up at 60% CPU utilization.**:
  High operational overhead với self-managed EC2 instances.
  Cần maintain, patch, và configure SFTP servers manually.
  Không meet "least operational overhead" requirement.

- **Create an AWS Transfer Family SFTP endpoint. Configure the endpoint to use the AWS Directory Service option as the identity provider to connect to the existing Active Directory.**:
  Không nói rõ về cơ chế AD Connector
  Missing chi tiết về how to connect với on-premises AD, có thể thực hiện nhưng mơ hồ

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SFTP" + "managed solution" → AWS Transfer Family
- "On-premises AD" + "least overhead" → AD Connector
- "Keep current mechanisms" → Native protocol support (SFTP)
- Transfer Family fully managed, EC2 SFTP = self-managed
- AD Connector bridges on-premises AD với AWS services

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Getting started with AWS Transfer Family server endpoints
- Create an SFTP-enabled server
- What is AWS Directory Service?
- AD Connector

</details>

---

<div id="question-59"></div>

### Question 59: Implement an AWS Site-to-Site VPN connection
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company needs a secure connection between its on-premises environment and AWS. This connection does not need high bandwidth and will handle a small amount of traffic. The connection should be set up quickly.

What is the MOST cost-effective method to establish this type of connection?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Implement a client VPN.
- **(B)** Implement AWS Direct Connect.
- **(C)** Implement a bastion host on Amazon EC2.
- **(D)** Implement an AWS Site-to-Site VPN connection. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần secure connection giữa on-premises environment và AWS
> - Connection không cần high bandwidth và handle small amount of traffic
> - Connection cần set up quickly
> - Yêu cầu MOST cost-effective method

**Phân tích giải pháp tối ưu:**
Implement an AWS Site-to-Site VPN connection.

Site-to-Site VPN được thiết kế chuyên biệt cho secure connection giữa on-premises và AWS

Cost-effective với low monthly charges và no upfront costs

Quick setup - có thể establish trong vài giờ thay vì cả tháng như Direct Connect

Suitable cho low bandwidth requirements với small traffic volumes

IPsec encryption cung cấp secure tunnel qua internet

Architecture ví dụ

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Implement a client VPN.**:
  → Client VPN dành cho individual user access từ remote locations, không phải site-to-site connectivity giữa entire on-premises network và AWS.

- **(B) Implement AWS Direct Connect.**:
  → Direct Connect require physical dedicated connection với high setup costs và long provisioning time (weeks/months). Over-engineering cho small traffic requirements và không quick setup.

- **(C) Implement a bastion host on Amazon EC2.**:
  → Bastion host chỉ provide secure access đến specific resources, không phải full network connectivity giữa on-premises và AWS. Limited scope so với site-to-site connection.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Secure connection" + "on-premises to AWS" → Site-to-Site VPN
- "Small traffic" + "cost-effective" → VPN thay vì Direct Connect
- "Set up quickly" → VPN setup nhanh, Direct Connect chậm
- Client VPN = individual users, Site-to-Site VPN = networks
- Direct Connect = high bandwidth + high cost + long setup time

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is AWS Site-to-Site VPN?

</details>

---

<div id="question-60"></div>

### Question 60: Amazon Neptune to store the datasets with edges and vertices
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has 5 TB of datasets. The datasets consist of 1 million user profiles and 10 million connections. The user profiles have connections as many-to-many relationships. The company needs a performance efficient way to find mutual connections up to five levels.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon RDS to store the datasets with multiple tables. Perform SQL JOIN queries to find connections.
- **(B)** Use an Amazon S3 bucket to store the datasets. Use Amazon QuickSight to visualize connections.
- **(C)** Use Amazon Neptune to store the datasets with edges and vertices. Query the data to find connections. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use an Amazon S3 bucket to store the datasets. Use Amazon Athena to perform SQL JOIN queries to find connections.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - 5 TB datasets với 1 million user profiles và 10 million connections
> - User profiles có many-to-many relationships với connections
> - Cần performance efficient way để find mutual connections up to five levels
> - Yêu cầu solution cho complex relationship queries

**Phân tích giải pháp tối ưu:**
Use Amazon Neptune to store the datasets with edges and vertices. Query the data to find connections.

Amazon Neptune là graph database được thiết kế chuyên biệt cho relationship data

Performance efficient cho complex relationship queries như finding connections 5 levels deep

Many-to-many relationships được handle naturally trong graph databases

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use an Amazon S3 bucket to store the datasets. Use Amazon Athena to perform SQL JOIN queries to find connections.**:
  SQL JOINs trở nên cực kỳ complex và slow cho multi-level relationship queries.
  Athena không optimize cho graph traversal patterns với 5 levels deep.

- **(B) Use an Amazon S3 bucket to store the datasets. Use Amazon QuickSight to visualize connections.**:
  QuickSight là visualization tool, không phải query engine cho complex relationship analysis.
  Không solve performance requirement cho finding mutual connections.

- **(A) Use Amazon RDS to store the datasets with multiple tables. Perform SQL JOIN queries to find connections.**:
  Relational databases với SQL JOINs không hiệu quả cho multi-level graph traversal.
  Complex recursive queries với 5 levels sẽ có poor performance với large datasets.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Many-to-many relationships" + "mutual connections" → Graph database (Neptune)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Visualizing graph data in Amazon Neptune notebooks

</details>

---

<div id="question-61"></div>

### Question 61: An S3 Lifecycle rule to transition objects to the S3 Intelligent-Tiering storage c...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company uses an Amazon S3 bucket as its data lake storage platform. The S3 bucket contains a massive amount of data that is accessed randomly by multiple teams and hundreds of applications. The company wants to reduce the S3 storage costs and provide immediate availability for frequently accessed objects.

What is the MOST operationally efficient solution that meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store objects in Amazon S3 Glacier. Use S3 Select to provide applications with access to the data.
- **(B)** Transition objects to the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Create an AWS Lambda function to transition objects to the S3 Standard storage class when they are accessed by an application.
- **(C)** Use data from S3 storage class analysis to create S3 Lifecycle rules to automatically transition objects to the S3 Standard-Infrequent Access (S3 Standard-IA) storage class.
- **(D)** Create an S3 Lifecycle rule to transition objects to the S3 Intelligent-Tiering storage class. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - S3 bucket làm data lake storage platform với massive amount of data
> - Data được accessed randomly bởi multiple teams và hundreds of applications
> - Muốn reduce S3 storage costs và provide immediate availability cho frequently accessed objects
> - Yêu cầu MOST operationally efficient solution

**Phân tích giải pháp tối ưu:**
Create an S3 Lifecycle rule to transition objects to the S3 Intelligent-Tiering storage class.

S3 Intelligent-Tiering tự động move objects giữa access tiers based trên usage patterns

Automatic optimization không cần manual analysis hay configuration

Immediate availability cho frequently accessed objects

Cost reduction cho infrequently accessed objects

Most operationally efficient vì no ongoing management required

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Store objects in Amazon S3 Glacier. Use S3 Select to provide applications with access to the data.**:
  Glacier có retrieval delays (minutes to hours), không provide immediate availability cho frequently accessed objects.
  S3 Select không loại bỏ retrieval time.

- **(C) Use data from S3 storage class analysis to create S3 Lifecycle rules to automatically transition objects to the S3 Standard-Infrequent Access (S3 Standard-IA) storage class.**:
  Require manual analysis và configuration của lifecycle rules.
  Higher operational overhead so với Intelligent-Tiering automatic optimization.

- **(B) Transition objects to the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Create an AWS Lambda function to transition objects to the S3 Standard storage class when they are accessed by an application.**:
  Complex Lambda-based solution với high operational overhead.
  Require monitoring, maintenance, và custom code.
  Không immediate availability vì objects start trong IA tier.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Random access" + "immediate availability" → S3 Intelligent-Tiering
- "MOST operationally efficient" → Automatic solutions thay vì manual management
- "Reduce costs" + "frequently accessed" → Dynamic tiering based trên access patterns
- Intelligent-Tiering automatically adapts to changing access patterns
- Glacier có retrieval delays, không immediate availability
- Lambda solutions tăng operational complexity

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Managing S3 Intelligent-Tiering

</details>

---

<div id="question-62"></div>

### Question 62: Copy the code into an AWS Lambda function that has 1 GB of memory
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs a Java-based job on an Amazon EC2 instance. The job runs every hour and takes 10 seconds to run. The job runs on a scheduled interval and consumes 1 GB of memory. The CPU utilization of the instance is low except for short surges during which the job uses the maximum CPU available. The company wants to optimize the costs to run the job.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS App2Container (A2C) to containerize the job. Run the job as an Amazon Elastic Container Service (Amazon ECS) task on AWS Fargate with 0.5 virtual CPU (vCPU) and 1 GB of memory.
- **(B)** Configure the existing schedule to stop the EC2 instance at the completion of the job and restart the EC2 instance when the next job starts.
- **(C)** Copy the code into an AWS Lambda function that has 1 GB of memory. Create an Amazon EventBridge scheduled rule to run the code each hour. `[Đáp án đúng ✅]`
- **(D)** Use AWS App2Container (A2C) to containerize the job. Install the container in the existing Amazon Machine Image (AMI). Ensure that the schedule stops the container when the task finishes.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Java-based job chạy trên EC2 instance
> - Job chạy every hour, takes 10 seconds, sử dụng 1 GB memory
> - Low CPU utilization ngoại trừ short surges khi job uses maximum CPU
> - Muốn optimize costs để run job

**Phân tích giải pháp tối ưu:**
Copy the code into an AWS Lambda function that has 1 GB of memory. Create an Amazon EventBridge scheduled rule to run the code each hour.

Lambda perfect cho short-duration, infrequent tasks (10 seconds mỗi hour)

Pay only for execution time thay vì EC2 instance chạy 24/7

EventBridge scheduled rule handle hourly scheduling automatically

Cost optimization extreme - từ 24/7 EC2 costs xuống 10 seconds/hour Lambda execution

1 GB memory match với requirement và Lambda supports up to 10 GB

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use AWS App2Container (A2C) to containerize the job. Run the job as an Amazon Elastic Container Service (Amazon ECS) task on AWS Fargate with 0.5 virtual CPU (vCPU) and 1 GB of memory.**:
  → Fargate vẫn có minimum billing duration và costs cao hơn Lambda cho very short tasks. 0.5 vCPU có thể không đủ cho "maximum CPU" surges.

- **(D) Use AWS App2Container (A2C) to containerize the job. Install the container in the existing Amazon Machine Image (AMI). Ensure that the schedule stops the container when the task finishes.**:
  → Vẫn require EC2 instance running 24/7 để host container. Minimal cost savings so với current setup.

- **Configure the existing schedule to stop the EC2 instance at the completion of the job and restart the EC2 instance when the next job starts.**:
  → EC2 stop/start cycles tốn thời gian (minutes) và có costs cho storage (EBS). Instance startup time có thể longer than 10-second job duration.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-63"></div>

### Question 63: The cluster to use the Aurora I/O-Optimized storage configuration
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is planning to deploy its application on an Amazon Aurora PostgreSQL Serverless v2 cluster. The application will receive large amounts of traffic. The company wants to optimize the storage performance of the cluster as the load on the application increases.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the cluster to use the Aurora Standard storage configuration.
- **(B)** Configure the cluster storage type as Provisioned IOPS.
- **(C)** Configure the cluster to use the Aurora I/O-Optimized storage configuration. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Configure the cluster storage type as General Purpose.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Aurora PostgreSQL Serverless v2 cluster sẽ receive large amounts of traffic
> - Muốn optimize storage performance khi load increases
> - Yêu cầu MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Configure the cluster to use the Aurora I/O-Optimized storage configuration.

Aurora I/O-Optimized được thiết kế chuyên biệt cho high I/O workloads

Better cost-effectiveness cho applications với high I/O operations vì pricing model khác

Optimized performance cho large traffic volumes với reduced I/O costs

Automatic scaling của I/O performance without manual intervention

Most suitable cho scenarios với "large amounts of traffic"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the cluster to use the Aurora Standard storage configuration.**:
  → Aurora Standard tính phí per I/O request, có thể expensive với large traffic volumes. Không optimize cho high I/O workloads.

- **Configure the cluster storage type as Provisioned IOPS.**:
  → Provisioned IOPS require pre-allocation và payment cho specific IOPS capacity. Higher costs và less flexible cho variable workloads trong Serverless v2.

- **Configure the cluster storage type as General Purpose.**:
  → General Purpose storage có performance limitations và burstable IOPS. Không optimal cho consistently high traffic applications.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Large amounts of traffic" → High I/O requirements
- "Aurora Serverless v2" + "cost-effective" → I/O-Optimized better pricing model

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Storage configurations for Amazon Aurora DB clusters

</details>

---

<div id="question-64"></div>

### Question 64: AWS IAM Identity Center
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is migrating applications from an on-premises Microsoft Active Directory that the company manages to AWS. The company deploys the applications in multiple AWS accounts. The company uses AWS Organizations to manage the accounts centrally.

The company's security team needs a single sign-on solution across all the company's AWS accounts. The company must continue to manage users and groups that are in the on-premises Active Directory.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Enterprise Edition Active Directory in AWS Directory Service for Microsoft Active Directory. Configure the Active Directory to be the identity source for AWS IAM Identity Center.
- **(B)** Use AWS Directory Service and create a two-way trust relationship with the company's self-managed Active Directory.
- **(C)** Enable AWS IAM Identity Center. Configure a two-way forest trust relationship to connect the company's self-managed Active Directory with IAM Identity Center by using AWS Directory Service for Microsoft Active Directory. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Deploy an identity provider (IdP) on Amazon EC2. Link the IdP as an identity source within AWS IAM Identity Center.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company migrate từ on-premises Microsoft Active Directory lên AWS
> - Applications deploy trong multiple AWS accounts managed bởi AWS Organizations
> - Security team cần single sign-on solution across all AWS accounts
> - Company must continue to manage users và groups trong on-premises Active Directory

**Phân tích giải pháp tối ưu:**
Enable AWS IAM Identity Center. Configure a two-way forest trust relationship to connect the company's self-managed Active Directory with IAM Identity Center by using AWS Directory Service for Microsoft Active Directory.

AWS IAM Identity Center (formerly AWS SSO) là solution chuyên biệt cho single sign-on across multiple AWS accounts

Two-way forest trust cho phép users và groups từ on-premises AD được used trong AWS

Continue managing users trong on-premises - không cần migrate users/groups

AWS Directory Service acts as bridge giữa on-premises AD và IAM Identity Center

Centralized SSO across all accounts trong Organizations

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Enterprise Edition Active Directory in AWS Directory Service for Microsoft Active Directory. Configure the Active Directory to be the identity source for IAM Identity Center.**:
  → Tạo new AD trong AWS yêu cầu migrating users/groups, không meet requirement về continuing to manage users trong on-premises AD.

- **(B) Use AWS Directory Service and create a two-way trust relationship with the company's self-managed Active Directory.**:
  → Directory Service alone không provide SSO capabilities across multiple AWS accounts. Missing IAM Identity Center component cho centralized access management.

- **Deploy an identity provider (IdP) on Amazon EC2. Link the IdP as an identity source within AWS IAM Identity Center.**:
  → Self-managed IdP trên EC2 có high operational overhead và complexity. Không tận dụng existing on-premises AD infrastructure hiệu quả.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Single sign-on" + "multiple AWS accounts" → AWS IAM Identity Center
- "Continue managing on-premises AD" → Two-way trust relationship
- IAM Identity Center = modern SSO solution for AWS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Managed Microsoft AD
- Creating a trust relationship between your AWS Managed Microsoft AD and self-managed AD

</details>

---

<div id="question-65"></div>

### Question 65: An AWS Key Management Service (AWS KMS) customer managed key
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is planning to migrate data to an Amazon S3 bucket. The data must be encrypted at rest within the S3 bucket. The encryption key must be rotated automatically every year.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Key Management Service (AWS KMS) customer managed key. Enable automatic key rotation. Set the S3 bucket's default encryption behavior to use the customer managed KMS key. Migrate the data to the S3 bucket.
- **(B)** Migrate the data to the S3 bucket. Use server-side encryption with Amazon S3 managed keys (SSE-S3). Use the built-in key rotation behavior of SSE-S3 encryption keys.
- **(C)** Create an AWS Key Management Service (AWS KMS) customer managed key. Set the S3 bucket's default encryption behavior to use the customer managed KMS key. Migrate the data to the S3 bucket. Manually rotate the KMS key every year. `[Đáp án đúng ✅]`
- **(D)** Use customer key material to encrypt the data. Migrate the data to the S3 bucket. Create an AWS Key Management Service (AWS KMS) key without key material. Import the customer key material into the KMS key. Enable automatic key rotation.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Migrate data to S3 bucket với encryption at rest requirement
> - Encryption key must be rotated automatically every year
> - Yêu cầu LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an AWS Key Management Service (AWS KMS) customer managed key. Enable automatic key rotation. Set the S3 bucket's default encryption behavior to use the customer managed KMS key. Migrate the data to the S3 bucket.

KMS customer managed keys có guaranteed automatic rotation every 365 days khi enabled

Documented rotation schedule meet compliance requirements cho yearly rotation

SSE-KMS cung cấp encryption at rest với predictable key rotation

Automatic rotation eliminates manual intervention và operational errors

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Migrate the data to the S3 bucket. Use server-side encryption with Amazon S3 managed keys (SSE-S3). Use the built-in key rotation behavior of SSE-S3 encryption keys.**:
  → AWS không publish rotation frequency cho SSE-S3 keys. Không guarantee yearly rotation requirement. Built-in rotation frequency không documented.
  https://repost.aws/questions/QUES_1VN01TU-eRSO3LXergA/s3-managed-key-sse-s3-rotation-period

- **Create an AWS Key Management Service (AWS KMS) customer managed key. Set the S3 bucket's default encryption behavior to use the customer managed KMS key. Migrate the data to the S3 bucket. Manually rotate the KMS key every year.**:
  → Manual rotation tạo operational overhead và risk of human error. Không meet "least operational overhead" requirement.

- **(D) Use customer key material to encrypt the data. Migrate the data to the S3 bucket. Create an AWS Key Management Service (AWS KMS) key without key material. Import the customer key material into the KMS key. Enable automatic key rotation.**:
  → Customer-provided key material không support automatic rotation trong KMS. Very high operational overhead với key material management.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Automatically every year" → KMS customer managed keys với documented 365-day rotation
- "Guaranteed rotation frequency" → KMS, không phải SSE-S3
- SSE-S3 = undocumented rotation frequency

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using server-side encryption with AWS KMS keys (SSE-KMS)
- Reducing the cost of SSE-KMS with Amazon S3 Bucket Keys

</details>

---

