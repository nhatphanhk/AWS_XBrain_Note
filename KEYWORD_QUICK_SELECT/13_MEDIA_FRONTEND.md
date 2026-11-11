# 13 — MEDIA SERVICES & FRONTEND WEB/MOBILE KEYWORDS: MediaConvert, Kinesis Video Streams, IVS, Amplify, Device Farm & Location Service

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ MEDIA & FRONTEND

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **AWS Elemental MediaConvert**| Dịch vụ chuyển mã video dạng tệp tin (File-based Video Transcoding) chất lượng truyền hình. | Chuyển đổi video VOD (Video on Demand) lưu trên S3 sang nhiều định dạng/độ phân giải (HLS, DASH, CMAF), thêm phụ đề, watermark, DRM. | *"Xưởng lồng tiếng và đóng đĩa phim: Cắt gọt, đóng logo và nén phim thành nhiều bản cho mọi loại đầu đọc."* |
| **Amazon Elastic Transcoder** | Dịch vụ chuyển mã media cũ dạng serverless trên S3 (đã được thay thế bởi MediaConvert). | Chuyển đổi định dạng file video/audio lưu trên S3 sang chuẩn phát được trên điện thoại, PC, TV. *(Đề SAA-C03 vẫn có thể xuất hiện đáp án này)*. | *"Máy nén video đời cũ: Đổi đuôi video đơn giản, tính tiền theo số phút video xử lý."* |
| **Amazon Kinesis Video Streams**| Nền tảng hấp thụ, lưu trữ và xử lý luồng video/âm thanh từ hàng triệu thiết bị vật lý thời gian thực. | Thu thập video từ camera an ninh, drone, thiết bị IoT để lưu trữ hoặc truyền trực tiếp vào **Amazon Rekognition Video** để nhận diện khuôn mặt; WebRTC 2 chiều. | *"Đầu ghi camera giám sát trên mây: Nhận tín hiệu từ hàng ngàn mắt camera và kết nối với AI nhận diện tội phạm."* |
| **Amazon IVS (Interactive Video Service)**| Nền tảng phát sóng trực tiếp (Livestreaming) tương tác độ trễ cực thấp (< 5s), sử dụng công nghệ của **Twitch**. | Xây dựng tính năng livestream bán hàng, stream game cho hàng triệu khán giả mà không cần hiểu sâu về kỹ thuật video; tích hợp chat và bình chọn (poll). | *"Kênh truyền hình Twitch thu nhỏ: Bật camera là phát sóng toàn cầu với độ trễ siêu thấp dưới 5 giây."* |
| **AWS Elemental MediaLive** | Dịch vụ mã hóa luồng video trực tiếp (Live Video Encoding) chuẩn phát thanh truyền hình. | Nhận luồng video trực tiếp từ sự kiện thể thao, đài truyền hình và mã hóa thành nhiều luồng đa bitrate (ABR) để phát sóng. | *"Xe truyền hình lưu động: Mã hóa trực tiếp trận bóng đá đỉnh cao gửi về đài phát sóng."* |
| **AWS Elemental MediaPackage** | Dịch vụ đóng gói và bảo vệ bản quyền nội dung video (Packaging & DRM). | Nhận luồng từ MediaLive, đóng gói thành các định dạng HLS/DASH kèm khóa bảo vệ bản quyền DRM và tính năng xem lại (Time-shift, tua lại). | *"Người đóng gói bưu kiện truyền hình: Dán nhãn bảo mật và đóng thùng video gửi ra mạng phân phối CloudFront."* |
| **AWS Amplify** | Bộ công cụ và nền tảng hosting để xây dựng, triển khai ứng dụng web/mobile full-stack nhanh chóng. | Dành cho Frontend Developers dựng nhanh app React, Vue, Next.js, Flutter kèm backend (Cognito, AppSync, DynamoDB, S3) từ Git CI/CD. | *"Bộ đồ nghề xây nhà lắp ghép: Chỉ cần ráp các tấm tường có sẵn là có ngay ngôi nhà đầy đủ điện nước."* |
| **AWS Device Farm** | Dịch vụ kiểm thử ứng dụng web và mobile trên **thiết bị phần cứng thật** trên đám mây. | Chạy thử nghiệm tự động hoặc điều khiển từ xa trên hàng trăm dòng điện thoại Android/iOS thật mà không dùng phần mềm giả lập (Emulator). | *"Showroom điện thoại khổng lồ: Mượn hàng trăm chiếc điện thoại thật để bấm thử nghiệm xem app có bị đơ."* |
| **Amazon Location Service** | Dịch vụ tích hợp bản đồ, định vị địa điểm, tính toán tuyến đường và hàng rào địa lý (Geofencing). | Thêm tính năng bản đồ và theo dõi vị trí tài xế giao hàng vào ứng dụng an toàn với dữ liệu từ Esri và HERE Maps. | *"Bản đồ định vị riêng của công ty: Vẽ đường đi và cảnh báo khi xe giao hàng chạy ra khỏi khu vực."* |
| **Amazon Pinpoint** | Dịch vụ tương tác khách hàng và tiếp thị đa kênh (Marketing Campaigns via Email, SMS, Push, Voice). | Phân khúc khách hàng (Segments), thiết kế chuỗi hành trình gửi thông điệp cá nhân hóa (Journeys) và theo dõi tỷ lệ mở/click. | *"Chuyên gia tiếp thị kỹ thuật số: Nhắn tin khuyến mãi trúng đích cho từng nhóm khách hàng tiềm năng."* |

