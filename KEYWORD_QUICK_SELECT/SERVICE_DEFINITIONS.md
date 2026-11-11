# 📖 TỪ ĐIỂN ĐỊNH NGHĨA CÁC DỊCH VỤ AWS (AWS SERVICE DEFINITIONS HANDBOOK)

> **Mục tiêu**: Định nghĩa chuẩn xác bản chất kỹ thuật, chức năng cốt lõi và câu thần chú ghi nhớ của **hơn 65+ dịch vụ AWS** thường xuyên xuất hiện nhất trong kỳ thi **AWS Certified Solutions Architect Associate (SAA-C03)** & **Professional (SAP-C02)**.  
> **Cấu trúc mỗi dịch vụ**:  
> 1. **Bản chất kỹ thuật (What is it?)**: Định nghĩa chuẩn xác 1 câu.  
> 2. **Sinh ra để làm gì (Core Job)?**: Giải quyết bài toán kiến trúc gì.  
> 3. **💡 Móc nhớ thần chú (Mental Anchor)**: Hình ảnh ẩn dụ thực tế giúp não bộ nhớ mãi.  
> 4. **Tín hiệu đề thi (Exam Trigger Signals)**: Các từ khóa xuất hiện là chọn ngay.

---

## 📑 MỤC LỤC ĐIỀU HƯỚNG NHANH

