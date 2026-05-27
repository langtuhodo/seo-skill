# Playbook 07 — Brand Distribution Workflow

> End-to-end workflow phủ thương hiệu đa kênh: GBP + Facebook + Zalo OA + Local SEO
> User đưa chủ đề → AI phân bổ kênh + viết sẵn content → xuất file .md hoặc .csv

---

## Khi nào dùng Playbook này

- Khi nhận task "phủ thương hiệu" / "brand distribution" / "multi-channel plan"
- Khi user yêu cầu "lên plan tuần" / "lên lịch đăng bài" / "content calendar"
- Khi muốn plan tổng thể cho cả 3 kênh (không chỉ 1 kênh riêng lẻ)
- Khi cần unified calendar gộp GBP + Facebook + Zalo vào 1 bảng
- Khi setup brand presence từ đầu cho dự án mới

---

## Prerequisites

Trước khi chạy playbook này, đảm bảo:
1. ✅ Đã có `projects/{ten-du-an}/profile.md`
2. ✅ Đã đọc `knowledge/14-brand-distribution.md`
3. ✅ Đã claim/tạo: GBP, Facebook Page, Zalo OA

---

## EXECUTION LOGIC — Quy trình xử lý request

### Trigger

User nói bất kỳ dạng nào:
- "Lên plan tuần cho {brand}"
- "Lên lịch đăng bài tuần này về {chủ đề 1}, {chủ đề 2}, {chủ đề 3}"
- "Content calendar tuần tới cho {brand}"
- "Plan 1 tuần GBP + Facebook + Zalo về {topics}"

### Input Processing

