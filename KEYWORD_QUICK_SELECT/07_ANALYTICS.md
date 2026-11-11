# 07 — ANALYTICS KEYWORDS: Athena, Glue, Redshift, EMR, Lake Formation

---

## 🔎 ANALYTICS SERVICE CHEAT SHEET

```
Serverless SQL query on S3 files              → Amazon Athena (\$5/TB scanned)
Visual data prep, no-code, business analysts  → AWS Glue DataBrew
ETL pipeline with code (Python/Spark)         → AWS Glue ETL Jobs
Manage Hadoop/Spark cluster, Spot nodes       → Amazon EMR
Data warehouse, OLAP, petabyte SQL            → Amazon Redshift
Query S3 from Redshift cluster                → Redshift Spectrum
Full-text search, log analytics, Kibana       → Amazon OpenSearch Service
IoT time-series events, sensor telemetry      → Amazon Timestream
Data Lake governance, fine-grained access     → AWS Lake Formation
Bulk SaaS → S3/Redshift (no code)            → Amazon AppFlow
Real-time stream processing                   → Kinesis Data Analytics (Managed Flink)
```

---

## 📊 ATHENA — SERVERLESS SQL ON S3

| Topic | Detail |
|:---|:---|
| **Cost** | \$5 per TB scanned |
| **Optimize cost** | Use **Parquet or ORC** format (columnar, 70-85% less scan) |
| **Optimize further** | **Partitioning** by date/region (reduces scan volume) |
| **Federated query** | Query RDS, DynamoDB, Redshift using **Athena Federated Query** (Lambda connectors) |
| **Performance** | Use **Athena CTAS** (Create Table As Select) to convert CSV → Parquet |
| **Alternative** | **S3 Select** = filter within single object (cheaper, single-file only) |

> ⚠️ **Athena vs Redshift**: Athena = serverless, ad-hoc queries on S3; Redshift = data warehouse, complex OLAP  
> If question says "existing Redshift cluster query S3 Data Lake" → **Redshift Spectrum**

---

## 🔧 GLUE — ETL & DATA CATALOG

| Feature | Detail |
|:---|:---|
| **Glue Crawlers** | Discover schema, populate **Glue Data Catalog** |
| **Glue ETL Jobs** | PySpark / Python shell; transform data; needs code |
| **Glue DataBrew** | **Visual no-code** transforms; 250+ built-in recipes; for business analysts |
| **Glue Data Catalog** | Central metadata store; used by Athena, Redshift Spectrum, EMR |
| **Glue Streaming** | Continuous ETL from Kinesis / Kafka |

**Keyword decision**:  
- "no-code data preparation" → **Glue DataBrew**  
- "automated ETL pipeline with custom logic" → **Glue ETL Jobs**  
- "discover schema from S3/RDS automatically" → **Glue Crawler**

---

## 🏭 AMAZON EMR — MANAGED HADOOP/SPARK

| Node Type | Role | Use Spot? |
|:---|:---|:---|
| **Master Node** | Coordinate cluster, track tasks | ❌ (critical) |
| **Core Nodes** | Run tasks + store HDFS data | ⚠️ Limited Spot (data risk) |
| **Task Nodes** | Run tasks only (no HDFS) | ✅ **Spot-safe** (no data loss if terminated) |

> ✅ **Cost optimization**: Put Task Nodes on Spot Instances to reduce EMR costs by 70%+  
> ⚠️ **Glue vs EMR**: Glue = serverless, managed, less customization; EMR = full Hadoop control, custom configs

---

## 🏢 AMAZON REDSHIFT — DATA WAREHOUSE

| Feature | Detail |
|:---|:---|
| **Redshift Serverless** | Auto-scales RPU; pay per use; intermittent workloads |
| **Redshift Spectrum** | Query S3 files using Redshift cluster (no data load) |
| **Concurrency Scaling** | Auto-add read capacity for spike queries (free credits) |
| **AQUA** | Hardware-accelerated query cache (10x faster) |
| **Distribution styles** | EVEN (default), KEY (join optimization), ALL (small tables) |
| **Sort Keys** | Optimize range queries and JOINs |

---

## 🏛️ LAKE FORMATION — DATA LAKE GOVERNANCE

| Feature | Detail |
|:---|:---|
| **Purpose** | Build secure Data Lake on S3; centralize access control |
| **Fine-grained control** | Column-level, row-level permissions (not just bucket-level) |
| **Integrates with** | Athena, Redshift Spectrum, EMR, Glue |
| **Multi-account** | Grant cross-account access without copying data |
| **Keyword** | "column-level access control", "Data Lake governance", "fine-grained permissions" |

---

## 🔍 AMAZON OPENSEARCH SERVICE

| Use Case | Keyword |
|:---|:---|
| Full-text search engine | "full-text search", "fuzzy search", "search box" |
| Log analytics + Kibana/OpenSearch Dashboards | "log aggregation + visualization", "centralized logs" |
| Clickstream analysis | "user behavior analytics" |
| Combined with DynamoDB | DynamoDB Streams → Lambda → OpenSearch (search over DynamoDB) |

---

## 🤖 AI & ML SERVICES QUICK GUIDE

| Service | Purpose | Keyword Trigger |
|:---|:---|:---|
| **Amazon Textract** | OCR: extract text, tables, forms from PDF/images | "scanned PDF", "invoice", "form extraction", "OCR" |
| **Amazon Comprehend** | NLP: sentiment, entities, language detection | "sentiment analysis", "PII text extraction", "NLP" |
| **Amazon Rekognition** | Image/video: labels, faces, celebrities, moderation | "image recognition", "face detection", "video analysis" |
| **Amazon Transcribe** | Speech-to-text, subtitles | "audio to text", "meeting transcription" |
| **Amazon Polly** | Text-to-speech, 60+ voices | "text to audio", "TTS", "voice narration" |
| **Amazon Translate** | Neural machine translation | "translate text", "multi-language" |
| **Amazon Personalize** | Real-time personalized recommendations | "recommendations", "personalized content" |
| **Amazon Forecast** | Time-series forecasting | "predict demand", "sales forecast" |
| **Amazon Kendra** | Intelligent enterprise search | "enterprise search", "document Q&A" |
| **Amazon Lex** | Conversational AI, chatbots (Alexa engine) | "chatbot", "IVR", "voice bot" |
| **Amazon SageMaker** | Full ML platform (build, train, deploy) | "custom ML model", "train neural network" |

> ⚠️ **Textract vs Comprehend**:  
> Textract = **OCR** (extract structure from images/PDFs)  
> Comprehend = **NLP** (understand meaning in text)

