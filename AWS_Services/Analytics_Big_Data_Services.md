# Tài Liệu Học Tập Chuyên Sâu: AWS Analytics & Big Data Services (Athena, Glue, EMR, Kinesis, Redshift, OpenSearch, QuickSight)

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Principal AWS Solutions Architect & Senior Big Data Engineer (Cập nhật phiên bản kiến trúc mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt chuyên ngành (Bảo lưu toàn bộ thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Mục tiêu**: Phục vụ thi chứng chỉ cấp độ Professional/Specialty (**SAA-C03, SAP-C02, Data Engineer Associate DEA-C01**) và thiết kế Data Lake / Data Warehouse cấp độ doanh nghiệp (**Production-grade**).  
> **Các bài giảng liên quan**: Chương 17 (Decoupling & Kinesis), Chương 22 (Data & Analytics) & Chương 32 (Preparing for the Exam).

---

## 6.1. Tổng Quan Dịch Vụ (Service Overview)

### 1. Định nghĩa chuẩn xác và Phân nhóm dịch vụ
Hệ sinh thái **AWS Analytics & Big Data** cung cấp đầy đủ các khối xây dựng (Building Blocks) từ thu nhận dữ liệu thời gian thực (Ingestion), lưu trữ Data Lake, trích xuất và biến đổi (ETL), lưu trữ kho dữ liệu (Data Warehousing), tìm kiếm phân tích (Search & Observability), đến trực quan hóa thông minh (Business Intelligence).

```mermaid
flowchart LR
    subgraph Ingestion["1. Thu Nhận Dữ Liệu (Ingestion)"]
        KDS[Amazon Kinesis Data Streams\nThời gian thực < 1s, Shards, Replay]
        KDF[Amazon Data Firehose\nNear real-time 60s, Ghi trực tiếp S3/Redshift]
        MSK[Amazon MSK\nApache Kafka Managed cluster]
    end

    subgraph StorageLake["2. Data Lake & Catalog"]
        S3[(Amazon S3 Data Lake\nLưu trữ đối tượng trung tâm)]
        GlueCat[AWS Glue Data Catalog\nMetadata Schema Registry]
    end

    subgraph ProcessingETL["3. Xử Lý & Chuyển Đổi (ETL)"]
        GlueJob[AWS Glue ETL Jobs\nServerless Spark / Python]
        EMR[Amazon EMR\nHadoop, Spark, Trino, Instance Fleets]
    end

    subgraph WarehouseAnalytics["4. Phân Tích & Kho Dữ Liệu"]
        Athena[Amazon Athena\nServerless SQL truy vấn trực tiếp trên S3]
        Redshift[(Amazon Redshift Serverless\nColumnar Data Warehouse PB-scale)]
        OpenSearch[Amazon OpenSearch\nTìm kiếm toàn văn & Log Analytics]
    end

    subgraph BI["5. Trực Quan Hóa (BI)"]
        QS[Amazon QuickSight\nServerless BI Dashboard & SPICE]
    end

    Ingestion --> StorageLake
    StorageLake --> ProcessingETL
    ProcessingETL --> StorageLake
    StorageLake --> WarehouseAnalytics
    WarehouseAnalytics --> BI
```

---

### 2. Bài toán cốt lõi mà từng dịch vụ Analytics giải quyết

1. **Amazon Athena**: Truy vấn phân tích ad-hoc phi máy chủ (Serverless SQL) trực tiếp trên hàng Petabytes dữ liệu lưu trữ tại Amazon S3 bằng ngôn ngữ Presto/Trino chuẩn ANSI SQL mà hoàn toàn không cần nạp dữ liệu hay khởi tạo máy chủ.
2. **AWS Glue**: Dịch vụ ETL (Extract, Transform, Load) hoàn toàn Serverless. Sử dụng **Glue Crawlers** để tự động quét schema và đăng ký vào **Glue Data Catalog**, kết hợp **Glue ETL Jobs** chạy Apache Spark tự động co giãn theo DPUs (Data Processing Units).
3. **Amazon EMR (Elastic MapReduce)**: Cung cấp môi trường cụm tính toán Big Data phân tán tiêu chuẩn công nghiệp (Apache Spark, Hive, Presto, Flink, HBase) với khả năng co giãn hàng ngàn máy ảo EC2 On-Demand/Spot tối ưu chi phí tới 90%.
4. **Amazon Kinesis Data Streams (KDS)**: Tiếp nhận và xử lý luồng dữ liệu streaming thời gian thực (Real-time Latency < 1s) với cơ chế phân đoạn (Shards), lưu giữ tin nhắn (Retention 24h - 365 ngày), hỗ trợ nhiều consumer độc lập qua **Enhanced Fan-Out**.
5. **Amazon Data Firehose (formerly Kinesis Firehose)**: Đường ống nạp dữ liệu Near Real-time (đệm tối thiểu 60s hoặc 1MB) hoàn toàn Serverless; tự động chuyển đổi định dạng (JSON sang Parquet/ORC) và đẩy thẳng vào S3, Redshift, OpenSearch, Splunk.
6. **Amazon Redshift**: Kho dữ liệu đám mây (Data Warehouse) lưu trữ theo cột (Columnar Storage), tối ưu cho các truy vấn phân tích phức tạp (OLAP), nạp dữ liệu từ S3 qua lệnh `COPY`, và hỗ trợ **Redshift Spectrum** để join bảng trong data warehouse với file trên S3 Data Lake.
7. **Amazon OpenSearch Service**: Dịch vụ tìm kiếm phân tích và hiển thị log thời gian thực (Logstash/Fluentbit $\rightarrow$ OpenSearch $\rightarrow$ OpenSearch Dashboards).

---

### 3. Khi nào KHÔNG nên dùng (Anti-patterns & Giải pháp thay thế)

* ❌ **Xử lý streaming thời gian thực dưới 1 giây mà dùng Data Firehose hoặc Glue ETL**: Firehose có buffer interval tối thiểu 60 giây; Glue ETL khởi chạy theo batch mất vài phút.  
  👉 *Giải pháp thay thế*: Sử dụng **Amazon Kinesis Data Streams** hoặc **Amazon MSK**.
* ❌ **Giao dịch thanh toán trực tuyến (OLTP) có hàng ngàn câu lệnh INSERT/UPDATE nhỏ lẻ chạy trên Amazon Redshift**: Redshift được tối ưu cho đọc theo cột (Columnar OLAP), thao tác ghi đơn lẻ sẽ làm nghẽn vacuum và phân mảnh disk.  
  👉 *Giải pháp thay thế*: Sử dụng **Amazon Aurora** hoặc **Amazon DynamoDB**.
* ❌ **Truy vấn lặp đi lặp lại hàng triệu lần mỗi ngày trên S3 bằng Athena**: Athena tính phí $5.00 cho mỗi Terabyte dữ liệu quét qua đĩa (Scanned data).  
  👉 *Giải pháp thay thế*: Nạp dữ liệu vào **Amazon Redshift** hoặc **Amazon DynamoDB** / **ElastiCache**.

---

## 6.2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts & Operations)

### 1. Kinesis Data Streams vs Data Firehose vs SQS

| Tiêu chí | Amazon Kinesis Data Streams (KDS) | Amazon Data Firehose | Amazon SQS (Standard/FIFO) |
| :--- | :--- | :--- | :--- |
| **Bản chất** | Streaming Ingestion (Luồng dữ liệu liên tục) | Delivery Stream (Nạp dữ liệu vào Storage) | Message Queue (Hàng đợi thông điệp) |
| **Độ trễ (Latency)** | **Thời gian thực (< 200 - 1,000 ms)** | **Gần thời gian thực (60 - 900 giây)** | Thời gian thực (mili-giây) |
| **Quản trị năng lực** | Provisioned (Shards) hoặc On-Demand | **Serverless hoàn toàn (Tự co giãn)** | **Serverless hoàn toàn (Tự co giãn)** |
| **Lưu trữ & Replay** | Lưu từ 24 giờ đến 365 ngày; **cho phép Replay** | **Không lưu trữ** (chỉ chuyển tiếp dữ liệu) | Lưu tối đa 14 ngày; **xóa sau khi đọc** |
| **Đích đến (Targets)** | Kinesis Client App (KCL), Lambda, Flink | **Amazon S3, Redshift, OpenSearch, HTTP** | EC2, Lambda, ECS Workers |
| **Nhiều Consumers** | Hỗ trợ nhiều Consumer đọc song song độc lập | Chỉ đẩy vào 1 đích đến cấu hình | 1 tin nhắn chỉ tiêu thụ bởi 1 worker |

---

### 2. Tối Ưu Hóa Chi Phí & Hiệu Năng Amazon Athena

Athena tính phí dựa trên **dung lượng dữ liệu quét qua đĩa S3 ($5/TB scanned)**:
1. **Chuyển đổi sang định dạng cột (Columnar Format - Parquet hoặc ORC)**:
   - File CSV thô kích thước 1 TB $\rightarrow$ Chuyển sang Apache Parquet chỉ còn ~130 GB (nén gzip/snappy).
   - Khi chạy câu lệnh `SELECT customer_id, total_amount FROM orders`, Athena **chỉ đọc 2 cột cần thiết** thay vì đọc toàn bộ các dòng $\rightarrow$ Quét chỉ 5 GB $\rightarrow$ **Tiết kiệm 99% chi phí và tốc độ nhanh gấp 10 lần**!
2. **Phân vùng dữ liệu (Partitioning)**:
   - Đặt đường dẫn theo cấu trúc Hive: `s3://my-bucket/logs/year=2026/month=11/day=04/`.
   - Khi truy vấn `WHERE year=2026 AND month=11`, Athena sẽ bỏ qua toàn bộ dữ liệu của các tháng khác.
3. **Kích thước file tối ưu**:
   - Tránh tình trạng hàng triệu file nhỏ vài Kilobytes (gây nghẽn metadata); gộp file thành kích thước chuẩn **128 MB đến 512 MB**.

---

### 3. Cụm Amazon EMR: Instance Groups vs Instance Fleets

```mermaid
flowchart TD
    EMRCluster[Cụm Amazon EMR] --> Master[Master Node: Quản lý cụm & NameNode\nBắt buộc chạy On-Demand hoặc Reserved Instance]
    EMRCluster --> Core[Core Nodes: Chứa HDFS Data & Task\nChạy On-Demand để bảo toàn an toàn dữ liệu HDFS]
    EMRCluster --> Task[Task Nodes: Chỉ tính toán, không lưu HDFS\nLý tưởng chạy 100% EC2 Spot Instances để giảm 90% chi phí]
```

* **EMR Instance Groups**: Cấu hình truyền thống; mỗi nhóm node (Master, Core, Task) bị khóa vào **1 Availability Zone duy nhất** và 1 loại EC2 instance type cố định. Khi AZ hết dung lượng Spot, cụm EMR sẽ thất bại.
* **EMR Instance Fleets**: Cấu hình hiện đại; cho phép khai báo **danh sách nhiều Subnets đa AZ** và **lựa chọn lên tới 30 instance types thay thế**. EMR tự động chọn AZ có sẵn tài nguyên Spot để khởi chạy, triệt tiêu lỗi thiếu dung lượng.

---

## 6.3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### Sơ Đồ Quy Trình Data Lake & Serverless Analytics Toàn Diện

```mermaid
sequenceDiagram
    autonumber
    participant Source as IoT Devices / Clickstream
    participant KDS as Kinesis Data Streams
    participant Firehose as Data Firehose
    participant S3Raw as S3 Raw Zone (JSON)
    participant GlueCrawler as AWS Glue Crawler
    participant GlueCatalog as Glue Data Catalog
    participant GlueETL as AWS Glue ETL Job (Spark)
    participant S3Curated as S3 Curated Zone (Parquet)
    participant Athena as Amazon Athena
    participant Redshift as Amazon Redshift
    participant QuickSight as Amazon QuickSight

    Source->>KDS: 1. Đẩy 50,000 events/giây thời gian thực
    KDS->>Firehose: 2. Gom nhóm tin nhắn và đệm (Buffer 300s / 5MB)
    Firehose->>S3Raw: 3. Ghi file JSON nén vào s3://my-data-lake/raw/
    
    GlueCrawler->>S3Raw: 4. Quét định kỳ phát hiện schema mới
    GlueCrawler->>GlueCatalog: 5. Tạo/cập nhật Metadata Table Definitions
    
    GlueETL->>S3Raw: 6. Đọc dữ liệu thô, làm sạch, loại trùng lặp
    GlueETL->>S3Curated: 7. Ghi dữ liệu đã tối ưu hóa dạng nén Parquet phân vùng theo ngày
    
    Athena->>S3Curated: 8. Phân tích ad-hoc SQL nhanh qua Glue Catalog ($5/TB)
    Redshift->>S3Curated: 9. Chạy lệnh COPY nạp dữ liệu vào Redshift Serverless
    QuickSight->>Redshift: 10. Nạp dữ liệu vào SPICE Engine vẽ Dashboard phục vụ Ban Giám Đốc
```

---

## 6.4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Dịch vụ liên kết | Phương thức tích hợp | Mục đích kỹ thuật & Kịch bản áp dụng |
| :--- | :--- | :--- |
| **Amazon S3** | S3 Event Notifications / Direct Storage | Đóng vai trò Data Lake trung tâm; nạp dữ liệu từ Firehose, Glue, EMR, Athena. |
| **AWS KMS** | Customer Managed Key (CMK) | Mã hóa dữ liệu At-Rest trên S3, Glue Data Catalog, Kinesis Streams, Redshift. |
| **AWS Step Functions** | Service Integration (`arn:aws:states:::glue:startJobRun`) | Điều phối quy trình Data Pipeline nhiều bước (Crawler $\rightarrow$ ETL Job $\rightarrow$ Athena Query). |
| **Amazon EventBridge** | Event Patterns | Bắt sự kiện khi Glue Job chạy thành công (`SUCCEEDED`) hoặc thất bại (`FAILED`) để kích hoạt thông báo SNS. |
| **Amazon CloudWatch** | Metrics & Logs | Giám sát `GetRecords.IteratorAgeMilliseconds` trên Kinesis để phát hiện consumer bị chậm. |
| **AWS IAM** | Service Role | Cấp quyền cho Glue truy cập S3 bucket, cấp quyền cho Redshift truy cập S3 qua Spectrum. |

---

## 6.5. Bảng So Sánh Các Dịch Vụ Phân Tích Dữ Liệu (Ecosystem Comparison)

| Dịch vụ | Loại kiến trúc | Khối lượng dữ liệu tối ưu | Tốc độ phản hồi truy vấn | Chi phí & Quản trị |
| :--- | :--- | :--- | :--- | :--- |
| **Amazon Athena** | Serverless SQL Query Engine | TB đến PB trên S3 | Vài giây đến vài phút | $5/TB dữ liệu quét; Zero infrastructure management |
| **Amazon Redshift** | Massively Parallel (MPP) Data Warehouse | Hàng chục TB đến hàng chục PB | **Mili-giây đến vài giây** (rất nhanh cho OLAP) | Tính theo RPU (Serverless) hoặc Node giờ; tối ưu cho truy vấn phức tạp lặp lại |
| **Amazon EMR** | Distributed Computing Cluster (Hadoop/Spark) | Hàng chục PB đến EB | Tùy tác vụ xử lý hàng giờ | Tính theo EC2 instance + EMR license/giờ; kiểm soát 100% cấu hình Spark/YARN |
| **Amazon OpenSearch** | Distributed Search Engine (Lucene) | GB đến hàng chục TB | **Mili-giây** | Tìm kiếm văn bản đầy đủ (Full-text), lọc log, Kibana Dashboard |

---

## 6.6. FinOps & Chiến Lược Tối Ưu Chi Phí (Cost Optimization)

### 1. Phép tính so sánh: Truy vấn Athena trên CSV thô vs Parquet
* **Bối cảnh**: Doanh nghiệp lưu trữ 100 TB dữ liệu log truy cập web thô dạng CSV trên S3. Mỗi ngày đội BI chạy 10 câu lệnh SQL truy vấn tổng hợp 3 cột (`request_time`, `user_id`, `status_code` chiếm khoảng 8% dung lượng file).
  $$\text{Chi phí nếu để file CSV} = 10 \text{ queries} \times 100 \text{ TB} \times 5\$ = \mathbf{5,000\$/\text{ngày}} \quad (\approx \mathbf{150,000\$/\text{tháng}})$$
* **Chiến lược tối ưu hóa**:
  1. Sử dụng AWS Glue ETL Job chuyển đổi toàn bộ dữ liệu CSV sang **Apache Parquet (nén Snappy)**. Kích thước nén giảm từ 100 TB xuống còn 20 TB.
  2. Phân vùng (Partitioning) theo `year/month/day`.
  3. Khi Athena truy vấn Parquet, dịch vụ **chỉ quét 3 cột tương ứng = 1.6 TB dữ liệu** thay vì toàn bộ 100 TB:
  $$\text{Chi phí sau tối ưu} = 10 \text{ queries} \times 1.6 \text{ TB} \times 5\$ = \mathbf{80.00\$/\text{ngày}} \quad (\approx \mathbf{2,400\$/\text{tháng}})$$
* **Khoản tiền tiết kiệm**: Tiết kiệm hơn **$147,600/tháng (giảm 98.4% chi phí)**!

---

## 6.7. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Vấn đề (Problem) | Nguyên nhân khả dĩ (Possible Causes) | Các bước điều tra (Investigation Steps) | Giải pháp xử lý (Solution) | Biện pháp phòng ngừa (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Kinesis: Consumer bị chậm, dữ liệu bị dồn ứ** | Metric `GetRecords.IteratorAgeMilliseconds` tăng vọt liên tục do consumer xử lý không kịp tốc độ đẩy dữ liệu vào Shard. | Kiểm tra CloudWatch metric `IteratorAgeMilliseconds` và CPU của worker instance. | 1. Tăng số lượng Shards (Resharding/Split Shard).<br>2. Bật tính năng **Enhanced Fan-Out** với HTTP/2 Push chuyên dụng cho consumer. | Cấu hình Auto Scaling cho Kinesis Data Streams. |
| **Kinesis: Lỗi `ProvisionedThroughputExceededException`** | Producer đẩy dữ liệu vượt quá giới hạn 1 MB/s hoặc 1,000 records/s trên một Shard cụ thể (Hot Shard do chọn Partition Key kém). | Xem metric `PutRecords.ThrottledRecords` trên CloudWatch. | 1. Thay đổi thuật toán chọn Partition Key có độ ngẫu nhiên cao (phân bổ đều).<br>2. Chuyển Kinesis sang **On-Demand Capacity Mode**. | Áp dụng Exponential Backoff with Jitter trong mã nguồn Producer. |
| **Athena: Truy vấn bị Timeout hoặc lỗi `Query exhausted resources`** | Câu truy vấn `JOIN` quá nhiều bảng lớn chưa được phân vùng hoặc bảng chứa hàng triệu file rác kích thước nhỏ. | Xem Execution Plan trong Athena Query History và dung lượng quét. | 1. Thêm điều kiện `WHERE` trên các cột phân vùng (`partition keys`).<br>2. Chạy Glue Job gộp các file nhỏ thành các file lớn 128MB. | Định kỳ chạy tác vụ compact file trên Data Lake. |
| **EMR: Node Spot bị thu hồi làm hỏng cả Job tính toán** | Đặt Core Nodes trên EC2 Spot Instances. Khi AWS thu hồi Spot, dữ liệu block HDFS bị mất gây sập cụm Hadoop. | Xem log YARN ResourceManager trên Master Node. | **QUY TẮC SỐNG CÒN**: Core Nodes bắt buộc phải chạy **EC2 On-Demand**; chỉ đặt Task Nodes trên Spot Instances! | Sử dụng EMR Instance Fleets với đa dạng Spot pools. |

---

## 🏛️ I. Các Kịch Bản Kiến Trúc Chuẩn (Best Practice Scenarios)

#### 1. Xử Lý Luồng Dữ Liệu Thời Gian Thực Bằng Kinesis Data Streams & Enhanced Fan-Out — (CM-PT1 Q43)
- **Tình huống thi**: Hệ thống tài chính tiếp nhận hàng trăm ngàn giao dịch/giây. Có 5 ứng dụng độc lập (Fraud Detection, Ledger, Real-time Dashboard, Alerting, S3 Archival) cần đọc đồng thời cùng một luồng dữ liệu mà không làm chậm lẫn nhau và độ trễ phải dưới 1 giây.
- **Giải pháp tối ưu chuẩn AWS**:
  - Triển khai **Amazon Kinesis Data Streams**.
  - Kích hoạt tính năng **Enhanced Fan-Out (EFO)** cho cả 5 consumer applications.
  - Mỗi consumer nhận được một đường truyền băng thông riêng biệt **2 MB/s trên mỗi Shard** thông qua giao thức HTTP/2 push (thay vì polling chia sẻ 2 MB/s chung của chuẩn Standard Consumer), giảm độ trễ đọc xuống dưới 70 mili-giây.

#### 2. Phân Tích Dữ Liệu Lớn Tải Đột Biến Không Thường Xuyên Với Redshift Serverless — (CM-PT1 Q45)
- **Tình huống thi**: Doanh nghiệp cần chạy các báo cáo phân tích tài chính phức tạp vào cuối mỗi tuần hoặc cuối tháng (Intermittent & Spiky Workloads). Thời gian còn lại hệ thống hoàn toàn nhàn rỗi. Ban giám đốc yêu cầu giải pháp tối ưu chi phí tối đa.
- **Giải pháp chuẩn**:
  - Triển khai **Amazon Redshift Serverless**.
  - Dịch vụ tự động cấp phát năng lực tính toán theo đơn vị RPU (Redshift Processing Units) khi có truy vấn phức tạp và tự động co về 0 khi không có tải.
  - Loại bỏ hoàn toàn chi phí duy trì cụm máy chủ Redshift Provisioned chạy lãng phí 24/7.

---

## 🪤 II. Các Bẫy Thi Tinh Vi & Phân Tích Phương Án Sai (Exam Traps & Distractors)

#### 🪤 Bẫy 1: Real-Time Streaming (< 1s) vs Near Real-Time Delivery (60s) — (CM-PT3 Q02, CM-PT6 Q19)
- **Tình huống đề thi**: *"Hệ thống yêu cầu phát hiện bất thường và kích hoạt cảnh báo trong vòng chưa đầy 1 giây kể từ khi sự kiện xảy ra từ các thiết bị IoT."*
- **Các phương án bẫy**:
  - ❌ *Dùng Amazon Data Firehose (Kinesis Firehose)*: Firehose có cơ chế đệm bắt buộc (Buffer interval tối thiểu 60 giây), không thể đáp ứng yêu cầu dưới 1 giây!
  - ❌ *Dùng AWS Glue ETL*: Là giải pháp batch theo lô, mất vài phút khởi động.
- **Giải pháp ĐÚNG**: **Amazon Kinesis Data Streams** kết hợp **AWS Lambda** hoặc Amazon Managed Service for Apache Flink.

#### 🪤 Bẫy 2: Phân Tích Dữ Liệu Lớn Trên EMR: Instance Groups vs Instance Fleets — (CM-PT2 Q26, CM-PT6 Q43)
- **Tình huống đề thi**: *"Khởi chạy cụm Amazon EMR trên các máy ảo EC2 Spot trải dài trên nhiều Subnets để tiết kiệm chi phí, nhưng thường xuyên gặp lỗi thiếu Spot capacity tại một số AZ."*
- **Giải pháp ĐÚNG**: Sử dụng **EMR Instance Fleets configuration** (thay vì Instance Groups).
  - Instance Fleets cho phép định nghĩa nhiều subnets đa AZ và tới 30 instance types thay thế, EMR tự động chọn AZ có capacity Spot dồi dào để launch.

#### 🪤 Bẫy 3: Tiền Xử Lý Dữ Liệu Cho Mô Hình Học Máy Quy Mô Lớn: Glue vs SageMaker — (CM-PT1 Q59)
- **Tình huống đề thi**: *"Tập dữ liệu huấn luyện học máy có kích thước hàng chục Terabytes chứa nhiều dữ liệu rác và thiếu trường thông tin. Cần tiền xử lý và làm sạch dữ liệu phân tán quy mô lớn trước khi đưa vào đào tạo mô hình."*
- **Giải pháp ĐÚNG**: Sử dụng **AWS Glue ETL Jobs (Serverless Spark)** để làm sạch, trích xuất và chuẩn hóa dữ liệu lưu vào S3, sau đó nạp vào **Amazon SageMaker** để huấn luyện mô hình.

---

## 📊 III. Ma Trận Quyết Định Công Nghệ Phân Tích Nhanh (Exam Decision Matrix)

| Tình huống / Yêu cầu trong đề thi | Giải pháp chuẩn AWS | Giải pháp bị loại & Lý do |
|:---|:---|:---|
| **Truy vấn SQL ad-hoc trực tiếp trên S3, không quản lý server** | **Amazon Athena** | Amazon Redshift (quá tốn kém cho truy vấn ad-hoc thỉnh thoảng) |
| **Kho dữ liệu phân tích phức tạp OLAP, PB-scale** | **Amazon Redshift (Serverless)** | Amazon RDS (chỉ tối ưu cho OLTP, nghẽn khi chạy OLAP lớn) |
| **Xử lý luồng thời gian thực < 1s, replay dữ liệu** | **Amazon Kinesis Data Streams** | Amazon Data Firehose (độ trễ đệm tối thiểu 60s) |
| **Nạp dữ liệu liên tục thẳng vào S3/Redshift/OpenSearch** | **Amazon Data Firehose** | Tự viết code worker đọc Kinesis đẩy S3 (tốn công) |
| **Nhiều ứng dụng đọc độc lập cùng luồng Kinesis không chậm** | **Kinesis Enhanced Fan-Out (EFO)** | Standard Consumer (bị giới hạn chia sẻ 2MB/s/shard) |
| **Cụm Hadoop/Spark tính toán lớn với Spot đa AZ** | **Amazon EMR Instance Fleets** | EMR Instance Groups (bị khóa trong 1 AZ duy nhất) |
| **Quét schema dữ liệu tự động cho Data Lake** | **AWS Glue Crawlers + Data Catalog** | Định nghĩa schema thủ công trong Athena (dễ lỗi) |
| **Trực quan hóa Dashboard BI Serverless tích hợp native** | **Amazon QuickSight (SPICE)** | Tự dựng máy chủ Tableau/Grafana trên EC2 |

---

## 6.8. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Kiến Trúc "Sống Còn" Của AWS Analytics
1. **Nguyên tắc định dạng Data Lake**: Luôn chuyển đổi file thô sang định dạng cột nén **Apache Parquet** và phân vùng theo ngày tháng để giảm 90% chi phí Athena.
2. **Quy tắc phân biệt Kinesis**: Cần $< 1\text{s}$ hoặc replay $\rightarrow$ Kinesis Data Streams. Cần nạp thẳng S3/Redshift không quản lý shard $\rightarrow$ Data Firehose.
3. **Quy tắc Enhanced Fan-Out**: Khi có $\ge 3$ consumers cùng đọc Kinesis Shard hoặc cần độ trễ $< 100\text{ms}$ $\rightarrow$ Bật Enhanced Fan-Out.
4. **Quy tắc Core Nodes trên EMR**: Master & Core Nodes luôn chạy **On-Demand**; chỉ Task Nodes chạy **EC2 Spot**.
5. **Redshift Spectrum**: Cho phép query trực tiếp file trên S3 mà không cần nạp vào ổ đĩa Redshift, kết hợp bảng trong kho dữ liệu với bảng ngoài Data Lake.
6. **Glue Data Catalog làm kho Metadata trung tâm**: Được chia sẻ dùng chung liền mạch giữa Athena, EMR, Redshift Spectrum và SageMaker.
7. **Redshift Serverless cho tải gián đoạn**: Workload phân tích theo chu kỳ tuần/tháng nên chọn Serverless để co về 0 RPU khi nhàn rỗi.

---

### Liên Kết Nội Bộ và Tài Liệu Tham Khảo (Internal Links)
- 📖 [Ghi Chú Bài Học Chương 17: Decoupling & Kinesis](../Lesson_Notes/17_Decoupling_SQS_SNS_Kinesis.md)
- 📖 [Ghi Chú Bài Học Chương 22: Data & Analytics](../Lesson_Notes/22_Data_and_Analytics.md)
- 📖 [Tài Liệu Chuyên Sâu: Amazon S3 & CloudFront](./S3_and_CloudFront_Storage.md)
- 📖 [Cẩm Nang Từ Vựng Giải Mã Đề Thi](../EXAM_VOCABULARY.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật Đám Mây](../GLOSSARY.md)

