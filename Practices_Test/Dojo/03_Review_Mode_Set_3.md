# AWS Certified Solutions Architect Associate (SAA-C03) - Practice Exam Set 3

> **Tổng số câu hỏi:** 65 câu  
> **Nguồn tài liệu:** Tutorials Dojo  
> **Chế độ:** Review Mode (Kèm đáp án & lời giải chi tiết vì sao đúng / sai)  

---

## Câu 1 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
An on-premises server uses an SMB network file share to store application data. The application produces around 50 MB of data per day, but it only needs to access some of it for daily processes. To save on storage costs, the company plans to copy all the application data to AWS. However, the goal is to retain the ability to retrieve data with the same low-latency access as the local file share. The company does not have the capacity to develop the needed tools for this operation.

Which of the following should the company use?

### Các lựa chọn (Choices)
- [x] **A.** AWS Storage Gateway
- [ ] **B.** AWS DataSync
- [ ] **C.** Amazon FSx for Windows File Server
- [ ] **D.** AWS Virtual Private Network (VPN)

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** AWS Storage Gateway

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Storage Gateway** is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage. Customers use Storage Gateway to simplify storage management and reduce costs for key hybrid cloud storage use cases. These include moving backups to the cloud, using on-premises file shares backed by cloud storage, and providing low-latency access to data in AWS for on-premises applications.

![AWS Storage Gateway - File Gateway](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/storage-gateway-file-gateway-18JUN2025.png)

Specifically for this scenario, you can use the File Gateway configuration to support the SMB file share for the on-premises application. It also meets the requirement for low-latency access. File Gateway helps accelerate your file-based storage migration to the cloud to enable faster performance, improved data protection, and reduced cost.

Hence, the correct answer is: **AWS Storage Gateway.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **AWS Virtual Private Network (VPN)** is incorrect because this service is typically used for establishing encryption connections from an on-premises network to AWS.

- **Amazon FSx for Windows File Server** is incorrect. This won’t provide low-latency access since all the files are stored on AWS, which means that they will be accessed via the internet. AWS Storage Gateway supports local caching without any development overhead, making it suitable for low-latency applications.

