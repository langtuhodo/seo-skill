---
name: image-optimization
version: 1.0.0
description: "Use this skill when the user asks about image SEO: 'tối ưu hình ảnh', 'alt text', 'image WebP', 'image lazy load', 'image schema'. Covers alt text writing, format selection (WebP/AVIF), lazy loading, image sitemap, Google Images visibility."
category: on-page
---

# Image Optimization — Tối ưu hình ảnh

## 1. Purpose / Mục đích
Image optimization tác động 4 thứ: (1) **Page speed / Core Web Vitals (LCP, CLS)**, (2) **Image search traffic** (Google Images, Pinterest, Bing Visual), (3) **Accessibility (alt text)**, (4) **AI/LLM understanding** (alt + filename là tín hiệu cho Gemini/ChatGPT trích dẫn). Với ngách e-commerce, blog visual, tutorial — image traffic có thể chiếm 20–40% organic.

## 2. Core Concepts / Khái niệm cốt lõi

- **Format**: WebP/AVIF (modern, nhỏ hơn JPG ~30%), JPG (ảnh photo), PNG (logo, transparent), SVG (icon, illustration vector).
- **Compression**: lossless (PNG/SVG) vs lossy (JPG/WebP). Mục tiêu: ảnh body < 150KB, ảnh hero < 200KB.
- **Responsive image** (`srcset`, `sizes`): browser tự chọn ảnh theo viewport → tiết kiệm băng thông mobile.
- **Lazy loading** (`loading="lazy"`): ảnh below-the-fold load khi scroll → tăng LCP.
- **width / height attribute**: bắt buộc để tránh CLS (Cumulative Layout Shift).
- **Alt text**: mô tả ảnh, dùng cho người khiếm thị + Google. KHÔNG phải nơi nhồi keyword.
- **Filename**: `cach-chon-giay-chay-bo.webp` > `IMG_001.jpg`. Là weak signal nhưng accumulate.
- **Image structured data**: `ImageObject`, `Product image` (schema) giúp xuất hiện trong rich result.
- **CDN**: Cloudflare Images, Cloudinary, BunnyCDN — auto serve format đúng theo browser.

## 3. When to use
- Mỗi bài có ảnh.
- Khi audit Core Web Vitals (LCP > 2.5s thường do ảnh).
- Khi launch ecommerce / catalog (image SEO là kênh traffic riêng).
- Khi muốn tối ưu cho Pinterest, Google Discover, AI Overview (visual content được ưu tiên).

## 4. Workflow tối ưu ảnh

### Bước 1. Trước khi upload — chuẩn bị file
- Resize đúng kích thước hiển thị tối đa (đừng upload ảnh 4000px cho khung 800px).
- Convert sang WebP/AVIF (giữ JPG fallback nếu cần).
- Compress: Squoosh, TinyPNG, ShortPixel — target ≤ 150KB.
- Đặt filename mô tả + có keyword: `cach-viet-title-tag.webp`.

### Bước 2. HTML markup chuẩn
```html
<img
  src="/images/cach-viet-title-tag.webp"
  alt="Ví dụ tiêu đề tag tăng CTR cho blog SEO"
  width="1200"
  height="630"
  loading="lazy"
  decoding="async"
/>
```

Với responsive:
```html
<img
  srcset="/img/title-400.webp 400w,
          /img/title-800.webp 800w,
          /img/title-1200.webp 1200w"
  sizes="(max-width: 600px) 400px,
         (max-width: 1200px) 800px,
         1200px"
  src="/img/title-800.webp"
  alt="..."
  width="1200" height="630"
  loading="lazy"
/>
```

Hero image (LCP candidate): KHÔNG lazy-load, dùng `fetchpriority="high"`.

### Bước 3. Alt text đúng cách
Quy tắc:
- Mô tả nội dung ảnh từ góc nhìn user khiếm thị.
- 5–125 ký tự.
- Không bắt đầu bằng "image of…", "picture of…".
- Có keyword nếu tự nhiên, không nhồi.
- Ảnh decorative (purely visual) → `alt=""` (rỗng).

