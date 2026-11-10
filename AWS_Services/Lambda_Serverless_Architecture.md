# TÃ i Liá»‡u Há»c Táº­p ChuyÃªn SÃ¢u: AWS Lambda, Amazon API Gateway, DynamoDB & Kiáº¿n TrÃºc Phi MÃ¡y Chá»§ (Serverless Architecture)

> **TÃ i liá»‡u chuáº©n hÃ³a kiáº¿n trÃºc Ä‘Ã¡m mÃ¢y**: HÆ°á»›ng dáº«n toÃ n diá»‡n theo tiÃªu chuáº©n Senior AWS Solutions Architect & Cloud DevOps Engineer (cáº­p nháº­t má»›i nháº¥t 2026).  
> **NgÃ´n ngá»¯**: Tiáº¿ng Viá»‡t (Báº£o lÆ°u toÃ n bá»™ thuáº­t ngá»¯ chuyÃªn ngÃ nh tiáº¿ng Anh chuáº©n AWS).  
> **CÃ¡c dá»‹ch vá»¥ liÃªn quan**: AWS Lambda, Amazon API Gateway, Amazon DynamoDB, AWS Step Functions, Amazon Cognito, Amazon EventBridge.

---

## 1. Tá»•ng Quan Dá»‹ch Vá»¥ (Service Overview)

### Dá»‹ch vá»¥ gÃ¬?
MÃ´ hÃ¬nh Ä‘iá»‡n toÃ¡n phi mÃ¡y chá»§ (**Serverless**) trÃªn AWS cho phÃ©p láº­p trÃ¬nh viÃªn vÃ  kiáº¿n trÃºc sÆ° Ä‘Ã¡m mÃ¢y xÃ¢y dá»±ng vÃ  váº­n hÃ nh cÃ¡c á»©ng dá»¥ng hoÃ n chá»‰nh mÃ  khÃ´ng cáº§n cáº¥u hÃ¬nh, báº£o trÃ¬ hay quáº£n lÃ½ báº¥t ká»³ cá»¥m mÃ¡y áº£o nÃ o. Bá»™ tá»© trá»¥ cá»™t Serverless cá»‘t lÃµi bao gá»“m:
1. **AWS Lambda**: Dá»‹ch vá»¥ tÃ­nh toÃ¡n phi mÃ¡y chá»§ (Function-as-a-Service - FaaS), thá»±c thi mÃ£ nguá»“n Ä‘á»ƒ pháº£n há»“i láº¡i cÃ¡c sá»± kiá»‡n (Events), tá»± Ä‘á»™ng co giÃ£n tá»« 0 Ä‘áº¿n hÃ ng chá»¥c ngÃ n lÆ°á»£t thá»±c thi Ä‘á»“ng thá»i vÃ  chá»‰ tÃ­nh phÃ­ chÃ­nh xÃ¡c theo tá»«ng millisecond thá»±c thi mÃ£ (GB-seconds).
2. **Amazon API Gateway**: Cá»•ng káº¿t ná»‘i API Ä‘Æ°á»£c quáº£n lÃ½ toÃ n diá»‡n cho phÃ©p táº¡o, xuáº¥t báº£n, báº£o máº­t, Ä‘o lÆ°á»ng vÃ  giÃ¡m sÃ¡t cÃ¡c REST API, HTTP API vÃ  WebSocket API á»Ÿ báº¥t ká»³ quy mÃ´ nÃ o.
3. **Amazon DynamoDB**: CÆ¡ sá»Ÿ dá»¯ liá»‡u NoSQL dáº¡ng Key-Value vÃ  Document hoÃ n toÃ n phi mÃ¡y chá»§, cung cáº¥p Ä‘á»™ trá»… pháº£n há»“i dÆ°á»›i 10 millisecond (**Single-digit millisecond latency**) á»Ÿ báº¥t ká»³ quy mÃ´ lÆ°u trá»¯ vÃ  thÃ´ng lÆ°á»£ng nÃ o.
4. **AWS Step Functions**: Dá»‹ch vá»¥ Ä‘iá»u phá»‘i quy trÃ¬nh phÃ¢n tÃ¡n (Visual Workflow Orchestration) sá»­ dá»¥ng mÃ¡y tráº¡ng thÃ¡i (State Machines) Ä‘á»ƒ káº¿t ná»‘i cÃ¡c microservices, xá»­ lÃ½ luá»“ng ráº½ nhÃ¡nh vÃ  rollback giao dá»‹ch (Saga Pattern).
5. **Amazon Cognito**: Dá»‹ch vá»¥ quáº£n lÃ½ danh tÃ­nh ngÆ°á»i dÃ¹ng á»©ng dá»¥ng di Ä‘á»™ng/web, há»— trá»£ Ä‘Äƒng nháº­p, Ä‘Äƒng kÃ½ vÃ  cáº¥p quyá»n truy cáº­p tÃ i nguyÃªn AWS an toÃ n.

---

## 2. CÃ¡c KhÃ¡i Niá»‡m, Kiáº¿n TrÃºc & Váº­n HÃ nh Cá»‘t LÃµi (Core Concepts, Security & Day-2 Operations)

### 1. Giá»›i Háº¡n Ká»¹ Thuáº­t Sá»‘ng CÃ²n cá»§a AWS Lambda (Lambda Limits & Runtime)

```mermaid
flowchart LR
    subgraph ExecutionLimits[Giá»›i Háº¡n Thá»±c Thi Lambda]
        T[Timeout: Tá»‘i Ä‘a 15 phÃºt / 900s]
        M[RAM: 128 MB Ä‘áº¿n 10,240 MB\nTÄƒng RAM = TÄƒng CPU & Network]
        D[Disk /tmp: 512 MB Ä‘áº¿n 10,240 MB]
    end

    subgraph PackagingLimits[KÃ­ch ThÆ°á»›c Triá»ƒn Khai]
        Z[ZIP trá»±c tiáº¿p: Tá»‘i Ä‘a 50 MB]
        U[Uncompressed / Layer: Tá»‘i Ä‘a 250 MB]
        C[OCI / Docker Container Image: Tá»‘i Ä‘a 10 GB]
    end

    subgraph PayloadLimits[Giá»›i Háº¡n Payload Dá»¯ Liá»‡u]
        Sync[Gá»i Äá»“ng Bá»™ Synchronous: 6 MB]
        Async[Gá»i Báº¥t Äá»“ng Bá»™ Asynchronous: 256 KB]
    end
```

- **Thá»i gian thá»±c thi tá»‘i Ä‘a (Execution Timeout)**: **Tá»‘i Ä‘a 15 phÃºt (900 giÃ¢y)** cho má»™t láº§n gá»i. KhÃ´ng dÃ¹ng Lambda cho cÃ¡c tÃ¡c vá»¥ phÃ¢n tÃ­ch batch kÃ©o dÃ i hÃ ng giá» (chuyá»ƒn sang AWS Fargate hoáº·c AWS Batch).
- **Cáº¥p phÃ¡t bá»™ nhá»› RAM**: Tá»« **128 MB Ä‘áº¿n 10 GB**. Khi tÄƒng RAM, AWS tá»± Ä‘á»™ng tÄƒng tuyáº¿n tÃ­nh sá»©c máº¡nh vCPU (táº¡i 1,769 MB RAM, Lambda Ä‘Æ°á»£c cáº¥p chÃ­nh xÃ¡c 1 vCPU Ä‘áº§y Ä‘á»§).
- **á»” Ä‘Ä©a táº¡m thá»i (`/tmp`)**: Khá»Ÿi táº¡o tá»« 512 MB lÃªn tá»›i 10 GB, cÃ³ thá»ƒ dÃ¹ng Ä‘á»ƒ giáº£i nÃ©n model AI hoáº·c cache dá»¯ liá»‡u lá»›n trong cÃ¹ng má»™t mÃ´i trÆ°á»ng thá»±c thi.
- **Payload Limits**: 6 MB cho gá»i Ä‘á»“ng bá»™ (qua API Gateway / SDK invoke) vÃ  256 KB cho gá»i báº¥t Ä‘á»“ng bá»™ (qua SNS / S3 / EventBridge).

---

### 2. Quáº£n Trá»‹ Concurrency, Cold Start & SnapStart

- **Cold Start (Khá»Ÿi Ä‘á»™ng láº¡nh)**: Khi cÃ³ request má»›i mÃ  chÆ°a cÃ³ mÃ´i trÆ°á»ng thá»±c thi nÃ o sáºµn sÃ ng, Lambda pháº£i táº£i code, khá»Ÿi Ä‘á»™ng container runtime, vÃ  cháº¡y Ä‘oáº¡n mÃ£ khá»Ÿi táº¡o bÃªn ngoÃ i handler (`init code`). GÃ¢y Ä‘á»™ trá»… tá»« vÃ i trÄƒm ms Ä‘áº¿n vÃ i giÃ¢y (Ä‘áº·c biá»‡t vá»›i á»©ng dá»¥ng Java/.NET vÃ  container image) (`TD-Set8 Q09`).
- **Reserved Concurrency**: 
  - Cá»‘ Ä‘á»‹nh sá»‘ lÆ°á»£ng thá»±c thi Ä‘á»“ng thá»i tá»‘i Ä‘a dÃ nh riÃªng cho má»™t hÃ m tá»« pool tÃ i khoáº£n (vÃ­ dá»¥: gÃ¡n 200 execution slots) (`TD-Set1 Q39`).
  - **Má»¥c Ä‘Ã­ch kÃ©p sá»‘ng cÃ²n**:
    1. Äáº£m báº£o hÃ m quan trá»ng luÃ´n cÃ³ Ä‘á»§ tÃ i nguyÃªn thá»±c thi, khÃ´ng bá»‹ cÃ¡c hÃ m khÃ¡c trong tÃ i khoáº£n chiáº¿m Ä‘oáº¡t (ngÄƒn ngá»«a cáº¡n kiá»‡t pool 1,000 unreserved concurrency cá»§a Region).
    2. ÄÃ³ng vai trÃ² lÃ m tráº§n giá»›i háº¡n thÃ´ng lÆ°á»£ng tá»‘i Ä‘a nháº±m **báº£o vá»‡ cÆ¡ sá»Ÿ dá»¯ liá»‡u háº¡ nguá»“n (RDS / Aurora)** khá»i bá»‹ sáº­p do cáº¡n kiá»‡t connection pool khi traffic tÄƒng Ä‘á»™t biáº¿n (`TD-Set1 Q39`).
- **Provisioned Concurrency**:
  - Khá»Ÿi táº¡o vÃ  "lÃ m áº¥m" sáºµn má»™t sá»‘ lÆ°á»£ng mÃ´i trÆ°á»ng thá»±c thi cá»‘ Ä‘á»‹nh 24/7.
  - **Triá»‡t tiÃªu hoÃ n toÃ n Ä‘á»™ trá»… Cold Start**, Ä‘áº£m báº£o thá»i gian pháº£n há»“i á»Ÿ má»©c 2 chá»¯ sá»‘ millisecond cho cÃ¡c workload nháº¡y cáº£m vá» Ä‘á»™ trá»… (nhÆ° API tÃ i chÃ­nh, giao dá»‹ch chá»©ng khoÃ¡n, hoáº·c containerized Java microservices) (`TD-Set1 Q39`, `TD-Set8 Q09`).
- **Lambda SnapStart (cho Java 11/17/21)**: Chá»¥p snapshot toÃ n bá»™ tráº¡ng thÃ¡i bá»™ nhá»› MicroVM sau khi hoÃ n táº¥t init vÃ  cache láº¡i; khi cÃ³ request, Lambda khÃ´i phá»¥c tá»©c thá»i tá»« snapshot, giáº£m Ä‘á»™ trá»… khá»Ÿi Ä‘á»™ng tá»›i **90%** mÃ  khÃ´ng máº¥t thÃªm chi phÃ­ duy trÃ¬.
- **Lambda Function URLs**:
  - Cung cáº¥p má»™t Ä‘iá»ƒm cuá»‘i HTTPS chuyÃªn dá»¥ng (Dedicated HTTPS Endpoint) trá» trá»±c tiáº¿p vÃ o hÃ m Lambda mÃ  **KHÃ”NG Cáº¦N táº¡o Amazon API Gateway hay Application Load Balancer** (`TD-Set2 Q56`, `TD-Set6 Q43`).
  - Há»— trá»£ loáº¡i xÃ¡c thá»±c `AWS_IAM` (báº£o vá»‡ ná»™i bá»™) hoáº·c `NONE` (cÃ´ng khai internet) káº¿t há»£p CORS. Ráº¥t tá»‘i Æ°u chi phÃ­ vÃ  tinh gá»n cho cÃ¡c ká»‹ch báº£n tiáº¿p nháº­n **Webhook tá»« bÃªn thá»© ba** (nhÆ° GitHub, Stripe, hoáº·c dá»‹ch vá»¥ y táº¿ gá»­i JSON payload) (`TD-Set6 Q43`).
- **MÃ£ HÃ³a Biáº¿n MÃ´i TrÆ°á»ng (Environment Variables) Báº±ng KMS**:
  - Máº·c Ä‘á»‹nh AWS Lambda mÃ£ hÃ³a biáº¿n mÃ´i trÆ°á»ng báº±ng AWS managed key (`aws/lambda`).
  - Khi doanh nghiá»‡p yÃªu cáº§u kiá»ƒm soÃ¡t toÃ n diá»‡n vÃ²ng Ä‘á»i khÃ³a, chÃ­nh sÃ¡ch truy cáº­p hoáº·c kháº£ nÄƒng thu há»“i key ngay láº­p tá»©c, báº¯t buá»™c kÃ­ch hoáº¡t **Lambda Encryption Helpers** vÃ  sá»­ dá»¥ng **AWS KMS Customer Managed Key (CMK)** Ä‘á»ƒ mÃ£ hÃ³a cÃ¡c chuá»—i káº¿t ná»‘i vÃ  máº­t kháº©u nháº¡y cáº£m (`TD-Set1 Q58`).
- **Lambda Asynchronous Destinations**:
  - Äá»‹nh tuyáº¿n tá»± Ä‘á»™ng káº¿t quáº£ thá»±c thi cá»§a cÃ¡c tÃ¡c vá»¥ báº¥t Ä‘á»“ng bá»™ mÃ  khÃ´ng cáº§n viáº¿t mÃ£ trong hÃ m: gá»­i báº£n ghi thÃ nh cÃ´ng tá»›i **On-Success Destination** hoáº·c gá»­i chi tiáº¿t lá»—i tá»›i **On-Failure Destination** (Ä‘Ã­ch Ä‘áº¿n há»— trá»£: Amazon SQS, Amazon SNS, Amazon EventBridge, hoáº·c má»™t Lambda function khÃ¡c) (`TD-Set2 Q09`).
- **Response Streaming**: Cho phÃ©p hÃ m Lambda truyá»n luá»“ng pháº£n há»“i dá»¯ liá»‡u vá» client theo tá»«ng pháº§n (Chunked Transfer) mÃ  khÃ´ng cáº§n Ä‘á»£i toÃ n bá»™ payload hoÃ n táº¥t, giÃºp giáº£m Time-to-First-Byte (TTFB) vÃ  vÆ°á»£t giá»›i háº¡n payload 6 MB (lÃªn tá»›i 20 MB).

---

### 3. MÃ´ HÃ¬nh KÃ­ch Hoáº¡t Lambda: Sync vs Async vs Event Source Mapping

