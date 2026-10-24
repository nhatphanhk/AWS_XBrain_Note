# Ghi Chú Bài Học: Chương 06 - Kỹ Thuật Máy Chủ EC2 Nâng Cao (EC2 Solutions Architect Associate)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 06 - EC2 - Solutions Architect Associate (Bài 47 đến Bài 55)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon EC2](file:///n:/AWS_XBrain_Note/AWS_Services/EC2_Elastic_Compute_Cloud.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này đi sâu vào các cấu trúc hạ tầng nâng cao của máy chủ ảo Amazon EC2 thường xuất hiện trong các bài thi chứng chỉ AWS Solutions Architect Associate và môi trường kỹ thuật thực tế: phân loại **Private vs Public vs Elastic IP**, cơ chế định vị vật lý máy chủ **EC2 Placement Groups** (Cluster, Spread, Partition), card mạng ảo **Elastic Network Interfaces (ENI)**, và chế độ ngủ đông **EC2 Hibernate**.

### Mục tiêu học tập
1. Phân biệt được cơ chế hoạt động và chi phí của Private IP, Public IP và Elastic IP.
2. Hiểu rõ trường hợp sử dụng, ưu điểm và giới hạn của 3 loại Placement Group: **Cluster**, **Spread**, và **Partition**.
3. Nắm được cấu tạo của **Elastic Network Interface (ENI)** và kỹ thuật chuyển đổi dự phòng mạng (Network Failover).
4. Hiểu nguyên lý hoạt động của **EC2 Hibernate** (lưu RAM vào ổ đĩa EBS) và các điều kiện kỹ thuật đi kèm.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Public IP bị thay đổi**: Khi Stop và Start lại máy ảo, Public IPv4 sẽ bị thu hồi và cấp mới. Để có IP cố định, phải sử dụng **Elastic IP**.
2. **Elastic IP nhàn rỗi sẽ bị tính phí**: Nếu bạn cấp phát 1 Elastic IP nhưng không gắn vào bất kỳ máy ảo nào đang chạy, AWS sẽ tính tiền theo giờ để phạt việc chiếm dụng địa chỉ IPv4.
3. **Placement Groups**:
   - **Cluster**: Cùng 1 rack, cùng 1 AZ; thông lượng cực cao, độ trễ < 1ms; rủi ro sập cả cụm nếu rack hỏng.
   - **Spread**: Khác rack vật lý; tối đa **7 máy ảo / AZ**; chịu lỗi tối đa.
   - **Partition**: Chia phân vùng rack; tối đa 7 partitions / AZ; phù hợp cho Hadoop/Kafka.
4. **ENI (Elastic Network Interface)**:
   - Đại diện cho 1 card mạng ảo có Private IPv4, MAC address, Security Group riêng.
   - Gắn cố định vào 1 Availability Zone cụ thể.
   - Có thể tháo ra và gắn nóng (Hot attach/detach) sang máy ảo khác trong cùng AZ để phục vụ cứu hộ hoặc chuyển đổi dự phòng nhanh.
5. **EC2 Hibernate**:
   - Ghi dữ liệu RAM xuống **EBS Root Volume**.
   - Bắt buộc ổ đĩa Root phải **được mã hóa (Encrypted)** và dung lượng phải đủ lớn chứa toàn bộ RAM.
   - Khởi động lại cực nhanh vì không cần nạp lại hệ điều hành và nạp lại cache ứng dụng.

---

## 4.3. Giải Thích Khái Niệm Chi Tiết (Detailed Concept Explanations)

### 1. Phân tích sâu về ENI (Elastic Network Interface)
- Một ENI bao gồm:
  - 1 địa chỉ Primary Private IPv4 và có thể có nhiều Secondary Private IPv4.
  - 1 địa chỉ Elastic IP (tùy chọn) gắn với Primary Private IPv4.
  - 1 địa chỉ Public IPv4 (nếu subnet bật tính năng auto-assign public IP).
  - 1 địa chỉ vật lý MAC Address duy nhất.
  - Một hoặc nhiều Security Groups gắn kèm.
- **Kịch bản thực tế của ENI**:
  - *Quản trị mạng đa tầng*: Gắn 2 ENI vào 1 máy ảo: ENI 1 nằm ở Public Subnet để tiếp nhận traffic web bên ngoài; ENI 2 nằm ở Management Private Subnet chỉ dành cho quản trị viên nội bộ kết nối giám sát.
  - *Khắc phục sự cố nhanh (Failover)*: Khi máy chủ cơ sở dữ liệu A bị lỗi phần cứng, kỹ sư chỉ cần tháo ENI của máy A và gắn sang máy dự phòng B trong cùng AZ. Toàn bộ cấu hình IP riêng và Security Group được giữ nguyên, ứng dụng không cần đổi chuỗi kết nối.

### 2. So sánh chi tiết 3 loại Placement Groups

