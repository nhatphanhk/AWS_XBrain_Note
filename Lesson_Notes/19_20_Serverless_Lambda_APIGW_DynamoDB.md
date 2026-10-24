# Ghi Chú Bài Học: Chương 19 & 20 - Điện Toán Phi Máy Chủ & Kiến Trúc Giải Pháp Serverless (Serverless Solutions)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 19 & 20 - Serverless Overviews & Solution Architectures (Bài 208 đến Bài 229)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: AWS Lambda, API Gateway & DynamoDB](file:///n:/AWS_XBrain_Note/AWS_Services/Lambda_Serverless_Architecture.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Cụm chương này trình bày bức tranh toàn cảnh về mô hình kiến trúc phi máy chủ (**Serverless Architecture**): dịch vụ tính toán hướng sự kiện **AWS Lambda** (các giới hạn kỹ thuật, xử lý Cold Start, Concurrency, SnapStart, kết nối mạng VPC, Lambda@Edge), cơ sở dữ liệu NoSQL **Amazon DynamoDB** (mô hình dữ liệu, Partition Key, Sort Key, RCU & WCU, DAX, Streams, Global Tables), cổng quản lý giao diện lập trình **Amazon API Gateway** (REST vs HTTP APIs, caching, throttling, authorizers), dịch vụ điều phối luồng quy trình **AWS Step Functions**, dịch vụ định danh người dùng ứng dụng **Amazon Cognito**, và các mẫu thiết kế giải pháp kiến trúc thực tế (Serverless Mobile Backend, Serverless Website Blog, Microservices Architecture, Software updates distribution).

### Mục tiêu học tập
1. Hiểu bản chất Serverless: không quản lý máy chủ, tự động co giãn theo nhu cầu, chỉ trả tiền khi code chạy.
2. Nắm vững các giới hạn cốt lõi của Lambda (15 phút timeout, 10GB RAM, 10GB `/tmp`).
3. Khắc phục triệt để độ trễ khởi động lạnh (**Cold Start**) bằng Provisioned Concurrency và SnapStart.
4. Cấu hình đúng mạng cho Lambda khi cần truy cập đồng thời database nội bộ trong VPC và API bên ngoài Internet.
5. Thiết kế bảng DynamoDB tối ưu với Primary Key phù hợp và hiểu cơ chế hoạt động của DAX và Global Tables.
6. Kết hợp API Gateway, Lambda, DynamoDB và Cognito thành một kiến trúc Serverless Web App hoàn chỉnh.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Lambda Timeout 15 phút**: Nếu tác vụ chạy lâu hơn 15 phút, bắt buộc phải chia nhỏ thành nhiều bước điều phối qua **AWS Step Functions** hoặc chuyển sang **ECS Fargate/AWS Batch**.
2. **Lambda trong VPC**: Cần đặt vào **Private Subnet** có định tuyến qua **NAT Gateway** ở Public Subnet nếu muốn vừa gọi được RDS nội bộ vừa gọi được Internet bên ngoài.
3. **API Gateway Throttling**: Sử dụng thuật toán Token Bucket (Rate limit và Burst limit) để ngăn chặn tấn công từ chối dịch vụ hoặc quá tải backend; trả về mã lỗi `HTTP 429 Too Many Requests` khi vượt ngưỡng.
4. **DynamoDB Single-digit Millisecond**: Hiệu năng dưới 10ms ở mọi quy mô dữ liệu; thêm **DAX** để đạt độ trễ microsecond.
5. **Cognito User Pools (Authentication)** cấp JWT token; **Cognito Identity Pools (Authorization)** đổi JWT token lấy temporary AWS credentials (STS) để truy cập trực tiếp tài nguyên AWS (như S3/DynamoDB).

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### Các Mẫu Kiến Trúc Giải Pháp Thực Tế (Từ Chương 20):

#### 1. Kiến trúc Ứng dụng Di động Serverless (Mobile App: MyTodoList)
- **Xác thực**: Ứng dụng di động đăng nhập qua **Amazon Cognito User Pool** để nhận JWT tokens.
- **Tải ảnh đại diện**: Ứng dụng gửi JWT token tới **Cognito Identity Pool** để nhận STS credentials tạm thời, cho phép ứng dụng tải trực tiếp ảnh đại diện lên một thư mục riêng trong **Amazon S3** (`s3://my-bucket/users/{user_id}/*`) mà không cần đi qua máy chủ API.
- **Quản lý công việc (CRUD Todos)**: Gọi API qua **Amazon API Gateway** có gắn Cognito Authorizer ➔ kích hoạt **AWS Lambda** ➔ đọc/ghi dữ liệu vào **Amazon DynamoDB**.

