# Programmatic SEO — SEO lập trình hàng loạt

## 1. Purpose / Mục đích
Programmatic SEO (pSEO) là **tự động generate hàng nghìn/triệu landing page** từ template + data nguồn, để chiếm long-tail keyword scale. Mô hình thắng quy mô lớn ở Zapier (`/integrations/X-with-Y`), Wise (`/X-to-Y exchange rate`), Tripadvisor (`/{city}/restaurants`), G2 (`/{tool}-vs-{tool}`). Skill này hướng dẫn build đúng cách — vì làm sai sẽ tạo "spam pages" và bị Google de-index hàng loạt.

## 2. Core Concepts / Khái niệm cốt lõi

- **Template + Data**: 1 HTML template + 1 dataset (CSV/DB) → render N URL.
- **Modifier pattern**: keyword có 2 biến số → tạo combo (`{X} to {Y}`, `{tool} vs {tool}`, `{city} {service}`).
- **Search demand**: phải verify mỗi modifier combo có demand → đừng tạo trang cho keyword zero-volume.
- **Unique value per page**: mỗi trang phải có data/content khác biệt + giá trị thực — nếu chỉ là template fill SV, sẽ spam.
- **Quality threshold của Google**: bị siết mạnh từ 2024 (Helpful Content + March 2024 Spam Update). Trang programmatic nghèo content bị de-index hàng triệu URL.
- **Crawl budget management**: pSEO thường tạo nhiều URL → cần quản lý sitemap, internal link, robots.

## 3. When to use
- Khi có dữ liệu nguồn (database/API) phong phú và hữu ích.
- Khi keyword pattern rõ với volume lớn.
- Khi business model phù hợp (marketplace, integration, comparison, directory, location service).
- Khi có engineering capacity build CMS động.

KHÔNG dùng khi:
- Không có data nguồn unique.
- Topic cần expert-written content (YMYL).
- Không có way to differentiate vs đối thủ.

## 3.5. Load Project Context (BẮT BUỘC nếu pSEO cho dự án cụ thể)

pSEO scale hàng trăm/nghìn URL → quyết định template + data source là Key Decision lớn. Đọc theo thứ tự ưu tiên — đồng bộ Content Writing Phase -1 (v1.6):

