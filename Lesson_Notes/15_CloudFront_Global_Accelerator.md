# Ghi Chú Bài Học: Chương 15 - Mạng Phân Phối Nội Dung CloudFront & Tăng Tốc Toàn Cầu (CloudFront & Global Accelerator)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 15 - CloudFront & AWS Global Accelerator (Bài 165 đến Bài 171)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon S3 & CloudFront](file:///n:/AWS_XBrain_Note/AWS_Services/S3_and_CloudFront_Storage.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này trang bị kiến thức về hai công nghệ tăng tốc truy cập mạng toàn cầu của AWS: Mạng phân phối nội dung **Amazon CloudFront (CDN)** (kiến trúc Edge Locations, các loại Origin: S3, ALB, EC2, HTTP server ngoài, bảo vệ Origin qua OAC, giới hạn địa lý Geo Restriction, xóa bộ nhớ đệm Cache Invalidation) và dịch vụ tăng tốc lưu lượng mạng trục **AWS Global Accelerator** (cơ chế hoạt động của Anycast IP, tối ưu hóa giao thức TCP/UDP, tăng tính chịu lỗi thảm họa).

### Mục tiêu học tập
1. Hiểu cách thức hoạt động của mạng lưới phân phối nội dung (CDN) và giảm độ trễ cho người dùng toàn cầu.
2. Thiết lập bảo mật cho S3 Origin sử dụng **Origin Access Control (OAC)** để ngăn chặn người dùng vượt qua CloudFront.
3. Nắm được cơ chế xóa bộ nhớ đệm (**Cache Invalidation**) khi cập nhật nội dung khẩn cấp.
4. Hiểu bản chất hoạt động của **AWS Global Accelerator** và so sánh chi tiết với CloudFront.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **CloudFront = Caching Content**: Lưu bản sao nội dung tĩnh (ảnh, video, css, js) tại hơn 400+ Edge Locations toàn cầu; giảm tải trực tiếp cho máy chủ gốc (Origin).
2. **Origin Access Control (OAC)**: Chuẩn bảo mật mới của AWS thay thế cho OAI cũ; hỗ trợ mã hóa SSE-KMS và tương thích toàn bộ các Region mới.
3. **AWS Global Accelerator = Network Proxy (No Cache)**: Cung cấp 2 địa chỉ Anycast IP tĩnh; đưa lưu lượng của người dùng vào mạng trục riêng của AWS tại điểm biên gần nhất; hỗ trợ cả TCP và UDP; không lưu cache.
4. **Cache Invalidation**: Sử dụng khi cần cập nhật file ngay lập tức; đường dẫn có thể là từng file cụ thể (ví dụ `/index.html`) hoặc toàn bộ (ví dụ `/*`).
5. **Geo Restriction**: Cho phép thiết lập Whitelist (chỉ cho phép các quốc gia chỉ định) hoặc Blacklist (chặn các quốc gia chỉ định) ngay tại tầng CloudFront Edge.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. CloudFront Origins & Behaviors
- **S3 Bucket Origin**: Dùng để phân phối các tệp tin tĩnh (Static Assets); luôn luôn kết hợp với OAC để khóa không cho truy cập trực tiếp vào S3.
- **Custom HTTP Origin**: Máy chủ web EC2, Application Load Balancer, hoặc bất kỳ máy chủ HTTP nào ở On-Premises.
- **Cache Behaviors**: Cho phép định tuyến các đường dẫn khác nhau tới các Origin khác nhau (ví dụ: `/api/*` chuyển về ALB không cache; `/images/*` chuyển về S3 cache 30 ngày).

### 2. So sánh CloudFront Functions và Lambda@Edge
- Cả hai đều cho phép thực thi mã nguồn JavaScript/Python ngay tại các điểm biên của CloudFront:
  - **CloudFront Functions**: Viết bằng JavaScript nhẹ, chạy siêu tốc (độ trễ dưới 1 millisecond), chi phí cực rẻ, phù hợp để chuẩn hóa URL, chỉnh sửa HTTP Headers, chuyển hướng URL đơn giản.
  - **Lambda@Edge**: Viết bằng Node.js hoặc Python, có thể gọi ra mạng ngoài (gọi database, API bên thứ 3), thời gian thực thi lên tới 30 giây, phù hợp cho việc xác thực token JWT phức tạp, tạo nội dung động (Server-Side Rendering).

---

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn đang vận hành một ứng dụng trò chơi trực tuyến nhiều người chơi (Online Multiplayer Gaming) sử dụng giao thức UDP và yêu cầu độ trễ mạng thấp nhất có thể cho người chơi toàn cầu. Bạn nên chọn dịch vụ nào giữa Amazon CloudFront và AWS Global Accelerator?
2. Khi bạn vừa triển khai một bản vá lỗi khẩn cấp cho file `app.js` trên S3 nhưng người dùng phản ánh họ vẫn đang tải phải file `app.js` phiên bản cũ chứa lỗi từ CloudFront, bạn cần làm gì?
3. Tính năng nào trên Amazon CloudFront giúp bạn giới hạn chỉ cho phép người dùng tại Việt Nam và Nhật Bản truy cập vào nội dung video của bạn?
4. AWS Global Accelerator cung cấp bao nhiêu địa chỉ IP tĩnh công khai (Anycast IP) cho mỗi bộ tăng tốc?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. **AWS Global Accelerator**. Vì CloudFront chỉ hỗ trợ giao thức HTTP/HTTPS và WebSocket (Tầng 7) và có tính năng caching không phù hợp cho game thời gian thực; trong khi Global Accelerator hỗ trợ tối ưu giao thức UDP (Tầng 4) qua mạng trục AWS.
2. Thực hiện thao tác **Cache Invalidation** trên CloudFront Distribution cho đường dẫn `/app.js` (hoặc `/*`) để xóa bỏ bản sao cũ khỏi bộ nhớ đệm tại toàn bộ các Edge Locations.
3. Tính năng **CloudFront Geographic Restrictions (Geo Restriction)** ở chế độ **Allowlist (Whitelist)**, chỉ thêm hai quốc gia là Việt Nam và Nhật Bản.
4. Cung cấp **2 địa chỉ Anycast IPv4 tĩnh**.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [165 - CloudFront Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/15%20-%20CloudFront%20&%20AWS%20Global%20Accele/165%20-%20CloudFront%20Overview.md)
  - [167 - CloudFront - ALB_EC2 as an Origin.md](file:///n:/AWS_XBrain_Note/AWS_Resources/15%20-%20CloudFront%20&%20AWS%20Global%20Accele/167%20-%20CloudFront%20-%20ALB_EC2%20as%20an%20Origin.md)
  - [168 - CloudFront - Geo Restriction.md](file:///n:/AWS_XBrain_Note/AWS_Resources/15%20-%20CloudFront%20&%20AWS%20Global%20Accele/168%20-%20CloudFront%20-%20Geo%20Restriction.md)
  - [169 - CloudFront - Cache Invalidation.md](file:///n:/AWS_XBrain_Note/AWS_Resources/15%20-%20CloudFront%20&%20AWS%20Global%20Accele/169%20-%20CloudFront%20-%20Cache%20Invalidation.md)
  - [170 - AWS Global Accelerator - Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/15%20-%20CloudFront%20&%20AWS%20Global%20Accele/170%20-%20AWS%20Global%20Accelerator%20-%20Overview.md)