| Thuộc tính | Cluster Placement Group | Spread Placement Group | Partition Placement Group |
| :--- | :--- | :--- | :--- |
| **Phạm vi địa lý** | Duy nhất **1 Availability Zone** | Có thể trải rộng nhiều AZs | Có thể trải rộng nhiều AZs |
| **Bố trí vật lý** | Cùng 1 cụm rack phần cứng | Khác rack phần cứng vật lý | Phân bổ thành các Partition riêng biệt |
| **Giới hạn số lượng** | Không giới hạn cứng (phụ thuộc quota) | **Tối đa 7 máy ảo / AZ** | **Tối đa 7 Partitions / AZ** |
| **Ưu điểm lớn nhất** | Băng thông mạng cực khủng (10-100 Gbps), độ trễ cực thấp | Khả năng chịu lỗi cao nhất (cô lập sự cố rack) | Giảm thiểu rủi ro cho cụm phân tán dữ liệu lớn |
| **Kịch bản ứng dụng** | Tính toán khoa học, mô phỏng 3D, High Performance Computing | Cơ sở dữ liệu Primary/Standby, Kafka quorum nodes | Apache HDFS, Cassandra, HBase, Kafka clusters |

---

## 4.4. Câu Hỏi Ôn Tập và Tự Đánh Giá (Review & Self-Assessment)

### Câu hỏi:
1. Bạn đang thiết kế một cụm máy chủ phân tích tài chính đòi hỏi độ trễ trao đổi dữ liệu giữa các máy tính phải dưới 1 millisecond. Bạn nên chọn loại Placement Group nào?
2. Giới hạn tối đa số lượng máy chủ ảo EC2 có thể đặt trong một Spread Placement Group trên một Availability Zone là bao nhiêu?
3. Bạn có thể di chuyển một Elastic Network Interface (ENI) từ một máy ảo ở AZ `ap-southeast-1a` sang một máy ảo khác ở AZ `ap-southeast-1b` được không?
4. Tại sao khi cấu hình EC2 Hibernate, AWS lại bắt buộc ổ đĩa EBS Root Volume phải được mã hóa (Encrypted)?
5. Điều gì xảy ra với dữ liệu trong bộ nhớ RAM khi bạn thực hiện thao tác **Stop** máy ảo thông thường so với khi **Hibernate**?

---

### Đáp án (Self-Assessment Answers):

<details>
<summary>👉 Nhấp vào đây để xem đáp án</summary>

1. Chọn **Cluster Placement Group** (toàn bộ máy ảo nằm trong cùng 1 rack vật lý tại 1 AZ duy nhất, cung cấp băng thông cao nhất và độ trễ dưới 1ms).
2. Tối đa **7 máy ảo EC2 trên mỗi Availability Zone** (nhằm đảm bảo mỗi máy ảo chắc chắn nằm trên một rack phần cứng vật lý riêng biệt).
3. **KHÔNG THỂ**. Một ENI được gắn cố định với một Subnet cụ thể, mà mỗi Subnet chỉ thuộc về duy nhất một Availability Zone. Do đó, ENI chỉ có thể di chuyển giữa các máy ảo nằm trong **cùng một Availability Zone**.
4. Vì khi Hibernate, toàn bộ nội dung của bộ nhớ RAM (bao gồm các dữ liệu nhạy cảm, khóa mã hóa, session tokens của ứng dụng) được ghi ra ổ đĩa EBS dưới dạng file. Việc mã hóa ổ đĩa là bắt buộc để đảm bảo an toàn dữ liệu nhạy cảm khi ở trạng thái nghỉ (At-Rest).
5. Khi **Stop** thông thường: Toàn bộ dữ liệu trong RAM bị xóa sạch; khi bật lại hệ điều hành phải khởi động lại từ đầu. Khi **Hibernate**: Toàn bộ RAM được ghi xuống đĩa EBS; khi Start lại, dữ liệu được nạp ngược lại vào RAM, ứng dụng tiếp tục hoạt động tại đúng điểm tạm dừng mà không mất trạng thái.
</details>

---

## 4.5. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [47 - Private vs Public vs Elastic IP.md](file:///n:/AWS_XBrain_Note/AWS_Resources/06%20-%20EC2%20-%20Solutions%20Architect%20Asso/47%20-%20Private%20vs%20Public%20vs%20Elastic%20IP.md)
  - [49 - EC2 Placement Groups.md](file:///n:/AWS_XBrain_Note/AWS_Resources/06%20-%20EC2%20-%20Solutions%20Architect%20Asso/49%20-%20EC2%20Placement%20Groups.md)
  - [51 - Elastic Network Interfaces (ENI) - Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/06%20-%20EC2%20-%20Solutions%20Architect%20Asso/51%20-%20Elastic%20Network%20Interfaces%20(ENI)%20-%20Overview.md)
  - [54 - EC2 Hibernate.md](file:///n:/AWS_XBrain_Note/AWS_Resources/06%20-%20EC2%20-%20Solutions%20Architect%20Asso/54%20-%20EC2%20Hibernate.md)
