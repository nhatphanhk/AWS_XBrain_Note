# 10 — ⚠️ TRAPS: Top 30 Cặp Khái Niệm Dễ Nhầm Lẫn

> Mỗi cặp được trích từ câu hỏi thực chiến. Học thuộc → không mắc bẫy.

---

## 🔴 NHÓM STORAGE TRAPS

### TRAP 1: S3 Standard-IA vs S3 Standard (file < 30 ngày)
- ✅ File bị xóa sau **10–15 ngày** → **S3 Standard** (không phạt gì)
- ❌ S3 Standard-IA → phạt tính đủ 30 ngày minimum storage + phí retrieval
- **Trigger**: "deleted after 10 days", "temporary files", "short-lived data"

### TRAP 2: EFS vs FSx for Windows (SMB/NFS confusion)
- ✅ **Linux/NFS/POSIX** → **Amazon EFS**
- ✅ **Windows/SMB/Active Directory/NTFS ACLs** → **FSx for Windows File Server**
- ❌ EFS không hỗ trợ SMB protocol

### TRAP 3: DataSync vs Storage Gateway
- ✅ **Periodic migration / sync** (one-time or scheduled) → **AWS DataSync**
- ✅ **Continuous bridge with local cache** (apps use daily) → **Storage Gateway**
- ❌ DataSync is not a continuous local file share

### TRAP 4: Volume Gateway Cached vs Stored
- ✅ **Data primary in S3, local cache** → **Volume Gateway — Cached Volumes**
- ✅ **Data primary on-prem, async backup to S3** → **Volume Gateway — Stored Volumes**
- **Memory trick**: "Cached" = cloud is primary (most data in cloud); "Stored" = local is primary

### TRAP 5: S3 Object Lock Compliance vs Governance
- ✅ **Nobody deletes, not even root** → **Compliance Mode**
- ✅ **Admin with special IAM can override** → **Governance Mode**
- ❌ Governance Mode + ransomware scenario → WRONG (admin compromised = bypass)

---

## 🟠 NHÓM NETWORK/CONTENT DELIVERY TRAPS

### TRAP 6: CloudFront vs AWS Global Accelerator
- ✅ **Static Anycast IP, UDP, gaming, VoIP, bypass DNS** → **Global Accelerator**
- ✅ **HTTP caching, CDN, Edge content delivery** → **CloudFront**
- ❌ CloudFront has no static IP; Global Accelerator has no caching

### TRAP 7: CloudFront Price Classes vs Geo-Restrictions
- ✅ **Reduce cost by limiting edge locations** → **Price Classes** (100/200/All)
- ✅ **Block users from certain countries** → **Geo-Restrictions** (access control)
- ❌ Price Class does NOT block users; it only skips expensive edge locations

### TRAP 8: VPC Peering vs Transit Gateway vs PrivateLink
- ✅ **2–3 VPCs, non-overlapping CIDR** → **VPC Peering**
- ✅ **Many VPCs hub-and-spoke (10+)** → **Transit Gateway**
- ✅ **Overlapping CIDR, or expose service privately** → **PrivateLink**
- ❌ VPC Peering doesn't support overlapping CIDRs

### TRAP 9: Gateway Endpoint vs Interface Endpoint (PrivateLink)
- ✅ **S3 or DynamoDB, free** → **Gateway VPC Endpoint** (add to Route Table)
- ✅ **Any other AWS service, via ENI** → **Interface VPC Endpoint** (hourly cost)
- ❌ Gateway Endpoint only works for S3 + DynamoDB

### TRAP 10: Route 53 Geolocation vs Geoproximity
- ✅ **Route by user's country/continent** → **Geolocation**
- ✅ **Traffic engineering with bias parameter** → **Geoproximity** (Routing Bias -99→+99)
- ❌ Geolocation has no bias dial; Geoproximity considers both user AND resource location

