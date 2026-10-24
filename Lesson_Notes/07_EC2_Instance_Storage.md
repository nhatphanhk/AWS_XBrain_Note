# Ghi Chú Bài Học: Chương 07 - Lưu Trữ Dữ Liệu Gắn Kèm Máy Chủ EC2 (EC2 Instance Storage)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 07 - EC2 Instance Storage (Bài 56 đến Bài 69)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon EBS, EFS & Instance Store](file:///n:/AWS_XBrain_Note/AWS_Services/EBS_EFS_Storage.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này phân tích toàn bộ các công nghệ lưu trữ dữ liệu gắn trực tiếp hoặc gián tiếp vào máy chủ ảo Amazon EC2: ổ lưu trữ khối ảo **Amazon Elastic Block Store (EBS)**, bản chụp nhanh **EBS Snapshots**, ảnh máy mẫu **Amazon Machine Images (AMI)**, ổ cứng phần cứng tốc độ cao **EC2 Instance Store**, các phân loại ổ đĩa SSD/HDD (`gp2`, `gp3`, `io1`, `io2`, `st1`, `sc1`), tính năng gắn đồng thời **EBS Multi-Attach**, cơ chế mã hóa **EBS Encryption**, và hệ thống tệp tin mạng dùng chung **Amazon Elastic File System (EFS)**.

### Mục tiêu học tập
1. Hiểu bản chất ổ đĩa EBS và giới hạn trong 1 Availability Zone cụ thể.
2. Nắm vững cơ chế sao lưu gia tăng (Incremental) của EBS Snapshots và quy trình chuyển vùng dữ liệu xuyên Region.
3. Tự tạo Custom AMI từ máy ảo EC2 đang chạy để chuẩn hóa môi trường nhân bản (Golden Image).
4. Phân biệt được sự khác nhau giữa **EBS** (bền vững, kết nối mạng) và **Instance Store** (tạm thời, gắn bus vật lý trực tiếp).
5. So sánh chi tiết các loại ổ đĩa EBS để chọn đúng loại tối ưu giữa chi phí và hiệu năng.
6. Hiểu cách sử dụng Amazon EFS cho kịch bản nhiều máy ảo chia sẻ dữ liệu đồng thời xuyên qua các AZ.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **EBS gắn chặt với 1 AZ (AZ-locked)**: Để chuyển một ổ đĩa EBS từ `us-east-1a` sang `us-east-1b`, bắt buộc phải tạo Snapshot rồi tạo Volume mới từ Snapshot đó tại `us-east-1b`.
2. **`gp3` vượt trội hơn `gp2`**: Rẻ hơn 20%, có sẵn 3,000 IOPS và 125 MB/s miễn phí, cho phép nâng IOPS và throughput độc lập mà không cần tăng dung lượng ổ.
3. **Instance Store = Mất dữ liệu khi Stop**: Dành riêng cho dữ liệu đệm (Cache), dữ liệu tạm (Scratch pad), file log tạm thời đòi hỏi tốc độ I/O hàng triệu phép tính/giây.
4. **Boot Volume chỉ dùng được SSD**: Các dòng HDD (`st1`, `sc1`) không thể sử dụng làm ổ đĩa khởi động hệ điều hành.
5. **EFS là Multi-AZ**: Giao thức NFSv4, chỉ hỗ trợ máy ảo Linux (không hỗ trợ Windows native), tự động co giãn dung lượng (Pay-as-you-use).

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Amazon Machine Image (AMI)
- **Định nghĩa**: Bản mẫu đóng gói sẵn hệ điều hành, cấu hình, phần mềm và dữ liệu của ổ đĩa Root Volume.
- **Tại sao cần tạo Custom AMI**: Giúp rút ngắn thời gian khởi động máy ảo mới từ 10 phút (nếu phải chạy script cài đặt từ đầu) xuống còn 1-2 phút (do phần mềm đã cài sẵn trong ảnh). Tăng tốc độ co giãn của Auto Scaling Groups.
- **Phạm vi của AMI**: AMI gắn với **1 Region cụ thể**. Muốn dùng ở Region khác, bạn phải thực hiện thao tác **Copy AMI**.

### 2. EBS Snapshots Features
- **Fast Snapshot Restore (FSR)**: Loại bỏ độ trễ khởi động lạnh khi tạo volume mới từ snapshot lớn (dữ liệu được nạp trước sẵn sàng tức thì).
- **Snapshot Archive**: Giảm 75% chi phí lưu trữ cho các bản snapshot chỉ giữ lại để phòng ngừa rủi ro pháp lý (mất 24-72 giờ để khôi phục).
- **Recycle Bin**: Cơ chế an toàn thiết lập thời gian giữ lại (Retention rule từ 1 ngày đến 1 năm) khi có người xóa nhầm snapshot.

