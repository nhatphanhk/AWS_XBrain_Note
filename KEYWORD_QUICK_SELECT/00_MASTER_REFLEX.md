# ⚡ 00 — MASTER REFLEX TABLE: Từ Khóa → Đáp Án Chuẩn (< 60 Giây)

> Ctrl+F từ khóa trong đề → Đọc cột "✅ Chọn" → Tránh cột "❌ Bẫy"

---

## 🔴 NHÓM 1: COMPUTE & SERVERLESS

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"without opening SSH port 22"** / "no Bastion Host" | **SSM Session Manager** | ~~Bastion Host~~ ~~mở port 22~~ |
| **"HPC / MPI / NCCL inter-node latency"** | **EFA** (Elastic Fabric Adapter) + Cluster Placement | ~~ENA~~ (không có OS-bypass MPI) |
| **"Cluster Placement Group — Insufficient capacity error"** | **Stop ALL → Start ALL cùng lúc** | ~~Terminate~~ ~~thêm instance mới~~ |
| **"lowest network latency between instances"** | **Cluster Placement Group** | ~~Spread~~ ~~Partition~~ |
| **"critical instances, max fault tolerance, different racks"** | **Spread Placement Group** (≤ 7/AZ) | ~~Cluster~~ |
| **"HDFS / Kafka / Cassandra topology-aware"** | **Partition Placement Group** | ~~Cluster~~ ~~Spread~~ |
| **"event-driven, < 15 min, pay per execution"** | **AWS Lambda** | ~~EC2 On-Demand~~ |
| **"container, no manage server/OS"** | **ECS Fargate** | ~~EC2 + Docker tự cài~~ |
| **"short task, batch, fault-tolerant, cheapest"** | **EC2 Spot Instances** | ~~On-Demand~~ |
| **"license per socket/core (SQL Server, Oracle BYOL)"** | **Dedicated Hosts** | ~~Dedicated Instances~~ |
| **"capacity reservation for peak event (Black Friday)"** | **On-Demand Capacity Reservations** | ~~Savings Plans~~ (không reserve capacity) |
| **"App needs warm RAM state, restart in seconds"** | **EC2 Hibernate** | ~~Stop/Start thường~~ |
| **"schedule start/stop Dev/Test EC2 fleet"** | **AWS Instance Scheduler** (Lambda + EventBridge) | ~~thủ công~~ |
| **"HPC batch jobs, unlimited runtime"** | **AWS Batch** | ~~Lambda~~ (Lambda max 15 phút) |
| **"Lift-and-Shift server migration, minimal downtime"** | **AWS MGN** (Application Migration Service) | ~~DMS~~ ~~SMS~~ |

---

