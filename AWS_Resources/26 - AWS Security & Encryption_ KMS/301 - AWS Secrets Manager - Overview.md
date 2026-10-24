# AWS Secrets Manager - Overview

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 26 - AWS Security & Encryption_ KMS  
> **Bài giảng (Lecture):** 301  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/18093191)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:38]

So now let's talk about a very simple service called the AWS Secrets Manager. So it's a newer service and it's meant for storing secrets and it's going to be different from the SSM parameter store, because on Secrets Manager, you have the capability to force the rotation of secrets every X number of days, and therefore you have a better secret management schedule. On top of it, from within Secrets Manager, you can force and automate the generation of secrets on the rotation. And for this, you have to define a Lambda function that will generate that new secrets. Moreover, Secrets Manager is really well integrated with different services on AWS.

### ⏱️ [00:38 - 01:14]

And I just showed you Amazon RDS for example, for MySQL, PostgreSQL, SQL or Aurora. But there are other services as well with AWS, other databases, that are integrated with Secrets Manager out of the box. That means that the username and the password to get into your database is stored directly in Secrets Manager and it can be rotated and so on. Now, Secrets can be encrypted using the KMS service. And so anytime in the exam you see Secrets, or integration for RDS, or for Aurora of Secrets, really think Secrets Manager. There's one more feature we need to know about which is the concept of multi-region Secrets.

### ⏱️ [01:14 - 02:05]

So the idea is that you can replicate your Secrets across multiple AWS regions and Secrets Manager Service will keep readers in sync with the primary Secrets. So here have two regions. We create a Secret in the primary one and it gets replicated as a same Secret into a secondary region. Now, why would we do this? Well, multiple things. Number one, in case there is a problem with US East 1, you're able, for example, to promote a replica Secret as a standalone secret. And then thanks to the fact that that Secret is replicated across regions, then you can build multiple regions apps. You can also have disaster recovery strategies, or if you have an RDS database that is also being replicated from one region to the next, then you can use the same Secret to access, the same, the RDS database, the corresponding one, in the corresponding region.

### ⏱️ [02:05 - 02:10]

So that's it for this lecture. I hope you liked it, and I will see you in the next lecture.
