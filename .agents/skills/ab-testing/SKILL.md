---
name: ab-testing
version: 1.0.0
description: "Use this skill when the user asks about A/B testing on SEO landing pages: 'A/B test landing page', 'split test CTR', 'experiment design', 'GA4 A/B test'. Covers test design, sample size calculation, statistical significance, SEO-safe split testing."
category: ux
---

# A/B Testing — Thử nghiệm tách kiểm chứng

## 1. Purpose / Mục đích
A/B testing là **phương pháp khoa học để chứng minh thay đổi UX/copy/CTA** có thực sự cải thiện metric, thay vì guess. Đặc biệt quan trọng cho SEO landing page và conversion: 1 thay đổi nhỏ với traffic lớn = lift hàng nghìn USD/tháng. Skill này định nghĩa cách design test có statistical rigor — không phải A/B test "ABC" rồi tự thuyết phục.

## 2. Core Concepts / Khái niệm cốt lõi

- **Hypothesis**: tuyên bố testable. "Đổi CTA xanh → đỏ sẽ tăng click 10% vì màu đỏ thu hút mắt hơn."
- **Variant** (A control, B test).
- **Primary metric**: 1 metric duy nhất quyết định win/lose.
- **Guardrail metric**: metric không được tệ đi (bounce, page load).
- **Sample size**: số visitor cần để statistical significance.
- **Statistical significance** (p-value < 0.05) hoặc **Bayesian probability ≥ 95%**.
- **Power**: khả năng detect lift thật (1-β, target 80%).
- **MDE (Minimum Detectable Effect)**: lift nhỏ nhất test có thể phát hiện.
- **SRM (Sample Ratio Mismatch)**: 50/50 split không thực sự 50/50 → test bị skew.
- **Novelty effect**: user new hành xử khác user existing trong tuần đầu.
- **Run duration**: ≥ 2 tuần (cover weekly cycle), thường 14–28 ngày.

## 3. When to use
- Khi traffic đủ (≥ 1000 conversion/test).
- CTA / headline / pricing / signup flow.
- Landing page biến thể.
- Trước rollout big change.

KHÔNG dùng khi:
- Traffic quá thấp → underpowered → noise.
- Thay đổi nhỏ không có hypothesis.
- Mất focus chính (test cosmetic vs core conversion).

⚠️ **A/B test SEO có rủi ro**: nếu serve 2 version cùng URL với cloaking → vi phạm. Dùng tool client-side với same URL + same content (tweak), hoặc test split-URL với canonical đúng.

## 4. Workflow A/B Testing

### Bước 1. Identify hypothesis
Nguồn ý tưởng:
- Heatmap + recording (dead click, drop-off).
- GA4 funnel drop-off.
- Customer feedback / CS ticket.
- Competitor analysis.
- UX audit finding.
- SEO opportunity (low CTR title).

Format hypothesis:
> Vì [observation], chúng tôi nghĩ [change] sẽ [impact metric] bởi [reasoning]. Sẽ biết khi [success criteria].

Ví dụ:
> Vì 60% mobile user drop ở pricing page (heatmap), chúng tôi nghĩ thêm sticky CTA "Start free trial" sẽ tăng signup conversion 15% bởi giảm friction scroll-to-CTA. Sẽ biết khi conversion rate signup ≥ +15% vs control với p < 0.05.

### Bước 2. Calculate sample size
Tool: Optimizely Sample Size Calc / GrowthBook / Stats Engine.
Inputs:
- Baseline conversion rate (vd 3%).
- MDE (vd +10% relative).
- Power 80%.
- Significance 95%.

→ Sample size per variant (vd 15.000 visitor).

### Bước 3. Choose tool

| Tool | Type | When |
|---|---|---|
| GrowthBook | Free open-source | SaaS, dev team |
| VWO | Paid | Marketing team friendly |
| Optimizely | Paid | Enterprise |
| Convert | Paid | GDPR-friendly |
| AB Tasty | Paid | Marketing |
| Statsig | Freemium | Product-led |
| PostHog | Freemium | Product-focused |
| Google Optimize | Deprecated 2023 | (use alternative) |

Native client-side script vs server-side:
- **Client-side**: setup nhanh, có flicker risk (control hiện rồi flash sang variant).
- **Server-side**: cleaner, no flicker, dev effort hơn.

### Bước 4. Implement
- Variant differ chỉ 1 yếu tố (isolate cause).
- Random 50/50 (or weighted nếu test risky).
- Trigger event vào analytics (GA4 custom dimension `experiment_id` + `variant`).
- QA: load test 10 lần, verify split ratio + variant render.

