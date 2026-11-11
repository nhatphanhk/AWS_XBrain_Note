# 09 — COST OPTIMIZATION KEYWORDS: Savings Plans, Budgets, Cost Explorer, CUR, Data Transfer & Pricing

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ QUẢN LÝ CHI PHÍ & TỐI ƯU HÓA

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **AWS Cost Explorer** | Bảng điều khiển phân tích chi phí lịch sử **13 tháng qua** và dự báo chi tiêu **12 tháng tới** bằng ML. | Phân tích sâu theo Dịch vụ, Resource Tags, Member Accounts; đưa ra khuyến nghị mua Savings Plans / RIs và right-sizing. | *"Báo cáo tài chính doanh nghiệp: Nhìn lại chi tiêu năm ngoái và dự báo ngân sách năm tới."* |
| **AWS Budgets** | Công cụ thiết lập ngưỡng ngân sách tài chính tùy biến và kích hoạt hành động ngăn chặn. | Cảnh báo SNS/Email khi chi tiêu thực tế hoặc dự phóng vượt ngưỡng; tự động thực thi **Budget Actions** (tắt EC2/RDS, áp IAM Deny). | *"Chuông báo động thủ quỹ: Tiêu gần hết tiền là hú còi, tiêu lố là tự động khóa két."* |
| **AWS Cost and Usage Report (CUR)** | Báo cáo chi phí và mức độ sử dụng chi tiết nhất của AWS (từng giờ, từng resource ID). | Xuất dữ liệu hóa đơn chi tiết nhất ra S3 để dùng **Amazon Athena, Redshift, QuickSight** phân tích chargeback từng phòng ban. | *"Sổ cái chi tiết từng đồng: Ghi rõ từng phút giây máy ảo nào tiêu bao nhiêu xu."* |
| **Cost Allocation Tags** | Nhãn thẻ (Metadata Tags) gắn lên tài nguyên để phân bổ chi phí theo dự án/team. | Bắt buộc phải **KÍCH HOẠT trong Billing Console**; làm bộ lọc cho Cost Explorer, Budgets và CUR (không áp dụng hồi tố). | *"Dán nhãn tài sản: Đánh dấu máy tính nào của phòng Marketing, máy nào của phòng Kỹ thuật."* |
| **AWS Compute Optimizer** | Dịch vụ ứng dụng Machine Learning phân tích thông số CloudWatch trong **14 ngày gần nhất**. | Phát hiện tài nguyên thừa thãi (**Over-provisioned**) hoặc thiếu hụt; gợi ý hạ size máy hoặc đổi sang chip **Graviton**. | *"Bác sĩ khám sức khỏe máy chủ: Kê đơn hạ size máy để đỡ tốn tiền thuốc men."* |
| **AWS Cost Anomaly Detection**| Dịch vụ Machine Learning tự động phát hiện các đợt tăng vọt chi phí bất thường ngoài dự kiến. | Phát hiện sớm sự cố rò rỉ mã nguồn bị tin tặc chiếm quyền tạo hàng loạt máy ảo đào coin, gửi cảnh báo nguyên nhân gốc (hoàn toàn miễn phí). | *"Hệ thống radar chống trộm tiền: Có dòng tiền lạ tăng vọt là báo động đỏ ngay lập tức."* |
| **AWS Pricing Calculator** | Công cụ web tính toán và ước tính chi phí hạ tầng AWS trước khi bắt tay triển khai thực tế. | Lập dự toán chi phí hàng tháng cho dự án mới để trình ban giám đốc phê duyệt ngân sách trước khi build. | *"Bảng báo giá dự toán công trình: Tính trước chi phí gạch đá xi măng trước khi xây nhà."* |
| **AWS Instance Scheduler** | Giải pháp tự động hóa bằng Lambda + EventBridge dựa trên Resource Tags (`Schedule=office-hours`). | Tự động tắt máy ảo EC2 và RDS ngoài giờ làm việc (đêm và cuối tuần), **cắt giảm ngay 70% hóa đơn** môi trường Dev/Test. | *"Bác bảo vệ tắt điện: Hết giờ làm 6h tối là tắt cầu dao máy tính, sáng thứ 2 bật lại."* |

---

## 💲 EC2 & COMPUTE PRICING: BẢNG PHẢN XẠ 3 GIÂY

