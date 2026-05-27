# SERP Features — Tối ưu vị trí đặc biệt trên SERP

## 1. Purpose / Mục đích
SERP Features (Featured Snippet, People Also Ask, AI Overview, Knowledge Panel, Image Pack, Video Pack, Local Pack, Sitelinks, ...) chiếm phần lớn diện tích SERP — đôi khi đẩy organic listing #1 xuống gần fold. Capture được SERP feature thường mang về **20–35% click share** ngoài organic, và cũng là path tới AI cite. Skill này định nghĩa cách target từng feature có hệ thống.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Các SERP feature chính (2025)
- **AI Overview / SGE**: AI summary đầu SERP (skill AI Content Optimization, Generative SEO).
- **Featured Snippet (FS)**: position #0, đoạn trả lời trực tiếp.
- **People Also Ask (PAA)**: accordion questions liên quan.
- **Knowledge Panel**: card về entity (brand, person, place).
- **Image Pack**: hàng image carousel.
- **Video Pack**: thumbnail YouTube.
- **Local Pack** (Map 3-pack): cho local intent.
- **Sitelinks**: 2-6 sub-link cho 1 result.
- **Sitelinks Search Box**: cho brand search.
- **Top Stories / News box**.
- **Twitter / X carousel**.
- **Shopping pack** (Product carousel).
- **Recipe carousel**.
- **Job pack** (Google for Jobs).
- **Event pack**.
- **Discussions and Forums** (2024+ feature, Reddit/Quora rich).
- **Things to Know**: AI-generated FAQ-like.
- **HowTo carousel** (đã thu hẹp 2023+).

### 2.2 SERP feature win = traffic + AI eligibility
- FS thường được AI Overview cite → 1 strategy, 2 win.
- PAA expanded count = signal Google care về intent fragment.
- Local Pack quyết định business local visibility.

## 3. When to use
- Mọi keyword research output (mark feature opportunity).
- Khi bài rank top 5 nhưng CTR thấp — feature đang chiếm chỗ.
- Khi launch local business.
- Khi viết nội dung Q&A, listicle, how-to.

## 4. Workflow SERP Features

### Bước 1. Identify feature opportunity per keyword
Tools:
- Ahrefs SERP overview cho keyword.
- Semrush Keyword Magic + SERP feature filter.
- Google Search Console Performance + Search Appearance filter.
- Manual SERP scan top keyword.

Tag mỗi keyword với feature đang serve: FS, PAA, AIO, Image, Video, Local, ...

### Bước 2. Featured Snippet capture
Format đoạn 40–58 từ ngay sau H2 dạng câu hỏi:
- Definition: "X là [definition 1 câu]. X bao gồm [3 phần]. X được dùng cho [use case]."
- List: bullet 5–8 items, mỗi item ≤ 15 từ.
- Table: cột rõ + heading.
- HowTo: numbered step.

Optimize:
- Keyword chính trong H2.
- Đoạn ngắn ngay sau H2.
- Subject-verb-object rõ.
- Schema FAQPage / HowTo.

Khi đã có FS:
- Đừng đảo cấu trúc.
- Refresh data + ngày.
- Build link tới page.

### Bước 3. People Also Ask capture
PAA expand vô hạn — mỗi expand reveal thêm 4 câu.
- Mining PAA: AlsoAsked, AnswerThePublic, Ahrefs Q&A.
- Mỗi câu PAA thường rank #1 cho query đó.
- Trong bài, có FAQ section trả lời PAA-style:
```
H2 / H3 question
Đoạn trả lời 40-60 từ ngay sau.
```
- Schema FAQPage.
- 5–10 câu FAQ relevant audience.

### Bước 4. AI Overview eligibility
(Xem skill AI Content Optimization.)
- Schema rich.
- Answer-first.
- EEAT signal.
- Freshness.
- Allow AI bot.

### Bước 5. Image Pack
- Ảnh nguyên bản (không stock).
- Filename descriptive.
- Alt text 80–125 ký tự.
- Schema ImageObject.
- High resolution.
- WebP / AVIF.
- Image sitemap.
- Embedded trong bài có topical context.

(Xem skill Image Optimization.)

### Bước 6. Video Pack
- YouTube channel + video optimized cho keyword.
- Title, description, transcript.
- Schema VideoObject + thumbnailUrl + duration + uploadDate.
- Embed trên site (cùng page với content text-based) → 2x cơ hội.
- Chapters trong YouTube → keyword segment.

### Bước 7. Knowledge Panel
- Cho brand / person / place entity.
- Wikipedia entry (nếu eligible).
- Wikidata entry.
- Google Business Profile claim.
- Schema Organization / Person + sameAs đầy đủ.
- Knowledge Graph eligibility tăng theo authority + citation.

