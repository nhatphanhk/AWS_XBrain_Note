# 10 — ⚠️ TRAPS: Top 40 Cặp Khái Niệm Dễ Nhầm Lẫn Trong Phòng Thi

> Mỗi cặp: **Tình huống đề bài → Vì sao chọn A không phải B → Móc nhớ thần chú**

---

## 🔴 STORAGE TRAPS

### TRAP 1: S3 Standard-IA vs S3 Standard (file < 30 ngày)
| | Standard | Standard-IA |
|:---|:---|:---|
| Min storage charge | Không có | **30 ngày** (phạt dù xóa trước) |
| Retrieval fee | $0 | $0.01/GiB |
| **Dùng cho file < 30 ngày** | ✅ Rẻ hơn | ❌ Phạt tính đủ 30 ngày |

**💡 Móc nhớ**: _"IA = Infrequent Access, nhưng vẫn tính tiền đủ 30 ngày dù bạn xóa sau 10 ngày. File ngắn hạn < 30 ngày → Standard luôn rẻ hơn."_
**Trigger keywords**: "deleted after 10 days", "temporary files", "short-lived", "lifecycle < 30 days"

---

### TRAP 2: EFS vs FSx for Windows (NFS vs SMB)
| | EFS | FSx for Windows |
|:---|:---|:---|
| Protocol | **NFS v4** (Linux only) | **SMB** (Windows/AD) |
| Active Directory | ❌ | ✅ Native integration |
| NTFS ACLs | ❌ | ✅ |

**💡 Móc nhớ**: _"E**F**S = **F**ile system **L**inux (NFS). F**S**x for Windows = **S**MB = **S**hare Windows."_  
**Trigger keywords**: "Windows", "SMB", "Active Directory", "NTFS ACLs" → FSx for Windows  
**Trigger keywords**: "Linux", "NFS", "POSIX", "without changing app code" (Linux) → EFS

---

### TRAP 3: DataSync vs Storage Gateway
| | DataSync | Storage Gateway |
|:---|:---|:---|
| Mục đích | **Di chuyển / Đồng bộ định kỳ** | **Cầu nối liên tục hàng ngày** |
| Local cache | ❌ | ✅ (app on-prem vẫn dùng được) |
| Use case | "sync mỗi đêm", "migrate 1 lần" | "app on-prem mount file share lên S3" |

**💡 Móc nhớ**: _"DataSync = **Sync** (đồng bộ định kỳ). Storage Gateway = **Gateway** (cổng kết nối liên tục, có cache tại chỗ)."_

---

### TRAP 4: Volume Gateway Cached vs Stored
| | Cached Volumes | Stored Volumes |
|:---|:---|:---|
| Data primary ở đâu? | **Cloud (S3)** | **On-premises** |
| Local là gì? | Cache phần hay dùng | Toàn bộ data |
| Truy cập data local nhanh không? | Chậm hơn (cache miss → S3) | Nhanh (đọc local) |

**💡 Móc nhớ**: _"**C**ached = **C**loud là chính (S3). **S**tored = **S**ite (on-prem) là chính."_

---

### TRAP 5: S3 Object Lock Compliance vs Governance
| | Compliance Mode | Governance Mode |
|:---|:---|:---|
| Root AWS có xóa được? | ❌ Không ai xóa được | ✅ Root có thể |
| IAM bypass? | ❌ | ✅ (với quyền đặc biệt) |
| Dùng khi | Ransomware, SEC 17a-4 | Nội bộ cần kiểm soát mềm hơn |

**💡 Móc nhớ**: _"**Compliance** = **Không** (không một ai). **Governance** = **Governance** (người có quyền quản lý vẫn bypass được)."_

---

## 🟠 NETWORK / CDN TRAPS

### TRAP 6: CloudFront vs AWS Global Accelerator
| | CloudFront | Global Accelerator |
|:---|:---|:---|
| IP | Thay đổi (DNS-based) | **2 Static Anycast IP** |
| Caching | ✅ Edge caching | ❌ Không cache |
| Protocol | HTTP/HTTPS only | **TCP và UDP** |
| Bypass DNS cache | ❌ | ✅ |
| Use case | CDN, web content | Gaming, VoIP, IoT, bypass DNS |

