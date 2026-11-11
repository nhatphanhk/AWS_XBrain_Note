# ⚡ 00 — MASTER REFLEX TABLE: Từ Khóa → Đáp Án Chuẩn (< 60 Giây)

> **Cách dùng**: Nhấn `Ctrl + F` tìm từ khóa trong đề bài $\rightarrow$ Đọc ✅ **CHỌN** $\rightarrow$ Đọc 💡 **VÌ SAO / MÓC NHỚ** để hiểu bản chất $\rightarrow$ Gạch bỏ ❌ **BẪY (DISTRACTORS)**.

---

## 🔴 NHÓM 1: COMPUTE & CONTAINERS

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"without opening SSH port 22"** / "no Bastion Host" | **SSM Session Manager** | Dùng TLS qua AWS API — không mở inbound port nào, log audit vào S3/CloudWatch. | ~~Bastion Host~~ (phải mở port 22) |
| **"HPC / MPI / NCCL inter-node latency"** | **EFA** + Cluster Placement Group | EFA có **OS-bypass** bỏ qua kernel Linux $\rightarrow$ độ trễ microsecond. ENA không có OS-bypass. | ~~ENA~~ |
| **"Cluster Placement Group — Insufficient capacity error"** | **Stop ALL → Start ALL cùng lúc** | Rack vật lý hết chỗ $\rightarrow$ Stop toàn bộ để AWS tìm rack mới đủ chỗ cho cả cụm. | ~~Terminate~~ ~~thêm từng instance~~ |
| **"lowest network latency between instances"** | **Cluster Placement Group** | Cluster = cùng 1 rack vật lý, 1 AZ $\rightarrow$ 100 Gbps, < 1ms. | ~~Spread~~ ~~Partition~~ |
| **"critical instances, max fault tolerance, different racks"** | **Spread Placement Group** (≤ 7/AZ) | Spread = mỗi instance 1 rack riêng biệt (nguồn điện + switch riêng). | ~~Cluster~~ |
| **"HDFS / Kafka / Cassandra topology-aware"** | **Partition Placement Group** | Partition = nhóm rack theo phân vùng, app biết rack để phân tán replica. | ~~Cluster~~ ~~Spread~~ |
| **"license per socket/core (SQL Server, Oracle BYOL)"** | **Dedicated Hosts** | Thuê cả máy vật lý, thấy socket/core/host ID $\rightarrow$ đáp ứng BYOL license. | ~~Dedicated Instances~~ |
| **"capacity reservation for peak event (Black Friday)"** | **On-Demand Capacity Reservations** | Giữ chỗ công suất ở 1 AZ cụ thể; Savings Plans không giữ chỗ máy. | ~~Savings Plans~~ |
| **"app needs warm RAM state, restart in seconds"** | **EC2 Hibernate** | RAM ghi xuống EBS root encrypted $\rightarrow$ bật lại giữ nguyên trạng thái RAM. | ~~Stop/Start thường~~ |
| **"schedule start/stop Dev/Test EC2 fleet"** | **AWS Instance Scheduler** | Lambda + EventBridge tắt máy ngoài giờ hành chính $\rightarrow$ cắt giảm 70% chi phí. | ~~Tắt thủ công~~ |
| **"data residency", "ultra-low latency on-premises"** | **AWS Outposts** | Rack phần cứng AWS đặt tại data center khách hàng, chạy EC2, RDS, EBS tại chỗ. | ~~Local Zones~~ ~~Wavelength~~ |
| **"single-digit ms latency for city users", "gaming/VDI"** | **AWS Local Zones** | Điểm mở rộng Region gần thành phố lớn, bật như 1 subnet của VPC. | ~~Outposts~~ ~~CloudFront~~ |
| **"mobile 5G application", "telecom carrier network"** | **AWS Wavelength** | Compute/storage nhúng trong mạng 5G của nhà mạng, traffic không rời 5G. | ~~Local Zones~~ ~~Outposts~~ |
| **"run containers on existing on-prem servers without AWS hardware"**| **ECS / EKS Anywhere** | Chạy container trên máy vật lý/VM có sẵn của mình, không cần rack phần cứng Outposts. | ~~AWS Outposts~~ |
| **"container app code access S3/DynamoDB"** | **ECS Task Role** | Gán quyền IAM cho code ứng dụng bên trong container. | ~~Task Execution Role~~ |
| **"container agent pull ECR image, write CloudWatch"** | **ECS Task Execution Role** | Gán quyền cho ECS Agent kéo image và ghi log. | ~~Task Role~~ |
| **"Kubernetes Pod needs AWS IAM permissions"** | **IRSA / EKS Pod Identity** | Cấp quyền IAM riêng cho từng Pod, không dùng chung Node worker role. | ~~EC2 Node Instance Role~~ |
| **"maintain average CPU at 50%", "target metric"** | **Target Tracking Scaling Policy** | Tự động tính toán số instance cần thêm/bớt để giữ metric ở mức mong muốn. | ~~Step Scaling~~ ~~Simple Scaling~~ |
| **"sudden traffic spike", "flash sale", "no cooldown"** | **Step Scaling Policy** | Phản ứng nhanh theo từng bước alarm, không bị kẹt cooldown giữa các bước. | ~~Simple Scaling~~ |
| **"script before instance enters service"** | **ASG Lifecycle Hook (`Pending:Wait`)** | Giữ instance ở trạng thái chờ để chạy script cài đặt trước khi nhận traffic. | ~~User Data~~ (nếu cần sync với ASG) |
| **"replace EC2 fleet with new AMI rolling without downtime"** | **ASG Instance Refresh** | Thay thế dần từng đợt instance theo Launch Template / AMI mới. | ~~Terminate all~~ |

---

