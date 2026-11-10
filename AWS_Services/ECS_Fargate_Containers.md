# TÃ i Liá»‡u Há»c Táº­p ChuyÃªn SÃ¢u: Amazon ECS, AWS Fargate, ECR & EKS (CÃ´ng Nghá»‡ Äiá»u Phá»‘i Container ÄÃ¡m MÃ¢y)

> **TÃ i liá»‡u chuáº©n hÃ³a kiáº¿n trÃºc Ä‘Ã¡m mÃ¢y**: HÆ°á»›ng dáº«n toÃ n diá»‡n theo tiÃªu chuáº©n Senior AWS Solutions Architect & Cloud DevOps Engineer (cáº­p nháº­t má»›i nháº¥t 2026).  
> **NgÃ´n ngá»¯**: Tiáº¿ng Viá»‡t (Báº£o lÆ°u toÃ n bá»™ thuáº­t ngá»¯ chuyÃªn ngÃ nh tiáº¿ng Anh chuáº©n AWS).  
> **CÃ¡c dá»‹ch vá»¥ liÃªn quan**: Amazon ECS, AWS Fargate, Amazon ECR, Amazon EKS, AWS App Runner, ECS Service Connect.

---

## 1. Tá»•ng Quan Dá»‹ch Vá»¥ (Service Overview)

### Dá»‹ch vá»¥ gÃ¬?
Há»‡ sinh thÃ¡i cÃ´ng nghá»‡ Ä‘Ã³ng gÃ³i vÃ  Ä‘iá»u phá»‘i container trÃªn AWS cung cáº¥p cÃ¡c giáº£i phÃ¡p toÃ n diá»‡n tá»« má»©c phi mÃ¡y chá»§ Ä‘áº¿n chuáº©n cÃ´ng nghiá»‡p:
1. **Amazon Elastic Container Service (Amazon ECS)**: Dá»‹ch vá»¥ Ä‘iá»u phá»‘i container Ä‘á»™c quyá»n (AWS-native) cÃ³ Ä‘á»™ tin cáº­y tuyá»‡t Ä‘á»‘i, tá»‘c Ä‘á»™ triá»ƒn khai cá»±c nhanh vÃ  tÃ­ch há»£p cháº·t cháº½ vá»›i IAM, ALB, CloudWatch vÃ  Secrets Manager.
2. **AWS Fargate**: Äá»™ng cÆ¡ tÃ­nh toÃ¡n phi mÃ¡y chá»§ (**Serverless Compute Engine**) dÃ nh cho cáº£ ECS vÃ  EKS. Báº¡n khÃ´ng cáº§n quáº£n lÃ½ báº¥t ká»³ cá»¥m mÃ¡y áº£o EC2 nÃ o bÃªn dÆ°á»›i; AWS tá»± Ä‘á»™ng phÃ¢n bá»• tÃ i nguyÃªn vÃ  báº¡n chá»‰ tráº£ tiá»n cho Ä‘Ãºng lÆ°á»£ng vCPU vÃ  RAM mÃ  container thá»±c sá»± tiÃªu thá»¥ theo tá»«ng giÃ¢y.
3. **Amazon Elastic Container Registry (Amazon ECR)**: Kho lÆ°u trá»¯ áº£nh container (Docker Container Registry) Ä‘Æ°á»£c quáº£n lÃ½ toÃ n diá»‡n, há»— trá»£ quÃ©t lá»— há»•ng báº£o máº­t tá»± Ä‘á»™ng báº±ng Amazon Inspector, tÃ­nh nÄƒng **Pull Through Cache** vÃ  mÃ£ hÃ³a KMS.
4. **Amazon Elastic Kubernetes Service (Amazon EKS)**: Dá»‹ch vá»¥ cháº¡y cá»¥m Ä‘iá»u phá»‘i container mÃ£ nguá»“n má»Ÿ **Kubernetes** Ä‘Æ°á»£c chá»©ng nháº­n tÆ°Æ¡ng thÃ­ch (Certified Conformant), há»— trá»£ tÃ­nh nÄƒng **EKS Pod Identity** hiá»‡n Ä‘áº¡i vÃ  Karpenter Ä‘á»ƒ tá»‘i Æ°u hÃ³a worker nodes.
5. **ECS Service Connect**: Giáº£i phÃ¡p Service Mesh vÃ  Service Discovery gá»n nháº¹ tÃ­ch há»£p sáºµn vÃ o ECS, cho phÃ©p cÃ¡c microservices giao tiáº¿p vá»›i nhau báº±ng tÃªn miá»n ná»™i bá»™ (`http://order-service:8080`) mÃ  khÃ´ng cáº§n cáº¥u hÃ¬nh DNS riÃªng hay Application Load Balancer ná»™i bá»™.

---

## 2. CÃ¡c KhÃ¡i Niá»‡m, Kiáº¿n TrÃºc & Váº­n HÃ nh Cá»‘t LÃµi (Core Concepts, Security & Day-2 Operations)

### 1. PhÃ¢n Biá»‡t Launch Types: EC2 vs AWS Fargate

```mermaid
flowchart TD
    Dev[Ká»¹ sÆ° DevOps / CI Pipeline] -->|Docker Push| ECR[Amazon ECR\nKho lÆ°u trá»¯ Container Image]

    subgraph ECSCluster[Amazon ECS Cluster]
        TaskDef[ECS Task Definition\nJSON Blueprint: Image, vCPU, RAM, Ports, Roles]
        
        subgraph LaunchTypes[Lá»±a chá»n Launch Types]
            direction LR
            EC2Type[1. EC2 Launch Type\nBáº¡n quáº£n lÃ½ OS, Patching & ASG Nodes]
            FargateType[2. AWS Fargate (Serverless)\nKhÃ´ng quáº£n lÃ½ Node/OS, Chá»‰ cáº¥p vCPU/RAM]
        end

        Service[ECS Service\nDuy trÃ¬ sá»‘ lÆ°á»£ng Desired Tasks\nTÃ­ch há»£p ALB Target Group & Service Connect]
        TaskDef --> Service
        Service --> LaunchTypes
    end

    ECR -->|Pull Image| LaunchTypes
    ALB[Application Load Balancer] -->|Dynamic Port Mapping| Service
```

| TiÃªu chuáº©n so sÃ¡nh | EC2 Launch Type | AWS Fargate Launch Type |
| :--- | :--- | :--- |
| **Quáº£n trá»‹ háº¡ táº§ng** | **Tá»± quáº£n lÃ½**: Pháº£i cáº¥u hÃ¬nh EC2, vÃ¡ lá»—i OS Ä‘á»‹nh ká»³, quáº£n lÃ½ ECS Container Agent vÃ  ECS-optimized AMI. | **Serverless 100%**: KhÃ´ng nhÃ¬n tháº¥y mÃ¡y chá»§; AWS chá»‹u trÃ¡ch nhiá»‡m báº£o máº­t vÃ  quáº£n lÃ½ toÃ n bá»™ há»‡ Ä‘iá»u hÃ nh bÃªn dÆ°á»›i. |
| **MÃ´ hÃ¬nh tÃ­nh phÃ­** | Tráº£ tiá»n theo giá» cá»§a cÃ¡c mÃ¡y áº£o EC2 Ä‘ang cháº¡y (dÃ¹ container cÃ³ cháº¡y háº¿t cÃ´ng suáº¥t hay khÃ´ng). | **Chá»‰ tráº£ tiá»n theo vCPU vÃ  RAM** cáº¥p phÃ¡t cho tá»«ng Task trong thá»i gian Task hoáº¡t Ä‘á»™ng thá»±c táº¿. |
| **CÆ¡ cháº¿ má»Ÿ rá»™ng (Scaling)** | Co giÃ£n 2 táº§ng phá»©c táº¡p: Auto Scaling cho sá»‘ lÆ°á»£ng Task VÃ€ Auto Scaling cho sá»‘ lÆ°á»£ng mÃ¡y chá»§ EC2 (Cluster Auto Scaling). | Co giÃ£n 1 táº§ng tá»©c thá»i: Chá»‰ cáº§n yÃªu cáº§u tÄƒng sá»‘ lÆ°á»£ng Task mong muá»‘n (Desired Count). |
| **LÆ°u trá»¯ dá»¯ liá»‡u** | Há»— trá»£ Amazon EBS, Amazon EFS vÃ  EC2 Instance Store cá»¥c bá»™ tá»‘c Ä‘á»™ cao. | Há»— trá»£ Ephemeral Storage (20 GB - 200 GB), **Amazon EFS**, vÃ  há»— trá»£ gáº¯n trá»±c tiáº¿p **Amazon EBS** cáº¥p Task. |
| **Ká»‹ch báº£n tá»‘i Æ°u** | Khá»‘i lÆ°á»£ng táº£i ráº¥t lá»›n cháº¡y á»•n Ä‘á»‹nh 24/7 Ä‘á»ƒ tá»‘i Æ°u chi phÃ­ báº±ng Reserved Instances / Compute Savings Plans. | Microservices phÃ¢n tÃ¡n, tÃ¡c vá»¥ xá»­ lÃ½ hÃ ng Ä‘á»£i (Batch Workers), mÃ´i trÆ°á»ng CI/CD khÃ´ng muá»‘n tá»‘n cÃ´ng báº£o trÃ¬ mÃ¡y chá»§. |

---

### 2. Hai Loáº¡i IAM Roles Sá»‘ng CÃ²n Trong Amazon ECS

```mermaid
classDiagram
    class TaskExecutionRole {
        +ÄÆ°á»£c dÃ¹ng bá»Ÿi: ECS Agent / Háº¡ Táº§ng AWS
        +Má»¥c Ä‘Ã­ch:
        - ÄÄƒng nháº­p vÃ  kÃ©o image tá»« Amazon ECR
        - Táº¡o Log Stream vÃ  Ä‘áº©y log lÃªn CloudWatch Logs
        - Láº¥y vÃ  giáº£i mÃ£ bÃ­ máº­t tá»« Secrets Manager / SSM Parameter Store
    }
    class TaskRole {
        +ÄÆ°á»£c dÃ¹ng bá»Ÿi: MÃ£ nguá»“n á»©ng dá»¥ng bÃªn trong Container
        +Má»¥c Ä‘Ã­ch:
        - Äá»c/ghi tá»‡p tin lÃªn Amazon S3 Bucket
        - Truy váº¥n vÃ  cáº­p nháº­t báº£ng Amazon DynamoDB
        - Gá»­i vÃ  nháº­n tin nháº¯n tá»« Amazon SQS Queue
    }
```

- **ECS Task Execution Role**: Cáº¥p quyá»n cho tiáº¿n trÃ¬nh **ECS Container Agent** hoáº·c háº¡ táº§ng Fargate chuáº©n bá»‹ mÃ´i trÆ°á»ng cháº¡y container (kÃ©o áº£nh tá»« ECR, ghi log vÃ o CloudWatch, Ä‘á»c secrets).
- **ECS Task Role**: Cáº¥p quyá»n nghiá»‡p vá»¥ trá»±c tiáº¿p cho chÃ­nh mÃ£ nguá»“n á»©ng dá»¥ng cháº¡y bÃªn trong container gá»i cÃ¡c API cá»§a AWS (tÆ°Æ¡ng tá»± nhÆ° Instance Profile cá»§a EC2). Má»—i microservice sá»Ÿ há»¯u má»™t Task Role riÃªng biá»‡t theo nguyÃªn táº¯c Least Privilege.

---

### 3. Ãnh Xáº¡ Cá»•ng Äá»™ng (Dynamic Port Mapping) & ECS Service Connect

- **Dynamic Port Mapping trÃªn ALB**:
  - Khi cháº¡y nhiá»u Tasks cá»§a cÃ¹ng má»™t Service trÃªn cÃ¹ng má»™t mÃ¡y chá»§ EC2, viá»‡c chá»‰ Ä‘á»‹nh cá»•ng tÄ©nh sáº½ gÃ¢y xung Ä‘á»™t.
  - Báº±ng cÃ¡ch Ä‘á»ƒ trá»‘ng trÆ°á»ng `HostPort` (hoáº·c Ä‘áº·t giÃ¡ trá»‹ `0`) trong Task Definition, Docker daemon sáº½ tá»± Ä‘á»™ng cáº¥p má»™t cá»•ng ngáº«u nhiÃªn trong dáº£i táº¡m thá»i (**Ephemeral Ports: 32768 - 61000**).
  - ECS Service tá»± Ä‘á»™ng Ä‘Äƒng kÃ½ Ä‘á»‹a chá»‰ IP cá»§a EC2 kÃ¨m theo sá»‘ cá»•ng ngáº«u nhiÃªn nÃ y vÃ o Target Group cá»§a ALB.
- **ECS Service Connect (Hiá»‡n Ä‘áº¡i)**:
  - Cung cáº¥p máº¡ng dá»‹ch vá»¥ ná»™i bá»™ (Service Mesh) cho cÃ¡c microservices trÃªn ECS.
  - Thay vÃ¬ pháº£i táº¡o ALB ná»™i bá»™ hoáº·c Cloud Map phá»©c táº¡p, Service Connect tá»± Ä‘á»™ng triá»ƒn khai proxy sidecar gá»n nháº¹ trong tá»«ng task. Microservice A cÃ³ thá»ƒ gá»i trá»±c tiáº¿p sang Microservice B qua tÃªn miá»n thÃ¢n thiá»‡n (vÃ­ dá»¥ `http://payment-service:8080`) vá»›i cÆ¡ cháº¿ tá»± Ä‘á»™ng cÃ¢n báº±ng táº£i vÃ  giÃ¡m sÃ¡t Ä‘á»™ trá»… P99.

---

### 4. Chiáº¿n LÆ°á»£c PhÃ¢n Bá»• TÃ¡c Vá»¥ ECS: Placement Strategies & Constraints (EC2 Launch Type)

Khi váº­n hÃ nh cá»¥m ECS vá»›i kiá»ƒu khá»Ÿi cháº¡y **EC2 Launch Type**, kiáº¿n trÃºc sÆ° cÃ³ toÃ n quyá»n Ä‘iá»u khiá»ƒn cÃ¡ch cÃ¡c task container Ä‘Æ°á»£c Ä‘áº·t lÃªn cÃ¡c mÃ¡y áº£o EC2 thÃ´ng qua **Task Placement Strategies** vÃ  **Task Placement Constraints** (`TD-Set6 Q46`):

