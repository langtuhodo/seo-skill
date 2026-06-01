# SEO Skills Library — AI Assistant Instructions

> Bộ skill SEO toàn diện cho AI coding assistant. Auto-load khi làm việc trong project này.

## Cấu trúc thư mục

```
seo-skills/
├── skills/                 # 62 skills theo 12 categories
│   ├── strategy/
│   ├── on-page/
│   ├── technical/
│   ├── content/
│   ├── off-page/
│   ├── international/
│   ├── analytics/
│   ├── ux/
│   ├── ai-seo/
│   ├── growth/
│   ├── brand-distribution/
│   └── style-mimicker/
│
├── knowledge/              # 17 knowledge notes (auto-load triggers)
├── playbooks/              # 7 end-to-end workflows
├── projects/               # Output theo dự án (mỗi project có memory.md)
│
├── COMPILED-CONTEXT.md     # ⭐ Skill digest gọn — ĐỌC TRƯỚC TIÊN mỗi phiên
├── AGENTS.md               # Config gốc
├── CLAUDE.md               # Claude Code
├── GEMINI.md               # Gemini CLI
└── README.md
```

## ⭐ Quick Start cho AI — Session Bootstrap (BẮT BUỘC)

**Đầu mỗi phiên, AI làm 3 bước theo thứ tự:**

1. **Đọc `COMPILED-CONTEXT.md`** — skill digest gọn (~4k token) thay vì load 62 skill + 18 knowledge notes
2. **NẾU task gắn 1 dự án cụ thể**: Đọc `projects/{ten-du-an}/memory.md` TRƯỚC TIÊN — cache trạng thái dự án (Quick Facts + Active Context + Pending Tasks + Recent Articles + Key Decisions)
3. **CHỈ deep-dive `SKILL.md` / `profile.md` / `topical.md` / `keywords-urls.md` / `external-sources.md` cụ thể** khi 2 file trên không đủ context

→ Mục tiêu: bootstrap context < 8k token thay vì 30-50k token.

**Cuối mỗi phiên (Session End Protocol)**: AI BẮT BUỘC cập nhật `projects/{project}/memory.md` (Session History + Pending Tasks + Recent Articles + Key Decisions) trước khi report completion cho user. Chi tiết: `skills/project-memory/SKILL.md`.

## Cách sử dụng (chi tiết)

Khi nhận task SEO, AI assistant sẽ:
1. Đọc `COMPILED-CONTEXT.md` (luôn luôn, mọi task)
2. Đọc `projects/{project}/memory.md` nếu có project context
3. Xác định task thuộc category nào (xem bảng dưới)
4. Đọc Knowledge Note tương ứng trong `knowledge/`
5. Đọc SKILL.md chi tiết nếu cần workflow cụ thể
6. Đọc Playbook nếu task là workflow end-to-end
7. Cuối phiên: chạy Session End Protocol cập nhật memory.md

## Quick Reference — 17 Knowledge Notes

| # | Category | Trigger Keywords | Knowledge Note |
|---|----------|------------------|----------------|
| 1 | **SEO Foundations** | source context, central entity, topical map, core section, outer section, glossary SEO | `knowledge/01-seo-foundations.md` |
| 2 | **Strategy** | keyword research, search intent, competitor, cluster, SEO wins, content strategy, long-tail | `knowledge/02-strategy.md` |
| 3 | **On-page** | title tag, meta description, H1 H2, URL, internal link, image alt, on-page | `knowledge/03-on-page-seo.md` |
| 4 | **Content** | blog, pillar page, topic cluster, evergreen, programmatic, content refresh, helpful content, SEO copywriting | `knowledge/04-content-seo.md` |
| 5 | **Technical** | crawl, index, robots.txt, sitemap, canonical, schema, Core Web Vitals, site speed | `knowledge/05-technical-seo.md` |
| 6 | **Off-page** | backlink, link building, guest post, digital PR, brand mention, outreach, linkable asset | `knowledge/06-off-page-seo.md` |
| 7 | **International** | hreflang, multilingual, geo target, localization, ccTLD | `knowledge/07-international-seo.md` |
| 8 | **Analytics** | GA4, Search Console, rank tracking, KPI, dashboard, traffic analysis | `knowledge/08-analytics.md` |
| 9 | **UX** | page speed, mobile optimization, A/B test, conversion funnel, accessibility | `knowledge/09-ux.md` |
| 10 | **E-E-A-T & Quality** | EEAT, helpful content, content quality, trust signal, author authority | `knowledge/10-eeat-content-quality.md` |
| 11 | **Entity SEO** | entity SEO, NLP optimization, salience, Knowledge Graph, sameAs, semantic search | `knowledge/11-entity-seo.md` |
| 12 | **AI SEO & GEO** | AI Overview, ChatGPT search, Perplexity, LLM visibility, GPTBot, GEO, SERP features | `knowledge/12-ai-seo.md` |
| 13 | **Growth** | topical authority, content scaling, link acquisition, SEO experiment | `knowledge/13-growth.md` |
| 14 | **Brand Distribution** | Google Business Profile, GBP, Facebook content, Zalo OA, phủ thương hiệu, multi-channel, NAP, local SEO, brand presence | `knowledge/14-brand-distribution.md` |
| 15 | **Anti-AI Content Rules** | viết nội dung, anti-AI, tránh AI, humanize, giọng văn, AI detection, blacklist từ cấm, viết như người thật | `knowledge/15-anti-ai-content-rules.md` |
| 16 | **SEO Trends 2026** | rare attribute, topical authority, phantom keywords, keyword phụ, platform diversification, zero-click, AI Overviews, owned community, user-first content, agentic SEO | `knowledge/16-seo-trends-2026.md` |
| 17 | **Project Memory** | project memory, session memory, context cache, COMPILED-CONTEXT, memory.md, session end protocol, ghi nhớ ngữ cảnh, bộ nhớ dự án, giảm token bootstrap, lưu trạng thái dự án | `knowledge/17-project-memory.md` |

