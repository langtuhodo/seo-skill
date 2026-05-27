# XML Sitemaps — Sitemap XML

## 1. Purpose / Mục đích
XML sitemap là "danh sách URL bạn muốn Google biết". Là kênh phụ giúp khám phá URL (discovery) — đặc biệt với site lớn, URL sâu, hoặc trang ít internal link. Sitemap đúng còn cung cấp signal `lastmod` để Google biết khi nào cần re-crawl. Skill này đảm bảo sitemap clean, accurate, được submit đúng cách.

## 2. Core Concepts / Khái niệm cốt lõi

- **Format**: XML chuẩn, max 50.000 URL hoặc 50MB uncompressed mỗi sitemap. Vượt → chia thành multiple sitemap + 1 sitemap index.
- **Sitemap index**: file mẹ trỏ tới các sitemap con.
- **Field bắt buộc**: `<loc>`. Optional nhưng quan trọng: `<lastmod>` (ISO 8601). `<changefreq>` và `<priority>` Google đã thông báo bỏ qua nhưng vẫn để được.
- **Sitemap loại đặc biệt**:
  - **Image sitemap**: cho image-heavy site.
  - **Video sitemap**: cho video.
  - **News sitemap**: cho Google News (≤ 48h, tối đa 1000 URL).
  - **Hreflang sitemap**: alternative cách khai hreflang qua sitemap thay vì HTML head.
- **Discovery**: Google tìm sitemap qua robots.txt `Sitemap: https://...` + GSC submit.
- **Chỉ chứa URL canonical, indexable, 200**. Sitemap = "list URL mong muốn được index".

## 3. When to use
- Mọi site (kể cả nhỏ) — là baseline technical SEO.
- Site lớn (≥ 10k URL) — bắt buộc, có chia sitemap theo nhóm.
- Site đa ngôn ngữ — sitemap với hreflang annotations.
- Khi launch / migrate / thêm cluster content.

## 4. Workflow tạo & quản lý sitemap

### Bước 1. Quy hoạch sitemap
- 1 sitemap index ở `/sitemap.xml`.
- Chia theo nhóm content: `/sitemap-products.xml`, `/sitemap-blog.xml`, `/sitemap-categories.xml`, `/sitemap-pages.xml`.
- Image sitemap riêng nếu cần.
- News sitemap riêng nếu là publisher.

### Bước 2. Generate sitemap

**WordPress**: Yoast / RankMath tự generate.
**Next.js**: `next-sitemap` package hoặc custom generator.
**Custom**: script chạy theo cron, query DB → output XML.

Example sitemap entry:
```xml
<url>
  <loc>https://example.com/blog/seo/keyword-research</loc>
  <lastmod>2025-04-15T08:00:00+07:00</lastmod>
</url>
```

Sitemap index:
```xml
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap>
    <loc>https://example.com/sitemap-products.xml</loc>
    <lastmod>2025-04-25T08:00:00+07:00</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://example.com/sitemap-blog.xml</loc>
    <lastmod>2025-04-25T08:00:00+07:00</lastmod>
  </sitemap>
</sitemapindex>
```

### Bước 3. Quy tắc chứa URL
- ✅ Chỉ URL 200 OK.
- ✅ Chỉ URL canonical (self-canonical).
- ✅ Chỉ URL indexable (không noindex, không robots disallow).
- ❌ Không URL redirect (3xx).
- ❌ Không URL 4xx/5xx.
- ❌ Không URL có UTM, session ID.
- ❌ Không URL bị canonical về nơi khác.

### Bước 4. lastmod đúng
- Cập nhật `lastmod` khi content thực sự đổi (text, ảnh, schema). Không update giả.
- Format ISO 8601: `2025-04-15T08:00:00+07:00`.
- Sai pattern (toàn site lastmod cùng 1 timestamp gần đây) → Google ignore vì không trustworthy.

### Bước 5. Submit & discovery
- Khai trong robots.txt:
  ```
  Sitemap: https://example.com/sitemap.xml
  ```
- GSC → Sitemaps → Add `/sitemap.xml`.
- Bing Webmaster Tools → submit.
- IndexNow API cho Bing/Yandex (push URL mới ngay khi publish).

