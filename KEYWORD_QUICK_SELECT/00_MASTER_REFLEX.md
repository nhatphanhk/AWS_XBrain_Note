# ⚡ 00 — MASTER REFLEX TABLE: Từ Khóa → Đáp Án Chuẩn (< 60 Giây)

> **Cách dùng**: Ctrl+F từ khóa trong đề → Đọc ✅ CHỌN → Đọc 💡 VÌ SAO để khắc sâu → Tránh ❌ BẪY

---

## 🔴 NHÓM 1: COMPUTE & SERVERLESS

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"without opening SSH port 22"** / "no Bastion Host" | **SSM Session Manager** | SSM dùng TLS qua AWS API — không cần mở bất kỳ inbound port nào. Bastion Host = phải mở port 22 public → đề bài đã loại. | ~~Bastion Host~~ |
| **"HPC / MPI / NCCL inter-node latency"** | **EFA** + Cluster Placement Group | EFA có tính năng **OS-bypass**: ứng dụng nói chuyện thẳng với card mạng, bỏ qua kernel Linux → độ trễ microsecond cho MPI. ENA không có OS-bypass nên MPI không chạy được. | ~~ENA~~ |
| **"Cluster Placement Group — Insufficient capacity error"** | **Stop ALL → Start ALL cùng lúc** | Rack hiện tại hết chỗ. Stop toàn bộ → AWS tìm rack mới đủ chỗ cho cả cụm → Start cùng lúc = cấp phát thành công trên rack mới. | ~~Terminate~~ ~~thêm instance~~ |
| **"lowest network latency between instances"** | **Cluster Placement Group** | Cluster = cùng rack vật lý, 1 AZ → 100 Gbps, < 1ms. Muốn tốc độ → gom vào 1 chỗ. | ~~Spread~~ ~~Partition~~ |
| **"critical instances, max fault tolerance, different racks"** | **Spread Placement Group** (≤ 7/AZ) | Spread = mỗi instance 1 rack riêng (nguồn điện + switch riêng) → rack hỏng chỉ mất 1 instance. | ~~Cluster~~ (rack hỏng = mất tất) |
| **"HDFS / Kafka / Cassandra topology-aware"** | **Partition Placement Group** | Partition = nhóm rack theo partition; app biết mình ở partition nào → tránh mất cả replica group khi 1 rack hỏng. | ~~Cluster~~ ~~Spread~~ |
| **"event-driven, < 15 min, pay per execution"** | **AWS Lambda** | Lambda = FaaS, chỉ tính tiền khi chạy, scale về 0 khi không có request. EC2 = tiền máy chạy 24/7. | ~~EC2 On-Demand~~ |
| **"container, no manage server/OS"** | **ECS Fargate** | Fargate = serverless container. AWS quản lý EC2 host bên dưới, bạn chỉ định nghĩa vCPU + RAM cần dùng. | ~~EC2 + Docker tự cài~~ |
| **"short task, batch, fault-tolerant, cheapest"** | **EC2 Spot Instances** | Spot = dùng capacity nhàn rỗi của AWS, giảm 90%. Bị thu hồi khi AWS cần lại (cảnh báo 2 phút). Chỉ dùng cho app chịu ngắt được. | ~~On-Demand~~ |
| **"license per socket/core (SQL Server, Oracle BYOL)"** | **Dedicated Hosts** | BYOL license tính theo số socket/core vật lý. Dedicated Host = thuê cả máy vật lý → bạn kiểm soát socket placement. Dedicated Instance chỉ cô lập tenant, không control được socket. | ~~Dedicated Instances~~ |
| **"capacity reservation for peak event (Black Friday)"** | **On-Demand Capacity Reservations** | Savings Plans/RI không đảm bảo capacity — chỉ giảm giá. Capacity Reservation = đặt chỗ trước ở AZ cụ thể, trả tiền dù dùng hay không. | ~~Savings Plans~~ |
| **"App needs warm RAM state, restart in seconds"** | **EC2 Hibernate** | Hibernate = dump RAM xuống EBS → khởi động lại tải RAM lên, app tiếp tục ngay. Stop bình thường = RAM xóa sạch, OS phải boot lại từ đầu (1-3 phút). | ~~Stop/Start thường~~ |
| **"schedule start/stop Dev/Test EC2 fleet"** | **AWS Instance Scheduler** | Instance Scheduler = Lambda + EventBridge, gắn tag `Schedule=office-hours` vào EC2/RDS → auto stop/start. Tiết kiệm 70% (tắt ban đêm + cuối tuần). | ~~thủ công~~ |
| **"HPC batch jobs, unlimited runtime"** | **AWS Batch** | Lambda max 15 phút. Batch không giới hạn runtime → chạy job tính toán hàng giờ, hàng ngày. Batch orchestrate EC2/Fargate Spot. | ~~Lambda~~ |
| **"Lift-and-Shift server migration, minimal downtime"** | **AWS MGN** (Application Migration Service) | MGN = copy block-level liên tục (TCP 1500) từ server on-prem về Staging Area EC2. Khi sẵn sàng → Cutover trong vài phút. DMS chỉ cho database. | ~~DMS~~ ~~SMS~~ |

