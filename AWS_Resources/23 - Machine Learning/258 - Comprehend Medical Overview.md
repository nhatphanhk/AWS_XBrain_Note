# Comprehend Medical Overview

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 23 - Machine Learning  
> **Bài giảng (Lecture):** 258  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/33878922)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:45]

So now let's talk about Amazon Comprehend Medical. So Comprehend Medical detects and returns useful information in unstructured clinical text. For example, if your doctor is taking notes, or if you have discharge summaries, or test results, or case notes, then it will use NLP. So it will use natural language processing to detect all the protected health information within the document itself as well with a DetectPHI API. So from an architecture perspective you would store whatever documents you have in Amazon S3, and then you would invoke the Comprehend Medical API. Or you could have Kinesis Data Firehose, and then analyze that in real time. Or you can use Amazon Transcribe to first transcribe the voice into text.

### ⏱️ [00:45 - 01:26]

Okay, as we understand from before. And then once it's in text form we can pass it to the Amazon Comprehend Medical service. So let's have a look into the consult to see how that works. So I am in the Amazon Comprehend Medical service, and let's launch a real time analysis. So here it's Input text. And so imagine that this is doctor's note and he wrote or she wrote all these things, right? So the doctor, okay, wrote all this. Now let's analyze it. And from this, we can have entities. And so you can find an age, and an high school teacher, and then you can find some overlap between some things such as there was a procedure name and the time to the procedure name and the date and so on.

### ⏱️ [01:26 - 02:02]

And as you can see all this data become quite organized. And so you have like some generic name of a molecule and its strength and dosage and route modes and frequency and so on. And this allows you to really start structuring all your health data from unstructured text using machine learning. So you can explore this, okay, but I'm not gonna go into the details of this. This is a medical field that I'm not very confident with, but at least you know that thanks to Amazon Comprehend Medical you can take information in text form and then get insights out of it. So I hope you liked it.

### ⏱️ [02:02 - 02:03]

And I will see you in the next lecture.
