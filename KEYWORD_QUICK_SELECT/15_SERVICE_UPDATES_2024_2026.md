# 15 — 🆕 CẬP NHẬT DỊCH VỤ AWS 2024–2026: Con Số Mới, Dịch Vụ Ngừng Hỗ Trợ & Tính Năng Mới

> **Mục tiêu**: Gom về một chỗ mọi thay đổi quan trọng của AWS (đến **11/2026**) làm lệch so với khóa học / bộ đề luyện thi cũ, để khi gặp đáp án "lạ" trong đề hoặc làm dự án thực tế không bị nhầm.
>
> **Nguyên tắc dùng khi đi thi**: Đề thi SAA-C03 được cập nhật chậm hơn dịch vụ thật. Nếu đáp án chỉ khớp với **số liệu cũ** (VD: SQS 256 KB) thì vẫn chọn theo **logic kiến trúc** mà câu hỏi muốn kiểm tra (VD: "payload lớn → lưu S3 + pointer"), không sa đà vào con số.

---

## 🎓 1. TRẠNG THÁI KỲ THI SOLUTIONS ARCHITECT – ASSOCIATE

| Hạng mục | Thông tin hiện tại |
|:---|:---|
| **Mã đề** | Vẫn là **SAA-C03** (chưa có SAA-C04). |
| **Exam guide** | Đã có bản sửa **v1.0 (28/08/2026)** và **v1.1 (29/10/2026)**. AWS công bố thay đổi exam guide khoảng **1 tháng trước** khi áp dụng vào đề. |
| **Thay đổi danh mục dịch vụ** | **Amazon Elastic Transcoder bị bỏ khỏi danh sách in-scope** (dịch vụ đã ngừng). Bỏ khỏi danh sách out-of-scope: AWS DeepComposer, Amazon DevOps Guru, Amazon Elastic Inference, Amazon Managed Blockchain, Amazon Sumerian (các dịch vụ đã/đang ngừng). |
| **Bối cảnh các đề khác** | Solutions Architect – Professional chuyển sang **SAP-C03** (GA từ 17/11/2026); Developer – Associate chuyển sang **DVA-C03** (GA từ 01/12/2026). |

---

## 🔢 2. CÁC CON SỐ / GIỚI HẠN ĐÃ THAY ĐỔI

| Dịch vụ | Giá trị cũ (khóa học / đề cũ) | Giá trị mới | Thời điểm |
|:---|:---|:---|:---|
| **Amazon SQS** – kích thước message | 256 KiB | **1 MiB** (Standard & FIFO); > 1 MiB vẫn dùng Extended Client Library + S3 (tới 2 GB) | 08/2025 |
| **AWS Lambda** – payload gọi bất đồng bộ | 256 KB | **1 MB** (đồng bộ vẫn 6 MB); phần > 256 KB tính thêm request theo khối 64 KB | 10/2025 |
| **Amazon EventBridge** – kích thước event | 256 KB | **1 MB** | 10/2025 |
| **Kinesis Data Streams** – kích thước record | 1 MiB | Mặc định 1 MiB, **cấu hình tới 10 MiB** / stream; `PutRecords` tới 10 MiB. Throughput/shard **không đổi** (1 MB/s ghi, 2 MB/s đọc) | 10/2025 |
| **Amazon S3** – kích thước object | 5 TB | **50 TB** (1 PUT vẫn ≤ 5 GB; 1 GET đơn ≤ 5 TB, object lớn hơn tải bằng byte-range/part) | 12/2025 |
| **EBS gp3** | 16 TiB · 16,000 IOPS · 1,000 MiB/s | **64 TiB · 80,000 IOPS · 2,000 MiB/s** (giá không đổi; vẫn bị giới hạn bởi băng thông EBS của instance) | 09/2025 |
| **Aurora Global Database** – số Region phụ | 5 | **10** | 05/2025 |
| **Aurora** – dung lượng cluster | 128 TiB | **256 TiB** (Aurora MySQL 3.10+, Aurora PostgreSQL 15.13/16.9/17.5+) | 07/2025 |
| **Aurora Serverless v2** – dải ACU | 0.5 – 128 ACU | **0 ACU (auto-pause) – 256 ACU (MySQL) / 384 ACU (PostgreSQL)** (tùy phiên bản engine) | 10–11/2024 trở đi |
| **DynamoDB** – đổi Provisioned → On-Demand | 1 lần / 24 giờ | **4 lần / 24 giờ** (On-Demand → Provisioned không giới hạn) | 08/2025 |
| **API Gateway** – integration timeout | Cứng 29 giây | Mặc định 29s; **REST API Regional/Private xin tăng được > 29s** (đổi lại giảm throttle quota). HTTP API tối đa 30s | 06/2024 |
| **AWS KMS** – chuẩn HSM | FIPS 140-2 Level 2 (tổng thể) | **FIPS 140-3 Level 3** | 2023–2024 |
| **AWS CloudHSM** | FIPS 140-2 Level 3 | `hsm2m.medium`: **FIPS 140-3 Level 3** | 2024 |
| **ACM** – export chứng chỉ public | Không export được | **Exportable public certificate** (có phí) dùng cho EC2/container/on-prem | 06/2025 |
| **ACM** – thời hạn chứng chỉ public | 395 ngày | **198 ngày** (theo quy định CA/Browser Forum) | 2026 |
| **Public IPv4** | EIP đang gắn miễn phí | **Mọi IPv4 public tính $0.005/giờ** (kể cả EIP đang gắn) | 02/2024 |

