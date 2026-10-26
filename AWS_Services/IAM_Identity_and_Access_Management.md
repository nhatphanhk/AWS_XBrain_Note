# Tài Liệu Học Tập Chuyên Sâu: AWS Identity and Access Management (IAM) & Quản Trị Định Danh Doanh Nghiệp

> **Tài liệu chuẩn hóa kiến trúc đám mây**: Hướng dẫn toàn diện theo tiêu chuẩn Senior AWS Solutions Architect & Cloud DevOps Engineer (cập nhật mới nhất 2026).  
> **Ngôn ngữ**: Tiếng Việt (Bảo lưu toàn bộ thuật ngữ chuyên ngành tiếng Anh chuẩn AWS).  
> **Các dịch vụ liên quan**: AWS IAM, AWS STS, AWS Organizations, AWS IAM Identity Center (AWS SSO), AWS Directory Service, AWS Control Tower, AWS IAM Access Analyzer.

---

## 6.1. Tổng Quan Dịch Vụ (Service Overview)

### Dịch vụ gì?
**AWS Identity and Access Management (IAM)** là dịch vụ nền tảng cung cấp khả năng kiểm soát truy cập an toàn, chi tiết tới toàn bộ tài nguyên trên đám mây AWS. IAM cho phép bạn quản lý **Ai** (Authentication - Xác thực) có quyền làm **Điều gì** trên **Tài nguyên nào** (Authorization - Phân quyền) và dưới **Điều kiện nào** (Context & Conditions).

### Các vấn đề giải quyết
1. **Loại bỏ thông tin xác thực tĩnh (Eliminate Static Credentials)**: Ngăn chặn nguy cơ rò rỉ Access Keys bằng cơ chế cấp quyền tạm thời tự động xoay vòng qua **AWS Security Token Service (STS)**.
2. **Kiểm soát quyền hạn chi tiết (Fine-grained Least Privilege)**: Cho phép giới hạn quyền theo từng API action cụ thể, gắn chặt với điều kiện thời gian, địa chỉ IP nguồn, yêu cầu MFA và thẻ định danh (Attribute-Based Access Control - ABAC).
3. **Quản trị đa tài khoản tập trung (Multi-account Governance)**: Kết hợp với AWS Organizations, Service Control Policies (SCPs), và AWS IAM Identity Center để kiểm soát hàng trăm tài khoản AWS từ một IdP trung tâm (Okta, Microsoft Entra ID, Google Workspace).
4. **Phân quyền tự động hóa cho Cloud Workloads**: Cấp quyền cho EC2, ECS tasks, EKS pods (EKS Pod Identity / IRSA), Lambda functions mà không bao giờ lưu trữ mật khẩu hay khóa trên ổ cứng.

### Phạm vi và tính chất đặc thù
- **Dịch vụ toàn cầu (Global Service)**: IAM là một dịch vụ mang tính toàn cầu (Endpoint: `iam.amazonaws.com`). Các đối tượng (Users, Roles, Policies) được định nghĩa và tự động đồng bộ hóa trên toàn bộ các Region trên thế giới.
- **Tính nhất quán sau cùng (Eventual Consistency)**: Thay đổi đối với IAM Policy hoặc Role có thể mất vài giây để truyền bá hoàn toàn tới tất cả các Region và điểm cuối API toàn cầu.
- **Miễn phí cốt lõi**: Bản thân dịch vụ IAM, AWS STS và IAM Identity Center không thu phí sử dụng.

---

## 6.2. Các Khái Niệm, Kiến Trúc & Vận Hành Cốt Lõi (Core Concepts, Security & Day-2 Operations)

### 1. Phân loại thực thể định danh (Identities)

```mermaid
classDiagram
    class RootAccount {
        +Email & Password
        +Full Administrative Control
        +Hardware MFA Protected
    }
    class IAMUser {
        +Username
        +Console Password
        +Access Key ID & Secret Access Key
    }
    class IAMGroup {
        +GroupName
        +Collection of Users
    }
    class IAMRole {
        +RoleName
        +TrustPolicy (AssumeRole)
        +Temporary Credentials (STS)
    }
    class IAMPolicy {
        +JSON Document
        +Version 2012-10-17
        +Statement (Effect, Action, Resource, Condition)
    }

    RootAccount --> IAMUser : Khởi tạo ban đầu
    IAMGroup o-- IAMUser : Tập hợp User
    IAMPolicy --o IAMUser : Gán trực tiếp (Không khuyến nghị)
    IAMPolicy --o IAMGroup : Gán theo nhóm chức năng
    IAMPolicy --o IAMRole : Quyền thực thi (Permissions)
    IAMRole <.. IAMUser : sts:AssumeRole
```

- **Root Account (Tài khoản gốc)**: Tài khoản tạo lập khi đăng ký AWS. Sở hữu quyền hạn tối cao không thể bị thu hồi bởi IAM Policy. **Nguyên tắc vàng**: Khóa tài khoản Root bằng Hardware MFA (FIDO2 WebAuthn), xóa toàn bộ Access Keys, không dùng cho công việc thường nhật.
- **IAM User (Người dùng IAM)**: Đại diện cho một con người hoặc dịch vụ ngoại vi cũ. Chứa thông tin đăng nhập dài hạn (Console Password và tối đa 2 bộ Access Keys). *Khuyến nghị 2026: Hạn chế tối đa tạo IAM User cho nhân viên, thay thế bằng IAM Identity Center*.
- **IAM User Group (Nhóm người dùng)**: Tập hợp các IAM User có chung nhiệm vụ (`DevOps`, `SecOps`, `Billing`). Nhóm **không** phải là một Principal (không thể được gán vào Resource-based policy) và không thể lồng (nest) Group trong Group.
- **IAM Role (Vai trò IAM)**: Thực thể không sở hữu mật khẩu hay Access Key dài hạn. Role bao gồm 2 chính sách:
  - **Trust Policy (AssumeRolePolicyDocument)**: Quy định *Ai* được phép đảm nhận Role này (EC2, Lambda, tài khoản ngoài, OIDC provider).
  - **Permissions Policy**: Quy định *Role được làm gì* sau khi đã mượn vai trò.