Bad: `alt="seo seo seo keyword research"`
Good: `alt="Bảng cluster keyword chia theo intent với 4 nhóm I/N/C/T"`

### Bước 4. Filename + URL ảnh
- Lower-case, hyphen, không dấu tiếng Việt.
- Dùng folder logic `/images/blog/seo/`.
- Không đổi URL ảnh sau publish (trừ khi bắt buộc) — vì image link cũng là backlink.

### Bước 5. Schema for images
- Article schema → `image` array (3 ratio: 1:1, 4:3, 16:9, ≥ 1200px).
- Product schema → `image`.
- Recipe schema → `image`.
- ImageObject standalone cho ảnh quan trọng (infographic).

### Bước 6. CDN + delivery
- Bật CDN với image optimization (Cloudflare Polish, Cloudinary, ImageKit).
- Auto convert WebP/AVIF theo Accept header.
- Cache-Control: `max-age=31536000, immutable` cho ảnh không đổi.
- Preload LCP image.

### Bước 7. Đo lường + audit
- PageSpeed Insights → LCP element.
- Lighthouse → "Properly size images", "Serve images in next-gen formats".
- Screaming Frog → Images report (oversize, missing alt, large file).
- GSC → Performance → Search type = Image (xem traffic image search).

## 5. Template Checklist mỗi ảnh

- [ ] Format WebP/AVIF (hoặc JPG nén tốt cho photo)
- [ ] Kích thước ≤ kích thước hiển thị max
- [ ] File size ≤ 150KB (≤ 200KB cho hero)
- [ ] Filename descriptive, lowercase, hyphen
- [ ] Alt text mô tả + có keyword tự nhiên
- [ ] width / height attribute
- [ ] loading="lazy" (trừ LCP image)
- [ ] decoding="async"
- [ ] srcset + sizes nếu responsive
- [ ] Schema (article/product/recipe) có ảnh ≥ 1200px
- [ ] CDN serve

## 6. KPI đo lường
- LCP < 2.5s (mobile p75).
- CLS < 0.1.
- # ảnh missing alt / total (mục tiêu 0 cho ảnh content).
- Avg page weight (KB).
- Image search impression / click trong GSC.
- Indexed image trong "site:example.com" image search.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Squoosh | Free | Compression manual |
| TinyPNG / ShortPixel | Freemium | Bulk compression |
| Cloudinary / Cloudflare Images / ImageKit | Paid | CDN + auto optimization |
| Imagify (WP plugin) | Freemium | Auto convert WebP |
| ShortPixel Adaptive Images | Paid | Responsive auto |
| Lighthouse / PageSpeed Insights | Free | Audit LCP, format |
| Screaming Frog Images report | Free/Paid | Audit alt/size toàn site |
| GSC Image search | Free | Image traffic data |
| Pinterest Tag Helper | Free | Verify Pinterest scrape |

## 8. Common mistakes
- Upload ảnh raw 4000px, để CMS resize hiển thị → file 2MB load mỗi page.
- Bỏ width/height → CLS spike.
- Lazy-load LCP image → LCP cao.
- Alt text rỗng cho ảnh content (mất accessibility + image SEO).
- Alt nhồi keyword → spam.
- Filename `IMG_2024_07_31.jpg`.
- Chỉ JPG, không WebP/AVIF.
- Không có CDN cho site có > 50 ảnh / page.
- Quên image trong sitemap (sitemap-images riêng).
- Đổi URL ảnh sau publish làm vỡ external embed/backlink.
- Không serve responsive — desktop ảnh 2MB đẩy xuống mobile 4G.

---
**Đầu ra**: workflow chuẩn cho mỗi ảnh + audit định kỳ Core Web Vitals + image search dashboard.
