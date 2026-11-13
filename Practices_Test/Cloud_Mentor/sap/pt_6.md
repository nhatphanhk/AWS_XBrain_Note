logo
Practice Exams | AWS Certified Solutions Architect - Professional

Practice Test 06 - Results
< back to result overview

75 All questions


1 Correct


0 Incorrect


74 Skipped


0 Marked

Question 1:
Correct
A company plans to migrate a legacy on-premises application to AWS. The application is a Java web application that runs on Apache Tomcat with a PostgreSQL database. The company does not have access to the source code but can deploy the application Java Archive (JAR) files. The application has increased traffic at the end of each month.

Which solution will meet these requirements with the LEAST operational overhead?


A.
Launch Amazon EC2 instances in multiple Availability Zones. Deploy Tomcat and PostgreSQL to all the instances by using Amazon EFS mount points. Use AWS Step Functions to deploy additional EC2 instances to scale for increased traffic.

B.
Provision Amazon EKS in an Auto Scaling group across multiple AWS Regions. Deploy Tomcat and PostgreSQL in the container images. Use a Network Load Balancer to scale for increased traffic.

C.
Use AWS Elastic Beanstalk to deploy the Tomcat servers with auto scaling in multiple Availability Zones. Store application data in an Amazon RDS for PostgreSQL database. Deploy Amazon CloudFront and an Application Load Balancer to scale for increased traffic.

D.
Refactor the Java application into Python-based containers. Use AWS Lambda functions for the application logic. Store application data in Amazon DynamoDB global tables. Use AWS Storage Gateway and Lambda concurrency to scale for increased traffic.

Explanation

📝 Tóm tắt đề:

Ứng dụng Java chạy trên Apache Tomcat với PostgreSQL database

Không có source code, chỉ deploy được JAR files

Traffic tăng cuối mỗi tháng (predictable spike)

→ Yêu cầu: migrate lên AWS với LEAST operational overhead

✅ Đáp án đúng:

Use AWS Elastic Beanstalk to deploy the Tomcat servers with auto scaling in multiple Availability Zones. Store application data in an Amazon RDS for PostgreSQL database. Deploy Amazon CloudFront and an Application Load Balancer to scale for increased traffic.

Elastic Beanstalk hỗ trợ Tomcat native - upload file JAR/WAR trực tiếp là deploy được, không cần refactor hay containerize, đồng thời cũng là managed service - giúp giảm operational overhead

RDS for PostgreSQL là cũng managed database service, ít operational overhead

CloudFront + ALB xử lý traffic tăng đột biến cuối tháng (caching + scaling tự động)

Các đáp án sai:

❌ Launch Amazon EC2 instances in multiple Availability Zones. Deploy Tomcat and PostgreSQL to all the instances by using Amazon EFS mount points. Use AWS Step Functions to deploy additional EC2 instances to scale for increased traffic.

Tự quản lý EC2 + Tomcat + PostgreSQL = overhead cao nhất

Step Functions không phải công cụ để auto scale EC2 (đó là Auto Scaling Groups)

PostgreSQL trên EFS là anti-pattern về performance

❌ Provision Amazon EKS in an Auto Scaling group across multiple AWS Regions. Deploy Tomcat and PostgreSQL in the container images. Use a Network Load Balancer to scale for increased traffic.

EKS yêu cầu containerize ứng dụng → cần nhiều thay đổi khi không có source code

Multi-Region không cần thiết và tăng complexity/cost

Operational overhead của Kubernetes cao hơn Elastic Beanstalk nhiều

❌ Refactor the Java application into Python-based containers. Use AWS Lambda functions for the application logic. Store application data in Amazon DynamoDB global tables. Use AWS Storage Gateway and Lambda concurrency to scale for increased traffic.

Refactor sang Python khi không có source code là việc bất khả thi

Thay đổi ngôn ngữ + database là refactor toàn bộ, vi phạm ràng buộc "LEAST code changes"

🔑 Tips and tricks:

"Cannot access source code" + "deploy JAR/WAR" → Elastic Beanstalk (platform-managed, upload artifact trực tiếp)

"Tomcat" → Elastic Beanstalk hỗ trợ Tomcat platform

"Least operational overhead" + existing stack → tìm managed service phù hợp nhất, hạn chế refactor các thành phần

📖 Reference:

AWS Elastic Beanstalk - Tomcat Platform - https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/java-tomcat-platform.html

Amazon RDS for PostgreSQL - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html


Question 2:
Skipped
A research company conducts mathematical simulations in the AWS Cloud. The simulations run on several hundred Amazon EC2 Linux instances. If a simulation encounters an issue, an engineer establishes an SSH connection to the affected EC2 instance.

Company policy requires that each EC2 instance session is established with a unique SSH key and that all SSH connections are logged in AWS CloudTrail. CloudTrail is enabled for the company's account and the AWS Regions that the company uses.

Which solution will meet these requirements?


A.
Create an AWS Systems Manager document to run commands on EC2 instances to set a new unique SSH key. Create a new IAM policy. Attach the IAM policy to the engineers' IAM role with an Allow statement to run Systems Manager documents. Instruct the engineers to run the document to set an SSH key and to connect through any SSH client.

B.
Launch new EC2 instances. Generate an individual SSH key for each new EC2 instance. Store the SSH key in AWS Secrets Manager. Create a new IAM policy. Attach the IAM policy to the engineers' IAM role with an Allow statement for the GetSecretValue action. Instruct the engineers to retrieve the SSH key from Secrets Manager when the engineers connect through any SSH client.

C.
Set up AWS Secrets Manager to store the EC2 SSH key. Create an AWS Lambda function to create a new SSH key and to call AWS Systems Manager Session Manager to set the SSH key on the EC2 instance. Configure Secrets Manager to use the Lambda function to automatically rotate the SSH key once daily. Instruct the engineers to retrieve the SSH key from Secrets Manager when the engineers connect through any SSH client.

D.
Launch new EC2 instances without setting up any SSH key for the new EC2 instances. Set up EC2 Instance Connect on each new EC2 instance. Create a new IAM policy. Attach the IAM policy to the engineers' IAM role with an Allow statement for the SendSSHPublicKey action. Instruct the engineers to set an SSH key and to access EC2 instances by using Instance Connect from the AWS CLI.

Explanation

📝 Tóm tắt đề:

SSH đến EC2 Linux để debug khi có sự cố

Unique SSH key cho mỗi session

Tất cả SSH connections phải được logged in CloudTrail

CloudTrail đã bật sẵn

→ Yêu cầu: giải pháp tự động tạo unique key mỗi lần kết nối, có audit trail

✅ Đáp án đúng:

Launch new EC2 instances without setting up any SSH key for the new EC2 instances. Set up EC2 Instance Connect on each new EC2 instance. Create a new IAM policy. Attach the IAM policy to the engineers' IAM role with an Allow statement for the SendSSHPublicKey action. Instruct the engineers to set an SSH key and to access EC2 instances by using Instance Connect from the AWS CLI.

EC2 Instance Connect tự động tạo SSH key tạm thời cho mỗi lần kết nối - key chỉ có hiệu lực 60 giây

Mỗi lần gọi SendSSHPublicKey API được tự động ghi vào CloudTrail kèm instance ID, OS user, public key

Không cần lưu SSH key lâu dài - không có shared key, mỗi session độc lập

Permission được kiểm soát qua IAM policy (ec2-instance-connect:SendSSHPublicKey)

Các đáp án sai:

❌ Launch new EC2 instances. Generate an individual SSH key for each new EC2 instance. Store the SSH key in AWS Secrets Manager. Create a new IAM policy. Attach the IAM policy to the engineers' IAM role with an Allow statement for the GetSecretValue action. Instruct the engineers to retrieve the SSH key from Secrets Manager when the engineers connect through any SSH client.

SSH key cố định trong Secrets Manager → KHÔNG đáp ứng yêu cầu dùng key riêng cho mỗi session

CloudTrail ghi lại GetSecretValue, không phải SSH connection - không đáp ứng yêu cầu audit đầy đủ

❌ Create an AWS Systems Manager document to run commands on EC2 instances to set a new unique SSH key. Create a new IAM policy. Attach the IAM policy to the engineers' IAM role with an Allow statement to run Systems Manager documents. Instruct the engineers to run the document to set an SSH key and to connect through any SSH client.

Có thể khả thi về mặt kĩ thuật nhưng quy trình phức tạp, nhiều overhead

❌ Set up AWS Secrets Manager to store the EC2 SSH key. Create an AWS Lambda function to create a new SSH key and to call AWS Systems Manager Session Manager to set the SSH key on the EC2 instance. Configure Secrets Manager to use the Lambda function to automatically rotate the SSH key once daily. Instruct the engineers to retrieve the SSH key from Secrets Manager when the engineers connect through any SSH client.

Dù có rotate ssh key hàng ngày, nhưng vẫn không có gì đảm bảo là unique key cho mỗi session - vi phạm yêu cầu

Kiến trúc phức tạp không cần thiết (Lambda + Secrets Manager + SSM)

🔑 Tips and tricks:

"Unique SSH key per session" → EC2 Instance Connect (SendSSHPublicKey)

SendSSHPublicKey → tự động log CloudTrail, key ephemeral 60s

Nếu đề nói "unique per session" → loại ngay option dùng stored key (Secrets Manager với rotation daily/weekly)

EC2 Instance Connect hoạt động qua AWS CLI (aws ec2-instance-connect send-ssh-public-key) không cần mở port 22 ra internet nếu dùng endpoint

📖 Reference:

Amazon EC2 Instance Connect - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html

EC2 Instance Connect and CloudTrail - https://aws.amazon.com/blogs/compute/new-using-amazon-ec2-instance-connect-for-ssh-access-to-your-ec2-instances/


Question 3:
Skipped
A company has a collaborative document editing application that allows multiple users to simultaneously edit shared documents. The documents are stored as JSON objects in Amazon S3. The company needs to prevent data loss when multiple users modify the same document simultaneously. The solution must ensure that only the first write operation to finish successfully modifies the document. The solution must handle thousands of concurrent editors across multiple AWS Regions and must resolve conflicts automatically.

Which solution will meet these requirements?


A.
Deploy an S3 bucket and enable versioning. Configure S3 event notifications to invoke an AWS Lambda function in response to PutObject events. Configure the function to track document versions in an Amazon DynamoDB table and to use conditional writes to resolve conflicts.

B.
Deploy an S3 bucket. Configure conditional writes to use If-Match headers and entity tags (ETags). Configure an AWS Lambda function to detect editing conflicts based on Amazon S3 responses to writes. Configure the Lambda function to send retry messages to an Amazon SQS queue with a delay.

C.
Deploy an S3 bucket and enable S3 Object Lock in compliance mode. Use AWS Step Functions to retry sequential document updates by using exponential backoff.

D.
Deploy an S3 bucket and enable multipart uploads. Use AWS Batch jobs to make document updates. Use Amazon ElastiCache (Redis OSS) as a distributed lock mechanism across Regions.

Explanation

📝 Tóm tắt đề:

Nhiều users cùng edit đồng thời một document trên S3 (lưu dạng JSON object)

Phải đảm bảo chỉ lần write đầu tiên thành công được ghi (first-write-wins)

→ Yêu cầu: conflict prevention + automatic conflict resolution

✅ Đáp án đúng:

Deploy an S3 bucket. Configure conditional writes to use If-Match headers and entity tags (ETags). Configure an AWS Lambda function to detect editing conflicts based on Amazon S3 responses to writes. Configure the Lambda function to send retry messages to an Amazon SQS queue with a delay.

S3 Conditional Writes dùng If-Match header + ETag: chỉ cho phép write nếu ETag của object hiện tại khớp với ETag client đang giữ (do ETag của S3 object thay đổi mỗi khi object được ghi → client detect conflict khi ETag mismatch)

Nếu object đã bị ai khác thay đổi (ETag khác), S3 trả về lỗi 412 Precondition Failed → first-write-wins được đảm bảo ở tầng S3

Lambda detect conflict dựa trên S3 response (412) và đưa vào SQS với delay để retry lại việc ghi data sau

Các đáp án sai:

❌ Deploy an S3 bucket and enable versioning. Configure S3 event notifications to invoke an AWS Lambda function in response to PutObject events. Configure the function to track document versions in an Amazon DynamoDB table and to use conditional writes to resolve conflicts.

S3 Versioning không ngăn được concurrent writes (ghi đồng thời) - mọi write đều thành công, sẽ tạo ra multiple versions

Dùng thêm cơ chế quản lý lock file custom thông qua DynamoDB làm tăng overhead không cần thiết

❌ Deploy an S3 bucket and enable S3 Object Lock in compliance mode. Use AWS Step Functions to retry sequential document updates by using exponential backoff.

S3 Object Lock dùng để ngăn deletion/overwrite trong suốt thời gian lưu trữ, không phải giải pháp xử lý conflict khi ghi đồng thời

Step Functions + exponential backoff không giải quyết conflict, chỉ retry

❌ Deploy an S3 bucket and enable multipart uploads. Use AWS Batch jobs to make document updates. Use Amazon ElastiCache (Redis OSS) as a distributed lock mechanism across Regions.

Multipart uploads không liên quan đến xử lý conflict khi ghi đồng thời

ElastiCache Redis cross-Region locking rất phức tạp và Redis không hỗ trợ cross-Region native

AWS Batch là batch computing, không phù hợp cho real-time document editing

🔑 Tips and tricks:

"Prevent data loss" + "concurrent writes" → S3 Conditional Writes (If-Match + ETag)

"S3 Object Lock" → dùng cho việc lưu trữ lâu dài để đảm bảo tuân thủ, không phải concurrent access control

📖 Reference:

How to prevent object overwrites with conditional writes - https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-writes.html

Building multi-writer applications on Amazon S3 - https://aws.amazon.com/blogs/storage/building-multi-writer-applications-on-amazon-s3-using-native-controls/


Question 4:
Skipped
A company has an application that uses an on-premises Oracle database. The company is migrating the database to the AWS Cloud. The database contains customer data and stored procedures.

The company needs to migrate the database as quickly as possible with minimum downtime. The solution on AWS must provide high availability and must use managed services for the database.

Which solution will meet these requirements?


A.
Use AWS DMS to replicate data from the on-premises Oracle database to a new Amazon RDS for Oracle database. Transfer the database files to an Amazon S3 bucket. Configure the RDS database to use the S3 bucket as database storage. Set up S3 replication for high availability. Redirect the application to the RDS DB instance.

B.
Use AWS DMS to replicate data from the on-premises Oracle database to a new Amazon Aurora PostgreSQL database. Use AWS SCT to convert the schema and stored procedures. Redirect the application to the Aurora DB cluster.

C.
Create a database backup of the on-premises Oracle database. Upload the backup to an Amazon S3 bucket. Shut down the on-premises Oracle database to avoid any new transactions. Restore the backup to a new Oracle cluster that consists of Amazon EC2 instances across two Availability Zones. Redirect the application to the EC2 instances.

D.
Use AWS DMS to replicate data from the on-premises Oracle database to a new Amazon DynamoDB table. Use DynamoDB Accelerator (DAX) and implement global tables for high availability. Rewrite the stored procedures in AWS Lambda. Run the stored procedures in DAX. After replication, redirect the application to the DAX cluster endpoint.

Explanation

📝 Tóm tắt đề:

Migrate on-premises Oracle database lên AWS

Database có stored procedures

Yêu cầu minimum downtime (ít downtime) và high availability (HA)

Phải dùng managed services cho database

→ Yêu cầu: migrate nhanh, HA, managed, có stored procedures

✅ Đáp án đúng:

Use AWS DMS to replicate data from the on-premises Oracle database to a new Amazon Aurora PostgreSQL database. Use AWS SCT to convert the schema and stored procedures. Redirect the application to the Aurora DB cluster.

AWS DMS (Database Migration Service) hỗ trợ continuous replication (đồng bộ liên tục) từ Oracle → Aurora PostgreSQL - giúp đáp ứng minimum downtime

AWS SCT (Schema Conversion Tool) tự động convert schema và stored procedures từ Oracle PL/SQL sang PostgreSQL - giải quyết đúng yêu cầu

Aurora PostgreSQL là managed service - có tính khả dụng cao native, failover

Các đáp án sai:

❌ Use AWS DMS to replicate data from the on-premises Oracle database to a new Amazon RDS for Oracle database. Transfer the database files to an Amazon S3 bucket. Configure the RDS database to use the S3 bucket as database storage. Set up S3 replication for high availability. Redirect the application to the RDS DB instance.

RDS không dùng S3 bucket làm storage - đây là kiến trúc không hợp lệ

S3 replication không phải cơ chế HA cho RDS database

❌ Create a database backup of the on-premises Oracle database. Upload the backup to an Amazon S3 bucket. Shut down the on-premises Oracle database to avoid any new transactions. Restore the backup to a new Oracle cluster that consists of Amazon EC2 instances across two Availability Zones. Redirect the application to the EC2 instances.

Shut down database = maximum downtime, vi phạm "minimum downtime"

EC2 instances không phải managed service

Tự quản lý Oracle cluster trên EC2 = high operational overhead

❌ Use AWS DMS to replicate data from the on-premises Oracle database to a new Amazon DynamoDB table. Use DynamoDB Accelerator (DAX) and implement global tables for high availability. Rewrite the stored procedures in AWS Lambda. Run the stored procedures in DAX. After replication, redirect the application to the DAX cluster endpoint.

Oracle → DynamoDB là thay đổi lớn, cần nhiều thời gian, không đáp ứng "migration as quickly as possible"

Stored procedures không thể chạy trên DAX - DAX là in-memory cache, không phải engine cho phép chạy procedure, vô lý

Rewrite stored procedures in Lambda = tốn effort dev

🔑 Tips and tricks:

"Minimum downtime" + database migration → AWS DMS (continuous replication, cutover at end)

"Stored procedures" + Oracle/non-PostgreSQL → AWS SCT cần thiết để convert

"Managed service" + HA + PostgreSQL → Aurora PostgreSQL (không phải EC2 self-managed)

📖 Reference:

Migrating an Oracle Database to PostgreSQL - https://docs.aws.amazon.com/dms/latest/sbs/chap-rdsoracle2postgresql.html

AWS Schema Conversion Tool - https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_Welcome.html


Question 5:
Skipped
A company uses a software package for surveys. During surveys, data is uploaded from a field operator's device to an Amazon S3 bucket. A custom application that runs on several Amazon EC2 instances polls the S3 bucket for new data. When new data is available, the software processes the data.

The data uploads are infrequent. The processing software can take up to 25 minutes to analyze each data upload. The company wants to optimize the application workflow to process the S3 data.

Which solution will meet these requirements with the LEAST operational overhead?


A.
Modify the application to use HTTP to poll new S3 object keys that reference data to process. Containerize the application. Deploy the container image to AWS Lambda functions. Configure S3 bucket notifications to send events to Amazon EventBridge when new objects are uploaded. Create an EventBridge rule that invokes the Lambda functions to post the new objects to HTTP endpoints by using fan-out.

B.
Modify the application to accept new S3 object keys as inputs. Move the application from EC2 instances to Amazon ECS by using the EC2 capacity provider. Create an AWS Glue crawler to check the S3 bucket and invoke the application. Configure the application to process the data when the data is uploaded to Amazon S3.

C.
Modify the application to accept new S3 object keys as inputs. Containerize the application. Deploy the container image to AWS Lambda functions. Create a new AWS Step Functions state machine to invoke the Lambda functions. Configure the state machine with a Task state that calls the Lambda functions. Set the Task state's Timeout property to 30 minutes.

D.
Modify the application to accept new S3 object keys as inputs. Containerize the application. Deploy the container to an Amazon ECS cluster that uses the AWS Fargate launch type. Configure S3 bucket notifications to send events to Amazon EventBridge when new objects are uploaded. Create an EventBridge rule that invokes an ECS task to run the application when a new S3 object event occurs.

Explanation

📝 Tóm tắt đề:

EC2 instances poll S3 bucket cho data mới

Processing mỗi upload có thể mất up to 25 minutes

Uploads không thường xuyên (infrequent)

→ Yêu cầu: tối ưu workflow với LEAST operational overhead

✅ Đáp án đúng:

Modify the application to accept new S3 object keys as inputs. Containerize the application. Deploy the container to an Amazon ECS cluster that uses the AWS Fargate launch type. Configure S3 bucket notifications to send events to Amazon EventBridge when new objects are uploaded. Create an EventBridge rule that invokes an ECS task to run the application when a new S3 object event occurs.

ECS Fargate là service phù hợp cho việc chạy job lâu dài mà tốn ít effort

EventBridge + S3 notifications thay thế cho cơ chế polling hiện tại → thay vì cứ phải request s3 liên tục xem có file mới để xử lý hay chưa, EventBridge và S3 sẽ trigger xử lý ngay khi có file mới

Event-driven architecture: S3 → EventBridge → ECS task chạy khi có data mới

Các đáp án sai:

❌ Modify the application to accept new S3 object keys as inputs. Containerize the application. Deploy the container image to AWS Lambda functions. Create a new AWS Step Functions state machine to invoke the Lambda functions. Configure the state machine with a Task state that calls the Lambda functions. Set the Task state's Timeout property to 30 minutes.

Lambda có giới hạn xử lý là 15 phút, không phù hợp

❌ Modify the application to accept new S3 object keys as inputs. Move the application from EC2 instances to Amazon ECS by using the EC2 capacity provider. Create an AWS Glue crawler to check the S3 bucket and invoke the application. Configure the application to process the data when the data is uploaded to Amazon S3.

ECS với EC2 capacity provider vẫn yêu cầu quản lý EC2 instances (tốn effort, không phải least overhead)

AWS Glue crawler dùng để catalog metadata, không dùng cho mục đích trigger ECS tasks

❌ Modify the application to use HTTP to poll new S3 object keys that reference data to process. Containerize the application. Deploy the container image to AWS Lambda functions. Configure S3 bucket notifications to send events to Amazon EventBridge when new objects are uploaded. Create an EventBridge rule that invokes the Lambda functions to post the new objects to HTTP endpoints by using fan-out.

Lambda timeout 15 phút → không xử lý được 25 phút

HTTP polling là anti-pattern cho event-driven - tăng độ phức tạp không cần thiết

🔑 Tips and tricks:

"Processing up to 25 minutes" → loại ngay Lambda (max 15 min timeout)

"Long-running processing" + event-driven → ECS Fargate phù hợp hơn (không có timeout limit)

"Polling S3" → anti-pattern, thay bằng S3 notification → EventBridge

📖 Reference:

Amazon ECS task execution - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html

Using Amazon S3 with Amazon EventBridge - https://docs.aws.amazon.com/AmazonS3/latest/userguide/EventBridge.html


Question 6:
Skipped
A company is using AWS to develop and manage its production web application. The application includes an Amazon API Gateway HTTP API that invokes an AWS Lambda function. The Lambda function processes and then stores data in a database.

The company wants to implement user authorization for the web application in an integrated way. The company already uses a third-party identity provider that issues OAuth tokens for the company's other applications.

Which solution will meet these requirements?


A.
Integrate the company's third-party identity provider with API Gateway. Configure an API Gateway Lambda authorizer to validate tokens from the identity provider. Require the Lambda authorizer on all API routes. Update the web application to get tokens from the identity provider and include the tokens in the Authorization header when calling the API Gateway HTTP API.

B.
Integrate the company's third-party identity provider with AWS Directory Service. Configure Directory Service as an API Gateway authorizer to validate tokens from the identity provider. Require the Directory Service authorizer on all API routes. Configure the web application as a custom SAML 2.0 application.

C.
Integrate the company's third-party identity provider with AWS IAM Identity Center. Configure IAM users with permissions to call the API Gateway HTTP API. Update the web application to extract request parameters from the IAM users and include the parameters in the Authorization header when calling the API Gateway HTTP API.

D.
Integrate the company's third-party identity provider with AWS IAM Identity Center. Configure API Gateway to use IAM Identity Center for zero-configuration authentication and authorization. Update the web application to retrieve AWS STS tokens from IAM Identity Center and include the tokens in the Authorization header when calling the API Gateway HTTP API.

Explanation

📝 Tóm tắt đề:

Web app dùng API Gateway HTTP API → Lambda → database

Cần user authorization tích hợp (không tách rời)

Công ty đã có third-party identity provider phát hành OAuth tokens

→ Yêu cầu: integrate third-party OAuth IdP với API Gateway HTTP API

✅ Đáp án đúng:

Integrate the company's third-party identity provider with API Gateway. Configure an API Gateway Lambda authorizer to validate tokens from the identity provider. Require the Lambda authorizer on all API routes. Update the web application to get tokens from the identity provider and include the tokens in the Authorization header when calling the API Gateway HTTP API.

API Gateway HTTP API hỗ trợ Lambda authorizer - custom validation logic để verify OAuth token từ bất kỳ IdP nào

Lambda authorizer nhận token từ Authorization header, gọi third-party IdP để validate, trả về IAM policy

Giải pháp linh hoạt nhất cho bất kỳ OAuth-compatible IdP nào không phải Cognito

Không cần migrate IdP sang AWS - giữ nguyên IdP hiện tại

Kiến trúc tham khảo:


Các đáp án sai:

❌ Integrate the company's third-party identity provider with AWS Directory Service. Configure Directory Service as an API Gateway authorizer to validate tokens from the identity provider. Require the Directory Service authorizer on all API routes. Configure the web application as a custom SAML 2.0 application.

AWS Directory Service không thể làm authorizer cho API Gateway - không có tính năng này

Directory Service là managed AD, không phải OAuth token validator

SAML 2.0 là khác với OAuth token validation

❌ Integrate the company's third-party identity provider with AWS IAM Identity Center. Configure API Gateway to use IAM Identity Center for zero-configuration authentication and authorization. Update the web application to retrieve AWS STS tokens from IAM Identity Center and include the tokens in the Authorization header when calling the API Gateway HTTP API.

API Gateway không có "zero-configuration IAM Identity Center" authorizer

IAM Identity Center không trực tiếp integrate làm API Gateway authorizer

STS tokens là AWS credentials, khác với OAuth tokens từ third-party IdP

❌ Integrate the company's third-party identity provider with AWS IAM Identity Center. Configure IAM users with permissions to call the API Gateway HTTP API. Update the web application to extract request parameters from the IAM users and include the parameters in the Authorization header when calling the API Gateway HTTP API.

IAM users không phải cơ chế authorization phù hợp cho web app users

"Extract request parameters from IAM users" không có nghĩa kỹ thuật rõ ràng

Không tận dụng OAuth tokens từ third-party IdP đã có sẵn

🔑 Tips and tricks:

"Third-party OAuth tokens" + API Gateway → Lambda authorizer (custom validation) hoặc JWT authorizer (nếu OIDC-compliant)

API Gateway HTTP API hỗ trợ: JWT authorizer (built-in), Lambda authorizer, IAM authorization

"Integrate existing OAuth IdP" → không cần migrate sang Cognito

Lambda authorizer = custom logic → phù hợp khi IdP không phải chuẩn OIDC hoặc cần custom logic

Nếu đề nói "third-party IdP" + "OAuth" → loại đáp án dùng Directory Service hay IAM users

📖 Reference:

Using Lambda authorizers - https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html

Securing API Gateway HTTP endpoints with JWT authorizer - https://aws.amazon.com/blogs/security/how-to-secure-api-gateway-http-endpoints-with-jwt-authorizer/


Question 7:
Skipped
A public retail web application uses an Application Load Balancer (ALB) in front of Amazon EC2 instances running across multiple Availability Zones (AZs) in a Region backed by an Amazon RDS MySQL Multi-AZ deployment. Target group health checks are configured to use HTTP and pointed at the product catalog page. Auto Scaling is configured to maintain the web fleet size based on the ALB health check.

Recently, the application experienced an outage. Auto Scaling continuously replaced the instances during the outage. A subsequent investigation determined that the web server metrics were within the normal range, but the database tier was experiencing high load, resulting in severely elevated query response times.

Which of the following changes together would remediate these issues while improving monitoring capabilities for the availability and functionality of the entire application stack for future growth? (Select TWO.)


A.
Configure an Amazon ElastiCache cluster and place it between the web application and RDS MySQL instances to reduce the load on the backend database tier.

B.
Configure the target group health check to use a TCP check of the Amazon EC2 web server and the Amazon Route 53 health check against the product page to evaluate full application functionality. Configure Amazon CloudWatch alarms to notify administrators when the site fails.

C.
Configure an Amazon CloudWatch alarm for Amazon RDS with an action to recover a high-load, impaired RDS instance in the database tier.

D.
Configure the target group health check to point at a simple HTML page instead of a product catalog page and the Amazon Route 53 health check against the product page to evaluate full application functionality. Configure Amazon CloudWatch alarms to notify administrators when the site fails.

E.
Configure read replicas for Amazon RDS MySQL and use the single reader endpoint in the web application to reduce the load on the backend database tier.

Explanation

📝 Tóm tắt đề:

ALB + EC2 + RDS MySQL Multi-AZ

Health check của target group: HTTP trỏ vào product catalog page

Auto Scaling dựa trên ALB health check

Sự cố: database có tải cao → query chậm → ALB trả 502 → health check fail → Auto Scaling liên tục thay thế instances

→ Yêu cầu: giải quyết sự cố + cải thiện monitoring (Select TWO)

✅ Đáp án đúng:

Configure the target group health check to point at a simple HTML page instead of a product catalog page and the Amazon Route 53 health check against the product page to evaluate full application functionality. Configure Amazon CloudWatch alarms to notify administrators when the site fails.

Health check của target group trỏ vào product catalog page → khi DB chậm dẫn đến page load catalog từ db bị timeout → EC2 bị đánh dấu là unhealthy → Auto Scaling thay thế không cần thiết

Dùng simple HTML page (static, không cần kết nối DB) cho target group health check → chỉ kiểm tra health check đơn giản, tránh vấn đề bị fail rồi instance bị thay thế

Route 53 health check trỏ vào product page → health check full chức năng (kể cả DB connection)

Configure an Amazon ElastiCache cluster and place it between the web application and RDS MySQL instances to reduce the load on the backend database tier.

ElastiCache (Redis/Memcached) giúp cache database query results → giảm số lượng query tới RDS → giảm tải cho DB

Đặc biệt hiệu quả cho read-heavy workload như product catalog

Các đáp án sai:

❌ Configure read replicas for Amazon RDS MySQL and use the single reader endpoint in the web application to reduce the load on the backend database tier.

Tạo ra nhiều read replicas mà chỉ dùng một endpoint duy nhất để đọc data thì cũng không giúp giảm tải được, không giải quyết gốc rễ vấn đề

❌ Configure the target group health check to use a TCP check of the Amazon EC2 web server and the Amazon Route 53 health check against the product page to evaluate full application functionality. Configure Amazon CloudWatch alarms to notify administrators when the site fails.

TCP check chỉ verify port đang mở hay không- không kiểm tra web server có phản hồi HTTP đúng không

Simple HTML HTTP check tốt hơn TCP: đảm bảo application layer đang chạy mà không phụ thuộc DB

❌ Configure an Amazon CloudWatch alarm for Amazon RDS with an action to recover a high-load, impaired RDS instance in the database tier.

RDS "recover" action trong CloudWatch chỉ áp dụng cho EC2, không phải RDS

CloudWatch alarm cho RDS có thể notify nhưng không có cơ chế tự "recover" database instance

🔑 Tips and tricks:

Đề nhắc đến product catalog, đây thường là data ít thay đổi mà lại truy cập nhiều, nghĩ đến giải pháp sử dụng caching để giảm tải cho DB

Khi database slow → web page timeout → health check fail → Auto Scaling thay thế EC2 không cần thiết → health check misconfiguration

📖 Reference:

Health checks for your target groups - https://docs.aws.amazon.com/elasticloadbalancing/latest/application/target-group-health-checks.html

Amazon ElastiCache - https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WhatIs.html


Question 8:
Skipped
A company is preparing to deploy an Amazon EKS cluster for a workload. The company expects the cluster to support an unpredictable number of stateless pods. Many of the pods will be created during a short time period as the workload automatically scales the number of replicas that the workload uses.

Which solution will MAXIMIZE node resilience?


A.
Configure the workload to use topology spread constraints that are based on Availability Zone.

B.
Configure the Kubernetes Cluster Autoscaler to ensure that the compute capacity of the workload node groups stays underprovisioned.

C.
Update the workload node groups. Use a smaller number of node groups and larger instances in the node groups.

D.
Use a separate launch template to deploy the EKS control plane into a second cluster that is separate from the workload node groups.

Explanation

📝 Tóm tắt đề:

EKS cluster với stateless pods, số lượng không thể đoán trước

Nhiều pods được tạo nhanh chóng trong thời gian ngắn

→ Yêu cầu: MAXIMIZE node resilience

✅ Đáp án đúng:

Configure the workload to use topology spread constraints that are based on Availability Zone.

Topology spread constraints phân phối pods đều qua các Availability Zones khác nhau

Khi một AZ có sự cố, chỉ pods trong AZ đó bị ảnh hưởng - các pods ở AZ khác vẫn hoạt động

Đây là best practice của EKS cho high availability và resilience

Các đáp án sai:

❌ Use a separate launch template to deploy the EKS control plane into a second cluster that is separate from the workload node groups.

EKS control plane đã được AWS quản lý và phân phối trên các AZs - không cần tạo thêm một cluster nào nữa

Không giải quyết vấn đề node resilience cho workload

❌ Update the workload node groups. Use a smaller number of node groups and larger instances in the node groups.

Giảm số nodes = giảm khả năng chịu lỗi, nếu một node lớn fail, mất nhiều pods cùng lúc

❌ Configure the Kubernetes Cluster Autoscaler to ensure that the compute capacity of the workload node groups stays underprovisioned.

Underprovisioned = không đủ capacity khi pods mới tạo nhanh

Khi scale-out nhanh mà gặp underprovisioned nodes → pods pending → không scale nhanh như đề bài yêu cầu được

🔑 Tips and tricks:

"Maximize node resilience" + "EKS" → topology spread constraints based on AZ

topologyKey: topology.kubernetes.io/zone → pods phân phối đều qua các AZs

"Stateless pods" + multi-AZ distribution → topology spread constraints là pattern chuẩn

Nhiều nodes nhỏ tốt hơn ít nodes lớn cho resilience

Nếu đề nói "resilience" hoặc "HA" trong EKS → topology spread constraints trước, sau đó mới xét PDB

📖 Reference:

Spread workloads across nodes and Availability Zones - https://docs.aws.amazon.com/prescriptive-guidance/latest/ha-resiliency-amazon-eks-apps/spread-workloads.html

Pod Topology Spread Constraints - https://kubernetes.io/docs/concepts/scheduling-eviction/topology-spread-constraints/


Question 9:
Skipped
An events company runs a ticketing platform on AWS. The company's customers configure and schedule their events on the platform. The events result in large increases of traffic to the platform. The company knows the date and time of each customer's events.

The company runs the platform on an Amazon ECS cluster. The ECS cluster consists of Amazon EC2 On-Demand Instances that are in an Auto Scaling group. The Auto Scaling group uses a predictive scaling policy.

The ECS cluster makes frequent requests to an Amazon S3 bucket to download ticket assets. The ECS cluster and the S3 bucket are in the same AWS Region and the same AWS account. Traffic between the ECS cluster and the S3 bucket flows across a NAT gateway.

The company needs to optimize the cost of the platform without decreasing the platform's availability.

Which combination of steps will meet these requirements? (Select TWO.)


A.
Create a gateway VPC endpoint for the S3 bucket.

B.
Add another ECS capacity provider that uses an Auto Scaling group of Spot Instances. Configure the new capacity provider strategy to have the same weight as the existing capacity provider strategy.

C.
Create On-Demand Capacity Reservations for the applicable instance type for the time period of the scheduled scaling policies.

D.
Enable S3 Transfer Acceleration on the S3 bucket.

E.
Replace the predictive scaling policy with scheduled scaling policies for the scheduled events.

Explanation

📝 Tóm tắt đề:

ECS cluster dùng On-Demand Instances trong Auto Scaling group

Dùng predictive scaling policy, biết trước date/time của từng event

ECS tải assets từ S3, traffic hiện đi qua NAT gateway (cùng Region)

→ Yêu cầu: tối ưu cost mà không giảm availability (Select TWO)

✅ Đáp án đúng:

Create a gateway VPC endpoint for the S3 bucket.

Traffic ECS → S3 đang đi qua NAT gateway (tốn phí cho data processing và phí theo giờ)

Gateway VPC Endpoint cho S3 là miễn phí, traffic đi trực tiếp từ VPC đến S3 qua AWS private network

Không ảnh hưởng availability, không cần thay đổi application code

Replace the predictive scaling policy with scheduled scaling policies for the scheduled events.

Công ty đã biết chính xác date/time của từng event → scheduled scaling phù hợp hơn predictive

Predictive scaling dựa trên machine learning từ lịch sử quá khứ → có thể scale không chính xác được

Scheduled scaling chỉ scale đúng thời điểm event → không scale thừa ngoài giờ event

Vẫn đảm bảo availability vì scale trước đúng thời điểm cần

Các đáp án sai:

❌ Add another ECS capacity provider that uses an Auto Scaling group of Spot Instances. Configure the new capacity provider strategy to have the same weight as the existing capacity provider strategy.

Spot Instances có thể bị thu hồi bất cứ lúc nào → vi phạm yêu cầu về availability

❌ Create On-Demand Capacity Reservations for the applicable instance type for the time period of the scheduled scaling policies.

