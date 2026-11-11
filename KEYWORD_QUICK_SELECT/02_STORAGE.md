# 02 — STORAGE KEYWORDS: S3, EBS, EFS, FSx, Storage Gateway

---

## 📖 ĐỊNH NGHĨA CỐT LÕI CÁC DỊCH VỤ STORAGE

| Dịch Vụ AWS | Bản Chất Kỹ Thuật (What is it?) | Sinh Ra Để Làm Gì (Core Job)? | 💡 Móc Nhớ Thần Chú |
|:---|:---|:---|:---|
| **Amazon S3** | Lưu trữ đối tượng (Object Storage) toàn cầu, dung lượng vô hạn, độ bền 11 số 9 (99.999999999%). | Kho chứa dữ liệu phi cấu trúc trung tâm (ảnh, video, file sao lưu, Data Lake), host web tĩnh. | *"Đại dương vô tận: Ném file vào kèm khóa (Key) là triệu năm không mất."* |
| **Amazon EBS** | Ổ đĩa lưu trữ dạng khối (Block Storage) kết nối mạng tốc độ cao, gắn vào 1 EC2 trong cùng 1 AZ. | Làm ổ cài hệ điều hành (Root Volume) và ổ dữ liệu cơ sở dữ liệu (MySQL, Oracle) cần độ trễ thấp. | *"Ổ cứng cắm cáp quang: Máy ở phòng nào (AZ nào) thì ổ đĩa phải ở đúng phòng đó."* |
| **Amazon EFS** | Hệ thống tệp tin mạng dùng chung chuẩn POSIX (NFS v4) serverless, tự động co giãn, Multi-AZ. | Cho hàng ngàn máy chủ Linux, container, Lambda cùng đọc/ghi vào một thư mục chung. | *"Thư mục dùng chung công ty cho máy Linux: Ai cũng vào xem và sửa file được."* |
| **Amazon FSx** | Dịch vụ hệ thống tệp tin chuyên biệt bên thứ 3 được AWS quản lý (Windows, Lustre, ONTAP, ZFS). | Đáp ứng các yêu cầu giao thức đặc thù: **FSx Windows (SMB/Active Directory)**, **FSx Lustre (HPC/ML song song)**. | *"Chuyên cơ riêng cho từng hệ điều hành: Windows có SMB, HPC có Lustre siêu tốc."* |
| **AWS Storage Gateway** | Cầu nối lưu trữ lai (Hybrid Storage) kết nối mạng On-Premises với Amazon S3/Glacier. | Cho ứng dụng tại chỗ dùng tiếp giao thức cũ (NFS, SMB, iSCSI) với đệm cục bộ (Local Cache) và sao lưu lên cloud. | *"Ống dẫn ngầm: Nối thẳng từ phòng máy On-Prem ra hồ chứa S3 trên mây."* |
| **AWS DataSync** | Công cụ truyền dữ liệu trực tuyến tốc độ cao (TLS, checksum) giữa On-Prem và AWS Storage. | Tự động hóa việc di chuyển và đồng bộ dữ liệu định kỳ (nhanh gấp 10 lần rsync). | *"Đoàn xe chuyên dụng: Chở dữ liệu định kỳ qua mạng cực nhanh và an toàn."* |
| **AWS Transfer Family** | Cổng giao tiếp SFTP, FTPS, FTP, AS2 được quản lý hoàn toàn đổ thẳng vào S3 hoặc EFS. | Cho đối tác bên ngoài upload file an toàn qua SFTP quen thuộc mà không cần dựng FTP server. | *"Cửa khẩu SFTP: Đối tác nước ngoài giao hàng vào kho S3 bằng xe quen thuộc."* |
| **AWS Snow Family** | Thiết bị vận chuyển dữ liệu vật lý ngoại tuyến (Snowcone 8TB, Snowball 80TB, Snowmobile 100PB). | Di chuyển hàng chục TB đến hàng trăm PB khi đường truyền mạng quá chậm hoặc không có Internet. | *"Tàu chở container vật lý: Chở cả kho dữ liệu đi đường bộ khi mạng Internet nghẽn."* |

---

## 🪣 S3 STORAGE CLASS — Chọn Nhanh Với Lý Do