### Bước 8. Local Pack
(Local SEO subset — skill Geo Targeting có thêm chi tiết.)
- Google Business Profile complete (name, address, phone, hours, photo, post weekly).
- Citations NAP consistent (Yelp, Yellow Pages, industry directory).
- Local review (Google review ≥ 50, ≥ 4.5 sao).
- LocalBusiness schema.
- Local backlink.
- "Best {service} in {city}" content.
- Multi-location: page riêng cho mỗi location + LocalBusiness schema.

### Bước 9. Sitelinks
- IA flat (≤ 3 click depth).
- Internal link mạnh.
- Title page rõ + breadcrumb.
- Cùng sitelinks search box: schema WebSite + potentialAction SearchAction.
- KHÔNG hardcode sitelinks — Google chọn auto.

### Bước 10. Top Stories / News
- News schema NewsArticle.
- Submit Google News (eligibility quy định).
- Publish nhanh + freshness signal.
- AMP (optional, Google đã tone down ưu tiên).

### Bước 11. Discussions and Forums
2024+: Google đẩy mạnh Reddit, Quora trong SERP.
- Brand presence trên Reddit ngách (skill Generative SEO).
- Forum của brand (community.brand.com) với schema DiscussionForumPosting:
```json
{
  "@type": "DiscussionForumPosting",
  "headline": "How to ...",
  "author": {"@type": "Person", "name": "..."}
}
```
- Quora answer optimize.

### Bước 12. Shopping pack (Product)
- Product schema (price, availability, review).
- Google Merchant Center.
- Free Shopping listing (organic).
- High quality image.
- Review aggregateRating.

### Bước 13. Recipe / HowTo (niche-specific)
- Recipe schema cho food.
- HowTo schema cho process.
- Step image cho mỗi step.
- Total time, prep time, ingredients.
- (HowTo carousel reduced 2023, vẫn optimize cho fallback.)

### Bước 14. Track + iterate
GSC Search Appearance filter. So sánh CTR theo Search Appearance:
- Article: baseline.
- FAQ: thường cao hơn baseline.
- Video: cao hơn.
- HowTo: ~baseline.

Tools track SERP feature:
- Ahrefs SERP Features report.
- Semrush Position Tracking + SERP feature column.
- Sistrix SERP Feature.

## 5. Template SERP Feature Audit

| Keyword | Position | Features serving | Features captured | Gap | Action | Priority |
|---|---|---|---|---|---|---|

Per cluster, ưu tiên gap.

## 6. KPI đo lường
- # FS captured.
- # PAA appearance (Search Appearance GSC).
- # AI Overview cite.
- # Image / Video pack appearance.
- # Local Pack rank top 3 (cho local).
- # rich result valid (Article, FAQ, Product, Recipe).
- CTR uplift sau capture feature.
- Total impression with SERP feature vs without.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC + Search Appearance filter | Free | Đếm feature win |
| Ahrefs SERP Features | Paid | Per keyword |
| Semrush Position Tracking | Paid | Tracker |
| AlsoAsked / AnswerThePublic | Freemium | PAA mining |
| Featured Snippet checker | Free | Validate FS |
| Google Business Profile | Free | Local Pack |
| YouTube Studio | Free | Video |
| Schema App / RankMath / Yoast | Paid/Free | Schema |
| Authoritas | Paid | AI Overview tracker |
| Wikidata Query | Free | Knowledge Graph |
| Merchant Center | Free | Shopping organic |

## 8. Common mistakes
- Bài rank #1 nhưng FS bị đối thủ chiếm — cấu trúc không answer-first.
- FAQ section nhồi câu hỏi không có search demand.
- Schema FAQ trên trang non-FAQ (vi phạm guidelines 2023+).
- Image pack thua vì stock photo.
- Video không có schema → không vào video pack.
- Knowledge Panel không có vì thiếu Wikipedia/Wikidata.
- Local Pack thua vì NAP inconsistent.
- Sitelinks bad vì IA + internal link kém.
- Top Stories thiếu vì Google News chưa accept.
- Schema HowTo trên content không phải tutorial → manual action.
- Track FS / PAA tổng quan thay vì per-keyword.
- Bỏ qua Discussions/Forums feature 2024.
- Optimize PAA nhưng không có FAQ schema.
- Không update FS sau khi capture → đối thủ vượt.
- Chỉ optimize cho desktop SERP, ignore mobile (feature distribution khác).
- Pixel limit title/description không respect cho mobile.

---
**Đầu ra**: portfolio SERP feature captured có hệ thống — FS, PAA, AI Overview, Image, Video, Local, Knowledge Panel — tăng visibility ngoài organic ranking thuần.
