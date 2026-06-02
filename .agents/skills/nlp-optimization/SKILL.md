---
name: nlp-optimization
version: 1.0.0
description: "Use this skill when the user asks to optimize content for NLP models / semantic understanding: 'tối ưu NLP', 'entity SEO', 'semantic SEO', 'làm rõ ngữ nghĩa cho AI hiểu'. Covers entity recognition, topical relevance, semantic triples, BERT/MUM-friendly structure."
category: ai-seo
---

# NLP Optimization — Tối ưu cho mô hình ngôn ngữ

## 1. Purpose / Mục đích
NLP Optimization là tối ưu content để Google + LLM hiểu **ngữ nghĩa, entity, mối quan hệ giữa concept** — thay vì chỉ keyword matching. Sau BERT (2019), MUM (2021), và LLM-driven indexing, semantic matters hơn exact match. Site có topical depth + entity coverage + clean semantic structure thắng site keyword stuffing.

## 2. Core Concepts / Khái niệm cốt lõi

- **Entity**: object có ID (Person, Place, Organization, Concept). Google's Knowledge Graph có hàng tỉ entity.
- **Salience**: mức entity quan trọng trong document. NLP API trả về 0-1.
- **Co-occurrence**: entity nào xuất hiện cùng nhau → semantic relationship.
- **Topical authority**: site cover comprehensive entity trong topic = expert.
- **Semantic relevance**: matching meaning, không phải string.
- **NLU (Natural Language Understanding)**: máy hiểu ý, không chỉ từ.
- **Word embedding**: word → vector. "King - Man + Woman ≈ Queen".
- **Knowledge Graph**: Google's database entity + relationship.
- **Schema as bridge**: schema gắn explicit entity reference → giúp LLM/Google parse.
- **TF-IDF / BM25** legacy → vẫn là một tín hiệu, nhưng giờ secondary so với BERT.

## 3. When to use
- Mọi content brief.
- Khi audit content underperform.
- Khi build cluster (entity coverage check).
- Khi launch site mới (entity-first IA).

## 4. Workflow NLP Optimization

### Bước 1. Entity research per topic
Tools:
- Google NLP API: paste competitor URL → entities + salience.
- TextRazor.
- IBM Watson NLU.
- AlsoAsked / AnswerThePublic (entity-related question).
- Wikipedia + Wikidata (entity authoritative).

Output: list entity Google associate với topic.

Ví dụ topic "Core Web Vitals":
- LCP (metric)
- INP (metric)
- CLS (metric)
- Google (Organization)
- Page Experience (concept)
- PageSpeed Insights (Tool)
- Chrome User Experience Report (Dataset)
- Core Web Vitals (concept)
- Web Vitals (concept)
- Lighthouse (Tool)
- Mobile-first (concept)
- Largest Contentful Paint (full name)
- ...

### Bước 2. Coverage audit content hiện tại
- Run Google NLP API trên bài mình.
- So sánh entity list mình vs competitor.
- Gap → entity mình thiếu.
- Salience mình thấp cho entity chính → cần emphasize hơn.

### Bước 3. Entity reinforcement trong content
- Mention entity full name first (Largest Contentful Paint).
- Sau đó abbreviation OK (LCP).
- Link entity primary tới glossary / pillar / Wikipedia.
- Internal link cross entity-relevant page.
- Schema `mentions` cho entity references:
```json
{
  "@type": "Article",
  "mentions": [
    {"@type": "Thing", "name": "Largest Contentful Paint", "sameAs": "https://web.dev/lcp/"},
    {"@type": "Thing", "name": "Interaction to Next Paint", "sameAs": "https://web.dev/inp/"}
  ]
}
```

### Bước 4. Co-occurrence + relationship
Group entity xuất hiện cùng nhau trong cùng đoạn:
- Trong đoạn về LCP → mention "image preload", "fetchpriority", "above-the-fold".
- Tránh đoạn 1 entity không có context entity related.

### Bước 5. Subject-verb-object rõ
NLP parser gỗ:
- "Google ranking factor includes Core Web Vitals" → SVO clear.
- "It's important" → It = ai? Mơ hồ.

Tránh:
- Pronoun ambiguous.
- Passive voice quá nhiều.
- Câu lồng ghép quá sâu.
- Idiom dịch literal.

