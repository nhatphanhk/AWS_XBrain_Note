# Route 53 - Health Checks

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 10 - Route 53  
> **Bài giảng (Lecture):** 111  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/13528200)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:38]

So let's talk about health checks in Route 53. So health checks are a way for you to check the health of mainly public resources, although there's a way for us to do it for private resources as well, as we'll see in this lecture. So the idea is that, for example, we have two load balancers in different regions and they're public load balancers, okay? And behind the scenes, we have our application running in both of them. So we're running into a multi-region setup because we want high availability and so on, at the region level. Then, we're going to use Route 53 to create DNS records. So that's when users access our URL, for example, MyDomain.com, then they get redirected to, for example, the closest load balancer they have.

### ⏱️ [00:38 - 01:18]

So this would be the case with a latency-type of record. But we want to make sure that if one region is down, then we don't send our users to that region obviously, right? So to do so, we're going to create health checks from Route 53. So we'll create health checks on the one in us-east-1 and we'll create a health check on our instance in eu-west-1. Well, with these two health checks, we're going to be able to associate them with our Route 53 records. And the reason we do so is to get automated DNS failover. So we have three health checks that are possible. The ones I just showed you which are the health checks that monitor an endpoint, which is a public endpoint, so it could be an application, a server, or another AWS resource.

### ⏱️ [01:18 - 01:50]

It could be a health check that monitors other health checks, also called a calculated health checks. Or it could be a health check that monitors a CloudWatch alarm, which gives you more control and is helpful for private resources, as we'll see in this lecture. Finally, these health checks have their own metric and you can view them in CloudWatch metrics as well. So let's look at how health checks work with a specific endpoint. So if we have a health check for eu-west-1 for an ALB, then the health checkers of AWS are coming from all around the world. So it's not just one health checker, it's about 15 health checkers from all around the world.

### ⏱️ [01:50 - 02:30]

And they're all going to send requests into our public endpoint to wherever route we set. And then, if it gets 200 okay code back, or the code we defined, then the resource is deemed healthy. So about 15 global health checkers will check the endpoint health, and then you can set a threshold for healthy or unhealthy. You can set an interval, so we have two options. It could be either 30 seconds for regular health checks or every 10 seconds, which is a higher cost, which is what's called a fast health check. It supports many protocols, so HTTP, HTTPS, and TCP. And the rule is that if over 18% of the health checkers say that the endpoint is healthy, then Route 53 will consider it healthy, otherwise it's deemed unhealthy.

### ⏱️ [02:30 - 03:13]

And you have the ability to choose which locations you want to use for the health checks. Now, the health checks will only pass if you have the status 2xx or 3xx status code back from the load balancer and the health check has a cool capability. So if it is a text-based response, then the health checkers can check the first 5,120 bytes of the response to look for some specific text in the response itself. Finally, very important from a network perspective, if you want for it to work, obviously, the health checkers must be able to access your application balancer or whatever endpoint you have. And so, therefore, you must allow incoming requests coming from the Route 53 health checkers IP address range, and you can find this address range at the URL in the bottom right of the screen.

### ⏱️ [03:14 - 03:51]

Now, the second type of health checks we have are calculated health checks. And so, this is to combine the results of multiple health checks into a single health check. And so, if we look at Route 53, with three EC2 instance, we can create three health checks. They're all going to be children health check and they can all monitor each EC2 instance one by one. And then, we can define a parent health check, which is going to be defined on all these child health checks. And so, the conditions to combine all these health checks could be an or, an and, or a not. You can monitor up to 255 child health checks and you can specify how many of the health checks need to pass to make the parent pass.

### ⏱️ [03:51 - 04:24]

So the use case for this, for example, if you want to have a parent health check to perform maintenance on your website without causing all the health checks to fail. And so, how do we monitor the health of a private resource? So in case you want to monitor something private, it's going to be difficult because, well, all the Route 53 health checkers live on the public web and they're outside of your VPC. So they cannot access private endpoints, so if it's a private VPC or an on-premises resource. And so, the way we can do it, though, is to create a CloudWatch metric and assign a CloudWatch alarm on it.

### ⏱️ [04:24 - 04:52]

And then, you can assign the CloudWatch alarm into the health checker. So the idea is that we're going to monitor the health of our EC2 instance in a private subnet with a CloudWatch metric, and then, if the metric is breached, we're going to create a CloudWatch alarm on it. And when the alarm goes into the alarm state, then the health checker is going to be automatically unhealthy, and therefore, we'll have created exactly what we want, which is a health check on a private resource, which is the most common use case on how to do it. So that's it for this lecture, I hope you liked it.

### ⏱️ [04:52 - 04:54]

And I will see you in the next lecture.
