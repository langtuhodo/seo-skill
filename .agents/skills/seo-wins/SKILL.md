---
name: seo-wins
version: 1.0.0
description: "Use this skill when the user asks about SEO quick wins / priority actions: 'quick win SEO', 'low hanging fruit', 'ưu tiên action SEO', 'opportunities sắp xếp theo impact'. Covers ICE/RICE scoring, low-effort high-impact actions, opportunity prioritization."
category: strategy
---

# SEO Wins — Quick Wins & ưu tiên hành động

## 1. Purpose / Mục đích
"SEO Wins" là kỹ năng **xác định những hành động ROI cao, thời gian tới kết quả ngắn (≤ 90 ngày)**, để show progress sớm cho stakeholder và tạo momentum. Trong dự án SEO mới hoặc khi vào team mới, quick wins là cách tốt nhất để chứng minh giá trị trước khi các chiến dịch dài hạn (link building, topical authority) ra trái.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 ROI Quadrant
Phân loại mọi action theo 2 trục Effort × Impact:
- **High Impact + Low Effort = Quick Wins** (làm trước).
- **High Impact + High Effort = Big Bets** (làm theo quý).
- **Low Impact + Low Effort = Fillers** (làm khi rảnh).
- **Low Impact + High Effort = Avoid**.

### 2.2 Striking Distance Keywords
Keyword đang rank position 5–20: chỉ cần đẩy 3–10 bậc là vào top 3 → traffic tăng vọt nhờ CTR curve.

### 2.3 Decaying Pages
Trang từng có traffic giờ giảm → refresh thường có ROI cao nhất so với viết bài mới.

### 2.4 Low-hanging Technical Fixes
- Trang quan trọng có noindex / canonical sai.
- Internal link bị 404.
- Meta title bị cut / trùng / generic.
- Image quá nặng làm LCP > 4s.

### 2.5 Content Pruning
Trang thin/duplicate ăn crawl budget → 301 hoặc xoá để tăng quality signal toàn site.

## 3. When to use
- Tuần 1–4 khi bắt đầu dự án mới hoặc role mới.
- Khi cần thuyết phục budget (show win nhanh).
- Sau Google update gây mất traffic.
- Trước launch lớn (đảm bảo nền tảng sạch).

## 4. Workflow 7 nhóm Quick Wins

### A. Striking Distance Optimization
1. Trong GSC → Performance → Filter position 5–20, impressions ≥ 500/30d, CTR < benchmark.
2. Với mỗi query: check URL đang rank, kiểm tra:
   - Title có chứa keyword chính & modifier không?
   - H1 / intro có direct answer cho query không?
   - Có cover hết PAA không?
   - Internal link trỏ vào URL đó dùng anchor đúng?
3. Refresh + bổ sung 200–500 từ khớp intent → re-index.

ROI thường thấy: +30–80% traffic trong 30–60 ngày.

### B. CTR Optimization
1. GSC → query có position ≤ 10 nhưng CTR thấp hơn benchmark theo position (curve nội bộ).
2. Rewrite title + meta description: thêm số, năm, power word, USP, trade-off ("X without Y").
3. Test schema FAQ/HowTo/Review để chiếm SERP feature.
4. Đo CTR trước/sau 28 ngày.

### C. Internal Link Boost
1. Pick 5–10 money page chiến lược.
2. Trong Ahrefs/Screaming Frog: tìm trang có liên quan ngữ nghĩa nhưng chưa link tới money page.
3. Thêm 3–5 internal link từ trang authority cao (most-linked) → money page.
4. Anchor text khớp keyword target (đa dạng nhưng có chính).

### D. Content Refresh
1. GA4 / GSC: list trang traffic giảm ≥ 30% YoY.
2. Soi SERP hiện tại → bài top đang làm gì hơn?
3. Update intro + thêm section thiếu + cập nhật số liệu/năm + thêm visual.
4. Update lastmod, ping sitemap.

Xem chi tiết tại `Content SEO/Content Refresh`.

### E. Technical Quick Audits
- Robots.txt có chặn nhầm /blog hay /products không?
- Sitemap có miss URL quan trọng không?
- Trang quan trọng có self-canonical đúng?
- Có chuỗi redirect 3+ bước? gộp lại 1 bước.
- Core Web Vitals: ảnh > 200KB, không lazy-load, không có width/height → fix nhanh.

### F. SERP Feature Capture
1. Search keyword target → có Featured Snippet không?
2. Soi format snippet (paragraph 40–58 từ, ordered list, table).
3. Cấu trúc lại 1 đoạn trong bài đúng format đó, đặt H2 = câu hỏi nguyên văn → 30–60% chance cướp snippet trong 1–2 tháng.

### G. Branded SERP Fix
1. Search brand → top 10 có gì? Có review xấu, page lỗi không?
2. Đảm bảo: Home rank #1, các social/G2/Trustpilot rank tốt, không có 404 lọt top.
3. Schema Organization + sameAs đầy đủ social.

## 5. Template Sheet — Quick Win Backlog

| ID | Action type (A–G) | URL/Keyword | Effort (S/M/L) | Impact (1-5) | Owner | Deadline | Baseline metric | After metric | Status |

Quy tắc: chỉ chọn item có Effort ≤ M và Impact ≥ 3 cho sprint đầu.

## 6. KPI đo lường
- # quick wins shipped / tuần.
- Traffic uplift sau 30/60/90 ngày (cohort theo loại win).
- Avg position uplift cho striking distance keywords.
- CTR uplift (trang đã rewrite title).
- # SERP features captured.
- Time to first visible ROI (ngày).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Search Console | Free | Striking distance + CTR data |
| Google Analytics 4 | Free | Traffic decay, engagement |
| Ahrefs/Semrush | Paid | Link gap, content decay alerts |
| Screaming Frog | Free/Paid | Crawl, find canonical/redirect issues |
| Sitebulb | Paid | Technical audit prioritized |
| PageSpeed Insights / Lighthouse | Free | CWV quick fix |
| ChatGPT/Claude | Freemium | Rewrite title/meta hàng loạt theo prompt |
| Looker Studio | Free | Dashboard track quick wins |

## 8. Common mistakes
- Chạy quick win mà bỏ qua Strategy → wins không tích luỹ thành topical authority.
- Refresh content mà thay đổi URL → mất link equity nếu không 301.
- Rewrite title chỉ vì CTR thấp mà không xem intent — đổi sai làm rớt rank.
- Internal link nhồi quá nhiều cùng anchor → spam pattern.
- Không baseline metric trước khi action → không thể chứng minh ROI.
- Chỉ làm quick win, không đầu tư big bets → 6 tháng sau hết "low-hanging".
- Quick win nhưng quên A/B test với traffic lớn → đôi khi rewrite làm giảm CTR; cần kiểm soát.

---
**Đầu ra**: Quick Win Backlog có scoring + timeline, dùng để chứng minh ROI sớm cho stakeholder và tạo runway cho big bets.