### 2. Cấu trúc IAM Policy JSON chuẩn

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EnforceTLSAndIPRestriction",
      "Effect": "Deny",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::production-financial-records",
        "arn:aws:s3:::production-financial-records/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    },
    {
      "Sid": "AllowS3ReadWithMFA",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::production-financial-records",
        "arn:aws:s3:::production-financial-records/*"
      ],
      "Condition": {
        "Bool": {
          "aws:MultiFactorAuthPresent": "true"
        },
        "IpAddress": {
          "aws:SourceIp": "198.51.100.0/24"
        }
      }
    }
  ]
}
```

*Các phần tử cấu thành*:
- **Version**: Bắt buộc phải là `"2012-10-17"`.
- **Effect**: `"Allow"` hoặc `"Deny"`.
- **Action**: Danh sách API calls (ví dụ: `s3:GetObject`, `ec2:DescribeInstances`).
- **Resource**: ARN cụ thể của đối tượng chịu ảnh hưởng.
- **Condition**: Ràng buộc ngữ cảnh thực thi:
  - `aws:PrincipalTag/Department`: Phân quyền dựa trên thẻ thuộc tính (ABAC).
  - `aws:SecureTransport`: Bắt buộc mã hóa truyền thông qua HTTPS.
  - `aws:SourceIp` / `aws:SourceVpc`: Ràng buộc nguồn IP mạng hoặc ID của VPC.
  - `aws:RequestedRegion`: Giới hạn Region được phép thao tác.

### 3. Logic Đánh Giá Quyết Định Phân Quyền (Policy Evaluation Logic)

AWS áp dụng quy tắc 5 bước nghiêm ngặt theo mô hình "Từ chối ngầm định" (Default Deny):

```mermaid
flowchart TD
    Req([AWS API Request]) --> Step1{Có Explicit Deny nào không?\nBất kỳ Policy nào}
    Step1 -- Có --> DenyResult([BỊ TỪ CHỐI - DENIED])
    Step1 -- Không --> Step2{Được cho phép bởi\nOrganization SCP?}
    Step2 -- Không --> DenyResult
    Step2 -- Có --> Step3{Được cho phép bởi\nResource-Based Policy?}
    Step3 -- Có --> CheckCrossAccount{Yêu cầu Cross-Account?}
    CheckCrossAccount -- Đúng --> CheckIdentityPolicy{Identity Policy có Allow?}
    CheckIdentityPolicy -- Có --> CheckBoundaries{Vượt qua Permissions Boundary\n& Session Policy?}
    CheckIdentityPolicy -- Không --> DenyResult
    CheckCrossAccount -- Sai (Cùng Account) --> AllowResult([ĐƯỢC PHÉP - ALLOWED])
    Step3 -- Không --> CheckIdentityDirect{Được cho phép bởi\nIdentity Policy?}
    CheckIdentityDirect -- Không --> DenyResult
    CheckIdentityDirect -- Có --> CheckBoundaries
    CheckBoundaries -- Có --> AllowResult
    CheckBoundaries -- Không --> DenyResult
```

1. **Default Deny**: Mọi yêu cầu ban đầu đều bị từ chối ngầm định.
2. **Explicit Deny luôn chiến thắng**: Nếu có bất kỳ câu lệnh `"Effect": "Deny"` nào khớp với request, yêu cầu bị từ chối ngay lập tức bất chấp bao nhiêu câu lệnh `"Allow"`.
3. **Service Control Policies (SCPs)**: Trong AWS Organizations, SCP quy định ranh giới tối đa cho tài khoản con. Nếu SCP không cho phép, request bị chặn.
4. **Permissions Boundary & Session Policies**: Hoạt động như bộ lọc giao (Intersection Filter) – request phải đồng thời nằm trong phạm vi cho phép của Identity Policy VÀ Permissions Boundary.
5. **Cross-Account Requirement**: Nếu truy cập tài nguyên xuyên tài khoản (Cross-Account), BẮT BUỘC cả hai bên (Identity Policy ở Account A VÀ Trust/Resource-Policy ở Account B) đều phải có Explicit Allow.

### 4. RBAC vs. ABAC (Role-Based vs Attribute-Based Access Control)
- **RBAC**: Tạo Policy riêng cho từng Role/Nhóm chức năng. Nhược điểm: Bùng nổ số lượng policy (Policy Explosion) khi quy mô nhân sự và phòng ban mở rộng.
- **ABAC**: Sử dụng Tag (`aws:PrincipalTag/CostCenter` = `aws:ResourceTag/CostCenter`). Ưu điểm: Chỉ cần một Policy duy nhất cho toàn công ty; khi nhân viên đổi phòng ban hoặc tạo thêm dự án mới, chỉ cần cập nhật thẻ Tag mà không phải viết lại IAM Policy.

### 5. Phòng Chống Lỗ Hổng Confused Deputy bằng `sts:ExternalId`
Khi bạn cấp quyền cho một dịch vụ SaaS bên thứ 3 quản lý tài nguyên AWS của mình qua IAM Role:
- Kẻ xấu có thể đăng ký dịch vụ đó và lừa dịch vụ này sử dụng Role của bạn để truy cập trái phép dữ liệu của bạn (**Confused Deputy**).
- **Giải pháp**: Bắt buộc cấu hình `sts:ExternalId` trong Trust Policy Condition. Dịch vụ SaaS chỉ có thể AssumeRole thành công khi gửi kèm chuỗi External ID bí mật duy nhất chỉ có bạn và nhà cung cấp SaaS biết.

---

## 6.3. Kiến Trúc Thực Tế và Luồng Vận Hành (Production Architecture & Workflow)

### 1. Luồng Xác Thực Tạm Thời EC2 Instance Profile qua IMDSv2

```mermaid
sequenceDiagram
    autonumber
    actor App as Ứng dụng Backend (SDK)
    participant IMDS as Instance Metadata Service v2 (169.254.169.254)
    participant STS as AWS Security Token Service (STS)
    participant Dynamo as Amazon DynamoDB

    Note over App,IMDS: Bảo vệ chống SSRF bằng Token-based IMDSv2
    App->>IMDS: HTTP PUT /latest/api/token (X-aws-ec2-metadata-token-ttl-seconds: 21600)
    IMDS-->>App: Trả về Session Token bí mật
    App->>IMDS: HTTP GET /latest/meta-data/iam/security-credentials/AppRole (kèm Token)
    IMDS->>STS: sts:AssumeRole cho Instance Profile
    STS-->>IMDS: Cặp AccessKey, SecretKey & SessionToken (Hạn 6 giờ)
    IMDS-->>App: Cung cấp Credentials tạm thời
    App->>Dynamo: Gọi PutItem ký bằng SigV4 từ STS Token
    Dynamo-->>App: Ghi dữ liệu thành công (200 OK)