```mermaid
flowchart TD
    subgraph SyncModel[1. Synchronous Invocation]
        APIGW[API Gateway / ALB] -->|Chá» káº¿t quáº£ tráº£ vá» ngay| L1[AWS Lambda]
        L1 -->|Return Payload / Error| APIGW
    end

    subgraph AsyncModel[2. Asynchronous Invocation]
        S3[S3 / SNS / EventBridge] -->|HTTP 202 Accepted| Queue[(Internal Lambda Queue)]
        Queue --> L2[AWS Lambda]
        L2 -.->|Retry 2 láº§n tháº¥t báº¡i| DLQ[(Dead-Letter Queue SQS / SNS / Destination)]
    end

    subgraph ESMModel[3. Event Source Mapping Polling]
        Streams[(DynamoDB Streams / Kinesis / SQS)] -->|Lambda Service tá»± Ä‘á»™ng Poll| ESM[Event Source Mapping]
        ESM -->|Batching Records| L3[AWS Lambda]
    end
```

---

### 4. TÃ­ch Há»£p Amazon API Gateway Vá»›i AWS Lambda
- **MÃ´ hÃ¬nh Proxy TÃ­ch há»£p (Lambda Proxy Integration)**: API Gateway tiáº¿p nháº­n HTTP requests, Ä‘Ã³ng gÃ³i toÃ n bá»™ HTTP headers, query parameters, body thÃ nh má»™t JSON payload duy nháº¥t truyá»n vÃ o `event` cá»§a hÃ m Lambda.
- **Lá»±a chá»n loáº¡i API Gateway**:
  - **HTTP APIs**: Chi phÃ­ siÃªu ráº» (\$1.00/1M calls), Ä‘á»™ trá»… cá»±c tháº¥p (< 10ms), native OIDC/JWT Authorizer $\rightarrow$ Khuyáº¿n nghá»‹ máº·c Ä‘á»‹nh cho Serverless Microservices.
  - **REST APIs**: Há»— trá»£ API Caching, WAF, Usage Plans, API Keys, Request Validation $\rightarrow$ DÃ nh cho Enterprise B2B APIs.
  - **WebSocket APIs**: Káº¿t ná»‘i hai chiá»u bá»n bá»‰ (Stateful) cho Chat, Real-time Dashboard (`U-PT1 Q17`).
- ðŸ“– *Xem phÃ¢n tÃ­ch chuyÃªn sÃ¢u táº¡i:* [TÃ i Liá»‡u ChuyÃªn SÃ¢u: Amazon API Gateway, Cognito & Step Functions](./APIGateway_Cognito_StepFunctions.md)

---

### 5. TÃ­ch Há»£p Amazon DynamoDB & Luá»“ng Dá»¯ Liá»‡u Vá»›i AWS Lambda
- **Event Source Mapping vá»›i DynamoDB Streams**:
  - Ghi nháº­n má»i sá»± kiá»‡n thay Ä‘á»•i dá»¯ liá»‡u (`INSERT`, `MODIFY`, `REMOVE`) theo thá»i gian thá»±c vÃ  tá»± Ä‘á»™ng kÃ­ch hoáº¡t Lambda Ä‘á»ƒ xá»­ lÃ½ háº­u ká»³ (Auditing, Cache invalidation, Notification).
  - Sá»­ dá»¥ng tham sá»‘ `BisectBatchOnFunctionError: true` káº¿t há»£p On-Failure Destination Ä‘á»ƒ tá»± Ä‘á»™ng cÃ´ láº­p báº£n ghi lá»—i (Poison Pill) mÃ  khÃ´ng lÃ m táº¯c ngháº½n luá»“ng Stream (`TD-Set3 Q18`, `CM-PT1 Q50`).
- ðŸ“– *Xem phÃ¢n tÃ­ch chi tiáº¿t thiáº¿t káº¿ báº£ng, phÃ¢n vÃ¹ng vÃ  DAX táº¡i:* [TÃ i Liá»‡u ChuyÃªn SÃ¢u: Amazon DynamoDB & NoSQL Databases](./DynamoDB_NoSQL_Databases.md)

---

### 6. Kiáº¿n TrÃºc Máº¡ng Lambda Trong VPC (Lambda VPC Networking & Hyperplane ENI)

```mermaid
flowchart TD
    subgraph VPC["Amazon VPC (10.0.0.0/16)"]
        subgraph PrivateSubnet["Private Subnet (10.0.1.0/24)"]
            HENI["AWS Hyperplane ENI\n(ÄÆ°á»£c cáº¥p phÃ¡t vÃ  dÃ¹ng chung cho Lambda SG)"]
            RDS[(Amazon RDS / Aurora\nSecurity Group: Allow 3306/5432 from Lambda SG)]
        end

        subgraph PublicSubnet["Public Subnet (10.0.0.0/24)"]
            NAT[NAT Gateway\nElastic IP gÃ¡n kÃ¨m]
            IGW[Internet Gateway]
            NAT --> IGW
        end

        subgraph Endpoints["VPC Endpoints (PrivateLink)"]
            GW_S3[Gateway VPC Endpoint -> S3 / DynamoDB\n(Miá»…n phÃ­, gÃ¡n vÃ o Route Table)]
            IF_SQS[Interface VPC Endpoint -> SQS / Secrets Manager\n(ENI cÃ³ phÃ­, gáº¯n Private IP)]
        end

        HENI --> RDS
        HENI -.->|0.0.0.0/0 qua Route Table| NAT
        HENI -.-> GW_S3
        HENI -.-> IF_SQS
    end

    LambdaWorker["AWS Lambda Execution Fleet\n(Náº±m trong VPC do AWS quáº£n lÃ½)"] -->|Táº¡o tunnel qua Hyperplane| HENI
    IGW --> Internet((Public Internet / External APIs))
```

* **CÆ¡ cháº¿ Hyperplane ENI (AWS Managed Cross-Account ENI)**:
  - TrÆ°á»›c 2019, má»—i Lambda instance gáº¯n vÃ o VPC pháº£i tá»± táº¡o 1 Elastic Network Interface (ENI) riÃªng, gÃ¢y Ä‘á»™ trá»… Cold Start lÃªn tá»›i 10-30 giÃ¢y vÃ  lÃ m cáº¡n kiá»‡t IP subnet.
  - Tá»« phiÃªn báº£n kiáº¿n trÃºc hiá»‡n Ä‘áº¡i, AWS sá»­ dá»¥ng **AWS Hyperplane**. Hyperplane cáº¥p phÃ¡t má»™t sá»‘ lÆ°á»£ng nhá» ENI dÃ¹ng chung (**Shared ENIs**) cho má»—i cáº·p `Subnet + Security Group`. Khi Lambda scale tá»« 1 lÃªn 1,000 instances, chÃºng tÃ¡i sá»­ dá»¥ng cÃ¹ng cÃ¡c Hyperplane ENI nÃ y, **triá»‡t tiÃªu hoÃ n toÃ n Ä‘á»™ trá»… Cold Start do gáº¯n máº¡ng**.
* **3 Quy Táº¯c Sá»‘ng CÃ²n Khi ÄÆ°a Lambda VÃ o VPC**:
  1. **Lambda trong VPC KHÃ”NG BAO GIá»œ nháº­n Public IP**: Ká»ƒ cáº£ khi báº¡n Ä‘áº·t Lambda vÃ o má»™t Public Subnet (cÃ³ route trá» ra Internet Gateway), Lambda váº«n **KHÃ”NG THá»‚ truy cáº­p Internet**. Muá»‘n Lambda ra Internet (gá»i bÃªn thá»© ba), **báº¯t buá»™c pháº£i Ä‘áº·t Lambda vÃ o Private Subnet** vÃ  Ä‘á»‹nh tuyáº¿n `0.0.0.0/0` qua **NAT Gateway** náº±m táº¡i Public Subnet (*CM-PT1 Q23, CM-PT2 Q05*).
  2. **Truy cáº­p Database riÃªng tÆ° (RDS / Aurora)**:
     - GÃ¡n Lambda vÃ o cÃ¡c Private Subnets trong cÃ¹ng VPC vá»›i RDS.
     - Cáº¥u hÃ¬nh **Security Group Referencing**: RDS Security Group cho phÃ©p Inbound port (MySQL 3306, PostgreSQL 5432) vá»›i Source lÃ  **ID cá»§a Lambda Security Group** (thay vÃ¬ dáº£i CIDR IP).
  3. **Truy cáº­p dá»‹ch vá»¥ AWS mÃ  khÃ´ng cáº§n qua NAT Gateway**:
     - Cáº¥u hÃ¬nh **Gateway VPC Endpoint** cho S3 vÃ  DynamoDB (hoÃ n toÃ n miá»…n phÃ­, lÆ°u lÆ°á»£ng Ä‘á»‹nh tuyáº¿n ná»™i bá»™ AWS backbone).
     - Cáº¥u hÃ¬nh **Interface VPC Endpoint** cho SQS, SNS, Secrets Manager Ä‘á»ƒ tiáº¿t kiá»‡m chi phÃ­ data transfer qua NAT Gateway (*CM-PT2 Q12*).

---

### 7. Kháº£ NÄƒng Chá»‘ng Chá»‹u Khi Xá»­ LÃ½ Luá»“ng Dá»¯ Liá»‡u (Event Source Mapping Resiliency)

```mermaid
flowchart TD
    Stream[(Kinesis Data Streams / DynamoDB Streams)] -->|Láº¥y 1 lÃ´ 100 báº£n ghi| ESM[Event Source Mapping]
    ESM --> Lambda[HÃ m AWS Lambda]
    Lambda -->|Báº£n ghi thá»© 45 bá»‹ lá»—i nÃ©m Exception| ESM
    
    ESM --> BisectCheck{Báº­t BisectBatchOnFunctionError?}
    BisectCheck -->|CÃ“ (Khuyáº¿n nghá»‹)| Split["Tá»± Ä‘á»™ng chia Ä‘Ã´i lÃ´ dá»¯ liá»‡u thÃ nh 2 ná»­a (50 báº£n ghi)\nGá»i láº¡i Lambda Ä‘á»™c láº­p cho tá»«ng ná»­a"]
    Split --> FindPoison["CÃ´ láº­p chÃ­nh xÃ¡c báº£n ghi lá»—i (Poison Pill)\nGá»­i báº£n ghi há»ng vÃ o SQS DLQ / SNS Destination"]
    Split --> ProcessHealthy["99 báº£n ghi há»£p lá»‡ cÃ²n láº¡i Ä‘Æ°á»£c xá»­ lÃ½ thÃ nh cÃ´ng!"]
    
    BisectCheck -->|KHÃ”NG (Máº·c Ä‘á»‹nh)| RetryForever["Thá»­ láº¡i toÃ n bá»™ lÃ´ 100 báº£n ghi liÃªn tá»¥c\n-> GÃ‚Y NGHáº¼N TOÃ€N Bá»˜ SHARD (Head-of-Line Blocking)!"]
```

* **Váº¥n Ä‘á» Head-of-Line Blocking**: Khi xá»­ lÃ½ Kinesis hoáº·c DynamoDB Streams theo thá»© tá»± thá»i gian (shards), náº¿u má»™t báº£n ghi trong lÃ´ bá»‹ lá»—i (`poison pill`), máº·c Ä‘á»‹nh Lambda sáº½ thá»­ láº¡i toÃ n bá»™ lÃ´ Ä‘Ã³ cho Ä‘áº¿n khi háº¿t háº¡n (Retention Period). Äiá»u nÃ y lÃ m táº¯c ngháº½n toÃ n bá»™ luá»“ng xá»­ lÃ½ cá»§a shard.
* **Bá»™ cáº¥u hÃ¬nh phá»¥c há»“i chuáº©n má»±c (Stream Resiliency Controls)**:
  1. **`BisectBatchOnFunctionError: true`**: Khi gáº·p lá»—i, tá»± Ä‘á»™ng chia Ä‘Ã´i lÃ´ dá»¯ liá»‡u vÃ  thá»­ láº¡i tá»«ng ná»­a. QuÃ¡ trÃ¬nh chia Ä‘Ã´i láº·p láº¡i cho Ä‘áº¿n khi cÃ´ láº­p Ä‘Ãºng 1 báº£n ghi lá»—i duy nháº¥t (*TD-Set3 Q18*).
  2. **`MaximumRetryAttempts`**: Giá»›i háº¡n sá»‘ láº§n thá»­ láº¡i tá»‘i Ä‘a (vÃ­ dá»¥: 3 láº§n) thay vÃ¬ thá»­ láº¡i vÃ´ táº­n.
  3. **`MaximumRecordAgeInSeconds`**: Bá» qua cÃ¡c báº£n ghi Ä‘Ã£ quÃ¡ cÅ© (vÃ­ dá»¥: quÃ¡ 3,600 giÃ¢y).
  4. **`On-Failure Destination`**: Tá»± Ä‘á»™ng chuyá»ƒn metadata cá»§a báº£n ghi lá»—i sang **Amazon SQS** hoáº·c **Amazon SNS** Ä‘á»ƒ ká»¹ sÆ° phÃ¢n tÃ­ch sau, giáº£i phÃ³ng shard tiáº¿p tá»¥c xá»­ lÃ½ (*CM-PT1 Q50*).

---

### ðŸ›ï¸ I. CÃ¡c Ká»‹ch Báº£n Kiáº¿n TrÃºc Chuáº©n (Best Practice Scenarios)

#### 1. Pipeline Ingestion Serverless HoÃ n ToÃ n: SQS Standard + Lambda + DynamoDB Auto-Scaling
- **TÃ¬nh huá»‘ng thi**: Há»‡ thá»‘ng IoT nháº­n telemetry dá»¯ liá»‡u cáº£m biáº¿n xe hÆ¡i vá»›i lÆ°u lÆ°á»£ng thay Ä‘á»•i tháº¥t thÆ°á»ng. YÃªu cáº§u kiáº¿n trÃºc 100% serverless, khÃ´ng cáº§n cáº¥u hÃ¬nh dung lÆ°á»£ng thá»§ cÃ´ng (no manual capacity provisioning).
- **Giáº£i phÃ¡p tá»‘i Æ°u chuáº©n AWS**:
  - Dá»¯ liá»‡u cáº£m biáº¿n Ä‘áº©y vÃ o **Amazon SQS Standard Queue**.
  - **AWS Lambda** tá»± Ä‘á»™ng poll tin nháº¯n theo lÃ´ (batches) thÃ´ng qua cÆ¡ cháº¿ Event Source Mapping (ESM).
  - Lambda ghi dá»¯ liá»‡u vÃ o báº£ng **Amazon DynamoDB** Ä‘Æ°á»£c cáº¥u hÃ¬nh cháº¿ Ä‘á»™ **On-Demand Capacity** hoáº·c **Provisioned Mode kÃ¨m Auto-Scaling**.
  - **Lá»£i Ã­ch**: ToÃ n bá»™ há»‡ thá»‘ng tá»± Ä‘á»™ng co giÃ£n tá»« 0 Ä‘áº¿n hÃ ng ngÃ n request/s mÃ  khÃ´ng cáº§n can thiá»‡p váº­n hÃ nh.

