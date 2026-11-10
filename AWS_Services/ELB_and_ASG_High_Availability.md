# TÃ i Liá»‡u Há»c Táº­p ChuyÃªn SÃ¢u: Elastic Load Balancing (ELB) & Auto Scaling Groups (ASG) (Kiáº¿n TrÃºc Co GiÃ£n & Äá»™ Sáºµn SÃ ng Cao)

> **TÃ i liá»‡u chuáº©n hÃ³a kiáº¿n trÃºc Ä‘Ã¡m mÃ¢y**: HÆ°á»›ng dáº«n toÃ n diá»‡n theo tiÃªu chuáº©n Principal AWS Solutions Architect & Senior Cloud DevOps Engineer (Cáº­p nháº­t phiÃªn báº£n kiáº¿n trÃºc má»›i nháº¥t 2026).  
> **NgÃ´n ngá»¯**: Tiáº¿ng Viá»‡t chuyÃªn ngÃ nh (Báº£o lÆ°u toÃ n bá»™ thuáº­t ngá»¯ chuyÃªn ngÃ nh tiáº¿ng Anh chuáº©n AWS).  
> **Má»¥c tiÃªu**: Phá»¥c vá»¥ thi chá»©ng chá»‰ cáº¥p Ä‘á»™ Professional/Specialty (**SAA-C03, SAP-C02, DOP-C02**) vÃ  váº­n hÃ nh há»‡ thá»‘ng cáº¥p Ä‘á»™ doanh nghiá»‡p (**Production-grade**).  
> **CÃ¡c bÃ i giáº£ng liÃªn quan**: ChÆ°Æ¡ng 08 (High Availability and Scalability: BÃ i 70 Ä‘áº¿n BÃ i 86).

---

## 1. Tá»•ng Quan Dá»‹ch Vá»¥ (Service Overview)

### 1. Äá»‹nh nghÄ©a chuáº©n xÃ¡c vÃ  PhÃ¢n nhÃ³m dá»‹ch vá»¥
Bá»™ Ä‘Ã´i **Elastic Load Balancing (ELB)** vÃ  **Auto Scaling Groups (ASG)** lÃ  xÆ°Æ¡ng sá»‘ng kiáº¿n trÃºc ná»n táº£ng cá»§a má»i há»‡ thá»‘ng phÃ¢n tÃ¡n cÃ³ tÃ­nh sáºµn sÃ ng cao (**High Availability - HA**), kháº£ nÄƒng chá»‹u lá»—i (**Fault Tolerance**) vÃ  co giÃ£n Ä‘Ã n há»“i (**Elasticity**) trÃªn AWS.

```mermaid
flowchart TD
    ELBFamily[Há» Bá»™ CÃ¢n Báº±ng Táº£i AWS - Elastic Load Balancing] --> ALB[Application Load Balancer - ALB\nLayer 7: HTTP, HTTPS, gRPC, WebSocket / Content-based Routing]
    ELBFamily --> NLB[Network Load Balancer - NLB\nLayer 4: TCP, UDP, TLS / Cá»±c nhanh microsecond / Static IP per AZ]
    ELBFamily --> GWLB[Gateway Load Balancer - GWLB\nLayer 3: GÃ³i tin IP thÃ´ / GENEVE port 6081 / Inline Network Appliances]
    ELBFamily --> CLB[Classic Load Balancer - CLB [Deprecated]\nTháº¿ há»‡ cÅ© Layer 4/7 / KhÃ´ng khuyáº¿n nghá»‹ cho thiáº¿t káº¿ má»›i]

    ASGFamily[Há»‡ Thá»‘ng Tá»± Äá»™ng Co GiÃ£n - Auto Scaling Group] --> ASG_EC2[ASG for Amazon EC2\nTá»± Ä‘á»™ng Ä‘iá»u phá»‘i sá»‘ lÆ°á»£ng mÃ¡y áº£o, Self-healing, Mixed Spot/On-Demand]
    ASGFamily --> AppScaling[Application Auto Scaling\nCo giÃ£n ECS Tasks, DynamoDB RCU/WCU, Aurora Replicas]
```

1. **Application Load Balancer (ALB)**: Hoáº¡t Ä‘á»™ng á»Ÿ **Táº§ng 7 (Application Layer)** cá»§a mÃ´ hÃ¬nh OSI. ChuyÃªn biá»‡t cho lÆ°u lÆ°á»£ng HTTP, HTTPS, HTTP/2, gRPC vÃ  WebSockets. CÃ³ kháº£ nÄƒng phÃ¢n tÃ­ch chi tiáº¿t tiÃªu Ä‘á» gÃ³i tin Ä‘á»ƒ Ä‘á»‹nh tuyáº¿n thÃ´ng minh dá»±a trÃªn Ä‘Æ°á»ng dáº«n URL, hostname, HTTP headers, query strings vÃ  há»— trá»£ mTLS.
2. **Network Load Balancer (NLB)**: Hoáº¡t Ä‘á»™ng á»Ÿ **Táº§ng 4 (Transport Layer)**. CÃ³ kháº£ nÄƒng xá»­ lÃ½ hÃ ng chá»¥c triá»‡u requests/giÃ¢y vá»›i Ä‘á»™ trá»… cá»±c tháº¥p á»Ÿ má»©c **microsecond**. Há»— trá»£ cÃ¡c giao thá»©c TCP, UDP vÃ  TLS passthrough/termination. Cung cáº¥p **Ä‘á»‹a chá»‰ Anycast IP tÄ©nh hoáº·c Elastic IP cá»‘ Ä‘á»‹nh cho má»—i Availability Zone**.
3. **Gateway Load Balancer (GWLB)**: Hoáº¡t Ä‘á»™ng á»Ÿ **Táº§ng 3 (Network Layer)**. ÄÆ°á»£c thiáº¿t káº¿ chuyÃªn biá»‡t Ä‘á»ƒ triá»ƒn khai, má»Ÿ rá»™ng quy mÃ´ vÃ  Ä‘iá»u phá»‘i cÃ¡c thiáº¿t bá»‹ máº¡ng áº£o cá»§a bÃªn thá»© ba (**Virtual Appliances** nhÆ° Firewall tháº¿ há»‡ má»›i NGFW, Intrusion Detection/Prevention Systems - IDS/IPS, Deep Packet Inspection). Sá»­ dá»¥ng giao thá»©c Ä‘Ã³ng gÃ³i **GENEVE** trÃªn cá»•ng 6081.
4. **Classic Load Balancer (CLB) `[Deprecated]`**: Bá»™ cÃ¢n báº±ng táº£i tháº¿ há»‡ cÅ© (Layer 4/7), hiá»‡n Ä‘Ã£ bá»‹ AWS ngá»«ng khuyáº¿n nghá»‹ vÃ  khÃ´ng nÃªn sá»­ dá»¥ng cho báº¥t ká»³ há»‡ thá»‘ng má»›i nÃ o.
5. **Auto Scaling Groups (ASG)**: Dá»‹ch vá»¥ tá»± Ä‘á»™ng Ä‘iá»u chá»‰nh sá»‘ lÆ°á»£ng mÃ¡y chá»§ EC2 tÄƒng lÃªn khi lÆ°u lÆ°á»£ng truy cáº­p cao Ä‘á»ƒ duy trÃ¬ hiá»‡u nÄƒng, vÃ  co cá»¥m giáº£m bá»›t khi tháº¥p Ä‘iá»ƒm Ä‘á»ƒ tiáº¿t kiá»‡m chi phÃ­; Ä‘á»“ng thá»i liÃªn tá»¥c giÃ¡m sÃ¡t vÃ  tá»± Ä‘á»™ng thay tháº¿ cÃ¡c mÃ¡y chá»§ bá»‹ há»ng (**Self-healing**).

---

### 2. BÃ i toÃ¡n cá»‘t lÃµi mÃ  ELB & ASG giáº£i quyáº¿t

1. **Loáº¡i bá» Äiá»ƒm Lá»—i ÄÆ¡n Láº» (Single Point of Failure - SPOF)**: Tá»± Ä‘á»™ng phÃ¢n phá»‘i táº£i xuyÃªn qua nhiá»u Availability Zones (tá»‘i thiá»ƒu 2â€“3 AZs). Náº¿u má»™t AZ gáº·p tháº£m há»a máº¥t Ä‘iá»‡n hoáº·c Ä‘á»©t cÃ¡p quang, ELB tá»± Ä‘á»™ng chuyá»ƒn hÆ°á»›ng toÃ n bá»™ lÆ°u lÆ°á»£ng sang cÃ¡c AZ lÃ nh láº·n cÃ²n láº¡i.
2. **Tá»± Äá»™ng Phá»¥c Há»“i MÃ¡y Chá»§ Lá»—i (Automated Self-Healing)**: Khi káº¿t há»£p vá»›i ELB Health Checks, ASG tá»± Ä‘á»™ng phÃ¡t hiá»‡n cÃ¡c mÃ¡y chá»§ bá»‹ treo á»©ng dá»¥ng (tráº£ vá» mÃ£ lá»—i 5xx), thá»±c hiá»‡n cháº¥m dá»©t mÃ¡y chá»§ lá»—i vÃ  khá»Ÿi táº¡o mÃ¡y chá»§ má»›i thay tháº¿ tá»©c thÃ¬ mÃ  khÃ´ng cáº§n ká»¹ sÆ° can thiá»‡p thá»§ cÃ´ng.
3. **Tá»‘i Æ¯u HÃ³a Chi PhÃ­ Tá»± Äá»™ng (Elastic Cost Optimization)**: Co giÃ£n theo nhu cáº§u thá»±c táº¿ theo thá»i gian thá»±c (Dynamic Scaling) hoáº·c dá»± bÃ¡o báº±ng há»c mÃ¡y (Predictive Scaling), káº¿t há»£p mÃ´ hÃ¬nh linh hoáº¡t giá»¯a On-Demand cho táº£i ná»n vÃ  Spot Instances cho táº£i Ä‘á»™t biáº¿n.

---

### 3. Khi nÃ o KHÃ”NG nÃªn dÃ¹ng hoáº·c Giáº£i phÃ¡p thay tháº¿

* âŒ **Cáº§n Ä‘á»‹a chá»‰ IP tÄ©nh cÃ´ng khai cá»‘ Ä‘á»‹nh cho Load Balancer**: Application Load Balancer (ALB) khÃ´ng cung cáº¥p IP tÄ©nh (IP thay Ä‘á»•i liÃªn tá»¥c theo DNS Resolution).  
  ðŸ‘‰ *Giáº£i phÃ¡p thay tháº¿*: Sá»­ dá»¥ng **Network Load Balancer (NLB)** (cung cáº¥p 1 Elastic IP cá»‘ Ä‘á»‹nh per AZ), hoáº·c Ä‘áº·t **AWS Global Accelerator** phÃ­a trÆ°á»›c ALB Ä‘á»ƒ nháº­n 2 Anycast IP tÄ©nh.
* âŒ **Xá»­ lÃ½ lÆ°u lÆ°á»£ng giao thá»©c phi-HTTP yÃªu cáº§u Ä‘á»™ trá»… microsecond cá»±c tháº¥p (Gaming, IoT, RTMP Video)**: ALB chá»‰ há»— trá»£ HTTP/HTTPS/gRPC vÃ  xá»­ lÃ½ á»Ÿ táº§ng 7 vá»›i Ä‘á»™ trá»… vÃ i mili-giÃ¢y.  
  ðŸ‘‰ *Giáº£i phÃ¡p thay tháº¿*: Chuyá»ƒn sang **Network Load Balancer (NLB)** hoáº¡t Ä‘á»™ng á»Ÿ Layer 4.
* âŒ **á»¨ng dá»¥ng Serverless hoÃ n toÃ n khÃ´ng cÃ³ mÃ¡y chá»§**: KhÃ´ng cáº§n pháº£i táº¡o Auto Scaling Group cho cÃ¡c hÃ m Lambda vÃ¬ Lambda cÃ³ cÆ¡ cháº¿ tá»± Ä‘á»™ng má»Ÿ rá»™ng quy mÃ´ tÃ­ch há»£p sáºµn.

---

## 2. CÃ¡c KhÃ¡i Niá»‡m, Kiáº¿n TrÃºc & Váº­n HÃ nh Cá»‘t LÃµi (Core Concepts, Security & Day-2 Operations)

### 1. SÆ¡ Ä‘á»“ cÃ¡c mÃ´ hÃ¬nh kiáº¿n trÃºc cá»§a Application Load Balancer

```mermaid
flowchart TD
    User([NgÆ°á»i dÃ¹ng Internet]) -->|DNS Alias| ALB[Application Load Balancer\nPublic Subnets qua 3 AZs]
    
    subgraph TargetGroups["Táº§ng ÄÃ­ch Xá»­ LÃ½ - Target Groups"]
        subgraph TG_Users["Target Group 1: Users Service"]
            EC2_A[EC2 Node A\nAZ-1a]
            EC2_B[EC2 Node B\nAZ-1b]
        end

        subgraph TG_Orders["Target Group 2: Orders Microservice"]
            ECS_1[ECS Fargate Task C\nDynamic Port]
            ECS_2[ECS Fargate Task D\nDynamic Port]
        end

        subgraph TG_Serverless["Target Group 3: Serverless API"]
            Lambda[AWS Lambda Function]
        end
    end

    ALB -->|Rule 1: Path /api/users/*| TG_Users
    ALB -->|Rule 2: Path /api/orders/*| TG_Orders
    ALB -->|Rule 3: Host webhook.corp.com| TG_Serverless
```

---

### 2. CÃ¡c tÃ­nh nÄƒng nÃ¢ng cao cá»‘t lÃµi cá»§a Elastic Load Balancing

#### A. Äá»‹nh tuyáº¿n ná»™i dung nÃ¢ng cao (Advanced Content-Based Routing trÃªn ALB)
* **Path-based Routing**: Äá»‹nh tuyáº¿n dá»±a trÃªn Ä‘Æ°á»ng dáº«n URL (vÃ­ dá»¥: `/api/v1/auth/*` gá»­i vá» Auth Cluster, `/static/*` gá»­i vá» Static Group).
* **Host-based Routing**: Äá»‹nh tuyáº¿n dá»±a trÃªn trÆ°á»ng Host trong HTTP Header (vÃ­ dá»¥: `api.domain.com` vÃ  `shop.domain.com` dÃ¹ng chung 1 ALB).
* **HTTP Header / Method / Query Parameter Routing**: Äá»‹nh tuyáº¿n dá»±a trÃªn giÃ¡ trá»‹ cá»§a HTTP Header (vÃ­ dá»¥: `User-Agent: iOS` Ä‘áº©y vá» nhÃ³m mÃ¡y chá»§ tá»‘i Æ°u di Ä‘á»™ng) hoáº·c phÆ°Æ¡ng thá»©c HTTP (`GET` chuyá»ƒn vá» Read Group, `POST` chuyá»ƒn vá» Write Group).
* **Weighted Target Groups (Chuyá»ƒn táº£i theo tá»· lá»‡ pháº§n trÄƒm)**: Cho phÃ©p cáº¥u hÃ¬nh phÃ¢n bá»• lÆ°u lÆ°á»£ng (vÃ­ dá»¥: 95% traffic vÃ o Target Group Blue - v1, vÃ  5% vÃ o Target Group Green - v2) Ä‘á»ƒ triá»ƒn khai **Canary Deployment** hoáº·c **Blue/Green Deployment** an toÃ n.

#### B. Sticky Sessions (Session Affinity)
* RÃ ng buá»™c cÃ¡c yÃªu cáº§u liÃªn tiáº¿p tá»« cÃ¹ng má»™t ngÆ°á»i dÃ¹ng cuá»‘i luÃ´n Ä‘Æ°á»£c chuyá»ƒn tiáº¿p tá»›i **cÃ¹ng má»™t mÃ¡y chá»§ backend cá»¥ thá»ƒ**.
* Hoáº¡t Ä‘á»™ng dá»±a trÃªn Cookie:
  - **Duration-based Cookie**: Do chÃ­nh ALB tá»± táº¡o ra vÃ  quáº£n lÃ½ (tÃªn cookie máº·c Ä‘á»‹nh lÃ  `AWSALB`, cÃ³ thá»i gian sá»‘ng cáº¥u hÃ¬nh tá»« 1 giÃ¢y Ä‘áº¿n 7 ngÃ y).
  - **Application-based Cookie**: Do á»©ng dá»¥ng backend tá»± sinh vÃ  ALB sáº½ theo dÃµi cookie tÃ¹y chá»‰nh nÃ y.
* âš ï¸ *Rá»§i ro kiáº¿n trÃºc*: Sticky Sessions cÃ³ thá»ƒ gÃ¢y ra hiá»‡n tÆ°á»£ng **máº¥t cÃ¢n báº±ng táº£i (Load Imbalance)** náº¿u má»™t vÃ i ngÆ°á»i dÃ¹ng gá»­i lÆ°u lÆ°á»£ng quÃ¡ lá»›n lÃ m sáº­p mÃ¡y chá»§ Ä‘Ã³. Khuyáº¿n nghá»‹ chuáº©n má»±c: LÆ°u tráº¡ng thÃ¡i phiÃªn lÃ m viá»‡c (Session state) táº­p trung trong **Amazon ElastiCache for Valkey/Redis** Ä‘á»ƒ giá»¯ táº§ng Web hoÃ n toÃ n phi tráº¡ng thÃ¡i (**Stateless Web Tier**).

#### C. Cross-Zone Load Balancing (CÃ¢n báº±ng táº£i chÃ©o vÃ¹ng)
* **CÆ¡ cháº¿ hoáº¡t Ä‘á»™ng**: Má»—i node cá»§a Load Balancer sáº½ phÃ¢n phá»‘i lÆ°u lÆ°á»£ng Ä‘á»“ng Ä‘á»u tá»›i toÃ n bá»™ cÃ¡c mÃ¡y chá»§ backend náº±m á»Ÿ **táº¥t cáº£ cÃ¡c Availability Zones**.
* **So sÃ¡nh tráº¡ng thÃ¡i máº·c Ä‘á»‹nh**:
  - **Application Load Balancer (ALB)**: **Máº¶C Äá»ŠNH Báº¬T** vÃ  hoÃ n toÃ n **MIá»„N PHÃ** cÆ°á»›c truyá»n dá»¯ liá»‡u liÃªn AZ (\$0.00/GiB).
  - **Network Load Balancer (NLB)**: **Máº¶C Äá»ŠNH Táº®T**; náº¿u ngÆ°á»i dÃ¹ng chá»§ Ä‘á»™ng Báº¬T tÃ­nh nÄƒng nÃ y trÃªn NLB, AWS sáº½ **tÃ­nh phÃ­ cÆ°á»›c Data Transfer Inter-AZ (\$0.01/GiB)** cho má»—i chiá»u truyá»n nháº­n.

#### D. Quáº£n lÃ½ káº¿t ná»‘i & Xá»­ lÃ½ chá»©ng chá»‰ sá»‘ (SSL Termination & SNI)
* **SSL/TLS Termination**: ALB giáº£i mÃ£ káº¿t ná»‘i HTTPS ngay táº¡i Ä‘iá»ƒm tiáº¿p nháº­n cá»§a Load Balancer, giÃºp giáº£i phÃ³ng hoÃ n toÃ n gÃ¡nh náº·ng tÃ­nh toÃ¡n CPU máº­t mÃ£ cho cÃ¡c mÃ¡y chá»§ backend.
* **Server Name Indication (SNI)**: Cho phÃ©p má»™t Listener duy nháº¥t trÃªn cá»•ng 443 cá»§a ALB cÃ³ thá»ƒ náº¡p vÃ  phá»¥c vá»¥ **nhiá»u chá»©ng chá»‰ sá»‘ SSL/TLS khÃ¡c nhau cho nhiá»u tÃªn miá»n Ä‘á»™c láº­p** (vÃ­ dá»¥: `siteA.com`, `siteB.com`, `siteC.com` dÃ¹ng chung 1 ALB).
* **Mutual TLS (mTLS)**: ALB há»— trá»£ xÃ¡c thá»±c hai chiá»u qua chá»©ng chá»‰ sá»‘ X.509 giá»¯a client vÃ  Load Balancer, lÃ½ tÆ°á»Ÿng cho cÃ¡c káº¿t ná»‘i B2B an toÃ n tuyá»‡t Ä‘á»‘i.
* **Deregistration Delay (Connection Draining)**: Khoáº£ng thá»i gian Ã¢n háº¡n (máº·c Ä‘á»‹nh 300 giÃ¢y, cÃ³ thá»ƒ chá»‰nh tá»« 0 Ä‘áº¿n 3,600 giÃ¢y) Ä‘á»ƒ cÃ¡c yÃªu cáº§u Ä‘ang thá»±c thi dá»Ÿ dang (in-flight requests) hoÃ n táº¥t trÆ°á»›c khi mÃ¡y chá»§ bá»‹ gá»¡ khá»i Target Group hoáº·c bá»‹ ASG xÃ³a bá», ngÄƒn ngá»«a viá»‡c ngÆ°á»i dÃ¹ng bá»‹ ngáº¯t káº¿t ná»‘i Ä‘á»™t ngá»™t.

