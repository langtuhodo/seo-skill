# Generative SEO — SEO trong kỷ nguyên Generative AI

## 1. Purpose / Mục đích
Generative SEO (đôi khi gọi GEO — Generative Engine Optimization) là chiến lược đảm bảo brand/content xuất hiện **trong câu trả lời do AI generate** (Google AI Overviews, ChatGPT Search, Perplexity, Claude, Bing Copilot, Gemini). Khi user dần shift từ click-through sang AI summary, "thắng AI" trở thành lớp SEO mới. Skill này định nghĩa playbook tổng thể (kết hợp với AI Content Optimization, NLP Optimization, LLM Visibility).

## 2. Core Concepts / Khái niệm cốt lõi

- **Zero-click search trend**: AI Overview trả lời ngay → click giảm ~30-60% cho query informational.
- **Citation moat**: brand được cite trong AI answer = mới "thắng" — không phải rank #1.
- **Multi-engine**: Google AI Overview / ChatGPT / Perplexity / Bing Copilot / Gemini có behavior khác nhau.
- **Training data vs Live retrieval**: GPT-4 training data cutoff; Perplexity + Bing Copilot retrieve live; Google AI Overview hybrid.
- **Influence path**:
  1. Live retrieval engines (Perplexity, ChatGPT Search, Bing Copilot, Google AI Overview): cần SEO + structure.
  2. Training-data engines (ChatGPT default, Claude default): cần content được cite/quote rộng rãi trên web để vào training corpus.
- **Brand/entity recognition**: AI biết brand mình là gì + làm gì.
- **Sentiment in AI answer**: positive vs neutral vs negative khi AI describe brand.
- **Cite rate per platform**: track brand mention/cite trên từng AI engine.

## 3. When to use
- Khi audit visibility AI.
- Khi build SEO strategy 2025+.
- Khi launch product mới — cần AI biết.
- Khi brand mention dropping.
- Khi audit cluster cho "AI-readiness".

## 4. Workflow Generative SEO

### Bước 1. Audit current AI visibility

Test query (per ngách) trên:
- Google AI Overview (Search Labs).
- ChatGPT Search (paid).
- Perplexity (free + paid).
- Bing Copilot (free).
- Claude (paid).
- Gemini (free).

Cho mỗi query:
- Brand mình có được mention/cite không?
- Cite #1, #2, #3?
- Sentiment AI describe brand?
- Source nào AI cite (mình + đối thủ)?

### Bước 2. Topical strategy AI-friendly

Categorize content:
- **Direct cite-able**: How-to, definition, statistics, comparison, list — AI hay cite.
- **Brand awareness**: brand-page, about, founder story → vào training corpus dài hạn.
- **Conversion**: pricing, product page → thường KHÔNG được AI cite (transactional). Vẫn cần optimize classic.

Ưu tiên tier 1 + 2 cho Generative SEO push.

### Bước 3. Cite-engine strategies

**Live retrieval (Perplexity, ChatGPT Search, Bing Copilot, Google AI Overview)**:
- Classic SEO foundation (rank top 10–20 cho query).
- Answer-first writing (skill AI Content Optimization).
- Schema rich (Article + Person + Organization + FAQ).
- EEAT signal mạnh.
- Freshness + lastmod.
- robots.txt allow respective bots:
  - GPTBot (OpenAI)
  - ClaudeBot (Anthropic)
  - PerplexityBot
  - Googlebot, Google-Extended (Google AI separate)
  - Bingbot
  - CCBot (Common Crawl — feed cho nhiều LLM)

**Training-data engines (ChatGPT default GPT-4, Claude default)**:
- Brand mention rộng (Wikipedia, GitHub, Reddit, YouTube transcript).
- Open-source / educational content được cite trong tutorials, courses.
- Be quoted in major publications (Digital PR).
- HuggingFace / arXiv / paper với brand / product mention.
- StackOverflow / GitHub README.

### Bước 4. Wikipedia entity (nếu eligible)
Wikipedia là nguồn training mạnh cho LLM. Có entry Wikipedia cho brand/founder = tăng AI visibility đáng kể.
- Cần notability (≥ 3 indep significant source).
- Do người khác viết (conflict of interest).
- Cite source authoritative.

### Bước 5. Reddit + community presence
Reddit data đã được cấp license cho Google + nhiều LLM. Brand mention trên subreddit ngách = có ảnh hưởng AI cite.
- Joining subreddit ngách; value-first comment.
- Founder AMA.
- Branded subreddit (xác minh).
- Quora answer (Google index — vào AI Overview).

### Bước 6. Schema + structured data deep
Cho mọi page core:
- Organization (sameAs Wikipedia, Crunchbase, LinkedIn, Twitter).
- Person cho author/founder (sameAs).
- Article + mentions.
- Product (cho ecommerce).
- SoftwareApplication (cho SaaS).
- HowTo + FAQPage.
- Breadcrumb.
- Speakable.