## 🔵 NHÓM 2: STORAGE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"without changing app code" + NFS/POSIX/Linux** | **Amazon EFS** | ~~S3 API~~ ~~DynamoDB~~ |
| **"without changing app code" + SMB/Windows/AD** | **FSx for Windows File Server** | ~~EFS~~ (EFS không hỗ trợ SMB) |
| **"HPC, ML training, POSIX parallel FS, S3-linked"** | **FSx for Lustre** | ~~EFS~~ ~~EBS~~ |
| **"on-premise NFS/SMB → S3/EFS sync, periodic"** | **AWS DataSync** | ~~Storage Gateway~~ ~~rsync~~ |
| **"on-premise apps need local cache + cloud backup"** | **Storage Gateway** (File/Volume/Tape) | ~~DataSync~~ |
| **"decommission tape libraries / VTL backup"** | **Storage Gateway — Tape Gateway (VTL)** | ~~S3 File Gateway~~ |
| **"on-prem volume: data mostly on-prem, async snapshot"** | **Volume Gateway — Stored Volumes** | ~~Cached Volumes~~ |
| **"on-prem volume: data mostly on S3, local cache"** | **Volume Gateway — Cached Volumes** | ~~Stored Volumes~~ |
| **"external partners upload via SFTP to S3"** | **AWS Transfer Family** | ~~DataSync~~ (không có SFTP endpoint) |
| **"50–100 TB migrate, slow internet (< 100 Mbps)"** | **Snowball Edge Storage Optimized (80 TB)** | ~~DataSync~~ ~~VPN~~ |
| **"PB-scale data center migration"** | **AWS Snowmobile** | ~~Snowball~~ |
| **"single-digit ms S3 latency, ML/AI training, 1 AZ"** | **S3 Express One Zone (Directory Bucket)** | ~~S3 Standard~~ |
| **"mount S3 as Linux file system, high read throughput"** | **Mountpoint for Amazon S3** | ~~FSx for Lustre~~ (nếu không cần POSIX lock) |
| **"millions IOPS, microsecond, ephemeral, temp storage"** | **EC2 Instance Store** | ~~EBS~~ |
| **"high IOPS, persistent, attach to 1 EC2"** | **EBS io2 Block Express** (256K IOPS) | ~~Instance Store~~ |
| **"shared block storage, same AZ, 16 EC2 instances"** | **EBS io2 Multi-Attach** | ~~EFS~~ (EFS là file, không phải block) |
| **"automate EBS snapshot lifecycle / compliance"** | **Amazon Data Lifecycle Manager (DLM)** | ~~Lambda cron script~~ |
| **"file < 30 ngày, cheapest S3"** | **S3 Standard** (không phạt) | ~~S3 Standard-IA~~ (phạt 30 ngày) |
| **"unpredictable access pattern, auto-tier S3"** | **S3 Intelligent-Tiering** | ~~Standard-IA~~ (phí retrieval khi biết pattern) |
| **"rarely access, millisecond retrieval, 1/quarter"** | **S3 Glacier Instant Retrieval** | ~~Glacier Flexible~~ (phải chờ giờ) |
| **"compliance 7-10 years, cheapest, wait 12-48h OK"** | **S3 Glacier Deep Archive** | ~~Glacier Flexible~~ |
| **"WORM object, nobody deletes even root"** | **S3 Object Lock — Compliance Mode** | ~~Governance Mode~~ (IAM bypass được) |
| **"protect backups from ransomware / root"** | **AWS Backup Vault Lock — Compliance Mode** | ~~Governance Mode~~ |

---

## 🟢 NHÓM 3: DATABASE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"microsecond DynamoDB reads, NO code change"** | **DynamoDB DAX** | ~~ElastiCache~~ (phải sửa code) |
| **"multi-region active-active read AND write"** | **DynamoDB Global Tables** (last-writer-wins) | ~~Aurora Global~~ (1 writer region) |
| **"recover DynamoDB to specific second"** | **DynamoDB PITR** | ~~On-Demand Backup~~ (chỉ restore về điểm chụp) |
| **"DynamoDB — ordered per user, dedup"** | **SQS FIFO + MessageGroupId per user** | ~~DynamoDB Streams~~ |
| **"zero downtime RDS storage growth"** | **RDS Storage Auto Scaling** | ~~manual resize~~ (downtime) |
| **"rotate DB password automatically, no app restart"** | **Secrets Manager + Lambda Rotation** | ~~SSM Parameter Store~~ (không tự rotate) |
| **"RDS HA, standby readable, fast failover ~35s"** | **RDS Multi-AZ DB Cluster** (2 readable standbys) | ~~Multi-AZ DB Instance~~ (standby không đọc được) |
| **"scale read traffic, async replicas"** | **RDS Read Replicas** | ~~Multi-AZ~~ (Multi-AZ không scale đọc) |
| **"Oracle / SQL Server → Aurora migration"** | **AWS SCT** (schema) + **AWS DMS** (data) | ~~DMS only~~ (không convert PL/SQL) |
| **"MongoDB compatible, flexible JSON schema"** | **Amazon DocumentDB** | ~~DynamoDB~~ |
| **"Cassandra migration, no cluster management, CQL"** | **Amazon Keyspaces** | ~~DynamoDB~~ ~~EC2 Cassandra~~ |
| **"immutable cryptographic ledger, accounting"** | **Amazon QLDB** | ~~Managed Blockchain~~ (QLDB là centralized) |
| **"social network / fraud detection / graph queries"** | **Amazon Neptune** (Gremlin / openCypher) | ~~DynamoDB~~ (không dùng cho deep graph) |
| **"IoT time-series, sensor telemetry billions/sec"** | **Amazon Timestream** | ~~RDS~~ ~~DynamoDB~~ |
| **"ElastiCache session store, pub/sub, complex DS"** | **Redis** (ElastiCache for Redis/Valkey) | ~~Memcached~~ (không có pub/sub, không persistent) |
| **"ElastiCache simple caching, multi-thread scale-out"** | **Memcached** | ~~Redis~~ (Redis single-thread) |

