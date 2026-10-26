# Tài Liệu Học Tập Chuyên Sâu: AWS KMS, Secrets Manager, CloudHSM, WAF & Dịch Vụ An Ninh Đám Mây (Security & Encryption)

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Senior AWS Solutions Architect & Cloud DevOps Engineer (cập nhật mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt (Bảo lưu toàn bộ thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Các dịch vụ liên quan**: AWS KMS, AWS Secrets Manager, AWS Systems Manager Parameter Store, AWS CloudHSM, AWS WAF, AWS Shield, Amazon GuardDuty, Amazon Inspector, Amazon Macie.

---

## 6.1. Tổng Quan Dịch Vụ (Service Overview)

### Dịch vụ gì?
Bảo vệ dữ liệu và an toàn thông tin là trụ cột hàng đầu (Security Pillar) trong mô hình Well-Architected của AWS. Hệ sinh thái mã hóa và an ninh của AWS cung cấp một kiến trúc phòng thủ chiều sâu (Defense-in-Depth) toàn diện:
1. **AWS Key Management Service (AWS KMS)**: Dịch vụ quản lý khóa mật mã tập trung, tích hợp gốc với hơn 100 dịch vụ AWS, cho phép tạo, xoay vòng và kiểm soát các khóa mã hóa (**KMS Keys**) để bảo vệ dữ liệu lưu trữ (Encryption at Rest) và hỗ trợ thuật toán kháng lượng tử (Post-Quantum Hybrid Cryptography).
2. **AWS Secrets Manager**: Dịch vụ chuyên dụng quản lý, mã hóa và **tự động luân chuyển (Auto-rotate)** các thông tin bí mật nhạy cảm (mật khẩu cơ sở dữ liệu RDS/Aurora, API keys, OAuth tokens) thông qua các hàm AWS Lambda mà không làm gián đoạn ứng dụng.
3. **AWS Systems Manager Parameter Store**: Kho lưu trữ tham số cấu hình tập trung phân tầng (Hierarchical Key-Value Store), hỗ trợ PlainText và mã hóa **`SecureString`** qua KMS với chi phí tối ưu (tầng Standard hoàn toàn miễn phí).
4. **AWS CloudHSM**: Thiết bị mô-đun bảo mật phần cứng chuyên dụng (**Hardware Security Module**), đạt chuẩn kiểm định an ninh **FIPS 140-2/3 Level 3**, đơn khách hàng (**Single-tenant**) trao quyền kiểm soát độc quyền vật liệu khóa cho doanh nghiệp.
5. **AWS WAF & AWS Shield**: Bộ đôi phòng ngự chu vi mạng: **AWS WAF** lọc lưu lượng web Layer 7 (chống SQLi, XSS, Brute-force bot) và **AWS Shield** bảo vệ chống tấn công từ chối dịch vụ phân tán (**DDoS Protection** Layer 3/4/7).
6. **Bộ Ba Trí Tuệ Nhân Tạo An Ninh**: **Amazon GuardDuty** (phát hiện mối đe dọa thông minh qua log), **Amazon Inspector** (quét lỗ hổng phần mềm CVE và mã nguồn tự động), và **Amazon Macie** (quét và bảo vệ dữ liệu định danh cá nhân nhạy cảm PII trên S3 bằng ML).

---

## 6.2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts, Security & Day-2 Operations)

### 1. Phân loại Khóa mã hóa trong AWS KMS (4 Chiều Độc Lập)

```mermaid
flowchart TD
    KMS[AWS KMS Keys] --> Dim1[1. Quyền Quản Trị & Sở Hữu]
    KMS --> Dim2[2. Thuật Toán Mật Mã]
    KMS --> Dim3[3. Phạm Vi Địa Lý]
    KMS --> Dim4[4. Nguồn Gốc Vật Liệu Khóa]

    Dim1 --> O1[AWS Owned Keys\nMiễn phí, Ẩn trong console, SSE-S3]
    Dim1 --> O2[AWS Managed Keys\naws/service, Miễn phí, Xoay vòng 1 năm]
    Dim1 --> O3[Customer Managed Keys - CMK\n$1/tháng, Toàn quyền Key Policy & Xoay vòng 90-2560 ngày]

    Dim2 --> C1[Symmetric Keys\nAES-256 GCM, Envelope Encryption]
    Dim2 --> C2[Asymmetric Keys\nRSA & ECC, Cặp Public/Private, Ký số]
    Dim2 --> C3[HMAC Keys\nXác thực toàn vẹn thông điệp 256-512 bit]

    Dim3 --> G1[Single-Region Keys\nHoạt động trong 1 Region duy nhất]
    Dim3 --> G2[Multi-Region Keys\nCùng Key ID & Key Material đa vùng]

    Dim4 --> M1[AWS KMS HSM\nMặc định, FIPS 140-2 Level 3 Multi-tenant]
    Dim4 --> M2[Imported BYOK\nTự nạp khóa, Kill-switch tức thì 1 giây]
    Dim4 --> M3[CloudHSM Store\nCụm HSM riêng FIPS 140-2 Level 3]
    Dim4 --> M4[External Key Store - XKS\nKhóa đặt tại On-Premises HSM vật lý]
```

#### A. 4 Chiều Phân Loại Chi Tiết
1. **Theo quyền quản trị**:
   - **AWS Owned Keys**: Thuộc hạ tầng nội bộ của AWS, hoàn toàn ẩn trong KMS Console, không ghi log riêng vào CloudTrail, miễn phí hoàn toàn (ví dụ: mã hóa mặc định SSE-S3).
   - **AWS Managed Keys**: Do AWS tự tạo trong tài khoản người dùng (`aws/s3`, `aws/ebs`, `aws/rds`). Hiển thị trên console, ghi log CloudTrail, nhưng người dùng **không thể sửa Key Policy, không thể chia sẻ xuyên tài khoản, không thể xóa thủ công**, và chu kỳ xoay vòng khóa cố định mỗi **1 năm (365 ngày)**.
   - **Customer Managed Keys (CMK)**: Khóa do người dùng tự tạo, toàn quyền kiểm soát qua **KMS Key Policy**, hỗ trợ phân quyền ủy nhiệm tạm thời (**KMS Grants**), chia sẻ xuyên tài khoản (**Cross-Account**), tùy biến tự động xoay vòng linh hoạt (**90 đến 2560 ngày**), bắt buộc thời gian ân hạn xóa an toàn (**Schedule Key Deletion từ 7 đến 30 ngày**). Chi phí: **$1.00/key/tháng**.
2. **Theo thuật toán mật mã**:
   - **Symmetric Keys (AES-256 GCM)**: Dùng chung một khóa cho Encrypt và Decrypt. Vật liệu khóa không bao giờ rời khỏi KMS HSM.
   - **Asymmetric Keys (RSA & ECC)**: Cặp Public Key (tải về máy gửi cho client/đối tác bên ngoài không có tài khoản AWS) và Private Key (giữ an toàn trong KMS để giải mã hoặc ký số `kms:Sign`).
   - **HMAC Keys**: Mã xác thực thông điệp băm đối xứng bảo đảm tính toàn vẹn dữ liệu.
3. **Theo phạm vi địa lý**:
   - **Single-Region Keys**: Chỉ tồn tại và giải mã trong một Region.
   - **Multi-Region Keys**: Gồm Primary Key và các Replica Keys sở hữu **cùng Key ID và cùng vật liệu khóa**, cho phép giải mã dữ liệu cục bộ tại Region đích mà không cần gọi API xuyên lục địa, giảm độ trễ từ 100ms xuống <5ms.
4. **Theo nguồn gốc vật liệu khóa**:
   - **KMS HSM (Mặc định)**: AWS sinh vật liệu khóa ngẫu nhiên.
   - **Imported Key Material (BYOK)**: Tự nạp khóa từ Data Center; hỗ trợ **Kill-Switch khẩn cấp** bằng lệnh `kms:DeleteKeyMaterial` xóa khóa sạch trong 1 giây để đóng băng dữ liệu tức thì.
   - **Custom Key Store (CloudHSM / XKS)**: Lưu khóa trong phần cứng CloudHSM chuyên dụng hoặc HSM on-premises ngoài đám mây để đáp ứng luật chủ quyền dữ liệu.

---

### 2. Nguyên Lý Mã Hóa Phong Bì (Envelope Encryption)

Khi dữ liệu có dung lượng lớn hơn 4 KB (giới hạn payload tối đa của lệnh `kms:Encrypt`), AWS KMS áp dụng cơ chế **Envelope Encryption**:

```mermaid
sequenceDiagram
    autonumber
    actor App as Ứng dụng Backend
    participant KMS as AWS KMS (CMK)
    participant Storage as Bộ Lưu Trữ (S3 / EBS / RDS)

    App->>KMS: Gọi GenerateDataKey (CMK ARN, KeySpec=AES_256)
    KMS-->>App: Trả về cặp Data Key: Plaintext Data Key + Encrypted Data Key
    Note over App: Ứng dụng mã hóa dữ liệu cục bộ bằng Plaintext Data Key
    App->>App: Mã hóa File lớn (AES-256 GCM)
    App->>App: Xóa sạch Plaintext Data Key khỏi bộ nhớ RAM
    App->>Storage: Lưu dữ liệu đã mã hóa + Encrypted Data Key (Ciphertext Blob)
    Note over Storage: Khi cần giải mã: Gửi Encrypted Data Key lên KMS lấy lại Plaintext Data Key
```

#### B. Phân Biệt Các Lệnh API Cốt Lõi Trong Envelope Encryption

| Lệnh API của AWS KMS | Dữ liệu trả về cho ứng dụng | Kịch bản sử dụng chuẩn mực |
| :--- | :--- | :--- |
| **`kms:GenerateDataKey`** | **Plaintext Data Key** + **Encrypted Data Key (Ciphertext)** | Dùng khi ứng dụng **cần mã hóa dữ liệu ngay lập tức trong bộ nhớ RAM**. Sau khi mã hóa xong file lớn, ứng dụng xóa ngay Plaintext Key khỏi RAM và chỉ lưu Encrypted Key đính kèm file. |
| **`kms:GenerateDataKeyWithoutPlaintext`** | **CHỈ TRẢ VỀ Encrypted Data Key (Ciphertext)** | Dùng cho kiến trúc bất đồng bộ hoặc bảo mật nghiêm ngặt: Tạo sẵn khóa mã hóa để gửi cho một hệ thống khác lưu trữ, hệ thống đó chỉ giải mã lấy khóa rõ khi thực sự cần xử lý. |
| **`kms:Decrypt`** | **Plaintext Data Key** | Nhận vào Encrypted Data Key blob và trả lại khóa rõ để ứng dụng giải mã file. Giới hạn payload tối đa của lệnh Decrypt là **4 KB**. |

---

#### C. Nguyên Lý Quyền Lực Tối Thượng Của KMS Key Policy (Key Policy Primacy)

```mermaid
flowchart TD
    Request[Yêu cầu truy cập KMS: Encrypt / Decrypt] --> CheckKP{KMS Key Policy\ncó cho phép không?}
    CheckKP -- Không có / Explicit Deny --> Deny[TỪ CHỐI TRUY CẬP NGAY LẬP TỨC\nAccess Denied]
    CheckKP -- Có ủy nhiệm cho Root Account --> CheckIAM{IAM Policy của User/Role\ncó cho phép không?}
    CheckIAM -- Cho phép --> Allow[CHO PHÉP TRUY CẬP\nAccess Granted]
    CheckIAM -- Không có quyền --> Deny
```

⚠️ **ĐIỂM NÓNG TRONG MỌI ĐỀ THI SAA/SAP & THỰC TẾ DOANH NGHIỆP**:
- **Key Policy là cơ chế kiểm soát bắt buộc cấp 1**: Khác với S3 Bucket Policy (tùy chọn), mọi khóa KMS **bắt buộc phải có một Key Policy**.
- **Nếu Key Policy không mở cửa, IAM Policy hoàn toàn vô giá trị**: Một kỹ sư sở hữu quyền `AdministratorAccess` (full `*.*` trong IAM) nhưng nếu không được khai báo trong KMS Key Policy thì **hoàn toàn không thể đọc hay giải mã dữ liệu của khóa đó**.
- **Cú pháp ủy quyền chuẩn cho tài khoản**:
  ```json
  {
    "Sid": "Enable IAM User Permissions",
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::111122223333:root"
    },
    "Action": "kms:*",
    "Resource": "*"
  }
  ```
  *Ý nghĩa*: Mệnh đề trên không cấp quyền trực tiếp cho mọi user, mà nó cấp quyền cho **mặt phẳng điều khiển IAM của tài khoản `111122223333`** được phép dùng IAM Policy để phân quyền tiếp cho người dùng. Nếu thiếu khối này, bạn sẽ bị mất quyền kiểm soát khóa!

---

### 3. Phân Tầng Bí Mật: AWS Secrets Manager vs SSM Parameter Store

```mermaid
flowchart TD
    Input[Dữ liệu cấu hình / Thông tin bí mật] --> CheckRotate{Cần tự động xoay vòng mật khẩu\nAuto-rotation cho DB/API?}
    CheckRotate -- Có --> SM[AWS Secrets Manager\n$0.40/secret/tháng\nTích hợp sẵn Lambda xoay vòng RDS]
    CheckRotate -- Không --> CheckSize{Dung lượng tham số\nvà chính sách hết hạn?}
    CheckSize -- <= 4KB, Không cần policy --> SSM_Std[SSM Parameter Store Standard\nHOÀN TOÀN MIỄN PHÍ $0.00\nHỗ trợ SecureString mã hóa KMS]
    CheckSize -- 4KB - 8KB, Cần báo hết hạn --> SSM_Adv[SSM Parameter Store Advanced\n$0.05/param/tháng\nCó Parameter Expiration Policies]
```

---

### 4. Phòng Ngự Chu Vi: AWS WAF vs AWS Shield Standard & Advanced

```mermaid
flowchart TD
    Internet[Lưu lượng Internet Người Dùng & Bot] --> ShieldStd[AWS Shield Standard\nLọc Layer 3/4: SYN Flood, UDP Reflection - Miễn Phí 100%]
    ShieldStd --> CloudFront[Amazon CloudFront / ALB / API Gateway]
    CloudFront --> WAF[AWS WAF\nLọc Layer 7: SQLi, XSS, Rate-Limiting, Bot Control]
    WAF --> Backend[Hạ Tầng Backend: EC2, ECS, Lambda]

    ShieldAdv[AWS Shield Advanced\n$3,000/tháng - Cam kết 1 năm\nHỗ trợ SRT 24/7 & DDoS Cost Protection] -.->|Bảo vệ toàn diện Layer 3/4/7| CloudFront
```

---

### 5. Bộ Ba Trí Tuệ Nhân Tạo An Ninh AWS

```mermaid
flowchart LR
    subgraph DataSources[Nguồn Dữ Liệu Giám Sát]
        Logs[VPC Flow / DNS / CloudTrail Logs]
        Compute[EC2 OS / ECR Containers / Lambda Code]
        S3Bucket[Amazon S3 Data Buckets]
    end

    subgraph AISecurityEngines[Bộ Ba AI An Ninh AWS]
        GD[Amazon GuardDuty\nPhát Hiện Mối Đe Dọa Xâm Nhập]
        Insp[Amazon Inspector\nQuét Lỗ Hổng CVE & Mã Nguồn]
        Macie[Amazon Macie\nPhát Hiện Dữ Liệu Nhạy Cảm PII]
    end

    Logs --> GD
    Compute --> Insp
    S3Bucket --> Macie

    GD --> Hub[AWS Security Hub / EventBridge Automation]
    Insp --> Hub
    Macie --> Hub
```

---

## 6.3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### Quy trình tự động xoay vòng mật khẩu RDS bằng Secrets Manager & Lambda

```mermaid
sequenceDiagram
    autonumber
    participant Event as Lịch Xoay Vòng (EventBridge: 30 ngày)
    participant SM as AWS Secrets Manager
    participant Lambda as Lambda Rotation Function (VPC)
    participant RDS as Amazon Aurora PostgreSQL

    Event->>SM: Kích hoạt tác vụ xoay vòng mật khẩu
    SM->>SM: Tạo phiên bản nháp bí mật mới (AWSPENDING)
    SM->>Lambda: Bước 1: createSecret (Tạo mật khẩu phức tạp mới)
    SM->>Lambda: Bước 2: setSecret (Đổi mật khẩu trong database)
    Lambda->>RDS: Thực thi ALTER USER db_user WITH PASSWORD 'new_pass'
    RDS-->>Lambda: Đổi mật khẩu thành công (200 OK)
    SM->>Lambda: Bước 3: testSecret (Kiểm tra đăng nhập bằng mật khẩu mới)
    Lambda->>RDS: Thử kết nối với credentials mới
    RDS-->>Lambda: Kết nối thành công
    SM->>Lambda: Bước 4: finishSecret (Hoàn tất)
    SM->>SM: Đổi nhãn AWSPENDING thành AWSCURRENT
```

---

## 6.4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Related AWS Service | Purpose (Mục đích tích hợp) | Integration Method (Phương thức tích hợp) | Practical Example (Ví dụ thực tiễn) |
| :--- | :--- | :--- | :--- |
| **Amazon S3** | Mã hóa dữ liệu lưu trữ đối tượng và giảm chi phí KMS | SSE-KMS kết hợp S3 Bucket Keys | Bật Bucket Keys giúp giảm 99% số cuộc gọi KMS API khi Athena quét hàng triệu file Parquet. |
| **Amazon RDS / Aurora** | Quản lý thông tin xác thực tự động và mã hóa bảng lưu trữ | Secrets Manager Native Integration & KMS CMK | Tự động xoay vòng mật khẩu Master DB mà không gián đoạn kết nối của cụm ECS Fargate. |
| **Amazon CloudFront** | Đưa lá chắn WAF ra biên mạng (Edge) để chặn đứng tấn công sớm | Gắn WebACL phạm vi Global (`us-east-1`) vào CloudFront | Chặn các cuộc tấn công SQLi và Brute-force bot ngay tại Edge Locations trước khi chạm tới VPC. |
| **Amazon EventBridge** | Phản ứng tự động hóa sự cố an ninh theo thời gian thực | Event Rule khớp sự kiện GuardDuty / Inspector | Khi GuardDuty phát hiện máy ảo EC2 bị nhiễm trojan đào coin, kích hoạt Lambda cách ly Security Group ngay tức khắc. |
| **AWS CloudTrail** | Kiểm toán toàn bộ các thao tác mã hóa, giải mã và sử dụng khóa | Quản lý sự kiện truy vết API KMS (`kms:*`) | Kiểm toán viên rà soát toàn bộ lịch sử ai đã giải mã dữ liệu thẻ tín dụng lúc nửa đêm qua CloudTrail Lake. |
| **AWS Systems Manager** | Cung cấp biến môi trường bảo mật cho container và máy chủ | SSM GetParameters / SecureString qua KMS | Container trên ECS nạp chuỗi cấu hình microservice từ Parameter Store mà không lưu trong Dockerfile. |

---

## 6.5. Bảng So Sánh Trong Hệ Sinh Thái AWS (Ecosystem Comparison)

### So sánh các giải pháp bảo vệ dữ liệu và quản lý mật mã

| Tiêu chuẩn so sánh | AWS KMS (CMK) | AWS CloudHSM | AWS Secrets Manager | SSM Parameter Store | HashiCorp Vault on AWS |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Bản chất dịch vụ** | Dịch vụ quản lý khóa mật mã đa người dùng (Multi-tenant) quản lý bởi AWS. | Thiết bị phần cứng bảo mật chuyên dụng đơn khách hàng (Single-tenant). | Dịch vụ lưu trữ và tự động xoay vòng thông tin bí mật chuyên dụng. | Kho lưu trữ tham số cấu hình ứng dụng phân tầng. | Phần mềm quản trị bí mật bên thứ 3 tự vận hành trên máy ảo EC2/EKS. |
| **Tiêu chuẩn kiểm định** | FIPS 140-2/3 Level 3 Cryptographic Modules. | **FIPS 140-2 Level 3** toàn bộ phần cứng chuyên dụng. | Được mã hóa bảo vệ bằng AWS KMS. | Hỗ trợ PlainText hoặc mã hóa bằng AWS KMS. | Tùy biến theo cấu hình backend lưu trữ. |
| **Tự động xoay vòng** | Tự động xoay vòng khóa KMS (90 - 2560 ngày). | Khách hàng tự lập trình và quản trị vòng đời khóa. | **Tích hợp sẵn gốc (Native)** với Lambda cho RDS/Redshift. | Không hỗ trợ sẵn (Phải tự viết Lambda kích hoạt ngoài). | Hỗ trợ xoay vòng qua Vault Dynamic Secrets engine. |
| **Quyền kiểm soát vật liệu khóa** | AWS quản lý bên trong HSM; người dùng không trích xuất được Plaintext Key. | **Khách hàng nắm quyền kiểm soát độc quyền**, AWS không thể can thiệp. | AWS quản lý dữ liệu bí mật đã được mã hóa. | AWS quản lý trong hệ thống phân tán. | Khách hàng nắm giữ chìa khóa Unseal Keys. |
| **Giao thức hỗ trợ** | AWS REST API / AWS SDK / SigV4. | PKCS#11, Java Cryptography Extension (JCE), Microsoft CNG. | AWS REST API / AWS SDK. | AWS REST API / AWS SDK. | Vault HTTP API, HashiCorp CLI, Agent Injector. |
| **Chi phí tham chiếu** | **$1.00 / key / tháng** + $0.03/10k requests. | **~$1.60/giờ/HSM** (~$1,200/tháng/cụm Multi-AZ 2 nodes). | **$0.40 / secret / tháng** + $0.05/10k requests. | Standard: **$0.00 (Miễn phí)**.<br>Advanced: $0.05/param/tháng. | Cước EC2/EBS hạ tầng tự chạy + phí bản quyền Vault Enterprise. |

---

## 6.6. Mô Hình Tính Phí & Chiến Lược Tối Ưu Chi Phí (FinOps & Cost Optimization)

### 6.6.1. Bảng Cấu Trúc Định Giá Chi Tiết

| Thành phần Dịch Vụ | Đơn giá AWS niêm yết | Cơ chế đo lường | Ghi chú tối ưu hóa chi phí FinOps |
| :--- | :--- | :--- | :--- |
| **AWS KMS (AWS Managed)** | **$0.00** | Miễn phí không giới hạn số lượng | Dùng cho tài nguyên nội bộ một tài khoản không cần tùy biến Key Policy. |
| **AWS KMS (Customer Managed Key)** | **$1.00 / key / tháng** | Tính theo số lượng CMK tạo lập | Xóa hoặc hợp nhất các khóa CMK không sử dụng bằng `ScheduleKeyDeletion`. |
| **KMS API Requests** | **$0.03 / 10,000 requests** | 20,000 requests đầu tiên mỗi tháng miễn phí | Áp dụng Envelope Encryption và Data Key Caching để giảm 99% cuộc gọi API. |
| **AWS Secrets Manager** | **$0.40 / secret / tháng** | $0.05 / 10,000 API requests | Chuyển các tham số tĩnh không cần xoay vòng sang SSM Parameter Store Standard ($0.00). |
| **SSM Parameter Store (Standard)** | **$0.00** | Miễn phí tối đa 10,000 tham số / Region | Lựa chọn số 1 cho cấu hình microservices và token tĩnh (`SecureString`). |
| **AWS WAF** | **$5.00/WebACL + $1.00/rule/tháng** | $0.60 / 1 triệu requests kiểm tra | Hợp nhất WebACL tại CloudFront Edge thay vì gắn phân tán vào nhiều ALB. |
| **Amazon Macie** | $0.10/bucket + **$1.00 / GB quét** | Tính phí theo dung lượng file thực tế quét | Dùng File Inclusion/Exclusion tránh quét cạn kiệt các file video, binary nén. |

---

### 6.6.2. 5 Kịch Bản Tối Ưu Hóa Chi Phí Thực Tế (FinOps Scenarios)

#### Kịch bản 1: Kích hoạt S3 Bucket Keys cho kho lưu trữ Big Data Lake (SSE-KMS)
- **Bối cảnh**: Kho dữ liệu Big Data trên Amazon S3 chứa 80 triệu tệp tin Parquet mã hóa bằng Customer Managed Key (`SSE-KMS`). Các tác vụ Amazon Athena và AWS EMR định kỳ phân tích dữ liệu, phát sinh **150 triệu lượt truy xuất đối tượng mỗi tháng**.
- **Tính toán chi phí khi chưa bật Bucket Keys**:
  - Mỗi thao tác đọc/ghi file S3 gửi một API call riêng tới KMS:
  $$\text{Cost}_{\text{KMS\_Default}} = \left( \frac{150{,}000{,}000}{10{,}000} \right) \times \$0.03 = \$450/\text{tháng}$$
- **Giải pháp tối ưu**:
  - Kích hoạt tính năng **S3 Bucket Keys** trên thuộc tính mã hóa của S3 Bucket:
  - S3 sinh ra một khóa tạm thời cấp bucket trong hạ tầng lưu trữ S3, các thao tác đọc/ghi tái sử dụng khóa này cục bộ, cắt giảm 99% số cuộc gọi API lên KMS:
  $$\text{Cost}_{\text{KMS\_Optimized}} = \left( \frac{1{,}500{,}000}{10{,}000} \right) \times \$0.03 = \$4.50/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$450 - \$4.50 = \$445.50/\text{tháng} \quad (\$5{,}346/\text{năm}) \implies \text{Tiết kiệm } 99\% \text{ chi phí KMS}$$

#### Kịch bản 2: Áp dụng Envelope Encryption với Data Key Caching trong Microservices
- **Bối cảnh**: Ứng dụng thanh toán xử lý 90 triệu giao dịch/tháng. Đội ngũ phát triển gọi trực tiếp lệnh `kms:Encrypt` cho từng bản ghi thông tin thẻ khách hàng.
- **Tính toán chi phí ban đầu**:
  $$\text{Cost}_{\text{Direct\_KMS}} = \left( \frac{90{,}000{,}000}{10{,}000} \right) \times \$0.03 = \$270/\text{tháng}$$
  *Nguy cơ nghiêm trọng*: Thêm 30ms độ trễ mạng HTTPS trên mỗi giao dịch và nguy cơ chạm hạn mức KMS API Request Quota (lỗi HTTP 429 Throttling).
- **Giải pháp tối ưu**:
  - Tích hợp **AWS Encryption SDK** với **Cryptographic Materials Cache (Data Key Caching)** có thời gian sống TTL = 300 giây (hoặc 1,000 bản ghi/key).
  - Số cuộc gọi KMS API thực tế giảm xuống chỉ còn 30,000 cuộc gọi/tháng:
  $$\text{Cost}_{\text{Cached\_KMS}} = \left( \frac{30{,}000}{10{,}000} \right) \times \$0.03 = \$0.09/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$270 - \$0.09 \approx \$269.91/\text{tháng} \quad (\$3{,}238/\text{năm}) \implies \text{Tiết kiệm } 99.96\% \text{ chi phí API}$$

#### Kịch bản 3: Phân tầng bí mật giữa Secrets Manager và SSM Parameter Store
- **Bối cảnh**: Hệ thống microservices quản lý 600 tham số và thông tin đăng nhập. Kỹ sư lưu trữ toàn bộ 600 mục này trong AWS Secrets Manager.
- **Tính toán chi phí ban đầu**:
  $$\text{Cost}_{\text{Initial}} = 600 \times \$0.40 = \$240/\text{tháng} \quad (\$2{,}880/\text{năm})$$
- **Giải pháp tối ưu**:
  - Phân loại: Chỉ giữ lại 30 thông tin đăng nhập cơ sở dữ liệu (RDS/Aurora) trên Secrets Manager để tận dụng tính năng **Auto-rotation**.
  - Chuyển 570 tham số cấu hình và API tokens tĩnh còn lại sang **SSM Parameter Store Standard** dưới định dạng `SecureString` (mã hóa KMS miễn phí phí lưu trữ):
  $$\text{Cost}_{\text{New}} = (30 \times \$0.40) + (570 \times \$0.00) = \$12/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$240 - \$12 = \$228/\text{tháng} \quad (\$2{,}736/\text{năm}) \implies \text{Giảm } 95\% \text{ chi phí lưu trữ bí mật}$$

#### Kịch bản 4: Hợp nhất WebACL của AWS WAF tại CloudFront Edge
- **Bối cảnh**: Doanh nghiệp vận hành 10 Application Load Balancers (ALB) cho các ứng dụng web khác nhau. Nhóm an ninh triển khai 10 WebACL riêng biệt trên 10 ALB, mỗi WebACL gắn 8 Managed Rules giống nhau.
- **Tính toán chi phí cố định**:
  $$\text{Cost}_{\text{ALB\_WAF}} = 10 \times [\$5.00 + (8 \times \$1.00)] = 10 \times \$13.00 = \$130/\text{tháng}$$
- **Giải pháp tối ưu**:
  - Đặt **Amazon CloudFront** phía trước 10 ALB và tạo duy nhất **1 WebACL** tại Region Global (`us-east-1`):
  $$\text{Cost}_{\text{CloudFront\_WAF}} = \$5.00 + (8 \times \$1.00) = \$13/\text{tháng}$$
  - Ngoài ra, các yêu cầu tải ảnh tĩnh trúng cache (Cache Hit) tại CloudFront Edge không bị tính phí chuyển tiếp về ALB, giúp tiết kiệm thêm cước xử lý LCU của ALB.
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$130 - \$13 = \$117/\text{tháng} \quad (\$1{,}404/\text{năm}) \implies \text{Giảm } 90\% \text{ chi phí WebACL}$$

#### Kịch bản 5: Ngăn ngừa bẫy quét dữ liệu ngoài tầm kiểm soát của Amazon Macie
- **Bối cảnh**: Doanh nghiệp muốn quét dữ liệu nhạy cảm PII trên S3. Kỹ sư tạo một Discovery Job quét toàn bộ S3 bucket lưu trữ camera an ninh và file nén backup dung lượng **20 TB (20,000 GB)**.
- **Rủi ro chi phí nếu không có bộ lọc**:
  - Đơn giá quét nội dung của Amazon Macie là $1.00/GB:
  $$\text{Cost}_{\text{Unfiltered}} = 20{,}000 \times \$1.00 = \$20{,}000 \quad (\text{Hai mươi ngàn USD cho 1 tác vụ!})$$
- **Giải pháp tối ưu**:
  - Áp dụng **File Extension Exclusions** (loại bỏ `.mp4`, `.zip`, `.tar`, `.iso`, `.png`, `.jpg`).
  - Áp dụng **File Extension Inclusions** (chỉ quét `.csv`, `.json`, `.parquet`, `.txt`, `.pdf`).
  - Sử dụng chế độ **Automated Sensitive Data Discovery** lấy mẫu thông minh ngẫu nhiên, dung lượng quét thực tế chỉ là 50 GB:
  $$\text{Cost}_{\text{Filtered}} = 50 \times \$1.00 = \$50/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Ngăn chặn thảm họa tài chính} = \$20{,}000 - \$50 = \$19{,}950 \implies \text{Tránh lãng phí } 99.75\%$$

---

## 6.7. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Tình huống sự cố (Problem) | Nguyên nhân cốt lõi (Root Cause) | Các bước điều tra & Chỉ số giám sát (Metrics & Logs) | Giải pháp khắc phục (Remediation) | Biện pháp phòng ngừa (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Lỗi `AccessDeniedException` khi gọi `kms:Decrypt` từ IAM Role** | IAM Policy có quyền nhưng **KMS Key Policy** chưa cho phép IAM Role đó làm Principal. | - Tra cứu CloudTrail log tìm sự kiện `eventName: Decrypt` với mã lỗi `AccessDenied`.<br>- Kiểm tra ARN của IAM Role trong Key Policy. | Cập nhật **KMS Key Policy** để thêm IAM Role vào mệnh đề `Principal`, hoặc cấp quyền qua **KMS Grant**. | Ghi nhớ nguyên tắc: Đối với KMS, Key Policy là chốt chặn quyết định quyền tối cao (Root của Account cũng không bypass được nếu bị thiếu trong Key Policy). |
| **Mất kết nối database sau khi Secrets Manager xoay vòng mật khẩu** | Ứng dụng lưu mật khẩu tĩnh trong RAM và không có cơ chế tự refresh khi gặp lỗi xác thực `401/403`. | - Kiểm tra application logs: `FATAL: password authentication failed for user`.<br>- Kiểm tra CloudTrail sự kiện `GetSecretValue` từ ứng dụng. | Cập nhật ứng dụng tích hợp thư viện **AWS Secrets Manager Caching Library** (tự động xóa cache và kéo secret mới khi kết nối thất bại). | Không bao giờ lưu trữ mật khẩu trong biến toàn cục tĩnh mà không có logic retry-refresh. |
| **Khách hàng hợp lệ bị chặn truy cập bởi AWS WAF (`HTTP 403 Forbidden`)** | Luật **Rate-based Rule** đặt ngưỡng quá khắt khe hoặc địa chỉ IP nằm nhầm trong danh sách IP Reputation List. | - Xem tab **Sampled Requests** trên WAF Console.<br>- Kiểm tra CloudWatch metric `BlockedRequests` theo RuleName. | Tăng ngưỡng request (ví dụ từ 100 lên 500 req/5 phút) hoặc thêm IP đối tác vào Whitelist Rule có độ ưu tiên cao hơn. | Chạy luật WAF mới ở chế độ **Count** (chỉ đếm giám sát, không block) từ 3 - 7 ngày trước khi bật chế độ Block. |
| **Không thể xóa KMS Key ngay lập tức trên AWS Console/CLI** | Cơ chế an toàn bắt buộc của KMS cấm xóa tức thì để phòng chống mất dữ liệu vĩnh viễn không thể phục hồi. | - Kiểm tra trạng thái khóa qua lệnh `aws iam/kms describe-key`.<br>- Thông báo `PendingDeletion`. | Đặt lịch xóa an toàn (**ScheduleKeyDeletion**) với thời gian chờ từ 7 đến 30 ngày. Nếu cần ngắt quyền gấp, hãy dùng lệnh `kms:DisableKey`. | Nếu bắt buộc cần Kill-Switch tức thì trong 1 giây, hãy thiết kế giải pháp bằng **Imported Key Material (BYOK)**. |
| **Lỗi `KMS ThrottlingException` khi hệ thống tăng tải đột biến** | Vượt quá hạn mức yêu cầu API mật mã của KMS Region (ví dụ 10,000 req/giây). | - Giám sát CloudWatch metric `ThrottledRequests` của namespace `AWS/KMS`. | Áp dụng kỹ thuật **Envelope Encryption** với Data Key Caching trên client, hoặc gửi yêu cầu nâng hạn mức Service Quotas. | Kích hoạt S3 Bucket Keys trên toàn bộ các S3 Buckets sử dụng SSE-KMS. |

---

## 6.8. Bộ Câu Hỏi Ôn Tập và Kiểm Tra Kiến Thức (Knowledge Review)

### A. Nhóm Câu Hỏi Cốt Lõi (Core Concepts)

#### Câu 1: Sự khác biệt bản chất giữa Customer Managed Keys (CMK) và AWS Managed Keys trong AWS KMS là gì?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **AWS Managed Keys**: Khóa mặc định do AWS tự động tạo riêng cho từng dịch vụ (`aws/s3`, `aws/ebs`, `aws/rds`). Người dùng **không thể chỉnh sửa Key Policy**, không thể xóa thủ công, không thể chia sẻ xuyên tài khoản, chu kỳ xoay vòng cố định 1 năm, và hoàn toàn miễn phí phí duy trì hàng tháng.
- **Customer Managed Keys (CMK)**: Khóa do người dùng tự tạo ($1.00/tháng). Người dùng nắm toàn quyền kiểm soát Key Policy, có thể bật/tắt, chia sẻ xuyên tài khoản (Cross-Account), tùy biến chu kỳ xoay vòng linh hoạt từ 90 đến 2560 ngày, và có thể đặt lịch xóa khóa (7 - 30 ngày).
</details>

#### Câu 2: Nếu một quản trị viên vô tình xóa vĩnh viễn một khóa KMS Key dùng để mã hóa cơ sở dữ liệu RDS hoặc ổ đĩa EBS, dữ liệu có thể khôi phục lại được không?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: **HOÀN TOÀN KHÔNG THỂ KHÔI PHỤC**.
- **Giải thích**: Khi vật liệu khóa mật mã của KMS Key bị xóa vĩnh viễn, toàn bộ dữ liệu đã được mã hóa bằng khóa đó sẽ trở thành chuỗi nhị phân vô nghĩa (Ciphertext không thể giải mã). Không có bất kỳ ai trên thế giới, kể cả đội ngũ kỹ sư bảo mật của AWS, có thể khôi phục lại dữ liệu này. Đó là lý do AWS bắt buộc thời gian chờ xóa an toàn từ 7 đến 30 ngày (Pending Deletion) và cho phép khôi phục khóa trong khoảng thời gian này.
</details>

#### Câu 3: Tính năng nào của AWS KMS cho phép mã hóa dữ liệu tại Region Singapore và giải mã cục bộ tại Region Tokyo với độ trễ thấp mà không cần gọi API xuyên Region?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: **KMS Multi-Region Keys**.
- **Giải thích**: Multi-Region Keys cho phép tạo một Primary Key tại một Region và nhân bản (Replicate) các Replica Keys sang các Region khác. Tất cả các khóa này có **cùng Key ID và cùng vật liệu khóa**. Khi dữ liệu được mã hóa tại Singapore và đồng bộ sang Tokyo (qua S3 CRR hoặc Aurora Global DB), ứng dụng tại Tokyo sử dụng Replica Key để giải mã ngay trong mạng nội bộ Tokyo với độ trễ <5ms.
</details>

---

### B. Nhóm Câu Hỏi Tình Huống & Xử Lý Sự Cố (Scenarios & Troubleshooting)

#### Câu 4: Một ứng dụng di động thanh toán cần gửi dữ liệu thẻ tín dụng của người dùng từ điện thoại lên đám mây AWS. Doanh nghiệp muốn mã hóa dữ liệu ngay trên điện thoại trước khi truyền đi nhưng không muốn nhúng AWS Access Keys vào ứng dụng di động. Giải pháp nào tối ưu nhất?
- (A) Sử dụng Symmetric KMS Key và lưu Secret Access Key trong file mã nguồn app di động.
- (B) Tạo Asymmetric KMS Key (RSA-4096), tải Public Key nhúng vào ứng dụng di động để mã hóa client-side, và giữ Private Key trong KMS để backend giải mã.
- (C) Sử dụng AWS Secrets Manager để ứng dụng di động tải mật khẩu mã hóa về máy mỗi lần khởi động.
- (D) Tạo AWS CloudHSM và mở cổng công khai cho ứng dụng di động gọi API trực tiếp.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án đúng**: **(B)**
- **Giải thích chuyên sâu**:
  - Với **Asymmetric KMS Key**, Public Key có thể được công khai và tải về máy client ngoài AWS mà không làm lộ tính bảo mật của thuật toán.
  - Ứng dụng di động dùng Public Key tự mã hóa dữ liệu thẻ ngay trên thiết bị người dùng.
  - Chỉ có dịch vụ backend trên AWS với IAM Role hợp lệ mới có quyền gọi API KMS sử dụng **Private Key** (được lưu an toàn tuyệt đối bên trong KMS HSM) để giải mã dữ liệu.
</details>

#### Câu 5: Hệ thống tài chính yêu cầu phải có cơ chế ngắt khẩn cấp ("Emergency Kill-Switch") để ngăn chặn việc giải mã dữ liệu trong vòng 1 giây nếu phát hiện tài khoản AWS bị tấn công chiếm quyền. Loại khóa nào đáp ứng tiêu chuẩn này?
- (A) Customer Managed Key mặc định sinh từ AWS KMS.
- (B) AWS Managed Key `aws/s3`.
- (C) Customer Managed Key với Imported Key Material (BYOK).
- (D) Multi-Region KMS Key.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án đúng**: **(C)**
- **Giải thích chuyên sâu**:
  - Khóa KMS thông thường khi thực hiện xóa bắt buộc phải trải qua thời gian ân hạn từ 7 đến 30 ngày (không thể xóa ngay).
  - Với **Imported Key Material (BYOK)**, quản trị viên có thể gọi API `kms:DeleteKeyMaterial`. Toàn bộ vật liệu khóa bị xóa sạch khỏi KMS ngay lập tức trong vòng **1 giây**, khiến mọi yêu cầu giải mã dữ liệu bị từ chối tức thì trên toàn hệ thống. Sau khi đã khắc phục sự cố, quản trị viên có thể nạp lại (re-import) vật liệu khóa ban đầu để khôi phục hoạt động bình thường.
</details>

#### Câu 6: Doanh nghiệp muốn bảo vệ website thương mại điện tử khỏi các cuộc tấn công DDoS quy mô lớn và muốn được AWS hoàn tiền chi phí phát sinh nếu các máy chủ Auto Scaling tự động mở rộng để chống đỡ tấn công. Gói dịch vụ nào cung cấp tính năng này?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: **AWS Shield Advanced**.
- **Giải thích**:
  - AWS Shield Advanced ($3,000/tháng, cam kết 1 năm) cung cấp tính năng độc quyền **DDoS Cost Protection**: AWS sẽ hoàn lại toàn bộ hóa đơn chi phí điện toán tăng đột biến (EC2, CloudFront, ALB) do Auto Scaling kích hoạt trong suốt quá trình chống đỡ cuộc tấn công DDoS.
  - Ngoài ra, khách hàng còn được hỗ trợ 24/7 trực tiếp từ đội ngũ chuyên gia an ninh **Shield Response Team (SRT)** và miễn phí 100% chi phí sử dụng AWS WAF.
</details>

---

### C. Nhóm Câu Hỏi Phỏng Vấn Chuyên Sâu (Solutions Architect & DevOps)

#### Câu 7: "Hãy phân biệt vai trò và sự phối hợp giữa KMS Key Policy, IAM Policy và KMS Grants trong việc kiểm soát quyền truy cập khóa mã hóa?"
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **KMS Key Policy**: Là chính sách bảo mật tối cao gắn liền với khóa. Mọi khóa KMS bắt buộc phải có một Key Policy. Nếu Key Policy không cấp quyền cho một Principal (kể cả tài khoản Root của tài khoản đó), thì không một IAM Policy nào có thể cấp quyền được.
- **IAM Policy**: Được gắn vào User/Role. Để một IAM Principal sử dụng được khóa KMS trong cùng một tài khoản, phải có sự phối hợp: Key Policy cho phép tài khoản ủy quyền cho IAM Policy, VÀ IAM Policy cấp action cụ thể (`kms:Decrypt`).
- **KMS Grants**: Là cơ chế ủy quyền quyền hạn tạm thời, có phạm vi hẹp và có thể thu hồi nhanh chóng (thay thế cho việc phải sửa đổi Key Policy liên tục). Được sử dụng phổ biến bởi các dịch vụ AWS nội bộ (ví dụ: Amazon EBS sử dụng Grant để giải mã ổ đĩa khi EC2 khởi chạy).
</details>

#### Câu 8: "Làm thế nào để thiết kế một hệ thống quản lý bí mật cho cụm microservices lớn vừa đáp ứng yêu cầu bảo mật cao nhất, vừa tối ưu hóa chi phí vận hành hàng tháng dưới $20?"
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Kiến trúc giải pháp**:
  1. **Phân loại dữ liệu cấu hình**:
     - **Secrets Manager**: Chỉ dùng cho các thông tin đăng nhập cơ sở dữ liệu quan trọng (RDS Aurora Master Password) yêu cầu **Auto-rotation**. Giữ số lượng secret tối thiểu (ví dụ 10 secrets = $4.00/tháng).
     - **SSM Parameter Store (Standard Tier)**: Dùng cho toàn bộ các API keys, token bên thứ 3 và cấu hình microservices khác. Sử dụng kiểu dữ liệu **`SecureString`** mã hóa bằng KMS CMK. Chi phí lưu trữ trên Parameter Store là **$0.00**.
  2. **Tối ưu tầng ứng dụng**:
     - Cài đặt thư viện **AWS Secrets Manager Caching Library** và SSM Caching trên các container microservices. Cache các bí mật trên bộ nhớ RAM với thời gian TTL = 300 giây.
     - Triệt tiêu 99% số cuộc gọi API lên KMS và Secrets Manager.
  3. **Tổng chi phí**: 10 secrets ($4.00) + 1 CMK ($1.00) + cước API (~$0.50) = **~$5.50/tháng**, đáp ứng trọn vẹn ngân sách dưới $20.
</details>

---

## 6.9. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Vàng Bảo Mật & Mã Hóa AWS (Golden Rules)
1. **KMS Key Policy là tối thượng**: IAM Policy chỉ có hiệu lực khi được KMS Key Policy cho phép; mất khóa KMS là mất dữ liệu vĩnh viễn.
2. **Kích hoạt S3 Bucket Keys**: Luôn bật S3 Bucket Keys cho các bucket sử dụng SSE-KMS để cắt giảm 99% chi phí API.
3. **Envelope Encryption cho dữ liệu lớn**: Luôn sử dụng Data Key Caching trong AWS Encryption SDK để bảo vệ ứng dụng khỏi nghẽn quota và giảm độ trễ.
4. **Phân tầng thông minh giữa Secrets Manager và Parameter Store**: Dùng Secrets Manager cho bí mật cần auto-rotate; dùng SSM Parameter Store `SecureString` cho tham số tĩnh để tiết kiệm 95% chi phí.
5. **Đưa WAF ra biên mạng (Edge)**: Gắn WebACL tại CloudFront Distribution để chặn đứng tấn công Layer 7 sớm nhất và tiết kiệm chi phí inspection.
6. **Không quét mở Amazon Macie**: Luôn thiết lập file exclusion/inclusion để tránh bẫy quét dữ liệu nhị phân hàng chục ngàn USD.
7. **Cơ chế Kill-Switch với BYOK**: Sử dụng Imported Key Material khi kiến trúc yêu cầu khả năng đóng băng dữ liệu tức thì trong vòng 1 giây.

---

### Danh Mục Kiểm Tra Năng Lực (Learning Checklist)
- [ ] Tôi phân biệt rõ ràng 4 chiều phân loại của khóa KMS (Quản trị, Thuật toán, Địa lý, Nguồn gốc).
- [ ] Tôi hiểu rõ nguyên lý hoạt động của Envelope Encryption và vai trò của Data Encryption Key (DEK).
- [ ] Tôi biết cách cấu hình S3 Bucket Keys để giảm 99% chi phí KMS API cho Data Lake.
- [ ] Tôi nắm vững quy trình 4 bước tự động xoay vòng mật khẩu của AWS Secrets Manager với Lambda.
- [ ] Tôi phân biệt được trường hợp sử dụng tối ưu giữa Secrets Manager và SSM Parameter Store.
- [ ] Tôi hiểu rõ các tầng phòng ngự của AWS WAF, AWS Shield Standard và Shield Advanced.
- [ ] Tôi phân biệt được phạm vi và nguồn dữ liệu của bộ ba AI an ninh: GuardDuty, Inspector, và Macie.

---

### Liên kết và Tài liệu Liên quan
- 📖 [Ghi Chú Bài Học Chương 26: AWS Security & Encryption](../Lesson_Notes/26_AWS_Security_Encryption_KMS.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](../GLOSSARY.md)
- ⏭️ Tiếp tục chuyển sang chuyên đề: [AWS Lambda & Kiến Trúc Serverless](./Lambda_Serverless_Architecture.md).