---

### 3. Auto Scaling Groups (ASG) & CÃ¡c chÃ­nh sÃ¡ch co giÃ£n hiá»‡n Ä‘áº¡i

```mermaid
flowchart TD
    ASG[Auto Scaling Group] --> Cap[Bá»™ Ba Tham Sá»‘ Äá»‹nh KÃ­ch Cá»¡]
    Cap --> Min[Minimum Size: Sá»‘ lÆ°á»£ng tá»‘i thiá»ƒu Ä‘áº£m báº£o HA]
    Cap --> Desired[Desired Capacity: Sá»‘ lÆ°á»£ng mÃ¡y chá»§ mong muá»‘n duy trÃ¬]
    Cap --> Max[Maximum Size: NgÆ°á»¡ng tráº§n tá»‘i Ä‘a chá»‘ng ná»• chi phÃ­]

    ASG --> Policies[CÃ¡c Chiáº¿n LÆ°á»£c Co GiÃ£n - Scaling Policies]
    Policies --> P1[1. Target Tracking Scaling\nBÃ¡m sÃ¡t má»¥c tiÃªu: CPU 60% hoáº·c ALB RequestCount 2,000]
    Policies --> P2[2. Step Scaling\nPháº£n há»“i Ä‘a cáº¥p Ä‘á»™ dá»±a trÃªn ngÆ°á»¡ng CloudWatch Alarm]
    Policies --> P3[3. Scheduled Scaling\nLáº­p lá»‹ch Ä‘á»‹nh ká»³ trÆ°á»›c cÃ¡c dá»‹p lá»… / cao Ä‘iá»ƒm]
    Policies --> P4[4. Predictive Scaling\nHá»c mÃ¡y AI phÃ¢n tÃ­ch lá»‹ch sá»­ 14 ngÃ y Ä‘á»ƒ báº­t mÃ¡y Ä‘Ã³n Ä‘áº§u]
```

1. **Target Tracking Scaling Policy (Chuáº©n má»±c thÃ´ng dá»¥ng nháº¥t)**:
   - Báº¡n chá»‰ cáº§n Ä‘áº·t ra má»™t con sá»‘ má»¥c tiÃªu (vÃ­ dá»¥: *"Duy trÃ¬ má»©c sá»­ dá»¥ng CPU trung bÃ¬nh á»Ÿ 60%"* hoáº·c *"Má»—i instance phá»¥c vá»¥ 1,500 requests/phÃºt"*). AWS sáº½ tá»± Ä‘á»™ng tÃ­nh toÃ¡n sá»‘ lÆ°á»£ng mÃ¡y chá»§ cáº§n tÄƒng hoáº·c giáº£m Ä‘á»ƒ giá»¯ á»•n Ä‘á»‹nh quanh con sá»‘ Ä‘Ã³. Ráº¥t phÃ¹ há»£p cho cÃ¡c mÃ´ hÃ¬nh táº£i biáº¿n thiÃªn mÆ°á»£t mÃ  vÃ  dá»± Ä‘oÃ¡n Ä‘Æ°á»£c xu hÆ°á»›ng.
2. **Step Scaling Policy (Xá»­ lÃ½ bÃ¹ng ná»• táº£i Ä‘á»™t biáº¿n khÃ´ng dá»± Ä‘oÃ¡n trÆ°á»›c)**:
   - Pháº£n á»©ng linh hoáº¡t theo cÃ¡c ngÆ°á»¡ng báº­c thang cá»§a CloudWatch Alarm (vÃ­ dá»¥: náº¿u CPU tá»« 70%â€“80% thÃ¬ thÃªm 1 mÃ¡y; náº¿u CPU vÆ°á»£t 85% thÃ¬ thÃªm ngay 3 mÃ¡y Ä‘á»ƒ á»©ng cá»©u kháº©n cáº¥p).
   - **Æ¯u Ä‘iá»ƒm vÆ°á»£t trá»™i so vá»›i Simple Scaling**: Simple Scaling báº¯t buá»™c pháº£i chá» háº¿t thá»i gian Cooldown (vÃ­ dá»¥ 300s) má»›i Ä‘Æ°á»£c Ä‘Ã¡nh giÃ¡ tiáº¿p, dá»… lÃ m sáº­p há»‡ thá»‘ng khi táº£i tÄƒng vá»t. **Step Scaling hoÃ n toÃ n khÃ´ng bá»‹ trÃ³i buá»™c bá»Ÿi Cooldown khi cÃ¡c ngÆ°á»¡ng Alarm má»›i bá»‹ kÃ­ch hoáº¡t**, cho phÃ©p scale-out tá»©c thá»i theo má»©c Ä‘á»™ nghiÃªm trá»ng cá»§a táº£i (*CM-PT1 Q30*).
3. **Scheduled Scaling Policy**:
   - Tá»± Ä‘á»™ng thay Ä‘á»•i Min/Desired/Max capacity theo lá»‹ch trÃ¬nh Ä‘á»‹nh sáºµn (vÃ­ dá»¥: tÄƒng mÃ¡y vÃ o 9h sÃ¡ng thá»© Hai má»Ÿ bÃ¡n vÃ© Flash Sale, háº¡ mÃ¡y lÃºc 23h Ä‘Ãªm) (*CM-PT2 Q34*).
4. **Predictive Scaling Policy**:
   - á»¨ng dá»¥ng mÃ´ hÃ¬nh Machine Learning phÃ¢n tÃ­ch dá»¯ liá»‡u lá»‹ch sá»­ táº£i cá»§a cÃ¡c tuáº§n trÆ°á»›c Ä‘Ã³ Ä‘á»ƒ tá»± Ä‘á»™ng khá»Ÿi cháº¡y mÃ¡y chá»§ trÆ°á»›c khi Ä‘á»£t tÄƒng táº£i diá»…n ra (vÃ­ dá»¥: báº­t mÃ¡y lÃºc 07:30 sÃ¡ng Ä‘á»ƒ Ä‘Ã³n Ä‘á»£t tÄƒng táº£i lÃºc 08:00).
5. **ASG Warm Pools & Instance Refresh**:
   - **Warm Pools**: Duy trÃ¬ má»™t cá»¥m mÃ¡y áº£o á»Ÿ tráº¡ng thÃ¡i dá»«ng (**Stopped**) Ä‘Ã£ cÃ i Ä‘áº·t sáºµn pháº§n má»m. Khi cáº§n scale-out, mÃ¡y chá»‰ máº¥t 30 giÃ¢y Ä‘á»ƒ Start thay vÃ¬ máº¥t 5â€“10 phÃºt Ä‘á»ƒ cÃ i Ä‘áº·t tá»« Ä‘áº§u qua User Data.
   - **Instance Refresh**: Cho phÃ©p triá»ƒn khai cáº­p nháº­t phiÃªn báº£n AMI má»›i theo cÆ¡ cháº¿ rolling update tá»«ng pháº§n vá»›i cÃ¡c chá»‘t kiá»ƒm tra sá»©c khá»e (**Checkpointing**) mÃ  khÃ´ng gÃ¢y giÃ¡n Ä‘oáº¡n há»‡ thá»‘ng.
6. **ASG Lifecycle Hooks (Can thiá»‡p vÃ²ng Ä‘á»i mÃ¡y áº£o)** (*TD-Set5 Q45*):
   - Cho phÃ©p táº¡m dá»«ng tiáº¿n trÃ¬nh Ä‘Æ°a mÃ¡y áº£o vÃ o hoáº¡t Ä‘á»™ng (`Pending:Wait`) hoáº·c tiáº¿n trÃ¬nh cháº¥m dá»©t mÃ¡y áº£o (`Terminating:Wait`) trong má»™t khoáº£ng thá»i gian chá» (Heartbeat Timeout - máº·c Ä‘á»‹nh 3,600 giÃ¢y).
   - **á»¨ng dá»¥ng sá»‘ng cÃ²n trong Ä‘á» thi**: Khi mÃ¡y áº£o bá»‹ ALB Ä‘Ã¡nh dáº¥u Unhealthy do lá»—i á»©ng dá»¥ng, ASG máº·c Ä‘á»‹nh sáº½ terminate mÃ¡y ngay láº­p tá»©c lÃ m máº¥t toÃ n bá»™ cÃ¡c ephemeral log cháº©n Ä‘oÃ¡n cá»¥c bá»™. Báº±ng cÃ¡ch thÃªm **Lifecycle Hook (`Terminating:Wait`)**, ASG giá»¯ mÃ¡y láº¡i á»Ÿ tráº¡ng thÃ¡i chá», phÃ¡t sá»± kiá»‡n qua Amazon EventBridge kÃ­ch hoáº¡t Lambda/SSM Run Command Ä‘áº©y toÃ n bá»™ file log lÃªn **CloudWatch Logs**, sau Ä‘Ã³ má»›i gá»i hÃ m `CompleteLifecycleAction` Ä‘á»ƒ tiáº¿p tá»¥c terminate instance an toÃ n!

---

### 4. AWS Global Accelerator â€” TÄƒng Tá»‘c LÆ°u LÆ°á»£ng Máº¡ng ToÃ n Cáº§u & Chuyá»ƒn Äá»•i Dá»± PhÃ²ng Tá»©c ThÃ¬ (Bypass DNS Caching)

```mermaid
flowchart TD
    Client[NgÆ°á»i dÃ¹ng toÃ n cáº§u: ChÃ¢u Ã, ChÃ¢u Ã‚u, Má»¹] -->|Káº¿t ná»‘i tá»›i 2 Anycast Static IPs cá»‘ Ä‘á»‹nh| Edge[AWS Global Network Edge Locations]
    
    subgraph AWSBackbone["Máº¡ng CÃ¡p Quang RiÃªng ToÃ n Cáº§u cá»§a AWS (AWS Private Global Backbone)"]
        direction TB
        Edge --> RouteEngine{Äá»‹nh Tuyáº¿n & Health Check}
        RouteEngine -->|Äá»™ trá»… tháº¥p nháº¥t| RegionPrimary["Region us-east-1 (Primary Endpoint)\nALB / NLB / EC2"]
        RouteEngine -.->|Tá»± Ä‘á»™ng Failover dÆ°á»›i 1 phÃºt khi sá»± cá»‘| RegionSecondary["Region eu-west-1 (Secondary Endpoint)\nALB / NLB / EC2"]
    end
```

* **CÆ¡ cháº¿ hoáº¡t Ä‘á»™ng**:
  - Cung cáº¥p **2 Ä‘á»‹a chá»‰ Anycast Static IPv4 cá»‘ Ä‘á»‹nh** duy nháº¥t Ä‘Ã³ng vai trÃ² lÃ m Ä‘iá»ƒm tiáº¿p nháº­n lÆ°u lÆ°á»£ng toÃ n cáº§u (Global Ingress).
  - Ngay táº¡i Ä‘iá»ƒm biÃªn (Edge Location) gáº§n ngÆ°á»i dÃ¹ng nháº¥t, lÆ°u lÆ°á»£ng Ä‘Æ°á»£c Ä‘Æ°a ngay vÃ o **Máº¡ng cÃ¡p quang riÃªng toÃ n cáº§u cá»§a AWS (AWS Global Private Fiber Backbone)**, hoÃ n toÃ n trÃ¡nh khá»i tÃ¬nh tráº¡ng ngháº½n máº¡ng vÃ  packet loss cá»§a máº¡ng Internet cÃ´ng cá»™ng.
* **Há»— trá»£ giao thá»©c Ä‘a dáº¡ng**:
  - Há»— trá»£ cáº£ **TCP vÃ  UDP** (trong khi CloudFront chá»‰ há»— trá»£ HTTP/HTTPS/WebSockets). Cá»±c ká»³ lÃ½ tÆ°á»Ÿng cho game online nhiá»u ngÆ°á»i chÆ¡i (Multiplayer Gaming), thoáº¡i qua máº¡ng (VoIP), streaming media, vÃ  thiáº¿t bá»‹ IoT (*CM-PT2 Q15, U-PT3 Q10*).
* **Kháº£ nÄƒng chuyá»ƒn Ä‘á»•i dá»± phÃ²ng tá»©c thÃ¬ (Bypassing DNS Caching)**:
  - Khi dÃ¹ng Route 53 Multi-Region Failover, viá»‡c chuyá»ƒn hÆ°á»›ng phá»¥ thuá»™c vÃ o TTL vÃ  DNS cache cá»§a client/ISP (cÃ³ thá»ƒ máº¥t tá»« vÃ i phÃºt Ä‘áº¿n hÃ ng giá» khiáº¿n ngÆ°á»i dÃ¹ng váº«n truy cáº­p vÃ o server bá»‹ lá»—i).
  - Vá»›i **AWS Global Accelerator**, Ä‘á»‹a chá»‰ IP cá»§a client káº¿t ná»‘i lÃ  **Cá» Äá»ŠNH**. Khi má»™t Region gáº·p sá»± cá»‘, há»‡ thá»‘ng Ä‘á»‹nh tuyáº¿n ná»™i bá»™ cá»§a AWS phÃ¡t hiá»‡n qua health check vÃ  **tá»± Ä‘á»™ng chuyá»ƒn hÆ°á»›ng lÆ°u lÆ°á»£ng sang Region lÃ nh láº·n cÃ²n láº¡i trong vÃ²ng dÆ°á»›i 1 phÃºt mÃ  hoÃ n toÃ n khÃ´ng bá»‹ áº£nh hÆ°á»Ÿng bá»Ÿi DNS caching** (*CM-PT1 Q40, U-PT1 Q58*).

---

#### So SÃ¡nh ToÃ n Diá»‡n: AWS Global Accelerator vs Amazon CloudFront

| TiÃªu chuáº©n so sÃ¡nh | AWS Global Accelerator | Amazon CloudFront |
|:---|:---|:---|
| **Má»¥c Ä‘Ã­ch chÃ­nh** | Tá»‘i Æ°u hÃ³a Ä‘á»‹nh tuyáº¿n máº¡ng qua cÃ¡p quang AWS cho TCP/UDP | Bá»™ nhá»› Ä‘á»‡m biÃªn (Edge Caching) cho website vÃ  media |
| **CÆ¡ cháº¿ Caching** | âŒ **KHÃ”NG CÃ“ Bá»˜ NHá»š Äá»†M** (LÆ°u lÆ°á»£ng luÃ´n truyá»n tháº³ng vá» backend) | âœ… **CÃ“ Bá»˜ NHá»š Äá»†M BIÃŠN** (LÆ°u trá»¯ HTML, CSS, áº£nh, video táº¡i Edge) |
| **Giao thá»©c há»— trá»£** | **TCP, UDP, HTTP, HTTPS** | **Chá»‰ HTTP, HTTPS, WebSockets** |
| **Äiá»ƒm cuá»‘i cung cáº¥p** | **2 Anycast Static IPv4 Addresses** cá»‘ Ä‘á»‹nh | TÃªn miá»n DNS Ä‘á»™ng (vÃ­ dá»¥: `d123.cloudfront.net`) |
| **Kháº£ nÄƒng chá»‘ng chá»‹u DNS Cache** | âœ… Tuyá»‡t Ä‘á»‘i (KhÃ´ng phá»¥ thuá»™c DNS resolver cá»§a mÃ¡y khÃ¡ch) | âŒ Phá»¥ thuá»™c vÃ o phÃ¢n giáº£i DNS cá»§a trÃ¬nh duyá»‡t vÃ  ISP |
| **Ká»‹ch báº£n chuáº©n thi cá»­** | Game UDP, á»©ng dá»¥ng tÃ i chÃ­nh TCP, failover Ä‘a Region nhanh | Website tÄ©nh S3, tÄƒng tá»‘c API REST, stream video HLS/DASH |

---

### ðŸ›ï¸ I. CÃ¡c Ká»‹ch Báº£n Kiáº¿n TrÃºc Chuáº©n (Best Practice Scenarios)

#### 1. Kiáº¿n TrÃºc Chá»‹u Lá»—i Cao Äa Táº§ng Máº«u Má»±c (ALB + Multi-AZ ASG + Multi-AZ RDS)
- **TÃ¬nh huá»‘ng thi**: XÃ¢y dá»±ng kiáº¿n trÃºc cho á»©ng dá»¥ng Web quan trá»ng cá»§a doanh nghiá»‡p. YÃªu cáº§u tÃ­nh sáºµn sÃ ng cao (High Availability), tá»± Ä‘á»™ng chá»‹u lá»—i (Fault-Tolerant) khi toÃ n bá»™ má»™t Availability Zone bá»‹ sáº­p mÃ  khÃ´ng lÃ m giÃ¡n Ä‘oáº¡n dá»‹ch vá»¥ cá»§a ngÆ°á»i dÃ¹ng cuá»‘i.
- **Giáº£i phÃ¡p tá»‘i Æ°u chuáº©n AWS**:
  - **Táº§ng Web / Load Balancer**: **Application Load Balancer (ALB)** Ä‘Æ°á»£c cáº¥u hÃ¬nh triá»ƒn khai trÃªn tá»‘i thiá»ƒu 2 Public Subnets á»Ÿ 2 AZs khÃ¡c nhau.
  - **Táº§ng á»¨ng Dá»¥ng (Compute Tier)**: MÃ¡y chá»§ EC2 cháº¡y trong Private Subnets, Ä‘Æ°á»£c quáº£n lÃ½ bá»Ÿi **Auto Scaling Group (ASG)** tráº£i dÃ i qua tá»‘i thiá»ƒu 2 hoáº·c 3 AZs.
  - **Táº§ng CÆ¡ Sá»Ÿ Dá»¯ Liá»‡u**: Sá»­ dá»¥ng **Amazon RDS Multi-AZ** (cháº¿ Ä‘á»™ Ä‘á»“ng bá»™ dá»¯ liá»‡u thá»i gian thá»±c sang Standby replica á»Ÿ AZ khÃ¡c vÃ  tá»± Ä‘á»™ng failover trong 60â€“120s).

#### 2. Äá»‹nh Tuyáº¿n Nhiá»u Dá»‹ch Vá»¥ TrÃªn Má»™t ALB Duy Nháº¥t (Path-Based & Host-Based Routing)
- **TÃ¬nh huá»‘ng thi**: Doanh nghiá»‡p chuyá»ƒn Ä‘á»•i kiáº¿n trÃºc Monolith sang Microservices gá»“m 3 dá»‹ch vá»¥: Giao diá»‡n web, API thanh toÃ¡n, vÃ  Quáº£n lÃ½ ngÆ°á»i dÃ¹ng. Cáº§n Ä‘á»‹nh tuyáº¿n yÃªu cáº§u tá»›i Ä‘Ãºng nhÃ³m mÃ¡y chá»§ vá»›i chi phÃ­ háº¡ táº§ng tháº¥p nháº¥t.
- **Giáº£i phÃ¡p chuáº©n**:
  - Triá»ƒn khai **DUY NHáº¤T má»™t Application Load Balancer**.
  - Thiáº¿t láº­p cÃ¡c **Listener Rules** vá»›i Ä‘iá»u kiá»‡n Ä‘á»‹nh tuyáº¿n:
    - Path Pattern `/api/payment/*` -> Chuyá»ƒn tiáº¿p tá»›i Target Group Thanh ToÃ¡n.
    - Path Pattern `/api/users/*` -> Chuyá»ƒn tiáº¿p tá»›i Target Group NgÆ°á»i DÃ¹ng.
    - Host Header `admin.example.com` -> Chuyá»ƒn tiáº¿p tá»›i Target Group Quáº£n Trá»‹.
  - Tiáº¿t kiá»‡m 66% chi phÃ­ so vá»›i viá»‡c táº¡o má»—i microservice má»™t Load Balancer riÃªng.