---

## 🟡 NHÓM 4: NETWORK & CDN

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"static Anycast IP, bypass DNS cache, TCP/UDP"** | **AWS Global Accelerator** | ~~CloudFront~~ (không có static IP) |
| **"CDN cache static/dynamic content HTTP/HTTPS"** | **Amazon CloudFront** | ~~Global Accelerator~~ |
| **"overlapping CIDR VPCs need to connect"** | **AWS PrivateLink** (Interface VPC Endpoint + NLB) | ~~VPC Peering~~ ~~Transit Gateway~~ |
| **"connect 100s VPCs centrally (hub-and-spoke)"** | **Transit Gateway** | ~~VPC Peering~~ (N² connections) |
| **"third-party firewall (Palo Alto, Fortinet) inline"** | **Gateway Load Balancer (GWLB)** + GENEVE | ~~ALB~~ ~~NLB~~ |
| **"real-time 2-way push (chat, dashboard)"** | **API Gateway WebSocket API** | ~~REST API~~ (1-way request-response) |
| **"route by user geography (continent/country)"** | **Route 53 Geolocation** | ~~Geoproximity~~ |
| **"shift traffic % from resource with bias dial"** | **Route 53 Geoproximity** (Routing Bias -99→+99) | ~~Geolocation~~ (no bias parameter) |
| **"Zone Apex (example.com) → AWS resource"** | **Route 53 Alias Record** | ~~CNAME~~ (CNAME không dùng apex) |
| **"hybrid DNS on-prem ↔ VPC bidirectional"** | **Route 53 Resolver Inbound + Outbound Endpoints** | ~~chỉ dùng 1 endpoint~~ |
| **"private connection S3/DynamoDB, no NAT, free"** | **Gateway VPC Endpoint** | ~~Interface Endpoint~~ (có phí) |
| **"private connection to any AWS service via ENI"** | **Interface VPC Endpoint (PrivateLink)** | ~~Gateway Endpoint~~ (chỉ S3+DynamoDB) |
| **"copy raw network packets, IDS, deep packet inspection"** | **VPC Traffic Mirroring** | ~~VPC Flow Logs~~ (chỉ metadata) |
| **"WAF, block SQLi/XSS, rate limit"** | **AWS WAF** (Layer 7) trên CF/ALB/APIGW | ~~Security Group~~ ~~NACL~~ |
| **"DDoS protection, L3/L4 all customers"** | **AWS Shield Standard** (free) | ~~Shield Advanced~~ (nếu chỉ cần basic) |
| **"DDoS response team 24/7, cost protection"** | **AWS Shield Advanced** | ~~Shield Standard~~ |
| **"VPC-level stateful firewall, FQDN filter, Suricata IPS"** | **AWS Network Firewall** | ~~NACL~~ ~~Security Group~~ |
| **"centralize WAF/Shield policy across all accounts"** | **AWS Firewall Manager** | ~~WAF alone~~ |
| **"health check + failover to static S3 page"** | **Route 53 Failover Routing** | ~~ALB health check~~ |
| **"on-premises dedicated private line to AWS"** | **AWS Direct Connect** | ~~Site-to-Site VPN~~ (nếu cần low jitter) |

---

