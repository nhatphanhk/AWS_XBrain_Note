# Tài Liệu Học Tập Chuyên Sâu: Amazon ECS, AWS Fargate, ECR & EKS (Công Nghệ Điều Phối Container Đám Mây)

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Senior AWS Solutions Architect & Cloud DevOps Engineer (cập nhật mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt (Bảo lưu toàn bộ thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Các dịch vụ liên quan**: Amazon ECS, AWS Fargate, Amazon ECR, Amazon EKS, AWS App Runner, ECS Service Connect.

---

## 6.1. Tổng Quan Dịch Vụ (Service Overview)

### Dịch vụ gì?
Hệ sinh thái công nghệ đóng gói và điều phối container trên AWS cung cấp các giải pháp toàn diện từ mức phi máy chủ đến chuẩn công nghiệp:
1. **Amazon Elastic Container Service (Amazon ECS)**: Dịch vụ điều phối container độc quyền (AWS-native) có độ tin cậy tuyệt đối, tốc độ triển khai cực nhanh và tích hợp chặt chẽ với IAM, ALB, CloudWatch và Secrets Manager.
2. **AWS Fargate**: Động cơ tính toán phi máy chủ (**Serverless Compute Engine**) dành cho cả ECS và EKS. Bạn không cần quản lý bất kỳ cụm máy ảo EC2 nào bên dưới; AWS tự động phân bổ tài nguyên và bạn chỉ trả tiền cho đúng lượng vCPU và RAM mà container thực sự tiêu thụ theo từng giây.
3. **Amazon Elastic Container Registry (Amazon ECR)**: Kho lưu trữ ảnh container (Docker Container Registry) được quản lý toàn diện, hỗ trợ quét lỗ hổng bảo mật tự động bằng Amazon Inspector, tính năng **Pull Through Cache** và mã hóa KMS.
4. **Amazon Elastic Kubernetes Service (Amazon EKS)**: Dịch vụ chạy cụm điều phối container mã nguồn mở **Kubernetes** được chứng nhận tương thích (Certified Conformant), hỗ trợ tính năng **EKS Pod Identity** hiện đại và Karpenter để tối ưu hóa worker nodes.
5. **ECS Service Connect**: Giải pháp Service Mesh và Service Discovery gọn nhẹ tích hợp sẵn vào ECS, cho phép các microservices giao tiếp với nhau bằng tên miền nội bộ (`http://order-service:8080`) mà không cần cấu hình DNS riêng hay Application Load Balancer nội bộ.

---

## 6.2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts, Security & Day-2 Operations)

### 1. Phân Biệt Launch Types: EC2 vs AWS Fargate

```mermaid
flowchart TD
    Dev[Kỹ sư DevOps / CI Pipeline] -->|Docker Push| ECR[Amazon ECR\nKho lưu trữ Container Image]

    subgraph ECSCluster[Amazon ECS Cluster]
        TaskDef[ECS Task Definition\nJSON Blueprint: Image, vCPU, RAM, Ports, Roles]
        
        subgraph LaunchTypes[Lựa chọn Launch Types]
            direction LR
            EC2Type[1. EC2 Launch Type\nBạn quản lý OS, Patching & ASG Nodes]
            FargateType[2. AWS Fargate (Serverless)\nKhông quản lý Node/OS, Chỉ cấp vCPU/RAM]
        end

        Service[ECS Service\nDuy trì số lượng Desired Tasks\nTích hợp ALB Target Group & Service Connect]
        TaskDef --> Service
        Service --> LaunchTypes
    end

    ECR -->|Pull Image| LaunchTypes
    ALB[Application Load Balancer] -->|Dynamic Port Mapping| Service
```

| Tiêu chuẩn so sánh | EC2 Launch Type | AWS Fargate Launch Type |
| :--- | :--- | :--- |
| **Quản trị hạ tầng** | **Tự quản lý**: Phải cấu hình EC2, vá lỗi OS định kỳ, quản lý ECS Container Agent và ECS-optimized AMI. | **Serverless 100%**: Không nhìn thấy máy chủ; AWS chịu trách nhiệm bảo mật và quản lý toàn bộ hệ điều hành bên dưới. |
| **Mô hình tính phí** | Trả tiền theo giờ của các máy ảo EC2 đang chạy (dù container có chạy hết công suất hay không). | **Chỉ trả tiền theo vCPU và RAM** cấp phát cho từng Task trong thời gian Task hoạt động thực tế. |
| **Cơ chế mở rộng (Scaling)** | Co giãn 2 tầng phức tạp: Auto Scaling cho số lượng Task VÀ Auto Scaling cho số lượng máy chủ EC2 (Cluster Auto Scaling). | Co giãn 1 tầng tức thời: Chỉ cần yêu cầu tăng số lượng Task mong muốn (Desired Count). |
| **Lưu trữ dữ liệu** | Hỗ trợ Amazon EBS, Amazon EFS và EC2 Instance Store cục bộ tốc độ cao. | Hỗ trợ Ephemeral Storage (20 GB - 200 GB), **Amazon EFS**, và hỗ trợ gắn trực tiếp **Amazon EBS** cấp Task. |
| **Kịch bản tối ưu** | Khối lượng tải rất lớn chạy ổn định 24/7 để tối ưu chi phí bằng Reserved Instances / Compute Savings Plans. | Microservices phân tán, tác vụ xử lý hàng đợi (Batch Workers), môi trường CI/CD không muốn tốn công bảo trì máy chủ. |

---

### 2. Hai Loại IAM Roles Sống Còn Trong Amazon ECS

```mermaid
classDiagram
    class TaskExecutionRole {
        +Được dùng bởi: ECS Agent / Hạ Tầng AWS
        +Mục đích:
        - Đăng nhập và kéo image từ Amazon ECR
        - Tạo Log Stream và đẩy log lên CloudWatch Logs
        - Lấy và giải mã bí mật từ Secrets Manager / SSM Parameter Store
    }
    class TaskRole {
        +Được dùng bởi: Mã nguồn ứng dụng bên trong Container
        +Mục đích:
        - Đọc/ghi tệp tin lên Amazon S3 Bucket
        - Truy vấn và cập nhật bảng Amazon DynamoDB
        - Gửi và nhận tin nhắn từ Amazon SQS Queue
    }
```

- **ECS Task Execution Role**: Cấp quyền cho tiến trình **ECS Container Agent** hoặc hạ tầng Fargate chuẩn bị môi trường chạy container (kéo ảnh từ ECR, ghi log vào CloudWatch, đọc secrets).
- **ECS Task Role**: Cấp quyền nghiệp vụ trực tiếp cho chính mã nguồn ứng dụng chạy bên trong container gọi các API của AWS (tương tự như Instance Profile của EC2). Mỗi microservice sở hữu một Task Role riêng biệt theo nguyên tắc Least Privilege.

---

### 3. Ánh Xạ Cổng Động (Dynamic Port Mapping) & ECS Service Connect

- **Dynamic Port Mapping trên ALB**:
  - Khi chạy nhiều Tasks của cùng một Service trên cùng một máy chủ EC2, việc chỉ định cổng tĩnh sẽ gây xung đột.
  - Bằng cách để trống trường `HostPort` (hoặc đặt giá trị `0`) trong Task Definition, Docker daemon sẽ tự động cấp một cổng ngẫu nhiên trong dải tạm thời (**Ephemeral Ports: 32768 - 61000**).
  - ECS Service tự động đăng ký địa chỉ IP của EC2 kèm theo số cổng ngẫu nhiên này vào Target Group của ALB.
- **ECS Service Connect (Hiện đại)**:
  - Cung cấp mạng dịch vụ nội bộ (Service Mesh) cho các microservices trên ECS.
  - Thay vì phải tạo ALB nội bộ hoặc Cloud Map phức tạp, Service Connect tự động triển khai proxy sidecar gọn nhẹ trong từng task. Microservice A có thể gọi trực tiếp sang Microservice B qua tên miền thân thiện (ví dụ `http://payment-service:8080`) với cơ chế tự động cân bằng tải và giám sát độ trễ P99.

---

## 6.3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### Quy Trình Triển Khai Blue/Green Không Gián Đoạn trên ECS Fargate với AWS CodeDeploy

```mermaid
sequenceDiagram
    autonumber
    actor DevOps as Kỹ Sư DevOps / CI Pipeline
    participant ECR as Amazon ECR
    participant ECS as Amazon ECS Service
    participant CodeDeploy as AWS CodeDeploy
    participant ALB as Application Load Balancer
    participant TargetGroup as ALB Target Groups (Blue / Green)

    DevOps->>ECR: Push Docker Image mới (v2.0)
    DevOps->>CodeDeploy: Kích hoạt triển khai Blue/Green Deployment
    CodeDeploy->>ECS: Khởi chạy tập hợp Tasks mới (Green Tasks)
    ECS->>ECR: Kéo image v2.0 sử dụng Task Execution Role
    ECS->>TargetGroup: Đăng ký Green Tasks vào Green Target Group
    Note over ALB,TargetGroup: Chạy Test Health Check trên Test Port (8443)
    ALB-->>CodeDeploy: Health check Passed (HTTP 200 OK)
    CodeDeploy->>ALB: Chuyển hướng 100% lưu lượng Production (Cổng 443) sang Green Target Group
    Note over CodeDeploy: Giám sát CloudWatch Alarms trong 15 phút (Baking Period)
    CodeDeploy->>ECS: Tiêu hủy an toàn các Blue Tasks (v1.0) cũ
    CodeDeploy-->>DevOps: Triển khai thành công không downtime!
```

---

## 6.4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Related AWS Service | Purpose (Mục đích tích hợp) | Integration Method (Phương thức tích hợp) | Practical Example (Ví dụ thực tiễn) |
| :--- | :--- | :--- | :--- |
| **Amazon EFS** | Cung cấp ổ đĩa tệp tin mạng chia sẻ bền vững cho Fargate | ECS Volume Mount Point | Gắn thư mục uploads dùng chung vào 8 Fargate Tasks của trang WordPress để không bị mất dữ liệu khi task khởi động lại. |
| **Amazon EBS** | Cung cấp ổ cứng khối hiệu năng cao gắn trực tiếp vào Fargate Task | ECS Task EBS Volume Integration | Gắn ổ đĩa gp3 tốc độ cao vào container xử lý ảnh lớn trên Fargate với chi phí rẻ hơn EFS. |
| **AWS Systems Manager** | Truy cập shell trực tiếp vào container đang chạy (**ECS Exec**) | SSM Channel Integration | Kỹ sư chạy lệnh `aws ecs execute-command --interactive --command "/bin/sh"` để debug lỗi container đang chạy trên Fargate. |
| **AWS Secrets Manager** | Nạp mật khẩu cơ sở dữ liệu an toàn vào container lúc khởi động | `secrets` block trong Task Definition | Nạp biến môi trường `DB_PASS` trực tiếp từ Secrets Manager mà không ghi lộ thông tin vào Dockerfile. |
| **Amazon CloudWatch** | Thu thập log và giám sát tài nguyên container | `awslogs` driver & Container Insights | Kích hoạt Container Insights để thu thập metrics chi tiết CPU, Memory, Disk, Network I/O trên từng task. |
| **AWS Application Auto Scaling** | Tự động tăng giảm số lượng container theo lưu lượng | Target Tracking Scaling Policy | Tự động mở rộng số lượng Task khi chỉ số trung bình `ALBRequestCountPerTarget` vượt quá 1,000 req/phút. |

---

## 6.5. Bảng So Sánh Trong Hệ Sinh Thái AWS (Ecosystem Comparison)

### So sánh các nền tảng chạy Container trên AWS

| Tiêu chuẩn so sánh | Amazon ECS (EC2) | Amazon ECS (Fargate) | Amazon EKS (Kubernetes) | AWS App Runner | Amazon EC2 (Tự cài Docker) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Bản chất công nghệ** | Điều phối container độc quyền chạy trên máy ảo do người dùng quản trị. | Động cơ chạy container phi máy chủ (Serverless), không quản trị máy ảo. | Cụm điều phối Kubernetes chuẩn mã nguồn mở được AWS quản lý. | Dịch vụ PaaS triển khai container/web tự động hoàn toàn. | Máy chủ ảo truyền thống, người dùng tự cài Docker engine. |
| **Độ phức tạp vận hành** | Trung bình: Phải cấu hình và bảo trì máy ảo EC2, vá lỗi hệ điều hành. | **Rất thấp**: Không nhìn thấy OS, chỉ cấu hình file Task Definition JSON. | **Cao**: Đòi hỏi kỹ năng chuyên sâu về hệ sinh thái Kubernetes (Pods, Helm, Ingress). | **Cực thấp**: Chỉ cần chỉ đường dẫn repo Git hoặc ECR image. | Rất cao: Tự quản lý toàn bộ vòng đời container, networking, scaling. |
| **Chi phí Control Plane** | **$0.00 (Miễn phí)** | **$0.00 (Miễn phí)** | **$0.10 / giờ / cluster** (~$72/tháng/cụm). | **$0.00 (Miễn phí)** | **$0.00 (Không có)** |
| **Khả năng co giãn (Scaling)** | Co giãn 2 tầng (Task + Node ASG) mất vài phút. | Co giãn 1 tầng (Task-level) hoàn tất trong 30-60 giây. | Co giãn linh hoạt qua HPA kết hợp công cụ Karpenter. | Co giãn tự động tức thì theo số lượng HTTP concurrent requests. | Tự viết script hoặc dùng ASG dựa trên CPU của máy ảo. |
| **Hỗ trợ Multi-Cloud** | Chỉ chạy trên AWS (và ECS Anywhere on-prem). | Chỉ chạy trên nền tảng AWS. | **Tuyệt đối**: Dễ dàng di chuyển sang GCP (GKE) hoặc Azure (AKS). | Chỉ chạy trên nền tảng AWS. | Tùy biến tự do trên bất kỳ hạ tầng nào. |
| **Khuyến nghị kiến trúc** | Doanh nghiệp muốn tối ưu chi phí tối đa cho khối lượng container khổng lồ chạy 24/7. | Lựa chọn mặc định tốt nhất cho Microservices trên AWS, loại bỏ gánh nặng vận hành OS. | Doanh nghiệp lớn chuẩn hóa toàn diện trên chuẩn Kubernetes toàn cầu. | Ứng dụng web frontend/backend đơn giản, startup muốn ra mắt nhanh. | Chỉ dùng cho các ứng dụng legacy hoặc môi trường thử nghiệm cá nhân. |

---

## 6.6. Mô Hình Tính Phí & Chiến Lược Tối Ưu Chi Phí (FinOps & Cost Optimization)

### 6.6.1. Bảng Cấu Trúc Định Giá Chi Tiết

| Thành phần Dịch Vụ | Đơn giá AWS niêm yết (us-east-1) | Cơ chế đo lường | Ghi chú tối ưu hóa chi phí FinOps |
| :--- | :--- | :--- | :--- |
| **Amazon ECS Control Plane** | **$0.00** | Miễn phí không giới hạn cụm | Tạo bao nhiêu cụm (Cluster) phân tách môi trường cũng không tốn chi phí. |
| **Amazon EKS Control Plane** | **$0.10 / giờ** (~$72/tháng/cụm) | Tính trên mỗi cụm Kubernetes | Hợp nhất nhiều microservices vào 1 cụm dùng chung bằng Kubernetes Namespaces. |
| **AWS Fargate (vCPU x86)** | **$0.04048 / vCPU / giờ** | Tính theo từng giây (tối thiểu 1 phút) | Cấu hình vCPU sát với nhu cầu thực tế qua CloudWatch Container Insights. |
| **AWS Fargate (RAM x86)** | **$0.004445 / GB / giờ** | Tính theo từng giây cấp phát | Tránh cấp phát thừa RAM không dùng đến trong Task Definition. |
| **AWS Fargate (Arm64 Graviton)** | **Rẻ hơn 20%** so với x86 | $0.03238/vCPU/h & $0.003556/GB/h | Chuyển đổi kiến trúc container sang Arm64 để tiết kiệm ngay 20%. |
| **AWS Fargate Spot** | **Giảm tới 70%** so với On-Demand | ~$0.01214/vCPU/h & ~$0.00133/GB/h | Sử dụng cho background workers, xử lý hàng đợi SQS, batch jobs không sợ bị ngắt. |
| **Amazon ECR Storage** | **$0.10 / GB / tháng** | Tính theo dung lượng ảnh lưu trữ | Bắt buộc thiết lập ECR Lifecycle Policy để xóa các image untagged và image cũ. |

---

### 6.6.2. 5 Kịch Bản Tối Ưu Hóa Chi Phí Thực Tế (FinOps Scenarios)

#### Kịch bản 1: Tối ưu chi phí Worker xử lý hàng đợi bằng Fargate Spot
- **Bối cảnh**: Hệ thống xử lý video gồm 12 worker container tiêu thụ tin nhắn từ Amazon SQS Queue. Mỗi task được cấp phát 2 vCPU và 4 GB RAM chạy liên tục 24/7 (730 giờ/tháng).
- **Tính toán chi phí Fargate On-Demand chuẩn**:
  $$\text{Cost}_{\text{vCPU}} = 12 \times 2 \times \$0.04048 \times 730 = \$709.21$$
  $$\text{Cost}_{\text{RAM}} = 12 \times 4 \times \$0.004445 \times 730 = \$155.75$$
  $$\text{Total Cost}_{\text{OnDemand}} = \$709.21 + \$155.75 = \$864.96/\text{tháng}$$
- **Giải pháp tối ưu**:
  - Vì các worker là phi trạng thái (Stateless), nếu task bị thu hồi thì SQS sẽ tự động trả lại tin nhắn để worker khác xử lý.
  - Cấu hình ECS Service dùng **Fargate Spot Capacity Provider** (giảm 70% chi phí):
  $$\text{Total Cost}_{\text{Spot}} = \$864.96 \times (1 - 0.70) = \$259.49/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$864.96 - \$259.49 = \$605.47/\text{tháng} \quad (\$7{,}265/\text{năm}) \implies \text{Tiết kiệm } 70\% \text{ ngân sách}$$

#### Kịch bản 2: Chuyển đổi kiến trúc Fargate Task sang chip ARM64 (AWS Graviton)
- **Bối cảnh**: Doanh nghiệp chạy 25 microservices viết bằng Node.js và Java Spring Boot trên Fargate x86, tiêu tốn $1,200/tháng tiền hạ tầng tính toán.
- **Giải pháp tối ưu**:
  - Cập nhật pipeline CI/CD biên dịch Docker image hỗ trợ đa nền tảng (`docker buildx --platform linux/arm64`).
  - Trong ECS Task Definition, cấu hình cờ:
    ```json
    "runtimePlatform": {
      "cpuArchitecture": "ARM64",
      "operatingSystemFamily": "LINUX"
    }
    ```
  - Đơn giá tài nguyên của kiến trúc Graviton Arm64 tự động rẻ hơn 20% so với x86:
  $$\text{Cost}_{\text{Arm64}} = \$1{,}200 \times (1 - 0.20) = \$960/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$1{,}200 - \$960 = \$240/\text{tháng} \quad (\$2{,}880/\text{năm}) \implies \text{Tiết kiệm ngay } 20\% \text{ chi phí}$$

#### Kịch bản 3: Tự động hóa dọn dẹp kho ảnh với ECR Lifecycle Policies
- **Bối cảnh**: Hệ thống CI/CD tự động build và push Docker image sau mỗi commit (trung bình 15 bản build/ngày). Mỗi image có dung lượng 1.2 GB. Sau 1 năm, kho lưu trữ tích tụ hơn 5,000 images với tổng dung lượng lên tới 6,000 GB (6 TB).
- **Tính toán chi phí khi không có chính sách dọn dẹp**:
  $$\text{Cost}_{\text{ECR\_Initial}} = 6{,}000 \text{ GB} \times \$0.10/\text{GB} = \$600/\text{tháng} \quad (\$7{,}200/\text{năm})$$
- **Giải pháp tối ưu**:
  - Thiết lập **ECR Lifecycle Policy** trên toàn bộ các repositories:
    1. Xóa các bản build không có tag (`untagged`) sau **2 ngày**.
    2. Chỉ giữ lại tối đa **10 image có tag gần nhất** cho mỗi service (`sinceImagePushed = 10`).
  - Dung lượng lưu trữ thực tế giảm xuống chỉ còn khoảng 150 GB:
  $$\text{Cost}_{\text{ECR\_Optimized}} = 150 \text{ GB} \times \$0.10 = \$15/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$600 - \$15 = \$585/\text{tháng} \quad (\$7{,}020/\text{năm}) \implies \text{Cắt giảm } 97.5\% \text{ chi phí lưu trữ ECR}$$

#### Kịch bản 4: Hợp nhất cụm Amazon EKS Control Plane (Multi-tenant EKS Cluster)
- **Bối cảnh**: Công ty có 6 nhóm phát triển phần mềm độc lập. Mỗi nhóm tự tạo 1 cụm Amazon EKS riêng biệt để chạy ứng dụng dev/test.
- **Tính toán chi phí Control Plane riêng lẻ**:
  $$\text{Cost}_{\text{EKS\_Separate}} = 6 \text{ cụm} \times \$0.10/\text{giờ} \times 730 \text{ giờ} = \$438/\text{tháng} \quad (\text{chưa kể worker nodes})$$
- **Giải pháp tối ưu**:
  - Hợp nhất 6 nhóm vào **1 cụm EKS Multi-tenant dùng chung**:
    - Phân tách môi trường bằng **Kubernetes Namespaces**.
    - Cấu hình **ResourceQuotas** giới hạn vCPU/RAM tối đa cho từng nhóm.
    - Cấp quyền AWS chi tiết cho từng pod bằng **EKS Pod Identity**.
  $$\text{Cost}_{\text{EKS\_Unified}} = 1 \text{ cụm} \times \$0.10 \times 730 = \$73/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$438 - \$73 = \$365/\text{tháng} \quad (\$4{,}380/\text{năm}) \implies \text{Tiết kiệm } 83.3\% \text{ chi phí Control Plane}$$

#### Kịch bản 5: Phân định điểm hòa vốn giữa ECS EC2 Launch Type và AWS Fargate
- **Bối cảnh**: Hệ thống thương mại điện tử vận hành 100 container microservices ổn định 24/7, mỗi container cần 1 vCPU và 2 GB RAM.
- **Tính toán chi phí trên Fargate On-Demand**:
  $$\text{Cost}_{\text{Fargate}} = 100 \times [(\$0.04048 \times 1) + (\$0.004445 \times 2)] \times 730 = \$3{,}604/\text{tháng}$$
- **Giải pháp tối ưu bằng EC2 Launch Type với Compute Savings Plans 3 năm**:
  - Thay vì dùng Fargate, triển khai cụm EC2 gồm 7 máy chủ `c6g.4xlarge` (mỗi máy 16 vCPU, 32 GB RAM, đủ sức chứa toàn bộ 100 containers với mật độ nén cao).
  - Mua gói cam kết **Compute Savings Plans 3 năm trả trước một phần** (giảm 64% so với giá On-Demand của EC2):
  $$\text{Cost}_{\text{EC2\_SavingsPlan}} \approx \$1{,}450/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$3{,}604 - \$1{,}450 = \$2{,}154/\text{tháng} \quad (\$25{,}848/\text{năm}) \implies \text{Tiết kiệm } 59.8\% \text{ chi phí cho tải lớn ổn định}$$

---

## 6.7. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Tình huống sự cố (Problem) | Nguyên nhân cốt lõi (Root Cause) | Các bước điều tra & Chỉ số giám sát (Metrics & Logs) | Giải pháp khắc phục (Remediation) | Biện pháp phòng ngừa (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Task Fargate bị dừng ngay sau khi khởi chạy (`Exit Code 1` hoặc `137`)** | `Exit code 1`: Ứng dụng bị crash do thiếu biến môi trường.<br>`Exit code 137`: Container bị hệ thống tiêu hủy do tràn bộ nhớ (**Out-Of-Memory OOM**). | - Xem tab **Stopped Tasks** trên ECS Console kiểm tra `Stopped reason`.<br>- Giám sát CloudWatch metric `MemoryUtilization`. | 1. Sửa lỗi mã nguồn hoặc bổ sung biến môi trường.<br>2. Tăng thông số `memory` trong Task Definition nếu bị OOM. | Luôn thử nghiệm chạy container cục bộ bằng `docker run -m 512m` để kiểm tra giới hạn RAM trước khi deploy. |
| **Lỗi `CannotPullContainerError` khi khởi động Task** | 1. URI của ECR Image bị sai chính tả.<br>2. **Task Execution Role** thiếu quyền `ecr:GetDownloadUrlForLayer`.<br>3. Task ở Private Subnet không có route ra Internet hoặc thiếu VPC Endpoints cho ECR. | - Kiểm tra thông báo lỗi chi tiết trên ECS Events tab.<br>- Kiểm tra Route Table và Security Group của Subnet gắn task. | 1. Cấp quyền `AmazonECSTaskExecutionRolePolicy` cho Execution Role.<br>2. Bổ sung **VPC Endpoints cho ECR** (`ecr.api`, `ecr.dkr`, và S3 Gateway Endpoint) nếu chạy trong mạng kín. | Đảm bảo mạng Private Subnet luôn có NAT Gateway hoặc đủ bộ 3 VPC Endpoints cho ECR. |
| **ALB Health Check liên tục báo Unhealthy cho ECS Service** | 1. Ứng dụng nặng (như Spring Boot) mất 60s để khởi động nhưng ALB kiểm tra sau 10s.<br>2. Security Group của Task chặn traffic từ ALB.<br>3. Đường dẫn health check trả về mã khác 200. | - Xem tab **Targets** trong Target Group kiểm tra trạng thái Unhealthy.<br>- Kiểm tra Inbound Rules của Security Group gắn với Task. | 1. Tăng giá trị **`HealthCheckGracePeriodSeconds`** (ví dụ: 120s) trên ECS Service.<br>2. Cho phép Security Group của Task nhận traffic từ Security Group của ALB. | Cấu hình endpoint `/health` chuyên dụng trả về HTTP 200 nhanh chóng mà không cần kiểm tra DB phức tạp. |
| **Lỗi `No Container Instances Found` trên cụm EC2 Launch Type** | Toàn bộ các máy chủ EC2 hiện có trong cụm đã hết sạch vCPU hoặc RAM trống để đặt thêm Task mới. | - Xem tổng lượng tài nguyên khả dụng của cụm ECS Cluster.<br>- Giám sát CloudWatch metric `CPUReservation` và `MemoryReservation`. | Bổ sung thêm máy chủ EC2 vào cụm bằng Auto Scaling Group hoặc chuyển sang sử dụng **AWS Fargate** để co giãn vô hạn. | Sử dụng **ECS Capacity Providers** kết hợp tính năng Target Capacity Reservation để tự động co giãn máy chủ EC2 theo nhu cầu của Tasks. |
| **Microservices không tìm thấy nhau khi gọi nội bộ** | Cấu hình sai DNS hoặc các container không nằm chung một mạng Service Connect. | - Kiểm tra cấu hình **ECS Service Connect** trong Service Definition.<br>- Kiểm tra CloudWatch metric `ServiceConnectHTTPCode2XX`. | Đảm bảo các microservices tham gia vào cùng một Service Connect Namespace và sử dụng đúng tên miền định tuyến. | Chuẩn hóa quy trình đặt tên dịch vụ qua Terraform IaC. |

---

## 6.8. Bộ Câu Hỏi Ôn Tập và Kiểm Tra Kiến Thức (Knowledge Review)

### A. Nhóm Câu Hỏi Cốt Lõi (Core Concepts)

#### Câu 1: Sự khác biệt then chốt nhất giữa ECS Task Execution Role và ECS Task Role là gì?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **ECS Task Execution Role**: Được sử dụng bởi chính hạ tầng của AWS (tiến trình **ECS Container Agent** hoặc nền tảng Fargate) trước và trong khi khởi động container. Mục đích: Đăng nhập và kéo Docker image từ Amazon ECR, tạo Log Stream và đẩy log lên Amazon CloudWatch Logs, và lấy các thông tin bí mật từ AWS Secrets Manager nạp vào biến môi trường.
- **ECS Task Role**: Được sử dụng bởi chính mã nguồn ứng dụng chạy bên trong container. Mục đích: Cấp quyền cho ứng dụng thực thi các API nghiệp vụ của AWS (ví dụ: container Order Service được phép đọc/ghi bảng DynamoDB hoặc upload file lên S3 Bucket).
</details>

#### Câu 2: Khi chạy các container ECS trên AWS Fargate trong một Private Subnet không có Internet Gateway hay NAT Gateway, bạn cần cấu hình những thành phần mạng nào để Task có thể kéo ảnh thành công từ Amazon ECR?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: Cần cấu hình tối thiểu 3 VPC Endpoints:
  1. **VPC Interface Endpoint** cho `com.amazonaws.[region].ecr.api` (để gọi các API quản lý của ECR).
  2. **VPC Interface Endpoint** cho `com.amazonaws.[region].ecr.dkr` (để thực hiện lệnh docker pull).
  3. **VPC Gateway Endpoint** cho **Amazon S3** (bắt buộc, vì các layer nhị phân của Docker image thực tế được lưu trữ trên hạ tầng Amazon S3).
</details>

#### Câu 3: Tham số `HealthCheckGracePeriodSeconds` trong cấu hình Amazon ECS Service giải quyết vấn đề kỹ thuật nào?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: Giải quyết vấn đề **Task bị tiêu hủy sớm khi chưa kịp khởi động xong**.
- **Giải thích**: Nhiều ứng dụng doanh nghiệp (như Java Spring Boot, ứng dụng nạp model máy học) mất từ 30 đến 90 giây để nạp xong các thư viện và mở cổng lắng nghe. Nếu không có tham số này, ALB sẽ kiểm tra sức khỏe ngay sau 10 giây đầu tiên, đánh dấu Task là "Unhealthy" và ECS Service sẽ lập tức tiêu hủy Task rồi tạo Task mới, dẫn đến vòng lặp sập/tạo vô tận (Crash Loop). `HealthCheckGracePeriodSeconds` ra lệnh cho ALB bỏ qua kiểm tra sức khỏe trong khoảng thời gian ân hạn ban đầu.
</details>

---

### B. Nhóm Câu Hỏi Tình Huống & Xử Lý Sự Cố (Scenarios & Troubleshooting)

#### Câu 4: Một kỹ sư DevOps muốn chạy nhiều Task của cùng một microservice trên cùng một máy chủ ảo EC2 bằng cụm ECS EC2 Launch Type kết hợp với Application Load Balancer. Làm thế nào để tránh xung đột cổng mạng giữa các container?
- (A) Gán nhiều địa chỉ Elastic IP vào máy ảo EC2.
- (B) Trong Task Definition, đặt `hostPort` là `0` để kích hoạt tính năng Dynamic Port Mapping của ALB.
- (C) Chuyển Network Mode của Task Definition sang `host`.
- (D) Tạo riêng biệt mỗi container một Classic Load Balancer.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án đúng**: **(B)**
- **Giải thích chuyên sâu**:
  - Khi cấu hình `hostPort = 0` (hoặc để trống), Docker daemon sẽ tự động cấp phát một cổng ngẫu nhiên trong dải cổng tạm thời (Ephemeral Ports: 32768 - 61000) trên máy chủ EC2 cho mỗi container khi khởi chạy.
  - ECS Service tự động đăng ký cổng động này vào Target Group của ALB, cho phép nhiều bản sao container chạy song song trên cùng 1 máy ảo mà không bị xung đột.
</details>

#### Câu 5: Hệ thống xử lý ảnh nhận tin nhắn từ SQS và chạy các tác vụ nền kéo dài từ 2 đến 5 phút. Để tối ưu hóa chi phí đến mức tối đa trên AWS Fargate mà vẫn đảm bảo tin nhắn không bị mất khi có sự cố, giải pháp nào là tối ưu nhất?
- (A) Chuyển toàn bộ hệ thống sang chạy trên EC2 On-Demand.
- (B) Sử dụng ECS Service với Fargate Spot Capacity Provider kết hợp xử lý Visibility Timeout trên SQS.
- (C) Chuyển sang chạy trên AWS Lambda với thời gian timeout 30 phút.
- (D) Mua Fargate Reserved Instances 1 năm.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án đúng**: **(B)**
- **Giải thích chuyên sâu**:
  - **AWS Fargate Spot** giảm tới **70% chi phí** so với Fargate On-Demand.
  - Vì các worker là phi trạng thái (Stateless) tiêu thụ từ hàng đợi SQS, nếu một task Spot bị AWS thu hồi (sau khi gửi cảnh báo 2 phút), tin nhắn chưa được xóa khỏi SQS sẽ tự động quay trở lại hàng đợi sau khi hết `VisibilityTimeout` để một worker khác tiếp quản xử lý.
  - Lambda không hỗ trợ chạy quá 15 phút, và Fargate không có khái niệm Reserved Instances (chỉ có Compute Savings Plans).
</details>

---

### C. Nhóm Câu Hỏi Phỏng Vấn Chuyên Sâu (Solutions Architect & DevOps)

#### Câu 6: "Hãy phân tích sự khác nhau giữa việc sử dụng Application Load Balancer nội bộ và ECS Service Connect trong việc kết nối giữa các microservices trên Amazon ECS?"
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Khi dùng Application Load Balancer (ALB) nội bộ**:
  - Mỗi microservice backend cần 1 ALB nội bộ riêng biệt.
  - Nhược điểm: Tốn chi phí cố định ($0.0225/giờ/ALB + cước LCU), lưu lượng phải nhảy thêm một chặng mạng (Extra Network Hop: Task ➔ ALB ➔ Task), tăng độ trễ mạng và tăng độ phức tạp quản trị target groups.
- **Khi dùng ECS Service Connect**:
  - Không cần tạo Load Balancer nào cả; AWS tự động triển khai một Envoy proxy sidecar gọn nhẹ trong từng task.
  - Ưu điểm:
    1. **Chi phí $0.00**: Hoàn toàn miễn phí dịch vụ.
    2. **Độ trễ thấp**: Giao tiếp trực tiếp peer-to-peer giữa các tasks thông qua proxy nội bộ.
    3. **Quản trị dễ dàng**: Microservice A gọi Microservice B đơn giản qua tên miền nội bộ (ví dụ: `http://inventory-service:8080`).
    4. **Giám sát nâng cao**: Tích hợp sẵn việc thu thập metrics chi tiết về số lượng request, mã lỗi HTTP và độ trễ phản hồi (P50, P90, P99) trên CloudWatch.
</details>

#### Câu 7: "Làm thế nào để cấp quyền IAM cho từng Pod riêng lẻ chạy trên Amazon EKS mà không cần chia sẻ quyền của Worker Node?"
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Giải pháp**:
  - **Cách truyền thống**: Sử dụng **IAM Roles for Service Accounts (IRSA)**. Phương pháp này yêu cầu tạo OIDC Identity Provider cho cụm EKS, tạo IAM Role với Trust Policy liên kết với OIDC, và gắn chú thích (Annotation) tên Role vào Kubernetes ServiceAccount.
  - **Cách hiện đại nhất (2024 - 2026)**: Sử dụng **EKS Pod Identity**.
    - EKS Pod Identity là tính năng thế hệ mới của AWS giúp đơn giản hóa hoàn toàn quy trình phân quyền: Không cần cấu hình OIDC Identity Provider cho cụm EKS.
    - Bạn chỉ cần cài đặt EKS Pod Identity Agent add-on trên cụm, sau đó tạo một liên kết (**Pod Identity Association**) giữa IAM Role và Kubernetes ServiceAccount trực tiếp qua AWS Console, CLI hoặc Terraform.
    - Phương pháp này an toàn hơn, dễ tự động hóa hơn và hỗ trợ tái sử dụng Role trên nhiều cụm EKS khác nhau.
</details>

---

## 6.9. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Vàng Quản Trị Container AWS (Golden Rules)
1. **Fargate cho Microservices**: Ưu tiên chọn Fargate để triệt tiêu hoàn toàn công việc quản trị máy chủ và vá lỗi hệ điều hành.
2. **Phân biệt rạch ròi 2 Roles**: Luôn tách biệt **Task Execution Role** (hạ tầng kéo ảnh/ghi log) và **Task Role** (nghiệp vụ ứng dụng gọi AWS API).
3. **Tiết kiệm 70% với Fargate Spot**: Tận dụng Fargate Spot cho các tác vụ xử lý hàng đợi bất đồng bộ hoặc môi trường Dev/Test.
4. **Ưu tiên Arm64 Graviton**: Cấu hình `cpuArchitecture: ARM64` để tiết kiệm ngay 20% chi phí tính toán cho các container Java, Node.js, Python, Go.
5. **Cài đặt ECR Lifecycle Policy**: Luôn thiết lập luật dọn dẹp ảnh cũ để tránh hóa đơn lưu trữ ECR tăng vọt hàng ngàn USD sau các đợt build CI/CD.
6. **Thay thế Internal ALB bằng ECS Service Connect**: Giảm độ trễ mạng và cắt giảm chi phí duy trì Load Balancer cho giao tiếp microservices nội bộ.
7. **Cấu hình Grace Period hợp lý**: Luôn thiết lập `HealthCheckGracePeriodSeconds` để bảo vệ các ứng dụng nặng không bị tiêu hủy sớm khi khởi động.

---

### Danh Mục Kiểm Tra Năng Lực (Learning Checklist)
- [ ] Tôi phân biệt được sự khác biệt giữa ECS EC2 Launch Type và AWS Fargate Serverless.
- [ ] Tôi giải thích được vai trò của ECS Task Definition, ECS Task và ECS Service.
- [ ] Tôi phân biệt rõ ràng giữa ECS Task Execution Role và ECS Task Role.
- [ ] Tôi hiểu nguyên lý hoạt động của Dynamic Port Mapping với Application Load Balancer.
- [ ] Tôi biết cách cấu hình ECS Service Connect để kết nối các microservices nội bộ không cần ALB.
- [ ] Tôi nắm vững các VPC Endpoints cần thiết để Fargate trong Private Subnet kéo ảnh từ Amazon ECR.
- [ ] Tôi hiểu cách sử dụng ECS Exec để mở shell trực tiếp vào container đang chạy phục vụ troubleshooting.

---

### Liên kết và Tài liệu Liên quan
- 📖 [Ghi Chú Bài Học Chương 18: Containers on AWS](../Lesson_Notes/18_Containers_ECS_Fargate_EKS.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](../GLOSSARY.md)
- ⏭️ Tiếp tục chuyển sang chuyên đề: [Kiến Trúc Phân Tách: Amazon SQS, SNS & EventBridge](./SQS_SNS_EventBridge_Decoupling.md).
