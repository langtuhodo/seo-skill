# SEO Skills Library — Bộ kỹ năng SEO toàn diện

> Bộ skill SEO cấp cao, song ngữ (Việt – Anh giữ nguyên thuật ngữ), được tổ chức theo 12 trụ cột chính. Mỗi sub-skill là 1 file `SKILL.md` chuẩn hoá, gồm: Lý thuyết → Quy trình triển khai → Template → KPI → Tools → Common mistakes.

## Cấu trúc thư mục

```
seo-skills/
├── skills/                    # 60 skills theo 12 categories
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
│   └── style-mimicker/        # Sao chép & áp dụng phong cách viết
│
├── knowledge/                 # 16 knowledge notes (trigger auto-load)
├── playbooks/                 # 7 workflow end-to-end
├── projects/                  # Output theo dự án
│
├── AGENTS.md                  # Config cho AI assistants
├── CLAUDE.md                  # Claude Code
├── GEMINI.md                  # Gemini CLI
└── README.md                  # File này
```

## 12 Categories × 60 Skills

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

14 note tổng hợp — dùng để AI retrieval tự động khi nhận task SEO. Mỗi note có:
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

Output được tổ chức theo dự án. Khi yêu cầu task SEO cho một website/công ty cụ thể, AI sẽ tự động:
1. Tạo folder `projects/{ten-du-an}/`
2. Lưu output vào folder đó với naming convention chuẩn

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
- 🔲 v1.6: Dashboard mẫu (Looker Studio / GA4 / GSC)
- 🔲 v1.7: Tailored variant theo niche (SaaS B2B / E-com / Local / Affiliate / Media)

---

*SEO Skills Library v1.5 — 60 skills, 16 knowledge notes, 7 playbooks*
*Maintained for AI SEO 2025+*

*Maintained as a senior SEO assistant playbook. Cập nhật theo guideline mới của Google & xu hướng AI SEO 2025+.*