**💡 Móc nhớ**: _"**Global Accelerator** = IP **không đổi** + **UDP** + **bỏ qua DNS**. Nếu đề bài có 1 trong 3 từ đó → Global Accelerator."_

---

### TRAP 7: CloudFront Price Classes vs Geo-Restrictions
| | Price Classes | Geo-Restrictions |
|:---|:---|:---|
| Mục đích | **Giảm chi phí** (bỏ edge đắt) | **Chặn truy cập** theo quốc gia |
| Người dùng bị ảnh hưởng? | Trải nghiệm chậm hơn (edge xa hơn) | **Bị block 403 Forbidden** |

**💡 Móc nhớ**: _"**Price Class** = tiết kiệm tiền (không block ai). **Geo-Restriction** = cấm vào (block theo quốc gia)."_

---

### TRAP 8: VPC Peering vs Transit Gateway vs PrivateLink
| Scenario | Dùng gì |
|:---|:---|
| 2–3 VPC, CIDR không trùng | VPC Peering |
| Nhiều VPC (hub-and-spoke) | Transit Gateway |
| CIDR **trùng lặp** | **PrivateLink** (duy nhất hoạt động) |
| Expose service cho VPC khác | PrivateLink (NLB backend) |

**💡 Móc nhớ**: _"VPC Peering = không scale (N² connections). TGW = hub trung tâm. **Overlapping CIDR → luôn PrivateLink**, vì Peering và TGW reject CIDR conflict."_

---

### TRAP 9: Gateway VPC Endpoint vs Interface VPC Endpoint
| | Gateway Endpoint | Interface Endpoint (PrivateLink) |
|:---|:---|:---|
| **Chi phí** | **Miễn phí $0** | Có phí ($/giờ + $/GB) |
| Cách hoạt động | Thêm route vào Route Table | Tạo ENI trong subnet |
| Hỗ trợ | **Chỉ S3 + DynamoDB** | 100+ AWS services |

**💡 Móc nhớ**: _"**Gateway** = **G**ratuit (miễn phí) nhưng chỉ **G**oàn với S3 và DynamoDB. Dịch vụ khác → Interface Endpoint (tính phí)."_

---

### TRAP 10: Route 53 Geolocation vs Geoproximity
| | Geolocation | Geoproximity |
|:---|:---|:---|
| Dựa trên | Vị trí người dùng | Vị trí người dùng + tài nguyên |
| Có Bias parameter? | ❌ | ✅ (-99 → +99) |
| Dùng khi | "Route VN users to VN endpoint" | "Shift traffic from US-East to US-West gradually" |

**💡 Móc nhớ**: _"**Geoproximity** có thêm chữ 'Pro' = có thêm tính năng Bias. **Geolocation** = chỉ nhìn vị trí user, không có dial."_

---

### TRAP 11: Route 53 Alias vs CNAME
| | Alias Record | CNAME Record |
|:---|:---|:---|
| Zone Apex (example.com) | ✅ **Có** | ❌ **Không** |
| Trỏ đến | Chỉ AWS resources | Bất kỳ hostname |
| Query cost | **Miễn phí** | Tính phí |

**💡 Móc nhớ**: _"**A**lias = **A**pex OK. **C**NAME = **C**hỉ cho subdomain. Nếu đề có 'example.com' (naked domain) → Alias, không phải CNAME."_

---

## 🟡 DATABASE TRAPS

### TRAP 12: DynamoDB Global Tables vs Aurora Global Database
| | DynamoDB Global Tables | Aurora Global Database |
|:---|:---|:---|
| **Write pattern** | **Active-Active** (mọi region write) | **Active-Passive** (1 region write) |
| Conflict resolution | Last-writer-wins | N/A (chỉ 1 writer) |
| Replication | DynamoDB Streams | Storage-level |
| Dùng khi | "users write locally ở mọi region" | "1 primary + cross-region DR/reads" |

**💡 Móc nhớ**: _"Dyn**a**mo Global = **A**ctive-**A**ctive. **A**urora Global = **A**ctive-Passive (chỉ 1 Active writer)."_

---

