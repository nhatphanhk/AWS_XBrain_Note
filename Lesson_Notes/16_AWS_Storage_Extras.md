# Ghi Chú Bài Học: Chương 16 - Các Dịch Vụ Lưu Trữ Chuyên Sâu & Mạng Lai (AWS Storage Extras)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 16 - AWS Storage Extras (Bài 172 đến Bài 181)  
> **Tài liệu tham chiếu liên quan**: [AWS Service Document: Amazon EBS, EFS & Storage](file:///n:/AWS_XBrain_Note/AWS_Services/EBS_EFS_Storage.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này mở rộng bức tranh lưu trữ của AWS với các giải pháp chuyên dụng phục vụ doanh nghiệp lớn và môi trường lai (Hybrid Cloud): thiết bị vận chuyển dữ liệu vật lý ngoại tuyến **AWS Snow Family** (Snowcone, Snowball Edge, Snowmobile), hệ thống tệp tin hiệu năng cao của bên thứ ba **Amazon FSx** (FSx for Windows File Server, FSx for Lustre, FSx for NetApp ONTAP, FSx for OpenZFS), cổng lưu trữ lai **AWS Storage Gateway** (S3 File Gateway, FSx File Gateway, Volume Gateway, Tape Gateway), dịch vụ chuyển giao tệp qua giao thức SFTP/FTPS **AWS Transfer Family**, và công cụ đồng bộ hóa dữ liệu trực tuyến tốc độ cao **AWS DataSync**.

### Mục tiêu học tập
1. Lựa chọn đúng thiết bị thuộc dòng Snow Family dựa trên dung lượng dữ liệu cần chuyển và yêu cầu tính toán tại biên (Edge Computing).
2. Phân biệt được các biến thể của **Amazon FSx**: khi nào dùng FSx for Windows (giao thức SMB, tích hợp Active Directory) và khi nào dùng FSx for Lustre (High Performance Computing - HPC).
3. Nắm vững 3 mô hình hoạt động của **AWS Storage Gateway**: File Gateway, Volume Gateway (Stored vs Cached), và Tape Gateway (thay thế băng từ vật lý).
4. Sử dụng **AWS DataSync** để tự động hóa việc đồng bộ hóa dữ liệu từ hệ thống NAS On-Premises lên AWS.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **Amazon FSx for Windows File Server**: Hệ thống tệp tin chuẩn Windows chạy trên Windows Server thật, hỗ trợ giao thức **SMB**, tích hợp hoàn hảo với **Microsoft Active Directory**, hỗ trợ quyền NTFS ACLs và tính năng DFS (Distributed File System).
2. **Amazon FSx for Lustre**: Hệ thống tệp tin phân tán hiệu năng cực đại chuyên dụng cho **High Performance Computing (HPC)**, Machine Learning, mô phỏng tài chính, render 3D; tích hợp liền mạch hai chiều với **Amazon S3**.
3. **AWS Storage Gateway (Cầu nối Hybrid Storage)**:
   - *S3 File Gateway*: Máy ảo On-Premises mount ổ NFS/SMB, dữ liệu lưu ngầm trực tiếp thành các S3 Objects.
   - *Volume Gateway*: Ổ đĩa khối iSCSI.
     - *Cached Volumes*: Dữ liệu chính lưu trên S3, máy ảo On-Premises chỉ lưu cache các dữ liệu hay dùng (tiết kiệm ổ cứng On-Prem).
     - *Stored Volumes*: Toàn bộ dữ liệu lưu tại On-Premises, định kỳ backup snapshot gia tăng lên S3.
   - *Tape Gateway*: Máy ảo iSCSI VTL (Virtual Tape Library) tương thích các phần mềm backup cũ (Veeam, Commvault) để đẩy các cuộn băng từ ảo lên **S3 Glacier Deep Archive**, loại bỏ băng từ vật lý.
4. **AWS Transfer Family**: Cho phép người dùng và đối tác bên ngoài tải file lên/xuống trực tiếp từ S3 hoặc EFS thông qua các giao thức truyền thống an toàn: **SFTP**, **FTPS**, **FTP**, và **AS2**.
5. **AWS DataSync**: Đồng bộ dữ liệu trực tuyến tốc độ cao (nhanh gấp 10 lần các công cụ mã nguồn mở như rsync), tự động nén, mã hóa và kiểm tra tính toàn vẹn dữ liệu.

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [172 - AWS Snow Family Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/16%20-%20AWS%20Storage%20Extras/172%20-%20AWS%20Snow%20Family%20Overview.md)
  - [175 - Amazon FSx.md](file:///n:/AWS_XBrain_Note/AWS_Resources/16%20-%20AWS%20Storage%20Extras/175%20-%20Amazon%20FSx.md)
  - [177 - Storage Gateway Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/16%20-%20AWS%20Storage%20Extras/177%20-%20Storage%20Gateway%20Overview.md)
  - [179 - AWS Transfer Family.md](file:///n:/AWS_XBrain_Note/AWS_Resources/16%20-%20AWS%20Storage%20Extras/179%20-%20AWS%20Transfer%20Family.md)
  - [180 - DataSync - Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/16%20-%20AWS%20Storage%20Extras/180%20-%20DataSync%20-%20Overview.md)
  - [181 - All AWS Storage Options Compared.md](file:///n:/AWS_XBrain_Note/AWS_Resources/16%20-%20AWS%20Storage%20Extras/181%20-%20All%20AWS%20Storage%20Options%20Compared.md)