Capacity Reservations không giúp giảm chi phí so với On-Demand, có khi còn đắt hơn vì sau khi đặt Capacity Reservations xong mà không dùng thì vẫn mất phí

Đây không phải cơ chế giúp tối ưu chi phí cho On-demand

❌ Enable S3 Transfer Acceleration on the S3 bucket.

S3 Transfer Acceleration tốn thêm phí → ngược với mục tiêu optimize cost

Transfer Acceleration dùng CloudFront Edge locations - hữu ích cho việc uploads từ client xa, không dùng cho việc upload từ ECS → S3 cùng Region

🔑 Tips and tricks:

"NAT gateway" + "S3 access trong cùng Region" → Gateway VPC Endpoint (miễn phí, luôn thay thế NAT)

"Biết trước date/time" traffic tăng → Scheduled Scaling thay vì Predictive

"Spot Instances" + "availability requirement" → Loại

"Capacity Reservation" → không giảm cost (vẫn tính phí On-Demand)

📖 Reference:

Gateway endpoints for Amazon S3 - https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html

Scheduled scaling for Amazon EC2 Auto Scaling - https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html


Question 10:
Skipped
A company implements a multi-account landing zone in AWS Control Tower. The landing zone includes a dedicated network services account and several isolated workload accounts that have overlapping IP ranges.

The company needs to establish cross-account communication so that application teams in workload accounts can expose and consume services privately across accounts. All service-to-service communication must be private, work across multiple VPCs, and integrate with AWS Organizations. The company must be able to centrally manage identities, routing, and access control.

Which solution will meet these requirements?


A.
Use AWS PrivateLink to deploy VPC endpoint services to workload VPCs to expose services. Configure centralized endpoint service permissions that are managed through service consumer allowlists. Set up cross-account IAM policies to implement service-level access control.

B.
Use AWS Resource Access Manager (AWS RAM) to share centrally designated subnets that host a company-wide Amazon VPC Lattice service network from the network service account to the workload accounts to implement controlled service connectivity.

C.
Deploy an AWS PrivateLink endpoint service in each workload account and use Organizations to share endpoint service names to enable cross-account service discovery. Maintain account-level control over service exposure and consumption policies.

D.
Deploy a central transit gateway in the network service account. Use AWS Resource Access Manager (AWS RAM) to share the transit gateway attachment capability. Configure propagation-based routes to give workload VPCs the ability to expose and consume services across accounts.

Explanation

📝 Tóm tắt đề:

Multi-account landing zone trong AWS Control Tower

Network services account riêng biệt + các workload accounts có overlapping IP ranges

Cần cross-account service communication private, work across multiple VPCs, integrate với AWS Organizations

Quản lý tập trung identity, routing, access control

→ Yêu cầu: centralized service mesh cho multi-account với overlapping IPs

✅ Đáp án đúng:

Use AWS Resource Access Manager (AWS RAM) to share centrally designated subnets that host a company-wide Amazon VPC Lattice service network from the network service account to the workload accounts to implement controlled service connectivity.

VPC Lattice là service mesh được thiết kế cho cross-account, cross-VPC communication

AWS RAM share VPC Lattice service network từ network services account → workload accounts

VPC Lattice hoạt động với overlapping IP ranges (dải CIDR trùng lặp), có liên kết với AWS Organizations để quản lý tập trung quản lý quyền truy cập

Kiến trúc tham khảo:


Các đáp án sai:

❌ Deploy an AWS PrivateLink endpoint service in each workload account and use Organizations to share endpoint service names to enable cross-account service discovery. Maintain account-level control over service exposure and consumption policies.

Per-account management không phải centralized management (quản lý tập trung)

Organizations không dùng để "share endpoint service names" theo cách này

PrivateLink hoạt động tốt cho expose 1 service ra nhiều accounts, nhưng thiếu service network tập trung để quản lý nhiều service cùng lúc

❌ Use AWS PrivateLink to deploy VPC endpoint services to workload VPCs to expose services. Configure centralized endpoint service permissions that are managed through service consumer allowlists. Set up cross-account IAM policies to implement service-level access control.

Không integrate native với AWS Organizations

Allowlists thủ công và IAM policies riêng lẻ không phải centralized management tối ưu

❌ Deploy a central transit gateway in the network service account. Use AWS Resource Access Manager (AWS RAM) to share the transit gateway attachment capability. Configure propagation-based routes to give workload VPCs the ability to expose and consume services across accounts.

Transit Gateway (TGW) không hỗ trợ overlapping CIDR ranges giữa các VPCs

🔑 Tips and tricks:

"Overlapping IP ranges" + cross-account → loại Transit Gateway / VPC Peering

VPC Lattice = layer 7 service mesh, hoạt động với overlapping IPs

"Centralized management" + "AWS Organizations" → VPC Lattice + AWS RAM (share service network)

VPC Lattice integrate với IAM policies và AWS Organizations cho authorization

Nếu đề nói "overlapping IP" → Transit Gateway bị loại, phải dùng layer 7 solution

📖 Reference:

Amazon VPC Lattice - https://docs.aws.amazon.com/vpc-lattice/latest/ug/what-is-vpc-lattice.html

Shareable AWS resources - AWS RAM and VPC Lattice - https://docs.aws.amazon.com/ram/latest/userguide/shareable.html


Question 11:
Skipped
An online gaming company needs to optimize the cost of its workloads on AWS. The company uses a dedicated account to host the production environment for its online gaming application and an analytics application.

Amazon EC2 instances host the gaming application and must always be available. The EC2 instances run all year. The analytics application uses data that is stored in Amazon S3. The analytics application can be interrupted and resumed without issue.

Which solution will meet these requirements MOST cost-effectively?


A.
Purchase an EC2 Instance Savings Plan for the online gaming application instances. Use Spot Instances for the analytics application.

B.
Use Spot Instances for the online gaming application and the analytics application. Set up a catalog in AWS Service Catalog to provision services at a discount.

C.
Purchase an EC2 Instance Savings Plan for the online gaming application instances. Use On-Demand Instances for the analytics application.

D.
Use On-Demand Instances for the online gaming application. Use Spot Instances for the analytics application. Set up a catalog in AWS Service Catalog to provision services at a discount.

Explanation

📝 Tóm tắt đề:

EC2 instances chạy gaming app: must always be available (phải luôn khả dụng), run all year (chạy cả năm)

Analytics app dùng S3 data: can be interrupted and resumed without issue (có thể chịu gián đoạn và chạy lại)

→ Yêu cầu: MOST cost-effective solution

✅ Đáp án đúng:

Purchase an EC2 Instance Savings Plan for the online gaming application instances. Use Spot Instances for the analytics application.

EC2 Instance Savings Plan: cam kết usage 1-3 năm → tiết kiệm up to 72% so với On-Demand; phù hợp cho workload chạy liên tục cả năm, không bao giờ ngắt

Spot Instances: rẻ hơn On-Demand lên đến 90%; phù hợp cho analytics workload không quan trọng, có thể chịu gián đoạn - phù hợp với yêu cầu của đề

Các đáp án sai:

❌ Purchase an EC2 Instance Savings Plan for the online gaming application instances. Use On-Demand Instances for the analytics application.

On-Demand cho analytics = lãng phí vì analytics workload có thể chịu gián đoạn, dùng Spot sẽ rẻ hơn

❌ Use Spot Instances for the online gaming application and the analytics application. Set up a catalog in AWS Service Catalog to provision services at a discount.

Gaming app must always be available → Spot Instances không phù hợp (có thể bị thu hồi bất cứ lúc nào -> gián đoạn -> không đáp ứng yêu cầu "always available" cho gaming)

Service Catalog không có khả năng tạo discount cho Spot instance

❌ Use On-Demand Instances for the online gaming application. Use Spot Instances for the analytics application. Set up a catalog in AWS Service Catalog to provision services at a discount.

Gaming chạy cả năm mà lại dùng On-demand, không tiết kiệm, Saving Plan phù hợp hơn

Service Catalog không liên quan đến discount cho EC2

🔑 Tips and tricks:

"Always available" + "run all year" → Savings Plans hoặc Reserved Instances (không dùng Spot)

"Can be interrupted" + analytics/batch → Spot Instances (cheapest option, up to 90% off)

Nếu đề nói "can be interrupted" → Spot là đáp án cho cost optimization

Nếu đề nói "must be available 24/7" → loại Spot, dùng Savings Plan hoặc Reserved

📖 Reference:

EC2 Instance Savings Plans - https://docs.aws.amazon.com/savingsplans/latest/userguide/what-is-savings-plans.html

Amazon EC2 Spot Instances - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html


Question 12:
Skipped
A company needs to provide secure Remote Desktop connectivity to users for Amazon EC2 Windows instances that are hosted in a VPC. The solution must integrate centralized user management with the company's on-premises Active Directory. Connectivity to the VPC is through the internet. The company has already established an AWS Site-to-Site VPN connection between the on-premises data center and the VPC.

Which solution will meet these requirements?


A.
Deploy a managed Active Directory by using AWS Managed Microsoft AD. Establish a trust with the on-premises Active Directory. Configure permission sets against user groups for access to AWS Systems Manager. Connect to target instances by using Systems Manager Session Manager through RDP.

B.
Configure AWS IAM Identity Center to integrate with the on-premises Active Directory by using AWS Managed Microsoft AD. Configure permission sets against user groups for access to Amazon EC2 Instance Connect. Create and use an EC2 Instance Connect endpoint to access the target instances through SSH.

C.
Configure AWS IAM Identity Center to integrate with the on-premises Active Directory by using AD Connector. Configure permission sets against user groups for access to AWS Systems Manager. Use Systems Manager Fleet Manager to access the target instances through RDP.

D.
Deploy a managed Active Directory by using AWS Managed Microsoft AD. Establish a trust with the on-premises Active Directory. Deploy an EC2 instance as a bastion host in the VPC. Ensure that the EC2 instance is joined to the domain. Use the bastion host to access the target instances through SSH.

Explanation

📝 Tóm tắt đề:

Remote Desktop (RDP) đến EC2 Windows instances trong VPC

Phải integrate với on-premises Active Directory (centralized user management)

Kết nối qua internet (không phải internal network)

AWS Site-to-Site VPN đã được thiết lập (between on-premises and VPC)

→ Yêu cầu: RDP với AD authentication, qua internet

✅ Đáp án đúng:

Configure AWS IAM Identity Center to integrate with the on-premises Active Directory by using AD Connector. Configure permission sets against user groups for access to AWS Systems Manager. Use Systems Manager Fleet Manager to access the target instances through RDP.

AD Connector kết nối IAM Identity Center với on-premises Active Directory, cho phép xác thực người dùng đang quản lý ở on-premises AD

Systems Manager Fleet Manager: cung cấp khả năng truy cập Remote Desktop (RDP) trực tiếp từ trình duyệt mà không cần mở port 3389 (RDP) ra internet

Permission sets mapping các AD user groups với quyền SSM, cho phép access RDP thông qua Fleet Manager

Đây là best practice khi cần cấp quyền cho các user trong Active Directory có quyền truy cập service aws thông qua AWS Identity Center

Kiến trúc tham khảo:


Các đáp án sai:

❌ Deploy a managed Active Directory by using AWS Managed Microsoft AD. Establish a trust with the on-premises Active Directory. Deploy an EC2 instance as a bastion host in the VPC. Ensure that the EC2 instance is joined to the domain. Use the bastion host to access the target instances through SSH.

Câu hỏi yêu cầu kết nối RDP (Windows), không liên quan đến kết nối SSH, không đúng yêu cầu

❌ Configure AWS IAM Identity Center to integrate with the on-premises Active Directory by using AWS Managed Microsoft AD. Configure permission sets against user groups for access to Amazon EC2 Instance Connect. Create and use an EC2 Instance Connect endpoint to access the target instances through SSH.

EC2 Instance Connect dùng SSH, không phải RDP

Windows instances không dùng EC2 Instance Connect (vốn là cho Linux SSH)

AWS Managed Microsoft AD sync AD lên cloud, phức tạp hơn AD Connector (không cần sync)

❌ Deploy a managed Active Directory by using AWS Managed Microsoft AD. Establish a trust with the on-premises Active Directory. Configure permission sets against user groups for access to AWS Systems Manager. Connect to target instances by using Systems Manager Session Manager through RDP.

Session Manager dùng để kết nối SSH từ trình duyệt, không phải kết nối RDP, không đáp ứng yêu cầu đề bài

🔑 Tips and tricks:

"RDP" + EC2 Windows → Systems Manager Fleet Manager (browser-based RDP qua SSM)

"On-premises AD" + không muốn sync → AD Connector (proxy, không sync objects)

📖 Reference:

AWS IAM Identity Center with Active Directory - https://docs.aws.amazon.com/singlesignon/latest/userguide/connectawsad.html

AWS Systems Manager Fleet Manager - https://docs.aws.amazon.com/systems-manager/latest/userguide/fleet.html


Question 13:
Skipped
An environmental company is deploying sensors in major cities throughout a country to measure air quality. The sensors connect to AWS IoT Core to ingest timeseries data readings. The company stores the data in Amazon DynamoDB.

For business continuity, the company must have the ability to ingest and store data in two AWS Regions.

Which solution will meet these requirements?


A.
Create an Amazon Route 53 latency-based routing policy. Use AWS IoT Core data endpoints in both Regions as values. Configure DynamoDB streams and cross-Region data replication.

B.
Create a domain configuration for AWS IoT Core in each Region. Create an Amazon Route 53 health check that evaluates domain configuration health. Create a failover routing policy with values for the domain name from the AWS IoT Core domain configurations. Update the DynamoDB table to a global table.

C.
Create a domain configuration for AWS IoT Core in each Region. Create an Amazon Route 53 latency-based routing policy. Use AWS IoT Core data endpoints in both Regions as values. Migrate the data to Amazon MemoryDB and configure cross-Region replication.

D.
Create an Amazon Route 53 alias failover routing policy with values for AWS IoT Core data endpoints in both Regions. Migrate data to Amazon Aurora global tables.

Explanation

📝 Tóm tắt đề:

IoT sensors kết nối qua AWS IoT Core, data lưu trong DynamoDB

Cần khả năng ingest và store data ở hai AWS Regions (business continuity)

→ Yêu cầu: multi-Region IoT ingest + multi-Region data storage

✅ Đáp án đúng:

Create a domain configuration for AWS IoT Core in each Region. Create an Amazon Route 53 health check that evaluates domain configuration health. Create a failover routing policy with values for the domain name from the AWS IoT Core domain configurations. Update the DynamoDB table to a global table.

Domain configuration cho IoT Core trong mỗi Region → devices có thể kết nối đến endpoint riêng của từng Region

Route 53 health check + failover routing → devices tự động chuyển sang Region backup khi primary fail

DynamoDB Global Tables → data tự động replicate giữa hai Regions, sẵn sàng đọc/ghi ở cả hai

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create an Amazon Route 53 alias failover routing policy with values for AWS IoT Core data endpoints in both Regions. Migrate data to Amazon Aurora global tables.

AWS IoT Core data endpoints là FQDN cố định của AWS (không tùy chỉnh được) - không thể dùng làm Route 53 record values trực tiếp

Aurora không phải lựa chọn phù hợp để thay thế DynamoDB trong IoT use case đã và đang dùng DynamoDB

❌ Create a domain configuration for AWS IoT Core in each Region. Create an Amazon Route 53 latency-based routing policy. Use AWS IoT Core data endpoints in both Regions as values. Migrate the data to Amazon MemoryDB and configure cross-Region replication.

MemoryDB là in-memory database, không dùng thay thế cho DynamoDB đóng vai trò là storage lưu trữ lâu dài

Latency-based routing không có cơ chế failover

Vẫn dùng data endpoints, sai như đáp án trên

❌ Create an Amazon Route 53 latency-based routing policy. Use AWS IoT Core data endpoints in both Regions as values. Configure DynamoDB streams and cross-Region data replication.

Vẫn dùng data endpoints, sai như đáp án trên

Latency-based routing không phải failover routing

DynamoDB streams + manual cross-Region replication phức tạp hơn DynamoDB Global Tables

🔑 Tips and tricks:

"IoT Core multi-Region" → cần custom domain configuration (không phải default endpoint)

"Multi-Region ingest" + DNS → Route 53 failover routing (business continuity), không phải latency routing

"Multi-Region database" + DynamoDB → DynamoDB Global Tables (automatic replication, active-active)

📖 Reference:

AWS IoT Core custom domain configurations - https://docs.aws.amazon.com/iot/latest/developerguide/iot-custom-endpoints.html

Amazon DynamoDB Global Tables - https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html


Question 14:
Skipped
A company needs its remote employees to access the web interface of an application. The company hosts the application in a VPC in the AWS Cloud. The application runs on a fleet of Amazon EC2 instances in private subnets across multiple Availability Zones.

The remote employees are not currently using a corporate VPN connection. Company policy does not allow a direct connection from the public internet to the application.

Which solution will meet these requirements?


A.
Create a network ACL. Add inbound and outbound rules for the IP addresses of the remote employees. Associate the private subnets with the network ACL. Update the existing security group that is associated with the fleet of EC2 instances to permit the IP addresses of the remote employees.

B.
Create a customer gateway by using the company's external IP address. Create a virtual private gateway, and attach it to the VPC. Create an AWS Site-to-Site VPN connection between the customer gateway and the virtual private gateway. Modify the route table to route corporate traffic back to the customer gateway.

C.
Generate server and client certificates and keys. Create an AWS Client VPN endpoint. Associate the private subnets with the Client VPN endpoint. Authorize the remote employees to access the VPC. Download the Client VPN endpoint configuration file to use in the remote employees' VPN client application.

D.
Create a transit gateway in the VPC. Associate the private subnets with the transit gateway. Enable AWS Client VPN connection endpoints on the transit gateway. Deploy the Client VPN software to each of the remote employees. Configure route tables to route traffic between the Client VPN connections and the private subnets.

Explanation

📝 Tóm tắt đề:

Remote employees cần truy cập web app trong private subnets (EC2)

Employees không dùng VPN công ty hiện tại

Policy: không cho phép kết nối trực tiếp từ internet vào application

→ Yêu cầu: secure remote access không qua public internet trực tiếp

✅ Đáp án đúng:

Generate server and client certificates and keys. Create an AWS Client VPN endpoint. Associate the private subnets with the Client VPN endpoint. Authorize the remote employees to access the VPC. Download the Client VPN endpoint configuration file to use in the remote employees' VPN client application.

AWS Client VPN là managed VPN service cho phép các clients kết nối đến VPC

Sau khi kết nối, employee có private IP trong VPC và truy cập EC2 instances trong private subnets qua private network

Không cần mở port hay expose application ra internet trực tiếp

Mutual TLS authentication (server + client certificates) đảm bảo security

Các đáp án sai:

❌ Create a customer gateway by using the company's external IP address. Create a virtual private gateway, and attach it to the VPC. Create an AWS Site-to-Site VPN connection between the customer gateway and the virtual private gateway. Modify the route table to route corporate traffic back to the customer gateway.

Site-to-Site VPN kết nối hai mạng (mạng công ty → VPC) dùng cho kiến trúc hybrid vừa chạy local vừa chạy cloud, không dùng cho mục đích kết nối mạng từ nhà của nhân viên đến VPC

❌ Create a transit gateway in the VPC. Associate the private subnets with the transit gateway. Enable AWS Client VPN connection endpoints on the transit gateway. Deploy the Client VPN software to each of the remote employees. Configure route tables to route traffic between the Client VPN connections and the private subnets.

Client VPN endpoints không được tạo trên Transit Gateway - đây là kiến trúc không hợp lệ

❌ Create a network ACL. Add inbound and outbound rules for the IP addresses of the remote employees. Associate the private subnets with the network ACL. Update the existing security group that is associated with the fleet of EC2 instances to permit the IP addresses of the remote employees.

NACL + Security Group cấp quyền access trực tiếp từ IP của nhân viên, tức là allow kết nối qua internet → vi phạm policy "no direct internet connection"

🔑 Tips and tricks:

"Remote employees" + "access private resources" + "no VPN currently" → AWS Client VPN

📖 Reference:

AWS Client VPN - https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/what-is.html

Getting started with AWS Client VPN - https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/cvpn-getting-started.html


Question 15:
Skipped
A company runs an event-driven serverless data processing application in the eu-west-1 Region. The company uses Amazon EventBridge as the event broker. The company must ensure that all events are available in the us-east-1 Region for audits. The company creates a new AWS Lambda function in us-east-1 to perform the audits.

Which additional step will meet this requirement?


A.
Create an EventBridge archive for the event bus in eu-west-1. Configure cross-Region replication to us-east-1. Replay the EventBridge archive in us-east-1 to invoke the audit Lambda function.

B.
Create an Amazon SNS topic in us-east-1. Set the audit Lambda function as the target for the SNS topic. Create an EventBridge rule that matches all events in eu-west-1. Configure the SNS topic in us-east-1 as the target for the rule.

C.
Create a new custom event bus for EventBridge in us-east-1. Create an EventBridge rule that matches all events in eu-west-1. Set the event bus in us-east-1 as the target for the rule. Create a second EventBridge rule in us-east-1. Configure the second rule to invoke the audit Lambda function.

D.
Create a new EventBridge rule that matches all events in eu-west-1. Configure the rule to invoke the audit Lambda function in us-east-1.

Explanation

📝 Tóm tắt đề:

Event-driven app ở eu-west-1 dùng EventBridge

Cần đảm bảo tất cả events có sẵn ở us-east-1 để audit

Lambda function audit đã được tạo ở us-east-1

→ Yêu cầu: cross-Region event forwarding eu-west-1 → us-east-1 → invoke Lambda

✅ Đáp án đúng:

Create a new custom event bus for EventBridge in us-east-1. Create an EventBridge rule that matches all events in eu-west-1. Set the event bus in us-east-1 as the target for the rule. Create a second EventBridge rule in us-east-1. Configure the second rule to invoke the audit Lambda function.

Cross-Region event routing: EventBridge hỗ trợ dùng event bus ở Region khác làm target của rule

Rule trong eu-west-1 bắt tất cả events → forward đến custom event bus ở us-east-1

Rule thứ hai trong us-east-1 → invoke Lambda function audit

Đây là pattern chuẩn cho cross-Region event routing với EventBridge

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create a new EventBridge rule that matches all events in eu-west-1. Configure the rule to invoke the audit Lambda function in us-east-1.

Lambda không thể làm cross-Region target trực tiếp cho EventBridge rule từ eu-west-1

EventBridge rule chỉ invoke Lambda trong cùng Region với rule đó

Cần event bus trung gian ở us-east-1 để xử lý cross-Region delivery

❌ Create an Amazon SNS topic in us-east-1. Set the audit Lambda function as the target for the SNS topic. Create an EventBridge rule that matches all events in eu-west-1. Configure the SNS topic in us-east-1 as the target for the rule.

Tương tự vấn đề trên: SNS topic cross-Region không thể làm target trực tiếp cho EventBridge rule từ Region khác

EventBridge rule chỉ gửi đến SNS trong cùng Region

❌ Create an EventBridge archive for the event bus in eu-west-1. Configure cross-Region replication to us-east-1. Replay the EventBridge archive in us-east-1 to invoke the audit Lambda function.

EventBridge Archive dùng để replay events, không phải real-time forwarding

Không có tính năng "cross-Region replication" tự động cho EventBridge archive

🔑 Tips and tricks:

"Cross-Region EventBridge" → cần event bus ở target Region làm trung gian

EventBridge rule chỉ invoke target trong cùng Region trừ khi target là event bus ở Region khác

📖 Reference:

Cross-Region event routing with Amazon EventBridge - https://aws.amazon.com/blogs/compute/introducing-cross-region-event-routing-with-amazon-eventbridge/

Sending and receiving events between AWS accounts - https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-cross-account.html


Question 16:
Skipped
A company runs a containerized application that makes predictions based on client messages that arrive in near real time. The number of messages that the application processes each day varies. The number ranges from a few messages each minute to up to 200,000 messages each minute.

The company needs a solution to scale the application to meet the variable message demand. The solution also must retain all messages for 48 hours for audits.

Which solution will meet these requirements?


A.
Create an Amazon SQS queue for the messages. Deploy the application on Amazon ECS and configure scheduled scaling. Create a second SQS queue with a 48-hour retention period to retain processed messages.

B.
Create an Amazon SNS topic for the messages. Deploy the application on Amazon EKS. Configure the Horizontal Pod Autoscaler and the Cluster Autoscaler to scale based on SNS topic metrics. Subscribe an Amazon SQS queue to the SNS topic with a 48-hour retention period to retain processed messages.

C.
Create an Amazon SNS topic for the messages. Deploy the application on Amazon ECS. Configure ECS service auto scaling to scale based on Amazon CloudWatch metrics. Configure SNS message filtering to route messages to ECS tasks. Subscribe an Amazon SQS queue to the SNS topic with a 48-hour retention period to retain processed messages.

D.
Create an Amazon SQS queue for the messages. Deploy the application on Amazon EKS. Configure the Horizontal Pod Autoscaler and the Cluster Autoscaler to scale based on the size of the SQS queue. Create a second SQS queue with a 48-hour retention period to retain processed messages.

Explanation

📝 Tóm tắt đề:

Containerized application xử lý messages theo near real-time

Traffic biến động: vài messages/phút đến 200,000 messages/phút

Phải lưu lại tất cả messages 48 giờ để audit

→ Yêu cầu: scale theo message demand + message retention 48h

✅ Đáp án đúng:

Create an Amazon SQS queue for the messages. Deploy the application on Amazon EKS. Configure the Horizontal Pod Autoscaler and the Cluster Autoscaler to scale based on the size of the SQS queue. Create a second SQS queue with a 48-hour retention period to retain processed messages.

SQS là queue service giúp buffer phù hợp cho load biến động từ vài message đến 200,000 messages/phút

HPA (Horizontal Pod Autoscaler) scale pods dựa trên số lượng message có trong SQS

Cluster Autoscaler scale nodes khi cần thêm capacity cho pods

SQS hỗ trợ retention period lên đến 14 ngày → 48 giờ hoàn toàn khả thi

Second SQS queue với 48h retention lưu messages đã process để audit

Các đáp án sai:

❌ Create an Amazon SNS topic for the messages. Deploy the application on Amazon EKS. Configure the Horizontal Pod Autoscaler and the Cluster Autoscaler to scale based on SNS topic metrics. Subscribe an Amazon SQS queue to the SNS topic with a 48-hour retention period to retain processed messages.

SNS không có metrics phù hợp để scale HPA do SNS là pub/sub service, không phải service buffer messages

SNS không có cơ chế lưu messages để audit

❌ Create an Amazon SQS queue for the messages. Deploy the application on Amazon ECS and configure scheduled scaling. Create a second SQS queue with a 48-hour retention period to retain processed messages.

Scheduled scaling không phù hợp cho traffic không thể đoán trước (unpredictable variable load)

Chỉ phù hợp cho traffic tăng theo lịch đã biết trước

❌ Create an Amazon SNS topic for the messages. Deploy the application on Amazon ECS. Configure ECS service auto scaling to scale based on Amazon CloudWatch metrics. Configure SNS message filtering to route messages to ECS tasks. Subscribe an Amazon SQS queue to the SNS topic with a 48-hour retention period to retain processed messages.

Vẫn dùng SNS, sai như đáp án trên

🔑 Tips and tricks:

SQS có thời gian lưu trữ từ 1 phút đến 14 ngày

Pattern scale theo số lượng message trong queue thường sẽ là đáp án đúng

📖 Reference:

Amazon SQS message retention - https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html

Horizontal Pod Autoscaling - https://docs.aws.amazon.com/eks/latest/userguide/horizontal-pod-autoscaler.html


Question 17:
Skipped
A solutions architect is auditing the security setup of an AWS Lambda function for a company. The Lambda function retrieves the latest changes from an Amazon Aurora database. The database runs in a VPC that the Lambda function can access. Lambda environment variables are providing the database credentials to the Lambda function.

The Lambda function aggregates data and makes the data available in an Amazon S3 bucket that is configured for server-side encryption with AWS KMS managed encryption keys (SSE-KMS). The data must not travel across the internet. If any database credentials become compromised, the company needs a solution that minimizes the impact of the compromise.

What should the solutions architect recommend to meet these requirements?


A.
Save the database credentials in AWS Secrets Manager. Set up password rotation on the credentials in Secrets Manager. Change the IAM role for the Lambda function to allow the function to access Secrets Manager. Modify the Lambda function to retrieve the credentials from Secrets Manager. Enforce HTTPS on the connection to Amazon S3 during data transfers.

B.
Save the database credentials in AWS Systems Manager Parameter Store. Set up password rotation on the credentials in Parameter Store. Change the IAM role for the Lambda function to allow the function to access Parameter Store. Modify the Lambda function to retrieve the credentials from Parameter Store. Deploy a gateway VPC endpoint for Amazon S3 in the VPC.

C.
Enable IAM database authentication on the Aurora DB cluster. Change the IAM role for the Lambda function to allow the function to access the database by using IAM database authentication. Enforce HTTPS on the connection to Amazon S3 during data transfers.

D.
Enable IAM database authentication on the Aurora DB cluster. Change the IAM role for the Lambda function to allow the function to access the database by using IAM database authentication. Deploy a gateway VPC endpoint for Amazon S3 in the VPC.

Explanation

📝 Tóm tắt đề:

Lambda function kết nối Aurora database trong VPC, credentials từ environment variables

S3 bucket dùng SSE-KMS, data không được đi qua internet

Nếu credentials bị hack → minimize impact (giảm thiểu ảnh hưởng)

✅ Đáp án đúng:

Enable IAM database authentication on the Aurora DB cluster. Change the IAM role for the Lambda function to allow the function to access the database by using IAM database authentication. Deploy a gateway VPC endpoint for Amazon S3 in the VPC.

IAM database authentication: Lambda lấy xác thực với Aurora thông qua IAM Role, không cần lưu username / password ở đâu cả

Sử dụng IAM role thì gần như không thể bị hack, nếu có thì cũng có thể thu hồi permissions ngay → impact tối thiểu (không như static password)

Gateway VPC Endpoint cho S3: data đi từ Lambda/VPC đến S3 qua AWS private network, không qua internet → đáp ứng yêu cầu "data must not travel across the internet"

Các đáp án sai:

❌ Enable IAM database authentication on the Aurora DB cluster. Change the IAM role for the Lambda function to allow the function to access the database by using IAM database authentication. Enforce HTTPS on the connection to Amazon S3 during data transfers.

HTTPS on S3 connection: HTTPS encrypt in transit nhưng traffic vẫn có thể đi qua internet

Yêu cầu rõ ràng là "data must not travel across the internet" → cần VPC endpoint, không phải chỉ HTTPS

Gateway VPC endpoint mới là thứ đảm bảo traffic không rời khỏi AWS network

❌ Save the database credentials in AWS Systems Manager Parameter Store. Set up password rotation on the credentials in Parameter Store. Change the IAM role for the Lambda function to allow the function to access Parameter Store. Modify the Lambda function to retrieve the credentials from Parameter Store. Deploy a gateway VPC endpoint for Amazon S3 in the VPC.

Parameter Store với password rotation vẫn là static credential (chỉ rotate định kỳ)

Nếu credentials bị hack, attacker vẫn có quyền truy cập cho đến khi rotate lần tiếp theo

❌ Save the database credentials in AWS Secrets Manager. Set up password rotation on the credentials in Secrets Manager. Change the IAM role for the Lambda function to allow the function to access Secrets Manager. Modify the Lambda function to retrieve the credentials from Secrets Manager. Enforce HTTPS on the connection to Amazon S3 during data transfers.

Secrets Manager rotation tốt hơn Parameter Store nhưng vẫn là username / password, bị hack thì vẫn có ảnh hưởng cho đến lần rotation tiếp theo

HTTPS không đảm bảo traffic không đi qua internet

Không đáp ứng yêu cầu "minimize impact when credentials compromised" vì vẫn có static credentials

🔑 Tips and tricks:

"Minimize impact if credentials compromised" → IAM database authentication (không có static credentials)

"Data must not traverse internet" + S3 access từ VPC → Gateway VPC Endpoint (miễn phí)

📖 Reference:

IAM database authentication for Aurora - https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html

Gateway endpoints for Amazon S3 - https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html


Question 18:
Skipped
A company is developing a new on-demand video application that is based on microservices. The application will have 5 million users at launch and will have 30 million users after 6 months. The company has deployed the application on Amazon ECS on AWS Fargate. The company developed the application by using ECS services that use the HTTPS protocol.

A solutions architect needs to implement updates to the application by using blue/green deployments. The solution must distribute traffic to each ECS service through a load balancer. The application must automatically adjust the number of tasks in response to an Amazon CloudWatch alarm.

Which solution will meet these requirements?


A.
Configure the ECS services to use the blue/green deployment type and an Application Load Balancer. Implement an Auto Scaling group for each ECS service by using the Cluster Autoscaler.

B.
Configure the ECS services to use the blue/green deployment type and an Application Load Balancer. Implement Service Auto Scaling for each ECS service.

C.
Configure the ECS services to use the blue/green deployment type and a Network Load Balancer. Request increases to the service quota for tasks per service to meet the demand.

D.
Configure the ECS services to use the blue/green deployment type and a Network Load Balancer. Implement an Auto Scaling group for each ECS service by using the Cluster Autoscaler.

Explanation

📝 Tóm tắt đề:

ECS Fargate microservices, HTTPS protocol

Cần blue/green deployments

Load balancer distribute traffic đến mỗi ECS service

Tự động scale dựa trên CloudWatch alarm

→ Yêu cầu: blue/green + ALB + auto scaling theo CloudWatch

✅ Đáp án đúng:

Configure the ECS services to use the blue/green deployment type and an Application Load Balancer. Implement Service Auto Scaling for each ECS service.

Có thể dùng CodeDeploy để triển khai Blue/green deployment trong ECS là phù hợp

ALB là lựa chọn chuẩn cho HTTPS/HTTP protocol với blue/green ECS (hỗ trợ weighted target group routing, traffic shifting)

ECS Service Auto Scaling scale số lượng tasks dựa trên CloudWatch metrics/alarms

Các đáp án sai:

❌ Configure the ECS services to use the blue/green deployment type and a Network Load Balancer. Request increases to the service quota for tasks per service to meet the demand.

NLB không phù hợp cho giao thức HTTPS đề bài yêu cầu (phù hợp cho TCP/UDP)

"Request increases to service quota" không phải auto scaling - là manual process thủ công

Không có cơ chế để tự động scale theo CloudWatch alarm

❌ Configure the ECS services to use the blue/green deployment type and a Network Load Balancer. Implement an Auto Scaling group for each ECS service by using the Cluster Autoscaler.

Cluster Autoscaler dành cho EC2 nodes, không dùng được với Fargate (serverless, không có nodes)

Vẫn dùng NLB, sai như trên

❌ Configure the ECS services to use the blue/green deployment type and an Application Load Balancer. Implement an Auto Scaling group for each ECS service by using the Cluster Autoscaler.

Dùng cluster autoscaler, sai như trên

🔑 Tips and tricks:

ECS blue/green = CodeDeploy deployment type + ALB

"HTTPS protocol" + blue/green → ALB, loại NLB

"Auto scale based on CloudWatch alarm" + Fargate → ECS Service Auto Scaling (scale tasks)

Cluster Autoscaler = scale EC2 nodes trong EKS/ECS EC2; không dùng cho Fargate

📖 Reference:

CodeDeploy blue/green deployments for Amazon ECS - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-bluegreen.html

Amazon ECS Service Auto Scaling - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-auto-scaling.html


Question 19:
Skipped
A company has millions of objects in an Amazon S3 bucket. The objects are in the S3 Standard storage class. The number of users and applications that access the objects is increasing rapidly. Most of the objects in the S3 bucket are accessed frequently. The S3 objects are encrypted with server-side encryption with AWS KMS keys (SSE-KMS).

A solutions architect reviewed the company's monthly AWS invoice and noticed that AWS KMS costs are increasing because of the high number of requests from Amazon S3. The solutions architect needs to optimize costs with minimal changes to the application. Company policy mandates the use of customer managed keys.

Which solution will meet these requirements?


A.
Create a new S3 bucket that uses server-side encryption with Amazon S3 managed keys (SSE-S3). Use S3 Batch Operations to copy the existing objects to the new S3 bucket. Configure an Amazon EventBridge rule to delete the old S3 bucket after the copy operation is successful.

B.
Enable S3 Bucket Key with SSE-KMS on the existing S3 bucket. Use the S3 Batch Operations copy operation to copy existing objects and write the existing objects back to the same S3 bucket as objects encrypted with the S3 Bucket Key. Set up an S3 Lifecycle expiration policy for noncurrent versions.

C.
Use AWS CloudHSM to store the encryption keys. Create a new S3 bucket. Use S3 Batch Operations to copy the existing objects to the new S3 bucket. Encrypt the objects by using the keys from CloudHSM. Set up an S3 Lifecycle expiration policy for noncurrent versions.

D.
Use the S3 Intelligent-Tiering storage class for the S3 bucket. Create an S3 Intelligent-Tiering archive configuration to transition objects that are not accessed for 90 days to S3 Glacier Deep Archive.

Explanation

📝 Tóm tắt đề:

Hàng triệu S3 objects với SSE-KMS, accessed frequently (truy cập nhiều)

KMS costs tăng cao do high number of requests từ S3

