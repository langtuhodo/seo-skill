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
projects/{ten-du-an}/
├── memory.md, profile.md, topical.md, keywords-urls.md  ← 4 file lõi ở ROOT
├── writing/{slug}.md          ⭐ bài viết mới (blog/pillar/supporting/tools/evergreen/pSEO)
├── refresh/{slug}.md          ⭐ bài refresh/optimize content cũ
├── research/                  ⭐ keyword research + content brief
├── audit/audit-{date}.md      ⭐ topical/content audit
├── technical/                 ⭐ technical SEO audit + JSON-LD schema snippets
├── brand-distribution/        GBP + FB + Zalo plans (giữ nguyên)
└── archive/                   ⭐ memory rotation + lưu trữ
```

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
- 🔲 v2.0: Dashboard mẫu (Looker Studio / GA4 / GSC) + Tailored variant theo niche (SaaS B2B / E-com / Local / Affiliate / Media)

---

*SEO Skills Library v1.9 — 62 skills, 18 knowledge notes, 7 playbooks + COMPILED-CONTEXT + Project Memory + Folder-scoped Output + `/audit` command*
*Maintained for AI SEO 2026+*

*Maintained as a senior SEO assistant playbook. Cập nhật theo guideline mới của Google & xu hướng AI SEO 2025+.*