| Tầng Lưu Trữ | 💡 Vì Sao Chọn | Min Days | Retrieval Fee | Keyword Trigger |
|:---|:---|:---:|:---:|:---|
| **S3 Standard** | Truy cập thường xuyên, không có phí truy xuất, không có phạt lưu trữ. File ngắn hạn < 30 ngày cũng dùng Standard (tránh phạt IA). | 0 | $0 | "frequent access", "< 30 days" |
| **S3 Intelligent-Tiering** | Không biết trước pattern truy cập → I-T tự động chuyển tầng không tính phí retrieval. Chỉ tính monitoring fee nhỏ/object. | 0 | $0 | "unpredictable pattern", "auto-tier" |
| **S3 Standard-IA** | Ít truy cập (1-2 lần/tháng), cần lấy về **ngay trong ms**, lưu > 30 ngày. | 30 | \$0.01/GiB | "infrequent, need ms retrieval, DR backup" |
| **S3 One Zone-IA** | Ít truy cập, chấp nhận mất nếu AZ hỏng (dữ liệu tái tạo được). Rẻ hơn Standard-IA 20%. | 30 | \$0.01/GiB | "infrequent, single AZ OK, secondary copy" |
| **S3 Glacier Instant** | Truy cập 1 lần/quý, **cần lấy ngay trong ms** (như hồ sơ y tế). | 90 | \$0.03/GiB | "1/quarter, millisecond retrieval" |
| **S3 Glacier Flexible** | Lưu trữ dài hạn, chờ 1-5 phút (Expedited), 3-5 giờ (Standard), hoặc 5-12 giờ (Bulk/free). | 90 | Có phí | "long-term archive, hours wait OK" |
| **S3 Glacier Deep Archive** | Tuân thủ pháp lý 7-10 năm, rẻ nhất (< \$1/TB/tháng), chờ 12-48 giờ. | 180 | Có phí | "7-10 years, compliance, cheapest" |

> ⚠️ **BẪY CỰC PHỔ BIẾN — Nhớ Mãi Mãi**:  
> Đề bài: "file bị xóa sau **10 ngày**" → chọn **S3 Standard**  
> KHÔNG chọn Standard-IA → phạt tính đủ **30 ngày** dù xóa sau 10 ngày + phí retrieval khi xóa sớm  
> **Móc nhớ**: _"IA = Infrequent Access nhưng **I**nflexible về minimum storage charge."_

---

## 🔐 S3 WORM & OBJECT LOCK — Phân Biệt Nhanh

| Mode | Ai Có Thể Xóa? | 💡 Vì Sao Chọn | Keyword |
|:---|:---|:---|:---|
| **Object Lock — Governance** | Admin có `s3:BypassGovernanceRetention` hoặc Root | Linh hoạt hơn: internal compliance, test WORM policy. Admin vẫn gỡ được khi cần. | "internal WORM", "admin can override" |
| **Object Lock — Compliance** | **Không ai** (kể cả Root, kể cả AWS) | Ransomware protection, SEC 17a-4. Sau khi set, không thể sửa hay xóa trước hạn. | "nobody deletes even root", "SEC 17a-4", "ransomware" |
| **Legal Hold** | Gỡ được bằng flag OFF bất kỳ lúc nào | Giữ object vô thời hạn trong quá trình điều tra pháp lý (không có ngày hết hạn). | "investigation hold", "no expiry date" |
| **Backup Vault Lock — Compliance** | Không ai sau cooling-off 1-72h | Bảo vệ toàn bộ backup vault (không phải từng object). Áp dụng cho AWS Backup vault. | "protect all backups", "backup WORM" |

---

## ☁️ S3 SPECIAL FEATURES — Vì Sao Dùng Gì