### TRAP 11: Route 53 Alias vs CNAME
- ✅ **Zone Apex (example.com)** → **Alias Record** (Route 53 feature, free)
- ✅ **Non-apex subdomain to any hostname** → **CNAME** (standard DNS)
- ❌ CNAME cannot be used for naked/Zone Apex domain

---

## 🟡 NHÓM DATABASE TRAPS

### TRAP 12: DynamoDB Global Tables vs Aurora Global Database
- ✅ **Active-ACTIVE (all regions write + read)** → **DynamoDB Global Tables** (last-writer-wins)
- ✅ **Active-PASSIVE (1 writer region)** → **Aurora Global Database**
- ❌ Aurora Global Database is NOT active-active

### TRAP 13: DAX vs ElastiCache for DynamoDB caching
- ✅ **Microsecond DynamoDB reads, NO code change** → **DAX** (drop-in replacement endpoint)
- ❌ **ElastiCache** = requires app code changes to check cache first
- **Key**: "without changing application code" → Always DAX

### TRAP 14: RDS Multi-AZ DB Instance vs DB Cluster vs Read Replicas
- ✅ **HA only, standby NOT readable, ~60-120s failover** → **Multi-AZ DB Instance**
- ✅ **HA + readable standbys, ~35s failover** → **Multi-AZ DB Cluster** (2 readable standbys)
- ✅ **Scale read traffic, async, can be cross-region** → **Read Replicas**
- ❌ Multi-AZ DB Instance standby cannot serve reads

### TRAP 15: PITR vs On-Demand Backup (DynamoDB)
- ✅ **Recover to specific second in past 35 days** → **PITR** (continuous)
- ✅ **Restore to exact point a snapshot was taken** → **On-Demand Backup**
- ❌ On-Demand Backup cannot restore to arbitrary second

---

## 🟢 NHÓM SECURITY TRAPS

### TRAP 16: GuardDuty vs Inspector vs Macie (Security Trio)
- ✅ **Runtime threats, anomalous API, brute-force** → **GuardDuty**
- ✅ **CVE vulnerabilities, software weaknesses** → **Inspector**
- ✅ **PII/sensitive data in S3** → **Macie**
- ❌ Inspector does NOT detect runtime attacks; GuardDuty does NOT scan CVEs

### TRAP 17: AWS Config vs CloudTrail
- ✅ **Who made the API call? What changed?** → **CloudTrail** (API audit)
- ✅ **What is the current config? Is resource compliant?** → **AWS Config** (resource state)
- ❌ CloudTrail does not auto-remediate violations; Config can

### TRAP 18: Secrets Manager vs SSM Parameter Store
- ✅ **Auto-rotate password, RDS integration** → **Secrets Manager** (\$0.40/secret/month)
- ✅ **Static config, no rotation, free tier** → **SSM Parameter Store Standard** (free)
- ❌ Parameter Store does NOT support automatic rotation

### TRAP 19: SCP vs IAM Permission Boundaries
- ✅ **Org-wide guardrail, blocks all accounts** → **SCP** (cấp Account/OU/Root)
- ✅ **Limit specific IAM user/role max permissions** → **Permission Boundary** (cấp User/Role)
- ❌ SCPs don't apply to Service-Linked Roles or Management Account

### TRAP 20: Backup Vault Lock Governance vs Compliance
- ✅ **Truly immutable, nobody deletes (ransomware protection)** → **Compliance Mode**
- ❌ **Governance Mode** → Admin with `backup:DeleteBackupVaultLockConfiguration` can remove

---

## 🔵 NHÓM MESSAGING TRAPS

### TRAP 21: SQS FIFO vs Standard
- ✅ **Strict order + exactly-once** → **FIFO** (but max 3,000 msg/s with batching)
- ✅ **Unlimited throughput, order doesn't matter** → **Standard**
- ❌ FIFO has throughput cap; Standard has no guaranteed order

