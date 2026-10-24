# S3 Encryption

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 14 - Amazon S3 Security  
> **Bài giảng (Lecture):** 150  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/13528318)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:45]

So now let's learn about encryption in Amazon S3. So you have different methods to do so, and we're going to learn about them in this lecture. So you have server-side encryption SSC and you have different flavors of it. You have SSE-S3, which is enabled by default, which is server-side encryption with Amazon S3 manage keys. You have SSE-KMS where you use KMS keys stored in AWS-KMS to do the encryption. You have DSSE-KMS, which is a dual layer server-side encryption. So we'll learn about this as well. We have SSE-C where the server side-encryption is done with the customer provided keys and then you have client-side encryption. So you're supposed to understand which one is for which at the exam, but we're going to do a deep dive into those in this lecture.

### ⏱️ [00:45 - 01:30]

So don't worry right now if you don't understand any of what I'm saying. So let's go ahead and learn about the next one. So the first one is Amazon S3 for SSE-S3 encryption. So in this case, the encryption is using a key that's handled, managed, and owned by AWS. You never have access to this key. The object is going to be encrypted server-side by AWS and the security type of the encryption is AES-256. Therefore, you must set the header to X-amz-server-side-encryption AES256 to request Amazon S3 to encrypt the object for you using the SSE-S3 mechanism. Now SSE-S3 is enabled by default for new buckets and new objects.

### ⏱️ [01:30 - 02:11]

So how does that work? We have Amazon S3 and with our user, the user you, you're going to upload the file with the correct header and then it will be an object under Amazon S3. Amazon S3 will pair it with the S3 owned key, okay? Because we're using the SSE-S3 mechanism and then we'll perform encryption by mixing the key and the object and that will be what will be stored on your S3 buckets. So that's for the simpler one SSE-S3. Then we have SSE-KMS. So this time instead of relying on the key that is owned by AWS and the S3 service, you want to manage your own keys yourself using the KMS service, the key management service.

### ⏱️ [02:11 - 02:50]

So the advantages of using KMS is that you have user control over this key so you can create keys yourself within KMS and you can audit the key usage using CloudTrail. So anytime someone uses a key in KMS, this is going to be logged in a service that logs everything that happens in AWS called CloudTrail. So for this, we must have a header called the X-amz-server-side-encryption AWS KMS and then the object will be encrypted server-side. So anything SSE, of course, is server-side. So how does that work? Again, we upload the object this time with a different header and in the header, we actually specify the KMS key we want to use.

### ⏱️ [02:50 - 03:30]

Then the object is appearing in Amazon S3. And this time the KMS key that's going to be used is coming out of the AWS KMS. So these two things together are going to be blended and then you're going to get encryption and that's the file that's going to end up in the S3 buckets. So now to read that file from the S3 bucket, not only do you need access to the object itself, but also to the underlying KMS key that was used to encrypt this object. So this is another level of security. So SSE-KMS has some limitations because well, now that you upload and download files from Amazon S3, you need to leverage a KMS key.

### ⏱️ [03:30 - 04:09]

And the KMS key has its own APIs, for example, generate data key. And when you decrypt, you're going to use the decrypt API. And so therefore, you're going to do API calls into the KMS service. And each of these API calls is going to count towards the KMS quotas of API calls per second. So based on the region, you have between 5,000 and 30,000 requests per second, although they can be increased using the service quotas console. And so if you have a very, very high-throughput S3 bucket and everything is encrypted using KMS keys, you may go into a threat link kind of use case. So this is something the exam may test you on.

### ⏱️ [04:09 - 04:51]

So next, we have DSSE-KMS. The idea is that it's DSSE for dual-layer-server-side-encryption. And the idea is that you're going to encrypt the four because there's no word dual. We're going to encrypt the object twice. First with thanks to the KMS key service and then S3 manage keys. So the object is going to go through first level of encryption, a second level of encryption, and then it's going to be sent to the S3 bucket. So the reason why we have this is sometimes at exam, you will be required to have multilayer encryption and then this is going to be the right answer, DSSE-KMS. For this, you just send the object with the header like this, AWS KMS-DSSE, and you're good to go.

### ⏱️ [04:51 - 05:39]

Next we have the SSE-C-type of encryption. So this time the keys are managed outside of AWS, but it's still server-side encryption because we send the key to AWS. But Amazon S3 will never store the encryption key you provide. After they're used, they're being discarded. So in that case, because we transmit a key into Amazon S3, we must use HTTPS and we must pass the key as part of HTTP headers for every request being made. So how does that work? The user is going to upload a file as well as the key, but the user manages the key outside of AWS. And then Amazon S3 will use the client's provided key and the object to perform some encryption and then put the file as encrypted into an S3 bucket.

### ⏱️ [05:39 - 06:21]

And, of course, to read that file, the user must again provide the key that was used to encrypt that file. Finally, we have the client-side encryption. So this is easier to implement if we leverage some client library such as the client-side encryption library. And the idea with client-side encryption is that the clients must encrypt data themselves before sending data to Amazon S3. And also you can retrieve the data from Amazon S3 and then the decryption of the data happens on the client outside of Amazon S3. Therefore, the client fully manages the keys and the encryption cycle. So how does that work? We have a file and we have a client key that's outside of AWS.

### ⏱️ [06:21 - 07:03]

The client itself is going to provide and perform the encryption. So now we have an encrypted file and that file as is can be sent into Amazon S3 for upload. So we've seen all the levels of encryption of objects, but now let's talk about encryption in transit. So encryption in transit or in flight is also called SSL or TLS. And basically, your Amazon S3 bucket has two endpoints, the HTTP endpoint that is not encrypted and the HTTPS endpoint that has encryption in flights. So anytime you visit a website and you see that green lock or lock, usually that means it's using encryption in flights, meaning the connection between you and the target server is secure and fully-encrypted.

### ⏱️ [07:03 - 07:51]

And therefore, when you're using Amazon S3, it's fully recommended to use HTTPS to have secure transmission of data, of course. And if you use the SSE-C-type of mechanism, you must use the HTTPS protocol. Now, this is not something to worry about in real-life because well, most clients would use the HTTPS endpoint by default. Now, how would you go about forcing encryption in transit? For this, we could use a bucket policy. So you attach a bucket policy to your S3 bucket and you attach this statement, which is saying that you deny any get object operation if the condition is AWS secure transport false. So secure transport is going to be true whenever you're using HTTPS and false whenever you're not using an encrypted connection.

### ⏱️ [07:51 - 08:05]

And so therefore, any user trying to use HTTP on your bucket is going to be blocked, but users using HTTPS may be allowed. Okay, so that's it for encryption. I hope you liked it and I will see you in the next lecture.
