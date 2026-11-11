# ⚡ KEYWORD QUICK SELECT — Thư Mục Từ Khóa Chọn Đáp Án Nhanh & Móc Nhớ Thực Chiến

> **Mục tiêu**: Đọc từ khóa trong đề thi $\rightarrow$ Hiểu ngay bản chất dịch vụ & ngữ cảnh cốt lõi $\rightarrow$ Phản xạ chọn đáp án đúng trong **< 60 giây**.  
> **Nguồn trích xuất**: 1,129+ câu hỏi thực chiến (*Cloud Mentor PT1–6*, *Tutorials Dojo Set 1–8*, *Udemy Stephane Maarek PT1–6*) + Hệ thống 23 tài liệu `AWS_Services`.

---

## 📂 Danh Mục Tài Liệu Tra Cứu (13 Files)

| File | Chuyên Đề Kiến Trúc | Nội Dung & Giá Trị Độc Quyền |
|:---|:---|:---|
| 📖 [**`SERVICE_DEFINITIONS.md`**](./SERVICE_DEFINITIONS.md) | 🌟 **Bách Khoa Định Nghĩa Services** | **Từ điển định nghĩa 65+ dịch vụ AWS cốt lõi**: Bản chất kỹ thuật (What is it?) + Sinh ra để làm gì (Core Job)? + Móc nhớ thần chú + Tín hiệu đề thi. |
| ⚡ [`00_MASTER_REFLEX.md`](./00_MASTER_REFLEX.md) | ⚡ **Master Reflex Table (60s)** | **Bảng phản xạ 60 giây**: Gom toàn bộ 100+ từ khóa cốt lõi thành 1 bảng duy nhất kèm cột **Vì Sao / Móc Nhớ** và **Bẫy Cần Tránh**. |
| 🖥️ [`01_COMPUTE.md`](./01_COMPUTE.md) | 🖥️ **Compute & Serverless** | **Định nghĩa Services** + EC2 Instance Types, Purchasing Options, Placement Groups, Lambda limits/resiliency, ECS Fargate, HPC (EFA/Batch). |
| 📦 [`02_STORAGE.md`](./02_STORAGE.md) | 📦 **Storage & Hybrid** | **Định nghĩa Services** + Bảng tính ngày phạt S3 Storage Classes, S3 Object Lock, EBS vs Instance Store, EFS vs FSx, Storage Gateway, Snow Family. |
| 🗄️ [`03_DATABASE.md`](./03_DATABASE.md) | 🗄️ **Databases & Caching** | **Định nghĩa Services** + RDS Multi-AZ vs Read Replicas, Aurora Global vs DynamoDB Global Tables, DAX vs ElastiCache, QLDB/Neptune/Keyspaces/Timestream. |
| 🌐 [`04_NETWORK.md`](./04_NETWORK.md) | 🌐 **Networking & Delivery** | **Định nghĩa Services** + VPC Connectivity (Peering vs TGW vs PrivateLink), Gateway vs Interface Endpoint, ALB vs NLB vs GWLB, Global Accelerator vs CloudFront, Route 53. |
| 🔐 [`05_SECURITY.md`](./05_SECURITY.md) | 🔐 **Security & Governance** | **Định nghĩa Services** + SCP vs Permission Boundaries, KMS Envelope Encryption, Bộ tứ an ninh (GuardDuty vs Inspector vs Macie vs Detective), Secrets Manager vs Parameter Store. |
| 📬 [`06_MESSAGING.md`](./06_MESSAGING.md) | 📬 **Decoupling & Streaming** | **Định nghĩa Services** + SQS Standard vs FIFO, Visibility Timeout & Backlog Metric, SNS Fan-out, EventBridge vs AppFlow, Kinesis Streams vs Firehose, Step Functions, Amazon MQ. |
| 📊 [`07_ANALYTICS.md`](./07_ANALYTICS.md) | 📊 **Big Data & AI/ML** | **Định nghĩa Services** + Athena serverless query, Glue DataBrew vs ETL Jobs, EMR Spot Task nodes, Redshift Spectrum, Lake Formation, Trọn bộ AI/ML (Textract, Comprehend, Rekognition...). |
| 🛡️ [`08_MIGRATION_DR.md`](./08_MIGRATION_DR.md) | 🛡️ **Migration & Disaster Recovery** | **Định nghĩa Services** + Bộ đôi SCT + DMS, AWS MGN (Rehost) vs DRS, Application Discovery Service, Ma trận 4 cấp độ DR (Backup & Restore $\rightarrow$ Pilot Light $\rightarrow$ Warm Standby $\rightarrow$ Multi-Active). |
| 💰 [`09_COST.md`](./09_COST.md) | 💰 **Cost Optimization** | **Định nghĩa Services** + Compute Savings Plans vs EC2 Instance SP vs Zonal RI (Bẫy giữ chỗ công suất), AWS Budgets vs Cost Explorer, Bẫy phạt S3 Standard-IA, Instance Scheduler. |
| ⚠️ [`10_TRAPS.md`](./10_TRAPS.md) | ⚠️ **Top 30 Bẫy Thi Kinh Điển** | 30 cặp khái niệm dễ nhầm lẫn nhất trong phòng thi, kèm mẹo ghi nhớ bằng câu thần chú và **Master Checklist trước khi bấm Submit**. |

