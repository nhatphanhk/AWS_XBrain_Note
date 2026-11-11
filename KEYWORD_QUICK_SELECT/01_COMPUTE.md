# 01 — COMPUTE & CONTAINERS: EC2, ASG, Lambda, ECS, EKS, Fargate, HPC, Hybrid Edge

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ COMPUTE & CONTAINERS

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon EC2** | Máy chủ ảo đám mây cấp hạ tầng (IaaS), toàn quyền cấu hình OS, CPU, RAM, Network, Storage. | Chạy ứng dụng doanh nghiệp truyền thống, phần mềm tùy biến nhân hệ điều hành, dịch vụ chạy 24/7. | *"Thuê nhà nguyên căn tự sắm nội thất, ở hay không ở vẫn phải trả tiền đều đặn."* |
| **Amazon EC2 Auto Scaling (ASG)** | Dịch vụ tự động tăng/giảm số lượng máy ảo EC2 theo nhu cầu tải thực tế và thay thế instance lỗi. | Đảm bảo tính sẵn sàng cao (High Availability), tự phục hồi (Self-healing), tối ưu chi phí theo nhu cầu. | *"Đội xe buýt linh hoạt: Giờ cao điểm tăng chuyến, vắng khách bớt xe, xe hỏng tự đổi xe mới."* |
| **AWS Lambda** | Điện toán phi máy chủ (Serverless FaaS), chạy mã nguồn theo sự kiện (Event-driven) tối đa 15 phút. | Xử lý tác vụ ngắn hạn, backend API microservices, tự co giãn từ 0 đến hàng ngàn request, scale về 0 khi không có tải. | *"Taxi công nghệ: Tính tiền theo km lăn bánh, xe dừng là ngắt đồng hồ."* |
| **Amazon ECS** | Nền tảng điều phối container Docker được quản lý độc quyền của AWS, tích hợp sâu hạ tầng AWS. | Quản lý và vận hành các ứng dụng đóng gói Docker microservices đơn giản, không tốn công học Kubernetes. | *"Quản đốc bến cảng AWS: Xếp container Docker nhanh gọn, chuẩn AWS."* |
| **Amazon EKS** | Dịch vụ quản lý cụm Kubernetes chuẩn mã nguồn mở CNCF (AWS lo Multi-AZ Control Plane). | Vận hành microservices quy mô lớn tương thích 100% với hệ sinh thái Kubernetes (k8s manifests, Helm, CRD). | *"Chuẩn container quốc tế: Chạy được mọi nơi, mang đi đâu cũng chạy được."* |
| **AWS Fargate** | Động cơ tính toán Serverless dành cho Containers (chạy được trên cả ECS lẫn EKS). | Chạy container Docker mà **hoàn toàn không cần quản lý máy chủ EC2 host bên dưới**. Chỉ trả tiền theo vCPU/RAM. | *"Gửi hàng theo kiện: Đóng thùng trả cước theo cân nặng, không cần mua tàu chở."* |
| **Amazon ECR** | Kho lưu trữ Docker/OCI image phân tán (Container Registry) private và public trên AWS. | Lưu trữ, bảo mật mã hóa, quét lỗ hổng (Inspector) và sao chép image xuyên Region/Account cho ECS/EKS/Lambda. | *"Kho chứa container tiêu chuẩn: Kiểm tra hàng trước khi xuất kho, chống ghi đè nhãn."* |
| **AWS Batch** | Dịch vụ lập lịch và điều phối các tác vụ tính toán hàng loạt (Batch Computing) ở mọi quy mô. | Điều phối hàng trăm ngàn job tính toán phân tích kỹ thuật, render đồ họa, HPC; tích hợp Spot instances tự scale về 0. | *"Xưởng gia công thời vụ: Có đơn hàng là thuê thợ làm thật nhanh rồi tự giải tán."* |
| **AWS Elastic Beanstalk**| Nền tảng triển khai ứng dụng dạng dịch vụ (PaaS) cho web applications. | Triển khai nhanh ứng dụng Java, .NET, PHP, Node.js, Python mà không cần tự cấu hình hạ tầng, nhưng vẫn toàn quyền SSH vào EC2. | *"Khách sạn đầy đủ tiện nghi: Có sẵn giường tủ, bạn chỉ xách vali mã nguồn vào ở."* |
| **AWS App Runner** | Dịch vụ PaaS Serverless chuyên cho web apps/APIs từ source code hoặc container image. | Đưa web app lên internet nhanh nhất: tự lo build, TLS SSL, load balancer, auto scale; không cần biết VPC/cluster. | *"Tàu cao tốc trọn gói: Đưa code lên là chạy thẳng ra internet có sẵn HTTPS."* |
| **Amazon Lightsail** | VPS đơn giản với mức giá cố định hàng tháng (gồm compute, storage, data transfer, IP, DNS). | Dành cho người ít kinh nghiệm AWS, chạy blog WordPress, web thử nghiệm, chi phí cố định dễ đoán. | *"Căn hộ mini trọn gói: Trả tiền trọn gói tiền nhà + điện nước hàng tháng, không phát sinh."* |
| **AWS Outposts** | Rack phần cứng máy chủ AWS đặt trực tiếp tại Data Center của khách hàng (On-Premises). | Chạy dịch vụ AWS (EC2, EBS, S3 on Outposts, ECS, RDS) tại chỗ để đáp ứng yêu cầu lưu trữ dữ liệu tại chỗ (Data Residency) và độ trễ cực thấp. | *"Mang một góc trung tâm dữ liệu AWS về đặt ngay trong phòng server công ty mình."* |
| **AWS Local Zones** | Điểm mở rộng của AWS Region đặt gần các đô thị lớn có đông dân cư. | Phục vụ người dùng cuối tại thành phố cụ thể với độ trễ dưới 10 mili-giây (single-digit ms) cho game, live streaming, VDI. | *"Trạm phân phối vệ tinh: Đặt gần trung tâm thành phố để giao hàng siêu tốc."* |
| **AWS Wavelength** | Hạ tầng AWS Compute/Storage được nhúng trực tiếp bên trong mạng 5G của nhà mạng viễn thông. | Xử lý tác vụ di động cần độ trễ cực thấp (< 10ms) cho xe tự hành, AR/VR, video analytics mà không rời khỏi mạng 5G. | *"Tháp phát sóng 5G thông minh: Xử lý dữ liệu ngay tại cột sóng điện thoại."* |
| **Amazon ECS/EKS Anywhere** | Giải pháp điều phối container trên phần cứng tự có (On-prem VM, Bare-metal). | Quản lý container tại trung tâm dữ liệu riêng bằng tooling AWS thống nhất mà **không cần mua rack phần cứng AWS Outposts**. | *"Dùng phần mềm điều phối container của AWS trên dàn máy tính cũ của công ty."* |