### 3. Quy trình mã hóa ổ đĩa chưa mã hóa
- Không thể mã hóa trực tiếp một ổ đĩa EBS đang tồn tại ở trạng thái chưa mã hóa.
- Phải qua chuỗi 3 bước:
  `Tạo Snapshot từ ổ cũ` ➔ `Copy Snapshot và bật cờ Encryption` ➔ `Tạo Volume mới từ Snapshot đã mã hóa`.

---

## 4.4. Lệnh và Cấu Hình Thực Tế (Commands & Config)

### Kiểm tra ổ đĩa và hệ thống tệp tin trên Linux:
```bash
# Xem danh sách các thiết bị khối (Block devices) gắn vào máy ảo
lsblk

# Xem dung lượng và điểm mount của các hệ thống tệp tin
df -hT

# Định dạng ổ đĩa mới gắn (ví dụ hệ thống tệp tin XFS)
sudo mkfs -t xfs /dev/xvdf

# Mount ổ đĩa vào thư mục dữ liệu
sudo mkdir /data
sudo mount /dev/xvdf /data
```

---

## 4.5. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn có một website WordPress chạy trên cụm 5 máy ảo EC2 phân tán ở 2 Availability Zones. Tất cả các máy ảo cần phải đọc và ghi đồng thời vào một thư mục tải ảnh chung (`/wp-content/uploads`). Giải pháp lưu trữ nào là phù hợp nhất?
2. Sự khác biệt cốt lõi nhất giữa ổ đĩa Amazon EBS `gp2` và `gp3` là gì?
3. Nếu bạn xóa (Terminate) một máy ảo EC2, chuyện gì sẽ xảy ra với các ổ đĩa EBS gắn kèm của nó?
4. Một ứng dụng xử lý đồ họa đòi hỏi ổ đĩa có tốc độ đọc ghi cực đại lên tới hàng trăm ngàn IOPS với độ trễ microsecond. Dữ liệu này chỉ là các file render trung gian và có thể tạo lại từ file gốc nếu gặp sự cố. Bạn nên chọn loại lưu trữ nào?
5. Bạn có thể sử dụng ổ đĩa `st1` (Throughput Optimized HDD) làm ổ đĩa khởi động (Boot volume) cho máy ảo Linux không?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. **Amazon EFS (Elastic File System)**. EFS hỗ trợ giao thức mạng NFSv4, cho phép hàng ngàn máy ảo Linux gắn kết đồng thời và tự động nhân bản dữ liệu xuyên qua nhiều Availability Zones.
2. Với `gp2`, số lượng IOPS bị phụ thuộc cứng vào kích thước ổ đĩa (3 IOPS/GB). Với `gp3`, bạn được cấp sẵn 3,000 IOPS và 125 MB/s miễn phí, đồng thời có thể nâng cấp IOPS và throughput hoàn toàn độc lập mà không cần phải tăng dung lượng ổ đĩa.
3. Mặc định: Ổ đĩa **Root Volume** sẽ bị xóa theo máy ảo (do cờ `DeleteOnTermination` mặc định là `true`). Các ổ đĩa phụ (**Attached Data Volumes**) mặc định sẽ được giữ lại nguyên vẹn (cờ `DeleteOnTermination` là `false`), chuyển sang trạng thái `available` để bạn có thể gắn sang máy khác.
4. **EC2 Instance Store** (ổ cứng NVMe gắn trực tiếp vào máy chủ vật lý).
5. **KHÔNG THỂ**. AWS quy định rõ: các dòng HDD (`st1` và `sc1`) chỉ được dùng làm ổ đĩa dữ liệu bổ sung (Data Volume), không thể dùng làm ổ Boot Volume. Chỉ có các dòng SSD (`gp2`, `gp3`, `io1`, `io2`) mới làm được Boot Volume.
</details>

---

## 4.6. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [56 - EBS Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/56%20-%20EBS%20Overview.md)
  - [58 - EBS Snapshots.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/58%20-%20EBS%20Snapshots.md)
  - [60 - AMI Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/60%20-%20AMI%20Overview.md)
  - [62 - EC2 Instance Store.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/62%20-%20EC2%20Instance%20Store.md)
  - [63 - EBS Volume Types.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/63%20-%20EBS%20Volume%20Types.md)
  - [64 - EBS Multi-Attach.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/64%20-%20EBS%20Multi-Attach.md)
  - [65 - EBS Encryption.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/65%20-%20EBS%20Encryption.md)
  - [66 - Amazon EFS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/66%20-%20Amazon%20EFS.md)
  - [68 - EFS vs EBS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/07%20-%20EC2%20Instance%20Storage/68%20-%20EFS%20vs%20EBS.md)