| Thứ tự | File | Mục đích | Bắt buộc? |
|--------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` ⭐ | Quick Facts + Key Decisions → biết pSEO portfolio đã có, tránh pattern duplicate | ✅ ĐỌC TRƯỚC TIÊN |
| 2 | `projects/{project}/profile.md` | Business model → pSEO phải có conversion path tới product/service | ✅ Nếu memory.md không đủ |
| 3 | `projects/{project}/topical.md` | Cluster hiện có → pSEO thường là supporting layer cho cluster hoặc hub riêng | ✅ Nếu tồn tại |
| 4 | `projects/{project}/keywords-urls.md` | Hub/pillar URL → mỗi pSEO page link lên hub (1 URL 1 lần) | ✅ Nếu tồn tại |

> ⚠️ Nếu `memory.md` chưa tồn tại → copy `projects/memory-template.md`, fill Quick Facts từ profile.md, áp dụng Session End Protocol cuối phiên (xem section 8.5 bên dưới).
>
> Chi tiết: `skills/content/Content Writing/SKILL.md` Phase -1 + `skills/project-memory/SKILL.md`.

## 4. Workflow build pSEO

### Bước 1. Discovery — modifier pattern

Pattern phổ biến:
- `{A} to {B}` (currency, unit converter)
- `{tool} vs {tool}` (comparison)
- `{tool} alternative` (lateral)
- `{tool} pricing` / `{tool} review`
- `{city} {service}` (local)
- `{job title} salary in {city}`
- `best {category} in {city}`
- `{X} integration with {Y}`
- `how to {verb} in {tool}`
- `{recipe} for {diet}`
- `{topic} statistics {year}`

### Bước 2. Validate demand
Cho mỗi pattern:
- Sample 10–50 combo random + check Ahrefs/Semrush SV.
- Filter SV ≥ X (thường 50/mo cho long-tail).
- Loại combo zero-volume.
- Kiểm tra SERP intent (top 10 có programmatic page khác đang rank không? → có precedent).

### Bước 3. Audit data nguồn
- Có API/DB chất lượng?
- Update tần suất nào?
- License OK?
- Có thể enrichment (thêm data unique mình)?

### Bước 3.5. Semantic Keyword Map cho pSEO
- **Áp dụng nguyên tắc từ `Content Writing SKILL.md` Bước 0.5** — nhưng scale cho pSEO:
  - Template-level LSI terms: entity/thuật ngữ chung cho toàn bộ pattern (nhúng vào template)
  - Per-page dynamic keywords: biến số {A}, {B} tạo ra primary + long-tail tự động
  - Shared FAQ: câu hỏi chung cho category → inject vào mọi page cùng nhóm
  - **Top 100 pages** (traffic cao nhất): viết thêm content unique với secondary keywords + LSI riêng

> pSEO keyword strategy khác blog: keyword tự động từ data, nhưng LSI terms và FAQ cần planning thủ công.

### Bước 4. Template design
Mỗi template phải có:
- H1 dynamic (`{A} to {B} converter`).
- Above-the-fold value: tool, calculator, table, instant answer.
- Data unique cho trang đó (tỉ giá, bảng giá, list, chart).
- 300–800 từ content unique (auto-generated từ data, hoặc human-written cho top combo).
- Schema phù hợp (Product, Service, FAQPage, Place, Recipe…).
- Internal link tới combo liên quan ("see also: {A} to {C}").
- CTA tới product / signup.

→ Mỗi URL phải pass test "nếu keyword không có search demand, trang này còn hữu ích cho user không?". Nếu không → bỏ.

### Bước 5. URL structure
- `/x/{slug-a}-to-{slug-b}/` hoặc `/converters/{a}-{b}/`
- Lower-case, hyphen, predictable.
- Self-canonical.

### Bước 6. Build infrastructure
- CMS / framework: Next.js ISR, Astro content collections, Webflow CMS (cho ≤ 10k page), Hugo SSG.
- Static generation > on-demand cho SEO speed.
- ISR (Incremental Static Regeneration) cho data update thường xuyên.
- CDN cache aggressive.
- Monitor build time (vài chục nghìn page có thể tốn giờ).

### Bước 7. Sitemap + indexing strategy
- 1 sitemap riêng `/sitemap-programmatic.xml`.
- Chia thành nhiều sitemap ≤ 50k URL.
- Submit GSC.
- Đừng request indexing thủ công hàng nghìn URL — chờ tự nhiên.
- Theo dõi GSC: # discovered → indexed ratio. Nếu < 30% → quality không đủ.

### Bước 8. Quality control
Trước khi publish hàng loạt:
- Manual review 50–100 trang random.
- Check unique content ratio (so sánh trang đối với trang).
- Check thin content < 300 từ → bổ sung hoặc bỏ combo.
- Check duplicate khi dữ liệu thiếu (vd combo không có data → fallback chung) → KHÔNG render hoặc render với noindex.
- Beta launch: publish 10% trước, monitor 30 ngày, sau đó scale full.

### Bước 9. Internal link engineering
- Each page link tới 5–10 combo liên quan (cùng category, cùng letter, popular).
- Hub page list theo category.
- Avoid orphan: mỗi page có ≥ 3 inlink.
- **Mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất trên 1 trang** — tránh link cùng URL nhiều lần trong các section khác nhau.

### Bước 10. Monitoring + pruning
Mỗi quý:
- Page nào 0 traffic + 0 impression sau 6 tháng → noindex hoặc remove.
- Page nào high traffic → enrich content tay (top 100 page lấy ~50% traffic — invest vào đó).
- GSC: index status theo sitemap, indexed/discovered ratio.

## 5. Template Spec pSEO

```
Pattern: {A} to {B}
Estimated volume: ...
Total combo: ...
Data source: ...
Unique value per page: ...
Template fields: H1, intro, table, FAQ, CTA
URL pattern: /converters/{a}-{b}
Schema: Service, FAQPage
Internal link: 5 combo liên quan + hub
Sitemap: /sitemap-converters.xml
Quality gate: ≥ 300 unique words, ≥ 1 unique data point, schema valid
Beta: 10% combo (top SV) → 30 ngày → review → scale
Pruning rule: 0 impression sau 6 tháng → noindex
KPI: 90 ngày indexed ≥ 30%, traffic ≥ X
```

## 6. KPI đo lường
- Total combo sản xuất.
- Indexed / Discovered ratio (mục tiêu ≥ 50%).
- Total long-tail keyword ranking top 10/100.
- Avg traffic / pSEO page.
- Top 10% page contribution to total pSEO traffic (Pareto).
- Conversion rate per pSEO page.
- # page bị Google de-index sau update.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Next.js (ISR/SSG) | Free | Render scale |
| Astro / Hugo | Free | SSG fastest |
| Webflow CMS | Paid | No-code pSEO ≤ 10k page |
| Airtable + Whalesync | Paid | Data nguồn |
| Postgres / MySQL | Free | DB nguồn |
| Cloudflare Pages / Vercel | Freemium | Hosting + edge |
| Sitemap generator script | Free | Auto sitemap |
| Ahrefs / Semrush bulk SV | Paid | Validate combo demand |
| ScraperAPI / Apify | Paid | Data acquisition (legal!) |
| Looker Studio | Free | Per-page tracking |

## 8. Common mistakes
- Tạo trang cho mọi combo bất kể demand → spam.
- Template fill mà không có data unique → thin content.
- Bỏ qua schema → mất rich result.
- Không internal link → orphan toàn bộ pSEO portfolio.
- Sitemap không tách → khó debug.
- Không pruning → tích luỹ low-quality URL kéo cả site.
- Build hàng triệu trang ngày 1 → Google flag spam pattern.
- Không monitor sau publish.
- Helpful Content Update 2023 + March 2024 Spam Update đã đánh sập nhiều site pSEO bừa bãi — không học bài học = lặp lại.
- Dùng AI generate full content cho từng combo mà không edit → phát hiện AI footprint, de-index.
- Ignore mobile UX (template không responsive).
- Slow build (Next.js ISR sai cấu hình → revalidate quá thường) → tốn cost, slow user.

> ⚠️ **Anti-AI Detection**: pSEO đặc biệt dễ bị phát hiện AI vì scale lớn. Mỗi template PHẢI có unique data layer + human-edited intro/outro. Tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), tránh mẫu câu AI (2A-2F), Humanization. MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: section 2.4 trong `skills/content/Content Writing/SKILL.md`.

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

## 8.5. Session End Protocol — Update Memory (BẮT BUỘC cuối phiên)

pSEO portfolio = nhiều URL cùng pattern → phải persist template + data source + pruning rule để maintain. Update `projects/{project}/memory.md` (checklist 7 điểm — đồng bộ Content Writing Phase 7):

```
[ ] Append Session History (date, CLI/model, "build pSEO pattern {A}-to-{B}, beta {N} pages", files touched)
[ ] Append Recent Articles — KHÔNG liệt kê từng URL pSEO (quá nhiều); ghi hồ sơ portfolio ("+50 pages /converters/" 1 dòng)
[ ] Edit Active Context — "pSEO portfolio: {pattern} (beta) → monitoring 30 ngày"
[ ] Edit Pending Tasks — review beta 30 ngày, scale nếu đạt quality gate, prune URL 0 traffic 6 tháng
[ ] Append Key Decisions — template spec, data source, quality gate (≥ 300 unique words), pruning rule, sitemap split
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md cùng commit với template + spec pSEO
```

Chi tiết: `skills/project-memory/SKILL.md` + `skills/content/Content Writing/SKILL.md` Phase 7.

---
**Đầu ra**: pSEO portfolio có quality gate, sitemap riêng, monitoring + pruning runbook — scale traffic mà không bị penalty.