---

## ⚡ EC2 INSTANCE TYPES — Chọn Nhanh

| Keyword Pattern | ✅ Instance Family | 💡 Vì Sao | Ví dụ Workload |
|:---|:---|:---|:---|
| "balanced CPU/RAM, general workload" | `m6i`, `m7g` (General Purpose) | Tỉ lệ CPU:RAM 1:4 cân bằng. "M" = Medium/Mixed. | Web servers, app servers |
| "compute-intensive, game server, video encoding" | `c6i`, `c7g` (Compute Optimized) | "C" = Compute. CPU:RAM 1:2, nhiều vCPU hơn. | Game servers, batch processing |
| "in-memory DB, SAP HANA, Redis cluster" | `r6i`, `r7g`, `x2gd` (Memory Optimized) | "R" = RAM, "X" = Extreme memory. CPU:RAM 1:8 hoặc cao hơn. | In-memory databases |
| "NVMe local SSD, millions IOPS, Cassandra" | `i3en`, `i4g`, `d3` (Storage Optimized) | "I" = IOPS NVMe SSD, "D" = Dense HDD. Gắn vật lý, microsecond. | NoSQL databases, Data Warehouse |
| "GPU ML training, deep learning, CUDA, graphics" | `p5`, `g5`, `inf2`, `trn1` (Accelerated / GPU) | "P"/"G" = NVIDIA GPUs; "Inf"/"Trn" = AWS Inferentia/Trainium. | ML training/inference, 3D render |
| "burstable, dev/test, spiky occasional load" | `t3`, `t4g` (Burstable) | "T" = Throttleable. Dùng CPU Credits — burst khi cần, tiết kiệm khi nhàn. | Dev/Test, small sites, microservices |
| "ARM chip, cheapest per vCPU, Graviton" | `*7g`, `*8g` series (AWS Graviton) | Hậu tố "g" = Graviton ARM. 20% rẻ hơn x86 cùng hiệu năng, tiết kiệm điện. | Đa số workloads hiện đại |

