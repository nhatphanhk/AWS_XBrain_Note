# Amazon ECS

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 18 - Containers on AWS_ ECS, Fargat  
> **Bài giảng (Lecture):** 199  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/26099492)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:45]

Okay, so now let's talk about Amazon ECS and we're going to get an overview into all different aspects of it. So the first thing I want to talk to you about is the EC2 launch type. So ECS stands for Elastic Container Service. And when you launch Docker containers on AWS, you are launching what's called an ECS task on an ECS cluster. And an ECS cluster is made of things. And with the EC2 launch type, well, these things are EC2 instances. And in that case, if you use an ECS cluster with an EC2 launch type, you must provision and maintain the infrastructure yourself. So that means that your Amazon ECS cluster is going to be composed of multiple EC2 instances.

### ⏱️ [00:45 - 01:31]

Now, these instances are a little bit special because each of them must run the ECS agent and then this agent is going to register each EC2 instance into the Amazon ECS service and the specified ECS cluster. Now, once you have that in place, then when you start ECS tasks, then AWS is going to be starting or stopping the containers. That means that whenever you have a new Docker container, it's going to be placed accordingly on each EC2 instance over time, as you can see right here. And you can start or stop the ECS task and it will be placed automatically. So that's the EC2 launch type and Docker containers are placed on Amazon EC2 instances that we provision in advance, okay?

### ⏱️ [01:31 - 02:16]

Now there's a second launch type called the Fargate launch type. And again, you launch Docker containers on AWS, but this time you do not provision the infrastructure. So there are no EC2 instances to manage. It's all serverless. Well, because we don't manage servers, but of course there are servers behind. So in the Fargate type, if we have an ECS cluster, we just create task definition to define our ECS tasks, and then AWS will run these ECS tasks for us based on how many CPU and RAM we need. So whenever we want to run a new Docker container, simple as that, it's going to be run without us knowing where it's run and without an EC2 instance to be created in the backend in our accounts for it to work.

### ⏱️ [02:16 - 02:58]

So it's a little bit magic. And then to scale, well, you just need to increase the number of tasks. Simple, you don't need to manage any more EC2 instances. And the exam loves to go and tell you to use Fargate because Fargate is serverless and it's way easier to manage than the EC2 launch type. Okay, so we've seen the two launch types for Amazon ECS. Now let's talk about the IAM roles for ECS tasks. So let's take an example of the EC2 launch type in which we have an EC2 instance running the ECS agent on Docker. So in this case, we can create an EC2 instance profile, which is only valid, of course, if you use EC2 launch type, and it's going to be used by the ECS agent only.

### ⏱️ [02:58 - 03:42]

And then the ECS agent will use the EC2 instance profile to make API calls to the ECS service to register the instance. It's going to make API calls to CloudWatch Logs to send container logs. It's going to use the API calls to ECR to pull Docker images from ECR, and also reference sensitive data in Secrets Manager or the SSM Parameter Store. And then our ECS tasks are going to get ECS task roles. And so this is valid for both EC2 launch type and Fargate. And so here I have two tasks and we can create a specific role per task. So my first task A will have an ECS task A role, and the first task B, the second task B, is going to have the task B role.

### ⏱️ [03:42 - 04:26]

Well, why do we have different roles? Because each role allows you to be linked to different ECS services. And so for example, the ECS task A role allows you to have your task A run some API calls against Amazon S3, whereas task B role allows you to run again API calls against DynamoDB. And you define the task role in the task definition of your ECS service. So remember this, the distinction between EC2 instance profile role and the ECS task role. Next, load balancer integrations. So in this example, I'm in the EC2 launch type, but it could be Fargate as well, of course, and have multiple ECS tasks running.

### ⏱️ [04:26 - 05:12]

It's all in this ECS cluster and we want to expose these tasks as a HTTP or HTTPS endpoint. Therefore, we can run an application balancer in front of it and then our users will be going to the ALB and in the backend to the ECS tasks directly. So in that case, the ALB is supported and will support most use cases and that's a good choice. The network load balancer is recommended only if you have very high throughput or high performance use cases, or as you learn later on in this course, if you use it with AWS PrivateLink, or if you want to use the older generation classic load balancer, you can, but it's definitely not recommended because you don't get any advanced features and you cannot link your Elastic Load Balancer to Fargate.

### ⏱️ [05:12 - 05:54]

Whereas if you're using the application balancer, then it works of course with Fargate. So what about data persistence on Amazon ECS? For this, you need data volumes and they're different kinds, but one of them is noticeable and that's EFS. So say you have an ECS cluster and in this case I represented both the EC2 instance as well as the Fargate launch type for my ECS cluster. And we want to mount a file system onto the ECS task to share some data. In that case, we use an Amazon EFS file system. Because it's a network file system it's going to be compatible with both EC2 and the Fargate launch types, and it allows us to mount the file system directly onto our ECS tasks.

### ⏱️ [05:54 - 06:36]

Why? Well, then tasks running in any AZ linked to this Amazon EFS file system will share the same data, and therefore can communicate with another via the file system if they wanted to. So the ultimate combo is to use Fargate to launch ECS task in a serverless fashion and Amazon EFS for file system persistence because EFS again is also serverless. We don't manage any servers. It's pay as you go, it's just provisioned in advance and you're good to go. So the use cases of using EFS with ECS is to do persistent multi-AZ shared storage for your containers. And now you also have the option to have data volumes for ECS to be S3 file system.

### ⏱️ [06:36 - 07:04]

So you can mount an S3 bucket exposed as a file system on your ECS task, which is amazing. It works for ECS managed instances and Fargate and the changes will sync automatically to the S3 bucket. So here the use case is that if your containers need shared file access to data that already lives in Amazon S3, you can just mount that S3 bucket onto your tasks. So that's it for this lecture, I hope you liked it, and I will see you in the next lecture.