```mermaid
flowchart TD
    subgraph Strategies[1. Task Placement Strategies - Thuáº­t ToÃ¡n PhÃ¢n Bá»•]
        BP[binpack\nNÃ©n task vÃ o Ã­t EC2 nháº¥t dá»±a trÃªn CPU hoáº·c Memory cÃ²n trá»‘ng\n-> Tá»‘i Æ°u hÃ³a chi phÃ­, giáº£m sá»‘ lÆ°á»£ng instance cáº§n cháº¡y]
        SP[spread\nRáº£i Ä‘á»u task qua cÃ¡c Availability Zone hoáº·c Instance Id\n-> Tá»‘i Ä‘a hÃ³a tÃ­nh sáºµn sÃ ng cao High Availability]
        RD[random\nÄáº·t tÃ¡c vá»¥ hoÃ n toÃ n ngáº«u nhiÃªn]
    end

    subgraph Constraints[2. Task Placement Constraints - Bá»™ Lá»c Äiá»u Kiá»‡n TiÃªn Quyáº¿t]
        DI[distinctInstance\nMá»—i mÃ¡y chá»§ EC2 chá»‰ Ä‘Æ°á»£c phÃ©p cháº¡y tá»‘i Ä‘a 1 task duy nháº¥t cá»§a cÃ¹ng má»™t task definition]
        MO[memberOf\nTask báº¯t buá»™c pháº£i náº±m trÃªn EC2 thá»a mÃ£n biá»ƒu thá»©c\nvÃ­ dá»¥: attribute:ecs.instance-type =~ t3.* hoáº·c runningTasksCount == 0]
    end
```

- **Quy táº¯c phá»‘i há»£p chuáº©n kiáº¿n trÃºc**:
  - *Tá»‘i Æ°u High Availability (HA)*: Káº¿t há»£p Strategy `spread(attribute:ecs.availability-zone)` tiáº¿p theo lÃ  `spread(instanceId)`.
  - *Tá»‘i Æ°u chi phÃ­ sáº£n xuáº¥t*: Káº¿t há»£p Strategy `binpack(memory)` hoáº·c `binpack(cpu)` Ä‘á»ƒ gom task vÃ o Ã­t mÃ¡y áº£o nháº¥t, cho phÃ©p Auto Scaling Group táº¯t bá»›t cÃ¡c EC2 instances nhÃ n rá»—i (`TD-Set6 Q46`).
  - *Cháº¡y duy nháº¥t 1 task trÃªn má»—i mÃ¡y áº£o*: Ãp dá»¥ng Constraint `distinctInstance` (`TD-Set6 Q46`).
  - âš ï¸ **LÆ°u Ã½ thi cá»­ sá»‘ng cÃ²n**: Task Placement Strategies & Constraints **CHá»ˆ ÃP Dá»¤NG CHO EC2 LAUNCH TYPE**, hoÃ n toÃ n khÃ´ng Ã¡p dá»¥ng cho AWS Fargate vÃ¬ Fargate lÃ  serverless, AWS tá»± Ä‘á»™ng quáº£n lÃ½ háº¡ táº§ng bÃªn dÆ°á»›i (`TD-Set6 Q46`)!

---

### 5. CÆ¡ Cháº¿ Tá»± Äá»™ng Co GiÃ£n ECS (Service Auto Scaling & Cluster Auto Scaling)

- **ECS Service Auto Scaling**:
  - Tá»± Ä‘á»™ng Ä‘iá»u chá»‰nh sá»‘ lÆ°á»£ng Task mong muá»‘n (**Desired Task Count**) dá»±a trÃªn cÃ¡c metric CloudWatch:
    1. *Target Tracking Scaling*: Duy trÃ¬ má»©c táº£i CPU trung bÃ¬nh (`ECSServiceAverageCPUUtilization`) hoáº·c Memory á»Ÿ má»©c má»¥c tiÃªu (vÃ­ dá»¥ 70%).
    2. *ALB RequestCountPerTarget*: Duy trÃ¬ sá»‘ lÆ°á»£ng requests trung bÃ¬nh trÃªn má»—i container task phÃ­a sau ALB, pháº£n há»“i ngay láº­p tá»©c trÆ°á»›c cÃ¡c Ä‘á»£t bÃ¹ng ná»• traffic (`TD-Set6 Q59`).
    3. *Step Scaling theo SQS Queue Backlog*: Khi cÃ³ tá»‡p tin upload lÃªn S3, S3 gá»­i thÃ´ng bÃ¡o vÃ o SQS Queue; ECS Service Auto Scaling tÄƒng sá»‘ lÆ°á»£ng Fargate batch worker tasks tÆ°Æ¡ng á»©ng vá»›i sá»‘ lÆ°á»£ng tin nháº¯n trong hÃ ng Ä‘á»£i (`TD-Set1 Q59`).
- **Amazon ECS Capacity Providers**:
  - Tá»± Ä‘á»™ng Ä‘á»“ng bá»™ giá»¯a táº§ng Tasks vÃ  táº§ng EC2 Instances (Cluster Auto Scaling), Ä‘áº£m báº£o khi Service cáº§n scale out thÃªm tasks thÃ¬ Capacity Provider sáº½ tá»± Ä‘á»™ng ra lá»‡nh cho EC2 Auto Scaling Group bá»• sung thÃªm mÃ¡y áº£o tÆ°Æ¡ng á»©ng.

---

### ðŸ›ï¸ I. CÃ¡c Ká»‹ch Báº£n Kiáº¿n TrÃºc Chuáº©n (Best Practice Scenarios)

#### 1. Äiá»u Phá»‘i Container KhÃ´ng MÃ¡y Chá»§ Vá»›i AWS Fargate (Minimal Operational Overhead)
- **TÃ¬nh huá»‘ng thi**: Doanh nghiá»‡p muá»‘n Ä‘Ã³ng gÃ³i á»©ng dá»¥ng web microservices thÃ nh cÃ¡c Docker containers. Äá»™i ngÅ© khÃ´ng muá»‘n tá»‘n thá»i gian quáº£n lÃ½ cá»¥m mÃ¡y chá»§, vÃ¡ lá»—i há»‡ Ä‘iá»u hÃ nh EC2, hay cáº¥u hÃ¬nh dung lÆ°á»£ng cá»¥m.
- **Giáº£i phÃ¡p tá»‘i Æ°u chuáº©n AWS**:
  - Triá»ƒn khai á»©ng dá»¥ng trÃªn **Amazon ECS (Elastic Container Service)** vá»›i kiá»ƒu khá»Ÿi cháº¡y **AWS Fargate (Serverless Launch Type)**.
  - AWS tá»± Ä‘á»™ng cáº¥p phÃ¡t, cáº¥u hÃ¬nh vÃ  má»Ÿ rá»™ng háº¡ táº§ng tÃ­nh toÃ¡n theo tá»«ng Task.
  - Báº¡n chá»‰ cáº§n tráº£ tiá»n cho sá»‘ lÆ°á»£ng vCPU vÃ  dung lÆ°á»£ng RAM Ä‘Æ°á»£c cáº¥p phÃ¡t chÃ­nh xÃ¡c theo tá»«ng giÃ¢y cháº¡y cá»§a Task.

#### 2. PhÃ¢n Äá»‹nh Ráº¡ch RÃ²i Giá»¯a ECS Task Role vÃ  ECS Task Execution Role
- **Báº«y thi phá»• biáº¿n**: Äá» bÃ i yÃªu cáº§u phÃ¢n quyá»n Ä‘á»ƒ container kÃ©o áº£nh tá»« ECR hoáº·c phÃ¢n quyá»n Ä‘á»ƒ code Ä‘á»c DynamoDB vÃ  Ä‘Æ°a ra 2 loáº¡i role nÃ y:

| Loáº¡i IAM Role trong ECS | Äá»‘i tÆ°á»£ng sá»­ dá»¥ng | CÃ¡c quyá»n háº¡n Ä‘iá»ƒn hÃ¬nh Ä‘Æ°á»£c gÃ¡n |
|:---|:---|:---|
| **ECS Task Execution Role** | DÃ nh cho **háº¡ táº§ng ECS Agent** (AWS infrastructure agent) | - KÃ©o Docker image tá»« **Amazon ECR** (`ecr:GetAuthorizationToken`, `ecr:BatchGetImage`)<br>- Äáº©y log á»©ng dá»¥ng vÃ o **CloudWatch Logs** (`logs:CreateLogStream`, `logs:PutLogEvents`)<br>- Láº¥y biáº¿n mÃ´i trÆ°á»ng nháº¡y cáº£m tá»« **Secrets Manager** hoáº·c **SSM Parameter Store** |
| **ECS Task Role** | DÃ nh cho **mÃ£ nguá»“n á»©ng dá»¥ng** cháº¡y bÃªn trong Container | - Gá»i AWS SDK tá»« code Python/Java/NodeJS<br>- Äá»c/ghi dá»¯ liá»‡u vÃ o **Amazon S3** (`s3:GetObject`, `s3:PutObject`)<br>- Truy váº¥n cÆ¡ sá»Ÿ dá»¯ liá»‡u **Amazon DynamoDB**<br>- Gá»­i tin nháº¯n vÃ o hÃ ng Ä‘á»£i **Amazon SQS** |

#### 3. Cháº¡y TÃ¡c Vá»¥ DÃ i Háº¡n > 15 PhÃºt KhÃ´ng Quáº£n Trá»‹ Server (EventBridge + Fargate)
- **TÃ¬nh huá»‘ng thi**: BÃ¡o cÃ¡o tÃ i chÃ­nh Ä‘á»‹nh ká»³ vÃ o 2h sÃ¡ng má»—i ngÃ y cáº§n cháº¡y tá»« 30 Ä‘áº¿n 45 phÃºt Ä‘á»ƒ tá»•ng há»£p dá»¯ liá»‡u. YÃªu cáº§u kiáº¿n trÃºc Serverless, khÃ´ng quáº£n lÃ½ EC2.
- **Giáº£i phÃ¡p chuáº©n**:
  - KhÃ´ng thá»ƒ dÃ¹ng Lambda (do giá»›i háº¡n cá»©ng 15 phÃºt).
  - Sá»­ dá»¥ng **Amazon EventBridge Scheduler** kÃ­ch hoáº¡t má»™t tÃ¡c vá»¥ **ECS on AWS Fargate** theo lá»‹ch cron (`RunTask` API). Fargate cháº¡y xong sáº½ tá»± Ä‘á»™ng táº¯t vÃ  dá»«ng tÃ­nh phÃ­.

#### 4. PhÃ¢n Quyá»n Chi Tiáº¿t Cho Tá»«ng Pod Kubernetes Báº±ng IRSA (IAM Roles for Service Accounts) â€” (U-PT1 Q04)
- **TÃ¬nh huá»‘ng thi**: Má»™t cá»¥m **Amazon EKS (Elastic Kubernetes Service)** cháº¡y hÃ ng chá»¥c microservices trÃªn cÃ¹ng cÃ¡c worker nodes. Microservice xá»­ lÃ½ thanh toÃ¡n (Payment Pod) cáº§n ghi dá»¯ liá»‡u vÃ o Amazon DynamoDB vÃ  Ä‘á»c file nháº¡y cáº£m tá»« S3, trong khi cÃ¡c microservices khÃ¡c khÃ´ng Ä‘Æ°á»£c phÃ©p cÃ³ báº¥t ká»³ quyá»n háº¡n nÃ o trÃªn AWS. Äá»™i ngÅ© báº£o máº­t yÃªu cáº§u thá»±c thi nghiÃªm ngáº·t nguyÃªn táº¯c Ä‘áº·c quyá»n tá»‘i thiá»ƒu (**Least Privilege**).
- **Giáº£i phÃ¡p tá»‘i Æ°u chuáº©n AWS**:
  - Báº­t tÃ­nh nÄƒng **IAM OpenID Connect (OIDC) Identity Provider** cho cá»¥m Amazon EKS.
  - Táº¡o má»™t **IAM Role** vá»›i Trust Policy cho phÃ©p OIDC provider assume role vÃ  gÃ¡n Ä‘iá»u kiá»‡n theo Ä‘Ãºng Namespace vÃ  tÃªn ServiceAccount cá»§a Kubernetes:
    `"StringEquals": { "<OIDC_PROVIDER>:sub": "system:serviceaccount:payments:payment-serviceaccount" }`.
  - Khai bÃ¡o má»™t Kubernetes ServiceAccount mang tÃªn `payment-serviceaccount` vÃ  thÃªm dÃ²ng Annotation:
    `eks.amazonaws.com/role-arn: arn:aws:iam::<Account-ID>:role/PaymentServiceRole`.
  - Pod cá»§a Payment microservice sá»­ dá»¥ng ServiceAccount nÃ y. AWS EKS Pod Identity Webhook sáº½ tá»± Ä‘á»™ng chÃ¨n token vÃ  AWS credentials táº¡m thá»i vÃ o container cá»§a Pod Ä‘Ã³.
  - **Káº¿t quáº£**: Chá»‰ duy nháº¥t Payment Pod cÃ³ quyá»n truy cáº­p DynamoDB/S3. Táº¥t cáº£ cÃ¡c Pod khÃ¡c cháº¡y chung trÃªn cÃ¹ng má»™t mÃ¡y chá»§ EC2 Ä‘á»u hoÃ n toÃ n khÃ´ng cÃ³ quyá»n!

