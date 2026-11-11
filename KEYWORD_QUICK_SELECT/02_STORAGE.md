# 02 — STORAGE KEYWORDS: S3, EBS, EFS, FSx, Storage Gateway

---

## 🪣 S3 STORAGE CLASS — CHỌN NHANH

```
Truy cập thường xuyên, file mới    → S3 Standard          (0$ retrieval, 0 days min)
Không rõ pattern truy cập           → S3 Intelligent-Tiering (0$ retrieval, auto-tier)
Ít truy cập, cần lấy ngay ms        → S3 Standard-IA       (30-day min, có phí retrieval)
Ít truy cập, chấp nhận mất nếu AZ hỏng → S3 One Zone-IA   (30-day min, 1 AZ)
1 lần/quý, cần lấy ngay ms          → S3 Glacier Instant Retrieval (90-day min)
Lưu trữ dài hạn, chờ 3–5h OK       → S3 Glacier Flexible Retrieval (90-day min)
Luật pháp 7-10 năm, chờ 12-48h OK  → S3 Glacier Deep Archive (180-day min, rẻ nhất)
```

> ⚠️ **BẪY CỰC PHỔ BIẾN**: File bị xóa sau **10–15 ngày** → chọn **S3 Standard** (không phạt)  
> KHÔNG chọn Standard-IA → phạt tính đủ 30 ngày + phí xóa sớm!

---

## 🔐 S3 WORM & OBJECT LOCK

| Mode | Ai Có Thể Xóa? | Khi Nào Dùng |
|:---|:---|:---|
| **Object Lock — Governance** | Người có `s3:BypassGovernanceRetention` hoặc Root | Flexible WORM, admin trust |
| **Object Lock — Compliance** | **Không ai** (kể cả Root, AWS) | SEC 17a-4, HIPAA, ransomware |
| **Legal Hold** | Có thể gỡ bằng flag OFF bất kỳ lúc nào | Giữ vô thời hạn trong quá trình điều tra |
| **Glacier Vault Lock** | Không ai sau khi lock (24h confirm window) | Glacier-specific compliance |
| **Backup Vault Lock — Compliance** | Không ai sau cooling-off 1–72h | Bảo vệ toàn bộ backup vault |

---

## ☁️ S3 SPECIAL FEATURES

| Keyword | Answer | Note |
|:---|:---|:---|
| "upload large file > 5 GB to S3" | **S3 Multipart Upload** | Bắt buộc > 5 GB; khuyến nghị > 100 MB |
| "speed up upload from offices worldwide" | **S3 Transfer Acceleration** (Edge Locations) | Dùng AWS global backbone |
| "single-digit ms latency, ML training, 1 AZ" | **S3 Express One Zone (Directory Bucket)** | 10x faster, 50% cheaper requests |
| "mount S3 as Linux file system, sequential read" | **Mountpoint for Amazon S3** | Không có POSIX locking → dùng FSx for Lustre |
| "query CSV/JSON/Parquet in S3 without ETL" | **S3 Select** (or Athena) | S3 Select = object-level, Athena = cross-files |
| "cost optimization: users only in US+EU" | **CloudFront Price Class 100** | PriceClass_100 = US, EU, Canada |
| "block users by country (content restriction)" | **CloudFront Geo-Restrictions** | Whitelist or Blacklist |
| "secure S3 origin from CloudFront" | **Origin Access Control (OAC)** | Không dùng OAI (deprecated) |
| "versioning but save space" | **S3 Lifecycle Rule** (expire non-current versions) | Auto-delete old versions |
| "cross-region replication for compliance" | **S3 CRR** (Cross-Region Replication) | Requires Versioning ON |
| "same-region replication for resilience" | **S3 SRR** (Same-Region Replication) | Log aggregation, dev copy |
| "SFTP endpoint for external partners → S3" | **AWS Transfer Family** | No FTP server management |
| "notify on new object events" | **S3 Event Notifications** → SNS/SQS/Lambda | EventBridge for more filter |

---

## 💾 EBS — Elastic Block Store