### TRAP 13: DAX vs ElastiCache for DynamoDB
| | DAX | ElastiCache |
|:---|:---|:---|
| Code change | **Không** (drop-in replacement) | **Có** (phải check cache trước) |
| Latency | Microsecond | Sub-millisecond |
| Protocol | DynamoDB API | Redis/Memcached API |

**💡 Móc nhớ**: _"DAX = **D**rop-in = **không** đổi code. ElastiCache = phải viết thêm logic 'check cache trước khi hỏi DB'. Đề bài có 'without code change' → DAX 100%."_

---

### TRAP 14: RDS Multi-AZ DB Instance vs DB Cluster vs Read Replicas
| | Multi-AZ Instance | Multi-AZ Cluster | Read Replicas |
|:---|:---|:---|:---|
| Standbys | 1 (passive) | **2 (readable)** | 1–15 (async) |
| Standby đọc được? | ❌ | ✅ | ✅ |
| Failover time | ~60-120s | **~35s** | Manual promote |
| Replication | Synchronous | Semi-sync | **Asynchronous** |
| Dùng cho | HA only | HA + read scaling | Read scaling / Cross-region DR |

**💡 Móc nhớ**: _"**Multi-AZ Instance** = 1 standby câm (không đọc được). **Multi-AZ Cluster** = 2 standby biết nói (readable). **Read Replicas** = async, nhiều bản, scale đọc."_

---

### TRAP 15: DynamoDB PITR vs On-Demand Backup
| | PITR | On-Demand Backup |
|:---|:---|:---|
| Restore về đâu? | **Bất kỳ giây nào** trong 35 ngày | Chỉ về **đúng thời điểm** snapshot |
| Continuous? | ✅ Continuous backup | ❌ Chỉ khi bạn trigger |
| Keyword | "recover to specific second" | "restore from yesterday's backup" |

**💡 Móc nhớ**: _"**PITR** = **P**recise **I**n **T**ime **R**ecovery = về đúng giây. On-Demand = chỉ về đúng lúc snapshot."_

---

## 🟢 SECURITY TRAPS

### TRAP 16: GuardDuty vs Inspector vs Macie (Security Trio)
```
"brute-force, compromised keys, mining, anomalous API"   → GuardDuty  (phát hiện tấn công runtime)
"CVE vulnerabilities, software weakness, ECR image scan" → Inspector  (quét lỗ hổng tĩnh)
"PII data, sensitive data in S3, GDPR/HIPAA classify"    → Macie      (bảo vệ dữ liệu nhạy cảm)
"investigate root cause, attack graph, visual timeline"  → Detective  (điều tra sau sự kiện)
```

**💡 Móc nhớ**: _"**G**uardDuty = **G**uard (canh gác runtime). **I**nspector = **I**nspect (kiểm tra lỗ hổng tĩnh). **M**acie = **M**ining PII trong S3. **D**etective = **D**iều tra nguyên nhân."_

---

### TRAP 17: AWS Config vs CloudTrail
| | CloudTrail | AWS Config |
|:---|:---|:---|
| Ghi lại | **API calls** (ai gọi gì, khi nào) | **Resource state** (cấu hình hiện tại + lịch sử) |
| Auto-remediate? | ❌ | ✅ (với SSM Automation) |
| Keyword | "who deleted", "API audit", "who made change" | "is S3 public?", "compliance check", "auto-fix" |

**💡 Móc nhớ**: _"**CloudTrail** = nhật ký gọi điện (ai gọi AI, nói gì). **Config** = ảnh chụp trạng thái phòng (phòng có ngăn nắp không, tự dọn nếu không)."_

---

### TRAP 18: Secrets Manager vs SSM Parameter Store
| | Secrets Manager | Parameter Store |
|:---|:---|:---|
| **Chi phí** | $0.40/secret/month | **Free** (Standard tier) |
| Auto-rotation | ✅ (Lambda tích hợp sẵn) | ❌ Không tự rotate |
| RDS integration | ✅ Native | ❌ |
| Dùng khi | DB password, API keys cần rotate | Config strings, feature flags, không cần rotate |

**💡 Móc nhớ**: _"**Secrets** Manager = quản lý **bí mật** biết **tự thay** (auto-rotate). **Parameter** Store = lưu **tham số** cấu hình tĩnh, **miễn phí**."_

---

