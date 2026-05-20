# Triển khai 1 VPC (không dùng VPC Peering) — theo sơ đồ

Tài liệu này mô tả triển khai **1 VPC** duy nhất (2 AZ) gồm: Route 53 → CloudFront (+WAF, ACM) → ALB → ECS Fargate backend → RDS MySQL + ElastiCache (Redis/Valkey), và S3 (Web + Media). Backend nằm trong **private subnets**, outbound qua **NAT Gateway**; truy cập S3 qua **S3 Gateway Endpoint**.

Khu vực triển khai: `ap-southeast-1` (Singapore).

## 0) Quy ước tên + thông số chuẩn (điền theo project)

- Prefix/tên dự án: `minie`
- Environment: `prod`
- Region: `ap-southeast-1`
- Domain (Route 53): ví dụ `minie.example.com` (thay bằng domain bạn sở hữu)
- AccountId: ví dụ `055255093740` (thay bằng account của bạn)

### Tagging discipline (bắt buộc)

Áp tag nhất quán lên mọi billable resource theo [Week6/TaggingStrategy.md](Week6/TaggingStrategy.md).

Default tag set cho dự án (điền giá trị thật):

- `Owner=devops.team@example.com`
- `Environment=prod`
- `CostCenter=G4`
- `Application=minie`

### CIDR 1 VPC (giống sơ đồ)

- VPC CIDR: `10.0.0.0/24`
- Public subnet A (AZ-a): `10.0.0.0/26`
- Public subnet B (AZ-b): `10.0.0.64/26`
- Private subnet A (AZ-a): `10.0.0.128/26`
- Private subnet B (AZ-b): `10.0.0.192/26`

## 1) IAM: User/Group/Role

Mục tiêu: phân quyền theo nhóm, tách role cho ECS (execution/task) và hạn chế dùng access key.

### 1.1 Tạo IAM User Group

IAM → User groups → Create group

- Group name: `DevOps-Team-Policy-1`
- Attach permissions policies (gợi ý theo sơ đồ + triển khai):
  - `AmazonVPCFullAccess`
  - `AmazonECS_FullAccess`
  - `AmazonEC2ContainerRegistryFullAccess`
  - `ElasticLoadBalancingFullAccess`
  - `AmazonS3FullAccess`
  - `CloudFrontFullAccess`
  - `AWSWAFConsoleFullAccess`
  - `AWSCertificateManagerFullAccess`
  - `AmazonRoute53FullAccess`
  - `SecretsManagerReadWrite`

Vì giới hạn policy/Group, tạo thêm group thứ 2:

- Group name: `DevOps-Team-Policy-2`
- Attach policies:
  - `AmazonRDSFullAccess`
  - `ElastiCacheFullAccess`
  - `CloudWatchLogsFullAccess`
  - `CloudWatchFullAccess`
  - `AWSCloudTrail_FullAccess`
  - `AWSKeyManagementServicePowerUser`

Gợi ý bảo mật: nếu tổ chức có SSO, ưu tiên dùng **IAM Identity Center** thay vì access key dài hạn.

### 1.2 Tạo IAM User

IAM → Users → Create user

- User name: `devops-admin`
- AWS Management Console access: bật
- Add user to groups: `DevOps-Team-Policy-1` + `DevOps-Team-Policy-2`

### 1.3 ECS Task Execution Role

IAM → Roles → Create role

- Trusted entity: AWS service
- Use case: Elastic Container Service → **Elastic Container Service Task**
- Permissions:
  - `AmazonECSTaskExecutionRolePolicy`
  - (nếu dùng Secrets Manager để inject secret vào container) thêm inline policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["secretsmanager:GetSecretValue"],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": ["kms:Decrypt"],
      "Resource": "*"
    }
  ]
}
```

- Role name: `ecsTaskExecutionRole-minie-prod`

### 1.4 ECS Task Role (app trong container)

IAM → Roles → Create role

- Trusted entity: AWS service
- Use case: Elastic Container Service → **Elastic Container Service Task**
- Role name: `ecsTaskRole-minie-prod`

Gán policy tối thiểu để app truy cập S3 media bucket và ghi log:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["logs:CreateLogStream", "logs:PutLogEvents"],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::media-s3-minie/*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::media-s3-minie"
    }
  ]
}
```

