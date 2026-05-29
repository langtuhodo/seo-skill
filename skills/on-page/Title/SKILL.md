# Title Tag — Tối ưu thẻ tiêu đề

## 1. Purpose / Mục đích
Title tag là **yếu tố on-page có ROI cao nhất** sau content quality. Nó vừa là tín hiệu xếp hạng, vừa là "quảng cáo" trên SERP quyết định CTR. Tối ưu title tốt có thể tăng traffic 20–50% mà không cần viết thêm content. Skill này xử lý cả ranking signal lẫn CTR persuasion.

## 2. Core Concepts / Khái niệm cốt lõi

- **Thẻ tiêu đề HTML (`<title>`)** ≠ H1. Title hiển thị trên SERP/tab; H1 hiển thị trên trang. **"Meta Title" sai về thuật ngữ** — không có thẻ `<meta name="title">`. (2026) Title-H1 phải **tương đồng** — lệch → user thấy lừa click → bounce ↑ → Navboost negative.
- **AI Anchor Text (2026)**: LLM (ChatGPT/Claude/Perplexity) dùng title làm văn bản neo khi trích dẫn nguồn. Title generic → AI trích dẫn rời rạc, không brand-aware.
- **Pixel width**, không phải số ký tự. Chuẩn 2026: **< 550 pixels** (50–60 ký tự Latin, 30–40 ký tự tiếng Việt có dấu). Google bôi đậm keyword trùng truy vấn → tăng diện tích pixel → cần trừ hao.
- **Navboost (2026)**: Google ghi nhận CTR + dwell time + last good click. Title hấp dẫn → CTR ↑ → Navboost push ranking. **Metadata = điểm chạm chiến lược**, không phải khai báo kỹ thuật tĩnh.
- **Google rewrite**: từ 2021 Google rewrite ~60% title (mô tả meta bỏ qua ~72%). Nguyên nhân: title nhồi keyword, generic, hoặc không khớp content/intent.
- **Front-loading**: keyword chính ở đầu title được trọng số ranking cao hơn + thu hút mắt trên SERP. **Keyword 1 lần duy nhất**, không stuff.
- **CTR curve**: position 1 ~30% CTR, vị trí 2 ~15%, vị trí 3 ~10%. Title tốt có thể đẩy CTR vượt benchmark theo position.
- **Branded suffix**: thêm `\| Brand` cuối title (dùng `\|` thay vì `-` hoặc `—` — tiết kiệm pixel + tránh em dash AI-signal). Có lợi cho brand awareness.
- **UX rules 2026**: tránh ALL-CAPS (tốn pixel + giảm uy tín), dùng `&` thay `and`.

## 3. When to use
- Mỗi khi tạo trang mới.
- Khi rewrite content / refresh.
- Khi GSC cho thấy CTR thấp hơn benchmark theo position.
- Khi Google rewrite title khác với title mình đặt → cần điều chỉnh.

## 4. Workflow viết title

### Bước 1. Xác định target keyword + intent + position hiện tại
- Keyword chính (head) + 1–2 modifier có volume.
- Intent đã xác định ở skill Search Intent.
- Position hiện tại quyết định độ "aggressive": top 10 thì rewrite cho CTR; top 30+ thì rewrite cho ranking signal trước.

### Bước 2. Viết title theo 4 mẫu intent (2026 — bắt buộc)

Mẫu cấu trúc chuẩn 2026 theo Search Intent (xem `knowledge/18-metadata-sop-2026.md`):

| Intent | Mẫu | Ví dụ (tiếng Việt) |
|--------|------|---------------------|
| **Informational (What is)** | `{Keyword} là gì? {Lợi ích/Đặc điểm} ({Năm})` | "Thép hình U là gì? Quy cách & ứng dụng (2026)" |
| **How-to** | `Cách {nhiệm vụ}: {Số bước} ({Đặc điểm})` | "Cách chọn thép hình U: 5 bước (kèm bảng quy cách)" |
| **Sản phẩm (Transactional)** | `{Tên SP} — {Lợi ích} \| {Thương hiệu}` | "Thép hình U VinaOne — Giá CK đại lý \| Thép Bảo Tín" |
| **So sánh (Commercial)** | `{A} vs {B}: {Tiêu chí}? ({Năm})` | "Thép U SS400 vs SS540: chọn loại nào? (2026)" |

Khớp mẫu với `search_intent` (I/N/C/T) trong SEO Metadata blockquote.

Mẫu bổ sung khi 4 mẫu trên không khớp:
1. `{Number} {Keyword} {Benefit}` — "9 mẫu title tag tăng CTR cho ecommerce VN"
2. `{Keyword} for {Persona/Use case}` — "Keyword research cho ngành F&B: hướng dẫn 2026"

### Bước 3. Áp dụng nguyên tắc CTR + Imperative Verb (2026)
- **Imperative Verb** (câu mệnh lệnh): "Khám phá", "Tải", "So sánh", "Đặt", "Tính" — thúc đẩy click (ưu tiên cho mẫu Product / Comparison).
- **Số cụ thể**: "5", "2026", "30%" → click magnet.
- **Power word**: "Hoàn chỉnh", "Cuối cùng", "Mới nhất", "Miễn phí", "Bí mật" — dùng tiết chế, đừng clickbait.
- **Brackets/parens** `(Updated 2026)` `[Free Template]` — tăng CTR ~10–20% trong A/B test.
- **Promise + Trade-off**: "Without Coding", "No Budget", "Trong 7 ngày".
- Tránh ALL-CAPS, em dash `—`, emoji (Google có thể strip).

