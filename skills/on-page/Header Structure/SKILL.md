# Header Structure — Cấu trúc heading H1–H6

## 1. Purpose / Mục đích
Heading structure (H1, H2, H3...) đóng 3 vai trò: (1) **giúp Google hiểu cấu trúc + topic chính**, (2) **giúp người đọc scan**, (3) **là nguồn cho Featured Snippet, AI Overview, sitelink**. Một trang có cấu trúc heading mạch lạc rank tốt hơn và đọc dễ hơn — không cần tối ưu phức tạp, chỉ cần đúng nguyên tắc.

## 2. Core Concepts / Khái niệm cốt lõi

- **Hierarchy**: H1 (1 cái duy nhất) → H2 (mục chính) → H3 (mục con) → H4 (rất hiếm dùng). Không nhảy bậc (đừng từ H2 sang H4).
- **H1 = topic chính của trang** (gần với target keyword, không cần khớp 100%).
- **H2 = các sub-topic chính**, nên cover các angle/sub-intent quan trọng.
- **H3 = chi tiết hoá H2**, dùng khi cần liệt kê các bước, biến thể, ví dụ.
- **Semantic match**: Google match heading với query → dùng heading đặt theo dạng câu hỏi để chiếm Featured Snippet/PAA.
- **Visual hierarchy ≠ HTML hierarchy**: nhiều CMS dùng `<div class="h2">` chỉ để styling — không có giá trị SEO. Phải dùng đúng tag HTML.
- **TL;DR/Table of Contents**: rút từ H2 — viết H2 ngắn gọn, tự-explain.

## 3. When to use
- Mỗi bài blog, landing, pillar.
- Khi audit content cũ (heading lộn xộn là vấn đề thường gặp).
- Khi muốn chiếm Featured Snippet (đặt H2/H3 dạng câu hỏi).

## 4. Workflow viết heading

### Bước 1. Outline trước, viết content sau
- Lấy keyword chính + cluster keyword.
- Brainstorm 5–10 H2 sub-topic.
- Đối chiếu PAA + "People also search" + heading top 5 SERP → bổ sung sub-topic thiếu.
- Đặt thứ tự logic: định nghĩa → tại sao quan trọng → cách làm → ví dụ → công cụ → sai lầm → KPI.

### Bước 2. Viết H1
- 1 cái duy nhất, ≤ 70 ký tự.
- Chứa keyword chính (không nhất thiết khớp 100%, có thể tự nhiên hơn title tag).
- Khác title tag chút để mở rộng semantic.
- Ví dụ: title "12 Title Tag công thức tăng CTR (2025)"; H1 trên trang "12 công thức viết Title Tag tăng CTR cho người Việt".

### Bước 3. Viết H2 theo nguyên tắc
- 4–10 H2 trên bài chuẩn.
- Mỗi H2 = 1 ý lớn, không trùng ý với H2 khác.
- Front-load keyword phụ / question pattern.
- Dùng **ngôn ngữ tự nhiên** thay vì keyword khô khan.
  - Bad: "Title tag là gì"
  - Good: "Title tag là gì và vì sao quyết định CTR?"

### Bước 4. Viết H3 khi cần
- Khi 1 H2 có ≥ 3 sub-point đáng tách riêng.
- Đừng spam H3 — đoạn 2 dòng không cần H3.
- H3 dạng "Bước 1: ...", "Cách 1: ...", "Ví dụ 1: ..." giúp scannable.

### Bước 5. Đảm bảo answer-box-ready
Với mỗi câu hỏi quan trọng (mining từ PAA / GSC):
- H2/H3 = câu hỏi nguyên văn.
- Đoạn ngay dưới: trả lời trực tiếp 40–58 từ (paragraph snippet) hoặc list (list snippet) hoặc table (table snippet).
- Sau đoạn trả lời mới mở rộng chi tiết.

### Bước 6. Audit & fix bằng Screaming Frog
- Crawl site → export H1/H2.
- Phát hiện: trang missing H1, multiple H1, heading rỗng, heading lộn bậc.
- Fix theo priority (money page trước).

## 5. Template outline cho 1 bài informational

```
H1: [Topic chính] — [Year]
   Intro 60-80 từ: hook + promise + TL;DR.
H2: [Topic] là gì? (definition)
H2: Tại sao [topic] quan trọng?
H2: [Cách làm/Quy trình] — N bước
   H3: Bước 1...
   H3: Bước 2...
H2: [Ví dụ / case study]
H2: [Công cụ / template]
H2: [Sai lầm thường gặp]
H2: FAQ
   H3: Câu hỏi 1
   H3: Câu hỏi 2
H2: Kết luận / Next step
```

## 6. KPI đo lường
- # trang có H1 duy nhất / total (mục tiêu 100%).
- # trang có heading hierarchy đúng bậc.
- Featured Snippet captured / total target.
- Avg dwell time (heading rõ → đọc lâu hơn).
- # PAA captured trên SERP target.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Screaming Frog | Free/Paid | Audit H1/H2 toàn site |
| Sitebulb | Paid | Visual heading hierarchy |
| Ahrefs Site Audit | Paid | Heading issue list |
| SurferSEO / Frase / Outranking | Paid | Suggest heading từ top 10 SERP |
| Yoast / RankMath | Free | Realtime check 1 H1, hierarchy |
| ChatGPT/Claude | Freemium | Generate outline H1-H3 từ keyword |
| AlsoAsked / AnswerThePublic | Freemium | Mining câu hỏi để biến thành H2 |

### Prompt LLM outline
```
Bạn là editorial SEO. Tạo outline H1-H3 cho bài về "{topic}" target keyword "{kw}" intent "{intent}". Yêu cầu:
- 1 H1.
- 6-9 H2 cover định nghĩa, tại sao, cách làm, ví dụ, tools, sai lầm, FAQ.
- Mỗi H2 có 0-3 H3 nếu cần.
- Mỗi H2 viết dạng câu hỏi nếu phù hợp PAA.
Trả về dạng cây bullet.
```

## 8. Common mistakes
- Multiple H1 trên 1 trang (template builder thường gây).
- Dùng heading chỉ để styling, không reflect cấu trúc.
- H2 toàn keyword khô, không tự nhiên.
- Bỏ qua H2 dạng câu hỏi → mất cơ hội PAA/Featured Snippet.
- Heading rỗng, heading-only-icon.
- Nhảy bậc H2 → H4.
- Tag ảnh / button bằng `<h3>` chỉ vì kích thước chữ.
- Outline đẹp nhưng content không deliver theo từng H2 → user thất vọng.

---
**Đầu ra**: mỗi trang có outline heading sạch, semantic, ready cho Featured Snippet & AI Overview.
