---
name: internal-linking
version: 1.0.0
description: "Use this skill when the user asks about internal linking strategy: 'internal link', 'liên kết nội bộ', 'anchor text strategy', 'link equity flow'. Covers anchor text patterns, link distribution, pillar-spoke flow, automation rules."
category: on-page
---

# Internal Linking — Liên kết nội bộ

## 1. Purpose / Mục đích
Internal linking là **đòn bẩy SEO bị đánh giá thấp nhất** so với mức độ quan trọng. Internal link làm 3 việc cùng lúc: (1) **truyền PageRank/authority** giữa các trang, (2) **xây topical authority** bằng cách kết nối cluster, (3) **giúp Google crawl + hiểu context** qua anchor text. Một site có internal link tốt thường rank vượt trội so với chiến lược chỉ tập trung backlink ngoài.

## 2. Core Concepts / Khái niệm cốt lõi

- **PageRank flow**: link equity chảy theo link. Trang nhiều backlink → link nội bộ ra → đẩy authority cho trang khác.
- **Anchor text**: từ ngữ click được. Khác với external link (tránh keyword-rich), internal anchor **nên** descriptive, có keyword tự nhiên (vẫn đa dạng).
- **Hub-and-spoke**: pillar = hub, supporting page = spoke; spoke link về hub, hub link xuống spoke.
- **Click depth**: số click từ home tới 1 URL. Trang quan trọng nên ≤ 3 click depth.
- **Orphan page**: trang không có internal link trỏ về → Google khó crawl, gần như "vô hình".
- **Contextual link** (trong body content) > **navigational link** (footer/sidebar) về giá trị SEO.
- **First link rule** (vẫn còn ảnh hưởng): nếu 2 link cùng URL trên 1 trang, Google tính anchor của link đầu tiên.
- **Reciprocal internal**: giữa các trang trong cluster — không cấm, là pattern bình thường.

## 3. When to use
- Mỗi khi publish bài mới (link IN từ bài cũ liên quan, link OUT tới bài cũ liên quan).
- Khi build pillar/topic cluster.
- Khi audit money page (boost authority).
- Khi GSC báo "Discovered – currently not indexed" (thường do thiếu internal link).

## 4. Workflow internal linking

### Bước 1. Mapping content
- **Nếu dự án có `projects/{project}/keywords-urls.md`**: Đọc file này TRƯỚC → đã có danh sách keyword + URL + cluster + role sẵn. Không cần crawl lại.
- **Nếu dự án có `projects/{project}/topical.md`**: Đọc topical map → hiểu hierarchy cluster (pillar → supporting → sub-cluster) → xác định hướng link.
- Nếu chưa có → Crawl site → export URL + topic/cluster + traffic + RD.
- Phân loại:
  - **Money page** (cần boost): top of funnel, bottom of funnel.
  - **Hub/Pillar page**.
  - **Supporting/Cluster article**.
  - **Authority page** (nhiều backlink → là "ngân hàng" link equity).

### Bước 2. Quy tắc truyền authority
- Authority page → link xuống money page với anchor liên quan.
- Supporting → link về Pillar (anchor = pillar keyword hoặc biến thể).
- Pillar → link xuống supporting (anchor descriptive).
- Bài mới → ít nhất 3 link IN từ bài cũ liên quan trong vòng 7 ngày sau publish.
- Bài mới → ít nhất 3 link OUT tới bài cũ liên quan + 1 link tới pillar.

### Bước 3. Anchor text strategy
- Mix các loại:
  - Exact match keyword (≤ 25%): `keyword research`
  - Partial / phrase match (40%): `cách làm keyword research cho ngách F&B`
  - Branded / generic (15%): `our guide`
  - Long-tail descriptive (20%): `nghiên cứu từ khoá theo SERP-based clustering`
- Tránh anchor toàn keyword giống hệt nhau (over-optimization).
- Đảm bảo anchor có ngữ cảnh xung quanh (5–10 từ trước/sau) cùng chủ đề.

### Bước 4. Click depth audit
- Crawl với Screaming Frog → cột "Crawl Depth".
- Mục tiêu: money page & pillar ≤ 3, supporting ≤ 4.
- Trang quan trọng > 4 → tìm cách thêm link từ trang cấp cao hơn (home, category, top blog post).