### Bước 4. Kiểm tra pixel width (bắt buộc — SERP Simulator)
- **Bắt buộc** dùng **Semrush Google SERP Simulator** (mobile + desktop) trước khi triển khai.
- Mô phỏng được cả keyword được bôi đậm → thay đổi pixel thực.
- Tiếng Việt có dấu chiếm pixel hơn → cần ngắn hơn (~30-40 ký tự thay vì 60).
- Ngưỡng an toàn: **< 550 pixels** (đường "…" cắt).
- Đảm bảo keyword chính nằm trong phần hiển thị (không bị "…").

### Bước 5. Differentiate với top 10 SERP hiện tại
- Search keyword → đọc 10 title đối thủ.
- Nếu top toàn dùng "Best X 2025" → dùng angle khác: "X for Beginners (2025)", "X Without Y", "X cho doanh nghiệp Việt".

### Bước 6. Đảm bảo Title-H1 alignment + khớp content (2026)
- Title và H1 phải **tương đồng** (gần như nhau, không cần 100% identical). Lệch → user cảm giác bị lừa → bounce → Navboost negative.
- Title hứa gì, H1/intro/body phải deliver y vậy.
- Mismatch → Google rewrite + bounce rate cao.

### Bước 7. Đo lường & iterate
- Baseline 28 ngày trước khi rewrite (CTR, position).
- Sau khi rewrite: chờ 14–28 ngày để Google re-render.
- So sánh CTR, ấn impressions, position.
- Lưu kết quả test vào sheet để tìm pattern title work tốt cho ngách của mình.

## 5. Template Sheet — Title Test Backlog

| URL | Target KW | Old Title | New Title | Position avg | CTR before | CTR after | Δ Traffic | Status |

## 6. KPI đo lường
- CTR uplift % so với benchmark theo position.
- # title bị Google rewrite / total (mục tiêu < 20%).
- Trang có title chứa keyword chính / total trang index.
- Avg position uplift sau rewrite.
- # SERP feature (title trong featured snippet) chiếm được.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Search Console | Free | CTR / impressions / position theo query |
| Mangools SERP Simulator | Freemium | Pixel preview |
| Yoast / RankMath | Free | Realtime check trong WordPress |
| Screaming Frog | Free/Paid | Audit toàn site title (length, dup) |
| Sitebulb | Paid | Title issue priority |
| ChatGPT/Claude | Freemium | Generate 10 phương án title nhanh |
| Ahrefs SERP overview | Paid | Soi title đối thủ + DR |
| CTR Bench (industry curve) | Free | So sánh CTR theo position |

### Prompt LLM gợi ý
```
Bạn là copywriter SEO. Viết 10 phương án title tag cho keyword "{keyword}" với intent "{intent}". Yêu cầu:
- Front-load keyword chính.
- ≤ 60 ký tự Latin (hoặc ≤ 35 ký tự tiếng Việt có dấu).
- Mỗi phương án dùng 1 công thức khác nhau (số, year, comparison, persona, benefit).
- Tránh clickbait.
Trả về dạng bảng: title | công thức | điểm CTR ước tính (1-10).
```

## 8. Common mistakes
- Nhồi 3-4 keyword vào title → spam, Google rewrite.
- Title generic ("Trang chủ", "Bài viết", "Untitled").
- Trùng title giữa nhiều trang (duplicate).
- (2026) Title và H1 lệch nhau → user thấy lừa click → bounce ↑.
- (2026) Dùng `-` hoặc `—` thay vì `\|` hoặc `:` → tốn pixel + em dash là AI signal.
- (2026) ALL-CAPS / viết hoa toàn bộ → tốn pixel + giảm uy tín brand.
- (2026) Không theo 4 mẫu intent → không khớp search_intent → CTR thấp.
- (2026) Không test Semrush SERP Simulator trước triển khai → phát hiện cắt pixel sau khi publish.

## 9. Tham chiếu chuẩn 2026
- `knowledge/18-metadata-sop-2026.md` — SOP đầy đủ: Navboost, AI Anchor Text, 4 mẫu intent, pixel, SERP Simulator, GA4 regex AI traffic
- `knowledge/03-on-page-seo.md` — tóm tắt khi gặp keyword "title tag"
- Title không khớp H1/content → user bounce.
- Đặt brand đầu title cho mọi trang → tốn pixel của keyword.
- Quên mobile preview → title bị cut ở mobile.
- Title bị Google rewrite mà không investigate nguyên nhân.
- Đổi title liên tục, không cho Google đủ thời gian recrawl + đánh giá.
- Bỏ qua emoji/symbol có thể bị strip → dấu hiệu thiếu chuyên nghiệp.

---
**Đầu ra**: title tag tối ưu cho mỗi URL, được track CTR, có baseline & post-change metric.