## 2) KMS + Secrets Manager (đúng sơ đồ)

### 2.1 Tạo KMS key (encrypt secrets)

KMS → Customer managed keys → Create key

- Key type: Symmetric
- Key usage: Encrypt and decrypt
- Alias: `alias/minie-prod`
- Key administrators: `devops-admin`

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 2.2 Tạo secret cho DB credentials

Secrets Manager → Store a new secret

- Secret type: Credentials for Amazon RDS database
- Username: `admin`
- Password: (tự chọn mạnh)
- Encryption key: chọn KMS key `alias/minie-prod`
- Secret name: `minie/prod/db`

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Nếu app cần thêm config, tạo thêm secrets:

- `minie/prod/app` (JWT secret, etc)

## 3) ECR (đúng sơ đồ)

ECR → Repositories → Create repository

- Visibility: Private
- Repository name: `minie-backend`
- Image tag mutability: Mutable
- Scan on push: Enabled
- Encryption: AES-256 (default) hoặc KMS (nếu yêu cầu)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

## 4) Build frontend + build/push backend image

### 4.1 Build frontend

Trong máy local:

- `cd mini-e_web/mini-e_fe_web`
- `npm install`
- `npm run build`

### 4.2 Build & push backend Docker image lên ECR

Khuyến nghị: dùng IAM Identity Center / short-term credentials. Nếu buộc dùng access key, tạo access key cho user DevOps và quản lý cẩn thận.

1. Login ECR:

- `aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.ap-southeast-1.amazonaws.com`

2. Tạo repo (nếu chưa có):

- `aws ecr create-repository --repository-name minie-backend --region ap-southeast-1`

3. Build + tag + push:

- `docker build -t minie-backend:latest .`
- `docker tag minie-backend:latest <ACCOUNT_ID>.dkr.ecr.ap-southeast-1.amazonaws.com/minie-backend:latest`
- `docker push <ACCOUNT_ID>.dkr.ecr.ap-southeast-1.amazonaws.com/minie-backend:latest`

## 5) VPC (1 VPC) + IGW + NAT + S3 Gateway Endpoint

VPC → Your VPCs → Create VPC

- Resources to create: **VPC and more**
- Name tag auto-generation: `minie-prod`
- IPv4 CIDR: `10.0.0.0/24`
- Number of AZs: 2
- Number of public subnets: 2
- Number of private subnets: 2
- NAT gateways: **1 per AZ**
- VPC endpoints: **S3 Gateway**
- DNS options: Enable DNS hostnames + Enable DNS resolution

Tags (Required): áp cho VPC/subnets/route tables/NAT/IGW/endpoint theo `Owner`, `Environment`, `CostCenter`, `Application`

Sau khi tạo xong, kiểm tra:

- Internet Gateway đã attach vào VPC
- Public route table có route `0.0.0.0/0 → igw-...`
- Private route tables có route `0.0.0.0/0 → nat-...` (mỗi AZ)
- Endpoint S3: route tables của **private** subnets đã được associate

## 6) Security Groups (1 VPC)

EC2 → Security Groups → Create

### 6.1 SG cho ALB: `sg-alb-minie-prod`

- VPC: `minie-prod`
- Inbound rules:
  - HTTP 80 from `0.0.0.0/0`
  - HTTPS 443 from `0.0.0.0/0` (nếu dùng TLS tại ALB)
- Outbound rules:
  - HTTP 3000 to `sg-ecs-minie-prod` (chỉ tới backend)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 6.2 SG cho ECS service: `sg-ecs-minie-prod`

- Inbound rules:
  - TCP 3000 from `sg-alb-minie-prod`
- Outbound rules:
  - Allow all (đơn giản) hoặc giới hạn:
    - MySQL 3306 → `sg-db-minie-prod`
    - Redis 6379 → `sg-redis-minie-prod`
    - HTTPS 443 → `0.0.0.0/0` (gọi service bên ngoài)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 6.3 SG cho DB (RDS MySQL): `sg-db-minie-prod`

- Inbound rules:
  - MySQL 3306 from `sg-ecs-minie-prod`
