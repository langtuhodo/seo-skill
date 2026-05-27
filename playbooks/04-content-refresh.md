# Playbook — Content Refresh

**Mục tiêu**: identify decay content + refresh có hệ thống → recover position + traffic.

**Đầu vào**: GSC + GA4 + rank tracker + 16 tháng data.

**Đầu ra**: refresh sprint 10-30 bài / tháng + measurable lift.

**Skill liên quan**: Content SEO/Content Refresh, Strategy/SEO Wins, On-page SEO toàn bộ, Analytics/Search Console.

---

## Phase 1 — Identify decay candidates (Day 1)

GSC mining:
1. Export 16 tháng query + page data → BigQuery / Sheets.
2. Compute period-over-period:
   - Click L90D vs Click P90D.
   - Position L90D vs P90D.
   - Impression L90D vs P90D.
3. Decay signal:
   - Traffic L90D < 70% L365D peak.
   - Position drop ≥ 3 places.
   - Impression flat nhưng click drop.
4. Striking distance:
   - Position 5-20.
   - Impression ≥ 100/tháng.
   - Click rate suboptimal.
5. CTR opportunity:
   - Position ≤ 5 nhưng CTR < benchmark (Backlinko / GSC industry baseline).

Output: list 50-200 page candidates.

## Phase 2 — Triage + classify (Day 2)

Cho mỗi page:
1. Reason decay:
   - SERP shifted intent (top 5 nay listicle, mình essay).
   - Content outdated (2022 → 2025).
   - Competitor publish better content.
   - Schema mất / broken.
   - Canonical change / migration error.
   - Internal link mất.
   - CWV regression.
2. Refresh scope:
   - **Light (1-2 hour)**: meta refresh, year update, broken link fix.
   - **Medium (3-5 hour)**: 30-50% content rewrite, add new section, schema update.
   - **Heavy (1-2 day)**: rewrite hơn 70%, restructure, new visual, full SERP re-analyze.
3. Effort × Impact prioritize.

## Phase 3 — Refresh execution (Day 2+)

### Light refresh checklist
- [ ] Update year trong title + body (2024 → 2025).
- [ ] Update screenshot outdated.
- [ ] Fix broken link.
- [ ] Update statistic (replace 2022 stat → 2025).
- [ ] Update last-updated date visible.
- [ ] Add 1-2 new H3 nếu PAA mới.
- [ ] Schema verify.
- [ ] Submit GSC re-index.

### Medium refresh checklist
- [ ] Re-analyze SERP top 5.
- [ ] Format match (nếu intent shifted).
- [ ] Rewrite intro answer-first.
- [ ] Add TL;DR / key takeaway.
- [ ] Add FAQ section + schema.
- [ ] Add 2-3 information gain.
- [ ] Update visual (diagram, screenshot).
- [ ] Internal link IN ≥ 5, OUT ≥ 5.
- [ ] Schema upgrade (Article → Article + FAQPage + HowTo).
- [ ] Author byline + Person schema sameAs.
- [ ] Last-updated date visible.
- [ ] Submit GSC re-index.

### Heavy refresh checklist
- [ ] Full Brief mới (xem playbook Content Brief).
- [ ] Outline restructure.
- [ ] Rewrite hơn 70%.
- [ ] Original data / research thêm.
- [ ] Visual nguyên bản.
- [ ] Schema rich.
- [ ] Internal link cluster reinforce.
- [ ] CTA conversion path optimize.
- [ ] Submit GSC re-index + share lại distribution.

## Phase 4 — Measure (Day 28/60/90)

Track per-URL:
- Position avg (28d, 60d, 90d post-refresh).
- Click change.
- Impression change.
- CTR change.
- Conversion change.

Compare:
- vs pre-refresh baseline.
- vs control group (URL không refresh).

Lift expected:
- Light: +5-10% click trong 30 ngày.
- Medium: +20-40% click trong 60 ngày.
- Heavy: +50-100% click trong 90 ngày.

Nếu < expected → diagnose: SERP volatility? Refresh chưa đủ? Quality?

## Phase 5 — Pruning (parallel, low-effort)

URL không cứu được:
- Page traffic = 0 trong 12 tháng.
- Page out-of-niche / drift.
- Page duplicate (consolidate via 301 vào URL chính).

Action:
- 301 redirect vào URL gần nhất relevant.
- Hoặc 410 (vĩnh viễn xoá).
- Update sitemap.
- Update internal link.

## Phase 6 — Cadence + automation

- Monthly: top 30 decay candidates → triage → assign.
- Quarterly: heavy refresh 5-10 high-value page.
- Yearly: pillar refresh 3-5 page.
- Automation: GSC API + alert khi page drop > 30% click.

---

## Template Refresh Tracker

| URL | Primary keyword | Pos pre | Click pre L90D | Decay reason | Refresh scope | Effort | Owner | Status | Refresh date | Pos post 28d | Pos post 60d | Pos post 90d | Click change | Lift % |

## Template Refresh Brief (Medium)

```
## Refresh Brief: {URL}

### Pre-refresh baseline
- Pos: ...
- Click L90D: ...
- Impression L90D: ...
- CTR: ...

### Decay reason
- ...

### SERP re-analyze
- AI Overview: ...
- FS: ...
- Top 5 outline: ...
- Format winner: ...

### Refresh actions
1. Rewrite intro answer-first
2. Add TL;DR box
3. Add FAQ section + schema
4. Add new H2: "{topic}"
5. Update statistics
6. Add original case study
7. Internal link IN +3, OUT +3
8. Schema FAQPage add
9. Last-updated date visible

### Information gain (≥ 2 new)
1. ...
2. ...

### Owner + timeline
- Writer: ...
- Editor: ...
- Publish: ...

### Post-refresh actions
- [ ] GSC re-index submit
- [ ] Newsletter re-share
- [ ] Social re-promote
- [ ] Internal link site-wide audit
```

## KPI Playbook
- # bài refresh / tháng.
- Avg lift click (28d / 60d / 90d).
- # bài recover position top 5.
- # bài pruned (301 / 410).
- ROI refresh (cost vs traffic gain).
- Refresh win rate (% bài lift > 20%).

## Common pitfall
- Refresh light cho page intent đã shift → uneffective (cần heavy).
- Update year trong title nhưng content vẫn 2022 stat → user click rồi bounce.
- Quên submit GSC re-index → Google chậm pickup.
- Không document pre/post → không biết hiệu quả.
- Refresh không có control group → confound seasonality.
- Pruning aggressive → mất cluster link.
- Refresh quá nhiều cùng lúc → lift không attributable.
- Skip schema update → mất rich result.
- Quên distribution lại → re-share newsletter / social.
- Refresh quá thường (mỗi tháng cùng URL) → looking aggressive / spam.
- Không update last-modified date thực → freshness signal yếu.
- Tin "refresh = thay year 2024 → 2025" → quá đơn giản, không lift.