---

## 🎥 CÁC KIẾN TRÚC XỬ LÝ VIDEO KINH ĐIỂN TRONG ĐỀ THI

### 1. Kiến Trúc Video Theo Yêu Cầu (Video on Demand - VOD Pipeline)
```
[User Upload Video] ──> [S3 Source Bucket]
                              │ (S3 Event Notification)
                              ▼
                        [AWS Lambda]
                              │ (Tạo Job chuyển mã)
                              ▼
                 [AWS Elemental MediaConvert]
                  (Chuyển sang HLS / DASH đa bitrate)
                              │
                              ▼
                     [S3 Output Bucket]
                              │
                              ▼
                     [Amazon CloudFront] ──> [Người Xem Toàn Cầu]
            (Bảo vệ nội dung trả phí bằng Signed URLs)
```

### 2. Kiến Trúc Camera An Ninh Thông Minh (Smart Security Cameras)
```
[Hàng Ngàn Camera] ──> [Amazon Kinesis Video Streams]
                              │
                              ▼
                [Amazon Rekognition Video]
           (Nhận diện người lạ / Biển số xe)
                              │
                              ▼
                 [Amazon Kinesis Data Streams]
                              │
                              ▼
                  [AWS Lambda] ──> [Amazon SNS] ──> [Gửi Cảnh Báo SMS]
```

### 3. Kiến Trúc Phát Sóng Trực Tiếp (Live Streaming Broadcast vs IVS)
- **Tình huống 1: Ứng dụng Livestream tương tác nhanh (Stream game, bán hàng live, có chat và poll tương tác)**:
  - 👉 **CHỌN**: **Amazon IVS (Interactive Video Service)** (Đơn giản nhất, quản lý hoàn toàn, độ trễ < 5s, chi phí thấp).
- **Tình huống 2: Sự kiện thể thao quốc tế, đài truyền hình phát sóng chuyên nghiệp (Broadcast Grade)**:
  - 👉 **CHỌN**: **MediaLive (Live encode) $\rightarrow$ MediaPackage (DRM + Time-shift tua lại) $\rightarrow$ CloudFront $\rightarrow$ Người xem**.

---

## 📱 FRONTEND WEB & MOBILE: CÁC DỊCH VỤ CỐT LÕI

### 1. AWS Amplify (Xây Dựng & Triển Khai Full-Stack)
- **Amplify Hosting**: Cung cấp CI/CD tự động từ Git (GitHub, GitLab, Bitbucket), tích hợp CDN Amazon CloudFront, hỗ trợ Render phía máy chủ (**SSR với Next.js, Nuxt**), tạo URL xem trước (Preview) cho mỗi Pull Request.
- **Amplify Backend (Gen 2)**: Định nghĩa backend bằng TypeScript:
  - Tự động dựng **Cognito** cho chức năng Auth (Đăng ký, Đăng nhập, MFA).
  - Tự động dựng **AppSync / API Gateway** cho tầng API GraphQL/REST.
  - Tự động dựng **DynamoDB** cho tầng lưu trữ cơ sở dữ liệu.
  - Tự động dựng **Amazon S3** cho tầng lưu trữ ảnh/file.
- 💡 **Tín hiệu đề thi**: *"Frontend developers need to quickly build and deploy a full-stack web and mobile application with authentication, database, and CI/CD without cloud infrastructure experience"*.

