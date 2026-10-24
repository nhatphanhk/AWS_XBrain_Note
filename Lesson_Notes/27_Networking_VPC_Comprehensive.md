# Ghi Chú Bài Học: Chương 27 - Hạ Tầng Mạng Riêng Ảo Amazon VPC Toàn Tập (Networking - VPC Comprehensive)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 27 - Networking - VPC (Bài 313 đến Bài 350)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon VPC & Networking](file:///n:/AWS_XBrain_Note/AWS_Services/VPC_Networking.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này là chương lớn nhất và quan trọng nhất về kiến trúc mạng trên AWS: nền tảng định địa chỉ IP (**CIDR Blocks**, Private vs Public IP), cấu trúc **Default VPC** so với **Custom VPC**, quy tắc phân chia mạng con (**Subnets** và 5 địa chỉ IP dành riêng), cổng kết nối Internet (**Internet Gateway - IGW**) và bảng định tuyến (**Route Tables**), máy chủ nhảy cóc (**Bastion Hosts**), giải pháp chuyển dịch địa chỉ mạng (**NAT Instances vs NAT Gateways**), hai tầng tường lửa (**Security Groups vs Network ACLs**), kết nối mạng ngang hàng (**VPC Peering**), kết nối riêng tư tới dịch vụ AWS (**VPC Endpoints: Gateway vs Interface**), giám sát gói tin (**VPC Flow Logs**), mạng kết nối doanh nghiệp lai (**Site-to-Site VPN, AWS Direct Connect, AWS Transit Gateway**), kỹ thuật bắt gói tin (**VPC Traffic Mirroring**), không gian địa chỉ **IPv6 & Egress-Only Internet Gateway**, tường lửa mạng thế hệ mới **AWS Network Firewall**, và chiến lược tối ưu hóa chi phí truyền tải dữ liệu (**Networking Costs**).

### Mục tiêu học tập
1. Tính toán chính xác dải địa chỉ IPv4 theo ký pháp CIDR và nắm vững 5 địa chỉ IP bị AWS giữ lại trên mỗi subnet.
2. Xây dựng một VPC hoàn chỉnh từ đầu gồm Public Subnet và Private Subnet có kết nối Internet an toàn.
3. So sánh chi tiết và cấu hình đúng giữa Security Groups (Stateful) và Network ACLs (Stateless).
4. Khắc phục triệt để các sự cố định tuyến mạng (Routing loops, Blackhole routes, Peering non-transitive).
5. Tích hợp VPC an toàn với mạng On-Premises thông qua Site-to-Site VPN, Direct Connect và Transit Gateway.
6. Sử dụng VPC Flow Logs và Amazon Athena để điều tra các hành vi xâm nhập mạng bất thường.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **5 IP dành riêng mỗi Subnet**: Network (.0), Router (.1), DNS (.2), Future use (.3), Broadcast (.255). Subnet `/24` có 256 IPs nhưng chỉ dùng được 251 IPs.
2. **Public Subnet vs Private Subnet**:
   - *Public Subnet*: Route Table có `0.0.0.0/0 -> igw`.
   - *Private Subnet*: Route Table có `0.0.0.0/0 -> nat-gateway` (đặt tại Public Subnet).
3. **NAT Gateway**: Bắt buộc đặt ở Public Subnet và gắn Elastic IP; không thể dùng cho IPv6 (IPv6 dùng Egress-Only Internet Gateway).
4. **NACL = Stateless**: Phải mở cả Inbound và Outbound; hỗ trợ luật Deny; xử lý theo số thứ tự (Rule number từ nhỏ đến lớn).
5. **VPC Endpoints**: Gateway Endpoints (S3 & DynamoDB, miễn phí qua Route Table); Interface Endpoints (mọi dịch vụ khác, có phí qua ENI).
6. **Transit Gateway**: Hỗ trợ định tuyến bắc cầu (Transitive routing) theo mô hình Hub-and-Spoke; thay thế hoàn toàn mạng lưới VPC Peering phức tạp.
7. **Chi phí mạng & Chính sách tính phí Public IPv4**:
   - Dữ liệu đi cùng 1 AZ bằng Private IP là miễn phí; đi xuyên AZ tốn 0.01$/GB mỗi chiều; đi qua NAT Gateway tốn thêm 0.045$/GB.
   - **Chính sách Public IPv4 mới**: AWS tính phí **$0.005/giờ** (~$3.6/tháng) cho mỗi địa chỉ Public IPv4. Chiến lược tối ưu trong đề thi: Triển khai Dual-stack IPv6 với Egress-Only Internet Gateway, dùng AWS Systems Manager Session Manager (không cần Public IP / Bastion Host) và chuyển sang VPC Endpoints để tránh lưu lượng đi qua NAT Gateway.
