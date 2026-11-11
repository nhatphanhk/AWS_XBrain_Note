# 04 — NETWORK KEYWORDS: VPC, Route 53, ELB, CDN

---

## 🌐 VPC CONNECTIVITY — CHỌN NHANH

| Scenario | Solution | Avoid |
|:---|:---|:---|
| "2 VPCs connect, non-overlapping CIDR" | **VPC Peering** | ~~TGW~~ (overkill for 2 VPCs) |
| "100+ VPCs connect centrally (hub-and-spoke)" | **Transit Gateway** | ~~VPC Peering~~ (N² connections) |
| "overlapping CIDR VPCs need to connect" | **AWS PrivateLink** (Interface Endpoint + NLB) | ~~VPC Peering~~ ~~TGW~~ |
| "on-prem → AWS private connection (dedicated)" | **AWS Direct Connect** | ~~Site-to-Site VPN~~ (if low jitter needed) |
| "on-prem → AWS encrypted tunnel over internet" | **Site-to-Site VPN** (IPsec, 1.25 Gbps max) | ~~Direct Connect~~ (if cost is concern) |
| "Direct Connect + backup VPN failover" | **DX + VPN as backup** | ~~DX alone~~ |
| "access S3/DynamoDB from VPC without NAT (free)" | **Gateway VPC Endpoint** | ~~Interface Endpoint~~ (has cost) |
| "access any AWS service from VPC privately (ENI)" | **Interface VPC Endpoint (PrivateLink)** | ~~Gateway Endpoint~~ (only S3/DynamoDB) |
| "copy raw packets from ENI for IDS/DPI" | **VPC Traffic Mirroring** | ~~VPC Flow Logs~~ (only metadata/headers) |
| "third-party firewall appliance inline in VPC" | **Gateway Load Balancer (GWLB)** + GENEVE 6081 | ~~ALB~~ ~~NLB~~ |
| "VPC-level L7 stateful firewall, domain filter" | **AWS Network Firewall** (Suricata IPS) | ~~Security Group~~ ~~NACL~~ |
| "centralize WAF/Shield/NF across all org accounts" | **AWS Firewall Manager** | ~~WAF standalone~~ |

---

## 🔀 LOAD BALANCER QUICK GUIDE

| Load Balancer | Layer | Protocols | Use Case |
|:---|:---|:---|:---|
| **ALB** (Application) | L7 | HTTP/HTTPS/WebSocket | Microservices, path/host routing, WAF attach |
| **NLB** (Network) | L4 | TCP/UDP/TLS | Ultra-low latency, static IP, PrivateLink backend |
| **GWLB** (Gateway) | L3+L4 | IP (GENEVE) | Third-party virtual appliances (firewall, IDS) |
| **CLB** (Classic) | L4+L7 | HTTP/HTTPS/TCP | Legacy only — do NOT use for new designs |

> ⚠️ **NLB vs ALB**:  
> NLB = static IP (Elastic IP) → needed when partners whitelist firewall  
> ALB = no static IP → use Global Accelerator for static Anycast IP

---

## ⚡ GLOBAL ACCELERATOR vs CLOUDFRONT

| Feature | AWS Global Accelerator | Amazon CloudFront |
|:---|:---|:---|
| **IP type** | 2 Static Anycast IPs | Dynamic (no static IP) |
| **Layer** | L4 (TCP/UDP) | L7 (HTTP/HTTPS/WebSocket) |
| **Caching** | ❌ No caching | ✅ Edge caching |
| **Use case** | Gaming, VoIP, IoT, bypass DNS cache | Web content, video, API acceleration |
| **Protocols** | TCP AND UDP | HTTP/HTTPS only |
| **DNS cache bypass** | ✅ Anycast → instant failover | ❌ DNS TTL still applies |

**Key Trigger**: "static IP", "UDP", "gaming", "VoIP", "bypass DNS cache" → **Global Accelerator**  
**Key Trigger**: "cache static content", "edge", "CDN", "HTTP" → **CloudFront**

---

## 🔀 AUTO SCALING GROUP (ASG) — SCALING POLICIES

| Policy | Trigger | Use When |
|:---|:---|:---|
| **Simple Scaling** | CloudWatch alarm → add/remove N | Basic; has cooldown period |
| **Step Scaling** | Alarm → different steps by severity | Flash sale, sudden spikes (no cooldown wait) |
| **Target Tracking** | Keep metric at target (e.g., CPU 50%) | Most common; AWS manages thresholds |
| **Scheduled Scaling** | Fixed time → set capacity | Predictable load (business hours) |
| **Predictive Scaling** | ML forecast → scale in advance | Gradual recurring patterns |

> ⚠️ **Step Scaling vs Simple Scaling**: Step Scaling = **NO cooldown between steps** → better for sudden spikes

**ASG Lifecycle Hooks**:
- `Pending:Wait` → install software before receiving traffic
- `Terminating:Wait` → collect logs before instance deleted

---

## 🌍 ROUTE 53 ROUTING POLICIES

| Policy | Use When | Key |
|:---|:---|:---|
| **Simple** | Single resource, no health check | No failover |
| **Weighted** | A/B testing, gradual traffic shift (% split) | Weight 0 = no traffic |
| **Latency** | Serve from lowest latency region | Based on network latency |
| **Failover** | Active-passive DR; health check primary | Switch on fail |
| **Geolocation** | Route by user's country/continent | Restrict content by law |
| **Geoproximity** | Route by resource + user location, bias dial | Traffic Engineering |
| **Multi-Value** | Multiple IPs + health checks (not load balancer) | Simple failover |
| **IP-Based** | Route by user's IP/CIDR range | On-prem / ISP routing |

> ⚠️ **Geolocation vs Geoproximity**:  
> Geolocation = by user's location ONLY  
> Geoproximity = by user + resource location + **Bias** parameter to shift traffic

**Alias vs CNAME**:
- **Alias**: Free, Zone Apex OK (`example.com`), AWS resources only  
- **CNAME**: Standard DNS, NO Zone Apex, any hostname, has query fee

---

## 🔧 HYBRID DNS

```
On-prem → AWS VPC DNS:    Route 53 Resolver Inbound Endpoint
AWS VPC → On-prem DNS:    Route 53 Resolver Outbound Endpoint + Forwarding Rules
Bidirectional:            BOTH endpoints required
```

> ⚠️ **Common trap**: Creating only 1 endpoint when bidirectional is needed

---

## 🛡️ NETWORK SECURITY QUICK COMPARE

| Service | Stateful? | Layer | Scope | Keyword |
|:---|:---|:---|:---|:---|
| **Security Group** | ✅ Stateful | L3-L4 | Instance/ENI | "instance firewall", "allow/deny port" |
| **NACL** | ❌ Stateless | L3-L4 | Subnet | "subnet firewall", "explicit deny rule" |
| **AWS WAF** | L7 | HTTP | CloudFront/ALB/APIGW | "SQLi", "XSS", "rate-limit", "HTTP rules" |
| **Network Firewall** | ✅ Stateful | L3-L7 | VPC | "FQDN filter", "Suricata IPS", "VPC-wide" |
| **Shield Standard** | Auto | L3-L4 | All | "basic DDoS protection" (free) |
| **Shield Advanced** | Managed | L3-L7 | CloudFront/ALB/Route53 | "DRT team", "cost protection", "24/7" |

