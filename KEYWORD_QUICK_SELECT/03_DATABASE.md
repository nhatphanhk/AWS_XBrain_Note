# 03 — DATABASE KEYWORDS: RDS, Aurora, DynamoDB, ElastiCache, Redshift & NoSQL

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ DATABASE

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon RDS** | Cơ sở dữ liệu quan hệ được quản lý (MySQL, PostgreSQL, Oracle, SQL Server, MariaDB, Db2). | Tự động hóa cài đặt, vá lỗi, sao lưu, Multi-AZ failover cho cơ sở dữ liệu giao dịch truyền thống (OLTP). | *"Thuê DBA của AWS: Mình lo code tạo bảng, AWS lo backup, patching và failover."* |
| **Amazon Aurora** | RDBMS thế hệ mới của AWS, tương thích MySQL (nhanh gấp 5 lần) và PostgreSQL (nhanh gấp 3 lần). | Tách rời Compute và Storage. Tầng lưu trữ tự nhân bản **6 bản sao trên 3 AZ**, auto-repair và co giãn tới 128 TB. | *"Đỉnh cao cơ sở dữ liệu AWS: Nhanh như xe đua F1, bền vững 6 bản sao 3 AZ."* |
| **Amazon RDS Proxy** | Bộ gom cụm kết nối (Connection Pooler) managed, serverless đứng trước RDS và Aurora. | Giảm tải CPU/RAM cho DB khi hàng ngàn Lambda cùng kết nối, giảm thời gian failover tới **66%**, quản lý mật khẩu qua Secrets Manager. | *"Bảo vệ cổng gác: Gom khách thành từng đoàn vào gặp giám đốc, không cho chen lấn làm sập cửa."* |
| **Amazon RDS Custom** | Dịch vụ RDS cho Oracle và SQL Server nhưng **cho phép quyền truy cập root vào Hệ điều hành (OS)**. | Chạy ứng dụng legacy cần cài thêm agent, driver tùy biến hoặc cấu hình OS chuyên sâu mà vẫn muốn tính năng tự động của RDS. | *"RDS mở khóa cửa sau: Cho phép chủ nhà tự sửa đường ống nước bên trong căn hộ."* |
| **Amazon DynamoDB** | Cơ sở dữ liệu phi quan hệ NoSQL (Key-Value & Document) serverless, độ trễ ổn định **dưới 10ms ở mọi quy mô**. | Phục vụ ứng dụng web quy mô Internet (hàng triệu request/giây): giỏ hàng e-commerce, user session, gaming profile. | *"Tủ khóa điện tử vô tận: Có khóa (Key) là mở ra xem ngay trong 2 mili-giây."* |
| **DynamoDB Accelerator (DAX)** | Cụm bộ nhớ đệm In-Memory chuyên dụng đứng trước Amazon DynamoDB. | Tăng tốc độ đọc dữ liệu từ vài mili-giây xuống **vài micro-giây**, tương thích 100% API DynamoDB mà không sửa mã nguồn ứng dụng. | *"Bộ tăng áp turbo cho DynamoDB: Đạp ga là bay với tốc độ microsecond."* |
| **Amazon ElastiCache** | Dịch vụ bộ nhớ đệm In-Memory (Redis OSS / Valkey hoặc Memcached) được quản lý toàn diện. | Giảm tải đọc 90% cho RDS/Aurora, tăng tốc thời gian phản hồi ứng dụng xuống dưới 1 mili-giây (hỗ trợ session, pub/sub, leaderboard). | *"Bàn làm việc cạnh tủ hồ sơ: Tài liệu hay dùng để sẵn trên bàn, đỡ phải đi lục tủ."* |
| **Amazon MemoryDB for Redis** | Cơ sở dữ liệu chính (Primary DB) tương thích Redis nhưng có **độ bền dữ liệu Multi-AZ transactional**. | Dùng làm cơ sở dữ liệu chính siêu tốc cho microservices thay vì chỉ làm cache tạm như ElastiCache. | *"Redis biến thành database chính: Vừa nhanh như chớp vừa không sợ mất dữ liệu."* |
| **Amazon DocumentDB** | Cơ sở dữ liệu tài liệu NoSQL được quản lý, tương thích 100% mã nguồn mở **MongoDB**. | Chạy các ứng dụng JSON schema linh hoạt quy mô lớn mà không cần tự quản lý cụm MongoDB (lưu trữ tự nở tới 128 TB). | *"MongoDB chuẩn AWS: Tương thích 100% code Mongo, lưu trữ tự nở tới 128 TB."* |
| **Amazon Neptune** | Cơ sở dữ liệu đồ thị (**Graph Database**) tối ưu hóa các câu truy vấn quan hệ chéo sâu (Gremlin/openCypher). | Giải quyết bài toán mạng xã hội ("bạn của bạn"), phát hiện gian lận thẻ tín dụng, cây phân cấp tổ chức. | *"Bản đồ mạng lưới quan hệ: Tìm đường đi giữa các đầu mối trong chớp mắt."* |
| **Amazon Keyspaces** | Cơ sở dữ liệu Apache Cassandra serverless, tương thích 100% ngôn ngữ truy vấn **CQL**. | Di chuyển cụm Cassandra On-Prem lên mây không cần đổi mã nguồn, tự động co giãn On-Demand. | *"Cassandra không máy chủ: Giữ nguyên code CQL, không lo bảo trì node cụm."* |
| **Amazon Timestream** | Cơ sở dữ liệu chuỗi thời gian (**Time-series**) serverless cho cảm biến IoT và viễn thông. | Lưu và phân tích hàng tỷ sự kiện cảm biến mỗi ngày, tự động chuyển từ In-Memory sang Magnetic storage. | *"Đồng hồ đo cảm biến: Tự động gom sự kiện theo dòng thời gian, chi phí rẻ."* |
| **Amazon QLDB** | Cơ sở dữ liệu sổ cái tập trung bất biến (**Immutable Ledger**), chứng minh bằng mã hóa Merkle Tree SHA-256. | Lưu trữ nhật ký kế toán tài chính, lịch sử giao dịch minh bạch không thể bị sửa hay xóa. *(Lưu ý: Đã end-of-support 07/2025, AWS khuyến nghị Aurora Postgres; vẫn có trong đề cũ)*. | *"Sổ cái khắc trên đá: Mọi dòng nhật ký ghi vào là vĩnh viễn không thể tẩy xóa."* |