---

## 💲 EC2 PURCHASING OPTIONS — Vì Sao Chọn Cái Nào

| Option | 💡 Vì Sao Chọn | Giảm Giá | Bị Thu Hồi? | Đặc Điểm Cốt Lõi |
|:---|:---|:---:|:---:|:---|
| **On-Demand** | Dev/test, chưa biết tải, ngắn hạn. Không cam kết gì. | 0% | ❌ | Trả theo giây/phút thực tế. Linh hoạt nhất, đắt nhất. |
| **Compute Savings Plans** | Linh hoạt nhất: cam kết chi tiêu $/giờ (1 hoặc 3 năm). Tự động áp dụng cho EC2 mọi family/region + Fargate + Lambda. | ≤ 66% | ❌ | Không gắn với loại máy, không cần chọn trước Region. |
| **EC2 Instance Savings Plans** | Cố định 1 instance family trong 1 region (1 hoặc 3 năm). Vẫn đổi được size, OS, AZ. | ≤ 72% | ❌ | Tiết kiệm hơn Compute SP nhưng kém linh hoạt hơn. |
| **Standard Reserved Instances (RI)** | Cố định instance type, 1 hoặc 3 năm. Bán lại được trên RI Marketplace. | ≤ 72% | ❌ | Không đổi được family. Thanh toán: All Upfront (rẻ nhất), Partial, No Upfront. |
| **Convertible RI** | Cho phép đổi instance family, OS, tenancy trong quá trình cam kết. | ≤ 66% | ❌ | Linh hoạt hơn Standard RI nhưng mức giảm giá thấp hơn. |
| **Spot Instances / Spot Fleet** | Dùng capacity EC2 nhàn rỗi. Phù hợp batch, CI/CD, rendering, big data, worker pull SQS. | ≤ 90% | ✅ | **Cảnh báo thu hồi trước 2 phút** (`instance-action` metadata). Có thể Stop, Hibernate hoặc Terminate. |
| **Dedicated Hosts** | Thuê trọn 1 server vật lý riêng biệt, thấy rõ socket/core/host ID. Bắt buộc cho **BYOL license per-core/socket** (Oracle, Windows Server, SQL Server). | Đắt nhất | ❌ | Kiểm soát vị trí instance placement trên host vật lý. |
| **Dedicated Instances** | Chạy trên phần cứng chỉ dành riêng cho account của bạn (không chung khách hàng khác). | Phí phụ | ❌ | Không thấy được socket/core vật lý $\rightarrow$ **Không dùng cho BYOL theo socket**. |
| **On-Demand Capacity Reservations (ODCR)** | Giữ chỗ capacity ở 1 AZ cụ thể cho sự kiện ngắn hạn (Black Friday, DR drill). | 0% | ❌ | Không cam kết thời gian, hủy lúc nào cũng được. **Không giảm giá** (trừ khi kết hợp Regional RI / Savings Plans). |

> ⚠️ **BẪY QUAN TRỌNG VỀ CAPACITY RESERVATION**:  
> - **Compute Savings Plans** & **Regional RI**: **KHÔNG GIỮ CHỖ CÔNG SUẤT** (No capacity reservation).  
> - **Zonal Reserved Instances**: **CÓ GIỮ CHỖ CÔNG SUẤT** ở 1 AZ cụ thể.  
> - Đề bài: *"Vừa muốn giảm chi phí, vừa chắc chắn 100% có server chạy vào ngày lễ"* $\rightarrow$ **Zonal RI** hoặc **On-Demand Capacity Reservation kết hợp Regional RI/Savings Plans**.

---

## 📈 AMAZON EC2 AUTO SCALING (ASG) — VẬN HÀNH TOÀN DIỆN

