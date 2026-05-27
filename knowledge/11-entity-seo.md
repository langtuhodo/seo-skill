# Knowledge Note — Entity SEO & NLP

**Trigger**: khi user nhắc "entity SEO", "NLP optimization", "entity coverage", "salience", "Knowledge Graph", "sameAs", "semantic search", "keyphrase length", "co-occurrence", "Google NLP API".

## Mục đích

Tối ưu nội dung xoay quanh thực thể (entities) — đối tượng có danh tính rõ ràng mà Google hiểu qua Knowledge Graph. Google không chỉ khớp từ khóa mà hiểu mối quan hệ giữa entities để đánh giá topical authority.

## Khái niệm cốt lõi

### Entity SEO là gì?
- Entity = người, tổ chức, khái niệm, sản phẩm, địa điểm, sự kiện có danh tính rõ trong Knowledge Graph
- Google đánh giá site qua mật độ + chiều sâu bao phủ entities liên quan
- Semantic search: tìm kiếm dựa trên entities, không chỉ string matching
- Knowledge Panel & Rich Results: nội dung tối ưu entities dễ được trích xuất
- AI/LLM cũng xây dựng hiểu biết dựa trên entities

### Cách nhận diện Entities từ keyword
1. Chủ đề liên quan đến **người/tổ chức** nào?
2. Có **khái niệm chuyên ngành** nào cần giải thích?
3. Có **sản phẩm/công cụ** cụ thể nào?
4. Liên quan đến **địa điểm/thời gian** cụ thể?
5. Có **quy trình/phương pháp** nào?
→ Liệt kê 3-7 entities chính, ưu tiên entities có trong Knowledge Graph

### NLP Optimization
- **Entity coverage**: đủ entities liên quan trong bài (check bằng Google NLP API)
- **Salience**: mức độ nổi bật của entity trong bài (0-1, càng cao càng tốt cho entity chính)
- **Co-occurrence**: entities thường xuất hiện cùng nhau → Google expect chúng cùng có mặt
- **Schema mentions**: dùng schema để reinforce entity identity
- **Glossary**: định nghĩa entity rõ ràng trong bài → AI dễ extract
- **sameAs**: link entity tới Wikipedia, Wikidata, LinkedIn, social profiles

### Keyphrase Length & Semantic Depth
- Keyphrase ngắn (1-2 từ): broad intent, cạnh tranh cao, cần topical authority mạnh
- Keyphrase trung bình (3-4 từ): specific hơn, dễ rank hơn, intent rõ hơn
- Keyphrase dài (5+ từ): very specific, low volume, high conversion
- Keyphrase dài hơn → cần ít entity coverage hơn nhưng cần depth hơn
- Keyphrase ngắn → cần bao phủ nhiều entities liên quan (breadth)

### Entity Graph trong Topical Map
- Central Entity = entity chính của site (xem `01-seo-foundations.md`)
- Mỗi cluster nên cover đủ entities liên quan đến topic đó
- Internal link giữa các bài = link giữa entities → reinforce graph
- Schema Organization + Person + sameAs = declare entity identity cho Google

## Workflow — Entity optimization per article

1. Xác định target keyword → list 3-7 entities chính
2. Check Google NLP API: entities nào top 5 đang cover mà mình thiếu?
3. Viết content cover đủ entities (mention + explain + context)
4. Check salience: entity chính phải có salience cao nhất
5. Add schema: Article + mentions entities + author Person + Organization sameAs
6. Glossary section: định nghĩa entities quan trọng (AI-friendly)
7. Internal link tới bài khác cover related entities
8. Validate: Google NLP API → so sánh entity coverage vs top 5

## Khi nào dùng

- Khi viết content mới (entity planning phase)
- Khi audit bài không rank dù content "đủ dài"
- Khi build Knowledge Panel cho brand
- Khi tối ưu cho AI/LLM citation
- Khi competitor outrank dù content ngắn hơn (thường do entity coverage tốt hơn)

## Tools

- Google NLP API (entity + salience analysis)
- Wikidata Query Service (entity relationships)
- InLinks (entity-based internal link automation)
- Schema App / RankMath (schema markup)
- Surfer / Frase (entity/NLP score)
- ChatGPT / Claude (entity brainstorm, co-occurrence analysis)

## File tham chiếu

- `skills/ai-seo/NLP Optimization/SKILL.md`
- `skills/ai-seo/Content Optimization/SKILL.md`
- `skills/technical/Schema Markup/SKILL.md`
- `skills/growth/Topical Authority/SKILL.md`

## Common pitfall

- Chỉ nhắc entity 1 lần → salience thấp, Google không hiểu entity quan trọng
- Entity stuffing (nhắc quá nhiều không tự nhiên) → spam signal
- Bỏ qua sameAs trong schema → entity không link Knowledge Graph
- Chỉ cover entities "hiển nhiên" → thiếu co-occurrence entities mà top 5 đều có
- Keyphrase ngắn mà chỉ viết 1 bài → cần cluster mới đủ authority
- Không dùng Google NLP API check → đoán mò entity coverage
- Schema Person/Organization thiếu sameAs → Google không verify identity
- Entity trong heading nhưng không explain trong body → shallow mention
- Bỏ qua Wikipedia/Wikidata → mất cơ hội Knowledge Panel
- Internal link không theo entity relationship → graph rời rạc
