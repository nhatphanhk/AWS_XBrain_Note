# Ghi Chú Bài Học: Chương 28 - Chiến Lược Khắc Phục Thảm Họa & Di Chuyển Lên AWS (Disaster Recovery & Migrations)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 28 - Disaster Recovery & Migrations (Bài 351 đến Bài 361)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Disaster Recovery & Migration](file:///n:/AWS_XBrain_Note/AWS_Services/Disaster_Recovery_Migration.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này đi sâu vào các phương pháp luận và công nghệ bảo vệ tính liên tục trong hoạt động kinh doanh (**Business Continuity**) trên AWS: hai chỉ số cốt lõi **RPO (Recovery Point Objective)** và **RTO (Recovery Time Objective)**, 4 chiến lược khắc phục thảm họa kinh điển (**Backup & Restore, Pilot Light, Warm Standby, Multi-Site Active-Active**), dịch vụ tự động sao chép khối phục hồi **AWS Elastic Disaster Recovery (AWS DRS)**, dịch vụ chuyển dịch cơ sở dữ liệu **AWS Database Migration Service (AWS DMS)** kết hợp công cụ chuyển đổi lược đồ **AWS Schema Conversion Tool (AWS SCT)**, cơ chế sao lưu tập trung **AWS Backup**, dịch vụ di chuyển máy chủ nguyên trạng **AWS Application Migration Service (AWS MGN)**, và các giải pháp vận chuyển dữ liệu khối lượng lớn (**AWS Snow Family, AWS DataSync**).

### Mục tiêu học tập
1. Nắm vững định nghĩa và cách tính toán hai chỉ số RPO và RTO trong thực tế.
2. So sánh ưu, nhược điểm, mức chi phí và thời gian khôi phục của 4 chiến lược Disaster Recovery.
3. Hiểu cơ chế sao chép liên tục (CDC) của AWS DMS để chuyển đổi database với thời gian gián đoạn gần bằng 0.
4. Lựa chọn đúng thiết bị trong dòng AWS Snow Family khi cần chuyển dịch lượng lớn dữ liệu lên cloud.
5. Cấu hình bảo vệ bản sao lưu chống mã độc tống tiền bằng AWS Backup Vault Lock.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **RPO (Thời gian mất dữ liệu tối đa)**; **RTO (Thời gian gián đoạn dịch vụ tối đa)**.
2. **4 Chiến lược DR (từ rẻ nhất/chậm nhất đến đắt nhất/nhanh nhất)**:
   - *Backup & Restore*: RPO/RTO tính bằng giờ/ngày; chi phí rẻ nhất ($).
   - *Pilot Light*: DB đồng bộ liên tục, máy chủ EC2 tắt hoàn toàn; RTO tính bằng phút ($$).
   - *Warm Standby*: Cụm server thu nhỏ chạy 24/7; RTO cực nhanh ($$$).
   - *Multi-Site Active-Active*: Chạy full tải ở 2 Region song song; RPO/RTO = 0; chi phí đắt nhất ($$$$).
3. **AWS DMS + AWS SCT**:
   - Dùng **AWS SCT** để dịch schema giữa các loại database khác nhau (Heterogeneous).
   - Dùng **AWS DMS** để nạp dữ liệu (Full load) và duy trì đồng bộ liên tục (**CDC - Change Data Capture**).
4. **AWS DRS**: Sao chép cấp độ khối ổ đĩa (Block-level) vào vùng đệm Staging giá rẻ; tự động bật máy ảo khi có sự cố.
5. **AWS Snow Family**: Snowcone (8TB), Snowball Edge (80TB), Snowmobile (100PB) giải quyết bài toán băng thông mạng chậm khi chuyển dữ liệu lớn.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Phân tích chi tiết 4 Chiến lược Khắc phục Thảm họa (The 4 DR Strategies)
- **Backup & Restore**: Thích hợp cho các ứng dụng nội bộ không quan trọng (Non-critical workloads). Khi Region chính sập, kỹ sư chạy script tải snapshot từ S3 và khởi chạy lại hạ tầng từ đầu.
- **Pilot Light**: Tên gọi bắt nguồn từ ngọn lửa mồi trong lò sưởi khí đốt (ngọn lửa nhỏ luôn cháy để khi cần có thể bùng lên ngọn lửa lớn). Dữ liệu database được đồng bộ liên tục sang Region phụ; máy chủ web/app không chạy, chỉ lưu sẵn AMI. Khi sự cố xảy ra, Auto Scaling Group mới được kích hoạt để khởi chạy máy ảo từ AMI.
- **Warm Standby**: Luôn luôn có một hệ thống đang chạy ở Region phụ nhưng ở quy mô tối thiểu (ví dụ: Region chính có 20 máy ảo `c6i.4xlarge`, Region phụ chạy sẵn 2 máy ảo `t3.medium`). Khi sự cố xảy ra, Route 53 chuyển hướng traffic sang Region phụ và ASG lập tức scale-out lên 20 máy lớn.
- **Multi-Site Active-Active**: Cả hai Region đều chạy ở quy mô đầy đủ và cùng tiếp nhận traffic của người dùng thông qua Route 53. Dữ liệu được đồng bộ 2 chiều thời gian thực (Aurora Global Database / DynamoDB Global Tables).

