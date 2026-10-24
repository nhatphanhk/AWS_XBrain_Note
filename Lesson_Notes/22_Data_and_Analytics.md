# Ghi Chú Bài Học: Chương 22 - Dữ Liệu Lớn & Nền Tảng Phân Tích (Data & Analytics)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 22 - Data & Analytics (Bài 240 đến Bài 251)  
> **Tài liệu tham chiếu liên quan**: [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](file:///n:/AWS_XBrain_Note/GLOSSARY.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này trang bị bức tranh toàn cảnh về kiến trúc xử lý dữ liệu lớn (Big Data) và phân tích trên AWS: công cụ truy vấn SQL phi máy chủ trên S3 **Amazon Athena**, kho dữ liệu dạng cột hiệu năng cao **Amazon Redshift**, công cụ tìm kiếm và phân tích log toàn văn **Amazon OpenSearch Service** (trước đây là Elasticsearch), nền tảng tính toán phân tán cụm Hadoop/Spark **Amazon EMR**, công cụ trực quan hóa báo cáo BI (Business Intelligence) **Amazon QuickSight**, dịch vụ trích xuất và biến đổi dữ liệu phi máy chủ **AWS Glue** (Glue Data Catalog, Glue Crawlers, Glue ETL), dịch vụ quản trị Data Lake **AWS Lake Formation**, xử lý luồng thời gian thực **Amazon Managed Service for Apache Flink**, dịch vụ cụm Kafka được quản lý **Amazon MSK**, và thiết kế một **Big Data Ingestion Pipeline** hoàn chỉnh.

### Mục tiêu học tập
1. Hiểu cách chạy các câu lệnh SQL trực tiếp trên các file CSV/JSON/Parquet trong S3 bằng Amazon Athena.
2. Nắm vững kiến trúc Data Warehouse dạng cột của Amazon Redshift và tính năng Redshift Serverless.
3. Sử dụng Amazon OpenSearch để tìm kiếm văn bản và trực quan hóa phân tích log qua OpenSearch Dashboards.
4. Hiểu vai trò của AWS Glue Data Catalog trong việc tự động suy luận lược đồ (Schema Discovery) và chuẩn bị dữ liệu cho Data Lake.
5. Thiết kế đường ống thu thập và phân tích dữ liệu lớn thời gian thực (Kinesis ➔ Firehose ➔ S3 ➔ Glue ➔ Athena ➔ QuickSight).

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Amazon Athena**: Serverless interactive query engine; dùng chuẩn SQL; truy vấn trực tiếp trên S3; tính tiền theo dung lượng dữ liệu quét (**5 USD / 1 TB dữ liệu quét**). **Mẹo tối ưu chi phí**: Nén file và chuyển sang định dạng dạng cột (**Apache Parquet hoặc ORC**) để giảm 90% dung lượng quét.
2. **Amazon Redshift**: Kho dữ liệu doanh nghiệp (OLAP Data Warehouse); lưu trữ dạng cột (Columnar Storage); tích hợp **Redshift Spectrum** (cho phép chạy SQL kết hợp dữ liệu trong Redshift cluster và dữ liệu lưu ngoài S3).
3. **AWS Glue**: Dịch vụ Serverless ETL (Extract, Transform, Load):
   - *Glue Crawler*: Tự động quét file trên S3 để phát hiện schema và ghi vào **Glue Data Catalog**.
   - *Glue Data Catalog*: Danh bạ metadata tập trung được chia sẻ chung cho Athena, EMR, Redshift Spectrum.
4. **Amazon EMR (Elastic MapReduce)**: Dành cho xử lý dữ liệu Big Data cực lớn bằng các công nghệ mã nguồn mở (Apache Spark, Hadoop, Presto, Hive).
5. **Amazon QuickSight**: Dịch vụ BI Serverless tạo dashboard, tích hợp thuật toán học máy phát hiện bất thường (Anomaly Detection) và tính năng hỏi đáp tự nhiên (QuickSight Q).

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [240 - Athena.md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/240%20-%20Athena.md)
  - [242 - Redshift.md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/242%20-%20Redshift.md)
  - [243 - OpenSearch (ex_ ElasticSearch).md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/243%20-%20OpenSearch%20(ex_%20ElasticSearch).md)
  - [244 - EMR.md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/244%20-%20EMR.md)
  - [245 - QuickSight.md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/245%20-%20QuickSight.md)
  - [246 - Glue.md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/246%20-%20Glue.md)
  - [251 - Big Data Ingestion Pipeline.md](file:///n:/AWS_XBrain_Note/AWS_Resources/22%20-%20Data%20&%20Analytics/251%20-%20Big%20Data%20Ingestion%20Pipeline.md)
