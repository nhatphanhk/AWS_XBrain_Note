Dưới đây là bản hoàn thiện theo format ghi chú ngắn, dễ học, dễ nhớ.

---

## Compute được hiểu là quá trình để chạy ứng dụng, quản lí dữ liệu và tính toán

### Describe how compute resources are provisioned and managed in the cloud.

> Trên môi trường Cloud, chúng ta không cần mua và lắp đặt server **on-premises**. Thay vào đó, tài nguyên máy tính được tạo dưới dạng phần mềm thông qua **ảo hóa**.
>
> Người dùng có thể cấp phát, cấu hình, mở rộng hoặc thu hồi tài nguyên chỉ trong vài phút thông qua Internet, dựa trên nhu cầu sử dụng thực tế.
>
> Ví dụ: Khi cần chạy một website, ta có thể tạo một EC2 instance trên AWS thay vì mua một máy chủ vật lý.

---

### Compare the benefits and challenges of using virtual servers to managing physical servers on premises.

> **Cloud / Virtual Servers:**
>
> * Triển khai rất nhanh.
> * Không cần chi phí đầu tư phần cứng ban đầu.
> * Trả tiền theo tài nguyên sử dụng.
> * Dễ dàng mở rộng hoặc thu hẹp hệ thống.
> * AWS chịu trách nhiệm bảo trì hạ tầng vật lý.
>
> **On-Premises / Physical Servers:**
>
> * Chi phí thiết lập ban đầu cao.
> * Mất nhiều tuần hoặc nhiều tháng để mua, lắp đặt phần cứng.
> * Doanh nghiệp phải tự quản lý điện, mạng, làm mát, không gian đặt server.
> * Khó giảm quy mô nếu đã mua dư tài nguyên.
> * Cần đội ngũ kỹ thuật vận hành phần cứng.

---

### Identify the concept of multi-tenancy in Amazon EC2.

> **Multi-tenancy** trong Amazon EC2 nghĩa là nhiều khách hàng khác nhau có thể cùng sử dụng tài nguyên vật lý của AWS, nhưng mỗi khách hàng được cách ly bằng công nghệ ảo hóa.
>
> Ví dụ: Một máy chủ vật lý của AWS có thể chạy nhiều EC2 instances của nhiều khách hàng khác nhau. Tuy nhiên, mỗi instance hoạt động độc lập, dữ liệu và ứng dụng của khách hàng này không thể truy cập vào khách hàng khác.
>
> Nói đơn giản: **nhiều người thuê chung hạ tầng, nhưng môi trường sử dụng được tách biệt và bảo mật.**

---

### Explain the different EC2 instance types and their characteristics.

> Amazon EC2 có nhiều loại instance khác nhau, mỗi loại được tối ưu cho một nhu cầu cụ thể như CPU, RAM, lưu trữ hoặc xử lý đồ họa. AWS cũng mô tả rằng mỗi instance type cung cấp sự kết hợp khác nhau giữa compute, memory, storage và networking. ([AWS Documentation][1])

| EC2 Instance Type         | Đặc điểm chính                                              |
| ------------------------- | ----------------------------------------------------------- |
| **General Purpose**       | Cân bằng giữa CPU, RAM và network                           |
| **Compute Optimized**     | Mạnh về CPU, phù hợp tác vụ tính toán nặng                  |
| **Memory Optimized**      | Nhiều RAM, phù hợp xử lý dữ liệu lớn trong bộ nhớ           |
| **Storage Optimized**     | Tối ưu tốc độ đọc/ghi dữ liệu                               |
| **Accelerated Computing** | Có GPU hoặc phần cứng tăng tốc                              |
| **HPC Optimized**         | Phù hợp High Performance Computing, tính toán hiệu năng cao |

---

### Identify appropriate use cases for each EC2 instance type.

| EC2 Instance Type         | Use case phù hợp                                                       |
| ------------------------- | ---------------------------------------------------------------------- |
| **General Purpose**       | Website, web app, server nhỏ, môi trường dev/test                      |
| **Compute Optimized**     | Game server, xử lý batch, API traffic cao, tính toán khoa học          |
| **Memory Optimized**      | Database lớn, cache, real-time analytics, in-memory database           |
| **Storage Optimized**     | Data warehouse, log processing, big data, hệ thống cần I/O cao         |
| **Accelerated Computing** | Machine learning, AI, render video, xử lý hình ảnh                     |
| **HPC Optimized**         | Mô phỏng khoa học, tài chính, kỹ thuật, workload cần hiệu năng cực cao |