---

## 🗄️ AMAZON RDS — QUẢN TRỊ & CÁC TÍNH NĂNG VẬN HÀNH CỐT LÕI

### 1. Kiến Trúc Mạng & Cấu Hình
- **DB Subnet Group**: Tập hợp các subnet nằm ở **ít nhất 2 Availability Zones** trong cùng 1 Region. Bắt buộc đặt trong **Private Subnet** để bảo mật.
- **Parameter Group**: Quản lý các tham số cấu hình của Database Engine (VD: `max_connections`, `innodb_buffer_pool_size`, `rds.force_ssl`).
- **Option Group**: Bật các tính năng bổ sung đặc thù của hãng (VD: Oracle OEM, Microsoft SQL Server Native Backup & Restore to S3).
- **Storage Auto Scaling**: Tự động tăng dung lượng đĩa khi dung lượng trống $\le 10\%$. Cấu hình `Max Storage Threshold` để khống chế chi phí tối đa.
- **Giám Sát & Tinh Chỉnh**:
  - `CloudWatch Logs`: Xuất các file error log, slow query log, audit log.
  - `Enhanced Monitoring`: Thu thập thông số hiệu năng chuyên sâu cấp Hệ điều hành (OS) của máy ảo (CPU, RAM chi tiết theo từng tiến trình/process).
  - `Performance Insights`: Bảng điều khiển trực quan giúp phát hiện các câu query chậm, xem Database Load và các sự kiện tắc nghẽn (Wait Events).