## 🟠 NHÓM 5: SECURITY & IDENTITY

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"detect brute-force, compromised credentials, mining"** | **Amazon GuardDuty** (ML on logs) | ~~Inspector~~ ~~Macie~~ |
| **"scan CVE vulnerabilities EC2/Lambda/ECR"** | **Amazon Inspector** | ~~GuardDuty~~ ~~Macie~~ |
| **"discover PII / sensitive data in S3"** | **Amazon Macie** | ~~GuardDuty~~ ~~Inspector~~ |
| **"investigate root cause after security alert (graph)"** | **Amazon Detective** | ~~GuardDuty~~ (GuardDuty phát hiện, không điều tra) |
| **"centralized security posture, CIS benchmark score"** | **AWS Security Hub** | ~~AWS Config alone~~ (Config không tính CIS score) |
| **"download SOC/ISO/PCI compliance reports, sign BAA"** | **AWS Artifact** | ~~Audit Manager~~ ~~AWS Config~~ |
| **"block org-wide, override all admins/root members"** | **SCP (Service Control Policies)** | ~~Permission Boundaries~~ (cấp User/Role) |
| **"limit max permissions for a specific IAM role/user"** | **IAM Permission Boundaries** | ~~SCP~~ (SCP cấp Account) |
| **"cross-account assume role"** | **IAM Role with Trust Policy** (sts:AssumeRole) | ~~IAM User access keys~~ |
| **"login to RDS MySQL without static password, SSL"** | **IAM Database Authentication** (STS token 15m) | ~~Secrets Manager~~ (nếu câu hỏi nhấn "no password") |
| **"store secrets, auto-rotate, RDS integration"** | **AWS Secrets Manager** | ~~SSM Parameter Store~~ (không tự rotate) |
| **"store config/non-secret params, free tier"** | **SSM Parameter Store Standard** | ~~Secrets Manager~~ (tốn tiền) |
| **"encrypt data with customer-managed key, audit usage"** | **AWS KMS CMK** | ~~AWS Managed Key~~ (không tùy chỉnh policy) |
| **"envelope encryption large data"** | **KMS GenerateDataKey** + encrypt locally | ~~KMS Encrypt directly~~ (max 4 KB) |
| **"continuous compliance check, auto-remediation"** | **AWS Config** + SSM Automation Remediation | ~~CloudTrail~~ (CloudTrail chỉ log, không remediate) |
| **"audit API calls, who did what when"** | **AWS CloudTrail** | ~~CloudWatch~~ (CloudWatch là metrics/logs, không audit API) |
| **"User auth (login), token for app"** | **Cognito User Pools** | ~~Identity Pools~~ |
| **"federated access to AWS resources (Google/FB/SAML)"** | **Cognito Identity Pools** | ~~User Pools~~ |

---

## 🔵 NHÓM 6: MESSAGING & DECOUPLING

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"decouple tiers, at-least-once, unlimited throughput"** | **SQS Standard** | ~~SQS FIFO~~ (capped throughput) |
| **"strict order + exactly-once processing"** | **SQS FIFO** (MessageGroupId + DeduplicationId) | ~~SQS Standard~~ (best-effort order) |
| **"poison pill stuck in Kinesis/DynamoDB Streams"** | **BisectBatchOnFunctionError = true** | ~~increase batch size~~ ~~timeout~~ |
| **"fan-out: 1 message → multiple SQS queues"** | **SNS → multiple SQS** (SNS Fanout) | ~~SQS alone~~ |
| **"schedule events, trigger Lambda at specific time"** | **EventBridge Scheduler** / EventBridge Rule cron | ~~SQS~~ ~~SNS~~ |
| **"real-time event from SaaS (Salesforce, Zendesk)"** | **Amazon EventBridge** (SaaS partner event bus) | ~~SNS~~ |
| **"bulk/incremental SaaS data transfer to S3/Redshift"** | **Amazon AppFlow** (no-code, PrivateLink) | ~~EventBridge~~ (EventBridge là event routing, không bulk data) |
| **"migrate ActiveMQ/RabbitMQ, keep JMS/AMQP"** | **Amazon MQ** | ~~SQS~~ (SQS phải đổi code) |
| **"real-time stream ingestion, replay, 24h–365d retention"** | **Kinesis Data Streams** | ~~Kinesis Firehose~~ (Firehose không replay) |
| **"auto-deliver stream to S3/Redshift/OpenSearch, serverless"** | **Kinesis Data Firehose** | ~~Kinesis Data Streams~~ (cần viết consumer) |
| **"long-running workflow, human approval step"** | **Step Functions Standard Workflow** | ~~Step Functions Express~~ (Express = high freq, short) |
| **"high-frequency short workflow, at-least-once OK"** | **Step Functions Express Workflow** | ~~Standard~~ |
| **"Lambda dead-letter queue for failed async invocations"** | **DLQ (SQS/SNS)** on Lambda async config | ~~DLQ on SQS source~~ |

