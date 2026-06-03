# External Sources — BinhNN Digital

> **Whitelist nguồn ngoài** mà AI được phép cite trong bài viết của dự án `binhnn-digital`.
>
> **🛑 Nguyên tắc tối thượng v1.3** (2026-05-27):
> 1. **Domain** = whitelist (trust signal). AI chỉ cite từ domain có trong file này.
> 2. **`sample_urls` = PROOFS, KHÔNG phải URL để chèn vào bài**. AI **TUYỆT ĐỐI KHÔNG paste sample_urls verbatim**.
> 3. **Khi cần cite topic cụ thể** (vd "Skyscraper Technique", "Core Web Vitals INP threshold") → AI BẮT BUỘC **web search `site:{domain} "{topic}"`** để tìm URL specific.
> 4. Nếu search không ra → fallback: (a) plain text không link, (b) link domain root + anchor topic, (c) `<!-- TODO: verify -->`.
>
> **Lĩnh vực dự án**: Digital Marketing, SEO, Web — personal brand của BinhNN.
>
> **Schema version**: v1.3 (2026-05-27) — Domain Whitelist + Specific-Page Discovery Protocol.
> **Last updated**: 2026-05-27 (upgrade từ v1.0 — annotate sample_urls + citation_rule).

---

## Tier 1 — Cơ quan chính thức / Tài liệu nền tảng (ưu tiên cao nhất)

> Tài liệu chính thức từ search engine, organization tiêu chuẩn industry. **Cite cho guideline, định nghĩa kỹ thuật chuẩn, best practice từ chính platform.**

```yaml
- name: Google Search Central
  domain: developers.google.com
  tier: 1
  ngon_ngu: en
  linh_vuc: Tài liệu SEO chính thức của Google (structured data, rich results, Core Web Vitals, crawl/index, search guidelines)
  sample_urls:                                  # ← PROOFS — KHÔNG paste vào bài
    - https://developers.google.com/search
    - https://developers.google.com/search/docs/fundamentals/seo-starter-guide
  citation_rule: |
    Khi cite Google guideline cụ thể (vd "structured data Article", "Core Web Vitals INP threshold", "JavaScript SEO"):
    1. Web search: site:developers.google.com "{topic}"
    2. URL specific dạng: https://developers.google.com/search/docs/{path}/{topic}
    3. Cite URL specific với anchor có tên topic (vd "[Google — Article structured data](URL)")
    4. Không tìm thấy → fallback (a) plain text "theo Google Search Central"
    TUYỆT ĐỐI KHÔNG paste sample_urls (landing page /search) cho cite spec cụ thể.
  ghi_chu: Search Central là source duy nhất authoritative cho Google guideline. Tránh cite second-hand.

- name: web.dev (Google)
  domain: web.dev
  tier: 1
  ngon_ngu: en
  linh_vuc: Web performance, Core Web Vitals, Lighthouse, PWA, modern web standards
  sample_urls:
    - https://web.dev/
    - https://web.dev/learn/performance
  citation_rule: |
    Khi cite metric web performance cụ thể (vd "LCP < 2.5s", "INP < 200ms", "CLS < 0.1"):
    1. Web search: site:web.dev "{metric name}"
    2. URL specific dạng: https://web.dev/articles/{slug}
    3. Cite URL specific với anchor metric (vd "[INP — web.dev](URL)")
    4. Không tìm thấy → fallback plain text.
  ghi_chu: web.dev là source mới nhất cho Core Web Vitals threshold (cập nhật khi Google thay đổi).

- name: Columbia University — SEO Starter Guide PDF Archive
  domain: cuit.columbia.edu
  tier: 1
  ngon_ngu: en
  linh_vuc: Bản PDF archive của Google SEO Starter Guide
  sample_urls:
    - https://www.cuit.columbia.edu/sites/default/files/content/search-engine-optimization-starter-guide.pdf
  citation_rule: |
    Chỉ cite khi cần link PDF stable cho Google SEO Starter Guide:
    1. Verify PDF version still match Google official
    2. Cite trực tiếp URL PDF (vì là static archive)
    3. Anchor: "[Google SEO Starter Guide (PDF — Columbia archive)](URL)"
    KHÔNG dùng cho cite topic ngoài Starter Guide.
  ghi_chu: Static PDF archive, không thay đổi. Có thể paste URL trực tiếp.
```

---

## Tier 2 — Hiệp hội / Academy / Tài liệu giáo dục uy tín

> Tổ chức marketing có tài liệu education-grade, được khóa học chuyên môn công nhận. **Cite cho framework, methodology, khóa học chuẩn ngành.**

```yaml
- name: Moz
  domain: moz.com
  tier: 2
  ngon_ngu: en
  linh_vuc: SEO education + tool blog (crawling/indexing/ranking, on-page, off-page, technical SEO)
  sample_urls:
    - https://moz.com/learn/seo/what-is-seo
    - https://moz.com/beginners-guide-to-seo
  citation_rule: |
    Khi cite định nghĩa SEO / khái niệm từ Moz (vd "Domain Authority", "Beginner's Guide chapter X"):
    1. Web search: site:moz.com "{topic}"
    2. URL specific dạng: https://moz.com/learn/seo/{slug} hoặc /blog/{slug}
    3. Cite URL specific với anchor tên topic
    4. Không tìm thấy → fallback plain text.
  ghi_chu: Moz Learn (whatis page) là evergreen. Moz Blog cho update mới.

- name: HubSpot Academy
  domain: academy.hubspot.com
  tier: 2
  ngon_ngu: en
  linh_vuc: Khóa học miễn phí Digital Marketing / Content / SEO / Inbound
  sample_urls:
    - https://academy.hubspot.com/courses/digital-marketing
    - https://academy.hubspot.com/courses/content-marketing
    - https://academy.hubspot.com/courses/seo-training
  citation_rule: |
    Khi cite framework HubSpot (vd "Inbound methodology", "Pillar + Cluster model", "BOFU content"):
    1. Web search: site:academy.hubspot.com "{framework}" hoặc site:hubspot.com/blog "{framework}"
    2. Cite URL specific course/lesson hoặc blog post
    3. Anchor: "[HubSpot — Inbound methodology](URL_specific)"
    4. Không tìm thấy → fallback plain text "theo HubSpot framework {X}"
  ghi_chu: HubSpot có course + blog song song. Cite blog post specific cho framework, course cho general overview.
```

