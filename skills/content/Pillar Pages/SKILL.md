# Pillar Pages — Trang trụ cột

## 1. Purpose / Mục đích
Pillar page là trang **"hub" cho 1 cluster topic**, cover topic ở mức tổng quát + link xuống các supporting article chuyên sâu. Đây là vũ khí chính để build topical authority, chiếm head keyword khó, và tạo flow PageRank nội bộ. Một pillar page tốt thường rank top cho 50–500 keyword cùng lúc.

## 2. Core Concepts / Khái niệm cốt lõi

- **Pillar = comprehensive guide cho 1 topic rộng**, ví dụ "SEO" hay "Inbound Marketing".
- **Supporting = bài chuyên sâu cho 1 sub-topic**, ví dụ "Keyword Research", "Title Tag Optimization".
- **Hub-and-spoke**: pillar (hub) link xuống supporting (spoke); supporting link về pillar.
- **Pillar dài hơn supporting**: thường 3000–8000 từ, là "definitive guide".
- **Evergreen**: pillar nhắm topic ổn định lâu dài, không seasonal.
- **3 dạng pillar**:
  - **10x guide / Mega-guide**: 1 trang dài cover hết, có TOC, scroll dài.
  - **Resource hub**: 1 trang ngắn liệt kê + link xuống supporting.
  - **Course-style**: chia thành chapter, mỗi chapter là URL riêng nhưng có navigation cross-linking.
- **Pillar phải intent-flexible**: cover được informational + commercial sub-intent.

## 3. When to use
- Khi muốn dominate 1 topic rộng.
- Khi đã có đủ 5–15 supporting article trong cluster (hoặc plan publish trong 3 tháng).
- Khi build thương hiệu chuyên môn quanh 1 ngách.
- Khi launch resource hub / academy.

## 3.5. Load Project Context (nếu viết cho dự án cụ thể)

Pillar page là bài trung tâm của cluster → **BẮT BUỘC đọc topical map trước khi viết**:
1. `projects/{project}/topical.md` → xác định cluster, tất cả supporting liên quan, category hierarchy cho Topical Context Linking
2. `projects/{project}/keywords-urls.md` → biết supporting nào đã publish → chèn link xuống mỗi supporting 1 lần
3. `projects/{project}/profile.md` → brand voice, business context

## 4. Workflow xây pillar page

### Bước 1. Chọn topic pillar
Tiêu chí:
- Head keyword có SV cao (≥ 1000/mo cho VN, ≥ 5000 cho EN).
- Intent rộng (cover được nhiều sub-intent).
- Liên quan trực tiếp business → có pathway tới conversion.
- Có ≥ 10 sub-topic con để build supporting (xem Topic Clusters).
- Có cơ hội rank thực tế (DR site đủ + khả năng kiếm backlink).

### Bước 2. Research toàn topic + Semantic Keywords
- Keyword Research mở rộng (skill Keyword Research).
- Cluster keyword (skill Keyword Clustering).
- **Semantic Keyword Research** (xem `Content Writing SKILL.md` Bước 0.5):
  - Primary keyword (head keyword cho pillar)
  - Secondary keywords (3-7 sub-topics chính → mỗi cái là 1 H2)
  - Long-tail keywords (10-20 câu hỏi/biến thể → dùng cho H3, FAQ, sub-sections)
  - LSI/Semantic terms (20-30 entity Google expects khi nói về topic này → rải trong body)
  - PAA questions (8-12 câu → FAQ section + sub-sections)
- Soi 5 pillar đối thủ — copy cấu trúc tốt, bổ sung gap.
- AnswerThePublic / AlsoAsked → mining toàn bộ câu hỏi xoay quanh topic.

> **Pillar cần cover keyword rộng hơn supporting**: secondary keywords của pillar = primary keyword của từng supporting. LSI terms của pillar nhiều hơn 2-3x so với supporting.