| Feature | 💡 Vì Sao Chọn | Keyword Trigger |
|:---|:---|:---|
| **S3 Multipart Upload** | File > 5 GB **bắt buộc** phải dùng. Recommend > 100 MB. Upload song song nhiều part → nhanh hơn, resume được nếu lỗi. | "> 5 GB upload", "large file" |
| **S3 Transfer Acceleration** | Dùng mạng Edge Location AWS → vào mạng backbone AWS ngay tại điểm gần nhất → nhanh hơn internet thông thường. Trả thêm phí. | "speed up global upload to S3", "offices worldwide" |
| **S3 Express One Zone** | Nhanh gấp 10 lần S3 Standard (single-digit ms vs 100-200ms). Lưu 1 AZ duy nhất. Cho ML training, Spark, high-request analytics. | "single-digit ms", "ML training", "AI workload", "1 AZ OK" |
| **Mountpoint for S3** | Mount S3 như local file system trên Linux, dùng lệnh file thông thường. Không cần viết S3 SDK. Chỉ hỗ trợ sequential read tốt; không có POSIX locking. | "mount S3 as file system", "Linux read-only mount" |
| **S3 Event Notifications** | Trigger SNS/SQS/Lambda khi có object mới. EventBridge = filter nhiều event type hơn. | "notify on new object", "trigger Lambda on upload" |
| **S3 Replication (CRR/SRR)** | CRR = Cross-Region (compliance, disaster recovery). SRR = Same-Region (log aggregation, dev copy). Yêu cầu Versioning ON. | "replicate to another region", "cross-region copy" |
| **Origin Access Control (OAC)** | Bảo vệ S3 bucket: chỉ CloudFront có thể access, public không vào được trực tiếp. OAI = deprecated. | "secure S3 origin from CloudFront", "prevent direct S3 access" |

---

## 💾 EBS — Chọn Volume Type

| Volume Type | IOPS / Throughput | 💡 Vì Sao Chọn | Keyword |
|:---|:---|:---|:---|
| **gp3** | 3,000 IOPS base free; lên 16,000 IOPS | General purpose SSD. **Recommend default** cho hầu hết workloads. IOPS và throughput chỉnh độc lập với dung lượng (không như gp2). | "general purpose SSD", "cost-effective" |
| **io2 Block Express** | 256,000 IOPS; 99.999% durability | Mission-critical: SAP HANA, Oracle DB, SQL Server. Duy nhất hỗ trợ **Multi-Attach** (gắn 16 EC2 cùng AZ). | "max IOPS", "critical DB", "Multi-Attach" |
| **st1** (Throughput HDD) | 500 MB/s throughput | Kafka, big data, Hadoop — cần throughput cao, không cần IOPS cao. Rẻ hơn SSD. **Không dùng làm boot volume.** | "throughput-intensive", "big data", "Kafka" |
| **sc1** (Cold HDD) | 250 MB/s throughput | Dữ liệu lạnh ít truy cập, cần lưu trữ rẻ nhất. **Không dùng làm boot volume.** | "cold data", "cheapest EBS", "infrequent access" |
| **Instance Store (NVMe)** | Hàng triệu IOPS, microsecond | Gắn vật lý vào mainboard → không qua mạng → nhanh nhất. Nhưng **Ephemeral** (mất khi stop/terminate). Dùng cho scratch disk, temp buffer. | "millions IOPS", "microsecond", "ephemeral", "temp" |

> ⚠️ **EBS Multi-Attach**: Chỉ io1/io2. Chỉ cùng 1 AZ. App phải dùng cluster-aware file system (GFS2, Oracle RAC).  
> **Không nhầm với EFS** — EFS là file storage (NFS), không phải block storage.

---

## 📁 EFS — Elastic File System

| Keyword | Answer | 💡 Vì Sao |
|:---|:---|:---|
| "shared file system, Linux, multi-AZ, POSIX" | **Amazon EFS** (Standard) | Multi-AZ mặc định, hỗ trợ NFS v4.1, nhiều EC2/container cùng mount. |
| "EFS for serverless containers, isolated dir per app" | **EFS Access Points** | Access Point = cấp POSIX UID/GID + chroot vào thư mục cụ thể → app A không đụng vào thư mục app B. |
| "EFS: rarely accessed files, reduce cost" | **EFS Infrequent Access (IA) + Lifecycle Policy** | File không truy cập trong N ngày → tự động chuyển sang EFS IA tier (rẻ hơn 92%). |
| "SMB / Windows / Active Directory" | **FSx for Windows File Server** (NOT EFS) | EFS = Linux/NFS only. Đây là bẫy thường gặp. |

---

## 🏢 FSx VARIANTS — Chọn Đúng Loại

