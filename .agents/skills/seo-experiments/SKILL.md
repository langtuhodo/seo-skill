---
name: seo-experiments
version: 1.0.0
description: "Use this skill when the user asks about SEO A/B testing / experiments: 'SEO test', 'thí nghiệm SEO', 'test thay đổi title CTR', 'SEO experiment framework'. Covers split testing, control vs variant, statistical significance, before-after measurement."
category: growth
---

# SEO Experiments — Thử nghiệm SEO có hệ thống

## 1. Purpose / Mục đích
SEO Experiments là **phương pháp khoa học để test giả thuyết SEO** — không phải "thấy guru bảo vậy thì làm". Mỗi experiment có hypothesis, methodology, control, measurement, và decision criteria. Site có culture experiment thường outperform vì compound learning + tránh wishful thinking. Skill này định nghĩa cách design + run + report SEO experiment.

## 2. Core Concepts / Khái niệm cốt lõi

- **Hypothesis**: tuyên bố testable + có metric.
- **Sample size**: # URL hoặc # query needed.
- **Control group**: URL không thay đổi để baseline so.
- **Treatment group**: URL áp dụng change.
- **Confound**: yếu tố nhiễu (Google update, seasonality, competitor change).
- **Statistical vs Practical significance**: stat sig nhỏ có thể không impact biz.
- **Test duration**: thường 4–8 tuần (cycle Google reindex + ranking adjust).
- **Reversibility**: change phải undo được nếu fail.
- **Causality vs Correlation**: SEO often correlation; experiment chiếm pháp tự cho causality.
- **Test isolated vs holistic**: 1 yếu tố vs change combo.

## 3. When to use
- Khi cân nhắc thay đổi áp dụng cho cả site (vd thêm schema FAQ, đổi URL pattern, đổi internal link strategy).
- Khi pattern không rõ "best practice" cho ngách mình.
- Khi optimize ROI giữa 2-3 lựa chọn.
- Khi convince stakeholder bằng data thay vì opinion.
- Khi audit cluster underperform.

## 4. Workflow SEO Experiment

### Bước 1. Hypothesis + question
Format SMART:
> Vì [observation], chúng tôi tin [change] sẽ [impact metric] +X% trong Y tuần, bởi [mechanism].

Examples:
- "Add FAQ schema cho top 100 blog → CTR +10% trong 6 tuần."
- "Đổi title format từ '{Topic} ({Year})' sang '{Topic}: {Specific Promise}' → impression +15% trong 4 tuần."
- "Internal link IN tăng từ 3 → 7 cho striking distance keyword → position cải thiện avg 3 vị trí trong 8 tuần."
- "Thay 'Read more' anchor bằng exact descriptive anchor → traffic landing target page +20%."

### Bước 2. Design test

**Test type**:

**A. Split test giữa cohort URL (recommend)**:
- 50 URL Treatment vs 50 URL Control cùng template + pattern.
- Random assign.
- Measure pre 4 tuần baseline + post 6-8 tuần.

**B. Sequential pre/post**:
- Cùng URL, measure pre vs post change.
- Risk: confound từ Google update + seasonality.
- Less rigorous nhưng dễ implement.

**C. Site vs site competitor benchmark**:
- Compare growth mình vs đối thủ tương tự.
- Adjust cho seasonal / market trend.
- Use khi site-wide change không có control.

**D. Geo-test (region split)**:
- Apply change cho 1 region, hold 1 region khác.
- Cho international SEO experiment.

### Bước 3. Sample size + power
- Sample ≥ 30 URL per group cho t-test có power decent.
- Cao hơn 50 URL preferred.
- Effect size kỳ vọng càng nhỏ → sample càng lớn.
- Tool: Optimizely Sample Size, statistical calculator.

### Bước 4. Define metric + tracking

**Primary metric** (1 metric duy nhất):
- Position avg.
- Impression.
- CTR.
- Click.
- Conversion.

**Guardrail metric**:
- Bounce rate.
- Engagement rate.
- LCP / INP.
- Other URL không bị ảnh hưởng tiêu cực.

**Track via**:
- GSC API + BigQuery.
- Rank tracker per URL group.
- GA4 cho engagement.
- Custom dashboard cho experiment.

### Bước 5. Implementation
- Document change cụ thể.
- Implement on Treatment group only.
- Verify deploy đúng (sample 5 URL inspect).
- Record start date + commit hash.
- Do NOT touch Control group.

### Bước 6. Run
- Duration ≥ 4 tuần (Google reindex).
- Better 6–8 tuần (ranking stabilize).
- Don't peek + early-stop (false positive).
- Monitor for confound (Google update, big competitor move) — annotate timeline.

### Bước 7. Analyze

Compare Treatment vs Control:
- Pre-period baseline (4 tuần trước).
- Post-period (6 tuần sau).
- Lift = (Treatment Δ%) - (Control Δ%).