---

## ⛔ 3. DỊCH VỤ ĐÃ NGỪNG / KHÔNG NHẬN KHÁCH MỚI (LIÊN QUAN ĐỀ SAA)

> **Thuật ngữ**: *Maintenance* = khách cũ vẫn dùng, **không nhận khách mới**. *Sunset* = đã công bố ngày kết thúc. *End of support / Full shutdown* = đã ngừng hoàn toàn.

| Dịch vụ | Trạng thái | Mốc thời gian | Hướng thay thế |
|:---|:---|:---|:---|
| **Amazon Elastic Transcoder** | Đã ngừng | 13/11/2025 | AWS Elemental **MediaConvert** |
| **Amazon QLDB** | Đã ngừng | 31/07/2025 | **Aurora PostgreSQL** (audit/ledger pattern) |
| **AWS Snowmobile** | Đã ngừng | 03/2024 | — |
| **AWS Snowball Edge** (Storage/Compute Optimized) | Không nhận khách mới | 07/11/2025 | **DataSync** (+ Direct Connect), **AWS Data Transfer Terminal**, Partner; edge compute → **Outposts** |
| **Amazon Pinpoint** | Đã ngừng hỗ trợ | Không nhận khách mới 20/05/2025; ngừng 30/10/2026 | **AWS End User Messaging** (SMS/voice/push/OTP), **Amazon SES** (email), **Amazon Connect** (campaign/journey) |
| **AWS Migration Hub**, **Application Discovery Service** | Không nhận khách mới | 07/11/2025 | **AWS Transform** |
| **Amazon Glacier** (dịch vụ vault gốc, API riêng) | Không nhận khách mới | 12/2025 | **Các storage class S3 Glacier** (không bị ảnh hưởng) |
| **Amazon S3 Object Lambda** | Không nhận khách mới | 07/11/2025 | Xử lý bằng Lambda/CloudFront phía ứng dụng |
| **Amazon S3 Select** | Không nhận khách mới | 2024 | **Amazon Athena**, lọc phía client |
| **Timestream for LiveAnalytics** | Không nhận khách mới | 20/06/2025 | **Timestream for InfluxDB** |
| **Amazon FSx File Gateway** | Không nhận khách mới | 28/10/2024 | Kết nối thẳng **FSx for Windows**; cần cache → **FSx for ONTAP FlexCache** |
| **AWS App Runner** | Không nhận khách mới | 30/04/2026 | ECS trên Fargate, Lambda |
| **AWS Audit Manager** | Không nhận khách mới | 30/04/2026 | Kiểm tra tuân thủ bằng Config Conformance Packs, Security Hub CSPM |
| **AWS CloudTrail Lake** | Không nhận khách mới | 31/05/2026 | CloudTrail Trail → S3 + Athena / CloudWatch Logs |
| **Amazon Kendra** | Không nhận khách mới | 30/07/2026 | Amazon Bedrock Knowledge Bases (RAG) |
| **AWS Directory Service – Simple AD** | Không nhận khách mới | 30/07/2026 | AWS Managed Microsoft AD |
| **Amazon Cognito Sync** | Không nhận khách mới | 30/07/2026 | AWS AppSync |
| **SageMaker AI: A2I, Ground Truth, Clarify, Model Monitor...** | Không nhận khách mới | 30/07/2026 | — |
| **Amazon Bedrock Agents** (nay gọi *Agents Classic*) | Không nhận khách mới | 30/07/2026 | **Amazon Bedrock AgentCore** |
| **AWS WAF Classic** | Đã ngừng | 07/10/2026 | **AWS WAF** (bản hiện tại) |
| **Amazon Inspector Classic** | Đã ngừng | 20/05/2026 | **Amazon Inspector** |
| **Kinesis Data Analytics for SQL** | Đã ngừng | 27/01/2026 | **Managed Service for Apache Flink** |
| **AWS App Mesh** | Đã ngừng | 30/09/2026 | ECS Service Connect / Amazon VPC Lattice |
| **AWS Proton**, **Amazon FinSpace**, **Lookout for Equipment**, **IoT Greengrass v1** | Đã ngừng | 07/10/2026 | — |
| **AWS OpsWorks** (Stacks, Chef, Puppet) | Đã ngừng | 05/2024 | Systems Manager, CloudFormation |
| **AWS CodeStar** | Đã ngừng | 25/07/2024 | CodePipeline + CodeBuild + CodeDeploy |
| **Amazon CodeCatalyst** | Không nhận khách mới | 07/11/2025 | CodePipeline / GitHub Actions... |
| **AWS Cloud9** | Không nhận khách mới | 07/2024 | AWS CloudShell, IDE cục bộ + AWS Toolkit |
| **Amazon CloudWatch Evidently** | Đã ngừng | 17/10/2025 | AWS AppConfig (feature flags) |
| **Amazon RDS Custom for Oracle** | Sunset | Hết hỗ trợ 31/03/2027 | RDS for Oracle / EC2 tự quản |
| **Amazon DevOps Guru** | Sunset | Hết hỗ trợ 09/2027 | — |
| **X-Ray SDK & X-Ray Daemon** | Maintenance | 25/02/2026, hết hỗ trợ 25/02/2027 | **OpenTelemetry** (ADOT / CloudWatch agent); dịch vụ X-Ray vẫn hoạt động |
| **Systems Manager – Change Manager, Incident Manager** | Không nhận khách mới | 07/11/2025 | — |