```

### 2. Luồng CI/CD An Toàn: GitHub Actions AssumeRole qua OIDC

```mermaid
sequenceDiagram
    autonumber
    actor Dev as Kỹ sư DevOps (Git Push)
    participant GHA as GitHub Actions Runner
    participant OIDC as GitHub OIDC Token Provider
    participant STS as AWS STS (AssumeRoleWithWebIdentity)
    participant IAM as AWS IAM Role (DeployRole)
    participant ECR as Amazon ECR

    Dev->>GHA: Push mã nguồn lên nhánh 'main'
    GHA->>OIDC: Yêu cầu OIDC JWT Token (chứa claim: repo, ref, aud)
    OIDC-->>GHA: Trả về Signed JWT
    GHA->>STS: sts:AssumeRoleWithWebIdentity (JWT, RoleArn)
    STS->>IAM: Kiểm tra Trust Policy (Validate Sub: repo:org/repo:ref:refs/heads/main)
    IAM-->>STS: Hợp lệ
    STS-->>GHA: Cấp AccessKey, SecretKey, SessionToken (Hạn 1 giờ)
    GHA->>ECR: Push Docker Image an toàn mà KHÔNG cần lưu Secret Key trên GitHub!
```

---

## 6.4. Bảng Tích Hợp với Các Dịch Vụ AWS Khác (Integration Table)

| Related AWS Service | Purpose (Mục đích tích hợp) | Integration Method (Phương thức tích hợp) | Practical Example (Ví dụ thực tiễn) |
| :--- | :--- | :--- | :--- |
| **Amazon EC2** | Cấp quyền cho ứng dụng chạy trên máy ảo gọi AWS API | IAM Instance Profile gắn với IMDSv2 | Máy ảo tự động tải config từ S3 và gửi metrics về CloudWatch mà không lưu khóa tĩnh. |
| **AWS Lambda** | Cấp quyền thực thi và quyền truy cập tài nguyên serverless | Lambda Execution Role | Lambda chỉ được phép đọc SQS Queue và ghi kết quả vào Amazon Aurora PostgreSQL. |
| **Amazon ECS / EKS** | Phân quyền mức tác vụ độc lập cho từng microservice | ECS Task Role / EKS Pod Identity | Container thanh toán có quyền gọi Stripe API và RDS, container giao diện chỉ có quyền đọc S3. |
| **AWS CloudTrail** | Kiểm toán và truy vết toàn bộ hoạt động API calls | CloudTrail Management Events & Lake | Ghi nhận chi tiết ai đã gọi `iam:CreateAccessKey` hoặc ai đã `AssumeRole` lúc nửa đêm. |
| **AWS KMS** | Kiểm soát quyền mã hóa/giải mã khóa CMK | KMS Key Policy kết hợp IAM Policy | Chỉ cho phép IAM Role của dịch vụ Order Service thực hiện hành động `kms:Decrypt`. |
| **AWS Secrets Manager** | Bảo mật thông tin xác thực cơ sở dữ liệu | IAM Identity Policy & Resource Policy | Cấp quyền cho Lambda tự động xoay vòng mật khẩu RDS Master Credential định kỳ. |

---

## 6.5. Bảng So Sánh Trong Hệ Sinh Thái AWS (Ecosystem Comparison)

### So sánh các giải pháp quản lý định danh và truy cập trong AWS

| Tiêu chí | IAM Users & Groups | IAM Roles (STS / Instance Profiles) | AWS IAM Identity Center (SSO) | Amazon Cognito | AWS Directory Service |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Bản chất định danh** | Định danh tĩnh dài hạn trong 1 tài khoản AWS cụ thể. | Định danh tạm thời, cấp quyền thông qua AssumeRole. | Cổng Single Sign-On tập trung cho nhân sự doanh nghiệp. | Quản lý định danh cho **khách hàng/người dùng cuối** của ứng dụng. | Dịch vụ Microsoft Active Directory được quản lý trên AWS. |
| **Tuổi thọ Credentials** | Dài hạn (Vô hạn cho đến khi xoay vòng hoặc xóa thủ công). | Ngắn hạn (Từ 15 phút đến tối đa 12 giờ). | Ngắn hạn (Dựa trên phiên SSO, tự động làm mới qua CLI v2). | Ngắn hạn (JWT Tokens: ID Token, Access Token, Refresh Token). | Tùy biến theo chính sách Kerberos / NTLM của Active Directory. |
| **Đối tượng sử dụng** | Các ứng dụng legacy bên ngoài không hỗ trợ AWS STS. | Workloads trên AWS (EC2, ECS, Lambda), CI/CD (GitHub Actions). | Kỹ sư, Lập trình viên, Quản trị viên, Kiểm toán viên nội bộ. | Người dùng ứng dụng di động/web (Mobile & Web App End-users). | Máy ảo Windows Server gia nhập Domain, WorkSpaces, FSx for Windows. |
| **Khả năng mở rộng đa tài khoản** | Kém: Phải tạo user riêng rẽ tại từng tài khoản AWS. | Rất tốt: Hỗ trợ Cross-Account AssumeRole linh hoạt. | Tuyệt vời: Cung cấp quyền truy cập vào hàng trăm tài khoản từ 1 Portal. | Không áp dụng: Dành cho User ứng dụng, không quản trị AWS. | Tốt: Kết nối nhiều VPC và tài khoản thông qua RAM hoặc AD Connector. |
| **Rủi ro rò rỉ bảo mật** | **Cực cao** nếu Access Key bị commit lên GitHub công khai. | **Rất thấp**: Khóa lưu trên RAM, tự hết hạn, không ghi ổ đĩa. | **Cực thấp**: Quản lý tập trung, thu hồi quyền tức thì khi nghỉ việc. | **Thấp**: Chuẩn OIDC/OAuth 2.0 an toàn. | **Thấp**: Bảo vệ bởi giao thức xác thực Active Directory chuẩn doanh nghiệp. |
| **Mô hình tính phí** | **Miễn phí $0.00** | **Miễn phí $0.00** | **Miễn phí $0.00** | Miễn phí 50,000 MAUs đầu; sau đó tính phí theo bậc người dùng hoạt động. | Tính phí theo giờ máy chủ AD ($0.05/h - $0.40/h tùy phiên bản). |

---

## 6.6. Mô Hình Tính Phí & Chiến Lược Tối Ưu Chi Phí (FinOps & Cost Optimization)

### 6.6.1. Bảng Cấu Trúc Định Giá Chi Tiết

| Thành phần Dịch Vụ | Đơn giá AWS niêm yết | Cơ chế đo lường | Ghi chú tối ưu hóa chi phí FinOps |
| :--- | :--- | :--- | :--- |
| **AWS IAM Core** (Users, Roles, Policies, STS) | **$0.00** | Miễn phí không giới hạn số lượng | Tận dụng tối đa để thay thế các phần mềm PAM/IAM thương mại đắt tiền cho hạ tầng AWS. |
| **AWS IAM Identity Center** | **$0.00** | Miễn phí đăng nhập đa tài khoản | Tiết kiệm hàng ngàn USD chi phí bản quyền giải pháp SSO bên thứ 3 khi truy cập AWS. |
| **AWS Organizations & SCPs** | **$0.00** | Miễn phí tạo OUs và áp dụng SCPs | Sử dụng Consolidated Billing để kích hoạt Volume Tier Discount tự động. |
| **AWS IAM Access Analyzer** (External Access) | **$0.00** | Quét tài nguyên chia sẻ ngoài tài khoản | Miễn phí hoàn toàn cho kiểm tra bảo mật cấu hình S3, KMS, IAM Roles. |
| **IAM Access Analyzer** (Unused Access) | **$0.20 / IAM identity / tháng** | Đo lường theo số lượng IAM Role & IAM User được quét | Chỉ bật trên các tài khoản Production trọng yếu hoặc kích hoạt định kỳ 1 tháng trước kỳ kiểm toán. |
| **AWS Directory Service** (AD Connector) | **$0.05 / giờ** (~$36.50/tháng) | 2 proxy instances chạy liên tục | Rẻ hơn 87% so với việc khởi tạo cụm AWS Managed Microsoft AD độc lập. |
| **AWS Directory Service** (Managed Enterprise AD) | **$0.40 / giờ** (~$292/tháng) | Cụm 2 Domain Controllers chuyên dụng | Chỉ sử dụng khi không có sẵn Active Directory on-premises và cần tính năng Domain Trust phức tạp. |

---

### 6.6.2. 5 Kịch Bản Tối Ưu Hóa Chi Phí Thực Tế (FinOps Scenarios)

#### Kịch bản 1: Kích hoạt Consolidated Billing trong AWS Organizations để hưởng Volume Tier Discounts
- **Bối cảnh**: Doanh nghiệp mở rộng quy mô, vận hành 20 tài khoản AWS độc lập với 20 thẻ tín dụng riêng lẻ. Mỗi tài khoản lưu trữ trung bình 40 TB trên Amazon S3 Standard.
- **Tính toán chi phí riêng rẽ**:
  - Đơn giá bậc 1 S3 Standard (0 - 50 TB): $0.023/GB. Do không tài khoản nào vượt 50 TB, toàn bộ 800 TB của công ty đều bị tính ở đơn giá cao nhất:
  $$\text{Cost}_{\text{Separate}} = 20 \times (40{,}000 \times 0.023) = 20 \times \$920 = \$18{,}400/\text{tháng}$$
- **Giải pháp tối ưu**:
  - Gộp 20 tài khoản vào AWS Organizations qua **Consolidated Billing** dưới 1 Payer Account:
  - 50 TB đầu: $50{,}000 \times 0.023 = \$1{,}150$
  - 450 TB tiếp theo: $450{,}000 \times 0.022 = \$9{,}900$
  - 300 TB còn lại: $300{,}000 \times 0.021 = \$6{,}300$
  $$\text{Cost}_{\text{Consolidated}} = 1{,}150 + 9{,}900 + 6{,}300 = \$17{,}350/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$18{,}400 - \$17{,}350 = \$1{,}050/\text{tháng} \quad (\$12{,}600/\text{năm}) \implies \text{Tiết kiệm } 5.7\% \text{ chi phí lưu trữ}$$

#### Kịch bản 2: Chia sẻ tự động hạn mức Savings Plans & Reserved Instances qua Organizations
- **Bối cảnh**: Tài khoản `Dev-Account` cam kết mua Compute Savings Plans trị giá $20/giờ trong 3 năm. Sau khi chuyển đổi hệ thống sang kiến trúc Serverless, mức tiêu thụ compute của `Dev-Account` giảm xuống còn $4/giờ, lãng phí $16/giờ cam kết. Trong khi đó, tài khoản `Prod-Account` đang chi trả $35/giờ cho các máy chủ EC2 On-Demand.
- **Tính toán chi phí**:
  - Khi chưa liên kết Organizations: `Dev-Account` trả thừa $16 \times 730 = \$11{,}680/\text{tháng}$; `Prod-Account` trả $35 \times 730 = \$25{,}550/\text{tháng}$.
- **Giải pháp tối ưu**:
  - Đưa cả 2 tài khoản vào cùng AWS Organization và bật tính năng **Discount Sharing**.
  - Phần cam kết $16/giờ dư thừa của `Dev-Account` tự động được bù trừ vào các máy chủ EC2 On-Demand của `Prod-Account` (hạ giá từ On-Demand xuống mức chiết khấu Savings Plans ~40%).
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm tức thì} = 16 \times 730 = \$11{,}680/\text{tháng} \quad (\$140{,}160/\text{năm})$$

#### Kịch bản 3: Thay thế Managed Microsoft AD Enterprise bằng AD Connector
- **Bối cảnh**: Doanh nghiệp cần xác thực cho 150 người dùng Windows EC2 và WorkSpaces. Công ty đã có sẵn cụm Active Directory on-premises đặt tại văn phòng. Kỹ sư dự định triển khai AWS Managed Microsoft AD Enterprise Edition trên đám mây.
- **Tính toán chi phí**:
  $$\text{Cost}_{\text{Managed AD}} = \$0.40 \times 730 = \$292/\text{tháng} \quad (\$3{,}504/\text{năm})$$
- **Giải pháp tối ưu**:
  - Triển khai **AWS Directory Service AD Connector** kết nối trực tiếp về Domain Controller on-premises qua VPN IPsec hiện có:
  $$\text{Cost}_{\text{AD Connector}} = \$0.05 \times 730 = \$36.50/\text{tháng} \quad (\$438/\text{năm})$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$292 - \$36.50 = \$255.50/\text{tháng} \quad (\$3{,}066/\text{năm}) \implies \text{Giảm } 87.5\% \text{ chi phí}$$

#### Kịch bản 4: Triệt tiêu rủi ro tài chính do lộ lọt Access Keys bằng IAM Identity Center & STS
- **Bối cảnh**: Doanh nghiệp cấp phát 120 cặp Access Keys tĩnh cho các lập trình viên lưu trên máy cá nhân. Nếu chỉ 1 Access Key bị lộ lên kho mã nguồn công khai, bot tự động có thể chiếm quyền và khởi tạo 50 máy ảo GPU `g5.12xlarge` ($5.672/giờ) để đào tiền mã hóa.
- **Thiệt hại ước tính chỉ sau 48 giờ**:
  $$\text{Thiệt hại} = 50 \times \$5.672 \times 48 = \$13{,}612.80$$
- **Giải pháp tối ưu**:
  - Thu hồi toàn bộ Access Keys tĩnh của người dùng cá nhân.
  - Chuyển sang **IAM Identity Center** với chi phí **$0.00**. Lập trình viên sử dụng `aws configure sso` để nhận credentials tạm thời có thời hạn tối đa 4 giờ.
- **Hiệu quả kinh tế**:
  $$\text{Chi phí phần mềm} = \$0.00; \quad \text{Rủi ro tài chính bị triệt tiêu } 100\%$$

#### Kịch bản 5: Tối ưu hóa chi phí phân tích quyền thừa với IAM Access Analyzer
- **Bối cảnh**: Đơn vị có 1,500 IAM Roles tạm thời từ hệ thống CI/CD và 100 IAM Users. Nếu bật tính năng phân tích quyền thừa (Unused Access Analyzer) liên tục 24/7 trên toàn bộ 1,600 identities:
  $$\text{Cost}_{\text{Continuous}} = 1{,}600 \times \$0.20 = \$320/\text{tháng} \quad (\$3{,}840/\text{năm})$$
- **Giải pháp tối ưu**:
  - Cấu hình Analyzer có chọn lọc: Chỉ theo dõi 100 IAM Users và 50 IAM Roles quan trọng của môi trường Production.
  - Sử dụng tính năng **IAM Access Advisor** (truy cập miễn phí qua Console và API) để tự động hóa rà soát Least Privilege qua script định kỳ không tốn phí.
  $$\text{Cost}_{\text{Optimized}} = 150 \times \$0.20 = \$30/\text{tháng}$$
- **Hiệu quả kinh tế**:
  $$\text{Tiết kiệm} = \$320 - \$30 = \$290/\text{tháng} \quad (\$3{,}480/\text{năm}) \implies \text{Giảm } 90.6\% \text{ chi phí kiểm toán}$$

---

## 6.7. Khắc Phục Sự Cố Thực Tế (Troubleshooting Guide)

| Tình huống sự cố (Problem) | Nguyên nhân cốt lõi (Root Cause) | Các bước điều tra & Chỉ số giám sát (Metrics & Logs) | Giải pháp khắc phục (Remediation) | Biện pháp phòng ngừa (Prevention) |
| :--- | :--- | :--- | :--- | :--- |
| **Ứng dụng trên EC2 báo lỗi `AccessDenied` khi gọi S3 API** | 1. EC2 chưa được gán Instance Profile.<br>2. Policy của Role thiếu action `s3:GetObject`.<br>3. S3 Bucket Policy có Explicit Deny. | - Chạy `curl http://169.254.169.254/latest/meta-data/iam/info`.<br>- Kiểm tra event `errorCode: AccessDenied` trong **AWS CloudTrail Event History**. | 1. Gán Instance Profile vào EC2 qua AWS CLI/Console.<br>2. Bổ sung quyền vào Role hoặc gỡ Explicit Deny trong Bucket Policy. | Chuẩn hóa quy trình tạo máy ảo qua Terraform IaC, không cấu hình thủ công. |
| **Lỗi `ExpiredToken` đột ngột xuất hiện trên ứng dụng đang chạy** | Token tạm thời của STS hết hạn nhưng ứng dụng giữ cache token cũ trong bộ nhớ RAM mà không refresh. | - Kiểm tra application logs: `The security token included in the request is expired`.<br>- Theo dõi CloudTrail `AssumeRole` duration. | Nâng cấp AWS SDK lên phiên bản mới nhất; khởi tạo AWS Client ở cấp độ phù hợp để SDK tự động làm mới credentials ngầm. | Không bao giờ tự trích xuất access key/secret key từ metadata để lưu vào biến tĩnh toàn cục. |
| **Không thể xóa IAM Role dù đã detach toàn bộ policies** | Role vẫn còn đang được liên kết với một Instance Profile hoặc được dùng làm Service-Linked Role bởi dịch vụ đang hoạt động. | - Chạy lệnh `aws iam list-instance-profiles-for-role --role-name <RoleName>`.<br>- Kiểm tra thông báo lỗi `Cannot delete entity, must detach from instance profile first`. | Chạy `aws iam remove-role-from-instance-profile` sau đó xóa instance profile rồi mới tiến hành xóa Role. | Tự động hóa dọn dẹp hạ tầng thông qua Terraform `terraform destroy`. |
| **Admin tài khoản con không thể tạo tài nguyên tại Region Singapore** | Bị chặn bởi Service Control Policy (SCP) ở cấp độ Root hoặc OU trong AWS Organizations. | - Tra cứu CloudTrail log tìm sự kiện `Client.UnauthorizedOperation` với lỗi `explicit deny in a service control policy`. | Kiểm tra cây thư mục AWS Organizations và cập nhật lại SCP để bổ sung Region `ap-southeast-1` vào danh sách cho phép. | Triển khai SCP kiểm thử trên một Test OU trước khi áp dụng toàn bộ tổ chức. |
| **Lỗi `InvalidClientTokenId` hoặc `SignatureDoesNotMatch` trên CLI** | Cặp Access Key bị thu hồi/vô hiệu hóa, hoặc đồng hồ hệ thống của máy tính bị lệch quá 15 phút so với chuẩn UTC. | - Kiểm tra trạng thái khóa qua `aws iam list-access-keys`.<br>- Kiểm tra chênh lệch thời gian máy chủ: `w32tm /query /status` hoặc `chronyc tracking`. | 1. Kích hoạt lại Access Key hoặc cấp mới.<br>2. Đồng bộ hóa đồng hồ hệ thống với máy chủ NTP chuẩn (`time.aws.com`). | Bật đồng bộ thời gian NTP tự động trên toàn bộ hệ thống máy trạm và máy chủ. |

