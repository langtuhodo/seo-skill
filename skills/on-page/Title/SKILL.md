# Title Tag — Tối ưu thẻ tiêu đề

## 1. Purpose / Mục đích
Title tag là **yếu tố on-page có ROI cao nhất** sau content quality. Nó vừa là tín hiệu xếp hạng, vừa là "quảng cáo" trên SERP quyết định CTR. Tối ưu title tốt có thể tăng traffic 20–50% mà không cần viết thêm content. Skill này xử lý cả ranking signal lẫn CTR persuasion.

## 2. Core Concepts / Khái niệm cốt lõi

- **Title tag (`<title>`)** ≠ H1. Title hiển thị trên SERP/tab; H1 hiển thị trên trang. Hai cái có thể khác nhau (và nên khác nhau khi cần tối ưu CTR).
- **Pixel width**, không phải số ký tự. Mobile/desktop khác nhau. Ngưỡng an toàn: ~580px (~50–60 ký tự Latin, ~30–40 ký tự tiếng Việt có dấu).
- **Google rewrite**: từ 2021 Google rewrite ~60% title. Nguyên nhân chính: title nhồi keyword, generic, hoặc không khớp content.
- **Front-loading**: keyword chính ở đầu title được trọng số ranking cao hơn (theo nhiều test) và thu hút mắt trên SERP.
- **CTR curve**: position 1 ~30% CTR, vị trí 2 ~15%, vị trí 3 ~10%. Title tốt có thể đẩy CTR vượt benchmark theo position.
- **Branded suffix**: thêm "| Brand" cuối title. Có lợi cho brand awareness, hơi tốn pixel.

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

### Bước 2. Viết 5 phương án title theo công thức

Công thức phổ biến (dùng được cho tiếng Việt):
1. `{Keyword chính}: {Số/Năm} {Benefit/Differentiator}`
   - "SEO On-page: 12 Yếu Tố Quan Trọng Nhất 2025"
2. `How to {Keyword}: {Outcome} in {Timeframe}`
   - "Cách viết Title chuẩn SEO: tăng CTR 30% trong 1 tuần"
3. `{Number} {Keyword} {Benefit}`
   - "9 mẫu title tag tăng CTR cho ecommerce VN"
4. `{Keyword} vs {Alternative}: {Recommendation}`
   - "Ahrefs vs Semrush: nên chọn cái nào năm 2025?"
5. `{Keyword} for {Persona/Use case}`
   - "Keyword research cho ngành F&B: hướng dẫn 2025"

### Bước 3. Áp dụng nguyên tắc CTR
- **Số cụ thể**: "12", "2025", "30%" → click magnet.
- **Power word**: "Hoàn chỉnh", "Cuối cùng", "Mới nhất", "Miễn phí", "Bí mật" — dùng tiết chế, đừng clickbait.
- **Brackets/parens** `(Updated 2025)` `[Free Template]` — tăng CTR ~10–20% trong A/B test.
- **Promise + Trade-off**: "Without Coding", "No Budget", "Trong 7 ngày".
- Tránh tất cả CAPS, emoji có thể bị Google strip.

### Bước 4. Kiểm tra pixel width
- Dùng Mangools SERP Simulator / Yoast preview.
- Tiếng Việt có dấu chiếm pixel hơn → cần ngắn hơn.
- Đảm bảo keyword chính nằm trong phần hiển thị (không bị "…").

### Bước 5. Differentiate với top 10 SERP hiện tại
- Search keyword → đọc 10 title đối thủ.
- Nếu top toàn dùng "Best X 2025" → dùng angle khác: "X for Beginners (2025)", "X Without Y", "X cho doanh nghiệp Việt".

### Bước 6. Đảm bảo khớp content
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
- Title không khớp H1/content → user bounce.
- Đặt brand đầu title cho mọi trang → tốn pixel của keyword.
- Quên mobile preview → title bị cut ở mobile.
- Title bị Google rewrite mà không investigate nguyên nhân.
- Đổi title liên tục, không cho Google đủ thời gian recrawl + đánh giá.
- Bỏ qua emoji/symbol có thể bị strip → dấu hiệu thiếu chuyên nghiệp.

---
**Đầu ra**: title tag tối ưu cho mỗi URL, được track CTR, có baseline & post-change metric.
