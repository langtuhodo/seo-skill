# Tools Content — Nội dung dạng công cụ

## 1. Purpose / Mục đích
Tools content là **trang tương tác (calculator, generator, checker, converter)** thay cho article tĩnh. Đặc tính: traffic ổn định + bền theo năm, backlink magnet, conversion cao (vì user đang trong moment-of-need), và là asset riêng đối thủ khó copy. Một tool tốt có thể kéo 100k+ traffic/tháng + 500+ RD trong 12 tháng — vượt trội bất kỳ blog nào.

## 2. Core Concepts / Khái niệm cốt lõi

- **Search demand**: keyword "{topic} calculator", "{topic} generator", "{tool name} checker", "{x} converter", "{topic} tool" thường có SV cao + KD vừa.
- **Backlink magnet**: tool dễ được cite trong bài listicle, statistics roundup, education resource → kiếm backlink passively.
- **Top of funnel ⇒ conversion**: tool free thu hút TOFU, sau đó retarget / capture email / upsell paid feature.
- **Programmatic + tool**: kết hợp tool + URL programmatic ("{X} to {Y}" converter cho 50 cặp đơn vị) → scale traffic.
- **Schema SoftwareApplication**: schema chuyên cho tool/app.
- **Tool ≠ blog**: UX > content. Phải instant, no-signup-required, mobile-friendly.

## 3. When to use
- Khi muốn build asset SEO bền vững dài hạn.
- Khi đối thủ chỉ có blog → diff bằng tool.
- Khi product có technical strength để build.
- Khi muốn kiếm backlink quy mô passively.
- Khi muốn chiếm "{tool} keyword" volume cao.

## 4. Workflow build tools content

### Bước 1. Discovery — keyword tool
Dùng modifier search:
- "{niche} calculator"
- "{niche} generator"
- "{niche} checker"
- "{niche} converter"
- "{niche} estimator"
- "{niche} simulator"
- "{niche} analyzer"
- "{niche} validator"
- "{niche} tester"
- "free {niche} tool"

Filter SV ≥ 500/mo (VN) hoặc ≥ 2000/mo (EN), KD ≤ 40, intent informational/transactional.

### Bước 2. Validate
- Top 10 SERP có tool tương tự không? Quality? UX?
- DR đối thủ rank? Mình có cơ hội?
- Có pathway từ tool → product / signup không?
- Cần engineering effort bao nhiêu? Có dữ liệu cần thiết không?

### Bước 3. Spec tool
Brief gồm:
- Tên tool
- 1 sentence promise (vd: "Tính LCP miễn phí cho mọi URL trong 5 giây")
- Input fields (giữ ≤ 3 input cho TOFU tool)
- Output (rõ ràng, có visualization, có CTA tới deep dive)
- Use case persona
- Edge cases
- API/data source
- Wireframe UX

### Bước 4. Build
- Tech stack: Next.js / Astro / vanilla HTML+JS đều OK (SEO-friendly, fast).
- KHÔNG behind login.
- Mobile-first.
- LCP < 1.5s, INP < 200ms, CLS < 0.05.
- Result hiện cùng URL hoặc URL có param shareable (`?input=...`).
- Embeddable widget (cho user khác paste vào blog họ — link IN tự nhiên).

### Bước 4.5. Semantic Keyword Research cho Tool Page
- **Áp dụng Bước 0.5 từ `Content Writing SKILL.md`**:
  - Primary keyword: "{niche} calculator/generator/checker"
  - Secondary keywords: biến thể tên tool + "free {tool}", "online {tool}"
  - Long-tail keywords: "cách dùng {tool}", "công thức {tool}", "{tool} cho {use case}"
  - LSI/Semantic terms: thuật ngữ liên quan đến lĩnh vực tool giải quyết
  - PAA questions: câu hỏi user hay hỏi về tool/công thức
- **Keyword placement**: primary trong H1 + meta title, secondary trong content section H2, long-tail trong FAQ

### Bước 5. SEO layer

URL: `/tools/{tool-slug}/` hoặc `/{tool-slug}/`.

Trang tool có cấu trúc:
- H1 + 1-paragraph promise (above tool).
- Tool UI (immediate, no scroll).
- Result hiển thị inline.
- Below tool — content section dài 800–1500 từ:
  - "X là gì?"
  - "Cách dùng tool"
  - "Cách tính / Công thức"
  - "Ví dụ"
  - "FAQ"
  - "Use case khác"
  - Internal link tới blog/pillar liên quan.

→ Content section quan trọng cho ranking signal — Google không rank trang chỉ có form.

**⚠️ Internal link rule**: mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất trên trang tool. Không link cùng pillar/blog URL nhiều lần.

