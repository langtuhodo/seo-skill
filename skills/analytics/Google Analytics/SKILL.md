# Google Analytics (GA4) — Phân tích hành vi & chuyển đổi

## 1. Purpose / Mục đích
GA4 trả lời "user làm gì sau khi vào site" — bổ sung cho GSC ("user gì để vào site"). Skill này tập trung vào setup chuẩn cho SEO + audit + extract insight actionable, không đi sâu vào ads/UA migration.

## 2. Core Concepts / Khái niệm cốt lõi

- **Event-based model**: GA4 mọi thứ là event (`page_view`, `scroll`, `click`, custom).
- **Engagement metric**: GA4 không có "bounce rate" theo cách UA — thay bằng **engaged session** (≥ 10s + ≥ 1 conversion + ≥ 2 pageview).
- **Conversion** (giờ gọi là "Key event"): event được mark là quan trọng (signup, purchase, lead).
- **Property vs Stream**: 1 property = 1 business unit; multiple stream cho web + iOS + Android.
- **Data retention**: max 14 tháng cho explore. Cần BigQuery cho retention dài hơn.
- **Sampling**: free GA4 không sample tới mức UA — vẫn có thể sample khi explore custom với high cardinality.
- **Consent mode v2**: required cho EU GDPR — nếu không setup, dữ liệu mất 30–60% impressions.

## 3. When to use
- Mọi site SEO — GA4 + GSC là combo baseline.
- Audit conversion path.
- Identify high-engagement / low-engagement page.
- Validate SEO traffic chất lượng (SEO traffic engaged hay không?).
- Build custom dashboard SEO.

## 4. Workflow setup + audit GA4

### Bước 1. Setup chuẩn
- 1 property cho site, các stream nếu cần.
- Install gtag hoặc GTM (recommend GTM cho flexibility).
- Verify tracking với GA4 DebugView.
- Setup Enhanced Measurement (page_view, scroll, outbound click, file download, video, site search).
- Internal traffic filter (loại IP nội bộ).
- Cross-domain tracking nếu có nhiều domain.
- Consent mode v2 cho EU.

### Bước 2. Mark Key Events (Conversion)
- Identify conversion: form submit, purchase, signup, contact, download, demo request.
- Implement event với name chuẩn (Google recommended): `purchase`, `sign_up`, `generate_lead`, `contact`.
- Mark as Key Event trong GA4.
- Verify với DebugView.

### Bước 3. Custom event SEO-related
- `scroll_50`, `scroll_75`, `scroll_100` (engagement đo độ đọc).
- `outbound_link_click`.
- `internal_link_click` (anchor data).
- `cta_click` per location.
- `featured_snippet_click` (nếu có).
- `tool_use` (cho Tools Content).
- Send qua GTM trigger.

### Bước 4. Custom dimension + metric
- `author` (cho blog).
- `cluster` (topic cluster).
- `funnel_stage` (TOFU/MOFU/BOFU).
- `template` (blog/product/pillar/tool).
- `published_date` (cho content lifecycle).
Khai báo qua GTM data layer.

### Bước 5. Audit dimension cơ bản
- **Source / Medium**: Organic Search > paid? referral?
- **Landing page** (top entry trang).
- **Page path** (top page traffic).
- **Country / Device / Browser**.
- **Engagement rate** vs benchmark.
- **Average engagement time**.
- **Conversion per channel**.

### Bước 6. SEO-specific reports

**Top SEO Landing Pages**:
- Filter: Source = google, Medium = organic.
- Group by Landing page.
- Sort engagement / conversion.

**Conversion path**:
- Path Exploration → start node `page_view` → forward step.
- Hiểu user di chuyển từ blog → pricing → signup.

**Content engagement**:
- Group by author / cluster / template.
- Find top-performing pattern.

**Decay**:
- Compare 90 ngày trước với 90 ngày sau.
- Trang giảm > 20% → refresh candidate.