#### 5. Cháº¡y Cá»¥m Kubernetes Chuáº©n AWS Táº¡i Háº¡ Táº§ng On-Premises Vá»›i EKS Anywhere â€” (U-PT1 Q65)
- **TÃ¬nh huá»‘ng thi**: Doanh nghiá»‡p tÃ i chÃ­nh cÃ³ yÃªu cáº§u tuÃ¢n thá»§ dá»¯ liá»‡u báº¯t buá»™c má»™t sá»‘ workload nháº¡y cáº£m pháº£i cháº¡y 100% trÃªn pháº§n cá»©ng mÃ¡y chá»§ váº­t lÃ½ Ä‘áº·t táº¡i trung tÃ¢m dá»¯ liá»‡u On-Premises. Tuy nhiÃªn, Ä‘á»™i ngÅ© DevOps muá»‘n Ä‘á»“ng nháº¥t hÃ³a toÃ n bá»™ quy trÃ¬nh CI/CD, cÃ´ng cá»¥ tá»± Ä‘á»™ng hÃ³a vÃ  API quáº£n trá»‹ theo chuáº©n Amazon EKS trÃªn Ä‘Ã¡m mÃ¢y.
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Triá»ƒn khai **Amazon EKS Anywhere** trÃªn háº¡ táº§ng áº£o hÃ³a VMware vSphere hoáº·c mÃ¡y chá»§ váº­t lÃ½ Bare Metal táº¡i chá»— cá»§a doanh nghiá»‡p.
  - Sá»­ dá»¥ng cÃ¹ng má»™t phiÃªn báº£n Kubernetes Ä‘Ã£ Ä‘Æ°á»£c AWS kiá»ƒm Ä‘á»‹nh vÃ  há»— trá»£ (Amazon EKS Distro).
  - Quáº£n lÃ½ tráº¡ng thÃ¡i cá»¥m EKS táº¡i chá»— táº­p trung thÃ´ng qua **Amazon EKS Connector** trÃªn AWS Management Console.

---

### ðŸª¤ II. CÃ¡c Báº«y Thi Tinh Vi & PhÃ¢n TÃ­ch PhÆ°Æ¡ng Ãn Sai (Exam Traps & Distractors)

#### ðŸª¤ Báº«y 1: á»¨ng Dá»¥ng Container CÃ³ Tráº¡ng ThÃ¡i Cáº§n Bá»™ Nhá»› Chia Sáº» (Stateful Microservices Vá»›i EFS) â€” (CM-PT1 Q36)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p chuyá»ƒn Ä‘á»•i á»©ng dá»¥ng xá»­ lÃ½ ná»™i dung sá»‘ cháº¡y trÃªn Docker containers lÃªn AWS Fargate. Nhiá»u container tasks cáº§n Ä‘á»c vÃ  ghi Ä‘á»“ng thá»i vÃ o má»™t khÃ´ng gian lÆ°u trá»¯ tá»‡p tin dÃ¹ng chung cÃ³ tÃ­nh bá»n vá»¯ng cao vÃ  tá»± Ä‘á»™ng co giÃ£n."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Sá»­ dá»¥ng Amazon EBS Volume*: TrÆ°á»›c Ä‘Ã¢y Fargate khÃ´ng há»— trá»£ EBS; hiá»‡n táº¡i dÃ¹ Ä‘Ã£ há»— trá»£ EBS mount cho tá»«ng task Ä‘Æ¡n láº», EBS **hoÃ n toÃ n khÃ´ng há»— trá»£ chia sáº» Ä‘á»“ng thá»i nhiá»u mÃ¡y chá»§ (Multi-Attach qua nhiá»u AZ)** cho á»©ng dá»¥ng tá»‡p tin tiÃªu chuáº©n.
  - âŒ *Sá»­ dá»¥ng bá»™ nhá»› Ephemeral Storage máº·c Ä‘á»‹nh cá»§a Fargate*: Bá»™ nhá»› nÃ y chá»‰ tá»“n táº¡i táº¡m thá»i cÃ¹ng vÃ²ng Ä‘á»i cá»§a Task, khi Task táº¯t hoáº·c scale-in toÃ n bá»™ dá»¯ liá»‡u sáº½ bá»‹ xÃ³a sáº¡ch!
- **Giáº£i phÃ¡p ÄÃšNG**: TÃ­ch há»£p **Amazon Elastic File System (Amazon EFS)** vÃ o ECS Task Definition.
  - EFS lÃ  há»‡ thá»‘ng tá»‡p tin máº¡ng tiÃªu chuáº©n POSIX.
  - Cho phÃ©p hÃ ng trÄƒm ECS Fargate Tasks tráº£i dÃ i trÃªn nhiá»u Availability Zones cÃ¹ng mount vÃ  Ä‘á»c/ghi Ä‘á»“ng thá»i vá»›i tÃ­nh nháº¥t quÃ¡n cao.

#### ðŸª¤ Báº«y 2: KÃ©o Image Tá»« Amazon ECR Cho Fargate Trong Private Subnet Tuyá»‡t Äá»‘i
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"CÃ¡c tÃ¡c vá»¥ ECS Fargate Ä‘Æ°á»£c triá»ƒn khai trong Private Subnet hoÃ n toÃ n khÃ´ng cÃ³ Internet Gateway vÃ  khÃ´ng cÃ³ NAT Gateway. TÃ¡c vá»¥ bá»‹ lá»—i khÃ´ng thá»ƒ khá»Ÿi Ä‘á»™ng Ä‘Æ°á»£c (CannotPullContainerError)."*
- **NguyÃªn nhÃ¢n & Bá»™ 3 VPC Endpoints báº¯t buá»™c**:
  - Äá»ƒ Fargate trong máº¡ng cÃ´ láº­p kÃ©o Ä‘Æ°á»£c Docker image tá»« ECR, báº¯t buá»™c pháº£i cáº¥u hÃ¬nh:
    1. **Interface VPC Endpoint**: `com.amazonaws.<region>.ecr.api` (cho cÃ¡c lá»‡nh gá»i Ä‘iá»u khiá»ƒn ECR API).
    2. **Interface VPC Endpoint**: `com.amazonaws.<region>.ecr.dkr` (cho luá»“ng táº£i cÃ¡c image layer Docker).
    3. **Gateway VPC Endpoint cho Amazon S3**: ÄÃ¢y lÃ  **báº«y tinh vi nháº¥t** â€” toÃ n bá»™ cÃ¡c layer nhá»‹ phÃ¢n cá»§a Docker image trong Amazon ECR thá»±c táº¿ Ä‘Æ°á»£c lÆ°u trá»¯ trÃªn Amazon S3! Náº¿u thiáº¿u S3 Gateway Endpoint, lá»‡nh kÃ©o image váº«n sáº½ tháº¥t báº¡i.

#### ðŸª¤ Báº«y 3: PhÃ¢n Quyá»n Least Privilege: Task Role vs Task Execution Role â€” (CM-PT2 Q20)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng microservices Ä‘Ã³ng gÃ³i container cháº¡y trÃªn Amazon ECS cáº§n Ä‘á»c cÃ¡c file trong S3 bucket vÃ  ghi báº£n ghi vÃ o Amazon DynamoDB. Cáº§n phÃ¢n quyá»n IAM theo nguyÃªn táº¯c Ä‘áº·c quyá»n tá»‘i thiá»ƒu (Least Privilege). Cáº¥u hÃ¬nh IAM nhÆ° tháº¿ nÃ o?"*
- **Quy táº¯c phÃ¢n biá»‡t báº¥t biáº¿n**:
  - **Task Role**: Cáº¥p quyá»n cho **mÃ£ nguá»“n á»©ng dá»¥ng cháº¡y bÃªn trong container**. Khi code Java/Node.js gá»i `s3.getObject()` hay `dynamo.putItem()`, nÃ³ sáº½ nháº­n credentials tá»« Task Role. LuÃ´n gáº¯n IAM policy cÃ³ full ARN cá»§a S3/DynamoDB vÃ o **Task Role**!
  - **Task Execution Role**: Cáº¥p quyá»n cho **háº¡ táº§ng ECS Agent cá»§a AWS** Ä‘á»ƒ thá»±c thi cÃ¡c tÃ¡c vá»¥ quáº£n trá»‹ container (kÃ©o image tá»« Amazon ECR, Ä‘áº©y stdout log vÃ o CloudWatch Logs, láº¥y bÃ­ máº­t tá»« Secrets Manager Ä‘Æ°a vÃ o biáº¿n mÃ´i trÆ°á»ng).
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *GÃ¡n IAM policy Ä‘á»c S3 vÃ o Task Execution Role*: MÃ£ nguá»“n á»©ng dá»¥ng bÃªn trong container sáº½ bá»‹ lá»—i `AccessDenied` vÃ¬ Execution Role khÃ´ng Ä‘Æ°á»£c truyá»n vÃ o container runtime.
  - âŒ *GÃ¡n IAM policy vÃ o EC2 Instance Profile Role*: Vi pháº¡m nghiÃªm trá»ng Least Privilege vÃ¬ táº¥t cáº£ cÃ¡c container khÃ¡c cháº¡y chung trÃªn mÃ¡y áº£o EC2 Ä‘Ã³ Ä‘á»u cÃ³ thá»ƒ mÆ°á»£n quyá»n truy cáº­p vÃ o S3 bucket!

#### ðŸª¤ Báº«y 4: Cháº¡y á»¨ng Dá»¥ng Web Container Vá»›i Ãt CÃ´ng Váº­n HÃ nh Nháº¥t: App Runner vs ECS â€” (CM-PT2 Q57, CM-PT4 Q05)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p muá»‘n triá»ƒn khai má»™t á»©ng dá»¥ng web dáº¡ng Docker container vá»›i Ã­t chi phÃ­ váº­n hÃ nh vÃ  quáº£n lÃ½ háº¡ táº§ng nháº¥t (LEAST operational overhead), khÃ´ng muá»‘n pháº£i tá»± cáº¥u hÃ¬nh VPC, subnets, Load Balancers hay ECS Clusters."*
- **Giáº£i phÃ¡p ÄÃšNG**: **AWS App Runner**.
  - Dá»‹ch vá»¥ PaaS Serverless Container cá»§a riÃªng AWS: Láº­p trÃ¬nh viÃªn chá»‰ cáº§n trá» tá»›i Docker image trong Amazon ECR hoáº·c mÃ£ nguá»“n Git.
  - App Runner tá»± Ä‘á»™ng cung cáº¥p Load Balancer, chá»©ng chá»‰ SSL/TLS, Ä‘á»‹nh tuyáº¿n lÆ°u lÆ°á»£ng, giÃ¡m sÃ¡t vÃ  co giÃ£n tá»± Ä‘á»™ng theo sá»‘ lÆ°á»£ng request Ä‘á»“ng thá»i mÃ  ngÆ°á»i dÃ¹ng hoÃ n toÃ n khÃ´ng cáº§n quáº£n lÃ½ máº¡ng hay cluster.

#### ðŸª¤ Báº«y 5: Cáº¥p Quyá»n IAM Cho Pod TrÃªn Kubernetes: Node Instance Role vs IRSA â€” (U-PT1 Q04)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng xá»­ lÃ½ Ä‘Æ¡n hÃ ng cháº¡y trong má»™t Pod trÃªn Amazon EKS cáº§n quyá»n ghi vÃ o Amazon DynamoDB. YÃªu cáº§u cáº¥p quyá»n theo nguyÃªn táº¯c Ä‘áº·c quyá»n tá»‘i thiá»ƒu (Least Privilege), Ä‘áº£m báº£o cÃ¡c Pod khÃ¡c cháº¡y chung trÃªn cÃ¹ng mÃ¡y chá»§ khÃ´ng Ä‘Æ°á»£c phÃ©p truy cáº­p DynamoDB."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *GÃ¡n IAM Policy truy cáº­p DynamoDB vÃ o EC2 Worker Node Instance Profile Role*: Vi pháº¡m nghiÃªm trá»ng nguyÃªn táº¯c Least Privilege! Khi gÃ¡n quyá»n vÃ o Node Role, má»i Pod (ká»ƒ cáº£ frontend web pod hay logging pod) cháº¡y chung trÃªn mÃ¡y chá»§ EC2 Ä‘Ã³ Ä‘á»u cÃ³ thá»ƒ mÆ°á»£n quyá»n cá»§a Node Ä‘á»ƒ Ä‘á»c/ghi vÃ o DynamoDB.
  - âŒ *LÆ°u trá»¯ AWS Access Key vÃ  Secret Key cá»‘ Ä‘á»‹nh vÃ o Kubernetes Secret*: Tiá»m áº©n rá»§i ro lá»™ lá»t thÃ´ng tin xÃ¡c thá»±c tÄ©nh (Static Credentials), khÃ´ng cÃ³ cÆ¡ cháº¿ tá»± Ä‘á»™ng xoay vÃ²ng khÃ³a.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **IAM Roles for Service Accounts (IRSA)**.
  - Cáº¥u hÃ¬nh OIDC Identity Provider cho cá»¥m EKS.
  - Táº¡o IAM Role vá»›i Trust Policy gáº¯n vá»›i Kubernetes ServiceAccount cá»§a Pod xá»­ lÃ½ Ä‘Æ¡n hÃ ng.
  - AWS EKS tá»± Ä‘á»™ng cung cáº¥p temporary credentials thÃ´ng qua AWS STS chá»‰ riÃªng cho Pod Ä‘Ã³.

#### ðŸª¤ Báº«y 6: Triá»ƒn Khai Kubernetes TrÃªn On-Premises Giá»¯ NguyÃªn AWS API: EKS Anywhere vs Tá»± Dá»±ng K8s â€” (U-PT1 Q65)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p báº¯t buá»™c pháº£i giá»¯ má»™t sá»‘ á»©ng dá»¥ng xá»­ lÃ½ dá»¯ liá»‡u nháº¡y cáº£m táº¡i trung tÃ¢m dá»¯ liá»‡u On-Premises vÃ¬ lÃ½ do tuÃ¢n thá»§ phÃ¡p lÃ½, nhÆ°ng muá»‘n táº­n dá»¥ng kiáº¿n trÃºc nháº¥t quÃ¡n, cÃ¡c cÃ´ng cá»¥ quáº£n trá»‹ vÃ  API chuáº©n cá»§a Amazon EKS."*
- **PhÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Tá»± cÃ i Ä‘áº·t cá»¥m Kubernetes mÃ£ nguá»“n má»Ÿ thá»§ cÃ´ng vÃ  tá»± viáº¿t script Ä‘á»“ng bá»™*: Tá»‘n cÃ´ng sá»©c quáº£n trá»‹ vÃ  báº£o trÃ¬ phiÃªn báº£n, khÃ´ng Ä‘á»“ng bá»™ Ä‘Æ°á»£c tráº¡ng thÃ¡i vá»›i AWS Console.
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Amazon EKS Anywhere** (hoáº·c triá»ƒn khai **AWS Outposts** náº¿u cáº§n pháº§n cá»©ng do AWS quáº£n lÃ½).
  - Cho phÃ©p cháº¡y cá»¥m Kubernetes chuáº©n AWS trÃªn mÃ¡y chá»§ On-Premises cá»§a khÃ¡ch hÃ ng.
  - Káº¿t ná»‘i vÃ  hiá»ƒn thá»‹ tráº¡ng thÃ¡i táº­p trung trÃªn AWS EKS Console thÃ´ng qua **EKS Connector**.