### TRAP 22: Kinesis Data Streams vs Kinesis Firehose
- ✅ **Replay, retention, custom consumer code** → **Data Streams**
- ✅ **Auto-deliver to S3/Redshift/OpenSearch, serverless** → **Firehose**
- ❌ Firehose cannot replay; Streams cannot auto-deliver without consumer code

### TRAP 23: EventBridge vs AppFlow
- ✅ **Route events, trigger actions in real-time** → **EventBridge**
- ✅ **Bulk/incremental SaaS data transfer to S3/Redshift** → **AppFlow**
- ❌ EventBridge is event routing (JSON events), not bulk data ETL

### TRAP 24: Amazon MQ vs SQS/SNS
- ✅ **Migrate ActiveMQ/RabbitMQ, keep JMS/AMQP** → **Amazon MQ**
- ✅ **New microservices, cloud-native messaging** → **SQS/SNS** (simpler, unlimited scale)
- ❌ SQS requires rewriting app code from JMS to SQS SDK

---

## 🟣 NHÓM COMPUTE TRAPS

### TRAP 25: Lambda vs EC2 for event-driven tasks
- ✅ **< 15 min, event-driven, pay per execution** → **Lambda**
- ✅ **> 15 min, long-running batch** → **EC2 Spot** or **AWS Batch**
- ❌ Lambda cannot run longer than 15 minutes

### TRAP 26: EFA vs ENA (HPC networking)
- ✅ **MPI/NCCL parallel computing, OS-bypass** → **EFA** (Elastic Fabric Adapter)
- ❌ **ENA** = standard 100 Gbps network; no OS-bypass; cannot run MPI directly

### TRAP 27: Pilot Light vs Warm Standby (DR)
- ✅ **DB running, EC2 = ZERO (only AMI/IaC)** → **Pilot Light**
- ✅ **DB running, EC2 scaled-down fleet running** → **Warm Standby**
- ❌ Common mistake: thinking Pilot Light has running EC2

### TRAP 28: AWS MGN vs AWS DMS for migration
- ✅ **Migrate servers (Lift-and-Shift)** → **AWS MGN** (Application Migration Service)
- ✅ **Migrate database data** → **AWS DMS**
- ❌ DMS is for databases only; MGN is for entire servers

---

## ⚫ NHÓM ANALYTICS TRAPS

### TRAP 29: Textract vs Comprehend
- ✅ **OCR: extract structure from PDF/images (tables, forms)** → **Amazon Textract**
- ✅ **NLP: analyze meaning in text (sentiment, entities)** → **Amazon Comprehend**
- ❌ Comprehend cannot read PDFs/images; Textract cannot do NLP sentiment

### TRAP 30: AWS Config vs Security Hub vs Trusted Advisor
- ✅ **Continuous resource config compliance + remediation** → **AWS Config**
- ✅ **Aggregate security findings + CIS benchmark score** → **Security Hub**
- ✅ **5-pillar best practice checks (need Business tier)** → **Trusted Advisor**
- ❌ Config does NOT calculate CIS scores; Security Hub does

---

## 📌 MASTER CHECKLIST — Before Clicking Submit

```
✅ Does the question say "without changing app code"?  → Check if DAX / EFS / FSx
✅ Does the question mention overlapping CIDR?         → PrivateLink (not Peering/TGW)
✅ Is the data < 30 days lifespan?                     → S3 Standard (never Standard-IA)
✅ Is it active-active multi-region writes?            → DynamoDB Global Tables (not Aurora)
✅ Does it need strict ordering + exactly-once?        → SQS FIFO (not Standard)
✅ Is it about EC2 at Pilot Light DR?                  → EC2 = ZERO (not scaled-down)
✅ Is the scenario "detect brute-force/mining"?        → GuardDuty (not Inspector/Macie)
✅ Is it "scan CVE vulnerabilities"?                   → Inspector (not GuardDuty)
✅ Does it say "nobody deletes even root" for backup?  → Backup Vault Lock Compliance Mode
✅ Does it need static Anycast IP or UDP?              → Global Accelerator (not CloudFront)
```

