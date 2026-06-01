# External Sources — BinhNN Digital

> **Whitelist nguồn ngoài** mà AI được phép cite trong bài viết của dự án `binhnn-digital`.
>
> **Nguyên tắc tối thượng**: Nếu nguồn KHÔNG có trong file này → AI **KHÔNG TỰ THÊM**, **KHÔNG BỊA URL**. Bỏ qua hoặc xóa câu cần cite.
>
> **Lĩnh vực dự án**: Digital Marketing, SEO, Web — personal brand của BinhNN.
>
> **Schema version**: v1.0 (2026-05-27)
> **Last updated**: 2026-05-27 (initial population từ danh sách user gửi)

---

## Tier 1 — Cơ quan chính thức / Tài liệu nền tảng (ưu tiên cao nhất)

> Tài liệu chính thức từ search engine, organization tiêu chuẩn industry. **Cite cho guideline, định nghĩa kỹ thuật chuẩn, best practice từ chính platform.**

| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|-----------|--------|----------|----------|---------|
| 1 | Google Search Central | https://developers.google.com/search | Tài liệu SEO chính thức của Google: structure, rich results, Core Web Vitals, crawl/index | en | Cite cho guideline Google (vd "theo Google Search Central, structured data...") |
| 2 | Google — SEO Starter Guide | https://developers.google.com/search/docs/fundamentals/seo-starter-guide | Hướng dẫn SEO cơ bản từ Google (title, meta, URL, internal link) | en | Cite cho best practice nền tảng |
| 3 | Google — SEO Starter Guide PDF (Columbia archive) | https://www.cuit.columbia.edu/sites/default/files/content/search-engine-optimization-starter-guide.pdf | Bản PDF SEO Starter Guide | en | Cite khi cần link PDF stable |

---

## Tier 2 — Hiệp hội / Academy / Tài liệu giáo dục uy tín

> Tổ chức marketing có tài liệu education-grade, được khóa học chuyên môn công nhận. **Cite cho framework, methodology, khóa học chuẩn ngành.**

| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|-----------|--------|----------|----------|---------|
| 1 | Moz — What is SEO? | https://moz.com/learn/seo/what-is-seo | Giải thích crawling/indexing/ranking, on-page, off-page, technical SEO | en | Cite định nghĩa SEO chuẩn industry |
| 2 | Moz — Beginner's Guide to SEO | https://moz.com/beginners-guide-to-seo | Hướng dẫn SEO nền tảng | en | Cite cho người mới SEO |
| 3 | HubSpot Academy — Digital Marketing Certification | https://academy.hubspot.com/courses/digital-marketing | Khóa học miễn phí Digital Marketing (inbound, content, social, SEO, email, ads) | en | Cite cho phương pháp inbound, content marketing |
| 4 | HubSpot Academy — Content Marketing | https://academy.hubspot.com/courses/content-marketing | Khóa học content marketing | en | Cite framework content |
| 5 | HubSpot Academy — SEO | https://academy.hubspot.com/courses/seo-training | Khóa học SEO HubSpot | en | Cite framework SEO inbound |

---

## Tier 3 — Chuyên gia / Expert cá nhân

> Cá nhân có authority quốc tế, được community SEO/marketing công nhận. **Cite cho quote, methodology đặc trưng (vd Skyscraper, 80/20 rule).**

| # | Tên chuyên gia | Profile URL | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|----------------|-------------|----------|----------|---------|
| 1 | Brian Dean (Backlinko) | https://backlinko.com | SEO, content marketing, link building (founder Backlinko) | en | Cite framework Skyscraper, case study Backlinko |
| 2 | Brian Dean — Author page | https://backlinko.com/blog/authors/brian-dean | Profile chính thức của Brian Dean | en | Cite credential khi quote Brian |
| 3 | Neil Patel — Blog | https://neilpatel.com/blog/ | Digital marketing, SEO, content, paid ads, CRO | en | Cite cho strategy multi-channel, template thực thi |
| 4 | Neil Patel — Profile | https://neilpatel.com | Profile Neil Patel | en | Cite credential khi quote Neil |

---

## Quy tắc cite (AI BẮT BUỘC tuân thủ)

1. **CHỈ cite từ whitelist này**. Nguồn ngoài → AI **BỎ QUA**, **KHÔNG bịa link**. Nếu câu cần cite mà không có nguồn phù hợp → viết lại câu, hoặc xóa.
2. **Anchor text** chứa tên nguồn hoặc claim cụ thể:
   - ✅ "Theo [Google Search Central](url), Core Web Vitals...", "Framework [Skyscraper của Brian Dean](url)...", "HubSpot's inbound methodology..."
   - ❌ "Xem [tại đây](url) để hiểu thêm"
3. **Số lượng**: 2-5 external link/bài. Pillar pages có thể 5-7. Tránh spam.
4. **Ưu tiên Tier**:
   - **Tier 1** cho định nghĩa kỹ thuật SEO (Core Web Vitals, crawl/index, structured data), guideline Google.
   - **Tier 2** cho framework chuẩn (inbound, content marketing 80/20, SEO funnel).
   - **Tier 3** cho quote chuyên gia, methodology đặc trưng (Skyscraper, Pillar+Cluster của HubSpot).
5. **Bài về SEO kỹ thuật** BẮT BUỘC có ít nhất 1 Tier 1 cite (Google Search Central).
6. **Bài về Content/Marketing strategy** khuyến nghị mix Tier 2 + Tier 3 (HubSpot framework + chuyên gia cụ thể).
7. **Format**: markdown `[anchor](URL)`. HTML: `<a href="URL" rel="noopener" target="_blank">anchor</a>`.

---

## Filter rules — User tự thêm nguồn mới

1. **Domain**:
   - ✅ `developers.google.com`, `support.google.com`, `web.dev` (Google official)
   - ✅ `moz.com`, `searchengineland.com`, `searchenginejournal.com`, `ahrefs.com/blog`, `semrush.com/blog` (industry uy tín)
   - ✅ Academy/learning: `hubspot.com/academy`, `coursera.org`, `udemy.com/topic/seo`
   - ⚠️ Personal blog `.com`: chỉ accept khi chuyên gia có credential quốc tế (Brian Dean, Neil Patel, Aleyda Solis, Marie Haynes, John Mueller)
   - ❌ Blog Việt Nam tiếng Việt CHƯA verify (trừ khi user xác nhận)
2. **About page + author profile**: có credential rõ, kinh nghiệm verify được
3. **Cộng đồng công nhận**: được cite trong khóa Coursera/HubSpot Academy, có speaker tại conference (SMX, BrightonSEO, MozCon)
4. **Cập nhật mới**: ưu tiên bài/tài liệu post-2024 (SEO thay đổi nhanh)

---

## Backward compatibility

- File **không bắt buộc**. Project chưa có → skill cũ chạy bình thường (skip whitelist check).
- File trống → skill cảnh báo "binhnn-digital chưa fill whitelist".

---

## Maintenance

- AI **KHÔNG tự thêm** entry. User maintain thủ công.
- Sau phiên có cite ngoài whitelist → AI suggest user review.
- Review 3-6 tháng/lần (SEO industry update nhanh).

## Pending — chờ user bổ sung

- Search Engine Land / Search Engine Journal (chính thống nhưng cần xác nhận URL cụ thể)
- Ahrefs Blog / Semrush Blog (industry tool blogs)
- Aleyda Solis — international SEO expert
- John Mueller (Google) — Twitter, AMA threads
- Marie Haynes — E-E-A-T expert
- Vietnamese SEO experts/community (nếu user muốn cite tiếng Việt)