8. **Gateway Load Balancer (GWLB)**: Dùng để triển khai đàn thiết bị tường lửa / IDS / IPS ảo của bên thứ ba (Third-party appliances) ở Layer 3/4 bằng giao thức GENEVE (port 6081) với tính sẵn sàng cao.
9. **Amazon VPC Lattice**: Dịch vụ mạng tầng ứng dụng (Layer 7) đơn giản hóa kết nối, bảo mật và giám sát giữa các microservices xuyên VPCs và xuyên Accounts mà không cần cấu hình định tuyến IP hay xử lý trùng lặp CIDR.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Bastion Host vs AWS Systems Manager Session Manager
- **Bastion Host (Truyền thống)**: Dựng một EC2 nhỏ trong Public Subnet mở cổng 22 SSH có bảo vệ bằng Security Group. Nhược điểm: Tốn chi phí quản lý máy chủ, phải duy trì Public IP (bị tính phí $0.005/h), rủi ro lộ cổng quản trị ra ngoài Internet.
- **AWS SSM Session Manager (Hiện đại - Best Practice)**: Kết nối terminal trực tiếp vào EC2 trong Private Subnet thông qua SSM Agent và IAM Role. **Không cần mở bất kỳ cổng Inbound nào (kể cả port 22)**, **không cần Public IP** và mọi session đều được ghi log đầy đủ vào CloudWatch/S3.

### 2. VPC Flow Logs & Amazon Athena
- **VPC Flow Logs**: Chụp lại metadata của các gói tin mạng IP đi qua ENI trong VPC (gồm Source IP, Destination IP, Port, Protocol, Packets, Bytes, và Action: `ACCEPT` hoặc `REJECT`).
- **Phân tích lỗi qua Flow Logs**:
  - Nếu thấy gói tin bị `REJECT` ở chiều Inbound: Có thể do Security Group hoặc NACL Inbound chặn.
  - Nếu thấy Inbound `ACCEPT` nhưng phản hồi bị `REJECT`: Chắc chắn do **Network ACL Outbound** chặn dải cổng Ephemeral Ports.

### 3. Amazon VPC Lattice vs Transit Gateway
- **AWS Transit Gateway (Network Layer - Layer 3/4)**: Đóng vai trò như một bộ định tuyến trung tâm (Cloud Router) kết nối hàng trăm VPCs và On-Premises qua bảng định tuyến IP (Route Tables). Yêu cầu các VPC không được trùng dải IP CIDR.
- **Amazon VPC Lattice (Application Layer - Layer 7)**: Kết nối trực tiếp giữa các Service với Service (Microservices) độc lập với không gian mạng bên dưới. Tự động xử lý Service Discovery, cân bằng tải Layer 7, xác thực danh tính qua IAM Service Network Policy mà không bận tâm đến IP overlapping.

### 4. Các Bẫy Đề Thi & Mẹo Thực Chiến Về Mạng SAA-C03 (Networking Exam Hacks & Traps)

| Tình huống trong câu hỏi thi | Bẫy thường gặp (Cần tránh) | Mẹo chọn đáp án chuẩn xác |
| :--- | :--- | :--- |
| **Chặn 1 địa chỉ IP độc hại cụ thể** | Chọn Security Group (Sai vì SG không hỗ trợ luật `DENY`) | Chọn **Network ACL (NACL)** với luật `DENY` có số thứ tự nhỏ hơn rule `ALLOW`. |
| **Mở Inbound nhưng Web không trả lời** | Cấu hình lại Security Group | Mở thêm **chiều Outbound cho dải Ephemeral Ports (1024-65535)** trên Network ACL (do tính chất Stateless). |
| **Cho Private Subnet tải update ra ngoài an toàn, ít công vận hành nhất** | Dựng EC2 chạy NAT Instance | Chọn **AWS NAT Gateway** đặt tại Public Subnet (scale tự động tới 45 Gbps, không cần quản lý OS). |
| **Truy cập S3 / DynamoDB từ Private Subnet rẻ nhất** | Đi qua NAT Gateway hoặc Interface Endpoint | Chọn **VPC Gateway Endpoint** (hoàn toàn **MIỄN PHÍ**, cấu hình qua bảng Route Table). |
| **Kết nối mạng hàng chục VPCs và On-premises không bị rối** | Tạo mạng lưới chéo VPC Peering | Chọn **AWS Transit Gateway** (mô hình Hub-and-Spoke, hỗ trợ định tuyến bắc cầu Transitive). |
| **Tăng tốc game/video trực tiếp dùng UDP với IP tĩnh cố định** | Chọn Amazon CloudFront (Sai vì CloudFront không tối ưu giao thức UDP và không cấp Anycast IP tĩnh cho server) | Chọn **AWS Global Accelerator** (cung cấp 2 IP Anycast tĩnh, định tuyến qua hạ tầng mạng backbone của AWS). |
| **Kết nối SSH vào EC2 Private không tốn chi phí Public IP** | Dựng Bastion Host có gắn Elastic IP (tốn $0.005/h cho Public IP) | Chọn **AWS Systems Manager Session Manager** (không cần Public IP, không cần mở port 22, bảo mật bằng IAM). |

