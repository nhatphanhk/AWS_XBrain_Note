# 03 — DATABASE KEYWORDS: RDS, Aurora, DynamoDB, ElastiCache

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ DATABASE

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon RDS** | Cơ sở dữ liệu quan hệ được quản lý (MySQL, PostgreSQL, Oracle, SQL Server, MariaDB). | Tự động hóa cài đặt, vá lỗi, sao lưu, Multi-AZ failover cho cơ sở dữ liệu giao dịch truyền thống (OLTP). | *"Thuê DBA của AWS: Mình lo code tạo bảng, AWS lo backup, patching và failover."* |
| **Amazon Aurora** | RDBMS thế hệ mới độc quyền của AWS, tương thích 100% MySQL (nhanh gấp 5 lần) và PostgreSQL (nhanh gấp 3 lần). | Tách rời Compute và Storage. Tầng lưu trữ tự nhân bản **6 bản sao trên 3 AZ**, auto-repair và co giãn tới 128 TB. | *"Đỉnh cao cơ sở dữ liệu AWS: Nhanh như xe đua F1, bền vững 6 bản sao 3 AZ."* |
| **Amazon DynamoDB** | Cơ sở dữ liệu phi quan hệ NoSQL (Key-Value & Document) serverless, độ trễ ổn định **dưới 10ms ở mọi quy mô**. | Phục vụ ứng dụng web quy mô Internet (hàng triệu request/giây): giỏ hàng e-commerce, user session, gaming profile. | *"Tủ khóa điện tử vô tận: Có khóa (Key) là mở ra xem ngay trong 2 mili-giây."* |
| **Amazon ElastiCache** | Dịch vụ bộ nhớ đệm In-Memory (Redis/Valkey hoặc Memcached) được quản lý toàn diện. | Giảm tải đọc 90% cho RDS/Aurora, tăng tốc thời gian phản hồi ứng dụng xuống dưới 1 mili-giây. | *"Bàn làm việc cạnh tủ hồ sơ: Tài liệu hay dùng để sẵn trên bàn, đỡ phải đi lục tủ."* |
| **Amazon DocumentDB** | Cơ sở dữ liệu tài liệu NoSQL được quản lý, tương thích 100% mã nguồn mở **MongoDB**. | Chạy các ứng dụng JSON schema linh hoạt quy mô lớn mà không cần tự quản lý cụm MongoDB. | *"MongoDB chuẩn AWS: Tương thích 100% code Mongo, lưu trữ tự nở tới 128 TB."* |
| **Amazon Neptune** | Cơ sở dữ liệu đồ thị (**Graph Database**) tối ưu hóa các câu truy vấn quan hệ chéo sâu (Gremlin/openCypher). | Giải quyết bài toán mạng xã hội ("bạn của bạn"), phát hiện gian lận thẻ tín dụng, cây phân cấp tổ chức. | *"Bản đồ mạng lưới quan hệ: Tìm đường đi giữa các đầu mối trong chớp mắt."* |
| **Amazon QLDB** | Cơ sở dữ liệu sổ cái tập trung bất biến (**Immutable Ledger**), chứng minh bằng mã hóa Merkle Tree SHA-256. | Lưu trữ nhật ký kế toán tài chính, lịch sử chuỗi cung ứng minh bạch không thể bị sửa hay xóa. | *"Sổ cái khắc trên đá: Mọi dòng nhật ký ghi vào là vĩnh viễn không thể tẩy xóa."* |
| **Amazon Keyspaces** | Cơ sở dữ liệu Apache Cassandra serverless, tương thích 100% ngôn ngữ truy vấn **CQL**. | Di chuyển cụm Cassandra On-Prem lên mây không cần đổi mã nguồn, tự động co giãn On-Demand. | *"Cassandra không máy chủ: Giữ nguyên code CQL, không lo bảo trì node cụm."* |
| **Amazon Timestream** | Cơ sở dữ liệu chuỗi thời gian (**Time-series**) serverless cho cảm biến IoT và viễn thông. | Lưu và phân tích hàng tỷ sự kiện cảm biến mỗi ngày, tự động chuyển từ In-Memory sang Magnetic storage. | *"Đồng hồ đo cảm biến: Tự động gom sự kiện theo dòng thời gian, chi phí rẻ."* |
| **Amazon MemoryDB** | Cơ sở dữ liệu chính (Primary DB) tương thích Redis nhưng có **độ bền dữ liệu Multi-AZ transactional**. | Dùng làm cơ sở dữ liệu chính siêu tốc cho microservices thay vì chỉ làm cache tạm như ElastiCache. | *"Redis biến thành database chính: Vừa nhanh như chớp vừa không sợ mất dữ liệu."* |

