# Ghi Chú Bài Học: Chương 30 - Các Dịch Vụ Bổ Trợ & Tự Động Hóa Hạ Tầng (Other Services)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 30 - Other Services (Bài 367 đến Bài 381)  
> **Tài liệu tham chiếu liên quan**: [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](file:///n:/AWS_XBrain_Note/GLOSSARY.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này bao quát các dịch vụ bổ trợ quan trọng hoàn thiện hệ sinh thái đám mây AWS: công cụ quản lý hạ tầng dưới dạng mã nguồn **AWS CloudFormation** (Stacks, Change Sets, Service Roles, Drift Detection), dịch vụ gửi email doanh nghiệp quy mô lớn **Amazon SES**, nền tảng tiếp thị truyền thông khách hàng đa kênh **Amazon Pinpoint**, bộ công cụ quản trị máy chủ **AWS Systems Manager (SSM)** (Session Manager, Patch Manager, Run Command, Parameter Store), công cụ phân tích và dự báo chi phí **AWS Cost Explorer** và **Cost Anomaly Detection**, phần cứng mở rộng trung tâm dữ liệu tại chỗ **AWS Outposts**, xử lý tác vụ tính toán hàng loạt **AWS Batch**, dịch vụ tích hợp dữ liệu SaaS không cần mã **Amazon AppFlow**, nền tảng phát triển ứng dụng web/mobile trọn gói **AWS Amplify**, và giải pháp tự động bật/tắt máy ảo theo lịch trình **AWS Instance Scheduler**.

### Mục tiêu học tập
1. Nắm vững nguyên lý Infrastructure as Code (IaC) thông qua AWS CloudFormation.
2. Hiểu cách sử dụng **SSM Session Manager** để truy cập shell an toàn không cần SSH key hay mở port 22.
3. Phân tích chi phí và phát hiện bất thường chi tiêu bằng AWS Cost Explorer và Cost Anomaly Detection.
4. Lựa chọn đúng dịch vụ gửi email giao dịch (SES) so với dịch vụ tiếp thị chiến dịch (Pinpoint).

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **AWS CloudFormation**: Dịch vụ IaC khai báo bằng JSON hoặc YAML; quản trị tài nguyên theo **Stacks**; sử dụng **Change Sets** để xem trước tác động trước khi cập nhật; phát hiện sai lệch cấu hình thủ công qua **Drift Detection**.
2. **SSM Session Manager**: Đăng nhập terminal vào máy ảo EC2 trực tiếp từ trình duyệt; **không cần mở cổng 22**, không cần Public IP, không cần Bastion Host; toàn bộ thao tác được kiểm toán đẩy về S3/CloudWatch.
3. **AWS Cost Explorer**: Trực quan hóa và phân tích chi phí lịch sử (lên tới 12 tháng) và dự báo chi tiêu trong 12 tháng tới; phân tích sâu dựa trên các **Cost Allocation Tags**.
4. **AWS Cost Anomaly Detection**: Ứng dụng học máy để liên tục theo dõi mô hình chi tiêu và gửi cảnh báo tức thì qua email hoặc Slack khi có sự tăng đột biến chi phí ngoài ý muốn.
5. **AWS Outposts**: Cung cấp nguyên vẹn tủ rack máy chủ vật lý của AWS đặt ngay trong phòng máy trung tâm dữ liệu On-Premises của khách hàng để đáp ứng yêu cầu độ trễ cực thấp hoặc tuân thủ dữ liệu nội bộ.
6. **AWS Batch**: Tự động cấp phát số lượng máy ảo EC2 (hoặc Spot Instances/Fargate) phù hợp nhất để xử lý hàng ngàn tác vụ tính toán hàng loạt (Batch jobs) và tự động tắt máy khi hoàn tất.

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [368 - CloudFormation Intro.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/368%20-%20CloudFormation%20Intro.md)
  - [370 - CloudFormation - Service Role.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/370%20-%20CloudFormation%20-%20Service%20Role.md)
  - [371 - Amazon SES.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/371%20-%20Amazon%20SES.md)
  - [373 - SSM Session Manager.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/373%20-%20SSM%20Session%20Manager.md)
  - [375 - AWS Cost Explorer.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/375%20-%20AWS%20Cost%20Explorer.md)
  - [376 - AWS Cost Anomaly Detection.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/376%20-%20AWS%20Cost%20Anomaly%20Detection.md)
  - [377 - AWS Outposts.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/377%20-%20AWS%20Outposts.md)
  - [378 - AWS Batch.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/378%20-%20AWS%20Batch.md)
  - [381 - Instance Scheduler on AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/30%20-%20Other%20Services/381%20-%20Instance%20Scheduler%20on%20AWS.md)