---

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Ban giám đốc yêu cầu hệ thống thanh toán của ngân hàng phải có thời gian khôi phục dịch vụ (RTO) dưới 5 phút và lượng dữ liệu mất mát (RPO) không quá vài giây khi có thảm họa sập một trung tâm dữ liệu. Tuy nhiên, ngân sách không cho phép chi trả gấp đôi tiền máy chủ chạy 24/7 ở hai vùng cùng lúc. Chiến lược DR nào là tối ưu nhất?
2. Bạn cần chuyển một cơ sở dữ liệu Oracle tại trung tâm dữ liệu On-Premises sang Amazon Aurora PostgreSQL trên AWS. Bạn sẽ sử dụng những công cụ nào và quy trình ra sao?
3. Một công ty điện ảnh có 70 TB video chất lượng 4K cần tải lên Amazon S3. Văn phòng của họ chỉ có đường truyền mạng Internet 20 Mbps không ổn định. Phương thức nào giúp chuyển toàn bộ dữ liệu lên S3 trong vòng dưới 1 tuần?
4. AWS Elastic Disaster Recovery (AWS DRS) giúp tối ưu chi phí trong trạng thái hoạt động bình thường (trước khi thảm họa xảy ra) như thế nào?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Chọn chiến lược **Warm Standby** (duy trì dữ liệu đồng bộ liên tục thời gian thực và một cụm máy chủ thu nhỏ chạy sẵn ở Region phụ; khi sự cố xảy ra chỉ cần scale-up trong 1-2 phút, chi phí rẻ hơn nhiều so với Multi-Site Active-Active).
2. Sử dụng kết hợp hai công cụ: (1) Sử dụng **AWS Schema Conversion Tool (AWS SCT)** để tự động phân tích và chuyển đổi cấu trúc bảng, views, stored procedures từ Oracle sang PostgreSQL; (2) Sử dụng **AWS Database Migration Service (AWS DMS)** với tính năng sao chép dữ liệu liên tục (**CDC**) để nạp toàn bộ dữ liệu ban đầu và giữ đồng bộ dữ liệu thay đổi cho đến ngày cắt chuyển chính thức.
3. Đặt hàng một thiết bị **AWS Snowball Edge Storage Optimized** (dung lượng 80 TB). AWS sẽ gửi thiết bị tới tận nơi qua đường bưu điện, bạn cắm mạng nội bộ để chép dữ liệu trong 1 ngày, sau đó gửi ngược lại thiết bị cho AWS để họ nạp trực tiếp vào S3 bucket của bạn.
4. Trong trạng thái bình thường, DRS chỉ ghi dữ liệu thay đổi vào các ổ đĩa **EBS dung lượng nhỏ giá rẻ trong vùng đệm (Staging Area Subnet)** mà **hoàn toàn không khởi chạy bất kỳ máy chủ EC2 đắt tiền nào**. Chỉ khi bạn kích hoạt diễn tập (Drill) hoặc xảy ra sự cố thật (Failover), DRS mới cấp phát máy chủ EC2 mạnh mẽ.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [351 - Disaster Recovery in AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/351%20-%20Disaster%20Recovery%20in%20AWS.md)
  - [352 - Elastic Disaster Recovery (DRS).md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/352%20-%20Elastic%20Disaster%20Recovery%20(DRS).md)
  - [353 - Database Migration Service (DMS).md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/353%20-%20Database%20Migration%20Service%20(DMS).md)
  - [355 - RDS & Aurora Migrations.md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/355%20-%20RDS%20&%20Aurora%20Migrations.md)
  - [357 - AWS Backup.md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/357%20-%20AWS%20Backup.md)
  - [359 - Application Migration Service (MGN).md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/359%20-%20Application%20Migration%20Service%20(MGN).md)
  - [360 - Transferring Large Datasets into AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/28%20-%20Disaster%20Recovery%20&%20Migrations/360%20-%20Transferring%20Large%20Datasets%20into%20AWS.md)