#### 2. Äiá»u Phá»‘i Quy TrÃ¬nh Serverless Phá»©c Táº¡p Báº±ng AWS Step Functions (Orchestration vs Choreography)
- **TÃ¬nh huá»‘ng thi**: Quy trÃ¬nh xá»­ lÃ½ áº£nh/video hoáº·c pipeline Data Lake ETL cáº§n cháº¡y tuáº§n tá»± nhiá»u bÆ°á»›c, kiá»ƒm tra Ä‘iá»u kiá»‡n, xá»­ lÃ½ lá»—i (retry/catch), vÃ  cÃ³ cÃ¡c tÃ¡c vá»¥ batch kÃ©o dÃ i.
- **Giáº£i phÃ¡p chuáº©n**:
  - KhÃ´ng viáº¿t má»™t hÃ m Lambda "khá»•ng lá»“" chá»©a toÃ n bá»™ logic (Anti-pattern).
  - Sá»­ dá»¥ng **AWS Step Functions (Standard Workflow)** lÃ m bá»™ Ä‘iá»u phá»‘i tráº¡ng thÃ¡i (State Machine):
    - BÆ°á»›c 1: Lambda validate input.
    - BÆ°á»›c 2: Trigger **AWS Glue ETL Job** hoáº·c **AWS Batch** Ä‘á»ƒ xá»­ lÃ½ náº·ng.
    - BÆ°á»›c 3: Äá»£i tÃ¡c vá»¥ hoÃ n táº¥t (sá»­ dá»¥ng service integration `.sync`).
    - BÆ°á»›c 4: Gá»­i thÃ´ng bÃ¡o SNS khi thÃ nh cÃ´ng hoáº·c Ä‘áº©y vÃ o DLQ khi tháº¥t báº¡i.

#### 3. Quáº£n Trá»‹ Concurrency Báº£o Vá»‡ Database PhÃ­a Sau (RDS / Aurora)
- **TÃ¬nh huá»‘ng thi**: á»¨ng dá»¥ng Serverless gá»i vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u quan há»‡ (Amazon RDS/Aurora). Khi traffic tÄƒng Ä‘á»™t biáº¿n, hÃ ng ngÃ n Lambda instance khá»Ÿi táº¡o Ä‘á»“ng thá»i lÃ m cáº¡n kiá»‡t connection pool cá»§a Database.
- **Giáº£i phÃ¡p chuáº©n**:
  - Cáº¥u hÃ¬nh **Reserved Concurrency** trÃªn hÃ m Lambda (vÃ­ dá»¥: giá»›i háº¡n tá»‘i Ä‘a 50 concurrent executions) Ä‘á»ƒ táº¡o tráº§n cháº·n quÃ¡ táº£i database.
  - Káº¿t há»£p sá»­ dá»¥ng **Amazon RDS Proxy**: Quáº£n lÃ½ connection pool táº­p trung, chia sáº» káº¿t ná»‘i giá»¯a cÃ¡c hÃ m Lambda, giáº£m thiá»ƒu 90% chi phÃ­ má»Ÿ káº¿t ná»‘i má»›i.

---

### ðŸª¤ II. CÃ¡c Báº«y Thi Tinh Vi & PhÃ¢n TÃ­ch PhÆ°Æ¡ng Ãn Sai (Exam Traps & Distractors)

#### ðŸª¤ Báº«y 1: Giá»›i Háº¡n Thá»i Gian 15 PhÃºt Cá»§a Lambda (Execution Timeout) â€” (U-PT2 Q02)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p cÃ³ má»™t script phÃ¢n tÃ­ch dá»¯ liá»‡u cáº§n cháº¡y Ä‘á»‹nh ká»³ má»—i Ä‘Ãªm, thá»i gian thá»±c thi máº¥t tá»« 25 Ä‘áº¿n 30 phÃºt. Giáº£i phÃ¡p Serverless nÃ o tá»‘i Æ°u vÃ  tá»‘n Ã­t cÃ´ng quáº£n trá»‹ nháº¥t?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *DÃ¹ng AWS Lambda*: Giá»›i háº¡n cá»©ng báº¥t biáº¿n cá»§a Lambda lÃ  **tá»‘i Ä‘a 15 phÃºt (900 giÃ¢y)**. Báº¥t ká»³ tÃ¡c vá»¥ nÃ o vÆ°á»£t quÃ¡ 15 phÃºt Ä‘á»u bá»‹ Lambda há»§y bá» báº¯t buá»™c (Force Kill). KhÃ´ng thá»ƒ cáº¥u hÃ¬nh timeout lá»›n hÆ¡n 15m.
  - âŒ *Chia nhá» hÃ m Lambda thÃ nh nhiá»u hÃ m lá»“ng nhau*: GÃ¢y phá»©c táº¡p mÃ£ nguá»“n vÃ  khÃ³ báº£o trÃ¬ khÃ´ng cáº§n thiáº¿t.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Amazon ECS Task cháº¡y trÃªn AWS Fargate**, Ä‘Æ°á»£c láº­p lá»‹ch kÃ­ch hoáº¡t bá»Ÿi **Amazon EventBridge Scheduler**.
  - AWS Fargate lÃ  serverless container (khÃ´ng cáº§n quáº£n lÃ½ mÃ¡y chá»§ EC2).
  - KhÃ´ng cÃ³ giá»›i háº¡n thá»i gian cháº¡y (cÃ³ thá»ƒ cháº¡y bao lÃ¢u tÃ¹y Ã½).

#### ðŸª¤ Báº«y 2: TÃ¡i Sá»­ Dá»¥ng MÃ£ Nguá»“n & ThÆ° Viá»‡n Giá»¯a Nhiá»u Lambda (Lambda Layers) â€” (CM-PT1 Q17)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Äá»™i ngÅ© phÃ¡t triá»ƒn xÃ¢y dá»±ng nhiá»u microservices báº±ng AWS Lambda. CÃ³ má»™t bá»™ thÆ° viá»‡n tiá»‡n Ã­ch (common utilities/logging) cáº§n Ä‘Æ°á»£c dÃ¹ng chung giá»¯a táº¥t cáº£ cÃ¡c hÃ m vÃ  pháº£i cáº­p nháº­t phiÃªn báº£n dá»… dÃ ng vá»›i chi phÃ­ váº­n hÃ nh tháº¥p nháº¥t."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *ÄÃ³ng gÃ³i thÆ° viá»‡n vÃ o tá»«ng file ZIP cá»§a má»—i hÃ m*: Má»—i láº§n sá»­a 1 dÃ²ng code tiá»‡n Ã­ch pháº£i build vÃ  redeploy toÃ n bá»™ hÃ ng chá»¥c hÃ m Lambda.
  - âŒ *LÆ°u file code trÃªn S3 vÃ  cho Lambda táº£i vá» khi cháº¡y*: TÄƒng Ä‘Ã¡ng ká»ƒ Ä‘á»™ trá»… Cold Start vÃ  chi phÃ­ request S3.
  - âŒ *Chuyá»ƒn toÃ n bá»™ sang Container Image*: TÄƒng kÃ­ch thÆ°á»›c package vÃ  overhead quy trÃ¬nh CI/CD.
- **Giáº£i phÃ¡p ÄÃšNG**: ÄÃ³ng gÃ³i thÆ° viá»‡n vÃ o **AWS Lambda Layers**.
  - Má»™t Layer cÃ³ thá»ƒ Ä‘Æ°á»£c chia sáº» giá»¯a nhiá»u Lambda functions trong cÃ¹ng tÃ i khoáº£n hoáº·c xuyÃªn tÃ i khoáº£n.
  - Há»— trá»£ Ä‘Ã¡nh sá»‘ phiÃªn báº£n (Versioning) rÃµ rÃ ng. Má»—i hÃ m Lambda cÃ³ thá»ƒ gáº¯n tá»‘i Ä‘a 5 Layers.

#### ðŸª¤ Báº«y 3: TrÃ¹ng Láº·p Äá»‹nh Danh Ngáº«u NhiÃªn (UUID) Trong Lambda SnapStart â€” (CM-PT1 Q27)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng Java sá»­ dá»¥ng AWS Lambda SnapStart Ä‘á»ƒ tá»‘i Æ°u Cold Start. Sau khi triá»ƒn khai, há»‡ thá»‘ng phÃ¡t hiá»‡n cÃ¡c mÃ£ giao dá»‹ch ngáº«u nhiÃªn (UUID) táº¡o ra tá»« cÃ¡c execution environments khÃ¡c nhau bá»‹ trÃ¹ng láº·p nhau hoÃ n toÃ n."*
- **NguyÃªn nhÃ¢n cá»‘t lÃµi**:
  - SnapStart khá»Ÿi Ä‘á»™ng container, thá»±c thi toÃ n bá»™ giai Ä‘oáº¡n `Init`, sau Ä‘Ã³ chá»¥p snapshot bá»™ nhá»› RAM vÃ  lÆ°u trá»¯.
  - Náº¿u mÃ£ nguá»“n sinh UUID hoáº·c thiáº¿t láº­p random seed ngay trong giai Ä‘oáº¡n `Init` tÄ©nh trÆ°á»›c snapshot, tráº¡ng thÃ¡i bá»™ nhá»› Ä‘Ã³ sáº½ Ä‘Æ°á»£c giá»¯ nguyÃªn cho má»i instance khÃ´i phá»¥c sau nÃ y -> **toÃ n bá»™ cÃ¡c instance má»›i Ä‘á»u mang cÃ¹ng 1 giÃ¡ trá»‹ ID**!
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **CRaC (Coordinated Restore at Checkpoint) API**:
  - Gá»i `org.crac.Core.getGlobalContext().register(resource)` Ä‘á»ƒ Ä‘Äƒng kÃ½ **pre-snapshot hook** hoáº·c **post-restore hook**.
  - Äáº£m báº£o cÃ¡c giÃ¡ trá»‹ ngáº«u nhiÃªn, UUID, hoáº·c káº¿t ná»‘i máº¡ng Ä‘Æ°á»£c táº¡o má»›i láº¡i táº¡i thá»i Ä‘iá»ƒm runtime sau khi restore.

#### ðŸª¤ Báº«y 4: PhÃ¢n Biá»‡t Tuyá»‡t Äá»‘i Cognito User Pools vs Cognito Identity Pools â€” (U-PT6 Q39, U-PT2 Q14)
- **Báº«y thi kinh Ä‘iá»ƒn**: Äá» thi thÆ°á»ng yÃªu cáº§u ngÆ°á»i dÃ¹ng á»©ng dá»¥ng di Ä‘á»™ng táº£i file trá»±c tiáº¿p lÃªn S3 hoáº·c Ä‘Äƒng nháº­p vÃ o Web. ThÃ­ sinh ráº¥t dá»… nháº§m láº«n giá»¯a User Pool vÃ  Identity Pool.

| TiÃªu chuáº©n so sÃ¡nh | Amazon Cognito User Pool | Amazon Cognito Identity Pool (Federated Identities) |
|:---|:---|:---|
| **Má»¥c Ä‘Ã­ch chÃ­nh** | **XÃ¡c thá»±c danh tÃ­nh (Authentication)** | **Cáº¥p quyá»n truy cáº­p tÃ i nguyÃªn AWS (Authorization)** |
| **Äáº§u ra (Output)** | Tráº£ vá» cÃ¡c **JWT Tokens** (ID Token, Access Token, Refresh Token) | Tráº£ vá» **AWS Temporary Credentials** (Access Key, Secret Key, Session Token) |
| **Cáº¥p quyá»n AWS** | âŒ **KHÃ”NG** cáº¥p quyá»n truy cáº­p tÃ i nguyÃªn AWS trá»±c tiáº¿p | âœ… **GÃ¡n IAM Role** cho user Ä‘á»ƒ gá»i tháº³ng API AWS (S3, DynamoDB) |
| **TÃ­ch há»£p ALB** | âœ… **ALB há»— trá»£ native** xÃ¡c thá»±c ngÆ°á»i dÃ¹ng qua User Pool listener rules | âŒ KhÃ´ng gáº¯n trá»±c tiáº¿p vÃ o ALB listener rules |
| **ÄÄƒng nháº­p xÃ£ há»™i** | Há»— trá»£ Sign-in with Apple, Google, Facebook, SAML, OIDC | Nháº­n token tá»« User Pool hoáº·c Google/Facebook Ä‘á»ƒ Ä‘á»•i láº¥y IAM Role |

- **Quy táº¯c thi cá»­**:
  - NgÆ°á»i dÃ¹ng Ä‘Äƒng nháº­p web qua ALB -> **Cognito User Pool**.
  - App di Ä‘á»™ng cáº§n upload trá»±c tiáº¿p lÃªn S3 bucket riÃªng cá»§a user -> **Cognito User Pool (Ä‘Äƒng nháº­p) + Cognito Identity Pool (láº¥y quyá»n IAM Role ghi vÃ o S3)**.

#### ðŸª¤ Báº«y 5: Ngháº½n LÆ°u LÆ°á»£ng Khi SNS Gá»­i Tin Tá»›i Lambda (SNS-to-Lambda Delivery Bottlenecks) â€” (U-PT1 Q34)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Amazon SNS fan-out tin nháº¯n tá»›i hÃ ng ngÃ n subscribers, trong Ä‘Ã³ cÃ³ má»™t hÃ m AWS Lambda. Äá»™i ngÅ© phÃ¡t hiá»‡n má»™t lÆ°á»£ng lá»›n tin nháº¯n bá»‹ cháº­m trá»… hoáº·c tháº¥t báº¡i khi invoke Lambda."*
- **NguyÃªn nhÃ¢n & Kháº¯c phá»¥c**:
  - Khi SNS invoke Lambda (theo mÃ´ hÃ¬nh Asynchronous), sá»‘ lÆ°á»£ng concurrency cá»§a Lambda tÄƒng vá»t. Náº¿u tÃ i khoáº£n Ä‘áº¡t ngÆ°á»¡ng giá»›i háº¡n **Account Concurrency Limit** (máº·c Ä‘á»‹nh 1,000 unreserved concurrency/Region), cÃ¡c yÃªu cáº§u invoke tiáº¿p theo sáº½ bá»‹ throttle.
  - **Giáº£i phÃ¡p**: YÃªu cáº§u AWS Support tÄƒng **Account Concurrency Quota** hoáº·c cáº¥u hÃ¬nh SQS lÃ m buffer Ä‘á»‡m giá»¯a SNS vÃ  Lambda.

#### ðŸª¤ Báº«y 6: Gá»i HÃ m Lambda XuyÃªn TÃ i Khoáº£n Tá»« Amazon SNS â€” (CM-PT1 Q61)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Há»‡ thá»‘ng sá»­ dá»¥ng Amazon SNS Topic táº¡i TÃ i khoáº£n AWS A Ä‘á»ƒ thÃ´ng bÃ¡o sá»± kiá»‡n. Cáº§n gá»i thá»±c thi má»™t hÃ m AWS Lambda táº¡i TÃ i khoáº£n AWS B má»—i khi cÃ³ thÃ´ng bÃ¡o má»›i. Cáº¥u hÃ¬nh phÃ¢n quyá»n nÃ o báº¯t buá»™c pháº£i cÃ³?"*
- **Quy táº¯c báº¯t buá»™c pháº£i cÃ³ 2 chÃ­nh sÃ¡ch Ä‘á»“ng thá»i**:
  1. **Lambda Resource-Based Policy táº¡i TÃ i khoáº£n B**: Báº¯t buá»™c thÃªm má»™t permission statement cho phÃ©p Principal `sns.amazonaws.com` thá»±c hiá»‡n Action `lambda:InvokeFunction` vá»›i Ä‘iá»u kiá»‡n `SourceArn` trá» chÃ­nh xÃ¡c vÃ o ARN cá»§a SNS Topic á»Ÿ TÃ i khoáº£n A.
  2. **SNS Topic Policy táº¡i TÃ i khoáº£n A**: Báº¯t buá»™c cho phÃ©p TÃ i khoáº£n B hoáº·c Lambda function quyá»n `sns:Subscribe` vÃ o Topic nÃ y.
