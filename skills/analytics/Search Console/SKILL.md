# Google Search Console (GSC) — Diagnostic & opportunity mining

## 1. Purpose / Mục đích
GSC là **dữ liệu duy nhất từ chính Google về site bạn**: query, position, CTR, impression, indexability, CWV, schema. Skill này định nghĩa cách extract opportunity từ GSC — vì 90% người chỉ xem dashboard mặc định mà bỏ qua mỏ vàng striking distance, decay detection, rich result tracking.

## 2. Core Concepts / Khái niệm cốt lõi

- **Property type**: Domain property (recommend, gồm mọi subdomain + protocol) vs URL prefix (chỉ 1 prefix cụ thể).
- **Performance report**: Query, Page, Country, Device, Search appearance, Date.
- **Pages report (Index Coverage)**: trạng thái index toàn site.
- **Enhancements**: rich result type (FAQ, Product, Recipe, How-to, Video, Article).
- **Crawl Stats**: trong Settings → bot behavior.
- **Sample**: GSC sample data sau ~25k row, dùng API hoặc BigQuery export để full data.
- **Search appearance**: filter cho rich result type.
- **Date discrepancy**: dữ liệu trễ 2–3 ngày. Last 28 days là mặc định khuyên dùng.

## 3. When to use
- Daily check (5 phút) cho health.
- Weekly opportunity mining.
- Monthly performance review.
- Sau Google update.
- Khi trang mới publish — verify index.
- Khi site giảm traffic đột ngột — diagnose.

## 4. Workflow GSC

### Bước 1. Setup
- Verify Domain property qua DNS TXT record.
- Add user (Editor cho team SEO, Viewer cho stakeholder).
- Submit sitemap (skill XML Sitemaps).
- Link với GA4 (Property Settings → Service connection).
- Link với BigQuery (bulk data export — free, daily).
- Set International Targeting nếu site đa region (skill Geo Targeting).

### Bước 2. Daily quick check (5 phút)
- Total clicks 7 ngày: bình thường?
- Coverage error spike?
- Manual action / Security issue?
- Core Web Vitals red URL spike?
- Sitemap status success?

### Bước 3. Weekly opportunity mining

**A. Striking Distance Keywords**
- Performance → Filter: Position > 5 AND Position < 21 AND Impressions ≥ 100.
- Sort by impressions desc.
- Cho mỗi query: identify URL → optimize content + internal link → theo dõi 4 tuần.
- Mục tiêu: đẩy 30–50% keyword này lên top 5.

**B. Low-CTR opportunities**
- Filter: Position ≤ 10 AND CTR < benchmark theo position.
- Rewrite title + meta description (skill Title, Descriptions).

**C. Featured Snippet candidates**
- Performance → Search appearance = "Web" (default), filter query có "what is", "how to", "best".
- Soi SERP query đó: có Featured Snippet không? Mình rank top 5 không?
- Optimize answer paragraph 40-58 từ.

**D. Page-level decay**
- Performance → Pages, compare last 28 days vs previous 28 days.
- Page giảm > 20% impressions → audit → refresh (skill Content Refresh).

**E. New query opportunities**
- Performance → Queries, "Compare" vs trước → query mới xuất hiện = trend hoặc Google đẩy.
- Decide: cover trên trang hiện tại hoặc viết bài mới.

### Bước 4. Index Coverage diagnostic

Pages report → "Why pages aren't indexed":
- Discovered – not indexed → discoverability vấn đề (skill Indexing).
- Crawled – not indexed → quality vấn đề.
- Page with redirect → verify ý đồ.
- Duplicate, Google chose different canonical → align signals.
- Soft 404 → fix content hoặc 404/410.
- Server error → fix hosting.

Mỗi tuần: số "Indexed" trend lên hay xuống?

### Bước 5. Enhancements

Theo dõi:
- Article, Product, Recipe, Video, FAQ, How-to, Breadcrumb, Sitelinks search box.
- Error / warning → fix.
- Valid count tăng → có thêm rich result eligible.

