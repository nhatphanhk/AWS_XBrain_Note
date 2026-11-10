# 🗺️ Master Knowledge Map: Bản Đồ Tri Thức Đồng Bộ Đề Thi & Tài Liệu AWS Services

> **Tài liệu chuẩn hóa kiến trúc & luyện thi cấp cao**: Bảng tổng hợp liên kết toàn diện giữa **1,129+ câu hỏi đề thi thực hành** (*Cloud_Mentor PT1–PT6*, *Tutorials Dojo Set 1–6 & Set 8*, *Udemy PT1–PT4 & PT6*) và hệ thống **23 tài liệu chuyên sâu** trong thư mục `AWS_Services`.  
> **Ngôn ngữ**: Tiếng Việt chuyên ngành (bảo lưu thuật ngữ kiến trúc AWS chuẩn quốc tế).  
> **Mục tiêu**: Tra cứu tức thì giải pháp kiến trúc, bẫy thi và tài liệu tương ứng cho mọi kịch bản xuất hiện trong kỳ thi **AWS Certified Solutions Architect (SAA-C03, SAP-C02)**.

---

## 📑 Mục Lục Điều Hướng Nhanh

1. [Phân Nhóm Theo Miền Kiến Trúc (Architecture Domains)](#1-phân-nhóm-theo-miền-kiến-trúc-architecture-domains)
2. [Bảng Ma Trận Tra Cứu Kịch Bản Đề Thi Sang Tài Liệu (Scenario-to-Doc Mapping)](#2-bảng-ma-trận-tra-cứu-kịch-bản-đề-thi-sang-tài-liệu-scenario-to-doc-mapping)
3. [Chỉ Mục Tra Cứu Theo Dịch Vụ AWS (Alphabetical Service Index)](#3-chỉ-mục-tra-cứu-theo-dịch-vụ-aws-alphabetical-service-index)
4. [Nguyên Tắc "3 Không - 3 Luôn" Khi Giải Đề Thi AWS](#4-nguyên-tắc-3-không---3-luôn-khi-giải-đề-thi-aws)

---

## 1. Phân Nhóm Theo Miền Kiến Trúc (Architecture Domains)

```mermaid
flowchart TD
    subgraph Compute["1. Compute & Serverless"]
        EC2[EC2_Elastic_Compute_Cloud.md]
        Lambda[Lambda_Serverless_Architecture.md]
        ECS[ECS_Fargate_Containers.md]
    end

    subgraph Network["2. Network & Delivery"]
        VPC[VPC_Networking.md]
        Route53[Route53_DNS.md]
        ELB[ELB_and_ASG_High_Availability.md]
    end

    subgraph Storage["3. Storage & Hybrid"]
        S3[S3_and_CloudFront_Storage.md]
        EBS[EBS_EFS_Storage.md]
        FSx[FSx_StorageGateway_HybridStorage.md]
    end

    subgraph Database["4. Databases & Caching"]
        RDS[RDS_Aurora_Databases.md]
        DynamoDB[DynamoDB_NoSQL_Databases.md]
    end

    subgraph Security["5. Security & Governance"]
        IAM[IAM_Identity_and_Access_Management.md]
        KMS[KMS_Security_Encryption.md]
        CloudWatch[CloudWatch_CloudTrail_Observability.md]
    end

    subgraph AppIntegration["6. Integration & Analytics"]
        SQS[SQS_SNS_EventBridge_Decoupling.md]
        APIGW[APIGateway_Cognito_StepFunctions.md]
        Analytics[Analytics_Big_Data_Services.md]
        AI[AI_Machine_Learning_Services.md]
    end

    subgraph Resiliency["7. Resiliency & Strategy"]
        DR[Disaster_Recovery_Migration.md]
        WAF[AWS_Well_Architected_Framework.md]
        CFN[CloudFormation_Systems_Manager.md]
    end

    subgraph OtherServices["8. Deployment, Messaging & Modern Apps"]
        OtherDeploy[Other_Services_Deployment_Management.md]
    end

    subgraph CostDB["9. Cost Optimization, Specialized DBs & Migration"]
        CostOpt[Cost_Optimization_Database_Migration.md]
    end
```

---

## 2. Bảng Ma Trận Tra Cứu Kịch Bản Đề Thi Sang Tài Liệu (Scenario-to-Doc Mapping)

Bảng dưới đây ánh xạ các tình huống, từ khóa "bẫy" và câu hỏi trọng tâm từ 3 bộ đề thực hành lớn sang đúng tài liệu chi tiết và vị trí mục/bẫy tương ứng:

| Miền Kiến Trúc / Dịch Vụ | Tình huống / Từ khóa đề thi | Giải pháp Chuẩn AWS & Điểm Quyết Định | Nguồn Đề Thi | Tài Liệu Chi Tiết & Bẫy Cần Đọc |
| :--- | :--- | :--- | :--- | :--- |
| **Storage & Caching** | Phân phối nội dung toàn cầu, tiết kiệm chi phí tối đa, người dùng tập trung tại Mỹ & Châu Âu | Chọn **CloudFront Price Class 100** hoặc **Price Class 200** (không dùng Price Class All; phân biệt với Geo-restrictions chặn truy cập) | `TD-Set3 Q18`, `U-PT1 Q12` | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md#27-quản-trị-chi-phí-cloudfront-price-classes-vs-geo-restrictions) <br> *(Mục 2.7 & Bẫy 18)* |
| **Storage Lifecycle** | Lưu trữ tệp tạm thời có vòng đời $< 30$ ngày, yêu cầu chi phí thấp nhất | Giữ ở **S3 Standard**, KHÔNG chuyển sang S3 Standard-IA (Standard-IA phạt tối thiểu 30 ngày lưu trữ + phí retrieval) | `TD-Set4 Q12`, `U-PT2 Q45` | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) <br> *(Bẫy 19)* |
| **High Performance Upload** | Tải tệp dung lượng lớn ($> 100$ MB hoặc GB/TB) từ khắp nơi trên thế giới về S3 trung tâm | Kết hợp **S3 Multipart Upload** + **S3 Transfer Acceleration** (sử dụng mạng trục AWS Edge Locations) | `TD-Set1 Q14`, `CM-PT1 Q15` | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) <br> *(Bẫy 20)* |
| **Shared File Storage** | Container Fargate / Lambda / Serverless cần dùng chung file system với user root bị cô lập | Dùng **EFS Access Points** cấu hình POSIX UID/GID và giới hạn thư mục gốc | `TD-Set2 Q19`, `U-PT4 Q16` | [EBS_EFS_Storage.md](./EBS_EFS_Storage.md#24-amazon-efs-access-points--chia-sẻ-tệp-tin-cho-serverlesscontainers) <br> *(Mục 2.4 & Bẫy 16)* |
| **Snapshot Automation** | Tự động hóa lịch chụp và xoay vòng snapshot EBS/RDS theo chính sách tuân thủ | Sử dụng **Amazon Data Lifecycle Manager (DLM)** (không viết script cron Lambda tốn công bảo trì) | `CM-PT2 Q18`, `TD-Set3 Q29` | [EBS_EFS_Storage.md](./EBS_EFS_Storage.md) <br> *(Bẫy 17)* |
| **Databases** | Dung lượng RDS database tăng trưởng nhanh, tránh downtime và gián đoạn vận hành | Bật **RDS Storage Auto Scaling** (tự động mở rộng khi dung lượng trống $\le 10\%$, cooldown 6h, không reboot) | `U-PT1 Q14`, `TD-Set2 Q08` | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md#c-amazon-rds-storage-auto-scaling) <br> *(Mục 2.4.C & Bẫy 17)* |
| **Database Security** | Xoay vòng mật khẩu cơ sở dữ liệu định kỳ không làm ngắt kết nối ứng dụng | Dùng **AWS Secrets Manager + Lambda Rotation Function** (cơ chế 2 nhãn phiên bản `AWSCURRENT` và `AWSPENDING`) | `TD-Set4 Q35`, `U-PT2 Q09` | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md) <br> *(Mục 2.5 & Bẫy 16)* |
| **NoSQL Database** | Ứng dụng Document dạng JSON cần cơ sở dữ liệu serverless tự động co giãn tương thích MongoDB | **Amazon DocumentDB (Elastic Clusters / Serverless)** | `TD-Set3 Q42`, `U-PT3 Q18` | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md) <br> *(Bẫy 18)* |
| **NoSQL / DynamoDB** | Đọc dữ liệu DynamoDB với độ trễ microsecond, nghiêm cấm sửa đổi code nghiệp vụ | Triển khai cụm **Amazon DynamoDB Accelerator (DAX)** (thay thế endpoint trong SDK, giữ nguyên code logic) | `U-PT1 Q06`, `TD-Set2 Q48`, `TD-Set3 Q04` | [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md#cụm-caching-tốc-độ-microsecond-với-dynamodb-accelerator-dax) <br> *(Mục 3 & Bẫy 8)* |
| **NoSQL / DynamoDB** | Ghi/đọc cục bộ đa vùng toàn cầu (Active-Active), RPO $< 1$s, xử lý xung đột đồng thời | **DynamoDB Global Tables** (yêu cầu Streams, cơ chế giải quyết xung đột **Last-writer-wins** theo timestamp) | `CM-PT2 Q43`, `U-PT4 Q38`, `U-PT4 Q53` | [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md#5-dynamodb-global-tables-kiến-trúc-đa-vùng-tự-động-nhân-bản-active-active) <br> *(Mục 2.5 & Bẫy 5, 7)* |
| **NoSQL / DynamoDB** | Khôi phục bảng về đúng giây cụ thể trước khi bị script làm hỏng dữ liệu | Kích hoạt **Point-in-Time Recovery (PITR)** (cửa sổ 35 ngày, khôi phục ra bảng mới, 0 tốn RCU/WCU) | `TD-Set1 Q25` | [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md#6-sao-lưu--khôi-phục-point-in-time-recovery-pitr-vs-on-demand-backup) <br> *(Mục 2.6 & Bẫy 6)* |
| **Serverless / Lambda** | Lambda trong VPC cần gọi RDS Private VÀ tải thư viện từ Internet công cộng | Gán Lambda vào **Private Subnet**, lưu lượng Internet định tuyến qua **NAT Gateway** (Lambda không có Public IP) | `TD-Set3 Q11`, `U-PT2 Q18` | [Lambda_Serverless_Architecture.md](./Lambda_Serverless_Architecture.md#26-kết-nối-mạng-lambda-trong-vpc-hyperplane-eni--internet-access) <br> *(Mục 2.6 & Bẫy 13)* |
| **Serverless / Lambda** | Xử lý lỗi "poison pill" trong hàng đợi Kinesis/DynamoDB Streams chặn toàn bộ shard | Cấu hình **BisectBatchOnFunctionError = true** kết hợp Maximum Retry Attempts và On-Failure Destination | `TD-Set2 Q35`, `U-PT3 Q42` | [Lambda_Serverless_Architecture.md](./Lambda_Serverless_Architecture.md#27-khả-năng-phục-hồi-khi-xử-lý-stream-stream-resiliency) <br> *(Mục 2.7 & Bẫy 14)* |
| **Serverless / API GW** | Ứng dụng chat real-time, bảng điều khiển tài chính đẩy dữ liệu 2 chiều liên tục | **API Gateway WebSocket APIs** (stateful persistent connection, duy trì Connection ID) | `TD-Set4 Q22`, `U-PT1 Q39` | [Lambda_Serverless_Architecture.md](./Lambda_Serverless_Architecture.md) <br> *(Bẫy 15)* & [APIGateway_Cognito_StepFunctions.md](./APIGateway_Cognito_StepFunctions.md) |
| **Network & HA** | Ứng dụng TCP/UDP non-HTTP, IP cố định cho đối tác whitelist firewall, định tuyến Anycast | **AWS Global Accelerator** (2 Static Anycast IPs, chạy trên AWS private backbone, bypass DNS caching) | `TD-Set1 Q48`, `U-PT3 Q15` | [ELB_and_ASG_High_Availability.md](./ELB_and_ASG_High_Availability.md#24-aws-global-accelerator-định-tuyến-bằng-anycast-ip-và-so-sánh-với-cloudfront) <br> *(Mục 2.4 & Bẫy 15)* |
| **Auto Scaling** | Lưu lượng tăng vọt đột ngột trong thời gian ngắn (flash sale, livestream) | Cấu hình **Step Scaling** thay vì Simple Scaling (loại bỏ thời gian cooldown giữa các bước tăng tải) | `TD-Set2 Q28`, `U-PT4 Q12` | [ELB_and_ASG_High_Availability.md](./ELB_and_ASG_High_Availability.md#25-các-chiến-lược-co-giãn-asg-step-scaling-vs-simple-scaling) <br> *(Mục 2.5 & Bẫy 16)* |
| **Hybrid DNS** | Phân giải tên miền 2 chiều giữa mạng On-Premises và AWS VPC | Phải tạo CẢ HAI: **Route 53 Resolver Inbound Endpoint** (On-prem $\rightarrow$ AWS) VÀ **Outbound Endpoint** kèm Forwarding Rules (AWS $\rightarrow$ On-prem) | `CM-PT1 Q41`, `TD-Set1 Q52` | [Route53_DNS.md](./Route53_DNS.md#bẫy-2-kiến-trúc-lai-hybrid-dns-giữa-on-premises-và-aws-vpc--cm-pt1-q41-td-set1-q52) <br> *(Bẫy 2)* |
| **ETL & Data Prep** | Data Analysts / Business Users cần làm sạch, chuẩn hóa dữ liệu trực quan không cần viết code | **AWS Glue DataBrew** (hơn 250 phép biến đổi visual sẵn có, lưu dưới dạng Recipes và Datasets) | `TD-Set5 Q14`, `U-PT4 Q22` | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md#26-aws-glue-databrew-visual-data-preparation-no-code) <br> *(Mục 2.6 & Bẫy 8)* |
| **Specialized Databases** | Hệ thống kế toán, chuỗi cung ứng cần sổ cái bất biến, chứng minh được bằng mật mã | **Amazon QLDB** (Centralized Immutable Append-only Ledger, cấu trúc Merkle Tree SHA-256) | `TD-Set3 Q55`, `U-PT2 Q51` | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md#27-amazon-qldb--amazon-keyspaces-các-cơ-sở-dữ-liệu-chuyên-dụng) <br> *(Mục 2.7 & Bẫy 9)* |
| **Specialized Databases** | Di chuyển cụm cơ sở dữ liệu Apache Cassandra lớn lên AWS không muốn quản lý máy chủ | **Amazon Keyspaces (for Apache Cassandra)** (Serverless, tương thích 100% CQL API) | `TD-Set4 Q61`, `U-PT3 Q58` | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md#b-amazon-keyspaces-for-apache-cassandra) <br> *(Mục 2.7.B & Bẫy 10)* |
| **Backup & Compliance** | Ngăn chặn ransomware, mã hóa độc hại hoặc nhân sự nội bộ xóa bản sao lưu (WORM) | **AWS Backup Vault Lock** ở chế độ **Compliance Mode** (có thời gian làm nguội Cooling-off period 1–72h) | `CM-PT1 Q22`, `TD-Set6 Q14` | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md#8-quản-trị--bảo-vệ-bản-sao-lưu-tập-trung-doanh-nghiệp-aws-backup-vault-lock-worm--aws-backup-audit-manager) <br> *(Mục 2.8 & Bẫy 14)* |
| **Migration** | Thu thập thông số máy chủ và phân tích mối quan hệ phụ thuộc giữa các ứng dụng on-prem | **AWS Application Discovery Service** sử dụng **Agent-based** (AWS Application Discovery Agent) | `TD-Set2 Q42`, `U-PT1 Q59` | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md#72-bộ-đôi-khảo-sát--lập-bản-đồ-phụ-thuộc-aws-application-discovery-service--migration-evaluator) <br> *(Mục 2.7.2 & Bẫy 15)* |
| **Migration** | Theo dõi tiến độ di chuyển của nhiều công cụ (SMS, DMS, MGN) trên một bảng điều khiển duy nhất | **AWS Migration Hub** (Single pane of glass tracking) | `CM-PT3 Q19`, `U-PT4 Q31` | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md#72-bộ-đôi-khảo-sát--lập-bản-đồ-phụ-thuộc-aws-application-discovery-service--migration-evaluator) <br> *(Mục 2.7.2 & Bẫy 16)* |
| **Server Migration** | Di chuyển máy chủ vật lý, VMware, Hyper-V, Cloud khác lên EC2 (Lift-and-Shift) với downtime tối thiểu | **AWS Application Migration Service (AWS MGN)** (Continuous block-level replication qua TCP 1500, non-disruptive test instance) | `TD-Set4 Q65`, `U-PT6 Q60` | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md#4-aws-application-migration-service-aws-mgn--di-chuyển-máy-chủ-toàn-diện-lift-and-shift--rehost) <br> *(Mục 2.4 & Bẫy 8)* |
| **Governance & IAM** | Cấm toàn bộ thành viên sử dụng dịch vụ nhạy cảm, nhưng lo lắng dịch vụ AWS bị ảnh hưởng | **Service Control Policies (SCPs)** (Lưu ý: SCPs **KHÔNG ảnh hưởng** Service-Linked Roles và Management Account) | `U-PT3 Q24`, `CM-PT6 Q12` | [IAM_Identity_and_Access_Management.md](./IAM_Identity_and_Access_Management.md#bẫy-13-phạm-vi-ảnh-hưởng-của-service-control-policies-scps--cm-pt6-q12-u-pt3-q24) <br> *(Bẫy 13)* |
| **VPC & Security** | Kết nối mạng an toàn giữa 2 VPC có dải IP trùng lặp (Overlapping CIDR) | Thiết lập **AWS PrivateLink** (Interface VPC Endpoint + NLB) | `TD-Set4 Q18`, `U-PT2 Q31` | [VPC_Networking.md](./VPC_Networking.md) <br> *(Mục 2 & Bẫy 12)* |
| **VPC & Security** | Chèn cụm tường lửa bên thứ ba (Palo Alto, Fortinet) kiểm tra lưu lượng trong VPC | Triển khai **Gateway Load Balancer (GWLB)** kèm GENEVE protocol (port 6081) | `TD-Set1 Q05`, `U-PT1 Q44` | [VPC_Networking.md](./VPC_Networking.md) & [ELB_and_ASG_High_Availability.md](./ELB_and_ASG_High_Availability.md) |
| **Security / EC2 Access** | Quản trị máy chủ EC2 an toàn không mở cổng SSH 22, không cần Bastion Host, ghi log đầy đủ | **AWS Systems Manager Session Manager** (kết hợp Interface Endpoint `ssmmessages`) | `TD-Set1 Q11`, `CM-PT2 Q09` | [CloudFormation_Systems_Manager.md](./CloudFormation_Systems_Manager.md) & [VPC_Networking.md](./VPC_Networking.md) |
| **Deployment / PaaS** | Deploy web app nhanh không quản lý server, vẫn truy cập được EC2, cần zero-downtime rolling update | **AWS Elastic Beanstalk** + chiến lược **Rolling with Additional Batch** (Full capacity + không phát sinh thêm chi phí) hoặc **Immutable** (Rollback nhanh nhất) | `TD-Set6 Q2`, `CM-PT2 Q4` | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md#22-các-chiến-lược-triển-khai-deployment-policies--trọng-tâm-thi) |
| **Certificate / Security** | SSL/TLS cert sắp hết hạn, cần cảnh báo tự động 30 ngày trước | **ACM + EventBridge Rule + Lambda + SNS** (ACM không có built-in SNS alert trực tiếp) | `TD-Set6 Q11`, `CM-PT3 Q8` | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md#33-giám-sát-hết-hạn-chứng-chỉ--bẫy-thi) |
| **Compliance & Config** | Kiểm tra liên tục S3 bucket có public không, tự động sửa chữa vi phạm | **AWS Config** + Managed Rule `s3-bucket-public-read-prohibited` + **SSM Automation** (Auto Remediation) | `TD-Set5 Q32`, `CM-PT4 Q17` | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md#4-aws-config--tuân-thủ--lịch-sử-cấu-hình-tài-nguyên) |
| **Batch Computing** | Chạy hàng nghìn batch jobs HPC, kết hợp Spot Instances tối ưu chi phí | **AWS Batch** (Job Definitions + Job Queue + Spot Compute Environment) | `TD-Set5 Q41`, `CM-PT1 Q11` | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md#6-aws-batch--xử-lý-tính-toán-hàng-loạt-batch-computing) |
| **Legacy Migration / Messaging** | Migrate ActiveMQ/RabbitMQ on-prem lên AWS, giữ nguyên JMS/AMQP protocol | **Amazon MQ** (Managed ActiveMQ/RabbitMQ; KHÔNG dùng SQS vì phải thay đổi code) | `CM-PT2 Q14`, `TD-Set4 Q28` | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md#7-amazon-mq--message-broker-managed-cho-legacy-apps) |
| **Graph Database** | Mạng xã hội, phát hiện gian lận, recommendation engine với deep relationship queries | **Amazon Neptune** (Gremlin / openCypher / SPARQL; không dùng DynamoDB cho deep graph traversal) | `CM-PT3 Q21`, `TD-Set5 Q18` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#4-amazon-neptune--graph-database) |
| **Document Database** | Migrate MongoDB app lên AWS, flexible JSON schema, không muốn thay đổi code | **Amazon DocumentDB** (MongoDB wire protocol compatible; tự động scale storage đến 128 TB) | `TD-Set3 Q42`, `U-PT3 Q18` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#5-amazon-documentdb--mongodb-compatible-document-database) |
| **Cost Optimization** | Phân tích chi phí lịch sử, dự báo tương lai, right-sizing EC2 | **AWS Cost Explorer** (12 tháng lịch sử + forecast 12 tháng; phân tích theo service/account/tag) | `CM-PT4 Q22`, `TD-Set6 Q38` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#21-aws-cost-explorer--phân-tích--dự-báo-chi-phí) |
| **Cost Governance** | Tự động ngừng EC2 khi vượt ngân sách, cảnh báo trước khi vượt | **AWS Budgets** + **Budget Actions** (gắn IAM Policy hoặc dừng EC2/RDS tự động) | `CM-PT5 Q19`, `TD-Set6 Q42` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#22-aws-budgets--giám-sát--hành-động-tự-động) |
| **Savings Plans vs RI** | Giảm chi phí On-Demand linh hoạt thay đổi instance type/region | **Compute Savings Plans** (không cần capacity reservation; áp dụng EC2 + Fargate + Lambda) vs **Zonal RI** (khi cần capacity reservation) | `CM-PT4 Q9`, `TD-Set5 Q55` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#24-savings-plans-vs-reserved-instances--bẫy-thi-kinh-điển) |
| **Online Data Transfer** | Sync dữ liệu NFS/SMB on-prem → S3/EFS định kỳ, có Internet/Direct Connect | **AWS DataSync** (tốc độ cao + toàn vẹn checksum + TLS; nhanh hơn rsync đến 10x) | `CM-PT3 Q6`, `TD-Set4 Q51` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#6-aws-datasync--truyền-dữ-liệu-online-nhanh--bảo-mật) |
| **B2B File Transfer** | Đối tác bên ngoài cần upload file bằng SFTP trực tiếp vào S3 | **AWS Transfer Family** (SFTP/FTPS/FTP endpoint → S3/EFS; không cần quản lý FTP server) | `CM-PT1 Q28`, `TD-Set5 Q22` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#7-aws-transfer-family--sftpftp-managed-vào-s3efs) |
| **Offline Data Migration** | Di chuyển TB–PB dữ liệu khi kết nối mạng kém/không có | **AWS Snowball Edge** (10 TB – 1 PB; edge computing + EC2 + Lambda; ship thiết bị vật lý) | `CM-PT2 Q32`, `TD-Set3 Q48` | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md#8-aws-snow-family--di-chuyển-dữ-liệu-offline-quy-mô-lớn) |
| **Security Investigation** | Điều tra nguyên nhân gốc rễ (Root Cause) sau khi có cảnh báo bảo mật, trực quan hóa đồ thị tấn công | **Amazon Detective** (phân tích log CloudTrail, VPC Flow, GuardDuty bằng graph theory & ML) | `SAA-C03 Update` | [KMS_Security_Encryption.md](./KMS_Security_Encryption.md#amazon-detective-điều-tra-nguyên-nhân-gốc-rễ-sự-cố-bảo-mật) |
| **Centralized Firewall** | Tự động áp đặt bộ quy tắc WAF/Shield/Security Groups cho mọi tài khoản & VPC mới trong Organizations | **AWS Firewall Manager** (quản lý tập trung tường lửa đa tài khoản trong AWS Organizations) | `SAA-C03 Update` | [KMS_Security_Encryption.md](./KMS_Security_Encryption.md#aws-firewall-manager-quản-trị-tường-lửa-tập-trung-đa-tài-khoản) |
| **Audit & Compliance** | Tải báo cáo kiểm toán bảo mật bên thứ ba (ISO, SOC, PCI-DSS) và chấp nhận thỏa thuận HIPAA BAA | **AWS Artifact** (cổng tự phục vụ tải báo cáo kiểm toán và thỏa thuận pháp lý của AWS) | `SAA-C03 Update` | [IAM_Identity_and_Access_Management.md](./IAM_Identity_and_Access_Management.md#aws-artifact-cổng-báo-cáo-tuân-thủ--thỏa-thuận-pháp-lý) |
| **Extreme S3 Latency** | Object storage cho ML training, phân tích tài chính cần độ trễ single-digit millisecond trong 1 AZ | **Amazon S3 Express One Zone** (Directory Buckets, nhanh gấp 10 lần, giảm 50% chi phí request) | `SAA-C03 Update` | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md#chuyên-sâu-amazon-s3-express-one-zone-directory-buckets) |
| **S3 Linux Mount** | Gắn S3 bucket thành local file system trên Linux cho tác vụ đọc/ghi tuần tự thông lượng cao | **Mountpoint for Amazon S3** (dịch API file sang S3 REST API; nếu cần POSIX locking chọn FSx for Lustre) | `SAA-C03 Update` | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md#mountpoint-for-amazon-s3-mount-s3-thành-local-file-system) |
| **Network Forensics** | Sao chép toàn bộ gói tin mạng thực tế (raw packet payload) từ ENI để kiểm tra sâu IDS/DPI | **VPC Traffic Mirroring** (gửi raw packets tới appliance/NLB out-of-band; khác VPC Flow Logs chỉ có metadata) | `SAA-C03 Update` | [VPC_Networking.md](./VPC_Networking.md#vpc-traffic-mirroring-sao-chép-gói-tin-mạng-thực-tế) |
| **NoSQL Migration** | Di chuyển cụm Apache Cassandra on-premises lên AWS dạng Serverless không đổi mã nguồn | **Amazon Keyspaces (for Apache Cassandra)** (100% CQL compatible, On-Demand/Provisioned, Multi-AZ) | `TD-Set4 Q61`, `U-PT3 Q58` | [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md#9-amazon-keyspaces-for-apache-cassandra) |
| **Time-Series IoT** | Lưu trữ và phân tích hàng triệu sự kiện cảm biến IoT / telemetry mỗi giây theo chuỗi thời gian | **Amazon Timestream** (tự động phân tầng lưu trữ In-Memory Store sang Magnetic Store chi phí thấp) | `SAA-C03 Update` | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md#73-amazon-timestream-cơ-sở-dữ-liệu-chuỗi-thời-gian---time-series-database) |
| **Data Lake Governance** | Quản trị phân quyền chi tiết cấp cột/dòng cho Data Lake đa tài khoản mà không copy dữ liệu | **AWS Lake Formation** (Fine-grained access control qua Glue Data Catalog cho Athena, Redshift, EMR) | `TD-Set1 Q02`, `TD-Set6 Q63` | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md#1-aws-lake-formation-kiến-trúc-quản-trị-data-lake-tập-trung-đa-tài-khoản) |
| **SaaS Data Ingestion** | Truyền tải luồng dữ liệu lớn 2 chiều giữa Salesforce/ServiceNow và S3/Redshift qua PrivateLink no-code | **Amazon AppFlow** (tích hợp SaaS 2 chiều không cần viết code, hỗ trợ PrivateLink) | `TD-Set5 Q18`, `U-PT6 Q31` | [SQS_SNS_EventBridge_Decoupling.md](./SQS_SNS_EventBridge_Decoupling.md#5-amazon-appflow-tích-hợp-dữ-liệu-saas-không-cần-viết-code) |
| **Document OCR & ML** | Trích xuất văn bản in, chữ viết tay, bảng biểu (Tables) và biểu mẫu (Forms) từ tài liệu scan/PDF | **Amazon Textract** (ML-powered OCR trích xuất key-value forms và tables từ hóa đơn, hợp đồng) | `TD-Set4 Q46`, `TD-Set4 Q50` | [AI_Machine_Learning_Services.md](./AI_Machine_Learning_Services.md#3-chuyên-sâu-amazon-textract-trích-xuất-văn-bản-bảng-biểu--biểu-mẫu-bằng-mlocr) |

---

## 3. Chỉ Mục Tra Cứu Theo Dịch Vụ AWS (Alphabetical Service Index)

Danh mục đối chiếu nhanh 40+ dịch vụ cốt lõi và tài liệu chuyên sâu tương ứng:

| Dịch vụ AWS | Tài Liệu Chứa Kiến Thức Trọng Tâm | Các Chủ Đề Cốt Lõi Được Bao Phủ |
| :--- | :--- | :--- |
| **Amazon API Gateway** | [APIGateway_Cognito_StepFunctions.md](./APIGateway_Cognito_StepFunctions.md) | REST vs HTTP vs WebSocket, Usage Plans, API Keys, Throttling, Caching |
| **Amazon Athena** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Serverless SQL trên S3, Partitioning, Parquet/ORC, Phí \$5/TB scanned |
| **Amazon Aurora** | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md) | Aurora Serverless v2, Global Database, Clone, Backtrack, Multi-AZ Cluster |
| **Amazon CloudFront** | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) | OAC (Origin Access Control), Price Classes, CloudFront Functions vs Lambda@Edge, Signed URLs/Cookies |
| **Amazon Cognito** | [APIGateway_Cognito_StepFunctions.md](./APIGateway_Cognito_StepFunctions.md) | User Pools (Authentication) vs Identity Pools (Authorization/Federation) |
| **Amazon DynamoDB** | [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md) | RCU/WCU, GSI vs LSI, On-Demand, DAX, Streams, Global Tables (Last-writer-wins), PITR |
| **Amazon EBS** | [EBS_EFS_Storage.md](./EBS_EFS_Storage.md) | gp3 vs io2 Block Express, Multi-Attach, Fast Snapshot Restore, DLM Lifecycles |
| **Amazon EC2** | [EC2_Elastic_Compute_Cloud.md](./EC2_Elastic_Compute_Cloud.md) | Spot Fleets, Placement Groups (Cluster/Spread/Partition), Tenancy, ODCR |
| **Amazon ECS / Fargate** | [ECS_Fargate_Containers.md](./ECS_Fargate_Containers.md) | Task Definitions, ECS Service, Capacity Providers, Fargate Spot |
| **Amazon EFS** | [EBS_EFS_Storage.md](./EBS_EFS_Storage.md) | Multi-AZ NFS, Storage Classes, Lifecycle Management, Access Points |
| **Amazon ElastiCache** | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md) & [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md) | Redis vs Memcached, Cluster Mode, Caching Strategies (Lazy vs Write-through) |
| **Amazon EMR** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Managed Hadoop/Spark, Master/Core/Task Nodes, Spot Instances cho Task nodes |
| **Amazon FSx** | [FSx_StorageGateway_HybridStorage.md](./FSx_StorageGateway_HybridStorage.md) | FSx for Windows File Server, FSx for Lustre (HPC), FSx for NetApp ONTAP |
| **Amazon Kinesis** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Data Streams vs Data Firehose vs Data Analytics, Shard Capacity, Resharding |
| **Amazon OpenSearch** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Full-text search, Log analytics, Tích hợp qua DynamoDB Streams / Kinesis |
| **Amazon QLDB** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Sổ cái bất biến (Immutable Ledger), Mã hóa Merkle Tree SHA-256 |
| **Amazon RDS** | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md) | Multi-AZ vs Read Replicas, Storage Auto Scaling, Automated Backups |
| **Amazon Redshift** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Data Warehouse, Redshift Serverless, Redshift Spectrum, Concurrency Scaling |
| **Amazon Route 53** | [Route53_DNS.md](./Route53_DNS.md) | Routing Policies, Alias vs CNAME, Resolver Inbound/Outbound Endpoints |
| **Amazon S3** | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) | Storage Classes, Lifecycle Rules, S3 Object Lock (Compliance vs Governance), Replication |
| **Amazon SNS** | [SQS_SNS_EventBridge_Decoupling.md](./SQS_SNS_EventBridge_Decoupling.md) | Pub/Sub, Fanout pattern, Message Filtering, SMS/Email delivery |
| **Amazon SQS** | [SQS_SNS_EventBridge_Decoupling.md](./SQS_SNS_EventBridge_Decoupling.md) | Standard vs FIFO, Visibility Timeout, DLQ, Long Polling (20s), Backlog Metric |
| **AWS Application Discovery** | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md) | Agentless Collector (OVA) vs Application Discovery Agent (Network Dependencies) |
| **AWS Application Migration Service (MGN)** | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md) | Rehost Lift-and-Shift, Continuous block-level replication (TCP 1500), Staging Area, Test vs Cutover |
| **AWS Backup** | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md) | Centralized Backup, Vault Lock (WORM), Backup Audit Manager, Cross-Region Copy |
| **AWS CloudFormation** | [CloudFormation_Systems_Manager.md](./CloudFormation_Systems_Manager.md) | Stacks, Nested Stacks, StackSets (đa tài khoản/đa vùng), Drift Detection |
| **AWS CloudTrail** | [CloudWatch_CloudTrail_Observability.md](./CloudWatch_CloudTrail_Observability.md) | Management Events vs Data Events, CloudTrail Insights, Multi-region Trail |
| **AWS CloudWatch** | [CloudWatch_CloudTrail_Observability.md](./CloudWatch_CloudTrail_Observability.md) | Metrics, Logs, Metric Filters, Alarms, Network Monitor, Container Insights |
| **AWS Database Migration Service (DMS)** | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md) | Homogeneous & Heterogeneous Migration, SCT, Change Data Capture (CDC), Zero-Downtime Cutover |
| **AWS Direct Connect** | [VPC_Networking.md](./VPC_Networking.md) | Private VIF vs Public VIF vs Transit VIF, Direct Connect Gateway, MACsec |
| **AWS Elastic Disaster Recovery (DRS)** | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md) | Continuous Block Replication (TCP 1500), Staging Area, RPO seconds, RTO minutes, Drill & Failback |
| **AWS Global Accelerator** | [ELB_and_ASG_High_Availability.md](./ELB_and_ASG_High_Availability.md) | Static Anycast IPs, Bỏ qua DNS Cache, Hỗ trợ TCP/UDP, Tối ưu độ trễ VoIP/Gaming |
| **AWS Glue / DataBrew** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Data Catalog, Crawlers, ETL Jobs, Glue DataBrew (Visual Recipes) |
| **AWS KMS** | [KMS_Security_Encryption.md](./KMS_Security_Encryption.md) | AWS Managed vs Customer Managed Keys (CMK), Envelope Encryption, Multi-Region Keys |
| **AWS Lambda** | [Lambda_Serverless_Architecture.md](./Lambda_Serverless_Architecture.md) | Event Source Mapping, VPC Networking (Hyperplane ENI), SnapStart, Stream Resiliency |
| **AWS Migration Hub** | [Disaster_Recovery_Migration.md](./Disaster_Recovery_Migration.md) | Bảng điều khiển quản lý tiến độ di chuyển tập trung tích hợp các công cụ |
| **AWS Organizations / SCP** | [IAM_Identity_and_Access_Management.md](./IAM_Identity_and_Access_Management.md) | Organizational Units (OUs), Service Control Policies (SCPs), Miễn trừ Service-Linked Roles |
| **AWS Secrets Manager** | [RDS_Aurora_Databases.md](./RDS_Aurora_Databases.md) & [KMS_Security_Encryption.md](./KMS_Security_Encryption.md) | Tự động xoay vòng mật khẩu (Rotation) với Lambda, tích hợp RDS/Aurora |
| **AWS Step Functions** | [APIGateway_Cognito_StepFunctions.md](./APIGateway_Cognito_StepFunctions.md) | Standard Workflows (chạy tới 1 năm, Exactly-once) vs Express Workflows (At-least-once, tải cao) |
| **AWS Systems Manager** | [CloudFormation_Systems_Manager.md](./CloudFormation_Systems_Manager.md) | Parameter Store, Session Manager, Patch Manager, Run Command |
| **AWS Transit Gateway** | [VPC_Networking.md](./VPC_Networking.md) | Hub-and-Spoke topology, TGW Route Tables, Peering, Multicast |
| **AWS WAF & Shield** | [AWS_Well_Architected_Framework.md](./AWS_Well_Architected_Framework.md) & [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) | Web ACLs, SQL Injection / XSS protection, Rate-based Rules, Shield Standard vs Advanced |
| **Amazon MQ** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Managed ActiveMQ / RabbitMQ, JMS/AMQP/MQTT/STOMP support, Multi-AZ Active/Standby, Lift-and-shift messaging |
| **Amazon Neptune** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Graph Database, Gremlin / openCypher / SPARQL, Social networks, Fraud detection, 15 Read Replicas |
| **Amazon DocumentDB** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | MongoDB-compatible, JSON/BSON documents, Auto-scale 128 TB, 6 replicas × 3 AZs |
| **Amazon EKS** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Managed Kubernetes, EC2/Fargate nodes, EKS Anywhere (hybrid), Helm, CSI drivers |
| **AWS Elastic Beanstalk** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | PaaS, Deployment Policies (All-at-once/Rolling/Immutable/Traffic Splitting), .ebextensions |
| **AWS Certificate Manager (ACM)** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Public SSL/TLS miễn phí, Auto-renewal, EventBridge+Lambda+SNS cho expiry alerts |
| **AWS Config** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Continuous compliance, Managed/Custom Rules, Auto Remediation via SSM, Multi-Account Aggregator |
| **AWS Trusted Advisor** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | 5 pillars: Cost/Performance/Security/Fault Tolerance/Service Limits, Business/Enterprise full access |
| **AWS Batch** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | HPC batch jobs, Job Queues, Spot integration, không giới hạn runtime (khác Lambda 15p) |
| **AWS Amplify** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Full-stack hosting, Git CI/CD, Cognito/AppSync integration, React/Next.js/Mobile |
| **AWS AppSync** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Managed GraphQL, Real-time WebSocket Subscriptions, Offline sync, Multi-source resolver |
| **Amazon SES** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Bulk email, Transactional email, DKIM/SPF, Bounce/Complaint tracking, Low cost |
| **Amazon Pinpoint** | [Other_Services_Deployment_Management.md](./Other_Services_Deployment_Management.md) | Multi-channel (Email+SMS+Push), User segmentation, Journey orchestration, Kinesis event streaming |
| **AWS Cost Explorer** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Historical 12M analysis, Forecast 12M, Right-sizing EC2/RDS, Savings Plans recommendations |
| **AWS Budgets** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Cost/Usage/RI/SP budgets, SNS alerts, Budget Actions (IAM Policy / Stop EC2) |
| **AWS Compute Optimizer** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | ML right-sizing: EC2/ASG/EBS/Lambda/ECS on Fargate, 14-day CloudWatch analysis |
| **Savings Plans** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Compute SP (EC2+Fargate+Lambda, all regions), EC2 Instance SP (1 family), Không có capacity reservation |
| **AWS DataSync** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Online NFS/SMB/HDFS → S3/EFS/FSx, TLS encryption, Checksum integrity, 10x faster than rsync |
| **AWS Transfer Family** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | SFTP/FTPS/FTP/AS2 endpoint → S3/EFS, B2B file transfer, No FTP server management |
| **AWS Snow Family** | [Cost_Optimization_Database_Migration.md](./Cost_Optimization_Database_Migration.md) | Snowcone (8TB, edge), Snowball Edge (80TB, EC2+Lambda), Snowmobile (100PB, data center) |
| **Amazon AppFlow** | [SQS_SNS_EventBridge_Decoupling.md](./SQS_SNS_EventBridge_Decoupling.md) | No-code SaaS data transfer 2 chiều (Salesforce, ServiceNow, Zendesk) vào S3/Redshift qua PrivateLink |
| **Amazon Detective** | [KMS_Security_Encryption.md](./KMS_Security_Encryption.md) | Điều tra nguyên nhân gốc rễ (Root Cause Analysis), Visual Graph từ GuardDuty, VPC Flow Logs, CloudTrail |
| **Amazon Keyspaces** | [DynamoDB_NoSQL_Databases.md](./DynamoDB_NoSQL_Databases.md) & [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Serverless Apache Cassandra, CQL API, On-Demand & Provisioned capacity, Multi-AZ |
| **Amazon S3 Express One Zone** | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) | Directory Bucket, Single-digit millisecond latency trong 1 AZ cho AI/ML và High-request workloads |
| **Amazon Textract** | [AI_Machine_Learning_Services.md](./AI_Machine_Learning_Services.md) | Trích xuất văn bản in, chữ viết tay, bảng (Tables) và biểu mẫu (Forms) từ scanned PDF qua ML |
| **Amazon Timestream** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Serverless Time-series database cho IoT/telemetry, Automated storage tiering (In-memory & Magnetic) |
| **AWS Artifact** | [IAM_Identity_and_Access_Management.md](./IAM_Identity_and_Access_Management.md) | Báo cáo kiểm toán tuân thủ (ISO, SOC, PCI-DSS) & Ký thỏa thuận pháp lý (HIPAA BAA) |
| **AWS Firewall Manager** | [KMS_Security_Encryption.md](./KMS_Security_Encryption.md) | Quản trị chính sách tường lửa tập trung đa tài khoản (WAF, Shield, Network Firewall, Route 53 DNS Firewall) |
| **AWS Lake Formation** | [Analytics_Big_Data_Services.md](./Analytics_Big_Data_Services.md) | Quản trị tập trung Data Lake, Fine-grained access control (cột/dòng) trên S3 qua Glue Catalog |
| **Mountpoint for Amazon S3** | [S3_and_CloudFront_Storage.md](./S3_and_CloudFront_Storage.md) | Mount S3 thành local file system trên Linux với thông lượng đọc tuần tự/ngẫu nhiên cao |
| **VPC Traffic Mirroring** | [VPC_Networking.md](./VPC_Networking.md) | Sao chép gói tin mạng thực tế (raw packet payload) từ ENI để phân tích sâu (Deep Packet Inspection) |

---

## 4. Nguyên Tắc "3 Không - 3 Luôn" Khi Giải Đề Thi AWS

### ❌ 3 ĐIỀU TUYỆT ĐỐI KHÔNG CHỌN:
1. **Không chọn giải pháp thủ công hoặc custom script** khi đã có dịch vụ AWS Native (ví dụ: không viết Lambda cron chụp snapshot khi đã có *Data Lifecycle Manager* hay *AWS Backup*; không viết script kiểm tra drift khi CloudFormation đã có sẵn *Drift Detection*).
2. **Không routing lưu lượng nội bộ AWS qua Internet công cộng** (luôn chọn *VPC Endpoints* - Gateway hoặc Interface Endpoint thay vì NAT Gateway khi kết nối các dịch vụ như S3, DynamoDB, SQS, Secrets Manager).
3. **Không lưu trữ file có tuổi thọ dưới 30 ngày lên S3 Standard-IA** (vì phí phạt lưu trữ tối thiểu 30 ngày của Standard-IA sẽ làm chi phí cao hơn cả S3 Standard).

### ✅ 3 ĐIỀU LUÔN PHẢI ƯU TIÊN:
1. **Luôn ưu tiên tính sẵn sàng cao (High Availability) trải rộng ít nhất 2 Availability Zones** (bất kỳ phương án nào chỉ đặt trên 1 AZ đều bị loại bỏ ngay khi câu hỏi yêu cầu "Highly Available" hoặc "Resilient").
2. **Luôn bảo vệ dữ liệu sản xuất bằng đa tầng phòng thủ** (kết hợp *Deletion Protection*, *MFA Delete*, *Object Lock/Vault Lock*, và *Point-in-Time Recovery - PITR*).
3. **Tách rời các thành phần kiến trúc bằng hàng đợi bất đồng bộ** (*Decouple with SQS/EventBridge*) để chống quá tải tầng lưu trữ và cho phép từng tầng co giãn độc lập.

---

### Liên Kết Đến Tất Cả Tài Liệu Chuyên Sâu (All Services Reference)
- 🖥️ [EC2 Elastic Compute Cloud](./EC2_Elastic_Compute_Cloud.md)
- ⚡ [Lambda Serverless Architecture](./Lambda_Serverless_Architecture.md)
- 🐳 [ECS & Fargate Containers](./ECS_Fargate_Containers.md)
- 🌐 [VPC Networking](./VPC_Networking.md)
- 🚦 [Route 53 DNS](./Route53_DNS.md)
- ⚖️ [ELB & ASG High Availability](./ELB_and_ASG_High_Availability.md)
- 📦 [S3 & CloudFront Storage](./S3_and_CloudFront_Storage.md)
- 💾 [EBS & EFS Storage](./EBS_EFS_Storage.md)
- 🏢 [FSx & Storage Gateway Hybrid Storage](./FSx_StorageGateway_HybridStorage.md)
- 🗄️ [RDS & Aurora Databases](./RDS_Aurora_Databases.md)
- ⚡ [DynamoDB & NoSQL Databases](./DynamoDB_NoSQL_Databases.md)
- 🔐 [IAM Identity & Access Management](./IAM_Identity_and_Access_Management.md)
- 🔑 [KMS Security & Encryption](./KMS_Security_Encryption.md)
- 📊 [CloudWatch, CloudTrail & Observability](./CloudWatch_CloudTrail_Observability.md)
- 📬 [SQS, SNS & EventBridge Decoupling](./SQS_SNS_EventBridge_Decoupling.md)
- 🚪 [API Gateway, Cognito & Step Functions](./APIGateway_Cognito_StepFunctions.md)
- 📈 [Analytics & Big Data Services](./Analytics_Big_Data_Services.md)
- 🤖 [AI & Machine Learning Services](./AI_Machine_Learning_Services.md)
- 🛡️ [Disaster Recovery & Migration](./Disaster_Recovery_Migration.md)
- 🏗️ [AWS Well-Architected Framework](./AWS_Well_Architected_Framework.md)
- 📜 [CloudFormation & Systems Manager](./CloudFormation_Systems_Manager.md)
- 🚀 [Other Services: Deployment, Messaging & Modern Apps](./Other_Services_Deployment_Management.md) *(Elastic Beanstalk, ACM, AWS Config, Trusted Advisor, AWS Batch, Amazon MQ, AppSync, Amplify, SES, Pinpoint)*
- 💰 [Cost Optimization, Specialized DBs & Migration](./Cost_Optimization_Database_Migration.md) *(Cost Explorer, Budgets, Compute Optimizer, Savings Plans, EKS, Neptune, DocumentDB, DataSync, Transfer Family, Snow Family)*

