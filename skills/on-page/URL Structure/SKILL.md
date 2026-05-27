# URL Structure — Cấu trúc URL

## 1. Purpose / Mục đích
URL là "địa chỉ vĩnh viễn" của 1 trang. URL tốt vừa giúp Google hiểu nội dung & hierarchy, vừa tăng CTR (URL hiển thị trên SERP), vừa tránh nợ kỹ thuật khi migrate. URL xấu là sai lầm khó sửa — vì sửa = redirect = mất link equity.

## 2. Core Concepts / Khái niệm cốt lõi

- **Slug**: phần cuối URL, mô tả nội dung (`/blog/keyword-research`).
- **Path / Folder**: nhóm URL theo cấu trúc thư mục (`/blog/`, `/products/`, `/help/`).
- **Subdomain vs Subfolder**: `blog.example.com` vs `example.com/blog/`. Subfolder thường mạnh hơn cho SEO vì kế thừa authority chính domain.
- **Trailing slash**: `/url/` vs `/url`. Chọn 1 và 301 từ phiên bản còn lại để tránh duplicate.
- **HTTPS, lowercase, hyphen**: là chuẩn hiện đại. Underscore `_` không được Google coi là word separator.
- **Parameter URLs** (`?utm_source=...`, `?id=123`): dễ tạo duplicate — quản lý bằng canonical, robots, parameter handling trong GSC.
- **URL không phải ranking factor mạnh**, nhưng URL clean ảnh hưởng CTR + crawlability + UX share link.

## 3. When to use
- Mỗi khi tạo trang/sản phẩm/blog mới.
- Khi audit IA (Information Architecture) cho site lớn.
- Khi migrate domain / replatform / đổi CMS.
- Khi gặp duplicate content do parameter.

## 4. Workflow thiết kế URL

### Bước 1. Định nghĩa Information Architecture (IA)
- 3 cấp folder là tối đa cho hầu hết site (trừ ecommerce có category sâu).
- Mỗi folder = 1 cluster / nhóm content.
- Đảm bảo ai đọc URL cũng hiểu trang là gì.
- Ví dụ: `example.com/blog/seo/keyword-research`.

### Bước 2. Quy tắc viết slug
- Tất cả lowercase.
- Dấu cách → hyphen `-`. KHÔNG underscore.
- Bỏ stop word khi không cần (`the`, `a`, `of`).
- 3–6 từ là tối ưu. ≤ 60 ký tự.
- Loại bỏ dấu tiếng Việt (`bí-quyết-seo` → `bi-quyet-seo`) hoặc dùng plain English nếu là site quốc tế. Nếu user VN ưa tiếng Việt có dấu, vẫn ok nhưng cần đảm bảo encode UTF-8 sạch.
- Khớp keyword chính dạng tự nhiên (không nhồi).
- Tránh ngày tháng / năm trong slug nếu định refresh dài hạn (ngược lại với evergreen — không cần năm).

### Bước 3. Hierarchy hợp lý
- Topic chính → folder cấp 1 (`/seo/`).
- Sub-topic → folder cấp 2 (`/seo/keyword-research/`).
- Specific page → slug cấp 3 (`/seo/keyword-research/long-tail/`).
- Tránh folder quá sâu (≥ 5 cấp) — rối + giảm crawl priority.

### Bước 4. Quản lý parameter
- Tracking param (utm_*) → canonical về URL clean.
- Filter param (?color=red) → quyết định:
  - Nếu là search filter → noindex + canonical về parent.
  - Nếu mỗi filter combo có demand → render thành URL tĩnh đẹp `/products/red-tshirts/` và canonical đúng.
- Pagination (`?page=2`) → self-canonical hoặc rel=prev/next (Google không còn dùng nhưng vẫn để cho UX).

### Bước 5. Trailing slash policy
- Chọn 1: với hoặc không trailing slash.
- 301 từ phiên bản còn lại.
- Đồng bộ trong sitemap, internal link, canonical.

### Bước 6. Khi cần đổi URL — quy trình an toàn
1. Backup current URL.
2. Crawl + export internal link vào URL cần đổi.
3. Đổi slug + 301 từ URL cũ → URL mới.
4. Update internal link trỏ thẳng vào URL mới (giảm chuỗi redirect).
5. Update sitemap, ping, GSC submit URL mới.
6. Theo dõi 30–60 ngày: traffic, position, crawl error.
7. Giữ 301 vĩnh viễn — đừng bao giờ remove.

## 5. Template Naming Convention (ví dụ ecommerce VN)

| Loại trang | Pattern URL | Ví dụ |
|---|---|---|
| Home | `/` | `example.com/` |
| Category | `/c/{category}/` | `/c/giay-the-thao/` |
| Sub-category | `/c/{cat}/{subcat}/` | `/c/giay-the-thao/giay-chay-bo/` |
| Product | `/p/{product-slug}` | `/p/nike-pegasus-41` |
| Brand | `/brand/{brand}` | `/brand/nike` |
| Blog | `/blog/{slug}` | `/blog/cach-chon-giay-chay-bo` |
| Pillar | `/guide/{topic}` | `/guide/giay-chay-bo` |
| Tool | `/tools/{slug}` | `/tools/calo-chay-bo` |
| Static | `/{slug}` | `/about`, `/lien-he` |

Tiêu chí check trước khi publish:
- [ ] Lowercase
- [ ] Hyphen separator
- [ ] ≤ 60 ký tự
- [ ] Khớp keyword chính tự nhiên
- [ ] Không thừa stop word
- [ ] Folder hierarchy đúng
- [ ] Trailing slash theo policy
- [ ] HTTPS
- [ ] Không session ID / param thừa

## 6. KPI đo lường
- # URL không tuân naming convention (target = 0 cho trang mới).
- # trang có duplicate do param.
- # chuỗi redirect ≥ 2 hop.
- # 404 từ broken internal link.
- Avg crawl depth (folder depth + click depth).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Screaming Frog | Free/Paid | Crawl + audit URL pattern, redirect chain |
| Sitebulb | Paid | Visual IA, depth |
| Ahrefs / Semrush Site Audit | Paid | Duplicate, redirect, parameter |
| GSC URL Inspection | Free | Verify canonical, indexed URL |
| Google Analytics 4 | Free | Verify tracking sau khi đổi URL |
| Regex101 | Free | Test regex redirect rules |

## 8. Common mistakes
- Đổi URL không 301 → mất rank.
- Slug nhồi keyword `/seo-cach-lam-seo-tot-nhat-2025/` → spam pattern.
- Dùng underscore.
- URL chứa session ID, query string không cần thiết.
- Folder quá sâu (≥ 5).
- Phân trang URL `/page/2/` không có canonical / chỉ noindex.
- Không đồng bộ trailing slash → duplicate.
- Subdomain hoá blog không cần thiết → chia rẽ authority.
- URL có ngày publish trong slug rồi sau update → URL nói dối.
- Migration không export redirect map đầy đủ → 404 hàng loạt.

---
**Đầu ra**: 1 naming convention document cho cả site + redirect map quản lý mọi thay đổi URL trong tương lai.
