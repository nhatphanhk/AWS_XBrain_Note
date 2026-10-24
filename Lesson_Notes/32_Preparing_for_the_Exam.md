# Ghi Chú Bài Học: Chương 32 - Chiến Lược Ôn Thi & Mẹo Thi Chứng Chỉ AWS (Preparing for the Exam)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate (SAA-C03)  
> **Chương**: 32 - Preparing for the Exam + Practice (Bài 386 đến Bài 393)  
> **Tài liệu tham chiếu liên quan**: [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](file:///n:/AWS_XBrain_Note/GLOSSARY.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này tổng kết toàn bộ chiến lược chuẩn bị, các mẹo làm bài thi thực chiến, kỹ thuật quản lý thời gian, cách thức đăng ký thi và nhận ưu đãi cho kỳ thi chứng chỉ quốc tế **AWS Certified Solutions Architect - Associate (SAA-C03)**.

### Mục tiêu học tập
1. Nắm vững cấu trúc và ma trận phân bổ điểm số của đề thi SAA-C03 theo 4 Miền kiến thức (Domains).
2. Nắm vững mẹo xin cộng thêm 30 phút làm bài (**ESL +30 Minutes**) dành cho thí sinh không sử dụng tiếng Anh bản ngữ.
3. Sử dụng mã giảm giá 50% chi phí thi (Voucher 50% Discount) từ các chứng chỉ AWS đã đạt trước đó.
4. Rèn luyện tư duy loại trừ và phân tích đề bài: xác định rõ từ khóa yêu cầu (Chi phí thấp nhất - *Most cost-effective*, Ít công vận hành nhất - *Least operational overhead*, Tính sẵn sàng cao nhất - *Highly available*).

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

### 1. Cấu trúc bài thi AWS Certified Solutions Architect Associate (SAA-C03)
- **Thời gian làm bài**: 130 phút (hoặc **160 phút** nếu kích hoạt chính sách ESL +30).
- **Số lượng câu hỏi**: 65 câu (bao gồm câu hỏi trắc nghiệm 1 đáp án đúng và trắc nghiệm chọn nhiều đáp án đúng). Trong đó có 50 câu tính điểm và 15 câu thử nghiệm (Unscored questions) của AWS.
- **Thang điểm**: Từ 100 đến 1,000 điểm; **Điểm đỗ tối thiểu là 720 điểm**.
- **Đơn vị khảo thí**: **Pearson VUE** là đối tác khảo thí duy nhất của AWS (PSI đã ngừng cung cấp dịch vụ từ năm 2023). Có thể thi tại Test Center hoặc thi Online OnVUE tại nhà.
- **Quy định thi lại (Retake Policy)**: Nếu không may bị trượt, thí sinh bắt buộc phải chờ đủ **14 ngày** mới được đăng ký thi lại.
- **Hiệu lực chứng chỉ**: Có giá trị trong **3 năm**. Khi thi đậu SAA-C03, chứng chỉ Cloud Practitioner (nếu có trước đó) sẽ tự động được gia hạn (recertified).
- **Ma trận phân bổ trọng số 4 Miền kiến thức (Domains)**:
  - **Domain 1**: Thiết kế kiến trúc an toàn (Design Secure Architectures) - **30%**
  - **Domain 2**: Thiết kế kiến trúc kiên cường chịu lỗi (Design Resilient Architectures) - **26%**
  - **Domain 3**: Thiết kế kiến trúc hiệu năng cao (Design High-Performing Architectures) - **24%**
  - **Domain 4**: Thiết kế kiến trúc tối ưu chi phí (Design Cost-Optimized Architectures) - **20%**

### 2. Các mẹo thi quan trọng nhất (Exam Tips)
- **Yêu cầu ESL +30 Minutes (Cực kỳ quan trọng)**:
  - Nếu tiếng Anh không phải là tiếng mẹ đẻ của bạn, bạn được quyền yêu cầu AWS cấp thêm **30 phút làm bài** (tổng cộng 160 phút).
  - **Bắt buộc**: Phải vào mục *Request Exam Accommodations* trên trang web AWS Certification Account và bật tính năng **"ESL +30 MINUTES" TRƯỚC KHI BẤM ĐĂNG KÝ VÀ THANH TOÁN BÀI THI**. Nếu đã đăng ký rồi thì không thể áp dụng cho bài thi đó được nữa.
- **Mã giảm giá 50%**:
  - Bất kỳ khi nào bạn vượt qua một kỳ thi chứng chỉ của AWS (kể cả Cloud Practitioner), AWS sẽ tặng bạn một mã voucher giảm giá 50% cho kỳ thi tiếp theo trong mục *Benefits*.

### 3. Các thay đổi chính sách dịch vụ cần chú ý trong đề thi
- **Chính sách thu phí Public IPv4 ($0.005/giờ)**:
  - AWS thu phí cho mọi địa chỉ Public IPv4. Đề thi ngày càng chú trọng các giải pháp tối ưu chi phí liên quan: sử dụng **Dual-stack VPC / IPv6-only** kết hợp **Egress-Only Internet Gateway**, gom NAT Gateways, hoặc dùng **VPC Endpoints / AWS Systems Manager Session Manager** thay vì gán Public IP cho máy ảo EC2.
- **Mặc định an toàn trên Amazon S3**:
  - Mặc định tất cả Bucket mới đều được bật mã hóa **SSE-S3** miễn phí.
  - Mặc định bật **Object Ownership = Bucket Owner Enforced** (vô hiệu hóa hoàn toàn S3 ACLs, chỉ dùng S3 Bucket Policy).

### 4. Các Nhóm Dịch Vụ Cốt Lõi (Core AWS Services for SAA-C03)

Đề thi SAA-C03 xoay quanh ~50 dịch vụ AWS, nhưng **85% câu hỏi tập trung vào 7 nhóm dịch vụ cốt lõi sau**:

```
                       ┌─────────────────────────────────────────┐
                       │       AWS SAA-C03 CORE SERVICES         │
                       └────────────────────┬────────────────────┘
       ┌───────────────┬────────────────────┼───────────────────┬───────────────┐
       ▼               ▼                    ▼                   ▼               ▼
   [Compute]       [Storage]           [Databases]         [Networking]    [Integration]
  • EC2 / ASG     • S3 (All Tiers)    • RDS / Aurora      • VPC & Endpoints• SQS (Std/FIFO)
  • Lambda        • EBS (gp3/io2)     • DynamoDB / DAX    • Route 53      • SNS (Fan-out)
  • ECS / Fargate • EFS (Multi-AZ)    • ElastiCache       • ALB / NLB     • EventBridge
  • App Runner    • FSx (Windows/L)   • Redshift          • CloudFront    • Step Functions
```

1. **Nhóm Điện toán (Compute)**:
   - **Amazon EC2**: Các hình thức thanh toán (*On-Demand*, *Spot* - rẻ tới 90% cho batch chịu lỗi, *Savings Plans / Reserved Instances* - cam kết 1/3 năm cho steady-state).
   - **EC2 Auto Scaling**: *Target Tracking* (theo CPU/RequestCount), *Step Scaling*, *Predictive Scaling*, và *Warm Pools* (giảm thời gian init máy ảo nặng).
   - **AWS Lambda**: Serverless compute, tối đa 15 phút (900s), RAM tới 10 GB, thanh toán theo 1ms; tích hợp với API Gateway, S3, SQS.
   - **Amazon ECS & AWS Fargate**: Container orchestration; *Fargate* là serverless (không cần quản lý máy ảo EC2 host).
   - **AWS App Runner**: Triển khai web app/API container hóa nhanh nhất với ít công vận hành nhất (*Least operational overhead*).

2. **Nhóm Lưu trữ (Storage)**:
   - **Amazon S3**: Tầng lưu trữ (*Standard*, *Intelligent-Tiering*, *Standard-IA*, *One Zone-IA*, *Glacier Flexible*, *Glacier Deep Archive*, *Express One Zone*); *Lifecycle Rules*, *Versioning*, *CRR/SRR*, *Object Lock (Compliance Mode)*.
   - **Amazon EBS**: Khối lưu trữ gắn với 1 AZ; *gp3* (hiệu năng chuẩn, tách biệt IOPS và dung lượng), *io2 Block Express* (IOPS cực cao cho mission-critical DB, hỗ trợ Multi-Attach).
   - **Amazon EFS**: Hệ thống file dùng chung chuẩn POSIX/NFSv4 cho Linux, truy cập đồng thời từ hàng trăm EC2 xuyên đa AZ.
   - **Amazon FSx**: *FSx for Windows File Server* (chuẩn SMB, tích hợp Active Directory) và *FSx for Lustre* (hiệu năng siêu cao cho HPC, Machine Learning tính toán song song).

3. **Nhóm Cơ sở dữ liệu & Bộ nhớ đệm (Databases & Caching)**:
   - **Amazon RDS**: Cơ sở dữ liệu quan hệ (PostgreSQL, MySQL, MariaDB, Oracle, SQL Server); *Read Replicas* (scale đọc, bất đồng bộ) vs *Multi-AZ* (chịu lỗi HA, đồng bộ, tự động failover).
   - **Amazon Aurora**: Lưu trữ 6 bản sao trên 3 AZ; tự động tăng dung lượng tới 128 TB; *Aurora Serverless v2* (scale tức thì theo ACU); *Aurora Global Database* (sao chép cross-region dưới 1s); *Aurora I/O-Optimized*.
   - **Amazon DynamoDB**: NoSQL Serverless độ trễ mili-giây; *DynamoDB Streams* (ghi log biến động sự kiện); *Global Tables* (multi-region active-active); *DAX (DynamoDB Accelerator)* (bộ nhớ đệm microsecond cho read).
   - **Amazon ElastiCache**: Bộ đệm in-memory (*Redis* có snapshot/Multi-AZ vs *Memcached* thuần đa luồng); chế độ *ElastiCache Serverless*.
   - **Amazon MemoryDB for Redis**: Database in-memory sơ cấp (Primary DB) với Multi-AZ transactional log đảm bảo độ bền vững dữ liệu tuyệt đối.
   - **Amazon Redshift**: Kho dữ liệu phân tích (OLAP), lưu trữ theo cột (Columnar), truy vấn song song hàng loạt (MPP).

4. **Nhóm Mạng & Phân phối nội dung (Networking & Delivery)**:
   - **Amazon VPC**: Subnets (Public/Private), Route Tables, Internet Gateway, NAT Gateway (cho IPv4 ra ngoài), Egress-Only IGW (cho IPv6 ra ngoài).
   - **Bảo mật mạng**: *Security Groups* (Stateful, chỉ có ALLOW) vs *Network ACL* (Stateless, có cả ALLOW và DENY theo thứ tự số).
   - **Kết nối liên mạng**: *VPC Peering* (không bắc cầu), *AWS Transit Gateway* (bắc cầu, Hub-and-Spoke kết nối hàng trăm VPCs và On-prem), *Site-to-Site VPN*, *Direct Connect (DX)* (đường truyền cáp riêng chuyên dụng bảo mật cao).
   - **VPC Endpoints**: *Gateway Endpoint* (miễn phí, qua Route Table cho S3 & DynamoDB) vs *Interface Endpoint / PrivateLink* (tính phí, tạo ENI trong subnet cho hầu hết dịch vụ khác).
   - **Amazon Route 53**: DNS quản lý với các chính sách định tuyến (*Simple*, *Weighted*, *Latency-based*, *Failover*, *Geolocation*, *Geoproximity*, *Multi-value answer*).
   - **Amazon CloudFront**: Mạng phân phối nội dung toàn cầu (CDN) lưu cache tại Edge PoP, kết hợp *Origin Access Control (OAC)* để bảo vệ S3.
   - **AWS Global Accelerator**: Dùng Anycast IP tĩnh và mạng backbone của AWS định tuyến lưu lượng TCP/UDP tới Region tối ưu nhất (giảm jitter và latency).

5. **Nhóm Tích hợp phi máy chủ & Tách rời (Decoupling & Integration)**:
   - **Amazon SQS**: Hàng đợi thông điệp (*Standard* - throughput gần như vô hạn, at-least-once delivery; *FIFO* - thứ tự chuẩn xác, exactly-once, tối đa 3,000 msg/s với batching).
   - **Amazon SNS**: Mô hình Publish/Subscribe 1-nhiều (Fan-out pattern) gửi đồng thời tới SQS, Email, SMS, Lambda, HTTP endpoints.
   - **Amazon Kinesis**: Thu thập và phân tích dữ liệu streaming quy mô lớn (*Kinesis Data Streams* - real-time tùy chỉnh; *Amazon Data Firehose* - serverless nạp trực tiếp vào S3, Redshift, OpenSearch).
   - **Amazon EventBridge**: Event bus serverless tiếp nhận và định tuyến sự kiện qua JSON rules; *EventBridge Pipes* (kết nối point-to-point kèm filter & enrich).
   - **AWS Step Functions**: Điều phối quy trình phức tạp (State Machine), xử lý song song khổng lồ với *Distributed Map*.

6. **Nhóm An ninh, Định danh & Quản trị (Security & Governance)**:
   - **IAM & AWS Organizations**: *IAM Roles* (ủy quyền tạm thời), *Service Control Policies (SCPs)* (rào chắn tối đa trên toàn bộ tài khoản thành viên trong tổ chức).
   - **AWS KMS**: Quản lý khóa mã hóa (*Customer Managed Keys - CMK*, *Multi-Region Keys*).
   - **Secrets Manager vs SSM Parameter Store**: Secrets Manager tự động đổi mật khẩu (Auto-rotate) cho RDS; SSM Parameter Store lưu cấu hình và secret tĩnh có bản miễn phí.
   - **AWS WAF**: Tường lửa Layer 7 chống SQLi, XSS, rate-limit request.
   - **Bộ ba Giám sát & Tuân thủ**:
     - *Amazon CloudWatch*: Đo lường số liệu hiệu năng (Metrics), gom Logs, tạo Alarms.
     - *AWS CloudTrail*: Ghi log kiểm toán API (Ai gọi API gì, lúc nào, từ IP nào).
     - *AWS Config*: Ghi nhận lịch sử thay đổi cấu hình tài nguyên và kiểm tra tuân thủ chính sách (Compliance Rules).

---

## 4.4. Bộ "Trick" & Chiến Lược Thi Thực Chiến Đỉnh Cao (Exam Hacks & Elimination Rules)

### Trick 1: Đọc ngược từ câu hỏi chốt (Constraint vs Requirement)
* **Thực tế đề thi**: Mỗi câu hỏi SAA-C03 thường là một đoạn văn dài 3–6 dòng mô tả bối cảnh công ty, hệ thống hiện tại, và vấn đề phát sinh.
* **Mẹo làm bài**: **Luôn đọc 1–2 câu cuối cùng trước!** Câu cuối sẽ chỉ rõ tiêu chí quyết định đáp án:
  - *"Which solution is the MOST cost-effective?"* ➔ Bỏ qua mọi phương án đắt đỏ dù nó giải quyết được bài toán.
  - *"Which solution requires the LEAST operational overhead?"* ➔ Tìm ngay dịch vụ Serverless / Fully Managed.
  - *"Which solution provides the HIGHEST availability / fault tolerance?"* ➔ Tìm kiến trúc Multi-AZ, Multi-Region.
* **Quy tắc vàng**: Đề thi AWS luôn có **2 đáp án sai rõ rệt**, **1 đáp án đúng về mặt kỹ thuật nhưng vi phạm tiêu chí ràng buộc**, và **1 đáp án duy nhất đúng toàn diện**.

### Trick 2: Ma trận loại trừ tự động (The Elimination Engine)

| Nếu đề bài chứa từ khóa... | Loại ngay các phương án (Wrong Answers) | Ưu tiên chọn ngay phương án (Correct Triggers) |
| :--- | :--- | :--- |
| **"Least operational overhead"** / **"Minimize management effort"** | Tự dựng EC2 cài phần mềm (Self-managed DB, custom proxy, cron script trên cronjob EC2) | **Dịch vụ Managed / Serverless**: App Runner, Lambda, Aurora Serverless, S3, ElastiCache, EventBridge. |
| **"Most cost-effective for static website"** | Khởi chạy EC2 với Nginx/Apache, gán ALB | **S3 Static Website Hosting + Amazon CloudFront** |
| **"Sub-millisecond / Microsecond latency"** | Multi-AZ DB, Read Replicas, tăng kích thước EBS thông thường | **Amazon ElastiCache** (cho quan hệ), **DynamoDB DAX** (cho DynamoDB), **S3 Express One Zone** (cho object). |
| **"Decouple / Asynchronous without losing messages"** | Gọi đồng bộ qua REST API, lưu tạm vào tệp local | **Amazon SQS** hoặc **Amazon Kinesis** |
| **"Strict ordering / No duplicate processing"** | SQS Standard Queue, Kinesis Firehose | **Amazon SQS FIFO Queue** (`.fifo`) |
| **"Block specific IP address at subnet level"** | Security Group (SG không có lệnh Deny) | **Network ACL (NACL)** với luật `DENY` số thứ tự nhỏ |
| **"Protect web app against SQL Injection / XSS"** | Network ACL, Security Group, NAT Gateway | **AWS WAF** gắn trên ALB, CloudFront hoặc API Gateway |
| **"Automated password rotation for database"** | SSM Parameter Store (không có auto-rotate mặc định) | **AWS Secrets Manager** (tích hợp sẵn Lambda xoay mật khẩu) |
| **"Share file system across multiple EC2s across AZs (Linux)"** | Amazon EBS (EBS chỉ thuộc 1 AZ duy nhất) | **Amazon EFS** (Elastic File System) |
| **"High performance file system for Windows / Active Directory"** | Amazon EFS, Amazon S3 | **Amazon FSx for Windows File Server** |
| **"HPC compute, massive throughput, POSIX for ML"** | Amazon EFS, S3 Standard | **Amazon FSx for Lustre** |
| **"Prevent ransomware / accidental deletion of backups"** | IAM Policy thông thường, S3 Versioning đơn lẻ | **AWS Backup Vault Lock (Compliance Mode)** hoặc **S3 Object Lock** |

### Trick 3: Phân định ranh giới giữa các cặp dịch vụ dễ nhầm lẫn

```
┌───────────────────────────────────────┬───────────────────────────────────────┐
│     Amazon CloudFront (CDN)           │        AWS Global Accelerator         │
├───────────────────────────────────────┼───────────────────────────────────────┤
│ • Tối ưu nội dung HTTP/HTTPS (Web)    │ • Tối ưu cả TCP và UDP (Game, VoIP)   │
│ • Có bộ nhớ đệm Cache tại Edge PoP    │ • KHÔNG có Cache, chỉ proxy định tuyến│
│ • Tối ưu phân phối nội dung tĩnh/động │ • Cung cấp 2 địa chỉ Anycast IP tĩnh  │
└───────────────────────────────────────┴───────────────────────────────────────┘

┌───────────────────────────────────────┬───────────────────────────────────────┐
│        Amazon SQS (Queue)             │         Amazon SNS (Topic)            │
├───────────────────────────────────────┼───────────────────────────────────────┤
│ • Mô hình Kéo (Pull / Poll)           │ • Mô hình Đẩy (Push)                  │
│ • Giao tiếp 1 đối 1 (Point-to-Point)  │ • Giao tiếp 1 đối nhiều (Pub/Sub)     │
│ • Lưu trữ tạm thời tin nhắn để xử lý  │ • Không lưu trữ tin nhắn (bắn đi ngay)│
└───────────────────────────────────────┴───────────────────────────────────────┘

┌───────────────────────────────────────┬───────────────────────────────────────┐
│         RDS Read Replicas             │            RDS Multi-AZ               │
├───────────────────────────────────────┼───────────────────────────────────────┤
│ • Mục đích: Mở rộng năng lực ĐỌC      │ • Mục đích: Khắc phục sự cố (HA & DR) │
│ • Sao chép Bất đồng bộ (Asynchronous) │ • Sao chép Đồng bộ (Synchronous)      │
│ • Có DNS Endpoint riêng để truy vấn đọc│ • KHÔNG thể đọc từ node Standby       │
│ • Có thể Cross-Region                 │ • Tự động Failover khi node chính sập │
└───────────────────────────────────────┴───────────────────────────────────────┘

┌───────────────────────────────────────┬───────────────────────────────────────┐
│     VPC Gateway Endpoint (Miễn phí)   │   VPC Interface Endpoint (Có phí)     │
├───────────────────────────────────────┼───────────────────────────────────────┤
│ • Chỉ hỗ trợ duy nhất: S3 & DynamoDB  │ • Hỗ trợ hầu hết mọi dịch vụ AWS khác │
│ • Cấu hình trực tiếp trên Route Table │ • Tạo Card mạng ảo (ENI) trong Subnet │
│ • Không tốn chi phí sử dụng hàng giờ  │ • Tính phí theo giờ và GB dữ liệu     │
└───────────────────────────────────────┴───────────────────────────────────────┘
```

### Trick 4: Quy tắc các con số vàng (Golden Numbers & Limits)
Ghi nhớ các giới hạn cứng này sẽ giúp bạn loại bỏ đáp án sai trong 5 giây:
* **Mạng VPC**: Luôn có **5 địa chỉ IP bị giữ lại** trong mỗi Subnet (`.0`, `.1`, `.2`, `.3`, `.255`). Subnet `/24` có 256 IPs nhưng chỉ dùng được **251 IPs**.
* **Amazon S3**:
  * Giới hạn Prefix: **3,500 PUT/POST/DELETE** và **5,500 GET** req/giây trên mỗi prefix.
  * Tải file đơn lẻ bằng 1 lệnh PUT tối đa: **5 GB**. Tệp lớn hơn 5 GB **bắt buộc** dùng Multipart Upload (khuyến nghị cho mọi file > 100 MB).
* **AWS Lambda**:
  * Thời gian chạy tối đa (Timeout): **15 phút (900 giây)**. Bất kỳ tác vụ nào chạy tốn hơn 15 phút ➔ Loại Lambda, chọn **AWS Batch**, **ECS Task**, hoặc **EC2**.
* **Amazon SQS**:
  * Thời gian ẩn thông điệp (*Visibility Timeout*): Mặc định **30 giây**, tối đa **12 giờ**.
  * Thời gian lưu giữ (*Retention Period*): Mặc định **4 ngày**, tối đa **14 ngày**.
* **Amazon RDS / Aurora**: Tối đa **15 Read Replicas**.
* **Kỳ hạn sao lưu tự động RDS**: Tối đa **35 ngày**. Muốn giữ lâu hơn phải dùng **Manual Snapshot** (tồn tại vĩnh viễn) hoặc **AWS Backup**.

### Trick 5: Chiến thuật quản lý thời gian thi 3 vòng (3-Pass Strategy)
Với tổng thời gian **160 phút** (đã bật ESL +30) cho **65 câu hỏi** (khoảng ~2.5 phút/câu):

```
       [ 0 - 80 Phút ]            [ 80 - 130 Phút ]           [ 130 - 160 Phút ]
      ┌───────────────┐          ┌─────────────────┐         ┌──────────────────┐
      │   VÒNG 1      │  ────►   │     VÒNG 2      │  ────►  │     VÒNG 3       │
      │ Làm câu dễ    │          │ Xử lý câu Flag  │         │ Rà soát tổng thể │
      └───────────────┘          └─────────────────┘         └──────────────────┘
```

1. **Vòng 1 (0 – 80 phút) - Quét nhanh câu hỏi dễ**:
   * Đọc đề, câu nào chắc chắn biết đáp án ➔ Chọn ngay trong vòng 45–60 giây.
   * Câu nào dài, có kiến trúc phức tạp hoặc phân vân giữa 2 đáp án ➔ Chọn tạm 1 đáp án theo trực giác đầu tiên, bấm nút **"Flag for Review"** và chuyển sang câu kế tiếp. Tuyệt đối không dừng lại quá 2 phút ở bất kỳ câu nào.
2. **Vòng 2 (80 – 130 phút) - Giải quyết các câu gắn cờ (Flagged Questions)**:
   * Mở danh sách các câu đã Flag (thường khoảng 15–20 câu).
   * Dùng kỹ thuật *Đọc ngược câu hỏi chốt* và áp dụng *Ma trận loại trừ*. So sánh kỹ 2 đáp án còn lại để tìm ra điểm vi phạm ràng buộc chi phí hoặc vận hành.
3. **Vòng 3 (130 – 160 phút) - Rà soát tổng thể**:
   * Kiểm tra để đảm bảo **100% câu hỏi đều đã được chọn đáp án** (AWS không trừ điểm câu trả lời sai, không bao giờ để trống câu trả lời).
   * Tự tin hoàn thành và bấm nộp bài.

---

### 5. Bảng Keyword Triggers Nhanh Trong Phòng Thi

| Yêu cầu trong câu hỏi đề thi | Dịch vụ / Tính năng AWS đáp án tối ưu |
| :--- | :--- |
| *"Most cost-effective for static website"* | **S3 Static Website + Amazon CloudFront** |
| *"Sub-millisecond latency for cache"* | **Amazon ElastiCache** hoặc **DynamoDB DAX** |
| *"Single-digit millisecond latency for S3 objects / AI training data"* | **Amazon S3 Express One Zone** |
| *"Deploy containerized web app / API with least operational overhead"* | **AWS App Runner** |
| *"Scale DB compute and memory instantly without downtime during traffic spikes"* | **Amazon Aurora Serverless v2** |
| *"Cost-effective database storage for high I/O intensive workloads"* | **Amazon Aurora I/O-Optimized Storage** |
| *"Primary durable in-memory database with Multi-AZ transaction log"* | **Amazon MemoryDB for Redis** |
| *"Prevent SSRF attacks targeting EC2 instance metadata"* | **IMDSv2 (HttpTokens = required)** |
| *"Ultra-low latency, static IP for gaming/streaming, multi-region routing"* | **Network Load Balancer (NLB)** hoặc **AWS Global Accelerator** |
| *"Decouple asynchronous workloads with no duplicate processing"* | **Amazon SQS FIFO Queue** |
| *"Point-to-point integration with filtering & enrichment without Lambda"* | **Amazon EventBridge Pipes** |
| *"Serverless massive parallel batch processing of millions of S3 objects"* | **AWS Step Functions Distributed Map** |
| *"Multi-region disaster recovery for encrypted data with same key"* | **AWS KMS Multi-Region Keys** |
| *"Immutable backups resistant to ransomware deletion (WORM compliance)"* | **AWS Backup Vault Lock (Compliance Mode)** |
| *"Temporary IAM credentials for on-premises workloads using PKI X.509"* | **AWS IAM Roles Anywhere** |
| *"Service-to-service Layer 7 networking across VPCs without managing CIDR/peering"* | **Amazon VPC Lattice** |
| *"Deploy and scale 3rd-party virtual firewalls / IDS / IPS appliances"* | **AWS Gateway Load Balancer (GWLB)** |
| *"Block IP at subnet level"* | **Network ACL (NACL)** |
| *"Block SQL injection / XSS at Layer 7"* | **AWS WAF** |
| *"Extract text, tables, and forms from scanned documents with no ML expertise"* | **Amazon Textract** |
| *"Access generative AI Foundation Models (LLMs) via managed serverless API"* | **Amazon Bedrock** |

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [387 - State of Learning Checkpoint - AWS Certified Sol.md](file:///n:/AWS_XBrain_Note/AWS_Resources/32%20-%20Preparing%20for%20the%20Exam%20+%20Pract/387%20-%20State%20of%20Learning%20Checkpoint%20-%20AWS%20Certified%20Sol.md)
  - [388 - Exam Tips - AWS Certified Solutions Architect As.md](file:///n:/AWS_XBrain_Note/AWS_Resources/32%20-%20Preparing%20for%20the%20Exam%20+%20Pract/388%20-%20Exam%20Tips%20-%20AWS%20Certified%20Solutions%20Architect%20As.md)
  - [391 - Save 50% on your AWS Exam Cost!.md](file:///n:/AWS_XBrain_Note/AWS_Resources/32%20-%20Preparing%20for%20the%20Exam%20+%20Pract/391%20-%20Save%2050%25%20on%20your%20AWS%20Exam%20Cost!.md)
  - [392 - Get an Extra 30 Minutes on your AWS Exam - Non N.md](file:///n:/AWS_XBrain_Note/AWS_Resources/32%20-%20Preparing%20for%20the%20Exam%20+%20Pract/392%20-%20Get%20an%20Extra%2030%20Minutes%20on%20your%20AWS%20Exam%20-%20Non%20N.md)
  - [393 - How does the exam work_.md](file:///n:/AWS_XBrain_Note/AWS_Resources/32%20-%20Preparing%20for%20the%20Exam%20+%20Pract/393%20-%20How%20does%20the%20exam%20work_.md)