## Slash Commands — Quick Activation

Ngoài keyword trigger, AI nhận diện các slash command sau (cao ưu tiên hơn keyword match, KHÔNG được nhầm sang skill khác):

| Command | Skill kích hoạt | Mục đích |
|---------|-----------------|---------|
| `/audit` | `skills/content/Content Evaluation/SKILL.md` v1.2 | Audit 1 bài viết theo chuẩn E-E-A-T & SEO 2026 + Duplicate Detection (vs `keywords-urls.md` schema v1.1, 7 cột) + Verdict 4 trạng thái (🟢 GIỮ NGUYÊN / 🟡 CẬP NHẬT / 🟠 LÀM MỚI / 🔴 XÓA) trên thang 100đ + **External Citation Check** (vs `external-sources.md` whitelist 3-tier, v1.2) |

**Anti-collision**: `/audit` LUÔN route đến `Content Evaluation` (bài đơn). Audit cluster vẫn dùng `Topical Audit` qua keyword "audit cluster" — không có command riêng.

## 62 Skills — Full Index

### Strategy (5 skills)
- `skills/strategy/Keyword Research/SKILL.md` — discover demand, volume + KD + intent + business value
- `skills/strategy/Search Intent/SKILL.md` — I/N/C/T classification + sub-intent
- `skills/strategy/Competitor Analysis/SKILL.md` — content gap + backlink gap + SERP feature gap
- `skills/strategy/Keyword Clustering/SKILL.md` — gom keyword → 1 cluster = 1 URL
- `skills/strategy/SEO Wins/SKILL.md` — striking distance, quick wins

### On-page (7 skills)
- `skills/on-page/Title/SKILL.md` — 50-60 chars, keyword front, CTR-driven
- `skills/on-page/Descriptions/SKILL.md` — 150-160 chars, value-prop + CTA
- `skills/on-page/Header Structure/SKILL.md` — 1 H1, hierarchy H2-H6
- `skills/on-page/URL Structure/SKILL.md` — short, lowercase, hyphen
- `skills/on-page/Internal Linking/SKILL.md` — equity flow, anchor descriptive
- `skills/on-page/Image Optimization/SKILL.md` — alt text, WebP/AVIF, lazy-load
- `skills/on-page/Content Optimization/SKILL.md` — intent match, EEAT, entity

### Technical (6 skills)
- `skills/technical/Crawlability/SKILL.md` — robots.txt, crawl budget, log analysis
- `skills/technical/Indexing/SKILL.md` — index/noindex, GSC Coverage
- `skills/technical/Site Speed/SKILL.md` — Core Web Vitals (LCP/INP/CLS)
- `skills/technical/Schema Markup/SKILL.md` — JSON-LD Article/FAQ/Product/Organization
- `skills/technical/Canonical Tags/SKILL.md` — consolidate URL variants
- `skills/technical/XML Sitemaps/SKILL.md` — lastmod, multi sitemap