### 2. RDS High Availability (HA) vs Read Scaling
| Tiêu Chí So Sánh | RDS Multi-AZ DB Instance | RDS Multi-AZ DB Cluster | RDS Read Replicas |
|:---|:---|:---|:---|
| **Mục đích chính** | **Tính sẵn sàng cao (HA & DR)** | **Vừa HA vừa chia tải đọc nhẹ** | **Chia tải ĐỌC (Scale Read Traffic)** |
| **Cơ chế sao chép** | **Đồng bộ (Synchronous)** — Không mất dữ liệu | **Bán đồng bộ (Semisynchronous)** | **Bất đồng bộ (Asynchronous)** — Eventual consistency |
| **Số lượng máy chủ** | 1 Primary + 1 Standby (ở 2 AZ khác nhau) | 1 Writer + **2 Readable Standbys** (3 AZ) | Tối đa **15 Replicas** (MySQL, Postgres, MariaDB) |
| **Standby có đọc được?** | ❌ **KHÔNG ĐỌC ĐƯỢC** (Passive standby) | ✅ **ĐỌC ĐƯỢC CẢ 2 STANDBY** | ✅ **CHUYÊN PHỤC VỤ ĐỌC** |
| **Thời gian Failover** | **60 – 120 giây** (DNS chuyển hướng tự động) | **Dưới 35 giây** (Cực nhanh) | Thủ công (phải Promote thành Standalone DB) |
| **Phạm vi địa lý** | Trong 1 Region (Cross-AZ) | Trong 1 Region (Cross-AZ qua 3 AZ) | **Cùng Region HOẶC Cross-Region** |
| **Chi phí truyền dữ liệu** | Miễn phí đồng bộ trong Region | Miễn phí đồng bộ trong Region | Cùng Region: Miễn phí / Cross-Region: Có phí data transfer |
| **Ảnh hưởng của Backup** | Chụp Snapshot từ Standby $\rightarrow$ **Không làm chậm Primary** | Chụp Snapshot từ Standby $\rightarrow$ **Không làm chậm Primary** | Có thể chụp Snapshot từ Replica |

> 💡 **Quy tắc chuyển đổi**: Chuyển từ Single-AZ sang Multi-AZ diễn ra **hoàn toàn Zero-Downtime** (AWS tự chụp snapshot ngầm, dựng standby rồi sync).

### 3. Sao Lưu (Backup), Snapshot & Khôi Phục (Restore)
- **Automated Backups**: Tự động sao lưu toàn bộ DB hằng ngày và lưu transaction logs liên tục.
  - Thời gian lưu trữ: Từ **1 đến 35 ngày** (đặt bằng 0 là tắt backup tự động).
  - Cho phép phục hồi về bất kỳ thời điểm nào trong quá khứ (**PITR - Point-In-Time Restore**) tới **5 phút gần nhất**.
- **Manual Snapshots**: Do người dùng chủ động chụp thủ công. **Không bao giờ bị AWS tự động xóa** cho đến khi người dùng xóa tay.
- **Restore Cơ Sở Dữ Liệu**: Bất kỳ thao tác restore nào từ Automated Backup hoặc Snapshot **LUÔN LUÔN TẠO RA MỘT DB MỚI với Endpoint DNS MỚI** (không ghi đè lên DB cũ).
- **Mã Hóa Khi Restore**:
  - Snapshot đã mã hóa KMS: Muốn share sang tài khoản AWS khác $\rightarrow$ Bắt buộc phải **share cả KMS Customer Managed Key (CMK)**.
  - DB gốc chưa mã hóa: Muốn mã hóa $\rightarrow$ Chụp Snapshot $\rightarrow$ Copy Snapshot kèm tùy chọn Encrypt KMS $\rightarrow$ Restore ra DB mới đã mã hóa.
- **Tạm Dừng Máy Chủ (Stop DB)**: Chỉ được tắt tối đa **7 ngày**, sau 7 ngày AWS sẽ tự động bật máy lại để tránh bị trôi phiên bản hệ thống.
- **Khôi Phục Trực Tiếp Từ S3**: Hỗ trợ nạp thẳng file sao lưu MySQL từ S3 qua phần mềm **Percona XtraBackup**.