---

## 🗄️ RDS — Chọn Đúng Tính Năng

| Keyword | Answer | 💡 Vì Sao | Tránh |
|:---|:---|:---|:---|
| "HA, automatic failover, standby NOT readable" | **RDS Multi-AZ DB Instance** | 1 standby thụ động (passive). Failover ~60-120s. Chỉ dùng cho HA, không scale đọc. | ~~Read Replicas~~ (async, không HA) |
| "HA, standby readable, faster failover ~35s" | **RDS Multi-AZ DB Cluster** | 2 readable standbys ở 2 AZ khác. Semisync replication. Failover ~35s. Vừa HA vừa scale đọc nhẹ. | ~~Multi-AZ Instance~~ (standby không đọc được) |
| "scale read traffic, async copy" | **RDS Read Replicas** (up to 15) | Async replication. Có thể Cross-Region. Scale đọc bằng cách phân phối query sang replicas. Promote lên Primary khi cần. | ~~Multi-AZ~~ |
| "storage grows automatically, no downtime" | **RDS Storage Auto Scaling** | Tự mở rộng khi free space ≤ 10%. No downtime, không cần reboot. Set `MaxAllocatedStorage` để giới hạn. | ~~manual resize~~ (downtime) |
| "rotate DB password, no app restart" | **Secrets Manager + Lambda Rotation** | 2-label strategy: AWSCURRENT + AWSPENDING. Update DB password → chuyển nhãn PENDING thành CURRENT → zero downtime. | ~~SSM Parameter Store~~ (không tự rotate) |
| "login to RDS without static password, SSL" | **IAM Database Authentication** | STS sinh token 15 phút. Không có mật khẩu tĩnh trong code. Kết nối bắt buộc SSL. Chỉ hỗ trợ MySQL + PostgreSQL. | ~~Secrets Manager~~ (nếu câu hỏi nhấn "no password at all") |
| "Lambda → RDS, too many connections" | **RDS Proxy** | Lambda scale lên 1000 concurrent instance → 1000 DB connections = DB quá tải. RDS Proxy pool connections, multiplexes → DB chỉ thấy ít connections hơn. | ~~Direct connect~~ |
| "automated backup, point-in-time restore" | **RDS Automated Backups** | Backup mỗi ngày + transaction logs → restore về bất kỳ giây nào trong retention period (1-35 ngày). | ~~Manual Snapshots~~ (chỉ restore về điểm chụp) |

---

## 🌟 AURORA — Điểm Khác Biệt Quan Trọng

