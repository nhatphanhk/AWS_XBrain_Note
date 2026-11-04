# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Cloud Mentor Practice Test 5

> **Nền tảng luyện thi**: Cloud Mentor AWS Practice Exams (SAA-C03)  
> **Bộ đề**: Practice Test 05 - Results & In-Depth Architecture Review (65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **49 câu** | $\ge 47$  câu (72%) | Đạt tiêu chuẩn ✅ |
| **Số câu trả lời sai / bỏ qua (Incorrect & Skipped)** | **16 câu** | $\le 18$  câu | Cần tập trung ôn tập ⚠️ |
| **Tỷ lệ chính xác (Overall Score)** | **75.38% (~754 / 1000)** | $\ge 72.0\%$ (720 / 1000) | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 23 câu | 18 câu | 5 câu | **78.3%** | Tốt 🟡 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 23 câu | 16 câu | 7 câu | **69.6%** | Cần củng cố 🔴 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 9 câu | 8 câu | 1 câu | **88.9%** | Xuất sắc 🟢 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 10 câu | 7 câu | 3 câu | **70%** | Cần củng cố 🔴 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **49 câu** | **16 câu** | **75.38%** | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |

---

## 🎯 2. Danh Sách 16 Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp 16 câu trả lời chưa chính xác và bỏ qua trong bài thi thử này. Hãy rà soát kỹ các bẫy đề bài, nguyên lý kiến trúc cốt lõi và bài học thực tế trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 03** | Domain 2 | **An Amazon CloudWatch alarm to recover the EC2 instance in case of failure** | Company chạy legacy system trên Amazon EC2 instance<br>"Improve recovery time" → focus vào instance failure recovery, không phải storage performance | [👉 Xem](#question-03) |
| **Câu 06** | Domain 1 | **Put the EC2 instances behind Application Load Balancers (ALBs) in each Region** | Company có users all around the world accessing HTTP-based application deployed trên EC2 instances trong multiple AWS Regions<br>"Static IP addresses required" → AWS Global Accelerator (không phải CloudFront) | [👉 Xem](#question-06) |
| **Câu 07** | Domain 2 | **AWS Transfer for SFTP and an Amazon Elastic File System (Amazon EFS) file system f...** | Company có nightly batch processing routine analyze report files nhận daily qua SFTP<br>"Minimize operational effort" → Managed services + no application changes | [👉 Xem](#question-07) |
| **Câu 08** | Domain 2 | **Amazon Simple Queue Service (Amazon SQS) FIFO queues as the messaging component be...** | Company có multi-tier payment processing application based on VMs<br>"Least infrastructure management" → Serverless services (Lambda, SQS) | [👉 Xem](#question-08) |
| **Câu 11** | Domain 1 | **Modify the configuration of AWS WAF to add an IP match condition to block the mali...** | Company website bán products cho public, chạy trên EC2 instances trong Auto Scaling group behind ALB<br>"CloudFront + WAF architecture" → WAF at CloudFront level blocks traffic sớm nhất | [👉 Xem](#question-11) |
| **Câu 18** | Domain 2 | **An Amazon Route 53 public hosted zone for the domain name** | DNS provider hiện tại đang gặp outages gây service disruption cho website chạy trên AWS<br>"Public website DNS" → Route 53 public hosted zone | [👉 Xem](#question-18) |
| **Câu 20** | Domain 2 | **Send the requests from the API Gateway REST API to Amazon EventBridge** | Company đang xây dựng ứng dụng mới sử dụng serverless architecture<br>"Message filtering + least operational overhead" → EventBridge với detailed rules | [👉 Xem](#question-20) |
| **Câu 22** | Domain 1 | **The Amazon RDS Protection feature in Amazon GuardDuty for the member accounts of t...** | Ecommerce company chạy applications trong AWS accounts thuộc organization trong AWS Organizations<br>"Identify abnormal failed login attempts" → GuardDuty RDS Protection specialized cho database threats | [👉 Xem](#question-22) |
| **Câu 27** | Domain 4 | **An S3 Lifecycle policy that deletes incomplete multipart uploads** | Company duy trì khoảng 300 TB trong Amazon S3 Standard storage hàng tháng<br>"Costs increasing mặc dù object count/size không thay đổi" → Hidden storage costs từ incomplete parts | [👉 Xem](#question-27) |
| **Câu 36** | Domain 4 | **A daily budget for the Savings Plans by using AWS Budgets** | Company sử dụng EC2, AWS Fargate, và AWS Lambda để chạy multiple workloads<br>"Coverage drops notification" → AWS Budgets coverage threshold alerts | [👉 Xem](#question-36) |
| **Câu 37** | Domain 4 | **The photos in the Amazon S3 Intelligent-Tiering storage class** | Company chạy photo hosting service trong us-east-1 Region<br>"Unpredictable access patterns" → S3 Intelligent-Tiering automatic optimization | [👉 Xem](#question-37) |
| **Câu 40** | Domain 1 | **Attach the SCP to the three nonproduction Organizations member accounts and an OU ...** | Company có organization trong AWS Organizations với 4 AWS accounts trong root OU<br>"Nonproduction accounts only" → Target specific accounts hoặc create separate OU | [👉 Xem](#question-40) |
| **Câu 43** | Domain 2 | **A read replica of the database** | Company host database trên RDS instance deployed to multiple Availability Zones<br>"Script affects critical application performance" → Read replica isolates workloads | [👉 Xem](#question-43) |
| **Câu 44** | Domain 2 | **Define an AWS Database Migration Service (AWS DMS) task with change data capture (...** | Company chạy three-tier application trong VPC với database tier sử dụng Amazon RDS for MySQL<br>"MySQL to PostgreSQL migration" → Cross-engine migration cần DMS + SCT | [👉 Xem](#question-44) |
| **Câu 49** | Domain 3 | **Internal Network Load Balancers in front of the application in each Region and an ...** | Gaming company muốn launch internet-facing application trong multiple AWS Regions<br>"TCP and UDP protocols" → Network Load Balancer là only option | [👉 Xem](#question-49) |
| **Câu 52** | Domain 1 | **Provision an internet-facing Application Load Balancer (ALB) in a public subnet** | Corporate security mandate yêu cầu launch tất cả EC2 instances trong private subnet<br>"Private subnet + external access" → Load balancer trong public subnet | [👉 Xem](#question-52) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ✅ Đúng | [Newer movie video files in S3 Standard](#question-01) | Domain 3 |
| [02](#question-02) | ✅ Đúng | [Amazon Elastic Container Service (Amazon ECS)](#question-02) | Domain 2 |
| [03](#question-03) | ❌ Sai | [An Amazon CloudWatch alarm to recover the EC2 instance in case of failure](#question-03) | Domain 2 |
| [04](#question-04) | ✅ Đúng | [An Object Lambda Access Point](#question-04) | Domain 2 |
| [05](#question-05) | ✅ Đúng | [Amazon RDS Proxy in front of the Aurora database](#question-05) | Domain 2 |
| [06](#question-06) | ❌ Sai | [Put the EC2 instances behind Application Load Balancers (ALBs) in each Region](#question-06) | Domain 1 |
| [07](#question-07) | ❌ Sai | [AWS Transfer for SFTP and an Amazon Elastic File System (Amazon EFS) file system f...](#question-07) | Domain 2 |
| [08](#question-08) | ❌ Sai | [Amazon Simple Queue Service (Amazon SQS) FIFO queues as the messaging component be...](#question-08) | Domain 2 |
| [09](#question-09) | ✅ Đúng | [Attach the AdministratorAccess identity-based policy to the IAM user group](#question-09) | Domain 1 |
| [10](#question-10) | ✅ Đúng | [AWS IAM Identity Center (AWS Single Sign-On)](#question-10) | Domain 1 |
| [11](#question-11) | ❌ Sai | [Modify the configuration of AWS WAF to add an IP match condition to block the mali...](#question-11) | Domain 1 |
| [12](#question-12) | ✅ Đúng | [CloudWatch cross-account observability for the monitoring account](#question-12) | Domain 1 |
| [13](#question-13) | ✅ Đúng | [Run the EC2 instances in a cluster placement group and and configure enhanced netw...](#question-13) | Domain 3 |
| [14](#question-14) | ✅ Đúng | [IAM users for daily administrative tasks](#question-14) | Domain 1 |
| [15](#question-15) | ✅ Đúng | [A Network Load Balancer with an associated Elastic IP address](#question-15) | Domain 2 |
| [16](#question-16) | ✅ Đúng | [Download AWS-provided root certificates](#question-16) | Domain 1 |
| [17](#question-17) | ✅ Đúng | [AWS AppConfig to store and manage the application configuration](#question-17) | Domain 1 |
| [18](#question-18) | ❌ Sai | [An Amazon Route 53 public hosted zone for the domain name](#question-18) | Domain 2 |
| [19](#question-19) | ✅ Đúng | [A list of unencrypted objects by filtering an Amazon S3 Inventory report](#question-19) | Domain 1 |
| [20](#question-20) | ❌ Sai | [Send the requests from the API Gateway REST API to Amazon EventBridge](#question-20) | Domain 2 |
| [21](#question-21) | ✅ Đúng | [S3 Same-Region Replication to replicate logs from the S3 buckets to another S3 buc...](#question-21) | Domain 4 |
| [22](#question-22) | ❌ Sai | [The Amazon RDS Protection feature in Amazon GuardDuty for the member accounts of t...](#question-22) | Domain 1 |
| [23](#question-23) | ✅ Đúng | [AWS WAF to protect the application](#question-23) | Domain 1 |
| [24](#question-24) | ✅ Đúng | [Implement an Amazon ElastiCache for Redis cluster between the application and the ...](#question-24) | Domain 4 |
| [25](#question-25) | ✅ Đúng | [Predictive scaling to forecast and scale](#question-25) | Domain 2 |
| [26](#question-26) | ✅ Đúng | [Deletion protection on the DynamoDB tables](#question-26) | Domain 1 |
| [27](#question-27) | ❌ Sai | [An S3 Lifecycle policy that deletes incomplete multipart uploads](#question-27) | Domain 4 |
| [28](#question-28) | ✅ Đúng | [The Kubernetes Cluster Autoscaler to manage the number of nodes in the cluster](#question-28) | Domain 3 |
| [29](#question-29) | ✅ Đúng | [Generate and provide CloudFront signed URLs to premium customers](#question-29) | Domain 2 |
| [30](#question-30) | ✅ Đúng | [A transit gateway, and associate the Direct Connect connection with a new transit VIF](#question-30) | Domain 1 |
| [31](#question-31) | ✅ Đúng | [An AWS Lambda function that runs custom developed code](#question-31) | Domain 2 |
| [32](#question-32) | ✅ Đúng | [Run the application on Amazon Elastic Container Service (Amazon ECS) as microservi...](#question-32) | Domain 2 |
| [33](#question-33) | ✅ Đúng | [An Amazon FSx for ONTAP instance](#question-33) | Domain 2 |
| [34](#question-34) | ✅ Đúng | [The Apache Hadoop application and the Apache Spark application to Amazon EMR clust...](#question-34) | Domain 2 |
| [35](#question-35) | ✅ Đúng | [Public subnets in the existing VPC](#question-35) | Domain 1 |
| [36](#question-36) | ❌ Sai | [A daily budget for the Savings Plans by using AWS Budgets](#question-36) | Domain 4 |
| [37](#question-37) | ❌ Sai | [The photos in the Amazon S3 Intelligent-Tiering storage class](#question-37) | Domain 4 |
| [38](#question-38) | ✅ Đúng | [Additional reader instances to the Aurora cluster](#question-38) | Domain 2 |
| [39](#question-39) | ✅ Đúng | [S3 bucket policies to allow access from a VPC endpoint](#question-39) | Domain 1 |
| [40](#question-40) | ❌ Sai | [Attach the SCP to the three nonproduction Organizations member accounts and an OU ...](#question-40) | Domain 1 |
| [41](#question-41) | ✅ Đúng | [Public NAT gateways in public subnets in the same VPCs as the EC2 instances](#question-41) | Domain 1 |
| [42](#question-42) | ✅ Đúng | [ALB access logging to Amazon S3](#question-42) | Domain 1 |
| [43](#question-43) | ❌ Sai | [A read replica of the database](#question-43) | Domain 2 |
| [44](#question-44) | ❌ Sai | [Define an AWS Database Migration Service (AWS DMS) task with change data capture (...](#question-44) | Domain 2 |
| [45](#question-45) | ✅ Đúng | [A Network Load Balancer with the required protocol and ports for the internet traffic](#question-45) | Domain 4 |
| [46](#question-46) | ✅ Đúng | [An AWS DataSync agent on the on-premises servers, and sync the data to Amazon S3](#question-46) | Domain 4 |
| [47](#question-47) | ✅ Đúng | [An Amazon S3 bucket](#question-47) | Domain 3 |
| [48](#question-48) | ✅ Đúng | [Subscribe to AWS Shield Advanced](#question-48) | Domain 1 |
| [49](#question-49) | ❌ Sai | [Internal Network Load Balancers in front of the application in each Region and an ...](#question-49) | Domain 3 |
| [50](#question-50) | ✅ Đúng | [Amazon Elastic Container Service (Amazon ECS) with an AWS Fargate launch type](#question-50) | Domain 2 |
| [51](#question-51) | ✅ Đúng | [An Amazon Elastic File System (Amazon EFS) file system](#question-51) | Domain 2 |
| [52](#question-52) | ❌ Sai | [Provision an internet-facing Application Load Balancer (ALB) in a public subnet](#question-52) | Domain 1 |
| [53](#question-53) | ✅ Đúng | [Provision a separate AWS Key Management Service (AWS KMS) key for each customer](#question-53) | Domain 1 |
| [54](#question-54) | ✅ Đúng | [Amazon CloudWatch Container Insights to collect metrics from the EKS clusters](#question-54) | Domain 3 |
| [55](#question-55) | ✅ Đúng | [Set the Auto Scaling group's minimum capacity to four](#question-55) | Domain 2 |
| [56](#question-56) | ✅ Đúng | [The application on an Amazon EC2 instance](#question-56) | Domain 4 |
| [57](#question-57) | ✅ Đúng | [The Instance Scheduler on AWS to configure start and stop schedules](#question-57) | Domain 2 |
| [58](#question-58) | ✅ Đúng | [DynamoDB Accelerator (DAX)](#question-58) | Domain 3 |
| [59](#question-59) | ✅ Đúng | [AWS Certificate Manager (ACM) to create a certificate](#question-59) | Domain 3 |
| [60](#question-60) | ✅ Đúng | [Edge-optimized endpoint](#question-60) | Domain 3 |
| [61](#question-61) | ✅ Đúng | [An Amazon RDS database with Multi-AZ DB cluster deployment](#question-61) | Domain 2 |
| [62](#question-62) | ✅ Đúng | [The existing RDS for MySQL database to an Aurora Serverless v2 MySQL database cluster](#question-62) | Domain 4 |
| [63](#question-63) | ✅ Đúng | [Lambda SnapStart](#question-63) | Domain 4 |
| [64](#question-64) | ✅ Đúng | [The databases to Amazon RDS Configure encryption at rest](#question-64) | Domain 1 |
| [65](#question-65) | ✅ Đúng | [Search CloudTrail logs with Amazon Athena queries to identify the errors](#question-65) | Domain 1 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi & Phân Tích Kiến Trúc (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: Newer movie video files in S3 Standard
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A media company stores movies in Amazon S3. Each movie is stored in a single video file that ranges from 1 GB to 10 GB in size.

The company must be able to provide the streaming content of a movie within 5 minutes of a user purchase. There is higher demand for movies that are less than 20 years old than for movies that are more than 20 years old. The company wants to minimize hosting service costs based on demand.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store newer movie video files in S3 Intelligent-Tiering. Store older movie video files in S3 Glacier Flexible Retrieval. When a user orders an older movie, retrieve the video file by using expedited retrieval.
- **(B)** Store newer movie video files in S3 Standard. Store older movie video files in S3 Standard-infrequent Access (S3 Standard-IA). When a user orders an older movie, retrieve the video file by using standard retrieval.
- **(C)** Store newer movie video files in S3 Standard. Store older movie video files in S3 Glacier Flexible Retrieval. When a user orders an older movie, retrieve the video file by using bulk retrieval. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Store all media content in Amazon S3. Use S3 Lifecycle policies to move media data into the Infrequent Access tier when the demand for a movie decreases.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty media lưu phim trong S3, mỗi file 1-10 GB
> - Phải cung cấp streaming content trong 5 phút sau khi user mua
> - Nhu cầu cao hơn cho phim < 20 năm tuổi so với phim > 20 năm tuổi
> - Muốn minimize hosting costs dựa trên demand

**Phân tích giải pháp tối ưu:**
Store newer movie video files in S3 Standard. Store older movie video files in S3 Standard-infrequent Access (S3 Standard-IA). When a user orders an older movie, retrieve the video file by using standard retrieval.

S3 Standard cho phim mới đảm bảo truy immediate access cho nội dung có nhu cầu cao

S3 Standard-IA cho phim cũ giảm chi phí lưu trữ với chi phí truy xuất cao hơn một chút

Standard retrieval từ S3 Standard-IA vẫn immediate access, đáp ứng yêu cầu 5 phút

Cost optimization dựa trên demand patterns - trả ít hơn cho content cũ, ít được access

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Store all media content in Amazon S3. Use S3 Lifecycle policies to move media data into the Infrequent Access tier when the demand for a movie decreases.**:
  Lifecycle policies dựa trên tuổi, không phải nhu cầu thực tế.
  Không tính đến việc movies có thể popular bất kể age.

- **(A) Store newer movie video files in S3 Intelligent-Tiering. Store older movie video files in S3 Glacier Flexible Retrieval. When a user orders an older movie, retrieve the video file by using expedited retrieval.**:
  Glacier Flexible Retrieval với truy xuất nhanh vẫn mất 1-5 phút, có rủi ro không đáp ứng yêu cầu 5 phút một cách nhất quán.
  Expedited retrieval chỉ dành cho objects < 250 MB, không phù hợp với movie files 1-10 GB.

- **(C) Store newer movie video files in S3 Standard. Store older movie video files in S3 Glacier Flexible Retrieval. When a user orders an older movie, retrieve the video file by using bulk retrieval.**:
  Bulk retrieval mất 5-12 giờ, hoàn toàn không đáp ứng yêu cầu 5 phút cho streaming ngay lập tức.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-02"></div>

### Question 02: Amazon Elastic Container Service (Amazon ECS)
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to deploy its containerized application workloads to a VPC across three Availability Zones. The company needs a solution that is highly available across Availability Zones. The solution must require minimal changes to the application.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EC2 Reserved Instances. Launch three EC2 instances in a spread placement group. Configure an Auto Scaling group to use target tracking scaling. Set the minimum capacity to 3.
- **(B)** Use Amazon Elastic Kubernetes Service (Amazon EKS) self-managed nodes. Configure Application Auto Scaling to use target tracking scaling. Set the minimum capacity to 3.
- **(C)** Use an AWS Lambda function. Configure the Lambda function to connect to a VPC. Configure Application Auto Scaling to use Lambda as a scalable target. Set the minimum capacity to 3.
- **(D)** Use Amazon Elastic Container Service (Amazon ECS). Configure Amazon ECS Service Auto Scaling to use target tracking scaling. Set the minimum capacity to 3. Set the task placement strategy type to spread with an Availability Zone attribute. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company muốn deploy containerized application workloads trong VPC across three Availability Zones
> - Cần solution highly available across AZs
> - Solution phải require minimal changes to application
> - Tìm solution với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Use Amazon Elastic Container Service (Amazon ECS). Configure Amazon ECS Service Auto Scaling to use target tracking scaling. Set the minimum capacity to 3. Set the task placement strategy type to spread with an Availability Zone attribute.

ECS là managed container service, giảm operational overhead so với self-managed solutions

Service Auto Scaling tự động handle scaling decisions dựa trên metrics

Minimum capacity = 3 đảm bảo có ít nhất 1 task per AZ cho high availability

Task placement strategy = spread với AZ attribute tự động distribute tasks đều across AZs

Minimal application changes vì chỉ cần containerize application

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use Amazon Elastic Kubernetes Service (Amazon EKS) self-managed nodes. Configure Application Auto Scaling to use target tracking scaling. Set the minimum capacity to 3.**:
  Self-managed nodes tăng operational overhead vì phải manage worker nodes, patching, updates.
  ECS fully managed thì ít overhead hơn.

- **(A) Use Amazon EC2 Reserved Instances. Launch three EC2 instances in a spread placement group. Configure an Auto Scaling group to use target tracking scaling. Set the minimum capacity to 3.**:
  EC2 instances require nhiều operational overhead hơn containers: OS management, patching, container runtime setup.
  Không tối ưu cho containerized workloads.

- **(C) Use an AWS Lambda function. Configure the Lambda function to connect to a VPC. Configure Application Auto Scaling to use Lambda as a scalable target. Set the minimum capacity to 3.**:
  Lambda có execution time limits, memory constraints, và không phù hợp cho traditional containerized applications.
  Require thay đổi application đáng kể.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Containerized workloads" → ECS/EKS là best choices
- "LEAST operational overhead" → Managed services (ECS) > Self-managed (EKS self-managed nodes)
- "Minimal application changes" → loại Lambda vì require refactoring
- "Highly available across AZs" → Spread placement strategy cho containers
- ECS vs EKS → ECS ít operational overhead hơn khi không cần Kubernetes features

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Use strategies to define Amazon ECS task placement
- Automatically scale your Amazon ECS service

</details>

---

<div id="question-03"></div>

### Question 03: An Amazon CloudWatch alarm to recover the EC2 instance in case of failure
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is running a legacy system on an Amazon EC2 instance. The application code cannot be modified, and the system cannot run on more than one instance. A solutions architect must design a resilient solution that can improve the recovery time for the system.

What should the solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable termination protection for the EC2 instance.
- **(B)** Configure the EC2 instance for Multi-AZ deployment.
- **(C)** Create an Amazon CloudWatch alarm to recover the EC2 instance in case of failure. `[Đáp án đúng ✅]`
- **(D)** Launch the EC2 instance with two Amazon Elastic Block Store (Amazon EBS) volumes that use RAID configurations for storage redundancy.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy legacy system trên Amazon EC2 instance
> - Application code cannot be modified và system cannot run on more than one instance
> - Solutions architect cần thiết kế resilient solution để improve recovery time

**Phân tích giải pháp tối ưu:**
Create an Amazon CloudWatch alarm to recover the EC2 instance in case of failure.

CloudWatch alarm với EC2 recovery action tự động restart instance khi detect system failure

Improve recovery time vì tự động recovery thay vì can thiệp manual

Giữ nguyên instance metadata, private IP, EIP và attached EBS volumes sau recovery

Phù hợp với constraint - không tạo multiple instances, không cần modify code

Focus vào instance-level failure - đúng với yêu cầu improve recovery time

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable termination protection for the EC2 instance.**:
  → Chỉ prevent accidental termination, không giúp recovery khi instance bị failure.

- **Configure the EC2 instance for Multi-AZ deployment.**:
  → EC2 instances không có Multi-AZ deployment feature như RDS. Đây là concept sai.

- **(D) Launch the EC2 instance with two Amazon Elastic Block Store (Amazon EBS) volumes that use RAID configurations for storage redundancy.**:
  RAID 0 improve performance, không improve recovery time - sai focus requirement
  EBS đã có built-in replication trong AZ với 99.999% availability
  Storage failure ≠ instance failure - không solve đúng vấn đề

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Improve recovery time" → focus vào instance failure recovery, không phải storage performance
- "Single instance constraint" → loại solutions require multiple instances
- CloudWatch recovery = automatic restart với preserve instance properties

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Adding recover actions to Amazon CloudWatch alarms

</details>

---

<div id="question-04"></div>

### Question 04: An Object Lambda Access Point
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company stores text files in Amazon S3. The text files include customer chat messages, date and time information, and customer personally identifiable information (PII).

The company needs a solution to provide samples of the conversations to an external service provider for quality control. The external service provider needs to randomly pick sample conversations up to the most recent conversation. The company must not share the customer PII with the external service provider. The solution must scale when the number of customer conversations increases.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Object Lambda Access Point. Create an AWS Lambda function that redacts the PII when the function reads the file. Instruct the external service provider to access the Object Lambda Access Point. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create a batch process on an Amazon EC2 instance that regularly reads all new files, redacts the PII from the files, and writes the redacted files to a different S3 bucket. Instruct the external service provider to access the bucket that does not contain the PII.
- **(C)** Create a web application on an Amazon EC2 instance that presents a list of the files, redacts the PII from the files, and allows the external service provider to download new versions of the files that have the PII redacted.
- **(D)** Create an Amazon DynamoDB table. Create an AWS Lambda function that reads only the data in the files that does not contain PII. Configure the Lambda function to store the non-PII data in the DynamoDB table when a new file is written to Amazon S3. Grant the external service provider access to the DynamoDB table.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company lưu text files trong S3 chứa customer chat messages, date/time, và customer PII
> - Cần provide samples of conversations cho external service provider để quality control
> - External provider cần randomly pick samples các cuộc conversations gần đây nhất
> - Must not share customer PII với external provider
> - Solution phải scale khi số lượng conversations tăng
> - Tìm solution với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an Object Lambda Access Point. Create an AWS Lambda function that redacts the PII when the function reads the file. Instruct the external service provider to access the Object Lambda Access Point.

S3 Object Lambda tự động process data on-the-fly khi được access

Lambda function redacts PII real-time, không cần pre-processing

No additional storage - không duplicate data, tiết kiệm cost

Automatically scales với number of requests và conversations

Least operational overhead - fully managed, không cần maintain infrastructure

Support random sampling vì external provider có thể access any object through Object Lambda endpoint

Architecture

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a batch process on an Amazon EC2 instance that regularly reads all new files, redacts the PII from the files, and writes the redacted files to a different S3 bucket. Instruct the external service provider to access the bucket that does not contain the PII.**:
  High operational overhead - phải manage EC2 instance, patching, monitoring
  Additional storage costs cho duplicate redacted files
  Batch processing delay - không real-time access to most recent conversations

- **Create a web application on an Amazon EC2 instance that presents a list of the files, redacts the PII from the files, and allows the external service provider to download new versions of the files that have the PII redacted.**:
  Highest operational overhead - manage EC2, web application, security, scaling
  Custom application development và maintenance required
  Not scalable - single EC2 instance bottleneck

- **Create an Amazon DynamoDB table. Create an AWS Lambda function that reads only the data in the files that does not contain PII. Configure the Lambda function to store the non-PII data in the DynamoDB table when a new file is written to Amazon S3. Grant the external service provider access to the DynamoDB table.**:
  → Thay đổi data format từ text files sang DynamoDB structure, không maintain original conversation format cho quality control.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "LEAST operational overhead" → Serverless solutions (Lambda, S3 Object Lambda)
- "On-demand data processing" → S3 Object Lambda better than batch processing
- "External service provider access" → Object Lambda Access Point provide secure endpoint

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Tutorial: Detecting and redacting PII data with S3 Object Lambda and Amazon Comprehend

</details>

---

<div id="question-05"></div>

### Question 05: Amazon RDS Proxy in front of the Aurora database
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company’s data platform uses an Amazon Aurora MySQL database. The database has multiple read replicas and multiple DB instances across different Availability Zones. Users have recently reported errors from the database that indicate that there are too many connections. The company wants to reduce the failover time by 20% when a read replica is promoted to primary writer.

Which solution will meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Switch to Amazon Redshift with relocation capability.
- **(B)** Switch to Amazon DynamoDB with DynamoDB Accelerator (DAX) for read connections.
- **(C)** Use Amazon RDS Proxy in front of the Aurora database. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Switch from Aurora to Amazon RDS with Multi-AZ cluster deployment.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Amazon Aurora MySQL database với multiple read replicas và multiple DB instances across different AZs
> - Users báo cáo errors indicate too many connections
> - Company muốn reduce failover time by 20% khi read replica được promoted to primary writer

**Phân tích giải pháp tối ưu:**
Use Amazon RDS Proxy in front of the Aurora database.

RDS Proxy maintain connection pooling để giảm số connections trực tiếp đến database

Solve "too many connections" issue bằng cách multiplex client connections

Reduce failover time vì RDS Proxy maintain connections đã thiết lập và redirect traffic liền mạch khi failover

No application changes required - applications connect to proxy endpoint thay vì database endpoint

Works với Aurora MySQL và maintain existing architecture

Architecture

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Switch from Aurora to Amazon RDS with Multi-AZ cluster deployment.**:
  → Major architecture change với high migration effort, không đảm bảo 20% failover improvement.

- **(B) Switch to Amazon DynamoDB with DynamoDB Accelerator (DAX) for read connections.**:
  → Thay đổi hoàn toàn database technology từ relational sang NoSQL, require application refactoring lớn.

- **(A) Switch to Amazon Redshift with relocation capability.**:
  → Redshift là data warehouse solution, không phù hợp cho transactional workloads của Aurora MySQL.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Too many connections" → RDS Proxy connection pooling là optimal solution
- "Reduce failover time" → RDS Proxy maintain connections during failover
- "Aurora MySQL" → keep existing technology, don't switch to different database types
- Connection pooling = multiplexing nhiều client connections thành ít database connections
- RDS Proxy specifically designed cho Aurora và RDS để solve connection issues

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon RDS Proxy for Aurora

</details>

---

<div id="question-06"></div>

### Question 06: Put the EC2 instances behind Application Load Balancers (ALBs) in each Region
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has users all around the world accessing its HTTP-based application deployed on Amazon EC2 instances in multiple AWS Regions. The company wants to improve the availability and performance of the application. The company also wants to protect the application against common web exploits that may affect availability, compromise security, or consume excessive resources. Static IP addresses are required.

What should a solutions architect recommend to accomplish this?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Put the EC2 instances behind Network Load Balancers (NLBs) in each Region. Deploy AWS WAF on the NLBs. Create an accelerator using AWS Global Accelerator and register the NLBs as endpoints.
- **(B)** Put the EC2 instances behind Application Load Balancers (ALBs) in each Region. Deploy AWS WAF on the ALBs. Create an accelerator using AWS Global Accelerator and register the ALBs as endpoints.
- **(C)** Put the EC2 instances behind Network Load Balancers (NLBs) in each Region. Deploy AWS WAF on the NLBs. Create an Amazon CloudFront distribution with an origin that uses Amazon Route 53 latency-based routing to route requests to the NLBs.
- **(D)** Put the EC2 instances behind Application Load Balancers (ALBs) in each Region. Create an Amazon CloudFront distribution with an origin that uses Amazon Route 53 latency-based routing to route requests to the ALBs. Deploy AWS WAF on the CloudFront distribution. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có users all around the world accessing HTTP-based application deployed trên EC2 instances trong multiple AWS Regions
> - Muốn improve availability and performance của application
> - Muốn bảo vệ chống lại các cuộc tấn công web phổ biến (common web exploits) có thể ảnh hưởng đến availability, security, hoặc tiêu thụ quá nhiều resources
> - Static IP addresses are required

**Phân tích giải pháp tối ưu:**
Put the EC2 instances behind Application Load Balancers (ALBs) in each Region. Deploy AWS WAF on the ALBs. Create an accelerator using AWS Global Accelerator and register the ALBs as endpoints.

ALBs phù hợp cho HTTP-based application, có layer 7 features

AWS WAF on ALBs protect against common web exploits như SQL injection, XSS

AWS Global Accelerator provide static IP addresses và improve performance với anycast IP

Global Accelerator với ALB endpoints improve availability và performance cho global users

Route traffic optimally đến healthy endpoints across regions

Architecture

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Put the EC2 instances behind Network Load Balancers (NLBs) in each Region. Deploy AWS WAF on the NLBs. Create an accelerator using AWS Global Accelerator and register the NLBs as endpoints.**:
  → AWS WAF cannot be deployed on NLBs - WAF chỉ support ALB, CloudFront, và API Gateway.

- **(C) Put the EC2 instances behind Network Load Balancers (NLBs) in each Region. Deploy AWS WAF on the NLBs. Create an Amazon CloudFront distribution with an origin that uses Amazon Route 53 latency-based routing to route requests to the NLBs.**:
  → Same issue - WAF không support NLBs, và NLB không optimal cho HTTP applications.

- **(D) Put the EC2 instances behind Application Load Balancers (ALBs) in each Region. Create an Amazon CloudFront distribution with an origin that uses Amazon Route 53 latency-based routing to route requests to the ALBs. Deploy AWS WAF on the CloudFront distribution.**:
  → CloudFront không provide static IP addresses - nó sử dụng dynamic edge locations.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Static IP addresses required" → AWS Global Accelerator (không phải CloudFront)
- "HTTP-based application" → ALB better than NLB cho layer 7 features
- "Protect against web exploits" → AWS WAF required
- AWS WAF compatibility → ALB, CloudFront, API Gateway (KHÔNG support NLB)
- Global performance + static IP → Global Accelerator với ALB endpoints

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS WAF supported services:
- Amazon CloudFront
- Application Load Balancer (ALB)
- Amazon API Gateway
- AWS AppSync

</details>

---

<div id="question-07"></div>

### Question 07: AWS Transfer for SFTP and an Amazon Elastic File System (Amazon EFS) file system f...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has a nightly batch processing routine that analyzes report files that an on-premises file system receives daily through SFTP. The company wants to move the solution to the AWS Cloud. The solution must be highly available and resilient. The solution also must minimize operational effort.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy AWS Transfer for SFTP and an Amazon S3 bucket for storage. Modify the application to pull the batch files from Amazon S3 to an Amazon EC2 instance for processing. Use an EC2 instance in an Auto Scaling group with a scheduled scaling policy to run the batch operation.
- **(B)** Deploy an Amazon EC2 instance that runs Linux and an SFTP service. Use an Amazon Elastic File System (Amazon EFS) file system for storage. Use an Auto Scaling group with the minimum number of instances and desired number of instances set to 1.
- **(C)** Deploy an Amazon EC2 instance that runs Linux and an SFTP service. Use an Amazon Elastic Block Store (Amazon EBS) volume for storage. Use an Auto Scaling group with the minimum number of instances and desired number of instances set to 1.
- **(D)** Deploy AWS Transfer for SFTP and an Amazon Elastic File System (Amazon EFS) file system for storage. Use an Amazon EC2 instance in an Auto Scaling group with a scheduled scaling policy to run the batch operation. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có nightly batch processing routine analyze report files nhận daily qua SFTP
> - Muốn move solution lên AWS Cloud
> - Solution phải highly available and resilient
> - Minimize operational effort

**Phân tích giải pháp tối ưu:**
Deploy AWS Transfer for SFTP and an Amazon Elastic File System (Amazon EFS) file system for storage. Use an Amazon EC2 instance in an Auto Scaling group with a scheduled scaling policy to run the batch operation.

AWS Transfer for SFTP là fully managed service, minimize operational effort cho SFTP infrastructure

EFS file system cung cấp shared storage accessible từ multiple EC2 instances

Auto Scaling group với scheduled scaling policy tự động scale cho nightly batch processing

Không cần modify application code - maintain existing file-based processing workflow

Highly available với EFS multi-AZ replication và Auto Scaling group health checks

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an Amazon EC2 instance that runs Linux and an SFTP service. Use an Amazon Elastic Block Store (Amazon EBS) volume for storage. Use an Auto Scaling group with the minimum number of instances and desired number of instances set to 1.**:
  Self-managed SFTP service tăng operational effort significantly
  EBS volume chỉ attach được tới 1 instance, không support shared access
  Single instance approach với min=1 không truly highly available

- **Deploy an Amazon EC2 instance that runs Linux and an SFTP service. Use an Amazon Elastic File System (Amazon EFS) file system for storage. Use an Auto Scaling group with the minimum number of instances and desired number of instances set to 1.**:
  → Self-managed SFTP tăng operational effort, single instance không highly available.

- **Deploy AWS Transfer for SFTP and an Amazon S3 bucket for storage. Modify the application to pull the batch files from Amazon S3 to an Amazon EC2 instance for processing. Use an EC2 instance in an Auto Scaling group with a scheduled scaling policy to run the batch operation.**:
  → Require application modification để pull từ S3, tăng operational effort và development time.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Minimize operational effort" → Managed services + no application changes
- "Nightly batch processing" → Scheduled scaling policy perfect fit
- EFS với file system interface → không cần modify application code
- S3 với object storage → require application modification để pull files

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is Amazon Elastic File System?

</details>

---

<div id="question-08"></div>

### Question 08: Amazon Simple Queue Service (Amazon SQS) FIFO queues as the messaging component be...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A), (E)

#### 📋 Đề bài (Scenario)
A company has a multi-tier payment processing application that is based on virtual machines (VMs). The communication between the tiers occurs asynchronously through a third-party middleware solution that guarantees exactly-once delivery.

The company needs a solution that requires the least amount of infrastructure management. The solution must guarantee exactly-once delivery for application messaging.

Which combination of actions will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Lambda for the compute layers in the architecture. `[Đáp án đúng ✅]`
- **(B)** Use Amazon Simple Notification Service (Amazon SNS) as the messaging component between the compute layers.
- **(C)** Use Amazon EC2 instances for the compute layers in the architecture.
- **(D)** Use containers that are based on Amazon Elastic Kubernetes Service (Amazon EKS) for the compute layers in the architecture.
- **(E)** Use Amazon Simple Queue Service (Amazon SQS) FIFO queues as the messaging component between the compute layers. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có multi-tier payment processing application based on VMs
> - Communication between tiers occurs asynchronously through third-party middleware với exactly-once delivery
> - Cần solution với least amount of infrastructure management
> - Solution phải guarantee exactly-once delivery cho application messaging
> - Choose two actions

**Phân tích giải pháp tối ưu:**
Use AWS Lambda for the compute layers in the architecture.

AWS Lambda là serverless compute service với zero infrastructure management

Event-driven architecture phù hợp cho asynchronous communication

Automatic scaling và high availability without managing servers

Perfect fit cho requirement "least infrastructure management"

Use Amazon Simple Queue Service (Amazon SQS) FIFO queues as the messaging component between the compute layers.

SQS FIFO queues guarantee exactly-once delivery và message ordering

Fully managed messaging service - no infrastructure management

Built-in deduplication ensures exactly-once processing

Native integration với Lambda cho event-driven processing

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use Amazon EC2 instances for the compute layers in the architecture.**:
  → EC2 requires infrastructure management (patching, scaling, monitoring), không meet "least infrastructure management".

- **(B) Use Amazon Simple Notification Service (Amazon SNS) as the messaging component between the compute layers.**:
  → SNS là pub/sub service, không guarantee exactly-once delivery như requirement.

- **(D) Use containers that are based on Amazon Elastic Kubernetes Service (Amazon EKS) for the compute layers in the architecture.**:
  → EKS requires quản lý infrastructure đang kể (cluster management, node scaling, networking).

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Least infrastructure management" → Serverless services (Lambda, SQS)
- "Exactly-once delivery" → SQS FIFO queues (không phải SNS)
- "Asynchronous communication" → Lambda + SQS perfect combination
- Lambda + SQS FIFO = proven serverless messaging pattern

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Exactly-once processing in Amazon SQS
- Using Lambda with Amazon SQS

</details>

---

<div id="question-09"></div>

### Question 09: Attach the AdministratorAccess identity-based policy to the IAM user group
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A solutions architect is designing an AWS Identity and Access Management (IAM) authorization model for a company's AWS account. The company has designated five specific employees to have full access to AWS services and resources in the AWS account.

The solutions architect has created an IAM user for each of the five designated employees and has created an IAM user group.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Attach the SystemAdministrator resource-based policy to the IAM user group. Place each of the five designated employee IAM users in the IAM user group.
- **(B)** Attach the AdministratorAccess identity-based policy to the IAM user group. Place each of the five designated employee IAM users in the IAM user group. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Attach the SystemAdministrator identity-based policy to the IAM user group. Place each of the five designated employee IAM users in the IAM user group.
- **(D)** Attach the AdministratorAccess resource-based policy to the IAM user group. Place each of the five designated employee IAM users in the IAM user group.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Solutions architect thiết kế IAM authorization model cho AWS account
> - Company đã chỉ định five specific employees có full access to AWS services và resources
> - Đã tạo IAM user cho mỗi employee và IAM user group
> - Cần solution để meet requirements

**Phân tích giải pháp tối ưu:**
Attach the AdministratorAccess identity-based policy to the IAM user group. Place each of the five designated employee IAM users in the IAM user group.

AdministratorAccess là AWS managed policy cung cấp full access to all AWS services và resources

Identity-based policy attach to users hoặc groups để grant permissions

IAM user group approach efficient để manage permissions cho multiple users

Best practice - manage permissions through groups thay vì individual users

AdministratorAccess policy chính xác meet requirement "full access"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Attach the AdministratorAccess resource-based policy to the IAM user group.**:
  → AdministratorAccess là identity-based policy, không phải resource-based policy.

- **Attach the SystemAdministrator identity-based policy to the IAM user group.**:
  → SystemAdministrator chỉ provide limited administrative permissions

- **Attach the SystemAdministrator resource-based policy to the IAM user group.**:
  → SystemAdministrator chỉ provide limited administrative permissions và cũng không phải resource-based policy.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Full access to AWS services" → AdministratorAccess managed policy
- IAM policy types → Identity-based (attach to users/groups) vs Resource-based (attach to resources)
- Group management → best practice cho multiple users với same permissions
- AWS managed policies → AdministratorAccess, ReadOnlyAccess, PowerUserAccess, SystemAdministrator
- SystemAdministrator chỉ provide limited administrative permissions

#### 📚 Tài liệu tham khảo chính thức (Official References):
- SystemAdministrator
- AdministratorAccess
- IAM Identity-Based vs Resource-Based Policies

</details>

---

<div id="question-10"></div>

### Question 10: AWS IAM Identity Center (AWS Single Sign-On)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company sets up an organization in AWS Organizations that contains 10 AWS accounts. A solutions architect must design a solution to provide access to the accounts for several thousand employees. The company has an existing identity provider (IdP). The company wants to use the existing IdP for authentication to AWS.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Resource Access Manager (AWS RAM) to share access to the AWS accounts with the users in the existing IdP.
- **(B)** Configure AWS IAM Identity Center (AWS Single Sign-On). Connect IAM Identity Center to the existing IdP. Provision users and groups from the existing IdP. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Set up AWS account root users with user email addresses and passwords that are synchronized from the existing IdP.
- **(D)** Create IAM users for the employees in the required AWS accounts. Connect IAM users to the existing IdP. Configure federated authentication for the IAM users.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có AWS Organizations với 10 AWS accounts
> - Cần provide access cho several thousand employees
> - Company có existing identity provider (IdP)
> - Muốn sử dụng existing IdP for authentication to AWS

**Phân tích giải pháp tối ưu:**
Configure AWS IAM Identity Center (AWS Single Sign-On). Connect IAM Identity Center to the existing IdP. Provision users and groups from the existing IdP.

IAM Identity Center được thiết kế specifically cho multi-account organizations

Centralized access management across multiple AWS accounts

Native integration với external IdPs (SAML, OIDC)

Automatic user/group provisioning từ existing IdP via SCIM

Single Sign-On experience cho users across all AWS accounts

Scalable solution cho thousands of employees

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create IAM users for the employees in the required AWS accounts. Connect IAM users to the existing IdP. Configure federated authentication for the IAM users.**:
  Creating thousands of IAM users across 10 accounts = operational overhead khổng lồ
  IAM users không directly federate với external IdPs
  Không scalable approach cho large organizations

- **(C) Set up AWS account root users with user email addresses and passwords that are synchronized from the existing IdP.**:
  → Root users là security risk và không được recommend cho regular user access.

- **(A) Use AWS Resource Access Manager (AWS RAM) to share access to the AWS accounts with the users in the existing IdP.**:
  → AWS RAM share resources giữa accounts, không provide authentication mechanism với external IdPs.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Multi-account + thousands of users" → IAM Identity Center là best choice
- "Existing IdP integration" → IAM Identity Center support SAML/OIDC federation
- "AWS Organizations" → IAM Identity Center integrates natively

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is IAM Identity Center?
- Manage an external identity provider

</details>

---

<div id="question-11"></div>

### Question 11: Modify the configuration of AWS WAF to add an IP match condition to block the mali...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company’s website is used to sell products to the public. The site runs on Amazon EC2 instances in an Auto Scaling group behind an Application Load Balancer (ALB). There is also an Amazon CloudFront distribution, and AWS WAF is being used to protect against SQL injection attacks. The ALB is the origin for the CloudFront distribution. A recent review of security logs revealed an external malicious IP that needs to be blocked from accessing the website.

What should a solutions architect do to protect the application?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Modify the network ACL on the CloudFront distribution to add a deny rule for the malicious IP address.
- **(B)** Modify the configuration of AWS WAF to add an IP match condition to block the malicious IP address. `[Đáp án đúng ✅]`
- **(C)** Modify the network ACL for the EC2 instances in the target groups behind the ALB to deny the malicious IP address.
- **(D)** Modify the security groups for the EC2 instances in the target groups behind the ALB to deny the malicious IP address.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company website bán products cho public, chạy trên EC2 instances trong Auto Scaling group behind ALB
> - Có Amazon CloudFront distribution với ALB là origin
> - AWS WAF đang protect against SQL injection attacks
> - Security logs phát hiện external malicious IP (IP độc hại bên ngoài) cần block khỏi website

**Phân tích giải pháp tối ưu:**
Modify the configuration of AWS WAF to add an IP match condition to block the malicious IP address.

AWS WAF là layer đầu tiên nhận traffic từ CloudFront

IP match condition trong WAF có thể block specific IP addresses effectively

WAF integrated với CloudFront nên sẽ block traffic trước khi reach origin (ALB)

Centralized security control - WAF rules apply across all CloudFront requests

Most efficient approach - block malicious traffic at edge locations

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Modify the network ACL on the CloudFront distribution to add a deny rule for the malicious IP address.**:
  → CloudFront không có network ACLs - đây là feature của VPC, không áp dụng cho CloudFront distribution.

- **(C) Modify the network ACL for the EC2 instances in the target groups behind the ALB to deny the malicious IP address.**:
  → Traffic đến EC2 sẽ có source IP của ALB, không phải original client IP, nên blocking client IP ở level này không effective.

- **(D) Modify the security groups for the EC2 instances in the target groups behind the ALB to deny the malicious IP address.**:
  → Security groups chỉ allow rules, không có deny rules, và cũng gặp same issue với source IP masking.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "CloudFront + WAF architecture" → WAF at CloudFront level blocks traffic sớm nhất
- "Block malicious IP" → AWS WAF IP match conditions là standard solution
- Traffic flow → Client → CloudFront → WAF → ALB → EC2
- Security groups → chỉ có allow rules, không có deny rules
- ALB source IP masking → EC2 sees ALB IP, not original client IP

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How to enhance Amazon CloudFront origin security with AWS WAF and AWS Secrets Manager

</details>

---

<div id="question-12"></div>

### Question 12: CloudWatch cross-account observability for the monitoring account
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company uses an organization in AWS Organizations to manage AWS accounts that contain applications. The company sets up a dedicated monitoring member account in the organization. The company wants to query and visualize observability data across the accounts by using Amazon CloudWatch.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new IAM user in the monitoring account. Create cross-account IAM policies in each AWS account. Attach the IAM policies to the new IAM user.
- **(B)** Configure a new IAM user in the monitoring account. In each AWS account, configure an IAM policy to have access to query and visualize the CloudWatch data in the account. Attach the new IAM policy to the new IAM user.
- **(C)** Set up service control policies (SCPs) to provide access to CloudWatch in the monitoring account under the Organizations root organizational unit (OU).
- **(D)** Enable CloudWatch cross-account observability for the monitoring account. Deploy an AWS CloudFormation template provided by the monitoring account in each AWS account to share the data with the monitoring account. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng AWS Organizations để manage AWS accounts chứa applications
> - Đã setup dedicated monitoring member account trong organization
> - Muốn query and visualize observability data across accounts bằng Amazon CloudWatch

**Phân tích giải pháp tối ưu:**
Enable CloudWatch cross-account observability for the monitoring account. Deploy an AWS CloudFormation template provided by the monitoring account in each AWS account to share the data with the monitoring account.

CloudWatch cross-account observability là feature được thiết kế đặc biệt cho use case này

Monitoring account có thể centrally view và query data từ multiple source accounts

CloudFormation template tự động setup required IAM roles và permissions

Automated deployment across multiple accounts thông qua Organizations

Native CloudWatch integration cho trải nghiệm monitoring cross-account liền mạch

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Set up service control policies (SCPs) to provide access to CloudWatch in the monitoring account under the Organizations root organizational unit (OU).**:
  → SCPs restrict permissions, không grant cross-account access để share CloudWatch data.

- **Configure a new IAM user in the monitoring account. In each AWS account, configure an IAM policy to have access to query and visualize the CloudWatch data in the account. Attach the new IAM policy to the new IAM user.**:
  → IAM users không thể có policies được attach từ accounts khác, và đây không phải là approach có thể scale được.

- **Create a new IAM user in the monitoring account. Create cross-account IAM policies in each AWS account. Attach the IAM policies to the new IAM user.**:
  → Vấn đề tương tự - IAM policies trong account A không thể attach vào IAM user trong account B.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Cross-account observability" → CloudWatch cross-account observability feature
- "Organizations + monitoring" → Mô hình centralized monitoring account
- CloudFormation automation → Best practice cho việc triển khai multi-account
- SCPs = restrictive policies, không grant cross-account access

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using Amazon CloudWatch dashboards
- Use an AWS CloudFormation template to set up individual source accounts

</details>

---

<div id="question-13"></div>

### Question 13: Run the EC2 instances in a cluster placement group and and configure enhanced netw...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (E) | **Đáp án đúng**: (A), (E)

#### 📋 Đề bài (Scenario)
A company is deploying an application that processes streaming data in near-real time. The company plans to use Amazon EC2 instances for the workload. The network architecture must be configurable to provide the lowest possible latency between nodes.

Which combination of network solutions will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable and configure enhanced networking on each EC2 instance. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Group the EC2 instances in separate accounts.
- **(C)** Use Amazon Elastic Block Store (Amazon EBS) optimized instance types.
- **(D)** Attach multiple elastic network interfaces to each EC2 instance.
- **(E)** Run the EC2 instances in a cluster placement group. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang triển khai ứng dụng xử lý streaming data trong near-real time
> - Dự định sử dụng Amazon EC2 instances cho workload
> - Network architecture phải có thể cấu hình để cung cấp độ trễ thấp nhất có thể giữa các nodes
> - Choose two network solutions

**Phân tích giải pháp tối ưu:**
Enable and configure enhanced networking on each EC2 instance.

Enhanced networking sử dụng Single Root I/O Virtualization (SR-IOV) để cung cấp hiệu năng mạng cao

Giảm độ trễ mạng và tăng packet per second performance

Lower CPU utilization cho network processing

Essential cho các ứng dụng yêu cầu low latency

Run the EC2 instances in a cluster placement group.

Cluster placement group đặt các instances gần nhau về mặt vật lý trong cùng Availability Zone

10 Gbps network performance giữa các instances trong group

Lowest possible latency giữa các instances

Optimal cho high performance computing và applications cần low network latency

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Group the EC2 instances in separate accounts.**:
  → Đặt instances ở các accounts riêng biệt sẽ tăng độ phức tạp và không giảm latency.

- **Attach multiple elastic network interfaces to each EC2 instance.**:
  → Multiple ENIs không giảm latency giữa các nodes, chỉ tăng bandwidth capacity.

- **(C) Use Amazon Elastic Block Store (Amazon EBS) optimized instance types.**:
  → EBS optimization cải thiện storage performance, không ảnh hưởng đến network latency giữa instances.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Lowest possible latency" → Cluster placement group + Enhanced networking
- "Streaming data + real-time" → Cần network optimization solutions
- Cluster placement group = physical proximity cho lowest latency
- Enhanced networking = SR-IOV cho better network performance

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Enhanced networking on Amazon EC2 instances
- Thông tin bổ sung quan trọng:
- Các EC2 instances được chọn phải hỗ trợ cluster networking khi được khởi chạy trong cluster placement group.
- Cluster placement group cung cấp low-latency networking giữa tất cả instances trong cluster.
- Băng thông mà EC2 instance có thể sử dụng phụ thuộc vào loại instance và thông số hiệu năng mạng của nó.

</details>

---

<div id="question-14"></div>

### Question 14: IAM users for daily administrative tasks
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has established a new AWS account. The account is newly provisioned and no changes have been made to the default settings. The company is concerned about the security of the AWS account root user.

What should be done to secure the root user?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Generate an access key for the root user. Use the access key for daily administration tasks instead of the AWS Management Console.
- **(B)** Provide the root user credentials to the most senior solutions architect. Have the solutions architect use the root user for daily administration tasks.
- **(C)** Create IAM users for daily administrative tasks. Disable the root user.
- **(D)** Create IAM users for daily administrative tasks. Enable multi-factor authentication on the root user. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đã thành lập AWS account mới
> - Account mới được cung cấp và không có thay đổi nào với default settings
> - Company lo ngại về bảo mật của AWS account root user

**Phân tích giải pháp tối ưu:**
Create IAM users for daily administrative tasks. Enable multi-factor authentication on the root user.

Tạo IAM users cho các tác vụ quản trị hằng ngày là best practice bảo mật

Enable MFA trên root user bảo vệ account khỏi unauthorized access

Root user chỉ được sử dụng cho các tác vụ đặc biệt cần root privileges

MFA adds extra layer bảo mật cho root account

Không disable root user vì cần thiết cho một số specific tasks

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create IAM users for daily administrative tasks. Disable the root user.**:
  → Không thể disable root user - root user cần thiết cho một số tác vụ chỉ root mới có thể thực hiện.

- **Generate an access key for the root user. Use the access key for daily administration tasks instead of the AWS Management Console.**:
  → Tạo access keys cho root user là security risk cao, không được khuyến nghị cho daily tasks.

- **(B) Provide the root user credentials to the most senior solutions architect. Have the solutions architect use the root user for daily administration tasks.**:
  → Chia sẻ root credentials vi phạm security best practices, root user không nên được dùng cho daily tasks.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Root user security" → MFA + IAM users cho daily tasks
- "Never disable root user" → Root user cần thiết cho specific administrative tasks
- "No access keys for root" → Access keys cho root user là major security risk
- Root user chỉ dùng cho → billing, account settings, support cases đặc biệt
- Daily administration → luôn dùng IAM users với permissions phù hợp

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Root user best practices for your AWS account

</details>

---

<div id="question-15"></div>

### Question 15: A Network Load Balancer with an associated Elastic IP address
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is designing a new web service that will run on Amazon EC2 instances behind an Elastic Load Balancing (ELB) load balancer. However, many of the web service clients can only reach IP addresses authorized on their firewalls.

What should a solutions architect recommend to meet the clients’ needs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** An Application Load Balancer with an associated Elastic IP address.
- **(B)** A Network Load Balancer with an associated Elastic IP address. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** An EC2 instance with a public IP address running as a proxy in front of the load balancer.
- **(D)** An A record in an Amazon Route 53 hosted zone pointing to an Elastic IP address.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang thiết kế web service mới sẽ chạy trên EC2 instances phía sau ELB load balancer
> - Nhiều web service clients chỉ có thể kết nối tới IP addresses được ủy quyền trên firewalls của họ
> - Cần giải pháp để đáp ứng nhu cầu của clients

**Phân tích giải pháp tối ưu:**
A Network Load Balancer with an associated Elastic IP address.

Network Load Balancer có thể được gán static Elastic IP addresses

Elastic IP addresses cung cấp địa chỉ IP cố định mà clients có thể whitelist trên firewalls

NLB hoạt động ở Layer 4 và preserve source IP addresses

Static IP requirement được đáp ứng hoàn hảo bởi NLB + EIP combination

High performance và low latency cho web service traffic

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **An Application Load Balancer with an associated Elastic IP address.**:
  → ALB không hỗ trợ static Elastic IP addresses - ALB sử dụng dynamic IP addresses.

- **An A record in an Amazon Route 53 hosted zone pointing to an Elastic IP address.**:
  → Chỉ có DNS record không giải quyết được vấn đề cần load balancing cho multiple EC2 instances.

- **An EC2 instance with a public IP address running as a proxy in front of the load balancer.**:
  → Tạo thêm single point of failure và tăng độ phức tạp không cần thiết cho architecture.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "IP addresses authorized on firewalls" → Cần static IP addresses
- "Static IP requirement" → Network Load Balancer + Elastic IP
- ALB vs NLB → ALB không hỗ trợ static IPs, NLB có thể
- Firewall whitelist → Static IPs essential cho corporate security policies

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How do I attach an Elastic IP address to new or existing internet-facing Network Load Balancers?

</details>

---

<div id="question-16"></div>

### Question 16: Download AWS-provided root certificates
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
To meet security requirements, a company needs to encrypt all of its application data in transit while communicating with an Amazon RDS MySQL DB instance. A recent security audit revealed that encryption at rest is enabled using AWS Key Management Service (AWS KMS), but data in transit is not enabled.

What should a solutions architect do to satisfy the security requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Download AWS-provided root certificates. Provide the certificates in all connections to the RDS instance. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable IAM database authentication on the database.
- **(C)** Take a snapshot of the RDS instance. Restore the snapshot to a new instance with encryption enabled.
- **(D)** Provide self-signed certificates. Use the certificates in all connections to the RDS instance.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company cần mã hóa tất cả application data in transit khi giao tiếp với Amazon RDS MySQL DB instance
> - Security audit cho thấy encryption at rest đã được bật bằng AWS KMS
> - Nhưng data in transit không được bật
> - Cần đáp ứng yêu cầu bảo mật

**Phân tích giải pháp tối ưu:**
Download AWS-provided root certificates. Provide the certificates in all connections to the RDS instance.

AWS cung cấp root certificates để enable SSL/TLS encryption cho RDS connections

Root certificates cần được tải xuống và cấu hình trong application connections

SSL/TLS encryption bảo vệ data in transit giữa application và RDS instance

AWS-provided certificates được trust và maintain bởi AWS

Standard method để enable encryption in transit cho RDS

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable IAM database authentication on the database.**:
  → IAM database authentication liên quan đến xác thực, không phải mã hóa data in transit.

- **(D) Provide self-signed certificates. Use the certificates in all connections to the RDS instance.**:
  → Self-signed certificates không được khuyến nghị và có thể có security risks, AWS-provided certificates an toàn hơn.

- **(C) Take a snapshot of the RDS instance. Restore the snapshot to a new instance with encryption enabled.**:
  → Đây là để enable encryption at rest, nhưng encryption at rest đã được bật rồi. Không giải quyết data in transit.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Data in transit" → SSL/TLS certificates cần thiết
- "RDS encryption in transit" → AWS-provided root certificates
- IAM database authentication ≠ encryption in transit
- Encryption at rest vs in transit → Different mechanisms và requirements
- Self-signed vs AWS-provided → AWS certificates được khuyến nghị hơn

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using SSL/TLS to encrypt a connection to a DB instance or cluster

</details>

---

<div id="question-17"></div>

### Question 17: AWS AppConfig to store and manage the application configuration
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is building an application on AWS that connects to an Amazon RDS database. The company wants to manage the application configuration and to securely store and retrieve credentials for the database and other services.

Which solution will meet these requirements with the LEAST administrative overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS AppConfig to store and manage the application configuration. Use Amazon RDS to store and retrieve the credentials.
- **(B)** Use an encrypted application configuration file. Store the file in Amazon S3 for the application configuration. Create another S3 file to store and retrieve the credentials.
- **(C)** Use AWS Lambda to store and manage the application configuration. Use AWS Systems Manager Parameter Store to store and retrieve the credentials.
- **(D)** Use AWS AppConfig to store and manage the application configuration. Use AWS Secrets Manager to store and retrieve the credentials. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang xây dựng application trên AWS kết nối với Amazon RDS database
> - Muốn quản lý application configuration và securely store and retrieve credentials cho database và các services khác
> - Tìm giải pháp với LEAST administrative overhead

**Phân tích giải pháp tối ưu:**
Use AWS AppConfig to store and manage the application configuration. Use AWS Secrets Manager to store and retrieve the credentials.

AWS AppConfig được thiết kế đặc biệt để quản lý application configuration với version control và deployment features

AWS Secrets Manager là fully managed service cho secure storage và automatic rotation của credentials

Least administrative overhead vì cả hai đều là fully managed services

AppConfig cung cấp safe deployment và rollback capabilities cho configuration changes

Secrets Manager tự động integrate với RDS và các AWS services khác

Architecture: AWS Secrets Manager Integration with Amazon RDS

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use AWS Lambda to store and manage the application configuration. Use AWS Systems Manager Parameter Store to store and retrieve the credentials.**:
  → Lambda không được thiết kế để store configuration, và Parameter Store không có automatic rotation như Secrets Manager.

- **(B) Use an encrypted application configuration file. Store the file in Amazon S3 for the application configuration. Create another S3 file to store and retrieve the credentials.**:
  Manual management của configuration files tăng administrative overhead
  Storing credentials trong S3 files không phải best practice bảo mật
  Thiếu automatic rotation và access control features

- **(A) Use AWS AppConfig to store and manage the application configuration. Use Amazon RDS to store and retrieve the credentials.**:
  → Storing credentials trong RDS database tạo circular dependency và không phải security best practice.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Application configuration management" → AWS AppConfig là specialized service
- "Securely store credentials" → AWS Secrets Manager với automatic rotation
- "LEAST administrative overhead" → Fully managed services thay vì manual solutions
- RDS credentials → Secrets Manager có native integration với RDS
- Parameter Store vs Secrets Manager → Secrets Manager tốt hơn cho sensitive credentials

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Secrets Manager Integration with Amazon RDS
- What is AWS AppConfig?
- Secrets Manager for RDS Integration

</details>

---

<div id="question-18"></div>

### Question 18: An Amazon Route 53 public hosted zone for the domain name
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
The DNS provider that hosts a company's domain name records is experiencing outages that cause service disruption for a website running on AWS. The company needs to migrate to a more resilient managed DNS service and wants the service to run on AWS.

What should a solutions architect do to rapidly migrate the DNS hosting service?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a Simple AD directory in AWS. Enable zone transfer between the DNS provider and AWS Directory Service for Microsoft Active Directory for the domain records.
- **(B)** Create an Amazon Route 53 private hosted zone for the domain name. Import the zone file containing the domain records hosted by the previous provider.
- **(C)** Create an Amazon Route 53 public hosted zone for the domain name. Import the zone file containing the domain records hosted by the previous provider. `[Đáp án đúng ✅]`
- **(D)** Create an Amazon Route 53 Resolver inbound endpoint in the VPC. Specify the IP addresses that the provider's DNS will forward DNS queries to. Configure the provider's DNS to forward DNS queries for the domain to the IP addresses that are specified in the inbound endpoint.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - DNS provider hiện tại đang gặp outages gây service disruption cho website chạy trên AWS
> - Company cần migrate sang managed DNS service có tính resilient cao hơn và muốn service chạy trên AWS
> - Cần rapidly (nhanh chóng) migrate DNS hosting service

**Phân tích giải pháp tối ưu:**
Create an Amazon Route 53 public hosted zone for the domain name. Import the zone file containing the domain records hosted by the previous provider.

Route 53 public hosted zone là managed DNS service phù hợp cho public domain names

Import zone file cho phép rapid migration từ DNS provider hiện tại

Zone file chứa tất cả DNS records (A, CNAME, MX, etc.) từ provider cũ

Public hosted zone cần thiết vì đây là website public trên internet

Route 53 cung cấp high availability và global DNS infrastructure

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon Route 53 private hosted zone for the domain name. Import the zone file containing the domain records hosted by the previous provider.**:
  → Private hosted zone chỉ dành cho DNS resolution trong VPC, không phù hợp cho public website.

- **Create a Simple AD directory in AWS. Enable zone transfer between the DNS provider and AWS Directory Service for Microsoft Active Directory for the domain records.**:
  → Simple AD và Directory Service không phải là DNS hosting solutions, chúng dành cho authentication và directory services.

- **Create an Amazon Route 53 Resolver inbound endpoint in the VPC. Specify the IP addresses that the provider's DNS will forward DNS queries to.**:
  → Route 53 Resolver inbound endpoint dùng để resolve DNS queries từ on-premises về AWS, không phải để host public DNS records.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Public website DNS" → Route 53 public hosted zone
- "Rapid migration" → Import zone file từ provider cũ
- "DNS hosting vs DNS resolution" → Hosting cần public hosted zone
- Private vs Public hosted zone → Public cho internet-facing domains
- Route 53 Resolver → Dành cho hybrid DNS resolution, không phải hosting

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Making Route 53 the DNS service for a domain that's in use

</details>

---

<div id="question-19"></div>

### Question 19: A list of unencrypted objects by filtering an Amazon S3 Inventory report
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company migrated millions of archival files to Amazon S3. A solutions architect needs to implement a solution that will encrypt all the archival data by using a customer-provided key. The solution must encrypt existing unencrypted objects and future objects.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use S3 Storage Lens metrics to identify unencrypted S3 buckets. Configure the S3 default encryption feature to use a server-side encryption with AWS KMS keys (SSE-KMS).
- **(B)** Create a list of unencrypted objects by filtering the AWS usage report for Amazon S3. Configure the S3 default encryption feature to use a server-side encryption with a customer-provided key (SSE-C).
- **(C)** Create a list of unencrypted objects by filtering the AWS usage report for Amazon S3. Configure an AWS Batch job to encrypt the objects from the list with a server-side encryption with AWS KMS keys (SSE-KMS). Configure the S3 default encryption feature to use a server-side encryption with AWS KMS keys (SSE-KMS).
- **(D)** Create a list of unencrypted objects by filtering an Amazon S3 Inventory report. Configure an S3 Batch Operations job to encrypt the objects from the list with a server-side encryption with a customer-provided key (SSE-C). Configure the S3 default encryption feature to use a server-side encryption with a customer-provided key (SSE-C). `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đã migrate hàng triệu archival files lên Amazon S3
> - Solutions architect cần implement giải pháp mã hóa tất cả archival data bằng customer-provided key
> - Solution phải encrypt existing unencrypted objects và future objects

**Phân tích giải pháp tối ưu:**
Create a list of unencrypted objects by filtering an Amazon S3 Inventory report. Configure an S3 Batch Operations job to encrypt the objects from the list with a server-side encryption with a customer-provided key (SSE-C). Configure the S3 default encryption feature to use a server-side encryption with a customer-provided key (SSE-C).

S3 Inventory report cung cấp detailed list của tất cả objects và encryption status

S3 Batch Operations có thể process hàng triệu objects efficiently để encrypt existing unencrypted data

SSE-C sử dụng customer-provided encryption keys như yêu cầu

S3 default encryption với SSE-C đảm bảo future objects sẽ được mã hóa tự động

Scalable solution cho millions of archival files

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use S3 Storage Lens metrics to identify unencrypted S3 buckets. Configure the S3 default encryption feature to use a server-side encryption with AWS KMS keys (SSE-KMS).**:
  → Sai vì sử dụng AWS KMS keys thay vì customer-provided keys như yêu cầu.

- **Create a list of unencrypted objects by filtering the AWS usage report for Amazon S3. Configure an AWS Batch job to encrypt the objects from the list with a server-side encryption with AWS KMS keys (SSE-KMS).**:
  AWS usage report không cung cấp object-level encryption details
  Sử dụng AWS KMS thay vì customer-provided keys
  AWS Batch không phải là optimal tool cho S3 object operations

- **Create a list of unencrypted objects by filtering the AWS usage report for Amazon S3. Configure the S3 default encryption feature to use a server-side encryption with a customer-provided key (SSE-C).**:
  → Chỉ giải quyết future objects, không encrypt existing unencrypted objects.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Customer-provided key" → SSE-C (không phải SSE-KMS)
- "Millions of objects" → S3 Batch Operations cho bulk processing
- "Existing + Future objects" → S3 Batch Operations + Default encryption
- S3 Inventory → Best tool để identify unencrypted objects
- AWS usage report → Không cung cấp object-level encryption details

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Encrypting objects with Amazon S3 Batch Operations

</details>

---

<div id="question-20"></div>

### Question 20: Send the requests from the API Gateway REST API to Amazon EventBridge
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is building a new application that uses serverless architecture. The architecture will consist of an Amazon API Gateway REST API and AWS Lambda functions to manage incoming requests.

The company wants to add a service that can send messages received from the API Gateway REST API to multiple target Lambda functions for processing. The service must offer message filtering that gives the target Lambda functions the ability to receive only the messages the functions need.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Send the requests from the API Gateway REST API to multiple Amazon Simple Queue Service (Amazon SQS) queues. Configure the target Lambda functions to poll the different SQS queues.
- **(B)** Send the requests from the API Gateway REST API to Amazon Managed Streaming for Apache Kafka (Amazon MSK). Configure Amazon MSK to publish the messages to the target Lambda functions.
- **(C)** Send the requests from the API Gateway REST API to Amazon EventBridge. Configure EventBridge to invoke the target Lambda functions. `[Đáp án đúng ✅]`
- **(D)** Send the requests from the API Gateway REST API to an Amazon Simple Notification Service (Amazon SNS) topic. Subscribe Amazon Simple Queue Service (Amazon SQS) queues to the SNS topic. Configure the target Lambda functions to poll the different SQS queues.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang xây dựng ứng dụng mới sử dụng serverless architecture
> - Architecture gồm Amazon API Gateway REST API và AWS Lambda functions để quản lý incoming requests
> - Muốn thêm service có thể gửi messages từ API Gateway REST API đến multiple target Lambda functions để xử lý
> - Service phải cung cấp message filtering để target Lambda functions chỉ nhận messages mà chúng cần
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Send the requests from the API Gateway REST API to Amazon EventBridge. Configure EventBridge to invoke the target Lambda functions.

EventBridge được thiết kế đặc biệt cho event routing và filtering, là lựa chọn hiệu quả nhất để quản lý việc Lambda functions nhận messages dựa trên criteria cụ thể

Minimize operational overhead so với các lựa chọn khác

Event pattern matching với detailed rules có attributes và conditions để filter messages và gửi chỉ đến relevant Lambda functions

Better management và control over message routing, đặc biệt với complex event patterns

Direct Lambda invocation - không cần polling mechanism

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Send the requests from the API Gateway REST API to an Amazon Simple Notification Service (Amazon SNS) topic. Subscribe Amazon Simple Queue Service (Amazon SQS) queues to the SNS topic. Configure the target Lambda functions to poll the different SQS queues.**:
  → SNS có thể dùng cho fan-out messaging, nhưng thêm SQS queues tạo ra extra complexity và potential bottlenecks trong việc quản lý multiple queues và subscriptions.

- **(B) Send the requests from the API Gateway REST API to Amazon Managed Streaming for Apache Kafka (Amazon MSK). Configure Amazon MSK to publish the messages to the target Lambda functions.**:
  → Kafka là powerful messaging system nhưng overkill cho scenario này do complexity và overhead của việc quản lý dedicated Kafka cluster, đặc biệt khi message volume không quá cao.

- **(A) Send the requests from the API Gateway REST API to multiple Amazon Simple Queue Service (Amazon SQS) queues. Configure the target Lambda functions to poll the different SQS queues.**:
  → Yêu cầu additional logic để quyết định gửi messages đến SQS queue nào dựa trên filtering criteria, thêm complexity vào architecture.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Message filtering + least operational overhead" → EventBridge với detailed rules
- "Multiple target Lambda functions" → EventBridge event routing optimal
- "Serverless architecture" → Event-driven approach thay vì polling
- EventBridge vs SNS+SQS → EventBridge ít complexity hơn cho filtering use cases
- Complex event patterns → EventBridge management capabilities tốt hơn

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Capturing client events using Amazon API Gateway and Amazon EventBridge

</details>

---

<div id="question-21"></div>

### Question 21: S3 Same-Region Replication to replicate logs from the S3 buckets to another S3 buc...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has multiple AWS accounts with applications deployed in the us-west-2 Region. Application logs are stored within Amazon S3 buckets in each account. The company wants to build a centralized log analysis solution that uses a single S3 bucket. Logs must not leave us-west-2, and the company wants to incur minimal operational overhead.

Which solution meets these requirements and is MOST cost-effective?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an S3 Lifecycle policy that copies the objects from one of the application S3 buckets to the centralized S3 bucket.
- **(B)** Write AWS Lambda functions in these accounts that are triggered every time logs are delivered to the S3 buckets (s3:ObjectCreated:* event). Copy the logs to another S3 bucket in us-west-2. Use this S3 bucket for log analysis.
- **(C)** Write a script that uses the PutObject API operation every day to copy the entire contents of the buckets to another S3 bucket in us-west-2. Use this S3 bucket for log analysis.
- **(D)** Use S3 Same-Region Replication to replicate logs from the S3 buckets to another S3 bucket in us-west-2. Use this S3 bucket for log analysis. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có multiple AWS accounts với applications deployed trong us-west-2 Region
> - Application logs được lưu trong Amazon S3 buckets ở mỗi account
> - Muốn xây dựng centralized log analysis solution sử dụng single S3 bucket
> - Logs must not leave us-west-2 và muốn minimal operational overhead
> - Tìm giải pháp MOST cost-effective

**Phân tích giải pháp tối ưu:**
Use S3 Same-Region Replication to replicate logs from the S3 buckets to another S3 bucket in us-west-2. Use this S3 bucket for log analysis.

S3 Same-Region Replication là fully managed service, đảm bảo minimal operational overhead

Automatic replication của logs từ multiple source buckets đến centralized bucket

Logs remain trong us-west-2 như yêu cầu

Cost-effective vì chỉ trả phí cho storage và replication, không có compute costs

Real-time replication đảm bảo centralized logs luôn up-to-date

Cross-account replication support để replicate từ multiple AWS accounts

S3 Same-Region Replication

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an S3 Lifecycle policy that copies the objects from one of the application S3 buckets to the centralized S3 bucket.**:
  → Lifecycle policy không thể copy objects từ bucket này sang bucket khác, chỉ có thể transition storage classes hoặc delete objects.

- **(C) Write a script that uses the PutObject API operation every day to copy the entire contents of the buckets to another S3 bucket in us-west-2.**:
  → Daily script tăng operational overhead, không real-time, và có thể duplicate costs khi copy entire contents.

- **Write AWS Lambda functions in these accounts that are triggered every time logs are delivered to the S3 buckets (s3:ObjectCreated: event). Copy the logs to another S3 bucket in us-west-2.**:
  → Lambda functions tăng operational overhead, có compute costs, và cần maintain code across multiple accounts.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Centralized logs from multiple accounts" → S3 Same-Region Replication với cross-account setup
- "Minimal operational overhead" → Managed services thay vì custom scripts/Lambda
- "Most cost-effective" → S3 replication không có compute costs như Lambda
- "Logs must not leave region" → Same-Region Replication đảm bảo requirement này
- S3 Lifecycle vs Replication → Lifecycle không copy objects, chỉ manage object lifecycle

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Configuring replication for buckets in different accounts

</details>

---

<div id="question-22"></div>

### Question 22: The Amazon RDS Protection feature in Amazon GuardDuty for the member accounts of t...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An ecommerce company runs applications in AWS accounts that are part of an organization in AWS Organizations. The applications run on Amazon Aurora PostgreSQL databases across all the accounts. The company needs to prevent malicious activity and must identify abnormal failed and incomplete login attempts to the databases.

Which solution will meet these requirements in the MOST operationally efficient way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Publish all the Aurora PostgreSQL database events in AWS CloudTrail to a central Amazon S3 bucket.
- **(B)** Attach service control policies (SCPs) to the root of the organization to identity the failed login attempts.
- **(C)** Enable the Amazon RDS Protection feature in Amazon GuardDuty for the member accounts of the organization. `[Đáp án đúng ✅]`
- **(D)** Publish the Aurora general logs to a log group in Amazon CloudWatch Logs. Export the log data to a central Amazon S3 bucket.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ecommerce company chạy applications trong AWS accounts thuộc organization trong AWS Organizations
> - Applications chạy trên Amazon Aurora PostgreSQL databases across all accounts
> - Cần prevent malicious (độc hại) activity và identify abnormal failed và incomplete login attempts to databases
> - Tìm giải pháp MOST operationally efficient

**Phân tích giải pháp tối ưu:**
Enable the Amazon RDS Protection feature in Amazon GuardDuty for the member accounts of the organization.

Amazon RDS Protection trong GuardDuty được thiết kế đặc biệt để Phát hiện các hoạt động đáng ngờ của database

Tự động phát hiện các nỗ lực abnormal login và các hoạt động độc hại của database

Machine learning-based detection để identify unusual patterns và failed login attempts

Minimal operational overhead - fully managed security service

Organization-wide deployment có thể enable across multiple accounts efficiently

Real-time alerts và detailed findings về potential threats

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Attach service control policies (SCPs) to the root of the organization to identity the failed login attempts.**:
  → SCPs là preventive controls để restrict permissions, không phải detective controls để identify failed login attempts.

- **(D) Publish the Aurora general logs to a log group in Amazon CloudWatch Logs. Export the log data to a central Amazon S3 bucket.**:
  → Require manual analysis của logs để detect abnormal patterns, tăng operational overhead và không automated detection.

- **(A) Publish all the Aurora PostgreSQL database events in AWS CloudTrail to a central Amazon S3 bucket.**:
  → CloudTrail capture API calls, không capture database-level login attempts và failed authentication events.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Identify abnormal failed login attempts" → GuardDuty RDS Protection specialized cho database threats
- "Most operationally efficient" → Managed security services thay vì manual log analysis
- "Malicious activity detection" → Machine learning-based detection tốt hơn manual monitoring
- SCPs = preventive, không phải detective controls
- CloudTrail vs Database logs → CloudTrail không capture database authentication events

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Monitoring threats with Amazon GuardDuty RDS Protection for Amazon Aurora

</details>

---

<div id="question-23"></div>

### Question 23: AWS WAF to protect the application
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has deployed its application on Amazon EC2 instances with an Amazon RDS database. The company used the principle of least privilege to configure the database access credentials. The company's security team wants to protect the application and the database from SQL injection and other web-based attacks.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Network Firewall to protect the application and the database.
- **(B)** Use AWS WAF to protect the application. Use RDS parameter groups to configure the security settings. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use security groups and network ACLs to secure the database and application servers.
- **(D)** Use different database accounts in the application code for different functions. Avoid granting excessive privileges to the database users.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đã deploy application trên Amazon EC2 instances với Amazon RDS database
> - Đã sử dụng principle of least privilege để configure database access credentials
> - Security team muốn bảo vệ application và database khỏi SQL injection và các web-based attacks khác
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Use AWS WAF to protect the application. Use RDS parameter groups to configure the security settings.

AWS WAF được thiết kế đặc biệt để bảo vệ web applications khỏi SQL injection, XSS, và các web-based attacks

Built-in managed rules cho SQL injection protection với minimal configuration

RDS parameter groups cho phép configure database security settings như connection limits, SSL enforcement

Fully managed services - least operational overhead

Cost-effective và không require custom development

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use security groups and network ACLs to secure the database and application servers.**:
  → Security groups và NACLs chỉ control network access, không bảo vệ khỏi SQL injection attacks ở application layer.

- **(A) Use AWS Network Firewall to protect the application and the database.**:
  → Network Firewall hoạt động ở network layer, không phân tích và block SQL injection attacks ở application layer.

- **(D) Use different database accounts in the application code for different functions. Avoid granting excessive privileges to the database users.**:
  → Đây là good practice nhưng đã được implement (principle of least privilege), và không protect khỏi SQL injection attacks.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SQL injection protection" → AWS WAF với managed rules
- "Web-based attacks" → Application layer protection cần thiết
- "LEAST operational overhead" → Managed services thay vì custom solutions
- Network vs Application layer → SQL injection cần application layer protection
- WAF managed rules → Built-in protection cho common web attacks

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Working with SQL injection match conditions

</details>

---

<div id="question-24"></div>

### Question 24: Implement an Amazon ElastiCache for Redis cluster between the application and the ...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A package delivery company has an application that uses Amazon EC2 instances and an Amazon Aurora MySQL DB cluster. As the application becomes more popular, EC2 instance usage increases only slightly. DB cluster usage increases at a much faster rate.

The company adds a read replica, which reduces the DB cluster usage for a short period of time. However, the load continues to increase. The operations that cause the increase in DB cluster usage are all repeated read statements that are related to delivery details. The company needs to alleviate the effect of repeated reads on the DB cluster.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Modify the DB cluster to have multiple writer instances.
- **(B)** Implement an Amazon ElastiCache for Redis cluster between the application and the DB cluster. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Configure Aurora Auto Scaling for the Aurora read replicas.
- **(D)** Add an additional read replica to the DB cluster.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Package delivery company có application sử dụng EC2 instances và Amazon Aurora MySQL DB cluster
> - Khi application trở nên popular, EC2 usage tăng nhẹ nhưng DB cluster usage tăng nhanh hơn nhiều
> - Đã thêm read replica, giảm DB usage trong thời gian ngắn nhưng load tiếp tục tăng
> - Các operations gây tăng DB usage là repeated read statements liên quan đến delivery details
> - Cần giảm thiểu tác động của repeated reads trên DB cluster
> - Tìm giải pháp MOST cost-effective
> - Architecture using remote distributed cache

**Phân tích giải pháp tối ưu:**
Implement an Amazon ElastiCache for Redis cluster between the application and the DB cluster.

ElastiCache Redis là in-memory caching solution lý tưởng cho repeated read operations

Cache delivery details để giảm dramatically số lượng database queries

Cost-effective vì cache hits không tốn DB resources và compute

High performance với sub-millisecond latency cho cached data

Addresses root cause của vấn đề - repeated reads thay vì chỉ scale database

Long-term solution không cần thêm database resources liên tục

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Add an additional read replica to the DB cluster.**:
  → Chỉ là temporary solution như đã thấy, repeated reads sẽ tiếp tục overwhelm additional replicas.

- **Configure Aurora Auto Scaling for the Aurora read replicas.**:
  → Auto scaling sẽ tăng costs khi traffic tăng, không address root cause của repeated reads.

- **(A) Modify the DB cluster to have multiple writer instances.**:
  → Multiple writers cho write operations, nhưng vấn đề là read operations, không phải writes.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Repeated read statements" → Caching layer là optimal solution
- "Delivery details" → Static data phù hợp cho caching
- "Cost-effective" → Cache giảm DB load hơn là scale DB
- Read replicas vs Caching → Cache address repeated reads better
- ElastiCache Redis → Best choice cho complex data structures và TTL management

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Database Caching Strategies Using Redis

</details>

---

<div id="question-25"></div>

### Question 25: Predictive scaling to forecast and scale
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs a three-tier web application in a VPC across multiple Availability Zones. Amazon EC2 instances run in an Auto Scaling group for the application tier.

The company needs to make an automated scaling plan that will analyze each resource's daily and weekly historical workload trends. The configuration must scale resources appropriately according to both the forecast and live changes in utilization.

Which scaling strategy should a solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable predictive scaling to forecast and scale. Configure dynamic scaling with target tracking. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Set up a simple scaling policy. Increase the cooldown period based on the EC2 instance startup time.
- **(C)** Implement dynamic scaling with step scaling based on average CPU utilization from the EC2 instances.
- **(D)** Create an automated scheduled scaling action based on the traffic patterns of the web application.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy three-tier web application trong VPC across multiple Availability Zones
> - EC2 instances chạy trong Auto Scaling group cho application tier
> - Cần automated scaling plan phân tích daily và weekly historical workload trends của từng resource
> - Configuration phải điều chỉnh quy mô tài nguyên một cách phù hợp theo cả dự báo và các thay đổi trực tiếp trong việc sử dụng

**Phân tích giải pháp tối ưu:**
Enable predictive scaling to forecast and scale. Configure dynamic scaling with target tracking.

Predictive scaling sử dụng machine learning để analyze historical workload trends và forecast future demand

Learns daily và weekly patterns để proactively scale trước khi như cầu đột biến xảy ra

Dynamic scaling với target tracking handle live changes trong utilization real-time

Combined approach đáp ứng cả forecast-based và reactive scaling requirements

Automated và intelligent - không cần manual intervention cho traffic patterns

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Implement dynamic scaling with step scaling based on average CPU utilization from the EC2 instances.**:
  → Chỉ reactive scaling, không analyze historical trends hoặc forecast future demand.

- **Create an automated scheduled scaling action based on the traffic patterns of the web application.**:
  → Scheduled scaling dựa trên fixed schedule, không adaptive với changing patterns và không handle unexpected spikes.

- **(B) Set up a simple scaling policy. Increase the cooldown period based on the EC2 instance startup time.**:
  → Simple scaling là basic approach, không analyze historical data hoặc provide intelligent forecasting.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Historical workload trends analysis" → Predictive scaling với machine learning
- "Forecast + live changes" → Predictive + Dynamic scaling combination
- "Daily and weekly patterns" → Predictive scaling learns these patterns automatically
- Target tracking → Best dynamic scaling method cho stable metrics
- Scheduled vs Predictive → Predictive adapts, scheduled cố định

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Predictive scaling for Amazon EC2 Auto Scaling

</details>

---

<div id="question-26"></div>

### Question 26: Deletion protection on the DynamoDB tables
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company stores critical data in Amazon DynamoDB tables in the company's AWS account. An IT administrator accidentally deleted a DynamoDB table. The deletion caused a significant loss of data and disrupted the company's operations. The company wants to prevent this type of disruption in the future.

Which solution will meet this requirement with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure deletion protection on the DynamoDB tables. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create a backup and restore plan for the DynamoDB tables. Recover the DynamoDB tables manually.
- **(C)** Configure a trail in AWS CloudTrail. Create an Amazon EventBridge rule for delete actions. Create an AWS Lambda function to automatically restore deleted DynamoDB tables.
- **(D)** Enable point-in-time recovery on the DynamoDB tables.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company lưu critical data trong Amazon DynamoDB tables
> - IT administrator vô tình xóa DynamoDB table
> - Việc xóa gây significant loss of data và disrupted operations
> - Muốn ngăn chặn loại disruption này trong tương lai
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Configure deletion protection on the DynamoDB tables.

Deletion protection ngăn chặn accidental deletion của DynamoDB tables

Preventive measure - giải quyết vấn đề tại gốc thay vì reactive approach

Zero operational overhead sau khi enable - không cần monitoring, automation, hoặc manual processes

Simple configuration - chỉ cần enable một setting

No additional costs - built-in feature của DynamoDB

Most direct solution cho vấn đề accidental deletion

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure a trail in AWS CloudTrail. Create an Amazon EventBridge rule for delete actions. Create an AWS Lambda function to automatically restore deleted DynamoDB tables.**:
  High operational overhead với multiple services cần configure và maintain
  Complex automation có thể fail và require troubleshooting
  Reactive approach - data vẫn bị lost temporarily

- **Create a backup and restore plan for the DynamoDB tables. Recover the DynamoDB tables manually.**:
  → Manual recovery process tăng operational overhead và có downtime trong khi restore.

- **Enable point-in-time recovery on the DynamoDB tables.**:
  → PITR giúp recover data nhưng không prevent accidental deletion, vẫn có downtime và operational effort để restore.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Prevent accidental deletion" → Deletion protection là direct solution
- "LEAST operational overhead" → Preventive controls thay vì reactive automation
- PITR vs Deletion Protection → PITR cho recovery, deletion protection cho việc ngăn chặn

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How to use deletion protection to enhance your Amazon DynamoDB table protection strategy

</details>

---

<div id="question-27"></div>

### Question 27: An S3 Lifecycle policy that deletes incomplete multipart uploads
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company maintains about 300 TB in Amazon S3 Standard storage month after month. The S3 objects are each typically around 50 GB in size and are frequently replaced with multipart uploads by their global application. The number and size of S3 objects remain constant, but the company's S3 storage costs are increasing each month.

How should a solutions architect reduce costs in this situation?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable an S3 Lifecycle policy that deletes incomplete multipart uploads. `[Đáp án đúng ✅]`
- **(B)** Switch from multipart uploads to Amazon S3 Transfer Acceleration.
- **(C)** Configure S3 inventory to prevent objects from being archived too quickly.
- **(D)** Configure Amazon CloudFront to reduce the number of objects stored in Amazon S3.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company duy trì khoảng 300 TB trong Amazon S3 Standard storage hàng tháng
> - S3 objects khoảng 50 GB mỗi object và frequently replaced với multipart uploads
> - Số lượng và kích thước objects không đổi nhưng S3 storage costs tăng hàng tháng
> - Cần giảm costs trong tình huống này

**Phân tích giải pháp tối ưu:**
Enable an S3 Lifecycle policy that deletes incomplete multipart uploads.

Incomplete multipart uploads tạo ra hidden storage costs từ các parts không hoàn thành

Khi multipart upload bị interrupted hoặc không complete, các parts vẫn được stored và tính phí

S3 Lifecycle policy có thể automatically delete incomplete multipart uploads sau một khoảng thời gian nhất định

Cost optimization bằng cách loại bỏ unnecessary storage từ failed uploads

Explains increasing costs mặc dù object count và size không đổi

Cách thực hiện:

Vào bucket -> Management ->



Tạo Lifecycle rule actions: Delete expired object delete markers or incomplete multipart uploads

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Switch from multipart uploads to Amazon S3 Transfer Acceleration.**:
  → Transfer Acceleration cải thiện upload speed nhưng không giải quyết vấn đề storage costs tăng.

- **Configure S3 inventory to prevent objects from being archived too quickly.**:
  → S3 Inventory chỉ provide reports về objects, không prevent archiving hoặc giảm costs.

- **Configure Amazon CloudFront to reduce the number of objects stored in Amazon S3.**:
  → CloudFront là CDN service, không giảm số lượng objects stored trong S3, chỉ cache objects.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Costs increasing mặc dù object count/size không thay đổi" → Hidden storage costs từ incomplete parts
- "Multipart upload issues" → Incomplete parts consume storage và tính phí
- S3 Lifecycle policies → Có rule để cleanup incomplete multipart uploads
- Cost optimization pattern → Clean up unused/incomplete data

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Configuring a bucket lifecycle configuration to delete incomplete multipart uploads

</details>

---

<div id="question-28"></div>

### Question 28: The Kubernetes Cluster Autoscaler to manage the number of nodes in the cluster
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs container applications by using Amazon Elastic Kubernetes Service (Amazon EKS) and the Kubernetes Horizontal Pod Autoscaler. The workload is not consistent throughout the day. A solutions architect notices that the number of nodes does not automatically scale out when the existing nodes have reached maximum capacity in the cluster, which causes performance issues.

Which solution will resolve this issue with the LEAST administrative overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Scale out the nodes by tracking the memory usage.
- **(B)** Use the Kubernetes Cluster Autoscaler to manage the number of nodes in the cluster. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use an AWS Lambda function to resize the EKS cluster automatically.
- **(D)** Use an Amazon EC2 Auto Scaling group to distribute the workload.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy container applications bằng Amazon EKS và Kubernetes Horizontal Pod Autoscaler
> - Workload không nhất quán trong ngày
> - Số lượng nodes không tự động scale out khi existing nodes đã reach maximum capacity trong cluster
> - Điều này gây performance issues
> - Tìm giải pháp với LEAST administrative overhead

**Phân tích giải pháp tối ưu:**
Use the Kubernetes Cluster Autoscaler to manage the number of nodes in the cluster.

Cluster Autoscaler là Kubernetes-native solution để tự động scale số lượng nodes

Automatically adds nodes khi pods không thể schedule do insufficient resources

Automatically removes nodes khi chúng không cần thiết để optimize costs

Integrates liền mạch với EKS và AWS Auto Scaling Groups

Minimal administrative overhead - chỉ cần deploy và configure một lần

Addresses exact problem - scaling nodes khi capacity đạt maximum

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Scale out the nodes by tracking the memory usage.**:
  → Manual scaling approach, tăng administrative overhead và không automatic response.

- **(C) Use an AWS Lambda function to resize the EKS cluster automatically.**:
  Custom solution tăng administrative overhead significantly
  Cần maintain code, monitoring, và error handling
  Reinventing functionality đã có sẵn trong Cluster Autoscaler

- **(D) Use an Amazon EC2 Auto Scaling group to distribute the workload.**:
  → EC2 ASG không hiểu Kubernetes scheduling requirements và pod resource needs.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Nodes không scale out khi max capacity" → Cluster Autoscaler exact solution
- "EKS + scaling issues" → Cluster Autoscaler là standard approach
- "LEAST administrative overhead" → Native Kubernetes tools thay vì custom solutions

#### 📚 Tài liệu tham khảo chính thức (Official References):
- EKS Cluster Autoscaler

</details>

---

<div id="question-29"></div>

### Question 29: Generate and provide CloudFront signed URLs to premium customers
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A media company uses an Amazon CloudFront distribution to deliver content over the internet. The company wants only premium customers to have access to the media streams and file content. The company stores all content in an Amazon S3 bucket. The company also delivers content on demand to customers for a specific purpose, such as movie rentals or music downloads.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Generate and provide S3 signed cookies to premium customers.
- **(B)** Generate and provide CloudFront signed URLs to premium customers. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use origin access control (OAC) to limit the access of non-premium customers.
- **(D)** Generate and activate field-level encryption to block non-premium customers.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Media company sử dụng Amazon CloudFront distribution để deliver content qua internet
> - Chỉ muốn premium customers có access đến media streams và file content
> - Tất cả content được lưu trong Amazon S3 bucket
> - Cũng delivers content on demand cho customers cho mục đích cụ thể như movie rentals hoặc music downloads

**Phân tích giải pháp tối ưu:**
Generate and provide CloudFront signed URLs to premium customers.

CloudFront signed URLs cho phép tạo temporary access đến specific content

Perfect cho on-demand content như movie rentals hoặc music downloads

Time-limited access - URLs có thể expire sau khoảng thời gian nhất định

Granular control - có thể tạo signed URL cho từng piece of content riêng biệt

Premium customer authentication - chỉ authenticated premium customers nhận được signed URLs

Secure access control mà không cần expose S3 bucket directly

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Generate and provide S3 signed cookies to premium customers.**:
  → S3 signed cookies bypass CloudFront, customers sẽ access S3 directly thay vì thông qua CDN, mất lợi ích của CloudFront distribution.

- **(C) Use origin access control (OAC) to limit the access of non-premium customers.**:
  → OAC chỉ control access giữa CloudFront và S3, không phân biệt giữa premium và non-premium customers.

- **Generate and activate field-level encryption to block non-premium customers.**:
  → Field-level encryption bảo vệ sensitive data trong forms, không phải access control mechanism cho premium content.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Premium customers only" → CloudFront signed URLs cho access control
- "On-demand content delivery" → Signed URLs perfect cho temporary access
- "Movie rentals/music downloads" → Time-limited access với signed URLs
- CloudFront vs S3 access → CloudFront signed URLs maintain CDN benefits
- OAC = CloudFront-to-S3 security, không phải user access control

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How signed URLs work
- Serve private content with signed URLs and signed cookies

</details>

---

<div id="question-30"></div>

### Question 30: A transit gateway, and associate the Direct Connect connection with a new transit VIF
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has an AWS Direct Connect connection from its on-premises location to an AWS account. The AWS account has 30 different VPCs in the same AWS Region. The VPCs use private virtual interfaces (VIFs). Each VPC has a CIDR block that does not overlap with other networks under the company's control.

The company wants to centrally manage the networking architecture while still allowing each VPC to communicate with all other VPCs and on-premises networks.

Which solution will meet these requirements with the LEAST amount of operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create AWS Site-to-Site VPN connections from on premises to each VPC. Ensure that both VPN tunnels are UP for each connection. Turn on the route propagation feature.
- **(B)** Create a transit VPConnect the Direct Connect connection to the transit VPCreate a peering connection between all other VPCs in the Region. Update the route tables.
- **(C)** Create a Direct Connect gateway. Recreate the private VIFs to use the new gateway. Associate each VPC by creating new virtual private gateways.
- **(D)** Create a transit gateway, and associate the Direct Connect connection with a new transit VIF. Turn on the transit gateway's route propagation feature. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có AWS Direct Connect connection từ on-premises đến AWS account
> - AWS account có 30 different VPCs trong cùng AWS Region
> - VPCs sử dụng private virtual interfaces (VIFs)
> - Mỗi VPC có CIDR block không overlap với networks khác
> - Muốn centrally manage networking architecture nhưng vẫn cho phép each VPC communicate với all other VPCs và on-premises networks
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create a transit gateway, and associate the Direct Connect connection with a new transit VIF. Turn on the transit gateway's route propagation feature.

Transit Gateway là central hub cho việc kết nối multiple VPCs và on-premises networks

Transit VIF kết nối Direct Connect với Transit Gateway hiệu quả hơn multiple private VIFs

Route propagation tự động manage routing giữa all connected networks

Centralized management - single point để control all network connections

Scalable solution - dễ dàng add/remove VPCs mà không impact existing connections

Least operational overhead - automatic routing thay vì manual route table management

AWS Direct Connect and AWS Transit Gateway

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a Direct Connect gateway. Recreate the private VIFs to use the new gateway. Associate each VPC by creating new virtual private gateways.**:
  → Direct Connect Gateway không enable VPC-to-VPC communication, chỉ on-premises-to-VPC, cần additional solutions cho inter-VPC connectivity.

- **Create a transit VPC. Connect the Direct Connect connection to the transit VPC. Create a peering connection between all other VPCs in the Region.**:
  → Transit VPC approach phức tạp hơn và require manual management của peering connections (29 VPCs = hàng trăm peering connections).

- **Create AWS Site-to-Site VPN connections from on premises to each VPC.**:
  → Thay thế Direct Connect bằng VPN giảm performance và tăng complexity với 30 separate VPN connections.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Centrally manage + 30 VPCs" → Transit Gateway là optimal hub-and-spoke model
- "Direct Connect + multiple VPCs" → Transit VIF thay vì multiple private VIFs
- "All VPCs communicate với nhau" → Transit Gateway enable full mesh connectivity
- "LEAST operational overhead" → Automatic route propagation thay vì manual routing
- Direct Connect Gateway vs Transit Gateway → Transit Gateway support inter-VPC communication

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Direct Connect + AWS Transit Gateway

</details>

---

<div id="question-31"></div>

### Question 31: An AWS Lambda function that runs custom developed code
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company wants to rearchitect a large-scale web application to a serverless microservices architecture. The application uses Amazon EC2 instances and is written in Python.

The company selected one component of the web application to test as a microservice. The component supports hundreds of requests each second. The company wants to create and test the microservice on an AWS solution that supports Python. The solution must also scale automatically and require minimal infrastructure and minimal operational support.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an AWS Lambda function that runs custom developed code. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon Elastic Kubernetes Service (Amazon EKS). Launch Auto Scaling groups of self-managed EC2 instances.
- **(C)** Use an AWS Elastic Beanstalk web server environment that has high availability configured.
- **(D)** Use a Spot Fleet with auto scaling of EC2 instances that run the most recent Amazon Linux operating system.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company muốn rearchitect large-scale web application thành serverless microservices architecture
> - Application hiện tại sử dụng EC2 instances và written in Python
> - Đã chọn one component để test như microservice
> - Component này supports hundreds of requests mỗi giây
> - Muốn tạo và test microservice trên AWS solution hỗ trợ Python
> - Solution phải scale automatically và require minimal infrastructure và operational support

**Phân tích giải pháp tối ưu:**
Use an AWS Lambda function that runs custom developed code.

AWS Lambda là truly serverless solution với zero infrastructure management

Native Python support - perfect cho existing Python codebase

Automatic scaling - Lambda tự động scale để handle hundreds of requests per second

Pay-per-request pricing - cost-effective cho microservices architecture

Minimal operational support - AWS manages tất cả underlying infrastructure

Perfect for microservices - event-driven, stateless execution model

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use a Spot Fleet with auto scaling of EC2 instances that run the most recent Amazon Linux operating system.**:
  → Vẫn require infrastructure management và không phải serverless approach như yêu cầu.

- **(C) Use an AWS Elastic Beanstalk web server environment that has high availability configured.**:
  → Elastic Beanstalk vẫn manage EC2 instances bên dưới, không phải truly serverless và có infrastructure overhead.

- **(B) Use Amazon Elastic Kubernetes Service (Amazon EKS). Launch Auto Scaling groups of self-managed EC2 instances.**:
  → EKS với self-managed instances có highest operational overhead và complexity, không meet minimal infrastructure requirement.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-32"></div>

### Question 32: Run the application on Amazon Elastic Container Service (Amazon ECS) as microservi...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A manufacturing company runs its report generation application on AWS. The application generates each report in about 20 minutes. The application is built as a monolith that runs on a single Amazon EC2 instance. The application requires frequent updates to its tightly coupled modules. The application becomes complex to maintain as the company adds new features.

Each time the company patches a software module, the application experiences downtime. Report generation must restart from the beginning after any interruptions. The company wants to redesign the application so that the application can be flexible, scalable, and gradually improved. The company wants to minimize application downtime.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Run the application on Amazon EC2 Spot Instances as microservices with a Spot Fleet default allocation strategy.
- **(B)** Run the application on AWS Lambda as a single function with maximum provisioned concurrency.
- **(C)** Run the application on Amazon Elastic Container Service (Amazon ECS) as microservices with service auto scaling. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Run the application on AWS Elastic Beanstalk as a single application environment with an all-at-once deployment strategy.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Manufacturing company chạy report generation application trên AWS
> - Mỗi report tạo trong khoảng 20 phút
> - Application là monolith chạy trên single EC2 instance
> - Application có tightly coupled modules cần frequent updates
> - Application trở nên complex để maintain khi thêm new features
> - Mỗi lần patch software module gây application downtime
> - Report generation phải restart from beginning sau bất kỳ interruptions nào
> - Muốn redesign application để flexible, scalable, và improved dần dần
> - Muốn minimize application downtime

**Phân tích giải pháp tối ưu:**
Run the application on Amazon Elastic Container Service (Amazon ECS) as microservices with service auto scaling.

Microservices architecture giải quyết tightly coupled modules problem

ECS cung cấp container orchestration cho microservices deployment

Service auto scaling đảm bảo scalability based on demand

Independent deployments - có thể update individual microservices mà không affect toàn bộ application

Minimize downtime vì chỉ affected microservice cần restart, không phải entire application

Gradually improved - có thể migrate từng module thành microservice

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Run the application on AWS Lambda as a single function with maximum provisioned concurrency.**:
  → Lambda có 15-minute execution time limit, không phù hợp cho reports tạo trong 20 phút, và single function vẫn là monolith.

- **(A) Run the application on Amazon EC2 Spot Instances as microservices with a Spot Fleet default allocation strategy.**:
  → Spot Instances có thể bị interrupted bất cứ lúc nào, làm tăng downtime risk cho long-running report generation.

- **(D) Run the application on AWS Elastic Beanstalk as a single application environment with an all-at-once deployment strategy.**:
  → Vẫn là single application (monolith) và all-at-once deployment strategy gây complete downtime during updates.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Monolith → flexible/scalable" → Microservices architecture
- "Minimize downtime" → Independent service deployments
- "20-minute reports" → Lambda không phù hợp (15-min limit)
- "Tightly coupled modules" → Microservices decouple dependencies

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Best practices for deploying microservices on Amazon ECS

</details>

---

<div id="question-33"></div>

### Question 33: An Amazon FSx for ONTAP instance
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is migrating a large amount of data from on-premises storage to AWS. Windows, Mac, and Linux based Amazon EC2 instances in the same AWS Region will access the data by using SMB and NFS storage protocols. The company will access a portion of the data routinely. The company will access the remaining data infrequently.

The company needs to design a solution to host the data.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon FSx for OpenZFS file system. Migrate the data to the new volume.
- **(B)** Create an Amazon S3 bucket that uses S3 Intelligent-Tiering. Migrate the data to the S3 bucket by using an AWS Storage Gateway Amazon S3 File Gateway.
- **(C)** Create an Amazon FSx for ONTAP instance. Create an FSx for ONTAP file system with a root volume that uses the auto tiering policy. Migrate the data to the FSx for ONTAP volume. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Amazon Elastic File System (Amazon EFS) volume that uses EFS Intelligent-Tiering. Use AWS DataSync to migrate the data to the EFS volume.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang migrate large amount of data từ on-premises storage lên AWS
> - Windows, Mac, và Linux EC2 instances trong cùng AWS Region sẽ access data bằng SMB và NFS protocols
> - Company sẽ access một phần data thường xuyên, phần còn lại ít thường xuyên
> - Cần thiết kế solution để host data với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an Amazon FSx for ONTAP instance. Create an FSx for ONTAP file system with a root volume that uses the auto tiering policy. Migrate the data to the FSx for ONTAP volume.

FSx for ONTAP hỗ trợ cả SMB và NFS protocols natively

Auto tiering policy tự động move data giữa performance và capacity tiers dựa trên access patterns

Frequently accessed data ở performance tier, infrequently accessed data ở capacity tier

Fully managed service với minimal operational overhead

Multi-protocol support phù hợp cho Windows, Mac, và Linux instances

Cost optimization thông qua automatic tiering

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon Elastic File System (Amazon EFS) volume that uses EFS Intelligent-Tiering. Use AWS DataSync to migrate the data to the EFS volume.**:
  → EFS chỉ hỗ trợ NFS protocol, không hỗ trợ SMB protocol cho Windows instances.

- **Create an Amazon S3 bucket that uses S3 Intelligent-Tiering. Migrate the data to the S3 bucket by using an AWS Storage Gateway Amazon S3 File Gateway.**:
  S3 File Gateway hỗ trợ cả SMB và NFS protocols như yêu cầu
  S3 Intelligent-Tiering tự động optimize costs cho frequently và infrequently accessed data
  Additional operational overhead với việc deploy và manage File Gateway appliance (VM hoặc hardware)
  Gateway management require monitoring, patching, và maintenance
  Network dependency - performance phụ thuộc vào connection giữa EC2 instances và gateway

- **Create an Amazon FSx for OpenZFS file system. Migrate the data to the new volume.**:
  → FSx for OpenZFS chỉ hỗ trợ NFS protocol, không có SMB support và không có automatic tiering cho cost optimization.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SMB + NFS protocols" → FSx for ONTAP hỗ trợ cả hai
- "Routine + infrequent access" → Auto tiering cho cost optimization
- "Windows, Mac, Linux" → Cần multi-protocol file system
- "LEAST operational overhead" → Fully managed services với automatic features
- EFS = NFS only, FSx for Windows = SMB only, FSx for ONTAP = both

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Amazon FSx for NetApp ONTAP

</details>

---

<div id="question-34"></div>

### Question 34: The Apache Hadoop application and the Apache Spark application to Amazon EMR clust...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company’s applications use Apache Hadoop and Apache Spark to process data on premises. The existing infrastructure is not scalable and is complex to manage.

A solutions architect must design a scalable solution that reduces operational complexity. The solution must keep the data processing on premises.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an AWS Snowball device to migrate the data to an Amazon S3 bucket. Create an Amazon EMR cluster to process the data.
- **(B)** Migrate the Apache Hadoop application and the Apache Spark application to Amazon EMR clusters on AWS Outposts. Use the EMR clusters to process the data. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use AWS DataSync to connect to the on-premises Hadoop Distributed File System (HDFS) cluster. Create an Amazon EMR cluster to process the data.
- **(D)** Use AWS Site-to-Site VPN to access the on-premises Hadoop Distributed File System (HDFS) data and application. Use an Amazon EMR cluster to process the data.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Apache Hadoop và Apache Spark để xử lý data on premises
> - Existing infrastructure không scalable và complex để manage
> - Solutions architect cần thiết kế scalable solution giảm operational complexity
> - Solution phải keep data processing on premises

**Phân tích giải pháp tối ưu:**
Migrate the Apache Hadoop application and the Apache Spark application to Amazon EMR clusters on AWS Outposts. Use the EMR clusters to process the data.

AWS Outposts mang AWS services lên on-premises location, đáp ứng yêu cầu keep processing on premises

Amazon EMR là managed service giảm operational complexity so với self-managed Hadoop/Spark

EMR clusters có thể scale automatically để handle varying workloads

Managed EMR trên Outposts giảm infrastructure management overhead

Native support cho Apache Hadoop và Apache Spark applications

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use AWS Site-to-Site VPN to access the on-premises Hadoop Distributed File System (HDFS) data and application. Use an Amazon EMR cluster to process the data.**:
  → EMR cluster chạy trên AWS cloud, không phải on premises như yêu cầu.

- **(C) Use AWS DataSync to connect to the on-premises Hadoop Distributed File System (HDFS) cluster. Create an Amazon EMR cluster to process the data.**:
  → EMR cluster vẫn chạy trên AWS cloud, vi phạm requirement về on-premises processing.

- **(A) Use an AWS Snowball device to migrate the data to an Amazon S3 bucket. Create an Amazon EMR cluster to process the data.**:
  → Data được migrate lên cloud và processing xảy ra trên AWS, không phải on premises.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Keep data processing on premises" → AWS Outposts là only option
- "Scalable + reduce complexity" → Managed EMR thay vì self-managed infrastructure
- AWS Outposts → Brings AWS services to on-premises locations
- EMR on Outposts → Managed Hadoop/Spark với AWS operational benefits
- On-premises vs Cloud → Outposts bridge gap giữa on-premises requirements và cloud benefits

#### 📚 Tài liệu tham khảo chính thức (Official References):
- EMR clusters on AWS Outposts

</details>

---

<div id="question-35"></div>

### Question 35: Public subnets in the existing VPC
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs a real-time data ingestion solution on AWS. The solution consists of the most recent version of Amazon Managed Streaming for Apache Kafka (Amazon MSK). The solution is deployed in a VPC in private subnets across three Availability Zones.

A solutions architect needs to redesign the data ingestion solution to be publicly available over the internet. The data in transit must also be encrypted.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure public subnets in the existing VPC. Deploy an MSK cluster in the public subnets. Update the MSK cluster security settings to enable mutual TLS authentication. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create a new VPC that has public subnets. Deploy an MSK cluster in the public subnets. Update the MSK cluster security settings to enable mutual TLS authentication.
- **(C)** Deploy an Application Load Balancer (ALB) that uses private subnets. Configure an ALB security group inbound rule to allow inbound traffic from the VPC CIDR block for HTTPS protocol.
- **(D)** Deploy a Network Load Balancer (NLB) that uses private subnets. Configure an NLB listener for HTTPS communication over the internet.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy real-time data ingestion solution với Amazon MSK (phiên bản mới nhất)
> - Solution được deploy trong VPC với private subnets across three Availability Zones
> - Solutions architect cần redesign để publicly available over internet
> - Data in transit phải được encrypted
> - Tìm giải pháp với MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Configure public subnets in the existing VPC. Deploy an MSK cluster in the public subnets. Update the MSK cluster security settings to enable mutual TLS authentication.

MSK có built-in public access feature với no additional cost

Configure public subnets trong existing VPC có operational efficiency cao vì không cần tạo new VPC

Mutual TLS authentication cung cấp encryption in transit và secure access control

MSK native public access đáp ứng requirements để make cluster publicly available

Direct approach không cần additional layers như load balancers

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a new VPC that has public subnets. Deploy an MSK cluster in the public subnets. Update the MSK cluster security settings to enable mutual TLS authentication.**:
  → Tạo new VPC tăng operational overhead so với configure public subnets trong existing VPC.

- **Deploy an Application Load Balancer (ALB) that uses private subnets. Configure an ALB security group inbound rule to allow inbound traffic from the VPC CIDR block for HTTPS protocol.**:
  → ALB rule chỉ allow VPC traffic, không provide internet access, và ALB không optimal cho MSK streaming protocols.

- **Deploy a Network Load Balancer (NLB) that uses private subnets. Configure an NLB listener for HTTPS communication over the internet.**:
  → Thêm load balancer layer khi MSK có native public access capability, giảm operational efficiency.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "MSK publicly available" → MSK native public access với built-in feature
- "MOST operational efficiency" → Use existing VPC thay vì tạo new infrastructure
- "Data in transit encryption" → mTLS authentication đáp ứng requirement

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Turn on public access to an MSK Provisioned cluster

</details>

---

<div id="question-36"></div>

### Question 36: A daily budget for the Savings Plans by using AWS Budgets
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company uses Amazon EC2, AWS Fargate, and AWS Lambda to run multiple workloads in the company's AWS account. The company wants to fully make use of its Compute Savings Plans. The company wants to receive notification when coverage of the Compute Savings Plans drops.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a Savings Plans alert subscription. Enable all notification options. Enter an email address to receive notifications.
- **(B)** Create a daily budget for the Savings Plans by using AWS Budgets. Configure the budget with a coverage threshold to send notifications to the appropriate email message recipients. `[Đáp án đúng ✅]`
- **(C)** Create a Lambda function that runs a coverage report against the Savings Plans. Use Amazon Simple Email Service (Amazon SES) to email the report to the appropriate email message recipients.
- **(D)** Create an AWS Budgets report for the Savings Plans budget. Set the frequency to daily.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng EC2, AWS Fargate, và AWS Lambda để chạy multiple workloads
> - Muốn tận dụng tối đa Compute Savings Plans
> - Muốn nhận notification khi phạm vi cover của Compute Savings Plans giảm
> - Tìm giải pháp với MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Create a daily budget for the Savings Plans by using AWS Budgets. Configure the budget with a coverage threshold to send notifications to the appropriate email message recipients.

AWS Budgets có built-in coverage threshold alerts cho Savings Plans

Coverage monitoring tự động track việc sửu dụng của Savings Plans

Threshold-based notifications gửi alerts khi mức cover giảm below mức quy định

Fully managed service với minimal operational overhead

Configurable notifications có thể gửi đến multiple email recipients

Native AWS integration không cần custom development

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a Lambda function that runs a coverage report against the Savings Plans. Use Amazon Simple Email Service (Amazon SES) to email the report to the appropriate email message recipients.**:
  → Custom solution tăng operational overhead với code development, maintenance, và scheduling requirements.

- **Create an AWS Budgets report for the Savings Plans budget. Set the frequency to daily.**:
  → Budgets report chỉ provide scheduled reports, không có threshold-based alerting khi coverage drops.

- **Create a Savings Plans alert subscription. Enable all notification options. Enter an email address to receive notifications.**:
  → Savings Plans alert subscription không cung cấp coverage threshold alerts như AWS Budgets.
  → Savings Plans alerts được sử dụng để:
  Expiration notifications - Nhận thông báo trước khi Savings Plans hết hạn (1, 7, 30, hoặc 60 ngày trước)
  Queued purchases alerts - Thông báo khi có Savings Plans commitment đang được queue để purchase
  Expiration date alerts - Thông báo vào chính ngày Savings Plans expires

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Coverage drops notification" → AWS Budgets coverage threshold alerts
- "MOST operational efficiency" → Native AWS services thay vì custom solutions
- "Savings Plans monitoring" → AWS Budgets có built-in Savings Plans support

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Using budgets for Savings Plans

</details>

---

<div id="question-37"></div>

### Question 37: The photos in the Amazon S3 Intelligent-Tiering storage class
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is running a photo hosting service in the us-east-1 Region. The service enables users across multiple countries to upload and view photos. Some photos are heavily viewed for months, and others are viewed for less than a week. The application allows uploads of up to 20 MB for each photo. The service uses the photo metadata to determine which photos to display to each user.

Which solution provides the appropriate user access MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the photos in the Amazon S3 Standard storage class. Set up an S3 Lifecycle policy to move photos older than 30 days to the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Use the object tags to keep track of metadata.
- **(B)** Store the photos in the Amazon S3 Intelligent-Tiering storage class. Store the photo metadata and its S3 location in DynamoDB. `[Đáp án đúng ✅]`
- **(C)** Store the photos in the Amazon S3 Glacier storage class. Set up an S3 Lifecycle policy to move photos older than 30 days to the S3 Glacier Deep Archive storage class. Store the photo metadata and its S3 location in Amazon OpenSearch Service.
- **(D)** Store the photos in Amazon DynamoDB. Turn on DynamoDB Accelerator (DAX) to cache frequently viewed items.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy photo hosting service trong us-east-1 Region
> - Users từ multiple countries có thể upload và view photos
> - Một số photos được xem nhiều trong nhiều tháng, những photos khác chỉ được xem trong vòng chưa đến một tuần
> - Application cho phép uploads up to 20 MB mỗi photo
> - Service sử dụng photo metadata để xác định photos nào hiển thị cho từng user
> - Tìm giải pháp MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Store the photos in the Amazon S3 Intelligent-Tiering storage class. Store the photo metadata and its S3 location in DynamoDB.

S3 Intelligent-Tiering tự động move objects giữa access tiers dựa trên usage patterns

Frequently accessed photos sẽ ở Frequent Access tier, infrequently accessed photos move to Infrequent Access tier

Cost optimization automatic mà không cần predict access patterns

DynamoDB optimal cho photo metadata storage với fast query performance

No lifecycle management overhead - Intelligent-Tiering handle transitions tự động

Perfect cho unpredictable access patterns như described trong scenario

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Store the photos in Amazon DynamoDB. Turn on DynamoDB Accelerator (DAX) to cache frequently viewed items.**:
  → DynamoDB không được thiết kế cho large binary objects như 20 MB photos, sẽ rất expensive và inefficient.

- **Store the photos in the Amazon S3 Standard storage class. Set up an S3 Lifecycle policy to move photos older than 30 days to the S3 Standard-IA storage class.**:
  → transition sau 30 ngày không tối ưu vì một số photos được xem nhiều trong nhiều tháng, có thể bị move sang IA khi vẫn đang frequently accessed.

- **(C) Store the photos in the Amazon S3 Glacier storage class. Set up an S3 Lifecycle policy to move photos older than 30 days to the S3 Glacier Deep Archive storage class.**:
  → Glacier không phù hợp cho photos cần immediate access, có retrieval time và costs.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-38"></div>

### Question 38: Additional reader instances to the Aurora cluster
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An ecommerce company runs its application on AWS. The application uses an Amazon Aurora PostgreSQL cluster in Multi-AZ mode for the underlying database. During a recent promotional campaign, the application experienced heavy read load and write load. Users experienced timeout issues when they attempted to access the application.

A solutions architect needs to make the application architecture more scalable and highly available.

Which solution will meet these requirements with the LEAST downtime?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon ElastiCache for Redis cache. Replicate data from the Aurora cluster to Redis by using AWS Database Migration Service (AWS DMS) with a write-around approach.
- **(B)** Create an Amazon EventBridge rule that has the Aurora cluster as a source. Create an AWS Lambda function to log the state change events of the Aurora cluster. Add the Lambda function as a target for the EventBridge rule. Add additional reader nodes to fail over to.
- **(C)** Add additional reader instances to the Aurora cluster. Create an Amazon RDS Proxy target group for the Aurora cluster. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Modify the Aurora cluster and activate the zero-downtime restart (ZDR) feature. Use Database Activity Streams on the cluster to track the cluster status.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ecommerce company chạy application với Amazon Aurora PostgreSQL cluster trong Multi-AZ mode
> - Trong promotional campaign gần đây, application gặp heavy read load và write load
> - Users gặp timeout issues khi truy cập application
> - Cần make application architecture more scalable và highly available
> - Tìm giải pháp với LEAST downtime

**Phân tích giải pháp tối ưu:**
Add additional reader instances to the Aurora cluster. Create an Amazon RDS Proxy target group for the Aurora cluster.

Additional reader instances giải quyết heavy read load bằng cách distribute read traffic

RDS Proxy cung cấp connection pooling để handle connection spikes và reduce timeout issues

RDS Proxy target group automatically route traffic đến healthy instances

Zero downtime khi add reader instances - Aurora support online scaling

Improves both scalability và availability - more readers + connection management

Direct solution cho cả read load và connection timeout problems

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon EventBridge rule that has the Aurora cluster as a source. Create an AWS Lambda function to log the state change events of the Aurora cluster.**:
  → EventBridge và Lambda chỉ monitor cluster events, không giải quyết performance issues hoặc scalability.

- **(D) Modify the Aurora cluster and activate the zero-downtime restart (ZDR) feature. Use Database Activity Streams on the cluster to track the cluster status.**:
  → ZDR và Activity Streams là monitoring/maintenance features, không address heavy load issues.

- **Create an Amazon ElastiCache for Redis cache. Replicate data from the Aurora cluster to Redis by using AWS Database Migration Service (AWS DMS) with a write-around approach.**:
  → Complex solution với DMS setup có thể có downtime, và Write-around approach trong caching không tối ưu cho ecommerce scenarios

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Heavy read load" → Additional reader instances distribute read traffic
- "Timeout issues" → RDS Proxy connection pooling manage connections efficiently
- "LEAST downtime" → Aurora online scaling + RDS Proxy deployment
- "More scalable và highly available" → More readers + proxy management
- Connection pooling → Critical cho handling traffic spikes trong promotional campaigns

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Managing an RDS Proxy

</details>

---

<div id="question-39"></div>

### Question 39: S3 bucket policies to allow access from a VPC endpoint
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company’s website hosted on Amazon EC2 instances processes classified data stored in Amazon S3. Due to security concerns, the company requires a private and secure connection between its EC2 resources and Amazon S3.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a NAT gateway to access resources outside the private subnet.
- **(B)** Set up an IAM policy to grant read-write access to the S3 bucket.
- **(C)** Set up an access key ID and a secret access key to access the S3 bucket.
- **(D)** Set up S3 bucket policies to allow access from a VPC endpoint. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company website được host trên Amazon EC2 instances xử lý classified data lưu trong Amazon S3
> - Do security concerns, company yêu cầu private và secure connection giữa EC2 resources và Amazon S3

**Phân tích giải pháp tối ưu:**
Set up S3 bucket policies to allow access from a VPC endpoint.

VPC endpoint cho S3 tạo private connection giữa VPC và S3 service mà không đi qua internet

S3 bucket policies có thể restrict access chỉ từ specific VPC endpoint

Traffic remains within AWS backbone - không traverse public internet

Meet security requirement cho classified data với private connectivity

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Set up an IAM policy to grant read-write access to the S3 bucket.**:
  → IAM policy chỉ control permissions, không tạo private connection - traffic vẫn có thể đi qua internet.

- **(A) Set up a NAT gateway to access resources outside the private subnet.**:
  → NAT gateway vẫn route traffic through internet, không provide private connection như yêu cầu.

- **(C) Set up an access key ID and a secret access key to access the S3 bucket.**:
  → Access keys chỉ là authentication method, không đảm bảo private connectivity.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Private and secure connection" → VPC endpoint cho AWS services
- "Classified data security" → Avoid internet routing với VPC endpoints

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Controlling access from VPC endpoints with bucket policies

</details>

---

<div id="question-40"></div>

### Question 40: Attach the SCP to the three nonproduction Organizations member accounts and an OU ...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A company has an organization in AWS Organizations. The company runs Amazon EC2 instances across four AWS accounts in the root organizational unit (OU). There are three nonproduction accounts and one production account. The company wants to prohibit users from launching EC2 instances of a certain size in the nonproduction accounts. The company has created a service control policy (SCP) to deny access to launch instances that use the prohibited types.

Which solutions to deploy the SCP will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Attach the SCP to the root OU for the organization.
- **(B)** Attach the SCP to the three nonproduction Organizations member accounts. `[Đáp án đúng ✅]`
- **(C)** Attach the SCP to the Organizations management account.
- **(D)** Create an OU for the production account. Attach the SCP to the OU. Move the production member account into the new OU.
- **(E)** Create an OU for the required accounts. Attach the SCP to the OU. Move the nonproduction member accounts into the new OU. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có organization trong AWS Organizations với 4 AWS accounts trong root OU
> - 3 nonproduction accounts và 1 production account
> - Muốn ngăn chặn users khỏi việc khởi chạy EC2 instances có kích thước nhất định trong nonproduction accounts
> - Đã tạo service control policy (SCP) để deny quyền truy cập để khởi chạy các loại instance bị cấm
> - Choose two solutions để deploy SCP

**Phân tích giải pháp tối ưu:**
Attach the SCP to the three nonproduction Organizations member accounts.

Direct attachment to nonproduction accounts đảm bảo SCP chỉ apply cho accounts cần restrict

Granular control - chỉ affect nonproduction accounts, production account không bị impact



Create an OU for the required accounts. Attach the SCP to the OU. Move the nonproduction member accounts into the new OU.

OU-based approach cho phép centralized management của nonproduction accounts

Scalable solution - dễ add/remove accounts vào OU mà không cần modify SCP attachments

Clean organizational structure - separate nonproduction từ production accounts

Best practice cho Organizations management với logical grouping

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Attach the SCP to the root OU for the organization.**:
  → Root OU attachment sẽ apply policy cho tất cả accounts including production account.

- **Attach the SCP to the Organizations management account.**:
  → Management account attachment không apply policy cho member accounts.

- **Create an OU for the production account. Attach the SCP to the OU. Move the production member account into the new OU.**:
  → Tạo OU cho production account nhưng attach restrictive SCP sẽ restrict production account thay vì nonproduction accounts.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Nonproduction accounts only" → Target specific accounts hoặc create separate OU
- SCP inheritance → Policies attach ở OU apply cho all child accounts
- Management account → SCPs không apply cho management account itself

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Service control policies (SCPs)

</details>

---

<div id="question-41"></div>

### Question 41: Public NAT gateways in public subnets in the same VPCs as the EC2 instances
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to use NAT gateways in its AWS environment. The company's Amazon EC2 instances in private subnets must be able to connect to the public internet through the NAT gateways.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create public NAT gateways in the same private subnets as the EC2 instances.
- **(B)** Create private NAT gateways in the same private subnets as the EC2 instances.
- **(C)** Create private NAT gateways in public subnets in the same VPCs as the EC2 instances.
- **(D)** Create public NAT gateways in public subnets in the same VPCs as the EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company muốn sử dụng NAT gateways trong AWS environment
> - EC2 instances trong private subnets phải có khả năng kết nối đến public internet thông qua NAT gateways

**Phân tích giải pháp tối ưu:**
Create public NAT gateways in public subnets in the same VPCs as the EC2 instances.

NAT gateways phải được đặt trong public subnets để có internet access

Public NAT gateways cần Elastic IP addresses để communicate với internet

EC2 instances trong private subnets route traffic đến NAT gateway để reach internet

Same VPC requirement đảm bảo routing có thể được configured properly

Standard architecture pattern cho outbound internet connectivity từ private subnets

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create public NAT gateways in the same private subnets as the EC2 instances.**:
  → NAT gateways không thể hoạt động trong private subnets vì chúng cần direct internet access.

- **Create private NAT gateways in the same private subnets as the EC2 instances.**:
  → Private NAT gateways được dùng cho VPC-to-VPC communication, không cho internet access.

- **Create private NAT gateways in public subnets in the same VPCs as the EC2 instances.**:
  → Private NAT gateways không provide internet connectivity, chỉ dành cho internal VPC communication.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "EC2 in private subnets connect to internet" → Public NAT gateway required
- "NAT gateway placement" → Phải trong public subnets để có internet access
- Public vs Private NAT gateway → Public cho internet, Private cho VPC-to-VPC
- Internet connectivity pattern → Private subnet → NAT gateway (in public subnet) → Internet Gateway

#### 📚 Tài liệu tham khảo chính thức (Official References):
- NAT gateways

</details>

---

<div id="question-42"></div>

### Question 42: ALB access logging to Amazon S3
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is using an Application Load Balancer (ALB) to present its application to the internet. The company finds abnormal traffic access patterns across the application. A solutions architect needs to improve visibility into the infrastructure to help the company understand these abnormalities better.

What is the MOST operationally efficient solution that meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EMR on a dedicated Amazon EC2 instance to directly query the ALB to acquire traffic access log information.
- **(B)** Enable ALB access logging to Amazon S3. Open each file in a text editor, and search each line for the relevant information.
- **(C)** Enable ALB access logging to Amazon S3. Create a table in Amazon Athena, and query the logs. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a table in Amazon Athena for AWS CloudTrail logs. Create a query for the relevant information.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Application Load Balancer (ALB) để present application đến internet
> - Company phát hiện abnormal traffic access patterns across application
> - Solutions architect cần cải thiện khả năng hiển thị into infrastructure để hiểu hơn những bất thường này
> - Tìm MOST operationally efficient solution

**Phân tích giải pháp tối ưu:**
Enable ALB access logging to Amazon S3. Create a table in Amazon Athena, and query the logs.

ALB access logs cung cấp detailed traffic information including request patterns, source IPs, response codes

S3 storage cost-effective cho log retention và analysis

Amazon Athena cho phép SQL queries trực tiếp trên S3 data mà không cần data loading

Serverless và managed - minimal operational overhead

Scalable analysis có thể handle large volumes của access logs efficiently

Xem link tham khảo để biết cách config ALB access log và sử dụng Athena để truy vấn

Ví dụ sử dụng Athena query trên ALB access logs

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a table in Amazon Athena for AWS CloudTrail logs. Create a query for the relevant information.**:
  → CloudTrail logs capture API calls, không phải application traffic patterns và access details như ALB logs.

- **Enable ALB access logging to Amazon S3. Open each file in a text editor, and search each line for the relevant information.**:
  → Manual file analysis không operationally efficient và không scalable cho large log volumes.

- **(A) Use Amazon EMR on a dedicated Amazon EC2 instance to directly query the ALB to acquire traffic access log information.**:
  → EMR overkill cho log analysis và không thể directly query ALB - cần enable logging first.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Abnormal traffic patterns" → ALB access logs provide detailed traffic visibility
- "MOST operationally efficient" → Athena serverless queries thay vì manual analysis
- CloudTrail vs ALB logs → CloudTrail cho API calls, ALB logs cho application traffic
- S3 + Athena pattern → Standard approach cho log analysis

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Enable access logs for your Application Load Balancer
- Query Application Load Balancer logs

</details>

---

<div id="question-43"></div>

### Question 43: A read replica of the database
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company hosts a database that runs on an Amazon RDS instance that is deployed to multiple Availability Zones. The company periodically runs a script against the database to report new entries that are added to the database. The script that runs against the database negatively affects the performance of a critical application. The company needs to improve application performance with minimal costs.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Add functionality to the script to identify the instance that has the fewest active connections. Configure the script to read from that instance to report the total new entries.
- **(B)** Create a read replica of the database. Configure the script to query only the read replica to report the total new entries. `[Đáp án đúng ✅]`
- **(C)** Instruct the development team to manually export the new entries for the day in the database at the end of each day.
- **(D)** Use Amazon ElastiCache to cache the common queries that the script runs against the database.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company host database trên RDS instance deployed to multiple Availability Zones
> - Định kỳ chạy script against database để report new entries được add vào database
> - Script ảnh hưởng tiêu cực đến hiệu suất của critical application
> - Cần cải thiện application performance với minimal costs
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create a read replica of the database. Configure the script to query only the read replica to report the total new entries.

Read replica tách biệt read workload khỏi primary database

Script chạy trên read replica không impact performance của critical application trên primary instance

Automatic synchronization giữa primary và read replica đảm bảo data consistency

Minimal operational overhead - RDS managed read replica setup và maintenance

Cost-effective solution so với scaling primary instance hoặc complex caching layers

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Add functionality to the script to identify the instance that has the fewest active connections. Configure the script to read from that instance to report the total new entries.**:
  → Multi-AZ RDS chỉ có standby instance cho failover, không phải multiple active instances cho load balancing.

- **(C) Instruct the development team to manually export the new entries for the day in the database at the end of each day.**:
  → Manual process tăng operational overhead và không scalable, có thể có human errors.

- **(D) Use Amazon ElastiCache to cache the common queries that the script runs against the database.**:
  → ElastiCache thêm complexity và costs, không guarantee fresh data cho reporting new entries.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Script affects critical application performance" → Read replica isolates workloads
- "LEAST operational overhead" → RDS managed read replica thay vì manual processes
- "Minimal costs" → Read replica cost-effective hơn scaling primary instance
- Multi-AZ vs Read Replica → Multi-AZ cho HA, Read Replica cho performance

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Working with DB instance read replicas

</details>

---

<div id="question-44"></div>

### Question 44: Define an AWS Database Migration Service (AWS DMS) task with change data capture (...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C), (D)

#### 📋 Đề bài (Scenario)
A company runs a three-tier application in a VPC. The database tier uses an Amazon RDS for MySQL DB instance.

The company plans to migrate the RDS for MySQL DB instance to an Amazon Aurora PostgreSQL DB cluster. The company needs a solution that replicates the data changes that happen during the migration to the new database.

Which combination of steps will meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Database Migration Service (AWS DMS) Schema Conversion to transform the database objects.
- **(B)** Use AWS Database Migration Service (AWS DMS) Schema Conversion to create an Aurora PostgreSQL read replica on the RDS for MySQL DB instance.
- **(C)** Configure an Aurora MySQL read replica for the RDS for MySQL DB instance. `[Đáp án đúng ✅]`
- **(D)** Define an AWS Database Migration Service (AWS DMS) task with change data capture (CDC) to migrate the data. `[Đáp án đúng ✅]`
- **(E)** Promote the Aurora PostgreSQL read replica to a standalone Aurora PostgreSQL DB cluster when the replica lag is zero.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy three-tier application trong VPC với database tier sử dụng Amazon RDS for MySQL
> - Dự định migrate RDS MySQL sang Amazon Aurora PostgreSQL DB cluster
> - Cần solution replicate data changes xảy ra during migration đến new database
> - Choose two combination of steps

**Phân tích giải pháp tối ưu:**
Use AWS Database Migration Service (AWS DMS) Schema Conversion to transform the database objects.

Schema Conversion Tool (SCT) convert database schema từ MySQL sang PostgreSQL format

Database objects transformation bao gồm tables, indexes, constraints, stored procedures

Essential step cho cross-engine migration từ MySQL sang PostgreSQL

Automated conversion giảm manual effort và errors

Define an AWS Database Migration Service (AWS DMS) task with change data capture (CDC) to migrate the data.

DMS task handle actual data migration từ source đến target database

Change Data Capture (CDC) replicate ongoing changes during migration process

Continuous replication đảm bảo target database stays synchronized với source

Minimal downtime migration vì CDC captures real-time changes

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use AWS Database Migration Service (AWS DMS) Schema Conversion to create an Aurora PostgreSQL read replica on the RDS for MySQL DB instance.**:
  → Không thể tạo PostgreSQL read replica từ MySQL instance - different database engines.

- **Configure an Aurora MySQL read replica for the RDS for MySQL DB instance.**:
  → Tạo Aurora MySQL replica không giải quyết requirement migrate sang PostgreSQL.

- **(E) Promote the Aurora PostgreSQL read replica to a standalone Aurora PostgreSQL DB cluster when the replica lag is zero.**:
  → Cannot create cross-engine read replica, vậy nên không thể promote.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "MySQL to PostgreSQL migration" → Cross-engine migration cần DMS + SCT
- "Replicate data changes during migration" → CDC essential feature

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is AWS Database Migration Service?
- Converting database schemas using DMS Schema Conversion

</details>

---

<div id="question-45"></div>

### Question 45: A Network Load Balancer with the required protocol and ports for the internet traffic
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An online video game company must maintain ultra-low latency for its game servers. The game servers run on Amazon EC2 instances. The company needs a solution that can handle millions of UDP internet traffic requests each second.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Launch an identical set of game servers on EC2 instances in separate AWS Regions. Route internet traffic to both sets of EC2 instances.
- **(B)** Configure an Application Load Balancer with the required protocol and ports for the internet traffic. Specify the EC2 instances as the targets.
- **(C)** Configure a Network Load Balancer with the required protocol and ports for the internet traffic. Specify the EC2 instances as the targets. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Configure a Gateway Load Balancer for the internet traffic. Specify the EC2 instances as the targets.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Online video game company cần maintain ultra-low latency cho game servers
> - Game servers chạy trên EC2 instances
> - Cần solution handle millions of UDP internet traffic requests mỗi giây
> - Tìm giải pháp MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Configure a Network Load Balancer with the required protocol and ports for the internet traffic. Specify the EC2 instances as the targets.

Network Load Balancer hoạt động ở Layer 4 với ultra-low latency performance

Native UDP support - perfect cho game server traffic requirements

Handle millions of requests per second với high throughput capability

Cost-effective - chỉ pay cho actual usage, không có additional compute costs

Direct routing preserve source IP addresses quan trọng cho gaming applications

Health checks đảm bảo traffic chỉ route đến healthy game servers

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an Application Load Balancer with the required protocol and ports for the internet traffic.**:
  → ALB hoạt động ở Layer 7, không hỗ trợ UDP protocol, chỉ support HTTP/HTTPS.

- **Configure a Gateway Load Balancer for the internet traffic.**:
  → GWLB được thiết kế cho network appliances và security services, không phù hợp cho game server traffic.

- **(A) Launch an identical set of game servers on EC2 instances in separate AWS Regions.**:
  → Multi-region deployment tăng costs significantly và không address load balancing requirements.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "UDP traffic" → Network Load Balancer là only AWS LB hỗ trợ UDP
- "Ultra-low latency gaming" → Layer 4 NLB performance tốt hơn Layer 7 ALB
- "Millions of requests per second" → NLB built cho high-throughput scenarios

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is a Network Load Balancer?

</details>

---

<div id="question-46"></div>

### Question 46: An AWS DataSync agent on the on-premises servers, and sync the data to Amazon S3
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company has NFS servers in an on-premises data center that need to periodically back up small amounts of data to Amazon S3.

Which solution meets these requirements and is MOST cost-effective?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an AWS Direct Connect connection between the on-premises data center and a VPC, and copy the data to Amazon S3.
- **(B)** Set up AWS Glue to copy the data from the on-premises servers to Amazon S3.
- **(C)** Set up an SFTP sync using AWS Transfer for SFTP to sync data from on premises to Amazon S3.
- **(D)** Set up an AWS DataSync agent on the on-premises servers, and sync the data to Amazon S3. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có NFS servers trong on-premises data center
> - Cần periodically back up small amounts of data lên Amazon S3
> - Tìm solution MOST cost-effective

**Phân tích giải pháp tối ưu:**
Set up an AWS DataSync agent on the on-premises servers, and sync the data to Amazon S3.

AWS DataSync được thiết kế đặc biệt cho data transfer từ on-premises sang AWS

DataSync agent có thể deploy trên on-premises để access NFS servers

Cost-effective cho periodic backups vì chỉ pay cho data transferred

Optimized transfer với compression và bandwidth throttling

Simple setup và minimal operational overhead

Built-in scheduling cho periodic backup requirements

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Set up AWS Glue to copy the data from the on-premises servers to Amazon S3.**:
  → AWS Glue là ETL service cho data processing, không phải data transfer tool cho backup scenarios.

- **(C) Set up an SFTP sync using AWS Transfer for SFTP to sync data from on premises to Amazon S3.**:
  → AWS Transfer for SFTP require SFTP protocol, nhưng đề bài có NFS servers, không phù hợp và thêm complexity.

- **(A) Set up an AWS Direct Connect connection between the on-premises data center and a VPC, and copy the data to Amazon S3.**:
  → Direct Connect có high setup costs và monthly charges, không cost-effective cho small amounts of data backup.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-47"></div>

### Question 47: An Amazon S3 bucket
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company copies 200 TB of data from a recent ocean survey onto AWS Snowball Edge Storage Optimized devices. The company has a high performance computing (HPC) cluster that is hosted on AWS to look for oil and gas deposits. A solutions architect must provide the cluster with consistent sub-millisecond latency and high-throughput access to the data on the Snowball Edge Storage Optimized devices. The company is sending the devices back to AWS.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon FSx for Lustre file system. Import the data directly into the FSx for Lustre file system. Access the FSx for Lustre file system from the HPC cluster instances.
- **(B)** Create an Amazon S3 bucket and an Amazon Elastic File System (Amazon EFS) file system. Import the data into the S3 bucket. Copy the data from the S3 bucket to the EFS file system. Access the EFS file system from the HPC cluster instances.
- **(C)** Create an Amazon S3 bucket. Import the data into the S3 bucket. Configure an Amazon FSx for Lustre file system, and integrate it with the S3 bucket. Access the FSx for Lustre file system from the HPC cluster instances. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Amazon S3 bucket. Import the data into the S3 bucket. Configure an AWS Storage Gateway file gateway to use the S3 bucket. Access the file gateway from the HPC cluster instances.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company copy 200 TB data từ ocean survey lên AWS Snowball Edge Storage Optimized devices
> - Có HPC cluster hosted trên AWS để tìm oil và gas deposits
> - Solutions architect phải provide cluster với consistent sub-millisecond latency và high-throughput access đến data
> - Company đang gửi devices về AWS

**Phân tích giải pháp tối ưu:**
Create an Amazon S3 bucket. Import the data into the S3 bucket. Configure an Amazon FSx for Lustre file system, and integrate it with the S3 bucket. Access the FSx for Lustre file system from the HPC cluster instances.

FSx for Lustre được thiết kế đặc biệt cho HPC workloads với sub-millisecond latency

S3 integration cho phép FSx Lustre access data directly từ S3 bucket

High-throughput performance - FSx Lustre có thể achieve hundreds of GB/s throughput

Optimized cho HPC - Lustre file system standard trong HPC environments

Data import workflow - Snowball data → S3 → FSx Lustre integration

Kiến trúc tương tự: Migrate large HPC datasets from the edge to the cloud then synchronize continuously

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon S3 bucket. Import the data into the S3 bucket. Configure an AWS Storage Gateway file gateway to use the S3 bucket.**:
  → File Gateway không provide sub-millisecond latency required cho HPC workloads.

- **Create an Amazon S3 bucket and an Amazon Elastic File System (Amazon EFS) file system. Import the data into the S3 bucket. Copy the data from the S3 bucket to the EFS file system.**:
  → EFS không được optimize cho HPC performance requirements và copying 200TB từ S3 tốn thời gian.

- **Create an Amazon FSx for Lustre file system. Import the data directly into the FSx for Lustre file system.**:
  → Snowball Edge devices import data vào S3, không thể import directly vào FSx Lustre.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "HPC + sub-millisecond latency" → FSx for Lustre specialized cho HPC workloads
- "Snowball Edge workflow" → Data import vào S3 first, then integrate với other services

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Enhanced Amazon S3 Integration for Amazon FSx for Lustre

</details>

---

<div id="question-48"></div>

### Question 48: Subscribe to AWS Shield Advanced
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A city has deployed a web application running on Amazon EC2 instances behind an Application Load Balancer (ALB). The application's users have reported sporadic performance, which appears to be related to DDoS attacks originating from random IP addresses. The city needs a solution that requires minimal configuration changes and provides an audit trail for the DDoS sources.

Which solution meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable an AWS WAF web ACL on the ALB, and configure rules to block traffic from unknown sources.
- **(B)** Create an Amazon CloudFront distribution for the application, and set the ALB as the origin. Enable an AWS WAF web ACL on the distribution, and configure rules to block traffic from unknown sources
- **(C)** Subscribe to Amazon Inspector. Engage the AWS DDoS Response Team (DRT) to integrate mitigating controls into the service.
- **(D)** Subscribe to AWS Shield Advanced. Engage the AWS DDoS Response Team (DRT) to integrate mitigating controls into the service. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - City deploy web application trên EC2 instances phía sau ALB
> - Users báo cáo performance không ổn định liên quan đến DDoS attacks từ random IP addresses
> - Cần solution với minimal configuration changes và cung cấp audit trail cho DDoS sources

**Phân tích giải pháp tối ưu:**
Subscribe to AWS Shield Advanced. Engage the AWS DDoS Response Team (DRT) to integrate mitigating controls into the service.

AWS Shield Advanced cung cấp enhanced DDoS protection cho Layer 3, 4, và 7 attacks

DDoS Response Team (DRT) có chuyên môn để handle complex DDoS scenarios

Detailed attack diagnostics và reporting cung cấp audit trail cho attack sources

Minimal configuration changes - Shield Advanced tự động protect ALB

Cost protection - refund cho scaling charges during DDoS attacks

24/7 access đến DRT support team

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable an AWS WAF web ACL on the ALB, and configure rules to block traffic from unknown sources.**:
  → WAF cần manual rule configuration và không cung cấp comprehensive DDoS protection như Shield Advanced.

- **(C) Subscribe to Amazon Inspector. Engage the AWS DDoS Response Team (DRT) to integrate mitigating controls into the service.**:
  → Amazon Inspector là vulnerability assessment service, không phải DDoS protection service.

- **Create an Amazon CloudFront distribution for the application, and set the ALB as the origin. Enable an AWS WAF web ACL on the distribution.**:
  → Thêm CloudFront là significant architecture change, không meet "minimal configuration changes" requirement.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "DDoS attacks + audit trail" → AWS Shield Advanced với detailed reporting
- "Minimal configuration changes" → Shield Advanced automatic protection
- "Random IP addresses" → DRT expertise cần thiết cho sophisticated attacks
- Shield Standard vs Advanced → Advanced có DRT support và detailed analytics

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Subscribing to AWS Shield Advanced

</details>

---

<div id="question-49"></div>

### Question 49: Internal Network Load Balancers in front of the application in each Region and an ...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A gaming company wants to launch a new internet-facing application in multiple AWS Regions. The application will use the TCP and UDP protocols for communication. The company needs to provide high availability and minimum latency for global users.

Which combination of actions should a solutions architect take to meet these requirements? (Choose two.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create external Application Load Balancers in front of the application in each Region.
- **(B)** Create internal Network Load Balancers in front of the application in each Region. `[Đáp án đúng ✅]`
- **(C)** Configure Amazon CloudFront to handle the traffic and route requests to the application in each Region
- **(D)** Configure Amazon Route 53 to use a geolocation routing policy to distribute the traffic.
- **(E)** Create an AWS Global Accelerator accelerator to route traffic to the load balancers in each Region. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Gaming company muốn launch internet-facing application trong multiple AWS Regions
> - Application sử dụng TCP và UDP protocols cho communication
> - Cần provide high availability và minimum latency cho global users
> - Choose two combination of actions

**Phân tích giải pháp tối ưu:**
Create internal Network Load Balancers in front of the application in each Region.

Network Load Balancer hỗ trợ cả TCP và UDP protocols như yêu cầu

Internal NLB optimal cho backend application traffic trong từng region

High performance và low latency cho gaming applications

Health checks đảm bảo high availability

Create an AWS Global Accelerator accelerator to route traffic to the load balancers in each Region.

Global Accelerator provide global load balancing và route traffic đến nearest healthy region

Anycast IP addresses giảm latency bằng cách route traffic qua AWS global network

Automatic failover giữa regions đảm bảo high availability

Performance optimization cho global users với edge locations

Architecture:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create external Application Load Balancers in front of the application in each Region.**:
  → ALB chỉ hỗ trợ HTTP/HTTPS, không hỗ trợ UDP protocol cần thiết cho gaming applications.

- **Configure Amazon Route 53 to use a geolocation routing policy to distribute the traffic.**:
  → Route 53 DNS-based routing có higher latency so với Global Accelerator's network-level optimization.

- **Configure Amazon CloudFront to handle the traffic and route requests to the application in each Region.**:
  → CloudFront là CDN cho HTTP/HTTPS content, không handle TCP/UDP protocols cho gaming traffic.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "TCP and UDP protocols" → Network Load Balancer là only option
- "Minimum latency for global users" → Global Accelerator better than DNS routing
- Gaming applications → NLB performance tốt hơn ALB cho real-time traffic
- Global Accelerator vs CloudFront → Global Accelerator cho TCP/UDP, CloudFront cho HTTP/HTTPS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- What is AWS Global Accelerator?

</details>

---

<div id="question-50"></div>

### Question 50: Amazon Elastic Container Service (Amazon ECS) with an AWS Fargate launch type
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has an application that uses Docker containers in its local data center. The application runs on a container host that stores persistent data in a volume on the host. The container instances use the stored persistent data.

The company wants to move the application to a fully managed service because the company does not want to manage any servers or storage infrastructure.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Elastic Container Service (Amazon ECS) with an AWS Fargate launch type. Create an Amazon S3 bucket. Map the S3 bucket as a persistent storage volume mounted in the containers.
- **(B)** Use Amazon Elastic Container Service (Amazon ECS) with an AWS Fargate launch type. Create an Amazon Elastic File System (Amazon EFS) volume. Add the EFS volume as a persistent storage volume mounted in the containers. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon Elastic Container Service (Amazon ECS) with an Amazon EC2 launch type. Create an Amazon Elastic File System (Amazon EFS) volume. Add the EFS volume as a persistent storage volume mounted in the containers.
- **(D)** Use Amazon Elastic Kubernetes Service (Amazon EKS) with self-managed nodes. Create an Amazon Elastic Block Store (Amazon EBS) volume attached to an Amazon EC2 instance. Use the EBS volume as a persistent volume mounted in the containers.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company có application sử dụng Docker containers trong local data center
> - Application chạy trên container host lưu persistent data trong volume trên host
> - Container instances sử dụng stored persistent data
> - Muốn move application sang fully managed service vì không muốn manage servers hoặc storage infrastructure

**Phân tích giải pháp tối ưu:**
Use Amazon Elastic Container Service (Amazon ECS) with an AWS Fargate launch type. Create an Amazon Elastic File System (Amazon EFS) volume. Add the EFS volume as a persistent storage volume mounted in the containers.

ECS với Fargate là fully managed service - AWS quản lý tất cả underlying infrastructure

No servers to manage - Fargate serverless container platform

EFS volume cung cấp persistent storage có thể share giữa multiple containers

EFS mount targets cho phép containers access persistent data

Scalable và managed storage - không cần manage storage infrastructure

Architecture: Developers guide to using Amazon EFS with Amazon ECS and AWS Fargate

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use Amazon Elastic Kubernetes Service (Amazon EKS) with self-managed nodes. Create an Amazon Elastic Block Store (Amazon EBS) volume attached to an Amazon EC2 instance.**:
  → Self-managed nodes yêu cầu manage servers, không meet "fully managed" requirement.

- **(A) Use Amazon Elastic Container Service (Amazon ECS) with an AWS Fargate launch type. Create an Amazon S3 bucket. Map the S3 bucket as a persistent storage volume mounted in the containers.**:
  → S3 không thể mount như file system volume trong containers, S3 là object storage không phải file storage.

- **(C) Use Amazon Elastic Container Service (Amazon ECS) with an Amazon EC2 launch type. Create an Amazon Elastic File System (Amazon EFS) volume.**:
  → EC2 launch type yêu cầu manage EC2 instances, không phải fully managed như Fargate.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Fully managed + no servers" → Fargate thay vì EC2 launch type
- "Persistent storage for containers" → EFS support container mounting
- "No storage infrastructure management" → EFS là managed file system
- EFS vs EBS vs S3 → EFS cho shared file storage, EBS cho single instance, S3 cho object storage

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Use Amazon EFS volumes with Amazon ECS
- Storage options for Amazon ECS tasks

</details>

---

<div id="question-51"></div>

### Question 51: An Amazon Elastic File System (Amazon EFS) file system
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is deploying a new application to Amazon Elastic Kubernetes Service (Amazon EKS) with an AWS Fargate cluster. The application needs a storage solution for data persistence. The solution must be highly available and fault tolerant. The solution also must be shared between multiple application containers.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create Amazon Elastic File System (Amazon EFS) file systems in the same Availability Zones where EKS worker nodes are placed. Register the file systems in a StorageClass object on an EKS cluster. Create an AWS Lambda function to synchronize the data between file systems.
- **(B)** Create an Amazon Elastic Block Store (Amazon EBS) volume. Register the volume in a StorageClass object on an EKS cluster. Use the same volume for all containers.
- **(C)** Create an Amazon Elastic File System (Amazon EFS) file system. Register the file system in a StorageClass object on an EKS cluster. Use the same file system for all containers. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create Amazon Elastic Block Store (Amazon EBS) volumes in the same Availability Zones where EKS worker nodes are placed. Register the volumes in a StorageClass object on an EKS cluster. Use EBS Multi-Attach to share the data between containers.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang deploy application mới đến Amazon EKS với AWS Fargate cluster
> - Application cần storage solution cho data persistence
> - Solution phải highly available và fault tolerant
> - Solution cũng phải được share giữa multiple application containers
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an Amazon Elastic File System (Amazon EFS) file system. Register the file system in a StorageClass object on an EKS cluster. Use the same file system for all containers.

EFS là fully managed NFS file system với built-in high availability across multiple AZs

Shared access - multiple containers có thể mount cùng EFS file system đồng thời

EKS native integration với EFS CSI driver cho seamless storage provisioning

Fault tolerant - EFS automatically replicate data across multiple AZs

Least operational overhead - fully managed service không cần setup synchronization

Architecture: Multi-Region Disaster Recovery with Amazon EKS and Amazon EFS for Stateful workloads

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create Amazon Elastic Block Store (Amazon EBS) volumes in the same Availability Zones where EKS worker nodes are placed. Register the volumes in a StorageClass object on an EKS cluster. Use EBS Multi-Attach to share the data between containers.**:
  → EBS Multi-Attach chỉ support specific instance types và có hạn chế, phức tạp hơn EFS cho shared access.

- **Create an Amazon Elastic Block Store (Amazon EBS) volume. Register the volume in a StorageClass object on an EKS cluster. Use the same volume for all containers.**:
  → EBS volume chỉ có thể attach đến một node tại một thời điểm, không support concurrent shared access.

- **Create Amazon Elastic File System (Amazon EFS) file systems in the same Availability Zones where EKS worker nodes are placed. Register the file systems in a StorageClass object on an EKS cluster. Create an AWS Lambda function to synchronize the data between file systems.**:
  → Multiple EFS file systems với Lambda synchronization tăng complexity và operational overhead không cần thiết.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Shared between multiple containers" → EFS là optimal choice cho shared file storage
- "EKS + Fargate" → EFS có native support, EBS có limitations với Fargate
- "LEAST operational overhead" → Single EFS thay vì multiple file systems với synchronization
- Concurrent access → EFS design cho multiple concurrent connections

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Use elastic file system storage with Amazon EFS
- Multi-Region Disaster Recovery with Amazon EKS and Amazon EFS for Stateful workloads

</details>

---

<div id="question-52"></div>

### Question 52: Provision an internet-facing Application Load Balancer (ALB) in a public subnet
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A solutions architect creates a VPC that includes two public subnets and two private subnets. A corporate security mandate requires the solutions architect to launch all Amazon EC2 instances in a private subnet. However, when the solutions architect launches an EC2 instance that runs a web server on ports 80 and 443 in a private subnet, no external internet traffic can connect to the server.

What should the solutions architect do to resolve this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Attach the EC2 instance to an Auto Scaling group in a private subnet. Ensure that the DNS record for the website resolves to the Auto Scaling group identifier.
- **(B)** Launch a NAT gateway in a private subnet. Update the route table for the private subnets to add a default route to the NAT gateway. Attach a public Elastic IP address to the NAT gateway.
- **(C)** Provision an internet-facing Application Load Balancer (ALB) in a public subnet. Add the EC2 instance to the target group that is associated with the ALB. Ensure that the DNS record for the website resolves to the ALB. `[Đáp án đúng ✅]`
- **(D)** Ensure that the security group that is attached to the EC2 instance allows HTTP traffic on port 80 and HTTPS traffic on port 443. Ensure that the DNS record for the website resolves to the public IP address of the EC2 instance.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Solutions architect tạo VPC với 2 public subnets và 2 private subnets
> - Corporate security mandate yêu cầu launch tất cả EC2 instances trong private subnet
> - Khi launch EC2 instance chạy web server trên ports 80 và 443 trong private subnet, không có external internet traffic có thể kết nối đến server

**Phân tích giải pháp tối ưu:**
Provision an internet-facing Application Load Balancer (ALB) in a public subnet. Add the EC2 instance to the target group that is associated with the ALB. Ensure that the DNS record for the website resolves to the ALB.

ALB trong public subnet có thể nhận external internet traffic

EC2 instances trong private subnet vẫn tuân thủ security mandate

ALB forward traffic đến EC2 instances trong private subnet thông qua internal routing

DNS resolves đến ALB cho phép external users access website

Security và accessibility - giữ servers private nhưng vẫn serve web traffic

Architecture: Application Load Balancer

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Attach the EC2 instance to an Auto Scaling group in a private subnet. Ensure that the DNS record for the website resolves to the Auto Scaling group identifier.**:
  → Auto Scaling group trong private subnet vẫn không giải quyết vấn đề internet connectivity, và ASG identifier không phải là routable endpoint.

- **(B) Launch a NAT gateway in a private subnet. Update the route table for the private subnets to add a default route to the NAT gateway.**:
  → NAT gateway phải được đặt trong public subnet, không phải private subnet, và NAT gateway cho outbound traffic, không phải inbound.

- **Ensure that the security group that is attached to the EC2 instance allows HTTP traffic on port 80 and HTTPS traffic on port 443. Ensure that the DNS record for the website resolves to the public IP address of the EC2 instance.**:
  → EC2 trong private subnet không có public IP address, vi phạm security mandate về private placement.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-53"></div>

### Question 53: Provision a separate AWS Key Management Service (AWS KMS) key for each customer
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company needs to provide customers with secure access to its data. The company processes customer data and stores the results in an Amazon S3 bucket.

All the data is subject to strong regulations and security requirements. The data must be encrypted at rest. Each customer must be able to access only their data from their AWS account. Company employees must not be able to access the data.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provision an AWS Certificate Manager (ACM) certificate for each customer. Encrypt the data client-side. In the private certificate policy, deny access to the certificate for all principals except an IAM role that the customer provides.
- **(B)** Provision a separate AWS Key Management Service (AWS KMS) key for each customer. Encrypt the data server-side. In the S3 bucket policy, deny decryption of data for all principals except an IAM role that the customer provides.
- **(C)** Provision a separate AWS Key Management Service (AWS KMS) key for each customer. Encrypt the data server-side. In each KMS key policy, deny decryption of data for all principals except an IAM role that the customer provides. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Provision an AWS Certificate Manager (ACM) certificate for each customer. Encrypt the data client-side. In the public certificate policy, deny access to the certificate for all principals except an IAM role that the customer provides.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company cần cung cấp secure access cho customers đến data của họ
> - Company xử lý customer data và lưu results trong S3 bucket
> - Tất cả data chịu quy định nghiêm ngặt và security requirements
> - Data phải được encrypted at rest
> - Mỗi customer chỉ có thể access data của họ từ AWS account của họ
> - Company employees không được access data

**Phân tích giải pháp tối ưu:**
Provision a separate AWS Key Management Service (AWS KMS) key for each customer. Encrypt the data server-side. In each KMS key policy, deny decryption of data for all principals except an IAM role that the customer provides.

Separate KMS key cho mỗi customer đảm bảo data isolation và kiểm soát truy cập chi tiết

Server-side encryption với KMS đáp ứng encryption at rest requirement

KMS key policy control chính xác ai có thể decrypt data

Customer-provided IAM role đảm bảo chỉ customer có quyền access data của họ

Company employees denied access thông qua key policy restrictions

Regulatory compliance - KMS designed cho strong security requirements

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Provision an AWS Certificate Manager (ACM) certificate for each customer. Encrypt the data client-side. In the private certificate policy, deny access to the certificate for all principals except an IAM role that the customer provides.**:
  → ACM certificates dành cho SSL/TLS, không phải cho data encryption at rest, và client-side encryption tăng complexity.

- **(B) Provision a separate AWS Key Management Service (AWS KMS) key for each customer. Encrypt the data server-side. In the S3 bucket policy, deny decryption of data for all principals except an IAM role that the customer provides.**:
  → S3 bucket policy không control KMS decryption permissions - phải dùng KMS key policy.

- **(D) Provision an AWS Certificate Manager (ACM) certificate for each customer. Encrypt the data client-side. In the public certificate policy, deny access to the certificate for all principals except an IAM role that the customer provides.**:
  → ACM không phù hợp cho data encryption, và public certificates không dành cho access control.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Each customer access only their data" → Separate KMS keys cho data isolation
- "Company employees cannot access" → KMS key policy control access
- "Encrypted at rest" → Server-side encryption với KMS
- ACM vs KMS → ACM cho SSL certificates, KMS cho data encryption

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Key policies in AWS KMS

</details>

---

<div id="question-54"></div>

### Question 54: Amazon CloudWatch Container Insights to collect metrics from the EKS clusters
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is building a microservices-based application that will be deployed on Amazon Elastic Kubernetes Service (Amazon EKS). The microservices will interact with each other. The company wants to ensure that the application is observable to identify performance issues in the future.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon CloudWatch Container Insights to collect metrics from the EKS clusters. Configure AWS X-Ray to trace the requests between the microservices. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure the application to use Amazon ElastiCache to reduce the number of requests that are sent to the microservices.
- **(C)** Configure AWS CloudTrail to review the API calls. Build an Amazon QuickSight dashboard to observe the microservice interactions.
- **(D)** Use AWS Trusted Advisor to understand the performance of the application.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang xây dựng microservices-based application sẽ được deploy trên Amazon EKS
> - Microservices sẽ tương tác với nhau
> - Company muốn đảm bảo application có thể quan sát được để identify performance issues trong tương lai

**Phân tích giải pháp tối ưu:**
Configure Amazon CloudWatch Container Insights to collect metrics from the EKS clusters. Configure AWS X-Ray to trace the requests between the microservices.

CloudWatch Container Insights cung cấp monitoring toàn diện cho EKS clusters với metrics về CPU, memory, network, disk usage

AWS X-Ray cung cấp distributed tracing để track requests đi qua multiple microservices

End-to-end observability - Container Insights cho infrastructure metrics, X-Ray cho application-level tracing

Performance issue identification - có thể pinpoint bottlenecks trong microservice interactions

Native integration với EKS và microservices architecture

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the application to use Amazon ElastiCache to reduce the number of requests that are sent to the microservices.**:
  → ElastiCache là caching solution để improve performance, không phải observability tool để identify performance issues.

- **Configure AWS CloudTrail to review the API calls. Build an Amazon QuickSight dashboard to observe the microservice interactions.**:
  → CloudTrail track AWS API calls, không track application-level microservice interactions và performance metrics.

- **(D) Use AWS Trusted Advisor to understand the performance of the application.**:
  → Trusted Advisor cung cấp best practice recommendations cho AWS resources, không monitor application performance real-time.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Microservices observability" → Distributed tracing với X-Ray essential
- "EKS performance monitoring" → Container Insights cho cluster-level metrics
- "Application performance issues" → Cần both infrastructure và application monitoring
- Observability vs Performance optimization → Monitoring tools thay vì caching solutions

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Setting up Container Insights on Amazon EKS and Kubernetes

</details>

---

<div id="question-55"></div>

### Question 55: Set the Auto Scaling group's minimum capacity to four
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs a stateful production application on Amazon EC2 instances. The application requires at least two EC2 instances to always be running.

A solutions architect needs to design a highly available and fault-tolerant architecture for the application. The solutions architect creates an Auto Scaling group of EC2 instances.

Which set of additional steps should the solutions architect take to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set the Auto Scaling group's minimum capacity to two. Deploy four Spot Instances in one Availability Zone.
- **(B)** Set the Auto Scaling group's minimum capacity to four. Deploy two On-Demand Instances in one Availability Zone and two On-Demand Instances in a second Availability Zone.
- **(C)** Set the Auto Scaling group's minimum capacity to four. Deploy two On-Demand Instances in one Availability Zone and two Spot Instances in a second Availability Zone. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Set the Auto Scaling group's minimum capacity to two. Deploy one On-Demand Instance in one Availability Zone and one On-Demand Instance in a second Availability Zone.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy stateful production application trên Amazon EC2 instances
> - Application yêu cầu ít nhất 2 EC2 instances luôn running
> - Solutions architect cần thiết kế highly available và fault-tolerant architecture
> - Đã tạo Auto Scaling group của EC2 instances

**Phân tích giải pháp tối ưu:**
Set the Auto Scaling group's minimum capacity to four. Deploy two On-Demand Instances in one Availability Zone and two On-Demand Instances in a second Availability Zone.

Minimum capacity = 4 đảm bảo có thể tồn tại hoàn toàn khi AZ failure và vẫn đáp ứng requirement

2 instances per AZ - nếu 1 AZ hoàn toàn fail, vẫn còn 2 instances trong AZ khác

True fault tolerance - application vẫn function normally với đủ capacity ngay cả trong worst-case scenario

On-Demand instances đảm bảo reliability cho stateful production application

Highly available architecture - không có single point of failure tại AZ level

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Set the Auto Scaling group's minimum capacity to two. Deploy one On-Demand Instance in one Availability Zone and one On-Demand Instance in a second Availability Zone.**:
  → Nếu 1 AZ fail, chỉ còn 1 instance - không đủ để meet requirement "at least 2 instances always running".

- **(A) Set the Auto Scaling group's minimum capacity to two. Deploy four Spot Instances in one Availability Zone.**:
  → Spot instances không suitable cho stateful applications vì có thể bị interrupted, và single AZ deployment không fault-tolerant.

- **(C) Set the Auto Scaling group's minimum capacity to four. Deploy two On-Demand Instances in one Availability Zone and two Spot Instances in a second Availability Zone.**:
  → Spot instances có thể bị interrupted, không reliable cho stateful production applications.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-56"></div>

### Question 56: The application on an Amazon EC2 instance
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company uses locally attached storage to run a latency-sensitive application on premises. The company is using a lift and shift method to move the application to the AWS Cloud. The company does not want to change the application architecture.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an Auto Scaling group with an Amazon EC2 instance. Use an Amazon FSx for OpenZFS file system to run the application.
- **(B)** Configure an Auto Scaling group with an Amazon EC2 instance. Use an Amazon FSx for Lustre file system to run the application.
- **(C)** Host the application on an Amazon EC2 instance. Use an Amazon Elastic Block Store (Amazon EBS) GP3 volume to run the application. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Host the application on an Amazon EC2 instance. Use an Amazon Elastic Block Store (Amazon EBS) GP2 volume to run the application.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng locally attached storage để chạy latency-sensitive application on premises
> - Sử dụng lift and shift method để move application lên AWS Cloud
> - Không muốn thay đổi application architecture
> - Tìm giải pháp MOST cost-effectively

**Phân tích giải pháp tối ưu:**
Host the application on an Amazon EC2 instance. Use an Amazon Elastic Block Store (Amazon EBS) GP3 volume to run the application.

EBS volumes cung cấp block-level storage tương tự locally attached storage on premises

GP3 volumes cost-effective hơn GP2 với same performance baseline và có khả năng provision IOPS không phụ thuộc EBS size

Low latency - EBS GP3 designed cho latency-sensitive applications

Lift and shift compatible - không cần thay đổi application architecture

No Auto Scaling complexity - single EC2 instance approach đơn giản cho migration

Most cost-effective - GP3 pricing model better than GP2

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an Auto Scaling group with an Amazon EC2 instance. Use an Amazon FSx for Lustre file system to run the application.**:
  → Auto Scaling group và FSx Lustre overkill cho simple lift-and-shift, tăng costs và complexity không cần thiết.

- **Host the application on an Amazon EC2 instance. Use an Amazon Elastic Block Store (Amazon EBS) GP2 volume to run the application.**:
  → GP2 volumes đắt hơn GP3 cho same performance level, không cost-effective.

- **Configure an Auto Scaling group with an Amazon EC2 instance. Use an Amazon FSx for OpenZFS file system to run the application.**:
  → Auto Scaling và FSx OpenZFS thêm complexity và costs, không phù hợp cho straightforward lift-and-shift scenario.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Lift and shift" → Minimal architecture changes, simple EC2 + EBS approach
- "Locally attached storage" → EBS block storage equivalent trên AWS
- "MOST cost-effectively" → GP3 volumes cost-effective hơn GP2
- "Latency-sensitive" → EBS GP3 provide consistent low-latency performance
- Auto Scaling complexity → Không cần thiết cho simple migration scenarios

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Lift and Shift: 2025 Guide to Cloud Migration
- 6 Strategies for Migrating Applications to the Cloud

</details>

---

<div id="question-57"></div>

### Question 57: The Instance Scheduler on AWS to configure start and stop schedules
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company runs an application that uses Amazon RDS for PostgreSQL. The application receives traffic only on weekdays during business hours. The company wants to optimize costs and reduce operational overhead based on this usage.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase All Upfront reserved DB instances.
- **(B)** Create a custom AWS Lambda function to start and stop the database based on minimum CPU utilization.
- **(C)** Turn off automatic backups. Create weekly manual snapshots of the database.
- **(D)** Use the Instance Scheduler on AWS to configure start and stop schedules. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company chạy application sử dụng Amazon RDS for PostgreSQL
> - Application chỉ nhận traffic vào weekdays trong business hours
> - Muốn optimize costs và reduce operational overhead dựa trên usage pattern này

**Phân tích giải pháp tối ưu:**
Use the Instance Scheduler on AWS to configure start and stop schedules.

Instance Scheduler là AWS solution được thiết kế đặc biệt cho việc schedule start/stop EC2 và RDS instances

Automated scheduling dựa trên business hours - có thể configure để chỉ chạy weekdays

Significant cost savings - chỉ pay cho RDS instance khi actually running

Minimal operational overhead - fully managed solution, không cần maintain custom code

Flexible scheduling - có thể adjust schedules dễ dàng khi business requirements change

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Turn off automatic backups. Create weekly manual snapshots of the database.**:
  → Tắt automatic backups tăng risk mất data và manual snapshots tăng operational overhead, không address việc optimize costs cho unused time.

- **Create a custom AWS Lambda function to start and stop the database based on minimum CPU utilization.**:
  → Custom Lambda solution tăng operational overhead với code maintenance, monitoring, và debugging requirements.

- **(A) Purchase All Upfront reserved DB instances.**:
  → Reserved instances không cost-effective khi database chỉ chạy part-time, vì vẫn pay full cost cho unused hours.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Traffic only weekdays/business hours" → Scheduled start/stop perfect use case
- "Reduce operational overhead" → Managed AWS solutions thay vì custom development

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Instance Scheduler on AWS

</details>

---

<div id="question-58"></div>

### Question 58: DynamoDB Accelerator (DAX)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company deployed a serverless application that uses Amazon DynamoDB as a database layer. The application has experienced a large increase in users. The company wants to improve database response time from milliseconds to microseconds and to cache requests to the database.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use DynamoDB Accelerator (DAX). `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon ElastiCache for Redis.
- **(C)** Migrate the database to Amazon RDS.
- **(D)** Migrate the database to Amazon Redshift.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company deploy serverless application sử dụng Amazon DynamoDB làm database layer
> - Application đã có large increase in users
> - Muốn cải thiện database response time từ milliseconds xuống microseconds
> - Muốn cache requests đến database
> - Tìm giải pháp với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Use DynamoDB Accelerator (DAX).

DAX là fully managed in-memory cache được thiết kế đặc biệt cho DynamoDB

Microsecond latency - DAX cung cấp response time ở mức microseconds như yêu cầu

Native DynamoDB integration - hoạt động như transparent cache layer

Zero application code changes - applications có thể sử dụng DAX với minimal modifications

Fully managed service - AWS handle tất cả cache management, maintenance, scaling

Least operational overhead - no cache invalidation logic hoặc complex setup required

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Migrate the database to Amazon Redshift.**:
  → Redshift là data warehouse solution, không phù hợp cho transactional workloads của serverless applications và có high migration overhead.

- **(C) Migrate the database to Amazon RDS.**:
  → Migration từ DynamoDB sang RDS đòi hỏi nhiều công việc vận hành và RDS không thể đảm bảo thời gian phản hồi ở mức microsecond như yêu cầu

- **(B) Use Amazon ElastiCache for Redis.**:
  → ElastiCache yêu cầu custom caching logic, cache invalidation strategies, và application code changes - tăng operational overhead.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "DynamoDB + microsecond latency" → DAX là purpose-built solution
- "LEAST operational overhead" → Native integration tốt hơn custom caching solutions

#### 📚 Tài liệu tham khảo chính thức (Official References):
- In-memory acceleration with DynamoDB Accelerator (DAX)

</details>

---

<div id="question-59"></div>

### Question 59: AWS Certificate Manager (ACM) to create a certificate
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company uses an Amazon CloudFront distribution to serve content pages for its website. The company needs to ensure that clients use a TLS certificate when accessing the company's website. The company wants to automate the creation and renewal of the TLS certificates.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Certificate Manager (ACM) to create a certificate. Use email validation for the domain.
- **(B)** Use a CloudFront security policy to create a certificate.
- **(C)** Use a CloudFront origin access control (OAC) to create a certificate.
- **(D)** Use AWS Certificate Manager (ACM) to create a certificate. Use DNS validation for the domain. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company sử dụng Amazon CloudFront distribution để serve content pages cho website
> - Cần đảm bảo clients sử dụng TLS certificate khi access website
> - Muốn automate creation và renewal của TLS certificates
> - Tìm giải pháp với MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Use AWS Certificate Manager (ACM) to create a certificate. Use DNS validation for the domain.

AWS Certificate Manager (ACM) cung cấp free SSL/TLS certificates với automatic renewal

DNS validation là fully automated - không cần can thiệp thủ công

Native CloudFront integration - ACM certificates có thể được attach trực tiếp đến CloudFront distributions

Most operational efficiency - zero maintenance sau khi setup DNS validation

Automatic renewal - ACM tự động renew certificates trước khi expire

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use a CloudFront security policy to create a certificate.**:
  → CloudFront security policies không tạo certificates - chúng chỉ configure security settings như minimum TLS versions.

- **(C) Use a CloudFront origin access control (OAC) to create a certificate.**:
  → OAC dành cho controlling access giữa CloudFront và S3 origins, không tạo TLS certificates.

- **(A) Use AWS Certificate Manager (ACM) to create a certificate. Use email validation for the domain.**:
  → Email validation yêu cầu manual approval mỗi khi renew certificate, không fully automated như DNS validation.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Automate creation and renewal" → ACM với DNS validation fully automated approach
- "CloudFront + TLS" → ACM là standard solution cho CloudFront certificates
- DNS vs Email validation → DNS validation automated, email validation cần manual intervention
- Operational efficiency → Automated processes thay vì manual certificate management

#### 📚 Tài liệu tham khảo chính thức (Official References):
- AWS Certificate Manager DNS validation
- Managed certificate renewal in AWS Certificate Manager

</details>

---

<div id="question-60"></div>

### Question 60: Edge-optimized endpoint
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is building a RESTful serverless web application on AWS by using Amazon API Gateway and AWS Lambda. The users of this web application will be geographically distributed, and the company wants to reduce the latency of API requests to these users.

Which type of endpoint should a solutions architect use to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Edge-optimized endpoint `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Interface VPC endpoint
- **(C)** Regional endpoint
- **(D)** Private endpoint

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang xây dựng RESTful serverless web application trên AWS bằng Amazon API Gateway và AWS Lambda
> - Users phân tán trên nhiều khu vực địa lý
> - Company muốn giảm latency của API requests cho những users này

**Phân tích giải pháp tối ưu:**
Edge-optimized endpoint

Edge-optimized endpoint sử dụng Amazon CloudFront edge locations để cache và serve API responses

Geographically distributed users được serve từ nearest edge location, giảm latency significantly

Global distribution - CloudFront có edge locations worldwide

Automatic routing đến closest edge location dựa trên user location

Built-in caching cho API responses tại edge locations

Perfect cho global applications với users ở nhiều regions khác nhau

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Private endpoint**:
  → Private endpoint chỉ accessible từ within VPC, không phù hợp cho geographically distributed users trên internet.

- **(C) Regional endpoint**:
  → Regional endpoint phục vụ từ single AWS region, không optimize latency cho users ở regions khác nhau globally.

- **(B) Interface VPC endpoint**:
  → VPC endpoint dành cho private connectivity within AWS infrastructure, không phù hợp cho external users.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Geographically distributed users" → Edge-optimized endpoint với CloudFront
- "Reduce latency" → Edge locations closer to users
- "Global application" → Edge optimization thay vì regional deployment
- API Gateway endpoint types → Edge-optimized cho global, Regional cho single region, Private cho internal

#### 📚 Tài liệu tham khảo chính thức (Official References):
- API endpoint types for REST APIs in API Gateway

</details>

---

<div id="question-61"></div>

### Question 61: An Amazon RDS database with Multi-AZ DB cluster deployment
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company deploys its applications on Amazon Elastic Kubernetes Service (Amazon EKS) behind an Application Load Balancer in an AWS Region. The application needs to store data in a PostgreSQL database engine. The company wants the data in the database to be highly available. The company also needs increased capacity for read workloads.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon RDS database configured with cross-Region read replicas.
- **(B)** Create an Amazon DynamoDB database table configured with global tables.
- **(C)** Create an Amazon RDS database with Multi-AZ deployments.
- **(D)** Create an Amazon RDS database with Multi-AZ DB cluster deployment. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company deploy applications trên Amazon EKS phía sau Application Load Balancer trong AWS Region
> - Application cần store data trong PostgreSQL database engine
> - Muốn data trong database highly available
> - Cũng cần increased capacity cho read workloads
> - Tìm giải pháp với MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Create an Amazon RDS database with Multi-AZ DB cluster deployment.

Multi-AZ DB cluster cung cấp high availability với automatic failover

Multiple read replicas trong cluster hỗ trợ increased read capacity

PostgreSQL engine support - RDS hỗ trợ PostgreSQL như yêu cầu

Single endpoint management - cluster có writer và 2 reader endpoints

Most operational efficiency - fully managed service với automatic scaling và failover

Regional deployment phù hợp với EKS trong cùng region

Architecture: Multi-AZ DB cluster deployments for Amazon RDS

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon DynamoDB database table configured with global tables.**:
  → DynamoDB là NoSQL database, không phải PostgreSQL engine như yêu cầu trong đề bài.

- **Create an Amazon RDS database with Multi-AZ deployments.**:
  Multi-AZ deployment chỉ có standby replica cho failover, không provide additional read capacity như Multi-AZ cluster.
  Multi-AZ deployments = Multi-AZ Instance deployments
  Architecture: Multi-AZ DB instance deployments for Amazon RDS

- **Create an Amazon RDS database configured with cross-Region read replicas.**:
  → Cross-region replicas tăng latency và complexity, không cần thiết khi EKS chỉ trong single region.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "High availability + increased read capacity" → Multi-AZ DB cluster best fit
- "PostgreSQL requirement" → RDS support, DynamoDB loại trừ
- "Most operational efficiency" → Managed cluster services thay vì manual replica management
- Multi-AZ vs Multi-AZ cluster → Cluster có multiple active readers, standard Multi-AZ chỉ có standby

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Multi-AZ DB cluster deployments for Amazon RDS
- Multi-AZ DB instance deployments for Amazon RDS
- Choose the right Amazon RDS deployment option: Single-AZ instance, Multi-AZ instance, or Multi-AZ database cluster

</details>

---

<div id="question-62"></div>

### Question 62: The existing RDS for MySQL database to an Aurora Serverless v2 MySQL database cluster
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A financial services company launched a new application that uses an Amazon RDS for MySQL database. The company uses the application to track stock market trends. The company needs to operate the application for only 2 hours at the end of each week. The company needs to optimize the cost of running the database.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the existing RDS for MySQL database to an Aurora MySQL database cluster.
- **(B)** Migrate the existing RDS for MySQL database to an Amazon EC2 instance that runs MySQL. Purchase an instance reservation for the EC2 instance.
- **(C)** Migrate the existing RDS for MySQL database to an Amazon Elastic Container Service (Amazon ECS) cluster that uses MySQL container images to run tasks.
- **(D)** Migrate the existing RDS for MySQL database to an Aurora Serverless v2 MySQL database cluster. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Financial services company launch application mới sử dụng Amazon RDS for MySQL database
> - Application dùng để track stock market trends
> - Company chỉ cần operate application trong 2 hours vào cuối mỗi tuần
> - Cần optimize cost của việc chạy database

**Phân tích giải pháp tối ưu:**
Migrate the existing RDS for MySQL database to an Aurora Serverless v2 MySQL database cluster.

Aurora Serverless v2 automatically scale capacity từ 0 đến maximum dựa trên actual usage

Pay-per-use model - chỉ trả tiền cho compute capacity được sử dụng trong 2 hours

Automatic pause và resume khi không có activity

MySQL compatibility maintain với existing application

Most cost-effective cho intermittent workloads - không pay cho time nhãn rỗi

No manual management của start/stop scheduling

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Migrate the existing RDS for MySQL database to an Aurora MySQL database cluster.**:
  → Aurora MySQL standard cluster vẫn require minimum capacity ngay cả khi không sử dụng, không cost-effective cho 2-hour weekly usage.

- **(B) Migrate the existing RDS for MySQL database to an Amazon EC2 instance that runs MySQL. Purchase an instance reservation for the EC2 instance.**:
  → Reserved instances không cost-effective cho workloads chỉ chạy 2 hours/week, và EC2 tăng operational overhead.

- **(C) Migrate the existing RDS for MySQL database to an Amazon Elastic Container Service (Amazon ECS) cluster that uses MySQL container images to run tasks.**:
  → ECS với MySQL containers tăng complexity và operational overhead, không optimize cho cost với intermittent usage.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Only 2 hours per week" → Serverless model perfect cho intermittent workloads
- "Optimize cost" → Pay-per-use thay vì always-on capacity
- "Track stock market trends" → Aurora Serverless v2 handle variable workloads well
- Serverless vs Traditional → Serverless cost-effective cho low-frequency usage

#### 📚 Tài liệu tham khảo chính thức (Official References):
- How Aurora Serverless v2 works

</details>

---

<div id="question-63"></div>

### Question 63: Lambda SnapStart
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to use an event-driven programming model with AWS Lambda. The company wants to reduce startup latency for Lambda functions that run on Java 11. The company does not have strict latency requirements for the applications. The company wants to reduce cold starts and outlier latencies when a function scales up.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Lambda provisioned concurrency.
- **(B)** Increase the timeout of the Lambda functions.
- **(C)** Increase the memory of the Lambda functions.
- **(D)** Configure Lambda SnapStart. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company muốn sử dụng event-driven programming model với AWS Lambda
> - Muốn giảm startup latency cho Lambda functions chạy trên Java 11
> - Không có strict latency requirements cho applications
> - Muốn giảm cold starts và outlier latencies khi function scales up
> - Tìm giải pháp MOST cost-effectively
> - 💡 Thông tin bổ sung:
> - Cold Start là hiện tượng xảy ra khi AWS Lambda phải tạo mới execution environment để chạy function, thường xảy ra khi:
> - Function được invoke lần đầu tiên sau thời gian không hoạt động
> - Traffic tăng đột biến khiến Lambda phải scale up
> - Quá trình Cold Start gồm 4 bước:
> - Container Provisioning - Cấp phát compute resources
> - Runtime Initialization - Load ngôn ngữ runtime (Java, Python, etc.)
> - Function Code Loading - Download và unpack function code
> - Dependency Resolution - Load libraries và packages
> - Tác động: Thêm latency vào request (từ vài milliseconds đến vài giây), đặc biệt với Java có thể lâu hơn do JVM initialization.
> - Giải pháp chính:
> - SnapStart (Java/Python/.NET) - tạo snapshot để restore nhanh hơn
> - Provisioned Concurrency - giữ environment "warm" sẵn sàng
> - Optimize code size, memory allocation, runtime selection
> - Cold starts chỉ ảnh hưởng <1% requests nhưng quan trọng cho latency-sensitive applications.

**Phân tích giải pháp tối ưu:**
Configure Lambda SnapStart.

Lambda SnapStart được thiết kế đặc biệt cho Java applications để giảm cold start times

Pre-initialization của JVM và application code trước khi function invocation

Significant reduction trong startup latency cho Java functions

Cost-effective - không có additional charges như provisioned concurrency

Perfect cho Java 11 - SnapStart optimize specifically cho Java runtime environments

Reduce outlier latencies khi scaling up vì pre-warmed state

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure Lambda provisioned concurrency.**:
  → Provisioned concurrency có additional costs cho maintaining warm instances, không cost-effective khi company không có strict latency requirements.

- **(B) Increase the timeout of the Lambda functions.**:
  → Timeout settings không ảnh hưởng đến cold start latency, chỉ affect maximum execution time.

- **(C) Increase the memory of the Lambda functions.**:
  → More memory có thể cải thiện performance nhưng tăng costs và không specifically address Java cold start issues như SnapStart.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Java 11 cold starts" → Lambda SnapStart designed cho Java optimization
- "MOST cost-effectively" → SnapStart không có additional charges như provisioned concurrency
- "Reduce cold starts" → SnapStart pre-initialize JVM state
- Java runtime optimization → SnapStart specifically cho Java applications

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Improving startup performance with Lambda SnapStart
- SnapStart is available for the following Lambda managed runtimes:
- Java 11 and later
- Python 3.12 and later
- .NET 8 and later.

</details>

---

<div id="question-64"></div>

### Question 64: The databases to Amazon RDS Configure encryption at rest
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is migrating its workloads to AWS. The company has transactional and sensitive data in its databases. The company wants to use AWS Cloud solutions to increase security and reduce operational overhead for the databases.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the data to Amazon S3 Use Amazon Macie for data security and protection
- **(B)** Migrate the databases to Amazon RDS Configure encryption at rest. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Migrate the database to Amazon RDS. Use Amazon CloudWatch Logs for data security and protection.
- **(D)** Migrate the databases to Amazon EC2. Use an AWS Key Management Service (AWS KMS) AWS managed key for encryption.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company đang migrate workloads lên AWS
> - Có transactional và sensitive data trong databases
> - Muốn sử dụng AWS Cloud solutions để increase security và reduce operational overhead cho databases

**Phân tích giải pháp tối ưu:**
Migrate the databases to Amazon RDS Configure encryption at rest.

Amazon RDS là fully managed database service giảm operational overhead dramatically

Encryption at rest bảo vệ sensitive data khi stored, đáp ứng security requirements

RDS managed services handle patching, backups, monitoring, scaling automatically

Support transactional databases như MySQL, PostgreSQL, Oracle, SQL Server

Cost-effective và secure solution cho database migration

Minimal management overhead so với self-managed databases

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Migrate the databases to Amazon EC2. Use an AWS Key Management Service (AWS KMS) AWS managed key for encryption.**:
  → EC2-based databases require significant operational overhead cho management, patching, backups - không meet requirement về reduce operational overhead.

- **(A) Migrate the data to Amazon S3 Use Amazon Macie for data security and protection**:
  → S3 là object storage, không phù hợp cho transactional databases cần ACID properties và relational structure.

- **(C) Migrate the database to Amazon RDS. Use Amazon CloudWatch Logs for data security and protection.**:
  → CloudWatch Logs là monitoring service, không provide data encryption hoặc security protection cho sensitive data.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Không có liên kết bổ sung.

</details>

---

<div id="question-65"></div>

### Question 65: Search CloudTrail logs with Amazon Athena queries to identify the errors
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company wants to analyze and troubleshoot Access Denied errors and Unauthorized errors that are related to IAM permissions. The company has AWS CloudTrail turned on.

Which solution will meet these requirements with the LEAST effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Batch and write custom scripts to query CloudTrail logs for the errors.
- **(B)** Use AWS Glue and write custom scripts to query CloudTrail logs for the errors.
- **(C)** Search CloudTrail logs with Amazon Athena queries to identify the errors. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Search CloudTrail logs with Amazon QuickSight. Create a dashboard to identify the errors.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Company muốn analyze và troubleshoot Access Denied errors và Unauthorized errors liên quan đến IAM permissions
> - Đã có AWS CloudTrail turned on
> - Tìm giải pháp với LEAST effort

**Phân tích giải pháp tối ưu:**
Search CloudTrail logs with Amazon Athena queries to identify the errors.

Amazon Athena cho phép query CloudTrail logs trực tiếp bằng standard SQL mà không cần setup infrastructure

Serverless solution - không cần manage compute resources hay write custom scripts

Built-in integration với CloudTrail logs stored trong S3

Simple SQL queries để filter errorCode = "AccessDenied" hoặc "UnauthorizedOperation"

Pay-per-query model cost-effective cho ad-hoc analysis

Least effort - chỉ cần viết SQL queries, không cần complex setup

CloudTrail logs chứa các fields như errorCode, errorMessage, userIdentity rất hữu ích cho IAM troubleshooting với Athena queries.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use AWS Glue and write custom scripts to query CloudTrail logs for the errors.**:
  → AWS Glue require ETL job setup và custom script development, tăng effort và complexity.

- **(A) Use AWS Batch and write custom scripts to query CloudTrail logs for the errors.**:
  → AWS Batch yêu cầu setup containers, job definitions, và custom scripts - bỏ ra công sức đáng kể cho một task log analysis cơ bản

- **(D) Search CloudTrail logs with Amazon QuickSight. Create a dashboard to identify the errors.**:
  → QuickSight require data preparation, dashboard creation, và có additional costs - more effort than simple Athena queries.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "CloudTrail logs analysis" → Athena là standard tool cho S3-based log querying
- "LEAST effort" → Serverless SQL queries thay vì custom development
- "IAM errors troubleshooting" → Athena có thể filter specific error codes easily
- SQL vs Custom scripts → SQL simpler cho log analysis tasks

#### 📚 Tài liệu tham khảo chính thức (Official References):
- Query AWS CloudTrail logs
- Example AWS STS role chaining API event in CloudTrail log file

</details>

---

