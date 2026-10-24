# Ghi Chú Bài Học: Chương 18 - Công Nghệ Đóng Gói Container Với Amazon ECS, Fargate & EKS (Containers on AWS)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 18 - Containers on AWS: ECS, Fargate, ECR, EKS (Bài 198 đến Bài 207)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon ECS, Fargate & Containers](file:///n:/AWS_XBrain_Note/AWS_Services/ECS_Fargate_Containers.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này trang bị kiến thức chuyên sâu về công nghệ đóng gói ứng dụng bằng **Docker Container** và các nền tảng điều phối container hàng đầu trên AWS: dịch vụ điều phối container độc quyền **Amazon Elastic Container Service (Amazon ECS)**, động cơ phi máy chủ **AWS Fargate**, kho lưu trữ ảnh container **Amazon Elastic Container Registry (Amazon ECR)**, và nền tảng Kubernetes được quản lý **Amazon Elastic Kubernetes Service (Amazon EKS)**.

### Mục tiêu học tập
1. Hiểu lợi ích của Docker Container: tính cô lập, khả năng tái tạo môi trường nhất quán từ local đến cloud.
2. Nắm vững các thành phần trong ECS: **ECS Cluster**, **Task Definition**, **Task**, và **ECS Service**.
3. Phân biệt được sự khác nhau giữa **EC2 Launch Type** (tự quản trị cụm máy ảo) và **AWS Fargate** (Serverless, không cần quản lý máy ảo).
4. Phân biệt chính xác giữa **Task Execution Role** (cấp quyền cho ECS Agent kéo ảnh/đẩy log) và **Task Role** (cấp quyền cho mã nguồn ứng dụng).
5. Hiểu cơ chế ánh xạ cổng động (**Dynamic Port Mapping**) khi kết hợp ECS với **Application Load Balancer (ALB)**.
6. Hiểu kiến trúc Kubernetes trên AWS thông qua dịch vụ **Amazon EKS**.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Fargate = Serverless**: Không cần vá lỗi hệ điều hành, không quản lý EC2 cluster, chỉ trả tiền cho vCPU và RAM thực tế của Task.
2. **Task Execution Role vs Task Role**:
   - *Task Execution Role*: Kéo ảnh từ ECR, ghi log vào CloudWatch, lấy mật khẩu từ Secrets Manager.
   - *Task Role*: Cấp quyền cho code bên trong container gọi các API của AWS (S3, DynamoDB, SQS).
3. **Dynamic Port Mapping**: Để `Host Port = 0` trong Task Definition; Docker tự cấp cổng ngẫu nhiên (32768-61000) trên EC2; ALB tự động nhận biết cổng này để định tuyến.
4. **Lưu trữ chia sẻ**: Gắn **Amazon EFS** vào ECS Task/Fargate khi ứng dụng cần lưu trữ dữ liệu bền vững đa AZ.
5. **ECS vs EKS**: ECS đơn giản, miễn phí Control Plane; EKS chuẩn mực Kubernetes mã nguồn mở cho doanh nghiệp lớn đa đám mây (phí Control Plane 0.10$/h).

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Cấu trúc một ECS Task Definition JSON
- Chứa các thông tin cốt lõi:
  - `family`: Tên định danh của Task Definition.
  - `networkMode`: Thường là `awsvpc` (mỗi task nhận 1 card mạng ENI riêng và 1 Private IP riêng trong subnet).
  - `requiresCompatibilities`: `["FARGATE"]` hoặc `["EC2"]`.
  - `cpu` & `memory`: Dung lượng cấp phát (ví dụ: `256` (.25 vCPU) và `512` (0.5 GB RAM)).
  - `containerDefinitions`: Tên container, đường dẫn ảnh ECR, biến môi trường, port mappings, mount points, log configuration.

### 2. Amazon ECR (Elastic Container Registry)
- Kho lưu trữ riêng tư (Private) hoặc công khai (Public).
- **Image Scanning**: Tự động quét tìm các lỗ hổng an ninh đã biết (CVEs) trong các thư viện của Docker image ngay khi bạn đẩy ảnh lên.
- **Lifecycle Policies**: Tự động dọn dẹp các image cũ không dùng (ví dụ: chỉ giữ lại 10 image mới nhất hoặc xóa các image không được gắn tag sau 30 ngày) để tiết kiệm chi phí lưu trữ.

---

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn đang thiết kế một kiến trúc microservices chạy hàng trăm container Docker trên AWS. Đội ngũ kỹ thuật không muốn mất thời gian cài đặt, nâng cấp OS, cấu hình dung lượng máy chủ hay lo lắng về việc vá lỗi bảo mật phần cứng. Bạn nên chọn kiến trúc nào?
2. Trong Amazon ECS, role nào chịu trách nhiệm cho phép ECS agent đăng nhập vào Amazon ECR để kéo ảnh Docker về máy?
3. Khi bạn chạy nhiều bản sao (tasks) của một dịch vụ trên cùng một máy chủ EC2 nằm phía sau một Application Load Balancer, làm thế nào để tránh việc các container bị xung đột cùng lắng nghe trên cổng 80?
4. Đâu là giải pháp lưu trữ dữ liệu bền vững (Persistent Storage) được khuyến nghị sử dụng khi các container chạy trên **AWS Fargate** cần chia sẻ chung một hệ thống tệp tin?
5. Một kỹ sư DevOps muốn debug một container đang gặp sự cố chạy trên AWS Fargate bằng cách mở bash shell trực tiếp vào trong container mà không cần mở cổng SSH. Tính năng nào của ECS giải quyết được việc này?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Sử dụng **Amazon ECS (hoặc Amazon EKS) kết hợp với AWS Fargate Launch Type**.
2. **ECS Task Execution Role**.
3. Cấu hình tính năng **Dynamic Port Mapping**: Đặt `Host Port = 0` trong Task Definition để Docker tự cấp phát cổng ngẫu nhiên (Ephemeral Ports) trên EC2, và Application Load Balancer sẽ tự động đăng ký cổng động này vào Target Group.
4. **Amazon Elastic File System (Amazon EFS)**.
5. Tính năng **Amazon ECS Exec** (sử dụng kênh điều khiển bảo mật của AWS Systems Manager Session Manager).
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [198 - Docker Introduction.md](file:///n:/AWS_XBrain_Note/AWS_Resources/18%20-%20Containers%20on%20AWS_%20ECS,%20Fargat/198%20-%20Docker%20Introduction.md)
  - [199 - Amazon ECS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/18%20-%20Containers%20on%20AWS_%20ECS,%20Fargat/199%20-%20Amazon%20ECS.md)
  - [202 - Amazon ECS - Auto Scaling.md](file:///n:/AWS_XBrain_Note/AWS_Resources/18%20-%20Containers%20on%20AWS_%20ECS,%20Fargat/202%20-%20Amazon%20ECS%20-%20Auto%20Scaling.md)
  - [203 - Amazon ECS - Solutions Architectures.md](file:///n:/AWS_XBrain_Note/AWS_Resources/18%20-%20Containers%20on%20AWS_%20ECS,%20Fargat/203%20-%20Amazon%20ECS%20-%20Solutions%20Architectures.md)
  - [205 - Amazon ECR.md](file:///n:/AWS_XBrain_Note/AWS_Resources/18%20-%20Containers%20on%20AWS_%20ECS,%20Fargat/205%20-%20Amazon%20ECR.md)
  - [206 - Amazon EKS - Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/18%20-%20Containers%20on%20AWS_%20ECS,%20Fargat/206%20-%20Amazon%20EKS%20-%20Overview.md)
