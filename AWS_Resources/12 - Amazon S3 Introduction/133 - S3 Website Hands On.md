# S3 Website Hands On

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 12 - Amazon S3 Introduction  
> **Bài giảng (Lecture):** 133  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/34352950)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:35]

Okay, so let's enable our bucket to be a website. But first, I'm going to upload one more file here, I'm going to upload my beach.jpg file into our buckets. Okay, this is done, so we have two files into our buckets, and let's go into Properties, scroll down, and all the way down you will find the static website hosting. So click on Edit, and here we will enable static website hosting. We want to host a static website and we need to specify an index document. So I will say, index.html and we will have to upload that file. This is the default or homepage of the websites.

### ⏱️ [00:35 - 01:15]

As you can see here, we also have a little warning sign saying, hey, by the way if you want to enable this as a website endpoint you must make all your content publicly readable. And we've done this in the previous lecture, so that's good. Okay, so let's go and save this. So this is saved, and go back into our objects. And the one thing that's missing here is that index, that HTML file. So let's go to upload this, we Add files and then I will click on index.html and then upload, close it. It's created, so now back into Properties, let's scroll all the way down, and you see now that's under static website hosting, we have a bucket website endpoint.

### ⏱️ [01:15 - 01:53]

So I copy this URL, paste it, and I get, I love coffee. Hello world! And my coffee.jpg file. So this working, so this is my index at HTML file, and if I right click on this and open this image in new tab, we have the public URL of our coffee.jpg. So this is working, and by the way if you wanted to change the coffee for beach, well under beach.jpg we can see as well this beach image right here. So that means that everything is working, our S3 bucket is enabled for static website hosting, and thanks to the S3 bucket policy being public, we can see all these files.

### ⏱️ [01:53 - 01:57]

So we're good to go, I hope you like this lecture and I will see you in the next lecture.