### Bước 7. Build dashboard
Looker Studio:
- Tổng traffic theo source.
- Organic landing page top 50.
- Conversion theo landing page.
- Funnel TOFU → MOFU → BOFU.
- Cluster performance.
- Author performance.
- Refresh ROI theo cohort.

### Bước 8. BigQuery export (cho site lớn)
- Free tier: 10GB storage, 1TB query/month.
- Daily export GA4 → BigQuery → SQL queries cho insight phức tạp.
- Build pipeline → Looker Studio.

### Bước 9. Privacy + accuracy
- Consent mode v2 (required EU 03/2024).
- Server-side GTM cho khôi phục data lost trong adblock.
- IP anonymization (default GA4).
- Documenting consent + data retention cho audit.

### Bước 10. Quarterly review
- Top page contribute X% traffic — focus refresh.
- Channel mix changes.
- Conversion rate trend.
- Site speed correlation.
- Content cluster ROI.

## 5. Template Custom Report SEO

| Metric | Dimension | Filter | Notes |
|---|---|---|---|
| Sessions | Landing page | Source/Medium = google/organic | Top 50 SEO landing pages |
| Engagement rate | Landing page | Same | Tìm low-engagement |
| Conversion | Landing page | Same | ROI per page |
| Avg engagement time | Author | Same | Top author |
| Conversion | Funnel stage | Same | TOFU → MOFU rate |
| Sessions | Country | Same | Geo SEO |
| Avg page view per session | Cluster | Same | Cluster engagement |

## 6. KPI đo lường
- Organic sessions, users.
- Organic engagement rate.
- Organic Key Events (conversions).
- Organic conversion rate.
- Conversion attribution (last-click + assisted).
- Avg session duration / engagement time.
- Pages per session.
- Funnel completion rate.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GA4 | Free | Analytics chính |
| Google Tag Manager | Free | Event implementation |
| Looker Studio | Free | Dashboard |
| BigQuery | Free tier | Long retention + complex query |
| Server-side GTM | Paid | Tăng accuracy |
| Cookiebot / OneTrust | Paid | Consent management |
| GA4 Migrator (Stape, Analytics Mania) | Paid | Migration helper |
| Hotjar / Microsoft Clarity | Freemium | Behavior + heatmap (bổ sung GA4) |
| Ads Diagnostics + GSC integration | Free | Cross-validate |

### Useful BigQuery snippet — top organic landing pages last 28 days
```sql
SELECT
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS landing,
  COUNT(*) AS sessions,
  SUM(IF(event_name = 'sign_up', 1, 0)) AS signups
FROM `project.analytics_xxx.events_*`
WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE('%Y%m%d', DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY))
                          AND FORMAT_DATE('%Y%m%d', CURRENT_DATE())
  AND traffic_source.medium = 'organic'
GROUP BY landing
ORDER BY sessions DESC
LIMIT 50;
```

## 8. Common mistakes
- Migration UA → GA4 không clean → 2 hệ thống tracking → data lệch.
- Không setup Consent mode v2 → mất 30–60% data EU.
- Không filter internal traffic → conversion bị inflated.
- Mark too many events as Key Event (everything = Key Event = nothing).
- Custom dimension setup nhưng không populate qua data layer → dimension rỗng.
- Cross-domain không setup → user bounce khi cross subdomain.
- Trông cậy "bounce rate" như UA — GA4 dùng engagement rate khác.
- Không export BigQuery → mất dữ liệu sau 14 tháng.
- Không tách view dev/staging vs prod.
- Dùng GA4 thay GSC cho keyword data — GA4 KHÔNG có keyword (GSC mới có).
- Quên debug DebugView trước khi go-live → data sai 30 ngày.
- Sampling khi dùng explore với cardinality cao → không biết.
- Đặt mục tiêu cứng vào "bounce rate" cũ → metric không tồn tại.
- Tạo audience nhưng không sync với Google Ads → bỏ phí remarketing.

---
**Đầu ra**: GA4 chuẩn SEO + dashboard Looker Studio + quarterly review SOP + BigQuery cho site scale.