## 🔵 NHÓM 2: STORAGE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"without changing app code" + NFS/POSIX/Linux** | **Amazon EFS** | EFS mount NFS chuẩn $\rightarrow$ Linux đọc/ghi file hệ thống không sửa 1 dòng code. | ~~S3 API~~ ~~DynamoDB~~ |
| **"without changing app code" + SMB/Windows/AD** | **FSx for Windows File Server** | SMB native, Active Directory, NTFS ACLs, DFS Namespaces. | ~~EFS~~ |
| **"HPC, ML training, POSIX parallel FS, S3-linked"** | **FSx for Lustre** | File system song song hàng trăm GB/s, đọc/ghi trực tiếp vào S3 bucket. | ~~EFS~~ ~~EBS~~ |
| **"on-premise NFS/SMB → S3/EFS sync, periodic"** | **AWS DataSync** | Agent on-prem, sync file định kỳ qua mạng, nhanh gấp 10 lần rsync. | ~~Storage Gateway~~ |
| **"on-premise apps need local cache + cloud backup"** | **Storage Gateway (File Gateway)** | Cầu nối liên tục: app on-prem mount NFS/SMB có cache local, data sync lên S3. | ~~DataSync~~ |
| **"decommission tape libraries / VTL backup"** | **Storage Gateway (Tape Gateway)** | Giả lập thư viện băng từ iSCSI VTL, lưu băng ảo lên S3 Glacier / Deep Archive. | ~~S3 File Gateway~~ |
| **"on-prem volume: data mostly on-prem, async snapshot"** | **Volume Gateway — Stored Volumes** | Data chính ở tại chỗ (on-prem), snapshot async lên S3. | ~~Cached Volumes~~ |
| **"on-prem volume: data mostly on S3, local cache"** | **Volume Gateway — Cached Volumes** | Data chính trên S3, chỉ giữ cache phần hay dùng tại chỗ. | ~~Stored Volumes~~ |
| **"external partners upload via SFTP to S3"** | **AWS Transfer Family** | Endpoint SFTP/FTPS/FTP/AS2 managed đổ thẳng file vào S3/EFS, giữ nguyên script. | ~~DataSync~~ |
| **"50–100 TB migrate, slow internet taking > 1 week"** | **Snowball Edge Storage Optimized** | Ship thiết bị vật lý 80–210 TB nạp dữ liệu offline khi mạng quá chậm. | ~~DataSync qua mạng~~ |
| **"single-digit ms S3 latency, ML/AI training, 1 AZ"** | **S3 Express One Zone** | Nhanh gấp 10 lần Standard (single-digit ms), Directory Bucket trong 1 AZ. | ~~S3 Standard~~ |
| **"temporary files deleted after 10 days, cheapest"** | **S3 Standard** | Standard-IA phạt tiền tối thiểu 30 ngày lưu trữ dù xóa sớm. File < 30d dùng Standard. | ~~S3 Standard-IA~~ |
| **"unpredictable access pattern, zero retrieval fees"** | **S3 Intelligent-Tiering** | Tự động chuyển tầng Frequent $\rightarrow$ Infrequent $\rightarrow$ Archive, không phí phạt retrieval. | ~~Standard-IA~~ |
| **"infrequent access, ms retrieval, lowest cost archive"** | **S3 Glacier Instant Retrieval** | Truy cập 1 lần/quý, lấy ra ngay trong mili-giây, rẻ hơn Standard-IA 68%. | ~~Glacier Flexible~~ |
| **"compliance 7-10 years, cheapest, wait 12-48h OK"** | **S3 Glacier Deep Archive** | Rẻ nhất thế giới (< $1/TB/tháng), lấy dữ liệu mất 12–48 giờ. | ~~Glacier Flexible~~ |
| **"WORM compliance, nobody deletes even root"** | **S3 Object Lock (Compliance Mode)** | Không một ai xóa được kể cả Root AWS; Governance mode admin vẫn bypass được. | ~~Governance Mode~~ |
| **"replicate existing objects in S3 bucket"** | **S3 Batch Replication** | CRR mặc định chỉ replicate object mới; dữ liệu có sẵn phải dùng Batch Replication. | ~~CRR alone~~ |
| **"high-volume S3 requests causing KMS throttling"** | **S3 Bucket Key** | Giảm tới 99% số lần gọi API tới KMS, tiết kiệm chi phí và hết nghẽn quota. | ~~Tăng KMS Quota~~ |
| **"query specific columns directly from S3 CSV/Parquet"**| **S3 Select** | Lọc dữ liệu tại tầng S3 bằng SQL trước khi trả về app, giảm 80% băng thông mạng. | ~~Amazon Athena~~ |
| **"shared block storage, same AZ, 16 EC2 instances"** | **EBS io2 Block Express Multi-Attach** | Gắn 1 volume vào tối đa 16 EC2 cùng AZ; app cần cluster file system. | ~~EFS~~ |
| **"eliminate EBS snapshot lazy-loading latency"** | **Fast Snapshot Restore (FSR)** | Khởi tạo volume từ snapshot có ngay 100% hiệu năng, không bị trễ lần đọc đầu. | ~~Pre-warm bằng dd~~ |

---