---

## 6.8. Bộ Câu Hỏi Ôn Tập và Kiểm Tra Kiến Thức (Knowledge Review)

### A. Nhóm Câu Hỏi Cốt Lõi (Core Concepts)

#### Câu 1: Dịch vụ AWS IAM là dịch vụ cấp vùng (Regional) hay cấp toàn cầu (Global)? Điều gì xảy ra khi có sự thay đổi quyền hạn?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: IAM là dịch vụ **Toàn cầu (Global)**.
- **Giải thích**: Khi bạn tạo hoặc cập nhật một User, Group, Role hoặc Policy, thông tin này được lưu trữ tập trung tại endpoint toàn cầu (`iam.amazonaws.com`) và sau đó được truyền bá tự động đến tất cả các AWS Regions trên khắp thế giới.
- **Lưu ý thực tế**: Cơ chế đồng bộ hóa toàn cầu hoạt động theo nguyên lý **Eventual Consistency** (Tính nhất quán sau cùng). Do đó, sau khi bạn vừa cập nhật một Policy, có thể mất từ vài giây đến tối đa 1 phút để thay đổi này có hiệu lực trên toàn bộ các Region.
</details>

#### Câu 2: Trong tài liệu IAM Policy JSON, phiên bản `"Version"` chuẩn hiện nay là gì? Nếu thiếu trường này điều gì sẽ xảy ra?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: Phiên bản chuẩn bắt buộc là `"2012-10-17"`.
- **Giải thích**: Nếu không khai báo `"Version": "2012-10-17"`, AWS sẽ mặc định sử dụng phiên bản cũ `"2008-10-17"`. Phiên bản cũ không hỗ trợ các tính năng phân quyền hiện đại như Policy Variables (ví dụ: `${aws:username}`), điều kiện Tag ABAC (`aws:PrincipalTag`), và các hàm logic nâng cao.
</details>