### TRAP 19: SCP vs IAM Permission Boundaries
| | SCP | Permission Boundaries |
|:---|:---|:---|
| Áp dụng cho | **Toàn bộ Account / OU / Root** | **1 IAM User hoặc Role cụ thể** |
| Áp dụng lên Root? | ✅ Member Account Root | ❌ |
| Cấp quyền? | ❌ Chỉ giới hạn | ❌ Chỉ giới hạn |
| Miễn trừ | Service-Linked Roles, Management Account | — |

**💡 Móc nhớ**: _"**SCP** = **S**ắc **C**ấp **P**olicy (cấp tổ chức, trên hết). **Permission Boundary** = ranh giới cá nhân (chỉ cho 1 user/role)."_

---

### TRAP 20: Backup Vault Lock — Governance vs Compliance
| | Governance | Compliance |
|:---|:---|:---|
| Root có xóa được? | ✅ Với quyền đặc biệt | ❌ Không ai xóa được |
| Cooling-off period | Có | 1–72 giờ |
| Dùng khi | Nội bộ muốn kiểm soát nhẹ | Ransomware, pháp lý WORM |

**💡 Móc nhớ**: _"**Compliance** = tuân thủ tuyệt đối = không ai thoát. **Governance** = quản trị = admin vẫn có thể gỡ nếu cần."_

---

## 🔵 MESSAGING TRAPS

### TRAP 21: SQS FIFO vs Standard
| | Standard | FIFO |
|:---|:---|:---|
| Throughput | **Unlimited** | 300–3,000 msg/s |
| Ordering | Best-effort (không đảm bảo) | **Strict First-In-First-Out** |
| Delivery | At-least-once (có thể duplicate) | **Exactly-once** |
| Dùng khi | "decouple, unlimited scale" | "bank transaction, order state machine" |

**💡 Móc nhớ**: _"**FIFO** = hàng đợi ngân hàng (thứ tự, không trùng). **Standard** = siêu thị (không cần thứ tự, throughput cực cao)."_

---

### TRAP 22: Kinesis Data Streams vs Kinesis Firehose
| | Data Streams | Firehose |
|:---|:---|:---|
| Replay | ✅ | ❌ |
| Manage shards | ✅ (manual hoặc On-Demand) | ❌ Serverless |
| Consumer code | Phải viết (KCL/Lambda) | ❌ Tự động deliver |
| Destination | Bất kỳ (tự code) | S3/Redshift/OpenSearch/Splunk |
| Dùng khi | "replay", "retention", "custom processing" | "auto-deliver to S3", "serverless ingestion" |

**💡 Móc nhớ**: _"**Streams** = **S**tore (lưu để replay). **Firehose** = **F**orward only (chỉ giao hàng, không lưu để replay)."_

---

### TRAP 23: EventBridge vs AppFlow
| | EventBridge | AppFlow |
|:---|:---|:---|
| Dữ liệu | **Events** (JSON nhỏ, real-time) | **Bulk data** (CSV, hàng triệu records) |
| Hướng | 1 event → trigger action | 2-chiều (SaaS ↔ AWS) |
| Use case | "Salesforce created a new Lead → trigger Lambda" | "Sync 5 million Salesforce records → S3" |

**💡 Móc nhớ**: _"**EventBridge** = **sự kiện nhỏ** (một đơn hàng → trigger xử lý). **AppFlow** = **luồng dữ liệu lớn** (export toàn bộ database Salesforce → S3)."_

---

### TRAP 24: Amazon MQ vs SQS/SNS
| | Amazon MQ | SQS/SNS |
|:---|:---|:---|
| Protocol | JMS, AMQP, MQTT, STOMP | Chỉ SQS/SNS SDK |
| Migrate legacy app | ✅ Không sửa code | ❌ Phải rewrite |
| Scale | Giới hạn (broker-based) | Unlimited |
| Dùng khi | "migrate ActiveMQ/RabbitMQ" | "new microservices, cloud-native" |

**💡 Móc nhớ**: _"**MQ** = **M**aintain legacy (giữ nguyên code JMS/AMQP). **SQS** = cloud-native mới. 'Migrate' + 'ActiveMQ/RabbitMQ' → MQ 100%."_

---

## 🟣 COMPUTE TRAPS

