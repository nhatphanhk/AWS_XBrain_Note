# 04 — NETWORK KEYWORDS: VPC, Route 53, ELB, CDN

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ NETWORKING & CONTENT DELIVERY

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon VPC** | Mạng riêng ảo biệt lập logic (Virtual Network) cho tài khoản AWS của bạn. | Toàn quyền kiểm soát cấu trúc mạng: dải CIDR, chia Public/Private Subnets, Route Tables, Internet/NAT Gateways. | *"Mảnh đất có hàng rào kiên cố: Tự phân chia phòng khách (Public) và phòng ngủ (Private)."* |
| **AWS Transit Gateway** | Thiết bị định tuyến đám mây trung tâm (Cloud Router) theo mô hình hình sao (Hub-and-Spoke). | Kết nối hàng trăm VPC và mạng On-Premises về một điểm duy nhất, loại bỏ mạng nhện VPC Peering. | *"Vòng xuyến giao thông trung tâm: Mọi ngả đường VPC đều đổ về một đầu mối điều phối."* |
| **AWS PrivateLink** | Công nghệ kết nối mạng riêng tư an toàn qua card mạng ảo ENI có IP riêng trong subnet. | Truy cập các dịch vụ AWS hoặc SaaS mà không đi ra Internet công cộng; **giải pháp duy nhất kết nối VPC trùng IP (Overlapping CIDR)**. | *"Đường hầm bí mật: Đi ngầm dưới lòng đất đến thẳng nhà đối tác, không cần biết số nhà."* |
| **Application Load Balancer (ALB)** | Bộ cân bằng tải Layer 7 (HTTP/HTTPS/WebSocket). | Định tuyến thông minh theo URL path (`/api`), host header, tích hợp WAF và xác thực người dùng cho web app/microservices. | *"Lễ tân khách sạn: Đọc bảng tên và hướng dẫn khách lên đúng số phòng tương ứng."* |
| **Network Load Balancer (NLB)** | Bộ cân bằng tải Layer 4 (TCP/UDP/TLS) hiệu năng siêu cao. | Xử lý hàng triệu request/s với độ trễ microsecond, cung cấp **địa chỉ IP tĩnh (Elastic IP)** cố định cho firewall whitelist. | *"Trạm thu phí tự động cao tốc: Xe phóng qua hàng triệu chiếc/giây không cần phanh."* |
| **Gateway Load Balancer (GWLB)** | Bộ cân bằng tải Layer 3 + Layer 4 tích hợp thiết bị an ninh mạng ảo của bên thứ ba. | Chèn các cụm tường lửa (Palo Alto, Fortinet) vào luồng mạng một cách trong suốt bằng giao thức GENEVE (port 6081). | *"Trạm kiểm soát an ninh sân bay: Soi chiếu toàn bộ hành lý rồi trả lại nguyên vẹn luồng đi."* |
| **AWS Global Accelerator** | Dịch vụ tăng tốc mạng Layer 4 bằng **2 địa chỉ Anycast IP tĩnh** trên mạng trục cáp quang riêng AWS. | Hỗ trợ TCP/UDP, bỏ qua bộ nhớ đệm DNS của client/ISP, chuyển hướng tức thì cho ứng dụng gaming, VoIP, IoT toàn cầu. | *"Đường sắt cao tốc chuyên dụng: Vào ga gần nhất là phóng thẳng tuyến riêng, bỏ qua kẹt xe DNS."* |
| **Amazon CloudFront** | Mạng phân phối nội dung toàn cầu (CDN) Layer 7 với hơn 450+ điểm biên (Edge Locations). | Lưu cache nội dung tĩnh (ảnh, video) và tăng tốc nội dung động, hấp thụ 90% tải và phòng thủ DDoS tại biên với WAF. | *"Chuỗi cửa hàng tiện lợi ven đường: Mua hàng ngay đầu ngõ, không cần lặn lội về kho tổng S3."* |
| **Amazon Route 53** | Dịch vụ phân giải tên miền (DNS) độ sẵn sàng 100% doanh nghiệp và quản lý định tuyến lưu lượng. | Dịch tên miền thành IP với các chính sách thông minh: Geolocation, Geoproximity (Bias), Latency, Failover, Weighted. | *"Tổng đài chuyển hướng cuộc gọi thông minh: Nhìn người gọi từ đâu để nối máy tới chi nhánh tốt nhất."* |
| **AWS Direct Connect** | Tuyến cáp vật lý chuyên dụng riêng biệt từ On-Premises đến AWS qua đối tác viễn thông. | Đường truyền mạng cực lớn (1G–100Gbps), độ trễ ổn định, bảo mật cao không đi qua mạng Internet công cộng. | *"Đường dây điện thoại nóng bảo mật: Cáp quang kéo thẳng từ phòng sếp sang cơ quan đối tác."* |
| **AWS Site-to-Site VPN** | Đường hầm mạng riêng ảo mã hóa IPsec qua Internet công cộng giữa On-Prem và AWS. | Triển khai kết nối an toàn nhanh chóng trong vài phút, chi phí thấp hoặc làm kênh dự phòng (backup) cho Direct Connect. | *"Hầm chui an toàn qua phố đông: Xe bọc thép chạy qua đường phố công cộng có bảo vệ hộ tống."* |
| **AWS Network Firewall** | Tường lửa mạng Stateful L3–L7 có kiểm tra sâu gói tin và lọc tên miền FQDN cho toàn bộ VPC. | Bảo vệ toàn diện cấp độ mạng VPC, tích hợp bộ quy tắc phòng chống xâm nhập mã nguồn mở Suricata IPS. | *"Hệ thống kiểm dịch thành phố: Kiểm tra mọi xe ra vào thành phố theo luật kiểm dịch nghiêm ngặt."* |