> ✅ **Ngược chiều**: **AWS CodeCommit đã trở lại General Availability từ 24/11/2025** (từng ngừng nhận khách mới 07/2024).

---

## 🚀 4. TÍNH NĂNG / DỊCH VỤ MỚI ĐÁNG CHÚ Ý CHO KIẾN TRÚC SƯ

### 🌐 Networking
| Tính năng | Ý nghĩa kiến trúc |
|:---|:---|
| **Regional NAT Gateway** (11/2025) | Một NAT Gateway **tự mở rộng/thu hẹp qua nhiều AZ** theo nơi có workload, không cần public subnet ở từng AZ và không phải sửa route table khi thêm AZ; tính phí theo từng AZ hoạt động. *Đề thi kinh điển vẫn là "mỗi AZ một NAT Gateway (zonal)".* |
| **CloudFront VPC Origins** (11/2024) | CloudFront kết nối tới ALB/NLB/EC2 nằm trong **private subnet** → origin không cần public. |
| **PrivateLink cross-Region** (11/2024) | Interface endpoint kết nối tới endpoint service ở Region khác. |
| **Security group referencing qua Transit Gateway** | Có thể tham chiếu SG giữa các VPC gắn cùng TGW (cùng Region). |

### 🗄️ Database & Storage
| Tính năng | Ý nghĩa kiến trúc |
|:---|:---|
| **Amazon Aurora DSQL** (GA 05/2025) | SQL phân tán **serverless, tương thích PostgreSQL**, **active-active multi-Region** với strong consistency (2 Region có endpoint + 1 witness); SLA thiết kế 99.99% (single-Region) / 99.999% (multi-Region). Khác Aurora Global Database (chỉ 1 writer). |
| **DynamoDB Global Tables – MRSC** (GA 06/2025) | Multi-Region **strong consistency**, RPO = 0; đúng 3 Region; không hỗ trợ transaction, TTL, LSI. |
| **Amazon S3 Vectors** (GA 12/2025) | Lưu trữ & truy vấn **vector embeddings** ngay trên S3 (vector bucket/index), chi phí thấp cho RAG; tích hợp Bedrock Knowledge Bases và OpenSearch. |
| **Aurora Serverless scale-to-zero** | Tự pause về 0 ACU khi không có kết nối → hợp với dev/test, tải thất thường. |
| **AWS Data Transfer Terminal** | Địa điểm vật lý của AWS để mang thiết bị lưu trữ tới upload tốc độ cao — thay thế Snowball cho khách mới. |
| **AWS Backup logically air-gapped vault** | Vault luôn khóa compliance, chia sẻ sang tài khoản khác để khôi phục khi tài khoản gốc bị xâm nhập. |