---

## 🔵 NHÓM 2: STORAGE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"without changing app code" + NFS/POSIX/Linux** | **Amazon EFS** | EFS mount như ổ NFS thông thường — Linux app đọc/ghi như file hệ thống cục bộ, không cần sửa 1 dòng code. S3 phải gọi API (`PutObject`, `GetObject`). | ~~S3 API~~ ~~DynamoDB~~ |
| **"without changing app code" + SMB/Windows/AD** | **FSx for Windows File Server** | FSx for Windows = SMB native, tích hợp Active Directory, hỗ trợ NTFS ACLs. EFS chỉ NFS (Linux). App Windows dùng `\\server\share` vẫn hoạt động ngay. | ~~EFS~~ |
| **"HPC, ML training, POSIX parallel FS, S3-linked"** | **FSx for Lustre** | Lustre = parallel file system cực nhanh, gắn thẳng vào S3 bucket (tự động sync dữ liệu). Training job đọc dữ liệu song song từ hàng trăm node. | ~~EFS~~ ~~EBS~~ |
| **"on-premise NFS/SMB → S3/EFS sync, periodic"** | **AWS DataSync** | DataSync = agent cài on-prem, chạy task đồng bộ theo lịch, nhanh hơn rsync 10 lần, có kiểm tra checksum toàn vẹn. Đây là công cụ **di chuyển / đồng bộ định kỳ**. | ~~Storage Gateway~~ |
| **"on-premise apps need local cache + cloud backup"** | **Storage Gateway** | Storage Gateway = **cầu nối liên tục**: app on-prem vẫn dùng NFS/SMB/iSCSI như bình thường, dữ liệu được tự động đẩy lên S3/Glacier phía sau. DataSync không cung cấp local cache. | ~~DataSync~~ |
| **"decommission tape libraries / VTL backup"** | **Storage Gateway — Tape Gateway (VTL)** | VTL = giả lập băng từ ảo cho phần mềm backup (Veeam, Backup Exec) qua giao thức iSCSI. Phần mềm backup không cần thay đổi, băng ảo lưu lên S3/Glacier. | ~~S3 File Gateway~~ |
| **"on-prem volume: data mostly on-prem, async snapshot"** | **Volume Gateway — Stored Volumes** | "Stored" = data **ở tại chỗ** (on-prem), snapshot async lên S3 như backup. Truy cập data = nhanh (local disk). | ~~Cached Volumes~~ |
| **"on-prem volume: data mostly on S3, local cache"** | **Volume Gateway — Cached Volumes** | "Cached" = data chính **trên cloud** (S3), chỉ cache phần hay dùng tại chỗ. Tiết kiệm local storage. | ~~Stored Volumes~~ |
| **"external partners upload via SFTP to S3"** | **AWS Transfer Family** | Transfer Family = tạo SFTP/FTPS/FTP endpoint public cho partner kết nối vào, file đẩy thẳng vào S3/EFS. Partner không cần biết về AWS. DataSync không có SFTP endpoint. | ~~DataSync~~ |
| **"50–100 TB migrate, slow internet (< 100 Mbps)"** | **Snowball Edge Storage Optimized** | 50 TB qua 10 Mbps = 462 ngày. Snowball = gửi thiết bị vật lý 80 TB, AWS copy data vào S3. Nhanh hơn internet nghìn lần khi data lớn + mạng chậm. | ~~DataSync qua mạng~~ |
| **"PB-scale data center migration"** | **AWS Snowmobile** | Snowmobile = container 45 feet chứa 100 PB, xe tải chở đến data center. Chỉ dùng khi > 10 PB (Snowball tối đa 80 TB/thiết bị). | ~~Snowball~~ |
| **"single-digit ms S3 latency, ML/AI training, 1 AZ"** | **S3 Express One Zone (Directory Bucket)** | Express One Zone nhanh gấp 10 lần S3 Standard (single-digit ms vs 100-200 ms). Lưu trong 1 AZ → chấp nhận rủi ro mất AZ để đổi lấy tốc độ cực cao cho ML workload. | ~~S3 Standard~~ |
| **"mount S3 as Linux file system, high read throughput"** | **Mountpoint for Amazon S3** | Mountpoint = chuyển đổi lệnh file local (`read()`, `open()`) sang S3 REST API. Không cần viết code S3 SDK. Chỉ hỗ trợ sequential read tốt; nếu cần POSIX locking → FSx for Lustre. | ~~FSx for Lustre~~ |
| **"millions IOPS, microsecond, ephemeral, temp storage"** | **EC2 Instance Store** | Instance Store = NVMe SSD gắn vật lý vào mainboard server → không qua mạng → microsecond. Nhưng mất sạch khi stop/terminate. Dùng cho scratch disk, temp buffer. | ~~EBS~~ |
| **"high IOPS, persistent, attach to 1 EC2"** | **EBS io2 Block Express** | io2 Block Express = 256,000 IOPS, 99.999% durability, persistent (sống qua stop/terminate). Instance Store mất data khi tắt máy. | ~~Instance Store~~ |
| **"shared block storage, same AZ, 16 EC2 instances"** | **EBS io2 Multi-Attach** | io2 Multi-Attach = gắn 1 EBS volume vào tối đa 16 EC2 cùng AZ. EFS là file storage (NFS), không phải block storage. | ~~EFS~~ |
| **"automate EBS snapshot lifecycle / compliance"** | **Amazon Data Lifecycle Manager (DLM)** | DLM = AWS native, định nghĩa policy (snapshot mỗi 12h, giữ 7 bản). Không cần tự viết Lambda + cron + IAM role. | ~~Lambda cron script~~ |
| **"file < 30 ngày, cheapest S3"** | **S3 Standard** | Standard-IA phạt tính đủ **30 ngày minimum storage** dù file bị xóa sớm hơn + thêm phí retrieval. File ngắn hạn < 30 ngày: Standard rẻ hơn! | ~~S3 Standard-IA~~ |
| **"unpredictable access pattern, auto-tier S3"** | **S3 Intelligent-Tiering** | I-T tự động chuyển tầng (Frequent → Infrequent → Archive) **không tính phí retrieval**. Dùng khi không biết trước data sẽ được truy cập bao nhiêu lần. | ~~Standard-IA~~ |
| **"rarely access, millisecond retrieval, 1/quarter"** | **S3 Glacier Instant Retrieval** | "Instant" = lấy về **ngay trong ms** như Standard-IA nhưng rẻ hơn. Truy cập 1 lần/quý. Glacier Flexible phải chờ hàng giờ. | ~~Glacier Flexible~~ |
| **"compliance 7-10 years, cheapest, wait 12-48h OK"** | **S3 Glacier Deep Archive** | Deep Archive = rẻ nhất thế giới (< $1/TB/tháng). Đánh đổi: lấy data mất 12-48 giờ. Phù hợp dữ liệu tuân thủ pháp lý ít khi cần xem lại. | ~~Glacier Flexible~~ |
| **"WORM object, nobody deletes even root"** | **S3 Object Lock — Compliance Mode** | Compliance = không AI xóa được kể cả Root AWS. Governance = admin có quyền IAM đặc biệt vẫn bypass được → không đủ mạnh cho ransomware scenario. | ~~Governance Mode~~ |
| **"protect backups from ransomware / root"** | **AWS Backup Vault Lock — Compliance Mode** | Sau cooling-off period (1-72h), Vault Lock Compliance = bất biến vĩnh viễn. Dù hacker chiếm root cũng không xóa được backup. | ~~Governance Mode~~ |

