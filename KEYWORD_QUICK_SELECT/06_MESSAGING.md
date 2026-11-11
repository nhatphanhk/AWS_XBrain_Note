# 06 — MESSAGING KEYWORDS: SQS, SNS, EventBridge, Kinesis, MQ

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ MESSAGING & DECOUPLING

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon SQS** | Hàng đợi tin nhắn phân tán serverless (Message Queue) hoạt động theo mô hình kéo (**Pull-based**). | Tách rời các tầng ứng dụng (Decouple), làm bộ đệm chống tràn tải (Buffer), bảo vệ database phía sau không bị sập. | *"Hàng chờ lấy số thứ tự ở ngân hàng: Khách đông mấy cũng đứng xếp hàng, giao dịch viên xử lý dần."* |
| **Amazon SNS** | Dịch vụ thông báo đẩy theo mô hình Nhà xuất bản - Người đăng ký (**Pub/Sub Push-based**). | Phát tán 1 tin nhắn đồng thời tới nhiều đích (**Fan-out** tới nhiều SQS, Lambda, HTTP, Email, SMS). | *"Loa phát thanh phường: Phát thanh 1 câu là cả ngõ ai cắm tai nghe (Subscriber) đều nghe thấy."* |
| **Amazon EventBridge** | Xe buýt sự kiện phi máy chủ (**Serverless Event Bus**) hiện đại, lọc và định tuyến sự kiện JSON thời gian thực. | Kết nối các dịch vụ AWS, ứng dụng SaaS (Salesforce, Shopify) và microservices nội bộ; có Scheduler thay thế cron jobs. | *"Bưu điện phân loại bưu phẩm tự động: Nhìn địa chỉ trên bưu kiện JSON rồi chuyển thẳng đến đúng nhà xe."* |
| **Kinesis Data Streams** | Nền tảng hấp thụ luồng dữ liệu lớn thời gian thực, lưu trữ và **cho phép phát lại (Replay)** từ 24h đến 365 ngày. | Hấp thụ hàng triệu sự kiện telemetry/clickstream mỗi giây từ IoT, web analytics; chia nhỏ công suất theo Shards. | *"Đập thủy điện trữ nước: Giữ nước lại trong hồ để tua-bin chạy qua chạy lại phát điện nhiều lần."* |
| **Kinesis Data Firehose**| Dịch vụ trích xuất và nạp dữ liệu luồng tự động (Streaming ETL Delivery) dạng Serverless hoàn toàn. | Tự động buffer, chuyển định dạng (Parquet) và đổ thẳng luồng dữ liệu vào **S3, Redshift, OpenSearch, Splunk** không cần code. | *"Vòi rồng cứu hỏa: Cứ có nước là xịt thẳng vào bồn chứa (S3/Redshift), không giữ lại giọt nào."* |
| **AWS Step Functions** | Dịch vụ điều phối luồng công việc serverless (Visual State Machine). | Kết hợp nhiều dịch vụ (Lambda, ECS, SQS, DynamoDB) thành quy trình nghiệp vụ có logic rẽ nhánh, thử lại và chờ người duyệt. | *"Tổng đạo diễn sân khấu: Chỉ đạo diễn viên nào ra trước, diễn viên nào ra sau theo đúng kịch bản."* |
| **Amazon MQ** | Dịch vụ Message Broker được quản lý hỗ trợ các giao thức chuẩn: **JMS, AMQP, MQTT, STOMP** (ActiveMQ/RabbitMQ). | Di chuyển ứng dụng cũ (Lift-and-Shift) từ On-Premises lên đám mây mà **nghiêm cấm sửa code ứng dụng**. | *"Người phiên dịch trung thành: Giữ nguyên tiếng mẹ đẻ (JMS/AMQP) cho các cụ ứng dụng cao tuổi."* |
| **Amazon AppFlow** | Dịch vụ truyền tải dữ liệu luồng lớn 2 chiều không cần viết code (**No-code**) giữa SaaS và AWS qua PrivateLink. | Kéo hàng triệu bản ghi từ Salesforce, ServiceNow, Zendesk đổ thẳng vào S3 hoặc Redshift an toàn. | *"Đoàn tàu chở quặng riêng: Vận chuyển cả mỏ dữ liệu Salesforce về kho S3 trên đường ray bí mật."* |

---

## 📬 SQS — STANDARD vs FIFO