Company policy: phải dùng customer managed keys (không thể chuyển sang SSE-S3)

→ Yêu cầu: giảm KMS costs với minimal changes to application

✅ Đáp án đúng:

Enable S3 Bucket Key with SSE-KMS on the existing S3 bucket. Use the S3 Batch Operations copy operation to copy existing objects and write the existing objects back to the same S3 bucket as objects encrypted with the S3 Bucket Key. Set up an S3 Lifecycle expiration policy for noncurrent versions.

S3 Bucket Key tạo một bucket-level data key từ KMS, dùng key đó để encrypt nhiều objects → giảm số lần gọi KMS API lên đến 99%

Thay vì mỗi object GET/PUT gọi KMS một lần, S3 Bucket Key được cache tạm thời → nhiều requests dùng chung một KMS call

S3 Batch Operations copy objects về cùng bucket để áp dụng S3 Bucket Key cho objects hiện tại

Vẫn dùng customer managed keys (KMS CMK) → đáp ứng company policy

Các đáp án sai:

❌ Create a new S3 bucket that uses server-side encryption with Amazon S3 managed keys (SSE-S3). Use S3 Batch Operations to copy the existing objects to the new S3 bucket. Configure an Amazon EventBridge rule to delete the old S3 bucket after the copy operation is successful.

Như đề bài đã đề cập, sử dụng SSE-S3 là vi phạm company policy

Thay đổi encryption type toàn bộ objects là thay đổi lớn, không phải "minimal changes"

❌ Use AWS CloudHSM to store the encryption keys. Create a new S3 bucket. Use S3 Batch Operations to copy the existing objects to the new S3 bucket. Encrypt the objects by using the keys from CloudHSM.

S3 không tương tác trực tiếp với CloudHSM cho object encryption

Phức tạp và tốn kém hơn nhiều so với S3 Bucket Key

❌ Use the S3 Intelligent-Tiering storage class for the S3 bucket. Create an S3 Intelligent-Tiering archive configuration to transition objects that are not accessed for 90 days to S3 Glacier Deep Archive.

S3 Intelligent-Tiering giúp tự động phân bố các file vào tầng lưu trữ phù hợp, giúp giảm storage costs, không giảm KMS API call costs

Glacier Deep Archive lưu trữ objects ít access - nhưng vấn đề là objects frequently accessed, không đáp ứng yêu cầu

Không giải quyết nguyên nhân ban đầu: quá nhiều KMS requests

🔑 Tips and tricks:

"KMS costs tăng" + "S3 SSE-KMS" → S3 Bucket Key, giảm KMS API calls lên đến 99%

Existing objects cần S3 Batch Operations copy-to-self để áp dụng S3 Bucket Key

"Minimal changes to application" → không cần thay đổi application code, chỉ cấu hình S3

📖 Reference:

Reducing the cost of SSE-KMS with Amazon S3 Bucket Keys - https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html

Amazon S3 Batch Operations - https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html


Question 20:
Skipped
A company is building a solution in the AWS Cloud. Thousands of devices will connect to the solution and send data. Each device needs to be able to send and receive data in real time over the MQTT protocol. Each device must authenticate by using a unique X.509 certificate.

Which solution will meet these requirements with the LEAST operational overhead?


A.
Set up an Amazon API Gateway HTTP API and a Network Load Balancer (NLB). Create integration between API Gateway and the NLB. Configure a mutual TLS certificate authorizer on the HTTP API. Run an MQTT broker on an Amazon EC2 instance that the NLB targets. Connect each device to the NLB.

B.
Set up AWS IoT Core. For each device, create a corresponding AWS IoT thing and provision a certificate. Connect each device to AWS IoT Core.

C.
Create a Network Load Balancer (NLB) and configure it with an AWS Lambda authorizer. Run an MQTT broker on Amazon EC2 instances in an Auto Scaling group. Set the Auto Scaling group as the target for the NLB. Connect each device to the NLB.

D.
Set up AWS IoT Core. For each device, create a corresponding Amazon MQ queue and provision a certificate. Connect each device to Amazon MQ.

Explanation

📝 Tóm tắt đề:

Thousands of devices kết nối qua MQTT protocol

Mỗi device authenticate bằng X.509 certificate duy nhất

→ Yêu cầu: LEAST operational overhead

✅ Đáp án đúng:

Set up AWS IoT Core. For each device, create a corresponding AWS IoT thing and provision a certificate. Connect each device to AWS IoT Core.

AWS IoT Core là managed service được thiết kế chính xác cho usecase IoT, hỗ trợ giao thức MQTT + X.509 certificates

Hỗ trợ hàng triệu thiết bị, scale tự động không cần quản lý infrastructure

Mỗi device là một IoT Thing với X.509 certificate riêng → authenticate và authorize qua IoT Core policies

Không cần quản lý MQTT broker, load balancer, hay certificates infrastructure riêng biệt nào cả → operational overhead thấp nhất

Các đáp án sai:

❌ Set up AWS IoT Core. For each device, create a corresponding Amazon MQ queue and provision a certificate. Connect each device to Amazon MQ.

Amazon MQ là managed message broker (ActiveMQ/RabbitMQ), không phải IoT platform

Amazon MQ không hỗ trợ X.509 per-device authentication giống như IoT Core

Tạo riêng một MQ queue cho mỗi device là anti-pattern - không scale được với thousands of devices

IoT Core phù hợp hơn nhiều cho IoT MQTT use case

❌ Create a Network Load Balancer (NLB) and configure it with an AWS Lambda authorizer. Run an MQTT broker on Amazon EC2 instances in an Auto Scaling group. Set the Auto Scaling group as the target for the NLB. Connect each device to the NLB.

Self-managed MQTT broker trên EC2 = high operational overhead (quản lý EC2, MQTT software, certificates, scaling)

Lambda authorizer trên NLB không phải cơ chế X.509 authentication chuẩn cho IoT

Vi phạm "least operational overhead"

❌ Set up an Amazon API Gateway HTTP API and a Network Load Balancer (NLB). Create integration between API Gateway and the NLB. Configure a mutual TLS certificate authorizer on the HTTP API. Run an MQTT broker on an Amazon EC2 instance that the NLB targets. Connect each device to the NLB.

API Gateway HTTP API không hỗ trợ MQTT protocol (hỗ trợ HTTP/WebSocket, không phải MQTT)

Self-managed MQTT broker trên EC2 = high overhead

Kiến trúc phức tạp không cần thiết khi IoT Core đã giải quyết toàn bộ

🔑 Tips and tricks:

"MQTT protocol" + "X.509 certificate" + "thousands of devices" → AWS IoT Core

📖 Reference:

AWS IoT Core - https://docs.aws.amazon.com/iot/latest/developerguide/what-is-aws-iot.html

X.509 client certificates - https://docs.aws.amazon.com/iot/latest/developerguide/x509-client-certs.html


Question 21:
Skipped
A company runs a Java application that has complex dependencies on VMs that are in the company's data center. The application is stable, but the company wants to modernize the technology stack. The company wants to migrate the application to AWS and minimize the administrative overhead to maintain the servers.

Which solution will meet these requirements with the LEAST code changes?


A.
Migrate the application code to a container that runs in AWS Lambda. Configure Lambda to use an Application Load Balancer (ALB). Use the ALB to interact with the application.

B.
Migrate the application to Amazon EKS on EKS managed node groups by using AWS App2Container. Store container images in Amazon ECR. Give the EKS nodes permission to access the ECR image repository. Use Amazon API Gateway to interact with the application.

C.
Migrate the application code to a container that runs in AWS Lambda. Build an Amazon API Gateway REST API with Lambda integration. Use API Gateway to interact with the application.

D.
Migrate the application to Amazon ECS on AWS Fargate by using AWS App2Container. Store container images in Amazon ECR. Grant the ECS task execution role permission to access the ECR image repository. Configure Amazon ECS to use an Application Load Balancer (ALB). Use the ALB to interact with the application.

Explanation

📝 Tóm tắt đề:

Java application với complex VM dependencies trên on-premises

Muốn migrate lên AWS, minimize administrative overhead

→ Yêu cầu: LEAST code changes

✅ Đáp án đúng:

Migrate the application to Amazon ECS on AWS Fargate by using AWS App2Container. Store container images in Amazon ECR. Grant the ECS task execution role permission to access the ECR image repository. Configure Amazon ECS to use an Application Load Balancer (ALB). Use the ALB to interact with the application.

AWS App2Container là service có khả năng hỗ trợ container hoá ứng dụng Java chạy trên VM mà không cần source code hay thay đổi code gì cả

App2Container phân tích running application, tạo Dockerfile và container image, deploy lên ECS

ECS Fargate = serverless containers → không quản lý EC2 infrastructure

ECR lưu container images; ALB xử lý traffic

LEAST code changes vì không cần refactor lại application

Các đáp án sai:

❌ Migrate the application code to a container that runs in AWS Lambda. Build an Amazon API Gateway REST API with Lambda integration. Use API Gateway to interact with the application.

Sử dụng kiến trúc API GW + Lambda sẽ cần refactor code theo các cú pháp của Lambda & API GW → vi phạm "LEAST code changes"

❌ Migrate the application to Amazon EKS on EKS managed node groups by using AWS App2Container. Store container images in Amazon ECR. Give the EKS nodes permission to access the ECR image repository. Use Amazon API Gateway to interact with the application.

App2Container hỗ trợ EKS nhưng EKS managed node groups = EC2 nodes → phải quản lý EC2 làm tăng administrative overhead cao hơn Fargate

EKS có operational complexity cao hơn ECS Fargate

❌ Migrate the application code to a container that runs in AWS Lambda. Configure Lambda to use an Application Load Balancer (ALB). Use the ALB to interact with the application.

Vẫn dùng Lambda nên sẽ vẫn phát sinh việc phải refactor code, không đáp ứng yêu cầu đề bài

🔑 Tips and tricks:

"Complex dependencies" + "least code changes" + migrate Java app → AWS App2Container (lift-and-shift containerization)

"Minimize admin overhead" + containers → Fargate (serverless, không quản lý nodes)

📖 Reference:

AWS App2Container - https://docs.aws.amazon.com/app2container/latest/UserGuide/what-is-a2c.html

Amazon ECS with AWS Fargate - https://docs.aws.amazon.com/AmazonECS/latest/userguide/what-is-fargate.html


Question 22:
Skipped
A company is running an application in the AWS Cloud. The application consists of microservices that run on a fleet of Amazon EC2 instances in multiple Availability Zones behind an Application Load Balancer. The company recently added a new REST API that was implemented in Amazon API Gateway. Some of the older microservices that run on EC2 instances need to call this new API.

The company does not want the API to be accessible from the public internet and does not want proprietary data to traverse the public internet.

What should a solutions architect do to meet these requirements?


A.
Create an interface VPC endpoint for API Gateway, and set an endpoint policy to only allow access to the specific API. Add a resource policy to API Gateway to only allow access from the VPC endpoint. Change the API Gateway endpoint type to private.

B.
Create an AWS Site-to-Site VPN connection between the VPC and the API Gateway. Use API Gateway to generate a unique API key for each microservice. Configure the API methods to require the key.

C.
Modify the API Gateway to use IAM authentication. Update the IAM policy for the IAM role that is assigned to the EC2 instances to allow access to the API Gateway. Move the API Gateway into a new VPC. Deploy a transit gateway and connect the VPCs.

D.
Create an accelerator in AWS Global Accelerator, and connect the accelerator to the API Gateway. Update the route table for all VPC subnets with a route to the created Global Accelerator endpoint IP address. Add an API key for each service to use for authentication.

Explanation

📝 Tóm tắt đề:

EC2 microservices trong VPC cần gọi REST API Gateway mới

Không muốn API accessible từ public internet

Không muốn data đi qua public internet

→ Yêu cầu: private API Gateway access từ trong VPC

✅ Đáp án đúng:

Create an interface VPC endpoint for API Gateway, and set an endpoint policy to only allow access to the specific API. Add a resource policy to API Gateway to only allow access from the VPC endpoint. Change the API Gateway endpoint type to private.

Interface VPC Endpoint cho API Gateway tạo private connection từ VPC đến API Gateway qua AWS private network (PrivateLink) - không cần đi ra internet

Endpoint policy trên VPC endpoint: hạn chế truy cập chỉ cho phép kết nối đến một API cụ thể

Resource policy trên API Gateway: chỉ allow requests từ VPC endpoint đó (aws:sourceVpce)

Private endpoint type: API Gateway không publish endpoint ra internet - chỉ có thể truy cập thông qua VPC endpoints

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create an AWS Site-to-Site VPN connection between the VPC and the API Gateway. Use API Gateway to generate a unique API key for each microservice. Configure the API methods to require the key.

API Gateway không thể làm VPN endpoint - Site-to-Site VPN kết nối on-premises → VPC, không phải VPC → API Gateway

Không giải quyết vấn đề "data không đi qua internet"

❌ Modify the API Gateway to use IAM authentication. Update the IAM policy for the IAM role that is assigned to the EC2 instances to allow access to the API Gateway. Move the API Gateway into a new VPC. Deploy a transit gateway and connect the VPCs.

API Gateway không thể "move into a VPC" - API Gateway là regional service, không chạy trong VPC

Transit gateway kết nối VPCs với nhau, không có tác dụng gì cho việc kết nối đến API GW

❌ Create an accelerator in AWS Global Accelerator, and connect the accelerator to the API Gateway. Update the route table for all VPC subnets with a route to the created Global Accelerator endpoint IP address. Add an API key for each service to use for authentication.

Global Accelerator không support target là API gateway, vô lý

🔑 Tips and tricks:

"Private API Gateway" + "no internet" + VPC access → Interface VPC Endpoint + Private endpoint type

📖 Reference:

Creating a private API in Amazon API Gateway - https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-private-apis.html

Interface VPC endpoints for API Gateway - https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-private-api-test-invoke-url.html


Question 23:
Skipped
A company is developing a new service that will be accessed using TCP on a static port. A solutions architect must ensure that the service is highly available, has redundancy across Availability Zones, and is accessible using the DNS name my.service.com, which is publicly accessible. The service must use fixed address assignments so other companies can add the addresses to their allow lists.

Assuming that resources are deployed in multiple Availability Zones in a single Region, which solution will meet these requirements?


A.
Create an Amazon ECS cluster and a service definition for the application. Create and assign public IP address for each host in the cluster. Create an Application Load Balancer (ALB) and expose the static TCP port. Create a target group and assign the ECS service definition name to the ALB. Create a new CNAME record set and associate the public IP addresses to the record set. Provide the Elastic IP addresses of the Amazon EC2 instances to the other companies to add to their allow lists.

B.
Create Amazon EC2 instances for the service. Create one Elastic IP address for each Availability Zone. Create a Network Load Balancer (NLB) and expose the assigned TCP port. Assign the Elastic IP addresses to the NLB for each Availability Zone. Create a target group and register the EC2 instances with the NLB. Create a new A (alias) record set named my.service.com, and assign the NLB DNS name to the record set. Provide the Elastic IP addresses of the NLB to the other companies to add to their allow lists.

C.
Create an Amazon ECS cluster and a service definition for the application. Create and assign public IP addresses for the ECS cluster. Create a Network Load Balancer (NLB) and expose the TCP port. Create a target group and assign the ECS cluster name to the NLB. Create a new A record set named my.service.com, and assign the public IP addresses of the ECS cluster to the record set. Provide the public IP addresses of the ECS cluster to the other companies to add to their allow lists.

D.
Create Amazon EC2 instances with an Elastic IP address for each instance. Create a Network Load Balancer (NLB) and expose the static TCP port. Register EC2 instances with the NLB. Create a new name server record set named my.service.com, and assign the Elastic IP addresses of the EC2 instances to the record set. Provide the Elastic IP addresses of the EC2 instances to the other companies to add to their allow lists.

Explanation

📝 Tóm tắt đề:

Service TCP trên static port, multi-AZ trong một Region

Cần DNS name my.service.com publicly accessible

Fixed address assignments (cần IP cố định) để các company khác thêm vào allow lists khi truy cập

→ Yêu cầu: HA + static IPs + DNS + TCP

✅ Đáp án đúng:

Create Amazon EC2 instances for the service. Create one Elastic IP address for each Availability Zone. Create a Network Load Balancer (NLB) and expose the assigned TCP port. Assign the Elastic IP addresses to the NLB for each Availability Zone. Create a target group and register the EC2 instances with the NLB. Create a new A (alias) record set named my.service.com, and assign the NLB DNS name to the record set. Provide the Elastic IP addresses of the NLB to the other companies to add to their allow lists.

NLB hỗ trợ TCP protocol và có thể assign Elastic IPs per AZ (IP Public cố định cho mỗi AZ)

Elastic IPs của NLB không thay đổi → other companies có thể thêm vào allow list cố định

Route 53 A alias record trỏ về NLB DNS name → my.service.com

Các đáp án sai:

❌ Create Amazon EC2 instances with an Elastic IP address for each instance. Create a Network Load Balancer (NLB) and expose the static TCP port. Register EC2 instances with the NLB. Create a new name server record set named my.service.com, and assign the Elastic IP addresses of the EC2 instances to the record set. Provide the Elastic IP addresses of the EC2 instances to the other companies to add to their allow lists.

Elastic IPs gắn trực tiếp vào EC2 instances → sai vì EC2 đứng sau NLB, phải gắn vào NLB mới đúng

Name server record (NS) không phải loại record phù hợp để trỏ đến IP addresses

❌ Create an Amazon ECS cluster and a service definition for the application. Create and assign public IP addresses for the ECS cluster. Create a Network Load Balancer (NLB) and expose the TCP port. Create a target group and assign the ECS cluster name to the NLB. Create a new A record set named my.service.com, and assign the public IP addresses of the ECS cluster to the record set. Provide the public IP addresses of the ECS cluster to the other companies to add to their allow lists.

ECS cluster không có "public IP addresses" fixed - vô lý

"Assign the ECS cluster name to NLB" không phải cách đúng để cấu hình target group

❌ Create an Amazon ECS cluster and a service definition for the application. Create and assign public IP address for each host in the cluster. Create an Application Load Balancer (ALB) and expose the static TCP port. Create a target group and assign the ECS service definition name to the ALB. Create a new CNAME record set and associate the public IP addresses to the record set.

ALB không hỗ trợ TCP - ALB chỉ hỗ trợ HTTP/HTTPS/gRPC

CNAME record trỏ đến IP addresses là không hợp lệ (CNAME phải trỏ đến hostname)

ALB không có fixed IPs để add vào allow lists

🔑 Tips and tricks:

"TCP static port" + "fixed IP for allow lists" → NLB với Elastic IPs per AZ

ALB không hỗ trợ TCP raw; không có static IPs → loại ngay

📖 Reference:

Network Load Balancer - Elastic IP addresses - https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancer-getting-started.html

Amazon Route 53 alias records - https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html


Question 24:
Skipped
A company has several AWS accounts. A development team is building an automation framework for cloud governance and remediation processes. The automation framework uses AWS Lambda functions in a centralized account.

A solutions architect must implement a least privilege permissions policy that allows the centralized Lambda functions to update resources in each of the company's accounts.

Which combination of steps will meet these requirements? (Select TWO.)


A.
In the other accounts, create an IAM role that has minimal required permissions. Add the centralized account's Lambda IAM role as a trusted entity.

B.
In the other accounts, create an IAM role that has permissions to assume the role of the centralized account. Add the Lambda service as a trusted entity.

C.
In the centralized account, create an IAM role that has the Lambda service as a trusted entity. Add an inline policy to assume the roles of the other accounts.

D.
In the centralized account, create an IAM role that has the roles of the other accounts as trusted entities. Provide minimal required permissions.

E.
In the other accounts, create an IAM role that has minimal required permissions. Add the Lambda service as a trusted entity.

Explanation

📝 Tóm tắt đề:

Lambda functions trong centralized account cần update resources ở các account khác

Least privilege cross-account permissions

→ Yêu cầu: centralized Lambda assume role trong other accounts (Select TWO)

✅ Đáp án đúng:

In the centralized account, create an IAM role that has the Lambda service as a trusted entity. Add an inline policy to assume the roles of the other accounts.

Lambda function cần một execution role trong centralized account

Role này cần quyền sts:AssumeRole để assume roles trong các account khác

Lambda service là trusted entity để Lambda có thể assume execution role này

In the other accounts, create an IAM role that has minimal required permissions. Add the centralized account's Lambda IAM role as a trusted entity.

Mỗi account cần một role với permissions để thực hiện actions cần thiết (minimal = least privilege)

Trust policy của role này cho phép centralized account's Lambda execution role assume nó

Pattern chuẩn của cross-account access: assume role → temporary credentials → thực thi actions

Kiến trúc tham khảo:


Các đáp án sai:

❌ In the centralized account, create an IAM role that has the roles of the other accounts as trusted entities. Provide minimal required permissions.

Không thể thêm roles từ other accounts vào trusted entities của centralized account role

Trust policy của một role chỉ tin tưởng principals trong cùng account hoặc ARN cụ thể của 1 đối tượng IAM trong account khác

Logic ngược: role trong centralized account nên trust Lambda service, không phải trust other account roles

❌ In the other accounts, create an IAM role that has permissions to assume the role of the centralized account. Add the Lambda service as a trusted entity.

Logic ngược: role trong other accounts không cần assume role về centralized account, do other account không yêu cầu truy cập về centralized account

Lambda service không phải trusted entity phù hợp cho role trong other accounts, phải là role của centrailized account mới đúng

❌ In the other accounts, create an IAM role that has minimal required permissions. Add the Lambda service as a trusted entity.

Lambda service không thể assume roles trong other accounts khi Lambda đang chạy trong centralized account

Lambda service làm trusted entity → chỉ Lambda functions trong CÙNG account có thể assume role đó

Phải add centralized account's Lambda role ARN làm trusted entity (cross-account), không phải Lambda service

🔑 Tips and tricks:

Cross-account IAM access pattern: (1) Source account: role với permissions sts:AssumeRole; (2) Target account: role với minimal permissions + source account role trong trust policy

Lambda execution role trusted entity = lambda.amazonaws.com

📖 Reference:

IAM roles for cross-account access - https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html

AWS Lambda execution role - https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html


Question 25:
Skipped
A company has an application that runs as a ReplicaSet of multiple pods in an Amazon EKS cluster. The EKS cluster has nodes in multiple Availability Zones. The application generates many small files that must be accessible across all running instances of the application. The company needs to back up the files and retain the backups for 1 year.

Which solution will meet these requirements while providing the FASTEST storage performance?


A.
Create an Amazon EBS volume. Enable the EBS Multi-Attach feature. Configure the ReplicaSet to mount the EBS volume. Direct the application to store files in the EBS volume. Configure AWS Backup to back up and retain copies of the data for 1 year.

B.
Configure the ReplicaSet to use the storage available on each of the running application pods to store the files locally. Use a third-party tool to back up the EKS cluster for 1 year.

C.
Create an Amazon S3 bucket. Configure the ReplicaSet to mount the S3 bucket. Direct the application to store files in the S3 bucket. Configure S3 Versioning to retain copies of the data. Configure an S3 Lifecycle policy to delete objects after 1 year.

D.
Create an Amazon EFS file system and a mount target for each subnet that contains nodes in the EKS cluster. Configure the ReplicaSet to mount the file system. Direct the application to store files in the file system. Configure AWS Backup to back up and retain copies of the data for 1 year.

Explanation

📝 Tóm tắt đề:

EKS ReplicaSet chạy trên nhiều AZs

Application tạo many small files cần accessible across all running instances

Cần backup và retain 1 year

→ Yêu cầu: shared storage, backup 1 năm, FASTEST storage performance

✅ Đáp án đúng:

Create an Amazon EFS file system and a mount target for each subnet that contains nodes in the EKS cluster. Configure the ReplicaSet to mount the file system. Direct the application to store files in the file system. Configure AWS Backup to back up and retain copies of the data for 1 year.

EFS là NFS-compatible file system, có thể được mount đồng thời bởi tất cả pods trong mọi AZ

Mount target trong mỗi subnet → các pods ở các AZs khác nhau đều truy cập được

Fastest shared storage cho small files accessible across multiple pods = EFS (network file system với low latency)

AWS Backup hỗ trợ EFS backup và có thể set retention period 1 năm

Các đáp án sai:

❌ Create an Amazon EBS volume. Enable the EBS Multi-Attach feature. Configure the ReplicaSet to mount the EBS volume. Direct the application to store files in the EBS volume. Configure AWS Backup to back up and retain copies of the data for 1 year.

EBS Multi-Attach chỉ hỗ trợ io1/io2 volumes, chỉ trong cùng một AZ

Pods ở multiple AZs không thể cùng mount một EBS volume (EBS là AZ-specific resource)

Multi-Attach cũng có giới hạn: tối đa 16 Nitro-based instances, chỉ trong cùng AZ

❌ Create an Amazon S3 bucket. Configure the ReplicaSet to mount the S3 bucket. Direct the application to store files in the S3 bucket. Configure S3 Versioning to retain copies of the data. Configure an S3 Lifecycle policy to delete objects after 1 year.

S3 không thể mount như filesystem natively trong Kubernetes (cần S3 CSI driver hoặc FUSE mount)

S3 là object storage với higher latency cho small file operations so với EFS (filesystem)

Câu hỏi yêu cầu "FASTEST storage performance" → EFS nhanh hơn S3

❌ Configure the ReplicaSet to use the storage available on each of the running application pods to store the files locally. Use a third-party tool to back up the EKS cluster for 1 year.

Local pod storage (emptyDir) bị mất khi pod restart - không persistent

Files stored locally trên một pod không accessible từ các pods khác

"Third-party tool" không phải managed AWS solution, không ưu tiên lựa chọn ở đây

🔑 Tips and tricks:

"Shared storage" + "multiple pods/instances" + "across AZs" → EFS (không phải EBS)

EBS Multi-Attach chỉ hoạt động trong cùng AZ → loại khi có "multiple AZs"

AWS Backup hỗ trợ EFS với retention tùy chỉnh

📖 Reference:

Amazon EFS with Amazon EKS - https://docs.aws.amazon.com/eks/latest/userguide/efs-csi.html

AWS Backup for EFS - https://docs.aws.amazon.com/efs/latest/ug/efs-backup-solutions.html


Question 26:
Skipped
A company has a platform that consists of an on-premises single-node Kubernetes cluster. The cluster uses Windows-based and Linux-based file storage as shared storage. The company wants to migrate its platform to AWS.

The cluster has multiple containerized applications that are continuously scanned for operating system vulnerabilities and programming language package vulnerabilities. The company needs a highly available solution that supports monitoring, logging, and multiprotocol shared storage.

Which combination of steps will meet these requirements with the LEAST operational overhead? (Select TWO.)


A.
Replace the existing Kubernetes cluster with a multi-node Amazon EKS cluster that is managed by AWS. Install open source versions of Prometheus and Grafana on Amazon EC2 instances. Store the application Docker images in Amazon ECR. Enable ECR enhanced scanning.

B.
Replace the existing Kubernetes cluster with a single-node Amazon EKS cluster that is managed by AWS. Install Prometheus and Grafana on the EKS cluster by using public Docker images. Store the application Docker images in Amazon ECR. Enable ECR enhanced scanning.

C.
Provision an Amazon FSx for NetApp ONTAP file system. Mount the file system on the containers launched on the Amazon EKS cluster as a persistent volume.

D.
Replace the existing Kubernetes cluster with a multi-node Amazon EKS cluster that is managed by AWS. Set up Amazon Managed Service for Prometheus and Amazon Managed Grafana for monitoring. Store the application Docker images in Amazon ECR. Enable ECR enhanced scanning.

E.
Provision an Amazon FSx for Windows File Server file share and an Amazon EFS file system. Mount the file share and the file system on the containers launched on the Amazon EKS cluster as persistent volumes.

Explanation

📝 Tóm tắt đề:

On-premises single-node Kubernetes, dùng Windows và Linux shared storage

Cần migrate lên AWS với HA (high availability), monitoring, logging, multiprotocol shared storage

Containers được scan liên tục cho OS và language package vulnerabilities

→ Yêu cầu: HA EKS + monitoring + multiprotocol storage (Select TWO)

✅ Đáp án đúng:

Replace the existing Kubernetes cluster with a multi-node Amazon EKS cluster that is managed by AWS. Set up Amazon Managed Service for Prometheus and Amazon Managed Grafana for monitoring. Store the application Docker images in Amazon ECR. Enable ECR enhanced scanning.

Multi-node EKS (không phải single-node) = HA (tính khả dụng cao), nodes được phân phối trên nhiều AZs

Amazon Managed Service for Prometheus + Managed Grafana = fully managed monitoring, không cần quản lý infrastructure

ECR enhanced scanning dùng Amazon Inspector để scan OS vulnerabilities và programming language package vulnerabilities → đáp ứng yêu cầu continuous scanning

Provision an Amazon FSx for NetApp ONTAP file system. Mount the file system on the containers launched on the Amazon EKS cluster as a persistent volume.

FSx for NetApp ONTAP hỗ trợ cả 2 giao thức NFS (Linux) và SMB (Windows) = multiprotocol trong một file system, đáp ứng yêu cầu đề bài sử dụng Window và Linux container

EKS CSI driver cho ONTAP hỗ trợ persistent volumes cho containers

Các đáp án sai:

❌ Replace the existing Kubernetes cluster with a single-node Amazon EKS cluster that is managed by AWS. Install Prometheus and Grafana on the EKS cluster by using public Docker images. Store the application Docker images in Amazon ECR. Enable ECR enhanced scanning.

Single-node không đảm bảo HA (yêu cầu rõ ràng là "highly available solution")

Tự cài Prometheus và Grafana bằng public Docker images = operational overhead cao hơn managed services

❌ Replace the existing Kubernetes cluster with a multi-node Amazon EKS cluster that is managed by AWS. Install open source versions of Prometheus and Grafana on Amazon EC2 instances. Store the application Docker images in Amazon ECR. Enable ECR enhanced scanning.

Open source Prometheus/Grafana trên EC2 = high operational overhead (không phải LEAST overhead)

Amazon Managed Service for Prometheus/Grafana là option với ít overhead hơn nhiều

❌ Provision an Amazon FSx for Windows File Server file share and an Amazon EFS file system. Mount the file share and the file system on the containers launched on the Amazon EKS cluster as persistent volumes.

Hai hệ thống file riêng biệt (FSx for Windows + EFS) = phức tạp hơn, phải mount và quản lý hai volumes

FSx for NetApp ONTAP giải quyết cả hai (NFS + SMB) trong một hệ thống, đơn giản hơn

🔑 Tips and tricks:

"Windows + Linux shared storage" = multiprotocol → FSx for NetApp ONTAP (hỗ trợ NFS + SMB)

"Continuous scanning OS + language packages" → ECR enhanced scanning (Amazon Inspector integration)

"Least operational overhead" + monitoring → Amazon Managed Prometheus + Managed Grafana (không tự quản lý)

FSx for Windows = SMB only; EFS = NFS only; FSx for NetApp ONTAP = SMB + NFS cùng lúc

Multi-node EKS > Single-node EKS cho HA requirement

📖 Reference:

Amazon FSx for NetApp ONTAP - https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/what-is-fsx-ontap.html

Amazon ECR enhanced scanning - https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning-enhanced.html


Question 27:
Skipped
A company is running an application on Amazon EC2 instances in the AWS Cloud. The application uses a MongoDB database with a replica set as its data tier. The MongoDB database is installed on systems in the company's on-premises data center. The MongoDB database is accessible through an AWS Direct Connect connection to the data center environment.

A solutions architect must migrate the on-premises MongoDB database to Amazon DocumentDB.

Which solution will meet these requirements?


A.
Create an AWS Application Migration Service replication template. Select the on-premises MongoDB database as the source. Install the AWS Replication Agent on the MongoDB database. Set the Amazon DocumentDB database service as the target endpoint. Initiate a cutover to the new database after the data is synchronized.

B.
Create an AWS DMS replication instance. Create a source endpoint for the on-premises MongoDB database and a target endpoint for the Amazon DocumentDB database. Create and run a DMS migration task.

C.
Create a source endpoint for the on-premises MongoDB database by using AWS Glue crawlers. Configure continuous asynchronous replication between the MongoDB database and the Amazon DocumentDB database.

D.
Create a fleet of EC2 instances. Install MongoDB Community Edition on the EC2 instances. Create a database. Configure continuous synchronous replication with the database that is running in the on-premises data center.

Explanation

📝 Tóm tắt đề:

MongoDB replica set chạy on-premises

EC2 applications trong VPC đang kết nối qua Direct Connect

Cần migrate MongoDB → Amazon DocumentDB

→ Yêu cầu: migrate database với ít downtime

✅ Đáp án đúng:

Create an AWS DMS replication instance. Create a source endpoint for the on-premises MongoDB database and a target endpoint for the Amazon DocumentDB database. Create and run a DMS migration task.

AWS DMS hỗ trợ MongoDB làm source và DocumentDB làm target, cho phép việc migrate đơn giản, đáp ứng yêu cầu đề bài

Tận dụng Direct Connect connection cho phép DMS replication instance truy cập on-premises MongoDB

Các đáp án sai:

❌ Create a fleet of EC2 instances. Install MongoDB Community Edition on the EC2 instances. Create a database. Configure continuous synchronous replication with the database that is running in the on-premises data center.

Mục tiêu là DocumentDB, không phải MongoDB trên EC2

High operational overhead (tự quản lý EC2 + MongoDB cluster)

❌ Create an AWS Application Migration Service replication template. Select the on-premises MongoDB database as the source. Install the AWS Replication Agent on the MongoDB database. Set the Amazon DocumentDB database service as the target endpoint. Initiate a cutover to the new database after the data is synchronized.

AWS Application Migration Service (MGN) dùng để migrate servers (lift-and-shift EC2), không dùng để migrate databases, sai yêu cầu

DocumentDB không phải target endpoint hợp lệ của MGN

❌ Create a source endpoint for the on-premises MongoDB database by using AWS Glue crawlers. Configure continuous asynchronous replication between the MongoDB database and the Amazon DocumentDB database.

AWS Glue crawlers dùng để catalog metadata trong AWS Glue Data Catalog, không phải để tạo DMS source endpoints

Glue không dùng cho mục đích migrate database, sai yêu cầu

🔑 Tips and tricks:

"MongoDB → DocumentDB migration" → AWS DMS

Application Migration Service (MGN) = server lift-and-shift, không phải database migration

AWS Glue = ETL và data catalog, không phải real-time database replication

📖 Reference:

Migrating MongoDB databases to Amazon DocumentDB - https://docs.aws.amazon.com/documentdb/latest/developerguide/docdb-migration.html

Using MongoDB as a source for AWS DMS - https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html


Question 28:
Skipped
A company that provisions job boards for a seasonal workforce is seeing an increase in traffic and usage. The backend services run on a pair of Amazon EC2 instances behind an Application Load Balancer with Amazon DynamoDB as the data store. Application read and write traffic is slow during peak seasons.

Which option provides a scalable application architecture to handle peak seasons with the LEAST development effort?


A.
Migrate the backend services to AWS Lambda. Increase the read and write capacity of DynamoDB.

B.
Use Auto Scaling groups for the backend services. Use Amazon SQS and an AWS Lambda function to write to DynamoDB.

C.
Migrate the backend services to AWS Lambda. Configure DynamoDB to use global tables.

D.
Use Auto Scaling groups for the backend services. Use DynamoDB auto scaling.

Explanation

📝 Tóm tắt đề:

Chạy 2 EC2 instances sau ALB + DynamoDB backend

Read và write traffic chậm trong peak seasons

→ Yêu cầu: scalable architecture với LEAST development effort

✅ Đáp án đúng:

Use Auto Scaling groups for the backend services. Use DynamoDB auto scaling.

Auto Scaling groups scale EC2 instances tự động theo demand (không cần thay đổi code)

DynamoDB auto scaling giúp điều chỉnh capacity phù hợp dựa trên traffic thực tế

Least development effort: không cần refactor sang Lambda hay đổi database schema

Giải quyết cả hai vấn đề: EC2 scaling + DynamoDB capacity

Các đáp án sai:

❌ Migrate the backend services to AWS Lambda. Increase the read and write capacity of DynamoDB.

Migrate sang Lambda = cần refactor application code → development effort cao

Manually increase RCU/WCU là cách làm thủ côcng, không scale tự động theo demand

Không đáp ứng "least development effort" (Lambda migration yêu cầu code changes)

❌ Migrate the backend services to AWS Lambda. Configure DynamoDB to use global tables.

Migrate sang Lambda = development effort cao

DynamoDB Global Tables là multi-Region replication solution (cho availability/DR), không phải scaling solution

Global tables không giải quyết read/write throughput issue trong một Region

❌ Use Auto Scaling groups for the backend services. Use Amazon SQS and an AWS Lambda function to write to DynamoDB.

Thêm SQS + Lambda layer để write DynamoDB = nhiều development effort (không phải least)

Thay đổi write path (EC2 → SQS → Lambda → DynamoDB) yêu cầu refactor toàn bộ write logic

🔑 Tips and tricks:

"Least development effort" + EC2 + DynamoDB → ưu tiên dùng nguyên service hiện tại Auto Scaling EC2 + DynamoDB auto scaling (không thay đổi code), hạn chế solution cần thay đổi code như Lambda

"Migrate to Lambda" = code refactor → không phải "least development effort"

📖 Reference:

Managing throughput capacity automatically with DynamoDB auto scaling - https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html