---

## 🟢 NHÓM 3: DATABASE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"microsecond DynamoDB reads, NO code change"** | **DynamoDB DAX** | DAX = cluster cache đứng trước DynamoDB, **thay thế endpoint** (cùng API). App chỉ đổi connection string, không sửa logic. ElastiCache = API khác hẳn, phải viết thêm code kiểm tra cache. | ~~ElastiCache~~ |
| **"multi-region active-active read AND write"** | **DynamoDB Global Tables** | Global Tables = **tất cả region đều nhận WRITE**, xung đột giải quyết bằng last-writer-wins. Aurora Global = chỉ 1 region write (Primary), các region khác read-only. | ~~Aurora Global~~ |
| **"recover DynamoDB to specific second"** | **DynamoDB PITR** | PITR = continuous backup, khôi phục về **bất kỳ giây nào** trong 35 ngày qua. On-Demand Backup = chụp snapshot tại thời điểm cụ thể → chỉ restore về đúng thời điểm đó. | ~~On-Demand Backup~~ |
| **"zero downtime RDS storage growth"** | **RDS Storage Auto Scaling** | Storage Auto Scaling tự mở rộng khi free space ≤ 10%, không cần reboot. Resize thủ công từ snapshot = cần downtime. | ~~manual resize~~ |
| **"rotate DB password automatically, no app restart"** | **Secrets Manager + Lambda Rotation** | Secrets Manager dùng cơ chế 2 nhãn (AWSCURRENT + AWSPENDING): cập nhật mật khẩu ở DB trước, app vẫn dùng CURRENT, sau đó chuyển nhãn sang CURRENT mới → zero downtime. | ~~SSM Parameter Store~~ |
| **"RDS HA, standby readable, fast failover ~35s"** | **RDS Multi-AZ DB Cluster** | DB Cluster = 1 Writer + **2 Readable Standbys** ở 2 AZ khác nhau. Failover ~35s, và bạn có thể đọc từ standbys. DB Instance = 1 standby thụ động (không đọc được), failover ~60-120s. | ~~Multi-AZ DB Instance~~ |
| **"scale read traffic, async replicas"** | **RDS Read Replicas** | Read Replicas = async replication, chuyên dùng để scale đọc. Multi-AZ = sync, chuyên HA/failover, standby không nhận đọc (trừ DB Cluster). | ~~Multi-AZ~~ |
| **"Oracle / SQL Server → Aurora migration"** | **AWS SCT + AWS DMS** | Khác engine → phải chuyển đổi schema. SCT = Schema Conversion Tool (convert stored procedures, PL/SQL → PL/pgSQL). DMS = copy data với CDC. DMS đơn thuần không convert được PL/SQL. | ~~DMS only~~ |
| **"Cassandra migration, no cluster management, CQL"** | **Amazon Keyspaces** | Keyspaces = Cassandra serverless của AWS, **100% CQL API compatible** → app Cassandra không cần sửa code. DynamoDB = API khác hoàn toàn. | ~~DynamoDB~~ |
| **"immutable cryptographic ledger, accounting"** | **Amazon QLDB** | QLDB = sổ cái trung tâm bất biến, dùng Merkle Tree SHA-256 để chứng minh dữ liệu không bị sửa. Managed Blockchain = phi tập trung (nhiều bên), không phải centralized ledger. | ~~Managed Blockchain~~ |
| **"social network / fraud detection / graph queries"** | **Amazon Neptune** | Neptune = graph DB (Gremlin/openCypher), tối ưu cho "ai quen ai", "path từ A đến B qua mấy bước". DynamoDB lưu được graph nhưng deep traversal cực chậm (N+1 queries). | ~~DynamoDB~~ |
| **"IoT time-series, sensor telemetry billions/sec"** | **Amazon Timestream** | Timestream = time-series DB chuyên dụng, tự động phân tầng (In-Memory → Magnetic), tối ưu cho câu truy vấn theo khoảng thời gian. RDS/DynamoDB không có time-series optimization. | ~~RDS~~ ~~DynamoDB~~ |
| **"ElastiCache session store, pub/sub, complex DS"** | **Redis** | Redis = multi-data-structure (sorted sets, lists, hashes), pub/sub, persistent (snapshot + AOF), read replicas. Memcached = chỉ key-value đơn giản, không persistent. | ~~Memcached~~ |
| **"ElastiCache simple caching, multi-thread scale-out"** | **Memcached** | Memcached = multi-threaded → tận dụng nhiều CPU core, horizontal scale dễ. Redis single-threaded core. Nếu chỉ cần cache đơn giản và nhiều thread → Memcached. | ~~Redis~~ |

