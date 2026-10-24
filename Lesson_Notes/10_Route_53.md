# Ghi Chú Bài Học: Chương 10 - Hệ Thống Phân Giải Tên Miền Đám Mây Amazon Route 53 (Route 53)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 10 - Route 53 (Bài 101 đến Bài 120)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon Route 53](file:///n:/AWS_XBrain_Note/AWS_Services/Route53_DNS.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này trang bị toàn bộ kiến thức về giao thức phân giải tên miền (**DNS 101**) và dịch vụ DNS được quản lý của AWS: **Amazon Route 53** (cơ chế hoạt động, Public vs Private Hosted Zones), quy ước các loại bản ghi DNS (A, AAAA, CNAME, NS, MX, TXT), so sánh bản chất giữa **CNAME** và **Alias Records**, kiểm tra sức khỏe hệ thống (**Route 53 Health Checks**), tám chính sách định tuyến lưu lượng (**Routing Policies**), quản lý tên miền mua từ bên thứ ba (GoDaddy, Namecheap), và giải pháp kết nối mạng lai **Route 53 Resolver (Inbound/Outbound Endpoints)**.

### Mục tiêu học tập
1. Hiểu luồng truy vấn DNS toàn cầu: Root Servers, TLD Servers, SLD Servers, và Authoritative Name Servers.
2. Nắm vững sự khác nhau giữa **Public Hosted Zones** (công khai Internet) và **Private Hosted Zones** (cô lập trong VPC).
3. Hiểu tại sao Zone Apex (`example.com`) không thể dùng CNAME và cách **Alias Record** giải quyết vấn đề này.
4. Làm chủ 8 chính sách định tuyến của Route 53: Simple, Weighted, Latency, Failover, Geolocation, Geoproximity (Traffic Flow), IP-based, Multi-Value.
5. Cấu hình Health Checks đa tầng: Endpoint Checks, Calculated Health Checks, và CloudWatch Alarm Health Checks.
6. Thiết kế giải pháp phân giải tên miền Hybrid Cloud với Route 53 Resolver.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Route 53 Alias Record = Lựa chọn số 1 trên AWS**: Hỗ trợ Zone Apex (`example.com`), miễn phí cước truy vấn, tự động thích ứng với IP động của ALB, CloudFront, S3.
2. **CNAME chỉ dùng cho Subdomain**: Không bao giờ được đặt CNAME cho tên miền gốc (naked domain).
3. **TTL (Time to Live)**: TTL cao (24h) giúp tiết kiệm chi phí truy vấn và tăng tốc độ duyệt web của client; TTL thấp (60s) giúp thay đổi IP lan tỏa tức thì, bắt buộc phải hạ TTL trước khi di chuyển hệ thống.
4. **Failover Policy**: Dành cho kịch bản Active - Passive Disaster Recovery; bản ghi Primary bắt buộc phải gắn Health Check.
5. **Latency vs Geolocation**: Latency định tuyến dựa trên độ trễ đo đạc thực tế; Geolocation định tuyến theo vị trí địa lý của người dùng (ngôn ngữ, chặn nội dung theo luật).
6. **Route 53 Resolver**: Inbound Endpoint cho phép On-Premises query vào VPC; Outbound Endpoint cho phép VPC query về DNS On-Premises.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Phân loại Route 53 Health Checks
- **Endpoint Health Checks**: Giám sát một địa chỉ IP công khai hoặc một URL domain cụ thể (gửi request mỗi 10 hoặc 30 giây). Nếu hơn 18% các điểm kiểm tra trên thế giới báo lỗi, Route 53 coi endpoint là `Unhealthy`. Hỗ trợ kiểm tra chuỗi phản hồi (String matching - kiểm tra xem body trả về có chứa chữ "OK" không).
- **Calculated Health Checks**: Kết hợp trạng thái của nhiều Health Checks con lại với nhau bằng các toán tử logic (AND, OR, NOT). Ví dụ: Chỉ báo Unhealthy nếu có ít nhất 3 trong số 5 API servers bị lỗi.
- **CloudWatch Alarm Health Checks**: Giám sát các tài nguyên nằm trong Private Subnet không thể kiểm tra từ Internet công cộng. CloudWatch theo dõi CPU hoặc Metric nội bộ và kích hoạt Route 53 chuyển hướng khi có sự cố.