#### ðŸª¤ Báº«y 7: Chiáº¿n LÆ°á»£c Äáº·t TÃ¡c Vá»¥ ECS Tá»‘i Æ¯u Chi PhÃ­ vs TÃ­nh Sáºµn SÃ ng: Placement Strategies & Constraints â€” (CM-PT5 Q02)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Há»‡ thá»‘ng High-Performance Computing (HPC) cháº¡y trÃªn Amazon ECS vá»›i kiá»ƒu khá»Ÿi cháº¡y Amazon EC2 Launch Type. Cáº§n cáº¥u hÃ¬nh phÃ¢n bá»• tÃ¡c vá»¥ sao cho: (1) NÃ©n cÃ¡c task vÃ o sá»‘ lÆ°á»£ng Ã­t mÃ¡y áº£o nháº¥t dá»±a trÃªn RAM/CPU trá»‘ng Ä‘á»ƒ tá»‘i Æ°u hÃ³a chi phÃ­ vÃ  táº¯t bá»›t EC2 thá»«a, hoáº·c (2) Ráº£i Ä‘á»u task sang cÃ¡c Availability Zone Ä‘á»ƒ Ä‘áº¡t tÃ­nh sáºµn sÃ ng cao nháº¥t, hoáº·c (3) Má»—i mÃ¡y chá»§ EC2 chá»‰ Ä‘Æ°á»£c cháº¡y duy nháº¥t 1 task."*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *Cáº¥u hÃ¬nh Placement Strategy trÃªn AWS Fargate*: Fargate lÃ  serverless, AWS tá»± quáº£n lÃ½ mÃ¡y chá»§ bÃªn dÆ°á»›i nÃªn **hoÃ n toÃ n khÃ´ng há»— trá»£ vÃ  khÃ´ng thá»ƒ cáº¥u hÃ¬nh Placement Strategies/Constraints**!
  - âŒ *Nháº§m láº«n giá»¯a `binpack` vÃ  `spread`*: `binpack` gom nÃ©n Ä‘á»ƒ tiáº¿t kiá»‡m chi phÃ­; `spread` ráº£i Ä‘á»u Ä‘á»ƒ Ä‘áº£m báº£o High Availability.
- **Giáº£i phÃ¡p ÄÃšNG**: Ãp dá»¥ng cÃ¡c chiáº¿n lÆ°á»£c chuáº©n trÃªn **EC2 Launch Type** (`TD-Set6 Q46`):
  - Tiáº¿t kiá»‡m chi phÃ­, nÃ©n task vÃ o Ã­t host nháº¥t: Strategy **`binpack`** (theo `memory` hoáº·c `cpu`).
  - Tá»‘i Ä‘a hÃ³a tÃ­nh sáºµn sÃ ng cao (HA): Strategy **`spread`** (theo `attribute:ecs.availability-zone` hoáº·c `instanceId`).
  - Cháº¡y duy nháº¥t 1 task trÃªn 1 mÃ¡y áº£o: Constraint **`distinctInstance`** (`TD-Set6 Q46`).

#### ðŸª¤ Báº«y 8: Co GiÃ£n TÃ¡c Vá»¥ Batch Container Xá»­ LÃ½ File S3: EventBridge RunTask vs SQS Service Scaling â€” (TD-Set1 Q59, CM-PT6 Q64, TD-Set6 Q60)
- **TÃ¬nh huá»‘ng Ä‘á» thi TD-Set1 Q59 (Ná»— lá»±c quáº£n trá»‹ tá»‘i thiá»ƒu - LEAST effort)**: *"Doanh nghiá»‡p cÃ³ á»©ng dá»¥ng xá»­ lÃ½ batch job cháº¡y trÃªn AWS Fargate má»—i khi cÃ³ file má»›i Ä‘Æ°á»£c táº£i lÃªn Amazon S3. Sá»‘ lÆ°á»£ng ECS task ban Ä‘áº§u Ä‘áº·t lÃ  1 Ä‘á»ƒ tiáº¿t kiá»‡m chi phÃ­, vÃ  chá»‰ Ä‘Æ°á»£c phÃ©p tÄƒng thÃªm khi cÃ³ tá»‡p tin má»›i Ä‘Æ°á»£c táº£i lÃªn S3. Cáº§n giáº£i phÃ¡p tá»± Ä‘á»™ng kÃ­ch hoáº¡t nÃ o tá»‘n Ã­t ná»— lá»±c váº­n hÃ nh nháº¥t?"*
- **CÃ¡c phÆ°Æ¡ng Ã¡n báº«y**:
  - âŒ *DÃ¹ng S3 Event Notification gá»i Lambda ghi vÃ o SQS rá»“i cáº¥u hÃ¬nh ECS Service Auto Scaling*: HoÃ n toÃ n hoáº¡t Ä‘á»™ng Ä‘Æ°á»£c nhÆ°ng cáº¥u hÃ¬nh quÃ¡ nhiá»u thÃ nh pháº§n (Lambda, SQS, Alarm, Scaling Policy), vi pháº¡m tiÃªu chÃ­ "Least operational overhead" cá»§a cÃ¢u `TD-Set1 Q59`!
  - âŒ *Cáº¥u hÃ¬nh CloudWatch Alarm theo dÃµi CPU cá»§a Fargate task*: Khi tá»‡p má»›i táº£i lÃªn S3, task cÃ³ thá»ƒ chÆ°a ká»‹p cháº¡y hoáº·c CPU chÆ°a tÄƒng, gÃ¢y trá»….
- **Giáº£i phÃ¡p ÄÃšNG cho `TD-Set1 Q59` (Least Effort)**:
  - Cáº¥u hÃ¬nh **Amazon EventBridge Rule** báº¯t sá»± kiá»‡n `Object Created` trá»±c tiáº¿p tá»« **Amazon S3** vÃ  kÃ­ch hoáº¡t target lÃ  **Amazon ECS Task (`RunTask` action)** trÃªn cá»¥m ECS Fargate.
  - ÄÃ¢y lÃ  giáº£i phÃ¡p khÃ´ng cáº§n viáº¿t code, khÃ´ng cáº§n duy trÃ¬ hÃ ng Ä‘á»£i SQS hay thiáº¿t láº­p chÃ­nh sÃ¡ch co giÃ£n phá»©c táº¡p.
- **Khi nÃ o dÃ¹ng kiáº¿n trÃºc S3 $\rightarrow$ SQS $\rightarrow$ ECS Service Auto Scaling (`CM-PT6 Q64`, `TD-Set6 Q60`)?**:
  - Khi lÆ°u lÆ°á»£ng táº£i lÃªn hÃ ng váº¡n file/giÃ¢y vÃ  há»‡ thá»‘ng cáº§n cÆ¡ cháº¿ Ä‘á»‡m (Buffering), giá»›i háº¡n tá»‘c Ä‘á»™ xá»­ lÃ½ (Rate Limiting) hoáº·c lÆ°u trá»¯ láº¡i tin nháº¯n lá»—i qua Dead-Letter Queue (DLQ) Ä‘á»ƒ worker tiÃªu thá»¥ dáº§n theo nÄƒng lá»±c cho phÃ©p.

#### ðŸª¤ Báº«y 9: Website ECS Sau ALB Táº£i Cháº­m Giá» Cao Äiá»ƒm: PhÃ¢n Biá»‡t Hai Táº§ng Co GiÃ£n (Service Auto Scaling vs Cluster Capacity Providers) â€” (TD-Set6 Q59, U-PT3 Q26)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t trang web thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ triá»ƒn khai trÃªn Amazon ECS container instances cháº¡y phÃ­a sau Application Load Balancer (ALB). Trong cÃ¡c khung giá» cao Ä‘iá»ƒm, trang web bá»‹ táº£i cháº­m nghiÃªm trá»ng do sá»‘ lÆ°á»£ng container hiá»‡n táº¡i khÃ´ng Ä‘á»§ Ä‘Ã¡p á»©ng. Khi ECS cá»‘ gáº¯ng cháº¡y thÃªm tasks thÃ¬ láº¡i gáº·p lá»—i khÃ´ng Ä‘á»§ CPU/RAM trÃªn cá»¥m EC2. Cáº§n giáº£i phÃ¡p toÃ n diá»‡n nÃ o?"*
- **Hai táº§ng co giÃ£n sá»‘ng cÃ²n cho Amazon ECS trÃªn EC2**:
  1. **Táº§ng 1 â€” ECS Service Auto Scaling (Co giÃ£n sá»‘ lÆ°á»£ng Task replicas)** (`TD-Set6 Q59`):
     - Co giÃ£n sá»‘ lÆ°á»£ng Task mong muá»‘n (`Desired Count`) dá»±a trÃªn cÃ¡c chá»‰ sá»‘ nhÆ° `ALBRequestCountPerTarget` hoáº·c `ECSServiceAverageCPUUtilization`.
     - Äáº£m báº£o cÃ³ Ä‘á»§ sá»‘ lÆ°á»£ng container xá»­ lÃ½ lÆ°u lÆ°á»£ng ngÆ°á»i dÃ¹ng Ä‘á»• vá» ALB.
  2. **Táº§ng 2 â€” ECS Cluster Auto Scaling qua Capacity Providers (Co giÃ£n sá»‘ lÆ°á»£ng mÃ¡y chá»§ EC2)** (`U-PT3 Q26`):
     - Khi ECS Service cáº§n thÃªm task nhÆ°ng cÃ¡c mÃ¡y áº£o EC2 hiá»‡n táº¡i Ä‘Ã£ cáº¡n kiá»‡t CPU hoáº·c RAM, **Capacity Provider** theo dÃµi chá»‰ sá»‘ `CapacityProviderReservation` vÃ  tá»± Ä‘á»™ng Ä‘iá»u phá»‘i Auto Scaling Group khá»Ÿi cháº¡y thÃªm mÃ¡y chá»§ EC2 má»›i vÃ o cá»¥m.
     - Sau khi mÃ¡y EC2 má»›i sáºµn sÃ ng, ECS tá»± Ä‘á»™ng Ä‘áº·t task lÃªn host má»›i mÃ  khÃ´ng cáº§n ká»¹ sÆ° can thiá»‡p thá»§ cÃ´ng!

#### ðŸª¤ Báº«y 10: TÃ¡ch Rá»i Hai TÃ¡c Vá»¥ Container Báº±ng HÃ ng Äá»£i SQS: Upload Task & Processing Task â€” (TD-Set2 Q01)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"á»¨ng dá»¥ng xá»­ lÃ½ hÃ¬nh áº£nh dáº¡ng batch Ä‘Æ°á»£c thiáº¿t káº¿ cháº¡y trÃªn Amazon ECS vá»›i 2 tÃ¡c vá»¥: TÃ¡c vá»¥ 1 nháº­n áº£nh táº£i lÃªn tá»« ngÆ°á»i dÃ¹ng vÃ  lÆ°u táº¡m; TÃ¡c vá»¥ 2 láº¥y áº£nh Ä‘á»ƒ giáº£i mÃ£ vÃ  Ã¡p dá»¥ng cÃ¡c hiá»‡u á»©ng Ä‘á»“ há»a phá»©c táº¡p. TÃ¡c vá»¥ 2 cháº¡y ráº¥t lÃ¢u. Cáº§n thiáº¿t káº¿ kiáº¿n trÃºc phÃ¢n rÃ£ káº¿t ná»‘i giá»¯a 2 tÃ¡c vá»¥ nÃ y Ä‘á»ƒ há»‡ thá»‘ng váº­n hÃ nh bá»n bá»‰."*
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Amazon SQS Queue** Ä‘áº·t lÃ m bá»™ Ä‘á»‡m trung gian giá»¯a hai ECS Tasks (`TD-Set2 Q01`).
  - TÃ¡c vá»¥ 1 sau khi lÆ°u áº£nh vÃ o S3 sáº½ gá»­i tin nháº¯n thÃ´ng bÃ¡o metadata vÃ o hÃ ng Ä‘á»£i SQS.
  - TÃ¡c vá»¥ 2 Ä‘á»™c láº­p poll tin nháº¯n tá»« SQS Ä‘á»ƒ xá»­ lÃ½ tuáº§n tá»±/song song theo nÄƒng lá»±c cá»§a mÃ¬nh, Ä‘áº£m báº£o lá»—i á»Ÿ TÃ¡c vá»¥ 2 khÃ´ng lÃ m giÃ¡n Ä‘oáº¡n viá»‡c táº£i áº£nh cá»§a TÃ¡c vá»¥ 1 (`TD-Set2 Q01`).

#### ðŸª¤ Báº«y 11: Lá»±a Chá»n Launch Type Tá»‘i Giáº£n Váº­n HÃ nh: Fargate vs EC2 â€” (TD-Set2 Q10, TD-Set4 Q03, TD-Set6 Q07)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p chuyá»ƒn Ä‘á»•i cÃ¡c container Docker lÃªn AWS vÃ  yÃªu cáº§u ná»— lá»±c quáº£n trá»‹ háº¡ táº§ng tháº¥p nháº¥t (LEAST operational overhead), khÃ´ng muá»‘n quáº£n lÃ½ mÃ¡y chá»§ mÃ¡y áº£o, khÃ´ng muá»‘n vÃ¡ lá»—i há»‡ Ä‘iá»u hÃ nh hay quáº£n lÃ½ cá»¥m EC2."*
- **Giáº£i phÃ¡p ÄÃšNG**: Chá»n kiá»ƒu khá»Ÿi cháº¡y **AWS Fargate (Serverless Launch Type)** (`TD-Set2 Q10`, `TD-Set4 Q03`, `TD-Set6 Q07`).
  - Fargate loáº¡i bá» 100% gÃ¡nh náº·ng quáº£n lÃ½ mÃ¡y áº£o, quáº£n lÃ½ ECS-optimized AMI hay vÃ¡ lá»—i kernel Linux.

