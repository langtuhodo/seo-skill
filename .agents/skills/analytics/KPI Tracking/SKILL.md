---
name: kpi-tracking
version: 1.0.0
description: "Use this skill when the user asks about KPI / OKR SEO tracking: 'KPI SEO', 'OKR cho SEO team', 'báo cáo KPI seo hằng tháng', 'metric SEO quan trọng'. Covers North Star metric, leading vs lagging indicators, KPI dashboard structure."
category: analytics
---

# KPI Tracking — Theo dõi chỉ số

## 1. Purpose / Mục đích
KPI Tracking là khung **đo SEO theo tầng (input → output → outcome → impact)**, để stakeholder hiểu được giá trị + để team biết focus đúng. Lỗi phổ biến: chỉ track "rank" + "traffic" rồi ngạc nhiên vì leadership không hài lòng. Skill này định nghĩa khung KPI, cadence, dashboard, và cách kết nối SEO với business outcome (revenue, lead, retention).

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 4 tầng KPI
- **Input metric**: việc team làm (số bài publish, số link build, số audit).
- **Output metric**: kết quả trực tiếp (rank, indexed page, RD).
- **Outcome metric**: hành vi user (sessions, engagement, conversion).
- **Impact metric**: business (revenue, MRR, lead, customer).

Stakeholder care impact; team kiểm soát input. Cần kết nối từng tầng.

### 2.2 Leading vs Lagging
- **Leading**: predict tương lai (rank, RD, content velocity, engagement).
- **Lagging**: kết quả thực (revenue, MRR).

Cần balance — leading guide hành động, lagging chứng minh ROI.

### 2.3 SMART
- Specific, Measurable, Achievable, Relevant, Time-bound.
- KPI mơ hồ ("tăng SEO") → không actionable.

### 2.4 North Star Metric (NSM)
- 1 metric duy nhất phản ánh giá trị chính.
- Cho SEO: thường là **Organic Conversions** hoặc **Organic Revenue** (nếu attribution tốt).
- Cho early-stage: có thể là **Indexed Pages** hoặc **Keyword Top 10**.

## 3. When to use
- Khi onboard role / dự án SEO mới — set KPI là điều đầu tiên.
- Quarterly OKR planning.
- Mỗi monthly review.
- Trước khi pitch SEO với leadership cho budget.

## 4. Workflow

### Bước 1. Map business goal → SEO KPI
Bắt đầu từ business:
- Revenue?
- Lead/MQL/SQL?
- Retention / activation?
- Brand awareness?

→ Mỗi business goal → SEO outcome → SEO output → SEO input.

Ví dụ:
- **Business**: tăng MQL 30%.
- **SEO outcome**: tăng demo signup từ organic 30%.
- **SEO output**: rank top 3 cho 20 BOFU keyword.
- **SEO input**: viết 20 BOFU bài, build 50 link tới 5 money page.

### Bước 2. Định nghĩa KPI sheet

| Layer | KPI | Definition | Source | Cadence | Owner | Target Q | Current |
|---|---|---|---|---|---|---|---|
| Input | # blog publish | Bài publish/tuần | Editorial calendar | Weekly | Editor | 4/wk | 3.5 |
| Input | # link earned | RD mới/tháng | Ahrefs | Monthly | Off-page lead | 30 | 22 |
| Input | # audit completed | # technical audit | GSC + Sitebulb | Monthly | Tech SEO | 1/mo | 1 |
| Output | Indexed pages | GSC indexed | GSC | Weekly | Tech SEO | 95% | 91% |
| Output | Avg position tracked KW | Position tracker | Ahrefs RT | Weekly | SEO lead | 12 | 14 |
| Output | RD total | Site-wide RD | Ahrefs | Weekly | Off-page lead | +50/Q | 38 |
| Outcome | Organic sessions | GA4 organic | GA4 | Weekly | SEO lead | +15% Q | +12% |
| Outcome | Organic engagement | Engaged sessions | GA4 | Weekly | Content lead | +20% Q | +15% |
| Outcome | Organic conversion | GA4 key event | GA4 | Weekly | SEO lead | +30% Q | +18% |
| Impact | Organic revenue | GA4 + CRM | GA4/HubSpot | Monthly | Marketing lead | +25% Q | +14% |
| Impact | Organic MQL | CRM lead source | CRM | Monthly | Marketing lead | +30% Q | +20% |