---

### Explain how to use the AWS Management Console, the AWS Command Line Interface, and the AWS SDK to interact with AWS services.

> Có 3 cách phổ biến để tương tác với AWS services:

| Công cụ                    | Cách dùng                                                               | Phù hợp khi nào                                       |
| -------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------- |
| **AWS Management Console** | Giao diện web để click và cấu hình service                              | Người mới học, thao tác thủ công, quan sát tài nguyên |
| **AWS CLI**                | Dùng command line để tạo, sửa, xóa AWS resource                         | Tự động hóa, script, thao tác nhanh                   |
| **AWS SDK**                | Dùng thư viện lập trình như JavaScript, Java, Python để gọi AWS service | Khi cần tích hợp AWS vào ứng dụng                     |

> Ví dụ:
>
> * Console: Vào giao diện AWS để tạo EC2 instance.
> * CLI: Chạy lệnh `aws ec2 run-instances`.
> * SDK: Viết code Node.js để upload file lên S3 hoặc gọi DynamoDB.

---

### Describe the customer and AWS responsibilities regarding virtual machines.

> Theo **AWS Shared Responsibility Model**, AWS chịu trách nhiệm bảo mật **of the cloud**, còn khách hàng chịu trách nhiệm bảo mật **in the cloud**. AWS quản lý từ host operating system, virtualization layer xuống đến bảo mật vật lý của data center. ([Amazon Web Services, Inc.][2])

| Bên chịu trách nhiệm | Trách nhiệm                                                                                               |
| -------------------- | --------------------------------------------------------------------------------------------------------- |
| **AWS**              | Data center, phần cứng vật lý, network hạ tầng, hypervisor, virtualization layer                          |
| **Customer**         | Hệ điều hành trong EC2, application, data, security group, firewall rule, IAM, patch OS, cấu hình bảo mật |

> Ví dụ: AWS bảo vệ máy chủ vật lý chạy EC2, nhưng khách hàng phải tự cập nhật hệ điều hành, cấu hình port, quản lý user và bảo vệ dữ liệu trong instance.

---

### Explain the differences between managed and unmanaged services.

| Loại service          | Ý nghĩa                                                                 | Ví dụ                            |
| --------------------- | ----------------------------------------------------------------------- | -------------------------------- |
| **Managed Service**   | AWS quản lý phần lớn hạ tầng, backup, scaling, patching                 | Amazon RDS, DynamoDB, Lambda, S3 |
| **Unmanaged Service** | Người dùng tự quản lý nhiều hơn, bao gồm OS, software, update, security | EC2                              |

> **Managed service** giúp giảm công sức vận hành.
>
> **Unmanaged service** cho nhiều quyền kiểm soát hơn nhưng cũng cần tự chịu trách nhiệm nhiều hơn.

---

### Identify the key configurations needed when setting up an EC2 instance.

> Khi tạo EC2 instance, cần cấu hình các phần chính sau:

* **AMI**: hệ điều hành hoặc image dùng để khởi tạo instance.
* **Instance type**: chọn CPU, RAM, network phù hợp.
* **Key pair**: dùng để SSH vào instance.
* **Network / VPC / Subnet**: chọn mạng nơi instance chạy.
* **Security Group**: cấu hình firewall, cho phép port như SSH 22, HTTP 80, HTTPS 443.
* **Storage**: chọn dung lượng và loại EBS volume.
* **IAM Role**: cấp quyền cho EC2 truy cập các AWS service khác.
* **User Data**: script chạy tự động khi instance khởi động lần đầu.
* **Tags**: gắn nhãn để quản lý tài nguyên dễ hơn.

---

### Explain how an AMI maintains consistency and efficiency when scaling applications.

> **AMI — Amazon Machine Image** là bản mẫu dùng để tạo EC2 instance.
>
> AMI có thể chứa:
>
> * Hệ điều hành.
> * Application đã cài sẵn.
> * Thư viện cần thiết.
> * Cấu hình hệ thống.
>
> Khi scale hệ thống, AWS có thể tạo nhiều EC2 instances từ cùng một AMI. Điều này giúp các server mới có cấu hình giống nhau, giảm lỗi cài đặt thủ công và tiết kiệm thời gian triển khai.
>
> Ví dụ: Một web app đã được cài sẵn trong AMI. Khi traffic tăng, Auto Scaling có thể tạo thêm EC2 mới từ AMI đó để chạy cùng ứng dụng.