#### ðŸª¤ Báº«y 12: AWS Batch Cho TÃ¡c Vá»¥ TÃ­nh ToÃ¡n MÃ´ Phá»ng HÃ ng NgÃ n Jobs â€” (TD-Set5 Q35, CM-PT1 Q38, U-PT6 Q11)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Má»™t viá»‡n nghiÃªn cá»©u khoa há»c cáº§n thá»±c hiá»‡n cÃ¡c bÃ i mÃ´ phá»ng phÃ¢n tÃ­ch gene phá»©c táº¡p Ä‘Ã²i há»i cáº¥u hÃ¬nh cá»±c lá»›n: má»—i tÃ¡c vá»¥ cáº§n tá»›i 32 vCPU vÃ  256 GiB RAM. HÃ ng ngÃ n tÃ¡c vá»¥ nhÆ° váº­y Ä‘Æ°á»£c ná»™p vÃ o cÃ¹ng lÃºc theo chu ká»³. Cáº§n kiáº¿n trÃºc nÃ o tá»± Ä‘á»™ng quáº£n lÃ½ viá»‡c láº­p lá»‹ch, phÃ¢n bá»• tÃ i nguyÃªn vÃ  tá»‘i Æ°u chi phÃ­?"*
- **Giáº£i phÃ¡p ÄÃšNG**: Triá»ƒn khai **AWS Batch** (`TD-Set5 Q35`).
  - AWS Batch tá»± Ä‘á»™ng phÃ¢n tÃ­ch Ä‘á»‹nh nghÄ©a cÃ´ng viá»‡c (**Job Definitions**), Ä‘Æ°a vÃ o hÃ ng Ä‘á»£i (**Job Queues**) vÃ  tá»± Ä‘á»™ng cáº¥p phÃ¡t mÃ´i trÆ°á»ng tÃ­nh toÃ¡n (**Compute Environments**) sá»­ dá»¥ng EC2 On-Demand hoáº·c **Spot Instances** Ä‘á»ƒ tiáº¿t kiá»‡m tá»›i 70â€“90% chi phÃ­.
  - Khi cáº§n Ä‘iá»u phá»‘i chuá»—i cÃ´ng viá»‡c Ä‘a bÆ°á»›c phá»©c táº¡p (giai Ä‘oáº¡n 1 cháº¡y xong má»›i kÃ­ch hoáº¡t giai Ä‘oáº¡n 2), káº¿t há»£p **AWS Step Functions + AWS Batch + SNS Notification** (`CM-PT1 Q38`, `U-PT6 Q11`).

#### ðŸª¤ Báº«y 13: Há»‡ Sinh ThÃ¡i Amazon EKS ChuyÃªn SÃ¢u: Co GiÃ£n, Ingress & Báº£o Máº­t â€” (TD-Set3 Q21, TD-Set4 Q03, TD-Set5 Q22, CM-PT5 Q28, TD-Set8 Q02, TD-Set1 Q13, TD-Set2 Q48, TD-Set5 Q36, CM-PT5 Q51, CM-PT5 Q54, TD-Set5 Q23)
- **Co giÃ£n 2 táº§ng trÃªn Kubernetes/EKS**:
  - **Táº§ng Pod**: CÃ i Ä‘áº·t **Kubernetes Metrics Server** vÃ  cáº¥u hÃ¬nh **Horizontal Pod Autoscaler (HPA)** Ä‘á»ƒ tá»± Ä‘á»™ng tÄƒng/giáº£m sá»‘ lÆ°á»£ng Pod báº£n sao theo CPU/RAM (`TD-Set3 Q21`, `TD-Set4 Q03`, `CM-PT5 Q28`).
  - **Táº§ng Worker Node**: Sá»­ dá»¥ng **Kubernetes Cluster Autoscaler** hoáº·c cÃ´ng cá»¥ mÃ£ nguá»“n má»Ÿ tháº¿ há»‡ má»›i **Karpenter** (`TD-Set5 Q22`) Ä‘á»ƒ tá»± Ä‘á»™ng khá»Ÿi cháº¡y thÃªm cÃ¡c EC2 worker node phÃ¹ há»£p khi cÃ¡c Pod rÆ¡i vÃ o tráº¡ng thÃ¡i `Pending`.
- **Äá»‹nh tuyáº¿n Ingress trÃªn EKS (`TD-Set8 Q02`)**: CÃ i Ä‘áº·t **AWS Load Balancer Controller** trÃªn EKS cluster. Controller sáº½ tá»± Ä‘á»™ng phÃ¡t hiá»‡n Ä‘á»‘i tÆ°á»£ng Kubernetes `Ingress` vÃ  khá»Ÿi táº¡o má»™t Application Load Balancer (ALB) quáº£n lÃ½ bÃªn ngoÃ i.
- **MÃ£ hÃ³a phong bÃ¬ Kubernetes Secrets (`TD-Set1 Q13`)**: Báº­t tÃ­nh nÄƒng **Envelope Encryption** cho EKS secrets lÆ°u trá»¯ trong `etcd` báº±ng **AWS KMS Customer Managed Key (CMK)** Ä‘á»ƒ tuÃ¢n thá»§ tiÃªu chuáº©n an ninh nghiÃªm ngáº·t.
- **Quáº£n lÃ½ quyá»n truy cáº­p cá»¥m EKS (`TD-Set2 Q48`, `TD-Set5 Q36`)**: Sá»­ dá»¥ng **EKS Cluster Access Management (CAM) API** vÃ  Access Entries (thay tháº¿ dáº§n `aws-auth` ConfigMap cÅ©) Ä‘á»ƒ phÃ¢n quyá»n cho ngÆ°á»i dÃ¹ng IAM; triá»ƒn khai EKS Node Groups táº¡i **AWS Wavelength Zones** cho cÃ¡c á»©ng dá»¥ng 5G siÃªu trá»… (`TD-Set5 Q36`).
- **LÆ°u trá»¯ chia sáº» Ä‘a Pod trÃªn EKS Fargate (`CM-PT5 Q51`)**: Khá»Ÿi táº¡o **Amazon EFS** vÃ  khai bÃ¡o Ä‘á»‘i tÆ°á»£ng **`StorageClass`** trá» tá»›i EFS CSI driver, cho phÃ©p cÃ¡c Pod trÃªn Fargate Ä‘á»c/ghi Ä‘á»“ng thá»i vÃ o chung má»™t há»‡ thá»‘ng tá»‡p tin máº¡ng.
- **GiÃ¡m sÃ¡t chuyÃªn sÃ¢u EKS & ECS Anywhere (`CM-PT5 Q54`, `TD-Set5 Q23`)**: KÃ­ch hoáº¡t **CloudWatch Container Insights káº¿t há»£p AWS X-Ray** Ä‘á»ƒ truy váº¿t phÃ¢n tÃ¡n (`CM-PT5 Q54`); káº¿t há»£p **ECS Anywhere + CloudWatch Application Insights** cho cÃ¡c container cháº¡y trÃªn pháº§n cá»©ng táº¡i chá»— On-Premises (`TD-Set5 Q23`).

#### ðŸª¤ Báº«y 14: QuÃ©t Lá»— Há»•ng Báº£o Máº­t Container TrÃªn Amazon ECR (Scan on Push) â€” (CM-PT4 Q17)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Doanh nghiá»‡p yÃªu cáº§u má»i Docker image trÆ°á»›c khi triá»ƒn khai lÃªn mÃ´i trÆ°á»ng sáº£n xuáº¥t (Production) pháº£i Ä‘Æ°á»£c tá»± Ä‘á»™ng kiá»ƒm tra lá»— há»•ng pháº§n má»m (CVE vulnerabilities). Cáº§n kÃ­ch hoáº¡t tÃ­nh nÄƒng nÃ o trÃªn ECR vá»›i chi phÃ­ tháº¥p nháº¥t?"*
- **Giáº£i phÃ¡p ÄÃšNG**: Báº­t tÃ¹y chá»n **Scan on Push** trÃªn Amazon ECR Repository (`CM-PT4 Q17`).
  - Má»—i khi láº­p trÃ¬nh viÃªn hoáº·c pipeline CI/CD Ä‘áº©y image má»›i lÃªn kho ECR, AWS tá»± Ä‘á»™ng kÃ­ch hoáº¡t bá»™ quÃ©t báº£o máº­t (Basic Scanning vá»›i Clair hoáº·c Enhanced Scanning vá»›i Amazon Inspector) vÃ  gá»­i cáº£nh bÃ¡o EventBridge náº¿u phÃ¡t hiá»‡n lá»— há»•ng nghiÃªm trá»ng.

#### ðŸª¤ Báº«y 15: So SÃ¡nh Chi PhÃ­ & Láº­p Lá»‹ch TÃ¡c Vá»¥ ECS: EC2 vs Fargate â€” (U-PT1 Q16, TD-Set5 Q19, CM-PT2 Q54, CM-PT4 Q13, CM-PT6 Q01)
- **So sÃ¡nh chi phÃ­ quy mÃ´ lá»›n (`U-PT1 Q16`, `TD-Set5 Q19`)**: Khi á»©ng dá»¥ng container cháº¡y liÃªn tá»¥c 24/7 vá»›i hÃ ng trÄƒm task vÃ  tÃ i nguyÃªn sá»­ dá»¥ng Ä‘á»u Ä‘áº·n, mÃ´ hÃ¬nh **ECS on EC2 káº¿t há»£p Reserved Instances / Compute Savings Plans vÃ  EC2 Spot** (`TD-Set5 Q19`) cÃ³ chi phÃ­ tháº¥p hÆ¡n Ä‘Ã¡ng ká»ƒ so vá»›i cháº¡y hoÃ n toÃ n trÃªn Fargate On-Demand (`U-PT1 Q16`). Fargate chá»‰ ráº» hÆ¡n cho cÃ¡c á»©ng dá»¥ng cháº¡y ngáº¯t quÃ£ng, táº£i biáº¿n thiÃªn hoáº·c startup muá»‘n tiáº¿t kiá»‡m cÃ´ng váº­n hÃ nh.
- **Láº­p lá»‹ch cháº¡y tÃ¡c vá»¥ Ä‘á»™c láº­p Ä‘á»‹nh ká»³ (`CM-PT2 Q54`, `CM-PT4 Q13`, `CM-PT6 Q01`)**: Sá»­ dá»¥ng **Amazon EventBridge Scheduled Rule (Cron pattern) trá» tá»›i target lÃ  ECS Task (`RunTask`)**. KhÃ´ng cáº§n cháº¡y má»™t ECS Service 24/7 chá»‰ Ä‘á»ƒ Ä‘á»£i giá» lÃ m viá»‡c!

#### ðŸª¤ Báº«y 16: HPC TrÃªn ECS EC2 DÃ¹ng Amazon EFS Cháº¿ Äá»™ Max I/O & Provisioned Throughput â€” (TD-Set6 Q46, U-PT3 Q33)
- **TÃ¬nh huá»‘ng Ä‘á» thi**: *"Cá»¥m tÃ­nh toÃ¡n hiá»‡u nÄƒng cao (HPC) gá»“m hÃ ng trÄƒm container cháº¡y trÃªn ECS EC2 cáº§n truy cáº­p Ä‘á»“ng thá»i vÃ o má»™t á»• Ä‘Ä©a máº¡ng chia sáº». Ká»¹ sÆ° nháº­n tháº¥y IOPS vÃ  thÃ´ng lÆ°á»£ng bá»‹ ngháº½n nghiÃªm trá»ng khi toÃ n bá»™ cÃ¡c container cÃ¹ng Ä‘á»c ghi dá»¯ liá»‡u mÃ´ phá»ng."*
- **Giáº£i phÃ¡p ÄÃšNG**: Sá»­ dá»¥ng **Amazon EFS** cáº¥u hÃ¬nh cháº¿ Ä‘á»™ hiá»‡u nÄƒng **`Max I/O`** (há»— trá»£ tá»•ng IOPS cao hÆ¡n nhiá»u láº§n so vá»›i `General Purpose`) káº¿t há»£p thÃ´ng lÆ°á»£ng **`Provisioned Throughput`** (`TD-Set6 Q46`, `U-PT3 Q33`). Cho phÃ©p bÄƒng thÃ´ng Ä‘Ä©a tÄƒng vá»t Ä‘á»™c láº­p vá»›i dung lÆ°á»£ng thá»±c táº¿ Ä‘ang lÆ°u trá»¯ trÃªn EFS.

---

### ðŸ“Š III. Ma Tráº­n Quyáº¿t Äá»‹nh Container Nhanh (Exam Decision Matrix)

