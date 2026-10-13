# Amazon EFS (Elastic File System)

## 1. Khái niệm cốt lõi & Kiến trúc hoạt động
* **Định nghĩa**: Amazon EFS là dịch vụ lưu trữ tệp tin cấp độ mạng được quản lý hoàn toàn (**Fully Managed Network File System**), hoạt động theo giao thức **NFSv4**.
* **Khả năng chia sẻ đa vùng (Multi-AZ Mount)**:
  * EFS cho phép **hàng nghìn EC2 instances** nằm ở **nhiều Availability Zones khác nhau** trong cùng một Region mount và truy cập đồng thời vào cùng một hệ thống tệp.
  * Hoạt động thông qua các **Mount Target** (giao diện mạng ảo có IP riêng) được tạo tại từng subnet của từng AZ.
* **Tự động co giãn (Elastic & Pay-per-use)**:
  * Không cần dự trù hoặc cấp phát dung lượng trước.
  * Hệ thống tự động mở rộng khi bạn thêm file và tự động thu nhỏ khi bạn xóa file (quy mô dung lượng lên tới cấp độ **Petabyte**).
  * Bạn chỉ trả tiền cho đúng số Gigabyte dữ liệu đang thực sự lưu trữ.

```mermaid
flowchart TD
    EFS[(Amazon EFS File System\nLưu trữ phân tán Multi-AZ)]
    subgraph AZ_1A ["Availability Zone 1A"]
        MT_A[Mount Target 1A\n(Cổng NFS 2049)]
        EC2_A1[EC2 Instance] --> MT_A
        EC2_A2[EC2 Instance] --> MT_A
    end
    subgraph AZ_1B ["Availability Zone 1B"]
        MT_B[Mount Target 1B\n(Cổng NFS 2049)]
        EC2_B1[EC2 Instance] --> MT_B
    end
    subgraph AZ_1C ["Availability Zone 1C"]
        MT_C[Mount Target 1C\n(Cổng NFS 2049)]
        EC2_C1[EC2 Instance] --> MT_C
    end
    MT_A <--> EFS
    MT_B <--> EFS
    MT_C <--> EFS
```

---

## 2. Các đặc tính kỹ thuật quan trọng

### 2.1. Tương thích hệ điều hành
* **CHỈ hỗ trợ hệ điều hành Linux**: Tương thích với chuẩn phân quyền tệp POSIX tiêu chuẩn (`chmod`, `chown`).
* **KHÔNG hỗ trợ máy chủ Windows**: Nếu cần hệ thống chia sẻ tệp cho Windows qua giao thức SMB, AWS cung cấp dịch vụ riêng là **Amazon FSx for Windows File Server**.

### 2.2. Bảo mật & Mạng
* **Kiểm soát truy cập mạng**: Sử dụng **Security Group** gắn trực tiếp vào từng Mount Target. Cần mở **Inbound Port 2049 (NFS)** cho Security Group của các EC2 instance.
* **Mã hóa**:
  * Mã hóa dữ liệu tĩnh (*Encryption at rest*): Sử dụng AWS KMS (AES-256).
  * Mã hóa dữ liệu truyền tải (*Encryption in transit*): Bật tùy chọn TLS khi mount (`mount -t efs -o tls...`).

---

## 3. Các chế độ hiệu năng & thông lượng (Performance & Throughput Modes)

### 3.1. Chế độ hiệu năng (Performance Modes) - Chọn khi tạo File System
* **General Purpose (Mặc định)**:
  * Tối ưu độ trễ thấp nhất cho các thao tác đọc/ghi file ngẫu nhiên.
  * Phù hợp cho: Web serving, Content Management Systems (WordPress, Drupal), thư mục home directory, môi trường phát triển ứng dụng.
* **Max I/O**:
  * Độ trễ cao hơn một chút, nhưng cung cấp thông lượng tổng thể cực lớn và khả năng xử lý song song cao.
  * Phù hợp cho: Xử lý dữ liệu lớn (Big Data), phân tích khoa học, render đồ họa / xử lý video song song từ hàng trăm node.