### Bước 3. Outline pillar
Đảm bảo cover:
- Definition: topic là gì?
- Why it matters
- Core concepts (3–7)
- How to do it (overview, link xuống supporting cho chi tiết)
- Strategies / frameworks
- Tools
- Examples / case studies
- Common mistakes
- FAQ
- Glossary (nếu lớn)

Mỗi sub-topic = 1 H2, link xuống supporting article qua "Read more" / "Deep dive".

### Bước 4. Decide pillar format

**A. Mega-guide (1 URL dài)**:
- Pro: PageRank tập trung, rank head keyword tốt.
- Con: nặng, khó update, UX kém nếu không có TOC.
- Khi nào: topic không quá rộng (≤ 8000 từ), audience chấp nhận long-form.

**B. Resource hub (1 URL ngắn liệt kê)**:
- Pro: gọn, dễ scan, dễ update.
- Con: thin nếu chỉ là list link → cần intro + curated section.
- Khi nào: cluster đã có ≥ 20 supporting article.

**C. Course-style (multi-URL với nav)**:
- Pro: SEO mạnh — mỗi chapter rank riêng, mỗi link backward truyền authority.
- Con: phức tạp implement.
- Khi nào: topic rất rộng (vd "SEO complete course").

→ Nên kết hợp B + C cho ngách lớn.

### Bước 5. Viết pillar (mega-guide pattern)

Cấu trúc:
- Hero: H1 + 1-paragraph promise + CTA mềm.
- TL;DR / Key takeaway box (snippetable).
- Sticky TOC (table of contents) sidebar.
- Progress bar reading.
- Mỗi H2 = 1 chương:
  - Mở đầu 100–200 từ.
  - 1–2 visual.
  - Link "Đọc chi tiết" tới supporting article.
- "Next chapter" nav cuối mỗi H2.
- Conclusion + recap + CTA mạnh (download checklist, free tool, demo).

Chiều dài: 3000–8000 từ cho mega-guide.

### Bước 6. SEO + EEAT layer
- Title: "[Topic]: Hướng dẫn đầy đủ ([year])" hoặc "The Ultimate Guide to [Topic]".
- Meta: nhấn comprehensive + năm.
- URL slug: `/guide/{topic}/` hoặc `/{topic}/`.
- Schema: Article + Person + Organization + (FAQPage cho FAQ section) + BreadcrumbList.
- Author byline có ảnh, bio, sameAs.
- "Last updated" date thực.
- Mỗi visual có alt + image schema.

### Bước 7. Internal linking
- Pillar → mỗi supporting (anchor descriptive, mỗi URL 1 lần duy nhất).
- Supporting → pillar (anchor = pillar keyword + biến thể, **chỉ 1 link duy nhất về pillar trong mỗi bài supporting**).
- Pillar → pillar khác cùng cấp (lateral linking khi liên quan, mỗi URL 1 lần).
- Trang home / category cluster → pillar.
- Footer "Resources" → pillar.
- **⚠️ Mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất trong 1 bài viết** — lặp cùng URL ≥ 2 lần → spam risk.

### Bước 8. Distribution & maintenance
- Distribute mạnh khi launch (xem Blog Content distribution).
- Promote pillar trong mọi bài blog cùng cluster (**1 link duy nhất về pillar** — đặt ở vị trí tự nhiên nhất, không lặp cùng URL).
- Outreach link building dùng pillar làm "linkable asset" — cao cấp hơn outreach blog post (xem Off-page Link Building).
- Maintenance: review mỗi quý, refresh số liệu, thêm chapter mới.

## 5. Template Pillar Brief