| TÃ¬nh huá»‘ng / YÃªu cáº§u trong Ä‘á» thi | Giáº£i phÃ¡p chuáº©n AWS | Giáº£i phÃ¡p bá»‹ loáº¡i & LÃ½ do | Tham chiáº¿u Ä‘á» thi |
|:---|:---|:---|:---|
| **KÃ­ch hoáº¡t batch job Fargate theo file S3 Ã­t cÃ´ng nháº¥t** | **EventBridge Rule (S3 Put) $\rightarrow$ ECS RunTask** | DÃ¹ng S3 $\rightarrow$ SQS $\rightarrow$ Service Scaling (quÃ¡ nhiá»u cÃ´ng cáº¥u hÃ¬nh) | `TD-Set1 Q59` |
| **MÃ´ phá»ng HPC quy mÃ´ lá»›n cáº§n 32 vCPU / 256 GiB RAM** | **AWS Batch (Quáº£n lÃ½ queue, compute environment, Spot)** | Tá»± dá»±ng cá»¥m ECS/EC2 thá»§ cÃ´ng (phá»©c táº¡p phÃ¢n bá»• tÃ i nguyÃªn) | `TD-Set5 Q35`, `CM-PT1 Q38` |
| **Co giÃ£n Pod Kubernetes tá»± Ä‘á»™ng theo CPU/RAM** | **Kubernetes Metrics Server + Horizontal Pod Autoscaler (HPA)** | Co giÃ£n Node EC2 thá»§ cÃ´ng qua ASG (khÃ´ng co giÃ£n á»Ÿ táº§ng Pod) | `TD-Set3 Q21`, `TD-Set4 Q03` |
| **Tá»± Ä‘á»™ng cáº¥p phÃ¡t Worker Node EKS tháº¿ há»‡ má»›i nhanh nháº¥t** | **Karpenter** (hoáº·c Kubernetes Cluster Autoscaler) | Co giÃ£n ASG theo metric CPU mÃ¡y áº£o (cháº­m vÃ  khÃ´ng tá»‘i Æ°u instance) | `TD-Set5 Q22` |
| **Tá»± Ä‘á»™ng táº¡o ALB tá»« Kubernetes Ingress** | **AWS Load Balancer Controller** | Cáº¥u hÃ¬nh ALB bÃªn ngoÃ i thá»§ cÃ´ng rá»“i trá» vÃ o NodePort | `TD-Set8 Q02` |
| **MÃ£ hÃ³a Secrets trong etcd cá»§a EKS báº±ng KMS** | **EKS Envelope Encryption vá»›i AWS KMS CMK** | MÃ£ hÃ³a base64 thÃ´ng thÆ°á»ng cá»§a K8s (chá»‰ encode, khÃ´ng báº£o máº­t) | `TD-Set1 Q13` |
| **QuÃ©t lá»— há»•ng CVE tá»± Ä‘á»™ng khi Ä‘áº©y Docker image** | **Amazon ECR `Scan on Push`** | QuÃ©t thá»§ cÃ´ng á»Ÿ mÃ¡y tráº¡m láº­p trÃ¬nh viÃªn (dá»… bá»‹ bá» sÃ³t) | `CM-PT4 Q17` |
| **Cháº¡y tÃ¡c vá»¥ container Ä‘á»‹nh ká»³ theo lá»‹ch giá»** | **EventBridge Scheduled Rule $\rightarrow$ ECS RunTask** | Cháº¡y ECS Service liÃªn tá»¥c 24/7 (lÃ£ng phÃ­ 90% chi phÃ­ mÃ¡y) | `CM-PT2 Q54`, `CM-PT4 Q13` |
| **HPC hÃ ng trÄƒm container Ä‘á»c ghi EFS thÃ´ng lÆ°á»£ng cao** | **Amazon EFS `Max I/O` + `Provisioned Throughput`** | EFS General Purpose + Bursting (bá»‹ ngháº½n IOPS vÃ  bÄƒng thÃ´ng) | `TD-Set6 Q46`, `U-PT3 Q33` |
| **NÃ©n tasks vÃ o Ã­t host nháº¥t Ä‘á»ƒ tiáº¿t kiá»‡m chi phÃ­ EC2** | **Task Placement Strategy: `binpack` (CPU hoáº·c Memory)** | Strategy `spread` (ráº£i Ä‘á»u gÃ¢y lÃ£ng phÃ­ nhiá»u EC2 cháº¡y dá»Ÿ) | `CM-PT5 Q02` |
| **Ráº£i Ä‘á»u tasks qua cÃ¡c AZ Ä‘á»ƒ Ä‘áº¡t High Availability tá»‘i Ä‘a** | **Task Placement Strategy: `spread(availability-zone)`** | Strategy `binpack` (dá»“n háº¿t vÃ o 1 AZ rá»§i ro máº¥t Ä‘iá»‡n) | `CM-PT5 Q02` |
| **Má»—i mÃ¡y chá»§ EC2 chá»‰ Ä‘Æ°á»£c phÃ©p cháº¡y duy nháº¥t 1 task** | **Task Placement Constraint: `distinctInstance`** | Task Placement Strategy (khÃ´ng Ã©p buá»™c Ä‘Æ°á»£c tÃ­nh Ä‘á»™c nháº¥t) | `CM-PT5 Q02` |
| **TÃ¡ch rá»i tÃ¡c vá»¥ upload áº£nh vÃ  xá»­ lÃ½ áº£nh náº·ng trÃªn ECS** | **Äáº·t hÃ ng Ä‘á»£i Amazon SQS lÃ m bá»™ Ä‘á»‡m giá»¯a 2 ECS Tasks** | Káº¿t ná»‘i trá»±c tiáº¿p giá»¯a 2 tasks (dá»… gÃ¢y ngháº½n vÃ  máº¥t áº£nh) | `TD-Set2 Q01` |
| **Cháº¡y Container khÃ´ng quáº£n lÃ½ OS/mÃ¡y chá»§ vá»›i Ã­t cÃ´ng sá»©c nháº¥t** | **Amazon ECS on AWS Fargate (Serverless)** | ECS on EC2 (pháº£i tá»± vÃ¡ lá»—i há»‡ Ä‘iá»u hÃ nh vÃ  quáº£n lÃ½ cluster) | `TD-Set2 Q10`, `TD-Set4 Q03`, `TD-Set6 Q07` |
| **PhÃ¢n quyá»n cho code trong container gá»i DynamoDB/S3** | **ECS Task Role** | ECS Task Execution Role (chá»‰ dÃ nh cho ECS agent háº¡ táº§ng) | `CM-PT2 Q20` |
| **Container cáº§n chia sáº» file system Ä‘á»c/ghi Ä‘á»“ng thá»i xuyÃªn AZ** | **ECS on Fargate + Amazon EFS** | Amazon EBS (EBS khÃ´ng thá»ƒ mount Ä‘á»“ng thá»i qua nhiá»u AZ) | `CM-PT1 Q36` |
| **Workload Kubernetes hiá»‡n cÃ³, di chuyá»ƒn lÃªn AWS** | **Amazon EKS** (+ Fargate hoáº·c EC2 nodes) | Amazon ECS (pháº£i viáº¿t láº¡i toÃ n bá»™ Task Definition) | Chuáº©n AWS |
| **PhÃ¢n quyá»n Ä‘áº·c quyá»n tá»‘i thiá»ƒu cho tá»«ng Pod EKS truy cáº­p AWS** | **IAM Roles for Service Accounts (IRSA)** | Node IAM Role (vi pháº¡m least privilege vÃ¬ dÃ¹ng chung host) | `U-PT1 Q04` |
| **KÃ©o image ECR trong Private Subnet khÃ´ng cÃ³ Internet/NAT** | **VPC Endpoints cho ECR API, DKR + Gateway Endpoint S3** | Chá»‰ táº¡o ECR endpoints (thiáº¿u S3 endpoint chá»©a binary layer) | Chuáº©n AWS |
| **Triá»ƒn khai Web App Container vá»›i Ã­t cÃ´ng váº­n hÃ nh nháº¥t** | **AWS App Runner** | Tá»± dá»±ng cá»¥m ECS + ALB + VPC (quÃ¡ nhiá»u tham sá»‘ cáº¥u hÃ¬nh) | `CM-PT2 Q57`, `CM-PT4 Q05` |

---

## 3. Kiáº¿n TrÃºc Thá»±c Táº¿ vÃ  Luá»“ng Váº­n HÃ nh (Production Architecture & Workflow)

### Quy TrÃ¬nh Triá»ƒn Khai Blue/Green KhÃ´ng GiÃ¡n Äoáº¡n trÃªn ECS Fargate vá»›i AWS CodeDeploy

```mermaid
sequenceDiagram
    autonumber
    actor DevOps as Ká»¹ SÆ° DevOps / CI Pipeline
    participant ECR as Amazon ECR
    participant ECS as Amazon ECS Service
    participant CodeDeploy as AWS CodeDeploy
    participant ALB as Application Load Balancer
    participant TargetGroup as ALB Target Groups (Blue / Green)

    DevOps->>ECR: Push Docker Image má»›i (v2.0)
    DevOps->>CodeDeploy: KÃ­ch hoáº¡t triá»ƒn khai Blue/Green Deployment
    CodeDeploy->>ECS: Khá»Ÿi cháº¡y táº­p há»£p Tasks má»›i (Green Tasks)
    ECS->>ECR: KÃ©o image v2.0 sá»­ dá»¥ng Task Execution Role
    ECS->>TargetGroup: ÄÄƒng kÃ½ Green Tasks vÃ o Green Target Group
    Note over ALB,TargetGroup: Cháº¡y Test Health Check trÃªn Test Port (8443)
    ALB-->>CodeDeploy: Health check Passed (HTTP 200 OK)
    CodeDeploy->>ALB: Chuyá»ƒn hÆ°á»›ng 100% lÆ°u lÆ°á»£ng Production (Cá»•ng 443) sang Green Target Group
    Note over CodeDeploy: GiÃ¡m sÃ¡t CloudWatch Alarms trong 15 phÃºt (Baking Period)
    CodeDeploy->>ECS: TiÃªu há»§y an toÃ n cÃ¡c Blue Tasks (v1.0) cÅ©
    CodeDeploy-->>DevOps: Triá»ƒn khai thÃ nh cÃ´ng khÃ´ng downtime!
```

---

## 4. Báº£ng TÃ­ch Há»£p vá»›i CÃ¡c Dá»‹ch Vá»¥ AWS KhÃ¡c (Integration Table)

| Related AWS Service | Purpose (Má»¥c Ä‘Ã­ch tÃ­ch há»£p) | Integration Method (PhÆ°Æ¡ng thá»©c tÃ­ch há»£p) | Practical Example (VÃ­ dá»¥ thá»±c tiá»…n) |
| :--- | :--- | :--- | :--- |
| **Amazon EFS** | Cung cáº¥p á»• Ä‘Ä©a tá»‡p tin máº¡ng chia sáº» bá»n vá»¯ng cho Fargate | ECS Volume Mount Point | Gáº¯n thÆ° má»¥c uploads dÃ¹ng chung vÃ o 8 Fargate Tasks cá»§a trang WordPress Ä‘á»ƒ khÃ´ng bá»‹ máº¥t dá»¯ liá»‡u khi task khá»Ÿi Ä‘á»™ng láº¡i. |
| **Amazon EBS** | Cung cáº¥p á»• cá»©ng khá»‘i hiá»‡u nÄƒng cao gáº¯n trá»±c tiáº¿p vÃ o Fargate Task | ECS Task EBS Volume Integration | Gáº¯n á»• Ä‘Ä©a gp3 tá»‘c Ä‘á»™ cao vÃ o container xá»­ lÃ½ áº£nh lá»›n trÃªn Fargate vá»›i chi phÃ­ ráº» hÆ¡n EFS. |
| **AWS Systems Manager** | Truy cáº­p shell trá»±c tiáº¿p vÃ o container Ä‘ang cháº¡y (**ECS Exec**) | SSM Channel Integration | Ká»¹ sÆ° cháº¡y lá»‡nh `aws ecs execute-command --interactive --command "/bin/sh"` Ä‘á»ƒ debug lá»—i container Ä‘ang cháº¡y trÃªn Fargate. |
| **AWS Secrets Manager** | Náº¡p máº­t kháº©u cÆ¡ sá»Ÿ dá»¯ liá»‡u an toÃ n vÃ o container lÃºc khá»Ÿi Ä‘á»™ng | `secrets` block trong Task Definition | Náº¡p biáº¿n mÃ´i trÆ°á»ng `DB_PASS` trá»±c tiáº¿p tá»« Secrets Manager mÃ  khÃ´ng ghi lá»™ thÃ´ng tin vÃ o Dockerfile. |
| **Amazon CloudWatch** | Thu tháº­p log vÃ  giÃ¡m sÃ¡t tÃ i nguyÃªn container | `awslogs` driver & Container Insights | KÃ­ch hoáº¡t Container Insights Ä‘á»ƒ thu tháº­p metrics chi tiáº¿t CPU, Memory, Disk, Network I/O trÃªn tá»«ng task. |
| **AWS Application Auto Scaling** | Tá»± Ä‘á»™ng tÄƒng giáº£m sá»‘ lÆ°á»£ng container theo lÆ°u lÆ°á»£ng | Target Tracking Scaling Policy | Tá»± Ä‘á»™ng má»Ÿ rá»™ng sá»‘ lÆ°á»£ng Task khi chá»‰ sá»‘ trung bÃ¬nh `ALBRequestCountPerTarget` vÆ°á»£t quÃ¡ 1,000 req/phÃºt. |

---

## 5. Báº£ng So SÃ¡nh Trong Há»‡ Sinh ThÃ¡i AWS (Ecosystem Comparison)

### So sÃ¡nh cÃ¡c ná»n táº£ng cháº¡y Container trÃªn AWS