---

## 🌐 VPC CONNECTIVITY — Chọn Đúng Giải Pháp

| Scenario | Solution | 💡 Vì Sao | Tránh |
|:---|:---|:---|:---|
| "2 VPCs connect, non-overlapping CIDR" | **VPC Peering** | Direct connection, low latency, no bandwidth limit. Nhưng không transitive (A-B-C, A không reach C qua B). | ~~TGW~~ (overkill) |
| "100+ VPCs connect centrally (hub-and-spoke)" | **Transit Gateway** | TGW = router trung tâm, 1 attachment/VPC. VPC Peering = N×(N-1)/2 connections → quản lý ác mộng. | ~~VPC Peering~~ |
| "overlapping CIDR VPCs need to connect" | **AWS PrivateLink** | Peering và TGW reject CIDR conflict. PrivateLink dùng NLB làm backend → không phụ thuộc vào IP routing. | ~~VPC Peering~~ ~~TGW~~ |
| "on-prem → AWS private connection (dedicated)" | **AWS Direct Connect** | Cáp vật lý riêng, stable latency, không qua internet. Dùng khi cần bandwidth lớn, low jitter (voice, real-time). | ~~Site-to-Site VPN~~ (internet, variable latency) |
| "on-prem → AWS encrypted tunnel over internet" | **Site-to-Site VPN** (IPsec) | Nhanh hơn Direct Connect về setup (vài phút vs vài tuần). Max 1.25 Gbps. Dùng khi Direct Connect chưa sẵn sàng hoặc budget thấp. | ~~Direct Connect~~ (nếu chỉ cần basic connectivity) |
| "Direct Connect + backup in case of failure" | **DX + VPN as backup** | DX primary → VPN failover khi DX mất. BGP route preference ưu tiên DX. | ~~DX alone~~ |
| "access S3/DynamoDB from VPC without NAT (free)" | **Gateway VPC Endpoint** | Miễn phí $0, chỉ thêm route vào Route Table. Traffic không ra internet. Chỉ S3 + DynamoDB. | ~~Interface Endpoint~~ (có phí) |
| "access any AWS service from VPC privately (ENI)" | **Interface VPC Endpoint (PrivateLink)** | Tạo ENI trong subnet, có private IP. 100+ dịch vụ AWS. Tính phí theo giờ + data. | ~~Gateway Endpoint~~ (chỉ S3/DynamoDB) |
| "copy raw packets from ENI for IDS/DPI" | **VPC Traffic Mirroring** | Sao chép **toàn bộ gói tin** (payload) → gửi đến appliance IDS. VPC Flow Logs chỉ ghi metadata (src/dst IP, port, bytes) — không có payload. | ~~VPC Flow Logs~~ |
| "third-party firewall appliance (Palo Alto, Fortinet) inline" | **Gateway Load Balancer (GWLB)** + GENEVE 6081 | GWLB = transparent inline — gói tin qua appliance kiểm tra rồi trả về, ứng dụng không biết. | ~~ALB~~ ~~NLB~~ |
| "VPC-level L7 stateful firewall, domain filter, Suricata IPS" | **AWS Network Firewall** | Network Firewall = managed stateful firewall, hỗ trợ FQDN filtering, Suricata IPS rules. SG/NACL = chỉ IP/port đơn giản. | ~~NACL~~ ~~Security Group~~ |
| "centralize WAF/Shield/NF across all org accounts" | **AWS Firewall Manager** | Firewall Manager = deploy và enforce WAF rules, Shield, NF, DNS Firewall tự động lên mọi account mới trong Organizations. | ~~WAF standalone~~ |