```
STEP 1: PARSE REQUEST
├── Xác định project → load profile.md
├── Xác định thời gian: tuần nào? tháng nào?
│   ├── "plan tuần 1 tháng 6" → tuan-1-thang-6
│   ├── "plan tuần này" → tuan-{X}-thang-{M} (tính từ ngày hiện tại)
│   └── Mặc định = tuần tiếp theo
├── Trích xuất chủ đề từ request:
│   ├── Nếu user đưa 1 chủ đề → expand thành 3-5 góc nhìn khác nhau
│   ├── Nếu user đưa 3-5 chủ đề → dùng trực tiếp
│   └── Nếu user không đưa chủ đề → gợi ý 5 chủ đề từ profile.md (ngành + pain points)
└── Xác định output format: .md (mặc định) hoặc .csv (nếu user nói "excel"/"csv")

STEP 1.5: CHỐNG TRÙNG LẶP
├── Đọc tất cả plan cũ trong: projects/{ten-du-an}/brand-distribution/
├── Trích xuất danh sách chủ đề + góc nhìn đã dùng từ các plan trước
├── So sánh chủ đề mới với chủ đề cũ:
│   ├── Trùng 100% (cùng topic + cùng angle) → REJECT, đề xuất angle mới
│   ├── Trùng topic nhưng khác angle → OK (VD: "DN200 - cách chọn" vs "DN200 - bảng giá")
│   └── Topic mới hoàn toàn → OK
├── Nếu phát hiện trùng → thông báo user:
│   "Chủ đề '{X}' đã dùng ở plan tuan-2-thang-5 với angle '{Y}'.
│    Gợi ý angle mới: {Z1}, {Z2}, {Z3}"
└── Log chủ đề vào file index để plan sau check được

STEP 2: PHÂN BỔ CHỦ ĐỀ → KÊNH + NGÀY
├── Map mỗi chủ đề vào 1 pillar (EDUCATE/INSPIRE/ENGAGE/PROMOTE/CONNECT)
├── Phân bổ vào ngày theo logic:
│   ├── T2: EDUCATE (mở đầu tuần bằng giá trị)
│   ├── T3: INSPIRE (case study, proof)
│   ├── T4: PROMOTE (sản phẩm, offer)
│   ├── T5: EDUCATE (kiến thức tiếp)
│   ├── T6: ENGAGE (tương tác, hỏi đáp)
│   ├── T7: INSPIRE/CONNECT (recap, behind-the-scenes)
│   └── CN: CONNECT (nhẹ nhàng, trend)
├── Assign format native cho từng kênh:
│   ├── GBP: Update/Photo/Offer (ngắn, CTA, ảnh thực)
│   ├── Facebook: Carousel/Reel/Image/Link/Poll (visual-led, engage)
│   └── Zalo: Article/Broadcast (chi tiết, utility)
├── Đảm bảo: mỗi kênh có đủ frequency tối thiểu
└── Đảm bảo: plan này BỔ TRỢ cho brand building tổng thể
    ├── Mỗi tuần phải có ít nhất 1 post INSPIRE (social proof, authority)
    ├── Mỗi tuần phải nhắc brand name ít nhất 5 lần across channels
    ├── Mỗi tuần phải có ít nhất 1 CTA drive về website (SEO synergy)
    └── Content phải reinforce topical authority của brand (không lạc topic)

STEP 3: VIẾT FULL CONTENT
├── Mỗi slot viết sẵn content hoàn chỉnh:
│   ├── GBP: Hook + Body + CTA + gợi ý ảnh + UTM link
│   ├── Facebook: Caption đầy đủ + mô tả visual + hashtags
│   └── Zalo: Title + full article body + CTA
├── Áp dụng:
│   ├── Tone of voice từ profile.md
│   ├── User Psychology từ skill Content Writing
│   ├── Native-first (KHÔNG copy giữa kênh)
│   ├── GEO-ready (answer-first, cite-able)
│   ├── Brand reinforcement: nhắc brand name tự nhiên trong content
│   ├── Anti-AI Rules: knowledge/15-anti-ai-content-rules.md (Ruleset 1-4)
│   └── Style Profile: Load JSON từ style-mimicker/profiles/ cho giọng văn brand
├── Self-Correction Check: Mỗi content qua Anti-AI scan trước khi giao
│   ├── Scan từ cấm Ruleset 1 (VN + EN)
│   ├── Scan mẫu câu Ruleset 2
│   ├── Red Flag check: Mục tiêu 0-2 flags (🟢)
│   └── Kiểm tra giọng văn đúng style profile
└── Mỗi content có ghi rõ: ngày đăng, giờ đăng, kênh, format, pillar

STEP 4: XUẤT FILE
├── Naming convention:
│   ├── plan-tuan-{X}-thang-{M}-{YYYY}.md
│   ├── Ví dụ: plan-tuan-1-thang-6-2026.md
│   ├── CSV: plan-tuan-1-thang-6-2026.csv
│   └── X = số thứ tự tuần trong tháng (1-5)
├── Format .md (mặc định):
│   ├── Frontmatter: project, week, month, year, topics, created
│   ├── Bảng tổng hợp calendar ở đầu
│   └── Full content từng slot bên dưới
├── Format .csv (khi user yêu cầu excel):
│   ├── Columns: Date,Day,Time,Channel,Format,Pillar,Topic,Content,CTA,Visual,Hashtags,UTM
│   └── Mỗi row = 1 post
└── Save to: projects/{ten-du-an}/brand-distribution/plan-tuan-{X}-thang-{M}-{YYYY}.md

STEP 5: CẬP NHẬT INDEX
├── Append vào: projects/{ten-du-an}/brand-distribution/index.md
│   ├── Tên plan + ngày tạo + danh sách chủ đề + trạng thái
│   └── Dùng để STEP 1.5 check trùng lặp ở plan sau
└── Index format:
    | Plan | Tuần | Chủ đề | Trạng thái |
    |------|------|--------|------------|
    | plan-tuan-1-thang-6-2026 | 02-08/06 | topic1, topic2, topic3 | ✅ Done |
```

---

## Phase 1: Setup & Audit (Tuần 0 — chạy 1 lần)

### 1.1 Đọc Project Profile

```
Đọc: projects/{ten-du-an}/profile.md
Trích xuất:
- Brand name (NAP chuẩn)
- Address + Phone (format thống nhất)
- Industry / ngành
- Tone of voice
- Target audience + pain points
- Products/services
- Competitors
- Existing social URLs
```

### 1.2 Audit cả 3 kênh

Chạy audit từ mỗi skill:
- GBP: Audit 20 điểm → `skills/brand-distribution/Google Business Profile/SKILL.md`
- Facebook: Audit 15 điểm → `skills/brand-distribution/Facebook Content/SKILL.md`
- Zalo OA: Audit 15 điểm → `skills/brand-distribution/Zalo OA/SKILL.md`

```
Tổng hợp:
| Kênh | Score | Priority Gaps |
|------|-------|---------------|
| GBP | __/20 | |
| Facebook | __/15 | |
| Zalo OA | __/15 | |
| Total | __/50 | |
```

### 1.3 NAP Consistency Check

