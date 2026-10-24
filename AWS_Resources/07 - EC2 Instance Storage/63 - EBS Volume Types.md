# EBS Volume Types

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 07 - EC2 Instance Storage  
> **Bài giảng (Lecture):** 63  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/26098296)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:43]

So now let's talk about EBS volumes, and there are different volume types. They come in six different types today, and we can group them in several categories. The first one is gp2/gp3, which is a general purpose SSD volume that will balance price and performance for a wide variety of workloads. And this is something we've been using so far in this course. Then we have io1 and io2 Block Express. They're highest-performance SSD volumes that will be used for mission-critical low-latency and high-throughput workloads. Then we have st 1 volumes and they're low-cost HDD volume designed for frequently accessed throughput-intensive workloads. We have sc 1 volume, which are going to be the lowest cost HDD volume, and they will be designed for less frequently accessed workloads.

### ⏱️ [00:43 - 01:28]

Now, how do you define an EBS volume? Well, you can have several factors, for example, size, throughputs, and IOPS, which means I/O, operations per second. And obviously when in doubt, always consult the documentation. Now, for your EC2 instances, only gp2 and gp3 and io1 and io2 can be used as boot volumes. That means where the root OS is going to be running. So let's do a deeper dive into the different EBS volume types. The first one is the General Purpose or GP SSD. So we have the cost effective storage and low latency. They can be used as system boots volumes, virtual desktops, Development and test environments, medium sized databases, and transactional workloads.

### ⏱️ [01:28 - 02:11]

We have the gp3 type of volume, which gives you a baseline of 3,000 IOPS and a throughput of 125 megabytes per second. And you can increase the IOPS up to 80,000 and the throughput up to 2,000 megabytes per second independently. The gp2 volume will give you small gp2 volumes that can burst up to 3,000 IOPS, and there is the size and the IOPS capacity that are linked. So as you increase the size of your gp2 volume, the IOPS will increase and the max IOPS you can ever get is 16,000. So in gp3, you can set them independently. In gp2, they are linked together. You get 3 IOPS per gigabyte.

### ⏱️ [02:11 - 03:02]

That means that at 5,300 something gigabytes, we are at the max IOPS. Next we get the Provisioned IOPS SSD. So this is when you have a critical business application with sustained IOPS performance or applications that will need more than 80,000 IOPS. This is great for very good database workloads that will be sensitive to storage performance and consistency. So we have the io1 volume where you get a max IOPS of 64,000. PIOPS is Provisioned IOPS. 64,000 for Nitro EC2 instances and 32,000 for others. And you can increase the IOPS independently from the storage size with a ratio of about 50 to 1. And the io2 Block Express volumes give you sub-millisecond latency, give you a much greater IOPS max capacity.

### ⏱️ [03:02 - 03:46]

So 256,000 IOPS with a ratio of 1,000 IOPS per gigabyte maximum. Also, they support EBS Multi-attach feature. So now let's quickly touch upon st1 and sc1. So they cannot be a boot volumes, this is only for the previous types of volumes. You can get the size up to 16 terabytes and we get two kinds of volumes here. We have the throughput optimized HDD, so st1, which is great for big data, data warehousing, and log processing, which gives you a max throughput of 500 megabytes per second and a max IOPS of 500. And then for cold HDD so, sc1, this is for archive data, so data that is infrequently accessed.

### ⏱️ [03:46 - 04:17]

And this is when you would use it when you need to have the lowest possible cost. Here, the max throughput is 250 megabytes per second and the max IOPS is 250 as well. Now you don't have to remember all these details going into the exam. You just need to understand the differences at a high level of all these volumes. So the General Purpose SSD versus the Provisioned IOPS SSD in case you need a database versus some st1 and sc1 in case you need to have high throughput and lowest cost. And so you can find a summary of all I said in this link right here, okay?

### ⏱️ [04:17 - 04:33]

Which is the screenshot I just took you. So don't need to remember the details again, but remember that if you wanna get also over 32,000 IOPS, you need EC2 Nitro with io1 or io2. And that will be it for this lecture. So I hope you liked it and I will see you in the next lecture.