### 1. Thành Phần Cốt Lõi Của ASG
- **Launch Template**: Thay thế Launch Configuration (cũ). Hỗ trợ versioning, mixed instance types (kết hợp On-Demand + Spot), T2/T3 Unlimited, EBS storage tùy chỉnh.
- **Size Constraints**: `Min Capacity` $\le$ `Desired Capacity` $\le$ `Max Capacity`.
- **Scaling Cooldown**: Mặc định **300 giây (5 phút)** — thời gian chờ instance ổn định trước khi nhận lệnh scale tiếp theo để chống co giãn giật cục.

### 2. Các Loại Scaling Policies
| Policy | Cách Hoạt Động | Ngữ Cảnh Tối Ưu |
|:---|:---|:---|
| **Target Tracking Scaling** | Đặt mục tiêu metric cố định (VD: Giữ CPU trung bình ở mức 50%, số request/target của ALB = 1000). | **Khuyến nghị mặc định**, dễ cấu hình nhất, tự tính toán số instance cần thêm/bớt. |
| **Step Scaling** | Phản ứng theo các ngưỡng alarm CloudWatch (VD: CPU 70% $\rightarrow$ +2 máy; CPU 90% $\rightarrow$ +5 máy). | **Flash sale, livestream, tải tăng đột biến**. Không có cooldown giữa các bước. |
| **Simple Scaling** | Alarm trigger $\rightarrow$ thêm/bớt N máy $\rightarrow$ đợi hết Cooldown mới nhận lệnh mới. | Tải tăng chậm, đơn giản. |
| **Scheduled Scaling** | Scale theo lịch biểu biết trước (VD: 8h sáng thứ Hai tăng lên 10 máy, 18h giảm xuống 2 máy). | Giờ hành chính, chu kỳ kinh doanh định kỳ. |
| **Predictive Scaling** | Dùng thuật toán Machine Learning dự đoán lưu lượng tải trước 2 ngày và khởi tạo instance sẵn. | Hệ thống có tính chu kỳ tuần/tháng lặp lại ổn định. |

### 3. Các Tính Năng Nâng Cao Cần Nhớ
- **Health Check Types**:
  - `EC2 Status Check` (mặc định): Chỉ kiểm tra phần cứng máy chủ và hệ điều hành.
  - `ELB Health Check`: Đánh giá phản hồi HTTP của ứng dụng (VD: 200 OK). Đề thi hỏi: *"Instance app crash nhưng ASG không thay thế"* $\rightarrow$ Đổi sang **ELB Health Check**.
- **Lifecycle Hooks**:
  - `Pending:Wait` $\rightarrow$ Chạy script cài đặt, khởi tạo cache, kiểm tra cấu hình $\rightarrow$ `Pending:Proceed` mới gắn vào Load Balancer nhận traffic.
  - `Terminating:Wait` $\rightarrow$ Tạm dừng xóa instance để thu thập log files, gửi dữ liệu lên S3 $\rightarrow$ `Terminating:Proceed`.
- **Warm Pool**: Tạo sẵn một cụm instance ở trạng thái `Stopped` hoặc `Running` $\rightarrow$ Giảm thời gian scale-out từ vài phút xuống vài giây cho các ứng dụng boot nặng.
- **Default Termination Policy (Chính sách chọn instance xóa)**:
  1. Chọn **AZ có nhiều instance nhất**.
  2. Trong AZ đó, chọn instance sử dụng **Launch Template / Configuration cũ nhất**.
  3. Nếu cùng template, chọn instance **gần tới giờ tính tiền tiếp theo nhất**.
- **Instance Refresh**: Tự động thay thế dần (Rolling update) toàn bộ các instance trong ASG sang phiên bản Launch Template hoặc AMI mới mà không gây downtime.

---

## 🌐 EC2 PLACEMENT GROUPS — 3 Giây Quyết Định

| Keyword | Placement Group | 💡 Vì Sao | Giới Hạn Cứng |
|:---|:---|:---|:---|
| "lowest latency, HPC, MPI, 100 Gbps, closely located" | **Cluster** | Gom vào cùng một rack vật lý trong 1 AZ $\rightarrow$ Băng thông 100 Gbps, độ trễ < 1ms. Rủi ro: Hỏng rack = hỏng cả cụm. | 1 AZ duy nhất |
| "max fault tolerance, critical app, separate hardware" | **Spread** | Mỗi instance nằm trên 1 rack vật lý độc lập (nguồn điện + switch riêng). Hỏng 1 rack chỉ mất 1 máy. | $\le$ **7 instances / AZ / group** |
| "HDFS / Kafka / Cassandra, rack-aware, hundreds of nodes" | **Partition** | Chia nhóm instance thành các partition (mỗi partition = 1 rack riêng). Thông tin partition đọc qua metadata giúp app phân tán replica an toàn. | $\le$ 7 partitions / AZ |