### 3.2. Chế độ thông lượng (Throughput Modes)
* **Bursting (Cơ bản)**: Thông lượng tỉ lệ thuận với dung lượng dữ liệu (50 KB/s trên mỗi GiB lưu trữ, có khả năng burst lên tới 100 MB/s). Dung lượng càng lớn, throughput càng cao.
* **Provisioned**: Cài đặt cố định băng thông throughput độc lập với kích thước lưu trữ (ví dụ: ổ chỉ có 100 GiB dữ liệu nhưng vẫn có thể cấp phát 1 GiB/s throughput nếu chấp nhận trả phí).
* **Elastic (Khuyến nghị cho tải biến động)**: Tự động điều chỉnh băng thông theo nhu cầu thực tế (đọc lên tới 3 GiB/s, ghi lên tới 1 GiB/s), phù hợp tối ưu cho các workload có lưu lượng truy cập khó dự đoán trước.

---

## 4. Tầng lưu trữ (Storage Classes) & Vòng đời dữ liệu (Lifecycle Management)

EFS cung cấp các tầng lưu trữ để tối ưu hóa chi phí lên tới **90%**:

| Tầng lưu trữ (Storage Class) | Đối tượng dữ liệu | Đặc điểm chi phí |
| :--- | :--- | :--- |
| **Standard Tier** | Dữ liệu truy cập thường xuyên | Chi phí lưu trữ tiêu chuẩn, không mất phí truy xuất. |
| **Infrequent Access (EFS-IA)** | Dữ liệu ít truy cập (truy cập vài lần/tháng) | Chi phí lưu trữ rẻ hơn đáng kể (~85%), phát sinh phí đọc dữ liệu (Retrieval Fee). |
| **Archive Tier** | Dữ liệu rất hiếm khi truy cập (vài lần/năm) | Chi phí lưu trữ rẻ nhất (tiết kiệm tới 90%), phát sinh phí truy xuất. |

* **EFS Lifecycle Policies**: Tự động chuyển các file không được truy cập sau một khoảng thời gian xác định (ví dụ: sau 7, 14, 30, 60, hoặc 90 ngày) từ *Standard* xuống *IA* hoặc *Archive*. Khi một file trong IA được truy cập lại, nó có thể tự động chuyển ngược lại Standard nếu bật tính năng *Intelligent Tiering*.

---

## 5. Mô hình triển khai: Multi-AZ vs One Zone
* **EFS Standard (Multi-AZ)**: Dữ liệu được lưu trữ phân tán xuyên qua nhiều Availability Zones trong Region. Cung cấp độ sẵn sàng cao nhất, chống chịu sự cố sập cả một trung tâm dữ liệu AZ (dành cho Production).
* **EFS One Zone**: Dữ liệu chỉ được lưu trữ trong một Availability Zone duy nhất. Chi phí rẻ hơn khoảng 47%, phù hợp cho môi trường Dev/Test hoặc dữ liệu có thể tạo lại được.

---

## 6. Điểm cần lưu ý & Mẹo thi (Exam Tips)
1. **So sánh chi phí với EBS**: EFS ở tầng Standard đắt hơn khoảng **3 lần** so với EBS gp2/gp3. Do đó, nếu bài toán chỉ cần một máy chủ đơn lẻ cần đĩa cứng, hãy luôn ưu tiên EBS để tiết kiệm chi phí.
2. **Kịch bản WordPress / Web Farm**: Khi nhiều web server EC2 chạy đằng sau Load Balancer cần chia sẻ chung thư mục mã nguồn hoặc thư mục upload ảnh (`wp-content/uploads`), **Amazon EFS là giải pháp chuẩn kiến trúc AWS**.
3. **Mở Port 2049**: Lỗi phổ biến nhất khi không thể mount EFS vào EC2 là quên cấu hình Inbound Rule cho cổng **2049** trong Security Group của Mount Target.

---

## 7. Bổ sung kỹ thuật chuẩn AWS
* **EFS Access Points**: Điểm truy cập ứng dụng chuyên dụng trong EFS, cho phép thực thi danh tính người dùng POSIX cụ thể (UID/GID) và giới hạn quyền truy cập vào một thư mục con nhất định (Path Isolation). Đây là tính năng cốt lõi khi tích hợp EFS với **AWS Lambda, Amazon ECS (Containers), và Amazon EKS (Kubernetes)**.
* **Truy cập từ On-Premises**: Máy chủ vật lý tại trung tâm dữ liệu On-Premises có thể mount trực tiếp EFS thông qua đường truyền mạng riêng **AWS Direct Connect** hoặc **AWS Client/Site-to-Site VPN**.