| FSx Variant | 💡 Vì Sao Chọn | Protocol | Keyword Trigger |
|:---|:---|:---|:---|
| **FSx for Windows File Server** | SMB native + Active Directory + NTFS ACLs + DFS Namespaces. App Windows mount `\\server\share` không đổi code. | SMB | "Windows", "AD", "SMB", "NTFS ACLs" |
| **FSx for Lustre** | Parallel POSIX FS cực nhanh, tự động liên kết S3 (import/export). ML training job đọc data song song từ 100+ node. | POSIX (Lustre) | "HPC", "ML training", "parallel FS", "S3-linked" |
| **FSx for NetApp ONTAP** | Multi-protocol (NFS + SMB + iSCSI), SnapMirror cross-region, FabricPool tiering. Cho workload enterprise đa nền tảng. | NFS/SMB/iSCSI | "multi-protocol", "NetApp", "SnapMirror" |
| **FSx for OpenZFS** | Linux/POSIX workloads muốn ZFS features (snapshots, clones, compression). | NFS | "ZFS", "Linux POSIX", "snapshots/clones" |

> ⚠️ **FSx for Lustre vs EFS**:  
> FSx Lustre = **HPC parallel throughput** (GB/s, ML training)  
> EFS = **general-purpose shared file** (web servers, content management)

---

## 🏗️ STORAGE GATEWAY — Chọn Đúng Variant

| Variant | On-Prem Protocol | 💡 Vì Sao Chọn | Stores In | Keyword |
|:---|:---|:---|:---|:---|
| **S3 File Gateway** | NFS / SMB | App on-prem cần lưu file lên S3 nhưng dùng NFS/SMB. File đẩy lên S3 objects. | Amazon S3 | "NFS mount → S3", "on-prem file share → cloud" |
| **FSx File Gateway** | SMB | Low-latency local cache cho FSx for Windows. App Windows dùng file trên cloud như local. | Amazon FSx | "low-latency FSx access", "local cache FSx" |
| **Volume Gateway — Stored** | iSCSI | Toàn bộ data ở local (on-prem). Async snapshot lên S3 như backup. Truy cập nhanh vì data tại chỗ. | On-prem + S3 async | "data on-prem, async backup S3" |
| **Volume Gateway — Cached** | iSCSI | Data chính ở S3 (cloud). Chỉ cache phần hay dùng tại chỗ. Tiết kiệm local storage. | S3 (primary) + local cache | "data mostly on S3, local cache hot data" |
| **Tape Gateway (VTL)** | iSCSI VTL | Thay thế băng từ vật lý. Phần mềm backup (Veeam, Backup Exec) không cần đổi — vẫn dùng iSCSI-VTL. Băng ảo lưu lên S3/Glacier. | S3 / Glacier | "tape library", "VTL", "backup software", "decommission tapes" |

**💡 Móc nhớ cho Stored vs Cached**:  
_"**Stored** = data **ở tại chỗ** (on-prem is primary). **Cached** = data **ở đám mây** (cloud is primary, on-prem là cache)."_

---

## 🚚 DATA TRANSFER — Chọn Đúng Dịch Vụ

| Scenario | Service | 💡 Vì Sao | Tốc Độ |
|:---|:---|:---|:---|
| "NFS/SMB/HDFS → S3/EFS, online, periodic sync" | **AWS DataSync** | Agent on-prem, task chạy theo lịch, checksum tự động, nhanh hơn rsync 10x, mã hóa TLS. | Rất nhanh (online) |
| "external partners SFTP upload → S3" | **AWS Transfer Family** | Tạo managed SFTP/FTPS/FTP endpoint, không cần FTP server. Đối tác dùng SFTP bình thường, file vào S3. | Phụ thuộc internet |
| "50-100 TB, slow internet (< 100 Mbps)" | **Snowball Edge** (80 TB) | 50 TB qua 10 Mbps = **462 ngày**. Snowball = gửi thiết bị vật lý, AWS tự copy vào S3. | Vài ngày (ship) |
| "PB-scale data center migration" | **AWS Snowmobile** | Xe container 100 PB. Chỉ dùng khi > 10 PB. | Vài tuần (ship) |
| "daily continuous on-prem file sync to cloud" | **Storage Gateway** | Gateway = cầu nối liên tục, app on-prem vẫn mount NFS/SMB như bình thường. DataSync = batch task không phải continuous. | Real-time |

> ⚠️ **DataSync vs Storage Gateway — Dễ Nhầm Nhất**:  
> **DataSync** = công cụ **di chuyển / đồng bộ định kỳ** (như rsync nhưng nhanh và bảo mật hơn)  
> **Storage Gateway** = **infrastructure liên tục** (app on-prem vẫn dùng được file share hàng ngày, data tự đẩy lên cloud phía sau)
