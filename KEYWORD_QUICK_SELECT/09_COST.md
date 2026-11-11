# 09 — COST OPTIMIZATION KEYWORDS

---

## 💲 EC2 PRICING OPTIONS — QUICK SELECT

```
Short-term, unpredictable           → On-Demand
Most flexible, all EC2+Fargate+Lambda → Compute Savings Plans (up to 66%)
Best savings, committed 1 family    → EC2 Instance Savings Plans (up to 72%)
Fault-tolerant batch, up to 90% off → Spot Instances
BYOL (Oracle/SQL Server), per socket → Dedicated Hosts (most expensive)
Tenant isolation only               → Dedicated Instances
Guarantee capacity (Black Friday)   → On-Demand Capacity Reservations
```

---

## 📊 SAVINGS PLANS vs RESERVED INSTANCES

| Feature | Compute Savings Plans | EC2 Instance SP | Zonal RI | Regional RI |
|:---|:---|:---|:---|:---|
| **Covers** | EC2 + Fargate + Lambda | EC2 (1 family, all sizes) | EC2 (specific type, AZ) | EC2 (1 family, 1 region) |
| **Flexibility** | Any instance family, size, region | Any size in 1 family, 1 region | Only specific instance | Any size in family |
| **Capacity Reservation** | ❌ | ❌ | ✅ | ❌ |
| **Savings** | Up to 66% | Up to 72% | Up to 72% | Up to 72% |

> ⚠️ **KEY EXAM TRAP**: "Capacity reservation included" → Only **Zonal RI** provides capacity reservation.  
> Compute Savings Plans do NOT reserve capacity.

---

## 💰 COST MANAGEMENT SERVICES

| Service | Purpose | Keyword |
|:---|:---|:---|
| **AWS Cost Explorer** | Analyze 12M history + 12M forecast; right-sizing | "analyze costs", "forecast spend", "usage patterns" |
| **AWS Budgets** | Alert on threshold + auto-actions | "alert when spend exceeds", "auto-stop EC2 on budget breach" |
| **AWS Compute Optimizer** | ML-based right-sizing for EC2/EBS/Lambda/ASG | "right-sizing", "overprovisioned", "recommendation" |
| **AWS Trusted Advisor** | 5-pillar checks (Cost/Security/Performance/FT/Limits) | "checks", "best practices", "quota" |
| **AWS Cost Anomaly Detection** | ML detect unusual spend spikes | "unexpected cost spike", "anomaly alert" |
| **AWS Pricing Calculator** | Estimate costs before deployment | "estimate monthly cost" |

---

## 🗄️ S3 COST OPTIMIZATION

| Strategy | Saving | When |
|:---|:---|:---|
| Use **Intelligent-Tiering** | Auto-move to IA tier | Unknown/changing access patterns |
| **Lifecycle Policies** to Glacier | Significant for old data | Data not accessed after 90+ days |
| **S3 Standard for < 30-day data** | Avoid early deletion penalty | Files deleted before 30 days |
| **CloudFront + Price Class** | Reduce origin requests | 80-95% cache hit rate |
| **S3 Select** | Reduce data scanned | Only retrieve needed columns/rows |
| **Compression** (gzip, Snappy) | 60-80% size reduction | Before storing in S3 |

---

## 🖥️ EC2 COST OPTIMIZATION

| Strategy | Detail |
|:---|:---|
| **Spot Instances** | 90% savings; use for fault-tolerant batch, CI/CD |
| **Graviton (ARM) instances** | 20% cheaper than x86 same performance |
| **Stop Dev/Test EC2** | Use Instance Scheduler; save 70% (nights + weekends) |
| **Right-size with Compute Optimizer** | ML analyzes 14 days of CloudWatch metrics |
| **Savings Plans (Compute)** | Commit $ amount/hour; 66% savings; covers EC2+Fargate+Lambda |
| **Reserved Instances** | Commit specific instance; 72% savings; RI Marketplace to sell unused |

---

## 🏢 DATABASE COST OPTIMIZATION

| Strategy | Detail |
|:---|:---|
| **Aurora Serverless v2** | Auto-scales to 0; pay per ACU-hour; dev/test |
| **DynamoDB On-Demand → Provisioned** | Switch after traffic is predictable; much cheaper |
| **DynamoDB Provisioned + Auto Scaling** | Best for steady predictable traffic |
| **ElastiCache** | Reduce expensive DB reads by 80%+ |
| **RDS Snapshot + Restore** | Dev environments: snapshot nightly, delete instance, restore next day |
| **Aurora Clones** | Zero-cost clone for testing (copy-on-write) |

---

## 🌐 NETWORK COST OPTIMIZATION

| Scenario | Optimization |
|:---|:---|
| Data transfer between AZs | Use **same-AZ** resources when possible (AZ transfer has cost) |
| EC2 → S3 (same region) | Use **Gateway VPC Endpoint** (free, no data transfer fee) |
| Cross-region replication | Minimize; use **S3 Intelligent-Tiering** in primary region |
| CloudFront vs direct S3 | CloudFront = cheaper data transfer ($0.085/GB vs $0.09/GB) + caching |
| Egress costs | CloudFront reduces origin egress by 80-95% via caching |

---

## 📉 COST OPTIMIZATION PILLARS (Well-Architected)

1. **Cloud Financial Management**: Establish FinOps culture, ownership, budget visibility
2. **Expenditure Awareness**: Cost Explorer, Cost Allocation Tags, Budgets alerts
3. **Cost-Effective Resources**: Savings Plans, Spot, Graviton, right-sizing
4. **Manage Demand**: Auto Scaling, SQS buffer, CloudFront caching
5. **Optimize Over Time**: Review Trusted Advisor, Compute Optimizer monthly