Chạy từ `skills/brand-distribution/Local SEO/SKILL.md` — Bước 3.

### 1.4 Define Content Pillars

```
| Pillar | % | GBP format | FB format | Zalo format |
|--------|---|------------|-----------|-------------|
| EDUCATE | 35% | Update + Photo | Carousel/Reel | Article |
| INSPIRE | 20% | Photo + Update | Image + Video | Article |
| ENGAGE | 15% | Q&A | Poll/Question | Khảo sát |
| PROMOTE | 20% | Offer + Product | Link Post/Carousel | Broadcast |
| CONNECT | 10% | Event | Video/Reel | Video |
```

---

## Phase 2: Weekly Calendar Generation

### 2.1 Input: User đưa chủ đề

**Ví dụ request**: "Lên plan tuần cho Thép Bảo Tín về: ống thép đúc DN200, so sánh thép đúc vs thép hàn, bảng giá tháng 5, công trình cầu Thủ Thiêm"

**AI parse**:
```
Project: thep-bao-tin
Tuần: 2026-W21 (19/05 - 25/05)
Chủ đề:
  1. Ống thép đúc DN200 → EDUCATE
  2. So sánh thép đúc vs thép hàn → EDUCATE
  3. Bảng giá tháng 5 → PROMOTE
  4. Công trình cầu Thủ Thiêm → INSPIRE
```

### 2.2 Phân bổ Logic

```
PHÂN BỔ ALGORITHM:

Input: N chủ đề (3-5)
Output: 7 ngày × 3 kênh = tối đa 21 slots

Quy tắc:
1. Mỗi chủ đề xuất hiện trên ÍT NHẤT 2 kênh (khác format)
2. GBP: 4-5 posts/tuần (T2, T3, T4, T5, T7)
3. Facebook: 5-7 posts/tuần (mỗi ngày hoặc gần mỗi ngày)
4. Zalo: 2-3 articles/tuần (T2, T4 hoặc T5, T7)
5. Không đăng cùng chủ đề trên cùng kênh 2 ngày liên tiếp
6. PROMOTE max 20% tổng slots
7. Mỗi ngày có 1 pillar chủ đạo (coherent message)
```

### 2.3 Output Format — Markdown (.md)

```markdown
---
project: "{ten-du-an}"
type: "weekly-calendar"
week: "{YYYY-WW}"
date_range: "{DD/MM} - {DD/MM/YYYY}"
topics: ["{topic1}", "{topic2}", "{topic3}", "{topic4}"]
created: "{YYYY-MM-DD}"
---

# Content Calendar — {Brand} — Tuần {DD/MM - DD/MM}

## Tổng quan tuần

| Chủ đề | Pillar | GBP | Facebook | Zalo |
|--------|--------|-----|----------|------|
| {Topic 1} | EDUCATE | T2 | T2 | T2 |
| {Topic 2} | EDUCATE | T5 | T3 | T5 |
| {Topic 3} | PROMOTE | T4 | T4 | — |
| {Topic 4} | INSPIRE | T7 | T5, T7 | T7 |

## Unified Calendar

| Thứ | Ngày | GBP | Facebook | Zalo |
|-----|------|-----|----------|------|
| T2 | DD/MM | ✅ Update | ✅ Carousel | ✅ Article |
| T3 | DD/MM | ✅ Photo | ✅ Reel | — |
| T4 | DD/MM | ✅ Offer | ✅ Link Post | — |
| T5 | DD/MM | ✅ Update | ✅ Image | ✅ Article |
| T6 | DD/MM | — | ✅ Poll | — |
| T7 | DD/MM | ✅ Photo | ✅ Video | ✅ Article |
| CN | DD/MM | — | ✅ Reel | — |

---

## Chi tiết Content — Thứ 2 (DD/MM)

### GBP — Update — EDUCATE
**Chủ đề**: {Topic 1}
**Giờ đăng**: 09:00
**Content**:
> {Full post content — 2-4 dòng}

**CTA**: {CTA text}
**Ảnh**: {Mô tả ảnh cần chụp/dùng}
**Link**: {URL + UTM}

---

### Facebook — Carousel — EDUCATE
**Chủ đề**: {Topic 1}
**Giờ đăng**: 11:30
**Caption**:
> {Full caption — hook + body + CTA + hashtags}

**Visual**:
- Slide 1: {mô tả}
- Slide 2: {mô tả}
- Slide 3: {mô tả}
- Slide 4: {mô tả}
- Slide 5: {mô tả}
- Slide 6: CTA + branding

**Hashtags**: #{} #{} #{} #{} #{}

---

### Zalo OA — Article — EDUCATE
**Chủ đề**: {Topic 1}
**Giờ đăng**: 08:30
**Title**: {Tiêu đề article < 50 ký tự}
**Cover image**: {Mô tả ảnh cover 900x500}
**Content**:
> {Full article 400-600 từ}

**CTA**: {CTA cuối bài}
**Link**: {URL + UTM nếu có}

---

## Chi tiết Content — Thứ 3 (DD/MM)
{... tương tự cho mỗi ngày ...}

---

## Metrics to Track tuần này
| Metric | GBP | Facebook | Zalo |
|--------|-----|----------|------|
| Target views/reach | | | |
| Target engagement | | | |
| Target clicks | | | |
```

