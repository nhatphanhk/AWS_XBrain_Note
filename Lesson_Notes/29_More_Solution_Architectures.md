# Ghi Chú Bài Học: Chương 29 - Các Mẫu Kiến Trúc Giải Pháp Chuyên Sâu (More Solution Architectures)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 29 - More Solution Architectures (Bài 362 đến Bài 366)  
> **Tài liệu tham chiếu liên quan**: [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](file:///n:/AWS_XBrain_Note/GLOSSARY.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này tổng kết và phân tích 5 mẫu kiến trúc chuyên sâu thường xuyên xuất hiện trong các bài thi chứng chỉ AWS Certified Solutions Architect và thực tế vận hành hệ thống quy mô lớn:
1. **Xử lý sự kiện quy mô lớn (Event Processing in AWS)**: So sánh giữa SQS, SNS, Kinesis và S3 Event Notifications.
2. **Chiến lược bộ nhớ đệm toàn diện (Caching Strategies in AWS)**: Caching ở mọi tầng kiến trúc (CloudFront tại Edge ➔ API Gateway Caching ➔ ElastiCache tại Web/App Tier ➔ DAX tại DynamoDB ➔ RDS Read Replicas tại Database Tier).
3. **Các kỹ thuật chặn địa chỉ IP xấu (Blocking an IP Address in AWS)**: Chặn ở tầng Network ACL (VPC Subnet) vs Chặn ở tầng AWS WAF (ALB/CloudFront/API Gateway).
4. **Điện toán hiệu năng cao (High Performance Computing - HPC on AWS)**: Cluster Placement Groups, Elastic Fabric Adapter (EFA), AWS Batch, FSx for Lustre.
5. **Độ sẵn sàng cao cho máy chủ ảo đơn lẻ (EC2 Instance High Availability)**: Tự động phục hồi máy ảo bằng CloudWatch Alarm Auto-Recovery kết hợp Elastic IP và EBS.

### Mục tiêu học tập
1. Nắm vững ma trận đa tầng bộ nhớ đệm (Caching at All Layers) để tối ưu hóa độ trễ và giảm thiểu chi phí.
2. Phân biệt được sự khác nhau giữa việc chặn IP bằng **Network ACL** và chặn bằng **AWS WAF**.
3. Hiểu các thành phần công nghệ tạo nên một cụm máy tính hiệu năng cao (HPC) trên AWS.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Chiến lược Caching Đa Tầng**:
   - *Tầng Biên (Edge)*: **Amazon CloudFront** (cache nội dung tĩnh và động).
   - *Tầng API*: **Amazon API Gateway Caching** (cache kết quả của các lượt gọi API).
   - *Tầng Ứng dụng*: **Amazon ElastiCache** (Redis/Memcached) lưu session và kết quả truy vấn database.
   - *Tầng Cơ sở dữ liệu*: **DynamoDB Accelerator (DAX)** cho NoSQL hoặc bộ nhớ buffer pool của **RDS/Aurora**.
2. **So sánh chặn IP xấu: NACL vs AWS WAF**:
   - **Network ACL**: Miễn phí; hoạt động ở Tầng mạng Layer 4; chỉ áp dụng được cho tài nguyên bên trong VPC; tối đa 20-40 rules; **chặn IP trước khi gói tin chạm vào máy ảo**.
   - **AWS WAF**: Có tính phí; hoạt động ở Tầng ứng dụng Layer 7 (CloudFront, ALB, API Gateway); hỗ trợ danh sách hàng ngàn IP (**IP Sets**); hỗ trợ phân tích nội dung HTTP (SQLi, XSS, User-Agent, Rate Limiting).
3. **High Performance Computing (HPC)**:
   - Dùng **Cluster Placement Group** (cùng rack vật lý, độ trễ < 1ms).
   - Dùng card mạng **EFA (Elastic Fabric Adapter)** hỗ trợ giao thức OS-bypass (Message Passing Interface - MPI).
   - Dùng hệ thống tệp chia sẻ siêu tốc **Amazon FSx for Lustre** (hàng triệu IOPS).

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [362 - Event Processing in AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/29%20-%20More%20Solution%20Architectures/362%20-%20Event%20Processing%20in%20AWS.md)
  - [363 - Caching Strategies in AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/29%20-%20More%20Solution%20Architectures/363%20-%20Caching%20Strategies%20in%20AWS.md)
  - [364 - Blocking an IP Address in AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/29%20-%20More%20Solution%20Architectures/364%20-%20Blocking%20an%20IP%20Address%20in%20AWS.md)
  - [365 - High Performance Computing (HPC) on AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/29%20-%20More%20Solution%20Architectures/365%20-%20High%20Performance%20Computing%20(HPC)%20on%20AWS.md)
  - [366 - EC2 Instance High Availability.md](file:///n:/AWS_XBrain_Note/AWS_Resources/29%20-%20More%20Solution%20Architectures/366%20-%20EC2%20Instance%20High%20Availability.md)
