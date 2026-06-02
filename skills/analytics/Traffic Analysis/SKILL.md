---
name: traffic-analysis
version: 1.0.0
description: "Use this skill when the user asks about traffic analysis / phân tích lưu lượng: 'traffic drop diagnosis', 'phân tích traffic tăng giảm', 'channel attribution', 'tại sao traffic giảm', 'segment traffic'. Covers traffic drop root cause, channel split, page-level analysis, seasonal vs algorithmic."
category: analytics
---

# Traffic Analysis — Phân tích lưu lượng

## 1. Purpose / Mục đích
Traffic analysis trả lời 4 câu hỏi: **Ai đang đến?** **Từ đâu?** **Họ tương tác như thế nào?** **Có chuyển đổi không?** Tách bạch rõ giúp ra quyết định tốt hơn — vd "traffic SEO tăng 30%" có thể chỉ là 1 spike từ Reddit 1 lần, hoặc là cluster mới đang work. Skill này định nghĩa cách diagnose + segment + attribute.

## 2. Core Concepts / Khái niệm cốt lõi

- **Channel grouping**: Organic Search, Direct, Referral, Social, Email, Paid Search, Display, Affiliate.
- **Source / Medium**: granular hơn channel.
- **Last-click vs Assisted vs Data-driven attribution**: model attribution ảnh hưởng cách đánh giá ROI.
- **Engagement quality**: traffic là vô nghĩa nếu không engaged. Engaged session = ≥ 10s + ≥ 2 PV + key event.
- **Cohort**: nhóm user theo thời gian acquire.
- **Segment**: filter slice (geo, device, page, source).
- **Spike vs trend**: spike thường 1 source / 1 page; trend cộng dồn.

## 3. When to use
- Weekly review.
- Monthly stakeholder report.
- Sau campaign / launch / Google update.
- Khi traffic giảm → diagnose.
- Khi conversion plateau → tìm bottleneck.
- Quarterly planning.

## 4. Workflow

### Bước 1. Channel breakdown
GA4 → Acquisition → Traffic acquisition.
Cho mỗi channel:
- Sessions, users, engaged sessions, key events, conversion rate.
- Trend 90/180/365 ngày.

So sánh tỉ lệ:
- Organic Search ≥ 40–60% là healthy cho content site.
- Direct ≥ 30% có thể là branding mạnh hoặc tracking issue (UTM bị strip).
- Referral spike = chỉ ra ai đang send traffic.
- Social tốt ngắn hạn nhưng convert thường thấp hơn organic.

### Bước 2. Source / Medium drill-down
- google / organic — SEO chính.
- chatgpt.com, perplexity.ai, claude.ai — AI search referral mới (xem AI SEO).
- t.co, x.com — Twitter.
- Filter UTM-tagged campaigns.

Tracking gap: nếu UTM không tagged → đi vào "direct" → mất visibility.

### Bước 3. Landing page analysis
GA4 → Engagement → Landing page.
- Top 50 landing page chiếm bao nhiêu %?
- Pareto check (80/20).
- Trang nào engagement rate cao + conversion → invest thêm.
- Trang nào high traffic + low conversion → optimize CTA.

### Bước 4. Geo + Device + Demographic
- Country: traffic top 5 country?
- Device: mobile vs desktop ratio?
- Mobile conversion rate vs desktop — gap?
- Browser issue: 1 browser bị bug → conversion rớt.

### Bước 5. Engagement deep dive
- Engagement rate theo cluster / template / author.
- Avg engagement time.
- Scroll depth (qua custom event).
- Internal navigation pattern (Path Exploration).

### Bước 6. Conversion path
- Path Exploration: bắt đầu từ landing page → forward step.
- Funnel exploration: TOFU → MOFU → BOFU theo event sequence.
- Drop-off lớn ở đâu?

### Bước 7. Attribution
- GA4 Attribution → Compare default models:
  - Last-click
  - Data-driven (default GA4 mới)
  - Position-based
- Khác biệt lớn → channel nào bị under-credit?
- Assisted conversion: SEO hỗ trợ conversion paid?

### Bước 8. Cohort retention
GA4 Explore → Cohort exploration:
- User acquired 1 tháng trước có quay lại tuần 4 không?
- Retention curve theo channel.
- SEO traffic retention thường > paid (intent stronger).

### Bước 9. Diagnose drop / spike
**Drop**:
- Channel nào drop?
- Date range chính xác (ngày bắt đầu).
- Đổi gì trong thời gian đó? (deploy, content change, GSC report, Google update).
- Pages report GSC: top loser.
- Cross-validate Ahrefs / Semrush organic traffic estimate.

**Spike**:
- Source nào spike?
- Trang nào nhận?
- Spike từ Reddit / Twitter / Newsletter / Podcast?
- Có conversion không hay vanity?

### Bước 10. Stakeholder report
1-page summary:
- North Star metric (Organic conversion).
- Top 3 win.
- Top 3 risk / drop.
- Action items + owner + ETA.
- Trend chart 90 ngày.

Avoid drowning stakeholder trong số.

## 5. Template Monthly Report

```
## SEO Monthly Report — {Month}

### Headline
- Organic Sessions: X (Δ vs prev)
- Organic Conversions: Y (Δ)
- Organic Conversion Rate: Z%
- Avg position trong tracked set: P (Δ)

### Highlights
- Win 1: ...
- Win 2: ...
- Win 3: ...

### Risks / Drops
- Risk 1: ...
- Cause + action: ...

### Channel mix
[chart]

### Top 10 landing page contribution
[table]

### Cluster performance
[table]

### CWV
[summary]

### Next month focus
- Priority 1
- Priority 2
- Priority 3
```

## 6. KPI đo lường
- Organic sessions / conversions / revenue.
- Channel mix ratio.
- Engagement rate per channel / cluster.
- Top-page Pareto (top 20% page contribute %).
- Mobile vs Desktop conversion gap.
- Assisted conversion ratio.
- Cohort retention 30/60/90 day.
- AI Search referral % (chatgpt, perplexity).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GA4 + Looker Studio | Free | Reporting chính |
| BigQuery export | Free tier | Deep analysis |
| GSC integrate Looker | Free | Cross-source |
| Hotjar / Microsoft Clarity | Freemium | Behavior |
| Mixpanel / PostHog / Amplitude | Freemium | Product analytics deeper |
| Segment / Snowplow | Paid | Centralized tracking |
| Plausible / Fathom | Paid | Privacy-friendly cookie-less |
| SimilarWeb | Freemium | Estimate competitor traffic |
| Ahrefs / Semrush organic estimate | Paid | Diagnose drop với competitor |

## 8. Common mistakes
- Vanity metric (sessions tăng) mà không nhìn engagement / conversion.
- Không UTM tag campaign → mất data trong direct.
- So sánh tháng vs tháng không tính seasonality.
- Bỏ qua mobile conversion gap.
- Trông cậy 1 metric duy nhất.
- Stakeholder report đầy số, không có insight.
- Không diagnose spike → tin rằng SEO đang work, thực ra là viral 1 lần.
- Bỏ qua cohort retention.
- Không track AI search referral → blind spot mới.
- Channel mix lệch (90% direct) mà không investigate (tracking lỗi).
- Last-click bias → SEO không được credit đúng cho assisted role.
- Bỏ qua segment: trung bình tổng giấu insight nhánh.
- Không document changes quan trọng (deploy, content launch) → khó causal analysis.

---
**Đầu ra**: dashboard live + monthly stakeholder report + diagnose runbook cho drop/spike.