Amazon EC2 Auto Scaling - https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html


Question 29:
Skipped
A company deploys its applications on Amazon EC2 instances in a VPC in the us-east-1 Region. The company recently acquired a company that has a data center in the ap-east-1 Region.

A private application in us-east-1 needs to access the data that is stored in the data center in ap-east-1. The company needs a solution that supports IPv6. The solution also must encrypt the data in transit.

The company already has created an AWS customer gateway that represents the customer gateway device in the data center in ap-east-1. The company will configure the route tables and will modify the existing security groups to allow appropriate traffic after the network components are created.

Which solution will meet the requirements for connectivity?


A.
Create a transit gateway. Attach the transit gateway to the VPC in us-east-1. Create an AWS Site-to-Site VPN connection. Specify the transit gateway as the target gateway. Download the configuration file and set up the customer gateway device.

B.
Create a virtual private gateway. Attach the virtual private gateway to the VPC in us-east-1. Create an AWS Client VPN endpoint. Specify the transit gateway as the gateway device to connect to the Client VPN endpoint.

C.
Create a transit gateway. Attach the transit gateway to the VPC in us-east-1. Create an AWS Client VPN endpoint. Specify the virtual private gateway as the target gateway. Configure the customer gateway device to connect to the Client VPN endpoint.

D.
Create a virtual private gateway. Attach the virtual private gateway to the VPC in us-east-1. Create an AWS Site-to-Site VPN connection. Configure the customer private gateway as the target gateway. Download the configuration file and set up the customer gateway device.

Explanation

📝 Tóm tắt đề:

Private application ở us-east-1 cần truy cập data center ở ap-east-1

Cần hỗ trợ IPv6

Cần encrypt data in transit

Customer gateway đã được tạo (đại diện thiết bị VPN ở ap-east-1 data center)

→ Yêu cầu: Site-to-Site connectivity với IPv6 + encryption

✅ Đáp án đúng:

Create a virtual private gateway. Attach the virtual private gateway to the VPC in us-east-1. Create an AWS Site-to-Site VPN connection. Configure the customer private gateway as the target gateway. Download the configuration file and set up the customer gateway device.

Virtual Private Gateway (VGW) là AWS-side termination point của Site-to-Site VPN

Site-to-Site VPN hỗ trợ IPv6 (tunnel addresses có thể dùng IPv6) và encrypt toàn bộ traffic (IPSec)

Customer gateway đã có sẵn → chỉ cần tạo VGW, attach vào VPC us-east-1, tạo VPN connection

Download config file cho customer gateway device để hoàn tất setup

Các đáp án sai:

❌ Create a transit gateway. Attach the transit gateway to the VPC in us-east-1. Create an AWS Site-to-Site VPN connection. Specify the transit gateway as the target gateway. Download the configuration file and set up the customer gateway device.

Transit gateway cũng có thể làm VPN target và hỗ trợ IPv6, nhưng phức tạp hơn mức cần thiết

TGW phù hợp khi cần kết nối nhiều VPCs với on-premises; trong trường hợp này chỉ có một VPC

VGW là lựa chọn đơn giản hơn khi chỉ cần kết nối một VPC với on-premises

❌ Create a virtual private gateway. Attach the virtual private gateway to the VPC in us-east-1. Create an AWS Client VPN endpoint. Specify the transit gateway as the gateway device to connect to the Client VPN endpoint.

Client VPN dùng cho người dùng cá nhân cần truy cập private vào trong VPC, không phải công cụ để kết nối data center với VPC, sai mục đích ngay từ đầu

❌ Create a transit gateway. Attach the transit gateway to the VPC in us-east-1. Create an AWS Client VPN endpoint. Specify the virtual private gateway as the target gateway. Configure the customer gateway device to connect to the Client VPN endpoint.

Vẫn dùng Client VPN, sai như trên

🔑 Tips and tricks:

"Data center ↔ VPC connectivity" → Site-to-Site VPN (không phải Client VPN)

Site-to-Site VPN: IPSec encryption built-in → đáp ứng "encrypt in transit"

Site-to-Site VPN hỗ trợ IPv6 tunnels

📖 Reference:

AWS Site-to-Site VPN - https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html

Virtual private gateway - https://docs.aws.amazon.com/vpn/latest/s2svpn/how_it_works.html


Question 30:
Skipped
A media storage application uploads user photos to Amazon S3 for processing by AWS Lambda functions. Application state is stored in Amazon DynamoDB tables. Users are reporting that some uploaded photos are not being processed properly. The application developers trace the logs and find that Lambda is experiencing photo processing issues when thousands of users upload photos simultaneously. The issues are the result of Lambda concurrency limits and the performance of DynamoDB when data is saved.

Which combination of actions should a solutions architect take to increase the performance and reliability of the application? (Select TWO.)


A.
Add an Amazon SQS queue and reprocessing logic between Amazon S3 and the Lambda functions.

B.
Add an Amazon ElastiCache layer.

C.
Evaluate and adjust the WCUs for the DynamoDB tables.

D.
Use S3 Transfer Acceleration.

E.
Evaluate and adjust the RCUs for the DynamoDB tables.

Explanation

📝 Tóm tắt đề:

S3 photo uploads → Lambda processing

Sự cố khi thousands of users upload đồng thời: Lambda concurrency limits + DynamoDB performance slow khi save data

→ Yêu cầu: cải thiện performance và reliability (Select TWO)

✅ Đáp án đúng:

Evaluate and adjust the WCUs for the DynamoDB tables.

Vấn đề là performance khi save data → đây là write operation → cần tăng WCUs (Write Capacity Units)

Nếu WCU không đủ → DynamoDB báo lỗi throttle limit → tăng latency, errors

Cần evaluate current WCU usage và điều chỉnh (hoặc bật auto scaling)

Add an Amazon SQS queue and reprocessing logic between Amazon S3 and the Lambda functions.

Lambda concurrency limits: khi thousands of users upload đồng thời → quá nhiều Lambda invocations cùng lúc → khi quá giới hạn cho phép sẽ báo lỗi throttling

SQS làm buffer: S3 → SQS → Lambda xử lý dần dần từ SQS, không bị throttle

Các đáp án sai:

❌ Evaluate and adjust the RCUs for the DynamoDB tables.

Vấn đề là write slowness (saving data), không phải read slow, do đó điều chỉnh RCU không giải quyết vấn đề

❌ Add an Amazon ElastiCache layer.

ElastiCache cache giúp giảm tải cho read operations, không giải quyết write performance cho DynamoDB

Không giải quyết Lambda scaling issue

❌ Use S3 Transfer Acceleration.

S3 Transfer Acceleration tăng tốc upload từ clients ở xa (qua CloudFront edge)

Không giải quyết Lambda scaling hay DynamoDB write performance

🔑 Tips and tricks:

"Lambda throttling/concurrency limits" → SQS buffer (smooth out bursts, controlled concurrency)

"DynamoDB save data slow" → WCU issue (write), không phải RCU (read)

📖 Reference:

Using Lambda with Amazon SQS - https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html

DynamoDB Write Capacity Units - https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughput.html


Question 31:
Skipped
A company has a transit gateway that connects multiple VPCs in the same AWS Region. The company needs a centralized way to inspect network traffic and allow internet access for the workload VPCs.

Which solution meets these requirements?


A.
Create an inspection VPC that contains a Gateway Load Balancer (GWLB), GWLB endpoints, and a network virtual appliance. Update the route tables in all workload VPCs to send traffic to the transit gateway. Configure the transit gateway route tables to forward traffic to the GWLB endpoints. Enable appliance mode on the transit gateway.

B.
Create a Gateway Load Balancer (GWLB), GWLB endpoints, and a network virtual appliance in an existing workload VPC. Update the route table in the remaining workload VPCs to send traffic to the transit gateway. Configure the transit gateway route tables to forward traffic to the GWLB endpoints. Enable appliance mode on the GWLB.

C.
Create an inspection VPC and an internet access VPC. Create a Gateway Load Balancer (GWLB) and GWLB endpoints in the inspection VPC. Enable flow logs in the workload VPCs to route traffic to the transit gateway. Enable appliance mode on the network virtual appliance.

D.
Create a Gateway Load Balancer (GWLB) in an existing workload VPC. Create GWLB endpoints and network virtual appliances in a different workload VPC. Update the route tables in all workload VPCs to send traffic to the transit gateway. Configure the transit gateway route tables to forward traffic to the GWLB endpoints. Enable appliance mode on the GWLB endpoints.

Explanation

📝 Tóm tắt đề:

Transit gateway kết nối nhiều VPCs trong cùng Region

Cần: (1) centralized network traffic inspection và (2) internet access cho workload VPCs

→ Yêu cầu: centralized inspection VPC với GWLB + internet gateway

✅ Đáp án đúng:

Create an inspection VPC that contains a Gateway Load Balancer (GWLB), GWLB endpoints, and a network virtual appliance. Update the route tables in all workload VPCs to send traffic to the transit gateway. Configure the transit gateway route tables to forward traffic to the GWLB endpoints. Enable appliance mode on the transit gateway.

Inspection VPC riêng biệt chứa GWLB + virtual appliance để thực hiện kiểm tra traffic = centralized inspection pattern chuẩn

Tất cả traffic từ workload VPCs → Transit Gateway → route đến GWLB endpoints trong inspection VPC

GWLB transparent forward traffic qua virtual appliance (firewall/IDS/IPS) rồi tiếp tục đến destination

Appliance mode trên Transit Gateway: đảm bảo traffic đi/về cùng một AZ để stateful inspection hoạt động đúng

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create a Gateway Load Balancer (GWLB), GWLB endpoints, and a network virtual appliance in an existing workload VPC. Update the route table in the remaining workload VPCs to send traffic to the transit gateway. Configure the transit gateway route tables to forward traffic to the GWLB endpoints. Enable appliance mode on the GWLB.

GWLB và appliance trong workload VPC không phải là solution cho việc kiểm tra traffic tập trung, cần VPC riêng cho traffic inspection

"Appliance mode on GWLB" không đúng - appliance mode là tính năng của Transit Gateway, không phải GWLB

Workload VPC không nên chứa inspection infrastructure

❌ Create a Gateway Load Balancer (GWLB) in an existing workload VPC. Create GWLB endpoints and network virtual appliances in a different workload VPC. Update the route tables in all workload VPCs to send traffic to the transit gateway. Configure the transit gateway route tables to forward traffic to the GWLB endpoints. Enable appliance mode on the GWLB endpoints.

GWLB và appliances ở hai workload VPCs khác nhau = không phải quản lý tập trung (centralized)

"Appliance mode on GWLB" không đúng - appliance mode là tính năng của Transit Gateway, không phải GWLB

❌ Create an inspection VPC and an internet access VPC. Create a Gateway Load Balancer (GWLB) and GWLB endpoints in the inspection VPC. Enable flow logs in the workload VPCs to route traffic to the transit gateway. Enable appliance mode on the network virtual appliance.

"Flow logs to route traffic" là vô lý - flow logs chỉ ghi lại log, không có chức năng routing

Hai VPC riêng (inspection + internet) phức tạp không cần thiết

"Appliance mode on virtual appliance" không phải tính năng AWS

🔑 Tips and tricks:

"Centralized inspection" + Transit Gateway → Inspection VPC với GWLB + virtual appliance

Appliance mode = Transit Gateway feature (không phải GWLB), đảm bảo symmetric traffic flow cho stateful inspection

Internet gateway nằm trong inspection VPC để workload VPCs có internet access qua inspection

📖 Reference:

Centralized inspection architecture with AWS Gateway Load Balancer - https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/network-security.html

Transit Gateway appliance mode - https://docs.aws.amazon.com/vpc/latest/tgw/tgw-appliance-mode.html


Question 32:
Skipped
An ecommerce company runs a web application on 200 Amazon EC2 instances during normal traffic. The application scales to 800 instances during flash sales. The company requires a 2-hour RTO for disaster recovery (DR).

During DR testing, failover to a secondary AWS Region fails. Auto Scaling could not launch enough EC2 instances in the DR Region within the required time frame. The company must ensure that sufficient EC2 capacity is available in the DR Region before failover.

Which solution will meet these requirements?


A.
Use EC2 Regional Reserved Instances in the DR Region. Configure Auto Scaling to launch instances by using Reserved Instance capacity. Use AWS CloudFormation to deploy the infrastructure consistently across both Regions.

B.
Request On-Demand vCPU service quota increases for EC2 instances in the DR Region. Create On-Demand Capacity Reservations for the instance types and Availability Zones that the application uses.

C.
Configure Auto Scaling to use multiple instance types and Availability Zones in the DR Region. Use AWS Lambda functions to automatically request service quota increases when failover occurs.

D.
Use EC2 Spot Instances in the DR Region to reduce capacity constraints. Configure Amazon Route 53 health checks to automatically redirect traffic when the primary Region fails.

Explanation

📝 Tóm tắt đề:

Ecommerce app: 200 EC2 lúc bình thường, scale đến 800 instances khi flash sales

DR Region: cần 2-hour RTO

DR testing thất bại: Auto Scaling không launch đủ instances trong DR Region đúng hạn (capacity không sẵn có)

→ Yêu cầu: đảm bảo đủ EC2 capacity sẵn sàng trong DR Region trước khi failover

✅ Đáp án đúng:

Request On-Demand vCPU service quota increases for EC2 instances in the DR Region. Create On-Demand Capacity Reservations for the instance types and Availability Zones that the application uses.

Service quota increase: xin AWS tăng thêm để đảm bảo account có đủ vCPU quota để launch 800 instances

On-Demand Capacity Reservations: đặt trước capacity tại AZ cụ thể → khi failover xảy ra, capacity đã sẵn sàng ngay

Capacity Reservation là cách giúp đảm bảo capacity khi cần mà không phụ thuộc vào việc AWS hiện đang có sẵn loại instance đó hay không

Solution này đảm bảo quota đủ (không bị reject) + capacity reserved (instances sẵn sàng ngay) = đảm bảo RTO 2 giờ

Các đáp án sai:

❌ Use EC2 Regional Reserved Instances in the DR Region. Configure Auto Scaling to launch instances by using Reserved Instance capacity. Use AWS CloudFormation to deploy the infrastructure consistently across both Regions.

Reserved Instances cung cấp chiết khấu giá rẻ hơn nhưng không đảm bảo capacity, do đáp án không nhắc đến việc xin AWS tăng quota

❌ Configure Auto Scaling to use multiple instance types and Availability Zones in the DR Region. Use AWS Lambda functions to automatically request service quota increases when failover occurs.

Khi cần scale mới xin tăng ervice quota increases sẽ không kịp - cần thời gian AWS review và approve, không đáp ứng RTO 2 giờ

Không giải quyết root cause: thiếu capacity sẵn sàng ngay lập tức

❌ Use EC2 Spot Instances in the DR Region to reduce capacity constraints. Configure Amazon Route 53 health checks to automatically redirect traffic when the primary Region fails.

Spot Instances không đảm bảo availability - có thể không có sẵn khi cần (ngược lại với yêu cầu DR)

Spot phù hợp cost optimization, không dùng cho mục đích DR

DR phải dùng On-Demand hoặc Reserved (có tính ổn định)

🔑 Tips and tricks:

"Auto Scaling không đủ capacity trong DR" → On-Demand Capacity Reservations (pre-reserve capacity)

Service quota increase cần submit và approved trước chứ không request khi failover xảy ra

📖 Reference:

On-Demand Capacity Reservations - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html

Amazon EC2 service quotas - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html


Question 33:
Skipped
A retail company is operating its ecommerce application on AWS. The application runs on Amazon EC2 instances behind an Application Load Balancer (ALB). The company uses an Amazon RDS DB instance as the database backend. Amazon CloudFront is configured with one origin that points to the ALB. Static content is cached. Amazon Route 53 is used to host all public zones.

After an update of the application, the ALB occasionally returns a 502 status code (Bad Gateway) error. The root cause is malformed HTTP headers that are returned to the ALB. The webpage returns successfully when a solutions architect reloads the webpage immediately after the error occurs.

While the company is working on the problem, the solutions architect needs to provide a custom error page instead of the standard ALB error page to visitors.

Which combination of steps will meet this requirement with the LEAST amount of operational overhead? (Select TWO.)


A.
Create an Amazon CloudWatch alarm to invoke an AWS Lambda function if the ALB health check response Elb.InternalError is greater than 0. Configure the Lambda function to modify the forwarding rule at the ALB to point to a publicly accessible web server.

B.
Modify the existing Amazon Route 53 records by adding health checks. Configure a fallback target if the health check fails. Modify DNS records to point to a publicly accessible webpage.

C.
Add a custom error response by configuring a CloudFront custom error page. Modify DNS records to point to a publicly accessible web page. Configure the CloudFront distribution to use the S3 bucket as the origin for the custom error page.

D.
Create an Amazon CloudWatch alarm to invoke an AWS Lambda function if the ALB health check response Target.FailedHealthChecks is greater than 0. Configure the Lambda function to modify the forwarding rule at the ALB to point to a publicly accessible web server.

E.
Create an Amazon S3 bucket. Configure the S3 bucket to host a static webpage. Upload the custom error pages to Amazon S3.

Explanation

📝 Tóm tắt đề:

ALB thỉnh thoảng trả 502 Bad Gateway do malformed HTTP headers

Page load thành công khi reload ngay sau lỗi (transient error)

CloudFront → ALB → EC2 → RDS

Cần: custom error page thay vì standard ALB 502 page

→ Yêu cầu: custom error page với LEAST operational overhead (Select TWO)

✅ Đáp án đúng:

Create an Amazon S3 bucket. Configure the S3 bucket to host a static webpage. Upload the custom error pages to Amazon S3.

S3 static website hosting là nơi lưu custom error page HTML - đơn giản, không cần quản lý server

S3 làm origin cho CloudFront để serve custom error page

Add a custom error response by configuring a CloudFront custom error page. Modify DNS records to point to a publicly accessible web page. Configure the CloudFront distribution to use the S3 bucket as the origin for the custom error page.

CloudFront custom error response: khi ALB trả 502, CloudFront catch error và serve custom page từ S3

Cấu hình: Error Response (502 → custom error page từ S3 origin)

CloudFront đã là layer trước ALB → chỉ cần thêm error response configuration, không cần thêm infrastructure

Least operational overhead: tận dụng CloudFront đã có sẵn

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create an Amazon CloudWatch alarm to invoke an AWS Lambda function if the ALB health check response Target.FailedHealthChecks is greater than 0. Configure the Lambda function to modify the forwarding rule at the ALB to point to a publicly accessible web server.

Quá phức tạp: CloudWatch alarm → Lambda → modify ALB rules dynamically

Target.FailedHealthChecks metric là khi health check EC2 fail, chứ không phải khi ALB trả về lỗi 502

Modify ALB rules trong khi đang có traffic = rủi ro gián đoạn service

❌ Modify the existing Amazon Route 53 records by adding health checks. Configure a fallback target if the health check fails. Modify DNS records to point to a publicly accessible webpage.

Route 53 failover có DNS TTL propagation delay (không ngay lập tức), không giải quyết 502 error luôn được

❌ Create an Amazon CloudWatch alarm to invoke an AWS Lambda function if the ALB health check response Elb.InternalError is greater than 0. Configure the Lambda function to modify the forwarding rule at the ALB to point to a publicly accessible web server.

Vẫn dùng Cloudwatch và Lambda, sai như đáp án trên

Elb.InternalError là metric cho ALB internal errors, không chính xác cho lỗi malformed header 502

🔑 Tips and tricks:

"Custom error page" + CloudFront đã có sẵn → CloudFront custom error response (cách đơn giản nhất)

CloudFront catch 4xx/5xx từ origin (ALB) → serve custom page từ S3

S3 static website = phù hợp cho static error pages

📖 Reference:

Creating a custom error response - https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GeneratingCustomErrorResponses.html

Amazon S3 static website hosting - https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html


Question 34:
Skipped
A company recently deployed an application on Amazon ECS with the Fargate launch type. The company uses an AWS CloudFormation template to deploy the application. The company wants to identify over-provisioned resources and to update identified resources to optimize costs.

Which solution will meet these requirements?


A.
Enable AWS Compute Optimizer. Identify resources that are classified as over provisioned. Implement an Amazon ECS target tracking scaling policy to dynamically adjust ECS services based on the task size that Compute Optimizer recommends.

B.
Enable AWS Compute Optimizer. Identify resources that are classified as over provisioned. Update the CloudFormation task definition to use the task size that Compute Optimizer recommends. Redeploy the CloudFormation template.

C.
Enable AWS Cost Explorer and use a Reserved Instance utilization and coverage report to identify over-provisioned ECS services. Update the CloudFormation task definition to use values that match the values in the report. Redeploy the CloudFormation template.

D.
Enable AWS Cost Explorer and use a Reserved Instance utilization and coverage report to identify over-provisioned ECS services. Create an Amazon ECS target tracking scaling policy to automatically adjust the services to match the values in the report.

Explanation

📝 Tóm tắt đề:

ECS Fargate được deploy bằng AWS CloudFormation

Cần identify over-provisioned resources (task size quá lớn)

→ Yêu cầu: tối ưu costs bằng cách update task definition với recommended values

✅ Đáp án đúng:

Enable AWS Compute Optimizer. Identify resources that are classified as over provisioned. Update the CloudFormation task definition to use the task size that Compute Optimizer recommends. Redeploy the CloudFormation template.

AWS Compute Optimizer phân tích CloudWatch metrics của ECS Fargate tasks và đưa ra recommendations cho task CPU/memory size

Compute Optimizer chỉ rõ resources nào over-provisioned với recommended values cụ thể

Update CloudFormation task definition với recommended task size để thay đổi lại kích cỡ phù hợp cho task

Redeploy template để apply các thay đổi

Các đáp án sai:

❌ Enable AWS Compute Optimizer. Identify resources that are classified as over provisioned. Implement an Amazon ECS target tracking scaling policy to dynamically adjust ECS services based on the task size that Compute Optimizer recommends.

Target tracking scaling policy điều chỉnh số lượng tasks (scale in/out), không phải task size (CPU/memory)

Compute Optimizer recommendations về task size không được áp dụng qua scaling policy

❌ Enable AWS Cost Explorer and use a Reserved Instance utilization and coverage report to identify over-provisioned ECS services. Create an Amazon ECS target tracking scaling policy to automatically adjust the services to match the values in the report.

Cost Explorer Reserved Instance reports không liên quan đến ECS Fargate over-provisioning (Fargate không dùng RIs)

RI utilization reports dùng cho EC2/RDS Reserved Instances, không phải Fargate task sizing

Scaling policy không thay đổi task size

❌ Enable AWS Cost Explorer and use a Reserved Instance utilization and coverage report to identify over-provisioned ECS services. Update the CloudFormation task definition to use values that match the values in the report. Redeploy the CloudFormation template.

Cost Explorer RI reports không dùng để xác định Fargate over-provisioning

Compute Optimizer mới là công cụ đúng để identify over-provisioned compute resources

🔑 Tips and tricks:

"Over-provisioned" + ECS Fargate → AWS Compute Optimizer (đưa ra task CPU/memory recommendations)

Compute Optimizer hỗ trợ: EC2, ECS Fargate, Lambda, EBS volumes, RDS

Target tracking scaling = scale số tasks (không phải size); Compute Optimizer = recommend size

Cost Explorer RI reports = billing optimization, không phải sizing optimization

📖 Reference:

AWS Compute Optimizer for ECS Fargate - https://docs.aws.amazon.com/compute-optimizer/latest/ug/view-ecs-recommendations.html

Getting recommendations for ECS services - https://docs.aws.amazon.com/compute-optimizer/latest/ug/getting-started.html


Question 35:
Skipped
A company has a project that is launching Amazon EC2 instances that are larger than required. The project's account cannot be part of the company's organization in AWS Organizations due to policy restrictions to keep this activity outside of corporate IT. The company wants to allow only the launch of t3.small EC2 instances by developers in the project's account. These EC2 instances must be restricted to the us-east-2 Region.

What should a solutions architect do to meet these requirements?


A.
Create an IAM policy that allows the launch of only t3.small EC2 instances in us-east-2. Attach the policy to the roles and groups that the developers use in the project's account.

B.
Create a new developer account. Move all EC2 instances, users, and assets into us-east-2. Add the account to the company's organization in AWS Organizations. Enforce a tagging policy that denotes Region affinity.

C.
Create an SCP that denies the launch of all EC2 instances except t3.small EC2 instances in us-east-2. Attach the SCP to the project's account.

D.
Create and purchase a t3.small EC2 Reserved Instance for each developer in us-east-2. Assign each developer a specific EC2 instance with their name as the tag.

Explanation

📝 Tóm tắt đề:

Project account không được phép đưa vào AWS Organizations của công ty

Chỉ cho phép launch t3.small EC2 instances

Phải restrict trong us-east-2 Region

→ Yêu cầu: restrict EC2 instance type và Region trong standalone account

✅ Đáp án đúng:

Create an IAM policy that allows the launch of only t3.small EC2 instances in us-east-2. Attach the policy to the roles and groups that the developers use in the project's account.

Account không nằm trong AWS Organizations → SCP không áp dụng được (SCPs chỉ hoạt động cho accounts trong Organization)

IAM policy là cơ chế duy nhất để restrict permissions trong standalone account

Policy condition: ec2:InstanceType = t3.small và aws:RequestedRegion = us-east-2

Attach vào roles/groups của developers → áp dụng cho tất cả developer actions

Các đáp án sai:

❌ Create a new developer account. Move all EC2 instances, users, and assets into us-east-2. Add the account to the company's organization in AWS Organizations. Enforce a tagging policy that denotes Region affinity.

Vi phạm yêu cầu: account không được phép đưa vào AWS Organizations của công ty

Tagging policy không restrict instance types hay Region

❌ Create an SCP that denies the launch of all EC2 instances except t3.small EC2 instances in us-east-2. Attach the SCP to the project's account.

SCP chỉ áp dụng cho accounts trong AWS Organizations - mà account này không được phép đưa vào AWS Organizations của công ty, đáp án không hợp lệ

❌ Create and purchase a t3.small EC2 Reserved Instance for each developer in us-east-2. Assign each developer a specific EC2 instance with their name as the tag.

Reserved Instances là cơ chế tiết kiệm chi phí cho EC2, không liên quan gì đến việc hạn chế truy cập trong account

RI không ngăn developer có thể launch instance types khác

🔑 Tips and tricks:

SCP = chỉ dùng được cho accounts trong AWS Organizations (không phải standalone accounts)

Standalone account → chỉ có IAM policies để restrict EC2 instance types/Region

📖 Reference:

IAM policy conditions for EC2 - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policy-structure.html

Restricting EC2 instance types with IAM - https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_examples_ec2_instance-type.html


Question 36:
Skipped
A company is migrating an image-processing application to an Amazon EC2 Auto Scaling group. The company launches a fleet of EC2 instances in a single VPC by using a Multi-AZ deployment. Users upload terabytes of new images to the application every day.

The company must store the original images in an Amazon S3 bucket for long-term archiving. Requests to retrieve original images from the S3 bucket for reprocessing by the EC2 instances occur frequently but are unpredictable. The company wants to make original images available for reprocessing within 24 hours of receiving a request. The company must optimize costs for network traffic and storage.

Which combination of solutions will meet these requirements? (Select THREE.)


A.
Deploy the S3 bucket in the same AWS Region as the EC2 instances.

B.
Route the network traffic to Amazon S3 through a gateway endpoint.

C.
Configure an S3 Lifecycle policy to move the original images to S3 Glacier Instant Retrieval after 24 hours.

D.
Use S3 Intelligent-Tiering to store the images. Activate automatic archiving capabilities.

E.
Deploy the S3 bucket in a different AWS Region than the EC2 instances.

F.
Route the network traffic to Amazon S3 through an interface endpoint.

Explanation

📝 Tóm tắt đề:

EC2 Auto Scaling group xử lý images, lưu ảnh gốc vào S3 lưu trữ long-term

Retrieval requests frequent nhưng unpredictable (request nhiều nhưng không biết trước) - ảnh gốc khi cần thì phải lấy được trong 24 giờ

→ Yêu cầu: optimize costs cho network traffic và storage (Select THREE)

✅ Đáp án đúng:

Deploy the S3 bucket in the same AWS Region as the EC2 instances.

S3 trong cùng Region → không có data transfer costs giữa EC2 và S3 (same-Region transfer = free)

S3 ở Region khác → tốn cross-Region data transfer fees

"Optimize cost for network traffic" → cùng Region là hợp lí

Route the network traffic to Amazon S3 through a gateway endpoint.

Gateway VPC Endpoint cho S3 = miễn phí

Gateway endpoint cho phép traffic từ EC2 đến S3 đi trong mạng nội bộ của AWS, không qua internet, tối ưu về networking

Use S3 Intelligent-Tiering to store the images. Activate automatic archiving capabilities.

S3 Intelligent-Tiering tự động di chuyển objects qua các tiers dựa trên access patterns

Đề bài nhắc đến traffic unpredictable (không đoán trước được), do đó Intelligent-Tiering hoàn toàn phù hợp

Chức năng automatic archiving có thể sẽ đẩy image xuống tầng thấp nhất là Archive Instant Access, kể cả thế thì việc truy cập vẫn chỉ là mili giây, đáp ứng yêu cầu lấy được trong 24 giờ

Các đáp án sai:

❌ Deploy the S3 bucket in a different AWS Region than the EC2 instances.

Cross-Region S3 access tốn cross-Region data transfer fees → tăng network cost, ngược mục tiêu an đầu

❌ Route the network traffic to Amazon S3 through an interface endpoint.

Interface endpoint (PrivateLink) cho S3 tốn phí (phí theo giờ + phí xử lý data)

Gateway endpoint cho S3 là miễn phí và đủ dùng, phù hợp hơn

❌ Configure an S3 Lifecycle policy to move the original images to S3 Glacier Deep Archive after 24 hours.

Glacier Deep Archive có retrieval time: 12-48 giờ - có thể vi phạm yêu cầu "sẵn sàng trong 24 giờ"

🔑 Tips and tricks:

"Network cost" + S3 access từ VPC → Gateway VPC Endpoint (miễn phí, same Region)

"Storage cost" + unpredictable access + 24h retrieval → S3 Intelligent-Tiering với archiving

Gateway endpoint (S3/DynamoDB) = free; Interface endpoint = có phí

📖 Reference:

Gateway endpoints for Amazon S3 - https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html

Amazon S3 Intelligent-Tiering - https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering.html


Question 37:
Skipped
A company has a legacy monolithic application that is critical to the company's business. The company hosts the application on an Amazon EC2 instance that runs Amazon Linux 2. The company's application team receives a directive from the legal department to back up the data from the instance's encrypted Amazon EBS volume to an Amazon S3 bucket. The application team does not have the administrative SSH key pair for the instance. The application must continue to serve the users.

Which solution will meet these requirements?


A.
Attach a role to the instance with permission to write to Amazon S3. Use the AWS Systems Manager Session Manager option to gain access to the instance and run commands to copy data into Amazon S3.

B.
Create an image of the instance. Launch a new EC2 instance from the image. Attach a role to the new instance with permission to write to Amazon S3. Run a command to copy data into Amazon S3.

C.
Create an image of the instance with the reboot option turned on. Launch a new EC2 instance from the image. Attach a role to the new instance with permission to write to Amazon S3. Run a command to copy data into Amazon S3.

D.
Take a snapshot of the EBS volume by using Amazon Data Lifecycle Manager. Copy the data to Amazon S3.

Explanation

📝 Tóm tắt đề:

Legacy monolithic app trên EC2 Linux 2 với encrypted EBS volume

Team không có SSH key pair cho instance

Cần backup data từ EBS volume lên S3

Application phải tiếp tục phục vụ users (không được shutdown)

→ Yêu cầu: backup data mà không có SSH key, không ngừng application

✅ Đáp án đúng:

Attach a role to the instance with permission to write to Amazon S3. Use the AWS Systems Manager Session Manager option to gain access to the instance and run commands to copy data into Amazon S3.

Systems Manager Session Manager cho phép kết nối SSH vào EC2 instance không cần SSH key và không cần mở port 22 cho SSH

Attach IAM role với permission s3:PutObject → instance có quyền write lên S3

Kết nối SSH thông qua Session Manager → chạy shell commands để copy data từ EBS → S3 (ví dụ: aws s3 cp)

Application vẫn tiếp tục chạy (không reboot, không shutdown)

Cần SSM Agent để SSM có thể hoạt động được, tuy nhiên dùng Amazon Linux 2 thì đã cài sẵn mặc định rồi

Các đáp án sai:

❌ Create an image of the instance with the reboot option turned on. Launch a new EC2 instance from the image. Attach a role to the new instance with permission to write to Amazon S3. Run a command to copy data into Amazon S3.

"Reboot option turned on" → tức là reboot instance trong quá trình create image → gián đoạn application

Vi phạm yêu cầu "application must continue to serve users"

❌ Take a snapshot of the EBS volume by using Amazon Data Lifecycle Manager. Copy the data to Amazon S3.

Data Lifecycle Manager quản lý EBS snapshot lifecycle (tạo, retain, delete snapshots theo lịch)

DLM không có chức năngh "copy data to S3" - snapshot và S3 object là hai thứ khác nhau

❌ Create an image of the instance. Launch a new EC2 instance from the image. Attach a role to the new instance with permission to write to Amazon S3. Run a command to copy data into Amazon S3.

Solution khả thi về mặt kĩ thuật, tuy nhiên phức tạp vòng vo và không cần thiết

Sử dụng Session Manager trực tiếp trên instance hiện tại đơn giản hơn nhiều

🔑 Tips and tricks:

"Không có SSH key" + EC2 access → Systems Manager Session Manager (không cần SSH key)

Session Manager yêu cầu: SSM Agent (mặc định trên Amazon Linux 2), IAM role với SSM permissions

"Application must keep running" → không reboot, không stop instance

📖 Reference:

AWS Systems Manager Session Manager - https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html

Using Session Manager to access EC2 instances - https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html


Question 38:
Skipped
A company runs more than 20 applications in a single VPC. The applications run on a combination of Amazon EC2 instances, Amazon ECS clusters, and Amazon RDS databases.

The company has three teams of software engineers. Each application is assigned to one of the three teams. Each team is responsible for the cost and performance of all of the team's assigned applications. Team resources have tags that represent the application and team. The teams use IAM to manage access for daily activities.

The company needs to determine which costs on the company's monthly AWS bill are attributable to each application or team. The company also needs an AWS Billing and Cost Management solution to produce reports to compare costs from the previous 12 months and to forecast costs for the next 12 months.

Which combination of actions will meet these requirements? (Select THREE.)


A.
Activate the user-defined cost allocation tags that represent each application and team.

B.
Enable AWS Cost Explorer.

C.
Configure IAM access to Billing and Cost Management.

D.
Create a cost budget.

E.
Activate the AWS generated cost allocation tags that represent each application and team.

F.
Create a billing group in AWS Billing Conductor.

Explanation

📝 Tóm tắt đề:

3 teams với resources đã được tag theo application và team

Cần xác định chi phí theo application/team trên monthly bill

Cần reports: so sánh 12 tháng trước + forecast 12 tháng tiếp theo

→ Yêu cầu: cost attribution + cost reporting (Select THREE)

✅ Đáp án đúng:

Activate the user-defined cost allocation tags that represent each application and team.

Tags đã có sẵn trên resources nhưng phải activate trong Billing console, đây là bước đầu cần thực hiện

User-defined tags (custom tags theo application/team) sau đó sẽ xuất hiện trong Cost Explorer và billing reports, cho phép xem và sàng lọc chi phí theo các tag này

Configure IAM access to Billing and Cost Management.

Phải cấp quyền IAM permissions để teams có thể access Billing và Cost Management để xem chi phí

"IAM access to Billing" = activate IAM user access trong Billing preferences + IAM policies

Enable AWS Cost Explorer.

Cost Explorer cung cấp: lịch sử 12 tháng, forecasting 12 tháng, filter chi phí theo tag

Là tool chuẩn cho cost reporting và forecasting trong AWS

Các đáp án sai:

❌ Activate the AWS generated cost allocation tags that represent each application and team.

AWS generated tags (như aws:createdBy) là tags AWS tự tạo, không phải tags theo application/team của cty

Kích hoạt AWS generated tags không liên quan đến custom tags của company

❌ Create a billing group in AWS Billing Conductor.

AWS Billing Conductor dùng để tạo custom billing views, không phải cơ chế để nhóm chi phí theo tags

❌ Create a cost budget.

AWS Budgets là để set hạn mức chi tiêu và cảnh báo khi vượt ngưỡng

Budgets không cung cấp historical reporting hay 12-month forecast

🔑 Tips and tricks:

"Cost attribution bằng tags" = 3 steps: (1) Tạo tags, (2) Activate tags trong Billing, (3) Enable Cost Explorer

"User-defined" tags = custom tags của bạn; "AWS generated" tags = tags AWS tự tạo

Đề nhắc đến dự báo chi phí, đáp án gần như chắc chắn sẽ liên quan đến Cost Explorer

📖 Reference:

Activating user-defined cost allocation tags - https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/activating-tags.html

Enabling AWS Cost Explorer - https://docs.aws.amazon.com/cost-management/latest/userguide/ce-enable.html


Question 39:
Skipped
A retail company has an on-premises data center in Europe. The company also has a multi-Region AWS presence that includes the eu-west-1 and us-east-1 Regions. The company wants to be able to route network traffic from its on-premises infrastructure into VPCs in either of those Regions. The company also needs to support traffic that is routed directly between VPCs in those Regions. No single points of failure can exist on the network.