### Bước 6. Crawl Stats (Settings)
- Avg requests/day stable? Spike?
- Avg response time < 600ms?
- File type breakdown (HTML > CSS > JS > image).
- Status code: 200 majority, 3xx ≤ 5%, 4xx ≤ 2%, 5xx ≈ 0.

### Bước 7. Manual action + Security
- Manual action: check thường xuyên — nếu có, action ngay.
- Security: check sự cố hack, malware, SafeBrowsing.

### Bước 8. URL Inspection deep dive
- Đối với từng URL critical:
  - Indexed? canonical Google chọn?
  - Last crawl date?
  - Mobile-friendly?
  - Live test rendered HTML.
- Request Indexing cho trang mới hoặc refresh.

### Bước 9. Bulk export to BigQuery
GSC có cả 2 lựa chọn:
- **Search analytics export** (API hoặc Looker Studio) — sample khi > 25k row.
- **BigQuery bulk export** (06/2023+) — full data, daily.

Setup bulk export → dashboard custom có data đầy đủ, không sample.

### Bước 10. Cross-validate với GA4
- Organic clicks GSC (last 28 days) ≈ GA4 organic sessions?
- Discrepancy < 10% là bình thường (filter, consent, …).
- Discrepancy > 20% → vấn đề tracking, consent mode, hoặc filter.

## 5. Template Weekly Report

Sections:
1. Total clicks / impressions / position (vs prev week).
2. Top 5 winners + 5 losers query.
3. Striking distance candidates đã action.
4. CTR opportunities → rewrite list.
5. Index coverage error new.
6. CWV status.
7. New queries breakthrough.
8. Sitemap fetch + indexed ratio.
9. Action items next week.

## 6. KPI đo lường
- Total clicks / impressions / avg position weekly.
- Indexed ratio.
- # striking distance moved to top 5.
- # CTR uplift on rewritten title.
- # rich result valid.
- # CWV good URL %.
- Discovered / Indexed ratio.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC | Free | Source of truth |
| Looker Studio + GSC connector | Free | Dashboard |
| BigQuery bulk export | Free | Full data, no sample |
| Search Analytics for Sheets | Free | Pull GSC vào Sheet (sampled) |
| Keyword Insights / SE Ranking | Paid | Cluster GSC query |
| Ahrefs / Semrush integrate GSC | Paid | Cross-source |
| GSC Insights Chrome extension | Free | Quick view per page |
| Python `searchconsole` library | Free | Programmatic API |

### Useful Python snippet — pull striking distance
```python
from searchconsole import authenticate
account = authenticate(client_config='client.json', credentials='creds.json')
report = account['domain.com'].query.range('today', days=-28).dimension('query','page').get()
# Filter position 5-20, impressions >= 100
df = report.to_dataframe()
striking = df[(df['position'] > 5) & (df['position'] < 21) & (df['impressions'] >= 100)]
```

## 8. Common mistakes
- Chỉ xem dashboard mặc định, bỏ qua filter combo.
- Sample > 25k row mà không export BigQuery.
- Không monitor Coverage thường xuyên → index issue tích luỹ.
- Mistaken position avg là "rank thật" — nó là weighted avg theo impression.
- Không phân biệt Domain property vs URL prefix → property thiếu mobile/HTTPS.
- Quên link GA4 + BigQuery khi setup ban đầu.
- Request Indexing hàng loạt → vô hiệu + có thể bị limit.
- Không cross-validate với GA4 → tracking issue invisible.
- Xem Country tab nhưng không set International Targeting → multi-region traffic không attribute đúng.
- Bỏ qua Manual action notification → 1 ngày phát hiện toàn site bị penalty.
- Không track CWV theo URL group → fix không có ROI.
- Compare period 28 ngày vs 28 ngày khác season → lệch.

---
**Đầu ra**: GSC weekly review SOP + opportunity mining sheet + dashboard Looker Studio + BigQuery cho deep analysis.