**Frontmatter** theo `projects/content-template.md` — bao gồm `meta_title` (50-60 ký tự) + `meta_description` (150-160 ký tự).

Schema:
- SoftwareApplication
- WebPage
- HowTo (cách dùng)
- FAQPage
- BreadcrumbList

Title: "{Tool name} — {Promise} | Brand"
Meta: nhấn free + speed + USP.

### Bước 6. Distribution + link building

**Launch**:
- Product Hunt
- Reddit subreddit phù hợp (r/SEO, r/Entrepreneur, r/marketing) — đăng "I built X tool, here's why" với value-first.
- HackerNews Show HN.
- Indie Hackers.
- Twitter/LinkedIn thread "I built X — case study".
- Newsletter (TLDR, Product Hunt Daily, ngách).

**Long-term backlink**:
- Listicle outreach: pitch tool vào "Top X tools for Y" articles.
- Resource page outreach: tìm "free SEO tools" page → request inclusion.
- Statistic roundup: nếu tool có data, publish report dùng làm clickbait.
- Embed code: cho phép user embed widget với attribution → link tự nhiên.

### Bước 7. Conversion path
- Tool free → result page có CTA tới:
  - Pro version (paid).
  - Course / pillar guide deep dive.
  - Email course / newsletter.
  - Product trial.
- Track conversion từng tool trong GA4.
- A/B test CTA (skill A/B Testing).

### Bước 8. Programmatic expansion
Nếu tool áp dụng cho nhiều variants (vd "Length Converter": cm to inch, m to yard, …):
- Generate URL programmatic `/tools/length-converter/cm-to-inch/`.
- Mỗi page có content section unique (use case, ví dụ).
- 1 tool gốc → 50–500 URL ranking.

## 5. Template Tool Spec

```
Tool name: ...
Promise: ...
Target keyword: ...
SV / KD: ...
Funnel role: TOFU/MOFU/BOFU
Inputs: ...
Outputs + visualization: ...
Edge cases: ...
Data source/API: ...
URL: /tools/{slug}/
Schema: SoftwareApplication + HowTo + FAQ
Content section topics: ...
Internal link IN/OUT: ...
Launch channels: ...
Conversion path: ...
KPI 90 ngày: visits, embed count, RD, conversion
```

## 6. KPI đo lường
- Tool usage / day.
- Conversion rate inline CTA.
- Embed count (count outbound link backlink theo embed).
- # RD pointing to tool URL.
- Avg position cho keyword "{tool} {modifier}".
- Tool retention (repeat usage cùng user — qua cookie, account).
- Time to first ROI (giả thiết engineering cost).

## 7. Tools để build/sử dụng

| Tool | Giá | Use case |
|---|---|---|
| Next.js / Astro / Remix | Free | Framework |
| Vercel / Netlify / Cloudflare Pages | Freemium | Hosting + edge function |
| Tailwind CSS | Free | UI nhanh |
| Recharts / Chart.js / D3 | Free | Visualize result |
| Plausible / GA4 | Freemium | Analytics |
| PostHog / Mixpanel | Freemium | Funnel + retention |
| Stripe (for paid tier) | Paid | Conversion path |
| Embeddable.com / iframe + script | Free | Embed widget |
| Schema App | Paid | Schema |
| Ahrefs / Semrush | Paid | Find keyword tool có SV |

## 8. Common mistakes
- Build tool đẹp nhưng không có content section → không rank.
- Tool behind signup → user bounce + Google không đánh giá được UX.
- Tool slow / glitchy → bounce.
- Không embeddable → bỏ phí kênh backlink mạnh nhất.
- Title generic ("Free Tool") → mất CTR.
- Không có schema SoftwareApplication.
- Tool quá phức tạp ≥ 5 input → friction cao.
- Không có conversion path tới paid product.
- Quên programmatic expansion với tool có variants.
- Spam launch trên Reddit / community thay vì value-first.
- Không track usage → không cải thiện được.
- Đối thủ copy nhanh — không có moat data → cần kèm dữ liệu độc quyền hoặc UX vượt trội.
- Content section viết AI generic → tool rank nhưng không convert vì thiếu trust.

> ⚠️ **Anti-AI Detection**: Content layer đi kèm tool PHẢI có giọng văn người thật, ví dụ cụ thể. Tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), Structural Replacement (2A-2F), Humanization (3.1-3.6), Self-Correction + Red Flag Check. MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: section 2.4 trong `skills/content/Content Writing/SKILL.md`.

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

---
**Đầu ra**: tools content như asset SEO bền vững, có schema + content layer + distribution + conversion path.
