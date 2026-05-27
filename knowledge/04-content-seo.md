# Knowledge Note — Content SEO

**Trigger**: khi user nhắc "blog content", "pillar page", "topic cluster", "evergreen", "programmatic SEO", "content refresh", "tools content", "content brief", "viết bài chuẩn SEO", "helpful content", "SEO copywriting", "topical audit".

## Mục đích

Sản xuất nội dung target intent + cluster + scaling. Cover từ blog đến pillar đến programmatic, bao gồm cả framework viết copy và tiêu chuẩn helpful content.

## Khái niệm cốt lõi

### Pillar Page & Topic Cluster
- Pillar: trang trụ cột bao quát chủ đề rộng, là "hub" gắn internal link tới cluster pages
- Topic cluster: 1 pillar + nhiều cluster page liên kết chặt
- Core Section → pillar page chính (gắn chuyển đổi)
- Outer Section → cluster bổ trợ (blog, resource)
- Production order: 5 supporting trước → pillar → thêm supporting (tránh pillar cô lập)

### Thiết kế Pillar Page
1. Giới thiệu chủ đề + lợi ích cho người đọc
2. Mục lục (TOC)
3. Sections: định nghĩa → lợi ích/rủi ro → các loại hình → quy trình → lỗi thường gặp
4. FAQ, CTA cuối bài
5. Mỗi section: câu trả lời ngắn trước, chi tiết sau
6. Internal link tới cluster page tương ứng trong mỗi section

### Internal Link trong Cluster
- Pillar → link xuống mọi cluster page liên quan
- Cluster → link ngược về pillar + link ngang giữa cluster liên quan
- Anchor text mang nghĩa (chứa chủ đề, không chỉ "xem thêm")
- **⚠️ Mỗi URL nội bộ chỉ xuất hiện DUY NHẤT 1 LẦN trong 1 bài viết** — lặp cùng URL ≥ 2 lần → Google đánh giá spam pattern. Supporting chỉ link về pillar 1 lần, đặt ở vị trí tự nhiên nhất.

### Helpful Content — Tiêu chuẩn bắt buộc
- Nội dung giải quyết rõ ràng 1 intent cụ thể trong Topical Map
- Dựa trên trải nghiệm thực, dữ liệu, chuyên môn — không copy/thay chữ từ top 10
- Khung "Who – How – Why":
  - Who: ai viết, có trải nghiệm gì?
  - How: tổng hợp từ đâu (luật, nghiên cứu, phỏng vấn)?
  - Why: giúp người đọc đạt điều gì cụ thể?

### Helpful Content cho Core Section
- Giúp người đọc đủ thông tin để ra quyết định (mua, đăng ký, tư vấn)
- Nêu rõ điều kiện, chi phí, rủi ro, lợi ích
- Case study, ví dụ thực tế
- Hướng dẫn "bước tiếp theo" rõ ràng

### Helpful Content cho Outer Section
- Mở rộng hiểu biết về Central Entity
- Trả lời câu hỏi "vòng ngoài" quan trọng cho quyết định dài hạn
- Mỗi bài giải quyết 1 phạm vi rõ ràng, không lan man
- Kết nối ngữ nghĩa với Core Section qua internal link

### SEO Copywriting

**Khung copy cho Core Section:**
1. Hook — gọi đúng vấn đề/lợi ích lớn
2. Proof — số liệu, case study, review
3. Explain — quy trình, điều kiện, phạm vi
4. Guide — hướng dẫn bước tiếp theo, CTA rõ ràng
5. Connect — link đến Outer Section để đào sâu

**Khung copy cho Outer Section:**
1. Bối cảnh — tình huống thực tế, câu hỏi người đọc đang có
2. Value — insight, kinh nghiệm, phân tích
3. Bridge — kết nối nhẹ với giải pháp (Core Section)
4. Next step — đọc thêm cluster khác hoặc sang Core

### Programmatic SEO
- Template + data, modifier pattern
- Quality gate: ≥ 300 từ unique per page
- Không thin content → penalty risk

### Content Refresh
- Striking distance focus (position 5-20)
- 3 mức: Light (1-2h) / Medium (3-5h) / Heavy (1-2 ngày)
- Measure 28/60/90 ngày post-refresh

## Sub-skills

1. **Content Writing** — User Psychology + EEAT + GEO + giọng văn có hồn ⭐
2. **Blog Content** — editorial calendar, brief, workflow
3. **Pillar Pages** — hub-and-spoke, mega-guide
4. **Topic Clusters** — entity coverage, cluster mapping
5. **Tools Content** — calculator/generator as link bait
6. **Evergreen Content** — compound traffic, refresh cycle
7. **Programmatic SEO** — template + data, quality gate
8. **Content Refresh** — striking distance, light/medium/heavy
9. **Topical Audit** — audit cluster + page scoring 100đ + topical map + coverage gap + recommendations

