# 18. Metadata SOP 2026 — Title Tag + Meta Description (Navboost + AI Anchor Text)

> Quy trình Vận hành Chuẩn (SOP) cho việc tối ưu **Thẻ tiêu đề HTML** và **Mô tả Meta**, áp dụng từ 2026. Đây là source of truth cho mọi skill `on-page/Title`, `on-page/Descriptions` và Phase Metadata trong `content/Content Writing`. Áp dụng cho cả SERP truyền thống lẫn AI search (ChatGPT / Perplexity / Claude / Gemini / Copilot).

## 1. Tại sao Metadata 2026 quan trọng hơn

Trong kỷ nguyên tìm kiếm hiện đại, Metadata KHÔNG còn là khai báo kỹ thuật tĩnh. Đây là **điểm chạm chiến lược** trên cả Google truyền thống và AI search.

### Cơ chế ranking liên quan

| Cơ chế | Ý nghĩa | Tác động Metadata |
|--------|---------|-------------------|
| **Navboost** | Algorithm Google ghi nhận tín hiệu tương tác (CTR + dwell time + last good click) | Metadata hấp dẫn → CTR cao → Navboost push thứ hạng |
| **Snippet generation** | Google tự tạo snippet ~**72% trường hợp** thay vì dùng meta description do website cung cấp | Phải viết description đủ chất lượng để Google chấp nhận, hoặc dùng `nosnippet` để khoá |
| **AI Anchor Text** | LLM (ChatGPT/Claude/Perplexity) dùng **Thẻ tiêu đề HTML** làm văn bản neo khi trích dẫn nguồn | Title viết kém → AI trích dẫn rời rạc / không brand-aware |

### Quy định thuật ngữ

- **Thẻ tiêu đề HTML (`<title>`)** = đúng về kỹ thuật. "Meta Title" là gọi quen miệng nhưng **sai về thuật ngữ** — không có thẻ `<meta name="title">`.
- **Mô tả meta (`<meta name="description">`)** = **CRO factor**, KHÔNG phải ranking factor trực tiếp.
- **Snippet** = đoạn văn bản thực tế hiển thị trên SERP (có thể khác meta description do Google tự sinh).

## 2. Tiêu chuẩn kỹ thuật & định dạng

### Bảng thông số chuẩn 2026

| Yếu tố | Giới hạn ký tự | Giới hạn pixel | Lưu ý |
|--------|----------------|----------------|-------|
| **Thẻ tiêu đề** | 50–60 ký tự | **< 550 pixels** | Google bôi đậm keyword khớp truy vấn → tăng diện tích pixel; cần trừ hao khoảng trống |
| **Mô tả meta** | **TỐI ĐA 135 ký tự** | Không có giới hạn pixel chính thức | Mobile-optimized (trung bình mobile = 135.87 ký tự). Vượt 135 → bị cắt trên mobile |

> ⚠️ **Đổi chuẩn so với pre-2026**: cũ 150-160 ký tự (desktop-first), mới 135 ký tự (mobile-first). Bài đã viết KHÔNG bắt buộc rewrite ngay, nhưng khi **refresh hoặc viết mới** phải áp 135 ký tự.

### Quy tắc tối ưu diện tích & UX

| Quy tắc | Đúng | Sai |
|---------|------|-----|
| Tránh ALL-CAPS | "Giá thép hình U mới nhất 2026" | "GIÁ THÉP HÌNH U MỚI NHẤT 2026" |
| Tiết kiệm pixel | `Sản phẩm A & B` | `Sản phẩm A and B` |
| Dấu ngăn cách hẹp | `Thép hình U: bảng giá mới` hoặc `Thép hình U \| Thép Bảo Tín` | `Thép hình U - bảng giá mới` hoặc `Thép hình U — bảng giá mới` |
| Không em dash | `Thép hình U: thông số` | `Thép hình U — thông số` |

> ⭐ **Lý do bỏ dash/em dash**: dash chiếm nhiều pixel hơn `:` và `\|`; em dash còn là dấu hiệu AI-generated text (xem `knowledge/15-anti-ai-content-rules.md`).

### Công cụ bắt buộc

1. **Semrush Google SERP Simulator** — mô phỏng hiển thị trên Mobile + Desktop trước khi triển khai
2. **GSC URL Inspection** — kiểm tra Google rendering sau khi publish 24-48h
3. **Browser DevTools** — đo pixel render thực tế của title trên SERP

## 3. Quy tắc sáng tạo nội dung Metadata

### Nguyên tắc gốc

> "Viết cho người dùng, cấu trúc cho thuật toán."

Metadata phải **phản ánh chính xác nội dung bên trong** để trải nghiệm người dùng liền mạch (tránh "lừa click" → tăng bounce rate → Navboost ghi negative signal).

