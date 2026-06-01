# SEO Skills Library — Bộ kỹ năng SEO toàn diện

> Bộ skill SEO cấp cao, song ngữ (Việt – Anh giữ nguyên thuật ngữ), được tổ chức theo 12 trụ cột chính. Mỗi sub-skill là 1 file `SKILL.md` chuẩn hoá, gồm: Lý thuyết → Quy trình triển khai → Template → KPI → Tools → Common mistakes.

## Cấu trúc thư mục

```
seo-skills/
├── skills/                    # 61 skills theo 13 categories
│   ├── strategy/              # Nền tảng chiến lược
│   ├── on-page/               # Tối ưu trên trang
│   ├── technical/             # Hạ tầng kỹ thuật
│   ├── content/               # Sản xuất nội dung
│   ├── off-page/              # Tín hiệu ngoài site
│   ├── international/         # Đa quốc gia / đa ngôn ngữ
│   ├── analytics/             # Đo lường & ra quyết định
│   ├── ux/                    # Trải nghiệm người dùng
│   ├── ai-seo/                # SEO trong kỷ nguyên AI
│   ├── growth/                # Tăng trưởng dài hạn
│   ├── brand-distribution/    # Phủ thương hiệu đa kênh
│   ├── style-mimicker/        # Sao chép & áp dụng phong cách viết
│   └── project-memory/        # ⭐ Bộ nhớ ngữ cảnh dự án giữa các phiên AI
│
├── knowledge/                 # 17 knowledge notes (trigger auto-load)
├── playbooks/                 # 7 workflow end-to-end
├── projects/                  # Output theo dự án (mỗi project có memory.md)
│
├── COMPILED-CONTEXT.md        # ⭐ Skill digest gọn — ĐỌC TRƯỚC TIÊN mỗi phiên
├── AGENTS.md                  # Config cho AI assistants
├── CLAUDE.md                  # Claude Code
├── GEMINI.md                  # Gemini CLI
└── README.md                  # File này
```

## ⭐ Project Memory System (v1.6 mới)

Từ v1.6, bộ skill hỗ trợ **bộ nhớ ngữ cảnh dự án** giữa các phiên AI — giải 2 vấn đề cốt lõi khi dùng CLI AI cho dự án dài hạn:

| Vấn đề | Giải pháp | File |
|---------|-----------|------|
| AI đọc lại toàn bộ 60 skill mỗi phiên (30-50k token lãng phí) | Skill digest gọn (~4k token) thay vì load 60 skill files | `COMPILED-CONTEXT.md` |
| AI quên trạng thái dự án giữa các phiên | Memory file per project + Session End Protocol | `projects/{project}/memory.md` |

**Quick start:** đầu mỗi phiên AI đọc `COMPILED-CONTEXT.md` + `projects/{project}/memory.md`. Cuối mỗi phiên AI tự cập nhật memory.md. Chi tiết: `skills/project-memory/SKILL.md`.

## 13 Categories × 61 Skills

| # | Category | Skills | Path |
|---|----------|--------|------|
| 1 | Strategy | 5 | `skills/strategy/` |
| 2 | On-page | 7 | `skills/on-page/` |
| 3 | Technical | 6 | `skills/technical/` |
| 4 | Content | 9 | `skills/content/` |
| 5 | Off-page | 5 | `skills/off-page/` |
| 6 | International | 4 | `skills/international/` |
| 7 | Analytics | 5 | `skills/analytics/` |
| 8 | UX | 5 | `skills/ux/` |
| 9 | AI SEO | 5 | `skills/ai-seo/` |
| 10 | Growth | 4 | `skills/growth/` |
| 11 | Brand Distribution | 4 | `skills/brand-distribution/` |
| 12 | Style Mimicker | 1 | `skills/style-mimicker/` |
| 13 | Project Memory | 1 | `skills/project-memory/` |

## Chuẩn (template) của mỗi `SKILL.md`

Mỗi file kỹ năng tuân theo cấu trúc 8 phần:

1. **Tên & Mục đích (Purpose)** — kỹ năng này giải quyết vấn đề gì.
2. **Khái niệm cốt lõi (Core Concepts)** — định nghĩa, nguyên lý, "tại sao quan trọng".
3. **Khi nào dùng (When to use)** — bối cảnh phù hợp / không phù hợp.
4. **Quy trình triển khai (Workflow)** — các bước step-by-step, có thứ tự.
5. **Template / Checklist** — sản phẩm sẵn dùng (sheet, prompt, doc skeleton).
6. **KPI đo lường** — chỉ số chứng minh skill đang hoạt động.
7. **Tools đề xuất** — công cụ free + paid theo từng tình huống.
8. **Common mistakes** — sai lầm phổ biến cần tránh.