```
Topic pillar: ...
Target head keyword: ...
SV / KD / Intent: ...
URL: /guide/{slug}/
Format: Mega-guide / Resource hub / Course
Word count target: ...
Pillar Outline:
  Chapter 1: ... (link → supporting URL)
  Chapter 2: ...
  ...
Required visuals: ... (infographic, decision tree, comparison table)
CTA: ...
EEAT: author X, reviewer Y, date Z
Internal link plan:
  - From: ... → Pillar (anchor: ...)
  - Pillar → ... (sub-supporting)
Backlink targets: 5 outreach angle
KPI 90 ngày: position, traffic, RD, conversion
```

## 6. KPI đo lường
- Position cho head keyword (mục tiêu top 5 trong 6–12 tháng).
- Total keyword rank top 100 cho pillar URL (mục tiêu ≥ 200).
- Total organic traffic / pillar.
- # backlink + RD tới pillar (target ≥ 30 RD/year cho head topic).
- Time on page, scroll depth.
- Conversion (download, signup) inline pillar.
- # supporting article link tới pillar / total trong cluster.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Ahrefs / Semrush | Paid | Keyword + competitor pillar |
| Surfer / Frase | Paid | NLP cho long-form |
| Clearscope | Paid | Premium content grading |
| Notion / Coda | Free | Brief, version control |
| Webflow / Framer / Custom CMS | Paid | Pillar UX (sticky TOC, progress bar) |
| Schema App / RankMath | Paid | Schema cho long-form |
| Loom + Vidyard | Freemium | Video embed cho pillar |
| Canva / Figma | Freemium | Visual nguyên bản |
| Hotjar / Microsoft Clarity | Freemium | Scroll depth, heatmap |

## 7.5. Rare Attribute & Topical Context (SEO Trends 2026)

> Pillar pages đặc biệt quan trọng cho Topical Authority. Xem chi tiết: `knowledge/16-seo-trends-2026.md`

- **Rare Attribute**: Pillar cần nhiều rare attributes hơn supporting (3-5 thông tin hiếm). Đây là bài "trung tâm" — phải có dữ liệu gốc, insight độc đáo mà AI không replicate được
- **Topical Context Linking**: Pillar phải nhắc đến TẤT CẢ sub-topics bằng context (ngữ cảnh tự nhiên), không chỉ bằng internal link. Internal link chỉ mạnh 1/10 cho Topical Authority
- **User-first**: Pillar phải giải quyết vấn đề user, không phải viết vì "Google wants to see it" (SEO Trends 2026)
- **Content AI không thể replicate**: Video, phỏng vấn chuyên gia, original research, first-hand experience

## 8. Common mistakes
- Pillar quá ngắn (1500 từ) → Google coi là blog thường, không có authority.
- Pillar quá dài nhưng loãng → bounce cao.
- Không có TOC + nav → UX kém.
- Pillar nhưng không có supporting article cùng cluster → "đảo cô đơn" không có flow link.
- Pillar tag intent transactional pure → nên cover comprehensive informational trước.
- Không refresh → 1 năm sau outdated.
- URL pillar deep (`/blog/category/sub/pillar/`) → giảm authority signal. Nên `/guide/{topic}/`.
- Không CTA hoặc CTA chỉ ở footer → mất conversion.
- Bỏ qua schema FAQ trong pillar → mất rich result.
- Không build backlink chuyên cho pillar — pillar phải là asset chính của link building campaign.
- Viết AI generic, thiếu kinh nghiệm cá nhân → pillar mất EEAT + bị detector đánh dấu.
- Thiếu Key Takeaways box + answer-first sections → mất AI citation opportunity.

> ⚠️ **Anti-AI Detection**: Pillar là bài quan trọng nhất — PHẢI có kinh nghiệm cá nhân, case study thực, quan điểm rõ ràng. Tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), Structural Replacement (2A-2F), Humanization (3.1-3.6), Self-Correction + Red Flag Check. MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: `skills/content/Content Writing/SKILL.md` (section 2.4).

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

---
**Đầu ra**: pillar page với head keyword target, cluster ≥ 10 supporting, schema + EEAT + distribution + maintenance roadmap.
