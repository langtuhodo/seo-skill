---
name: indexing
version: 1.0.0
description: "Use this skill when the user asks about indexing: 'index coverage', 'GSC excluded', 'không được index', 'noindex tag', 'index API'. Covers index status diagnosis, noindex strategy, IndexNow / Google Indexing API, content quality threshold."
category: technical
---

# Indexing — Lập chỉ mục

> **Output path 2026 (folder-scoped)**: Index audit report → `projects/{project}/technical/index-audit-{yyyy-mm-dd}.md`. Index policy / noindex list → `projects/{project}/technical/index-policy.md`. Tạo folder `technical/` nếu chưa có. Chi tiết: `AGENTS.md` Section "GENERATE OUTPUT".

## 1. Purpose / Mục đích
Sau khi crawl, Google quyết định **có index URL hay không**. Index = URL có trong cơ sở dữ liệu Google = đủ điều kiện rank. Không index = không tồn tại với search. Skill này đảm bảo URL đáng index thì index, URL không đáng thì không index — và xử lý nhanh khi GSC báo "không indexed".

## 2. Core Concepts / Khái niệm cốt lõi

- **Index status**: Indexed / Not indexed / Crawled-not-indexed / Discovered-not-indexed / Excluded.
- **Meta robots**: `index, follow` (default), `noindex`, `nofollow`, `noarchive`, `nosnippet`, `max-snippet`, `max-image-preview`, `max-video-preview`.
- **X-Robots-Tag** (HTTP header): tương đương meta robots nhưng dùng cho non-HTML (PDF, image).
- **Canonical**: chỉ ra URL "chính" trong nhóm URL trùng/gần trùng (xem skill Canonical Tags).
- **Quality threshold**: Google chỉ index content "đủ chất lượng". Thin/duplicate/AI-spun → bị giữ ngoài index.
- **Index bloat**: index nhiều URL rác → giảm chất lượng tổng site.
- **URL Inspection**: tool GSC để xem trạng thái index 1 URL + request indexing.
- **IndexNow**: protocol đẩy URL mới tới Bing, Yandex (Google không hỗ trợ chính thức).

## 3. When to use
- Khi launch trang/bài mới — verify đã index.
- Khi GSC báo "Pages not indexed" tăng.
- Sau Google update.
- Khi pruning content cũ.
- Khi migrate / thay đổi sitemap.
- Khi muốn block index (staging, login, admin).

## 4. Workflow indexing

### Bước 1. Quyết định index policy cho từng loại trang
- **Index**: home, blog post, product, category, pillar, landing page, comparison.
- **Noindex**: search results, login, cart, checkout, thank-you page, tag/archive nếu trùng category, staging, internal admin.
- **Noindex, follow**: trang cần truyền PageRank nhưng không cần index (filter combo, pagination quá sâu).
- Ghi rõ policy trong technical doc.

### Bước 2. Implement noindex
HTML head:
```html
<meta name="robots" content="noindex, follow">
```

HTTP header:
```
X-Robots-Tag: noindex, follow
```

Lưu ý:
- Noindex chỉ có hiệu lực khi Google **crawl được** trang đó. Nếu robots.txt block thì Google không thấy noindex → URL vẫn có thể bị index từ link ngoài.
- Đừng dùng cả robots.txt Disallow + noindex meta cùng lúc.

### Bước 3. Submit URL cho Google
- GSC URL Inspection → Request Indexing (giới hạn ~10/ngày).
- Submit sitemap (xem skill XML Sitemaps).
- IndexNow cho Bing.
- Đẩy URL qua **Indexing API** (Google chỉ chính thức cho JobPosting và BroadcastEvent — nhưng nhiều site dùng cho cả site và effective trong nhiều case).
- External signal: post link trên Twitter, LinkedIn, internal link từ trang authority.

### Bước 4. Diagnose "Not indexed" trong GSC