| TiÃªu chuáº©n so sÃ¡nh | Amazon ECS (EC2) | Amazon ECS (Fargate) | Amazon EKS (Kubernetes) | AWS App Runner | Amazon EC2 (Tá»± cÃ i Docker) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Báº£n cháº¥t cÃ´ng nghá»‡** | Äiá»u phá»‘i container Ä‘á»™c quyá»n cháº¡y trÃªn mÃ¡y áº£o do ngÆ°á»i dÃ¹ng quáº£n trá»‹. | Äá»™ng cÆ¡ cháº¡y container phi mÃ¡y chá»§ (Serverless), khÃ´ng quáº£n trá»‹ mÃ¡y áº£o. | Cá»¥m Ä‘iá»u phá»‘i Kubernetes chuáº©n mÃ£ nguá»“n má»Ÿ Ä‘Æ°á»£c AWS quáº£n lÃ½. | Dá»‹ch vá»¥ PaaS triá»ƒn khai container/web tá»± Ä‘á»™ng hoÃ n toÃ n. | MÃ¡y chá»§ áº£o truyá»n thá»‘ng, ngÆ°á»i dÃ¹ng tá»± cÃ i Docker engine. |
| **Äá»™ phá»©c táº¡p váº­n hÃ nh** | Trung bÃ¬nh: Pháº£i cáº¥u hÃ¬nh vÃ  báº£o trÃ¬ mÃ¡y áº£o EC2, vÃ¡ lá»—i há»‡ Ä‘iá»u hÃ nh. | **Ráº¥t tháº¥p**: KhÃ´ng nhÃ¬n tháº¥y OS, chá»‰ cáº¥u hÃ¬nh file Task Definition JSON. | **Cao**: ÄÃ²i há»i ká»¹ nÄƒng chuyÃªn sÃ¢u vá» há»‡ sinh thÃ¡i Kubernetes (Pods, Helm, Ingress). | **Cá»±c tháº¥p**: Chá»‰ cáº§n chá»‰ Ä‘Æ°á»ng dáº«n repo Git hoáº·c ECR image. | Ráº¥t cao: Tá»± quáº£n lÃ½ toÃ n bá»™ vÃ²ng Ä‘á»i container, networking, scaling. |
| **Chi phÃ­ Control Plane** | **\$0.00 (Miá»…n phÃ­)** | **\$0.00 (Miá»…n phÃ­)** | **\$0.10 / giá» / cluster** (~\$72/thÃ¡ng/cá»¥m). | **\$0.00 (Miá»…n phÃ­)** | **\$0.00 (KhÃ´ng cÃ³)** |
| **Kháº£ nÄƒng co giÃ£n (Scaling)** | Co giÃ£n 2 táº§ng (Task + Node ASG) máº¥t vÃ i phÃºt. | Co giÃ£n 1 táº§ng (Task-level) hoÃ n táº¥t trong 30-60 giÃ¢y. | Co giÃ£n linh hoáº¡t qua HPA káº¿t há»£p cÃ´ng cá»¥ Karpenter. | Co giÃ£n tá»± Ä‘á»™ng tá»©c thÃ¬ theo sá»‘ lÆ°á»£ng HTTP concurrent requests. | Tá»± viáº¿t script hoáº·c dÃ¹ng ASG dá»±a trÃªn CPU cá»§a mÃ¡y áº£o. |
| **Há»— trá»£ Multi-Cloud** | Chá»‰ cháº¡y trÃªn AWS (vÃ  ECS Anywhere on-prem). | Chá»‰ cháº¡y trÃªn ná»n táº£ng AWS. | **Tuyá»‡t Ä‘á»‘i**: Dá»… dÃ ng di chuyá»ƒn sang GCP (GKE) hoáº·c Azure (AKS). | Chá»‰ cháº¡y trÃªn ná»n táº£ng AWS. | TÃ¹y biáº¿n tá»± do trÃªn báº¥t ká»³ háº¡ táº§ng nÃ o. |
| **Khuyáº¿n nghá»‹ kiáº¿n trÃºc** | Doanh nghiá»‡p muá»‘n tá»‘i Æ°u chi phÃ­ tá»‘i Ä‘a cho khá»‘i lÆ°á»£ng container khá»•ng lá»“ cháº¡y 24/7. | Lá»±a chá»n máº·c Ä‘á»‹nh tá»‘t nháº¥t cho Microservices trÃªn AWS, loáº¡i bá» gÃ¡nh náº·ng váº­n hÃ nh OS. | Doanh nghiá»‡p lá»›n chuáº©n hÃ³a toÃ n diá»‡n trÃªn chuáº©n Kubernetes toÃ n cáº§u. | á»¨ng dá»¥ng web frontend/backend Ä‘Æ¡n giáº£n, startup muá»‘n ra máº¯t nhanh. | Chá»‰ dÃ¹ng cho cÃ¡c á»©ng dá»¥ng legacy hoáº·c mÃ´i trÆ°á»ng thá»­ nghiá»‡m cÃ¡ nhÃ¢n. |

---

## 6. MÃ´ HÃ¬nh TÃ­nh PhÃ­ & Chiáº¿n LÆ°á»£c Tá»‘i Æ¯u Chi PhÃ­ (FinOps & Cost Optimization)

### 6.1. Báº£ng Cáº¥u TrÃºc Äá»‹nh GiÃ¡ Chi Tiáº¿t

| ThÃ nh pháº§n Dá»‹ch Vá»¥ | ÄÆ¡n giÃ¡ AWS niÃªm yáº¿t (us-east-1) | CÆ¡ cháº¿ Ä‘o lÆ°á»ng | Ghi chÃº tá»‘i Æ°u hÃ³a chi phÃ­ FinOps |
| :--- | :--- | :--- | :--- |
| **Amazon ECS Control Plane** | **\$0.00** | Miá»…n phÃ­ khÃ´ng giá»›i háº¡n cá»¥m | Táº¡o bao nhiÃªu cá»¥m (Cluster) phÃ¢n tÃ¡ch mÃ´i trÆ°á»ng cÅ©ng khÃ´ng tá»‘n chi phÃ­. |
| **Amazon EKS Control Plane** | **\$0.10 / giá»** (~\$72/thÃ¡ng/cá»¥m) | TÃ­nh trÃªn má»—i cá»¥m Kubernetes | Há»£p nháº¥t nhiá»u microservices vÃ o 1 cá»¥m dÃ¹ng chung báº±ng Kubernetes Namespaces. |
| **AWS Fargate (vCPU x86)** | **\$0.04048 / vCPU / giá»** | TÃ­nh theo tá»«ng giÃ¢y (tá»‘i thiá»ƒu 1 phÃºt) | Cáº¥u hÃ¬nh vCPU sÃ¡t vá»›i nhu cáº§u thá»±c táº¿ qua CloudWatch Container Insights. |
| **AWS Fargate (RAM x86)** | **\$0.004445 / GB / giá»** | TÃ­nh theo tá»«ng giÃ¢y cáº¥p phÃ¡t | TrÃ¡nh cáº¥p phÃ¡t thá»«a RAM khÃ´ng dÃ¹ng Ä‘áº¿n trong Task Definition. |
| **AWS Fargate (Arm64 Graviton)** | **Ráº» hÆ¡n 20%** so vá»›i x86 | \$0.03238/vCPU/h & \$0.003556/GB/h | Chuyá»ƒn Ä‘á»•i kiáº¿n trÃºc container sang Arm64 Ä‘á»ƒ tiáº¿t kiá»‡m ngay 20%. |
| **AWS Fargate Spot** | **Giáº£m tá»›i 70%** so vá»›i On-Demand | ~\$0.01214/vCPU/h & ~\$0.00133/GB/h | Sá»­ dá»¥ng cho background workers, xá»­ lÃ½ hÃ ng Ä‘á»£i SQS, batch jobs khÃ´ng sá»£ bá»‹ ngáº¯t. |
| **Amazon ECR Storage** | **\$0.10 / GB / thÃ¡ng** | TÃ­nh theo dung lÆ°á»£ng áº£nh lÆ°u trá»¯ | Báº¯t buá»™c thiáº¿t láº­p ECR Lifecycle Policy Ä‘á»ƒ xÃ³a cÃ¡c image untagged vÃ  image cÅ©. |

---

### 6.2. 5 Ká»‹ch Báº£n Tá»‘i Æ¯u HÃ³a Chi PhÃ­ Thá»±c Táº¿ (FinOps Scenarios)

#### Ká»‹ch báº£n 1: Tá»‘i Æ°u chi phÃ­ Worker xá»­ lÃ½ hÃ ng Ä‘á»£i báº±ng Fargate Spot
- **Bá»‘i cáº£nh**: Há»‡ thá»‘ng xá»­ lÃ½ video gá»“m 12 worker container tiÃªu thá»¥ tin nháº¯n tá»« Amazon SQS Queue. Má»—i task Ä‘Æ°á»£c cáº¥p phÃ¡t 2 vCPU vÃ  4 GB RAM cháº¡y liÃªn tá»¥c 24/7 (730 giá»/thÃ¡ng).
- **TÃ­nh toÃ¡n chi phÃ­ Fargate On-Demand chuáº©n**:
  $$\text{Cost}_{\text{vCPU}} = 12 \times 2 \times \$0.04048 \times 730 = \$709.21$$
  $$\text{Cost}_{\text{RAM}} = 12 \times 4 \times \$0.004445 \times 730 = \$155.75$$
  $$\text{Total Cost}_{\text{OnDemand}} = \$709.21 + \$155.75 = \$864.96/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - VÃ¬ cÃ¡c worker lÃ  phi tráº¡ng thÃ¡i (Stateless), náº¿u task bá»‹ thu há»“i thÃ¬ SQS sáº½ tá»± Ä‘á»™ng tráº£ láº¡i tin nháº¯n Ä‘á»ƒ worker khÃ¡c xá»­ lÃ½.
  - Cáº¥u hÃ¬nh ECS Service dÃ¹ng **Fargate Spot Capacity Provider** (giáº£m 70% chi phÃ­):
  $$\text{Total Cost}_{\text{Spot}} = \$864.96 \times (1 - 0.70) = \$259.49/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$864.96 - \$259.49 = \$605.47/\text{thÃ¡ng} \quad (\$7{,}265/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m } 70\% \text{ ngÃ¢n sÃ¡ch}$$

#### Ká»‹ch báº£n 2: Chuyá»ƒn Ä‘á»•i kiáº¿n trÃºc Fargate Task sang chip ARM64 (AWS Graviton)
- **Bá»‘i cáº£nh**: Doanh nghiá»‡p cháº¡y 25 microservices viáº¿t báº±ng Node.js vÃ  Java Spring Boot trÃªn Fargate x86, tiÃªu tá»‘n \$1,200/thÃ¡ng tiá»n háº¡ táº§ng tÃ­nh toÃ¡n.
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Cáº­p nháº­t pipeline CI/CD biÃªn dá»‹ch Docker image há»— trá»£ Ä‘a ná»n táº£ng (`docker buildx --platform linux/arm64`).
  - Trong ECS Task Definition, cáº¥u hÃ¬nh cá»:
    ```json
    "runtimePlatform": {
      "cpuArchitecture": "ARM64",
      "operatingSystemFamily": "LINUX"
    }
    ```
  - ÄÆ¡n giÃ¡ tÃ i nguyÃªn cá»§a kiáº¿n trÃºc Graviton Arm64 tá»± Ä‘á»™ng ráº» hÆ¡n 20% so vá»›i x86:
  $$\text{Cost}_{\text{Arm64}} = \$1{,}200 \times (1 - 0.20) = \$960/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$1{,}200 - \$960 = \$240/\text{thÃ¡ng} \quad (\$2{,}880/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m ngay } 20\% \text{ chi phÃ­}$$

#### Ká»‹ch báº£n 3: Tá»± Ä‘á»™ng hÃ³a dá»n dáº¹p kho áº£nh vá»›i ECR Lifecycle Policies
- **Bá»‘i cáº£nh**: Há»‡ thá»‘ng CI/CD tá»± Ä‘á»™ng build vÃ  push Docker image sau má»—i commit (trung bÃ¬nh 15 báº£n build/ngÃ y). Má»—i image cÃ³ dung lÆ°á»£ng 1.2 GB. Sau 1 nÄƒm, kho lÆ°u trá»¯ tÃ­ch tá»¥ hÆ¡n 5,000 images vá»›i tá»•ng dung lÆ°á»£ng lÃªn tá»›i 6,000 GB (6 TB).
- **TÃ­nh toÃ¡n chi phÃ­ khi khÃ´ng cÃ³ chÃ­nh sÃ¡ch dá»n dáº¹p**:
  $$\text{Cost}_{\text{ECR\_Initial}} = 6{,}000 \text{ GB} \times \$0.10/\text{GB} = \$600/\text{thÃ¡ng} \quad (\$7{,}200/\text{nÄƒm})$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Thiáº¿t láº­p **ECR Lifecycle Policy** trÃªn toÃ n bá»™ cÃ¡c repositories:
    1. XÃ³a cÃ¡c báº£n build khÃ´ng cÃ³ tag (`untagged`) sau **2 ngÃ y**.
    2. Chá»‰ giá»¯ láº¡i tá»‘i Ä‘a **10 image cÃ³ tag gáº§n nháº¥t** cho má»—i service (`sinceImagePushed = 10`).
  - Dung lÆ°á»£ng lÆ°u trá»¯ thá»±c táº¿ giáº£m xuá»‘ng chá»‰ cÃ²n khoáº£ng 150 GB:
  $$\text{Cost}_{\text{ECR\_Optimized}} = 150 \text{ GB} \times \$0.10 = \$15/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$600 - \$15 = \$585/\text{thÃ¡ng} \quad (\$7{,}020/\text{nÄƒm}) \implies \text{Cáº¯t giáº£m } 97.5\% \text{ chi phÃ­ lÆ°u trá»¯ ECR}$$

#### Ká»‹ch báº£n 4: Há»£p nháº¥t cá»¥m Amazon EKS Control Plane (Multi-tenant EKS Cluster)
- **Bá»‘i cáº£nh**: CÃ´ng ty cÃ³ 6 nhÃ³m phÃ¡t triá»ƒn pháº§n má»m Ä‘á»™c láº­p. Má»—i nhÃ³m tá»± táº¡o 1 cá»¥m Amazon EKS riÃªng biá»‡t Ä‘á»ƒ cháº¡y á»©ng dá»¥ng dev/test.
- **TÃ­nh toÃ¡n chi phÃ­ Control Plane riÃªng láº»**:
  $$\text{Cost}_{\text{EKS\_Separate}} = 6 \text{ cá»¥m} \times \$0.10/\text{giá»} \times 730 \text{ giá»} = \$438/\text{thÃ¡ng} \quad (\text{chÆ°a ká»ƒ worker nodes})$$
- **Giáº£i phÃ¡p tá»‘i Æ°u**:
  - Há»£p nháº¥t 6 nhÃ³m vÃ o **1 cá»¥m EKS Multi-tenant dÃ¹ng chung**:
    - PhÃ¢n tÃ¡ch mÃ´i trÆ°á»ng báº±ng **Kubernetes Namespaces**.
    - Cáº¥u hÃ¬nh **ResourceQuotas** giá»›i háº¡n vCPU/RAM tá»‘i Ä‘a cho tá»«ng nhÃ³m.
    - Cáº¥p quyá»n AWS chi tiáº¿t cho tá»«ng pod báº±ng **EKS Pod Identity**.
  $$\text{Cost}_{\text{EKS\_Unified}} = 1 \text{ cá»¥m} \times \$0.10 \times 730 = \$73/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$438 - \$73 = \$365/\text{thÃ¡ng} \quad (\$4{,}380/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m } 83.3\% \text{ chi phÃ­ Control Plane}$$

