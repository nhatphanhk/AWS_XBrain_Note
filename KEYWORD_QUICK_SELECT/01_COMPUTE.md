# 01 — COMPUTE KEYWORDS: EC2, Lambda, ECS/Fargate, HPC

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ COMPUTE

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon EC2** | Máy chủ ảo đám mây cấp hạ tầng (IaaS), toàn quyền cấu hình OS, CPU, RAM, Network, Storage. | Chạy ứng dụng doanh nghiệp truyền thống, phần mềm tùy biến nhân hệ điều hành, dịch vụ chạy 24/7. | *"Thuê nhà nguyên căn tự sắm nội thất, ở hay không ở vẫn phải trả tiền đều đặn."* |
| **AWS Lambda** | Điện toán phi máy chủ (Serverless FaaS), chạy mã nguồn theo sự kiện (Event-driven) tối đa 15 phút. | Xử lý tác vụ ngắn hạn, backend API microservices, tự co giãn từ 0 đến hàng ngàn request, scale về 0 khi không có tải. | *"Taxi công nghệ: Tính tiền theo km lăn bánh, xe dừng là ngắt đồng hồ."* |
| **Amazon ECS** | Nền tảng điều phối container Docker được quản lý độc quyền của AWS, tích hợp sâu hạ tầng AWS. | Quản lý và vận hành các ứng dụng đóng gói Docker microservices đơn giản, không tốn công học Kubernetes. | *"Quản đốc bến cảng AWS: Xếp container Docker nhanh gọn, chuẩn AWS."* |
| **Amazon EKS** | Dịch vụ quản lý cụm Kubernetes chuẩn mã nguồn mở CNCF. | Vận hành microservices quy mô lớn tương thích 100% với hệ sinh thái Kubernetes (k8s manifests, Helm). | *"Chuẩn container quốc tế: Chạy được mọi nơi, mang đi đâu cũng chạy được."* |
| **AWS Fargate** | Động cơ tính toán Serverless dành cho Containers (chạy được trên cả ECS lẫn EKS). | Chạy container Docker mà **hoàn toàn không cần quản lý máy chủ EC2 host bên dưới**. Chỉ trả tiền theo vCPU/RAM. | *"Gửi hàng theo kiện: Đóng thùng trả cước theo cân nặng, không cần mua tàu chở."* |
| **AWS Batch** | Dịch vụ lập lịch và điều phối các tác vụ tính toán hàng loạt (Batch Computing) ở mọi quy mô. | Điều phối hàng trăm ngàn job tính toán phân tích kỹ thuật, render đồ họa, HPC; tích hợp Spot instances tự scale về 0. | *"Xưởng gia công thời vụ: Có đơn hàng là thuê thợ làm thật nhanh rồi tự giải tán."* |
| **AWS Elastic Beanstalk**| Nền tảng triển khai ứng dụng dạng dịch vụ (PaaS) cho web applications. | Triển khai nhanh ứng dụng Java, .NET, PHP, Node.js, Python mà không cần tự cấu hình VPC/ASG, nhưng vẫn toàn quyền SSH vào EC2. | *"Khách sạn đầy đủ tiện nghi: Có sẵn giường tủ, bạn chỉ xách vali mã nguồn vào ở."* |

---

## ⚡ EC2 INSTANCE TYPES — Chọn Nhanh

| Keyword Pattern | ✅ Instance Family | 💡 Vì Sao | Ví dụ |
|:---|:---|:---|:---|
| "balanced CPU/RAM, general workload" | `m6i`, `m7g` (General Purpose) | Tỉ lệ CPU:RAM 1:4 cân bằng. "M" = Medium/Mixed. | Web servers, app servers |
| "compute-intensive, game server, video encoding" | `c6i`, `c7g` (Compute Optimized) | "C" = Compute. CPU:RAM 1:2, nhiều vCPU hơn. | Game servers, batch processing |
| "in-memory DB, SAP HANA, Redis cluster" | `r6i`, `r7g` (Memory Optimized) | "R" = RAM. CPU:RAM 1:8 hoặc cao hơn. | In-memory databases |
| "NVMe local SSD, millions IOPS, Cassandra" | `i3en`, `i4g` (Storage Optimized) | "I" = I/O. NVMe SSD gắn vật lý, microsecond. | NoSQL databases |
| "GPU ML training, deep learning, CUDA" | `p5`, `g5` (Accelerated - GPU) | "P"/"G" = GPU. NVIDIA H100/A10G cho AI/ML. | ML training |
| "burstable, dev/test, spiky occasional load" | `t3`, `t4g` (Burstable) | "T" = Throttleable. CPU Credits — burst khi cần, tiết kiệm khi nhàn. | Dev/Test, small sites |
| "ARM chip, cheapest per vCPU, Graviton" | `*7g` series (AWS Graviton) | "G" suffix = Graviton ARM. 20% rẻ hơn x86 cùng hiệu năng. | Hầu hết workloads |