#### 3. Co GiÃ£n Äá»™ng Theo Táº£i Thá»±c Táº¿ Báº±ng Target Tracking Scaling Policy
- **TÃ¬nh huá»‘ng thi**: á»¨ng dá»¥ng cÃ³ lÆ°u lÆ°á»£ng truy cáº­p biáº¿n Ä‘á»™ng liÃªn tá»¥c trong ngÃ y. Cáº§n tá»± Ä‘á»™ng bá»• sung mÃ¡y chá»§ khi nhu cáº§u tÄƒng vÃ  tá»± Ä‘á»™ng táº¯t mÃ¡y chá»§ khi nhu cáº§u giáº£m Ä‘á»ƒ tiáº¿t kiá»‡m chi phÃ­, khÃ´ng cáº§n tÃ­nh toÃ¡n thá»§ cÃ´ng ngÆ°á»¡ng CloudWatch Alarm.
- **Giáº£i phÃ¡p chuáº©n**:
  - Cáº¥u hÃ¬nh chÃ­nh sÃ¡ch **Target Tracking Scaling Policy** trÃªn ASG.
  - Chá»n cÃ¡c chá»‰ sá»‘ Ä‘á»‹nh sáºµn:
    - `ASGAverageCPUUtilization` = 50% (giá»¯ CPU trung bÃ¬nh cá»§a cá»¥m á»Ÿ má»©c 50%).
    - `ALBRequestCountPerTarget` = 1000 (má»—i instance chá»‹u tá»‘i Ä‘a 1000 requests/phÃºt).
  - ASG tá»± Ä‘á»™ng tÃ­nh toÃ¡n sá»‘ lÆ°á»£ng instances cáº§n thÃªm hoáº·c bá»›t Ä‘á»ƒ giá»¯ chá»‰ sá»‘ bÃ¡m sÃ¡t má»¥c tiÃªu.

#### 4. Phá»¥c Vá»¥ Nhiá»u TÃªn Miá»n Äá»™c Láº­p Qua CÃ¹ng Má»™t ALB Báº±ng Server Name Indication (SNI) â€” (TD-Set3 Q20)
- **TÃ¬nh huá»‘ng thi**: CÃ´ng ty du lá»‹ch váº­n hÃ nh nhiá»u trang web khÃ¡c nhau (`i-love-manila.com`, `i-love-boracay.com`, `i-love-cebu.com`) trÃªn má»™t cá»¥m mÃ¡y chá»§ EC2 Auto Scaling. Cáº§n chuyá»ƒn Ä‘á»•i toÃ n bá»™ cÃ¡c trang web sang giao thá»©c báº£o máº­t HTTPS vá»›i chi phÃ­ tháº¥p nháº¥t mÃ  khÃ´ng cáº§n táº¡o riÃªng má»—i domain má»™t bá»™ cÃ¢n báº±ng táº£i vÃ  khÃ´ng pháº£i cáº¥p láº¡i chá»©ng chá»‰ sá»‘ khi bá»• sung thÃªm domain má»›i.
- **Giáº£i phÃ¡p tá»‘i Æ°u chuáº©n AWS**:
  - Sá»­ dá»¥ng má»™t **Application Load Balancer (ALB)** duy nháº¥t.
  - Táº£i toÃ n bá»™ chá»©ng chá»‰ SSL/TLS cá»§a cÃ¡c domain lÃªn **AWS Certificate Manager (ACM)**.
  - Gáº¯n nhiá»u chá»©ng chá»‰ SSL nÃ y vÃ o cÃ¹ng má»™t HTTPS Listener (cá»•ng 443) trÃªn ALB.
  - ALB tá»± Ä‘á»™ng sá»­ dá»¥ng pháº§n má»Ÿ rá»™ng **Server Name Indication (SNI)** cá»§a giao thá»©c TLS Ä‘á»ƒ phá»¥c vá»¥ chá»©ng chá»‰ sá»‘ chÃ­nh xÃ¡c tÆ°Æ¡ng á»©ng vá»›i tÃªn miá»n mÃ  ngÆ°á»i dÃ¹ng truy cáº­p.

#### 5. Tá»± Äá»™ng Thu Tháº­p Nháº­t KÃ½ á»¨ng Dá»¥ng Khi MÃ¡y Bá»‹ XÃ³a Báº±ng ASG Lifecycle Hooks â€” (TD-Set5 Q45)
- **TÃ¬nh huá»‘ng thi**: Khi má»™t mÃ¡y áº£o EC2 trong Auto Scaling Group bá»‹ Application Load Balancer Ä‘Ã¡nh dáº¥u Unhealthy (lá»—i HTTPS Health Check), ASG láº­p tá»©c cháº¥m dá»©t (terminate) mÃ¡y áº£o Ä‘Ã³, khiáº¿n toÃ n bá»™ cÃ¡c file log lá»—i cá»¥c bá»™ trÃªn mÃ¡y bá»‹ biáº¿n máº¥t vÄ©nh viá»…n vÃ  khÃ´ng thá»ƒ Ä‘iá»u tra nguyÃªn nhÃ¢n gá»‘c rá»… (Root Cause Analysis). Cáº§n tá»± Ä‘á»™ng hÃ³a viá»‡c thu tháº­p log trÆ°á»›c khi instance bá»‹ xÃ³a sá»•.
- **Giáº£i phÃ¡p chuáº©n**:
  - ThÃªm má»™t **Lifecycle Hook** vÃ o Auto Scaling Group Ä‘á»ƒ chuyá»ƒn cÃ¡c instance chuáº©n bá»‹ bá»‹ xÃ³a tá»« tráº¡ng thÃ¡i `Terminating` sang tráº¡ng thÃ¡i **`Terminating:Wait`** (hoÃ£n viá»‡c cháº¥m dá»©t mÃ¡y).
  - Cáº¥u hÃ¬nh má»™t **Amazon EventBridge Rule** báº¯t sá»± kiá»‡n `EC2 Instance-terminate Lifecycle Action` Ä‘á»ƒ kÃ­ch hoáº¡t má»™t hÃ m **AWS Lambda**.
  - HÃ m Lambda ra lá»‡nh cho CloudWatch Agent trÃªn instance Ä‘áº©y toÃ n bá»™ file log cá»¥c bá»™ lÃªn **CloudWatch Logs**.
  - Sau khi log Ä‘Æ°á»£c náº¡p xong, Lambda gá»i hÃ m `CompleteLifecycleAction` Ä‘á»ƒ cho phÃ©p ASG tiáº¿p tá»¥c tiáº¿n trÃ¬nh terminate instance an toÃ n.

---

### ðŸª¤ II. CÃ¡c Báº«y Thi Tinh Vi & PhÃ¢n TÃ­ch PhÆ°Æ¡ng Ãn Sai (Exam Traps & Distractors)

#### ðŸª¤ Báº«y 1: Táº¡m Dá»«ng Tiáº¿n TrÃ¬nh ASG & ÄÆ°a VÃ o Tráº¡ng ThÃ¡i Standby Khi Kháº¯c Phá»¥c Sá»± Cá»‘ MÃ¡y Chá»§ â€” (U-PT1 Q22)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t mÃ¡y chá»§ EC2 trong Auto Scaling Group bá»‹ Ä‘Ã¡nh dáº¥u lÃ  Unhealthy do á»©ng dá»¥ng bá»‹ crash. Ká»¹ sÆ° cáº§n giá»¯ nguyÃªn tráº¡ng thÃ¡i mÃ¡y chá»§ nÃ y Ä‘á»ƒ káº¿t ná»‘i vÃ o thu tháº­p log vÃ  Ä‘iá»u tra nguyÃªn nhÃ¢n cá»‘t lÃµi (troubleshoot). Cáº§n thá»±c hiá»‡n nhá»¯ng hÃ nh Ä‘á»™ng nÃ o? (Chá»n 2 Ä‘Ã¡p Ã¡n)"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *KhÃ´ng lÃ m gÃ¬ cáº£ vÃ  nhanh chÃ³ng SSH vÃ o*: ASG sáº½ láº­p tá»©c kÃ­ch hoáº¡t quy trÃ¬nh thay tháº¿ vÃ  **há»§y diá»‡t (Terminate)** mÃ¡y chá»§ lá»—i ngay sau Ä‘Ã³ -> ToÃ n bá»™ dá»¯ liá»‡u log trong bá»™ nhá»› vÃ  á»• Ä‘Ä©a bá»‹ máº¥t sáº¡ch!
  - âŒ *ThÃ¡o mÃ¡y chá»§ ra khá»i ASG (Detach)*: Tá»‘n cÃ´ng vÃ  cÃ³ thá»ƒ kÃ­ch hoáº¡t ASG sinh instance má»›i lÃ m sai lá»‡ch sá»‘ lÆ°á»£ng desired capacity.
- **Hai giáº£i phÃ¡p ÄÃšNG chuáº©n AWS (Chá»n 2)**:
  1. **Táº¡m dá»«ng (Suspend) tiáº¿n trÃ¬nh `ReplaceUnhealthy` trong Auto Scaling Group**: Thao tÃ¡c nÃ y ngÄƒn cháº·n ASG xÃ³a mÃ¡y chá»§ bá»‹ lá»—i. Ká»¹ sÆ° cÃ³ toÃ n bá»™ thá»i gian cáº§n thiáº¿t Ä‘á»ƒ Ä‘iá»u tra sá»± cá»‘. Sau khi sá»­a xong, kÃ­ch hoáº¡t láº¡i (`Resume`) tiáº¿n trÃ¬nh.
  2. **Chuyá»ƒn mÃ¡y chá»§ sang tráº¡ng thÃ¡i `Standby` (`aws autoscaling enter-standby`)**: Khi á»Ÿ tráº¡ng thÃ¡i Standby, mÃ¡y chá»§ táº¡m thá»i khÃ´ng nháº­n traffic tá»« Load Balancer, ASG khÃ´ng quáº£n lÃ½ kiá»ƒm tra sá»©c khá»e vÃ  khÃ´ng tá»± Ä‘á»™ng terminate nÃ³. Ká»¹ sÆ° thoáº£i mÃ¡i kiá»ƒm tra, sá»­a lá»—i; sau Ä‘Ã³ chuyá»ƒn láº¡i vá» `InService` (`exit-standby`).

#### ðŸª¤ Báº«y 2: TÃ­nh ToÃ¡n Dung LÆ°á»£ng Dá»± PhÃ²ng Chá»‹u Lá»—i Khi Máº¥t 1 AZ (N+1 Capacity Sizing) â€” (U-PT2 Q19, U-PT2 Q37)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Há»‡ thá»‘ng yÃªu cáº§u báº¯t buá»™c pháº£i duy trÃ¬ tá»‘i thiá»ƒu 8 mÃ¡y chá»§ hoáº¡t Ä‘á»™ng 100% cÃ´ng suáº¥t ká»ƒ cáº£ trong trÆ°á»ng há»£p xáº¥u nháº¥t lÃ  toÃ n bá»™ má»™t Availability Zone bá»‹ sáº­p. Cáº¥u hÃ¬nh nÃ o Ä‘Ã¡p á»©ng yÃªu cáº§u vá»›i CHI PHÃ THáº¤P NHáº¤T?"*
- **PhÃ¢n tÃ­ch toÃ¡n há»c kiáº¿n trÃºc**:
  - **PhÆ°Æ¡ng Ã¡n 2 AZs**: Má»—i AZ pháº£i gÃ¡nh \$8 \text{ instances}$ (Tá»•ng cá»™ng = 16 instances). Khi 1 AZ sáº­p, AZ cÃ²n láº¡i cÃ²n Ä‘Ãºng 8 instances -> Äáº¡t yÃªu cáº§u nhÆ°ng tá»‘n chi phÃ­ 16 mÃ¡y.
  - **PhÆ°Æ¡ng Ã¡n 3 AZs**: Má»—i AZ chá»‰ cáº§n bá»‘ trÃ­ **\$4 \text{ instances}$** (Tá»•ng cá»™ng = 12 instances). Khi 1 AZ báº¥t ká»³ bá»‹ sáº­p (máº¥t 4 instances), 2 AZs cÃ²n láº¡i váº«n cÃ³ \$4 + 4 = 8 \text{ instances}$ -> **Äáº¡t 100% cÃ´ng suáº¥t**!
  - **Káº¿t luáº­n**: Triá»ƒn khai trÃªn **3 AZs vá»›i 4 instances/AZ** tiáº¿t kiá»‡m hÆ¡n phÆ°Æ¡ng Ã¡n 2 AZs tá»›i **25% chi phÃ­ pháº§n cá»©ng dá»± phÃ²ng** (\$12 \text{ mÃ¡y}$ so vá»›i \$16 \text{ mÃ¡y}$).

#### ðŸª¤ Báº«y 3: Elastic Load Balancing KHÃ”NG PHáº¢I LÃ  Dá»‹ch Vá»¥ ToÃ n Cáº§u (ELB Is Regional) â€” (U-PT6 Q48)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p muá»‘n sá»­ dá»¥ng Elastic Load Balancing Ä‘á»ƒ cÃ¢n báº±ng táº£i giá»¯a cÃ¡c mÃ¡y chá»§ Web Ä‘áº·t táº¡i Region Singapore (ap-southeast-1) vÃ  Region Tokyo (ap-northeast-1)."*
- **NguyÃªn lÃ½ báº¥t biáº¿n**:
  - Má»i Load Balancer cá»§a AWS (ALB, NLB, Classic LB) Ä‘á»u lÃ  **tÃ i nguyÃªn thuá»™c pháº¡m vi 1 Region (Regional Resource)**.
  - ELB **KHÃ”NG THá»‚** phÃ¢n phá»‘i lÆ°u lÆ°á»£ng hoáº·c kiá»ƒm tra sá»©c khá»e trá»±c tiáº¿p xuyÃªn qua 2 Region khÃ¡c nhau.
- **Giáº£i phÃ¡p ÄÃšNG**:
  - Triá»ƒn khai ALB riÃªng biá»‡t táº¡i tá»«ng Region.
  - Sá»­ dá»¥ng **Amazon Route 53** (vá»›i chÃ­nh sÃ¡ch Latency-based Routing hoáº·c Geolocation Routing kÃ¨m Health Check) hoáº·c **AWS Global Accelerator** Ä‘á»ƒ Ä‘iá»u phá»‘i lÆ°u lÆ°á»£ng toÃ n cáº§u giá»¯a 2 Region.

#### ðŸª¤ Báº«y 4: Thá»© Tá»± Æ¯u TiÃªn Cá»§a ChÃ­nh SÃ¡ch Há»§y MÃ¡y Chá»§ Máº·c Äá»‹nh (Default Termination Policy) â€” (U-PT2 Q18)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Khi Auto Scaling Group kÃ­ch hoáº¡t sá»± kiá»‡n Scale-In (giáº£m táº£i), mÃ¡y chá»§ EC2 nÃ o sáº½ bá»‹ chá»n Ä‘á»ƒ cháº¥m dá»©t (terminate) Ä‘áº§u tiÃªn?"*
- **Quy trÃ¬nh Ä‘Ã¡nh giÃ¡ 4 bÆ°á»›c chuáº©n xÃ¡c**:
  1. **BÆ°á»›c 1 (Chá»n AZ)**: XÃ¡c Ä‘á»‹nh Availability Zone nÃ o Ä‘ang cÃ³ **nhiá»u instance nháº¥t** vÃ  cÃ³ Ã­t nháº¥t má»™t instance khÃ´ng Ä‘Æ°á»£c báº­t tÃ­nh nÄƒng Scale-In Protection.
  2. **BÆ°á»›c 2 (Chá»n cáº¥u hÃ¬nh cÅ© - Tie-breaker sá»‘ng cÃ²n U-PT2 Q18)**: Trong AZ Ä‘Ã³, tÃ¬m instance Ä‘Æ°á»£c khá»Ÿi táº¡o tá»« cáº¥u hÃ¬nh cÅ© nháº¥t theo thá»© tá»± Æ°u tiÃªn:
     - **Æ¯u tiÃªn 1**: Instance dÃ¹ng **Launch Configuration cÅ© nháº¥t (`OldestLaunchConfiguration`)**.
     - **Æ¯u tiÃªn 2**: Náº¿u khÃ´ng cÃ³ hoáº·c cÃ¹ng loáº¡i, chá»n instance dÃ¹ng **Launch Template cÅ© nháº¥t (`OldestLaunchTemplate`)**.
     - *LÃ½ do*: AWS khuyáº¿n khÃ­ch chuyá»ƒn dá»‹ch hoÃ n toÃ n tá»« Launch Configuration sang Launch Template, nÃªn cÃ¡c mÃ¡y dÃ¹ng Launch Configuration cÅ© luÃ´n bá»‹ Ä‘Ã o tháº£i trÆ°á»›c.
  3. **BÆ°á»›c 3 (Tá»‘i Æ°u giá» thanh toÃ¡n)**: Náº¿u váº«n cÃ³ nhiá»u instance trÃ¹ng cáº¥u hÃ¬nh, chá»n instance **gáº§n tá»›i má»‘c chu ká»³ tÃ­nh cÆ°á»›c giá» tiáº¿p theo nháº¥t** (Closest to the next billing hour).
  4. **BÆ°á»›c 4 (Ngáº«u nhiÃªn)**: Náº¿u táº¥t cáº£ cÃ¡c tiÃªu chÃ­ trÃªn Ä‘á»u nhÆ° nhau, chá»n ngáº«u nhiÃªn má»™t instance.

#### ðŸª¤ Báº«y 5: YÃªu Cáº§u CÃ¢n Báº±ng Táº£i Cung Cáº¥p IP TÄ©nh vÃ  Há»— Trá»£ Hybrid Targets â€” (CM-PT2 Q61, CM-PT3 Q14, CM-PT5 Q49)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p tÃ­ch há»£p há»‡ thá»‘ng thanh toÃ¡n vá»›i cÃ¡c Ä‘á»‘i tÃ¡c tÃ i chÃ­nh ngÃ¢n hÃ ng. Äá»‘i tÃ¡c yÃªu cáº§u Load Balancer pháº£i cÃ³ Ä‘á»‹a chá»‰ IP tÄ©nh cÃ´ng khai (Static / Elastic IP) Ä‘á»ƒ cáº¥u hÃ¬nh má»Ÿ tÆ°á»ng lá»­a (IP Whitelisting). NgoÃ i ra, há»‡ thá»‘ng cáº§n cÃ¢n báº±ng táº£i lÆ°u lÆ°á»£ng Ä‘á»“ng thá»i giá»¯a cÃ¡c mÃ¡y chá»§ EC2 trÃªn AWS vÃ  cá»¥m mÃ¡y chá»§ váº­t lÃ½ On-Premises. Chá»n loáº¡i cÃ¢n báº±ng táº£i nÃ o?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *DÃ¹ng Application Load Balancer (ALB)*: ALB khÃ´ng há»— trá»£ gÃ¡n Ä‘á»‹a chá»‰ IP tÄ©nh cÃ´ng khai (ALB chá»‰ cung cáº¥p DNS Name vÃ  IP thay Ä‘á»•i liÃªn tá»¥c).
- **Giáº£i phÃ¡p ÄÃšNG**: **Network Load Balancer (NLB)**.
  - NLB hoáº¡t Ä‘á»™ng á»Ÿ Layer 4 (TCP/UDP), cho phÃ©p gÃ¡n trá»±c tiáº¿p **Elastic IP cá»‘ Ä‘á»‹nh cho tá»«ng Availability Zone**.
  - Target Group cá»§a NLB há»— trá»£ loáº¡i **IP addresses**, cho phÃ©p khai bÃ¡o cáº£ Private IP cá»§a cÃ¡c mÃ¡y chá»§ On-Premises káº¿t ná»‘i qua Direct Connect hoáº·c VPN Ä‘á»ƒ cÃ¢n báº±ng táº£i há»—n há»£p (Hybrid Architecture).