> 🔧 **Sửa Lỗi "Insufficient Capacity Error" khi start instance trong Cluster Placement Group**:  
> Rack vật lý hiện tại đã hết chỗ trống.  
> 👉 **Giải pháp đúng**: **Stop TOÀN BỘ các instance trong cụm $\rightarrow$ Start lại đồng thời** để AWS cấp phát nguyên một rack vật lý mới đủ dung lượng cho toàn cụm.

---

## 🌍 HYBRID & EDGE COMPUTE: Outposts vs Local Zones vs Wavelength

| Tiêu Chí | AWS Outposts | AWS Local Zones | AWS Wavelength |
|:---|:---|:---|:---|
| **Vị trí đặt phần cứng** | Data Center của khách hàng (On-Prem) | Thành phố lớn (gần người dùng cuối) | Bên trong trạm phát sóng mạng 5G |
| **Đơn vị quản trị** | Rack phần cứng do AWS chuyển tới | Subnet thuộc VPC của Region chính | Subnet thuộc VPC của Region chính |
| **Mục đích chính** | Lưu trữ dữ liệu tại chỗ (Data residency), low latency với hệ thống On-Prem cũ | Trải nghiệm dưới 10ms cho người dùng đô thị (Gaming, CAD/CAM, Live Media) | Ứng dụng di động 5G (Xe tự hành, AR/VR, phân tích video thời gian thực) |
| **Mô hình bảo mật** | Khách hàng chịu trách nhiệm bảo vệ vật lý rack | AWS bảo vệ vật lý | Nhà mạng viễn thông & AWS |
| **Dịch vụ hỗ trợ** | EC2, EBS, S3 on Outposts, ECS, RDS | EC2, EBS, VPC, ECS | EC2, EBS, ECS |

---

## 🐳 CONTAINERS & KUBERNETES TRÊN AWS

### 1. Amazon ECS (Elastic Container Service)
- **AWS-native Orchestrator**: Đơn giản, tích hợp chặt chẽ IAM, VPC, ALB, CloudWatch.
- **Phân Biệt 2 Loại Role Quan Trọng Của ECS Task**:
  - **Task Role**: Cấp quyền cho **mã nguồn ứng dụng bên trong container** (VD: đọc/ghi file S3, ghi bản ghi DynamoDB).
  - **Task Execution Role**: Cấp quyền cho **ECS Agent bên dưới** (VD: kéo Docker image từ private ECR, gửi nhật ký container về CloudWatch Logs).
- **ALB + Dynamic Port Mapping**: Cho phép chạy nhiều container task trên cùng một EC2 host mà không bị xung đột port (ALB tự tìm port ngẫu nhiên được gán).
- **Shared Storage**: Nếu nhiều Task cần đọc/ghi chung một thư mục file $\rightarrow$ Dùng **Amazon EFS** (EBS chỉ gắn được vào 1 EC2 host tại 1 thời điểm).

### 2. AWS Fargate (Serverless Container Engine)
- Hoàn toàn không nhìn thấy, không quản lý, không patch máy chủ EC2.
- **Chế độ mạng `awsvpc`**: Mỗi Task được cấp một card mạng ảo ENI riêng với Private IP trong subnet $\rightarrow$ Gắn trực tiếp **Security Group riêng cho từng Task**.
- **Giới hạn cần nhớ**: **KHÔNG hỗ trợ GPU**, không hỗ trợ DaemonSets (trên EKS), dung lượng đĩa tạm thời (ephemeral storage) từ 20–200 GB.
- **Fargate Spot**: Giảm tới 70% chi phí cho các container có khả năng chịu ngắt quãng.