- **Báº«y Ä‘á» thi**: Chá»‰ cáº¥u hÃ¬nh 1 trong 2 phÃ­a (vÃ­ dá»¥ chá»‰ táº¡o IAM Role gÃ¡n vÃ o Lambda hoáº·c chá»‰ sá»­a topic policy) $\rightarrow$ Thao tÃ¡c subscribe hoáº·c invoke sáº½ bá»‹ tá»« chá»‘i truy cáº­p ngay láº­p tá»©c!

#### ðŸª¤ Báº«y 7: Xá»­ LÃ½ Äá»£t Táº£i TÄƒng Äá»™t Biáº¿n Báº±ng SQS Äá»‡m TrÆ°á»›c Lambda â€” (CM-PT1 Q35, CM-PT5 Q08)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Website tin tá»©c tiáº¿p nháº­n lÆ°á»£ng lá»›n bÃ i viáº¿t gá»­i vá» Ä‘á»“ng thá»i trong cÃ¡c sá»± kiá»‡n thá»ƒ thao lá»›n. Náº¿u gá»­i trá»±c tiáº¿p tá»›i cá»¥m xá»­ lÃ½ backend sáº½ gÃ¢y quÃ¡ táº£i sáº­p cÆ¡ sá»Ÿ dá»¯ liá»‡u. Cáº§n giáº£i phÃ¡p phÃ¢n rÃ£ kiáº¿n trÃºc vá»›i chi phÃ­ tháº¥p nháº¥t."*
- **Giáº£i phÃ¡p ÄÃšNG**:
  - Sá»­ dá»¥ng hÃ m **AWS Lambda Ingestion** tiáº¿p nháº­n bÃ i viáº¿t vÃ  Ä‘áº©y vÃ o hÃ ng Ä‘á»£i **Amazon SQS Standard**.
  - Má»™t nhÃ³m worker Lambda khÃ¡c cáº¥u hÃ¬nh **SQS Event Source Mapping** vá»›i Batch Size phÃ¹ há»£p Ä‘á»ƒ láº¥y tin nháº¯n ra xá»­ lÃ½ tuáº§n tá»±/song song cÃ³ kiá»ƒm soÃ¡t.
  - SQS hoáº¡t Ä‘á»™ng nhÆ° má»™t há»“ chá»©a Ä‘á»‡m (Buffer leveling), triá»‡t tiÃªu hoÃ n toÃ n nguy cÆ¡ quÃ¡ táº£i backend.

#### ðŸª¤ Báº«y 8: Äiá»u Phá»‘i Luá»“ng Xá»­ LÃ½ Serverless Phá»©c Táº¡p Báº±ng AWS Step Functions â€” (CM-PT1 Q06, CM-PT1 Q38)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Quy trÃ¬nh xá»­ lÃ½ áº£nh vÃ  trÃ­ch xuáº¥t dá»¯ liá»‡u ETL serverless bao gá»“m nhiá»u bÆ°á»›c: kiá»ƒm tra Ä‘á»‹nh dáº¡ng áº£nh, gá»i AWS Batch Ä‘á»ƒ resize nhiá»u kÃ­ch cá»¡, gá»i AWS Glue Ä‘á»ƒ trÃ­ch xuáº¥t text, vÃ  lÆ°u káº¿t quáº£ vÃ o S3. CÃ¡c bÆ°á»›c cÃ³ logic ráº½ nhÃ¡nh Ä‘iá»u kiá»‡n vÃ  cáº§n tá»± Ä‘á»™ng thá»­ láº¡i khi gáº·p lá»—i máº¡ng."*
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **AWS Step Functions (State Machines)** (`CM-PT1 Q06`, `CM-PT1 Q38`).
  - Step Functions cung cáº¥p giao diá»‡n trá»±c quan hÃ³a tráº¡ng thÃ¡i thá»±c thi.
  - Tá»± Ä‘á»™ng hÃ³a viá»‡c xá»­ lÃ½ lá»—i (Catch & Retry vá»›i Exponential Backoff), kiá»ƒm soÃ¡t timeout tá»«ng bÆ°á»›c vÃ  há»— trá»£ cáº£ luá»“ng cÃ´ng viá»‡c cháº¡y dÃ i háº¡n (lÃªn tá»›i 1 nÄƒm). Loáº¡i bá» hoÃ n toÃ n viá»‡c viáº¿t code spaghetti Lambda gá»i lá»“ng nhau!

#### ðŸª¤ Báº«y 9: NgÄƒn Ngá»«a Cáº¡n Kiá»‡t Concurrency & Báº£o Vá»‡ Database Báº±ng Reserved Concurrency â€” (CM-PT2 Q59)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t á»©ng dá»¥ng thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ tráº£i qua sá»± kiá»‡n bÃ¹ng ná»• flash sale. HÃ ng ngÃ n request Ä‘á»• dá»“n vÃ o má»™t hÃ m Lambda káº¿t ná»‘i trá»±c tiáº¿p vá»›i Amazon RDS MySQL. CÆ¡ sá»Ÿ dá»¯ liá»‡u bá»‹ cáº¡n kiá»‡t connection pool dáº«n Ä‘áº¿n sáº­p toÃ n bá»™ há»‡ thá»‘ng. Cáº§n giáº£i phÃ¡p gÃ¬ á»Ÿ táº§ng Lambda Ä‘á»ƒ giá»›i háº¡n sá»‘ lÆ°á»£ng káº¿t ná»‘i tá»‘i Ä‘a?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *TÄƒng RAM cho Lambda lÃªn 10 GB*: TÄƒng RAM chá»‰ tÄƒng CPU, cÃ ng khiáº¿n Lambda táº¡o nhiá»u káº¿t ná»‘i dá»“n dáº­p vÃ o database nhanh hÆ¡n!
  - âŒ *TÄƒng Provisioned Concurrency*: CÃ ng lÃ m sáºµn nhiá»u execution environments lÃ m DB quÃ¡ táº£i tá»©c thÃ¬.
- **Giáº£i phÃ¡p ÄÃšNG**: Cáº¥u hÃ¬nh **Reserved Concurrency** cho hÃ m Lambda (vÃ­ dá»¥: Ä‘áº·t má»©c 50 hoáº·c 100) (`CM-PT2 Q59`).
  - Reserved Concurrency Ã¡p Ä‘áº·t má»™t "tráº§n cá»©ng" (Hard Limit) vá» sá»‘ lÆ°á»£ng thá»±c thi Ä‘á»“ng thá»i tá»‘i Ä‘a cá»§a hÃ m. Má»i request vÆ°á»£t quÃ¡ sáº½ bá»‹ throttle táº¡m thá»i (káº¿t há»£p vá»›i Amazon SQS Ä‘á»‡m phÃ­a trÆ°á»›c hoáº·c RDS Proxy), báº£o vá»‡ tuyá»‡t Ä‘á»‘i database khÃ´ng bá»‹ cháº¿t káº¿t ná»‘i.

#### ðŸª¤ Báº«y 10: XÃ³a Bá» Äá»™ Trá»… Cold Start: AWS Lambda SnapStart vs Provisioned Concurrency â€” (TD-Set8 Q09, CM-PT5 Q63, CM-PT4 Q18, U-PT3 Q43)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p chuyá»ƒn Ä‘á»•i má»™t á»©ng dá»¥ng microservices viáº¿t báº±ng Java lÃªn AWS Lambda. Há»‡ thá»‘ng yÃªu cáº§u thá»i gian pháº£n há»“i API pháº£i nháº¥t quÃ¡n vÃ  dÆ°á»›i 50ms cho cÃ¡c giao dá»‹ch tÃ i chÃ­nh quan trá»ng. Tuy nhiÃªn cÃ¡c request Ä‘áº§u tiÃªn thÆ°á»ng bá»‹ trá»… vÃ i giÃ¢y do Cold Start náº¡p JVM. Cáº§n giáº£i phÃ¡p xá»­ lÃ½ tá»‘i Æ°u nháº¥t?"*
- **Quy táº¯c phÃ¢n biá»‡t 2 giáº£i phÃ¡p Cold Start sá»‘ng cÃ²n**:
  1. **Khi Ä‘á» bÃ i lÃ  á»©ng dá»¥ng Java & yÃªu cáº§u chi phÃ­ tá»‘i Æ°u nháº¥t (hoáº·c giáº£i phÃ¡p miá»…n phÃ­)** $\rightarrow$ Chá»n **AWS Lambda SnapStart** (`TD-Set8 Q09`, `CM-PT5 Q63`).
     - SnapStart náº¡p JVM vÃ  thá»±c thi toÃ n bá»™ code khá»Ÿi táº¡o, sau Ä‘Ã³ chá»¥p má»™t snapshot microVM lÆ°u vÃ o bá»™ nhá»› cache Ä‘a táº§ng. Khi cÃ³ invocation má»›i, Lambda khÃ´i phá»¥c tá»« snapshot chá»‰ máº¥t dÆ°á»›i 200ms.
     - TÃ­nh nÄƒng nÃ y **hoÃ n toÃ n MIá»„N PHÃ**, khÃ´ng phÃ¡t sinh chi phÃ­ duy trÃ¬ 24/7!
     - *LÆ°u Ã½ an ninh*: Cáº§n dÃ¹ng **CRaC (Coordinated Restore at Checkpoint) Pre-Snapshot Hook** Ä‘á»ƒ trÃ¡nh trÃ¹ng láº·p cÃ¡c giÃ¡ trá»‹ ngáº«u nhiÃªn hoáº·c UUID khá»Ÿi táº¡o trÆ°á»›c snapshot (`CM-PT1 Q27`).
  2. **Khi Ä‘á» bÃ i dÃ¹ng ngÃ´n ngá»¯ khÃ¡c (Python, Node.js, Go, Container Images) hoáº·c Ä‘á» bÃ i khÃ´ng cÃ³ phÆ°Æ¡ng Ã¡n SnapStart** $\rightarrow$ Chá»n **Provisioned Concurrency** (`CM-PT4 Q18`, `U-PT3 Q43`).
     - AWS duy trÃ¬ sáºµn má»™t sá»‘ lÆ°á»£ng execution environments áº¥m 24/7.
     - CÃ³ tÃ­nh phÃ­ duy trÃ¬ concurrency theo giá» (\$0.015 / GB-giá») ká»ƒ cáº£ khi khÃ´ng cÃ³ traffic.

#### ðŸª¤ Báº«y 11: TÃ­ch Há»£p Webhook BÃªn Thá»© Ba Chi PhÃ­ Tháº¥p Báº±ng Lambda Function URLs â€” (TD-Set2 Q56, TD-Set6 Q43)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t cÃ´ng ty y táº¿ cáº§n tÃ­ch há»£p má»™t dá»‹ch vá»¥ phÃ¢n tÃ­ch dá»¯ liá»‡u bÃªn thá»© ba. Má»—i khi cÃ³ dá»¯ liá»‡u bá»‡nh nhÃ¢n má»›i, bÃªn thá»© ba sáº½ gá»­i HTTP POST request vÃ o má»™t Webhook trÃªn AWS. YÃªu cáº§u triá»ƒn khai endpoint tiáº¿p nháº­n request nÃ y Ä‘á»ƒ gá»i hÃ m Lambda vá»›i CHI PHÃ Váº¬N HÃ€NH VÃ€ Háº  Táº¦NG THáº¤P NHáº¤T (LEAST operational overhead & cost)."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Táº¡o má»™t Application Load Balancer (ALB) chuyá»ƒn tiáº¿p tá»›i Lambda*: ALB phÃ¡t sinh chi phÃ­ cá»‘ Ä‘á»‹nh tá»‘i thiá»ƒu ~\$16-20/thÃ¡ng vÃ  tá»‘n cÃ´ng cáº¥u hÃ¬nh VPC/Subnet.
  - âŒ *Dá»±ng Amazon API Gateway REST API*: Hoáº¡t Ä‘á»™ng Ä‘Æ°á»£c nhÆ°ng phÃ¡t sinh thÃªm má»™t táº§ng dá»‹ch vá»¥ vÃ  chi phÃ­ API Gateway khÃ´ng cáº§n thiáº¿t cho má»™t webhook Ä‘Æ¡n giáº£n.
- **Giáº£i phÃ¡p ÄÃšNG**: Cáº¥u hÃ¬nh **Lambda Function URL** vá»›i `AuthType: NONE` (kÃ¨m xÃ¡c thá»±c token/HMAC bÃªn trong code) (`TD-Set2 Q56`, `TD-Set6 Q43`).
  - Cung cáº¥p trá»±c tiáº¿p má»™t URL HTTPS báº£o máº­t cho hÃ m Lambda.
  - HoÃ n toÃ n miá»…n phÃ­ háº¡ táº§ng trung gian (chá»‰ tráº£ tiá»n thá»±c thi Lambda), thiáº¿t láº­p nhanh chÃ³ng chá»‰ trong vÃ i giÃ¢y.

#### ðŸª¤ Báº«y 12: Báº£o Máº­t Biáº¿n MÃ´i TrÆ°á»ng Lambda Báº±ng KMS Customer Managed Key â€” (TD-Set1 Q58)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"HÃ m AWS Lambda cáº§n lÆ°u trá»¯ cÃ¡c chuá»—i káº¿t ná»‘i vÃ  thÃ´ng tin bÃ­ máº­t káº¿t ná»‘i tá»›i MongoDB Atlas hoáº·c database bÃªn ngoÃ i. Quy Ä‘á»‹nh an ninh cá»§a cÃ´ng ty yÃªu cáº§u toÃ n bá»™ dá»¯ liá»‡u bÃ­ máº­t pháº£i Ä‘Æ°á»£c mÃ£ hÃ³a táº¡i chá»— (at-rest) báº±ng khÃ³a mÃ£ hÃ³a do cÃ´ng ty tá»± quáº£n lÃ½ vÃ  cÃ³ thá»ƒ thu há»“i quyá»n báº¥t cá»© lÃºc nÃ o."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Sá»­ dá»¥ng AWS managed key máº·c Ä‘á»‹nh cá»§a Lambda (`aws/lambda`)*: KhÃ´ng Ä‘Ã¡p á»©ng yÃªu cáº§u vÃ¬ khÃ¡ch hÃ ng khÃ´ng thá»ƒ chá»‰nh sá»­a policy, khÃ´ng thá»ƒ xoay vÃ²ng thá»§ cÃ´ng hay thu há»“i key.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **AWS KMS Customer Managed Key (CMK)** káº¿t há»£p **Lambda Encryption Helpers** (`TD-Set1 Q58`).
  - Quáº£n trá»‹ viÃªn cáº¥u hÃ¬nh mÃ£ hÃ³a biáº¿n mÃ´i trÆ°á»ng báº±ng KMS CMK riÃªng.
  - MÃ£ nguá»“n Lambda gá»i AWS KMS API Ä‘á»ƒ giáº£i mÃ£ biáº¿n mÃ´i trÆ°á»ng trong runtime vÃ  phÃ¢n quyá»n chi tiáº¿t qua KMS Key Policy.

