# Canonical Tags — Thẻ canonical

## 1. Purpose / Mục đích
Canonical tag (`<link rel="canonical" href="..."/>`) cho Google biết **URL chính** (master) khi có nhiều URL hiển thị cùng/gần cùng nội dung. Implement đúng giúp consolidate ranking signal, tránh duplicate, tránh bị Google chọn nhầm canonical. Implement sai có thể làm trang biến mất khỏi index.

## 2. Core Concepts / Khái niệm cốt lõi

- **Self-referencing canonical**: trang trỏ canonical về chính nó. Là default best practice.
- **Cross-domain canonical**: trỏ canonical sang URL ở domain khác (syndication). Hợp lệ nhưng cần cẩn thận.
- **Canonical là HINT, không phải directive**: Google có thể chọn canonical khác bạn khai (do internal link, sitemap, hreflang, redirect). Theo dõi qua GSC URL Inspection: "User-declared canonical" vs "Google-selected canonical".
- **HTTP header canonical**: `Link: <https://...>; rel="canonical"` — dùng cho non-HTML (PDF, image).
- **Canonical chuỗi**: A → B → C → tệ. Phải trỏ trực tiếp về master.
- **Canonical về URL noindex / 404 / redirect**: tệ. Phải về URL 200, indexable.
- **Pagination**: self-canonical (sau khi rel=prev/next deprecated).
- **HTTPS / WWW**: chọn 1 phiên bản → canonical về phiên bản đó + 301 từ phiên bản còn lại.

## 3. When to use
- Mọi trang HTML → self-canonical (default).
- Khi có duplicate do tham số (UTM, filter, sort).
- Khi có version desktop + mobile riêng (m.example.com → canonical về desktop).
- Syndication (đăng lại bài trên Medium, LinkedIn) → canonical về bản gốc.
- Print version → canonical về bản chính.
- Variants product (color/size có URL riêng) → canonical về parent product (hoặc tự self nếu mỗi variant đáng index).

## 4. Workflow implement

### Bước 1. Default rule cho toàn site
- Mỗi trang HTML render 1 thẻ `<link rel="canonical" href="https://canonical-url"/>` trong `<head>`.
- URL canonical:
  - Absolute URL (có protocol + domain).
  - Đúng case (lowercase hay không tuỳ policy site, nhưng phải nhất quán).
  - Đúng trailing slash policy.
  - HTTPS, không có UTM, fragment, session ID.
  - Encoded đúng (UTF-8).

### Bước 2. Decision tree cho từng trường hợp

**A. Tracking parameter (?utm_source=...)**:
- Canonical về URL clean.
- Server-side rewrite hoặc canonical fix.

**B. Sort/filter parameter (?sort=price&color=red)**:
- Nếu combo có demand keyword → render URL đẹp riêng + self-canonical.
- Nếu không → canonical về parent + có thể noindex để tránh bloat.

**C. Pagination (/page/2/, ?page=2)**:
- Self-canonical từng page.
- Mỗi page phải unique enough (different listing).
- Đừng canonical page 2 → page 1 (mất link discovery cho deep page).

**D. HTTP/HTTPS, WWW/non-WWW**:
- Chọn 1 phiên bản. 301 phần còn lại. Canonical về phiên bản chính.

**E. Syndication**:
- Bài gốc trên site mình + đăng lại Medium → bản Medium dùng canonical về bài gốc.
- Cảnh báo: đối tác đăng lại không tôn trọng canonical → có thể outrank bạn. Cân nhắc embed vs full repost.

**F. Mobile separate URL** (m.example.com):
- Mobile → canonical về desktop.
- Desktop → alternate sang mobile (`<link rel="alternate" media="..." href="...">`).
- (Nên migrate sang responsive thay vì giữ m. version.)

**G. Variant product** (`/product?color=red`, `/product?color=blue`):
- Nếu mỗi variant không có demand riêng → canonical tất cả về `/product`.
- Nếu mỗi color có search demand riêng → tách URL `/product/red`, self-canonical.

