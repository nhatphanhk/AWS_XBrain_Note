# Ghi Chú Bài Học: Chương 17 - Tách Rời Ứng Dụng Với SQS, SNS, Kinesis & Amazon MQ (Decoupling Applications)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 17 - Decoupling applications: SQS, SNS, Kinesis, ActiveMQ (Bài 182 đến Bài 197)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon SQS, SNS & Decoupling](file:///n:/AWS_XBrain_Note/AWS_Services/SQS_SNS_EventBridge_Decoupling.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này đi sâu vào các giải pháp kiến trúc hướng thông điệp (**Messaging**) và kiến trúc hướng sự kiện (**Event-Driven**) trên AWS: khái niệm hàng đợi thông điệp **Amazon SQS** (hàng đợi Standard vs FIFO, thời gian Visibility Timeout, cơ chế Long Polling, hàng đợi lỗi Dead-Letter Queue), dịch vụ thông báo xuất bản/đăng ký **Amazon SNS** và mô hình **Fan-Out Pattern**, nền tảng xử lý luồng dữ liệu thời gian thực **Amazon Kinesis Data Streams & Amazon Data Firehose**, và dịch vụ môi giới tin nhắn chuẩn công nghiệp **Amazon MQ** (ActiveMQ & RabbitMQ).

### Mục tiêu học tập
1. Hiểu nguyên lý tách rời ứng dụng (Decoupling) để ngăn chặn hiện tượng sập hệ thống dây chuyền khi quá tải.
2. Nắm vững cơ chế hoạt động của SQS: Visibility Timeout, Long Polling, và xử lý tin nhắn lỗi qua Dead-Letter Queue (DLQ).
3. Phân biệt được sự khác nhau giữa **SQS Standard** (tốc độ cao, at-least-once) và **SQS FIFO** (đúng thứ tự, exactly-once).
4. Thiết kế mô hình **Fan-Out Pattern** kết hợp giữa SNS và nhiều SQS queues để phục vụ kiến trúc vi dịch vụ (Microservices).
5. Phân biệt chính xác giữa **Kinesis Data Streams** (Custom real-time processing) và **Amazon Data Firehose** (Near real-time nạp dữ liệu tự động vào S3/Redshift).

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **SQS là mô hình PULL (Consumer chủ động lấy tin)**; lưu giữ tin nhắn tối đa **14 ngày**.
2. **SNS là mô hình PUSH (Chủ động đẩy tin tới subscriber)**; không lưu giữ tin nhắn (tin nhắn không có người nhận sẽ biến mất ngay).
3. **Visibility Timeout (Mặc định 30 giây)**: Ẩn tin nhắn khỏi các worker khác khi 1 worker đang xử lý; nếu worker không kịp xóa tin, tin nhắn sẽ hiện lại.
4. **Long Polling (Tối đa 20 giây)**: Luôn luôn cấu hình để giảm chi phí gọi API SQS rỗng và tăng tốc độ xử lý.
5. **Fan-Out Pattern**: 1 SNS Topic phát tán đồng thời tới hàng loạt hàng đợi SQS để xử lý song song độc lập.
6. **Kinesis Data Streams**: Chia nhỏ theo Shards; dữ liệu lưu từ 1 đến 365 ngày; nhiều ứng dụng đọc lại độc lập.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Phân tích sâu về SQS FIFO Queues
- **Deduplication (Chống trùng lặp)**: Hoạt động trong khoảng thời gian **5 phút**. Có 2 cơ chế:
  - *Content-based Deduplication*: AWS tự tạo mã băm SHA-256 từ nội dung body của tin nhắn để phát hiện trùng.
  - *Message Deduplication ID*: Do bên gửi tự tạo mã ID duy nhất cho mỗi giao dịch.
- **Message Group ID (Nhóm tin nhắn)**:
  - Tất cả các tin nhắn có chung một `MessageGroupID` sẽ được đảm bảo xử lý theo đúng thứ tự FIFO tuần tự nghiêm ngặt bởi duy nhất một worker tại một thời điểm.
  - Cho phép phân luồng xử lý song song giữa các nhóm khách hàng khác nhau: ví dụ khách hàng A và khách hàng B có MessageGroupID khác nhau thì các đơn hàng của khách hàng A và B có thể được xử lý song song đồng thời bởi 2 workers khác nhau mà vẫn đảm bảo thứ tự riêng của từng người.

### 2. SQS kết hợp Auto Scaling Groups
- Khi lượng truy cập của người dùng tăng đột biến, số lượng tin nhắn trong SQS sẽ tăng nhanh.
- Thiết lập CloudWatch Alarm theo dõi metric:
  **`ApproximateNumberOfMessagesVisible`**
