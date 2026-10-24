# Amazon SES

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 30 - Other Services  
> **Bài giảng (Lecture):** 371  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/33879134)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:49]

So here is a quick lecture about Amazon SES, also called Simple Email Service. So to fully managed service, as the name indicates, they will allow you to send email securely, globally, and at scale. So the idea is that your application will use the SES API or SMTP server and Amazon SES will then send bulk emails to users. So this allows for outbound and inbound emails so you can receive replies, and it gives you a reputation dashboard, if your emails are open or not, performance insights, as well as anti-spam feedback, so if people rates your emails as spam or not. It provides email statistics such as deliveries, bounces, feedback loop results, and whether or not the email was open, and it supports the standard security for email sending of today, so you have DKIM and you have SPF.

### ⏱️ [00:50 - 01:19]

There is a flexible deployment so you can use a shared IP, a dedicated IP, or your own customer-owned IP. This is to send emails from a specific IP address, and then the APIs are accessible from the console, specific AWS APIs, or the SSTP protocol. So the use cases for Amazon SES will be transactional emails, marketing email, and bulk emails communications. So that's it for this lecture. I hope you liked it, and I will see you in the next lecture.