### 4. Cơ Chế Bảo Mật Toàn Diện Của RDS
- **IAM Database Authentication**: Người dùng/ứng dụng (EC2, Lambda) đăng nhập vào MySQL/PostgreSQL bằng token IAM có hạn **15 phút**, không cần lưu mật khẩu tĩnh trong ứng dụng.
- **Secrets Manager**: Tự động xoay vòng (Automatic Rotation) mật khẩu DB theo chu kỳ bằng Lambda mà không gây gián đoạn kết nối.
- **Mã Hóa Lưu Trữ (At-Rest)**: Bắt buộc bật **ngay từ lúc tạo DB**. Nếu DB chính mã hóa thì các Read Replicas và Snapshots cũng tự động được mã hóa theo.
- **Mã Hóa Đường Truyền (In-Transit)**: Ép buộc kết nối SSL/TLS qua tham số `rds.force_ssl = 1`.
- **Database Activity Streams**: Thu thập và ghi lại toàn bộ hoạt động truy vấn thời gian thực vào Amazon Kinesis Data Streams phục vụ kiểm toán bảo mật (hỗ trợ Aurora, Oracle, SQL Server).

---

## 🌟 AMAZON AURORA — ĐỈNH CAO CƠ SỞ DỮ LIỆU QUAN HỆ AWS

```
Aurora Architecture = Compute Nodes (EC2-like) + Distributed Storage Volume (10GB - 128TB)
Lưu trữ: 6 bản sao trải rộng trên 3 Availability Zones (2 bản / AZ)
Khả năng chịu lỗi: 
  - Ghi (Write): Chịu mất 2 bản sao (cần 4/6 bản đồng thuận)
  - Đọc (Read): Chịu mất 3 bản sao (cần 3/6 bản đồng thuận)
  - Self-healing: Tự động sửa chữa các khối đĩa hỏng nền ở tầng lưu trữ
```

### 1. Các Tính Năng Độc Quyền Của Aurora
- **Hiệu Năng**: Nhanh gấp **5 lần MySQL** và **3 lần PostgreSQL** nhờ tối ưu tầng I/O.
- **Replication Siêu Tốc**: Tối đa **15 Aurora Replicas**, độ trễ sao chép thường **dưới 100 mili-giây** (do dùng chung tầng storage), failover tự động trong **dưới 30 giây**.
- **Cụm Endpoints Của Aurora**:
  - `Writer Endpoint`: Luôn trỏ tới Primary DB instance hiện tại (nhận Read/Write).
  - `Reader Endpoint`: Tự động cân bằng tải (Load Balancing) cho tất cả các Aurora Replicas (chỉ nhận Read).
  - `Custom Endpoint`: Gom nhóm các Replica có kích thước cấu hình riêng biệt (VD: tạo custom endpoint gom 2 máy Replica RAM khủng chuyên phục vụ báo cáo BI/Analytics).
- **Aurora Backtrack**: Cho phép "tua ngược" cơ sở dữ liệu về thời điểm trước đó vài phút/giờ chỉ trong vài giây mà **hoàn toàn không cần restore snapshot** (hỗ trợ MySQL).
- **Aurora Cloning**: Cơ chế **Copy-on-write** tạo bản sao DB để thử nghiệm cực nhanh, không tốn thêm chi phí lưu trữ cho đến khi dữ liệu mới được ghi vào.
- **Aurora ML**: Cho phép chạy trực tiếp các câu query SQL gọi mô hình Machine Learning từ Amazon SageMaker hoặc Amazon Comprehend.

### 2. Aurora Serverless v2
- Tự động co giãn năng lực tính toán theo đơn vị **ACU (Aurora Capacity Unit, 1 ACU $\approx$ 2 GB RAM)** chỉ trong một phần giây theo tải thực tế.
- Hỗ trợ đầy đủ **Multi-AZ, Read Replicas, và Aurora Global Database**.
- Có thể chạy kết hợp giữa các instance cố định (Provisioned) và Serverless v2 trong cùng một Aurora Cluster.
- **Data API**: Cung cấp giao thức truy vấn SQL thông qua HTTPS endpoint an toàn, không cần duy trì kết nối persistent $\rightarrow$ Hoàn hảo cho ứng dụng phi máy chủ AWS Lambda.