## 🟢 NHÓM 3: DATABASE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"Lambda connects to RDS, too many connections"** | **Amazon RDS Proxy** | Connection pooling gom cụm kết nối, giảm 90% tải DB, giảm 66% thời gian failover. | ~~Direct Connection~~ |
| **"Oracle/SQL Server requires OS root / sysadmin"** | **Amazon RDS Custom** | Có quyền OS + SSH/SSM để cài agent/driver tùy biến, tắt automation khi sửa. | ~~RDS thường~~ |
| **"RDS HA, standby readable, fast failover ~35s"** | **RDS Multi-AZ DB Cluster** | 1 Writer + 2 Readable Standbys trên 3 AZ, failover < 35s, đọc được từ standby. | ~~Multi-AZ Instance~~ (standby ko đọc được) |
| **"scale read traffic, async replicas, cross-region"** | **RDS Read Replicas** | Tối đa 15 replica, async, cùng Region free data transfer, promote làm DR. | ~~Multi-AZ~~ (sync, chuyên HA) |
| **"rewind MySQL DB without restore from backup"** | **Aurora Backtrack** | Tua ngược DB về thời điểm cũ trong vài giây, không cần restore cluster mới. | ~~Restore Snapshot~~ |
| **"instant zero-cost DB copy for testing"** | **Aurora Clone (Copy-on-write)** | Tạo bản sao test tức thì, không tốn thêm storage cho dữ liệu chưa đổi. | ~~Snapshot + Restore~~ |
| **"unpredictable spiky relational workload"** | **Aurora Serverless v2** | Tự scale ACU theo giây, có Data API gọi SQL qua HTTPS không giữ connection. | ~~Aurora Provisioned~~ |
| **"cross-region DR for relational DB, RPO ~1s, RTO < 1m"**| **Aurora Global Database** | Replicate tầng storage < 1s, 1 primary + 10 secondary, có Write Forwarding. | ~~RDS Cross-Region Replica~~ |
| **"microsecond DynamoDB reads, NO code change"** | **DynamoDB Accelerator (DAX)** | Cache in-memory chuyên cho DynamoDB, cùng API, microsecond latency. | ~~ElastiCache~~ (phải sửa code) |
| **"multi-region active-active read AND write"** | **DynamoDB Global Tables** | Tất cả Region đều nhận WRITE, replicate < 1s, last-writer-wins. | ~~Aurora Global~~ (1 writer) |
| **"recover DynamoDB to specific second in 35 days"** | **DynamoDB PITR** | Continuous backup, restore về bất kỳ giây nào ra bảng mới. | ~~On-Demand Backup~~ |
| **"trigger Lambda on DynamoDB item update/delete"** | **DynamoDB Streams** | Changelog 24 giờ của các bản ghi, kích hoạt Lambda phản ứng sự kiện (CDC). | ~~S3 Event~~ |
| **"automatically delete expired items without cost"** | **DynamoDB TTL** | Xóa item tự động theo timestamp, hoàn toàn miễn phí, không tốn WCU. | ~~Viết Lambda cron quét~~ |
| **"DynamoDB item size > 400 KB"** | **Lưu file S3 + DynamoDB lưu pointer** | Giới hạn cứng của DynamoDB item là 400 KB. | ~~Tăng item size~~ |
| **"in-memory cache, pub/sub, sorted sets leaderboard"** | **Amazon ElastiCache (Redis / Valkey)** | Đa cấu trúc dữ liệu, Multi-AZ auto failover, AOF persistence. | ~~Memcached~~ |
| **"multi-threaded simple in-memory cache"** | **Amazon ElastiCache (Memcached)** | Thuần key-value, đa luồng CPU, scale ngang dễ dàng, không persistence. | ~~Redis~~ |
| **"Redis speed but needs durable primary database"** | **Amazon MemoryDB for Redis** | Redis-compatible nhưng durable Multi-AZ transactional log làm DB chính. | ~~ElastiCache~~ (chỉ làm cache) |
| **"MongoDB compatible document store", "JSON"** | **Amazon DocumentDB** | 100% Mongo wire protocol, storage Aurora tự scale 128 TB. | ~~DynamoDB~~ |
| **"social network / fraud detection / graph queries"** | **Amazon Neptune** | Graph DB tối ưu cho Gremlin/openCypher, quan hệ chằng chịt nhiều bước. | ~~RDS~~ ~~DynamoDB~~ |
| **"Apache Cassandra migration without managing servers"** | **Amazon Keyspaces** | Serverless Cassandra, 100% CQL compatible, không quản lý cụm. | ~~DynamoDB~~ |
| **"IoT time-series, sensor telemetry billions/sec"** | **Amazon Timestream** | Time-series DB serverless: tự phân tầng In-Memory $\rightarrow$ Magnetic store. | ~~RDS~~ |

---