The company already has created two 1 Gbps AWS Direct Connect connections from its on-premises data center. Each connection goes into a separate Direct Connect location in Europe for high availability. These two locations are named DX-A and DX-B, respectively. Each Region has a single AWS Transit Gateway that is configured to route all inter-VPC traffic within that Region.

Which solution will meet these requirements?


A.
Create a transit VIF from the DX-A connection into a Direct Connect gateway. Create a transit VIF from the DX-B connection into the same Direct Connect gateway for high availability. Associate both the eu-west-1 and us-east-1 transit gateways with this Direct Connect gateway. Configure the Direct Connect gateway to route traffic between the transit gateways.

B.
Create a transit VIF from the DX-A connection into a Direct Connect gateway. Create a transit VIF from the DX-B connection into the same Direct Connect gateway. Configure the Direct Connect gateway for high availability. Associate both the eu-west-1 and us-east-1 transit gateways with this Direct Connect gateway. Peer the transit gateways with each other to support cross-Region routing.

C.
Create a transit VIF from the DX-A connection into a Direct Connect gateway. Create a transit VIF from the DX-B connection into a separate Direct Connect gateway. Associate the eu-west-1 transit gateway with this Direct Connect gateway. Associate the us-east-1 transit gateway with this separate Direct Connect gateway. Peer the transit gateways with each other to support high availability and cross-Region routing.

D.
Create a private VIF from the DX-A connection into a Direct Connect gateway. Create a private VIF from the DX-B connection into the Direct Connect gateway for high availability. Associate both the eu-west-1 and us-east-1 transit gateways with the Direct Connect gateway. Peer the transit gateways with each other to support cross-Region routing.

Explanation

📝 Tóm tắt đề:

Hai kết nối Direct Connect 1 Gbps: DX-A và DX-B tại hai location riêng biệt

eu-west-1 và us-east-1 mỗi Region có một Transit Gateway

Cần: on-premises kết nối đến cả hai Regions + VPC-to-VPC cross-Region

No single points of failure

→ Yêu cầu: multi-Region hybrid connectivity với full redundancy

✅ Đáp án đúng:

Create a transit VIF from the DX-A connection into a Direct Connect gateway. Create a transit VIF from the DX-B connection into the same Direct Connect gateway. Configure the Direct Connect gateway for high availability. Associate both the eu-west-1 and us-east-1 transit gateways with this Direct Connect gateway. Peer the transit gateways with each other to support cross-Region routing.

Transit VIF (không phải private VIF) là loại virtual interface phù hợp để kết nối với Transit Gateway

Cả hai DX connections (A và B) kết nối vào cùng một Direct Connect gateway → đảm bảo tính khả dụng ở tầng Direct Connect (nếu DX-A fail, DX-B vẫn hoạt động qua cùng DX gateway)

Direct Connect gateway có thể associate với nhiều Transit Gateways ở các Regions khác nhau → cả eu-west-1 TGW và us-east-1 TGW đều kết nối được từ on-premises

Transit Gateway peering giữa eu-west-1 và us-east-1 → đáp ứng yêu cầu cho phéo các VPC trên 2 region kết nối với nhau

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create a private VIF from the DX-A connection into a Direct Connect gateway. Create a private VIF from the DX-B connection into the Direct Connect gateway for high availability. Associate both the eu-west-1 and us-east-1 transit gateways with the Direct Connect gateway. Peer the transit gateways with each other to support cross-Region routing.

Private VIF không kết nối được với Transit Gateway - private VIF kết nối với Virtual Private Gateway (VGW), yếu tố vô lý

Chỉ Transit VIF mới dùng được với Transit Gateway và Direct Connect gateway

❌ Create a transit VIF from the DX-A connection into a Direct Connect gateway. Create a transit VIF from the DX-B connection into a separate Direct Connect gateway. Associate the eu-west-1 transit gateway with this Direct Connect gateway. Associate the us-east-1 transit gateway with this separate Direct Connect gateway. Peer the transit gateways with each other to support high availability and cross-Region routing.

Hai DX gateways riêng biệt: nếu DX-A fail, eu-west-1 mất kết nối on-premises; nếu DX-B fail, us-east-1 mất kết nối

Không đảm bảo "no single points of failure" cho từng Region

Cả hai DX connections nên cùng DX gateway để mỗi DX connection cung cấp HA cho tất cả Regions

❌ Create a transit VIF from the DX-A connection into a Direct Connect gateway. Create a transit VIF from the DX-B connection into the same Direct Connect gateway for high availability. Associate both the eu-west-1 and us-east-1 transit gateways with this Direct Connect gateway. Configure the Direct Connect gateway to route traffic between the transit gateways.

Direct Connect gateway không có cơ chế giúp route traffic giữa các transit gateways, yếu tố vô lý

Phải configure Route table của Transit gateway để route giữa các Transit gateway mới đúng

🔑 Tips and tricks:

Transit VIF = kết nối TGW qua DX gateway (không phải private VIF)

Private VIF = kết nối VGW (Virtual Private Gateway) trực tiếp

Direct Connect gateway + Transit VIF có thể associate với nhiều TGWs ở nhiều Regions

HA cho DX: hai connections vào cùng DX gateway (không phải hai DX gateways riêng)

Cross-Region VPC routing qua TGW: Transit Gateway peering giữa hai Regions

📖 Reference:

Direct Connect with AWS Transit Gateway over transit VIF - https://docs.aws.amazon.com/prescriptive-guidance/latest/designing-control-tower-landing-zone/dc-transit-vif.html

AWS Direct Connect virtual interfaces - https://docs.aws.amazon.com/directconnect/latest/UserGuide/WorkingWithVirtualInterfaces.html


Question 40:
Skipped
A company is running a containerized application in the AWS Cloud. The application is running by using Amazon ECS on a set of Amazon EC2 instances. The EC2 instances run in an Auto Scaling group.

The company uses Amazon ECR to store its container images. When a new image version is uploaded, the new image version receives a unique tag.

The company needs a solution that inspects new image versions for common vulnerabilities and exposures. The solution must automatically delete new image tags that have Critical or High severity findings. The solution also must notify the development team when such a deletion occurs.

Which solution meets these requirements?


A.
Configure periodic image scan on the repository. Configure scan results to be added to an Amazon SQS queue. Invoke an AWS Step Functions state machine when a message is added to the SQS queue. Use the Step Functions state machine to delete the image tag for images that have Critical or High severity findings. Notify the development team by using Amazon SES.

B.
Schedule an AWS Lambda function to start a manual image scan every hour. Configure Amazon EventBridge to invoke another Lambda function when a scan is complete. Use the second Lambda function to delete the image tag for images that have Critical or High severity findings. Notify the development team by using Amazon SNS.

C.
Configure scan on push on the repository. Use Amazon EventBridge to invoke an AWS Step Functions state machine when a scan is complete for images that have Critical or High severity findings. Use the Step Functions state machine to delete the image tag for those images and to notify the development team through Amazon SNS.

D.
Configure scan on push on the repository. Configure scan results to be pushed to an Amazon SQS queue. Invoke an AWS Lambda function when a message is added to the SQS queue. Use the Lambda function to delete the image tag for images that have Critical or High severity findings. Notify the development team by using Amazon SES.

Explanation

📝 Tóm tắt đề:

ECR repository nhận image versions với unique tags

Cần inspect image versions cho CVEs (Common Vulnerabilities and Exposures)

Phải tự động xóa image tags có mức độ nghiêm trọng Critical hoặc High

Phải notify development team khi xóa

→ Yêu cầu: automated scan → detect → delete → notify

✅ Đáp án đúng:

Configure scan on push on the repository. Use Amazon EventBridge to invoke an AWS Step Functions state machine when a scan is complete for images that have Critical or High severity findings. Use the Step Functions state machine to delete the image tag for those images and to notify the development team through Amazon SNS.

Scan on push: mỗi khi image mới được push, tự động scan ngay lập tức (không cần schedule)

ECR scan complete → tạo EventBridge event (ECR Image Scan) có thể filter theo severity (mức độ nghiêm trọng)

Step Functions orchestrate workflow: (1) check severity, (2) delete image tag, (3) notify team

Amazon SNS notify development team

Đây là solution serverless, tự động hoá hoàn toàn đáp ứng yêu cầu đề bài

Kiến trúc tham khảo:


Các đáp án sai:

❌ Configure scan on push on the repository. Configure scan results to be pushed to an Amazon SQS queue. Invoke an AWS Lambda function when a message is added to the SQS queue. Use the Lambda function to delete the image tag for images that have Critical or High severity findings. Notify the development team by using Amazon SES.

ECR scan results không tự động push đến SQS - ECR gửi events đến EventBridge, không phải SQS trực tiếp

Amazon SES là email service, phù hợp để gửi emails nhưng SNS đơn giản hơn và phù hợp hơn cho use case notifications đến người quản trị

❌ Schedule an AWS Lambda function to start a manual image scan every hour. Configure Amazon EventBridge to invoke another Lambda function when a scan is complete. Use the second Lambda function to delete the image tag for images that have Critical or High severity findings. Notify the development team by using Amazon SNS.

Scan mỗi giờ (periodic) thay vì scan on push → có khoảng thời gian up to 1 giờ khi lỗ hổng bảo mật chưa được phát hiện

Không đáp ứng "inspects new image versions" ngay khi push

Thêm Lambda để trigger scan thủ công là overhead không cần thiết

❌ Configure periodic image scan on the repository. Configure scan results to be added to an Amazon SQS queue. Invoke an AWS Step Functions state machine when a message is added to the SQS queue. Use the Step Functions state machine to delete the image tag for images that have Critical or High severity findings. Notify the development team by using Amazon SES.

Periodic scan thay vì scan on push → không phát hiện ngay khi push

ECR scan results không tự động add vào SQS, sai tương tự như các đáp án trên

🔑 Tips and tricks:

"Inspect new image versions" → ECR scan on push (không phải periodic/scheduled)

ECR scan complete → EventBridge event → target Step Functions hoặc Lambda

"Automated" + multi-step workflow → Step Functions (orchestration)

"Notify team" → SNS (simple pub/sub notification)

📖 Reference:

Amazon ECR image scanning - https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html

ECR scan findings in EventBridge - https://aws.amazon.com/blogs/containers/amazon-ecr-native-container-image-scanning/


Question 41:
Skipped
A company runs a web application on Amazon EC2 instances behind Application Load Balancers (ALBs) in the us-east-1 Region and the eu-west-1 Region. Users in Asia-based AWS Regions are experiencing high latency when they connect to the application.

During peak traffic periods, one Region where the company runs the application occasionally becomes overloaded while the company's other Region has excess capacity. The company currently uses Amazon Route 53 with latency-based routing. The company needs a solution that reduces latency for users globally and quickly shifts traffic between Regions during peak periods without DNS changes. The company needs a solution that protects against DDoS attacks.

Which solution will meet these requirements?


A.
Deploy additional ALBs in ap-southeast-1. Implement Route 53 weighted routing to distribute traffic across the Regions.

B.
Configure Route 53 to use geolocation routing policies to direct Asia-based users to us-east-1.

C.
Configure Amazon CloudFront to use the ALBs as origins. Set up Regional caching behavior and origin failover.

D.
Implement AWS Global Accelerator and set the ALBs as endpoints. Configure health checks to automatically redirect traffic during Regional overloads.

Explanation

📝 Tóm tắt đề:

Web app tại us-east-1 và eu-west-1, Asia users bị latency cao

Peak traffic: một Region bị overload (quá tải), Region kia có excess capacity (thừa tải)

Đang dùng Route 53 latency-based routing

Cần: giảm latency global + shift traffic nhanh không cần thay đổi DNS + DDoS protection

✅ Đáp án đúng:

Implement AWS Global Accelerator and set the ALBs as endpoints. Configure health checks to automatically redirect traffic during Regional overloads.

AWS Global Accelerator - cho phép users tăng tốc kết nối đến edge location gần nhất của AWS global network → giảm latency cho Asia users

Không cần DNS changes khi shift traffic: Global Accelerator redirect traffic bằng cách thay đổi routing tại network layer, không qua DNS TTL

Health checks giúp detect Regional overload và redirect traffic sang Region có excess capacity

Global Accelerator tích hợp sẵn AWS Shield Standard → giúp chống DDoS như đề bài yêu cầu

Các đáp án sai:

❌ Configure Amazon CloudFront to use the ALBs as origins. Set up Regional caching behavior and origin failover.

CloudFront là CDN, chủ yếu dùng cho mục đích caching static content, với use case tăng tốc kết nối giảm latency đến ALB thì Global Accelerator sẽ hợp lý hơn

❌ Configure Route 53 to use geolocation routing policies to direct Asia-based users to us-east-1.

Geolocation sẽ routing cố định Asia users vào us-east-1 → không thể "shift traffic" dựa trên Regional overload

Không giải quyết vấn đề khi us-east-1 overload

❌ Deploy additional ALBs in ap-southeast-1. Implement Route 53 weighted routing to distribute traffic across the Regions.

Thêm Region mới → cần manage application deployment ở 3 Regions → operational overhead cao

Weighted routing không auto-shift traffic dựa trên health/load thực tế

🔑 Tips and tricks:

"Traffic shift without DNS changes" → AWS Global Accelerator (network-layer Anycast routing)

"DDoS protection" → Global Accelerator tích hợp AWS Shield Standard

📖 Reference:

AWS Global Accelerator - https://docs.aws.amazon.com/global-accelerator/latest/dg/what-is-global-accelerator.html

Multi-Region applications with Global Accelerator - https://aws.amazon.com/blogs/networking-and-content-delivery/deploying-multi-region-applications-in-aws-using-aws-global-accelerator/


Question 42:
Skipped
A company is planning to migrate an application to AWS. The application runs as a Docker container and uses an NFS version 4 file share.

A solutions architect must design a secure and scalable containerized solution that does not require provisioning or management of the underlying infrastructure.

Which solution will meet these requirements?


A.
Deploy the application containers by using Amazon ECS with the Fargate launch type. Use Amazon EFS for shared storage. Reference the EFS file system ID, container mount point, and EFS authorization IAM role in the ECS task definition.

B.
Deploy the application containers by using Amazon ECS with the Fargate launch type. Use Amazon FSx for Lustre for shared storage. Reference the FSx for Lustre file system ID, container mount point, and FSx authorization IAM role in the ECS task definition.

C.
Deploy the application containers by using Amazon ECS with the Amazon EC2 launch type and auto scaling turned on. Use Amazon EFS for shared storage. Mount the EFS file system on the ECS container instances. Add the EFS authorization IAM role to the EC2 instance profile.

D.
Deploy the application containers by using Amazon ECS with the Amazon EC2 launch type and auto scaling turned on. Use Amazon EBS volumes with Multi-Attach enabled for shared storage. Attach the EBS volumes to ECS container instances. Add the EBS authorization IAM role to an EC2 instance profile.

Explanation

📝 Tóm tắt đề:

Docker container dùng NFS version 4 file share cho shared storage

Cần giải pháp secure và scalable

Không cần provision hay manage underlying infrastructure (serverless)

→ Yêu cầu: ECS Fargate (serverless containers) + EFS (NFS-compatible shared storage)

✅ Đáp án đúng:

Deploy the application containers by using Amazon ECS with the Fargate launch type. Use Amazon EFS for shared storage. Reference the EFS file system ID, container mount point, and EFS authorization IAM role in the ECS task definition.

ECS Fargate = serverless container platform, không cần quản lý kiến trúc bên dưới, tốn ít effort vận hành

Amazon EFS hỗ trợ NFS version 4→ thay thế phù hợp cho NFS file share hiện tại

EFS được tham chiếu trực tiếp trong ECS task definition → containers tự động kết nối, mount đến EFS khi task chạy

EFS tự động scale, HA, managed → không cần quản lý storage infrastructure

Các đáp án sai:

❌ Deploy the application containers by using Amazon ECS with the Fargate launch type. Use Amazon FSx for Lustre for shared storage. Reference the FSx for Lustre file system ID, container mount point, and FSx authorization IAM role in the ECS task definition.

FSx for Lustre là high-performance file system cho HPC/ML workloads, không phải là solution thay thế cho NFS

Không phù hợp với ứng dụng đang dùng NFS v4

❌ Deploy the application containers by using Amazon ECS with the Amazon EC2 launch type and auto scaling turned on. Use Amazon EFS for shared storage. Mount the EFS file system on the ECS container instances. Add the EFS authorization IAM role to the EC2 instance profile.

EC2 launch type yêu cầu provision và manage EC2 instances → vi phạm "no infrastructure management"

❌ Deploy the application containers by using Amazon ECS with the Amazon EC2 launch type and auto scaling turned on. Use Amazon EBS volumes with Multi-Attach enabled for shared storage. Attach the EBS volumes to ECS container instances. Add the EBS authorization IAM role to an EC2 instance profile.

EC2 launch type → phải quản lý EC2 infrastructure → vi phạm "no infrastructure management"

EBS Multi-Attach chỉ hoạt động trong cùng AZ → không phù hợp cho multiple instances across AZs

EBS không phải NFS (block storage, không phải file system)

🔑 Tips and tricks:

"No infrastructure management" + containers → ECS Fargate (không phải EC2 launch type)

"NFS file share" → Amazon EFS (NFS v4 compatible)

📖 Reference:

Amazon EFS with Amazon ECS - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html

Amazon EFS NFS support - https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html


Question 43:
Skipped
A publishing company's design team updates the icons and other static assets that an ecommerce web application uses. The company serves the icons and assets from an Amazon S3 bucket that is hosted in the company's production account. The company also uses a development account that members of the design team can access.

After the design team tests the static assets in the development account, the design team needs to load the assets into the S3 bucket in the production account. A solutions architect must provide the design team with access to the production account without exposing other parts of the web application to the risk of unwanted changes.

Which combination of steps will meet these requirements? (Select THREE.)


A.
In the production account, create a new IAM policy that allows read and write access to the S3 bucket.

B.
In the production account, create a role. Attach the new policy to the role. Define the development account as a trusted entity.

C.
In the development account, create a role. Attach the new policy to the role. Define the production account as a trusted entity.

D.
In the development account, create a group that contains all the IAM users of the design team. Attach a different IAM policy to the group to allow the sts:AssumeRole action on the role in the production account.

E.
In the development account, create a new IAM policy that allows read and write access to the S3 bucket.

F.
In the development account, create a group that contains all the IAM users of the design team. Attach a different IAM policy to the group to allow the sts:AssumeRole action on the role in the development account.

Explanation

📝 Tóm tắt đề:

Design team trong development account cần upload static assets lên S3 bucket trong production account

Phải không expose phần khác của production account

→ Yêu cầu: cross-account S3 access với least privilege (Select THREE)

✅ Đáp án đúng:

In the production account, create a new IAM policy that allows read and write access to the S3 bucket.

IAM policy trong production account định nghĩa permissions cụ thể cho S3 bucket trong account đó

Policy chỉ cho phép read/write S3, không cấp các quyền không cần thiết trong production account

In the production account, create a role. Attach the new policy to the role. Define the development account as a trusted entity.

IAM role trong production account được gắn với policy như đáp án trên

Trust policy cho phép development account có thể assume role này để có quyền truy cập

In the development account, create a group that contains all the IAM users of the design team. Attach a different IAM policy to the group to allow the sts:AssumeRole action on the role in the production account.

Group trong dev account chứa toàn bộ team members, giúp gán quyền đơn giản và nhanh chóng

IAM policy cho phép sts:AssumeRole trên role trong production account (cross-account assume)

Team members kế thừa quyền từ IAM group → có thể assume role trong production account để truy cập

Kiến trúc tham khảo:


Các đáp án sai:

❌ In the development account, create a new IAM policy that allows read and write access to the S3 bucket.

IAM policy trong dev account cấp quyền access vào S3 bucket của production account trực tiếp được, tuy nhiên điều này đòi hỏi S3 bucket bên production account phải có bucket policy cho phép việc này, mà các đáp án ở đây không cái nào nhắc đến S3 bucket policy cả

Do đó dù có tạo IAM policy cho phép access đến S3 account production thì cũng không có ý nghĩa

❌ In the development account, create a role. Attach the new policy to the role. Define the production account as a trusted entity.

Chiều đang bị ngược, phải tạo role trong production account và trust entity cho development account

Production account trust dev role → không có ý nghĩa cho use case này

Design team cần assume role trong production account, không phải dev account

❌ In the development account, create a group that contains all the IAM users of the design team. Attach a different IAM policy to the group to allow the sts:AssumeRole action on the role in the development account.

sts:AssumeRole trên role của trong development account → sai, phải AssumeRole trên role trong production account để access S3 mới đúng

🔑 Tips and tricks:

Cross-account role pattern: (1) Target account: role với permissions + source account trusted; (2) Source account: policy cho phép sts:AssumeRole trên target role

IAM policy trong source account không thể grant access trong target account

sts:AssumeRole ARN phải trỏ đến role trong target account (production), không phải source

"Define X as trusted entity" = X account có thể assume role này

📖 Reference:

IAM tutorial: Cross-account access using roles - https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html

AssumeRole cross-account - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_permissions-to-switch.html


Question 44:
Skipped
An ecommerce company is running an application on AWS. The application has an Amazon API Gateway API that invokes an AWS Lambda function. The application stores data in an Amazon RDS for PostgreSQL DB instance.

During the company's most recent sales event, a sudden increase in API calls negatively affected the application's performance. A solutions architect reviewed the Amazon CloudWatch metrics and noticed a significant increase in Lambda invocations and database connections. The CPU utilization was also high on the DB instance.

Which solution will optimize the application's performance?


A.
Increase the timeout value of the Lambda function. Modify the Lambda function to close database connections after the Lambda function retrieves data.

B.
Change the DB instance to a GPU-based DB instance. Configure a higher max_connections value in the RDS parameter group.

C.
Create a database proxy by using Amazon RDS Proxy. Modify the Lambda function to use the RDS Proxy endpoint instead of connecting directly to the database.

D.
Increase the memory of the Lambda function. Modify the Lambda function to check for an existing database connection to use before the Lambda function creates a new database connection.

Explanation

📝 Tóm tắt đề:

API Gateway → Lambda → RDS PostgreSQL

Sales event: Lambda invocations tăng + database connections tăng + CPU cao trên DB

→ Yêu cầu: giải quyết connection exhaustion khi nhiều Lambda invocations đồng thời

✅ Đáp án đúng:

Create a database proxy by using Amazon RDS Proxy. Modify the Lambda function to use the RDS Proxy endpoint instead of connecting directly to the database.

Vấn đề cốt lõi: mỗi Lambda invocation tạo một kết nối mới đến RDS → hàng nghìn Lambda chạy = hàng nghìn kết nối DB → DB bị quá tải

RDS Proxy là giúp cân bằng tải các connection đến RDS, Lambda có thể thông qua đó kết nối mà không làm quá tải RDS

Lambda không cần tạo new connection mỗi lần → giảm số connections đến RDS

Thay đổi đơn giản: chỉ đổi endpoint trong Lambda từ RDS endpoint thành RDS Proxy endpoint

Các đáp án sai:

❌ Increase the timeout value of the Lambda function. Modify the Lambda function to close database connections after the Lambda function retrieves data.

Tăng timeout không giải quyết vấn đề connection ở đây

"Close connections after retrieving data" là practice tốt nhưng vẫn tạo new connection cho mỗi lần invocation mới

❌ Change the DB instance to a GPU-based DB instance. Configure a higher max_connections value in the RDS parameter group.

Không có khái niệm GPU based DB instance nào tồn tại, và việc tăng max_connections chỉ là giải pháp tạm thời, không giải quyết root cause

❌ Increase the memory of the Lambda function. Modify the Lambda function to check for an existing database connection to use before the Lambda function creates a new database connection.

Tăng Lambda memory không liên quan đến vấn đề DB quá tải kết nối

"Check for existing connection" trong Lambda chỉ tái sử dụng connection trong cùng một Lambda instance (warm invocation), khi scale ra nhiều Lambda instance, nhiều môi trường thực thi khác nhau thì không tái sử dụng được

🔑 Tips and tricks:

"Lambda" + "many concurrent invocations" + "database connections" → RDS Proxy (connection pooling)

"DB CPU cao do connection management" = RDS Proxy là giải pháp

📖 Reference:

Amazon RDS Proxy - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-proxy.html

Using RDS Proxy with Lambda - https://aws.amazon.com/blogs/compute/using-amazon-rds-proxy-with-aws-lambda/


Question 45:
Skipped
A company needs to modernize an application and migrate the application to AWS. The application stores user profile data as text in a single table in an on-premises MySQL database.

After the modernization, users will use the application to upload video files that are up to 4 GB in size. Other users must be able to download the video files from the application. The company needs a video storage solution that provides rapid scaling. The solution must not affect application performance.

Which solution will meet these requirements?


A.
Migrate the database to Amazon Aurora PostgreSQL by using AWS DMS. Store the videos as base64-encoded strings in a TEXT column in the database.

B.
Migrate the database to Amazon DynamoDB by using AWS DMS with AWS SCT. Store the videos as objects in Amazon S3. Store the S3 key in the corresponding DynamoDB item.

C.
Migrate the database to Amazon Keyspaces by using AWS DMS with AWS SCT. Store the videos as objects in Amazon S3. Store the S3 key in the corresponding Amazon Keyspaces entry.

D.
Migrate the database to Amazon DynamoDB by using AWS DMS with AWS SCT. Store the videos as base64-encoded strings in the corresponding DynamoDB item.

Explanation

📝 Tóm tắt đề:

User profiles lưu trong MySQL (text data)

Sau modernization: users upload video files up to 4 GB

Others download video files

Cần rapid scaling cho video storage, không ảnh hưởng application performance

→ Yêu cầu: managed database + proper video object storage

✅ Đáp án đúng:

Migrate the database to Amazon DynamoDB by using AWS DMS with AWS SCT. Store the videos as objects in Amazon S3. Store the S3 key in the corresponding DynamoDB item.

DynamoDB là managed NoSQL phù hợp cho user profile data (key-value/document), scale tự động

Amazon S3 là object storage phù hợp cho việc lưu trữ file ảnh / video

Vieo có size lớn lưu trên S3, và đường dẫn ảnh lưu trong DynamoDB là kiến trúc phổ biến mà AWS khuyến nghị cho solution lưu trữ ảnh/video

Kiến trúc tham khảo:


Các đáp án sai:

❌ Migrate the database to Amazon Aurora PostgreSQL by using AWS DMS. Store the videos as base64-encoded strings in a TEXT column in the database.

Lưu video 4 GB trong database là anti-pattern sai hoàn toàn: tốn DB storage, slow queries, backup lớn

Database không scale tốt cho binary large objects (BLOBs) - file lớn

❌ Migrate the database to Amazon Keyspaces by using AWS DMS with AWS SCT. Store the videos as objects in Amazon S3. Store the S3 key in the corresponding Amazon Keyspaces entry.

DMS không hỗ trợ migrate MySQL → Keyspaces trực tiếp, solution không hợp lệ về mặt kĩ thuật

DynamoDB là lựa chọn tốt hơn cho user profile data (simpler, lower overhead)

❌ Migrate the database to Amazon DynamoDB by using AWS DMS with AWS SCT. Store the videos as base64-encoded strings in the corresponding DynamoDB item.

DynamoDB item size limit là 400 KB → video 4 GB KHÔNG THỂ lưu trong DynamoDB

Phải dùng S3 cho binary objects lớn

🔑 Tips and tricks:

"Video/image/binary files" → luôn lưu trong Amazon S3 (không bao giờ lưu trong database)

DynamoDB item limit = 400 KB → không thể lưu large binary objects

Pattern chuẩn: database lưu S3 key (đường dẫn file), S3 lưu file thực tế

📖 Reference:

Amazon S3 - https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html

Amazon DynamoDB limits - https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ServiceQuotas.html


Question 46:
Skipped
A company is deploying a new cluster for big data analytics on AWS. The cluster will run across many Linux Amazon EC2 instances that are spread across multiple Availability Zones.

All of the nodes in the cluster must have read and write access to common underlying file storage. The file storage must be highly available, must be resilient, must be compatible with the Portable Operating System Interface (POSIX), and must accommodate high levels of throughput.

Which storage solution will meet these requirements?


A.
Provision a new Amazon EFS file system that uses General Purpose performance mode. Mount the EFS file system on each EC2 instance in the cluster.

B.
Provision a new Amazon EBS volume that uses the io2 volume type. Attach the EBS volume to all of the EC2 instances in the cluster.

C.
Provision a new Amazon EFS file system that uses Max I/O performance mode. Mount the EFS file system on each EC2 instance in the cluster.

D.
Provision an AWS Storage Gateway file gateway NFS file share that is attached to an Amazon S3 bucket. Mount the NFS file share on each EC2 instance in the cluster.

Explanation

📝 Tóm tắt đề:

Big data analytics cluster: nhiều EC2 Linux instances, multiple AZs

Tất cả nodes cần read/write access vào common file storage

Yêu cầu: HA, resilient, POSIX-compatible, high throughput

→ Yêu cầu: EFS Max I/O (POSIX, multi-AZ, high concurrent throughput)

✅ Đáp án đúng:

Provision a new Amazon EFS file system that uses Max I/O performance mode. Mount the EFS file system on each EC2 instance in the cluster.

Amazon EFS là POSIX-compliant file system: hỗ trợ POSIX permissions, file locking, symbolic links

Max I/O performance mode được tối ưu cho workload performance cao với nhiều EC2 instances truy cập đồng thời

EFS có tính HA: dữ liệu replicated trên nhiều AZs trong Region

Các đáp án sai:

❌ Provision a new Amazon EFS file system that uses General Purpose performance mode. Mount the EFS file system on each EC2 instance in the cluster.

General Purpose phù hợp cho latency-sensitive workloads (ưu tiên về độ trễ)

Big data analytics với "many EC2 instances" và "high throughput" phù hợp hơn với Max I/O

❌ Provision an AWS Storage Gateway file gateway NFS file share that is attached to an Amazon S3 bucket. Mount the NFS file share on each EC2 instance in the cluster.

Storage Gateway File Gateway là solution cho storage ở phía on-premise, không dùng trên cloud

Không phù hợp cho high-throughput analytics cluster trên cloud

❌ Provision a new Amazon EBS volume that uses the io2 volume type. Attach the EBS volume to all of the EC2 instances in the cluster.

EBS không thể attach đến EC2 instances ở nhiều AZs (EBS là AZ-specific)

EBS Multi-Attach (io1/io2) chỉ hoạt động trong cùng một AZ, tối đa 16 instances

Big data cluster trên multiple AZs = EBS không khả thi

🔑 Tips and tricks:

"POSIX-compatible" + shared storage + multiple EC2 instances → Amazon EFS

"High throughput" + "many concurrent instances" (big data, HPC) → EFS Max I/O

"Latency-sensitive" + few instances → EFS General Purpose

EBS = single AZ, single instance (trừ Multi-Attach io1/io2 trong cùng AZ)

Storage Gateway = on-premises bridge, không phải native cloud file system

📖 Reference:

Amazon EFS performance modes - https://docs.aws.amazon.com/efs/latest/ug/performance.html

EFS for big data analytics - https://docs.aws.amazon.com/efs/latest/ug/use-cases.html


Question 47:
Skipped
A company has a data lake in Amazon S3 that needs to be accessed by hundreds of applications across many AWS accounts. The company's information security policy states that the S3 bucket must not be accessed over the public internet and that each application should have the minimum permissions necessary to function.

To meet these requirements, a solutions architect plans to use an S3 access point that is restricted to specific VPCs for each application.

Which combination of steps should the solutions architect take to implement this solution? (Select TWO.)


A.
Create a gateway endpoint for Amazon S3 in each application's VPC. Configure the endpoint policy to allow access to an S3 access point. Create a VPC that is used to access the access point.

B.
Create an interface endpoint for Amazon S3 in each application's VPC. Configure the endpoint policy to allow access to an S3 access point. Create a gateway attachment for the S3 endpoint.

C.
Create an S3 access point for each application in the AWS account that owns the S3 bucket. Configure each access point to be accessible only from the application's VPC. Update the bucket policy to require access from an access point.

D.
Create a gateway endpoint for Amazon S3 in the data lake's VPC. Attach an endpoint policy to allow access to the S3 bucket. Specify the route table to access the bucket.

E.
Create an S3 access point for each application in each AWS account and attach the access points to the S3 bucket. Update the bucket policy to require access from an access point. Specify the route table accessible only from the application's VPC.

Explanation

📝 Tóm tắt đề:

S3 data lake, nhiều app, nhiều AWS accounts

S3 không được phép access qua public internet

Minimum permissions cho mỗi application (least privilege)

Solution architect dùng S3 access points giới hạn theo từng VPC cụ thể

→ Yêu cầu: S3 access point per VPC + VPC private access (Select TWO)

✅ Đáp án đúng:

Create an S3 access point for each application in the AWS account that owns the S3 bucket. Configure each access point to be accessible only from the application's VPC. Update the bucket policy to require access from an access point.

S3 Access Points phải được tạo trong account sở hữu bucket (không phải trong account chứa application)

Mỗi access point có VPC restriction → chỉ requests từ VPC đó mới được accept

Bucket policy có thể hạn chế bắt buộc tất cả access phải đi qua access point

Đây là cách đúng để cấu hình per-application, per-VPC least privilege access

Create a gateway endpoint for Amazon S3 in each application's VPC. Configure the endpoint policy to allow access to an S3 access point. Create a VPC that is used to access the access point.

Gateway VPC Endpoint cho S3: traffic đi qua AWS private network, không qua internet (miễn phí)

Endpoint policy restrict access chỉ đến S3 access point cụ thể → đáp ứng yêu cầu least privilege

Gateway endpoint là cơ chế đúng cho S3 private access từ VPC

Các đáp án sai:

❌ Create an interface endpoint for Amazon S3 in each application's VPC. Configure the endpoint policy to allow access to an S3 access point. Create a gateway attachment for the S3 endpoint.

Interface endpoints cho S3 tốn phí (hourly + data processing) không phù hợp, gateway endpoints miễn phí hợp lí hơn

Không cần interface endpoint khi gateway endpoint đủ dùng cho S3

❌ Create an S3 access point for each application in each AWS account and attach the access points to the S3 bucket. Update the bucket policy to require access from an access point. Specify the route table accessible only from the application's VPC.

S3 Access Points phải được tạo trong account sở hữu bucket, chứ không phải trong từng application account

❌ Create a gateway endpoint for Amazon S3 in the data lake's VPC. Attach an endpoint policy to allow access to the S3 bucket. Specify the route table to access the bucket.

Gateway endpoint trong data lake's VPC không giúp applications các VPC khác access S3 được

Mỗi application VPC cần gateway endpoint của riêng nó mới đúng

🔑 Tips and tricks:

S3 Access Points: tạo trong bucket's account (không phải consumer accounts)

S3 Access Point VPC restriction: access point chỉ accept requests từ specified VPC

Gateway endpoint cho S3 = free, private; Interface endpoint cho S3 = có phí

Mỗi VPC cần gateway endpoint riêng để access S3 mà không qua internet

📖 Reference:

Amazon S3 Access Points - https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html

VPC restrictions with S3 Access Points - https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-vpc.html


Question 48:
Skipped
A solutions architect wants to make sure that only AWS users or roles with suitable permissions can access a new Amazon API Gateway endpoint. The solutions architect wants an end-to-end view of each request to analyze the latency of the request and create service maps.

How can the solutions architect design the API Gateway access control and perform request inspections?


A.
For the API Gateway method, set the authorization to AWS_IAM. Then, give the IAM user or role execute-api:Invoke permission on the REST API resource. Enable the API caller to sign requests with AWS Signature when accessing the endpoint. Use AWS X-Ray to trace and analyze user requests to API Gateway.

B.
For the API Gateway resource, set CORS to enabled and only return the company's domain in Access-Control-Allow-Origin headers. Then, give the IAM user or role execute-api:Invoke permission on the REST API resource. Use Amazon CloudWatch to trace and analyze user requests to API Gateway.

C.
Create an AWS Lambda function as the custom authorizer, ask the API client to pass the key and secret when making the call, and then use Lambda to validate the key/secret pair against the IAM system. Use AWS X-Ray to trace and analyze user requests to API Gateway.

D.
Create a client certificate for API Gateway. Distribute the certificate to the AWS users and roles that need to access the endpoint. Enable the API caller to pass the client certificate when accessing the endpoint. Use Amazon CloudWatch to trace and analyze user requests to API Gateway.

Explanation

📝 Tóm tắt đề:

API Gateway endpoint chỉ cho phép IAM users/roles có permissions phù hợp

Cần end-to-end view (xem được request từ đầu đến cuối) của mỗi request để phân tích latency và create service maps

✅ Đáp án đúng:

For the API Gateway method, set the authorization to AWS_IAM. Then, give the IAM user or role execute-api:Invoke permission on the REST API resource. Enable the API caller to sign requests with AWS Signature when accessing the endpoint. Use AWS X-Ray to trace and analyze user requests to API Gateway.

AWS_IAM authorization: chỉ IAM principals với execute-api:Invoke permission mới có thể call API, đáp ứng yêu cầu hạn chế truy cập API thông qua IAM

Requests phải được sign bằng AWS Signature Version 4 (SigV4) để xác thực identity qua IAM credentials