---

### Explain the available Amazon EC2 pricing options.

> Các lựa chọn thanh toán chính của Amazon EC2 gồm **On-Demand Instances, Savings Plans, Spot Instances**, ngoài ra còn có **Reserved Instances, Dedicated Hosts, Dedicated Instances và Capacity Reservations** tùy nhu cầu sử dụng. AWS hiện mô tả ba cách trả tiền chính cho EC2 là On-Demand, Savings Plans và Spot Instances. ([Amazon Web Services, Inc.][3])

| Pricing Option            | Ý nghĩa                                                          |
| ------------------------- | ---------------------------------------------------------------- |
| **On-Demand**             | Trả tiền theo giờ hoặc giây, không cần cam kết dài hạn           |
| **Savings Plans**         | Cam kết mức sử dụng trong 1 hoặc 3 năm để được giảm giá          |
| **Reserved Instances**    | Cam kết dùng instance trong 1 hoặc 3 năm để nhận giá thấp hơn    |
| **Spot Instances**        | Dùng capacity dư của AWS với giá rẻ hơn, nhưng có thể bị thu hồi |
| **Dedicated Hosts**       | Thuê riêng máy chủ vật lý                                        |
| **Dedicated Instances**   | Instance chạy trên phần cứng single-tenant                       |
| **Capacity Reservations** | Giữ trước capacity EC2 trong một Availability Zone               |

---

### Describe when to use each pricing option based on specific use cases.

| Pricing Option            | Khi nào nên dùng                                                                         |
| ------------------------- | ---------------------------------------------------------------------------------------- |
| **On-Demand**             | Workload ngắn hạn, thử nghiệm, traffic không ổn định                                     |
| **Savings Plans**         | Hệ thống chạy ổn định lâu dài, muốn giảm chi phí nhưng vẫn linh hoạt                     |
| **Reserved Instances**    | Workload ổn định, biết rõ instance family/region cần dùng                                |
| **Spot Instances**        | Batch jobs, data processing, CI/CD, workload có thể bị gián đoạn                         |
| **Dedicated Hosts**       | Yêu cầu compliance, license phần mềm theo physical server                                |
| **Dedicated Instances**   | Cần chạy trên phần cứng riêng biệt với khách hàng khác                                   |
| **Capacity Reservations** | Cần đảm bảo có sẵn capacity cho sự kiện quan trọng, disaster recovery, high availability |

> Spot Instances có thể rẻ hơn On-Demand rất nhiều vì dùng spare capacity của AWS, nhưng phù hợp nhất với workload có thể chịu gián đoạn. AWS nêu Spot có thể giảm tới 90% so với On-Demand. ([Amazon Web Services, Inc.][3])

---

### Describe Amazon EC2 Capacity Reservations and Reserved Instance flexibility.

> **Capacity Reservations** cho phép đặt trước compute capacity cho EC2 trong một **Availability Zone** cụ thể, trong thời gian cần thiết. Nó phù hợp với workload quan trọng cần đảm bảo luôn có capacity khi cần chạy. ([AWS Documentation][4])
>
> **Reserved Instances** giúp giảm chi phí khi cam kết sử dụng EC2. Nếu chỉ định Availability Zone, RI cũng có thể đi kèm capacity reservation. ([Amazon Web Services, Inc.][5])
>
> **RI flexibility** nghĩa là một số Reserved Instances có thể linh hoạt theo Region, Availability Zone hoặc instance size. Regional Reserved Instances có thể áp dụng discount trong bất kỳ Availability Zone nào trong cùng Region và có thể có instance size flexibility trong cùng instance family. ([AWS Documentation][6])

> Nói đơn giản:
>
> * **Capacity Reservation**: tập trung vào việc đảm bảo có tài nguyên để chạy.
> * **Reserved Instance**: tập trung vào giảm chi phí khi dùng lâu dài.
> * **RI flexibility**: giúp discount áp dụng linh hoạt hơn trong một số trường hợp.

---

### Recognize the concepts of scalability and elasticity as they apply to AWS.