## 🟡 NHÓM 4: NETWORK & CDN

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"private subnet instances need internet access"** | **NAT Gateway (trong Public Subnet)** | Scale tới 100 Gbps, cần Elastic IP. Mỗi AZ 1 NAT GW để đạt Multi-AZ HA. | ~~NAT Instance~~ ~~IGW~~ |
| **"IPv6 instances need outbound internet access only"** | **Egress-Only Internet Gateway** | 1 chiều ra internet cho IPv6, chặn chiều vào. NAT GW không dùng cho IPv6. | ~~NAT Gateway~~ |
| **"access S3/DynamoDB from VPC privately, free"** | **Gateway VPC Endpoint** | Thêm route vào Route Table, miễn phí $0, không qua NAT, không qua internet. | ~~Interface Endpoint~~ (tính phí) |
| **"access AWS services privately via private IP, on-prem"**| **Interface VPC Endpoint (PrivateLink)** | Tạo ENI trong subnet, có private IP, hỗ trợ 100+ services, dùng được từ on-prem. | ~~Gateway Endpoint~~ |
| **"block specific malicious IP address at subnet level"** | **Network ACL (NACL Rule Deny)** | Stateless, xét rule số từ nhỏ đến lớn, khớp là dừng. SG không có rule Deny. | ~~Security Group~~ |
| **"only allow database access from web servers SG"** | **Security Group Referencing** | SG của DB cho phép inbound từ SG của Web app (cùng Region). | ~~NACL~~ |
| **"connect 2 VPCs directly, no transitive, low cost"** | **VPC Peering** | Kết nối 1-1, không transitive, không overlap CIDR, không tốn phí giờ. | ~~Transit Gateway~~ |
| **"connect hundreds of VPCs and on-prem, transitive"** | **AWS Transit Gateway (TGW)** | Hub-and-Spoke router trung tâm, transitive routing, duy nhất hỗ trợ Multicast. | ~~VPC Peering mesh~~ |
| **"expose service privately, overlapping CIDRs, SaaS"** | **AWS PrivateLink (Endpoint Service)** | Service sau NLB expose qua ENI, 1 chiều, chấp nhận dải IP trùng nhau. | ~~VPC Peering~~ ~~TGW~~ |
| **"dedicated physical connection, high bandwidth"** | **AWS Direct Connect (DX)** | Cáp vật lý riêng, latency ổn định, không qua internet, không mã hóa mặc định. | ~~Site-to-Site VPN~~ |
| **"quick secure encrypted tunnel over internet, backup DX"**| **AWS Site-to-Site VPN** | Thiết lập vài phút, mã hóa IPsec qua internet, 2 tunnels HA, 1.25 Gbps/tunnel. | ~~Direct Connect~~ |
| **"connect multiple branch offices to AWS hub"** | **AWS VPN CloudHub** | Nhiều CGW chi nhánh nối về 1 VGW theo hub-and-spoke, dùng BGP. | ~~TGW~~ (nếu đề nhấn VGW) |
| **"static Anycast IPs, UDP/TCP, bypass DNS cache"** | **AWS Global Accelerator** | 2 Anycast IP tĩnh, đưa traffic vào mạng AWS tại edge gần nhất, failover < 1m. | ~~CloudFront~~ (chỉ HTTP, có cache) |
| **"global CDN edge caching, HTTP/HTTPS, WAF"** | **Amazon CloudFront** | CDN Layer 7, cache tại 450+ Edge Locations, HTTPS cert tạo ở `us-east-1`. | ~~Global Accelerator~~ |
| **"secure S3 bucket so only CloudFront can read files"**| **Origin Access Control (OAC)** | OAC thay thế OAI cũ + Bucket Policy chặn truy cập trực tiếp S3. | ~~OAI~~ |
| **"edge compute < 1ms, rewrite URL, no network call"** | **CloudFront Functions** | JavaScript, < 1ms, viewer request/response, cực rẻ, không gọi mạng ngoài. | ~~Lambda@Edge~~ |
| **"edge compute up to 30s, dynamic resize, network call"**| **Lambda@Edge** | Node/Python, chạy cả 4 event, gọi được API ngoài, tạo ở `us-east-1`. | ~~CloudFront Functions~~ |
| **"zone apex (example.com) points to ALB/CloudFront free"**| **Route 53 Alias Record** | Alias dùng được cho naked domain, miễn phí query. CNAME không dùng cho apex. | ~~CNAME~~ |
| **"route users based on country for legal compliance"** | **Route 53 Geolocation Routing** | Theo vị trí địa lý của USER (Quốc gia/Lục địa), tuân thủ luật GDPR/EU. | ~~Latency Routing~~ |
| **"active-passive DR failover with health checks"** | **Route 53 Failover Routing** | Primary lỗi $\rightarrow$ tự động switch sang Secondary. Bắt buộc có health check. | ~~Simple Routing~~ |
| **"hybrid DNS: on-prem resolves private VPC names"** | **Route 53 Resolver Inbound Endpoint** | Cho phép DNS on-prem hỏi tên miền trong Private Hosted Zone của VPC. | ~~Outbound Endpoint~~ |
| **"hybrid DNS: VPC resolves on-prem company domains"** | **Route 53 Resolver Outbound Endpoint** | Forwarding rules chuyển truy vấn từ VPC về DNS server on-prem. | ~~Inbound Endpoint~~ |

---

## 🟠 NHÓM 5: SECURITY & COMPLIANCE

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"EC2 access AWS APIs without hardcoded keys"** | **IAM Role (Instance Profile)** | STS cấp temporary credentials, tự rotate mỗi giờ, không lưu key trên máy. | ~~Access Key trong code~~ |
| **"cross-account access using temporary credentials"** | **IAM Role with Trust Policy (`sts:AssumeRole`)**| Account A assume role ở Account B qua STS token. Không share IAM user key. | ~~Chia sẻ Access Key~~ |
| **"prevent confused deputy attack for third-party"** | **External ID** | Bắt buộc cấu hình khi cấp quyền cho bên thứ 3 assume role vào account mình. | ~~Secret Key~~ |
| **"org-wide guardrail, deny action across all accounts"**| **Service Control Policies (SCP)** | Phủ quyết cả Root của Member Account. Không áp dụng cho Management Account. | ~~Permission Boundaries~~ |
| **"limit max permissions developer can grant themselves"**| **IAM Permission Boundaries** | Đặt "trần quyền" tối đa cho User/Role chống tự nâng quyền thành Admin. | ~~SCP~~ |
| **"centralized single sign-on for multiple accounts/SaaS"**| **AWS IAM Identity Center (AWS SSO)** | Cấp quyền qua Permission Sets, tích hợp AD / SAML 2.0 IdP + SCIM. | ~~Tạo IAM User lẻ~~ |
| **"existing on-prem AD, do not replicate passwords"** | **AD Connector** | Proxy chuyển tiếp xác thực về on-prem AD, không lưu password trên AWS. | ~~Managed Microsoft AD~~ |
| **"full AD on AWS, 2-way trust with on-prem"** | **AWS Managed Microsoft AD** | AD thật trên AWS, Multi-AZ, hỗ trợ trust 2 chiều, FSx Windows, RDS SQL Server. | ~~AD Connector~~ ~~Simple AD~~ |
| **"data > 4 KB encryption with KMS"** | **Envelope Encryption (`GenerateDataKey`)** | KMS chỉ mã hóa trực tiếp $\le$ 4 KB. Lớn hơn dùng Plaintext Data Key tự mã hóa. | ~~KMS Encrypt API~~ |
| **"dedicated hardware HSM, FIPS 140-2 Level 3, own keys"**| **AWS CloudHSM** | Single-tenant phần cứng riêng, khách tự quản key, AWS không thể khôi phục. | ~~AWS KMS~~ |
| **"auto-rotate database passwords without downtime"** | **AWS Secrets Manager** | Rotation tự động bằng Lambda (2 nhãn CURRENT/PENDING), tích hợp sẵn RDS. | ~~SSM Parameter Store~~ |
| **"store configuration parameters, non-secret, free"** | **SSM Parameter Store (Standard)** | Miễn phí cho Standard tier, lưu URL, AMI ID, biến môi trường. Không tự rotate. | ~~Secrets Manager~~ |
| **"public SSL certificate auto-renew free for ALB/CF"** | **AWS Certificate Manager (ACM)** | Miễn phí, auto renew. Cert cho CloudFront bắt buộc tạo ở `us-east-1`. Không export. | ~~Import Cert~~ |
| **"block SQL injection, XSS, rate-limit HTTP requests"** | **AWS WAF** | Layer 7 firewall, gắn ALB, CloudFront, APIGW, AppSync. KHÔNG GẮN ĐƯỢC NLB. | ~~Network Firewall~~ |
| **"DDoS mitigation L3/4 with financial protection"** | **AWS Shield Advanced** | Bảo vệ L3/4/7, đội SRT 24/7, bồi thường chi phí scale do bị tấn công DDoS. | ~~Shield Standard~~ (free basic) |
| **"VPC inspection, FQDN domain filtering outbound"** | **AWS Network Firewall** | Stateful L3-L7 firewall, Suricata IPS, lọc domain FQDN, đặt tại Firewall Subnet. | ~~Security Group~~ ~~WAF~~ |
| **"runtime threat detection, crypto mining, compromised keys"**| **Amazon GuardDuty** | Phân tích CloudTrail, VPC Flow, DNS logs bằng ML thời gian thực. Không cần agent. | ~~Inspector~~ (chỉ quét tĩnh) |
| **"scan EC2/ECR container images for CVE vulnerabilities"**| **Amazon Inspector** | Quét lỗ hổng tĩnh (CVE) trên OS EC2 (qua SSM Agent), ECR image, Lambda code. | ~~GuardDuty~~ |
| **"discover sensitive personal data (PII) stored in S3"**| **Amazon Macie** | Dùng ML quét số thẻ tín dụng, CMND, bệnh án CHỈ TRONG AMAZON S3. | ~~GuardDuty~~ ~~Inspector~~ |
| **"root cause analysis and graph visual after alert"** | **Amazon Detective** | Nhận findings từ GuardDuty, dựng đồ thị thực thể trực quan điều tra vụ án. | ~~GuardDuty~~ |
| **"central dashboard for security compliance score (CIS)"**| **AWS Security Hub** | Tổng hợp findings GuardDuty, Inspector, Macie, Config theo chuẩn ASFF, chấm điểm. | ~~Config alone~~ |
| **"share VPC subnets or Transit Gateway across accounts"**| **AWS Resource Access Manager (RAM)** | Chia sẻ tài nguyên trong Organization không cần tạo trùng lặp. | ~~VPC Peering~~ |
| **"download official AWS compliance reports (SOC, PCI)"**| **AWS Artifact** | Tải báo cáo kiểm toán của chính AWS và ký thỏa thuận HIPAA BAA. | ~~Audit Manager~~ |
| **"continuous compliance auditing and evidence collection"**| **AWS Audit Manager** | Tự động thu thập bằng chứng từ tài nguyên của bạn phục vụ kiểm toán viên. | ~~AWS Artifact~~ |
| **"user registration, social login, JWT token for app"**| **Amazon Cognito User Pools** | Xác thực người dùng (Authentication), cấp JWT token cho API Gateway/ALB. | ~~Identity Pools~~ |
| **"exchange user token for temporary AWS credentials"** | **Amazon Cognito Identity Pools** | Phân quyền (Authorization), đổi token lấy STS credentials truy cập thẳng S3. | ~~User Pools~~ |

