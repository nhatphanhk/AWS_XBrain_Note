# ⚡ KEYWORD QUICK SELECT — Thư Mục Từ Khóa Chọn Đáp Án Nhanh & Móc Nhớ Thực Chiến

> **Mục tiêu**: Đọc từ khóa trong đề thi $\rightarrow$ Hiểu ngay bản chất dịch vụ & ngữ cảnh cốt lõi $\rightarrow$ Phản xạ chọn đáp án đúng trong **< 60 giây**.  
> **Nguồn trích xuất**: 1,129+ câu hỏi thực chiến (*Cloud Mentor PT1–6*, *Tutorials Dojo Set 1–8*, *Udemy Stephane Maarek PT1–6*) + Toàn bộ 54 trang cẩm nang kiến trúc `Note SAA.pdf` + Hệ thống tài liệu AWS chính quy.

---

## 📂 Danh Mục Toàn Diện Hệ Thống Tài Liệu Tra Cứu (17 Files)

| File | Chuyên Đề Kiến Trúc | Nội Dung & Giá Trị Độc Quyền |
|:---|:---|:---|
| 📖 [**`SERVICE_DEFINITIONS.md`**](./SERVICE_DEFINITIONS.md) | 🌟 **Bách Khoa Định Nghĩa Services** | **Từ điển định nghĩa hơn 90+ dịch vụ AWS**: Bản chất kỹ thuật (What is it?) + Sinh ra để làm gì (Core Job)? + Móc nhớ thần chú + Tín hiệu đề thi. |
| ⚡ [`00_MASTER_REFLEX.md`](./00_MASTER_REFLEX.md) | ⚡ **Master Reflex Table (60s)** | **Bảng phản xạ 60 giây**: Gom toàn bộ 150+ từ khóa cốt lõi thành 1 bảng duy nhất kèm cột **Vì Sao / Móc Nhớ** và **Bẫy Cần Tránh** + Bảng thông số Hard Limits. |
| 🖥️ [`01_COMPUTE.md`](./01_COMPUTE.md) | 🖥️ **Compute, Containers & Edge** | EC2 Instance Types, Purchasing Options, Placement Groups, ASG lifecycle & scaling policies, Warm Pool, Lambda limits/resiliency, ECS/EKS/Fargate, Outposts, Local Zones, Wavelength, ECS/EKS Anywhere, ECR. |
| 📦 [`02_STORAGE.md`](./02_STORAGE.md) | 📦 **Storage & Data Transfer** | S3 Hard Limits, Storage Classes & ngày phạt, Lifecycle rules, S3 Object Lock & Replication (Batch Replication), EBS vs Instance Store, EFS vs FSx (Windows, Lustre, ONTAP, OpenZFS), Storage Gateway, DataSync, Transfer Family, Backup Vault Lock. |
| 🗄️ [`03_DATABASE.md`](./03_DATABASE.md) | 🗄️ **Databases & Caching** | RDS Subnet Groups, Storage Auto Scaling, RDS Proxy, RDS Custom (OS Root), Multi-AZ Cluster vs Read Replicas, Aurora architecture (6 copies/3 AZ, Serverless v2, Global DB, Clone, Backtrack), DynamoDB RCU/WCU math, DAX, Streams, Global Tables, ElastiCache, NoSQL Suite (DocumentDB, Neptune, Keyspaces, Timestream, MemoryDB). |
| 🌐 [`04_NETWORK.md`](./04_NETWORK.md) | 🌐 **Networking & Delivery** | VPC CIDR math & 5 reserved IPs, 3-tier HA architecture, Peering vs TGW vs PrivateLink (Overlapping CIDR), Gateway vs Interface Endpoint, ALB vs NLB vs GWLB, CloudFront OAC vs CDN, Global Accelerator, Route 53 (Alias vs CNAME, Routing policies, Route 53 Resolver Inbound/Outbound), API Gateway (REST, HTTP, WebSocket), VPN CloudHub & Client VPN. |
| 🔐 [`05_SECURITY.md`](./05_SECURITY.md) | 🔐 **Security, Identity & Compliance** | IAM Root user best practices, Policy Evaluation Equation, SCPs & Permission Boundaries, IAM Identity Center (SSO), Directory Service, KMS Envelope Encryption & S3 Bucket Key, CloudHSM FIPS 140-2 L3, Bộ tứ an ninh (GuardDuty, Inspector, Macie, Detective), WAF vs Shield vs Network Firewall, Secrets Manager vs Parameter Store, RAM, Artifact vs Audit Manager. |
| 📬 [`06_MESSAGING.md`](./06_MESSAGING.md) | 📬 **Decoupling & Integration** | SQS Standard vs FIFO, Visibility Timeout & Backlog Metric scaling, SNS Fan-out, EventBridge Event Bus, EventBridge Scheduler, EventBridge Pipes, Archive & Replay, Step Functions Standard vs Express, Amazon MQ (JMS/AMQP lift-and-shift), AppFlow, AppSync. |
| 📊 [`07_ANALYTICS.md`](./07_ANALYTICS.md) | 📊 **Big Data, Analytics & AI/ML** | Athena serverless ANSI SQL & Parquet optimization, Kinesis Data Streams vs Firehose vs Managed Flink, Amazon MSK (Apache Kafka, 10 MB payload), EMR Spot Task nodes, Glue Crawlers & DataBrew, Lake Formation granular security, Redshift Spectrum & Concurrency Scaling, OpenSearch, QuickSight SPICE, Data Exchange, Trọn bộ AI/ML (Bedrock, SageMaker, Textract, Comprehend, Rekognition, A2I). |
| 🛡️ [`08_MIGRATION_DR.md`](./08_MIGRATION_DR.md) | 🛡️ **Migration & Disaster Recovery** | Chiến lược 7Rs, Application Discovery Service (Agentless vs Agent-based), AWS MGN (Rehost TCP 1500), DMS + SCT (CDC zero-downtime), DataSync (10x rsync), Snow Family (Snowcone, Snowball, Snowmobile), AWS DRS (Block-level replication), VM Import/Export, Ma trận 4 cấp độ DR (Backup & Restore $\rightarrow$ Pilot Light $\rightarrow$ Warm Standby $\rightarrow$ Multi-Active). |
| 💰 [`09_COST.md`](./09_COST.md) | 💰 **Cost Optimization & Billing** | Cost Explorer (13-38m history, 12m forecast), AWS Budgets + Budget Actions, CUR / Data Exports (Athena hourly), Cost Allocation Tags (kích hoạt console), Cost Anomaly Detection (ML root cause), Compute Optimizer, Pricing Calculator, Ma trận chi phí truyền dữ liệu Data Transfer Cost rules. |
| ⚠️ [`10_TRAPS.md`](./10_TRAPS.md) | ⚠️ **Top 40 Bẫy Thi Kinh Điển** | **40 cặp khái niệm đối đầu dễ nhầm lẫn nhất** trong phòng thi, kèm mẹo ghi nhớ bằng logic bản chất và **Master Checklist 40 quy tắc vàng trước khi bấm Submit**. |
| 📋 [`11_MANAGEMENT_GOVERNANCE.md`](./11_MANAGEMENT_GOVERNANCE.md) | 📋 **Management, Governance & Monitoring** | CloudWatch Metrics, CloudWatch Agent (RAM/Disk), Logs Insights, Subscription Filters, CloudTrail (Management vs Data events, Integrity validation), Config (Rules & SSM Auto-Remediation), CloudFormation (StackSets, Drift Detection, DeletionPolicy), SSM (Session Manager no port 22, Run Command, Patch Manager), Control Tower Landing Zone, Service Catalog, Health Dashboard, License Manager BYOL, Managed Grafana & Prometheus. |
| 🛠️ [`12_DEVELOPER_TOOLS.md`](./12_DEVELOPER_TOOLS.md) | 🛠️ **Developer Tools & CI/CD** | AWS X-Ray (Service Map, trace/subsegment, annotations vs metadata), CodePipeline (stages, manual approval SNS), CodeBuild (buildspec.yml serverless build), CodeDeploy (appspec.yml, blue/green, linear/canary traffic shifting), CodeArtifact (private npm/pip repo, upstream cache proxy), CloudShell, AWS CDK & AWS SAM. |
| 🎬 [`13_MEDIA_FRONTEND.md`](./13_MEDIA_FRONTEND.md) | 🎬 **Media & Frontend Services** | Elemental MediaConvert (VOD HLS/DASH/DRM) vs Elastic Transcoder (legacy), Kinesis Video Streams (WebRTC 2-way), Amazon IVS (< 5s Twitch livestream), MediaLive + MediaPackage (24/7 broadcast), Kiến trúc VOD/Camera/Livestream, AWS Amplify (Full-stack SSR Next.js, Git CI/CD), Device Farm (real physical hardware), Location Service, Pinpoint. |
| ⚙️ [`14_SERVERLESS_PATTERNS.md`](./14_SERVERLESS_PATTERNS.md) | ⚙️ **Serverless Architecture & Hard Limits** | Triết lý thiết kế Serverless ("least operational overhead", "no server management", "scale to zero"), 8 mô hình kiến trúc Serverless chuẩn mực, **Bảng tra cứu thông số giới hạn cứng (Hard Limits & Numbers) cần thuộc lòng trước khi thi**. |