1. [Nhóm 1: Compute & Serverless (Điện Toán & Không Máy Chủ)](#1-nhóm-1-compute--serverless)
2. [Nhóm 2: Storage & Hybrid (Lưu Trữ & Hạ Tầng Lai)](#2-nhóm-2-storage--hybrid)
3. [Nhóm 3: Databases & Caching (Cơ Sở Dữ Liệu & Bộ Nhớ Đệm)](#3-nhóm-3-databases--caching)
4. [Nhóm 4: Networking & Content Delivery (Mạng & Phân Phối)](#4-nhóm-4-networking--content-delivery)
5. [Nhóm 5: Security, Identity & Compliance (Bảo Mật & Tuân Thủ)](#5-nhóm-5-security-identity--compliance)
6. [Nhóm 6: Integration, Messaging & Decoupling (Tích Hợp & Luồng Dữ Liệu)](#6-nhóm-6-integration-messaging--decoupling)
7. [Nhóm 7: Analytics & Big Data (Phân Tích Dữ Liệu Lớn)](#7-nhóm-7-analytics--big-data)
8. [Nhóm 8: Artificial Intelligence & Machine Learning (AI / ML)](#8-nhóm-8-artificial-intelligence--machine-learning)
9. [Nhóm 9: Migration & Disaster Recovery (Di Chuyển & Khôi Phục Thảm Họa)](#9-nhóm-9-migration--disaster-recovery)
10. [Nhóm 10: Management, Governance & Cost (Quản Trị & Chi Phí)](#10-nhóm-10-management-governance--cost)

---

## 1. NHÓM 1: COMPUTE & SERVERLESS

### 1.1. Amazon EC2 (Elastic Compute Cloud)
- **Bản chất**: Dịch vụ máy chủ ảo đám mây cấp độ hạ tầng (IaaS), cho phép tùy biến toàn quyền từ Hệ điều hành (OS), CPU, RAM, ổ cứng gắn kèm đến cấu hình mạng.
- **Sinh ra để làm gì?**: Thay thế hoàn toàn việc mua sắm máy chủ vật lý on-premises; mở rộng hoặc thu hẹp năng lực tính toán linh hoạt chỉ trong vài phút.
- **💡 Móc nhớ**: *"EC2 là căn nhà bạn thuê trọn gói: Tự chọn nội thất, tự khóa cửa, tự dọn dẹp vệ sinh nhưng phải trả tiền thuê đều đặn dù có ở hay không."*
- **Tín hiệu đề thi**: `virtual server`, `full OS access`, `custom kernel`, `GPU instance`, `long-running web app`.

### 1.2. AWS Lambda
- **Bản chất**: Dịch vụ tính toán phi máy chủ (Serverless FaaS - Function-as-a-Service), thực thi mã nguồn phản hồi theo các sự kiện (Event-driven) mà không cần cấp phát hay quản lý máy chủ.
- **Sinh ra để làm gì?**: Xử lý các tác vụ ngắn hạn (tối đa 15 phút), tự động co giãn từ 0 đến hàng ngàn thực thi đồng thời, chỉ tính tiền khi mã đang chạy.
- **💡 Móc nhớ**: *"Lambda là tài xế taxi công nghệ: Bạn chỉ trả tiền theo đúng số km xe chạy, xe dừng là đồng hồ dừng, không phải trả tiền bảo dưỡng xe."*
- **Tín hiệu đề thi**: `event-driven`, `serverless`, `< 15 min runtime`, `scale to zero`, `pay per execution`, `thumbnail generation on S3 upload`.

### 1.3. Amazon ECS (Elastic Container Service)
- **Bản chất**: Nền tảng điều phối container Docker độc quyền được quản lý toàn diện của AWS, tích hợp sâu với IAM, VPC, ALB và Route 53.
- **Sinh ra để làm gì?**: Đơn giản hóa việc chạy và mở rộng ứng dụng microservices đóng gói dưới dạng Docker container mà không phải chịu sự phức tạp của Kubernetes.
- **💡 Móc nhớ**: *"ECS là quản đốc bến cảng của riêng AWS: Sắp xếp các thùng container Docker vào đúng vị trí một cách nhanh gọn, dễ dùng nhất."*
- **Tín hiệu đề thi**: `Docker container`, `Task Definition`, `ECS Service`, `AWS-native container orchestration`.

### 1.4. Amazon EKS (Elastic Kubernetes Service)
- **Bản chất**: Dịch vụ Kubernetes được quản lý đạt chuẩn chứng nhận CNCF, tự động hóa tính sẵn sàng cao cho Kubernetes Control Plane trên đa AZs.
- **Sinh ra để làm gì?**: Vận hành cụm Kubernetes doanh nghiệp mà không cần tự cài đặt và bảo trì etcd/master nodes; tương thích 100% với hệ sinh thái mã nguồn mở k8s.
- **💡 Móc nhớ**: *"EKS là chuẩn container quốc tế: Chạy được ở mọi nơi từ On-premises, Google Cloud đến AWS mà không cần đổi file manifest `.yaml`."*
- **Tín hiệu đề thi**: `Kubernetes`, `k8s manifests`, `Helm charts`, `CRD`, `open-source compatibility`.

### 1.5. AWS Fargate
- **Bản chất**: Công cụ tính toán Serverless dành cho Containers (hỗ trợ cả ECS và EKS).
- **Sinh ra để làm gì?**: Chạy container mà **hoàn toàn không cần quản lý cụm máy chủ EC2 host bên dưới**. Người dùng chỉ cần khai báo lượng CPU và RAM cần dùng cho từng Task.
- **💡 Móc nhớ**: *"Fargate là gửi hàng theo kiện: Bạn chỉ cần đóng thùng hàng và trả cước theo cân nặng, hãng tàu tự xếp lên tàu nào bạn không cần bận tâm."*
- **Tín hiệu đề thi**: `run containers without managing servers`, `no EC2 management`, `serverless container`, `Fargate Spot`.

### 1.6. AWS Batch
- **Bản chất**: Dịch vụ lập lịch và điều phối các tác vụ tính toán hàng loạt (Batch Computing) ở mọi quy mô, tự động cấp phát tài nguyên EC2/Spot tối ưu.
- **Sinh ra để làm gì?**: Quản lý hàng trăm ngàn job tính toán phân tích kỹ thuật, mô phỏng sinh học, chuyển mã video; tự động chọn loại instance và scale về 0 khi xong việc.
- **💡 Móc nhớ**: *"Batch là dây chuyền gia công theo đơn: Nhận một đống đơn hàng, tự thuê công nhân thời vụ (Spot) làm thật nhanh rồi tự giải tán để tiết kiệm tiền."*
- **Tín hiệu đề thi**: `batch jobs`, `job queue`, `unlimited execution time (hours/days)`, `HPC jobs`, `Spot instance integration`.

### 1.7. AWS App Runner & Amazon Lightsail
- **Amazon Lightsail**: VPS đóng gói trọn gói (Compute + Storage + Networking + IP) với chi phí cố định thấp từ \$3.5/tháng, dành cho website WordPress, ứng dụng nhỏ của SME.
- **AWS App Runner**: Nền tảng PaaS serverless hoàn toàn cho web app và API containerized; chỉ cần trỏ vào Git repo hoặc Container registry là tự build, deploy, scale và gắn chứng chỉ SSL.

---

## 2. NHÓM 2: STORAGE & HYBRID

### 2.1. Amazon S3 (Simple Storage Service)
- **Bản chất**: Dịch vụ lưu trữ đối tượng (Object Storage) phân tán trên quy mô toàn cầu, dung lượng không giới hạn, độ bền đạt chuẩn công nghiệp 99.999999999% (11 số 9).
- **Sinh ra để làm gì?**: Lưu trữ dữ liệu phi cấu trúc (ảnh, video, logs, sao lưu, file cài đặt, Data Lake); đóng vai trò kho chứa dữ liệu tĩnh trung tâm của đám mây.
- **💡 Móc nhớ**: *"S3 là đại dương lưu trữ vô tận: Ném bất cứ tệp tin nào vào kèm theo một chiếc nhãn (Object Key) là đảm bảo 10 triệu năm không bao giờ mất."*
- **Tín hiệu đề thi**: `object storage`, `11 9s durability`, `static website hosting`, `data lake storage`, `lifecycle policies`, `unlimited capacity`.

### 2.2. Amazon EBS (Elastic Block Store)
- **Bản chất**: Ổ đĩa lưu trữ dạng khối (Block Storage) kết nối mạng hiệu năng cao, bền vững, được thiết kế chuyên biệt để gắn vào một máy ảo EC2 trong cùng 1 Availability Zone.
- **Sinh ra để làm gì?**: Làm ổ đĩa khởi động hệ điều hành (Root Volume) và ổ đĩa dữ liệu cho các hệ quản trị cơ sở dữ liệu đòi hỏi độ trễ thấp và tính nhất quán cao.
- **💡 Móc nhớ**: *"EBS là ổ cứng cắm cáp quang vào máy ảo: Máy chạy ở phòng nào (AZ nào) thì ổ đĩa phải ở đúng phòng đó mới cắm dây vào được."*
- **Tín hiệu đề thi**: `block storage`, `boot volume`, `gp3`, `io2 Block Express`, `attach to single EC2`, `multi-attach in same AZ`.

### 2.3. Amazon EFS (Elastic File System)
- **Bản chất**: Hệ thống tệp tin mạng dùng chung chuẩn **POSIX (giao thức NFS v4)** được quản lý serverless, tự động co giãn dung lượng và đa vùng sẵn sàng (Multi-AZ).
- **Sinh ra để làm gì?**: Cho phép hàng ngàn máy chủ EC2, container ECS/Fargate hoặc hàm Lambda cùng lúc đọc/ghi vào một thư mục dùng chung mà không cần sửa code.
- **💡 Móc nhớ**: *"EFS là ổ đĩa mạng nội bộ công ty dành cho máy Linux: Ai cũng có thể mở thư mục chung ra xem và sửa file cùng một lúc."*
- **Tín hiệu đề thi**: `shared file system`, `NFS protocol`, `POSIX compliant`, `Linux`, `multi-AZ shared storage`, `without changing app code`.

### 2.4. Amazon FSx Family
- **FSx for Windows File Server**: Hệ thống tệp chia sẻ native cho Windows, hỗ trợ chuẩn **SMB**, tích hợp **Active Directory** và **NTFS ACLs**.
- **FSx for Lustre**: Hệ thống tệp song song cực nhanh (hàng triệu IOPS, hàng trăm GB/s throughput) tích hợp trực tiếp với Amazon S3, phục vụ tính toán hiệu năng cao (**HPC**) và **Machine Learning Training**.
- **FSx for NetApp ONTAP**: Hệ thống tệp đa giao thức (NFS, SMB, iSCSI), hỗ trợ tính năng deduplication, compression, và SnapMirror của NetApp.
- **FSx for OpenZFS**: Dành cho các ứng dụng chạy trên ZFS file system của Linux.

### 2.5. AWS Storage Gateway
- **Bản chất**: Dịch vụ lưu trữ lai (Hybrid Storage) kết nối hạ tầng On-Premises của doanh nghiệp với dung lượng lưu trữ không giới hạn trên Amazon S3 và Glacier.
- **3 Biến thể cốt lõi**:
  1. **S3 File Gateway**: Cung cấp giao diện mạng NFS/SMB tại chỗ, lưu trữ file thành S3 Object có đệm cục bộ (Local Cache).
  2. **Volume Gateway (Stored vs Cached)**: Cung cấp ổ đĩa khối iSCSI. *Stored* = dữ liệu chính ở tại chỗ, backup snapshot lên S3; *Cached* = dữ liệu chính trên S3, chỉ giữ dữ liệu nóng tại chỗ.
  3. **Tape Gateway (VTL)**: Giả lập thư viện băng từ ảo iSCSI VTL, thay thế băng từ vật lý bằng S3 Glacier.
- **💡 Móc nhớ**: *"Storage Gateway là đường ống dẫn nước từ bể ngầm On-Premises nối thẳng ra hồ chứa S3 trên mây."*
- **Tín hiệu đề thi**: `hybrid storage`, `local cache for on-prem apps`, `iSCSI virtual tape`, `decommission tape library`.

### 2.6. AWS DataSync
- **Bản chất**: Dịch vụ truyền tải dữ liệu trực tuyến tốc độ cao và an toàn giữa các hệ thống lưu trữ tại chỗ (NFS, SMB, HDFS) hoặc cloud khác với AWS Storage (S3, EFS, FSx).
- **Sinh ra để làm gì?**: Tự động hóa và tăng tốc quá trình đồng bộ dữ liệu định kỳ, tích hợp mã hóa TLS, nén dữ liệu và kiểm tra toàn vẹn checksum tự động (nhanh gấp 10 lần rsync).
- **Tín hiệu đề thi**: `online data transfer`, `scheduled sync`, `NFS/SMB to S3`, `10x faster than rsync`, `checksum verification`.

### 2.7. AWS Transfer Family
- **Bản chất**: Dịch vụ cung cấp cổng kết nối bảo mật hoàn toàn được quản lý cho các giao thức truyền tệp truyền thống: **SFTP, FTPS, FTP, AS2**.
- **Sinh ra để làm gì?**: Cho phép đối tác bên ngoài tải tệp vào/ra Amazon S3 hoặc EFS thông qua giao thức SFTP quen thuộc mà không cần duy trì bất kỳ máy chủ FTP nào.
- **Tín hiệu đề thi**: `SFTP endpoint`, `external B2B file transfer to S3`, `no changes to client FTP scripts`.

---

## 3. NHÓM 3: DATABASES & CACHING

### 3.1. Amazon RDS (Relational Database Service)
- **Bản chất**: Dịch vụ cơ sở dữ liệu quan hệ được quản lý (Managed RDBMS), hỗ trợ 6 engine: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server và IBM Db2.
- **Sinh ra để làm gì?**: Tự động hóa các tác vụ quản trị tốn thời gian: cài đặt OS, vá lỗi bảo mật (patching), sao lưu liên tục (automated backups), khôi phục theo điểm thời gian (PITR), và dự phòng thảm họa (Multi-AZ).
- **💡 Móc nhớ**: *"RDS là thuê chuyên gia DBA của AWS chăm sóc cơ sở dữ liệu: Bạn chỉ việc tạo bảng và query dữ liệu, chuyện backup, nâng cấp hệ thống đã có AWS lo."*
- **Tín hiệu đề thi**: `relational database`, `OLTP`, `Multi-AZ failover`, `Read Replicas for read scaling`, `Storage Auto Scaling`.

### 3.2. Amazon Aurora
- **Bản chất**: Hệ quản trị cơ sở dữ liệu quan hệ độc quyền thế hệ mới của AWS, tương thích 100% với **MySQL (nhanh hơn gấp 5 lần)** và **PostgreSQL (nhanh hơn gấp 3 lần)**.
- **Kiến trúc đột phá**: Tách rời tầng tính toán (Compute) và tầng lưu trữ (Storage). Tầng lưu trữ nhân bản **6 bản sao trên 3 Availability Zones**, tự động sửa lỗi (self-healing) và co giãn tới 128 TB.
- **Các tính năng đỉnh cao**:
  - **Aurora Serverless v2**: Co giãn công suất theo mili-giây (0.5 đến 128 ACUs).
  - **Aurora Global Database**: Nhân bản dữ liệu đa vùng với độ trễ $< 1$s, chuyển đổi thảm họa xuyên lục địa trong $< 1$ phút.
  - **Aurora Clone**: Tạo bản sao cơ sở dữ liệu thử nghiệm tức thì với chi phí \$0 nhờ cơ chế Copy-on-Write.
  - **Aurora Backtrack**: Quay ngược thời gian cơ sở dữ liệu về thời điểm trước khi bị lỗi mà không cần restore backup.

### 3.3. Amazon DynamoDB
- **Bản chất**: Cơ sở dữ liệu phi quan hệ (NoSQL Key-Value & Document) serverless được quản lý hoàn toàn, bảo đảm độ trễ ổn định **dưới 10 mili-giây ở bất kỳ quy mô dữ liệu nào**.
- **Sinh ra để làm gì?**: Phục vụ các ứng dụng web quy mô Internet (hàng triệu người dùng, hàng triệu request/giây): giỏ hàng thương mại điện tử, bảng xếp hạng game, thông tin phiên đăng nhập.
- **Các tính năng trọng tâm thi**:
  - **DynamoDB Accelerator (DAX)**: Cụm bộ nhớ đệm In-Memory nâng tốc độ đọc lên **microsecond** mà không cần sửa code ứng dụng.
  - **DynamoDB Global Tables**: Cơ chế Active-Active đa vùng toàn cầu (mọi region đều ghi và đọc trực tiếp), giải quyết xung đột bằng Last-writer-wins.
  - **DynamoDB Streams**: Ghi lại dòng nhật ký thay đổi dữ liệu thời gian thực (CDC) để kích hoạt hàm Lambda.
- **💡 Móc nhớ**: *"DynamoDB là chiếc tủ khóa điện tử vô tận: Bạn tra đúng mã khóa (Partition Key) là tủ tự mở ngay lập tức trong 2 mili-giây bất kể trong kho có 1 triệu hay 1 tỷ chiếc tủ."*

### 3.4. Amazon ElastiCache
- **Bản chất**: Dịch vụ bộ nhớ đệm In-Memory được quản lý, hỗ trợ **Redis (Valkey)** và **Memcached**.
- **Sinh ra để làm gì?**: Giảm tải đọc tới 90% cho cơ sở dữ liệu quan hệ (RDS/Aurora) và tăng tốc thời gian phản hồi của ứng dụng xuống dưới 1 mili-giây.
- **Phân biệt 30 giây**:
  - **Redis**: Đa năng (hỗ trợ Data structures, Pub/Sub, Multi-AZ Replication, Snapshot持久化, Session store).
  - **Memcached**: Đơn giản thuần túy (Key-Value, đa luồng Multi-threaded scale out).

### 3.5. Các Cơ Sở Dữ Liệu Chuyên Dụng (Specialized Databases)
- **Amazon DocumentDB**: Tương thích mã nguồn mở **MongoDB**, tối ưu hóa cho dữ liệu tài liệu định dạng JSON bán cấu trúc, tự động mở rộng lưu trữ đến 128 TB.
- **Amazon Neptune**: Cơ sở dữ liệu đồ thị (**Graph Database**), hỗ trợ Gremlin và openCypher, tối ưu cho bài toán mạng xã hội, điều tra gian lận thẻ tín dụng, cây quan hệ phức tạp.
- **Amazon QLDB (Quantum Ledger Database)**: Cơ sở dữ liệu sổ cái tập trung bất biến (**Immutable Append-only Ledger**), sử dụng cây mã hóa Merkle Tree SHA-256 để chứng minh dữ liệu tài chính không bị can thiệp.
- **Amazon Keyspaces**: Dịch vụ cơ sở dữ liệu Apache Cassandra serverless, tương thích 100% ngôn ngữ truy vấn **CQL**, không cần quản trị máy chủ cụm.
- **Amazon Timestream**: Cơ sở dữ liệu chuỗi thời gian (**Time-series**) serverless cho cảm biến IoT, viễn thông, tự động phân tầng lưu trữ nóng (In-memory) sang lạnh (Magnetic).
- **Amazon MemoryDB for Redis**: Cơ sở dữ liệu chính (Primary DB) tương thích Redis nhưng có độ bền dữ liệu Multi-AZ chuẩn Enterprise (khác ElastiCache chỉ đóng vai trò làm cache phụ).

---

## 4. NHÓM 4: NETWORKING & CONTENT DELIVERY

### 4.1. Amazon VPC (Virtual Private Cloud)
- **Bản chất**: Mạng riêng ảo biệt lập về mặt logic dành riêng cho tài khoản AWS của bạn trên nền tảng hạ tầng toàn cầu.
- **Sinh ra để làm gì?**: Cung cấp toàn quyền kiểm soát môi trường mạng: chọn dải địa chỉ IPv4/IPv6 (CIDR), chia nhỏ thành các **Public Subnet** (có Internet Gateway) và **Private Subnet** (đi qua NAT Gateway), cấu hình bảng định tuyến (Route Tables) và tường lửa ảo.
- **💡 Móc nhớ**: *"VPC là mảnh đất có hàng rào kiên cố của bạn trên đám mây: Bạn tự chia phòng khách (Public) cho khách vào và phòng ngủ (Private) giấu kín bên trong."*

### 4.2. AWS Transit Gateway (TGW)
- **Bản chất**: Thiết bị định tuyến mạng trung tâm đám mây (Cloud Router) theo mô hình hình sao (Hub-and-Spoke).
- **Sinh ra để làm gì?**: Kết nối hàng trăm, hàng ngàn VPC và mạng On-Premises (qua VPN hoặc Direct Connect) về một điểm duy nhất, loại bỏ sự phức tạp của mô hình lưới kết nối điểm-điểm (VPC Peering mesh).
- **Tín hiệu đề thi**: `hub-and-spoke topology`, `centralized routing for hundreds of VPCs`, `multicast support`.

### 4.3. AWS PrivateLink (Interface VPC Endpoints)
- **Bản chất**: Công nghệ kết nối mạng riêng tư an toàn cao cấp sử dụng card mạng ảo **ENI** có địa chỉ IP riêng trong subnet.
- **Sinh ra để làm gì?**: Truy cập các dịch vụ AWS hoặc dịch vụ SaaS của bên thứ 3 mà **gói tin không bao giờ đi ra Internet công cộng**. Đặc biệt, đây là giải pháp duy nhất cho phép kết nối giữa 2 VPC có **dải địa chỉ IP trùng lặp (Overlapping CIDR)**.
- **Tín hiệu đề thi**: `private connection without internet`, `overlapping CIDRs between VPCs`, `SaaS private connectivity`.

### 4.4. AWS Elastic Load Balancing (ELB)
- **Bản chất**: Dịch vụ tự động phân phối lưu lượng truy cập mạng đến nhiều mục tiêu (EC2, Containers, Lambda, IP addresses) trên đa vùng sẵn sàng (Multi-AZ).
- **3 Dòng tải trọng tâm**:
  1. **Application Load Balancer (ALB)**: Hoạt động ở **Layer 7 (HTTP/HTTPS/WebSocket)**. Hỗ trợ định tuyến nâng cao theo URL Path (`/api`, `/images`), Host header, tích hợp AWS WAF và xác thực người dùng.
  2. **Network Load Balancer (NLB)**: Hoạt động ở **Layer 4 (TCP/UDP/TLS)**. Xử lý hàng triệu request/giây với độ trễ cực thấp (microsecond), cung cấp **địa chỉ IP tĩnh (Elastic IP)** cố định.
  3. **Gateway Load Balancer (GWLB)**: Hoạt động ở **Layer 3 Gateway + Layer 4 Packet Inspection**. Chèn cụm tường lửa ảo của bên thứ 3 (Palo Alto, Check Point, Fortinet) vào luồng mạng một cách trong suốt bằng giao thức GENEVE (port 6081).

### 4.5. AWS Global Accelerator
- **Bản chất**: Dịch vụ tăng tốc mạng tầng truyền vận (Layer 4) sử dụng mạng trục cáp quang riêng toàn cầu của AWS.
- **Sinh ra để làm gì?**: Cung cấp **2 địa chỉ Anycast IP tĩnh** làm điểm tiếp nhận duy nhất cho toàn cầu, dẫn luồng traffic của người dùng vào điểm biên PoP gần nhất để đi trên mạng riêng AWS. Hỗ trợ cả **TCP và UDP**, bỏ qua hoàn toàn bộ nhớ đệm DNS của client/ISP để chuyển đổi thảm họa tức thì.
- **Tín hiệu đề thi**: `static Anycast IPs`, `TCP/UDP support`, `gaming / VoIP`, `bypass DNS caching`, `instant failover`.

### 4.6. Amazon CloudFront
- **Bản chất**: Mạng lưới phân phối nội dung toàn cầu (Content Delivery Network - CDN) Layer 7 với hơn 450+ điểm biên (Edge Locations).
- **Sinh ra để làm gì?**: Lưu cache nội dung tĩnh (ảnh, video, html) và tăng tốc nội dung động (API) gần nhất với người dùng cuối, giảm tải 90% cho máy chủ gốc (S3, ALB) và bảo vệ an ninh chu vi mạng với AWS WAF.
- **Tín hiệu đề thi**: `edge caching`, `CDN`, `DDoS absorption at edge`, `OAC for S3 origin`, `CloudFront Functions / Lambda@Edge`.

### 4.7. Amazon Route 53
- **Bản chất**: Dịch vụ hệ thống phân giải tên miền (DNS) có độ sẵn sàng và khả năng co giãn cao cấp độ doanh nghiệp (SLA 100%), hoạt động trên cổng Port 53.
- **Các chính sách định tuyến (Routing Policies)**:
  - **Simple**: Trả về 1 hoặc nhiều IP ngẫu nhiên, không có health check.
  - **Weighted**: Chia phần trăm lưu lượng (ví dụ: 90% v1, 10% v2 cho A/B testing).
  - **Latency**: Chuyển hướng người dùng về Region có độ trễ mạng thấp nhất.
  - **Failover**: Dự phòng thảm họa Active-Passive (tự chuyển sang trang tĩnh S3 khi máy chủ chính chết health check).
  - **Geolocation**: Định tuyến theo vị trí địa lý của người dùng (theo Quốc gia hoặc Lục địa).
  - **Geoproximity**: Định tuyến theo cả vị trí người dùng và vị trí tài nguyên, có tham số **Bias (-99 đến +99)** để nới rộng/thu hẹp vùng phục vụ.
  - **Multi-Value Answer**: Trả về danh sách tối đa 8 bản ghi IP khỏe mạnh kèm health check.
- **Bản ghi Alias Record**: Tính năng độc quyền miễn phí trỏ thẳng Apex Domain (`example.com`) vào tài nguyên AWS (ALB, CloudFront, S3 website) mà CNAME không làm được.

### 4.8. AWS Direct Connect (DX) & Site-to-Site VPN
- **AWS Direct Connect**: Đường truyền cáp vật lý chuyên dụng riêng biệt từ trung tâm dữ liệu On-Premises đến AWS qua đối tác viễn thông, băng thông cực lớn (1G/10G/100Gbps), độ trễ ổn định, không đi qua Internet.
- **AWS Site-to-Site VPN**: Đường hầm bảo mật mã hóa IPsec qua Internet công cộng, triển khai nhanh trong vài phút, băng thông tối đa 1.25 Gbps/tunnel, dùng làm kết nối chính cho doanh nghiệp vừa hoặc làm kênh dự phòng (backup) cho Direct Connect.

---

## 5. NHÓM 5: SECURITY, IDENTITY & COMPLIANCE

### 5.1. AWS IAM & Organizations
- **AWS IAM (Identity and Access Management)**: Dịch vụ quản trị danh tính và phân quyền truy cập miễn phí: tạo IAM Users, Groups, Roles và gắn Identity-based Policies dạng JSON tuân thủ nguyên tắc quyền tối thiểu (**Principle of Least Privilege**).
- **AWS Organizations**: Dịch vụ quản lý tập trung đa tài khoản AWS (Multi-Account Governance), gom nhóm các tài khoản vào các Đơn vị tổ chức (**Organizational Units - OUs**), hợp nhất thanh toán (Consolidated Billing) và áp đặt rào chắn an ninh tối cao bằng **Service Control Policies (SCPs)**.

### 5.2. AWS KMS (Key Management Service)
- **Bản chất**: Dịch vụ quản lý và tạo khóa mã hóa dữ liệu tập trung, được chứng nhận bảo mật FIPS 140-2 Cryptographic Modules.
- **Cơ chế Envelope Encryption**: KMS chỉ mã hóa trực tiếp dữ liệu $\le 4$ KB. Khi mã hóa đĩa EBS, file S3 hay RDS: KMS sinh ra **Data Key** (gồm Plaintext Key để máy chủ tự mã hóa cục bộ và Ciphertext Key lưu trữ đi kèm dữ liệu).

### 5.3. Bộ Tứ Phát Hiện & Điều Tra Mối Đe Dọa
- **Amazon GuardDuty**: Dịch vụ phát hiện mối đe dọa an ninh tự động trong thời gian thực (Runtime Threat Detection), ứng dụng Machine Learning phân tích các nguồn nhật ký: **CloudTrail Logs, VPC Flow Logs, DNS Logs, EKS Audit Logs** để phát hiện mã độc đào coin, rò rỉ khóa hay tấn công brute-force.
- **Amazon Inspector**: Dịch vụ quét lỗ hổng bảo mật phần mềm tĩnh (**CVE**) và cấu hình mạng hở trên các máy ảo EC2, mã nguồn Lambda và kho ảnh container Amazon ECR.
- **Amazon Macie**: Dịch vụ bảo mật dữ liệu sử dụng ML để tự động phát hiện, phân loại và cảnh báo dữ liệu nhạy cảm (**PII: số căn cước, thẻ tín dụng, hồ sơ y tế**) đang lưu trữ trong **Amazon S3**.
- **Amazon Detective**: Dịch vụ điều tra nguyên nhân gốc rễ (Root-Cause Analysis) sau sự cố an ninh, tự động trích xuất log dựng thành đồ thị trực quan (Visual Graph) thể hiện đường đi của cuộc tấn công.

### 5.4. Tường Lửa & Phòng Chống DDoS
- **AWS WAF (Web Application Firewall)**: Tường lửa ứng dụng web Layer 7 kiểm tra lưu lượng HTTP/HTTPS, chặn tấn công SQL Injection (SQLi), Cross-Site Scripting (XSS), chặn IP xấu và giới hạn tốc độ request (Rate-limiting). Triển khai trên: CloudFront, ALB, API Gateway, AppSync, Cognito.
- **AWS Shield (Standard vs Advanced)**: Shield Standard tự động bảo vệ L3/L4 DDoS miễn phí cho mọi khách hàng AWS. Shield Advanced cung cấp đội phản ứng an ninh 24/7 (DDoS Response Team - SRT), bảo vệ chi phí không bị tăng vọt do DDoS và giám sát Layer 7 nâng cao.
- **AWS Network Firewall**: Tường lửa mạng Stateful L3–L7 có khả năng kiểm tra sâu gói tin (DPI), lọc tên miền FQDN và tích hợp bộ quy tắc phòng chống xâm nhập mã nguồn mở Suricata IPS cho toàn bộ VPC.
- **AWS Firewall Manager**: Dịch vụ quản trị tập trung cho phép thiết lập và tự động áp đặt bộ quy tắc WAF, Shield, Network Firewall, Route 53 DNS Firewall trên **mọi tài khoản và mọi VPC mới** trong AWS Organizations.

### 5.5. Quản Lý Bí Mật, Tuân Thủ & Đăng Nhập
- **AWS Secrets Manager**: Dịch vụ lưu trữ và tự động xoay vòng (**Automatic Rotation**) mật khẩu cơ sở dữ liệu, API keys định kỳ không gây downtime bằng Lambda functions; tích hợp chặt chẽ với RDS và Aurora.
- **AWS Systems Manager Parameter Store**: Kho lưu trữ tham số cấu hình tĩnh, biến môi trường, chuỗi license (Standard Tier miễn phí), hỗ trợ mã hóa SecureString với KMS nhưng không có tính năng tự động xoay vòng.
- **AWS Artifact**: Cổng tự phục vụ chính thức của AWS cho phép tải về miễn phí các báo cáo kiểm toán tuân thủ quốc tế (ISO, SOC 1/2/3, PCI-DSS) và ký thỏa thuận pháp lý **HIPAA BAA**.
- **Amazon Cognito**:
  - **User Pools**: Đóng vai trò danh bạ người dùng (User Directory) quản lý việc Đăng ký, Đăng nhập, MFA và cấp mã định danh **JWT Token**.
  - **Identity Pools**: Cung cấp quyền hạn (Authorization), đổi vé đăng nhập (từ Google, Facebook, Apple hoặc User Pools) lấy thông tin xác thực tạm thời của AWS IAM (STS Credentials) để gọi trực tiếp các dịch vụ như S3, DynamoDB.

---

## 6. NHÓM 6: INTEGRATION, MESSAGING & DECOUPLING

### 6.1. Amazon SQS (Simple Queue Service)
- **Bản chất**: Dịch vụ hàng đợi tin nhắn phân tán serverless (Message Queue) đầu tiên của AWS, giúp tách rời (decouple) các tầng kiến trúc ứng dụng.
- **Hai loại hàng đợi**:
  - **SQS Standard**: Thông lượng gần như vô hạn, bảo đảm chuyển giao tin nhắn ít nhất một lần (**At-least-once**), thứ tự ngẫu nhiên (**Best-effort ordering**).
  - **SQS FIFO**: Đảm bảo thứ tự tuyệt đối (**First-In-First-Out**) và xử lý đúng một lần duy nhất (**Exactly-once** qua Deduplication ID), thông lượng tối đa 3,000 msg/s khi dùng batching.

### 6.2. Amazon SNS (Simple Notification Service)
- **Bản chất**: Dịch vụ gửi nhận thông báo đẩy theo mô hình Nhà xuất bản - Người đăng ký (**Pub/Sub** - Publisher/Subscriber) tốc độ cao.
- **Ứng dụng kinh điển**: **SNS Fan-out Pattern** — 1 tin nhắn xuất bản vào SNS Topic sẽ được tự động sao chép và phát tán đồng thời tới nhiều hàng đợi SQS khác nhau để các đội microservices xử lý song song và độc lập.

### 6.3. Amazon EventBridge (Formerly CloudWatch Events)
- **Bản chất**: Xe buýt sự kiện phi máy chủ (**Serverless Event Bus**) hiện đại, nhận dữ liệu sự kiện JSON thời gian thực từ các dịch vụ AWS, ứng dụng tùy biến của riêng bạn hoặc đối tác SaaS (Zendesk, Shopify, Datadog) để định tuyến tới các đích xử lý (Lambda, Step Functions, SQS, SNS).
- **EventBridge Scheduler**: Bộ lập lịch tác vụ độc lập cực kỳ mạnh mẽ, thay thế cron jobs truyền thống, hỗ trợ cấu hình theo múi giờ và cửa sổ thời gian co giãn.

### 6.4. Amazon Kinesis Suite
- **Kinesis Data Streams (KDS)**: Nền tảng hấp thụ luồng dữ liệu thời gian thực lớn (Streaming Data Platform), lưu trữ và cho phép phát lại dữ liệu từ 24h đến 365 ngày, chia nhỏ công suất theo các đơn vị **Shards** (1 MB/s write, 2 MB/s read).
- **Kinesis Data Firehose**: Dịch vụ trích xuất và nạp dữ liệu luồng tự động (ETL Delivery) dạng Serverless hoàn toàn, tự động đóng gói buffer và đổ thẳng dữ liệu vào **S3, Redshift, OpenSearch, Splunk** mà không cần viết mã consumer.
- **Kinesis Data Analytics (Managed Service for Apache Flink)**: Phân tích và tính toán trên dòng dữ liệu đang chảy bằng ngôn ngữ SQL hoặc Apache Flink thời gian thực.

### 6.5. AWS Step Functions & Amazon MQ
- **AWS Step Functions**: Dịch vụ điều phối luồng công việc serverless (Visual Workflow Orchestrator), biểu diễn các bước nghiệp vụ thành cỗ máy trạng thái (**State Machine**). *Standard Workflows* chạy tối đa 1 năm (có bước người duyệt); *Express Workflows* chạy tối đa 5 phút cho tác vụ streaming/IoT tốc độ cao.
- **Amazon MQ**: Dịch vụ Message Broker được quản lý dành cho các giao thức truyền thống như **JMS, AMQP, MQTT, STOMP** (hỗ trợ Apache ActiveMQ và RabbitMQ). Dùng khi di chuyển ứng dụng cũ (Lift-and-Shift) lên AWS mà **nghiêm cấm sửa code ứng dụng**.

---

## 7. NHÓM 7: ANALYTICS & BIG DATA

### 7.1. Amazon Athena
- **Bản chất**: Dịch vụ truy vấn dữ liệu phân tích dạng Serverless tương thích chuẩn ANSI SQL, đọc trực tiếp dữ liệu lưu trữ trên Amazon S3 mà không cần di chuyển hay nạp dữ liệu.
- **Mô hình chi phí**: Tính tiền \$5 trên mỗi Terabyte (TB) dữ liệu được quét. Tối ưu chi phí bằng cách chuyển đổi sang định dạng cột (**Parquet / ORC**) và chia vùng dữ liệu (**Partitioning**).

### 7.2. AWS Glue
- **Bản chất**: Dịch vụ tích hợp dữ liệu phi máy chủ (Serverless Data Integration / ETL).
- **Các thành phần cốt lõi**:
  - **Glue Crawlers**: Quét dữ liệu tự động suy luận schema và lưu vào **Glue Data Catalog**.
  - **Glue Data Catalog**: Từ điển siêu dữ liệu chung cho Athena, Redshift Spectrum, EMR.
  - **Glue DataBrew**: Công cụ làm sạch dữ liệu trực quan kéo thả không cần viết code (**No-code**) cho Business Analysts.
  - **Glue ETL Jobs**: Chạy các script biến đổi dữ liệu phân tán bằng Python / PySpark.

### 7.3. Amazon EMR (Elastic MapReduce)
- **Bản chất**: Nền tảng cụm máy chủ dữ liệu lớn (Big Data Cluster) chạy các framework mã nguồn mở hàng đầu: **Apache Spark, Hadoop, Presto, HBase, Flink**.
- **Tối ưu chi phí**: Tách biệt thành Master Node (chạy On-Demand), Core Nodes (lưu HDFS) và **Task Nodes (chỉ tính toán, luôn chạy trên Spot Instances để tiết kiệm 80%)**.

### 7.4. Amazon Redshift
- **Bản chất**: Kho dữ liệu phân tích quy mô Petabyte đám mây (Cloud Data Warehouse) theo mô hình lưu trữ dạng cột (Columnar Storage) và xử lý song song khối lượng lớn (Massively Parallel Processing - MPP).
- **Tính năng nâng cao**:
  - **Redshift Spectrum**: Cho phép câu lệnh SQL của Redshift đọc xuyên thấu trực tiếp vào tệp tin thô trên Amazon S3 Data Lake mà không cần nạp vào ổ đĩa cluster.
  - **Concurrency Scaling**: Tự động tăng cường thêm các cụm phụ tạm thời để đáp ứng hàng ngàn truy vấn đồng thời vào giờ cao điểm.

### 7.5. AWS Lake Formation & Amazon OpenSearch
- **AWS Lake Formation**: Dịch vụ quản trị tập trung giúp xây dựng Data Lake bảo mật trên S3 trong vài ngày; cung cấp khả năng **phân quyền chi tiết tới từng hàng và cột (Row/Column-level access control)** mà IAM S3 không làm được.
- **Amazon OpenSearch Service**: Dịch vụ tìm kiếm và phân tích nhật ký phân tán (tiền thân là Elasticsearch), cung cấp công cụ tìm kiếm toàn văn (Full-text search), phân tích log ứng dụng và bảng điều khiển trực quan OpenSearch Dashboards (Kibana).

---

## 8. NHÓM 8: ARTIFICIAL INTELLIGENCE & MACHINE LEARNING

### 8.1. Các Dịch Vụ AI Dựng Sẵn (Turnkey AI Services - Không Cần Biết ML)
- **Amazon Textract**: Dịch vụ OCR thế hệ mới sử dụng học máy, có khả năng đọc và trích xuất nguyên vẹn cấu trúc **Bảng biểu (Tables)** và **Biểu mẫu (Forms / Key-Value pairs)** từ tài liệu scan, hóa đơn và file PDF.
- **Amazon Comprehend**: Dịch vụ xử lý ngôn ngữ tự nhiên (NLP) phân tích văn bản để phát hiện cảm xúc (**Sentiment** tích cực/tiêu cực), thực thể (**Entities**), ngôn ngữ và che giấu dữ liệu nhạy cảm PII.
- **Amazon Rekognition**: Dịch vụ thị giác máy tính phân tích hình ảnh và video: nhận diện khuôn mặt, tìm kiếm người nổi tiếng, phát hiện đồ vật và kiểm duyệt nội dung phản cảm (Content Moderation).
- **Amazon Transcribe**: Chuyển đổi giọng nói âm thanh (Audio) thành văn bản (Speech-to-Text).
- **Amazon Polly**: Chuyển đổi văn bản thành giọng đọc tự nhiên sống động (Text-to-Speech) với hơn 60 giọng đọc đa ngôn ngữ.
- **Amazon Translate**: Dịch thuật văn bản đa ngôn ngữ theo thời gian thực sử dụng mạng nơ-ron sâu.
- **Amazon Personalize**: Động cơ cá nhân hóa trải nghiệm và gợi ý sản phẩm thời gian thực (Recommendation Engine) dựa trên công nghệ học máy tương tự trang thương mại điện tử Amazon.com.
- **Amazon Kendra**: Công cụ tìm kiếm thông minh cấp độ doanh nghiệp (Intelligent Enterprise Search), trả lời chính xác câu hỏi tự nhiên bằng cách quét qua SharePoint, Confluence, Salesforce và S3.

### 8.2. Nền Tảng Học Máy Chuyên Sâu
- **Amazon SageMaker**: Nền tảng học máy toàn diện khép kín dành cho Data Scientists và ML Engineers: từ gán nhãn dữ liệu (Ground Truth), dựng Notebook, huấn luyện mô hình phân tán trên cụm GPU đến triển khai API suy luận (Endpoints) tự động co giãn.

---

## 9. NHÓM 9: MIGRATION & DISASTER RECOVERY

### 9.1. AWS Database Migration Service (DMS) & AWS SCT
- **AWS DMS**: Dịch vụ di chuyển cơ sở dữ liệu với thời gian gián đoạn tối thiểu (Zero downtime), hỗ trợ cả cùng loại (Homogeneous) lẫn khác loại (Heterogeneous) và duy trì đồng bộ liên tục qua **Change Data Capture (CDC)**.
- **AWS SCT (Schema Conversion Tool)**: Công cụ cài đặt trên máy tính giúp đọc và tự động chuyển đổi cấu trúc bảng, Stored Procedures, Triggers, Views từ hệ quản trị nguồn (Oracle, SQL Server) sang cú pháp tương đương trên AWS (Aurora PostgreSQL/MySQL).

### 9.2. AWS Application Migration Service (AWS MGN)
- **Bản chất**: Dịch vụ chuẩn mực của AWS cho chiến lược di chuyển máy chủ nguyên trạng (**Lift-and-Shift / Rehost**).
- **Cơ chế**: Cài AWS Replication Agent lên máy chủ vật lý, máy ảo VMware/Hyper-V hoặc cloud khác; agent sao chép từng khối đĩa (Block-level) liên tục qua cổng TCP 1500 về Staging Area trên AWS; cho phép chạy thử nghiệm độc lập trước khi Cutover chính thức.

### 9.3. AWS Elastic Disaster Recovery (AWS DRS)
- **Bản chất**: Dịch vụ phục hồi thảm họa tự động (Disaster Recovery) thế hệ mới của AWS.
- **Cơ chế**: Sử dụng công nghệ sao chép mức khối đĩa liên tục vào vùng đệm Staging Area giá rẻ tại Region thứ hai, đảm bảo chỉ số mất mát dữ liệu **RPO tính bằng giây** và thời gian phục hồi dịch vụ **RTO tính bằng phút** khi Region chính gặp sự cố.

### 9.4. AWS Backup
- **Bản chất**: Dịch vụ quản lý và tự động hóa chính sách sao lưu tập trung cấp độ doanh nghiệp.
- **Tính năng độc quyền**: **AWS Backup Vault Lock (Compliance Mode)** biến toàn bộ các bản sao lưu trong kho thành dạng bất biến (**WORM**), ngăn chặn hoàn toàn việc tin tặc mã hóa ransomware hoặc tài khoản root cố tình xóa dữ liệu dự phòng.

### 9.5. AWS Snow Family
- **AWS Snowcone**: Thiết bị nhỏ gọn nhẹ 2.1 kg (8 TB hoặc 14 TB SSD) cho môi trường khắc nghiệt không mạng.
- **AWS Snowball Edge Storage Optimized**: Thiết bị lưu trữ vật lý 80 TB HDD, bảo mật phần cứng chống va đập, chuyên dùng để vận chuyển dữ liệu lớn từ 10 TB đến vài trăm TB khi đường truyền mạng quá chậm.
- **AWS Snowmobile**: Xe container kéo 45 feet chứa hệ thống lưu trữ dung lượng **100 Petabyte (PB)**, chuyên dùng để di chuyển toàn bộ Data Center quy mô khổng lồ.

---

## 10. NHÓM 10: MANAGEMENT, GOVERNANCE & COST

### 10.1. Giám Sát, Nhật Ký & Vận Hành
- **Amazon CloudWatch**: Nền tảng giám sát hiệu năng và nhật ký vận hành:
  - **Metrics**: Thu thập thông số phần cứng (CPU, Network, Disk).
  - **Logs**: Gom nhật ký ứng dụng tập trung từ EC2, Lambda, EKS qua CloudWatch Agent.
  - **Alarms**: Kích hoạt cảnh báo SNS hoặc gọi lệnh Auto Scaling khi thông số vượt ngưỡng.
- **AWS CloudTrail**: Nhật ký kiểm toán mọi hành động gọi lệnh API trên tài khoản AWS: *"Ai đã làm gì, lúc nào, từ IP nào, qua dịch vụ gì?"*.
- **AWS Config**: Dịch vụ ghi lại lịch sử thay đổi cấu hình tài nguyên và đánh giá mức độ tuân thủ liên tục theo quy tắc (**Compliance Rules**); tự động kích hoạt **SSM Automation** để sửa chữa vi phạm (Auto-Remediation).
- **AWS Systems Manager (SSM)**: Bộ công cụ quản trị máy chủ từ xa:
  - **Session Manager**: Truy cập Shell/PowerShell an toàn vào máy ảo EC2 không cần mở cổng SSH 22, không cần Bastion Host hay Public IP.
  - **Run Command**: Chạy lệnh script đồng loạt trên hàng trăm máy chủ.
  - **Patch Manager**: Tự động hóa lịch quét và vá lỗi bảo mật hệ điều hành.

### 10.2. Triển Khai Hạ Tầng Dưới Dạng Mã Nguồn (IaC) & Nền Tảng
- **AWS CloudFormation**: Dịch vụ tự động hóa cấp phát tài nguyên đám mây thông qua tệp tin mẫu (Templates JSON/YAML). Tính năng **StackSets** cho phép nhân bản một cấu hình hạ tầng ra **nhiều tài khoản AWS và nhiều Region** chỉ bằng 1 thao tác duy nhất.
- **AWS Elastic Beanstalk**: Nền tảng PaaS giúp lập trình viên triển khai ứng dụng web nhanh chóng mà không cần thiết kế chi tiết VPC/ASG, nhưng vẫn toàn quyền SSH vào hệ điều hành EC2 bên dưới để tùy biến.

### 10.3. Tối Ưu Hóa Chi Phí & Ngân Sách
- **AWS Cost Explorer**: Bảng điều khiển phân tích lịch sử chi phí trong 12 tháng qua và dự báo xu hướng chi tiêu trong 12 tháng tới; đưa ra khuyến nghị mua Savings Plans.
- **AWS Budgets**: Thiết lập ngân sách tài chính tùy biến, gửi cảnh báo khi chi phí thực tế hoặc dự phóng vượt ngưỡng; có khả năng kích hoạt **Budget Actions** (tự động gắn IAM Deny policy hoặc dừng máy EC2).
- **AWS Compute Optimizer**: Ứng dụng Machine Learning phân tích lịch sử hiệu năng 14 ngày của EC2, EBS, Lambda, ASG để đưa ra khuyến nghị điều chỉnh kích cỡ (**Right-sizing**) hoặc đổi sang chip **AWS Graviton** tiết kiệm chi phí.
- **AWS Trusted Advisor**: Cố vấn đám mây tự động quét tài khoản và chấm điểm theo 5 trụ cột: **Cost Optimization, Performance, Security, Fault Tolerance, Service Limits**.

