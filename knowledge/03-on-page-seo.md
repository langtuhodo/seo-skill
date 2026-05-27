# Knowledge Note — On-page SEO

**Trigger**: khi user nhắc "on-page", "title tag", "meta description", "header H1 H2", "URL slug", "internal link", "image alt", "content optimization", "tối ưu trang", "on-page SEO".

## Mục đích

Tối ưu mọi yếu tố trên trang để Google hiểu + user click + dwell time cao. Mỗi trang phải rõ ràng: thuộc Core hay Outer Section, đóng vai trò gì trong cluster.

## Khái niệm cốt lõi

### Title Tag
- 50-60 ký tự, keyword đầu, brand cuối
- CTR-driven: phải hấp dẫn click, không chỉ chèn keyword
- A/B variant: test 2 title format cho cùng intent

### Meta Description
- 150-160 ký tự, value-prop + CTA
- Không keyword stuff — Google thường tự generate nếu không relevant
- Mục tiêu: tăng CTR, không ảnh hưởng trực tiếp ranking

### Header Structure
- 1 H1 duy nhất, gần với title, mô tả chính xác chủ đề
- Hierarchy logic H2-H6, không skip level
- H2 mỗi 200-300 từ → scannable
- Heading bám sát câu hỏi/subtopic

### URL Structure
- Short, lowercase, hyphen, no parameter
- Mirror Information Architecture
- Không chứa date/year (tránh sticky cũ)

### Internal Linking
- Equity flow: phân phối link juice từ trang mạnh → trang cần boost
- Anchor descriptive (không "click here", "xem thêm")
- Cluster reinforcement: pillar ↔ supporting ↔ supporting
- Mỗi bài: IN ≥ 3 + OUT ≥ 3
- **⚠️ Mỗi URL nội bộ chỉ xuất hiện DUY NHẤT 1 LẦN trong 1 bài viết** — lặp cùng URL ≥ 2 lần → spam pattern risk

### Image Optimization
- Alt text 80-125 ký tự, mô tả nội dung hình
- Format: WebP/AVIF (nhẹ hơn JPEG/PNG 30-50%)
- Lazy-load below-fold, eager-load above-fold (LCP image)
- Filename descriptive (không IMG_001.jpg)
- Original > stock (Google Image Pack ưu tiên unique)

### Content Optimization
- Intent match: format bài phải khớp SERP top 5
- EEAT signals: author byline, credentials, case study, cite nguồn
- Entity coverage: đủ entity liên quan (dùng Google NLP API check)
- Schema: Article + FAQ + HowTo nếu phù hợp
- Freshness: last-updated date visible

### Tối ưu riêng cho Core Section (Pillar/Landing)
- Rõ ràng về giá trị + điểm khác biệt vs đối thủ
- Blocks bắt buộc: lợi ích, đối tượng phù hợp, quy trình, bằng chứng xã hội
- Internal link dẫn sang cluster giải thích sâu + Outer Section khi cần bối cảnh

### Tối ưu riêng cho Outer Section (Blog/Resource)
- Tính giáo dục, chia sẻ kinh nghiệm, thông tin nền
- Cấu trúc "đọc nhanh": nhiều heading, bullet, ví dụ
- Link tới ít nhất 1 Core Section liên quan
- Gợi ý sang Outer khác cùng nhóm (tăng session depth)

## Sub-skills

1. **Title** — 50-60 chars, keyword front, CTR-driven
2. **Descriptions** — 150-160 chars, value-prop + CTA
3. **Header Structure** — 1 H1, hierarchy H2-H6
4. **URL Structure** — short, lowercase, hyphen
5. **Internal Linking** — equity flow, anchor descriptive
6. **Image Optimization** — alt text, WebP/AVIF, lazy-load
7. **Content Optimization** — intent match, EEAT, entity

## Workflow — Tối ưu on-page per page

1. Xác định cluster + target keyword + intent
2. Xác định trang thuộc Core hay Outer Section
3. Title + Description draft (+ A/B variant)
4. URL slug (ngắn, mirror IA)
5. H1 ≤ 60 ký tự, H2 mỗi 200-300 từ
6. Mở bài: trả lời nhanh "trang này giúp bạn đạt gì" (answer-first)
7. Body: intent match + EEAT + entity coverage
8. Image: original > stock, alt + filename descriptive, WebP
9. Internal link IN ≥ 3 + OUT ≥ 3 (anchor descriptive)
10. Schema (Article + FAQ + HowTo nếu phù hợp)
11. Author byline + last updated date
12. Kết bài: tóm ý + CTA dẫn sang bước kế tiếp
13. SEO check: Surfer/Frase score + Lighthouse + GSC inspect

## Khi nào dùng

- Mỗi bài content publish (checklist bắt buộc)
- Audit trang underperform (low CTR, low position)
- Refresh quarterly
- Khi tạo template mới cho CMS

## Tools

- Surfer / Frase / Clearscope (content score)
- Yoast / RankMath (WordPress on-page)
- Screaming Frog (audit on-page bulk)
- ImageOptim / Squoosh (image compression)
- GSC URL Inspection
- Google NLP API (entity coverage check)

## File tham chiếu

- `skills/on-page/Title/SKILL.md`
- `skills/on-page/Descriptions/SKILL.md`
- `skills/on-page/Header Structure/SKILL.md`
- `skills/on-page/URL Structure/SKILL.md`
- `skills/on-page/Internal Linking/SKILL.md`
- `skills/on-page/Image Optimization/SKILL.md`
- `skills/on-page/Content Optimization/SKILL.md`

## Common pitfall

- Multi H1 / heading skip level
- Title quá keyword stuff, không CTR-driven
- Description tự generated bởi Google → không control snippet
- URL có date / parameter → sticky cũ
- Internal link "click here" anchor → không truyền context
- Image stock không alt → mất Image Pack opportunity
- Content tốt mà thiếu schema → mất rich result
- Core Section thiếu social proof → conversion thấp
- Outer Section không link về Core → traffic không convert
- Lazy-load LCP image → score 5s+
- Không phân biệt Core vs Outer → cùng template, cùng CTA → suboptimal