## Cách dùng bộ skill này

- **Khi nhận 1 task SEO bất kỳ**: xác định task thuộc trụ cột nào → mở `SKILL.md` tương ứng → bám theo Workflow.
- **Khi audit toàn site**: đi tuần tự Strategy → Technical → On-page → Content → Off-page → Analytics.
- **Khi launch site mới**: Strategy → Keyword Research → Topic Clusters → Pillar Pages → Technical SEO baseline → Content production.
- **Khi traffic giảm**: Analytics → Search Console → Crawlability/Indexing → Content Refresh → Link Acquisition.

## Knowledge Notes (`knowledge/`)

17 note tổng hợp — dùng để AI retrieval tự động khi nhận task SEO. Mỗi note có:
- Trigger keywords (khi nào auto-load).
- Mục đích nhóm.
- Sub-skill list + tóm tắt.
- Workflow tổng + tools + pitfall.
- Reference tới `SKILL.md` chi tiết.

## Playbooks (`playbooks/`)

7 workflow đa-skill end-to-end, mỗi playbook gọi tới nhiều SKILL.md. Dùng khi chạy task lặp lại.

| # | Playbook | Use Case |
|---|----------|----------|
| 1 | Keyword Research Workflow | Seed → cluster → roadmap |
| 2 | Content Brief Workflow | SERP → outline → brief |
| 3 | Technical SEO Audit | 14-phase audit checklist |
| 4 | Content Refresh | Identify decay → refresh |
| 5 | Link Outreach | Prospect → sequence → win |
| 6 | AI/LLM Visibility Audit | 5-engine audit → action plan |
| 7 | Brand Distribution | GBP + FB + Zalo unified calendar + measurement |

## Projects (`projects/`)

Output được tổ chức theo dự án + folder-scoped (chuẩn 2026). Khi yêu cầu task SEO cho một website/công ty cụ thể, AI tự động tạo & lưu vào subfolder tương ứng:

```
projects/
├── _demo/                     ⭐ (v1.3) Fallback cho ad-hoc content (không project + không style)
│   ├── README.md, style-guide.md (875 dòng anti-AI rule + AI-isms tiếng Việt), style-guide-en.md
│   ├── writing/{yyyy-mm-dd}-{slug}.md
│   ├── refresh/{yyyy-mm-dd}-{slug}.md
│   └── audit/{yyyy-mm-dd}-{slug}.md
│
└── {ten-du-an}/               ← Project thật (vd: thep-bao-tin, binhnn-digital, hatcapherangxay)
    ├── memory.md, profile.md, topical.md, keywords-urls.md, external-sources.md  ← 5 file lõi ở ROOT (external-sources.md tùy chọn, v1.2)
    ├── writing/{slug}.md          ⭐ bài viết mới (blog/pillar/supporting/tools/evergreen/pSEO)
    ├── refresh/{slug}.md          ⭐ bài refresh/optimize content cũ
    ├── research/                  ⭐ keyword research + content brief
    ├── audit/audit-{date}.md      ⭐ topical/content audit
    ├── technical/                 ⭐ technical SEO audit + JSON-LD schema snippets
    ├── brand-distribution/        GBP + FB + Zalo plans (giữ nguyên)
    └── archive/                   ⭐ memory rotation + lưu trữ
```

**Fallback `_demo` (v1.3)**: khi AI không detect được project name + không có style profile name → auto activate `_demo` mode, dùng `projects/_demo/style-guide.md` làm phong cách mặc định (anti-AI rule + bảng AI-isms tiếng Việt + tiếng Anh), output đặt trong `projects/_demo/writing/`. KHÔNG cập nhật memory project nào ở cuối phiên. Chi tiết: `projects/_demo/README.md`.

Chi tiết path convention cho từng loại output: xem `AGENTS.md` Section "GENERATE OUTPUT" và `COMPILED-CONTEXT.md` mục 9.

## IDE/CLI Support

Bộ skill này auto-load với các tool sau:

| Tool | Config File |
|------|-------------|
| Claude Code | `CLAUDE.md` |
| Gemini CLI | `GEMINI.md` |
| VS Code + Copilot | `.github/copilot-instructions.md` |
| Kiro | `.kiro/steering/` |
| Augment | `.augment-guidelines` |

## Quy ước viết

