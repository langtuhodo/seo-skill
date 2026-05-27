# Hreflang — Tag đa ngôn ngữ / đa khu vực

## 1. Purpose / Mục đích
Hreflang nói cho Google biết "URL nào dành cho người dùng nào theo ngôn ngữ + khu vực". Implement đúng giúp đúng URL hiển thị cho đúng audience, tránh cannibalization giữa các phiên bản, và ngăn Google chọn nhầm version (ví dụ user VN nhận URL EN). Hreflang là **kỹ thuật International SEO khó nhất + dễ sai nhất** — sai 1 attribute là toàn site rối loạn.

## 2. Core Concepts / Khái niệm cốt lõi

- **Hreflang attribute**: code `{language}-{region}` theo ISO 639-1 (lang) + ISO 3166-1 alpha-2 (region).
  - `en-US`, `en-GB`, `vi-VN`, `zh-CN`, `zh-TW`, `pt-BR`, `pt-PT`.
- **Language only**: chỉ ngôn ngữ, không region (`en`, `vi`).
- **x-default**: fallback cho user không match version nào.
- **Reciprocal**: A khai B → B phải khai A. Bilateral mới valid.
- **Self-reference**: mỗi version phải tự reference chính nó trong list hreflang.
- **Canonical + hreflang**: mỗi version SELF-canonical, KHÔNG canonical về 1 version chính. Hreflang điều phối, canonical đứng độc lập.
- **3 nơi khai hreflang**: HTML `<head>`, HTTP header (cho non-HTML), XML sitemap.

## 3. When to use
- Site có ≥ 2 ngôn ngữ.
- Site có cùng ngôn ngữ nhưng nhắm khu vực khác (en-US vs en-GB).
- Site có content gần giống nhau giữa 2 region (chính sách giá khác, currency khác).
- Subdomain/subfolder/ccTLD strategy (xem skill Multi Language).

KHÔNG cần khi:
- Site đơn ngữ.
- Region target qua ccTLD + GSC International Targeting (nhưng vẫn nên hreflang nếu có ≥ 2 phiên bản).

## 4. Workflow implement

### Bước 1. Quyết định cấu trúc URL (xem skill Multi Language)
- ccTLD: `example.vn`, `example.de` (mạnh nhất signal nhưng tốn chi phí).
- Subdomain: `vi.example.com`, `de.example.com`.
- Subfolder: `example.com/vi/`, `example.com/de/` (recommend cho hầu hết case).

### Bước 2. Map tất cả version
Bảng:
| Page topic | URL en-US | URL vi-VN | URL ja-JP | x-default |
|---|---|---|---|---|

Mỗi page topic phải có URL cho mọi version mình hỗ trợ, hoặc bỏ trống nếu không dịch.

### Bước 3. Implement hreflang trong HTML head

Cho URL `example.com/blog/seo` (en-US):
```html
<link rel="alternate" hreflang="en-US" href="https://example.com/blog/seo" />
<link rel="alternate" hreflang="vi-VN" href="https://example.com/vi/blog/seo" />
<link rel="alternate" hreflang="ja-JP" href="https://example.com/ja/blog/seo" />
<link rel="alternate" hreflang="x-default" href="https://example.com/blog/seo" />
```

Mỗi URL của version vi-VN, ja-JP cũng phải khai **cùng tập hreflang** (mirror).

### Bước 4. Hreflang trong sitemap (recommended cho site lớn)

```xml
<url>
  <loc>https://example.com/blog/seo</loc>
  <xhtml:link rel="alternate" hreflang="en-US" href="https://example.com/blog/seo"/>
  <xhtml:link rel="alternate" hreflang="vi-VN" href="https://example.com/vi/blog/seo"/>
  <xhtml:link rel="alternate" hreflang="ja-JP" href="https://example.com/ja/blog/seo"/>
  <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/blog/seo"/>
</url>
```

