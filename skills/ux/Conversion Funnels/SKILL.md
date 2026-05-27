# Conversion Funnels — Phễu chuyển đổi

## 1. Purpose / Mục đích
Conversion Funnel = chuỗi step user đi từ awareness → conversion. Mỗi step có drop-off; tối ưu từng step có ROI lớn hơn việc cố tăng top-of-funnel. Skill này định nghĩa cách map funnel SEO, identify drop-off, và optimize có hệ thống — để traffic SEO biến thành revenue.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Funnel SEO chuẩn
1. **Awareness** (TOFU): blog, pillar (informational query).
2. **Interest** (MOFU): comparison, alternative, "best of" (commercial query).
3. **Consideration** (MOFU/BOFU): pricing, demo, case study.
4. **Decision** (BOFU): signup, purchase, contact.
5. **Activation**: user thực sự dùng product.
6. **Retention**: user quay lại / pay tiếp.
7. **Referral**: user giới thiệu.

SEO truyền thống tập trung 1–4. Skill này tích hợp 5–7 vì SEO content cũng có thể impact retention (knowledge base, support content).

### 2.2 Macro vs Micro conversion
- **Macro**: revenue / lead.
- **Micro**: email signup, video play, demo request.

Funnel cần track cả 2 để diagnose.

### 2.3 Step conversion vs Total conversion
- Step CR (rate giữa step): tỉ lệ tiến từ step n → n+1.
- Total CR: visitor → final conversion.
- Multiplicative: step1 × step2 × step3 = total.

### 2.4 Cohort
- Funnel performance theo cohort acquired.
- Cohort tháng 3 vs tháng 4 retention?

## 3. When to use
- Khi traffic SEO cao nhưng conversion phẳng.
- Audit drop-off step nào.
- Trước khi launch new flow.
- Quarterly conversion review.

## 4. Workflow Funnel Optimization

### Bước 1. Map funnel hiện tại
Vẽ flow:
- Entry point (organic landing).
- Step intermediate (blog → pillar → pricing → signup).
- Conversion event.

Tool: Whimsical / Miro / Lucidchart.

### Bước 2. Track event mỗi step (skill GA4)
Custom event:
- `view_blog`, `scroll_75_blog`.
- `view_pillar`.
- `click_internal_link`.
- `view_pricing`.
- `click_pricing_cta`.
- `start_signup`.
- `complete_signup` (Key Event).
- `activate_first_action`.
- `subscribe_paid`.

### Bước 3. Build funnel exploration
GA4 → Explore → Funnel exploration.
- Step 1: Landing page = blog organic.
- Step 2: View pillar.
- Step 3: View pricing.
- Step 4: Signup.

→ Drop-off mỗi step.

### Bước 4. Identify biggest drop-off
Pareto: 80% drop-off ở 1–2 step. Focus đó trước.

Ví dụ:
- Blog → Pillar: 30% — internal link không clear.
- Pillar → Pricing: 8% — cần CTA pricing trong pillar.
- Pricing → Signup: 25% — pricing complex.
- Signup form: 60% — form quá nhiều field.

→ Đầu tư signup form trước (60% drop = lớn nhất + lift dễ).

### Bước 5. Diagnose root cause
Cho mỗi drop-off step:
- Heatmap (Hotjar / Clarity).
- Recording user thực tế.
- Funnel theo segment (mobile vs desktop, country).
- A/B test idea.
- Customer interview.
- Survey "Tại sao bạn chưa signup?" (post-bounce).

### Bước 6. Hypothesize fix
Mỗi drop-off → 3 hypothesis test:
- UX: form 1 column, fewer field.
- Copy: CTA verb-led, value-prop rõ.
- Trust: testimonial trên signup page.
- Friction: SSO Google/GitHub option.

Prioritize ICE: Impact × Confidence / Effort.

### Bước 7. A/B test (skill A/B Testing)
- Control vs treatment.
- Sample size + guardrail.
- Decision criteria.

### Bước 8. Stage-based content strategy
Mỗi funnel stage có content type:
- TOFU: blog informational, pillar.
- MOFU: comparison, alternative, "vs".
- BOFU: pricing, demo, case study, ROI calculator.
- Activation: how-to-use, video tutorial, onboarding email.
- Retention: knowledge base, advanced tutorial, community.
- Referral: affiliate program, share button, NPS.