---

## 🟣 NHÓM 6: MESSAGING, ANALYTICS & AI

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"decouple tiers, buffer spikes, unlimited throughput"** | **Amazon SQS (Standard)** | Pull-based, buffer tải đột biến, at-least-once, retention tới 14 ngày. | ~~SQS FIFO~~ |
| **"strict ordering, exactly-once, financial transaction"**| **Amazon SQS FIFO** | FIFO (.fifo), max 3,000 msg/s batching, MessageGroupId phân nhóm song song. | ~~SQS Standard~~ |
| **"fan-out 1 event to multiple independent services"** | **SNS $\rightarrow$ Multiple SQS Queues** | Push 1 lần tới nhiều SQS, mỗi consumer xử lý độc lập không ảnh hưởng nhau. | ~~SQS alone~~ |
| **"event-driven architecture from AWS/SaaS, cron"** | **Amazon EventBridge** | Event bus lọc JSON event, EventBridge Scheduler thay thế cron, có Replay. | ~~CloudWatch Events~~ |
| **"workflow orchestration up to 1 year, human approval"**| **AWS Step Functions Standard** | Exactly-once, tối đa 1 năm, hỗ trợ `.waitForTaskToken` chờ người duyệt. | ~~Express~~ (max 5m) |
| **"migrate existing messaging app without rewriting code"**| **Amazon MQ (ActiveMQ / RabbitMQ)** | Hỗ trợ JMS, AMQP, MQTT, STOMP. Không bắt viết lại code như SQS. | ~~SQS~~ |
| **"no-code bulk data transfer Salesforce to S3/Redshift"**| **Amazon AppFlow** | Kéo dữ liệu lớn từ SaaS sang AWS qua PrivateLink không cần viết code. | ~~EventBridge~~ |
| **"GraphQL API, real-time WebSocket subscriptions"** | **AWS AppSync** | Managed GraphQL, gộp nhiều nguồn dữ liệu trong 1 request, offline sync. | ~~API Gateway REST~~ |
| **"serverless SQL query directly on S3 data lake"** | **Amazon Athena** | $5/TB data scanned. Tối ưu 90% chi phí bằng Parquet/ORC + Partitioning. | ~~Redshift~~ |
| **"query S3 data lake from existing Redshift cluster"** | **Redshift Spectrum** | Cụm Redshift query thẳng file S3 qua Glue Data Catalog không cần load data. | ~~Athena~~ |
| **"serverless ETL, schema discovery, data catalog"** | **AWS Glue** | Crawlers tự suy schema, Data Catalog làm từ điển chung, Spark ETL jobs. | ~~EMR~~ |
| **"visual no-code data preparation for business analysts"**| **AWS Glue DataBrew** | 250+ phép biến đổi trực quan kéo thả, làm sạch dữ liệu không cần code. | ~~Glue ETL Jobs~~ |
| **"petabyte big data cluster, cheap Spot task nodes"** | **Amazon EMR** | Cụm Hadoop/Spark. Task nodes không lưu HDFS $\rightarrow$ dùng Spot tiết kiệm 80%. | ~~Glue~~ |
| **"data warehouse, OLAP queries, MPP columnar storage"** | **Amazon Redshift** | Kho dữ liệu phân tích BI, lưu trữ theo cột, Concurrency Scaling. | ~~RDS Aurora~~ |
| **"enforce column-level and row-level security on S3"** | **AWS Lake Formation** | Phân quyền hạt mịn cấp bảng, cột, dòng cho Athena/Redshift, LF-Tags. | ~~IAM S3 alone~~ |
| **"full-text search, log analytics dashboard, Kibana"** | **Amazon OpenSearch Service** | Tìm kiếm toàn văn, log analytics, UltraWarm lưu trữ rẻ, vector search k-NN. | ~~Athena~~ |
| **"serverless BI dashboards, SPICE in-memory"** | **Amazon QuickSight** | BI dashboard serverless, bộ nhớ in-memory SPICE, Amazon Q hỏi đáp tự nhiên. | ~~CloudWatch Dashboard~~|
| **"real-time streaming analytics, sliding windows"** | **Managed Service for Apache Flink**| Xử lý luồng real-time bằng Apache Flink, windowing aggregations, exactly-once. | ~~Athena~~ |
| **"managed Apache Kafka, message size > 1 MB up to 10 MB"**| **Amazon MSK** | Cụm Kafka managed, tương thích hệ sinh thái Kafka, message tới 10 MB. | ~~Kinesis Data Streams~~ |
| **"Foundation Models via serverless API, GenAI RAG"** | **Amazon Bedrock** | Gọi Claude, Llama, Titan qua API serverless, RAG Knowledge Bases, Guardrails. | ~~SageMaker~~ (tự train) |
| **"extract tables and forms from scanned PDFs/invoices"**| **Amazon Textract** | OCR hiểu cấu trúc bảng biểu, key-value forms, hóa đơn (AnalyzeExpense). | ~~Comprehend~~ |
| **"analyze customer feedback sentiment, detect PII"** | **Amazon Comprehend** | NLP phân tích cảm xúc (tích cực/tiêu cực), thực thể, che PII trong văn bản. | ~~Textract~~ |
| **"detect objects, faces, inappropriate content in images"**| **Amazon Rekognition** | Thị giác máy tính nhận diện khuôn mặt, vật thể, kiểm duyệt nội dung ảnh/video. | ~~Textract~~ |
| **"speech-to-text", "call center transcription"** | **Amazon Transcribe** | Chuyển giọng nói thành văn bản, tự động che PII, nhận diện người nói. | ~~Polly~~ |
| **"text-to-speech", "read articles aloud"** | **Amazon Polly** | Chuyển văn bản thành giọng đọc tự nhiên, Neural TTS, SSML tags. | ~~Transcribe~~ |
| **"intelligent enterprise search answering natural questions"**| **Amazon Kendra** | Tìm kiếm tài liệu nội bộ (SharePoint, S3) bằng câu hỏi ngôn ngữ tự nhiên. | ~~OpenSearch~~ |
| **"train custom machine learning models from scratch"** | **Amazon SageMaker AI** | Nền tảng ML toàn diện cho data scientists, Managed Spot training giảm 90%. | ~~Bedrock~~ |
| **"human review for low confidence ML predictions"** | **Amazon Augmented AI (A2I)** | Đưa kết quả ML điểm tin cậy thấp cho con người duyệt lại (human-in-the-loop).| ~~SageMaker Ground Truth~~|