AWS X-Ray cung cấp: end-to-end request tracing, latency analysis, service maps (hiển thị hoá luồng request)

X-Ray service maps chính xác là feature đề bài yêu cầu ("create service maps")

Các đáp án sai:

❌ For the API Gateway resource, set CORS to enabled and only return the company's domain in Access-Control-Allow-Origin headers. Then, give the IAM user or role execute-api:Invoke permission on the REST API resource. Use Amazon CloudWatch to trace and analyze user requests to API Gateway.

CORS là browser-based security mechanism, không phải cơ chế cho API authentication/authorization

CloudWatch cung cấp metrics và logs nhưng không có service maps như X-Ray

❌ Create an AWS Lambda function as the custom authorizer, ask the API client to pass the key and secret when making the call, and then use Lambda to validate the key/secret pair against the IAM system. Use AWS X-Ray to trace and analyze user requests to API Gateway.

Custom Lambda authorizer có thể validate keys nhưng phức tạp hơn cần thiết khi dùng xác thực AWS_IAM đã giải quyết được vấn đề

Hơn nữa solution này không dùng xác thực IAM như đề bài yêu cầu

❌ Create a client certificate for API Gateway. Distribute the certificate to the AWS users and roles that need to access the endpoint. Enable the API caller to pass the client certificate when accessing the endpoint. Use Amazon CloudWatch to trace and analyze user requests to API Gateway.

Client certificates không phải cơ chế authorization cho API thông qua IAM

CloudWatch không có service maps

🔑 Tips and tricks:

"IAM users/roles có permissions" + API Gateway → AWS_IAM authorization (AWS_IAM, không phải Lambda authorizer)

AWS_IAM: callers phải sign request với SigV4 (IAM access key + secret key)

"Latency analysis" + "service maps" → AWS X-Ray (CloudWatch có metrics nhưng không có service maps)

📖 Reference:

Controlling access to HTTP APIs with IAM - https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-access-control-iam.html

AWS X-Ray with API Gateway - https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-xray.html


Question 49:
Skipped
A company has an application in the AWS Cloud. The application runs on a fleet of 20 Amazon EC2 instances. The EC2 instances are persistent and store data on multiple attached Amazon EBS volumes.

The company must maintain backups in a separate AWS Region. The company must be able to recover the EC2 instances and their configuration within 1 business day, with loss of no more than 1 day's worth of data. The company has limited staff and needs a backup solution that optimizes operational efficiency and cost. The company already has created an AWS CloudFormation template that can deploy the required resources configuration in a secondary Region.

Which solution will meet these requirements?


A.
Deploy EC2 instances of the same size and configuration to the secondary Region. Configure AWS DataSync daily to copy data from the primary Region to the secondary Region. In the event of a failure, launch the CloudFormation template and transfer usage to the secondary Region.

B.
Use AWS Backup to create a scheduled daily backup plan for the EC2 instances. Configure the backup task to copy the backups to a vault in the secondary Region. In the event of a failure, launch the CloudFormation template, restore the instance volumes and configurations from the backup vault, and transfer usage to the secondary Region.

C.
Use Amazon Data Lifecycle Manager to create daily multivolume snapshots of the EBS volumes and copy them to the secondary Region. In the event of a failure, launch the CloudFormation templates and use Amazon DLM to restore the EBS volumes to the secondary Region.

D.
Create a second CloudFormation template that can recreate the EC2 instances in the secondary Region. Run daily multivolume snapshots by using AWS Systems Manager Automation runbooks, and copy the snapshots to the secondary Region. In the event of a failure, launch the CloudFormation templates, restore the EBS volumes from snapshots, and transfer usage to the secondary Region.

Explanation

📝 Tóm tắt đề:

20 EC2 instances với nhiều EBS volumes

Backup cần ở AWS Region khác

RTO: 1 business day, RPO: 1 day

Ít nhân viên → operational efficiency (cần vận hành tối ưu)

CloudFormation template đã có để deploy resources ở secondary Region

→ Yêu cầu: daily backup, cross-Region copy, restore từ backup vault

✅ Đáp án đúng:

Use AWS Backup to create a scheduled daily backup plan for the EC2 instances. Configure the backup task to copy the backups to a vault in the secondary Region. In the event of a failure, launch the CloudFormation template, restore the instance volumes and configurations from the backup vault, and transfer usage to the secondary Region.

AWS Backup là managed service giúp quản lí việc backup tự động, có cơ chế cross-Region copy cho backup plan → tự động copy đến secondary Region

Backup vault trong secondary Region sẽ chứa các bản backup này → cho phép restore EC2 instances và EBS volumes từ vault

Khi sự cố xảy ra thì dùng CloudFormation kết hợp các bản backup trong AWS Backup để khôi phục, là solution DR hoàn chỉnh

Operational efficiency: AWS Backup managed, không cần custom automation hay SSM runbooks

Các đáp án sai:

❌ Create a second CloudFormation template that can recreate the EC2 instances in the secondary Region. Run daily multivolume snapshots by using AWS Systems Manager Automation runbooks, and copy the snapshots to the secondary Region. In the event of a failure, launch the CloudFormation templates, restore the EBS volumes from snapshots, and transfer usage to the secondary Region.

SSM Automation runbooks để snapshot là custom solution → high operational overhead

Tạo second CFN template khi đã có template là thừa thãi và không cần thiết

AWS Backup đơn giản hơn nhiều so với custom SSM runbooks

❌ Use Amazon Data Lifecycle Manager to create daily multivolume snapshots of the EBS volumes and copy them to the secondary Region. In the event of a failure, launch the CloudFormation templates and use Amazon DLM to restore the EBS volumes to the secondary Region.

Amazon DLM quản lý EBS snapshot lifecycle nhưng không thể "restore" EC2 instances từ snapshots tự động được

DLM chủ yếu quản lý snapshot thôi, không có chức năng recovery cho EC2

❌ Deploy EC2 instances of the same size and configuration to the secondary Region. Configure AWS DataSync daily to copy data from the primary Region to the secondary Region. In the event of a failure, launch the CloudFormation template and transfer usage to the secondary Region.

Deploy EC2 instances sẵn = warm standby pattern, tốn kém hơn (pay for running instances 24/7)

DataSync là file transfer service, không phải backup/restore solution cho EC2+EBS

"Limited staff, optimize efficiency" = AWS Backup là tốt nhất (fully managed, centralized)

🔑 Tips and tricks:

"Daily backup" + "cross-Region" + "operational efficiency" → AWS Backup (managed, centralized)

DLM = EBS snapshot lifecycle management only, không phải full backup solution

DataSync = file/object transfer service, không phải EC2/EBS backup

📖 Reference:

AWS Backup - https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html

AWS Backup cross-Region copy - https://docs.aws.amazon.com/aws-backup/latest/devguide/cross-region-backup.html


Question 50:
Skipped
A company wants to migrate its website from its on-premises data center to AWS. The website service APIs are hosted on Docker containers in a self-managed container platform. To meet compliance requirements, the company has installed proprietary security agent software on each container platform node. MySQL databases are installed on two separate VMs in a source-replica setup.

A solutions architect must design a solution to migrate the entire website environment to AWS.

Which solution will meet these requirements with the LEAST operational overhead?


A.
Create an Amazon EKS cluster that is configured with a managed node group. Use a custom AMI that has the proprietary security agent software. Deploy website services as Kubernetes pods. Migrate the MySQL database data to an Amazon RDS for MySQL DB instance by using AWS DMS. Add an additional read replica for a Multi-AZ deployment for the RDS DB instance.

B.
Deploy website services as containers on Amazon EC2 instances. For the EC2 instances, use a custom AMI that has the proprietary security agent software and container management software pre-installed. Migrate the MySQL database data to an Amazon Aurora DB cluster by using AWS DMS. Add an additional read replica to the Aurora DB cluster.

C.
Deploy website services as containers on AWS Lambda functions. Create an Amazon API Gateway API to serve incoming requests to Lambda functions on the backend. Save static content in an Amazon S3 bucket. Migrate the MySQL database data to an Amazon RDS for MySQL DB instance by using AWS DMS. Configure a Multi-AZ deployment for the RDS DB instance.

D.
Create an Amazon ECS cluster that uses the Fargate launch type. Configure Fargate with a custom AMI that has the proprietary security agent software pre-installed. Deploy website services as ECS tasks. Migrate the MySQL database data to an Amazon Aurora DB cluster by using AWS DMS. Add an additional read replica to the Aurora DB cluster.

Explanation

📝 Tóm tắt đề:

Docker containers trên self-managed cluster

Proprietary security agent phải được cài trên mỗi container platform node

MySQL source-replica setup → migrate lên AWS

→ Yêu cầu: container platform với custom AMI (security agent) + managed DB, LEAST operational overhead

✅ Đáp án đúng:

Deploy website services as containers on Amazon EC2 instances. For the EC2 instances, use a custom AMI that has the proprietary security agent software and container management software pre-installed. Migrate the MySQL database data to an Amazon Aurora DB cluster by using AWS DMS. Add an additional read replica to the Aurora DB cluster.

Custom AMI với security agent pre-installed → đáp ứng yêu cầu security agent trên mỗi node

Amazon Aurora là service tương ứng phù hợp cho MySQL trên cloud

AWS DMS migrate MySQL data sang Aurora với minimum downtime

Aurora read replica thay thế source-replica setup hiện tại

Các đáp án sai:

❌ Create an Amazon EKS cluster that is configured with a managed node group. Use a custom AMI that has the proprietary security agent software. Deploy website services as Kubernetes pods. Migrate the MySQL database data to an Amazon RDS for MySQL DB instance by using AWS DMS. Add an additional read replica for a Multi-AZ deployment for the RDS DB instance.

EKS managed node groups với custom AMI là khả thi nhưng EKS có operational overhead cao hơn ECS

Aurora cũng tốt hơn RDS trong trường hợp này, khi đề bài không nhắc đến việc tiết kiệm chi phí

❌ Deploy website services as containers on AWS Lambda functions. Create an Amazon API Gateway API to serve incoming requests to Lambda functions on the backend. Save static content in an Amazon S3 bucket. Migrate the MySQL database data to an Amazon RDS for MySQL DB instance by using AWS DMS. Configure a Multi-AZ deployment for the RDS DB instance.

Lambda không hỗ trợ cài proprietary security agent như EC2 được, do không có khả năng access vào OS

Lambda containers chạy trong AWS-managed environment, không phải custom environment

Không đáp ứng "security agent on each node" requirement

❌ Create an Amazon ECS cluster that uses the Fargate launch type. Configure Fargate with a custom AMI that has the proprietary security agent software pre-installed. Deploy website services as ECS tasks. Migrate the MySQL database data to an Amazon Aurora DB cluster by using AWS DMS. Add an additional read replica to the Aurora DB cluster.

AWS Fargate không hỗ trợ custom AMIs - Fargate là serverless platform, không phải EC2

Không thể cài security agent trên Fargate nodes vì không có access trên tầng OS được

🔑 Tips and tricks:

"Proprietary security agent on each node" → ECS với EC2 launch type hoặc EKS (không phải Fargate)

Fargate = serverless, không thể cài custom software trên host nodes

Custom AMI: cài pre-requisite software, launch EC2 instances từ AMI đó

"Least operational overhead" → ECS + EC2 < EKS

Aurora > RDS MySQL cho managed HA và performance

📖 Reference:

Amazon ECS with custom AMI - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html

Amazon Aurora - https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.html


Question 51:
Skipped
A company has an internal application running on AWS that is used to track and process shipments in the company's warehouse. Currently, after the system receives an order, it emails the staff the information needed to ship a package. Once the package is shipped, the staff replies to the email and the order is marked as shipped.

The company wants to stop using email in the application and move to a serverless application model.

Which architecture solution meets these requirements?


A.
Store new order information in Amazon EFS. Have instances pull the new information from the NFS and send that information to printers in the warehouse. Once the label has been scanned, as it leaves the warehouse, have Amazon API Gateway call the instances to remove the order information from Amazon EFS.

B.
Update the application to store new order information in Amazon DynamoDB. When a new order is created, trigger an AWS Step Functions workflow, mark the orders as "in progress," and print a package label to the warehouse. Once the label has been scanned and fulfilled, the application will trigger an AWS Lambda function that will mark the order as shipped and complete the workflow.

C.
When a new order is created, store the order information in Amazon SQS. Have AWS Lambda check the queue every 5 minutes and process any needed work. When an order needs to be shipped, have Lambda print the label in the warehouse. Once the label has been scanned, as it leaves the warehouse, have an Amazon EC2 instance update Amazon SQS.

D.
Use AWS Batch to configure the different tasks required to ship a package. Have AWS Batch trigger an AWS Lambda function that creates and prints a shipping label. Once that label is scanned, as it leaves the warehouse, have another Lambda function move the process to the next step in the AWS Batch job.

Explanation

📝 Tóm tắt đề:

Warehouse shipment tracking app

Hiện tại: nhận order → email staff → staff reply email → mark as shipped

Muốn serverless application model thay thế email workflow

→ Yêu cầu: event-driven serverless workflow cho warehouse process

✅ Đáp án đúng:

Update the application to store new order information in Amazon DynamoDB. When a new order is created, trigger an AWS Step Functions workflow, mark the orders as "in progress," and print a package label to the warehouse. Once the label has been scanned and fulfilled, the application will trigger an AWS Lambda function that will mark the order as shipped and complete the workflow.

DynamoDB là managed service, có thể lưu order lâu dài, scale tốt

Step Functions quản lí multi-step workflow: nhận order → in nhãn sản phẩm → chờ scan → đánh dấu là đã shipped

Lambda execute các actions cụ thể (update order status)

Serverless hoàn toàn: DynamoDB + Step Functions + Lambda, không cần EC2 hay quản lý infrastructure

Các đáp án sai:

❌ Use AWS Batch to configure the different tasks required to ship a package. Have AWS Batch trigger an AWS Lambda function that creates and prints a shipping label. Once that label is scanned, as it leaves the warehouse, have another Lambda function move the process to the next step in the AWS Batch job.

AWS Batch là batch computing service cho các tác vụ xử lý job compute lớn, không phù hợp với workflow serverless như Lambda

Solution này khá phức tạp cho shipping workflow orchestration

❌ When a new order is created, store the order information in Amazon SQS. Have AWS Lambda check the queue every 5 minutes and process any needed work. When an order needs to be shipped, have Lambda print the label in the warehouse. Once the label has been scanned, as it leaves the warehouse, have an Amazon EC2 instance update Amazon SQS.

"Lambda check queue every 5 minutes" = polling, không phải event-driven - order sẽ không được xử lý ngay

Hơn nữa dùng EC2 thì không phải là kiến trúc serverless như đề yêu cầu

❌ Store new order information in Amazon EFS. Have instances pull the new information from the NFS and send that information to printers in the warehouse. Once the label has been scanned, as it leaves the warehouse, have Amazon API Gateway call the instances to remove the order information from Amazon EFS.

EFS và "instances" = không phải serverless

🔑 Tips and tricks:

"Serverless" + "multi-step workflow" → AWS Step Functions (orchestration)

"Store state" + serverless → DynamoDB (not relational DB, not SQS)

📖 Reference:

AWS Step Functions - https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html

Step Functions callback pattern - https://docs.aws.amazon.com/step-functions/latest/dg/callback-task-sample-sqs.html


Question 52:
Skipped
A company needs to use an AWS Transfer Family SFTP-enabled server with an Amazon S3 bucket to receive updates from a third-party data supplier. The data is encrypted with Pretty Good Privacy (PGP) encryption. The company needs a solution that will automatically decrypt the data after the company receives the data.

A solutions architect will use a Transfer Family managed workflow. The company has created an IAM service role by using an IAM policy that allows access to AWS Secrets Manager and the S3 bucket. The role's trust relationship allows the transfer.amazonaws.com service to assume the role.

What should the solutions architect do next to complete the solution for automatic decryption?


A.
Store the PGP private key in Secrets Manager. Add a nominal step in the Transfer Family managed workflow to decrypt files. Configure PGP decryption parameters in the nominal step. Associate the workflow with the Transfer Family server.

B.
Store the PGP private key in Secrets Manager. Add an exception-handling step in the Transfer Family managed workflow to decrypt files. Configure PGP encryption parameters in the exception handler. Associate the workflow with the SFTP user.

C.
Store the PGP public key in Secrets Manager. Add an exception-handling step in the Transfer Family managed workflow to decrypt files. Configure PGP decryption parameters in the exception handler. Associate the workflow with the SFTP user.

D.
Store the PGP public key in Secrets Manager. Add a nominal step in the Transfer Family managed workflow to decrypt files. Configure PGP encryption parameters in the nominal step. Associate the workflow with the Transfer Family server.

Explanation

📝 Tóm tắt đề:

Transfer Family SFTP server + S3 bucket nhận dữ liệu từ bên thứ 3

Dữ liệu được mã hóa bằng PGP encryption

IAM role đã tạo với quyền access Secrets Manager + S3

Transfer Family managed workflow sẽ tự động decrypt sau khi nhận

→ Yêu cầu: hoàn thiện cấu hình để workflow tự động decrypt PGP

✅ Đáp án đúng:

Store the PGP private key in Secrets Manager. Add a nominal step in the Transfer Family managed workflow to decrypt files. Configure PGP decryption parameters in the nominal step. Associate the workflow with the Transfer Family server.

PGP private key dùng để giải mã, có thể lưu an toàn trong Secrets manager

Nominal step là bước xử lý file trong flow thông thường của Transfer Family, có thể thực hiện giải mã ở đây

Associate với Transfer Family server (không phải SFTP user): áp dụng cho mọi file upload đến server, không giới hạn theo user

Các đáp án sai:

❌ Store the PGP public key in Secrets Manager. Add a nominal step in the Transfer Family managed workflow to decrypt files. Configure PGP encryption parameters in the nominal step. Associate the workflow with the Transfer Family server.

Public key không dùng để giải mã (public key dùng để encrypt); chỉ private key mới decrypt được

"PGP encryption parameters" là không đúng - workflow thực hiện decryption, do đó phải cấu hình decryption parameters

❌ Store the PGP private key in Secrets Manager. Add an exception-handling step in the Transfer Family managed workflow to decrypt files. Configure PGP encryption parameters in the exception handler. Associate the workflow with the SFTP user.

Exception handler không phải nơi thực hiện decryption - exception handler để xử lý khi lỗi xảy ra

Associate với SFTP user là phạm vi quá hẹp; associate với server sẽ áp dụng cho toàn bộ uploads

❌ Store the PGP public key in Secrets Manager. Add an exception-handling step in the Transfer Family managed workflow to decrypt files. Configure PGP decryption parameters in the exception handler. Associate the workflow with the SFTP user.

Mắc các lỗi sai tương tự như 2 đáp án sai ở trên

🔑 Tips and tricks:

PGP asymmetric crypto: public key = encrypt; private key = decrypt → lưu private key để decrypt

Transfer Family managed workflow: nominal step = normal processing flow; exception handler = error handling

"Decrypt incoming data" → nominal step (not exception handler)

Associate workflow với server khi muốn áp dụng cho tất cả uploads; associate với SFTP user cho per-user workflow

Secrets Manager: lưu private key an toàn; Transfer Family IAM role có quyền đọc từ Secrets Manager

📖 Reference:

AWS Transfer Family managed workflows - https://docs.aws.amazon.com/transfer/latest/userguide/transfer-workflows.html

PGP decryption step in Transfer Family - https://docs.aws.amazon.com/transfer/latest/userguide/nominal-steps-workflow.html


Question 53:
Skipped
A software as a service (SaaS) company provides a media software solution to customers. The solution is hosted on 50 VPCs across various AWS accounts. One of the VPCs is designated as a management VPC. The compute resources in the VPCs work independently.

The company has developed a new feature that requires all 50 VPCs to be able to communicate with each other. The new feature also requires one-way access from each customer's VPC to the company's management VPC. The management VPC hosts a compute resource that validates licenses for the media software solution. The number of VPCs that the company will use to host the solution will continue to increase as the solution grows.

Which combination of steps will provide the required VPC connectivity with the LEAST operational overhead? (Select TWO.)


A.
Create a VPC peering connection between the company's management VPC and each customer's VPC.

B.
Create a VPN appliance in each customer's VPC. Connect the company's management VPC to each customer's VPC by using AWS Site-to-Site VPN.

C.
Create a Network Load Balancer (NLB) that points to the compute resource for license validation. Create an AWS PrivateLink endpoint service that is available to each customer's VPC. Associate the endpoint service with the NLB.

D.
Create VPC peering connections between all the company's VPCs.

E.
Create a transit gateway. Attach all the company's VPCs and relevant subnets to the transit gateway.

Explanation

📝 Tóm tắt đề:

SaaS company, 50 VPCs trên nhiều accounts

Một VPC là management VPC (license validation)

Yêu cầu mới: tất cả 50 VPCs liên lạc với nhau (full mesh) + one-way access từ mỗi customer VPC đến management VPC

Số lượng VPCs sẽ tiếp tục tăng

→ Yêu cầu: kết nối đầy đủ + least operational overhead (Select TWO)

✅ Đáp án đúng:

Create a transit gateway. Attach all the company's VPCs and relevant subnets to the transit gateway.

Transit Gateway là hub-and-spoke networking service, cho phép thông qua 1 TGW có thể kết nối tất cả VPCs trên cùng region

Khi số VPCs tăng: chỉ cần thêm attachment vào TGW, đơn giản

Create a Network Load Balancer (NLB) that points to the compute resource for license validation. Create an AWS PrivateLink endpoint service that is available to each customer's VPC. Associate the endpoint service with the NLB.

PrivateLink: cho phép one-way access từ customer VPCs đến management VPC - customer gọi đến endpoint service, không có connectivity ngược lại

NLB là required front-end cho PrivateLink endpoint service

Khi VPCs mới được thêm: chỉ cần accept the endpoint connection request, không cần tái cấu hình networking

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create VPC peering connections between all the company's VPCs.

VPC Peering là bất khả thi khi có quá nhiều VPC cần kết nối với nhau

Operational overhead cực cao - không scale được

❌ Create a VPN appliance in each customer's VPC. Connect the company's management VPC to each customer's VPC by using AWS Site-to-Site VPN.

Custom VPN appliance trong mỗi VPC: phải quản lý, vá lỗi, tốn effort

Không giải quyết yêu cầu kết nối full mesh giữa tất cả VPCs

❌ Create a VPC peering connection between the company's management VPC and each customer's VPC.

Chỉ giải quyết kết nối giữa management VPC ↔ customer VPC, không giải quyết full mesh giữa các customer VPCs với nhau

🔑 Tips and tricks:

"N VPCs full mesh" → Transit Gateway (tránh n*(n-1)/2 peering connections)

"One-way access" + "consumer calls provider" → AWS PrivateLink (endpoint service)

PrivateLink cần NLB ở phía provider (management VPC)

VPC peering: không transitive, không scale; TGW: transitive routing, scale tốt

TGW + PrivateLink kết hợp: TGW cho east-west (VPC-VPC), PrivateLink cho north-south (service access)

📖 Reference:

AWS Transit Gateway - https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html

AWS PrivateLink - https://docs.aws.amazon.com/vpc/latest/privatelink/what-is-privatelink.html


Question 54:
Skipped
A large company is running a popular web application. The application runs on several Amazon EC2 Linux instances in an Auto Scaling group in a private subnet. An Application Load Balancer is targeting the instances in the Auto Scaling group in the private subnet. AWS Systems Manager Session Manager is configured, and AWS Systems Manager Agent is running on all the EC2 instances.

The company recently released a new version of the application. Some EC2 instances are now being marked as unhealthy and are being terminated. As a result, the application is running at reduced capacity. A solutions architect tries to determine the root cause by analyzing Amazon CloudWatch logs that are collected from the application, but the logs are inconclusive.

How should the solutions architect gain access to an EC2 instance to troubleshoot the issue?


A.
Suspend the Auto Scaling group's HealthCheck scaling process. Use Session Manager to log in to an instance that is marked as unhealthy.

B.
Enable EC2 instance termination protection. Use Session Manager to log in to an instance that is marked as unhealthy.

C.
Suspend the Auto Scaling group's Terminate process. Use Session Manager to log in to an instance that is marked as unhealthy.

D.
Set the termination policy to OldestInstance on the Auto Scaling group. Use Session Manager to log in to an instance that is marked as unhealthy.

Explanation

📝 Tóm tắt đề:

EC2 instances trong Auto Scaling group (private subnet) sau ALB

Systems Manager Session Manager đã cấu hình, SSM Agent đang chạy trên tất cả instances

New version deploy → một số instances bị marked as unhealthy và bị terminate

App chạy ở reduced capacity; CloudWatch logs không đủ thông tin

→ Yêu cầu: truy cập vào instance unhealthy trước khi bị terminate để debug

✅ Đáp án đúng:

Suspend the Auto Scaling group's Terminate process. Use Session Manager to log in to an instance that is marked as unhealthy.

Suspend Terminate process: ngăn Auto Scaling group terminate instances, kể cả những instance đã được đánh dấu unhealthy

Instance unhealthy vẫn tồn tại sau khi suspend Terminate → architect có thể login để debug

Session Manager: shell access đến EC2 instance qua AWS console, không cần SSH hay bastion host

Các đáp án sai:

❌ Suspend the Auto Scaling group's HealthCheck scaling process. Use Session Manager to log in to an instance that is marked as unhealthy.

Suspend HealthCheck chỉ ngăn Auto Scaling group thực hiện health checks - nó không ngăn terminate instances đã được đánh dấu unhealthy trước đó

Instances đã unhealthy trước khi suspend HealthCheck vẫn sẽ bị Terminate process xử lý

❌ Enable EC2 instance termination protection. Use Session Manager to log in to an instance that is marked as unhealthy.

EC2 termination protection có thể chặn việc xoá EC2 thủ công từ console hay CLI, nhưng Auto Scaling group thì sẽ không bị ảnh hưởng bởi setting này và vẫn có thể xoá EC2 như bình thường

❌ Set the termination policy to OldestInstance on the Auto Scaling group. Use Session Manager to log in to an instance that is marked as unhealthy.

OldestInstance termination policy thay đổi thứ tự terminate instances khi scale in, nhưng không ngăn việc terminate instances unhealthy

Architect vẫn không có đủ thời gian để truy cập instance trước khi bị terminate

🔑 Tips and tricks:

"Giữ instance unhealthy để debug" → Suspend Terminate process (không phải HealthCheck)

Session Manager: không cần SSH key, không cần bastion host, hoạt động trong private subnet

📖 Reference:

Suspending and resuming scaling processes - https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html

AWS Systems Manager Session Manager - https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html


Question 55:
Skipped
A company is launching a new online game on Amazon EC2 instances. The game must be available globally. The company plans to run the game in three AWS Regions: us-east-1, eu-west-1, and ap-southeast-1. The game's leaderboards, player inventory, and event status must be available across Regions.

A solutions architect must design a solution that will give any Region the ability to scale to handle the load of all Regions. Additionally, users must automatically connect to the Region that provides the least latency.

Which solution will meet these requirements with the LEAST operational overhead?


A.
Create an Auto Scaling group for the EC2 instances. Attach the Auto Scaling group to a Network Load Balancer (NLB) in each Region. For each Region, create an Amazon Route 53 entry that uses latency-based routing and points to the NLB in that Region. Save the game metadata to MySQL databases on EC2 instances in each Region.

B.
Create an Auto Scaling group for the EC2 instances. Attach the Auto Scaling group to a Network Load Balancer (NLB) in each Region. Create an Amazon Route 53 entry that uses geoproximity routing and points to the NLB in that Region. Save the game metadata to an Amazon RDS for MySQL DB instance in each Region. Set up replication between the database EC2 instances in each Region.

C.
Use EC2 Global View. Deploy the EC2 instances to each Region. Attach the instances to a Network Load Balancer (NLB) in each Region. For each Region, create an instance in each Region. Set up custom logic on each DNS server to redirect the user to the Region that provides the lowest latency. Save the game metadata to an Amazon DynamoDB global table.

D.
Create an EC2 Spot Fleet. Attach the Spot Fleet to a Network Load Balancer (NLB) in each Region. Create an AWS Global Accelerator IP address that points to the NLB. Create an Amazon Route 53 latency-based routing entry for the Global Accelerator IP address. Save the game metadata to an Amazon RDS for MySQL DB instance in each Region. Set up a read replica in the other Regions.

Explanation

📝 Tóm tắt đề:

Online game chạy trên EC2 instances, 3 Regions: us-east-1, eu-west-1, ap-southeast-1

Leaderboards, player inventory, event status phải available cross-Region

Mỗi Region phải có khả năng scale để handle load của tất cả Regions

Users tự động kết nối đến Region có latency thấp nhất

→ Yêu cầu: multi-Region, latency-based routing, any-Region scale, LEAST operational overhead

✅ Đáp án đúng:

Create an Auto Scaling group for the EC2 instances. Attach the Auto Scaling group to a Network Load Balancer (NLB) in each Region. For each Region, create an Amazon Route 53 entry that uses latency-based routing and points to the NLB in that Region. Save the game metadata to MySQL databases on EC2 instances in each Region.

Auto Scaling group: scale up để handle load khi cần

NLB: có performance cao, layer 4 load balancing phù hợp cho game traffic (thấp hơn overhead so với ALB)

Route 53 latency-based routing: tự động route user đến Region có latency thấp nhất - đúng requirement

MySQL trên EC2 trong từng Region: đơn giản, không yêu cầu managed service phức tạp

Solution hợp lý và đáp ứng yêu cầu đề bài

Các đáp án sai:

❌ Create an EC2 Spot Fleet. Attach the Spot Fleet to a Network Load Balancer (NLB) in each Region. Create an AWS Global Accelerator IP address that points to the NLB. Create an Amazon Route 53 latency-based routing entry for the Global Accelerator IP address. Save the game metadata to an Amazon RDS for MySQL DB instance in each Region. Set up a read replica in the other Regions.

Spot Fleet không đảm bảo availability - Spot Instances có thể bị thu hồi bất cứ lúc (không phù hợp cho gaming)

Dùng cả Global Accelerator VÀ Route 53 latency-based là thừa thãi (hai cơ chế routing chồng chéo)

RDS read replicas không có khả năng ghi data ở các Regions phụ

❌ Create an Auto Scaling group for the EC2 instances. Attach the Auto Scaling group to a Network Load Balancer (NLB) in each Region. Create an Amazon Route 53 entry that uses geoproximity routing and points to the NLB in that Region. Save the game metadata to an Amazon RDS for MySQL DB instance in each Region. Set up replication between the database EC2 instances in each Region.

Geoproximity routing không routing dựa theo độ trễ - không đảm bảo lowest latency

"Replication between the database EC2 instances" là custom solution - operational overhead cao

❌ Use EC2 Global View. Deploy the EC2 instances to each Region. Attach the instances to a Network Load Balancer (NLB) in each Region. For each Region, create an instance in each Region. Set up custom logic on each DNS server to redirect the user to the Region that provides the lowest latency. Save the game metadata to an Amazon DynamoDB global table.

EC2 Global View là read-only console view để xem tất cả EC2 resources, không phải traffic routing feature

"Custom logic on each DNS server" = custom development, không phải managed AWS solution - high operational overhead

DynamoDB global tables sẽ tốt cho leaderboard nhưng "custom DNS logic" là deal-breaker

🔑 Tips and tricks:

"Users kết nối Region có latency thấp nhất" → Route 53 latency-based routing (không phải geoproximity)

Không ưu tiên chọn các solution custom trong các đáp án, ưu tiên các chức năng managed của AWS hơn

📖 Reference:

Amazon Route 53 latency-based routing - https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-latency.html


Question 56:
Skipped
A large company recently experienced an unexpected increase in Amazon RDS and Amazon DynamoDB costs. The company needs to increase visibility into details of AWS Billing and Cost Management. There are various accounts associated with AWS Organizations, including many development and production accounts. There is no consistent tagging strategy across the organization, but there are guidelines in place that require all infrastructure to be deployed using AWS CloudFormation with consistent tagging. Management requires cost center numbers and project ID numbers for all existing and future DynamoDB tables and RDS instances.

Which strategy should the solutions architect provide to meet these requirements?


A.
Use Tag Editor to tag existing resources. Create cost allocation tags to define the cost center and project ID. Use SCPs to restrict resource creation that do not have the cost center and project ID on the resource.

B.
Create cost allocation tags to define the cost center and project ID and allow 24 hours for tags to propagate to existing resources. Update existing federated roles to restrict privileges to provision resources that do not include the cost center and project ID on the resource.

C.
Use Tag Editor to tag existing resources. Create cost allocation tags to define the cost center and project ID and allow 24 hours for tags to propagate to existing resources.

D.
Use an AWS Config rule to alert the finance team of untagged resources. Create a centralized AWS Lambda based solution to tag untagged RDS databases and DynamoDB resources every hour using a cross-account role.

Explanation

📝 Tóm tắt đề:

Chi phí RDS và DynamoDB tăng đột biến, cần visibility vào billing

Nhiều accounts trong AWS Organizations, có development và production accounts

Không có tagging strategy nhất quán, nhưng có guidelines yêu cầu dùng CloudFormation với consistent tagging

Cần cost center numbers và project ID cho tất cả RDS instances và DynamoDB tables hiện tại lẫn tương lai

→ Yêu cầu: tag existing resources + enforce tagging cho future resources

✅ Đáp án đúng:

Use Tag Editor to tag existing resources. Create cost allocation tags to define the cost center and project ID. Use SCPs to restrict resource creation that do not have the cost center and project ID on the resource.

Tag Editor: cho phép tag hàng loạt resources hiện tại trên nhiều accounts và Regions từ một nơi

Cost allocation tags: activate tags trong AWS Billing → tags xuất hiện trong cost reports và Cost Explorer, cho phép sàng lọc chi phí theo tag

SCPs (Service Control Policies): giúp ngăn chặn việc tạo resource nếu thiếu tags, áp dụng cho tất cả accounts trong organization, đảm bảo rằng tất cả resource được tạo trong tương lai sẽ có tag

Solution giải quyết đồng thời cả existing (Tag Editor) và future (SCP) resources

Các đáp án sai:

❌ Use Tag Editor to tag existing resources. Create cost allocation tags to define the cost center and project ID and allow 24 hours for tags to propagate to existing resources.

Tag Editor + cost allocation tags giải quyết existing resources nhưng không có cơ chế bắt buộc tagging cho resource tạo trong tương lai

Không có SCP hay policy nào ngăn tạo resource mới không có tags

❌ Use an AWS Config rule to alert the finance team of untagged resources. Create a centralized AWS Lambda based solution to tag untagged RDS databases and DynamoDB resources every hour using a cross-account role.

Config rule chỉ alert (cảnh báo), không có cơ chế ngăn việc tạo resource không có tag

Cross-account Lambda là custom solution với operational overhead cao

❌ Create cost allocation tags to define the cost center and project ID and allow 24 hours for tags to propagate to existing resources. Update existing federated roles to restrict privileges to provision resources that do not include the cost center and project ID on the resource.

Federated roles chỉ áp dụng cho users dùng federated identity, mà đề bài không đề cập đến việc này

Sử dụng SCPs sẽ toàn diện hơn, cho phép kiểm soát permission ở level acocunt

Solution này cũng thiếu Tag Editor để tag resource hiện tại

🔑 Tips and tricks:

"Existing resources" + "bulk tagging" → Tag Editor (multi-account, multi-Region)

"Future resources" + "enforce tagging" → SCPs (preventive)

📖 Reference:

AWS Tag Editor - https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html

Service Control Policies - https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html

Cost allocation tags - https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html


Question 57:
Skipped
A company is collecting a large amount of data from a fleet of IoT devices. Data is stored as Optimized Row Columnar (ORC) files in the Hadoop Distributed File System (HDFS) on a persistent Amazon EMR cluster. The company's data analytics team queries the data by using SQL in Apache Presto deployed on the same EMR cluster. Queries scan large amounts of data, always run for less than 15 minutes, and run only between 5 PM and 10 PM.

The company is concerned about the high cost associated with the current solution. A solutions architect must propose the most cost-effective solution that will allow SQL data queries.

Which solution will meet these requirements?


A.
Store data in Amazon S3. Use Amazon Redshift Spectrum to query data.

B.
Store data in Amazon S3. Use the AWS Glue Data Catalog and Amazon Athena to query data.

C.
Store data in Amazon Redshift. Use Amazon Redshift to query data.

D.
Store data in EMR File System (EMRFS). Use Presto in Amazon EMR to query data.

Explanation

📝 Tóm tắt đề:

IoT fleet data lưu trong ORC files trên HDFS của persistent EMR cluster

Queries chạy bằng SQL (Apache Presto) trên cùng EMR cluster

Queries chỉ chạy từ 5 PM đến 10 PM (5 giờ/ngày)

Scan lượng data lớn, queries chạy dưới 15 phút

Công ty lo ngại chi phí cao của giải pháp hiện tại

→ Yêu cầu: cost-effective solution cho SQL queries

✅ Đáp án đúng:

Store data in Amazon S3. Use the AWS Glue Data Catalog and Amazon Athena to query data.

Amazon S3: lưu ORC files (Athena native support ORC format)

AWS Glue Data Catalog: định nghĩa catalog metadata của ORC files trong S3 để Athena có thể query được

Amazon Athena: serverless, chỉ tính phí theo lượng data scan - queries chạy 5 giờ/ngày, không trả phí 19 giờ còn lại

Athena hỗ trợ SQL queries, ORC format, scale tự động không cần quản lý cluster như EMR

