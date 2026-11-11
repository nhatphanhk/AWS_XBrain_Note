# 01 — COMPUTE KEYWORDS: EC2, Lambda, ECS/Fargate, HPC

> File chuyên sâu cho nhóm Compute. Mỗi mục gồm: Từ khóa → Đáp án → Bẫy → Giải thích ngắn.

---

## ⚡ EC2 INSTANCE TYPES

| Keyword Pattern | ✅ Instance Family | Lý Do |
|:---|:---|:---|
| "balanced CPU/RAM, general workload" | `m6i`, `m7g` (General Purpose) | Tỉ lệ CPU:RAM cân bằng |
| "compute-intensive, game server, video encoding" | `c6i`, `c7g` (Compute Optimized) | vCPU/RAM ratio cao |
| "in-memory DB, SAP HANA, Redis cluster" | `r6i`, `r7g`, `x2idn` (Memory Optimized) | RAM khổng lồ |
| "NoSQL, Cassandra, millions IOPS NVMe local" | `i3en`, `i4g` (Storage Optimized) | NVMe SSD vật lý |
| "GPU ML training, deep learning, CUDA" | `p5`, `g5` (Accelerated - GPU) | NVIDIA H100/A10G |
| "burstable, dev/test, spiky occasional load" | `t3`, `t4g` (Burstable - CPU Credits) | Chi phí thấp, burst khi cần |
| "ARM chip, cheapest per vCPU, Graviton" | `*7g` series (AWS Graviton ARM) | 20% rẻ hơn x86 |

---

## 💲 EC2 PURCHASING OPTIONS — Chọn Nhanh

```
Ngắn hạn / không dự đoán   → On-Demand
Tiết kiệm linh hoạt nhất    → Compute Savings Plans (66%, EC2+Fargate+Lambda)
Tiết kiệm 1 family cụ thể   → EC2 Instance Savings Plans (72%, 1 region)
Fault-tolerant, batch        → Spot Instances (90% off, có thể bị thu hồi 2 phút)
BYOL license per socket/core → Dedicated Hosts (đắt nhất)
Tenant isolation only        → Dedicated Instances
Đảm bảo capacity Black Fri   → On-Demand Capacity Reservations
```

> ⚠️ **Bẫy Savings Plans**: Compute Savings Plans **KHÔNG** có capacity reservation.  
> Zonal RI = Savings Plans không tương đương vì Zonal RI **CÓ** capacity reservation.

---

## 🌐 EC2 PLACEMENT GROUPS — Quyết Định 3 Giây

| Từ Khóa | Placement Group | Giới Hạn Quan Trọng |
|:---|:---|:---|
| "lowest latency, HPC, MPI, 100 Gbps" | **Cluster** (cùng rack, 1 AZ) | Rủi ro: rack hỏng = mất tất cả |
| "max fault tolerance, critical app, different rack" | **Spread** (mỗi instance 1 rack) | ≤ **7 instances per AZ** |
| "HDFS/Kafka/Cassandra topology-aware, large cluster" | **Partition** (nhóm rack, nhiều AZ) | ≤ 7 partitions/AZ |

> 🔧 **Cluster Placement "Insufficient Capacity Error" Fix**:  
> → **Stop ALL instances → Start ALL cùng lúc** (AWS tìm rack mới có đủ chỗ)

---

## 🔒 EC2 SECURITY & ACCESS

| Scenario | Solution | Avoid |
|:---|:---|:---|
| "no SSH port 22, audit all commands, no Bastion" | **SSM Session Manager** | ~~Bastion Host~~ |
| "SSH to private subnet, no Public IP, no IGW" | **EC2 Instance Connect Endpoint (EICE)** | ~~NAT + Bastion~~ |
| "prevent SSRF attacks on IMDS" | **IMDSv2** (PUT token required) | ~~IMDSv1~~ |
| "EC2 call AWS APIs, no hardcoded keys" | **IAM Instance Profile** (Role attached) | ~~access key in code~~ |

---

## ⚡ SERVERLESS — LAMBDA

| Keyword | Answer | Detail |
|:---|:---|:---|
| "max execution time" | **15 minutes** | Nếu > 15p → ECS/Fargate/Batch |
| "Lambda in VPC → needs internet for external API" | **Private Subnet + NAT Gateway** | Lambda không có public IP |
| "poison pill in Kinesis/DynamoDB Streams blocks shard" | **BisectBatchOnFunctionError = true** | Splits batch, isolates bad record |
| "Lambda cold start latency for critical app (Java/.NET)" | **Lambda SnapStart** (Java) | Pre-initialized snapshot |
| "run Lambda in VPC, access RDS + download npm package" | **Private Subnet + NAT Gateway** | NAT cho internet, VPC Endpoint cho RDS |
| "DLQ for failed async Lambda invocations" | **SQS DLQ** on Lambda destination | Async only (not sync) |
| "Lambda → access S3 without internet" | **Gateway VPC Endpoint for S3** | Free, no NAT needed |

---

## 🐳 CONTAINERS — ECS / EKS / FARGATE

| Keyword | Answer | Detail |
|:---|:---|:---|
| "containerized, no manage EC2/OS, serverless" | **ECS Fargate** | Pay per vCPU+memory used |
| "cost-optimize batch container jobs" | **Fargate Spot** | Up to 70% cheaper |
| "ECS needs persistent shared volume between tasks" | **EFS** (mounted in Task Definition) | EFS supports multi-AZ |
| "managed Kubernetes" | **Amazon EKS** | Use if team already knows K8s |
| "hybrid Kubernetes (on-prem + cloud)" | **EKS Anywhere** | Runs K8s on-premises |
| "unlimited runtime batch, HPC, no 15-min limit" | **AWS Batch** | Batch orchestrates EC2/Fargate jobs |

---

## 🔥 HPC — HIGH PERFORMANCE COMPUTING

| Keyword | Answer | Avoid |
|:---|:---|:---|
| "MPI / NCCL parallel computing, lowest inter-node latency" | **EFA** (Elastic Fabric Adapter) + Cluster Placement | ~~ENA~~ (no OS-bypass) |
| "100 Gbps between instances same AZ" | **ENA** + Cluster Placement (or EFA) | ~~cross-AZ~~ |
| "POSIX parallel file system for HPC, linked to S3" | **FSx for Lustre** | ~~EFS~~ (EFS lower throughput) |
| "HPC batch scheduling, thousands of jobs" | **AWS Batch** (managed, Spot-integrated) | ~~Lambda~~ |

---

## 💡 EC2 QUICK FACTS (Thường Ra Đề)

- **Hibernate**: RAM → EBS (phải encrypt EBS); restart trong vài giây. Max 60 ngày.  
- **User Data**: Chạy 1 lần khi boot đầu, root user, dùng để cài phần mềm.  
- **Instance Metadata**: `http://169.254.169.254/latest/meta-data/` (IMDSv2 bắt buộc).  
- **Elastic IP**: Tĩnh, giữ khi Stop/Start. Tính phí \$0.005/hr nếu không dùng.  
- **Public IPv4**: Thay đổi mỗi lần Stop → Start.  
- **Spot 2-min warning**: `instance-action` metadata → checkpoint + save state to S3.

