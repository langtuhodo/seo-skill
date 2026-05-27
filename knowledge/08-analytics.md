# Knowledge Note — Analytics

**Trigger**: khi user nhắc "GA4", "Search Console", "rank tracking", "traffic analysis", "KPI", "dashboard SEO", "Looker Studio", "BigQuery SEO", "attribution", "report SEO".

## Mục đích

Đo lường + diagnose + report SEO. Không có analytics → quyết định mù. Cover GA4 + GSC + rank tracker + traffic analysis + KPI framework.

## Khái niệm cốt lõi

### Google Analytics (GA4)
- Event-based model (không session-based như UA)
- Custom dimension: author, cluster, funnel_stage
- SEO events: scroll_50/75/100, internal_link_click, CTA_click
- BigQuery export: raw data cho custom analysis
- Consent mode v2: bắt buộc cho EU traffic

### Search Console (GSC)
- Weekly mining: striking distance, low-CTR, FS candidates, page decay
- Index Coverage: Valid / Excluded / Error
- Enhancements: schema errors, mobile usability
- Crawl Stats: bot activity, response codes
- BigQuery bulk export: 16 tháng data

### Rank Tracking
- Tracked keyword set: money + pillar + striking + brand
- Per-keyword config: country, device, language
- SERP feature tracking: FS, PAA, AI Overview, Image Pack
- Cannibalization detect: 2+ URL rank cùng keyword
- Competitor tracking: so sánh position over time

### Traffic Analysis — 4 câu hỏi
1. **Ai** đang tới? (audience, new vs returning)
2. **Từ đâu**? (channel breakdown, organic vs paid vs referral)
3. **Tương tác thế nào**? (engagement rate, scroll, pages/session)
4. **Convert không**? (conversion rate, revenue, MQL)
- Pareto: top 50 landing pages = 80% traffic
- Attribution model: last-click vs data-driven

### KPI Framework 4-tier
- **Input** (effort): bài publish, link acquired, technical fix shipped
- **Output** (visibility): impression, position, RD growth, AI cite
- **Outcome** (engagement): clicks, sessions, engagement rate, scroll, conversion micro
- **Impact** (business): revenue, signup, MQL, LTV

NSM (North Star Metric) thường = Organic Conversion hoặc Organic Revenue.

Dashboard cadence: daily (alert) / weekly (mining) / monthly (report) / quarterly (retro).

## Sub-skills

1. **Google Analytics** — GA4 event-based, custom dimension
2. **Search Console** — weekly mining, striking distance
3. **Rank Tracking** — keyword set, SERP feature tracking
4. **Traffic Analysis** — channel breakdown, attribution
5. **KPI Tracking** — 4-tier KPI, NSM, dashboard

## Workflow — Setup analytics

1. GA4 install + enhanced measurement + custom event SEO
2. GSC verify property + Bing Webmaster
3. Rank tracker setup (Ahrefs/Semrush) — keyword set per cluster
4. BigQuery export GA4 + GSC bulk
5. Looker Studio dashboard (4-tier KPI)
6. Cadence: weekly mining GSC + monthly traffic review + quarterly retro

## Khi nào dùng

- Setup analytics initial
- Weekly GSC mining (striking distance, decay)
- Monthly stakeholder report
- Quarterly retro
- Khi diagnose drop / surge

## Tools

- GA4 + Looker Studio
- GSC + Bing Webmaster
- BigQuery (GA4 + GSC export)
- Ahrefs / Semrush rank tracker
- Hotjar / Microsoft Clarity (engagement heatmap)
- Mixpanel / Amplitude (product funnel)
- dbt + SQL (custom analytics)

## File tham chiếu

- `skills/analytics/Google Analytics/SKILL.md`
- `skills/analytics/Search Console/SKILL.md`
- `skills/analytics/Rank Tracking/SKILL.md`
- `skills/analytics/Traffic Analysis/SKILL.md`
- `skills/analytics/KPI Tracking/SKILL.md`

## Common pitfall

- GA4 setup sai event → data garbage
- GSC < 14 tháng retention → không trend longer
- Rank tracker config sai country/device → data không phản ánh user thật
- KPI vanity (impression) thay vì outcome (conversion)
- Last-click attribution → underrate SEO blog assist
- Dashboard quá nhiều metric → noise
- Weekly mining bỏ qua → bỏ lỡ FS opportunity
- Cohort retention không track → không biết content giữ user không
- Bỏ qua consent mode v2 → EU traffic không tracking
- Bỏ qua server log analysis → không biết Googlebot crawl gì