### Bước 6. Monitor sitemap health
GSC Sitemaps:
- Status: Success / Has errors / Couldn't fetch.
- Discovered URL vs Indexed URL — gap quá lớn = vấn đề quality/discoverability.
- Cần action khi discovered ≫ indexed:
  - Audit content quality.
  - Thêm internal link.
  - Verify URL không bị canonical/noindex sai.

### Bước 7. Image / Video sitemap

**Image**:
```xml
<url>
  <loc>https://example.com/blog/post</loc>
  <image:image>
    <image:loc>https://example.com/images/post-hero.webp</image:loc>
    <image:title>Title của ảnh</image:title>
    <image:caption>Caption</image:caption>
  </image:image>
</url>
```

**Video**:
```xml
<url>
  <loc>https://example.com/videos/abc</loc>
  <video:video>
    <video:thumbnail_loc>https://example.com/thumb.jpg</video:thumbnail_loc>
    <video:title>Title</video:title>
    <video:description>Mô tả</video:description>
    <video:content_loc>https://example.com/video.mp4</video:content_loc>
    <video:duration>360</video:duration>
  </video:video>
</url>
```

### Bước 8. News sitemap (publisher)
- Chỉ URL ≤ 48h.
- Schema NewsArticle đi kèm.
- Tách `/sitemap-news.xml`.
- Submit qua GSC + Google Publisher Center.

### Bước 9. Hreflang qua sitemap
Cách khai hreflang trong sitemap (gọn cho site đa ngôn ngữ scale):
```xml
<url>
  <loc>https://example.com/vi/seo</loc>
  <xhtml:link rel="alternate" hreflang="vi" href="https://example.com/vi/seo"/>
  <xhtml:link rel="alternate" hreflang="en" href="https://example.com/en/seo"/>
  <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/en/seo"/>
</url>
```
(Xem skill International SEO/Hreflang.)

## 5. Template Audit Checklist

- [ ] Sitemap index ở `/sitemap.xml`
- [ ] Khai báo trong robots.txt
- [ ] Submit GSC + Bing
- [ ] Mỗi sitemap ≤ 50k URL / 50MB
- [ ] Chỉ chứa URL 200, canonical, indexable
- [ ] Không tracking param
- [ ] lastmod ISO 8601 + cập nhật chính xác
- [ ] Image/Video sitemap riêng nếu cần
- [ ] News sitemap nếu là publisher
- [ ] GSC Sitemaps status = Success
- [ ] Discovered/Indexed gap được monitor
- [ ] Sitemap regenerate tự động sau publish/update
- [ ] Hreflang cho site đa ngôn ngữ

## 6. KPI đo lường
- Indexed / Submitted ratio (mục tiêu ≥ 90%).
- Time-to-index trung bình URL mới (mục tiêu ≤ 3 ngày).
- # GSC Sitemap error.
- Sitemap last fetched gần đây nhất (≤ 24h cho site update thường xuyên).
- # URL trong sitemap nhưng noindex/canonical sai (mục tiêu = 0).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC Sitemaps | Free | Submit + monitor |
| Bing Webmaster + IndexNow | Free | Bing/Yandex |
| Yoast / RankMath | Free | Auto sitemap WP |
| next-sitemap | Free | Next.js |
| Screaming Frog | Free/Paid | Crawl + audit sitemap (List mode) |
| Sitebulb | Paid | Compare sitemap vs crawl |
| sitemap.xml validator (online) | Free | Validate XML |
| Custom Python script | Free | Generate sitemap từ DB |
| Google Publisher Center | Free | News sitemap |

## 8. Common mistakes
- Sitemap chứa URL 301/302/404/noindex/canonical đi nơi khác.
- Sitemap chỉ tự generate 1 lần khi build, không cập nhật khi publish bài mới.
- lastmod toàn site cùng 1 ngày → Google ignore.
- Quá nhiều sitemap nhỏ rời rạc, không có index → khó manage.
- Không khai sitemap trong robots.txt.
- Sitemap có URL HTTP trong khi site HTTPS.
- Quên image/video sitemap với site visual-heavy.
- Submit sai sub-version (www vs non-www) → GSC report sai property.
- Discovered/Indexed gap lớn nhưng không investigate.
- Sitemap chứa URL từ subdomain khác (vi phạm cross-submit; chỉ allowed nếu cùng GSC property).
- News sitemap để URL > 48h → bị warning.

---
**Đầu ra**: sitemap auto-generated, accurate lastmod, GSC clean, discovered/indexed ratio cao.
