# Encrypted AMI Sharing Process

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 26 - AWS Security & Encryption_ KMS  
> **Bài giảng (Lecture):** 298  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/33879006)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:38]

So here is a question that can come up in the exam. This is around the process to share an AMI with another account, and the AMI has been encrypted with a KMS key. So the AMI is in your source account, and it's encrypted with your KMS key. So how do you launch an EC2 instance in account B from the AMI in account A? So first you must modify the AMI property with a launch permission, and the list launch permission allows account B to launch this AMI. So effectively, this is how you share an AMI. You must modify the launch permissions and add the specified target to its account ID.

### ⏱️ [00:38 - 01:23]

Then you need to also share the KMS key for the accounts B to be able to use it. So this is done usually with a key policy. Then in account B, you would create an IAM role or IAM user with enough permissions to actually use both the KMS key and the AMI. So you must have it on the KMS side, access to the Describekey API call, the ReEncrypted API call, CreateGrant and Decrypt API calls. And then once all of this is done, you can simply launch an EC2 instance from that AMI and optionally the target accounts can choose to re-encrypt everything with the KMS key that it's owned, that it owns in its own accounts, to re-encrypt the volumes.

### ⏱️ [01:23 - 01:33]

But there you go, you can launch an EC2 instance. And so if you understand this process you're good to go to maybe answer one question at the exam. I hope you liked it, and I will see you in the next lecture.