### 2.4 Output Format — CSV (.csv)

Khi user yêu cầu "xuất excel" hoặc "csv":

```csv
Date,Day,Time,Channel,Format,Pillar,Topic,Content,CTA,Visual_Description,Hashtags,UTM_Link
2026-05-19,T2,09:00,GBP,Update,EDUCATE,"{topic}","{full content}","{CTA}","{mô tả ảnh}","","?utm_source=gbp&utm_medium=post&utm_campaign={slug}"
2026-05-19,T2,11:30,Facebook,Carousel,EDUCATE,"{topic}","{full caption}","{CTA}","{slide descriptions}","#tag1 #tag2 #tag3","?utm_source=facebook&utm_medium=organic&utm_campaign={slug}"
2026-05-19,T2,08:30,Zalo,Article,EDUCATE,"{topic}","{full article}","{CTA}","{cover description}","","?utm_source=zalo&utm_medium=article&utm_campaign={slug}"
```

**CSV columns**:
| Column | Mô tả |
|--------|--------|
| Date | YYYY-MM-DD |
| Day | T2-CN |
| Time | HH:MM (giờ đăng khuyến nghị) |
| Channel | GBP / Facebook / Zalo |
| Format | Update / Carousel / Reel / Article / Poll / Offer / Photo / Video / Link Post / Broadcast |
| Pillar | EDUCATE / INSPIRE / ENGAGE / PROMOTE / CONNECT |
| Topic | Chủ đề chính |
| Content | Full content viết sẵn (caption/post/article) |
| CTA | Call-to-action |
| Visual_Description | Mô tả ảnh/video cần chuẩn bị |
| Hashtags | Hashtags (Facebook only) |
| UTM_Link | Link tracking |

---

## Phase 3: Content Writing Rules

### 3.1 Viết content cho từng kênh

Khi viết full content cho mỗi slot, ÁP DỤNG:

**GBP Posts** (từ skill GBP):
```
Quy tắc:
- Max 300 từ (recommended 80-150 từ)
- Dòng 1: Hook < 80 ký tự (câu hỏi hoặc số liệu)
- Dòng 2-3: Giá trị chính
- Dòng cuối: CTA rõ ràng
- Ảnh: mô tả cụ thể (AI không tạo ảnh, chỉ gợi ý)
- UTM bắt buộc trên mọi link
- Tone: professional, concise, action-oriented
```

**Facebook Posts** (từ skill Facebook):
```
Quy tắc:
- Hook 3 giây đầu (thumb-stopping)
- Caption: 50-200 từ (tùy format)
- Carousel: mô tả từng slide (text + visual concept)
- Reel: script ngắn (hook → content → CTA, < 60s)
- Hashtags: 3-5 (1 branded + 2-3 industry + 1 content)
- Tone: conversational, visual-led, engagement-driven
- KHÔNG copy từ GBP hay Zalo
```

**Zalo Articles** (từ skill Zalo OA):
```
Quy tắc:
- Title < 50 ký tự, có keyword
- Body: 400-800 từ
- Đoạn ngắn 2-3 dòng
- Có bullet points / numbered list
- Có ảnh minh họa gợi ý
- CTA cuối bài (nhắn tin / gọi / xem thêm)
- Tone: gần gũi, utility-first, personal
- KHÔNG copy từ GBP hay Facebook
```

### 3.2 Native-first Transformation

Cùng 1 chủ đề, 3 cách viết khác nhau:

```
Chủ đề: "Cách chọn ống thép đúc DN200"

GBP (người đang TÌM):
"Chọn ống thép đúc DN200 — 3 tiêu chí quan trọng nhất.
✅ Độ dày thành ống ≥ 6mm cho công trình dân dụng
✅ Tiêu chuẩn ASTM A106 hoặc API 5L
✅ Chứng nhận CO/CQ đầy đủ
Gọi 0901 234 567 — tư vấn miễn phí trong 5 phút."

Facebook (người đang LƯỚT):
"Mua ống thép đúc mà không biết 3 điều này = mất tiền oan 💸

Tuần trước có anh nhà thầu gọi mình: 'Mua ống DN200 mà về công trình bị reject, phải đổi lại.'

Lý do? Không check 3 thứ cơ bản:

1️⃣ Độ dày thành ống (≥ 6mm cho dân dụng, ≥ 8mm cho công nghiệp)
2️⃣ Tiêu chuẩn (ASTM A106 vs API 5L — khác nhau hoàn toàn)
3️⃣ Giấy tờ CO/CQ (không có = không nghiệm thu được)

Save lại để lần sau khỏi mua nhầm 👇

#ỐngThépĐúc #ThépBảoTín #VậtLiệuXâyDựng"

Zalo (người đang CHAT/ĐỌC):
Title: "3 tiêu chí chọn ống thép đúc DN200 — tránh mua nhầm"

Ống thép đúc DN200 là size phổ biến nhất cho công trình dân dụng và công nghiệp nhẹ. Nhưng không phải ống DN200 nào cũng giống nhau.

Bài này hướng dẫn 3 tiêu chí bắt buộc phải check trước khi đặt hàng.

**1. Độ dày thành ống**
- Dân dụng: ≥ 6mm (schedule 40)
- Công nghiệp: ≥ 8mm (schedule 80)
- Áp lực cao: ≥ 10mm (schedule 160)

**2. Tiêu chuẩn sản xuất**
| Tiêu chuẩn | Ứng dụng | Áp lực |
|------------|----------|--------|
| ASTM A106 | Dẫn hơi, nhiệt | Cao |
| API 5L | Dẫn dầu khí | Rất cao |
| TCVN 6114 | Kết cấu | Trung bình |

**3. Giấy tờ đi kèm**
- CO (Certificate of Origin)
- CQ (Certificate of Quality)
- Mill Test Certificate

Thiếu 1 trong 3 giấy này = không nghiệm thu được.

👉 Nhắn "Báo giá DN200" để nhận bảng giá + tư vấn size phù hợp.
```

---

## Phase 4: Monthly Sprint Plan

```
TUẦN 1: FOUNDATION
├── Audit & fix gaps từ tháng trước
├── Plan content calendar tháng mới (4 tuần)
├── Chuẩn bị assets (ảnh, video, data)
├── GBP: Upload 5 ảnh mới
├── FB: Schedule tuần 1-2
└── Zalo: Viết 2-3 articles ahead

TUẦN 2: EXECUTE — EDUCATE focus
├── GBP: 4-5 posts
├── FB: 5-7 posts
├── Zalo: 2-3 articles
├── Reply all reviews/comments/messages
└── Monitor metrics mid-week

TUẦN 3: EXECUTE — PROMOTE focus
├── GBP: 4-5 posts (có Offer)
├── FB: 5-7 posts (có Link post drive traffic)
├── Zalo: 2-3 articles + 1 Broadcast
├── Boost top FB post (nếu engagement > 3x avg)
└── Request reviews từ khách hàng tuần này

TUẦN 4: REVIEW & OPTIMIZE
├── GBP: 4-5 posts + review metrics
├── FB: 5-7 posts + analyze top/bottom performers
├── Zalo: 2-3 articles
├── Monthly report: Brand Visibility Score
├── Identify: best content type, best time, best pillar
└── Adjust plan cho tháng sau
```

---

## Phase 5: Cross-channel Measurement

### Brand Visibility Score (Unified)

```
Brand Visibility Score = Weighted composite:

┌─────────────────────────────────────────────┐
│ GBP Performance (30%)                        │
│ = (Views + Actions) / Target × 100          │
├─────────────────────────────────────────────┤
│ Facebook Performance (30%)                   │
│ = (Reach + Engagement) / Target × 100       │
├─────────────────────────────────────────────┤
│ Zalo Performance (20%)                       │
│ = (Followers + Article Views) / Target × 100│
├─────────────────────────────────────────────┤
│ Brand Search (20%)                           │
│ = Brand keyword impressions / Target × 100  │
└─────────────────────────────────────────────┘

Score: > 100 = exceeding | 80-100 = on track | 60-80 = attention | < 60 = urgent
```

