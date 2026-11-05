# Tài Liệu Học Tập Chuyên Sâu: Amazon API Gateway, Amazon Cognito & AWS Step Functions (Serverless Integration & Orchestration)

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Principal Serverless Solutions Architect (Cập nhật phiên bản kiến trúc mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt chuyên ngành (Bảo lưu 100% thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Mục tiêu**: Phục vụ thi chứng chỉ cấp độ Professional/Specialty (**SAA-C03, SAP-C02, Developer Associate**) và thiết kế kiến trúc Serverless Microservices cấp độ doanh nghiệp (**Enterprise-grade**).  
> **Các bài giảng liên quan**: Chương 19 & 20 (Serverless Deep-Dive: Lambda, API Gateway, Cognito, Step Functions, AppSync).

---

## 1. Tổng Quan Bộ Ba Tích Hợp Serverless (Service Overview)

### 1. Phân vai kiến trúc trong hệ sinh thái Serverless

Khi xây dựng các ứng dụng hiện đại không máy chủ (**Serverless**), bộ ba dịch vụ sau đây đóng vai trò là "xương sống" kết nối:
1. **Amazon API Gateway**: "Cánh cổng đón khách" (Front Door) — Tiếp nhận, định tuyến, bảo vệ, giới hạn tốc độ (**Throttling**), và quản lý vòng đời của các API REST, HTTP và WebSocket ở quy mô hàng triệu requests/giây.
2. **Amazon Cognito**: "Hộ chiếu định danh" (Identity & Access) — Quản lý xác thực người dùng (**Authentication**), cấp quyền (**Authorization**), hỗ trợ đăng nhập mạng xã hội (Google, Facebook, Apple) và doanh nghiệp (SAML 2.0, OIDC).
3. **AWS Step Functions**: "Nhạc trưởng điều phối" (Orchestration Engine) — Điều phối luồng xử lý nghiệp vụ phức tạp (**Workflows / State Machines**), quản lý các tác vụ phân tán, xử lý lỗi tự động và loại bỏ nhu cầu viết mã glue-code lộn xộn trong Lambda.

```mermaid
flowchart TD
    Client[Web Browser / Mobile App] -->|1. Xác thực & Lấy JWT Token| Cognito[Amazon Cognito\nUser Pools & Identity Pools]
    Client -->|2. Gửi HTTPS Request kèm Bearer Token| APIGW[Amazon API Gateway\nREST / HTTP API]
    APIGW -->|3. Kiểm tra Token| AuthCheck{Cognito / Lambda Authorizer}
    AuthCheck -->|Hợp lệ| DirectTarget[Tích Hợp Trực Tiếp AWS Service\nEventBridge / SQS / DynamoDB]
    AuthCheck -->|Hợp lệ| Lambda[AWS Lambda Functions\nBusiness Logic]
    AuthCheck -->|Hợp lệ: Luồng phức tạp| StepFunc[AWS Step Functions\nState Machine Orchestration]
    
    StepFunc --> Task1[Task 1: Lambda Data Validation]
    StepFunc --> Task2[Task 2: AWS Batch / ECS Job]
    StepFunc --> Task3[Task 3: Amazon SNS Notification]
```

---

### 2. Bài toán cốt lõi mà các dịch vụ giải quyết

1. **Loại bỏ Server trung gian (Zero EC2 Instances for Ingress & Routing)**: Không cần cài đặt Nginx, HAProxy hay Kong Gateway; API Gateway tự động co giãn theo tải thực tế mà không cần quản trị máy chủ.
2. **Bảo mật và kiểm soát truy cập phân tầng (Defense in Depth)**: Tích hợp sẵn với **AWS WAF** (chống SQLi, XSS), bảo vệ DDoS với **AWS Shield**, và xác thực chuẩn OAuth 2.0 / JWT thông qua **Cognito User Pools**.
3. **Điều phối giao dịch phân tán (Distributed Transactions / Saga Pattern)**: Step Functions giúp theo dõi trạng thái của từng bước giao dịch dài hạn (lên tới 1 năm), tự động thử lại khi lỗi (**Retry**) và thực hiện thao tác hoàn tiền/hủy đơn (**Compensation Logic**) nếu một khâu thất bại.

---

### 3. Khi nào KHÔNG nên dùng (Anti-patterns & Giải pháp thay thế)

* ❌ **Truyền phát dữ liệu thô dung lượng lớn (Video streaming, File upload > 10 MB)**: API Gateway có giới hạn tải trọng cứng (**Payload Limit = 10 MB**).  
  👉 *Giải pháp thay thế*: Sử dụng **Amazon S3 Presigned URLs** để client upload trực tiếp lên S3.
* ❌ **Xử lý tác vụ tính toán thời gian dài > 29 giây**: API Gateway có thời gian chờ tối đa (**Integration Timeout = 29 giây** không thể tăng thêm).  
  👉 *Giải pháp thay thế*: Trả về `HTTP 202 Accepted` ngay lập tức, đẩy message vào **SQS** hoặc khởi chạy **Step Functions Asynchronous Workflow**.
* ❌ **Yêu cầu giao thức không phải HTTP/WebSocket (TCP/UDP, MQTT)**: API Gateway chỉ hỗ trợ HTTP/HTTPS và WebSocket.  
  👉 *Giải pháp thay thế*: Sử dụng **Network Load Balancer (NLB)** hoặc **AWS IoT Core**.

---

## 2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts & Operations)

### 2.1. Amazon API Gateway: Các Loại API & Endpoint Types

#### 1. Bảng So Sánh Chi Tiết: REST API vs HTTP API vs WebSocket API

| Đặc điểm kỹ thuật | HTTP API (Thế hệ mới v2) | REST API (Thế hệ truyền thống v1) | WebSocket API |
| :--- | :--- | :--- | :--- |
| **Giao thức** | HTTP/1.1, HTTP/2 | HTTP/1.1 | WebSocket (Hai chiều - Duplex) |
| **Độ trễ (Latency)** | **Cực thấp (Siêu nhẹ)** | Trung bình | Thời gian thực (Persistent connection) |
| **Chi phí** | **Rẻ hơn 71%** ($1.00 / 1 triệu reqs) | Đắt hơn ($3.50 / 1 triệu reqs) | Tính theo phút kết nối + tin nhắn |
| **Xác thực (Auth)** | OIDC, OAuth 2.0, Lambda Authorizer | Cognito User Pools, Lambda, IAM, API Keys | IAM, Cognito, Lambda Authorizer |
| **Tích hợp AWS WAF** | **Hỗ trợ đầy đủ** (Cập nhật mới) | **Hỗ trợ đầy đủ** | Chưa hỗ trợ trực tiếp |
| **API Caching tích hợp** | ❌ Không hỗ trợ tích hợp |  **Có hỗ trợ** (Cụm Cache riêng) | ❌ Không |
| **Usage Plans & API Keys** | ❌ Không hỗ trợ |  **Hỗ trợ đầy đủ** (Bán gói API) | ❌ Không |
| **Request Transformation (VTL)** | ❌ Không hỗ trợ |  **Hỗ trợ Apache Velocity (VTL)** | ❌ Không |
| **Trường hợp tối ưu** | Microservices cần độ trễ thấp, chi phí rẻ, xác thực JWT đơn giản. | API bán cho đối tác thứ 3 (SaaS), cần rate limiting theo khách hàng, caching, transform dữ liệu. | Ứng dụng chat real-time, bảng giá chứng khoán, thông báo trực tiếp. |

#### 2. Ba Loại Endpoint Network (API Gateway Endpoint Types)
1. **Edge-Optimized Endpoint (Mặc định cho REST API)**:
   - Tự động định tuyến lưu lượng qua mạng lưới toàn cầu **Amazon CloudFront Edge Locations**.
   - Tối ưu cho khách hàng truy cập từ khắp nơi trên toàn cầu để giảm độ trễ mạng internet.
2. **Regional Endpoint**:
   - Triển khai trong cùng Region với ứng dụng.
   - Thích hợp khi đại đa số client ở cùng khu vực địa lý, hoặc khi bạn muốn tự quản lý phân phối CloudFront riêng đặt phía trước API Gateway (tận dụng chung bộ nhớ cache).
3. **Private Endpoint**:
   - Chỉ có thể truy cập được từ bên trong mạng riêng **Amazon VPC** thông qua **Interface VPC Endpoint (AWS PrivateLink - `com.amazonaws.<region>.execute-api`)**.
   - Lưu lượng hoàn toàn không bao giờ đi qua Internet công cộng; bảo vệ an toàn cho các API nội bộ doanh nghiệp.

---

### 2.2. Cơ Chế Throttling, Quản Trị Tải & Caching Trong API Gateway

```mermaid
flowchart LR
    Traffic[Hàng nghìn Requests/s] --> Throttling[Token Bucket Algorithm\nThrottling & Burst Limit]
    Throttling -->|Vượt hạn mức| Err429[HTTP 429: Too Many Requests\nClient Exponential Backoff]
    Throttling -->|Trong hạn mức| CacheCheck{API Gateway Cache Hit?}
    CacheCheck -->|Hit: 0ms compute| CachedResp[Trả về phản hồi Cache tức thì]
    CacheCheck -->|Miss| Backend[Chuyển tới Lambda / Microservice Backend]
```

* **Thuật toán Token Bucket**:
  - **Steady-state Rate Limit**: Mặc định 10,000 requests/giây (RPS) trên mỗi tài khoản/vùng.
  - **Burst Limit**: Mặc định 5,000 requests (sức chứa của xô token để hấp thụ các xung tải đột biến).
  - Khi xô hết token $\rightarrow$ API Gateway tự động trả về mã lỗi **`HTTP 429 Too Many Requests`**.
* **Usage Plans & API Keys**:
  - Cho phép phân nhóm khách hàng (ví dụ: Gói Basic = 100 req/ngày, Gói Pro = 100,000 req/ngày).
  - Khách hàng gửi kèm header `x-api-key`. API Gateway tự động theo dõi hạn mức (Quota) và từ chối nếu vượt quá.

---

### 2.3. Amazon Cognito: User Pools vs Identity Pools (Phân Biệt Cốt Lõi)

Đây là chủ đề xuất hiện với tần suất cực lớn trong các kỳ thi AWS (SAA-C03 & SAP-C02):

```mermaid
classDiagram
    class CognitoUserPools {
        +Authentication (Xác thực danh tính)
        +Danh mục người dùng (User Directory)
        +Đăng ký, Đăng nhập, Quên mật khẩu
        +Hỗ trợ MFA, Social Login, SAML/OIDC
        +Đầu ra: JWT Tokens (ID, Access, Refresh)
    }

    class CognitoIdentityPools {
        +Authorization (Cấp quyền truy cập AWS)
        +Chuyển đổi JWT/Social Token thành AWS Credentials
        +Cấp IAM Role tạm thời (STS AssumeRole)
        +Hỗ trợ cả Guest/Unauthenticated Users
        +Đầu ra: Temporary AWS Credentials (AccessKey, Secret, SessionToken)
    }
```

| Tiêu chí so sánh | Cognito User Pools (CUP) | Cognito Identity Pools (Federated Identities) |
| :--- | :--- | :--- |
| **Mục đích chính** | **Xác thực (Authentication)** — "Bạn là ai?" | **Phân quyền (Authorization)** — "Bạn được làm gì trên AWS?" |
| **Đối tượng quản lý** | Thư mục người dùng (Username, Password, Email, Số điện thoại). | Cầu nối cấp quyền truy cập tài nguyên AWS. |
| **Kết quả trả về** | **Bộ 3 mã thông báo JWT**:<br>• `IdToken`: Chứa thông tin user (email, name).<br>• `AccessToken`: Chứa scopes/groups để gọi API Gateway.<br>• `RefreshToken`: Dùng để lấy AccessToken mới. | **AWS Temporary Credentials** từ AWS STS:<br>• `AccessKeyId`<br>• `SecretAccessKey`<br>• `SessionToken` |
| **Cách dùng điển hình** | Xác thực người dùng đăng nhập vào ứng dụng web/mobile và gửi Bearer Token vào API Gateway. | Cho phép ứng dụng di động upload ảnh trực tiếp lên **Amazon S3** hoặc đọc bảng **DynamoDB** mà không cần qua server trung gian! |
| **Hỗ trợ người dùng ẩn danh**| ❌ Không hỗ trợ (Bắt buộc phải có tài khoản). |  **Hỗ trợ Guest / Unauthenticated users** (Cấp quyền đọc hạn chế). |

---

### 2.4. AWS Step Functions: Điều Phối Luồng Phân Tán (Orchestration)

#### 1. Standard Workflows vs Express Workflows

| Tiêu chí | Standard Workflows | Express Workflows |
| :--- | :--- | :--- |
| **Thời gian chạy tối đa** | **Lên tới 1 năm** (Thích hợp cho quy trình dài hạn, có bước duyệt thủ công) | **Tối đa 5 phút** (Thích hợp xử lý dữ liệu streaming, IoT) |
| **Tốc độ thực thi** | Tối đa ~2,000 executions/giây | **Hơn 100,000 executions/giây** (High throughput) |
| **Cam kết thực thi** | **Exactly-once** (Chính xác một lần - Không bị chạy trùng lặp) | **At-least-once** (Bất đồng bộ) hoặc **At-most-once** (Đồng bộ) |
| **Mô hình tính giá** | Tính trên **từng bước chuyển trạng thái (State Transition)** ($0.025 / 1,000 transitions) | Tính trên **số lượng thực thi + thời gian chạy (GB-giây)** giống Lambda |
| **Lịch sử thực thi** | Lưu trữ toàn bộ lịch sử trạng thái trong **90 ngày** trên Console | Xuất logs trực tiếp sang **CloudWatch Logs** (không lưu console) |
| **Trường hợp áp dụng** | Xử lý đơn hàng thương mại điện tử, luồng phê duyệt nghỉ phép của nhân sự, ETL batch. | Xử lý luồng clickstream, ingest dữ liệu IoT từ Kinesis, biến đổi dữ liệu API tốc độ cao. |

#### 2. Các Trạng Thái Quan Trọng (States):
- **Task State**: Đại diện cho một đơn vị công việc (gọi hàm Lambda, chạy ECS Task, gửi message SQS, gọi HTTP endpoint của bên thứ 3).
- **Choice State**: Rẽ nhánh điều kiện logic (`if-else` dựa trên payload đầu vào).
- **Parallel State**: Thực thi song song các nhánh độc lập cùng lúc.
- **Map State**: Lặp qua một mảng dữ liệu (Array iteration) và thực thi logic trên từng phần tử.
- **Wait State**: Tạm dừng luồng trong một khoảng thời gian cố định hoặc đến một mốc thời gian cụ thể.
- **Fail / Succeed State**: Kết thúc luồng với trạng thái thất bại hoặc thành công.

---

## 3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### Kịch Bản: Quy Trình Đăng Nhập, Gọi API Đơn Hàng & Điều Phối Bằng Step Functions

```mermaid
sequenceDiagram
    autonumber
    actor User as Khách Hàng (App)
    participant Cognito as Amazon Cognito User Pool
    participant APIGW as Amazon API Gateway (REST)
    participant SF as AWS Step Functions (Standard)
    participant Inventory as Lambda: Kiểm Tra Kho
    participant Payment as Lambda: Trừ Tiền Thẻ
    participant DB as Amazon DynamoDB

    Note over User,Cognito: Bước 1: Xác Thực Định Danh
    User->>Cognito: Gửi Username + Password
    Cognito-->>User: Trả về JWT Access Token & ID Token

    Note over User,APIGW: Bước 2: Đặt Hàng Qua API Gateway
    User->>APIGW: POST /orders (Header: Bearer JWT Token)
    APIGW->>APIGW: Cognito Authorizer kiểm tra chữ ký JWT Token
    APIGW->>SF: Khởi chạy State Machine: StartExecution(OrderID)
    APIGW-->>User: HTTP 202 Accepted (Kèm ExecutionARN)

    Note over SF,Payment: Bước 3: Điều Phối Saga Pattern
    SF->>Inventory: Task 1: Khóa sản phẩm trong kho
    Inventory-->>SF: Xác nhận: Đã khóa hàng thành công
    SF->>Payment: Task 2: Tiến hành thanh toán qua Payment Gateway
    alt Thanh toán Thành công
        Payment-->>SF: Trả về PaymentStatus: SUCCESS
        SF->>DB: Task 3: Ghi đơn hàng trạng thái COMPLETED
        SF-->>User: Thông báo đơn hàng hoàn tất qua WebSocket / SNS
    else Thanh toán Thất bại (Catch / Compensation)
        Payment-->>SF: Báo lỗi InsufficientFunds (Thẻ không đủ tiền)
        SF->>Inventory: Compensation Task: Mở khóa hoàn trả hàng về kho!
        SF->>DB: Cập nhật trạng thái ORDER_FAILED
    end
```

---

## 4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Dịch vụ liên kết | Phương thức tích hợp | Mục đích kỹ thuật & Kịch bản thực tế |
| :--- | :--- | :--- |
| **AWS WAF** | Gắn Web ACL trực tiếp vào API Gateway Stage | Chống các cuộc tấn công tầng ứng dụng (SQL Injection, Cross-Site Scripting XSS, Rate-limiting theo IP). |
| **Amazon CloudFront** | Đặt CloudFront Distribution phía trước Regional API Gateway | Tùy chỉnh tên miền riêng với chứng chỉ SSL đa vùng, áp dụng chính sách Edge caching chuyên sâu và giảm chi phí truyền dữ liệu. |
| **Amazon EventBridge** | **API Gateway Service Integration Trực Tiếp** | Bỏ qua hàm Lambda trung gian: Đẩy trực tiếp request JSON từ API Gateway vào EventBridge Event Bus để xử lý bất đồng bộ. |
| **AWS Lambda** | Lambda Proxy Integration | Phương thức phổ biến nhất: Toàn bộ thông tin request (headers, query params, body) được gói nguyên vẹn thành JSON gửi tới Lambda. |
| **AWS X-Ray** | X-Ray Active Tracing | Phân tích độ trễ xuyên suốt từ API Gateway qua các microservices và hàm Lambda để tìm nút thắt cổ chai (**Bottleneck**). |
| **Amazon SQS / SNS** | API Gateway Service Direct Integration | Đưa các yêu cầu ghi dữ liệu tải cao vào hàng đợi SQS để san phẳng đỉnh tải (**Load Leveling**) với độ trễ thấp nhất. |

---

## 5. FinOps & Chiến Lược Tối Ưu Chi Phí (Cost Optimization)

### 1. Phép tính so sánh: HTTP API vs REST API
* **Tình huống thực tế**:
  Một ứng dụng Fintech nhận 50 triệu yêu cầu API mỗi tháng. Yêu cầu chỉ cần xác thực bằng JWT Token và gọi các hàm Lambda xử lý nghiệp vụ, không cần tính năng API Caching hay WTL transformation.
* **Phương án 1: Sử dụng REST API**:
  - Đơn giá: $3.50 cho mỗi 1 triệu requests đầu tiên.
  - Chi phí = $50 \times 3.50\$ = \mathbf{175.00\$/\text{tháng}}$.
* **Phương án 2: Chuyển đổi sang HTTP API**:
  - Đơn giá: $1.00 cho mỗi 1 triệu requests (cho 300 triệu đầu tiên).
  - Chi phí = $50 \times 1.00\$ = \mathbf{50.00\$/\text{tháng}}$.
  - 👉 **Tiết kiệm ngay $125/tháng (giảm 71.4% chi phí API Gateway)**!

### 2. Tối Ưu Hóa Chi Phí Xử Lý: Direct Service Integration Bỏ Qua Lambda
* Thay vì luồng truyền thống: `API Gateway -> Lambda -> EventBridge / SQS`  
  (Bạn phải trả tiền: Phí gọi API Gateway + Phí thời gian chạy Lambda GB-giây + Phí EventBridge).
* Thiết lập **Direct AWS Service Integration**: `API Gateway -> EventBridge`  
  (Loại bỏ hoàn toàn chi phí chạy của Lambda, giảm thiểu độ trễ từ 50ms xuống còn dưới 10ms, loại bỏ rủi ro dính lỗi Cold Start của Lambda!).

---

## 6. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Mã lỗi / Hiện tượng | Nguyên nhân cốt lõi | Các bước điều tra | Giải pháp xử lý triệt để |
| :--- | :--- | :--- | :--- |
| **`HTTP 429 Too Many Requests`** | Lưu lượng vượt quá Steady-state Rate Limit hoặc Burst Limit đã thiết lập trên Stage hoặc Usage Plan. | Kiểm tra metric CloudWatch `4XXError` và `ExecutionError`. Xem log CloudWatch của API Gateway. | 1. Yêu cầu AWS tăng Soft Limit tài khoản nếu tải hợp lệ.<br>2. Cấu hình Client áp dụng thuật toán **Exponential Backoff with Jitter**.<br>3. Bật API Gateway Cache để giảm tải cho backend. |
| **`HTTP 504 Gateway Timeout`** | Backend (Lambda function hoặc máy chủ HTTP) mất hơn **29 giây** để phản hồi. | Kiểm tra CloudWatch Logs của Lambda; xem execution duration của hàm backend. | 1. **29 giây là Hard Limit không thể tăng của API Gateway**.<br>2. Chuyển kiến trúc sang bất đồng bộ: API Gateway trả về `HTTP 202 Accepted` ngay lập tức và đẩy task vào SQS hoặc Step Functions. |
| **Lỗi `CORS (Cross-Origin Resource Sharing)` trên trình duyệt** | Trình duyệt gửi request `OPTIONS` (Preflight request) nhưng API Gateway không cấu hình trả về các Headers CORS cần thiết. | Mở DevTools trên trình duyệt, tab Console kiểm tra thông báo: *"No 'Access-Control-Allow-Origin' header is present on the requested resource"*. | 1. Bật tính năng **Enable CORS** trên tài nguyên API Gateway.<br>2. Nếu dùng Lambda Proxy Integration, code Lambda **BẮT BUỘC** phải tự chèn header `Access-Control-Allow-Origin: '*'` vào đối tượng JSON phản hồi. |
| **`HTTP 403 Forbidden: Missing Authentication Token`** | 1. Gọi sai URL endpoint hoặc sai phương thức HTTP (ví dụ: route chỉ có POST nhưng client gọi GET).<br>2. API yêu cầu API Key nhưng client không truyền header `x-api-key`. | So sánh chính xác Path và HTTP Method trong URL client gọi với định nghĩa trong API Gateway Console. | 1. Kiểm tra lại routing và URL path.<br>2. Nếu endpoint yêu cầu bảo vệ bằng IAM, client phải ký request bằng SigV4. |

---

## 🏛️ I. Các Kịch Bản Kiến Trúc Chuẩn (Best Practice Scenarios)

#### 1. Xây Dựng Hệ Thống API Tài Chính Lưu Lượng Cao, Độ Trễ Cực Thấp — (CM-PT1 Q10, CM-PT5 Q60)
- **Tình huống thi**: Ngân hàng xây dựng hệ thống API phục vụ ứng dụng Mobile Banking. Yêu cầu xử lý hàng chục nghìn giao dịch mỗi giây, xác thực token JWT chuẩn OAuth 2.0, bảo mật cao nhất và tối ưu chi phí vận hành.
- **Giải pháp tối ưu chuẩn AWS**:
  - Sử dụng **Amazon API Gateway HTTP API** (tiết kiệm hơn 70% chi phí, độ trễ cực thấp).
  - Sử dụng **JWT Authorizer** tích hợp trực tiếp với **Amazon Cognito User Pools** để xác thực token ngay tại tầng API Gateway mà không tốn chi phí thực thi Lambda.
  - Triển khai **Regional Endpoint** nếu người dùng tập trung tại một quốc gia cụ thể để tránh chi phí CloudFront không cần thiết.

#### 2. Điều Phối Luồng Xử Lý Hàng Loạt Dữ Liệu Lớn Dài Hạn Bằng Step Functions — (CM-PT1 Q06, CM-PT1 Q38)
- **Tình huống thi**: Doanh nghiệp cần xây dựng quy trình ETL xử lý video và dữ liệu hình ảnh. Quá trình này gồm nhiều bước: giải nén file, gọi job trích xuất AI, kiểm tra chất lượng và sao lưu kết quả. Tổng thời gian xử lý có thể kéo dài vài giờ đồng hồ.
- **Giải pháp tối ưu**:
  - Sử dụng **AWS Step Functions Standard Workflows** để làm Orchestrator.
  - Step Functions tự động theo dõi trạng thái, gọi **AWS Batch** hoặc **AWS Glue Job**, sử dụng cơ chế **Task Token (`.waitForTaskToken`)** để tạm dừng quy trình đợi job hoàn tất mới chạy bước kế tiếp.
  - Bật tính năng tự động thử lại (**Retry**) với chính sách số mũ (**Exponential Backoff**) khi gặp lỗi tạm thời.

#### 3. Bỏ Qua Lambda Để Gửi Dữ Liệu Trực Tiếp Vào EventBridge — (CM-PT5 Q20)
- **Tình huống thi**: Ứng dụng Serverless nhận hàng nghìn webhook từ các hệ thống đối tác gửi đến API Gateway REST API. Doanh nghiệp muốn đẩy toàn bộ sự kiện này vào **Amazon EventBridge** để các microservices khác tự do đăng ký nhận tin với chi phí rẻ nhất và không phải viết code bảo trì trung gian.
- **Giải pháp tối ưu**:
  - Cấu hình **Direct AWS Service Integration** trong API Gateway trỏ trực tiếp đến `EventBridge:PutEvents`.
  - Gán IAM Role cho API Gateway cho phép quyền `events:PutEvents`.
  - **Hoàn toàn không cần tạo Lambda function trung gian**, giúp giảm chi phí, tăng tính tin cậy và đạt tốc độ phản hồi tối đa.

#### 4. Xác Thực Hai Lớp Thích Ứng Cho Hàng Triệu Khách Hàng Bằng Cognito — (CM-PT4 Q22)
- **Tình huống thi**: Doanh nghiệp cần giải pháp xác thực người dùng cho ứng dụng bán lẻ có khả năng phục vụ hàng triệu khách hàng toàn cầu. Hệ thống phải tự động yêu cầu xác thực 2 yếu tố (2FA/MFA) nếu phát hiện khách hàng đăng nhập từ vị trí địa lý bất thường hoặc thiết bị lạ.
- **Giải pháp tối ưu**:
  - Triển khai **Amazon Cognito User Pools**.
  - Kích hoạt tính năng **Advanced Security Features: Adaptive Authentication (Xác thực thích ứng dựa trên rủi ro)**.
  - Cognito tự động phân tích IP, vị trí địa lý, dấu vân tay thiết bị để tính toán điểm rủi ro và tự động kích hoạt thử thách SMS MFA hoặc TOTP khi phát hiện dấu hiệu bất thường.

---

## 🪤 II. Các Bẫy Thi Tinh Vi & Phân Tích Phương Án Sai (Exam Traps & Distractors)

#### 🪤 Bẫy 1: Bảo Vệ API Gateway Khỏi SQLi và XSS: AWS Shield vs AWS WAF — (CM-PT3 Q12)
- **Tình huống đề thi**: *"Doanh nghiệp công khai các REST API trên API Gateway cho bên thứ 3 truy cập. Yêu cầu bảo vệ API khỏi các mối đe dọa SQL Injection và Cross-Site Scripting (XSS) với chi phí vận hành thấp nhất."*
- **Các phương án bẫy**:
  - ❌ *Bật AWS Shield Advanced*: Shield tập trung chống tấn công từ chối dịch vụ DDoS tầng Layer 3/Layer 4; Shield không có các bộ quy tắc (Rules) phân tích payload để chặn SQL Injection và XSS.
  - ❌ *Viết code trong AWS Lambda để lọc chuỗi SQL Injection*: Tốn công sức lập trình, tiêu tốn thời gian chạy của Lambda và dễ bỏ sót các biến thể injection phức tạp.
- **Giải pháp ĐÚNG**: Gắn **AWS WAF (Web Application Firewall)** trực tiếp vào API Gateway Stage, áp dụng bộ quy tắc quản lý sẵn (**AWS Managed Rules: Core Rule Set & SQL Database Set**).

#### 🪤 Bẫy 2: Phân Biệt Giữa Cognito User Pool và Identity Pool — (CM-PT3 Q19, CM-PT4 Q33)
- **Tình huống đề thi**: *"Ứng dụng di động cần cho phép người dùng tự đăng ký tài khoản bằng email/mật khẩu hoặc đăng nhập qua Google. Sau khi đăng nhập thành công, ứng dụng cần được xác thực danh tính để gọi API Gateway."*
- **Phương án bẫy thường gặp**:
  - ❌ *Sử dụng Cognito Identity Pools để lưu username/password*: Sai hoàn toàn vì Identity Pools không có cơ sở dữ liệu lưu thông tin tài khoản người dùng!
- **Giải pháp ĐÚNG**: Sử dụng **Amazon Cognito User Pools (CUP)**.
  - CUP đóng vai trò là Identity Provider (IdP) quản lý toàn bộ danh bạ người dùng, xử lý reset mật khẩu, MFA và trả về JWT Token.

#### 🪤 Bẫy 3: Xử Lý API Timeout Khi Thời Gian Xử Lý Vượt Quá 29 Giây — (CM-PT1 Q38)
- **Tình huống đề thi**: *"Khách hàng gửi yêu cầu xuất báo cáo phân tích dữ liệu qua REST API. Việc sinh báo cáo mất khoảng 45 giây đến 2 phút. Kiến trúc sư nên thiết kế như thế nào để tránh lỗi timeout?"*
- **Phương án bẫy**:
  - ❌ *Tăng Integration Timeout của API Gateway lên 60 giây*: Sai! 29 giây là giới hạn cứng (**Hard Quota**) của API Gateway và không thể tăng thêm bằng Service Quotas hay yêu cầu AWS Support.
- **Giải pháp ĐÚNG**:
  - Thiết kế kiến trúc **Bất đồng bộ (Asynchronous Request-Reply Pattern)**:
  - API Gateway tiếp nhận yêu cầu, kích hoạt **AWS Step Functions** hoặc đẩy vào **SQS**, sau đó trả ngay về client mã phản hồi `HTTP 202 Accepted` kèm theo một `JobID`.
  - Client định kỳ polling kiểm tra trạng thái của `JobID` hoặc nhận kết quả qua WebSocket API / Webhook.

---

## 📊 III. Ma Trận Quyết Định Công Nghệ Nhanh (Exam Decision Matrix)

| Tình huống / Yêu cầu trong đề thi | Giải pháp chuẩn AWS | Giải pháp bị loại & Lý do |
|:---|:---|:---|
| **Cần xây dựng REST API giá rẻ nhất, chỉ cần xác thực JWT đơn giản** | **API Gateway HTTP API** | REST API (đắt hơn gấp 3 lần, tính năng thừa) |
| **Cần bán gói API cho đối tác thứ 3 với giới hạn quota theo khách hàng** | **API Gateway REST API + Usage Plans & API Keys** | HTTP API (không hỗ trợ Usage Plans và API Keys) |
| **Bảo vệ REST API khỏi tấn công SQL Injection và XSS** | **AWS WAF gắn vào API Gateway** | AWS Shield (chỉ chống DDoS L3/L4, không chống SQLi/XSS) |
| **Đăng ký, đăng nhập người dùng, hỗ trợ Adaptive Risk-based MFA** | **Amazon Cognito User Pools** | Cognito Identity Pools (chỉ phân quyền, không lưu user) |
| **Cho phép Mobile App upload file trực tiếp lên S3 không qua server** | **Cognito Identity Pools (Cấp quyền IAM tạm thời)** | Tạo tài khoản IAM cứng trong code app (Lỗ hổng bảo mật nghiêm trọng) |
| **Quy trình nghiệp vụ xử lý dài ngày (lên tới 1 năm), có bước duyệt thủ công** | **AWS Step Functions Standard Workflows** | Express Workflows (chỉ chạy tối đa 5 phút) |
| **Xử lý luồng sự kiện IoT / Streaming tốc độ > 50,000 req/s, chạy dưới 5 phút** | **AWS Step Functions Express Workflows** | Standard Workflows (bị giới hạn tốc độ và tốn chi phí transition) |
| **Đẩy dữ liệu từ API Gateway vào EventBridge với chi phí và độ trễ thấp nhất** | **Direct Service Integration (Không dùng Lambda)** | Viết Lambda trung gian (tốn tiền chạy compute, tăng latency) |
| **Truy cập API nội bộ từ EC2 trong VPC an toàn không qua Internet** | **Private API Gateway + Interface VPC Endpoint** | NAT Gateway (tốn phí truyền dữ liệu, lưu lượng đi ra ngoài) |

---

## 7. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Kiến Trúc "Sống Còn" Của Serverless Integration
1. **HTTP API cho Microservices, REST API cho Enterprise SaaS**: Khi cần API siêu nhanh, giá rẻ, chuẩn OIDC $\rightarrow$ Chọn HTTP API. Khi cần WAF, Caching, Usage Plans, Request Transformation $\rightarrow$ Chọn REST API.
2. **29 giây là trần thời gian của API Gateway**: Tuyệt đối không để API Gateway chờ tác vụ đồng bộ quá 29 giây; luôn chuyển sang mô hình bất đồng bộ (`HTTP 202 Accepted` + SQS / Step Functions).
3. **CUP để xác thực, CIP để phân quyền AWS**: Nhớ quy tắc: User Pool = Danh bạ người dùng & JWT Token. Identity Pool = Đổi token lấy IAM Role truy cập trực tiếp tài nguyên AWS.
4. **Tránh "Lambda làm bưu tá" (Direct Integration)**: Nếu mục đích của bạn chỉ là nhận JSON từ API Gateway để đẩy vào SQS, DynamoDB hoặc EventBridge $\rightarrow$ Dùng tích hợp trực tiếp, bỏ qua Lambda!
5. **Standard cho nghiệp vụ chính xác, Express cho tốc độ cao**: Standard Workflows đảm bảo thực thi Exactly-once cho đơn hàng, tài chính. Express Workflows tối ưu cho ingest dữ liệu lớn với chi phí siêu rẻ.
6. **Bật CORS đúng 2 tầng**: Nếu dùng Lambda Proxy Integration, không chỉ bật CORS trên console API Gateway mà **code trong Lambda cũng phải return header `Access-Control-Allow-Origin`**.
7. **Adaptive MFA bảo vệ tài khoản người dùng**: Luôn đề xuất tính năng Advanced Security Features của Cognito khi đề bài yêu cầu bảo vệ người dùng trước đăng nhập bất thường.

---

### Liên Kết Nội Bộ và Tài Liệu Tham Khảo (Internal Links)
- 📖 [Ghi Chú Bài Học Chương 19 & 20: Serverless Architecture](../Lesson_Notes/19_20_Serverless_Lambda_APIGW_DynamoDB.md)
- 📖 [Tài Liệu Chuyên Sâu: AWS Lambda Serverless](./Lambda_Serverless_Architecture.md)
- 📖 [Tài Liệu Chuyên Sâu: Amazon DynamoDB NoSQL](./DynamoDB_NoSQL_Databases.md)
- 📖 [Cẩm Nang Từ Vựng Giải Mã Đề Thi](../EXAM_VOCABULARY.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật Đám Mây](../GLOSSARY.md)

