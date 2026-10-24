# Ghi Chú Bài Học: Chương 04 - Quản Lý Định Danh IAM & Giao Diện Dòng Lệnh AWS CLI (IAM & AWS CLI)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 04 - IAM & AWS CLI (Bài 11 đến Bài 30)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: IAM & Enterprise Identity](file:///n:/AWS_XBrain_Note/AWS_Services/IAM_Identity_and_Access_Management.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này trang bị nền tảng an toàn thông tin đầu tiên và quan trọng nhất trên AWS: **Identity and Access Management (IAM)** và các phương thức giao tiếp với AWS qua giao diện dòng lệnh (**AWS CLI**), bộ công cụ lập trình (**AWS SDK**), và môi trường dòng lệnh trên trình duyệt (**AWS CloudShell**).

### Mục tiêu học tập
1. Phân biệt được vai trò của **Root Account**, **IAM Users**, **IAM Groups**, và **IAM Roles**.
2. Hiểu cấu trúc JSON của **IAM Policy** và cách gán quyền an toàn theo nguyên tắc đặc quyền tối thiểu (**Least Privilege**).
3. Nắm được cơ chế bảo vệ tài khoản bằng **MFA** (Xác thực đa yếu tố).
4. Cài đặt và cấu hình **AWS CLI v2** trên Windows, macOS, Linux, hiểu cách hoạt động của file `~/.aws/credentials` và `~/.aws/config`.
5. Hiểu cách thức hoạt động của **IAM Roles for EC2** (Instance Profile) để thay thế việc lưu khóa tĩnh trên máy chủ.
6. Sử dụng thành thạo hai công cụ kiểm tra bảo mật: **IAM Credentials Report** và **IAM Access Advisor**.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **IAM là dịch vụ Toàn cầu (Global Service)**: Không cần chọn Region khi thao tác với IAM.
2. **Khóa Root Account ngay khi tạo**: Bật MFA, không tạo Access Keys cho Root, không chia sẻ mật khẩu Root.
3. **Phân quyền theo Nhóm (Groups)**: Gán Policy vào Group, thêm User vào Group; không nên gán trực tiếp vào từng User lẻ.
4. **IAM Policy là JSON**: Cấu trúc gồm `Version` ("2012-10-17"), `Statement` chứa `Effect` (Allow/Deny), `Action`, `Resource`, `Condition`.
5. **Cơ chế cấp quyền cho ứng dụng**: Tuyệt đối không nhúng `aws_access_key_id` vào code hay server; luôn luôn sử dụng **IAM Roles**.
6. **AWS CloudShell**: Môi trường Linux miễn phí có sẵn ngay trên AWS Console, tích hợp sẵn AWS CLI và thông tin xác thực của bạn mà không cần cài đặt gì trên máy cá nhân.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. IAM Users, Groups & Policies
- **IAM User**: Đại diện cho 1 người thực tế (1 người = 1 tài khoản). Mỗi user có mật khẩu đăng nhập Console và tối đa 2 bộ Access Keys cho CLI.
- **IAM Group**: Tập hợp các User. Không thể chứa Group khác (không có nested groups). Một User có thể thuộc nhiều Group.
- **IAM Policy**: Văn bản JSON quy định quyền hạn. Có 2 loại chính:
  - *AWS Managed Policy*: Do AWS viết sẵn và duy trì (ví dụ: `AdministratorAccess`, `AmazonS3ReadOnlyAccess`).
  - *Customer Managed Policy*: Do người dùng tự tạo và kiểm soát phiên bản trong tài khoản của mình.
  - *Inline Policy*: Chính sách gắn chết trực tiếp vào 1 User hoặc 1 Group (không khuyến khích sử dụng vì khó tái sử dụng và kiểm toán).

### 2. Multi-Factor Authentication (MFA)
- **Bản chất**: Bắt buộc người dùng phải cung cấp 2 yếu tố để đăng nhập: "Thứ bạn biết" (Mật khẩu) + "Thứ bạn sở hữu" (Mã số biến đổi 30 giây từ thiết bị phần cứng hoặc ứng dụng trên điện thoại).
- **Các loại thiết bị MFA hỗ trợ trên AWS**:
  - *Virtual MFA Device*: Ứng dụng trên điện thoại (Google Authenticator, Microsoft Authenticator, Authy). Hỗ trợ nhiều tài khoản trên 1 điện thoại.
  - *FIDO Security Key (U2F)*: Khóa phần mềm/phần cứng cắm cổng USB (như YubiKey) - an toàn nhất chống lừa đảo Phishing.
  - *Hardware TOTP Token*: Thiết bị bấm nút hiển thị số độc lập (như thẻ Gemalto).