---

## 🟡 NHÓM 4: NETWORK & CDN

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"static Anycast IP, bypass DNS cache, TCP/UDP"** | **AWS Global Accelerator** | Global Accelerator = 2 IP tĩnh Anycast, lưu lượng đi vào **mạng riêng AWS ngay tại edge gần nhất**, bypass hoàn toàn DNS caching của client/ISP. CloudFront dùng DNS → phụ thuộc TTL cache. | ~~CloudFront~~ |
| **"CDN cache static/dynamic content HTTP/HTTPS"** | **Amazon CloudFront** | CloudFront = CDN Layer 7, cache tại 450+ Edge Locations, tích hợp WAF + Shield + Lambda@Edge. Global Accelerator không cache gì cả. | ~~Global Accelerator~~ |
| **"overlapping CIDR VPCs need to connect"** | **AWS PrivateLink** | VPC Peering và Transit Gateway **không hoạt động** khi CIDR trùng lặp. PrivateLink dùng NLB làm backend → không cần biết IP của VPC kia. | ~~VPC Peering~~ ~~TGW~~ |
| **"connect 100s VPCs centrally (hub-and-spoke)"** | **Transit Gateway** | TGW = router trung tâm, 1 attachment/VPC, kết nối N VPC chỉ cần N attachment. VPC Peering = N×(N-1)/2 connections → quản lý phức tạp theo cấp số nhân. | ~~VPC Peering~~ |
| **"third-party firewall (Palo Alto, Fortinet) inline"** | **Gateway Load Balancer (GWLB)** | GWLB dùng giao thức GENEVE (port 6081) để "bọc" gói tin, chuyển cho appliance kiểm tra, trả về, rồi mới forward đến đích. Transparent với ứng dụng. | ~~ALB~~ ~~NLB~~ |
| **"real-time 2-way push (chat, dashboard)"** | **API Gateway WebSocket API** | WebSocket = kết nối persistent 2 chiều. Server có thể chủ động push data xuống client bất kỳ lúc nào. REST API = client phải hỏi, server mới trả lời. | ~~REST API~~ |
| **"route by user geography (continent/country)"** | **Route 53 Geolocation** | Geolocation = dựa trên **vị trí người dùng**. Người dùng Việt Nam → endpoint Việt Nam. Không có tham số "bias". | ~~Geoproximity~~ |
| **"shift traffic % from resource with bias dial"** | **Route 53 Geoproximity** | Geoproximity có **Routing Bias (-99 → +99)** để mở rộng hoặc thu hẹp vùng phục vụ của 1 endpoint. Geolocation không có bias. | ~~Geolocation~~ |
| **"Zone Apex (example.com) → AWS resource"** | **Route 53 Alias Record** | CNAME không thể dùng cho naked domain (example.com). Alias = tính năng độc quyền Route 53, trỏ thẳng vào ALB/CloudFront/S3 website, **miễn phí query**. | ~~CNAME~~ |
| **"hybrid DNS on-prem ↔ VPC bidirectional"** | **Route 53 Resolver Inbound + Outbound Endpoints** | Inbound = on-prem query → VPC DNS. Outbound + Forwarding Rules = VPC query → on-prem DNS. **Cần CẢ HAI** cho bidirectional. Chỉ 1 endpoint = 1 chiều. | ~~chỉ 1 endpoint~~ |
| **"private connection S3/DynamoDB, no NAT, free"** | **Gateway VPC Endpoint** | Gateway Endpoint = thêm route vào Route Table, **miễn phí hoàn toàn**, traffic không ra internet. Chỉ hỗ trợ S3 và DynamoDB. | ~~Interface Endpoint~~ |
| **"private connection to any AWS service via ENI"** | **Interface VPC Endpoint (PrivateLink)** | Interface Endpoint = tạo ENI có IP riêng trong subnet → traffic hoàn toàn trong VPC. Hỗ trợ 100+ dịch vụ AWS. Tính phí theo giờ + data. | ~~Gateway Endpoint~~ |
| **"copy raw network packets, IDS, deep packet inspection"** | **VPC Traffic Mirroring** | Traffic Mirroring = sao chép **toàn bộ gói tin thực tế** (payload) từ ENI → gửi đến appliance IDS/DPI. VPC Flow Logs chỉ ghi metadata (src IP, dst IP, port, bytes) — không có payload. | ~~VPC Flow Logs~~ |