- Tiếng Việt làm chính. Thuật ngữ SEO (search intent, canonical, hreflang, schema, EEAT, …) **giữ nguyên tiếng Anh**, không dịch máy móc.
- Mỗi skill nhắm tới mức **chi tiết ~1000+ từ**, đủ để 1 SEO mid-level có thể thực thi mà không cần tra Google.
- Tools liệt kê có ghi rõ **Free / Freemium / Paid** + use case cụ thể.

## Roadmap

- ✅ v1.0: 10 trụ cột × 53 SKILL.md
- ✅ v1.1: 10 Knowledge Notes + 6 Playbooks
- ✅ v1.2: Restructure folders + IDE auto-load + Project workflow
- ✅ v1.3: Style Mimicker + Topical Audit + Content Writing nâng cấp
- ✅ v1.4: 15 Knowledge Notes + Entity SEO + E-E-A-T & Quality + SEO Foundations
- ✅ v1.5: Brand Distribution (4 skills) + 7 Playbooks + Project Profile workflow
- ✅ v1.6: ⭐ Project Memory System (COMPILED-CONTEXT digest + per-project memory.md + Session End Protocol)
- ✅ v1.7: SEO 2026 Migration (M1+S2+D1) — Metadata SOP, AIO-readiness, Title <550px, Meta ≤135 chars, Topical Audit 100đ reweight
- ✅ v1.8: Folder-scoped Project Structure — writing/, refresh/, research/, audit/, technical/, archive/ subfolders cho mỗi project
- ✅ v1.9: Content Evaluation skill + `/audit` command — audit 1 bài đơn lẻ theo E-E-A-T & SEO 2026 với 6-section report
- ✅ v1.9.1: Content Evaluation v1.1 — Duplicate Detection (vs `keywords-urls.md` schema v1.1, 7 cột) + Verdict 4 trạng thái (🟢 GIỮ / 🟡 CẬP NHẬT / 🟠 LÀM MỚI / 🔴 XÓA) trên thang 100đ. Schema `keywords-urls.md` migrate từ 8 cột → 7 cột (bỏ `Trạng thái`, thêm `Tiêu đề`).
- ✅ v1.9.2: Content Evaluation v1.2 + Content Writing/Refresh v1.1 — **External Citation Whitelist** (`projects/{project}/external-sources.md` 3-tier: cơ quan / báo chí / chuyên gia). Anti-hallucination: AI chỉ cite từ whitelist, KHÔNG bịa URL nguồn ngoài. `/audit` thêm Section 5.6 External Citation Check + Phase 3.5. Populate sẵn: thep-bao-tin (Steel: ASTM/ISO/JIS/Worldsteel/VSA), binhnn-digital (Digital Marketing: Google Search Central/Moz/Backlinko/Neil Patel/HubSpot).
- ✅ v1.9.3: **Ad-hoc Content Fallback `_demo`** — khi AI không detect được project name + không có style profile name → auto activate `_demo` mode. `projects/_demo/style-guide.md` (~875 dòng): translation tiếng Việt + bảng AI-isms tiếng Việt riêng (Tier 1: 24 từ, Tier 2: 15 từ, Tier 3: 8 từ + 19 phrase) + 10 pattern tiếng Việt đặc trưng (sự overuse, được passive, một cách construction...) + bảng tiếng Anh integrated. Output `projects/_demo/{writing|refresh|audit}/{yyyy-mm-dd}-{slug}.md`. Skill Content Writing thêm Phase -2 (Detect Project/Style), Content Evaluation v1.3 thêm fallback, Style Mimicker SKIP, Project Memory Session End ad-hoc exception.
- 🔲 v2.0: Dashboard mẫu (Looker Studio / GA4 / GSC) + Tailored variant theo niche (SaaS B2B / E-com / Local / Affiliate / Media)

---

*SEO Skills Library v1.9.3 — 62 skills, 18 knowledge notes, 7 playbooks + COMPILED-CONTEXT + Project Memory + Folder-scoped Output + `/audit` v1.3 (Duplicate Detection + Verdict 4 trạng thái + External Citation Check + **Ad-hoc fallback `_demo`**) + keywords-urls.md schema v1.1 (7 cột) + external-sources.md whitelist 3-tier (v1.2) + projects/_demo/style-guide.md (875 dòng, AI-isms tiếng Việt riêng, v1.3)*
*Maintained for AI SEO 2026+*

*Maintained as a senior SEO assistant playbook. Cập nhật theo guideline mới của Google & xu hướng AI SEO 2025+.*
