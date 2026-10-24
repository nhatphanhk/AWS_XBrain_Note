# Ghi Chú Bài Học: Chương 09 - Cơ Sở Dữ Liệu Quan Hệ RDS, Aurora & Bộ Nhớ Đệm ElastiCache

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 09 - AWS Fundamentals: RDS + Aurora (Bài 87 đến Bài 100)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon RDS, Aurora & Databases](file:///n:/AWS_XBrain_Note/AWS_Services/RDS_Aurora_Databases.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này cung cấp kiến thức nền tảng và nâng cao về các cơ sở dữ liệu quan hệ được quản lý trên AWS: **Amazon RDS** (các engine hỗ trợ, Read Replicas vs Multi-AZ), phiên bản truy cập OS sâu **RDS Custom**, cơ sở dữ liệu cloud-native **Amazon Aurora** (cơ chế lưu trữ 6 bản sao trên 3 AZ, Aurora Serverless, Global Database), cơ chế sao lưu (**Point-in-Time Recovery - PITR**) và giám sát, bảo mật kết nối và xác thực qua IAM, bộ tập trung kết nối **Amazon RDS Proxy**, và dịch vụ bộ nhớ đệm trong bộ nhớ **Amazon ElastiCache** (Redis vs Memcached).

### Mục tiêu học tập
1. Phân biệt được sự khác biệt giữa **Read Replicas** (sao chép bất đồng bộ, mở rộng đọc) và **Multi-AZ** (sao chép đồng bộ, chịu lỗi thảm họa).
2. Hiểu cấu trúc kiến trúc tách rời Compute và Storage của **Amazon Aurora** và các loại Endpoints (Writer Endpoint, Reader Endpoint).
3. Nắm được vai trò của **RDS Proxy** trong việc giải quyết bài toán cạn kiệt connection pool khi ứng dụng Lambda kết nối vào RDS.
4. Hiểu các chiến lược lưu bộ nhớ đệm với **ElastiCache** (Lazy Loading vs Write-Through) và so sánh giữa Redis và Memcached.
5. Thuộc lòng danh sách các cổng mạng phổ biến của các hệ quản trị cơ sở dữ liệu.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Read Replicas**: Tối đa 15 bản sao, sao chép bất đồng bộ (Asynchronous), hỗ trợ Cross-AZ và Cross-Region; dùng cho báo cáo/analytics; có thể được promote thành database độc lập.
2. **Multi-AZ**: 1 Standby bản sao duy nhất trong cùng Region khác AZ, sao chép đồng bộ (Synchronous), tự động failover (Automated Failover); **KHÔNG dùng để đọc dữ liệu**.
3. **Amazon Aurora**: Tương thích MySQL/Postgres; lưu trữ nhân bản 6 bản sao trên 3 AZ; tự động tăng dung lượng lên 128TB; Reader Endpoint tự động cân bằng tải giữa các read replicas.
4. **Aurora Serverless v2**: Tự động mở rộng và thu hẹp quy mô tính toán theo đơn vị ACU (Aurora Capacity Units) **ngay lập tức trong tích tắc (instant scaling)** mà không làm rớt kết nối; hỗ trợ đầy đủ Multi-AZ, Read Replicas và Global Database.
5. **Aurora I/O-Optimized**: Tùy chọn cấu hình lưu trữ **không tính phí I/O requests** (chỉ tính chi phí lưu trữ dung lượng cố định); giúp tối ưu chi phí tới 40% cho các ứng dụng có khối lượng I/O đọc/ghi dày đặc (e-commerce, payment systems).
6. **Amazon ElastiCache Serverless**: Hỗ trợ cả Redis và Memcached; tự động scale bộ nhớ và CPU trong vòng chưa đầy 1 phút; loại bỏ hoàn toàn việc phải sizing node hay quản lý cluster.
7. **Amazon MemoryDB for Redis**: Khác biệt với ElastiCache, MemoryDB là cơ sở dữ liệu in-memory tốc độ microsecond nhưng có **Multi-AZ transactional log**, đóng vai trò làm **Primary Database** lưu trữ bền vững (durable) chứ không chỉ đơn thuần là bộ nhớ đệm (cache) tạm thời.
8. **RDS Proxy**: Hồ chứa kết nối (Connection pool) serverless; giảm 66% thời gian failover; bắt buộc xác thực qua IAM & Secrets Manager.
9. **Danh sách các cổng dịch vụ DB kinh điển (Port list)**:
   - **PostgreSQL**: `5432`
   - **MySQL / MariaDB / Aurora**: `3306`
   - **Oracle Database**: `1521`
   - **Microsoft SQL Server**: `1433`

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Cơ chế Sao lưu RDS (Backups & Snapshots)
- **Automated Backups (Sao lưu tự động hàng ngày)**:
  - Tự động sao lưu toàn bộ database và ghi lại transaction logs liên tục.
  - Hỗ trợ **Point-in-Time Recovery (PITR)**: Khôi phục database về bất kỳ giây cụ thể nào trong khoảng thời gian lưu giữ (từ 1 đến 35 ngày).
  - Khi khôi phục: AWS sẽ **tạo ra một Database mới hoàn toàn** với DNS endpoint mới.
- **Manual DB Snapshots (Chụp ảnh thủ công)**:
  - Do người dùng chủ động kích hoạt.
  - **Tồn tại vĩnh viễn** cho đến khi bạn bấm xóa, ngay cả khi bạn đã xóa bỏ database gốc.

### 2. Các tầng giám sát RDS (Monitoring Levels)
- **CloudWatch Metrics**: Cung cấp các số liệu ở cấp độ Hypervisor (CPU, Free Memory, Free Storage Space, Read/Write IOPS).
- **Enhanced Monitoring**: Chạy một agent bên trong hệ điều hành của máy ảo database, hiển thị danh sách chi tiết các tiến trình (Processes/Threads) đang chiếm dụng CPU và RAM.
- **Performance Insights**: Giao diện trực quan hóa chuyên sâu phân tích phụ tải database (Database Load), xác định chính xác câu lệnh SQL nào (Top SQL queries) hoặc user nào đang làm chậm hệ thống.

### 3. So sánh Amazon ElastiCache vs Amazon MemoryDB for Redis

| Tiêu chí | Amazon ElastiCache for Redis | Amazon MemoryDB for Redis |
| :--- | :--- | :--- |
| **Vai trò chính** | Bộ nhớ đệm tạm thời (Caching Layer) | **Cơ sở dữ liệu chính (Primary Database)** |
| **Tính bền vững dữ liệu** | Chụp snapshot định kỳ, có nguy cơ mất dữ liệu nhỏ khi node hỏng | **Multi-AZ Transactional Log**, đảm bảo không mất dữ liệu (ACID compliant) |
| **Thời gian khôi phục** | Đọc lại từ snapshot hoặc database gốc | Khôi phục tức thì từ Multi-AZ transactional storage |
| **Trường hợp sử dụng** | Tăng tốc độ đọc cho RDS/DynamoDB, session store | Ứng dụng thanh toán, bảng xếp hạng game, hệ thống đặt vé thời gian thực |

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn có một hệ thống tài chính chạy trên Amazon RDS MySQL. Đội ngũ dữ liệu muốn chạy các báo cáo phức tạp tốn nhiều giờ và làm chậm hệ thống phục vụ khách hàng. Bạn sẽ cấu hình kiến trúc gì trên RDS để giải quyết vấn đề này?
2. Nếu máy chủ chính của một cụm RDS Multi-AZ bị sập phần cứng, quá trình chuyển đổi dự phòng (Failover) diễn ra như thế nào? Ứng dụng của bạn có cần thay đổi chuỗi kết nối (Connection String) không?
3. Tại sao một hàm AWS Lambda khi truy vấn trực tiếp vào Amazon RDS PostgreSQL lại dễ gây ra lỗi cạn kiệt kết nối, và dịch vụ nào khắc phục được tình trạng này?
4. Đâu là cổng mạng mặc định của cơ sở dữ liệu PostgreSQL?
5. Sự khác biệt giữa công cụ Redis và Memcached trong dịch vụ Amazon ElastiCache là gì?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Tạo một hoặc nhiều **RDS Read Replicas** và chuyển toàn bộ các câu truy vấn báo cáo của đội ngũ dữ liệu sang kết nối vào DNS Endpoint của Read Replica đó, giải phóng hoàn toàn tải đọc cho máy chủ Master.
2. Quá trình Failover diễn ra **hoàn toàn tự động**: AWS tự động chuyển đổi bản ghi DNS CNAME của Database Endpoint để trỏ sang địa chỉ IP của máy chủ Standby ở AZ phụ. Ứng dụng của bạn **KHÔNG CẦN THAY ĐỔI** chuỗi kết nối hay DNS endpoint.
3. Vì Lambda là kiến trúc serverless có thể scale mở rộng hàng ngàn hàm đồng thời, mỗi hàm mở một kết nối mới làm cạn kiệt connection pool của Postgres. Giải pháp là triển khai **Amazon RDS Proxy** đứng giữa để quản lý hồ chứa kết nối (Connection Pooling).
4. Cổng **`5432`**.
5. **Redis** hỗ trợ cấu trúc dữ liệu phong phú, có khả năng sao lưu snapshot, hỗ trợ tính năng bền vững dữ liệu (Persistence) và tự động failover đa AZ; trong khi **Memcached** thuần túy là bộ nhớ đệm chuỗi Key-Value đa luồng không có khả năng nhân bản hay lưu bền vững.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [87 - Amazon RDS Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/87%20-%20Amazon%20RDS%20Overview.md)
  - [88 - RDS Read Replicas vs Multi AZ.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/88%20-%20RDS%20Read%20Replicas%20vs%20Multi%20AZ.md)
  - [91 - Amazon Aurora.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/91%20-%20Amazon%20Aurora.md)
  - [94 - RDS & Aurora - Backup and Monitoring.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/94%20-%20RDS%20&%20Aurora%20-%20Backup%20and%20Monitoring.md)
  - [96 - RDS Proxy.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/96%20-%20RDS%20Proxy.md)
  - [97 - ElastiCache Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/97%20-%20ElastiCache%20Overview.md)
  - [100 - List of Ports to be familiar with.md](file:///n:/AWS_XBrain_Note/AWS_Resources/09%20-%20AWS%20Fundamentals_%20RDS%20+%20Aurora/100%20-%20List%20of%20Ports%20to%20be%20familiar%20with.md)