### 3. Amazon EKS (Elastic Kubernetes Service)
- **Quản lý Control Plane**: AWS tự động quản lý cụm etcd và Kubernetes Master nodes trên đa AZs (Multi-AZ).
- **Phân quyền Pod**: Dùng **IRSA (IAM Roles for Service Accounts)** hoặc **EKS Pod Identity** để cấp quyền IAM cho từng Pod cụ thể (không dùng chung Role của Node worker EC2).
- **Storage CSI Drivers**:
  - `EBS CSI Driver`: Dành cho database/stateful app chạy trong 1 AZ duy nhất.
  - `EFS CSI Driver`: Dành cho chia sẻ file dùng chung xuyên đa AZ.
- **Scaling Trong EKS**:
  - Scale Pod: **HPA (Horizontal Pod Autoscaler)** dựa trên CPU/RAM.
  - Scale Node: **Karpenter** (hiện đại, cấp phát node tức thì) hoặc **Cluster Autoscaler**.
- **EKS Node Types**:
  - **Managed Node Groups**: AWS tự động quản lý ASG và cập nhật phiên bản Kubernetes cho worker nodes.
  - **Self-Managed Nodes**: Tự cấu hình AMI, dùng OS tùy biến, kiểm soát hoàn toàn.
  - **Fargate Profile**: Mỗi Kubernetes Pod chạy như một micro-VM biệt lập; không hỗ trợ DaemonSet, không chạy container đặc quyền (privileged).

### 4. Amazon ECR (Elastic Container Registry)
- Kho lưu trữ OCI Docker image private/public, dữ liệu lưu ngầm trên **Amazon S3** (độ bền 11 số 9).
- **Image Vulnerability Scanning**: Quét cơ bản (Basic - dùng Clair) hoặc quét nâng cao (Enhanced - dùng **Amazon Inspector** phát hiện CVE).
- **Tag Immutability**: Bật tính năng chống ghi đè tag `latest`, ngăn chặn việc vô tình đẩy code mới ghi đè mã nguồn đang chạy ổn định.
- **Lifecycle Policy**: Tự động dọn dẹp và xóa các image cũ không dùng để tối ưu chi phí lưu trữ.
- **Truy Cập Private Từ VPC**: Cần tạo VPC Interface Endpoints (`ecr.api`, `ecr.dkr`) kèm **Gateway Endpoint cho S3** (để kéo các layer file image).

---

## 🚀 BẢNG CHỌN NHANH COMPUTE & CONTAINERS

| Tín Hiệu Đề Thi (Trigger Keywords) | ✅ Đáp Án Chuẩn |
|:---|:---|
| "Kubernetes", "k8s manifests", "Helm charts", "CRD", "open-source container" | **Amazon EKS** |
| "Docker container", "AWS-native", "least operational overhead than K8s" | **Amazon ECS** |
| "run container without managing servers/nodes", "serverless containers" | **AWS Fargate** |
| "batch job > 15 mins", "genomics", "financial simulation", "large-scale batch" | **AWS Batch** |
| "deploy web app quickly from Git/image", "no VPC/cluster knowledge", "URL HTTPS" | **AWS App Runner** |
| "event-driven", "< 15 minutes", "scale to zero", "file upload processing" | **AWS Lambda** |
| "simple WordPress", "fixed monthly price", "all-in-one VPS" | **Amazon Lightsail** |
| "data residency", "ultra-low latency on-premises", "same AWS console/API" | **AWS Outposts** |
| "single-digit ms latency for city users", "gaming/VDI close to metro" | **AWS Local Zones** |
| "mobile 5G application", "telecom carrier network", "connected vehicles" | **AWS Wavelength** |
| "run containers on existing on-prem servers without AWS hardware" | **ECS Anywhere / EKS Anywhere** |
| "MPI / NCCL", "HPC inter-node low latency" | **EFA + Cluster Placement Group** |
| "maintain average CPU at 50%", "target metric" | **Target Tracking Scaling** |
| "sudden traffic spike", "flash sale", "no cooldown between steps" | **Step Scaling** |
| "script before instance enters service" | **ASG Lifecycle Hook (`Pending:Wait`)** |
| "replace EC2 fleet with new AMI rolling without downtime" | **ASG Instance Refresh** |
| "no SSH port 22", "access EC2 shell securely without bastion" | **SSM Session Manager** |