| Tình trạng | Nguyên nhân chính | Cách xử lý |
|---|---|---|
| Discovered – currently not indexed | Google biết nhưng chưa crawl | Thêm internal link từ trang authority, đảm bảo trong sitemap, request index |
| Crawled – currently not indexed | Google crawl nhưng quyết định không index | Cải thiện content quality, depth, EEAT, originality; kiểm tra duplicate |
| Page with redirect | URL đang 301/302 | Kiểm tra ý đồ; nếu cố ý thì OK |
| Duplicate, Google chose different canonical | Google chọn canonical khác bạn khai | Review canonical, internal link, nội dung trùng |
| Duplicate without user-selected canonical | Bạn chưa khai canonical | Set self-canonical |
| Excluded by 'noindex' tag | Có meta noindex | Verify cố ý |
| Blocked by robots.txt | robots Disallow | Verify cố ý |
| Soft 404 | Trang nghèo nội dung, trả 200 | Cải thiện hoặc trả 404/410 |
| Not found (404) | Đã chết | OK nếu cố ý; nếu không thì 301 về URL liên quan |
| Server error (5xx) | Server lỗi | Fix hosting |

### Bước 5. Cải thiện quality để được index
- Content unique ≥ 60–70% so với top 10.
- ≥ 600 từ cho informational (rule of thumb, không cứng).
- Có ảnh original, schema, internal link.
- Tác giả + bio.
- Trang được link IN từ ≥ 1 trang authority trên site.

### Bước 6. Index bloat cleanup
- Audit GSC + Screaming Frog → phát hiện URL rác đang index:
  - Tag/category trùng nội dung.
  - Search results.
  - Faceted nav vô tận.
  - URL parameter.
- Plan:
  - Noindex (giữ link equity, vẫn crawl).
  - 301 về URL chính (nếu trùng).
  - 404/410 (nếu không còn giá trị).
- Theo dõi indexed count giảm → quality signal toàn site cải thiện.

### Bước 7. Cho ecommerce + site lớn
- Out-of-stock products: noindex + 301 hoặc giữ index có "back in stock soon" message.
- Discontinued: 410 hoặc 301 về parent category.
- Faceted nav: chỉ index combos có demand keyword.
- Internal search results: noindex toàn bộ.

## 5. Template — Index Policy Matrix

| Loại trang | Index? | Canonical | Notes |
|---|---|---|---|
| Home | Yes | self | |
| Blog post | Yes | self | |
| Category | Yes | self | Pagination self |
| Product | Yes (in stock) | self | OOS xem rule riêng |
| Tag | Conditional | self if unique value | |
| Search result | No | — | noindex, follow |
| Cart/Checkout | No | — | noindex, nofollow |
| Thank-you | No | — | noindex |
| Author archive | Yes/No | self | Depends |
| PDF | Yes (X-Robots-Tag index) | URL canonical header | |

## 6. KPI đo lường
- Indexed URL count vs total URL trong sitemap (mục tiêu ≥ 90%).
- # "Crawled - not indexed" giảm dần.
- Time to index trung bình của trang mới (mục tiêu ≤ 3 ngày).
- Index bloat ratio: indexed / valuable URL (mục tiêu ≈ 1.0).
- # URL rác bị Google index (target = 0).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC Pages report + URL Inspection | Free | Source of truth |
| Bing Webmaster Tools + IndexNow | Free | Bing/Yandex |
| Indexing API (Google) | Free (limit) | Đẩy index nhanh |
| Screaming Frog | Free/Paid | Crawl + flag noindex/canonical |
| Sitebulb | Paid | Visual indexability issue |
| Ahrefs Site Audit | Paid | Indexability flag |
| Rank Math / Yoast | Free | Per-page noindex toggle |
| Index Coverage API + Looker Studio | Free | Dashboard track indexed/excluded |

## 8. Common mistakes
- Để noindex sót lại từ staging khi go-live → toàn site biến mất.
- Robots.txt block + noindex meta cùng lúc → Google không thấy noindex → URL vẫn index từ external link.
- Pagination set noindex toàn bộ → mất internal link discovery.
- Chạy migrate, không verify URL cũ 301 → tụt 80% traffic.
- "Request Indexing" hàng nghìn URL rác — vô dụng + có thể bị soft penalty.
- Không phân biệt "Crawled not indexed" (quality) vs "Discovered not indexed" (discoverability) → fix sai.
- Để OOS product không có chiến lược → mất revenue page.
- Không monitor index count theo ngày → bloat tích luỹ.

---
**Đầu ra**: Index Policy Matrix + GSC weekly review + cleanup runbook cho index bloat.
