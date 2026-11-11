# 14 — SERVERLESS PATTERNS & EXAM LIMITS: Kiến Trúc Không Máy Chủ, Các Mẫu Thiết Kế & Hạn Mức Sống Còn

---

## 📖 BẢN CHẤT KIẾN TRÚC SERVERLESS TRONG KỲ THI AWS SAA

| Tiêu Chí | Đặc Điểm Cốt Lõi |
|:---|:---|
| **Định nghĩa Serverless** | Nhóm các dịch vụ **không cần người dùng cấp phát hay quản lý máy chủ**, AWS tự động lo tính sẵn sàng cao (Multi-AZ), tự động co giãn theo tải, tự động vá lỗi hệ điều hành và **chỉ tính tiền theo mức sử dụng thực tế (Pay-as-you-go)**. |
| **Khả năng co giãn về 0** | Khi không có request nào đến hệ thống $\rightarrow$ **Chi phí tính toán = $0** (Scale to zero). |
| **Từ khóa đề thi kích hoạt chọn Serverless** | **`"least operational overhead"`**, **`"no server management"`**, **`"serverless"`**, **`"scale automatically"`**, **`"pay only for what you use"`**, **`"unpredictable traffic"`**. |
| ⚠️ **Khi nào KHÔNG chọn Serverless?** | Workload chạy liên tục 24/7 với tải cao ổn định (khi đó chạy **EC2 + Reserved Instances / Savings Plans** sẽ rẻ hơn nhiều); tác vụ chạy liên tục vượt quá 15 phút (vượt hạn mức của Lambda); ứng dụng đòi hỏi GPU hoặc can thiệp sâu vào kernel OS. |

---

## 🧩 DANH MỤC CÁC DỊCH VỤ SERVERLESS TOÀN DIỆN CỦA AWS

```
COMPUTE:       AWS Lambda, AWS Fargate
API & WEB:     Amazon API Gateway, AWS AppSync
STORAGE:       Amazon S3, Amazon EFS (Elastic throughput)
DATABASE:      Amazon DynamoDB, Amazon Aurora Serverless v2
INTEGRATION:   Amazon SQS, Amazon SNS, Amazon EventBridge, AWS Step Functions
ANALYTICS:     Amazon Athena, Amazon Data Firehose, AWS Glue, Amazon Redshift Serverless
SECURITY:      Amazon Cognito, AWS KMS, AWS Secrets Manager
```

---

## 🏗️ 8 MẪU KIẾN TRÚC SERVERLESS KINH ĐIỂN TRONG ĐỀ THI

### 1. Kiến Trúc Ứng Dụng Web 3 Tầng Serverless (3-Tier Web App)
```
[User Browser / Mobile]
       │
       ▼
[Amazon CloudFront] ──> [S3 Static Bucket (HTML/CSS/React SPA)]
       │ (API Call HTTPS)
       ▼
[Amazon API Gateway] ──> Xác thực qua [Amazon Cognito User Pool (JWT)]
       │
       ▼
  [AWS Lambda]
       │
       ▼
[Amazon DynamoDB] (NoSQL Single-digit ms)
```

### 2. Pipeline Xử Lý Tệp Tin Tự Động Theo Sự Kiện (File Ingestion Pipeline)
```
[User Upload Ảnh/Tài Liệu] ──> [Amazon S3 Source Bucket]
                                     │ (S3 Event Notification)
                                     ▼
                               [AWS Lambda] 
                      (Tạo thumbnail, OCR Textract, nén)
                                     │
                    ┌────────────────┴────────────────┐
                    ▼                                 ▼
         [S3 Processed Bucket]              [Amazon DynamoDB]
         (Lưu file đã xử lý)                (Lưu metadata, URL, kích thước)
```

### 3. Bộ Đệm Chống Tràn Tải Cơ Sở Dữ Liệu (Write Buffer / Decoupling)
- **Vấn đề**: Hàng chục ngàn người dùng cùng bấm nút "Đặt hàng" trong flash sale $\rightarrow$ Ghi thẳng vào Database làm DB bị sập vì nghẽn kết nối và khóa bảng (Locking).
- **Giải pháp chuẩn AWS**:
```
[API Gateway] ──> [Amazon SQS Queue] ──> [AWS Lambda Batch] ──> [Amazon RDS / DynamoDB]
                   (Bộ đệm buffer)        (Xử lý từng mẻ nhỏ)     (Database an toàn)
```

### 4. Xử Lý Nghẽn Kết Nối Khi Lambda Truy Cập Database Quan Hệ (RDS Connection Pooling)
- **Vấn đề**: Mỗi lần hàm Lambda scale-out có thể tạo ra hàng ngàn instance đồng thời, mỗi instance mở 1 kết nối tới MySQL/PostgreSQL $\rightarrow$ Gây lỗi **`Too many connections error`** và sập RDS.
- **Giải pháp chuẩn AWS**: Đặt **Amazon RDS Proxy** ở giữa. RDS Proxy giữ và gom cụm kết nối (Connection Pooling), chia sẻ lại kết nối cho các Lambda functions $\rightarrow$ Giảm 90% tải CPU/RAM cho database và giảm thời gian failover xuống 66%.