### Weekly Dashboard

```
| Metric | GBP | Facebook | Zalo | Total |
|--------|-----|----------|------|-------|
| Reach/Views | | | | |
| Engagement/Actions | | | | |
| Link clicks | | | | |
| New followers/reviews | | | | |
| Response time | | | | |
```

### Monthly Report Template

```markdown
# Brand Distribution Report — {Brand} — Tháng {MM/YYYY}

## Brand Visibility Score: __/100

## Channel Performance
| Channel | Score | Trend | Top Content |
|---------|-------|-------|-------------|
| GBP | __/100 | ↑↓→ | {best post} |
| Facebook | __/100 | ↑↓→ | {best post} |
| Zalo OA | __/100 | ↑↓→ | {best article} |

## Key Metrics
| Metric | Last Month | This Month | Change |
|--------|-----------|------------|--------|
| Total reach | | | % |
| Total engagement | | | % |
| Brand search volume | | | % |
| Website traffic from social | | | % |
| Leads/conversions | | | % |

## Next Month Priorities
1. {Priority 1}
2. {Priority 2}
3. {Priority 3}
```

---

## Phase 6: Ví dụ Full Execution

### Request: "Lên plan tuần cho Thép Bảo Tín về: ống thép đúc DN200, so sánh đúc vs hàn, bảng giá tháng 5, công trình cầu Thủ Thiêm"

### AI Output:

**File**: `projects/thep-bao-tin/calendar-week-2026-W21.md`

```
Parsed:
- Project: thep-bao-tin
- Week: 19/05 - 25/05/2026
- Topics:
  1. Ống thép đúc DN200 → EDUCATE
  2. So sánh đúc vs hàn → EDUCATE  
  3. Bảng giá tháng 5 → PROMOTE
  4. Công trình cầu Thủ Thiêm → INSPIRE

Phân bổ:
| Thứ | Pillar | GBP | Facebook | Zalo |
|-----|--------|-----|----------|------|
| T2 | EDUCATE | DN200 tips | DN200 carousel | DN200 article |
| T3 | INSPIRE | Ảnh công trình | Reel công trình | — |
| T4 | PROMOTE | Bảng giá offer | Link post bảng giá | — |
| T5 | EDUCATE | Đúc vs hàn tip | Đúc vs hàn image | Đúc vs hàn article |
| T6 | ENGAGE | — | Poll: "Dự án bạn dùng thép gì?" | — |
| T7 | INSPIRE | Ảnh team giao hàng | Video testimonial | Case study Thủ Thiêm |

Total: GBP 5 posts, Facebook 6 posts, Zalo 3 articles = 14 touchpoints
```

---

## Quy tắc vàng

1. **User đưa chủ đề → AI phân bổ + viết sẵn** (không yêu cầu user viết)
2. **KHÔNG copy content giữa các kênh** — cùng chủ đề, khác format + angle + tone
3. **Stagger timing** — GBP 9h, FB 11h30/19h, Zalo 8h30
4. **Full content mỗi slot** — user chỉ cần copy-paste + chuẩn bị visual
5. **Output .md mặc định, .csv khi user yêu cầu excel**
6. **Profile.md là source of truth** — mọi content khớp brand voice
7. **Mỗi plan = 1 file riêng** — `plan-tuan-{X}-thang-{M}-{YYYY}.md`
8. **KHÔNG trùng plan cũ** — check index.md trước khi generate, đề xuất angle mới nếu trùng
9. **Lưu trong `brand-distribution/`** — tách biệt khỏi SEO content, không lẫn dự án khác
10. **Brand reinforcement mỗi tuần**:
    - Ít nhất 1 post INSPIRE (social proof, case study, authority)
    - Brand name xuất hiện tự nhiên ≥ 5 lần across channels
    - Ít nhất 1 CTA drive về website (SEO synergy)
    - Content phải reinforce topical authority (không lạc chủ đề ngành)
    - Mỗi tháng phải có ít nhất 1 post về: thành tựu, đội ngũ, giá trị cốt lõi

---

## Output Files

Khi chạy playbook này, tạo các files trong **thư mục riêng** `brand-distribution/` của mỗi dự án:

```
projects/{ten-du-an}/
├── profile.md                              (project profile — source of truth)
├── brand-distribution/                     (⭐ THƯ MỤC RIÊNG — tách biệt khỏi content SEO)
│   ├── index.md                            (index tất cả plans — dùng để check trùng)
│   ├── master-plan.md                      (master strategy — chạy 1 lần Phase 1)
│   ├── plan-tuan-1-thang-6-2026.md         (weekly plan tuần 1 tháng 6)
│   ├── plan-tuan-1-thang-6-2026.csv        (csv version nếu user yêu cầu)
│   ├── plan-tuan-2-thang-6-2026.md         (weekly plan tuần 2 tháng 6)
│   ├── plan-tuan-3-thang-6-2026.md         (...)
│   └── ...
│
├── topical-map.md                          (SEO content — KHÔNG lẫn với brand-distribution)
├── keyword-research.md
└── ong-thep-duc-la-gi.md
```

### Naming Convention

```
Tên file: plan-tuan-{X}-thang-{M}-{YYYY}.md

Trong đó:
- X = số thứ tự tuần trong tháng (1, 2, 3, 4, 5)
- M = số tháng (1-12)
- YYYY = năm

Ví dụ:
- plan-tuan-1-thang-6-2026.md  (tuần 1 tháng 6 năm 2026)
- plan-tuan-3-thang-12-2026.md (tuần 3 tháng 12 năm 2026)

Quy tắc xác định "tuần mấy":
- Tuần 1: ngày 1-7 của tháng
- Tuần 2: ngày 8-14
- Tuần 3: ngày 15-21
- Tuần 4: ngày 22-28
- Tuần 5: ngày 29-31 (nếu có)
```

### Index File (chống trùng lặp)

File `projects/{ten-du-an}/brand-distribution/index.md`:

```markdown
# Brand Distribution Index — {Brand}

## Plans đã tạo

| Plan | Tuần | Chủ đề | Angles đã dùng | Status |
|------|------|--------|-----------------|--------|
| plan-tuan-3-thang-5-2026 | 19-25/05 | DN200, đúc vs hàn, giá T5, cầu Thủ Thiêm | chọn size, so sánh kỹ thuật, cập nhật giá, case study | ✅ Done |
| plan-tuan-4-thang-5-2026 | 26/05-01/06 | DN300, bảo quản thép, KCN Long Hậu | ứng dụng, hướng dẫn, testimonial | ✅ Done |
| plan-tuan-1-thang-6-2026 | 02-08/06 | ... | ... | 🔄 Current |

## Chủ đề + Angles đã sử dụng (cumulative)

| Chủ đề | Angles đã dùng | Lần cuối |
|--------|----------------|----------|
| Ống thép đúc DN200 | cách chọn, bảng giá, ứng dụng, tiêu chuẩn | Tuần 3 T5 |
| So sánh đúc vs hàn | kỹ thuật, giá, ứng dụng | Tuần 3 T5 |
| ... | ... | ... |
```

### Tại sao tách thư mục `brand-distribution/`

1. **Không lẫn với SEO content**: Bài viết SEO (topical-map, keyword-research, articles) là output khác
2. **Dễ quản lý timeline**: Mỗi plan là 1 file, sort theo thời gian
3. **Chống trùng**: Index file track tất cả chủ đề + angles đã dùng
4. **Scale được**: 52 tuần/năm = 52 files, gọn gàng trong 1 folder
5. **Tách biệt giữa dự án**: Mỗi project có `brand-distribution/` riêng

---

## Liên kết Skills

| Skill | Vai trò trong playbook |
|-------|----------------------|
| Google Business Profile | Content rules + format cho GBP posts |
| Facebook Content | Content rules + format cho FB posts |
| Zalo OA | Content rules + format cho Zalo articles |
| Local SEO & Citations | NAP foundation |
| Content Writing | User Psychology + EEAT + Voice |
| Style Mimicker | Consistent voice across channels |
| Topical Authority | Content pillars alignment |
| Schema Markup | LocalBusiness + sameAs |
| KPI Tracking | Measurement framework |

---

**Đầu ra**: Weekly content calendar hoàn chỉnh với FULL CONTENT viết sẵn cho mỗi slot (GBP + Facebook + Zalo), phân bổ theo chủ đề user đưa, native-first cho từng kênh, xuất .md hoặc .csv — user chỉ cần copy-paste và chuẩn bị visual.