### Bước 7. Statistic + original data
LLM yêu thích cite stat + research với attribution.
- Publish 1 nghiên cứu/quý.
- "X statistics 2025" page evergreen.
- Press kit + dataset download.
- Distribute via Digital PR.

### Bước 8. Content distribution to training corpus
Để vào training data:
- Open content (no paywall).
- HTML clean (no JS-only render).
- Allow AI bot crawl (robots.txt).
- Cite rộng từ site authority (Wikipedia, .edu, .gov, major news, GitHub).
- Quote trong podcast transcript (YouTube auto-caption indexable).
- Course platform (Coursera, Udemy) với brand reference.

### Bước 9. Track + iterate
**Tracking tools**:
- Authoritas: AI Overview tracker.
- Semrush AI Overview / AI Tracker.
- BrightEdge.
- Manual: weekly check 20 query strategic trên 5 engine.
- AI Visibility Tracker (Profound, Otterly, Pulse — emerging tools).

Metrics:
- Cite rate per engine.
- SOV in AI answer.
- Sentiment.
- Position trong cite list.
- Click-through từ AI cite.

### Bước 10. Govern AI bot policy
robots.txt decision:
- Allow tất cả AI bot (lưu lượng training + visibility).
- Block training but allow live retrieval (vd Google-Extended block).
- Block tất cả → mất visibility AI.

(Xem skill Crawlability + LLM Visibility.)

Recommend default: ALLOW. Trừ khi có lý do mạnh (paywall, legal, content unique IP).

## 5. Template AI Visibility Audit

| Engine | Query | Brand cited? | Position | Sentiment | Source ours/competitor | Notes |
|---|---|---|---|---|---|---|
| Google AI Overview | "best SEO tool" | Yes | #2 | Positive | ours | Cite 1 stat |
| Perplexity | "best SEO tool" | No | - | - | competitor | Need optimize |
| ChatGPT Search | "best SEO tool" | Yes | #1 | Positive | ours | |
| Bing Copilot | ... | ... | ... | ... | ... | |
| Claude | ... | ... | ... | ... | ... | |

Run weekly cho 20–50 query strategic. Build dashboard.

## 6. KPI đo lường
- Cite rate per engine per query.
- Total AI search referral traffic (chatgpt.com, perplexity.ai, gemini.google.com).
- Brand mention sentiment trong AI answer.
- # query có AI Overview mà mình cite (vs total query có AI Overview).
- Wikipedia / authoritative source mention growth.
- Branded query growth (Google Trends).
- Conversion từ AI referral.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Authoritas | Paid | AI Overview track |
| Semrush AI Overview Tracker | Paid | AI tracking |
| BrightEdge | Paid | Enterprise AI visibility |
| Profound / Otterly / Pulse | Paid | Dedicated AI visibility tools |
| Perplexity Pro | Paid | Test cite |
| ChatGPT Search | Paid | Test cite |
| Bing Webmaster Tools | Free | Bing-specific |
| GA4 Source/Medium filter | Free | AI referral track |
| Schema App | Paid | Schema scale |
| robots.txt + log analysis | Free | AI bot visit log |
| Brand24 / Mention | Paid | Brand mention monitor |

### Sample query test list (per ngách)
```
- "best {tool category}"
- "{competitor} alternative"
- "what is {term}"
- "how to {verb} {topic}"
- "{topic} for {persona}"
- "{topic} statistics 2025"
- "is {brand} good"
- "{brand} review"
- "{topic} in {industry}"
- "{problem} solution"
```

## 8. Common mistakes
- Tin AI là replacement của classic SEO → AI cite vẫn cần SEO foundation.
- Block tất cả AI bot → mất visibility.
- Bỏ qua Wikipedia / Reddit / Quora — kênh ảnh hưởng training data lớn.
- Không track multi-engine — Google AI Overview ≠ ChatGPT Search.
- Không có schema rich → AI parse khó.
- Bỏ qua brand mention mass (Digital PR) → AI training data ít data về brand.
- Tin rằng paid LLM = SEO chính → consumer cũng dùng free tier.
- Không update content thường xuyên → AI cite outdated.
- Optimize cho generic query, bỏ qua "{brand} review", "{brand} vs X".
- Không monitor sentiment → AI describe brand sai.
- Spam comment forum để inject brand → bị flag.
- Tin Wikipedia self-edit là OK → conflict of interest, bị remove.
- Schema overstuff → spam.
- Tracking chỉ Google AI Overview, ngoài ra mù.
- Tin rằng "training data đã cutoff thì xong" — nhưng các engine retrain liên tục + retrieval layer bù.

---
**Đầu ra**: chiến lược toàn diện cho AI search visibility + multi-engine tracking + classic SEO foundation + distribution to training corpus + bot policy.
