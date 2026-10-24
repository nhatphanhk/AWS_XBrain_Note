# Ghi Chú Bài Học: Chương 08 - Tính Khả Dụng Cao & Khả Năng Co Giãn Đàn Hồi (High Availability and Scalability)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 08 - High Availability and Scalability (Bài 70 đến Bài 86)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: ELB & Auto Scaling Groups](file:///n:/AWS_XBrain_Note/AWS_Services/ELB_and_ASG_High_Availability.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này trang bị các nguyên lý và công cụ thiết kế kiến trúc phân tán chịu lỗi hàng đầu trên AWS: khái niệm tính khả dụng cao (**High Availability**) và tính co giãn (**Scalability & Elasticity**), bộ cân bằng tải **Elastic Load Balancing (ELB)** bao gồm **Application Load Balancer (ALB)**, **Network Load Balancer (NLB)**, và **Gateway Load Balancer (GWLB)**, cơ chế duy trì phiên **Sticky Sessions**, cân bằng tải chéo vùng **Cross-Zone Load Balancing**, bảo mật chứng chỉ số **SSL/TLS & SNI**, độ trễ rút máy chủ **Connection Draining**, và nhóm máy chủ tự động co giãn **Auto Scaling Groups (ASG)** cùng các chính sách co giãn (**Scaling Policies**).

### Mục tiêu học tập
1. Phân biệt được sự khác nhau giữa **Scalability** (khả năng mở rộng), **Elasticity** (khả năng co giãn theo thời gian thực), và **Agility** (tính linh hoạt).
2. Nắm vững cách thức hoạt động của 3 loại Load Balancer: ALB (Layer 7), NLB (Layer 4), và GWLB (Layer 3/4).
3. Hiểu cơ chế phân tích nội dung gói tin HTTP của ALB: định tuyến theo đường dẫn (Path-based) và định tuyến theo tên miền (Host-based).
4. Cấu hình kiểm tra sức khỏe (**Health Checks**) và hiểu cơ chế tự phục hồi (**Self-healing**) của ASG khi kết hợp với ELB.
5. Làm chủ các loại Scaling Policies: Target Tracking, Step Scaling, Scheduled Scaling và Predictive Scaling.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **ALB = Layer 7 = URL Routing**: Hỗ trợ HTTP/HTTPS/WebSocket/gRPC, định tuyến URL path (`/users`, `/orders`), host header (`api.domain.com`), hỗ trợ Dynamic Port Mapping cho ECS Docker.
2. **NLB = Layer 4 = Hiệu năng đỉnh cao**: Giao thức TCP/UDP, cấp phát địa chỉ IP tĩnh cố định (Elastic IP) cho mỗi AZ, xử lý hàng triệu request/giây với độ trễ microsecond.
3. **GWLB = Bảo mật mạng**: Quản lý và mở rộng cụm tường lửa ảo của bên thứ ba (Virtual Appliances) trong suốt qua giao thức GENEVE (Port 6081).
4. **SNI (Server Name Indication)**: Cho phép một ALB duy nhất tiếp nhận nhiều chứng chỉ SSL cho nhiều domain khác nhau.
5. **ASG Health Checks**: Nên đặt Health Check type là `ELB` để ASG tự động thay thế máy chủ khi ứng dụng web bị treo (trả về lỗi HTTP 5xx), thay vì chỉ phụ thuộc vào lỗi phần cứng EC2.
6. **X-Forwarded-For**: Backend đứng sau ALB muốn biết IP thật của người dùng bắt buộc phải đọc header này.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Phân biệt Scalability vs Elasticity vs High Availability
- **Scalability**: Năng lực đáp ứng tải lớn hơn bằng cách thích ứng tài nguyên:
  - *Vertical Scaling (Scale-up)*: Tăng kích thước máy chủ (ví dụ từ `t3.micro` lên `m6i.4xlarge`). Thường có giới hạn phần cứng và đòi hỏi downtime để đổi loại máy.
  - *Horizontal Scaling (Scale-out)*: Tăng số lượng máy chủ (ví dụ từ 2 máy lên 20 máy). Vô hạn quy mô, là mô hình chuẩn cho Cloud.
- **Elasticity**: Hệ thống tự động co lại khi tải giảm để không lãng phí tiền, và tự giãn ra khi tải tăng.
- **High Availability (HA)**: Hệ thống duy trì hoạt động liên tục ở ít nhất 2 Availability Zones để sống sót qua thảm họa sập một trung tâm dữ liệu.

### 2. So sánh ALB và NLB cho kỳ thi Solutions Architect

| Tiêu chuẩn thiết kế | Application Load Balancer (ALB) | Network Load Balancer (NLB) |
| :--- | :--- | :--- |
| **Tầng OSI** | Layer 7 (Application) | Layer 4 (Transport) |
| **Giao thức** | HTTP, HTTPS, WebSocket, gRPC | TCP, UDP, TLS |
| **Địa chỉ IP** | **IP thay đổi động** (Chỉ dùng DNS Name) | **IP tĩnh (Static / Elastic IP per AZ)** |
| **Độ trễ** | ~ 400 millisecond | **Độ trễ microsecond** |
| **Đặc thù định tuyến** | Định tuyến theo Path, Host, Query, Headers | Chỉ định tuyến theo Cổng mạng và IP đích |
| **Target hỗ trợ** | EC2, Private IP, Lambda, ECS dynamic port | EC2, Private IP, ALB |