#### Câu 3: Hãy giải thích sự khác biệt giữa Identity-Based Policy và Resource-Based Policy.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Identity-Based Policy**: Được gắn trực tiếp vào một thực thể định danh (IAM User, Group, Role). Nó xác định thực thể đó được phép thực hiện những hành động nào trên tài nguyên nào.
- **Resource-Based Policy**: Được gắn trực tiếp vào chính tài nguyên (ví dụ: S3 Bucket Policy, KMS Key Policy, SQS Queue Policy). Điểm đặc thù là Resource-Based Policy **phải có trường `Principal`** để chỉ rõ *Ai* được phép truy cập tài nguyên đó.
- **Khác biệt quan trọng**: Resource-Based Policy cho phép chia sẻ tài nguyên xuyên tài khoản (Cross-Account) mà người dùng bên ngoài không cần phải từ bỏ quyền hạn của mình để AssumeRole.
</details>

#### Câu 4: Một IAM User được gắn Policy cho phép `s3:GetObject` trên bucket `company-data`. Tuy nhiên, Bucket Policy của `company-data` lại có câu lệnh `Deny` đối với user này. User có đọc được file không?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: User **HOÀN TOÀN KHÔNG** thể đọc được file.
- **Giải thích**: Theo logic đánh giá của AWS IAM: **Explicit Deny luôn luôn chiến thắng Explicit Allow** (Explicit Deny trumps all Allows). Khi có bất kỳ câu lệnh Deny nào khớp với ngữ cảnh yêu cầu, AWS lập tức từ chối request mà không cần xét thêm bất kỳ điều kiện nào khác.
</details>