### 3. Aurora Global Database (Đa Vùng Toàn Cầu)
- Bao gồm **1 Primary Region (chấp nhận Read & Write)** và tối đa **10 Secondary Regions (chỉ phục vụ Read)**.
- Tốc độ sao chép ở tầng lưu trữ chuyên biệt với độ trễ **dưới 1 giây**.
- Chỉ số phục hồi thảm họa: **RPO $\approx$ 1 giây, RTO < 1 phút**.
- Mỗi Secondary Region có thể mở rộng tối đa **16 Aurora Replicas**.
- **Write Forwarding**: Cho phép ứng dụng gửi lệnh ghi vào Secondary Region, hệ thống sẽ tự động chuyển tiếp (forward) lệnh ghi về Primary Region an toàn.

---

## ⚡ AMAZON DYNAMODB — CƠ SỞ DỮ LIỆU NOSQL SERVERLESS

### 1. Cấu Trúc Bảng & Khóa Chính (Primary Keys)
- Dữ liệu dạng Bảng (Table) $\rightarrow$ Bản ghi (Item) $\rightarrow$ Thuộc tính (Attribute).
- **Kích thước Item tối đa**: **400 KB**. Nếu dữ liệu lớn hơn 400 KB (ảnh, PDF) $\rightarrow$ Lưu trữ file trên **Amazon S3** và chỉ lưu S3 Object URL/metadata vào DynamoDB.
- **Primary Key Types**:
  1. `Partition Key (PK)`: Giá trị Hash phân bổ bản ghi vào các phân vùng vật lý.
  2. `Composite Key`: Gồm **Partition Key (Hash) + Sort Key (Range)** (VD: User_ID + Order_Timestamp).

### 2. Phân Biệt Secondary Indexes: LSI vs GSI
| Tiêu Chí | Local Secondary Index (LSI) | Global Secondary Index (GSI) |
|:---|:---|:---|
| **Partition Key** | **BẮT BUỘC TRÙNG VỚI BẢNG GỐC** | **CÓ THỂ HOÀN TOÀN KHÁC BẢNG GỐC** |
| **Sort Key** | Khác bảng gốc | Khác bảng gốc |
| **Thời điểm tạo** | **CHỈ TẠO ĐƯỢC LÚC TẠO BẢNG** (Không thể thêm/xóa sau) | **TẠO HOẶC XÓA BẤT KỲ LÚC NÀO** |
| **Số lượng tối đa** | Tối đa 5 LSI / bảng | Tối đa 20 GSI / bảng |
| **Tiêu thụ Capacity** | Dùng chung RCU/WCU của bảng gốc | **Có RCU/WCU hoàn toàn độc lập** với bảng gốc |
| **Tính nhất quán** | Hỗ trợ Strongly Consistent & Eventually Consistent | Chỉ hỗ trợ Eventually Consistent |

### 3. Các Chế Độ Tính Phí: Provisioned vs On-Demand
- **Provisioned Mode**:
  - Khai báo trước số lượng RCU và WCU, kết hợp Auto Scaling để tăng/giảm theo tải. Phù hợp cho tải ổn định, dự đoán trước được để tối ưu chi phí (có thể mua Reserved Capacity).
  - *Công thức tính Capacity*:
    - **1 RCU** = 1 Strongly Consistent Read/giây (hoặc 2 Eventually Consistent Reads/giây) cho bản ghi $\le$ 4 KB.
    - **1 WCU** = 1 Write/giây cho bản ghi $\le$ 1 KB.
  - Vượt quá hạn ngạch $\rightarrow$ Lỗi `ProvisionedThroughputExceededException` $\rightarrow$ Khắc phục bằng Exponential Backoff retry, thêm cache DAX, hoặc đổi Partition Key phân tán đều hơn để tránh **Hot Partition**.