---

## Tier 3 — Chuyên gia / Expert cá nhân

> Cá nhân có authority quốc tế, được community SEO/marketing công nhận. **Cite cho quote, methodology đặc trưng (vd Skyscraper, 80/20 rule).**

```yaml
- name: Brian Dean (Backlinko)
  domain: backlinko.com
  tier: 3
  ngon_ngu: en
  linh_vuc: SEO, content marketing, link building (founder Backlinko, sau bán cho Semrush)
  sample_urls:
    - https://backlinko.com
    - https://backlinko.com/blog/authors/brian-dean
  citation_rule: |
    Khi cite framework Brian Dean (vd "Skyscraper Technique", "APP Formula", "Content Hub"):
    1. Web search: site:backlinko.com "{framework name}"
    2. Cite URL bài gốc với anchor "[Brian Dean — Skyscraper Technique](URL)"
    3. Verify bài viết của Brian Dean (không phải author khác trên Backlinko sau acquisition)
    4. Không tìm thấy bài gốc → fallback plain text "theo Brian Dean (Backlinko)"
  ghi_chu: Backlinko đã bán cho Semrush — verify author Brian Dean rõ ràng khi cite framework cá nhân.

- name: Neil Patel
  domain: neilpatel.com
  tier: 3
  ngon_ngu: en
  linh_vuc: Digital marketing, SEO, content, paid ads, CRO
  sample_urls:
    - https://neilpatel.com
    - https://neilpatel.com/blog/
  citation_rule: |
    Khi cite strategy / template Neil Patel:
    1. Web search: site:neilpatel.com/blog "{topic}"
    2. Cite URL bài blog specific với anchor có topic
    3. Anchor: "[Neil Patel — {topic}](URL_specific)"
    4. Không tìm thấy → plain text "theo strategy của Neil Patel"
  ghi_chu: Neil Patel blog có nhiều ghost writer — verify topic match credibility của Neil cho quote.
```

---

## Bảng tổng quan (digest)

### Tier 1 (3 nguồn)
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | Google Search Central | developers.google.com | SEO docs official | en |
| 2 | web.dev (Google) | web.dev | Core Web Vitals + perf | en |
| 3 | Columbia archive SEO PDF | cuit.columbia.edu | PDF stable | en |

### Tier 2 (2 nguồn)
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | Moz | moz.com | SEO education | en |
| 2 | HubSpot Academy | academy.hubspot.com | Inbound framework | en |

### Tier 3 (2 nguồn)
| # | Tên chuyên gia | Domain | Lĩnh vực | Ngôn ngữ |
|---|----------------|--------|----------|----------|
| 1 | Brian Dean (Backlinko) | backlinko.com | Skyscraper + content | en |
| 2 | Neil Patel | neilpatel.com | Multi-channel marketing | en |

---

## Quy tắc cite (AI BẮT BUỘC tuân thủ — v1.3)

### Per-citation workflow

```
Step 1: Identify topic (vd "Skyscraper Technique", "Core Web Vitals INP", "structured data Article")
Step 2: Match domain whitelist
Step 3: Web search: site:{domain} "{topic}"
Step 4a: ✅ Tìm thấy URL specific → cite + anchor có topic
Step 4b: ❌ Không tìm thấy → fallback (a)(b)(c)
Step 5: KHÔNG paste sample_urls
Step 6: Log vào Session History
```

### Anti-pattern thường mắc

| ❌ Sai | ✅ Đúng |
|--------|--------|
| Cite "Skyscraper Technique" với URL `backlinko.com` (sample paste) | Search `site:backlinko.com "skyscraper technique"` → cite URL bài gốc |
| Cite "INP threshold 200ms" với URL `web.dev/` (homepage) | Search `site:web.dev "INP"` → cite URL bài INP specific |
| Cite Google structured data Article với URL `developers.google.com/search` (landing) | Search `site:developers.google.com "Article structured data"` → cite URL spec |

### Quy tắc chung

1. **CHỈ cite domain từ whitelist**. Nguồn ngoài → AI BỎ QUA.
2. **Anchor text** chứa tên topic cụ thể:
   - ✅ "Theo [Google Search Central — Core Web Vitals](url_specific)..."
   - ✅ "Framework [Skyscraper của Brian Dean](url_specific)..."
   - ❌ "Xem [tại đây](url)"
3. **Số lượng**: 2-5 external link/bài. Pillar pages có thể 5-7.
4. **Ưu tiên Tier**:
   - **Tier 1** cho định nghĩa kỹ thuật SEO (Core Web Vitals, crawl/index, structured data), guideline Google.
   - **Tier 2** cho framework chuẩn (inbound, content marketing).
   - **Tier 3** cho quote chuyên gia, methodology đặc trưng.
5. **Bài về SEO kỹ thuật** BẮT BUỘC có ít nhất 1 Tier 1 cite URL specific (không sample).
6. **Bài về Content/Marketing strategy** khuyến nghị mix Tier 2 + Tier 3.
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
- Schema v1.0 → skill v1.5+ vẫn parse, warn upgrade v1.3.

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