#### ðŸª¤ Báº«y 13: Lambda Trong VPC Truy Cáº­p Database Ná»™i Bá»™ vÃ  Äi Ra Internet â€” (CM-PT1 Q23, CM-PT2 Q05, CM-PT2 Q12)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"HÃ m AWS Lambda cáº§n truy váº¥n dá»¯ liá»‡u tá»« cÆ¡ sá»Ÿ dá»¯ liá»‡u Amazon RDS PostgreSQL náº±m trong Private Subnet cá»§a VPC, Ä‘á»“ng thá»i pháº£i gá»i má»™t REST API thanh toÃ¡n cá»§a bÃªn thá»© ba náº±m ngoÃ i mÃ´i trÆ°á»ng Internet cÃ´ng cá»™ng. Cáº¥u hÃ¬nh máº¡ng nÃ o lÃ  ÄÃšNG?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *GÃ¡n Lambda vÃ o Public Subnet cÃ³ Internet Gateway*: Sai nghiÃªm trá»ng! Khi Lambda Ä‘Æ°á»£c gÃ¡n vÃ o VPC, nÃ³ khÃ´ng bao giá» Ä‘Æ°á»£c cáº¥p Public IP. Ngay cáº£ khi náº±m trong Public Subnet, nÃ³ hoÃ n toÃ n KHÃ”NG THá»‚ giao tiáº¿p vá»›i Internet qua Internet Gateway (IGW Ä‘Ã²i há»i tÃ i nguyÃªn pháº£i cÃ³ Public IP).
  - âŒ *Cáº¥u hÃ¬nh Security Group cá»§a RDS cho phÃ©p 0.0.0.0/0*: Sai vá» báº£o máº­t tá»‘i thiá»ƒu (Least Privilege) vÃ  lÃ m lá»™ cá»•ng cÆ¡ sá»Ÿ dá»¯ liá»‡u.
- **Giáº£i phÃ¡p ÄÃšNG**:
  - GÃ¡n hÃ m Lambda vÃ o **Private Subnets** cÃ³ route `0.0.0.0/0` trá» tá»›i **NAT Gateway** (NAT Gateway Ä‘áº·t á»Ÿ Public Subnet kÃ¨m Elastic IP).
  - Cáº¥u hÃ¬nh Security Group cá»§a RDS cho phÃ©p Inbound port 5432 vá»›i Source lÃ  **Security Group ID cá»§a hÃ m Lambda**.
  - Náº¿u Lambda gá»i thÃªm S3 hoáº·c DynamoDB, táº¡o thÃªm **Gateway VPC Endpoints** gáº¯n vÃ o Route Table cá»§a Private Subnet Ä‘á»ƒ khÃ´ng tá»‘n cÆ°á»›c NAT Gateway.

#### ðŸª¤ Báº«y 14: Xá»­ LÃ½ Lá»—i Táº¯c Ngháº½n Luá»“ng Stream Báº±ng BisectBatchOnFunctionError â€” (TD-Set3 Q18, CM-PT1 Q50)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"HÃ m AWS Lambda Ä‘á»c cÃ¡c lÃ´ báº£n ghi tá»« Amazon Kinesis Data Streams. Thá»‰nh thoáº£ng cÃ³ má»™t vÃ i báº£n ghi bá»‹ Ä‘á»‹nh dáº¡ng sai (malformed payload - poison pill) lÃ m hÃ m nÃ©m ra exception. Máº·c Ä‘á»‹nh Lambda thá»­ láº¡i liÃªn tá»¥c lÃ m toÃ n bá»™ quÃ¡ trÃ¬nh xá»­ lÃ½ cá»§a Shard bá»‹ táº¯c ngháº½n hoÃ n toÃ n. Giáº£i phÃ¡p nÃ o giáº£i quyáº¿t váº¥n Ä‘á» mÃ  Ã­t tá»‘n cÃ´ng tÃ¹y biáº¿n code nháº¥t?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *TÄƒng shard count cá»§a Kinesis*: KhÃ´ng giáº£i quyáº¿t Ä‘Æ°á»£c báº£n ghi há»ng náº±m trong shard hiá»‡n táº¡i.
  - âŒ *TÄƒng timeout vÃ  RAM cá»§a hÃ m Lambda*: VÃ´ Ã­ch vÃ¬ báº£n ghi bá»‹ há»ng logic, tÄƒng tÃ i nguyÃªn váº«n nÃ©m Exception.
- **Giáº£i phÃ¡p ÄÃšNG**: Báº­t tÃ­nh nÄƒng **`BisectBatchOnFunctionError: true`** káº¿t há»£p **`On-Failure Destination` (trá» tá»›i Amazon SQS DLQ)** trÃªn cáº¥u hÃ¬nh Event Source Mapping.
  - Lambda sáº½ tá»± Ä‘á»™ng chia Ä‘Ã´i lÃ´ dá»¯ liá»‡u má»—i khi gáº·p lá»—i vÃ  gá»i láº¡i tá»«ng ná»­a cho Ä‘áº¿n khi tÃ¡ch riÃªng Ä‘Æ°á»£c Ä‘Ãºng báº£n ghi há»ng.
  - Báº£n ghi há»ng Ä‘Æ°á»£c Ä‘áº©y sang SQS DLQ Ä‘á»ƒ phÃ¢n tÃ­ch sau, cÃ²n 99% cÃ¡c báº£n ghi há»£p lá»‡ khÃ¡c tiáº¿p tá»¥c Ä‘Æ°á»£c xá»­ lÃ½ mÆ°á»£t mÃ .

#### ðŸª¤ Báº«y 15: WebSocket APIs Cho á»¨ng Dá»¥ng Hai Chiá»u Real-Time (Stateful) vs REST/HTTP APIs â€” (U-PT1 Q17, U-PT3 Q09)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p xÃ¢y dá»±ng má»™t á»©ng dá»¥ng báº£ng giÃ¡ chá»©ng khoÃ¡n trá»±c tiáº¿p hoáº·c á»©ng dá»¥ng chat trá»±c tuyáº¿n Ä‘a ngÆ°á»i dÃ¹ng. Há»‡ thá»‘ng backend cáº§n chá»§ Ä‘á»™ng Ä‘áº©y (push) dá»¯ liá»‡u cáº­p nháº­t tá»©c thÃ¬ vá» cho trÃ¬nh duyá»‡t mÃ¡y khÃ¡ch mÃ  mÃ¡y khÃ¡ch khÃ´ng cáº§n pháº£i liÃªn tá»¥c gá»­i request thÄƒm dÃ² (polling). Loáº¡i API Gateway nÃ o phÃ¹ há»£p nháº¥t?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Sá»­ dá»¥ng API Gateway REST API hoáº·c HTTP API*: REST vÃ  HTTP APIs hoáº¡t Ä‘á»™ng theo mÃ´ hÃ¬nh Request-Response má»™t chiá»u khÃ´ng tráº¡ng thÃ¡i (Stateless). MÃ¡y chá»§ khÃ´ng thá»ƒ chá»§ Ä‘á»™ng khá»Ÿi táº¡o viá»‡c gá»­i dá»¯ liá»‡u tá»›i mÃ¡y khÃ¡ch náº¿u mÃ¡y khÃ¡ch khÃ´ng gá»­i request lÃªn trÆ°á»›c.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Amazon API Gateway WebSocket API**.
  - Duy trÃ¬ káº¿t ná»‘i hai chiá»u cÃ³ tráº¡ng thÃ¡i (**Stateful 2-way persistent connection**) giá»¯a mÃ¡y khÃ¡ch vÃ  API Gateway.
  - Cho phÃ©p backend Ä‘áº©y tin nháº¯n vá» client báº¥t ká»³ lÃºc nÃ o vá»›i Ä‘á»™ trá»… tÃ­nh báº±ng mili-giÃ¢y qua cÃ¡c route: `$connect`, `$disconnect`, `$default`.

#### ðŸª¤ Báº«y 16: Triá»ƒn Khai Container Image TrÃªn Lambda (Tá»‘i Äa 10 GB) & Dung LÆ°á»£ng á»” Táº¡m `/tmp` (512 MB â€“ 10 GB) â€” (TD-Set3 Q11)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"NhÃ³m ká»¹ sÆ° cáº§n triá»ƒn khai mÃ´ hÃ¬nh Machine Learning xá»­ lÃ½ áº£nh trÃªn AWS Lambda. KÃ­ch thÆ°á»›c mÃ£ nguá»“n, thÆ° viá»‡n PyTorch vÃ  cÃ¡c tá»‡p trá»ng sá»‘ nhá»‹ phÃ¢n lÃªn tá»›i 4.5 GB, vÆ°á»£t xa giá»›i háº¡n 250 MB giáº£i nÃ©n cá»§a file ZIP. NgoÃ i ra, hÃ m cáº§n lÆ°u táº¡m cÃ¡c video phÃ¢n tÃ­ch 3 GB trong quÃ¡ trÃ¬nh cháº¡y. Giáº£i phÃ¡p nÃ o Ä‘Ã¡p á»©ng?"*
- **Giáº£i phÃ¡p ÄÃšNG**:
  - ÄÃ³ng gÃ³i mÃ£ nguá»“n vÃ  dependencies thÃ nh **Container Image (Ä‘á»‹nh dáº¡ng OCI)** vá»›i dung lÆ°á»£ng tá»‘i Ä‘a **10 GB** Ä‘áº©y lÃªn **Amazon ECR** (`TD-Set3 Q11`). Lambda há»— trá»£ náº¡p image trá»±c tiáº¿p tá»« ECR.
  - Cáº¥u hÃ¬nh dung lÆ°á»£ng bá»™ nhá»› táº¡m **Ephemeral Storage (`/tmp`)** má»Ÿ rá»™ng tá»« 512 MB lÃªn tá»›i **10,240 MB (10 GB)**. Xá»­ lÃ½ video lá»›n cá»¥c bá»™ vá»›i tá»‘c Ä‘á»™ cao mÃ  khÃ´ng cáº§n mount Amazon EFS.

#### ðŸª¤ Báº«y 17: Cáº¡n Kiá»‡t Äá»‹a Chá»‰ IP Trong Subnet Nhá» Khi Gáº¯n Lambda VÃ o VPC (`EC2ThrottledException`) â€” (TD-Set3 Q59)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"HÃ m Lambda Ä‘Æ°á»£c gÃ¡n vÃ o má»™t Private Subnet kÃ­ch thÆ°á»›c `/27` (chá»‰ cÃ³ 27 IP kháº£ dá»¥ng sau khi trá»« 5 IP ná»™i bá»™ AWS). Trong Ä‘á»£t bÃ¹ng ná»• lÆ°u lÆ°á»£ng, ngÆ°á»i dÃ¹ng nháº­n tháº¥y hÃ ng loáº¡t request bá»‹ lá»—i vÃ  CloudWatch ghi nháº­n exception `EC2ThrottledException`. NguyÃªn nhÃ¢n cá»‘t lÃµi lÃ  gÃ¬?"*
- **Báº£n cháº¥t ká»¹ thuáº­t sá»‘ng cÃ²n**:
  - Khi Lambda káº¿t ná»‘i vÃ o VPC, cÆ¡ cháº¿ Hyperplane ENI cáº§n cáº¥p phÃ¡t cÃ¡c Ä‘á»‹a chá»‰ IP ná»™i bá»™ trong Subnet Ä‘Æ°á»£c chá»‰ Ä‘á»‹nh Ä‘á»ƒ táº¡o Ä‘Æ°á»ng háº§m káº¿t ná»‘i.
  - Vá»›i Subnet nhá» (`/27`), khi cÃ³ nhiá»u hÃ m Lambda hoáº·c nhiá»u Security Groups Ä‘Æ°á»£c cáº¥u hÃ¬nh, sá»‘ lÆ°á»£ng IP trá»‘ng nhanh chÃ³ng bá»‹ **cáº¡n kiá»‡t hoÃ n toÃ n**, khiáº¿n dá»‹ch vá»¥ Lambda khÃ´ng thá»ƒ cáº¥p phÃ¡t thÃªm giao diá»‡n máº¡ng vÃ  tráº£ vá» mÃ£ lá»—i **`EC2ThrottledException`** (`TD-Set3 Q59`).
- **Giáº£i phÃ¡p ÄÃšNG**: LuÃ´n cáº¥u hÃ¬nh Lambda gáº¯n vÃ o cÃ¡c **Subnet cÃ³ dáº£i IP Ä‘á»§ lá»›n (tá»‘i thiá»ƒu `/24` trá»Ÿ lÃªn)** vÃ  tráº£i rá»™ng trÃªn tá»‘i thiá»ƒu 2 Ä‘áº¿n 3 Availability Zones.

#### ðŸª¤ Báº«y 18: Kiáº¿n TrÃºc Báº£o Máº­t Lambda Káº¿t Ná»‘i Private RDS/Aurora + RDS Proxy â€” (CM-PT1 Q23, CM-PT2 Q12, CM-PT2 Q59, CM-PT6 Q10)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Thiáº¿t káº¿ kiáº¿n trÃºc an toÃ n cho cá»¥m microservices Lambda káº¿t ná»‘i cÆ¡ sá»Ÿ dá»¯ liá»‡u Amazon Aurora PostgreSQL náº±m trong máº¡ng ná»™i bá»™ VPC, ngÄƒn cháº·n triá»‡t Ä‘á»ƒ nguy cÆ¡ sáº­p káº¿t ná»‘i khi Lambda co giÃ£n Ä‘á»™t biáº¿n hÃ ng ngÃ n instances."*
- **Quy táº¯c thiáº¿t káº¿ 3 thÃ nh pháº§n chuáº©n má»±c**:
  1. **Äáº·t Lambda vÃ  RDS trong Private Subnets**: GÃ¡n Lambda vÃ o VPC nhÆ°ng khÃ´ng cáº¥p Public IP. Äá»‹nh tuyáº¿n ra Internet (náº¿u cáº§n gá»i bÃªn ngoÃ i) qua NAT Gateway.
  2. **Chaining Security Groups**: Táº¡o `SG-Lambda` vÃ  `SG-RDS`. Cáº¥u hÃ¬nh Inbound rule trÃªn `SG-RDS` chá»‰ cho phÃ©p cá»•ng 5432 vá»›i **Source lÃ  chÃ­nh `SG-Lambda` ID**.
  3. **Äáº·t Amazon RDS Proxy á»Ÿ giá»¯a**: RDS Proxy duy trÃ¬ má»™t connection pool tÃ¡i sá»­ dá»¥ng bá»n bá»‰, háº¥p thá»¥ hÃ ng chá»¥c ngÃ n káº¿t ná»‘i Ä‘á»“ng thá»i tá»« Lambda vÃ  chá»‰ má»Ÿ má»™t sá»‘ lÆ°á»£ng káº¿t ná»‘i vá»«a pháº£i tá»›i Aurora, báº£o vá»‡ DB khÃ´ng bá»‹ cáº¡n RAM/CPU (`CM-PT2 Q59`).

#### ðŸª¤ Báº«y 19: PhÃ¢n Quyá»n Lambda Giáº£i MÃ£ KMS, Äá»c S3 XuyÃªn TÃ i Khoáº£n & Gáº¯n EFS â€” (TD-Set3 Q63, CM-PT4 Q25, CM-PT6 Q55, U-PT1 Q14, U-PT2 Q44)
- **Báº«y phÃ¢n quyá»n 2 chiá»u (Two-way Permissions)**:
  - Khi Lambda á»Ÿ Account A cáº§n Ä‘á»c file S3 hoáº·c giáº£i mÃ£ KMS Key á»Ÿ Account B: Báº¯t buá»™c pháº£i cáº¥u hÃ¬nh á»Ÿ **Cáº¢ HAI PHÃA**:
    - **PhÃ­a Lambda (Account A)**: GÃ¡n quyá»n trong **Lambda Execution IAM Role** (`kms:Decrypt`, `s3:GetObject`).
    - **PhÃ­a TÃ i nguyÃªn (Account B)**: Khai bÃ¡o trong **KMS Key Policy** vÃ  **S3 Bucket Policy** cho phÃ©p Principal lÃ  ARN cá»§a Lambda Execution Role Account A (`TD-Set3 Q63`, `CM-PT4 Q25`).
  - **Gáº¯n Amazon EFS cho Lambda**: Cáº§n cáº¥u hÃ¬nh **EFS Access Point** vá»›i POSIX UID/GID cá»‘ Ä‘á»‹nh vÃ  cáº¥p quyá»n trong EFS File System Policy (`U-PT1 Q14`, `U-PT2 Q44`).