- **On-Demand Mode**:
  - Trả tiền theo từng request thực tế. Tự động scale tức thì mà không cần ước lượng capacity. Phù hợp tải biến động khó lường, ứng dụng mới khởi nghiệp.
  - Có thể chuyển đổi giữa Provisioned và On-Demand **1 lần mỗi 24 giờ**.
- **DynamoDB Standard-IA Table Class**: Giảm tới 60% chi phí lưu trữ cho các bảng ít khi đọc/ghi nhưng cần giữ dữ liệu dài hạn.

### 4. DynamoDB Streams & Global Tables
- **DynamoDB Streams**: Ghi lại dòng thời gian các sự kiện thay đổi (Insert, Update, Delete) của các item theo thứ tự trong vòng **24 giờ**. Thường kích hoạt **AWS Lambda** (VD: gửi email chào mừng, đồng bộ sang OpenSearch).
  - View Types: `KEYS_ONLY`, `NEW_IMAGE`, `OLD_IMAGE`, `NEW_AND_OLD_IMAGES`.
- **DynamoDB Global Tables**: Cung cấp kiến trúc **Active-Active Multi-Region**. Mọi Region đều có thể nhận cả ĐỌC và GHI với độ trễ sao chép dưới 1 giây. Xử lý xung đột theo nguyên tắc **Last-Writer-Wins (dựa trên timestamp)**. Bắt buộc phải bật DynamoDB Streams trước khi cấu hình.
- **TTL (Time to Live)**: Tự động xóa các bản ghi đã hết hạn dựa trên thuộc tính timestamp mà **hoàn toàn MIỄN PHÍ, không tốn WCU**.
- **Export to S3**: Xuất dữ liệu bảng sang S3 ở định dạng JSON hoặc Parquet để truy vấn phân tích bằng Amazon Athena mà **không tiêu tốn bất kỳ RCU nào của bảng**.

---

## ⚡ ELASTICACHE: REDIS (VALKEY) vs MEMCACHED

| Tiêu Chí | Redis OSS / Valkey | Memcached |
|:---|:---|:---|
| **Cấu trúc dữ liệu** | Đa dạng: Strings, Hashes, Lists, Sets, **Sorted Sets (Leaderboards)**, Bitmaps | Chỉ có Key-Value chuỗi đơn giản |
| **Tính bền vững (Persistence)** | ✅ **CÓ** (Ghi log AOF và chụp Snapshot RDB) | ❌ **KHÔNG** (Mất điện là mất sạch dữ liệu) |
| **Tính sẵn sàng cao (HA)** | ✅ **Multi-AZ với tính năng tự động Failover** | ❌ Không có HA, không có replication |
| **Đọc phân tán (Read Replicas)** | ✅ Hỗ trợ tối đa nhiều bản sao chỉ đọc | ❌ Không hỗ trợ |
| **Kiến trúc xử lý** | Single-threaded core (nhanh, tối ưu bộ nhớ) | **Multi-threaded** (tận dụng tối đa nhiều CPU cores) |
| **Phân mảnh (Sharding)** | Hỗ trợ Redis Cluster | Hỗ trợ chia node ngang |
| **Bảo mật** | Hỗ trợ Redis AUTH token, IAM Authentication, mã hóa TLS | Chỉ hỗ trợ SASL |

> 💡 **Chiến Lược Caching**:
> - **Lazy Loading (Cache-Aside)**: Ứng dụng hỏi cache trước $\rightarrow$ Nếu Cache Miss $\rightarrow$ Đọc từ DB $\rightarrow$ Ghi vào Cache. Ưu điểm: Chỉ cache dữ liệu được hỏi; Nhược điểm: Dữ liệu có thể bị cũ (cần đặt TTL).
> - **Write-Through**: Khi ghi dữ liệu vào DB $\rightarrow$ Ghi đồng thời vào Cache. Ưu điểm: Dữ liệu cache luôn tươi mới; Nhược điểm: Tốn tài nguyên ghi 2 lần.