| Tiêu Chí | SQS Standard | SQS FIFO | 💡 Vì Sao Chọn & Ngữ Cảnh |
|:---|:---|:---|:---|
| **Thông lượng (Throughput)** | **Gần như vô hạn** (Unlimited) | 300 msg/s (3,000 msg/s nếu batching) | Cần throughput cao, tải hàng chục ngàn msg/s $\rightarrow$ Standard. |
| **Thứ tự tin nhắn (Ordering)** | Thứ tự ngẫu nhiên (Best-effort) | **First-In-First-Out nghiêm ngặt** | Giao dịch tài chính, đổi trạng thái đơn hàng (Created $\rightarrow$ Paid $\rightarrow$ Shipped) $\rightarrow$ FIFO. |
| **Độ tin cậy chuyển giao** | At-least-once (có thể gửi trùng) | **Exactly-once** (chống trùng lặp tuyệt đối) | FIFO dùng `MessageDeduplicationId` chống gửi lặp trong cửa sổ 5 phút. |
| **Định danh nhóm** | Không có | Bắt buộc có **`MessageGroupId`** | Tin nhắn cùng `MessageGroupId` sẽ được xử lý tuần tự nghiêm ngặt bởi 1 consumer. |

### 🛠️ Các Thông Số Sống Còn Của SQS Cần Nhớ Trong Đề Thi

| Thuật Ngữ / Tham Số | Giá Trị Chuẩn | 💡 Vì Sao & Ngữ Cảnh Thực Chiến |
|:---|:---|:---|
| **Visibility Timeout** | Mặc định 30s, tối đa 12h | Khoảng thời gian tin nhắn "vô hình" sau khi 1 consumer lấy ra xử lý. Nếu xử lý lâu hơn mặc định, consumer phải gọi API `ChangeMessageVisibility` để tránh worker khác lấy xử lý trùng. |
| **Long Polling** | `WaitTimeSeconds` từ 1–20s | Consumer giữ kết nối mở chờ tin nhắn mới tới $\rightarrow$ **Giảm 90% số lượng request rỗng**, tiết kiệm chi phí tối đa so với Short Polling (0s). |
| **Dead-Letter Queue (DLQ)** | Gắn sau `maxReceiveCount` (thường 3–5 lần) | Nơi cách ly các tin nhắn lỗi ("Poison Pill"). Giúp worker fleet không bị crash lặp đi lặp lại làm tắc nghẽn cả hàng đợi. |
| **Extended Client Library** | Tối đa 2 GB (qua S3) | Kích thước tối đa tin nhắn SQS trực tiếp là **256 KB**. Muốn gửi tin nhắn lớn hơn (ảnh, PDF), dùng SQS Extended Client lưu payload vào S3 và chỉ để pointer vào SQS. |
| **ASG Scaling Metric** | **`ApproximateNumberOfMessagesVisible`** | Để Auto Scaling Group tăng/giảm EC2 worker fleet chính xác theo lượng việc tồn đọng, phải tính metric **Backlog Per Instance** = $\frac{\text{ApproximateNumberOfMessagesVisible}}{\text{Running Instances}}$. |

---

## 📢 SNS — PUB/SUB & MÔ HÌNH FAN-OUT

| Kịch Bản Đề Thi | ✅ Giải Pháp Chuẩn | 💡 Vì Sao / Ngữ Cảnh Nhớ Nhanh |
|:---|:---|:---|
| **"1 event needs to be processed by multiple independent services"** | **Mô hình SNS Fan-out** (SNS $\rightarrow$ nhiều SQS Queues) | 1 Topic SNS phát tán đồng thời tới nhiều hàng đợi SQS. Mỗi dịch vụ đọc từ SQS riêng, độc lập tốc độ xử lý, nếu 1 service sập các service khác vẫn chạy bình thường. |
| **"Filter messages before triggering Lambda / SQS"** | **SNS Message Filtering Policy** | Gán Filter Policy dạng JSON trên subscription (ví dụ: chỉ nhận `status: placed`). Giúp loại bỏ việc kích hoạt hàm Lambda vô ích, tiết kiệm chi phí compute. |
| **"Order processing with strict FIFO Fan-out"** | **SNS FIFO Topic $\rightarrow$ SQS FIFO Queues** | Giữ nguyên thứ tự tin nhắn xuyên suốt từ nguồn phát tới từng hàng đợi xử lý. |

---

## ⚡ EVENTBRIDGE vs APPFLOW vs SNS

| Dịch Vụ | Bản Chất Dữ Liệu | 💡 Ngữ Cảnh Phản Xạ Đề Thi |
|:---|:---|:---|
| **Amazon EventBridge** | **Sự kiện JSON thời gian thực** (Event-driven) | Định tuyến sự kiện từ AWS services (EC2 State change, S3 upload, CloudTrail) hoặc đối tác SaaS (Zendesk, Shopify, Datadog) sang Lambda, Step Functions, SQS. Có **EventBridge Scheduler** thay thế hoàn toàn cron. |
| **Amazon AppFlow** | **Truyền tải luồng dữ liệu lớn** (Bulk / Incremental Transfer) | Kéo hàng triệu bản ghi từ ứng dụng SaaS (Salesforce, SAP, ServiceNow, Slack) nạp trực tiếp vào **Amazon S3** hoặc **Amazon Redshift** qua mạng riêng **AWS PrivateLink** (không cần viết code). |
| **Amazon SNS** | **Thông báo đẩy đa kênh** (Pub/Sub Push) | Đẩy thông báo tức thì tới người dùng qua SMS, Email, Mobile Push Notification hoặc đẩy tới SQS/Lambda. Không có khả năng lọc phức tạp theo payload JSON sâu như EventBridge. |

