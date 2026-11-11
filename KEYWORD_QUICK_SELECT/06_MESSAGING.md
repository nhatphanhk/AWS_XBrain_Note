# 06 — MESSAGING KEYWORDS: SQS, SNS, EventBridge, Kinesis, MQ

---

## 📬 SQS — STANDARD vs FIFO

| Feature | SQS Standard | SQS FIFO |
|:---|:---|:---|
| **Throughput** | Unlimited (nearly) | 300 msg/s; 3,000 with batching |
| **Ordering** | Best-effort (not guaranteed) | Strict First-In-First-Out |
| **Delivery** | At-least-once (duplicates possible) | Exactly-once (dedup via MessageDeduplicationId) |
| **Use when** | High throughput, order doesn't matter | Financial transactions, order processing |
| **Keyword** | "decouple", "buffer", "unlimited throughput" | "strict order", "exactly-once", "bank transactions" |

### Critical SQS Concepts

| Concept | Value | Purpose |
|:---|:---|:---|
| **Visibility Timeout** | Default 30s, max 12h | Message invisible after receive; avoids double-process |
| **Long Polling** | Up to 20s wait | Reduce empty responses; save cost |
| **Dead-Letter Queue (DLQ)** | After maxReceiveCount | Isolate poison pills; don't block workers |
| **Message Retention** | Default 4 days, max 14 days | How long message stays in queue |
| **Max Message Size** | 256 KB | Use S3 + SQS Extended Client for larger |

**Scale EC2 workers based on SQS**: Use **ApproximateNumberOfMessagesVisible** metric  
→ Create **Target Tracking on backlog per instance** = best scaling approach

---

## 📢 SNS — PUB/SUB

| Feature | Detail |
|:---|:---|
| **Fan-out pattern** | 1 SNS topic → multiple SQS queues (parallel processing) |
| **Delivery protocols** | SQS, Lambda, HTTP/S, Email, SMS, Mobile Push |
| **Message Filtering** | Filter Policy per subscriber (reduce unnecessary Lambda calls) |
| **FIFO Topics** | Ordering + dedup for SQS FIFO subscribers |

**Classic Pattern**: SNS → multiple SQS → multiple processing fleets (Fan-out + Buffer)

---

## ⚡ EVENTBRIDGE — EVENT BUS

| Use Case | EventBridge Feature |
|:---|:---|
| "trigger Lambda at 9am every Monday" | **EventBridge Scheduler** (or cron Rule) |
| "react to SaaS events (Salesforce, Zendesk)" | **SaaS Partner Event Bus** |
| "real-time routing of AWS service events" | **Default Event Bus** (CloudTrail, EC2 state change) |
| "custom app events between microservices" | **Custom Event Bus** |
| "replay past events for debugging" | **EventBridge Archive + Replay** |

> ⚠️ **EventBridge vs AppFlow**:  
> EventBridge = **route events** (JSON, real-time, trigger actions)  
> AppFlow = **bulk data transfer** (Salesforce records, CSV → S3/Redshift, no-code)

---

## 🌊 KINESIS — DATA STREAMING

| Service | Keyword | Key Feature |
|:---|:---|:---|
| **Kinesis Data Streams** | "real-time", "replay", "retention", "custom consumer" | Manage shards; 24h–365d retention; build own consumer |
| **Kinesis Data Firehose** | "auto-deliver to S3/Redshift/OpenSearch", "serverless" | No shard management; no replay; near-real-time (buffer) |
| **Kinesis Data Analytics (Managed Flink)** | "real-time SQL analytics on stream" | Flink apps on streams |
| **Kinesis Video Streams** | "ingest video from cameras" | Media pipeline |

### Kinesis Shard Math
- 1 shard = 1 MB/s write (1,000 records/s) + 2 MB/s read  
- Scale = **add more shards** (resharding)  
- **Poison pill fix**: `BisectBatchOnFunctionError = true` + DLQ + max retry

### Kinesis vs SQS Decision

```
Need replay / retention             → Kinesis Data Streams
Need unlimited throughput + simple  → SQS Standard
Need strict ordering (financial)    → SQS FIFO or Kinesis (shard per entity)
Need auto-deliver to data stores    → Kinesis Firehose
```

---

## 🔄 STEP FUNCTIONS — STANDARD vs EXPRESS

| | Standard Workflow | Express Workflow |
|:---|:---|:---|
| **Max Duration** | 1 year | 5 minutes |
| **Execution** | Exactly-once | At-least-once |
| **Cost model** | Per state transition | Per execution duration |
| **Use case** | Long-running, human approval, durable | High-frequency, short, IoT/event processing |
| **Keyword** | "approval step", "long workflow", "durable" | "high frequency", "IoT", "fast short tasks" |

---

## 🐰 AMAZON MQ — MANAGED MESSAGE BROKER

| Keyword | Use MQ | Don't Use SQS/SNS |
|:---|:---|:---|
| "migrate ActiveMQ/RabbitMQ to cloud" | ✅ Amazon MQ | SQS requires code rewrite |
| "JMS/AMQP/MQTT/STOMP protocol" | ✅ Amazon MQ | SQS only supports its own API |
| "legacy Java EE app with javax.jms" | ✅ Amazon MQ | — |
| "new microservices, no protocol constraint" | — | ✅ SQS/SNS (simpler, unlimited scale) |

**Amazon MQ HA**: Active/Standby mode (EFS-backed shared storage, auto-failover)

---

## 🎯 DECOUPLING PATTERNS CHEAT SHEET

```
Spike buffering (SQS in front of DB)         → SQS Standard + EC2/Lambda consumer
Fan-out to multiple systems                   → SNS → SQS (Fanout)
Event routing (AWS & SaaS events)             → EventBridge
Real-time analytics pipeline                  → Kinesis Data Streams → Flink → Firehose
Bulk SaaS data sync (Salesforce → Redshift)   → Amazon AppFlow
Multi-step workflow with human approval       → Step Functions Standard
Legacy JMS/AMQP migration                     → Amazon MQ
```