Statistical test:
- t-test cho mean.
- Mann-Whitney U cho non-parametric.
- p < 0.05 hoặc Bayesian probability ≥ 95%.

Check guardrail.

Segment analysis:
- Per-cluster, per-template, per-device.

### Bước 8. Decide

**Ship**:
- Lift ≥ MDE.
- Stat sig.
- Guardrail OK.
- Apply cho site-wide.

**Don't ship**:
- Lift flat / negative.
- Document learning.
- Revert change cho Treatment group (về như Control).

**Iterate**:
- Lift flat nhưng có insight segment → next experiment với refined hypothesis.

### Bước 9. Document + share
Test report:
- Hypothesis.
- Methodology.
- Sample.
- Result.
- Decision.
- Insight.
- Next test.

Build internal "experiment library" — gỗ kiến thức accumulated.

### Bước 10. Build experiment culture
- 1–2 SEO experiment / quý.
- Backlog ý tưởng test (≥ 10 lúc nào).
- Quarterly review.
- Encourage failed experiment → learning value.
- Avoid "best practice cargo cult" — test cho ngách mình.

## 5. Common SEO Experiment ideas

| Hypothesis | Test |
|---|---|
| FAQ schema tăng CTR | Split 50 URL apply FAQ vs 50 không |
| Internal link IN tăng → position tăng | Striking distance URL thêm 5 internal link IN |
| Title format A vs B | Split test 100 bài blog |
| Pillar pillar restructure → traffic | Apply mới 1 pillar, monitor cluster |
| Schema HowTo cho tutorial | Split tutorial bài |
| URL slug shorter | Migration cohort 50 URL |
| Content refresh tăng position | 30 bài refresh vs 30 không |
| Author byline + Person schema → EEAT | Apply 50% bài blog |
| Video embed → engagement → position | Embed YouTube vào 50 URL |
| Last-updated date → freshness signal | Add visible date 100 bài |
| Robots.txt allow GPTBot → AI cite | A/B at section level |
| Programmatic depth — 1000 vs 500 word | Generate 200 page each variant |

## 6. KPI đo lường (meta)
- # experiment / quý.
- Win rate (% experiment có ship).
- Avg lift per win.
- Cumulative lift YTD.
- Compound impact (sum).
- Time to ship (idea → decision).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC API + BigQuery | Free | Track per-URL group |
| Looker Studio | Free | Dashboard experiment |
| Ahrefs / Semrush rank tracker | Paid | Position per group |
| Optimizely Sample Size Calculator | Free | Plan |
| GrowthBook | Free OSS | Feature flag (cho server-side experiment) |
| Cloudflare Workers / Edge function | Paid | Serve variant per cohort |
| Notion / Airtable | Free | Experiment library |
| R / Python (scipy.stats) | Free | Statistical analysis |
| SearchPilot | Paid | Enterprise SEO test platform |

### Sample experiment doc template

```
## Experiment X-{number}: {short title}

### Hypothesis
Vì ..., chúng tôi tin ... sẽ ... +X% trong Y tuần, bởi ...

### Background
- Context, baseline.
- Source of idea.

### Design
- Type: Split URL cohort
- Sample: 50 Treatment vs 50 Control
- Selection criteria: ...
- Random assignment: seed=42
- Duration: 4w pre + 6w post

### Implementation
- Change: ...
- Verify: ...
- Start date: ...

### Metrics
- Primary: ...
- Guardrail: ...

### Decision criteria
- Ship if lift ≥ X% AND p < 0.05 AND guardrail OK

### Risks
- Confound: ...
- Mitigation: ...

### Result (post)
- Treatment Δ: ...
- Control Δ: ...
- Lift: ...
- p-value: ...
- Decision: ...
- Learning: ...

### Next test
- ...
```

## 8. Common mistakes
- Test không có hypothesis — "let's see what happens".
- Sample size ≤ 10 URL → noise.
- No control group → confound không tách được.
- Stop early khi peek thấy result.
- Run < 4 tuần.
- Test 2 yếu tố cùng lúc → không biết yếu tố nào.
- Treatment + Control khác nhau ngoài change — bias.
- Bỏ qua Google update + seasonality.
- Bỏ qua guardrail.
- Tin "best practice" mà không test cho ngách mình.
- Test cosmetic (color CTA) thay vì SEO core.
- Không document → kiến thức bị mất.
- Win rate 100% — đáng nghi (publication bias hoặc setup wrong).
- Không revert experiment fail.
- Tin stat sig nhỏ = practical impact lớn — không phải.
- Compare absolute lift mà không adjust seasonality.

---
**Đầu ra**: SEO experiment culture với 1-2 experiment/quý + experiment library + cumulative lift + tránh cargo-cult best practice.