#### 2. Kiến trúc Trang Web Serverless (Serverless Website: MyBlog.com)
- **Phân phối nội dung tĩnh**: Mã nguồn HTML, CSS, JavaScript và ảnh lưu trữ tại **Amazon S3 Bucket** riêng tư, phân phối toàn cầu qua **Amazon CloudFront** với cơ chế bảo vệ **OAC (Origin Access Control)**.
- **Tên miền tùy chỉnh**: **Amazon Route 53** sử dụng Alias Record trỏ vào CloudFront Distribution kèm chứng chỉ SSL miễn phí từ **AWS Certificate Manager (ACM)**.
- **Xử lý bình luận và bài viết**: JavaScript trên trình duyệt gọi REST API tới **API Gateway** ➔ **Lambda** ➔ lưu trữ trong **DynamoDB** (hoặc Aurora Serverless).

---

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn đang xây dựng một ứng dụng xử lý tài liệu PDF. Một số tài liệu phức tạp mất khoảng 25 phút để phân tích xong. Bạn có thể sử dụng một hàm AWS Lambda đơn lẻ để thực hiện tác vụ này không? Vì sao?
2. Bạn cấu hình một hàm AWS Lambda gắn vào một Private Subnet của VPC để kết nối với Amazon RDS. Tuy nhiên, hàm Lambda này cũng cần gửi thông báo ra ngoài qua dịch vụ Twilio trên Internet nhưng liên tục bị lỗi Timeout. Nguyên nhân là gì và cách khắc phục?
3. Tính năng nào của Amazon DynamoDB cho phép tự động đồng bộ hóa dữ liệu giữa các bảng ở các AWS Region khác nhau theo mô hình Multi-Region Active-Active?
4. Đâu là sự khác biệt cơ bản giữa Amazon API Gateway HTTP APIs và REST APIs?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. **KHÔNG THỂ**. Vì giới hạn thời gian thực thi tối đa (Execution Timeout) cứng của AWS Lambda là **15 phút (900 giây)**. Bạn phải chuyển tác vụ này sang **AWS Fargate** hoặc **AWS Batch**, hoặc chia nhỏ quy trình thành nhiều bước nhỏ hơn và điều phối bằng **AWS Step Functions**.
2. **Nguyên nhân**: Lambda khi được gắn vào VPC sẽ bị vô hiệu hóa đường ra Internet trực tiếp. **Cách khắc phục**: Cấu hình bảng định tuyến (Route Table) của Private Subnet chứa Lambda có đường dẫn `0.0.0.0/0` trỏ tới một **NAT Gateway** nằm tại Public Subnet (có kết nối ra Internet Gateway).
3. **Amazon DynamoDB Global Tables**.
4. **HTTP APIs** được thiết kế mới hơn, chi phí rẻ hơn tới 71%, độ trễ thấp hơn nhưng chỉ hỗ trợ các tính năng cơ bản; trong khi **REST APIs** hỗ trợ đầy đủ các tính năng doanh nghiệp nâng cao như API Caching, Request Validation, WAF Integration, Usage Plans và API Keys.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [209 - Serverless Introduction.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/209%20-%20Serverless%20Introduction.md)
  - [210 - Lambda Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/210%20-%20Lambda%20Overview.md)
  - [212 - Lambda Limits.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/212%20-%20Lambda%20Limits.md)
  - [213 - Lambda Concurrency.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/213%20-%20Lambda%20Concurrency.md)
  - [215 - Lambda SnapStart.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/215%20-%20Lambda%20SnapStart.md)
  - [217 - Lambda in VPC.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/217%20-%20Lambda%20in%20VPC.md)
  - [219 - Amazon DynamoDB.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/219%20-%20Amazon%20DynamoDB.md)
  - [221 - Amazon DynamoDB - Advanced Features.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/221%20-%20Amazon%20DynamoDB%20-%20Advanced%20Features.md)
  - [222 - API Gateway Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/222%20-%20API%20Gateway%20Overview.md)
  - [224 - Step Functions.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/224%20-%20Step%20Functions.md)
  - [225 - Amazon Cognito Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/19%20-%20Serverless%20Overviews%20from%20a%20So/225%20-%20Amazon%20Cognito%20Overview.md)
  - [226 - Mobile Application_ MyTodoList.md](file:///n:/AWS_XBrain_Note/AWS_Resources/20%20-%20Serverless%20Solution%20Architectu/226%20-%20Mobile%20Application_%20MyTodoList.md)
  - [227 - Serverless Website_ MyBlog.com.md](file:///n:/AWS_XBrain_Note/AWS_Resources/20%20-%20Serverless%20Solution%20Architectu/227%20-%20Serverless%20Website_%20MyBlog.com.md)