### Content (10 skills)
- `skills/content/Content Writing/SKILL.md` — **User Psychology + EEAT + GEO + giọng văn có hồn** ⭐ BẮT BUỘC TRƯỚC KHI VIẾT
- `skills/content/Blog Content/SKILL.md` — editorial calendar, brief, workflow
- `skills/content/Pillar Pages/SKILL.md` — hub-and-spoke, mega-guide
- `skills/content/Topic Clusters/SKILL.md` — entity coverage, cluster mapping
- `skills/content/Tools Content/SKILL.md` — calculator/generator as link bait
- `skills/content/Evergreen Content/SKILL.md` — compound traffic, refresh cycle
- `skills/content/Programmatic SEO/SKILL.md` — template + data, quality gate
- `skills/content/Content Refresh/SKILL.md` — striking distance, light/medium/heavy
- `skills/content/Topical Audit/SKILL.md` — audit cluster + page scoring 100đ + topical map + coverage gap + recommendations
- `skills/content/Content Evaluation/SKILL.md` — **Audit 1 bài viết (single-article) theo E-E-A-T & SEO 2026** ⭐ command `/audit` v1.2 (+ Duplicate Detection + Verdict 4 trạng thái + External Citation Check)

### Off-page (5 skills)
- `skills/off-page/Link Building/SKILL.md` — 10 link types, anchor distribution
- `skills/off-page/Guest Posting/SKILL.md` — pitch framework, relationship
- `skills/off-page/Digital PR/SKILL.md` — newsworthy hook, media list
- `skills/off-page/Brand Mentions/SKILL.md` — monitor, unlinked → linked
- `skills/off-page/Outreach/SKILL.md` — email sequence, warm-up

### International (4 skills)
- `skills/international/Hreflang/SKILL.md` — reciprocal, x-default
- `skills/international/Multi Language/SKILL.md` — ccTLD vs subdomain vs subfolder
- `skills/international/Geo Targeting/SKILL.md` — geo signal stack
- `skills/international/Localization/SKILL.md` — currency, date, payment, tone

### Analytics (5 skills)
- `skills/analytics/Google Analytics/SKILL.md` — GA4 event-based, custom dimension
- `skills/analytics/Search Console/SKILL.md` — weekly mining, striking distance
- `skills/analytics/Rank Tracking/SKILL.md` — keyword set, SERP feature tracking
- `skills/analytics/Traffic Analysis/SKILL.md` — channel breakdown, attribution
- `skills/analytics/KPI Tracking/SKILL.md` — 4-tier KPI, NSM, dashboard

### UX (5 skills)
- `skills/ux/Page Speed UX/SKILL.md` — perception, skeleton, progressive
- `skills/ux/Mobile Optimization/SKILL.md` — mobile-first, tap target, viewport
- `skills/ux/UX Design/SKILL.md` — F/Z-pattern, scannability, accessibility
- `skills/ux/A_B Testing/SKILL.md` — hypothesis, sample size, SEO-safe
- `skills/ux/Conversion Funnels/SKILL.md` — TOFU/MOFU/BOFU, drop-off

### AI SEO (5 skills)
- `skills/ai-seo/Content Optimization/SKILL.md` — answer-first, chunk-level, entity
- `skills/ai-seo/NLP Optimization/SKILL.md` — entity coverage, salience, sameAs
- `skills/ai-seo/Generative SEO/SKILL.md` — multi-engine audit, bot policy
- `skills/ai-seo/SERP Features/SKILL.md` — FS, PAA, AI Overview, Knowledge Panel
- `skills/ai-seo/LLM Visibility/SKILL.md` — GPTBot policy, Wikipedia, hallucination

### Growth (4 skills)
- `skills/growth/Topical Authority/SKILL.md` — boundary, 4-phase roadmap
- `skills/growth/Content Scaling/SKILL.md` — AI brief, specialist pool, quality gate
- `skills/growth/Link Acquisition/SKILL.md` — asset moat, 5 channel mix
- `skills/growth/SEO Experiments/SKILL.md` — hypothesis, sample 30+ URL, statistical sig

### Style (1 skill)
- `skills/style-mimicker/SKILL.md` — **Sao chép & áp dụng phong cách viết theo dự án** ⭐ TÍCH HỢP VỚI CONTENT WRITING

### Project Memory (1 skill)
- `skills/project-memory/SKILL.md` — **Bộ nhớ ngữ cảnh dự án giữa các phiên AI** ⭐ BẮT BUỘC ĐẦU + CUỐI MỖI PHIÊN

### Brand Distribution (4 skills)
- `skills/brand-distribution/Google Business Profile/SKILL.md` — Local Pack, GBP posts, reviews, NAP, entity signal
- `skills/brand-distribution/Facebook Content/SKILL.md` — content pillars, native-first, brand search signal
- `skills/brand-distribution/Zalo OA/SKILL.md` — articles, broadcast, auto-reply, utility-first
- `skills/brand-distribution/Local SEO/SKILL.md` — citations, NAP audit, location pages, local schema, multi-location

