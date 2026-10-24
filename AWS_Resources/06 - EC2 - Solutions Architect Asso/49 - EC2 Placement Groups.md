# EC2 Placement Groups

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 06 - EC2 - Solutions Architect Asso  
> **Bài giảng (Lecture):** 49  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/13528080)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:39]

So, now let's talk about placement groups. Placement groups are a little bit more advanced, and we want to use them once we want to have control over how our EC2 instances are going to be placed within the AWS infrastructure. So, that strategy can be defined using these placement groups. So, we don't get direct interaction with the hardware of AWS, but we let AWS know how we would like our EC2 instance to be placed compared to one another. So, when you create a placement group, you have three strategies available for you. You have the cluster placement group, in which your instances will be grouped together in a low latency hardware setup within a single availability zone.

### ⏱️ [00:41 - 01:19]

This is going to give you high performance, but high risk. We'll see this in details in a second. Spread means that your instances are going to be spread across different hardware. And that is a restriction on this that means you can only have seven EC2 instance per placement group that's spread per AZ. So, you would use a spread placement group when you have critical applications. Finally, the last one is a new kind of placement group that is really helpful. It's called partition. It's similar to the spread, meaning that you want to spread your instances, but here they're spread across many different partitions. And these partitions rely on different sets of racks of hardware within an AZ.

### ⏱️ [01:19 - 01:57]

What does that mean is that they're still spread, but they're not isolated one from another failure, but a partition should be isolated from another partition of failure. The idea with this is that you can scale to hundreds of EZ2 instances per group and that allows you to run applications such as Hadoop, Cassandra, or Kafka. Finally, you have precision time, which gives you direct access to high precision time sources. Now let's have a look into each of these placement groups in details. So next we have the cluster placement group and all your EC2 instances are going to be in the same availability zone. So why do we do this?

### ⏱️ [01:57 - 02:49]

Well, this particular placement group gives you great networking. So you have around 10 gigabits per second of bandwidth between all these instances that will have enhanced networking enabled. And so you get low latency, high throughput network, and the idea is that out of this you can get great performance for any kind of computational job. So a drawback of using this architecture is that if your availability zone fails, then all the instances will fail at the same time. But usually for use case, this is fine. So the use cases for this kind of placement group are big data jobs that need to complete very fast with very high networking or applications that need extremely low latency and high throughput network between each instance of your application.

### ⏱️ [02:49 - 03:28]

Now spread is the complete opposite and spread want to minimize the failure risk. And so in this case, when we ask for spread placement group, all the EC2 instances are going to be located on different hardware. So you can see here we have three AZ and we have six EC2 and each EZ2 instance is on a different hardware. So what does that mean? Well, what we get is that we can span across multiple AZ and there is a reduced risk of simultaneous failure. Why? Well, because if my hardware one fails, I'm pretty sure my hardware two will not fail. And so we've separated the risk of my two instances in the USES 1A to fail at the same time.

### ⏱️ [03:28 - 04:09]

And so that's the benefit from it. The con is that from this configuration, we're limited to seven instances per AZ per placement group. So there is a limit to how big your placement group can be and so you need to have an application that's going to be of good size but not too big. The use case would be an application that needs to maximize high availability and reduce the risk and in general for critical applications where your instance failures must be isolated from one another. Remember here we have a limitation of seven instances per AZ per placement group. Now for the partition placement group, we can have instances spread across partitions in multiple availability zones.

### ⏱️ [04:09 - 04:43]

So we can have up to seven partitions per AZ. So in this example, we have partition one and partition two in US East 1A and partition three in US East 1B. And on each partition you can have many EC2 instances. So in the first one I have four and the second one I have four and the third one have four as well. So why do we use a partition placement group? Well, each partition represents a rack in AWS. And so by having many partitions, you're making sure that your instances are distributed across many hardware racks and so therefore they're safe from a rack failure from one another.

### ⏱️ [04:43 - 05:31]

So you can have up to seven partitions per AZ and these partitions can span across multiple availability zones in the same region. You can get up to hundreds of EC2 instances with a setup. So this is a difference versus the spread type of placement group. And as I said, the instances in the partition do not share the same hardware physical rack with the instances in the other partitions and therefore each partition is isolated from failure. So that means that yes, if one goes down, if partition goes down the partition number two, then partition number one should be fine. And to know which partition these EC2 instances are on, there is an option to access this information as with using the metadata service.

### ⏱️ [05:32 - 06:15]

So when would you use a partition placement group? Well, when you have an application that it can be partition aware to distribute the data and your servers across partitions and usually the use cases are going to be big data applications which are partition aware such as using HDFS, HBase, Cassandra and Apache Kafka. So for the precision time placement group, the idea is that you want to place your EC2 instances on underlying hardware with direct access to high precision time sources. What does that mean? That means that the clock of your underlying Linux, for example, will be connected to the Amazon time sync service, which is going to give you a time that is much more accurate than the standard NTP.

### ⏱️ [06:15 - 06:55]

Also, you have access to a PTP hardware clock and hardware packet timestamping. So the idea is that you have very, very, very precise time on these instances, which is good only for some very specific applications such as distributed databases, financial timestamping or event ordering. For web and that kind of stuff, the time you get on all these machines is good enough. But if you have a time constraint, then you can use the precision type placement group to get placed on the hardware that supports this more accurate time. So that's it for this lecture. I hope you liked it and I will see you in the next lecture.