### 2. AWS Device Farm (Kiểm Thử Trên Thiết Bị Thật)
- Kiểm thử ứng dụng trên **hàng ngàn thiết bị vật lý thật (Real Physical Devices: iPhone, iPad, Samsung Galaxy...)** đặt tại trung tâm dữ liệu của AWS.
- **Không sử dụng thiết bị giả lập (No emulators / simulators)** $\rightarrow$ Giúp phát hiện chính xác các lỗi liên quan đến phần cứng, camera, GPS, pin, bộ nhớ.
- Hỗ trợ chạy các bài test tự động thông qua các framework phổ biến: **Appium, Espresso, XCTest, Calabash**.
- Hỗ trợ chế độ tương tác thủ công từ xa (Remote access) qua trình duyệt web để debug trực tiếp trên màn hình thiết bị thật.

### 3. Amazon Location Service (Bản Đồ & Định Vị)
- Cung cấp 5 tính năng cốt lõi:
  1. `Maps`: Hiển thị bản đồ trực quan (dữ liệu chính xác từ Esri và HERE).
  2. `Places`: Tìm kiếm địa chỉ, chuyển đổi địa chỉ thành tọa độ (Geocoding) và ngược lại (Reverse Geocoding).
  3. `Routes`: Tính toán đường đi tối ưu, ước tính thời gian di chuyển dựa trên tình trạng giao thông thực tế.
  4. `Geofencing`: Thiết lập hàng rào ảo trên bản đồ; tự động bắn sự kiện sang **Amazon EventBridge** khi tài xế/thiết bị đi vào hoặc ra khỏi vùng ranh giới.
  5. `Trackers`: Thu thập và lưu trữ lịch sử vị trí của phương tiện giao thông.
- 💡 **Bẫy thi cần tránh**: Định tuyến DNS dựa trên vị trí người dùng $\rightarrow$ Dùng **Route 53 Geolocation Routing** (không liên quan gì tới Amazon Location Service).

### 4. Amazon Pinpoint vs Amazon SNS vs Amazon SES
| Tiêu Chí | Amazon Pinpoint | Amazon SNS | Amazon SES |
|:---|:---|:---|:---|
| **Mục đích cốt lõi** | **Tiếp thị khách hàng & Phân tích tương tác** | **Thông báo đẩy hệ thống (Pub/Sub)** | **Gửi/nhận email giao dịch quy mô lớn** |
| **Kênh truyền thông** | Đa kênh: Email, SMS, Push Notification, Voice | SMS, Email, Mobile Push, HTTP, SQS, Lambda | **Chỉ chuyên biệt về Email** |
| **Phân khúc người dùng** | ✅ **Hỗ trợ phân nhóm (Segments) và hành trình (Journeys)** | ❌ Không hỗ trợ phân khúc người dùng | ❌ Không hỗ trợ phân khúc |
| **Báo cáo phân tích** | ✅ Đo lường tỷ lệ mở (Open rate), click rate, chuyển đổi | Chỉ có delivery status đơn giản | Đo lường tỷ lệ bounce rate, complaint rate |

---

## 🚀 BẢNG CHỌN NHANH MEDIA & FRONTEND

| Tín Hiệu Đề Thi (Trigger Keywords) | ✅ Đáp Án Chuẩn |
|:---|:---|
| "convert video stored in S3 to multiple formats/bitrates for VOD" | **AWS Elemental MediaConvert** |
| "legacy file-based media transcoder on S3, pay per minute" | **Amazon Elastic Transcoder** |
| "stream video/audio from security cameras, ingest to Rekognition" | **Amazon Kinesis Video Streams** |
| "interactive live video streaming, Twitch technology, latency < 5 seconds" | **Amazon IVS (Interactive Video Service)** |
| "broadcast-grade live video encoding, TV sporting events" | **AWS Elemental MediaLive** |
| "protect live video with DRM and enable catch-up / time-shift TV" | **AWS Elemental MediaPackage** |
| "frontend developer, quickly build full-stack web/mobile app, CI/CD" | **AWS Amplify** |
| "test mobile application on real physical devices, not emulators" | **AWS Device Farm** |
| "maps, vehicle tracking, route calculation, geofencing alerts" | **Amazon Location Service** |
| "marketing campaigns, customer segmentation, multi-channel messaging analytics" | **Amazon Pinpoint** |
| "send transactional emails with high deliverability, SPF/DKIM" | **Amazon SES** |