### 4 nguyên tắc thực thi

1. **Benchmarking trước khi viết**:
   - Kiểm tra Top 10 SERP cho keyword chính
   - Kiểm tra các trang được **AI Overview / ChatGPT / Perplexity trích dẫn** (search ẩn danh)
   - Note lại pattern title/description AI đang ưu tiên

2. **Tối ưu keyword**:
   - Chèn keyword chính **MỘT LẦN DUY NHẤT** trong title
   - Tuyệt đối không nhồi nhét (Keyword Stuffing) → AI + Google 2026 nhạy cảm với spam → hạ thứ hạng

3. **Câu mệnh lệnh (Imperative Sentences)**:
   - Động từ mạnh thúc đẩy click: "Khám phá", "Tải tài liệu", "So sánh giá", "Tính ngay", "Đặt ngay"
   - Ưu tiên đặt cuối description làm CTA

4. **Sự đồng nhất Title ↔ H1**:
   - Thẻ tiêu đề và H1 trên trang phải tương đồng (gần như nhau, không cần 100% identical)
   - Lệch quá → user cảm giác bị lừa click → bounce ↑ → Navboost negative

### Mẫu cấu trúc theo Search Intent

| Intent | Mẫu Title | Ví dụ thực |
|--------|-----------|-----------|
| **Informational (What is)** | `{Keyword} là gì? {Lợi ích/Đặc điểm} ({Năm})` | "Thép hình U là gì? Quy cách & ứng dụng (2026)" |
| **How-to** | `Cách {nhiệm vụ}: {Số bước} ({Đặc điểm})` | "Cách chọn thép hình U: 5 bước (kèm bảng quy cách)" |
| **Sản phẩm (Transactional)** | `{Tên sản phẩm} — {Lợi ích chính} \| {Thương hiệu}` | "Thép hình U VinaOne — Giá CK đại lý \| Thép Bảo Tín" |
| **So sánh (Commercial)** | `{A} vs {B}: {Tiêu chí chọn}? ({Năm})` | "Thép U SS400 vs SS540: chọn loại nào? (2026)" |

> Khớp mẫu với search_intent (I/N/C/T) trong SEO Metadata blockquote.

## 4. Mẫu Metadata 2026 (áp dụng vào content-template)

```markdown
> **SEO Metadata**
> - **title**: "{Tiêu đề bài viết — H1}"
> - **slug**: "{slug-url}"
> - **meta_title**: "{Title tag 50-60 ký tự, <550 pixels, khớp Title-H1, theo 1 trong 4 mẫu intent}"
> - **meta_description**: "{Mô tả ≤ 135 ký tự, value-prop + imperative CTA, mobile-first}"
> - **target_keyword**: "{keyword chính — chèn 1 lần duy nhất trong meta_title}"
> - **search_intent**: "I | N | C | T"
> - **summary_chunk**: "{50 chữ trả lời trực diện cho AI Overview — xem section 5}"
> - **entities**: "{thực thể chính, ngăn cách bằng dấu phẩy}"
> - **author**: "{Tên tác giả} | {URL ProfilePage}"
> - **embed_video_url**: "{TikTok/Shorts URL nếu có, để '' nếu không}"
> - **aio_readiness**: "true | false"
```

## 5. Tích hợp với AI Overview (Summary Chunk)

Để bài được AI Overview trích dẫn, mỗi bài cần 1 **Summary Chunk 50 chữ** ở đầu (sau H1 và meta blockquote, trước H2 đầu tiên):

```markdown
> **Tóm tắt nhanh** (cho AI Overview):
> Thép hình U VinaOne là dạng thép định hình mặt cắt chữ U, dùng làm khung kết cấu công nghiệp. Có 3 mác phổ biến (SS400, SS540, CT38), quy cách từ 50x40 đến 250x90, dung sai theo JIS G3192 hoặc TCVN 7571. Liên hệ Thép Bảo Tín để báo giá đại lý.
```

Đặc điểm Summary Chunk:
- 40-60 chữ (~50 chữ là chuẩn)
- Trả lời trực diện câu hỏi chính (intent của target_keyword)
- Chứa 1-2 entity quan trọng
- KHÔNG dùng câu mở "Trong bài viết này...", "Hãy cùng tìm hiểu..."

## 6. Kiểm soát chất lượng (QC) & Đo lường

### Site-level QC định kỳ

Chạy **Site Audit** (Semrush/Ahrefs/Screaming Frog) hằng tuần:
- [ ] Trang thiếu thẻ tiêu đề hoặc mô tả → fix
- [ ] Metadata duplicate (≥2 trang cùng title) → consolidate hoặc rewrite
- [ ] Title quá dài / quá ngắn so với chuẩn pixel → rewrite