### 🖥️ Compute & Containers
| Tính năng | Ý nghĩa kiến trúc |
|:---|:---|
| **Lambda durable functions** (12/2025) | Viết workflow nhiều bước ngay trong code Lambda với checkpoint/replay; **thời gian chờ không tính phí compute**. Step Functions vẫn là đáp án chuẩn cho orchestration trực quan/human approval trong đề. |
| **Lambda SnapStart** cho Python & .NET (11/2024) | Giảm cold start ngoài Java. |
| **EKS Auto Mode** (12/2024) | AWS tự quản lý node (provision, scale, patch) cho EKS. |
| **ECS Managed Instances** | ECS trên EC2 nhưng AWS lo provisioning, scaling, patching — tầng giữa Fargate và EC2 tự quản. |
| **Amazon Elastic VMware Service (EVS)** (GA 08/2025) | Chạy VMware Cloud Foundation trong VPC của bạn — thêm lựa chọn cho chiến lược **Relocate**. |

### 🔐 Security & Governance
| Tính năng | Ý nghĩa kiến trúc |
|:---|:---|
| **Resource Control Policies – RCP** (11/2024) | Chính sách Organizations đặt **trần quyền trên tài nguyên** (S3, KMS, STS, SQS, Secrets Manager...) — chặn principal ngoài tổ chức dù resource policy cấu hình sai. Bổ sung cho SCP (trần quyền trên principal). |
| **AWS Security Hub (thế hệ mới, GA 12/2025)** | Tương quan tín hiệu từ GuardDuty, Inspector, Macie, Security Hub CSPM để ưu tiên rủi ro gần thời gian thực; Security Hub cũ đổi tên thành **AWS Security Hub CSPM** (chấm điểm CIS/FSBP như trước). |
| **GuardDuty Malware Protection for S3** | Quét malware cho object mới upload lên S3. |
| **KMS: chu kỳ xoay khóa tùy chỉnh 90–2,560 ngày + on-demand rotation** | Linh hoạt hơn mốc 1 năm cố định. |

### 🤖 AI/ML
| Tính năng | Ý nghĩa kiến trúc |
|:---|:---|
| **Amazon Bedrock AgentCore** (GA 10/2025) | Nền tảng triển khai & vận hành AI agent (runtime, memory, gateway, identity, observability) ở quy mô production; hỗ trợ VPC, PrivateLink, CloudFormation. |
| **Amazon SageMaker AI** | Tên mới của Amazon SageMaker (nền tảng ML); "Amazon SageMaker" nay là nền tảng hợp nhất data + AI. |

---

## 🧭 5. BẢNG "ĐỀ CŨ → THỰC TẾ MỚI" ĐỂ PHẢN XẠ NHANH

| Đề thi cũ chọn | Khi gặp tình huống tương tự ngoài thực tế hiện nay |
|:---|:---|
| Snowball Edge / Snowcone / Snowmobile | DataSync (+DX) hoặc AWS Data Transfer Terminal |
| Elastic Transcoder | MediaConvert |
| Pinpoint | End User Messaging / SES / Connect |
| QLDB | Aurora PostgreSQL (+ audit log, bảng append-only) |
| S3 Select | Athena |
| Kinesis Data Analytics for SQL | Managed Service for Apache Flink |
| Migration Hub + Application Discovery Service | AWS Transform |
| "SQS/Lambda async/EventBridge giới hạn 256 KB" | Nay là 1 MB/MiB — vẫn dùng pattern S3 + pointer cho payload lớn hơn |
| "Kinesis không nhận record > 1 MB → MSK" | KDS cấu hình được tới 10 MiB; MSK vẫn là đáp án khi đề nhấn mạnh **Kafka** |
| "S3 object tối đa 5 TB" | 50 TB |
| "Mỗi AZ một NAT Gateway để HA" | Vẫn đúng với zonal NAT GW; có thêm lựa chọn **Regional NAT Gateway** |
