# Tài Liệu Học Tập Chuyên Sâu: Elastic Load Balancing (ELB) & Auto Scaling Groups (ASG) (Kiến Trúc Co Giãn & Độ Sẵn Sàng Cao)

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Principal AWS Solutions Architect & Senior Cloud DevOps Engineer (Cập nhật phiên bản kiến trúc mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt chuyên ngành (Bảo lưu toàn bộ thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Mục tiêu**: Phục vụ thi chứng chỉ cấp độ Professional/Specialty (**SAA-C03, SAP-C02, DOP-C02**) và vận hành hệ thống cấp độ doanh nghiệp (**Production-grade**).  
> **Các bài giảng liên quan**: Chương 08 (High Availability and Scalability: Bài 70 đến Bài 86).

---

## 6.1. Tổng Quan Dịch Vụ (Service Overview)

### 1. Định nghĩa chuẩn xác và Phân nhóm dịch vụ
Bộ đôi **Elastic Load Balancing (ELB)** và **Auto Scaling Groups (ASG)** là xương sống kiến trúc nền tảng của mọi hệ thống phân tán có tính sẵn sàng cao (**High Availability - HA**), khả năng chịu lỗi (**Fault Tolerance**) và co giãn đàn hồi (**Elasticity**) trên AWS.

```mermaid
flowchart TD
    ELBFamily[Họ Bộ Cân Bằng Tải AWS - Elastic Load Balancing] --> ALB[Application Load Balancer - ALB\nLayer 7: HTTP, HTTPS, gRPC, WebSocket / Content-based Routing]
    ELBFamily --> NLB[Network Load Balancer - NLB\nLayer 4: TCP, UDP, TLS / Cực nhanh microsecond / Static IP per AZ]
    ELBFamily --> GWLB[Gateway Load Balancer - GWLB\nLayer 3: Gói tin IP thô / GENEVE port 6081 / Inline Network Appliances]
    ELBFamily --> CLB[Classic Load Balancer - CLB [Deprecated]\nThế hệ cũ Layer 4/7 / Không khuyến nghị cho thiết kế mới]

    ASGFamily[Hệ Thống Tự Động Co Giãn - Auto Scaling Group] --> ASG_EC2[ASG for Amazon EC2\nTự động điều phối số lượng máy ảo, Self-healing, Mixed Spot/On-Demand]
    ASGFamily --> AppScaling[Application Auto Scaling\nCo giãn ECS Tasks, DynamoDB RCU/WCU, Aurora Replicas]
```

1. **Application Load Balancer (ALB)**: Hoạt động ở **Tầng 7 (Application Layer)** của mô hình OSI. Chuyên biệt cho lưu lượng HTTP, HTTPS, HTTP/2, gRPC và WebSockets. Có khả năng phân tích chi tiết tiêu đề gói tin để định tuyến thông minh dựa trên đường dẫn URL, hostname, HTTP headers, query strings và hỗ trợ mTLS.
2. **Network Load Balancer (NLB)**: Hoạt động ở **Tầng 4 (Transport Layer)**. Có khả năng xử lý hàng chục triệu requests/giây với độ trễ cực thấp ở mức **microsecond**. Hỗ trợ các giao thức TCP, UDP và TLS passthrough/termination. Cung cấp **địa chỉ Anycast IP tĩnh hoặc Elastic IP cố định cho mỗi Availability Zone**.
3. **Gateway Load Balancer (GWLB)**: Hoạt động ở **Tầng 3 (Network Layer)**. Được thiết kế chuyên biệt để triển khai, mở rộng quy mô và điều phối các thiết bị mạng ảo của bên thứ ba (**Virtual Appliances** như Firewall thế hệ mới NGFW, Intrusion Detection/Prevention Systems - IDS/IPS, Deep Packet Inspection). Sử dụng giao thức đóng gói **GENEVE** trên cổng 6081.
4. **Classic Load Balancer (CLB) `[Deprecated]`**: Bộ cân bằng tải thế hệ cũ (Layer 4/7), hiện đã bị AWS ngừng khuyến nghị và không nên sử dụng cho bất kỳ hệ thống mới nào.
5. **Auto Scaling Groups (ASG)**: Dịch vụ tự động điều chỉnh số lượng máy chủ EC2 tăng lên khi lưu lượng truy cập cao để duy trì hiệu năng, và co cụm giảm bớt khi thấp điểm để tiết kiệm chi phí; đồng thời liên tục giám sát và tự động thay thế các máy chủ bị hỏng (**Self-healing**).

---

### 2. Bài toán cốt lõi mà ELB & ASG giải quyết

1. **Loại bỏ Điểm Lỗi Đơn Lẻ (Single Point of Failure - SPOF)**: Tự động phân phối tải xuyên qua nhiều Availability Zones (tối thiểu 2–3 AZs). Nếu một AZ gặp thảm họa mất điện hoặc đứt cáp quang, ELB tự động chuyển hướng toàn bộ lưu lượng sang các AZ lành lặn còn lại.
2. **Tự Động Phục Hồi Máy Chủ Lỗi (Automated Self-Healing)**: Khi kết hợp với ELB Health Checks, ASG tự động phát hiện các máy chủ bị treo ứng dụng (trả về mã lỗi 5xx), thực hiện chấm dứt máy chủ lỗi và khởi tạo máy chủ mới thay thế tức thì mà không cần kỹ sư can thiệp thủ công.
3. **Tối Ưu Hóa Chi Phí Tự Động (Elastic Cost Optimization)**: Co giãn theo nhu cầu thực tế theo thời gian thực (Dynamic Scaling) hoặc dự báo bằng học máy (Predictive Scaling), kết hợp mô hình linh hoạt giữa On-Demand cho tải nền và Spot Instances cho tải đột biến.

---

### 3. Khi nào KHÔNG nên dùng hoặc Giải pháp thay thế

* ❌ **Cần địa chỉ IP tĩnh công khai cố định cho Load Balancer**: Application Load Balancer (ALB) không cung cấp IP tĩnh (IP thay đổi liên tục theo DNS Resolution).  
  👉 *Giải pháp thay thế*: Sử dụng **Network Load Balancer (NLB)** (cung cấp 1 Elastic IP cố định per AZ), hoặc đặt **AWS Global Accelerator** phía trước ALB để nhận 2 Anycast IP tĩnh.
* ❌ **Xử lý lưu lượng giao thức phi-HTTP yêu cầu độ trễ microsecond cực thấp (Gaming, IoT, RTMP Video)**: ALB chỉ hỗ trợ HTTP/HTTPS/gRPC và xử lý ở tầng 7 với độ trễ vài mili-giây.  
  👉 *Giải pháp thay thế*: Chuyển sang **Network Load Balancer (NLB)** hoạt động ở Layer 4.
* ❌ **Ứng dụng Serverless hoàn toàn không có máy chủ**: Không cần phải tạo Auto Scaling Group cho các hàm Lambda vì Lambda có cơ chế tự động mở rộng quy mô tích hợp sẵn.

---

## 6.2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts, Security & Day-2 Operations)

### 1. Sơ đồ các mô hình kiến trúc của Application Load Balancer

```mermaid
flowchart TD
    User([Người dùng Internet]) -->|DNS Alias| ALB[Application Load Balancer\nPublic Subnets qua 3 AZs]
    
    subgraph TargetGroups["Tầng Đích Xử Lý - Target Groups"]
        subgraph TG_Users["Target Group 1: Users Service"]
            EC2_A[EC2 Node A\nAZ-1a]
            EC2_B[EC2 Node B\nAZ-1b]
        end

        subgraph TG_Orders["Target Group 2: Orders Microservice"]
            ECS_1[ECS Fargate Task C\nDynamic Port]
            ECS_2[ECS Fargate Task D\nDynamic Port]
        end

        subgraph TG_Serverless["Target Group 3: Serverless API"]
            Lambda[AWS Lambda Function]
        end
    end

    ALB -->|Rule 1: Path /api/users/*| TG_Users
    ALB -->|Rule 2: Path /api/orders/*| TG_Orders
    ALB -->|Rule 3: Host webhook.corp.com| TG_Serverless
```

---

### 2. Các tính năng nâng cao cốt lõi của Elastic Load Balancing

#### A. Định tuyến nội dung nâng cao (Advanced Content-Based Routing trên ALB)
* **Path-based Routing**: Định tuyến dựa trên đường dẫn URL (ví dụ: `/api/v1/auth/*` gửi về Auth Cluster, `/static/*` gửi về Static Group).
* **Host-based Routing**: Định tuyến dựa trên trường Host trong HTTP Header (ví dụ: `api.domain.com` và `shop.domain.com` dùng chung 1 ALB).
* **HTTP Header / Method / Query Parameter Routing**: Định tuyến dựa trên giá trị của HTTP Header (ví dụ: `User-Agent: iOS` đẩy về nhóm máy chủ tối ưu di động) hoặc phương thức HTTP (`GET` chuyển về Read Group, `POST` chuyển về Write Group).
* **Weighted Target Groups (Chuyển tải theo tỷ lệ phần trăm)**: Cho phép cấu hình phân bổ lưu lượng (ví dụ: 95% traffic vào Target Group Blue - v1, và 5% vào Target Group Green - v2) để triển khai **Canary Deployment** hoặc **Blue/Green Deployment** an toàn.

#### B. Sticky Sessions (Session Affinity)
* Ràng buộc các yêu cầu liên tiếp từ cùng một người dùng cuối luôn được chuyển tiếp tới **cùng một máy chủ backend cụ thể**.
* Hoạt động dựa trên Cookie:
  - **Duration-based Cookie**: Do chính ALB tự tạo ra và quản lý (tên cookie mặc định là `AWSALB`, có thời gian sống cấu hình từ 1 giây đến 7 ngày).
  - **Application-based Cookie**: Do ứng dụng backend tự sinh và ALB sẽ theo dõi cookie tùy chỉnh này.
* ⚠️ *Rủi ro kiến trúc*: Sticky Sessions có thể gây ra hiện tượng **mất cân bằng tải (Load Imbalance)** nếu một vài người dùng gửi lưu lượng quá lớn làm sập máy chủ đó. Khuyến nghị chuẩn mực: Lưu trạng thái phiên làm việc (Session state) tập trung trong **Amazon ElastiCache for Valkey/Redis** để giữ tầng Web hoàn toàn phi trạng thái (**Stateless Web Tier**).

#### C. Cross-Zone Load Balancing (Cân bằng tải chéo vùng)
* **Cơ chế hoạt động**: Mỗi node của Load Balancer sẽ phân phối lưu lượng đồng đều tới toàn bộ các máy chủ backend nằm ở **tất cả các Availability Zones**.
* **So sánh trạng thái mặc định**:
  - **Application Load Balancer (ALB)**: **MẶC ĐỊNH BẬT** và hoàn toàn **MIỄN PHÍ** cước truyền dữ liệu liên AZ ($0.00/GiB).
  - **Network Load Balancer (NLB)**: **MẶC ĐỊNH TẮT**; nếu người dùng chủ động BẬT tính năng này trên NLB, AWS sẽ **tính phí cước Data Transfer Inter-AZ ($0.01/GiB)** cho mỗi chiều truyền nhận.

#### D. Quản lý kết nối & Xử lý chứng chỉ số (SSL Termination & SNI)
* **SSL/TLS Termination**: ALB giải mã kết nối HTTPS ngay tại điểm tiếp nhận của Load Balancer, giúp giải phóng hoàn toàn gánh nặng tính toán CPU mật mã cho các máy chủ backend.
* **Server Name Indication (SNI)**: Cho phép một Listener duy nhất trên cổng 443 của ALB có thể nạp và phục vụ **nhiều chứng chỉ số SSL/TLS khác nhau cho nhiều tên miền độc lập** (ví dụ: `siteA.com`, `siteB.com`, `siteC.com` dùng chung 1 ALB).
* **Mutual TLS (mTLS)**: ALB hỗ trợ xác thực hai chiều qua chứng chỉ số X.509 giữa client và Load Balancer, lý tưởng cho các kết nối B2B an toàn tuyệt đối.
* **Deregistration Delay (Connection Draining)**: Khoảng thời gian ân hạn (mặc định 300 giây, có thể chỉnh từ 0 đến 3,600 giây) để các yêu cầu đang thực thi dở dang (in-flight requests) hoàn tất trước khi máy chủ bị gỡ khỏi Target Group hoặc bị ASG xóa bỏ, ngăn ngừa việc người dùng bị ngắt kết nối đột ngột.

---

### 3. Auto Scaling Groups (ASG) & Các chính sách co giãn hiện đại

```mermaid
flowchart TD
    ASG[Auto Scaling Group] --> Cap[Bộ Ba Tham Số Định Kích Cỡ]
    Cap --> Min[Minimum Size: Số lượng tối thiểu đảm bảo HA]
    Cap --> Desired[Desired Capacity: Số lượng máy chủ mong muốn duy trì]
    Cap --> Max[Maximum Size: Ngưỡng trần tối đa chống nổ chi phí]

    ASG --> Policies[Các Chiến Lược Co Giãn - Scaling Policies]
    Policies --> P1[1. Target Tracking Scaling\nBám sát mục tiêu: CPU 60% hoặc ALB RequestCount 2,000]
    Policies --> P2[2. Step Scaling\nPhản hồi đa cấp độ dựa trên ngưỡng CloudWatch Alarm]
    Policies --> P3[3. Scheduled Scaling\nLập lịch định kỳ trước các dịp lễ / cao điểm]
    Policies --> P4[4. Predictive Scaling\nHọc máy AI phân tích lịch sử 14 ngày để bật máy đón đầu]
```

1. **Target Tracking Scaling Policy (Chuẩn mực thông dụng nhất)**:
   - Bạn chỉ cần đặt ra một con số mục tiêu (ví dụ: *"Duy trì mức sử dụng CPU trung bình ở 60%"* hoặc *"Mỗi instance phục vụ 1,500 requests/phút"*). AWS sẽ tự động tính toán số lượng máy chủ cần tăng hoặc giảm để giữ ổn định quanh con số đó.
2. **Step Scaling Policy**:
   - Phản ứng linh hoạt theo các ngưỡng bậc thang của CloudWatch Alarm (ví dụ: nếu CPU từ 70%–80% thì thêm 1 máy; nếu CPU vượt 85% thì thêm ngay 3 máy để ứng cứu khẩn cấp).
3. **Predictive Scaling Policy**:
   - Ứng dụng mô hình Machine Learning phân tích dữ liệu lịch sử tải của các tuần trước đó để tự động khởi chạy máy chủ trước khi đợt tăng tải diễn ra (ví dụ: bật máy lúc 07:30 sáng để đón đợt tăng tải lúc 08:00).
4. **ASG Warm Pools & Instance Refresh**:
   - **Warm Pools**: Duy trì một cụm máy ảo ở trạng thái dừng (**Stopped**) đã cài đặt sẵn phần mềm. Khi cần scale-out, máy chỉ mất 30 giây để Start thay vì mất 5–10 phút để cài đặt từ đầu qua User Data.
   - **Instance Refresh**: Cho phép triển khai cập nhật phiên bản AMI mới theo cơ chế rolling update từng phần với các chốt kiểm tra sức khỏe (**Checkpointing**) mà không gây gián đoạn hệ thống.

---

### 🏛️ I. Các Kịch Bản Kiến Trúc Chuẩn (Best Practice Scenarios)

#### 1. Kiến Trúc Chịu Lỗi Cao Đa Tầng Mẫu Mực (ALB + Multi-AZ ASG + Multi-AZ RDS)
- **Tình huống thi**: Xây dựng kiến trúc cho ứng dụng Web quan trọng của doanh nghiệp. Yêu cầu tính sẵn sàng cao (High Availability), tự động chịu lỗi (Fault-Tolerant) khi toàn bộ một Availability Zone bị sập mà không làm gián đoạn dịch vụ của người dùng cuối.
- **Giải pháp tối ưu chuẩn AWS**:
  - **Tầng Web / Load Balancer**: **Application Load Balancer (ALB)** được cấu hình triển khai trên tối thiểu 2 Public Subnets ở 2 AZs khác nhau.
  - **Tầng Ứng Dụng (Compute Tier)**: Máy chủ EC2 chạy trong Private Subnets, được quản lý bởi **Auto Scaling Group (ASG)** trải dài qua tối thiểu 2 hoặc 3 AZs.
  - **Tầng Cơ Sở Dữ Liệu**: Sử dụng **Amazon RDS Multi-AZ** (chế độ đồng bộ dữ liệu thời gian thực sang Standby replica ở AZ khác và tự động failover trong 60–120s).

#### 2. Định Tuyến Nhiều Dịch Vụ Trên Một ALB Duy Nhất (Path-Based & Host-Based Routing)
- **Tình huống thi**: Doanh nghiệp chuyển đổi kiến trúc Monolith sang Microservices gồm 3 dịch vụ: Giao diện web, API thanh toán, và Quản lý người dùng. Cần định tuyến yêu cầu tới đúng nhóm máy chủ với chi phí hạ tầng thấp nhất.
- **Giải pháp chuẩn**:
  - Triển khai **DUY NHẤT một Application Load Balancer**.
  - Thiết lập các **Listener Rules** với điều kiện định tuyến:
    - Path Pattern `/api/payment/*` -> Chuyển tiếp tới Target Group Thanh Toán.
    - Path Pattern `/api/users/*` -> Chuyển tiếp tới Target Group Người Dùng.
    - Host Header `admin.example.com` -> Chuyển tiếp tới Target Group Quản Trị.
  - Tiết kiệm 66% chi phí so với việc tạo mỗi microservice một Load Balancer riêng.

#### 3. Co Giãn Động Theo Tải Thực Tế Bằng Target Tracking Scaling Policy
- **Tình huống thi**: Ứng dụng có lưu lượng truy cập biến động liên tục trong ngày. Cần tự động bổ sung máy chủ khi nhu cầu tăng và tự động tắt máy chủ khi nhu cầu giảm để tiết kiệm chi phí, không cần tính toán thủ công ngưỡng CloudWatch Alarm.
- **Giải pháp chuẩn**:
  - Cấu hình chính sách **Target Tracking Scaling Policy** trên ASG.
  - Chọn các chỉ số định sẵn:
    - `ASGAverageCPUUtilization` = 50% (giữ CPU trung bình của cụm ở mức 50%).
    - `ALBRequestCountPerTarget` = 1000 (mỗi instance chịu tối đa 1000 requests/phút).
  - ASG tự động tính toán số lượng instances cần thêm hoặc bớt để giữ chỉ số bám sát mục tiêu.

---

### 🪤 II. Các Bẫy Thi Tinh Vi & Phân Tích Phương Án Sai (Exam Traps & Distractors)

#### 🪤 Bẫy 1: Tạm Dừng Tiến Trình ASG Khi Khắc Phục Sự Cố Máy Chủ (Suspend Processes) — (U-PT1 Q22)
- **Tình huống đề thi**: *"Một máy chủ EC2 trong Auto Scaling Group bị đánh dấu là Unhealthy do ứng dụng bị crash. Kỹ sư cần giữ nguyên trạng thái máy chủ này để kết nối vào thu thập log và điều tra nguyên nhân cốt lõi (troubleshoot). Cần làm gì trước tiên?"*
- **Các phương án bẫy**:
  - ❌ *Không làm gì cả và nhanh chóng SSH vào*: ASG sẽ lập tức kích hoạt quy trình thay thế và **hủy diệt (Terminate)** máy chủ lỗi ngay sau đó -> Toàn bộ dữ liệu log trong bộ nhớ và ổ đĩa bị mất sạch!
  - ❌ *Tháo máy chủ ra khỏi ASG (Detach)*: Tốn công và có thể kích hoạt ASG sinh instance mới làm sai lệch số lượng desired capacity.
- **Giải pháp ĐÚNG**: Tạm dừng (Suspend) tiến trình **`ReplaceUnhealthy`** trong Auto Scaling Group.
  - Thao tác này ngăn chặn ASG xóa máy chủ bị lỗi. Kỹ sư có toàn bộ thời gian cần thiết để điều tra sự cố. Sau khi sửa xong, kích hoạt lại (Resume) tiến trình.

#### 🪤 Bẫy 2: Tính Toán Dung Lượng Dự Phòng Chịu Lỗi Khi Mất 1 AZ (N+1 Capacity Sizing) — (U-PT2 Q19, U-PT2 Q37)
- **Tình huống đề thi**: *"Hệ thống yêu cầu bắt buộc phải duy trì tối thiểu 8 máy chủ hoạt động 100% công suất kể cả trong trường hợp xấu nhất là toàn bộ một Availability Zone bị sập. Cấu hình nào đáp ứng yêu cầu với CHI PHÍ THẤP NHẤT?"*
- **Phân tích toán học kiến trúc**:
  - **Phương án 2 AZs**: Mỗi AZ phải gánh $8 \text{ instances}$ (Tổng cộng = 16 instances). Khi 1 AZ sập, AZ còn lại còn đúng 8 instances -> Đạt yêu cầu nhưng tốn chi phí 16 máy.
  - **Phương án 3 AZs**: Mỗi AZ chỉ cần bố trí **$4 \text{ instances}$** (Tổng cộng = 12 instances). Khi 1 AZ bất kỳ bị sập (mất 4 instances), 2 AZs còn lại vẫn có $4 + 4 = 8 \text{ instances}$ -> **Đạt 100% công suất**!
  - **Kết luận**: Triển khai trên **3 AZs với 4 instances/AZ** tiết kiệm hơn phương án 2 AZs tới **25% chi phí phần cứng dự phòng** ($12 \text{ máy}$ so với $16 \text{ máy}$).

#### 🪤 Bẫy 3: Elastic Load Balancing KHÔNG PHẢI Là Dịch Vụ Toàn Cầu (ELB Is Regional) — (U-PT6 Q48)
- **Tình huống đề thi**: *"Doanh nghiệp muốn sử dụng Elastic Load Balancing để cân bằng tải giữa các máy chủ Web đặt tại Region Singapore (ap-southeast-1) và Region Tokyo (ap-northeast-1)."*
- **Nguyên lý bất biến**:
  - Mọi Load Balancer của AWS (ALB, NLB, Classic LB) đều là **tài nguyên thuộc phạm vi 1 Region (Regional Resource)**.
  - ELB **KHÔNG THỂ** phân phối lưu lượng hoặc kiểm tra sức khỏe trực tiếp xuyên qua 2 Region khác nhau.
- **Giải pháp ĐÚNG**:
  - Triển khai ALB riêng biệt tại từng Region.
  - Sử dụng **Amazon Route 53** (với chính sách Latency-based Routing hoặc Geolocation Routing kèm Health Check) hoặc **AWS Global Accelerator** để điều phối lưu lượng toàn cầu giữa 2 Region.

#### 🪤 Bẫy 4: Thứ Tự Ưu Tiên Của Chính Sách Hủy Máy Chủ Mặc Định (Default Termination Policy) — (U-PT2 Q18)
- **Tình huống đề thi**: *"Khi Auto Scaling Group kích hoạt sự kiện Scale-In (giảm tải), máy chủ EC2 nào sẽ bị chọn để chấm dứt (terminate) đầu tiên?"*
- **Quy trình đánh giá 4 bước chuẩn xác**:
  1. **Bước 1 (Chọn AZ)**: Xác định Availability Zone nào đang có **nhiều instance nhất** và có ít nhất một instance không được bật tính năng Scale-In Protection.
  2. **Bước 2 (Chọn cấu hình cũ)**: Trong AZ đó, tìm instance được khởi tạo từ **Launch Template / Launch Configuration cũ nhất**.
  3. **Bước 3 (Tối ưu giờ thanh toán)**: Nếu vẫn có nhiều instance trùng cấu hình, chọn instance **gần tới mốc chu kỳ tính cước giờ tiếp theo nhất** (Closest to the next billing hour).
  4. **Bước 4 (Ngẫu nhiên)**: Nếu tất cả các tiêu chí trên đều như nhau, chọn ngẫu nhiên một instance.

---

### 📊 III. Ma Trận Quyết Định Cân Bằng Tải & Co Giãn Nhanh (Exam Decision Matrix)

| Tình huống / Yêu cầu trong đề thi | Giải pháp chuẩn AWS | Giải pháp bị loại & Lý do |
|:---|:---|:---|
| **Định tuyến HTTP/HTTPS, Path-based, microservices** | **Application Load Balancer (ALB)** | Network Load Balancer (chỉ hoạt động ở Layer 4) |
| **Giao thức TCP/UDP, độ trễ cực thấp, Static IP** | **Network Load Balancer (NLB)** | Application Load Balancer (chỉ hoạt động ở Layer 7) |
| **Giữ máy chủ lỗi để điều tra root cause** | **Suspend `ReplaceUnhealthy` process** | Để mặc định (instance bị terminate mất log) |
| **Cân bằng tải toàn cầu giữa nhiều AWS Regions** | **Route 53 DNS / Global Accelerator** | Dùng ELB (ELB chỉ hoạt động trong 1 Region) |
| **Co giãn tự động bám sát mức CPU trung bình** | **Target Tracking Scaling Policy** | Simple Scaling (phải tính toán thủ công alarm) |
| **Đáp ứng tăng tải đột biến theo từng nấc** | **Step Scaling Policy** | Scheduled Scaling (không dự đoán được thời điểm) |
| **Chuẩn bị hạ tầng trước đợt sale Black Friday** | **Scheduled Scaling Actions** | Dynamic Scaling (bị trễ khi lưu lượng ùa vào đột ngột) |
| **Dung lượng dự phòng chịu sập 1 AZ rẻ nhất** | **Triển khai 3 AZs (mỗi AZ gánh N/2 instances)** | Triển khai 2 AZs (tốn thêm 25% chi phí máy) |

---

---

---

## 6.3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### 1. Sơ đồ kiến trúc Web Tier chịu lỗi cao kết hợp ALB, ASG và cơ chế Self-Healing

```mermaid
flowchart TD
    Client([Người dùng Internet]) --> Route53[Amazon Route 53\nAlias Record trỏ vào ALB DNS]
    Route53 --> WAF[AWS WAF\nChống SQLi, XSS, Rate Limit]
    WAF --> ALB[Application Load Balancer\nMulti-AZ Public Subnets]

    subgraph VPC["Mạng Riêng Ảo - Amazon VPC"]
        subgraph ASG_Tier["Auto Scaling Group - Private Subnets qua 3 AZs"]
            EC2_Healthy_A[(EC2 Node 1\nHealthy\nAZ-1a)]
            EC2_Healthy_B[(EC2 Node 2\nHealthy\nAZ-1b)]
            EC2_Unhealthy[(EC2 Node 3\nUnhealthy 500 Error\nAZ-1c)]
        end
        
        DB[(Amazon Aurora Multi-AZ\nDatabase Cluster)]
    end

    ALB -->|1. Forward Traffic| EC2_Healthy_A
    ALB -->|1. Forward Traffic| EC2_Healthy_B
    ALB -.->|2. Health Check Ping FAIL!| EC2_Unhealthy

    EC2_Healthy_A --> DB
    EC2_Healthy_B --> DB

    Note over ALB,EC2_Unhealthy: 3. ALB đánh dấu Unhealthy và ngừng đẩy traffic
    EC2_Unhealthy -.->|4. Báo cáo lỗi cho ASG| ASG_Tier
    ASG_Tier -->|5. Terminate máy lỗi & Khởi chạy máy mới| EC2_New[(EC2 Node Thay Thế\nMới tinh\nAZ-1c)]
```

---

### 2. Luồng chi tiết cơ chế tự phục hồi (Self-Healing Workflow Step-by-Step)

```mermaid
sequenceDiagram
    autonumber
    participant Client as Người dùng
    participant ALB as Application Load Balancer
    participant EC2_Bad as Máy Chủ EC2 Bị Lỗi
    participant ASG as Auto Scaling Group
    participant EC2_New as Máy Chủ Mới Khởi Tạo

    loop Mỗi 15 giây (Health Check Ping)
        ALB->>EC2_Bad: HTTP GET /health
        EC2_Bad-->>ALB: HTTP 500 Internal Error (hoặc Timeout)
    end
    
    Note over ALB: 1. Đạt ngưỡng 2 lần thất bại liên tiếp (Unhealthy Threshold = 2)
    ALB->>ALB: 2. Đánh dấu node là Unhealthy; lập tức cô lập khỏi bảng định tuyến
    ALB->>ASG: 3. Thông báo Target Health Status = Unhealthy
    
    Note over ASG: 4. Kích hoạt quy trình Self-Healing
    ASG->>EC2_Bad: 5. Kích hoạt Deregistration Delay (draining kết nối dở dang)
    ASG->>EC2_Bad: 6. Ra lệnh Terminate máy chủ bị lỗi
    ASG->>EC2_New: 7. Khởi chạy instance mới từ Launch Template tại cùng AZ
    EC2_New->>EC2_New: 8. Khởi động ứng dụng & sẵn sàng phản hồi
    ALB->>EC2_New: 9. Gửi Health Check ping
    EC2_New-->>ALB: 10. Phản hồi HTTP 200 OK (Healthy)
    ALB->>EC2_New: 11. Bắt đầu phân phối traffic người dùng vào máy mới!
```

---

## 6.4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Related AWS Service | Purpose (Mục đích tích hợp) | Integration Method (Phương thức kỹ thuật chính xác) | Practical Example (Ví dụ thực tiễn) |
| :--- | :--- | :--- | :--- | :--- |
| **Amazon Route 53** | Phân giải tên miền người dùng vào Load Balancer với độ trễ thấp | **Alias Record** (A / AAAA Record) trỏ vào DNS Name của ALB | Cấu hình Route 53 trỏ tên miền gốc `example.com` vào Application Load Balancer mà không cần dùng địa chỉ IP tĩnh. |
| **AWS Certificate Manager (ACM)** | Cung cấp và tự động gia hạn chứng chỉ bảo mật SSL/TLS miễn phí | Tích hợp chứng chỉ trực tiếp vào HTTPS Listener của ALB | Gắn chứng chỉ SSL đa tên miền bảo vệ `https://api.mycorp.com` và `https://web.mycorp.com` sử dụng tính năng **SNI**. |
| **AWS WAF** | Tường lửa ứng dụng web bảo vệ trước tấn công Layer 7 | Gắn **Web ACL Association** trực tiếp vào ALB | Thiết lập luật WAF chặn đứng các cuộc tấn công SQL Injection và tự động cấm các IP gửi quá 2,000 requests trong 5 phút. |
| **Amazon CloudWatch** | Giám sát trạng thái hoạt động, thời gian phản hồi và kích hoạt co giãn | Tự động đẩy metrics vào CloudWatch; gắn Alarms vào Scaling Policies | Kích hoạt Step Scaling tăng thêm 2 máy chủ khi chỉ số `TargetResponseTime > 0.5s` kéo dài trong 3 phút. |
| **Amazon SQS** | Điều phối co giãn số lượng worker dựa trên lượng tin nhắn tồn đọng | Theo dõi metric `ApproximateNumberOfMessagesVisible` | Tự động tăng số lượng máy chủ xử lý tác vụ ngầm khi hàng đợi SQS có hơn 5,000 thông điệp đang chờ xử lý. |
| **AWS Systems Manager** | Quản lý thông tin cấu hình và tự động khởi chạy kịch bản bảo trì | Tích hợp qua Launch Template gắn IAM Instance Profile | Tự động lấy tham số môi trường từ SSM Parameter Store khi máy ảo mới được ASG khởi chạy. |

---

## 6.5. Bảng So Sánh Toàn Bộ Các Giải Pháp Cân Bằng Tải AWS (Ecosystem Comparison)

| Tiêu chuẩn so sánh | Application Load Balancer (ALB) | Network Load Balancer (NLB) | Gateway Load Balancer (GWLB) | Classic Load Balancer (CLB) `[Deprecated]` |
| :--- | :--- | :--- | :--- | :--- |
| **Tầng mạng (OSI Layer)** | **Tầng 7 (Application)** | **Tầng 4 (Transport)** | **Tầng 3 (Network)** | Tầng 4 và Tầng 7 kết hợp |
| **Giao thức hỗ trợ** | HTTP, HTTPS, HTTP/2, gRPC, WebSocket | TCP, UDP, TLS | Giao thức đóng gói **GENEVE (Port 6081)** | HTTP, HTTPS, TCP, SSL |
| **Độ trễ xử lý (Latency)** | Mili-giây (Miliseconds) | **Siêu tốc (Microseconds)** | Microseconds | Miliseconds |
| **Địa chỉ IP cung cấp** | Tên miền DNS động (IP thay đổi liên tục) | **IP tĩnh (Elastic IP) trên mỗi AZ** | IP riêng nội bộ VPC | Tên miền DNS động |
| **Định tuyến thông minh** | Đường dẫn URL, Host, Headers, Query string | ❌ Chỉ định tuyến theo cổng và IP | Định tuyến toàn bộ luồng gói tin IP | ❌ Không hỗ trợ định tuyến nội dung |
| **Đơn vị tính cước** | Giờ hoạt động + **LCU-hour** | Giờ hoạt động + **NLCU-hour** | Giờ hoạt động + **GLCU-hour** | Giờ hoạt động + GB truyền tải |
| **Cross-Zone Balancing** | **Mặc định BẬT (Miễn phí)** | **Mặc định TẮT (Có phí)** | Mặc định TẮT | Mặc định TẮT |
| **Kịch bản sử dụng chuẩn** | Ứng dụng web, microservices, container ECS, REST APIs | Game online, IoT streaming, hệ thống tài chính cần IP tĩnh | Tường lửa mạng bên thứ ba (Palo Alto, Fortinet), IDS/IPS | **Không dùng cho kiến trúc mới** |

---

## 6.6. Mô Hình Tính Phí & Chiến Lược Tối Ưu Chi Phí (FinOps & Cost Optimization)

### 6.6.1. Bảng Phân Tích Cơ Chế Tính Phí Chi Tiết Của ELB & ASG

| Thành phần tính phí | Cơ chế tính phí chi tiết (Pricing Dimensions) | Mức phí tham chiếu điển hình (US-East-1) | Bẫy chi phí nghiêm trọng (Cost Pitfalls) |
| :--- | :--- | :--- | :--- |
| **Application Load Balancer (ALB)** | • Cước cố định: Tính theo giờ hoạt động.<br>• **Cước LCU (Load Balancer Capacity Units)**: Tính theo chiều tài nguyên tiêu thụ cao nhất trong 4 chiều: New connections (25/s), Active connections (3,000/phút), Processed bytes (1 GB/giờ), Rule evaluations (1,000/s). | • Cố định: **$0.0225 / giờ** (~$16.20/tháng).<br>• LCU: **$0.008 / LCU-giờ**. | Tạo hàng chục ALB riêng lẻ cho từng dịch vụ nhỏ thay vì hợp nhất vào 1 ALB dùng chung Listener Rules. |
| **Network Load Balancer (NLB)** | • Cước cố định: Tính theo giờ hoạt động.<br>• **Cước NLCU**: Đo lường 3 chiều: New connections (800/s), Active connections (100,000/phút), Processed bytes (1 GB/giờ). | • Cố định: **$0.0225 / giờ** (~$16.20/tháng).<br>• NLCU: **$0.006 / NLCU-giờ**. | Bật Cross-Zone Load Balancing trên NLB lưu lượng lớn phát sinh cước truyền dữ liệu xuyên AZ. |
| **Auto Scaling Group (ASG)** | **HOÀN TOÀN MIỄN PHÍ ($0.00)**. | **$0.00** | Chỉ trả tiền cho các tài nguyên EC2 instances do ASG khởi chạy. Lãng phí xảy ra khi đặt ngưỡng scale-out quá nhạy. |
| **Cross-Zone Data Transfer** | • **ALB**: Hoàn toàn **MIỄN PHÍ ($0.00/GB)**.<br>• **NLB**: Tính phí **$0.01 / GB** cho mỗi chiều truyền dữ liệu liên AZ khi bật Cross-Zone. | $0.01 / GB. | Vô tình bật Cross-Zone trên NLB xử lý hàng trăm Terabytes dữ liệu mỗi tháng. |

---

### 6.6.2. Chiến Lược Tối Ưu Hóa Chi Phí Theo 5 Kịch Bản Thực Tế (Use Cases Optimization)

#### Kịch bản 1: Hợp Nhất 10 Microservices Vào Một ALB Duy Nhất (Listener Rules Consolidation)
* **Bối cảnh thực tế**:
  Một công ty khởi nghiệp triển khai 10 dịch vụ vi mô độc lập (Auth, Cart, Order, Product, Payment...). Nhóm lập trình viên ban đầu tạo riêng cho mỗi dịch vụ một Application Load Balancer riêng biệt.
  $$\text{Chi phí cố định ban đầu} = 10 \text{ ALBs} \times 0.0225\$ \times 720 \text{ giờ} = \mathbf{162.00\$/\text{tháng}}$$
* **Chiến lược tối ưu hóa**:
  - Hợp nhất toàn bộ 10 dịch vụ về **1 Application Load Balancer duy nhất**.
  - Sử dụng tính năng **Path-based Routing** (`/api/auth/*`, `/api/orders/*`) và **Host-based Routing** để phân phối lưu lượng vào 10 Target Groups độc lập.
  $$\text{Chi phí cố định 1 ALB} = 1 \times 0.0225\$ \times 720 = \mathbf{16.20\$/\text{tháng}}$$
* **Kết quả tiết kiệm**:
  $$\text{Số tiền tiết kiệm} = 162.00\$ - 16.20\$ = \mathbf{145.80\$/\text{tháng}} \quad (\approx \mathbf{1,749\$/\text{năm}})$$
  **Tỷ lệ tiết kiệm đạt ~90.0% chi phí cố định của Load Balancer**.

---

#### Kịch bản 2: Kiểm Soát Bẫy Chi Phí Cross-Zone Data Transfer Trên NLB
* **Bối cảnh thực tế**:
  Một hệ thống viễn trắc IoT truyền dữ liệu liên tục qua cụm **Network Load Balancer (NLB)** với tổng dung lượng dữ liệu xử lý lên tới **100 TB (100,000 GiB)/tháng** trải dài trên 3 Availability Zones. Do kỹ sư bật cờ `Cross-Zone Load Balancing = ON`, khoảng 66.7% dữ liệu bị truyền chéo sang các AZ khác.
  $$\text{Chi phí Data Transfer chéo AZ} = 100,000 \text{ GiB} \times \frac{2}{3} \times 0.01\$ = \mathbf{666.67\$/\text{tháng}}$$
* **Chiến lược tối ưu hóa**:
  - Tắt tính năng Cross-Zone Load Balancing trên NLB (`Cross-Zone = OFF` - giá trị mặc định).
  - Sử dụng Route 53 hoặc phân bổ client kết nối đều vào từng Elastic IP của NLB tại từng AZ tương ứng để xử lý cục bộ (Local Zone Processing).
* **Kết quả tiết kiệm**:
  $$\text{Số tiền tiết kiệm} = \mathbf{666.67\$/\text{tháng}} \quad (\approx \mathbf{8,000\$/\text{năm}})$$
  **Triệt tiêu 100% chi phí truyền dữ liệu chéo vùng**, đồng thời giảm độ trễ mạng thêm 1–2 mili-giây.

---

#### Kịch bản 3: Áp Dụng ASG Mixed Instances Policy Kết Hợp Spot và On-Demand Cho Worker Tier
* **Bối cảnh thực tế**:
  Một cụm máy chủ worker gồm 25 máy `c6i.xlarge` ($0.17/giờ) chạy liên tục 24/7 để xử lý hàng đợi background jobs. Ban đầu 100% đều sử dụng On-Demand.
  $$\text{Chi phí On-Demand ban đầu} = 25 \times 0.17\$ \times 720 \text{ giờ} = \mathbf{3,060.00\$/\text{tháng}}$$
* **Chiến lược tối ưu hóa**:
  - Cấu hình Auto Scaling Group sử dụng **Mixed Instances Policy**:
    - **Base Capacity (On-Demand)**: Duy trì 5 máy nòng cốt ($5 \times 0.17\$ \times 720 = 612.00\$$).
    - **Spot Percentage**: 80% cho 20 máy còn lại với mức chiết khấu trung bình 70% ($20 \times (0.17\$ \times 0.30) \times 720 = 734.40\$$).
  $$\text{Tổng chi phí sau tối ưu} = 612.00\$ + 734.40\$ = \mathbf{1,346.40\$/\text{tháng}}$$
* **Kết quả tiết kiệm**:
  $$\text{Số tiền tiết kiệm} = 3,060.00\$ - 1,346.40\$ = \mathbf{1,713.60\$/\text{tháng}} \quad (\approx \mathbf{20,563\$/\text{năm}})$$
  **Tỷ lệ tiết kiệm đạt ~56.0%**, các tác vụ xử lý hàng đợi vẫn đảm bảo nhờ khả năng retry của SQS.

---

#### Kịch bản 4: Rút Ngắn Thời Gian Deregistration Delay Giảm Lãng Phí Khi Triển Khai CI/CD
* **Bối cảnh thực tế**:
  Một cụm API microservices thực hiện deploy liên tục 8 lần/ngày. Thông số `deregistration_delay.timeout_seconds` đang để mặc định là **300 giây (5 phút)**. Mỗi lần deploy, các máy chủ cũ phải chạy không tải trong 5 phút trước khi bị terminate, trong khi thời gian xử lý request của ứng dụng chỉ dưới **200 mili-giây**.
  - 8 lần deploy $\times$ 10 máy $\times$ 5 phút = 400 instance-minutes lãng phí mỗi ngày (~200 instance-hours/tháng).
* **Chiến lược tối ưu hóa**:
  - Giảm thời gian `deregistration_delay.timeout_seconds` trên Target Group từ 300 giây xuống còn **20 giây**.
  - Thiết lập kịch bản graceful shutdown trên container để đóng socket ngay khi hoàn tất các request đang chờ.
* **Kết quả tiết kiệm**:
  Giảm thời gian sống dư thừa của máy chủ tới **93%**, giúp các đợt rolling update hoàn tất trong vòng 3 phút thay vì 25 phút.

---

#### Kịch bản 5: Tối Ưu Thứ Tự Ưu Tiên Listener Rules Trên ALB Giảm Phí LCU
* **Bối cảnh thực tế**:
  Một ALB tiếp nhận 80 triệu requests/ngày với 50 Listener Rules phức tạp. Do các rule được sắp xếp ngẫu nhiên, các request phổ biến nhất (chiếm 85% lưu lượng) lại nằm ở Priority 40–50, buộc ALB phải đánh giá qua 40–50 điều kiện trước khi chuyển tiếp, làm tiêu tốn thêm **12 LCU-hours mỗi ngày**.
  $$\text{Chi phí LCU lãng phí} = 12 \text{ LCU} \times 0.008\$ \times 30 \text{ ngày} = \mathbf{2.88\$/\text{ngày}} \approx \mathbf{86.40\$/\text{tháng}}$$
* **Chiến lược tối ưu hóa**:
  - Phân tích ALB Access Logs và đẩy các đường dẫn có lưu lượng cao nhất (Trang chủ `/`, Health check `/health`, Auth `/api/v1/auth`) lên các số ưu tiên đầu tiên (**Priority 1, 2, 3**).
  - Khi request khớp với rule đầu tiên, ALB dừng việc đánh giá các rule còn lại, đưa số lượng rule evaluations về mức tối thiểu.
* **Kết quả tiết kiệm**:
  Triệt tiêu hoàn toàn kích thước chiều Rule Evaluations LCU, tiết kiệm 100% phụ phí LCU không đáng có.

---

## 6.7. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Vấn đề (Problem) | Nguyên nhân khả dĩ (Possible Causes) | Các bước điều tra (Investigation Steps - Metrics/Logs) | Giải pháp xử lý (Solution) | Biện pháp phòng ngừa (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **ALB trả về mã lỗi `HTTP 504 Gateway Timeout`** | Máy chủ backend mất quá nhiều thời gian để xử lý hoặc Security Group của backend chặn traffic phản hồi về ALB. | 1. Xem Access Logs của ALB.<br>2. Xem CloudWatch Metric **`TargetResponseTime`**.<br>3. Kiểm tra nhật ký Slow Query Logs trên database. | Tăng giá trị `Idle Timeout` trên ALB hoặc tối ưu hóa hiệu năng câu truy vấn của ứng dụng backend. | Thiết lập CloudWatch Alarm cảnh báo khi `TargetResponseTime > 1s` kéo dài 5 phút. |
| **Toàn bộ Target trong Target Group đều báo `Unhealthy`** | • Đường dẫn Health Check path cấu hình sai (ứng dụng không có endpoint `/`).<br>• Security Group của EC2 chưa mở cổng cho IP của ALB.<br>• Backend server bị sập dịch vụ web. | 1. Kiểm tra mã phản hồi mong muốn (Matcher: mặc định 200).<br>2. Xem CloudWatch Metric **`UnHealthyHostCount`**.<br>3. Thử lệnh `curl -Iv http://localhost:port/health` trực tiếp trong máy ảo. | Đảm bảo Security Group của EC2 mở cổng từ Security Group của ALB và endpoint `/health` trả về mã HTTP 200. | Sử dụng endpoint riêng biệt chuyên phục vụ kiểm tra sức khỏe hệ thống (Health Check Endpoint). |
| **ALB trả về lỗi `HTTP 503 Service Unavailable`** | Target Group không có bất kỳ máy chủ nào ở trạng thái Healthy (toàn bộ máy chủ đều chết hoặc chưa kịp khởi động). | Kiểm tra tab Targets của Target Group trên console; xem metric `HealthyHostCount = 0`. | Kiểm tra lại nguyên nhân các máy chủ bị đánh dấu Unhealthy và khởi chạy máy chủ mới khẩn cấp. | Luôn duy trì số lượng máy tối thiểu (`Min size >= 2`) trong ASG trên đa AZ. |
| **Hiện tượng lệch tải nghiêm trọng giữa các máy chủ (Load Imbalance)** | Tính năng **Sticky Sessions** đang được bật kết hợp với một vài người dùng lớn (heavy clients/bot) gửi lưu lượng khổng lồ vào 1 máy. | Kiểm tra cài đặt Target Group attributes và xem metric `RequestCountPerTarget`. | Tắt Sticky Sessions nếu ứng dụng hỗ trợ cơ chế lưu phiên phi trạng thái (Stateless qua Redis/ElastiCache). | Thiết kế tầng ứng dụng theo mô hình hoàn toàn Stateless Web Tier. |
| **ASG liên tục bật tắt máy chủ liên hồi (Flapping / Scaling Oscillation)** | Khoảng cách giữa ngưỡng Scale-Out và Scale-In quá hẹp, hoặc thời gian Cooldown Period quá ngắn. | Xem lịch sử hoạt động trong tab **Activity History** của ASG trên console. | Nới rộng khoảng cách giữa ngưỡng kích hoạt cảnh báo tăng và giảm; tăng thời gian **Cooldown Period** (ví dụ lên 300 giây). | Sử dụng **Target Tracking Scaling Policy** thay vì Simple Scaling để AWS tự động tính toán biên độ an toàn. |
| **Lỗi `Target.FailedHealthChecks` do ứng dụng khởi động quá chậm** | Ứng dụng Java/Spring Boot mất 2–3 phút để nạp vào RAM, trong khi ALB đã gửi health check và đánh dấu máy hỏng trước khi app sẵn sàng. | So sánh thời gian khởi động ứng dụng với thông số **Health Check Grace Period** của ASG. | Tăng thông số **Health Check Grace Period** trên ASG lên 300 giây để cho phép máy chủ đủ thời gian khởi động hoàn tất. | Sử dụng **ASG Warm Pools** hoặc tối ưu hóa quá trình khởi động ứng dụng. |

---

---

## 6.8. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Kiến Trúc "Sống Còn" Của ELB & ASG (Golden Rules)
1. **Lựa chọn đúng loại Load Balancer**:  
   - Cần định tuyến thông minh HTTP/HTTPS, URL path, Host, mTLS $\rightarrow$ **Application Load Balancer (ALB)**.  
   - Cần IP tĩnh cố định, giao thức TCP/UDP, độ trễ microsecond $\rightarrow$ **Network Load Balancer (NLB)**.  
   - Cần triển khai cụm Firewall / IDS / IPS ảo của bên thứ ba $\rightarrow$ **Gateway Load Balancer (GWLB)**.
2. **Thiết kế High Availability tối thiểu 2–3 AZs**:  
   Luôn triển khai Load Balancer trên các Public Subnets trải rộng trên tối thiểu 2 Availability Zones, và phân bổ các máy chủ backend trong Private Subnets qua các AZ tương ứng.
3. **Bật ELB Health Check trên ASG**:  
   Luôn cấu hình `Health Check Type = ELB` trên Auto Scaling Group để ASG tự động phát hiện và thay thế các máy chủ bị treo ứng dụng web (thực thi cơ chế Self-Healing).
4. **Hợp nhất Microservices trên ALB**:  
   Tận dụng Listener Rules (Path-based và Host-based Routing) để phục vụ nhiều dịch vụ trên một ALB duy nhất, tránh lãng phí cước phí cố định hàng tháng của Load Balancer.
5. **Cảnh giác bẫy chi phí Cross-Zone trên NLB**:  
   Giữ nguyên tùy chọn tắt `Cross-Zone Load Balancing` trên NLB đối với các hệ thống có lưu lượng hàng trăm Terabytes để tránh phát sinh cước truyền dữ liệu liên AZ.
6. **Lấy IP thật người dùng qua `X-Forwarded-For`**:  
   Luôn cấu hình ứng dụng backend đọc tiêu đề HTTP `X-Forwarded-For` để phân tích nhật ký hoặc kiểm tra địa chỉ IP thực tế của khách hàng.
7. **Tối ưu chi phí co giãn với Mixed Instances Policy**:  
   Kết hợp On-Demand cho tải nền và Spot Instances cho tải đột biến trong Auto Scaling Group để tiết kiệm từ 50% đến 70% chi phí điện toán.

---

### Liên Kết Nội Bộ và Tài Liệu Tham Khảo (Internal Links)
- 📖 [Ghi Chú Bài Học Chương 08: High Availability and Scalability](../Lesson_Notes/08_High_Availability_and_Scalability.md)
- 📖 [Tài Liệu Chuyên Sâu: Amazon EC2 & Kiến Trúc Tính Toán](./EC2_Elastic_Compute_Cloud.md)
- 📖 [Tài Liệu Chuyên Sâu: Amazon Route 53 & Hệ Thống DNS Đám Mây](./Route53_DNS.md)
- 📖 [Tài Liệu Chuyên Sâu: Amazon RDS & Aurora Databases](./RDS_Aurora_Databases.md)
- 📖 [Tài Liệu Chuyên Sâu: Amazon S3 & CloudFront Storage](./S3_and_CloudFront_Storage.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật Đám Mây Toàn Diện](../GLOSSARY.md)
- ⏭️ **Chuyên đề tiếp theo**: [Hệ Thống Phân Giải Tên Miền Đám Mây: Amazon Route 53](./Route53_DNS.md)