> **Scalability** là khả năng hệ thống mở rộng để xử lý nhiều workload hơn.
>
> **Elasticity** là khả năng tự động tăng hoặc giảm tài nguyên theo nhu cầu thực tế.
>
> Ví dụ:
>
> * Khi user tăng, hệ thống thêm EC2 instances.
> * Khi user giảm, hệ thống tự giảm EC2 để tiết kiệm chi phí.
>
> Nói ngắn gọn:
>
> * **Scalability** = có thể mở rộng.
> * **Elasticity** = tự động co giãn theo nhu cầu.

---

### Describe how AWS can help businesses adjust compute capacity based on varying demand.

> AWS giúp doanh nghiệp điều chỉnh compute capacity bằng các service như:
>
> * **Amazon EC2 Auto Scaling**: tự động thêm hoặc bớt EC2 instances.
> * **Elastic Load Balancing**: phân phối traffic đến nhiều instances.
> * **CloudWatch**: theo dõi CPU, memory, network, request count.
> * **Auto Scaling Policies**: đặt rule để scale theo CPU, traffic hoặc lịch cố định.
>
> Ví dụ: Website bán hàng có lượng truy cập tăng mạnh vào ngày sale. Auto Scaling sẽ tạo thêm EC2 để xử lý traffic. Khi sale kết thúc, hệ thống giảm số lượng EC2 để tiết kiệm chi phí.

---

### Describe the challenge of traffic distribution and scalability in AWS environments.

> Khi hệ thống có nhiều users truy cập, nếu toàn bộ traffic đi vào một server duy nhất thì server đó có thể bị quá tải.
>
> Các thách thức thường gặp:
>
> * Một EC2 instance không đủ xử lý toàn bộ request.
> * Traffic tăng giảm không ổn định.
> * Nếu một instance bị lỗi, user có thể không truy cập được.
> * Khó phân phối request đều giữa nhiều server.
>
> Vì vậy, hệ thống cần load balancer và auto scaling để phân phối traffic và mở rộng tự động.

---

### Recognize the benefits of Elastic Load Balancing in AWS.

> **Elastic Load Balancing — ELB** giúp tự động phân phối traffic đến nhiều target như EC2 instances, containers hoặc IP addresses.
>
> Lợi ích:
>
> * Phân phối request đều giữa nhiều instances.
> * Tăng high availability.
> * Nếu một instance bị lỗi, ELB chuyển traffic sang instance khỏe mạnh.
> * Hỗ trợ scale tốt hơn khi kết hợp với Auto Scaling.
> * Giúp hệ thống không phụ thuộc vào một server duy nhất.
>
> Ví dụ: Một website có 3 EC2 instances. ELB sẽ chia request của user đến cả 3 instance thay vì dồn vào một instance.

---

### Explain the relationship between Amazon EC2 Auto Scaling and ELB in managing AWS resources.

> **EC2 Auto Scaling** và **ELB** thường được dùng cùng nhau.
>
> * **Auto Scaling**: quyết định khi nào cần thêm hoặc bớt EC2 instances.
> * **ELB**: phân phối traffic đến các EC2 instances đang hoạt động.
>
> Khi Auto Scaling tạo thêm EC2 mới, instance đó có thể được đăng ký vào Load Balancer. Sau đó, ELB bắt đầu gửi traffic đến instance mới.
>
> Khi Auto Scaling xóa bớt EC2, ELB ngừng gửi traffic đến instance đó.
>
> Nói ngắn gọn:
>
> **Auto Scaling quản lý số lượng server, ELB quản lý luồng traffic đến các server.**

---

### Describe how Amazon Simple Queue Service facilitates message queuing.

> **Amazon SQS — Simple Queue Service** là dịch vụ hàng đợi tin nhắn.
>
> SQS giúp các thành phần trong hệ thống giao tiếp với nhau thông qua queue.
>
> Cách hoạt động:
>
> * Producer gửi message vào queue.
> * Message được lưu tạm trong queue.
> * Consumer lấy message ra để xử lý.
>
> Lợi ích:
>
> * Giảm phụ thuộc trực tiếp giữa các service.
> * Nếu consumer xử lý chậm, message vẫn được giữ trong queue.
> * Tăng độ bền và khả năng chịu lỗi.
> * Phù hợp cho xử lý nền, order processing, email sending, image processing.

---

### Explain how Amazon Simple Notification Service uses a publish-subscribe model to distribute messages.