## 7 Playbooks — End-to-End Workflows

| Playbook | Use Case | File |
|----------|----------|------|
| Keyword Research Workflow | Seed → cluster → roadmap | `playbooks/01-keyword-research-workflow.md` |
| Content Brief Workflow | SERP → outline → brief | `playbooks/02-content-brief-workflow.md` |
| Technical SEO Audit | 14-phase audit checklist | `playbooks/03-technical-seo-audit.md` |
| Content Refresh | Identify decay → refresh | `playbooks/04-content-refresh.md` |
| Link Outreach | Prospect → sequence → win | `playbooks/05-link-outreach.md` |
| AI/LLM Visibility Audit | 5-engine audit → action plan | `playbooks/06-ai-llm-visibility-audit.md` |
| Brand Distribution | GBP + FB + Zalo unified calendar + measurement | `playbooks/07-brand-distribution-workflow.md` |

## AI Bot Policy (robots.txt)

```
User-agent: GPTBot
Allow: /
User-agent: ClaudeBot
Allow: /
User-agent: PerplexityBot
Allow: /
User-agent: CCBot
Allow: /
User-agent: Google-Extended
Allow: /
User-agent: applebot-extended
Allow: /
User-agent: ChatGPT-User
Allow: /
User-agent: Claude-Web
Allow: /
```

## Instructions for AI Assistant

1. **Khi nhận task SEO cho 1 dự án cụ thể**: Đọc `projects/{ten-du-an}/profile.md` TRƯỚC TIÊN — hiểu chủ thể, business context, brand voice, SEO context. Mọi output phải phù hợp với profile.
2. **Khi nhận task SEO**: Đọc Knowledge Note category tương ứng trước
3. **Khi cần workflow chi tiết**: Đọc SKILL.md của skill cụ thể
4. **Khi task là end-to-end**: Đọc Playbook phù hợp
5. **Luôn giữ thuật ngữ SEO tiếng Anh** (search intent, canonical, hreflang, schema, EEAT)
6. **Output actionable**: workflow step-by-step, template sẵn dùng, KPI đo lường

### ⭐ QUAN TRỌNG: Khi viết nội dung

**TRƯỚC KHI VIẾT BẤT KỲ BÀI NÀO**, bắt buộc chạy `skills/content/Content Writing/SKILL.md`:

1. **Phase 0: Competitor Research** (BẮT BUỘC):
   - Phân tích top 10 Google cho keyword target
   - Ghi nhận cấu trúc, độ dài, điểm mạnh/yếu
   - Xác định Information Gain (mình có gì họ không có?)
   - Thu thập PAA (People Also Ask)

2. **Trả lời 4 câu hỏi User Psychology**:
   - Họ đang gặp vấn đề gì?
   - Họ đang sợ điều gì?
   - Họ muốn được tư vấn/hỏi đáp gì?
   - Họ cần đọc gì để ra quyết định?

3. **Đảm bảo EEAT**:
   - Experience: có case study/ví dụ thực
   - Expertise: giải thích chính xác, cite nguồn
   - Authoritativeness: author có tên + credentials
   - Trust: có proof, hình ảnh thực

4. **Đảm bảo GEO (AI citation ready)**:
   - Answer-first 50-100 từ đầu
   - Định nghĩa rõ ràng, cite-able
   - List/table dễ trích xuất
   - Original data/insight

5. **Giọng văn có hồn**:
   - KHÔNG dùng: "Trong thời đại số...", "Như chúng ta đã biết...", "Điều quan trọng là..."
   - CÓ: người thật đằng sau, quan điểm cá nhân, chi tiết cụ thể
   - Câu ngắn < 20 từ, đoạn 2-4 dòng

6. **Quy tắc ngôn ngữ**:
   - Viết tiếng Việt tự nhiên
   - Chỉ giữ tiếng Anh cho tiêu chuẩn kỹ thuật (TCVN, ASTM, JIS)
   - KHÔNG dùng: scrap → phế liệu, tips → mẹo, checklist → danh sách kiểm tra

7. **⚠️ OUTPUT**:
   - User Psychology Brief, Competitor Analysis = NỘI BỘ, KHÔNG xuất hiện trong bài
   - Chỉ xuất bài viết hoàn chỉnh cho người đọc

### ⭐ Style Mimicker — Áp dụng phong cách viết theo dự án

**Khi viết cho một dự án cụ thể**, kiểm tra và áp dụng Style Profile tương ứng:

