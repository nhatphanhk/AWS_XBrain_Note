# Polly Overview

> **Khóa học (Course):** Ultimate AWS Certified Solutions Architect Associate 2026  
> **Chương (Section):** 23 - Machine Learning  
> **Bài giảng (Lecture):** 254  
> **Link bài học:** [Xem trên Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/learn/lecture/32411800)  

---

## 📝 Nội dung bài giảng (Transcript)
### ⏱️ [00:00 - 00:39]

[Narrator] - Polly is the opposite of Transcribe. You turn text into speech using deep learning. This allows you to create applications that will talk. For example, it says, "Hello, my name is Stephane and this is a demo of Amazon Polly." And then with Polly, it would generate an audio, which I can play right here. Hi. My name is Stephane and this is a demo of Amazon Polly. I think I'm better at speaking than that but (chuckles) this gives you a good demo, right? And you can play with it on the console. So Amazon Polly can do more. It can use Lexicon & SSML so the first one is to customize the pronunciation of words with Pronunciation lexicons.

### ⏱️ [00:39 - 01:17]

For example, if there is a stylized word such as Stephane but the E is a 3 and the A is a 4 the Amazon Polly image might say "S-T-3-P-H-4-N-E," which is not how it should be pronounced; it should be pronounced Stephane. And so, therefore, you can create a lexicon for this. Or for example, for acronyms, for example, any time it sees AWS, instead of saying "A-W-S" it should say the full "Amazon Web Services." So then you upload the lexicons and you use them in the SynthesizeSpeech operation. The second feature you need to know about is the SSML feature, which is called Speech Synthesis Markup Language.

### ⏱️ [01:17 - 02:05]

And this enables more customization to how speech is made. So you can, for example, emphasize on specific words or phrases, or you use phonetic pronunciation, or you want to include breathing sounds or whispering, or you want to use the Newscaster speaking style. So all of it can be used using this Markup Language, and so instead of generating the speech from plain text you can include a whisper and it will start whispering, and so on, okay? So, remember, for pronunciation of stylized words or acronyms, use Pronunciation lexicons. And for more customization on how words are being pronounced, for example, whispering or phonetic pronunciation, and so on, then use the SSML Markup Language.

### ⏱️ [02:06 - 02:49]

So if I go into the Amazon Polly service, this is where I can turn text into lifelike speech. So we can try it. So we can use, for example, the neural network, okay. And this is the most natural and human-like speech possible and we can choose the voice we want. So, here's the text. So I will say, "Hey, my name is Stephane and I love AWS." Let's see what happens. So if we listen to this, it will say: Hi, my name is Stephane and I love AWS. So that's pretty cool, right? And here with SSML, and so, for example, let's add a break, so I will say, "Hey, my name is Joanna," and then I open a break.

### ⏱️ [02:49 - 03:45]

I say, "Break time equals," and this is part of the SSML Language, and then slash and this. So I say, "Hey, break this for three seconds." So it would say: Hi, my name is Joanna. Now there's a break. I will read any text you type here. And this is how you control the speech itself using the SSML Markup Language. And lastly, if we want to say, "Hey, I love AWS" right here, so we say, "I love AWS," and we'll just have one second of break. Let's listen to this. Hi, my name is Joanna. I love AWS. Okay, what if you want to say, not AWS, but Amazon Web Services, in which case you would need to go into additional settings and then customize pronunciation.

### ⏱️ [03:45 - 04:11]

And here you would need to apply lexicon and upload lexicon to convert AWS into Amazon Web Services. So, trust me, you just need to create a file, and then upload it, create a lexicon, and then automatically whatever you set as, for example, whenever it will find AWS, it will just say Amazon Web Services. And that's it for Amazon Polly. You should know everything there is to know for the exam. I hope you liked it and I will see you in the next lecture.