### TRAP 25: Lambda vs EC2/Batch for long tasks
| | Lambda | AWS Batch |
|:---|:---|:---|
| Max runtime | **15 phút** | **Không giới hạn** |
| Trigger | Event-driven | Job queue |
| Dùng cho | API, webhook, short processing | HPC, ML training, long batch |

**💡 Móc nhớ**: _"Lambda max **15 phút** — đây là giới hạn không thể vượt. 'Unlimited runtime', 'HPC', 'hours-long batch' → AWS Batch."_

---

### TRAP 26: EFA vs ENA (HPC networking)
| | ENA | EFA |
|:---|:---|:---|
| OS-bypass | ❌ | ✅ |
| MPI/NCCL | ❌ Không tương thích | ✅ Yêu cầu EFA |
| Bandwidth | Up to 100 Gbps | Up to 400 Gbps |

**💡 Móc nhớ**: _"**EFA** = **E**FA cho **F**abric **A**dapter HPC = bypass kernel. **ENA** = **E**thernet **N**ormal **A**dapter = TCP/IP thông thường. MPI → phải EFA."_

---

### TRAP 27: Pilot Light vs Warm Standby (DR)
| | Pilot Light | Warm Standby |
|:---|:---|:---|
| EC2 ở DR region | ❌ **ZERO instances** (chỉ AMI/IaC) | ✅ **Scaled-down fleet running** |
| DB ở DR region | ✅ Running + synced | ✅ Running + synced |
| Failover time | Vài chục phút (boot EC2) | Vài phút (scale up) |
| Chi phí | $$ | $$$ |

**💡 Móc nhớ**: _"**Pilot Light** = chỉ có **ngọn lửa nhỏ** (DB). EC2 = tắt. **Warm Standby** = **máy sưởi đang ấm** (EC2 đang chạy, chỉ nhỏ hơn production)."_

---

### TRAP 28: AWS MGN vs AWS DMS
| | AWS MGN | AWS DMS |
|:---|:---|:---|
| Di chuyển cái gì | **Toàn bộ server** (OS + data) | **Chỉ database data** |
| Phương thức | Block-level continuous replication | CDC + full load |
| Dùng cho | Lift-and-Shift server migration | Database migration/replication |

**💡 Móc nhớ**: _"**MGN** = **M**achine (cả máy). **DMS** = **D**atabase (chỉ DB). 'Migrate server', 'Lift-and-Shift' → MGN. 'Migrate Oracle to Aurora' → DMS+SCT."_

---

## ⚫ ANALYTICS TRAPS

### TRAP 29: Textract vs Comprehend
| | Textract | Comprehend |
|:---|:---|:---|
| Input | **Ảnh/PDF** (file) | **Text thuần** (string) |
| Output | Extracted text, tables, forms | Sentiment, entities, language |
| Keyword | "scan", "OCR", "invoice", "form", "PDF" | "sentiment", "NLP", "entities in text" |

**💡 Móc nhớ**: _"**Text**ract = **Text** ra khỏi **ảnh** (OCR). **Compreh**end = **Compreh**ension = hiểu ý nghĩa text."_

---

### TRAP 30: AWS Config vs Security Hub vs Trusted Advisor
| | Config | Security Hub | Trusted Advisor |
|:---|:---|:---|:---|
| Chức năng | Compliance rules + auto-remediate | Aggregate findings + CIS score | 5-pillar best practice checks |
| Input | Resource states | GuardDuty, Inspector, Macie, Config | CloudWatch, IAM, service quotas |
| Keyword | "compliance check", "auto-remediate" | "CIS benchmark", "posture score" | "best practices", "5 pillars" |

**💡 Móc nhớ**: _"**Config** = cảnh sát tự động sửa vi phạm. **Security Hub** = tổng chỉ huy tổng hợp báo cáo. **Trusted Advisor** = cố vấn tham mưu 5 lĩnh vực."_

---

## 🟣 COMPUTE, SECURITY & NETWORK TRAPS BỔ SUNG