| Project | Style Profile | File |
|---------|---------------|------|
| thep-bao-tin | ThepBaoTin | `skills/style-mimicker/profiles/thep-bao-tin.json` |
| binhnn-digital | BinhnnDigital | `skills/style-mimicker/profiles/binhnn-digital.json` |
| hatcapherangxay | HatCaPheRangXay | `skills/style-mimicker/profiles/hatcapherangxay.json` |

**Workflow tích hợp**:
1. Content Writing skill (Phase 0-4): Research, outline, draft, EEAT/GEO check
2. Style Mimicker skill (Phase 5): Áp dụng voice layer từ profile
3. Output: Bài viết hoàn chỉnh với đúng giọng văn của dự án

**Kích hoạt Style Mimicker khi**:
- User chỉ định: "viết theo phong cách [Name]"
- Project đã có style mapping (auto-apply)
- User yêu cầu: "lưu phong cách viết này với tên [Name]" (Capture mode)

---

## Project Workflow — Auto Output to Project Folder

### Trigger Keywords
Khi user yêu cầu bất kỳ task nào liên quan đến **một website/dự án cụ thể**:
- Viết nội dung / content
- Tạo topical map / topic cluster
- Keyword research
- Content brief
- Audit SEO
- Google Business Profile / GBP optimization
- Facebook content strategy / plan
- Zalo OA strategy
- Phủ thương hiệu / brand distribution
- Bất kỳ deliverable SEO nào

### Workflow tự động