---

## 💲 EC2 PURCHASING OPTIONS — Vì Sao Chọn Cái Nào

| Option | 💡 Vì Sao Chọn | Giảm Giá | Bị Thu Hồi? |
|:---|:---|:---|:---|
| **On-Demand** | Dev/test, chưa biết tải, ngắn hạn. Không cam kết gì. | 0% | ❌ |
| **Compute Savings Plans** | Linh hoạt nhất: cam kết $/giờ, AWS tự áp dụng cho EC2 bất kỳ family/region + Fargate + Lambda. | ≤ 66% | ❌ |
| **EC2 Instance Savings Plans** | Tiết kiệm hơn Compute SP nhưng cố định 1 instance family + 1 region. Vẫn linh hoạt về size/OS. | ≤ 72% | ❌ |
| **Spot Instances** | Dùng capacity nhàn rỗi → 90% off. AWS lấy lại khi cần (cảnh báo 2 phút). Chỉ cho fault-tolerant workload. | ≤ 90% | ✅ |
| **Dedicated Hosts** | BYOL license tính theo **socket/core vật lý** (Oracle, Windows Server). Thuê cả máy vật lý → biết chính xác hardware. | - | ❌ |
| **Dedicated Instances** | Chỉ cần cô lập tenant (không chia sẻ hardware). Không control được socket placement → không dùng cho BYOL license. | Phí phụ | ❌ |
| **On-Demand Capacity Reservations** | Đảm bảo có sẵn capacity ở AZ cụ thể. Trả tiền dù dùng hay không. Dùng cho peak event (Black Friday). | 0% (On-Demand price) | ❌ |

> ⚠️ **BẪY QUAN TRỌNG**: Compute Savings Plans **KHÔNG** có capacity reservation.  
> Zonal Reserved Instances = cũng 72% giảm giá NHƯNG **CÓ** capacity reservation.  
> → Nếu đề hỏi "đảm bảo capacity" → **Zonal RI** hoặc **On-Demand Capacity Reservations**.

---

## 🌐 EC2 PLACEMENT GROUPS — 3 Giây Quyết Định

| Keyword | Placement Group | 💡 Vì Sao | Giới Hạn Cứng |
|:---|:---|:---|:---|
| "lowest latency, HPC, MPI, 100 Gbps" | **Cluster** | Gom vào cùng rack → 100 Gbps, < 1ms. Nhược: rack hỏng = mất tất cả. | 1 AZ |
| "max fault tolerance, critical app, different rack" | **Spread** | Mỗi instance = 1 rack riêng (nguồn điện + switch riêng). Rack hỏng = chỉ mất 1 instance. | ≤ **7 instances/AZ** |
| "HDFS/Kafka/Cassandra topology-aware, large cluster" | **Partition** | Nhóm rack theo partition; app biết mình ở partition nào → replica không cùng partition = không mất cùng lúc. | ≤ 7 partitions/AZ |

> 🔧 **Fix "Insufficient Capacity Error" trong Cluster Placement Group**:  
> Rack hiện tại hết chỗ. → **Stop ALL → Start ALL cùng lúc** → AWS tìm rack mới đủ chỗ cho cả cụm.  
> KHÔNG terminate hay thêm instance mới riêng lẻ.

---

## 🔒 EC2 SECURITY & ACCESS — Vì Sao Chọn Gì

| Scenario | Solution | 💡 Vì Sao | Tránh |
|:---|:---|:---|:---|
| "no SSH port 22, audit all commands, no Bastion" | **SSM Session Manager** | Dùng TLS qua AWS API — không cần mở inbound port. Mọi lệnh ghi log vào CloudWatch/S3. | ~~Bastion Host~~ (phải mở port 22) |
| "SSH to private subnet, no Public IP, no IGW" | **EC2 Instance Connect Endpoint (EICE)** | EICE = tunnel SSH qua AWS API đến private instance. Không cần NAT hay Public IP. | ~~NAT + Bastion~~ |
| "prevent SSRF attacks on IMDS" | **IMDSv2** (PUT token required) | IMDSv1 = GET đơn giản → hacker dùng SSRF để lấy IAM credentials. IMDSv2 = cần PUT request tạo session token trước → SSRF không lấy được. | ~~IMDSv1~~ |
| "EC2 call AWS APIs, no hardcoded keys" | **IAM Instance Profile** | Instance Profile = attach IAM Role vào EC2 → tự động lấy temporary credentials qua IMDS, rotate mỗi giờ. | ~~access key trong code~~ |

---

