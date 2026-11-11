# 08 — MIGRATION & DR KEYWORDS

---

## 🚚 DATABASE MIGRATION

| Scenario | Solution | Key Fact |
|:---|:---|:---|
| Same engine (MySQL → RDS MySQL) | **AWS DMS only** | No schema conversion needed |
| Different engine (Oracle → Aurora) | **AWS SCT + AWS DMS** | SCT converts PL/SQL stored procs |
| Continuous replication, zero-downtime cutover | **DMS with CDC mode** | Change Data Capture |
| MongoDB → DocumentDB | DMS (MongoDB source support) | — |
| Cassandra → Keyspaces | Glue / CQL copy | 100% CQL compatible |

---

## 🖥️ SERVER MIGRATION

| Scenario | Service | Protocol / Method |
|:---|:---|:---|
| Physical servers, VMware, Hyper-V, cloud → EC2 | **AWS Application Migration Service (MGN)** | Continuous block-level replication, TCP 1500 |
| Discover on-prem dependencies + network map | **AWS Application Discovery Service — Agent** | Discovery Agent per server |
| Discover basic inventory (no network map) | **Application Discovery — Agentless Collector** | VMware OVA, no agent install |
| Unified migration progress dashboard | **AWS Migration Hub** | "Single pane of glass" |

---

## 💾 DISASTER RECOVERY STRATEGIES

### 4-Level DR Comparison

| Level | EC2 in DR Region | DB in DR Region | RPO | RTO | Cost |
|:---|:---|:---|:---|:---|:---|
| **1. Backup & Restore** | ❌ None | Only snapshots in S3 | Hours | 24h+ | \$ |
| **2. Pilot Light** | ❌ None (only AMI/IaC) | ✅ Running + synced | Minutes | Tens of minutes | \$\$ |
| **3. Warm Standby** | ✅ Running (scaled-down) | ✅ Running + synced | Seconds | Minutes | \$\$\$ |
| **4. Multi-Region Active** | ✅ Full capacity | ✅ Active-Active writes | ≈ 0 | ≈ 0 | \$\$\$\$ |

> ⚠️ **Pilot Light vs Warm Standby** (Most Common Confusion):  
> - **Pilot Light**: DB running, **EC2 = ZERO instances** (only AMI saved)  
> - **Warm Standby**: DB running, **EC2 = running scaled-down fleet**

---

## 🔄 AWS SERVICES FOR DR

| Service | RPO | RTO | Keyword |
|:---|:---|:---|:---|
| **AWS Elastic Disaster Recovery (DRS)** | Seconds | Minutes | Continuous block replication, staging area, drill |
| **Aurora Global Database** | < 1 second | < 1 minute | Storage-level replication cross-region |
| **DynamoDB Global Tables** | < 1 second | Instant | Active-Active, last-writer-wins |
| **RDS Cross-Region Read Replica** | Minutes | Minutes (promote) | Async replication |
| **S3 Cross-Region Replication (CRR)** | Near-real-time | Instant (data already there) | Secondary region data |

---

## 📦 AWS BACKUP

| Feature | Detail |
|:---|:---|
| **Centralized backup** | Single policy for EC2, RDS, DynamoDB, EFS, S3, Storage Gateway |
| **Cross-region copy** | Auto-copy backups to another region |
| **Cross-account copy** | Copy to separate account for ransomware protection |
| **Vault Lock — Compliance** | WORM for all backups; immutable after cooling-off (1–72h); **nobody deletes** |
| **Vault Lock — Governance** | WORM but admin with IAM can override |
| **Backup Audit Manager** | Generate compliance reports on backup activity |

---

## 🏔️ DATA TRANSFER SERVICES FOR MIGRATION

| Service | Use When | Throughput |
|:---|:---|:---|
| **AWS DataSync** | NFS/SMB/HDFS → S3/EFS/FSx, online, recurring | 10x faster than rsync; TLS; integrity check |
| **Snowcone** | Edge + small transfers < 8 TB; IoT; disconnected | 2 vCPU, 4 GB RAM |
| **Snowball Edge Storage** | 50–100 TB; slow internet | 80 TB usable; EC2 + Lambda on device |
| **Snowball Edge Compute** | Edge computing + transfer | 52 vCPU, 208 GB RAM + storage |
| **Snowmobile** | Exabyte / data center migration | 100 PB per truck |

**Rule of thumb**: 50 TB via 10 Mbps internet = 462 days → Use Snowball, not DataSync

---

## 🗄️ SCHEMA CONVERSION QUICK GUIDE

| SCT Converts From → To | Need SCT? |
|:---|:---|
| Oracle → Aurora PostgreSQL | ✅ Yes (PL/SQL → PL/pgSQL) |
| SQL Server → Aurora MySQL | ✅ Yes |
| MySQL → RDS MySQL | ❌ No (same engine) |
| PostgreSQL → Aurora PostgreSQL | ❌ No (same engine) |

---

## 📊 MIGRATION PHASES REFERENCE

```
1. Assess:     AWS Migration Evaluator (TCO analysis)
2. Discover:   AWS Application Discovery Service (agent/agentless)
3. Plan:       AWS Migration Hub (unified tracker)
4. Migrate DB: AWS DMS + SCT (if heterogeneous)
5. Migrate App: AWS MGN (block-level replication, non-disruptive)
6. Migrate Data: AWS DataSync (NFS/SMB online) or Snow Family (offline)
7. DR Setup:   AWS Elastic Disaster Recovery (DRS)
8. Optimize:   AWS Compute Optimizer, Cost Explorer
```