#### ðŸª¤ Báº«y 20: Amazon S3 Object Lambda Tá»± Äá»™ng Che Giáº¥u Dá»¯ Liá»‡u Nháº¡y Cáº£m (PII Redaction) â€” (TD-Set3 Q36, CM-PT5 Q04)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p lÆ°u trá»¯ hÃ ng triá»‡u tÃ i liá»‡u chá»©a thÃ´ng tin nháº­n dáº¡ng cÃ¡ nhÃ¢n (PII, sá»‘ CCCD, tháº» tÃ­n dá»¥ng) trÃªn S3. CÃ¡c bá»™ pháº­n khÃ¡c nhau (Marketing, Analytics, Customer Support) cáº§n truy cáº­p cÃ¹ng má»™t táº­p dá»¯ liá»‡u nhÆ°ng cÃ¡c trÆ°á»ng nháº¡y cáº£m pháº£i Ä‘Æ°á»£c tá»± Ä‘á»™ng che giáº¥u (redacted) tÃ¹y theo quyá»n cá»§a tá»«ng bá»™ pháº­n mÃ  KHÃ”NG ÄÆ¯á»¢C Táº O THÃŠM Báº¢N SAO BUCKET Má»šI."*
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Amazon S3 Object Lambda** (`TD-Set3 Q36`, `CM-PT5 Q04`).
  - Khá»Ÿi táº¡o S3 Object Lambda Access Point liÃªn káº¿t vá»›i má»™t hÃ m AWS Lambda.
  - Má»—i khi client gá»i API `GetObject`, hÃ m Lambda sáº½ cháº·n cuá»™c gá»i (intercept), thá»±c hiá»‡n che giáº¥u PII hoáº·c chuyá»ƒn Ä‘á»•i Ä‘á»‹nh dáº¡ng JSON/CSV ngay trong bá»™ nhá»› vÃ  tráº£ vá» cho client mÃ  khÃ´ng lÃ m thay Ä‘á»•i object gá»‘c trÃªn S3.

#### ðŸª¤ Báº«y 21: Lambda@Edge vs CloudFront Functions Xá»­ LÃ½ Logic Táº¡i BiÃªn â€” (TD-Set1 Q60, TD-Set2 Q27, TD-Set4 Q06, CM-PT3 Q19)
- **Quy táº¯c phÃ¢n Ä‘á»‹nh 2 cÃ´ng cá»¥ Edge Computing**:
  - **CloudFront Functions**: SiÃªu nháº¹, siÃªu nhanh. Viáº¿t báº±ng JavaScript, cháº¡y táº¡i 600+ PoPs, thá»i gian thá»±c thi **$< 1\text{ms}$**, **KHÃ”NG CÃ“ quyá»n truy cáº­p máº¡ng Internet hay body cá»§a request**. ChuyÃªn dÃ¹ng cho: URL Rewrite, Redirect, chuáº©n hÃ³a Header (`TD-Set4 Q06`).
  - **Lambda@Edge**: Máº¡nh máº½ toÃ n diá»‡n. Viáº¿t báº±ng Node.js / Python, cháº¡y táº¡i cÃ¡c Regional Edge Caches, thá»i gian thá»±c thi lÃªn tá»›i **5 â€“ 30 giÃ¢y**, bá»™ nhá»› tá»›i 10 GB, **Há»– TRá»¢ truy cáº­p Internet / AWS SDK** vÃ  Ä‘á»c/sá»­a Ä‘á»•i toÃ n bá»™ Request/Response Body. ChuyÃªn dÃ¹ng cho: XÃ¡c thá»±c ngÆ°á»i dÃ¹ng (JWT/OAuth), xá»­ lÃ½ nÃ©n/chuyá»ƒn Ä‘á»•i áº£nh Ä‘á»™ng theo User-Agent (`TD-Set1 Q60`, `CM-PT3 Q19`).

#### ðŸª¤ Báº«y 22: Gá»i HÃ m Lambda Trá»±c Tiáº¿p Tá»« Database Trigger Cá»§a Aurora MySQL (`mysql.lambda_async`) â€” (TD-Set1 Q17)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t há»‡ thá»‘ng thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ cáº§n kÃ­ch hoáº¡t gá»­i email xÃ¡c nháº­n ngay khi Ä‘Æ¡n hÃ ng Ä‘Æ°á»£c ghi nháº­n vÃ o báº£ng `orders` cá»§a Amazon Aurora MySQL. Äá»™i ngÅ© muá»‘n thao tÃ¡c nÃ y diá»…n ra tá»± Ä‘á»™ng tá»« database mÃ  khÃ´ng lÃ m cháº­m cÃ¢u lá»‡nh INSERT cá»§a ngÆ°á»i dÃ¹ng."*
- **Giáº£i phÃ¡p ÄÃšNG**: KÃ­ch hoáº¡t hÃ m Lambda báº¥t Ä‘á»“ng bá»™ thÃ´ng qua stored procedure gá»‘c cá»§a Aurora: **`CALL mysql.lambda_async(...)`** (`TD-Set1 Q17`).
  - GÃ¡n má»™t IAM Role cÃ³ quyá»n `lambda:InvokeFunction` vÃ o Aurora DB Cluster.
  - Viáº¿t SQL Trigger kÃ­ch hoáº¡t `mysql.lambda_async` má»—i khi cÃ³ sá»± kiá»‡n `AFTER INSERT`, gá»­i payload dá»¯ liá»‡u sang Lambda xá»­ lÃ½ gá»­i thÆ° mÃ  khÃ´ng gÃ¢y blocking giao dá»‹ch ghi CSDL.

---

### ðŸ“Š III. Ma Tráº­n Quyáº¿t Äá»‹nh CÃ´ng Nghá»‡ Serverless Nhanh (Exam Decision Matrix)

| TÃ¬nh huá»‘ng / YÃªu cáº§u trong Ä‘á» thi | Giáº£i phÃ¡p chuáº©n AWS | Giáº£i phÃ¡p bá»‹ loáº¡i & LÃ½ do | Tham chiáº¿u Ä‘á» thi |
|:---|:---|:---|:---|
| **Giáº£m Cold Start Java trÃªn Lambda chi phÃ­ tá»‘i Æ°u nháº¥t** | **AWS Lambda SnapStart (CRaC API - Miá»…n phÃ­)** | Provisioned Concurrency (phÃ¡t sinh chi phÃ­ duy trÃ¬ 24/7) | `TD-Set8 Q09`, `CM-PT5 Q63` |
| **Triá»‡t tiÃªu Cold Start cho Node.js/Python/Container** | **Lambda Provisioned Concurrency** | SnapStart (chá»‰ há»— trá»£ runtime Java vÃ  má»™t sá»‘ mÃ´i trÆ°á»ng cá»¥ thá»ƒ) | `CM-PT4 Q18`, `U-PT3 Q43` |
| **Lá»—i cáº¡n kiá»‡t IP khi Lambda káº¿t ná»‘i Private Subnet** | **Má»Ÿ rá»™ng Subnet lÃªn `/24` Ä‘a AZ (`EC2ThrottledException`)** | TÄƒng RAM Lambda (khÃ´ng sinh thÃªm IP máº¡ng) | `TD-Set3 Q59` |
| **Tá»± Ä‘á»™ng che giáº¥u thÃ´ng tin nháº¡y cáº£m PII khi Ä‘á»c S3** | **Amazon S3 Object Lambda Access Point** | NhÃ¢n báº£n dá»¯ liá»‡u sang bucket má»›i (tá»‘n chi phÃ­ vÃ  khÃ³ Ä‘á»“ng bá»™) | `TD-Set3 Q36`, `CM-PT5 Q04` |
| **XÃ¡c thá»±c JWT / Xá»­ lÃ½ áº£nh Ä‘á»™ng táº¡i biÃªn máº¡ng CDN** | **Lambda@Edge** (Viewer/Origin Request/Response) | CloudFront Functions (khÃ´ng há»— trá»£ gá»i máº¡ng ngoÃ i / Ä‘á»c body) | `TD-Set1 Q60`, `CM-PT3 Q19` |
| **KÃ­ch hoáº¡t Lambda báº¥t Ä‘á»“ng bá»™ tá»« Trigger Aurora MySQL** | **Stored Procedure `mysql.lambda_async`** | Polling báº£ng DB Ä‘á»‹nh ká»³ báº±ng cronjob (gÃ¢y táº£i cháº­m database) | `TD-Set1 Q17` |
| **MÃ´ hÃ¬nh ML 4.5 GB + tá»‡p táº¡m 3 GB cháº¡y trÃªn Lambda** | **Lambda Container Image (10 GB) + Ephemeral Storage `/tmp` 10 GB** | File ZIP thÃ´ng thÆ°á»ng (bá»‹ giá»›i háº¡n cá»©ng 250 MB giáº£i nÃ©n) | `TD-Set3 Q11` |
| **Lambda trong VPC cáº§n vá»«a gá»i RDS vá»«a gá»i Internet** | **Lambda á»Ÿ Private Subnet + NAT Gateway + RDS SG Reference** | Äáº·t Lambda á»Ÿ Public Subnet (Lambda khÃ´ng cÃ³ Public IP) | `CM-PT1 Q23`, `CM-PT2 Q05` |
| **CÃ´ láº­p báº£n ghi há»ng Kinesis trÃ¡nh ngháº½n shard** | **`BisectBatchOnFunctionError` + On-Failure Destination SQS** | Retry máº·c Ä‘á»‹nh (gÃ¢y táº¯c ngháº½n toÃ n bá»™ luá»“ng Shard) | `TD-Set3 Q18`, `CM-PT1 Q50` |
| **á»¨ng dá»¥ng chat / giÃ¡ chá»©ng khoÃ¡n real-time push 2 chiá»u** | **Amazon API Gateway WebSocket API** | REST API / HTTP API (Stateless, khÃ´ng push chá»§ Ä‘á»™ng Ä‘Æ°á»£c) | `U-PT1 Q17` |
| **Giá»›i háº¡n káº¿t ná»‘i Ä‘á»“ng thá»i báº£o vá»‡ database háº¡ nguá»“n** | **Lambda Reserved Concurrency** (káº¿t há»£p RDS Proxy) | TÄƒng RAM Lambda (khÃ´ng háº¡n cháº¿ Ä‘Æ°á»£c sá»‘ káº¿t ná»‘i Ä‘á»“ng thá»i) | `CM-PT2 Q59` |
| **Báº£o vá»‡ Lambda trÆ°á»›c Ä‘á»£t tÄƒng vá»t traffic hÃ ng trÄƒm ngÃ n user** | **Amazon API Gateway Throttling (Steady-state + Burst)** | Äá»ƒ Lambda co giÃ£n tá»± do (dá»… vÆ°á»£t account concurrency limit) | `TD-Set1 Q14` |
| **TÃ­ch há»£p Webhook bÃªn thá»© 3 (HTTP POST) vá»›i chi phÃ­ tháº¥p nháº¥t** | **Lambda Function URLs (`AuthType: NONE` + HMAC check)** | Dá»±ng ALB hoáº·c API Gateway REST API (tá»‘n thÃªm chi phÃ­ & háº¡ táº§ng) | `TD-Set2 Q56`, `TD-Set6 Q43` |
| **MÃ£ hÃ³a biáº¿n mÃ´i trÆ°á»ng Lambda vá»›i toÃ n quyá»n kiá»ƒm soÃ¡t khÃ³a** | **AWS KMS Customer Managed Key (CMK) + Encryption Helpers** | AWS managed key `aws/lambda` (khÃ´ng tÃ¹y biáº¿n Ä‘Æ°á»£c key policy) | `TD-Set1 Q58` |
| **Tá»± Ä‘á»™ng Ä‘á»‹nh tuyáº¿n káº¿t quáº£ Lambda async (Success / Failure)** | **Lambda Destinations (Ä‘áº©y tá»›i SQS / SNS / EventBridge)** | Tá»± viáº¿t code custom try/catch gá»­i tin nháº¯n trong handler | `CM-PT1 Q06` |
| **TÃ¡c vá»¥ tÃ­nh toÃ¡n cháº¡y > 15 phÃºt (20-60 phÃºt)** | **ECS on AWS Fargate** (+ EventBridge Scheduler) | AWS Lambda (hard limit execution timeout tá»‘i Ä‘a 15 phÃºt) | `U-PT2 Q02` |
| **Chia sáº» mÃ£ tiá»‡n Ã­ch/lib giá»¯a nhiá»u hÃ m Lambda** | **AWS Lambda Layers** (tá»‘i Ä‘a 5 layers/hÃ m) | S3 download thá»§ cÃ´ng (tÄƒng Cold Start & chi phÃ­ request) | `CM-PT1 Q17` |
| **Báº£o vá»‡ RDS khÃ´ng bá»‹ sáº­p káº¿t ná»‘i bá»Ÿi hÃ ng ngÃ n Lambda** | **Amazon RDS Proxy** (+ Reserved Concurrency) | TÄƒng RAM Lambda (khÃ´ng tá»‘i Æ°u hÃ³a connection pooling) | Chuáº©n AWS |
| **Äiá»u phá»‘i luá»“ng nghiá»‡p vá»¥ phÃ¢n tÃ¡n phá»©c táº¡p, cÃ³ retry** | **AWS Step Functions (State Machines)** | Viáº¿t code logic lá»“ng nhau spaghetti trong 1 hÃ m Lambda | `CM-PT1 Q06`, `CM-PT1 Q38` |
| **Háº¥p thá»¥ táº£i tÄƒng vá»t burst trÃ¡nh sáº­p backend** | **Amazon SQS Buffer + Lambda Batch Processing** | Gá»i trá»±c tiáº¿p Lambda (dá»… cáº¡n concurrency & sáº­p DB) | `CM-PT1 Q35`, `CM-PT5 Q08` |
| **Tiáº¿p nháº­n payload JSON 5KB vÃ  lÆ°u vÃ o Aurora Serverless** | **Amazon API Gateway + AWS Lambda + Aurora Serverless** | Dá»±ng cá»¥m EC2 Web Server (lÃ£ng phÃ­ khi táº£i tháº¥p) | `TD-Set8 Q20` |

---

## 3. Kiáº¿n TrÃºc Thá»±c Táº¿ vÃ  Luá»“ng Váº­n HÃ nh (Production Architecture & Workflow)

### Kiáº¿n trÃºc Webhook & Xá»­ LÃ½ ÄÆ¡n HÃ ng Phi MÃ¡y Chá»§ Báº¥t Äá»“ng Bá»™

