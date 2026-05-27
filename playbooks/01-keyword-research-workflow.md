# Playbook — Keyword Research Workflow

**Mục tiêu**: từ 0 → keyword roadmap cluster có priority + intent + business value.

**Đầu vào cần**: niche/sản phẩm/website + market target + 1-3 đối thủ chính.

**Đầu ra**: spreadsheet + cluster map + content brief priority list.

**Skill liên quan**: Strategy/Keyword Research, Strategy/Search Intent, Strategy/Competitor Analysis, Strategy/Keyword Clustering, Strategy/SEO Wins.

---

## Phase 1 — Setup (Day 1)

1. Xác định business goal: lead, e-com, SaaS signup, app install, ad revenue.
2. Define ICP (persona) + use case.
3. Define niche boundary: core / adjacent / periphery (skill Topical Authority).
4. Confirm market: country, language, region.
5. Audit current site (nếu có): GSC export top 1000 query trong 16 tháng qua.

## Phase 2 — Seed (Day 1-2)

1. Brainstorm 50 seed từ business + landing page + use case.
2. Mining từ:
   - GSC top query (query đã rank 11-30 = seed).
   - Site search internal (nếu có).
   - Sales / CS conversation note.
   - Subreddit + forum ngách.
   - Customer interview transcript.
3. Output: 100-200 seed keyword.

## Phase 3 — Expand (Day 2-3)

1. Ahrefs / Semrush Keyword Magic Tool: nhập seed → expand 3-5x mỗi seed.
2. AlsoAsked / AnswerThePublic: question pattern.
3. Google Autocomplete + Related search.
4. Competitor keyword export (Ahrefs Site Explorer → Top Pages → keyword).
5. Reddit / Quora top question.
6. Output: 2,000-10,000 keyword raw list.

## Phase 4 — Filter + Tag (Day 3-4)

1. Filter:
   - Loại bỏ branded competitor.
   - Loại keyword unrelated (false-positive expand).
   - Volume ≥ ngưỡng (vd ≥ 30 SV cho ngách nhỏ, ≥ 100 cho ngách lớn).
   - KD ≤ ngưỡng phù hợp (DR mình + 5).
2. Tag:
   - **Intent**: I (Informational), N (Navigational), C (Commercial), T (Transactional).
   - **Sub-intent**: definition, list, compare, alternative, how-to, best, review.
   - **Persona**: persona nào target.
   - **Funnel stage**: TOFU / MOFU / BOFU.
   - **Business value**: Low / Med / High (impact conversion).

## Phase 5 — Cluster (Day 4-6)

1. Tool clustering: Keyword Insights / Surfer / Ahrefs Parent Topic.
2. Cluster theo SERP overlap (recommended) thay vì chỉ semantic.
3. Mỗi cluster:
   - 1 head keyword.
   - 5-30 long-tail variant.
   - Intent dominant.
   - SV cluster total.
   - KD avg.
4. Verify manual cluster lớn (top 20).
5. Output: 30-100 cluster.

## Phase 6 — Prioritize (Day 6)

Priority score = (SV × Business Value) / (KD × Effort).

Hoặc RICE:
- Reach = SV cluster.
- Impact = business value (1-5).
- Confidence = % rank top 10 (ước lượng).
- Effort = production effort (story point).

Output: prioritized roadmap 12 tháng.

## Phase 7 — SEO Wins overlay (Day 6-7)

1. GSC striking distance: position 5-20, impressions ≥ 100.
2. Cluster đối thủ mỏng (DR cao nhưng content kém).
3. Brand + branded modifier "{brand} review", "{brand} alternative".
4. Featured Snippet candidate (rank top 5 chưa FS).
5. Long-tail no-competition (KD < 5, SV ≥ 20).

Mark "Quick win" cho 10-30 keyword đầu tiên.

## Phase 8 — Map cluster → URL (Day 7)

Cho mỗi cluster:
- URL existing (nếu có) → cải thiện / refresh / migrate.
- URL mới → assign template (blog, pillar, listicle, comparison, tool).
- Author owner.
- Estimated publish date.

## Phase 9 — Content Brief priority (Day 8+)

1. Top 10 cluster priority → tạo Content Brief (xem playbook Content Brief Workflow).
2. Pre-load Brief vào editorial calendar Q1.
3. Sprint planning: 4 brief/month đầu, scale dần.

---

## Template Spreadsheet column

| Keyword | Volume | KD | CPC | Intent | Sub-intent | Persona | Funnel | Business value | Cluster | Cluster head | Priority score | URL existing | URL plan | Template | Owner | Status |

## Template Cluster Map

```
Cluster: SEO Tools
- Head: "best seo tools"
- SV cluster: 8500
- KD avg: 35
- Intent: Commercial (best/list)
- URL plan: /best-seo-tools/
- Variants:
  - "seo tools 2025"
  - "free seo tools"
  - "seo tools for small business"
  - ...
- Internal link: → /seo-strategy/, /keyword-research/
```

## KPI Playbook
- # keyword researched.
- # cluster identified.
- # cluster mapped → URL.
- # quick win flagged.
- Roadmap prioritized 12 tháng.

## Common pitfall
- Volume-driven thay vì business-driven.
- Cluster theo semantic mà không SERP overlap → cannibalization.
- Skip GSC striking distance — easy win bỏ lỡ.
- Mỗi cluster 1 URL nhưng URL mất phương hướng (intent mix).
- Quên localize cho international (volume per country).
- Tin AI cluster 100% — luôn manual verify cluster lớn.
- Roadmap quá dài 18 tháng — Q1 chi tiết, Q2-Q4 rolling.