- Outbound: Allow all

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 6.4 SG cho Redis/Valkey: `sg-redis-minie-prod`

- Inbound rules:
  - TCP 6379 from `sg-ecs-minie-prod`
- Outbound: Allow all

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

## 7) S3 Buckets (Web + Media) + cấu hình đúng sơ đồ

### 7.1 S3 bucket Web (origin cho CloudFront)

S3 → Buckets → Create bucket

- Bucket name: `minie-web-<ACCOUNT_ID>`
- Region: `ap-southeast-1`
- ACLs disabled
- Block all public access: **ON** (khuyến nghị)
- Default encryption: SSE-S3

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Upload frontend build:

- Upload toàn bộ file trong `dist/` lên bucket.

### 7.2 S3 bucket Media

S3 → Buckets → Create bucket

- Bucket name: `media-s3-minie`
- Block all public access: ON
- Default encryption: SSE-S3
- Tạo prefix/folder: `products/` và `avatars/`

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

## 8) RDS MySQL (Multi-AZ Primary/Standby như sơ đồ)

RDS MySQL với **Multi-AZ** sẽ có 1 primary + 1 standby (HA) ở 2 AZ khác nhau.

### 8.1 DB subnet group

RDS → Subnet groups → Create DB subnet group

- Name: `db-subnet-group-minie-prod`
- Description: DB subnet group for minie prod
- VPC: `minie-prod`
- Subnets: chọn **2 private subnets** (AZ-a và AZ-b)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 8.2 Tạo RDS MySQL instance

RDS → Databases → Create database

- Database creation method: Standard create
- Engine type: **MySQL**
- Engine version: MySQL `8.0.x`
- Templates: Production (hoặc Dev/Test theo nhu cầu)
- Settings:
  - DB instance identifier: `minie-mysql-prod`
  - Master username: `admin`
  - Credentials management: “Manage master credentials in AWS Secrets Manager”
  - Secret name: `minie/prod/db` (tạo ở bước 2)
- Instance configuration:
  - DB instance class: `db.t3.micro` (demo) / `db.t4g.micro` (ARM, thường rẻ hơn) / theo ngân sách
  - Multi-AZ deployment: **Yes**
- Storage:
  - Storage type: `gp3`
  - Allocated storage: `20 GiB` (tối thiểu tùy loại)
  - Storage autoscaling: bật (khuyến nghị) với max tùy nhu cầu (ví dụ `100 GiB`)
- Connectivity:
  - VPC: `minie-prod`
  - DB subnet group: `db-subnet-group-minie-prod`
  - Public access: **No**
  - VPC security group: `sg-db-minie-prod`
  - Port: `3306`
- Additional configuration:
  - Initial database name: `miniedb`
  - Backup retention: `7 days`
  - Enable deletion protection: ON (prod)
  - Enable automated backups: ON
  - (tùy chọn) Enable Performance Insights: ON
  - (tùy chọn) Enable Enhanced Monitoring: theo nhu cầu

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Ghi lại endpoint:

- DB endpoint để ECS dùng (host + port)

## 9) ElastiCache (Redis/Valkey) như sơ đồ

### 9.1 Cache subnet group

ElastiCache → Subnet groups → Create subnet group

- Name: `redis-subnet-group-minie-prod`
- VPC: `minie-prod`
- Subnets: chọn **2 private subnets** (AZ-a và AZ-b)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 9.2 Tạo Redis/Valkey

ElastiCache → (Redis/Valkey) → Create

- Name: `redis-minie-prod`
- Engine: Redis hoặc Valkey (theo account)
- Deployment: Multi-AZ (nếu có lựa chọn) hoặc Replication group
- Node type: `cache.t3.micro` (demo) / tùy ngân sách
- Subnet group: `redis-subnet-group-minie-prod`
- Security group: `sg-redis-minie-prod`
- Port: `6379`

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Ghi lại primary endpoint để ECS cấu hình.

## 10) ALB + Target Group (đúng sơ đồ)

### 10.1 Target Group cho backend

EC2 → Target Groups → Create

