# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Practice Exam 4

> **Khóa học tham chiếu**: Ultimate AWS Certified Solutions Architect Associate (SAA-C03) - Stephane Maarek  
> **Bộ đề**: Practice Exam 4 (Full Exam Simulation - 65 Questions)  
> **Tài liệu học tập liên quan**: [Ghi chú Chương 32: Chiến lược thi & Đề thi thử (32_Preparing_for_the_Exam.md)](../Lesson_Notes/32_Preparing_for_the_Exam.md) | [Bảng thuật ngữ AWS (GLOSSARY.md)](../GLOSSARY.md)

---

## 📊 1. Báo Cáo Kết Quả Thực Hành (Exam Performance Summary)

| Chỉ số đánh giá (Metric) | Kết quả đạt được | Tiêu chuẩn đạt của AWS | Trạng thái (Status) |
| :--- | :---: | :---: | :---: |
| **Tổng số câu hỏi (Total Questions)** | **65 câu** | 65 câu | Hoàn thành 100% |
| **Số câu trả lời đúng (Correct Answers)** | **38 câu** | $\ge 47$  câu (72%) | Chưa đạt tiêu chuẩn ❌ |
| **Số câu trả lời sai (Incorrect Answers)** | **27 câu** | $\le 18$  câu | Cần tập trung ôn tập ⚠️ |
| **Tỷ lệ chính xác (Overall Score)** | **58.46% (~585 / 1000)** | $\ge 72.0\%$ (720 / 1000) | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

### 📈 Ma Trận Phân Bổ Điểm Số Theo 4 Miền Kiến Thức (Domains Breakdown)

| Miền kiến thức (AWS Domain) | Trọng số thi | Tổng số câu | Số câu đúng | Số câu sai | Tỷ lệ chính xác | Đánh giá năng lực |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Domain 1: Design Secure Architectures**<br>*Thiết kế kiến trúc an toàn (Security)* | **30%** | 18 câu | 10 câu | 8 câu | **55.6%** | Cần củng cố 🔴 |
| **Domain 2: Design Resilient Architectures**<br>*Thiết kế kiến trúc kiên cường chịu lỗi (Resilience)* | **26%** | 16 câu | 10 câu | 6 câu | **62.5%** | Cần củng cố 🔴 |
| **Domain 3: Design High-Performing Architectures**<br>*Thiết kế kiến trúc hiệu năng cao (Performance)* | **24%** | 21 câu | 14 câu | 7 câu | **66.7%** | Cần củng cố 🔴 |
| **Domain 4: Design Cost-Optimized Architectures**<br>*Thiết kế kiến trúc tối ưu chi phí (Cost Optimization)* | **20%** | 10 câu | 4 câu | 6 câu | **40%** | Cần củng cố 🔴 |
| **TỔNG CỘNG (OVERALL)** | **100%** |  **65 câu** | **38 câu** | **27 câu** | **58.46%** | ⚠️ **FAILED (CHƯA ĐẠT - CẦN ÔN TẬP)** |

---

## 🎯 2. Danh Sách 27 Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)

Dưới đây là tổng hợp 27 câu trả lời chưa chính xác trong lần làm đề thi này. Hãy rà soát kỹ các bẫy câu hỏi và bài học kiến trúc cốt lõi trước khi bước vào kỳ thi thật:

| Câu số | Miền kiến thức | Chủ đề câu hỏi | Kiến thức cốt lõi & Bẫy đề bài cần lưu ý | Xem lại |
| :---: | :--- | :--- | :--- | :---: |
| **Câu 01** | Domain 2 | **EC2 Detailed Monitoring (1-Minute Intervals) for Real-Time Performance Tracking** | Mặc định (Basic Monitoring) của EC2 gửi metrics lên CloudWatch với chu kỳ 5 phút. Khi bài thi yêu cầu giám sát chi tiết tần suất <= 2 phút mà triển khai nhanh nhất, ít tốn công vận hành nhất (low-maintenance), giải pháp chuẩn là bật Detailed Monitoring (chu kỳ 1 phút) chỉ với 1 cú click/CLI. Cài đặt CloudWatch Agent phức tạp, tốn công quản trị và phân tích qua Athena tạo độ trễ. | [👉 Xem](#question-01) |
| **Câu 02** | Domain 2 | **Safe EC2 Patching Behind ALB via SSM Automation and Maintenance Windows** | Để vá lỗi (patching) an toàn cho các EC2 instance nằm sau Application Load Balancer (ALB) mà không gây gián đoạn traffic: Phải sử dụng AWS Systems Manager Automation với document chuẩn `AWSEC2-PatchLoadBalancerInstance` (tự động deregister instance khỏi ALB, đợi connection draining, patch, reboot rồi re-register) kết hợp với SSM Maintenance Windows để lên lịch định kỳ. | [👉 Xem](#question-02) |
| **Câu 03** | Domain 1 | **Enforcing Compliance and Immutability via S3 Glacier Vault Lock Policy** | Khi doanh nghiệp yêu cầu lưu trữ hồ sơ y tế/tài chính dài hạn tuân thủ quy định pháp lý (WORM - Write Once, Read Many), ngăn chặn tuyệt đối việc chỉnh sửa hoặc xóa dữ liệu (kể cả bởi root user): Phải sử dụng Amazon S3 Glacier Vault Lock Policy. S3 ACLs chỉ quản lý quyền cơ bản, không có cơ chế khóa bất biến (immutability). | [👉 Xem](#question-03) |
| **Câu 05** | Domain 3 | **Instant Test Volume Hydration with Amazon EBS Fast Snapshot Restore (FSR)** | Để nhân bản môi trường kiểm thử (test) từ đĩa EBS Production đang chạy mà không bị suy giảm hiệu năng do cơ chế đọc lười (lazy loading/re-hydration từ S3) và không làm trễ thời gian kiểm thử: Tạo EBS Snapshot và kích hoạt tính năng **EBS Fast Snapshot Restore (FSR)** trên snapshot đó trước khi tạo volume mới. io2 Multi-Attach không cho phép gắn đồng thời vào các instance khác cụm cluster để ghi độc lập vì sẽ gây xung đột dữ liệu file system. | [👉 Xem](#question-05) |
| **Câu 10** | Domain 1 | **Custom Domain SSL/TLS on CloudFront with ACM us-east-1 and Origin Access Control (OAC)** | Chứng chỉ SSL/TLS công khai cấp bởi AWS Certificate Manager (ACM) để sử dụng với CloudFront BẮT BUỘC phải được yêu cầu tại Region `us-east-1` (N. Virginia), không được dùng chứng chỉ ở Region khác (như `eu-west-2`). Đồng thời, để bảo mật truy cập từ CloudFront vào S3 bucket origin, chuẩn hiện đại nhất là sử dụng Origin Access Control (OAC) thay vì OAI. | [👉 Xem](#question-10) |
| **Câu 15** | Domain 1 | **Combining AWS WAF Geo Match Statements with IP Set Statements for Whitelisting** | Khi cần chặn truy cập từ một số quốc gia nhưng vẫn cho phép một danh sách IP ngoại lệ từ các quốc gia đó: Sử dụng AWS WAF Geo Match Statement để định nghĩa các quốc gia cần chặn, đồng thời tạo một AWS WAF IP Set Statement chứa các IP ngoại lệ với Rule Priority cao hơn và action là ALLOW (hoặc cấu hình rule kết hợp logic trong WAF). ALB không có native IP Set statement. | [👉 Xem](#question-15) |
| **Câu 16** | Domain 2 | **Multi-Region S3 Cross-Region Replication (CRR) with SSE-KMS Multi-Region Keys** | Khi cấu hình S3 Cross-Region Replication (CRR) với mã hóa SSE-KMS: Phải sử dụng AWS KMS Multi-Region Keys (MRK) hoặc cấp quyền cho KMS key ở Region đích giải mã và mã hóa lại. Đồng thời, cấu hình CRR phải được thiết lập trên source bucket và replication chỉ tự động áp dụng cho các object mới (object cũ cần S3 Batch Replication). | [👉 Xem](#question-16) |
| **Câu 18** | Domain 4 | **Cost-Effective Automated EC2 Recovery Using CloudWatch Alarm Reboot Action** | Tự động khởi động lại (Reboot) instance EC2 khi bị treo/hỏng với chi phí thấp nhất và ít công quản lý nhất: Tạo CloudWatch Alarm giám sát metric `StatusCheckFailed_Instance` và gắn trực tiếp hành động **EC2 Reboot Alarm Action**. Tuyệt đối không cần viết Lambda function hay EventBridge rule phức tạp. | [👉 Xem](#question-18) |
| **Câu 20** | Domain 4 | **Petabyte-Scale Offline Data Migration to S3 Glacier Using AWS Snowball Edge** | Di chuyển 100 TB dữ liệu qua đường truyền mạng 100 Mbps sẽ mất hơn 92 ngày và gây nghẽn băng thông. Khi cần chuyển khối lượng dữ liệu lớn (trên vài chục TB) lên AWS Cloud với chi phí tiết kiệm nhất trong thời gian ngắn: Sử dụng thiết bị phần cứng **AWS Snowball Edge Storage Optimized** (dung lượng 80-210 TB) để copy offline và gửi tới AWS, sau đó áp dụng S3 Lifecycle để chuyển sang S3 Glacier. | [👉 Xem](#question-20) |
| **Câu 24** | Domain 4 | **S3 Lifecycle Transition Minimum Retention Constraints (30 Days for S3 Standard-IA)** | Quy tắc chuyển đổi vòng đời S3 (Lifecycle Transition Rules): Đối tượng phải được lưu trữ tối thiểu **30 ngày** trong S3 Standard trước khi có thể chuyển sang S3 Standard-IA hoặc One Zone-IA. Thiết lập chuyển đổi trước 30 ngày là không hợp lệ theo quy định của AWS. | [👉 Xem](#question-24) |
| **Câu 28** | Domain 1 | **Enforcing Multi-Account Compliance via AWS Organizations Tag Policies and SCPs** | Để chuẩn hóa và bắt buộc gắn tag trên toàn bộ tài khoản AWS Organizations: Sử dụng **Tag Policies** để chuẩn hóa quy tắc đặt tên key và các giá trị hợp lệ (confidential, public), kết hợp với **Service Control Policies (SCPs)** để từ chối (DENY) hành động `ec2:RunInstances` nếu request không chứa tag bắt buộc, và từ chối hành động `ec2:DeleteTags`. | [👉 Xem](#question-28) |
| **Câu 30** | Domain 3 | **Real-Time Streaming Ingestion and PII Masking with Kinesis Data Streams and Lambda** | Khi cần tách biệt luồng dữ liệu thời gian thực: dữ liệu nhạy cảm cần được làm sạch (masking/cleansing) trước khi lưu trữ cho đối tác, trong khi ứng dụng nội bộ vẫn cần xem dữ liệu gốc: Đẩy dữ liệu vào **Amazon Kinesis Data Streams**, tích hợp **AWS Lambda** làm consumer để lọc/xóa dữ liệu nhạy cảm rồi lưu vào **DynamoDB**; các ứng dụng nội bộ đọc trực tiếp luồng Kinesis Stream gốc. | [👉 Xem](#question-30) |
| **Câu 34** | Domain 1 | **Secure Enterprise Hybrid Connectivity via AWS Site-to-Site VPN and Network Routing** | Thiết lập kết nối an toàn, mã hóa giữa trung tâm dữ liệu On-premises và Amazon VPC qua Internet công cộng: Sử dụng **AWS Site-to-Site VPN** (IPsec VPN tunnel gồm Virtual Private Gateway/Transit Gateway và Customer Gateway), kết hợp cập nhật bảng định tuyến Route Table, Security Groups và Network ACLs. | [👉 Xem](#question-34) |
| **Câu 35** | Domain 2 | **Resolving Auto Scaling Health Check Inconsistencies with ALB ELB Health Checks** | Hiện tượng máy chủ EC2 vẫn chạy nhưng ứng dụng web bên trong bị lỗi/sập (HTTP 5xx), ALB nhận diện Unhealthy nhưng Auto Scaling Group (ASG) không tự thay thế instance: Nguyên nhân là ASG mặc định chỉ dùng **EC2 Health Checks** (chỉ kiểm tra phần cứng hypervisor, instance status). Để ASG tự động terminate và thay thế instance khi ứng dụng web lỗi, BẮT BUỘC phải chuyển ASG Health Check Type sang **ELB**. | [👉 Xem](#question-35) |
| **Câu 36** | Domain 3 | **Hybrid EC2 Purchasing Strategy: Reserved Instances for Baseline and Spot for Spikes** | Chiến lược mua sắm EC2 tối ưu chi phí cho hệ thống có lưu lượng nền (baseline) chạy 24/7 cố định và lưu lượng đột biến (spikes) tăng mạnh theo sự kiện: Mua **Reserved Instances (hoặc Savings Plans)** cho tải nền để tiết kiệm tới 72%, và kết hợp **EC2 Spot Instances** trong Auto Scaling Group để xử lý lưu lượng đỉnh chịu được rủi ro ngắt quãng nhằm tiết kiệm tới 90%. | [👉 Xem](#question-36) |
| **Câu 41** | Domain 3 | **Secure Ephemeral SSH Access to EC2 Without Key Management via EC2 Instance Connect** | Để kết nối SSH vào máy ảo EC2 Linux công khai mà không phải chia sẻ hoặc quản lý các file private key `.pem` tĩnh: Sử dụng **EC2 Instance Connect**. Dịch vụ này tự động đẩy một public key tạm thời (chỉ tồn tại 60 giây) lên instance metadata thông qua IAM API, cho phép kỹ sư SSH an toàn bằng public IP hoặc qua console trình duyệt. | [👉 Xem](#question-41) |
| **Câu 44** | Domain 4 | **Hybrid Cloud Local File Caching and On-Premises Storage via S3 File Gateway** | Cung cấp dung lượng lưu trữ tệp tin trên đám mây cho các ứng dụng On-Premises thông qua giao thức chuẩn NFS/SMB với bộ nhớ đệm cục bộ (local cache) để duy trì độ trễ thấp: Sử dụng **AWS Storage Gateway (Amazon S3 File Gateway)**. EFS và FSx không tối ưu cho cache tại chỗ của on-premise. | [👉 Xem](#question-44) |
| **Câu 45** | Domain 3 | **Storage Tiering Hierarchy: EC2 Instance Store vs Amazon S3 vs Amazon S3 Glacier** | Phân tầng kiến trúc lưu trữ theo hiệu năng và chi phí: Dùng **EC2 Instance Store** (ổ cứng NVMe gắn trực tiếp) cho tầng xử lý tạm thời yêu cầu IOPS tối đa và độ trễ micro-giây; dùng **Amazon S3 Standard** để lưu trữ lâu dài bền vững 11 số 9; và dùng **Amazon S3 Glacier** cho dữ liệu lưu trữ lưu trữ dài hạn/lưu kho với chi phí rẻ nhất. | [👉 Xem](#question-45) |
| **Câu 46** | Domain 3 | **Ultra High-Performance Database Storage with Provisioned IOPS SSD (io1/io2)** | Khi tự vận hành cơ sở dữ liệu quan hệ PostgreSQL trên EC2 yêu cầu thông lượng cực lớn, tải I/O ổn định hàng chục ngàn IOPS và độ trễ thấp nhất: Bắt buộc chọn loại ổ cứng **Amazon EBS Provisioned IOPS SSD (io1/io2 Block Express)**. Ổ gp2/gp3 không đáp ứng được mức trần IOPS cực đại liên tục cho DB lớn cấp doanh nghiệp. | [👉 Xem](#question-46) |
| **Câu 50** | Domain 1 | **Private and Secure Third-Party SaaS Connectivity via AWS PrivateLink Interface Endpoints** | Kết nối an toàn, riêng tư từ VPC nội bộ tới một dịch vụ phần mềm SaaS của bên thứ ba (hoặc VPC khác) mà không cho lưu lượng đi ra Internet công cộng và không bị xung đột dải mạng CIDR: Sử dụng **AWS PrivateLink** (Interface VPC Endpoint dựa trên Network Load Balancer). Tuyệt đối không cần VPN hay VPC Peering. | [👉 Xem](#question-50) |
| **Câu 51** | Domain 1 | **Layer 7 DDoS and Web Threat Defense at the Edge Using AWS WAF with CloudFront** | Bảo vệ ứng dụng web chạy trên EC2 trước các cuộc tấn công DDoS và lỗ hổng web Layer 7 ở phạm vi toàn cầu: Triển khai **Amazon CloudFront** phía trước các EC2 instances và gắn **AWS WAF** trực tiếp lên CloudFront distribution để kiểm tra và ngăn chặn traffic độc hại ngay tại các Edge Location. | [👉 Xem](#question-51) |
| **Câu 52** | Domain 4 | **Minimizing Cloud Data Transfer Out Costs over Direct Connect Within the Same Region** | Tối ưu chi phí truyền dữ liệu (Data Transfer Out - DTO): Khi truy cập Data Warehouse từ công cụ trực quan hóa (visualization tool), hãy triển khai công cụ này trong **CÙNG AWS Region** với Data Warehouse và truy cập qua kết nối **AWS Direct Connect** nội vùng. Truyền dữ liệu qua Direct Connect nội vùng có chi phí thấp hơn nhiều so với xuất qua Internet công cộng. | [👉 Xem](#question-52) |
| **Câu 55** | Domain 3 | **Automated Heterogeneous and Ongoing Database Replication via AWS DMS Serverless** | Đồng bộ hóa dữ liệu ban đầu (Full Load) và sao chép liên tục các thay đổi (Change Data Capture - CDC) theo thời gian thực từ cơ sở dữ liệu Oracle On-premises lên Amazon RDS for Oracle: Giải pháp chuẩn và ít tốn công quản trị nhất là sử dụng **AWS Database Migration Service (AWS DMS Serverless)**. AWS Glue không chuyên dùng cho CDC thời gian thực của DB OLTP. | [👉 Xem](#question-55) |
| **Câu 58** | Domain 2 | **High Availability Regional Web Tier Architecture: Multi-AZ ASG Behind ALB** | Auto Scaling Group (ASG) là một dịch vụ có phạm vi theo **Vùng (Regional)**, nó có thể trải dài qua nhiều Availability Zone (AZ) trong CÙNG MỘT Region, nhưng **KHÔNG THỂ trải dài qua nhiều Region khác nhau**. Do đó, kiến trúc chuẩn là cấu hình ASG trải trên nhiều AZ trong 1 Region đằng sau Application Load Balancer. | [👉 Xem](#question-58) |
| **Câu 60** | Domain 2 | **Understanding Amazon RDS Multi-AZ Automatic Failover DNS CNAME Switch Mechanics** | Cơ chế Failover tự động của Amazon RDS Multi-AZ: Khi instance chính (Primary) gặp sự cố, AWS sẽ tự động thăng cấp standby instance thành primary mới và **cập nhật bản ghi DNS CNAME** của Endpoint cơ sở dữ liệu trỏ sang địa chỉ IP của standby. Chuỗi kết nối (Endpoint URL) của ứng dụng KHÔNG BAO GIỜ THAY ĐỔI, chỉ có địa chỉ IP phân giải phía dưới thay đổi. | [👉 Xem](#question-60) |
| **Câu 62** | Domain 4 | **Cost-Effective Archiving for Irregular Access Files: S3 Intelligent-Tiering via S3 API** | Tối ưu hóa chi phí lưu trữ cho nền tảng lưu trữ dự án (project archiving) có mô hình truy cập không dự đoán trước: Sử dụng **Amazon S3 với storage class S3 Intelligent-Tiering** và cập nhật ứng dụng sử dụng S3 API. Duy trì EFS hoặc FSx for Lustre cho mục đích lưu kho lâu dài là cực kỳ lãng phí vì chi phí lưu trữ tệp mạng cao hơn nhiều so với S3. | [👉 Xem](#question-62) |
| **Câu 65** | Domain 1 | **Reducing KMS API Call Volume and Costs for S3 Server-Side Encryption Using S3 Bucket Keys** | Khi lưu trữ hàng triệu đối tượng trong S3 sử dụng mã hóa SSE-KMS, chi phí gọi API KMS (`kms:GenerateDataKey` và `kms:Decrypt`) có thể chiếm tới 90% hóa đơn. Để cắt giảm tới 99% chi phí KMS này mà không làm giảm mức độ bảo mật: Hãy bật tính năng **S3 Bucket Keys**. Tính năng này tạo một bucket-level key ngắn hạn để mã hóa/giải mã hàng loạt object thay vì gọi trực tiếp KMS cho từng object riêng lẻ. | [👉 Xem](#question-65) |

---

## 📑 3. Mục Lục Điều Hướng Nhanh (Question Quick Index)

<details>
<summary>👉 <b>Nhấp vào đây để mở rộng danh sách 65 câu hỏi</b></summary>

| STT | Trạng thái | Chủ đề câu hỏi | Miền kiến thức |
| :---: | :---: | :--- | :--- |
| [01](#question-01) | ❌ Sai | [EC2 Detailed Monitoring (1-Minute Intervals) for Real-Time Performance Tracking](#question-01) | Domain 2 |
| [02](#question-02) | ❌ Sai | [Safe EC2 Patching Behind ALB via SSM Automation and Maintenance Windows](#question-02) | Domain 2 |
| [03](#question-03) | ❌ Sai | [Enforcing Compliance and Immutability via S3 Glacier Vault Lock Policy](#question-03) | Domain 1 |
| [04](#question-04) | ✅ Đúng | [Decoupling Processing Stages and Queue-Based Auto Scaling with Amazon SQS](#question-04) | Domain 2 |
| [05](#question-05) | ❌ Sai | [Instant Test Volume Hydration with Amazon EBS Fast Snapshot Restore (FSR)](#question-05) | Domain 3 |
| [06](#question-06) | ✅ Đúng | [Private In-VPC S3 Access via Gateway VPC Endpoints and Route Tables](#question-06) | Domain 1 |
| [07](#question-07) | ✅ Đúng | [Hybrid Storage Migration and Continuous Access via AWS DataSync and File Gateway](#question-07) | Domain 3 |
| [08](#question-08) | ✅ Đúng | [Auditing External Resource Sharing with IAM Access Analyzer](#question-08) | Domain 1 |
| [09](#question-09) | ✅ Đúng | [Understanding Default Amazon EBS Volume Encryption Characteristics](#question-09) | Domain 1 |
| [10](#question-10) | ❌ Sai | [Custom Domain SSL/TLS on CloudFront with ACM us-east-1 and Origin Access Control (OAC)](#question-10) | Domain 1 |
| [11](#question-11) | ✅ Đúng | [Ad-Hoc Serverless SQL Querying on S3 Data Lake Using Amazon Athena](#question-11) | Domain 4 |
| [12](#question-12) | ✅ Đúng | [Scalable Distributed Web Session Management with Amazon ElastiCache](#question-12) | Domain 3 |
| [13](#question-13) | ✅ Đúng | [Troubleshooting Database Connectivity: Security Group Inbound Rule References](#question-13) | Domain 1 |
| [14](#question-14) | ✅ Đúng | [Edge Web Application Protection against DDoS and Exploits Using AWS WAF with CloudFront](#question-14) | Domain 1 |
| [15](#question-15) | ❌ Sai | [Combining AWS WAF Geo Match Statements with IP Set Statements for Whitelisting](#question-15) | Domain 1 |
| [16](#question-16) | ❌ Sai | [Multi-Region S3 Cross-Region Replication (CRR) with SSE-KMS Multi-Region Keys](#question-16) | Domain 2 |
| [17](#question-17) | ✅ Đúng | [Global Traffic Acceleration and Edge Ingestion via AWS Global Accelerator](#question-17) | Domain 4 |
| [18](#question-18) | ❌ Sai | [Cost-Effective Automated EC2 Recovery Using CloudWatch Alarm Reboot Action](#question-18) | Domain 4 |
| [19](#question-19) | ✅ Đúng | [Offloading Read Traffic to Aurora Read Replicas via Cluster Reader Endpoint](#question-19) | Domain 2 |
| [20](#question-20) | ❌ Sai | [Petabyte-Scale Offline Data Migration to S3 Glacier Using AWS Snowball Edge](#question-20) | Domain 4 |
| [21](#question-21) | ✅ Đúng | [Sub-Millisecond In-Memory Caching for High-Throughput APIs Using ElastiCache Redis](#question-21) | Domain 3 |
| [22](#question-22) | ✅ Đúng | [Stateless Network ACL (NACL) Inbound and Ephemeral Outbound Return Traffic](#question-22) | Domain 1 |
| [23](#question-23) | ✅ Đúng | [Optimizing Amazon SQS Throughput and Costs with Message Batching](#question-23) | Domain 3 |
| [24](#question-24) | ❌ Sai | [S3 Lifecycle Transition Minimum Retention Constraints (30 Days for S3 Standard-IA)](#question-24) | Domain 4 |
| [25](#question-25) | ✅ Đúng | [Automated Multi-AZ EC2 Scaling from Custom AMI with Launch Templates](#question-25) | Domain 2 |
| [26](#question-26) | ✅ Đúng | [Automating Cost Optimization for Unknown Access Patterns with S3 Intelligent-Tiering](#question-26) | Domain 4 |
| [27](#question-27) | ✅ Đúng | [Maximum Ultra-Low Latency Ephemeral Scratch Storage Using EC2 Instance Store](#question-27) | Domain 4 |
| [28](#question-28) | ❌ Sai | [Enforcing Multi-Account Compliance via AWS Organizations Tag Policies and SCPs](#question-28) | Domain 1 |
| [29](#question-29) | ✅ Đúng | [Auto Scaling Group Minimum Capacity Configuration to Prevent Application Outages](#question-29) | Domain 2 |
| [30](#question-30) | ❌ Sai | [Real-Time Streaming Ingestion and PII Masking with Kinesis Data Streams and Lambda](#question-30) | Domain 3 |
| [31](#question-31) | ✅ Đúng | [Centralized Multi-VPC and Hybrid Routing Architecture with AWS Transit Gateway](#question-31) | Domain 1 |
| [32](#question-32) | ✅ Đúng | [Centralizing Application Logs from EC2 to CloudWatch Logs via CloudWatch Agent](#question-32) | Domain 3 |
| [33](#question-33) | ✅ Đúng | [Dedicated Real-Time Read Throughput for Multiple Consumers with Kinesis Enhanced Fan-Out](#question-33) | Domain 3 |
| [34](#question-34) | ❌ Sai | [Secure Enterprise Hybrid Connectivity via AWS Site-to-Site VPN and Network Routing](#question-34) | Domain 1 |
| [35](#question-35) | ❌ Sai | [Resolving Auto Scaling Health Check Inconsistencies with ALB ELB Health Checks](#question-35) | Domain 2 |
| [36](#question-36) | ❌ Sai | [Hybrid EC2 Purchasing Strategy: Reserved Instances for Baseline and Spot for Spikes](#question-36) | Domain 3 |
| [37](#question-37) | ✅ Đúng | [Accelerating Global Static Image Downloads with Amazon CloudFront and S3 Origin](#question-37) | Domain 3 |
| [38](#question-38) | ✅ Đúng | [Multi-Region Active-Active Database Replication Using DynamoDB Global Tables](#question-38) | Domain 3 |
| [39](#question-39) | ✅ Đúng | [Establishing Encrypted Hybrid On-Premises Connectivity with AWS Site-to-Site VPN](#question-39) | Domain 1 |
| [40](#question-40) | ✅ Đúng | [Encrypted Shared POSIX File Storage for Linux HPC Clusters via Amazon EFS](#question-40) | Domain 1 |
| [41](#question-41) | ❌ Sai | [Secure Ephemeral SSH Access to EC2 Without Key Management via EC2 Instance Connect](#question-41) | Domain 3 |
| [42](#question-42) | ✅ Đúng | [Protection Against Accidental EBS Snapshot Deletion with AWS Recycle Bin Retention Rules](#question-42) | Domain 2 |
| [43](#question-43) | ✅ Đúng | [Enforcing Strict Regulatory Data Retention Using S3 Object Lock Compliance Mode](#question-43) | Domain 1 |
| [44](#question-44) | ❌ Sai | [Hybrid Cloud Local File Caching and On-Premises Storage via S3 File Gateway](#question-44) | Domain 4 |
| [45](#question-45) | ❌ Sai | [Storage Tiering Hierarchy: EC2 Instance Store vs Amazon S3 vs Amazon S3 Glacier](#question-45) | Domain 3 |
| [46](#question-46) | ❌ Sai | [Ultra High-Performance Database Storage with Provisioned IOPS SSD (io1/io2)](#question-46) | Domain 3 |
| [47](#question-47) | ✅ Đúng | [Handling Asynchronous Processing Failures and Poison Pills with SQS Dead-Letter Queues](#question-47) | Domain 2 |
| [48](#question-48) | ✅ Đúng | [Active-Passive Disaster Recovery and Failover Routing to Static S3 Site via Route 53](#question-48) | Domain 2 |
| [49](#question-49) | ✅ Đúng | [Event-Driven Serverless Image Processing Pipeline Using S3 Event Notifications and Lambda](#question-49) | Domain 3 |
| [50](#question-50) | ❌ Sai | [Private and Secure Third-Party SaaS Connectivity via AWS PrivateLink Interface Endpoints](#question-50) | Domain 1 |
| [51](#question-51) | ❌ Sai | [Layer 7 DDoS and Web Threat Defense at the Edge Using AWS WAF with CloudFront](#question-51) | Domain 1 |
| [52](#question-52) | ❌ Sai | [Minimizing Cloud Data Transfer Out Costs over Direct Connect Within the Same Region](#question-52) | Domain 4 |
| [53](#question-53) | ✅ Đúng | [Low-Latency Global Multi-Region Data Access Using Amazon DynamoDB Global Tables](#question-53) | Domain 3 |
| [54](#question-54) | ✅ Đúng | [Fully Managed Scalable Shared File System with Cross-Region Backups via EFS & AWS Backup](#question-54) | Domain 2 |
| [55](#question-55) | ❌ Sai | [Automated Heterogeneous and Ongoing Database Replication via AWS DMS Serverless](#question-55) | Domain 3 |
| [56](#question-56) | ✅ Đúng | [Real-Time Log Analytics and Visualization Pipeline: Kinesis, OpenSearch & QuickSight](#question-56) | Domain 2 |
| [57](#question-57) | ✅ Đúng | [Improving Anycast Edge Routing and Global Performance via AWS Global Accelerator](#question-57) | Domain 3 |
| [58](#question-58) | ❌ Sai | [High Availability Regional Web Tier Architecture: Multi-AZ ASG Behind ALB](#question-58) | Domain 2 |
| [59](#question-59) | ✅ Đúng | [Serverless Feedback Ingestion and Sentiment Analysis: API GW, SQS, Lambda, Comprehend & DynamoDB](#question-59) | Domain 3 |
| [60](#question-60) | ❌ Sai | [Understanding Amazon RDS Multi-AZ Automatic Failover DNS CNAME Switch Mechanics](#question-60) | Domain 2 |
| [61](#question-61) | ✅ Đúng | [Automated Audio Transcription and Sentiment Analysis with Amazon Transcribe and Athena](#question-61) | Domain 3 |
| [62](#question-62) | ❌ Sai | [Cost-Effective Archiving for Irregular Access Files: S3 Intelligent-Tiering via S3 API](#question-62) | Domain 4 |
| [63](#question-63) | ✅ Đúng | [Accelerating Low-Latency Non-HTTP TCP Traffic Globally Using AWS Global Accelerator](#question-63) | Domain 3 |
| [64](#question-64) | ✅ Đúng | [Scaling Multi-Region Read Performance and Disaster Recovery with RDS Cross-Region Read Replicas](#question-64) | Domain 2 |
| [65](#question-65) | ❌ Sai | [Reducing KMS API Call Volume and Costs for S3 Server-Side Encryption Using S3 Bucket Keys](#question-65) | Domain 1 |

</details>

---

## 📝 4. Nội Dung Chi Tiết 65 Câu Hỏi (Detailed Questions & Explanations)

<div id="question-01"></div>

### Question 01: EC2 Detailed Monitoring (1-Minute Intervals) for Real-Time Performance Tracking
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A media streaming company expects a major increase in user activity during the launch of a highly anticipated live event. The streaming platform is deployed on AWS and uses Amazon EC2 instances for the application layer and Amazon RDS for persistent storage. The operations team needs to proactively monitor system performance to ensure a smooth user experience during the event. Their monitoring setup must provide data visibility with intervals of no more than 2 minutes, and the team prefers a solution that is quick to implement and low-maintenance.

Which solution should the team implement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EventBridge to collect EC2 state changes and publish them to Amazon SNS. Subscribe a monitoring dashboard to the SNS topic to visualize metrics
- **(B)** Enable detailed monitoring on all EC2 instances and use Amazon CloudWatch metrics to track performance `[Đáp án đúng ✅]`
- **(C)** Install the CloudWatch agent on all EC2 instances. Configure the agent to collect high-resolution custom metrics and stream them to CloudWatch Logs for analysis via Amazon Athena `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Stream EC2 system logs to an Amazon OpenSearch Service domain for real-time indexing and visualization. Use OpenSearch Dashboards to monitor CPU and memory metrics

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Enable detailed monitoring on all EC2 instances and use Amazon CloudWatch metrics to track performance

> 🔗 **Tài liệu tham khảo trực quan**: [By default, EC2 instances publish CloudWatch metrics at 5-minute intervals. Enabling detailed monitoring changes this to 1-minute intervals, allowing the team to observe system performance with the necessary granularity. CloudWatch metrics provide native integration with EC2 and are the most efficient way to analyze CPU, network, and disk utilization without complex setups.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-metrics-basic-detailed.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EventBridge to collect EC2 state changes and publish them to Amazon SNS. Subscribe a monitoring dashboard to the SNS topic to visualize metrics**:
  EventBridge and SNS are designed for event-driven architectures and alerting—not for performance monitoring or detailed metric analysis. This approach would not provide the continuous, granular data the company needs to evaluate real-time performance trends. Moreover, SNS is not built to directly support monitoring dashboards.

- **Stream EC2 system logs to an Amazon OpenSearch Service domain for real-time indexing and visualization. Use OpenSearch Dashboards to monitor CPU and memory metrics**:
  While Amazon OpenSearch Service is excellent for log indexing and search, it does not natively collect EC2 performance metrics like CPU utilization or disk I/O. To make this work, the company would need to implement custom log collection and parsing, which adds unnecessary complexity compared to using CloudWatch.

- **Install the CloudWatch agent on all EC2 instances. Configure the agent to collect high-resolution custom metrics and stream them to CloudWatch Logs for analysis via Amazon Athena**:
  Although this setup could support fine-grained metric collection, it introduces significant operational overhead. It requires manual agent installation, configuration, and maintenance across all instances. Analyzing logs via Athena also introduces query latency, which is not ideal for real-time performance tracking.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudWatch - cloudwatch metrics basic detailed](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-metrics-basic-detailed.html)
- 🌐 [AWS Docs: AmazonCloudWatch - Install CloudWatch Agent](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)
- 🌐 [AWS Docs: opensearch-service - what is](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/what-is.html)

</details>

---

<div id="question-02"></div>

### Question 02: Safe EC2 Patching Behind ALB via SSM Automation and Maintenance Windows
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C), (D) | **Đáp án đúng**: (A), (C)

#### 📋 Đề bài (Scenario)
A digital media company runs its content rendering service on Amazon EC2 instances that are registered with an Application Load Balancer (ALB) using IP-based target groups. The company relies on AWS Systems Manager to manage and patch these instances regularly. According to new compliance requirements, EC2 instances must be safely removed from production traffic during patching to prevent user disruption and maintain application integrity. However, during the most recent patch cycle, the operations team noticed application failures and API timeouts, even though patching succeeded on the instances. You are asked to suggest a reliable and scalable way to ensure safe patching while preserving service availability.

Which solution will best meet the new compliance and operational requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Systems Manager Maintenance Windows to coordinate patching and instance removal from the ALB during the defined window `[Đáp án đúng ✅]`
- **(B)** Use Amazon CloudWatch Logs Insights to monitor patching success and then manually adjust ALB target group registrations before and after each patch window
- **(C)** Use AWS Systems Manager Automation with the AWSEC2-PatchLoadBalancerInstance document to manage patching `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Modify the load balancer configuration to attach EC2 instances using instance ID-based target groups instead of IP-based targets, allowing Systems Manager to directly communicate with instance metadata `[Lựa chọn của bạn - Không chính xác ❌]`
- **(E)** Configure a custom Lambda function triggered by an Amazon EventBridge rule that disables the EC2 instance's network interface during the patching window and re-enables it after patching completes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Systems Manager Automation with the AWSEC2-PatchLoadBalancerInstance document to manage patching

The AWSEC2-PatchLoadBalancerInstance Systems Manager Automation document is specifically designed for patching EC2 instances that are part of a load balancer. It automatically removes the instance from the ALB target group, waits for in-flight requests to complete, applies patches, performs reboots if needed, and then safely re-registers the instance. This workflow prevents application downtime or request failures during patching and ensures compliance with security policies.

Configure Systems Manager Maintenance Windows to coordinate patching and instance removal from the ALB during the defined window

Systems Manager Maintenance Windows can be configured to run Automation documents or Lambda functions at precise times. You can schedule a task to remove instances from the load balancer using pre-defined documents (such as AWSEC2-PatchLoadBalancerInstance) and then re-register them once patching is complete. This offers fine-grained scheduling and orchestration for controlled patching without disrupting traffic.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure a custom Lambda function triggered by an Amazon EventBridge rule that disables the EC2 instance's network interface during the patching window and re-enables it after patching completes**:
  This is a completely impractical and risky approach. Disabling the instance's network interface during patching would sever communication with AWS Systems Manager, which relies on the SSM Agent and internet/network connectivity to manage the patching workflow. This would likely cause patching failures or leave instances in an inconsistent state. It also introduces custom automation and complexity that is neither secure nor supported by AWS best practices.

- **Modify the load balancer configuration to attach EC2 instances using instance ID-based target groups instead of IP-based targets, allowing Systems Manager to directly communicate with instance metadata**:
  Switching from IP-based to instance ID-based targets does not solve the problem related to application failures during patching. The issue lies in how traffic is handled during the patching process—not in the communication between Systems Manager and the instances. Furthermore, IP-based target groups are commonly used when EC2 instances are managed through services like ECS or are deployed in different subnets or VPCs. Changing the target type could introduce compatibility or architectural issues without addressing the root cause.

- **Use Amazon CloudWatch Logs Insights to monitor patching success and then manually adjust ALB target group registrations before and after each patch window**:
  While monitoring with CloudWatch Logs Insights can provide visibility into patching status, it does not automate the removal or addition of instances to/from the ALB. Manually adjusting target group registrations is not scalable, prone to human error, and does not align with the goal of automation and compliance. This option lacks operational efficiency and doesn't prevent traffic from reaching instances while they are being patched.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: systems-manager - what is systems manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)
- 🌐 [AWS Docs: systems-manager-automation-runbooks - automation awsec2 patch load balancer instance](https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awsec2-patch-load-balancer-instance.html)
- 🌐 [AWS Docs: systems-manager-automation-runbooks - automation runbook reference](https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-runbook-reference.html)
- 🌐 [AWS Docs: elasticloadbalancing - load balancer target groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html)

</details>

---

<div id="question-03"></div>

### Question 03: Enforcing Compliance and Immutability via S3 Glacier Vault Lock Policy
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A silicon valley based healthcare startup uses AWS Cloud for its IT infrastructure. The startup stores patient health records on Amazon Simple Storage Service (Amazon S3). The engineering team needs to implement an archival solution based on Amazon S3 Glacier to enforce regulatory and compliance controls on data access.

As a solutions architect, which of the following solutions would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon S3 Glacier vault to store the sensitive archived data and then use a vault lock policy to enforce compliance controls `[Đáp án đúng ✅]`
- **(B)** Use Amazon S3 Glacier to store the sensitive archived data and then use an Amazon S3 Access Control List to enforce compliance controls `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Use Amazon S3 Glacier to store the sensitive archived data and then use an Amazon S3 lifecycle policy to enforce compliance controls
- **(D)** Use Amazon S3 Glacier vault to store the sensitive archived data and then use an Amazon S3 Access Control List to enforce compliance controls

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon S3 Glacier vault to store the sensitive archived data and then use a vault lock policy to enforce compliance controls

Amazon S3 Glacier is a secure, durable, and extremely low-cost Amazon S3 cloud storage class for data archiving and long-term backup. It is designed to deliver 99.999999999% durability, and provide comprehensive security and compliance capabilities that can help meet even the most stringent regulatory requirements.

An Amazon S3 Glacier vault is a container for storing archives. When you create a vault, you specify a vault name and the AWS Region in which you want to create the vault. Amazon S3 Glacier Vault Lock allows you to easily deploy and enforce compliance controls for individual Amazon S3 Glacier vaults with a vault lock policy. You can specify controls such as “write once read many” (WORM) in a vault lock policy and lock the policy from future edits. Therefore, this is the correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon S3 Glacier to store the sensitive archived data and then use an Amazon S3 lifecycle policy to enforce compliance controls**:
  You can use lifecycle policy to define actions you want Amazon S3 to take during an object's lifetime. For example, use a lifecycle policy to transition objects to another storage class, archive them, or delete them after a specified period. It cannot be used to enforce compliance controls. Therefore, this option is incorrect.

- **Use Amazon S3 Glacier vault to store the sensitive archived data and then use an Amazon S3 Access Control List to enforce compliance controls**:
  Amazon S3 access control lists (ACLs) enable you to manage access to buckets and objects. It cannot be used to enforce compliance controls. Therefore, this option is incorrect.

- **Use Amazon S3 Glacier to store the sensitive archived data and then use an Amazon S3 Access Control List to enforce compliance controls**:
  Amazon S3 access control lists (ACLs) enable you to manage access to buckets and objects. It cannot be used to enforce compliance controls. Therefore, this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: amazonglacier - working with vaults](https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-vaults.html)
- 🌐 [AWS Docs: amazonglacier - vault lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html)
- 🌐 [AWS Docs: AmazonS3 - create lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-lifecycle.html)

</details>

---

<div id="question-04"></div>

### Question 04: Decoupling Processing Stages and Queue-Based Auto Scaling with Amazon SQS
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A logistics company runs a two-step job handling process on AWS. The first step quickly receives job submissions from clients, while the second step requires longer processing time to complete each job. Currently, both steps run on separate Amazon EC2 Auto Scaling groups. However, during high-demand hours, the job processing stage falls behind, and there is concern that jobs may be lost due to instance termination during scaling events. A solutions architect needs to design a more scalable and reliable architecture that preserves job data and accommodates fluctuating demand in both stages.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up two Amazon SQS queues to decouple the job intake and job processing stages respectively. Assign one SQS queue to collect incoming jobs, and another to queue them for processing. Configure the EC2 instances to poll the relevant queue. Scale the Auto Scaling groups based on number of messages in each queue `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure each Auto Scaling group to maintain its maximum expected size during peak hours by setting a fixed minimum capacity. Monitor CPUUtilization through Amazon CloudWatch to ensure consistent scaling behavior
- **(C)** Set up two Amazon SQS queues to decouple the job intake and job processing stages respectively. Assign one SQS queue to collect incoming jobs, and another to queue them for processing. Configure the EC2 instances to poll the relevant queue. Scale the Auto Scaling groups based on notifications from each queue
- **(D)** Set up a single Amazon SQS queue for both the job intake and job processing stages. Assign the SQS queue to collect incoming jobs as well as processing jobs. Configure all EC2 instances to poll this queue. Scale the Auto Scaling groups based on number of messages in the queue

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up two Amazon SQS queues to decouple the job intake and job processing stages respectively. Assign one SQS queue to collect incoming jobs, and another to queue them for processing. Configure the EC2 instances to poll the relevant queue. Scale the Auto Scaling groups based on number of messages in each queue

This solution effectively addresses both the need for scalability and the requirement to avoid data loss. By introducing Amazon SQS queues between the two processing stages (order collection and order fulfillment), the architecture becomes decoupled and resilient. One queue buffers incoming orders, while the second queue holds orders awaiting fulfillment, ensuring no data is lost even when processing slows during peak traffic. Each group of EC2 instances polls its respective queue for work, and Auto Scaling policies can be configured based on the number of messages in each queue. This allows the system to dynamically scale based on real-time demand, ensuring responsiveness without over-provisioning resources. This approach minimizes latency for order intake while allowing asynchronous processing of order fulfillment, leading to a highly available and cost-efficient solution.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up a single Amazon SQS queue for both the job intake and job processing stages. Assign the SQS queue to collect incoming jobs as well as processing jobs. Configure all EC2 instances to poll this queue. Scale the Auto Scaling groups based on number of messages in the queue**:
  This option is incorrect because using a single Amazon SQS queue for both job intake and job processing introduces ambiguity and tight coupling between two logically distinct stages—order collection and order fulfillment. In this architecture, the order intake is fast, while order fulfillment is slower and more resource-intensive. By combining both types of messages into a single SQS queue, there’s no way to prioritize, distinguish, or independently scale resources for each task. For example, the fulfillment EC2 instances might mistakenly process intake-type messages or vice versa unless complex custom filtering logic is implemented, which increases operational complexity and risk.

- **Configure each Auto Scaling group to maintain its maximum expected size during peak hours by setting a fixed minimum capacity. Monitor CPUUtilization through Amazon CloudWatch to ensure consistent scaling behavior**:
  This approach pre-provisions the infrastructure for peak traffic, using CPUUtilization as a general metric. While this reduces the risk of lag due to insufficient instances, it lacks flexibility and may result in over-provisioning, leading to unnecessary costs. It also does not guarantee data persistence if instances terminate unexpectedly during processing, since there’s no queue-based buffering.

- **Set up two Amazon SQS queues to decouple the job intake and job processing stages respectively. Assign one SQS queue to collect incoming jobs, and another to queue them for processing. Configure the EC2 instances to poll the relevant queue. Scale the Auto Scaling groups based on notifications from each queue**:
  While this solution correctly suggests decoupling the order collection and order fulfillment processes using Amazon SQS queues, it proposes using notifications from the queues to trigger scaling. This acts as a distractor, since SQS queues do not support sending notifications. Notifications (e.g., using Amazon SNS) are not the most effective mechanism for dynamic and responsive scaling. The more reliable and recommended approach is to scale based on the number of pending messages in each queue.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - as using sqs queue](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)
- 🌐 [AWS Docs: AWSSimpleQueueService - welcome](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)

</details>

---

<div id="question-05"></div>

### Question 05: Instant Test Volume Hydration with Amazon EBS Fast Snapshot Restore (FSR)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A financial analytics firm runs performance-intensive modeling software on Amazon EC2 instances backed by Amazon EBS volumes. The production data resides on EBS volumes attached to EC2 instances in the same AWS Region where the testing environment is hosted. To maintain data integrity, any changes made during testing must not affect production data. The development team needs to frequently create clones of this production data for simulations. The modeling software requires high and consistent I/O performance, and the firm wants to minimize the time required to provision test data.

Which solution should a solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create Amazon EBS-backed Amazon Machine Images (AMIs) from the production EC2 instances. Launch new EC2 instances in the test environment from the AMIs. Use Amazon EC2 instance store volumes for temporary simulation data
- **(B)** Use Amazon EBS io2 volumes with Multi-Attach enabled. Attach the same production EBS volumes to both the production and test EC2 instances simultaneously to avoid cloning delays and ensure high IOPS performance `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Take snapshots of the production EBS volumes. Enable EBS fast snapshot restore on the snapshots. Create new EBS volumes from the snapshots and attach them to EC2 instances in the test environment `[Đáp án đúng ✅]`
- **(D)** Create new EBS volumes in the test environment and use AWS Backup to perform a backup job of the production volumes. Restore the backup directly to the test EBS volumes to begin simulations

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Take snapshots of the production EBS volumes. Enable EBS fast snapshot restore on the snapshots. Create new EBS volumes from the snapshots and attach them to EC2 instances in the test environment

This solution uses EBS fast snapshot restore (FSR), which allows immediate, full-performance access to new EBS volumes created from snapshots—eliminating the usual initialization delay. Creating volumes from snapshots ensures that test data is logically cloned without impacting the source, and the FSR feature guarantees the I/O performance required by the analytics workloads. This method is efficient, scalable, and preserves isolation between test and production environments.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create Amazon EBS-backed Amazon Machine Images (AMIs) from the production EC2 instances. Launch new EC2 instances in the test environment from the AMIs. Use Amazon EC2 instance store volumes for temporary simulation data**:
  While AMIs do provide a fast way to clone EC2 instances, EBS-backed AMIs are optimized for instance bootstrapping, not large-scale data cloning or simulation. Additionally, using instance store volumes for high I/O operations is risky, as they are ephemeral and can be lost on stop/terminate. This setup doesn't offer the persistent high-performance storage required for consistent simulation workloads and would not scale well for repeated cloning needs.

- **Create new EBS volumes in the test environment and use AWS Backup to perform a backup job of the production volumes. Restore the backup directly to the test EBS volumes to begin simulations**:
  While AWS Backup supports backing up and restoring EBS volumes, it is designed for data protection and compliance use cases, not for rapid, low-latency cloning. The process of creating a backup job and restoring to new volumes adds significant delay and operational overhead compared to using native EBS snapshots with fast snapshot restore. Additionally, AWS Backup does not provide the same flexibility or speed when initiating volume restoration, especially when frequent or automated cloning is required. This approach does not meet the goal of minimizing the time to clone data for performance-critical testing.

- **Use Amazon EBS io2 volumes with Multi-Attach enabled. Attach the same production EBS volumes to both the production and test EC2 instances simultaneously to avoid cloning delays and ensure high IOPS performance**:
  While Amazon EBS Multi-Attach allows an io1 or io2 volume to be attached to multiple EC2 instances within the same Availability Zone, it is designed for use in clustered, coordinated applications (such as shared-disk file systems or clustered databases). Attaching the same production volume to both production and test environments introduces the risk of uncoordinated writes, data corruption, and unexpected state changes, especially since the requirement explicitly states that test modifications must not impact production data. Additionally, Multi-Attach does not eliminate the need for cloning, it merely provides concurrent access, which is unsuitable for isolated test simulations.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: ebs - ebs fast snapshot restore](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-fast-snapshot-restore.html)
- 🌐 [AWS Docs: ebs - ebs volumes multi](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volumes-multi.html)

</details>

---

<div id="question-06"></div>

### Question 06: Private In-VPC S3 Access via Gateway VPC Endpoints and Route Tables
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
An organization operates a legacy reporting tool hosted on an Amazon EC2 instance located within a public subnet of a VPC. This tool aggregates scanned PDF reports from field devices and temporarily stores them on an attached Amazon EBS volume. At the end of each day, the tool transfers the accumulated files to an Amazon S3 bucket for archival. A solutions architect identifies that the files are being uploaded over the internet using S3's public endpoint. To improve security and avoid exposing data traffic to the public internet, the architect needs to reconfigure the setup so that uploads to Amazon S3 occur privately without using the public S3 endpoint.

Which solution will fulfill these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a NAT gateway in the public subnet and modify the route table of the EC2 instance's subnet to direct Amazon S3 traffic through the NAT gateway
- **(B)** Create a gateway VPC endpoint for Amazon S3 in the VPC. Ensure that the EC2 instance’s subnet route table is updated to route S3 traffic through the endpoint. Confirm that appropriate IAM policies are in place to permit access via the VPC endpoint `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create an S3 access point within the same Region and attach a policy that grants the EC2 instance access. Update the application to use the access point alias to upload data
- **(D)** Provision a dedicated AWS Direct Connect link to route traffic from the VPC to Amazon S3 privately

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create a gateway VPC endpoint for Amazon S3 in the VPC. Ensure that the EC2 instance’s subnet route table is updated to route S3 traffic through the endpoint. Confirm that appropriate IAM policies are in place to permit access via the VPC endpoint

A gateway VPC endpoint for Amazon S3 enables private connectivity between your Amazon VPC and S3 without routing traffic over the public internet. By creating a gateway VPC endpoint, the EC2 instance uploads data to S3 over AWS's internal network, ensuring the traffic remains entirely within the AWS infrastructure. This approach satisfies the requirement to avoid using the public endpoint, enhances security, and minimizes exposure to external threats. Additionally, route table entries in the public subnet can be updated to direct all S3-bound traffic through the VPC endpoint, and IAM or bucket policies can further restrict access to only traffic coming from the VPC endpoint. This solution requires no application changes and involves minimal operational overhead, making it both secure and efficient.

There is no additional charge for using gateway endpoints. Amazon S3 supports both gateway endpoints and interface endpoints. With a gateway endpoint, you can access Amazon S3 from your VPC, without requiring an internet gateway or NAT device for your VPC, and with no additional cost. However, gateway endpoints do not allow access from on-premises networks, from peered VPCs in other AWS Regions, or through a transit gateway.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create an S3 access point within the same Region and attach a policy that grants the EC2 instance access. Update the application to use the access point alias to upload data**:
  While Amazon S3 access points simplify managing access to shared buckets across many applications or teams, they do not change the network path used to reach Amazon S3. Without a VPC endpoint, traffic using an access point still flows over the public internet. This option does not meet the requirement to avoid using S3’s public endpoint.

- **Set up a NAT gateway in the public subnet and modify the route table of the EC2 instance's subnet to direct Amazon S3 traffic through the NAT gateway**:
  Although NAT gateways can route traffic to the internet, they do not provide private access to S3. Traffic sent through a NAT gateway to S3 still uses public endpoints and incurs data transfer charges. This does not satisfy the requirement to avoid public endpoint usage.

- **Provision a dedicated AWS Direct Connect link to route traffic from the VPC to Amazon S3 privately**:
  Direct Connect is ideal for high-throughput, low-latency, hybrid workloads where traffic flows from on-premises to AWS. However, it is unnecessary for this use case, which involves internal traffic between EC2 and S3 within AWS.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - vpc endpoints s3](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html)
- 🌐 [AWS Docs: AmazonS3 - access points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html)

</details>

---

<div id="question-07"></div>

### Question 07: Hybrid Storage Migration and Continuous Access via AWS DataSync and File Gateway
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A leading media company wants to do an accelerated online migration of hundreds of terabytes of files from their on-premises data center to Amazon S3 and then establish a mechanism to access the migrated data for ongoing updates from the on-premises applications.

As a solutions architect, which of the following would you select as the MOST performant solution for the given use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS DataSync to migrate existing data to Amazon S3 and then use File Gateway to retain access to the migrated data for ongoing updates from the on-premises applications `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use AWS DataSync to migrate existing data to Amazon S3 as well as access the Amazon S3 data for ongoing updates
- **(C)** Use File Gateway configuration of AWS Storage Gateway to migrate data to Amazon S3 and then use Amazon S3 Transfer Acceleration (Amazon S3TA) for ongoing updates from the on-premises applications
- **(D)** Use Amazon S3 Transfer Acceleration (Amazon S3TA) to migrate existing data to Amazon S3 and then use AWS DataSync for ongoing updates from the on-premises applications

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS DataSync to migrate existing data to Amazon S3 and then use File Gateway to retain access to the migrated data for ongoing updates from the on-premises applications

AWS DataSync is an online data transfer service that simplifies, automates, and accelerates copying large amounts of data to and from AWS storage services over the internet or AWS Direct Connect.

AWS DataSync fully automates and accelerates moving large active datasets to AWS, up to 10 times faster than command-line tools. It is natively integrated with Amazon S3, Amazon EFS, Amazon FSx for Windows File Server, Amazon CloudWatch, and AWS CloudTrail, which provides seamless and secure access to your storage services, as well as detailed monitoring of the transfer. DataSync uses a purpose-built network protocol and scale-out architecture to transfer data. A single AWS DataSync agent is capable of saturating a 10 Gbps network link.

AWS DataSync fully automates the data transfer. It comes with retry and network resiliency mechanisms, network optimizations, built-in task scheduling, monitoring via the AWS DataSync API and Console, and Amazon CloudWatch metrics, events, and logs that provide granular visibility into the transfer process. AWS DataSync performs data integrity verification both during the transfer and at the end of the transfer.

> 🔗 **Tài liệu tham khảo trực quan**: [How AWS DataSync Works:](https://aws.amazon.com/datasync/)
AWS Storage Gateway is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage. The service provides three different types of gateways – Tape Gateway, File Gateway, and Volume Gateway – that seamlessly connect on-premises applications to cloud storage, caching data locally for low-latency access. File gateway offers SMB or NFS-based access to data in Amazon S3 with local caching.

The combination of AWS DataSync and File Gateway is the correct solution. AWS DataSync enables you to automate and accelerate online data transfers to AWS storage services. File Gateway then provides your on-premises applications with low latency access to the migrated data.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS DataSync to migrate existing data to Amazon S3 as well as access the Amazon S3 data for ongoing updates**:
  AWS DataSync is used to easily transfer data to and from AWS with up to 10x faster speeds. It is used to transfer data and cannot be used to facilitate ongoing updates to the migrated files from the on-premises applications.

- **Use File Gateway configuration of AWS Storage Gateway to migrate data to Amazon S3 and then use Amazon S3 Transfer Acceleration (Amazon S3TA) for ongoing updates from the on-premises applications**:
  File Gateway can be used to move on-premises data to AWS Cloud, but it not an optimal solution for high volumes. Migration services such as AWS DataSync are best suited for this purpose. Amazon S3 Transfer Acceleration cannot facilitate ongoing updates to the migrated files from the on-premises applications.

- **Use Amazon S3 Transfer Acceleration (Amazon S3TA) to migrate existing data to Amazon S3 and then use AWS DataSync for ongoing updates from the on-premises applications**:
  If your application is already integrated with the Amazon S3 API, and you want higher throughput for transferring large files to Amazon S3, Amazon S3 Transfer Acceleration can be used. However AWS DataSync cannot be used to facilitate ongoing updates to the migrated files from the on-premises applications.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: datasync](https://aws.amazon.com/datasync/features/)

</details>

---

<div id="question-08"></div>

### Question 08: Auditing External Resource Sharing with IAM Access Analyzer
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A fintech company recently conducted a security audit and discovered that some IAM roles and Amazon S3 buckets might be unintentionally shared with external accounts or publicly accessible. The security team wants to identify these overly permissive resources and ensure that only intended principals (within their AWS Organization or specific AWS accounts) have access. They need a solution that can analyze IAM policies and resource policies to detect unintended access paths to AWS resources such as S3 buckets, IAM roles, KMS keys, and SNS topics.

Which solution should the team use to meet this requirement?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use IAM Access Advisor to get detailed access analysis of S3 bucket policies and determine which principals outside the organization have access
- **(B)** Use AWS Config to track configuration changes and infer resource-sharing behavior by analyzing compliance rules
- **(C)** Use AWS Identity and Access Management (IAM) Access Analyzer to evaluate resource-based and identity-based policies and identify resources shared outside the account or organization `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon Inspector to detect over-permissive IAM policies and access paths across the environment

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Identity and Access Management (IAM) Access Analyzer to evaluate resource-based and identity-based policies and identify resources shared outside the account or organization

AWS IAM Access Analyzer helps identify resources shared with external entities by analyzing resource-based policies (e.g., S3 buckets, KMS keys, SNS topics, IAM roles) and detecting unintended access. It uses automated reasoning to evaluate the effects of policies and determines if a resource is accessible from outside the account or organization. Access Analyzer also supports policy validation, helping administrators craft secure and compliant access policies. It’s purpose-built for detecting and auditing external access paths to resources.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use IAM Access Advisor to get detailed access analysis of S3 bucket policies and determine which principals outside the organization have access**:
  IAM Access Advisor shows the last accessed information for AWS services used by IAM users and roles, but it does not evaluate resource-based policies or determine if resources are shared externally. It is designed to help with least privilege enforcement by identifying unused permissions, not external access analysis. It cannot detect whether S3 buckets or IAM roles are publicly accessible or shared with specific accounts.

- **Use AWS Config to track configuration changes and infer resource-sharing behavior by analyzing compliance rules**:
  AWS Config is used to record configuration changes and evaluate resource compliance against custom or managed rules. While it can track policy changes or detect public S3 access if configured properly, it does not natively reason over policy semantics to determine whether a policy grants external access. Config works best when used in conjunction with Access Analyzer for a comprehensive compliance and access strategy but does not replace Access Analyzer’s policy evaluation capabilities.

- **Use Amazon Inspector to detect over-permissive IAM policies and access paths across the environment**:
  Amazon Inspector is primarily a vulnerability assessment tool focused on EC2 instances, container images, and Lambda functions. It checks for software vulnerabilities and security best practices, but it does not evaluate IAM policies or analyze whether resources like S3 buckets or roles are accessible to external accounts. It is not designed for access path analysis or policy-level visibility.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: IAM - what is access analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html)
- 🌐 [AWS Architecture Blog: set permission guardrails using iam access advisor analyze service last accessed information aws organization](https://aws.amazon.com/blogs/security/set-permission-guardrails-using-iam-access-advisor-analyze-service-last-accessed-information-aws-organization/)

</details>

---

<div id="question-09"></div>

### Question 09: Understanding Default Amazon EBS Volume Encryption Characteristics
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 3 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (C), (E) | **Đáp án đúng**: (B), (C), (E)

#### 📋 Đề bài (Scenario)
A pharmaceutical company is considering moving to AWS Cloud to accelerate the research and development process. Most of the daily workflows would be centered around running batch jobs on Amazon EC2 instances with storage on Amazon Elastic Block Store (Amazon EBS) volumes. The CTO is concerned about meeting HIPAA compliance norms for sensitive data stored on Amazon EBS.

Which of the following options outline the correct capabilities of an encrypted Amazon EBS volume? (Select three)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Any snapshot created from the volume is NOT encrypted
- **(B)** Any snapshot created from the volume is encrypted `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Data moving between the volume and the instance is encrypted `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Data at rest inside the volume is NOT encrypted
- **(E)** Data at rest inside the volume is encrypted `[Lựa chọn của bạn - Chính xác ✅]`
- **(F)** Data moving between the volume and the instance is NOT encrypted

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (C), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Data at rest inside the volume is encrypted

Any snapshot created from the volume is encrypted

Data moving between the volume and the instance is encrypted

Amazon Elastic Block Store (Amazon EBS) provides block-level storage volumes for use with Amazon EC2 instances. When you create an encrypted Amazon EBS volume and attach it to a supported instance type, data stored at rest on the volume, data moving between the volume and the instance, snapshots created from the volume and volumes created from those snapshots are all encrypted. It uses AWS Key Management Service (AWS KMS) customer master keys (CMK) when creating encrypted volumes and snapshots. Encryption operations occur on the servers that host Amazon EC2 instances, ensuring the security of both data-at-rest and data-in-transit between an instance and its attached Amazon EBS storage.

Therefore, the incorrect options are:

Data moving between the volume and the instance is NOT encrypted

Any snapshot created from the volume is NOT encrypted

Data at rest inside the volume is NOT encrypted

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Không có phân tích bẫy bổ sung.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - EBSEncryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)

</details>

---

<div id="question-10"></div>

### Question 10: Custom Domain SSL/TLS on CloudFront with ACM us-east-1 and Origin Access Control (OAC)
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B), (D) | **Đáp án đúng**: (A), (C)

#### 📋 Đề bài (Scenario)
A media company operates a web application that enables users to upload photos. These uploads are stored in an Amazon S3 bucket located in the eu-west-2 Region. To enhance performance and provide secure access under a custom domain name, the company wants to integrate Amazon CloudFront for uploads to the S3 bucket. The architecture must support secure HTTPS connections using a custom domain, and the upload process must ensure optimal speed and security.

Which combination of actions will fulfill these requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Request a public certificate from AWS Certificate Manager (ACM) in the us-east-1 Region and associate it with the CloudFront distribution `[Đáp án đúng ✅]`
- **(B)** Request a public certificate from AWS Certificate Manager (ACM) in the eu-west-2 Region and associate it with the CloudFront distribution `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Set up Amazon S3 to accept uploads from CloudFront by enabling origin access control (OAC) `[Đáp án đúng ✅]`
- **(D)** Create a CloudFront distribution with an S3 static website endpoint as the origin and enable upload operations `[Lựa chọn của bạn - Không chính xác ❌]`
- **(E)** Set up a custom origin request policy in CloudFront that includes all viewer headers and query strings. Enable S3 Object Ownership to allow CloudFront to assume control of uploaded files via a signed URL

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Request a public certificate from AWS Certificate Manager (ACM) in the us-east-1 Region and associate it with the CloudFront distribution

CloudFront only supports ACM certificates that are created in the us-east-1 (N. Virginia) Region. Even if the content resides in a different Region (like eu-west-2), a public certificate for HTTPS on a custom domain name must originate from us-east-1. This certificate is used to secure content access through CloudFront over HTTPS.

Set up Amazon S3 to accept uploads from CloudFront by enabling origin access control (OAC)

> 🔗 **Tài liệu tham khảo trực quan**: [Origin Access Control (OAC) is the recommended method for granting CloudFront permission to upload to (write into) an S3 bucket securely. OAC supersedes the older Origin Access Identity (OAI) approach and supports both read and write operations. This allows you to restrict direct access to the S3 bucket and ensure that only CloudFront can act as a secure intermediary for uploads.](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a CloudFront distribution with an S3 static website endpoint as the origin and enable upload operations**:
  This is incorrect because S3 static website endpoints only support GET and HEAD requests and are intended for public read access. They do not support PUT/POST operations required for user uploads. Therefore, they are not suitable for the secure upload workflow described.

- **Set up a custom origin request policy in CloudFront that includes all viewer headers and query strings. Enable S3 Object Ownership to allow CloudFront to assume control of uploaded files via a signed URL**:
  While customizing origin request policies and enabling S3 Object Ownership might help with some access controls, they do not provide a mechanism to upload content directly via CloudFront. Additionally, signed URLs are primarily used for download access, not for file uploads via CloudFront.

- **Request a public certificate from AWS Certificate Manager (ACM) in the eu-west-2 Region and associate it with the CloudFront distribution**:
  This option is incorrect because CloudFront cannot use ACM public certificates that are created in any Region other than us-east-1. If a certificate is created in eu-west-2, it won’t be attachable to the CloudFront distribution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: acm - acm overview](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html)
- 🌐 [AWS Docs: AmazonCloudFront - private content restricting access to s3](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)
- 🌐 [AWS Docs: AmazonCloudFront - Introduction](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)
- 🌐 [AWS Docs: AmazonCloudFront - private content signed urls](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-signed-urls.html)

</details>

---

<div id="question-11"></div>

### Question 11: Ad-Hoc Serverless SQL Querying on S3 Data Lake Using Amazon Athena
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
The data engineering team at an e-commerce company has set up a workflow to ingest the clickstream data into the raw zone of the Amazon S3 data lake. The team wants to run some SQL based data sanity checks on the raw zone of the data lake.

What AWS services would you recommend for this use-case such that the solution is cost-effective and easy to maintain?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Athena to run SQL based analytics against Amazon S3 data `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Load the incremental raw zone data into an Amazon EMR based Spark Cluster on an hourly basis and use SparkSQL to run the SQL based sanity checks
- **(C)** Load the incremental raw zone data into Amazon RDS on an hourly basis and run the SQL based sanity checks
- **(D)** Load the incremental raw zone data into Amazon Redshift on an hourly basis and run the SQL based sanity checks

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon Athena to run SQL based analytics against Amazon S3 data

Amazon Athena is an interactive query service that makes it easy to analyze data directly in Amazon S3 using standard SQL. Amazon Athena is serverless, so there is no infrastructure to set up or manage, and customers pay only for the queries they run. You can use Athena to process logs, perform ad-hoc analysis, and run interactive queries.

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon Athena Benefits:](https://aws.amazon.com/athena/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Load the incremental raw zone data into Amazon Redshift on an hourly basis and run the SQL based sanity checks**:
  Amazon Redshift is a fully-managed petabyte-scale cloud-based data warehouse product designed for large scale data set storage and analysis. As the development team would have to maintain and monitor the Amazon Redshift cluster size and would require significant development time to set up the processes to consume the data periodically, so this option is ruled out.

- **Load the incremental raw zone data into an Amazon EMR based Spark Cluster on an hourly basis and use SparkSQL to run the SQL based sanity checks**:
  Amazon EMR is the industry-leading cloud big data platform for processing vast amounts of data using open source tools such as Apache Spark, Apache Hive, Apache HBase, Apache Flink, Apache Hudi, and Presto. Amazon EMR uses Hadoop, an open-source framework, to distribute your data and processing across a resizable cluster of Amazon EC2 instances. Using an Amazon EMR cluster would imply managing the underlying infrastructure so it’s ruled out because the correct solution for the given use-case should require the least amount of development effort and ongoing maintenance.

- **Load the incremental raw zone data into Amazon RDS on an hourly basis and run the SQL based sanity checks**:
  Loading the incremental data into Amazon RDS implies data migration jobs will have to be written via a AWS Lambda function or an Amazon EC2 based process. This goes against the requirement that the solution should involve the least amount of development effort and ongoing maintenance. Hence this option is not correct.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: athena](https://aws.amazon.com/athena/)

</details>

---

<div id="question-12"></div>

### Question 12: Scalable Distributed Web Session Management with Amazon ElastiCache
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A Customer relationship management (CRM) application is facing user experience issues with users reporting frequent sign-in requests from the application. The application is currently hosted on multiple Amazon EC2 instances behind an Application Load Balancer. The engineering team has identified the root cause as unhealthy servers causing session data to be lost. The team would like to implement a distributed in-memory cache-based session management solution.

As a solutions architect, which of the following solutions would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Elasticache for distributed in-memory cache based session management `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Application Load Balancer sticky sessions
- **(C)** Use Amazon DynamoDB for distributed in-memory cache based session management
- **(D)** Use Amazon RDS for distributed in-memory cache based session management

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon Elasticache for distributed in-memory cache based session management

Amazon ElastiCache can be used as a distributed in-memory cache for session management. Amazon ElastiCache allows you to seamlessly set up, run, and scale popular open-Source compatible in-memory data stores in the cloud. Session stores can be set up using both Memcached or Redis for ElastiCache.

Amazon ElastiCache for Redis is a great choice for real-time transactional and analytical processing use cases such as caching, chat/messaging, gaming leaderboards, geospatial, machine learning, media streaming, queues, real-time analytics, and session store.

Amazon ElastiCache for Memcached is a Memcached-compatible in-memory key-value store service that can be used as a cache or a data store. Session stores are easy to create with Amazon ElastiCache for Memcached.

> 🔗 **Tài liệu tham khảo trực quan**: [How Amazon ElastiCache Works:](https://aws.amazon.com/elasticache/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon RDS for distributed in-memory cache based session management**:
  Amazon Relational Database Service (Amazon RDS) makes it easy to set up, operate, and scale a relational database in the cloud. It cannot be used as a distributed in-memory cache for session management, hence this option is incorrect.

- **Use Amazon DynamoDB for distributed in-memory cache based session management**:
  Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale. Amazon DynamoDB is a NoSQL database and is not the right fit for a distributed in-memory cache-based session management solution.

- **Use Application Load Balancer sticky sessions**:
  Although sticky sessions enable each user to interact with one server and one server only, however, in case of an unhealthy server, all the session data is gone as well. Therefore Amazon Elasticache powered distributed in-memory cache-based session management is a better solution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: getting-started](https://aws.amazon.com/getting-started/hands-on/building-fast-session-caching-with-amazon-elasticache-for-redis/)
- 🌐 [AWS Service Overview: elasticache](https://aws.amazon.com/elasticache/)

</details>

---

<div id="question-13"></div>

### Question 13: Troubleshooting Database Connectivity: Security Group Inbound Rule References
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An e-commerce company uses a two-tier architecture with application servers in the public subnet and an Amazon RDS MySQL DB in a private subnet. The development team can use a bastion host in the public subnet to access the MySQL database and run queries from the bastion host. However, end-users are reporting application errors. Upon inspecting application logs, the team notices several "could not connect to server: connection timed out" error messages.

Which of the following options represent the root cause for this issue?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The database user credentials (username and password) configured for the application do not have the required privilege for the given database
- **(B)** The database user credentials (username and password) configured for the application are incorrect
- **(C)** The security group configuration for the database instance does not have the correct rules to allow inbound connections from the application servers `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** The security group configuration for the application servers does not have the correct rules to allow inbound connections from the database instance

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The security group configuration for the database instance does not have the correct rules to allow inbound connections from the application servers

> 🔗 **Tài liệu tham khảo trực quan**: [You should use security groups to control the inbound and outbound traffic for your database instance. For your application servers, create a security group with inbound rules that use the IP addresses of the client application as the source. This security group allows your client application to connect to your application servers. Then create a second security group for your database instance and create a new rule by specifying the security group that you created earlier as the source for this database-specific security group.](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.RDSSecurityGroups.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **The security group configuration for the application servers does not have the correct rules to allow inbound connections from the database instance**:
  As mentioned in the explanation above, the application servers don't need inbound connections from the database instance, rather the database instance needs the correct inbound rule with application servers' security group as the source.

- The database user credentials (username and password) configured for the application are incorrect

- The database user credentials (username and password) configured for the application do not have the required privilege for the given database

- These two options have been added as a distractor since the error mentions a "connection timeout" issue rather than an "access denied" error.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonRDS - Overview.RDSSecurityGroups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.RDSSecurityGroups.html)
- 🌐 [AWS Service Overview: premiumsupport](https://aws.amazon.com/premiumsupport/knowledge-center/rds-cannot-connect/)

</details>

---

<div id="question-14"></div>

### Question 14: Edge Web Application Protection against DDoS and Exploits Using AWS WAF with CloudFront
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A global media company uses a fleet of Amazon EC2 instances (behind an Application Load Balancer) to power its video streaming application. To improve the performance of the application, the engineering team has also created an Amazon CloudFront distribution with the Application Load Balancer as the custom origin. The security team at the company has noticed a spike in the number and types of SQL injection and cross-site scripting attack vectors on the application.

As a solutions architect, which of the following solutions would you recommend as the MOST effective in countering these malicious attacks?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Security Hub with Amazon CloudFront distribution
- **(B)** Use Amazon Route 53 with Amazon CloudFront distribution
- **(C)** Use AWS Firewall Manager with CloudFront distribution
- **(D)** Use AWS Web Application Firewall (AWS WAF) with Amazon CloudFront distribution `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Web Application Firewall (AWS WAF) with Amazon CloudFront distribution

AWS WAF is a web application firewall that helps protect your web applications or APIs against common web exploits that may affect availability, compromise security, or consume excessive resources. AWS WAF gives you control over how traffic reaches your applications by enabling you to create security rules that block common attack patterns, such as SQL injection or cross-site scripting, and rules that filter out specific traffic patterns you define.

> 🔗 **Tài liệu tham khảo trực quan**: [How AWS WAF Works:](https://aws.amazon.com/waf/)
A web access control list (web ACL) gives you fine-grained control over the web requests that your Amazon CloudFront distribution, Amazon API Gateway API, or Application Load Balancer responds to.

When you create a web ACL, you can specify one or more Amazon CloudFront distributions that you want AWS WAF to inspect. AWS WAF starts to allow, block, or count web requests for those distributions based on the conditions that you identify in the web ACL. Therefore, combining AWS WAF with Amazon CloudFront can prevent SQL injection and cross-site scripting attacks. So this is the correct option.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon Route 53 with Amazon CloudFront distribution**:
  Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) web service. You cannot use Route 53 to prevent SQL injection and cross-site scripting attacks. So this option is incorrect.

- **Use AWS Security Hub with Amazon CloudFront distribution**:
  AWS Security Hub gives you a comprehensive view of your high-priority security alerts and security posture across your AWS accounts. With Security Hub, you have a single place that aggregates, organizes, and prioritizes your security alerts, or findings, from multiple AWS services, such as Amazon GuardDuty, Amazon Inspector, Amazon Macie, AWS Identity and Access Management (IAM) Access Analyzer, and AWS Firewall Manager, as well as from AWS Partner solutions. You cannot use Security Hub to prevent SQL injection and cross-site scripting attacks. So this option is incorrect.

- **Use AWS Firewall Manager with CloudFront distribution**:
  AWS Firewall Manager is a security management service that allows you to centrally configure and manage firewall rules across your accounts and applications in AWS Organization. You cannot use AWS Firewall Manager to prevent SQL injection and cross-site scripting attacks. So this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: waf](https://aws.amazon.com/waf/features/)
- 🌐 [AWS Docs: waf - web acl](https://docs.aws.amazon.com/waf/latest/developerguide/web-acl.html)
- 🌐 [AWS Docs: waf - cloudfront features](https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html)

</details>

---

<div id="question-15"></div>

### Question 15: Combining AWS WAF Geo Match Statements with IP Set Statements for Whitelisting
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (A), (B)

#### 📋 Đề bài (Scenario)
An online gaming company wants to block access to its application from specific countries; however, the company wants to allow its remote development team (from one of the blocked countries) to have access to the application. The application is deployed on Amazon EC2 instances running under an Application Load Balancer with AWS Web Application Firewall (AWS WAF).

As a solutions architect, which of the following solutions can be combined to address the given use-case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS WAF geo match statement listing the countries that you want to block `[Đáp án đúng ✅]`
- **(B)** Use AWS WAF IP set statement that specifies the IP addresses that you want to allow through `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Application Load Balancer IP set statement that specifies the IP addresses that you want to allow through `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Create a deny rule for the blocked countries in the network access control list (network ACL) associated with each of the Amazon EC2 instances
- **(E)** Use Application Load Balancer geo match statement listing the countries that you want to block

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS WAF geo match statement listing the countries that you want to block

Use AWS WAF IP set statement that specifies the IP addresses that you want to allow through

AWS WAF is a web application firewall that helps protect your web applications or APIs against common web exploits that may affect availability, compromise security, or consume excessive resources. AWS WAF gives you control over how traffic reaches your applications by enabling you to create security rules that block common attack patterns and rules that filter out specific traffic patterns you define.

You can deploy AWS WAF on Amazon CloudFront as part of your CDN solution, the Application Load Balancer that fronts your web servers or origin servers running on Amazon EC2, or Amazon API Gateway for your APIs.

> 🔗 **Tài liệu tham khảo trực quan**: [AWS WAF - How it Works?:](https://aws.amazon.com/waf/)
To block specific countries, you can create a AWS WAF geo match statement listing the countries that you want to block, and to allow traffic from IPs of the remote development team, you can create a WAF IP set statement that specifies the IP addresses that you want to allow through. You can combine the two rules as shown below:

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a deny rule for the blocked countries in the network access control list (network ACL) associated with each of the Amazon EC2 instances**:
  A network access control list (network ACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets. A network access control list (network ACL) does not have the capability to block traffic based on geographic match conditions.

- Use Application Load Balancer geo match statement listing the countries that you want to block

- Use Application Load Balancer IP set statement that specifies the IP addresses that you want to allow through

- An Application Load Balancer operates at the request level (layer 7), routing traffic to targets – Amazon EC2 instances, containers, IP addresses, and AWS Lambda functions based on the content of the request. Ideal for advanced load balancing of HTTP and HTTPS traffic, Application Load Balancer provides advanced request routing targeted at delivery of modern application architectures, including microservices and container-based applications.

- An Application Load Balancer cannot block or allow traffic based on geographic match conditions or IP based conditions. Both these options have been added as distractors.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: waf - waf rule statement type geo match](https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html)
- 🌐 [AWS Architecture Blog: how to use aws waf to filter incoming traffic from embargoed countries](https://aws.amazon.com/blogs/security/how-to-use-aws-waf-to-filter-incoming-traffic-from-embargoed-countries/)

</details>

---

<div id="question-16"></div>

### Question 16: Multi-Region S3 Cross-Region Replication (CRR) with SSE-KMS Multi-Region Keys
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A data analytics team at a global media firm is building a new analytics platform to process large volumes of both historical and real-time data. This data is stored in Amazon S3. The team wants to implement a serverless solution that allows them to query the data directly using SQL. Additionally, the solution must ensure that all data is encrypted at rest and automatically replicated to another AWS Region to support business continuity.

Which solution will meet these requirements with the LEAST operational overhead?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create an Amazon S3 bucket configured with server-side encryption using AWS KMS multi-Region keys (SSE-KMS). Enable cross-Region replication (CRR) on the source bucket. Use Amazon Athena to run SQL queries on the data `[Đáp án đúng ✅]`
- **(B)** Enable Cross-Region Replication (CRR) on the existing Amazon S3 bucket. Apply server-side encryption using Amazon S3 managed keys (SSE-S3). Use Amazon Athena to run SQL queries on the replicated data
- **(C)** Create an Amazon S3 bucket configured with server-side encryption using Amazon S3 managed keys (SSE-S3). Enable cross-Region replication (CRR) on the source bucket. Use Amazon Redshift Spectrum to query the S3 data using SQL
- **(D)** Enable Cross-Region Replication (CRR) on the existing Amazon S3 bucket. Apply server-side encryption using AWS KMS multi-Region keys (SSE-KMS). Use Amazon Athena to run SQL queries on the replicated data `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an Amazon S3 bucket configured with server-side encryption using AWS KMS multi-Region keys (SSE-KMS). Enable cross-Region replication (CRR) on the source bucket. Use Amazon Athena to run SQL queries on the data

> 🔗 **Tài liệu tham khảo trực quan**: [This option is the most efficient and serverless approach that meets all of the stated requirements. Amazon S3 supports server-side encryption using AWS KMS multi-Region keys, which allows secure data storage and supports automatic replication to a secondary Region via CRR. Amazon Athena is a serverless query service that can run SQL queries directly against S3 data without requiring a database engine or managing infrastructure. This solution supports encryption at rest, regional redundancy, and SQL-based querying with minimal overhead.](https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Enable Cross-Region Replication (CRR) on the existing Amazon S3 bucket. Apply server-side encryption using Amazon S3 managed keys (SSE-S3). Use Amazon Athena to run SQL queries on the replicated data

- Enable Cross-Region Replication (CRR) on the existing Amazon S3 bucket. Apply server-side encryption using AWS KMS multi-Region keys (SSE-KMS). Use Amazon Athena to run SQL queries on the replicated data

- Both of these options skip the step of creating a new bucket in the target AWS Region. You cannot enable CRR on a bucket without specifying the target bucket for replication in another Region. So, these options are incorrect.

- **Create an Amazon S3 bucket configured with server-side encryption using Amazon S3 managed keys (SSE-S3). Enable cross-Region replication (CRR) on the source bucket. Use Amazon Redshift Spectrum to query the S3 data using SQL**:
  While Redshift Spectrum can query data stored in S3 using SQL, this solution introduces unnecessary operational complexity because Amazon Redshift requires cluster management. It is not entirely serverless. Although Redshift Spectrum itself is serverless, it still depends on a provisioned Redshift cluster backend, which contradicts the requirement to minimize operational overhead.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: kms - multi region keys overview](https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html)
- 🌐 [AWS Docs: AmazonS3 - replication](https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication.html)
- 🌐 [AWS Docs: athena - what is](https://docs.aws.amazon.com/athena/latest/ug/what-is.html)

</details>

---

<div id="question-17"></div>

### Question 17: Global Traffic Acceleration and Edge Ingestion via AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A multinational logistics company operates its shipment tracking platform from Amazon EC2 instances deployed in the AWS us-west-2 Region. The platform exposes a set of APIs over HTTPS, which are used by logistics partners and customers around the world to retrieve real-time tracking data. The company has observed that users from Europe and Asia experience latency issues and inconsistent API response times when accessing the service. As a cloud architect, you have been tasked to propose the most cost-effective solution to improve performance for these international users without migrating the application.

Which solution should you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure AWS Global Accelerator in front of the existing HTTPS API, create one endpoint group in us-west-2 for the current application endpoint, and use the accelerator’s global edge network to improve performance for users connecting from Europe and Asia `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Deploy Amazon API Gateway in multiple AWS Regions and synchronize the API definitions. Use AWS Lambda as a proxy to forward requests to the EC2-hosted API in us-west-2
- **(C)** Use Amazon Route 53 latency-based routing to direct user requests to a copy of the EC2 API deployed in each major geographic Region
- **(D)** Deploy an Amazon CloudFront distribution in front of the API endpoint and apply the CachingOptimized managed policy to enhance caching behavior and improve content delivery efficiency

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Configure AWS Global Accelerator in front of the existing HTTPS API, create one endpoint group in us-west-2 for the current application endpoint, and use the accelerator’s global edge network to improve performance for users connecting from Europe and Asia

This option is correct because AWS Global Accelerator improves the performance of globally accessed HTTPS applications without requiring the company to migrate or redeploy the existing API in multiple Regions. The shipment tracking platform already runs on Amazon EC2 in us-west-2, so Global Accelerator can be placed in front of that endpoint to provide static anycast IP addresses and route users from Europe and Asia to the nearest AWS edge location, where traffic enters the AWS global network early and then travels over the AWS backbone to us-west-2 with lower latency variation than the public internet. The option is also technically accurate because Global Accelerator endpoint groups are Regional resources, which means the correct design is to create a single endpoint group in us-west-2 for the existing application endpoint rather than separate endpoint groups for user geographies. This makes the solution more suitable than alternatives that depend on cacheable responses or require multi-Region application copies, because it improves global access performance for a real-time API while keeping the architecture simple and cost-effective.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an Amazon CloudFront distribution in front of the API endpoint and apply the CachingOptimized managed policy to enhance caching behavior and improve content delivery efficiency**:
  This option is incorrect because Amazon CloudFront is primarily optimized for delivering static or cacheable content, and is not well-suited for APIs that serve highly dynamic or personalized responses, such as those in a shipment tracking system. These APIs typically return user-specific or real-time data that cannot be effectively cached, even with the use of the CachingOptimized managed cache policy. As a result, most requests would result in cache misses, causing CloudFront to forward the traffic to the origin in the us-west-2 Region. This adds an extra network hop and can actually increase latency for international users rather than reduce it. Furthermore, using CloudFront in this scenario adds unnecessary complexity and incurs additional costs without delivering significant performance improvements, making it a suboptimal and non-cost-effective solution for reducing API response times.

- **Use Amazon Route 53 latency-based routing to direct user requests to a copy of the EC2 API deployed in each major geographic Region**:
  Latency-based routing works well when application stacks are deployed in multiple Regions. However, this approach involves replicating the EC2-based API infrastructure across multiple Regions, significantly increasing compute, data transfer, and management overhead. This is not the most cost-effective option as requested in the scenario.

- **Deploy Amazon API Gateway in multiple AWS Regions and synchronize the API definitions. Use AWS Lambda as a proxy to forward requests to the EC2-hosted API in us-west-2**:
  While deploying API Gateway in multiple Regions might help reduce DNS resolution time and provide regional endpoints, using Lambda to proxy requests back to a central Region introduces additional latency and unnecessary costs. This design offloads little from the original EC2 endpoints and does not leverage edge optimization services like CloudFront or Global Accelerator. Additionally, synchronizing API definitions and handling cross-region Lambda invocation can be complex.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- References:
- 🌐 [AWS Docs: global-accelerator - what is global accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/what-is-global-accelerator.html)
- 🌐 [AWS Docs: global-accelerator - introduction how it works](https://docs.aws.amazon.com/global-accelerator/latest/dg/introduction-how-it-works.html)
- 🌐 [AWS Service Overview: global-accelerator](https://aws.amazon.com/global-accelerator/features/#Use_cases)
- 🌐 [AWS Docs: apigateway - api gateway api endpoint types](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-endpoint-types.html)

</details>

---

<div id="question-18"></div>

### Question 18: Cost-Effective Automated EC2 Recovery Using CloudWatch Alarm Reboot Action
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A medium-sized business has a taxi dispatch application deployed on an Amazon EC2 instance. Because of an unknown bug, the application causes the instance to freeze regularly. Then, the instance has to be manually restarted via the AWS management console.

Which of the following is the MOST cost-optimal and resource-efficient way to implement an automated solution until a permanent fix is delivered by the development team?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EventBridge events to trigger an AWS Lambda function to check the instance status every 5 minutes. In the case of Instance Health Check failure, the AWS lambda function can use Amazon EC2 API to reboot the instance `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Setup an Amazon CloudWatch alarm to monitor the health status of the instance. In case of an Instance Health Check failure, an EC2 Reboot CloudWatch Alarm Action can be used to reboot the instance `[Đáp án đúng ✅]`
- **(C)** Setup an Amazon CloudWatch alarm to monitor the health status of the instance. In case of an Instance Health Check failure, Amazon CloudWatch Alarm can publish to an Amazon Simple Notification Service (Amazon SNS) event which can then trigger an AWS lambda function. The AWS lambda function can use Amazon EC2 API to reboot the instance
- **(D)** Use Amazon EventBridge events to trigger an AWS Lambda function to reboot the instance status every 5 minutes

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Setup an Amazon CloudWatch alarm to monitor the health status of the instance. In case of an Instance Health Check failure, an EC2 Reboot CloudWatch Alarm Action can be used to reboot the instance

Using Amazon CloudWatch alarm actions, you can create alarms that automatically stop, terminate, reboot, or recover your Amazon EC2 instances. You can use the stop or terminate actions to help you save money when you no longer need an instance to be running. You can use the reboot and recover actions to automatically reboot those instances or recover them onto new hardware if a system impairment occurs.

You can create an Amazon CloudWatch alarm that monitors an Amazon EC2 instance and automatically reboots the instance. The reboot alarm action is recommended for Instance Health Check failures (as opposed to the recover alarm action, which is suited for System Health Check failures).

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Setup an Amazon CloudWatch alarm to monitor the health status of the instance. In case of an Instance Health Check failure, Amazon CloudWatch Alarm can publish to an Amazon Simple Notification Service (Amazon SNS) event which can then trigger an AWS lambda function. The AWS lambda function can use Amazon EC2 API to reboot the instance

- Use Amazon EventBridge events to trigger an AWS Lambda function to check the instance status every 5 minutes. In the case of Instance Health Check failure, the AWS lambda function can use Amazon EC2 API to reboot the instance

- Use Amazon EventBridge events to trigger an AWS Lambda function to reboot the instance status every 5 minutes

- Using Amazon EventBridge event or Amazon CloudWatch alarm to trigger an AWS lambda function, directly or indirectly, is wasteful of resources. You should just use the EC2 Reboot CloudWatch Alarm Action to reboot the instance. So all the options that trigger the AWS lambda function are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudWatch - UsingAlarmActions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingAlarmActions.html)

</details>

---

<div id="question-19"></div>

### Question 19: Offloading Read Traffic to Aurora Read Replicas via Cluster Reader Endpoint
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (D) | **Đáp án đúng**: (B), (D)

#### 📋 Đề bài (Scenario)
The engineering team at an e-commerce company uses an AWS Lambda function to write the order data into a single DB instance Amazon Aurora cluster. The team has noticed that many order- writes to its Aurora cluster are getting missed during peak load times. The diagnostics data has revealed that the database is experiencing high CPU and memory consumption during traffic spikes. The team also wants to enhance the availability of the Aurora DB.

Which of the following steps would you combine to address the given scenario? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Increase the concurrency of the AWS Lambda function so that the order-writes do not get missed during traffic spikes
- **(B)** Create a replica Aurora instance in another Availability Zone to improve the availability as the replica can serve as a failover target `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Amazon EC2 instances behind an Application Load Balancer to write the order data into Amazon Aurora cluster
- **(D)** Handle all read operations for your application by connecting to the reader endpoint of the Amazon Aurora cluster so that Aurora can spread the load for read-only connections across the Aurora replica `[Lựa chọn của bạn - Chính xác ✅]`
- **(E)** Create a standby Aurora instance in another Availability Zone to improve the availability as the standby can serve as a failover target

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Handle all read operations for your application by connecting to the reader endpoint of the Amazon Aurora cluster so that Aurora can spread the load for read-only connections across the Aurora replica

When you create a second, third, and so on DB instance in an Aurora-provisioned DB cluster, Aurora automatically sets up replication from the writer DB instance to all the other DB instances. These other DB instances are read-only and are known as Aurora Replicas.

> 🔗 **Tài liệu tham khảo trực quan**: [Aurora Replicas have two main purposes. You can issue queries to them to scale the read operations for your application. You typically do so by connecting to the reader endpoint of the cluster. That way, Aurora can spread the load for read-only connections across as many Aurora Replicas as you have in the cluster. Aurora Replicas also help to increase availability. If the writer instance in a cluster becomes unavailable, Aurora automatically promotes one of the reader instances to take its place as the new writer.](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Replication.html)
Create a replica Aurora instance in another Availability Zone to improve the availability as the replica can serve as a failover target

If the primary instance in a DB cluster using single-master replication fails, Aurora automatically fails over to a new primary instance in one of two ways:

> 🔗 **Tài liệu tham khảo trực quan**: [By promoting an existing Aurora Replica to the new primary instance By creating a new primary instance](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a standby Aurora instance in another Availability Zone to improve the availability as the standby can serve as a failover target**:
  There are no standby instances in Aurora. Aurora performs an automatic failover to a read replica when a problem is detected. So this option is incorrect.

> 🔗 **Tài liệu tham khảo trực quan**: [Read replicas, Multi-AZ deployments, and multi-region deployments:](https://aws.amazon.com/rds/features/read-replicas/)
Increase the concurrency of the AWS Lambda function so that the order-writes do not get missed during traffic spikes - Increasing the concurrency of the AWS Lambda function would not resolve the issue since the bottleneck is at the database layer, as exhibited by the high CPU and memory consumption for the Aurora instance. This option has been added as a distractor.

- **Use Amazon EC2 instances behind an Application Load Balancer to write the order data into Amazon Aurora cluster**:
  Using Amazon EC2 instances behind an Application Load Balancer would not resolve the issue since the bottleneck is at the database layer, as exhibited by the high CPU and memory consumption for the Aurora instance. This option has been added as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonRDS - Aurora.Replication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Replication.html)
- 🌐 [AWS Docs: AmazonRDS - Concepts.AuroraHighAvailability](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html)
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/read-replicas/)

</details>

---

<div id="question-20"></div>

### Question 20: Petabyte-Scale Offline Data Migration to S3 Glacier Using AWS Snowball Edge
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A media company wants to get out of the business of owning and maintaining its own IT infrastructure. As part of this digital transformation, the media company wants to archive about 5 petabytes of data in its on-premises data center to durable long term storage.

As a solutions architect, what is your recommendation to migrate this data in the MOST cost-optimal way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Setup AWS direct connect between the on-premises data center and AWS Cloud. Use this connection to transfer the data into Amazon S3 Glacier `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Transfer the on-premises data into multiple AWS Snowball Edge Storage Optimized devices. Copy the AWS Snowball Edge data into Amazon S3 Glacier
- **(C)** Setup AWS Site-to-Site VPN connection between the on-premises data center and AWS Cloud. Use this connection to transfer the data into Amazon S3 Glacier
- **(D)** Transfer the on-premises data into multiple AWS Snowball Edge Storage Optimized devices. Copy the AWS Snowball Edge data into Amazon S3 and create a lifecycle policy to transition the data into Amazon S3 Glacier `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Transfer the on-premises data into multiple AWS Snowball Edge Storage Optimized devices. Copy the AWS Snowball Edge data into Amazon S3 and create a lifecycle policy to transition the data into Amazon S3 Glacier

AWS Snowball Edge Storage Optimized is the optimal choice if you need to securely and quickly transfer dozens of terabytes to petabytes of data to AWS. It provides up to 80 TB of usable HDD storage, 40 vCPUs, 1 TB of SATA SSD storage, and up to 40 Gb network connectivity to address large scale data transfer and pre-processing use cases. The data stored on AWS Snowball Edge device can be copied into Amazon S3 bucket and later transitioned into Amazon S3 Glacier via a lifecycle policy. You can't directly copy data from AWS Snowball Edge devices into Amazon S3 Glacier.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Transfer the on-premises data into multiple AWS Snowball Edge Storage Optimized devices. Copy the AWS Snowball Edge data into Amazon S3 Glacier**:
  As mentioned earlier, you can't directly copy data from AWS Snowball Edge devices into Amazon S3 Glacier. Hence, this option is incorrect.

- **Setup AWS direct connect between the on-premises data center and AWS Cloud. Use this connection to transfer the data into Amazon S3 Glacier**:
  AWS Direct Connect lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. Using industry-standard 802.1q VLANs, this dedicated connection can be partitioned into multiple virtual interfaces. Direct Connect involves significant monetary investment and takes more than a month to set up, therefore it's not the correct fit for this use-case where just a one-time data transfer has to be done.

- **Setup AWS Site-to-Site VPN connection between the on-premises data center and AWS Cloud. Use this connection to transfer the data into Amazon S3 Glacier**:
  AWS Site-to-Site VPN enables you to securely connect your on-premises network or branch office site to your Amazon Virtual Private Cloud (Amazon VPC). VPN Connections are a good solution if you have an immediate need, and have low to modest bandwidth requirements. Because of the high data volume for the given use-case, Site-to-Site VPN is not the correct choice.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: snowball](https://aws.amazon.com/snowball/)

</details>

---

<div id="question-21"></div>

### Question 21: Sub-Millisecond In-Memory Caching for High-Throughput APIs Using ElastiCache Redis
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
The engineering team at a weather tracking company wants to enhance the performance of its relational database and is looking for a caching solution that supports geospatial data.

As a solutions architect, which of the following solutions will you suggest?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon ElastiCache for Memcached
- **(B)** Use Amazon DynamoDB Accelerator (DAX)
- **(C)** Use Amazon ElastiCache for Redis `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use AWS Global Accelerator

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon ElastiCache for Redis

Amazon ElastiCache is a web service that makes it easy to set up, manage, and scale a distributed in-memory data store or cache environment in the cloud. Redis, which stands for Remote Dictionary Server, is a fast, open-source, in-memory key-value data store for use as a database, cache, message broker, and queue. Redis now delivers sub-millisecond response times enabling millions of requests per second for real-time applications in Gaming, Ad-Tech, Financial Services, Healthcare, and IoT. Redis is a popular choice for caching, session management, gaming, leaderboards, real-time analytics, geospatial, ride-hailing, chat/messaging, media streaming, and pub/sub apps.

All Redis data resides in the server’s main memory, in contrast to databases such as PostgreSQL, Cassandra, MongoDB and others that store most data on disk or on SSDs. In comparison to traditional disk based databases where most operations require a roundtrip to disk, in-memory data stores such as Redis don’t suffer the same penalty. They can therefore support an order of magnitude more operations and faster response times. The result is – blazing fast performance with average read or write operations taking less than a millisecond and support for millions of operations per second.

Redis has purpose-built commands for working with real-time geospatial data at scale. You can perform operations like finding the distance between two elements (for example people or places) and finding all elements within a given distance of a point.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
> 🔗 **Tài liệu tham khảo trực quan**: [Use Amazon ElastiCache for Memcached - Both Redis and MemCached are in-memory, open-source data stores. Memcached, a high-performance distributed memory cache service, is designed for simplicity while Redis offers a rich set of features that make it effective for a wide range of use cases. Memcached does not offer support for geospatial data.](https://aws.amazon.com/elasticache/redis-vs-memcached/)
Use Amazon DynamoDB Accelerator (DAX) - Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache for Amazon DynamoDB. DAX does not support relational databases.

- **Use AWS Global Accelerator**:
  AWS Global Accelerator is a networking service that helps you improve the availability and performance of the applications that you offer to your global users. This option has been added as a distractor, it has nothing to do with database caching.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: elasticache](https://aws.amazon.com/elasticache/redis-vs-memcached/)

</details>

---

<div id="question-22"></div>

### Question 22: Stateless Network ACL (NACL) Inbound and Ephemeral Outbound Return Traffic
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (E) | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
While troubleshooting, a cloud architect realized that the Amazon EC2 instance is unable to connect to the internet using the Internet Gateway.

Which conditions should be met for internet connectivity to be established? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The instance's subnet is associated with multiple route tables with conflicting configurations
- **(B)** The network access control list (network ACL) associated with the subnet must have rules to allow inbound and outbound traffic `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** The subnet has been configured to be public and has no access to the internet
- **(D)** The instance's subnet is not associated with any route table
- **(E)** The route table in the instance’s subnet should have a route to an Internet Gateway `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The network access control list (network ACL) associated with the subnet must have rules to allow inbound and outbound traffic

The network access control list (network ACL) that is associated with the subnet must have rules to allow inbound and outbound traffic on port 80 (for HTTP traffic) and port 443 (for HTTPs traffic). This is a necessary condition for Internet Gateway connectivity.

The route table in the instance’s subnet should have a route to an Internet Gateway

A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet or gateway is directed. The route table in the instance’s subnet should have a route defined to the Internet Gateway.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **The instance's subnet is not associated with any route table**:
  This is an incorrect statement. A subnet is implicitly associated with the main route table if it is not explicitly associated with a particular route table. So, a subnet is always associated with some route table.

- **The instance's subnet is associated with multiple route tables with conflicting configurations**:
  This is an incorrect statement. A subnet can only be associated with one route table at a time.

- **The subnet has been configured to be public and has no access to the internet**:
  This is an incorrect statement. Public subnets have access to the internet via Internet Gateway.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - VPC_Route_Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)

</details>

---

<div id="question-23"></div>

### Question 23: Optimizing Amazon SQS Throughput and Costs with Message Batching
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
You are a cloud architect at an IT company. The company has multiple enterprise customers that manage their own mobile applications that capture and send data to Amazon Kinesis Data Streams. They have been getting a ProvisionedThroughputExceededException exception. You have been contacted to help and upon analysis, you notice that messages are being sent one by one at a high rate.

Which of the following options will help with the exception while keeping costs at a minimum?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Increase the number of shards
- **(B)** Use batch messages `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use Exponential Backoff
- **(D)** Decrease the Stream retention duration

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use batch messages

Amazon Kinesis Data Streams (KDS) is a massively scalable and durable real-time data streaming service. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events. The data collected is available in milliseconds to enable real-time analytics use cases such as real-time dashboards, real-time anomaly detection, dynamic pricing, and more.

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon Kinesis Data Streams Overview:](https://aws.amazon.com/kinesis/data-streams/)
When a host needs to send many records per second (RPS) to Amazon Kinesis, simply calling the basic PutRecord API action in a loop is inadequate. To reduce overhead and increase throughput, the application must batch records and implement parallel HTTP requests. This will increase the efficiency overall and ensure you are optimally using the shards.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Exponential Backoff**:
  While this may help in the short term, as soon as the request rate increases, you will see the ProvisionedThroughputExceededException exception again.

- **Increase the number of shards**:
  Increasing shards could be a short term fix but will substantially increase the cost, so this option is ruled out.

- **Decrease the Stream retention duration**:
  This operation may result in data loss and won't help with the exceptions, so this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: implementing efficient and reliable producers with the amazon kinesis producer library](https://aws.amazon.com/blogs/big-data/implementing-efficient-and-reliable-producers-with-the-amazon-kinesis-producer-library/)
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-streams/)

</details>

---

<div id="question-24"></div>

### Question 24: S3 Lifecycle Transition Minimum Retention Constraints (30 Days for S3 Standard-IA)
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
The content division at a digital media agency has an application that generates a large number of files on Amazon S3, each approximately 10 megabytes in size. The agency mandates that the files be stored for 5 years before they can be deleted. The files are frequently accessed in the first 30 days of the object creation but are rarely accessed after the first 30 days. The files contain critical business data that is not easy to reproduce, therefore, immediate accessibility is always required.

Which solution is the MOST cost-effective for the given use case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 Standard-IA 30 days after object creation. Archive the files to Amazon S3 Glacier Deep Archive 5 years after object creation `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 One Zone-IA 30 days after object creation. Delete the files 5 years after object creation
- **(C)** Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 Glacier Flexible Retrieval 30 days after object creation. Delete the files 5 years after object creation
- **(D)** Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 Standard-IA 30 days after object creation. Delete the files 5 years after object creation `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 Standard-IA 30 days after object creation. Delete the files 5 years after object creation

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon S3 Standard-IA class is for data that is accessed less frequently but requires rapid access when needed. Amazon S3 Standard-IA offers the high durability, high throughput, and low latency of S3 Standard, with a low per gigabyte storage price and per GB retrieval charge.](https://aws.amazon.com/s3/storage-classes/)
> 🔗 **Tài liệu tham khảo trực quan**: [For the given use case, you can set up an Amazon S3 lifecycle configuration and create a transition action to move objects from Amazon S3 Standard to Amazon S3 Standard-IA 30 days after object creation. You can set up an expiration action to delete the object 5 years after object creation.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html)
> 🔗 **Tài liệu tham khảo trực quan**: [](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 Glacier Flexible Retrieval 30 days after object creation. Delete the files 5 years after object creation**:
  Amazon S3 Glacier Flexible Retrieval storage class has the best case retrieval time of the order of minutes, so this option is incorrect for the given requirement.

- **Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 Standard-IA 30 days after object creation. Archive the files to Amazon S3 Glacier Deep Archive 5 years after object creation**:
  The files can simply be deleted 5 years after object creation instead of archiving the files to Amazon S3 Glacier Deep Archive. There is no need to incur the cost of archival.

- **Set up an Amazon S3 bucket lifecycle policy to move files from Amazon S3 Standard to Amazon S3 One Zone-IA 30 days after object creation. Delete the files 5 years after object creation**:
  Unlike other Amazon S3 Storage Classes which store data in a minimum of three Availability Zones (AZs), Amazon S3 One Zone-IA stores data in a single AZ and costs 20% less than Amazon S3 Standard-IA. Amazon S3 One Zone-IA is a good choice for storing secondary backup copies of on-premises data or easily re-creatable data. The given scenario clearly states that the business-critical data is not easy to reproduce, so this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-classes/)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-classes/glacier/)
- 🌐 [AWS Docs: AmazonS3 - lifecycle transition general considerations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html)
- 🌐 [AWS Docs: AmazonS3 - object lifecycle mgmt](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html)

</details>

---

<div id="question-25"></div>

### Question 25: Automated Multi-AZ EC2 Scaling from Custom AMI with Launch Templates
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A healthcare startup runs a lightweight reporting application on a single Amazon EC2 On-Demand instance. The application is designed to be stateless, fault-tolerant, and optimized for fast rendering of analytics dashboards. During major health events or news cycles, the team observes latency issues and occasional 5xx errors due to traffic spikes. To meet growing demand without over-provisioning resources during off-peak hours, the company wants to implement a cost-effective, scalable solution that ensures consistent performance even under unpredictable load.

Which approach best meets the requirements while minimizing costs?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Build an Amazon Machine Image (AMI) from the existing EC2 instance and configure a launch template. Create an Auto Scaling group using the launch template with Spot Instance pricing enabled. Attach an Application Load Balancer to distribute traffic across dynamically launched instances `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Configure an Amazon EventBridge rule to monitor system-level metrics from the EC2 instance. Trigger a Lambda function to re-deploy the application in a different Availability Zone when CPU utilization exceeds 70%
- **(C)** Containerize the application using Amazon ECS with Fargate launch type. Deploy the container to a single Fargate task and set a CloudWatch alarm to increase memory and CPU allocation dynamically based on load
- **(D)** Clone the EC2 instance using an AMI and launch a second On-Demand instance. Register both instances with an Application Load Balancer to distribute incoming traffic evenly

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Build an Amazon Machine Image (AMI) from the existing EC2 instance and configure a launch template. Create an Auto Scaling group using the launch template with Spot Instance pricing enabled. Attach an Application Load Balancer to distribute traffic across dynamically launched instances

> 🔗 **Tài liệu tham khảo trực quan**: [This approach leverages EC2 Auto Scaling to automatically scale the number of instances based on demand while using Spot Instances to minimize compute costs. The application’s stateless design is ideal for this setup. The Application Load Balancer distributes traffic across healthy instances. Using a launch template with an AMI ensures consistency across instances. This solution balances scalability with cost efficiency and aligns with AWS best practices for elastic, stateless workloads.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/which-fleet-method-to-use.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Clone the EC2 instance using an AMI and launch a second On-Demand instance. Register both instances with an Application Load Balancer to distribute incoming traffic evenly**:
  While this setup provides basic load distribution and supports horizontal scaling, using multiple On-Demand instances significantly increases operational costs, especially if the application only experiences brief traffic bursts. This design lacks elasticity and automation—instances run continuously even during idle periods. It's functional but not cost-effective compared to using Auto Scaling and Spot Instances.

- **Configure an Amazon EventBridge rule to monitor system-level metrics from the EC2 instance. Trigger a Lambda function to re-deploy the application in a different Availability Zone when CPU utilization exceeds 70%**:
  Although EventBridge can be used to respond to metrics, re-deploying the application to another Availability Zone in response to high CPU usage does not address scalability. This approach is reactive and inefficient, and it assumes a single-instance architecture. It also doesn't eliminate the source of the 5xx errors, which stem from overload—not instance location. Furthermore, there's no load balancing or auto-scaling involved.

- **Containerize the application using Amazon ECS with Fargate launch type. Deploy the container to a single Fargate task and set a CloudWatch alarm to increase memory and CPU allocation dynamically based on load**:
  While Amazon ECS with Fargate offers a serverless way to run containers without managing infrastructure, this approach is not inherently scalable when only one task is deployed. Even with increased CPU and memory allocation triggered by a CloudWatch alarm, a single Fargate task will still remain a bottleneck under heavy load. ECS services are designed to scale horizontally by adding more tasks, not by resizing a single task. Additionally, there is no load balancing mechanism included in this setup, and it doesn’t address traffic distribution or redundancy. This configuration underutilizes the scalable nature of ECS and fails to deliver the needed elasticity.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - launch template spot instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-template-spot-instances.html)
- 🌐 [AWS Docs: AWSEC2 - which fleet method to use](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/which-fleet-method-to-use.html)
- 🌐 [AWS Docs: AWSEC2 - launch instances from launch template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launch-instances-from-launch-template.html#launch-templates-spot-fleet)
- 🌐 [AWS Docs: AmazonECS - AWS_Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html)

</details>

---

<div id="question-26"></div>

### Question 26: Automating Cost Optimization for Unknown Access Patterns with S3 Intelligent-Tiering
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A medical devices company uses Amazon S3 buckets to store critical data. Hundreds of buckets are used to keep the data segregated and well organized. Recently, the development team noticed that the lifecycle policies on the Amazon S3 buckets have not been applied optimally, resulting in higher costs.

As a Solutions Architect, can you recommend a solution to reduce storage costs on Amazon S3 while keeping the IT team's involvement to a minimum?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure Amazon EFS to provide a fast, cost-effective and sharable storage service
- **(B)** Use Amazon S3 Outposts storage class to reduce the costs on Amazon S3 storage by storing the data on-premises
- **(C)** Use Amazon S3 One Zone-Infrequent Access, to reduce the costs on Amazon S3 storage
- **(D)** Use Amazon S3 Intelligent-Tiering storage class to optimize the Amazon S3 storage costs `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon S3 Intelligent-Tiering storage class to optimize the Amazon S3 storage costs

The Amazon S3 Intelligent-Tiering storage class is designed to optimize costs by automatically moving data to the most cost-effective access tier, without performance impact or operational overhead. It works by storing objects in two access tiers: one tier that is optimized for frequent access and another lower-cost tier that is optimized for infrequent access.

For a small monthly monitoring and automation fee per object, Amazon S3 monitors access patterns of the objects in Amazon S3 Intelligent-Tiering and moves the ones that have not been accessed for 30 consecutive days to the infrequent access tier. If an object in the infrequent access tier is accessed, it is automatically moved back to the frequent access tier. There are no retrieval fees when using the Amazon S3 Intelligent-Tiering storage class, and no additional tiering fees when objects are moved between access tiers. It is the ideal storage class for long-lived data with access patterns that are unknown or unpredictable.

Amazon S3 Storage Classes can be configured at the object level and a single bucket can contain objects stored in Amazon S3 Standard, Amazon S3 Intelligent-Tiering, Amazon S3 Standard-IA, and Amazon S3 One Zone-IA. You can upload objects directly to Amazon S3 Intelligent-Tiering, or use S3 Lifecycle policies to transfer objects from Amazon S3 Standard and Amazon S3 Standard-IA to Amazon S3 Intelligent-Tiering. You can also archive objects from Amazon S3 Intelligent-Tiering to Amazon S3 Glacier.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure Amazon EFS to provide a fast, cost-effective and sharable storage service**:
  Amazon Elastic File System (Amazon EFS) provides a simple, scalable, fully managed elastic NFS file system for use with AWS Cloud services and on-premises resources. Amazon EFS offers sharable service, unlike Amazon Elastic Block Storage (EBS) that cannot be shared by instances. Amazon EFS is costlier than storing data in Amazon S3. Also, Amazon EFS needs an Amazon EC2 instance or an AWS Direct Connect network connection. Hence, this is not the correct option.

- **Use Amazon S3 One Zone-Infrequent Access, to reduce the costs on Amazon S3 storage**:
  Amazon S3 One Zone-IA is for data that is accessed less frequently but requires rapid access when needed. Unlike other Amazon S3 Storage Classes which store data in a minimum of three Availability Zones (AZs), Amazon S3 One Zone-IA stores data in a single AZ and costs 20% less than Amazon S3 Standard-IA. Amazon S3 One Zone-IA is ideal for customers who want a lower-cost option for infrequently accessed data but do not require the availability and resilience of Amazon S3 Standard or Amazon S3 Standard-IA. Not a right option, since data stored is business-critical and cannot be risked by using Amazon S3 One Zone-IA.

- **Use Amazon S3 Outposts storage class to reduce the costs on Amazon S3 storage by storing the data on-premises**:
  This is a distractor as Amazon S3 on Outposts (S3 Outposts) delivers object storage to your on-premises AWS Outposts environment. It is used in conjunction with AWS Outposts and has no relevance to the current use case.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-classes/)

</details>

---

<div id="question-27"></div>

### Question 27: Maximum Ultra-Low Latency Ephemeral Scratch Storage Using EC2 Instance Store
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
Computer vision researchers at a university are trying to optimize the I/O bound processes for a proprietary algorithm running on Amazon EC2 instances. The ideal storage would facilitate high-performance IOPS when doing file processing in a temporary storage space before uploading the results back into Amazon S3.

As a solutions architect, which of the following AWS storage options would you recommend as the MOST performant as well as cost-optimal?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EC2 instances with Amazon EBS Throughput Optimized HDD (st1) as the storage option
- **(B)** Use Amazon EC2 instances with Amazon EBS General Purpose SSD (gp2) as the storage option
- **(C)** Use Amazon EC2 instances with Instance Store as the storage option `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon EC2 instances with Amazon EBS Provisioned IOPS SSD (io1) as the storage option

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon EC2 instances with Instance Store as the storage option

An instance store provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer. Instance store is ideal for the temporary storage of information that changes frequently, such as buffers, caches, scratch data, and other temporary content, or for data that is replicated across a fleet of instances, such as a load-balanced pool of web servers. Some instance types use NVMe or SATA-based solid-state drives (SSD) to deliver high random I/O performance. This is a good option when you need storage with very low latency, but you don't need the data to persist when the instance terminates or you can take advantage of fault-tolerant architectures.

As Instance Store delivers high random I/O performance, it can act as a temporary storage space, and these volumes are included as part of the instance's usage cost, therefore this is the correct option.

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon EC2 Instance Store:](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon EC2 instances with Amazon EBS General Purpose SSD (gp2) as the storage option**:
  General Purpose SSD (gp2) volumes offer cost-effective storage that is ideal for a broad range of workloads. These volumes deliver single-digit millisecond latencies and the ability to burst to 3,000 IOPS for extended periods. Between a minimum of 100 IOPS (at 33.33 GiB and below) and a maximum of 16,000 IOPS (at 5,334 GiB and above), baseline performance scales linearly at 3 IOPS per GiB of volume size. AWS designs gp2 volumes to deliver its provisioned performance 99% of the time. A gp2 volume can range in size from 1 GiB to 16 TiB. Amazon EBS gp2 is persistent storage and costlier than Instance Stores (the cost of the storage volume is in addition to that of the Amazon EC2 instance), therefore this option is not correct.

- **Use Amazon EC2 instances with Amazon EBS Provisioned IOPS SSD (io1) as the storage option**:
  Provisioned IOPS SSD (io1) volumes are designed to meet the needs of I/O-intensive workloads, particularly database workloads, that are sensitive to storage performance and consistency. Unlike gp2, which uses a bucket and credit model to calculate performance, an io1 volume allows you to specify a consistent IOPS rate when you create the volume, and Amazon EBS delivers the provisioned performance 99.9 percent of the time. Amazon EBS io1 is persistent storage and costlier than Instance Stores (the cost of the storage volume is in addition to that of the Amazon EC2 instance), therefore this option is not correct.

- **Use Amazon EC2 instances with Amazon EBS Throughput Optimized HDD (st1) as the storage option**:
  Throughput Optimized HDD (st1) are low-cost HDD volumes designed for frequently accessed, throughput-intensive workloads such as Big data and Data warehouses. Amazon EBS st1 is persistent storage and costlier than Instance Stores (the cost of the storage volume is in addition to that of the Amazon EC2 instance), therefore this option is not correct.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - AmazonEBS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html)
- 🌐 [AWS Docs: AWSEC2 - InstanceStorage](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)
- 🌐 [AWS Docs: AWSEC2 - ebs volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)

</details>

---

<div id="question-28"></div>

### Question 28: Enforcing Multi-Account Compliance via AWS Organizations Tag Policies and SCPs
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A), (B) | **Đáp án đúng**: (D), (E)

#### 📋 Đề bài (Scenario)
An enterprise is developing an internal compliance framework for its cloud infrastructure hosted on AWS. The enterprise uses AWS Organizations to group accounts under various organizational units (OUs) based on departmental function. As part of its governance controls, the security team mandates that all Amazon EC2 instances must be tagged to indicate the level of data classification — either 'confidential' or 'public'. Additionally, the organization must ensure that IAM users cannot launch EC2 instances without assigning a classification tag, nor should they be able to remove the tag from running instances. A solutions architect must design a solution to meet these compliance controls while minimizing operational overhead.

Which combination of steps will meet these requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Identity and Access Management (IAM) permission boundaries to restrict EC2-related actions unless the dataClassification tag is present. Apply these boundaries to all IAM roles used for EC2 provisioning `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Enable AWS Config rules to detect noncompliant EC2 instances. Trigger an AWS Systems Manager Automation runbook to reapply missing tags automatically when noncompliance is detected `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Create a tag enforcement Lambda function that runs on a schedule to identify EC2 instances without the required tag. The function sends a notification to administrators and optionally shuts down noncompliant resources
- **(D)** Define a tag policy in AWS Organizations that enforces the dataClassification key and restricts values to 'confidential' and 'public'. Attach this tag policy to the applicable organizational unit (OU) to enforce uniform tagging behavior across accounts `[Đáp án đúng ✅]`
- **(E)** Create a service control policy (SCP) that denies the ec2:RunInstances API action unless the required tag key is present in the request. Create a second SCP that denies the ec2:DeleteTags action for EC2 resources. Attach both SCPs to the relevant OU in AWS Organizations `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Define a tag policy in AWS Organizations that enforces the dataClassification key and restricts values to 'confidential' and 'public'. Attach this tag policy to the applicable organizational unit (OU) to enforce uniform tagging behavior across accounts

AWS Tag Policies, managed through AWS Organizations, allow administrators to define rules for tag keys and values. These policies do not directly prevent resource creation, but they help enforce tag consistency and visibility by flagging noncompliant resources.

In this case, the solutions architect creates a tag policy that requires the dataClassification key and restricts its values to 'confidential' and 'public'. By attaching this policy to the relevant Organizational Unit (OU), the tag rules automatically apply to all member accounts. Tag policies work across AWS services that support tagging compliance checks. While they don’t block actions like RunInstances, they play a governance and auditing role, helping organizations monitor and enforce consistent tagging.

Create a service control policy (SCP) that denies the ec2:RunInstances API action unless the required tag key is present in the request. Create a second SCP that denies the ec2:DeleteTags action for EC2 resources. Attach both SCPs to the relevant OU in AWS Organizations

Service Control Policies (SCPs) allow you to centrally govern permissions for accounts in AWS Organizations. An SCP defines the maximum set of permissions available to IAM users and roles in an account. When combined with condition keys, SCPs can enforce fine-grained controls on specific operations.

> 🔗 **Tài liệu tham khảo trực quan**: [To meet the requirements - one SCP is created to deny the ec2:RunInstances action unless the request includes a dataClassification tag key and a second SCP explicitly denies the ec2:DeleteTags action on EC2 resources to ensure tags cannot be removed. These SCPs are then attached to the OU, thereby applying the policies to all member accounts. This ensures that - EC2 instances cannot be launched without the required tag and tags like dataClassification cannot be deleted, preserving compliance integrity.](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples_tagging.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create a tag enforcement Lambda function that runs on a schedule to identify EC2 instances without the required tag. The function sends a notification to administrators and optionally shuts down noncompliant resources**:
  This reactive approach relies on periodic audits rather than enforcing tagging at the time of resource creation. It increases operational overhead and cannot guarantee immediate compliance, especially for short-lived resources.

- **Use AWS Identity and Access Management (IAM) permission boundaries to restrict EC2-related actions unless the dataClassification tag is present. Apply these boundaries to all IAM roles used for EC2 provisioning**:
  While IAM permission boundaries can restrict actions within a boundary, they are not designed to enforce tag-based controls across all users or to prevent tag deletion. SCPs and tag policies are more appropriate at the organizational level.

- **Enable AWS Config rules to detect noncompliant EC2 instances. Trigger an AWS Systems Manager Automation runbook to reapply missing tags automatically when noncompliance is detected**:
  AWS Config and automation runbooks offer remediation, but do not prevent noncompliant resources from being created in the first place. This violates the requirement for proactive enforcement and minimal public exposure of misclassified data.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: organizations - orgs_manage_policies_tag policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html)
- 🌐 [AWS Docs: organizations - orgs_manage_policies_scps](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- 🌐 [AWS Docs: organizations - orgs_manage_policies_scps_examples_tagging](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples_tagging.html)
- 🌐 [AWS Docs: IAM - access_policies_boundaries](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
- 🌐 [AWS Docs: organizations - orgs_introduction](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)

</details>

---

<div id="question-29"></div>

### Question 29: Auto Scaling Group Minimum Capacity Configuration to Prevent Application Outages
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A health-care company manages its web application on Amazon EC2 instances running behind Auto Scaling group (ASG). The company provides ambulances for critical patients and needs the application to be reliable. The workload of the company can be managed on 2 Amazon EC2 instances and can peak up to 6 instances when traffic increases.

As a Solutions Architect, which of the following configurations would you select as the best fit for these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The Auto Scaling group should be configured with the minimum capacity set to 2, with 1 instance each in two different Availability Zones. The maximum capacity of the Auto Scaling group should be set to 6
- **(B)** The Auto Scaling group should be configured with the minimum capacity set to 4, with 2 instances each in two different AWS Regions. The maximum capacity of the Auto Scaling group should be set to 6
- **(C)** The Auto Scaling group should be configured with the minimum capacity set to 2 and the maximum capacity set to 6 in a single Availability Zone
- **(D)** The Auto Scaling group should be configured with the minimum capacity set to 4, with 2 instances each in two different Availability Zones. The maximum capacity of the Auto Scaling group should be set to 6 `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The Auto Scaling group should be configured with the minimum capacity set to 4, with 2 instances each in two different Availability Zones. The maximum capacity of the Auto Scaling group should be set to 6

You configure the size of your Auto Scaling group by setting the minimum, maximum, and desired capacity. The minimum and maximum capacity are required to create an Auto Scaling group, while the desired capacity is optional. If you do not define your desired capacity upfront, it defaults to your minimum capacity.

Amazon EC2 Auto Scaling enables you to take advantage of the safety and reliability of geographic redundancy by spanning Auto Scaling groups across multiple Availability Zones within a Region. When one Availability Zone becomes unhealthy or unavailable, Auto Scaling launches new instances in an unaffected Availability Zone. When the unhealthy Availability Zone returns to a healthy state, Auto Scaling automatically redistributes the application instances evenly across all of the designated Availability Zones. Since the application is extremely critical and needs to have a reliable architecture to support it, the Amazon EC2 instances should be maintained in at least two Availability Zones (AZs) for uninterrupted service.

Amazon EC2 Auto Scaling attempts to distribute instances evenly between the Availability Zones that are enabled for your Auto Scaling group. This is why the minimum capacity should be 4 instances and not 2. Auto Scaling group will launch 2 instances each in both the AZs and this redundancy is needed to keep the service available always.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- The Auto Scaling group should be configured with the minimum capacity set to 2, with 1 instance each in two different Availability Zones. The maximum capacity of the Auto Scaling group should be set to 6

- The Auto Scaling group should be configured with the minimum capacity set to 2 and the maximum capacity set to 6 in a single Availability Zone

- The explanation above gives the correct rationale for minimum capacity as well as the instance distribution across AZs, so both these options are incorrect.

- **The Auto Scaling group should be configured with the minimum capacity set to 4, with 2 instances each in two different AWS Regions. The maximum capacity of the Auto Scaling group should be set to 6**:
  An Auto Scaling group can contain Amazon EC2 instances in one or more Availability Zones within the same region. However, Auto Scaling groups cannot span multiple Regions.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - auto scaling benefits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html)

</details>

---

<div id="question-30"></div>

### Question 30: Real-Time Streaming Ingestion and PII Masking with Kinesis Data Streams and Lambda
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A financial services company runs its flagship web application on AWS. The application serves thousands of users during peak hours. The company needs a scalable near-real-time solution to share hundreds of thousands of financial transactions with multiple internal applications. The solution should also remove sensitive details from the transactions before storing the cleansed transactions in a document database for low-latency retrieval.

As an AWS Certified Solutions Architect Associate, which of the following would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Batch process the raw transactions data into Amazon S3 flat files. Use S3 events to trigger an AWS Lambda function to remove sensitive data from the raw transactions in the flat file and then store the cleansed transactions in Amazon DynamoDB. Leverage DynamoDB Streams to share the transactions data with the internal applications
- **(B)** Persist the raw transactions into Amazon DynamoDB. Configure a rule in Amazon DynamoDB to update the transaction by removing sensitive data whenever any new raw transaction is written. Leverage Amazon DynamoDB Streams to share the transactions data with the internal applications
- **(C)** Feed the streaming transactions into Amazon Kinesis Data Streams. Leverage AWS Lambda integration to remove sensitive data from every transaction and then store the cleansed transactions in Amazon DynamoDB. The internal applications can consume the raw transactions off the Amazon Kinesis Data Stream `[Đáp án đúng ✅]`
- **(D)** Feed the streaming transactions into Amazon Kinesis Data Firehose. Leverage AWS Lambda integration to remove sensitive data from every transaction and then store the cleansed transactions in Amazon DynamoDB. The internal applications can consume the raw transactions off the Amazon Kinesis Data Firehose `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Feed the streaming transactions into Amazon Kinesis Data Streams. Leverage AWS Lambda integration to remove sensitive data from every transaction and then store the cleansed transactions in Amazon DynamoDB. The internal applications can consume the raw transactions off the Amazon Kinesis Data Stream

You can use Amazon Kinesis Data Streams to build custom applications that process or analyze streaming data for specialized needs. Amazon Kinesis Data Streams manages the infrastructure, storage, networking, and configuration needed to stream your data at the level of your data throughput. You don't have to worry about provisioning, deployment, or ongoing maintenance of hardware, software, or other services for your data streams.

> 🔗 **Tài liệu tham khảo trực quan**: [How Amazon Kinesis Data Streams Work:](https://aws.amazon.com/kinesis/data-streams/)
> 🔗 **Tài liệu tham khảo trực quan**: [Amazon Kinesis Data Streams Key Concepts:](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html)
For the given use case, you can stream the raw financial transactions into Amazon Kinesis Data Streams, which in turn, are processed by the AWS Lambda function that is set up as one of the consumers of the data stream. The Lambda would remove sensitive data from every transaction and then store the cleansed transactions in Amazon DynamoDB. The internal applications can be configured as the other consumers of the data stream and ingest the raw transactions

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Batch process the raw transactions data into Amazon S3 flat files. Use S3 events to trigger an AWS Lambda function to remove sensitive data from the raw transactions in the flat file and then store the cleansed transactions in Amazon DynamoDB. Leverage DynamoDB Streams to share the transactions data with the internal applications**:
  The use case requires a near-real-time solution for cleansing, processing and storing the transactions, so using a batch process would be incorrect.

> 🔗 **Tài liệu tham khảo trực quan**: [Feed the streaming transactions into Amazon Kinesis Data Firehose. Leverage AWS Lambda integration to remove sensitive data from every transaction and then store the cleansed transactions in Amazon DynamoDB. The internal applications can consume the raw transactions off the Amazon Kinesis Data Firehose - Amazon Kinesis Data Firehose is an extract, transform, and load (ETL) service that reliably captures, transforms, and delivers streaming data to data lakes, data stores, and analytics services.](https://aws.amazon.com/kinesis/data-firehose/)
You cannot set up multiple consumers for Amazon Kinesis Data Firehose delivery streams as it can dump data in a single data repository at a time, so this option is incorrect.

- **Persist the raw transactions into Amazon DynamoDB. Configure a rule in Amazon DynamoDB to update the transaction by removing sensitive data whenever any new raw transaction is written. Leverage Amazon DynamoDB Streams to share the transactions data with the internal applications**:
  There is no such rule within Amazon DynamoDB that can auto-update every time a new item is written in a DynamoDB table. You would need to use a Amazon DynamoDB trigger to invoke an external service like a Lambda function on every new write, which can then cleanse and update the item. In addition, this process introduces inefficiency in the workflow as the same item is written and then updated for cleansing purposes. Therefore this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-streams/)
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-firehose/)
- 🌐 [AWS Docs: streams - key concepts](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html)

</details>

---

<div id="question-31"></div>

### Question 31: Centralized Multi-VPC and Hybrid Routing Architecture with AWS Transit Gateway
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
The infrastructure team at a company maintains 5 different VPCs (let's call these VPCs A, B, C, D, E) for resource isolation. Due to the changed organizational structure, the team wants to interconnect all VPCs together. To facilitate this, the team has set up VPC peering connection between VPC A and all other VPCs in a hub and spoke model with VPC A at the center. However, the team has still failed to establish connectivity between all VPCs.

As a solutions architect, which of the following would you recommend as the MOST resource-efficient and scalable solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Establish VPC peering connections between all VPCs
- **(B)** Use AWS transit gateway to interconnect the VPCs `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use an internet gateway to interconnect the VPCs
- **(D)** Use a VPC endpoint to interconnect the VPCs

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS transit gateway to interconnect the VPCs

An AWS transit gateway is a network transit hub that you can use to interconnect your virtual private clouds (VPC) and on-premises networks.

> 🔗 **Tài liệu tham khảo trực quan**: [AWS Transit Gateway Overview:](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)
A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Transitive Peering does not work for VPC peering connections. So, if you have a VPC peering connection between VPC A and VPC B (pcx-aaaabbbb), and between VPC A and VPC C (pcx-aaaacccc). Then, there is no VPC peering connection between VPC B and VPC C. Instead of using VPC peering, you can use an AWS Transit Gateway that acts as a network transit hub, to interconnect your VPCs or connect your VPCs with on-premises networks. Therefore this is the correct option.

> 🔗 **Tài liệu tham khảo trực quan**: [VPC Peering Connections Overview:](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use an internet gateway to interconnect the VPCs**:
  An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet. It, therefore, imposes no availability risks or bandwidth constraints on your network traffic. You cannot use an internet gateway to interconnect your VPCs and on-premises networks, hence this option is incorrect.

- **Use a VPC endpoint to interconnect the VPCs**:
  A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. You cannot use a VPC endpoint to interconnect your VPCs and on-premises networks, hence this option is incorrect.

- **Establish VPC peering connections between all VPCs**:
  Establishing VPC peering between all VPCs is an inelegant and clumsy way to establish connectivity between all VPCs. Instead, you should use a Transit Gateway that acts as a network transit hub to interconnect your VPCs and on-premises networks.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - what is vpc peering](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html)
- 🌐 [AWS Docs: vpc - what is transit gateway](https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html)

</details>

---

<div id="question-32"></div>

### Question 32: Centralizing Application Logs from EC2 to CloudWatch Logs via CloudWatch Agent
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
You have built an application that is deployed with Elastic Load Balancing and an Auto Scaling Group. As a Solutions Architect, you have configured aggressive Amazon CloudWatch alarms, making your Auto Scaling Group (ASG) scale in and out very quickly, renewing your fleet of Amazon EC2 instances on a daily basis. A production bug appeared two days ago, but the team is unable to SSH into the instance to debug the issue, because the instance has already been terminated by the Auto Scaling Group. The log files are saved on the Amazon EC2 instance.

How will you resolve the issue and make sure it doesn't happen again?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Disable the Termination from the Auto Scaling Group any time a user reports an issue
- **(B)** Make a snapshot of the Amazon EC2 instance just before it gets terminated
- **(C)** Use AWS Lambda to regularly SSH into the Amazon EC2 instances and copy the log files to Amazon S3
- **(D)** Install an Amazon CloudWatch Logs agents on the Amazon EC2 instances to send logs to Amazon CloudWatch `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Install an Amazon CloudWatch Logs agents on the Amazon EC2 instances to send logs to Amazon CloudWatch

You can use the Amazon CloudWatch Logs agent installer on an existing Amazon EC2 instance to install and configure the Amazon CloudWatch Logs agent. After installation is complete, logs automatically flow from the instance to the log stream you create while installing the agent. The agent confirms that it has started and it stays running until you disable it.

Here, the natural and by far the easiest solution would be to use the Amazon CloudWatch Logs agents on the Amazon EC2 instances to automatically send log files into Amazon CloudWatch, so we can analyze them in the future easily should any problem arise.

To control whether an Auto Scaling group can terminate a particular instance when scaling in, use instance scale-in protection. You can enable the instance scale-in protection setting on an Auto Scaling group or on an individual Auto Scaling instance. When the Auto Scaling group launches an instance, it inherits the instance scale-in protection setting of the Auto Scaling group. You can change the instance scale-in protection setting for an Auto Scaling group or an Auto Scaling instance at any time.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Disable the Termination from the Auto Scaling Group any time a user reports an issue**:
  Disabling the Termination from the Auto Scaling Group would prevent our Auto Scaling Group from being Elastic and impact our costs. Therefore this option is incorrect.

- **Make a snapshot of the Amazon EC2 instance just before it gets terminated**:
  Making a snapshot of the Amazon EC2 instance before it gets terminated could work but it's tedious, not elastic and very expensive, since our interest is just the log files. Therefore this option is not the best fit for the given use-case.

- You can back up the data on your Amazon EBS volumes to Amazon S3 by taking point-in-time snapshots. Snapshots are incremental backups, which means that only the blocks on the device that have changed after your most recent snapshot are saved. This minimizes the time required to create the snapshot and saves on storage costs by not duplicating data.

- **Use AWS Lambda to regularly SSH into the Amazon EC2 instances and copy the log files to Amazon S3**:
  AWS Lambda lets you run code without provisioning or managing servers. It cannot be used for production-grade serverless log analytics. Using AWS Lambda would be extremely hard to use for this task. Therefore this option is not the best fit for the given use-case.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudWatch - QuickStartEC2Instance](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/QuickStartEC2Instance.html)

</details>

---

<div id="question-33"></div>

### Question 33: Dedicated Real-Time Read Throughput for Multiple Consumers with Kinesis Enhanced Fan-Out
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A big data analytics company is using Amazon Kinesis Data Streams (KDS) to process IoT data from the field devices of an agricultural sciences company. Multiple consumer applications are using the incoming data streams and the engineers have noticed a performance lag for the data delivery speed between producers and consumers of the data streams.

As a solutions architect, which of the following would you recommend for improving the performance for the given use-case?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Enhanced Fanout feature of Amazon Kinesis Data Streams `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Swap out Amazon Kinesis Data Streams with Amazon Kinesis Data Firehose
- **(C)** Swap out Amazon Kinesis Data Streams with Amazon SQS FIFO queues
- **(D)** Swap out Amazon Kinesis Data Streams with Amazon SQS Standard queues

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Enhanced Fanout feature of Amazon Kinesis Data Streams

Amazon Kinesis Data Streams (KDS) is a massively scalable and durable real-time data streaming service. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources such as website clickstreams, database event streams, financial transactions, social media feeds, IT logs, and location-tracking events.

By default, the 2MB/second/shard output is shared between all of the applications consuming data from the stream. You should use enhanced fan-out if you have multiple consumers retrieving data from a stream in parallel. With enhanced fan-out developers can register stream consumers to use enhanced fan-out and receive their own 2MB/second pipe of read throughput per shard, and this throughput automatically scales with the number of shards in a stream.

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon Kinesis Data Streams Fanout:](https://aws.amazon.com/blogs/aws/kds-enhanced-fanout/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Swap out Amazon Kinesis Data Streams with Amazon Kinesis Data Firehose**:
  Amazon Kinesis Data Firehose is the easiest way to reliably load streaming data into data lakes, data stores, and analytics tools. It is a fully managed service that automatically scales to match the throughput of your data and requires no ongoing administration. It can also batch, compress, transform, and encrypt the data before loading it, minimizing the amount of storage used at the destination and increasing security. Amazon Kinesis Data Firehose can only write to Amazon S3, Amazon Redshift, Amazon Elasticsearch or Splunk. You can't have applications consuming data streams from Amazon Kinesis Data Firehose, that's the job of Amazon Kinesis Data Streams. Therefore this option is not correct.

- Swap out Amazon Kinesis Data Streams with Amazon SQS Standard queues

- Swap out Amazon Kinesis Data Streams with Amazon SQS FIFO queues

- Amazon Simple Queue Service (Amazon SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. Amazon SQS offers two types of message queues. Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery. Amazon SQS FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent. As multiple applications are consuming the same stream concurrently, both Amazon SQS Standard and Amazon SQS FIFO are not the right fit for the given use-case.

- Exam Alert:

- **> 🔗 **Tài liệu tham khảo trực quan****:
  [Please understand the differences between the capabilities of Amazon Kinesis Data Streams vs Amazon SQS, as you may be asked scenario-based questions on this topic in the exam.](https://aws.amazon.com/kinesis/data-streams/faqs/)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: kds enhanced fanout](https://aws.amazon.com/blogs/aws/kds-enhanced-fanout/)
- 🌐 [AWS Service Overview: kinesis](https://aws.amazon.com/kinesis/data-streams/faqs/)

</details>

---

<div id="question-34"></div>

### Question 34: Secure Enterprise Hybrid Connectivity via AWS Site-to-Site VPN and Network Routing
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A retail enterprise is expanding its hybrid IT infrastructure and plans to securely connect its on-premises corporate network to its AWS environment. The company wants to ensure that all data exchanged between on-premises systems and AWS is encrypted at both the network and session layers. Additionally, the solution must incorporate granular security controls that restrict unnecessary or unauthorized access between the cloud and on-premises environments. A solutions architect must recommend a scalable and secure approach that supports these goals.

Which solution best meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Establish a dedicated AWS Direct Connect connection between the corporate network and AWS. Configure VPC route tables to control traffic flow and use security groups and network ACLs to restrict access as needed `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** Set up a bastion host in a public subnet of the VPC to provide SSH-based access to AWS resources from the corporate network. Use security groups to control access
- **(C)** Set up AWS Site-to-Site VPN to connect the on-premises network to the AWS VPC. Use route tables to manage traffic flow and configure security groups and network ACLs to allow only authorized communication between systems `[Đáp án đúng ✅]`
- **(D)** Use AWS Client VPN to allow corporate users to connect to the VPC individually. Manage access controls with security groups and IAM policies

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up AWS Site-to-Site VPN to connect the on-premises network to the AWS VPC. Use route tables to manage traffic flow and configure security groups and network ACLs to allow only authorized communication between systems

AWS Site-to-Site VPN uses IPsec tunnels, which provide encryption at the network layer, ensuring that traffic is securely transmitted between the on-premises network and the VPC. By applying security groups and network ACLs, fine-grained traffic control is possible. Additionally, session-layer encryption (e.g., HTTPS, TLS) can be layered on top, satisfying both encryption requirements with minimal overhead. This is the most cost-effective and secure solution for the given requirements.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Establish a dedicated AWS Direct Connect connection between the corporate network and AWS. Configure VPC route tables to control traffic flow and use security groups and network ACLs to restrict access as needed**:
  While AWS Direct Connect provides a dedicated private connection with high bandwidth and low latency, it does not encrypt traffic at the network layer by default. Additional technologies (e.g., MACsec or an overlay VPN) are needed to secure the connection. Furthermore, session-layer encryption is not inherently addressed by Direct Connect. Without additional configuration, this approach does not meet the encryption requirements.

- **Use AWS Client VPN to allow corporate users to connect to the VPC individually. Manage access controls with security groups and IAM policies**:
  While AWS Client VPN does provide encrypted connectivity over the internet and can enable individual client devices to access AWS resources securely, it is not designed for network-to-network connectivity. This solution fails to meet the requirement of establishing a site-to-site connection between the corporate network and the VPC for seamless hybrid access. It also introduces operational complexity and does not scale well for scenarios where full internal network routing and access controls are required between entire corporate networks and AWS.

- **Set up a bastion host in a public subnet of the VPC to provide SSH-based access to AWS resources from the corporate network. Use security groups to control access**:
  A bastion host provides access at the individual server level, typically over SSH or RDP, and is useful for administrative tasks. However, it does not establish a full network-layer or session-layer encrypted connection between the corporate network and AWS resources. It also does not scale for use cases requiring broad application or service access between on-premises and AWS. This solution lacks centralized routing and traffic control, making it insufficient for secure, scalable hybrid connectivity.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpn - VPC_VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)
- 🌐 [AWS Docs: vpn - what is](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/what-is.html)
- 🌐 [AWS Docs: directconnect - encryption in transit](https://docs.aws.amazon.com/directconnect/latest/UserGuide/encryption-in-transit.html)

</details>

---

<div id="question-35"></div>

### Question 35: Resolving Auto Scaling Health Check Inconsistencies with ALB ELB Health Checks
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A streaming solutions company is building a video streaming product by using an Application Load Balancer (ALB) that routes the requests to the underlying Amazon EC2 instances. The engineering team has noticed a peculiar pattern. The Application Load Balancer removes an instance from its pool of healthy instances whenever it is detected as unhealthy but the Auto Scaling group fails to kick-in and provision the replacement instance.

What could explain this anomaly?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The Auto Scaling group is using Amazon EC2 based health check and the Application Load Balancer is using ALB based health check `[Đáp án đúng ✅]`
- **(B)** Both the Auto Scaling group and Application Load Balancer are using ALB based health check
- **(C)** The Auto Scaling group is using ALB based health check and the Application Load Balancer is using Amazon EC2 based health check
- **(D)** Both the Auto Scaling group and Application Load Balancer are using Amazon EC2 based health check `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The Auto Scaling group is using Amazon EC2 based health check and the Application Load Balancer is using ALB based health check

An Auto Scaling group contains a collection of Amazon EC2 instances that are treated as a logical grouping for automatic scaling and management.

> 🔗 **Tài liệu tham khảo trực quan**: [Auto Scaling Group Overview:](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
Application Load Balancer automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, and AWS Lambda functions. It can handle the varying load of your application traffic in a single Availability Zone or across multiple Availability Zones.

If the Auto Scaling group (ASG) is using EC2 as the health check type and the Application Load Balancer (ALB) is using its in-built health check, there may be a situation where the ALB health check fails because the health check pings fail to receive a response from the instance. At the same time, ASG health check can come back as successful because it is based on EC2 based health check. Therefore, in this scenario, the ALB will remove the instance from its inventory, however, the Auto Scaling Group will fail to provide the replacement instance. This can lead to the scaling issues mentioned in the problem statement.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **The Auto Scaling group is using ALB based health check and the Application Load Balancer is using Amazon EC2 based health check**:
  Application Load Balancer cannot use EC2 based health checks, so this option is incorrect.

- **Both the Auto Scaling group and Application Load Balancer are using ALB based health check**:
  It is recommended to use ALB based health checks for both Auto Scaling group and Application Load Balancer. If both the Auto Scaling group and Application Load Balancer use ALB based health checks, then you will be able to avoid the scenario mentioned in the question.

- **Both the Auto Scaling group and Application Load Balancer are using Amazon EC2 based health check**:
  Application Load Balancer cannot use EC2 based health checks, so this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - ec2 auto scaling health checks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-health-checks.html)
- 🌐 [AWS Docs: autoscaling - health checks overview](https://docs.aws.amazon.com/autoscaling/ec2/userguide/health-checks-overview.html)
- 🌐 [AWS Docs: autoscaling - as add elb healthcheck](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-add-elb-healthcheck.html)

</details>

---

<div id="question-36"></div>

### Question 36: Hybrid EC2 Purchasing Strategy: Reserved Instances for Baseline and Spot for Spikes
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A financial data processing company runs a workload on Amazon EC2 instances that fetch and process real-time transaction batches from an Amazon SQS queue. The application needs to scale based on unpredictable message volume, which fluctuates significantly throughout the day. The system must process messages with minimal delay and no downtime, even during peak spikes. The company is seeking a solution that balances cost-efficiency with availability and elasticity.

Which EC2 purchasing strategy best meets these requirements in the most cost-effective manner?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Purchase EC2 Reserved Instances to match peak capacity and assign all message processing tasks to these instances regardless of load variations
- **(B)** Use EC2 Reserved Instances for the baseline workload and configure EC2 Auto Scaling to launch On-Demand Instances for all traffic spikes `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Use EC2 Spot Instances exclusively with Auto Scaling enabled to match message volume fluctuations and save on compute costs
- **(D)** Use Reserved Instances for the baseline level of traffic and configure EC2 Auto Scaling with Spot Instances to handle spikes in message volume `[Đáp án đúng ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Reserved Instances for the baseline level of traffic and configure EC2 Auto Scaling with Spot Instances to handle spikes in message volume

This blended approach is ideal for workloads that are partially predictable and partially variable. Reserved Instances ensure cost-efficient baseline capacity for steady message ingestion, while Spot Instances are used to handle unpredictable surges in traffic, significantly reducing costs compared to On-Demand. If Spot capacity is unavailable, Auto Scaling can be configured with fallback instance types or prioritized mixed instance policies. This model maximizes cost savings without compromising on availability.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Purchase EC2 Reserved Instances to match peak capacity and assign all message processing tasks to these instances regardless of load variations**:
  While Reserved Instances (RIs) offer significant cost savings compared to On-Demand pricing, they are best suited for predictable, steady-state workloads. Using RIs to provision maximum capacity at all times, regardless of actual load, results in over-provisioning and wasted cost during low-traffic periods. This approach lacks elasticity and is not suitable for workloads with unpredictable and bursty traffic patterns.

- **Use EC2 Spot Instances exclusively with Auto Scaling enabled to match message volume fluctuations and save on compute costs**:
  Spot Instances provide deep cost savings, but they can be interrupted by AWS with only two minutes of warning if capacity is reclaimed. Using them exclusively for a mission-critical workload with real-time, parallel processing introduces risk of downtime and message loss, especially if traffic spikes coincide with Spot interruptions. For fault-tolerant or batch jobs, this could work—but not for always-on processing with strict uptime requirements.

- **Use EC2 Reserved Instances for the baseline workload and configure EC2 Auto Scaling to launch On-Demand Instances for all traffic spikes**:
  While combining Reserved Instances for baseline capacity with On-Demand Instances for additional traffic is a functional and reliable solution, it is not the most cost-effective choice for a workload with unpredictable, intermittent spikes like real-time message processing. On-Demand Instances are priced at a premium and can lead to significantly higher costs when scaling frequently. A blended model using Reserved + Spot Instances would better balance availability and cost.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - ec2 auto scaling mixed instances groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html)
- 🌐 [AWS Docs: AWSEC2 - using spot instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
- 🌐 [AWS Docs: savingsplans - what is savings plans](https://docs.aws.amazon.com/savingsplans/latest/userguide/what-is-savings-plans.html)

</details>

---

<div id="question-37"></div>

### Question 37: Accelerating Global Static Image Downloads with Amazon CloudFront and S3 Origin
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (C) | **Đáp án đúng**: (A), (C)

#### 📋 Đề bài (Scenario)
Reporters at a news agency upload/download video files (about 500 megabytes each) to/from an Amazon S3 bucket as part of their daily work. As the agency has started offices in remote locations, it has resulted in poor latency for uploading and accessing data to/from the given Amazon S3 bucket. The agency wants to continue using a serverless storage solution such as Amazon S3 but wants to improve the performance.

As a solutions architect, which of the following solutions do you propose to address this issue? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon CloudFront distribution with origin as the Amazon S3 bucket. This would speed up uploads as well as downloads for the video files `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Spin up Amazon EC2 instances in each region where the agency has a remote office. Create a daily job to transfer Amazon S3 data into Amazon EBS volumes attached to the Amazon EC2 instances
- **(C)** Enable Amazon S3 Transfer Acceleration (Amazon S3TA) for the Amazon S3 bucket. This would speed up uploads as well as downloads for the video files `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Create new Amazon S3 buckets in every region where the agency has a remote office, so that each office can maintain its storage for the media assets
- **(E)** Move Amazon S3 data into Amazon Elastic File System (Amazon EFS) created in a US region, connect to Amazon EFS file system from Amazon EC2 instances in other AWS regions using an inter-region VPC peering connection

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon CloudFront distribution with origin as the Amazon S3 bucket. This would speed up uploads as well as downloads for the video files

Amazon CloudFront is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, within a developer-friendly environment. When an object from Amazon S3 that is set up with Amazon CloudFront CDN is requested, the request would come through the Edge Location transfer paths only for the first request. Thereafter, it would be served from the nearest edge location to the users until it expires. So in this way, you can speed up uploads as well as downloads for the video files.

Following is a good reference blog for a deep-dive:

https://aws.amazon.com/blogs/aws/amazon-cloudfront-content-uploads-post-put-other-methods/

Enable Amazon S3 Transfer Acceleration (Amazon S3TA) for the Amazon S3 bucket. This would speed up uploads as well as downloads for the video files

Amazon S3 Transfer Acceleration (Amazon S3TA) can speed up content transfers to and from Amazon S3 by as much as 50-500% for long-distance transfer of larger objects. Transfer Acceleration takes advantage of Amazon CloudFront’s globally distributed edge locations. As the data arrives at an edge location, data is routed to Amazon S3 over an optimized network path. So this option is also correct.

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon S3TA:](https://aws.amazon.com/s3/transfer-acceleration/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Create new Amazon S3 buckets in every region where the agency has a remote office, so that each office can maintain its storage for the media assets**:
  Creating new Amazon S3 buckets in every region is not an option, since the agency maintains centralized storage. Hence this option is incorrect.

- Move Amazon S3 data into Amazon Elastic File System (Amazon EFS) created in a US region, connect to Amazon EFS file system from Amazon EC2 instances in other AWS regions using an inter-region VPC peering connection

- Spin up Amazon EC2 instances in each region where the agency has a remote office. Create a daily job to transfer Amazon S3 data into Amazon EBS volumes attached to the Amazon EC2 instances

- Both these options using Amazon EC2 instances are not correct for the given use-case, as the agency wants a serverless storage solution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonCloudFront - DownloadDistS3AndCustomOrigins](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DownloadDistS3AndCustomOrigins.html)
- 🌐 [AWS Docs: AmazonS3 - transfer acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html)
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/transfer-acceleration/)
- 🌐 [AWS Architecture Blog: amazon cloudfront content uploads post put other methods](https://aws.amazon.com/blogs/aws/amazon-cloudfront-content-uploads-post-put-other-methods/)

</details>

---

<div id="question-38"></div>

### Question 38: Multi-Region Active-Active Database Replication Using DynamoDB Global Tables
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A mobile-based e-learning platform is migrating its backend storage layer to Amazon DynamoDB to support a rapidly increasing number of student users and learning transactions. The platform must ensure seamless availability and minimal disruption for a global user base. The DynamoDB design must provide low-latency performance, high availability, and automatic fault tolerance across geographies with the lowest possible operational overhead and cost.

Which solution will fulfill these needs in the most cost-efficient manner?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create separate DynamoDB tables in multiple Regions. Use AWS Data Pipeline to synchronize data periodically between Regions to maintain availability
- **(B)** Deploy separate DynamoDB tables in each required AWS Region using on-demand capacity mode. Implement a custom cross-Region replication mechanism by streaming data changes with DynamoDB Streams and processing them through AWS Lambda functions
- **(C)** Use DynamoDB global tables for automatic multi-Region replication. Enable provisioned capacity mode with auto scaling to optimize cost and ensure consistent availability `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Enable DynamoDB Accelerator (DAX) to reduce response time for read operations. Deploy DAX in one Region, and use scheduled Lambda functions to replicate data to other Regions

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use DynamoDB global tables for automatic multi-Region replication. Enable provisioned capacity mode with auto scaling to optimize cost and ensure consistent availability

DynamoDB global tables offer a native, multi-Region solution that provides high availability and resiliency by replicating data automatically across AWS Regions. This ensures users around the world experience low-latency read and write operations. By using provisioned capacity mode with auto scaling, the company can optimize cost based on actual throughput requirements rather than overprovisioning resources. This approach eliminates the need for manual replication or custom logic, and it ensures continuous availability in the event of a Regional disruption.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable DynamoDB Accelerator (DAX) to reduce response time for read operations. Deploy DAX in one Region, and use scheduled Lambda functions to replicate data to other Regions**:
  DAX improves read performance through in-memory caching, but it does not help with write scalability, cross-Region replication, or resiliency. Scheduled Lambda functions for replication are not real-time, can fail under high load, and add complexity to the architecture. This setup does not fulfill the requirement for continuous availability and resilience for a global user base.

- **Deploy separate DynamoDB tables in each required AWS Region using on-demand capacity mode. Implement a custom cross-Region replication mechanism by streaming data changes with DynamoDB Streams and processing them through AWS Lambda functions**:
  While DynamoDB Streams can capture real-time data modifications in a table, using them for manual cross-Region replication requires building and maintaining custom replication logic—typically with AWS Lambda functions or AWS Glue jobs. This approach introduces significant complexity, potential latency, and increased operational burden. It also lacks automated conflict resolution, version control, and automatic failover capabilities. Additionally, this setup doesn't guarantee strong consistency across Regions, and managing data conflicts or write ordering becomes challenging.

- **Create separate DynamoDB tables in multiple Regions. Use AWS Data Pipeline to synchronize data periodically between Regions to maintain availability**:
  Manually managing multiple DynamoDB tables across Regions using AWS Data Pipeline introduces significant operational complexity and replication delays. This method does not ensure real-time synchronization or automatic failover, making it unsuitable for high-throughput, latency-sensitive applications like online gaming. It also requires custom conflict resolution and lacks the seamless integration offered by global tables.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: amazondynamodb - GlobalTables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html)
- 🌐 [AWS Docs: amazondynamodb - V2globaltables_HowItWorks](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_HowItWorks.html)
- 🌐 [AWS Docs: amazondynamodb - Streams](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html)

</details>

---

<div id="question-39"></div>

### Question 39: Establishing Encrypted Hybrid On-Premises Connectivity with AWS Site-to-Site VPN
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A retail company wants to establish encrypted network connectivity between its on-premises data center and AWS Cloud. The company wants to get the solution up and running in the fastest possible time and it should also support encryption in transit.

As a solutions architect, which of the following solutions would you suggest to the company?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS Data Sync to establish encrypted network connectivity between the on-premises data center and AWS Cloud
- **(B)** Use AWS Site-to-Site VPN to establish encrypted network connectivity between the on-premises data center and AWS Cloud `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Use AWS Secrets Manager to establish encrypted network connectivity between the on-premises data center and AWS Cloud
- **(D)** Use AWS Direct Connect to establish encrypted network connectivity between the on-premises data center and AWS Cloud

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS Site-to-Site VPN to establish encrypted network connectivity between the on-premises data center and AWS Cloud

AWS Site-to-Site VPN enables you to securely connect your on-premises network or branch office site to your Amazon Virtual Private Cloud (Amazon VPC). You can securely extend your data center or branch office network to the cloud with an AWS Site-to-Site VPN connection. A VPC VPN Connection utilizes IPSec to establish encrypted network connectivity between your on-premises network and Amazon VPC over the Internet. IPsec is a protocol suite for securing IP communications by authenticating and encrypting each IP packet in a data stream.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS Direct Connect to establish encrypted network connectivity between the on-premises data center and AWS Cloud**:
  AWS Direct Connect lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. Using industry-standard 802.1q VLANs, this dedicated connection can be partitioned into multiple virtual interfaces. AWS Direct Connect does not encrypt your traffic that is in transit. To encrypt the data in transit that traverses AWS Direct Connect, you must use the transit encryption options for that service. As AWS Direct Connect does not support encrypted network connectivity between an on-premises data center and AWS Cloud, therefore this option is incorrect.

- **Use AWS Data Sync to establish encrypted network connectivity between the on-premises data center and AWS Cloud**:
  AWS DataSync makes it simple and fast to move large amounts of data online between on-premises storage and AWS. AWS DataSync eliminates or automatically handles many of these tasks, including scripting copy jobs, scheduling, and monitoring transfers, validating data, and optimizing network utilization. As AWS Data Sync cannot be used to establish network connectivity between an on-premises data center and AWS Cloud, therefore this option is incorrect.

- **Use AWS Secrets Manager to establish encrypted network connectivity between the on-premises data center and AWS Cloud**:
  AWS Secrets Manager helps you protect secrets needed to access your applications, services, and IT resources. The service enables you to easily rotate, manage, and retrieve database credentials, API keys, and other secrets throughout their lifecycle. As AWS Secrets Manager cannot be used to establish network connectivity between an on-premises data center and AWS Cloud, therefore this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpn - internetwork traffic privacy](https://docs.aws.amazon.com/vpn/latest/s2svpn/internetwork-traffic-privacy.html)
- 🌐 [AWS Docs: directconnect - encryption in transit](https://docs.aws.amazon.com/directconnect/latest/UserGuide/encryption-in-transit.html)

</details>

---

<div id="question-40"></div>

### Question 40: Encrypted Shared POSIX File Storage for Linux HPC Clusters via Amazon EFS
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A biomedical research firm operates a file exchange system for external research partners to upload and download experimental data. Currently, the system runs on two Amazon EC2 Linux instances, each configured with Elastic IP addresses to allow access from trusted IPs. File transfers use the SFTP protocol, and Linux user accounts are manually provisioned to enforce file-level access control. Data is stored on a shared file system mounted to both EC2 instances. The firm wants to modernize the solution to a fully managed, serverless model with high IOPS, fine-grained user permission control, and strict IP-based access restrictions. They also want to reduce operational overhead without sacrificing performance or security.

Which solution best meets these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon EFS with encryption enabled. Create an AWS Transfer Family SFTP endpoint in a VPC with Elastic IP addresses. Restrict access using a security group that allows traffic only from known IPs. Manage user access using POSIX identity mappings and IAM policies `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon S3 with server-side encryption enabled. Create an AWS Transfer Family SFTP endpoint with a VPC endpoint in a private subnet. Restrict access to known IPs using security group rules. Manage user-level permissions using IAM role-based access mappings
- **(C)** Use AWS Storage Gateway in file gateway mode to expose an NFS file share. Deploy AWS Transfer Family with a public endpoint and map user identities using IAM roles. Configure IP allow lists using AWS WAF
- **(D)** Use Amazon FSx for Lustre as the backend storage. Create an AWS Transfer Family SFTP service with a public endpoint. Configure IAM policies to manage user access and attach a security group that restricts access to trusted IP addresses

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon EFS with encryption enabled. Create an AWS Transfer Family SFTP endpoint in a VPC with Elastic IP addresses. Restrict access using a security group that allows traffic only from known IPs. Manage user access using POSIX identity mappings and IAM policies

This solution uses Amazon EFS, which is natively supported by AWS Transfer Family and provides shared, low-latency, and scalable file storage, ideal for high IOPS use cases. Creating the SFTP endpoint within a VPC with Elastic IP addresses allows secure, internet-facing access. Using IAM policies and POSIX user ID mappings, administrators can enforce per-user access control, similar to Linux user permissions. The security group restricts SFTP access to trusted IP addresses. This configuration satisfies all the company’s performance, security, and manageability goals in a serverless architecture.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon FSx for Lustre as the backend storage. Create an AWS Transfer Family SFTP service with a public endpoint. Configure IAM policies to manage user access and attach a security group that restricts access to trusted IP addresses**:
  While Amazon FSx for Lustre offers high-performance, POSIX-compliant storage, it is not natively integrated with AWS Transfer Family as a backend for SFTP services. Transfer Family only supports Amazon S3 and Amazon EFS as data stores. This option would require complex, unsupported workarounds to integrate FSx, making it operationally risky and unsupported.

- **Use AWS Storage Gateway in file gateway mode to expose an NFS file share. Deploy AWS Transfer Family with a public endpoint and map user identities using IAM roles. Configure IP allow lists using AWS WAF**:
  AWS Storage Gateway (file gateway mode) allows access to S3 via NFS or SMB but is not natively integrated with AWS Transfer Family. Although it supports on-premises caching and hybrid workloads, using it in this context introduces unnecessary complexity and cannot meet the requirement for native SFTP integration with a serverless backend. AWS WAF is also not applicable for SFTP traffic, as it operates on Layer 7 HTTP(S) protocols.

- **Use Amazon S3 with server-side encryption enabled. Create an AWS Transfer Family SFTP endpoint with a VPC endpoint in a private subnet. Restrict access to known IPs using security group rules. Manage user-level permissions using IAM role-based access mappings**:
  While Amazon S3 is a supported backend for AWS Transfer Family and offers excellent scalability and durability, it does not offer file system semantics or the high IOPS required by workloads involving frequent reads/writes like SFTP-based workflows. S3 performance is sufficient for bulk transfer or archiving, but EFS is a better choice for interactive file exchange with low latency and high throughput. This solution satisfies access control requirements but falls short on performance.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: transfer - what is aws transfer family](https://docs.aws.amazon.com/transfer/latest/userguide/what-is-aws-transfer-family.html)
- 🌐 [AWS Docs: filegateway - what is file s3](https://docs.aws.amazon.com/filegateway/latest/files3/what-is-file-s3.html)
- 🌐 [AWS Docs: fsx - what is](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)

</details>

---

<div id="question-41"></div>

### Question 41: Secure Ephemeral SSH Access to EC2 Without Key Management via EC2 Instance Connect
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A DevOps team is tasked with enabling secure and temporary SSH access to Amazon EC2 instances for developers during deployments. The team wants to avoid distributing long-term SSH key pairs and instead prefers ephemeral access that can be audited and revoked immediately after the session ends. The team wants direct access via the AWS Management Console.

What do you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use EC2 Instance Connect to inject a static SSH key and connect via the instance's private IP address directly from the internet
- **(B)** Use an EC2 Instance Connect Endpoint to reach the instances even though they already have public IP addresses, because Instance Connect requires an endpoint for all SSH sessions
- **(C)** Use EC2 Instance Connect to inject a temporary public key and establish SSH access using the instance’s public IP address `[Đáp án đúng ✅]`
- **(D)** Use EC2 Instance Connect with Systems Manager Agent disabled, and connect via private IP using an internal proxy endpoint `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use EC2 Instance Connect to inject a temporary public key and establish SSH access using the instance’s public IP address

Amazon EC2 Instance Connect provides a secure and auditable way to establish temporary SSH sessions to EC2 instances by injecting a one-time-use public key into the instance at connection time. When used without Session Manager, EC2 Instance Connect requires the instance to have a public IP address, and connections are made over the internet via the public IP. This setup is ideal for temporary administrative access to public instances without the need to distribute or manage long-term SSH key pairs. The session is short-lived, and logs are available via CloudTrail for auditing purposes.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use EC2 Instance Connect to inject a static SSH key and connect via the instance's private IP address directly from the internet**:
  EC2 Instance Connect does not use static SSH keys and does not support connecting over private IPs from the internet unless paired with AWS Systems Manager Session Manager. This option incorrectly assumes that private IPs are routable from the public internet, which is not the case in VPC networking. Additionally, using a static key contradicts the security design of EC2 Instance Connect, which relies on ephemeral keys to minimize risk.

- **Use EC2 Instance Connect with Systems Manager Agent disabled, and connect via private IP using an internal proxy endpoint**:
  EC2 Instance Connect does not support connecting via private IP unless integrated with Session Manager, which requires that the SSM Agent is installed and running on the instance. This option incorrectly states that you can connect via private IP without SSM Agent or Session Manager, which is technically invalid. Instance Connect without Session Manager only supports public IP-based access.

- **Use an EC2 Instance Connect Endpoint to reach the instances even though they already have public IP addresses, because Instance Connect requires an endpoint for all SSH sessions**:
  EC2 Instance Connect does not require an EC2 Instance Connect Endpoint when the target instance has a public IPv4 address; in that case you can connect directly over the internet and have a temporary SSH public key injected at connection time. EC2 Instance Connect Endpoints are specifically intended to let you connect to instances in private subnets without public IPs or direct internet connectivity, providing a managed entry point within your VPC. Adding an endpoint for publicly reachable instances adds unnecessary operational overhead and cost, and it misinterprets the feature’s purpose.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - ec2 instance connect methods](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-methods.html)
- 🌐 [AWS Docs: AWSEC2 - connect with ec2 instance connect endpoint](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-with-ec2-instance-connect-endpoint.html)
- 🌐 [AWS Docs: systems-manager - session manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html)

</details>

---

<div id="question-42"></div>

### Question 42: Protection Against Accidental EBS Snapshot Deletion with AWS Recycle Bin Retention Rules
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company hosts a Microsoft SQL Server database on Amazon EC2 instances with attached Amazon EBS volumes. The operations team takes daily snapshots of these EBS volumes as backups. However, a recent incident occurred in which an automated script designed to clean up expired snapshots accidentally deleted all available snapshots, leading to potential data loss. The company wants to improve the backup strategy to avoid permanent data loss while still ensuring that old snapshots are eventually removed to optimize cost. A solutions architect needs to implement a mechanism that prevents immediate and irreversible deletion of snapshots.

Which solution will best meet these requirements with the least development effort?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a 7-day EBS snapshot retention rule in Recycle Bin and apply the rule for all snapshots `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable AWS Backup Vault Lock on the backup vault and store EBS snapshots in that vault to enforce deletion protection
- **(C)** Set up the IAM policy of the user to deny EBS snapshot deletion
- **(D)** Implement a Lambda-based backup automation workflow that archives snapshot metadata in DynamoDB and stores backups in Amazon S3 Glacier Deep Archive for long-term recovery

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up a 7-day EBS snapshot retention rule in Recycle Bin and apply the rule for all snapshots

The Amazon EBS Snapshot Recycle Bin allows organizations to retain deleted snapshots for a fixed duration before they are permanently deleted. By configuring a 7-day retention rule, snapshots that are deleted by mistake (e.g., through a faulty script) can still be recovered within the defined period. This provides protection from accidental deletion and satisfies the requirement to eventually remove old snapshots—thus balancing safety and cost. It requires minimal setup and no significant development effort.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Implement a Lambda-based backup automation workflow that archives snapshot metadata in DynamoDB and stores backups in Amazon S3 Glacier Deep Archive for long-term recovery**:
  This approach adds significant development effort and does not natively prevent snapshot deletion. So, it is incorrect.

- **Enable AWS Backup Vault Lock on the backup vault and store EBS snapshots in that vault to enforce deletion protection**:
  This option appears secure by referencing Vault Lock, which can enforce write-once, read-many (WORM) policies for backups. However, EBS snapshots are not directly stored in AWS Backup vaults unless they are created through AWS Backup, and the original setup is using manual or script-driven EBS snapshot creation. Additionally, Vault Lock applies only to backups managed by AWS Backup, not to independently created snapshots through Amazon EC2 or custom scripts. Therefore, while it introduces a secure mechanism, it does not address the current architecture or snapshot process, making it an unsuitable solution without significant re-architecture.

- **Set up the IAM policy of the user to deny EBS snapshot deletion**:
  While denying deletion can prevent accidental loss, it also completely blocks all snapshot deletions, including those that are genuinely expired or no longer needed. This violates the requirement to avoid indefinite snapshot retention, leading to storage bloat and increased cost.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: ebs - recycle bin](https://docs.aws.amazon.com/ebs/latest/userguide/recycle-bin.html)
- 🌐 [AWS Docs: aws-backup - vault lock](https://docs.aws.amazon.com/aws-backup/latest/devguide/vault-lock.html)

</details>

---

<div id="question-43"></div>

### Question 43: Enforcing Strict Regulatory Data Retention Using S3 Object Lock Compliance Mode
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A financial auditing firm uses Amazon S3 to store sensitive client records that are subject to write-once-read-many (WORM) regulations to prevent alteration or deletion of records for a specific retention period. The firm wants to enforce immutable storage, such that even administrators cannot overwrite or delete the records during the lock duration. They also need audit-friendly enforcement to prevent accidental or malicious deletion.

Which configuration of S3 Object Lock will ensure that the retention policy is strictly enforced, and no user (including root or administrators) can override or delete protected objects during the lock period?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use S3 Lifecycle Policies to transition data to Glacier Deep Archive and treat it as immutable during the archival period
- **(B)** Use S3 Object Lock in Compliance Mode, which enforces retention policies strictly and prevents all users from modifying or deleting data during the retention period `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Enable S3 Versioning and set a bucket policy that denies s3:DeleteObject to all users during the retention period
- **(D)** Use S3 Object Lock in Governance Mode, which allows only IAM users with elevated permissions to override or remove retention settings

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use S3 Object Lock in Compliance Mode, which enforces retention policies strictly and prevents all users from modifying or deleting data during the retention period

> 🔗 **Tài liệu tham khảo trực quan**: [S3 Object Lock in Compliance Mode is designed to meet stringent regulatory requirements. In this mode, no user, not even the root user, can override or delete a locked object until the retention period expires. This ensures strict WORM behavior, making Compliance Mode ideal for regulated industries where immutability must be enforced regardless of user permissions. Attempting to modify or delete objects locked in compliance mode results in an AccessDenied error, even for administrators.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html#object-lock-retention-modes)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use S3 Object Lock in Governance Mode, which allows only IAM users with elevated permissions to override or remove retention settings**:
  Governance Mode also provides WORM-like protections, but unlike Compliance Mode, it allows privileged users (with the s3:BypassGovernanceRetention permission) to override retention settings or delete objects before the retention period expires. This is useful in environments where operational flexibility is needed, but does not meet regulatory immutability requirements because deletions are still technically possible. Therefore, Governance Mode is not sufficient for legally enforced retention.

- **Enable S3 Versioning and set a bucket policy that denies s3:DeleteObject to all users during the retention period**:
  While enabling versioning and denying s3:DeleteObject through a bucket policy can prevent casual deletion, this approach is not tamper-proof and does not meet regulatory compliance for WORM storage. A user with sufficient IAM permissions (e.g., policy modification rights) can update or remove the bucket policy, making this control circumventable. Object Lock in Compliance Mode provides enforced immutability, which cannot be achieved using only versioning and bucket policies.

- **Use S3 Lifecycle Policies to transition data to Glacier Deep Archive and treat it as immutable during the archival period**:
  S3 Lifecycle Policies are used to transition objects between storage classes or delete them after a specified time. Transitioning data to Glacier Deep Archive does not make the objects immutable. Users can still delete archived objects unless Object Lock is also enabled. Lifecycle configurations are not designed for WORM enforcement and do not prevent deletion or modification during archival.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - object lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html#object-lock-retention-modes)

</details>

---

<div id="question-44"></div>

### Question 44: Hybrid Cloud Local File Caching and On-Premises Storage via S3 File Gateway
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A digital content production company has transitioned all of its media assets to Amazon S3 in an effort to reduce storage costs. However, the rendering engine used in production continues to run in an on-premises data center and requires frequent and low-latency access to large media files. The company wants to implement a storage solution that maintains application performance while keeping costs low.

Which approach should the company choose to meet these requirements in the most cost-effective way?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up a dedicated on-premises storage array that periodically fetches data from Amazon S3 using a custom-built application. Mount this storage volume on the rendering servers as their primary working directory
- **(B)** Use Mountpoint for Amazon S3 on the on-premises rendering servers to facilitate low-latency access to the S3 bucket `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Set up an Amazon S3 File Gateway to provide storage for the on-premises application `[Đáp án đúng ✅]`
- **(D)** Deploy an Amazon FSx for Lustre file system and sync media data from Amazon S3 into it using DataSync. Mount the FSx file system on the on-premises render servers using a VPN tunnel

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up an Amazon S3 File Gateway to provide storage for the on-premises application

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon S3 File Gateway is designed specifically for on-premises applications that need low-latency access to S3 data. It caches frequently accessed data locally and exposes the S3 bucket as an NFS or SMB file share, making it ideal for performance-sensitive workloads like rendering. It is also cost-effective as the majority of data remains in S3.](https://docs.aws.amazon.com/filegateway/latest/files3/what-is-file-s3.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an Amazon FSx for Lustre file system and sync media data from Amazon S3 into it using DataSync. Mount the FSx file system on the on-premises render servers using a VPN tunnel**:
  While Amazon FSx for Lustre is a high-performance file system suited for HPC and rendering workloads, it incurs higher costs than simpler alternatives and is typically optimized for cloud-based compute rather than on-premises usage. Additionally, the use of AWS DataSync and VPN tunneling introduces complexity and potential performance bottlenecks for consistent two-way file access.

- **Use Mountpoint for Amazon S3 on the on-premises rendering servers to facilitate low-latency access to the S3 bucket**:
  Mountpoint for Amazon S3 is an open source file client that makes it easy for your file-aware Linux applications to connect directly to Amazon S3 buckets. It can also be installed on your existing on-premises systems, with access to S3 either directly or over an AWS Direct Connect connection via AWS PrivateLink for Amazon S3. It is not POSIX compliant. It is not intended for low-latency or local caching use-cases from on-premises environments.

- **Set up a dedicated on-premises storage array that periodically fetches data from Amazon S3 using a custom-built application. Mount this storage volume on the rendering servers as their primary working directory**:
  This solution requires developing and maintaining a custom integration layer to periodically download files from S3 and sync with local storage. It increases operational burden and introduces latency and consistency issues. Additionally, the costs of maintaining on-premises hardware negate the cost benefits of moving to S3 in the first place.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: filegateway - what is file s3](https://docs.aws.amazon.com/filegateway/latest/files3/what-is-file-s3.html)
- 🌐 [AWS Architecture Blog: mountpoint for amazon s3 generally available and ready for production workloads](https://aws.amazon.com/blogs/aws/mountpoint-for-amazon-s3-generally-available-and-ready-for-production-workloads/)

</details>

---

<div id="question-45"></div>

### Question 45: Storage Tiering Hierarchy: EC2 Instance Store vs Amazon S3 vs Amazon S3 Glacier
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A media company is evaluating the possibility of moving its IT infrastructure to the AWS Cloud. The company needs at least 10 terabytes of storage with the maximum possible I/O performance for processing certain files which are mostly large videos. The company also needs close to 450 terabytes of very durable storage for storing media content and almost double of it, i.e. 900 terabytes for archival of legacy data.

As a Solutions Architect, which set of services will you recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon S3 standard storage for maximum performance, Amazon S3 Intelligent-Tiering for intelligent, durable storage, and Amazon S3 Glacier Deep Archive for archival storage
- **(B)** Amazon EC2 instance store for maximum performance, Amazon S3 for durable data storage, and Amazon S3 Glacier for archival storage `[Đáp án đúng ✅]`
- **(C)** Amazon EBS for maximum performance, Amazon S3 for durable data storage, and Amazon S3 Glacier for archival storage `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Amazon EC2 instance store for maximum performance, AWS Storage Gateway for on-premises durable data access and Amazon S3 Glacier Deep Archive for archival storage

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EC2 instance store for maximum performance, Amazon S3 for durable data storage, and Amazon S3 Glacier for archival storage

An instance store provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer. Instance store is ideal for the temporary storage of information that changes frequently, such as buffers, caches, scratch data, and other temporary content, or for data that is replicated across a fleet of instances, such as a load-balanced pool of web servers.

You can specify instance store volumes for an instance only when you launch it. You can't detach an instance store volume from one instance and attach it to a different instance.

Some instance types use NVMe or SATA-based solid-state drives (SSD) to deliver high random I/O performance. This is a good option when you need storage with very low latency, but you don't need the data to persist when the instance terminates or you can take advantage of fault-tolerant architectures.

Amazon S3 Standard offers high durability, availability, and performance object storage for frequently accessed data. Because it delivers low latency and high throughput, Amazon S3 Standard is appropriate for a wide variety of use cases, including cloud applications, dynamic websites, content distribution, mobile and gaming applications, and big data analytics.

Amazon S3 Glacier is a secure, durable, and low-cost storage class for data archiving. You can reliably store any amount of data at costs that are competitive with or cheaper than on-premises solutions. To keep costs low yet suitable for varying needs, Amazon S3 Glacier provides three retrieval options that range from a few minutes to hours. You can upload objects directly to Amazon S3 Glacier, or use S3 Lifecycle policies to transfer data between any of the Amazon S3 Storage Classes for active data (S3 Standard, S3 Intelligent-Tiering, S3 Standard-IA, and S3 One Zone-IA) and S3 Glacier.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Amazon S3 standard storage for maximum performance, Amazon S3 Intelligent-Tiering for intelligent, durable storage, and Amazon S3 Glacier Deep Archive for archival storage**:
  Amazon EC2 instance store volumes provide the best I/O performance for low latency requirement, as in the current use case. The Amazon S3 Intelligent-Tiering storage class is designed to optimize costs by automatically moving data to the most cost-effective access tier, without performance impact or operational overhead.

- Amazon S3 Glacier Deep Archive is Amazon S3’s lowest-cost storage class and supports long-term retention and digital preservation for data that may be accessed once or twice a year. It is designed for customers — particularly those in highly-regulated industries, such as the Financial Services, Healthcare, and Public Sectors — that retain data sets for 7-10 years or longer to meet regulatory compliance requirements.

- **Amazon EBS for maximum performance, Amazon S3 for durable data storage, and Amazon S3 Glacier for archival storage**:
  Amazon Elastic Block Store (Amazon EBS) provides block-level storage volumes for use with EC2 instances. Amazon EBS volumes are particularly well-suited for use as the primary storage for file systems, databases, or for any applications that require fine granular updates and access to raw, unformatted, block-level storage. For high I/O performance, instance store volumes are a better option.

- **Amazon EC2 instance store for maximum performance, AWS Storage Gateway for on-premises durable data access and Amazon S3 Glacier Deep Archive for archival storage**:
  AWS Storage Gateway is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage. AWS Storage Gateway will be the right answer if the customer wanted to retain the on-premises data storage and just move the applications to AWS Cloud. In the absence of such requirements, instance store is a better option for high performance and Amazon S3 for durable storage.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: s3](https://aws.amazon.com/s3/storage-classes/)

</details>

---

<div id="question-46"></div>

### Question 46: Ultra High-Performance Database Storage with Provisioned IOPS SSD (io1/io2)
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company needs a massive PostgreSQL database and the engineering team would like to retain control over managing the patches, version upgrades for the database, and consistent performance with high IOPS. The team wants to install the database on an Amazon EC2 instance with the optimal storage type on the attached Amazon EBS volume.

As a solutions architect, which of the following configurations would you suggest to the engineering team?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Amazon EC2 with Amazon EBS volume of cold HDD (sc1) type
- **(B)** Amazon EC2 with Amazon EBS volume of Throughput Optimized HDD (st1) type
- **(C)** Amazon EC2 with Amazon EBS volume of Provisioned IOPS SSD (io1) type `[Đáp án đúng ✅]`
- **(D)** Amazon EC2 with Amazon EBS volume of General Purpose SSD (gp2) type `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Amazon EC2 with Amazon EBS volume of Provisioned IOPS SSD (io1) type

Amazon EBS provides the following volume types, which differ in performance characteristics and price so that you can tailor your storage performance and cost to the needs of your applications.

The volumes types fall into two categories:

SSD-backed volumes optimized for transactional workloads involving frequent read/write operations with small I/O size, where the dominant performance attribute is IOPS

HDD-backed volumes optimized for large streaming workloads where throughput (measured in MiB/s) is a better performance measure than IOPS

Provision IOPS type supports critical business applications that require sustained IOPS performance, or more than 16,000 IOPS or 250 MiB/s of throughput per volume. Examples are large database workloads, such as: MongoDB Cassandra Microsoft SQL Server MySQL PostgreSQL Oracle

Therefore, Amazon EC2 with Amazon EBS volume of Provisioned IOPS SSD (io1) type is the right fit for the given use-case.

> 🔗 **Tài liệu tham khảo trực quan**: [Please see this detailed overview of the volume types for Amazon EBS volumes.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Amazon EC2 with Amazon EBS volume of General Purpose SSD (gp2) type

- Amazon EC2 with Amazon EBS volume of Throughput Optimized HDD (st1) type

- Amazon EC2 with Amazon EBS volume of cold HDD (sc1) type

- Per the explanation in the detailed overview provided above, these three options are incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSEC2 - ebs volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)

</details>

---

<div id="question-47"></div>

### Question 47: Handling Asynchronous Processing Failures and Poison Pills with SQS Dead-Letter Queues
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An e-commerce company uses Amazon Simple Queue Service (Amazon SQS) queues to decouple their application architecture. The engineering team has observed message processing failures for some customer orders.

As a solutions architect, which of the following solutions would you recommend for handling such message failures?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use long polling to handle message processing failures
- **(B)** Use a temporary queue to handle message processing failures
- **(C)** Use a dead-letter queue to handle message processing failures `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use short polling to handle message processing failures

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use a dead-letter queue to handle message processing failures

Dead-letter queues can be used by other queues (source queues) as a target for messages that can't be processed (consumed) successfully. Dead-letter queues are useful for debugging your application or messaging system because they let you isolate problematic messages to determine why their processing doesn't succeed. Sometimes, messages can’t be processed because of a variety of possible issues, such as when a user comments on a story but it remains unprocessed because the original story itself is deleted by the author while the comments were being posted. In such a case, the dead-letter queue can be used to handle message processing failures.

> 🔗 **Tài liệu tham khảo trực quan**: [How do dead-letter queues work?:](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use a temporary queue to handle message processing failures**:
  The most common use case for temporary queues is the request-response messaging pattern (for example, processing a login request), where a requester creates a temporary queue for receiving each response message. To avoid creating an Amazon SQS queue for each response message, the Temporary Queue Client lets you create and delete multiple temporary queues without making any Amazon SQS API calls. Temporary queues cannot be used to handle message processing failures.

- Use short polling to handle message processing failures

- Use long polling to handle message processing failures

- Amazon SQS provides short polling and long polling to receive messages from a queue. By default, queues use short polling. With short polling, Amazon SQS sends the response right away, even if the query found no messages. With long polling, Amazon SQS sends a response after it collects at least one available message, up to the maximum number of messages specified in the request. Amazon SQS sends an empty response only if the polling wait time expires. Neither short polling nor long polling can be used to handle message processing failures.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AWSSimpleQueueService - sqs dead letter queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)

</details>

---

<div id="question-48"></div>

### Question 48: Active-Passive Disaster Recovery and Failover Routing to Static S3 Site via Route 53
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company's cloud architect has set up a solution that uses Amazon Route 53 to configure the DNS records for the primary website with the domain pointing to the Application Load Balancer (ALB). The company wants a solution where users will be directed to a static error page, configured as a backup, in case of unavailability of the primary website.

Which configuration will meet the company's requirements, while keeping the changes to a bare minimum?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up Amazon Route 53 active-active type of failover routing policy. If Amazon Route 53 health check determines the Application Load Balancer endpoint as unhealthy, the traffic will be diverted to a static error page, hosted on Amazon S3 bucket
- **(B)** Use Amazon Route 53 Latency-based routing. Create a latency record to point to the Amazon S3 bucket that holds the error page to be displayed
- **(C)** Set up Amazon Route 53 active-passive type of failover routing policy. If Amazon Route 53 health check determines the Application Load Balancer endpoint as unhealthy, the traffic will be diverted to a static error page, hosted on Amazon S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon Route 53 Weighted routing to give minimum weight to Amazon S3 bucket that holds the error page to be displayed. In case of primary failure, the requests get routed to the error page

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up Amazon Route 53 active-passive type of failover routing policy. If Amazon Route 53 health check determines the Application Load Balancer endpoint as unhealthy, the traffic will be diverted to a static error page, hosted on Amazon S3 bucket

Use an active-passive failover configuration when you want a primary resource or group of resources to be available the majority of the time and you want a secondary resource or group of resources to be on standby in case all the primary resources become unavailable. When responding to queries, Amazon Route 53 includes only healthy primary resources. If all the primary resources are unhealthy, Route 53 begins to include only the healthy secondary resources in response to DNS queries.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up Amazon Route 53 active-active type of failover routing policy. If Amazon Route 53 health check determines the Application Load Balancer endpoint as unhealthy, the traffic will be diverted to a static error page, hosted on Amazon S3 bucket**:
  This option has been added as a distractor as there is no such thing as an active-active failover routing policy in Amazon Route 53. You can configure active-active failover using any routing policy (or combination of routing policies) other than failover routing policy and you configure active-passive failover only using the failover routing policy. In active-active failover configuration, all the records that have the same name, the same type (such as A or AAAA), and the same routing policy (such as weighted or latency) are active unless Amazon Route 53 considers them unhealthy. Amazon Route 53 can respond to a DNS query using any healthy record.

- **Use Amazon Route 53 Latency-based routing. Create a latency record to point to the Amazon S3 bucket that holds the error page to be displayed**:
  If your application is hosted in multiple AWS Regions, you can improve performance for your users by serving their requests from the AWS Region that provides the lowest latency - this is Latency-based routing and is not helpful for the current use case.

- **Use Amazon Route 53 Weighted routing to give minimum weight to Amazon S3 bucket that holds the error page to be displayed. In case of primary failure, the requests get routed to the error page**:
  Weighted routing lets you associate multiple resources with a single domain name (example.com) or subdomain name (acme.example.com) and choose how much traffic is routed to each resource. This can be useful for a variety of purposes, including load balancing and testing new versions of the software. This is not useful for the current use case.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: Route53 - dns failover types](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-types.html#dns-failover-types-active-passive)
- 🌐 [AWS Docs: Route53 - routing policy](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-latency)

</details>

---

<div id="question-49"></div>

### Question 49: Event-Driven Serverless Image Processing Pipeline Using S3 Event Notifications and Lambda
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A digital media startup allows users to submit images through its web portal. These images are uploaded directly into an Amazon S3 bucket. On average, around 200 images are uploaded daily. The company wants to automatically generate a smaller preview version (thumbnail) of each new image and store the resulting thumbnails in a separate Amazon S3 bucket. The team prefers a design that is low-cost, requires minimal infrastructure management, and automatically reacts to new uploads.

Which solution will meet these requirements MOST cost-effectively?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure the S3 bucket to send an event notification to an AWS Lambda function each time a new image is uploaded. Use the Lambda function to process the image, create a thumbnail, and store the thumbnail in the second S3 bucket `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable Amazon S3 Access Analyzer and configure it to call an AWS Lambda function whenever a new image is added. Use the Lambda function to generate and store the thumbnail
- **(C)** Deploy a containerized application on AWS Fargate that polls the S3 bucket every minute to detect new uploads. Configure the container to generate thumbnails and save them in the second bucket
- **(D)** Set up a step-based processing workflow using AWS Glue jobs triggered on a regular interval. Use the jobs to scan the primary S3 bucket for new files and generate thumbnails for any that lack them. Write the thumbnails to a second S3 bucket

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Configure the S3 bucket to send an event notification to an AWS Lambda function each time a new image is uploaded. Use the Lambda function to process the image, create a thumbnail, and store the thumbnail in the second S3 bucket

This approach follows a serverless, event-driven architecture that is highly cost-effective, scalable, and operationally efficient. The solution involves configuring Amazon S3 to send an event notification to an AWS Lambda function each time a new photo is uploaded to the primary S3 bucket. When triggered, the Lambda function processes the uploaded image, generates a thumbnail and stores it in a separate S3 bucket. This event-driven architecture ensures near real-time processing with minimal operational overhead. Because AWS Lambda is a fully managed, serverless compute service, it runs only when invoked and scales automatically, making it highly cost-effective for handling approximately 200 uploads per day. Additionally, S3 event notifications are natively supported and integrate seamlessly with Lambda, eliminating the need for persistent infrastructure or scheduled jobs. This solution provides scalability, low latency, and cost efficiency while ensuring clean separation of original images and their thumbnails.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up a step-based processing workflow using AWS Glue jobs triggered on a regular interval. Use the jobs to scan the primary S3 bucket for new files and generate thumbnails for any that lack them. Write the thumbnails to a second S3 bucket**:
  AWS Glue is designed for ETL (Extract, Transform, Load) operations on structured and semi-structured data, not real-time image processing. Running Glue jobs on a schedule for this use case introduces unnecessary complexity and cost.

- **Deploy a containerized application on AWS Fargate that polls the S3 bucket every minute to detect new uploads. Configure the container to generate thumbnails and save them in the second bucket**:
  While Fargate is serverless, continuously polling the S3 bucket is inefficient and incurs costs even when no new images are present. It also adds operational complexity compared to event-driven processing.

- **Enable Amazon S3 Access Analyzer and configure it to call an AWS Lambda function whenever a new image is added. Use the Lambda function to generate and store the thumbnail**:
  S3 Access Analyzer is used for auditing and security analysis, not event-driven processing or triggering Lambda functions. It cannot be used to detect object uploads or initiate thumbnail generation.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - EventNotifications](https://docs.aws.amazon.com/AmazonS3/latest/userguide/EventNotifications.html)
- 🌐 [AWS Docs: lambda - with s3](https://docs.aws.amazon.com/lambda/latest/dg/with-s3.html)
- 🌐 [AWS Docs: AmazonS3 - access analyzer](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-analyzer.html)

</details>

---

<div id="question-50"></div>

### Question 50: Private and Secure Third-Party SaaS Connectivity via AWS PrivateLink Interface Endpoints
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A tech company runs a web application that includes multiple internal services deployed across Amazon EC2 instances within a VPC. These services require communication with a third-party SaaS provider's API for analytics and billing, which is also hosted on the AWS infrastructure. The company is concerned about minimizing public internet exposure while maintaining secure and reliable connectivity. The solution must ensure private access without allowing unsolicited incoming traffic from the SaaS provider.

Which solution will best meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use AWS PrivateLink to create a private endpoint within the application’s VPC that connects securely to the SaaS provider’s VPC `[Đáp án đúng ✅]`
- **(B)** Set up VPC peering between the application VPC and the SaaS provider’s VPC to allow direct communication
- **(C)** Establish a VPN connection using AWS Site-to-Site VPN to create a secure tunnel between the internal services and the third-party SaaS provider `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Use AWS CloudFront to route requests from the application’s internal services to the SaaS provider through edge locations

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use AWS PrivateLink to create a private endpoint within the application’s VPC that connects securely to the SaaS provider’s VPC

AWS PrivateLink is a fully managed service that enables private connectivity between Virtual Private Clouds (VPCs), AWS services, and supported third-party SaaS applications over the AWS network, without exposing traffic to the public internet. In this case, the internal service components of the application can securely access the third-party SaaS APIs by creating an interface VPC endpoint for the SaaS provider's service.

> 🔗 **Tài liệu tham khảo trực quan**: [This endpoint appears as an elastic network interface (ENI) in the application’s VPC, allowing internal services to communicate with the SaaS API using private IP addresses. Importantly, the traffic never leaves the Amazon network, which significantly reduces the risk of data exposure or interception. Additionally, the SaaS provider cannot initiate connections to the application’s services because PrivateLink is inherently unidirectional from the service consumer (the company's VPC) to the service provider (the SaaS provider’s VPC). This architecture helps meet strict security and compliance requirements, such as zero-trust networking and least privilege access.](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/aws-privatelink.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Establish a VPN connection using AWS Site-to-Site VPN to create a secure tunnel between the internal services and the third-party SaaS provider**:
  While Site-to-Site VPN can establish a secure connection, it typically requires IPsec-compatible devices and may route traffic over the internet, depending on the SaaS provider's setup. It also introduces more operational complexity and latency compared to AWS-native private connectivity options.

- **Set up VPC peering between the application VPC and the SaaS provider’s VPC to allow direct communication**:
  VPC peering enables direct network connectivity between VPCs; however, it lacks the granular access controls that AWS PrivateLink provides. Unlike PrivateLink, VPC peering allows broader network-level access, which can potentially permit unsolicited inbound traffic from the SaaS provider. Additionally, due to limitations in scalability and security management, SaaS providers typically do not support peering with individual customer VPCs.

- **Use AWS CloudFront to route requests from the application’s internal services to the SaaS provider through edge locations**:
  CloudFront is designed for content distribution and caching at edge locations. It does not establish private or secure backend connectivity between internal services and SaaS APIs, and traffic still traverses the public internet.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: vpc - what is privatelink](https://docs.aws.amazon.com/vpc/latest/privatelink/what-is-privatelink.html)
- 🌐 [AWS Docs: whitepapers - aws privatelink](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/aws-privatelink.html)

</details>

---

<div id="question-51"></div>

### Question 51: Layer 7 DDoS and Web Threat Defense at the Edge Using AWS WAF with CloudFront
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
An application hosted on Amazon EC2 contains sensitive personal information about all its customers and needs to be protected from all types of cyber-attacks. The company is considering using the AWS Web Application Firewall (AWS WAF) to handle this requirement.

Can you identify the correct solution leveraging the capabilities of AWS WAF?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Create Amazon CloudFront distribution for the application on Amazon EC2 instances. Deploy AWS WAF on Amazon CloudFront to provide the necessary safety measures `[Đáp án đúng ✅]`
- **(B)** Configure an Application Load Balancer (ALB) to balance the workload for all the Amazon EC2 instances. Configure Amazon CloudFront to distribute from an Application Load Balancer since AWS WAF cannot be directly configured on ALB. This configuration not only provides necessary safety but is scalable too `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** AWS WAF can be directly configured on Amazon EC2 instances for ensuring the security of the underlying application data
- **(D)** AWS WAF can be directly configured only on an Application Load Balancer or an Amazon API Gateway. One of these two services can then be configured with Amazon EC2 to build the needed secure architecture

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create Amazon CloudFront distribution for the application on Amazon EC2 instances. Deploy AWS WAF on Amazon CloudFront to provide the necessary safety measures

When you use AWS WAF with Amazon CloudFront, you can protect your applications running on any HTTP webserver, whether it's a webserver that's running in Amazon Elastic Compute Cloud (Amazon EC2) or a web server that you manage privately. You can also configure Amazon CloudFront to require HTTPS between CloudFront and your own webserver, as well as between viewers and Amazon CloudFront.

AWS WAF is tightly integrated with Amazon CloudFront and the Application Load Balancer (ALB), services that AWS customers commonly use to deliver content for their websites and applications. When you use AWS WAF on Amazon CloudFront, your rules run in all AWS Edge Locations, located around the world close to your end-users. This means security doesn’t come at the expense of performance. Blocked requests are stopped before they reach your web servers. When you use AWS WAF on Application Load Balancer, your rules run in the region and can be used to protect internet-facing as well as internal load balancers.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure an Application Load Balancer (ALB) to balance the workload for all the Amazon EC2 instances. Configure Amazon CloudFront to distribute from an Application Load Balancer since AWS WAF cannot be directly configured on ALB. This configuration not only provides necessary safety but is scalable too**:
  This statement is wrong. You can configure AWS WAF on Application Load Balancers (ALB).

- **AWS WAF can be directly configured on Amazon EC2 instances for ensuring the security of the underlying application data**:
  AWS WAF can be deployed on Amazon CloudFront, the Application Load Balancer (ALB), and Amazon API Gateway. It cannot be configured directly on an Amazon EC2 instance.

- **AWS WAF can be directly configured only on an Application Load Balancer or an Amazon API Gateway. One of these two services can then be configured with Amazon EC2 to build the needed secure architecture**:
  This statement is only partially correct. AWS WAF can also be deployed on Amazon CloudFront service.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: waf](https://aws.amazon.com/waf/faqs/)
- 🌐 [AWS Docs: waf - cloudfront features](https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html)

</details>

---

<div id="question-52"></div>

### Question 52: Minimizing Cloud Data Transfer Out Costs over Direct Connect Within the Same Region
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A retail company maintains an AWS Direct Connect connection to AWS and has recently migrated its data warehouse to AWS. The data analysts at the company query the data warehouse using a visualization tool. The average size of a query returned by the data warehouse is 60 megabytes and the query responses returned by the data warehouse are not cached in the visualization tool. Each webpage returned by the visualization tool is approximately 600 kilobytes.

Which of the following options offers the LOWEST data transfer egress cost for the company?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the visualization tool in the same AWS region as the data warehouse. Access the visualization tool over a Direct Connect connection at a location in the same region `[Đáp án đúng ✅]`
- **(B)** Deploy the visualization tool on-premises. Query the data warehouse over the internet at a location in the same AWS region
- **(C)** Deploy the visualization tool in the same AWS region as the data warehouse. Access the visualization tool over the internet at a location in the same region `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Deploy the visualization tool on-premises. Query the data warehouse directly over an AWS Direct Connect connection at a location in the same AWS region

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Deploy the visualization tool in the same AWS region as the data warehouse. Access the visualization tool over a Direct Connect connection at a location in the same region

AWS Direct Connect is a networking service that provides an alternative to using the internet to connect to AWS. Using AWS Direct Connect, data that would have previously been transported over the internet is delivered through a private network connection between your on-premises data center and AWS.

> 🔗 **Tài liệu tham khảo trực quan**: [For the given use case, the main pricing parameter while using the AWS Direct Connect connection is the Data Transfer Out (DTO) from AWS to the on-premises data center. DTO refers to the cumulative network traffic that is sent through AWS Direct Connect to destinations outside of AWS. This is charged per gigabyte (GB), and unlike capacity measurements, DTO refers to the amount of data transferred, not the speed.](https://aws.amazon.com/directconnect/pricing/)
Each query response is 60 megabytes in size and each webpage for the visualization tool is 600 kilobytes in size. If you deploy the visualization tool in the same AWS region as the data warehouse, then you only need to pay for the 600 kilobytes of DTO charges for the webpage. Therefore this option is correct.

However, if you deploy the visualization tool on-premises, then you need to pay for the 60 MB of DTO charges for the query response from the data warehouse to the visualization tool.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- Deploy the visualization tool in the same AWS region as the data warehouse. Access the visualization tool over the internet at a location in the same region

- Deploy the visualization tool on-premises. Query the data warehouse over the internet at a location in the same AWS region

- Data transfer pricing over AWS Direct Connect is lower than data transfer pricing over the internet, so both of these options are incorrect.

- **Deploy the visualization tool on-premises. Query the data warehouse directly over an AWS Direct Connect connection at a location in the same AWS region**:
  As mentioned in the explanation above, if you deploy the visualization tool on-premises, then you need to pay for the 60 megabytes of DTO charges for the query response from the data warehouse to the visualization tool. So this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: directconnect](https://aws.amazon.com/directconnect/pricing/)
- 🌐 [AWS Service Overview: getting-started](https://aws.amazon.com/getting-started/hands-on/connect-data-center-to-aws/services-costs/)
- 🌐 [AWS Service Overview: directconnect](https://aws.amazon.com/directconnect/faqs/)

</details>

---

<div id="question-53"></div>

### Question 53: Low-Latency Global Multi-Region Data Access Using Amazon DynamoDB Global Tables
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A global e-commerce platform currently operates its order processing system in a single on-premises data center located in Europe. As the company grows its customer base across Asia and North America, it plans to deploy the application across multiple AWS Regions to improve availability and reduce latency. The company requires that updates to the central order database be completed in under one second with global consistency. The application layer will be deployed separately in each Region, but the order management data must remain centrally managed and globally synchronized.

Which solution should a solutions architect recommend to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Neptune to store tracking updates as graph data. Deploy clusters in each Region and replicate changes using custom-built Lambda functions and Amazon SQS.
- **(B)** Use Amazon Aurora database with MySQL engine, and configure read-only nodes in other Regions to handle local traffic while routing all write operations to the central Region
- **(C)** Migrate the order data to Amazon DynamoDB and create a global table. Deploy the application in each Region and connect to the local DynamoDB replica for low-latency access `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon RDS for MySQL with a cross-Region read replica. Route all writes to the primary Region and use read replicas for local access in other Regions

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Migrate the order data to Amazon DynamoDB and create a global table. Deploy the application in each Region and connect to the local DynamoDB replica for low-latency access

Amazon DynamoDB global tables are a fully managed, multi-Region, multi-writer database solution designed to deliver low-latency performance and high availability for globally distributed applications. In this architecture, a DynamoDB table is created in one Region and replicated automatically to other specified AWS Regions. Each replica behaves as a fully functional table, capable of handling both reads and writes locally. This setup allows regional deployments of the application to interact with the local replica of the database, minimizing cross-Region latency and avoiding the need to route write requests to a single centralized Region. Updates made to any Region’s table are asynchronously propagated to all other Regions with typical replication latency under 1 second, satisfying the application's performance requirement.

This solution also eliminates the need to manage complex replication logic, ensures high resilience against Regional failures, and provides seamless multi-active availability—allowing each Region to continue operating independently even if another Region experiences disruption.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon RDS for MySQL with a cross-Region read replica. Route all writes to the primary Region and use read replicas for local access in other Regions**:
  Using RDS MySQL with read replicas in different Regions allows users to perform read queries from geographically closer endpoints. However, all write operations must be handled by the single primary instance located in the original Region, which violates the latency requirement for updates. Furthermore, replication across Regions is asynchronous, which introduces delay and potential data consistency issues. This approach does not fulfill the global consistency and low-latency write requirement.

- **Use Amazon Neptune to store tracking updates as graph data. Deploy clusters in each Region and replicate changes using custom-built Lambda functions and Amazon SQS.**:
  Amazon Neptune is a managed graph database, suitable for highly connected datasets such as social graphs or fraud detection. It does not support multi-Region deployment out of the box, and using custom replication via Lambda and SQS introduces complexity, increased latency, and potential consistency issues. This solution would not meet the company’s needs for a low-latency, replicated write path across Regions.

- **Use Amazon Aurora database with MySQL engine, and configure read-only nodes in other Regions to handle local traffic while routing all write operations to the central Region**:
  This architecture enables low-latency reads from secondary Regions by using Aurora Global Database read-only replicas. However, it restricts write operations to the primary Region only, meaning any update to the order database must still be processed in the central Region. This introduces latency for global users and fails to meet the requirement for sub-second update performance from all Regions. Additionally, the system doesn't support multi-Region active-active writes or built-in conflict resolution.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: amazondynamodb - GlobalTables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html)
- 🌐 [AWS Docs: AmazonRDS - USER_ReadRepl.XRgn](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.XRgn.html)

</details>

---

<div id="question-54"></div>

### Question 54: Fully Managed Scalable Shared File System with Cross-Region Backups via EFS & AWS Backup
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A SaaS analytics company is deploying a microservices-based application on Amazon ECS using the Fargate launch type. The application requires access to a shared, POSIX-compliant file system that is available across multiple Availability Zones for redundancy and availability. To meet compliance requirements, the system must support regional backups and cross-Region data recovery with a recovery point objective (RPO) of no more than 8 hours. A backup strategy will be implemented using AWS Backup to automate replication across Regions. As the lead cloud architect, you are evaluating file storage solutions that align with these requirements.

Which option best meets the application’s availability, durability, and RPO objectives?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon FSx for NetApp ONTAP with a Multi-AZ deployment and rely on its native high availability and AWS Backup integration to replicate the file system to another Region automatically
- **(B)** Configure Amazon S3 with the S3 Standard storage class and mount it in containers using Mountpoint for Amazon S3. Use AWS Backup to replicate objects to another Region
- **(C)** Deploy Amazon FSx for Lustre and configure a backup plan using AWS Backup for cross-Region replication of the file system metadata
- **(D)** Use Amazon Elastic File System (Amazon EFS) with the Standard storage class and configure AWS Backup to create cross-Region backups on a scheduled basis `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon Elastic File System (Amazon EFS) with the Standard storage class and configure AWS Backup to create cross-Region backups on a scheduled basis

Amazon EFS is a fully managed, scalable, NFS-compatible file system ideal for containerized workloads. It provides multi-AZ mount targets by default and supports integration with AWS Backup for automated cross-Region backup and restore. When used with AWS Backup, EFS can achieve an RPO of 8 hours or less through scheduled backups. The Standard storage class offers high durability and low latency, making it a strong fit for active workloads that span Availability Zones.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon FSx for Lustre and configure a backup plan using AWS Backup for cross-Region replication of the file system metadata**:
  Although Amazon FSx for Lustre supports integration with AWS Backup, it is optimized for high-performance compute (HPC) workloads, not general-purpose container applications. It lacks native cross-AZ mount targets and is not a good fit for persistent shared storage across AZs. In addition, data durability and recovery use cases are not ideal with Lustre unless linked to Amazon S3, which adds architectural complexity and delay.

- **Configure Amazon S3 with the S3 Standard storage class and mount it in containers using Mountpoint for Amazon S3. Use AWS Backup to replicate objects to another Region**:
  While Amazon S3 is durable and supports cross-Region replication, it is an object storage service, not a file system. It lacks POSIX compliance even when used with Mountpoint for Amazon S3. So, this option is incorrect.

- **Use Amazon FSx for NetApp ONTAP with a Multi-AZ deployment and rely on its native high availability and AWS Backup integration to replicate the file system to another Region automatically**:
  While Amazon FSx for NetApp ONTAP does support Multi-AZ deployments for high availability within a Region and integrates with AWS Backup for local backups, cross-Region replication is not managed automatically by AWS Backup for FSx for ONTAP. Instead, it requires manual configuration using NetApp SnapMirror, which introduces additional operational overhead and does not provide a managed RPO guarantee like EFS does when used with AWS Backup. Therefore, although the storage service is resilient and enterprise-grade, this setup does not fully meet the requirement for an RPO of 8 hours using AWS Backup for seamless cross-Region recovery.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: aws-backup - cross region backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/cross-region-backup.html)
- 🌐 [AWS Docs: aws-backup - backup feature availability](https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource)
- 🌐 [AWS Architecture Blog: mountpoint for amazon s3 generally available and ready for production workloads](https://aws.amazon.com/blogs/aws/mountpoint-for-amazon-s3-generally-available-and-ready-for-production-workloads/)
- 🌐 [www.amazonaws.cn/en/fsx/lustre/faqs/#Availability_and_durability](https://www.amazonaws.cn/en/fsx/lustre/faqs/#Availability_and_durability)
- 🌐 [AWS Docs: fsx - what is fsx ontap](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/what-is-fsx-ontap.html)

</details>

---

<div id="question-55"></div>

### Question 55: Automated Heterogeneous and Ongoing Database Replication via AWS DMS Serverless
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
An enterprise runs a critical Oracle database workload in its on-premises environment. The company now plans to replicate both existing records and continuous transactional changes to a managed Oracle environment in AWS. The target database will run on Amazon RDS for Oracle. Data transfer volume is expected to fluctuate throughout the day, and the team wants the solution to provision compute resources automatically based on actual workload requirements.

Which solution will meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy the AWS DMS replication instance on Amazon EC2. Configure the instance with custom scripts that monitor CPU usage and resize the instance using EC2 Auto Scaling policies.
- **(B)** Use AWS Glue to extract data from the on-premises Oracle database and write the output to Amazon RDS for Oracle. Configure Glue to run on demand when changes are detected `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Configure an AWS DMS Serverless replication task to synchronize historical and ongoing changes between the on-premises Oracle database and Amazon RDS for Oracle `[Đáp án đúng ✅]`
- **(D)** Use AWS Lambda to capture change data from the on-premises Oracle database. Trigger Lambda functions to write the updates to Amazon RDS for Oracle in real time.

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Configure an AWS DMS Serverless replication task to synchronize historical and ongoing changes between the on-premises Oracle database and Amazon RDS for Oracle

> 🔗 **Tài liệu tham khảo trực quan**: [AWS DMS Serverless is designed specifically for scenarios like this — where data replication workloads vary and automation is required. AWS DMS Serverless automatically provisions and scales compute resources based on workload demand. It supports ongoing replication, including change data capture (CDC), and is fully managed, reducing operational complexity. This solution avoids the need to guess capacity requirements or manually adjust instance sizes.](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Serverless.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use AWS Glue to extract data from the on-premises Oracle database and write the output to Amazon RDS for Oracle. Configure Glue to run on demand when changes are detected**:
  AWS Glue is an ETL service, not designed for real-time or change data capture (CDC) replication from transactional databases. It works well for batch processing and data transformation pipelines, but not for continuously syncing ongoing changes from an Oracle source. Using it in this context would lead to inconsistent data and increased latency.

- **Deploy the AWS DMS replication instance on Amazon EC2. Configure the instance with custom scripts that monitor CPU usage and resize the instance using EC2 Auto Scaling policies.**:
  Deploying DMS on EC2 and building custom Auto Scaling logic introduces unnecessary operational burden. EC2 Auto Scaling is not natively integrated with DMS replication tasks and cannot scale based on replication task load. This approach defeats the goal of minimizing management and may introduce performance instability due to lag in scaling triggers.

- **Use AWS Lambda to capture change data from the on-premises Oracle database. Trigger Lambda functions to write the updates to Amazon RDS for Oracle in real time.**:
  AWS Lambda is not designed to process high-volume, stateful, transactional replication workloads from an Oracle database. Oracle does not natively trigger Lambda functions, and capturing CDC via Lambda would require complex, non-scalable workarounds. This option also lacks support for maintaining transactional consistency.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: dms - CHAP_Serverless](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Serverless.html)

</details>

---

<div id="question-56"></div>

### Question 56: Real-Time Log Analytics and Visualization Pipeline: Kinesis, OpenSearch & QuickSight
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
A fintech company currently operates a real-time search and analytics platform on-premises. This platform ingests streaming data from multiple data-producing systems and provides immediate search capabilities and interactive visualizations for end users. As part of its cloud migration strategy, the company wants to rearchitect the solution using AWS-native services.

Which of the following represents the most efficient solution?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Deploy Amazon EC2 instances to handle the ingestion and processing of streaming data, storing the results in Amazon S3. Utilize Amazon Athena to search the stored data, and use Amazon Managed Grafana to generate dashboards and visual insights
- **(B)** Use Amazon Elastic Container Service (Amazon ECS) with AWS Fargate to ingest the data into Amazon DynamoDB to facilitate full text search. Use Amazon CloudWatch to create dashboards and query the data
- **(C)** Use AWS Glue streaming ETL to process data streams and load the data into Amazon Redshift. Use Amazon Redshift’s full-text search capabilities for querying. Use Amazon QuickSight for data visualizations
- **(D)** Ingest and process the streaming data using Amazon Kinesis Data Streams, then index the data with Amazon OpenSearch Service for real-time search capabilities. Use Amazon QuickSight to build interactive dashboards and visualizations based on the indexed data `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Ingest and process the streaming data using Amazon Kinesis Data Streams, then index the data with Amazon OpenSearch Service for real-time search capabilities. Use Amazon QuickSight to build interactive dashboards and visualizations based on the indexed data

> 🔗 **Tài liệu tham khảo trực quan**: [This solution leverages Amazon Kinesis Data Streams for high-throughput, low-latency stream ingestion, and Amazon OpenSearch Service for full-text indexing and real-time search. OpenSearch is purpose-built for search and analytics workloads. For visualization, Amazon QuickSight can be connected to OpenSearch or other data sources to build rich dashboards. This architecture provides a scalable, fully managed, real-time search and analytics platform using AWS-native services.](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/what-is.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy Amazon EC2 instances to handle the ingestion and processing of streaming data, storing the results in Amazon S3. Utilize Amazon Athena to search the stored data, and use Amazon Managed Grafana to generate dashboards and visual insights**:
  While this solution uses serverless analytics via Amazon Athena and integrates with visualization tools like Amazon Managed Grafana, the use of Amazon EC2 to ingest and process real-time streaming data adds unnecessary operational overhead. Additionally, Athena is optimized for querying data on Amazon S3 rather than low-latency, real-time search requirements. So, this architecture lacks the responsiveness and indexing performance needed for real-time search applications.

- **Use AWS Glue streaming ETL to process data streams and load the data into Amazon Redshift. Use Amazon Redshift’s full-text search capabilities for querying. Use Amazon QuickSight for data visualizations**:
  Although AWS Glue streaming ETL can handle data ingestion and Redshift supports powerful analytics, Redshift is primarily a data warehouse and not optimized for low-latency, full-text search. Redshift’s search capabilities are limited compared to dedicated search engines like OpenSearch. Furthermore, the combination of Glue and Redshift adds complexity and may introduce latency for real-time applications.

- **Use Amazon Elastic Container Service (Amazon ECS) with AWS Fargate to ingest the data into Amazon DynamoDB to facilitate full text search. Use Amazon CloudWatch to create dashboards and query the data**:
  DynamoDB is a NoSQL database optimized for key-value access, not full-text search. Additionally, Amazon CloudWatch is designed for infrastructure and application monitoring, not advanced search or visualization of dynamic user data. This setup lacks the native indexing and real-time query capabilities required for a robust search experience.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: streams - introduction](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)
- 🌐 [AWS Docs: opensearch-service - what is](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/what-is.html)
- 🌐 [AWS Docs: quicksight - welcome](https://docs.aws.amazon.com/quicksight/latest/user/welcome.html)

</details>

---

<div id="question-57"></div>

### Question 57: Improving Anycast Edge Routing and Global Performance via AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (D)

#### 📋 Đề bài (Scenario)
An application with global users across AWS Regions had suffered an issue when the Elastic Load Balancing (ELB) in a Region malfunctioned thereby taking down the traffic with it. The manual intervention cost the company significant time and resulted in major revenue loss.

What should a solutions architect recommend to reduce internet latency and add automatic failover across AWS Regions?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up AWS Direct Connect as the backbone for each of the AWS Regions where the application is deployed
- **(B)** Create Amazon S3 buckets in different AWS Regions and configure Amazon CloudFront to pick the nearest edge location to the user
- **(C)** Set up an Amazon Route 53 geoproximity routing policy to route traffic
- **(D)** Set up AWS Global Accelerator and add endpoints to cater to users in different geographic locations `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Set up AWS Global Accelerator and add endpoints to cater to users in different geographic locations

As your application architecture grows, so does the complexity, with longer user-facing IP lists and more nuanced traffic routing logic. AWS Global Accelerator solves this by providing you with two static IPs that are anycast from our globally distributed edge locations, giving you a single entry point to your application, regardless of how many AWS Regions it’s deployed in. This allows you to add or remove origins, Availability Zones or Regions without reducing your application availability. Your traffic routing is managed manually, or in console with endpoint traffic dials and weights. If your application endpoint has a failure or availability issue, AWS Global Accelerator will automatically redirect your new connections to a healthy endpoint within seconds.

By using AWS Global Accelerator, you can:

Associate the static IP addresses provided by AWS Global Accelerator to regional AWS resources or endpoints, such as Network Load Balancers, Application Load Balancers, EC2 Instances, and Elastic IP addresses. The IP addresses are anycast from AWS edge locations so they provide onboarding to the AWS global network close to your users.

Easily move endpoints between Availability Zones or AWS Regions without needing to update your DNS configuration or change client-facing applications.

Dial traffic up or down for a specific AWS Region by configuring a traffic dial percentage for your endpoint groups. This is especially useful for testing performance and releasing updates.

Control the proportion of traffic directed to each endpoint within an endpoint group by assigning weights across the endpoints.

> 🔗 **Tài liệu tham khảo trực quan**: [AWS Global Accelerator for Multi-Region applications:](https://aws.amazon.com/global-accelerator/)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up AWS Direct Connect as the backbone for each of the AWS Regions where the application is deployed**:
  AWS Direct Connect can reduce latency to great extent. Direct Connect is used to connect on-premises systems to AWS Cloud for extremely low latency use cases. It cannot be used to serve users directly.

- **Create Amazon S3 buckets in different AWS Regions and configure Amazon CloudFront to pick the nearest edge location to the user**:
  If most of the content is static, we can configure Amazon CloudFront to improve performance. In the current scenario, the architecture has ELBs, Amazon EC2 instances too that need to be covered in the automatic failover plan.

- **Set up an Amazon Route 53 geoproximity routing policy to route traffic**:
  Geoproximity routing lets Amazon Route 53 route traffic to your resources based on the geographic location of your users and your resources. Unlike AWS Global Accelerator, managing and routing to different instances, ELBs and other AWS resources will become an operational overhead as the resource count reaches into the hundreds. With inbuilt features like Static anycast IP addresses, fault tolerance using network zones, Global performance-based routing, TCP Termination at the Edge - AWS Global Accelerator is the right choice for multi-region, low latency use cases.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: global-accelerator](https://aws.amazon.com/global-accelerator/features/)
- 🌐 [AWS Docs: Route53 - routing policy](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-geoproximity)

</details>

---

<div id="question-58"></div>

### Question 58: High Availability Regional Web Tier Architecture: Multi-AZ ASG Behind ALB
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (B), (C) | **Đáp án đúng**: (A), (D)

#### 📋 Đề bài (Scenario)
An enterprise SaaS provider is currently operating a legacy web application hosted on a single Amazon EC2 instance within a public subnet. The same instance also hosts a MySQL database. DNS records for the application are configured through Amazon Route 53. As part of a modernization initiative, the company wants to rearchitect this application for high availability and scalability. In addition, the company wants to improve read performance on the database layer to handle increasing user traffic.

Which combination of solutions will meet these requirements? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use an Auto Scaling group to deploy EC2 instances across multiple Availability Zones within a single Region. Register the instances in a target group behind an Application Load Balancer to distribute web traffic evenly `[Đáp án đúng ✅]`
- **(B)** Use an Auto Scaling group to deploy EC2 instances across multiple Availability Zones in two AWS Regions. Register the instances in a target group behind an Application Load Balancer to distribute web traffic evenly `[Lựa chọn của bạn - Không chính xác ❌]`
- **(C)** Use Amazon CloudFront with Lambda@Edge to serve dynamic content from EC2 instances located in different Regions `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Migrate the existing MySQL database to an Amazon Aurora MySQL cluster. Deploy the primary DB instance and one or more read replicas in different Availability Zones `[Đáp án đúng ✅]`
- **(E)** Deploy an additional EC2 instance in a different AWS Region, and configure Amazon Route 53 with a failover routing policy to direct traffic to the secondary instance during primary Region outages

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (D)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use an Auto Scaling group to deploy EC2 instances across multiple Availability Zones within a single Region. Register the instances in a target group behind an Application Load Balancer to distribute web traffic evenly

> 🔗 **Tài liệu tham khảo trực quan**: [This option enhances scalability and high availability of the web application. Deploying EC2 instances across multiple Availability Zones ensures that the application remains available even if one Availability Zone experiences an outage. The Application Load Balancer (ALB) evenly distributes incoming web traffic across all healthy instances in the target group, improving performance and fault tolerance. The Auto Scaling group automatically adjusts the number of EC2 instances in response to changing traffic, reducing operational burden and costs while ensuring optimal performance.](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
Migrate the existing MySQL database to an Amazon Aurora MySQL cluster. Deploy the primary DB instance and one or more read replicas in different Availability Zones

This option addresses the need to reduce read latency and improve database availability. Amazon Aurora is a fully managed, MySQL-compatible relational database engine designed for high performance and availability. By deploying a writer (primary) instance and at least one reader instance in different Availability Zones, the application can offload read-heavy workloads to the reader instance, improving throughput and reducing response times. Aurora’s automatic failover capabilities also help ensure continued operation in the event of a failure of the primary instance. Aurora further supports features like replication, automatic backups, and storage autoscaling, reducing operational overhead.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Deploy an additional EC2 instance in a different AWS Region, and configure Amazon Route 53 with a failover routing policy to direct traffic to the secondary instance during primary Region outages**:
  This setup lacks auto scaling capabilities. If traffic spikes in either Region, the architecture would require manual intervention or additional setup to scale. No Application Load Balancer (ALB) or Auto Scaling group is used in this option — which are best practices for horizontally scaling stateless workloads.

- **Use an Auto Scaling group to deploy EC2 instances across multiple Availability Zones in two AWS Regions. Register the instances in a target group behind an Application Load Balancer to distribute web traffic evenly**:
  An Application Load Balancer operates only within a single AWS Region and can route traffic to targets in multiple Availability Zones within that Region, but not across Regions. So, this option is incorrect.

- **Use Amazon CloudFront with Lambda@Edge to serve dynamic content from EC2 instances located in different Regions**:
  CloudFront is ideal for caching static content, but it’s not designed for dynamic database-driven applications hosted on EC2. Using Lambda@Edge for a database-backed application introduces architectural mismatches and increases complexity.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: autoscaling - what is amazon ec2 auto scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- 🌐 [AWS Docs: AmazonRDS - CHAP_AuroraOverview](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
- 🌐 [AWS Docs: AmazonRDS - Aurora.Replication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Replication.html)

</details>

---

<div id="question-59"></div>

### Question 59: Serverless Feedback Ingestion and Sentiment Analysis: API GW, SQS, Lambda, Comprehend & DynamoDB
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A streaming service provider collects user experience feedback through embedded feedback forms in their mobile and web apps. Feedback submissions frequently spike to thousands per hour during content launches or service outages. Currently, the feedback is sent via email to the operations team for manual review. The company now wants to automate feedback collection and sentiment analysis so that insights can be generated quickly and stored for a full year for trend analysis.

Which solution provides the most scalable and automated approach to meet these requirements?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Build a web service on Amazon EC2 that receives feedback data and stores each record in a DynamoDB table. Use the EC2 application to invoke Amazon Comprehend for sentiment detection and write results to a second table. Apply a TTL of 365 days to each table
- **(B)** Route all feedback submissions through Amazon Kinesis Data Streams. Use an AWS Lambda consumer to batch process incoming records, invoke Amazon Translate to detect language and convert input to English, and save the processed content in an Amazon OpenSearch Service index. Configure OpenSearch Index State Management (ISM) policies to delete documents after 12 months
- **(C)** Design a RESTful API with Amazon API Gateway that forwards incoming feedback data to an Amazon SQS queue. Set up an AWS Lambda function to process the queue messages, analyze sentiment using Amazon Comprehend, and store results in a DynamoDB table with a 365-day TTL configured on each item `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon EventBridge to capture feedback events and forward them to an AWS Step Functions workflow. The workflow invokes Lambda functions for validation, calls Amazon Transcribe to convert the text to audio for archival, and stores the results in an Amazon RDS database. Configure a lifecycle policy to remove records after 12 months

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Design a RESTful API with Amazon API Gateway that forwards incoming feedback data to an Amazon SQS queue. Set up an AWS Lambda function to process the queue messages, analyze sentiment using Amazon Comprehend, and store results in a DynamoDB table with a 365-day TTL configured on each item

This architecture decouples feedback ingestion from processing by using Amazon SQS as a buffer for potentially high volumes of incoming data. API Gateway handles secure and scalable API access, while Lambda automatically scales to process feedback messages asynchronously. Amazon Comprehend is specifically designed for sentiment analysis on text input. Storing results in DynamoDB offers scalable, low-latency access to structured insights, and Time to Live (TTL) ensures automatic data expiry after one year. This is a serverless, fully managed solution that scales efficiently with bursts and long-term retention.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Route all feedback submissions through Amazon Kinesis Data Streams. Use an AWS Lambda consumer to batch process incoming records, invoke Amazon Translate to detect language and convert input to English, and save the processed content in an Amazon OpenSearch Service index. Configure OpenSearch Index State Management (ISM) policies to delete documents after 12 months**:
  This option introduces Kinesis Data Streams to handle high-throughput ingestion, which is appropriate for large-scale, real-time data capture. However, the use of Amazon Translate is misaligned with the core requirement, which is sentiment analysis, not language translation. Additionally, storing feedback data in Amazon OpenSearch Service can enable full-text search and visualization, but it adds significant operational overhead, especially for a solution that doesn't require search capabilities. Furthermore, OpenSearch is less cost-effective and scalable for basic structured storage when compared to DynamoDB for this use case.

- **Use Amazon EventBridge to capture feedback events and forward them to an AWS Step Functions workflow. The workflow invokes Lambda functions for validation, calls Amazon Transcribe to convert the text to audio for archival, and stores the results in an Amazon RDS database. Configure a lifecycle policy to remove records after 12 months**:
  This option introduces unnecessary complexity and the wrong tools for the job. Amazon Transcribe is used to convert speech to text, not the other way around, and has no benefit in archiving text-based user feedback. Storing the output in Amazon RDS increases management burden and doesn’t scale as well as DynamoDB for high-velocity, write-heavy workloads. Although EventBridge and Step Functions are powerful for orchestrating workflows, this particular implementation misuses services and introduces overhead without delivering meaningful improvements.

- **Build a web service on Amazon EC2 that receives feedback data and stores each record in a DynamoDB table. Use the EC2 application to invoke Amazon Comprehend for sentiment detection and write results to a second table. Apply a TTL of 365 days to each table**:
  Although technically functional, this solution uses Amazon EC2 for feedback ingestion and sentiment analysis, which introduces operational overhead, limits scalability, and requires provisioning, patching, and scaling of EC2 instances. This is not a serverless or event-driven architecture, and the use of a second DynamoDB table adds unnecessary complexity. While Amazon Comprehend is correctly applied, the solution lacks elasticity for sudden spikes and isn't the most cost-effective or scalable approach.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: comprehend - what is](https://docs.aws.amazon.com/comprehend/latest/dg/what-is.html)
- 🌐 [AWS Docs: amazondynamodb - TTL](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html)
- 🌐 [AWS Docs: opensearch-service - ism](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ism.html)
- 🌐 [AWS Docs: transcribe - what is](https://docs.aws.amazon.com/transcribe/latest/dg/what-is.html)
- 🌐 [AWS Docs: translate - what is](https://docs.aws.amazon.com/translate/latest/dg/what-is.html)

</details>

---

<div id="question-60"></div>

### Question 60: Understanding Amazon RDS Multi-AZ Automatic Failover DNS CNAME Switch Mechanics
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A company wants to ensure high availability for its Amazon RDS database. The development team wants to opt for Multi-AZ deployment and they would like to understand what happens when the primary instance of the Multi-AZ configuration goes down.

As a Solutions Architect, which of the following will you identify as the outcome of the scenario?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** The URL to access the database will change to the standby database `[Lựa chọn của bạn - Không chính xác ❌]`
- **(B)** An email will be sent to the System Administrator asking for manual intervention
- **(C)** The CNAME record will be updated to point to the standby database `[Đáp án đúng ✅]`
- **(D)** The application will be down until the primary database has recovered itself

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
The CNAME record will be updated to point to the standby database

Amazon RDS provides high availability and failover support for DB instances using Multi-AZ deployments. Amazon RDS uses several different technologies to provide failover support. Multi-AZ deployments for MariaDB, MySQL, Oracle, and PostgreSQL DB instances use Amazon's failover technology. SQL Server DB instances use SQL Server Database Mirroring (DBM) or Always On Availability Groups (AGs).

In a Multi-AZ deployment, Amazon RDS automatically provisions and maintains a synchronous standby replica in a different Availability Zone. The primary DB instance is synchronously replicated across Availability Zones to a standby replica to provide data redundancy, eliminate I/O freezes, and minimize latency spikes during system backups. Running a DB instance with high availability can enhance availability during planned system maintenance, and help protect your databases against DB instance failure and Availability Zone disruption.

Failover is automatically handled by Amazon RDS so that you can resume database operations as quickly as possible without administrative intervention. When failing over, Amazon RDS simply flips the canonical name record (CNAME) for your DB instance to point at the standby, which is in turn promoted to become the new primary. Multi-AZ means the URL is the same, the failover is automated, and the CNAME will automatically be updated to point to the standby database.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **The URL to access the database will change to the standby database**:
  As discussed above, URL remains the same.

- **An email will be sent to the System Administrator asking for manual intervention**:
  This option is incorrect and it has been added as a distractor.

- **The application will be down until the primary database has recovered itself**:
  This option is incorrect and it has been added as a distractor.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonRDS - Concepts.MultiAZ](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html)
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/faqs/)

</details>

---

<div id="question-61"></div>

### Question 61: Automated Audio Transcription and Sentiment Analysis with Amazon Transcribe and Athena
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A) | **Đáp án đúng**: (A)

#### 📋 Đề bài (Scenario)
A company hires experienced specialists to analyze the customer service calls attended by its call center representatives. Now, the company wants to move to AWS Cloud and is looking at an automated solution to analyze customer service calls for sentiment analysis via ad-hoc SQL queries.

As a Solutions Architect, which of the following solutions would you recommend?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use Amazon Transcribe to convert audio files to text and Amazon Athena to perform SQL based analysis to understand the underlying customer sentiments `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Use Amazon Kinesis Data Streams to read the audio files and Amazon Alexa to convert them into text. Amazon Kinesis Data Analytics can be used to analyze these files and Amazon Quicksight can be used to visualize and display the output
- **(C)** Use Amazon Transcribe to convert audio files to text and Amazon Quicksight to perform SQL based analysis on these text files to understand the underlying patterns. Visualize and display them onto user Dashboards for reporting purposes
- **(D)** Use Amazon Kinesis Data Streams to read the audio files and machine learning (ML) algorithms to convert the audio files into text and run customer sentiment analysis

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use Amazon Transcribe to convert audio files to text and Amazon Athena to perform SQL based analysis to understand the underlying customer sentiments

Amazon Transcribe is an automatic speech recognition (ASR) service that makes it easy to convert audio to text. One key feature of the service is called speaker identification, which you can use to label each individual speaker when transcribing multi-speaker audio files. You can specify Amazon Transcribe to identify 2–10 speakers in the audio clip.

Amazon Athena is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to manage, and you pay only for the queries that you run. To leverage Athena, you can simply point to your data in Amazon S3, define the schema, and start querying using standard SQL. Most results are delivered within seconds.

> 🔗 **Tài liệu tham khảo trực quan**: [Analyzing multi-speaker audio files using Amazon Transcribe and Amazon Athena:](https://aws.amazon.com/blogs/machine-learning/automating-the-analysis-of-multi-speaker-audio-files-using-amazon-transcribe-and-amazon-athena)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Use Amazon Kinesis Data Streams to read the audio files and machine learning (ML) algorithms to convert the audio files into text and run customer sentiment analysis**:
  Amazon Kinesis can be used to stream real-time data for further analysis and storage. Kinesis Data Streams cannot read audio files. You will still need to use AWS Transcribe for ASR services.

- **Use Amazon Kinesis Data Streams to read the audio files and Amazon Alexa to convert them into text. Amazon Kinesis Data Analytics can be used to analyze these files and Amazon Quicksight can be used to visualize and display the output**:
  Amazon Kinesis Data Streams cannot read audio files. Amazon Alexa cannot be used as an Automatic Speech Recognition (ASR) service, though Alexa internally uses ASR for its working.

- **Use Amazon Transcribe to convert audio files to text and Amazon Quicksight to perform SQL based analysis on these text files to understand the underlying patterns. Visualize and display them onto user Dashboards for reporting purposes**:
  Amazon Quicksight is used for the visual representation of data through dashboards. However, it is not an SQL query based analysis tool like Amazon Athena. So, this option is incorrect.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Architecture Blog: automating the analysis of multi speaker audio files using amazon transcribe and amazon athena](https://aws.amazon.com/blogs/machine-learning/automating-the-analysis-of-multi-speaker-audio-files-using-amazon-transcribe-and-amazon-athena)
- 🌐 [aws.amazon.com/athena](https://aws.amazon.com/athena)

</details>

---

<div id="question-62"></div>

### Question 62: Cost-Effective Archiving for Irregular Access Files: S3 Intelligent-Tiering via S3 API
> **Miền kiến thức (Domain)**: Domain 4: Design Cost-Optimized Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (C) | **Đáp án đúng**: (B)

#### 📋 Đề bài (Scenario)
A digital design company has migrated its project archiving platform to AWS. The application runs on Amazon EC2 Linux instances in an Auto Scaling group that spans multiple Availability Zones. Designers upload and retrieve high-resolution image files from a shared file system, which is currently configured to use Amazon EFS Standard-IA. Metadata for these files is stored and indexed in an Amazon RDS for PostgreSQL database. The company's cloud engineering team has been asked to optimize storage costs for the image archive without compromising reliability. They are open to refactoring the application to use managed AWS services when necessary.

Which solution offers the most cost-effective architecture?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Replace the EFS file system with Amazon FSx for NetApp ONTAP. Use volume tiering to move cold data to lower-cost capacity pool storage. Update the application to use the ONTAP mount path
- **(B)** Create an Amazon S3 bucket with Intelligent-Tiering enabled. Update the application to store and retrieve project files using the Amazon S3 API `[Đáp án đúng ✅]`
- **(C)** Replace the EFS file system with Amazon FSx for Lustre. Mount the file system to EC2 instances and store project files there to reduce access latency and cost `[Lựa chọn của bạn - Không chính xác ❌]`
- **(D)** Use AWS Backup to export all EFS files daily to an Amazon S3 bucket. Retain the EFS file system in Standard-IA class for occasional real-time access and route all archival queries to the S3 export

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Create an Amazon S3 bucket with Intelligent-Tiering enabled. Update the application to store and retrieve project files using the Amazon S3 API

Amazon S3 Intelligent-Tiering is an ideal cost-optimization choice for datasets with unpredictable access patterns. It automatically moves objects between frequent and infrequent access tiers, optimizing cost without compromising latency or availability. Compared to EFS Standard-IA, S3 Intelligent-Tiering offers lower cost per GB for archival-like workloads and doesn’t require manual monitoring or tuning. Refactoring the application to use the S3 API introduces some development overhead but enables the most cost-effective, durable, and scalable storage.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Replace the EFS file system with Amazon FSx for Lustre. Mount the file system to EC2 instances and store project files there to reduce access latency and cost**:
  Amazon FSx for Lustre is designed for high-performance compute (HPC) use cases such as machine learning, simulations, or big data analytics—not general-purpose file storage or archival. While it offers low-latency access to frequently accessed files, it does not offer automated lifecycle management, nor is it optimized for cost reduction in infrequently accessed workloads. It also lacks direct integration with database indexing use cases unless paired with Amazon S3.

- **Use AWS Backup to export all EFS files daily to an Amazon S3 bucket. Retain the EFS file system in Standard-IA class for occasional real-time access and route all archival queries to the S3 export**:
  While AWS Backup can export EFS file system backups to S3, this approach introduces duplication and complexity rather than eliminating cost. The company would now pay for EFS storage, S3 storage, and backup operations, which could increase rather than reduce overall storage costs. Additionally, this setup would require the application to differentiate between S3 and EFS reads, complicating data retrieval paths.

- **Replace the EFS file system with Amazon FSx for NetApp ONTAP. Use volume tiering to move cold data to lower-cost capacity pool storage. Update the application to use the ONTAP mount path**:
  Amazon FSx for NetApp ONTAP supports volume tiering to cost-efficient storage pools, which may sound appealing for cold data. However, FSx for ONTAP is more suited for enterprise NAS use cases, often tied to lift-and-shift migrations of existing NetApp systems. Its pricing model and operational complexity are less cost-effective for infrequent file access when compared to S3 Intelligent-Tiering. It also introduces the need to manage storage efficiency features (e.g., snapshots, quotas) that may be unnecessary in this context.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - intelligent tiering overview](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering-overview.html)
- 🌐 [AWS Docs: fsx - what is](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)
- 🌐 [AWS Docs: aws-backup - whatisbackup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
- 🌐 [AWS Docs: fsx - what is fsx ontap](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/what-is-fsx-ontap.html)

</details>

---

<div id="question-63"></div>

### Question 63: Accelerating Low-Latency Non-HTTP TCP Traffic Globally Using AWS Global Accelerator
> **Miền kiến thức (Domain)**: Domain 3: Design High-Performing Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (B), (E) | **Đáp án đúng**: (B), (E)

#### 📋 Đề bài (Scenario)
A global enterprise is modernizing its hybrid IT infrastructure to improve both availability and network performance. The company operates a TCP-based application hosted on Amazon EC2 instances that are deployed across multiple AWS Regions, while a secondary UDP-based component of the application is hosted in its on-premises data centers. These application components must be accessed by customers around the world with minimal latency and consistent uptime.

Which combination of options should a solutions architect implement for the given use case? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Set up AWS Direct Connect connections to route all TCP and UDP traffic through a single Region, using static routes and BGP failover
- **(B)** Create a Network Load Balancer (NLB) in each Region to handle the EC2-based TCP traffic. For the UDP-based on-premises workload, configure NLBs in each Region to route to the on-premises endpoints via IP-based target groups `[Lựa chọn của bạn - Chính xác ✅]`
- **(C)** Create a Network Load Balancer (NLB) in each Region to handle the EC2-based TCP traffic. For the UDP-based on-premises workload, configure Application Load Balancers in each Region to route to the on-premises endpoints via IP-based target groups
- **(D)** Deploy AWS PrivateLink to connect each on-premises UDP workload to the AWS Regions through interface endpoints exposed by the Network Load Balancers
- **(E)** Configure an AWS Global Accelerator standard accelerator, and register the TCP-based EC2 workloads behind the load balancers `[Lựa chọn của bạn - Chính xác ✅]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(B), (E)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Configure an AWS Global Accelerator standard accelerator, and register the TCP-based EC2 workloads behind the load balancers

AWS Global Accelerator supports improving the availability and performance of global applications with TCP-based traffic. It routes users to the closest healthy endpoint in multiple Regions via the AWS global network and supports automatic failover. Registering load balancers as endpoints ensures that the TCP workload hosted on EC2 instances benefits from low-latency access and high availability.

Create a Network Load Balancer (NLB) in each Region to handle the EC2-based TCP traffic. For the UDP-based on-premises workload, configure NLBs in each Region to route to the on-premises endpoints via IP-based target groups

> 🔗 **Tài liệu tham khảo trực quan**: [Network Load Balancers support both TCP and UDP traffic. By creating NLBs in each Region, the architecture allows load balancing for EC2 workloads and can forward UDP traffic to IP-based targets in on-premises networks. This setup ensures that both stateful TCP and stateless UDP workloads are accessible and scalable from AWS.](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Set up AWS Direct Connect connections to route all TCP and UDP traffic through a single Region, using static routes and BGP failover**:
  AWS Direct Connect enhances dedicated network performance between AWS and on-premises infrastructure but does not inherently provide intelligent global routing, failover, or multi-region resilience. It is not optimal for distributing traffic across Regions or managing global availability.

- **Deploy AWS PrivateLink to connect each on-premises UDP workload to the AWS Regions through interface endpoints exposed by the Network Load Balancers**:
  AWS PrivateLink enables secure connectivity to AWS services via VPC endpoints but supports only TCP-based traffic. It cannot be used to route or expose UDP-based services, making it unsuitable for the on-premises UDP workload.

- **> 🔗 **Tài liệu tham khảo trực quan****:
  [Create a Network Load Balancer (NLB) in each Region to handle the EC2-based TCP traffic. For the UDP-based on-premises workload, configure Application Load Balancers in each Region to route to the on-premises endpoints via IP-based target groups - While the first part of the option is valid — using NLBs to handle EC2-based TCP traffic is appropriate because NLBs support TCP connections and can scale efficiently across Regions. The second part of the option is flawed. The issue lies in attempting to use Application Load Balancers (ALBs) for UDP-based traffic. ALBs only support HTTP/HTTPS (Layer 7) and WebSocket protocols. They do not support Layer 4 protocols such as TCP or UDP.](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: global-accelerator - what is global accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/what-is-global-accelerator.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html)
- 🌐 [AWS Docs: elasticloadbalancing - introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)

</details>

---

<div id="question-64"></div>

### Question 64: Scaling Multi-Region Read Performance and Disaster Recovery with RDS Cross-Region Read Replicas
> **Miền kiến thức (Domain)**: Domain 2: Design Resilient Architectures  
> **Loại câu hỏi**: Multiple Choice (Chọn 2 đáp án)  
> **Kết quả thực hành**: Correct (Chính xác) ✅ | **Lựa chọn của bạn**: (A), (C) | **Đáp án đúng**: (A), (C)

#### 📋 Đề bài (Scenario)
The engineering team at a retail company manages 3 Amazon EC2 instances that make read-heavy database requests to the Amazon RDS for the PostgreSQL database instance. As an AWS Certified Solutions Architect - Associate, you have been tasked to make the database instance resilient from a disaster recovery perspective.

Which of the following features will help you in disaster recovery of the database? (Select two)

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Use cross-Region Read Replicas `[Lựa chọn của bạn - Chính xác ✅]`
- **(B)** Enable the automated backup feature of Amazon RDS in a multi-AZ deployment that creates backups in a single AWS Region
- **(C)** Enable the automated backup feature of Amazon RDS in a multi-AZ deployment that creates backups across multiple Regions `[Lựa chọn của bạn - Chính xác ✅]`
- **(D)** Use Amazon RDS Provisioned IOPS (SSD) Storage in place of General Purpose (SSD) Storage
- **(E)** Use the database cloning feature of the Amazon RDS Database cluster

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(A), (C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Use cross-Region Read Replicas

In addition to using Read Replicas to reduce the load on your source database instance, you can also use Read Replicas to implement a DR solution for your production DB environment. If the source DB instance fails, you can promote your Read Replica to a standalone source server. Read Replicas can also be created in a different Region than the source database. Using a cross-Region Read Replica can help ensure that you get back up and running if you experience a regional availability issue.

Enable the automated backup feature of Amazon RDS in a multi-AZ deployment that creates backups across multiple Regions

Amazon RDS provides high availability and failover support for database instances using Multi-AZ deployments. Amazon RDS uses several different technologies to provide failover support. Multi-AZ deployments for MariaDB, MySQL, Oracle, and PostgreSQL DB instances use Amazon's failover technology.

The automated backup feature of Amazon RDS enables point-in-time recovery for your database instance. Amazon RDS will back up your database and transaction logs and store both for a user-specified retention period. If it’s a Multi-AZ configuration, backups occur on standby to reduce the I/O impact on the primary. Amazon RDS supports Cross-Region Automated Backups. Manual snapshots and Read Replicas are also supported across multiple Regions.

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Enable the automated backup feature of Amazon RDS in a multi-AZ deployment that creates backups in a single AWS Region**:
  This is an incorrect statement. Automated backups can be created across AWS Regions.

- **Use Amazon RDS Provisioned IOPS (SSD) Storage in place of General Purpose (SSD) Storage**:
  Amazon RDS Provisioned IOPS Storage is an SSD-backed storage option designed to deliver fast, predictable, and consistent I/O performance. This storage type enhances the performance of the RDS database, but this isn't a disaster recovery option.

- **Use the database cloning feature of the Amazon RDS Database cluster**:
  This option has been added as a distractor. Database cloning is only available for Amazon Aurora and not for Amazon RDS.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Service Overview: rds](https://aws.amazon.com/rds/features/)
- 🌐 [AWS Architecture Blog: implementing a disaster recovery strategy with amazon rds](https://aws.amazon.com/blogs/database/implementing-a-disaster-recovery-strategy-with-amazon-rds/)
- 🌐 [AWS Service Overview: about-aws](https://aws.amazon.com/about-aws/whats-new/2021/07/amazon-rds-cross-region-automated-backups-regional-expansion/)

</details>

---

<div id="question-65"></div>

### Question 65: Reducing KMS API Call Volume and Costs for S3 Server-Side Encryption Using S3 Bucket Keys
> **Miền kiến thức (Domain)**: Domain 1: Design Secure Architectures  
> **Loại câu hỏi**: Single Choice (Chọn 1 đáp án)  
> **Kết quả thực hành**: Incorrect (Chưa chính xác) ❌ | **Lựa chọn của bạn**: (D) | **Đáp án đúng**: (C)

#### 📋 Đề bài (Scenario)
A digital publishing platform stores large volumes of media assets (such as images and documents) in an Amazon S3 bucket. These assets are accessed frequently during business hours by internal editors and content delivery tools. The company has strict encryption policies and currently uses AWS KMS to handle server-side encryption. The cloud operations team notices that AWS KMS request costs are increasing significantly due to the high frequency of object uploads and accesses. The team is now looking for a way to maintain the same encryption method but reduce the cost of KMS usage, especially for frequent access patterns.

Which solution meets the company's encryption and cost optimization goals?

#### 🔘 Các phương án lựa chọn (Options)
- **(A)** Configure a VPC endpoint for S3 and restrict access to the bucket to traffic originating from the endpoint to avoid additional KMS charges
- **(B)** Use client-side encryption by generating a local symmetric key and uploading it to Amazon S3 along with each object’s metadata for decryption
- **(C)** Enable S3 Bucket Keys for server-side encryption with AWS KMS (SSE-KMS) so that new objects use a bucket-level key rather than requesting individual KMS data keys for every object `[Đáp án đúng ✅]`
- **(D)** Switch to server-side encryption using Amazon S3 managed keys (SSE-S3) to eliminate all AWS KMS-related encryption charges while maintaining the same level of encryption control `[Lựa chọn của bạn - Không chính xác ❌]`

<details>
<summary>👉 <b>Xem đáp án chi tiết & giải thích kiến trúc (Click to expand)</b></summary>

#### ✅ Đáp án đúng: **(C)**

#### 💡 Phân tích giải thích chi tiết (Core Explanation):
Enable S3 Bucket Keys for server-side encryption with AWS KMS (SSE-KMS) so that new objects use a bucket-level key rather than requesting individual KMS data keys for every object

> 🔗 **Tài liệu tham khảo trực quan**: [Amazon S3 Bucket Keys reduce the cost of Amazon S3 server-side encryption with AWS Key Management Service (AWS KMS) keys (SSE-KMS). Using a bucket-level key for SSE-KMS can reduce AWS KMS request costs by up to 99 percent by decreasing the request traffic from Amazon S3 to AWS KMS. Enabling S3 Bucket Keys with SSE-KMS allows S3 to generate a unique data key for each object locally using a bucket-level KMS key, which dramatically reduces the number of direct AWS KMS API calls. This approach maintains the same security and compliance properties as SSE-KMS, while reducing request-related costs—especially beneficial for workloads with frequent access or write operations.](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html)

#### ❌ Phân tích các phương án không chính xác (Distractors Analysis):
- **Configure a VPC endpoint for S3 and restrict access to the bucket to traffic originating from the endpoint to avoid additional KMS charges**:
  Setting up a VPC endpoint for S3 helps with network cost optimization and security controls, but it has no effect on AWS KMS pricing. KMS requests are charged separately from network data transfer, and restricting access through a VPC endpoint does not eliminate or reduce encryption-related API calls. This option improves access control but does not meet the goal of reducing encryption cost.

- **Use client-side encryption by generating a local symmetric key and uploading it to Amazon S3 along with each object’s metadata for decryption**:
  Client-side encryption offloads encryption from AWS to the client, but this method adds significant management complexity, such as key rotation, secure key storage, and decryption logic on the client side. Uploading the key with the metadata is also a security risk and not compliant with best practices. Additionally, this approach does not reduce costs related to KMS unless KMS is removed entirely from the encryption pipeline, which may violate encryption policy requirements.

- **Switch to server-side encryption using Amazon S3 managed keys (SSE-S3) to eliminate all AWS KMS-related encryption charges while maintaining the same level of encryption control**:
  While SSE-S3 does eliminate AWS KMS usage and its associated costs, it does not meet the requirement to maintain the company’s strict encryption policies that rely specifically on AWS KMS-managed keys. SSE-S3 uses S3-managed keys, which are not integrated with AWS KMS and lack the granular key management, audit logging, and fine-grained access control provided by KMS. Therefore, although this option reduces costs, it fails to comply with the company’s requirement to continue using KMS for encryption, making it an invalid solution in this scenario.

#### 📚 Tài liệu tham khảo chính thức (Official References):
- 🌐 [AWS Docs: AmazonS3 - bucket key](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html)
- 🌐 [AWS Docs: AmazonS3 - UsingClientSideEncryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingClientSideEncryption.html)
- 🌐 [AWS Docs: AmazonS3 - UsingEncryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingEncryption.html)

</details>

---