---

### B. Nhóm Câu Hỏi Tình Huống & Xử Lý Sự Cố (Scenarios & Troubleshooting)

#### Câu 5: Một kỹ sư DevOps cần cấp quyền cho ứng dụng chạy trên máy ảo Amazon EC2 đọc dữ liệu từ DynamoDB. Phương án thiết kế nào chuẩn bảo mật nhất?
- (A) Tạo một IAM User với Access Key, sau đó lưu Access Key vào file `~/.aws/credentials` trên máy ảo EC2.
- (B) Mã hóa Access Key và Secret Key bằng KMS rồi lưu vào biến môi trường hệ điều hành máy ảo.
- (C) Khởi tạo một IAM Role có quyền đọc DynamoDB, tạo Instance Profile và gắn Role vào máy ảo EC2.
- (D) Tạo S3 Bucket chứa thông tin đăng nhập và cấp quyền cho EC2 tải file này khi khởi động.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án đúng**: **(C)**
- **Giải thích chuyên sâu**:
  - Lưu Access Key tĩnh trên máy ảo (phương án A, B, D) là vi phạm nghiêm trọng nguyên tắc an toàn thông tin AWS. Nếu máy ảo bị tấn công hoặc lộ bản sao lưu snapshot, khóa tĩnh có thể bị đánh cắp và sử dụng vô hạn.
  - Sử dụng **IAM Role qua Instance Profile** tận dụng dịch vụ IMDSv2 và AWS STS để tự động cấp phát thông tin xác thực tạm thời (Temporary Credentials), tự động xoay vòng sau mỗi vài giờ và không bao giờ lưu trữ trên ổ đĩa.