- Target type: IP addresses
- Target group name: `tg-minie-backend`
- Protocol: HTTP
- Port: `3000`
- VPC: `minie-prod`
- Protocol version: HTTP1
- Health check:
  - Path: `/api`
  - Healthy threshold: 2
  - Unhealthy threshold: 2
  - Timeout: 5 seconds
  - Interval: 30 seconds
  - Success codes: 200

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 10.2 Application Load Balancer

EC2 → Load Balancers → Create → Application Load Balancer

- Load balancer name: `alb-minie-prod`
- Scheme: Internet-facing
- IP address type: IPv4
- Network mapping:
  - VPC: `minie-prod`
  - Subnets: 2 **public subnets** (AZ-a, AZ-b)
- Security groups: `sg-alb-minie-prod`
- Listener:
  - HTTP:80 → Forward to `tg-minie-backend`

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Nếu dùng HTTPS tại ALB:

- Tạo/Import ACM cert trong `ap-southeast-1`, gắn listener `HTTPS:443` và redirect 80→443.

## 11) ECS Fargate: Cluster + Task Definition + Service

### 11.1 CloudWatch Log group

CloudWatch → Logs → Log groups → Create

- Log group name: `/ecs/minie-backend-prod`
- Retention: 14 days (hoặc theo policy)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 11.2 ECS Cluster

ECS → Clusters → Create

- Cluster name: `cluster-minie-prod`
- Infrastructure: AWS Fargate

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 11.3 Task Definition

ECS → Task definitions → Create new task definition

- Family: `minie-backend-task-prod`
- Launch type: Fargate
- OS/Arch: Linux/X86_64
- CPU/Memory: 1 vCPU / 2 GB
- Task role: `ecsTaskRole-minie-prod`
- Task execution role: `ecsTaskExecutionRole-minie-prod`

Container:

- Name: `minie-backend`
- Image URI: `<ACCOUNT_ID>.dkr.ecr.ap-southeast-1.amazonaws.com/minie-backend:latest`
- Port mappings:
  - Container port: `3000`
  - Protocol: TCP
  - App protocol: HTTP
- Environment (ví dụ):
  - `NODE_ENV=production`
  - `PORT=3000`
  - `AWS_REGION=ap-southeast-1`
  - `S3_MEDIA_BUCKET=media-s3-minie`
- Secrets (khuyến nghị lấy từ Secrets Manager):
  - `DB_USERNAME` / `DB_PASSWORD` / `DB_HOST`… (map từ secret `minie/prod/db`)
- Logging:
  - Log driver: `awslogs`
  - Log group: `/ecs/minie-backend-prod`
  - Region: `ap-southeast-1`
  - Stream prefix: `ecs`

### 11.4 ECS Service

ECS → Clusters → `cluster-minie-prod` → Services → Create

- Launch type: FARGATE
- Platform version: LATEST
- Service name: `svc-minie-backend-prod`
- Desired tasks: 2
- Networking:
  - VPC: `minie-prod`
  - Subnets: **2 private subnets**
  - Security group: `sg-ecs-minie-prod`
  - Public IP: Disabled
- Load balancing:
  - Type: Application Load Balancer
  - Load balancer: `alb-minie-prod`
  - Listener: HTTP:80
  - Target group: `tg-minie-backend`
  - Container: `minie-backend:3000`
  - Health check grace period: 60 seconds

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Verify:

- ECS tasks = RUNNING (2/2)
- Target group targets = healthy

Test nhanh qua ALB:

- `curl http://<ALB_DNS_NAME>/api`

## 12) ACM + CloudFront + WAF + Route 53 (đúng sơ đồ)

Mục tiêu: user → Route 53 → CloudFront (TLS + WAF) →

- default: S3 Web bucket
- path `/api/*`: forward tới ALB

### 12.1 ACM certificate cho CloudFront

Lưu ý: certificate dùng cho CloudFront phải tạo ở **us-east-1 (N. Virginia)**.

ACM (region us-east-1) → Request certificate

- Domain names: `minie.example.com` (và `www.minie.example.com` nếu cần)
- Validation: DNS validation
- Add CNAME record theo hướng dẫn ACM (trong Route 53)

### 12.2 CloudFront Distribution

CloudFront → Create distribution

Origins:

1. Origin S3 Web