---

## 🟠 NHÓM 5: SECURITY & IDENTITY

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"detect brute-force, compromised credentials, mining"** | **Amazon GuardDuty** | GuardDuty = phân tích **log thời gian thực** (CloudTrail, VPC Flow, DNS) bằng ML để phát hiện hành vi bất thường đang xảy ra (runtime threat). Inspector chỉ quét software tĩnh. | ~~Inspector~~ ~~Macie~~ |
| **"scan CVE vulnerabilities EC2/Lambda/ECR"** | **Amazon Inspector** | Inspector = agent-based, quét danh sách CVE đã biết trong OS packages và code libraries. Không phát hiện được tấn công đang xảy ra. | ~~GuardDuty~~ ~~Macie~~ |
| **"discover PII / sensitive data in S3"** | **Amazon Macie** | Macie = dùng ML để **phân loại và tìm dữ liệu nhạy cảm** (tên, số CMND, số thẻ tín dụng) lưu trong S3. GuardDuty không nhìn vào nội dung file S3. | ~~GuardDuty~~ ~~Inspector~~ |
| **"investigate root cause after security alert (graph)"** | **Amazon Detective** | Detective = **điều tra sau sự kiện**. Nhận findings từ GuardDuty → vẽ đồ thị trực quan (entity relationship graph) để trả lời "ai đã làm gì, từ đâu, khi nào". GuardDuty phát hiện, Detective điều tra. | ~~GuardDuty~~ |
| **"centralized security posture, CIS benchmark score"** | **AWS Security Hub** | Security Hub = **tổng hợp findings** từ GuardDuty + Inspector + Macie + Config + nhiều partner → tính điểm tuân thủ CIS/PCI-DSS. Config đơn lẻ không tính CIS score. | ~~AWS Config alone~~ |
| **"download SOC/ISO/PCI compliance reports, sign BAA"** | **AWS Artifact** | Artifact = **cổng tải tài liệu kiểm toán** của AWS (không phải của bạn). Dùng để show auditor "AWS đã được chứng nhận ISO 27001". Audit Manager = thu thập evidence của tài nguyên bạn tạo. | ~~Audit Manager~~ |
| **"block org-wide, override all admins/root members"** | **SCP (Service Control Policies)** | SCP = "bức tường tối thượng" ở cấp Account/OU. Deny trong SCP phủ quyết cả IAM Admin + Root của member account. Permission Boundary chỉ áp dụng cho 1 User/Role cụ thể. | ~~Permission Boundaries~~ |
| **"limit max permissions for a specific IAM role/user"** | **IAM Permission Boundaries** | Permission Boundary = "trần quyền" của 1 entity. Quyền thực tế = giao thoa(Identity Policy, Permission Boundary). Ngăn Developer tự cấp quyền Admin cho bản thân. | ~~SCP~~ |
| **"login to RDS MySQL without static password, SSL"** | **IAM Database Authentication** | Dùng STS sinh token 15 phút thay mật khẩu tĩnh. Kết nối bắt buộc SSL. Không lộ mật khẩu, hết hạn tự động. Secrets Manager vẫn lưu password truyền thống. | ~~Secrets Manager~~ |
| **"store secrets, auto-rotate, RDS integration"** | **AWS Secrets Manager** | Secrets Manager = $0.40/secret/month nhưng có **Lambda rotation function tích hợp sẵn**, rotation zero-downtime với cơ chế 2-label (AWSCURRENT/AWSPENDING). Parameter Store không tự rotate. | ~~SSM Parameter Store~~ |
| **"store config/non-secret params, free tier"** | **SSM Parameter Store Standard** | Parameter Store = **miễn phí** cho Standard tier. Lưu config string, feature flags, database URLs không nhạy cảm. Tốn tiền Secrets Manager cho dữ liệu không cần rotation là lãng phí. | ~~Secrets Manager~~ |
| **"continuous compliance check, auto-remediation"** | **AWS Config** + SSM Automation | Config = theo dõi trạng thái tài nguyên liên tục, so sánh với rules (managed hoặc custom), tự động trigger SSM Automation để sửa vi phạm. CloudTrail chỉ ghi log API, không remediate. | ~~CloudTrail~~ |
| **"User auth (login), token for app"** | **Cognito User Pools** | User Pools = **directory người dùng** của bạn (sign-up, login, MFA, forgot password). Trả về JWT token cho app. Identity Pools = đổi token lấy AWS credentials để gọi S3/DynamoDB. | ~~Identity Pools~~ |
| **"federated access to AWS resources (Google/FB/SAML)"** | **Cognito Identity Pools** | Identity Pools = **liên kết danh tính bên ngoài** (Google, Facebook, SAML, Cognito User Pool) → đổi lấy temporary AWS IAM credentials (STS). | ~~User Pools~~ |