| Mô Hình Mua Sắm | Mức Giảm Giá | 💡 Vì Sao Chọn / Ngữ Cảnh Nhớ Nhanh | ❌ Bẫy Cần Tránh |
|:---|:---:|:---|:---|
| **On-Demand** | 0% (Giá chuẩn) | Workload ngắn hạn, ứng dụng mới đang thử nghiệm, lưu lượng tăng giảm hoàn toàn không thể đoán trước, không được gián đoạn. | Không dùng cho hệ thống chạy ổn định 24/7 (gây lãng phí ngân sách lớn). |
| **Compute Savings Plans** | Lên tới **66%** | **Linh hoạt nhất trong kỳ thi**: Cam kết chi tiêu (\$ / giờ) trong 1 hoặc 3 năm. Tự động áp dụng cho bất kỳ instance family nào, bất kỳ OS, Region nào, và áp dụng cho cả **AWS Fargate** lẫn **AWS Lambda**. | Không đi kèm tính năng giữ chỗ năng lực tính toán (No capacity reservation). |
| **EC2 Instance Savings Plans** | Lên tới **72%** | Tiết kiệm nhiều hơn Compute SP, nhưng bắt buộc cam kết một dòng máy cụ thể tại 1 Region (ví dụ: dòng `c7g` tại `ap-southeast-1`). Cho phép đổi kích cỡ (size) tự do trong dòng đó. | Không áp dụng được cho Fargate hay Lambda. |
| **Standard Reserved Instances (RI)** | Lên tới **72%** | Cố định instance type, 1 hoặc 3 năm. Thanh toán: All Upfront (rẻ nhất), Partial Upfront, No Upfront. **Có thể bán lại trên RI Marketplace**. | Không thể đổi dòng máy (family). |
| **Convertible RI** | Lên tới **66%** | Cho phép đổi dòng máy (family), hệ điều hành (OS), hoặc tenancy trong quá trình cam kết 1 hoặc 3 năm. | Mức giảm giá thấp hơn Standard RI. |
| **Spot Instances** | Lên tới **90%** | Tận dụng phần cứng máy chủ nhàn rỗi của AWS. Tiết kiệm tối đa cho các tác vụ xử lý hàng loạt (Batch), container vô trạng thái (Stateless), render đồ họa 3D, CI/CD runners có thể tự động chạy lại nếu bị thu hồi (với thông báo trước 2 phút). | Không bao giờ dùng cho cơ sở dữ liệu sản xuất hoặc ứng dụng quan trọng không thể gián đoạn. |
| **Dedicated Hosts** | Đắt nhất | Thuê trọn vẹn thùng máy chủ vật lý riêng biệt, thấy rõ socket/core/host ID. Bắt buộc khi doanh nghiệp cần đáp ứng yêu cầu bản quyền phần mềm khắt khe theo Socket/Core vật lý (**BYOL - Microsoft Windows Server, SQL Server, Oracle**). | Không nhầm với Dedicated Instances (Dedicated Instances không kiểm soát được socket). |
| **Dedicated Instances** | Phí phụ thu / giờ | Chạy trên phần cứng cô lập ở cấp máy chủ, không chia sẻ với khách hàng AWS khác (Tenant Isolation). Không kiểm soát được socket placement. | Không hỗ trợ BYOL theo socket. |
| **On-Demand Capacity Reservations (ODCR)** | Giá On-Demand | **Đảm bảo 100% có sẵn máy chủ** tại một Availability Zone cụ thể trong các dịp cao điểm (Black Friday, Tết, thảm họa DR). Trả tiền tính theo giờ bất kể máy có bật hay tắt. | Không tự động giảm giá trừ khi kết hợp với Regional RI / Savings Plans. |

> ⚠️ **BẪY THI KINH ĐIỂN CỦA DOMAIN 4 (COST OPTIMIZATION)**:  
> - Đề bài: *"Vừa muốn tiết kiệm chi phí tối đa, vừa phải bảo đảm chắc chắn có sẵn máy chủ chạy trong sự kiện cao điểm tại AZ cụ thể"* $\rightarrow$ **Đáp án đúng bắt buộc là Zonal Reserved Instances** (hoặc On-Demand Capacity Reservations kết hợp Savings Plans).  
> - **Compute Savings Plans** KHÔNG BAO GIỜ đảm bảo giữ chỗ phần cứng!

---

## 🌐 NGUYÊN TẮC TÍNH PHÍ TRUYỀN DỮ LIỆU (DATA TRANSFER COST RULES)

