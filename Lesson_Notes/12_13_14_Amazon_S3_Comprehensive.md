# Ghi Chú Bài Học: Chương 12, 13, 14 - Lưu Trữ Đối Tượng Amazon S3 Toàn Tập (Amazon S3 Comprehensive)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 12, 13, 14 - Amazon S3 Introduction, Advanced S3 & S3 Security (Bài 128 đến Bài 164)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon S3 & CloudFront](file:///n:/AWS_XBrain_Note/AWS_Services/S3_and_CloudFront_Storage.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Cụm 3 chương này bao quát toàn diện dịch vụ lưu trữ đối tượng cốt lõi **Amazon Simple Storage Service (S3)**: từ các khái niệm cơ bản (Buckets, Objects, Keys, Prefix), cấu hình lưu trữ website tĩnh, quản lý phiên bản (**S3 Versioning**), cơ chế sao chép dữ liệu xuyên vùng (**Replication: CRR & SRR**), phân loại các tầng lưu trữ (**Storage Classes** bao gồm cả S3 Express One Zone), quy tắc vòng đời dữ liệu (**Lifecycle Rules**), tối ưu hiệu năng (Prefix-based scaling, Multi-part upload, Transfer Acceleration, Byte-Range fetches), đến toàn bộ các cơ chế an ninh bảo mật: **S3 Bucket Policy**, **Block Public Access**, mã hóa (SSE-S3, SSE-KMS, DSSE-KMS, SSE-C), liên kết tên miền chéo **CORS**, khóa bảo vệ chống xóa **MFA Delete**, đường dẫn truy cập tạm thời **Pre-signed URLs**, khóa bất biến **Object Lock & Glacier Vault Lock (WORM)**, điểm truy cập mạng riêng **S3 Access Points**, và tính năng biến đổi dữ liệu động **S3 Object Lambda**.

### Mục tiêu học tập
1. Nắm vững cấu trúc và nguyên tắc đặt tên Bucket (toàn cầu duy nhất, chữ thường, không chứa gạch dưới).
2. Hiểu bản chất của S3 Versioning, cách hoạt động của Delete Marker và bảo vệ bằng MFA Delete.
3. So sánh chi phí và thời gian truy xuất giữa các tầng lưu trữ (Standard, Intelligent-Tiering, IA, Glacier, Deep Archive).
4. Thiết lập các quy tắc Lifecycle Rules để tự động hóa việc dọn dẹp và giảm chi phí lưu trữ.
5. Làm chủ các giải pháp tối ưu hiệu năng: đạt 3,500 PUT/POST và 5,500 GET request/giây trên mỗi Prefix.
6. Thiết lập các rào chắn bảo mật cấp cao: S3 Bucket Policy chặn non-TLS, mã hóa dữ liệu với KMS, cấu hình CORS, Object Lock Compliance mode.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **S3 không có thư mục thật**: Các dấu gạch chéo `/` trong đường dẫn chỉ là chuỗi tiền tố (**Prefix**). Mỗi Prefix riêng biệt có khả năng phục vụ độc lập **3,500 PUT/POST/DELETE** và **5,500 GET** request/giây.
2. **S3 Express One Zone**: Lớp lưu trữ hiệu năng cao mới nhất đặt trong **1 Availability Zone duy nhất**, mang lại độ trễ **single-digit millisecond** (nhanh gấp 10 lần S3 Standard). Chuyên dùng cho huấn luyện AI/ML, phân tích dữ liệu lớn và các ứng dụng tài chính cần hàng triệu transaction/giây.
3. **Multi-part Upload**: Bắt buộc với tệp tin **> 5 GB** và khuyến nghị mạnh mẽ cho mọi tệp tin **> 100 MB** để tải song song và tăng tốc độ truyền dữ liệu.
4. **S3 Versioning**: Xóa tệp chỉ tạo Delete Marker; muốn xóa thật phải xóa kèm Version ID cụ thể.
5. **MFA Delete**: Bắt buộc tài khoản Root và chỉ cấu hình được thông qua **AWS CLI** (không cấu hình được trên Console).
6. **S3 Replication (CRR/SRR)**: Bắt buộc cả hai Bucket nguồn và đích phải **bật Versioning**.
7. **S3 Multi-Region Access Points (MRAP)**: Cung cấp một Global Endpoint duy nhất trên nền tảng AWS Global Accelerator để định tuyến lưu lượng thông minh tới bucket gần nhất trên nhiều Region và tự động failover.
8. **S3 Object Lambda**: Cho phép chèn mã AWS Lambda để tự động biến đổi dữ liệu trực tiếp khi ứng dụng gọi lệnh `GET` (mask PII, nén ảnh, chuyển đổi format) mà không cần sao lưu bản copy thứ hai.
9. **Mặc định an ninh mới**: Mọi S3 bucket mới đều **mặc định bật SSE-S3** và **Object Ownership = Bucket Owner Enforced** (vô hiệu hóa hoàn toàn S3 ACLs, chỉ quản lý qua Bucket Policy).
10. **Object Lock (Compliance Mode)**: Khóa dữ liệu bất biến (WORM), ngay cả Root Account cũng không thể xóa trước thời hạn bảo vệ.
11. **Pre-signed URLs**: Cấp quyền tạm thời cho người dùng tải lên hoặc tải xuống mà không cần cấp quyền IAM.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Phân biệt các chế độ mã hóa S3 (Server-Side Encryption)