---

## 🔵 NHÓM 6: MESSAGING & DECOUPLING

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"decouple tiers, at-least-once, unlimited throughput"** | **SQS Standard** | Standard = throughput không giới hạn, phân phối at-least-once (có thể duplicate → app phải idempotent). Dùng để buffer spike giữa các tier. | ~~SQS FIFO~~ |
| **"strict order + exactly-once processing"** | **SQS FIFO** | FIFO dùng `MessageGroupId` (nhóm thứ tự) + `MessageDeduplicationId` (chống trùng). Max 3,000 msg/s với batching. Khi thứ tự quan trọng (bank transaction, order states). | ~~SQS Standard~~ |
| **"poison pill stuck in Kinesis/DynamoDB Streams"** | **BisectBatchOnFunctionError = true** | Khi Lambda xử lý batch lỗi, thay vì retry cả batch → chia đôi, cô lập record lỗi. Kết hợp với DLQ để lưu record độc hại ra ngoài, giải phóng shard. | ~~tăng batch size~~ |
| **"fan-out: 1 message → multiple SQS queues"** | **SNS → multiple SQS** (SNS Fanout) | SNS pub/sub: 1 publish → nhiều subscriber nhận đồng thời. Mỗi SQS queue xử lý độc lập (ví dụ: 1 queue gửi email, 1 queue cập nhật DB, 1 queue log analytics). | ~~SQS alone~~ |
| **"schedule events, trigger Lambda at specific time"** | **EventBridge Scheduler** | EventBridge Scheduler = cron job managed, chính xác đến giây, hỗ trợ timezone, flexible time window để tránh spike. Không cần duy trì server hay Lambda cron. | ~~SQS~~ ~~SNS~~ |
| **"real-time event from SaaS (Salesforce, Zendesk)"** | **Amazon EventBridge** | EventBridge có **SaaS Partner Event Bus** — SaaS gửi event trực tiếp vào EventBridge, bạn filter và route. AppFlow = kéo data theo batch, không phải event real-time. | ~~SNS~~ ~~AppFlow~~ |
| **"bulk/incremental SaaS data transfer to S3/Redshift"** | **Amazon AppFlow** | AppFlow = kéo **dữ liệu lớn** (hàng triệu records) từ Salesforce/ServiceNow → S3/Redshift theo lịch hoặc trigger. Không viết code, bảo mật qua PrivateLink. EventBridge không làm được bulk ETL. | ~~EventBridge~~ |
| **"migrate ActiveMQ/RabbitMQ, keep JMS/AMQP"** | **Amazon MQ** | MQ = managed broker hỗ trợ **JMS, AMQP, MQTT, STOMP** — app Java EE kết nối ngay không sửa code. SQS dùng SDK riêng, phải viết lại toàn bộ messaging code. | ~~SQS~~ |
| **"real-time stream ingestion, replay, 24h–365d retention"** | **Kinesis Data Streams** | Streams = **lưu và replay** data stream, consumer tự quản lý offset (shard iterator). Firehose = only-forward (giao hàng đến đích), không replay được. | ~~Kinesis Firehose~~ |
| **"auto-deliver stream to S3/Redshift/OpenSearch, serverless"** | **Kinesis Data Firehose** | Firehose = **serverless pipeline**, tự buffer và deliver vào S3/Redshift/OpenSearch/Splunk. Không cần viết consumer code. Streams cần tự viết consumer (KCL hoặc Lambda). | ~~Kinesis Streams~~ |
| **"long-running workflow, human approval step"** | **Step Functions Standard** | Standard = tối đa 1 năm, exactly-once, durable state machine. Hỗ trợ `.waitForTaskToken` để dừng workflow chờ người duyệt click nút. Express = max 5 phút, không hỗ trợ wait token lâu. | ~~Step Functions Express~~ |