---

## 🟣 NHÓM 7: ANALYTICS & AI

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"serverless SQL query on S3"** | **Amazon Athena** (\$5/TB scanned, Parquet/ORC giảm 70%) | ~~Redshift~~ (Redshift cần cluster) |
| **"visual no-code data prep for business analysts"** | **AWS Glue DataBrew** | ~~Glue ETL Jobs~~ (cần viết PySpark) |
| **"centralized data catalog, fine-grained column/row access"** | **AWS Lake Formation** + Glue Data Catalog | ~~Athena alone~~ |
| **"managed Hadoop/Spark, cheap spot task nodes"** | **Amazon EMR** | ~~Glue~~ (Glue là serverless, không tùy chỉnh cluster) |
| **"data warehouse, OLAP queries petabyte-scale"** | **Amazon Redshift** (Redshift Serverless nếu intermittent) | ~~RDS~~ (RDS là OLTP) |
| **"query S3 Data Lake from Redshift"** | **Redshift Spectrum** | ~~Athena~~ (nếu đã có Redshift cluster) |
| **"extract text/tables/forms from scanned PDF (OCR)"** | **Amazon Textract** | ~~Comprehend~~ (Comprehend là NLP, không OCR) |
| **"NLP: sentiment, entity, language detection"** | **Amazon Comprehend** | ~~Textract~~ |
| **"real-time personalized recommendations"** | **Amazon Personalize** | ~~SageMaker~~ (nếu câu hỏi không yêu cầu custom ML) |
| **"speech-to-text transcription"** | **Amazon Transcribe** | ~~Comprehend~~ |
| **"text-to-speech"** | **Amazon Polly** | ~~Transcribe~~ |
| **"image/video recognition, label detection"** | **Amazon Rekognition** | ~~Textract~~ |
| **"translate text"** | **Amazon Translate** | ~~Comprehend~~ |
| **"full-text search, log analytics, Kibana dashboard"** | **Amazon OpenSearch Service** | ~~Athena~~ ~~Redshift~~ |
| **"time-series IoT sensor events, auto-tiering storage"** | **Amazon Timestream** | ~~RDS~~ ~~DynamoDB~~ |

---

## ⚫ NHÓM 8: MIGRATION & DISASTER RECOVERY

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"heterogeneous DB migration (Oracle → Aurora)"** | **AWS SCT** (schema convert) + **AWS DMS** (data) | ~~DMS only~~ |
| **"homogeneous DB migration (MySQL → RDS MySQL)"** | **AWS DMS** (data only, no SCT needed) | ~~SCT~~ |
| **"CDC zero-downtime cutover"** | **AWS DMS** (Change Data Capture mode) | ~~dump/restore~~ |
| **"discover on-prem server dependencies (network map)"** | **AWS Application Discovery Service — Agent-based** | ~~Agentless~~ (Agentless không map network deps) |
| **"track migration progress across tools centrally"** | **AWS Migration Hub** | ~~DMS~~ ~~MGN~~ |
| **"Lift-and-Shift: physical/VMware → EC2"** | **AWS Application Migration Service (MGN)** | ~~DMS~~ ~~SMS~~ |
| **"lowest RPO/RTO for DR, seconds/minutes"** | **AWS Elastic Disaster Recovery (DRS)** | ~~Pilot Light~~ |
| **"DR: cheapest, RPO hours, RTO 24h+"** | **Backup & Restore** | ~~Pilot Light~~ (Pilot Light có DB running = $$) |
| **"DR: DB always running, EC2 = 0, scale up on failover"** | **Pilot Light** | ~~Warm Standby~~ (Warm Standby có EC2 running) |
| **"DR: scaled-down fleet always running"** | **Warm Standby** | ~~Pilot Light~~ (Pilot Light = 0 EC2) |
| **"DR: active-active, RPO≈0, RTO≈0, most expensive"** | **Multi-Region Multi-Active** | ~~Warm Standby~~ |
| **"centralized backup policy, cross-account, WORM"** | **AWS Backup** (Backup Vault Lock Compliance Mode) | ~~individual service snapshots~~ |