```
1. DETECT PROJECT
   └── Xác định tên dự án từ request (tên công ty, brand, website)
   └── Normalize tên: lowercase, no spaces, no special chars
   └── Check aliases trong profile.md của các project existing (nếu user gọi tắt)
   └── Ví dụ: "Thép Bảo Tín" → "thep-bao-tin", "Binhnn" → match alias → "binhnn-digital"

1.5. FALLBACK DETECTION (v1.3 — ad-hoc content) ⭐ MỚI
   └── Nếu KHÔNG detect được project name TỪ Bước 1 + KHÔNG có style profile name trong request
       → ACTIVATE _demo mode (fallback ad-hoc)
       → Path: projects/_demo/ (đã có sẵn)
       → Load: projects/_demo/style-guide.md (~875 dòng anti-AI rule + bảng AI-isms tiếng Việt + tiếng Anh)
       → SKIP toàn bộ Bước 2 (CREATE PROJECT FOLDER) + Bước 3 (LOAD PROJECT CONTEXT)
       → Output path: projects/_demo/writing/{yyyy-mm-dd}-{slug}.md
       → SKIP internal link + external whitelist check
       → Note cuối bài: "Ad-hoc content — không thuộc project. Style guide: _demo. User review trước khi publish."
       → Session End: KHÔNG update memory.md của bất kỳ project nào
   └── Nếu detect được project name → tiếp tục Bước 2 bình thường

1.7. INTENT ROUTING + OUTPUT PATH RESOLUTION (v1.4 — fix bug output path) ⭐ MỚI
   └── Map cụm từ trong request → skill kích hoạt → subfolder output:

       | Cụm từ user nói | Skill kích hoạt | Subfolder |
       |-----------------|------------------|-----------|
       | "viết bài mới", "viết bài", "tạo bài" về X | Content Writing | writing/ |
       | "viết lại {file}.md", "refresh {file}.md", "cập nhật {file}.md", "tối ưu lại {file}.md" | **Content Refresh** (mặc định khi mơ hồ) | refresh/ |
       | "rewrite từ đầu {file}.md", "viết lại hoàn toàn từ đầu" | Content Writing (verdict 🟠 LÀM MỚI) | writing/ (ghi đè) HOẶC refresh/{slug}-v2.md |
       | "/audit {URL}", "audit {file}.md", "đánh giá bài X" | Content Evaluation | audit/ |
       | "viết brief", "brief cho bài X" | Content Writing (Brief mode) | research/ |
       | "keyword research", "nghiên cứu từ khóa" | Keyword Research | research/ |
       | "audit cluster", "topical audit" | Topical Audit | audit/ |
       | "schema {Type}", "tạo JSON-LD" | Schema Markup | technical/ |

   └── Nếu user đề cập filename `{abc}.md` trong request:
       1. Locate file trong projects/{project}/{writing,refresh,research,audit,archive}/
       2. KHÔNG tìm thấy → hỏi user 1 lần, KHÔNG tự đoán
       3. Tìm thấy ở ROOT (projects/{project}/{abc}.md) → WARN user file legacy sai vị trí, đề xuất MOVE sang writing/ trước khi refresh

   └── Default khi mơ hồ: "viết lại"/"refresh"/"cập nhật" + filename `.md` đã tồn tại → **Content Refresh + refresh/ subfolder**. KHÔNG mặc định Content Writing → tránh ghi đè bài đã publish + tránh save vào root.

   └── Chi tiết: `skills/content/Content Writing/SKILL.md` Phase -0.5 + `skills/content/Content Refresh/SKILL.md` PRE-FLIGHT.

2. CREATE PROJECT FOLDER (skip nếu fallback _demo từ Bước 1.5)
   └── Path: projects/{ten-du-an}/
   └── Tạo folder nếu chưa tồn tại

3. LOAD PROJECT CONTEXT
   └── ⭐ Đọc projects/{ten-du-an}/memory.md TRƯỚC TIÊN → Quick Facts + Active Context + Pending Tasks + Recent Articles + Key Decisions
   └── CHỈ mở các file sau khi memory.md không đủ context:
       └── projects/{ten-du-an}/profile.md → chủ thể, business context, brand voice (chi tiết)
       └── projects/{ten-du-an}/topical.md → topical map, cluster hierarchy, role (pillar/supporting)
       └── projects/{ten-du-an}/keywords-urls.md → keywords đã publish, URL sẵn có cho internal link
       └── projects/{ten-du-an}/external-sources.md → whitelist nguồn ngoài (3-tier) để cite trong bài (v1.2) — nếu file thiếu thì skip External Citation Check
   └── Áp dụng context vào mọi output

4. ACTIVATE RELEVANT SKILLS
   └── Đọc Knowledge Note + SKILL.md tương ứng với task
   └── Áp dụng workflow từ skill

5. GENERATE OUTPUT — Naming convention 2026 (folder-scoped)
   ⭐ Quy tắc: 4 file lõi ở ROOT project, mọi deliverable khác đi vào subfolder tương ứng.

   ROOT (4 file lõi, giữ nguyên):
       - Memory: memory.md
       - Profile: profile.md
       - Topical map: topical.md
       - Keywords & URLs: keywords-urls.md
       - External sources whitelist: external-sources.md (v1.2)

   writing/ — bài viết mới (blog, pillar, supporting, tools, evergreen, pSEO):
       - writing/{slug-tieu-de}.md

   refresh/ — bài optimize/refresh content cũ:
       - refresh/{slug-tieu-de}.md

   research/ — keyword research + content brief:
       - research/keyword-research.md
       - research/keyword-research-{cluster}.md (nếu chia theo cluster)
       - research/brief-{slug-tieu-de}.md

   audit/ — topical audit + content audit:
       - audit/audit-{yyyy-mm-dd}.md
       - audit/audit-{cluster}-{yyyy-mm-dd}.md (nếu audit từng cluster)

   technical/ — technical SEO audit + schema snippets:
       - technical/audit-{yyyy-mm-dd}.md
       - technical/schema-{type}.json (Article/FAQ/Product/Organization/ProfilePage)
       - technical/sitemap-plan.md, technical/robots-policy.md

   brand-distribution/ — GBP + Facebook + Zalo + Local SEO (giữ nguyên):
       - brand-distribution/index.md
       - brand-distribution/master-plan.md
       - brand-distribution/plan-tuan-{X}-thang-{M}-{YYYY}.md

   archive/ — memory rotation + file lưu trữ:
       - archive/memory-{YYYY-MM}.md (memory cũ khi rotate)
       - archive/audit-{yyyy-mm-dd}.md (audit cũ > 12 tháng nếu muốn dọn)

   ❌ KHÔNG lưu bài viết / audit / research thẳng vào projects/{ten-du-an}/ (root). Root chỉ chứa 5 file lõi.

   ❌ Path SAI bị cấm (v1.4 — bug fix output path):
       - `projects/{project}/{slug}.md`         (ROOT — chỉ chứa 5 file lõi) ← bug đã ghi nhận
       - `projects/{project}/{cluster}/{slug}.md` (nested cluster ngoài subfolder cho phép)
       - `projects/{slug}.md`                   (root projects/ không có file viết)
       - `{slug}.md` (root repo)                (không tạo file ở root repo)

   ✅ Path ĐÚNG được cho phép:
       - `projects/{project}/writing/{slug}.md`
       - `projects/{project}/refresh/{slug}.md`
       - `projects/{project}/audit/audit-{yyyy-mm-dd}-{slug}.md`
       - `projects/{project}/research/brief-{slug}.md`
       - `projects/{project}/technical/{...}.{md,json}`
       - `projects/{project}/brand-distribution/{...}.md`
       - `projects/{project}/archive/{...}.md`
       - `projects/_demo/{writing|refresh|audit}/{yyyy-mm-dd}-{slug}.md` (fallback _demo, v1.3)

   **Trước khi tạo file, AI BẮT BUỘC self-check path khớp 1 trong ✅ pattern hợp lệ.** Nếu không → DỪNG, fix path.

6. RETURN RESULT
   └── Thông báo file path đã tạo
   └── Summary nội dung
```