---

## 🟣 NHÓM 7: ANALYTICS & AI

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"serverless SQL query on S3"** | **Amazon Athena** | Athena = không có cluster/server, trả tiền theo data scanned ($5/TB). Dùng Parquet/ORC + partitioning để giảm 70-90% chi phí. Redshift cần cluster (pre-provisioned). | ~~Redshift~~ |
| **"visual no-code data prep for business analysts"** | **AWS Glue DataBrew** | DataBrew = 250+ visual transform recipe, drag-drop, không cần biết PySpark. Chuyên cho business analyst. Glue ETL Jobs = code Python/Spark, dành cho engineer. | ~~Glue ETL Jobs~~ |
| **"centralized data catalog, fine-grained column/row access"** | **AWS Lake Formation** | Lake Formation = quản trị Data Lake, cấp quyền **cấp cột/dòng** (row/column-level) cho Athena, Redshift Spectrum, EMR — không copy data. IAM S3 chỉ control ở bucket/prefix. | ~~IAM S3 alone~~ |
| **"managed Hadoop/Spark, cheap spot task nodes"** | **Amazon EMR** | EMR = full Hadoop ecosystem control. Task Nodes (không lưu HDFS) = **Spot-safe**: bị terminate không mất data. Master + Core Nodes dùng On-Demand. | ~~Glue~~ |
| **"data warehouse, OLAP queries petabyte-scale"** | **Amazon Redshift** | Redshift = columnar storage, MPP (massively parallel), tối ưu cho GROUP BY, JOIN phức tạp trên hàng tỷ rows. RDS/Aurora = OLTP (nhiều transactions ngắn, không phải analytics). | ~~RDS Aurora~~ |
| **"extract text/tables/forms from scanned PDF (OCR)"** | **Amazon Textract** | Textract = ML-powered OCR, **hiểu cấu trúc** document (key-value pairs trong form, hàng/cột trong table). Comprehend = NLP (phân tích ý nghĩa text đã extract được). | ~~Comprehend~~ |
| **"NLP: sentiment, entity, language detection"** | **Amazon Comprehend** | Comprehend = Natural Language Processing: "câu này tích cực hay tiêu cực?", "tên người/địa điểm trong text này là gì?". Textract = đọc text từ ảnh/PDF (không hiểu nghĩa). | ~~Textract~~ |
| **"full-text search, log analytics, Kibana dashboard"** | **Amazon OpenSearch Service** | OpenSearch = ElasticSearch managed. Full-text search (fuzzy, autocomplete), log analytics với Kibana/OpenSearch Dashboard. Athena không có full-text search. | ~~Athena~~ |

---

## ⚫ NHÓM 8: MIGRATION & DISASTER RECOVERY

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"heterogeneous DB migration (Oracle → Aurora)"** | **AWS SCT + AWS DMS** | Khác engine = schema khác. SCT convert stored procedures/triggers từ PL/SQL sang PL/pgSQL. DMS copy data với CDC. DMS đơn thuần không convert được PL/SQL logic. | ~~DMS only~~ |
| **"CDC zero-downtime cutover"** | **AWS DMS** (CDC mode) | DMS chạy full load ban đầu, sau đó **capture changes** (insert/update/delete) liên tục cho đến khi cutover. Downtime = chỉ vài giây lúc switch connection string. | ~~dump/restore~~ |
| **"DR: cheapest, RPO hours, RTO 24h+"** | **Backup & Restore** | Chỉ có snapshot/backup. Không có gì chạy ở region phụ. Rẻ nhất nhưng khôi phục lâu nhất (phải restore từ S3, launch EC2, cấu hình lại). | ~~Pilot Light~~ |
| **"DR: DB always running, EC2 = 0, scale up on failover"** | **Pilot Light** | "Pilot Light" = chỉ có ngọn lửa nhỏ (DB) đang cháy. EC2 = tắt hoàn toàn (chỉ có AMI + IaC). Khi failover: boot EC2 từ AMI → vài chục phút. | ~~Warm Standby~~ |
| **"DR: scaled-down fleet always running"** | **Warm Standby** | Warm Standby = cụm nhỏ luôn chạy (1 EC2 thay vì 10). Failover = scale up fleet → vài phút. Pilot Light không có EC2 nào chạy. | ~~Pilot Light~~ |
| **"DR: active-active, RPO≈0, RTO≈0, most expensive"** | **Multi-Region Multi-Active** | 100% capacity ở tất cả region, Global Tables + Global ALB. RPO/RTO gần như 0 vì không cần failover. Đắt nhất vì trả tiền double+ infrastructure. | ~~Warm Standby~~ |

