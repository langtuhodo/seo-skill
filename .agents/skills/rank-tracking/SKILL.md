---
name: rank-tracking
version: 1.0.0
description: "Use this skill when the user asks about rank tracking / theo dõi thứ hạng: 'check rank', 'theo dõi keyword position', 'báo cáo rank hàng tuần', 'SERP volatility'. Covers rank tracking tools, share of voice, position distribution, ranking drop diagnosis."
category: analytics
---

# Rank Tracking — Theo dõi thứ hạng

## 1. Purpose / Mục đích
Rank tracking đo **vị trí thực tế của site cho danh sách keyword** theo thời gian, theo location + device. Khác với GSC (avg position cho mọi query có click), rank tracker theo dõi tập keyword chiến lược **đều đặn + chính xác theo điểm**, giúp phát hiện sớm thay đổi và chứng minh ROI.

## 2. Core Concepts / Khái niệm cốt lõi

- **Tracked keyword set**: danh sách keyword chiến lược mình muốn theo dõi (50–5000 keyword).
- **Position avg ≠ position thực tế tại 1 thời điểm**: rank tool đo daily, GSC đo aggregated.
- **Localized rank**: rank thay đổi theo country, city, ZIP code (đặc biệt local SEO).
- **Mobile vs Desktop**: rank có thể khác.
- **Personalization**: rank cho user logged-in khác user mới — tools dùng IP + user-agent neutral.
- **SERP features**: rank tool cần track xem có FS, PAA, AI Overview, Local Pack, Image, Video.
- **Share of Voice (SoV)**: % visibility của brand trong tập keyword.
- **Volatility**: biến động daily — quan trọng để phát hiện Google update.

## 3. When to use
- Mọi project SEO active.
- Khi cần report rank cho stakeholder.
- Khi launch campaign cho từng cluster.
- Khi phát hiện algorithm update — rank tool cho ground truth nhanh hơn GSC.

## 4. Workflow rank tracking

### Bước 1. Build tracked keyword set
Categories:
- **Money keyword** (head, transactional): top 50–100.
- **Pillar keyword**: top 20–50.
- **Striking distance** (pos 5–20 trong GSC): top 100–200.
- **Brand keyword**: tên brand + variation, founder name.
- **Competitor keyword** (track đối thủ rank để benchmark).

Không track tất cả keyword — chọn keyword có ý nghĩa kinh doanh.

### Bước 2. Setup tracking config
Per keyword:
- Country + city/ZIP (cho local).
- Device (desktop / mobile / both).
- Search engine (Google chính, có thể thêm Bing, Yandex, Naver, Baidu).
- Language.
- URL target (URL bạn muốn rank — cảnh báo cannibalization khi rank URL khác).

### Bước 3. Daily / Weekly rank pull
- Daily: cho money keyword + brand.
- Weekly: cho phần còn lại (tiết kiệm credit).
- Dữ liệu auto pull qua tool (Ahrefs, Semrush, SE Ranking, Nightwatch, AccuRanker).

### Bước 4. SERP feature tracking
Cho mỗi keyword, tool ghi nhận:
- Featured Snippet — bạn có chiếm không?
- People Also Ask — query nào trong PAA?
- AI Overview / Generative — bạn có được cite?
- Local Pack — bạn có trong 3 local nếu là local SEO?
- Image / Video / Shopping pack.
- Sitelinks.

### Bước 5. Phân tích movement
Daily trend:
- Movers (≥ 3 vị trí thay đổi).
- New top 10.
- Lost top 10.
- Volatility index (semrush sensor) → phát hiện Google update.

Weekly:
- Avg position cluster.
- SoV theo cluster.
- Distribution top 1, 2-3, 4-10, 11-20, 21-50, 51-100.

### Bước 6. Cannibalization detection
- Keyword có URL rank thay đổi nhiều lần giữa 2 URL → Google không chắc URL nào nên rank.
- Fix: consolidate, internal link rõ về URL chính, canonical.

### Bước 7. Competitor tracking
- Add 3–5 đối thủ vào cùng tracked keyword → so sánh.
- Đối thủ tăng nhanh → audit content / link.
- SoV chart theo brand — visualize "ai đang thắng".

### Bước 8. Báo cáo + ROI
Monthly:
- Top 10 win + Top 10 loss.
- SoV % change.
- Cluster performance.
- Money keyword position trend.
- Đính kèm action giải thích (đã làm gì, kết quả gì).

### Bước 9. Volatility alert
- Set notification khi avg position cluster thay đổi > X%.
- Khi Semrush Sensor / Mozcast spike → audit ngay.
- Có thể là update → wait 7–14 days, re-evaluate.

### Bước 10. Pruning + cleanup
Mỗi quý:
- Remove keyword không còn relevance (drop SV, irrelevant intent).
- Add keyword mới (từ research, từ GSC discovery).
- Re-categorize.

## 5. Template Tracker Sheet

| Keyword | Cluster | Funnel | Country | Device | Target URL | Position D-1 | Position D-7 | Position D-30 | Δ vs D-7 | SERP feature | Note |

Dashboard summary:
- Avg position by cluster.
- # top 3, top 10, top 100.
- Movers: top 5 up + top 5 down.
- SoV vs competitors.

## 6. KPI đo lường
- # keyword in top 3, top 10, top 100.
- Avg position weighted by SV.
- Share of Voice vs đối thủ.
- # SERP features captured (FS, PAA, AI Overview citation).
- Visibility index (proprietary metric của Ahrefs / Semrush).
- # cannibalization issue detected & resolved.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Ahrefs Rank Tracker | Paid | Daily, theo dõi nhiều site |
| Semrush Position Tracking | Paid | Daily + alert |
| AccuRanker | Paid | Real-time, fast |
| SE Ranking | Paid | Cost-effective alternative |
| Nightwatch | Paid | Granular geo + device |
| Wincher | Paid | Affordable cho team nhỏ |
| Mangools SERPWatcher | Paid | Beginner-friendly |
| Sistrix | Paid | Visibility index lâu đời |
| Custom solution: SerpAPI / DataForSEO + Python | Paid | Self-host scale |
| GSC API + BigQuery | Free | Aggregated rank data |
| Semrush Sensor / Mozcast | Free | Volatility |

## 8. Common mistakes
- Track quá nhiều keyword không có ý nghĩa kinh doanh.
- Quên track mobile (ngày nay traffic đa số mobile).
- Track sai location (track US khi audience VN).
- Track mà không action — chỉ là vanity metric.
- So sánh vs GSC avg position 1:1 — 2 metric khác nhau.
- Bỏ qua SERP feature track → không tối ưu được.
- Không track competitor → mất context.
- Pull rank cùng giờ mỗi ngày là OK; pull random giờ → variance.
- Báo cáo "rank #1 cho 100 keyword" mà không nói SV → vanity.
- Không phân biệt rank URL vs keyword: 1 keyword nhiều URL có thể cannibalize.
- Quên prune list → tracker đầy keyword chết.
- Volatility alert quá nhạy → spam notification, ignore khi update thật.

---
**Đầu ra**: tracked keyword set có cluster + SoV dashboard + alert volatility + monthly report ROI link rõ ràng tới activity.
