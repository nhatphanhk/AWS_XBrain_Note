# Lambda SnapStart

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 19 - Serverless Overviews from a So  
> **Bài giảng (Lecture):** 215  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/41117330)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 01:18]

so let's talk about Lambda SnapStart, so it's a feature that improves your Lambda function performance up to 10x at no extra cost for Java, Python, and .NET, so the idea is that we want our Lambda functions to run very quickly, so what happens when SnapStart is disabled? Well, your Lambda function is going to be invoked, and then it goes into three life cycle phases, so we have the initialize phase. This is where your function's gonna be initialized. Then it's going to be invoked, and finally, shut down, and so what happens is that this initialize phase can take a lot of time because, well, it can take some time, for example, for a Java function to initialize its whole environment, and so when you use SnapStart, there's going to be an optimization done that is that the function is going to be preinitialized, and so the idea is that once the function is preinitialized, it can directly go into the invoke stage and then get to the shutdown stage, so the magic is that when you publish a new version of your Lambda function, then Lambda is going to be automatically initializing your function, and then a snapshot of the memory and the disk state is going to be done, and then, that snapshot is what's going to be used for low latency access to go directly into the invoke stage, so that's it for this optimization called Lambda SnapStart.

### ⏱️ [01:18 - 01:21]

I hope you liked it, and I will see you in the next lecture.