---

## 💰 NHÓM 9: COST OPTIMIZATION

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"most flexible commitment, covers EC2+Fargate+Lambda"** | **Compute Savings Plans** | Compute SP = cam kết chi tiêu $/giờ, **không ràng buộc instance family, size, OS, region**. Áp dụng tự động cho EC2 + Fargate + Lambda. EC2 Instance SP = chỉ 1 family, 1 region. | ~~EC2 Instance Savings Plans~~ |
| **"right-sizing recommendation, ML-based"** | **AWS Compute Optimizer** | Compute Optimizer = phân tích 14 ngày CloudWatch metrics → gợi ý đổi sang instance type phù hợp hơn. Cost Explorer có right-sizing nhưng kém chi tiết hơn. | ~~Cost Explorer~~ |
| **"historical cost analysis + 12-month forecast"** | **AWS Cost Explorer** | Cost Explorer = dashboard 12 tháng lịch sử + dự báo 12 tháng tới, filter theo service/tag/account. Budgets = cảnh báo + hành động, không phân tích lịch sử. | ~~AWS Budgets~~ |
| **"alert when spend > threshold, auto-stop EC2"** | **AWS Budgets** + Budget Actions | Budgets = đặt ngưỡng → SNS alert khi gần vượt. Budget Actions = tự động attach IAM Policy hoặc stop EC2/RDS khi vượt ngưỡng thực sự. Cost Explorer không có hành động tự động. | ~~Cost Explorer~~ |
| **"capacity reservation included in purchase"** | **Zonal Reserved Instances** | Zonal RI = commit 1 instance type ở 1 AZ cụ thể → **AWS giữ slot cho bạn**. Compute Savings Plans không có capacity reservation → Black Friday có thể bị "sold out". | ~~Compute Savings Plans~~ |
| **"S3 file < 30 days, lowest cost"** | **S3 Standard** | Standard-IA phạt tiền **minimum 30-day storage** dù file bị xóa sớm hơn. File vòng đời ngắn hạn → Standard luôn rẻ hơn IA. | ~~S3 Standard-IA~~ |

---

## 🏗️ NHÓM 10: OPERATIONS & DEPLOYMENT

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"IaC: deploy same stack across multiple accounts/regions"** | **CloudFormation StackSets** | StackSets = deploy 1 template ra N accounts × M regions từ 1 chỗ, có rollback policy. Nested Stacks = chia nhỏ template trong 1 account. | ~~Nested Stacks~~ |
| **"PaaS deploy web app, zero-downtime, can SSH to EC2"** | **AWS Elastic Beanstalk** | Beanstalk = PaaS nhưng vẫn expose EC2 để bạn SSH, cài thêm phần mềm qua `.ebextensions`. ECS/Lambda = không SSH vào container. | ~~ECS~~ ~~Lambda~~ |
| **"EB zero-downtime, full capacity maintained during update"** | **Rolling with Additional Batch** | Thêm 1 batch EC2 mới → update rolling → xóa batch cũ. Capacity **không giảm** trong suốt quá trình. Rolling thường = capacity giảm tạm thời. | ~~Rolling~~ |
| **"EB fastest rollback"** | **Immutable** deployment | Immutable = deploy lên fleet mới hoàn toàn → swap DNS. Rollback = chỉ cần terminate fleet mới (không ảnh hưởng fleet cũ đang chạy). All-at-once rollback = redeploy lại từ đầu. | ~~All-at-once~~ |
| **"SSL cert expiry alert 30 days before"** | **ACM + EventBridge Rule + Lambda + SNS** | ACM phát ra event khi cert sắp hết hạn → EventBridge Rule lọc event → trigger Lambda → gửi SNS alert. ACM không có built-in SNS notification trực tiếp. | ~~ACM alone~~ |
| **"GraphQL API, real-time subscriptions, offline sync"** | **AWS AppSync** | AppSync = managed GraphQL, hỗ trợ WebSocket subscriptions cho real-time, offline sync cho mobile. API Gateway REST = không có GraphQL, không có offline sync. | ~~API Gateway REST~~ |
| **"send bulk/transactional email, DKIM/SPF"** | **Amazon SES** | SES = dedicated email sending service: DKIM/SPF signing, bounce handling, reputation management. SNS email = chỉ cho alert, không có deliverability controls. | ~~SNS~~ |
| **"5 pillars check, full access requires Business plan"** | **AWS Trusted Advisor** | Trusted Advisor checks: Cost, Performance, Security, Fault Tolerance, Service Limits. Free = 7 basic checks. Business/Enterprise = tất cả 500+ checks. Security Hub = aggregate security findings (khác). | ~~Security Hub~~ |