## ⚡ SERVERLESS — LAMBDA QUICK GUIDE

| Keyword | Answer | 💡 Vì Sao |
|:---|:---|:---|
| "max execution time" | **15 minutes** | Hard limit. Nếu task > 15 phút → ECS Fargate hoặc AWS Batch. |
| "Lambda in VPC → needs internet for external API" | **Private Subnet + NAT Gateway** | Lambda trong VPC không có Public IP. Cần NAT Gateway trong Public Subnet để ra internet. |
| "poison pill in Kinesis/DynamoDB Streams blocks shard" | **BisectBatchOnFunctionError = true** | Chia đôi batch lỗi, cô lập record độc hại vào DLQ, giải phóng shard tiếp tục. |
| "Lambda cold start latency for critical app (Java/.NET)" | **Lambda SnapStart** (Java) | SnapStart = chụp snapshot trạng thái sau init → restore snapshot thay vì init lại → giảm cold start 90%. |
| "Lambda → access RDS, too many connections" | **RDS Proxy** | RDS Proxy = connection pooler đứng giữa Lambda và RDS. Lambda có thể scale lên 1000 concurrent mà RDS vẫn ổn. |
| "Lambda → access S3 without internet, no NAT cost" | **Gateway VPC Endpoint for S3** | Gateway Endpoint = miễn phí, không qua internet, không cần NAT. |
| "async Lambda failure, capture failed events" | **DLQ (SQS)** trên Lambda async destination | Async invocation lỗi → gửi vào DLQ để debug sau. Sync invocation không dùng DLQ. |

---

## 🐳 CONTAINERS — ECS / EKS / FARGATE

| Keyword | Answer | 💡 Vì Sao |
|:---|:---|:---|
| "containerized, no manage EC2/OS, serverless" | **ECS Fargate** | AWS quản lý EC2 host bên dưới. Bạn chỉ định vCPU + RAM và image. |
| "cost-optimize batch container jobs" | **Fargate Spot** | Fargate Spot = Spot price cho serverless container. Tiết kiệm 70%. Dùng cho fault-tolerant batch. |
| "ECS needs persistent shared volume between tasks" | **EFS** (mounted in Task Definition) | EFS = NFS multi-AZ, nhiều task đọc/ghi cùng lúc. EBS = chỉ gắn vào 1 EC2. |
| "managed Kubernetes" | **Amazon EKS** | Dùng khi team đã biết K8s, cần portability, hoặc multi-cloud. Nếu không cần K8s → ECS đơn giản hơn. |
| "unlimited runtime batch, HPC, no 15-min limit" | **AWS Batch** | Batch orchestrate EC2/Fargate jobs, tích hợp Spot Fleet, không giới hạn runtime. Lambda max 15 phút. |

---

## 🔥 HPC — HIGH PERFORMANCE COMPUTING

| Keyword | Answer | 💡 Vì Sao |
|:---|:---|:---|
| "MPI / NCCL parallel computing, lowest inter-node latency" | **EFA** + Cluster Placement Group | EFA = OS-bypass: app nói thẳng với NIC hardware, bỏ qua kernel Linux. ENA vẫn qua TCP/IP stack của OS. |
| "POSIX parallel file system for HPC, linked to S3" | **FSx for Lustre** | Lustre = parallel POSIX FS, throughput cực cao, tự động sync dữ liệu với S3 bucket. EFS không có parallel throughput kiểu HPC. |
| "HPC batch scheduling, thousands of jobs" | **AWS Batch** | Batch = managed job queue + Spot Fleet + compute environments. Không giới hạn runtime. |

---

## 💡 EC2 QUICK FACTS (Thường Ra Đề)

| Fact | Chi Tiết | 💡 Móc Nhớ |
|:---|:---|:---|
| **Hibernate** | RAM → EBS encrypted; restart vài giây; max 60 ngày | "Ngủ đông = RAM ra đĩa, bật lại = tiếp tục ngay" |
| **User Data** | Chạy 1 lần khi boot đầu, root user | "Lệnh cài phần mềm chạy 1 lần" |
| **IMDSv2** | Cần PUT token trước khi GET metadata | "PUT trước GET sau = an toàn hơn IMDSv1" |
| **Elastic IP** | Tĩnh, giữ khi Stop/Start, tính phí \$0.005/hr nếu không dùng | "EIP = địa chỉ nhà cố định; Public IPv4 = phòng khách sạn (đổi mỗi lần check-in)" |
| **Public IPv4** | Thay đổi mỗi lần Stop → Start | "Stop = trả IP về pool, Start = lấy IP mới" |
| **Spot 2-min warning** | `instance-action` metadata → checkpoint + save state to S3 | "2 phút = chạy save checkpoint, không kịp thì mất" |