```mermaid
sequenceDiagram
    autonumber
    actor Client as KhÃ¡ch HÃ ng Web / Mobile
    participant APIGW as Amazon API Gateway (HTTP API)
    participant SQS as Amazon SQS FIFO Queue
    participant Lambda as Order Processing Lambda (Arm64)
    participant Dynamo as Amazon DynamoDB (Billing Table)
    participant EventBridge as Amazon EventBridge Bus
    participant DLQ as Dead-Letter Queue (SQS)

    Client->>APIGW: POST /orders (KÃ¨m JWT Token & ThÃ´ng tin Ä‘Æ¡n)
    APIGW->>APIGW: Validate JWT Token qua Cognito Authorizer
    APIGW->>SQS: Äáº©y trá»±c tiáº¿p tin nháº¯n vÃ o SQS (Direct AWS Integration, khÃ´ng tá»‘n Lambda cold start)
    APIGW-->>Client: 202 Accepted (KÃ¨m OrderTrackingID)
    
    SQS->>Lambda: Event Source Mapping chuyá»ƒn batch 10 orders
    Lambda->>Dynamo: TransactWriteItems (Ghi nháº­n hÃ³a Ä‘Æ¡n & tráº¡ng thÃ¡i thanh toÃ¡n)
    alt Giao dá»‹ch thÃ nh cÃ´ng
        Lambda->>EventBridge: Báº¯n sá»± kiá»‡n "OrderCreated" cho Notification Service
        Lambda-->>SQS: XÃ³a tin nháº¯n khá»i Queue
    else Lá»—i xá»­ lÃ½ nghiá»‡p vá»¥ / Timeout
        Lambda-->>SQS: NACK (Tin nháº¯n quay láº¡i hÃ ng Ä‘á»£i, Retry sau VisibilityTimeout)
        Note over SQS,DLQ: Sau 3 láº§n thá»­ láº¡i tháº¥t báº¡i -> Chuyá»ƒn vÃ o DLQ
        SQS->>DLQ: LÆ°u trá»¯ báº£n ghi lá»—i Ä‘á»ƒ ká»¹ sÆ° Ä‘iá»u tra
    end
```

---

## 4. Báº£ng TÃ­ch Há»£p vá»›i CÃ¡c Dá»‹ch Vá»¥ AWS KhÃ¡c (Integration Table)

| Related AWS Service | Purpose (Má»¥c Ä‘Ã­ch tÃ­ch há»£p) | Integration Method (PhÆ°Æ¡ng thá»©c tÃ­ch há»£p) | Practical Example (VÃ­ dá»¥ thá»±c tiá»…n) |
| :--- | :--- | :--- | :--- |
| **Amazon S3** | Xá»­ lÃ½ sá»± kiá»‡n lÆ°u trá»¯ phi mÃ¡y chá»§ | S3 Event Notifications | Tá»± Ä‘á»™ng kÃ­ch hoáº¡t Lambda sinh thumbnail vÃ  trÃ­ch xuáº¥t metadata khi ngÆ°á»i dÃ¹ng táº£i áº£nh lÃªn S3. |
| **Amazon RDS / Aurora** | Quáº£n lÃ½ káº¿t ná»‘i cÆ¡ sá»Ÿ dá»¯ liá»‡u bá»n bá»‰ | **Amazon RDS Proxy** | HÃ ng ngÃ n container Lambda Ä‘á»“ng thá»i chia sáº» má»™t connection pool nhá» qua RDS Proxy, trÃ¡nh lÃ m sáº­p PostgreSQL/MySQL. |
| **Amazon SQS / SNS** | PhÃ¢n tÃ¡ch (Decouple) cÃ¡c thÃ nh pháº§n kiáº¿n trÃºc | Event Source Mapping & Push Triggers | Lambda tiÃªu thá»¥ hÃ ng Ä‘á»£i tin nháº¯n báº¥t Ä‘á»“ng bá»™, tá»± Ä‘á»™ng scale out theo sá»‘ lÆ°á»£ng thÃ´ng Ä‘iá»‡p trong queue. |
| **AWS Step Functions** | Äiá»u phá»‘i quy trÃ¬nh nghiá»‡p vá»¥ nhiá»u bÆ°á»›c | Task State `arn:aws:states:::lambda:invoke` | Quy trÃ¬nh duyá»‡t hoÃ n tiá»n: Kiá»ƒm tra sá»‘ dÆ° âž” Trá»« vÃ­ âž” Gá»­i SMS âž” BÃ¡o cÃ¡o káº¿ toÃ¡n (cÃ³ tá»± Ä‘á»™ng retry vÃ  catch error). |
| **Amazon CloudWatch** | GiÃ¡m sÃ¡t hiá»‡u nÄƒng vÃ  truy váº¿t lá»—i | CloudWatch Logs Insights & X-Ray Tracing | Báº­t AWS X-Ray Active Tracing Ä‘á»ƒ Ä‘o Ä‘áº¡c chÃ­nh xÃ¡c thá»i gian khá»Ÿi táº¡o container (Cold Start) vÃ  thá»i gian thá»±c thi hÃ m. |
| **AWS Secrets Manager** | Báº£o máº­t chuá»—i káº¿t ná»‘i vÃ  API keys | Lambda Extensions / SDK Caching | Lambda náº¡p API Key bÃªn thá»© 3 vÃ  cache trong bá»™ nhá»› RAM, tá»± Ä‘á»™ng láº¥y secret má»›i khi Ä‘Æ°á»£c xoay vÃ²ng. |

---

## 5. Báº£ng So SÃ¡nh Trong Há»‡ Sinh ThÃ¡i AWS (Ecosystem Comparison)

### So sÃ¡nh cÃ¡c ná»n táº£ng tÃ­nh toÃ¡n cho Microservices trÃªn AWS

| TiÃªu chÃ­ | AWS Lambda | AWS Fargate (ECS/EKS) | AWS App Runner | Amazon EC2 |
| :--- | :--- | :--- | :--- | :--- |
| **MÃ´ hÃ¬nh tÃ­nh toÃ¡n** | Function-as-a-Service (FaaS) hÆ°á»›ng sá»± kiá»‡n. | Container-as-a-Service (CaaS) phi mÃ¡y chá»§. | Platform-as-a-Service (PaaS) triá»ƒn khai web/API tá»± Ä‘á»™ng. | Infrastructure-as-a-Service (IaaS) mÃ¡y áº£o chuyÃªn dá»¥ng. |
| **Giá»›i háº¡n thá»i gian cháº¡y** | **Tá»‘i Ä‘a 15 phÃºt (900 giÃ¢y)**. | **KhÃ´ng giá»›i háº¡n** (cháº¡y tiáº¿n trÃ¬nh liÃªn tá»¥c 24/7). | **KhÃ´ng giá»›i háº¡n** (phÃ¹ há»£p HTTP request dÃ i). | **KhÃ´ng giá»›i háº¡n**. |
| **Kháº£ nÄƒng co giÃ£n vá» 0 (Scale to Zero)** |  **CÃ³ (Máº·c Ä‘á»‹nh)**: \$0 khi khÃ´ng cÃ³ lÆ°u lÆ°á»£ng. | âŒ KhÃ´ng tá»± vá» 0 (pháº£i duy trÃ¬ tá»‘i thiá»ƒu 1 task). |  CÃ³ thá»ƒ táº¡m dá»«ng instance khi khÃ´ng cÃ³ request. | âŒ KhÃ´ng tá»± vá» 0 (pháº£i duy trÃ¬ instance báº­t). |
| **Äá»™ trá»… khá»Ÿi Ä‘á»™ng** | VÃ i mili-giÃ¢y (Warm) Ä‘áº¿n vÃ i giÃ¢y (Cold Start). | Khoáº£ng 30 giÃ¢y Ä‘áº¿n 2 phÃºt Ä‘á»ƒ kÃ©o image vÃ  cháº¡y task. | VÃ i giÃ¢y Ä‘áº¿n 1 phÃºt khi scale up. | VÃ i phÃºt khi ASG khá»Ÿi táº¡o mÃ¡y áº£o má»›i. |
| **CÆ¡ cháº¿ tÃ­nh phÃ­** | LÃ m trÃ²n tá»›i **1 ms** theo dung lÆ°á»£ng RAM vÃ  thá»i gian cháº¡y. | TÃ­nh theo tá»«ng giÃ¢y dá»±a trÃªn vCPU vÃ  GB RAM cáº¥p phÃ¡t. | TÃ­nh theo vCPU/RAM active + phÃ­ duy trÃ¬ memory khi idle. | TÃ­nh theo tá»«ng giÃ¢y cháº¡y cá»§a mÃ¡y áº£o (cá»‘ Ä‘á»‹nh). |
| **TrÆ°á»ng há»£p sá»­ dá»¥ng tá»‘i Æ°u** | TÃ¡c vá»¥ xá»­ lÃ½ sá»± kiá»‡n ngáº¯n, webhook, API táº£i Ä‘á»™t biáº¿n tháº¥t thÆ°á»ng. | Microservices cháº¡y liÃªn tá»¥c, background worker dÃ i ngÃ y, websockets. | á»¨ng dá»¥ng web/REST API container hÃ³a Ä‘Æ¡n giáº£n cáº§n CI/CD tá»± Ä‘á»™ng. | á»¨ng dá»¥ng legacy, kiáº¿n trÃºc monlithic, yÃªu cáº§u tÃ¹y biáº¿n sÃ¢u kernel OS. |

---

## 6. MÃ´ HÃ¬nh TÃ­nh PhÃ­ & Chiáº¿n LÆ°á»£c Tá»‘i Æ¯u Chi PhÃ­ (FinOps & Cost Optimization)

### 6.1. Báº£ng Cáº¥u TrÃºc Äá»‹nh GiÃ¡ Chi Tiáº¿t

| ThÃ nh pháº§n Dá»‹ch Vá»¥ | ÄÆ¡n giÃ¡ AWS niÃªm yáº¿t | CÆ¡ cháº¿ Ä‘o lÆ°á»ng | Ghi chÃº tá»‘i Æ°u hÃ³a chi phÃ­ FinOps |
| :--- | :--- | :--- | :--- |
| **AWS Lambda (x86_64)** | **\$0.0000166667 / GB-s** | TÃ­nh theo mili-giÃ¢y (1 ms) thá»±c thi | 1 triá»‡u request vÃ  3.2 triá»‡u GB-s miá»…n phÃ­ má»—i thÃ¡ng (Free Tier vÄ©nh viá»…n). |
| **AWS Lambda (Arm64 Graviton)** | **\$0.0000133334 / GB-s** | Ráº» hÆ¡n **20%** so vá»›i x86 | Chuyá»ƒn Ä‘á»•i kiáº¿n trÃºc sang Arm64 cho Python, Node.js, Go Ä‘á»ƒ tiáº¿t kiá»‡m ngay 20%. |
| **Amazon API Gateway (HTTP API)** | **\$1.00 / 1 triá»‡u requests** | TÃ­nh trÃªn má»—i request nháº­n Ä‘Æ°á»£c | Ráº» hÆ¡n 71% so vá»›i REST API (\$3.50/triá»‡u requests). |
| **Amazon DynamoDB (On-Demand)** | **\$1.25 / 1M WRU** & **\$0.25 / 1M RRU** | TÃ­nh trÃªn lÆ°á»£t Ä‘á»c/ghi thá»±c táº¿ | PhÃ¹ há»£p cho táº£i khÃ³ Ä‘oÃ¡n hoáº·c má»›i ra máº¯t; chuyá»ƒn sang Provisioned khi táº£i á»•n Ä‘á»‹nh. |
| **Amazon DynamoDB (Provisioned)** | **\$0.00065 / WCU / giá»** (~\$0.47/thÃ¡ng)<br>**\$0.00013 / RCU / giá»** (~\$0.09/thÃ¡ng) | Miá»…n phÃ­ 25 WCU vÃ  25 RCU cá»‘ Ä‘á»‹nh | Báº­t Auto Scaling Ä‘á»ƒ giáº£m 80% chi phÃ­ so vá»›i On-Demand trÃªn táº£i Ä‘á»u Ä‘áº·n. |
| **AWS Step Functions (Express)** | **\$1.00 / 1 triá»‡u executions** | \$1/triá»‡u + cÆ°á»›c GB-s | Ráº» hÆ¡n 97% so vá»›i Standard Workflows (\$25/triá»‡u transitions) cho tÃ¡c vá»¥ < 5 phÃºt. |

---

### 6.2. 5 Ká»‹ch Báº£n Tá»‘i Æ¯u HÃ³a Chi PhÃ­ Thá»±c Táº¿ (FinOps Scenarios)

#### Ká»‹ch báº£n 1: Chuyá»ƒn Ä‘á»•i API Gateway tá»« REST API sang HTTP API
- **Bá»‘i cáº£nh**: Há»‡ thá»‘ng backend di Ä‘á»™ng tiáº¿p nháº­n **120 triá»‡u lÆ°á»£t gá»i API** má»—i thÃ¡ng. Ká»¹ sÆ° khá»Ÿi táº¡o cá»•ng API báº±ng REST API máº·c Ä‘á»‹nh.
- **TÃ­nh toÃ¡n chi phÃ­ REST API**:
  $$\text{Cost}_{\text{REST}} = \left( \frac{120{,}000{,}000}{1{,}000{,}000} \right) \times \$3.50 = \$420/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - ÄÃ¡nh giÃ¡ kiáº¿n trÃºc: á»¨ng dá»¥ng chá»‰ dÃ¹ng xÃ¡c thá»±c JWT qua Cognito vÃ  chuyá»ƒn tiáº¿p request vá» Lambda (khÃ´ng cáº§n API Keys hay Request XML Transformation).
  - Chuyá»ƒn sang **HTTP API** vá»›i Ä‘Æ¡n giÃ¡ \$1.00/1 triá»‡u calls:
  $$\text{Cost}_{\text{HTTP}} = \left( \frac{120{,}000{,}000}{1{,}000{,}000} \right) \times \$1.00 = \$120/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$420 - \$120 = \$300/\text{thÃ¡ng} \quad (\$3{,}600/\text{nÄƒm}) \implies \text{Cáº¯t giáº£m } 71.4\% \text{ chi phÃ­ API}$$

#### Ká»‹ch báº£n 2: Tá»‘i Æ°u dung lÆ°á»£ng RAM báº±ng AWS Lambda Power Tuning (Nghá»‹ch lÃ½ Serverless)
- **Bá»‘i cáº£nh**: Ká»¹ sÆ° nghÄ© ráº±ng cáº¥u hÃ¬nh má»©c RAM nhá» nháº¥t (**128 MB**) sáº½ tiáº¿t kiá»‡m chi phÃ­ nháº¥t. Má»™t tÃ¡c vá»¥ xá»­ lÃ½ Ä‘á»“ há»a vá»›i 128 MB RAM (nháº­n tá»· lá»‡ CPU ráº¥t nhá») máº¥t **8.0 giÃ¢y (8,000 ms)** Ä‘á»ƒ hoÃ n thÃ nh. Há»‡ thá»‘ng cháº¡y 5 triá»‡u láº§n má»—i thÃ¡ng.
- **TÃ­nh toÃ¡n chi phÃ­ 128 MB**:
  $$\text{Cost}_{128\text{MB}} = 5{,}000{,}000 \times 8.0 \text{ s} \times \left( \frac{128}{1024} \text{ GB} \right) \times \$0.0000166667 = \$83.33/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - DÃ¹ng cÃ´ng cá»¥ **AWS Lambda Power Tuning** nÃ¢ng RAM lÃªn **1,024 MB (1 GB)**. Táº¡i má»©c nÃ y, hÃ m Ä‘Æ°á»£c cáº¥p 1 vCPU trá»n váº¹n, thá»i gian xá»­ lÃ½ giáº£m máº¡nh xuá»‘ng chá»‰ cÃ²n **0.4 giÃ¢y (400 ms)**:
  $$\text{Cost}_{1024\text{MB}} = 5{,}000{,}000 \times 0.4 \text{ s} \times \left( \frac{1024}{1024} \text{ GB} \right) \times \$0.0000166667 = \$33.33/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$83.33 - \$33.33 = \$50.00/\text{thÃ¡ng} \quad (\$600/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m } 60\% \text{ chi phÃ­, tÄƒng tá»‘c } 20\text{ láº§n}$$

