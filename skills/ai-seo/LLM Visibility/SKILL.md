# LLM Visibility — Hiển thị brand trong LLM

## 1. Purpose / Mục đích
LLM Visibility là khả năng brand/sản phẩm/người được **mô tả chính xác + tích cực** khi user hỏi LLM (ChatGPT, Claude, Gemini, Perplexity, Llama-based assistants). Skill này tập trung vào layer training data + retrieval augmentation, kèm bot policy + monitoring. Khác với Generative SEO (focus citation), LLM Visibility focus vào **brand knowledge representation trong model**.

## 2. Core Concepts / Khái niệm cốt lõi

- **Training data**: corpus dùng để train model. Brand có trong đó = LLM "biết".
- **Cutoff date**: model có training cutoff. Sau cutoff, brand mới không "biết" trừ khi retrieval.
- **Retrieval Augmented Generation (RAG)**: model + live search → fetch fresh data.
- **Web crawl bots cho LLM**:
  - GPTBot (OpenAI training)
  - ChatGPT-User (ChatGPT browsing)
  - ClaudeBot (Anthropic training)
  - Claude-Web (Claude live)
  - PerplexityBot (Perplexity)
  - Bytespider (ByteDance/TikTok)
  - CCBot (Common Crawl, feed nhiều LLM open-source)
  - Google-Extended (Google AI separate from Search)
  - FacebookBot, FriendlyCrawler
  - applebot-extended (Apple Intelligence)
- **Robots.txt policy**: control bot nào được crawl.
- **Brand entity**: LLM phải có entity rõ ràng cho brand.
- **Hallucination**: LLM bịa thông tin về brand → reputation risk.
- **Sentiment**: LLM mô tả brand positive / neutral / negative.
- **Source authority**: LLM ưu tiên source uy tín khi retrieval.

## 3. When to use
- Khi audit hiện trạng AI/LLM visibility.
- Khi launch brand mới → cần vào training corpus sớm.
- Khi LLM có hallucinate sai về brand.
- Khi setup robots.txt + bot policy lần đầu.
- Quarterly audit.

## 4. Workflow LLM Visibility

### Bước 1. Audit current LLM knowledge
Test prompt cho mỗi LLM (free + paid):
```
1. "Tell me about {brand}."
2. "What does {brand} do?"
3. "Who founded {brand}?"
4. "Compare {brand} vs {competitor}."
5. "Is {brand} reliable?"
6. "What are {brand}'s products?"
7. "Pricing of {brand}."
8. "{brand} customer reviews summary."
9. "{brand} news 2024."
10. "How to use {brand}."
```

LLM list: ChatGPT (4o, o1), Claude (3.5 Sonnet, Opus), Gemini (1.5 Pro), Perplexity, Llama-based (Meta AI), Mistral.

Ghi nhận:
- LLM biết brand không?
- Mô tả đúng/sai?
- Sentiment positive/neutral/negative?
- Hallucinate (claim sai)?
- Source cite (nếu retrieval) là gì?

### Bước 2. Knowledge gap matrix

| Prompt | ChatGPT | Claude | Gemini | Perplexity | Notes |
|---|---|---|---|---|---|
| "What is {brand}" | Correct | Hallucinate | Don't know | Correct via Wikipedia | ... |

Identify gap để focus.

### Bước 3. Distribution to training corpus

**Public-web sources mạnh nhất cho training**:
1. **Wikipedia** (highest authority).
2. **Wikidata** (structured entity).
3. **GitHub README** (cho dev brand).
4. **Reddit** (Google + nhiều LLM license data).
5. **Quora**.
6. **StackOverflow / StackExchange**.
7. **YouTube transcript** (auto-caption indexable).
8. **Major news / publication** (Digital PR).
9. **arXiv** (cho research-driven brand).
10. **Course platform** (Coursera, Udemy, edX).
11. **Podcast transcript** (đăng + transcript public).
12. **Twitter / X** (Grok có direct access; nhiều LLM training cũng gồm).
13. **Open-source dataset** (HuggingFace, Kaggle).

Strategy:
- Wikipedia: viết do người khác (nếu eligible).
- Wikidata: tạo entity structured.
- GitHub: open-source tool / docs / case study.
- Reddit: presence + AMA.
- Quora: answer with brand context.
- YouTube: video + transcript.
- Press: Digital PR (skill).
- Podcast: founder guest.
- arXiv: paper với brand affiliation.
- Course: contribute / sponsor.

### Bước 4. Retrieval optimization (live)
Engines như Perplexity, ChatGPT Search, Bing Copilot retrieve live. Cần:
- Classic SEO + AI Content Optimization (skill).
- robots.txt allow bot.
- Schema rich.
- Freshness.
- Authority site.

### Bước 5. Bot policy

**robots.txt template**:
```
# Default allow crawl
User-agent: *
Disallow:

# Search engines
User-agent: Googlebot
Allow: /
User-agent: Bingbot
Allow: /

# AI training bots
User-agent: GPTBot
Allow: /
User-agent: ClaudeBot
Allow: /
User-agent: PerplexityBot
Allow: /
User-agent: CCBot
Allow: /
User-agent: anthropic-ai
Allow: /

# AI live browsing bots
User-agent: ChatGPT-User
Allow: /
User-agent: Claude-Web
Allow: /

# Google AI separate (Bard, AI Overview)
User-agent: Google-Extended
Allow: /

# Apple Intelligence
User-agent: applebot-extended
Allow: /
```