### 3. AWS CLI, SDK & Credentials
- **AWS CLI**: Cho phép điều khiển toàn bộ tài nguyên AWS bằng câu lệnh terminal. Gọi trực tiếp vào REST API công khai của AWS.
- **AWS Access Key ID & Secret Access Key**: Bộ đôi định danh bí mật. 
  - `Access Key ID`: Tương đương tên đăng nhập (bắt đầu bằng `AKIA...`).
  - `Secret Access Key`: Tương đương mật khẩu (chỉ hiển thị DUY NHẤT 1 LẦN khi tạo mới).
- **AWS CloudShell**: Máy ảo Linux chạy trên cloud của AWS, cấp sẵn 1GB lưu trữ vĩnh viễn, được cài sẵn AWS CLI, Python, Node.js và tự động nạp credentials của phiên đăng nhập hiện tại.

### 4. IAM Roles for AWS Services (Instance Profile)
- **Vấn đề**: Khi ứng dụng chạy trên máy ảo EC2 cần đọc dữ liệu từ S3, nếu lưu Access Key vào file cấu hình trên máy ảo thì nguy cơ lộ khóa rất cao.
- **Giải pháp**: Gán một **IAM Role** cho EC2. 
- **Cách hoạt động**: EC2 tự động liên lạc với dịch vụ **Instance Metadata Service (IMDS)** tại địa chỉ IP ảo `http://169.254.169.254/latest/meta-data/iam/security-credentials/<RoleName>` để lấy về cặp Access Key/Secret Key ngắn hạn từ **AWS STS**. Khóa này tự động làm mới mỗi vài giờ mà lập trình viên không cần viết mã xử lý.

### 5. IAM Security Tools
- **Credentials Report (ở cấp độ Tài khoản)**: Báo cáo danh sách tất cả người dùng trong tài khoản và tình trạng thông tin đăng nhập của họ (ngày tạo mật khẩu, mật khẩu có bật không, tình trạng bật MFA, thời gian sử dụng Access Keys lần cuối).
- **Access Advisor (ở cấp độ Người dùng/Nhóm/Role)**: Hiển thị các quyền hạn được cấp cho một thực thể và ngày gần nhất thực thể đó thực sự sử dụng quyền hạn đó. Giúp kiến trúc sư phát hiện các quyền thừa để thu hồi theo nguyên tắc Least Privilege.

---

## 4.4. Lệnh và Cấu Hình Thực Tế (Commands & CLI Examples)

### Cấu hình AWS CLI lần đầu trên máy tính:
```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: ap-southeast-1
Default output format [None]: json
```

### Các lệnh kiểm tra thông tin và kiểm toán bảo mật:
```bash
# 1. Kiểm tra bạn đang đăng nhập bằng danh tính nào
aws sts get-caller-identity

# 2. Liệt kê danh sách người dùng trong tài khoản
aws iam list-users

# 3. Yêu cầu tạo báo cáo thông tin xác thực (Credentials Report)
aws iam generate-credential-report

# 4. Tải báo cáo kiểm toán về máy dưới dạng base64 decode sang CSV
aws iam get-credential-report --query "Content" --output text | base64 --decode > credentials_report.csv
```

---

## 4.5. Ví Dụ Thực Tiễn (Practical Examples)

### Ví dụ từ bài giảng:
Giảng viên Stéphane Maarek hướng dẫn tạo một IAM User tên là `stephane` và gán vào nhóm `admin`. Thử đăng nhập đồng thời trên hai trình duyệt riêng biệt (Chrome thường và Chrome ẩn danh / Firefox) để chứng minh khả năng quản trị đa phiên làm việc đồng thời (Simultaneous sign-in) giữa Root Account và IAM User. Sau đó thực hiện bật Virtual MFA bằng điện thoại và xóa bỏ Root Access Key.

### Ví dụ bổ sung Cloud DevOps:
Trong một môi trường thực tế, công ty cấm tuyệt đối việc tạo Access Key cho người dùng. Toàn bộ các kỹ sư muốn chạy lệnh CLI trên máy tính của mình phải sử dụng lệnh:
```bash
aws sso login --profile my-developer-profile
```
Lệnh này mở trình duyệt để xác thực qua cổng đăng nhập tập trung **AWS IAM Identity Center** và tự động cấp token ngắn hạn vào thư mục `~/.aws/sso/cache/`, loại bỏ 100% rủi ro bị lộ khóa tĩnh lên GitHub.