#### ðŸª¤ Báº«y 6: Duy TrÃ¬ PhiÃªn NgÆ°á»i DÃ¹ng Cho á»¨ng Dá»¥ng Web Stateful Báº±ng ALB Sticky Sessions â€” (CM-PT6 Q40)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t á»©ng dá»¥ng web thÆ°Æ¡ng máº¡i cá»• Ä‘iá»ƒn lÆ°u trá»¯ thÃ´ng tin giá» hÃ ng vÃ  phiÃªn Ä‘Äƒng nháº­p trá»±c tiáº¿p trong bá»™ nhá»› RAM cá»§a tá»«ng mÃ¡y chá»§ EC2 (Stateful Sessions). Khi triá»ƒn khai cá»¥m mÃ¡y chá»§ phÃ­a sau Application Load Balancer, ngÆ°á»i dÃ¹ng liÃªn tá»¥c phÃ n nÃ n bá»‹ máº¥t giá» hÃ ng khi click chuyá»ƒn trang. Cáº§n giáº£i phÃ¡p xá»­ lÃ½ ngay mÃ  khÃ´ng sá»­a code á»©ng dá»¥ng."*
- **Giáº£i phÃ¡p ÄÃšNG**: Báº­t tÃ­nh nÄƒng **Sticky Sessions (Session Affinity)** trÃªn Target Group cá»§a Application Load Balancer.
  - ALB sá»­ dá»¥ng cookie (hoáº·c mÃ£ hÃ³a cookie tÃ¹y chá»‰nh tá»« á»©ng dá»¥ng) Ä‘á»ƒ nháº­n diá»‡n ngÆ°á»i dÃ¹ng vÃ  Ä‘áº£m báº£o toÃ n bá»™ cÃ¡c HTTP requests tiáº¿p theo cá»§a client Ä‘Ã³ luÃ´n Ä‘Æ°á»£c chuyá»ƒn hÆ°á»›ng chÃ­nh xÃ¡c tá»›i cÃ¹ng má»™t mÃ¡y chá»§ backend ban Ä‘áº§u.

#### ðŸª¤ Báº«y 7: ChÃ¨n TÆ°á»ng Lá»­a áº¢o Kiá»ƒm Tra GÃ³i Tin SÃ¢u L3/L4 Báº±ng Gateway Load Balancer (GWLB) â€” (CM-PT2 Q48)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p yÃªu cáº§u chÃ¨n cá»¥m thiáº¿t bá»‹ tÆ°á»ng lá»­a áº£o cá»§a bÃªn thá»© 3 (Firewalls, IDS/IPS) Ä‘á»ƒ kiá»ƒm tra gÃ³i tin sÃ¢u cho toÃ n bá»™ luá»“ng máº¡ng ra vÃ o VPC mÃ  khÃ´ng lÃ m Ä‘á»©t káº¿t ná»‘i hay thay Ä‘á»•i IP header gá»‘c."*
- **Giáº£i phÃ¡p ÄÃšNG**: **Gateway Load Balancer (GWLB)**.
  - Hoáº¡t Ä‘á»™ng á»Ÿ OSI Layer 3 (Network Layer), sá»­ dá»¥ng giao thá»©c **GENEVE (port UDP 6081)** Ä‘á»ƒ dáº«n toÃ n bá»™ gÃ³i tin nguyÃªn báº£n qua cá»¥m firewall áº£o vÃ  tá»± Ä‘á»™ng kiá»ƒm tra sá»©c khá»e, cÃ¢n báº±ng táº£i giá»¯a cÃ¡c firewall instances.

#### ðŸª¤ Báº«y 8: PhÃ¢n Bá»• Táº£i Äá»“ng Äá»u Giá»¯a CÃ¡c AZ: Cross-Zone Load Balancing TrÃªn ALB vs NLB â€” (TD-Set6 Q28, U-PT3 Q39)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng phÃ¡t trá»±c tuyáº¿n video cháº¡y trÃªn Auto Scaling Group cá»§a EC2 trÃªn nhiá»u AZs. Cáº§n cáº¥u hÃ¬nh bá»™ cÃ¢n báº±ng táº£i phÃ¢n phá»‘i cÃ¡c yÃªu cáº§u Ä‘áº¿n Ä‘á»“ng Ä‘á»u cho táº¥t cáº£ cÃ¡c mÃ¡y áº£o trÃªn má»i AZ."*
- **Quy táº¯c phÃ¢n biá»‡t tráº¡ng thÃ¡i Cross-Zone Load Balancing**:
  - Vá»›i **Application Load Balancer (ALB)**: TÃ­nh nÄƒng Cross-Zone Load Balancing **luÃ´n luÃ´n Ä‘Æ°á»£c Báº¬T máº·c Ä‘á»‹nh á»Ÿ cáº¥p Ä‘á»™ Load Balancer** vÃ  hoÃ n toÃ n miá»…n phÃ­ (khÃ´ng thá»ƒ táº¯t).
  - Vá»›i **Network Load Balancer (NLB)**: Máº·c Ä‘á»‹nh tÃ­nh nÄƒng nÃ y bá»‹ **Táº®T**. Muá»‘n phÃ¢n bá»• Ä‘á»u traffic tá»›i cÃ¡c target xuyÃªn AZ, ngÆ°á»i dÃ¹ng **báº¯t buá»™c pháº£i chá»§ Ä‘á»™ng Báº¬T Cross-Zone Load Balancing trÃªn NLB Target Group** (AWS cÃ³ tÃ­nh phÃ­ data transfer cross-AZ).
- **Giáº£i phÃ¡p ÄÃšNG**: Äáº£m báº£o **Cross-zone load balancing** Ä‘Æ°á»£c kÃ­ch hoáº¡t Ä‘á»ƒ má»—i node load balancer phÃ¢n phá»‘i Ä‘á»u cÃ¡c request cho cÃ¡c target á»Ÿ má»i AZ.
- **BÃ i toÃ¡n thá»±c táº¿ phÃ¢n bá»• táº£i khi Báº¬T vs Táº®T Cross-Zone (U-PT3 Q39)**:
  Giáº£ sá»­ há»‡ thá»‘ng cÃ³ 2 AZs: AZ-A cÃ³ **1 instance**, AZ-B cÃ³ **4 instances** (Tá»•ng 5 instances).
  - **Khi Táº®T Cross-Zone Load Balancing**:
    - DNS phÃ¢n bá»• 50% traffic tá»›i Node LB á»Ÿ AZ-A vÃ  50% traffic tá»›i Node LB á»Ÿ AZ-B.
    - 1 instance á»Ÿ AZ-A pháº£i gÃ¡nh trá»n váº¹n **50% tá»•ng lÆ°u lÆ°á»£ng** há»‡ thá»‘ng!
    - 4 instances á»Ÿ AZ-B chia Ä‘á»u 50% lÆ°u lÆ°á»£ng $\rightarrow$ Má»—i instance chá»‰ gÃ¡nh \(50\% / 4 = \mathbf{12.5\%}\)!
    - $\rightarrow$ *Há»‡ quáº£*: Instance á»Ÿ AZ-A bá»‹ quÃ¡ táº£i nghiÃªm trá»ng gáº¥p 4 láº§n so vá»›i cÃ¡c mÃ¡y á»Ÿ AZ-B!
  - **Khi Báº¬T Cross-Zone Load Balancing**:
    - Cáº£ 2 Node LB Ä‘á»u phÃ¢n bá»• lÆ°u lÆ°á»£ng Ä‘á»u cho toÃ n bá»™ 5 instances trÃªn cáº£ 2 AZ.
    - Má»—i instance nháº­n Ä‘Ãºng \(100\% / 5 = \mathbf{20\%}\) tá»•ng lÆ°u lÆ°á»£ng $\rightarrow$ Táº£i cÃ¢n báº±ng hoÃ n háº£o!

#### ðŸª¤ Báº«y 9: Táº¡o Nhiá»u Load Balancer Cho Tá»«ng Domain HTTPS Thay VÃ¬ DÃ¹ng SNI â€” (TD-Set3 Q20)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p sá»Ÿ há»¯u 10 tÃªn miá»n Ä‘á»™c láº­p cáº§n chuyá»ƒn sang HTTPS. Äá»™i ngÅ© Ä‘á» xuáº¥t khá»Ÿi táº¡o 10 Application Load Balancers riÃªng biá»‡t Ä‘á»ƒ gáº¯n tá»«ng chá»©ng chá»‰ SSL cá»§a tá»«ng domain."*
- **PhÆ°Æ¡ng Ã¡n báº«y**: Ráº¥t tá»‘n kÃ©m chi phÃ­ (10 ALBs $\approx \$220\text{/thÃ¡ng}$ tiá»n phÃ­ duy trÃ¬ cÆ¡ sá»Ÿ chÆ°a tÃ­nh LCU), phá»©c táº¡p váº­n hÃ nh vÃ  lÃ£ng phÃ­ tÃ i nguyÃªn.
- **Giáº£i phÃ¡p ÄÃšNG**: Chá»‰ cáº§n sá»­ dá»¥ng **1 Application Load Balancer duy nháº¥t**. Báº­t tÃ­nh nÄƒng **Server Name Indication (SNI)** vÃ  gáº¯n toÃ n bá»™ 10 chá»©ng chá»‰ SSL vÃ o chung má»™t HTTPS listener (cá»•ng 443).

#### ðŸª¤ Báº«y 10: VÃ¡ Lá»—i An ToÃ n Cho MÃ¡y Chá»§ Náº±m Sau ALB Báº±ng SSM Automation â€” (U-PT4 Q02)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng render ná»™i dung cháº¡y trÃªn cá»¥m EC2 Ä‘Äƒng kÃ½ vá»›i Application Load Balancer (ALB). Doanh nghiá»‡p sá»­ dá»¥ng AWS Systems Manager Ä‘á»ƒ cáº­p nháº­t báº£n vÃ¡ Ä‘á»‹nh ká»³. YÃªu cáº§u tuÃ¢n thá»§ má»›i báº¯t buá»™c cÃ¡c EC2 instance pháº£i Ä‘Æ°á»£c rÃºt khá»i lÆ°u lÆ°á»£ng sáº£n xuáº¥t (deregister khá»i ALB) má»™t cÃ¡ch an toÃ n trong lÃºc vÃ¡ lá»—i Ä‘á»ƒ trÃ¡nh lá»—i 502/timeout cho ngÆ°á»i dÃ¹ng, sau Ä‘Ã³ tá»± Ä‘á»™ng Ä‘Äƒng kÃ½ láº¡i khi vÃ¡ xong."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *DÃ¹ng CloudWatch Logs theo dÃµi rá»“i Ä‘iá»u chá»‰nh target group thá»§ cÃ´ng*: Dá»… sai sÃ³t vÃ  cháº­m trá»…, khÃ´ng tá»± Ä‘á»™ng hÃ³a.
  - âŒ *Äá»•i Target Group sang IP-based hoáº·c vÃ´ hiá»‡u hÃ³a card máº¡ng qua Lambda*: GÃ¢y Ä‘á»©t gÃ£y káº¿t ná»‘i in-flight vÃ  khÃ´ng kiá»ƒm soÃ¡t Ä‘Æ°á»£c connection draining.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **AWS Systems Manager Automation** vá»›i document chuáº©n **`AWSEC2-PatchLoadBalancerInstance`** káº¿t há»£p **SSM Maintenance Windows**.
  - Document nÃ y Ä‘Æ°á»£c AWS thiáº¿t káº¿ chuyÃªn dá»¥ng: tá»± Ä‘á»™ng deregister instance khá»i ALB target group, chá» Ä‘á»£i connection draining hoÃ n táº¥t cÃ¡c request Ä‘ang xá»­ lÃ½ dá»Ÿ, thá»±c hiá»‡n cÃ i Ä‘áº·t báº£n vÃ¡, reboot instance náº¿u cáº§n, kiá»ƒm tra health check vÃ  tá»± Ä‘á»™ng re-register instance vÃ o ALB!

#### ðŸª¤ Báº«y 11: Sá»± KhÃ¡c Biá»‡t Giá»¯a ASG Health Check vÃ  ALB Health Check â€” (U-PT4 Q35)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Há»‡ thá»‘ng streaming cháº¡y trÃªn EC2 Ä‘Æ°á»£c quáº£n lÃ½ bá»Ÿi Auto Scaling Group Ä‘áº±ng sau Application Load Balancer. Khi á»©ng dá»¥ng web bÃªn trong mÃ¡y chá»§ bá»‹ crash (tráº£ vá» lá»—i HTTP 500/503), ALB phÃ¡t hiá»‡n vÃ  chuyá»ƒn tráº¡ng thÃ¡i target thÃ nh Unhealthy. Tuy nhiÃªn, Auto Scaling Group váº«n KHÃ”NG THá»‚ thay tháº¿ instance lá»—i nÃ y mÃ  tiáº¿p tá»¥c Ä‘á»ƒ nÃ³ cháº¡y. NguyÃªn nhÃ¢n cá»‘t lÃµi lÃ  gÃ¬?"*
- **Báº£n cháº¥t ká»¹ thuáº­t sá»‘ng cÃ²n**:
  - Máº·c Ä‘á»‹nh, Auto Scaling Group chá»‰ sá»­ dá»¥ng **EC2 Health Checks** (chá»‰ kiá»ƒm tra tráº¡ng thÃ¡i pháº§n cá»©ng hypervisor cá»§a mÃ¡y chá»§ váº­t lÃ½). Náº¿u pháº§n cá»©ng váº«n báº­t, ASG coi mÃ¡y áº£o lÃ  "Healthy", báº¥t ká»ƒ á»©ng dá»¥ng web bÃªn trong Ä‘Ã£ sáº­p hoÃ n toÃ n!
  - Trong khi Ä‘Ã³, **ALB Health Checks** gá»­i HTTP ping trá»±c tiáº¿p vÃ o á»©ng dá»¥ng web Ä‘á»‹nh ká»³ (vÃ­ dá»¥ `/healthz`).
- **Giáº£i phÃ¡p ÄÃšNG**: Báº¯t buá»™c pháº£i chuyá»ƒn cáº¥u hÃ¬nh **Health Check Type cá»§a Auto Scaling Group sang `ELB`** (thay vÃ¬ chá»‰ Ä‘á»ƒ `EC2`). Khi Ä‘Ã³, báº¥t cá»© khi nÃ o ALB Ä‘Ã¡nh giÃ¡ target lÃ  Unhealthy, ASG sáº½ láº­p tá»©c kÃ­ch hoáº¡t quy trÃ¬nh terminate instance lá»—i vÃ  khá»Ÿi táº¡o instance má»›i thay tháº¿!

#### ðŸª¤ Báº«y 12: Co GiÃ£n Tá»± Äá»™ng Theo Chiá»u DÃ i HÃ ng Äá»£i SQS (Backlog-Based Auto Scaling) â€” (U-PT4 Q04)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Há»‡ thá»‘ng logistics xá»­ lÃ½ Ä‘Æ¡n hÃ ng gá»“m 2 giai Ä‘oáº¡n: tiáº¿p nháº­n Ä‘Æ¡n hÃ ng (job intake) vÃ  xá»­ lÃ½ phÃ¢n tÃ­ch Ä‘Æ¡n hÃ ng (job processing). LÆ°á»£ng Ä‘Æ¡n hÃ ng biáº¿n Ä‘á»™ng ráº¥t lá»›n theo tá»«ng giá». Cáº§n kiáº¿n trÃºc tÃ¡ch rá»i 2 giai Ä‘oáº¡n vÃ  tá»± Ä‘á»™ng co giÃ£n cÃ¡c cá»¥m mÃ¡y chá»§ worker Ä‘á»™c láº­p dá»±a trÃªn khá»‘i lÆ°á»£ng cÃ´ng viá»‡c Ä‘ang tá»“n Ä‘á»ng."*
- **Giáº£i phÃ¡p ÄÃšNG**: Thiáº¿t láº­p **2 hÃ ng Ä‘á»£i Amazon SQS Ä‘á»™c láº­p** (Queue 1 cho intake, Queue 2 cho processing) vÃ  cáº¥u hÃ¬nh **Auto Scaling Group co giÃ£n dá»±a trÃªn sá»‘ lÆ°á»£ng tin nháº¯n trong hÃ ng Ä‘á»£i** (`ApproximateNumberOfMessagesVisible`).
  - PhÃ¢n tÃ¡ch hoÃ n toÃ n sá»± phá»¥ thuá»™c giá»¯a táº§ng tiáº¿p nháº­n vÃ  táº§ng xá»­ lÃ½.
  - Cáº¥u hÃ¬nh metric toÃ¡n há»c chuáº©n: `Backlog Per Instance = SQS Queue Length / Running ASG Capacity` káº¿t há»£p Target Tracking Policy Ä‘á»ƒ tÄƒng/giáº£m worker ká»‹p thá»i khi Ä‘Æ¡n hÃ ng dá»“n á»©.

#### ðŸª¤ Báº«y 13: Cáº¥u HÃ¬nh Minimum Capacity TrÃ¡nh Sáº­p ToÃ n Bá»™ á»¨ng Dá»¥ng Khi Giáº£m Táº£i â€” (U-PT4 Q29)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng y táº¿ trá»±c tuyáº¿n ghi nháº­n lÆ°u lÆ°á»£ng truy cáº­p giáº£m máº¡nh vÃ o ban Ä‘Ãªm. Khi tÃ­nh nÄƒng Auto Scaling kÃ­ch hoáº¡t giáº£m táº£i (Scale-In), toÃ n bá»™ cÃ¡c mÃ¡y chá»§ EC2 bá»‹ táº¯t háº¿t khiáº¿n cÃ¡c bá»‡nh nhÃ¢n cáº¥p cá»©u ná»­a Ä‘Ãªm khÃ´ng thá»ƒ truy cáº­p há»‡ thá»‘ng. Cáº§n cáº¥u hÃ¬nh thÃ´ng sá»‘ nÃ o Ä‘á»ƒ luÃ´n Ä‘áº£m báº£o cÃ³ sáºµn má»™t sá»‘ lÆ°á»£ng mÃ¡y chá»§ tá»‘i thiá»ƒu phá»¥c vá»¥ 24/7?"*
- **Giáº£i phÃ¡p ÄÃšNG**: Cáº¥u hÃ¬nh thuá»™c tÃ­nh **Minimum Capacity (`min-size`)** cá»§a Auto Scaling Group lá»›n hÆ¡n hoáº·c báº±ng má»©c nÄƒng lá»±c tá»‘i thiá»ƒu báº¯t buá»™c (vÃ­ dá»¥: `Min = 2` tráº£i trÃªn 2 AZs). ASG sáº½ khÃ´ng bao giá» giáº£m sá»‘ lÆ°á»£ng instance xuá»‘ng dÆ°á»›i ngÆ°á»¡ng nÃ y, báº¥t ká»ƒ lÆ°u lÆ°á»£ng CPU hay network xuá»‘ng tháº¥p Ä‘áº¿n Ä‘Ã¢u.

#### ðŸª¤ Báº«y 14: Giá»›i Háº¡n Pháº¡m Vi VÃ¹ng Cá»§a Auto Scaling Group (ASG Is Regional) â€” (U-PT4 Q58)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p SaaS muá»‘n thiáº¿t káº¿ kiáº¿n trÃºc cÃ³ tÃ­nh sáºµn sÃ ng cao cho á»©ng dá»¥ng web. Má»™t ká»¹ sÆ° Ä‘á» xuáº¥t cáº¥u hÃ¬nh má»™t Auto Scaling Group duy nháº¥t tráº£i dÃ i trÃªn cÃ¡c Availability Zone thuá»™c hai AWS Regions khÃ¡c nhau (vÃ­ dá»¥: us-east-1 vÃ  us-west-2) vÃ  Ä‘Äƒng kÃ½ vÃ o chung má»™t ALB. Äá» xuáº¥t nÃ y cÃ³ kháº£ thi khÃ´ng?"*
- **NguyÃªn lÃ½ báº¥t biáº¿n**:
  - **Auto Scaling Group vÃ  Application Load Balancer Ä‘á»u lÃ  tÃ i nguyÃªn cáº¥p VÃ¹ng (Regional Resource)**.
  - ASG **KHÃ”NG THá»‚ tráº£i dÃ i qua nhiá»u Regions**; ASG chá»‰ cÃ³ thá»ƒ bao phá»§ nhiá»u Availability Zones trong **CÃ™NG Má»˜T Region**.