- **AWS DataSync** is incorrect because it is primarily designed for one-time or recurring data transfer, not for maintaining low-latency file access through a local SMB share. It simply copies data between storage locations and does not provide local caching for frequently accessed files.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/storagegateway/](https://aws.amazon.com/storagegateway/)
- [https://docs.aws.amazon.com/storagegateway/latest/userguide/CreatingAnSMBFileShare.html](https://docs.aws.amazon.com/storagegateway/latest/userguide/CreatingAnSMBFileShare.html)
- [https://aws.amazon.com/blogs/compute/deploying-low-latency-hybrid-cloud-storage-on-aws-local-zones-using-aws-storage-gateway/](https://aws.amazon.com/blogs/compute/deploying-low-latency-hybrid-cloud-storage-on-aws-local-zones-using-aws-storage-gateway/)

**Check out this AWS Storage Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-storage-gateway/](https://tutorialsdojo.com/aws-storage-gateway/)

---

## Câu 2 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has launched multiple Amazon EC2 instances inside a private subnet of a VPC. The Solutions Architect is reviewing the Network ACL (NACL) rules associated with that subnet to ensure security. The current Inbound Rules for the NACL are configured as follows:

![](../data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201%201'%3E%3C/svg%3E)

A computer with the IP address 110.238.109.37 attempts to send a request to one of the EC2 instances in this subnet.

What will happen to the incoming request based on the NACL rules?

### Các lựa chọn (Choices)
- [x] **A.** It will be allowed.
- [ ] **B.** It will be denied.
- [ ] **C.** Initially, it will be denied and then after a while, the connection will be allowed.
- [ ] **D.** Initially, it will be allowed and then after a while, the connection will be denied.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** It will be allowed.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
When evaluating the incoming request from the IP 110.238.109.37 to an EC2 instance in the private subnet, the Network ACL (NACL) processes rules sequentially, starting from the lowest rule number. NACLs are stateless, meaning they apply each rule independently and in the order defined, unlike stateful security groups that track connection states. In this case, Rule #100, which allows all traffic, is evaluated before Rule #101, which denies TCP port 4000 traffic from 110.238.109.37. Since the request matches Rule #100, it will be allowed immediately, and Rule #101 will not be evaluated.

The default deny-all rule (*) does not come into play here because the request was already processed by an earlier rule. This behavior aligns with AWS’s NACL best practices, where explicit allow rules should be placed after any specific deny rules to ensure proper traffic management. The allow-all rule in Rule #100 takes precedence as it is evaluated first.

In summary, NACLs enforce a strict first-match policy, meaning the request from 110.238.109.37 is allowed due to Rule #100, which demonstrates how explicit allow rules can override more restrictive ones when placed earlier in the rule set. This ensures predictable traffic control, which is critical for securing private subnets within a VPC.

![Security Group vs, Network Access Control List](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/SGNCL-latest.jpg)

Hence, the correct answer is: **It will be allowed.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Initially, it will be allowed and then after a while, the connection will be denied** is incorrect because NACLs only evaluate rules statically, they do not track connection states or change decisions over time. Unlike stateful security groups, NACLs simply process rules in order, and the request is immediately denied by Rule #101. There’s no “initial allowance” or delayed denial.

- The option that says: **Initially, it will be denied and then after a while, the connection will be allowed** is incorrect because NACLs do not dynamically reassess traffic. The request is only evaluated once, and since Rule #101 explicitly denies it, the decision is final. There’s no subsequent “allowance” after an initial denial.

- The option that says: **It will be denied** is incorrect because rule #100 explicitly allows all traffic, which means the request from 110.238.109.37 will be allowed immediately. Rule #101, which denies traffic from that IP, will not be evaluated because Rule #100 takes precedence due to its position as the first matching rule. Therefore, the request will not be denied, and this option is not correct.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/nacl-rules.html](https://docs.aws.amazon.com/vpc/latest/userguide/nacl-rules.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 3 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company has an e-commerce application that saves the transaction logs to an S3 bucket. You are instructed by the CTO to configure the application to keep the transaction logs for one month for troubleshooting purposes, and then afterward, purge the logs.

What should you do to accomplish this requirement?

### Các lựa chọn (Choices)
- [x] **A.** Configure the lifecycle configuration rules on the Amazon S3 bucket to purge the transaction logs after a month
- [ ] **B.** Create a new IAM policy for the Amazon S3 bucket that automatically deletes the logs after a month
- [ ] **C.** Enable CORS on the Amazon S3 bucket which will enable the automatic monthly deletion of data
- [ ] **D.** Add a new bucket policy on the Amazon S3 bucket.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Configure the lifecycle configuration rules on the Amazon S3 bucket to purge the transaction logs after a month

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In this scenario, the best way to accomplish the requirement is to simply configure the lifecycle configuration rules on the Amazon S3 bucket to purge the transaction logs after a month.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/lifecycle-transitions-v2.png)

Lifecycle configuration enables you to specify the lifecycle management of objects in a bucket. The configuration is a set of one or more rules, where each rule defines an action for Amazon S3 to apply to a group of objects. These actions can be classified as follows:

 **Transition actions** – In which you define when objects transition to another storage class. For example, you may choose to transition objects to the STANDARD_IA (IA, for infrequent access) storage class 30 days after creation or archive objects to the GLACIER storage class one year after creation.

 **Expiration actions** – In which you specify when the objects expire. Then Amazon S3 deletes the expired objects on your behalf.

Hence, the correct answer is: **Configure the lifecycle configuration rules on the Amazon S3 bucket to purge the transaction logs after a month.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Add a new bucket policy on the Amazon S3 bucket** is incorrect as it does not provide a solution to any of your needs in this scenario. You add a bucket policy to a bucket to grant other AWS accounts or IAM users access permissions for the bucket and the objects in it.

- The option that says: **Create a new IAM policy for the Amazon S3 bucket that automatically deletes the logs after a month** is incorrect because IAM policies are primarily used to specify what actions are allowed or denied on your S3 buckets. You cannot configure an IAM policy to automatically purge logs for you in any way.

- The option that says: **Enable CORS on the Amazon S3 bucket which will enable the automatic monthly deletion of data** is incorrect. CORS allows client web applications that are loaded in one domain to interact with resources in a different domain.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html)
- [https://docs.amazonaws.cn/en_us/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html](https://docs.amazonaws.cn/en_us/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate/)

---

## Câu 4 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company currently has an Augment Reality (AR) mobile game that has a serverless backend. It is using a DynamoDB table which was launched using the AWS CLI to store all the user data and information gathered from the players and a Lambda function to pull the data from DynamoDB. The game is being used by millions of users each day to read and store data.

How would you design the application to improve its overall performance and make it more scalable while keeping the costs low? (Select TWO

### Các lựa chọn (Choices)
- [x] **A.** Enable DynamoDB Accelerator (DAX) and ensure that the Auto Scaling is enabled and increase the maximum provisioned read and write capacity.
- [ ] **B.** Since Auto Scaling is enabled by default, the provisioned read and write capacity will adjust automatically. Also enable DynamoDB Accelerator (DAX) to improve the performance from milliseconds to microseconds.
- [ ] **C.** Configure CloudFront with DynamoDB as the origin; cache frequently accessed data on the client device using ElastiCache.
- [x] **D.** Use API Gateway in conjunction with Lambda and turn on the caching on frequently accessed data and enable DynamoDB global replication.
- [ ] **E.** Use AWS IAM Identity Center to authenticate users and have them directly access DynamoDB using single sign-on. Manually set the provisioned read and write capacity to a higher RCU and WCU.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, D**
> - **A.** Enable DynamoDB Accelerator (DAX) and ensure that the Auto Scaling is enabled and increase the maximum provisioned read and write capacity.
> - **D.** Use API Gateway in conjunction with Lambda and turn on the caching on frequently accessed data and enable DynamoDB global replication.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon DynamoDB Accelerator (DAX)** is a fully managed, highly available, in-memory cache for DynamoDB that delivers up to a 10x performance improvement – from milliseconds to microseconds – even at millions of requests per second. DAX does all the heavy lifting required to add in-memory acceleration to your DynamoDB tables, without requiring developers to manage cache invalidation, data population, or cluster management.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/ddb_as_set_read_1.png)

 **Amazon API Gateway** lets you create an API that acts as a “front door” for applications to access data, business logic, or functionality from your back-end services, such as code running on AWS Lambda. Amazon API Gateway handles all of the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls, including traffic management, authorization, and access control, monitoring, and API version management. Amazon API Gateway has no minimum fees or startup costs.

 **AWS Lambda** scales your functions automatically on your behalf. Every time an event notification is received for your function, AWS Lambda quickly locates free capacity within its compute fleet and runs your code. Since your code is stateless, AWS Lambda can start as many copies of your function as needed without lengthy deployment and configuration delays.

The correct answers are the options that say:

 **– Enable DynamoDB Accelerator (DAX) and ensure that the Auto Scaling is enabled and increase the maximum provisioned read and write capacity.**

 **– Use API Gateway in conjunction with Lambda and turn on the caching on frequently accessed data and enable DynamoDB global replication.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Configure CloudFront with DynamoDB as the origin; cache frequently accessed data on the client device using ElastiCache** is incorrect. Although CloudFront delivers content faster to your users using edge locations, you still cannot integrate DynamoDB table with CloudFront as these two are incompatible.

- The option that says: **Use AWS IAM Identity Center to authenticate users and have them directly access DynamoDB using single sign-on. Manually set the provisioned read and write capacity to a higher RCU and WCU** is incorrect because AWS IAM Identity Center is a service that just makes it easy to centrally manage access to multiple AWS accounts and business applications. This will not be of much help to the scalability and performance of the application. It is costly to manually set the provisioned read and write capacity to a higher RCU and WCU because this capacity will run round the clock and will still be the same even if the incoming traffic is stable and there is no need to scale.

- The option that says: **Since Auto Scaling is enabled by default, the provisioned read and write capacity will adjust automatically. Also enable DynamoDB Accelerator (DAX) to improve the performance from milliseconds to microseconds** is incorrect because by default, Auto Scaling is not enabled in a DynamoDB table, which is created using the AWS CLI.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/lambda/faqs/](https://aws.amazon.com/lambda/faqs/)
- [https://aws.amazon.com/api-gateway/faqs/](https://aws.amazon.com/api-gateway/faqs/)
- [https://aws.amazon.com/dynamodb/dax/](https://aws.amazon.com/dynamodb/dax/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate/)

---

## Câu 5 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company that is rapidly growing in recent months has been in the process of setting up IAM users on its single AWS Account. A solutions architect has been tasked to handle the user management, which includes granting read-only access to users and denying permissions whenever an IAM user has no MFA setup. New users will be added frequently based on their respective departments.

Which of the following action is the MOST secure way to grant permissions to the new users?

### Các lựa chọn (Choices)
- [ ] **A.** Create a Service Control Policy (SCP) that enforces MFA authentication for each department. Add a trust relationship to every SCP and attach it to each IAM User.
- [ ] **B.** Create an IAM Role that enforces MFA authentication with the least privilege permission. Set up a corresponding IAM Group for each department. Attach the IAM Role to the IAM Groups.
- [x] **C.** Launch an IAM Group for each department. Create an IAM Policy that enforces MFA authentication with the least privilege permission. Attach the IAM Policy to each IAM Group.
- [ ] **D.** Set up IAM roles for each IAM user and associate a permissions boundary that defines the maximum permissions.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Launch an IAM Group for each department. Create an IAM Policy that enforces MFA authentication with the least privilege permission. Attach the IAM Policy to each IAM Group.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Multi-factor authentication (MFA)** in AWS is a simple best practice that adds an extra layer of protection on top of your user name and password. With MFA enabled, when a user signs in to an AWS Management Console, they will be prompted for their user name and password (the first factor—what they know), as well as for an authentication code from their AWS MFA device (the second factor—what they have). Taken together, these multiple factors provide increased security for your AWS account settings and resources. You can create an IAM Policy to restrict access to AWS services for AWS Identity and Access Management (IAM) users. The IAM Policy that enforces MFA authentication can then be attached to an IAM Group to quickly apply to all IAM Users.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-iam-user-MFA-settings-saa-c03.png)

An IAM user group is a collection of IAM users. User groups let you specify permissions for multiple users, which can make it easier to manage the permissions for those users. For example, you could have a user group called *Admins* and give that user group typical administrator permissions. Any user in that user group automatically has *Admins* group permissions. If a new user joins your organization and needs administrator privileges, you can assign the appropriate permissions by adding the user to the *Admins* user group. If a person changes jobs in your organization, instead of editing that user’s permissions you can remove him or her from the old user groups and add him or her to the appropriate new user groups.

You can attach an identity-based policy to a user group so that all of the users in the user group receive the policy’s permissions. You cannot identify a user group as a <code”>Principal in a policy (such as a resource-based policy) because groups relate to permissions, not authentication, and principals are authenticated IAM entities.

Hence, the correct answer is: **Launch an IAM Group for each department. Create an IAM Policy that enforces MFA authentication with the least privilege permission. Attach the IAM Policy to each IAM Group.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create an IAM Role that enforces MFA authentication with the least privilege permission. Set up a corresponding IAM Group for each department. Attach the IAM Role to the IAM Groups** is incorrect because an IAM Group is usually provided with an IAM Policy and not an IAM Role. There is no direct way in the AWS Management Console to manually assign an IAM Role to a particular IAM Group.

- The option that says: **Create a Service Role Policy (SCP) that enforces MFA authentication for each department. Add a trust relationship to every SCP and attach it to each IAM User** is incorrect because an SCP can only be attached to the organization root, to an organizational unit (OU), or directly to an account, but not directly in the IAM User. Take note that the scenario explicitly mentioned that the company is using a single AWS account and not multiple AWS Accounts under a single AWS Organization.

- The option that says: **Set up IAM roles for each IAM user and associate a permissions boundary that defines the maximum permissions** is incorrect because you cannot directly associate an IAM role with an IAM user. The use of a permissions boundary is not warranted as well since this is primarily used to set the maximum permissions that an identity-based policy can grant to an IAM entity. The best practice is to grant the least privilege permission, and not the other way around.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/iam/features/mfa/](https://aws.amazon.com/iam/features/mfa/)
- [https://aws.amazon.com/premiumsupport/knowledge-center/mfa-iam-user-aws-cli/](https://aws.amazon.com/premiumsupport/knowledge-center/mfa-iam-user-aws-cli/)

**Check out this AWS Identity and Access Management (IAM) cheat sheet:**
- [https://tutorialsdojo.com/aws-identity-and-access-management-iam/](https://tutorialsdojo.com/aws-identity-and-access-management-iam/)

---

## Câu 6 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company needs to collect gigabytes of data per second from websites and social media feeds to gain insights into its product offerings and continuously improve the user experience. To meet this design requirement, an application is deployed on an Auto Scaling group of Spot instances in Amazon EC2, which processes the data and stores the results to Amazon DynamoDB and Amazon Redshift. The solution should have a built-in enhanced fan-out feature.

Which AWS solution can be used to collect and process large streams of data records in real-time with the LEAST amount of administrative overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Amazon Managed Streaming for Apache Kafka (Amazon MSK)
- [x] **B.** Amazon Kinesis Data Streams
- [ ] **C.** AWS Data Exchange
- [ ] **D.** AWS Batch

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Amazon Kinesis Data Streams

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Kinesis Data Streams** is used to collect and process large streams of data records in real-time. You can use Kinesis Data Streams for rapid and continuous data intake and aggregation. The type of data used includes IT infrastructure log data, application logs, social media, market data feeds, and web clickstream data. Because the response time for the data intake and processing is in real-time, the processing is typically lightweight.

The following diagram illustrates the high-level architecture of Kinesis Data Streams. The producers continually push data to Kinesis Data Streams, and the consumers process the data in real-time. Consumers (such as a custom application running on Amazon EC2 or an Amazon Data Firehose stream) can store their results using an AWS service such as Amazon DynamoDB, Amazon Redshift, or Amazon S3.

![Amazon Kinesis Data Streams](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/kinesis-data-streams-diagram-main.jpg)

Hence, the correct answer is: **Amazon Kinesis Data Streams.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **AWS Batch** is incorrect because it is simply a fully‑managed service for running batch computing workloads, not for real‑time streaming data ingestion and processing.

- **AWS Data Exchange** ** ** is incorrect because this is just a data marketplace service.

- **Amazon Managed Streaming for Apache Kafka (Amazon MSK)** is incorrect. Although you can process streaming data in real-time with Amazon MSK, this service still entails a lot of administrative overhead, unlike Amazon Kinesis. Moreover, it doesn’t have a built-in enhanced fan-out feature as required in the scenario.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/streams/latest/dev/introduction.html](https://docs.aws.amazon.com/streams/latest/dev/introduction.html)
- [https://aws.amazon.com/kinesis/](https://aws.amazon.com/kinesis/)

**Check out this Amazon Kinesis Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-kinesis/](https://tutorialsdojo.com/amazon-kinesis/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate/)

---

## Câu 7 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A major TV network has a web application running on eight Amazon T3 EC2 instances behind an application load balancer. The number of requests that the application processes are consistent and do not experience spikes. A Solutions Architect must configure an Auto Scaling group for the instances to ensure that the application is running at all times.

Which of the following options can satisfy the given requirements?

### Các lựa chọn (Choices)
- [ ] **A.** Deploy four EC2 instances with Auto Scaling in one region and four in another region behind an Amazon Elastic Load Balancer.
- [ ] **B.** Deploy eight EC2 instances with Auto Scaling in one Availability Zone behind an Amazon Elastic Load Balancer.
- [x] **C.** Deploy four EC2 instances with Auto Scaling in one Availability Zone and four in another availability zone in the same region behind an Amazon Elastic Load Balancer.
- [ ] **D.** Deploy two EC2 instances with Auto Scaling in four regions behind an Amazon Elastic Load Balancer.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Deploy four EC2 instances with Auto Scaling in one Availability Zone and four in another availability zone in the same region behind an Amazon Elastic Load Balancer.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The best option to take is to deploy four EC2 instances in one Availability Zone and four in another availability zone in the same region behind an Amazon Elastic Load Balancer. In this way, if one availability zone goes down, there is still another available zone that can accommodate traffic.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/autoscaling-group-3-42.jpg)

When the first AZ goes down, the second AZ will only have an initial 4 EC2 instances. This will eventually be scaled up to 8 instances since the solution is using Auto Scaling.

The 110% compute capacity for the 4 servers might cause some degradation of the service but not a total outage since there are still some instances that handle the requests. Depending on your scale-up configuration in your Auto Scaling group, the additional 4 EC2 instances can be launched in a matter of minutes.

T3 instances also have a Burstable Performance capability to burst or go beyond the current compute capacity of the instance to higher performance as required by your workload. So your 4 servers will be able to manage 110% compute capacity for a short period of time. This is the power of cloud computing versus our on-premises network architecture. It provides elasticity and unparalleled scalability.

Take note that Auto Scaling will launch additional EC2 instances to the remaining Availability Zone/s in the event of an Availability Zone outage in the region. Hence, the correct answer is the option that says: **Deploy four EC2 instances with Auto Scaling in one Availability Zone and four in another availability zone in the same region behind an Amazon Elastic Load Balancer.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Deploy eight EC2 instances with Auto Scaling in one Availability Zone behind an Amazon Elastic Load Balancer** is incorrect because this architecture is not highly available. If that Availability Zone goes down, then your web application will be unreachable.

- The options that say: **Deploy four EC2 instances with Auto Scaling in one region and four in another region behind an Amazon Elastic Load Balancer** **and** **Deploy two EC2 instances with Auto Scaling in four regions behind an Amazon Elastic Load Balancer** are incorrect because the ELB is designed to only run in one region and not across multiple regions.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/elasticloadbalancing/](https://aws.amazon.com/elasticloadbalancing/)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-increase-availability.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-increase-availability.html)

**Check out this AWS Elastic Load Balancing (ELB) Cheat Sheet:**
- [https://tutorialsdojo.com/aws-elastic-load-balancing-elb/](https://tutorialsdojo.com/aws-elastic-load-balancing-elb/)

---

## Câu 8 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A firm has a containerized application that runs on a self-managed Kubernetes cluster. The cluster writes data in an on-premises MongoDB database. A solutions architect is requested to move the service to AWS in order to minimize operational overhead. The firm prohibits any changes to the code.

Which action meets these objectives?

### Các lựa chọn (Choices)
- [x] **A.** Migrate the cluster to an Amazon Elastic Kubernetes Service (EKS) cluster and the database to an Amazon DocumentDB (with MongoDB compatibility) database.
- [ ] **B.** Migrate the cluster to an Amazon Elastic Container Service (ECS) cluster using Amazon ECS Anywhere and the database to an Amazon Aurora Serverless database.
- [ ] **C.** Migrate the cluster to an Amazon Elastic Container Service (ECS) cluster with the images stored in the Amazon Elastic Container Registry (Amazon ECR). Move the database to an Amazon Neptune database
- [ ] **D.** Migrate the cluster to an Amazon Elastic Kubernetes Service (EKS) cluster using Amazon EKS Anywhere and the database to an Amazon DynamoDB table.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Migrate the cluster to an Amazon Elastic Kubernetes Service (EKS) cluster and the database to an Amazon DocumentDB (with MongoDB compatibility) database.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon DocumentDB (with MongoDB compatibility) is a fast, scalable, highly available, and fully managed document database service that supports MongoDB workloads. The [Amazon DocumentDB Migration Guide](https://docs.aws.amazon.com/documentdb/latest/developerguide/docdb-migration.html#docdb-migration-approaches) outlines three primary approaches for migrating from MongoDB to Amazon DocumentDB: offline, online, and hybrid.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/mongoDB-to-amazon-documentDB.jpg)

The image above illustrates an offline migration approach, which is the fastest and simplest of the three but incurs the longest period of downtime. This approach is a good choice for proofs of concepts, development and test workloads, and production workloads for which downtime is not of primary concern. For online approach, you may use AWS DMS to minimize downtime. AWS DMS continually reads from the source MongoDB oplog and applies those changes in near-real time on the source Amazon DocumentDB cluster.

Hence, the correct answer is: **Migrate the cluster to an Amazon Elastic Kubernetes Service (EKS) cluster and the database to an Amazon DocumentDB (with MongoDB compatibility) database.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Migrate the cluster to an Amazon Elastic Container Service (ECS) cluster using Amazon ECS Anywhere and the database to an Amazon Aurora Serverless database** is incorrect. You can’t directly migrate to Amazon Aurora because MongoDB is a non-relational database. Amazon Elastic Container Service (ECS) Anywhere is simply a feature of Amazon ECS that enables you to easily run and manage container workloads on customer-managed infrastructure.

- The option that says: **Migrate the cluster to an Amazon Elastic Kubernetes Service (EKS) cluster using Amazon EKS Anywhere and the database to an Amazon DynamoDB table** is incorrect. Although DynamoDB supports JSON-like documents, migrating from MongoDB to a DynamoDB table would involve code changes since the operations for accessing DynamoDB tables are different. DynamoDB has a different set of APIs for creating, reading, updating, and deleting items than MongoDB. The use of Amazon EKS Anywhere is not warranted as well. This is only a new deployment option for Amazon EKS that allows customers to create and operate Kubernetes clusters on customer-managed infrastructure.

- The option that says: **Migrate the cluster to an Amazon Elastic Container Service (ECS) cluster with the images stored in the Amazon Elastic Container Registry (Amazon ECR). Move the database to an Amazon Neptune database** is incorrect. Amazon Neptune is not suitable for the use case described in the scenario. Amazon Neptune is a fully managed graph database service that makes it easy to build and run applications that work with highly connected datasets.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/documentdb/latest/developerguide/docdb-migration.html#docdb-migration-approaches](https://docs.aws.amazon.com/documentdb/latest/developerguide/docdb-migration.html#docdb-migration-approaches)
- [https://aws.amazon.com/eks/](https://aws.amazon.com/eks/)

**Check out this Amazon DocumentDB Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-documentdb/](https://tutorialsdojo.com/amazon-documentdb/)

---

## Câu 9 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company hosted a web application on a Linux Amazon EC2 instance in the public subnet that uses a non-default network ACL. The instance uses a default security group and has an attached Elastic IP address. The network ACL is configured to block all inbound and outbound traffic. The Solutions Architect must allow incoming traffic on port 443 to access the application from any source.

Which combination of steps will accomplish this requirement? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** In the Network ACL, update the rule to allow both inbound and outbound TCP connection on port 443 from source `0.0.0.0/0` and to destination `0.0.0.0/0`
- [ ] **B.** In the Network ACL, update the rule to allow outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`
- [x] **C.** In the Network ACL, update the rule to allow inbound TCP connection on port 443 from source `0.0.0.0/0` and outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`
- [x] **D.** In the Security Group, add a new rule to allow TCP connection on port 443 from source `0.0.0.0/0`
- [ ] **E.** In the Security Group, create a new rule to allow TCP connection on port 443 to destination `0.0.0.0/0`

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C, D**
> - **C.** In the Network ACL, update the rule to allow inbound TCP connection on port 443 from source `0.0.0.0/0` and outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`
> - **D.** In the Security Group, add a new rule to allow TCP connection on port 443 from source `0.0.0.0/0`

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In order to connect to a service running on an instance, you need to make sure that both inbound traffic on the port that the service is listening on and outbound traffic from ephemeral ports are allowed in the associated network ACL. When a client connects to a server, a random port is generated (like 1024-65535) from the ephemeral port range with this becoming the client’s source port.

The designated ephemeral port then becomes the destination port for return traffic from the service, so outbound traffic from the ephemeral port must be allowed in the network ACL. By default, network ACLs allow all inbound and outbound traffic. If your network ACL is more restrictive, then you need to explicitly allow traffic from the ephemeral port range.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Network_ACL_Ephemeral_Ports.png)

The client that initiates the request chooses the ephemeral port range. The range varies depending on the client’s operating system.

– Many Linux kernels (including the Amazon Linux kernel) use ports 32768-61000.

– Requests originating from Elastic Load Balancing use ports 1024-65535.

– Windows operating systems through Windows Server 2003 use ports 1025-5000.

– Windows Server 2008 and later versions use ports 49152-65535.

– A NAT gateway uses ports 1024-65535.

– AWS Lambda functions use ports 1024-65535.

For example, if a request comes into a web server in your VPC from a Windows 10 client on the Internet, your network ACL must have an outbound rule to enable traffic destined for ports 49152 – 65535. If an instance in your VPC is the client initiating a request, your network ACL must have an inbound rule to enable traffic destined for the ephemeral ports specific to the type of instance (Amazon Linux, Windows Server 2008, and so on).

In this scenario, you only need to allow the incoming traffic on port 443. Since security groups are stateful, you can apply any changes to an incoming rule and it will be automatically applied to the outgoing rule.

To enable the connection to a service running on an instance, the associated network ACL must allow both inbound traffic on the port that the service is listening on as well as outbound traffic from ephemeral ports. When a client connects to a server, a random port from the ephemeral port range (32768 – 65535) becomes the client’s source port. Since the return traffic will use an ephemeral port, outbound traffic must be allowed on these ports to destination 0.0.0.0/0.

Hence, the correct answers are:

 **– In the Security Group, add a new rule to allow TCP connection on port 443 from source `0.0.0.0/0`.**

 **– In the Network ACL, update the rule to allow inbound TCP connection on port 443 from source `0.0.0.0/0` and outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **In the Security Group, create a new rule to allow TCP connection on port 443 to destination `0.0.0.0/0`** is incorrect because this step just allows outbound connections from the EC2 instance out to the public Internet, which is unnecessary. Remember that a default security group already includes an outbound rule that allows all outbound traffic.

- The option that says: **In the Network ACL, update the rule to allow both inbound and outbound TCP connection on port 443 from source 0.0.0.0/0 and to destination `0.0.0.0/0`** is incorrect because your network ACL must have an outbound rule to allow ephemeral ports (`32768 - 65535`). These are the specific ports that will be used as the client’s source port for the traffic response.

- The option that says: **In the Network ACL, update the rule to allow outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`** is incorrect because this step is just partially right. You still need to add an inbound rule from port 443 and not just the outbound rule for the ephemeral ports (`32768 - 65535`).

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/premiumsupport/knowledge-center/connect-http-https-ec2/](https://aws.amazon.com/premiumsupport/knowledge-center/connect-http-https-ec2/)
- [https://docs.amazonaws.cn/en_us/vpc/latest/userguide/vpc-network-acls.html#nacl-ephemeral-ports](https://docs.amazonaws.cn/en_us/vpc/latest/userguide/vpc-network-acls.html#nacl-ephemeral-ports)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 10 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company is storing its financial reports and regulatory documents in an Amazon S3 bucket. To comply with the IT audit, they tasked their Solutions Architect to track all new objects added to the bucket as well as the removed ones. It should also track whether a versioned object is permanently deleted. The Architect must configure Amazon S3 to publish notifications for these events to a queue for post-processing and to an Amazon SNS topic that will notify the Operations team.

Which of the following is the MOST suitable solution that the Architect should implement?

### Các lựa chọn (Choices)
- [x] **A.** Create a new Amazon SNS topic and Amazon SQS queue. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `s3:ObjectRemoved:Delete` event types to SQS and SNS.
- [ ] **B.** Create a new Amazon SNS topic and Amazon MQ. Add an S3 event notification configuration on the bucket to publish `s3:ObjectAdded:*` and `s3:ObjectRemoved:*` event types to SQS and SNS.
- [ ] **C.** Create a new Amazon SNS topic and Amazon MQ. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `ObjectRemoved:DeleteMarkerCreated` event types to SQS and SNS.
- [ ] **D.** Create a new Amazon SNS topic and Amazon SQS queue. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `ObjectRemoved:DeleteMarkerCreated` event types to SQS and SNS.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Create a new Amazon SNS topic and Amazon SQS queue. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `s3:ObjectRemoved:Delete` event types to SQS and SNS.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The **Amazon S3 notification** feature enables you to receive notifications when certain events happen in your bucket. To enable notifications, you must first add a notification configuration that identifies the events you want Amazon S3 to publish and the destinations where you want Amazon S3 to send the notifications. You store this configuration in the *notification* subresource that is associated with a bucket. Amazon S3 provides an API for you to manage this subresource.

 **Amazon S3 event notifications** typically deliver events in seconds but can sometimes take a minute or longer. If two writes are made to a single non-versioned object at the same time, it is possible that only a single event notification will be sent. If you want to ensure that an event notification is sent for every successful write, you can enable versioning on your bucket. With versioning, every successful write will create a new version of your object and will also send an event notification.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/s3_notification_flow_2.png)

Amazon S3 can publish notifications for the following events:

1. New object-created events

2. Object removal events

3. Restore object events

4. Reduced Redundancy Storage (RRS) object lost events

5. Replication events

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-03-29_06-10-21-25e6fb0ac4acbec47824325e0c154564.png)

Amazon S3 supports the following destinations where it can publish events:

1. Amazon Simple Notification Service (Amazon SNS) topic

2. Amazon Simple Queue Service (Amazon SQS) queue

3. AWS Lambda

If your notification ends up writing to the bucket that triggers the notification, this could cause an execution loop. For example, if the bucket triggers a Lambda function each time an object is uploaded and the function uploads an object to the bucket, then the function indirectly triggers itself. To avoid this, use two buckets, or configure the trigger to only apply to a prefix used for incoming objects.

Hence, the correct answer is: **Create a new Amazon SNS topic and Amazon SQS queue. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `s3:ObjectRemoved:Delete` event types to SQS and SNS.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create a new Amazon SNS topic and Amazon MQ. Add an S3 event notification configuration on the bucket to publish `s3:ObjectAdded:*` and `s3:ObjectRemoved:*` event types to SQS and SNS** is incorrect. There is no `s3:ObjectAdded:*` type in Amazon S3 **.** You should add an S3 event notification configuration on the bucket to publish events of the `s3:ObjectCreated:*` type instead. Moreover, Amazon S3 does support Amazon MQ as a destination to publish events.

- The option that says: **Create a new Amazon SNS topic and Amazon SQS queue. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `ObjectRemoved:DeleteMarkerCreated` event types to SQS and SNS** is incorrect because the `s3:ObjectRemoved:DeleteMarkerCreated` type is only triggered when a delete marker is created for a versioned object and not when an object is deleted or a versioned object is permanently deleted.

- The option that says: **Create a new Amazon SNS topic and Amazon MQ. Add an S3 event notification configuration on the bucket to publish `s3:ObjectCreated:*` and `ObjectRemoved:DeleteMarkerCreated` event types to SQS and SNS** is incorrect because Amazon S3 does public event messages to Amazon MQ. You should use an Amazon SQS instead. In addition, the `s3:ObjectRemoved:DeleteMarkerCreated` type is only triggered when a delete marker is created for a versioned object. Remember that the scenario asked to publish events when an object is deleted or a versioned object is permanently deleted.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/ways-to-add-notification-config-to-bucket.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/ways-to-add-notification-config-to-bucket.html)
- [https://aws.amazon.com/blogs/aws/s3-event-notification/](https://aws.amazon.com/blogs/aws/s3-event-notification/)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 11 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A solutions architect is designing an infrastructure for a serverless application. The application is packaged as a Docker image stored in Amazon Elastic Container Registry (Amazon ECR) and must be deployed on a fully managed serverless compute service. Additionally, the application requires 5 GB of ephemeral storage for temporary data processing.

Which deployment option meets these requirements?

### Các lựa chọn (Choices)
- [x] **A.** Deploy the application in an AWS Lambda function with Container image support. Set the function’s storage to 5 GB.
- [ ] **B.** Deploy the application Amazon ECS cluster with Amazon EC2 worker nodes and attach a 5 GB Amazon EBS volume.
- [ ] **C.** Deploy the application in an AWS Lambda function with Container image support. Attach an Amazon Elastic File System (Amazon EFS) volume to the function.
- [ ] **D.** Deploy the application to an Amazon ECS cluster that uses AWS Fargate tasks.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Deploy the application in an AWS Lambda function with Container image support. Set the function’s storage to 5 GB.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
AWS Lambda with Container Image Support is a fully managed, serverless compute service that allows you to run your applications without provisioning or managing servers. Traditionally, AWS Lambda functions were deployed using code written in supported programming languages, but with container image support, you can now package and deploy your application as a Docker container. This provides more flexibility, as it allows you to use custom runtimes or include dependencies that are difficult to manage in a traditional Lambda function deployment. Lambda functions with container images can be up to 10 GB in size, enabling you to deploy large, complex applications with ease.

![AWS Lambda Ephemeral Storage](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/TD-AWS-Lambda-Ephemeral-Storage-03-17-2025.png)

One of the key features of AWS Lambda is the ability to allocate ephemeral storage for each function instance. By default, Lambda functions come with 512 MB of temporary storage, but you can configure up to 10 GB of storage. This ephemeral storage is used for temporary data processing and is wiped clean after the execution of the function. This makes it a great choice for applications that need to perform tasks like data processing, file manipulation, or caching during their execution, without needing persistent storage.

Lambda with container image support provides a fully managed environment that automatically scales based on the workload. You are only billed for the compute time your code actually uses, and there are no charges for idle time, making it a cost-effective solution for many workloads. It abstracts away infrastructure management, ensuring that developers can focus on building applications without worrying about scaling, patching, or maintaining servers.

Hence, the correct answer is: **Deploy the application in an AWS Lambda function with Container image support. Set the function’s storage to 5 GB.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Deploy the application to an Amazon ECS cluster that uses AWS Fargate tasks** is incorrect because Amazon ECS with Fargate tasks is not a fully serverless solution. While Fargate allows you to run containers without managing the underlying EC2 instances, it still requires you to configure and manage ECS services, task definitions, and clusters. ECS with Fargate is primarily used for containerized applications that require more granular control over the environment, including network configurations and scaling.

- The option that says: **Deploy the application in an AWS Lambda function with Container image support. Attach an Amazon Elastic File System (Amazon EFS) volume to the function** is incorrect because it uses Amazon EFS for persistent storage, which is typically used for shared file systems that need to persist data across function invocations. However, the question specifies a need for ephemeral storage, which is temporary and does not require persistence. Attaching an EFS volume introduces additional complexity and is unnecessary when the application only needs temporary, in-memory storage during execution.

- The option that says: **Deploy the application Amazon ECS cluster with Amazon EC2 worker nodes and attach a 5 GB Amazon EBS volume** is incorrect because the scenario explicitly mentioned that the architecture must be serverless. Using Amazon EC2 instances for your worker nodes is not a serverless architecture.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/lambda/latest/dg/images-create.html](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html)
- [https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/deploy-lambda-functions-with-container-images.html](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/deploy-lambda-functions-with-container-images.html)

**Check out these AWS Fargate and AWS Lambda Cheat Sheets:**
- [https://tutorialsdojo.com/aws-fargate/](https://tutorialsdojo.com/aws-fargate/)
- [https://tutorialsdojo.com/aws-lambda/https://tutorialsdojo.com/aws-lambda/](https://tutorialsdojo.com/aws-lambda/https://tutorialsdojo.com/aws-lambda/)

---

## Câu 12 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A Solutions Architect is managing a company’s AWS account of approximately 300 IAM users. The company has a new policy that requires changing the associated permissions of all 100 IAM users who control access to Amazon S3 buckets.

What will the Solutions Architect do to avoid the time-consuming task of applying the policy to each user?

### Các lựa chọn (Choices)
- [x] **A.** Create a new IAM group and then add the users that require access to the S3 bucket. Afterwards, apply the policy to IAM group.
- [ ] **B.** Create a scheduled rule with Amazon EventBridge Scheduler to automatically apply the policy to all 100 IAM users at once.
- [ ] **C.** Create a new S3 bucket access policy with unlimited access for each IAM user.
- [ ] **D.** Create a new IAM role and add each user to the IAM role.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Create a new IAM group and then add the users that require access to the S3 bucket. Afterwards, apply the policy to IAM group.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The most effective way to secure a cloud environment is to use an **IAM group** as a central management layer that bridges the gap between individual users and **S3 storage buckets** . By grouping users together, you create a unified identity that inherits permissions from a single policy, ensuring that everyone assigned to that project has the exact same level of access to the bucket’s contents. This is the correct approach because it eliminates the risk of human error associated with managing individual permissions and allows you to update or revoke access for an entire team instantly by modifying one central document. Rather than chasing down scattered settings across multiple accounts, this method provides a streamlined, audit-ready structure that enforces consistent security standards across your storage resources.

![Relationship between Entities](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Relationship_Between_Entities_Example.diagram.png)

Hence, the correct answer is: **Create a new IAM group and then add the users that require access to the S3 bucket. Afterward, apply the policy to the IAM group.** This will enable you to easily add, remove, and manage the users instead of manually adding a policy to each and every 100 IAM users.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create a scheduled rule with Amazon EventBridge Scheduler to automatically apply the policy to all 100 IAM users at once** is incorrect because you need a new IAM Group for this scenario, and not just assign a policy to each user via a shell script. This method can save you time, but afterward, it will be difficult to manage all 100 users that are not contained in an IAM Group.

- The option that says: **Create a new S3 bucket access policy with unlimited access for each IAM user** is incorrect because you simply need a new IAM Group, and the method is also time-consuming.

- The option that says: **Create a new IAM role and add each user to the IAM role** is incorrect because you need to use an IAM Group and not an IAM role.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups.html](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/walkthrough1.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/walkthrough1.html)

**Check out this AWS IAM Cheat Sheet:**
- [https://tutorialsdojo.com/aws-identity-and-access-management-iam/](https://tutorialsdojo.com/aws-identity-and-access-management-iam/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate/)

---

## Câu 13 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
An investment bank is working with an IT team to handle the launch of the new digital wallet system. The applications will run on multiple EBS-backed EC2 instances which will store the logs, transactions, and billing statements of the user in an S3 bucket. Due to tight security and compliance requirements, the IT team is exploring options on how to safely store sensitive data on the EBS volumes and S3.

Which of the below options should be carried out when storing sensitive data on AWS? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** Enable Amazon S3 Server-Side or use Client-Side Encryption
- [ ] **B.** Migrate the EC2 instances from the public to private subnet.
- [x] **C.** Enable EBS Encryption
- [ ] **D.** Create an EBS Snapshot
- [ ] **E.** Use AWS Shield and WAF

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, C**
> - **A.** Enable Amazon S3 Server-Side or use Client-Side Encryption
> - **C.** Enable EBS Encryption

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Enabling EBS Encryption** and **enabling Amazon S3 Server-Side or use Client-Side Encryption** are correct. Amazon EBS encryption offers a simple encryption solution for your EBS volumes without the need to build, maintain, and secure your own key management infrastructure.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/bucket_policies_defense_s3.43e6c93a095f2f55b33b30276f4782ab9ec79f47.png)

In Amazon S3, data protection refers to protecting data while in-transit (as it travels to and from Amazon S3) and at rest (while it is stored on disks in Amazon S3 data centers). You can protect data in transit by using SSL or by using client-side encryption. You have the following options to protect data at rest in Amazon S3.

- **Use Server-Side Encryption** – You request Amazon S3 to encrypt your object before saving it on disks in its data centers and decrypt it when you download the objects.

- **Use Client-Side Encryption** – You can encrypt data client-side and upload the encrypted data to Amazon S3. In this case, you manage the encryption process, the encryption keys, and related tools.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Creating an EBS Snapshot** is incorrect because this is a backup solution of EBS. It does not provide security of data inside EBS volumes when executed.

- **Migrating the EC2 instances from the public to private subnet** is incorrect because the data you want to secure are those in EBS volumes and S3 buckets. Moving your EC2 instance to a private subnet involves a different matter of security practice, which does not achieve what you want in this scenario.

- **Using AWS Shield and WAF** is incorrect because these protect you from common security threats for your web applications. However, what you are trying to achieve is securing and encrypting your data inside EBS and S3.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
- [http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html)

**Check out this Amazon EBS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)

---

## Câu 14 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company deployed a high-performance computing (HPC) cluster that spans multiple Amazon EC2 instances across multiple Availability Zones and processes various wind simulation models. Currently, the Solutions Architect is experiencing application slowdowns, and upon further investigation, it was discovered that this was due to latency issues. Even when using AWS ParallelCluster, a placement group is needed for optimal inter‑node latency.

Which is the MOST suitable solution that the Solutions Architect should implement to provide low-latency network performance necessary for tightly-coupled node-to-node communication of the HPC cluster?

### Các lựa chọn (Choices)
- [ ] **A.** Set up a spread placement group across multiple Availability Zones in multiple AWS Regions.
- [ ] **B.** Use EC2 Dedicated Instances with elastic inference accelerator
- [x] **C.** Set up a cluster placement group within a single Availability Zone in the same AWS Region.
- [ ] **D.** Set up AWS Direct Connect connections across multiple Availability Zones for increased bandwidth throughput and more consistent network experience.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Set up a cluster placement group within a single Availability Zone in the same AWS Region.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
When you launch a new EC2 instance, the EC2 service attempts to place the instance in such a way that all of your instances are spread out across underlying hardware to minimize correlated failures. You can use *placement groups* to influence the placement of a group of *interdependent* instances to meet the needs of your workload. Depending on the type of workload, you can create a placement group using one of the following placement strategies:

 ***Cluster*** – packs instances close together inside an Availability Zone. This strategy enables workloads to achieve the low-latency network performance necessary for tightly-coupled node-to-node communication that is typical of HPC applications.

 ***Partition*** – spreads your instances across logical partitions such that groups of instances in one partition do not share the underlying hardware with groups of instances in different partitions. This strategy is typically used by large, distributed, and replicated workloads, such as Hadoop, Cassandra, and Kafka.

 ***Spread*** – strictly places a small group of instances across distinct underlying hardware to reduce correlated failures.

Cluster placement groups are recommended for applications that benefit from low network latency, high network throughput, or both. They are also recommended when the majority of the network traffic is between the instances in the group. To provide the lowest latency and the highest packet-per-second network performance for your placement group, choose an instance type that supports enhanced networking.

![Placement Group ](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/placement-group-cluster.png)

Partition placement groups can be used to deploy large, distributed, and replicated workloads, such as HDFS, HBase, and Cassandra, across distinct racks. When you launch instances into a partition placement group, Amazon EC2 tries to distribute the instances evenly across the number of partitions that you specify. You can also launch instances into a specific partition to have more control over where the instances are placed.

![Placement Group Partition](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/placement-group-partition.png)

Spread placement groups are recommended for applications that have a small number of critical instances that should be kept separate from each other. Launching instances in a spread placement group reduces the risk of simultaneous failures that might occur when instances share the same racks. Spread placement groups provide access to distinct racks and are, therefore, suitable for mixing instance types or launching instances over time. A spread placement group can span multiple Availability Zones in the same Region. You can have a maximum of seven running instances per Availability Zone per group.

![Placement Group Spread](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/placement-group-spread.png)

Hence, the correct answer is: **Set up a cluster placement group within a single Availability Zone in the same AWS Region.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up a spread placement group across multiple Availability Zones in multiple AWS Regions** is incorrect. Although using a placement group is valid for this particular scenario, you can only set up a placement group in a single AWS Region. A spread placement group can span multiple Availability Zones in the same Region.

- The option that says: **Set up AWS Direct Connect connections across multiple Availability Zones for increased bandwidth throughput and more consistent network experience** is incorrect because this is primarily used for hybrid architectures. It bypasses the public Internet and establishes a secure, dedicated connection from your on-premises data center into AWS, and is not used for having low latency within your AWS network.

- The option that says: **Use EC2 Dedicated Instances with elastic inference accelerator** is incorrect because these are EC2 instances that run in a VPC on hardware that is dedicated to a single customer and are physically isolated at the host hardware level from instances that belong to other AWS accounts. It is not used for reducing latency. In addition, elastic inference accelerators only enable customers to attach low-cost GPU-powered acceleration to Amazon EC2, Amazon SageMaker AI instances, and other resources.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
- [https://aws.amazon.com/hpc/](https://aws.amazon.com/hpc/)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 15 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company installed sensors to track the number of people who visit the park. The data is sent every day to an Amazon Kinesis stream with default settings for processing, in which a consumer is configured to process the data every other day. The employee noticed that the Amazon S3 bucket is not receiving all of the data that is being sent to the Kinesis stream. The employee checked the sensors to see if its properly sending the data to Kinesis and verified that the data is indeed sent every day.

What could be the reason for this?

### Các lựa chọn (Choices)
- [x] **A.** By default, the data records are only accessible for 24 hours from the time they are added to a Kinesis stream.
- [ ] **B.** Your AWS account was hacked and someone has deleted some data in your Kinesis stream.
- [ ] **C.** There is a problem in the sensors. They probably had some intermittent connection hence, the data is not sent to the stream.
- [ ] **D.** An AWS Batch jobs consumer processed the data, but it missed records because batch jobs are not designed for streaming sources.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** By default, the data records are only accessible for 24 hours from the time they are added to a Kinesis stream.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Kinesis Data Streams** supports changes to the data record retention period of your stream. A Kinesis data stream is an ordered sequence of data records meant to be written to and read from in real-time. Data records are therefore stored in shards in your stream temporarily.

![Kinesis Data Streams](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/near_real_time_streaming_1.gif)

The time period from when a record is added to when it is no longer accessible is called the *retention period*. A Kinesis data stream stores records from **24 hours by default** to a maximum of 8760 hours (365 days).

This is the reason why there is missing data in your S3 bucket. To fix this, you can either configure your sensors to send the data every day instead of every other day or, alternatively, you can increase the retention period of your Kinesis data stream.

Hence, the correct answer is: **By default, the data records are only accessible for 24 hours from the time they are added to a Kinesis stream.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **There is a problem in the sensors. They probably had some intermittent connection hence, the data is not sent to the stream** is incorrect. You already verified that the sensors are working as they should be; hence, this is not the root cause of the issue.

- The option that says: **An AWS Batch jobs consumer processed the data, but it missed records because batch jobs are not designed for streaming sources** is incorrect because AWS Batch jobs is a managed service only for running batch computing workloads, not for consuming Amazon Kinesis streams. The missing-data issue described in the scenario is caused by the Kinesis stream’s default 24‑hour retention period, which results in records expiring before a consumer that runs every other day can process them.

- The option that says: **Your AWS account was hacked and someone has deleted some data in your Kinesis stream** is incorrect. Although this could be a possibility, you should verify first if there are other, more probable reasons for the missing data in your S3 bucket. Be sure to simply follow and apply security best practices as well to prevent being hacked by someone.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/streams/latest/dev/kinesis-extended-retention.html](http://docs.aws.amazon.com/streams/latest/dev/kinesis-extended-retention.html)
- [https://docs.aws.amazon.com/kinesis/latest/APIReference/API_PutRecord.html](https://docs.aws.amazon.com/kinesis/latest/APIReference/API_PutRecord.html)

**Check out this Amazon Kinesis Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-kinesis/](https://tutorialsdojo.com/amazon-kinesis/)

---

## Câu 16 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A Solutions Architect needs to deploy a mobile application that collects votes for a singing competition. Millions of users from around the world will submit votes using mobile phones. These votes must be collected and stored in a highly scalable and highly available database, which will be queried for real-time ranking. The database is expected to undergo frequent schema changes throughout the voting period.

Which of the following combinations of services should the architect use to meet this requirement, with read capacity units (RCU) that scale for live rankings?

### Các lựa chọn (Choices)
- [ ] **A.** Amazon Aurora and Amazon Cognito
- [ ] **B.** Amazon DocumentDB (with MongoDB compatibility) and Amazon AppFlow
- [x] **C.** Amazon DynamoDB and AWS AppSync
- [ ] **D.** Amazon Relational Database Service (Amazon RDS) and Amazon MQ

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Amazon DynamoDB and AWS AppSync

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon DynamoDB is a fully managed, serverless, key-value NoSQL database designed to run high-performance applications at any scale. DynamoDB offers built-in security, continuous backups, automated multi-Region replication, in-memory caching, and data import and export tools. DynamoDB tables are schemaless—other than the primary key, you do not need to define any extra attributes or data types when you create a table, which is why it’s suitable for data with a frequently changing schema.

![AWS AppSync](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Untitled1-1024x467.png)

Hence, the correct answer is: **Amazon DynamoDB and AWS AppSync. **

DynamoDB is a durable, scalable, and highly available data store that can be used for real-time tabulation. You can also use AppSync with DynamoDB to make it easy for you to build collaborative apps that keep shared data updated in real-time. You just specify the data for your app with simple code statements, and AWS AppSync manages everything needed to keep the app data updated in real-time. This will allow your app to access data in Amazon DynamoDB, trigger AWS Lambda functions, or run Amazon OpenSearch Service queries and combine data from these services to provide the exact data you need for your app.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon DocumentDB (with MongoDB compatibility) and Amazon AppFlow** are incorrect. While Amazon DocumentDB (with MongoDB compatibility) is a viable database option, Amazon AppFlow cannot interface with it to query updates. Amazon AppFlow is simply an integration service for transferring data securely between Software-as-a-Service (SaaS) applications like Salesforce, SAP, Zendesk, Slack, ServiceNow, and AWS services.

- **Amazon Relational Database Service (Amazon RDS) and Amazon MQ** are incorrect. Updating schema changes in a relational database is a complicated process. Using a NoSQL database such as DynamoDB is more suitable for the scenario. Additionally, Amazon MQ is just a message broker for Apache MQ and RabbitMQ — it’s not needed in the solution.

- **Amazon Aurora and Amazon Cognito** are incorrect. Like the other incorrect option, relational database solutions, such as Amazon Aurora and RDS, are impractical for data with a frequently changing schema. Additionally, Amazon Cognito is just a service for user authentication and authorization, neither of which is mentioned in the scenario.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/dynamodb/faqs/](https://aws.amazon.com/dynamodb/faqs/)
- [https://aws.amazon.com/appsync/](https://aws.amazon.com/appsync/)

**Amazon DynamoDB Overview:**

**Check out this Amazon DynamoDB Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-dynamodb/](https://tutorialsdojo.com/amazon-dynamodb/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate/)

---

## Câu 17 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A large financial firm in the country has an AWS environment that contains several Reserved EC2 instances hosting a web application that has been decommissioned last week. To save costs, you need to stop incurring charges for the Reserved instances as soon as possible.

What cost-effective steps will you take in this circumstance? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Contact AWS to cancel your AWS subscription.
- [ ] **B.** Stop the Reserved instances as soon as possible.
- [ ] **C.** Go to the Amazon.com online shopping website and sell the Reserved instances.
- [x] **D.** Go to the AWS Reserved Instance Marketplace and sell the Reserved instances.
- [x] **E.** Terminate the Reserved instances as soon as possible to avoid getting billed at the on-demand price when it expires.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D, E**
> - **D.** Go to the AWS Reserved Instance Marketplace and sell the Reserved instances.
> - **E.** Terminate the Reserved instances as soon as possible to avoid getting billed at the on-demand price when it expires.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The **Reserved Instance Marketplace** is a platform that supports the sale of third-party and AWS customers’ unused Standard Reserved Instances, which vary in terms of lengths and pricing options. For example, you may want to sell Reserved Instances after moving instances to a new AWS region, changing to a new instance type, ending projects before the term expiration, when your business needs change, or if you have unneeded capacity.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/console_sell_ri_start_2.png)

Hence, the correct answers are:

 **– Go to the AWS Reserved Instance Marketplace and sell the Reserved instances.**

 **– Terminate the Reserved instances as soon as possible to avoid getting billed at the on-demand price when it expires.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Stopping the Reserved instances as soon as possible** is incorrect because a stopped instance can still be restarted. Take note that when a Reserved Instance expires, any instances that were covered by the Reserved Instance are billed at the on-demand price which costs significantly higher. Since the application is already decommissioned, there is no point of keeping the unused instances. It is also possible that there are associated Elastic IP addresses, which will incur charges if they are associated with stopped instances

- **Contacting AWS to cancel your AWS subscription** is incorrect as you don’t need to close down your AWS account.

- **Going to the Amazon.com online shopping website and selling the Reserved instances** is incorrect as you have to use AWS Reserved Instance Marketplace to sell your instances.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 18 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company intends to give each of its developers a personal AWS account through AWS Organizations. To enforce regulatory policies, preconfigured AWS Config rules will be set in the new accounts. A solutions architect must see to it that developers are unable to remove or modify any rules in AWS Config.

Which solution meets the objective with the least operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Use an IAM Role in the new accounts with an attached IAM trust relationship to disable the access of the root user to AWS Config.
- [x] **B.** Add the developers' AWS account to an organization unit (OU). Attach a service control policy (SCP) to the OU that restricts access to AWS Config.
- [ ] **C.** Set up an AWS Control Tower in the root account to detect if there were any changes to the new account’s AWS Config rules. Attach an IAM trust relationship to the IAM User of each developer which prevents any changes in AWS Config.
- [ ] **D.** Configure an AWS Config rule in the root account to detect if changes to the new account’s Config rules are made.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Add the developers' AWS account to an organization unit (OU). Attach a service control policy (SCP) to the OU that restricts access to AWS Config.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Service control policies (SCPs) are a type of organization policy that you can use to manage permissions in your organization. SCPs offer central control over the maximum available permissions for all accounts in your organization. SCPs help you to ensure your accounts stay within your organization’s access control guidelines.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-organizations-scp-demo.jpg)

SCPs alone is not sufficient to grant permissions to the accounts in your organization. No permissions are granted by an SCP. An SCP defines a guardrail or sets limits on the actions that the account’s administrator can delegate to the IAM users and roles in the affected accounts.

In the scenario, even if a developer has admin privileges, he/she will be unable to modify Config rules if an SCP does not permit it. You can also use SCP to block root user access. This prevents the developers from circumventing the restrictions on AWS Config access.

Therefore, the correct answer is: **Add the developers’ AWS account to an organization unit (OU). Attach a service control policy (SCP) to the OU that restricts access to AWS Config.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use an IAM Role in the new accounts with an attached IAM trust relationship to disable the access of the root user to AWS Config** is incorrect. Keep in mind that the effects of IAM Policies do not apply to account root users. The “trust relationship” policy simply defines which principals can assume the IAM Role and under which conditions. Thus, this type of policy won’t meet the requirement in the scenario.

- The option that says: **Configure an AWS Config rule in the root account to detect if changes to the new account’s Config rules are made** is incorrect. This solution just monitors changes on AWS Config rules; it does not restrict permissions, which is what’s needed in the scenario.

- The option that says: **Set up an AWS Control Tower in the root account to detect if there were any changes to the new account’s AWS Config rules. Attach an IAM trust relationship to the IAM User of each developer which prevents any changes in AWS Config** is incorrect. The AWS Control Tower service is commonly used to set up and govern a secure multi-account AWS environment. This service is not used to restrict access from invoking an action to a specific resource, such as AWS Config, in your AWS account. The proper way of completing this requirement is to use a service Control Policy (SCP) and not a mere IAM Role with a trust relationship policy.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/controltower/latest/userguide/organizations.html](https://docs.aws.amazon.com/controltower/latest/userguide/organizations.html)
- [https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)

**Check out this AWS Organizations cheat sheet:**
- [https://tutorialsdojo.com/aws-organizations/](https://tutorialsdojo.com/aws-organizations/)

---

## Câu 19 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A call center wants to use Artificial Intelligence(AI) to extract insights from audio recordings to assess the quality of its customer service. The calls are available in both English and Hindi. A sentiment analysis report in English must be generated for each recording to assess whether or not the customer had a positive experience. Once the solution is completed, new languages will eventually be supported, such as Arabic, Mandarin, and Spanish.

How can the solutions architect build the solution without maintaining any machine learning model?

### Các lựa chọn (Choices)
- [ ] **A.** Set up Amazon Comprehend to convert audio recordings into text. Use Amazon Kendra to translate Hindi texts into English and utilize the Amazon Detective service to automatically detect negative user behaviors for sentiment analysis.
- [ ] **B.** Transcribe audio recordings into text using Amazon Polly’s `StartSpeechSynthesisTask` operation. Set up Amazon Rekognition to recognize and automatically translate Hindi texts into English. Use the combination of Amazon Fraud Detector and Amazon SageMaker BlazingText algorithm for sentiment analysis.
- [x] **C.** Convert audio recordings into text using Amazon Transcribe. Set up Amazon Translate to translate Hindi texts into English and use Amazon Comprehend for sentiment analysis.
- [ ] **D.** Utilize the Amazon Lex service to convert audio recordings into text. Call the Amazon Translate API to translate Hindi texts into English and use Amazon SageMaker Clarify for sentiment prediction and analysis.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Convert audio recordings into text using Amazon Transcribe. Set up Amazon Translate to translate Hindi texts into English and use Amazon Comprehend for sentiment analysis.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Transcribe** is an AWS service that makes it easy for customers to convert speech-to-text. Using Automatic Speech Recognition (ASR) technology, customers can choose to use Amazon Transcribe for a variety of business applications, including transcription of voice-based customer service calls, generation of subtitles on audio/video content, and conduct (text-based) content analysis on audio/video content.

 **Amazon Translate** is a Neural Machine Translation (MT) service for translating text between supported languages.

 **Amazon Comprehend** is a natural language processing (NLP) service that uses machine learning to find meaning and insights in text.

![Amazon Transcribe, Amazon Translate, and Amazon Comprehend](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/transcribe-translate-comprehend-workflow.jpg)

You can use Amazon Comprehend to determine the sentiment of a document. For example, you can use sentiment analysis to determine the sentiments of comments on a blog posting or a transcribed call to determine if your users loved or hated your content. You can determine sentiment for documents in any of the primary languages supported by Amazon Comprehend. All documents in one job must be in the same language.

In this scenario, you can use these three services to build the ML-pipeline needed to satisfy the requirements. First, you’d have to create a transcription job using Amazon Transcribe to transform the recordings into text. Then, translate non-English calls to English using Amazon Translate. Finally, use Amazon Comprehend for sentiment analysis.

There’s no need to deploy or train your own model as all of these services are fully managed and are readily available through APIs.

Hence, the correct answer is: **Convert audio recordings into text using Amazon Transcribe. Set up Amazon Translate to translate Hindi texts into English and use Amazon Comprehend for sentiment analysis.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Transcribe audio recordings into text using Amazon Polly’s `StartSpeechSynthesisTask` operation. Set up Amazon Rekognition to recognize and automatically translate Hindi texts into English. Use the combination of Amazon Fraud Detector and Amazon SageMaker BlazingText algorithm for sentiment analysis** is incorrect. Although the use of the Amazon SageMaker BlazingText algorithm is technically valid, it still fails to meet the condition of not maintaining any ML-model. Using Amazon SageMaker would require you to train and deploy the model yourself. Added to that, the use of Amazon Fraud Detector is also unnecessary. Amazon Fraud Detector is commonly used to identify potentially fraudulent activities and not for running sentiment analysis. Do take note that Amazon Polly is not capable of transcribing audio recordings, and Amazon Rekognition is primarily used for image recognition service, not for translating foreign words into English.

- The option that says: **Utilize the Amazon Lex service to convert audio recordings into text. Call the Amazon Translate API to translate Hindi texts into English and use Amazon SageMaker Clarify for sentiment prediction and analysis** is incorrect. Amazon Lex is a fully managed artificial intelligence (AI) service with advanced natural language models that can help you design, build, test, and deploy conversational interfaces or chatbots. This service is not capable of transcribing any audio recordings into a text format. Amazon Textract only extracts text from documents and does not convert audio to text. Also, you cannot use the Amazon SageMaker Clarify service for running sentiment prediction and analysis. Amazon SageMaker Clarify is meant for forecasting business outcomes using historical and related data.

- The option that says: **Set up Amazon Comprehend to convert audio recordings into text. Use Amazon Kendra to translate Hindi texts into English and utilize the Amazon Detective service to automatically detect negative user behaviors for sentiment analysis** is incorrect. Amazon Comprehend is a natural-language processing (NLP) service that uses machine learning to uncover valuable insights and connections in text. This service is not capable of transcribing or converting audio recordings into text. Amazon Kendra is a highly accurate and easy-to-use enterprise search service for all unstructured data that you store in AWS, while Amazon Detective is a security service that analyzes and visualizes security data to rapidly get to the root cause of your potential security issues. Amazon Kendra is not capable of translating any foreign text into English, and Amazon Detective doesn’t have the functionality to automatically detect negative user behaviors for sentiment analysis.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/transcribe/faqs/](https://aws.amazon.com/transcribe/faqs/)
- [https://aws.amazon.com/translate/faqs/](https://aws.amazon.com/translate/faqs/)
- [https://aws.amazon.com/comprehend/faqs/](https://aws.amazon.com/comprehend/faqs/)

**Check out these Amazon Transcribe, Amazon Translate, and Amazon Comprehend Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-transcribe/](https://tutorialsdojo.com/amazon-transcribe/)
- [https://tutorialsdojo.com/amazon-translate/](https://tutorialsdojo.com/amazon-translate/)

---

## Câu 20 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A travel company has a suite of web applications hosted in an Auto Scaling group of On-Demand EC2 instances behind an Application Load Balancer that handles traffic from various web domains such as `i-love-manila.com`,`i-love-boracay.com` `i-love-cebu.com` and many others. To improve security and lessen the overall cost, you are instructed to secure the system by allowing multiple domains to serve SSL traffic without the need to reauthenticate and reprovision your certificate everytime you add a new domain. This migration from HTTP to HTTPS will help improve their SEO and Google search ranking.

Which of the following is the most cost-effective solution to meet the above requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Use a wildcard certificate to handle multiple sub-domains and different domains.
- [ ] **B.** Add a Subject Alternative Name (SAN) for each additional domain to your certificate.
- [x] **C.** Upload all SSL certificates of the domains in the ALB using the console and bind multiple certificates to the same secure listener on your load balancer. ALB will automatically choose the optimal TLS certificate for each client using Server Name Indication (SNI).
- [ ] **D.** Create a new CloudFront web distribution and configure it to serve HTTPS requests using dedicated IP addresses in order to associate your alternate domain names with a dedicated IP address in each CloudFront edge location.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Upload all SSL certificates of the domains in the ALB using the console and bind multiple certificates to the same secure listener on your load balancer. ALB will automatically choose the optimal TLS certificate for each client using Server Name Indication (SNI).

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
SNI Custom SSL relies on the SNI extension of the Transport Layer Security protocol, which allows multiple domains to serve SSL traffic over the same IP address by including the hostname which the viewers are trying to connect to.

You can host multiple TLS-secured applications, each with its own TLS certificate, behind a single load balancer. In order to use SNI, all you need to do is bind multiple certificates to the same secure listener on your load balancer. ALB will automatically choose the optimal TLS certificate for each client. These features are provided at no additional charge.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2017-10-05-00.51.24.gif)

To meet the requirements in the scenario, you can upload all SSL certificates of the domains in the ALB using the console and bind multiple certificates to the same secure listener on your load balancer. ALB will automatically choose the optimal TLS certificate for each client using Server Name Indication (SNI).

Hence, the correct answer is the option that says: **Upload all SSL certificates of the domains in the ALB using the console and bind multiple certificates to the same secure listener on your load balancer. ALB will automatically choose the optimal TLS certificate for each client using Server Name Indication (SNI).**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Using a wildcard certificate to handle multiple sub-domains and different domains** is incorrect because a wildcard certificate can only handle multiple sub-domains but not different domains.

- **Adding a Subject Alternative Name (SAN) for each additional domain to your certificate** is incorrect because although using SAN is correct, you will still have to reauthenticate and reprovision your certificate every time you add a new domain. One of the requirements in the scenario is that you should not have to reauthenticate and reprovision your certificate hence, this solution is incorrect.

- The option that says: **Create a new CloudFront web distribution and configure it to serve HTTPS requests using dedicated IP addresses in order to associate your alternate domain names with a dedicated IP address in each CloudFront edge location** is incorrect because although it is valid to use dedicated IP addresses to meet this requirement, this solution is not cost-effective. Remember that if you configure CloudFront to serve HTTPS requests using dedicated IP addresses, you incur an additional monthly charge. The charge begins when you associate your SSL/TLS certificate with your CloudFront distribution. You can just simply upload the certificates to the ALB and use SNI to handle multiple domains in a cost-effective manner.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/blogs/aws/new-application-load-balancer-sni/](https://aws.amazon.com/blogs/aws/new-application-load-balancer-sni/)
- [https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-https-dedicated-ip-or-sni.html#cnames-https-dedicated-ip](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-https-dedicated-ip-or-sni.html#cnames-https-dedicated-ip)
- [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html)

**Check out this Amazon CloudFront Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-cloudfront/](https://tutorialsdojo.com/amazon-cloudfront/)

**SNI Custom SSL vs Dedicated IP Custom SSL:**
- [https://tutorialsdojo.com/sni-custom-ssl-vs-dedicated-ip-custom-ssl/](https://tutorialsdojo.com/sni-custom-ssl-vs-dedicated-ip-custom-ssl/)

**Comparison of AWS Services Cheat Sheets:**
- [https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

---

## Câu 21 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A new online banking platform has been re-designed to have a microservices architecture in which complex applications are decomposed into smaller, independent services. The new platform uses Kubernetes, and the application containers are optimally configured for running small, decoupled services.

The new solution should remove the need to provision and manage servers, allow resources to be specified and paid for per application, and improve security through application isolation by design.

Which of the following is the MOST suitable solution to implement to launch this new platform on AWS?

### Các lựa chọn (Choices)
- [ ] **A.** Deploy an Amazon EKS Cluster on AWS Outposts with Kubernetes Cluster Autoscaler and sync any orphaned pods with Amazon AppFlow.
- [x] **B.** Use AWS Fargate on Amazon EKS with Kubernetes Cluster Autoscaler to run the containerized banking platform.
- [ ] **C.** Host the application in Amazon EMR Serverless and Amazon EBS storage with the fast snapshot restore feature enabled.
- [ ] **D.** Use Amazon ECS to run the Kubernetes cluster on AWS Fargate.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use AWS Fargate on Amazon EKS with Kubernetes Cluster Autoscaler to run the containerized banking platform.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Fargate** is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). Fargate makes it easy for you to focus on building your applications. Fargate removes the need to provision and manage servers, lets you specify and pay for resources per application, and improves security through application isolation by design.

![AWS Fargate](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Product-Page-Diagram_Fargate@2x.a20fb2b15c2aebeda3a44dbbb0b10b82fb89aa6a.png)

Fargate allocates the right amount of compute, eliminating the need to choose instances and scale cluster capacity. You only pay for the resources required to run your containers, so there is no over-provisioning and paying for additional servers. Fargate runs each task or pod in its own kernel providing the tasks and pods their own isolated compute environment. This enables your application to have workload isolation and improved security by design. This is why customers such as Vanguard, Accenture, Foursquare, and Ancestry have chosen to run their mission-critical applications on Fargate.

The Kubernetes Cluster Autoscaler is a well-known solution for cluster autoscaling, maintained by the SIG Autoscaling team. Its primary function is to ensure that your cluster has enough nodes to successfully schedule your pods without wasting resources. The Cluster Autoscaler monitors for pods that are unable to schedule and identifies underutilized nodes. It then simulates the addition or removal of nodes before implementing any changes to your cluster.

Hence, the correct answer is: **Use AWS Fargate on Amazon EKS with Kubernetes Cluster Autoscaler to run the containerized banking platform.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use Amazon ECS to run the Kubernetes cluster on AWS Fargate** is incorrect because Amazon ECS is primarily used for running Docker containers instead of Kubernetes. A better solution is to use Amazon EKS instead.

- The option that says: **Host the application in Amazon EMR Serverless and Amazon EBS storage with the fast snapshot restore feature enabled** is incorrect. Although the use of Amazon EMR Serverless will typically remove the manual overhead of maintaining virtual servers, this solution entails a lot of additional configuration required to run a Kubernetes cluster as opposed to using Amazon EKS + AWS Fargate. In addition, the use of the fast snapshot restore feature is not warranted and totally unnecessary since there’s no requirement for data replication and high RTO/RPO.

- The option that says: **Deploy an Amazon EKS Cluster on AWS Outposts with Kubernetes Cluster Autoscaler and sync any orphaned pods with Amazon AppFlow** is incorrect because launching an Amazon EKS cluster on AWS Outposts means that you have to maintain an AWS-provided physical rack server on your on-premises data center. This setup is not serverless and doesn’t meet the given requirements. Moreover, the Amazon AppFlow service is meant for integrating 3rd party SaaS solutions to your AWS services and not orphaned Kubernetes pods.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/fargate/](https://aws.amazon.com/fargate/)
- [https://docs.aws.amazon.com/eks/latest/best-practices/cas.html](https://docs.aws.amazon.com/eks/latest/best-practices/cas.html)

**Check out this Amazon EKS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/](https://tutorialsdojo.com/amazon-elastic-kubernetes-service-eks/)

---

## Câu 22 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company has established a dedicated network connection from its on-premises data center to AWS Cloud using AWS Direct Connect (DX). The core network services, such as the Domain Name System (DNS) service and Active Directory services, are all hosted on-premises. The company has new AWS accounts that will also require consistent and dedicated access to these network services.

Which of the following can satisfy this requirement with the LEAST amount of operational overhead and in a cost-effective manner?

### Các lựa chọn (Choices)
- [ ] **A.** Create a new AWS VPN CloudHub. Set up a Virtual Private Network (VPN) connection for additional AWS accounts.
- [ ] **B.** Set up another Direct Connect connection for each and every new AWS account that will be added.
- [ ] **C.** Set up a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Configure a VPC peering connection between AWS accounts and associate it with Direct Connect gateway.
- [x] **D.** Create a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Set up a Transit Gateway between AWS accounts and associate it with the Direct Connect gateway.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Set up a Transit Gateway between AWS accounts and associate it with the Direct Connect gateway.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Transit Gateway** provides a hub and spoke design for connecting VPCs and on-premises networks. You can attach all your hybrid connectivity (VPN and Direct Connect connections) to a single Transit Gateway consolidating and controlling your organization’s entire AWS routing configuration in one place. It also controls how traffic is routed among all the connected spoke networks using route tables. This hub and spoke model simplifies management and reduces operational costs because VPCs only connect to the Transit Gateway to gain access to the connected networks.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/image11.png)

By attaching a transit gateway to a Direct Connect gateway using a transit virtual interface, you can manage a single connection for multiple VPCs or VPNs that are in the same AWS Region. You can also advertise prefixes from on-premises to AWS and from AWS to on-premises.

The AWS Transit Gateway and AWS Direct Connect solution simplify the management of connections between an Amazon VPC and your networks over a private connection. It can also minimize network costs, improve bandwidth throughput, and provide a more reliable network experience than Internet-based connections.

Hence, the correct answer is: **Create a new Direct Connect gateway and integrate it with the existing Direct Connect connection.** **Set up a Transit Gateway between AWS accounts and associate it with the Direct Connect gateway.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up another Direct Connect connection for each and every new AWS account that will be added** is incorrect because this solution entails a significant amount of additional cost. Setting up a single DX connection requires a substantial budget and takes a lot of time to establish. It also has high management overhead since you will need to manage all of the Direct Connect connections for all AWS accounts.

- The option that says: **Create a new AWS VPN CloudHub. Set up a Virtual Private Network (VPN) connection for additional AWS accounts** is incorrect because a VPN connection is not capable of providing consistent and dedicated access to the on-premises network services. Take note that a VPN connection traverses the public Internet and doesn’t use a dedicated connection.

- The option that says: **Set up a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Configure a VPC peering connection between AWS accounts and associate it with Direct Connect gateway** is incorrect because VPC peering is not supported in a Direct Connect connection. VPC peering does not support transitive peering relationships.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-transit-gateways.html](https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-transit-gateways.html)
- [https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect-aws-transit-gateway.html](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect-aws-transit-gateway.html)
- [https://aws.amazon.com/blogs/networking-and-content-delivery/integrating-sub-1-gbps-hosted-connections-with-aws-transit-gateway/](https://aws.amazon.com/blogs/networking-and-content-delivery/integrating-sub-1-gbps-hosted-connections-with-aws-transit-gateway/)

**Check out this AWS Transit Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-transit-gateway/](https://tutorialsdojo.com/aws-transit-gateway/)

---

## Câu 23 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company needs to use Amazon Aurora as the Amazon RDS database engine for its web application. The Solutions Architect has been instructed to implement a 90-day RDS backup retention policy.

Which of the following options can satisfy the given requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Create a daily scheduled event using Amazon EventBridge and AWS Lambda to directly download the RDS automated snapshot to an Amazon S3 bucket. Archive snapshots older than 90 days to Glacier.
- [ ] **B.** Configure an automated backup and set the backup retention period to 90 days.
- [x] **C.** Create an AWS Backup plan to take daily snapshots with a retention period of 90 days.
- [ ] **D.** Configure RDS to export the automated snapshot automatically to Amazon S3 and create a lifecycle policy to delete the object after 90 days.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Create an AWS Backup plan to take daily snapshots with a retention period of 90 days.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Backup** is a centralized backup service that makes it easy and cost-effective for you to backup your application data across AWS services in the AWS Cloud, helping you meet your business and regulatory backup compliance requirements. AWS Backup makes protecting your AWS storage volumes, databases, and file systems simple by providing a central place where you can configure and audit the AWS resources you want to backup, automate backup scheduling, set retention policies, and monitor all recent backup and restore activity.

![AWS Backup plan](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS Backup plan-11MAR2026.png)

In this scenario, you can use AWS Backup to create a backup plan with a retention period of 90 days. A backup plan is a policy expression that defines when and how you want to back up your AWS resources. You assign resources to backup plans, and AWS Backup then automatically backs up and retains backups for those resources according to the backup plan.

Hence, the correct answer is: ** Create an AWS Backup plan to take daily snapshots with a retention period of 90 days.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Configure an automated backup and set the backup retention period to 90 days** is incorrect because the maximum backup retention period for automated backup is only 35 days.

- The option that says: **Configure RDS to export the automated snapshot automatically to Amazon S3 and create a lifecycle policy to delete the object after 90 days** is incorrect because you can’t export an automated snapshot automatically to Amazon S3. You must export the snapshot manually.

- The option that says: **Create a daily scheduled event using Amazon EventBridge and AWS Lambda to directly download the RDS automated snapshot to an Amazon S3 bucket. Archive snapshots older than 90 days to Glacier** is incorrect because you cannot directly download or export an automated snapshot in RDS to Amazon S3. You have to copy the automated snapshot first for it to become a manual snapshot, which you can move to an Amazon S3 bucket. A better solution for this scenario is to simply use AWS Backup.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/aws-backup/latest/devguide/create-a-scheduled-backup.html](https://docs.aws.amazon.com/aws-backup/latest/devguide/create-a-scheduled-backup.html)
- [https://aws.amazon.com/backup/faqs/](https://aws.amazon.com/backup/faqs/)

**Check out these AWS Cheat Sheets:**
- [https://tutorialsdojo.com/links-to-all-aws-cheat-sheets/](https://tutorialsdojo.com/links-to-all-aws-cheat-sheets/)

---

## Câu 24 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
In Amazon EC2, you can manage your instances from the moment you launch them up to their termination. You can flexibly control your computing costs by changing the EC2 instance state.

Which of the following statements is true regarding EC2 billing? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** You will be billed when your Spot instance is preparing to stop with a `stopping` state.
- [ ] **B.** You will be billed when your On-Demand instance is in `pending` state.
- [ ] **C.** You will not be billed for any instance usage while an instance is not in the `running` state.
- [x] **D.** You will be billed when your On-Demand instance is preparing to hibernate with a `stopping` state.
- [x] **E.** You will be billed when your Reserved instance is in `terminated` state.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D, E**
> - **D.** You will be billed when your On-Demand instance is preparing to hibernate with a `stopping` state.
> - **E.** You will be billed when your Reserved instance is in `terminated` state.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
By working with Amazon EC2 to manage your instances from the moment you launch them through their termination, you ensure that your customers have the best possible experience with the applications or sites that you host on your instances. The following illustration represents the transitions between instance states. Notice that you can’t stop and start an instance store-backed instance:

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/instance_lifecycle.png)

Below are the valid EC2 lifecycle instance states:

 **`pending`** – The instance is preparing to enter the running state. An instance enters the pending state when it launches for the first time, or when it is restarted after being in the stopped state.

 **`running`** – The instance is running and ready for use.

 **`stopping`** – The instance is preparing to be stopped. Take note that you will not billed if it is preparing to stop however, you will still be billed if it is just preparing to hibernate.

 **`stopped`** – The instance is shut down and cannot be used. The instance can be restarted at any time.

 **`shutting-down`** – The instance is preparing to be terminated.

 **`terminated`** – The instance has been permanently deleted and cannot be restarted. Take note that Reserved Instances that applied to terminated instances are ***still billed*** until the end of their term according to their payment option.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **You will be billed when your On-Demand instance is preparing to hibernate with a `stopping` state** is correct because when the instance state is **`stopping`** , you will not billed if it is preparing to stop however, you **will still be billed** if it is just preparing to hibernate.

- The option that says: **You will be billed when your Reserved instance is in `terminated` state** is correct because Reserved Instances that applied to terminated instances are still billed until the end of their term according to their payment option. I actually raised a pull-request to Amazon team about the billing conditions for Reserved Instances, which has been approved and reflected on your official AWS Documentation: [https://github.com/awsdocs/amazon-ec2-user-guide/pull/45](https://github.com/awsdocs/amazon-ec2-user-guide/pull/45)

- The option that says: **You will be billed when your On-Demand instance is in `pending` state** is incorrect because you will not be billed if your instance is in **`pending`** state.

- The option that says: **You will be billed when your Spot instance is preparing to stop with a `stopping` state** is incorrect because you will not be billed if your instance is preparing to stop with a **`stopping`** state.

- The option that says: **You will not be billed for any instance usage while an instance is not in the `running` state** is incorrect because the statement is not entirely true. You can still be billed if your instance is preparing to hibernate with a **`stopping `** state.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://github.com/awsdocs/amazon-ec2-user-guide/pull/45](https://github.com/awsdocs/amazon-ec2-user-guide/pull/45)
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 25 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company is generating confidential data that is saved on its on-premises data center. As a backup solution, the company wants to upload its data to an Amazon S3 bucket. In compliance with its internal security mandate, the encryption of the data must be done before sending it to S3. The company must spend time managing and rotating the encryption keys as well as controlling who can access those keys.

Which of the following methods can achieve this requirement? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Set up Server-Side Encryption with keys stored in a separate S3 bucket.
- [ ] **B.** Set up Client-Side Encryption with S3 managed encryption keys.
- [x] **C.** Set up Client-Side Encryption using a client-side master key.
- [x] **D.** Set up Client-Side Encryption with AWS KMS key.
- [ ] **E.** Set up Server-Side Encryption (SSE) with Amazon EC2 key pair.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C, D**
> - **C.** Set up Client-Side Encryption using a client-side master key.
> - **D.** Set up Client-Side Encryption with AWS KMS key.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Data protection refers to protecting data while in transit (as it travels to and from Amazon S3) and at rest (while it is stored on disks in Amazon S3 data centers). You can protect data in transit by using SSL or by using client-side encryption. You have the following options for protecting data at rest in Amazon S3:

 **Use Server-Side Encryption** – You request Amazon S3 to encrypt your object before saving it on disks in its data centers and decrypt it when you download the objects.

- Use Server-Side Encryption with Amazon S3-Managed Keys (SSE-S3)

- Use Server-Side Encryption with AWS KMS Keys (SSE-KMS)

- Use Server-Side Encryption with Customer-Provided Keys (SSE-C)

 **Use Client-Side Encryption** – You can encrypt data client-side and upload the encrypted data to Amazon S3. In this case, you manage the encryption process, the encryption keys, and related tools.

- Use Client-Side Encryption with AWS KMS key

- Use Client-Side Encryption Using a Client-Side Master Key

![Client-Side Encryption with AWS KMS key and client-side master key](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/bucket_policies_defense_s3(1).43e6c93a095f2f55b33b30276f4782ab9ec79f47.png)

Hence, the correct answers are:

 **– Set up Client-Side Encryption with AWS KMS key.**

 **– Set up Client-Side Encryption using a client-side master key.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up Server-Side Encryption with keys stored in a separate S3 bucket** is incorrect because you typically have to use AWS KMS to store your encryption keys or alternatively, choose an AWS managed keys instead to properly implement Server-Side Encryption in Amazon S3. In addition, storing any type of encryption key in Amazon S3 is actually a security risk and is not recommended.

- The option that says: **Set up Client-Side encryption with S3 managed encryption keys** is incorrect because you can’t have an Amazon S3 managed encryption key for client-side encryption. As its name implies, an Amazon S3 managed key is fully managed by AWS and also rotates the key automatically without any manual intervention. For this scenario, you have to set up a KMS key that you can manage, rotate, and audit or alternatively, use a client-side master key that you manually maintain.

- The option that says: **Set up Server-Side encryption (SSE) with Amazon EC2 key pair** is incorrect because you can’t simply use a key pair of your Amazon EC2 instance for encrypting your S3 bucket. You have to use a client-side master key or a KMS key primarily.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html)
- [https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 26 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company requires that all AWS resources be tagged with a standard naming convention for better access control. The company’s solutions architect must implement a solution that checks for untagged AWS resources.

Which solution requires the least amount of effort to implement?

### Các lựa chọn (Choices)
- [x] **A.** Use an AWS Config rule to detect non-compliant tags.
- [ ] **B.** Use tag policies in AWS Organizations to standardize the naming of tags. Store all the tags in an Amazon S3 bucket with the S3 Object Lock feature enabled.
- [ ] **C.** Create a Lambda function that runs compliance checks on tagged resources. Schedule the function using Amazon EventBridge (Amazon CloudWatch Events).
- [ ] **D.** Use service control policies (SCP) to detect resources that are not tagged properly.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Use an AWS Config rule to detect non-compliant tags.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You can assign metadata to your AWS resources in the form of tags. Each tag is a label consisting of a user-defined key and value. Tags can help you manage, identify, organize, search for, and filter resources. You can create tags to categorize resources by purpose, owner, environment, or other criteria.

You can use tags to control access by restricting IAM permissions based on specific tags or tag values. For example, IAM user or role permissions can include conditions to limit EC2 API calls to specific environments (such as development, test, or production) based on their tags.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-managed-rules-tutorialsdojo-soa-c02.png)

Since tags are case-sensitive, giving them a consistent naming format is a good practice. Depending on how your tagging rules are set up, having a disorganized naming convention may lead to permission issues like the one described in the scenario. In the scenario, the administrator can leverage the **`require-tags`** managed rule in AWS Config. This rule checks if a resource contains the tags that you specify.

Therefore, the correct answer is: **Use an AWS Config rule to detect non-compliant tags.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use tag policies in AWS Organizations to standardize the naming of tags. Store all the tags in an Amazon S3 bucket with the S3 Object Lock feature enabled** is incorrect. Although tag policies can help you enforce the standardization of tags, they won’t be able to report resources that have non-compliant tags. The use of the S3 Object Lock feature in this scenario is not warranted. The S3 Object Lock is primarily used to store objects using a write-once-read-many (WORM) model which can help prevent objects from being deleted or overwritten for a fixed amount of time or indefinitely.

- The option that says: **Create a Lambda function that runs compliance checks on tagged resources. Schedule the function using Amazon EventBridge (Amazon CloudWatch Events) ** is incorrect. While this is possible, using a manage AWS Config rule is a much simpler solution than writing a code running compliance checks.

- The option that says: **Use service control policies (SCP) to detect resources that are not tagged properly** is incorrect. SCPs are just guardrails for setting up the maximum allowable permissions an IAM identity can have. It’s not capable of checking for non-compliant tags.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/config/latest/developerguide/required-tags.html](https://docs.aws.amazon.com/config/latest/developerguide/required-tags.html)
- [https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-strategies)

**Check out this AWS Config cheat sheet:**
- [https://tutorialsdojo.com/aws-config/](https://tutorialsdojo.com/aws-config/)

---

## Câu 27 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company is deploying a Microsoft SharePoint Server environment on AWS using CloudFormation. The Solutions Architect needs to install and configure the architecture that is composed of Microsoft Active Directory (AD) domain controllers, Microsoft SQL Server 2012, multiple Amazon EC2 instances to host the Microsoft SharePoint Server and many other dependencies. The Architect needs to ensure that the required components are properly running before the stack creation proceeds.

Which of the following should the Architect do to meet this requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Configure a `UpdatePolicy` attribute to the instance in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-signal` helper script.
- [ ] **B.** Configure the `UpdateReplacePolicy` attribute in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-signal` helper script.
- [x] **C.** Configure a `CreationPolicy` attribute to the instance in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-signal` helper script.
- [ ] **D.** Configure the `DependsOn` attribute in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-init` helper script.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Configure a `CreationPolicy` attribute to the instance in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-signal` helper script.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You can associate the **`CreationPolicy`** attribute with a resource to prevent its status from reaching create complete until AWS CloudFormation receives a specified number of success signals or the timeout period is exceeded. To signal a resource, you can use the cfn-signal helper script or SignalResource API. AWS CloudFormation publishes valid signals to the stack events so that you track the number of signals sent.

The creation policy is invoked only when AWS CloudFormation creates the associated resource. Currently, the only AWS CloudFormation resources that support creation policies are `AWS::AutoScaling::AutoScalingGroup`, `AWS::EC2::Instance`, and `AWS::CloudFormation::WaitCondition`.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/CloudFormationEndpointDiagram-1024x483.png)

Use the **`CreationPolicy`** attribute when you want to wait on resource configuration actions before stack creation proceeds. For example, if you install and configure software applications on an EC2 instance, you might want those applications to be running before proceeding. In such cases, you can add a `CreationPolicy` attribute to the instance and then send a success signal to the instance after the applications are installed and configured.

Hence, the option that says: **Configure a `CreationPolicy` attribute to the instance in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-signal` helper script** is correct.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Configure the `DependsOn` attribute in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-init` helper script** is incorrect because the cfn-init helper script is not suitable to be used to signal another resource. You have to use cfn-signal instead. And although you can use the DependsOn attribute to ensure the creation of a specific resource follows another, it is still better to use the CreationPolicy attribute instead as it ensures that the applications are properly running before the stack creation proceeds.

- The option that says: **Configure a `UpdatePolicy` attribute to the instance in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-signal` helper script** is incorrect because the `UpdatePolicy` attribute is primarily used for updating resources and for stack update rollback operations.

- The option that says: **Configure the `UpdateReplacePolicy` attribute in the CloudFormation template. Send a success signal after the applications are installed and configured using the `cfn-``signal` helper script** is incorrect because the `UpdateReplacePolicy` attribute is primarily used to retain or in some cases, back up the existing physical instance of a resource when it is replaced during a stack update operation.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-creationpolicy.html](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-creationpolicy.html)
- [https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/deploying.applications.html#deployment-walkthrough-cfn-signal](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/deploying.applications.html#deployment-walkthrough-cfn-signal)
- [https://aws.amazon.com/blogs/devops/use-a-creationpolicy-to-wait-for-on-instance-configurations/](https://aws.amazon.com/blogs/devops/use-a-creationpolicy-to-wait-for-on-instance-configurations/)

**Check out this AWS CloudFormation Cheat Sheet:**
- [https://tutorialsdojo.com/aws-cloudformation/](https://tutorialsdojo.com/aws-cloudformation/)

---

## Câu 28 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
An online registration system hosted in an Amazon EKS cluster stores data to a `db.t4g.medium` Amazon Aurora DB cluster that runs an engine version compatible with Aurora Serverless v2. The database performs well during regular hours but is unable to handle the traffic surge that occurs during flash sales. A solutions architect must move the database to Aurora Serverless v2 while minimizing downtime and the impact on the operation of the application.

Which change should be taken to meet the objective?

### Các lựa chọn (Choices)
- [ ] **A.** Use AWS Database Migration Service (AWS DMS) to migrate to a new Aurora Serverless v2 database.
- [ ] **B.** Take a snapshot of the DB cluster. Use the snapshot to create a new Aurora DB cluster.
- [x] **C.** Add an Aurora Serverless v2 reader to the cluster. Fail over to the reader to make it the writer.
- [ ] **D.** Modify the existing writer instance in place to change its instance class to Serverless.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Add an Aurora Serverless v2 reader to the cluster. Fail over to the reader to make it the writer.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You can switch an existing provisioned Amazon Aurora DB cluster to Aurora Serverless v2 without rebuilding the database. Aurora Serverless v2 is a property of individual DB instances, so a cluster can contain Aurora Serverless v2 instances, provisioned instances, or a combination of both. This lets you introduce a Serverless v2 instance into the existing cluster and make it the writer.

![Aurora Serverless](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aurora-serverless-v2-13Oct2026.jpg)

If the provisioned cluster already runs an engine version that supports Aurora Serverless v2 (for example, Aurora MySQL 3.02.0 or higher, or Aurora PostgreSQL 13.6 or higher), no engine upgrade is needed. The documented steps to switch the cluster are:

- Set the Aurora Serverless v2 capacity range (minimum and maximum ACUs) on the cluster. The console does this automatically when you add the first Serverless v2 instance.

- Add an Aurora Serverless v2 DB instance (the `db.serverless` instance class, shown as **Serverless** in the console) to the cluster as a reader.

- Fail over the cluster so that the Aurora Serverless v2 instance becomes the writer.

- (Optional) Convert or remove the remaining provisioned instances.

Because the new instance joins the same cluster, you can switch over with minimal downtime and without changing the endpoint that your client applications use. The only interruption is the brief failover when the writer role moves to the Serverless v2 instance.

Hence, the correct answer is: **Add an Aurora Serverless v2 reader to the cluster. Fail over to the reader to make it the writer.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use AWS Database Migration Service (AWS DMS) to migrate to a new Aurora Serverless v2 database** is incorrect. It requires creating a separate cluster, running a full load and ongoing replication, and then cutting the application over to a new endpoint. This simply adds operational effort and risk, and the cutover still needs a short pause in writes. AWS documents a direct switch for an existing cluster, so a new cluster is unnecessary.

- The option that says: **Modify the existing writer instance in place to change its instance class to Serverless** is incorrect. It does not describe the switchover that AWS documents for minimal downtime. Although a provisioned instance can be converted by modifying its instance class, AWS describes the switchover as adding or converting a reader to Aurora Serverless v2 and then failing over to it.

- The option that says: **Take a snapshot of the DB cluster. Use the snapshot to create a new Aurora DB cluster** is incorrect. This one involves a long period of downtime since you have to stop the application until the new cluster is created.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2-administration.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2-administration.html)
- [https://aws.amazon.com/blogs/database/upgrade-from-amazon-aurora-serverless-v1-to-v2-with-minimal-downtime/](https://aws.amazon.com/blogs/database/upgrade-from-amazon-aurora-serverless-v1-to-v2-with-minimal-downtime/)

**Check out this Amazon Aurora Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-aurora/](https://tutorialsdojo.com/amazon-aurora/)

---

## Câu 29 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A document sharing website is using AWS as its cloud infrastructure. Free users can upload a total of 5 GB of data, while premium users can upload as much as 5 TB. The application uploads the user files, which can have a max file size of 1 TB, to an Amazon S3 Bucket. The developers initially tried using an S3 presigned URL for each upload, but that alone doesn’t solve the challenges of transferring such large files.

In this scenario, what is the best way for the application to upload the large files to S3?

### Các lựa chọn (Choices)
- [x] **A.** Use Multipart Upload
- [ ] **B.** Use a single PUT request to upload the large file
- [ ] **C.** Use S3 Transfer Acceleration
- [ ] **D.** Use AWS DataSync

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Use Multipart Upload

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
The total volume of data and number of objects you can store are unlimited. Individual Amazon S3 objects can range in size from a minimum of 0 bytes to a maximum of 5 terabytes. The largest object that can be uploaded in a single PUT is 5 gigabytes. For objects larger than 100 megabytes, customers should consider using the Multipart Upload capability.

The Multipart upload API enables you to upload large objects in parts. You can use this API to upload new large objects or make a copy of an existing object. Multipart uploading is a three-step process: you initiate the upload, you upload the object parts, and after you have uploaded all the parts, you complete the multipart upload. Upon receiving the complete multipart upload request, Amazon S3 constructs the object from the uploaded parts, and you can then access the object just as you would any other object in your bucket.

![S3-multipart-upload](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/multipartupload.png)

Hence, the correct answer is: **Use Multipart Upload.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use a single PUT request to upload the large file** is incorrect because the largest file size you can upload using a single PUT request is only up to 5 GB. Files larger than this will fail to be uploaded.

- The option that says: **Use S3 Transfer Acceleration** is incorrect because it primarily improves transfer speed by routing uploads through AWS edge locations, but it does not change the object upload method or remove the single-upload size limitation. For a file that can reach 1 TB, the application still needs Multipart Upload to split the object into smaller parts and upload them reliably.

- The option that says: **Use AWS DataSync** is incorrect because DataSync is designed to automate and accelerate data movement between storage systems and AWS storage services, such as on-premises storage to Amazon S3 or transfers between AWS storage services. It is simply not the best fit for an application where end users upload individual large files directly to an S3 bucket.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html)
- [https://aws.amazon.com/s3/faqs/](https://aws.amazon.com/s3/faqs/)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 30 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has clients all across the globe that access product files stored in several Amazon S3 buckets, which are behind each of the respective Amazon CloudFront web distributions. The company currently wants to deliver content to a specific client, ensuring that only that client can access the data. At present, all clients can access the S3 buckets directly using an S3 URL or through the CloudFront distribution. The Solutions Architect must serve the private content via CloudFront only, to secure the distribution of files.

Which combination of actions should the Architect implement to meet the above requirements? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Generate an S3 presigned URL to ensure that only the client can access the files. Remove permission to use S3 URLs to read the files for anyone else.
- [x] **B.** Restrict access to files in the origin by creating an origin access control (OAC) and giving it permission to read the files in the bucket.
- [ ] **C.** Enable the Origin Shield feature of the CloudFront distribution to protect the files from unauthorized access.
- [ ] **D.** Create a custom CloudFront function to check and ensure that only their clients can access the files.
- [x] **E.** Require the users to access the private content by using special CloudFront signed URLs or signed cookies.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, E**
> - **B.** Restrict access to files in the origin by creating an origin access control (OAC) and giving it permission to read the files in the bucket.
> - **E.** Require the users to access the private content by using special CloudFront signed URLs or signed cookies.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Many companies that distribute content over the Internet want to restrict access to documents, business data, media streams, or content that is intended for selected users, for example, users who have paid a fee. To securely serve this private content by using CloudFront, you can do the following:

– Require that your users access your private content by using special CloudFront signed URLs or signed cookies.

– Require that your users access your Amazon S3 content by using CloudFront URLs, not Amazon S3 URLs. Requiring CloudFront URLs isn’t necessary, but it is recommended to prevent users from bypassing the restrictions that you specify in signed URLs or signed cookies. You can do this by setting up an origin access control (OAC) for your Amazon S3 bucket. You can also configure the custom headers for a private HTTP server or an Amazon S3 bucket configured as a website endpoint.

All objects and buckets by default, are private. The pre-signed URLs are useful if you want your user/customer to be able to upload a specific object to your bucket, but you don’t require them to have AWS security credentials or permissions.

![Amazon CloudFront Origin Access Control](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Amazon_CloudFront_Origin_Access_Control_14March2024.png)

You can generate a pre-signed URL programmatically using the AWS SDK for Java or the AWS SDK for .NET. If you are using Microsoft Visual Studio, you can also use AWS Explorer to generate a pre-signed object URL without writing any code. Anyone who receives a valid pre-signed URL can then programmatically upload an object.

Hence, the correct answers are:

 **– Restrict access to files in the origin by creating an origin access control (OAC) and giving it permission to read the files in the bucket.**

 **– Require the users to access the private content by using special CloudFront signed URLs or signed cookies.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create a custom CloudFront function to check and ensure that only their clients can access the files** is incorrect. CloudFront Functions are just lightweight functions in JavaScript for high-scale, latency-sensitive CDN customizations and not for enforcing security. A CloudFront Function runtime environment offers submillisecond startup times which allows your application to scale immediately to handle millions of requests per second. But again, this can’t be used to restrict access to your files.

- The option that says: **Enable the Origin Shield feature of the CloudFront distribution to protect the files from unauthorized access** is incorrect because this feature is not primarily used for security but for improving your origin’s load times, improving origin availability, and reducing your overall operating costs in CloudFront.

- The option that says: **Generate an S3 presigned URL to ensure that only the client can access the files. Remove permission to use S3 URLs to read the files for anyone else** is incorrect because S3 presigned URLs provide temporary access to specific files, but they require generating unique URLs for each file. This approach does not scale well for multiple files or users, and it still involves sharing a URL for access, which is not as secure or efficient as simply using CloudFront signed URLs or signed cookies.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/PresignedUrlUploadObject.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/PresignedUrlUploadObject.html)

**Check out this Amazon CloudFront Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-cloudfront/](https://tutorialsdojo.com/amazon-cloudfront/)

**Comparison of AWS Services Cheat Sheets:**
- [https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

---

## Câu 31 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A FinTech startup deployed an application on an Amazon EC2 instance with attached Instance Store volumes and an Elastic IP address. The server is only accessed from 8 AM to 6 PM and can be stopped from 6 PM to 8 AM for cost efficiency using AWS Lambda with a script that automates this based on tags.

Which of the following will occur when the EC2 instance is stopped and started? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** The underlying host for the instance is possibly changed.
- [x] **B.** All data on the attached instance-store devices will be lost.
- [ ] **C.** The Elastic IP address is disassociated with the instance.
- [ ] **D.** The ENI (Elastic Network Interface) is detached.
- [ ] **E.** There will be no changes.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, B**
> - **A.** The underlying host for the instance is possibly changed.
> - **B.** All data on the attached instance-store devices will be lost.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
This question did not mention the specific type of EC2 instance, however, it says that it will be stopped and started. Since only EBS-backed instances can be stopped and restarted, it is implied that the instance is EBS-backed. Remember that an instance store-backed instance can only be rebooted or terminated, and its data will be erased if the EC2 instance is either stopped or terminated.

If you stop an EBS-backed EC2 instance, the volume is preserved, but the data in any attached instance store volume will be erased. Keep in mind that an EC2 instance has an underlying physical host computer. If the instance is stopped, AWS usually moves the instance to a new host computer. Your instance may stay on the same host computer if there are no problems with the host computer. In addition, if it is an EC2-VPC instance, the Elastic IP address remains associated.

![Instance store](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/instance-store.jpg)

Take note that an EBS-backed EC2 instance can have attached Instance Store volumes. This is the reason why there is an option that mentions the Instance Store volume, which is included to test your understanding of this specific storage type. You can launch an EBS-backed EC2 instance and attach several Instance Store volumes, but remember that there are some EC2 Instance types that don’t support this kind of setup.

![Instance Volumes](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Instance Volumes-18SEP2026.png)

Hence, the correct answers are:

 **– The underlying host for the instance is possibly changed.**

 **– All data on the attached instance-store devices will be lost.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **The ENI (Elastic Network Interface) is detached** is incorrect because the ENI will stay attached even if you stop your EC2 instance. It is only detached if you explicitly remove it.

- The option that says: **The Elastic IP address is disassociated with the instance** is incorrect because the EIP will typically remain associated with your instance even after stopping it.

- The option that says: **There will be no changes** is incorrect because there will be a lot of possible changes in your EC2 instance once you stop and start it again. AWS may move the virtualized EC2 instance to another host computer; the instance may get a new public IP address, and the data in your attached instance store volumes will be deleted.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate-exam-saa-c03-study-path/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate-exam-saa-c03-study-path/)

---

## Câu 32 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A company has a global online trading platform in which users from all over the world regularly upload terabytes of transactional data to a centralized Amazon S3 bucket.

Which of the following should be used in the present system to improve throughput and ensure consistently fast data transfer to the S3 bucket, regardless of the user’s location?

### Các lựa chọn (Choices)
- [x] **A.** S3 Transfer Acceleration
- [ ] **B.** AWS Direct Connect
- [ ] **C.** FTP
- [ ] **D.** Use Amazon CloudFront Origin Access Control (OAC)

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** S3 Transfer Acceleration

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon S3 Transfer Acceleration** enables fast, easy, and secure transfers of files over long distances between your client and your Amazon S3 bucket. Transfer Acceleration leverages Amazon CloudFront’s globally distributed AWS Edge Locations. As data arrives at an AWS Edge Location, data is routed to your Amazon S3 bucket over an optimized network path.

![Data Migration](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Data-Migration_Thumbnail.feca76e59885394411e50c92bcda19c4d05b733d.jpg)

Hence, the correct answer is: **S3 Transfer Acceleration.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **FTP** is incorrect because the File Transfer Protocol does not guarantee fast throughput and consistent, fast data transfer.

- **AWS Direct Connect** is incorrect because you have users all around the world, and not just in your on-premises data center. Direct Connect would be too costly and is definitely not suitable for this purpose.

- **Use Amazon CloudFront Origin Access Control (OAC)** is incorrect because this is a feature that ensures that only CloudFront can serve S3 content. It does not increase throughput and ensures fast delivery of content to your customers.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html](http://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/transfer-acceleration.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transfer-acceleration.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

**Comparison of AWS Services Cheat Sheets:**
- [https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

---

## Câu 33 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company runs a multi-tier web application in the AWS Cloud. The application tier is hosted on Amazon EC2 instances and the backend database is hosted on an Amazon Aurora for MySQL DB cluster. For security compliance, all of the application variables such as DB hostnames, environment settings, product keys, and database passwords must be stored securely with encryption.

Which of the following options is the most cost-effective solution to meet the requirements?

### Các lựa chọn (Choices)
- [x] **A.** Store the values by creating SecureString type parameters in AWS Systems Manager Parameter Store. Use AWS Key Management Service (AWS KMS) for the encryption. Update the application to retrieve the parameter values.
- [ ] **B.** Store the values by creating secrets in AWS Secrets Manager. Use AWS Key Management Service (AWS KMS) for the encryption. Use the `BatchGetSecretValue` API to retrieve multiple secrets efficiently. Update the application to retrieve the values of the secrets.
- [ ] **C.** Store the values as key-value pairs in AWS Systems Manager OpsCenter. By default, the key-value pairs will be encrypted at rest. Configure the application to retrieve the variables when it starts.
- [ ] **D.** Store the values in a file saved in an Amazon S3 bucket. Enable encryption on the S3 bucket. Configure the application to download the file contents when it starts.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Store the values by creating SecureString type parameters in AWS Systems Manager Parameter Store. Use AWS Key Management Service (AWS KMS) for the encryption. Update the application to retrieve the parameter values.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Systems Manager** is a collection of capabilities to help you manage your applications and infrastructure running in the AWS Cloud. Systems Manager simplifies application and resource management, shortens the time to detect and resolve operational problems, and helps you manage your AWS resources securely at scale.

 **Parameter Store** provides secure, hierarchical storage for configuration data and secrets management. You can store data such as passwords, database strings, Amazon Elastic Compute Cloud (Amazon EC2) instance IDs and Amazon Machine Image (AMI) IDs, and license codes as parameter values. You can store values as plain text or encrypted data. You can then reference values by using the unique name you specified when you created the parameter. Parameter Store is also integrated with Secrets Manager. You can retrieve Secrets Manager secrets when using other AWS services that already support references to Parameter Store parameters.

![SSM Parameter Store](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/saa_ssm_parameter_store.png)

The AWS Systems Manager Parameter Store allows you to store and retrieve application parameters in a secure manner. Therefore, the correct answer is: **Store the values by creating SecureString type parameters in AWS Systems Manager Parameter Store. Use AWS Key Management Service (AWS KMS) for the encryption. Update the application to retrieve the parameter values.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Store the values by creating secrets in AWS Secrets Manager. Use AWS Key Management Service (AWS KMS) for the encryption. Use the `BatchGetSecretValue` API to retrieve multiple secrets efficiently. Update the application to retrieve the values of the secrets** is incorrect. While Secrets Manager provides secure storage and supports encrypted retrieval using `BatchGetSecretValue`, it incurs a recurring cost of approximately $0.40 per secret per month, making it less cost-effective for storing a large number of static values. It is primarily designed for sensitive secrets that require features like automatic rotation and fine-grained access control. For storing application parameters that change infrequently and do not require rotation, AWS Systems Manager Parameter Store with `SecureString` is a more appropriate and cost-effective solution.

- The option that says: **Store the values in a file saved in an Amazon S3 bucket. Enable encryption on the S3 bucket. Configure the application to download the file contents when it starts** is incorrect. This is possible, but it is not a recommended practice. You will need to update the file and upload it to Amazon S3 every time you change values on one of the parameters.

- The option that says: **Store the values as key-value pairs in AWS Systems Manager OpsCenter. By default, the key-value pairs will be encrypted at rest. Configure the application to retrieve the variables when it starts** is incorrect. The AWS Systems Manager OpsCenter is just one of the capabilities of the AWS Systems manager, and it is not meant as a datastore of key value. This service is not recommended for storing encrypted application parameters. Using the AWS Systems Manager Parameter Store is more suitable for this scenario.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html)
- [https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)

**Check out this AWS Systems Manager Cheat Sheet:**
- [https://tutorialsdojo.com/aws-systems-manager/](https://tutorialsdojo.com/aws-systems-manager/)

**Check out this AWS Systems Manager and AWS Secrets Manager comparison:**
- [https://tutorialsdojo.com/aws-secrets-manager-vs-systems-manager-parameter-store/](https://tutorialsdojo.com/aws-secrets-manager-vs-systems-manager-parameter-store/)

---

## Câu 34 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A media company recently launched their newly created web application. Many users tried to visit the website, but they are receiving a 503 Service Unavailable Error. The system administrator tracked the EC2 instance status and saw the capacity is reaching its maximum limit and unable to process all the requests. To gain insights from the application’s data, they need to launch a real-time analytics service.

Which of the following allows you to read records in batches?

### Các lựa chọn (Choices)
- [x] **A.** Create a Kinesis Data Stream and use AWS Lambda to read records from the data stream.
- [ ] **B.** Create an Amazon S3 bucket to store the captured data and use Amazon Redshift Spectrum to analyze the data.
- [ ] **C.** Create a Data Firehose and use AWS Lambda to read records from the data stream.
- [ ] **D.** Create an Amazon S3 bucket to store the captured data and use Amazon Athena to analyze the data.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Create a Kinesis Data Stream and use AWS Lambda to read records from the data stream.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Kinesis Data Streams (KDS)** is a massively scalable and durable real-time data streaming service. KDS can continuously capture gigabytes of data per second from hundreds of thousands of sources. You can use an AWS Lambda function to process records in Amazon KDS. By default, Lambda invokes your function as soon as records are available in the stream. Lambda can process up to 10 batches in each shard simultaneously. If you increase the number of concurrent batches per shard, Lambda still ensures in-order processing at the partition-key level.

![How Amazon Kinesis Data Streams works](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/product-page-diagram_Amazon-Kinesis-Data-Streams.074de94302fd60948e1ad070e425eeda73d350e7.png)

The first time you invoke your function, AWS Lambda creates an instance of the function and runs its handler method to process the event. When the function returns a response, it stays active and waits to process additional events. If you invoke the function again while the first event is being processed, Lambda initializes another instance, and the function processes the two events concurrently. As more events come in, Lambda routes them to available instances and creates new instances as needed. When the number of requests decreases, Lambda stops unused instances to free upscaling capacity for other functions.

Since the media company needs a real-time analytics service, you can use Kinesis Data Streams to gain insights from your data. The data collected is available in milliseconds. Use AWS Lambda to read records in batches and invoke your function to process records from the batch. If the batch that Lambda reads from the stream only has one record in it, Lambda sends only one record to the function.

Hence, the correct answer in this scenario is: **Create a Kinesis Data Stream and use AWS Lambda to read records from the data stream** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Create a Data Firehose and use AWS Lambda to read records from the data stream** is incorrect. Although Amazon Data Firehose captures and loads data in near real-time, AWS Lambda can’t be set as its destination. You can write Lambda functions and integrate it with Data Firehose to request additional, customized processing of the data before it is sent downstream. However, this integration is primarily used for stream processing and not the actual consumption of the data stream. You have to use a Kinesis Data Stream in this scenario.

- The options that say: **Create an Amazon S3 bucket to store the captured data and use Amazon Athena to analyze the data** and **Create an Amazon S3 bucket to store the captured data and use Amazon Redshift Spectrum to analyze the data** are both incorrect. As per the scenario, the company needs a real-time analytics service that can ingest and process data. You need to use Amazon Kinesis to process the data in real-time.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/kinesis/data-streams/](https://aws.amazon.com/kinesis/data-streams/)
- [https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html)
- [https://aws.amazon.com/premiumsupport/knowledge-center/503-error-classic/](https://aws.amazon.com/premiumsupport/knowledge-center/503-error-classic/)

**Check out this Amazon Kinesis Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-kinesis/](https://tutorialsdojo.com/amazon-kinesis/)

---

## Câu 35 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company has an On-Demand EC2 instance located in a subnet in AWS that hosts a web application. The security group attached to this EC2 instance has the following Inbound Rules:

![](../data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20500%20202'%3E%3C/svg%3E)

​

The Route table attached to the VPC is shown below. You can establish an SSH connection into the EC2 instance from the Internet. However, you are not able to connect to the web server using your Chrome browser.

![](../data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20501%20202'%3E%3C/svg%3E)

​

Which of the below steps would resolve the issue?

### Các lựa chọn (Choices)
- [ ] **A.** In the Route table, add this new route entry: 10.0.0.0/27 -> local
- [ ] **B.** In the Security Group, remove the SSH rule.
- [x] **C.** In the Security Group, add an Inbound HTTP rule.
- [ ] **D.** In the Route table, add this new route entry: 0.0.0.0 -> igw-b51618cc

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** In the Security Group, add an Inbound HTTP rule.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In this particular scenario, you can already connect to the EC2 instance via SSH. This means that there is no problem in the Route Table of your VPC. To fix this issue, you simply need to update your Security Group and add an Inbound rule to allow HTTP traffic.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/sg_rules_desc_3.png)

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **In the Security Group, remove the SSH rule** is incorrect as doing so will not solve the issue. It will just disable SSH traffic that is already available.

- The options that say: **In the Route table, add this new route entry: 0.0.0.0 -> igw-b51618cc** and **In the Route table, add this new route entry: 10.0.0.0/27 -> local** are incorrect as there is no need to change the Route Tables.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 36 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A web-based application must extract specific data from a large CSV file stored in an Amazon S3 bucket. The application requires filtering or transforming the data dynamically before returning it, ensuring that only the needed data is returned without downloading the entire object.

Which of the following actions should be implemented to achieve this?

### Các lựa chọn (Choices)
- [ ] **A.** Use S3 Object Lambda with a Lambda function that processes the data based on the bucket's name and object's metadata.
- [x] **B.** Use S3 Object Lambda with a Lambda function that processes the data based on the bucket's name and object's key.
- [ ] **C.** Use S3 Object Lambda with a Lambda function that processes the data based on the bucket’s name.
- [ ] **D.** Use S3 Object Lambda with a Lambda function that processes the data based on the bucket's name and object tags.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use S3 Object Lambda with a Lambda function that processes the data based on the bucket's name and object's key.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon S3 Object Lambda** allows users to add custom code to process and transform data when retrieving it from S3. This means that applications can retrieve and modify the data dynamically without the need to create additional storage copies. By integrating AWS Lambda functions with S3 GET requests, users can filter, format, or customize the data on the fly before it’s returned to the application, enabling more flexible and efficient data handling.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-S3-Object-Lambda-3Oct2024.png)

Amazon S3 Object Lambda allows custom code (through Lambda functions) to be applied to S3 GET requests. This enables modifying and transforming data dynamically as it is retrieved from the S3 bucket. To do this, a Lambda function must be configured to process the data based on parameters, such as the object’s key (file name) and bucket details.

Hence, the correct answer is: **Use S3 Object Lambda with a Lambda function that processes the data based on the bucket’s name and object’s key.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use S3 Object Lambda with a Lambda function that processes the data based on the bucket’s name and object’s metadata** is incorrect because metadata only provides additional information about the object, such as its size or last modification date, and does not refer to the actual content of the file.

- The option that says: **Use S3 Object Lambda with a Lambda function that processes the data based on the bucket’s name and object tags** is incorrect because object tags are primarily used to organize and categorize S3 objects but are not related to the file’s content or dynamic data filtering.

- The option that says: **Use S3 Object Lambda with a Lambda function that processes the data based on the bucket’s name** is incorrect because the bucket name alone is simply insufficient to retrieve and process specific files, especially in cases where multiple files are stored in the bucket.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/s3/features/object-lambda/](https://aws.amazon.com/s3/features/object-lambda/)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/transforming-objects.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transforming-objects.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 37 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A Solutions Architect working for a startup is designing a High Performance Computing (HPC) application which is publicly accessible for their customers. The startup founders want to mitigate distributed denial-of-service (DDoS) attacks on their application.

Which of the following options are not suitable to be implemented in this scenario? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.
- [x] **B.** Use Dedicated EC2 instances to ensure that each instance has the maximum performance possible.
- [ ] **C.** Use an Amazon CloudFront service for distributing both static and dynamic content.
- [ ] **D.** Use AWS Shield and AWS WAF.
- [x] **E.** Add multiple Elastic Fabric Adapters (EFA) to each EC2 instance to increase the network bandwidth.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, E**
> - **B.** Use Dedicated EC2 instances to ensure that each instance has the maximum performance possible.
> - **E.** Add multiple Elastic Fabric Adapters (EFA) to each EC2 instance to increase the network bandwidth.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Take note that the question asks about the viable mitigation techniques that are **NOT** suitable to prevent Distributed Denial of Service (DDoS) attack.

A Denial of Service (DoS) attack is an attack that can make your website or application unavailable to end users. To achieve this, attackers use a variety of techniques that consume network or other resources, disrupting access for legitimate end users.

To protect your system from DDoS attack, you can do the following:

– Use an Amazon CloudFront service for distributing both static and dynamic content.

– Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.

– Set up alerts in Amazon CloudWatch to look for high **`Network In`** and CPU utilization metrics.

Services that are available within AWS Regions, like Elastic Load Balancing and Amazon Elastic Compute Cloud (EC2), allow you to build Distributed Denial of Service resiliency and scale to handle unexpected volumes of traffic within a given region. Services that are available in AWS edge locations, like Amazon CloudFront, AWS WAF, Amazon Route53, and Amazon API Gateway, allow you to take advantage of a global network of edge locations that can provide your application with greater fault tolerance and increased scale for managing larger volumes of traffic.

In addition, you can also use **AWS Shield** and **AWS WAF** to fortify your cloud network. AWS Shield is a managed DDoS protection service that is available in two tiers: Standard and Advanced. AWS Shield Standard applies always-on detection and inline mitigation techniques, such as deterministic packet filtering and priority-based traffic shaping, to minimize application downtime and latency.

 **AWS WAF** is a web application firewall that helps protect web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources. You can use AWS WAF to define customizable web security rules that control which traffic accesses your web applications. If you use AWS Shield Advanced, you can use AWS WAF at no extra cost for those protected resources and can engage the DRT to create WAF rules.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/lb-app-ddos-mitigation.5fd8c473963ad36250ce5b01e631aaa6f657aff4.png)

 **Using Dedicated EC2 instances to ensure that each instance has the maximum performance possible** is not a viable mitigation technique because Dedicated EC2 instances are just an instance billing option. Although it may ensure that each instance gives the maximum performance, that by itself is not enough to mitigate a DDoS attack.

 **Adding multiple Elastic Fabric Adapters (EFA) to each EC2 instance to increase the network bandwidth** is also not a viable option as this is mainly done for performance improvement and not for DDoS attack mitigation. Moreover, you can attach only one EFA per EC2 instance. An Elastic Fabric Adapter (EFA) is a network device that you can attach to your Amazon EC2 instance to accelerate High-Performance Computing (HPC) and machine learning applications.

The following options are valid mitigation techniques that can be used to prevent DDoS:

 **– Use an Amazon CloudFront service for distributing both static and dynamic content.**

 **– Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.**

 **– Use AWS Shield and AWS WAF.**

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References** :
- [https://aws.amazon.com/answers/networking/aws-ddos-attack-mitigation/](https://aws.amazon.com/answers/networking/aws-ddos-attack-mitigation/)
- [https://d0.awsstatic.com/whitepapers/DDoS_White_Paper_June2015.pdf](https://d0.awsstatic.com/whitepapers/DDoS_White_Paper_June2015.pdf)

**Best practices on DDoS Attack Mitigation:**

---

## Câu 38 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
An aerospace engineering company recently adopted a hybrid cloud infrastructure with AWS. One of the responsibilities of the Solutions Architect is to launch an Amazon VPC with both public and private subnets for Amazon EC2 instances and database instances. The architecture must ensure each subnet is properly defined within the assigned VPC CIDR block.

Which of the following statements are true regarding VPC subnets? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** Each newly created subnet is, by default, linked to the main route table of the VPC.
- [ ] **B.** The allowed block size in VPC is between a /16 netmask (65,536 IP addresses) and /27 netmask (32 IP addresses).
- [x] **C.** Each subnet maps to a single Availability Zone.
- [ ] **D.** Each subnet spans 2 Availability Zones.
- [ ] **E.** EC2 instances in a private subnet can communicate with the Internet only if they have an Elastic IP.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, C**
> - **A.** Each newly created subnet is, by default, linked to the main route table of the VPC.
> - **C.** Each subnet maps to a single Availability Zone.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A **VPC** spans all the Availability Zones in the region. After creating a VPC, you can add one or more subnets in each Availability Zone. When you create a subnet, you specify the CIDR block for the subnet, which is a subset of the VPC CIDR block. Each subnet must reside entirely within one Availability Zone and cannot span zones. Availability Zones are distinct locations that are engineered to be isolated from failures in other Availability Zones. By launching instances in separate Availability Zones, you can protect your applications from the failure of a single location.

![Subnets Diagram](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/subnets-diagram.png)

Hence, the correct answers are:

 **– Each subnet maps to a single Availability Zone**

 **– Each newly created subnet is, by default, linked to the main route table of the VPC.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **EC2 instances in a private subnet can communicate with the Internet only if they have an Elastic IP** is incorrect. EC2 instances in a private subnet can communicate with the Internet not just by having an Elastic IP, but also with a public IP address via a NAT Instance or a NAT Gateway. Take note that there is a distinction between private and public IP addresses. To enable communication with the Internet, a public IPv4 address is mapped to the primary private IPv4 address through network address translation (NAT).

- The option that says: **The allowed block size in VPC is between a `/16` netmask (65,536 IP addresses) and `/27` netmask (32 IP addresses)** is incorrect because the allowed block size in VPC is between a ` /16` netmask (65,536 IP addresses) and ` /28` netmask (16 IP addresses) and not ` /27` netmask.

- The option that says: **Each subnet spans 2 Availability Zones** is incorrect because each subnet must reside only within one Availability Zone and cannot span zones.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c03/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c03/)

---

## Câu 39 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
You are automating the creation of EC2 instances in your VPC. Hence, you wrote a python script to trigger the Amazon EC2 API to request 50 EC2 instances in a single Availability Zone. However, you noticed that after 20 successful requests, subsequent requests failed.

What could be a reason for this issue and how would you resolve it?

### Các lựa chọn (Choices)
- [ ] **A.** There was an issue with the Amazon EC2 API. Just resend the requests and these will be provisioned successfully.
- [x] **B.** There is a vCPU-based On-Demand Instance limit per region which is why subsequent requests failed. Just submit the limit increase form to AWS and retry the failed requests once approved.
- [ ] **C.** By default, AWS allows you to provision a maximum of 20 instances per region. Select a different region and retry the failed request.
- [ ] **D.** By default, AWS allows you to provision a maximum of 20 instances per Availability Zone. Select a different Availability Zone and retry the failed request.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** There is a vCPU-based On-Demand Instance limit per region which is why subsequent requests failed. Just submit the limit increase form to AWS and retry the failed requests once approved.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You are limited to running On-Demand Instances per your vCPU-based On-Demand Instance limit, purchasing 20 Reserved Instances, and requesting Spot Instances per your dynamic Spot limit per region. New AWS accounts may start with limits that are lower than the limits described here.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-03-15_09-51-18-76e919b00bf7a410f5577b967586a4b0.png)

If you need more instances, complete the Amazon EC2 limit increase request form with your use case, and your limit increase will be considered. Limit increases are tied to the region they were requested for.

Hence, the correct answer is:* * **There is a vCPU-based On-Demand Instance limit per region which is why subsequent requests failed. Just submit the limit increase form to AWS and retry the failed requests once approved.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **There was an issue with the Amazon EC2 API. Just resend the requests and these will be provisioned successfully** is incorrect because you are limited to running On-Demand Instances per your vCPU-based On-Demand Instance limit. There is also a limit of purchasing 20 Reserved Instances and requesting Spot Instances per your dynamic Spot limit per region hence, there is no problem with the EC2 API.

- The option that says: **By default, AWS allows you to provision a maximum of 20 instances per region. Select a different region and retry the failed request** is incorrect. There is no need to select a different region since this limit can be increased after submitting a request form to AWS.

- The option that says: **By default, AWS allows you to provision a maximum of 20 instances per Availability Zone. Select a different Availability Zone and retry the failed request** is incorrect because the vCPU-based On-Demand Instance limit is set per region and not per Availability Zone. This can be increased after submitting a request form to AWS.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_ec2](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_ec2)
- [https://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2](https://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 40 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A manufacturing company has EC2 instances running in AWS. The EC2 instances are configured with Auto Scaling. There are a lot of requests being lost because of too much load on the servers. The Auto Scaling is launching new EC2 instances to take the load accordingly yet, there are still some requests that are being lost.

Which of the following is the MOST suitable solution that you should implement to avoid losing recently submitted requests?

### Các lựa chọn (Choices)
- [x] **A.** Use an Amazon SQS queue to decouple the application components and scale-out the EC2 instances based upon the `ApproximateNumberOfMessages` metric in Amazon CloudWatch.
- [ ] **B.** Use larger instances for your application with an attached Elastic Fabric Adapter (EFA).
- [ ] **C.** Set up Amazon Aurora Serverless for on-demand, auto-scaling configuration of your EC2 Instances and also enable Amazon Aurora Parallel Query feature for faster analytical queries over your current data.
- [ ] **D.** Replace the Auto Scaling group with a cluster placement group to achieve a low-latency network performance necessary for tightly-coupled node-to-node communication.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Use an Amazon SQS queue to decouple the application components and scale-out the EC2 instances based upon the `ApproximateNumberOfMessages` metric in Amazon CloudWatch.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Simple Queue Service (SQS)** is a fully managed message queuing service that makes it easy to decouple and scale microservices, distributed systems, and serverless applications. Building applications from individual components that each perform a discrete function improves scalability and reliability and is best practice design for modern applications. SQS makes it simple and cost-effective to decouple and coordinate the components of a cloud application. Using SQS, you can send, store, and receive messages between software components at any volume without losing messages or requiring other services to be always available.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/sqs-message-lifecycle-diagram.png)

The number of messages in your Amazon SQS queue does not solely define the number of instances needed. In fact, the number of instances in the fleet can be driven by multiple factors, including how long it takes to process a message and the acceptable amount of latency (queue delay).

The solution is to use a *backlog per instance* metric with the target value being the *acceptable backlog per instance* to maintain. You can calculate these numbers as follows:

 **Backlog per instance** : To determine your backlog per instance, start with the Amazon SQS metric `ApproximateNumberOfMessages` to determine the length of the SQS queue (number of messages available for retrieval from the queue). Divide that number by the fleet’s running capacity, which for an Auto Scaling group is the number of instances in the `InService` state, to get the backlog per instance.

 **Acceptable backlog per instance** : To determine your target value, first calculate what your application can accept in terms of latency. Then, take the acceptable latency value and divide it by the average time that an EC2 instance takes to process a message.

To illustrate with an example, let’s say that the current `ApproximateNumberOfMessages` is 1500 and the fleet’s running capacity is 10. If the average processing time is 0.1 seconds for each message and the longest acceptable latency is 10 seconds then the acceptable backlog per instance is 10 / 0.1, which equals 100. This means that 100 is the target value for your target tracking policy. Because the backlog per instance is currently at 150 (1500 / 10), your fleet scales out by five instances to maintain proportion to the target value.

Hence, the correct answer is: **Use an Amazon SQS queue to decouple the application components and scale-out the EC2 instances based upon the `ApproximateNumberOfMessages` metric in Amazon CloudWatch.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Replacing the Auto Scaling group with a cluster placement group to achieve a low-latency network performance necessary for tightly-coupled node-to-node communication** is incorrect. Although it is true that a cluster placement group allows you to achieve a low-latency network performance, you still need to use Auto Scaling for your architecture to add more EC2 instances.

- **Using larger instances for your application with an attached Elastic Fabric Adapter (EFA)** is incorrect because using a larger EC2 instance would not prevent data from being lost in case of a larger spike. You can take advantage of the durability and elasticity of SQS to keep the messages available for consumption by your instances. Elastic Fabric Adapter (EFA) is simply a network interface for Amazon EC2 instances that enables customers to run applications requiring high levels of inter-node communications at scale on AWS.

- **Setting up Amazon Aurora Serverless for on-demand, auto-scaling configuration of your EC2 Instances and also enabling Amazon Aurora Parallel Query feature for faster analytical queries over your current data** is incorrect. Although the Amazon Aurora Parallel Query feature provides faster analytical queries over your current data, Amazon Aurora Serverless is an on-demand, auto-scaling configuration for your database, and NOT for your EC2 instances. This is actually an auto-scaling configuration for your Amazon Aurora database and not for your compute services.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/sqs/](https://aws.amazon.com/sqs/)
- [https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-using-sqs-queue.html)

**Check out this Amazon SQS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-sqs/](https://tutorialsdojo.com/amazon-sqs/)

---

## Câu 41 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company is hosting EC2 instances that are on non-production environment and processing non-priority batch loads, which can be interrupted at any time.

What is the best instance purchasing option which can be applied to your EC2 instances in this case?

### Các lựa chọn (Choices)
- [x] **A.** Spot Instances
- [ ] **B.** On-Demand Capacity Reservations
- [ ] **C.** On-Demand Instances
- [ ] **D.** Reserved Instances

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Spot Instances

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon EC2 Spot instances** are spare compute capacity in the AWS cloud available to you at steep discounts compared to On-Demand prices. It can be interrupted by AWS EC2 with two minutes of notification when the EC2 needs the capacity back.

To use Spot Instances, you create a Spot Instance request that includes the number of instances, the instance type, the Availability Zone, and the maximum price that you are willing to pay per instance hour. If your maximum price exceeds the current Spot price, Amazon EC2 fulfills your request immediately if capacity is available. Otherwise, Amazon EC2 waits until your request can be fulfilled or until you cancel the request.

 **Reserved Instances** and **On-Demand Capacity Reservations** are better suited for workloads with steady, predictable usage, while **On-Demand Instances** may not be the most cost-efficient option for workloads that are flexible and non-urgent.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/spot_lifecycle.png)

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
- [https://aws.amazon.com/ec2/spot/](https://aws.amazon.com/ec2/spot/)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 42 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A large insurance company has an AWS account that contains three VPCs (DEV, UAT and PROD) in the same region. UAT is peered to both PROD and DEV using a VPC peering connection. All VPCs have non-overlapping CIDR blocks. The company wants to push minor code releases from Dev to Prod to speed up time to market.

Which of the following options helps the company accomplish this?

### Các lựa chọn (Choices)
- [ ] **A.** Create a new entry to PROD in the DEV route table using the VPC peering connection as the target.
- [ ] **B.** Change the DEV and PROD VPCs to have overlapping CIDR blocks to be able to connect them.
- [ ] **C.** Do nothing. Since these two VPCs are already connected via UAT, they already have a connection to each other.
- [x] **D.** Create a new VPC peering connection between PROD and DEV with the appropriate routes.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create a new VPC peering connection between PROD and DEV with the appropriate routes.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them privately. Instances in either VPC can communicate with each other as if they are within the same network. You can create a VPC peering connection between your own VPCs, with a VPC in another AWS account, or with a VPC in a different AWS Region.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/peering-intro-diagram.png)

AWS uses the existing infrastructure of a VPC to create a VPC peering connection; it is neither a gateway nor a VPN connection and does not rely on a separate piece of physical hardware. There is no single point of failure for communication or a bandwidth bottleneck.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Creating a new entry to PROD in the DEV route table using the VPC peering connection as the target** is incorrect because even if you configure the route tables, the two VPCs will still be disconnected until you set up a VPC peering connection between them.

- **Changing the DEV and PROD VPCs to have overlapping CIDR blocks to be able to connect them** is incorrect because you cannot peer two VPCs with overlapping CIDR blocks.

- The option that says: **Do nothing. Since these two VPCs are already connected via UAT, they already have a connection to each other** is incorrect as transitive VPC peering is not allowed hence, even though DEV and PROD are both connected in UAT, these two VPCs do not have a direct connection to each other.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-peering.html](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-peering.html)

**Check out these Amazon VPC and VPC Peering Cheat Sheets:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)
- [https://tutorialsdojo.com/vpc-peering/](https://tutorialsdojo.com/vpc-peering/)

---

## Câu 43 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A Solutions Architect for a global news company is configuring a fleet of EC2 instances in a subnet that currently is in a VPC with an Internet gateway attached. All of these EC2 instances can be accessed from the Internet. The architect launches another subnet and deploys an EC2 instance in it, however, the architect is not able to access the EC2 instance from the Internet.

What could be the possible reasons for this issue? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** The Amazon EC2 instance is not a member of the same Auto Scaling group.
- [x] **B.** The route table is not configured properly to send traffic from the EC2 instance to the Internet through the Internet gateway.
- [ ] **C.** The Amazon EC2 instance does not have an attached Elastic Fabric Adapter (EFA).
- [ ] **D.** The route table is not configured properly to send traffic from the EC2 instance to the Internet through the customer gateway (CGW).
- [x] **E.** The Amazon EC2 instance does not have a public IP address associated with it.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, E**
> - **B.** The route table is not configured properly to send traffic from the EC2 instance to the Internet through the Internet gateway.
> - **E.** The Amazon EC2 instance does not have a public IP address associated with it.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Your VPC has an implicit router and you use route tables to control where network traffic is directed. Each subnet in your VPC must be associated with a route table, which controls the routing for the subnet (subnet route table). You can explicitly associate a subnet with a particular route table. Otherwise, the subnet is implicitly associated with the main route table.

A subnet can only be associated with one route table at a time, but you can associate multiple subnets with the same subnet route table. You can optionally associate a route table with an internet gateway or a virtual private gateway (gateway route table). This enables you to specify routing rules for inbound traffic that enters your VPC through the gateway

Be sure that the subnet route table also has a route entry to the internet gateway. If this entry doesn’t exist, the instance is in a private subnet and is inaccessible from the internet.

In cases where your EC2 instance cannot be accessed from the Internet (or vice versa), you usually have to check two things:

– Does it have an EIP or public IP address?

– Is the route table properly configured?

![https://media.tutorialsdojo.com/route-tables-tutorialsdojo-aws-certifications-solutions-architect.png](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/route-tables-tutorialsdojo-aws-certifications-solutions-architect.png)

Below are the correct answers:

 **– Amazon EC2 instance does not have a public IP address associated with it.**

 **– The route table is not configured properly to send traffic from the EC2 instance to the Internet through the Internet gateway.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **The Amazon EC2 instance is not a member of the same Auto Scaling group** is incorrect since Auto Scaling Groups do not affect Internet connectivity of EC2 instances.

- The option that says: **The Amazon EC2 instance doesn’t have an attached Elastic Fabric Adapter (EFA)** is incorrect because Elastic Fabric Adapter is just a network device that you can attach to your Amazon EC2 instance to accelerate High Performance Computing (HPC) and machine learning applications. EFA enables you to achieve the application performance of an on-premises HPC cluster, with the scalability, flexibility, and elasticity provided by AWS. However, this component is not required in order for your EC2 instance to access the public Internet.

- The option that says: **The route table is not configured properly to send traffic from the EC2 instance to the Internet through the customer gateway (CGW)** is incorrect since CGW is used when you are setting up a VPN. The correct gateway should be an Internet gateway.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html)
- [https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)

**Check out this Amazon VPC Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-vpc/](https://tutorialsdojo.com/amazon-vpc/)

---

## Câu 44 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company is building an automation tool for generating custom reports on its AWS usage. The company must be able to programmatically access and forecast usage costs on specific services.

Which of the following would meet the requirements with the LEAST amount of operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Generate AWS Budgets reports for usage cost data and deliver them via Amazon Simple Queue Service (SQS).
- [x] **B.** Use the AWS Cost Explorer API with pagination to programmatically retrieve the usage cost-related data.
- [ ] **C.** Utilize the downloadable AWS Cost Explorer report .csv files to access the cost-related data. Predict usage costs using AWS Budgets.
- [ ] **D.** Configure AWS Budgets to send usage cost data to the company via Amazon SNS.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use the AWS Cost Explorer API with pagination to programmatically retrieve the usage cost-related data.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Cost Explorer** is a service provided by Amazon Web Services (AWS) that helps you visualize, understand, and analyze your AWS costs and usage. It provides a comprehensive set of tools and features to help you monitor and manage your AWS spending.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/td-cost-explorer-10-03-2024.png)

The primary purpose of AWS Cost Explorer is to help you gain insights into your AWS costs and usage patterns over time. It lets you view and analyze your historical spending data, forecast future costs, and identify cost-saving opportunities.

You can programmatically query your cost and usage data via the **Cost Explorer API** . You can query for aggregated data such as total monthly costs or total daily usage. You can also query for granular data, such as the number of daily write operations for DynamoDB database tables in your production environment.

By using the AWS Cost Explorer API, the company can programmatically access the usage cost-related data they need on specific services. The pagination feature allows for the efficient retrieval of large datasets.

Hence the correct answer is: **Use the AWS Cost Explorer API with pagination to programmatically retrieve the usage cost-related data.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Utilize the downloadable AWS Cost Explorer report .csv files to access the cost-related data. Predict usage costs using AWS Budgets** is incorrect. This option involves the process of manually downloading .csv files, which adds significant operational overhead compared to directly accessing data through the AWS Cost Explorer API. This method simply lacks the ability to programmatically and dynamically retrieve usage data, making it a less efficient solution.

- The option that says: **Configure AWS Budgets to send usage cost data to the company via Amazon SNS** is incorrect because this simply helps you get notified on budget thresholds; it does not provide access to the usage of cost-related data.

- The option that says: **Generate AWS Budgets reports for usage cost data and deliver them via Amazon Simple Queue Service (SQS)** is incorrect. AWS Budgets just allows you to set custom cost and usage budgets that alert you when your budget thresholds are exceeded. It won’t give you detailed information on AWS usage and cost.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/cost-management/latest/userguide/ce-what-is.html](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-what-is.html)
- [https://docs.aws.amazon.com/cost-management/latest/userguide/ce-api.html](https://docs.aws.amazon.com/cost-management/latest/userguide/ce-api.html)

**Check out this AWS Billing and Cost Management Cheat Sheet:**
- [https://tutorialsdojo.com/aws-billing-and-cost-management/](https://tutorialsdojo.com/aws-billing-and-cost-management/)

---

## Câu 45 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A tech company is currently using Auto Scaling for their web application. A new AMI now needs to be used for launching a fleet of EC2 instances. Which of the following changes needs to be done?

### Các lựa chọn (Choices)
- [ ] **A.** Create a new target group.
- [ ] **B.** Create a new target group and launch template.
- [ ] **C.** Do nothing. You can start directly launching EC2 instances in the Auto Scaling group with the same launch template.
- [x] **D.** Create a new launch template.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create a new launch template.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A launch template is a template that an Auto Scaling group uses to launch EC2 instances. When you create a launch template, you specify information for the instances, such as the ID of the Amazon Machine Image (AMI), the instance type, a key pair, one or more security groups, and a block device mapping. If you’ve launched an EC2 instance before, you specified the same information in order to launch the instance.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/aws-auto-scaling-how-it-works-diagram.d42779c774d634883bdcd0463de7bd86f6e2231d.png)

You can specify your launch template with multiple Auto Scaling groups. However, you can only specify one launch template for an Auto Scaling group at a time, and you can’t modify a launch template after you’ve created it. Therefore, if you want to change the launch template for an Auto Scaling group, you must create a template and then update your Auto Scaling group with the new launch template.

For this scenario, you have to create a new launch template. Remember that you can’t modify a launch template after you’ve created it.

Hence, the correct answer is: **Create** ** a new launch template.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Do nothing. You can start directly launching EC2 instances in the Auto Scaling group with the same launch template** is incorrect because what you are trying to achieve is to change the AMI being used by your fleet of EC2 instances. Therefore, you need to change the launch template to update what your instances are using.

- The option that says: **Create a new target group** and **Create a new target group and launch template** are both incorrect because you only want to change the AMI being used by your instances, and not the instances themselves. Target groups are primarily used in ELBs and not in Auto Scaling. The scenario didn’t mention that the architecture has a load balancer. Therefore, you should be updating your launch template, not the target group.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html)
- [https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html)

**Check out this AWS Auto Scaling Cheat Sheet:**
- [https://tutorialsdojo.com/aws-auto-scaling/](https://tutorialsdojo.com/aws-auto-scaling/)

---

## Câu 46 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A data analytics company is setting up an innovative checkout-free grocery store. The Solutions Architect developed a real-time monitoring application that uses smart sensors to collect the items that the customers are getting from the grocery’s refrigerators and shelves, then automatically deduct those items from customer accounts. The company wants to analyze the items that are frequently being bought and store the results in Amazon S3 for durable storage to determine the purchase behavior of its customers.

Which of the following must be used to easily capture, transform, and load streaming data into S3, Amazon OpenSearch Service, and Splunk?

### Các lựa chọn (Choices)
- [x] **A.** Amazon Data Firehose
- [ ] **B.** Amazon Redshift
- [ ] **C.** Amazon DynamoDB Streams
- [ ] **D.** Amazon SQS

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Amazon Data Firehose

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon Data Firehose is the easiest way to load streaming data into data stores and analytics tools. It can capture, transform, and load streaming data into Amazon S3, Amazon Redshift, Amazon OpenSearch Service, and Splunk, enabling near real-time analytics with existing business intelligence tools and dashboards you are already using today.

It is a fully managed service that automatically scales to match the throughput of your data and requires no ongoing administration. It can also batch, compress, and encrypt the data before loading it, minimizing the amount of storage used at the destination and increasing security.

In the diagram below, you gather the data from your smart refrigerators and use Data Firehouse to prepare and load the data. S3 will be used as a method of durably storing the data for analytics and the eventual ingestion of data for output using analytical tools.

![Amazon Data Firehose](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/td-data-firehose.png)

You can use Amazon Data Firehose in conjunction with Amazon Kinesis Data Streams if you need to implement real-time processing of streaming big data. Kinesis Data Streams provides an ordering of records, as well as the ability to read and/or replay records in the same order to multiple Amazon Kinesis Applications. The Amazon Kinesis Client Library (KCL) delivers all records for a given partition key to the same record processor, making it easier to build multiple applications reading from the same Amazon Kinesis data stream (for example, to perform counting, aggregation, and filtering).

Amazon Simple Queue Service (Amazon SQS) is different from Amazon Data Firehose. SQS offers a reliable, highly scalable hosted queue for storing messages as they travel between computers. Amazon SQS lets you easily move data between distributed application components and helps you build applications in which messages are processed independently (with message-level ack/fail semantics), such as automated workflows. Amazon Data Firehose is primarily used to load streaming data into data stores and analytics tools.

Hence, the correct answer is: **Amazon Data Firehose.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Amazon DynamoDB Streams** is incorrect. This is just a feature in Amazon DynamoDB that lets you capture changes to items stored in a DynamoDB table. While it does provide a stream of changes, it’s not designed to transform and load this data into services like S3 or OpenSearch directly.

- **Amazon Redshift** is incorrect because this is mainly used for data warehousing, making it simple and cost-effective to analyze your data across your data warehouse and data lake. It does not meet the requirement of being able to load and stream data into data stores for analytics. You have to use Data Firehose instead.

- **Amazon SQS** is incorrect. This is just a message queuing service. It’s not capable of capturing, transforming, and load streaming data into Amazon S3, Amazon OpenSearch Service, and Splunk.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/firehose/](https://aws.amazon.com/firehose/)
- [https://aws.amazon.com/kinesis/data-streams/faqs/](https://aws.amazon.com/kinesis/data-streams/faqs/)

**Check out this Amazon Kinesis Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-kinesis/](https://tutorialsdojo.com/amazon-kinesis/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c02/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c02/)

---

## Câu 47 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A company is hosting an application on EC2 instances that regularly pushes and fetches data in Amazon S3. Due to a change in compliance, the instances need to be moved on a private subnet. Along with this change, the company wants to lower the data transfer costs by configuring its AWS resources.

How can this be accomplished in the MOST cost-efficient manner?

### Các lựa chọn (Choices)
- [ ] **A.** Create an Amazon S3 interface endpoint to enable a connection between the instances and Amazon S3.
- [ ] **B.** Set up a NAT Gateway in the public subnet to connect to Amazon S3.
- [ ] **C.** Set up an AWS Transit Gateway to access Amazon S3.
- [x] **D.** Create an Amazon S3 gateway endpoint to enable a connection between the instances and Amazon S3.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Create an Amazon S3 gateway endpoint to enable a connection between the instances and Amazon S3.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
VPC endpoints for Amazon S3 simplify access to S3 from within a VPC by providing configurable and highly reliable secure connections to S3 that do not require an internet gateway or Network Address Translation (NAT) device. When you create an S3 VPC endpoint, you can attach an endpoint policy to it that controls access to Amazon S3.

You can use two types of VPC endpoints to access Amazon S3: **gateway endpoints and interface endpoints** . A gateway endpoint is a gateway that you specify in your route table to access Amazon S3 from your VPC over the AWS network. Interface endpoints extend the functionality of gateway endpoints by using private IP addresses to route requests to Amazon S3 from within your VPC, on-premises, or from a different AWS Region. Interface endpoints are compatible with gateway endpoints. If you have an existing gateway endpoint in the VPC, you can use both types of endpoints in the same VPC.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-s3-vpc-endpoint.PNG)

There is no additional charge for using gateway endpoints. However, standard charges for data transfer and resource usage still apply.

Hence, the correct answer is: **Create an Amazon S3 gateway endpoint to enable a connection between the instances and Amazon S3.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Set up a NAT Gateway in the public subnet to connect to Amazon S3** is incorrect. This will enable a connection between the private EC2 instances and Amazon S3 but it is not the most cost-efficient solution. NAT Gateways are charged on an hourly basis even for idle time.

- The option that says: **Create an Amazon S3 interface endpoint to enable a connection between the instances and Amazon S3** is incorrect. This is also a possible solution but it’s not the most cost-effective solution. You pay an hourly rate for every provisioned Interface endpoint.

- The option that says: **Set up an AWS Transit Gateway to access Amazon S3** is incorrect because this service is mainly used for connecting VPCs and on-premises networks through a central hub.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/privatelink-interface-endpoints.html)
- [https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway.html](https://docs.aws.amazon.com/vpc/latest/privatelink/vpce-gateway.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 48 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A Solutions Architect is working for a financial company. The manager wants to automatically transfer obsolete data from the Amazon S3 bucket to a low-cost storage system in AWS after a certain period.

What is the best solution the Architect can provide?

### Các lựa chọn (Choices)
- [x] **A.** Use Lifecycle Policies in S3 to move obsolete data to the S3 Glacier storage class.
- [ ] **B.** Use an Amazon EC2 instance and a scheduled job to transfer the obsolete data from their S3 location to S3 Glacier storage class.
- [ ] **C.** Use Amazon SQS.
- [ ] **D.** Use Amazon Timestream.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Use Lifecycle Policies in S3 to move obsolete data to the S3 Glacier storage class.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
In this scenario, you can use lifecycle policies in S3 to automatically move obsolete data to the S3 Glacier storage class.

Lifecycle configuration in Amazon S3 enables you to specify the lifecycle management of objects in a bucket. The configuration is a set of one or more rules, where each rule defines an action for Amazon S3 to apply to a group of objects.

![Lifecycle configuration in Amazon S3](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Lifecycle configuration in Amazon S3-09OCT2026.png)

With S3 Lifecycle configuration rules, you can tell Amazon S3 to transition objects to less-expensive storage classes, archive them, or delete them. For example:

– If you upload periodic logs to a bucket, your application might need them for a week or a month. After that, you might want to delete them.

– Some documents are frequently accessed for a limited period of time. After that, they are infrequently accessed. At some point, you might not need real-time access to them, but your organization or regulations might require you to archive them for a specific period. After that, you can delete them.

– You might upload some types of data to Amazon S3 primarily for archival purposes. For example, you might archive digital media, financial, and healthcare records, raw genomics sequence data, long-term database backups, and data that must be retained for regulatory compliance.

Hence, the correct answer is: **Use Lifecycle Policies in S3 to move obsolete data to the S3 Glacier storage class.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use an Amazon EC2 instance and a scheduled job to transfer the obsolete data from their S3 location to S3 Glacier storage class** is incorrect because you don’t need to create a scheduled job in EC2, as you can simply use the lifecycle policy in S3.

- The option that says: **Use Amazon SQS** is incorrect because SQS is not a storage service. Amazon SQS is primarily used to decouple your applications by queueing the incoming requests of your application.

- The option that says: **Use Amazon Timestream** is incorrect. While Amazon Timestream is great for storing and analyzing time-series data, it doesn’t directly address the requirement of moving data from S3 to a lower-cost storage option based on the age of the data. The best solution for this specific use case would be to use Lifecycle Policies in S3 to move obsolete data to the S3 Glacier storage class, which is a low-cost storage service in AWS. This can be done by setting up some rules (e.g., which folder) and it will transition the data.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [http://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html](http://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html)
- [https://aws.amazon.com/blogs/aws/archive-s3-to-glacier/](https://aws.amazon.com/blogs/aws/archive-s3-to-glacier/)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

**Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**
- [https://tutorialsdojo.com/aws-certified-solutions-architect-associate/](https://tutorialsdojo.com/aws-certified-solutions-architect-associate/)

---

## Câu 49 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
An online stock trading application stores financial data in an Amazon S3 bucket, with a lifecycle policy that moves older data to Glacier every month. A strict compliance requirement mandates that a surprise audit can occur at any time, and the required data must be retrievable in under 15 minutes under all circumstances. The manager has instructed that retrieval capacity be available when needed and should support up to 150 MB/s of retrieval throughput.

Which of the following will meet the given requirement? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Specify a range, or portion, of the financial data archive to retrieve.
- [x] **B.** Use Expedited Retrieval to access the financial data.
- [ ] **C.** Use Bulk Retrieval to access the financial data.
- [ ] **D.** Use Standard Retrieval for accessing the financial data.
- [x] **E.** Purchase provisioned retrieval capacity.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, E**
> - **B.** Use Expedited Retrieval to access the financial data.
> - **E.** Purchase provisioned retrieval capacity.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Expedited retrievals** allow you to quickly access your data when occasional urgent requests for a subset of archives are required. For all but the largest archives (250 MB+), data accessed using Expedited retrievals are typically made available within 1–5 minutes. Provisioned Capacity ensures that retrieval capacity for Expedited retrievals is available when you need it.

To make an Expedited, Standard, or Bulk retrieval, set the Tier parameter in the Initiate Job (POST jobs) REST API request to the option you want, or the equivalent in the AWS CLI or AWS SDKs. If you have purchased provisioned capacity, then all expedited retrievals are automatically served through your provisioned capacity.

 **Provisioned capacity** ensures that your retrieval capacity for expedited retrievals is available when you need it. Each unit of capacity provides that at least three expedited retrievals can be performed every five minutes and provides up to 150 MB/s of retrieval throughput. You should purchase provisioned retrieval capacity if your workload requires highly reliable and predictable access to a subset of your data in minutes. Without provisioned capacity Expedited retrievals are accepted, except for rare situations of unusually high demand. However, if you require access to Expedited retrievals under all circumstances, you must purchase provisioned retrieval capacity.

![Amazon S3 Glacier - Data retrieval settings](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/glacier-retrieval-settings-15MAY2025.png)

Hence, the correct answers are:

 **– Use Expedited Retrieval to access the financial data.**

 **– Purchase provisioned retrieval capacity.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use Standard Retrieval for accessing the financial data** is incorrect because standard retrieval typically takes 3–5 hours, which does not meet the audit’s rapid retrieval time requirement.

- The option that says: **Use Bulk Retrieval to access the financial data** is incorrect because bulk retrievals typically complete within 5–12 hours hence, this does not satisfy the requirement of retrieving the data within 15 minutes. The provisioned capacity option is also not compatible with Bulk retrievals.

- The option that says: **Specify a range, or portion, of the financial data archive to retrieve** is incorrect because using ranged archive retrievals is not enough to meet the requirement of retrieving the whole archive in the given timeframe. In addition, it does not primarily provide additional retrieval capacity which is what the provisioned capacity option can offer.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/amazonglacier/latest/dev/downloading-an-archive-two-steps.html](https://docs.aws.amazon.com/amazonglacier/latest/dev/downloading-an-archive-two-steps.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/userguide/restoring-objects-retrieval-options.html](https://docs.aws.amazon.com/AmazonS3/latest/userguide/restoring-objects-retrieval-options.html)

**Check out this Amazon S3 Glacier Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-glacier/](https://tutorialsdojo.com/amazon-glacier/)

---

## Câu 50 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A Solutions Architect is unable to connect to the newly deployed EC2 instance via SSH using a home computer. However, the Architect was able to successfully access other existing instances in the VPC without any issues.

Which of the following should the Architect check and possibly correct to restore connectivity?

### Các lựa chọn (Choices)
- [x] **A.** Configure the Security Group of the EC2 instance to permit ingress traffic over port 22 from your IP.
- [ ] **B.** Configure the Network Access Control List of your VPC to permit ingress traffic over port 22 from your IP.
- [ ] **C.** Configure the Security Group of the EC2 instance to permit ingress traffic over port 3389 from your IP.
- [ ] **D.** Use Amazon Data Lifecycle Manager.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Configure the Security Group of the EC2 instance to permit ingress traffic over port 22 from your IP.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
When connecting to your EC2 instance via SSH, you need to ensure that port 22 is allowed on the security group of your EC2 instance.

A **security group** acts as a virtual firewall that controls the traffic for one or more instances. When you launch an instance, you associate one or more security groups with the instance. You add rules to each security group that allow traffic to or from its associated instances. You can modify the rules for a security group at any time; the new rules are automatically applied to all instances that are associated with the security group.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/Picture5.png)

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Using Amazon Data Lifecycle Manager** is incorrect because this is primarily used to manage the lifecycle of your AWS resources and not to allow certain traffic to go through.

- **Configuring the Network Access Control List of your VPC to permit ingress traffic over port 22 from your IP** is incorrect because this is not necessary in this scenario as it was specified that you were able to connect to other EC2 instances. In addition, Network ACL is much suitable to control the traffic that goes in and out of your entire VPC and not just on one EC2 instance.

- **Configure the Security Group of the EC2 instance to permit ingress traffic over port 3389 from your IP** is incorrect because this is relevant to RDP and not SSH.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)

**Check out these AWS Comparison of Services Cheat Sheets:**
- [https://tutorialsdojo.com/comparison-of-aws-services/](https://tutorialsdojo.com/comparison-of-aws-services/)

---

## Câu 51 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A Solutions Architect is working for a large insurance firm. To maintain compliance with HIPAA laws, all data that is backed up or stored on Amazon S3 needs to be encrypted at rest.

Which encryption methods can be employed, assuming S3 is being used for storing financial-related data? (Select TWO.)

### Các lựa chọn (Choices)
- [x] **A.** Enable SSE on an S3 bucket to make use of AES-256 encryption
- [ ] **B.** Store the data in encrypted EBS snapshots
- [ ] **C.** Use AWS Shield to protect your data at rest
- [ ] **D.** Store the data on EBS volumes with encryption enabled instead of using Amazon S3
- [x] **E.** Encrypt the data using your own encryption keys then copy the data to Amazon S3 over HTTPS endpoints.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A, E**
> - **A.** Enable SSE on an S3 bucket to make use of AES-256 encryption
> - **E.** Encrypt the data using your own encryption keys then copy the data to Amazon S3 over HTTPS endpoints.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Data protection refers to protecting data while in-transit (as it travels to and from Amazon S3) and at rest (while it is stored on disks in Amazon S3 data centers). You can protect data in transit by using SSL or by using client-side encryption. You have the following options for protecting data at rest in Amazon S3.

 **Use Server-Side Encryption** – You request Amazon S3 to encrypt your object before saving it on disks in its data centers and decrypt it when you download the objects.

 **Use Client-Side Encryption** – You can encrypt data client-side and upload the encrypted data to Amazon S3. In this case, you manage the encryption process, the encryption keys, and related tools.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/s3_sse_customer_key_2.png)

Hence, the following options are the correct answers:

 **– Enable SSE on an S3 bucket to make use of AES-256 encryption**

 **– Encrypt the data using your own encryption keys then copy the data to Amazon S3 over HTTPS endpoints. This refers to using a Server-Side Encryption with Customer-Provided Keys (SSE-C).**

 **Storing the data in encrypted EBS snapshots** and **storing the data on EBS volumes with encryption enabled instead of using Amazon S3** are both incorrect because all these options are for protecting your data in your EBS volumes. Note that an S3 bucket does not use EBS volumes to store your data.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Using AWS Shield to protect your data at rest** is incorrect because AWS Shield is mainly used to protect your entire VPC against DDoS attacks.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html)
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---

## Câu 52 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
A solutions architect is managing an application that runs on a Windows EC2 instance with an attached Amazon FSx for Windows File Server. To save cost, management has decided to stop the instance during off-hours and restart it only when needed. It has been observed that the application takes several minutes to become fully operational which impacts productivity.

How can the solutions architect speed up the instance’s loading time without driving the cost up?

### Các lựa chọn (Choices)
- [ ] **A.** Enable the hibernation mode on the EC2 instance.
- [x] **B.** Migrate the application to an EC2 instance with hibernation enabled.
- [ ] **C.** Migrate the application to a Linux-based EC2 instance.
- [ ] **D.** Disable the Instance Metadata Service to reduce the things that need to be loaded at startup.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Migrate the application to an EC2 instance with hibernation enabled.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Hibernation provides the convenience of pausing and resuming the instances, saves time by reducing the startup time taken by applications, and saves effort in setting up the environment or applications all over again. Instead of having to rebuild the memory footprint, hibernation allows applications to pick up exactly where they left off.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-ec2-hibernation.jpg)

While the instance is in hibernation, you pay only for the EBS volumes and Elastic IP Addresses attached to it; there are no other hourly charges (just like any other stopped instance).

Therefore, the correct answer is: **Migrate the application to an EC2 instance with hibernation enabled.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Migrate the application to a Linux-based EC2 instance** is incorrect. This does not guarantee a faster load time. Moreover, it is a risky thing to do as the application might have dependencies tied to the previous operating system that won’t work on a different OS.

- The option that says: **Enable the hibernation mode on the EC2 instance** is incorrect. It is not possible to enable or disable hibernation for an instance after it has been launched.

- The option that says: **Disable the instance metadata service to reduce the things that need to be loaded at startup** is incorrect. This won’t affect the startup load time at all. The Instance Metadata Service is just a service that you can access over the network from within an EC2 instance.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/about-aws/whats-new/2019/10/amazon-ec2-hibernation-now-available-on-windows/](https://aws.amazon.com/about-aws/whats-new/2019/10/amazon-ec2-hibernation-now-available-on-windows/)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enabling-hibernation.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enabling-hibernation.html)
- [https://aws.amazon.com/blogs/aws/new-hibernate-your-ec2-instances/](https://aws.amazon.com/blogs/aws/new-hibernate-your-ec2-instances/)

**Check out this Amazon EC2 Cheat sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 53 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company is setting up a cloud architecture for an international money transfer service to be deployed in AWS which will have thousands of users around the globe. The service should be available 24/7 to avoid any business disruption and should be resilient enough to handle the outage of an entire AWS region. To meet this requirement, the Solutions Architect has deployed their AWS resources to multiple AWS Regions. He needs to use Route 53 and configure it to set all of the resources to be available all the time as much as possible. When a resource becomes unavailable, Route 53 should detect that it’s unhealthy and stop including it when responding to queries.

Which of the following is the most fault-tolerant routing configuration that the Solutions Architect should use in this scenario?

### Các lựa chọn (Choices)
- [ ] **A.** Configure an Active-Passive Failover with Multiple Primary and Secondary Resources.
- [ ] **B.** Configure an Active-Passive Failover with Weighted Records.
- [x] **C.** Configure an Active-Active Failover with Weighted routing policy.
- [ ] **D.** Configure an Active-Active Failover with One Primary and One Secondary Resource.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Configure an Active-Active Failover with Weighted routing policy.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You can use **Route 53 health checking** to configure active-active and active-passive failover configurations. You configure active-active failover using any routing policy (or combination of routing policies) other than failover, and you configure active-passive failover using the failover routing policy.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS-Route53-Weighted.PNG)

 **Active-Active Failover**

Use this failover configuration when you want all of your resources to be available the majority of the time. When a resource becomes unavailable, Route 53 can detect that it’s unhealthy and stop including it when responding to queries.

In active-active failover, all the records that have the same name, the same type (such as A or AAAA), and the same routing policy (such as weighted or latency) are active unless Route 53 considers them unhealthy. Route 53 can respond to a DNS query using any healthy record.

Hence, **Configuring an Active-Active Failover with Weighted routing policy** is correct.

 **Active-Passive Failover**

Use an active-passive failover configuration when you want a primary resource or group of resources to be available the majority of the time and you want a secondary resource or group of resources to be on standby in case all the primary resources become unavailable. When responding to queries, Route 53 includes only the healthy primary resources. If all the primary resources are unhealthy, Route 53 begins to include only the healthy secondary resources in response to DNS queries.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Configuring an Active-Passive Failover with Weighted Records** and **configuring an Active-Passive Failover with Multiple Primary and Secondary Resources** are incorrect because an Active-Passive Failover is mainly used when you want a primary resource or group of resources to be available most of the time and you want a secondary resource or group of resources to be on standby in case all the primary resources become unavailable. In this scenario, all of your resources should be available all the time as much as possible which is why you have to use an Active-Active Failover instead.

- **Configuring an Active-Active Failover with One Primary and One Secondary Resource** is incorrect because you cannot set up an Active-Active Failover with One Primary and One Secondary Resource. Remember that an Active-Active Failover uses all available resources all the time without a primary nor a secondary resource.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-types.html](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-types.html)
- [https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html)
- [https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring.html](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring.html)

**Check out this Amazon Route 53 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-route-53/](https://tutorialsdojo.com/amazon-route-53/)

---

## Câu 54 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Cost-Optimized Architectures*

### Đề bài (Question)
The media company that you are working for has a video transcoding application running on Amazon EC2. Each EC2 instance polls a queue to find out which video should be transcoded, and then runs a transcoding process. If this process is interrupted, the video will be transcoded by another instance based on the queuing system. This application has a large backlog of videos which need to be transcoded. Your manager would like to reduce this backlog by adding more EC2 instances, however, these instances are only needed until the backlog is reduced.

In this scenario, which type of Amazon EC2 instance is the most cost-effective type to use?

### Các lựa chọn (Choices)
- [ ] **A.** On-demand instances
- [ ] **B.** Reserved instances
- [ ] **C.** Dedicated instances
- [x] **D.** Spot instances

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Spot instances

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
You require an instance that will be used not as a primary server but as a spare compute resource to augment the transcoding process of your application. These instances should also be terminated once the backlog has been significantly reduced. In addition, the scenario mentions that if the current process is interrupted, the video can be transcoded by another instance based on the queuing system. This means that the application can gracefully handle an unexpected termination of an EC2 instance, like in the event of a Spot instance termination when the Spot price is greater than your set maximum price. Hence, an Amazon EC2 Spot instance is the best and cost-effective option for this scenario.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/spot_lifecycle.png)

Amazon EC2 Spot instances are **spare** compute capacity in the AWS cloud available to you at steep discounts compared to On-Demand prices. EC2 Spot enables you to optimize your costs on the AWS cloud and scale your application’s throughput up to 10X for the same budget. By simply selecting Spot when launching EC2 instances, you can save up to 90% on On-Demand prices. The only difference between On-Demand instances and Spot Instances is that Spot instances can be interrupted by EC2 with two minutes of notification when the EC2 needs the capacity back.

You can specify whether Amazon EC2 should hibernate, stop, or terminate Spot Instances when they are interrupted. You can choose the interruption behavior that meets your needs.

Take note that there is no *“bid price”* anymore for Spot EC2 instances **since March 2018** . You simply have to set your **maximum price** instead.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- **Reserved instances** and **Dedicated instances** are incorrect as both do not act as spare compute capacity.

- **On-demand instances** is a valid option but a Spot instance is much cheaper than On-Demand.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html)
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/how-spot-instances-work.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/how-spot-instances-work.html)
- [https://aws.amazon.com/blogs/compute/new-amazon-ec2-spot-pricing](https://aws.amazon.com/blogs/compute/new-amazon-ec2-spot-pricing)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 55 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A Data Analyst in a financial company is tasked to provide insights on stock market trends to the company’s clients. The company uses AWS Glue extract, transform, and load (ETL) jobs in daily report generation, which involves fetching data from an Amazon S3 bucket. The analyst discovered that old data from previous runs were being reprocessed, causing the jobs to take longer to complete.

Which solution would resolve the issue in the most operationally efficient way?

### Các lựa chọn (Choices)
- [ ] **A.** Parallelize the job by splitting the dataset into smaller partitions and processing them simultaneously using multiple EC2 instances.
- [ ] **B.** Create a Lambda function that removes any data already processed. Then, use Amazon EventBridge (Amazon CloudWatch Events) to trigger this function whenever the ETL job’s status switches to `SUCCEEDED`.
- [x] **C.** Enable job bookmark for the ETL job.
- [ ] **D.** Increase the size of the dataset used in the job to speed up the extraction and analysis process.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C**
> - **C.** Enable job bookmark for the ETL job.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**AWS Glue** is a powerful tool that enables data engineers to build and manage ETL (extract, transform, load) pipelines for processing and analyzing large amounts of data. With AWS Glue, you can create and manage jobs that extract data from various sources, transform it into the desired format, and load it into a target data store.

One of the features that make AWS Glue especially useful is job bookmarking. Job bookmarking is a mechanism that allows AWS Glue to keep track of where a job is left off in case it gets interrupted or fails for any reason. This way, when the job is restarted, it can pick up from where it left off instead of starting from scratch.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS-Glue_Event-Driven-ETL-06-07-2023.png)

Job bookmarking works by storing the state of a job’s progress in a persistent data store separate from the job itself. AWS Glue can resume a job from where it left off, even if the job, environment, or underlying data have changed. Job bookmarking is especially useful when dealing with large datasets or long-running jobs, as it helps save time and resources by avoiding unnecessary processing.

In this scenario, the company can benefit from enabling job bookmarking for the ETL job to improve the data extraction and analysis efficiency. Job bookmarking keeps track of the last processed data, allowing succeeding jobs to run only to process new data. This eliminates the need to reprocess old data and significantly reduces processing time and resource requirements.

Hence, the correct answer is: **Enable job bookmark for the ETL job.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Increase the size of the dataset used in the job to speed up the extraction and analysis process** is incorrect. Increasing the dataset size will likely result in longer processing times and increased resource requirements. Therefore, it can aggravate the existing inefficiency problem rather than resolve it.

- The option that says: **Parallelize the job by splitting the dataset into smaller partitions and processing them simultaneously using multiple EC2 instances** is incorrect. This option requires additional AWS resources because of its complexity in partitioning the dataset, managing parallel processing, and coordinating the results. Moreover, this would only speed up the processing of both new and old data; it won’t resolve the issue of reprocessing old data.

- The option that says: **Create a Lambda function that removes any data already processed. Then, use Amazon EventBridge (Amazon CloudWatch Events) to trigger this function whenever the ETL job’s status switches to `SUCCEEDED`** is incorrect. While removing processed data can help optimize storage, it introduces additional complexity and may not be fully efficient if the process of identifying which data has already been processed is not foolproof. Moreover, if a job fails and needs to be rerun, the data for that job might have been already removed, resulting in inconsistencies or incomplete data processing.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/glue/latest/dg/what-is-glue.html](https://docs.aws.amazon.com/glue/latest/dg/what-is-glue.html)
- [https://docs.aws.amazon.com/glue/latest/dg/monitor-continuations.html](https://docs.aws.amazon.com/glue/latest/dg/monitor-continuations.html)

**Check out these AWS Glue Cheat Sheets:**
- [https://tutorialsdojo.com/aws-glue/](https://tutorialsdojo.com/aws-glue/)

---

## Câu 56 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company plans to use a durable storage service to store on-premises database backups to the AWS Cloud. To move the backup data, the company needs a service that can store and retrieve objects via standard file storage protocols for quick recovery.

Which of the following options will meet this requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Use Amazon EBS volumes to store all the backup data and attach it to an Amazon EC2 instance.
- [ ] **B.** Use the AWS Storage Gateway volume gateway to store the backup data and directly access it using Amazon S3 API actions.
- [ ] **C.** Use AWS DataSync to directly transfer the backup data to Amazon S3 Glacier.
- [x] **D.** Use the AWS Storage Gateway file gateway to store all the backup data in Amazon S3.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Use the AWS Storage Gateway file gateway to store all the backup data in Amazon S3.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**File Gateway** presents a file-based interface to Amazon S3, which appears as a network file share. It enables you to store and retrieve Amazon S3 objects through standard file storage protocols. File Gateway allows your existing file-based applications or devices to use secure and durable cloud storage without needing to be modified. With File Gateway, your configured S3 buckets will be available as Network File System (NFS) mount points or Server Message Block (SMB) file shares.

![How File Gateway works](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/File-Gateway-How-it-Works.6a5ce3c54688864e5b951df9cb8732fc4f2926b4.png)

To store the backup data from on-premises to a durable cloud storage service, you can use File Gateway to store and retrieve objects through standard file storage protocols (SMB or NFS). File Gateway enables your existing file-based applications, devices, and workflows to use Amazon S3, without modification. File Gateway securely and durably stores both file contents and metadata as objects while providing your on-premises applications low-latency access to cached data.

Hence, the correct answer is: **Use the AWS Storage Gateway file gateway to store all the backup data in Amazon S3** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use the AWS Storage Gateway volume gateway to store the backup data and directly access it using Amazon S3 API actions** is incorrect. Although this is a possible solution, you cannot simply access the volume gateway using Amazon S3 APIs. You should use File Gateway to access your data in Amazon S3.

- The option that says: **Use Amazon EBS volumes to store all the backup data and attached it to an Amazon EC2 instance** is incorrect. Take note that in the scenario, you are required to store the backup data in a durable storage service. An Amazon EBS volume is not highly durable like Amazon S3. Also, file storage protocols such as NFS or SMB are not directly supported by EBS.

- The option that says: **Use AWS DataSync to directly transfer the backup data to Amazon S3 Glacier** is incorrect because DataSync is primarily for data transfer, not ongoing file-protocol access through NFS or SMB. Also, S3 Glacier is intended for archival storage, not quick recovery.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/storagegateway/faqs/](https://aws.amazon.com/storagegateway/faqs/)
- [https://aws.amazon.com/s3/storage-classes/](https://aws.amazon.com/s3/storage-classes/)

**Check out this AWS Storage Gateway Cheat Sheet:**
- [https://tutorialsdojo.com/aws-storage-gateway/](https://tutorialsdojo.com/aws-storage-gateway/)

---

## Câu 57 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
A large telecommunications company needs to run analytics against all combined log files from the Application Load Balancer as part of the regulatory requirements.

Which AWS services can be used together to collect logs and then easily perform log analysis?

### Các lựa chọn (Choices)
- [x] **A.** Amazon S3 for storing ELB log files and Amazon Athena for analyzing the log files.
- [ ] **B.** Amazon DynamoDB for storing and EC2 for analyzing the logs.
- [ ] **C.** Amazon EC2 with EBS volumes for storing and analyzing the log files.
- [ ] **D.** Amazon S3 for storing the ELB log files and an EC2 instance for analyzing the log files using a custom-built application.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **A**
> - **A.** Amazon S3 for storing ELB log files and Amazon Athena for analyzing the log files.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Access logging is an optional feature of Elastic Load Balancing that is disabled by default. After you enable access logging for your load balancer, Elastic Load Balancing captures the logs and stores them in the Amazon S3 bucket that you specify as compressed files. You can disable access logging at any time.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/AWS-Athena-Redshift-Glue.png)

 **Amazon Athena** is an interactive query service that makes it easy to analyze data directly from Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to set up or manage and you can start analyzing your data immediately. You don’t even need to load your data into Athena, or have complex ETL processes. Athena works directly with data stored in S3.

In this scenario, it is best to use a combination of Amazon S3 and Amazon Athena: Amazon S3 for storing ELB log files and Amazon Athena for analyzing the log files. Access logging in the ELB is stored in Amazon S3, which means that the following are valid options:

– Amazon S3 for storing the ELB log files and an EC2 instance for analyzing the log files using a custom-built application.

– Amazon S3 for storing ELB log files and Amazon Athena for analyzing the log files.

However, log analysis can be automatically provided by Amazon Athena, which is more economical than building a custom-built log analysis application and hosting it in EC2. Hence, the option that says: **Amazon S3 for storing ELB log files and Amazon Athena for analyzing the log files** is the best answer between the two.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Amazon DynamoDB for storing and EC2 for analyzing the logs** is incorrect because DynamoDB is a noSQL database solution of AWS. It would be inefficient to store logs in DynamoDB while using EC2 to analyze them.

- The option that says: **Amazon EC2 with EBS volumes for storing and analyzing the log files** is incorrect because using EC2 with EBS would be costly, and EBS might not provide the most durable storage for your logs, unlike S3.

- The option that says: **Amazon S3 for storing the ELB log files and an EC2 instance for analyzing the log files using a custom-built application** is incorrect because using EC2 to analyze logs would be inefficient and expensive since you will have to program the analyzer yourself.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/blogs/big-data/analyzing-data-in-s3-using-amazon-athena/](https://aws.amazon.com/blogs/big-data/analyzing-data-in-s3-using-amazon-athena/)
- [https://docs.aws.amazon.com/athena/latest/ug/application-load-balancer-logs.html](https://docs.aws.amazon.com/athena/latest/ug/application-load-balancer-logs.html)
- [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html)

**Check out this Amazon Athena Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-athena/](https://tutorialsdojo.com/amazon-athena/)

**Check out this AWS Elastic Load Balancing (ELB) Cheat Sheet:**
- [https://tutorialsdojo.com/aws-elastic-load-balancing-elb/](https://tutorialsdojo.com/aws-elastic-load-balancing-elb/)

---

## Câu 58 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A tech startup is launching an on-demand food delivery platform using an Amazon ECS cluster with an AWS Fargate serverless compute engine and Amazon Aurora. It is expected that the database read queries will significantly increase in the coming weeks. A Solutions Architect recently launched two Read Replicas to the database cluster to improve the platform’s scalability. The team considered using lazy loading to cache results, but that does not balance read traffic across replicas.

Which of the following is the MOST suitable configuration that the Architect should implement to load balance all of the incoming read requests equally to the two Read Replicas?

### Các lựa chọn (Choices)
- [ ] **A.** Create a new Network Load Balancer to evenly distribute the read queries to the Read Replicas of the Aurora database.
- [x] **B.** Use the built-in Reader endpoint of the Aurora database.
- [ ] **C.** Enable Aurora Parallel Query.
- [ ] **D.** Use the built-in Cluster endpoint of the Aurora database.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Use the built-in Reader endpoint of the Aurora database.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon Aurora** typically involves a cluster of DB instances instead of a single instance. Each connection is handled by a specific DB instance. When you connect to an Aurora cluster, the hostname and port that you specify point to an intermediate handler called an *endpoint*. Aurora uses the endpoint mechanism to abstract these connections. Thus, you don’t have to hardcode all the hostnames or write your own logic for load-balancing and rerouting connections when some DB instances aren’t available.

For certain Aurora tasks, different instances or groups of instances perform different roles. For example, the primary instance handles all data definition language (DDL) and data manipulation language (DML) statements. Up to 15 Aurora Replicas handle read-only query traffic.

Using endpoints, you can map each connection to the appropriate instance or group of instances based on your use case. For example, to perform DDL statements, you can connect to whichever instance is the primary instance. To perform queries, you can connect to the reader endpoint, with Aurora automatically performing load-balancing among all the Aurora Replicas. For clusters with DB instances of different capacities or configurations, you can connect to custom endpoints associated with different subsets of DB instances. For diagnosis or tuning, you can connect to a specific instance endpoint to examine details about a specific DB instance.

![Amazon Aurora Database interface highlighting a Reader Endpoint.](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-01-21_05-42-25-d8c9d3cf71ef799dc5fffa57e7e2928d.png)

A *reader endpoint* for an Aurora DB cluster provides load-balancing support for read-only connections to the DB cluster. Use the reader endpoint for read operations, such as queries. By processing those statements on the read-only Aurora Replicas, this endpoint reduces the overhead on the primary instance. It also helps the cluster to scale the capacity to handle simultaneous `SELECT` queries, proportional to the number of Aurora Replicas in the cluster. Each Aurora DB cluster has one reader endpoint.

If the cluster contains one or more Aurora Replicas, the reader endpoint load balances each connection request among the Aurora Replicas. In that case, you can only perform read-only statements, such as `SELECT` in that session. If the cluster only contains a primary instance and no Aurora Replicas, the reader endpoint connects to the primary instance. In that case, you can perform write operations through the endpoint.

Hence, the correct answer is: **Use the built-in Reader endpoint of the Aurora database.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use the built-in Cluster endpoint of the Aurora database** is incorrect because a cluster endpoint (also known as a writer endpoint) simply connects to the current primary DB instance for that DB cluster. This endpoint can perform write operations in the database, such as DDL statements, which is perfect for handling production traffic, but not suitable for handling queries for reporting, since there will be no write database operations that will be sent.

- The option that says: **Enable Aurora Parallel Query** is incorrect because this feature simply enables Amazon Aurora to push down and distribute the computational load of a single query across thousands of CPUs in Aurora’s storage layer. Take note that it does not load balance all of the incoming read requests equally to the two Read Replicas. With Parallel Query, query processing is pushed down to the Aurora storage layer. The query gains a large amount of computing power, and it needs to transfer far less data over the network. In the meantime, the Aurora database instance can continue serving transactions with much less interruption. This way, you can run transactional and analytical workloads alongside each other in the same Aurora database, while maintaining high performance.

- The option that says: **Create a new Network Load Balancer to evenly distribute the read queries to the Read Replicas of the Aurora database** is incorrect because a Network Load Balancer is not a suitable service/component to use for this requirement, since an NLB is primarily used to distribute traffic to servers, not Read Replicas. You have to use the built-in Reader endpoint of the Amazon Aurora database instead.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.Endpoints.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.Endpoints.html)
- [https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.html](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Overview.html)
- [https://aws.amazon.com/rds/aurora/parallel-query/](https://aws.amazon.com/rds/aurora/parallel-query/)

**Check out this Amazon Aurora Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-aurora/](https://tutorialsdojo.com/amazon-aurora/)

---

## Câu 59 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A company is using Amazon VPC that has a CIDR block of `10.31.0.0/27` that is connected to the on-premises data center. There was a requirement to create a Lambda function that will process massive amounts of cryptocurrency transactions every minute and then store the results to EFS. After setting up the serverless architecture and connecting the Lambda function to the VPC, the Solutions Architect noticed an increase in invocation errors with EC2 error types such as `EC2ThrottledException` at certain times of the day.

Which of the following are the possible causes of this issue? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Your VPC does not have a NAT gateway.
- [x] **B.** Your Lambda function exceeds the VPC quota for Elastic Network Interfaces (ENIs) or available IP addresses in the subnet.
- [x] **C.** The Lambda function is placed in a VPC subnet with limited IP address capacity.
- [ ] **D.** The attached IAM execution role of your function does not have the necessary permissions to access the resources of your VPC.
- [ ] **E.** The associated security group of your function does not allow outbound connections.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B, C**
> - **B.** Your Lambda function exceeds the VPC quota for Elastic Network Interfaces (ENIs) or available IP addresses in the subnet.
> - **C.** The Lambda function is placed in a VPC subnet with limited IP address capacity.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**Amazon VPC (Virtual Private Cloud)** is a service that enables you to create a virtual network. This virtual network is logically isolated from other networks, giving you full control over your virtual networking environment. It allows you to choose your own IP address range, create subnets, and configure route tables and network gateways. With VPC, you can securely connect your AWS resources to your on-premises data center.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2019-04-03_03-53-45-3550f2ecbfad29ea60f49fd5ea8d2809.gif)

 **Elastic Network Interfaces (ENIs)** are virtual network interfaces that can be attached to instances or Lambda functions within your VPC. When you configure a Lambda function to access resources within a VPC, AWS Lambda creates and manages ENIs on your behalf. These ENIs are required for communication between the Lambda function and resources such as Amazon EFS within the VPC. Properly configuring your VPC and ensuring you have enough IP addresses and ENI capacity is crucial for your Lambda function to scale effectively without encountering errors like EC2ThrottledException.

 **Service Quotas** within Amazon VPC are important, especially when using AWS Lambda. As your Lambda function scales, it requires additional ENIs to maintain connectivity within the VPC. If your VPC reaches its quota limit for ENIs or IP addresses, your Lambda function may fail to scale, leading to invocation errors. Monitoring and adjusting these quotas and ensuring an optimal VPC configuration are essential to maintaining a stable and scalable serverless architecture.

Hence, the correct answers for this scenario are:

 **– Your Lambda function exceeds the VPC quota for Elastic Network Interfaces (ENIs) or available IP addresses in the subnet.**

 **– The Lambda function is placed in a VPC subnet with limited IP address capacity.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Your VPC does not have a NAT gateway** is incorrect because an issue in the NAT Gateway is unlikely to cause a request throttling issue or produce an `EC2ThrottledException` error in Lambda. As per the scenario, the issue is happening only at certain times of the day, which means that the issue is only intermittent and the function works at other times. We can also conclude that an availability issue is not an issue since the application is already using a highly available NAT Gateway and not just a NAT instance.

- The option that says: **The associated security group of your function does not allow outbound connections** is incorrect because if the associated security group does not allow outbound connections, then the Lambda function will not work at all in the first place. Remember that as per the scenario, the issue only happens intermittently. In addition, Internet traffic restrictions do not usually produce `EC2ThrottledException` errors.

- The option that says: **The attached IAM execution role of your function does not have the necessary permissions to access the resources of your VPC** is incorrect because just as what is explained above, the issue is intermittent and thus, the IAM execution role of the function does have the necessary permissions to access the resources of the VPC since it works at those specific times. In case the issue is indeed caused by a permission problem, then an `EC2AccessDeniedException` the error would most likely be returned and not an `EC2ThrottledException` error.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/lambda/latest/dg/vpc.html](https://docs.aws.amazon.com/lambda/latest/dg/vpc.html)
- [https://aws.amazon.com/premiumsupport/knowledge-center/internet-access-lambda-function/](https://aws.amazon.com/premiumsupport/knowledge-center/internet-access-lambda-function/)
- [https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html](https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html)

**Check out this AWS Lambda Cheat Sheet:**
- [https://tutorialsdojo.com/aws-lambda/](https://tutorialsdojo.com/aws-lambda/)

---

## Câu 60 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A large financial firm needs to set up a Linux bastion host to allow access to the Amazon EC2 instances running in their VPC. For security purposes, only the clients connecting from the corporate external public IP address 175.45.116.100 should have SSH access to the host.

Which is the best option that can meet the customer’s requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Security Group Inbound Rule: Protocol – UDP, Port Range – 22, Source 175.45.116.100/32
- [ ] **B.** Network ACL Inbound Rule: Protocol – TCP, Port Range-22, Source 175.45.116.100/0
- [ ] **C.** Network ACL Inbound Rule: Protocol – UDP, Port Range – 22, Source 175.45.116.100/32
- [x] **D.** Security Group Inbound Rule: Protocol – TCP. Port Range – 22, Source 175.45.116.100/32

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **D**
> - **D.** Security Group Inbound Rule: Protocol – TCP. Port Range – 22, Source 175.45.116.100/32

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A **bastion host** is a special purpose computer on a network specifically designed and configured to withstand attacks. The computer generally hosts a single application, for example, a proxy server, and all other services are removed or limited to reduce the threat to the computer.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/NM_diagram_061316_a.png)

When setting up a bastion host in AWS, you should only allow the individual IP of the client and not the entire network. Therefore, in the **Source,** the proper CIDR notation should be used. The **/32** denotes one IP address, and the **/0** refers to the entire network.

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Security Group Inbound Rule: Protocol – UDP, Port Range – 22, Source 175.45.116.100/32** is incorrect since the SSH protocol uses TCP and port 22, and not UDP.

- The option that says: **Network ACL Inbound Rule: Protocol – UDP, Port Range – 22, Source 175.45.116.100/32** is incorrect since the SSH protocol uses TCP and port 22, and not UDP. Aside from that, network ACLs act as a firewall for your whole VPC subnet while security groups operate on an instance level. Since you are securing an EC2 instance, you should be using security groups.

- The option that says: **Network ACL Inbound Rule: Protocol – TCP, Port Range-22, Source 175.45.116.100/0** is incorrect as it allowed the entire network instead of a single IP to gain access to the host.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**Reference:**
- [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

**Check out this Amazon EC2 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

---

## Câu 61 (Chọn nhiều đáp án (Multiple Choice))
**Domain:** *CSAA – Design High-Performing Architectures*

### Đề bài (Question)
Due to the large volume of query requests, the database performance of an online reporting application significantly slowed down. The Solutions Architect is trying to convince her client to use Amazon RDS Read Replica for their application instead of setting up a Multi-AZ Deployments configuration.

What are two benefits of using Read Replicas over Multi-AZ that the Architect should point out? (Select TWO.)

### Các lựa chọn (Choices)
- [ ] **A.** Allows both read and write operations on the read replica to complement the primary database.
- [ ] **B.** It enhances the read performance of your primary database by increasing its IOPS and accelerates its query processing via AWS Global Accelerator.
- [x] **C.** It elastically scales out beyond the capacity constraints of a single DB instance for read-heavy database workloads.
- [ ] **D.** Provides synchronous replication and automatic failover in the case of Availability Zone service failures.
- [x] **E.** Provides asynchronous replication and improves the performance of the primary database by taking read-heavy database workloads from it.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **C, E**
> - **C.** It elastically scales out beyond the capacity constraints of a single DB instance for read-heavy database workloads.
> - **E.** Provides asynchronous replication and improves the performance of the primary database by taking read-heavy database workloads from it.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
Amazon RDS Read Replicas provide enhanced performance and durability for database (DB) instances. This feature makes it easy to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads.

You can create one or more replicas of a given source DB Instance and serve high-volume application read traffic from multiple copies of your data, thereby increasing aggregate read throughput. Read replicas can also be promoted when needed to become standalone DB instances.

For the MySQL, MariaDB, PostgreSQL, and Oracle database engines, Amazon RDS creates a second DB instance using a snapshot of the source DB instance. It then uses the engines’ native asynchronous replication to update the read replica whenever there is a change to the source DB instance. The read replica operates as a DB instance that allows only read-only connections; applications can connect to a read replica just as they would to any DB instance. Amazon RDS replicates all databases in the source DB instance.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/2020-02-28_01-52-40-4fa2635076a98c44c28464d31d793a21.png)

When you create a read replica for Amazon RDS for MySQL, MariaDB, PostgreSQL, and Oracle, Amazon RDS sets up a secure communications channel using public-key encryption between the source DB instance and the read replica, even when replicating across regions. Amazon RDS establishes any AWS security configurations, such as adding security group entries needed to enable the secure channel.

You can also create read replicas within a Region or between Regions for your Amazon RDS for MySQL, MariaDB, PostgreSQL, and Oracle database instances encrypted at rest with AWS Key Management Service (KMS).

Hence, the correct answers are:

 **– It elastically scales out beyond the capacity constraints of a single DB instance for read-heavy database workloads.**

 **– Provides asynchronous replication and improves the performance of the primary database by taking read-heavy database workloads from it.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Allows both read and write operations on the read replica to complement the primary database** is incorrect, as Read Replicas are primarily used to offload read-only operations from the primary database instance. By default, you can’t do a write operation to your Read Replica.

- The option that says: **Provides synchronous replication and automatic failover in the case of Availability Zone service failures** is incorrect as this is a benefit of Multi-AZ and not of a Read Replica. Moreover, Read Replicas provide an asynchronous type of replication and not synchronous replication.

- The option that says: **It enhances the read performance of your primary database by increasing its IOPS and accelerates its query processing via AWS Global Accelerator** is incorrect because Read Replicas do not do anything to upgrade or increase the read throughput on the primary DB instance per se, but it provides a way for your application to fetch data from replicas. In this way, it improves the overall performance of your entire database tier (and not just the primary DB instance). It doesn’t increase the IOPS nor use AWS Global Accelerator to accelerate the compute capacity of your primary database. AWS Global Accelerator is a networking service not related to RDS that directs user traffic to the nearest application endpoint to the client, thus reducing internet latency and jitter. It simply routes the traffic to the closest edge location via Anycast.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/rds/details/read-replicas/](https://aws.amazon.com/rds/details/read-replicas/)
- [https://aws.amazon.com/rds/features/multi-az/](https://aws.amazon.com/rds/features/multi-az/)

**Check out this Amazon RDS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/](https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/)

---

## Câu 62 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A Solutions Architect is designing a highly available environment for an application. She plans to host the application on EC2 instances within an Auto Scaling Group. One of the conditions requires data stored on root EBS volumes to be preserved if an instance terminates.

What should be done to satisfy the requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Configure ASG to suspend the health check process for each EC2 instance.
- [x] **B.** Set the value of `DeleteOnTermination` attribute of the EBS volumes to `False`.
- [ ] **C.** Enable the Termination Protection option for all EC2 instances.
- [ ] **D.** Use AWS DataSync to replicate root volume data to Amazon S3.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Set the value of `DeleteOnTermination` attribute of the EBS volumes to `False`.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
By default, Amazon EBS root device volumes are automatically deleted when the instance terminates. However, by default, any additional EBS volumes that you attach at launch, or any EBS volumes that you attach to an existing instance persist even after the instance terminates. This behavior is controlled by the volume’s `DeleteOnTermination` attribute, which you can modify.

To preserve the root volume when an instance terminates, change the `DeleteOnTermination` attribute for the root volume to False.

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/amazon-ebs-deleteontermination.PNG)

This EBS attribute can be changed through the AWS Console upon launching the instance or through CLI/API command.

Hence, the correct answer is the option that says: **Set the value of `DeleteOnTermination` attribute of the EBS volumes to `False`** .

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Use AWS DataSync to replicate root volume data to Amazon S3** is incorrect because AWS DataSync does not work with Amazon EBS volumes. DataSync can copy data between Network File System (NFS) shares, Server Message Block (SMB) shares, self-managed object storage, AWS Snowcone, Amazon Simple Storage Service (Amazon S3) buckets, Amazon Elastic File System (Amazon EFS) file systems, and Amazon FSx for Windows File Server file systems.

- The option that says: **Configure ASG to suspend the health check process for each EC2 instance** is incorrect because suspending the health check process will prevent the ASG from replacing unhealthy EC2 instances. This can cause availability issues to the application.

- The option that says: **Enable the Termination Protection option for all EC2 instances** is incorrect. Termination Protection will just prevent your instance from being accidentally terminated using the Amazon EC2 console.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/premiumsupport/knowledge-center/deleteontermination-ebs/](https://aws.amazon.com/premiumsupport/knowledge-center/deleteontermination-ebs/)
- [https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html)

**Check out this Amazon EBS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-ebs/](https://tutorialsdojo.com/amazon-ebs/)

---

## Câu 63 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A solutions architect is writing an AWS Lambda function that will process encrypted documents from an Amazon FSx for NetApp ONTAP file system. The documents are protected by an AWS KMS customer key. After processing the documents, the Lambda function will store the results in an S3 bucket with an Amazon S3 Glacier Flexible Retrieval storage class. The solutions architect must ensure that the files can be decrypted by the Lambda function.

Which action accomplishes the requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Attach the `kms:decrypt` permission to the Lambda function’s resource policy. Add a statement to the AWS KMS key’s policy that grants the function’s resource policy ARN the `kms:decrypt` permission.
- [x] **B.** Attach the `kms:decrypt` permission to the Lambda function’s execution role. Add a statement to the AWS KMS key’s policy that grants the function’s execution role the `kms:decrypt` permission.
- [ ] **C.** Attach the `kms:decrypt` permission to the Lambda function’s execution role. Add a statement to the AWS KMS key’s policy that grants the function’s ARN the `kms:decrypt` permission.
- [ ] **D.** Attach the `kms:decrypt` permission to the Lambda function’s resource policy. Add a statement to the AWS KMS key’s policy that grants the function’s execution role the `kms:decrypt` permission.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Attach the `kms:decrypt` permission to the Lambda function’s execution role. Add a statement to the AWS KMS key’s policy that grants the function’s execution role the `kms:decrypt` permission.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
A key policy is a resource policy for an AWS KMS key. Key policies are the primary way to control access to KMS keys. Every KMS key must have exactly one key policy. The statements in the key policy determine who has permission to use the KMS key and how they can use it. You can also use IAM policies and grants to control access to the KMS key, but every KMS key must have a key policy.

Unless the key policy explicitly allows it, you cannot use IAM policies to allow access to a KMS key. Without permission from the key policy, IAM policies that allow permissions have no effect. (You can use an IAM policy to deny permission to a KMS key without permission from a key policy.) The default key policy enables IAM policies. To enable IAM policies in your key policy, add the policy statement described [here.](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#key-policy-default-allow-root-enable-iam)

![](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/kms-key-policy-sample.jpg)

All Amazon FSx for NetApp ONTAP file systems is encrypted at rest with keys managed using AWS Key Management Service (AWS KMS). Data is automatically encrypted before being written to the file system and automatically decrypted as it is read. These processes are handled transparently by Amazon FSx, so you don’t have to modify your applications. Amazon FSx uses an industry-standard AES-256 encryption algorithm to encrypt Amazon FSx data and metadata at rest.

Hence, the correct answer is: **Attach the `kms:decrypt` permission to the Lambda function’s execution role. Add a statement to the AWS KMS key’s policy that grants the function’s execution role the `kms:decrypt` permission.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Attach the `kms:decrypt` permission to the Lambda function’s resource policy. Add a statement to the AWS KMS key’s policy that grants the function’s resource policy ARN the `kms:decrypt` permission** is incorrect. The resource policy specifies who can invoke the Lambda function, not which AWS operations it can use.

- The option that says: **Attach the `kms:decrypt` permission to the Lambda function’s execution role. Add a statement to the AWS KMS key’s policy that grants the function’s ARN the `kms:decrypt` permission** is incorrect. You must use the ARN of the function’s execution role as the principal instead of the actual ARN of the function. The reason for this is that AWS Lambda interacts with other AWS services using the permissions associated with an execution role.

- The option that says: **Attach the `kms:decrypt` permission to the Lambda function’s resource policy. Add a statement to the AWS KMS key’s policy that grants the function’s execution role the `kms:decrypt` permission** is incorrect. Like the other incorrect option, the decrypt permission must be added to the function’s execution role and not on its resource policy.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam)
- [https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html](https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html)
- [https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/encryption-at-rest.html](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/encryption-at-rest.html)

**Check out this AWS KMS Cheat sheet:**
- [https://tutorialsdojo.com/aws-key-management-service-aws-kms/](https://tutorialsdojo.com/aws-key-management-service-aws-kms/)

---

## Câu 64 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Resilient Architectures*

### Đề bài (Question)
A production MySQL database hosted on Amazon RDS is running out of disk storage. The management has consulted its solutions architect to increase the disk space without impacting the database performance.

How can the solutions architect satisfy the requirement with the LEAST operational overhead?

### Các lựa chọn (Choices)
- [ ] **A.** Increase the allocated storage for the DB instance.
- [x] **B.** Modify the DB instance settings and enable storage autoscaling.
- [ ] **C.** Modify the DB instance storage type to Provisioned IOPS.
- [ ] **D.** Change the `default_storage_engine` of the DB instance’s parameter group to `MyISAM`.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Modify the DB instance settings and enable storage autoscaling.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
**RDS Storage Auto Scaling** automatically scales storage capacity in response to growing database workloads, with zero downtime.

Under-provisioning could result in application downtime, and over-provisioning could result in underutilized resources and higher costs. With RDS Storage Auto Scaling, you simply set your desired maximum storage limit, and Auto Scaling takes care of the rest.

![Storage AutoScaling](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/auto-scaling-111723-1501.png)

RDS Storage Auto Scaling continuously monitors actual storage consumption, and scales capacity up automatically when actual utilization approaches provisioned storage capacity. Auto Scaling works with new and existing database instances. You can enable Auto Scaling with just a few clicks in the AWS Management Console. There is no additional cost for RDS Storage Auto Scaling. You pay only for the RDS resources needed to run your applications.

Hence, the correct answer is: **Modify the DB instance settings and enable storage autoscaling.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Increase the allocated storage for the DB instance** is incorrect. This option simply requires monitoring and proactive planning. While it can solve the immediate issue, it doesn’t scale well over time and involves operational overhead, as administrators must intervene each time storage needs grow.

- The option that says: **Change the `default_storage_engine` of the DB instance’s parameter group to `MyISAM`** is incorrect. This is just a storage engine for MySQL. It won’t increase the disk space in any way.

- The option that says: **Modify the DB instance storage type to Provisioned IOPS** is incorrect. This may improve disk performance, but it won’t solve the problem of low database storage.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://aws.amazon.com/about-aws/whats-new/2019/06/rds-storage-auto-scaling/](https://aws.amazon.com/about-aws/whats-new/2019/06/rds-storage-auto-scaling/)
- [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html#USER_PIOPS.Autoscaling](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html#USER_PIOPS.Autoscaling)

**Check out this Amazon RDS Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/](https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/)

---

## Câu 65 (Chọn 1 đáp án (Single Choice))
**Domain:** *CSAA – Design Secure Architectures*

### Đề bài (Question)
A company uses multiple AWS accounts consolidated under AWS Organizations. The company needs to copy multiple Amazon S3 objects to an S3 bucket in a different owned AWS account. The Solutions Architect must configure permissions to enable this transfer while ensuring the destination account owns the copied objects rather than the source account.

How can the Architect accomplish this requirement?

### Các lựa chọn (Choices)
- [ ] **A.** Enable the Requester Pays feature in the source S3 bucket. The fees would be waived through Consolidated Billing since both AWS accounts are part of the organization.
- [x] **B.** Configure cross-account permissions in S3 by creating an IAM customer-managed policy that allows an IAM user or role to copy objects from the source bucket in one account to the destination bucket in the other account. Then attach the policy to the IAM user or role that you want to use to copy objects between accounts.
- [ ] **C.** Set up cross-origin resource sharing (CORS) in S3 by creating a bucket policy that includes `AmazonS3FullAccess` and allows an IAM user or role to copy objects from the source bucket in one account to the destination bucket in the other account.
- [ ] **D.** Connect the two S3 buckets from two different AWS accounts to Amazon WorkDocs. Set up cross-account access to integrate the two S3 buckets. Use the WorkDocs console to copy the objects from one account to the other with modified object ownership assigned to the destination account.

### Đáp án đúng (Correct Answer)
> **Đáp án đúng:** **B**
> - **B.** Configure cross-account permissions in S3 by creating an IAM customer-managed policy that allows an IAM user or role to copy objects from the source bucket in one account to the destination bucket in the other account. Then attach the policy to the IAM user or role that you want to use to copy objects between accounts.

### Giải thích chi tiết (Explanation)

#### 1. Vì sao đáp án đúng? (Correct Answer Rationale)
By default, an S3 object is owned by the account that uploaded the object. That’s why granting the destination account the permissions to perform the cross-account copy makes sure that the destination owns the copied objects. You can also change the ownership of an object by changing its access control list (ACL) to bucket-owner-full-control.

However, object ACLs can be difficult to manage for multiple objects, so it’s a best practice to grant programmatic cross-account permissions to the destination account. Object ownership is important for managing permissions using a bucket policy. For a bucket policy to apply to an object in the bucket, the object must be owned by the account that owns the bucket. You can also manage object permissions using the object’s ACL. However, object ACLs can be difficult to manage for multiple objects, so it’s best practice to use the bucket policy as a centralized method for setting permissions.

![Access Policy Example](../Review Mode Set 3 - AWS Certified Solutions Architect Associate - Tutorials Dojo_files/access-policy-example.PNG)

To be sure that a destination account owns an S3 object copied from another account, grant the destination account the permissions to perform the cross-account copy. Follow these steps to configure cross-account permissions to copy objects from a source bucket in Account A to a destination bucket in Account B:

– Attach a bucket policy to the source bucket in Account A.

– Attach an AWS Identity and Access Management (IAM) policy to a user or role in Account B.

– Use the IAM user or role in Account B to perform the cross-account copy.

Hence, the correct answer is: **Configure cross-account permissions in S3 by creating an IAM customer-managed policy that allows an IAM user or role to copy objects from the source bucket in one account to the destination bucket in the other account. Then attach the policy to the IAM user or role that you want to use to copy objects between accounts.**

#### 2. Vì sao các phương án khác sai? (Incorrect Options Rationale)
- The option that says: **Enable the Requester Pays feature in the source S3 bucket. The fees would be waived through Consolidated Billing since both AWS accounts are part of the organization** is incorrect because the Requester Pays feature is primarily used if you want the requester, instead of the bucket owner, to pay the cost of the data transfer request and download from the S3 bucket. This solution lacks the necessary IAM Permissions to satisfy the requirement. The most suitable solution here is to configure cross-account permissions in S3.

- The option that says: **Set up cross-origin resource sharing (CORS) in S3 by creating a bucket policy that includes `AmazonS3FullAccess` and allows an IAM user or role to copy objects from the source bucket in one account to the destination bucket in the other account** is incorrect because CORS simply defines a way for client web applications that are loaded in one domain to interact with resources in a different domain, and not on a different AWS account.

- The option that says: **Connect the two S3 buckets from two different AWS accounts to Amazon WorkDocs. Set up cross-account access to integrate the two S3 buckets. Use the WorkDocs console to copy the objects from one account to the other with modified object ownership assigned to the destination account** is incorrect because Amazon WorkDocs is commonly used to easily collaborate, share content, provide rich feedback, and collaboratively edit documents with other users. There is no direct way for you to integrate WorkDocs and an Amazon S3 bucket owned by a different AWS account. A better solution here is to use cross-account permissions in S3 to meet the requirement.

#### 3. Tài liệu tham khảo (References & Cheat Sheets)
**References:**
- [https://docs.aws.amazon.com/AmazonS3/latest/dev/example-walkthroughs-managing-access-example2.html](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-walkthroughs-managing-access-example2.html)
- [https://aws.amazon.com/premiumsupport/knowledge-center/copy-s3-objects-account/](https://aws.amazon.com/premiumsupport/knowledge-center/copy-s3-objects-account/)
- [https://aws.amazon.com/premiumsupport/knowledge-center/cross-account-access-s3/](https://aws.amazon.com/premiumsupport/knowledge-center/cross-account-access-s3/)

**Check out this Amazon S3 Cheat Sheet:**
- [https://tutorialsdojo.com/amazon-s3/](https://tutorialsdojo.com/amazon-s3/)

---