### TRAP 31: ECS Task Role vs Task Execution Role
| | ECS Task Role | ECS Task Execution Role |
|:---|:---|:---|
| Đối tượng nhận quyền | **Mã nguồn ứng dụng bên trong container** | **ECS Agent bên dưới máy chủ** |
| Ví dụ quyền hạn | Đọc/ghi S3, query DynamoDB, publish SNS | Kéo Docker image từ ECR, ghi CloudWatch Logs |
| Keyword đề bài | "Application code needs to access DynamoDB" | "Container cannot pull private image from ECR" |

**💡 Móc nhớ**: _"**Task Role** = Role của **App**. **Execution Role** = Role của **Agent thực thi** (kéo image, ghi log)."_

---

### TRAP 32: ECS/EKS Anywhere vs AWS Outposts
| | ECS / EKS Anywhere | AWS Outposts |
|:---|:---|:---|
| Phần cứng | **Tận dụng máy chủ/VM có sẵn của khách hàng** | **Thuê trọn Rack phần cứng máy chủ của AWS** |
| Chi phí phần cứng AWS | ❌ Không tốn tiền phần cứng AWS | 💰 Chi phí thuê phần cứng AWS cao |
| Dịch vụ chạy được | Chỉ chạy Container (ECS/EKS) | Chạy EC2, EBS, S3 on Outposts, RDS, ECS, EKS |
| Keyword đề bài | "Run containers on existing customer hardware" | "AWS-managed hardware installed in customer data center" |

**💡 Móc nhớ**: _"**Anywhere** = Dùng phần mềm AWS trên **máy của mình**. **Outposts** = Chở cả **tủ server AWS** về nhà mình."_

---

### TRAP 33: S3 Replication (CRR) — Bẫy Dữ Liệu Cũ & Chuỗi Nhân Bản
| Tình Huống | Sự Thật Kỹ Thuật | Cách Xử Lý Đúng |
|:---|:---|:---|
| Bật CRR cho bucket đã có sẵn 10 TB data | **Mặc định CHỈ replicate object MỚI** | Dùng **S3 Batch Replication** để sync dữ liệu cũ |
| Replication chuỗi A $\rightarrow$ B và B $\rightarrow$ C | Dữ liệu từ A sang B **KHÔNG tự động sang C** | Phải cấu hình replication riêng từ A sang C |
| Điều kiện tiên quyết | Bắt buộc bật **S3 Versioning ở CẢ 2 BUCKET** | Thiếu versioning ở đích = lỗi cấu hình |

**💡 Móc nhớ**: _"CRR chỉ nhìn về tương lai (object mới); muốn chép quá khứ phải gọi **Batch Replication**."_

---

### TRAP 34: S3 SSE-KMS Quota Throttle vs S3 Bucket Key
| | Tăng KMS Quota | Bật S3 Bucket Key |
|:---|:---|:---|
| Bản chất | Yêu cầu AWS tăng hạn mức gọi KMS API | Tạo khóa trung gian cấp bucket, giảm 99% call KMS |
| Chi phí | Vẫn tốn tiền gọi KMS API từng object | **Giảm 99% chi phí KMS call** |
| Khuyến nghị của AWS | Tạm thời | **Chuẩn mực tối ưu tốt nhất** |

**💡 Móc nhớ**: _"S3 gọi KMS nhiều bị nghẽn (Throttle HTTP 429) $\rightarrow$ Bật ngay **S3 Bucket Key** (không cần đổi khóa sang SSE-S3)."_

---

### TRAP 35: CloudFront Functions vs Lambda@Edge
| Tiêu Chí | CloudFront Functions | Lambda@Edge |
|:---|:---|:---|
| Thời gian chạy tối đa | **< 1 mili-giây** | 5 giây (Viewer) / 30 giây (Origin) |
| Ngôn ngữ hỗ trợ | **Chỉ JavaScript** | Node.js và Python |
| Truy cập mạng ngoài | ❌ **KHÔNG ĐƯỢC PHÉP** | ✅ Gọi API ngoài, query database thoải mái |
| Truy cập Body request | ❌ Không đọc được body | ✅ Đọc và sửa đổi body thoải mái |
| Vị trí triển khai | Hàng trăm Edge Locations | Vài chục Regional Edge Caches (tạo ở `us-east-1`) |
| Use cases | Rewrite URL, thêm HTTP security header | Resize ảnh động, A/B testing phức tạp, xác thực DB |