---

## 💰 NHÓM 9: COST OPTIMIZATION

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"most flexible commitment, covers EC2+Fargate+Lambda"** | **Compute Savings Plans** | ~~EC2 Instance Savings Plans~~ (1 family) |
| **"right-sizing recommendation, ML-based"** | **AWS Compute Optimizer** | ~~Cost Explorer~~ (Cost Explorer = cost analysis) |
| **"historical cost analysis + 12-month forecast"** | **AWS Cost Explorer** | ~~Budgets~~ (Budgets = alerts/actions) |
| **"alert when spend > threshold, auto-stop EC2"** | **AWS Budgets** + Budget Actions | ~~Cost Explorer~~ |
| **"stop EC2 when budget exceeded automatically"** | **AWS Budgets Actions** (IAM Policy / stop EC2) | ~~Lambda script~~ |
| **"reduce cost: EC2 runs only during business hours"** | **AWS Instance Scheduler** | ~~Reserved Instances~~ |
| **"capacity reservation included in purchase"** | **Zonal Reserved Instances** | ~~Compute Savings Plans~~ (SP có no capacity reservation) |
| **"S3 file < 30 days, lowest cost"** | **S3 Standard** | ~~S3 Standard-IA~~ (30-day minimum penalty) |
| **"CloudFront: users in US+EU only, reduce cost"** | **CloudFront Price Class 100** | ~~Price Class All~~ |
| **"restrict CloudFront access by country"** | **CloudFront Geo-Restrictions** | ~~Price Class~~ (Price Class = cost, not access control) |

---

## 🏗️ NHÓM 10: OPERATIONS & DEPLOYMENT

| Từ Khóa Trong Đề Thi | ✅ CHỌN | ❌ KHÔNG CHỌN (Bẫy) |
|:---|:---|:---|
| **"IaC: deploy same stack across multiple accounts/regions"** | **CloudFormation StackSets** | ~~Nested Stacks~~ (Nested = 1 account) |
| **"detect config drift from CloudFormation template"** | **CloudFormation Drift Detection** | ~~AWS Config~~ (Config monitors resources, not CF template drift) |
| **"PaaS deploy web app, zero-downtime, can SSH to EC2"** | **AWS Elastic Beanstalk** | ~~ECS~~ ~~Lambda~~ |
| **"EB zero-downtime, full capacity maintained during update"** | **Rolling with Additional Batch** | ~~Rolling~~ (Rolling temporarily reduces capacity) |
| **"EB fastest rollback"** | **Immutable** deployment | ~~All-at-once~~ ~~Rolling~~ |
| **"SSL cert expiry alert 30 days before"** | **ACM + EventBridge Rule + Lambda + SNS** | ~~ACM alone~~ (ACM has no built-in SNS alert) |
| **"GraphQL API, real-time subscriptions, offline sync"** | **AWS AppSync** | ~~API Gateway REST~~ |
| **"full-stack hosting, Git CI/CD, React/Next.js"** | **AWS Amplify** | ~~S3 static hosting~~ (Amplify adds CI/CD) |
| **"send bulk/transactional email, DKIM/SPF"** | **Amazon SES** | ~~SNS~~ (SNS không có email deliverability controls) |
| **"multi-channel (Email+SMS+Push) user campaigns"** | **Amazon Pinpoint** | ~~SES~~ (SES = only email) |
| **"5 pillars check, full access requires Business plan"** | **AWS Trusted Advisor** | ~~Security Hub~~ |