Quyết định:
- **Allow all** (default): max visibility, lose IP control.
- **Block training, allow live**: keep brand mention via live retrieval but not bake into model.
- **Block all**: max IP protection, lose visibility.

Recommend: ALLOW for marketing site. BLOCK for proprietary docs / paid content.

### Bước 6. Schema + entity reinforcement
(Xem skill NLP Optimization.)
- Organization schema.
- Person schema cho founder.
- sameAs Wikipedia, Wikidata, Crunchbase, LinkedIn, Twitter, Facebook, YouTube.
- Article + mentions cho brand reference.
- Product / SoftwareApplication.

### Bước 7. Content audit cho LLM-friendliness
- Brand description page (`/about/`) chi tiết, factual.
- Founder bio.
- FAQ về brand: "What is X", "Who owns X", "How does X work", "X pricing", "X vs Y".
- Press kit page (`/press/`) với boilerplate, logo, key fact.
- Customer logo + case study.
- Product page với clear positioning.

### Bước 8. Monitor sentiment + hallucination
Tools:
- Manual quarterly test (Bước 1).
- Profound / Otterly / Pulse: AI brand monitoring.
- Brand24 / Mention với keyword "{brand} chatgpt", "{brand} ai".

Khi phát hiện hallucination:
- Tạo content factual cụ thể về điểm sai.
- Pitch correction trên Wikipedia / Wikidata.
- Reach out OpenAI/Anthropic feedback (limited recourse).
- Live retrieval engines: optimize SEO content correct.

### Bước 9. AI bot crawl monitoring
Server log analysis:
- Bot UA frequency.
- Pages bot crawl.
- Bandwidth (GPTBot có thể crawl mạnh).
- 404 / 5xx ratio for bot.

Adjust robots.txt nếu bot abuse.

### Bước 10. Quarterly review
- Test 10 prompt × 5 LLM.
- Compare vs quý trước.
- Action plan cho gap.
- Adjust bot policy.

## 5. Template Bot Policy + Audit Sheet

```
# AI Bot Policy
- GPTBot: Allow / Block / Limited
- ClaudeBot: Allow / Block
- ...
Reasoning: ...
Last reviewed: ...

# Audit run
Date: ...
Prompts tested: 10
LLMs: ChatGPT, Claude, Gemini, Perplexity, Bing Copilot

Findings:
- {LLM}: {accuracy} / {hallucination} / {sentiment}
- ...

Action:
- Wikipedia entry update
- Press release distribute
- About page enrich
- Schema sameAs add
```

## 6. KPI đo lường
- LLM brand recognition rate (% prompt biết brand).
- Accuracy rate (% prompt mô tả đúng).
- Sentiment score average.
- Hallucination count.
- Citation count khi LLM retrieval.
- AI search referral traffic.
- Wikipedia entry status (exists / quality).
- Wikidata entity completeness.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| ChatGPT, Claude, Gemini, Perplexity | Free/Paid | Manual prompt test |
| Profound / Otterly / Pulse | Paid | AI brand monitoring |
| Authoritas | Paid | AI Overview track |
| Brand24 / Mention | Paid | Mention + AI mention |
| Wikidata Query | Free | Entity validation |
| Wikipedia | Free | Entry quality |
| Schema App | Paid | Schema scale |
| Server log analyzer (GoAccess, Screaming Frog Log Analyzer) | Free/Paid | Bot crawl |
| robots.txt tester | Free | Validate |
| HuggingFace dataset search | Free | Check brand in open dataset |

## 8. Common mistakes
- Block tất cả AI bot mà chưa cân nhắc visibility.
- Bỏ qua Wikipedia / Wikidata vì "small brand" — entity hữu ích kể cả nhỏ.
- Hallucination bỏ qua → brand reputation drift.
- Sentiment monitoring không thường xuyên.
- Bot crawl flood site → server cost + chậm user (cần rate-limit).
- robots.txt sai cú pháp → bot ignore directive.
- Không có press kit → LLM cite source không kiểm soát.
- About page sơ sài → LLM mô tả không đủ.
- Schema sameAs thiếu → entity không link knowledge graph.
- Chỉ optimize cho ChatGPT — bỏ qua Claude, Gemini, Perplexity.
- Tin rằng training cutoff = stale forever — model retrain regularly.
- Không monitor change của LLM behavior (versioning, retraining, RAG update).
- Distribution chỉ owned channel — bỏ Wikipedia, Reddit, Quora.
- Tin rằng SEO classic không liên quan AI — sai. Live retrieval phụ thuộc SEO.
- Không document policy rõ ràng — team confused về stance.
- Trying to "trick" LLM với prompt injection trên website → có thể bị flag spam.

---
**Đầu ra**: bot policy rõ + brand entity reinforcement (Wikipedia/Wikidata/schema/sameAs) + distribution to training corpus + sentiment monitoring + audit cadence quarterly.
