# Ghi Chú Bài Học: Chương 05 - Nền Tảng Máy Chủ Ảo Amazon EC2 (EC2 Fundamentals)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 05 - EC2 Fundamentals (Bài 31 đến Bài 46)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon EC2](file:///n:/AWS_XBrain_Note/AWS_Services/EC2_Elastic_Compute_Cloud.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này giới thiệu toàn diện về dịch vụ máy chủ ảo **Amazon EC2 (Elastic Compute Cloud)**: cách thiết lập cảnh báo ngân sách AWS Budget, cấu trúc máy ảo EC2, tự động hóa cài đặt bằng **EC2 User Data**, phân loại các dòng máy chủ (**Instance Types**), cấu hình tường lửa ảo **Security Groups**, các kỹ thuật kết nối **SSH / EC2 Instance Connect**, phân quyền bằng **IAM Instance Profile**, và các mô hình mua sắm (**Purchasing Options: On-Demand, Reserved, Savings Plans, Spot**).

### Mục tiêu học tập
1. Khởi tạo và quản trị vòng đời của một máy chủ ảo EC2 (Launch, Start, Stop, Terminate).
2. Viết script tự động hóa khởi tạo máy ảo bằng **EC2 User Data**.
3. Cấu hình tường lửa **Security Groups** kiểm soát chính xác lưu lượng Inbound/Outbound.
4. Nắm vững phương pháp kết nối an toàn qua **SSH**, **EC2 Instance Connect**, và xử lý lỗi thường gặp (Permission 0400, Connection Timed Out).
5. Phân biệt các mô hình thanh toán chi phí để tối ưu hóa ngân sách cho doanh nghiệp.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **EC2 User Data**: Đoạn script bash chạy tự động **1 lần duy nhất** lúc máy ảo khởi động lần đầu tiên (first boot) với quyền `root`; lý tưởng để cài đặt gói phần mềm, cập nhật OS và kéo mã nguồn.
2. **Security Groups**:
   - Hoạt động ở cấp độ **Card mạng ảo (ENI / Instance level)**.
   - **Stateful**: Mở chiều vào thì chiều ra tự động thông suốt.
   - **Chỉ có luật ALLOW**: Mặc định chặn tất cả chiều vào (Inbound Deny all) và mở toàn bộ chiều ra (Outbound Allow all).
   - Có thể tham chiếu (reference) tới chính ID của một Security Group khác thay vì dùng IP CIDR.
3. **Purchasing Options**:
   - *On-Demand*: Tải ngắn hạn, linh hoạt, đắt nhất.
   - *Reserved Instances & Savings Plans*: Tiết kiệm tới 72% khi cam kết 1-3 năm cho tải ổn định.
   - *Spot Instances*: Tiết kiệm tới 90% cho tải chịu được gián đoạn; AWS gửi cảnh báo trước 2 phút qua EventBridge/Metadata trước khi thu hồi.
4. **IAM Role cho EC2**: Không bao giờ lưu khóa Access Key trên máy ảo; luôn gắn IAM Role qua Instance Profile.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. EC2 Basics & Vòng đời máy ảo
- **Launch**: Khởi tạo tài nguyên từ AMI.
- **Stop**: Giải phóng vCPU và RAM (ngừng tính tiền compute), nhưng dữ liệu trên ổ cứng EBS gắn kèm vẫn được giữ lại và tiếp tục tính phí lưu trữ EBS.
- **Start**: Cấp phát lại phần cứng máy chủ mới, máy ảo nhận Public IP mới (nếu không dùng Elastic IP).
- **Terminate**: Xóa bỏ hoàn toàn máy ảo; ổ đĩa Root EBS mặc định sẽ bị xóa theo (thuộc tính `DeleteOnTermination: true`).

### 2. Các Cổng Mạng Kinh Điển Cần Nhớ (Classic Ports)
- **Port 22**: SSH (Secure Shell) kết nối dòng lệnh Linux; SFTP (Secure FTP).
- **Port 21**: FTP (File Transfer Protocol) truyền tệp tin không mã hóa.
- **Port 80**: HTTP (Truy cập web không mã hóa).
- **Port 443**: HTTPS (Truy cập web có mã hóa an toàn TLS/SSL).
- **Port 3389**: RDP (Remote Desktop Protocol) điều khiển giao diện đồ họa máy chủ Windows.
- **Port 3306**: MySQL / Amazon Aurora MySQL.
- **Port 5432**: PostgreSQL / Amazon Aurora PostgreSQL.