**H. AMP**:
- AMP page → canonical về non-AMP.
- Non-AMP → `<link rel="amphtml">` sang AMP.

**I. Multi-language (hreflang)**:
- Mỗi version language self-canonical (KHÔNG canonical về 1 ngôn ngữ chính).
- Hreflang tag bổ sung cho mọi version (xem skill International SEO/Hreflang).

### Bước 3. Audit canonical issue trong GSC
GSC Pages report:
- "Duplicate, Google chose different canonical" — Google không tin canonical bạn khai. Lý do thường: internal link mạnh trỏ về URL khác, sitemap khác, content gần như identical.
  - Fix: align internal link, sitemap, hreflang đều trỏ về canonical mong muốn.
- "Duplicate without user-selected canonical" — bạn không khai → set self-canonical.
- "Alternate page with proper canonical tag" — OK, trang bị canonical sang URL chính.

### Bước 4. Verify hàng loạt
- Screaming Frog → "Canonicals" report:
  - URL với canonical points to URL khác (cố ý hay nhầm?).
  - URL với canonical points to 4xx/5xx/3xx → fix.
  - Canonical chain.
  - Multiple canonical trên 1 trang (vi phạm spec).
  - Canonical sai protocol.
- Cross-check với GSC URL Inspection sample.

### Bước 5. Edge case dùng canonical
- **HTTP header canonical** cho PDF:
```
Link: <https://example.com/whitepaper.pdf>; rel="canonical"
```
- **Cross-domain canonical** khi syndicate: dùng explicit URL absolute.
- **Đừng** dùng canonical để de-index — đó là nhiệm vụ của noindex.
- **Đừng** dùng canonical để fix thin content — fix content trước.

## 5. Template Audit Checklist

- [ ] Mọi trang có ≤ 1 canonical tag
- [ ] Canonical là absolute URL HTTPS
- [ ] Canonical trỏ về URL 200
- [ ] Canonical đúng trailing slash policy
- [ ] Self-canonical cho pagination, hreflang version, variant đáng index
- [ ] Tracking param URL canonical về clean URL
- [ ] Filter URL có policy rõ
- [ ] GSC "Duplicate, Google chose different canonical" = 0 cho money page
- [ ] HTTP header canonical cho PDF quan trọng
- [ ] Sitemap chỉ chứa URL canonical

## 6. KPI đo lường
- # canonical issue trong GSC theo loại.
- # URL với canonical points to non-200.
- # canonical chain.
- % URL có self-canonical / total HTML.
- % URL được Google chọn cùng canonical mình khai (mục tiêu ≥ 95%).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC URL Inspection + Pages report | Free | Diagnostic chính |
| Screaming Frog Canonicals report | Free/Paid | Audit toàn site |
| Sitebulb | Paid | Visualization canonical issue |
| Ahrefs Site Audit | Paid | Canonical issue prioritized |
| RankMath / Yoast | Free | Per-page canonical override |
| HTTP header inspector (curl, browser DevTools Network) | Free | Verify Link header |
| ChatGPT/Claude | Freemium | Generate canonical rule logic cho dev |

## 8. Common mistakes
- Canonical về URL noindex → URL bị "orphan" trong index intent.
- Canonical về URL 301 hoặc 404 → tín hiệu nhiễu, Google ignore.
- Canonical chain (A→B→C).
- Multiple canonical trên 1 page (do plugin + theme đè nhau).
- Canonical về HTTP trong khi site đã HTTPS.
- Cross-domain canonical sai chiều (canonical về Medium thay vì site mình).
- Pagination canonical về page 1 → mất index cho item ở page sâu.
- Tất cả variant canonical về parent dù mỗi variant có demand → mất traffic per variant.
- Canonical về URL có UTM/session ID.
- Đặt canonical trong `<body>` (vô hiệu, phải `<head>`).
- Sitemap chứa URL non-canonical → mâu thuẫn.

---
**Đầu ra**: policy canonical theo từng template + GSC clean + Screaming Frog regression test mỗi deploy.