---

## ⚫ NHÓM 7: MIGRATION & DISASTER RECOVERY

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"rehost physical servers, VMware, Hyper-V to EC2"** | **AWS Application Migration Service (MGN)**| Replicate block-level liên tục (TCP 1500) vào Staging Area, cutover vài phút. | ~~DMS~~ ~~SMS~~ |
| **"homogeneous database migration without code changes"**| **AWS Database Migration Service (DMS)**| Nguồn vẫn chạy bình thường, Full Load + CDC đồng bộ liên tục, downtime tối thiểu. | ~~SCT~~ (không cần) |
| **"heterogeneous database migration (Oracle to Aurora)"**| **AWS SCT + AWS DMS** | SCT chuyển đổi Schema và Stored Procedures; DMS di chuyển dữ liệu. | ~~DMS only~~ |
| **"survey on-prem servers and network dependency mapping"**| **AWS Application Discovery Service (Agent)**| Cài agent lên OS thu thập cấu hình thực tế và vẽ bản đồ kết nối mạng giữa các server. | ~~Agentless~~ (ko có network map) |
| **"single dashboard to track migration across tools"** | **AWS Migration Hub** | "Single pane of glass" theo dõi tiến độ MGN, DMS, DataSync gom theo ứng dụng. | ~~Discovery Service~~ |
| **"disaster recovery for servers, RPO seconds, RTO minutes"**| **AWS Elastic Disaster Recovery (DRS)**| Replicate mức khối đĩa liên tục vào Staging Area giá rẻ, failback về on-prem được. | ~~AWS Backup~~ |
| **"DR strategy: DB running, compute fleet 0 instances"**| **Pilot Light** | Chỉ có Database chạy 24/7. Máy chủ EC2 = 0 (tắt ngúm). Khi có sự cố mới boot EC2. | ~~Warm Standby~~ |
| **"DR strategy: DB running, scaled-down fleet running 24/7"**| **Warm Standby** | Database chạy + cụm EC2 thu nhỏ chạy 24/7. Khi sự cố scale up lên 100%. | ~~Pilot Light~~ |
| **"DR strategy: active-active multi-region, zero RTO/RPO"**| **Multi-Region Multi-Active** | 100% công suất chạy ở tất cả các Region, đắt nhất, không cần failover. | ~~Warm Standby~~ |
| **"protect backups from ransomware deletion even by root"**| **AWS Backup Vault Lock (Compliance Mode)**| Khóa bất biến WORM, sau cooling-off period không ai xóa được kể cả root. | ~~Governance Mode~~ |

---