### 5. Phát Tán Sự Kiện Xử Lý Đơn Hàng Độc Lập (Fan-Out Pattern)
```
[Khách Đặt Hàng] ──> [API Gateway] ──> [Amazon SNS Topic]
                                              │
                      ┌───────────────────────┼───────────────────────┐
                      ▼                       ▼                       ▼
               [SQS Queue 1]            [SQS Queue 2]           [SQS Queue 3]
             (Trừ tiền ngân hàng)     (Xuất kho đóng hàng)     (Gửi hóa đơn email)
                      │                       │                       │
                      ▼                       ▼                       ▼
               [Lambda Worker]         [Lambda Worker]         [Lambda Worker]
```

### 6. Lập Lịch Tác Vụ Định Kỳ Serverless (Serverless Cron Schedule)
- Thay thế hoàn toàn máy chủ Linux chạy crontab.
- Dùng **EventBridge Scheduler** cấu hình biểu thức cron (VD: `cron(0 8 ? * MON-FRI *)` = 8h sáng ngày làm việc) $\rightarrow$ Kích hoạt trực tiếp **AWS Lambda** để dọn dẹp dữ liệu, sao lưu, hoặc gửi báo cáo tài chính.

### 7. Điều Phối Quy Trình Nghiệp Vụ Phức Tạp (Multi-Step Business Workflow)
- **Vấn đề**: Đơn hàng cần chạy qua: 1. Kiểm tra tồn kho $\rightarrow$ 2. Trừ thẻ tín dụng $\rightarrow$ 3. Chờ nhân viên quản lý duyệt nếu đơn > \$10,000 $\rightarrow$ 4. Giao hàng. Nếu dùng Lambda gọi lồng nhau sẽ rất khó xử lý lỗi và tốn tiền timeout.
- **Giải pháp chuẩn AWS**: Dùng **AWS Step Functions Standard Workflow**. Tự động xử lý thử lại (`Retry`), bắt lỗi (`Catch`), và tạm dừng chờ người quản trị bấm duyệt qua email bằng cơ chế **`waitForTaskToken`** (thời gian chờ tối đa lên tới 1 năm).

### 8. Xử Lý Luồng Dữ Liệu Thời Gian Thực (Stream Processing Pipeline)
```
[IoT Sensors / Clickstream] ──> [Kinesis Data Streams]
                                        │
                                        ▼
                                  [AWS Lambda] 
                          (Lọc dữ liệu, tính toán tức thì)
                                        │
                                        ▼
                                [Amazon DynamoDB] 
                                        │
                                        ▼
                              [DynamoDB Streams] ──> [Lambda] ──> [Gửi cảnh báo SMS]
```

---

## 🛑 BẢNG CON SỐ GIỚI HẠN SERVERLESS SỐNG CÒN ĐỂ LOẠI SUY ĐÁP ÁN

Khi làm bài thi, rất nhiều câu hỏi cố tình đưa ra các mốc thời gian, dung lượng dữ liệu, hoặc số lượng request để thử thách thí sinh. **Hãy dùng bảng này để gạch bỏ ngay đáp án sai trong 3 giây**:

| Dịch Vụ | Thông Số / Con Số Cốt Tử | 💡 Ý Nghĩa Trong Bài Thi & Cách Loại Suy |
|:---|:---|:---|
| **AWS Lambda** | **Thời gian chạy tối đa: 15 phút** | Đề bài nói: *"Tác vụ tính toán xử lý mất 30 phút hoặc vài giờ"* $\rightarrow$ **LOẠI BỎ NGAY LAMBDA** (Bắt buộc chọn **AWS Batch, ECS on Fargate, hoặc Step Functions**). |
| **AWS Lambda** | **Bộ nhớ RAM: 128 MB đến 10 GB** | CPU tự động tăng tỷ lệ thuận theo dung lượng RAM được cấp phát. |
| **AWS Lambda** | **Payload kích thước: Đồng bộ 6 MB / Bất đồng bộ 256 KB** | Đề bài gửi file lớn 50 MB qua API Gateway vào thẳng Lambda $\rightarrow$ **Sai** (Phải upload file lên S3 trước). |
| **AWS Lambda** | **Hạn mức Concurrency: 1,000 / Region** | Vượt quá 1,000 thực thi đồng thời mặc định sẽ bị trả về lỗi **`HTTP 429 Too Many Requests`**. Dùng **Provisioned Concurrency** để xóa bỏ hiện tượng trễ khởi động lạnh (**Cold Start**). |
| **AWS Lambda** | **Ổ đĩa tạm `/tmp`: 512 MB đến 10 GB** | Dùng để tải file tạm về giải nén hoặc xử lý cục bộ trước khi đẩy đi. |
| **Amazon API Gateway** | **Timeout tối đa của 1 request: 29 giây** | Đề bài nói: *"Ứng dụng cần đợi tiến trình backend xử lý mất 2 phút mới trả về kết quả qua API Gateway"* $\rightarrow$ **BỊ LỖI TIMEOUT NGAY** (Bắt buộc thiết kế bất đồng bộ: API Gateway trả về mã 202 Accepted + đẩy việc vào SQS). |
| **Amazon API Gateway** | **Payload kích thước tối đa: 10 MB** | Request body gửi qua API Gateway không được vượt quá 10 MB. |
| **Amazon API Gateway** | **Throttling mặc định: 10,000 req/s** | Vượt quá sẽ trả về mã lỗi **`HTTP 429`**. Cung cấp **Usage Plans + API Keys** để giới hạn hạn ngạch từng khách hàng. |
| **Amazon SQS** | **Kích thước tin nhắn: 256 KB** | Vượt quá 256 KB $\rightarrow$ Bắt buộc dùng **Amazon SQS Extended Client Library** (lưu file vào S3). |
| **Amazon SQS** | **Thời gian lưu trữ (Retention): 4 ngày (tối đa 14 ngày)** | Tin nhắn không được xử lý trong vòng 14 ngày sẽ tự động bị xóa vĩnh viễn. |
| **Amazon SQS** | **Visibility Timeout tối đa: 12 giờ** | Mặc định 30 giây. Phải hoàn tất xử lý và gọi lệnh `DeleteMessage` trước khi hết giờ. |
| **Amazon SQS** | **Long Polling: 1 đến 20 giây** | Giảm thiểu số lượng request rỗng, tiết kiệm 90% chi phí API. |
| **Amazon DynamoDB** | **Kích thước 1 Item tối đa: 400 KB** | Đề bài lưu trữ file tài liệu PDF hoặc ảnh lớn trong DynamoDB $\rightarrow$ **Sai** (Phải lưu file trên S3, DynamoDB chỉ lưu metadata). |
| **Amazon DynamoDB** | **Phục hồi theo thời gian (PITR): 35 ngày** | Cho phép khôi phục bảng về bất kỳ giây nào trong vòng 35 ngày gần nhất. |
| **AWS Step Functions** | **Standard Workflow: Tối đa 1 năm** | Hỗ trợ bước dừng chờ người duyệt (Human approval) bằng callback task token. |
| **AWS Step Functions** | **Express Workflow: Tối đa 5 phút** | Dành cho xử lý luồng sự kiện IoT tốc độ cao, tính phí theo thời gian chạy GB-s. |
| **Kinesis Data Streams** | **Kích thước bản ghi (Record): Tối đa 1 MB** | Kinesis Streams chỉ nhận bản ghi $\le$ 1 MB (nếu cần lớn hơn tới 10 MB $\rightarrow$ Dùng **Amazon MSK**). |
| **Kinesis Data Streams** | **Thời gian lưu trữ: 24 giờ đến 365 ngày** | Dữ liệu stream có thể được tua lại và phát lại (Replay) nhiều lần. |
| **Kinesis Data Streams** | **Công suất 1 Shard: 1 MB/s vào / 2 MB/s ra** | Đạt tối đa 1,000 records ghi vào mỗi giây trên 1 Shard. Vượt quá bị lỗi `ProvisionedThroughputExceeded`. |

---

## 🚀 BẢNG CHỌN NHANH SERVERLESS

| Tín Hiệu Đề Thi (Trigger Keywords) | ✅ Đáp Án Chuẩn |
|:---|:---|
| "event-driven code execution, < 15 mins, least operational overhead" | **AWS Lambda** |
| "run containerized tasks without managing EC2 servers or nodes" | **AWS Fargate** |
| "serverless REST API with request caching, throttling, API keys" | **Amazon API Gateway (REST API)** |
| "low-cost, high-performance serverless HTTP proxy API" | **Amazon API Gateway (HTTP API)** |
| "serverless GraphQL API, real-time WebSocket subscriptions" | **AWS AppSync** |
| "serverless NoSQL database, single-digit ms, auto-scale" | **Amazon DynamoDB** |
| "relational SQL database, unpredictable variable load, scale capacity to zero" | **Amazon Aurora Serverless v2** |
| "serverless SQL query directly on S3 data lake files" | **Amazon Athena** |
| "serverless streaming data ingestion into S3/Redshift without consumer code" | **Amazon Data Firehose** |
| "serverless multi-step workflow orchestration, error retry, human approval" | **AWS Step Functions Standard** |
| "serverless task scheduler with cron syntax and timezone support" | **Amazon EventBridge Scheduler** |
| "buffer traffic spikes before database write to prevent DB crash" | **Amazon SQS Queue giữa API và DB** |
| "Lambda to RDS connection pooling, avoid too many connections" | **Amazon RDS Proxy** |
| "eliminate Lambda cold start latency for Java/.NET functions" | **Lambda SnapStart / Provisioned Concurrency** |
| "run batch processing task taking 4 hours" | **AWS Batch hoặc ECS Fargate (Không dùng Lambda)** |