```
Quy tắc 1: DATA IN (Dữ liệu đi vào AWS) ───────────────────────────> HOÀN TOÀN MIỄN PHÍ ($0)
Quy tắc 2: DATA OUT ra Internet ──────────────────────────────────> CÓ TÍNH PHÍ (Theo GB)
Quy tắc 3: Cùng 1 AZ, dùng Private IP ────────────────────────────> HOÀN TOÀN MIỄN PHÍ ($0)
Quy tắc 4: Khác AZ trong cùng 1 Region ───────────────────────────> CÓ TÍNH PHÍ CẢ 2 ĐẦU ($0.01/GB mỗi chiều)
Quy tắc 5: Khác Region (Cross-Region) ────────────────────────────> CÓ TÍNH PHÍ TRUYỀN DỮ LIỆU XUYÊN VÙNG
Quy tắc 6: Amazon S3 ──> Amazon CloudFront ───────────────────────> HOÀN TOÀN MIỄN PHÍ ($0)
Quy tắc 7: CloudFront ──> Người dùng cuối ─────────────────────────> RẺ HƠN S3 truyền trực tiếp ra Internet
Quy tắc 8: RDS Read Replica cùng Region ──────────────────────────> MIỄN PHÍ DỮ LIỆU ĐỒNG BỘ
Quy tắc 9: RDS Read Replica Cross-Region ─────────────────────────> CÓ TÍNH PHÍ DỮ LIỆU ĐỒNG BỘ
Quy tắc 10: Private Subnet gọi S3 qua NAT Gateway ────────────────> TỐN PHÍ ($0.045/giờ + $0.045/GB)
             👉 Đổi sang Gateway VPC Endpoint ───────────────────> HOÀN TOÀN MIỄN PHÍ ($0)
```

---

## 📊 BỘ CÔNG CỤ QUẢN TRỊ CHI PHÍ & NGÂN SÁCH

| Công Cụ | Chức Năng Cốt Lõi | 💡 Tín Hiệu Đề Thi Phản Xạ |
|:---|:---|:---|
| **AWS Cost Explorer** | • Xem lịch sử tiêu dùng **13 tháng qua** và dự báo chi phí **12 tháng tới** bằng Machine Learning.<br>• Phân tích chi phí theo Dịch vụ, Tài khoản thành viên (Linked Account), hoặc Resource Tags.<br>• Đưa ra khuyến nghị mua Savings Plans / RIs và báo cáo mức độ phủ sóng (Coverage/Utilization). | "visualize cost trends", "forecast spending for next 12 months", "RI/Savings Plans recommendations". |
| **AWS Budgets** | • Đặt ngưỡng ngân sách (chi phí, mức sử dụng, độ phủ RI/SP). Gửi cảnh báo SNS/Email khi chi phí thực tế hoặc chi phí dự phóng (**Forecasted**) vượt ngưỡng.<br>• **Budget Actions**: Tự động thực thi hành động ngăn chặn (gắn IAM Deny Policy, áp SCP hoặc tự động tắt máy ảo EC2/RDS). | "alert when spend exceeds budget", "forecasted spend breach", "automatically stop EC2 when over budget". |
| **AWS Cost and Usage Report (CUR)** | • Báo cáo chi phí chi tiết nhất của AWS (từng giờ, từng ngày, từng Resource ID cụ thể).<br>• Xuất file vào S3 để phân tích bằng **Amazon Athena, Redshift, QuickSight**.<br>• Phục vụ phân bổ chi phí nội bộ (Chargeback/Showback). | "most granular billing data", "hourly resource ID breakdown", "analyze billing data with Athena". |
| **Cost Allocation Tags** | • Nhãn gắn vào tài nguyên để theo dõi chi phí theo team, project, môi trường.<br>• **BẮT BUỘC PHẢI KÍCH HOẠT TRONG BILLING CONSOLE** mới hiện trong báo cáo.<br>• **Không có hiệu lực hồi tố** (chỉ tính chi phí từ thời điểm kích hoạt trở đi). | "track costs by team/project", "activate tags in billing console", "cost allocation". |
| **AWS Cost Anomaly Detection** | • Sử dụng ML tự động học mẫu hình chi tiêu và phát hiện các đợt tăng vọt chi phí bất thường ngoài ý muốn (VD: bật nhầm GPU instances lớn).<br>• Gửi cảnh báo kèm phân tích nguyên nhân gốc rễ (Root Cause Analysis). **Miễn phí 100%**. | "automatically detect unexpected cost spikes", "root cause analysis of cost surge", "machine learning cost alert". |
| **AWS Pricing Calculator** | • Công cụ web ước tính dự toán chi phí hạ tầng AWS **TRƯỚC KHI TRIỂN KHAI**.<br>• So sánh chi phí các phương án kiến trúc khác nhau, xuất file báo giá PDF/CSV. | "estimate architecture cost before deployment", "plan migration budget". |

---

## 💡 CÁC PATTERN TỐI ƯU CHI PHÍ KINH ĐIỂN THEO NHÓM DỊCH VỤ

1. **Nhóm Compute (Điện toán)**:
   - Workload xử lý theo lô, rendering, CI/CD, batch không sợ gián đoạn $\rightarrow$ Dùng **EC2 Spot Instances** (giảm tới 90%).
   - Workload chạy ổn định liên tục 1–3 năm $\rightarrow$ Mua **Compute Savings Plans** hoặc **Reserved Instances**.
   - Môi trường Dev/Test/Staging $\rightarrow$ Dùng **AWS Instance Scheduler** (EventBridge + Lambda) tự động tắt máy ngoài giờ hành chính (giảm ngay 70%).
   - Tối ưu hóa kích cỡ máy chủ theo khuyến nghị của **AWS Compute Optimizer**.
   - Chuyển đổi sang vi xử lý kiến trúc ARM (**AWS Graviton**) mang lại hiệu năng/giá thành tốt hơn 20%.