## 💰 NHÓM 8: COST MANAGEMENT & OPTIMIZATION

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"visualize cost trends, 12-month spending forecast"** | **AWS Cost Explorer** | Xem lịch sử 13 tháng, dự báo 12 tháng, khuyến nghị RI/Savings Plans. | ~~AWS Budgets~~ |
| **"alert when spend exceeds budget, auto-stop EC2"** | **AWS Budgets + Budget Actions** | Cảnh báo chi phí thực tế hoặc dự phóng; tự động tắt máy ảo hoặc gắn IAM deny. | ~~Cost Explorer~~ |
| **"most granular billing data, hourly resource ID, Athena"**| **AWS Cost and Usage Report (CUR)** | Báo cáo chi tiết nhất từng dòng xuất vào S3 để Athena/QuickSight query. | ~~Cost Explorer~~ |
| **"track spending by team/project, activate in console"**| **Cost Allocation Tags** | Bắt buộc phải kích hoạt trong Billing Console mới vào báo cáo; không hồi tố. | ~~Tags thông thường~~ |
| **"automatically detect unexpected cost spikes using ML"**| **AWS Cost Anomaly Detection** | Dùng ML tự học pattern chi tiêu, cảnh báo bất thường kèm root cause, miễn phí. | ~~Budgets~~ (ngưỡng cố định) |
| **"estimate cost before deployment, pre-migration"** | **AWS Pricing Calculator** | Công cụ web tính toán dự toán chi phí trước khi bắt tay xây dựng hệ thống. | ~~Cost Explorer~~ |
| **"most flexible commitment across EC2, Fargate, Lambda"**| **Compute Savings Plans** | Giảm tới 66%, cam kết $/h, tự áp dụng mọi region/family/OS. Không giữ chỗ máy. | ~~EC2 Instance SP~~ |
| **"guaranteed capacity reservation with discount for peak"**| **Zonal Reserved Instances (Zonal RI)** | Giảm tới 72% VÀ đảm bảo 100% có chỗ máy chạy tại 1 AZ cụ thể. | ~~Compute Savings Plans~~ |
| **"turn off Dev/Test EC2 and RDS outside business hours"**| **AWS Instance Scheduler** | Lambda + EventBridge dựa trên tag tắt máy ban đêm và cuối tuần, giảm 70% tiền. | ~~Tắt thủ công~~ |
| **"right-size over-provisioned EC2 instances using ML"** | **AWS Compute Optimizer** | Phân tích 14 ngày CloudWatch metrics gợi ý hạ size máy hoặc đổi chip Graviton. | ~~Cost Explorer~~ |
| **"minimize data transfer cost for S3 from private subnet"**| **Gateway VPC Endpoint** | Miễn phí $0, thay thế hoàn toàn NAT Gateway (tốn $0.045/h + $0.045/GB). | ~~NAT Gateway~~ |

---

## 🛠️ NHÓM 9: OPERATIONS, DEVELOPER TOOLS & MEDIA

| Từ Khóa Trong Đề Thi | ✅ CHỌN | 💡 Vì Sao / Móc Nhớ | ❌ KHÔNG CHỌN |
|:---|:---|:---|:---|
| **"trace requests across microservices, find bottleneck"**| **AWS X-Ray** | Distributed tracing, Service map, Trace ID qua HTTP header, đo độ trễ từng chặng. | ~~CloudWatch Logs~~ |
| **"orchestrate CI/CD pipeline, manual approval step"** | **AWS CodePipeline** | Tự động hóa Source $\rightarrow$ Build $\rightarrow$ Test $\rightarrow$ Deploy, bước duyệt gửi SNS. | ~~CodeBuild~~ |
| **"serverless build service, replace Jenkins, Docker image"**| **AWS CodeBuild** | Biên dịch code, chạy test, build image theo `buildspec.yml`, trả theo phút build. | ~~Jenkins trên EC2~~ |
| **"deploy applications, canary deployment, auto rollback"**| **AWS CodeDeploy** | Triển khai theo `appspec.yml`, canary/linear traffic shifting, rollback khi alarm. | ~~Beanstalk~~ |
| **"manage software packages (npm, pip, maven) in VPC"** | **AWS CodeArtifact** | Kho lưu trữ package nội bộ, proxy cache repo public cho VPC private. | ~~ECR~~ (chỉ container) |
| **"in-browser terminal with pre-installed AWS CLI"** | **AWS CloudShell** | Terminal trên console web, có sẵn credential, 1 GB persistent storage. | ~~Cloud9~~ |
| **"define infrastructure using programming languages (TS/Python)"**| **AWS CDK** | Viết code hướng đối tượng, lệnh `cdk synth` biên dịch thành CloudFormation. | ~~CloudFormation YAML~~ |
| **"simplified serverless framework, local Lambda testing"**| **AWS SAM** | Cú pháp mở rộng serverless, SAM CLI test Lambda cục bộ qua Docker. | ~~CDK~~ |
| **"convert video stored in S3 for VOD, HLS/DASH, DRM"** | **AWS Elemental MediaConvert** | Chuyển mã video file-based chất lượng broadcast, thay thế Elastic Transcoder. | ~~Elastic Transcoder~~ |
| **"stream video/audio from cameras, Rekognition Video"** | **Amazon Kinesis Video Streams** | Hấp thụ video từ hàng triệu thiết bị camera/drone, WebRTC 2 chiều. | ~~Kinesis Data Streams~~ |
| **"interactive live streaming, Twitch tech, latency < 5s"**| **Amazon IVS** | Livestream tương tác độ trễ cực thấp (< 5s), có chat và timed metadata poll. | ~~MediaLive~~ |
| **"broadcast live video encoding, sports TV events"** | **AWS Elemental MediaLive + MediaPackage**| MediaLive mã hóa trực tiếp $\rightarrow$ MediaPackage đóng gói DRM/time-shift $\rightarrow$ CloudFront. | ~~IVS~~ |
| **"frontend developer, build full-stack web/mobile, CI/CD"**| **AWS Amplify** | Dựng full-stack (Next.js, React, Flutter) kèm auth, API, DB, hosting từ Git. | ~~S3 + CloudFront~~ |
| **"test mobile application on real physical devices"** | **AWS Device Farm** | Test app trên hàng trăm điện thoại thật trên cloud, không dùng emulator. | ~~Simulator~~ |
| **"maps, vehicle tracking, route calculation, geofence"** | **Amazon Location Service** | Tích hợp bản đồ Esri/HERE, tính tuyến đường, bắn sự kiện khi ra/vào geofence. | ~~Route 53 Geolocation~~ |
| **"marketing campaigns, customer segmentation, analytics"**| **Amazon Pinpoint** | Tiếp thị đa kênh (Email, SMS, Push), phân khúc người dùng, đo tỷ lệ mở/click. | ~~Amazon SES~~ ~~SNS~~ |
| **"continuous compliance auditing of configuration changes"**| **AWS Config** | Ghi lịch sử cấu hình, đánh giá theo rule, tự động sửa qua SSM Automation. | ~~CloudTrail~~ |
| **"deploy infrastructure across multiple accounts/regions"**| **CloudFormation StackSets** | Triển khai 1 template ra hàng trăm account và region từ 1 tài khoản admin. | ~~Nested Stacks~~ |
| **"protect database from deletion when CFN stack deleted"**| **DeletionPolicy: Retain / Snapshot** | Giữ lại tài nguyên hoặc chụp snapshot trước khi xóa stack CloudFormation. | ~~Stack Policy~~ |
| **"detect manual out-of-band changes to infrastructure"** | **CloudFormation Drift Detection** | So sánh cấu hình thực tế với template để phát hiện ai đã sửa tay. | ~~AWS Config~~ |
| **"setup multi-account landing zone with guardrails"** | **AWS Control Tower** | Dựng Landing Zone chuẩn mực, Account Factory cấp account mới, Guardrails. | ~~Organizations alone~~ |
| **"self-service catalog of pre-approved infrastructure"** | **AWS Service Catalog** | Developers tự tạo stack đã duyệt qua Portfolio/Product với Launch Constraint. | ~~CloudFormation~~ |
| **"automatically recover EC2 on hardware failure"** | **CloudWatch Alarm + EC2 Recover** | Chuyển máy sang phần cứng mới, giữ nguyên Private IP, EIP, Metadata, EBS. | ~~EC2 Reboot~~ |
| **"enforce software license limits by core/socket (BYOL)"**| **AWS License Manager** | Hard limit chặn bật máy vượt quá license, kết hợp Dedicated Hosts. | ~~Trusted Advisor~~ |