| Chế độ mã hóa | Quản lý khóa | Header yêu cầu khi gọi API | Nhật ký kiểm toán | Phí phát sinh |
| :--- | :--- | :--- | :--- | :--- |
| **SSE-S3** | Hoàn toàn bởi AWS (AES-256) | `"x-amz-server-side-encryption": "AES256"` | Không có log khóa riêng | **Miễn phí** (Mặc định cho mọi bucket mới) |
| **SSE-KMS** | Khách hàng qua AWS KMS | `"x-amz-server-side-encryption": "aws:kms"` | **Có (qua CloudTrail)** | Tính phí gọi KMS API |
| **DSSE-KMS** | 2 lớp độc lập qua KMS | `"x-amz-server-side-encryption": "aws:kms:dsse"` | Có (Kiểm toán 2 lớp) | Tính phí 2 lần KMS |
| **SSE-C** | Khách hàng tự quản lý khóa | Gửi kèm key trong HTTPS headers | Khách hàng tự theo dõi | Miễn phí |

### 2. S3 Access Points & VPC Endpoints
- **Vấn đề**: Khi một Data Lake S3 Bucket được chia sẻ cho 20 nhóm dự án khác nhau (Data Science, Finance, HR, Marketing), một Bucket Policy đơn lẻ sẽ trở nên khổng lồ, phức tạp và dễ gặp lỗi cấu hình sai.
- **Giải pháp**: Tạo ra các **S3 Access Points** riêng biệt cho từng nhóm. Mỗi Access Point sở hữu một DNS endpoint riêng và một Access Point Policy độc lập; có thể giới hạn Access Point đó chỉ truy cập được từ bên trong một VPC cụ thể.

### 3. S3 Express One Zone vs S3 Standard

| Tiêu chí so sánh | Amazon S3 Standard | Amazon S3 Express One Zone |
| :--- | :--- | :--- |
| **Phạm vi triển khai** | Tối thiểu 3 Availability Zones (Multi-AZ) | **1 Availability Zone duy nhất (Single-AZ)** |
| **Độ trễ truy xuất (Latency)** | Hàng chục mili-giây (Double-digit ms) | **Độ trễ 1 chữ số mili-giây (Single-digit ms)** |
| **Tốc độ xử lý** | Chuẩn thông thường | **Nhanh gấp 10 lần** so với Standard |
| **Cơ chế xác thực** | IAM Signature Version 4 thông thường | Hỗ trợ thêm **Directory Buckets** & Session-based authentication |
| **Trường hợp sử dụng lý tưởng** | Dữ liệu ứng dụng thông thường, sao lưu, web media | **Huấn luyện mô hình AI/ML, Apache Spark, Real-time bidding** |

