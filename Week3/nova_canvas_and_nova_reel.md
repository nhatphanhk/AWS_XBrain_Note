### Multi-Agent Systems

Nền tảng AI-Driven truyền thông thường dùng "Single agent" để chạy toàn bộ quá trình. Điều này khiến cho việc công việc sẽ khó tiếp cận những công việc phát triển phức tạp và yêu cầu đặc biệt

Multi-agent Collaboration đưa ra giải pháp bằng cách chia sẻ tránh nhiệm cho các agents thông qua "Orchestration layer". Hoạt động với từng nhiệm vụ riêng lẻ, đóng góp để đưa ra kết quả cuối cùng

Với Amazon Bedrock:

- Kết hợp nhiều Agent mà mỗi con đều có mục tiêu rõ ràng
- Gửi cấu trúc kết quả từ agent này sang agent khác thông qua "Orchestration plan"
- Cho phép nhà phát triển chỉnh sửa hoặc mở rộng mà không phải xây dựng lại toàn bộ thành phần

Multi-agent system (MAS) là tập hợp các agent chia sẻ một mục tiêu thông qua kiến trúc chia sẻ. Mỗi agent sẽ có luật, trách nhiệm và quyền hạn, trong khi đó "Orchestation layer" đảm bảo việc kết nối

Trong Amazon Bedrock, tầng orchestration layer:

- Xác định đầu ra và bối cảnh chuyển giao giữa các bướ
- Quản lí trạng thái các agent
- Quản lí các công cụ và cấu hình chính sách

Lợi ích của Multi-agent systems trong Amazon Bedrock

- Tính chuyên môn cao
- Tái sử dụng
- Mở rộng
- Phát hiện lỗi
- Lượng lớn công cụ hỗ trợ

Điểm mới so với 2025

- Luồng agent sẽ định nghĩa cấu trúc tuần tự và có điền kiện với nhau
- Chỉ định từng agent có thể truy cập công cụ nào
- Tự động chia sẻ điểm trọng tâm và bối cảnh giữa các bước
- Truy cập sâu vào từng agent thông qua Bedrock console
- Xây dụng và tạo các phiên bản có thể tái sử dụng

### Bedrock Agent Architecture

 Amazon Bedrock Agent cấu hình từ "Foundation modal" (FM), cấu trúc "íntructions", công cụ

 - Instructions: Xác định mục đích agent, phạm vi và cơ chế hoạt động
 - Foundation Modal (FM): 
 - Action Groups :
 - Knowledge Bases :
 - Session Memory :