---

## 🔧 CƠ SỞ DỮ LIỆU CHUYÊN DỤNG (SPECIALIZED DATABASES)

| Dịch Vụ | Loại Cơ Sở Dữ Liệu | Ngôn Ngữ Truy Vấn / Chuẩn | 💡 Tín Hiệu Đề Thi Phản Xạ |
|:---|:---|:---|:---|
| **Amazon DocumentDB** | Document (JSON) | Tương thích **MongoDB** | "MongoDB migration", "JSON documents", "content management", "scale storage up to 128 TB". |
| **Amazon Neptune** | Graph Database | Gremlin, openCypher, SPARQL | "social network (friends of friends)", "fraud detection rings", "knowledge graph", "relationship queries". |
| **Amazon Keyspaces** | Wide-Column | Apache Cassandra (**CQL**) | "Cassandra migration without managing clusters", "CQL compatible", "serverless wide-column store". |
| **Amazon Timestream** | Time-series | SQL mở rộng | "IoT telemetry", "DevOps monitoring", "stock prices", "time-series analysis", "in-memory + magnetic tiers". |
| **Amazon MemoryDB** | In-memory Primary DB | Redis compatible | "microsecond reads, single-digit ms writes", "Redis as primary database", "Multi-AZ transactional log". |
| **Amazon QLDB** | Cryptographic Ledger | PartiQL (SQL-like) | "centralized immutable ledger", "SHA-256 cryptographic verification", "financial audit history". *(End of support 07/2025)*. |

---

## 🚀 BẢNG CHỌN NHANH DATABASE

| Tín Hiệu Đề Thi (Trigger Keywords) | ✅ Đáp Án Chuẩn |
|:---|:---|
| "relational SQL", "OLTP transactions", "MySQL/Postgres/Oracle/SQL Server" | **Amazon RDS** |
| "highest performance MySQL/Postgres", "6 copies across 3 AZs", "self-healing storage" | **Amazon Aurora** |
| "unpredictable spiky relational workload", "scale capacity to zero" | **Aurora Serverless v2** |
| "cross-region DR for relational DB", "RPO ~1s, RTO < 1 min", "write forwarding" | **Aurora Global Database** |
| "rewind MySQL DB without restore", "fast in-place recovery" | **Aurora Backtrack** |
| "instant zero-cost DB copy for testing" | **Aurora Clone (Copy-on-write)** |
| "Lambda connects to RDS", "too many connections", "connection pooling" | **Amazon RDS Proxy** |
| "Oracle/SQL Server requires OS root access / sysadmin" | **Amazon RDS Custom** |
| "NoSQL", "single-digit ms at any scale", "key-value", "user shopping cart/session" | **Amazon DynamoDB** |
| "microsecond read latency for DynamoDB", "no code change cache" | **DynamoDB Accelerator (DAX)** |
| "multi-region active-active read and write", "last-writer-wins" | **DynamoDB Global Tables** |
| "trigger Lambda on DynamoDB item update/delete", "CDC event stream" | **DynamoDB Streams** |
| "automatically delete expired items without cost" | **DynamoDB TTL** |
| "in-memory cache", "sub-ms latency", "session store", "leaderboards" | **Amazon ElastiCache (Redis)** |
| "multi-threaded simple in-memory cache", "horizontal scale" | **Amazon ElastiCache (Memcached)** |
| "Redis speed but needs durable primary database" | **Amazon MemoryDB for Redis** |
| "MongoDB compatible document store", "JSON catalog" | **Amazon DocumentDB** |
| "social graph", "fraud ring detection", "Gremlin/openCypher" | **Amazon Neptune** |
| "Apache Cassandra migration without managing servers", "CQL" | **Amazon Keyspaces** |
| "IoT sensors", "telemetry time-series", "metrics storage" | **Amazon Timestream** |
| "rotate DB passwords automatically without downtime" | **AWS Secrets Manager** |
| "EC2/Lambda login to RDS without static passwords" | **IAM Database Authentication** |