| Keyword | Volume Type | IOPS / Throughput |
|:---|:---|:---|
| "general purpose, balance cost/performance" | **gp3** | 3,000 IOPS base free; up to 16,000 IOPS |
| "max IOPS, database, mission critical" | **io2 Block Express** | Up to 256,000 IOPS; 99.999% durability |
| "share volume to 16 EC2 same AZ" | **io2 Multi-Attach** | Only io1/io2; cluster-aware FS needed |
| "throughput-intensive, big data, Kafka" | **st1 (Throughput HDD)** | Up to 500 MB/s; NOT for boot volume |
| "cold data, infrequent access, cheapest" | **sc1 (Cold HDD)** | Up to 250 MB/s; NOT for boot volume |
| "millions IOPS, microsecond, ephemeral" | **Instance Store (NVMe)** | Lost on stop/terminate |
| "automate snapshot schedule" | **Data Lifecycle Manager (DLM)** | No custom Lambda needed |
| "quick restore from snapshot (no init latency)" | **Fast Snapshot Restore (FSR)** | Extra cost; per-AZ |
| "move EBS to different AZ" | **Snapshot → Create Volume in target AZ** | Direct move not possible |

---

## 📁 EFS — Elastic File System (NFS/POSIX)

| Keyword | Answer | Detail |
|:---|:---|:---|
| "shared file system, Linux, multi-AZ, POSIX" | **Amazon EFS** | NFS v4.1; Multi-AZ by default |
| "EFS for serverless containers, isolated dir per app" | **EFS Access Points** (POSIX UID/GID) | Isolate root path per app |
| "EFS: rarely accessed files, reduce cost" | **EFS Infrequent Access (IA) + Lifecycle Policy** | Auto-tier to IA after N days |
| "SMB / Windows / Active Directory" | **FSx for Windows File Server** (NOT EFS) | EFS = Linux/NFS only |

---

## 🏢 FSx VARIANTS

| FSx Variant | Use When | Protocol |
|:---|:---|:---|
| **FSx for Windows File Server** | SMB, Windows AD, NTFS ACLs, DFS Namespaces | SMB |
| **FSx for Lustre** | HPC, ML, parallel POSIX FS, linked to S3 | POSIX (Lustre) |
| **FSx for NetApp ONTAP** | Multi-protocol (NFS+SMB+iSCSI), SnapMirror, FabricPool | NFS/SMB/iSCSI |
| **FSx for OpenZFS** | Linux/POSIX workloads, ZFS features | NFS |

> ⚠️ **FSx for Lustre vs EFS**: FSx for Lustre = HPC parallel, linked to S3. EFS = general-purpose shared Linux FS.

---

## 🏗️ STORAGE GATEWAY VARIANTS

| Variant | On-Prem Protocol | Stores Data In | Use Case |
|:---|:---|:---|:---|
| **S3 File Gateway** | NFS / SMB | Amazon S3 | File share → cloud; on-prem apps access S3 |
| **FSx File Gateway** | SMB | Amazon FSx for Windows | Low-latency local cache for FSx |
| **Volume Gateway — Cached** | iSCSI | S3 (primary) + local cache | Tiered: main data in cloud |
| **Volume Gateway — Stored** | iSCSI | On-premises (primary) + S3 async snapshot | Full data local, backup to cloud |
| **Tape Gateway (VTL)** | iSCSI VTL | S3 / Glacier | Replace physical tape library; works with Veeam/Backup Exec |

---

## 🚚 DATA TRANSFER SERVICES

| Keyword | Service | Key Differentiator |
|:---|:---|:---|
| "periodic NFS/SMB → S3/EFS sync, online" | **AWS DataSync** | 10x faster than rsync; TLS; checksum |
| "SFTP/FTPS/FTP endpoint for external partners" | **AWS Transfer Family** | Managed SFTP server → S3/EFS |
| "50 TB migrate, slow internet" | **Snowball Edge (80 TB)** | Physical device; ship to AWS |
| "PB-level data center migration" | **AWS Snowmobile** | 100 PB truck |
| "edge computing + data transfer" | **Snowball Edge Compute Optimized** | EC2 + Lambda on device |
| "continuous on-prem → cloud file sync" | **Storage Gateway** | Local cache; not bulk migration |

> ⚠️ **DataSync vs Storage Gateway**:  
> - DataSync = **periodic sync / migration** (one-time or scheduled batch)  
> - Storage Gateway = **continuous bridge** (local cache, apps use it daily)