---

## ⚖️ LOAD BALANCER — Chọn Đúng Loại

| Load Balancer | Layer | Protocols | 💡 Vì Sao Chọn | Keyword |
|:---|:---|:---|:---|:---|
| **ALB** (Application) | L7 | HTTP/HTTPS/WebSocket | Path/host-based routing, WAF attach, header/cookie-based routing. Dùng cho microservices và web apps. | "HTTP routing", "path /api vs /web", "WAF integration" |
| **NLB** (Network) | L4 | TCP/UDP/TLS | Ultra-low latency (ms), static Elastic IP, PrivateLink backend. Dùng cho real-time apps, gaming, VoIP. | "static IP", "TCP/UDP", "ultra-low latency", "PrivateLink" |
| **GWLB** (Gateway) | L3+L4 | IP (GENEVE) | Chạy traffic qua third-party virtual appliances (firewall, IDS/IPS). Transparent cho ứng dụng. | "third-party firewall", "inline inspection", "Palo Alto/Fortinet" |
| **CLB** (Classic) | L4+L7 | HTTP/HTTPS/TCP | **Legacy only** — không dùng cho thiết kế mới. | Không dùng |

> ⚠️ **NLB vs ALB**:  
> NLB = static Elastic IP → đối tác có thể whitelist IP cụ thể trong firewall  
> ALB = không có static IP → nếu cần static IP, dùng **Global Accelerator** trước ALB

---

## ⚡ GLOBAL ACCELERATOR vs CLOUDFRONT — Phân Biệt Dứt Khoát

| Feature | AWS Global Accelerator | Amazon CloudFront | 💡 Móc Nhớ |
|:---|:---|:---|:---|
| **IP type** | **2 Static Anycast IPs** | Dynamic (DNS-based) | GA = IP cố định như nhà. CF = IP thay đổi theo DNS. |
| **Layer** | L4 (TCP/UDP) | L7 (HTTP/HTTPS/WebSocket) | GA = network. CF = application. |
| **Caching** | ❌ Không cache | ✅ Edge caching | CF = reduce origin load. GA = chỉ route. |
| **DNS cache bypass** | ✅ Anycast → instant | ❌ TTL vẫn áp dụng | GA = failover tức thì. CF = phụ thuộc TTL. |
| **Protocols** | **TCP AND UDP** | HTTP/HTTPS only | GA cho gaming/VoIP (UDP). CF chỉ HTTP. |

**💡 Trigger 100% chọn Global Accelerator**: "static IP", "UDP", "gaming", "VoIP", "bypass DNS cache", "partner whitelist firewall IP"  
**💡 Trigger 100% chọn CloudFront**: "CDN", "cache", "edge", "HTTP content", "WAF", "Lambda@Edge"

---

## 🔀 ASG SCALING POLICIES — Vì Sao Chọn Loại Nào

| Policy | 💡 Vì Sao Chọn | Keyword |
|:---|:---|:---|
| **Simple Scaling** | Add/remove N instance khi alarm trigger. Có cooldown period. Đơn giản nhất nhưng chậm vì phải chờ cooldown. | "basic scaling" |
| **Step Scaling** | Alarm → nhiều bước tùy mức độ nghiêm trọng (CPU 70% → +2, CPU 90% → +5). **Không cooldown giữa các bước** → phản ứng nhanh với flash sale. | "sudden spike", "flash sale", "fast response" |
| **Target Tracking** | Giữ metric ở mức target (ví dụ CPU = 50%). AWS tự tính số instance cần. Đây là **best practice phổ biến nhất**. | "maintain CPU at 50%", "auto adjust" |
| **Scheduled Scaling** | Biết trước pattern (8am thêm 10 instance, 10pm giảm). Không cần alarm. | "predictable load", "business hours", "known schedule" |
| **Predictive Scaling** | ML dự báo tải → scale in advance. Tốt cho recurring patterns theo ngày/tuần. | "recurring pattern", "proactive scaling", "ML forecast" |

