# Ghi Chú Bài Học: Chương 23 - Dịch Vụ Trí Tuệ Nhân Tạo & Học Máy (Machine Learning on AWS)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 23 - Machine Learning (Bài 252 đến Bài 263)  
> **Tài liệu tham chiếu liên quan**: [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](file:///n:/AWS_XBrain_Note/GLOSSARY.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương này giới thiệu các dịch vụ Trí tuệ nhân tạo (AI Services) dựng sẵn được quản lý hoàn toàn của AWS, cho phép lập trình viên tích hợp các khả năng AI/ML tiên tiến vào ứng dụng thông qua API mà không cần kiến thức chuyên sâu về toán học hay khoa học dữ liệu: thị giác máy tính **Amazon Rekognition**, chuyển giọng nói thành văn bản **Amazon Transcribe**, chuyển văn bản thành giọng nói **Amazon Polly**, dịch ngôn ngữ tự động **Amazon Translate**, xây dựng Chatbot đàm thoại **Amazon Lex**, phân tích cảm xúc và hiểu ngôn ngữ tự nhiên **Amazon Comprehend**, trích xuất văn bản từ tài liệu scan/PDF **Amazon Textract**, công cụ tìm kiếm thông minh doanh nghiệp **Amazon Kendra**, hệ thống gợi ý sản phẩm cá nhân hóa **Amazon Personalize**, và nền tảng huấn luyện và triển khai mô hình học máy toàn diện **Amazon SageMaker**.

### Mục tiêu học tập
1. Nắm được vai trò và từ khóa nhận diện của từng dịch vụ AI chuyên biệt cho kỳ thi AWS Solutions Architect.
2. Hiểu cách kết hợp các dịch vụ AI để tạo ra chuỗi giá trị (ví dụ: Call Center: Audio ➔ Transcribe ➔ Comprehend ➔ Translate ➔ Dashboard).
3. Phân biệt được khi nào dùng các dịch vụ AI dựng sẵn (Managed AI Services) và khi nào cần đến nền tảng tự xây dựng mô hình **Amazon SageMaker**.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways - Quick Reference Table)

| Dịch vụ AWS AI/ML | Chức năng cốt lõi | Từ khóa nhận diện trong đề thi |
| :--- | :--- | :--- |
| **Amazon Rekognition** | Nhận diện khuôn mặt, vật thể, người nổi tiếng, lọc nội dung bạo lực/nhạy cảm trong ảnh và video. | *Computer Vision, Face recognition, Content moderation*. |
| **Amazon Transcribe** | Chuyển đổi giọng nói thành văn bản (Speech-to-Text - ASR); tự động ẩn thông tin nhạy cảm PII. | *Speech-to-Text, Audio to text, Subtitles generation*. |
| **Amazon Polly** | Chuyển đổi văn bản thành giọng nói tự nhiên (Text-to-Speech - TTS); hỗ trợ chuẩn SSML. | *Text-to-Speech, Lifelike voices, Talking application*. |
| **Amazon Translate** | Dịch thuật ngôn ngữ tự động thời gian thực hoặc hàng loạt. | *Language translation, Multilingual localization*. |
| **Amazon Lex** | Công cụ xây dựng Chatbot và trợ lý ảo bằng giọng nói hoặc văn bản (công nghệ tương tự Alexa). | *Chatbot, Conversational AI, Voice and text bot*. |
| **Amazon Comprehend** | Hiểu ngôn ngữ tự nhiên (NLP): phân tích cảm xúc (Tích cực/Tiêu cực), trích xuất thực thể, từ khóa. | *Natural Language Processing, Sentiment analysis*. |
| **Amazon Textract** | Trích xuất văn bản, bảng biểu (Tables), biểu mẫu (Forms) từ tài liệu quét scan, PDF, hóa đơn. | *OCR, Extract tables from forms and PDFs, Invoices*. |
| **Amazon Kendra** | Công cụ tìm kiếm thông minh cho doanh nghiệp sử dụng xử lý ngôn ngữ tự nhiên (NLP Search). | *Enterprise search, Natural language search across docs*. |
| **Amazon Personalize** | Động cơ gợi ý sản phẩm, bài viết theo thời gian thực (công nghệ tương tự Amazon.com). | *Recommendation engine, Personalized product suggestions*. |
| **Amazon SageMaker** | Nền tảng toàn diện dành cho Data Scientists: Chuẩn bị dữ liệu, xây dựng, huấn luyện và triển khai mô hình ML. | *Custom ML model, Train and deploy models, Jupyter Notebook*. |

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [252 - Rekognition Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/252%20-%20Rekognition%20Overview.md)
  - [253 - Transcribe Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/253%20-%20Transcribe%20Overview.md)
  - [254 - Polly Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/254%20-%20Polly%20Overview.md)
  - [255 - Translate Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/255%20-%20Translate%20Overview.md)
  - [256 - Lex + Connect Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/256%20-%20Lex%20+%20Connect%20Overview.md)
  - [257 - Comprehend Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/257%20-%20Comprehend%20Overview.md)
  - [259 - SageMaker AI Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/259%20-%20SageMaker%20AI%20Overview.md)
  - [260 - Kendra Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/260%20-%20Kendra%20Overview.md)
  - [261 - Personalize Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/261%20-%20Personalize%20Overview.md)
  - [262 - Textract Overview.md](file:///n:/AWS_XBrain_Note/AWS_Resources/23%20-%20Machine%20Learning/262%20-%20Textract%20Overview.md)