### Bước 5. Orphan page audit
- Screaming Frog: List Mode → import sitemap → so sánh với "Inlinks" report.
- Trang có 0 inlink → orphan.
- Fix: thêm 2–5 internal link từ trang cùng cluster.

### Bước 6. Boost striking distance keywords
- GSC → keyword position 5–20.
- Với mỗi URL: tìm 3–5 trang khác trên site có nhắc tới keyword đó nhưng chưa link → thêm link với anchor liên quan.
- Theo dõi 14–30 ngày: thường thấy uplift 3–8 vị trí.

### Bước 7. Programmatic internal linking (cho site lớn)
- Build module "Related articles" theo cluster (không random).
- Auto-link keyword → URL theo dictionary (ví dụ ngôn ngữ "keyword research" luôn link về `/blog/keyword-research`).
- Cẩn thận: limit 1 link/anchor/trang, tránh tạo spam pattern.
- **⚠️ QUY TẮC BẮT BUỘC: Mỗi URL nội bộ chỉ xuất hiện DUY NHẤT 1 LẦN trong 1 bài viết.** Lặp cùng URL ≥ 2 lần (dù khác anchor text) → Google có thể đánh giá spam pattern. Chọn vị trí tự nhiên nhất, anchor tốt nhất.

## 5. Template Sheet — Internal Link Plan

| Source URL | Target URL | Anchor text | Position in content (intro/body/conclusion) | Reason | Status |

Quy tắc tối thiểu cho mỗi target:
- ≥ 5 internal link IN từ trang cùng cluster (cho money page).
- ≥ 1 link từ pillar / hub page.
- Mix anchor như section 4.3.

## 6. KPI đo lường
- Avg internal links / trang (mục tiêu 5–10 contextual link).
- # orphan page (mục tiêu 0).
- Avg click depth của money page (mục tiêu ≤ 3).
- Inlink count cho top 50 money page.
- Δ position của striking distance keyword sau internal link boost.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Screaming Frog | Free/Paid | Crawl, inlinks report, orphan |
| Sitebulb | Paid | Visualize hub/spoke |
| Ahrefs (Internal Backlinks, Best by links) | Paid | Tìm authority page, link opportunity |
| Link Whisper (WordPress) | Paid | Auto suggest internal link |
| InLinks | Paid | Entity-based internal linking |
| Yoast Internal Linking | Paid | Suggestion in editor |
| ChatGPT/Claude | Freemium | Suggest anchor variation |
| Custom Python script | Free | Mining "mention without link" với regex |

### Prompt LLM cho anchor variation
```
Tạo 10 phương án anchor text cho internal link tới URL "{target}" target keyword "{kw}". Yêu cầu:
- 2 exact match.
- 4 phrase/partial match.
- 2 long-tail descriptive.
- 2 generic/branded.
Trả về dạng bảng: anchor | loại | use case (intro/body/CTA).
```

## 8. Common mistakes
- Bỏ qua internal linking, chỉ tập trung backlink ngoài.
- Link từ menu/footer cùng anchor lặp đi lặp lại → over-opt + giảm contextual value.
- Anchor toàn "click here", "đọc thêm" → mất tín hiệu ngữ nghĩa.
- Để bài mới mồ côi (no inlink) trong tháng đầu — period quan trọng nhất để Google đánh giá.
- Link ra ngoài quá nhiều (≥ 30) trên 1 trang → loãng equity.
- Không có map cluster → link random, không xây topical authority.
- Sửa URL mà không sửa internal link → link 301 chain.
- Sidebar "popular posts" cố định → mọi bài đều có cùng inlink, không phản ánh topical.
- Bỏ qua "first link rule" → 2 link cùng URL khác anchor: anchor 2 bị bỏ.
- Cùng URL lặp 2-3 lần trong 1 bài (ở intro, body, conclusion) → spam pattern risk.

---
**Đầu ra**: Internal Link Plan có pattern hub-spoke rõ ràng, audit định kỳ, và bộ rule programmatic linking cho site scale.