### Bước 5. SEO + A/B test guideline
- KHÔNG cloak Googlebot (serve khác user).
- Same URL, content gần giống nhau → OK.
- Split URL test (A: /pricing, B: /pricing-v2) → cần canonical /pricing trên cả 2 + không index B.
- Long-running variant → migrate winner sang URL chính + remove test.

### Bước 6. Run
- Chạy ≥ 14 ngày.
- KHÔNG peek + stop early khi "thấy win" → false positive.
- Monitor SRM: split 50/50 thật không?
- Monitor guardrail: bounce, LCP, error rate.
- Pause test nếu guardrail breach.

### Bước 7. Analyze
- Primary metric: lift % + p-value / Bayesian probability.
- CI (confidence interval): không chỉ point estimate.
- Segment analysis: lift per device, country, source — đôi khi 1 segment win, segment khác lose.
- Novelty: drop tuần 1 nếu chỉ test mới.

### Bước 8. Decide
**Ship winner**:
- Lift ≥ MDE.
- p < 0.05 hoặc Bayesian P(B>A) ≥ 95%.
- Guardrail OK.
- No SRM.

**Iterate**: kết quả flat → next hypothesis.

**Rollback**: variant lose → keep control, document learning.

### Bước 9. Document
Test log:
- Hypothesis.
- Variant.
- Sample.
- Metric result.
- Insight.
- Next test.

Build culture: 30-50% test win là realistic. Test fail có giá trị (loại hypothesis sai).

### Bước 10. Multivariate (MVT) khi cần
- Test ≥ 2 yếu tố cùng lúc.
- Sample size yêu cầu cao hơn (multiplicative).
- Phù hợp khi traffic lớn + cần hiểu interaction.

## 5. Template Test Brief

```
## Test ID: T-{number}-{slug}

### Hypothesis
Vì ..., chúng tôi nghĩ ... sẽ ... bởi ...

### Primary metric
{metric}, baseline = X%, target lift = +Y% (relative)

### Guardrail metrics
- Bounce rate (must not increase > 5%)
- LCP (must stay < 2.5s)
- Revenue per user

### Variants
- A (control): ...
- B (treatment): ...

### Audience
- Page: ...
- Device: All / Mobile / Desktop
- Country: ...
- Logged-in: Y/N

### Sample size
- Per variant: ...
- Estimated duration: ... days

### Tools
- {Tool}
- Tracking: GA4 + experiment dimension

### Decision criteria
- Ship if lift ≥ {MDE}, p < 0.05, guardrail OK
- Iterate if flat
- Rollback if lose

### QA checklist
- [ ] Variant renders correctly desktop + mobile
- [ ] Tracking event fires
- [ ] 50/50 split verified
- [ ] No flicker
- [ ] No SEO conflict

### Result (post)
- Lift: ...
- p-value / probability: ...
- Decision: ship / iterate / rollback
- Insight: ...
```

## 6. KPI đo lường (meta)
- # test / quý.
- Win rate (% test ship).
- Avg lift per win.
- Cumulative lift YTD.
- # learning insight per test (qualitative).
- Test cycle time (idea → ship/rollback).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GrowthBook | Free OSS | Feature flag + test |
| VWO | Paid | Marketing test |
| Optimizely | Paid | Enterprise |
| Convert / Kameleoon | Paid | EU GDPR |
| PostHog | Freemium | Product-led |
| Statsig | Freemium | Product test scale |
| Hotjar / Clarity | Freemium | Heatmap → hypothesis |
| Optimizely Sample Size Calculator | Free | Plan |
| GA4 + experiment dimension | Free | Track |
| Cypress / Playwright | Free | QA variant |
| Sentry | Paid | Error spike monitor |

## 8. Common mistakes
- Test không có hypothesis (test "ABC" cosmetic).
- Sample size quá nhỏ → underpowered → noise.
- Stop early khi peek thấy lift → false positive.
- Chạy < 7 ngày, miss weekly cycle.
- SRM mà không detect → test bị skew.
- Test 2 yếu tố cùng lúc trong A/B đơn (must MVT).
- Variant differ nhiều thứ → không biết yếu tố nào win.
- Bỏ qua segment → average giấu insight.
- Bỏ qua guardrail → win primary nhưng lose business (vd CTR tăng nhưng revenue giảm).
- Cloak Googlebot serving control khác → vi phạm.
- Split URL test mà không canonical → cannibalization.
- Không tracking event vào GA4 → không phân tích sau.
- Flicker FOOC trên client-side test → user thấy variant flash → bias kết quả.
- Test "novelty" early effect mà không chờ stabilize.
- Win rate 100% → đáng nghi (publish bias hoặc test setup sai).
- Không document test thua → lặp lại sai lầm.

---
**Đầu ra**: A/B test culture có hypothesis + sample size + guardrail + SEO-safe implementation + test log → cumulative lift theo quý.
