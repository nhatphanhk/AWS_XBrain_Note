# S3 Default Encryption

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 14 - Amazon S3 Security  
> **Bài giảng (Lecture):** 153  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/13531242)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:58]

So just a short lecture on Default Encryption versus Bucket Policies. So by default, now all buckets are having a default encryption of SSE-S3. So it's applied automatically to new objects stored in your buckets, but you can change this to be a different default encryption, for example, SSC KMS. Nonetheless, you can also force encryption by using a bucket policy to refuse any API call to put an S3 object without the correct encryption headers. So this is the kind of bucket policies you could have in, for example, this one is saying, "Hey, if you do a put object but you don't have the encryption header that says AWS KMS, then deny this request." Or, "Hey, if you are uploading this, but there is no customer side algorithm, so no SSCC, then deny this object." So this is just an example, but at least you see that the bucket policy can also force a way to have encryption in your bucket.

### ⏱️ [00:58 - 01:20]

And by the way, bucket policies are always going to be evaluated before your default encryption settings. So that's it, just remember default encryption is on by default with SSE S3, but you can change it and you can apply a bucket policy preemptively to force encryption to the one you want. All right, that's it. I hope you liked it and I will see you in the next lecture.