| Keyword | Answer | 💡 Vì Sao |
|:---|:---|:---|
| "managed MySQL/PG, 5x faster, shared storage" | **Amazon Aurora** | Aurora storage = 6 bản sao × 3 AZ. Chịu mất 2 bản sao mà không ảnh hưởng write, mất 3 bản sao mà không ảnh hưởng read. |
| "auto scale on demand, dev/test, irregular load" | **Aurora Serverless v2** | Scale theo 0.5 ACU increments, có thể scale về gần 0 khi không có traffic. Tốt cho dev/test, variable workload. |
| "multi-region active-PASSIVE, < 1s replication" | **Aurora Global Database** | Storage-level replication (không qua application). 1 Primary Writer region. Các region khác = Read-only. RPO < 1s, RTO < 1 phút. |
| "fast cross-region DR, promote secondary" | **Aurora Global Database** | Promote secondary region = < 1 phút. Khi promote xong, secondary thành Primary mới. |
| "clone DB for testing without affecting prod" | **Aurora Clone** | Copy-on-write: clone ngay lập tức, không tốn storage cho data chưa thay đổi. Rẻ và nhanh hơn snapshot + restore. |
| "rewind DB to 72h ago, in-place" | **Aurora Backtrack** | Backtrack = rewind in-place (không tạo cluster mới). Không cần restore từ backup. Nhanh hơn nhiều. |
| "read scaling, up to 15 replicas, < 100ms lag" | **Aurora Read Replicas** | Shared storage tier → replication lag < 100ms (so với RDS async replication lag có thể vài giây). |

> ⚠️ **Aurora Global vs DynamoDB Global Tables** (Bẫy Đề Thi Nhất)**:  
> **Aurora Global** = **Active-PASSIVE** (1 writer)  
> **DynamoDB Global Tables** = **Active-ACTIVE** (tất cả regions write được)  
> **Móc nhớ**: _"Aurora = một ngôi sao chính (1 writer). DynamoDB = chòm sao toàn cầu (mọi region write)."_

---

## ⚡ DYNAMODB — Chọn Nhanh Với Lý Do

| Keyword | Answer | 💡 Vì Sao | Tránh |
|:---|:---|:---|:---|
| "microsecond reads, NO code change" | **DAX** (DynamoDB Accelerator) | DAX = cụm cache đứng trước DynamoDB. App chỉ đổi connection string sang DAX endpoint, không sửa business logic. | ~~ElastiCache~~ (phải viết thêm cache-check logic) |
| "multi-region active-active, local read+write" | **DynamoDB Global Tables** | Tất cả region đều nhận WRITE. Xung đột: last-writer-wins (timestamp). Yêu cầu Streams ON. | ~~Aurora Global~~ (1 writer) |
| "recover to specific second" | **DynamoDB PITR** | PITR = continuous backup, restore về bất kỳ giây nào trong 35 ngày. Khôi phục ra **bảng mới** (không ghi đè bảng hiện tại). | ~~On-Demand Backup~~ (chỉ restore về điểm chụp) |
| "event-driven on item change (CDC)" | **DynamoDB Streams** | Mỗi thay đổi (insert/update/delete) → event vào Stream → Lambda trigger. Tốt cho CDC, real-time sync. | ~~S3 Events~~ |
| "query on non-primary key, new access pattern" | **GSI** (Global Secondary Index) | GSI = tạo index với Partition Key khác, có thể tạo sau khi bảng đã có data. | ~~LSI~~ (phải tạo khi tạo bảng, cùng Partition Key) |
| "query on sort key variation same partition" | **LSI** (Local Secondary Index) | LSI = thêm Sort Key khác trong cùng Partition Key. Phải tạo lúc tạo bảng, không thêm sau được. | ~~GSI~~ |
| "serverless, variable traffic, don't optimize cost" | **DynamoDB On-Demand** | On-Demand = pay per request, không cần plan capacity. Mắt hơn Provisioned nhưng không bao giờ throttle. | ~~Provisioned~~ (cần estimate WCU/RCU) |
| "predictable traffic, cheapest" | **DynamoDB Provisioned + Auto Scaling** | Set min/max WCU/RCU + Auto Scaling → AWS tự điều chỉnh. Rẻ hơn On-Demand với predictable load. | ~~On-Demand~~ |
| "Cassandra migration, CQL compatible, serverless" | **Amazon Keyspaces** | 100% CQL API compatible. App Cassandra không sửa code, chỉ đổi connection string. Không quản lý cluster. | ~~DynamoDB~~ (API khác hoàn toàn) |

