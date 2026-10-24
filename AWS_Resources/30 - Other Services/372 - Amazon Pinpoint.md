# Amazon Pinpoint

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 30 - Other Services  
> **Bài giảng (Lecture):** 372  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/33879136)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:45]

So now, let's talk about Amazon Pinpoint. And Amazon Pinpoint is scalable two ways, so inbound and outbound marketing communication service. The idea is that you want to send email, SMS, push notifications, voice, and in-app messaging through Pinpoint. And one of the main use cases is SMS. So the customers will receive an SMS that you send from Amazon Pinpoint. And you have the ability to segment and personalize the messages with the right content to customers. So you can create groups and segments and so on. You also have the possibility to, of course, receive replies. And this scales to billions of messages per day. So the use cases for Pinpoint is to run campaigns by sending marketing email in bulk, or sending transactional SMS messages.

### ⏱️ [00:45 - 01:26]

And should someone reply or should it be successful, then all the events such as text success, text delivered replies, and so on, will be delivered to Amazon SNS, Kinesis Data Firehose, and CloudWatch Logs. So you can build any kind of automation easily on top of Amazon Pinpoint. And so you may be wondering, well, what is the difference between Pinpoint and Amazon SNS or Amazon SES? Because there is obviously some overlap. So the idea is that in SNS or SES, you have to manage each message's audience, content, and delivery schedule. And this is the responsibility of your application. And that may be a lot of work, and that may be not very scalable.

### ⏱️ [01:26 - 01:52]

So in Amazon Pinpoint, instead, you're going to create message templates, delivery schedules, highly targeted segments, and full campaigns. And all of this is managed by the Pinpoint service. So see Pinpoint as the next evolution of SNS and SES, in case you wanna do full-blown marketing communications service. So that's it for this lecture. I hope you liked it, and I will see you in the next lecture.