- **Giáº£i phÃ¡p ÄÃšNG**: Cáº¥u hÃ¬nh Auto Scaling Group tráº£i trÃªn **nhiá»u Availability Zones trong 1 Region duy nháº¥t** Ä‘áº±ng sau má»™t Application Load Balancer cáº¥p Region. Náº¿u muá»‘n má»Ÿ rá»™ng Ä‘a Region, pháº£i táº¡o 2 ASG Ä‘á»™c láº­p á»Ÿ 2 Region vÃ  Ä‘iá»u phá»‘i báº±ng **Amazon Route 53** hoáº·c **AWS Global Accelerator**.

#### ðŸª¤ Báº«y 15: TÄƒng Tá»‘c LÆ°u LÆ°á»£ng TCP/UDP & Bá» Qua Bá»™ Nhá»› Äá»‡m DNS Báº±ng AWS Global Accelerator â€” (CM-PT1 Q40, CM-PT2 Q15, U-PT1 Q58, U-PT3 Q10)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng game online toÃ n cáº§u sá»­ dá»¥ng giao thá»©c UDP Ä‘á»™c quyá»n yÃªu cáº§u Ä‘á»™ trá»… tháº¥p nháº¥t cÃ³ thá»ƒ cho game thá»§ trÃªn toÃ n tháº¿ giá»›i. NgoÃ i ra, khi xáº£y ra sá»± cá»‘ táº¡i Region chÃ­nh, há»‡ thá»‘ng pháº£i tá»± Ä‘á»™ng chuyá»ƒn Ä‘á»•i sang Region dá»± phÃ²ng trong vÃ²ng dÆ°á»›i 1 phÃºt mÃ  khÃ´ng bá»‹ áº£nh hÆ°á»Ÿng bá»Ÿi viá»‡c cÃ¡c nhÃ  máº¡ng (ISP) vÃ  trÃ¬nh duyá»‡t ngÆ°á»i dÃ¹ng lÆ°u cache báº£n ghi DNS (bypassing DNS caching). Dá»‹ch vá»¥ nÃ o Ä‘Ã¡p á»©ng tá»‘i Æ°u?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Sá»­ dá»¥ng Amazon CloudFront*: Sai vÃ¬ CloudFront chá»‰ há»— trá»£ HTTP/HTTPS/WebSocket, hoÃ n toÃ n KHÃ”NG há»— trá»£ giao thá»©c UDP cá»§a game.
  - âŒ *Sá»­ dá»¥ng Amazon Route 53 Failover Routing*: Route 53 phá»¥ thuá»™c vÃ o giÃ¡ trá»‹ TTL cá»§a báº£n ghi DNS. Nhiá»u ISP vÃ  á»©ng dá»¥ng mÃ¡y khÃ¡ch tá»± Ã½ lÆ°u cache IP hÃ ng chá»¥c phÃºt báº¥t cháº¥p TTL ngáº¯n, khiáº¿n game thá»§ váº«n gá»­i gÃ³i tin vÃ o Region bá»‹ sáº­p.
- **Giáº£i phÃ¡p ÄÃšNG**: Triá»ƒn khai **AWS Global Accelerator**.
  - Cung cáº¥p **2 Ä‘á»‹a chá»‰ Anycast Static IPv4** cá»‘ Ä‘á»‹nh khÃ´ng bao giá» thay Ä‘á»•i, giáº£i quyáº¿t triá»‡t Ä‘á»ƒ váº¥n Ä‘á» DNS caching.
  - Há»— trá»£ Ä‘áº§y Ä‘á»§ giao thá»©c **UDP vÃ  TCP**.
  - Tá»± Ä‘á»™ng phÃ¡t hiá»‡n endpoint há»ng qua health check ná»™i bá»™ vÃ  chuyá»ƒn hÆ°á»›ng lÆ°u lÆ°á»£ng sang Region lÃ nh láº·n trong vÃ²ng **vÃ i chá»¥c giÃ¢y** qua máº¡ng cÃ¡p quang riÃªng cá»§a AWS.

#### ðŸª¤ Báº«y 16: Pháº£n á»¨ng Vá»›i Äá»£t TÄƒng Táº£i Äá»™t Biáº¿n KhÃ³ Dá»± ÄoÃ¡n Báº±ng Step Scaling â€” (CM-PT1 Q30, CM-PT2 Q34)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Trang web thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ thá»‰nh thoáº£ng cÃ³ cÃ¡c Ä‘á»£t phÃ¡t sÃ³ng quáº£ng cÃ¡o truyá»n hÃ¬nh Ä‘á»™t xuáº¥t, lÆ°á»£ng truy cáº­p tÄƒng vá»t gáº¥p 10 láº§n chá»‰ trong vÃ i chá»¥c giÃ¢y. NhÃ³m ká»¹ sÆ° nháº­n tháº¥y chÃ­nh sÃ¡ch Target Tracking vÃ  Simple Scaling pháº£n á»©ng quÃ¡ cháº­m cháº¡p do thá»i gian chá» Cooldown khiáº¿n há»‡ thá»‘ng bá»‹ sáº­p trÆ°á»›c khi mÃ¡y chá»§ má»›i ká»‹p khá»Ÿi Ä‘á»™ng. Cáº§n chá»n chÃ­nh sÃ¡ch co giÃ£n nÃ o?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Sá»­ dá»¥ng Simple Scaling*: Báº¯t buá»™c pháº£i Ä‘á»£i háº¿t thá»i gian Cooldown giá»¯a má»—i láº§n scale, khÃ´ng thá»ƒ má»Ÿ rá»™ng nhiá»u cáº¥p Ä‘á»™ cÃ¹ng lÃºc khi táº£i tÄƒng vá»t.
  - âŒ *Sá»­ dá»¥ng Scheduled Scaling*: KhÃ´ng kháº£ thi vÃ¬ cÃ¡c Ä‘á»£t phÃ¡t sÃ³ng truyá»n hÃ¬nh hoáº·c tin tá»©c viral diá»…n ra ngáº«u nhiÃªn, khÃ´ng cÃ³ lá»‹ch trÃ¬nh cá»‘ Ä‘á»‹nh.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Step Scaling Policy**.
  - Cho phÃ©p Ä‘á»‹nh nghÄ©a cÃ¡c báº­c thang co giÃ£n (Step Adjustments) dá»±a trÃªn Ä‘á»™ lá»‡ch chá»‰ sá»‘ CloudWatch Alarm (vÃ­ dá»¥: CPU tÄƒng 10% -> thÃªm 2 mÃ¡y; CPU tÄƒng 30% -> thÃªm ngay 6 mÃ¡y).
  - Hoáº¡t Ä‘á»™ng ngay láº­p tá»©c mÃ  khÃ´ng bá»‹ trÃ¬ hoÃ£n bá»Ÿi Cooldown khi cÃ¡c ngÆ°á»¡ng cáº£nh bÃ¡o cao hÆ¡n bá»‹ kÃ­ch hoáº¡t liÃªn tiáº¿p.

#### ðŸª¤ Báº«y 17: ALB Tá»± Äá»™ng Chuyá»ƒn HÆ°á»›ng HTTP sang HTTPS & Äá»‹nh Tuyáº¿n Hostname/Subdomain â€” (TD-Set4 Q50, CM-PT4 Q12)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p muá»‘n Ä‘áº£m báº£o 100% ngÆ°á»i dÃ¹ng truy cáº­p web pháº£i sá»­ dá»¥ng káº¿t ná»‘i mÃ£ hÃ³a HTTPS an toÃ n. Náº¿u ngÆ°á»i dÃ¹ng gÃµ `http://`, há»‡ thá»‘ng pháº£i tá»± Ä‘á»™ng Ä‘á»•i hÆ°á»›ng sang `https://` vá»›i mÃ£ HTTP 301/302 mÃ  khÃ´ng tá»‘n tÃ i nguyÃªn xá»­ lÃ½ cá»§a backend EC2. Äá»“ng thá»i, cÃ¡c yÃªu cáº§u tá»›i `api.example.com` vÃ  `shop.example.com` pháº£i Ä‘Æ°á»£c chuyá»ƒn Ä‘áº¿n hai cá»¥m EC2 khÃ¡c nhau."*
- **Giáº£i phÃ¡p ÄÃšNG**:
  - Cáº¥u hÃ¬nh **HTTP Listener (Cá»•ng 80)** trÃªn Application Load Balancer vá»›i quy táº¯c **Redirect Action** chuyá»ƒn hÆ°á»›ng toÃ n bá»™ sang HTTPS Cá»•ng 443 (HTTP 301 Moved Permanently) (`TD-Set4 Q50`). HoÃ n toÃ n xá»­ lÃ½ táº¡i táº§ng ALB, khÃ´ng cáº§n viáº¿t code rewrite trong Nginx/Apache.
  - Cáº¥u hÃ¬nh **Host-based Routing Rules** trÃªn HTTPS Listener: Kiá»ƒm tra tiÃªu Ä‘á» `Host` (vÃ­ dá»¥ `api.example.com` $\rightarrow$ Target Group API; `shop.example.com` $\rightarrow$ Target Group Shop) (`CM-PT4 Q12`).

#### ðŸª¤ Báº«y 18: Di Chuyá»ƒn á»¨ng Dá»¥ng KhÃ´ng GiÃ¡n Äoáº¡n Báº±ng ALB Weighted Target Groups â€” (TD-Set5 Q32)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p Ä‘ang di chuyá»ƒn dáº§n má»™t há»‡ thá»‘ng xá»­ lÃ½ giao dá»‹ch tá»« trung tÃ¢m dá»¯ liá»‡u táº¡i chá»— (On-Premises) lÃªn AWS. Ban lÃ£nh Ä‘áº¡o yÃªu cáº§u phÃ¢n bá»• 50% lÆ°u lÆ°á»£ng tá»›i cá»¥m mÃ¡y chá»§ táº¡i chá»— vÃ  50% tá»›i cá»¥m mÃ¡y áº£o EC2 má»›i trÃªn AWS trong giai Ä‘oáº¡n thá»­ nghiá»‡m táº£i. Cáº§n cáº¥u hÃ¬nh tháº¿ nÃ o vá»›i effort tá»‘i thiá»ƒu?"*
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **ALB Weighted Target Groups (Target Group Weighting)** (`TD-Set5 Q32`).
  - Táº¡o 2 Target Groups: `TG-OnPrem` (loáº¡i IP addresses trá» vá» On-Premises qua Direct Connect/VPN) vÃ  `TG-AWS` (loáº¡i Instance ID trÃªn EC2).
  - Cáº¥u hÃ¬nh má»™t Forward Action duy nháº¥t trÃªn ALB Listener Rule vá»›i trá»ng sá»‘ **Weight 50:50** (hoáº·c chuyá»ƒn dáº§n 90:10 $\rightarrow$ 80:20 $\rightarrow$ 50:50 $\rightarrow$ 0:100 cho Blue/Green Deployment). KhÃ´ng cáº§n can thiá»‡p táº§ng DNS hay pháº§n má»m cÃ¢n báº±ng táº£i bÃªn thá»© ba.

#### ðŸª¤ Báº«y 19: PhÃ¢n TÃ­ch ALB Access Logs TrÃªn Amazon S3 Báº±ng Amazon Athena â€” (TD-Set3 Q57, TD-Set5 Q23, CM-PT5 Q42)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"KhÃ¡ch hÃ ng bÃ¡o cÃ¡o thá»‰nh thoáº£ng gáº·p lá»—i 504 Gateway Timeout hoáº·c Ä‘á»™ trá»… pháº£n há»“i ráº¥t cao vÃ o cÃ¡c khung giá» cao Ä‘iá»ƒm. Äá»™i ngÅ© ká»¹ sÆ° cáº§n kiá»ƒm tra lá»‹ch sá»­ táº¥t cáº£ cÃ¡c request trong 30 ngÃ y qua (gá»“m IP client, target IP, target processing time, latency) vá»›i chi phÃ­ tháº¥p nháº¥t vÃ  khÃ´ng pháº£i dá»±ng mÃ¡y chá»§ quáº£n lÃ½ log."*
- **Giáº£i phÃ¡p ÄÃšNG**:
  - Báº­t tÃ­nh nÄƒng **Access Logs** trÃªn Application Load Balancer, chá»‰ Ä‘á»‹nh Ä‘Ã­ch ghi lÃ  má»™t **Amazon S3 Bucket**.
  - Sá»­ dá»¥ng **Amazon Athena** Ä‘á»ƒ táº¡o báº£ng ngoáº¡i quan (External Table) phÃ¢n vÃ¹ng theo ngÃ y/giá» vÃ  cháº¡y truy váº¥n chuáº©n SQL trá»±c tiáº¿p trÃªn cÃ¡c file nÃ©n `.log.gz` trÃªn S3 (`TD-Set3 Q57`, `CM-PT5 Q42`). KhÃ´ng cáº§n dá»±ng cá»¥m OpenSearch Ä‘áº¯t Ä‘á».

#### ðŸª¤ Báº«y 20: ÄÄƒng KÃ½ ÄÃ­ch Cho Network Load Balancer (NLB): Instance ID vs IP Address â€” (U-PT3 Q23)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t mÃ¡y chá»§ EC2 Ä‘a card máº¡ng (Dual-homed: `eth0` cho máº¡ng quáº£n trá»‹ ná»™i bá»™, `eth1` cho máº¡ng tiáº¿p nháº­n dá»¯ liá»‡u streaming khÃ¡ch hÃ ng). Ká»¹ sÆ° Ä‘Äƒng kÃ½ mÃ¡y chá»§ vÃ o NLB Target Group theo Instance ID nhÆ°ng lÆ°u lÆ°á»£ng khÃ¡ch hÃ ng láº¡i bá»‹ Ä‘á»• vÃ o `eth0` thay vÃ¬ `eth1`. Táº¡i sao?"*
- **Báº£n cháº¥t ká»¹ thuáº­t sá»‘ng cÃ²n**:
  - Khi Ä‘Äƒng kÃ½ Target vÃ o NLB theo **Instance ID**: NLB sáº½ **luÃ´n luÃ´n Ä‘á»‹nh tuyáº¿n lÆ°u lÆ°á»£ng tá»›i Primary Private IPv4 cá»§a card máº¡ng chÃ­nh (`eth0`)** cá»§a EC2 instance Ä‘Ã³.
  - Khi cáº§n Ä‘á»‹nh tuyáº¿n tá»›i **Secondary Private IP** trÃªn `eth0`, hoáº·c báº¥t ká»³ IP nÃ o trÃªn **Secondary Network Interface (`eth1`)**, báº¯t buá»™c pháº£i Ä‘Äƒng kÃ½ Target Group theo **IP Address Target Type** (`U-PT3 Q23`).

#### ðŸª¤ Báº«y 21: NLB TLS Offloading & Äá»©ng TrÆ°á»›c Cá»¥m Bastion Host Multi-AZ â€” (U-PT6 Q14, U-PT6 Q26, CM-PT2 Q30, CM-PT5 Q15, CM-PT5 Q45, CM-PT6 Q53, TD-Set2 Q54)
- **TÃ¬nh huá»‘ng Ä‘á» thi 1**: *"á»¨ng dá»¥ng TCP yÃªu cáº§u mÃ£ hÃ³a Ä‘áº§u cuá»‘i nhÆ°ng muá»‘n giáº£m táº£i cÃ´ng viá»‡c giáº£i mÃ£ TLS/SSL cho cá»¥m mÃ¡y chá»§ backend mÃ  váº«n duy trÃ¬ thÃ´ng lÆ°á»£ng hÃ ng triá»‡u káº¿t ná»‘i má»—i giÃ¢y vá»›i Ä‘á»‹a chá»‰ IP tÄ©nh."*
  - **Giáº£i phÃ¡p**: **NLB TLS Listener (TLS Offloading)** (`U-PT6 Q14`). NLB gáº¯n chá»©ng chá»‰ sá»‘ tá»« AWS Certificate Manager (ACM), thá»±c hiá»‡n giáº£i mÃ£ SSL táº¡i táº§ng NLB vÃ  chuyá»ƒn tiáº¿p TCP thuáº§n tÃºy vá» backend.
- **TÃ¬nh huá»‘ng Ä‘á» thi 2**: *"Thiáº¿t káº¿ cá»•ng káº¿t ná»‘i SSH (Port 22) cÃ³ tÃ­nh sáºµn sÃ ng cao, chá»‹u lá»—i Ä‘a AZ cho quáº£n trá»‹ viÃªn truy cáº­p vÃ o cÃ¡c mÃ¡y chá»§ trong Private Subnets mÃ  khÃ´ng Ä‘á»ƒ lá»™ trá»±c tiáº¿p tá»«ng mÃ¡y Bastion ra Internet."*
  - **Giáº£i phÃ¡p**: Triá»ƒn khai cá»¥m **Bastion Hosts trong Auto Scaling Group tráº£i trÃªn nhiá»u AZs** náº±m sau má»™t **Internet-facing Network Load Balancer** (`U-PT6 Q26`, `CM-PT2 Q30`, `TD-Set2 Q54`). Cung cáº¥p Elastic IP cá»‘ Ä‘á»‹nh, cÃ¢n báº±ng táº£i SSH traffic vÃ  tá»± Ä‘á»™ng loáº¡i bá» bastion node há»ng.

#### ðŸª¤ Báº«y 22: Thá»© Tá»± Thá»±c Thi Cá»§a ASG AZ Rebalancing â€” (U-PT1 Q57)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t Auto Scaling Group Ä‘ang cháº¡y trÃªn 2 AZs (AZ-A cÃ³ 2 mÃ¡y, AZ-B cÃ³ 4 mÃ¡y). Do lá»‡ch sá»‘ lÆ°á»£ng mÃ¡y giá»¯a cÃ¡c AZ, cÆ¡ cháº¿ AZ Rebalancing cá»§a ASG Ä‘Æ°á»£c kÃ­ch hoáº¡t Ä‘á»ƒ Ä‘Æ°a vá» tá»· lá»‡ cÃ¢n báº±ng 3:3. QuÃ¡ trÃ¬nh rebalancing diá»…n ra theo thá»© tá»± nÃ o Ä‘á»ƒ Ä‘áº£m báº£o khÃ´ng lÃ m giÃ¡n Ä‘oáº¡n á»©ng dá»¥ng?"*
- **NguyÃªn táº¯c an toÃ n cá»§a AWS ASG**:
  - ASG **LUÃ”N LUÃ”N khá»Ÿi cháº¡y mÃ¡y má»›i (Launch) á»Ÿ AZ Ä‘ang thiáº¿u há»¥t TRÆ¯á»šC (AZ-A: tá»« 2 lÃªn 3 mÃ¡y)**.
  - Chá» mÃ¡y má»›i Ä‘áº¡t tráº¡ng thÃ¡i `InService` vÃ  vÆ°á»£t qua Health Check.
  - Sau Ä‘Ã³ má»›i **cháº¥m dá»©t (Terminate) má»™t mÃ¡y cÅ© á»Ÿ AZ Ä‘ang thá»«a (AZ-B: tá»« 4 xuá»‘ng 3 mÃ¡y)** (`U-PT1 Q57`).
  - *Ã nghÄ©a*: Trong suá»‘t quÃ¡ trÃ¬nh rebalancing, tá»•ng cÃ´ng suáº¥t cá»§a há»‡ thá»‘ng táº¡m thá»i tÄƒng lÃªn \((6 \rightarrow 7 \rightarrow 6)\), khÃ´ng bao giá» bá»‹ sá»¥t giáº£m dung lÆ°á»£ng dÆ°á»›i má»©c mong muá»‘n.