---

### Câu hỏi:
1. Bạn có một VPC với dải mạng `10.0.0.0/16`. Bạn chia thành 4 Subnets với dải `/24`. Mỗi Subnet có thể khởi chạy tối đa bao nhiêu máy chủ EC2?
2. Một máy chủ cơ sở dữ liệu nằm trong Private Subnet cần tải bản cập nhật phần mềm từ Internet nhưng tuyệt đối không được phép cho người dùng trên Internet kết nối trực tiếp vào máy chủ này. Bạn cần cấu hình những thành phần mạng nào?
3. Tại sao khi bạn cấu hình một luật ALLOW cổng 80 trên Inbound của Network ACL, người dùng vẫn không thể tải được trang web từ máy chủ của bạn?
4. Bạn có 3 VPC: VPC-A, VPC-B và VPC-C. Bạn đã thiết lập VPC Peering giữa A và B, và giữa B và C. Máy ảo ở VPC-A có thể kết nối sang VPC-C được không? Vì sao?
5. Bạn muốn giảm thiểu chi phí truyền dữ liệu khi hàng ngàn máy ảo EC2 trong Private Subnet liên tục đọc và ghi dữ liệu khổng lồ vào Amazon S3. Giải pháp kiến trúc mạng tối ưu nhất là gì?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Tối đa **251 máy chủ EC2** trên mỗi Subnet (256 địa chỉ trừ đi 5 địa chỉ IP mà AWS giữ lại mặc định).
2. Cần cấu hình một **NAT Gateway** đặt trong **Public Subnet** (có gắn Elastic IP), sau đó cập nhật bảng định tuyến (Route Table) của Private Subnet có dòng `0.0.0.0/0 -> nat-gateway-id`.
3. Vì Network ACL là **Stateless (Phi trạng thái)**: Khi mở chiều Inbound cổng 80, bạn bắt buộc phải mở thêm **chiều Outbound cho dải cổng tạm thời (Ephemeral Ports: từ 1024 đến 65535)** để máy chủ web có thể gửi gói tin phản hồi về cho trình duyệt của client.
4. **KHÔNG THỂ**. Vì VPC Peering không hỗ trợ định tuyến bắc cầu (**Non-transitive Routing**). Muốn A kết nối với C, bạn phải tạo thêm một Peering Connection trực tiếp giữa A và C, hoặc sử dụng **AWS Transit Gateway**.
5. Tạo một **VPC Gateway Endpoint cho Amazon S3** và liên kết với Route Table của Private Subnet. Lưu lượng truy cập S3 sẽ đi trực tiếp qua mạng ngầm nội bộ của AWS hoàn toàn **MIỄN PHÍ**, không đi qua NAT Gateway và không tốn cước xử lý dữ liệu.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [314 - CIDR, Private vs Public IP.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/314%20-%20CIDR,%20Private%20vs%20Public%20IP.md)
  - [318 - Subnet Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/318%20-%20Subnet%20Overview.md)
  - [320 - Internet Gateways & Route Tables.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/320%20-%20Internet%20Gateways%20&%20Route%20Tables.md)
  - [322 - Bastion Hosts.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/322%20-%20Bastion%20Hosts.md)
  - [326 - NAT Gateways.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/326%20-%20NAT%20Gateways.md)
  - [329 - NACL & Security Groups.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/329%20-%20NACL%20&%20Security%20Groups.md)
  - [331 - VPC Peering.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/331%20-%20VPC%20Peering.md)
  - [333 - VPC Endpoints.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/333%20-%20VPC%20Endpoints.md)
  - [335 - VPC Flow Logs.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/335%20-%20VPC%20Flow%20Logs.md)
  - [339 - Direct Connect & Direct Connect Gateway.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/339%20-%20Direct%20Connect%20&%20Direct%20Connect%20Gateway.md)
  - [341 - Transit Gateway.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/341%20-%20Transit%20Gateway.md)
  - [349 - Networking Costs in AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/27%20-%20Networking%20-%20VPC/349%20-%20Networking%20Costs%20in%20AWS.md)
