# Playbook — AI / LLM Visibility Audit

**Mục tiêu**: audit + optimize hiện trạng brand trong AI search engine + LLM (Google AIO, ChatGPT, Claude, Gemini, Perplexity, Bing Copilot).

**Đầu vào**: brand + 20 query strategic + access 5 LLM (free + paid).

**Đầu ra**: gap report + action plan + tracking dashboard.

**Skill liên quan**: AI SEO toàn bộ 5 skill, Technical SEO/Schema Markup, Off-page/Brand Mentions, Off-page/Digital PR, Growth/Topical Authority.

---

## Phase 1 — Define query set (Day 1)

### Query types (build 20-50)

**A. Direct brand**:
- "What is {brand}"
- "{brand} review"
- "{brand} vs {competitor}"
- "Is {brand} good"
- "{brand} pricing"
- "How to use {brand}"
- "{brand} alternatives"
- "{brand} customer support"
- "{brand} pros and cons"
- "{brand} integration with {other tool}"

**B. Category**:
- "Best {category}"
- "Top {category} 2025"
- "{category} for {persona}"
- "{category} comparison"
- "Free {category}"
- "{category} features compare"

**C. Problem-oriented**:
- "How to {do task}"
- "Why is {problem}"
- "Best way to {action}"
- "{tool category} for {use case}"

**D. Statistic + research**:
- "{topic} statistics 2025"
- "{topic} trends"
- "{topic} report"

**E. Industry**:
- "{industry} best practices"
- "Future of {industry}"

## Phase 2 — Multi-engine test (Day 2-3)

Run 20-50 query × 5 engine = 100-250 test.

Engine list:
1. **Google AI Overview** (Search Labs activated, country target).
2. **ChatGPT Search** (paid GPT-4o + browsing).
3. **Perplexity** (free tier OK).
4. **Bing Copilot** (free).
5. **Claude.ai** (paid 3.5 Sonnet).
6. **Gemini** (free 1.5 Pro / Flash).
7. **You.com** (optional).
8. **Meta AI** (optional, Llama-based).