Audit: cluster nào thiếu stage nào? Lấp gap.

### Bước 9. Internal funnel link
Blog → Pillar (cùng cluster).
Pillar → Pricing (CTA inline).
Pricing → Signup (multi-CTA).
Signup → Activation (welcome email, in-app onboarding).
Help docs → Activation cross-link.

(Xem skill Internal Linking.)

### Bước 10. Cross-funnel insight
- Top organic landing nào dẫn tới signup?
- Cluster nào ROI cao?
- Funnel attribution: blog read 2 lần trước khi signup → SEO assist value cao.
- Time-to-conversion trung bình (B2B 14–60 ngày).

### Bước 11. Email + retargeting layer
- Email capture trên blog (newsletter).
- Drip nurture series.
- Retargeting ads cho user đã view pricing nhưng chưa signup.
- Push notification cho PWA.

### Bước 12. Continuous experiment
Mỗi quý:
- 5–10 funnel test.
- Document learning.
- Compound lift.

## 5. Template Funnel Audit Sheet

| Stage | Step | Event | Visitors last 30d | Step CR | Drop-off % | Top reasons | Hypothesis | Test status | Result |

Drilldown segment per device, country, source.

## 6. KPI đo lường
- Total funnel CR (entry → final).
- Step CR (each step).
- Time-to-conversion.
- Per-channel conversion (organic vs paid).
- Per-stage content contribution.
- Activation rate (after signup).
- Retention 30/60/90.
- LTV per organic-acquired customer.
- LTV / CAC ratio.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GA4 Funnel Exploration | Free | Funnel viz |
| Mixpanel / Amplitude / PostHog | Freemium | Product funnel |
| Hotjar / Clarity | Freemium | Heatmap, recording |
| FullStory | Paid | Session replay |
| Maze / Lookback | Paid | Usability test |
| Typeform | Freemium | Survey post-bounce |
| HubSpot / Salesforce | Paid | CRM funnel B2B |
| Customer.io / Braze | Paid | Drip + lifecycle |
| GrowthBook / VWO | Mixed | A/B test |
| Looker Studio | Free | Dashboard |
| dbt + BigQuery | Mixed | Custom funnel SQL |

### Sample SQL — funnel cohort BigQuery
```sql
WITH first_visit AS (
  SELECT user_pseudo_id, MIN(event_timestamp) AS first_ts
  FROM `proj.analytics.events_*`
  WHERE event_name = 'page_view' AND traffic_source.medium='organic'
  GROUP BY 1
),
step1 AS (
  SELECT user_pseudo_id FROM `proj.analytics.events_*`
  WHERE event_name = 'view_pricing'
),
step2 AS (
  SELECT user_pseudo_id FROM `proj.analytics.events_*`
  WHERE event_name = 'sign_up'
)
SELECT
  COUNT(DISTINCT first_visit.user_pseudo_id) AS visitors,
  COUNT(DISTINCT step1.user_pseudo_id) AS pricing_view,
  COUNT(DISTINCT step2.user_pseudo_id) AS signups
FROM first_visit
LEFT JOIN step1 USING(user_pseudo_id)
LEFT JOIN step2 USING(user_pseudo_id);
```

## 8. Common mistakes
- Tối ưu top-of-funnel mà bỏ qua bottom → SEO traffic nhiều, conversion thấp.
- Map funnel theo channel mà bỏ qua mixed-touch user (B2B).
- Không track micro-conversion → chỉ thấy "không conversion".
- Funnel exploration GA4 setup sai event sequence.
- Ignore mobile funnel separately → mobile CR thường lower 30-50%.
- A/B test mà không hypothesis funnel.
- Không biết drop-off step nào lớn nhất → optimize sai chỗ.
- Cluster blog rich nhưng pricing/CTA poor → lead generated rất ít.
- Không có MOFU content → traffic TOFU không advance.
- Activation/retention bỏ qua → signup nhiều nhưng paid customer ít.
- Attribution last-click → SEO blog underrated assist role.
- Drop-off survey aggressive interrupt user.
- Quên align sales/marketing — lead form generated nhưng sales follow-up chậm.
- Funnel quá phức tạp với 10 step → khó tối ưu.
- Không document learning từ test thua.

---
**Đầu ra**: funnel map chi tiết + tracking event đầy đủ + drop-off prioritized + test cycle continuous → SEO traffic biến thành revenue có hệ thống.