---

## 🧭 Cấu Trúc Bảng "Phản Xạ Kép" Trong Từng File

Mỗi bảng tra cứu đều được cấu trúc theo 4 cột giúp não bộ ghi nhớ bằng logic bản chất:

```markdown
| Từ Khóa Trong Đề Thi | ✅ CHỌN (Đáp án đúng) | 💡 Vì Sao / Ngữ Cảnh Nhớ Nhanh | ❌ Bẫy Cần Tránh |
```

1. **Từ Khóa (Trigger Keywords)**: Những cụm từ tiếng Anh chuẩn AWS thường xuyên xuất hiện ở câu hỏi (ví dụ: *"without opening SSH port 22"*, *"overlapping CIDRs"*, *"active-active multi-region"*).
2. **✅ CHỌN**: Tên dịch vụ hoặc kiến trúc chuẩn của AWS.
3. **💡 Vì Sao / Ngữ Cảnh Nhớ Nhanh**: Bản chất kỹ thuật giải thích vì sao AWS lại thiết kế như vậy, kèm ví dụ thực tế hoặc câu khẩu quyết giúp nhớ mãi.
4. **❌ Bẫy Cần Tránh**: Những đáp án "chim mồi" (distractors) mà đề thi hay cài cắm để đánh lừa thí sinh.

---

## 🚀 Cách Luyện Tập Nhanh Nhất

1. **Trước khi luyện đề (Học bản chất)**: Mở [**`SERVICE_DEFINITIONS.md`**](./SERVICE_DEFINITIONS.md) đọc lướt qua một lượt để nắm bức tranh toàn cảnh về 65+ dịch vụ AWS.
2. **Khi làm bài Practice Test (Tra cứu nhanh)**: Mở [`00_MASTER_REFLEX.md`](./00_MASTER_REFLEX.md) $\rightarrow$ Nhấn `Ctrl + F` tìm từ khóa nổi bật trong đề $\rightarrow$ Chọn đáp án trong < 60 giây.
3. **Khi gặp câu phân vân giữa 2 đáp án tương tự**: Mở ngay [`10_TRAPS.md`](./10_TRAPS.md) để đối chiếu cặp khái niệm đang băn khoăn.
4. **Khi cần ôn tập theo chuyên đề**: Đọc từng file từ `01` đến `09` (mỗi file đều có sẵn Bảng Định Nghĩa Dịch Vụ ở đầu trang).
