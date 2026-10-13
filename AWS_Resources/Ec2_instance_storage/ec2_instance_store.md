# EC2 Instance Store (Ephemeral Storage)

## 1. Tổng quan & Bản chất phần cứng
* **Định nghĩa**: EC2 Instance Store là loại ổ đĩa phần cứng vật lý (thường là chuẩn **NVMe SSD** hoặc HDD) được **gắn trực tiếp trên bo mạch chủ của máy chủ vật lý (Host Server)** đang chạy EC2 instance.
* **So sánh về kiến trúc vật lý**:
  * **EBS**: Là ổ đĩa mạng (**Network Drive**), dữ liệu truyền qua card mạng nên bị giới hạn bởi băng thông mạng và có độ trễ nhất định.
  * **Instance Store**: Ổ đĩa gắn trực tiếp qua bus phần cứng vật lý (PCIe/NVMe), do đó đạt được **hiệu năng I/O tối đa và độ trễ cực thấp (gần như bằng 0)**.

```mermaid
flowchart TD
    subgraph Host_Physical_Server ["Máy chủ vật lý của AWS"]
        EC2[EC2 Virtual Machine]
        IS[(EC2 Instance Store\nỔ cứng vật lý trực tiếp)]
        EC2 <==>|PCIe / NVMe Bus\n(Độ trễ cực thấp, hàng triệu IOPS)| IS
    end
    EBS[(Amazon EBS Volume\nỔ đĩa phân tán qua mạng)]
    EC2 <-.->|AWS Network Fabric\n(Vài ms latency)| EBS
```

---

## 2. Hiệu năng vượt trội (Extreme Performance)
Do không phải chịu giới hạn của đường truyền mạng, Instance Store đem lại hiệu năng vượt trội so với EBS:
* **IOPS**: Có thể đạt **hàng triệu IOPS** (ví dụ: các dòng máy chủ `I3`, `I3en`, `I4i` chuyên dụng cho I/O có thể đạt từ **1.4 triệu đến hơn 3.3 triệu IOPS**).
* **Throughput**: Đạt hàng chục GB/s tốc độ đọc/ghi tuần tự.

---

## 3. Đặc tính lưu trữ tạm thời (Ephemeral Nature)
Đây là đặc điểm quan trọng nhất định nghĩa Instance Store: **Dữ liệu mang tính chất tạm thời (Ephemeral), KHÔNG BỀN VỮNG**.

### Bảng hành vi dữ liệu theo các trạng thái của Instance:
| Hành động trên Instance | Dữ liệu trên Instance Store | Giải thích kỹ thuật |
| :--- | :---: | :--- |
| **Reboot hệ điều hành** | **VẪN CÒN** (Preserved) | Máy ảo chỉ khởi động lại OS, không rời khỏi máy chủ vật lý. |
| **Stop & Start lại** | **BỊ MẤT** (Lost) | Khi Stop, instance giải phóng tài nguyên. Khi Start lại, instance có thể được chuyển sang một host vật lý hoàn toàn khác. |
| **Hibernate** | **BỊ MẤT** (Lost) | Không hỗ trợ lưu trạng thái trên Instance Store. |
| **Terminate** | **BỊ MẤT** (Lost) | Ổ đĩa vật lý bị xóa sạch (wiped) để cấp cho người khác. |
| **Lỗi phần cứng (Hardware Failure)** | **BỊ MẤT** (Lost) | Máy chủ vật lý bị hỏng linh kiện thì đĩa đính kèm cũng hỏng theo. |

---

## 4. Tình huống sử dụng thực tế (Use Cases)
Do đặc tính hiệu năng cực cao nhưng dữ liệu tạm thời, Instance Store phù hợp hoàn hảo cho:
1. **Bộ nhớ đệm (Cache) & Bộ nhớ tạm (Buffer)**: Lưu trữ các kết quả tính toán tạm thời mà nếu mất đi thì có thể tự tạo lại từ nguồn chính.
2. **Scratchpad / Temporary data**: Vùng đệm xử lý file đồ họa, render video, xử lý batch tạm thời.
3. **Cụm ứng dụng phân tán có sẵn cơ chế tự nhân bản (Self-replicating distributed systems)**:
   * Các hệ thống như **Apache Cassandra, Elasticsearch, Kafka, Hadoop HDFS, MongoDB replica sets**...
   * Bản thân các ứng dụng này đã tự sao chép dữ liệu (replication factor = 3) sang các node khác ở tầng phần mềm. Nếu 1 node gặp sự cố mất Instance Store, dữ liệu sẽ tự động được phục hồi từ các node còn lại.

---

## 5. Điểm cần lưu ý & Mẹo thi (Exam Tips)
* **Quy tắc nhận diện tên Instance**: Các dòng máy chủ EC2 có chữ cái **`d`** trong tên thường đi kèm với ổ đĩa cục bộ NVMe SSD Instance Store (Ví dụ: `m5d.large`, `c5d.2xlarge`, `r5d.metal`, `i3en.6xlarge`).
* **Trách nhiệm sao lưu (Shared Responsibility)**: Người dùng chịu hoàn toàn trách nhiệm thiết lập cơ chế sao lưu (backup) định kỳ dữ liệu từ Instance Store sang EBS hoặc Amazon S3 nếu không muốn bị mất mát dữ liệu ngoài ý muốn.
* **Không thể thay đổi kích thước**: Bạn không thể nâng cấp riêng dung lượng Instance Store; dung lượng này phụ thuộc cố định vào Instance Type bạn chọn.
* **Từ khóa thi (Exam Keyword)**: Bất cứ khi nào bài thi đề cập đến yêu cầu *"Highest possible IOPS/throughput"*, *"Lowest disk latency"*, đi kèm với *"Data is temporary/non-persistent"*, câu trả lời chính xác luôn là **EC2 Instance Store**.