> ⚠️ **Step Scaling vs Simple Scaling**: Step Scaling = **NO cooldown giữa các bước** → phản ứng nhanh hơn với tải đột ngột. Dùng cho flash sale, livestream.

**ASG Lifecycle Hooks — Móc Nhớ**:
- `Pending:Wait` → "Boot xong nhưng **chưa nhận traffic** — chạy script cài phần mềm trước"
- `Terminating:Wait` → "Sắp bị xóa nhưng **chưa chết** — thu thập logs trước"

---

## 🌍 ROUTE 53 ROUTING POLICIES — Bảng So Sánh

| Policy | 💡 Vì Sao Chọn | Keyword Trigger |
|:---|:---|:---|
| **Simple** | 1 endpoint. Không health check. Trả về IP ngẫu nhiên nếu nhiều value. | "single endpoint", "basic DNS" |
| **Weighted** | A/B testing (90% → v1, 10% → v2). Canary deployment. Weight 0 = không gửi traffic. | "A/B test", "canary", "gradual rollout" |
| **Latency** | Route đến region có latency thấp nhất (đo từ AWS infrastructure đến region, không phải đến user). | "lowest latency", "nearest region" |
| **Failover** | Active-Passive DR. Primary health check fail → switch sang Secondary (có thể là S3 static page). | "DR failover", "primary-backup", "health check" |
| **Geolocation** | Route dựa trên **vị trí người dùng** (country/continent). Dùng để localize content hoặc restrict access theo pháp lý. | "users in Vietnam → VN endpoint", "legal restriction by country" |
| **Geoproximity** | Dựa trên vị trí người dùng + tài nguyên. **Bias parameter** (-99 → +99) để mở rộng/thu hẹp vùng phục vụ. | "shift traffic", "traffic engineering", "bias dial" |
| **Multi-Value** | Trả về nhiều IPs + health check từng IP. Không phải load balancer nhưng client chọn IP healthy. | "multiple IPs", "simple failover without LB" |

> ⚠️ **Geolocation vs Geoproximity**:  
> **Geolocation** = CHỈ nhìn vị trí user (country/continent).  
> **Geoproximity** = nhìn cả user lẫn resource + có **Bias** để điều chỉnh. "Shift 20% traffic from US-East sang US-West" → Geoproximity.

**Alias vs CNAME — Nhớ 10 Giây**:  
_"**A**lias = **A**pex domain OK (example.com). **C**NAME = **C**hỉ cho subdomain (sub.example.com)."_  
Alias = miễn phí query. Alias chỉ trỏ vào AWS resources (ALB, CloudFront, S3 website, Elastic Beanstalk).

---

## 🔧 HYBRID DNS — Phải Nhớ Bidirectional

```
On-prem gọi VPC DNS:    → Cần Route 53 Resolver Inbound Endpoint
VPC gọi On-prem DNS:    → Cần Route 53 Resolver Outbound Endpoint + Forwarding Rules
Bidirectional (2 chiều): → Phải có CẢ HAI endpoint
```

**💡 Móc nhớ**: _"Inbound = traffic **vào** VPC. Outbound = traffic **ra khỏi** VPC. Bidirectional = cần cả 2 cổng."_

---

## 🛡️ NETWORK SECURITY — Bảng So Sánh Nhanh

| Service | Stateful? | Layer | Scope | 💡 Dùng Khi |
|:---|:---|:---|:---|:---|
| **Security Group** | ✅ | L3-L4 | Instance/ENI | "allow port 443 from anywhere" — cấp instance |
| **NACL** | ❌ | L3-L4 | Subnet | "explicit deny subnet" — stateless, cần allow cả inbound + outbound |
| **AWS WAF** | L7 | HTTP | CloudFront/ALB/APIGW | "SQLi", "XSS", "rate-limit", "HTTP rules" |
| **Network Firewall** | ✅ | L3-L7 | VPC | "FQDN filter", "Suricata IPS", "VPC-wide inspection" |
| **Shield Standard** | Auto | L3-L4 | All | Basic DDoS protection, free, automatic |
| **Shield Advanced** | Managed | L3-L7 | CloudFront/ALB/Route53 | "DRT team 24/7", "cost protection after DDoS", "advanced monitoring" |

**💡 Móc nhớ Security Group vs NACL**:  
_"SG = **S**tateful = **S**mart (nhớ connection, chỉ cần allow inbound). NACL = **N**ot stateful = phải allow cả 2 chiều."_