</details>

#### Câu 6: Doanh nghiệp muốn đảm bảo rằng các kỹ sư quản trị tài khoản con trong AWS Organizations không bao giờ có thể tự ý tắt dịch vụ AWS CloudTrail hoặc xóa S3 Bucket lưu log kiểm toán. Giải pháp kiến trúc nào đáp ứng yêu cầu?
- (A) Tạo IAM Policy có câu lệnh Deny trên từng tài khoản con.
- (B) Áp dụng Service Control Policy (SCP) từ Root Organization chứa câu lệnh Deny các hành động `cloudtrail:StopLogging` và `s3:DeleteBucket`.
- (C) Thiết lập Permissions Boundary trên tất cả các IAM Users ở tài khoản con.
- (D) Cấu hình AWS Config Rule tự động bật lại CloudTrail khi bị tắt.
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án đúng**: **(B)**
- **Giải thích chuyên sâu**:
  - **Service Control Policy (SCP)** là rào chắn bảo vệ (Guardrail) cấp tổ chức do tài khoản quản trị (Management Account) quản lý.
  - SCP áp đặt quyền hạn tối đa lên toàn bộ tài khoản con, kể cả **Root Account** và tài khoản **Administrator** của tài khoản con đó cũng không thể vượt qua hoặc tự ý chỉnh sửa SCP.
  - Phương án (A) không an toàn vì Admin tài khoản con có thể tự gỡ Policy. Phương án (D) mang tính chất phát hiện và khắc phục sau sự cố (Detective/Remediation) chứ không ngăn chặn từ đầu (Preventive).
</details>

#### Câu 7: Một công ty đối tác bên thứ 3 cung cấp giải pháp SaaS giám sát chi phí cần truy cập vào tài khoản AWS của bạn để đọc dữ liệu CloudWatch. Để phòng chống lỗ hổng Confused Deputy, bạn cần cấu hình điều gì?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Đáp án**: Cấu hình điều kiện `sts:ExternalId` trong Trust Policy của IAM Role.
- **Giải thích**:
  - Lỗ hổng **Confused Deputy** xảy ra khi bên thứ 3 (Deputy) bị một khách hàng xấu khác lợi dụng để ép buộc bên thứ 3 dùng chính Role của bạn để truy xuất dữ liệu trái phép của bạn.
  - Khi bạn yêu cầu chuỗi bí mật `ExternalId` trong mệnh đề `Condition` của Trust Policy:
    ```json
    "Condition": {
      "StringEquals": {
        "sts:ExternalId": "SecretClient-UUID-987654"
      }
    }
    ```
  - Dịch vụ SaaS chỉ có thể AssumeRole thành công khi gửi kèm chính xác chuỗi External ID này trong cuộc gọi API `sts:AssumeRole`.
</details>

#### Câu 8: Sự khác biệt bản chất giữa Service Control Policy (SCP) và Permissions Boundary là gì?
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Phạm vi áp dụng**:
  - **SCP**: Áp dụng ở cấp độ Tổ chức (AWS Organizations), tác động lên toàn bộ tài khoản (Account-level), bao gồm cả Root User và tất cả Roles/Users trong tài khoản con.
  - **Permissions Boundary**: Áp dụng ở cấp độ thực thể (Identity-level), gán cụ thể vào từng IAM User hoặc IAM Role riêng lẻ.
- **Trường hợp sử dụng thực tế**:
  - SCP dùng để cấm các Region không được phép sử dụng hoặc bảo vệ tài nguyên kiểm toán của tổ chức.
  - Permissions Boundary dùng để ủy quyền an toàn (Delegated Administration): Cho phép lập trình viên tự do tạo IAM Role mới cho Lambda/ECS nhưng bị giới hạn trần quyền hạn tối đa, ngăn chặn hành vi tự cấp quyền Admin cho chính mình (Privilege Escalation).
- **Điểm tương đồng**: Cả hai đều **KHÔNG TỰ MÌNH CẤP QUYỀN**; chúng chỉ đóng vai trò là ranh giới tối đa (Maximum Allowable Boundary).
</details>

---

### C. Nhóm Câu Hỏi Phỏng Vấn Chuyên Sâu (Solutions Architect & DevOps)

#### Câu 9: "Hãy trình bày cơ chế hoạt động của AWS IAM Identity Center và giải thích vì sao doanh nghiệp nên chuyển đổi toàn bộ nhân sự từ IAM Users sang Identity Center?"
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Cơ chế hoạt động**:
  - IAM Identity Center kết nối với Identity Provider (IdP) của doanh nghiệp (Microsoft Entra ID, Okta, Google Workspace) thông qua giao thức SAML 2.0 hoặc SCIM (để đồng bộ hóa tự động tài khoản người dùng và nhóm).
  - Quản trị viên định nghĩa các **Permission Sets** (tập hợp IAM policies) và gán các nhóm người dùng vào các tài khoản AWS cụ thể.
  - Khi nhân viên đăng nhập qua cổng AWS access portal, họ được cấp quyền truy cập tạm thời vào đúng các tài khoản được phân công mà không hề tồn tại bất kỳ IAM User tĩnh nào trên từng tài khoản con.
