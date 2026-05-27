# Project Structure — SEO Skills Library

```
seo-skills/
├── AGENTS.md                      # Master config (source of truth)
├── CLAUDE.md                      # Claude Code config
├── GEMINI.md                      # Gemini CLI config
├── README.md                      # Project documentation
│
├── .github/
│   └── copilot-instructions.md    # GitHub Copilot config
│
├── .kiro/
│   └── steering/
│       ├── product.md             # Kiro main instructions
│       ├── tech.md                # Tech stack
│       └── structure.md           # This file
│
├── .augment-guidelines            # Augment Code config
│
├── skills/                        # 60 skills organized by category
│   ├── strategy/                  # 5 skills
│   │   ├── Keyword Research/
│   │   ├── Search Intent/
│   │   ├── Competitor Analysis/
│   │   ├── Keyword Clustering/
│   │   └── SEO Wins/
│   │
│   ├── on-page/                   # 7 skills
│   │   ├── Title/
│   │   ├── Descriptions/
│   │   ├── Header Structure/
│   │   ├── URL Structure/
│   │   ├── Internal Linking/
│   │   ├── Image Optimization/
│   │   └── Content Optimization/
│   │
│   ├── technical/                 # 6 skills
│   │   ├── Crawlability/
│   │   ├── Indexing/
│   │   ├── Site Speed/
│   │   ├── Schema Markup/
│   │   ├── Canonical Tags/
│   │   └── XML Sitemaps/
│   │
│   ├── content/                   # 9 skills
│   │   ├── Content Writing/
│   │   ├── Blog Content/
│   │   ├── Pillar Pages/
│   │   ├── Topic Clusters/
│   │   ├── Tools Content/
│   │   ├── Evergreen Content/
│   │   ├── Programmatic SEO/
│   │   ├── Content Refresh/
│   │   └── Topical Audit/
│   │
│   ├── off-page/                  # 5 skills
│   │   ├── Link Building/
│   │   ├── Guest Posting/
│   │   ├── Digital PR/
│   │   ├── Brand Mentions/
│   │   └── Outreach/
│   │
│   ├── international/             # 4 skills
│   │   ├── Hreflang/
│   │   ├── Multi Language/
│   │   ├── Geo Targeting/
│   │   └── Localization/
│   │
│   ├── analytics/                 # 5 skills
│   │   ├── Google Analytics/
│   │   ├── Search Console/
│   │   ├── Rank Tracking/
│   │   ├── Traffic Analysis/
│   │   └── KPI Tracking/
│   │
│   ├── ux/                        # 5 skills
│   │   ├── Page Speed UX/
│   │   ├── Mobile Optimization/
│   │   ├── UX Design/
│   │   ├── A_B Testing/
│   │   └── Conversion Funnels/
│   │
│   ├── ai-seo/                    # 5 skills
│   │   ├── Content Optimization/
│   │   ├── NLP Optimization/
│   │   ├── Generative SEO/
│   │   ├── SERP Features/
│   │   └── LLM Visibility/
│   │
│   ├── growth/                    # 4 skills
│   │   ├── Topical Authority/
│   │   ├── Content Scaling/
│   │   ├── Link Acquisition/
│   │   └── SEO Experiments/
│   │
│   ├── brand-distribution/        # 4 skills
│   │   ├── Google Business Profile/
│   │   ├── Facebook Content/
│   │   ├── Zalo OA/
│   │   └── Local SEO/
│   │
│   └── style-mimicker/            # 1 skill
│       ├── SKILL.md                # Capture & Apply workflow
│       └── profiles/               # Saved style profiles
│           ├── .gitkeep
│           ├── binhnn-digital.json
│           ├── thep-bao-tin.json
│           └── hatcapherangxay.json
│
├── knowledge/                     # 16 knowledge notes
│   ├── 01-seo-foundations.md
│   ├── 02-strategy.md
│   ├── 03-on-page-seo.md
│   ├── 04-content-seo.md
│   ├── 05-technical-seo.md
│   ├── 06-off-page-seo.md
│   ├── 07-international-seo.md
│   ├── 08-analytics.md
│   ├── 09-ux.md
│   ├── 10-eeat-content-quality.md
│   ├── 11-entity-seo.md
│   ├── 12-ai-seo.md
│   ├── 13-growth.md
│   └── 14-brand-distribution.md
│
├── playbooks/                     # 7 end-to-end workflows
│   ├── 01-keyword-research-workflow.md
│   ├── 02-content-brief-workflow.md
│   ├── 03-technical-seo-audit.md
│   ├── 04-content-refresh.md
│   ├── 05-link-outreach.md
│   ├── 06-ai-llm-visibility-audit.md
│   └── 07-brand-distribution-workflow.md
│
└── projects/                      # Output organized by project
    ├── topical-template.md           # Template cho topical.md mới
    ├── keywords-urls-template.md     # Template cho keywords-urls.md mới
    ├── binhnn-digital/
    │   ├── profile.md
    │   ├── topical.md                # Sơ đồ topical map
    │   ├── keywords-urls.md          # Danh sách keyword + URL đã publish
    │   └── audit-2026-05-13.md
    └── {project-name}/
        ├── profile.md
        ├── topical.md                # BẮT BUỘC — AI đọc trước khi viết
        ├── keywords-urls.md          # BẮT BUỘC — AI đọc trước khi viết
        └── *.md
```

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Category folders | lowercase, hyphen | `ai-seo/`, `on-page/` |
| Skill folders | Title Case | `Keyword Research/` |
| Skill files | Always `SKILL.md` | `SKILL.md` |
| Knowledge notes | `##-name.md` | `01-strategy.md` |
| Playbooks | `##-name.md` | `01-keyword-research-workflow.md` |
| Project folders | lowercase, hyphen | `thep-bao-tin/` |
| Content files | `{slug}.md` | `ong-thep-duc.md` |