#### ðŸª¤ Báº«y 23: Co GiÃ£n ASG Theo Tuá»•i Tin Nháº¯n CÅ© Nháº¥t vs Khá»‘i LÆ°á»£ng Tá»“n Äá»ng â€” (TD-Set5 Q26, CM-PT2 Q03, U-PT6 Q41)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t há»‡ thá»‘ng xá»­ lÃ½ giao dá»‹ch thanh toÃ¡n tá»« Amazon SQS cÃ³ SLA kháº¯t khe: má»i giao dá»‹ch pháº£i Ä‘Æ°á»£c xá»­ lÃ½ trong vÃ²ng tá»‘i Ä‘a 5 phÃºt ká»ƒ tá»« khi gá»­i vÃ o hÃ ng Ä‘á»£i. Thá»‰nh thoáº£ng cÃ³ vÃ i tin nháº¯n kÃ­ch thÆ°á»›c lá»›n khiáº¿n worker xá»­ lÃ½ ráº¥t lÃ¢u lÃ m cÃ¡c tin nháº¯n sau bá»‹ trá»… quÃ¡ 5 phÃºt. Cáº§n chá»n chá»‰ sá»‘ nÃ o cho Auto Scaling?"*
- **Quy táº¯c phÃ¢n biá»‡t 2 chá»‰ sá»‘ SQS Scaling**:
  - **`ApproximateAgeOfOldestMessage` (Tuá»•i cá»§a tin nháº¯n cÅ© nháº¥t)** (`TD-Set5 Q26`): DÃ¹ng khi há»‡ thá»‘ng cÃ³ **cam káº¿t thá»i gian SLA nghiÃªm ngáº·t** (vÃ­ dá»¥ SLA $\le 5$ phÃºt). Khi tuá»•i cá»§a message vÆ°á»£t quÃ¡ 3 phÃºt, ASG láº­p tá»©c scale-out kháº©n cáº¥p Ä‘á»ƒ xá»­ lÃ½ tin nháº¯n Ä‘Ã³ ngay.
  - **`BacklogPerInstance` (`ApproximateNumberOfMessagesVisible / Capacity`)** (`CM-PT2 Q03`, `U-PT6 Q41`): DÃ¹ng khi há»‡ thá»‘ng cáº§n duy trÃ¬ tá»· lá»‡ sá»‘ lÆ°á»£ng tin nháº¯n trÃªn má»—i worker á»•n Ä‘á»‹nh (vÃ­ dá»¥ 10 tin nháº¯n/worker).

#### ðŸª¤ Báº«y 24: ASG Predictive Scaling, Cooldown vs Instance Warm-up & Co GiÃ£n Theo RAM â€” (TD-Set4 Q47, CM-PT5 Q25, TD-Set2 Q47, TD-Set5 Q40, CM-PT1 Q30, TD-Set1 Q12, TD-Set1 Q45, TD-Set2 Q61, TD-Set4 Q35)
- **Predictive Scaling (Dá»± bÃ¡o nhu cáº§u)** (`TD-Set4 Q47`, `CM-PT5 Q25`): Sá»­ dá»¥ng Machine Learning phÃ¢n tÃ­ch dá»¯ liá»‡u lá»‹ch sá»­ Ã­t nháº¥t 24â€“48 giá» Ä‘á»ƒ láº­p lá»‹ch khá»Ÿi cháº¡y mÃ¡y chá»§ **trÆ°á»›c khi táº£i thá»±c táº¿ áº­p Ä‘áº¿n**, triá»‡t tiÃªu hoÃ n toÃ n thá»i gian chá» khá»Ÿi Ä‘á»™ng á»©ng dá»¥ng.
- **Default Cooldown (300 giÃ¢y máº·c Ä‘á»‹nh)** (`TD-Set2 Q47`): Ãp dá»¥ng cho **Simple Scaling**. NgÄƒn cháº·n ASG tiáº¿p tá»¥c kÃ­ch hoáº¡t thÃªm/bá»›t mÃ¡y khi cÃ¡c mÃ¡y vá»«a khá»Ÿi táº¡o chÆ°a ká»‹p á»•n Ä‘á»‹nh táº£i.
- **Step Scaling Instance Warm-up** (`TD-Set5 Q40`, `CM-PT1 Q30`): Thay tháº¿ cho Cooldown trong Step Scaling. Khi má»™t mÃ¡y má»›i Ä‘ang trong thá»i gian warm-up, nÃ³ khÃ´ng Ä‘Æ°á»£c tÃ­nh vÃ o sá»‘ liá»‡u metric CloudWatch Ä‘á»ƒ trÃ¡nh gÃ¢y bÃ¡o Ä‘á»™ng giáº£.
- **Co giÃ£n theo Bá»™ nhá»› RAM (`MemoryUtilization`) hoáº·c á»” Ä‘Ä©a (`DiskUtilization`)** (`TD-Set1 Q12`, `TD-Set1 Q45`, `TD-Set2 Q61`, `TD-Set4 Q35`): Báº£n thÃ¢n AWS Hypervisor **KHÃ”NG THá»‚** tháº¥y Ä‘Æ°á»£c RAM cá»§a mÃ¡y áº£o. Báº¯t buá»™c pháº£i cÃ i Ä‘áº·t **CloudWatch Unified Agent** trÃªn EC2, lÆ°u trá»¯ cáº¥u hÃ¬nh file JSON trÃªn **AWS Systems Manager Parameter Store**, vÃ  Ä‘áº©y custom metric `mem_used_percent` lÃªn CloudWatch Ä‘á»ƒ ASG co giÃ£n!

---

### ðŸ“Š III. Ma Tráº­n Quyáº¿t Äá»‹nh CÃ¢n Báº±ng Táº£i & Co GiÃ£n Nhanh (Exam Decision Matrix)

| TÃ¬nh huá»‘ng / YÃªu cáº§u trong Ä‘á» thi | Giáº£i phÃ¡p chuáº©n AWS | Giáº£i phÃ¡p bá»‹ loáº¡i & LÃ½ do | Äá» thi thá»±c chá»©ng |
|:---|:---|:---|:---:|
| **Tá»± Ä‘á»™ng redirect HTTP sang HTTPS & Host routing** | **ALB Listener Rules (Redirect 301 & Host conditions)** | Viáº¿t code rewrite á»Ÿ backend Nginx (tá»‘n tÃ i nguyÃªn mÃ¡y áº£o) | TD-Set4 Q50, CM-PT4 Q12 |
| **Chia táº£i Hybrid 50/50 giá»¯a On-Prem vÃ  AWS** | **ALB Weighted Target Groups (Weight 50:50)** | Route 53 Weighted DNS (vÆ°á»›ng client DNS cache) | TD-Set5 Q32 |
| **PhÃ¢n tÃ­ch lá»‹ch sá»­ truy cáº­p ALB khÃ´ng dá»±ng server** | **ALB Access Logs trÃªn S3 + Amazon Athena (SQL)** | AWS OpenSearch Service (chi phÃ­ duy trÃ¬ cá»¥m ráº¥t cao) | TD-Set3 Q57, CM-PT5 Q42 |
| **NLB Ä‘á»‹nh tuyáº¿n tá»›i Secondary ENI (`eth1`)** | **NLB Target Group loáº¡i `IP addresses`** | ÄÄƒng kÃ½ theo `Instance ID` (chá»‰ trá» vá» `eth0` chÃ­nh) | U-PT3 Q23 |
| **Chá»‹u lá»—i Bastion Host SSH Ä‘a AZ khÃ´ng má»Ÿ IP** | **NLB Internet-facing + ASG Bastion Hosts** | GÃ¡n EIP trá»±c tiáº¿p vÃ o 1 Bastion EC2 (Ä‘Æ¡n Ä‘iá»ƒm lá»—i SPOF) | U-PT6 Q26, TD-Set2 Q54 |
| **Thá»© tá»± thá»±c thi AZ Rebalancing cá»§a ASG** | **Launch mÃ¡y má»›i á»Ÿ AZ thiáº¿u TRÆ¯á»šC, Terminate mÃ¡y thá»«a SAU** | Terminate mÃ¡y thá»«a trÆ°á»›c (gÃ¢y thiáº¿u há»¥t dung lÆ°á»£ng) | U-PT1 Q57 |
| **Co giÃ£n ASG theo SLA thá»i gian pháº£n há»“i tin nháº¯n** | **Metric `ApproximateAgeOfOldestMessage`** | Co giÃ£n theo `ApproximateNumberOfMessagesVisible` | TD-Set5 Q26 |
| **Co giÃ£n mÃ¡y chá»§ theo % sá»­ dá»¥ng RAM** | **CloudWatch Unified Agent + SSM Parameter Store** | Standard CloudWatch Metrics (chá»‰ Ä‘o CPU/Disk I/O) | TD-Set1 Q12, TD-Set4 Q35 |
| **TÄƒng tá»‘c TCP/UDP game toÃ n cáº§u, failover bá» qua DNS cache** | **AWS Global Accelerator (Anycast Static IPs)** | CloudFront (chá»‰ HTTP/S) / Route 53 (vÆ°á»›ng DNS cache) | CM-PT1 Q40, CM-PT2 Q15 |
| **Xá»­ lÃ½ lÆ°u lÆ°á»£ng tÄƒng vá»t Ä‘á»™t biáº¿n khÃ´ng cÃ³ Cooldown** | **ASG Step Scaling Policy (Step Adjustments)** | Simple Scaling (bá»‹ khÃ³a bá»Ÿi Cooldown giá»¯a cÃ¡c láº§n) | CM-PT1 Q30 |
| **Phá»¥c vá»¥ nhiá»u domain SSL Ä‘á»™c láº­p chi phÃ­ tháº¥p nháº¥t** | **ALB vá»›i Server Name Indication (SNI)** | Táº¡o nhiá»u ALB riÃªng biá»‡t (tá»‘n kÃ©m chi phÃ­) | TD-Set3 Q20 |
| **VÃ¡ lá»—i EC2 sau ALB an toÃ n khÃ´ng gÃ¢y downtime** | **SSM Automation (`AWSEC2-PatchLoadBalancerInstance`)** | Äá»•i target group sang IP hoáº·c gá»¡ thá»§ cÃ´ng | U-PT4 Q02 |
| **á»¨ng dá»¥ng web sáº­p (HTTP 5xx) nhÆ°ng ASG khÃ´ng thay tháº¿** | **Chuyá»ƒn ASG Health Check Type sang `ELB`** | Giá»¯ máº·c Ä‘á»‹nh `EC2` (chá»‰ check hypervisor) | U-PT4 Q35 |
| **Co giÃ£n mÃ¡y chá»§ theo khá»‘i lÆ°á»£ng Ä‘Æ¡n hÃ ng tá»“n Ä‘á»ng** | **ASG Target Tracking theo SQS Backlog** | Co giÃ£n theo CPU (CPU tháº¥p dÃ¹ queue Ä‘ang á»©) | U-PT4 Q04 |
| **Äáº£m báº£o luÃ´n cÃ³ mÃ¡y chá»§ 24/7 ká»ƒ cáº£ lÃºc váº¯ng khÃ¡ch** | **Cáº¥u hÃ¬nh ASG Minimum Capacity $\ge 2$** | Äá»ƒ `Min = 0` (há»‡ thá»‘ng bá»‹ scale-in vá» 0 mÃ¡y) | U-PT4 Q29 |
| **Pháº¡m vi triá»ƒn khai cá»§a Auto Scaling Group** | **Äa AZ trong CÃ™NG 1 Region** | Tráº£i dÃ i xuyÃªn nhiá»u AWS Regions (ASG bá»‹ cáº¥m) | U-PT4 Q58 |
| **Thu tháº­p log trÆ°á»›c khi instance lá»—i bá»‹ terminate** | **ASG Lifecycle Hook (`Terminating:Wait`)** | KhÃ´ng cáº¥u hÃ¬nh hook (instance bá»‹ terminate máº¥t log) | TD-Set5 Q45 |
| **PhÃ¢n phá»‘i request Ä‘á»“ng Ä‘á»u cho targets á»Ÿ má»i AZ** | **Cross-Zone Load Balancing** | Disabled Cross-zone (gÃ¢y lá»‡ch táº£i giá»¯a cÃ¡c AZ) | TD-Set6 Q28 |
| **Táº£i cÃ´ng viá»‡c tÄƒng giáº£m Ä‘á»‹nh ká»³ theo giá» má»—i ngÃ y** | **ASG Scheduled Scaling Actions** | Dynamic Scaling (bá»‹ trá»… khi lÆ°u lÆ°á»£ng Ã¹a vÃ o) | TD-Set1 Q04 |
| **Äá»‹nh tuyáº¿n HTTP/HTTPS, Path-based, microservices** | **Application Load Balancer (ALB)** | Network Load Balancer (chá»‰ hoáº¡t Ä‘á»™ng á»Ÿ Layer 4) | TD-Set1 Q16 |
| **Giao thá»©c TCP/UDP, Ä‘á»™ trá»… cá»±c tháº¥p, Static IP** | **Network Load Balancer (NLB)** | Application Load Balancer (chá»‰ hoáº¡t Ä‘á»™ng á»Ÿ Layer 7) | TD-Set2 Q51 |
| **Giá»¯ mÃ¡y chá»§ lá»—i Ä‘á»ƒ Ä‘iá»u tra root cause trá»±c tiáº¿p** | **Suspend `ReplaceUnhealthy` / Chuyá»ƒn `Standby`** | Äá»ƒ máº·c Ä‘á»‹nh (instance bá»‹ terminate máº¥t dá»¯ liá»‡u RAM) | U-PT1 Q22 |
| **CÃ¢n báº±ng táº£i toÃ n cáº§u giá»¯a nhiá»u AWS Regions** | **Route 53 DNS / Global Accelerator** | DÃ¹ng ELB (ELB chá»‰ hoáº¡t Ä‘á»™ng trong 1 Region) | U-PT6 Q48 |
| **Co giÃ£n tá»± Ä‘á»™ng bÃ¡m sÃ¡t má»©c CPU trung bÃ¬nh** | **Target Tracking Scaling Policy** | Simple Scaling (pháº£i tÃ­nh toÃ¡n thá»§ cÃ´ng alarm) | TD-Set1 Q38 |
| **Dung lÆ°á»£ng dá»± phÃ²ng chá»‹u sáº­p 1 AZ ráº» nháº¥t** | **Triá»ƒn khai 3 AZs (má»—i AZ gÃ¡nh N/2 instances)** | Triá»ƒn khai 2 AZs (tá»‘n thÃªm 25% chi phÃ­ mÃ¡y) | U-PT2 Q19 |
| **Cung cáº¥p Static IP cá»‘ Ä‘á»‹nh & cÃ¢n báº±ng táº£i Hybrid** | **Network Load Balancer (NLB)** | Application Load Balancer (IP Ä‘á»™ng, khÃ´ng cá»‘ Ä‘á»‹nh) | CM-PT2 Q61 |
| **Duy trÃ¬ phiÃªn Ä‘Äƒng nháº­p/giá» hÃ ng á»©ng dá»¥ng web** | **ALB Sticky Sessions (Session Affinity)** | Táº¯t sticky session (user bá»‹ máº¥t giá» hÃ ng khi Ä‘á»•i server) | CM-PT6 Q40 |
| **Kiá»ƒm tra an ninh gÃ³i tin sÃ¢u báº±ng Firewall áº£o bÃªn thá»© 3** | **Gateway Load Balancer (GWLB, UDP 6081)** | ALB / NLB (khÃ´ng giá»¯ nguyÃªn IP packet thÃ´) | TD-Set6 Q28, TD-Set8 Q02 |


---


## 3. Kiáº¿n TrÃºc Thá»±c Táº¿ vÃ  Luá»“ng Váº­n HÃ nh (Production Architecture & Workflow)

### 1. SÆ¡ Ä‘á»“ kiáº¿n trÃºc Web Tier chá»‹u lá»—i cao káº¿t há»£p ALB, ASG vÃ  cÆ¡ cháº¿ Self-Healing

```mermaid
flowchart TD
    Client([NgÆ°á»i dÃ¹ng Internet]) --> Route53[Amazon Route 53\nAlias Record trá» vÃ o ALB DNS]
    Route53 --> WAF[AWS WAF\nChá»‘ng SQLi, XSS, Rate Limit]
    WAF --> ALB[Application Load Balancer\nMulti-AZ Public Subnets]

    subgraph VPC["Máº¡ng RiÃªng áº¢o - Amazon VPC"]
        subgraph ASG_Tier["Auto Scaling Group - Private Subnets qua 3 AZs"]
            EC2_Healthy_A[(EC2 Node 1\nHealthy\nAZ-1a)]
            EC2_Healthy_B[(EC2 Node 2\nHealthy\nAZ-1b)]
            EC2_Unhealthy[(EC2 Node 3\nUnhealthy 500 Error\nAZ-1c)]
        end
        
        DB[(Amazon Aurora Multi-AZ\nDatabase Cluster)]
    end

    ALB -->|1. Forward Traffic| EC2_Healthy_A
    ALB -->|1. Forward Traffic| EC2_Healthy_B
    ALB -.->|2. Health Check Ping FAIL!| EC2_Unhealthy

    EC2_Healthy_A --> DB
    EC2_Healthy_B --> DB

    Note over ALB,EC2_Unhealthy: 3. ALB Ä‘Ã¡nh dáº¥u Unhealthy vÃ  ngá»«ng Ä‘áº©y traffic
    EC2_Unhealthy -.->|4. BÃ¡o cÃ¡o lá»—i cho ASG| ASG_Tier
    ASG_Tier -->|5. Terminate mÃ¡y lá»—i & Khá»Ÿi cháº¡y mÃ¡y má»›i| EC2_New[(EC2 Node Thay Tháº¿\nMá»›i tinh\nAZ-1c)]
```

---

### 2. Luá»“ng chi tiáº¿t cÆ¡ cháº¿ tá»± phá»¥c há»“i (Self-Healing Workflow Step-by-Step)

```mermaid
sequenceDiagram
    autonumber
    participant Client as NgÆ°á»i dÃ¹ng
    participant ALB as Application Load Balancer
    participant EC2_Bad as MÃ¡y Chá»§ EC2 Bá»‹ Lá»—i
    participant ASG as Auto Scaling Group
    participant EC2_New as MÃ¡y Chá»§ Má»›i Khá»Ÿi Táº¡o

    loop Má»—i 15 giÃ¢y (Health Check Ping)
        ALB->>EC2_Bad: HTTP GET /health
        EC2_Bad-->>ALB: HTTP 500 Internal Error (hoáº·c Timeout)
    end
    
    Note over ALB: 1. Äáº¡t ngÆ°á»¡ng 2 láº§n tháº¥t báº¡i liÃªn tiáº¿p (Unhealthy Threshold = 2)
    ALB->>ALB: 2. ÄÃ¡nh dáº¥u node lÃ  Unhealthy; láº­p tá»©c cÃ´ láº­p khá»i báº£ng Ä‘á»‹nh tuyáº¿n
    ALB->>ASG: 3. ThÃ´ng bÃ¡o Target Health Status = Unhealthy
    
    Note over ASG: 4. KÃ­ch hoáº¡t quy trÃ¬nh Self-Healing
    ASG->>EC2_Bad: 5. KÃ­ch hoáº¡t Deregistration Delay (draining káº¿t ná»‘i dá»Ÿ dang)
    ASG->>EC2_Bad: 6. Ra lá»‡nh Terminate mÃ¡y chá»§ bá»‹ lá»—i
    ASG->>EC2_New: 7. Khá»Ÿi cháº¡y instance má»›i tá»« Launch Template táº¡i cÃ¹ng AZ
    EC2_New->>EC2_New: 8. Khá»Ÿi Ä‘á»™ng á»©ng dá»¥ng & sáºµn sÃ ng pháº£n há»“i
    ALB->>EC2_New: 9. Gá»­i Health Check ping
    EC2_New-->>ALB: 10. Pháº£n há»“i HTTP 200 OK (Healthy)
    ALB->>EC2_New: 11. Báº¯t Ä‘áº§u phÃ¢n phá»‘i traffic ngÆ°á»i dÃ¹ng vÃ o mÃ¡y má»›i!
```

---

## 4. Báº£ng TÃ­ch Há»£p vá»›i CÃ¡c Dá»‹ch Vá»¥ AWS KhÃ¡c (Integration Table)