- **Lý do chuyển đổi**:
  1. **Bảo mật tuyệt đối**: Loại bỏ hoàn toàn Access Keys tĩnh dài hạn và nguy cơ rò rỉ khóa lên GitHub.
  2. **Quản trị vòng đời tập trung**: Khi nhân viên nghỉ việc, chỉ cần vô hiệu hóa tài khoản trên Google/Entra ID là ngay lập tức mất quyền truy cập toàn bộ 100+ tài khoản AWS.
  3. **Tối ưu trải nghiệm kỹ sư**: Đăng nhập 1 lần (SSO) và truy cập CLI cực kỳ dễ dàng qua `aws configure sso`.
  4. **Miễn phí hoàn toàn**: Không phát sinh chi phí phần mềm.
</details>

#### Câu 10: "Làm thế nào để thiết lập một pipeline CI/CD trên GitHub Actions có thể deploy hạ tầng lên AWS mà hoàn toàn không cần lưu trữ AWS_ACCESS_KEY_ID và AWS_SECRET_ACCESS_KEY trong GitHub Secrets?"
<details>
<summary>👉 Nhấp để xem đáp án chi tiết</summary>

- **Giải pháp**: Sử dụng **OpenID Connect (OIDC) Federation** kết hợp với AWS IAM Role.
- **Các bước thực hiện**:
  1. **Khởi tạo OIDC Identity Provider trên AWS**: Tạo OIDC Provider trỏ tới `https://token.actions.githubusercontent.com` với Client ID là `sts.amazonaws.com`.
  2. **Tạo IAM Role**: Viết Trust Policy cho phép OIDC provider gọi `sts:AssumeRoleWithWebIdentity`.
  3. **Ràng buộc chặt chẽ trong Condition**: Chỉ cho phép assume role từ đúng tổ chức, kho lưu trữ và nhánh Git xác định:
     ```json
     "Condition": {
       "StringEquals": {
         "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
       },
       "StringLike": {
         "token.actions.githubusercontent.com:sub": "repo:my-org/my-app:ref:refs/heads/main"
       }
     }
     ```
  4. **Cấu hình GitHub Actions Workflow**: Sử dụng action chính thức `aws-actions/configure-aws-credentials` với tham số `role-to-assume`. Runner của GitHub sẽ nhận JWT token từ GitHub OIDC và tự động đổi lấy STS credentials tạm thời từ AWS.
</details>

---

## 6.9. Tóm Tắt và Danh Mục Kiểm Tra Kiến Thức (Summary & Learning Checklist)

### 7 Nguyên Tắc Vàng Quản Trị Định Danh AWS (Golden Rules)
1. **Khóa chặt tài khoản Root**: Luôn bảo vệ bằng Hardware MFA (FIDO2) và không tạo Access Key cho Root.
2. **Loại bỏ khóa tĩnh (No Long-Term Credentials)**: Chuyển 100% nhân sự sang **IAM Identity Center** và toàn bộ máy chủ/container sang **IAM Roles**.
3. **Nguyên tắc Đặc quyền Tối thiểu (Principle of Least Privilege)**: Luôn cấp quyền tối thiểu cần thiết; kiểm tra định kỳ và thu hồi quyền thừa qua **IAM Access Advisor**.
4. **Quy tắc Explicit Deny**: Bất kỳ một câu lệnh Deny nào đều ghi đè và hủy bỏ toàn bộ các câu lệnh Allow.
5. **Rào chắn đa tài khoản (Guardrails First)**: Sử dụng **Service Control Policies (SCPs)** trong AWS Organizations để thiết lập ranh giới an toàn tối đa cho mọi tài khoản con.
6. **Bảo vệ chống SSRF**: Bắt buộc cấu hình **IMDSv2** (`HttpTokens=required`, HopLimit=1) cho toàn bộ máy ảo EC2.
7. **Phòng chống Confused Deputy**: Luôn yêu cầu `sts:ExternalId` khi cấp quyền cho bên thứ 3 AssumeRole vào hệ thống của bạn.

---

### Danh Mục Kiểm Tra Năng Lực (Learning Checklist)
- [ ] Tôi hiểu rõ sự khác biệt giữa IAM User, Group, Role, và nguyên lý hoạt động của AWS STS.
- [ ] Tôi có thể viết một IAM Policy JSON chuẩn mực với đầy đủ 5 thành tố (Version, Statement, Effect, Action, Resource, Condition).
- [ ] Tôi giải thích được logic đánh giá phân quyền (Default Deny, Explicit Deny, SCP, Boundary, Resource/Identity Policies).
- [ ] Tôi biết cách cấu hình Instance Profile cho EC2 và Task Role cho ECS để loại bỏ khóa tĩnh.
- [ ] Tôi hiểu rõ cách thức thiết lập OIDC giữa AWS và GitHub Actions để triển khai CI/CD không cần Access Key.
- [ ] Tôi nắm vững các chỉ số CloudTrail và các bước xử lý sự cố khi gặp lỗi `AccessDenied` hoặc `ExpiredToken`.
- [ ] Tôi có thể thiết kế kiến trúc phân quyền đa tài khoản kết hợp giữa AWS Organizations, SCPs và IAM Identity Center.

---

### Liên kết và Tài liệu Liên quan
- 📖 [Ghi Chú Bài Học Chương 04: IAM & AWS CLI](../Lesson_Notes/04_IAM_and_AWS_CLI.md)
- 📖 [Ghi Chú Bài Học Chương 25: Quản Trị Định Danh Doanh Nghiệp Nâng Cao](../Lesson_Notes/25_Identity_and_Access_Management_Advanced.md)
- 📖 [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](../GLOSSARY.md)
- ⏭️ Tiếp tục chuyển sang chuyên đề: [AWS Key Management Service (KMS) & Mã Hóa Dữ Liệu](./KMS_Security_Encryption.md).