### Bước 3. Build dashboard
Looker Studio:
- 4 row: Input / Output / Outcome / Impact.
- Mỗi row: 4–6 KPI scorecard (current, target, Δ vs target, sparkline).
- Drill-down: click vào KPI → chart trend + segment.
- Update tự động hàng ngày.

### Bước 4. Cadence
- **Daily**: dashboard live, ai có thể xem.
- **Weekly**: SEO standup 30 phút — focus output + outcome.
- **Monthly**: stakeholder review 1h — focus outcome + impact.
- **Quarterly**: OKR retrospective + planning.

### Bước 5. Goal setting
Method: **Outcome targets first, then back-calculate input**.
- Q goal: organic conversion +30%.
- Conversion rate hiện tại 2% → cần +30% sessions hoặc +30% CR.
- Sessions: estimate cần thêm 100k → cần publish X bài + tăng position cho Y keyword.
- Backwards: input target (publish, link, audit).

Pad 20% buffer.

### Bước 6. Track & adjust
Hằng tuần:
- KPI nào on-track (≥ 90% target rate)?
- KPI nào off-track?
- Cần escalate hay tự xử lý?
- Action item + owner + ETA.

Mỗi tháng:
- Update target nếu reality khác giả định.
- Add KPI mới nếu phát hiện gap.
- Drop KPI vanity.

### Bước 7. Connect tới CRM / payment
Để tracking impact:
- UTM lead form → CRM tag "organic".
- GA4 → Stripe / payment via Measurement Protocol cho revenue.
- Customer journey lifetime value qua organic.
- Attribution model (last-click, position-based, data-driven) — chọn thống nhất với marketing org.

### Bước 8. Communicate stakeholder
- Lead với North Star.
- Bring 3 insight, không phải 30 number.
- Connect mỗi metric → action → impact.
- Show trend, không screenshot 1 ngày.
- Show counterfactual: nếu không làm SEO, dự đoán trend như thế nào?

## 5. Template KPI Brief

```
## SEO KPI Brief — Q{X} {Year}

### Business goals
- Goal 1: ...
- Goal 2: ...

### North Star
{Metric, current, target}

### KPI Tree
Input → Output → Outcome → Impact

### Targets
[Bảng KPI với target Q]

### Risks & dependencies
- ...

### Cadence
- Weekly standup
- Monthly review
- Quarterly retro

### Owner matrix
| KPI | Owner | Backup |
```

## 6. KPI đo lường (meta-KPI)
- KPI coverage: % business goal có SEO KPI mapped.
- KPI hit rate: % KPI on-target Q.
- Time-to-detect off-track (dashboard alert).
- Data freshness (delay từ event → dashboard).
- Stakeholder satisfaction (qualitative).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Looker Studio | Free | Dashboard chính |
| Tableau / Power BI | Paid | Enterprise BI |
| Notion / Coda | Freemium | KPI sheet + brief |
| GA4 + GSC + Ahrefs / Semrush API | Mixed | Source data |
| BigQuery | Free tier | Centralize |
| dbt | Freemium | Transform pipeline |
| HubSpot / Salesforce | Paid | CRM impact |
| Stripe / payment | Paid | Revenue |
| Google Sheets + Apps Script | Free | Lightweight automation |
| Slack / Teams alert | Free | Off-track notification |

## 8. Common mistakes
- Track quá nhiều KPI → overwhelm + không actionable.
- Track vanity (rank #1 cho keyword 0 SV).
- KPI không kết nối business → mất hỗ trợ leadership.
- Set target arbitrary, không back-calculate.
- Không document baseline → không đo được cải thiện.
- KPI không có owner → ai cũng + không ai chịu trách nhiệm.
- Dashboard đẹp nhưng không ai check.
- Stakeholder report mỗi tháng dump số, không insight.
- Bỏ qua leading metric → chỉ thấy lagging trễ.
- Không update target khi reality đổi.
- Lẫn lộn input vs output (số bài publish ≠ số bài rank).
- Đo "rank" làm Bắc Cực mà không attribute revenue → bị thay thế bởi paid khi cuộc chiến budget.
- Không alert khi off-track → phát hiện cuối Q.
- Track theo session thay vì user (đặc biệt B2B với cycle dài).

---
**Đầu ra**: KPI tree từ business → input + dashboard live + cadence rõ + brief stakeholder.
