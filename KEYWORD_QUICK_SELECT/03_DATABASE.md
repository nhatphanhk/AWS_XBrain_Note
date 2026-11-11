# 03 — DATABASE KEYWORDS: RDS, Aurora, DynamoDB, ElastiCache

---

## 🗄️ RDS — CHỌN NHANH

| Keyword | Answer | Detail |
|:---|:---|:---|
| "HA, automatic failover, standby NOT readable" | **RDS Multi-AZ DB Instance** (1 standby, ~60–120s failover) | Standby = passive |
| "HA, standby readable, faster failover ~35s" | **RDS Multi-AZ DB Cluster** (2 readable standbys) | Semi-sync, 2 reader standbys |
| "scale read traffic, async copy" | **RDS Read Replicas** (up to 5–15) | Async replication, can promote |
| "cross-region DR + read scaling" | **RDS Read Replica (Cross-Region)** | Async, promote if primary fails |
| "storage grows automatically, no downtime" | **RDS Storage Auto Scaling** | Triggers when < 10% free, 6h cooldown |
| "rotate DB password, no app restart" | **Secrets Manager + Lambda Rotation** | 2-label version: AWSCURRENT/AWSPENDING |
| "login to MySQL/PG without static password, SSL" | **IAM Database Authentication** (STS token 15m) | Only MySQL + PostgreSQL RDS/Aurora |
| "query relational DB without connection overhead" | **RDS Proxy** (connection pooling) | Critical for Lambda → RDS |
| "Lambda → RDS, too many connections" | **RDS Proxy** | Pools and multiplexes connections |

---

## 🌟 AURORA — ĐẶC BIỆT

| Keyword | Answer | Detail |
|:---|:---|:---|
| "managed MySQL/PG, 5x faster, shared storage" | **Amazon Aurora** | 6 copies × 3 AZs storage |
| "aurora automatic scale on demand" | **Aurora Serverless v2** | Scales in 0.5 ACU increments |
| "multi-region active-PASSIVE, < 1s replication" | **Aurora Global Database** | 1 primary writer, others read-only |
| "fast cross-region DR, < 1 min failover" | **Aurora Global Database** promote secondary | RPO < 1s, RTO < 1 min |
| "clone DB for testing without affecting production" | **Aurora Clone** | Copy-on-write, instant, cheap |
| "rewind DB to point in time (up to 72h back)" | **Aurora Backtrack** | In-place rewind, NO new cluster |
| "read scaling, up to 15 replicas, < 100ms lag" | **Aurora Read Replicas** | Shared storage = very low lag |

> ⚠️ **Aurora Global vs DynamoDB Global Tables**:  
> - Aurora Global = **Active-PASSIVE** (1 writer)  
> - DynamoDB Global Tables = **Active-ACTIVE** (all regions write)

---

## ⚡ DYNAMODB — CHỌN NHANH

| Keyword | Answer | Bẫy |
|:---|:---|:---|
| "microsecond reads, NO code change" | **DAX** (DynamoDB Accelerator) | ~~ElastiCache~~ (phải sửa code) |
| "multi-region active-active, local read+write" | **DynamoDB Global Tables** | ~~Aurora Global~~ |
| "recover to specific second (scripted delete)" | **PITR** (Point-in-Time Recovery, 35 days) | ~~On-Demand Backup~~ (only snapshot point) |
| "event-driven on item change (CDC)" | **DynamoDB Streams** | ~~S3 Events~~ |
| "sync DynamoDB changes to OpenSearch" | **DynamoDB Streams → Lambda → OpenSearch** | ~~DMS~~ |
| "query on non-primary key (new access pattern)" | **GSI** (Global Secondary Index) | ~~LSI~~ (LSI must be created at table creation) |
| "query on sort key variation same partition" | **LSI** (Local Secondary Index, at creation time) | ~~GSI~~ |
| "serverless, variable traffic, don't care about cost" | **DynamoDB On-Demand capacity** | ~~Provisioned~~ |
| "predictable traffic, cheapest" | **DynamoDB Provisioned + Auto Scaling** | ~~On-Demand~~ |
| "Cassandra migration, CQL compatible, serverless" | **Amazon Keyspaces** | ~~DynamoDB~~ (not CQL) |

### DynamoDB RCU/WCU Quick Math
- **1 RCU** = 1 Strongly Consistent Read / 2 Eventual Consistent Reads for items ≤ 4 KB  
- **1 WCU** = 1 Write/s for items ≤ 1 KB  
- DAX = **microsecond** (from DAX cache) vs DynamoDB = **single-digit ms**

---

## 🚀 ELASTICACHE — REDIS vs MEMCACHED

| Feature | Redis (Valkey) | Memcached |
|:---|:---|:---|
| **Persistence** | ✅ AOF + RDB snapshots | ❌ |
| **Pub/Sub messaging** | ✅ | ❌ |
| **Sorted Sets, Lists, Hashes** | ✅ (complex DS) | ❌ (simple key-value) |
| **Cluster Mode (shard)** | ✅ | ✅ |
| **Multi-thread scale-out** | ❌ (single-threaded core) | ✅ |
| **Replication & Read Replicas** | ✅ | ❌ |
| **Exam choice for session store / leaderboard** | **Redis** | — |
| **Exam choice for simple cache, multi-thread** | — | **Memcached** |

### Caching Strategies
- **Lazy Loading (Cache-Aside)**: Đọc từ cache; cache miss → đọc DB → ghi cache. Dữ liệu có thể stale.  
- **Write-Through**: Ghi vào cache khi ghi vào DB. Luôn fresh nhưng tốn gấp đôi write.  
- **TTL**: Set TTL để tránh stale data, kết hợp cả 2 strategy.

---

## 🔧 SPECIALIZED DATABASES

| Database | Use When | Keyword Trigger |
|:---|:---|:---|
| **Amazon DocumentDB** | MongoDB compatible, flexible JSON, auto-scale 128 TB | "MongoDB", "JSON schema", "document store" |
| **Amazon Neptune** | Graph DB, deep relationship queries | "social network", "fraud detection", "graph traversal", "Gremlin/SPARQL" |
| **Amazon QLDB** | Immutable ledger, cryptographic verification | "immutable ledger", "accounting audit trail", "SHA-256 Merkle" |
| **Amazon Keyspaces** | Cassandra migration, CQL, serverless | "Apache Cassandra", "CQL", "no cluster management" |
| **Amazon Timestream** | IoT/telemetry time-series events | "sensor data", "time-series", "IoT telemetry" |
| **Amazon MemoryDB for Redis** | Redis-compatible + durable (not just cache) | "Redis primary DB", "durable Redis", "microservices primary store" |

---

## 🗄️ DATABASE MIGRATION

| Scenario | Solution | Key Point |
|:---|:---|:---|
| Same engine (MySQL → RDS MySQL) | **DMS only** | No schema conversion needed |
| Different engine (Oracle → Aurora) | **SCT** (schema) + **DMS** (data) | SCT converts PL/SQL stored procs |
| Zero-downtime cutover | **DMS CDC mode** | Continuous replication until cutover |
| MongoDB → DocumentDB | **mongodump → mongorestore** or DMS | DMS supports MongoDB source |
| Cassandra → Keyspaces | **AWS Glue** or CQL copy | No SCT needed (CQL compatible) |