### Bước 5. Hreflang qua HTTP header (cho non-HTML như PDF)
```
Link: <https://example.com/file.pdf>; rel="alternate"; hreflang="en-US",
      <https://example.com/vi/file.pdf>; rel="alternate"; hreflang="vi-VN"
```

### Bước 6. Edge cases

**A. en cho mọi country English**:
- `hreflang="en"` (chỉ language, không region) cho fallback.
- + en-US cho user US, en-GB cho UK, en-AU cho Aus.

**B. x-default**:
- Trang fallback khi user không match.
- Thường là trang home với language picker, hoặc bản en chung.
- BẮT BUỘC nên có x-default nếu site đa region.

**C. Trang chỉ tồn tại 1 version**:
- Không cần hreflang.
- Hoặc khai self-reference + x-default về chính nó.

**D. Trang tồn tại đa version nhưng 1 version chưa dịch xong**:
- KHÔNG khai version chưa publish.
- Chờ launch xong mới add.

### Bước 7. Validate
- **GSC International Targeting** (trong Settings cũ — đã merge vào Pages):
  - Hreflang errors.
  - Missing return tag.
- **Hreflang Tags Testing Tool** (Merkle, Sistrix).
- **Screaming Frog** Hreflang report:
  - Missing self-reference.
  - Missing return tag.
  - Invalid language code.
  - Inconsistent x-default.
- **Manual sample**: pick 10 URL ngẫu nhiên, verify HTML response chứa hreflang đúng.

### Bước 8. Monitoring
Mỗi tháng:
- GSC: hreflang error count.
- Screaming Frog scheduled crawl.
- Search "{branded query}" tại các region target → verify đúng version hiển thị.

## 5. Template Audit Checklist

- [ ] Mỗi version self-reference
- [ ] Tất cả version reciprocal
- [ ] Mỗi version có self-canonical (KHÔNG canonical về 1 version chính)
- [ ] Có x-default
- [ ] Code language-region đúng ISO
- [ ] Không trộn hreflang HTML + sitemap khác nhau
- [ ] HTTP header cho PDF/non-HTML quan trọng
- [ ] Screaming Frog hreflang report = 0 error
- [ ] GSC International Targeting clean
- [ ] Sample URL test đúng version cho user simulator

## 6. KPI đo lường
- # hreflang error trong GSC.
- # missing return tag.
- # URL với hreflang đầy đủ / total multi-version URL.
- Click-through rate per region (giảm bounce do user nhận đúng version).
- Avg position per region.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC International Targeting / Pages | Free | Source of truth |
| Screaming Frog Hreflang report | Free/Paid | Audit toàn site |
| Sitebulb | Paid | Visualization |
| Merkle Hreflang Tag Tool | Free | Validate sample |
| Sistrix Hreflang Validator | Free | Validate |
| Aleyda's Hreflang Generator | Free | Generate code nhanh |
| Custom script Python + sitemap | Free | Audit scale |
| Ads Preview & Diagnosis Tool | Free | Simulate user theo region |

## 8. Common mistakes
- Quên self-reference → invalid.
- Không reciprocal → Google ignore.
- Sai mã ISO (`en-UK` thay vì `en-GB`).
- Trộn lang only + lang-region không nhất quán.
- Khai hreflang cho URL bị 404, redirect, noindex → invalid.
- Canonical về 1 version chính trong khi hreflang điều phối → conflict (Google chọn URL canonical, ignore hreflang).
- Hreflang trên `<body>` thay vì `<head>`.
- 1 trang dùng cả HTML + sitemap với data khác nhau → conflict.
- x-default thiếu hoặc sai (trỏ về 404).
- Update URL 1 version mà quên update hreflang trên các version khác.
- Subfolder không có version language khai báo trên trang home parent.
- Sai khi region không thực sự khác (cùng en, cùng nội dung, không khác giá → không cần hreflang en-US vs en-CA).
- Implement hreflang lại nhưng đối thủ chỉ dùng ccTLD và GSC targeting → mình overengineering.

---
**Đầu ra**: hreflang map đầy đủ + audit định kỳ + GSC clean cho site đa ngôn ngữ.