### 3. Cơ chế hoạt động của Auto Scaling Group (ASG)
- **Launch Template**: Bản thiết kế khuôn mẫu quy định máy chủ khởi tạo sẽ dùng AMI nào, instance type gì, Security Group nào, IAM role gì và User Data script nào.
- **Dung lượng**: Cung cấp 3 giá trị:
  - `Min Size`: Số lượng máy tối thiểu (không bao giờ giảm xuống dưới mức này).
  - `Desired Capacity`: Số lượng máy mong muốn duy trì trong trạng thái bình thường.
  - `Max Size`: Số lượng máy tối đa (rào chắn giới hạn trần chi phí không để tăng vô hạn).
- **Default Cooldown Period (Thời gian hạ nhiệt mặc định - 300s)**: Sau khi thực hiện một hành động tăng hoặc giảm máy, ASG sẽ tạm dừng việc đánh giá mở rộng thêm trong 5 phút để các máy chủ mới có đủ thời gian khởi động và ổn định số liệu tải.

---

## 4.4. Lệnh và Cấu Hình Thực Tế (Commands & Config)

### Kiểm tra Target Health của ALB bằng AWS CLI:
```bash
aws elbv2 describe-target-health \
    --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-1:123456789012:targetgroup/my-web-target-group/xxxx \
    --query "TargetHealthDescriptions[].{Target:Target.Id,Port:Target.Port,Health:TargetHealth.State,Reason:TargetHealth.Reason}" \
    --output table
```

---

## 4.5. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn cần xây dựng một hệ thống nhận dữ liệu thời gian thực từ hàng triệu thiết bị IoT qua giao thức TCP thô và yêu cầu phải có địa chỉ IP tĩnh để cấu hình cứng trên thiết bị. Bộ cân bằng tải nào đáp ứng được yêu cầu này?
2. Khi một máy chủ EC2 phía sau Application Load Balancer bị đánh dấu là Unhealthy, ALB sẽ xử lý các request tiếp theo của người dùng như thế nào?
3. Tính năng nào trên ELB cho phép đảm bảo rằng một người dùng cụ thể sẽ liên tục được gửi tới cùng một máy chủ backend trong suốt phiên mua sắm?
4. Đâu là sự khác biệt giữa Target Tracking Scaling Policy và Step Scaling Policy trong Auto Scaling Group?
5. Nếu một máy chủ đang xử lý một giao dịch thanh toán mất 45 giây và Auto Scaling Group quyết định giảm quy mô (Scale-in), tính năng nào ngăn chặn việc máy chủ đó bị tắt ngay lập tức làm đứt quãng giao dịch?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. **Network Load Balancer (NLB)**. NLB hoạt động ở Layer 4, hỗ trợ giao thức TCP và cung cấp địa chỉ IP tĩnh (Elastic IP) cho mỗi Availability Zone.
2. ALB sẽ **ngay lập tức ngừng gửi bất kỳ request mới nào** tới máy chủ bị Unhealthy đó, và chỉ phân phối traffic đến các máy chủ còn lại đang ở trạng thái Healthy trong Target Group.
3. Tính năng **Sticky Sessions (Session Affinity)** (dựa trên cookie của ứng dụng hoặc cookie `AWSALB`).
4. **Target Tracking** cho phép người dùng chỉ định một chỉ số mục tiêu cụ thể (ví dụ: CPU = 50%) và AWS tự động điều chỉnh số lượng máy chủ để đạt được con số đó; trong khi **Step Scaling** yêu cầu bạn tự thiết lập các bậc cảnh báo của CloudWatch Alarm (ví dụ: nếu CPU từ 70-85% thêm 1 máy, nếu CPU > 85% thêm 3 máy).
5. Tính năng **Connection Draining** (trên Classic Load Balancer) hay **Deregistration Delay** (trên Application Load Balancer / Network Load Balancer).
</details>

---

## 4.6. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [71 - Elastic Load Balancing (ELB) Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/71%20-%20Elastic%20Load%20Balancing%20(ELB)%20Overview.md)
  - [72 - Application Load Balancer (ALB).md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/72%20-%20Application%20Load%20Balancer%20(ALB).md)
  - [75 - Network Load Balancer (NLB).md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/75%20-%20Network%20Load%20Balancer%20(NLB).md)
  - [77 - Gateway Load Balancer (GWLB).md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/77%20-%20Gateway%20Load%20Balancer%20(GWLB).md)
  - [78 - Elastic Load Balancer - Sticky Sessions.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/78%20-%20Elastic%20Load%20Balancer%20-%20Sticky%20Sessions.md)
  - [79 - Elastic Load Balancer - Cross Zone Load Balancin.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/79%20-%20Elastic%20Load%20Balancer%20-%20Cross%20Zone%20Load%20Balancing.md)
  - [80 - Elastic Load Balancer - SSL Certificates.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/80%20-%20Elastic%20Load%20Balancer%20-%20SSL%20Certificates.md)
  - [82 - Elastic Load Balancer - Connection Draining.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/82%20-%20Elastic%20Load%20Balancer%20-%20Connection%20Draining.md)
  - [83 - Auto Scaling Groups (ASG) Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/83%20-%20Auto%20Scaling%20Groups%20(ASG)%20Overview.md)
  - [85 - Auto Scaling Groups - Scaling Policies.md](file:///n:/AWS_XBrain_Note/AWS_Resources/08%20-%20High%20Availability%20and%20Scalabil/85%20-%20Auto%20Scaling%20Groups%20-%20Scaling%20Policies.md)