### Đo lường qua Google Search Console (2-3 tuần sau update)

| Tín hiệu GSC | Diễn giải | Hành động |
|--------------|-----------|----------|
| CTR ↑ + Position giữ nguyên | Metadata mới win | Giữ, scale pattern cho bài khác |
| CTR ↓ + Position ↑ | Metadata không khớp intent dù rank cao | Rewrite, đối chiếu lại 4 mẫu intent |
| Impressions ↑ | Title mới giúp hiển thị cho nhiều truy vấn | Mở rộng semantic keywords trong body |
| CTR ↓ + Position ↓ | Metadata + content đều có vấn đề | Rollback hoặc heavy refresh |

### Track lưu lượng AI (GA4)

Tạo segment hoặc filter trong **Traffic acquisition report**:

**Regex match Session source/medium**:
```
.*(chatgpt\.com|openai\.com|perplexity\.ai|claude\.ai|gemini\.google\.com|bard\.google\.com|you\.com|search\.brave\.com|copilot\.microsoft\.com).*
```

Chỉ số theo dõi:
- **AIO Inclusion Rate** = (số bài được AI Overview trích dẫn) / (tổng bài đã publish trong cluster)
- **AI referral sessions** = traffic từ regex trên
- **Branded search lift** = % tăng search "keyword + tên thương hiệu" trên GSC sau khi bài được AI trích dẫn

## 7. Checklist Self-Correction (chạy trước khi commit Metadata)

```
THẺ TIÊU ĐỀ HTML:
[ ] 50-60 ký tự?
[ ] < 550 pixels (test bằng SERP Simulator)?
[ ] Keyword chính xuất hiện đúng 1 lần?
[ ] Không ALL-CAPS?
[ ] Dùng & (không "and"), : hoặc | (không -, —)?
[ ] Title-H1 tương đồng?
[ ] Theo 1 trong 4 mẫu intent (What-is / How-to / Product / Comparison)?
[ ] Có câu mệnh lệnh / imperative verb (cho mẫu Product / Comparison)?

MÔ TẢ META:
[ ] ≤ 135 ký tự?
[ ] Value-prop rõ ràng trong 80 ký tự đầu?
[ ] CTA mạnh ở cuối (động từ mệnh lệnh)?
[ ] Không nhồi keyword?
[ ] Match nội dung bài (không over-promise)?

BONUS 2026:
[ ] Đã thêm summary_chunk 50 chữ sau H1?
[ ] Đã liệt kê entities trong frontmatter?
[ ] Đã link author tới ProfilePage / LinkedIn?
[ ] Đã test SERP Simulator (Mobile + Desktop)?
```

## 8. Khi nào dùng `nosnippet`

Chỉ dùng `<meta name="robots" content="nosnippet">` khi:
- Bài chứa thông tin nhạy cảm không muốn lộ trên SERP
- Bài đang test A/B, muốn ép Google dùng đúng meta description đã viết
- Bài bị Google rewrite snippet thành dạng không mong muốn (sau 2-3 tuần đo)

KHÔNG dùng nosnippet cho:
- Toàn bộ site (mất CTR đại trà)
- Bài evergreen quan trọng (Google rewrite snippet thường tốt hơn)

## 9. Tích hợp với các skill khác

| Khi cần | Skill / Note tham chiếu |
|---------|--------------------------|
| Viết title tag chi tiết | `skills/on-page/Title/SKILL.md` (đã update với 4 mẫu intent + pixel) |
| Viết meta description | `skills/on-page/Descriptions/SKILL.md` (đã update 135 chars + UX rules) |
| Tích hợp Metadata vào workflow bài viết | `skills/content/Content Writing/SKILL.md` Phase Metadata |
| Audit metadata toàn site | `skills/content/Topical Audit/SKILL.md` Phase 1.2 + Phase 4 |
| Refresh bài cũ — bắt buộc cập nhật metadata theo chuẩn 2026 | `skills/content/Content Refresh/SKILL.md` |
| Schema cho ProfilePage tác giả | `skills/technical/Schema Markup/SKILL.md` |
| Track AI traffic + AIO Inclusion Rate | `skills/analytics/Google Analytics/SKILL.md` |

## 10. Đầu ra

Bằng cách tuân thủ SOP này, dự án sẽ có nền tảng Metadata bền vững, tối ưu cả:
- **Hiển thị trước thuật toán Navboost** (CTR ↑ → ranking ↑)
- **Thuyết phục người dùng nhấp** (4 mẫu intent + imperative CTA)
- **Khả năng được AI trích dẫn brand-aware** (title làm Anchor Text + summary chunk 50 chữ + ProfilePage schema cho author)