---

## 🧭 Cấu Trúc Bảng "Phản Xạ Kép" Trong Từng Chuyên Đề

Mỗi bảng tra cứu đều được cấu trúc theo 4 cột giúp não bộ ghi nhớ bằng logic bản chất:

```markdown
| Trigger Keyword (Từ khóa đề thi) | ✅ CHỌN (Đáp án đúng) | 💡 Vì Sao / Móc Nhớ Thực Chiến | ❌ Bẫy Cần Tránh |
```

1. **Từ Khóa (Trigger Keywords)**: Những cụm từ tiếng Anh chuẩn AWS thường xuyên xuất hiện ở câu hỏi (ví dụ: *"without opening SSH port 22"*, *"overlapping CIDRs"*, *"active-active multi-region"*, *"least operational overhead"*).
2. **✅ CHỌN**: Tên dịch vụ hoặc giải pháp kiến trúc chuẩn xác nhất của AWS.
3. **💡 Vì Sao / Móc Nhớ Thực Chiến**: Bản chất kỹ thuật giải thích nguyên nhân sâu xa vì sao giải pháp này lại tối ưu, kèm hình ảnh ẩn dụ thực tế hoặc câu khẩu quyết giúp nhớ mãi.
4. **❌ Bẫy Cần Tránh**: Những đáp án "chim mồi" (distractors) tinh vi mà đề thi cài cắm để gài bẫy thí sinh.

