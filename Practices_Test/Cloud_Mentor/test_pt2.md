# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Cloud Mentor Practice Test 2

> **Nền tảng luyện thi**: Cloud Mentor AWS Practice Exams (SAA-C03)  
> **Bộ đề**: Practice Test 02 - Results & In-Depth Architecture Review (65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **47 câu** | $\ge 47$  câu (72%) | Đạt tiêu chuẩn ✅ |
| **Số câu trả lời sai / bỏ qua (Incorrect & Skipped)** | **18 câu** | $\le 18$  câu | Cần tập trung ôn tập ⚠️ |
| **Tỷ lệ chính xác (Overall Score)** | **72.31% (~723 / 1000)** | $\ge 72.0\%$ (720 / 1000) | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 21 câu | 14 câu | 7 câu | **66.7%** | Cần củng cố 🔴 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 18 câu | 13 câu | 5 câu | **72.2%** | Cần củng cố 🔴 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 13 câu | 11 câu | 2 câu | **84.6%** | Tốt 🟡 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 13 câu | 9 câu | 4 câu | **69.2%** | Cần củng cố 🔴 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **47 câu** | **18 câu** | **72.31%** | 🌟 **PASSED (XUẤT SẮC - ĐẠT)** |

---

## 🎯 2. Danh Sách 18 Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp 18 câu trả lời chưa chính xác và bỏ qua trong bài thi thử này. Hãy rà soát kỹ các bẫy đề bài, nguyên lý kiến trúc cốt lõi và bài học thực tế trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 01** | Domain 2 | **The product manuals in an Amazon EFS volume** | dữ liệu manuals luôn up-to-date trên mọi instance, adapt nhanh theo tăng tải, không sửa code ứng dụng<br>"Nhiều EC2 instance cần cùng một bộ dữ liệu, luôn nhất quán, không sửa code" → Amazon EFS (shared NFS storage) | [👉 Xem](#question-01) |
| **Câu 04** | Domain 4 | **Development environments and test environments with their own Amazon Aurora Postgr...** | giải pháp MOST cost-effective cho cả dev và test, biết cả hai đều không chạy liên tục 24/7 mà chỉ dùng một phần trong ngày<br>"Dùng vài giờ/ngày" / "intermittent usage" / "spiky workload" → Aurora Serverless v2 (trả tiền theo ACU thực dùng, co về gần 0 khi idle) | [👉 Xem](#question-04) |
| **Câu 05** | Domain 1 | **AWS Lambda functions with VPC access to connect through the existing VPN** | LEAST management overhead, dùng dịch vụ managed thay vì tự vận hành hạ tầng<br>"Transfer files to/from an external SFTP server" → AWS Transfer Family (SFTP connectors) | [👉 Xem](#question-05) |
| **Câu 06** | Domain 1 | **AWS DataSync to migrate the data** | giải pháp MOST cost-effective đáp ứng yêu cầu mã hóa khi truyền<br>"Migrate HDFS to S3" → AWS DataSync (hỗ trợ HDFS làm location type có sẵn) | [👉 Xem](#question-06) |
| **Câu 09** | Domain 4 | **An outbound-only internet gateway in each VPC** | loại bỏ NAT gateway ở các client VPC mà vẫn giữ được outbound access ra internet, không expose inbound<br>"Giảm chi phí NAT gateway" + "external API hỗ trợ cả IPv4 và IPv6" → chuyển traffic sang IPv6, dùng Egress-only Internet Gateway (miễn phí) thay NAT gateway | [👉 Xem](#question-09) |
| **Câu 20** | Domain 1 | **An IAM policy that lists the full Amazon Resource Name (ARN) for each S3 bucket an...** | cấp quyền theo nguyên tắc least privilege (Select TWO)<br>"ECS task" + "application code cần gọi AWS service (S3, DynamoDB...)" → luôn gắn IAM policy vào task role, không phải instance role | [👉 Xem](#question-20) |
| **Câu 21** | Domain 2 | **An Amazon EventBridge event bus to route messages between the microservices** | Yêu cầu archive (lưu trữ) messages trong 30 ngày<br>"Archive messages for X days" + "least development effort" → Amazon EventBridge Archive (tính năng built-in, không cần code) | [👉 Xem](#question-21) |
| **Câu 22** | Domain 1 | **S3 Versioning on the bucket** | bất biến dữ liệu (immutability) đúng 1 năm, nhưng vẫn đọc được<br>"Prevent any user (including root) from deleting/overwriting" trong khoảng thời gian cố định → S3 Object Lock Compliance mode + retention period | [👉 Xem](#question-22) |
| **Câu 23** | Domain 1 | **The data in an Amazon S3 Glacier storage class and an AWS KMS key without key mate...** | chọn 2 giải pháp kết hợp vừa lưu trữ/archive dữ liệu, vừa đảm bảo khách hàng tự kiểm soát key material (không để AWS tự sinh và giữ key)<br>"Retain control over the encryption key material" / "self-manage key material" → KMS key với imported key material (BYOK) hoặc SSE-C (khách hàng tự cung cấp khoá) | [👉 Xem](#question-23) |
| **Câu 26** | Domain 2 | **Amazon EMR with an instance fleet configuration** | cluster chỉ launch ở AZ có sẵn đúng instance type + purchasing option cần thiết<br>"EMR" + "multiple subnets/AZs" + "tự động chọn AZ theo capacity" → Instance fleet configuration (không phải instance group) | [👉 Xem](#question-26) |
| **Câu 29** | Domain 2 | **The DB instance to use a Multi-AZ DB instance deployment** | cải thiện availability của DB instance<br>" | [👉 Xem](#question-29) |
| **Câu 43** | Domain 4 | **DynamoDB in on-demand mode by using the DynamoDB Standard table class** | cấu hình DynamoDB table MOST cost-effective, tự scale theo traffic khó dự đoán<br>"Unpredictable traffic" / "traffic không dự đoán được" → DynamoDB on-demand mode | [👉 Xem](#question-43) |
| **Câu 48** | Domain 1 | **A Gateway Load Balancer (GWLB) and reconfigure network routing to go through the GWLB** | chọn giải pháp AWS cho phép chèn virtual appliance kiểm tra packet ở tầng network cho traffic ra/vào VPC<br>" | [👉 Xem](#question-48) |
| **Câu 51** | Domain 3 | **A Throughput Optimized HDD (st1) Amazon EBS volume with provisioned storage based ...** | Yêu cầu throughput lên đến 500 MBps<br>"large, sequential" + "log processing / big data / data warehouse" → Throughput Optimized HDD (st1) | [👉 Xem](#question-51) |
| **Câu 55** | Domain 1 | **A new AWS account and enable AWS Organizations and From the management account in ...** | thiết kế multi-account theo AWS Well-Architected, đồng thời chia sẻ được discount của Savings Plan hiện có<br>"Savings Plan discount sharing" → luôn cấu hình từ management account, không phải từ account đã mua SP | [👉 Xem](#question-55) |
| **Câu 57** | Domain 4 | **An AWS Lambda function to access the RDS database** | migrate script lên AWS với chi phí thấp nhất (MOST cost-effectively) cho tác vụ ngắn, tần suất thấp<br>Đối với các câu hỏi về việc chạy job thì các solution thường nghĩ đến đó là AWS Lambda, ECS Fargate, Batch, EC2 Spot Instances. | [👉 Xem](#question-57) |
| **Câu 58** | Domain 3 | **A read replica of the DB instance** | cải thiện hiệu năng cho read queries<br>" | [👉 Xem](#question-58) |
| **Câu 61** | Domain 2 | **A Network Load Balancer on AWS** | load balancer cung cấp fixed/static IP, hỗ trợ target hybrid (on-prem + AWS)<br>" | [👉 Xem](#question-61) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ❌ Sai | [The product manuals in an Amazon EFS volume](#question-01) | Domain 2 |
| [02](#question-02) | ✅ Đúng | [A new object created S3 event notification within the bucket to invoke an AWS Lamb...](#question-02) | Domain 4 |
| [03](#question-03) | ✅ Đúng | [An Amazon EC2 Auto Scaling target tracking policy to scale out the processing tier...](#question-03) | Domain 3 |
| [04](#question-04) | ❌ Sai | [Development environments and test environments with their own Amazon Aurora Postgr...](#question-04) | Domain 4 |
| [05](#question-05) | ❌ Sai | [AWS Lambda functions with VPC access to connect through the existing VPN](#question-05) | Domain 1 |
| [06](#question-06) | ❌ Sai | [AWS DataSync to migrate the data](#question-06) | Domain 1 |
| [07](#question-07) | ✅ Đúng | [The web application by using an Amazon CloudFront distribution that has an Amazon ...](#question-07) | Domain 4 |
| [08](#question-08) | ✅ Đúng | [An Amazon RDS for SQL Server Multi-AZ deployment](#question-08) | Domain 2 |
| [09](#question-09) | ❌ Sai | [An outbound-only internet gateway in each VPC](#question-09) | Domain 4 |
| [10](#question-10) | ✅ Đúng | [Amazon Kinesis Data Streams](#question-10) | Domain 3 |
| [11](#question-11) | ✅ Đúng | [Place the frontend and backend EC2 instances into separate Auto Scaling groups](#question-11) | Domain 2 |
| [12](#question-12) | ✅ Đúng | [The Lambda functions inside the VPC](#question-12) | Domain 1 |
| [13](#question-13) | ✅ Đúng | [An Amazon Machine Image (AMI) of the web application](#question-13) | Domain 4 |
| [14](#question-14) | ✅ Đúng | [An Elastic IP address with the NAT gateway and Add a route of 0 and a NAT gateway ...](#question-14) | Domain 1 |
| [15](#question-15) | ✅ Đúng | [AWS Global Accelerator with UDP listeners and endpoint groups in each Region](#question-15) | Domain 3 |
| [16](#question-16) | ✅ Đúng | [An Amazon S3 bucket to store the raw data](#question-16) | Domain 3 |
| [17](#question-17) | ✅ Đúng | [An Amazon EFS file system with mount points in multiple Availability Zones](#question-17) | Domain 4 |
| [18](#question-18) | ✅ Đúng | [Amazon DocumentDB serverless with automatic capacity scaling](#question-18) | Domain 4 |
| [19](#question-19) | ✅ Đúng | [Aurora Auto Scaling for Aurora Replicas](#question-19) | Domain 2 |
| [20](#question-20) | ❌ Sai | [An IAM policy that lists the full Amazon Resource Name (ARN) for each S3 bucket an...](#question-20) | Domain 1 |
| [21](#question-21) | ❌ Sai | [An Amazon EventBridge event bus to route messages between the microservices](#question-21) | Domain 2 |
| [22](#question-22) | ❌ Sai | [S3 Versioning on the bucket](#question-22) | Domain 1 |
| [23](#question-23) | ❌ Sai | [The data in an Amazon S3 Glacier storage class and an AWS KMS key without key mate...](#question-23) | Domain 1 |
| [24](#question-24) | ✅ Đúng | [AWS IAM Identity Center in the organization management account and permission sets...](#question-24) | Domain 1 |
| [25](#question-25) | ✅ Đúng | [Implement DynamoDB Accelerator (DAX)](#question-25) | Domain 3 |
| [26](#question-26) | ❌ Sai | [Amazon EMR with an instance fleet configuration](#question-26) | Domain 2 |
| [27](#question-27) | ✅ Đúng | [AWS Lake Formation to provide the specified IAM roles access to the PII data](#question-27) | Domain 1 |
| [28](#question-28) | ✅ Đúng | [The visualization tool in the same AWS Region as the data warehouse](#question-28) | Domain 4 |
| [29](#question-29) | ❌ Sai | [The DB instance to use a Multi-AZ DB instance deployment](#question-29) | Domain 2 |
| [30](#question-30) | ✅ Đúng | [The application on EC2 instances in an Auto Scaling group behind an internet-facin...](#question-30) | Domain 2 |
| [31](#question-31) | ✅ Đúng | [AWS KMS to create multi-Region keys](#question-31) | Domain 1 |
| [32](#question-32) | ✅ Đúng | [A gateway endpoint for the S3 bucket](#question-32) | Domain 1 |
| [33](#question-33) | ✅ Đúng | [A bucket policy that grants Account B permission to access the centralized S3 buck...](#question-33) | Domain 2 |
| [34](#question-34) | ✅ Đúng | [The Auto Scaling policy from scheduled scaling to target tracking](#question-34) | Domain 2 |
| [35](#question-35) | ✅ Đúng | [An Application Load Balancer to manage web traffic](#question-35) | Domain 2 |
| [36](#question-36) | ✅ Đúng | [The EMR managed scaling feature to automatically resize the cluster based on workload](#question-36) | Domain 4 |
| [37](#question-37) | ✅ Đúng | [The Auto Scaling group to use a scheduled scaling action on the EC2 instances](#question-37) | Domain 2 |
| [38](#question-38) | ✅ Đúng | [A transit gateway, and place attachments in subnets of all the VPCs](#question-38) | Domain 2 |
| [39](#question-39) | ✅ Đúng | [An AWS Transfer Family SFTP server that uses the existing S3 bucket as a target](#question-39) | Domain 2 |
| [40](#question-40) | ✅ Đúng | [The MySQL instance to use an SSL certificate and a VPC peering connection and rout...](#question-40) | Domain 1 |
| [41](#question-41) | ✅ Đúng | [Amazon Macie](#question-41) | Domain 1 |
| [42](#question-42) | ✅ Đúng | [A gateway VPC endpoint for Amazon S3](#question-42) | Domain 1 |
| [43](#question-43) | ❌ Sai | [DynamoDB in on-demand mode by using the DynamoDB Standard table class](#question-43) | Domain 4 |
| [44](#question-44) | ✅ Đúng | [An IAM role to grant the necessary permissions to the applications](#question-44) | Domain 1 |
| [45](#question-45) | ✅ Đúng | [The orders in an Amazon SQS FIFO queue](#question-45) | Domain 2 |
| [46](#question-46) | ✅ Đúng | [An IAM role and an IAM access policy that allows the web server EC2 instances to a...](#question-46) | Domain 1 |
| [47](#question-47) | ✅ Đúng | [Amazon SQS to create a new message queue](#question-47) | Domain 3 |
| [48](#question-48) | ❌ Sai | [A Gateway Load Balancer (GWLB) and reconfigure network routing to go through the GWLB](#question-48) | Domain 1 |
| [49](#question-49) | ✅ Đúng | [A secret for the database credentials in AWS Secrets Manager](#question-49) | Domain 1 |
| [50](#question-50) | ✅ Đúng | [Management events in AWS CloudTrail](#question-50) | Domain 1 |
| [51](#question-51) | ❌ Sai | [A Throughput Optimized HDD (st1) Amazon EBS volume with provisioned storage based ...](#question-51) | Domain 3 |
| [52](#question-52) | ✅ Đúng | [S3 Transfer Acceleration on the S3 bucket](#question-52) | Domain 3 |
| [53](#question-53) | ✅ Đúng | [A mix of On-Demand Instances and Spot Instances](#question-53) | Domain 4 |
| [54](#question-54) | ✅ Đúng | [A container for the job](#question-54) | Domain 4 |
| [55](#question-55) | ❌ Sai | [A new AWS account and enable AWS Organizations and From the management account in ...](#question-55) | Domain 1 |
| [56](#question-56) | ✅ Đúng | [AWS DMS to migrate the database to an Amazon Aurora PostgreSQL database](#question-56) | Domain 2 |
| [57](#question-57) | ❌ Sai | [An AWS Lambda function to access the RDS database](#question-57) | Domain 4 |
| [58](#question-58) | ❌ Sai | [A read replica of the DB instance](#question-58) | Domain 3 |
| [59](#question-59) | ✅ Đúng | [The application to an AWS Lambda function](#question-59) | Domain 3 |
| [60](#question-60) | ✅ Đúng | [Amazon ElastiCache (Redis OSS) and cache the data for the application](#question-60) | Domain 3 |
| [61](#question-61) | ❌ Sai | [A Network Load Balancer on AWS](#question-61) | Domain 2 |
| [62](#question-62) | ✅ Đúng | [The existing stream in Kinesis Data Streams to Amazon Managed Service for Apache F...](#question-62) | Domain 3 |
| [63](#question-63) | ✅ Đúng | [The website to an Amazon S3 bucket](#question-63) | Domain 3 |
| [64](#question-64) | ✅ Đúng | [A snapshot of the existing Aurora PostgreSQL DB cluster](#question-64) | Domain 1 |
| [65](#question-65) | ✅ Đúng | [An AWS Managed Microsoft AD instance on AWS](#question-65) | Domain 2 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi & Phân Tích Kiến Trúc (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: The product manuals in an Amazon EFS volume
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company hosts a website on Amazon EC2 instances that run Amazon Linux. The instances are behind an Application Load Balancer (ALB) and are part of an Auto Scaling group. Each instance uses Amazon EBS volumes to store product manuals.

New instances often have outdated data. The new instances occasionally take up to 30 minutes to receive updates from an external source.

The company must ensure that all instances have up-to-date product manuals. The company needs a solution that can adapt quickly to increased demand. The solution must not require modifications for the application code.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the product manuals in an Amazon S3 bucket. Use the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Configure the EC2 instances to download updates from the S3 bucket.
- **(B)** Store the product manuals in an Amazon S3 bucket. Configure the EC2 instances to download updates from the S3 bucket.
- **(C)** Store the product manuals on instance store volumes that are attached to each EC2 instance.
- **(D)** Store the product manuals in an Amazon EFS volume. Mount the EFS volume on the EC2 instances. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - EC2 instances (Amazon Linux) sau ALB, nằm trong Auto Scaling group, mỗi instance dùng EBS volume riêng để lưu product manuals
> - Instance mới thường có dữ liệu outdated, có thể mất tới 30 phút mới nhận được update từ nguồn ngoài
> - Yêu cầu: dữ liệu manuals luôn up-to-date trên mọi instance, adapt nhanh theo tăng tải, không sửa code ứng dụng
> - → Yêu cầu: shared storage tự động phản ánh dữ liệu mới nhất ngay khi instance mới khởi chạy, không cần chờ đồng bộ hay đổi code

**Phân tích giải pháp tối ưu:**
Store the product manuals in an Amazon EFS volume. Mount the EFS volume on the EC2 instances.

EFS là shared network file system (NFS), nhiều EC2 instance mount cùng lúc vào cùng file system → instance mới mount xong là thấy ngay dữ liệu mới nhất, không có độ trễ đồng bộ như EBS (mỗi instance 1 volume riêng).

Không cần sửa code ứng dụng: ứng dụng vẫn đọc file từ local mount point như trước, chỉ thay loại storage phía dưới.

Khi Auto Scaling group scale ra instance mới, mount EFS ngay lập tức có sẵn dữ liệu mới nhất → đáp ứng "adapt quickly to increased demand" mà không cần bước tải/đồng bộ dữ liệu riêng.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Store the product manuals on instance store volumes that are attached to each EC2 instance.**:
  Instance store là bộ nhớ ephemeral (mất dữ liệu khi stop/terminate) và không chia sẻ được giữa các instance → mỗi instance mới lại khởi tạo trống, không giải quyết được vấn đề dữ liệu outdated.

- **(B) Store the product manuals in an Amazon S3 bucket. Configure the EC2 instances to download updates from the S3 bucket.**:
  Yêu cầu phải "configure instances to download" nghĩa là cần thêm cơ chế polling/đồng bộ định kỳ (user data script, cron...) → độ trễ tùy chu kỳ, không đảm bảo instance mới có dữ liệu mới nhất ngay lập tức như EFS (chỉ cần mount là xong).

- **(A) Store the product manuals in an Amazon S3 bucket. Use the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Configure the EC2 instances to download updates from the S3 bucket.**:
  Cùng nhược điểm với đáp án S3 Standard ở trên, đồng thời S3 Standard-IA tính thêm phí truy xuất (retrieval) - không hợp lý khi mọi instance mới đều phải tải dữ liệu này thường xuyên.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Nhiều EC2 instance cần cùng một bộ dữ liệu, luôn nhất quán, không sửa code" → Amazon EFS (shared NFS storage)
- Nếu đề yêu cầu "không sửa code ứng dụng" + "chia sẻ storage giữa nhiều instance" → ưu tiên EFS hơn S3 (S3 cần thêm cơ chế download/sync riêng, tốn thời gian)
- Auto Scaling group + storage dùng chung, cần semantics filesystem (POSIX) → EFS; cần object storage qua API → S3

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [What is Amazon Elastic File System?](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)

</details>

---

<div id="question-02"></div>

### Question 02: A new object created S3 event notification within the bucket to invoke an AWS Lamb...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is designing a new application that uploads files to an Amazon S3 bucket. The uploaded files are processed to extract metadata.

Processing must take less than 5 seconds. The volume and frequency of the uploads vary from a few files each hour to hundreds of concurrent uploads.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure a new object created S3 event notification within the bucket to invoke an AWS Lambda function to process the files. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure AWS CloudTrail trails to log Amazon S3 API calls. Use AWS AppSync to process the files.
- **(C)** Deploy an Amazon EC2 instance. Create a script that lists all files in the S3 bucket and processes new files. Use a cron job that runs every minute to run the script.
- **(D)** Configure Amazon Kinesis Data Streams to deliver the files to the S3 bucket. Invoke an AWS Lambda function to process the files.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Files được upload lên Amazon S3 bucket, cần trích xuất metadata
> - Thời gian xử lý phải dưới 5 giây
> - Volume/frequency biến động lớn: từ vài file/giờ đến hàng trăm upload đồng thời
> - → Yêu cầu: xử lý nhanh (<5s), tự động scale theo tải biến động, MOST cost-effective

**Phân tích giải pháp tối ưu:**
Configure a new object created S3 event notification within the bucket to invoke an AWS Lambda function to process the files.

S3 Event Notification (loại ObjectCreated) kích hoạt Lambda gần như tức thời ngay khi có file mới upload, hơn nữa Lambda rất phù hợp cho các xử lý ngắn (5 giây) như này.

Lambda tự động scale song song theo số lượng sự kiện xảy ra đồng thời (hàng trăm invocation cùng lúc) mà không cần quản lý hạ tầng.

Mô hình serverless, pay-per-invocation → cost-effective nhất khi tải biến động lớn (vài file/giờ vẫn rẻ, hàng trăm file vẫn tự scale mà không trả phí cho tài nguyên rảnh rỗi).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure AWS CloudTrail trails to log Amazon S3 API calls. Use AWS AppSync to process the files.**:
  CloudTrail dùng để ghi log API Call phục vụ audit, không phải cơ chế trigger xử lý dữ liệu theo thời gian thực; AWS AppSync là dịch vụ GraphQL API, không phải công cụ xử lý file - sai cả 2 service so với mục đích đề bài.

- **Configure Amazon Kinesis Data Streams to deliver the files to the S3 bucket. Invoke an AWS Lambda function to process the files.**:
  Kinesis Data Streams không có chức năng để "đẩy file vào S3 bucket" theo cách mô tả (đây là chức năng của Firehose mới đúng); việc thêm một tầng streaming không cần thiết ở đây làm tăng độ phức tạp và chi phí mà không mang lại lợi ích, trong khi S3 event notification đã đủ đáp ứng yêu cầu.

- **Deploy an Amazon EC2 instance. Create a script that lists all files in the S3 bucket and processes new files. Use a cron job that runs every minute to run the script.**:
  Polling mỗi phút không đảm bảo latency dưới 5 giây một cách nhất quán (trường hợp xấu nhất gần 1 phút); EC2 instance phải chạy liên tục 24/7 dù chỉ có vài file/giờ → không cost-effective, và không scale tốt khi có hàng trăm upload đồng thời.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "S3 upload" + "process quickly" + "unpredictable/variable volume" → S3 Event Notification + Lambda (kiến trúc serverless, event-driven)
- "MOST cost-effective" + traffic biến động lớn → loại đáp án dùng EC2 chạy liên tục (polling/cron job)
- Đề nói cần xử lý file ngay khi vừa upload lên S3 → luôn ưu tiên S3 Event Notification, không phải Kinesis Data Streams hay CloudTrail

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Process Amazon S3 event notifications with Lambda](https://docs.aws.amazon.com/lambda/latest/dg/with-s3.html)

</details>

---

<div id="question-03"></div>

### Question 03: An Amazon EC2 Auto Scaling target tracking policy to scale out the processing tier...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company has a three-tier web application that processes orders from customers. The web tier consists of Amazon EC2 instances behind an Application Load Balancer. The processing tier consists of EC2 instances. The company decoupled the web tier and processing tier by using Amazon SQS. The storage layer uses Amazon DynamoDB.

At peak times, some users report order processing delays and halts. The company has noticed that during these delays, the EC2 instances are running at 100% CPU usage, and the SQS queue fills up. The peak times are variable and unpredictable.

The company needs to improve the performance of the application.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use scheduled scaling for Amazon EC2 Auto Scaling to scale out the processing tier instances for the duration of peak usage times. Use the CPUUtilization metric to determine when to scale.
- **(B)** Use Amazon ElastiCache (Redis OSS) in front of the DynamoDB backend tier. Use target utilization as a metric to determine when to scale.
- **(C)** Use an Amazon EC2 Auto Scaling target tracking policy to scale out the processing tier instances. Use the ApproximateNumberOfMessages attribute to determine when to scale. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Add an Amazon CloudFront distribution to cache the responses for the web tier. Use HTTP latency as a metric to determine when to scale.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Kiến trúc 3 tầng: web tier (EC2 + ALB) - processing tier (EC2) decoupled bởi Amazon SQS - storage layer DynamoDB
> - Tại thời điểm peak: EC2 processing tier chạy ở 100% CPU, SQS queue bị đầy (fills up)
> - Peak times biến động, không dự đoán trước được (variable and unpredictable)
> - → Yêu cầu: cải thiện hiệu năng xử lý order tại processing tier khi tải tăng đột biến, không đoán trước được thời điểm

**Phân tích giải pháp tối ưu:**
Use an Amazon EC2 Auto Scaling target tracking policy to scale out the processing tier instances. Use the ApproximateNumberOfMessages attribute to determine when to scale.

Nguyên nhân gốc nằm ở processing tier (CPU 100%, SQS backlog tăng) → cần scale đúng tầng đó, không phải web tier hay storage tier.

Sử dụng AutoScaling với Target tracking policy sẽ tự động điều chỉnh capacity theo số lượng message có trong SQS, phản ứng theo tải thực tế thay vì lịch cố định → phù hợp với peak "biến động, không đoán trước".

Scale dựa trên số lượng message có trong SQS (ApproximateNumberOfMessages) là best practice của AWS cho Auto Scaling group xử lý message từ SQS.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use scheduled scaling for Amazon EC2 Auto Scaling to scale out the processing tier instances for the duration of peak usage times. Use the CPUUtilization metric to determine when to scale.**:
  Scheduled scaling yêu cầu biết trước thời điểm peak để lên lịch, nhưng đề nói rõ peak times "variable and unpredictable" → không áp dụng được.

- **(B) Use Amazon ElastiCache (Redis OSS) in front of the DynamoDB backend tier. Use target utilization as a metric to determine when to scale.**:
  Đề không đề cập DynamoDB có vấn đề gì (CloudWatch không báo lỗi liên quan); nghẽn cổ chai nằm ở compute layer (processing EC2 100% CPU) và SQS backlog, không phải ở tầng đọc/ghi database.

- **Add an Amazon CloudFront distribution to cache the responses for the web tier. Use HTTP latency as a metric to determine when to scale.**:
  Web tier (ALB + EC2 frontend) không phải nơi xảy ra vấn đề; cache response tĩnh qua CloudFront không giải quyết được tình trạng nghẽn xử lý order ở processing tier.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "SQS queue fills up" + "processing tier tại 100% CPU" → scale processing tier theo SQS (target tracking với ApproximateNumberOfMessages)
- "Peak times variable and unpredictable" → loại ngay đáp án dùng scheduled scaling
- Kiến trúc nhiều tầng, bottleneck nằm ở 1 tầng cụ thể → chỉ scale đúng tầng đó, không phải toàn bộ hệ thống
- SQS decouple + Auto Scaling group xử lý message → luôn nghĩ đến target tracking scaling theo số lượng message có trong queue

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Scaling policy based on Amazon SQS](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)

</details>

---

<div id="question-04"></div>

### Question 04: Development environments and test environments with their own Amazon Aurora Postgr...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is developing software that uses a PostgreSQL database schema. The company needs to configure development environments and test environments for its developers.

Each developer at the company uses their own development environment, which includes a PostgreSQL database. On average, each development environment is used for an 8-hour workday. The test environments will be used for load testing that can take up to 2 hours each day.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure development environments and test environments with their own Amazon Aurora Serverless v2 PostgreSQL database.
- **(B)** For each development environment, configure an Amazon RDS for PostgreSQL Single-AZ DB instance. For the test environment, configure a single Amazon RDS for PostgreSQL Multi-AZ DB instance.
- **(C)** Configure development environments and test environments with their own Amazon Aurora PostgreSQL DB cluster. `[Đáp án đúng ✅]`
- **(D)** Configure an Amazon Aurora global database. Allow developers to connect to the database with their own credentials.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Development environment PostgreSQL: mỗi developer có database riêng, dùng trung bình 8 giờ/ngày
> - Test environment: dùng cho load testing, tối đa 2 giờ/ngày
> - → Yêu cầu: giải pháp MOST cost-effective cho cả dev và test, biết cả hai đều không chạy liên tục 24/7 mà chỉ dùng một phần trong ngày

**Phân tích giải pháp tối ưu:**
Configure development environments and test environments with their own Amazon Aurora Serverless v2 PostgreSQL database.

Cả dev (8h/ngày) và test (2h/ngày) đều không chạy liên tục 24/7 → phù hợp mô hình pay-theo-mức-dùng thực tế của Aurora Serverless v2.

Aurora Serverless v2 tự động scale capacity theo tải thực tế, có thể co về mức tối thiểu khi idle → tránh trả tiền cho capacity không dùng đến ngoài giờ làm việc.

Tương thích PostgreSQL, không cần thay đổi schema hay code ứng dụng.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **For each development environment, configure an Amazon RDS for PostgreSQL Single-AZ DB instance. For the test environment, configure a single Amazon RDS for PostgreSQL Multi-AZ DB instance.**:
  Provisioned DB instance tính phí theo giờ cố định 24/7 dù chỉ dùng 8h hoặc 2h/ngày → lãng phí capacity ngoài giờ sử dụng, không cost-effective bằng Serverless v2.
  Multi-AZ cho test environment cũng không cần thiết (load testing không yêu cầu tính khả dụng cao), tăng chi phí không cần thiết.

- **Configure development environments and test environments with their own Amazon Aurora PostgreSQL DB cluster.**:
  Aurora provisioned cluster vẫn tính phí theo instance chạy liên tục, không tự động co về gần 0 khi idle như Serverless v2 → tốn kém hơn cho workload dùng ngắt quãng (intermittent) như dev/test.

- **Configure an Amazon Aurora global database. Allow developers to connect to the database with their own credentials.**:
  Aurora Global Database được thiết kế cho disaster recovery/low-latency trên nhiều Region, không giải quyết bài toán chi phí cho môi trường dev/test dùng ngắt quãng; tốn thêm chi phí vận hành hạ tầng đa Region không cần thiết.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Dùng vài giờ/ngày" / "intermittent usage" / "spiky workload" → Aurora Serverless v2 (trả tiền theo ACU thực dùng, co về gần 0 khi idle)
- "MOST cost-effective" + database không chạy 24/7 → loại ngay các đáp án dùng RDS/Aurora provisioned với capacity cố định
- Aurora Global Database chỉ dùng cho yêu cầu multi-Region DR/latency, không phải bài toán tối ưu chi phí cho dev/test

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Using Aurora Serverless v2](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2.html)

</details>

---

<div id="question-05"></div>

### Question 05: AWS Lambda functions with VPC access to connect through the existing VPN
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company needs to transfer files from an Amazon S3 bucket to a compliance authority's storage system. Files must be transferred as they are uploaded to the bucket. The compliance authority uses an on-premises SFTP server that is accessed through a private VPN connection.

Which solution will meet these requirements with the LEAST management overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an Amazon EC2 instance in a private subnet that has an SFTP client installed. Establish connectivity through the existing VPN connection. Configure scheduled tasks to download files from Amazon S3. Upload them to the compliance authority's SFTP server.
- **(B)** Configure AWS Lambda functions with VPC access to connect through the existing VPN. Use AWS Transfer Family to transfer files from Amazon S3 to the compliance authority's SFTP server. `[Đáp án đúng ✅]`
- **(C)** Deploy AWS DataSync with an agent on an Amazon EC2 instance in a private subnet. Configure the subnet to use the existing VPN connection. Configure scheduled transfer tasks from Amazon S3 to the compliance authority's SFTP server.
- **(D)** Configure S3 Event Notifications to invoke an AWS Lambda function. Configure the function with VPC connectivity and a route to the existing VPN connection. Configure the Lambda code to retrieve the files from Amazon S3 and transfer them to the compliance authority's SFTP server.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần chuyển file từ Amazon S3 bucket sang hệ thống lưu trữ của bên thứ ba (compliance authority)
> - File phải được chuyển ngay khi upload lên bucket (as they are uploaded)
> - Bên nhận dùng on-premises SFTP server, truy cập qua private VPN connection đã có sẵn
> - → Yêu cầu: LEAST management overhead, dùng dịch vụ managed thay vì tự vận hành hạ tầng

**Phân tích giải pháp tối ưu:**
Configure AWS Lambda functions with VPC access to connect through the existing VPN. Use AWS Transfer Family to transfer files from Amazon S3 to the compliance authority's SFTP server.

AWS Transfer Family (cụ thể là tính năng SFTP connector) là dịch vụ managed được thiết kế đúng cho việc gửi file từ S3 đến một SFTP server bên ngoài (partner-owned), hỗ trợ xây dựng luồng chuyển file tự động theo sự kiện (event-driven) mà không cần tự viết client SFTP.

Kết nối qua VPC/VPN tới SFTP server on-premises tận dụng đúng private VPN connection đã có sẵn, không cần mở kết nối qua internet.

Đây là lựa chọn duy nhất trong 4 đáp án dùng đúng dịch vụ managed chuyên biệt cho truyền file qua SFTP, giảm overhead vận hành so với tự viết code/script.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an Amazon EC2 instance in a private subnet that has an SFTP client installed. Establish connectivity through the existing VPN connection. Configure scheduled tasks to download files from Amazon S3. Upload them to the compliance authority's SFTP server.**:
  Phải tự quản lý EC2 instance (patching, scaling, giám sát), tự viết/bảo trì script transfer, dùng scheduled task (không phải "as they are uploaded") → overhead vận hành cao nhất trong 4 lựa chọn.

- **Deploy AWS DataSync with an agent on an Amazon EC2 instance in a private subnet. Configure the subnet to use the existing VPN connection. Configure scheduled transfer tasks from Amazon S3 to the compliance authority's SFTP server.**:
  AWS DataSync không hỗ trợ SFTP server làm location type để chuyển dữ liệu (chỉ hỗ trợ NFS, SMB, HDFS, object storage, S3, EFS, FSx...) → về mặt kỹ thuật không thể cấu hình transfer task thẳng tới một SFTP server như mô tả.

- **Configure S3 Event Notifications to invoke an AWS Lambda function. Configure the function with VPC connectivity and a route to the existing VPN connection. Configure the Lambda code to retrieve the files from Amazon S3 and transfer them to the compliance authority's SFTP server.**:
  Đáp ứng được nhưng yêu cầu tự viết và bảo trì code triển khai giao thức SFTP client trong Lambda (không có managed service nào lo phần này) → tăng effort phát triển/bảo trì so với dùng AWS Transfer Family có sẵn tính năng SFTP connector.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Transfer files to/from an external SFTP server" → AWS Transfer Family (SFTP connectors)
- "LEAST management overhead" → ưu tiên dịch vụ managed chuyên biệt (Transfer Family) hơn là tự viết code (Lambda) hoặc tự quản lý EC2/agent
- DataSync hỗ trợ NFS/SMB/HDFS/S3/EFS/FSx/object storage nhưng KHÔNG hỗ trợ SFTP làm location → loại ngay khi đề yêu cầu đích/nguồn là SFTP server

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Transfer Family SFTP connectors](https://docs.aws.amazon.com/transfer/latest/userguide/creating-connectors.html)
- 🌐 [AWS DataSync FAQs (danh sách location type được hỗ trợ)](https://aws.amazon.com/datasync/faqs/)

</details>

---

<div id="question-06"></div>

### Question 06: AWS DataSync to migrate the data
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company wants to migrate an on-premises Hadoop Distributed File System (HDFS) to a data lake in Amazon S3. The company needs an encrypted network connection to transfer the data.

Which solution will meet these requirements in the MOST cost-effective way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Application Migration Service with an AWS Site-to-Site VPN connection to migrate the data.
- **(B)** Use AWS DataSync to migrate the data. `[Đáp án đúng ✅]`
- **(C)** Use AWS Application Migration Service and an AWS Direct Connect connection with SiteLink to migrate the data.
- **(D)** Use AWS DataSync and AWS Global Accelerator to migrate the data.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Migrate on-premises HDFS (Hadoop Distributed File System) sang data lake trên Amazon S3
> - Cần kết nối mạng được mã hóa (encrypted network connection) để truyền dữ liệu
> - → Yêu cầu: giải pháp MOST cost-effective đáp ứng yêu cầu mã hóa khi truyền

**Phân tích giải pháp tối ưu:**
Use AWS DataSync to migrate the data.

AWS DataSync hỗ trợ HDFS làm location type nguồn trực tiếp, không cần trung gian, phù hợp đúng use case migrate HDFS sang S3.

DataSync tự động mã hóa toàn bộ traffic khi truyền dữ liệu giữa các location bằng mutual TLS (mTLS) 1.3.

Không tốn thêm chi phí VPN Site-to-Site hay Direct Connect như các đáp án khác → cách tiếp cận rẻ nhất trong 4 lựa chọn mà vẫn đảm bảo mã hóa.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use AWS Application Migration Service with an AWS Site-to-Site VPN connection to migrate the data.**:
  AWS Application Migration Service (MGN) dùng để migrate server (lift-and-shift toàn bộ máy chủ), không phải công cụ migrate dữ liệu file/object như HDFS sang S3 - sai service cho mục đích này. Thêm VPN Site-to-Site cũng phát sinh chi phí không cần thiết.

- **(C) Use AWS Application Migration Service and an AWS Direct Connect connection with SiteLink to migrate the data.**:
  Cùng vấn đề sai service (MGN không phù hợp cho data migration dạng này); Direct Connect với SiteLink là giải pháp kết nối mạng chuyên dụng, chi phí cao hơn nhiều so với DataSync tận dụng mã hóa built-in.

- **(D) Use AWS DataSync and AWS Global Accelerator to migrate the data.**:
  AWS Global Accelerator dùng để cải thiện performance/định tuyến traffic tới ứng dụng có địa chỉ IP tĩnh toàn cầu, không liên quan đến việc mã hóa hay tối ưu chi phí truyền dữ liệu migrate một lần từ on-premises - chi phí phát sinh không cần thiết.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Migrate HDFS to S3" → AWS DataSync (hỗ trợ HDFS làm location type có sẵn)
- AWS Application Migration Service (MGN) → chỉ dùng cho lift-and-shift server (EC2), không phải data/file migration service

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Configuring AWS DataSync transfers with an HDFS cluster](https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html)
- 🌐 [AWS DataSync encryption in transit](https://docs.aws.amazon.com/datasync/latest/userguide/encryption-in-transit.html)

</details>

---

<div id="question-07"></div>

### Question 07: The web application by using an Amazon CloudFront distribution that has an Amazon ...
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is developing a web application that the company will host in the AWS Cloud. Application users will upload pictures that the application will analyze and store for auditing purposes. Users frequently access pictures for the first 30 days and rarely access pictures after 30 days.

Which storage solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the web application on an Amazon EC2 instance that is part of an Auto Scaling group. Create and mount an Amazon EFS file system to the EC2 instance to store the pictures.
- **(B)** Deploy the web application on an Amazon EC2 instance that is part of an Auto Scaling group. Attach an Amazon EBS gp3 volume to the EC2 instance to store the pictures.
- **(C)** Host the web application in an Amazon S3 bucket that is configured for static website hosting. Configure all objects in the S3 bucket to use the S3 Glacier Deep Archive storage class.
- **(D)** Host the web application by using an Amazon CloudFront distribution that has an Amazon S3 bucket as the origin. Create an S3 Lifecycle policy to transition the pictures to the S3 Glacier Flexible Retrieval storage class after 30 days. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web application host trên AWS Cloud, người dùng upload pictures, ứng dụng phân tích và lưu trữ cho mục đích audit
> - Access pattern rõ ràng: truy cập thường xuyên trong 30 ngày đầu, hiếm khi truy cập sau 30 ngày
> - → Yêu cầu: giải pháp lưu trữ MOST cost-effective phù hợp với access pattern thay đổi theo thời gian

**Phân tích giải pháp tối ưu:**
Host the web application by using an Amazon CloudFront distribution that has an Amazon S3 bucket as the origin. Create an S3 Lifecycle policy to transition the pictures to the S3 Glacier Flexible Retrieval storage class after 30 days.

S3 Lifecycle policy tự động transition objects sang storage class rẻ hơn đúng thời điểm access pattern thay đổi (sau 30 ngày) - trả đúng giá cho đúng giai đoạn truy cập, không lãng phí khi truy cập thường xuyên (giữ S3 Standard 30 ngày đầu) và không tốn kém khi ít truy cập (chuyển Glacier Flexible Retrieval sau đó).

S3 Glacier Flexible Retrieval phù hợp dữ liệu audit hiếm khi truy cập nhưng vẫn cần khôi phục được trong vài giờ khi cần.

CloudFront + S3 origin giúp delivery content tĩnh như ảnh rất hiệu quả.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Host the web application in an Amazon S3 bucket that is configured for static website hosting. Configure all objects in the S3 bucket to use the S3 Glacier Deep Archive storage class.**:
  Đưa toàn bộ object (kể cả pictures mới upload, đang được truy cập thường xuyên trong 30 ngày đầu) vào S3 Glacier Deep Archive ngay từ đầu là sai hoàn toàn - Deep Archive có thời gian khôi phục hàng chục giờ, không phục vụ được truy cập thường xuyên.

- **Deploy the web application on an Amazon EC2 instance that is part of an Auto Scaling group. Attach an Amazon EBS gp3 volume to the EC2 instance to store the pictures.**:
  EBS là block storage gắn với 1 instance, không có cơ chế lifecycle chuyển tier theo thời gian như S3, không phù hợp lưu trữ ảnh cần truy cập từ ứng dụng web scale nhiều instance; chi phí cao hơn nhiều so với S3 + Lifecycle cho khối lượng ảnh lớn.

- **Deploy the web application on an Amazon EC2 instance that is part of an Auto Scaling group. Create and mount an Amazon EFS file system to the EC2 instance to store the pictures.**:
  EFS là shared file storage, phù hợp khi cần POSIX file system semantics dùng chung giữa nhiều instance, nhưng chi phí lưu trữ cao hơn nhiều so với S3, do đó không lựa chọn.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Truy cập thường xuyên X ngày đầu, hiếm khi truy cập sau đó" → S3 Lifecycle policy transition sang storage class rẻ hơn sau X ngày
- "Cần khôi phục được trong vài giờ, không phải ngay lập tức nhưng cũng không quá lâu" → S3 Glacier Flexible Retrieval

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Transitioning objects using Amazon S3 Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html)

</details>

---

<div id="question-08"></div>

### Question 08: An Amazon RDS for SQL Server Multi-AZ deployment
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company needs to deploy a Microsoft SQL Server database on AWS. The database must handle real-time transactions. The database must be highly available within an AWS Region.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Install SQL Server on two Amazon EC2 instances in two Availability Zones. Ensure data synchronization through custom scripts.
- **(B)** Use Amazon Aurora to host the database. Enable Aurora replicas in different Availability Zones.
- **(C)** Create an Amazon RDS for SQL Server instance. Configure automated snapshots.
- **(D)** Create an Amazon RDS for SQL Server Multi-AZ deployment. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần deploy Microsoft SQL Server database trên AWS
> - Database phải xử lý real-time transactions
> - Phải highly available trong 1 AWS Region
> - → Yêu cầu: giải pháp đáp ứng HA với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create an Amazon RDS for SQL Server Multi-AZ deployment.

RDS Multi-AZ tự động provision và duy trì một standby instance đồng bộ (synchronous) ở Availability Zone khác; khi có sự cố, RDS tự động failover sang standby mà không cần can thiệp thủ công - đáp ứng "LEAST operational overhead".

Đây là dịch vụ managed, AWS tự lo việc backup, patching, failover, monitoring - không cần công ty tự dựng/duy trì cơ chế đồng bộ dữ liệu.

SQL Server Multi-AZ dùng Database Mirroring hoặc Always On Availability Groups tùy phiên bản, đảm bảo dữ liệu đồng bộ real-time cho transaction, phù hợp yêu cầu "real-time transactions".

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Install SQL Server on two Amazon EC2 instances in two Availability Zones. Ensure data synchronization through custom scripts.**:
  Tự cài đặt SQL Server trên EC2 và tự viết script đồng bộ dữ liệu đòi hỏi công ty tự quản lý toàn bộ vòng đời HA (failover, giám sát, đồng bộ) - operational overhead cao nhất trong 4 lựa chọn.

- **(B) Use Amazon Aurora to host the database. Enable Aurora replicas in different Availability Zones.**:
  Amazon Aurora không hỗ trợ engine SQL Server native (chỉ hỗ trợ MySQL và PostgreSQL-compatible).

- **Create an Amazon RDS for SQL Server instance. Configure automated snapshots.**:
  Automated snapshots chỉ phục vụ backup/restore theo point-in-time, không cung cấp high availability hay failover tự động; khi instance gặp sự cố vẫn có downtime đáng kể trong khi chờ restore từ snapshot - không đáp ứng yêu cầu HA.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Microsoft SQL Server" + "highly available" + "LEAST operational overhead" → RDS for SQL Server Multi-AZ deployment
- "Automated snapshots" hoặc "manual replication script" → chỉ giải quyết backup/DR, KHÔNG phải HA/failover tự động
- Yêu cầu "HA trong 1 Region" (không phải multi-Region) → Multi-AZ là đáp án chuẩn, không cần Global Database hay cross-Region replica

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Multi-AZ DB instance deployments for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZSingleStandby.html)

</details>

---

<div id="question-09"></div>

### Question 09: An outbound-only internet gateway in each VPC
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company manages client deployments in individual VPCs and one shared services VPC. Each VPC uses one NAT gateway for each Availability Zone and an internet gateway for outbound traffic. The client deployments use the outbound connections only to call an external API that is available over IPv4 and IPv6.

The company wants to reduce the quantity of NAT gateways to reduce costs. The client deployments should only have outbound access to the internet. The shared services VPC does not require internet access.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Move the clients into public subnets. Assign only an IPv6 address. Delete all NAT gateways.
- **(B)** Create an outbound-only internet gateway in each VPC. Add a route that directs all IPv6 traffic to the outbound-only internet gateway. Delete all NAT gateways. `[Đáp án đúng ✅]`
- **(C)** Create an AWS Transit Gateway in the shared services VPC. Attach all client VPCs to the Transit Gateway. Configure routing so all traffic from the client VPCs routes to the shared services VPC. Delete all NAT gateways.
- **(D)** Delete the NAT gateways in all client VPCs. Configure all route tables to route internet traffic to the shared services VPC.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Nhiều client VPCs + 1 shared services VPC, mỗi VPC hiện dùng NAT gateway cho mỗi AZ + internet gateway
> - Client deployments chỉ cần outbound để gọi 1 external API hỗ trợ cả IPv4 và IPv6
> - Muốn giảm số lượng NAT gateway để giảm chi phí; client chỉ cần outbound access, shared services VPC không cần internet access
> - → Yêu cầu: loại bỏ NAT gateway ở các client VPC mà vẫn giữ được outbound access ra internet, không expose inbound

**Phân tích giải pháp tối ưu:**
Create an outbound-only internet gateway in each VPC. Add a route that directs all IPv6 traffic to the outbound-only internet gateway. Delete all NAT gateways.

"Outbound-only internet gateway" ở đây chính là egress-only internet gateway (EIGW) - component miễn phí, cho phép kết nối outbound-only IPv6 traffic ra internet, nhưng chặn kết nối từ internet vào tương tự như NAT Gateway.

Vì external API hỗ trợ cả IPv4 và IPv6, client có thể chuyển hẳn sang gọi API qua IPv6 và dùng EIGW thay cho NAT gateway (vốn chỉ xử lý IPv4) → loại bỏ hoàn toàn NAT gateway mà vẫn giữ outbound access.

Instance vẫn ở private subnet (không cần chuyển sang public subnet), đúng yêu cầu "client deployments should only have outbound access to the internet" (không có inbound).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Move the clients into public subnets. Assign only an IPv6 address. Delete all NAT gateways.**:
  Chuyển instance sang public subnet thay đổi mô hình bảo mật đáng kể, có nguy cơ expose resource ra internet (public subnet gắn route trực tiếp tới Internet Gateway hỗ trợ cả inbound/outbound) - không phù hợp yêu cầu "client deployments should only have outbound access" (chỉ outbound), trong khi Egress-only IGW giữ được private subnet mà vẫn outbound-only.

- **Create an AWS Transit Gateway in the shared services VPC. Attach all client VPCs to the Transit Gateway. Configure routing so all traffic from the client VPCs routes to the shared services VPC. Delete all NAT gateways.**:
  Đề nói rõ shared services VPC không cần internet access, nên định tuyến traffic client qua shared services VPC không giải quyết được vấn đề (shared services VPC không có đường ra internet để client dùng); giải pháp cũng phức tạp và tốn phí Transit Gateway không cần thiết.

- **Delete the NAT gateways in all client VPCs. Configure all route tables to route internet traffic to the shared services VPC.**:
  Tương tự lựa chọn Transit Gateway, route traffic tới shared services VPC không có ý nghĩa khi VPC đó không có kết nối internet - traffic sẽ không đến được đích, làm mất hoàn toàn outbound access của client.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Giảm chi phí NAT gateway" + "external API hỗ trợ cả IPv4 và IPv6" → chuyển traffic sang IPv6, dùng Egress-only Internet Gateway (miễn phí) thay NAT gateway
- "Chỉ cần outbound access, không được có inbound" → loại ngay đáp án đưa resource vào public subnet

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Enable outbound IPv6 traffic using an egress-only internet gateway](https://docs.aws.amazon.com/vpc/latest/userguide/egress-only-internet-gateway.html)

</details>

---

<div id="question-10"></div>

### Question 10: Amazon Kinesis Data Streams
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company needs a solution to ingest millions of small telemetry records each minute. The records come from globally distributed mobile devices and run near real-time aggregations. The solution must give multiple downstream applications the ability to replay the ingested data from any point in time. The solution must also scale seamlessly without manual sharding.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Provision Amazon MQ ActiveMQ brokers. Create durable topics. Require consumer delivery acknowledgments for each record.
- **(B)** Deploy Amazon Kinesis Data Streams. Enable enhanced fan-out consumers to read shards in parallel. Retain the data for 24 hours. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Invoke AWS Step Functions Standard Workflows from each device. Route the telemetry through parallel processing branches.
- **(D)** Configure Amazon SQS FIFO queues so that multiple consumer groups pull messages and delete the messages after processing.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần xử lý hàng triệu bản ghi telemetry nhỏ mỗi phút từ mobile devices phân tán toàn cầu
> - Cần chạy near real-time aggregation (tính toán gần thời gian thực)
> - Nhiều downstream application phải có khả năng replay dữ liệu từ bất kỳ thời điểm nào (from any point in time)
> - Phải scale seamlessly, không cần manual sharding
> - → Yêu cầu: nền tảng streaming durable, hỗ trợ nhiều consumer độc lập đọc lại dữ liệu, tự động scale

**Phân tích giải pháp tối ưu:**
Deploy Amazon Kinesis Data Streams. Enable enhanced fan-out consumers to read shards in parallel. Retain the data for 24 hours.

Kinesis Data Streams là service streaming data, lưu trữ record trong retention window (mặc định 24h, có thể set dài hơn) cho phép replay dữ liệu từ bất kỳ vị trí nào trong khoảng retention - đúng yêu cầu "replay the ingested data from any point in time".

Enhanced fan-out cho phép mỗi consumer nhận dedicated throughput riêng (lên tới 2MB/s/shard), không tranh chấp băng thông với các consumer khác → nhiều downstream application đọc song song mà không ảnh hưởng lẫn nhau.

Kinesis Data Streams ở chế độ on-demand tự động quản lý và scale shard theo tải mà không cần thao tác thủ công chia shard (manual sharding) - phù hợp khối lượng ghi lớn, biến động từ thiết bị di động toàn cầu.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure Amazon SQS FIFO queues so that multiple consumer groups pull messages and delete the messages after processing.**:
  SQS là messaging service, message bị xóa sau khi xử lý xong → không hỗ trợ replay dữ liệu từ một thời điểm bất kỳ trong quá khứ; FIFO cũng có giới hạn throughput thấp hơn nhiều so với yêu cầu triệu bản ghi/phút.

- **(A) Provision Amazon MQ ActiveMQ brokers. Create durable topics. Require consumer delivery acknowledgments for each record.**:
  Amazon MQ phù hợp cho lift-and-shift ứng dụng JMS/AMQP hiện có, không được thiết kế cho khối lượng ingest cực lớn (triệu bản ghi/phút) và không có khả năng replay linh hoạt như Kinesis; việc scale broker cũng đòi hỏi thao tác thủ công, không "seamless".

- **(C) Invoke AWS Step Functions Standard Workflows from each device. Route the telemetry through parallel processing branches.**:
  Step Functions là công cụ orchestration workflow (điều phối các bước xử lý), không phải nền tảng ingest/streaming dữ liệu khối lượng lớn; gọi Step Functions trực tiếp từ hàng triệu thiết bị mỗi phút không phù hợp về mặt kiến trúc và chi phí, không hỗ trợ replay dữ liệu.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Replay dữ liệu từ bất kỳ thời điểm nào" + nhiều consumer độc lập → Amazon Kinesis Data Streams (streaming, có retention window), không phải SQS/SNS (message bị xóa sau khi xử lý)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Consumers with enhanced fan-out](https://docs.aws.amazon.com/streams/latest/dev/enhanced-consumers.html)
- 🌐 [Choose the right mode to stream in (on-demand vs provisioned)](https://docs.aws.amazon.com/streams/latest/dev/how-do-i-size-a-stream.html)

</details>

---

<div id="question-11"></div>

### Question 11: Place the frontend and backend EC2 instances into separate Auto Scaling groups
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An ecommerce company hosts an API that handles sales requests. The company hosts the API frontend on Amazon EC2 instances that run behind an Application Load Balancer (ALB). The company hosts the API backend on EC2 instances that perform the transactions. The backend tiers are loosely coupled by an Amazon SQS queue.

The company anticipates a significant increase in request volume during a new product launch event. The company wants to ensure that the API can handle increased loads successfully.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Place the frontend EC2 instances into an Auto Scaling group. Add an Amazon ElastiCache cluster in front of the ALB to reduce the amount of traffic the API needs to handle.
- **(B)** Place the frontend and backend EC2 instances into separate Auto Scaling groups. Create a policy for the frontend Auto Scaling group to launch instances based on incoming network traffic. Create a policy for the backend Auto Scaling group to launch instances based on the SQS queue backlog. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Place the frontend EC2 instances into an Auto Scaling group. Create an Auto Scaling policy to launch new instances to handle the incoming network traffic.
- **(D)** Double the number of frontend and backend EC2 instances to handle the increased traffic during the product launch event. Create a dead-letter queue to retain unprocessed sales requests when the demand exceeds the system capacity.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Kiến trúc 2 tầng: frontend EC2 (nhận request) sau ALB, backend EC2 thực hiện transaction
> - Hai tầng loosely coupled bằng Amazon SQS queue
> - Sắp có product launch event làm tăng đột biến request volume
> - → Yêu cầu: đảm bảo API scale tốt khi tải tăng mạnh, cho cả frontend lẫn backend

**Phân tích giải pháp tối ưu:**
Place the frontend and backend EC2 instances into separate Auto Scaling groups. Create a policy for the frontend Auto Scaling group to launch instances based on incoming network traffic. Create a policy for the backend Auto Scaling group to launch instances based on the SQS queue backlog.

Frontend nằm sau ALB nên scale theo network traffic/request là hợp lý (target tracking theo ALB request count hoặc network I/O)

Backend xử lý qua SQS queue nên có thể scale theo backlog per instance (số message trong queue (ApproximateNumberOfMessages) / số instance đang chạy) - đây là metric chuẩn AWS khuyến nghị cho worker tier đọc từ SQS

Tách riêng 2 Auto Scaling group vì đặc tính tải của 2 tầng khác nhau hoàn toàn (traffic-driven vs queue-driven) - dùng chung 1 ASG hoặc 1 policy sẽ không phản ánh đúng nhu cầu scale từng tầng

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Double the number of frontend and backend EC2 instances to handle the increased traffic during the product launch event. Create a dead-letter queue to retain unprocessed sales requests when the demand exceeds the system capacity.**:
  Scale thủ công (double số instance) không tự động, không co giãn theo tải thực tế - nếu tải tăng hơn dự kiến hoặc thấp hơn dự kiến đều gây vấn đề (thiếu tải hoặc lãng phí)
  DLQ chỉ lưu message lỗi/không xử lý được, không giải quyết vấn đề scale capacity

- **(C) Place the frontend EC2 instances into an Auto Scaling group. Create an Auto Scaling policy to launch new instances to handle the incoming network traffic.**:
  Chỉ scale được frontend, bỏ sót backend - backend vẫn là fixed capacity nên khi traffic tăng, SQS backlog sẽ dồn ứ vì backend không scale theo

- **(A) Place the frontend EC2 instances into an Auto Scaling group. Add an Amazon ElastiCache cluster in front of the ALB to reduce the amount of traffic the API needs to handle.**:
  ElastiCache dùng để cache dữ liệu đọc (read-heavy), không phù hợp với API xử lý sales transaction (ghi dữ liệu, không cache được)
  Vẫn bỏ sót scale cho backend tier

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Loosely coupled by SQS queue" + "backend tier" → Auto Scaling theo SQS backlog per instance (ApproximateNumberOfMessages / GroupInServiceInstances)
- Kiến trúc 2 tầng có đặc tính tải khác nhau → luôn tách 2 Auto Scaling group riêng với 2 policy riêng

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Scaling policy based on Amazon SQS](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)
- 🌐 [Create a target tracking scaling policy using metric math](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-target-tracking-metric-math.html)

</details>

---

<div id="question-12"></div>

### Question 12: The Lambda functions inside the VPC
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is building a data processing application that uses AWS Lambda functions. The application's Lambda functions need to communicate with an Amazon RDS DB instance that is deployed within a VPC in the same AWS account.

Which solution meets these requirements in the MOST secure way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the DB instance to allow public access. Update the DB instance security group to allow access from the Lambda public address space for the AWS Region.
- **(B)** Peer the Lambda default VPC with the VPC that hosts the DB instance to allow direct network access without the need for security groups.
- **(C)** Deploy the Lambda functions inside the VPC. Attach a network ACL to the Lambda subnet. Provide outbound rule access to the VPC CIDR range only. Update the DB instance security group to allow traffic from 0.0.0.0/0.
- **(D)** Deploy the Lambda functions inside the VPC. Attach a security group to the Lambda functions. Provide outbound rule access to the VPC CIDR range only. Update the DB instance security group to allow traffic from the Lambda security group. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - AWS Lambda function cần giao tiếp với Amazon RDS DB instance nằm trong VPC
> - Cùng AWS account
> - → Yêu cầu: kết nối theo cách bảo mật nhất (MOST secure)

**Phân tích giải pháp tối ưu:**
Deploy the Lambda functions inside the VPC. Attach a security group to the Lambda functions. Provide outbound rule access to the VPC CIDR range only. Update the DB instance security group to allow traffic from the Lambda security group.

Lambda deploy trong VPC để truy cập trực tiếp DB instance qua private network, không đi qua internet

Dùng security group tham chiếu security group (Lambda SG làm source cho inbound rule của DB SG) - đây là best practice của AWS khi cấp quyền truy cập cho Security Group

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the DB instance to allow public access. Update the DB instance security group to allow access from the Lambda public address space for the AWS Region.**:
  Bật public access cho DB instance là vi phạm nghiêm trọng nguyên tắc bảo mật, expose DB ra internet
  "Lambda public address space" rất rộng (public IP range của cả Region), không kiểm soát được nguồn traffic cụ thể

- **Deploy the Lambda functions inside the VPC. Attach a network ACL to the Lambda subnet. Provide outbound rule access to the VPC CIDR range only. Update the DB instance security group to allow traffic from 0.0.0.0/0.**:
  0.0.0.0/0 trên DB security group cho phép traffic từ bất kỳ đâu - hoàn toàn không đúng nguyên tắc least privilege cho security, dù NACL có giới hạn ở tầng subnet

- **(B) Peer the Lambda default VPC with the VPC that hosts the DB instance to allow direct network access without the need for security groups.**:
  Lambda không có "default VPC" cố định để peering theo cách này; VPC peering không loại bỏ nhu cầu security group - traffic vẫn cần được cho phép qua security group ở cả 2 phía
  Peering thêm phức tạp hạ tầng không cần thiết khi Lambda chỉ cần attach trực tiếp vào VPC chứa DB

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "MOST secure" + "Lambda access RDS in same VPC" → Lambda trong VPC + security group tham chiếu security group (không dùng CIDR, không dùng 0.0.0.0/0)
- Nếu đề có "public access" hoặc "0.0.0.0/0" cho database → loại ngay vì vi phạm least privilege

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [How do I configure a Lambda function to connect to an RDS instance?](https://repost.aws/knowledge-center/connect-lambda-to-an-rds-instance)
- 🌐 [Giving Lambda functions access to resources in an Amazon VPC](https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html)

</details>

---

<div id="question-13"></div>

### Question 13: An Amazon Machine Image (AMI) of the web application
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company hosts a website analytics application on a single Amazon EC2 On-Demand Instance. The analytics application is highly resilient and is designed to run in stateless mode.

The company notices that the application is showing signs of performance degradation during busy times and is presenting 5xx errors. The company needs to make the application scale seamlessly.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Lambda function to stop the EC2 instance and change the instance type. Create an Amazon CloudWatch alarm to invoke the Lambda function when CPU utilization is more than 75%.
- **(B)** Create an Amazon Machine Image (AMI) of the web application. Use the AMI to launch a second EC2 On-Demand Instance. Use Amazon Route 53 weighted routing to distribute the load across the two EC2 instances.
- **(C)** Create an Amazon Machine Image (AMI) of the web application. Use the AMI to launch a second EC2 On-Demand Instance. Use an Application Load Balancer to distribute the load across the two EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create an Amazon Machine Image (AMI) of the web application. Apply the AMI to a launch template. Create an Auto Scaling group that includes the launch template to use a Spot Fleet. Attach an Application Load Balancer to the Auto Scaling group.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website analytics app chạy trên một EC2 On-Demand Instance duy nhất
> - Ứng dụng highly resilient, thiết kế stateless
> - Xuất hiện performance degradation và 5xx errors khi busy
> - → Yêu cầu: scale seamlessly, giải pháp MOST cost-effective

**Phân tích giải pháp tối ưu:**
Create an Amazon Machine Image (AMI) of the web application. Apply the AMI to a launch template. Create an Auto Scaling group that includes the launch template to use a Spot Fleet. Attach an Application Load Balancer to the Auto Scaling group.

Ứng dụng đã stateless (bản thân EC2 không chứa data) → an toàn khi dùng Spot Instances (có thể bị interrupt bất cứ lúc nào mà không ảnh hưởng dữ liệu/session)

Spot Instances rẻ hơn On-Demand tới ~90%, kết hợp với Auto Scaling group giúp scale seamlessly theo tải mà vẫn tối ưu chi phí nhất trong các lựa chọn

ALB đứng trước ASG phân phối tải, health check tự động loại bỏ instance lỗi 5xx, thay thế bằng instance mới

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon Machine Image (AMI) of the web application. Use the AMI to launch a second EC2 On-Demand Instance. Use an Application Load Balancer to distribute the load across the two EC2 instances.**:
  Chỉ thêm 1 instance cố định (không phải Auto Scaling), không "scale seamlessly" theo tải thực tế
  Vẫn dùng On-Demand (đắt hơn Spot) trong khi ứng dụng đã stateless và có thể tận dụng Spot để tiết kiệm chi phí

- **Create an Amazon Machine Image (AMI) of the web application. Use the AMI to launch a second EC2 On-Demand Instance. Use Amazon Route 53 weighted routing to distribute the load across the two EC2 instances.**:
  Weighted routing DNS-based không phải cơ chế load balancing thời gian thực, không tự động phát hiện và loại bỏ instance unhealthy nhanh như ALB health check
  Vẫn thiếu Auto Scaling và vẫn dùng On-Demand

- **Create an AWS Lambda function to stop the EC2 instance and change the instance type. Create an Amazon CloudWatch alarm to invoke the Lambda function when CPU utilization is more than 75%.**:
  Stop instance để đổi instance type gây downtime (vertical scaling gián đoạn), hoàn toàn không phải "scale seamlessly"
  Không giải quyết vấn đề single point of failure và không loại bỏ 5xx errors trong lúc scale

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Stateless" + "cost-effective scaling" → Spot Fleet/Spot Instances trong Auto Scaling group (rẻ nhất, an toàn vì không cần giữ state)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Understand automatic scaling for Spot Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-automatic-scaling.html)
- 🌐 [Amazon EC2 Spot Fleet and Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/services-that-can-integrate-ec2.html)

</details>

---

<div id="question-14"></div>

### Question 14: An Elastic IP address with the NAT gateway and Add a route of 0 and a NAT gateway ...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C), (E) | **Đáp án đúng**: (B), (C), (E)

#### 📋 Đề bài (Scenario)
A company creates a VPC that has one public subnet and one private subnet. The company attaches an internet gateway to the VPC. An Application Load Balancer (ALB) in the public subnet communicates with Amazon EC2 instances in the private subnet.

The EC2 instances in the private subnet must be able to download operating system (OS) and application updates from the internet. The instances must not be accessible from the internet.

Which combination of steps will meet these requirements? (Select THREE.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Associate an Elastic IP address with the internet gateway.
- **(B)** Add a route of 0.0.0.0/0 to the private subnet route table. Set the NAT gateway as a target. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Deploy a NAT gateway in the public subnet. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Add a route of 0.0.0.0/0 to the public subnet route table. Set the NAT gateway as a target.
- **(E)** Associate an Elastic IP address with the NAT gateway. `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** Deploy a NAT gateway in the private subnet.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - VPC có 1 public subnet và 1 private subnet, đã attach internet gateway
> - ALB ở public subnet giao tiếp với EC2 ở private subnet
> - EC2 ở private subnet cần download OS/application updates từ internet
> - EC2 ở private subnet không được truy cập từ internet (inbound)
> - → Yêu cầu: chọn đúng 3 bước để private subnet có outbound internet access mà vẫn không bị truy cập từ ngoài vào

**Phân tích giải pháp tối ưu:**
Associate an Elastic IP address with the NAT gateway.

NAT gateway bắt buộc phải có Elastic IP khi tạo, đây là thiết kế cũng như quy định bắt buộc của AWS.

Add a route of 0.0.0.0/0 to the private subnet route table. Set the NAT gateway as a target.

Route table của private subnet phải trỏ 0.0.0.0/0 đến NAT gateway để traffic outbound ra internet của EC2 đi qua NAT

Deploy a NAT gateway in the public subnet.

NAT gateway phải nằm trong public subnet (subnet có route đến internet gateway) thì nó mới có thể ra internet được

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy a NAT gateway in the private subnet.**:
  NAT gateway phải đặt ở public subnet (nơi có route ra internet gateway) mới hoạt động được - đặt ở private subnet thì bản thân NAT gateway cũng không ra internet được

- **Add a route of 0.0.0.0/0 to the public subnet route table. Set the NAT gateway as a target.**:
  Route 0.0.0.0/0 của public subnet phải trỏ đến internet gateway, không phải NAT gateway (NAT gateway là target của private subnet route table, ngược lại với gợi ý này)

- **Associate an Elastic IP address with the internet gateway.**:
  Internet gateway không cần và không thể gán Elastic IP - Elastic IP được gán trực tiếp cho NAT gateway (hoặc instance), không phải cho internet gateway

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Private instance cần outbound internet nhưng không cho inbound" → NAT gateway
- Public subnet route 0.0.0.0/0 luôn trỏ đến internet gateway; private subnet route 0.0.0.0/0 luôn trỏ đến NAT gateway

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [NAT gateway use cases](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateway-scenarios.html)
- 🌐 [How do I set up a public NAT gateway to access the internet from a private subnet in Amazon VPC?](https://repost.aws/knowledge-center/nat-gateway-vpc-private-subnet)

</details>

---

<div id="question-15"></div>

### Question 15: AWS Global Accelerator with UDP listeners and endpoint groups in each Region
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is designing the network for an online multi-player game. The game uses the UDP networking protocol and will be deployed in eight AWS Regions. The network architecture needs to minimize latency and packet loss to give end users a high-quality gaming experience.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a VPC peering mesh between each Region. Turn on UDP for each VPC.
- **(B)** Set up a transit gateway in each Region. Create inter-Region peering attachments between each transit gateway.
- **(C)** Set up AWS Global Accelerator with UDP listeners and endpoint groups in each Region. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Set up Amazon CloudFront with UDP turned on. Configure an origin in each Region.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Game online multi-player dùng UDP protocol
> - Triển khai trên 8 AWS Regions
> - → Yêu cầu: minimize latency và packet loss, trải nghiệm chơi game chất lượng cao

**Phân tích giải pháp tối ưu:**
Set up AWS Global Accelerator with UDP listeners and endpoint groups in each Region.

Global Accelerator định tuyến traffic vào mạng backbone toàn cầu của AWS (congestion-free), giảm số hop và khoảng cách vật lý so với đi qua public internet, giúp giảm latency

Hỗ trợ native UDP listener - đúng với giao thức game đang dùng

Endpoint groups theo từng Region tự động route người chơi đến Region gần nhất/tối ưu nhất, phù hợp kiến trúc multi-Region

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Set up a transit gateway in each Region. Create inter-Region peering attachments between each transit gateway.**:
  Transit Gateway dùng để kết nối VPC-to-VPC / Region-to-Region trong nội bộ hạ tầng AWS, không phải giải pháp tối ưu đường đi từ end user (internet) đến ứng dụng
  Không giải quyết vấn đề latency/packet loss cho traffic từ người chơi bên ngoài

- **(D) Set up Amazon CloudFront with UDP turned on. Configure an origin in each Region.**:
  CloudFront không hỗ trợ UDP - CloudFront là CDN cho HTTP/HTTPS (TCP), không có tùy chọn "turn on UDP"

- **(A) Set up a VPC peering mesh between each Region. Turn on UDP for each VPC.**:
  VPC peering chỉ kết nối các VPC nội bộ với nhau, không tối ưu đường đi cho traffic từ internet vào
  "Turn on UDP for VPC" không phải khái niệm hợp lệ - VPC không có công tắc bật/tắt giao thức

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đề nhắc đến UDP / TCP thì sẽ liên quan đến Global accelerator và NLB
- "UDP" + "multi-Region" + "minimize latency/packet loss cho end user" → AWS Global Accelerator (hỗ trợ cả TCP và UDP)
- "CDN" + "UDP" → loại ngay CloudFront (chỉ HTTP/HTTPS)
- Transit Gateway và VPC Peering giải quyết kết nối nội bộ AWS, không tối ưu đường đi từ client internet - loại khi đề nói về trải nghiệm end user

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Reach more players using AWS Global Accelerator](https://aws.amazon.com/blogs/gametech/reach-more-players-using-aws-global-accelerator/)
- 🌐 [Getting started with a custom routing accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/getting-started-custom-routing.html)

</details>

---

<div id="question-16"></div>

### Question 16: An Amazon S3 bucket to store the raw data
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A research laboratory needs to process a multi-terabyte dataset multiple times each day. The laboratory requires sub-millisecond latency while processing the data. Hundreds of Amazon EC2 Linux instances will process the data from the source and store the data in a different location.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon S3 bucket to store the raw data. Create an Amazon FSx for Lustre file system that uses persistent HDD storage. Configure the FSx for Lustre file system to import data from and export data to Amazon S3. Access the file system by using a Gateway Load Balancer.
- **(B)** Create an Amazon FSx for Windows File Server Multi-AZ file system with HDD storage. Enable shadow copies. Mount the file system on the EC2 instances by using SMB protocol.
- **(C)** Create an Amazon FSx for NetApp ONTAP file system. Set each volume's tiering policy to All. Import the raw data into the file system. Mount the file system on the EC2 instances.
- **(D)** Create an Amazon S3 bucket to store the raw data. Create an Amazon FSx for Lustre file system that uses persistent SSD storage. Configure the FSx for Lustre file system to import data from and export data to Amazon S3. Mount the file system on the EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Xử lý multi-terabyte dataset nhiều lần mỗi ngày
> - Yêu cầu sub-millisecond latency khi xử lý
> - Hàng trăm EC2 Linux instances cùng đọc dữ liệu từ nguồn và ghi ra vị trí khác
> - → Yêu cầu: file system hiệu năng cao, sub-ms latency, tích hợp tốt với S3 cho luồng dữ liệu vào/ra

**Phân tích giải pháp tối ưu:**
Create an Amazon S3 bucket to store the raw data. Create an Amazon FSx for Lustre file system that uses persistent SSD storage. Configure the FSx for Lustre file system to import data from and export data to Amazon S3. Mount the file system on the EC2 instances.

FSx for Lustre là file system chuẩn cho HPC (High performance computing - xử lý performance cao) / high-throughput data processing, hỗ trợ hàng trăm/nghìn compute instance truy cập đồng thời cùng file/directory

SSD storage class cung cấp latency sub-millisecond đúng yêu cầu đề bài

Tích hợp import/export tự động với S3 cho phép lưu raw data ở S3 (rẻ, bền) và xử lý hiệu năng cao trên Lustre


Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon FSx for NetApp ONTAP file system. Set each volume's tiering policy to All. Import the raw data into the file system. Mount the file system on the EC2 instances.**:
  FSx for ONTAP không phải lựa chọn tối ưu cho latency sub-millisecond ở quy mô hàng trăm compute instance như Lustre, không phải service dành cho use case storage

- **Create an Amazon S3 bucket to store the raw data. Create an Amazon FSx for Lustre file system that uses persistent HDD storage. Configure the FSx for Lustre file system to import data from and export data to Amazon S3. Access the file system by using a Gateway Load Balancer.**:
  HDD storage class không đáp ứng yêu cầu sub-millisecond
  "Access the file system by using a Gateway Load Balancer" không hợp lý về mặt kỹ thuật - Gateway Load Balancer dùng cho traffic inspection/firewall appliance, không phải là cách để cho EC2 mount file system

- **Create an Amazon FSx for Windows File Server Multi-AZ file system with HDD storage. Enable shadow copies. Mount the file system on the EC2 instances by using SMB protocol.**:
  FSx for Windows File Server thiết kế cho workload Windows/SMB, không tối ưu cho khối lượng xử lý HPC lớn với hàng trăm Linux instance
  HDD storage lại không đạt sub-millisecond latency; "shadow copies" là tính năng versioning, không liên quan yêu cầu hiệu năng

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Sub-millisecond latency" + "hundreds of compute instances" + "HPC/data processing" → FSx for Lustre, storage class SSD

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [What is Amazon FSx for Lustre?](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)
- 🌐 [Deployment and storage class options for FSx for Lustre file systems](https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-fsx-lustre.html)
- 🌐 [Performance characteristics of SSD and HDD storage classes](https://docs.aws.amazon.com/fsx/latest/LustreGuide/ssd-storage.html)

</details>

---

<div id="question-17"></div>

### Question 17: An Amazon EFS file system with mount points in multiple Availability Zones
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is migrating a document management application to AWS. The application runs on Linux servers. The company will migrate the application to Amazon EC2 instances in an Auto Scaling group. The company stores 7 TiB of documents in a shared storage file system. An external relational database tracks the documents.

Documents are stored once and can be retrieved multiple times for reference at any time. The company cannot modify the application during the migration. The storage solution must be highly available and must support scaling over time.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an EC2 instance with enhanced networking as a shared NFS storage system. Export the NFS share. Mount the NFS share on the EC2 instances in the Auto Scaling group.
- **(B)** Create an Amazon EFS file system with mount points in multiple Availability Zones. Use the EFS Standard-Infrequent Access (Standard-IA) storage class. Mount the NFS share on the EC2 instances in the Auto Scaling group. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create an Amazon S3 bucket that uses the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Mount the S3 bucket on the EC2 instances in the Auto Scaling group.
- **(D)** Deploy an SFTP server endpoint by using AWS Transfer for SFTP and an Amazon S3 bucket. Configure the EC2 instances in the Auto Scaling group to connect to the SFTP server.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Migrate ứng dụng quản lý tài liệu, chạy trên Linux servers, lên EC2 trong Auto Scaling group
> - 7 TiB documents hiện lưu trên shared storage file system (NFS-like), có external relational database track metadata
> - Documents lưu 1 lần, có thể đọc lại bất kỳ lúc nào
> - Không được sửa đổi application trong quá trình migrate
> - → Yêu cầu: storage solution highly available, support scaling over time, MOST cost-effective

**Phân tích giải pháp tối ưu:**
Create an Amazon EFS file system with mount points in multiple Availability Zones. Use the EFS Standard-Infrequent Access (Standard-IA) storage class. Mount the NFS share on the EC2 instances in the Auto Scaling group.

EFS là service fileshare cho linux, sử dụng giao thức NFS - ứng dụng hiện đang dùng shared NFS storage nên mount EFS không cần sửa code (đúng ràng buộc "cannot modify the application")

Mount points ở nhiều Availability Zone → highly available, tự động scale dung lượng theo nhu cầu (elastic, không cần provision trước)

EFS Standard-IA giảm chi phí lưu trữ cho dữ liệu ít truy cập thường xuyên (lưu 1 lần, đôi khi đọc lại) trong khi vẫn giữ Multi-AZ resilience - phù hợp "MOST cost-effective"


Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an EC2 instance with enhanced networking as a shared NFS storage system. Export the NFS share. Mount the NFS share on the EC2 instances in the Auto Scaling group.**:
  Một EC2 instance đóng vai trò NFS server là single point of failure, không đáp ứng yêu cầu highly available
  Phải tự quản lý scaling, patching, backup cho storage server này - không phải giải pháp managed, tốn công vận hành

- **Create an Amazon S3 bucket that uses the S3 Standard-Infrequent Access (S3 Standard-IA) storage class. Mount the S3 bucket on the EC2 instances in the Auto Scaling group.**:
  S3 là object storage, không phải file system - "mount S3 bucket" theo kiểu file system POSIX không phải cách S3 hoạt động, thường đòi hỏi sửa code để gọi S3 API (vi phạm ràng buộc "cannot modify the application")

- **Deploy an SFTP server endpoint by using AWS Transfer for SFTP and an Amazon S3 bucket. Configure the EC2 instances in the Auto Scaling group to connect to the SFTP server.**:
  AWS Transfer Family dùng cho transfer file qua SFTP/FTPS (trao đổi file với bên ngoài), không phải cơ chế mount shared file system nội bộ cho ứng dụng đang chạy đọc/ghi liên tục
  Yêu cầu đổi cách ứng dụng truy cập dữ liệu (qua SFTP thay vì file system trực tiếp) → vi phạm ràng buộc không sửa app

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Không được sửa application" + "đang dùng shared NFS storage" → Amazon EFS (giữ nguyên giao thức NFS, chỉ cần mount)
- "Lưu 1 lần, đôi khi đọc lại" + "cost-effective" → EFS Standard-IA (giảm phí lưu trữ so với Standard)
- "Highly available" + "storage" → luôn cần Multi-AZ, loại ngay đáp án dùng 1 EC2 instance làm storage server

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Storage class (Amazon EFS)](https://docs.aws.amazon.com/help-panel/efs/latest/console/hp-create-fs-storage-class.html)
- 🌐 [File Storage Classes (Amazon EFS)](https://aws.amazon.com/efs/storage-classes/)

</details>

---

<div id="question-18"></div>

### Question 18: Amazon DocumentDB serverless with automatic capacity scaling
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A financial services company needs to store and manage trading documentation. The documentation includes real-time trade confirmation data, financial statements, and settlement documents that frequently exceed 1 MB in size. The company's current provisioned database solution stores and manages this documentation. This current solution experiences high-volume trading activity during market hours but very low activity during off-hours.

The company currently uses a provisioned database solution that is sized to handle the load for peak trading hours. This solution results in significant unused capacity during off-hours. The company needs a solution that will maintain performance during peak hours.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon DocumentDB serverless with automatic capacity scaling. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy Amazon DynamoDB with auto scaling.
- **(C)** Deploy Amazon RDS for MySQL on Reserved Instances with read replicas for scaling.
- **(D)** Deploy a MongoDB cluster on Amazon EC2 instances in an Auto Scaling group.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Lưu trading documentation: trade confirmation data, financial statements, settlement documents
> - Documents thường xuyên vượt quá 1 MB kích thước
> - Tải cao trong giờ giao dịch (market hours), rất thấp ngoài giờ (off-hours)
> - Provisioned database hiện tại đang set cấu hình cao để đáp ứng yêu cầu traffic peak (cao) giờ giao dịch → lãng phí capacity lúc off-hours
> - → Yêu cầu: giải pháp MOST cost-effective, vẫn giữ hiệu năng lúc peak

**Phân tích giải pháp tối ưu:**
Deploy Amazon DocumentDB serverless with automatic capacity scaling.

DocumentDB (MongoDB-compatible) hỗ trợ document size lên đến ~16 MB, phù hợp với documents "frequently exceed 1 MB"

DocumentDB Serverless tự động scale capacity lên/xuống theo workload theo từng giây, tiết kiệm đến ~90% chi phí so với provisioned cho peak, khớp chính xác pattern tải "cao giờ giao dịch, thấp off-hours"

Loại bỏ nhu cầu provision cố định theo peak - chỉ trả tiền theo capacity thực dùng

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon RDS for MySQL on Reserved Instances with read replicas for scaling.**:
  Reserved Instances vẫn là provisioned capacity cố định, không giải quyết vấn đề lãng phí lúc off-hours (vẫn trả tiền 24/7 dù tải thấp)
  Read replicas chỉ scale được read, không giải quyết vấn đề capacity ghi (write) biến động theo giờ

- **Deploy Amazon DynamoDB with auto scaling.**:
  DynamoDB item size tối đa 400 KB - không lưu trực tiếp được documents "frequently exceed 1 MB" mà không tách dữ liệu ra S3 (cần thêm kiến trúc S3-offload pattern, không đơn giản là "deploy DynamoDB with auto scaling")
  Về bản chất auto scaling của DynamoDB vẫn phù hợp cho tải biến động, nhưng bị loại vì giới hạn kích thước item không khớp yêu cầu đề bài

- **Deploy a MongoDB cluster on Amazon EC2 instances in an Auto Scaling group.**:
  Tự quản lý MongoDB trên EC2 tốn nhiều operational overhead (patching, backup, replication, failover) so với dịch vụ managed
  Auto Scaling group cho EC2 scale chậm hơn nhiều so với DocumentDB Serverless (phải launch instance mới, không phải scale capacity tức thời theo giây)

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Document lớn hơn 400 KB / vượt quá 1 MB" → loại ngay DynamoDB (giới hạn item size 400 KB), cân nhắc DocumentDB (giới hạn document ~16 MB, MongoDB-compatible)
- "Tải biến động mạnh giữa peak và off-hours" + "cost-effective, no over-provisioning" → Serverless (DocumentDB Serverless, Aurora Serverless...) thay vì Reserved Instances/provisioned
- "Self-managed database trên EC2" → luôn có operational overhead cao hơn managed service, cân nhắc kỹ khi đề yêu cầu "most cost-effective" hoặc "least operational overhead"

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Using Amazon DocumentDB serverless](https://docs.aws.amazon.com/documentdb/latest/devguide/docdb-serverless.html)
- 🌐 [Best practices for storing large items and attributes in DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-use-s3-too.html)
- 🌐 [Constraints in Amazon DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Constraints.html)

</details>

---

<div id="question-19"></div>

### Question 19: Aurora Auto Scaling for Aurora Replicas
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company is running a two-tier web-based application in an on-premises data center. The application layer consists of a single server running a stateful application. The application connects to a PostgreSQL database running on a separate server. The application's user base is expected to grow significantly, so the company is migrating the application and database to AWS. The solution will use Amazon Aurora PostgreSQL, Amazon EC2 Auto Scaling, and Elastic Load Balancing.

Which solution will provide a consistent user experience that will allow the application and database tiers to scale?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Aurora Auto Scaling for Aurora writers. Use a Network Load Balancer with the least outstanding requests routing algorithm and sticky sessions enabled.
- **(B)** Enable Aurora Auto Scaling for Aurora Replicas. Use an Application Load Balancer with the round robin routing algorithm and sticky sessions enabled. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Enable Aurora Auto Scaling for Aurora writers. Use an Application Load Balancer with the round robin routing algorithm and sticky sessions enabled.
- **(D)** Enable Aurora Auto Scaling for Aurora Replicas. Use a Network Load Balancer with the least outstanding requests routing algorithm and sticky sessions enabled.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - On-premises 2-tier app: application layer stateful, kết nối PostgreSQL database
> - Migrate sang AWS: Amazon Aurora PostgreSQL + EC2 Auto Scaling + Elastic Load Balancing
> - → Yêu cầu: consistent user experience, cho phép cả application và database tier scale

**Phân tích giải pháp tối ưu:**
Enable Aurora Auto Scaling for Aurora Replicas. Use an Application Load Balancer with the round robin routing algorithm and sticky sessions enabled.

Aurora Auto Scaling chỉ áp dụng cho Aurora Replicas (reader), Aurora không hỗ trợ auto scaling cho writer instance (chỉ có 1 writer trong cluster) - nên phải scale ở tầng Replicas để tăng khả năng đọc theo tải

Đề bài nhắc đến ứng dụng stateful, tức là các data như session sẽ được lưu bên trong EC2. Trong bài toán ALB và nhiều EC2, mỗi khi người dùng được ALB điều hướng random sang EC2 khác nhau thì sẽ phát sinh vấn đề mất session, do đó cần cơ chế để đảm bảo người dùng không bị điều hướng ngẫu nhiên.

Application Load Balancer hỗ trợ sticky sessions (session affinity qua cookie) native ở tầng application (Layer 7) - đúng nhu cầu ứng dụng stateful, đảm bảo user luôn được route về đúng EC2 trong session, đảm bảo trải nghiệm người dùng

ALB phù hợp hơn NLB cho HTTP/HTTPS web application cần cookie-based stickiness

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable Aurora Auto Scaling for Aurora Replicas. Use a Network Load Balancer with the least outstanding requests routing algorithm and sticky sessions enabled.**:
  "Least outstanding requests" là thuật toán routing của Application Load Balancer, không phải của Network Load Balancer (NLB hoạt động Layer 4, route theo flow hashing, không có khái niệm "outstanding requests" ở tầng application) - kết hợp sai giữa NLB và thuật toán ALB
  NLB không hỗ trợ cookie-based sticky sessions như ALB, không phù hợp cho ứng dụng web stateful

- **Enable Aurora Auto Scaling for Aurora writers. Use an Application Load Balancer with the round robin routing algorithm and sticky sessions enabled.**:
  Aurora không hỗ trợ auto scaling cho writer instance - writer là instance duy nhất xử lý ghi trong cluster, Aurora Auto Scaling chỉ thêm/bớt reader instance

- **Enable Aurora Auto Scaling for Aurora writers. Use a Network Load Balancer with the least outstanding requests routing algorithm and sticky sessions enabled.**:
  Sai cả 2 điểm: Aurora Auto Scaling không áp dụng cho writer, và NLB không có thuật toán "least outstanding requests"

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Stateful application" + "web-based/HTTP" → cần sticky sessions, ưu tiên Application Load Balancer (hỗ trợ cookie-based affinity native)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon Aurora Auto Scaling with Aurora Replicas](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Integrating.AutoScaling.html)
- 🌐 [Adding an auto scaling policy to an Amazon Aurora DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Integrating.AutoScaling.Add.html)
- 🌐 [Edit target group attributes for your Application Load Balancer (Sticky sessions)](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/edit-target-group-attributes.html)

</details>

---

<div id="question-20"></div>

### Question 20: An IAM policy that lists the full Amazon Resource Name (ARN) for each S3 bucket an...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A company runs an application as a task in an Amazon ECS cluster. The application must have read and write access to a specific group of Amazon S3 buckets. The S3 buckets are in the same AWS Region and AWS account as the ECS cluster. The company needs to grant the application access to the S3 buckets according to the principle of least privilege.

Which combination of solutions will meet these requirements? (Select TWO.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Attach the IAM policy to the instance role of the ECS task.
- **(B)** Create an IAM policy that lists the full Amazon Resource Name (ARN) for each S3 bucket. `[Đáp án đúng ✅]`
- **(C)** Create an IAM policy that includes a wildcard Amazon Resource Name (ARN) that matches all combinations of the S3 bucket names.
- **(D)** Add a tag to each bucket. Create an IAM policy that includes a StringEquals condition that matches the tags and values of the buckets.
- **(E)** Attach the IAM policy to the task role of the ECS task. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Application chạy như 1 task trong Amazon ECS cluster
> - Cần read/write access đến một nhóm S3 bucket cụ thể, cùng Region/account với ECS cluster
> - → Yêu cầu: cấp quyền theo nguyên tắc least privilege (Select TWO)

**Phân tích giải pháp tối ưu:**
Create an IAM policy that lists the full Amazon Resource Name (ARN) for each S3 bucket.

Liệt kê ARN cụ thể của từng bucket khi cấp quyền trong IAM Policy là đúng với nguyên tắc least privilege của AWS- chỉ cấp quyền đúng những resource cần thiết, không cấp thừa

Attach the IAM policy to the task role of the ECS task.

Task role (không phải instance role/execution role) là nơi chứa permission cho application code chạy trong container truy cập AWS service khác như S3

Gắn ở task role đảm bảo chỉ container của task đó có quyền, các task khác chạy trên cùng EC2 instance (nếu launch type EC2) không tự động có quyền này - đúng nguyên tắc separation of concerns/least privilege

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Add a tag to each bucket. Create an IAM policy that includes a StringEquals condition that matches the tags and values of the buckets.**:
  Cách này khả thi về mặt kỹ thuật (tag-based access control) nhưng phức tạp hơn không cần thiết so với liệt kê ARN trực tiếp khi chỉ có "a specific group of S3 buckets" đã biết trước - không phải lựa chọn tối ưu/đơn giản nhất cho yêu cầu đề bài
  Đề không đề cập đến việc bucket được gắn tag sẵn hay cần quản lý theo tag, nên đây không phải bước cần thiết

- **Attach the IAM policy to the instance role of the ECS task.**:
  Instance role dùng cho ECS agent bên trong EC2 chịu trách nhiệm như deploy task, v.v.., không dùng cho application bên trong container

- **Create an IAM policy that includes a wildcard Amazon Resource Name (ARN) that matches all combinations of the S3 bucket names.**:
  Dùng wildcard ARN cấp quyền rộng hơn mức cần thiết (có thể match cả các bucket ngoài "specific group" mong muốn) - vi phạm trực tiếp nguyên tắc least privilege

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "ECS task" + "application code cần gọi AWS service (S3, DynamoDB...)" → luôn gắn IAM policy vào task role, không phải instance role
- "Least privilege" + "specific group of resources đã biết" → liệt kê ARN cụ thể, loại ngay wildcard ARN
- Instance role (container instance role) chỉ dùng cho ECS agent quản lý EC2 host, không phải nơi cấp quyền cho application logic

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon ECS task IAM role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)
- 🌐 [Best practices for IAM roles in Amazon ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/security-iam-roles.html)

</details>

---

<div id="question-21"></div>

### Question 21: An Amazon EventBridge event bus to route messages between the microservices
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs an application that consists of multiple microservices. The company mandates that the microservices use messages to communicate with each other. The application must archive the microservices' messages for 30 days.

Which solution will meet these requirements with the LEAST amount of development effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use a single Amazon SNS topic to distribute the messages. Subscribe each microservice to the topic. Use message filtering to ensure that each microservice receives only messages that are relevant to each microservice. Use an Amazon SQS queue to store the messages for 30 days.
- **(B)** Use an Amazon EventBridge event bus to route messages between the microservices. Use message filtering to ensure that each microservice receives only messages that are relevant to each microservice. Create an archive in Amazon EventBridge to store the messages for 30 days. `[Đáp án đúng ✅]`
- **(C)** Use a single Amazon SNS topic to distribute the messages. Subscribe each microservice to the topic. Use message filtering to ensure that each microservice receives only messages that are relevant to each microservice. Store messages in an Amazon S3 bucket for 30 days.
- **(D)** Create a private Amazon API Gateway HTTP API for the microservices to send messages. Use an AWS Lambda function to forward the messages to the appropriate microservices based on query parameters. Archive messages in Amazon S3 for 30 days.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Nhiều microservices giao tiếp với nhau bằng messages
> - Yêu cầu archive (lưu trữ) messages trong 30 ngày
> - → Yêu cầu: giải pháp LEAST amount of development effort

**Phân tích giải pháp tối ưu:**
Use an Amazon EventBridge event bus to route messages between the microservices. Use message filtering to ensure that each microservice receives only messages that are relevant to each microservice. Create an archive in Amazon EventBridge to store the messages for 30 days.

EventBridge là service event bus serverless có khả năng bắn message đến nhiều destination khác nhau

Có tính năng Archive (native) cho phép lưu trữ lại message, chỉ cần bật và đặt retention period = 30 ngày

Message filtering để route đúng microservice là tính năng có sẵn của event pattern trên EventBridge, không cần logic tuỳ biến

Kết hợp routing + filtering + archive đều nằm trong 1 service duy nhất → ít effort phát triển nhất

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use a single Amazon SNS topic to distribute the messages. Subscribe each microservice to the topic. Use message filtering to ensure that each microservice receives only messages that are relevant to each microservice. Use an Amazon SQS queue to store the messages for 30 days.**:
  SQS có message retention period tối đa 14 ngày, không thể lưu message 30 ngày → không đáp ứng được yêu cầu, loại ngay về mặt kỹ thuật

- **(C) Use a single Amazon SNS topic to distribute the messages. Subscribe each microservice to the topic. Use message filtering to ensure that each microservice receives only messages that are relevant to each microservice. Store messages in an Amazon S3 bucket for 30 days.**:
  SNS không có tính năng archive trực tiếp vào S3 - cần thêm một subscriber riêng (Lambda hoặc Firehose) để ghi message vào S3 → tốn thêm development effort so với Archive built-in của EventBridge

- **Create a private Amazon API Gateway HTTP API for the microservices to send messages. Use an AWS Lambda function to forward the messages to the appropriate microservices based on query parameters. Archive messages in Amazon S3 for 30 days.**:
  Phải tự viết Lambda để routing message dựa trên query parameters và tự viết logic ghi vào S3 → effort phát triển cao nhất trong 4 đáp án, không phù hợp "LEAST development effort"

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Archive messages for X days" + "least development effort" → Amazon EventBridge Archive (tính năng built-in, không cần code)
- "SQS retention" → tối đa 14 ngày; nếu đề yêu cầu lưu trữ trên 14 ngày bằng SQS → loại ngay
- Nếu đề yêu cầu route message theo nội dung (content-based routing) giữa nhiều microservices → EventBridge event pattern filtering tốt hơn SNS filter policy khi cần thêm khả năng archive/replay có sẵn
- "Custom Lambda routing logic" luôn tốn effort hơn tính năng managed có sẵn của service

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Archiving and replaying events in Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-archive.html)
- 🌐 [Creating event archives in Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-archive-event.html)

</details>

---

<div id="question-22"></div>

### Question 22: S3 Versioning on the bucket
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A financial services company must keep log data for 1 year. The company stores log files in an Amazon S3 bucket. The company wants to prevent any user from deleting or overwriting the log files for 1 year. The data must be available for read-only requests.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable S3 Transfer Acceleration on the bucket. Create an S3 Lifecycle Configuration rule to move objects to Amazon S3 Glacier Flexible Retrieval after 1 year.
- **(B)** Enable S3 Versioning on the bucket. Use Object Lock in compliance mode with a 1-year retention period. `[Đáp án đúng ✅]`
- **(C)** Create an AWS Lambda function to programmatically check the timestamp of S3 data and to move the data to Amazon S3 Glacier Deep Archive if the data is older than 1 year.
- **(D)** Enable S3 Versioning on the bucket. Create an S3 Lifecycle Configuration rule to move objects to Amazon S3 Glacier Flexible Retrieval after 1 year.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty tài chính phải giữ log data 1 năm
> - Log files lưu trong S3 bucket
> - Ngăn mọi user xoá hoặc ghi đè (prevent any user from deleting or overwriting) log files trong 1 năm
> - Data vẫn phải đọc được (available for read-only requests)
> - → Yêu cầu: bất biến dữ liệu (immutability) đúng 1 năm, nhưng vẫn đọc được

**Phân tích giải pháp tối ưu:**
Enable S3 Versioning on the bucket. Use Object Lock in compliance mode with a 1-year retention period.

Object Lock là cơ chế của S3 cho phép khoá file trong một khoảng thời gian nhất định

yêu cầu Versioning phải bật trước → đúng bước đầu

Compliance mode: không ai có thể xoá hoặc ghi đè object trong thời gian lưu trữ, kể cả root user của tài khoản

Đặt retention period = 1 năm khớp chính xác thời hạn đề yêu cầu

Object vẫn có thể đọc (GET) bình thường trong suốt thời gian lưu trữ

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable S3 Transfer Acceleration on the bucket. Create an S3 Lifecycle Configuration rule to move objects to Amazon S3 Glacier Flexible Retrieval after 1 year.**:
  Transfer Acceleration chỉ tăng tốc độ upload/download qua CloudFront edge, không liên quan đến ngăn xoá/ghi đè
  Lifecycle rule di chuyển storage class sau 1 năm, không ngăn user xoá/ghi đè object trong 1 năm đó

- **Enable S3 Versioning on the bucket. Create an S3 Lifecycle Configuration rule to move objects to Amazon S3 Glacier Flexible Retrieval after 1 year.**:
  Versioning một mình không ngăn user xoá vĩnh viễn version cũ (vẫn có thể xoá version cụ thể qua permission)
  Lifecycle rule chỉ đổi storage class, không phải cơ chế bảo vệ chống xoá/ghi đè

- **Create an AWS Lambda function to programmatically check the timestamp of S3 data and to move the data to Amazon S3 Glacier Deep Archive if the data is older than 1 year.**:
  Đây là giải pháp tự viết code phức tạp, không đảm bảo tuyệt đối chống xoá/ghi đè (Lambda có thể lỗi, bị xoá quyền, không phải cơ chế WORM ở tầng S3)
  Không đáp ứng "prevent any user from deleting" một cách chắc chắn (native), phụ thuộc logic tự viết

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Prevent any user (including root) from deleting/overwriting" trong khoảng thời gian cố định → S3 Object Lock Compliance mode + retention period
- "Lifecycle rule di chuyển storage class" không phải là giải pháp cho yêu cầu chống xoá/ghi đè - chỉ tối ưu chi phí lưu trữ

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Locking objects with Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html)
- 🌐 [S3 Object Lock (compliance mode vs governance mode)](https://aws.amazon.com/s3/features/object-lock/)

</details>

---

<div id="question-23"></div>

### Question 23: The data in an Amazon S3 Glacier storage class and an AWS KMS key without key mate...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
A company stores petabytes of historical medical information on premises. The company has a process to manage encryption of the data to comply with regulations.

The company needs a cloud-based solution for data backup, recovery, and archiving. The company must retain control over the encryption key material.

Which combination of solutions will meet these requirements? (Select TWO.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Store the data in AWS Snowball devices. Use server-side encryption with AWS KMS keys (SSE-KMS).
- **(B)** Create an AWS KMS encryption key that contains key material generated by AWS KMS.
- **(C)** Store the data in Amazon S3 Standard-Infrequent Access (S3 Standard-IA) storage. Use S3 Bucket Keys with AWS KMS keys.
- **(D)** Store the data in an Amazon S3 Glacier storage class. Use server-side encryption with customer-provided keys (SSE-C). `[Đáp án đúng ✅]`
- **(E)** Create an AWS KMS key without key material. Import the company's key material into the KMS key. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Lưu trữ petabytes dữ liệu y tế lịch sử (historical medical information) đang ở on-premises
> - Đã có quy trình quản lý encryption riêng để tuân thủ quy định (compliance)
> - Cần giải pháp cloud cho backup, recovery, và archiving
> - Công ty phải giữ toàn quyền kiểm soát encryption key material (retain control over the encryption key material)
> - → Yêu cầu: chọn 2 giải pháp kết hợp vừa lưu trữ/archive dữ liệu, vừa đảm bảo khách hàng tự kiểm soát key material (không để AWS tự sinh và giữ key)

**Phân tích giải pháp tối ưu:**
Create an AWS KMS key without key material. Import the company's key material into the KMS key.

Đây là kỹ thuật BYOK (Bring Your Own Key): tạo KMS key với origin EXTERNAL (không có key material), sau đó import chính key material của công ty vào

Công ty giữ bản sao duy nhất (failsafe copy) của key material gốc, tự quyết định thời điểm xoá/reimport → đúng nghĩa "retain control over the encryption key material"

Store the data in an Amazon S3 Glacier storage class. Use server-side encryption with customer-provided keys (SSE-C).

S3 Glacier storage class phù hợp cho archiving petabyte dữ liệu lịch sử với chi phí thấp, đáp ứng "backup, recovery, and archiving"

SSE-C: công ty tự cung cấp và giữ khoá mã hoá cho từng request, AWS không lưu trữ khoá này (khoá bị xoá khỏi bộ nhớ sau khi mã hoá xong) → mức độ kiểm soát key material cao nhất, đúng yêu cầu đề bài

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS KMS encryption key that contains key material generated by AWS KMS.**:
  Key material do AWS KMS tự sinh → công ty không có bản sao key material, không thể "retain control over the encryption key material", ngược với yêu cầu đề bài

- **(C) Store the data in Amazon S3 Standard-Infrequent Access (S3 Standard-IA) storage. Use S3 Bucket Keys with AWS KMS keys.**:
  S3 Standard-IA không phù hợp cho archiving petabyte dữ liệu lịch sử dài hạn bằng S3 Glacier (chi phí lưu trữ cao hơn đáng kể cho dữ liệu ít truy cập, lâu dài)
  S3 Bucket Keys chỉ giảm chi phí gọi API tới KMS, không tự nó giải quyết yêu cầu kiểm soát key material

- **(A) Store the data in AWS Snowball devices. Use server-side encryption with AWS KMS keys (SSE-KMS).**:
  Snowball là dịch vụ vận chuyển dữ liệu (data transfer/migration), không phải giải pháp lưu trữ data
  SSE-KMS dùng key do AWS KMS quản lý (trừ khi rõ ràng là key đã import BYOK) - đáp án này không nêu rõ dùng key imported, nên không đảm bảo chắc chắn công ty giữ quyền kiểm soát key material

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Retain control over the encryption key material" / "self-manage key material" → KMS key với imported key material (BYOK) hoặc SSE-C (khách hàng tự cung cấp khoá)
- "Archiving petabytes of historical/cold data" → ưu tiên S3 Glacier storage class thay vì S3 Standard-IA

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Importing key material for AWS KMS keys (BYOK)](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-conceptual.html)
- 🌐 [Using server-side encryption with customer-provided keys (SSE-C)](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html)
- 🌐 [Securing Amazon S3 Glacier with a customer-managed encryption key](https://aws.amazon.com/blogs/publicsector/securing-amazon-s3-glacier-customer-managed-encryption-key/)

</details>

---

<div id="question-24"></div>

### Question 24: AWS IAM Identity Center in the organization management account and permission sets...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (B), (C)

#### 📋 Đề bài (Scenario)
A company uses an organization in AWS Organizations to manage a multi-account landing zone. The company requires all users who access AWS accounts in the organization to use a centralized identity system that follows the principle of least privilege for operational tasks. The company currently uses an external identity provider (IdP).

Which combination of solutions will meet these requirements? (Select TWO.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use IAM to create IAM users and IAM user groups in each AWS account.
- **(B)** Enable AWS IAM Identity Center in the organization management account. Create user accounts and user groups. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create permission sets in AWS IAM Identity Center. Assign the appropriate permission sets to the IAM users and IAM user groups in the accounts. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Assign each IAM user to an IAM role by using an inline IAM policy based on operational duties. Assign each role to the appropriate AWS account in the organization.
- **(E)** Configure a SAML identity provider in IAM in each AWS account to establish a trust relationship with the company's external IdP.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Dùng AWS Organizations để quản lý multi-account landing zone
> - Yêu cầu mọi user truy cập các account phải dùng hệ thống quản lý identity tập trung (centralized identity system)
> - Áp dụng nguyên tắc least privilege cho các tác vụ vận hành
> - Công ty hiện đã có external identity provider (IdP)
> - → Yêu cầu: chọn 2 giải pháp thiết lập identity tập trung, least privilege, tích hợp được IdP ngoài, cho môi trường multi-account

**Phân tích giải pháp tối ưu:**
Enable AWS IAM Identity Center in the organization management account. Create user accounts and user groups.

IAM Identity Center là dịch vụ được AWS khuyến nghị để quản lý identity tập trung cho multi-account trong AWS Organizations

Tích hợp trực tiếp với AWS Organizations, cấu hình 1 lần ở management account rồi áp dụng cho toàn bộ account trong tổ chức

Có thể kết nối với external IdP của công ty làm identity source (qua SAML 2.0/SCIM) thay vì tạo user riêng lẻ trong từng account

Create permission sets in AWS IAM Identity Center. Assign the appropriate permission sets to the IAM users and IAM user groups in the accounts.

Permission sets là tập hợp IAM policy được định nghĩa 1 lần, gán cho user/group theo từng account cụ thể → đúng cơ chế least privilege cho từng tác vụ vận hành

Khi gán permission set, IAM Identity Center tự tạo IAM role tương ứng trong account đích, không cần quản lý IAM user/role thủ công ở từng account

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use IAM to create IAM users and IAM user groups in each AWS account.**:
  Tạo IAM user riêng lẻ ở từng account hoàn toàn trái với yêu cầu "centralized identity system" quản lý tập trung, ví dụ 1 người cần truy cập 10 account thì phải tạo 10 IAM user cho chỉ riêng người đó, sau này rất khó quản lý vòng đời user khi có thay đổi nhân sự

- **Assign each IAM user to an IAM role by using an inline IAM policy based on operational duties. Assign each role to the appropriate AWS account in the organization.**:
  Vẫn dựa trên IAM user riêng lẻ từng account, không phải hệ thống identity tập trung
  Dùng inline policy thủ công theo từng role là anti-pattern về vận hành so với permission set quản lý tập trung, khó maintain ở quy mô nhiều account

- **Configure a SAML identity provider in IAM in each AWS account to establish a trust relationship with the company's external IdP.**:
  Đây là cách federation truyền thống, cấu hình lặp lại ở từng account riêng lẻ → không tập trung, tốn nhiều công sức vận hành khi số lượng account tăng
  IAM Identity Center giải quyết đúng vấn đề này bằng cách cấu hình external IdP 1 lần duy nhất ở management account rồi áp dụng cho toàn bộ organization

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Centralized identity" + "multi-account AWS Organizations" → AWS IAM Identity Center (không phải tạo IAM user/SAML provider riêng lẻ từng account)
- "Least privilege cho từng account/task" trong IAM Identity Center → Permission sets, không phải inline policy gán trực tiếp IAM role
- "IAM users tạo riêng ở từng account" luôn là dấu hiệu loại trừ khi đề yêu cầu identity tập trung

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Rely on a centralized identity provider](https://docs.aws.amazon.com/wellarchitected/latest/framework/sec_identities_identity_provider.html)
- 🌐 [Manage AWS accounts with permission sets](https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html)
- 🌐 [AWS IAM Identity Center Features](https://aws.amazon.com/iam/identity-center/features/)

</details>

---

<div id="question-25"></div>

### Question 25: Implement DynamoDB Accelerator (DAX)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An ecommerce company hosts a three-tier web application in a VPC. The web tier runs on Amazon EC2 instances in two Availability Zones. The company stores a product catalog and customer sales information in Amazon DynamoDB.

The company's finance team uses a reporting application to generate reports of daily product sales. When the finance team runs the daily reports, a sudden performance decrease affects website customers.

The company wants to improve the performance of the system.

Which solution will meet these requirements with MINIMAL changes to the current architecture?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Migrate the application to larger EC2 Instances. Migrate the database to Amazon RDS for MySQL. Configure a read replica of the database in a second Availability Zone.
- **(B)** Increase the compute capacity of the EC2 instances. Migrate the database to Amazon ElastiCache (Memcached).
- **(C)** Implement DynamoDB Accelerator (DAX). `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Configure DynamoDB streams.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web tier EC2 chạy trong 2 Availability Zones, dữ liệu lưu ở DynamoDB
> - Finance team chạy reporting application để tạo báo cáo daily sales
> - Khi finance chạy report → hiệu năng giảm đột ngột, ảnh hưởng đến khách hàng trên website
> - → Yêu cầu: cải thiện performance với MINIMAL changes so với kiến trúc hiện tại

**Phân tích giải pháp tối ưu:**
Implement DynamoDB Accelerator (DAX).

DAX là in-memory cache tương thích API với DynamoDB, giảm tải đọc data (read) từ report xuống còn microseconds, không ảnh hưởng đến performance DynamoDB table gốc mà website đang dùng

Vì API-compatible với DynamoDB, chỉ cần thay đổi tối thiểu ở tầng ứng dụng (endpoint), không cần sửa logic code hay migrate dữ liệu → đúng "MINIMAL changes"

Giải quyết đúng nguyên nhân gốc: reporting query đọc nhiều (read-heavy) gây tranh chấp read capacity với traffic của website

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Migrate the application to larger EC2 Instances. Migrate the database to Amazon RDS for MySQL. Configure a read replica of the database in a second Availability Zone.**:
  Migrate toàn bộ database từ DynamoDB sang RDS for MySQL là thay đổi kiến trúc rất lớn (data model, code truy vấn, vận hành...), hoàn toàn trái với yêu cầu "MINIMAL changes"

- **(B) Increase the compute capacity of the EC2 instances. Migrate the database to Amazon ElastiCache (Memcached).**:
  Tăng compute EC2 không giải quyết nguyên nhân gốc (nghẽn ở tầng đọc DynamoDB, không phải compute của web tier)
  Migrate toàn bộ dữ liệu sang ElastiCache Memcached là thay đổi kiến trúc lớn không cần thiết

- **Configure DynamoDB streams.**:
  DynamoDB Streams dùng để capture thay đổi dữ liệu (change data capture) cho các consumer khác (Lambda trigger, replication...), không phải giải pháp cache giảm tải đọc cho reporting query → không giải quyết vấn đề hiệu năng nêu trong đề

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Sudden read spike from reporting/analytics query" + "DynamoDB" + "minimal changes" → DynamoDB Accelerator (DAX)
- "Migrate sang database khác" (RDS, ElastiCache thay thế hoàn toàn) luôn mâu thuẫn với yêu cầu "minimal changes" - loại ngay các đáp án này khi thấy từ khoá đó

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [In-memory acceleration with DynamoDB Accelerator (DAX)](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.html)
- 🌐 [Caching Service for Amazon DynamoDB](https://aws.amazon.com/dynamodbaccelerator/)

</details>

---

<div id="question-26"></div>

### Question 26: Amazon EMR with an instance fleet configuration
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company wants to run transient workloads in an Amazon EMR cluster that runs on Amazon EC2 instances. The company wants to use memory optimized EC2 instances to launch EMR clusters in the AWS Region where the company operates. The company wants to use On-Demand Instances for core nodes and Spot Instances for task nodes.

The company has configured multiple subnets in multiple Availability Zones. The company must ensure that the EMR clusters are launched only in Availability Zones where specified instance types and purchasing options are available.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon EMR with an instance fleet configuration. Launch the EMR clusters into multiple subnets that are associated with multiple Availability Zones.
- **(B)** Deploy Amazon EMR with an instance group configuration. Launch the EMR clusters into a single subnet. Configure Amazon EMR to determine whether an Availability Zone has the necessary capacity when an EMR cluster is launched.
- **(C)** Deploy Amazon EMR with an instance fleet configuration. Launch the EMR clusters into a single subnet. Configure Amazon EMR to determine whether an Availability Zone has the necessary capacity when an EMR cluster is launched. `[Đáp án đúng ✅]`
- **(D)** Deploy Amazon EMR with an instance group configuration. Launch the EMR clusters into multiple subnets that are associated with multiple Availability Zones.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Chạy transient workloads trên Amazon EMR (EC2-based), dùng memory optimized instances
> - On-Demand cho core nodes, Spot Instances cho task nodes
> - Đã cấu hình nhiều subnet ở nhiều Availability Zones
> - Yêu cầu: cluster chỉ launch ở AZ có sẵn đúng instance type + purchasing option cần thiết
> - → Yêu cầu: giải pháp với MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Deploy Amazon EMR with an instance fleet configuration. Launch the EMR clusters into multiple subnets that are associated with multiple Availability Zones.

Instance fleet cho phép chỉ định nhiều subnet ở nhiều AZ; EMR tự động chọn AZ có đủ capacity phù hợp với instance type và purchasing option (On-Demand/Spot) khi launch cluster

AWS khuyến nghị instance fleet hơn instance group vì khả năng chịu lỗi tốt hơn khi thiếu capacity ở 1 AZ - đúng với "MOST operational efficiency" vì không cần tự viết logic kiểm tra capacity

Đây chính là cơ chế được thiết kế sẵn cho use case "chọn AZ tự động dựa trên khả dụng của instance type/purchasing option"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon EMR with an instance group configuration. Launch the EMR clusters into multiple subnets that are associated with multiple Availability Zones.**:
  Instance group configuration KHÔNG hỗ trợ đa subnet để EMR tự chọn AZ tối ưu - chỉ launch cố định vào 1 subnet đã chỉ định, không tận dụng được nhiều AZ để tìm capacity phù hợp

- **Deploy Amazon EMR with an instance group configuration. Launch the EMR clusters into a single subnet. Configure Amazon EMR to determine whether an Availability Zone has the necessary capacity when an EMR cluster is launched.**:
  Instance group với 1 subnet duy nhất thì không có nhiều AZ để lựa chọn - mâu thuẫn với yêu cầu đảm bảo capacity đúng loại instance/purchasing option qua nhiều AZ đã cấu hình sẵn

- **Deploy Amazon EMR with an instance fleet configuration. Launch the EMR clusters into a single subnet. Configure Amazon EMR to determine whether an Availability Zone has the necessary capacity when an EMR cluster is launched.**:
  Dùng instance fleet nhưng chỉ launch vào 1 subnet thì mất đi lợi ích chính của fleet là chọn AZ tối ưu trong số nhiều subnet đã cấu hình - không tận dụng hết các subnet multi-AZ công ty đã có sẵn

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "EMR" + "multiple subnets/AZs" + "tự động chọn AZ theo capacity" → Instance fleet configuration (không phải instance group)
- Instance group = launch cố định 1 subnet/AZ; Instance fleet = launch linh hoạt qua nhiều subnet, EMR tự chọn AZ phù hợp
- Nếu đề có "multiple subnets configured" nhưng đáp án chỉ launch vào "single subnet" → loại ngay, không tận dụng hết tài nguyên đã chuẩn bị
- "MOST operational efficiency" cho EMR đa AZ/đa purchasing option → luôn ưu tiên instance fleet hơn instance group

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Planning and configuring instance fleets for your Amazon EMR cluster](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-instance-fleet.html)
- 🌐 [Run high-availability long-running clusters with Amazon EMR instance fleets](https://aws.amazon.com/blogs/big-data/run-high-availability-long-running-clusters-with-amazon-emr-instance-fleets/)

</details>

---

<div id="question-27"></div>

### Question 27: AWS Lake Formation to provide the specified IAM roles access to the PII data
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company uses Amazon S3 to store customer data that contains personally identifiable information (PII) attributes. The company needs to make the customer information available to company resources through an AWS Glue Catalog.

The company needs to have fine-grained access control for the data so that only specific IAM roles can access the PII data.

Which solution will meet these requirements with the MOST operational efficiency?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Glue to create one view for PII data. Create a second view for non-PII data. Provide the specified IAM roles access to the PII view.
- **(B)** Use AWS Lake Formation to provide the specified IAM roles access to the PII data. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create one IAM role that grants access to PII. Create a second IAM role that grants access to non-PII data. Assign the PII policy to the specified IAM roles.
- **(D)** Create one IAM policy that grants access to PII. Create a second IAM policy that grants access to non-PII data. Assign the PII policy to the specified IAM roles.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Dữ liệu khách hàng chứa PII (personally identifiable information) - thông tin cá nhân lưu trong S3
> - Cần cho company resources truy cập dữ liệu qua AWS Glue Data Catalog
> - Yêu cầu fine-grained access control: chỉ những IAM role cụ thể được truy cập dữ liệu PII
> - → Yêu cầu: giải pháp với MOST operational efficiency

**Phân tích giải pháp tối ưu:**
Use AWS Lake Formation to provide the specified IAM roles access to the PII data.

Lake Formation cung cấp fine-grained access control ở cấp column-level, row-level, cell-level trực tiếp trên Data Catalog và S3 - đúng nghĩa "fine-grained" mà đề yêu cầu (ví dụ: ẩn một số cột PII cho role không được phép)

Quản lý permission tập trung tại 1 nơi (Lake Formation permissions model), thay vì phải duy trì nhiều policy/role/view riêng lẻ → operational efficiency cao nhất

Đây là dịch vụ được AWS thiết kế chuyên biệt cho đúng bài toán "fine-grained access control - kiểm soát truy cập chi tiết trên Glue Data Catalog"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create one IAM policy that grants access to PII. Create a second IAM policy that grants access to non-PII data. Assign the PII policy to the specified IAM roles.**:
  IAM policy chỉ kiểm soát ở mức API/resource (ví dụ toàn bộ bucket/table), không kiểm soát được ở mức column/cell bên trong 1 table như PII attributes yêu cầu → không đạt "fine-grained" thực sự
  Duy trì nhiều IAM policy song song cho từng loại dữ liệu tốn nhiều công sức vận hành hơn Lake Formation

- **Create one IAM role that grants access to PII. Create a second IAM role that grants access to non-PII data. Assign the PII policy to the specified IAM roles.**:
  Tương tự trên: IAM role/policy không có khả năng lọc theo cột dữ liệu cụ thể trong 1 table của Glue Catalog, chỉ kiểm soát ở mức resource-level
  Đáp án còn có mâu thuẫn logic (tạo IAM role nhưng "assign the PII policy") cho thấy giải pháp thiếu chặt chẽ

- **(A) Use AWS Glue to create one view for PII data. Create a second view for non-PII data. Provide the specified IAM roles access to the PII view.**:
  Phải tự tạo và duy trì nhiều view thủ công cho từng nhóm dữ liệu, tốn operational effort hơn nhiều so với dùng data filter có sẵn của Lake Formation
  Khi schema thay đổi phải cập nhật lại từng view thủ công → kém hiệu quả vận hành hơn

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Fine-grained access control" + "Glue Data Catalog" / "column-level PII" → AWS Lake Formation (không phải IAM policy thuần hoặc tự tạo view)
- IAM policy/role chỉ kiểm soát ở resource-level (toàn bộ bucket/table), không kiểm soát được ở column/row/cell-level bên trong table

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Data filtering and cell-level security in Lake Formation](https://docs.aws.amazon.com/lake-formation/latest/dg/data-filtering.html)
- 🌐 [Methods for fine-grained access control](https://docs.aws.amazon.com/lake-formation/latest/dg/access-control-fine-grained.html)

</details>

---

<div id="question-28"></div>

### Question 28: The visualization tool in the same AWS Region as the data warehouse
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company recently migrated a data warehouse to AWS. The company has an AWS Direct Connect connection to AWS.

Company users query the data warehouse by using a visualization tool. The average size of the queries that the data warehouse returns is 50 MB. The average visualization that the visualization tool produces is 500 KB in size. The result sets that the data warehouse returns are not cached.

The company wants to optimize costs for data transfers between the data warehouse and the company.

Which solution will meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Host the visualization tool on premises. Connect to the data warehouse through the Direct Connect connection.
- **(B)** Host the visualization tool in the same AWS Region as the data warehouse. Access the visualization tool through the Direct Connect connection.
- **(C)** Host the visualization tool in the same AWS Region as the data warehouse. Access the visualization tool through the internet. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Host the visualization tool on premises. Connect to the data warehouse directly through the internet.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Data warehouse đã migrate lên AWS, có sẵn AWS Direct Connect connection
> - Users dùng visualization tool để query data warehouse
> - Kích thước trung bình: query result trả về từ warehouse = 50 MB, output trả về từ visualization tool = 500 KB (nhỏ hơn nhiều)
> - Result set không được cache
> - → Yêu cầu: optimize chi phí data transfer giữa data warehouse và công ty

**Phân tích giải pháp tối ưu:**
Host the visualization tool in the same AWS Region as the data warehouse. Access the visualization tool through the Direct Connect connection.

Đặt visualization tool cùng Region với data warehouse → phần 50 MB query result chỉ di chuyển nội bộ bên trong AWS (giữa data warehouse và visualization tool), không phải trả phí data transfer ra ngoài cho phần lớn nhất của traffic

Chỉ có 500 KB visualization output (nhỏ hơn 100 lần so với 50 MB) mới thực sự truyền qua Direct Connect về công ty → tối thiểu hoá lượng data transfer phải trả

Direct Connect có đơn giá data transfer ra ngoài thấp hơn internet, dùng cho phần traffic còn lại càng tối ưu chi phí hơn so với đi qua internet

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Host the visualization tool on premises. Connect to the data warehouse directly through the internet.**:
  Toàn bộ 50 MB query result phải truyền qua internet cho mỗi truy vấn → chi phí data transfer cao nhất và không tận dụng Direct Connect đã có sẵn

- **Host the visualization tool in the same AWS Region as the data warehouse. Access the visualization tool through the internet.**:
  Vẫn giữ được ưu điểm khi 50 MB xử lý nội bộ AWS, nhưng phần 500 KB visualization lại đi qua internet thay vì Direct Connect → đơn giá data transfer qua internet thường cao hơn Direct Connect, không tối ưu chi phí bằng đáp án đúng

- **Host the visualization tool on premises. Connect to the data warehouse through the Direct Connect connection.**:
  Visualization tool đặt on premises khiến toàn bộ 50 MB query result (phần lớn traffic) phải truyền qua Direct Connect cho mỗi query → dù rẻ hơn internet nhưng vẫn tốn phí nhiều hơn hẳn so với việc giữ 50 MB đó ở lại trong AWS

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Optimize data transfer cost" + "phần lớn traffic không cần thiết ra khỏi AWS" → đặt xử lý/tool gần nguồn dữ liệu (same Region) để giảm lượng data transfer ra ngoài
- Khi so sánh 2 kích thước dữ liệu (VD: 50 MB raw vs 500 KB rendered) → luôn chọn kiến trúc giữ khối lượng lớn hơn ở lại nội bộ AWS, chỉ để phần nhỏ đi ra ngoài
- "Có sẵn Direct Connect connection" + cần truyền dữ liệu ra ngoài AWS → ưu tiên dùng Direct Connect thay vì internet (đơn giá thấp hơn), miễn là đã tối ưu được khối lượng truyền trước

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Hybrid connectivity - Cost](https://docs.aws.amazon.com/whitepapers/latest/hybrid-connectivity/cost.html)
- 🌐 [AWS Network Optimization Tips (Optimizing data transfer out costs)](https://aws.amazon.com/blogs/networking-and-content-delivery/aws-network-optimization-tips/)

</details>

---

<div id="question-29"></div>

### Question 29: The DB instance to use a Multi-AZ DB instance deployment
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs a critical Amazon RDS for MySQL DB instance in a single Availability Zone.

The company must improve the availability of the DB instance.

Which solution will meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the DB instance to use a Multi-AZ DB instance deployment. `[Đáp án đúng ✅]`
- **(B)** Create an Amazon SQS queue in a different AWS Region than the Region where the company hosts the DB instance to manage writes to the DB instance.
- **(C)** Configure the DB instance to use a multi-Region DB instance deployment.
- **(D)** Create an Amazon SQS queue in the AWS Region where the company hosts the DB instance to manage writes to the DB instance.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - RDS for MySQL đang chạy trong 1 Availability Zone duy nhất (single-AZ)
> - → Yêu cầu: cải thiện availability của DB instance

**Phân tích giải pháp tối ưu:**
Configure the DB instance to use a Multi-AZ DB instance deployment.

Multi-AZ DB instance deployment là tính năng native của RDS dành riêng cho mục tiêu cải thiện availability, chỉ cần bật, không cần thay đổi kiến trúc ứng dụng

Khi primary gặp sự cố hoặc AZ bị gián đoạn, RDS tự động failover sang standby, giảm downtime đáng kể

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the DB instance to use a multi-Region DB instance deployment.**:
  RDS không có khái niệm "multi-Region DB instance deployment" theo cách native/tự động failover như Multi-AZ - đây là đáp án không tồn tại đúng theo kiến trúc RDS tiêu chuẩn (cross-Region cho RDS thường dùng read replica, không phải 1 deployment failover tự động)

- **Create an Amazon SQS queue in the AWS Region where the company hosts the DB instance to manage writes to the DB instance.**:
  SQS là dịch vụ message queue, không phải giải pháp cải thiện availability của DB instance - dùng SQS để "quản lý writes" không giải quyết vấn đề DB chỉ chạy ở 1 AZ, hoàn toàn sai mục đích

- **Create an Amazon SQS queue in a different AWS Region than the Region where the company hosts the DB instance to manage writes to the DB instance.**:
  Tương tự trên, thêm SQS ở Region khác cũng không cải thiện availability của DB instance - vẫn sai mục đích

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Single-AZ RDS" + "improve availability" → Multi-AZ DB instance deployment (luôn luôn là đáp án đúng cho câu hỏi kiểu này)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Multi-AZ DB instance deployments for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZSingleStandby.html)
- 🌐 [Achieve high availability with Amazon RDS Multi-AZ deployments](https://aws.amazon.com/rds/features/)

</details>

---

<div id="question-30"></div>

### Question 30: The application on EC2 instances in an Auto Scaling group behind an internet-facin...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company runs a website on Amazon EC2 instances. Clients use the HTTP protocol to connect to the application. The company does not want the EC2 instances to have internet access. However, the application should remain available through the internet. The application must scale in response to traffic demands.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Application Load Balancer (ALB). Launch the EC2 instances in private subnets that do not have internet access.
- **(B)** Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Network Load Balancer (NLB). Launch the EC2 instances in private subnets that do not have internet access.
- **(C)** Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Network Load Balancer (NLB). Launch the EC2 instances in public subnets that use an internet gateway. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Application Load Balancer (ALB). Launch the EC2 instances in public subnets that use an internet gateway.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website chạy trên EC2, client dùng HTTP protocol
> - Công ty không muốn EC2 instances có internet access
> - Nhưng ứng dụng vẫn phải available qua internet (khách hàng truy cập được)
> - Ứng dụng phải scale theo traffic demand
> - → Yêu cầu: kiến trúc public-facing, scalable, nhưng EC2 không có internet access

**Phân tích giải pháp tối ưu:**
Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Application Load Balancer (ALB). Launch the EC2 instances in private subnets that do not have internet access.

ALB hoạt động ở Layer 7, dùng cho traffic HTTP/HTTPS → đáp ứng yêu cầu "Clients use the HTTP protocol"

Internet-facing ALB đặt ở public subnet nhận traffic từ internet, sau đó forward traffic tới EC2 targets ở private subnet - EC2 không cần route ra internet (không cần NAT Gateway/Internet Gateway) mà vẫn nhận được traffic từ client qua ALB

Auto Scaling group đảm bảo việc scale theo traffic demand

EC2 trong private subnet không có internet access nhưng vẫn "available through the internet" - tức là có thể truy cập từ internet vào thông qua ALB

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Network Load Balancer (NLB). Launch the EC2 instances in public subnets that use an internet gateway.**:
  EC2 đặt ở public subnet với internet gateway → có khả năng có internet access, vi phạm yêu cầu "EC2 instances không có internet access"
  NLB hoạt động ở Layer 4 (giao thức TCP/UDP/TLS), không dùng cho traffic HTTP

- **Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Network Load Balancer (NLB). Launch the EC2 instances in private subnets that do not have internet access.**:
  NLB hoạt động ở Layer 4 (giao thức TCP/UDP/TLS), không dùng cho traffic HTTP

- **Host the application on EC2 instances in an Auto Scaling group behind an internet-facing Application Load Balancer (ALB). Launch the EC2 instances in public subnets that use an internet gateway.**:
  EC2 đặt ở public subnet với internet gateway → vi phạm yêu cầu "EC2 instances không có internet access"

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Clients use HTTP/HTTPS" → Application Load Balancer (ALB), không chọn NLB

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [How do I attach backend EC2 instances with private IP addresses to my internet-facing load balancer?](https://repost.aws/knowledge-center/public-load-balancer-private-ec2)
- 🌐 [Application, Network, and Gateway Load Balancing (so sánh ALB vs NLB)](https://aws.amazon.com/compare/the-difference-between-the-difference-between-application-network-and-gateway-load-balancing/)

</details>

---

<div id="question-31"></div>

### Question 31: AWS KMS to create multi-Region keys
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A home security company is expanding its business globally. The company needs to encrypt customer data. The company does not want to manage its own keys. The company needs the keys to be usable in multiple AWS Regions and needs to control access to the keys.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS CloudHSM to create users. Use the CloudHSM Management Utility (CMU) to share keys with the users. Use the shareKey command to share or unshare the key with additional users in each Region.
- **(B)** Use AWS CloudHSM to create a CloudHSM cluster in the company's primary Region. Synchronize the CloudHSM cluster to additional Regions by using the CloudHSM Management Utility (CMU).
- **(C)** Use AWS KMS to create multiple keys by importing key material. Apply tags to identify each key. Use attribute-based access control (ABAC) condition keys to control access to the keys.
- **(D)** Use AWS KMS to create multi-Region keys. Apply tags to identify each key. Use attribute-based access control (ABAC) condition keys to control access to the keys. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty mở rộng kinh doanh globally, cần mã hóa dữ liệu khách hàng
> - Không muốn tự quản lý key material (không muốn tự tạo/import key)
> - Key phải usable in multiple AWS Regions
> - Cần kiểm soát access tới key
> - → Yêu cầu: mã hóa dữ liệu dùng được đa Region, kiểm soát access, với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Use AWS KMS to create multi-Region keys. Apply tags to identify each key. Use attribute-based access control (ABAC) condition keys to control access to the keys.

Multi-Region keys là tính năng gốc của AWS KMS: tạo một primary key rồi replicate sang các Region khác, các key liên quan dùng chung key ID và key material nên có thể mã hóa ở Region này, giải mã ở Region khác mà không cần gọi cross-Region hay re-encrypt

AWS KMS tự động quản lý key material → đúng với yêu cầu "không muốn tự quản lý key"

ABAC condition keys (dựa trên tag/alias) cho phép kiểm soát access linh hoạt mà không cần sửa policy mỗi khi thêm resource mới → giảm operational overhead so với việc viết nhiều policy cố định

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use AWS KMS to create multiple keys by importing key material. Apply tags to identify each key. Use attribute-based access control (ABAC) condition keys to control access to the keys.**:
  Import key material nghĩa là công ty phải tự tạo và quản lý key material bên ngoài AWS KMS (BYOK) rồi sau đó import vào → vi phạm trực tiếp yêu cầu "does not want to manage its own keys"
  Ngoài ra phải tạo và đồng bộ thủ công nhiều key riêng lẻ cho từng Region, không có cơ chế multi-Region tự động như multi-Region keys

- **(B) Use AWS CloudHSM to create a CloudHSM cluster in the company's primary Region. Synchronize the CloudHSM cluster to additional Regions by using the CloudHSM Management Utility (CMU).**:
  CloudHSM là dịch vụ customer-managed - khách hàng chịu trách nhiệm hoàn toàn quản lý key material, cluster, user, đồng bộ giữa các Region → operational overhead rất cao, ngược lại hoàn toàn với yêu cầu

- **(A) Use AWS CloudHSM to create users. Use the CloudHSM Management Utility (CMU) to share keys with the users. Use the shareKey command to share or unshare the key with additional users in each Region.**:
  Vẫn là CloudHSM, sai như đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "does not want to manage its own keys" → loại ngay các đáp án import key material hoặc CloudHSM (cả hai đều là customer-managed)
- "least operational overhead" → Ưu tiên sử dụng managed service như AWS KMS multi-Region keys (tính năng built-in, không cần đồng bộ thủ công)
- "control access to keys" + không muốn sửa policy liên tục → ABAC với tag/alias condition keys
- Nếu đề yêu cầu full control HSM hardware / single-tenant compliance → mới cân nhắc CloudHSM, còn lại ưu tiên KMS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Multi-Region keys in AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html)
- 🌐 [ABAC for AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/abac.html)

</details>

---

<div id="question-32"></div>

### Question 32: A gateway endpoint for the S3 bucket
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company hosts a website on Amazon EC2 instances. The website processes classified data. The company stores the processed data in an Amazon S3 bucket. Because of security concerns, the company must ensure that traffic between the EC2 instances and the S3 bucket does not use public IP addresses.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a gateway endpoint for the S3 bucket. Configure an S3 bucket policy to allow access from the endpoint. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Create an EC2 instance profile. Create an IAM policy to grant access from the EC2 instance IP addresses to the S3 bucket. Attach the IAM policy to the instance profile.
- **(C)** Create a NAT gateway. Update the VPC route table to route the prefixes defined by the AWS-managed S3 prefix list to the NAT gateway.
- **(D)** Create an IAM user that has an access key ID and a secret access key. Configure the EC2 instances to use the IAM user credentials to access the S3 bucket.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website chạy trên EC2 instances, xử lý classified data (dữ liệu mật)
> - Dữ liệu đã xử lý được lưu trong Amazon S3 bucket
> - Yêu cầu bảo mật: traffic giữa EC2 và S3 không được dùng public IP addresses
> - → Yêu cầu: kết nối EC2 → S3 hoàn toàn qua private network, không đi qua internet/public IP

**Phân tích giải pháp tối ưu:**
Create a gateway endpoint for the S3 bucket. Configure an S3 bucket policy to allow access from the endpoint.

Gateway VPC Endpoint cho phép VPC kết nối private tới S3 mà không cần internet gateway, NAT device, hay public IP

Traffic đi hoàn toàn trong mạng nội bộ AWS (không rời khỏi AWS network), đáp ứng yêu cầu không dùng public IP addresses

Bucket policy với condition theo endpoint (aws:sourceVpce) giúp giới hạn chỉ cho traffic từ vpc endpoint mới được phép truy cập, giúp tăng security

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an EC2 instance profile. Create an IAM policy to grant access from the EC2 instance IP addresses to the S3 bucket. Attach the IAM policy to the instance profile.**:
  IAM policy chỉ kiểm soát quyền (authorization), không thay đổi đường đi traffic (routing) - EC2 vẫn gọi S3 qua public endpoint (qua internet, dùng public ip)

- **Create a NAT gateway. Update the VPC route table to route the prefixes defined by the AWS-managed S3 prefix list to the NAT gateway.**:
  NAT gateway vẫn đi ra internet để tới S3 → vẫn dùng public IP, không đáp ứng yêu cầu
  Hơn nữa NAT gateway cũng phát sinh chi phí không cần thiết khi mục tiêu chỉ là truy cập S3 cùng Region

- **Create an IAM user that has an access key ID and a secret access key. Configure the EC2 instances to use the IAM user credentials to access the S3 bucket.**:
  Vi phạm best practice bảo mật AWS: không dùng access key/secret key nhúng vào EC2 thay vì IAM role
  Không giải quyết vấn đề routing/public IP - vẫn gọi S3 qua endpoint public mặc định

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "traffic không dùng public IP" + "S3/DynamoDB cùng Region" → luôn nghĩ đến Gateway VPC Endpoint
- "Interface VPC Endpoint (PrivateLink)" sẽ dùng cho hầu hết service khác (không phải S3/DynamoDB) hoặc khi cần truy cập từ on-premises qua Direct Connect/VPN

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Gateway endpoints for Amazon S3](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html)

</details>

---

<div id="question-33"></div>

### Question 33: A bucket policy that grants Account B permission to access the centralized S3 buck...
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company operates an online photo-sharing service and stores data in AWS Account A in a centralized Amazon S3 bucket. The company wants to grant a second AWS account named Account B access to the centralized S3 bucket. The company owns Account B.

Which solution will meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a bucket policy that grants Account B permission to access the centralized S3 bucket in Account A. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon CloudFront to distribute the S3 bucket contents. Grant Account B access the bucket contents through a signed URL.
- **(C)** Enable cross-Region replication between Account A and Account B to share the S3 bucket data.
- **(D)** Enable S3 Transfer Acceleration to provide Account B access to the centralized S3 bucket in Account A.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Dữ liệu lưu trong Amazon S3 bucket tập trung ở Account A
> - Cần cấp quyền truy cập bucket này cho Account B (công ty sở hữu cả hai account)
> - → Yêu cầu: chia sẻ S3 bucket giữa 2 AWS account trong cùng tổ chức

**Phân tích giải pháp tối ưu:**
Create a bucket policy that grants Account B permission to access the centralized S3 bucket in Account A.

Bucket policy là resource-based policy, cho phép chủ sở hữu bucket (Account A) cấp quyền trực tiếp cho một AWS account khác (Account B), đáp ứng trực tiếp yêu cầu đề bài

Đây cũng là một trong các best practice của AWS khi cấp quyền truy cập S3 cross-account

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable S3 Transfer Acceleration to provide Account B access to the centralized S3 bucket in Account A.**:
  Transfer Acceleration chỉ giúp tăng tốc độ upload/download đến S3 thông qua CloudFront edge locations, không liên quan đến việc cấp quyền truy cập giữa các account
  Sai hoàn toàn về mục đích sử dụng dịch vụ

- **Enable cross-Region replication between Account A and Account B to share the S3 bucket data.**:
  Cross-Region Replication (CRR) tạo ra bản sao dữ liệu riêng ở bucket khác, không phải cấp quyền truy cập trực tiếp vào bucket gốc, gây tốn thêm chi phí lưu trữ và độ trễ đồng bộ không cần thiết
  Đề không yêu cầu sao lưu đồng bộ dữ liệu, chỉ cần cấp quyền truy cập

- **(B) Use Amazon CloudFront to distribute the S3 bucket contents. Grant Account B access the bucket contents through a signed URL.**:
  CloudFront + signed URL phù hợp cho việc phân phối nội dung công khai có kiểm soát cho end-user, không phải giải pháp chuẩn để một AWS account khác (đối tác quản trị, không phải end-user) truy cập trực tiếp bằng IAM
  Thêm phức tạp và chi phí không cần thiết so với bucket policy đơn giản

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "chia sẻ S3 bucket giữa 2 account" → nghĩ đến S3 bucket policy (resource-based policy) cấp quyền theo account ID

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [How do I grant cross-account access to objects that are in Amazon S3 buckets?](https://repost.aws/knowledge-center/cross-account-access-s3)
- 🌐 [Examples of policies for delegating access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_policy-examples.html)

</details>

---

<div id="question-34"></div>

### Question 34: The Auto Scaling policy from scheduled scaling to target tracking
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company hosts an online order processing application on Amazon EC2 instances. The instances are part of an EC2 Auto Scaling group that spans multiple Availability Zones and uses a scheduled scaling policy. The application uses Amazon RDS for MySQL as its database.

Though the database is write heavy, Amazon CloudWatch metrics do not show any problems during peak usage times. However, application users randomly experience slow responses when creating new orders.

Which solution will improve the application's response time without changing the application design or infrastructure?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Replace the EC2 instances with EC2 Dedicated Hosts in a cluster placement group.
- **(B)** Deploy an Amazon ElastiCache (Memcached) cache in front of the database.
- **(C)** Migrate the database from Amazon RDS for MySQL to Amazon DynamoDB.
- **(D)** Change the Auto Scaling policy from scheduled scaling to target tracking. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Order processing app trên EC2 trong Auto Scaling group (multi-AZ), dùng scheduled scaling policy
> - Database là Amazon RDS for MySQL, write heavy (ghi nhiều)
> - CloudWatch metrics không cho thấy vấn đề gì trong khi traffic cao (peak usage times)
> - User thỉnh thoảng gặp vấn đề response chậm khi tạo order mới
> - → Yêu cầu: cải thiện response time mà không thay đổi application design hay infrastructure

**Phân tích giải pháp tối ưu:**
Change the Auto Scaling policy from scheduled scaling to target tracking.

Scheduled scaling chỉ scale EC2 theo lịch cố định đã đặt trước, không phản ứng được với traffic ngẫu nhiên, không dự đoán được → khi nhu cầu tăng đột xuất mà không theo lịch, ASG không kịp scale thêm instance, gây nghẽn xử lý request tạo order (bao gồm cả việc ghi xuống DB) và slow response

Target tracking scale dựa trên metric thực tế (CPU, request count...) theo thời gian thực, tự động thêm/bớt instance bám sát nhu cầu thực tế, thì sẽ phù hợp hơn

Đây chỉ là đổi loại scaling policy (cấu hình), không phải thay đổi application code hay thêm thành phần hạ tầng mới → đáp ứng yêu cầu "without changing the application design or infrastructure"

Việc CloudWatch metric không thấy vấn đề ở DB khi traffic tăng cao đã loại trừ nguyên nhân đến từ RDS, thay vào đó là vấn đề của tầng ứng dụng (EC2/ASG)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Replace the EC2 instances with EC2 Dedicated Hosts in a cluster placement group.**:
  Đổi sang Dedicated Hosts là thay đổi lớn về hạ tầng (tenancy model), tốn kém, không giải quyết vấn đề scaling theo nhu cầu thực tế, và vi phạm ràng buộc "không thay đổi infrastructure"
  Cluster placement group tối ưu network latency giữa các ec2 instance với nau, không phải tối ưu network giữa ec2 và người dùng, không liên quan đến nguyên nhân slow response trong tình huống này

- **(C) Migrate the database from Amazon RDS for MySQL to Amazon DynamoDB.**:
  Đây là thay đổi application design ở mức nền tảng (khác hẳn engine, data model, query pattern) → vi phạm trực tiếp yêu cầu đề bài
  CloudWatch không cho thấy DB có vấn đề, nên việc thay cả database là giải pháp thừa và rủi ro cao

- **Deploy an Amazon ElastiCache (Memcached) cache in front of the database.**:
  Thêm ElastiCache là thêm một thành phần hạ tầng mới → vi phạm ràng buộc "without changing infrastructure"
  Cache giúp giảm tải cho read query, nhưng vấn đề ở đây là DB write heavy khi tạo order mới - cache không giúp được gì cả

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "CloudWatch metrics không cho thấy vấn đề" ở một thành phần (DB) → loại trừ thành phần đó, tập trung vào thành phần còn lại (ASG/EC2)
- "traffic ngẫu nhiên, không dự đoán được" → target tracking (phản ứng theo metric thực), loại scheduled scaling (chỉ theo lịch cố định)
- "không thay đổi application design/infrastructure" → loại các đáp án thêm service mới (cache, đổi DB engine, đổi instance tenancy), chỉ giữ lại đáp án đổi cấu hình/policy
- Nếu đề mô tả traffic biết trước theo lịch → scheduled scaling đúng; nếu traffic biến động không dự đoán được → target tracking đúng

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Target tracking scaling policies for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html)
- 🌐 [Scheduled scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html)

</details>

---

<div id="question-35"></div>

### Question 35: An Application Load Balancer to manage web traffic
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company needs to design a resilient web application to process customer orders. The web application must automatically handle increases in web traffic and application usage without affecting the customer experience or losing customer orders.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use a Gateway Load Balancer (GWLB) to manage web traffic. Use Amazon ECS to receive and process customer orders. Use the GWLB to capture and store unprocessed orders. Use Amazon DynamoDB to store processed customer orders.
- **(B)** Use an Application Load Balancer to manage web traffic. Use Amazon EC2 Auto Scaling groups to receive and process customer orders. Use Amazon SQS to store unprocessed orders. Use Amazon RDS with a Multi-AZ deployment to store processed customer orders. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use a Network Load Balancer (NLB) to manage web traffic. Use an Application Load Balancer to receive customer orders from the NLB. Use Amazon Redshift with a Multi-AZ deployment to store unprocessed and processed customer orders.
- **(D)** Use a NAT gateway to manage web traffic. Use Amazon EC2 Auto Scaling groups to receive, process, and store processed customer orders. Use an AWS Lambda function to capture and store unprocessed orders.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Cần thiết kế web app resilient xử lý customer orders
> - Phải tự động xử lý tăng traffic mà không ảnh hưởng trải nghiệm khách hàng
> - Không được mất order của khách hàng (loss of customer orders)
> - → Yêu cầu: kiến trúc tự scale, chịu lỗi, đảm bảo không mất dữ liệu order dù chưa xử lý kịp

**Phân tích giải pháp tối ưu:**
Use an Application Load Balancer to manage web traffic. Use Amazon EC2 Auto Scaling groups to receive and process customer orders. Use Amazon SQS to store unprocessed orders. Use Amazon RDS with a Multi-AZ deployment to store processed customer orders.

ALB phân phối traffic HTTP(S) tới các EC2 instance, tự động scale theo tải nhờ Auto Scaling group

Amazon SQS đóng vai trò buffer: khi chưa kịp xử lý (do traffic tăng đột biến), order vẫn được lưu trong queue rồi xử lý dần thay vì bị mất, đảm bảo loose coupling và không mất order

RDS Multi-AZ đảm bảo tính khả dụng cao (high availability) khi lưu order đã xử lý, giảm rủi ro mất dữ liệu do sự cố AZ

Kết hợp 4 thành phần tạo thành kiến trúc chuẩn: decouple bằng queue + tự động scale + high availability cho storage

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use a NAT gateway to manage web traffic. Use Amazon EC2 Auto Scaling groups to receive, process, and store processed customer orders. Use an AWS Lambda function to capture and store unprocessed orders.**:
  NAT gateway dùng để cho phép traffic outbound từ private subnet ra internet, hoàn toàn không phải dịch vụ quản lý traffic từ internet đi vào của web application - sai chức năng cơ bản
  "Store processed customer orders" ngay trên EC2 instance không đảm bảo độ tin cậy và an toàn như database

- **(C) Use a Network Load Balancer (NLB) to manage web traffic. Use an Application Load Balancer to receive customer orders from the NLB. Use Amazon Redshift with a Multi-AZ deployment to store unprocessed and processed customer orders.**:
  Kiến trúc NLB → ALB thừa và không cần thiết cho web traffic HTTP thông thường (chỉ cần ALB đã là đủ)
  Amazon Redshift là data warehouse cho phân tích (OLAP), không phù hợp lưu trữ giao dịch order theo thời gian thực (OLTP); Redshift cũng không hỗ trợ Multi-AZ theo kiểu RDS
  Không có cơ chế buffer/queue để giữ order khi tầng xử lý quá tải

- **(A) Use a Gateway Load Balancer (GWLB) to manage web traffic. Use Amazon ECS to receive and process customer orders. Use the GWLB to capture and store unprocessed orders. Use Amazon DynamoDB to store processed customer orders.**:
  Gateway Load Balancer dùng cho hệ thống security chuyên dụng cần scan ip package cho mục đích security, không dùng để cân bằng tải cho web application layer, và không có khả năng lưu order như đáp án đang nhắc đến
  Sai hoàn toàn về mục đích sử dụng GWLB trong kiến trúc

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "không được mất dữ liệu/order khi traffic tăng đột biến" → luôn nghĩ đến SQS làm buffer giữa tầng nhận và tầng xử lý
- "ALB" dùng cho HTTP(S) web traffic layer 7; "NLB" cho traffic TCP/UDP hiệu năng cao; "GWLB" cho security chuyên dụng (firewall/IDS) - phân biệt rõ 3 loại
- "resilient" + "high availability cho database" → RDS/Aurora Multi-AZ
- Nếu đề yêu cầu decouple + không mất message → loại ngay đáp án không có SQS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Scheduled scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html)

</details>

---

<div id="question-36"></div>

### Question 36: The EMR managed scaling feature to automatically resize the cluster based on workload
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A solutions architect needs to optimize a large data analytics job that runs on an Amazon EMR cluster. The job takes 13 hours to finish. The cluster has multiple core nodes and worker nodes that are deployed on large, compute-optimized instances.

After reviewing EMR logs, the solutions architect discovers that several nodes are idle for more than 5 hours while the job is running. The solutions architect needs to optimize cluster performance.

Which solution will meet this requirement MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Increase the number of core nodes to ensure there is enough processing power to handle the analytics job without any idle time.
- **(B)** Use the EMR managed scaling feature to automatically resize the cluster based on workload. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Migrate the analytics job to a set of AWS Lambda functions. Configure reserved concurrency for the functions.
- **(D)** Migrate the analytics job core nodes to a memory-optimized instance type to reduce the total job runtime.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Job phân tích dữ liệu lớn chạy trên Amazon EMR cluster, mất 13 giờ để hoàn thành
> - Cluster gồm nhiều core nodes và worker (task) nodes trên instance compute-optimized
> - Log cho thấy nhiều node idle hơn 5 giờ trong lúc job chạy (lãng phí tài nguyên)
> - → Yêu cầu: tối ưu hiệu năng cluster MOST cost-effectively (giảm lãng phí, giảm chi phí)

**Phân tích giải pháp tối ưu:**
Use the EMR managed scaling feature to automatically resize the cluster based on workload.

EMR managed scaling tự động tăng/giảm số lượng instance/unit trong cluster dựa trên workload thực tế theo thời gian thực, không cần cấu hình policy thủ công

Trực tiếp giải quyết vấn đề "nhiều node idle hơn 5 giờ": khi nhu cầu xử lý giảm, managed scaling tự động giảm số node xuống, tránh trả tiền cho tài nguyên không dùng

Đây là giải pháp cost-effective nhất vì không cần tăng thêm node cố định hay đổi loại instance, chỉ cần bật tính năng scaling có sẵn của EMR

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Increase the number of core nodes to ensure there is enough processing power to handle the analytics job without any idle time.**:
  Tăng cố định số core node làm tăng chi phí trong khi vấn đề thực tế là thừa tài nguyên (idle), không phải thiếu - đi ngược lại mục tiêu cost-effective

- **(C) Migrate the analytics job to a set of AWS Lambda functions. Configure reserved concurrency for the functions.**:
  Lambda có giới hạn thời gian chạy tối đa 15 phút/lần gọi, không phù hợp cho job phân tích dữ liệu lớn chạy nhiều giờ liên tục như EMR
  Việc migrate toàn bộ job đòi hỏi viết lại kiến trúc xử lý dữ liệu, tốn nhiều effort và rủi ro hơn nhiều so với chỉ bật managed scaling

- **(D) Migrate the analytics job core nodes to a memory-optimized instance type to reduce the total job runtime.**:
  Đổi loại instance không giải quyết nguyên nhân gốc là idle nodes do thiếu cơ chế scale in /out tự động - job vẫn có thể có giai đoạn idle dù dùng instance nào
  Không có thông tin nào trong đề cho thấy bottleneck là memory, đổi instance type sang loại tối ưu memory cũng không có ý nghĩa gì

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "nodes idle" trong cluster EMR → nghĩ đến auto scaling / managed scaling thay vì tăng số node cố định
- Đổi instance type chỉ nên chọn khi đề chỉ rõ bottleneck là CPU/memory cụ thể, không phải khi vấn đề là idle time

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Use Amazon EMR cluster scaling to adjust for changing workloads](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-scale-on-demand.html)
- 🌐 [Using managed scaling in Amazon EMR](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-scaling.html)

</details>

---

<div id="question-37"></div>

### Question 37: The Auto Scaling group to use a scheduled scaling action on the EC2 instances
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A digital media company has an application that runs on virtual machines (VMs) in an on-premises data center. The company releases new articles every Monday morning, which causes a surge in the number of viewers until Wednesday evening. The company wants to migrate the application to the AWS Cloud and run the application on Amazon EC2 instances. The company needs to scale the application based on the release schedule and has created an Auto Scaling group.

Which Auto Scaling group configuration will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the Auto Scaling group to use target tracking scaling policies on the EC2 instances.
- **(B)** Configure the Auto Scaling group to use step scaling policies on the EC2 instances.
- **(C)** Configure the Auto Scaling group to use simple scaling policies on the EC2 instances.
- **(D)** Configure the Auto Scaling group to use a scheduled scaling action on the EC2 instances. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - App chạy trên VM on-premises, migrate sang EC2 trong AWS Cloud
> - Công ty release bài viết mới mỗi sáng thứ Hai, gây surge lượng viewer kéo dài đến hết thứ Tư
> - Cần scale app theo release schedule đã biết trước
> - → Yêu cầu: chọn cấu hình Auto Scaling group phù hợp với lịch trình biết trước, lặp lại theo tuần

**Phân tích giải pháp tối ưu:**
Configure the Auto Scaling group to use a scheduled scaling action on the EC2 instances.

Scheduled scaling là cơ chế của Auto scaling cho phép set trước thời điểm tăng/giảm capacity dựa trên lịch trình đã biết, phù hợp với yêu cầu "thứ Hai tăng, cuối thứ Tư giảm"

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the Auto Scaling group to use target tracking scaling policies on the EC2 instances.**:
  Target tracking là loại scale tự động, phản ứng theo metric thực tế (CPU, request count...), sẽ phù hợp hơn khi traffic không dự đoán được trước, không phải trường hợp lịch cố định như đề bài

- **Configure the Auto Scaling group to use simple scaling policies on the EC2 instances.**:
  Simple scaling là cơ chế dynamic scaling cũ, chỉ phản ứng theo alarm/metric, có cooldown period cố định gây chậm phản ứng, không tận dụng được lợi thế "biết trước lịch trình"
  Không phù hợp khi đã biết chính xác thời điểm cần scale

- **Configure the Auto Scaling group to use step scaling policies on the EC2 instances.**:
  Step scaling cũng là dynamic scaling dựa trên metric/alarm với các bước tăng/giảm khác nhau theo mức độ vượt ngưỡng, vẫn là phản ứng sau khi traffic đã thay đổi, không phải scale chủ động theo lịch
  Phù hợp khi traffic biến động ở nhiều mức độ khác nhau cần phản ứng nhanh, không phù hợp với lịch cố định

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "biết trước ngày/giờ traffic tăng" (release theo lịch, sự kiện định kỳ) → luôn chọn Scheduled Scaling
- "traffic biến động không dự đoán được, cần phản ứng theo tải thực tế" → Target Tracking (ưu tiên hơn step/simple scaling vì đơn giản, tự động)
- Simple scaling và Step scaling đều là dynamic scaling dựa trên CloudWatch alarm - chỉ khác cách tính bước scale, cả hai đều KHÔNG phải lựa chọn tốt khi có lịch trình biết trước
- Có thể kết hợp Scheduled Scaling (đặt min/max baseline theo lịch) + Target Tracking (scale thêm theo tải thực tế trong khung thời gian đó)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Scheduled scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html)
- 🌐 [Target tracking scaling policies for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html)

</details>

---

<div id="question-38"></div>

### Question 38: A transit gateway, and place attachments in subnets of all the VPCs
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company is planning to migrate to AWS. The network layout will include more than 1,000 VPCs in a single AWS Region. The resources in the VPCs need to communicate with each other.

What should a solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create VPN tunnels from all the VPCs to each other. Enable route propagation.
- **(B)** Create an AWS Direct Connect gateway, and attach a public virtual interface (VIF) to each VPC. Enable route propagation.
- **(C)** Peer all the VPCs together by creating and accepting peering requests. Update route tables with the new routes.
- **(D)** Create a transit gateway, and place attachments in subnets of all the VPCs. Configure a transit gateway route table with the new routes. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Công ty migrate lên AWS với layout hơn 1.000 VPC trong một Region
> - Các resource trong VPC cần communicate với nhau
> - → Yêu cầu: giải pháp kết nối quy mô lớn (>1000 VPC), dễ quản lý, không phức tạp hóa routing

**Phân tích giải pháp tối ưu:**
Create a transit gateway, and place attachments in subnets of all the VPCs. Configure a transit gateway route table with the new routes.

Transit Gateway service cổng kết nối trung gian theo mô hình hub-and-spoke: mỗi VPC chỉ cần kết nối tới Transit Gateway (một attachment duy nhất) thay vì kết nối tới từng VPC khác riêng lẻ

Hỗ trợ kết nối tới hàng nghìn VPC trong cùng Region (theo AWS: có thể attach hàng nghìn VPC vào một Transit Gateway), phù hợp trực tiếp với quy mô ">1.000 VPC" trong đề

Quản lý routing tập trung qua Transit Gateway route table, đơn giản hóa việc kiểm soát traffic giữa các VPC so với việc phải cấu hình route table riêng lẻ cho từng cặp VPC

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create VPN tunnels from all the VPCs to each other. Enable route propagation.**:
  Thiết lập VPN tunnel giữa từng cặp VPC tạo ra mô hình full-mesh với số lượng kết nối tăng theo cấp số nhân, với 1.000 VPC là con số khổng lồ, không khả thi để quản lý
  Rất tốn kém và phức tạp so với mô hình hub-and-spoke của Transit Gateway

- **Create an AWS Direct Connect gateway, and attach a public virtual interface (VIF) to each VPC. Enable route propagation.**:
  Direct Connect Gateway dùng để kết nối mạng on-premises với VPC qua Direct Connect, không phải giải pháp kết nối VPC-to-VPC thuần túy trong AWS - sai mục đích sử dụng
  Public VIF dùng cho truy cập AWS public service endpoint, không liên quan đến việc các VPC giao tiếp nội bộ với nhau

- **(C) Peer all the VPCs together by creating and accepting peering requests. Update route tables with the new routes.**:
  VPC Peering là kết nối point-to-point, không transitive - với hơn 1.000 VPC cần thiết lập gần 500.000 peering connection để kết nối đầy đủ (full mesh), vượt xa giới hạn thực tế và cực kỳ khó quản lý
  Không phải giải pháp scale được cho số lượng VPC lớn như trong đề

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "hàng trăm/hàng nghìn VPC cần giao tiếp với nhau" → luôn nghĩ đến Transit Gateway (hub-and-spoke, scale tốt)
- "VPC Peering" chỉ phù hợp khi số lượng VPC ít (vài VPC 2~3)
- "Direct Connect Gateway" dùng cho kết nối on-premises ↔ AWS, không phải VPC ↔ VPC - loại ngay nếu đề chỉ nói về kết nối giữa các VPC
- Nếu đề nhấn mạnh số lượng VPC lớn + đơn giản hóa quản lý routing → đáp án gần như chắc chắn là Transit Gateway

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Transit Gateway (Networking whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/transit-gateway.html)
- 🌐 [VPC peering connections](https://docs.aws.amazon.com/vpc/latest/peering/working-with-vpc-peering.html)

</details>

---

<div id="question-39"></div>

### Question 39: An AWS Transfer Family SFTP server that uses the existing S3 bucket as a target
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company receives data transfers from a small number of external clients that use SFTP software on an Amazon EC2 instance. The clients use an SFTP client to upload data. The clients use SSH keys for authentication. Every hour, an automated script transfers new uploads to an Amazon S3 bucket for processing.

The company wants to move the transfer process to an AWS managed service and to reduce the time required to start data processing. The company wants to retain the existing user management and SSH key generation process. The solution must not require clients to make significant changes to their existing processes.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Transfer Family SFTP connector that has permission to access the target S3 bucket for each client. Store credentials in AWS Systems Manager. Create an IAM role to allow the SFTP connector to securely use the credentials.
- **(B)** Require clients to add the AWS DataSync agent into their local environments. Create an IAM user for each client that has permission to upload data to the target S3 bucket for each client.
- **(C)** Create an AWS Transfer Family SFTP server that uses the existing S3 bucket as a target. Use service-managed users to enable authentication. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Reconfigure the script that runs on the EC2 instance to run every 15 minutes. Create an S3 Event Notifications rule for all new object creation events. Set an Amazon SNS topic as the destination.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Client bên ngoài dùng SFTP client trên EC2 instance để upload data, xác thực bằng SSH keys
> - Script tự động (chạy mỗi giờ) chuyển file mới sang Amazon S3 để xử lý
> - Kiến trúc hiện tại: SFTP Client -> up lên EC2 -> script từ EC2 up lên S3 mỗi giờ (có độ trễ 1 giờ)
> - Muốn chuyển sang AWS managed service, giảm thời gian để có thể xử lý dữ liệu sớm hơn
> - Phải giữ nguyên cơ chế user management và SSH key generation hiện tại
> - Client không cần thay đổi đáng kể quy trình hiện có
> - → Yêu cầu: managed SFTP service, giảm độ trễ tới khi xử lý, tương thích với user/SSH key hiện tại

**Phân tích giải pháp tối ưu:**
Create an AWS Transfer Family SFTP server that uses the existing S3 bucket as a target. Use service-managed users to enable authentication.

AWS Transfer Family là managed service cho phép truyền file qua giao thức SFTP, client vẫn dùng SFTP client và SSH key như cũ để kết nối, không cần thay đổi quy trình phía client

File upload lên qua SFTP được ghi thẳng vào S3 bucket ngay lập tức, loại bỏ việc phải chờ 1 giờ cho script trong ec2 chạy như ban đầu → giảm thời gian bắt đầu xử lý dữ liệu (có thể kết hợp S3 Event Notification để trigger xử lý ngay khi file đến)

Service-managed users cho phép quản lý user và SSH public key trực tiếp trong Transfer Family, giữ nguyên mô hình "user management + SSH key generation" hiện có

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Reconfigure the script that runs on the EC2 instance to run every 15 minutes. Create an S3 Event Notifications rule for all new object creation events. Set an Amazon SNS topic as the destination.**:
  Vẫn giữ nguyên EC2 instance và script tự quản lý - không di chuyển sang AWS managed service như yêu cầu
  Giảm từ 1 giờ xuống 15 phút chỉ giảm độ trễ một phần, không giải quyết triệt để, vẫn phải duy trì vận hành EC2/SFTP server thủ công

- **(B) Require clients to add the AWS DataSync agent into their local environments. Create an IAM user for each client that has permission to upload data to the target S3 bucket for each client.**:
  Yêu cầu client cài đặt DataSync agent là thay đổi đáng kể quy trình phía client (client hiện chỉ dùng SFTP client thông thường) → vi phạm ràng buộc "must not require clients to make significant changes"
  Không giữ được cơ chế xác thực bằng SSH key hiện có, phải chuyển sang IAM user - thay đổi cơ chế user management

- **Create an AWS Transfer Family SFTP connector that has permission to access the target S3 bucket for each client. Store credentials in AWS Systems Manager. Create an IAM role to allow the SFTP connector to securely use the credentials.**:
  AWS Transfer Family SFTP Connector dùng để cho phép AWS chủ động kết nối tới SFTP server bên ngoài (outbound), không phải để tạo ra một SFTP server trên AWS cho client bên ngoài upload vào (inbound) - sai chiều luồng dữ liệu so với yêu cầu đề bài

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "muốn chuyển SFTP tự quản lý sang managed service" → AWS Transfer Family SFTP server (không phải connector)
- "giữ nguyên user/SSH key hiện tại, không đổi identity provider phức tạp" → service-managed users trong Transfer Family

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Configure storage to use with AWS Transfer Family servers](https://docs.aws.amazon.com/transfer/latest/userguide/configure-storage.html)
- 🌐 [Migrate an on-premises SFTP server to AWS using AWS Transfer for SFTP](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/migrate-an-on-premises-sftp-server-to-aws-using-aws-transfer-for-sftp.html)

</details>

---

<div id="question-40"></div>

### Question 40: The MySQL instance to use an SSL certificate and a VPC peering connection and rout...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (A), (B)

#### 📋 Đề bài (Scenario)
A company hosts an application on an Amazon EC2 instance. The application needs to access a MySQL database that the company hosts on a second EC2 instance. The EC2 instances are in separate VPCs within the same AWS account. The traffic between the application and MySQL database needs to be secure and private.

What combination of steps will meet these requirements? (Select TWO.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure a VPC peering connection and routing between the VPCs. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure the MySQL instance to use an SSL certificate. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Ensure the public IP address of the application EC2 instance is allowed in the ACL of the VPC that contains the MySQL instance.
- **(D)** Ensure the security group ID of the application EC2 instance is allowed in the ACL of the VPC that contains the MySQL instance.
- **(E)** Configure the application to use Amazon RDS Proxy to access the MySQL database.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - App trên EC2 cần truy cập MySQL database chạy trên EC2 instance thứ hai (self-hosted, không phải RDS)
> - Hai EC2 instance nằm trong hai VPC khác nhau, cùng AWS account
> - Traffic giữa app và database phải secure và private
> - → Yêu cầu: chọn 2 bước để vừa kết nối được giữa 2 VPC, vừa mã hóa traffic giữa 2 instance

**Phân tích giải pháp tối ưu:**
Configure a VPC peering connection and routing between the VPCs.

VPC Peering cho phép hai EC2 instance ở hai VPC khác nhau giao tiếp bằng private IP, traffic không đi qua internet, đáp ứng yêu cầu "private"

Cần cấu hình thêm route table ở cả hai VPC để traffic được định tuyến qua kết nối peering

Configure the MySQL instance to use an SSL certificate.

VPC Peering tự nó không có cơ chế mã hóa dữ liệu ở tầng ứng dụng cho mọi loại instance/kết nối - cấu hình MySQL dùng SSL/TLS certificate đảm bảo dữ liệu truyền giữa app và MySQL được mã hóa (secure), đúng yêu cầu "secure" trong đề

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the application to use Amazon RDS Proxy to access the MySQL database.**:
  RDS Proxy chỉ hoạt động với Amazon RDS/Aurora, không hỗ trợ MySQL tự cài đặt (self-managed) trên EC2 instance như trong đề - sai dịch vụ
  RDS Proxy dùng để quản lý connection pooling, không phải giải pháp cho vấn đề kết nối/mã hóa giữa 2 VPC

- **Ensure the public IP address of the application EC2 instance is allowed in the ACL of the VPC that contains the MySQL instance.**:
  Dùng public IP address để kết nối đi ngược lại yêu cầu "private" - traffic sẽ đi qua internet thay vì mạng nội bộ AWS
  Network ACL không phải cơ chế chính để kiểm soát truy cập cross-VPC, muốn cho phép truy cập thì bắt buộc phải sử dụng security group, NACL chỉ là yếu tố tăng thêm security.

- **Ensure the security group ID of the application EC2 instance is allowed in the ACL of the VPC that contains the MySQL instance.**:
  Network ACL không hỗ trợ tham chiếu Security Group ID, nó chỉ allow / deny traffic theo dựa theo dải IP CIDR
  Ở đây đúng ra phải sử dụng security group của DB để allow security group của APP thay vì NACL

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "hai VPC khác nhau, cùng account, cần giao tiếp private" → VPC Peering connection + cập nhật route table
- "traffic cần secure/encrypted" giữa app và self-managed database trên EC2 (không phải RDS) → cấu hình SSL/TLS ở tầng database engine, không phải RDS Proxy (chỉ dùng cho RDS/Aurora)
- "public IP" xuất hiện trong đáp án khi đề yêu cầu "private" → gần như luôn là đáp án sai

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [VPC peering connections](https://docs.aws.amazon.com/vpc/latest/peering/working-with-vpc-peering.html)

</details>

---

<div id="question-41"></div>

### Question 41: Amazon Macie
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company stores data in Amazon S3. According to regulations, the data must not contain personally identifiable information (PII). The company recently discovered that S3 buckets have some objects that contain PII. The company needs to automatically detect PII in S3 buckets and to notify the company's security team.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Macie. Create an Amazon EventBridge rule to filter the SensitiveData event type from Macie findings and to send an Amazon SNS notification to the security team.
- **(B)** Use Amazon Macie. Create an Amazon EventBridge rule to filter the SensitiveData:S3Object/Personal event type from Macie findings and to send an Amazon SQS notification to the security team. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon GuardDuty. Create an Amazon EventBridge rule to filter the CRITICAL event type from GuardDuty findings and to send an Amazon SNS notification to the security team.
- **(D)** Use Amazon GuardDuty. Create an Amazon EventBridge rule to filter the CRITICAL event type from GuardDuty findings and to send an Amazon SQS notification to the security team.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Dữ liệu lưu trong Amazon S3 không được chứa personally identifiable information (PII) - thông tin cá nhân
> - Công ty phát hiện một số object trong bucket có chứa PII
> - Cần tự động phát hiện PII trong S3 bucket
> - Cần thông báo (notify) cho đội security nếu phát hiện
> - → Yêu cầu: tự động phát hiện PII trong S3 và gửi thông báo cho security team

**Phân tích giải pháp tối ưu:**
Use Amazon Macie. Create an Amazon EventBridge rule to filter the SensitiveData event type from Macie findings and to send an Amazon SNS notification to the security team.

Amazon Macie là dịch vụ chuyên phát hiện dữ liệu nhạy cảm (PII, PHI, credentials, financial data) trong S3, dùng machine learning và pattern matching - đúng service cho yêu cầu "tự động phát hiện PII"

Macie tự động bắn các finding - phát hiện (loại SensitiveData:S3Object/*) lên EventBridge, có thể lọc theo loại finding để chỉ xử lý các finding liên quan sensitive data

Amazon SNS hỗ trợ subscriber qua email, phù hợp để "notify the security team" (báo cho security team) nếu phát hiện

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Use Amazon GuardDuty. Create an Amazon EventBridge rule to filter the CRITICAL event type from GuardDuty findings and to send an Amazon SNS notification to the security team.**:
  GuardDuty là dịch vụ phát hiện các hoạt động bất thường / độc hại (network, API call bất thường, compromised credentials...) trong aws account, KHÔNG quét nội dung object để tìm PII - sai service ngay từ đầu
  GuardDuty có S3 Protection nhưng chỉ phát hiện hành vi truy cập bất thường, không phân tích nội dung dữ liệu

- **(B) Use Amazon Macie. Create an Amazon EventBridge rule to filter the SensitiveData:S3Object/Personal event type from Macie findings and to send an Amazon SQS notification to the security team.**:
  Đúng service (Macie) và đúng tên finding type chi tiết, nhưng dùng SQS để "notify" đội security là không hợp lý - SQS là message queue, không tự dùng để gửi thông báo

- **(D) Use Amazon GuardDuty. Create an Amazon EventBridge rule to filter the CRITICAL event type from GuardDuty findings and to send an Amazon SQS notification to the security team.**:
  Sử dụng cả GuardDuty và EventBridge, sai tương tự như đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Detect PII / sensitive data in S3" → Amazon Macie (không phải GuardDuty)
- "GuardDuty" → threat detection, anomalous behavior, KHÔNG phải nội dung dữ liệu nhạy cảm - loại ngay khi đề nói "PII trong S3"
- "Notify the team" / cần con người nhận thông báo → Amazon SNS (hỗ trợ email/SMS subscriber)
- "Notify" nhưng đáp án dùng SQS → loại ngay, SQS chỉ là hàng đợi, không tự thông báo

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Types of Amazon Macie findings](https://docs.aws.amazon.com/macie/latest/user/findings-types.html)
- 🌐 [Processing Macie findings with Amazon EventBridge](https://docs.aws.amazon.com/macie/latest/user/findings-monitor-events-eventbridge.html)

</details>

---

<div id="question-42"></div>

### Question 42: A gateway VPC endpoint for Amazon S3
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has several Amazon EC2 instances in a private subnet. These EC2 instances host applications that read and write large amounts of data to and from Amazon S3. Subnet routing currently directs all the traffic destined for the internet through a NAT gateway.

The company wants to reduce the data transfer costs associated with the Amazon S3 communication. The solution must not affect the ability of the applications to communicate with Amazon S3 or the outside internet. The EC2 instances must continue to reside in a private subnet.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an additional NAT gateway. Update the route table to route to the additional NAT gateway. Update the network ACL to allow Amazon S3 traffic.
- **(B)** Create a gateway VPC endpoint for Amazon S3. Specify the route table to direct traffic to the gateway VPC endpoint. Attach an endpoint policy to the gateway VPC endpoint. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create an AWS Lambda function outside the VPC to handle Amazon S3 requests. Attach an IAM policy to the EC2 instances that allows the EC2 instances to invoke the Lambda function.
- **(D)** Create an internet gateway. Update the route table to route traffic to the internet gateway. Update the network ACL to allow Amazon S3 traffic.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - EC2 instances trong private subnet đọc/ghi lượng lớn dữ liệu đến/từ Amazon S3
> - Traffic hiện tại đi qua NAT gateway để ra internet
> - Muốn giảm chi phí data transfer liên quan traffic S3
> - Không được ảnh hưởng khả năng EC2 giao tiếp với S3 lẫn internet bên ngoài
> - EC2 phải tiếp tục nằm trong private subnet
> - → Yêu cầu: giảm chi phí NAT gateway cho traffic S3 mà không đổi kiến trúc network cơ bản, MOST cost-effective

**Phân tích giải pháp tối ưu:**
Create a gateway VPC endpoint for Amazon S3. Specify the route table to direct traffic to the gateway VPC endpoint. Attach an endpoint policy to the gateway VPC endpoint.

Gateway VPC Endpoint cho phép các service bên trong VPC có thể kết nối S3 hoàn toàn miễn phí (không tính phí theo giờ hay theo GB) thay vì sử dụng NAT gateway cho phần traffic đi đến S3

Traffic ra internet (ngoài S3) vẫn tiếp tục qua NAT gateway như cũ - route table chỉ định tuyến traffic S3 (theo AWS-managed prefix list) sang endpoint, các traffic khác không đổi

Đây là pattern chuẩn AWS khuyến nghị khi phần lớn chi phí NAT gateway đến từ traffic S3/DynamoDB cùng Region

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an additional NAT gateway. Update the route table to route to the additional NAT gateway. Update the network ACL to allow Amazon S3 traffic.**:
  Thêm NAT gateway mới tăng chi phí thay vì giảm - ngược hoàn toàn với yêu cầu "reduce data transfer costs"

- **Create an internet gateway. Update the route table to route traffic to the internet gateway. Update the network ACL to allow Amazon S3 traffic.**:
  Route trực tiếp qua internet gateway yêu cầu EC2 có địa chỉ IP public/route ra internet - vi phạm yêu cầu "EC2 phải tiếp tục ở private subnet" và làm lộ instance ra internet, không đáp ứng security

- **Create an AWS Lambda function outside the VPC to handle Amazon S3 requests. Attach an IAM policy to the EC2 instances that allows the EC2 instances to invoke the Lambda function.**:
  Thêm một tầng trung gian (Lambda) không cần thiết, tăng độ phức tạp và có thể tăng chi phí (Lambda invocation, cần thêm cơ chế truyền dữ liệu lớn) - không giải quyết trực tiếp vấn đề chi phí NAT gateway
  Lambda ngoài VPC vẫn cần cơ chế riêng để nhận traffic lớn từ EC2, không phải giải pháp networking phù hợp

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Same Region" + "traffic to S3 qua NAT gateway" + "reduce cost" → Gateway VPC Endpoint
- Thêm NAT gateway/Lambda trung gian để "giải quyết" bài toán cost → thường là đáp án gây nhiễu, tăng thêm chi phí thay vì giảm

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Gateway endpoints for Amazon S3](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html)

</details>

---

<div id="question-43"></div>

### Question 43: DynamoDB in on-demand mode by using the DynamoDB Standard table class
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
> - Web app trên EC2, dùng DynamoDB làm backend
> - Traffic ứng dụng unpredictable (không dự đoán được)
> - Read/write throughput ở mức moderate to high
> - Cần scale theo application traffic
> - → Yêu cầu: cấu hình DynamoDB table MOST cost-effective, tự scale theo traffic khó dự đoán

**Phân tích giải pháp tối ưu:**
Configure DynamoDB in on-demand mode by using the DynamoDB Standard table class.

Unpredictable traffic → on-demand mode là lựa chọn tối ưu vì DynamoDB tự động scale capacity theo traffic thực tế, chỉ trả tiền theo request thực dùng (pay-per-request), không cần dự đoán capacity trước

Với traffic moderate to high và khó dự đoán, provisioned mode (dù có auto scaling) vẫn có độ trễ phản ứng khi traffic tăng đột biến, dễ gây throttling hoặc lãng phí capacity dự phòng

DynamoDB Standard (không phải Standard-IA) phù hợp cho data truy cập nhiều, đề đang nhắc đến throughput moderate-to-high (nhiều traffic)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure DynamoDB with provisioned read and write by using the DynamoDB Standard table class. Set DynamoDB auto scaling to a maximum defined capacity.**:
  Provisioned mode (kể cả có auto scaling) phù hợp với traffic ổn định, dự đoán được - với traffic unpredictable, auto scaling phản ứng có độ trễ (theo dõi CloudWatch alarm), dễ gây throttling khi traffic tăng đột biến hoặc trả phí thừa khi traffic thấp

- **Configure DynamoDB with provisioned read and write by using the DynamoDB Standard Infrequent Access (DynamoDB Standard-IA) table class. Set DynamoDB auto scaling to a maximum defined capacity.**:
  Provisioned mode không phù hợp như đáp án sai ở trên
  Standard-IA tối ưu cho data ít truy cập - mà bảng này có throughput moderate-to-high (nhiều traffic) nên chi phí request của Standard-IA (cao hơn Standard) sẽ làm tổng chi phí tăng, không phù hợp mục tiêu cost-effective

- **Configure DynamoDB in on-demand mode by using the DynamoDB Standard Infrequent Access (DynamoDB Standard-IA) table class.**:
  Đúng capacity mode (on-demand) nhưng sai table class Standard-IA như đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Unpredictable traffic" / "traffic không dự đoán được" → DynamoDB on-demand mode
- "moderate to high throughput" → Standard table class

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [DynamoDB on-demand and provisioned capacity](https://docs.aws.amazon.com/wellarchitected/latest/serverless-applications-lens/capacity.html)
- 🌐 [Read/write capacity mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/capacity-mode.html)

</details>

---

<div id="question-44"></div>

### Question 44: An IAM role to grant the necessary permissions to the applications
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs several applications on Amazon EC2 instances. The company stores configuration files in an Amazon S3 bucket.

A solutions architect must provide the company's applications with access to the configuration files. The solutions architect must follow AWS best practices for security.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Activate multi-factor authentication (MFA) and versioning on the S3 bucket.
- **(B)** Use an IAM role to grant the necessary permissions to the applications. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use the AWS access key ID and the EC2 secret access key.
- **(D)** Use the AWS account root user access keys.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Nhiều ứng dụng chạy trên EC2 instances
> - File cấu hình (configuration files) được lưu trong Amazon S3 bucket
> - Cần cung cấp cho ứng dụng quyền truy cập file cấu hình
> - Phải tuân theo AWS best practices for security
> - → Yêu cầu: cấp quyền truy cập S3 cho EC2 theo đúng best practice bảo mật

**Phân tích giải pháp tối ưu:**
Use an IAM role to grant the necessary permissions to the applications.

IAM role gắn vào EC2 instance (qua instance profile) là best practice chuẩn của AWS cho việc cấp quyền thao tác với AWS servce cho ứng dụng chạy trên EC2, đáp ứng yêu cầu về security, setup đơn giản

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use the AWS account root user access keys.**:
  Dùng root user access key là vi phạm best practice bảo mật AWS - root user có toàn quyền trên account, không nên dùng cho ứng dụng, và access key là long-term credential dễ bị lộ

- **(C) Use the AWS access key ID and the EC2 secret access key.**:
  Nhúng access key/secret key trực tiếp vào ứng dụng hoặc instance là credential lâu dài, cần quản lý, dễ bị rò rỉ - không phải best practice về security khi cấp quyền trên AWS

- **Activate multi-factor authentication (MFA) and versioning on the S3 bucket.**:
  MFA và Versioning là tính năng bảo mật/bảo vệ dữ liệu hữu ích nhưng không giải quyết vấn đề cấp quyền truy cập đến service

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Applications on EC2 need access to AWS resources" + "best practices for security" → IAM role (instance profile), không dùng access key
- "Root user access keys" / "access key ID và secret access key" xuất hiện trong đáp án → gần như luôn là đáp án sai trong các câu hỏi liên quan đến việc cấp quyền truy cập trên AWS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Use an IAM role to grant permissions to applications running on Amazon EC2 instances](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html)
- 🌐 [IAM roles for Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html)

</details>

---

<div id="question-45"></div>

### Question 45: The orders in an Amazon SQS FIFO queue
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company is migrating its order processing system to the AWS Cloud. The order processing system must use exact message ordering, a highly available architecture, and loosely coupled components.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Ingest the orders in an Amazon SQS FIFO queue. Invoke an AWS Lambda function to process the orders. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Push the orders to a stream in Amazon Kinesis Data Streams. Use Amazon EC2 Spot Instances to process the orders.
- **(C)** Push the orders to an Amazon SNS topic. Subscribe an AWS Lambda function to the SNS topic to process the orders.
- **(D)** Ingest the orders in an Amazon SQS standard queue. Use Amazon EC2 Spot Instances to process the orders.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Migrate order processing system lên AWS
> - Yêu cầu exact message ordering (thứ tự chính xác)
> - Yêu cầu highly available architecture (kiến trúc khả dụng cao)
> - Yêu cầu loosely coupled components (các thành phần phân tán)
> - → Yêu cầu: chọn giải pháp messaging đảm bảo đúng thứ tự, HA (high available - tính khả dụng cao), và loose coupling

**Phân tích giải pháp tối ưu:**
Ingest the orders in an Amazon SQS FIFO queue. Invoke an AWS Lambda function to process the orders.

SQS FIFO queue giúp đảm bảo exact ordering (đúng thứ tự) (First-In-First-Out) trong cùng message group, cùng với exactly-once processing (xử lý duy nhất 1 lần) - đáp ứng trực tiếp yêu cầu "exact message ordering"

SQS là managed service, có tính khả dụng cao native, và không tốn effort vận hành

SQS + Lambda là kiến trúc loosely coupled phổ biến: Lambda được trigger tự động khi có message vào SQS

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Ingest the orders in an Amazon SQS standard queue. Use Amazon EC2 Spot Instances to process the orders.**:
  SQS standard queue chỉ đảm bảo best-effort ordering (không đảm bảo thứ tự chính xác), vi phạm yêu cầu "exact message ordering"
  Spot Instances có thể bị thu hồi bất cứ lúc nào → vi phạm yêu cầu về tính khả dụng cao (HA)

- **(C) Push the orders to an Amazon SNS topic. Subscribe an AWS Lambda function to the SNS topic to process the orders.**:
  SNS là dịch vụ pub/sub (fan-out), không đảm bảo thứ tự message như FIFO queue

- **(B) Push the orders to a stream in Amazon Kinesis Data Streams. Use Amazon EC2 Spot Instances to process the orders.**:
  Kinesis Data Streams đảm bảo thứ tự trong từng shard, nhưng vẫn dùng Spot Instances để xử lý → vi phạm yêu cầu highly available
  Kinesis phù hợp hơn cho streaming/replay analytics, không phù hợp cho các use case như order processing

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Exact message ordering" / "processed in order" → Amazon SQS FIFO queue (không phải standard queue, không phải SNS thường)
- "Highly available" + đáp án dùng Spot Instances để xử lý → loại ngay (Spot có thể bị thu hồi bất cứ lúc nào)
- "Loosely coupled" + cần managed compute tự scale → SQS/SNS kết hợp AWS Lambda là pattern chuẩn
- SNS chỉ đảm bảo ordering khi dùng SNS FIFO + SQS FIFO subscriber, không phải khi subscriber là Lambda trực tiếp

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon SQS FIFO queue and Lambda concurrency behavior](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/fifo-queue-lambda-behavior.html)

</details>

---

<div id="question-46"></div>

### Question 46: An IAM role and an IAM access policy that allows the web server EC2 instances to a...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company uses a set of Amazon EC2 instances to host a website. The website uses an Amazon S3 bucket to store images and media files.

The company wants to automate website infrastructure creation to deploy the website to multiple AWS Regions. The company also wants to provide the EC2 instances access to the S3 bucket so the instances can store and access data by using IAM.

Which solution will meet these requirements MOST securely?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS CloudFormation template for the web server EC2 instances. Save an IAM access key in the UserData section of the AWS::EC2::Instance entity in the CloudFormation template.
- **(B)** Create a file that contains an IAM secret access key and access key ID. Store the file in a new S3 bucket. Create an AWS CloudFormation template. In the template, create a parameter to specify the location of the S3 object that contains the access key and access key ID.
- **(C)** Create an IAM role and an IAM access policy that allows the web server EC2 instances to access the S3 bucket. Create an AWS CloudFormation template for the web server EC2 instances that contains an IAM instance profile entity that references the IAM role and the IAM access policy. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a script that retrieves an IAM secret access key and access key ID from IAM and stores them on the web server EC2 instances. Include the script in the UserData section of the AWS::EC2::Instance entity in an AWS CloudFormation template.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website chạy trên EC2 instances, dùng S3 bucket lưu ảnh/media
> - Muốn tự động hóa việc tạo infrastructure để deploy website ra nhiều AWS Region
> - Cần cấp quyền cho EC2 truy cập S3 bucket bằng IAM
> - → Yêu cầu: cấp quyền EC2 → S3 trong CloudFormation template theo cách bảo mật nhất (MOST securely)

**Phân tích giải pháp tối ưu:**
Create an IAM role and an IAM access policy that allows the web server EC2 instances to access the S3 bucket. Create an AWS CloudFormation template for the web server EC2 instances that contains an IAM instance profile entity that references the IAM role and the IAM access policy.

Dùng IAM role + instance profile cách chuẩn để cấp quyền cho EC2 truy cập S3 là best practice của aws về mặt security

CloudFormation là service cho phép viết định nghĩa các service thông qua code, có khả năng triển khai đồng thời trên nhiều region, đáp ứng yêu cầu

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS CloudFormation template for the web server EC2 instances. Save an IAM access key in the UserData section of the AWS::EC2::Instance entity in the CloudFormation template.**:
  Lưu access key trực tiếp trong UserData là vi phạm nguyên tắc về security của AWS

- **Create a file that contains an IAM secret access key and access key ID. Store the file in a new S3 bucket. Create an AWS CloudFormation template. In the template, create a parameter to specify the location of the S3 object that contains the access key and access key ID.**:
  Sử dụng access key và lưu trên S3 cũng vi phạm nguyên tắc về security của AWS, không đảm bảo an toàn

- **Create a script that retrieves an IAM secret access key and access key ID from IAM and stores them on the web server EC2 instances. Include the script in the UserData section of the AWS::EC2::Instance entity in an AWS CloudFormation template.**:
  Sử dụng access key và lưu trên EC2 cũng tương tự, vi phạm nguyên tắc về security của AWS

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Grant EC2 access to S3 in CloudFormation" + "MOST securely" → IAM role + instance profile (AWS::IAM::Role + AWS::IAM::InstanceProfile)
- Đáp án nào có "access key" xuất hiện trong UserData, script, hay S3 object → loại

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Control CloudFormation access with AWS Identity and Access Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html)
- 🌐 [EC2 instance profiles (machine-to-machine identity management)](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture-identity-management/m2m-identity-management.html)

</details>

---

<div id="question-47"></div>

### Question 47: Amazon SQS to create a new message queue
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A solutions architect is migrating an on-premises application to AWS. The application currently runs on containers. The components of the application are loosely coupled. The application consumes messages from a message queue.

The solutions architect needs to design a new architecture for the application on AWS. The solutions architect wants to use fully managed AWS services for the new architecture. The new architecture must provide unlimited scalability for the message queue's throughput.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon SQS to create a new message queue. Subscribe the SQS queue to an Amazon SNS topic. Use Amazon EC2 Reserved Instances that run Kubernetes containers to consume messages from the message queue.
- **(B)** Use Amazon MQ to create a new message queue. Subscribe the Amazon MQ queue to an Amazon SNS topic. Use Amazon EKS containers on AWS Fargate to consume messages from the message queue.
- **(C)** Use Amazon SQS to create a new message queue. Subscribe the SQS queue to an Amazon SNS topic. Use Amazon ECS containers on AWS Fargate to consume messages from the message queue. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon MQ to create a new message queue. Subscribe the Amazon MQ queue to an Amazon SNS topic. Use AWS Lambda functions to poll messages from the Amazon MQ queue by using Lambda event source mappings.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Migrate ứng dụng chạy trên container, các component loosely coupled (các thành phần phân tán)
> - Ứng dụng xử lý message từ message queue
> - Muốn dùng fully managed AWS services
> - Cần unlimited scalability cho throughput của message queue
> - → Yêu cầu: kiến trúc mới dùng service fully managed, message queue scale gần như không giới hạn

**Phân tích giải pháp tối ưu:**
Use Amazon SQS to create a new message queue. Subscribe the SQS queue to an Amazon SNS topic. Use Amazon ECS containers on AWS Fargate to consume messages from the message queue.

Amazon SQS cung cấp throughput gần như không giới hạn - đáp ứng trực tiếp yêu cầu "unlimited scalability for the message queue's throughput"

AWS Fargate là compute fully managed hoàn toàn cho container (không cần quản lý EC2 instance/cluster capacity), phù hợp yêu cầu "fully managed AWS services" và giữ nguyên mô hình container hiện có

SQS + SNS + ECS Fargate giữ tính chất loosely coupled giữa các microservices, không cần thay đổi lớn về kiến trúc logic ứng dụng

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(A) Use Amazon SQS to create a new message queue. Subscribe the SQS queue to an Amazon SNS topic. Use Amazon EC2 Reserved Instances that run Kubernetes containers to consume messages from the message queue.**:
  Đúng phần message queue (SQS) nhưng dùng EC2 Reserved Instances và tự vận hành Kubernetes không đáp ứng yêu cầu fully managed AWS Service

- **(B) Use Amazon MQ to create a new message queue. Subscribe the Amazon MQ queue to an Amazon SNS topic. Use Amazon EKS containers on AWS Fargate to consume messages from the message queue.**:
  Amazon MQ là có throughput bị giới hạn tuỳ theo kích thước instance đã chọn lúc tạo - không đáp ứng "unlimited scalability" như SQS

- **(D) Use Amazon MQ to create a new message queue. Subscribe the Amazon MQ queue to an Amazon SNS topic. Use AWS Lambda functions to poll messages from the Amazon MQ queue by using Lambda event source mappings.**:
  Vẫn dùng Amazon MQ, sai như trên. Hơn nữa dùng Lambda không đáp ứng yêu cầu muốn chạy container của đề bài.

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Unlimited scalability for queue throughput" → Amazon SQS (không phải Amazon MQ - MQ là broker có giới hạn theo instance size)
- "Fully managed AWS services" + đang dùng container → AWS Fargate (ECS)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon SQS Features](https://aws.amazon.com/sqs/features/)
- 🌐 [Amazon Simple Queue Service endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/sqs-service.html)

</details>

---

<div id="question-48"></div>

### Question 48: A Gateway Load Balancer (GWLB) and reconfigure network routing to go through the GWLB
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company runs a production web application on AWS in a VPC. The company's security team wants to use a virtual appliance to perform deep packet inspection of all inbound and outbound network packets.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy a Gateway Load Balancer (GWLB) and reconfigure network routing to go through the GWLB. Provide IAM access for the security team to deploy and configure a virtual appliance to ingest and inspect network traffic from the GWLB. `[Đáp án đúng ✅]`
- **(B)** Enable AWS CloudTrail for the web application resources. Provide IAM access for the security team to deploy and configure a virtual appliance to ingest and inspect network traffic from CloudTrail logs.
- **(C)** Enable VPC Flow Logs for the VPC that hosts the web application. Place a virtual appliance in the VPC. Provide IAM access for the security team to deploy and configure the virtual appliance to ingest and inspect network traffic from VPC Flow Logs.
- **(D)** Deploy AWS WAF for the web application. Provide IAM access for the security team to deploy and configure a virtual appliance to ingest and inspect the network traffic from AWS WAF.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Production web application chạy trong VPC
> - Đội security muốn dùng virtual appliance (máy ảo) để deep packet inspection (quét sâu các gói tin) cho toàn bộ traffic inbound và outbound
> - → Yêu cầu: chọn giải pháp AWS cho phép chèn virtual appliance kiểm tra packet ở tầng network cho traffic ra/vào VPC

**Phân tích giải pháp tối ưu:**
Deploy a Gateway Load Balancer (GWLB) and reconfigure network routing to go through the GWLB. Provide IAM access for the security team to deploy and configure a virtual appliance to ingest and inspect network traffic from the GWLB.

Gateway Load Balancer được thiết kế chuyên biệt để deploy, scale, và quản lý virtual appliance (firewall, IPS/IDS, deep packet inspection) dùng cho use case chuyên dụng về security như quét các gói tin (ip package)

GWLB hoạt động ở network layer (Layer 3), dùng giao thức GENEVE để chuyển tiếp toàn bộ traffic (mọi port) đến target group chứa các máy ảo chuyên dụng để quét ip package, sau khi quét xong thì trả traffic về lại luồng chính để đi tiếp

Route table trong VPC được cấu hình lại để traffic đi qua GWLB endpoint trước khi đến đích - đáp ứng đúng yêu cầu inspect cả inbound lẫn outbound

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable VPC Flow Logs for the VPC that hosts the web application. Place a virtual appliance in the VPC. Provide IAM access for the security team to deploy and configure the virtual appliance to ingest and inspect network traffic from VPC Flow Logs.**:
  VPC Flow Logs chỉ ghi lại lịch sử traffic (source/dest IP, port, action...) đi ra đi vào trong VPC, KHÔNG chứa nội dung packet - không thể dùng để deep packet inspection

- **Enable AWS CloudTrail for the web application resources. Provide IAM access for the security team to deploy and configure a virtual appliance to ingest and inspect network traffic from CloudTrail logs.**:
  CloudTrail ghi lại lịch sử thao tác service trong account (API Call), hoàn toàn không liên quan đến network packet - sai loại dữ liệu, không thể inspect traffic

- **Deploy AWS WAF for the web application. Provide IAM access for the security team to deploy and configure a virtual appliance to ingest and inspect the network traffic from AWS WAF.**:
  AWS WAF dùng để chống các loại hình tấn công phổ biến cho WEB, không cung cấp cơ chế liên kết virtual appliance để quét network package

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Virtual appliance" + "deep packet inspection" + "inbound/outbound traffic" → Gateway Load Balancer (GWLB)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [What is a Gateway Load Balancer?](https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/introduction.html)
- 🌐 [Inspecting inbound traffic from the internet using firewall appliances with Gateway Load Balancer](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/inspecting-inbound-traffic-fa.html)

</details>

---

<div id="question-49"></div>

### Question 49: A secret for the database credentials in AWS Secrets Manager
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company has an application that runs on Amazon EC2 instances in an Auto Scaling group. The application uses hardcoded credentials to access an Amazon RDS database.

To comply with new regulations, the company needs to automatically rotate the database password for the application service account every 90 days.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an AWS Lambda function to generate new randomized passwords. Configure an Amazon EventBridge rule to invoke the Lambda function every 90 days. Configure the Lambda function to upload a JSON file that contains the new password to the existing EC2 instances by using SSH.
- **(B)** Create a secret for the database credentials in AWS Secrets Manager. Schedule an AWS Lambda function in Secrets Manager to rotate the secret every 90 days. Modify the application to read the database credentials from Secrets Manager. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a new Amazon ECS task to generate new randomized passwords. Configure the task to launch every 90 days. Configure the task to upload a JSON file that contains the new password to the existing EC2 instances by using SSH.
- **(D)** Create a new EC2 instance that runs a cron job every 90 days. Use the cron job to generate new randomized passwords. Configure the new EC2 instance to upload a JSON file that contains the new password to the existing EC2 instances by using SSH.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng chạy trên EC2 trong Auto Scaling group, dùng hardcoded credentials để truy cập RDS database
> - Theo quy định mới, phải tự động xoay vòng (rotate) mật khẩu database cho service account mỗi 90 ngày
> - → Yêu cầu: tự động rotate mật khẩu DB định kỳ 90 ngày

**Phân tích giải pháp tối ưu:**
Create a secret for the database credentials in AWS Secrets Manager. Schedule an AWS Lambda function in Secrets Manager to rotate the secret every 90 days. Modify the application to read the database credentials from Secrets Manager.

AWS Secrets Manager được thiết kế chuyên biệt để lưu trữ và tự động rotate credentials theo lịch định kỳ, có sẵn Lambda rotation function template cho RDS, đáp ứng đúng yêu cầu đề bài

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an AWS Lambda function to generate new randomized passwords. Configure an Amazon EventBridge rule to invoke the Lambda function every 90 days. Configure the Lambda function to upload a JSON file that contains the new password to the existing EC2 instances by using SSH.**:
  Tự xây dựng lại toàn bộ cơ chế rotation (Lambda tự viết + SSH đẩy file JSON đến từng EC2) là tái tạo lại tính năng Secrets Manager đã có sẵn - tăng operational overhead, dễ lỗi, khó bảo trì
  Dùng thẳng Secrets Manager sẽ đỡ tốn công hơn nhiều

- **Create a new Amazon ECS task to generate new randomized passwords. Configure the task to launch every 90 days. Configure the task to upload a JSON file that contains the new password to the existing EC2 instances by using SSH.**:
  Tương tự, tự xây quy trình rotation qua ECS task + SSH, phức tạp và không đồng bộ tự động với database như Secrets Manager, không phải managed solution

- **Create a new EC2 instance that runs a cron job every 90 days. Use the cron job to generate new randomized passwords. Configure the new EC2 instance to upload a JSON file that contains the new password to the existing EC2 instances by using SSH.**:
  Phải duy trì thêm một EC2 instance riêng chỉ để chạy cron job - tăng chi phí, tăng operational overhead, và vẫn phải tự quản lý toàn bộ vòng đời secret thủ công

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Automatically rotate database credentials" / "rotate password every X days" → AWS Secrets Manager

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Set up automatic rotation for Amazon RDS, Amazon Aurora, Amazon Redshift, or Amazon DocumentDB secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_turn-on-for-db.html)
- 🌐 [Using AWS Lambda to rotate secrets](https://docs.aws.amazon.com/prescriptive-guidance/latest/secure-sensitive-data-secrets-manager-terraform/rotate-secrets.html)

</details>

---

<div id="question-50"></div>

### Question 50: Management events in AWS CloudTrail
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company wants to receive an email notification when IAM users are added to or deleted from an AWS account.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Amazon Inspector. Create an Amazon EventBridge rule that responds to Amazon Inspector findings. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.
- **(B)** Enable Amazon GuardDuty. Create an Amazon EventBridge rule that responds to GuardDuty findings. Configure an event pattern of Impact:IAMUser/AnomalousBehavior. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.
- **(C)** Enable Amazon Macie. Create an Amazon EventBridge rule that responds to Macie findings. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.
- **(D)** Enable management events in AWS CloudTrail. Create an Amazon EventBridge rule that responds to AWS API calls through CloudTrail. Configure an event pattern for CreateUser and DeleteUser actions. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Muốn nhận email notification khi IAM users được thêm (add) hoặc xóa (delete) khỏi AWS account
> - → Yêu cầu: cấu hình giải pháp gửi email khi có sự kiện tạo/xóa IAM user

**Phân tích giải pháp tối ưu:**
Enable management events in AWS CloudTrail. Create an Amazon EventBridge rule that responds to AWS API calls through CloudTrail. Configure an event pattern for CreateUser and DeleteUser actions. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.

CloudTrail management events ghi lại các lịch sử thao tác API call trong account, bao gồm cả CreateUser và DeleteUser của IAM - đúng loại sự kiện cần theo dõi

CloudTrail tự động gửi các API call này đến EventBridge, có thể tạo rule với event pattern lọc chính xác 2 action CreateUser và DeleteUser , từ đó có thể set target là Amazon SNS để bắn mail, đáp ứng yêu cầu đề bài

Đây là pattern chuẩn AWS cho việc giám sát các thay đổi IAM: CloudTrail (ghi log) → EventBridge (lọc sự kiện) → SNS (gửi thông báo)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable Amazon Inspector. Create an Amazon EventBridge rule that responds to Amazon Inspector findings. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.**:
  Amazon Inspector là dịch vụ quét lỗ hổng bảo mật (vulnerability) trên EC2/ECR/Lambda, hoàn toàn không liên quan đến việc theo dõi thao tác tạo/xóa IAM user - sai service

- **Enable Amazon GuardDuty. Create an Amazon EventBridge rule that responds to GuardDuty findings. Configure an event pattern of Impact:IAMUser/AnomalousBehavior. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.**:
  GuardDuty phát hiện hành vi bất thường trong account (anomalous behavior) dựa trên machine learning, không phải cơ chế theo dõi trực tiếp API call CreateUser/DeleteUser cụ thể

- **Enable Amazon Macie. Create an Amazon EventBridge rule that responds to Macie findings. Set the target as an Amazon SNS topic. Set the company's email address as a subscriber to the SNS topic.**:
  Amazon Macie chuyên phát hiện dữ liệu nhạy cảm (PII) trong S3, không liên quan gì đến việc theo dõi thao tác quản lý IAM user - sai service hoàn toàn

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Notify khi có thao tác quản lý tài nguyên/IAM cụ thể (CreateUser, DeleteUser...)" → CloudTrail (management events) + EventBridge event pattern theo tên API action + SNS

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon EventBridge events (CloudTrail integration)](https://docs.aws.amazon.com/eventbridge/latest/ref/events-ref-cloudtrail.html)

</details>

---

<div id="question-51"></div>

### Question 51: A Throughput Optimized HDD (st1) Amazon EBS volume with provisioned storage based ...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company wants to migrate an application that processes logs to AWS. Currently, the application runs on an on-premises storage area network (SAN).

The application reads and processes large log files sequentially. The application requires throughput of up to 500 MBps.

A solutions architect needs to migrate the application with minimal change to the application architecture.

Which solution will meet these requirements in the MOST cost-effective way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use a Provisioned IOPS (io1) Amazon EBS volume with 500 MBps Provisioned throughput.
- **(B)** Use a Throughput Optimized HDD (st1) Amazon EBS volume with provisioned storage based on the throughput requirement. `[Đáp án đúng ✅]`
- **(C)** Use a Cold HDD (sc1) Amazon EBS volume with provisioned storage based on the throughput requirement.
- **(D)** Use a General Purpose SSD (gp3) Amazon EBS volume with 500 MBps provisioned throughput.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng đọc và xử lý log files lớn theo tuần tự (sequential) từ SAN on-premises
> - Yêu cầu throughput lên đến 500 MBps
> - Di chuyển với thay đổi tối thiểu kiến trúc ứng dụng
> - → Yêu cầu: chọn loại EBS volume đáp ứng throughput 500 MBps cho workload sequential, MOST cost-effective

**Phân tích giải pháp tối ưu:**
Use a Throughput Optimized HDD (st1) Amazon EBS volume with provisioned storage based on the throughput requirement.

st1 được AWS thiết kế cho large, sequential workloads như big data, data warehouses, log processing

st1 cung cấp throughput tối đa 500 MiB/s mỗi volume, đúng bằng yêu cầu đề bài

Giá HDD-based rẻ hơn đáng kể so với SSD (gp3/io1) cho workload sequential, khi mà không cần IOPS cao

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use a General Purpose SSD (gp3) Amazon EBS volume with 500 MBps provisioned throughput.**:
  gp3 có thể đạt throughput 500 MiB/s nhưng chi phí cao hơn so với st1

- **(C) Use a Cold HDD (sc1) Amazon EBS volume with provisioned storage based on the throughput requirement.**:
  sc1 chỉ đạt throughput tối đa 250 MiB/s, không đáp ứng được yêu cầu 500 MBps

- **(A) Use a Provisioned IOPS (io1) Amazon EBS volume with 500 MBps Provisioned throughput.**:
  Chi phí io1 cao hơn nhiều so với HDD-based volumes cho cùng mức throughput
  io1 phù hợp khi đề bài yêu cầu về storage performance cao

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "large, sequential" + "log processing / big data / data warehouse" → Throughput Optimized HDD (st1)
- Max throughput: st1 = 500 MiB/s, sc1 = 250 MiB/s → nếu đề yêu cầu throughput cao hơn 250 MiB/s, loại ngay sc1
- Nếu đề yêu cầu "MOST cost-effective" + throughput cao cho sequential workload → HDD-based (st1) luôn rẻ hơn SSD-based cùng throughput

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon EBS volume types](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html)
- 🌐 [Amazon EBS Throughput Optimized HDD and Cold HDD volumes](https://docs.aws.amazon.com/ebs/latest/userguide/hdd-vols.html)

</details>

---

<div id="question-52"></div>

### Question 52: S3 Transfer Acceleration on the S3 bucket
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company allows users to upload and store photos through its website. The website has users from all around the world. All images that users upload are stored in a centralized Amazon S3 bucket. The company wants to increase the speed in which its entire user base can upload photos through the website.

What should a solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure S3 Transfer Acceleration on the S3 bucket. Use the S3 Accelerate endpoint to upload files.
- **(B)** Create an Amazon CloudFront distribution. Use the Amazon S3 Standard storage class to store files.
- **(C)** Create an Amazon CloudFront distribution. Configure the distribution settings and origin.
- **(D)** Configure S3 Transfer Acceleration on the S3 bucket. Use the standard S3 endpoint to upload files. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Người dùng upload ảnh từ khắp nơi trên thế giới lên 1 S3 bucket tập trung (centralized)
> - Muốn tăng tốc độ upload cho toàn bộ user base
> - → Yêu cầu: tăng tốc độ upload lên S3 cho user phân tán toàn cầu

**Phân tích giải pháp tối ưu:**
Configure S3 Transfer Acceleration on the S3 bucket. Use the S3 Accelerate endpoint to upload files.

S3 Transfer Acceleration định tuyến traffic qua các CloudFront edge location (điểm cung cấp dịch vụ gần nhất của AWS) trên toàn cầu rồi đi tới S3 qua đường mạng nội bộ tối ưu của AWS, giảm đáng kể thời gian khi upload từ xa

Phải sử dụng đúng Accelerate endpoint (bucket.s3-accelerate.amazonaws.com) - đây là bước bắt buộc, chỉ bật mỗi tính năng thôi sẽ không đủ

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an Amazon CloudFront distribution. Use the Amazon S3 Standard storage class to store files.**:
  CloudFront distribution tối ưu cho phân phối nội dung (liên quan đến việc download/GET), không dùng cho việc tăng tốc upload (PUT/POST) lên S3
  Storage class S3 Standard không liên quan gì đến tốc độ upload

- **Create an Amazon CloudFront distribution. Configure the distribution settings and origin.**:
  Dùng CloudFront, vẫn sai tương tự như đáp án trên

- **Configure S3 Transfer Acceleration on the S3 bucket. Use the standard S3 endpoint to upload files.**:
  Bật Transfer Acceleration nhưng vẫn dùng standard endpoint thì traffic không đi qua CloudFront edge location - không có tác dụng tăng tốc

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "upload speed" + "users worldwide" + "centralized S3 bucket" → S3 Transfer Acceleration
- Luôn nhớ: bật Transfer Acceleration KHÔNG đủ - phải dùng Accelerate endpoint thì mới có tác dụng
- CloudFront tối ưu cho download/phân phối nội dung; Transfer Acceleration tối ưu cho upload lên S3 - đừng nhầm lẫn 2 khái niệm này

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Getting started with Amazon S3 Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transfer-acceleration-getting-started.html)

</details>

---

<div id="question-53"></div>

### Question 53: A mix of On-Demand Instances and Spot Instances
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company hosts a web application on multiple Amazon EC2 instances. The EC2 instances are in an Auto Scaling group that scales in response to user demand. The company wants to optimize costs for the application but does not want to make any long-term commitments.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase a mix of On-Demand Instances and Reserved Instances.
- **(B)** Purchase a mix of On-Demand Instances and Spot Instances. `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Purchase Reserved Instances with a partial upfront payment.
- **(D)** Purchase Dedicated Instances only.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Web app trên EC2 trong Auto Scaling group, scale theo nhu cầu
> - Muốn tối ưu chi phí nhưng không cam kết dài hạn (no long-term commitments)
> - → Yêu cầu: chọn mô hình pricing tối ưu chi phí mà không cần commitment

**Phân tích giải pháp tối ưu:**
Purchase a mix of On-Demand Instances and Spot Instances.

Spot Instances giảm tới 90% chi phí so với On-Demand mà không yêu cầu cam kết nào, khác với Reserved Instances/Savings Plans phải cam kết sử dụng lâu dài, tuy nhiên có tính bất ổn, có thể bị AWS thu hồi bất cứ lúc nào

Kết hợp On-Demand (đảm bảo mức hệ thống ổn định) + Spot (tiết kiệm chi phí khi cần thêm capacity) là lựa chọn phù hợp với ASG scale theo traffic

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Purchase Dedicated Instances only.**:
  Dedicated Instances là instance với phần cứng dành riêng, đắt hơn nhiều so với instances thông thường, không tối ưu chi phí; mục đích của Dedicated Instances là cô lập hệ thống trên phần cứng dành riêng để đảm bảo tuân thủ / quy định về security, không phải tiết kiệm chi phí

- **(C) Purchase Reserved Instances with a partial upfront payment.**:
  Reserved Instances luôn yêu cầu cam kết sử dụng lâu dài (thường 1 hoặc 3 năm) - vi phạm trực tiếp yêu cầu "does not want to make any long-term commitments"

- **(A) Purchase a mix of On-Demand Instances and Reserved Instances.**:
  Vẫn chứa Reserved Instances → vẫn có phần cam kết dài hạn, không thỏa mãn yêu cầu

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "no long-term commitment" + "optimize cost" → loại ngay Reserved Instances/Savings Plans
- Spot Instances: tiết kiệm tới 90%, không cam kết, nhưng có thể bị thu hồi (interruption) - phù hợp workload chịu được gián đoạn hoặc dùng kết hợp On-Demand làm baseline

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Overview of Amazon EC2 Spot Instances](https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-leveraging-ec2-spot-instances/cost-optimization-leveraging-ec2-spot-instances.html)

</details>

---

<div id="question-54"></div>

### Question 54: A container for the job
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company runs a critical data analysis job each week before the first day of the work week. The job requires at least 1 hour to complete the analysis. The job is stateful and cannot tolerate interruptions. The company needs a solution to run the job on AWS.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an Auto Scaling group of Amazon EC2 Spot Instances that run Amazon Linux. Configure a crontab entry on the instances to run the analysis.
- **(B)** Configure an AWS DataSync task to run the job. Configure a cron expression to run the task on a schedule.
- **(C)** Configure the job to run in an AWS Lambda function. Create a scheduled rule in Amazon EventBridge to invoke the Lambda function.
- **(D)** Create a container for the job. Schedule the job to run as an AWS Fargate task on an Amazon ECS cluster by using Amazon EventBridge Scheduler. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Job phân tích dữ liệu chạy hàng tuần, cần ít nhất 1 giờ để hoàn thành
> - Job là stateful và không chịu được gián đoạn (cannot tolerate interruptions)
> - → Yêu cầu: chọn giải pháp chạy job theo lịch, đảm bảo không bị gián đoạn giữa chừng

**Phân tích giải pháp tối ưu:**
Create a container for the job. Schedule the job to run as an AWS Fargate task on an Amazon ECS cluster by using Amazon EventBridge Scheduler.

AWS Fargate task chạy container không giới hạn 15 phút như Lambda, phù hợp job cần ít nhất 1 giờ

Fargate có tính ổn định, không bị gián đoạn giữa chừng như Spot Instances - đáp ứng yêu cầu "cannot tolerate interruptions"

EventBridge Scheduler là dịch vụ fully managed để đặt lịch chạy job, phù hợp yêu cầu đề bài


Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure the job to run in an AWS Lambda function. Create a scheduled rule in Amazon EventBridge to invoke the Lambda function.**:
  Lambda có giới hạn timeout tối đa 15 phút, trong khi job yêu cầu ít nhất 1 giờ - không khả thi về mặt kỹ thuật

- **Configure an Auto Scaling group of Amazon EC2 Spot Instances that run Amazon Linux. Configure a crontab entry on the instances to run the analysis.**:
  Spot Instances có thể bị thu hồi (interrupt) bất cứ lúc nào - vi phạm trực tiếp yêu cầu "cannot tolerate interruptions"

- **Configure an AWS DataSync task to run the job. Configure a cron expression to run the task on a schedule.**:
  DataSync là dịch vụ di chuyển/đồng bộ dữ liệu, không phải công cụ chạy job - sai service cho use case này

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đối với các câu hỏi về việc chạy job thì các solution thường nghĩ đến đó là AWS Lambda, ECS Fargate, Batch, EC2 Spot Instances.
- Đầu tiên cần xem thời gian chạy job là bao lâu, nếu trên 15 phút sẽ loại ngay Lambda, ưu tiên chọn các solution managed, serverless như ECS Fargate, Batch.
- Nếu thời gian dưới 15 phút thì thường sẽ lựa chọn Lambda
- Nếu job cần chạy theo lịch thì kết hợp thêm EventBridge

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Using Amazon EventBridge Scheduler to schedule Amazon ECS tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/tasks-scheduled-eventbridge-scheduler.html)
- 🌐 [Configure Lambda function timeout](https://docs.aws.amazon.com/lambda/latest/dg/configuration-timeout.html)

</details>

---

<div id="question-55"></div>

### Question 55: A new AWS account and enable AWS Organizations and From the management account in ...
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A company develops a multi-tenant application that runs on Amazon EC2 instances in an AWS account. The company performs a security audit. The security audit identifies that the company must separate tenants into dedicated AWS accounts to reduce the potential impact of exploited vulnerabilities across customers.

The company recently purchased a Savings Plan for the account where the application runs. The company wants to use the discounts in all the accounts where the application will run.

Which combination of steps will meet these requirements while following AWS Well-Architected design patterns? (Select TWO.)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new AWS account and enable AWS Organizations. Invite the existing AWS account to join the organization. Create the required new AWS accounts from the Organizations management console.
- **(B)** From the management account in the AWS Management Console, turn on discount sharing from the billing preferences section. `[Đáp án đúng ✅]`
- **(C)** From the AWS Organizations management account, use AWS Resource Access Manager (AWS RAM) to share the Savings Plan with other accounts.
- **(D)** From the AWS Management Console of the account that purchased the existing Savings Plan, turn on discount sharing from the billing preferences section. Include all accounts.
- **(E)** Create a new AWS account and enable AWS Organizations. Invite the existing AWS account to join the organization. Create new AWS accounts from the management account. `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng multi-tenant hiện chạy trong 1 AWS account, vừa mua Savings Plan cho account này
> - Cần tách tenant ra các account riêng (dedicated AWS accounts) để giảm ảnh hưởng khi bị hack / khai thác lỗ hổng
> - Muốn áp dụng discount của Savings Plan cho tất cả account mới
> - → Yêu cầu: thiết kế multi-account theo AWS Well-Architected, đồng thời chia sẻ được discount của Savings Plan hiện có

**Phân tích giải pháp tối ưu:**
Create a new AWS account and enable AWS Organizations. Invite the existing AWS account to join the organization. Create the required new AWS accounts from the Organizations management console.

Tạo Organization . Mời thêm các account khác & tạo các account mới trong Organization để quản lý tập trung.

Tạo 1 account mới làm management account là bước đầu cần thiết trong kiến trúc quản lý multi-account, mời account hiện có (đã mua Savings Plan) tham gia làm member account, sau đó tạo các account mới cho từng tenant thông qua AWS Organizations có consolidated billing (hoá đơn tổng hợp) và có thể chia sẻ discount giữa các account này

From the management account in the AWS Management Console, turn on discount sharing from the billing preferences section.

Về mặt kỹ thuật của AWS, chỉ management account của AWS Organizations mới có quyền bật/tắt discount sharing trong billing preferences, đây là đáp án đúng

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **From the AWS Management Console of the account that purchased the existing Savings Plan, turn on discount sharing from the billing preferences section. Include all accounts.**:
  Discount sharing preferences chỉ có thể cấu hình từ management account của tổ chức, không phải từ account (member) đã mua Savings Plan

- **From the AWS Organizations management account, use AWS Resource Access Manager (AWS RAM) to share the Savings Plan with other accounts.**:
  AWS RAM dùng để chia sẻ tài nguyên (subnet, Transit Gateway attachment, license...) giữa các account, không phải cơ chế chia sẻ discount của Savings Plan - sai service

- **Create a new AWS account and enable AWS Organizations. Invite the existing AWS account to join the organization. Create new AWS accounts from the management account.**:
  Về bản chất gần giống đáp án đúng ở trên (chỉ khác cách diễn đạt "from the management account" so với "from the Organizations management console") - chọn phương án nhấn mạnh dùng đúng dịch vụ AWS Organizations để tạo account theo best practice

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Savings Plan discount sharing" → luôn cấu hình từ management account, không phải từ account đã mua SP
- "tách tenant thành account riêng"→ dùng AWS Organizations để quản lý multi-account

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Reserved Instances and Savings Plans discount sharing](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ri-turn-off.html)
- 🌐 [How is the pricing benefit of a Savings Plan applied across an organization's consolidated bill?](https://repost.aws/knowledge-center/savings-plans-consolidated-billing)

</details>

---

<div id="question-56"></div>

### Question 56: AWS DMS to migrate the database to an Amazon Aurora PostgreSQL database
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company hosts a PostgreSQL database on an Amazon EC2 instance. Database usage has increased recently. Users are experiencing higher latency during queries on the database.

The company needs to update the database to reduce latency for users. The new solution must achieve a recovery time objective (RTO) and a recovery point objective (RPO) of less than 5 minutes. The company also wants to deploy the database to multiple AWS Regions to meet new availability requirements.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS DMS to migrate the database to Amazon RDS for PostgreSQL. Create cross-Region read replicas in the Regions where most users are located. In the event of a database failure, manually promote a read replica to become the primary database.
- **(B)** Use AWS Elastic Disaster Recovery service to replicate the EC2 instance to a second Region. In the event of a database failure, use the Elastic Disaster Recovery dashboard to perform a failover.
- **(C)** Use AWS DMS to migrate the database to an Amazon Aurora PostgreSQL database. Configure the Aurora database as a global database. Set the Aurora parameter group RPO setting to 60 seconds. In the event of a database failure, promote a secondary database in a second Region automatically. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use AWS Backup to automatically create backups of the EC2 instance. In the event of a database failure, use the backups to restore the EC2 instance to a second Region.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Database PostgreSQL tự quản lý trên EC2, đang bị tăng latency khi query do tải tăng
> - Yêu cầu RTO và RPO dưới 5 phút
> - Cần deploy multi-Region để đáp ứng yêu cầu availability mới
> - → Yêu cầu: chọn giải pháp giảm latency + đạt RTO/RPO <5 phút + multi-Region

**Phân tích giải pháp tối ưu:**
Use AWS DMS to migrate the database to an Amazon Aurora PostgreSQL database. Configure the Aurora database as a global database. Set the Aurora parameter group RPO setting to 60 seconds. In the event of a database failure, promote a secondary database in a second Region automatically.

Aurora Global Database cho phép triển khai Aurora trên multi-region, 1 primary Region ghi và nhiều secondary Region đọc với độ trễ replication thường dưới 1 giây, giải quyết bài toán multi-Region

Set parameter group RPO = 60 seconds giúp đạt RPO = 60s, đáp ứng yêu cầu RPO dưới 5 phút.

Khi sự cố xảy ra, có thể thực hiện promote để chuyển Aurora trên region phụ thành primary, việc promote này tốn dưới 5 phút, đáp ứng yêu cầu RTO dưới 5 phút

Migrate từ EC2 self-managed sang Aurora (fully managed, storage tối ưu hiệu năng) cũng trực tiếp giúp giảm latency so với PostgreSQL tự cài trên EC2

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Use AWS Backup to automatically create backups of the EC2 instance. In the event of a database failure, use the backups to restore the EC2 instance to a second Region.**:
  Restore từ backup luôn mất nhiều thời gian hơn 5 phút (RTO cao) - không đáp ứng yêu cầu

- **(B) Use AWS Elastic Disaster Recovery service to replicate the EC2 instance to a second Region. In the event of a database failure, use the Elastic Disaster Recovery dashboard to perform a failover.**:
  AWS DRS có thể sử dụng như một solution disaster recovery nhưng không giải quyết vấn đề giảm latency ban đầu của đề (vẫn là PostgreSQL tự quản lý trên EC2, dùng DRS chỉ tạo thêm replication chứ không cải thiện hiệu năng)

- **(A) Use AWS DMS to migrate the database to Amazon RDS for PostgreSQL. Create cross-Region read replicas in the Regions where most users are located. In the event of a database failure, manually promote a read replica to become the primary database.**:
  Promote thủ công (manually) read replica khi failover sẽ tốn nhiều thời gian hơn 5 phút do cần thao tác của con người - không đáp ứng RTO yêu cầu, khác với Aurora Global Database có managed automatic failover

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "RTO/RPO dưới vài phút" + "multi-Region" + "automatic" → Aurora Global Database với managed failover, loại ngay giải pháp cần promote thủ công
- "manually promote" → luôn làm tăng RTO, thường không đạt yêu cầu RTO/RPO nghiêm ngặt
- AWS Elastic Disaster Recovery phù hợp cho DR ở mức hạ tầng/server, không giải quyết bài toán tối ưu hiệu năng database
- "Giảm latency" cho self-managed DB trên EC2 → cân nhắc migrate sang managed service (Aurora/RDS) thay vì chỉ backup/replicate nguyên trạng

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Using switchover or failover in Amazon Aurora Global Database](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database-disaster-recovery.html)
- 🌐 [Amazon Aurora Global Database execution block (RPO 0 switchover)](https://docs.aws.amazon.com/r53recovery/latest/dg/aurora-global-database-block.html)

</details>

---

<div id="question-57"></div>

### Question 57: An AWS Lambda function to access the RDS database
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A company runs a Python script on an employee's laptop to transform and update data that is stored in an Amazon RDS database. The company wants to migrate the transformation workload to the AWS Cloud. The solution must run the Python script every 30 minutes. Each run of the script takes approximately 20 seconds to update the data in the RDS database.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure an AWS Lambda function to access the RDS database. Configure the Lambda function with provisioned concurrency. Use an Amazon API Gateway HTTP API to invoke the Lambda function.
- **(B)** Configure an AWS Lambda function to access the RDS database. Use Amazon EventBridge Scheduler to invoke the Lambda function. `[Đáp án đúng ✅]`
- **(C)** Launch an Amazon EC2 Spot Instance to run the Python script. Configure the EC2 instance to access the RDS database. Configure a cron job to invoke the Python script.
- **(D)** Launch an Amazon EC2 On-Demand Instance to run the Python script. Configure the EC2 instance to access the RDS database. Configure a cron job to invoke the Python script.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Script Python chạy trên laptop nhân viên, cập nhật dữ liệu vào RDS
> - Cần chạy mỗi 30 phút, mỗi lần chạy chỉ mất ~20 giây
> - → Yêu cầu: migrate script lên AWS với chi phí thấp nhất (MOST cost-effectively) cho tác vụ ngắn, tần suất thấp

**Phân tích giải pháp tối ưu:**
Configure an AWS Lambda function to access the RDS database. Use Amazon EventBridge Scheduler to invoke the Lambda function.

Lambda tính phí theo thời gian thực thi thực tế (chỉ ~20 giây mỗi 30 phút) - rẻ hơn rất nhiều so với việc chạy 1 EC2 instance 24/7 chỉ để xử lý vài giây mỗi lần

EventBridge Scheduler là dịch vụ fully managed, cho phép đặt lịch để trigger Lambda (rate expression mỗi 30 phút)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(D) Launch an Amazon EC2 On-Demand Instance to run the Python script. Configure the EC2 instance to access the RDS database. Configure a cron job to invoke the Python script.**:
  EC2 instance phải chạy liên tục 24/7 dù chỉ dùng 20 giây mỗi 30 phút → lãng phí chi phí đáng kể so với Lambda

- **(C) Launch an Amazon EC2 Spot Instance to run the Python script. Configure the EC2 instance to access the RDS database. Configure a cron job to invoke the Python script.**:
  Vẫn phải duy trì instance chạy liên tục (dù rẻ hơn On-Demand), và có rủi ro bị thu hồi giữa chừng - vẫn kém tối ưu chi phí hơn Lambda cho tác vụ ngắn, không liên tục

- **Configure an AWS Lambda function to access the RDS database. Configure the Lambda function with provisioned concurrency. Use an Amazon API Gateway HTTP API to invoke the Lambda function.**:
  Provisioned concurrency là tính năng trả phí giúp khởi tạo sẵn môi trường thực thi cho Lambda, giúp nó có thể chạy luôn khi có request mà không bị độ trễ của ColdStart - tuy nhiên không cần thiết cho tác vụ chạy theo lịch, không có yêu cầu độ trễ thấp tức thời
  API Gateway không cần thiết vì đây là tác vụ theo lịch (scheduled), không phải HTTP request - thêm chi phí và độ phức tạp không cần thiết

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- Đối với các câu hỏi về việc chạy job thì các solution thường nghĩ đến đó là AWS Lambda, ECS Fargate, Batch, EC2 Spot Instances.
- Đầu tiên cần xem thời gian chạy job là bao lâu, nếu trên 15 phút sẽ loại ngay Lambda, ưu tiên chọn các solution managed, serverless như ECS Fargate, Batch.
- Nếu thời gian dưới 15 phút thì thường sẽ lựa chọn Lambda
- Nếu job cần chạy theo lịch thì kết hợp thêm EventBridge

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Invoke a Lambda function on a schedule](https://docs.aws.amazon.com/lambda/latest/dg/with-eventbridge-scheduler.html)
- 🌐 [Configure Lambda function timeout](https://docs.aws.amazon.com/lambda/latest/dg/configuration-timeout.html)

</details>

---

<div id="question-58"></div>

### Question 58: A read replica of the DB instance
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company manages an application that stores data on an Amazon RDS for PostgreSQL Multi-AZ DB instance. High traffic on the application is causing increased latency for many read queries.

A solutions architect must improve the performance of the application.

Which solution will meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Enable Amazon RDS Performance Insights. Configure storage capacity to scale automatically.
- **(B)** Configure the DB instance to use DynamoDB Accelerator (DAX).
- **(C)** Create a read replica of the DB instance. Serve read traffic from the read replica. `[Đáp án đúng ✅]`
- **(D)** Use Amazon Data Firehose between the application and Amazon RDS to increase the concurrency of database requests.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - RDS for PostgreSQL Multi-AZ, traffic cao gây tăng latency cho read queries
> - → Yêu cầu: cải thiện hiệu năng cho read queries

**Phân tích giải pháp tối ưu:**
Create a read replica of the DB instance. Serve read traffic from the read replica.

Tạo thêm read replica giúp giảm tải bớt read traffic cho primary instance

Đây là giải pháp chuẩn của AWS cho bài toán "read-heavy workload gây latency" mà không cần thay đổi cấu trúc ứng dụng nhiều

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable Amazon RDS Performance Insights. Configure storage capacity to scale automatically.**:
  Performance Insights chỉ là công cụ giám sát (monitoring), không tự cải thiện hiệu năng
  Storage autoscaling giải quyết vấn đề hết dung lượng storage, không liên quan đến latency của read query

- **Configure the DB instance to use DynamoDB Accelerator (DAX).**:
  DAX chỉ hoạt động với DynamoDB, không thể gắn vào RDS - sai service hoàn toàn

- **(D) Use Amazon Data Firehose between the application and Amazon RDS to increase the concurrency of database requests.**:
  Data Firehose là dịch vụ truyền dữ liệu vào S3/Redshift/OpenSearch..., không phải giải pháp tăng concurrency truy vấn RDS - sai service, không có ý nghĩa kỹ thuật trong ngữ cảnh này

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "High read traffic latency" + RDS → Read Replica (offload read traffic)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Working with read replicas for Amazon RDS for PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PostgreSQL.Replication.ReadReplicas.html)

</details>

---

<div id="question-59"></div>

### Question 59: The application to an AWS Lambda function
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company is building a new application that will have an unpredictable load. The application will use an Amazon API Gateway REST API to accept traffic and forward the traffic to the compute component for processing. The application requires a relational database to store transactions.

The company wants to ensure a predictable level of database performance for read and write operations. The company wants to ensure database performance regardless of the number of connections from the compute component.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the application to Amazon EC2 instances. Use Amazon DynamoDB as the database. Enable DynamoDB Accelerator (DAX). Configure the instances to read from DAX.
- **(B)** Deploy the application to an AWS Lambda function. Use Amazon RDS for PostgreSQL as the database. Create an Amazon ElastiCache (Valkey) cache. Configure the function to read from the cache.
- **(C)** Deploy the application to an AWS Lambda function. Configure Amazon RDS as the database for the application. Create an Amazon RDS proxy. Configure the Lambda function to use the proxy endpoint. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Deploy the application to an Amazon ECS container that uses AWS Fargate. Configure Amazon RDS for PostgreSQL as the database. Deploy Amazon RDS read replicas in the same AWS Region.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng dùng API Gateway REST API, tải không thể dự đoán (unpredictable load)
> - Cần database quan hệ (relational), hiệu năng ổn định, có thể đáp ứng bất kể số lượng connection từ compute component
> - → Yêu cầu: đảm bảo hiệu năng database ổn định bất kể số lượng connection

**Phân tích giải pháp tối ưu:**
Deploy the application to an AWS Lambda function. Configure Amazon RDS as the database for the application. Create an Amazon RDS proxy. Configure the Lambda function to use the proxy endpoint.

RDS Proxy giúp cân bằng tải số lượng connection cho Lambda khi kết nối đến RDS, giúp tránh được vấn đề tràn connection - đáp ứng yêu cầu đề bài về khả năng có thể đáp ứng được bất kể số lượng connection

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy the application to Amazon EC2 instances. Use Amazon DynamoDB as the database. Enable DynamoDB Accelerator (DAX). Configure the instances to read from DAX.**:
  Đề yêu cầu relational database, DynamoDB là NoSQL - sai loại database ngay từ đầu

- **Deploy the application to an AWS Lambda function. Use Amazon RDS for PostgreSQL as the database. Create an Amazon ElastiCache (Valkey) cache. Configure the function to read from the cache.**:
  Caching giúp giảm số lượng query, nhưng không giải quyết vấn đề số lượng connection tới RDS khi Lambda scale mạnh (cache miss hoặc write vẫn tạo connection trực tiếp tới DB)

- **Deploy the application to an Amazon ECS container that uses AWS Fargate. Configure Amazon RDS for PostgreSQL as the database. Deploy Amazon RDS read replicas in the same AWS Region.**:
  Read replicas giúp scale read traffic, nhưng không trực tiếp giải quyết vấn đề quản lý số lượng connection biến động khi tải không dự đoán được; ECS Fargate cũng không phải kiến trúc phù hợp với API Gateway như Lambda

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Regardless of the number of connections" / "predictable database performance despite unpredictable load" → Amazon RDS Proxy
- Đề yêu cầu "relational database" → loại ngay các đáp án dùng DynamoDB/NoSQL

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Using AWS Lambda with Amazon RDS](https://docs.aws.amazon.com/lambda/latest/dg/services-rds.html)
- 🌐 [RDS Proxy concepts and terminology](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-proxy.howitworks.html)

</details>

---

<div id="question-60"></div>

### Question 60: Amazon ElastiCache (Redis OSS) and cache the data for the application
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An application is experiencing performance issues based on increased demand. This increased demand is on read-only historical records pulled from an Amazon RDS-hosted database with custom views and queries. A solutions architect must improve performance without changing the database structure.

Which approach will improve performance and MINIMIZE management overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon DynamoDB, move all the data, and point to DynamoDB.
- **(B)** Deploy Amazon DynamoDB Accelerator (DAX) on Amazon RDS to improve cache performance.
- **(C)** Deploy Amazon ElastiCache (Redis OSS) and cache the data for the application. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Deploy Memcached on Amazon EC2 and cache the data for the application.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng đọc read-only historical records từ RDS, dùng custom views/queries
> - Yêu cầu cải thiện hiệu năng không thay đổi cấu trúc database, giảm thiểu management overhead
> - → Yêu cầu: tăng hiệu năng đọc dữ liệu mà không đổi schema, ít vận hành nhất

**Phân tích giải pháp tối ưu:**
Deploy Amazon ElastiCache (Redis OSS) and cache the data for the application.

ElastiCache là dịch vụ in-memory database managed hoàn toàn, đáp ứng yêu cầu ít effort vận hành

Phù hợp cho use case cần caching các record từ RDS

Việc xử lý cache data sẽ thực hiện ở tầng application, không cần thay đổi cấu trúc database RDS hiện có, đáp ứng yêu cầu đề bài

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon DynamoDB, move all the data, and point to DynamoDB.**:
  Phải di chuyển toàn bộ dữ liệu và viết lại logic truy vấn sang NoSQL - vi phạm trực tiếp yêu cầu "without changing the database structure", tốn nhiều effort/overhead hơn hẳn

- **Deploy Memcached on Amazon EC2 and cache the data for the application.**:
  Memcached tự cài trên EC2 nghĩa là công ty phải tự quản lý, patch, scale server - tăng management overhead so với dịch vụ managed như ElastiCache

- **Deploy Amazon DynamoDB Accelerator (DAX) on Amazon RDS to improve cache performance.**:
  DAX chỉ tương thích với DynamoDB, không thể gắn vào RDS - phương án này không tồn tại về mặt kỹ thuật

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Improve read performance" + "without changing database structure" + "minimize management overhead" → ElastiCache (managed service)
- Solution cần ít effort vận hành thì các đáp án sẽ không ưu tiên chọn EC2

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon ElastiCache (Performance at Scale whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/scale-performance-elasticache/scale-performance-elasticache.html)
- 🌐 [Amazon ElastiCache overview](https://docs.aws.amazon.com/whitepapers/latest/choosing-an-aws-nosql-database/amazon-elasticache.html)

</details>

---

<div id="question-61"></div>

### Question 61: A Network Load Balancer on AWS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: - | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company needs to run its external website on Amazon EC2 instances and on-premises virtualized servers. The AWS environment has a 1 GB AWS Direct Connect connection to the data center. The application has IP addresses that will not change. The on-premises and AWS servers are able to restart themselves while maintaining the same IP address if a failure occurs. Some website users have to add their vendors to an allow list, so the solution must have a fixed IP address. The company needs a solution with the lowest operational overhead to handle this split traffic.

What should a solutions architect do to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon API Gateway to direct traffic to the on-premises and AWS IP addresses based on the header of the request.
- **(B)** Deploy an Application Load Balancer on AWS. Register the on-premises and AWS IP addresses with the target group.
- **(C)** Deploy a Network Load Balancer on AWS. Create target groups for the on-premises and AWS IP addresses. `[Đáp án đúng ✅]`
- **(D)** Deploy an Amazon Route 53 Resolver with rules pointing to the on-premises and AWS IP addresses.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website chạy trên EC2 + on-premises, kết nối qua Direct Connect
> - IP address không đổi (will not change), cần fix cứng IP address để vendor bên ngoài có thể đăng ký các IP này vào allow list
> - Cần giải pháp xử lý traffic giữa on-premises và AWS với lowest operational overhead
> - → Yêu cầu: load balancer cung cấp fixed/static IP, hỗ trợ target hybrid (on-prem + AWS)

**Phân tích giải pháp tối ưu:**
Deploy a Network Load Balancer on AWS. Create target groups for the on-premises and AWS IP addresses.

NLB sử dụng 1 static IP cho mỗi Availability Zone/subnet, các vendor bên ngoài có thể dùng IP này đăng ký vào allow list

NLB hỗ trợ IP address làm target, có thể trỏ tới cả EC2 instance trong VPC lẫn địa chỉ IP on-premises qua Direct Connect trong cùng 1 target group - đáp ứng "split traffic"

Là dịch vụ managed, tốn ít effort vận hành

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an Amazon Route 53 Resolver with rules pointing to the on-premises and AWS IP addresses.**:
  Route 53 Resolver dùng để phân giải DNS (forward DNS query giữa VPC và on-premises), không phải giải pháp load balancing/cung cấp IP cố định cho client truy cập website

- **Deploy an Application Load Balancer on AWS. Register the on-premises and AWS IP addresses with the target group.**:
  ALB dùng DNS endpoint, không có địa chỉ IP public cố định như NLB, không đáp ứng yêu cầu đề bài

- **Deploy Amazon API Gateway to direct traffic to the on-premises and AWS IP addresses based on the header of the request.**:
  API Gateway dùng DNS endpoint, không có địa chỉ IP public cố định như NLB

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "fixed/static IP address" cho load balancer → luôn nghĩ đến Network Load Balancer (NLB)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Network Load Balancer static IP support](https://aws.amazon.com/elasticloadbalancing/network-load-balancer/)
- 🌐 [Network Traffic Distribution - Elastic Load Balancing FAQs (hybrid load balancing)](https://aws.amazon.com/elasticloadbalancing/faqs/)

</details>

---

<div id="question-62"></div>

### Question 62: The existing stream in Kinesis Data Streams to Amazon Managed Service for Apache F...
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company hosts an industrial control application that receives sensor input through Amazon Kinesis Data Streams. The application needs to support new sensors for real-time anomaly detection in monitored equipment.

The company wants to integrate new sensors in a loosely-coupled, fully managed, and serverless way. The company cannot modify the application code.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Forward the existing stream in Kinesis Data Streams to Amazon Managed Service for Apache Flink for anomaly detection. Use a second stream in Kinesis Data Streams to send the Flink output to the application. `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon Data Firehose to stream data to Amazon S3. Use Amazon Redshift Spectrum to perform anomaly detection on the S3 data. Use S3 Event Notifications to invoke an AWS Lambda function that sends analyzed data to the application through a second stream in Kinesis Data Streams.
- **(C)** Configure an Amazon ECS task that uses Amazon EC2 instances to consume data from the data stream and to perform anomaly detection. Create a second stream in Kinesis Data Streams to send data from the containers to the application.
- **(D)** Configure Amazon EC2 instances in an Auto Scaling group to consume data from the data stream and to perform anomaly detection. Create a second stream in Kinesis Data Streams to send data from the EC2 instances to the application.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Ứng dụng nhận dữ liệu cảm biến qua Kinesis Data Streams, cần anomaly detection real-time
> - Tích hợp sensor mới theo hướng loosely-coupled, fully managed, serverless
> - Không được sửa code ứng dụng hiện tại
> - → Yêu cầu: thêm anomaly detection real-time, serverless, không đổi code ứng dụng gốc

**Phân tích giải pháp tối ưu:**
Forward the existing stream in Kinesis Data Streams to Amazon Managed Service for Apache Flink for anomaly detection. Use a second stream in Kinesis Data Streams to send the Flink output to the application.

Amazon Managed Service for Apache Flink là dịch vụ fully managed, serverless, tích hợp trực tiếp để xử lý/phân tích anomaly trên stream dữ liệu real-time

Dùng stream Kinesis thứ hai để đưa kết quả về ứng dụng gốc → ứng dụng vẫn nhận dữ liệu qua Kinesis như cũ, đáp ứng yêu cầu không cần sửa code

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Use Amazon Data Firehose to stream data to Amazon S3. Use Amazon Redshift Spectrum to perform anomaly detection on the S3 data. Use S3 Event Notifications to invoke an AWS Lambda function that sends analyzed data to the application through a second stream in Kinesis Data Streams.**:
  Luồng xử lý qua Firehose → S3 → Redshift Spectrum → Lambda có độ trễ cao, không đáp ứng "real-time anomaly detection"; kiến trúc phức tạp, không tối ưu vận hành

- **Configure Amazon EC2 instances in an Auto Scaling group to consume data from the data stream and to perform anomaly detection. Create a second stream in Kinesis Data Streams to send data from the EC2 instances to the application.**:
  Dùng EC2 tự quản lý không phải serverless/fully managed - vi phạm trực tiếp yêu cầu

- **Configure an Amazon ECS task that uses Amazon EC2 instances to consume data from the data stream and to perform anomaly detection. Create a second stream in Kinesis Data Streams to send data from the containers to the application.**:
  ECS trên EC2 (không phải Fargate) vẫn yêu cầu quản lý EC2 instance - không phải serverless, tương tự lỗi ở đáp án trên

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Real-time anomaly detection" trên Kinesis Data Streams + "fully managed/serverless" → Amazon Managed Service for Apache Flink

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Develop consumers using Amazon Managed Service for Apache Flink](https://docs.aws.amazon.com/streams/latest/dev/kda-consumer.html)
- 🌐 [Example: Detecting Data Anomalies on a Stream (RANDOM_CUT_FOREST Function)](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/app-anomaly-detection.html)

</details>

---

<div id="question-63"></div>

### Question 63: The website to an Amazon S3 bucket
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company hosts a website on Amazon EC2 instances behind an Application Load Balancer (ALB). The website serves static content. Website traffic is increasing. The company wants to minimize the website hosting costs.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Move the website to AWS Amplify. Configure EC2 instances to cache the website.
- **(B)** Move the website to AWS Amplify. Configure an ALB to resolve to the Amplify website.
- **(C)** Move the website to an Amazon S3 bucket. Configure an Amazon ElastiCache cluster for the S3 bucket. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Move the website to an Amazon S3 bucket. Configure an Amazon CloudFront distribution for the S3 bucket.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Website phục vụ nội dung tĩnh (static content), hiện chạy trên EC2 sau ALB
> - Traffic đang tăng, muốn giảm chi phí hosting
> - → Yêu cầu: giảm chi phí hosting cho website nội dung tĩnh

**Phân tích giải pháp tối ưu:**
Move the website to an Amazon S3 bucket. Configure an Amazon CloudFront distribution for the S3 bucket.

S3 lưu trữ static content với chi phí thấp hơn nhiều so với chạy EC2 + ALB 24/7, không cần quản lý server

CloudFront cache nội dung tại edge location, giúp delivery content đến người dùng nhanh hơn, tối ưu độ trễ

S3 + CloudFront là lựa chọn phù hợp cho bài toán host web tĩnh

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(C) Move the website to an Amazon S3 bucket. Configure an Amazon ElastiCache cluster for the S3 bucket.**:
  ElastiCache là cache cho database/ứng dụng có compute layer, không áp dụng được cho việc phục vụ static content trực tiếp từ S3 - kết hợp không có ý nghĩa kỹ thuật

- **(B) Move the website to AWS Amplify. Configure an ALB to resolve to the Amplify website.**:
  AWS Amplify đã tự bao gồm CDN/hosting cho static content - thêm ALB phía trước là dư thừa, tốn thêm chi phí không cần thiết

- **(A) Move the website to AWS Amplify. Configure EC2 instances to cache the website.**:
  Vẫn giữ lại EC2 instances để cache - đi ngược lại mục tiêu loại bỏ chi phí vận hành server, không tối ưu chi phí

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Static content" → S3 + CloudFront, loại bỏ EC2/ALB

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Amazon S3 + Amazon CloudFront: A Match Made in the Cloud](https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/)
- 🌐 [Tutorial: Configuring a static website on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)

</details>

---

<div id="question-64"></div>

### Question 64: A snapshot of the existing Aurora PostgreSQL DB cluster
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company uses an Amazon Aurora PostgreSQL DB cluster to store structured sensitive data about its customers. To meet compliance requirements, the company introduced a policy that all the customer-related data must be encrypted at rest.

Which solution will ensure that the company is compliant with the policy with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create a new Aurora PostgreSQL DB cluster. Enable encryption by using an AWS KMS key during database creation. Manually migrate the data from the old database to the new database.
- **(B)** Modify the existing Aurora PostgreSQL DB cluster to enable encryption at rest by using an AWS KMS key. Use the encrypted cluster to store the customer data.
- **(C)** Create a snapshot of the existing Aurora PostgreSQL DB cluster. Enable encryption by using an AWS KMS key. Restore the snapshot to a new Aurora PostgreSQL DB cluster. `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create a new Aurora PostgreSQL DB cluster. Enable encryption by using server-side encryption (SSE) during database creation. Migrate the data from the old database to the new database.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Aurora PostgreSQL DB cluster hiện chưa mã hoá, lưu dữ liệu khách hàng nhạy cảm
> - Yêu cầu tuân thủ: tất cả dữ liệu phải được mã hoá at rest
> - → Yêu cầu: mã hoá cluster hiện có với LEAST operational overhead

**Phân tích giải pháp tối ưu:**
Create a snapshot of the existing Aurora PostgreSQL DB cluster. Enable encryption by using an AWS KMS key. Restore the snapshot to a new Aurora PostgreSQL DB cluster.

AWS không cho phép bật mã hoá trực tiếp trên cluster đang chạy và không thể convert cluster chưa mã hoá thành đã mã hoá tại chỗ - đây là giới hạn kỹ thuật cứng của Aurora

Quy trình chuẩn AWS khuyến nghị: tạo snapshot từ cluster chưa mã hoá → restore snapshot đó vào cluster mới, chỉ định KMS key lúc restore → cluster mới tự động được mã hoá - đây là cách ít effort/overhead nhất vì AWS xử lý việc copy dữ liệu tự động qua cơ chế snapshot/restore


Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **(B) Modify the existing Aurora PostgreSQL DB cluster to enable encryption at rest by using an AWS KMS key. Use the encrypted cluster to store the customer data.**:
  Không khả thi về mặt kỹ thuật - AWS Aurora không hỗ trợ bật encryption trực tiếp (modify) trên cluster đang tồn tại mà không mã hoá

- **Create a new Aurora PostgreSQL DB cluster. Enable encryption by using an AWS KMS key during database creation. Manually migrate the data from the old database to the new database.**:
  Về mặt kỹ thuật khả thi, nhưng migrate thủ công dữ liệu (export/import ở tầng ứng dụng, dùng DMS,...) tốn nhiều operational overhead hơn hẳn so với dùng cơ chế snapshot/restore có sẵn của Aurora

- **Create a new Aurora PostgreSQL DB cluster. Enable encryption by using server-side encryption (SSE) during database creation. Migrate the data from the old database to the new database.**:
  "Server-side encryption (SSE)" là thuật ngữ của Amazon S3, không phải cơ chế mã hoá của Aurora (Aurora dùng AWS KMS key) - phương án này sai về bản chất kỹ thuật/thuật ngữ

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "Encrypt existing unencrypted Aurora/RDS cluster" → KHÔNG THỂ modify tại chỗ, luôn phải qua snapshot → restore với KMS key mới
- "LEAST operational overhead" + cần mã hoá cluster hiện có → ưu tiên cơ chế snapshot/restore có sẵn của AWS thay vì migrate dữ liệu thủ công

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [Encrypting Amazon Aurora resources (Limitations of Amazon Aurora encrypted DB clusters)](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Overview.Encryption.html)
- 🌐 [How do I take an encrypted snapshot of an unencrypted Amazon RDS DB instance?](https://repost.aws/knowledge-center/encrypt-rds-snapshots)

</details>

---

<div id="question-65"></div>

### Question 65: An AWS Managed Microsoft AD instance on AWS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A company plans to launch Amazon EC2 instances that run Microsoft Windows Server. The company requires that all Windows instances be joined to a dedicated Active Directory domain that the company will host in the AWS Cloud. Authorized user identities from the on-premises Active Directory domain must be able to access the EC2 instances. Users from the Active Directory on AWS must not be able to authenticate to on-premises resources.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy an AD Connector on AWS. Join the AD Connector to the on-premises Active Directory domain. Join the EC2 instances to the AD connector by using the Seamless Domain Join feature of AWS Directory Service.
- **(B)** Deploy an AWS Managed Microsoft AD instance on AWS. Configure a two-way forest trust relationship between the AWS Managed Microsoft AD instance and the on-premises Active Directory. Join the EC2 instances to the AWS Managed Microsoft AD instance.
- **(C)** Deploy an AWS Managed Microsoft AD instance on AWS. Deploy an AD Connector. Join the AWS Managed Microsoft AD instance to the AWS Managed AD. Join the EC2 instances to the AD connector by using the Seamless Domain Join feature of AWS Directory Service.
- **(D)** Deploy an AWS Managed Microsoft AD instance on AWS. Configure a one-way outgoing forest trust relationship to the on-premises Active Directory. Join the EC2 instances to the AWS Managed Microsoft AD instance. `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
> 📝 **Tóm tắt đề bài:**
> - Windows EC2 instances phải join Active Directory domain hosted trên AWS (dedicated domain)
> - User từ on-premises AD phải truy cập được EC2 instances trên AWS
> - User từ AD trên AWS KHÔNG được authenticate vào tài nguyên on-premises
> - → Yêu cầu: thiết lập trust relationship 1 chiều đúng hướng giữa AWS Managed AD và on-premises AD

**Phân tích giải pháp tối ưu:**
Deploy an AWS Managed Microsoft AD instance on AWS. Configure a one-way outgoing forest trust relationship to the on-premises Active Directory. Join the EC2 instances to the AWS Managed Microsoft AD instance.

AWS Managed Microsoft AD tạo ra 1 managed AD mới trên cloud, kết hợp với one-way trust sẽ cho phép user on-premises truy cập được EC2 trên AWS (đúng yêu cầu), nhưng user AD trên AWS không thể authenticate ngược lại on-premises (vì trust chỉ 1 chiều)

Kiến trúc tham khảo:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an AD Connector on AWS. Join the AD Connector to the on-premises Active Directory domain. Join the EC2 instances to the AD connector by using the Seamless Domain Join feature of AWS Directory Service.**:
  AD Connector chỉ là proxy chuyển tiếp yêu cầu xác thực tới domain on-premises có sẵn, không tạo ra 1 domain AD mới hosted trên AWS - không đáp ứng yêu cầu "dedicated Active Directory domain that the company will host in the AWS Cloud"

- **Deploy an AWS Managed Microsoft AD instance on AWS. Configure a two-way forest trust relationship between the AWS Managed Microsoft AD instance and the on-premises Active Directory. Join the EC2 instances to the AWS Managed Microsoft AD instance.**:
  Trust hai chiều (two-way) cho phép user ở CẢ HAI domain truy cập lẫn nhau - vi phạm trực tiếp yêu cầu "Users from the Active Directory on AWS must not be able to authenticate to on-premises resources"

- **Deploy an AWS Managed Microsoft AD instance on AWS. Deploy an AD Connector. Join the AWS Managed Microsoft AD instance to the AWS Managed AD. Join the EC2 instances to the AD connector by using the Seamless Domain Join feature of AWS Directory Service.**:
  Đây là kiến trúc không hợp lệ/không tồn tại - AD Connector và AWS Managed Microsoft AD không được "join" với nhau theo cách này

#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):
- "user on-prem truy cập AWS, nhưng user AWS không được truy cập on-prem" → one-way trust, chiều outgoing trên domain chứa tài nguyên được truy cập (trusting domain)
- "two-way trust" cho phép truy cập cả 2 chiều → loại ngay nếu đề yêu cầu chỉ 1 chiều
- "dedicated domain hosted in AWS Cloud" → phải dùng AWS Managed Microsoft AD, không phải AD Connector (AD Connector không tạo domain mới)
- Quy tắc AWS: Outgoing được cấu hình trên trusting domain, Incoming được cấu hình trên trusted domain

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Managed Microsoft AD best practices (Set up trusts correctly)](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_best_practices.html)
- 🌐 [Creating a trust relationship between your AWS Managed Microsoft AD and self-managed AD](https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_setup_trust.html)

</details>

---