### Bước 6. Semantic structure HTML
- H1-H6 thực sự represent hierarchy.
- `<article>`, `<section>`, `<header>`, `<footer>`, `<nav>` semantic tag.
- `<aside>` cho callout.
- `<figure>` + `<figcaption>` cho image.
- `<time datetime="...">` cho ngày.
- `<address>` cho contact.
- Microdata / RDFa nếu không dùng JSON-LD (recommend JSON-LD).

### Bước 7. Glossary / definition page
Mỗi term technical:
- 1 page riêng (URL `/glossary/{term}/`) hoặc anchor `/blog/all-terms#term`.
- Definition ngắn gọn 50–80 từ.
- Schema `DefinedTerm`:
```json
{
  "@type": "DefinedTerm",
  "name": "Largest Contentful Paint",
  "description": "...",
  "inDefinedTermSet": "https://yourdomain.com/glossary/"
}
```
- Internal link từ mọi bài mention term → glossary.

### Bước 8. Topic Cluster + entity
- Pillar = entity chính.
- Supporting = entity con / sub-concept.
- Internal link = relationship giữa entity.
- Site = "knowledge graph" của brand mình.

(Xem skill Topic Clusters.)

### Bước 9. Author + Organization entity
- Author: Person schema + sameAs LinkedIn/Twitter/Wikipedia.
- Organization: Organization schema + sameAs Crunchbase/LinkedIn.
- Founder: Person + worksFor → Organization.
- Published: Article + author + publisher.

→ Google liên kết entity Person ↔ Organization ↔ Article ↔ Topic.

### Bước 10. Test + iterate
- Re-run NLP API sau publish.
- Compare entity coverage trước/sau.
- Track ranking + AI cite (skill AI Content Optimization).
- Iterate gap.

## 5. Template Entity Coverage Sheet

| Entity | Type | Salience target | Salience current | Frequency in content | Internal link to | Schema mentioned (Y/N) | Source authority cite (Y/N) |

Per topic, build entity matrix.

## 6. KPI đo lường
- Entity coverage % vs benchmark competitor.
- Avg salience cho top 5 entity per article.
- # entity với schema reference.
- # internal link tới glossary.
- Topical authority score (Ahrefs / Semrush).
- AI cite rate (skill AI Content Optimization).
- Avg position cluster after entity reinforcement.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google NLP API | Pay-per-use | Entity + salience |
| TextRazor | Freemium | Entity extraction |
| IBM Watson NLU | Freemium | Entity + sentiment |
| Surfer SEO NLP | Paid | NLP + content score |
| Frase | Paid | Topic + entity |
| Clearscope | Paid | NLP grading |
| MarketMuse | Paid | Topic modeling enterprise |
| InLinks | Paid | Entity-based internal link auto |
| Wikidata Query Service | Free | Entity authoritative |
| Schema App | Paid | Schema scale |
| Diffbot | Paid | Knowledge graph extraction |

### Sample NLP API call (Python)
```python
from google.cloud import language_v1
client = language_v1.LanguageServiceClient()
doc = language_v1.Document(content=text, type_=language_v1.Document.Type.HTML)
response = client.analyze_entities(request={'document': doc})
for entity in response.entities:
    print(entity.name, entity.type_.name, entity.salience, entity.metadata.get('mid'))
```

## 8. Common mistakes
- Keyword stuff thay vì entity coverage → Google detect.
- Bài đầy entity nhưng không có relationship → đoạn rời rạc.
- Bỏ qua schema mentions → cơ hội bị mất.
- Not glossary → entity không có "anchor" trong site.
- Pronoun ambiguous → NLP parser mất signal.
- Không cite Wikipedia / authority → entity không reinforced.
- Author không có sameAs → Person entity không link với knowledge graph.
- Topic Cluster nhưng pillar không cover entity comprehensive.
- Internal link random thay vì entity-based.
- Bỏ qua Wikidata cho entity ngách.
- Optimize NLP cho 1 bài, không cho cluster.
- Tin rằng salience cao = ranking — relationship chỉ là 1 yếu tố.
- Schema overstuff entity ép vào → spam signal.
- Duplicate content giữa các URL cùng entity → cannibalization.
- Cluster mới publish mà chưa có internal link mạng entity.

---
**Đầu ra**: content có entity map đầy đủ + schema mentions + glossary + topical authority cluster mạnh → Google + LLM đều hiểu site là expert ngách.
