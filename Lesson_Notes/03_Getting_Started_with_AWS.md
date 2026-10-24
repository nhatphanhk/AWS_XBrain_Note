# Ghi Chú Bài Học: Chương 03 - Khởi Đầu Với Điện Toán Đám Mây AWS (Getting Started with AWS)

> **Khóa học**: Ultimate AWS Certified Solutions Architect Associate  
> **Chương**: 03 - Getting started with AWS (Bài 08 đến Bài 10)  
> **Tài liệu tham chiếu liên quan**: [Bảng Thuật Ngữ Kỹ Thuật (GLOSSARY.md)](file:///n:/AWS_XBrain_Note/GLOSSARY.md)

---

## 4.1. Tổng Quan Bài Học (Lesson Overview)

### Chủ đề chính
Chương mở đầu này giới thiệu cơ sở hạ tầng vật lý toàn cầu của Amazon Web Services: các vùng địa lý (**AWS Regions**), các vùng khả dụng (**Availability Zones - AZs**), các trung tâm dữ liệu tại biên (**Edge Locations / Points of Presence**), và cách thức điều hướng, tương tác trên giao diện điều khiển web (**AWS Management Console**).

### Mục tiêu học tập
1. Hiểu khái niệm và tiêu chí lựa chọn một **AWS Region** phù hợp cho doanh nghiệp.
2. Nắm vững cấu tạo của một **Availability Zone (AZ)** và cách thức các AZ liên kết với nhau qua mạng cáp quang băng thông cao, độ trễ siêu thấp.
3. Làm quen với giao diện AWS Management Console và cách chuyển đổi giữa các Region.

---

## 4.2. Điểm Cốt Lõi Cần Nhớ (Key Takeaways)

1. **AWS Region**: Một vị trí địa lý riêng biệt trên thế giới (ví dụ: `ap-southeast-1` tại Singapore, `us-east-1` tại Bắc Virginia). Mỗi Region chứa **tối thiểu 3 Availability Zones** độc lập.
2. **Availability Zone (AZ)**: Một hoặc nhiều trung tâm dữ liệu rời rạc có nguồn điện, mạng và làm mát độc lập trong cùng một Region (ví dụ: `ap-southeast-1a`, `ap-southeast-1b`, `ap-southeast-1c`).
3. **Bốn yếu tố quyết định lựa chọn Region**:
   - **Tuân thủ pháp lý & Chủ quyền dữ liệu (Compliance & Data Sovereignty)**: Luật pháp yêu cầu dữ liệu khách hàng không được rời khỏi biên giới quốc gia.
   - **Độ trễ mạng (Latency)**: Đặt tài nguyên gần với người dùng cuối nhất có thể.
   - **Tính sẵn sàng của dịch vụ (Service Availability)**: Các dịch vụ mới thường ra mắt trước ở các Region lớn (như `us-east-1`, `eu-west-1`).
   - **Giá cả (Pricing)**: Chi phí dịch vụ có thể chênh lệch giữa các Region do thuế và chi phí vận hành địa phương (ví dụ: São Paulo thường đắt hơn Bắc Virginia).

---

## 4.3. Nguồn Tham Chiếu (Source References)

- **Source Transcripts**:
  - [08 - AWS Cloud Overview - Regions & AZ.md](file:///n:/AWS_XBrain_Note/AWS_Resources/03%20-%20Getting%20started%20with%20AWS/08%20-%20AWS%20Cloud%20Overview%20-%20Regions%20&%20AZ.md)
  - [10 - Tour of the AWS Console & Services in AWS.md](file:///n:/AWS_XBrain_Note/AWS_Resources/03%20-%20Getting%20started%20with%20AWS/10%20-%20Tour%20of%20the%20AWS%20Console%20&%20Services%20in%20AWS.md)