### 4. S3 Object Lambda
- **Nguyên lý hoạt động**: Khi Client gọi `s3:GetObject`, request sẽ đi qua một **S3 Object Lambda Access Point**. Điểm truy cập này sẽ tự động kích hoạt một hàm **AWS Lambda** để xử lý dữ liệu trước khi trả về cho Client.
- **Lợi ích kiến trúc**:
  - Không cần duy trì nhiều phiên bản dữ liệu (ví dụ: không cần lưu cả bản ảnh gốc và bản ảnh thumbnail, không cần lưu cả bản dữ liệu thô và bản đã che PII).
  - Phân quyền động tùy theo danh tính của caller (ví dụ: nhân viên kế toán thấy số tài khoản đầy đủ, nhân viên CSKH chỉ thấy 4 số cuối).

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn có một tệp tin video dung lượng 15 GB cần tải lên Amazon S3. Phương thức tải lên nào là bắt buộc phải sử dụng?
2. Trong một S3 Bucket đã bật tính năng Versioning, một kỹ sư chạy lệnh xóa một tệp tin mà không truyền Version ID. Tệp tin đó có bị xóa vĩnh viễn không? Làm thế nào để khôi phục lại tệp tin?
3. Bạn muốn đảm bảo rằng các bản sao lưu tài chính của công ty khi lưu vào S3 sẽ không thể bị sửa đổi hoặc xóa bỏ bởi bất kỳ ai (kể cả quản trị viên hệ thống hoặc tài khoản AWS Root) trong vòng 5 năm để tuân thủ quy định pháp luật. Bạn nên cấu hình tính năng nào?
4. Đâu là yêu cầu bắt buộc trên cả 2 S3 Buckets để có thể thiết lập tính năng Cross-Region Replication (CRR)?
5. Làm thế nào để một trang web chạy trên domain `www.example.com` có thể tải được các font chữ và ảnh lưu trữ tại một S3 bucket có tên miền `s3.amazonaws.com/my-media-bucket` mà không bị trình duyệt chặn?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Bắt buộc phải sử dụng **Multi-part Upload** (vì S3 giới hạn một lượt PUT đơn lẻ tối đa chỉ là 5 GB).
2. Tệp tin **KHÔNG BỊ XÓA VĨNH VIỄN**. S3 chỉ tạo thêm một phiên bản mới có tính chất là **Delete Marker**. Để khôi phục tệp, bạn chỉ cần hiển thị danh sách các phiên bản (Show versions) và **xóa bỏ chính thẻ Delete Marker đó**.
3. Sử dụng tính năng **S3 Object Lock** ở chế độ **Compliance Mode** với thời gian lưu giữ (Retention Period) là 5 năm.
4. Cả hai bucket (Bucket nguồn và Bucket đích) bắt buộc phải **bật tính năng S3 Versioning**.
5. Cấu hình **CORS (Cross-Origin Resource Sharing)** trên S3 bucket chứa ảnh/font, thêm rule cho phép Origin `https://www.example.com` với phương thức `GET`.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [128 - S3 Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/12%20-%20Amazon%20S3%20Introduction/128%20-%20S3%20Overview.md)
  - [130 - S3 Security_ Bucket Policy.md](file:///n:/AWS_XBrain_Note/AWS_Resources/12%20-%20Amazon%20S3%20Introduction/130%20-%20S3%20Security_%20Bucket%20Policy.md)
  - [134 - S3 Versioning.md](file:///n:/AWS_XBrain_Note/AWS_Resources/12%20-%20Amazon%20S3%20Introduction/134%20-%20S3%20Versioning.md)
  - [136 - S3 Replication.md](file:///n:/AWS_XBrain_Note/AWS_Resources/12%20-%20Amazon%20S3%20Introduction/136%20-%20S3%20Replication.md)
  - [139 - S3 Storage Classes Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/12%20-%20Amazon%20S3%20Introduction/139%20-%20S3%20Storage%20Classes%20Overview.md)
  - [142 - S3 Lifecycle Rules (with S3 Analytics).md](file:///n:/AWS_XBrain_Note/AWS_Resources/13%20-%20Advanced%20Amazon%20S3/142%20-%20S3%20Lifecycle%20Rules%20(with%20S3%20Analytics).md)
  - [147 - S3 Performance.md](file:///n:/AWS_XBrain_Note/AWS_Resources/13%20-%20Advanced%20Amazon%20S3/147%20-%20S3%20Performance.md)
  - [150 - S3 Encryption.md](file:///n:/AWS_XBrain_Note/AWS_Resources/14%20-%20Amazon%20S3%20Security/150%20-%20S3%20Encryption.md)
  - [156 - S3 MFA Delete.md](file:///n:/AWS_XBrain_Note/AWS_Resources/14%20-%20Amazon%20S3%20Security/156%20-%20S3%20MFA%20Delete.md)
  - [160 - S3 Pre-signed URLs.md](file:///n:/AWS_XBrain_Note/AWS_Resources/14%20-%20Amazon%20S3%20Security/160%20-%20S3%20Pre-signed%20URLs.md)
  - [162 - Glacier Vault Lock & S3 Object Lock.md](file:///n:/AWS_XBrain_Note/AWS_Resources/14%20-%20Amazon%20S3%20Security/162%20-%20Glacier%20Vault%20Lock%20&%20S3%20Object%20Lock.md)
  - [163 - S3 Access Points.md](file:///n:/AWS_XBrain_Note/AWS_Resources/14%20-%20Amazon%20S3%20Security/163%20-%20S3%20Access%20Points.md)