---

## 🚀 Lộ Trình Ôn Luyện Phản Xạ 60 Giây

1. **Bước 1: Nắm vững bản chất (Foundation)**:
   - Đọc lướt [**`SERVICE_DEFINITIONS.md`**](./SERVICE_DEFINITIONS.md) để hiểu trọn vẹn bản chất và "core job" của hơn 90+ dịch vụ AWS.
2. **Bước 2: Củng cố chuyên đề yếu (Deep Dive)**:
   - Đọc chuyên sâu các file từ `01` đến `14` theo từng nhóm dịch vụ mà bạn hay làm sai khi thi thử (ví dụ: Mạng xem `04`, Bảo mật xem `05`, Serverless xem `14`).
3. **Bước 3: Luyện đề thi thử & Tra cứu phản xạ (Practice Reflex)**:
   - Khi làm các bộ đề (*Tutorials Dojo*, *Stephane Maarek*, *Cloud Mentor*): Mở song song [`00_MASTER_REFLEX.md`](./00_MASTER_REFLEX.md) $\rightarrow$ Nhấn `Ctrl + F` tìm từ khóa nổi bật trong câu hỏi $\rightarrow$ Chốt ngay đáp án đúng trong vòng 60 giây.
4. **Bước 4: Tiêm vaccine chống bẫy (Immunity)**:
   - Trước ngày thi từ 2 - 3 ngày: Đọc kỹ [`10_TRAPS.md`](./10_TRAPS.md) để khắc sâu 40 cặp bẫy kinh điển và ghi nhớ trọn bộ **Master Checklist 40 quy tắc vàng**.
