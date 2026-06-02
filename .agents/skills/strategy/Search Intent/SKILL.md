---
name: search-intent
version: 1.0.0
description: "Use this skill when the user asks about search intent: 'search intent', 'ý định tìm kiếm', 'intent của keyword X', 'intent mismatch'. Covers 4 intent types (info/nav/commercial/transactional), SERP analysis, intent-content alignment."
category: strategy
---

# Search Intent — Ý định tìm kiếm

## 1. Purpose / Mục đích
Search Intent là **lý do thực sự** đứng sau mỗi truy vấn. Google ngày càng giỏi đoán intent hơn là khớp từ khoá — vì vậy nội dung không khớp intent sẽ không bao giờ rank ổn định, dù on-page chuẩn tới đâu. Skill này giúp bạn đọc vị intent từ SERP và chọn đúng **format + angle + depth** cho content.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Bốn nhóm intent kinh điển
- **Informational (I)**: muốn học/biết. Ví dụ: "what is seo", "cách làm bánh flan". Format: blog, video, definition, how-to.
- **Navigational (N)**: muốn đi tới một site/brand cụ thể. Ví dụ: "facebook login", "ahrefs pricing". Format: brand page.
- **Commercial Investigation (C)**: đang so sánh, chuẩn bị mua. Ví dụ: "best crm 2025", "ahrefs vs semrush". Format: listicle, comparison, review.
- **Transactional (T)**: sẵn sàng hành động (mua, đăng ký, tải). Ví dụ: "buy macbook m4", "đặt vé máy bay hà nội đà nẵng". Format: product, pricing, landing page.

### 2.2 Intent modifiers (sub-intent)
Cùng 1 chủ đề nhưng intent thay đổi theo modifier:
- "X" → ambiguous
- "what is X" → informational
- "how to X" → tutorial / step-by-step
- "best X" / "top X" → commercial listicle
- "X vs Y" → comparison
- "X review" → review
- "X for {persona/use case}" → niche commercial
- "X near me" / "X tại {city}" → local
- "X price / cost / pricing" → transactional-ish

### 2.3 Intent có thể là HỖN HỢP
SERP của "seo tools" có cả listicle (commercial), pricing page (transactional), và guide (informational). Phải xác định **dominant intent** theo % top 10.

### 2.4 Intent = format + depth + angle, không chỉ là từ khoá
- Format: blog post, listicle, video, calculator, infographic, product page.
- Depth: 800 từ vs 4000 từ (do SERP quyết định, không phải cảm tính).
- Angle: beginner vs advanced, B2B vs B2C, local vs global.

## 3. When to use
- Trước khi viết bất kỳ bài nào (mỗi bài 1 lần).
- Khi bài đã viết mà không rank → diagnose intent mismatch.
- Khi thiết kế landing page (đảm bảo intent khớp với CTA).
- Khi audit content cũ — content commercial mà viết kiểu informational là lý do thường gặp khiến trang không convert.

## 4. Workflow / Quy trình đọc vị intent từ SERP

### Bước 1. Search keyword ở chế độ ẩn danh + đúng vị trí địa lý của target audience
Dùng VPN/Google ads location simulator, tránh personalization làm sai SERP.

### Bước 2. Phân loại 10 kết quả tự nhiên
Với mỗi URL top 10, tag:
- Format (blog, listicle, product, tool, video, …).
- Intent (I/N/C/T).
- Word count ước lượng.
- Có schema gì (review, FAQ, how-to)?
- Domain type (publisher, brand, marketplace, forum)?

### Bước 3. Đếm tỉ lệ
Nếu 7/10 là listicle "Best …" → dominant intent = Commercial-Listicle. Đừng cố viết how-to.

### Bước 4. Phân tích SERP features
- Featured Snippet → có cơ hội cướp position 0 nếu trả lời trực tiếp.
- People Also Ask → mining sub-intent.
- Video carousel → cần video, không chỉ blog.
- Image pack → tối ưu image SEO.
- Shopping / Product → intent transactional.
- AI Overview (SGE/Gemini) → cần content được trích dẫn (cite-able).

### Bước 5. Xác định angle thắng cuộc
Đọc kỹ 3 bài top:
- Bài đó cover gì? bỏ sót gì?
- Tone (beginner/expert)?
- Pain point nào được nhấn?
- Có data/example/template gì độc đáo?

→ Brief content = "match intent + làm tốt hơn ở 2-3 dimension".

### Bước 6. Map intent vào funnel + CTA
- Informational → CTA mềm: subscribe, download, related guide.
- Commercial → CTA: free trial, demo, comparison sheet.
- Transactional → CTA: buy, signup, contact sales.

CTA sai intent = bài rank cao nhưng không convert.

## 5. Template Intent Audit (Google Sheet)

| URL trong top 10 | Format | Intent (I/N/C/T) | Word count | Schema | Sub-intent | Note |
|---|---|---|---|---|---|---|

→ Ô tổng kết: dominant intent, recommended format, recommended depth, content gaps.

## 6. KPI đo lường
- % bài viết có intent-match score ≥ 8/10 (rubric nội bộ).
- Bounce rate / Engagement rate trên content (GA4) — intent đúng thì engagement cao.
- Avg position trong 4 tuần đầu sau khi publish.
- CTR thực tế trong GSC vs CTR benchmark theo position.
- Tỉ lệ bài rank top 10 / total bài publish.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google ẩn danh + Ads Preview Tool | Free | Soi SERP chuẩn theo geo |
| Semrush Keyword Overview | Paid | Gắn nhãn intent tự động |
| Ahrefs Keywords Explorer | Paid | Intent column + SERP overview |
| SurferSEO / Frase | Paid | NLP analysis của top 10 |
| AlsoAsked | Freemium | PAA mining |
| Keyword Insights | Paid | Cluster theo SERP overlap (proxy cho intent) |
| ChatGPT/Claude | Freemium | Tag intent hàng loạt theo prompt template |

### Prompt LLM gợi ý (Vietnamese)
```
Bạn là chuyên gia SEO. Với mỗi keyword sau, gắn nhãn intent (I/N/C/T) và sub-intent (how-to, listicle, comparison, review, definition, local, price). Trả về JSON.
[paste keyword list]
```

## 8. Common mistakes
- Chọn intent dựa vào keyword mà không xem SERP.
- Viết blog informational cho keyword commercial → không convert.
- Viết landing page transactional cho keyword informational → không rank.
- Bỏ qua SERP feature → viết content 5000 từ trong khi Google trả về AI Overview/Video.
- Cho rằng intent ổn định — sau update Google hoặc xu hướng mới, intent có thể đổi (ví dụ "chatgpt vs claude" 2023 vs 2025 khác hẳn).
- Áp đặt format mong muốn (vd: muốn bán hàng) thay vì format SERP đang yêu cầu.
- Không phân biệt intent giữa các thị trường — "best phone" ở US và VN có dominant intent khác nhau.

---
**Đầu ra**: mỗi keyword có 1 intent label rõ ràng, gắn vào Keyword Map, làm input cho Content Brief.