Per query record:
- Brand mentioned: Y/N.
- Position trong cite list (#1, #2, ...).
- Sentiment: positive / neutral / negative.
- Accuracy: correct / partial / incorrect / hallucinate.
- Source cited: list URL.
- Source mình hay competitor.

## Phase 3 — Gap matrix (Day 3)

| Query | Google AIO | ChatGPT | Perplexity | Claude | Gemini | Bing Copilot | Notes |
|---|---|---|---|---|---|---|---|

Mark coverage. Calculate:
- Cite rate per engine.
- Cite rate per query type (direct brand vs category vs problem).
- Sentiment avg.
- Accuracy avg.
- # hallucination found.

Identify:
- **High-priority gap**: query strategic mà không cite + competitor cite.
- **Inaccuracy fix**: hallucinate cần correct.
- **Negative sentiment**: cần address.

## Phase 4 — Diagnose root cause (Day 4)

Per gap, hỏi:

### A. Live retrieval gap (Perplexity, ChatGPT Search, Bing Copilot, Google AIO)
- Bài mình rank top 10 cho query không?
- Bài mình answer-first, schema rich, EEAT?
- Bot policy allow GPTBot, ClaudeBot, PerplexityBot, Google-Extended?
- Site speed + indexing OK?

### B. Training data gap (ChatGPT default, Claude default, Gemini)
- Brand có Wikipedia entry không?
- Wikidata entity complete?
- Reddit / Quora mention rộng?
- GitHub README cho dev brand?
- Press coverage đa dạng?
- YouTube transcript public?
- arXiv / paper cite?
- Course platform mention?

### C. Schema + entity gap
- Organization schema sameAs đầy đủ?
- Person schema cho founder/author?
- Article + mentions cho entity reference?
- Product / SoftwareApplication schema?

### D. Sentiment / reputation gap
- Recent negative review trên G2 / Trustpilot / Reddit?
- News article tone?
- Social media presence quality?
- About page outdated?

## Phase 5 — Action plan (Day 4-5)

Per gap → action.

### A. Foundation (Week 1-2)
- Update robots.txt: allow GPTBot, ClaudeBot, PerplexityBot, Google-Extended, applebot-extended, ChatGPT-User, Claude-Web.
- Verify schema rich tất cả page core: Organization + sameAs (Wikipedia, LinkedIn, Twitter, Crunchbase, YouTube, GitHub), Person cho founder, Article + mentions, Product / SoftwareApplication.
- About page enrich: founding date, founder bio, mission, key fact factual.
- Press kit page (`/press/`) với boilerplate, logo download, key statistic.
- FAQ page brand: "What is X", "Who owns X", "How does X work", "X pricing", "X vs Y".

### B. Content optimization (Week 2-4)
- Refresh top 20 organic landing với answer-first writing 50-100 từ đầu (skill AI Content Optimization).
- Add TL;DR / key takeaway box.
- Add FAQ section + FAQPage schema.
- Add original statistic / data point.
- Add author byline + Person schema sameAs.
- Last-updated date visible.

### C. Distribution to training corpus (Month 1-3)
- **Wikipedia**: nếu eligible (≥ 3 indep significant source), có người khác viết.
- **Wikidata**: tạo entity structured + sameAs.
- **GitHub**: open-source tool / docs / case study public repo.
- **Reddit**: presence trên 3-5 subreddit ngách + AMA founder.
- **Quora**: 20-30 answer comprehensive về brand topic.
- **YouTube**: video + transcript + chapter + description optimize.
- **Podcast**: founder guest 5-10 podcast/quarter, transcript public.
- **Press**: Digital PR campaign 1-2/quý (skill).
- **Course / education**: contribute / sponsor.
- **arXiv / paper**: nếu research-driven brand.

### D. Live retrieval optimization (Week 2-4)
- Classic SEO foundation: rank top 10 cho query target.
- Schema rich (Article + FAQ + HowTo + Speakable).
- Author EEAT.
- Freshness + lastmod accurate.
- Internal link cluster mạnh.

### E. Sentiment + reputation (Month 1-2)
- Monitor + respond review G2 / Trustpilot / Reddit.
- Address negative news article (PR response).
- Boost positive case study + customer logo.
- Press release positive milestone.

### F. Hallucination correction
- Tạo content factual cụ thể về điểm sai.
- Pitch correction Wikipedia / Wikidata.
- Distribute correct information rộng.
- Schema reinforcement.
- (Limited recourse với LLM training — chủ yếu chờ retrain cycle.)

## Phase 6 — Tracking dashboard (Week 1)

Build dashboard:
- Cite rate per engine per query type.
- Sentiment trend.
- Accuracy trend.
- AI search referral traffic GA4 (chatgpt.com, perplexity.ai, gemini.google.com).
- Brand mention sentiment (Brand24 / Mention).
- Wikipedia / Wikidata entity completeness score.
- Bot crawl activity (server log per UA).

Tools:
- Authoritas / Semrush AI Overview / BrightEdge.
- Profound / Otterly / Pulse.
- Manual quarterly audit (Phase 1-3).
- Looker Studio dashboard.

## Phase 7 — Cadence (ongoing)

- **Weekly**: monitor tracker + alert sentiment.
- **Monthly**: 10-query mini-audit re-test.
- **Quarterly**: full audit (20-50 query × 5 engine) + action plan refresh.
- **Yearly**: strategy review.

---

## Template AI Visibility Audit Report

```markdown
# AI/LLM Visibility Audit — {Brand} — {Date}

## Executive summary
- Cite rate avg: X%
- Top engine: ...
- Worst engine: ...
- Critical hallucination: ...

## Coverage matrix
[Bảng 20 query × 6 engine]

## Per-engine analysis
### Google AI Overview
- Cite rate: X%
- Sentiment: ...
- Top finding: ...

### ChatGPT Search / Default
- ...

[etc.]

## Top gap
1. {Query}: not cited on {engines}, competitor {X} cited
2. ...

## Hallucination found
1. {LLM} claims {wrong fact} — actual: {correct}
2. ...

## Action plan

### Week 1-2 (foundation)
- [ ] robots.txt allow AI bot
- [ ] Schema sameAs Wikipedia, ...
- [ ] Press kit page
- [ ] FAQ brand page

### Month 1-2 (content + distribution)
- [ ] Refresh top 20 page answer-first
- [ ] Wikipedia entry attempt
- [ ] Wikidata entity create
- [ ] Reddit presence 3 subreddit
- [ ] 5 podcast guest

### Month 2-3 (PR + reputation)
- [ ] Digital PR campaign 1 (data study)
- [ ] G2 / Trustpilot review boost
- [ ] Founder LinkedIn series

## Tracking
- Tools: ...
- Cadence: weekly / monthly / quarterly
- Owner: ...

## Re-audit date
- {Date 90 days from now}
```

## KPI Playbook
- Cite rate per engine.
- Cite rate growth quarterly.
- AI search referral traffic.
- Brand mention sentiment trend.
- Wikipedia entity status.
- Wikidata completeness.
- # hallucination found vs corrected.
- Bot crawl activity (GPTBot etc visit count).

## Common pitfall
- Audit 1 engine only (Google AIO) → bỏ qua ChatGPT, Perplexity, Claude.
- Test 1 lần không re-audit → AI engine update liên tục.
- Block AI bot full → mất visibility.
- Allow AI bot nhưng schema thiếu → bot không parse.
- Hallucination ignore → reputation drift.
- Không track AI search referral → ROI mù.
- Tin Wikipedia self-edit OK → conflict of interest, bị remove.
- Schema overstuff entity → spam signal.
- Bỏ qua negative sentiment trên Reddit / Trustpilot → vào training data.
- Không có press kit → LLM cite source uncontrolled.
- Quên update About page sau pivot brand.
- Distribution chỉ owned channel — bỏ Wikipedia, Reddit, Quora, GitHub.
- Tin "training cutoff = stale forever" → engines retrain.
- Manual prompt audit không document → tiến độ invisible.
- Compare cite rate bằng absolute thay vì segment query type.