- Viết chính sách **Target Tracking Scaling Policy** dựa trên tỷ lệ: `Số tin nhắn / Số máy chủ EC2`. Khi số lượng tin nhắn chờ trên mỗi máy chủ vượt quá ngưỡng định trước (ví dụ: > 50 tin/máy), ASG sẽ tự động khởi chạy thêm máy chủ worker để giải phóng hàng đợi nhanh chóng.

---

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Một ứng dụng xử lý ảnh nhận tệp tin từ người dùng và mất khoảng 90 giây để xử lý xong một bức ảnh. Tuy nhiên, lập trình viên nhận thấy ảnh thường xuyên bị xử lý lặp lại 3 lần bởi 3 máy chủ khác nhau. Bạn nên điều chỉnh thông số cấu hình nào của hàng đợi SQS?
2. Bạn cần thiết kế một hệ thống trong đó khi người dùng hoàn tất thanh toán giỏ hàng, thông tin đơn hàng phải được gửi đồng thời tới: (1) Hệ thống xuất hóa đơn điện tử; (2) Hệ thống thông báo kho vận; (3) Hệ thống gửi email cảm ơn. Mỗi hệ thống có tốc độ xử lý khác nhau và nếu một hệ thống gặp sự cố thì không được làm ảnh hưởng đến các hệ thống còn lại. Mô hình kiến trúc nào giải quyết bài toán này?
3. Sự khác nhau giữa **Amazon Kinesis Data Streams** và **Amazon Data Firehose** là gì?
4. Doanh nghiệp của bạn đang chuyển dịch một ứng dụng monolithic viết bằng Java chạy trên máy chủ vật lý đang sử dụng giao thức JMS với Apache ActiveMQ. Họ muốn di chuyển lên AWS nhanh nhất mà không cần viết lại mã nguồn sang SQS/SNS. Dịch vụ nào là giải pháp phù hợp nhất?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Điều chỉnh tăng giá trị **Message Visibility Timeout** của hàng đợi SQS từ giá trị mặc định (30 giây) lên mức tối thiểu **120 hoặc 180 giây** (lớn hơn thời gian xử lý thực tế 90 giây của ứng dụng) để tin nhắn không bị hiện lại khi máy chủ đầu tiên vẫn đang xử lý.
2. Áp dụng mô hình **Fan-Out Pattern**: Ứng dụng thanh toán phát thông tin đơn hàng vào một **Amazon SNS Topic**. Tạo 3 hàng đợi **Amazon SQS** riêng biệt cho 3 hệ thống (Hóa đơn, Kho vận, Email) và đăng ký cả 3 hàng đợi này làm Subscriber của SNS Topic đó.
3. **Kinesis Data Streams** là dịch vụ xử lý dữ liệu luồng theo thời gian thực (Real-time), lưu giữ dữ liệu từ 1-365 ngày và yêu cầu bạn tự quản lý Shards cùng mã nguồn consumer; trong khi **Amazon Data Firehose** là dịch vụ Serverless hoàn toàn, tự động co giãn, gom nhóm dữ liệu (Near real-time) và tự động nạp thẳng vào các đích lưu trữ như S3, Redshift mà không cần viết mã consumer.
4. **Amazon MQ** (cung cấp dịch vụ Apache ActiveMQ và RabbitMQ được quản lý hoàn toàn trên AWS, hỗ trợ đầy đủ các giao thức JMS, AMQP, STOMP).
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [183 - Amazon SQS - Standard Queues Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/183%20-%20Amazon%20SQS%20-%20Standard%20Queues%20Overview.md)
  - [185 - SQS - Message Visibility Timeout.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/185%20-%20SQS%20-%20Message%20Visibility%20Timeout.md)
  - [186 - SQS - Long Polling.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/186%20-%20SQS%20-%20Long%20Polling.md)
  - [187 - SQS - FIFO Queues.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/187%20-%20SQS%20-%20FIFO%20Queues.md)
  - [189 - Amazon Simple Notification Service (AWS SNS).md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/189%20-%20Amazon%20Simple%20Notification%20Service%20(AWS%20SNS).md)
  - [190 - SNS and SQS - Fan Out Pattern.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/190%20-%20SNS%20and%20SQS%20-%20Fan%20Out%20Pattern.md)
  - [192 - Amazon Kinesis Data Streams.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/192%20-%20Amazon%20Kinesis%20Data%20Streams.md)
  - [194 - Amazon Data Firehose.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/194%20-%20Amazon%20Data%20Firehose.md)
  - [197 - Amazon MQ.md](file:///n:/AWS_XBrain_Note/AWS_Resources/17%20-%20Decoupling%20applications_%20SQS,/197%20-%20Amazon%20MQ.md)