> **Amazon SNS — Simple Notification Service** dùng mô hình **publish-subscribe**.
>
> Cách hoạt động:
>
> * Publisher gửi message đến một SNS topic.
> * Nhiều subscriber đăng ký nhận message từ topic đó.
> * SNS tự động gửi message đến tất cả subscriber.
>
> Subscriber có thể là:
>
> * Email.
> * SMS.
> * Lambda function.
> * SQS queue.
> * HTTP endpoint.
>
> Ví dụ: Khi có đơn hàng mới, hệ thống publish message vào SNS topic. SNS có thể gửi thông báo đến email admin, Lambda xử lý đơn hàng và SQS queue cùng lúc.

---

### Identify the difference between tightly coupled and loosely coupled architectures.

| Kiến trúc           | Ý nghĩa                                                     | Vấn đề / Lợi ích                                      |
| ------------------- | ----------------------------------------------------------- | ----------------------------------------------------- |
| **Tightly Coupled** | Các component phụ thuộc trực tiếp vào nhau                  | Nếu một component lỗi, component khác dễ bị ảnh hưởng |
| **Loosely Coupled** | Các component giao tiếp gián tiếp qua queue, event hoặc API | Dễ scale, dễ thay đổi, chịu lỗi tốt hơn               |

> Ví dụ:
>
> **Tightly coupled:** Service A gọi trực tiếp Service B. Nếu B bị lỗi, A cũng có thể bị treo.
>
> **Loosely coupled:** Service A gửi message vào SQS. Service B lấy message xử lý sau. Nếu B tạm thời lỗi, message vẫn nằm trong queue và xử lý lại sau.

---

### Explain how message queues help improve communication between components.

> Message queue giúp các component giao tiếp ổn định hơn bằng cách đặt một lớp trung gian giữa producer và consumer.
>
> Lợi ích:
>
> * Component gửi và nhận không cần chạy cùng lúc.
> * Giảm rủi ro mất dữ liệu khi service xử lý bị lỗi.
> * Giúp hệ thống chịu tải tốt hơn khi traffic tăng đột biến.
> * Cho phép xử lý bất đồng bộ.
> * Hỗ trợ kiến trúc loosely coupled.
>
> Ví dụ: Khi user upload ảnh, hệ thống không cần xử lý ảnh ngay lập tức. Web app chỉ cần gửi message vào SQS, sau đó worker sẽ lấy message và xử lý ảnh ở background.

---

## Bản tóm tắt dễ nhớ

| Khái niệm             | Cách nhớ nhanh                                         |
| --------------------- | ------------------------------------------------------ |
| **EC2**               | Máy chủ ảo trên AWS                                    |
| **AMI**               | Bản mẫu để tạo EC2                                     |
| **Instance Type**     | Cấu hình CPU/RAM/Storage của EC2                       |
| **Security Group**    | Firewall cho EC2                                       |
| **Auto Scaling**      | Tự động tăng/giảm số lượng EC2                         |
| **ELB**               | Chia traffic đến nhiều EC2                             |
| **SQS**               | Hàng đợi message                                       |
| **SNS**               | Gửi thông báo theo mô hình publish-subscribe           |
| **Scalability**       | Có thể mở rộng                                         |
| **Elasticity**        | Tự động co giãn                                        |
| **Multi-tenancy**     | Nhiều khách hàng dùng chung hạ tầng nhưng được cách ly |
| **Managed Service**   | AWS quản lý nhiều hơn                                  |
| **Unmanaged Service** | Người dùng tự quản lý nhiều hơn                        |

[1]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html?utm_source=chatgpt.com "Amazon EC2 instance types"
[2]: https://aws.amazon.com/compliance/shared-responsibility-model/?utm_source=chatgpt.com "Shared Responsibility Model - Amazon Web Services (AWS)"
[3]: https://aws.amazon.com/ec2/pricing/?utm_source=chatgpt.com "Amazon EC2 Pricing"
[4]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html?utm_source=chatgpt.com "Reserve compute capacity with EC2 On-Demand Capacity ..."
[5]: https://aws.amazon.com/ec2/pricing/reserved-instances/?utm_source=chatgpt.com "EC2 Reserved Instances"
[6]: https://docs.aws.amazon.com/cur/latest/userguide/monitor-flexible-reservation.html?utm_source=chatgpt.com "Monitoring your size flexible reservations for Amazon EC2"