### Project Folder Structure (2026 — folder-scoped)

```
projects/
├── memory-template.md                  ← Template memory.md cho dự án mới
├── keywords-urls-template.md           ← Template keywords-urls.md
├── external-sources-template.md        ← (v1.2) Template external-sources.md (3-tier whitelist)
│
├── _demo/                              ← ⭐ (v1.3) Fallback cho ad-hoc content (không project + không style)
│   ├── README.md                       ← Hướng dẫn cấu trúc + quy tắc đặt tên
│   ├── style-guide.md                  ← ~875 dòng anti-AI rule + bảng AI-isms tiếng Việt + tiếng Anh
│   ├── style-guide-en.md               ← Bản tiếng Anh gốc (reference, không edit)
│   ├── writing/{yyyy-mm-dd}-{slug}.md  ← Output ad-hoc content
│   ├── refresh/{yyyy-mm-dd}-{slug}.md  ← Output ad-hoc refresh
│   └── audit/{yyyy-mm-dd}-{slug}.md    ← Output ad-hoc audit (bài ngoài project)
│
└── {ten-du-an}/                        ← Vd: thep-bao-tin, binhnn-digital
    │
    ├── memory.md                       ← ⭐ Bộ nhớ dự án (đọc TRƯỚC TIÊN, cập nhật cuối phiên)
    ├── profile.md                      ← Chủ thể + brand voice + business context
    ├── topical.md                      ← Sơ đồ topical map (pillar/cluster/sub-cluster)
    ├── keywords-urls.md                ← Keyword + URL đã publish (cho internal link)
    ├── external-sources.md             ← (v1.2) Whitelist nguồn ngoài 3-tier để cite (cơ quan / báo chí / chuyên gia)
    │
    ├── writing/                        ⭐ Bài viết MỚI (blog/pillar/supporting/tools/evergreen/pSEO)
    │   ├── {slug-bai-1}.md
    │   ├── {slug-bai-2}.md
    │   └── ...
    │
    ├── refresh/                        ⭐ Bài REFRESH/optimize content cũ
    │   ├── {slug-bai-refresh}.md
    │   └── ...
    │
    ├── research/                       ⭐ Keyword research + Content brief
    │   ├── keyword-research.md
    │   ├── keyword-research-{cluster}.md
    │   ├── brief-{slug-bai}.md
    │   └── ...
    │
    ├── audit/                          ⭐ Topical + Content audit
    │   ├── audit-{yyyy-mm-dd}.md
    │   ├── audit-{cluster}-{yyyy-mm-dd}.md
    │   └── ...
    │
    ├── technical/                      ⭐ Technical SEO audit + Schema snippets
    │   ├── audit-{yyyy-mm-dd}.md
    │   ├── schema-Article.json
    │   ├── schema-Organization.json
    │   ├── schema-ProfilePage.json
    │   ├── sitemap-plan.md
    │   └── robots-policy.md
    │
    ├── brand-distribution/             (giữ nguyên — GBP + FB + Zalo + Local SEO)
    │   ├── index.md
    │   ├── master-plan.md
    │   └── plan-tuan-{X}-thang-{M}-{YYYY}.md
    │
    └── archive/                        ⭐ Memory rotation + lưu trữ
        ├── memory-{YYYY-MM}.md         ← Memory cũ khi rotate (đọc skills/project-memory/SKILL.md)
        └── ...
```

**5 file lõi ở root** (`memory.md`, `profile.md`, `topical.md`, `keywords-urls.md`, `external-sources.md`) — AI auto-load ở Session Bootstrap. **Mọi output khác PHẢI vào subfolder**. File `external-sources.md` (v1.2) là tùy chọn — không có → AI skip External Citation Check (Phase 3.5 của `/audit`).

### Content Output Format (Markdown)

⚠️ **KHÔNG dùng YAML frontmatter** (`---` mở/đóng) — khi render Markdown sẽ hiển thị chữ rất to, xấu. Dùng **blockquote** (`>`) để SEO metadata hiển thị đẹp.

⚠️ **KHÔNG dùng `---` (horizontal rule)** trong nội dung bài viết — tạo thẻ `<hr>` gây rối layout. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