2. **Nhóm Storage (Lưu trữ)**:
   - Dùng **S3 Lifecycle Rules** chuyển dữ liệu sang S3 Standard-IA / S3 Glacier / Deep Archive theo thời gian.
   - Dữ liệu không đoán trước được mô hình truy cập $\rightarrow$ Dùng **S3 Intelligent-Tiering** (không tốn phí truy xuất).
   - Tệp tin ngắn hạn bị xóa sau 10 đến 15 ngày $\rightarrow$ **Giữ nguyên tại S3 Standard** (tránh bẫy phạt 30 ngày của Standard-IA).
   - Nâng cấp ổ đĩa từ **gp2 lên gp3** (giảm ngay 20% chi phí lưu trữ và hiệu năng cao hơn).
   - Thường xuyên quét và xóa các ổ đĩa EBS bị mồ côi (Unattached EBS volumes), Snapshot quá cũ, và Elastic IP không gắn vào máy ảo.

3. **Nhóm Database (Cơ sở dữ liệu)**:
   - Workload biến động bất thường, dev/test $\rightarrow$ Dùng **Aurora Serverless v2** hoặc **DynamoDB On-Demand**.
   - Cơ sở dữ liệu chạy 24/7 ổn định $\rightarrow$ Mua **RDS / Aurora Reserved Instances**.
   - Ứng dụng đọc nặng (Read-heavy) $\rightarrow$ Thêm tầng đệm **Amazon ElastiCache** thay vì nâng cấp instance RDS lên size đắt tiền.

4. **Nhóm Networking (Mạng)**:
   - EC2 trong Private Subnet truy cập S3 hoặc DynamoDB $\rightarrow$ **Thay thế NAT Gateway bằng Gateway VPC Endpoint (Miễn phí $0)**.
   - Phân phối nội dung toàn cầu qua **Amazon CloudFront** để giảm chi phí Data Transfer Out so với truyền trực tiếp từ S3.
   - Giữ lưu lượng giao tiếp giữa các máy chủ trong **cùng 1 Availability Zone** bất cứ khi nào có thể (tránh phí truyền dữ liệu cross-AZ).

5. **Nhóm Analytics (Phân tích dữ liệu)**:
   - Truy vấn **Amazon Athena**: Chuyển đổi dữ liệu sang định dạng cột **Parquet / ORC** kết hợp **Partitioning** để giảm 90% lượng dữ liệu quét.
   - Amazon EMR: Sử dụng **Spot Instances cho Task Nodes** (tiết kiệm tới 80% chi phí tính toán).
   - Tạm dừng (Pause) cụm Amazon Redshift khi không sử dụng hoặc chuyển sang **Redshift Serverless**.

---

## 🚀 BẢNG CHỌN NHANH COST MANAGEMENT

| Tín Hiệu Đề Thi (Trigger Keywords) | ✅ Đáp Án Chuẩn |
|:---|:---|
| "visualize, analyze cost trends, 12-month spending forecast" | **AWS Cost Explorer** |
| "alert when actual or forecasted spend exceeds threshold" | **AWS Budgets** |
| "automatically stop EC2/RDS or apply restrictive IAM policy when over budget" | **AWS Budgets + Budget Actions** |
| "most granular billing data, hourly resource ID breakdown, Athena query" | **AWS Cost and Usage Report (CUR) / Data Exports** |
| "track spending by project/team, activate in billing console" | **Cost Allocation Tags** |
| "automatically detect unexpected cost spikes using machine learning" | **AWS Cost Anomaly Detection** |
| "estimate cost before deployment, pre-migration budgeting" | **AWS Pricing Calculator** |
| "most flexible commitment across EC2, Fargate, and Lambda" | **Compute Savings Plans** |
| "guaranteed capacity reservation with discount for peak event" | **Zonal Reserved Instances (Zonal RI)** |
| "turn off Dev/Test EC2 and RDS instances outside business hours" | **AWS Instance Scheduler** |
| "right-size over-provisioned EC2 instances using ML analysis" | **AWS Compute Optimizer** |
| "minimize data transfer cost for S3 from private subnet" | **Gateway VPC Endpoint (Thay thế NAT Gateway)** |
| "cost-optimize Athena queries by 90%" | **Convert to Parquet / ORC + Partitioning** |
| "cheapest compute for fault-tolerant batch workloads" | **EC2 Spot Instances** |
| "one bill for multiple accounts with volume discounts" | **AWS Organizations Consolidated Billing** |