- Origin domain: chọn bucket `minie-web-<ACCOUNT_ID>`
- Origin access: **Origin access control (OAC)**
- Viewer access to S3: private

2. Origin ALB (API)

- Origin domain: chọn DNS của `alb-minie-prod-...elb.amazonaws.com`
- Protocol policy: HTTP only (nếu ALB listener HTTP) hoặc HTTPS only (nếu ALB có TLS)

Default cache behavior (frontend):

- Origin: S3 Web
- Viewer protocol policy: Redirect HTTP to HTTPS
- Allowed methods: GET, HEAD
- Cache policy: CachingOptimized

Behavior cho API:

- Path pattern: `/api/*`
- Origin: ALB
- Viewer protocol policy: Redirect HTTP to HTTPS
- Allowed methods: GET, HEAD, OPTIONS, PUT, POST, PATCH, DELETE
- Cache policy: CachingDisabled
- Origin request policy: AllViewer (hoặc include headers cần thiết)

Settings:

- Alternate domain name (CNAME): `minie.example.com`
- Custom SSL certificate: chọn cert ở bước 12.1
- Default root object: `index.html`
- Custom error responses (cho SPA, khuyến nghị):
  - 403 → Response page path `/index.html` → HTTP response code `200`
  - 404 → Response page path `/index.html` → HTTP response code `200`

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

Sau khi tạo, CloudFront sẽ cung cấp Distribution domain name (ví dụ `dxxxx.cloudfront.net`).

S3 bucket policy cho OAC: CloudFront console thường tạo giúp; nếu không, vào bucket Web → Permissions → Bucket policy để allow CloudFront access.

### 12.3 AWS WAF (attach vào CloudFront)

WAF → Web ACLs → Create web ACL

- Resource type: CloudFront distributions
- Name: `waf-minie-prod`
- Default action: Allow
- Add rules (tối thiểu):
  - AWS Managed Rules: CommonRuleSet
  - AWS Managed Rules: SQLiRuleSet
  - Rate-based rule: 1000 requests/5 minutes (tùy nhu cầu)

Attach Web ACL vào CloudFront distribution ở bước 12.2.

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 12.4 Route 53

Route 53 → Hosted zones → (chọn hosted zone domain)

- Create record
  - Record name: `minie`
  - Record type: A (Alias)
  - Route traffic to: Alias to CloudFront distribution
  - Choose distribution: distribution của `minie`

Kết quả: user truy cập `https://minie.example.com`.

## 13) CloudTrail + CloudWatch (đúng sơ đồ)

### 13.1 CloudTrail

CloudTrail → Trails → Create trail

- Trail name: `trail-minie-prod`
- Storage location: tạo S3 bucket log (ví dụ `minie-cloudtrail-<ACCOUNT_ID>`)
- Log file SSE: SSE-S3 (hoặc SSE-KMS nếu cần)

Tags (Required): `Owner`, `Environment`, `CostCenter`, `Application`

### 13.2 CloudWatch dashboard/alarms (tối thiểu)

- ECS service CPU/Memory utilization alarms
- ALB target 5xx alarms
- RDS MySQL CPU/FreeableMemory alarms

### 13.3 Enforce Tagging Compliance (khuyến nghị)

Để đảm bảo team luôn tag đúng chuẩn (không bị lệch chữ hoa/thường), cấu hình tối thiểu:

1. Billing → Cost allocation tags

- Activate 4 tag keys: `Owner`, `Environment`, `CostCenter`, `Application`

2. AWS Config (ap-southeast-1)

- Bật AWS Config
- Thêm managed rule `required-tags`
  - Required tag keys: `Owner`, `Environment`, `CostCenter`, `Application`

Thực tế vận hành: dùng AWS Config để phát hiện resource thiếu tag + notify Owner; với service hỗ trợ tag-on-create có thể bổ sung IAM guardrail để chặn tạo resource nếu thiếu tag (tham khảo [Week6/TaggingStrategy.md](Week6/TaggingStrategy.md)).

## 14) Cập nhật FE env + deploy

Nếu FE gọi API qua CloudFront:

- `VITE_API_BASE_URL=https://minie.example.com/api`

Build lại FE và upload lại `dist/` lên bucket Web.
