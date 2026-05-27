# Knowledge Note — AI SEO & GEO

**Trigger**: khi user nhắc "AI Overview", "SGE", "ChatGPT search", "Perplexity", "Gemini", "AI cite", "GEO", "Generative Engine Optimization", "LLM visibility", "GPTBot", "schema cho AI", "SERP features", "featured snippet", "PAA".

## Mục đích

Lớp SEO mới đi cùng (không thay thế) classic SEO. Đảm bảo content được AI cite + brand được LLM mô tả đúng + chiếm SERP features. Cover content optimization cho AI, bot policy, multi-engine visibility.

## Khái niệm cốt lõi

### GEO (Generative Engine Optimization)
- Tối ưu content để được AI engines cite/trích dẫn
- Answer-first: 50-100 từ đầu trả lời câu hỏi chính (AI extract đoạn này)
- Định nghĩa rõ ràng, cite-able (AI dễ quote)
- List/table dễ trích xuất (structured data trong prose)
- Original data/insight (AI ưu tiên unique information)
- Clear entities: subject-verb-object rõ, không pronoun ambiguous

### Content Optimization cho AI
- Chunk-level optimize: mỗi section tự đứng được (AI có thể cite 1 đoạn)
- Entity reinforcement: nhắc entity chính đủ lần với context
- Schema rich: Article + FAQ + HowTo + Person + Organization
- EEAT signals: AI engines cũng đánh giá trustworthiness
- Không fluff đầu bài ("Trong thời đại số ngày nay...") → AI skip

### NLP Optimization
- Entity coverage (Google NLP API): đủ entities mà topic cần
- Salience: entity chính nổi bật nhất
- Co-occurrence: entities thường đi cùng nhau
- Schema mentions + glossary
- Person/Organization sameAs (link Knowledge Graph)

### Generative SEO — Multi-engine
- 5 engines cần audit: Google AIO, ChatGPT, Perplexity, Claude, Bing Copilot
- Live retrieval vs training data: content mới cần được crawl trước
- Distribution to corpus: Wikipedia, Reddit, GitHub, podcast, YouTube
- Bot policy: cho phép crawl để được index

### SERP Features
- **Featured Snippet (FS)**: answer box, list, table — cần format match
- **PAA (People Also Ask)**: FAQ format, concise answers
- **AI Overview**: answer-first, structured, cite-able
- **Image Pack**: original image + alt text descriptive
- **Video**: YouTube SEO, video schema
- **Local Pack**: LocalBusiness schema, Google Business Profile
- **Knowledge Panel**: entity SEO, Wikipedia, Wikidata
- **Sitelinks**: clear IA, WebSite + SearchAction schema
- **Discussions/Forums**: Reddit, Quora presence

### LLM Visibility
- Bot policy (robots.txt): allow GPTBot, ClaudeBot, PerplexityBot, Google-Extended, applebot-extended
- Wikipedia/Wikidata entity: brand phải có entry
- Brand sentiment monitoring: LLM có thể hallucinate sai về brand
- Hallucination detection: test 10 prompt × 5 LLM quarterly
- Track AI search referral: chatgpt.com, perplexity.ai, gemini.google.com trong GA4

### Bot Policy Default (robots.txt)
```
User-agent: GPTBot
Allow: /
User-agent: ClaudeBot
Allow: /
User-agent: PerplexityBot
Allow: /
User-agent: CCBot
Allow: /
User-agent: Google-Extended
Allow: /
User-agent: applebot-extended
Allow: /
User-agent: ChatGPT-User
Allow: /
User-agent: Claude-Web
Allow: /
```

## Sub-skills

1. **Content Optimization (AI)** — answer-first, chunk-level, entity
2. **NLP Optimization** — entity coverage, salience, sameAs
3. **Generative SEO** — multi-engine audit, bot policy
4. **SERP Features** — FS, PAA, AI Overview, Knowledge Panel
5. **LLM Visibility** — GPTBot policy, Wikipedia, hallucination

## Workflow — AI-readiness audit

1. Manual prompt test: 10 query × 5 LLM (ChatGPT, Claude, Gemini, Perplexity, Bing Copilot)
2. Check brand mention + cite + sentiment + accuracy
3. Coverage audit: entity (Google NLP API) vs competitor
4. Schema audit: Article, Person, Organization, FAQ, HowTo, Product, sameAs
5. Bot policy (robots.txt) — allow all AI bots
6. Wikipedia / Wikidata entity status check
7. Content format audit: answer-first, TL;DR, FAQ, statistic, EEAT signal
8. Distribution gap: Wikipedia, Reddit, Quora, GitHub, podcast, course
9. SERP feature audit: FS/PAA/AIO opportunity per keyword
10. Action plan + quarterly re-audit

## Khi nào dùng

- Build SEO strategy 2025+
- Audit hiện trạng AI visibility
- Khi brand bị hallucinate sai
- Khi content rank tốt nhưng không được AI cite
- Khi setup robots.txt AI bot policy
- Khi target featured snippet / PAA

## Tools

- ChatGPT / Claude / Gemini / Perplexity (manual test)
- Authoritas / Semrush AI Overview / BrightEdge (tracker)
- Profound / Otterly / Pulse (AI brand monitoring)
- Google NLP API (entity + salience)
- Wikidata Query Service
- Schema App / RankMath (schema scale)
- Brand24 / Mention (brand monitoring)
- Ahrefs / Semrush (SERP feature tracking)

## File tham chiếu

- `skills/ai-seo/Content Optimization/SKILL.md`
- `skills/ai-seo/NLP Optimization/SKILL.md`
- `skills/ai-seo/Generative SEO/SKILL.md`
- `skills/ai-seo/SERP Features/SKILL.md`
- `skills/ai-seo/LLM Visibility/SKILL.md`

## Common pitfall

- Tin AI = replacement của classic SEO → AI cite vẫn cần SEO foundation
- Block tất cả AI bot → mất visibility hoàn toàn
- Bỏ qua Wikipedia / Reddit / Quora → LLM không biết brand
- Schema thiếu sameAs → entity không link knowledge graph
- Content fluff đầu bài → AI không cite được (skip intro)
- Pronoun ambiguous, không subject-verb-object rõ → AI hiểu sai
- Bỏ qua original data + research → AI ưu tiên content khác
- Optimize 1 engine (Google AIO), bỏ qua ChatGPT/Perplexity
- Hallucination không monitor → reputation drift
- Không track AI search referral → không biết traffic từ AI
- Featured snippet format không match (Google muốn list, mình viết paragraph)
- **(Google AI Warning)** Lãng phí thời gian tạo file `llms.txt` hoặc markup đặc biệt dành riêng cho AI (Google không yêu cầu).
- **(Google AI Warning)** Cố tình "chia nhỏ" (chunking) nội dung một cách máy móc (Google đủ thông minh để hiểu trang dài).
- **(Google AI Warning)** Viết lại nội dung nhồi nhét từ khóa đuôi dài chỉ để cho AI đọc (AI hiểu ngữ nghĩa rất tốt).
- **(Google AI Warning)** Tạo ra các lượt nhắc đến (mentions) giả tạo trên web.
s → entity không link knowledge graph
- Content fluff đầu bài → AI không cite được (skip intro)
- Pronoun ambiguous, không subject-verb-object rõ → AI hiểu sai
- Bỏ qua original data + research → AI ưu tiên content khác
- Optimize 1 engine (Google AIO), bỏ qua ChatGPT/Perplexity
- Hallucination không monitor → reputation drift
- Không track AI search referral → không biết traffic từ AI
- Featured snippet format không match (Google muốn list, mình viết paragraph)
