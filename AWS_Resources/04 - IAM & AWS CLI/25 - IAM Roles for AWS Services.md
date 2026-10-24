# IAM Roles for AWS Services

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 04 - IAM & AWS CLI  
> **Bài giảng (Lecture):** 25  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/26098066)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:36]

So we have to talk about the last component of IAM, which is called IAM Roles. So some AWS services that we'll be launching throughout this course will need to perform actions on our behalf, on our account, okay? And for this to do these actions, they're just like users, they will need some kind of permissions. So we need to assign permissions to AWS services and to do so, we're going to create what's called an IAM Role. So these IAM role will be just like a user, but they are intended to be used not by physical people, but instead they will be used by AWS services. So what does that mean?

### ⏱️ [00:36 - 01:17]

It's a bit confusing. So for example, we are going to create throughout this course, an EC2 Instance. An EC2 Instance is just like a virtual server, and we'll see this in the next section. But so this EC2 Instance may want to perform some actions on AWS and to do so, we need to give permissions to our EC2 Instance. To do so, we're going to create an IAM Role and together they're going to make one entity. And together, once the EC2 Instance is trying to access some information from AWS, then it will use the IAM Role. And if the permission assigned to the IAM Role is correct, then we're going to get access to the call we're trying to make.

### ⏱️ [01:17 - 01:38]

So some common roles include what I just showed you, EC2 Instance roles, but also other things that perform actions against AWS we'll see in this course. For example, Lambda Function Roles or CloudFormation. So I know this is a high level of review. In the next lecture we'll be creating a role, but we won't be using it yet until the next section, but let's go ahead and create a role. I will see you in the next lecture.