---

## 4.6. Mối Quan Hệ Giữa Các Khái Niệm (Relationships Between Concepts)

```mermaid
graph LR
    User[IAM User] -->|Thành viên| Group[IAM Group]
    Group -->|Gán Policy| Policy[IAM Policy]
    User -->|Sở hữu| Keys[Access Keys / Password]
    User -->|Bắt buộc có| MFA[MFA Token]
    EC2[Amazon EC2] -->|Gắn Instance Profile| Role[IAM Role]
    Role -->|Được cấp quyền qua| Policy
    Role -->|Nhận token ngắn hạn từ| STS[AWS STS]
```

---

## 4.7. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn có một máy chủ EC2 cần tải tệp tin từ Amazon S3. Đâu là cách cấu hình bảo mật chuẩn nhất theo khuyến nghị của AWS?
2. Một IAM User vừa được tạo mới trong tài khoản thì mặc định có những quyền hạn gì?
3. Sự khác nhau giữa IAM Credentials Report và IAM Access Advisor là gì?
4. Nếu một lập trình viên vô tình làm lộ Secret Access Key lên một kho mã nguồn GitHub công khai, bạn cần thực hiện những bước khẩn cấp nào?
5. AWS CloudShell có cần người dùng phải chạy lệnh `aws configure` để nạp Access Key và Secret Key trước khi sử dụng không?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. **Tạo một IAM Role** có quyền đọc S3 (`s3:GetObject`), sau đó gắn Role này vào máy chủ EC2 thông qua **Instance Profile**. Không lưu bất kỳ Access Key nào trên máy ảo.
2. Mặc định một IAM User mới tạo **KHÔNG CÓ BẤT KỲ QUYỀN HẠN NÀO** (áp dụng nguyên tắc Implicit/Default Deny). Phải có policy gắn vào User hoặc Group chứa User thì mới có quyền.
3. **Credentials Report** là báo cáo cấp độ tài khoản (Account-level), liệt kê toàn bộ user kèm trạng thái mật khẩu, tuổi của khóa và tình trạng MFA; **Access Advisor** là công cụ xem xét ở cấp độ thực thể (User/Group/Role), cho biết dịch vụ nào được cấp quyền nhưng không hề được truy cập trong thực tế.
4. Các bước khẩn cấp: (1) Ngay lập tức đăng nhập IAM Console và chuyển trạng thái Access Key đó sang **Inactive** (vô hiệu hóa) hoặc **Delete** (xóa bỏ); (2) Kiểm tra AWS CloudTrail để phát hiện các hành vi bất thường của kẻ tấn công trong thời gian khóa bị lộ; (3) Tạo một bộ khóa mới hoặc chuyển sang sử dụng IAM Role/IAM Identity Center; (4) Xóa lịch sử commit chứa khóa trên GitHub.
5. **KHÔNG**. AWS CloudShell tự động kế thừa thông tin xác thực của phiên làm việc hiện tại trên AWS Console, do đó bạn có thể gõ ngay các lệnh AWS CLI mà không cần cấu hình Access Key.
</details>

---

## 4.8. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [11 - IAM Introduction_ Users, Groups, Policies.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/11%20-%20IAM%20Introduction_%20Users,%20Groups,%20Policies.md)
  - [14 - IAM Policies.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/14%20-%20IAM%20Policies.md)
  - [16 - IAM MFA Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/16%20-%20IAM%20MFA%20Overview.md)
  - [18 - AWS Access Keys, CLI and SDK.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/18%20-%20AWS%20Access%20Keys,%20CLI%20and%20SDK.md)
  - [24 - AWS CloudShell.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/24%20-%20AWS%20CloudShell.md)
  - [25 - IAM Roles for AWS Services.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/25%20-%20IAM%20Roles%20for%20AWS%20Services.md)
  - [27 - IAM Security Tools.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/27%20-%20IAM%20Security%20Tools.md)
  - [29 - IAM Best Practices.md](file:///n:/AWS_XBrain_Note/AWS_Resources/04%20-%20IAM%20&%20AWS%20CLI/29%20-%20IAM%20Best%20Practices.md)