### 2. Geolocation vs Geoproximity Routing
- **Geolocation**: Dựa trên quốc gia hoặc châu lục của client. Ví dụ: Người dùng từ Việt Nam luôn được trỏ về máy chủ Singapore; người dùng từ Đức luôn được trỏ về Frankfurt.
- **Geoproximity**: Dựa trên tọa độ địa lý (kinh độ, vĩ độ) của người dùng và của datacenter. Điểm đặc biệt: Cho phép điều chỉnh giá trị **Bias** (độ lệch từ -99 đến +99) để mở rộng hoặc thu hẹp vùng phục vụ của một trung tâm dữ liệu nhằm điều tiết tải.

---

## 4.4. Lệnh và Cấu Hình Thực Tế (Commands & Config)

### Kiểm tra bản ghi DNS từ máy tính cá nhân:
```bash
# Truy vấn bản ghi A của tên miền
nslookup mydomain.com

# Kiểm tra chi tiết kèm thời gian TTL bằng công cụ dig
dig mydomain.com +nocmd +noall +answer

# Truy vấn trực tiếp vào Name Server của Route 53
dig @ns-xxx.awsdns-xx.org mydomain.com
```

---

## 4.5. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn vừa đăng ký một tên miền tại Namecheap và muốn sử dụng Amazon Route 53 để quản lý toàn bộ các bản ghi DNS cho tên miền đó. Bạn cần cập nhật thông tin gì trên trang quản trị của Namecheap?
2. Khi bạn muốn người dùng ở châu Âu xem phiên bản tiếng Pháp/Đức và người dùng ở châu Á xem phiên bản tiếng Anh/Việt, chính sách định tuyến nào là phù hợp nhất?
3. Tại sao bản ghi Route 53 Alias Record được xem là lựa chọn tối ưu hơn hẳn so với CNAME Record khi trỏ về một Application Load Balancer?
4. Đâu là yêu cầu bắt buộc đối với một AWS VPC để các máy ảo bên trong có thể phân giải được tên miền từ một Route 53 Private Hosted Zone?
5. Multi-Value Answer Routing Policy khác gì so với Simple Routing Policy khi trả về nhiều địa chỉ IP?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Bạn tạo một **Public Hosted Zone** trên Route 53, lấy danh sách **4 máy chủ Name Servers (NS Records)** do Route 53 cấp, sau đó đăng nhập vào Namecheap và cập nhật danh sách Custom DNS bằng 4 Name Servers này.
2. **Geolocation Routing Policy (Định tuyến theo vị trí địa lý)**.
3. Vì: (1) Hỗ trợ cho cả tên miền gốc Zone Apex (`example.com`) mà CNAME không làm được; (2) Hoàn toàn **miễn phí cước truy vấn DNS**; (3) Tự động nhận biết sự thay đổi địa chỉ IP ngầm của ALB mà không làm tăng độ trễ truy vấn.
4. VPC bắt buộc phải bật 2 thuộc tính: `enableDnsHostnames = true` và `enableDnsSupport = true`.
5. **Simple Routing** trả về danh sách IP ngẫu nhiên mà **không kiểm tra sức khỏe** của các IP đó (nếu 1 IP chết người dùng vẫn có thể bị trỏ vào); trong khi **Multi-Value Answer Routing** kết hợp với **Route 53 Health Checks** để **chỉ trả về tối đa 8 địa chỉ IP đang thực sự khỏe mạnh (Healthy)**.
</details>

---

## 4.6. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [101 - What is a DNS _.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/101%20-%20What%20is%20a%20DNS%20_.md)
  - [102 - Route 53 Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/102%20-%20Route%2053%20Overview.md)
  - [106 - Route 53 - TTL.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/106%20-%20Route%2053%20-%20TTL.md)
  - [107 - Route 53 CNAME vs Alias.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/107%20-%20Route%2053%20CNAME%20vs%20Alias.md)
  - [109 - Routing Policy - Weighted.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/109%20-%20Routing%20Policy%20-%20Weighted.md)
  - [110 - Routing Policy - Latency.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/110%20-%20Routing%20Policy%20-%20Latency.md)
  - [111 - Route 53 - Health Checks.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/111%20-%20Route%2053%20-%20Health%20Checks.md)
  - [113 - Routing Policy - Failover.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/113%20-%20Routing%20Policy%20-%20Failover.md)
  - [114 - Routing Policy - Geolocation.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/114%20-%20Routing%20Policy%20-%20Geolocation.md)
  - [117 - Routing Policy - Multi Value.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/117%20-%20Routing%20Policy%20-%20Multi%20Value.md)
  - [119 - Route 53 Resolvers & Hybrid DNS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/10%20-%20Route%2053/119%20-%20Route%2053%20Resolvers%20&%20Hybrid%20DNS.md)