## Workflow — Content production per cluster

1. Cluster mapping (xem `01-seo-foundations.md` cho Topical Map)
2. Xác định Core vs Outer Section cho cluster
3. Production order: 5 supporting trước → 1 pillar → thêm supporting
4. **Semantic Keyword Research** cho mỗi bài (xem `Content Writing SKILL.md` Bước 0.5):
   - Keyword Map: primary + secondary (3-5) + long-tail (5-10) + LSI/semantic terms (10-20) + PAA (5-8)
   - Phân bổ: primary → H1/first 100 words, secondary → H2, long-tail → H3/FAQ, LSI → body
5. Brief mỗi bài: target keyword, **keyword map**, intent, awareness stage, outline, entity list
6. Draft → áp dụng khung copy (Core hoặc Outer) → **Keyword Coverage Check** → EEAT check → GEO check
6.5. **Rare Attribute Check**: mỗi bài ít nhất 1-2 thông tin hiếm (dữ liệu gốc, kinh nghiệm độc đáo). **Topical Context**: mở bài + body kết nối ngữ nghĩa với category hierarchy (cha → con → cháu)
7. Internal link mạng: pillar ↔ supporting ↔ supporting (mỗi URL chỉ 1 lần duy nhất trong bài)
8. Frontmatter đầy đủ (12 trường): title, slug, meta_title, meta_description, project, cluster, role, target_keyword, semantic_keywords, search_intent, word_count, created — theo `projects/content-template.md`
9. Schema (Article + FAQ + HowTo nếu phù hợp)
10. Distribution (newsletter, social, community)
11. Track 7/14/28/60/90 ngày
12. Refresh khi position decay

## Khi nào dùng

- Mỗi sprint content production
- Quarterly cluster audit
- Khi content backlog cần triage
- Khi traffic flat → diagnose cluster nào underperform
- Khi viết brief cho writer
- Khi review draft content

## Tools

- Notion / Airtable / Asana (calendar, brief)
- Surfer / Frase / Clearscope (brief + score)
- Keyword Insights / Ahrefs (cluster)
- ChatGPT / Claude (assist draft, intent classify)
- Wordable (Doc → CMS)
- WordPress / Webflow / Sanity (CMS)

## File tham chiếu

- `skills/content/Content Writing/SKILL.md`
- `skills/content/Blog Content/SKILL.md`
- `skills/content/Pillar Pages/SKILL.md`
- `skills/content/Topic Clusters/SKILL.md`
- `skills/content/Tools Content/SKILL.md`
- `skills/content/Evergreen Content/SKILL.md`
- `skills/content/Programmatic SEO/SKILL.md`
- `skills/content/Content Refresh/SKILL.md`
- `skills/content/Topical Audit/SKILL.md`
- `knowledge/15-anti-ai-content-rules.md` — **BẮT BUỘC** đọc trước khi viết nội dung (4 Rulesets chống AI footprint)

## Common pitfall

- Pillar trước supporting → cô lập, không rank
- Cluster mapping volume-driven, không intent-driven
- Programmatic không quality gate → thin content penalty
- Bài evergreen không refresh sau 12 tháng → decay
- Tools content không backlink campaign → asset chết
- Refresh không document trước/sau → không biết hiệu quả
- Content brief thiếu entity coverage → bài hời hợt
- **Không làm Semantic Keyword Research** → bài thiếu topical depth, Google không hiểu context
- **Chỉ dùng primary keyword**, không có secondary/long-tail/LSI → bỏ lỡ hàng trăm queries liên quan
- **Nhồi keyword** quá nhiều → spam, bị phạt (quy tắc: đọc to, nếu keyword lặp gượng ép → thay biến thể)
- AI generate full → footprint detect
- Core Section viết như blog → không convert
- Outer Section không link về Core → traffic không chuyển đổi
- Copy không phân biệt Core vs Outer → cùng tone, cùng CTA
- Helpful content chỉ "tổng hợp" → không có information gain
- Cùng URL nội bộ lặp 2-3 lần trong 1 bài → spam pattern risk
- Thiếu meta_title / meta_description trong frontmatter → mất kiểm soát SERP snippet
- Bài viết toàn thông tin phổ biến (common), không có Rare Attribute → Google không chấm điểm Knowledge Graph
- Không có Topical Context Linking → bài "mồ côi" trong cluster, Topical Authority yếu
- Không chạy Phantom Keywords định kỳ (1 tháng/lần) → bỏ lỡ keyword phụ từ Search Console
