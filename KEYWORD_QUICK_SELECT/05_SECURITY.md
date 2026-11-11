# 05 — SECURITY KEYWORDS: IAM, KMS, Threat Detection, Compliance

---

## 🔐 IAM — IDENTITY & ACCESS MANAGEMENT

| Keyword | Answer | Detail |
|:---|:---|:---|
| "EC2 call AWS APIs without hardcoded keys" | **IAM Instance Profile** (Role attached to EC2) | Temporary credentials via STS |
| "cross-account resource access" | **IAM Role with Trust Policy** (sts:AssumeRole) | No IAM user sharing |
| "org-wide max permission guardrail (block all accounts)" | **SCP (Service Control Policy)** | Overrides even Root of member accounts |
| "limit max permissions of specific IAM user/role" | **IAM Permission Boundary** | Intersection of Identity Policy + Boundary |
| "prevent Developer from granting themselves Admin" | **Permission Boundaries** on role creation | "cannot escalate beyond boundary" |
| "share resources across accounts without IAM role" | **Resource-Based Policy** (S3 bucket policy, etc.) | No credential switching |

### SCP vs Permission Boundaries (Critical Distinction)

| | SCP | Permission Boundary |
|:---|:---|:---|
| **Scope** | Root / OU / Member Account | Individual IAM User or Role |
| **Applies to Root User?** | ✅ (Member Account root) | ❌ |
| **Grants permissions?** | ❌ Only restricts | ❌ Only limits max |
| **Exempt** | Service-Linked Roles, Management Account | — |

---

## 🔑 KMS — KEY MANAGEMENT

| Keyword | Answer | Detail |
|:---|:---|:---|
| "who controls key policy (audit, rotation)" | **Customer Managed Key (CMK)** (\$1/month) | Full control; annual or on-demand rotation |
| "auto-managed key, free, standard services" | **AWS Managed Key** (aws/s3, aws/rds) | Auto-rotate every 1 year; can't edit policy |
| "encrypt > 4 KB data with KMS" | **Envelope Encryption** (GenerateDataKey) | KMS encrypts a data key; use locally |
| "share encrypted resource across regions" | **KMS Multi-Region Keys** | Replicate key to other regions |
| "audit all key usage (who decrypted what)" | **CloudTrail + KMS audit logs** | Every API call logged |
| "encrypt EBS volume for Hibernate" | **KMS-encrypted EBS Root** | Required for Hibernate |

---

## 🔍 THREAT DETECTION TRIO — GuardDuty / Inspector / Macie

```
"brute force, compromised keys, crypto mining, anomalous API"  → GuardDuty
"CVE vulnerabilities, software weaknesses, ECR image scan"     → Inspector  
"PII data in S3, HIPAA/GDPR sensitive data classification"     → Macie
"root cause investigation, attack graph visualization"         → Detective
```

| Service | Input Sources | What It Does |
|:---|:---|:---|
| **GuardDuty** | CloudTrail, VPC Flow Logs, DNS Logs, EKS Audit | Detects runtime threats via ML |
| **Inspector** | EC2 agent, Lambda, ECR image | Scans for CVE / misconfigurations |
| **Macie** | S3 bucket data | Finds PII and sensitive data |
| **Detective** | GuardDuty + CloudTrail + VPC Flow | Investigates root cause after alert |

---

## 🛡️ SECURITY HUB vs CONFIG vs CLOUDTRAIL

| Service | Purpose | Keyword |
|:---|:---|:---|
| **Security Hub** | Aggregates findings; CIS benchmark score; compliance dashboard | "CIS benchmark", "posture score", "centralize findings" |
| **AWS Config** | Continuous resource config compliance; auto-remediation | "continuous compliance", "s3 public check", "auto-remediate" |
| **CloudTrail** | API audit log (who/what/when) | "API audit", "who deleted", "who changed" |
| **CloudWatch** | Metrics, logs, alarms | "monitor CPU", "log group", "alert threshold" |

> ⚠️ **Config vs CloudTrail**: Config tracks **resource state changes**; CloudTrail tracks **API calls**

---

## 🔐 SECRETS & CONFIGURATION

| Use Case | Service | Cost |
|:---|:---|:---|
| Auto-rotate DB password, RDS integration | **Secrets Manager** | \$0.40/secret/month |
| Static config params, env vars, no rotation | **SSM Parameter Store Standard** | Free |
| Secure string with KMS encrypt | **SSM Parameter Store SecureString** | Free (using existing KMS key) |
| Rotation without downtime (2-label strategy) | Secrets Manager AWSCURRENT / AWSPENDING | Built-in Lambda rotation |

---

## 🔒 COGNITO — USER POOLS vs IDENTITY POOLS

| | User Pools | Identity Pools |
|:---|:---|:---|
| **Purpose** | **Authentication** (sign-in, JWT tokens) | **Authorization** (federated access to AWS resources) |
| **Outputs** | JWT (ID token, Access token) | Temporary AWS credentials (STS) |
| **Use for** | App login, MFA, password management | "Login with Google/Facebook → access S3" |
| **Keyword** | "user directory", "sign-up/sign-in", "JWT" | "federated identity", "social login → AWS API" |

---

## 📋 COMPLIANCE & AUDIT SERVICES

| Service | What It Does | Keyword |
|:---|:---|:---|
| **AWS Artifact** | Download SOC/ISO/PCI-DSS reports; sign HIPAA BAA | "compliance report", "audit report download", "BAA" |
| **AWS Audit Manager** | Continuously collect evidence for audits | "automated audit evidence", "GDPR framework" |
| **AWS Config** | Track resource configs + managed rules + remediation | "s3 bucket public check", "auto-remediate", "config history" |
| **CloudTrail** | API activity log | "API audit trail", "data events", "who called PutObject" |

---

## 🏢 ORGANIZATIONS & MULTI-ACCOUNT

```
Centralized billing only           → Consolidated Billing (no SCPs)
Full governance + SCPs             → AWS Organizations (all features enabled)
Deploy stacks to all accounts      → CloudFormation StackSets
Centralize security findings       → Security Hub aggregator account
Centralize logs (CloudTrail)       → S3 bucket in dedicated Log Archive account
Centralize firewalls               → AWS Firewall Manager
Block services org-wide            → SCP with Deny
Share resources across accounts    → AWS Resource Access Manager (RAM)
```

---

## 🔑 WAF RULES QUICK GUIDE

| Attack Type | WAF Rule Type |
|:---|:---|
| SQL Injection | Managed rule: SQLiMatchStatement |
| XSS (Cross-Site Scripting) | Managed rule: XssMatchStatement |
| Known bad IPs | IP Set Rule |
| DDoS / rate limiting | Rate-Based Rule (per IP per 5 min) |
| Geo-blocking | Geo Match Statement |
| Bot protection | AWS Managed Rules for Bot Control |

