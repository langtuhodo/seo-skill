# Knowledge Note — SEO Strategy

**Trigger**: khi user nhắc "SEO strategy", "kế hoạch SEO", "keyword research", "search intent", "competitor SEO", "keyword cluster", "SEO wins", "quick win SEO", "content strategy", "long-tail keyword", "content plan", hoặc bắt đầu lập kế hoạch SEO.

## Mục đích

Đặt nền móng định hướng cho mọi hoạt động SEO: chọn từ khoá, hiểu intent, biết đối thủ, gom cụm nội dung, xác định win sớm, lập chiến lược content dài hạn. Sai ở đây = sai cả năm.

## Khái niệm cốt lõi

### Keyword Research
- Discover demand: mapping volume + KD + intent + business value
- Seed keyword từ 3 nguồn: business knowledge, Search Console, competitor
- Expand qua tool: Ahrefs, Semrush, AlsoAsked, Google Autocomplete

### Search Intent — 4 loại chính
- **Informational (I)**: muốn biết/học (what, how, why)
- **Navigational (N)**: muốn tới 1 trang cụ thể (brand + product)
- **Commercial (C)**: muốn so sánh/đánh giá trước khi mua (best, review, vs)
- **Transactional (T)**: muốn mua/hành động (buy, price, order, download)
- Sub-intent: compare, list, definition, tutorial, near me...

### Competitor Analysis — 3 loại gap
- **Content Gap**: keyword đối thủ rank top mà mình chưa có
- **Keyword Gap**: tập keyword ≥1 đối thủ rank còn mình không
- **Link Gap**: domain link tới ≥2 đối thủ mà không link mình
- Share of Voice (SoV): % visibility trong tập keyword

### Keyword Clustering
- Gom keyword cùng intent → 1 cluster = 1 URL
- Tránh cannibalization (2+ URL cạnh tranh cùng keyword)
- Cluster phải map vào Topical Map (Core/Outer Section)

### Long-tail Keywords
- Cụm từ dài, cụ thể, volume thấp, cạnh tranh thấp
- Gắn mạnh với subtopic trong Topical Map
- Long-tail "chiến lược" → cluster page riêng
- Long-tail "phụ" → heading/section trong bài lớn
- Nguồn: Google Autocomplete, PAA, Reddit, forums, GSC queries chưa có bài

### Content Strategy
- Trả lời: Làm nội dung gì, cho ai, khi nào, để đạt mục tiêu gì?
- Map Topical Map vào awareness funnel (Unaware → Most Aware)
- Ưu tiên dựa trên business impact + traffic potential
- Cadence: weekly mining + monthly review + quarterly retro

### SEO Wins (Quick Wins)
- Striking distance: position 5-20, impression cao, chưa optimize
- Low-hanging fruit: cluster đối thủ rank kém + brand traffic chưa khai thác
- CTR opportunity: position ≤ 5 nhưng CTR dưới benchmark

## Sub-skills

1. **Keyword Research** — discover demand, volume + KD + intent + business value
2. **Search Intent** — I/N/C/T classification + sub-intent
3. **Competitor Analysis** — content gap + backlink gap + SERP feature gap
4. **Keyword Clustering** — gom keyword → 1 cluster = 1 URL
5. **SEO Wins** — striking distance, quick wins

## Workflow

### Workflow lập chiến lược SEO (dự án mới)
1. Define business goal + ICP + niche boundary (core/adjacent/periphery)
2. Xác định Source Context + Central Entity + Central Search Intent (xem `01-seo-foundations.md`)
3. Seed keyword 50–200 từ business + Search Console + competitor
4. Expand qua tool (Ahrefs, Semrush, AlsoAsked, GSC)
5. Tag intent (I/N/C/T) + business value mỗi keyword
6. Cluster → 1 cluster = 1 URL (tránh cannibalization)
7. Map cluster vào Topical Map (Core/Outer Section)
8. Map cluster → URL (existing hoặc new)
9. Gán awareness stage + content type cho mỗi cluster
10. Identify SEO Wins quick lift
11. Prioritize roadmap (RICE / ICE)

### Workflow tìm long-tail keywords
1. Lấy mỗi Core/Outer topic → Google Autocomplete + PAA + Related searches
2. Mine forums, Facebook groups, TikTok comments → copy câu hỏi thực
3. GSC: lọc query dài có impression nhưng chưa có bài riêng
4. Phân loại: long-tail chiến lược (làm bài riêng) vs long-tail phụ (chèn vào bài lớn)

## Khi nào dùng

- Bắt đầu SEO project mới
- Mỗi quý refresh keyword list
- Khi launch sản phẩm mới hoặc expand market
- Audit sau 6-12 tháng để re-cluster
- Khi traffic chững → tìm gap
- Khi cần convince stakeholder bằng data

## Tools

- Ahrefs / Semrush (keyword + competitor + cluster)
- Google Search Console (real query, striking distance)
- Keyword Insights / Ahrefs cluster (clustering)
- AlsoAsked / AnswerThePublic (intent + question)
- ChatGPT / Claude (intent classification at scale)
- Notion / Airtable (roadmap, content calendar)
- Looker Studio (dashboard KPI)

## File tham chiếu

- `skills/strategy/Keyword Research/SKILL.md`
- `skills/strategy/Search Intent/SKILL.md`
- `skills/strategy/Competitor Analysis/SKILL.md`
- `skills/strategy/Keyword Clustering/SKILL.md`
- `skills/strategy/SEO Wins/SKILL.md`

## Common pitfall

- Bỏ qua intent → bài viết sai format (SERP toàn list mình viết essay)
- Không cluster → cannibalization (2+ bài cạnh tranh nhau)
- Volume-driven thay vì business-driven → traffic không convert
- SEO Wins bỏ qua → 6 tháng không có lift đáng kể
- Long-tail không gắn vào cluster → bài rời rạc
- Content strategy không map awareness stage → content toàn TOFU, thiếu BOFU
- Competitor analysis chỉ nhìn keyword → bỏ qua link gap + SERP feature gap
- Roadmap không có timeline + owner → không ai thực thi
- Chạy theo mật độ từ khóa thay vì trả lời intent đầy đủ