---

## 🛑 NHÓM 10: SERVERLESS HARD LIMITS — CON SỐ LOẠI TRỪ TRONG 3 GIÂY

| Dịch Vụ | Giới Hạn Cứng / Con Số Cốt Tử | 💡 Quy Tắc Loại Suy Đáp Án Nhanh |
|:---|:---|:---|
| **AWS Lambda** | **Thời gian chạy tối đa: 15 phút** | Đề bài chạy job 20 phút hay vài giờ $\rightarrow$ **Gạch bỏ Lambda** (chọn Batch/Fargate). |
| **AWS Lambda** | **Bộ nhớ RAM: 128 MB đến 10 GB** | CPU tự động tăng tỷ lệ thuận theo RAM được cấp phát. |
| **AWS Lambda** | **Payload: 6 MB đồng bộ / 256 KB bất đồng bộ** | Đề bài gửi file 50 MB qua API Gateway vào Lambda $\rightarrow$ **Gạch bỏ** (phải qua S3). |
| **AWS Lambda** | **Concurrency mặc định: 1,000 / Region** | Vượt quá bị lỗi `HTTP 429`. Dùng Provisioned Concurrency để xóa Cold Start. |
| **Amazon API Gateway** | **Timeout tối đa: 29 giây** | Tác vụ xử lý backend mất > 29s $\rightarrow$ **Bị timeout** (phải chuyển sang async với SQS). |
| **Amazon API Gateway** | **Throttling mặc định: 10,000 req/s** | Vượt quá trả về `HTTP 429 Too Many Requests`. |
| **Amazon SQS** | **Kích thước tin nhắn: 256 KB** | Tin nhắn > 256 KB (tới 2 GB) $\rightarrow$ Dùng **SQS Extended Client Library** qua S3. |
| **Amazon SQS** | **Thời gian lưu trữ: 4 ngày (tối đa 14 ngày)** | Quá 14 ngày không xử lý sẽ bị xóa vĩnh viễn khỏi hàng đợi. |
| **Amazon SQS** | **Visibility Timeout tối đa: 12 giờ** | Mặc định 30 giây. Lambda kết hợp SQS nên đặt Visibility Timeout $\ge$ 6x Lambda timeout. |
| **Amazon DynamoDB** | **Kích thước 1 Item tối đa: 400 KB** | File lớn > 400 KB $\rightarrow$ Lưu S3, DynamoDB chỉ lưu pointer/URL metadata. |
| **Amazon DynamoDB** | **Phục hồi theo thời gian (PITR): 35 ngày** | Cho phép khôi phục bảng về bất kỳ giây nào trong 35 ngày qua ra bảng mới. |
| **AWS Step Functions** | **Standard Workflow: Tối đa 1 năm** | Hỗ trợ human approval (`waitForTaskToken`), tính tiền theo state transition. |
| **AWS Step Functions** | **Express Workflow: Tối đa 5 phút** | Xử lý IoT/streaming thông lượng cực cao, tính tiền theo GB-giây. |
| **Kinesis Data Streams** | **Kích thước bản ghi (Record): Tối đa 1 MB** | Cần message lớn hơn tới 10 MB $\rightarrow$ Chọn **Amazon MSK (Kafka)**. |
| **Kinesis Data Streams** | **Lưu trữ: 24 giờ (tối đa 365 ngày)** | Có thể tua lại và phát lại (Replay) stream bất kỳ lúc nào. |
| **Kinesis Data Streams** | **Công suất 1 Shard: 1 MB/s vào / 2 MB/s ra** | Tối đa 1,000 records/s vào. Vượt quá bị lỗi `ProvisionedThroughputExceeded`. |