| Related AWS Service | Purpose (Má»¥c Ä‘Ã­ch tÃ­ch há»£p) | Integration Method (PhÆ°Æ¡ng thá»©c ká»¹ thuáº­t chÃ­nh xÃ¡c) | Practical Example (VÃ­ dá»¥ thá»±c tiá»…n) |
| :--- | :--- | :--- | :--- | :--- |
| **Amazon Route 53** | PhÃ¢n giáº£i tÃªn miá»n ngÆ°á»i dÃ¹ng vÃ o Load Balancer vá»›i Ä‘á»™ trá»… tháº¥p | **Alias Record** (A / AAAA Record) trá» vÃ o DNS Name cá»§a ALB | Cáº¥u hÃ¬nh Route 53 trá» tÃªn miá»n gá»‘c `example.com` vÃ o Application Load Balancer mÃ  khÃ´ng cáº§n dÃ¹ng Ä‘á»‹a chá»‰ IP tÄ©nh. |
| **AWS Certificate Manager (ACM)** | Cung cáº¥p vÃ  tá»± Ä‘á»™ng gia háº¡n chá»©ng chá»‰ báº£o máº­t SSL/TLS miá»…n phÃ­ | TÃ­ch há»£p chá»©ng chá»‰ trá»±c tiáº¿p vÃ o HTTPS Listener cá»§a ALB | Gáº¯n chá»©ng chá»‰ SSL Ä‘a tÃªn miá»n báº£o vá»‡ `https://api.mycorp.com` vÃ  `https://web.mycorp.com` sá»­ dá»¥ng tÃ­nh nÄƒng **SNI**. |
| **AWS WAF** | TÆ°á»ng lá»­a á»©ng dá»¥ng web báº£o vá»‡ trÆ°á»›c táº¥n cÃ´ng Layer 7 | Gáº¯n **Web ACL Association** trá»±c tiáº¿p vÃ o ALB | Thiáº¿t láº­p luáº­t WAF cháº·n Ä‘á»©ng cÃ¡c cuá»™c táº¥n cÃ´ng SQL Injection vÃ  tá»± Ä‘á»™ng cáº¥m cÃ¡c IP gá»­i quÃ¡ 2,000 requests trong 5 phÃºt. |
| **Amazon CloudWatch** | GiÃ¡m sÃ¡t tráº¡ng thÃ¡i hoáº¡t Ä‘á»™ng, thá»i gian pháº£n há»“i vÃ  kÃ­ch hoáº¡t co giÃ£n | Tá»± Ä‘á»™ng Ä‘áº©y metrics vÃ o CloudWatch; gáº¯n Alarms vÃ o Scaling Policies | KÃ­ch hoáº¡t Step Scaling tÄƒng thÃªm 2 mÃ¡y chá»§ khi chá»‰ sá»‘ `TargetResponseTime > 0.5s` kÃ©o dÃ i trong 3 phÃºt. |
| **Amazon SQS** | Äiá»u phá»‘i co giÃ£n sá»‘ lÆ°á»£ng worker dá»±a trÃªn lÆ°á»£ng tin nháº¯n tá»“n Ä‘á»ng | Theo dÃµi metric `ApproximateNumberOfMessagesVisible` | Tá»± Ä‘á»™ng tÄƒng sá»‘ lÆ°á»£ng mÃ¡y chá»§ xá»­ lÃ½ tÃ¡c vá»¥ ngáº§m khi hÃ ng Ä‘á»£i SQS cÃ³ hÆ¡n 5,000 thÃ´ng Ä‘iá»‡p Ä‘ang chá» xá»­ lÃ½. |
| **AWS Systems Manager** | Quáº£n lÃ½ thÃ´ng tin cáº¥u hÃ¬nh vÃ  tá»± Ä‘á»™ng khá»Ÿi cháº¡y ká»‹ch báº£n báº£o trÃ¬ | TÃ­ch há»£p qua Launch Template gáº¯n IAM Instance Profile | Tá»± Ä‘á»™ng láº¥y tham sá»‘ mÃ´i trÆ°á»ng tá»« SSM Parameter Store khi mÃ¡y áº£o má»›i Ä‘Æ°á»£c ASG khá»Ÿi cháº¡y. |

---

## 5. Báº£ng So SÃ¡nh ToÃ n Bá»™ CÃ¡c Giáº£i PhÃ¡p CÃ¢n Báº±ng Táº£i AWS (Ecosystem Comparison)

| TiÃªu chuáº©n so sÃ¡nh | Application Load Balancer (ALB) | Network Load Balancer (NLB) | Gateway Load Balancer (GWLB) | Classic Load Balancer (CLB) `[Deprecated]` |
| :--- | :--- | :--- | :--- | :--- |
| **Táº§ng máº¡ng (OSI Layer)** | **Táº§ng 7 (Application)** | **Táº§ng 4 (Transport)** | **Táº§ng 3 (Network)** | Táº§ng 4 vÃ  Táº§ng 7 káº¿t há»£p |
| **Giao thá»©c há»— trá»£** | HTTP, HTTPS, HTTP/2, gRPC, WebSocket | TCP, UDP, TLS | Giao thá»©c Ä‘Ã³ng gÃ³i **GENEVE (Port 6081)** | HTTP, HTTPS, TCP, SSL |
| **Äá»™ trá»… xá»­ lÃ½ (Latency)** | Mili-giÃ¢y (Miliseconds) | **SiÃªu tá»‘c (Microseconds)** | Microseconds | Miliseconds |
| **Äá»‹a chá»‰ IP cung cáº¥p** | TÃªn miá»n DNS Ä‘á»™ng (IP thay Ä‘á»•i liÃªn tá»¥c) | **IP tÄ©nh (Elastic IP) trÃªn má»—i AZ** | IP riÃªng ná»™i bá»™ VPC | TÃªn miá»n DNS Ä‘á»™ng |
| **Äá»‹nh tuyáº¿n thÃ´ng minh** | ÄÆ°á»ng dáº«n URL, Host, Headers, Query string | âŒ Chá»‰ Ä‘á»‹nh tuyáº¿n theo cá»•ng vÃ  IP | Äá»‹nh tuyáº¿n toÃ n bá»™ luá»“ng gÃ³i tin IP | âŒ KhÃ´ng há»— trá»£ Ä‘á»‹nh tuyáº¿n ná»™i dung |
| **ÄÆ¡n vá»‹ tÃ­nh cÆ°á»›c** | Giá» hoáº¡t Ä‘á»™ng + **LCU-hour** | Giá» hoáº¡t Ä‘á»™ng + **NLCU-hour** | Giá» hoáº¡t Ä‘á»™ng + **GLCU-hour** | Giá» hoáº¡t Ä‘á»™ng + GB truyá»n táº£i |
| **Cross-Zone Balancing** | **Máº·c Ä‘á»‹nh Báº¬T (Miá»…n phÃ­)** | **Máº·c Ä‘á»‹nh Táº®T (CÃ³ phÃ­)** | Máº·c Ä‘á»‹nh Táº®T | Máº·c Ä‘á»‹nh Táº®T |
| **Ká»‹ch báº£n sá»­ dá»¥ng chuáº©n** | á»¨ng dá»¥ng web, microservices, container ECS, REST APIs | Game online, IoT streaming, há»‡ thá»‘ng tÃ i chÃ­nh cáº§n IP tÄ©nh | TÆ°á»ng lá»­a máº¡ng bÃªn thá»© ba (Palo Alto, Fortinet), IDS/IPS | **KhÃ´ng dÃ¹ng cho kiáº¿n trÃºc má»›i** |

---

## 6. MÃ´ HÃ¬nh TÃ­nh PhÃ­ & Chiáº¿n LÆ°á»£c Tá»‘i Æ¯u Chi PhÃ­ (FinOps & Cost Optimization)

### 6.1. Báº£ng PhÃ¢n TÃ­ch CÆ¡ Cháº¿ TÃ­nh PhÃ­ Chi Tiáº¿t Cá»§a ELB & ASG

| ThÃ nh pháº§n tÃ­nh phÃ­ | CÆ¡ cháº¿ tÃ­nh phÃ­ chi tiáº¿t (Pricing Dimensions) | Má»©c phÃ­ tham chiáº¿u Ä‘iá»ƒn hÃ¬nh (US-East-1) | Báº«y chi phÃ­ nghiÃªm trá»ng (Cost Pitfalls) |
| :--- | :--- | :--- | :--- |
| **Application Load Balancer (ALB)** | â€¢ CÆ°á»›c cá»‘ Ä‘á»‹nh: TÃ­nh theo giá» hoáº¡t Ä‘á»™ng.<br>â€¢ **CÆ°á»›c LCU (Load Balancer Capacity Units)**: TÃ­nh theo chiá»u tÃ i nguyÃªn tiÃªu thá»¥ cao nháº¥t trong 4 chiá»u: New connections (25/s), Active connections (3,000/phÃºt), Processed bytes (1 GB/giá»), Rule evaluations (1,000/s). | â€¢ Cá»‘ Ä‘á»‹nh: **\$0.0225 / giá»** (~\$16.20/thÃ¡ng).<br>â€¢ LCU: **\$0.008 / LCU-giá»**. | Táº¡o hÃ ng chá»¥c ALB riÃªng láº» cho tá»«ng dá»‹ch vá»¥ nhá» thay vÃ¬ há»£p nháº¥t vÃ o 1 ALB dÃ¹ng chung Listener Rules. |
| **Network Load Balancer (NLB)** | â€¢ CÆ°á»›c cá»‘ Ä‘á»‹nh: TÃ­nh theo giá» hoáº¡t Ä‘á»™ng.<br>â€¢ **CÆ°á»›c NLCU**: Äo lÆ°á»ng 3 chiá»u: New connections (800/s), Active connections (100,000/phÃºt), Processed bytes (1 GB/giá»). | â€¢ Cá»‘ Ä‘á»‹nh: **\$0.0225 / giá»** (~\$16.20/thÃ¡ng).<br>â€¢ NLCU: **\$0.006 / NLCU-giá»**. | Báº­t Cross-Zone Load Balancing trÃªn NLB lÆ°u lÆ°á»£ng lá»›n phÃ¡t sinh cÆ°á»›c truyá»n dá»¯ liá»‡u xuyÃªn AZ. |
| **Auto Scaling Group (ASG)** | **HOÃ€N TOÃ€N MIá»„N PHÃ (\$0.00)**. | **\$0.00** | Chá»‰ tráº£ tiá»n cho cÃ¡c tÃ i nguyÃªn EC2 instances do ASG khá»Ÿi cháº¡y. LÃ£ng phÃ­ xáº£y ra khi Ä‘áº·t ngÆ°á»¡ng scale-out quÃ¡ nháº¡y. |
| **Cross-Zone Data Transfer** | â€¢ **ALB**: HoÃ n toÃ n **MIá»„N PHÃ (\$0.00/GB)**.<br>â€¢ **NLB**: TÃ­nh phÃ­ **\$0.01 / GB** cho má»—i chiá»u truyá»n dá»¯ liá»‡u liÃªn AZ khi báº­t Cross-Zone. | \$0.01 / GB. | VÃ´ tÃ¬nh báº­t Cross-Zone trÃªn NLB xá»­ lÃ½ hÃ ng trÄƒm Terabytes dá»¯ liá»‡u má»—i thÃ¡ng. |

---

### 6.2. Chiáº¿n LÆ°á»£c Tá»‘i Æ¯u HÃ³a Chi PhÃ­ Theo 5 Ká»‹ch Báº£n Thá»±c Táº¿ (Use Cases Optimization)

#### Ká»‹ch báº£n 1: Há»£p Nháº¥t 10 Microservices VÃ o Má»™t ALB Duy Nháº¥t (Listener Rules Consolidation)
* **Bá»‘i cáº£nh thá»±c táº¿**:
  Má»™t cÃ´ng ty khá»Ÿi nghiá»‡p triá»ƒn khai 10 dá»‹ch vá»¥ vi mÃ´ Ä‘á»™c láº­p (Auth, Cart, Order, Product, Payment...). NhÃ³m láº­p trÃ¬nh viÃªn ban Ä‘áº§u táº¡o riÃªng cho má»—i dá»‹ch vá»¥ má»™t Application Load Balancer riÃªng biá»‡t.
  $$\text{Chi phÃ­ cá»‘ Ä‘á»‹nh ban Ä‘áº§u} = 10 \text{ ALBs} \times 0.0225\$ \times 720 \text{ giá»} = \mathbf{162.00\$/\text{thÃ¡ng}}$$
* **Chiáº¿n lÆ°á»£c tá»‘i Æ°u hÃ³a**:
  - Há»£p nháº¥t toÃ n bá»™ 10 dá»‹ch vá»¥ vá» **1 Application Load Balancer duy nháº¥t**.
  - Sá»­ dá»¥ng tÃ­nh nÄƒng **Path-based Routing** (`/api/auth/*`, `/api/orders/*`) vÃ  **Host-based Routing** Ä‘á»ƒ phÃ¢n phá»‘i lÆ°u lÆ°á»£ng vÃ o 10 Target Groups Ä‘á»™c láº­p.
  $$\text{Chi phÃ­ cá»‘ Ä‘á»‹nh 1 ALB} = 1 \times 0.0225\$ \times 720 = \mathbf{16.20\$/\text{thÃ¡ng}}$$
* **Káº¿t quáº£ tiáº¿t kiá»‡m**:
  $$\text{Sá»‘ tiá»n tiáº¿t kiá»‡m} = 162.00\$ - 16.20\$ = \mathbf{145.80\$/\text{thÃ¡ng}} \quad (\approx \mathbf{1,749\$/\text{nÄƒm}})$$
  **Tá»· lá»‡ tiáº¿t kiá»‡m Ä‘áº¡t ~90.0% chi phÃ­ cá»‘ Ä‘á»‹nh cá»§a Load Balancer**.

---

#### Ká»‹ch báº£n 2: Kiá»ƒm SoÃ¡t Báº«y Chi PhÃ­ Cross-Zone Data Transfer TrÃªn NLB
* **Bá»‘i cáº£nh thá»±c táº¿**:
  Má»™t há»‡ thá»‘ng viá»…n tráº¯c IoT truyá»n dá»¯ liá»‡u liÃªn tá»¥c qua cá»¥m **Network Load Balancer (NLB)** vá»›i tá»•ng dung lÆ°á»£ng dá»¯ liá»‡u xá»­ lÃ½ lÃªn tá»›i **100 TB (100,000 GiB)/thÃ¡ng** tráº£i dÃ i trÃªn 3 Availability Zones. Do ká»¹ sÆ° báº­t cá» `Cross-Zone Load Balancing = ON`, khoáº£ng 66.7% dá»¯ liá»‡u bá»‹ truyá»n chÃ©o sang cÃ¡c AZ khÃ¡c.
  $$\text{Chi phÃ­ Data Transfer chÃ©o AZ} = 100,000 \text{ GiB} \times \frac{2}{3} \times 0.01\$ = \mathbf{666.67\$/\text{thÃ¡ng}}$$
* **Chiáº¿n lÆ°á»£c tá»‘i Æ°u hÃ³a**:
  - Táº¯t tÃ­nh nÄƒng Cross-Zone Load Balancing trÃªn NLB (`Cross-Zone = OFF` - giÃ¡ trá»‹ máº·c Ä‘á»‹nh).
  - Sá»­ dá»¥ng Route 53 hoáº·c phÃ¢n bá»• client káº¿t ná»‘i Ä‘á»u vÃ o tá»«ng Elastic IP cá»§a NLB táº¡i tá»«ng AZ tÆ°Æ¡ng á»©ng Ä‘á»ƒ xá»­ lÃ½ cá»¥c bá»™ (Local Zone Processing).
* **Káº¿t quáº£ tiáº¿t kiá»‡m**:
  $$\text{Sá»‘ tiá»n tiáº¿t kiá»‡m} = \mathbf{666.67\$/\text{thÃ¡ng}} \quad (\approx \mathbf{8,000\$/\text{nÄƒm}})$$
  **Triá»‡t tiÃªu 100% chi phÃ­ truyá»n dá»¯ liá»‡u chÃ©o vÃ¹ng**, Ä‘á»“ng thá»i giáº£m Ä‘á»™ trá»… máº¡ng thÃªm 1â€“2 mili-giÃ¢y.

---

#### Ká»‹ch báº£n 3: Ãp Dá»¥ng ASG Mixed Instances Policy Káº¿t Há»£p Spot vÃ  On-Demand Cho Worker Tier
* **Bá»‘i cáº£nh thá»±c táº¿**:
  Má»™t cá»¥m mÃ¡y chá»§ worker gá»“m 25 mÃ¡y `c6i.xlarge` (\$0.17/giá») cháº¡y liÃªn tá»¥c 24/7 Ä‘á»ƒ xá»­ lÃ½ hÃ ng Ä‘á»£i background jobs. Ban Ä‘áº§u 100% Ä‘á»u sá»­ dá»¥ng On-Demand.
  $$\text{Chi phÃ­ On-Demand ban Ä‘áº§u} = 25 \times 0.17\$ \times 720 \text{ giá»} = \mathbf{3,060.00\$/\text{thÃ¡ng}}$$
* **Chiáº¿n lÆ°á»£c tá»‘i Æ°u hÃ³a**:
  - Cáº¥u hÃ¬nh Auto Scaling Group sá»­ dá»¥ng **Mixed Instances Policy**:
    - **Base Capacity (On-Demand)**: Duy trÃ¬ 5 mÃ¡y nÃ²ng cá»‘t (\$5 \times 0.17\$ \times 720 = 612.00\$$).
    - **Spot Percentage**: 80% cho 20 mÃ¡y cÃ²n láº¡i vá»›i má»©c chiáº¿t kháº¥u trung bÃ¬nh 70% (\$20 \times (0.17\$ \times 0.30) \times 720 = 734.40\$$).
  $$\text{Tá»•ng chi phÃ­ sau tá»‘i Æ°u} = 612.00\$ + 734.40\$ = \mathbf{1,346.40\$/\text{thÃ¡ng}}$$
* **Káº¿t quáº£ tiáº¿t kiá»‡m**:
  $$\text{Sá»‘ tiá»n tiáº¿t kiá»‡m} = 3,060.00\$ - 1,346.40\$ = \mathbf{1,713.60\$/\text{thÃ¡ng}} \quad (\approx \mathbf{20,563\$/\text{nÄƒm}})$$
  **Tá»· lá»‡ tiáº¿t kiá»‡m Ä‘áº¡t ~56.0%**, cÃ¡c tÃ¡c vá»¥ xá»­ lÃ½ hÃ ng Ä‘á»£i váº«n Ä‘áº£m báº£o nhá» kháº£ nÄƒng retry cá»§a SQS.

---

#### Ká»‹ch báº£n 4: RÃºt Ngáº¯n Thá»i Gian Deregistration Delay Giáº£m LÃ£ng PhÃ­ Khi Triá»ƒn Khai CI/CD
* **Bá»‘i cáº£nh thá»±c táº¿**:
  Má»™t cá»¥m API microservices thá»±c hiá»‡n deploy liÃªn tá»¥c 8 láº§n/ngÃ y. ThÃ´ng sá»‘ `deregistration_delay.timeout_seconds` Ä‘ang Ä‘á»ƒ máº·c Ä‘á»‹nh lÃ  **300 giÃ¢y (5 phÃºt)**. Má»—i láº§n deploy, cÃ¡c mÃ¡y chá»§ cÅ© pháº£i cháº¡y khÃ´ng táº£i trong 5 phÃºt trÆ°á»›c khi bá»‹ terminate, trong khi thá»i gian xá»­ lÃ½ request cá»§a á»©ng dá»¥ng chá»‰ dÆ°á»›i **200 mili-giÃ¢y**.
  - 8 láº§n deploy $\times$ 10 mÃ¡y $\times$ 5 phÃºt = 400 instance-minutes lÃ£ng phÃ­ má»—i ngÃ y (~200 instance-hours/thÃ¡ng).