### DynamoDB Quick Math
- **1 RCU** = 1 Strongly Consistent Read/s **hoặc** 2 Eventual Consistent Reads/s cho item ≤ 4 KB  
- **1 WCU** = 1 Write/s cho item ≤ 1 KB  
- **DAX** = microsecond (từ in-memory cache) | **DynamoDB** = single-digit ms

---

## 🚀 ELASTICACHE — REDIS vs MEMCACHED

| Feature | Redis (Valkey) | Memcached | 💡 Quyết Định |
|:---|:---|:---|:---|
| **Persistence** | ✅ AOF + RDB snapshots | ❌ | Redis nếu cache data quan trọng |
| **Pub/Sub messaging** | ✅ | ❌ | Redis nếu cần messaging |
| **Sorted Sets, Lists, Hashes** | ✅ (phong phú) | ❌ (key-value only) | Redis cho leaderboard, session store phức tạp |
| **Multi-thread** | ❌ (single-threaded) | ✅ | Memcached nếu cần multi-thread scale |
| **Replication & Read Replicas** | ✅ | ❌ | Redis nếu cần HA + Multi-AZ |
| **Cluster Mode** | ✅ (sharding) | ✅ | Cả hai đều scale horizontally |

**💡 Móc nhớ**:  
_"**R**edis = **R**ich (phong phú tính năng: persistent, pub/sub, sorted sets). **M**emcached = **M**inimum (chỉ cache đơn giản, multi-thread)."_

| Keyword Trigger | Chọn |
|:---|:---|
| "session store", "leaderboard", "pub/sub", "real-time", "complex data" | **Redis** |
| "simple caching", "multi-threaded", "horizontal scale only" | **Memcached** |

### Caching Strategies
| Strategy | Cách Hoạt Động | Dùng Khi | Nhược Điểm |
|:---|:---|:---|:---|
| **Lazy Loading** | Cache miss → đọc DB → ghi cache | Read-heavy, tolerate stale | Data có thể stale (TTL để fix) |
| **Write-Through** | Mỗi lần write DB → ghi cache luôn | Cần data luôn fresh | Write tốn gấp đôi; waste cache (rarely read data) |
| **TTL** | Cache expire sau N giây | Kết hợp cả 2 trên | Balance giữa freshness và performance |

---

## 🔧 SPECIALIZED DATABASES — Chọn Đúng Loại DB

| Keyword Trigger | Database | 💡 Vì Sao |
|:---|:---|:---|
| "MongoDB compatible", "flexible JSON", "document store" | **Amazon DocumentDB** | MongoDB wire protocol → app MongoDB không sửa code. Auto-scale storage tới 128 TB, 6 replicas × 3 AZs. |
| "social network", "fraud detection", "graph traversal", "Gremlin" | **Amazon Neptune** | Graph DB tối ưu cho "ai quen ai", "path traversal qua nhiều hop". DynamoDB lưu được graph nhưng deep traversal cực chậm. |
| "immutable ledger", "accounting audit trail", "SHA-256 Merkle" | **Amazon QLDB** | Centralized immutable append-only ledger. Mỗi transaction có hash → chứng minh không bị sửa. Khác Blockchain (phi tập trung). |
| "Apache Cassandra", "CQL", "no cluster management" | **Amazon Keyspaces** | Serverless Cassandra. 100% CQL compatible. On-Demand + Provisioned + Auto Scaling. Multi-AZ. |
| "IoT sensor", "telemetry", "time-series", "billions events/sec" | **Amazon Timestream** | Time-series DB chuyên dụng: auto-tier (In-Memory → Magnetic), tối ưu time-range queries, không cần partition strategy. |
| "Redis as primary DB", "durable Redis", "microservices" | **Amazon MemoryDB for Redis** | Redis-compatible NHƯNG durable (Multi-AZ, transactional log). Khác ElastiCache = chỉ cache (không durable primary DB). |
