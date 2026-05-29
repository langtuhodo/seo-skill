# Evergreen Content — Nội dung trường tồn

## 1. Purpose / Mục đích
Evergreen content là bài **giữ giá trị qua thời gian**, traffic không phụ thuộc trend. Đối ngược với news/trend content (peak rồi tắt). Evergreen là nền tảng compound traffic — mỗi bài evergreen tốt sẽ cộng dồn organic traffic năm này qua năm khác. Skill này định nghĩa cách chọn topic, viết, và **maintain** evergreen.

## 2. Core Concepts / Khái niệm cốt lõi

- **Evergreen vs trend**: trend = peak nhanh, chết nhanh; evergreen = ổn định + compound.
- **Topic stability**: topic không bị thay đổi nền tảng trong ≥ 3 năm (vd: "cách viết title tag" stable; "Twitter algorithm 2024" trend).
- **Search demand stability**: kiểm tra Google Trends 5 năm — đường ngang hoặc tăng dần.
- **Foundational** vs **applied**: foundational (định nghĩa, nguyên tắc) bền hơn applied (best practice).
- **Refresh required**: evergreen ≠ "viết 1 lần xong" — cần refresh mỗi 6–12 tháng để cập nhật ví dụ, screenshot, số liệu.
- **Compound vs decay**: bài evergreen được refresh đều = compound traffic; không refresh = decay.

## 3. When to use
- Mọi cluster Strategy / Foundational topic.
- Khi muốn build long-term moat thay vì traffic spike.
- Khi capacity production hạn chế — focus vào content có lifetime value cao.
- Khi build pillar / definitive guide.

Không dùng cho:
- News (TechCrunch, VnExpress).
- Pop culture / event coverage.
- Software changelog / release notes.

## 3.5. Load Project Context (BẮT BUỘC nếu viết cho dự án cụ thể)

Evergreen = bài nguồn traffic dài hạn → quyết định chủ đề phải lựa kỹ. Memory.md giúp biết bài evergreen nào đã có, tránh trùng. Đọc theo thứ tự ưu tiên — đồng bộ Content Writing Phase -1 (v1.6):