**💡 Móc nhớ**: _"**CF Functions** = Siêu nhẹ (<1ms, không mạng, rẻ). **Lambda@Edge** = Nặng đô (có mạng, đọc body, tính toán lâu)."_

---

### TRAP 36: Route 53 Geolocation vs Latency-Based Routing
| Tình Huống Đề Bài | Geolocation Routing | Latency-Based Routing |
|:---|:---|:---|
| Bản chất định tuyến | Dựa trên **vị trí địa lý của USER (Quốc gia/Lục địa)** | Dựa trên **độ trễ mạng thấp nhất tới Region** |
| Tuân thủ pháp lý (GDPR ở Châu Âu) | ✅ **BẮT BUỘC CHỌN (User EU $\rightarrow$ Server EU)** | ❌ Sai (vì mạng đổi có thể route sang US) |
| Tối ưu tốc độ thuần túy | Có thể không phải nhanh nhất | ✅ **BẮT BUỘC CHỌN CHO HIỆU NĂNG** |

**💡 Móc nhớ**: _"Đề bài có chữ **'tuân thủ pháp luật / luật bản quyền / ngôn ngữ'** $\rightarrow$ Luôn chọn **Geolocation**, không bao giờ chọn Latency!"_

---

### TRAP 37: AWS WAF vs AWS Network Firewall
| | AWS WAF | AWS Network Firewall |
|:---|:---|:---|
| Tầng bảo vệ | **Layer 7 (HTTP/HTTPS)** | **Layer 3 đến Layer 7 (Toàn bộ VPC)** |
| Vị trí triển khai | Gắn trên CloudFront, ALB, API Gateway | Đặt trong **Firewall Subnet** của VPC |
| Loại tấn công ngăn chặn | SQL Injection, XSS, HTTP Flood, Bot crawling | Kiểm tra sâu gói tin (DPI), Suricata IPS, lọc tên miền FQDN |
| Gắn vào NLB được không? | ❌ **TUYỆT ĐỐI KHÔNG GẮN ĐƯỢC NLB** | ✅ Bảo vệ toàn bộ lưu lượng qua VPC |

**💡 Móc nhớ**: _"**WAF** = Soát vé Web (chặn SQLi, XSS). **Network Firewall** = Kiểm soát biên phòng toàn thành phố VPC."_

---

### TRAP 38: Step Functions Standard vs Express
| | Standard Workflow | Express Workflow |
|:---|:---|:---|
| Thời gian chạy tối đa | **Lên tới 1 năm** | **Tối đa 5 phút** |
| Độ tin cậy thực thi | **Exactly-once** | At-least-once |
| Tính năng chờ người duyệt | ✅ **Có (`waitForTaskToken`)** | ❌ Không |
| Tính phí theo | Số lần chuyển trạng thái (**State transitions**) | Thời gian chạy và RAM (**GB-seconds**) |
| Thông lượng xử lý | Thấp (< 2,000/s) | **Cực cao (> 100,000/s cho IoT / Streaming)** |

**💡 Móc nhớ**: _"**Standard** = Chạy lâu, cần người duyệt. **Express** = Nhanh như chớp (< 5 phút), thông lượng khủng."_

---

### TRAP 39: Kinesis Video Streams vs Kinesis Data Streams
| | Kinesis Video Streams (KVS) | Kinesis Data Streams (KDS) |
|:---|:---|:---|
| Định dạng dữ liệu | **Luồng Video, Audio, WebRTC** | **Các bản ghi dữ liệu (Records, JSON, Logs, Clickstream)** |
| Nguồn phát | Camera an ninh, drone, smartphone | Máy chủ ứng dụng, IoT telemetry, web logs |
| Tích hợp AI | **Amazon Rekognition Video** | Apache Flink, AWS Lambda |

**💡 Móc nhớ**: _"Đề có camera, drone gửi video về cloud $\rightarrow$ Luôn chọn **Kinesis Video Streams** (không chọn Data Streams)."_

---