So sánh với EMR persistent cluster: phải trả phí 24/7 dù chỉ query 5 giờ/ngày, tiết kiệm chi phí hơn nhiều

Các đáp án sai:

❌ Store data in Amazon S3. Use Amazon Redshift Spectrum to query data.

Redshift Spectrum yêu cầu Redshift cluster đang chạy → cũng phải trả phí cluster 24/7

Cluster cost đắt hơn nhiều so với Athena pay-per-query

Overkill cho query workload chỉ 5 giờ/ngày

❌ Store data in EMR File System (EMRFS). Use Presto in Amazon EMR to query data.

Không giải quyết vấn đề chi phí - EMR cluster vẫn phải trả phí 24/7

Giữ nguyên kiến trúc hiện tại → không optimize cost

❌ Store data in Amazon Redshift. Use Amazon Redshift to query data.

Redshift cluster chạy 24/7 → trả phí liên tục, không phù hợp workload 5 giờ/ngày

Athena vẫn là solution hợp lí và chi phí rẻ nhất

🔑 Tips and tricks:

"Queries chỉ chạy vài giờ/ngày" → Amazon Athena (pay per query, không trả idle cost)

Athena + S3 + Glue Data Catalog = serverless SQL analytics stack

ORC, Parquet, JSON: Athena native support, không cần chuyển đổi kiểu dữ liệu từ trước

📖 Reference:

Amazon Athena - https://docs.aws.amazon.com/athena/latest/ug/what-is.html

AWS Glue Data Catalog - https://docs.aws.amazon.com/glue/latest/dg/populate-data-catalog.html


Question 58:
Skipped
An online gaming company needs to rehost its gaming platform on AWS. The company's gaming application requires high performance computing (HPC) processing. The application has a leaderboard that updates frequently. The company uses an Amazon EC2 compute optimized instance that runs Ubuntu to host a Node.js application to display the game. The company tracks the state of the application in an on-premises Redis instance.

The company needs a migration strategy that optimizes application performance.

Which solution will meet these requirements?


A.
Create an Auto Scaling group of memory optimized Amazon EC2 On-Demand Instances behind an Application Load Balancer. Use an Amazon DynamoDB table to maintain the leaderboard.

B.
Create an Auto Scaling group of memory optimized Amazon EC2 Spot Instances behind an Application Load Balancer. Use an Amazon ElastiCache (Redis OSS) cluster to maintain the leaderboard.

C.
Create an Auto Scaling group of compute optimized Amazon EC2 Spot Instances behind an Application Load Balancer. Use an Amazon ElastiCache (Redis OSS) cluster to maintain the leaderboard.

D.
Create an Auto Scaling group of compute optimized Amazon EC2 On-Demand Instances behind an Application Load Balancer. Use an Amazon OpenSearch Service cluster to maintain the leaderboard.

Explanation

📝 Tóm tắt đề:

Online gaming platform cần rehost lên AWS

Application yêu cầu high performance computing (HPC) processing

Leaderboard cập nhật thường xuyên (Redis on-premises)

EC2 instance hiện đang dùng là compute optimized, Ubuntu, Node.js

→ Yêu cầu: migration strategy tối ưu application performance

✅ Đáp án đúng:

Create an Auto Scaling group of compute optimized Amazon EC2 Spot Instances behind an Application Load Balancer. Use an Amazon ElastiCache (Redis OSS) cluster to maintain the leaderboard.

Compute optimized instances: phù hợp với HPC (high CPU performance), giống instance type hiện đang dùng trên prem - like-for-like migration

Spot Instances: tối ưu chi phí cho compute-intensive HPC workload; gaming compute layer thường stateless (session state trong Redis). Mặc dù ở đây là hệ thống gaming mà lại dùng Spot Instances thì nghe không hợp lí lắm, tuy nhiên trong 4 đáp án thì đây vẫn là lựa chọn có thể chấp nhận được.

ElastiCache Redis: managed Redis thay thế on-premises Redis cluster, cùng engine/API (zero code change)

ElastiCache Redis có latency sub-millisecond, phù hợp cập nhật leaderboard thường xuyên

Các đáp án sai:

❌ Create an Auto Scaling group of memory optimized Amazon EC2 Spot Instances behind an Application Load Balancer. Use an Amazon ElastiCache (Redis OSS) cluster to maintain the leaderboard.

Memory optimized phù hợp workload cần lượng RAM lớn (in-memory databases, real-time big data processing)

Đề nói "high performance computing" và đang dùng compute optimized instance → phải giữ compute optimized

❌ Create an Auto Scaling group of compute optimized Amazon EC2 On-Demand Instances behind an Application Load Balancer. Use an Amazon OpenSearch Service cluster to maintain the leaderboard.

OpenSearch không dùng cho use case leaderboard - OpenSearch là search/analytics engine

❌ Create an Auto Scaling group of memory optimized Amazon EC2 On-Demand Instances behind an Application Load Balancer. Use an Amazon DynamoDB table to maintain the leaderboard.

Memory optimized không phù hợp HPC (cùng lý do như đáp án trên)

Với use case leaderboard thì DynamoDB không phù hợp, Redis phù hợp hơn

🔑 Tips and tricks:

"HPC (high performance computing)" → compute optimized EC2 instances (C-series)

"Leaderboard" + "frequent updates" → ElastiCache Redis (sorted sets: ZADD/ZRANGE O(log N))

"Migrate on-premises Redis" → ElastiCache Redis (like-for-like, same API, no code changes)

📖 Reference:

Amazon EC2 instance types - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html

Amazon ElastiCache for Redis - https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WhatIs.html


Question 59:
Skipped
A company has an on-premises monitoring solution using a PostgreSQL database for persistence of events. The database is unable to scale due to heavy ingestion and it frequently runs out of storage.

The company wants to create a hybrid solution and has already set up a VPN connection between its network and AWS. The solution should include the following attributes:

• Managed AWS services to minimize operational complexity.
• A buffer that automatically scales to match the throughput of data and requires no ongoing administration.
• A visualization tool to create dashboards to observe events in near-real time.
• Support for semi-structured JSON data and dynamic schemas.

Which combination of components will enable the company to create a monitoring solution that will satisfy these requirements? (Select TWO.)


A.
Use Amazon Data Firehose to buffer events. Create an AWS Lambda function to process and transform events.

B.
Configure Amazon OpenSearch Service to receive events. Use the OpenSearch Dashboards endpoint deployed with OpenSearch Service to create near-real-time visualizations and dashboards.

C.
Configure an Amazon Neptune DB instance to receive events. Use Amazon QuickSight to read from the database and create near-real-time visualizations and dashboards.

D.
Create an Amazon Kinesis data stream to buffer events. Create an AWS Lambda function to process and transform events.

E.
Configure an Amazon Aurora PostgreSQL DB cluster to receive events. Use Amazon QuickSight to read from the database and create near-real-time visualizations and dashboards.

Explanation

📝 Tóm tắt đề:

On-premises monitoring với PostgreSQL bị scaling issues và out of storage (hết storage)

Đã có VPN connection đến AWS

Yêu cầu:

Managed AWS services (minimize operational complexity)

Buffer tự động scale theo throughput, không cần administration liên tục

Visualization tool cho near-real-time dashboards (hiển thị hoá data)

Hỗ trợ semi-structured JSON và dynamic schemas

→ Yêu cầu: hybrid monitoring solution (Select TWO)

✅ Đáp án đúng:

Use Amazon Data Firehose to buffer events. Create an AWS Lambda function to process and transform events.

Amazon Data Firehose: fully managed delivery service, tự động scale theo throughput

"No ongoing administration": Firehose là serverless, không cần quản lý capacity

Lambda integration: giúp transform/process events trước khi deliver đến OpenSearch

Configure Amazon OpenSearch Service to receive events. Use the OpenSearch Dashboards endpoint deployed with OpenSearch Service to create near-real-time visualizations and dashboards.

OpenSearch Service: managed search/analytics engine, hỗ trợ native cho semi-structured JSON data và dynamic schemas (schema-less, documents không cần cùng field structure)

OpenSearch Dashboards: built-in visualization tool đi kèm với OpenSearch dùng để hiển thị hoá data near real time

Near-real-time: events stream vào OpenSearch trong seconds, Dashboards refresh real-time

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create an Amazon Kinesis data stream to buffer events. Create an AWS Lambda function to process and transform events.

Kinesis data stream yêu cầu manual shard management: phải chọn shard count upfront, re-shard khi throughput thay đổi

"Requires no ongoing administration" = Firehose (không phải Kinesis data stream)

Kinesis consumer cần code để consume records; Firehose là fire-and-forget delivery

❌ Configure an Amazon Aurora PostgreSQL DB cluster to receive events. Use Amazon QuickSight to read from the database and create near-real-time visualizations and dashboards.

Aurora PostgreSQL vẫn là relational database có schema cố định, không phù hợp "semi-structured JSON và dynamic schemas"

QuickSight có cần refresh data định kỳ, không phải near-real-time visualization

❌ Configure an Amazon Neptune DB instance to receive events. Use Amazon QuickSight to read from the database and create near-real-time visualizations and dashboards.

Neptune là graph database cho relationship data (friends, networks), không phải event monitoring

QuickSight không near-real-time (sai như đáp án trên)

Neptune không phù hợp với monitoring event use case

🔑 Tips and tricks:

"Buffer tự động scale, không cần administration" → Amazon Data Firehose (không phải Kinesis data stream)

"Semi-structured JSON + dynamic schemas" → OpenSearch (schema-free) không phải relational DB

"Near-real-time dashboards" → OpenSearch Dashboards (built-in với OpenSearch Service)

📖 Reference:

Amazon Data Firehose - https://docs.aws.amazon.com/firehose/latest/dev/what-is-this-service.html

Amazon OpenSearch Service - https://docs.aws.amazon.com/opensearch-service/latest/developerguide/what-is.html


Question 60:
Skipped
A large company is migrating its entire IT portfolio to AWS. Each business unit in the company has a standalone AWS account that supports both development and test environments. New accounts to support production workloads will be needed soon.

The finance department requires a centralized method for payment but must maintain visibility into each group's spending to allocate costs. The security team requires a centralized mechanism to control IAM usage in all the company's accounts.

What combination of the following options meet the company's needs with the LEAST effort? (Select TWO.)


A.
Require each business unit to use its own AWS accounts. Tag each AWS account appropriately and enable Cost Explorer to administer chargebacks.

B.
Use a collection of parameterized AWS CloudFormation templates defining common IAM permissions that are launched into each account. Require all new and existing accounts to launch the appropriate stacks to enforce the least privilege model.

C.
Consolidate all of the company's AWS accounts into a single AWS account. Use tags for billing purposes and the IAM's Access Advisor feature to enforce the least privilege model.

D.
Enable all features of AWS Organizations and establish appropriate service control policies that filter IAM permissions for sub-accounts.

E.
Use AWS Organizations to create a new organization from a chosen payer account and define an organizational unit hierarchy. Invite the existing accounts to join the organization and create new accounts using Organizations.

Explanation

📝 Tóm tắt đề:

Công ty migrate toàn bộ IT sang AWS, nhiều business units, mỗi unit có standalone AWS account

Finance department: cần centralized payment (trả phí tập trung) + xem được chi phí sử dụng của từng group nhân viên

Security team: cần centralized mechanism để kiểm soát IAM trong tất cả accounts

→ Yêu cầu: centralized billing + centralized IAM control, LEAST effort (Select TWO)

✅ Đáp án đúng:

Use AWS Organizations to create a new organization from a chosen payer account and define an organizational unit hierarchy. Invite the existing accounts to join the organization and create new accounts using Organizations.

AWS Organizations với payer account: consolidated billing tự động → finance department thấy tất cả chi phí trong một bill, có thể phân bổ chi phí theo account

OU hierarchy: tổ chức accounts theo business units → cost visibility per group

Invite existing accounts: không cần tạo lại accounts từ đầu (tốn ít effort)

Centralized payment qua payer/management account

Enable all features of AWS Organizations and establish appropriate service control policies that filter IAM permissions for sub-accounts.

Enable all features: mở khóa tính năng toàn bộ các tính năng của Organization như SCPs (không chỉ consolidated billing)

SCPs: cơ chế kiểm soát quyền cho tất cả accounts trong organization, cho phép security team kiểm soát toàn bộ quyền IAM từ management account, đáp ứng yêu cầu kiểm soát quyền tập trung

Các đáp án sai:

❌ Use a collection of parameterized AWS CloudFormation templates defining common IAM permissions that are launched into each account. Require all new and existing accounts to launch the appropriate stacks to enforce the least privilege model.

CFN templates IAM: phải deploy và quản lý trong từng account riêng → high operational overhead

❌ Require each business unit to use its own AWS accounts. Tag each AWS account appropriately and enable Cost Explorer to administer chargebacks.

Mỗi business unit dùng account riêng và Cost explorer để kiểm soát chi phí không phải là loại hình quản lý và thanh toán chi phí tập trung

❌ Consolidate all of the company's AWS accounts into a single AWS account. Use tags for billing purposes and the IAM's Access Advisor feature to enforce the least privilege model.

Gộp tất cả vào 1 account: đây là đi ngược lại best practice của AWS về quản lý account, khó quản lý billing tập trung, khó quản lý quyền hạn theo từng unit được

🔑 Tips and tricks:

"Centralized billing" + "multiple accounts" → AWS Organizations (consolidated billing)

"Centralized IAM control" → SCPs (Organizations all features mode)

📖 Reference:

AWS Organizations - https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html

Service Control Policies - https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html


Question 61:
Skipped
A company recently completed a successful proof of concept of Amazon WorkSpaces. A solutions architect needs to make the solution highly available across two AWS Regions. Amazon WorkSpaces is deployed in a failover Region, and a hosted zone is deployed in Amazon Route 53.

What should the solutions architect do to configure high availability for the solution?


A.
Create a connection alias in the primary Region. Associate the connection alias with a directory in the primary Region. Create a Route 53 weighted routing policy.

B.
Create a connection alias in the primary Region and in the failover Region. Associate the connection aliases with a directory in the primary Region. Create a Route 53 multivalue answer routing policy.

C.
Create a connection alias in the primary Region. Associate the connection alias with a directory in the failover Region. Create a Route 53 failover routing policy. Set Evaluate Target Health to Yes.

D.
Create a connection alias in the primary Region and in the failover Region. Associate the connection aliases with a directory in each Region. Create a Route 53 failover routing policy. Set Evaluate Target Health to Yes.

Explanation

📝 Tóm tắt đề:

Amazon WorkSpaces đã proof of concept thành công

Cần high availability trên 2 AWS Regions (primary + failover)

WorkSpaces đã deploy trong failover Region

Route 53 hosted zone đã có

→ Yêu cầu: cấu hình HA WorkSpaces với automatic failover

✅ Đáp án đúng:

Create a connection alias in the primary Region and in the failover Region. Associate the connection aliases with a directory in each Region. Create a Route 53 failover routing policy. Set Evaluate Target Health to Yes.

Connection aliases: WorkSpaces feature cho phép dùng custom domain để access thay vì registration code mặc định; mỗi alias phải được tạo trong Region chứa WorkSpaces deployment

Tạo alias trong cả hai Regions (primary và failover): mỗi Region có alias riêng

Associate với directory trong mỗi Region: directory là per-Region resource; phải associate đúng alias với đúng directory trong đúng Region

Route 53 failover routing policy: route đến primary khi healthy, tự động chuyển sang failover khi primary down

Evaluate Target Health = Yes: Route 53 health checks xác định khi nào trigger failover tự động

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create a connection alias in the primary Region and in the failover Region. Associate the connection aliases with a directory in the primary Region. Create a Route 53 multivalue answer routing policy.

Associate cả 2 aliases với directory ở primary Region: directory là per-Region, failover Region cần directory riêng; associate cross-Region không hoạt động được

Multivalue answer routing: không phải loại routing dùng cho việc failover tự động giữa 2 region

❌ Create a connection alias in the primary Region. Associate the connection alias with a directory in the primary Region. Create a Route 53 weighted routing policy.

Chỉ tạo alias ở primary Region: failover Region không có alias → không thể route đến failover Region

Weighted routing: phân phối % traffic (e.g. 70/30) cho từng target khác nhau, không phải dùng cho mục đích failover

Không giải quyết yêu cầu HA failover khi primary Region down

❌ Create a connection alias in the primary Region. Associate the connection alias with a directory in the failover Region. Create a Route 53 failover routing policy. Set Evaluate Target Health to Yes.

Chỉ tạo alias ở primary Region: sai như đáp án trên

Associate alias của primary Region với directory ở failover Region: cross-Region association không hợp lệ (directory và alias phải cùng Region)

Route 53 failover routing đúng nhưng WorkSpaces configuration sai

🔑 Tips and tricks:

WorkSpaces connection alias: phải tạo trong mỗi Region riêng biệt; không share cross-Region

Connection alias associate với directory trong cùng Region (directory là per-Region resource)

"Failover HA" → Route 53 failover routing policy + Evaluate Target Health = Yes

📖 Reference:

Amazon WorkSpaces cross-Region HA - https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html

Route 53 failover routing - https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-failover.html


Question 62:
Skipped
A retail company is mounting IoT sensors in all of its stores worldwide. During the manufacturing of each sensor, the company's private certificate authority (CA) issues an X.509 certificate that contains a unique serial number. The company then deploys each certificate to its respective sensor.

A solutions architect needs to give the sensors the ability to send data to AWS after they are installed. Sensors must not be able to send data to AWS until they are installed.

Which solution will meet these requirements?


A.
Create an AWS Lambda function that can validate the serial number. Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Add the Lambda function as a pre-provisioning hook. During manufacturing, call the RegisterThing API operation and specify the template and parameters.

B.
Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Add parameter validation in the template. Provision a claim certificate and a private key for each device that uses the CA. Grant AWS IoT Core service permissions to update AWS IoT things during provisioning.

C.
Create an AWS Lambda function that can validate the serial number. Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Add the Lambda function as a pre-provisioning hook. Register the CA with AWS IoT Core, specify the provisioning template, and set the allow-auto-registration parameter.

D.
Create an AWS Step Functions state machine that can validate the serial number. Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Specify the Step Functions state machine to validate parameters. Call the StartThingRegistrationTask API operation during installation.

Explanation

📝 Tóm tắt đề:

Retail company: IoT sensors lắp trong stores toàn cầu

Mỗi sensor có X.509 certificate từ private CA của công ty

Certificate chứa unique serial number

Sensors không được phép gửi data đến AWS cho đến khi được installed (lắp đặt)

→ Yêu cầu: provisioning sensors tự động khi installed, chặn trước khi installed

✅ Đáp án đúng:

Create an AWS Lambda function that can validate the serial number. Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Add the Lambda function as a pre-provisioning hook. Register the CA with AWS IoT Core, specify the provisioning template, and set the allow-auto-registration parameter.

Lambda pre-provisioning hook: validate serial number trước khi device được register → chỉ sensors hợp lệ mới được provision

Register CA với IoT Core + allow-auto-registration: cho phép Just-In-Time Provisioning (JITP) - khi sensor kết nối lần đầu với IoT Core (at installation/first power-on), IoT Core tự động trigger provisioning template

Flow: sensor installed → power on → connect to IoT Core → IoT Core thấy cert từ registered CA → trigger JITP → Lambda hook validates serial → device registered → sensor có thể gửi data

Các đáp án sai:

❌ Create an AWS Lambda function that can validate the serial number. Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Add the Lambda function as a pre-provisioning hook. During manufacturing, call the RegisterThing API operation and specify the template and parameters.

"Call the RegisterThing API during manufacturing": đây là bulk provisioning - device được register trong IoT Core lúc sản xuất, không phải lúc lặp đặt

Sensor đã registered trong IoT Core từ manufacturing → sensor có thể kết nối và gửi data ngay từ khi xuất xưởng, vi phạm yêu cầu "không gửi data cho đến khi lắp đặt xong"

Just-In-Time Registration (JITP) với allow-auto-registration là cách đúng vì chỉ register khi sensor kết nối lần đầu (tại lúc lắp đặt)

❌ Create an AWS Step Functions state machine that can validate the serial number. Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Specify the Step Functions state machine to validate parameters. Call the StartThingRegistrationTask API operation during installation.

Step Functions không phải pre-provisioning hook cho IoT Core JITP

JITP chỉ supports Lambda là pre-provisioning hook, không support Step Functions

❌ Create an AWS IoT Core provisioning template. Include the SerialNumber parameter in the Parameters section. Add parameter validation in the template. Provision a claim certificate and a private key for each device that uses the CA. Grant AWS IoT Core service permissions to update AWS IoT things during provisioning.

"Claim certificate" là dành cho Fleet Provisioning pattern (devices boot with a shared claim cert)

Đề bài nói devices đã có X.509 certs từ private CA (không phải claim cert) → Fleet Provisioning không phù hợp

🔑 Tips and tricks:

"Sensors không được connect đến khi installed" + "cert từ private CA" → JITP (Just-In-Time Provisioning): register CA + allow-auto-registration

Pre-provisioning hook = Lambda (không phải Step Functions)

📖 Reference:

Just-in-Time Provisioning - https://docs.aws.amazon.com/iot/latest/developerguide/jit-provisioning.html

Pre-provisioning hooks - https://docs.aws.amazon.com/iot/latest/developerguide/pre-provisioning-hook.html


Question 63:
Skipped
A company is changing the way that it handles patching of Amazon EC2 instances in its application account. The company currently patches instances over the internet by using a NAT gateway in a VPC in the application account.

The company has EC2 instances set up as a patch source repository in a dedicated private VPC in a core account. The company wants to use AWS Systems Manager Patch Manager and the patch source repository in the core account to patch the EC2 instances in the application account. The company must prevent all EC2 instances in the application account from accessing the internet.

The EC2 instances in the application account need to access Amazon S3, where the application data is stored. These EC2 instances need connectivity to Systems Manager and to the patch source repository in the private VPC in the core account.

Which solution will meet these requirements?


A.
Create a network ACL that blocks outbound traffic on port 80. Associate the network ACL with all subnets in the application account. In the application account, deploy one EC2 instance that runs a custom VPN server. Create a VPN tunnel to access the private VPC. Update the route table in the application account.

B.
Create private VIFs for Systems Manager and Amazon S3. Delete the NAT gateway from the VPC in the application account. Update the route table in the patch source repository EC2 instances in the core account.

C.
Create a network ACL that blocks inbound traffic on port 80. Associate the network ACL with all subnets in the application account. Create a VPC peering connection to access the patch source repository EC2 instances in the core account. Create a transit gateway to access the patch source repository EC2 instances in the core account. Update the route tables in both accounts.

D.
Create VPC endpoints for Systems Manager and Amazon S3. Delete the NAT gateway from the VPC in the application account. Create a transit gateway to access the patch source repository EC2 instances in the core account. Update the route tables in both accounts.

Explanation

📝 Tóm tắt đề:

EC2 instances hiện vá lỗi (patch) qua internet dùng NAT gateway trong application account VPC

Patch source repository nằm trong private VPC của core account (dedicated)

Muốn dùng AWS Systems Manager Patch Manager + patch source ở core account

Phải ngăn tất cả EC2 instances trong application account access internet

EC2 instances cần: S3 (application data) + Systems Manager + patch source repository

→ Yêu cầu: private connectivity đến SSM, S3, và core account; loại internet access

✅ Đáp án đúng:

Create VPC endpoints for Systems Manager and Amazon S3. Delete the NAT gateway from the VPC in the application account. Create a transit gateway to access the patch source repository EC2 instances in the core account. Update the route tables in both accounts.

VPC endpoints cho Systems Manager (SSM, SSMMessages, EC2Messages): private connectivity đến SSM API - không cần internet access để Patch Manager có thể hoạt động được

VPC endpoint cho S3 (Gateway): cung cấp private access đến S3 không qua internet

Delete NAT gateway: hoàn toàn loại internet access từ application account (đáp ứng requirement)

Transit Gateway: kết nối application account VPC với core account VPC (chứa patch source repository) qua AWS private network

Update route tables: route traffic đến SSM/S3 qua endpoints, đến core account qua TGW

Kiến trúc tham khảo:


Các đáp án sai:

❌ Create a network ACL that blocks outbound traffic on port 80. Associate the network ACL with all subnets in the application account. In the application account, deploy one EC2 instance that runs a custom VPN server. Create a VPN tunnel to access the private VPC. Update the route table in the application account.

Block port 80 only: các port khác vẫn mở, NAT gateway vẫn còn, vẫn ra internet, không đáp ứng yêu cầu đề bài

Custom VPN server là EC2 instance → phải quản lý, patch, HA - high operational overhead

❌ Create private VIFs for Systems Manager and Amazon S3. Delete the NAT gateway from the VPC in the application account. Update the route table in the patch source repository EC2 instances in the core account.

Private VIFs dùng cho Direct Connect connections từ on-premises, không dùng cho kết nối giữa các VPC

Không có Direct Connect trong scenario này; Private VIFs không giải quyết vấn đề cho access từ VPC đến S3/SSM

❌ Create a network ACL that blocks inbound traffic on port 80. Associate the network ACL with all subnets in the application account. Create a VPC peering connection to access the patch source repository EC2 instances in the core account. Create a transit gateway to access the patch source repository EC2 instances in the core account. Update the route tables in both accounts.

Block inbound port 80: sai tương tự như đáp án trên

Không delete NAT gateway → EC2 instances vẫn có internet access qua NAT

Dùng cả VPC Peering và Transit gateway là thừa thãi, không cần thiết

🔑 Tips and tricks:

"EC2 không được access internet" + "cần SSM" → VPC endpoints cho SSM (SSM, SSMMessages, EC2Messages 3 endpoints)

"EC2 không được access internet" + "cần S3" → Gateway VPC endpoint cho S3 (free)

"Delete NAT gateway" = cách chặn internet access đơn giản và trực tiếp nhất

📖 Reference:

VPC endpoints for Systems Manager - https://docs.aws.amazon.com/systems-manager/latest/userguide/setup-create-vpc.html

AWS Transit Gateway - https://docs.aws.amazon.com/vpc/latest/tgw/what-is-transit-gateway.html


Question 64:
Skipped
A company is creating a solution that can move 400 employees into a remote working environment in the event of an unexpected disaster. The user desktops have a mix of Windows and Linux operating systems. Multiple types of software, such as web browsers and mail clients, are installed on each desktop.

A solutions architect needs to implement a solution that can be integrated with the company's on-premises Active Directory to allow employees to use their existing identity credentials. The solution must provide multi-factor authentication (MFA) and must replicate the user experience from the existing desktops.

Which solution will meet these requirements?


A.
Use Amazon WorkSpaces for the cloud desktop service. Set up a VPN connection to the on-premises network. Create an AD Connector, and connect to the on-premises Active Directory. Configure a RADIUS server for MFA.

B.
Use Amazon AppStream 2.0 as an application streaming service. Configure Desktop View for the employees. Set up a VPN connection to the on-premises network. Set up Active Directory Federation Services (AD FS) on premises. Connect the VPC network to AD FS through the VPN connection.

C.
Use Amazon WorkSpaces for the cloud desktop service. Set up a VPN connection to the on-premises network. Create an AD Connector, and connect to the on-premises Active Directory. Activate MFA for Amazon WorkSpaces by using the AWS Management Console.

D.
Use Amazon AppStream 2.0 as an application streaming service. Set up Active Directory Federation Services on premises. Configure MFA to grant users access on AppStream 2.0.

Explanation

📝 Tóm tắt đề:

400 nhân viên cần môi trường remote working trong trường hợp thảm họa

Mix Windows và Linux desktops với nhiều loại software (browsers, mail clients)

Cần tích hợp với on-premises Active Directory (sử dụng existing credentials)

Yêu cầu MFA và replicate user experience từ existing desktops

→ Yêu cầu: cloud desktop với AD integration + MFA

✅ Đáp án đúng:

Use Amazon WorkSpaces for the cloud desktop service. Set up a VPN connection to the on-premises network. Create an AD Connector, and connect to the on-premises Active Directory. Configure a RADIUS server for MFA.

Amazon WorkSpaces: full cloud desktop environment - replicates existing desktop experience với cùng applications

AD Connector + VPN: federate WorkSpaces với on-premises Active Directory → users dùng existing credentials

RADIUS server cho MFA: WorkSpaces MFA được triển khai qua RADIUS protocol; giúp triển khai cơ chế xác thực 2 lớp khi truy cập vào Workspaces

WorkSpaces hỗ trợ cả Windows và Linux WorkSpaces → phù hợp cho cả 2 nhóm nhân viên

Kiến trúc tham khảo:


Các đáp án sai:

❌ Use Amazon WorkSpaces for the cloud desktop service. Set up a VPN connection to the on-premises network. Create an AD Connector, and connect to the on-premises Active Directory. Activate MFA for Amazon WorkSpaces by using the AWS Management Console.

"Activate MFA bằng AWS Management Console" không thực sự cấu hình MFA - đây là step enable feature, nhưng WorkSpaces MFA yêu cầu RADIUS server để xử lý MFA thực tế

Không có RADIUS server thì MFA không hoạt động dù đã "activate" trong console

Giải pháp này thiếu thành phần kỹ thuật cần thiết

❌ Use Amazon AppStream 2.0 as an application streaming service. Configure Desktop View for the employees. Set up a VPN connection to the on-premises network. Set up Active Directory Federation Services (AD FS) on premises. Connect the VPC network to AD FS through the VPN connection.

AppStream 2.0: application streaming (stream từng app), không phải full desktop experience - không "replicate user experience from existing desktops"

"Desktop View" trong AppStream vẫn là streaming session, không phải persistent desktop

AD FS setup thêm complexity so với AD Connector

❌ Use Amazon AppStream 2.0 as an application streaming service. Set up Active Directory Federation Services on premises. Configure MFA to grant users access on AppStream 2.0.

AppStream 2.0 không replicate full desktop experience (chỉ stream applications)

Thiếu VPN connection đến on-premises network

Không nói về cách kết nối với on-premises AD

🔑 Tips and tricks:

"Replicate existing desktop experience" → Amazon WorkSpaces (full virtual desktop, not application streaming)

AppStream 2.0 = application streaming (browser-based); WorkSpaces = full virtual desktop

WorkSpaces MFA = RADIUS server required (không chỉ "activate" trong console)

WorkSpaces AD integration: AD Connector (proxy to on-premises AD) hoặc AWS Managed Microsoft AD

"MFA với WorkSpaces" → RADIUS server → enable MFA in WorkSpaces directory settings

📖 Reference:

Amazon WorkSpaces MFA - https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html

AD Connector - https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_ad_connector.html


Question 65:
Skipped
A company runs a content management application on a single Windows Amazon EC2 instance in a development environment. The application reads and writes static content to a 2 TB Amazon EBS volume that is attached to the instance as the root device. The company plans to deploy this application in production as a highly available and fault-tolerant solution that runs on at least three EC2 instances across multiple Availability Zones.

A solutions architect must design a solution that joins all the instances that run the application to an Active Directory domain. The solution also must implement Windows ACLs to control access to file contents. The application always must maintain exactly the same content on all running instances at any given point in time.

Which solution will meet these requirements with the LEAST management overhead?


A.
Create a new AMI from the current EC2 instance that is running. Create an Amazon EFS file system. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Perform a seamless domain join to join the instance to the AD domain.

B.
Create an Amazon EFS file share. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Implement a user data script to install the application, join the instance to the AD domain, and mount the EFS file share.

C.
Create an Amazon FSx for Windows File Server file system. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Implement a user data script to install the application and mount the FSx for Windows File Server file system. Perform a seamless domain join to join the instance to the AD domain.

D.
Create a new AMI from the current EC2 instance that is running. Create an Amazon FSx for Lustre file system. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Implement a user data script to join the instance to the AD domain and mount the FSx for Lustre file system.

Explanation

📝 Tóm tắt đề:

Content management app đang chạy trên single Windows EC2 + 2 TB EBS volume (root device)

Deploy production: ít nhất 3 EC2 instances, multiple AZs, HA + fault-tolerant

Yêu cầu:

Tất cả instances phải join Active Directory domain

Windows ACLs để control file access

Tất cả instances luôn có cùng content ở mọi thời điểm

→ Yêu cầu: shared Windows file storage + AD domain join, LEAST management overhead

✅ Đáp án đúng:

Create an Amazon FSx for Windows File Server file system. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Implement a user data script to install the application and mount the FSx for Windows File Server file system. Perform a seamless domain join to join the instance to the AD domain.

FSx for Windows File Server: shared Windows file system với native Windows ACLs (NTFS permissions) support - đáp ứng requirement

Tất cả instances mount cùng một FXx file system, luôn thấy cùng content

Seamless domain join: AWS-managed feature tự động join EC2 Windows instances vào AD domain khi launch - không cần script thủ công

User data script: cài application + mount FSx → không cần AMI custom

Auto Scaling group 3 AZs, min 3 instances → HA và fault-tolerant

Các đáp án sai:

❌ Create an Amazon EFS file share. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Implement a user data script to install the application, join the instance to the AD domain, and mount the EFS file share.

EFS (Elastic File System): Linux-based NFS file system, không hỗ trợ Windows ACLs (NTFS permissions)

Windows instances có thể mount EFS nhưng không có NTFS permission model

Domain join qua user data script: có thể làm được nhưng tốn thêm công hơn seamless domain join

❌ Create a new AMI from the current EC2 instance that is running. Create an Amazon FSx for Lustre file system. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Implement a user data script to join the instance to the AD domain and mount the FSx for Lustre file system.

FSx for Lustre: high-performance Linux parallel file system cho HPC workloads - không phù hợp cho Windows instances và không hỗ trợ Windows ACLs

Tạo AMI là không cần thiết khi FSx + user data script đủ để cài app

❌ Create a new AMI from the current EC2 instance that is running. Create an Amazon EFS file system. Create an Auto Scaling group that extends across three Availability Zones and maintains a minimum size of three instances. Perform a seamless domain join to join the instance to the AD domain.

EFS không hỗ trợ Windows ACLs, sai như đáp án trên

🔑 Tips and tricks:

"Windows ACLs" → FSx for Windows File Server (NTFS permissions, AD-integrated) - không phải EFS

EFS = Linux/NFS; FSx for Windows = Windows/SMB; FSx for Lustre = Linux/HPC

"Join AD domain với least overhead" → Seamless Domain Join (AWS-managed, không cần script phức tạp)

📖 Reference:

Amazon FSx for Windows File Server - https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html

Seamless domain join - https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-join-aws-domain.html


Question 66:
Skipped
A company is running several applications in the AWS Cloud. The applications are specific to separate business units in the company. The company is running the components of the applications in several AWS accounts that are in an organization in AWS Organizations.

Every cloud resource in the company's organization has a tag that is named BusinessUnit. Every tag already has the appropriate value of the business unit name. The company needs to allocate its cloud costs to different business units. The company also needs to visualize the cloud costs for each business unit.

Which solution will meet these requirements?


A.
In the organization's management account, create a cost allocation tag that is named BusinessUnit. Also in the management account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure the S3 bucket as the destination for the AWS CUR. From the management account, query the AWS CUR data by using Amazon Athena. Use Amazon QuickSight for visualization.

B.
In the organization's management account, create a cost allocation tag that is named BusinessUnit. In each member account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure each S3 bucket as the destination for its respective AWS CUR. Create an Amazon CloudWatch dashboard for visualization.

C.
In each member account, create a cost allocation tag that is named BusinessUnit. In the organization's management account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure the S3 bucket as the destination for the AWS CUR. Create an Amazon CloudWatch dashboard for visualization.

D.
In each member account, create a cost allocation tag that is named BusinessUnit. Also in each member account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure each S3 bucket as the destination for its respective AWS CUR. In the management account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). From the management account, query the AWS CUR data by using Amazon Athena. Use Amazon QuickSight for visualization.

Explanation

📝 Tóm tắt đề:

Applications chạy trên nhiều AWS accounts trong AWS Organizations

Mọi resource đã có tag BusinessUnit với giá trị đúng

Cần phân bổ cloud costs cho từng business unit

Cần visualize cloud costs theo business unit

→ Yêu cầu: cost allocation tags + cost reporting + visualization

✅ Đáp án đúng:

In the organization's management account, create a cost allocation tag that is named BusinessUnit. Also in the management account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure the S3 bucket as the destination for the AWS CUR. From the management account, query the AWS CUR data by using Amazon Athena. Use Amazon QuickSight for visualization.

Cost allocation tags phải được activate ở management account cho toàn bộ organization - không phải trong từng member account; khi activate ở management account, tag áp dụng cho tất cả accounts

CUR (Cost and Usage Report) trong management account: CUR của management account bao gồm costs của tất cả member accounts (consolidated billing) → một báo cáo duy nhất cho toàn org

Athena query CUR từ S3 → query linh hoạt theo BusinessUnit tag

QuickSight: BI visualization tool cho cost dashboards

Các đáp án sai:

❌ In each member account, create a cost allocation tag that is named BusinessUnit. In the organization's management account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure the S3 bucket as the destination for the AWS CUR. Create an Amazon CloudWatch dashboard for visualization.

Cost allocation tags trong từng member account: không đúng - cost allocation tags chỉ được activate ở management account cho organization; member accounts không thể activate cost allocation tags riêng

CloudWatch dashboard: không phải cost analytics tool - CloudWatch visualize metrics, không phải cost reports

❌ In the organization's management account, create a cost allocation tag that is named BusinessUnit. In each member account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure each S3 bucket as the destination for its respective AWS CUR. Create an Amazon CloudWatch dashboard for visualization.