### 3. Phương Thức Kết Nối EC2
- **SSH truyền thống**: Yêu cầu máy chủ có Public IP, Security Group mở cổng 22, và client phải sở hữu file khóa bí mật `.pem` (phải chỉnh quyền `chmod 400`).
- **EC2 Instance Connect**: Cho phép SSH trực tiếp trên giao diện trình duyệt web của AWS Console. AWS sẽ tự động đẩy một khóa SSH tạm thời (hết hạn sau 60 giây) lên metadata của máy ảo.
- **AWS Systems Manager Session Manager**: Giải pháp doanh nghiệp tối ưu nhất: không cần Public IP, không cần mở cổng 22 trên SG, quản lý quyền tập trung qua IAM.

---

## 4.4. Lệnh và Cấu Hình Thực Tế (Commands & Config)

### Script User Data khởi tạo Website Nginx đơn giản:
```bash
#!/bin/bash
# Nâng cấp hệ điều hành
dnf update -y
# Cài đặt máy chủ web Nginx
dnf install -y nginx
# Khởi động dịch vụ và cấu hình tự chạy khi reboot
systemctl start nginx
systemctl enable nginx
# Tạo trang chủ hiển thị thông tin máy ảo
echo "<h1>Chao mung den voi EC2 Instance: $(hostname -f)</h1>" > /usr/share/nginx/html/index.html
```

### Lệnh kết nối SSH chuẩn từ terminal:
```bash
# Phải phân quyền an toàn cho file private key trước
chmod 400 MyKeyPair.pem

# Kết nối SSH vào máy ảo Amazon Linux
ssh -i "MyKeyPair.pem" ec2-user@54.254.120.35
```

---

## 4.5. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn kết nối SSH vào một máy ảo EC2 mới tạo nhưng terminal đứng im và sau đó báo lỗi `ssh: connect to host ... port 22: Connection timed out`. Bạn nên kiểm tra thành phần nào đầu tiên?
2. Khi bạn muốn một đoạn mã tự động cập nhật hệ điều hành và cài đặt phần mềm khi máy chủ vừa được bật lên lần đầu, bạn sẽ đưa đoạn mã đó vào mục cấu hình nào của EC2?
3. Một ứng dụng xử lý dữ liệu lớn (Big Data) chạy trong 4 tiếng và nếu bị tắt giữa chừng thì có thể chạy lại từ đầu mà không gây hậu quả kinh doanh. Bạn nên chọn mô hình mua sắm EC2 nào để tiết kiệm chi phí tối đa?
4. Security Group của EC2 có hỗ trợ tạo luật chặn (DENY rule) cho một địa chỉ IP cụ thể không?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Kiểm tra **Security Group Inbound Rules** xem đã cho phép cổng 22 từ địa chỉ IP của bạn chưa, và kiểm tra **Route Table** của Subnet xem đã có đường dẫn `0.0.0.0/0` trỏ tới Internet Gateway (IGW) chưa.
2. Đưa vào mục **EC2 User Data**.
3. Chọn **EC2 Spot Instances** (giúp tiết kiệm tới 90% chi phí so với On-Demand).
4. **KHÔNG**. Security Group chỉ hỗ trợ các luật **ALLOW**. Mọi traffic không được khai báo rõ ràng trong luật Allow sẽ mặc định bị từ chối. Để tạo luật DENY cho một IP cụ thể, bạn phải sử dụng **Network ACL (NACL)** ở cấp độ Subnet.
</details>

---

## 4.6. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [32 - EC2 Basics.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/32%20-%20EC2%20Basics.md)
  - [33 - Create an EC2 Instance with EC2 User Data to hav.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/33%20-%20Create%20an%20EC2%20Instance%20with%20EC2%20User%20Data%20to%20hav.md)
  - [34 - EC2 Instance Types Basics.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/34%20-%20EC2%20Instance%20Types%20Basics.md)
  - [35 - Security Groups & Classic Ports Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/35%20-%20Security%20Groups%20&%20Classic%20Ports%20Overview.md)
  - [41 - SSH Troubleshooting.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/41%20-%20SSH%20Troubleshooting.md)
  - [44 - EC2 Instance Purchasing Options.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/44%20-%20EC2%20Instance%20Purchasing%20Options.md)
  - [45 - Spot Instances & Spot Fleet.md](file:///n:/AWS_XBrain_Note/AWS_Resources/05%20-%20EC2%20Fundamentals/45%20-%20Spot%20Instances%20&%20Spot%20Fleet.md)