#### Ká»‹ch báº£n 3: Chuyá»ƒn Ä‘á»•i Runtime Lambda sang chip ARM64 (AWS Graviton)
- **Bá»‘i cáº£nh**: Há»‡ thá»‘ng microservices gá»“m 40 hÃ m Lambda viáº¿t báº±ng Node.js vÃ  Python cháº¡y trÃªn kiáº¿n trÃºc `x86_64`, tiÃªu tá»‘n trung bÃ¬nh 15,000,000 GB-seconds má»—i thÃ¡ng.
- **TÃ­nh toÃ¡n chi phÃ­ x86**:
  $$\text{Cost}_{\text{x86}} = 15{,}000{,}000 \times \$0.0000166667 = \$250.00/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Chuyá»ƒn Ä‘á»•i cá» cáº¥u hÃ¬nh kiáº¿n trÃºc sang **`arm64` (AWS Graviton)** trÃªn Console hoáº·c Terraform mÃ  khÃ´ng cáº§n Ä‘á»•i mÃ£ nguá»“n:
  $$\text{Cost}_{\text{Arm64}} = 15{,}000{,}000 \times \$0.0000133334 = \$200.00/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$250.00 - \$200.00 = \$50.00/\text{thÃ¡ng} \quad (\$600/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m ngay } 20\% \text{ chi phÃ­ tÃ­nh toÃ¡n}$$

#### Ká»‹ch báº£n 4: DynamoDB On-Demand vs Provisioned Capacity Mode kÃ¨m Auto Scaling
- **Bá»‘i cáº£nh**: Má»™t á»©ng dá»¥ng thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ cÃ³ lÆ°u lÆ°á»£ng ghi á»•n Ä‘á»‹nh liÃªn tá»¥c **400 WCU** (400 writes/giÃ¢y) suá»‘t 24/7 (tÆ°Æ¡ng Ä‘Æ°Æ¡ng khoáº£ng 1.036 tá»· lÆ°á»£t ghi má»—i thÃ¡ng).
- **TÃ­nh toÃ¡n chi phÃ­ On-Demand Mode**:
  $$\text{Cost}_{\text{OnDemand}} = \left( \frac{1{,}036{,}800{,}000}{1{,}000{,}000} \right) \times \$1.25 = \$1{,}296/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Chuyá»ƒn sang **Provisioned Capacity Mode** vá»›i Auto Scaling (cáº¥p phÃ¡t 400 WCU, trá»« Ä‘i 25 WCU miá»…n phÃ­):
  $$\text{Cost}_{\text{Provisioned}} = (400 - 25) \text{ WCU} \times \$0.00065/\text{giá»} \times 730 \text{ giá»} = \$177.94/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$1{,}296 - \$177.94 = \$1{,}118.06/\text{thÃ¡ng} \quad (\$13{,}416/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m } 86.3\% \text{ chi phÃ­ DB}$$

#### Ká»‹ch báº£n 5: Chuyá»ƒn Ä‘á»•i Step Functions tá»« Standard sang Express Workflows
- **Bá»‘i cáº£nh**: Há»‡ thá»‘ng phÃ¢n tÃ­ch thanh toÃ¡n xá»­ lÃ½ **8 triá»‡u giao dá»‹ch/thÃ¡ng**. Má»—i giao dá»‹ch tráº£i qua 5 bÆ°á»›c chuyá»ƒn tráº¡ng thÃ¡i (State Transitions). Táº¥t cáº£ giao dá»‹ch hoÃ n thÃ nh trong vÃ²ng dÆ°á»›i 3 giÃ¢y.
- **TÃ­nh toÃ¡n chi phÃ­ Standard Workflows**:
  $$\text{Sá»‘ transitions} = 8{,}000{,}000 \times 5 = 40{,}000{,}000 \text{ transitions}$$
  $$\text{Cost}_{\text{Standard}} = \left( \frac{40{,}000{,}000}{1{,}000} \right) \times \$0.025 = \$1{,}000/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Chuyá»ƒn sang **Express Workflows** (thiáº¿t káº¿ chuyÃªn biá»‡t cho tÃ¡c vá»¥ xá»­ lÃ½ sá»± kiá»‡n ngáº¯n dÆ°á»›i 5 phÃºt):
  $$\text{PhÃ­ thá»±c thi} = 8 \text{ triá»‡u} \times \$1.00/\text{triá»‡u} = \$8.00$$
  $$\text{PhÃ­ thá»i gian cháº¡y (3s @ 256MB RAM)} \approx \$20.00$$
  $$\text{Total Cost}_{\text{Express}} = \$8.00 + \$20.00 = \$28.00/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$1{,}000 - \$28 = \$972/\text{thÃ¡ng} \quad (\$11{,}664/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m } 97.2\% \text{ chi phÃ­ Ä‘iá»u phá»‘i}$$

---

## 7. Kháº¯c Phá»¥c Sá»± Cá»‘ Thá»±c Táº¿ (Troubleshooting Guide)

| TÃ¬nh huá»‘ng sá»± cá»‘ (Problem) | NguyÃªn nhÃ¢n cá»‘t lÃµi (Root Cause) | CÃ¡c bÆ°á»›c Ä‘iá»u tra & Chá»‰ sá»‘ giÃ¡m sÃ¡t (Metrics & Logs) | Giáº£i phÃ¡p kháº¯c phá»¥c (Remediation) | Biá»‡n phÃ¡p phÃ²ng ngá»«a (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Lá»—i `Task timed out after 3.00 seconds` trÃªn Lambda** | Thá»i gian timeout máº·c Ä‘á»‹nh lÃ  3 giÃ¢y; mÃ£ nguá»“n gá»i API ngoÃ i hoáº·c truy váº¥n database bá»‹ cháº­m vÆ°á»£t quÃ¡ thá»i gian nÃ y. | - Xem CloudWatch Logs: `REPORT RequestId: ... Duration: 3000.00 ms Status: timeout`.<br>- GiÃ¡m sÃ¡t CloudWatch metric `Duration` vÃ  `Errors`. | TÄƒng thÃ´ng sá»‘ **Timeout** trong cáº¥u hÃ¬nh cá»§a Lambda lÃªn giÃ¡ trá»‹ thá»±c táº¿ (vÃ­ dá»¥: 15s - 30s). | Thiáº¿t láº­p káº¿t ná»‘i timeout trÃªn HTTP Client trong code Ä‘á»ƒ fail-fast; cáº¥u hÃ¬nh CloudWatch Alarm cho metric `Errors`. |
| **Lambda trong VPC khÃ´ng thá»ƒ gá»i API ra ngoÃ i Internet** | Subnet gáº¯n Lambda khÃ´ng cÃ³ route ra Internet hoáº·c bá»‹ Ä‘áº·t nháº§m vÃ o Public Subnet khÃ´ng cÃ³ NAT Gateway. | - Kiá»ƒm tra Route Table cá»§a Subnet gáº¯n Lambda ENI.<br>- Tra cá»©u lá»—i káº¿t ná»‘i máº¡ng `ETIMEDOUT` hoáº·c `Connection refused`. | Äáº·t Lambda vÃ o **Private Subnet** vÃ  cáº¥u hÃ¬nh Route Table trá» `0.0.0.0/0` tá»›i **NAT Gateway** á»Ÿ Public Subnet. | Nhá»› nguyÃªn táº¯c: Lambda trong VPC khÃ´ng bao giá» nháº­n Public IP; báº¯t buá»™c pháº£i Ä‘i qua NAT Gateway Ä‘á»ƒ ra ngoÃ i. |
| **DynamoDB bÃ¡o lá»—i `ProvisionedThroughputExceededException`** | Tá»‘c Ä‘á»™ Ä‘á»c/ghi vÆ°á»£t quÃ¡ háº¡n má»©c RCU/WCU Ä‘Ã£ cáº¥p phÃ¡t, hoáº·c do thiáº¿t káº¿ Partition Key kÃ©m gÃ¢y **Hot Partition**. | - Xem CloudWatch metric `ThrottledRequests` vÃ  `ReadThrottleEvents`.<br>- Kiá»ƒm tra phÃ¢n bá»• dá»¯ liá»‡u trÃªn CloudWatch Contributor Insights. | 1. Báº­t **Auto Scaling** cho báº£ng DynamoDB.<br>2. Chuyá»ƒn sang cháº¿ Ä‘á»™ **On-Demand Capacity**.<br>3. Ãp dá»¥ng Exponential Backoff trong SDK. | Thiáº¿t káº¿ Partition Key cÃ³ Ä‘á»™ phÃ¢n tÃ¡n cao (High Cardinality) hoáº·c káº¿t há»£p ká»¹ thuáº­t Salted Key. |
| **KhÃ¡ch hÃ ng gáº·p lá»—i `HTTP 429 Too Many Requests` tá»« API Gateway** | LÆ°u lÆ°á»£ng gá»i API vÆ°á»£t quÃ¡ giá»›i háº¡n Rate Limits hoáº·c Burst Limits cá»§a tÃ i khoáº£n hoáº·c Usage Plan. | - GiÃ¡m sÃ¡t CloudWatch metric `4XXError` vÃ  `IntegrationLatency` trÃªn API Gateway Console. | NÃ¢ng giá»›i háº¡n Throttling Limits trong API Gateway Stage/Usage Plan hoáº·c gá»­i yÃªu cáº§u tÄƒng Service Quotas. | KÃ­ch hoáº¡t tÃ­nh nÄƒng **API Gateway Caching** Ä‘á»ƒ tráº£ vá» dá»¯ liá»‡u Ä‘á»‡m cho cÃ¡c request trÃ¹ng láº·p. |
| **TÄƒng vá»t sá»‘ lÆ°á»£ng Cold Starts gÃ¢y trá»… há»‡ thá»‘ng thanh toÃ¡n** | Táº£i tÄƒng Ä‘á»™t biáº¿n khÃ´ng dá»± Ä‘oÃ¡n trÆ°á»›c khiáº¿n Lambda pháº£i liÃªn tá»¥c khá»Ÿi táº¡o container MicroVM má»›i. | - Tra cá»©u log tÃ¬m chuá»—i `Init Duration: ... ms`.<br>- GiÃ¡m sÃ¡t metric `ConcurrentExecutions`. | 1. Báº­t **Provisioned Concurrency** cho cÃ¡c endpoints thanh toÃ¡n quan trá»ng.<br>2. KÃ­ch hoáº¡t **Lambda SnapStart** náº¿u dÃ¹ng runtime Java. | Tá»‘i Æ°u mÃ£ nguá»“n khá»Ÿi táº¡o (Init code): Lazy-load cÃ¡c thÆ° viá»‡n khÃ´ng cáº§n thiáº¿t vÃ  giá»¯ káº¿t ná»‘i DB ngoÃ i handler. |


---


## 8. TÃ³m Táº¯t vÃ  Danh Má»¥c Kiá»ƒm Tra Kiáº¿n Thá»©c (Summary & Learning Checklist)

### 7 NguyÃªn Táº¯c VÃ ng Kiáº¿n TrÃºc Serverless AWS (Golden Rules)
1. **TuÃ¢n thá»§ giá»›i háº¡n 15 phÃºt**: Lambda chá»‰ dÃ nh cho tÃ¡c vá»¥ ngáº¯n dÆ°á»›i 900 giÃ¢y; tÃ¡c vá»¥ dÃ i hÆ¡n báº¯t buá»™c chuyá»ƒn sang ECS Fargate.
2. **Nghá»‹ch lÃ½ RAM vÃ  CPU**: TÄƒng RAM giÃºp tÄƒng CPU tÆ°Æ¡ng á»©ng; nhiá»u trÆ°á»ng há»£p tÄƒng RAM giÃºp hÃ m cháº¡y nhanh gáº¥p nhiá»u láº§n vÃ  tá»•ng chi phÃ­ láº¡i ráº» hÆ¡n.
3. **Æ¯u tiÃªn Arm64 Graviton**: LuÃ´n chuyá»ƒn Ä‘á»•i kiáº¿n trÃºc Lambda sang `arm64` Ä‘á»ƒ tiáº¿t kiá»‡m ngay 20% chi phÃ­ tÃ­nh toÃ¡n.
4. **Máº·c Ä‘á»‹nh dÃ¹ng HTTP APIs**: Chá»‰ chá»n REST API khi thá»±c sá»± cáº§n WAF, Caching hoáº·c API Keys/Usage Plans.
5. **Báº£o vá»‡ Database vá»›i RDS Proxy**: KhÃ´ng bao giá» káº¿t ná»‘i trá»±c tiáº¿p hÃ ng ngÃ n hÃ m Lambda vÃ o cÆ¡ sá»Ÿ dá»¯ liá»‡u quan há»‡ mÃ  khÃ´ng cÃ³ connection pool.
6. **Thiáº¿t káº¿ Partition Key phÃ¢n tÃ¡n**: TrÃ¡nh Hot Partition trong DynamoDB báº±ng cÃ¡ch chá»n Partition Key cÃ³ Ä‘á»™ biáº¿n thiÃªn cao.
7. **Triá»‡t tiÃªu Cold Start cho luá»“ng tÃ i chÃ­nh**: Sá»­ dá»¥ng **Provisioned Concurrency** cho cÃ¡c endpoints nháº¡y cáº£m vá»›i Ä‘á»™ trá»… vÃ  **SnapStart** cho runtime Java.

---

### Danh Má»¥c Kiá»ƒm Tra NÄƒng Lá»±c (Learning Checklist)
- [ ] TÃ´i náº¯m vá»¯ng cÃ¡c giá»›i háº¡n ká»¹ thuáº­t cá»§a Lambda (Timeout 15m, RAM 128MB-10GB, Payload 6MB/256KB).
- [ ] TÃ´i hiá»ƒu rÃµ sá»± khÃ¡c biá»‡t giá»¯a Reserved Concurrency vÃ  Provisioned Concurrency.
- [ ] TÃ´i biáº¿t cÃ¡ch cáº¥u hÃ¬nh Lambda trong VPC vá»›i Private Subnet vÃ  NAT Gateway Ä‘á»ƒ káº¿t ná»‘i cáº£ DB ná»™i bá»™ vÃ  Internet.
- [ ] TÃ´i phÃ¢n biá»‡t Ä‘Æ°á»£c trÆ°á»ng há»£p sá»­ dá»¥ng tá»‘i Æ°u giá»¯a API Gateway HTTP API vÃ  REST API.
- [ ] TÃ´i giáº£i thÃ­ch Ä‘Æ°á»£c nguyÃªn lÃ½ hoáº¡t Ä‘á»™ng cá»§a DynamoDB Partition Key, Sort Key, LSI vÃ  GSI.
- [ ] TÃ´i biáº¿t cÃ¡ch tÃ­nh toÃ¡n chuyá»ƒn Ä‘á»•i giá»¯a DynamoDB On-Demand Mode vÃ  Provisioned Mode kÃ¨m Auto Scaling.
- [ ] TÃ´i hiá»ƒu rÃµ vai trÃ² cá»§a RDS Proxy trong viá»‡c chá»‘ng cáº¡n kiá»‡t káº¿t ná»‘i database cho kiáº¿n trÃºc Serverless.

---

### LiÃªn káº¿t vÃ  TÃ i liá»‡u LiÃªn quan
- ðŸ“– [Ghi ChÃº BÃ i Há»c ChÆ°Æ¡ng 19-20: Serverless Lambda, APIGW & DynamoDB](../Lesson_Notes/19_20_Serverless_Lambda_APIGW_DynamoDB.md)
- ðŸ“– [Báº£ng Thuáº­t Ngá»¯ Ká»¹ Thuáº­t (GLOSSARY.md)](../GLOSSARY.md)
- â­ï¸ Tiáº¿p tá»¥c chuyá»ƒn sang chuyÃªn Ä‘á»: [Amazon ECS, EKS & Dá»‹ch Vá»¥ Container](./ECS_Fargate_Containers.md).
