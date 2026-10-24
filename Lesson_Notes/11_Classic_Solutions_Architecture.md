# Ghi Chú Bài Học: Chương 11 - Các Mẫu Thiết Kế Kiến Trúc Kinh Điển & AWS Elastic Beanstalk (Classic Solutions Architecture)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 11 - Classic Solutions Architecture (Bài 121 đến Bài 127)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: ELB & Auto Scaling Groups](file:///n:/AWS_XBrain_Note/AWS_Services/ELB_and_ASG_High_Availability.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này tổng hợp các kiến thức đã học ở các chương trước vào các bài toán thiết kế kiến trúc thực chiến thông qua 3 case studies kinh điển:
1. **WhatsTheTime.com**: Ứng dụng phi trạng thái (Stateless) tối ưu chi phí từ 1 máy ảo tới cụm co giãn đa AZ.
2. **MyClothes.com**: Ứng dụng thương mại điện tử có trạng thái (Stateful) với bài toán giỏ hàng (Shopping Cart) và giải pháp chuyển đổi từ Sticky Sessions sang cụm lưu trữ phân tán (ElastiCache / DynamoDB).
3. **MyWordPress.com**: Ứng dụng web đa tầng hoàn chỉnh sử dụng Amazon EFS để chia sẻ tệp tin media giữa các máy chủ web phân tán.
4. **AWS Elastic Beanstalk**: Dịch vụ nền tảng (Platform as a Service - PaaS) tự động hóa việc cấp phát, cân bằng tải, co giãn và giám sát ứng dụng web.

### Mục tiêu học tập
1. Áp dụng tư duy thiết kế phi trạng thái (**Stateless Architecture**) để co giãn quy mô web không giới hạn.
2. Giải quyết bài toán lưu trữ phiên làm việc của người dùng (**Session Management**) bằng ElastiCache Redis.
3. Nắm vững cách kết nối cụm máy chủ web với hệ thống tệp tin dùng chung Amazon EFS.
4. Hiểu bản chất hoạt động của **AWS Elastic Beanstalk** và các chiến lược triển khai cập nhật phiên bản ứng dụng (All-at-once, Rolling, Rolling with additional batch, Immutable, Blue/Green).

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **WhatsTheTime.com (Stateless Web Tier)**: Người dùng gọi vào Route 53 (Alias) ➔ ALB ➔ Auto Scaling Group trên 2 AZs ➔ máy chủ không lưu bất kỳ trạng thái nào trong RAM/đĩa cục bộ, cho phép bật/tắt máy ảo tùy ý.
2. **MyClothes.com (Lưu trữ giỏ hàng Stateful)**:
   - *Cách 1 (Tạm thời)*: Bật **Sticky Sessions** trên ALB (rủi ro: nếu máy ảo chết, giỏ hàng của người dùng bị mất).
   - *Cách 2 (Trình duyệt)*: Lưu giỏ hàng trong **Web Cookies** (rủi ro: bảo mật kém, dung lượng cookie bị giới hạn 4KB, request HTTP bị phình to).
   - *Cách 3 (Chuẩn mực kiến trúc)*: Lưu Session Data vào **Amazon ElastiCache Redis** hoặc **Amazon DynamoDB**. Máy chủ web trở thành phi trạng thái hoàn toàn, người dùng có thể gửi request tới bất kỳ máy chủ nào mà giỏ hàng vẫn còn nguyên vẹn.
3. **MyWordPress.com (Shared File Storage)**: Dùng **Amazon EFS** làm ổ lưu trữ chung cho thư mục `/wp-content/uploads` và cơ sở dữ liệu dùng **Amazon RDS Multi-AZ**.
4. **AWS Elastic Beanstalk**: Bạn chỉ cần tải mã nguồn lên (Java, Python, Node.js, PHP, Docker), Beanstalk tự động xử lý toàn bộ việc dựng EC2, cấu hình ASG, ALB, RDS, và giám sát CloudWatch.

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [122 - WhatsTheTime.com.md](file:///n:/AWS_XBrain_Note/AWS_Resources/11%20-%20Classic%20Solutions%20Architecture/122%20-%20WhatsTheTime.com.md)
  - [123 - MyClothes.com.md](file:///n:/AWS_XBrain_Note/AWS_Resources/11%20-%20Classic%20Solutions%20Architecture/123%20-%20MyClothes.com.md)
  - [124 - MyWordPress.com.md](file:///n:/AWS_XBrain_Note/AWS_Resources/11%20-%20Classic%20Solutions%20Architecture/124%20-%20MyWordPress.com.md)
  - [126 - Beanstalk Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/11%20-%20Classic%20Solutions%20Architecture/126%20-%20Beanstalk%20Overview.md)