> 💡 **Móc nhớ siêu nhanh**:  
> - Đề có chữ **"SaaS event real-time"** hoặc **"trigger workflow at specific cron"** $\rightarrow$ **EventBridge**.  
> - Đề có chữ **"Sync Salesforce/ServiceNow records to S3/Redshift without code"** $\rightarrow$ **AppFlow**.

---

## 🌊 KINESIS — NỀN TẢNG XỬ LÝ LUỒNG DỮ LIỆU LỚN

| Dịch Vụ Kinesis | 💡 Vì Sao Chọn / Điểm Nhận Diện | ❌ Bẫy Cần Tránh |
|:---|:---|:---|
| **Kinesis Data Streams (KDS)** | Cần **lưu trữ và phát lại (Replay)** dữ liệu stream (giữ từ 24 giờ đến 365 ngày). Đòi hỏi tự viết consumer code (KCL, Lambda) hoặc tự quản lý dung lượng Shards (hoặc dùng chế độ On-Demand). | ~~Kinesis Firehose~~ (Firehose không replay được). |
| **Kinesis Data Firehose** | Cần **tự động nạp dữ liệu** thẳng vào S3, Redshift, OpenSearch, Splunk dạng Serverless không cần viết mã consumer. Tự động chuyển đổi định dạng (CSV sang Parquet/ORC) và nén dữ liệu. | ~~Kinesis Streams~~ (Streams phải tự viết code ghi vào S3). |
| **Kinesis Data Analytics (Apache Flink)** | Cần chạy các câu truy vấn **SQL hoặc Apache Flink thời gian thực** trên dòng dữ liệu đang chảy (ví dụ: tính toán trung bình trượt 5 phút). | ~~Amazon Athena~~ (Athena chỉ query dữ liệu tĩnh trên S3). |

### 🚨 Xử Lý Lỗi Poison Pill Trong Kinesis / DynamoDB Streams
- **Hiện tượng**: Một bản ghi lỗi cú pháp làm hàm Lambda crash liên tục $\rightarrow$ Shard bị nghẽn (Stream Shard Blocked), không xử lý được các bản ghi tiếp theo.
- ✅ **Cách khắc phục chuẩn AWS Solutions Architect**: Bật cấu hình **`BisectBatchOnFunctionError = true`** kết hợp với **On-Failure Destination (gửi bản ghi lỗi vào SQS DLQ)** và đặt giới hạn **`Maximum Retry Attempts`**.

---

## 🔄 STEP FUNCTIONS: Standard vs Express Workflows

| Tiêu Chí | Standard Workflows | Express Workflows |
|:---|:---|:---|
| **Thời gian chạy tối đa** | **Lên tới 1 năm** | **Tối đa 5 phút** |
| **Mô hình thực thi** | **Exactly-once** (chính xác 1 lần) | **At-least-once** (có thể lặp lại) |
| **Mô hình tính giá** | Tính theo số lần chuyển trạng thái (**State transitions**) | Tính theo thời gian và bộ nhớ thực thi (**GB-seconds**) |
| **Tính năng phê duyệt (Approval)** | ✅ Hỗ trợ tạm dừng chờ Token (`.waitForTaskToken`) | ❌ Không hỗ trợ chờ người duyệt |
| **Ngữ cảnh đề thi** | Quy trình thanh toán thương mại điện tử, đăng ký mở thẻ ngân hàng có bước người quản lý duyệt. | Xử lý sự kiện IoT tốc độ cao, chuyển đổi log streaming, microservice API ngắn hạn. |

---

## 🐰 AMAZON MQ vs SQS/SNS

| Tiêu Chí | Amazon MQ | Amazon SQS / SNS |
|:---|:---|:---|
| **Giao thức hỗ trợ** | Các chuẩn truyền thống: **JMS, AMQP, MQTT, OpenWire, STOMP**. | API độc quyền của AWS SDK (`sqs:SendMessage`, `sns:Publish`). |
| **Độ co giãn** | Cụm máy chủ chuyên dụng (Active/Standby với EFS storage). | Serverless hoàn toàn, tự động co giãn không giới hạn. |
| **Khi nào chọn trong đề thi?** | Di chuyển ứng dụng cũ (**Lift-and-Shift**) từ On-Premises đang dùng **Apache ActiveMQ hoặc RabbitMQ** mà **nghiêm cấm sửa code ứng dụng**. | Xây dựng ứng dụng đám mây mới (**Cloud-native**), microservices serverless. |