### TRAP 40: Cost Allocation Tags — Kích Hoạt Trong Console
| Hành Động | Kết Quả |
|:---|:---|
| Gắn tag `Project = Alpha` lên 100 EC2 instances | Tag đã tồn tại trên tài nguyên nhưng **CHƯA XUẤT HIỆN TRONG HÓA ĐƠN** |
| Vào Billing Console $\rightarrow$ Bấm **Activate Cost Allocation Tag** | Tag chính thức được theo dõi trong Cost Explorer, Budgets và CUR |
| Tính chất thời gian | **KHÔNG CÓ HIỆU LỰC HỒI TỐ (Chỉ áp dụng cho chi phí phát sinh sau khi kích hoạt)** |

**💡 Móc nhớ**: _"Gắn tag thôi chưa đủ, **phải kích hoạt trong Billing Console** thì kế toán mới nhìn thấy tiền!"_

---

## 📌 MASTER CHECKLIST — Trước Khi Nhấn Submit (40 Quy Tắc Vàng)

```
□ "without changing app code" + Linux  → EFS (NFS)
□ "without changing app code" + Windows → FSx for Windows (SMB)
□ "without changing app code" + DynamoDB → DAX (không phải ElastiCache)
□ Overlapping CIDR              → PrivateLink (không phải VPC Peering)
□ File vòng đời < 30 ngày       → S3 Standard (không phải Standard-IA)
□ Active-active multi-region    → DynamoDB Global Tables (không phải Aurora Global)
□ Strict order + exactly-once   → SQS FIFO (không phải Standard)
□ Pilot Light DR                → EC2 = ZERO (không phải scaled-down)
□ Warm Standby DR               → EC2 = Scaled-down fleet running 24/7
□ "detect brute-force/mining"   → GuardDuty (không phải Inspector)
□ "scan CVE vulnerabilities"    → Inspector (không phải GuardDuty)
□ "discover PII in S3"          → Macie (không phải GuardDuty/Inspector)
□ "nobody deletes even root"    → Compliance Mode (không phải Governance)
□ Static Anycast IP hoặc UDP    → Global Accelerator (không phải CloudFront)
□ Zone Apex (example.com)       → Alias Record (không phải CNAME)
□ "auto-rotate DB password"     → Secrets Manager (không phải Parameter Store)
□ "bulk SaaS data to S3"        → AppFlow (không phải EventBridge)
□ "MPI/NCCL HPC inter-node"     → EFA (không phải ENA)
□ Migrate server Lift-and-Shift → MGN (không phải DMS)
□ "CIS benchmark score"         → Security Hub (không phải Config)
□ "BYOL license per socket/core" → Dedicated Hosts (không phải Dedicated Instances)
□ "capacity reservation"        → Zonal RI (không phải Savings Plans)
□ ECS App code access DB        → Task Role (không phải Task Execution Role)
□ ECS Agent pull ECR image      → Task Execution Role
□ S3 replication data có sẵn    → S3 Batch Replication (CRR chỉ replicate data mới)
□ S3 KMS throttling             → Bật S3 Bucket Key (giảm 99% KMS call)
□ Edge compute < 1ms, no network→ CloudFront Functions (không phải Lambda@Edge)
□ Route user theo luật EU/GDPR  → Route 53 Geolocation (không phải Latency)
□ Chặn SQLi / XSS trên web app  → AWS WAF (không gắn được NLB)
□ Kiểm tra sâu gói tin VPC, IPS → AWS Network Firewall (Firewall subnet)
□ Workflow có human approval    → Step Functions Standard (không phải Express)
□ Stream video từ camera an ninh→ Kinesis Video Streams (không phải Data Streams)
□ Gắn tag chi phí nhưng ko thấy → Phải Activate trong Billing Console (không hồi tố)
□ Truy cập S3 từ private subnet → Gateway VPC Endpoint (Miễn phí, thay NAT GW)
□ Scale EC2 theo SQS backlog    → ApproximateNumberOfMessagesVisible / Instances
□ Chạy batch job dài > 15 phút  → AWS Batch hoặc ECS Fargate (Lambda bị giới hạn 15m)
□ API Gateway timeout           → 29 giây (vượt quá phải dùng async SQS)
□ DynamoDB item lớn > 400 KB    → Lưu S3, DynamoDB chỉ lưu pointer/metadata
□ Phục hồi máy chủ EC2 lỗi HW   → CloudWatch Alarm + EC2 Recover (giữ nguyên IP, EBS)
□ Shell EC2 không mở port 22    → SSM Session Manager (không cần Bastion)
```
