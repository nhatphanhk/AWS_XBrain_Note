# Tài Liệu Học Tập Chuyên Sâu: Amazon CloudWatch, AWS CloudTrail & AWS Config (Hệ Thống Quan Sát, Kiểm Toán & Quản Trị Tuân Thủ)

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Senior AWS Solutions Architect & Cloud DevOps Engineer (cập nhật mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt (Bảo lưu toàn bộ thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Các dịch vụ liên quan**: Amazon CloudWatch, AWS CloudTrail, AWS Config, AWS X-Ray, Amazon OpenSearch Service.

---

## 1. Tổng Quan Dịch Vụ (Service Overview)

### Dịch vụ gì?
Bộ ba dịch vụ **Amazon CloudWatch**, **AWS CloudTrail**, và **AWS Config** tạo nên trụ cột vững chắc nhất cho khả năng quan sát toàn diện (**Full-stack Observability**), kiểm toán an ninh (**Security Audit**), và quản trị tuân thủ quy chuẩn (**Compliance Governance**) trên toàn bộ hệ thống AWS:
1. **Amazon CloudWatch**: Nền tảng giám sát hiệu năng và sức khỏe vận hành tập trung. Thu thập các chỉ số định lượng (**Metrics**), nhật ký văn bản (**Logs**), thiết lập cảnh báo thông minh (**Alarms & Anomaly Detection**), đo lường trải nghiệm người dùng thực tế (**Synthetics Canaries & RUM**), và phân tích truy vết phân tán (**ServiceLens / X-Ray**).
2. **AWS CloudTrail**: Dịch vụ ghi nhật ký kiểm toán bất biến toàn bộ các cuộc gọi API trên tài khoản AWS. Trả lời câu hỏi kinh điển của kiểm toán viên và an ninh mạng: **"Ai (Who) đã làm gì (What), vào thời điểm nào (When), từ địa chỉ IP nào (Where), và thông qua giao thức nào (How)?"**. Tích hợp sẵn **CloudTrail Lake** để truy vấn SQL phân tích sự cố dài hạn.
3. **AWS Config**: Dịch vụ liên tục ghi lại lịch sử thay đổi cấu hình tài nguyên theo thời gian và đánh giá tính tuân thủ của các tài nguyên đó dựa trên các quy tắc chuẩn mực (**Config Rules & Conformance Packs**), hỗ trợ cơ chế tự động sửa sai (**Automated Remediation**) qua Systems Manager Automation.

---

## 2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts, Security & Day-2 Operations)

### 1. Phân Định Vai Trò: CloudWatch vs CloudTrail vs AWS Config

```mermaid
flowchart TD
    subgraph ObservabilityPillars[3 Trụ Cột Giám Sát & Quản Trị AWS]
        direction TB
        CW[1. Amazon CloudWatch\nHiệu Năng & Vận Hành\n'Hệ thống chạy thế nào? Có chậm/nghẽn không?']
        CT[2. AWS CloudTrail\nKiểm Toán & An Ninh\n'Ai vừa gọi API xóa DynamoDB / S3?']
        CFG[3. AWS Config\nCấu Hình & Tuân Thủ\n'Security Group có mở port 22 tới 0.0.0.0/0 không?']
    end

    EC2[Tài nguyên AWS: EC2, S3, RDS, IAM] -->|Đẩy CPU, RAM, Network, App Logs| CW
    EC2 -->|Ghi nhận API Calls qua AWS CLI, Console, SDK| CT
    EC2 -->|Theo dõi lịch sử thay đổi cấu hình Configuration Items| CFG

    CW -->|Metric Alarms| SNS[Amazon SNS / PagerDuty Alert]
    CT -->|Phát hiện bất thường qua Insights| EB[Amazon EventBridge]
    CFG -->|Phát hiện vi phạm Non-compliant| SSM[SSM Automation: Tự động vá lỗi]
```

---

### 2. Thành Phần Chuyên Sâu của Amazon CloudWatch

- **CloudWatch Metrics**:
  - Dữ liệu chuỗi thời gian (Time-series) bao gồm: **Namespace** (ví dụ `AWS/EC2`), **Metric Name** (ví dụ `CPUUtilization`), các chiều phân loại **Dimensions** (ví dụ `InstanceId=i-0123456789`), và **Timestamp**.
  - *Basic Monitoring (Mặc định)*: Tần suất gửi số liệu mỗi **5 phút** (hoàn toàn miễn phí).
  - *Detailed Monitoring*: Tần suất gửi số liệu mỗi **1 phút** (\$2.10/instance/tháng cho EC2) — bắt buộc khi cần Auto Scaling Group thu phóng phản hồi nhanh chóng theo chu kỳ 1 phút trước các đợt tăng đột biến lưu lượng (`TD-Set1 Q45`).
  - **Lưu ý sống còn về RAM & Swap Space**: Hypervisor của AWS **KHÔNG THỂ tự động biết được mức sử dụng bộ nhớ RAM (Memory Utilization)**, không gian hoán đổi (**Swap Space**), hoặc dung lượng trống của ổ đĩa bên trong hệ điều hành (`TD-Set2 Q61`)! Muốn thu thập RAM, Swap và Disk Space, bạn **bắt buộc phải cài đặt Unified CloudWatch Agent** bên trong máy ảo EC2 (`TD-Set1 Q12`, `TD-Set2 Q61`) và gán IAM Role có AWS Managed Policy **`CloudWatchAgentServerPolicy`** (`TD-Set6 Q19`).
- **CloudWatch Logs & Logs Insights**:
  - Cấu trúc: **Log Groups** (đại diện cho ứng dụng) chứa nhiều **Log Streams** (đại diện cho từng máy ảo/container).
  - **Subscription Filters**: Cho phép stream log thời gian thực từ CloudWatch Logs tới **Amazon Kinesis Data Firehose**, **AWS Lambda**, hoặc **Amazon OpenSearch Service** để phân tích SIEM và lưu trữ phân tích quy mô lớn (`TD-Set3 Q05`).
  - **CloudWatch Logs Insights**: Công cụ truy vấn mạnh mẽ phân tích hàng triệu dòng log bằng cú pháp SQL-like trong vài giây:
    ```sql
    fields @timestamp, @message
    | filter @message like /Exception|ERROR/
    | stats count(*) as errorCount by bin(5m)
    | sort errorCount desc
    | limit 20
    ```
  - **Lớp lưu trữ Infrequent Access (IA) vs Standard Logs Class**:
    - Lớp **Standard**: Hỗ trợ đầy đủ tính năng giám sát thời gian thực, Metric Filters, Subscription Filters, Live Tail, và CloudWatch Alarms (\$0.50/GB nạp vào).
    - Lớp **Infrequent Access (IA)**: Giúp giảm **50% chi phí nạp log** (\$0.25/GB nạp vào), tối ưu cho log kiểm toán chỉ tra cứu sau sự cố bằng Logs Insights.
    - ⚠️ **LƯU Ý SỐNG CÒN TRONG VẬN HÀNH & THI CỬ**: Lớp IA **KHÔNG HỖ TRỢ** Metric Filters, Subscription Filters, Live Tail, và CloudWatch Alarms! Tuyệt đối không chuyển Log Groups của ứng dụng Production cần cảnh báo lỗi tự động sang lớp IA.

| Tính năng giám sát | CloudWatch Logs Standard | CloudWatch Logs Infrequent Access (IA) |
| :--- | :--- | :--- |
| **Đơn giá nạp log (Ingestion)** | \$0.50 / GB | **\$0.25 / GB (Rẻ hơn 50%)** |
| **Đơn giá lưu trữ (Storage)** | \$0.03 / GB / tháng | \$0.03 / GB / tháng |
| **Truy vấn CloudWatch Logs Insights** | Có (\$0.005/GB quét) | Có (\$0.005/GB quét) |
| **Live Tail (Xem log thời gian thực)** | Có | ❌ **Không hỗ trợ** |
| **Metric Filters & Cảnh báo Alarms** | Có | ❌ **Không hỗ trợ** |
| **Subscription Filters (Đẩy Lambda/Firehose)**| Có | ❌ **Không hỗ trợ** |
- **CloudWatch Alarms**:
  - 3 trạng thái: `OK`, `ALARM`, `INSUFFICIENT_DATA`.
  - **Composite Alarms**: Kết hợp nhiều cảnh báo độc lập bằng biểu thức logic (`ALARM("HighCPU") AND ALARM("HighLatency")`) nhằm triệt tiêu hiện tượng báo động giả (Alarm Fatigue).
  - **EC2 Recovery Action**: Cấu hình tự động khởi động lại máy ảo trên một host vật lý mới khi bị lỗi phần cứng (**StatusCheckFailed_System**), giữ nguyên địa chỉ Private IP, Public Elastic IP, và Instance ID!

---

### 3. Phân Tích Chuyên Sâu AWS CloudTrail

- **Event History**: Mặc định lưu giữ lịch sử các sự kiện quản trị (Management Events) trong vòng **90 ngày** hoàn toàn miễn phí trên Console (`TD-Set5 Q47`). Sau 90 ngày hoặc khi cần lưu trữ lâu dài phục vụ kiểm toán tài chính/pháp lý, **bắt buộc phải tạo CloudTrail Trail** để xuất log về **Amazon S3 Bucket** (`TD-Set5 Q28`, `TD-Set5 Q47`).
- **CloudTrail Trails**: Tạo Trail xuất toàn bộ nhật ký nén dạng JSON về **Amazon S3 Bucket** lưu trữ vĩnh viễn, kết hợp tính năng **CloudTrail Log File Integrity Validation** (sử dụng chữ ký số SHA-256 HMAC) để chứng minh trước tòa án rằng file log không bị kẻ tấn công sửa đổi hay xóa dấu vết (`TD-Set5 Q28`).
- **Phân loại sự kiện (Event Types)**:
  - *Management Events*: Các thao tác cấu hình tài nguyên mặt phẳng điều khiển (`RunInstances`, `CreateBucket`, `AttachRolePolicy`).
  - *Data Events*: Các thao tác mức đối tượng dữ liệu (**mặc định bị tắt** do lưu lượng khổng lồ): `s3:GetObject`, `s3:PutObject`, `s3:DeleteObject`, `lambda:Invoke`. Khi cần kiểm toán chi tiết ai tải/xóa từng object trong S3 bucket nhạy cảm, phải chủ động kích hoạt S3 Data Events (`TD-Set5 Q07`).
  - *CloudTrail Insights*: Ứng dụng học máy phân tích tự động các đợt bùng nổ gọi API bất thường (ví dụ: bùng nổ lỗi `AccessDenied` hoặc đột ngột xuất hiện hàng ngàn lệnh xóa tài nguyên lúc nửa đêm).
  - *CloudTrail Lake*: Kho dữ liệu kiểm toán được quản lý hoàn toàn cho phép chạy truy vấn SQL trực tiếp trên lịch sử sự kiện nhiều năm mà không cần thiết lập hạ tầng Athena hay ETL.

---

### 4. AWS Config: Quản Trị Tuân Thủ Quy Chuẩn & Tự Động Vá Lỗi

- **Configuration Items (CIs)**: Bản chụp trạng thái của một tài nguyên (thuộc tính, mối quan hệ phụ thuộc, thẻ tags) mỗi khi có sự thay đổi.
- **Config Rules & Conformance Packs**:
  - Đánh giá liên tục các tài nguyên dựa trên bộ quy tắc tuân thủ (ví dụ: kiểm tra IAM Password Policy đạt chuẩn `iam-password-policy` [`TD-Set4 Q45`], cấm mở cổng 22 SSH ra Internet, bắt buộc mã hóa EBS volume bằng KMS, cấm S3 bucket công khai).
  - **Conformance Packs**: Tập hợp hàng chục Config Rules đóng gói theo các chuẩn bảo mật quốc tế: **CIS AWS Foundations Benchmark, PCI-DSS, HIPAA, SOC2**.
- **Automated Remediation**: Khi phát hiện tài nguyên ở trạng thái `NON-COMPLIANT`, Config tự động kích hoạt một **Systems Manager Automation Runbook** để tự động vá lỗi (ví dụ: tự động thu hồi Security Group Rule mở cổng 22 vi phạm, tự động cấu hình lại tài nguyên lệch chuẩn) (`TD-Set5 Q04`).

---

### 🏛️ I. Các Kịch Bản Kiến Trúc Chuẩn (Best Practice Scenarios)

#### 1. Cảnh Báo An Ninh Chủ Động: CloudTrail + CloudWatch Metric Filters + Amazon SNS
- **Tình huống thi**: Đội ngũ bảo mật cần nhận thông báo khẩn cấp ngay lập tức qua email mỗi khi có người dùng hoặc service cố tình thực hiện các thao tác API trái phép trong tài khoản (ví dụ: bị từ chối với lỗi `AccessDenied` hoặc `UnauthorizedOperation`).
- **Giải pháp tối ưu chuẩn AWS**:
  - **AWS CloudTrail**: Cấu hình đẩy toàn bộ Management Events và Data Events vào một **CloudWatch Logs Log Group**.
  - **CloudWatch Metric Filter**: Thiết lập bộ lọc trích xuất pattern lỗi trong file log JSON:
    `{ ($.errorCode = "*UnauthorizedOperation") || ($.errorCode = "AccessDenied*") }`
  - Gắn một **CloudWatch Alarm** vào Metric vừa tạo: Nếu số lượng lỗi vượt ngưỡng $\ge 1$ trong vòng 1 phút -> Kích hoạt gửi thông báo tới một **Amazon SNS Topic** để gửi email cảnh báo tới đội SOC/SecOps.

#### 2. Kiểm Toán Toàn Diện Đa Tài Khoản Bằng CloudTrail Organizational Trail
- **Tình huống thi**: Doanh nghiệp quản lý hàng chục tài khoản AWS qua AWS Organizations. Cần thiết lập hệ thống ghi log kiểm toán tập trung cho mọi hành động của người dùng trên toàn bộ các tài khoản thành viên, đảm bảo các tài khoản con không thể tắt hoặc xóa log.
- **Giải pháp chuẩn**:
  - Tại **Management Account**, tạo một **AWS CloudTrail Organizational Trail**.
  - Trail này sẽ tự động nhân bản và thu thập log API từ **toàn bộ các member accounts hiện tại và các member accounts mới được tạo trong tương lai**.
  - Đích đến (Destination): Lưu trữ tập trung tại một **Amazon S3 Bucket** an toàn được bật tính năng S3 Object Lock / SSE-KMS, chỉ cấp quyền truy cập cho nhóm bảo mật.

#### 3. Giám Sát Chất Lượng Mạng Lai Với CloudWatch Network Monitor
- **Tình huống thi**: Doanh nghiệp kết nối văn phòng On-Premises với AWS VPC qua Direct Connect / VPN và cần liên tục giám sát chất lượng đường truyền (độ trễ mạng Round-Trip Time - RTT và tỷ lệ mất gói tin Packet Loss).
- **Giải pháp chuẩn**:
  - Kích hoạt dịch vụ **Amazon CloudWatch Network Monitor**.
  - Thiết lập giám sát giữa Subnet trong VPC và địa chỉ IP của router On-Premises. Dịch vụ tự động sinh ra các metrics `RTT` và `PacketLoss` vào CloudWatch để kích hoạt alarm khi chất lượng mạng suy giảm.

---

### 🪤 II. Các Bẫy Thi Tinh Vi & Phân Tích Phương Án Sai (Exam Traps & Distractors)

#### 🪤 Bẫy 1: Tự Động Kiểm Toán Hạn Chứng Chỉ SSL Bằng AWS Config Managed Rules — (U-PT2 Q35)
- **Tình huống đề thi**: *"Doanh nghiệp nhập khẩu nhiều chứng chỉ SSL/TLS của bên thứ ba vào AWS Certificate Manager (ACM). Yêu cầu tự động kiểm tra định kỳ và gửi thông báo cho đội vận hành trước khi chứng chỉ hết hạn 30 ngày với ÍT CÔNG SỨC QUẢN TRỊ NHẤT."*
- **Các phương án bẫy**:
  - ❌ *Trông cậy vào tính năng tự động gia hạn của ACM*: ACM **chỉ tự động gia hạn** cho các chứng chỉ do chính ACM phát hành (ACM-issued certificates); đối với chứng chỉ bên ngoài tự import vào (Imported Certificates), ACM **hoàn toàn không thể tự gia hạn**!
  - ❌ *Viết script Lambda chạy định kỳ qua EventBridge để quét API*: Hoạt động được nhưng tốn công viết mã, bảo trì và kiểm thử -> Vi phạm yêu cầu "Least Operational Overhead".
- **Giải pháp ĐÚNG**: Sử dụng quy tắc có sẵn của AWS Config: **`acm-certificate-expiration-check`**.
  - Quy tắc này tự động đánh giá ngày hết hạn của toàn bộ chứng chỉ trong ACM.
  - Khi còn dưới 30 ngày, AWS Config tự động đánh dấu trạng thái Non-Compliant và kích hoạt thông báo qua **Amazon SNS** tới đội vận hành.

#### 🪤 Bẫy 2: Truy Vết Phân Tán Serverless & Phát Hiện Điểm Nghẽn Độ Trễ (AWS X-Ray) — (CM-PT1 Q21)
- **Tình huống đề thi**: *"Ứng dụng Serverless bao gồm API Gateway, nhiều hàm Lambda và DynamoDB gặp hiện tượng phản hồi chậm gián đoạn. Cần giải pháp theo dõi luồng yêu cầu (end-to-end request tracing) và xác định chính xác dịch vụ nào đang gây ra nút thắt cổ chai độ trễ với chi phí vận hành thấp nhất."*
- **Các phương án bẫy**:
  - ❌ *Ghi log thời gian thực thi thủ công vào CloudWatch Logs rồi viết câu truy vấn CloudWatch Insights*: Tốn công lập trình và không hiển thị được bản đồ dịch vụ (Service Map).
  - ❌ *Cài đặt OpenSearch để phân tích log*: Tốn chi phí cụm server và phức tạp.
- **Giải pháp ĐÚNG**: Kích hoạt **AWS X-Ray** trực tiếp trong mẫu hạ tầng **AWS CloudFormation** (`Tracing: Active`).
  - X-Ray tự động vẽ Service Map trực quan.
  - Phân tích chi tiết từng Segment và Subsegment để chỉ rõ hàm Lambda nào chạy chậm hoặc câu truy vấn DynamoDB nào bị throttle.

#### 🪤 Bẫy 3: Phân Biệt Rạch Ròi Bộ Ba: CloudWatch vs CloudTrail vs AWS Config
- **Bẫy thi phổ biến**: Đề bài hỏi về một yêu cầu kiểm toán hoặc tuân thủ nhưng đưa ra cả 3 dịch vụ làm các phương án lựa chọn:

| Dịch vụ | Câu hỏi trả lời | Từ khóa nhận diện trong đề bài |
|:---|:---|:---|
| **Amazon CloudWatch** | *"Ứng dụng đang hoạt động như thế nào?"* | Performance, Metrics (CPU, RAM, Disk, Network), Logs, Alarms, Dashboards, Xử lý sự cố theo thời gian thực |
| **AWS CloudTrail** | *"Ai đã làm gì, vào lúc nào, từ địa chỉ IP nào?"* | Security Audit, API History, User Activity, Unauthorized API Calls, Forensic Investigation |
| **AWS Config** | *"Cấu hình tài nguyên có đúng quy chuẩn không?"* | Compliance, Configuration History, Resource Inventory, Change Tracking, Audit Rules (ví dụ: kiểm tra S3 có mở public không) |

#### 🪤 Bẫy 4: Kiểm Toán Tuân Thủ Sao Lưu Bằng AWS Backup Audit Manager — (CM-PT1 Q31)
- **Tình huống đề thi**: *"Doanh nghiệp cần tự động kiểm tra, đối soát và xuất báo cáo tuân thủ chính sách sao lưu định kỳ (Backup Compliance Reports) trên hàng trăm tài khoản AWS để nộp cho kiểm toán viên quốc tế."*
- **Giải pháp ĐÚNG**: Sử dụng **AWS Backup Audit Manager** tích hợp với các quy tắc được quản lý của **AWS Config**. Dịch vụ tự động đối chiếu các kế hoạch sao lưu thực tế với chính sách đề ra và sinh báo cáo tuân thủ tiêu chuẩn tự động.

#### 🪤 Bẫy 5: Nhận Diện Tấn Công Đăng Nhập RDS Bằng GuardDuty RDS Protection — (CM-PT5 Q22)
- **Tình huống đề thi**: *"Doanh nghiệp thương mại điện tử vận hành nhiều cơ sở dữ liệu Amazon RDS trong các tài khoản thành viên của AWS Organizations. Đội an ninh cần một giải pháp chuyên biệt để phát hiện các cuộc tấn công dò mật khẩu (brute-force login attempts) hoặc hành vi đăng nhập bất thường vào database với ít công sức quản trị nhất."*
- **Các phương án bẫy**:
  - ❌ *Bật CloudWatch Logs xuất toàn bộ error log rồi viết Metric Filters*: Tốn công viết regex, dễ bỏ sót các kiểu tấn công phân tán tinh vi và phát sinh chi phí log lớn.
  - ❌ *Cài đặt agent giám sát bên thứ ba*: Tăng gánh nặng bảo trì và patching agent.
- **Giải pháp ĐÚNG**: Bật tính năng **Amazon GuardDuty RDS Protection** tập trung từ Delegated Administrator Account cho toàn bộ các member accounts.
  - GuardDuty sử dụng Machine Learning phân tích các luồng sự kiện đăng nhập vào RDS/Aurora (Login Events) để phát hiện tức thì các dấu hiệu brute-force, rò rỉ tài khoản mà không gây ảnh hưởng đến hiệu năng của database.

#### 🪤 Bẫy 6: Tự Động Phục Hồi Máy Ảo EC2 Bằng CloudWatch Alarm Auto-Recovery — (CM-PT5 Q03)
- **Tình huống đề thi**: *"Máy chủ EC2 chạy hệ thống ERP nội bộ quan trọng gặp lỗi phần cứng vật lý bên dưới của hạ tầng AWS. Cần cấu hình giải pháp tự động khắc phục với ít công sức nhất mà giữ nguyên địa chỉ IP và cấu hình máy ảo."*
- **Giải pháp ĐÚNG**: Tạo một **Amazon CloudWatch Alarm** theo dõi metric **`StatusCheckFailed_System`** và gắn action **Recover this instance**.
  - Khi metric vượt ngưỡng (phần cứng AWS bị lỗi), CloudWatch tự động di dời máy ảo sang một host vật lý mới nguyên vẹn trong cùng Availability Zone mà giữ nguyên Private IP, Public/Elastic IP, cấu hình mạng và ổ đĩa EBS.

#### 🪤 Bẫy 7: Tự Động Phát Hiện Tài Nguyên Không Tuân Thủ Bằng AWS Config — (TD-Set4 Q45, TD-Set5 Q04, CM-PT6 Q13)
- **Tình huống đề thi**: *"Doanh nghiệp muốn tự động phát hiện (automatically detect) các thay đổi cấu hình làm tài nguyên bị lệch chuẩn an ninh (như IAM Password Policy không đạt chuẩn, EBS volumes không được mã hóa, S3 bucket mở public, port 22 mở ra 0.0.0.0/0) và tự động kích hoạt khắc phục (Remediation) trên toàn bộ tổ chức với ít công vận hành nhất."*
- **Giải pháp ĐÚNG**: Kích hoạt **AWS Config** kết hợp sử dụng **AWS Config Managed Rules** (ví dụ: `iam-password-policy` [`TD-Set4 Q45`]).
  - Khi phát hiện Non-compliant, Config tự động kích hoạt **Systems Manager Automation Runbook** để tự động sửa lỗi cấu hình theo thời gian thực (`TD-Set5 Q04`).

#### 🪤 Bẫy 8: Thiếu Hụt Bộ Nhớ RAM & Swap Space Trên Máy Ảo EC2 — (TD-Set2 Q61, TD-Set6 Q19, TD-Set1 Q12)
- **Tình huống đề thi**: *"Máy chủ EC2 chạy ứng dụng xử lý dữ liệu tài chính gặp sự cố treo do cạn kiệt bộ nhớ RAM và không gian hoán đổi ổ đĩa (swap space exhaustion). Quản trị viên kiểm tra CloudWatch Console nhưng không tìm thấy metric nào phản ánh tình trạng swap hay memory. Cần làm gì để giám sát và cảnh báo khi RAM/Swap sắp hết?"*
- **Các phương án bẫy**:
  - ❌ *Bật Detailed Monitoring cho EC2 Instance*: Detailed Monitoring chỉ tăng tần suất thu thập CPU/Network/Disk I/O từ 5 phút lên 1 phút, **hoàn toàn KHÔNG thu thập thêm metric RAM hay Swap**!
  - ❌ *Tạo custom script chạy curl đẩy metric lên CloudWatch bằng cronjob*: Mất công duy trì script, dễ lỗi xác thực và thiếu chuẩn hóa.
- **Giải pháp ĐÚNG**: Cài đặt **Unified CloudWatch Agent** trên hệ điều hành máy ảo (hỗ trợ cả Windows và Linux [`TD-Set1 Q12`]).
  - Cấu hình file agent JSON để thu thập các metrics hệ điều hành chuyên sâu: `mem_used_percent` và `swap_used_percent` (`TD-Set2 Q61`).
  - Đảm bảo gán IAM Role cho EC2 chứa AWS Managed Policy **`CloudWatchAgentServerPolicy`** để máy chủ có quyền đẩy metrics vào CloudWatch (`TD-Set6 Q19`).

#### 🪤 Bẫy 9: Tần Suất Giám Sát EC2 Cho Auto Scaling Group Phản Hồi Nhanh — (TD-Set1 Q45)
- **Tình huống đề thi**: *"Một hệ thống thương mại điện tử trải qua các đợt bùng nổ flash sale đột ngột. Auto Scaling Group cần phát hiện lưu lượng tăng và scale out trong vòng 1-2 phút thay vì phải chờ 5-10 phút. Tuy nhiên hệ thống hiện tại phản hồi quá trễ làm sập máy chủ."*
- **Các phương án bẫy**:
  - ❌ *Giữ nguyên Basic Monitoring và giảm Period của CloudWatch Alarm xuống 60 giây*: Basic Monitoring chỉ gửi dữ liệu 5 phút một lần, nên alarm ở period 60 giây sẽ rơi vào trạng thái `INSUFFICIENT_DATA` hoặc chậm trễ 5 phút!
- **Giải pháp ĐÚNG**: Kích hoạt **Detailed Monitoring** trên EC2 instances / Auto Scaling Launch Template (`TD-Set1 Q45`).
  - Dữ liệu metric CPU/Network được đẩy vào CloudWatch mỗi **1 phút**.
  - CloudWatch Alarm cấu hình đánh giá theo chu kỳ 1 phút (1-minute period) giúp Auto Scaling kích hoạt scale out kịp thời.

#### 🪤 Bẫy 10: Lưu Trữ Nhật Ký Kiểm Toán CloudTrail Sau 90 Ngày — (TD-Set5 Q47, TD-Set5 Q28)
- **Tình huống đề thi**: *"Doanh nghiệp cần tra cứu các lệnh xóa tài nguyên xảy ra cách đây 6 tháng để phục vụ thanh tra an ninh. Quản trị viên truy cập CloudTrail Console nhưng không tìm thấy dữ liệu. Cần kiến trúc giải pháp như thế nào để đáp ứng lưu trữ kiểm toán dài hạn?"*
- **Nguyên lý cốt lõi**:
  - **CloudTrail Event History** mặc định chỉ lưu trữ sự kiện quản trị (Management Events) trong vòng **90 ngày** hoàn toàn miễn phí (`TD-Set5 Q47`). Sau 90 ngày, dữ liệu sẽ tự động biến mất!
- **Giải pháp ĐÚNG**: Tạo một **CloudTrail Trail** (áp dụng cho All Regions) và cấu hình chuyển tiếp log về một **Amazon S3 Bucket** lưu trữ dài hạn (`TD-Set5 Q28`, `TD-Set5 Q47`).
  - Kết hợp **SSE-KMS Encryption**, **S3 Lifecycle Rules** chuyển sang S3 Glacier Flexible Archive, và bật **Log File Integrity Validation** để ngăn ngừa chỉnh sửa file log (`TD-Set5 Q28`).

#### 🪤 Bẫy 11: Kiểm Toán Thao Tác Mức Đối Tượng S3 Object: Data Events — (TD-Set5 Q07)
- **Tình huống đề thi**: *"Một ngân hàng lưu trữ hàng triệu tài liệu hồ sơ khách hàng nhạy cảm trên Amazon S3. Đội kiểm toán yêu cầu phải ghi lại nhật ký chi tiết mỗi khi có bất kỳ ai truy cập tải xuống (`GetObject`) hoặc tải lên (`PutObject`) các tệp tin này với thông tin danh tính IAM caller rõ ràng."*
- **Các phương án bẫy**:
  - ❌ *Trông cậy vào CloudTrail mặc định*: CloudTrail mặc định **CHỈ GHI Management Events**, hoàn toàn **KHÔNG ghi nhận Data Events** của S3!
  - ❌ *Chỉ bật S3 Server Access Logging*: S3 Access Logs ghi lại IP và request HTTP nhưng không tích hợp sâu với IAM ARN và không đẩy sang CloudWatch Alarms/EventBridge được một cách native.
- **Giải pháp ĐÚNG**: Bật **CloudTrail S3 Data Events** (Object-level logging) cho các S3 Buckets chứa dữ liệu nhạy cảm (`TD-Set5 Q07`).
  - Cho phép ghi lại chính xác caller identity, IP, thời gian và API `s3:GetObject`, `s3:PutObject`, `s3:DeleteObject`.

#### 🪤 Bẫy 12: Điều Tra Sự Cố Kết Nối & Độ Trễ HTTP: ALB Access Logs vs VPC Flow Logs — (TD-Set5 Q23)
- **Tình huống đề thi**: *"Khách hàng phản ánh ứng dụng web chạy sau Application Load Balancer (ALB) thỉnh thoảng bị lỗi gián đoạn HTTP 504 Gateway Timeout hoặc thời gian phản hồi quá lâu. Cần phân tích địa chỉ IP client, thời gian xử lý của backend targets và HTTP request URL."*
- **Các phương án bẫy**:
  - ❌ *Bật VPC Flow Logs*: VPC Flow Logs hoạt động ở Layer 4 (Network Interface metadata: Source IP, Dest IP, Port, Bytes, Action ACCEPT/REJECT). Flow Logs **KHÔNG THỂ thấy** HTTP request headers, URL path, response status code (200/404/504), hay target processing time (`TD-Set5 Q23`)!
  - ❌ *Kiểm tra CloudTrail*: CloudTrail chỉ ghi các lệnh API gọi lên AWS, không ghi traffic của end-user truy cập website!
- **Giải pháp ĐÚNG**: Kích hoạt **Application Load Balancer Access Logs** và đẩy log vào Amazon S3 (`TD-Set5 Q23`).
  - ALB Access Logs chứa đầy đủ: client IP, request processing time, target processing time, response processing time, HTTP status code và request URL path. Dùng **Amazon Athena** để chạy SQL phân tích tìm ra request nào bị chậm trễ (`TD-Set5 Q23`).

#### 🪤 Bẫy 13: Giám Sát Hiệu Năng Tần Suất Cao (<= 2 Phút) Ít Công Sức Quản Trị Nhất — (U-PT4 Q01)
- **Tình huống đề thi**: *"Doanh nghiệp cần theo dõi các chỉ số hiệu năng chuẩn của máy chủ EC2 (CPU, Disk I/O, Network) với tần suất giám sát định kỳ dưới 2 phút (ví dụ 1 phút một lần) để kịp thời phát hiện sự cố hiệu năng, với yêu cầu giải pháp triển khai nhanh nhất và tốn ít công sức quản trị nhất (Least operational effort)."*
- **Các phương án bẫy**:
  - ❌ *Cài đặt CloudWatch Agent trên từng máy ảo*: CloudWatch Agent chủ yếu dùng để lấy custom metrics (RAM, Disk space, OS logs); việc cài đặt agent trên hàng loạt máy ảo đòi hỏi bảo trì, cấu hình file JSON và quản trị vòng đời agent phức tạp không cần thiết cho các chỉ số hypervisor cơ bản.
  - ❌ *Xuất log sang S3 và dùng Athena phân tích định kỳ*: Độ trễ cao, cồng kềnh, không đáp ứng yêu cầu giám sát thời gian thực.
- **Giải pháp ĐÚNG**: Bật tính năng **EC2 Detailed Monitoring (chu kỳ 1 phút)** (`U-PT4 Q01`).
  - Mặc định (Basic Monitoring), máy chủ EC2 chỉ gửi số liệu lên CloudWatch mỗi 5 phút một lần.
  - Bật Detailed Monitoring chỉ bằng 1 cú click chuột hoặc câu lệnh CLI/CloudFormation (`Monitoring: Enabled: true`), cung cấp dữ liệu số liệu gửi lên CloudWatch theo chu kỳ **1 phút** mà không cần cài đặt hay duy trì bất kỳ phần mềm agent nào bên trong hệ điều hành máy ảo.

#### 🪤 Bẫy 14: Tự Động Khởi Động Lại Máy Ảo EC2 Bị Treo Bằng CloudWatch Alarm Reboot Action — (U-PT4 Q18)
- **Tình huống đề thi**: *"Một máy chủ Amazon EC2 thỉnh thoảng bị treo ứng dụng hoặc quá tải dẫn tới kiểm tra trạng thái máy ảo bị thất bại (`StatusCheckFailed_Instance`). Doanh nghiệp muốn tự động khởi động lại (Reboot) máy ảo này với chi phí thấp nhất và ít công sức quản lý nhất."*
- **Các phương án bẫy**:
  - ❌ *Viết hàm AWS Lambda bắt sự kiện EventBridge để gọi API `ec2:RebootInstances`*: Tốn công viết code, bảo trì runtime, phân quyền IAM role và kiểm thử hàm không cần thiết.
  - ❌ *Dùng Systems Manager Automation document*: Phức tạp hơn và phát sinh chi phí/công sức quản trị cao hơn so với tính năng tích hợp sẵn của CloudWatch Alarm.
- **Giải pháp ĐÚNG**: Tạo một **CloudWatch Alarm** trên chỉ số `StatusCheckFailed_Instance` và gắn trực tiếp hành động **EC2 Reboot Alarm Action** (`U-PT4 Q18`).
  - CloudWatch Alarms hỗ trợ hành động tích hợp bản địa trực tiếp với EC2 (EC2 Actions): **Reboot**, **Stop**, **Terminate**, hoặc **Recover**.
  - Giải pháp này hoàn toàn Serverless, kích hoạt tức thì, không tốn bất kỳ chi phí viết mã hay duy trì hàm ngoài nào.

#### 🪤 Bẫy 15: Thu Thập Và Tập Trung Hóa Nhật Ký Ứng Dụng EC2 Bằng CloudWatch Agent — (U-PT4 Q32)
- **Tình huống đề thi**: *"Ứng dụng doanh nghiệp chạy trên máy chủ EC2 ghi các tệp nhật ký ứng dụng và lỗi hệ thống vào đường dẫn cục bộ `/var/log/application.log`. Doanh nghiệp muốn tập trung hóa toàn bộ nhật ký này lên Amazon CloudWatch Logs để phân tích và lưu trữ dài hạn."*
- **Các phương án bẫy**:
  - ❌ *Viết script Cron job đẩy file log lên S3 mỗi giờ*: Độ trễ cao, tốn công bảo trì script, dễ bị rớt log nếu máy ảo bị terminate đột ngột.
  - ❌ *Dùng AWS DataSync*: DataSync chuyên dùng cho di chuyển tập tin hệ thống NFS/SMB khối lượng lớn, không thiết kế để stream từng dòng log liên tục lên CloudWatch.
- **Giải pháp ĐÚNG**: Cài đặt **Unified CloudWatch Agent** trên máy chủ EC2 và cấu hình mục `logs` trong file cấu hình JSON trỏ tới file log ứng dụng (`U-PT4 Q32`).
  - CloudWatch Agent đọc luồng log theo thời gian thực và đẩy trực tiếp lên CloudWatch Logs Group chỉ định.
  - Đi kèm với IAM Instance Profile có policy `CloudWatchAgentServerPolicy`.

#### 🪤 Bẫy 16: Giám Sát Tập Trung Đa Tài Khoản Với CloudWatch Cross-Account Observability — (CM-PT5 Q12)
- **Tình huống đề thi**: *"Doanh nghiệp quản trị hàng chục tài khoản AWS trong AWS Organizations. Đội ngũ vận hành (SecOps / DevOps) ngồi tại một tài khoản giám sát trung tâm (Monitoring Account) cần xem toàn bộ Dashboards, Metrics, Logs, và Traces từ tất cả các tài khoản con (Source Accounts) mà không cần đăng nhập chuyển đổi giữa các tài khoản và không nạp duplicate dữ liệu."*
- **Các phương án bẫy**:
  - ❌ *Tạo IAM Role AssumeRole thủ công qua từng tài khoản con*: Phức tạp, khó duy trì khi số lượng tài khoản tăng lên hàng trăm.
  - ❌ *Viết script Lambda export log/metric từ từng tài khoản về S3 trung tâm*: Tốn kém chi phí lưu trữ gấp đôi và trễ dữ liệu thời gian thực.
- **Giải pháp ĐÚNG**: Thiết lập **CloudWatch Cross-Account Observability** (`CM-PT5 Q12`):
  - Chỉ định một tài khoản làm **Monitoring Account** và liên kết với AWS Organizations.
  - Các tài khoản thành viên (Source Accounts) chia sẻ dữ liệu chỉ số (Metrics), log (CloudWatch Logs) và vết (X-Ray Traces) cho Monitoring Account qua một cú click.
  - Đội vận hành có thể tìm kiếm log, xem CloudWatch Dashboards xuyên tài khoản, và quan sát ServiceLens map toàn diện trên một giao diện duy nhất.

#### 🪤 Bẫy 17: Giám Sát Chuyên Sâu Ứng Dụng & Container: Container Insights vs Application Insights — (CM-PT5 Q54, TD-Set5 Q23)
- **Tình huống đề thi**: *"Doanh nghiệp muốn giám sát cụm vi dịch vụ chạy trên Amazon ECS/EKS hoặc ứng dụng cơ sở dữ liệu doanh nghiệp (SQL Server/.NET) trên EC2 với khả năng tự động liên kết lỗi và phát hiện suy giảm hiệu năng."*
- **Phân biệt hai dịch vụ chuyên sâu**:
  - **CloudWatch Container Insights** (`CM-PT5 Q54`): Thu thập, tổng hợp và trực quan hóa các chỉ số và log chuyên sâu cho các cụm container: **Amazon ECS, Amazon EKS, và AWS Fargate**. Cung cấp các metric cấp container như CPU/Memory utilization, disk, network, và số lần pod/task bị crash/restart.
  - **CloudWatch Application Insights** (`TD-Set5 Q23`): Chuyên sâu cho các ứng dụng doanh nghiệp hoàn chỉnh (Microsoft SQL Server, IIS, Java, PostgreSQL, SAP). Tự động quét tài nguyên ứng dụng, thiết lập hàng chục alarms và metrics phù hợp, liên kết log lỗi với metric CPU/RAM tăng cao để tìm ra nguyên nhân gốc (Root Cause Analysis).

#### 🪤 Bẫy 18: Phân Biệt 3 Tầng Giám Sát Cơ Sở Dữ Liệu Amazon RDS — (TD-Set1 Q25, TD-Set4 Q14, TD-Set4 Q49)
- **Tình huống đề thi**: *"Đề bài yêu cầu giám sát chi tiết các tiến trình hệ điều hành (OS Processes) của máy chủ DB hoặc phân tích câu lệnh SQL nào đang chiếm dụng tài nguyên CPU cao nhất trong Amazon RDS."*
- **Ma trận 3 tầng giám sát RDS bất biến**:
  1. **Standard Monitoring (CloudWatch Metrics)**: Thu thập các chỉ số từ Hypervisor: `CPUUtilization`, `FreeableMemory`, `WriteIOPS`, `ReadLatency` theo chu kỳ 1 phút. Không nhìn thấy tiến trình bên trong hệ điều hành máy ảo DB.
  2. **Enhanced Monitoring** (`TD-Set1 Q25`, `TD-Set4 Q49`): Sử dụng một agent nội bộ chạy trực tiếp trong máy ảo RDS để đo lường hơn 50 chỉ số của hệ điều hành (**OS Metrics**): danh sách tiến trình (`OS processes`), mức độ tiêu thụ CPU của từng luồng (Thread), context switches, I/O wait. Tần suất thu thập cực cao: **từ 1 giây đến 60 giây** (mặc định 60s).
  3. **Performance Insights** (`TD-Set4 Q14`): Trực quan hóa tải của cơ sở dữ liệu (**Database Load**) đo bằng chỉ số **AAS (Average Active Sessions)**. Giúp phân tích nguyên nhân nghẽn (Wait Events), xếp hạng các câu lệnh SQL tải nặng nhất (Top SQLs), và phân tích theo người dùng (Top Users) hoặc host gọi vào.

#### 🪤 Bẫy 19: 3 Phương Pháp Tự Động Cảnh Báo Chứng Chỉ ACM Sắp Hết Hạn — (TD-Set6 Q03, U-PT2 Q35)
- **Tình huống đề thi**: *"Cần thiết lập hệ thống cảnh báo sớm khi chứng chỉ SSL/TLS trong AWS Certificate Manager (ACM) sắp hết hạn trong vòng 30 - 45 ngày để đội ngũ an ninh kịp thời gia hạn hoặc đổi mới."*
- **3 giải pháp chuẩn AWS**:
  1. **Amazon EventBridge Event Rule** (`TD-Set6 Q03`): Bắt sự kiện nguồn `aws.acm` với detail-type `ACM Certificate Approaching Expiration` (mặc định ACM bắn sự kiện này 45 ngày trước khi chứng chỉ hết hạn) và kích hoạt gửi email cảnh báo qua **Amazon SNS**.
  2. **CloudWatch Metric `DaysToExpiry`**: Tạo CloudWatch Alarm khi metric `DaysToExpiry` của namespace `AWS/CertificateManager` giảm xuống dưới 30 ngày.
  3. **AWS Config Managed Rule**: Kích hoạt quy tắc `acm-certificate-expiration-check` (`U-PT2 Q35`) để tự động đánh dấu Non-Compliant và kích hoạt SNS.

#### 🪤 Bẫy 20: Giữ Chân Máy Chủ Để Đẩy Log Trước Khi Terminate: ASG `Terminating:Wait` Lifecycle Hook — (TD-Set5 Q45)
- **Tình huống đề thi**: *"Hệ thống sử dụng Auto Scaling Group với máy chủ EC2. Khi có sự kiện Scale In hoặc khi máy ảo bị chấm dứt (Terminated), các file log ứng dụng quan trọng lưu trong thư mục `/var/log` chưa kịp đẩy lên S3 hoặc CloudWatch Logs đã bị mất sạch cùng ổ đĩa tạm thời."*
- **Các phương án bẫy**:
  - ❌ *Tăng kích thước ổ đĩa EBS hoặc đặt lịch cronjob 5 phút một lần*: Máy ảo có thể bị shutdown bất kỳ lúc nào giữa chu kỳ 5 phút, vẫn làm mất các dòng log cuối cùng!
- **Giải pháp ĐÚNG**: Sử dụng **Auto Scaling Lifecycle Hook với trạng thái `Terminating:Wait`** (`TD-Set5 Q45`):
  - Khi ASG quyết định tắt máy ảo, instance chuyển sang trạng thái tạm dừng (`Terminating:Wait`) trong tối đa **1 giờ (Heartbeat timeout)**.
  - Kích hoạt một script hoặc hàm AWS Lambda gửi lệnh qua Systems Manager Run Command để nén và tải toàn bộ log còn lại lên **Amazon S3 Bucket** an toàn.
  - Sau khi upload xong, script gọi API `CompleteLifecycleAction` để tiếp tục tiến trình terminate máy ảo (`TD-Set5 Q45`).

#### 🪤 Bẫy 21: Bộ Ba Phản Ứng Tự Động: Metric Filter $\rightarrow$ Alarm $\rightarrow$ SNS / Reboot — (TD-Set4 Q43, CM-PT1 Q26, U-PT1 Q23)
- **Tình huống đề thi**: *"Doanh nghiệp muốn theo dõi các thông báo lỗi `500 Internal Server Error` hoặc lỗi `Connection refused` trong file log ứng dụng trên CloudWatch Logs. Nếu xuất hiện hơn 20 lỗi trong vòng 5 phút, hệ thống phải tự động gửi email cảnh báo cho đội trực chiến hoặc tự động khởi động lại (Reboot) máy ảo EC2."*
- **Giải pháp ĐÚNG**: Chuỗi 3 mắt xích tự động hóa chuẩn AWS (`TD-Set4 Q43`, `CM-PT1 Q26`, `U-PT1 Q23`):
  1. Tạo một **CloudWatch Logs Metric Filter**: Định nghĩa pattern lọc (ví dụ: `[..., status_code = 500, ...]`), đếm số lần xuất hiện và chuyển hóa thành Custom Metric `500ErrorCount`.
  2. Tạo một **CloudWatch Alarm**: Theo dõi Custom Metric `500ErrorCount` với điều kiện `Threshold > 20` trong chu kỳ `Period = 5 minutes`.
  3. Cấu hình Alarm Action: Khi chuyển sang trạng thái `ALARM`, kích hoạt gửi thông báo qua **Amazon SNS Topic** tới email đội trực chiến, hoặc kích hoạt **EC2 Reboot Action** / Systems Manager Automation (`CM-PT1 Q26`, `U-PT1 Q23`).

#### 🪤 Bẫy 22: Các Quy Tắc Được Quản Lý Trọng Yếu Của AWS Config (Config Managed Rules) — (TD-Set2 Q08, TD-Set3 Q26, TD-Set4 Q37, CM-PT4 Q51, CM-PT6 Q06)
- **Tình huống đề thi**: *"Đề bài yêu cầu kiểm toán tự động tính tuân thủ các chuẩn an ninh trên toàn bộ hạ tầng AWS mà không cần tự viết mã Python Lambda."*
- **Bảng danh mục các Config Managed Rules thường gặp nhất trong kỳ thi**:
  - **`restricted-ssh`** (`CM-PT4 Q51`): Kiểm tra và cảnh báo nếu có bất kỳ Security Group nào mở cổng 22 SSH ra toàn thế giới (`0.0.0.0/0`).
  - **`access-keys-rotated`** (`TD-Set4 Q37`): Đánh giá xem các IAM Access Keys có được xoay vòng trong vòng số ngày quy định (ví dụ: 90 ngày) hay không.
  - **`required-tags`** (`TD-Set3 Q26`): Kiểm tra xem tài nguyên (EC2, S3, RDS) có chứa các thẻ tag bắt buộc hay không (ví dụ: `CostCenter`, `Environment`).
  - **`encrypted-volumes`** (`CM-PT6 Q06`): Đánh giá các ổ cứng EBS đính kèm vào EC2 có được mã hóa bằng KMS hay không.
  - **`s3-bucket-public-read-prohibited`** (`TD-Set2 Q08`): Cảnh báo tức thì nếu có S3 bucket nào cho phép quyền đọc công khai (Public Read).

#### 🪤 Bẫy 23: Mã Hóa & Kiểm Toán Nhật Ký CloudTrail: SSE-S3 Default, Truy Vấn Athena & Cảnh Báo Tạo IAM User — (TD-Set5 Q47, CM-PT2 Q50, CM-PT5 Q65)
- **Tình huống đề thi**: *"Quản trị viên an ninh cần nắm vững phương thức mã hóa mặc định của CloudTrail, cách thức truy vấn nhật ký API nhanh nhất và cơ chế phát hiện tài khoản người dùng mới tạo."*
- **Điểm mấu chốt**:
  - **Mã hóa mặc định**: Toàn bộ file log xuất từ CloudTrail về S3 được mã hóa mặc định bằng **SSE-S3** (`TD-Set5 Q47`). Bạn có thể tùy chọn mã hóa nâng cao bằng AWS KMS CMK để kiểm soát quyền giải mã chi tiết.
  - **Truy vấn phân tích**: Sử dụng **Amazon Athena** với bảng phân vùng theo ngày/tháng/Region để chạy các câu lệnh SQL truy vấn trực tiếp trên file log JSON của CloudTrail trong S3 mà không cần nạp vào cơ sở dữ liệu (`CM-PT5 Q65`).
  - **Cảnh báo tạo IAM User mới**: Tạo một **EventBridge Rule** bắt sự kiện API từ CloudTrail với `eventName: CreateUser` của `eventSource: iam.amazonaws.com` để gửi cảnh báo khẩn cấp qua SNS tới Trưởng phòng An ninh thông tin ngay khi có tài khoản mới được tạo lập (`CM-PT2 Q50`).

#### 🪤 Bẫy 24: Quản Lý Hạn Mức Tự Động Với AWS Service Quotas — (TD-Set5 Q12)
- **Tình huống đề thi**: *"Một ứng dụng đang mở rộng nhanh chóng và có nguy cơ chạm trần hạn mức vCPU của EC2 On-Demand hoặc số lượng Elastic IPs trong Region, dẫn tới việc không thể mở rộng máy chủ mới khi có đợt cao điểm."*
- **Các phương án bẫy**:
  - ❌ *Viết script Lambda gọi DescribeAccountLimits mỗi giờ*: Tốn công và không native.
- **Giải pháp ĐÚNG**: Sử dụng dịch vụ **AWS Service Quotas** (`TD-Set5 Q12`):
  - Service Quotas hiển thị toàn bộ hạn mức dịch vụ tại một nơi duy nhất.
  - Tích hợp với **Amazon CloudWatch** để tự động tạo Alarm cảnh báo khi mức sử dụng đạt 80% hạn mức quota.
  - Cho phép người dùng gửi yêu cầu tăng hạn mức (**Request quota increase**) trực tiếp hoặc tự động qua template giúp ngăn chặn nguy cơ chạm trần tài nguyên (`TD-Set5 Q12`).

---

### 📊 III. Ma Trận Quyết Định Giám Sát & Kiểm Toán Nhanh (Exam Decision Matrix)

| Tình huống / Yêu cầu trong đề thi | Giải pháp chuẩn AWS | Giải pháp bị loại & Lý do | Tham chiếu đề thi |
|:---|:---|:---|:---|
| **Giám sát EC2 tần suất <= 2 phút ít tốn công nhất** | **EC2 Detailed Monitoring (chu kỳ 1 phút)** | Cài CloudWatch Agent (quá cồng kềnh cho basic metrics) | `U-PT4 Q01` |
| **Tự động Reboot EC2 khi lỗi `StatusCheckFailed_Instance`** | **CloudWatch Alarm + EC2 Reboot Action** | Viết Lambda + EventBridge (phức tạp, tốn công) | `U-PT4 Q18` |
| **Tập trung hóa log ứng dụng từ EC2 lên CloudWatch Logs** | **Unified CloudWatch Agent (khai báo mục logs)** | Viết Cronjob copy lên S3 (độ trễ cao, dễ mất log) | `U-PT4 Q32` |
| **Giám sát thiếu hụt bộ nhớ RAM & Swap Space của EC2** | **Unified CloudWatch Agent + `mem_used_percent`, `swap_used_percent`** | Detailed Monitoring (chỉ đo CPU/Network/Disk, không đo OS memory) | `TD-Set2 Q61`, `TD-Set6 Q19`, `TD-Set1 Q12` |
| **Cấp quyền IAM cho EC2 gửi metrics CloudWatch Agent** | **IAM Role gắn policy `CloudWatchAgentServerPolicy`** | `AdministratorAccess` (thừa quyền), `AmazonEC2RoleforSSM` (sai mục đích) | `TD-Set6 Q19` |
| **Auto Scaling Group cần phản hồi nhanh trong 1 phút** | **EC2 Detailed Monitoring (chu kỳ 1 phút)** | Basic Monitoring (chu kỳ 5 phút gây trễ phản ứng) | `TD-Set1 Q45` |
| **Lưu trữ nhật ký kiểm toán API dài hơn 90 ngày** | **Tạo CloudTrail Trail xuất về S3 Bucket** | CloudTrail Event History (tự động biến mất sau 90 ngày) | `TD-Set5 Q47`, `TD-Set5 Q28` |
| **Kiểm toán chi tiết ai tải/xóa từng file trên S3 (`GetObject`, `PutObject`)** | **Bật CloudTrail S3 Data Events** | CloudTrail mặc định (chỉ ghi Management Events, không ghi Data Events) | `TD-Set5 Q07` |
| **Phân tích lỗi HTTP 504, request URL và độ trễ backend target** | **Application Load Balancer (ALB) Access Logs + Athena** | VPC Flow Logs (Layer 4, không thấy URL/HTTP code/target latency) | `TD-Set5 Q23` |
| **Truyền log thời gian thực từ CloudWatch sang OpenSearch/SIEM** | **CloudWatch Logs Subscription Filter $\rightarrow$ Kinesis Data Firehose** | Xuất log thủ công qua Console (độ trễ cao, không tự động) | `TD-Set3 Q05` |
| **Tìm nút thắt cổ chai độ trễ microservices/Lambda/DynamoDB** | **AWS X-Ray** (`Tracing: Active`) | CloudWatch Logs thông thường (khó tái tạo Service Map phân tán) | `TD-Set3 Q60`, `TD-Set4 Q51` |
| **Kiểm tra tuân thủ chính sách mật khẩu IAM Password Policy** | **AWS Config Managed Rule `iam-password-policy`** | Viết script quét thủ công (tốn công, không liên tục) | `TD-Set4 Q45` |
| **Tự động vá lỗi tài nguyên lệch chuẩn cấu hình** | **AWS Config + SSM Automation Remediation** | Thông báo email chờ con người xử lý thủ công | `TD-Set5 Q04` |
| **Bảo vệ tính toàn vẹn file log kiểm toán trước tòa án** | **CloudTrail Log File Integrity Validation (SHA-256 HMAC)** | Lưu text file thông thường (dễ bị nghi ngờ chỉnh sửa) | `TD-Set5 Q28` |
| **Cảnh báo cuộc gọi API trái phép/Root login** | **CloudTrail + CloudWatch Metric Filter + SNS** | Chỉ dùng CloudWatch Logs (thiếu bộ lọc sự kiện API) | Chuẩn AWS |
| **Kiểm tra chứng chỉ ACM bên thứ 3 sắp hết hạn** | **AWS Config managed rule `acm-certificate-expiration-check`** | Tự động gia hạn của ACM (không áp dụng cho imported certs) | `U-PT2 Q35`, `TD-Set6 Q03` |
| **Tự động phục hồi máy ảo khi lỗi phần cứng AWS** | **CloudWatch Alarm trên `StatusCheckFailed_System` + EC2 Auto-Recovery** | Can thiệp thủ công (downtime kéo dài) | `CM-PT5 Q03` |
| **Giám sát tập trung đa tài khoản Organizations** | **CloudWatch Cross-Account Observability** | AssumeRole thủ công từng tài khoản hoặc copy duplicate log | `CM-PT5 Q12` |
| **Giám sát chuyên sâu container ECS/EKS/Fargate** | **CloudWatch Container Insights** | CloudWatch Basic Metrics (chỉ đo cấp độ cụm/instance) | `CM-PT5 Q54` |
| **Giám sát OS Processes của RDS ở tần suất 1-60s** | **RDS Enhanced Monitoring** | Standard Monitoring (chỉ đo CPU hypervisor chu kỳ 1 phút) | `TD-Set1 Q25`, `TD-Set4 Q49` |
| **Phân tích câu lệnh SQL gây nghẽn RDS theo AAS** | **RDS Performance Insights** | Enhanced Monitoring (chỉ đo OS processes, không đo Top SQL) | `TD-Set4 Q14` |
| **Giữ chân máy chủ flush log trước khi terminate** | **ASG Lifecycle Hook `Terminating:Wait`** | Để instance terminate ngay lập tức (làm mất file log) | `TD-Set5 Q45` |
| **Phát hiện lỗi ứng dụng 500 $\rightarrow$ Tự động reboot** | **CloudWatch Logs Metric Filter $\rightarrow$ Alarm $\rightarrow$ EC2 Reboot** | Viết cronjob kiểm tra log thủ công | `TD-Set4 Q43`, `CM-PT1 Q26` |
| **Kiểm tra Security Group mở SSH 0.0.0.0/0** | **AWS Config Managed Rule `restricted-ssh`** | Rà soát Security Groups thủ công | `CM-PT4 Q51` |
| **Cảnh báo khi có IAM User mới được tạo lập** | **EventBridge Rule (CloudTrail `CreateUser`) $\rightarrow$ SNS** | Quét danh sách IAM User định kỳ | `CM-PT2 Q50` |
| **Truy vấn SQL lịch sử sự kiện CloudTrail trên S3** | **Amazon Athena (phân vùng theo date/region)** | Tải từng file log JSON về máy giải nén | `CM-PT5 Q65` |
| **Tự động cảnh báo & xin tăng quota trước khi hết** | **AWS Service Quotas + CloudWatch Alarms** | Chờ tới khi bị lỗi hạn mức mới gửi ticket hỗ trợ | `TD-Set5 Q12` |

---

## 3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### Luồng Tự Động Phát Hiện & Khắc Phục Sự Cố An Ninh (EventBridge, CloudTrail vs Config)

```mermaid
sequenceDiagram
    autonumber
    actor Admin as Kẻ Tấn Công / Sơ Suất Vận Hành
    participant EC2 as Amazon EC2 Security Group
    participant CT as AWS CloudTrail
    participant EB as Amazon EventBridge
    participant Lambda as Remediation Lambda
    participant SecOps as Đội Ngũ An Ninh (Slack / PagerDuty)

    Admin->>EC2: Gọi ec2:AuthorizeSecurityGroupIngress (Mở port 22 tới 0.0.0.0/0)
    EC2-->>Admin: Port 22 mở công khai trên Internet!
    Note over CT,EB: Quá trình đệm và phát sự kiện CloudTrail mất từ 1 - 5 phút (Không phải tức thì)
    EC2->>CT: Ghi nhận sự kiện Management Event API Call
    CT->>EB: Chuyển tiếp sự kiện API Call tới EventBridge Bus (Độ trễ ~1-5 phút)
    EB->>EB: Pattern Rule khớp hành vi mở port 22 trái phép
    EB->>Lambda: Kích hoạt hàm khắc phục khẩn cấp
    Lambda->>EC2: Gọi ec2:RevokeSecurityGroupIngress (Đóng ngay lập tức port 22)
    Lambda->>SecOps: Bắn cảnh báo nguy cấp kèm ARN người gọi và Source IP
```

> ⚠️ **LƯU Ý KIẾN TRÚC VỀ ĐỘ TRỄ (LATENCY GOTCHA)**:  
> Việc bắt sự kiện API Call qua CloudTrail tới EventBridge có **độ trễ đệm từ 1 đến 5 phút** (theo SLA của CloudTrail). Do đó hệ thống có một khoảng mù an ninh ngắn trước khi Lambda được kích hoạt.  
> 👉 **Giải pháp chuẩn hóa thời gian thực**: Sử dụng **AWS Config Rule (với trigger loại `Configuration Changes`)** hoặc **AWS Firewall Manager** để áp đặt chính sách tự động sửa lỗi (**Automated Remediation**) ngay khi Configuration Item vừa thay đổi.

---

## 4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Related AWS Service | Purpose (Mục đích tích hợp) | Integration Method (Phương thức tích hợp) | Practical Example (Ví dụ thực tiễn) |
| :--- | :--- | :--- | :--- |
| **Amazon S3** | Lưu trữ dài hạn cho log kiểm toán và file nén CloudTrail | S3 Bucket Policy & Lifecycle Rules | Xuất log CloudTrail sang S3 và tự động chuyển sang S3 Glacier Flexible Archive sau 90 ngày để tối ưu chi phí. |
| **Amazon OpenSearch Service** | Tìm kiếm toàn văn và trực quan hóa phân tích log nâng cao | CloudWatch Logs Subscription Filter | Đẩy luồng log ứng dụng từ CloudWatch sang OpenSearch Dashboards để vẽ biểu đồ và phân tích lỗi. |
| **AWS Systems Manager** | Cài đặt tự động CloudWatch Agent và thực thi kịch bản khắc phục của Config | State Manager & Run Command | Tự động cài đặt Unified CloudWatch Agent lên toàn bộ 100 máy chủ EC2 mới tạo qua SSM Distributor. |
| **AWS X-Ray** | Truy vết phân tán (Distributed Tracing) kết hợp với CloudWatch | CloudWatch ServiceLens & X-Ray SDK | Hiển thị bản đồ Service Map phân tích chi tiết độ trễ của từng microservice từ frontend tới database. |
| **Amazon EventBridge** | Định tuyến cảnh báo và kích hoạt phản ứng tự động | Event Rule Target | Khi CloudWatch Alarm chuyển sang trạng thái ALARM, EventBridge tự động tạo ticket sự cố trên ServiceNow. |

---

## 5. Bảng So Sánh Trong Hệ Sinh Thái AWS (Ecosystem Comparison)

### So sánh các giải pháp quan sát, kiểm toán và phân tích log

| Tiêu chuẩn so sánh | Amazon CloudWatch | AWS CloudTrail | AWS Config | Amazon OpenSearch Service | AWS X-Ray |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Trọng tâm giám sát** | **Hiệu năng & Sức khỏe vận hành** (Metrics, Logs, Alarms). | **Kiểm toán hành vi người dùng & Gọi API** (Who did what). | **Lịch sử cấu hình & Tuân thủ quy chuẩn** (Compliance). | **Tìm kiếm toàn văn & Phân tích log quy mô lớn**. | **Truy vết phân tán & Phân tích độ trễ microservices**. |
| **Đơn vị dữ liệu** | Metrics chuỗi thời gian & Application Logs. | API Event JSON records. | Configuration Items (CIs). | JSON Documents & Kibana/OpenSearch Dashboards. | Traces, Segments & Subsegments. |
| **Nguồn phát sinh** | Máy chủ, Container, Lambda, Dịch vụ AWS. | AWS API Endpoints (Console, CLI, SDK). | AWS Resource Metadata. | Đẩy từ CloudWatch, Kinesis, Logstash. | AWS X-Ray SDK nhúng trong mã nguồn ứng dụng. |
| **Thời gian lưu trữ** | Metrics: 15 tháng.<br>Logs: Tùy chỉnh (1 ngày đến vĩnh viễn). | Event History: 90 ngày.<br>Trail S3: Vĩnh viễn. | Tùy chỉnh lưu trữ snapshot cấu hình trên S3 (vĩnh viễn). | Theo dung lượng đĩa EBS gắn vào cụm OpenSearch. | 30 ngày (cố định). |
| **Mô hình tính phí** | Cước nạp log (\$0.50/GB), custom metrics (\$0.30/metric), alarms (\$0.10/alarm). | Miễn phí Event History; Data Events: \$0.10/100k events. | \$0.003 / CI thay đổi + \$0.001 / Rule evaluation. | Tính phí theo giờ máy chủ OpenSearch và dung lượng ổ cứng EBS. | 100,000 traces đầu miễn phí; \$5.00 / 1 triệu traces ghi nhận. |
| **Khuyến nghị sử dụng** | Công cụ mặc định số 1 cho giám sát vận hành hạ tầng AWS. | Bắt buộc bật trên 100% tài khoản AWS cho mục đích an ninh và kiểm toán. | Bắt buộc cho doanh nghiệp cần chứng chỉ bảo mật (PCI-DSS, ISO, SOC2). | Dành cho các hệ thống cần tìm kiếm log phức tạp với giao diện dashboard trực quan. | Gỡ lỗi nghẽn cổ chai (Bottlenecks) và xác định microservice gây trễ trong hệ sinh thái phân tán. |

---

## 6. Mô Hình Tính Phí & Chiến Lược Tối Ưu Chi Phí (FinOps & Cost Optimization)

### 6.1. Bảng Cấu Trúc Định Giá Chi Tiết

| Thành phần Dịch Vụ | Đơn giá AWS niêm yết (us-east-1) | Cơ chế đo lường | Ghi chú tối ưu hóa chi phí FinOps |
| :--- | :--- | :--- | :--- |
| **CloudWatch Metrics (Basic)** | **\$0.00** | Chu kỳ 5 phút | Miễn phí hoàn toàn cho các metrics mặc định của dịch vụ AWS. |
| **CloudWatch Custom Metrics** | **\$0.30 / metric / tháng** | Tính trên mỗi metric gửi lên | Tránh gửi các metric có độ phân giải cao với dimensions có độ biến thiên lớn (như User ID). |
| **CloudWatch Logs Ingestion (Standard)** | **\$0.50 / GB nạp vào** | Tính theo dung lượng log nạp | Đổi Log Level từ DEBUG sang INFO/WARN trên môi trường Production. |
| **CloudWatch Logs Ingestion (IA)** | **\$0.25 / GB nạp vào** | **Rẻ hơn 50%** so với Standard | Dùng cho các log chỉ để lưu trữ dự phòng không cần cảnh báo thời gian thực. |
| **CloudWatch Logs Storage** | **\$0.03 / GB / tháng** | Tính theo dung lượng tích lũy | Bắt buộc thiết lập Log Retention Policy (30-90 ngày), không để `Never Expire`. |
| **CloudWatch Logs Insights** | **\$0.005 / GB quét** | Tính theo dung lượng dữ liệu quét | Luôn thu hẹp khung thời gian truy vấn để tránh quét hàng TB dữ liệu log cũ. |
| **CloudTrail Management Events** | **\$0.00** | Miễn phí 90 ngày console & 1st Trail | Không tốn chi phí quản lý kiểm toán cơ bản. |
| **CloudTrail Data Events** | **\$0.10 / 100,000 events** | Tính theo số sự kiện dữ liệu | Tránh bật trên các S3 Bucket chứa ảnh/video tĩnh có lưu lượng tải hàng triệu request/ngày. |
| **AWS Config Recorded CIs** | **\$0.003 / CI** | Tính trên mỗi thay đổi cấu hình | Chuyển từ "Record all resources" sang "Specific resource types" để tránh bẫy ENI tạm thời. |

---

### 6.2. 5 Kịch Bản Tối Ưu Hóa Chi Phí Thực Tế (FinOps Scenarios)

#### Kịch bản 1: Thiết lập chính sách hết hạn lưu trữ cho CloudWatch Log Groups
- **Bối cảnh**: Doanh nghiệp vận hành 120 microservices trong 3 năm qua. Theo mặc định của AWS, toàn bộ các Log Group được tạo ra đều có thời gian lưu trữ là **`Never Expire`** (Không bao giờ hết hạn). Tổng dung lượng log tích lũy đã đạt **35 TB (35,000 GB)**.
- **Tính toán chi phí lưu trữ tích lũy**:
  $$ \text{Cost}_{\text{Storage\_NeverExpire}} = 35{,}000 \text{ GB} \times \$0.03/\text{GB} = \$1{,}050/\text{tháng} \quad (\$12{,}600/\text{năm}) $$
- **Giải pháp tối ưu**:
  - Đặt Retention Period cho toàn bộ Log Groups là **30 ngày** (dung lượng log 30 ngày gần nhất chỉ chiếm khoảng 3 TB = 3,000 GB).
  - Với 32 TB log cũ bắt buộc phải lưu trữ 5 năm phục vụ kiểm toán: Xuất sang **Amazon S3** và áp dụng S3 Lifecycle chuyển sang **S3 Glacier Deep Archive** với đơn giá **\$0.00099/GB/tháng**:
  $$ \text{Cost}_{\text{CW\_Optimized}} = 3{,}000 \text{ GB} \times \$0.03 = \$90/\text{tháng} $$
  $$ \text{Cost}_{\text{Glacier}} = 32{,}000 \text{ GB} \times \$0.00099 \approx \$31.68/\text{tháng} $$
  $$ \text{Total Cost}_{\text{New}} = \$90 + \$31.68 = \$121.68/\text{tháng} $$
- **Hiệu quả kinh tế**:
  $$ \text{Tiết kiệm} = \$1{,}050 - \$121.68 = \$928.32/\text{tháng} \quad (\$11{,}140/\text{năm}) \implies \text{Tiết kiệm } 88.4\% \text{ chi phí lưu trữ log} $$

#### Kịch bản 2: Kiểm soát bẫy chi phí Log Ingestion bằng cách điều chỉnh Log Level
- **Bối cảnh**: Hệ thống microservices chạy trên cụm 50 máy chủ EC2. Do sơ suất, file cấu hình logging của ứng dụng ở môi trường Production bị đặt ở mức `DEBUG`. Mỗi ngày hệ thống sinh ra và đẩy lên CloudWatch tới **200 GB log** (chứa toàn bộ chi tiết câu SQL và health check 5s/lần của ALB):
- **Tính toán chi phí nạp log**:
  $$ \text{Dung lượng tháng} = 200 \text{ GB/ngày} \times 30 = 6{,}000 \text{ GB/tháng} $$
  $$ \text{Cost}_{\text{Ingestion\_DEBUG}} = 6{,}000 \times \$0.50/\text{GB} = \$3{,}000/\text{tháng} \quad (\$36{,}000/\text{năm}) $$
- **Giải pháp tối ưu**:
  - Đổi Log Level trên môi trường Production sang `INFO` hoặc `WARN`.
  - Cấu hình web server bỏ qua ghi log truy cập đối với endpoint `/health` và `/ping`.
  - Dung lượng log thực tế giảm 90% xuống chỉ còn **20 GB/ngày (600 GB/tháng)**:
  $$ \text{Cost}_{\text{Ingestion\_INFO}} = 600 \times \$0.50/\text{GB} = \$300/\text{tháng} $$
- **Hiệu quả kinh tế**:
  $$ \text{Tiết kiệm} = \$3{,}000 - \$300 = \$2{,}700/\text{tháng} \quad (\$32{,}400/\text{năm}) \implies \text{Cắt giảm } 90\% \text{ chi phí nạp log} $$

#### Kịch bản 3: Tránh bẫy chi phí CloudTrail Data Events trên S3 Buckets lưu lượng cao
- **Bối cảnh**: Đội ngũ an ninh tạo một CloudTrail Trail mới và vô tình bật tùy chọn "All S3 Data Events" cho toàn bộ tài khoản. Tài khoản có một S3 Bucket chứa hình ảnh và video tĩnh phục vụ ứng dụng di động với **300 triệu lượt tải file (`s3:GetObject`) mỗi tháng**.
- **Tính toán chi phí CloudTrail Data Events**:
  $$ \text{Cost}_{\text{DataEvents}} = \left( \frac{300{,}000{,}000}{100{,}000} \right) \times \$0.10 = \$300/\text{tháng} \quad (\$3{,}600/\text{năm}) $$
- **Giải pháp tối ưu**:
  - Sử dụng **Advanced Event Selectors** trong CloudTrail để khoanh vùng:
    - Loại trừ hoàn toàn các bucket chứa tài nguyên tĩnh công khai.
    - Chỉ bật Data Events trên các S3 Bucket chứa dữ liệu tài chính nhạy cảm và chỉ lọc các sự kiện ghi/xóa nguy hiểm: `PutObject`, `DeleteObject`.
  - Nếu cần thống kê lượt tải ảnh tĩnh, bật tính năng **S3 Server Access Logging** (hoàn toàn **MIỄN PHÍ** cước ghi nhận sự kiện, chỉ tốn vài cent tiền lưu file text trên S3).
- **Hiệu quả kinh tế**:
  $$ \text{Tiết kiệm trọn vẹn } \$300/\text{tháng} \quad (\$3{,}600/\text{năm}) \text{ mà không ảnh hưởng tới an ninh cốt lõi} $$

#### Kịch bản 4: Thu hẹp phạm vi ghi nhận tài nguyên của AWS Config (Specific Resource Types)
- **Bối cảnh**: Doanh nghiệp bật AWS Config với tùy chọn mặc định là "Record all resources in this region". Hệ thống sử dụng cụm EMR Spark và Auto Scaling Group tạo ra hàng ngàn máy ảo và container ngắn hạn.
- **Tính toán chi phí khi ghi nhận toàn bộ**:
  - Mỗi khi container hoặc máy ảo tạm bật lên rồi tắt đi, các tài nguyên liên kết ngắn hạn như ENI, Security Group Attachment đều tạo ra Configuration Items (CIs). Hệ thống phát sinh **350,000 CIs/tháng**:
  $$ \text{Cost}_{\text{Config\_All}} = 350{,}000 \times \$0.003/\text{CI} = \$1{,}050/\text{tháng} $$
- **Giải pháp tối ưu**:
  - Chuyển chế độ ghi nhận sang **"Specific resource types"**.
  - Chỉ chọn các tài nguyên cốt lõi có rủi ro bảo mật dài hạn: `AWS::IAM::*`, `AWS::S3::Bucket`, `AWS::EC2::SecurityGroup`, `AWS::EC2::Instance`, `AWS::RDS::DBInstance`.
  - Loại trừ toàn bộ các tài nguyên ngắn hạn có vòng đời vài phút như `AWS::EC2::NetworkInterface`.
  - Số lượng CIs ghi nhận thực tế giảm xuống chỉ còn khoảng 15,000 CIs/tháng:
  $$ \text{Cost}_{\text{Config\_Specific}} = 15{,}000 \times \$0.003 = \$45/\text{tháng} $$
- **Hiệu quả kinh tế**:
  $$ \text{Tiết kiệm} = \$1{,}050 - \$45 = \$1{,}005/\text{tháng} \quad (\$12{,}060/\text{năm}) \implies \text{Tiết kiệm } 95.7\% \text{ chi phí AWS Config} $$

#### Kịch bản 5: Tối ưu hóa chi phí truy vấn phân tích CloudWatch Logs Insights
- **Bối cảnh**: Khi điều tra sự cố website, 4 kỹ sư thường xuyên mở CloudWatch Logs Insights, chọn phạm vi mặc định là "Last 4 weeks" trên Log Group có dung lượng 5 TB và nhấn "Run query" 12 lần với các câu lệnh lọc khác nhau trong buổi sáng.
- **Tính toán chi phí quét dữ liệu**:
  - Đơn giá truy vấn của Logs Insights là \$0.005/GB dữ liệu quét:
  $$ \text{Chi phí mỗi lần quét} = 5{,}000 \text{ GB} \times \$0.005 = \$25.00/\text{lần} $$
  $$ \text{Cost}_{\text{Insights}} = 12 \text{ lần} \times \$25.00 = \$300.00 \quad (\text{chỉ trong 1 buổi sáng!}) $$
- **Giải pháp tối ưu**:
  - Thu hẹp khung thời gian truy vấn về đúng khoảng thời gian xảy ra sự cố (ví dụ: chỉ chọn 30 phút xung quanh thời điểm lỗi thay vì 4 tuần).
  - Bổ sung điều kiện lọc `@logStream` cụ thể để không quét toàn bộ streams.
  - Dung lượng quét mỗi lần giảm từ 5,000 GB xuống còn 10 GB:
  $$ \text{Cost}_{\text{Optimized}} = 12 \times (10 \text{ GB} \times \$0.005) = \$0.60 $$
- **Hiệu quả kinh tế**:
  $$ \text{Tiết kiệm} = \$300.00 - \$0.60 = \$299.40 \implies \text{Cắt giảm } 99.8\% \text{ chi phí truy vấn} $$

---

## 7. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Tình huống sự cố (Problem) | Nguyên nhân cốt lõi (Root Cause) | Các bước điều tra & Chỉ số giám sát (Metrics & Logs) | Giải pháp khắc phục (Remediation) | Biện pháp phòng ngừa (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Không thấy metric RAM (Memory) của máy ảo EC2 trên CloudWatch** | Chưa cài đặt hoặc chưa cấu hình dịch vụ **Unified CloudWatch Agent** trên máy ảo. | - Kiểm tra trạng thái tiến trình `amazon-cloudwatch-agent` trên máy ảo.<br>- Kiểm tra file log `/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log`. | Cài đặt Unified CloudWatch Agent và nạp file cấu hình `amazon-cloudwatch-agent.json` có khai báo mục `mem_used_percent`. | Tự động hóa cài sẵn CloudWatch Agent vào Golden AMI bằng EC2 Image Builder. |
| **CloudTrail không ghi nhận các thao tác tải file trên S3 (`s3:GetObject`)** | Chưa cấu hình **Data Events** trong Trail (mặc định CloudTrail chỉ ghi Management Events). | - Kiểm tra tab **Data events** trong cấu hình của CloudTrail Trail.<br>- Tra cứu CloudTrail Event History tìm `GetObject`. | Thêm S3 Data Events cho bucket cần giám sát thông qua Advanced Event Selectors. | Chỉ bật Data Events cho các bucket bảo mật cốt lõi để tránh phát sinh chi phí lớn. |
| **CloudWatch Alarm liên tục ở trạng thái `INSUFFICIENT_DATA`** | Metric không gửi dữ liệu định kỳ hoặc khoảng thời gian đánh giá (Period) quá ngắn so với tần suất gửi số liệu. | - Kiểm tra xem metric có datapoint mới gửi về không.<br>- Kiểm tra quyền IAM `cloudwatch:PutMetricData` của máy ảo. | Cấu hình cài đặt "Treat missing data" (chọn `treat as ignore` hoặc `treat as bad` tùy ngữ cảnh), hoặc tăng Period lên 300 giây. | Đảm bảo ứng dụng gửi metric đều đặn và máy ảo có IAM Role hợp lệ. |
| **Chi phí AWS Config tăng đột biến gấp nhiều lần bình thường** | Tùy chọn "Record all resources" đang bật trong khi hệ thống có nhiều máy ảo/container tạm thời tạo ra hàng ngàn ENI ngắn hạn. | - Xem mục **Resource types recorded** trong cấu hình AWS Config.<br>- Giám sát số lượng Configuration Items ghi nhận theo ngày. | Chuyển chế độ ghi nhận của AWS Config sang **"Specific resource types"** và loại trừ các tài nguyên ngắn hạn. | Thiết lập CloudWatch Billing Alarm để cảnh báo sớm khi chi phí Config vượt ngưỡng. |
| **Máy ảo EC2 bị treo nhưng CloudWatch Alarm không kích hoạt** | Alarm chỉ theo dõi CPU (CPU có thể ở mức 0% khi kernel bị sập), không theo dõi **StatusCheckFailed_System**. | - Kiểm tra chỉ số `StatusCheckFailed_System` và `StatusCheckFailed_Instance` trên CloudWatch. | Tạo CloudWatch Alarm trên metric `StatusCheckFailed_System` và gắn hành động **EC2 Recovery Action**. | Luôn cấu hình bộ đôi Alarms theo dõi cả CPU lẫn Status Checks cho các máy ảo Production. |

---

## 8. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Vàng Giám Sát & Kiểm Toán AWS (Golden Rules)
1. **Cài đặt CloudWatch Agent để lấy RAM & Disk**: AWS Hypervisor không tự đo được RAM và Disk bên trong hệ điều hành máy ảo (`TD-Set2 Q61`).
2. **Luôn đặt Log Retention Policy**: Không bao giờ để Log Groups ở chế độ `Never Expire`; luôn đặt thời hạn 14-30 ngày và xuất log cũ sang S3 Glacier để tiết kiệm 88% chi phí.
3. **Đổi Log Level trên Production**: Luôn chuyển từ DEBUG sang INFO/WARN để giảm 90% chi phí nạp log (Log Ingestion).
4. **Bật Log File Integrity cho CloudTrail**: Kích hoạt kiểm tra tính toàn vẹn file log kết hợp S3 Object Lock để chống xóa dấu vết an ninh (`TD-Set5 Q28`).
5. **Cấu hình EC2 Recovery Action**: Luôn gắn hành động tự phục hồi máy ảo vào CloudWatch Alarm `StatusCheckFailed_System` (`CM-PT5 Q03`).
6. **Thu hẹp phạm vi AWS Config**: Chỉ ghi nhận các loại tài nguyên cốt lõi (Specific Resource Types) để tránh bẫy chi phí CIs từ các tài nguyên tạm.
7. **Sử dụng Composite Alarms**: Kết hợp nhiều điều kiện logic để loại bỏ hiện tượng báo động giả và chống kiệt sức cho đội ngũ vận hành.

---

### Danh Mục Kiểm Tra Năng Lực (Learning Checklist)
- [ ] Tôi phân biệt được vai trò cốt lõi giữa Amazon CloudWatch (hiệu năng/vận hành), AWS CloudTrail (kiểm toán API/danh tính), và AWS Config (quản trị tuân thủ cấu hình).
- [ ] Tôi biết cách cài đặt Unified CloudWatch Agent để thu thập số liệu RAM (`mem_used_percent`) và Swap space (`swap_used_percent`) (`TD-Set2 Q61`, `TD-Set6 Q19`).
- [ ] Tôi hiểu rõ nguyên lý hoạt động của CloudWatch Logs Insights và cách tối ưu hóa chi phí truy vấn.
- [ ] Tôi phân biệt được Management Events và Data Events trong AWS CloudTrail, và biết cách bật S3 Data Events khi cần kiểm toán `s3:GetObject` (`TD-Set5 Q07`).
- [ ] Tôi hiểu nguyên lý hoạt động của CloudWatch Cross-Account Observability trong AWS Organizations (`CM-PT5 Q12`).
- [ ] Tôi phân biệt được phạm vi giám sát của CloudWatch Container Insights (ECS/EKS/Fargate) và Application Insights (SQL Server, .NET, Java) (`CM-PT5 Q54`, `TD-Set5 Q23`).
- [ ] Tôi phân biệt được 3 tầng giám sát Amazon RDS: Standard Monitoring, Enhanced Monitoring (OS metrics 1-60s), và Performance Insights (AAS Top SQL) (`TD-Set1 Q25`, `TD-Set4 Q14`).
- [ ] Tôi nắm vững 3 phương pháp cảnh báo chứng chỉ ACM sắp hết hạn: EventBridge Rule, CloudWatch Metric `DaysToExpiry`, và Config Rule `acm-certificate-expiration-check` (`TD-Set6 Q03`, `U-PT2 Q35`).
- [ ] Tôi biết cách sử dụng ASG Lifecycle Hook `Terminating:Wait` để giữ chân máy chủ và tải hết log lên S3 trước khi bị tắt (`TD-Set5 Q45`).
- [ ] Tôi hiểu chuỗi phản ứng tự động: CloudWatch Logs Metric Filter $\rightarrow$ CloudWatch Alarm $\rightarrow$ SNS Notification / EC2 Reboot Action (`TD-Set4 Q43`, `CM-PT1 Q26`).
- [ ] Tôi nắm vững các quy tắc Config Managed Rules thông dụng: `restricted-ssh`, `access-keys-rotated`, `required-tags`, `encrypted-volumes`, `s3-bucket-public-read-prohibited` (`TD-Set2 Q08`, `CM-PT4 Q51`).
- [ ] Tôi biết rằng CloudTrail mặc định mã hóa bằng SSE-S3 (`TD-Set5 Q47`) và có thể dùng Amazon Athena để chạy truy vấn SQL kiểm toán cuộc gọi API (`CM-PT5 Q65`).
- [ ] Tôi hiểu cách dùng EventBridge bắt sự kiện CloudTrail `CreateUser` để phát hiện tài khoản IAM User mới được tạo (`CM-PT2 Q50`).
- [ ] Tôi biết cách sử dụng AWS Service Quotas kết hợp CloudWatch Alarms để cảnh báo và tự động gửi yêu cầu tăng hạn mức tài nguyên trước khi chạm trần (`TD-Set5 Q12`).
- [ ] Tôi biết cách cấu hình S3 Object Lock và Log File Integrity Validation để bảo vệ nhật ký kiểm toán (`TD-Set5 Q28`).
- [ ] Tôi giải thích được nguyên lý hoạt động của AWS Config Rules và Automated Remediation qua Systems Manager (`TD-Set5 Q04`).
- [ ] Tôi hiểu cách cấu hình Composite Alarms để giảm thiểu báo động giả trong môi trường doanh nghiệp lớn.

---

### Liên kết và Tài liệu Liên quan
- 📖 [Ghi Chú Bài Học Chương 24: Giám Sát CloudWatch, CloudTrail & Config](../Lesson_Notes/24_AWS_Monitoring_CloudWatch_CloudTrail_Config.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](../GLOSSARY.md)
- ⏭️ Tiếp tục chuyển sang chuyên đề: [Khắc Phục Thảm Họa & Di Chuyển Lên Đám Mây: Disaster Recovery, AWS DRS, DMS & Backup](./Disaster_Recovery_Migration.md).