**SEO Metadata blockquote format**:

```markdown
> **SEO Metadata**
> - **title**: "{Tiêu đề bài viết}"
> - **slug**: "{slug-url}"
> - **meta_title**: "{SEO title 50-60 ký tự, keyword đầu, brand cuối}"
> - **meta_description**: "{Meta description 150-160 ký tự, value-prop + CTA}"
> - **project**: "{Tên dự án}"
> - **cluster**: "{tên cluster / head keyword}"
> - **role**: "pillar | supporting"
> - **target_keyword**: "{keyword chính}"
> - **semantic_keywords**: "{từ khóa ngữ nghĩa liên quan, phân cách bằng dấu phẩy}"
> - **search_intent**: "{I|N|C|T}"
> - **word_count**: {số từ}
> - **created**: "{YYYY-MM-DD}"

# {Tiêu đề H1}

{Nội dung bài viết...}
```

### Ví dụ Request → Output

**Request**: "Viết bài về ống thép đúc cho công ty Thép Bảo Tín"

**AI Actions**:
1. Detect project: "Thép Bảo Tín" → `thep-bao-tin`
2. Create folder: `projects/thep-bao-tin/` + subfolder `writing/` nếu chưa có
3. **Load context**: memory.md → profile.md + topical.md (cluster, role) + keywords-urls.md (URL sẵn có cho internal link)
4. Activate skills: `skills/content/Blog Content`, `skills/on-page/Content Optimization`
5. Generate: `projects/thep-bao-tin/writing/ong-thep-duc-la-gi.md`  ⭐ vào subfolder writing/
6. **Post-publish**: Cập nhật `keywords-urls.md` ở root (thêm keyword + URL mới) + Session End update `memory.md`
7. Return: File path + summary

**Request**: "Refresh bài thep-ong-duc-phi-127 của Thép Bảo Tín"

**AI Actions**:
1. Detect project: `thep-bao-tin`
2. Load memory.md + read bài cũ
3. Activate skill: `skills/content/Content Refresh`
4. Generate: `projects/thep-bao-tin/refresh/thep-ong-duc-phi-127.md`  ⭐ vào subfolder refresh/
5. Session End: cập nhật memory.md (Recent Articles + Key Decisions: "refreshed bài X, kết quả Win/Flat/Loss sau 30d")

**Request**: "Tạo topical map về ống thép cho Thép Bảo Tín"

**AI Actions**:
1. Detect project: `thep-bao-tin`
2. Folder exists
3. Activate skills: `skills/strategy/Keyword Clustering`, `skills/content/Topic Clusters`
4. Generate: `projects/thep-bao-tin/topical.md` (root — file lõi)
5. Generate: `projects/thep-bao-tin/research/keyword-research-{cluster}.md` (research/)
6. Update: `projects/thep-bao-tin/keywords-urls.md` (root — file lõi)
7. Return: File paths + cluster summary

**Request**: "Audit topical cluster ống thép đúc của Thép Bảo Tín"

**AI Actions**:
1. Detect project: `thep-bao-tin`
2. Activate skill: `skills/content/Topical Audit`
3. Generate: `projects/thep-bao-tin/audit/audit-ong-thep-duc-2026-05-27.md`  ⭐ vào subfolder audit/

**Request**: "Generate JSON-LD schema cho thep-bao-tin"

**AI Actions**:
1. Activate skill: `skills/technical/Schema Markup`
2. Generate: `projects/thep-bao-tin/technical/schema-Article.json` + `schema-Organization.json`  ⭐ vào subfolder technical/

---

## Session End Protocol — BẮT BUỘC cuối mỗi phiên dự án

Trước khi report task completion cho user, AI BẮT BUỘC cập nhật `projects/{project}/memory.md`:

```
[ ] Append entry mới vào Session History (ngày + task + files + carry-over)
[ ] Append article mới vào Recent Articles (nếu có publish)
[ ] Edit Active Context nếu chuyển cluster/style/sprint focus
[ ] Edit Pending Tasks: xóa done, thêm mới phát sinh
[ ] Append Key Decisions nếu chốt quyết định mới
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md trong cùng commit với output bài viết
```

Mục đích: phiên tiếp theo của AI đọc được memory.md → không phải tái dựng context từ đầu → tiết kiệm 30-50k token / phiên.

Chi tiết workflow + bảo trì: `skills/project-memory/SKILL.md`.

---

*SEO Skills Library v1.6 — 61 skills, 17 knowledge notes, 7 playbooks + COMPILED-CONTEXT + Project Memory*
*Maintained for AI SEO 2025+*