| Thứ tự | File | Mục đích | Bắt buộc? |
|--------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` ⭐ | Quick Facts + Recent Articles → biết bài evergreen đã publish + Key Decisions về evergreen cadence | ✅ ĐỌC TRƯỚC TIÊN |
| 2 | `projects/{project}/profile.md` | Business core offering → evergreen phải map tới pain lâu dài của ICP | ✅ Nếu memory.md không đủ |
| 3 | `projects/{project}/topical.md` | Cluster → evergreen thường là pillar hoặc core supporting | ✅ Nếu tồn tại |
| 4 | `projects/{project}/keywords-urls.md` | URL evergreen đã publish — internal link trọng tâm | ✅ Nếu tồn tại |

> ⚠️ Nếu `memory.md` chưa tồn tại → copy `projects/memory-template.md`, fill Quick Facts từ profile.md, áp dụng Session End Protocol cuối phiên (xem section 8.5 bên dưới).
>
> Chi tiết: `skills/content/Content Writing/SKILL.md` Phase -1 + `skills/project-memory/SKILL.md`.

## 4. Workflow xác định + xây evergreen

### Bước 1. Filter topic evergreen
Tiêu chí check:
- Google Trends 5 năm: line ổn định hoặc tăng?
- Topic có "X là gì", "cách làm X", "X cho người mới" — fundamentals.
- Tìm thử SERP: top 10 có bài cũ ≥ 2 năm vẫn rank? → evergreen-friendly.
- Tránh year trong topic ("SEO 2025" trừ khi cố ý làm refresh hằng năm).

### Bước 2. Chọn angle + format
Format thường evergreen:
- "What is X" definition.
- "How to do X" tutorial.
- "Beginner's guide to X" / "X for dummies".
- "X explained" / "X glossary".
- "X templates / examples".
- "Common mistakes in X".
- "Best practices for X" (có refresh).
- Decision framework / mental model.

### Bước 2.5. Semantic Keyword Research cho Evergreen
- **Áp dụng Bước 0.5 từ `Content Writing SKILL.md`** — Semantic Keyword Research BẮT BUỘC cho evergreen:
  - Primary keyword: foundational term (không chứa năm)
  - Secondary keywords: 3-5 biến thể tìm kiếm phổ biến
  - Long-tail keywords: "cách làm X", "X cho người mới", "X là gì"
  - LSI/Semantic terms: entity/thuật ngữ nền tảng (ổn định qua thời gian)
  - PAA questions: câu hỏi evergreen (tránh câu hỏi seasonal)
- **Keyword placement**: primary trong H1 + first 100 words, secondary trong H2, long-tail trong H3/FAQ, LSI rải trong body

> Evergreen keyword khác blog keyword: chọn terms ổn định search demand 5 năm, tránh keyword có trend spike → fade.

### Bước 3. Viết content evergreen-style
- **Tránh ngày/năm cụ thể** trong text body trừ khi cố ý.
- **Dùng "currently"** thay vì "as of 2024".
- **Reference data update-able**: số liệu phải có nguồn để refresh.
- **Screenshot UI có version**: tránh chụp khi UI sắp đổi (vd Google search interface refresh).
- **Frame foundational**: "Đây là 5 nguyên tắc" thay vì "Đây là 5 trick mới nhất 2024".
- **Examples timeless**: dùng case study brand sống lâu (Apple, Coca-Cola) hơn brand mới (có thể chết).
- **Voice authoritative + neutral**: tránh slang trend.

### Bước 4. URL slug evergreen
- KHÔNG ghi năm trong URL (`/blog/seo-2024/` → `/blog/seo/`).
- Slug ngắn, foundational keyword.
- Có thể đổi title hằng năm "SEO Guide 2025" mà không đổi URL.

### Bước 5. Schedule refresh
Đặt cadence:
- 6 tháng: review tất cả evergreen, refresh top 20% theo traffic.
- 12 tháng: refresh toàn bộ evergreen.
- Trigger refresh sớm: traffic giảm > 20%, GSC position tụt > 5, đối thủ có content tốt hơn, Google update.

(Xem chi tiết skill Content Refresh.)

### Bước 6. Internal link & SEO metadata
- Khi refresh evergreen, kiểm tra internal links: **mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất**.
- Đảm bảo frontmatter đầy đủ theo `projects/content-template.md`: bao gồm `meta_title` (50-60 ký tự) + `meta_description` (150-160 ký tự).
- Cập nhật anchor text cho tự nhiên, tránh over-optimization.

### Bước 7. Distribution recurring
Evergreen distribute liên tục:
- Newsletter "best of" gửi lại mỗi 6 tháng.
- Social repost với hook khác.
- Internal link từ bài mới.
- Repurpose video / podcast / infographic.

### Bước 8. Audit evergreen portfolio
Mỗi quý:
- Phần trăm traffic site đến từ evergreen?
- Top 20% bài evergreen contribute bao nhiêu %?
- Bài nào decay cần refresh?
- Cluster nào thiếu evergreen pillar?

Mục tiêu: ≥ 60% organic traffic từ evergreen → site bền vững.

## 5. Template Evergreen Audit Sheet

| URL | Topic | Publish date | Last refresh | Traffic 12 months | Trend (up/flat/down) | Position avg | Refresh need (Y/N) | Reason | Owner | Deadline |

## 6. KPI đo lường
- % traffic từ evergreen.
- Compound growth rate (YoY traffic của bài evergreen ≥ 1 năm tuổi).
- # evergreen post in top 10 cho keyword chính.
- Avg traffic per evergreen post.
- Refresh velocity (# bài refresh / quý).
- Lifetime value per evergreen (traffic × conversion × time).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Trends / Glimpse | Free | Validate topic stability |
| Ahrefs Content Explorer | Paid | Filter "still ranking after N years" |
| Surfer / Frase | Paid | Brief evergreen + NLP |
| GSC + GA4 | Free | Track decay |
| Looker Studio | Free | Dashboard evergreen vs trend |
| Notion / Airtable | Freemium | Refresh schedule tracker |
| ChatGPT/Claude | Freemium | Detect time-sensitive language để rewrite |

### Prompt LLM detect "time-sensitive language"
```
Đọc bài sau. Liệt kê tất cả câu / cụm từ có yếu tố thời gian sẽ outdate (năm, brand mới, version cụ thể, "hiện nay", trend, news). Trả về danh sách + suggestion phrasing trung tính.
[paste content]
```

## 7.5. Rare Attribute & Phantom Keywords (SEO Trends 2026)

> Evergreen content đặc biệt hưởng lợi từ Rare Attribute + Phantom Keywords. Xem: `knowledge/16-seo-trends-2026.md`

- **Rare Attribute**: Evergreen content phải có thông tin hiếm ổn định theo thời gian (kinh nghiệm 5+ năm, dữ liệu longitudinal, insight từ nhiều dự án). Đây là yếu tố Google chấm điểm Knowledge Graph cao nhất
- **Phantom Keywords**: Evergreen content rank lâu → tích lũy nhiều phantom keywords trong Search Console. Chạy quy trình Phantom Keywords mỗi tháng (Bước 7.5 Content Refresh) để liên tục mở rộng keyword coverage
- **Topical Context**: Evergreen thường là pillar → phải context-link mạnh với category hierarchy
- **Content AI không replicate**: Evergreen tốt nhất là nội dung chỉ có thể đến từ kinh nghiệm thực (first-hand), không phải tổng hợp từ sources khác

## 8. Common mistakes
- Viết "SEO trend 2024" rồi 2025 không update → traffic biến mất.
- Bỏ năm vào URL slug → mỗi năm phải tạo URL mới + 301 = nợ kỹ thuật.
- Không có schedule refresh → bài chết dần.
- Refresh giả (chỉ đổi date, không update content) → Google nhận ra + suy giảm trust.
- Ép tất cả content thành evergreen → site khô khan, mất voice.
- Không phân loại evergreen vs trend trong CMS → khó audit.
- Bỏ qua trend cluster (vd "AI SEO 2024") quan trọng cho relevance.
- Foundational quá nhiều, không có applied → bài hữu ích nhưng không actionable.
- Không track evergreen contribution → không biết đâu là core asset.
- Refresh không để lại version history → khó rollback nếu traffic drop.
- Viết AI generic → evergreen mất giọng văn riêng, giảm EEAT signal.

> ⚠️ **Anti-AI Detection**: Evergreen content tồn tại lâu dài → càng cần giọng văn người thật. Tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), Structural Replacement (2A-2F), Humanization (3.1-3.6), Self-Correction + Red Flag Check. MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: `skills/content/Content Writing/SKILL.md` (section 2.4).

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

## 8.5. Session End Protocol — Update Memory (BẮT BUỘC cuối phiên)

Evergreen là tài sản dài hạn → mỗi quyết định (chủ đề, format, refresh cadence) phải persist. Update `projects/{project}/memory.md` (checklist 7 điểm — đồng bộ Content Writing Phase 7):

```
[ ] Append Session History (date, CLI/model, "viết/refresh evergreen {title}", files touched)
[ ] Append Recent Articles — evergreen URL + đánh dấu type="evergreen" trong note
[ ] Edit Active Context — cập nhật evergreen portfolio status (nếu cần)
[ ] Edit Pending Tasks — set next refresh date (6 tháng/12 tháng cadence), thêm internal link tasks
[ ] Append Key Decisions — cadence refresh đã chốt, foundational keyword scope, format (guide/checklist/template)
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md cùng commit với bài evergreen
```

Chi tiết: `skills/project-memory/SKILL.md` + `skills/content/Content Writing/SKILL.md` Phase 7.

---
**Đầu ra**: portfolio evergreen được track riêng, refresh theo cadence, contribute ≥ 60% organic traffic site.
