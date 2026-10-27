# 🛠️ Bộ Công Cụ Chuẩn Hóa Đề Thi Thử AWS (Practice Test Formatter)

Thư mục này chứa toàn bộ mã nguồn và cấu hình tự động hóa để chuẩn hóa các đề thi thử AWS Solutions Architect Associate (SAA-C03) từ dạng copy thô trên Udemy sang định dạng Markdown cấu trúc chuyên sâu, phục vụ ôn tập hiệu quả.

---

## 📁 Cấu Trúc Thư Mục

```
Practices_Test/
├── tools/
│   ├── format_practice_test.ps1   # Script PowerShell tự động hóa toàn bộ quy trình
│   ├── config_template.json       # File mẫu cấu hình UI, nhãn tiếng Việt & 4 Domains
│   ├── pt6_metadata.json          # File metadata mẫu (65 tiêu đề & ghi chú ôn thi PT6)
│   ├── sample_raw_test.md         # File dữ liệu mẫu câu hỏi thô để chạy thử nghiệm
│   └── README.md                  # Hướng dẫn chi tiết sử dụng bộ công cụ
├── udemy_pt6.md                   # Đề thi số 6 đã được chuẩn hóa hoàn chỉnh
└── udemy_pt1.md, pt2.md...        # Các đề thi tiếp theo
```

---

## 🚀 Hướng Dẫn Sử Dụng Nhanh (Quick Start)

Khi bạn làm xong một đề thi mới trên Udemy (ví dụ: Practice Exam 1, 2, 3, 4, 5...):

### Bước 1: Tạo file và dán dữ liệu thô
1. Vào chế độ **Review Mode** của bài thi trên Udemy.
2. Nhấn `Ctrl + A` (chọn tất cả) $\rightarrow$ `Ctrl + C` (sao chép).
3. Tạo file mới trong thư mục `Practices_Test/`, ví dụ: `udemy_pt1.md`.
4. Dán toàn bộ nội dung vừa copy vào file và lưu lại (`Ctrl + S`).

### Bước 2: Chạy lệnh chuẩn hóa tự động
Mở PowerShell tại thư mục `n:\AWS_XBrain_Note\Practices_Test\` và chạy lệnh:

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\format_practice_test.ps1 -InputFile .\udemy_pt1.md
```

> 💡 **Cơ chế an toàn**: Script sẽ tự động tạo một bản sao lưu `udemy_pt1.md.bak` trước khi chuẩn hóa và ghi đè dữ liệu mới.

---

## ⚙️ Các Tham Số Lệnh (Parameters)

| Tham số | Bắt buộc | Mặc định | Mô tả |
| :--- | :---: | :---: | :--- |
| `-InputFile` | **Có** | - | Đường dẫn tới file markdown chứa câu hỏi thô |
| `-OutputFile` | Không | Ghi đè InputFile | Đường dẫn file xuất ra (nếu muốn lưu sang file khác) |
| `-MetaFile` | Không | Tự động dò tìm | File JSON chứa tiêu đề tùy chỉnh (mặc định dùng `config_template.json`) |
| `-ExamTitle` | Không | Tự tạo theo tên file | Tiêu đề lớn hiển thị ở đầu bài thi |
| `-NoBackup` | Không | `$false` | Thêm cờ này nếu không muốn tạo file `.bak` |

### Ví dụ nâng cao:

1. **Chuẩn hóa và lưu ra file mới mà không ghi đè**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\tools\format_practice_test.ps1 -InputFile .\udemy_pt2_raw.md -OutputFile .\udemy_pt2.md
   ```

2. **Áp dụng file metadata tùy chỉnh (có tiêu đề câu hỏi riêng)**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\tools\format_practice_test.ps1 -InputFile .\udemy_pt6.md -MetaFile .\tools\pt6_metadata.json
   ```

3. **Chỉ định tiêu đề bài thi tùy ý**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\tools\format_practice_test.ps1 -InputFile .\udemy_pt3.md -ExamTitle "AWS Solutions Architect Practice Exam 3 (Neal Davis)"
   ```

---

## 🌟 Những Gì Script Sẽ Tự Động Thực Hiện

1. **Thống kê & Chấm điểm (Performance Summary)**:
   - Tự động đếm số câu hỏi, số câu trả lời đúng/sai và tính điểm phần trăm.
   - Hiển thị nhãn **PASSED (ĐẠT)** nếu đạt $\ge 72\%$ hoặc **FAILED (CHƯA ĐẠT)**.
2. **Ma trận phân tích 4 Miền kiến thức (Domains Matrix)**:
   - Tự động nhóm câu hỏi theo:
     - *Domain 1: Design Secure Architectures (30%)*
     - *Domain 2: Design Resilient Architectures (26%)*
     - *Domain 3: Design High-Performing Architectures (24%)*
     - *Domain 4: Design Cost-Optimized Architectures (20%)*
   - Tính tỷ lệ chính xác và đánh giá năng lực cho từng Domain.
3. **Bảng trọng tâm ôn tập các câu làm sai (Focused Revision)**:
   - Tự động lọc ra toàn bộ các câu trả lời chưa chính xác.
   - Tổng hợp đáp án đúng và liên kết neo nhảy nhanh trực tiếp tới câu hỏi.
4. **Mục lục điều hướng nhanh (Interactive Index)**:
   - Bảng 65 câu hỏi gắn nhãn trạng thái `✅ Đúng` / `❌ Sai` và anchor link để nhảy nhanh.
5. **Chuẩn hóa cấu trúc từng câu hỏi**:
   - Tách biệt rõ ràng: Đề bài $\rightarrow$ Các phương án `(A)`, `(B)`, `(C)`, `(D)` kèm nhãn nhận biết phương án đã chọn và đáp án đúng.
   - Đóng gói toàn bộ giải thích chi tiết vào thẻ mở rộng/thu gọn `<details><summary>` để hỗ trợ việc tự làm lại đề thi.
   - Làm sạch văn bản giải thích phương án sai (Distractors analysis).
   - Chuyển đổi các liên kết thô thành Markdown link tới AWS Documentation chính thức.