CUR trong từng member account: phân tán, khó consolidate (phải query từng bucket riêng)

Management account CUR đã bao gồm tất cả member account costs → không cần CUR từng member account

CloudWatch dashboard không phù hợp cho cost visualization

❌ In each member account, create a cost allocation tag that is named BusinessUnit. Also in each member account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). Configure each S3 bucket as the destination for its respective AWS CUR. In the management account, create an Amazon S3 bucket and an AWS Cost and Usage Report (AWS CUR). From the management account, query the AWS CUR data by using Amazon Athena. Use Amazon QuickSight for visualization.

Cost allocation tags trong từng member account: không đúng - cost allocation tags chỉ được activate ở management account cho organization; member accounts không thể activate cost allocation tags riêng

Vừa tạo CUR trong member accounts vừa trong management account = thừa thãi, tốn tiền

🔑 Tips and tricks:

Cost allocation tags: activate chỉ ở management account → applies cho toàn organization

CUR trong management account = consolidated report của tất cả accounts

Athena + S3 + QuickSight = standard AWS cost analytics stack

📖 Reference:

AWS Cost allocation tags - https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html

AWS Cost and Usage Reports - https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html


Question 67:
Skipped
A company has 20 accounts in an organization in AWS Organizations. The accounts are in two OUs: development and production. Multiple teams use the development accounts.

The company wants to control the cost that is associated with the development accounts. The company needs a solution that provides a notification when the forecasted monthly cost for all development accounts exceeds a threshold.

A solutions architect creates an Amazon SNS topic and subscribes an email address to the topic. What should the solutions architect do next to meet the notification requirement with the LEAST configuration effort?


A.
Enable Amazon CloudWatch billing alerts in the organization's management account. Create a CloudWatch billing alarm by configuring the EstimatedCharges metric for each development account as a linked account. Configure the SNS topic for email alerts when the EstimatedCharges metric value exceeds the threshold.

B.
Create an AWS Cost and Usage Report in the organization's management account. Configure report delivery to an Amazon S3 bucket. Configure an AWS Glue job to extract the report data into Amazon Athena. Configure AWS Step Functions to analyze the consolidated cost of all the development accounts. Configure the SNS topic for email alerts when the cost exceeds the threshold.

C.
Use AWS Budgets to create a cost budget in the organization's management account. Configure each development account as a linked account. Configure an alert threshold. Configure the SNS topic for email alerts.

D.
Enable AWS Cost Explorer in the organization's management account. Configure each development account as a linked account. Configure an alert threshold. Configure the SNS topic for email alerts.

Explanation

📝 Tóm tắt đề:

20 accounts trong AWS Organizations, 2 OUs: development và production

Muốn control chi phí của development accounts

Cần notification khi forecasted monthly cost của tất cả development accounts vượt threshold

SNS topic và email subscription đã tạo

→ Yêu cầu: forecasted cost alert cho all development accounts, LEAST configuration effort

✅ Đáp án đúng:

Use AWS Budgets to create a cost budget in the organization's management account. Configure each development account as a linked account. Configure an alert threshold. Configure the SNS topic for email alerts.

AWS Budgets: là service dùng cho mục đích đặt ngưỡng chi tiêu trong account và cảnh báo khi vượt ngưỡng. Hỗ trợ giám sát cả actual (cost thực tế) và forecasted (cost dự báo)

Tạo Budget trong management account: cover tất cả member accounts (linked accounts) trong organization

Linked accounts: filter budget scope chỉ áp dụng với development accounts (không bao gồm production)

SNS integration: AWS Budgets hỗ trợ direct notification qua SNS khi threshold bị vượt

Solution tốn ít effort config nhất

Các đáp án sai:

❌ Enable Amazon CloudWatch billing alerts in the organization's management account. Create a CloudWatch billing alarm by configuring the EstimatedCharges metric for each development account as a linked account. Configure the SNS topic for email alerts when the EstimatedCharges metric value exceeds the threshold.

CloudWatch billing EstimatedCharges metric: chỉ tracking được actual charges (chi phí thực tế), không phải forecasted costs (chi phí dự báo)

Phải tạo 1 alarm per development account (không tạo được consolidated alarm cho nhiều linked accounts trong 1 alarm) → more configuration effort

❌ Create an AWS Cost and Usage Report in the organization's management account. Configure report delivery to an Amazon S3 bucket. Configure an AWS Glue job to extract the report data into Amazon Athena. Configure AWS Step Functions to analyze the consolidated cost of all the development accounts. Configure the SNS topic for email alerts when the cost exceeds the threshold.

CUR + Glue + Athena + Step Functions: rất phức tạp cho yêu cầu đơn giản là cost alert

Phải viết custom analysis logic trong Step Functions → high configuration effort

AWS Budgets đã có tất cả tính năng này rồi, nên dùng sẽ đơn giản hơn nhiều

❌ Enable AWS Cost Explorer in the organization's management account. Configure each development account as a linked account. Configure an alert threshold. Configure the SNS topic for email alerts.

AWS Cost Explorer không có cơ chế alert / thông báo khi vượt ngưỡng chi tiêu

Cost Explorer dùng để phân tích chi phí sử dụng là chính, AWS Budgets mới là service dùng cho automated cost alerts (Cost Explorer ≠ Budgets)

🔑 Tips and tricks:

"Cost alert/notification khi vượt threshold" → AWS Budgets (không phải Cost Explorer)

AWS Budgets: hỗ trợ forecasted cost alerts (Cost Explorer chỉ show historical/forecast, không alert)

CloudWatch billing alarms: chỉ actual charges, không forecasted; cần 1 alarm per account

Budgets linked accounts: filter scope đến specific accounts (e.g. chỉ development OU)

Cost Explorer = interactive analysis tool; Budgets = automated threshold-based alerting

📖 Reference:

AWS Budgets - https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html

AWS Budgets SNS notifications - https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-sns-policy.html


Question 68:
Skipped
A company has an application that is deployed on Amazon EC2 instances behind an Application Load Balancer (ALB). The instances are part of an Auto Scaling group. The application has unpredictable workloads and frequently scales out and in. The company's development team wants to analyze application logs to find ways to improve the application's performance. However, the logs are no longer available after instances scale in.

Which solution will give the development team the ability to view the application logs after a scale-in event?


A.
Instrument the application with AWS X-Ray tracing.

B.
Modify the Auto Scaling group to use a step scaling policy.

C.
Enable access logs for the ALB. Store the logs in an Amazon S3 bucket.

D.
Configure the EC2 instances to publish logs to Amazon CloudWatch Logs by using the unified CloudWatch agent.

Explanation

📝 Tóm tắt đề:

Application trên EC2 instances sau ALB, trong Auto Scaling group

Workload unpredictable, thường xuyên scale out và scale in

Development team muốn analyze application logs sau scale-in events

Logs không còn available sau khi instances bị terminate (scale in)

→ Yêu cầu: preserve application logs sau khi instances bị terminate

✅ Đáp án đúng:

Configure the EC2 instances to publish logs to Amazon CloudWatch Logs by using the unified CloudWatch agent.

Unified CloudWatch agent: solution cho phép stream application logs từ EC2 instance lên CloudWatch Logs theo gần thời gian thực

Khi instance bị terminate (scale in), logs đã được lưu trong CloudWatch Logs - không bị mất

Development team có thể query logs từ CloudWatch Logs bất cứ lúc nào

Các đáp án sai:

❌ Enable access logs for the ALB. Store the logs in an Amazon S3 bucket.

ALB access logs: chỉ capture access log tại load balancer (source IP, request path, response codes, latency)

Không capture application logs từ bên trong EC2 instances (application error logs, debug logs)

Đây là infrastructure logs, không phải application logs mà dev team cần để analyze performance

❌ Modify the Auto Scaling group to use a step scaling policy.

Step scaling policy thay đổi cách Auto Scaling scale (dựa trên metric thresholds từng bước)

Không liên quan gì đến log persistence - vẫn terminate instances và mất logs

Giải quyết scaling behavior, không giải quyết log retention

❌ Instrument the application with AWS X-Ray tracing.

X-Ray: distributed tracing service, giúp truy vểt request và hiển thị hoá đường đi của request, giúp tìm ra bottleneck

X-Ray traces không phải application logs - không capture log messages, errors, debug info

🔑 Tips and tricks:

"Logs mất khi instance terminate" → Unified CloudWatch agent (stream logs ra ngoài instance real-time)

📖 Reference:

Unified CloudWatch agent - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html

Collect metrics and logs from Amazon EC2 instances - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html


Question 69:
Skipped
A company runs applications in multiple AWS accounts in a single AWS Region. The accounts are members of an organization in AWS Organizations. The company is implementing security controls to manage cross-account access patterns in the company's AWS environment.

The company wants to identify resources that might be unintentionally shared with external entities. The company wants to implement continuous monitoring for resource-based policies to detect external access. The company needs a solution that enforces multi-factor authentication (MFA) to assume cross-account IAM roles.

Which solution will meet these requirements?


A.
Create an AWS Security Hub integration with AWS IAM Access Analyzer. Implement federated identity management for all cross-account IAM role access. Enforce MFA by using a third-party identity provider (IdP).

B.
Configure AWS IAM Access Analyzer to use the organization as the zone of trust. Configure an Amazon EventBridge rule to send a notification when IAM Access Analyzer generates new findings. Add the aws:MultiFActorAuthPresent condition key to the trust policies of employee IAM roles.

C.
Configure AWS Config rules to monitor resource-based policies. Use IAM permissions boundaries to limit cross-account access. Add the aws:TokenIssueTime condition key to cross-account IAM roles.

D.
Enable AWS IAM Access Analyzer. Implement ExternalId in cross-account IAM roles. Create a resource-based policy that uses a wildcard principal to limit access based on the source IP.

Explanation

📝 Tóm tắt đề:

Applications chạy trên nhiều AWS accounts trong một organization

Cần identify resources có thể vô tình share với external entities

Cần continuous monitoring resource-based policies để detect external access

Cần enforce MFA khi assume cross-account IAM roles

→ Yêu cầu: external access detection + MFA enforcement

✅ Đáp án đúng:

Configure AWS IAM Access Analyzer to use the organization as the zone of trust. Configure an Amazon EventBridge rule to send a notification when IAM Access Analyzer generates new findings. Add the aws:MultiFActorAuthPresent condition key to the trust policies of employee IAM roles.

IAM Access Analyzer zone of trust: tự động scan resource-based policies (S3, KMS, IAM roles, SQS, Lambda...) và phát hiện access từ ngoài organization, cho phép đánh giá được có cái nào đang cấp quyền sai ngoài ý muốn hay không

EventBridge rule: trigger khi Access Analyzer có new finding → gửi thông báo khi phát hiện

aws:MultiFActorAuthPresent condition key: băt buộc phải xác thực 2 lớp trước khi có thể assume role; enforces MFA cho cross-account access

Các đáp án sai:

❌ Configure AWS Config rules to monitor resource-based policies. Use IAM permissions boundaries to limit cross-account access. Add the aws:TokenIssueTime condition key to cross-account IAM roles.

Config rules có thể detect non-compliant policies nhưng không có cơ chế phân tích và đánh giá quyền truy cập như Access Analyzer

IAM permissions boundaries: giới hạn quyền của principals trong account, không có cơ chế trực tiếp bắt buộc MFA

aws:TokenIssueTime: condition check về thời gian token được phát hành, không dùng để check xem MFA có tồn tại hay không

❌ Enable AWS IAM Access Analyzer. Implement ExternalId in cross-account IAM roles. Create a resource-based policy that uses a wildcard principal to limit access based on the source IP.

"Enable IAM Access Analyzer" không chỉ định zone of trust = organization → findings scope sẽ khác

"Wildcard principal + source IP restriction": đây không phải cơ chế bắt buộc MFA

❌ Create an AWS Security Hub integration with AWS IAM Access Analyzer. Implement federated identity management for all cross-account IAM role access. Enforce MFA by using a third-party identity provider (IdP).

"Federated identity + third-party IdP" cho MFA: phức tạp, không phải native AWS solution

aws:MultiFActorAuthPresent là đơn giản và native hơn nhiều cho MFA enforcement trong role trust policies

🔑 Tips and tricks:

"Detect external access" + "continuous monitoring" + "resource-based policies" → IAM Access Analyzer với organization zone of trust

"Enforce MFA cho role assume" → aws:MultiFActorAuthPresent: true trong trust policy Condition

📖 Reference:

AWS IAM Access Analyzer - https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html

MFA with IAM condition keys - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_configure-api-require.html


Question 70:
Skipped
A financial services company is building a multi-agent platform. The platform uses AI agents to run autonomous workflows that invoke AWS APIs by using SigV4 and invoke external systems by using OAuth 2.0 client credentials. The platform runs across multiple isolated runtimes. The platform must enforce short-lived credentials, centralized policy control, and no direct secret distribution to agents. The platform must also retain attributions for each action for auditing purposes.

The company must ensure that identity issuance and external credential exchange is decoupled from application code and enforceable through a control plane.

Which solution will meet these requirements?


A.
Use Amazon Cognito identity pools to federate agent identities and attach IAM roles to the authenticated identities. Access external APIs by using pre-provisioned service tokens.

B.
Use IAM Roles Anywhere and AWS Private CA to authenticate agents. Use a centralized token exchange service to broker OAuth 2.0 tokens when the workflows invoke tools.

C.
Use the Amazon STS AssumeRole API action to assume a unique IAM role for each agent type. Embed external OAuth tokens as encrypted environment variables in runtime containers.

D.
Store OAuth client credentials and API keys in AWS Secrets Manager. Retrieve the credentials dynamically during each agent tool invocation.

Explanation

📝 Tóm tắt đề:

Multi-agent platform, AI agents chạy autonomous workflows

Agents invoke AWS APIs bằng SigV4 và external systems bằng OAuth 2.0 client credentials

Chạy trên multiple isolated runtimes

Yêu cầu:

Short-lived credentials

Centralized policy control

Không đưa secrets trực tiếp cho agents

Attribution (thuộc tính) cho mỗi action để audit

Identity issuance và external credential exchange tách biệt khỏi application code

→ Yêu cầu: decoupled identity/credential management cho multi-agent platform

✅ Đáp án đúng:

Use IAM Roles Anywhere and AWS Private CA to authenticate agents. Use a centralized token exchange service to broker OAuth 2.0 tokens when the workflows invoke tools.

IAM Roles Anywhere: cho phép workloads (agents) ngoài EC2/Lambda nhận IAM credentials tạm thời thông qua X.509 certificates

AWS Private CA: issue X.509 certificates cho agents - centralized identity issuance

Short-lived credentials: IAM Roles Anywhere issue temporary STS credentials (1 giờ mặc định)

Centralized token exchange service: broker OAuth 2.0 tokens khi agents invoke external systems - decoupled từ application code

Attribution: IAM calls với Roles Anywhere credentials sẽ được ghi lại trong CloudTrail để phục vụ mục đích audit

Kiến trúc tham khảo:


Các đáp án sai:

❌ Store OAuth client credentials and API keys in AWS Secrets Manager. Retrieve the credentials dynamically during each agent tool invocation.

Long-lived credentials trong Secrets Manager: OAuth client credentials và API keys là long-lived, không phải short-lived

Credentials vẫn bị đưa cho agents khi lấy về

Không đáp ứng "no direct secret distribution to agents"

❌ Use the Amazon STS AssumeRole API action to assume a unique IAM role for each agent type. Embed external OAuth tokens as encrypted environment variables in runtime containers.

Embed OAuth tokens trong environment variables: vẫn là long-lived tokens, không phải short-lived (container lifetime)

Không tách biệt "identity issuance và credential exchange" khỏi application code (app phải manage env vars)

❌ Use Amazon Cognito identity pools to federate agent identities and attach IAM roles to the authenticated identities. Access external APIs by using pre-provisioned service tokens.

Cognito identity pools: dùng để cấp quyền thao tác AWS cho người dùng web / mobile, không dùng để cấp quyền cho tool như agent

Pre-provisioned service tokens: đây cũng là long-lived tokens, không phải short-lived

🔑 Tips and tricks:

"Non-AWS workloads cần AWS credentials" + "no long-lived keys" → IAM Roles Anywhere + X.509 certificates

AWS Private CA: issue certificates cho workloads - centralized PKI

"External OAuth 2.0" + "decoupled từ application code" → centralized token exchange service (broker pattern)

📖 Reference:

IAM Roles Anywhere - https://docs.aws.amazon.com/rolesanywhere/latest/userguide/introduction.html

AWS Private Certificate Authority - https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html


Question 71:
Skipped
A company has mounted sensors to collect information about environmental parameters such as humidity and light throughout all the company's factories. The company needs to stream and analyze the data in the AWS Cloud in real time. If any of the parameters fall out of acceptable ranges, the factory operations team must receive a notification immediately.

Which solution will meet these requirements?


A.
Stream the data to an Amazon Managed Service for Apache Flink application. Use an automatically scaled and containerized service in Amazon ECS to consume and analyze the data. Use Amazon SES to notify the operations team.

B.
Stream the data to an Amazon Kinesis data stream. Create an AWS Lambda function to consume the Kinesis data stream and to analyze the data. Use Amazon SNS to notify the operations team.

C.
Stream the data to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) cluster. Set up a trigger in Amazon MSK to invoke an AWS Fargate task to analyze the data. Use Amazon SES to notify the operations team.

D.
Stream the data to an Amazon Data Firehose delivery stream. Use AWS Step Functions to consume and analyze the data in the Firehose delivery stream. Use Amazon SNS to notify the operations team.

Explanation

📝 Tóm tắt đề:

Sensors thu thập environmental parameters (humidity, light) từ tất cả các nhà máy

Cần stream và analyze data trên AWS Cloud trong real time

Nếu parameters nằm ngoài acceptable ranges (mức cho phép) → operations team phải nhận thông báo ngay lập tức

→ Yêu cầu: real-time streaming + analysis + immediate notification

✅ Đáp án đúng:

Stream the data to an Amazon Kinesis data stream. Create an AWS Lambda function to consume the Kinesis data stream and to analyze the data. Use Amazon SNS to notify the operations team.

Amazon Kinesis data stream: real-time data streaming service phù hợp cho use case IoT sensor data - low latency ingestion

Lambda consumer: trigger Lambda khi có records trong Kinesis stream → process và analyze data real-time

Lambda so sánh values với thresholds → nếu nằm ngoài mức cho phép sẽ gọi SNS để gửi thông báo

Toàn bộ pipeline là serverless, real-time, low latency

Các đáp án sai:

❌ Stream the data to an Amazon Data Firehose delivery stream. Use AWS Step Functions to consume and analyze the data in the Firehose delivery stream. Use Amazon SNS to notify the operations team.

Step Functions không thể consume Firehose delivery stream trực tiếp - đây là kiến trúc không hợp lệ

Firehose là delivery service (deliver to S3, OpenSearch, Redshift...), không phải real-time processing trigger

❌ Stream the data to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) cluster. Set up a trigger in Amazon MSK to invoke an AWS Fargate task to analyze the data. Use Amazon SES to notify the operations team.

MSK: có operational complexity (managed Kafka cluster, topic management) cao hơn so với Kinesis data stream

Fargate tasks: tốn nhiều công sức hơn so với Lambda cho tác vụ phân tích đơn giản

Amazon SES: service dù chuyên dụng cho việc gửi email, nhưng đối với use case là thông báo, thì sử dụng SNS hợp lí hơn

❌ Stream the data to an Amazon Managed Service for Apache Flink application. Use an automatically scaled and containerized service in Amazon ECS to consume and analyze the data. Use Amazon SES to notify the operations team.

Managed Service for Apache Flink: phù hợp cho việc xử lý phức tạp trên luồng stream, nhưng over-engineering việc xử lý chỉ so sánh value đơn thuần như đề bài

SES không phù hợp, tương tự như đáp án sai ở trên

🔑 Tips and tricks:

"Real-time streaming" + "immediate notification" → Kinesis data stream + Lambda + SNS

SES vs SNS: SES = email delivery service (email marketing, transactional email); SNS = pub/sub notification (SMS, email, push, Lambda) - đề thi thường dùng SNS cho alerts

Giữa MSK và Kinesis, luôn chọn Kinesis trừ khi đề bài nhắc đến Kafka

📖 Reference:

Amazon Kinesis Data Streams - https://docs.aws.amazon.com/streams/latest/dev/introduction.html

Using AWS Lambda with Amazon Kinesis - https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html


Question 72:
Skipped
A company has a Windows-based desktop application that is packaged and deployed to the users' Windows machines. The company recently acquired another company that has employees who primarily use machines with a Linux operating system. The acquiring company has decided to migrate and rehost the Windows-based desktop application to AWS.

All employees must be authenticated before they use the application. The acquiring company uses Active Directory on premises but wants a simplified way to manage access to the application on AWS for all the employees.

Which solution will rehost the application on AWS with the LEAST development effort?


A.
Set up and provision an Amazon WorkSpaces virtual desktop for every employee. Implement authentication by using Amazon Cognito identity pools. Instruct employees to run the application from their provisioned WorkSpaces virtual desktops.

B.
Create an Auto Scaling group of Windows-based Amazon EC2 instances. Join each EC2 instance to the company's Active Directory domain. Implement authentication by using the Active Directory that is running on premises. Instruct employees to run the application by using a Windows remote desktop.

C.
Use an Amazon AppStream 2.0 image builder to create an image that includes the application and the required configurations. Provision an AppStream 2.0 On-Demand fleet with dynamic Fleet Auto Scaling policies for running the image. Implement authentication by using AppStream 2.0 user pools. Instruct the employees to access the application by starting browser-based AppStream 2.0 streaming sessions.

D.
Refactor and containerize the application to run as a web-based application. Run the application in Amazon ECS on AWS Fargate with step scaling policies. Implement authentication by using Amazon Cognito user pools. Instruct the employees to run the application from their browsers.

Explanation

📝 Tóm tắt đề:

Windows-based desktop application đang được deploy đến Windows machines

Công ty mới mua lại có nhân viên dùng Linux OS

Cần rehost ứng dụng lên AWS

Tất cả nhân viên phải được authenticate trước khi dùng app

Công ty dùng Active Directory on premises nhưng muốn simplified access management

→ Yêu cầu: rehost Windows desktop app lên AWS, accessible từ cả Windows và Linux, LEAST development effort

✅ Đáp án đúng:

Use an Amazon AppStream 2.0 image builder to create an image that includes the application and the required configurations. Provision an AppStream 2.0 On-Demand fleet with dynamic Fleet Auto Scaling policies for running the image. Implement authentication by using AppStream 2.0 user pools. Instruct the employees to access the application by starting browser-based AppStream 2.0 streaming sessions.

AppStream 2.0: stream Windows desktop applications qua browser → accessible từ cả Windows và Linux machines (chỉ cần web browser)

Image builder: package Windows application nguyên vẹn vào AppStream image - không cần refactor (least development effort)

On-Demand fleet: users launch streaming session khi cần, dùng bao nhiêu trả bấy nhiêu

AppStream 2.0 user pools: quản lý user tích hợp với SAML/SSO, không cần phức tạp như AD integration

Các đáp án sai:

❌ Set up and provision an Amazon WorkSpaces virtual desktop for every employee. Implement authentication by using Amazon Cognito identity pools. Instruct employees to run the application from their provisioned WorkSpaces virtual desktops.

WorkSpaces: mỗi 1 virtual desktop cho mỗi user → chi phí cao (charged per user per month, always-on)

Cognito identity pools: không có cơ chế tích hợp trực tiếp với on-premises Active Directory

Yêu cầu WorkSpaces client software (không chỉ browser) → Linux users cần install client mới truy cập được

❌ Create an Auto Scaling group of Windows-based Amazon EC2 instances. Join each EC2 instance to the company's Active Directory domain. Implement authentication by using the Active Directory that is running on premises. Instruct employees to run the application by using a Windows remote desktop.

Windows Remote Desktop: yêu cầu Windows RDP client → Linux users khó access (cần third-party RDP client)

Quản lý EC2 Auto Scaling group là operational overhead cao hơn AppStream 2.0

❌ Refactor and containerize the application to run as a web-based application. Run the application in Amazon ECS on AWS Fargate with step scaling policies. Implement authentication by using Amazon Cognito user pools. Instruct the employees to run the application from their browsers.

"Refactor and containerize" = tốn nhiều effort (ngược với "least development effort")

Câu hỏi yêu cầu rehost, không rewrite/refactor

AppStream 2.0 là rehost không cần code changes

🔑 Tips and tricks:

"Windows app + Linux users + least dev effort" → AppStream 2.0 (browser-based, no refactor needed)

AppStream 2.0 = application streaming (stream app từ Windows server qua browser)

📖 Reference:

Amazon AppStream 2.0 - https://docs.aws.amazon.com/appstream2/latest/developerguide/what-is-appstream.html

AppStream 2.0 user pools - https://docs.aws.amazon.com/appstream2/latest/developerguide/user-pool.html


Question 73:
Skipped
An education company is replatforming an online learning application. The company is moving application components from on premises to AWS. The application is critical and must be highly available throughout the year. The company has already moved video content and a database to AWS.

The company must finish the last step of the process by replatforming the application to AWS. The application uses .NET Framework on Windows application servers.

Which solution will replatform the application with the LOWEST running costs?


A.
Deploy the application to an AWS Lambda function. Configure the function to use .NET Framework runtime and the Windows operating system. Increase the memory size for the function to 4,096 MB. Create an HTTP Amazon API Gateway endpoint. Configure the endpoint to invoke the function.

B.
Use AWS Toolkit for Visual Studio to publish the application to an AWS Elastic Beanstalk .NET Windows Server platform on On-Demand Instances. Use the auto scaling option in Elastic Beanstalk to scale the service. Use the built-in load balancing option in Elastic Beanstalk to distribute the traffic to the instances across three Availability Zones.

C.
Package the Windows application into a container. Deploy the container to Amazon ECS on AWS Fargate by using the Fargate Spot capacity provider. Use a Network Load Balancer (NLB) to distribute the traffic to the ECS tasks across three Availability Zones.

D.
Use AWS Transform for .NET to migrate the application to cross-platform .NET. Deploy the application on an Auto Scaling group of Amazon EC2 Linux instances with AWS Graviton processors. Use an Application Load Balancer (ALB) to distribute traffic to EC2 instances across three Availability Zones.

Explanation

📝 Tóm tắt đề:

Education company replatforming online learning app lên AWS

Application hiện dùng .NET Framework trên Windows application servers

Application critical, HA throughout year

Video content và database đã migrate lên AWS

→ Yêu cầu: replatform .NET app với LOWEST running costs

✅ Đáp án đúng:

Use AWS Transform for .NET to migrate the application to cross-platform .NET. Deploy the application on an Auto Scaling group of Amazon EC2 Linux instances with AWS Graviton processors. Use an Application Load Balancer (ALB) to distribute traffic to EC2 instances across three Availability Zones.

AWS Transform for .NET: service cho phép tự động migrate .NET Framework → cross-platform .NET (chạy trên Linux) - giảm manual migration effort

EC2 Linux: không cần Windows Server license → giảm đáng kể license cost so với Windows EC2

AWS Graviton processors: ARM-based processor, giá rẻ hơn x86 ~20% với cùng performance cho nhiều workloads

Auto Scaling + ALB + 3 AZs: đảm bảo tính khả dụng và fault-tolerant

Các đáp án sai:

❌ Package the Windows application into a container. Deploy the container to Amazon ECS on AWS Fargate by using the Fargate Spot capacity provider. Use a Network Load Balancer (NLB) to distribute the traffic to the ECS tasks across three Availability Zones.

Windows container trên Fargate: vẫn cần Windows Server license cho containers → cao hơn Linux

Fargate Spot: có thể bị gián đoạn (không phù hợp cho "critical application" cần HA)

❌ Use AWS Toolkit for Visual Studio to publish the application to an AWS Elastic Beanstalk .NET Windows Server platform on On-Demand Instances. Use the auto scaling option in Elastic Beanstalk to scale the service. Use the built-in load balancing option in Elastic Beanstalk to distribute the traffic to the instances across three Availability Zones.

Elastic Beanstalk .NET Windows Server: chạy trên Windows EC2 → phải trả Windows Server license

Higher running cost so với Linux + Graviton

Không convert sang Linux nên vẫn phải trả Windows license

❌ Deploy the application to an AWS Lambda function. Configure the function to use .NET Framework runtime and the Windows operating system. Increase the memory size for the function to 4,096 MB. Create an HTTP Amazon API Gateway endpoint. Configure the endpoint to invoke the function.

Lambda không có khái niệm sử dụng hệ điều hành Windows, yếu tố vô lý

🔑 Tips and tricks:

"Lowest running cost" + ".NET" → AWS Transform for .NET (migrate sang Linux-compatible .NET) + EC2 Linux Graviton

AWS Transform for .NET: automated porting tool, reduce manual migration effort

Lambda không support WIndows

"Critical application" + "HA throughout year" → On-Demand instances (không phải Spot)

📖 Reference:

AWS Transform for .NET - https://aws.amazon.com/transform/net/

AWS Graviton instances - https://aws.amazon.com/ec2/graviton/


Question 74:
Skipped
A company needs to implement a disaster recovery (DR) plan for a web application. The application runs in a single AWS Region.

The application uses microservices that run in containers. The containers are hosted on AWS Fargate in Amazon ECS. The application has an Amazon RDS for MySQL DB instance as its data layer and uses Amazon Route 53 for DNS resolution. An Amazon CloudWatch alarm invokes an Amazon EventBridge rule if the application experiences a failure.

A solutions architect must design a DR solution to provide application recovery to a separate Region. The solution must minimize the time that is necessary to recover from a failure.

Which solution will meet these requirements?


A.
Set up a second ECS cluster and ECS service on Fargate in the separate Region. Take a snapshot of the RDS DB instance. Convert the snapshot to an Amazon DynamoDB global table. Create an AWS Lambda function to update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

B.
Set up a second ECS cluster and ECS service on Fargate in the separate Region. Create a cross-Region read replica of the RDS DB instance in the separate Region. Create an AWS Lambda function to promote the read replica to the primary database and to update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

C.
Create an AWS Lambda function that creates a second ECS cluster and ECS service in the separate Region. Configure the Lambda function to perform the following actions: take a snapshot of the RDS DB instance, copy the snapshot to the separate Region, create a new RDS DB instance from the snapshot, and update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

D.
Set up a second ECS cluster and ECS service on Fargate in the separate Region. Create an AWS Lambda function to perform the following actions: take a snapshot of the RDS DB instance, copy the snapshot to the separate Region, create a new RDS DB instance from the snapshot, and update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

Explanation

📝 Tóm tắt đề:

Web application trong single AWS Region

Microservices trên Fargate trong ECS

RDS for MySQL là data layer

Route 53 cho DNS

CloudWatch alarm → EventBridge rule khi failure xảy ra

→ Yêu cầu: DR plan sang separate Region, minimize recovery time

✅ Đáp án đúng:

Set up a second ECS cluster and ECS service on Fargate in the separate Region. Create a cross-Region read replica of the RDS DB instance in the separate Region. Create an AWS Lambda function to promote the read replica to the primary database and to update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

Pre-setup ECS cluster trong DR Region: không cần tạo cluster mới khi failure → giảm recovery time

Cross-Region read replica: liên tục replicate data từ primary → DR region; replica luôn up-to-date

Lambda promote replica: qua EventBridge trigger, Lambda nãy sẽ promote read replica thành standalone primary DB trong vài phút để có thể đọc / ghi data

Route 53 update: redirect traffic sang DR Region (ECS cluster đã có sẵn)

Các đáp án sai:

❌ Set up a second ECS cluster and ECS service on Fargate in the separate Region. Create an AWS Lambda function to perform the following actions: take a snapshot of the RDS DB instance, copy the snapshot to the separate Region, create a new RDS DB instance from the snapshot, and update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

Snapshot → copy → restore khi xảy ra failure:

Take snapshot: vài phút

Copy cross-Region: vài phút đến hàng giờ (tùy DB size)

Restore từ snapshot: có thể hàng giờ

Quá trình này không minimize recovery time

ECS cluster đã có sẵn nhưng DB recovery quá chậm, không đáp ứng yêu cầu về tối thiểu thời gian khôi phục

❌ Create an AWS Lambda function that creates a second ECS cluster and ECS service in the separate Region. Configure the Lambda function to perform the following actions: take a snapshot of the RDS DB instance, copy the snapshot to the separate Region, create a new RDS DB instance from the snapshot, and update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

Lambda tạo ECS cluster khi failure: tạo cluster mới tốn thêm nhiều thời gian (hàng phút)

Vẫn là copy snapshot cho db, sai như đáp án trên

Không pre-setup bất cứ thứ gì → recovery time dài nhất trong tất cả options

❌ Set up a second ECS cluster and ECS service on Fargate in the separate Region. Take a snapshot of the RDS DB instance. Convert the snapshot to an Amazon DynamoDB global table. Create an AWS Lambda function to update Route 53 to route traffic to the second ECS cluster. Update the EventBridge rule to add a target that will invoke the Lambda function.

"Convert RDS snapshot to DynamoDB global table" là không khả thi - đây là 2 hoàn toàn khác nhau database engines (relational vs NoSQL), không có cơ chế chuyển đổi như vậy

Option này là không hợp lệ từ góc độ kỹ thuật

🔑 Tips and tricks:

"Minimize recovery time" → warm standby pattern: pre-setup ECS cluster + cross-Region read replica

Promote read replica: nhanh hơn nhiều so với restore từ snapshot

📖 Reference:

Amazon RDS cross-Region read replicas - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.XRgn.html

Disaster recovery on AWS - https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html


Question 75:
Skipped
A company operates a static content distribution platform that serves customers globally. The customers consume content from their own AWS accounts. The company serves its content from an Amazon S3 bucket. The company uploads the content from its on-premises environment to the S3 bucket by using an S3 File Gateway.

The company wants to improve the platform's performance and reliability by serving content from the AWS Region that is geographically closest to customers. The company must route the on-premises data to Amazon S3 with minimal latency and without public internet exposure.

Which combination of steps will meet these requirements with the LEAST operational overhead? (Select TWO.)


A.
Implement S3 Multi-Region Access Points.

B.
Use S3 Cross-Region Replication (CRR) to copy content to different Regions.

C.
Create an AWS Lambda function that tracks the routing of clients to Regions.

D.
Use an AWS Site-to-Site VPN connection to connect to a Multi-Region Access Point.

E.
Use AWS PrivateLink and AWS Direct Connect to connect to a Multi-Region Access Point.

Explanation

📝 Tóm tắt đề:

Static content distribution platform phục vụ customers toàn cầu từ nhiều AWS accounts khác nhau

Content lưu trong Amazon S3

Upload từ on-premises environment lên S3 qua S3 File Gateway

Muốn serve content từ AWS Region gần nhất với customers (performance)

Route on-premises data lên S3 với minimal latency và không qua public internet

→ Yêu cầu: global routing đến nearest Region + private connectivity từ on-premises (Select TWO, LEAST operational overhead)

✅ Đáp án đúng:

Implement S3 Multi-Region Access Points.

S3 Multi-Region Access Points (MRAP): single global endpoint cho nhiều S3 buckets ở nhiều Regions; tự động route requests đến bucket gần nhất (lowest latency) - đúng requirement "serve from closest Region"

MRAP tích hợp với S3 Replication để đảm bảo content có mặt ở nhiều Regions

Customers toàn cầu kết nối qua MRAP global endpoint → automatic geographic routing

LEAST operational overhead: không cần custom routing logic, không cần DNS configuration phức tạp

Use AWS PrivateLink and AWS Direct Connect to connect to a Multi-Region Access Point.

AWS Direct Connect: private connectivity từ on-premises đến AWS, không qua public internet

AWS PrivateLink: tạo private endpoint cho S3 MRAP → traffic từ on-premises đến MRAP đi qua private AWS network

Kết hợp Direct Connect + PrivateLink: on-premises → Direct Connect → PrivateLink endpoint → S3 MRAP → bucket gần nhất

Không public internet exposure khi upload từ on-premises ("without public internet exposure")

Kiến trúc tham khảo:


Các đáp án sai:

❌ Use S3 Cross-Region Replication (CRR) to copy content to different Regions.

CRR là cần thiết để data có mặt ở nhiều Regions, nhưng khi dùng MRAP thì cái này đã được config tự động, không cần config thêm nữa

❌ Create an AWS Lambda function that tracks the routing of clients to Regions.

Custom Lambda tracking routing = không phải managed service → high operational overhead

MRAP đã làm điều này tự động không cần custom code

"LEAST operational overhead" → loại custom solutions

❌ Use an AWS Site-to-Site VPN connection to connect to a Multi-Region Access Point.

Site-to-Site VPN: đi qua public internet (VPN tunnel over internet) → vi phạm yêu cầu "without public internet exposure"

Direct Connect là đường truyền vật lý, không qua public internet → đúng

🔑 Tips and tricks:

"Serve từ Region gần nhất globally" → S3 Multi-Region Access Points (automatic geographic routing)

"Private connectivity từ on-premises đến AWS, không qua internet" → AWS Direct Connect + PrivateLink

📖 Reference:

Amazon S3 Multi-Region Access Points - https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPoints.html

Connecting to Amazon S3 using PrivateLink - https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html


< back to result overview

© 2026 Cloud Exam Pro

Course Review - Cloud Exam Pro