#### Ká»‹ch báº£n 5: PhÃ¢n Ä‘á»‹nh Ä‘iá»ƒm hÃ²a vá»‘n giá»¯a ECS EC2 Launch Type vÃ  AWS Fargate
- **Bá»‘i cáº£nh**: Há»‡ thá»‘ng thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ váº­n hÃ nh 100 container microservices á»•n Ä‘á»‹nh 24/7, má»—i container cáº§n 1 vCPU vÃ  2 GB RAM.
- **TÃ­nh toÃ¡n chi phÃ­ trÃªn Fargate On-Demand**:
  $$\text{Cost}_{\text{Fargate}} = 100 \times [(\$0.04048 \times 1) + (\$0.004445 \times 2)] \times 730 = \$3{,}604/\text{thÃ¡ng}$$
- **Giáº£i phÃ¡p tá»‘i Æ°u báº±ng EC2 Launch Type vá»›i Compute Savings Plans 3 nÄƒm**:
  - Thay vÃ¬ dÃ¹ng Fargate, triá»ƒn khai cá»¥m EC2 gá»“m 7 mÃ¡y chá»§ `c6g.4xlarge` (má»—i mÃ¡y 16 vCPU, 32 GB RAM, Ä‘á»§ sá»©c chá»©a toÃ n bá»™ 100 containers vá»›i máº­t Ä‘á»™ nÃ©n cao).
  - Mua gÃ³i cam káº¿t **Compute Savings Plans 3 nÄƒm tráº£ trÆ°á»›c má»™t pháº§n** (giáº£m 64% so vá»›i giÃ¡ On-Demand cá»§a EC2):
  $$\text{Cost}_{\text{EC2\_SavingsPlan}} \approx \$1{,}450/\text{thÃ¡ng}$$
- **Hiá»‡u quáº£ kinh táº¿**:
  $$\text{Tiáº¿t kiá»‡m} = \$3{,}604 - \$1{,}450 = \$2{,}154/\text{thÃ¡ng} \quad (\$25{,}848/\text{nÄƒm}) \implies \text{Tiáº¿t kiá»‡m } 59.8\% \text{ chi phÃ­ cho táº£i lá»›n á»•n Ä‘á»‹nh}$$

---

## 7. Kháº¯c Phá»¥c Sá»± Cá»‘ Thá»±c Táº¿ (Troubleshooting Guide)

| TÃ¬nh huá»‘ng sá»± cá»‘ (Problem) | NguyÃªn nhÃ¢n cá»‘t lÃµi (Root Cause) | CÃ¡c bÆ°á»›c Ä‘iá»u tra & Chá»‰ sá»‘ giÃ¡m sÃ¡t (Metrics & Logs) | Giáº£i phÃ¡p kháº¯c phá»¥c (Remediation) | Biá»‡n phÃ¡p phÃ²ng ngá»«a (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Task Fargate bá»‹ dá»«ng ngay sau khi khá»Ÿi cháº¡y (`Exit Code 1` hoáº·c `137`)** | `Exit code 1`: á»¨ng dá»¥ng bá»‹ crash do thiáº¿u biáº¿n mÃ´i trÆ°á»ng.<br>`Exit code 137`: Container bá»‹ há»‡ thá»‘ng tiÃªu há»§y do trÃ n bá»™ nhá»› (**Out-Of-Memory OOM**). | - Xem tab **Stopped Tasks** trÃªn ECS Console kiá»ƒm tra `Stopped reason`.<br>- GiÃ¡m sÃ¡t CloudWatch metric `MemoryUtilization`. | 1. Sá»­a lá»—i mÃ£ nguá»“n hoáº·c bá»• sung biáº¿n mÃ´i trÆ°á»ng.<br>2. TÄƒng thÃ´ng sá»‘ `memory` trong Task Definition náº¿u bá»‹ OOM. | LuÃ´n thá»­ nghiá»‡m cháº¡y container cá»¥c bá»™ báº±ng `docker run -m 512m` Ä‘á»ƒ kiá»ƒm tra giá»›i háº¡n RAM trÆ°á»›c khi deploy. |
| **Lá»—i `CannotPullContainerError` khi khá»Ÿi Ä‘á»™ng Task** | 1. URI cá»§a ECR Image bá»‹ sai chÃ­nh táº£.<br>2. **Task Execution Role** thiáº¿u quyá»n `ecr:GetDownloadUrlForLayer`.<br>3. Task á»Ÿ Private Subnet khÃ´ng cÃ³ route ra Internet hoáº·c thiáº¿u VPC Endpoints cho ECR. | - Kiá»ƒm tra thÃ´ng bÃ¡o lá»—i chi tiáº¿t trÃªn ECS Events tab.<br>- Kiá»ƒm tra Route Table vÃ  Security Group cá»§a Subnet gáº¯n task. | 1. Cáº¥p quyá»n `AmazonECSTaskExecutionRolePolicy` cho Execution Role.<br>2. Bá»• sung **VPC Endpoints cho ECR** (`ecr.api`, `ecr.dkr`, vÃ  S3 Gateway Endpoint) náº¿u cháº¡y trong máº¡ng kÃ­n. | Äáº£m báº£o máº¡ng Private Subnet luÃ´n cÃ³ NAT Gateway hoáº·c Ä‘á»§ bá»™ 3 VPC Endpoints cho ECR. |
| **ALB Health Check liÃªn tá»¥c bÃ¡o Unhealthy cho ECS Service** | 1. á»¨ng dá»¥ng náº·ng (nhÆ° Spring Boot) máº¥t 60s Ä‘á»ƒ khá»Ÿi Ä‘á»™ng nhÆ°ng ALB kiá»ƒm tra sau 10s.<br>2. Security Group cá»§a Task cháº·n traffic tá»« ALB.<br>3. ÄÆ°á»ng dáº«n health check tráº£ vá» mÃ£ khÃ¡c 200. | - Xem tab **Targets** trong Target Group kiá»ƒm tra tráº¡ng thÃ¡i Unhealthy.<br>- Kiá»ƒm tra Inbound Rules cá»§a Security Group gáº¯n vá»›i Task. | 1. TÄƒng giÃ¡ trá»‹ **`HealthCheckGracePeriodSeconds`** (vÃ­ dá»¥: 120s) trÃªn ECS Service.<br>2. Cho phÃ©p Security Group cá»§a Task nháº­n traffic tá»« Security Group cá»§a ALB. | Cáº¥u hÃ¬nh endpoint `/health` chuyÃªn dá»¥ng tráº£ vá» HTTP 200 nhanh chÃ³ng mÃ  khÃ´ng cáº§n kiá»ƒm tra DB phá»©c táº¡p. |
| **Lá»—i `No Container Instances Found` trÃªn cá»¥m EC2 Launch Type** | ToÃ n bá»™ cÃ¡c mÃ¡y chá»§ EC2 hiá»‡n cÃ³ trong cá»¥m Ä‘Ã£ háº¿t sáº¡ch vCPU hoáº·c RAM trá»‘ng Ä‘á»ƒ Ä‘áº·t thÃªm Task má»›i. | - Xem tá»•ng lÆ°á»£ng tÃ i nguyÃªn kháº£ dá»¥ng cá»§a cá»¥m ECS Cluster.<br>- GiÃ¡m sÃ¡t CloudWatch metric `CPUReservation` vÃ  `MemoryReservation`. | Bá»• sung thÃªm mÃ¡y chá»§ EC2 vÃ o cá»¥m báº±ng Auto Scaling Group hoáº·c chuyá»ƒn sang sá»­ dá»¥ng **AWS Fargate** Ä‘á»ƒ co giÃ£n vÃ´ háº¡n. | Sá»­ dá»¥ng **ECS Capacity Providers** káº¿t há»£p tÃ­nh nÄƒng Target Capacity Reservation Ä‘á»ƒ tá»± Ä‘á»™ng co giÃ£n mÃ¡y chá»§ EC2 theo nhu cáº§u cá»§a Tasks. |
| **Microservices khÃ´ng tÃ¬m tháº¥y nhau khi gá»i ná»™i bá»™** | Cáº¥u hÃ¬nh sai DNS hoáº·c cÃ¡c container khÃ´ng náº±m chung má»™t máº¡ng Service Connect. | - Kiá»ƒm tra cáº¥u hÃ¬nh **ECS Service Connect** trong Service Definition.<br>- Kiá»ƒm tra CloudWatch metric `ServiceConnectHTTPCode2XX`. | Äáº£m báº£o cÃ¡c microservices tham gia vÃ o cÃ¹ng má»™t Service Connect Namespace vÃ  sá»­ dá»¥ng Ä‘Ãºng tÃªn miá»n Ä‘á»‹nh tuyáº¿n. | Chuáº©n hÃ³a quy trÃ¬nh Ä‘áº·t tÃªn dá»‹ch vá»¥ qua Terraform IaC. |


---


## 8. TÃ³m Táº¯t vÃ  Danh Má»¥c Kiá»ƒm Tra Kiáº¿n Thá»©c (Summary & Learning Checklist)

### 7 NguyÃªn Táº¯c VÃ ng Quáº£n Trá»‹ Container AWS (Golden Rules)
1. **Fargate cho Microservices**: Æ¯u tiÃªn chá»n Fargate Ä‘á»ƒ triá»‡t tiÃªu hoÃ n toÃ n cÃ´ng viá»‡c quáº£n trá»‹ mÃ¡y chá»§ vÃ  vÃ¡ lá»—i há»‡ Ä‘iá»u hÃ nh.
2. **PhÃ¢n biá»‡t ráº¡ch rÃ²i 2 Roles**: LuÃ´n tÃ¡ch biá»‡t **Task Execution Role** (háº¡ táº§ng kÃ©o áº£nh/ghi log) vÃ  **Task Role** (nghiá»‡p vá»¥ á»©ng dá»¥ng gá»i AWS API).
3. **Tiáº¿t kiá»‡m 70% vá»›i Fargate Spot**: Táº­n dá»¥ng Fargate Spot cho cÃ¡c tÃ¡c vá»¥ xá»­ lÃ½ hÃ ng Ä‘á»£i báº¥t Ä‘á»“ng bá»™ hoáº·c mÃ´i trÆ°á»ng Dev/Test.
4. **Æ¯u tiÃªn Arm64 Graviton**: Cáº¥u hÃ¬nh `cpuArchitecture: ARM64` Ä‘á»ƒ tiáº¿t kiá»‡m ngay 20% chi phÃ­ tÃ­nh toÃ¡n cho cÃ¡c container Java, Node.js, Python, Go.
5. **CÃ i Ä‘áº·t ECR Lifecycle Policy**: LuÃ´n thiáº¿t láº­p luáº­t dá»n dáº¹p áº£nh cÅ© Ä‘á»ƒ trÃ¡nh hÃ³a Ä‘Æ¡n lÆ°u trá»¯ ECR tÄƒng vá»t hÃ ng ngÃ n USD sau cÃ¡c Ä‘á»£t build CI/CD.
6. **Thay tháº¿ Internal ALB báº±ng ECS Service Connect**: Giáº£m Ä‘á»™ trá»… máº¡ng vÃ  cáº¯t giáº£m chi phÃ­ duy trÃ¬ Load Balancer cho giao tiáº¿p microservices ná»™i bá»™.
7. **Cáº¥u hÃ¬nh Grace Period há»£p lÃ½**: LuÃ´n thiáº¿t láº­p `HealthCheckGracePeriodSeconds` Ä‘á»ƒ báº£o vá»‡ cÃ¡c á»©ng dá»¥ng náº·ng khÃ´ng bá»‹ tiÃªu há»§y sá»›m khi khá»Ÿi Ä‘á»™ng.

---

### Danh Má»¥c Kiá»ƒm Tra NÄƒng Lá»±c (Learning Checklist)
- [ ] TÃ´i phÃ¢n biá»‡t Ä‘Æ°á»£c sá»± khÃ¡c biá»‡t giá»¯a ECS EC2 Launch Type vÃ  AWS Fargate Serverless.
- [ ] TÃ´i giáº£i thÃ­ch Ä‘Æ°á»£c vai trÃ² cá»§a ECS Task Definition, ECS Task vÃ  ECS Service.
- [ ] TÃ´i phÃ¢n biá»‡t rÃµ rÃ ng giá»¯a ECS Task Execution Role vÃ  ECS Task Role.
- [ ] TÃ´i hiá»ƒu nguyÃªn lÃ½ hoáº¡t Ä‘á»™ng cá»§a Dynamic Port Mapping vá»›i Application Load Balancer.
- [ ] TÃ´i biáº¿t cÃ¡ch cáº¥u hÃ¬nh ECS Service Connect Ä‘á»ƒ káº¿t ná»‘i cÃ¡c microservices ná»™i bá»™ khÃ´ng cáº§n ALB.
- [ ] TÃ´i náº¯m vá»¯ng cÃ¡c VPC Endpoints cáº§n thiáº¿t Ä‘á»ƒ Fargate trong Private Subnet kÃ©o áº£nh tá»« Amazon ECR.
- [ ] TÃ´i hiá»ƒu cÃ¡ch sá»­ dá»¥ng ECS Exec Ä‘á»ƒ má»Ÿ shell trá»±c tiáº¿p vÃ o container Ä‘ang cháº¡y phá»¥c vá»¥ troubleshooting.

---

### LiÃªn káº¿t vÃ  TÃ i liá»‡u LiÃªn quan
- ðŸ“– [Ghi ChÃº BÃ i Há»c ChÆ°Æ¡ng 18: Containers on AWS](../Lesson_Notes/18_Containers_ECS_Fargate_EKS.md)
- ðŸ“– [Báº£ng Thuáº­t Ngá»¯ Ká»¹ Thuáº­t (GLOSSARY.md)](../GLOSSARY.md)
- â­ï¸ Tiáº¿p tá»¥c chuyá»ƒn sang chuyÃªn Ä‘á»: [Kiáº¿n TrÃºc PhÃ¢n TÃ¡ch: Amazon SQS, SNS & EventBridge](./SQS_SNS_EventBridge_Decoupling.md).