* **Chiáº¿n lÆ°á»£c tá»‘i Æ°u hÃ³a**:
  - Giáº£m thá»i gian `deregistration_delay.timeout_seconds` trÃªn Target Group tá»« 300 giÃ¢y xuá»‘ng cÃ²n **20 giÃ¢y**.
  - Thiáº¿t láº­p ká»‹ch báº£n graceful shutdown trÃªn container Ä‘á»ƒ Ä‘Ã³ng socket ngay khi hoÃ n táº¥t cÃ¡c request Ä‘ang chá».
* **Káº¿t quáº£ tiáº¿t kiá»‡m**:
  Giáº£m thá»i gian sá»‘ng dÆ° thá»«a cá»§a mÃ¡y chá»§ tá»›i **93%**, giÃºp cÃ¡c Ä‘á»£t rolling update hoÃ n táº¥t trong vÃ²ng 3 phÃºt thay vÃ¬ 25 phÃºt.

---

#### Ká»‹ch báº£n 5: Tá»‘i Æ¯u Thá»© Tá»± Æ¯u TiÃªn Listener Rules TrÃªn ALB Giáº£m PhÃ­ LCU
* **Bá»‘i cáº£nh thá»±c táº¿**:
  Má»™t ALB tiáº¿p nháº­n 80 triá»‡u requests/ngÃ y vá»›i 50 Listener Rules phá»©c táº¡p. Do cÃ¡c rule Ä‘Æ°á»£c sáº¯p xáº¿p ngáº«u nhiÃªn, cÃ¡c request phá»• biáº¿n nháº¥t (chiáº¿m 85% lÆ°u lÆ°á»£ng) láº¡i náº±m á»Ÿ Priority 40â€“50, buá»™c ALB pháº£i Ä‘Ã¡nh giÃ¡ qua 40â€“50 Ä‘iá»u kiá»‡n trÆ°á»›c khi chuyá»ƒn tiáº¿p, lÃ m tiÃªu tá»‘n thÃªm **12 LCU-hours má»—i ngÃ y**.
  $$\text{Chi phÃ­ LCU lÃ£ng phÃ­} = 12 \text{ LCU} \times 0.008\$ \times 30 \text{ ngÃ y} = \mathbf{2.88\$/\text{ngÃ y}} \approx \mathbf{86.40\$/\text{thÃ¡ng}}$$
* **Chiáº¿n lÆ°á»£c tá»‘i Æ°u hÃ³a**:
  - PhÃ¢n tÃ­ch ALB Access Logs vÃ  Ä‘áº©y cÃ¡c Ä‘Æ°á»ng dáº«n cÃ³ lÆ°u lÆ°á»£ng cao nháº¥t (Trang chá»§ `/`, Health check `/health`, Auth `/api/v1/auth`) lÃªn cÃ¡c sá»‘ Æ°u tiÃªn Ä‘áº§u tiÃªn (**Priority 1, 2, 3**).
  - Khi request khá»›p vá»›i rule Ä‘áº§u tiÃªn, ALB dá»«ng viá»‡c Ä‘Ã¡nh giÃ¡ cÃ¡c rule cÃ²n láº¡i, Ä‘Æ°a sá»‘ lÆ°á»£ng rule evaluations vá» má»©c tá»‘i thiá»ƒu.
* **Káº¿t quáº£ tiáº¿t kiá»‡m**:
  Triá»‡t tiÃªu hoÃ n toÃ n kÃ­ch thÆ°á»›c chiá»u Rule Evaluations LCU, tiáº¿t kiá»‡m 100% phá»¥ phÃ­ LCU khÃ´ng Ä‘Ã¡ng cÃ³.

---

## 7. Kháº¯c Phá»¥c Sá»± Cá»‘ Thá»±c Táº¿ (Troubleshooting Guide)

| Váº¥n Ä‘á» (Problem) | NguyÃªn nhÃ¢n kháº£ dÄ© (Possible Causes) | CÃ¡c bÆ°á»›c Ä‘iá»u tra (Investigation Steps - Metrics/Logs) | Giáº£i phÃ¡p xá»­ lÃ½ (Solution) | Biá»‡n phÃ¡p phÃ²ng ngá»«a (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **ALB tráº£ vá» mÃ£ lá»—i `HTTP 504 Gateway Timeout`** | MÃ¡y chá»§ backend máº¥t quÃ¡ nhiá»u thá»i gian Ä‘á»ƒ xá»­ lÃ½ hoáº·c Security Group cá»§a backend cháº·n traffic pháº£n há»“i vá» ALB. | 1. Xem Access Logs cá»§a ALB.<br>2. Xem CloudWatch Metric **`TargetResponseTime`**.<br>3. Kiá»ƒm tra nháº­t kÃ½ Slow Query Logs trÃªn database. | TÄƒng giÃ¡ trá»‹ `Idle Timeout` trÃªn ALB hoáº·c tá»‘i Æ°u hÃ³a hiá»‡u nÄƒng cÃ¢u truy váº¥n cá»§a á»©ng dá»¥ng backend. | Thiáº¿t láº­p CloudWatch Alarm cáº£nh bÃ¡o khi `TargetResponseTime > 1s` kÃ©o dÃ i 5 phÃºt. |
| **ToÃ n bá»™ Target trong Target Group Ä‘á»u bÃ¡o `Unhealthy`** | â€¢ ÄÆ°á»ng dáº«n Health Check path cáº¥u hÃ¬nh sai (á»©ng dá»¥ng khÃ´ng cÃ³ endpoint `/`).<br>â€¢ Security Group cá»§a EC2 chÆ°a má»Ÿ cá»•ng cho IP cá»§a ALB.<br>â€¢ Backend server bá»‹ sáº­p dá»‹ch vá»¥ web. | 1. Kiá»ƒm tra mÃ£ pháº£n há»“i mong muá»‘n (Matcher: máº·c Ä‘á»‹nh 200).<br>2. Xem CloudWatch Metric **`UnHealthyHostCount`**.<br>3. Thá»­ lá»‡nh `curl -Iv http://localhost:port/health` trá»±c tiáº¿p trong mÃ¡y áº£o. | Äáº£m báº£o Security Group cá»§a EC2 má»Ÿ cá»•ng tá»« Security Group cá»§a ALB vÃ  endpoint `/health` tráº£ vá» mÃ£ HTTP 200. | Sá»­ dá»¥ng endpoint riÃªng biá»‡t chuyÃªn phá»¥c vá»¥ kiá»ƒm tra sá»©c khá»e há»‡ thá»‘ng (Health Check Endpoint). |
| **ALB tráº£ vá» lá»—i `HTTP 503 Service Unavailable`** | Target Group khÃ´ng cÃ³ báº¥t ká»³ mÃ¡y chá»§ nÃ o á»Ÿ tráº¡ng thÃ¡i Healthy (toÃ n bá»™ mÃ¡y chá»§ Ä‘á»u cháº¿t hoáº·c chÆ°a ká»‹p khá»Ÿi Ä‘á»™ng). | Kiá»ƒm tra tab Targets cá»§a Target Group trÃªn console; xem metric `HealthyHostCount = 0`. | Kiá»ƒm tra láº¡i nguyÃªn nhÃ¢n cÃ¡c mÃ¡y chá»§ bá»‹ Ä‘Ã¡nh dáº¥u Unhealthy vÃ  khá»Ÿi cháº¡y mÃ¡y chá»§ má»›i kháº©n cáº¥p. | LuÃ´n duy trÃ¬ sá»‘ lÆ°á»£ng mÃ¡y tá»‘i thiá»ƒu (`Min size >= 2`) trong ASG trÃªn Ä‘a AZ. |
| **Hiá»‡n tÆ°á»£ng lá»‡ch táº£i nghiÃªm trá»ng giá»¯a cÃ¡c mÃ¡y chá»§ (Load Imbalance)** | TÃ­nh nÄƒng **Sticky Sessions** Ä‘ang Ä‘Æ°á»£c báº­t káº¿t há»£p vá»›i má»™t vÃ i ngÆ°á»i dÃ¹ng lá»›n (heavy clients/bot) gá»­i lÆ°u lÆ°á»£ng khá»•ng lá»“ vÃ o 1 mÃ¡y. | Kiá»ƒm tra cÃ i Ä‘áº·t Target Group attributes vÃ  xem metric `RequestCountPerTarget`. | Táº¯t Sticky Sessions náº¿u á»©ng dá»¥ng há»— trá»£ cÆ¡ cháº¿ lÆ°u phiÃªn phi tráº¡ng thÃ¡i (Stateless qua Redis/ElastiCache). | Thiáº¿t káº¿ táº§ng á»©ng dá»¥ng theo mÃ´ hÃ¬nh hoÃ n toÃ n Stateless Web Tier. |
| **ASG liÃªn tá»¥c báº­t táº¯t mÃ¡y chá»§ liÃªn há»“i (Flapping / Scaling Oscillation)** | Khoáº£ng cÃ¡ch giá»¯a ngÆ°á»¡ng Scale-Out vÃ  Scale-In quÃ¡ háº¹p, hoáº·c thá»i gian Cooldown Period quÃ¡ ngáº¯n. | Xem lá»‹ch sá»­ hoáº¡t Ä‘á»™ng trong tab **Activity History** cá»§a ASG trÃªn console. | Ná»›i rá»™ng khoáº£ng cÃ¡ch giá»¯a ngÆ°á»¡ng kÃ­ch hoáº¡t cáº£nh bÃ¡o tÄƒng vÃ  giáº£m; tÄƒng thá»i gian **Cooldown Period** (vÃ­ dá»¥ lÃªn 300 giÃ¢y). | Sá»­ dá»¥ng **Target Tracking Scaling Policy** thay vÃ¬ Simple Scaling Ä‘á»ƒ AWS tá»± Ä‘á»™ng tÃ­nh toÃ¡n biÃªn Ä‘á»™ an toÃ n. |
| **Lá»—i `Target.FailedHealthChecks` do á»©ng dá»¥ng khá»Ÿi Ä‘á»™ng quÃ¡ cháº­m** | á»¨ng dá»¥ng Java/Spring Boot máº¥t 2â€“3 phÃºt Ä‘á»ƒ náº¡p vÃ o RAM, trong khi ALB Ä‘Ã£ gá»­i health check vÃ  Ä‘Ã¡nh dáº¥u mÃ¡y há»ng trÆ°á»›c khi app sáºµn sÃ ng. | So sÃ¡nh thá»i gian khá»Ÿi Ä‘á»™ng á»©ng dá»¥ng vá»›i thÃ´ng sá»‘ **Health Check Grace Period** cá»§a ASG. | TÄƒng thÃ´ng sá»‘ **Health Check Grace Period** trÃªn ASG lÃªn 300 giÃ¢y Ä‘á»ƒ cho phÃ©p mÃ¡y chá»§ Ä‘á»§ thá»i gian khá»Ÿi Ä‘á»™ng hoÃ n táº¥t. | Sá»­ dá»¥ng **ASG Warm Pools** hoáº·c tá»‘i Æ°u hÃ³a quÃ¡ trÃ¬nh khá»Ÿi Ä‘á»™ng á»©ng dá»¥ng. |

---

## 8. TÃ³m Táº¯t vÃ  Danh Má»¥c Kiá»ƒm Tra Kiáº¿n Thá»©c (Summary & Learning Checklist)

### 7 NguyÃªn Táº¯c Kiáº¿n TrÃºc "Sá»‘ng CÃ²n" Cá»§a ELB & ASG (Golden Rules)
1. **Lá»±a chá»n Ä‘Ãºng loáº¡i Load Balancer**:  
   - Cáº§n Ä‘á»‹nh tuyáº¿n thÃ´ng minh HTTP/HTTPS, URL path, Host, mTLS $\rightarrow$ **Application Load Balancer (ALB)**.  
   - Cáº§n IP tÄ©nh cá»‘ Ä‘á»‹nh, giao thá»©c TCP/UDP, Ä‘á»™ trá»… microsecond $\rightarrow$ **Network Load Balancer (NLB)**.  
   - Cáº§n triá»ƒn khai cá»¥m Firewall / IDS / IPS áº£o cá»§a bÃªn thá»© ba $\rightarrow$ **Gateway Load Balancer (GWLB)**.
2. **Thiáº¿t káº¿ High Availability tá»‘i thiá»ƒu 2â€“3 AZs**:  
   LuÃ´n triá»ƒn khai Load Balancer trÃªn cÃ¡c Public Subnets tráº£i rá»™ng trÃªn tá»‘i thiá»ƒu 2 Availability Zones, vÃ  phÃ¢n bá»• cÃ¡c mÃ¡y chá»§ backend trong Private Subnets qua cÃ¡c AZ tÆ°Æ¡ng á»©ng.
3. **Báº­t ELB Health Check trÃªn ASG**:  
   LuÃ´n cáº¥u hÃ¬nh `Health Check Type = ELB` trÃªn Auto Scaling Group Ä‘á»ƒ ASG tá»± Ä‘á»™ng phÃ¡t hiá»‡n vÃ  thay tháº¿ cÃ¡c mÃ¡y chá»§ bá»‹ treo á»©ng dá»¥ng web (thá»±c thi cÆ¡ cháº¿ Self-Healing).
4. **Há»£p nháº¥t Microservices trÃªn ALB**:  
   Táº­n dá»¥ng Listener Rules (Path-based vÃ  Host-based Routing) Ä‘á»ƒ phá»¥c vá»¥ nhiá»u dá»‹ch vá»¥ trÃªn má»™t ALB duy nháº¥t, trÃ¡nh lÃ£ng phÃ­ cÆ°á»›c phÃ­ cá»‘ Ä‘á»‹nh hÃ ng thÃ¡ng cá»§a Load Balancer.
5. **Cáº£nh giÃ¡c báº«y chi phÃ­ Cross-Zone trÃªn NLB**:  
   Giá»¯ nguyÃªn tÃ¹y chá»n táº¯t `Cross-Zone Load Balancing` trÃªn NLB Ä‘á»‘i vá»›i cÃ¡c há»‡ thá»‘ng cÃ³ lÆ°u lÆ°á»£ng hÃ ng trÄƒm Terabytes Ä‘á»ƒ trÃ¡nh phÃ¡t sinh cÆ°á»›c truyá»n dá»¯ liá»‡u liÃªn AZ.
6. **Láº¥y IP tháº­t ngÆ°á»i dÃ¹ng qua `X-Forwarded-For`**:  
   LuÃ´n cáº¥u hÃ¬nh á»©ng dá»¥ng backend Ä‘á»c tiÃªu Ä‘á» HTTP `X-Forwarded-For` Ä‘á»ƒ phÃ¢n tÃ­ch nháº­t kÃ½ hoáº·c kiá»ƒm tra Ä‘á»‹a chá»‰ IP thá»±c táº¿ cá»§a khÃ¡ch hÃ ng.
7. **Tá»‘i Æ°u chi phÃ­ co giÃ£n vá»›i Mixed Instances Policy**:  
   Káº¿t há»£p On-Demand cho táº£i ná»n vÃ  Spot Instances cho táº£i Ä‘á»™t biáº¿n trong Auto Scaling Group Ä‘á»ƒ tiáº¿t kiá»‡m tá»« 50% Ä‘áº¿n 70% chi phÃ­ Ä‘iá»‡n toÃ¡n.

---

### Danh Má»¥c Kiá»ƒm Tra Nhanh Kiáº¿n Thá»©c SAA-C03 (Exam Readiness Checklist)
- [ ] PhÃ¢n biá»‡t Ä‘Æ°á»£c khi nÃ o dÃ¹ng ALB (Layer 7 HTTP/HTTPS/gRPC, Path/Host/Query routing, SNI, OIDC/Cognito) vs NLB (Layer 4 TCP/UDP/TLS, Ultra-low latency, Elastic IP cá»‘ Ä‘á»‹nh, PrivateLink) vs GWLB (Layer 3 GENEVE bump-in-the-wire cho Firewall áº£o).
- [ ] Náº¯m vá»¯ng thá»© tá»± Æ°u tiÃªn Default Termination Policy cá»§a ASG: Chá»n AZ nhiá»u mÃ¡y nháº¥t $\rightarrow$ Æ¯u tiÃªn há»§y mÃ¡y dÃ¹ng `OldestLaunchConfiguration` trÆ°á»›c `OldestLaunchTemplate` $\rightarrow$ Gáº§n chu ká»³ thanh toÃ¡n giá» tiáº¿p theo nháº¥t $\rightarrow$ Ngáº«u nhiÃªn (`U-PT2 Q18`).
- [ ] Hiá»ƒu rÃµ 2 hÃ nh Ä‘á»™ng cáº§n lÃ m khi kháº¯c phá»¥c sá»± cá»‘ mÃ¡y chá»§ ASG: Táº¡m dá»«ng tiáº¿n trÃ¬nh `ReplaceUnhealthy` HOáº¶C chuyá»ƒn instance sang tráº¡ng thÃ¡i `Standby` (`U-PT1 Q22`).
- [ ] TÃ­nh toÃ¡n chÃ­nh xÃ¡c phÃ¢n bá»• lÆ°u lÆ°á»£ng khi báº­t/táº¯t Cross-Zone Load Balancing (`U-PT3 Q39`) vÃ  dung lÆ°á»£ng chá»‹u lá»—i $N+1$ Ä‘a AZ (`U-PT2 Q19`).
- [ ] Náº¯m vá»¯ng cÆ¡ cháº¿ AZ Rebalancing: LuÃ´n Launch mÃ¡y má»›i á»Ÿ AZ thiáº¿u TRÆ¯á»šC rá»“i má»›i Terminate mÃ¡y thá»«a SAU (`U-PT1 Q57`).
- [ ] PhÃ¢n biá»‡t cÃ¡c chÃ­nh sÃ¡ch co giÃ£n: Target Tracking (theo CPU hoáº·c SQS Backlog), Step Scaling (pháº£n á»©ng tá»©c thÃ¬ khÃ´ng chá» cooldown), Scheduled Scaling (theo lá»‹ch Ä‘á»‹nh ká»³), vÃ  Predictive Scaling (ML dá»± bÃ¡o trÆ°á»›c nhu cáº§u).
- [ ] Hiá»ƒu cÃ¡ch thu tháº­p log trÆ°á»›c khi instance bá»‹ terminate báº±ng ASG Lifecycle Hook `Terminating:Wait` (`TD-Set5 Q45`).
- [ ] PhÃ¢n biá»‡t Ä‘Äƒng kÃ½ target vÃ o NLB báº±ng `Instance ID` (chá»‰ Ä‘á»‹nh tuyáº¿n tá»›i `eth0` Primary IP) vs `IP Address` (há»— trá»£ `eth1` hoáº·c On-Premises IP) (`U-PT3 Q23`).

---

### LiÃªn Káº¿t Ná»™i Bá»™ vÃ  TÃ i Liá»‡u Tham Kháº£o (Internal Links)
- ðŸ“– [Ghi ChÃº BÃ i Há»c ChÆ°Æ¡ng 08: High Availability and Scalability](../Lesson_Notes/08_High_Availability_and_Scalability.md)
- ðŸ“– [TÃ i Liá»‡u ChuyÃªn SÃ¢u: Amazon EC2 & Kiáº¿n TrÃºc TÃ­nh ToÃ¡n](./EC2_Elastic_Compute_Cloud.md)
- ðŸ“– [TÃ i Liá»‡u ChuyÃªn SÃ¢u: Amazon Route 53 & Há»‡ Thá»‘ng DNS ÄÃ¡m MÃ¢y](./Route53_DNS.md)
- ðŸ“– [TÃ i Liá»‡u ChuyÃªn SÃ¢u: Amazon RDS & Aurora Databases](./RDS_Aurora_Databases.md)
- ðŸ“– [TÃ i Liá»‡u ChuyÃªn SÃ¢u: Amazon S3 & CloudFront Storage](./S3_and_CloudFront_Storage.md)
- ðŸ“– [Báº£ng Thuáº­t Ngá»¯ Ká»¹ Thuáº­t ÄÃ¡m MÃ¢y ToÃ n Diá»‡n](../GLOSSARY.md)
- â­ï¸ **ChuyÃªn Ä‘á» tiáº¿p theo**: [Há»‡ Thá»‘ng PhÃ¢n Giáº£i TÃªn Miá»n ÄÃ¡m MÃ¢y: Amazon Route 53](./Route53_DNS.md)
