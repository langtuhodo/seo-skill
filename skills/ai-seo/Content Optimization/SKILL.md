# AI Content Optimization — Tối ưu nội dung cho AI Search

## 1. Purpose / Mục đích
AI Search (Google AI Overviews/SGE, ChatGPT Search, Perplexity, Claude, Bing Copilot) đang thay đổi cách user tìm thông tin: thay vì click 10 link, họ đọc 1 câu trả lời tổng hợp. Skill này định nghĩa cách viết content **được AI tham chiếu (cited)** trong câu trả lời, không chỉ rank top 10 truyền thống. Đây là tầng SEO mới đi cùng (không thay thế) classic SEO.

## 2. Core Concepts / Khái niệm cốt lõi

- **Generative SERP**: Google AI Overview (US/global rollout 2024–2025), tổng hợp câu trả lời từ multiple source.
- **Cite-ability**: khả năng content được AI cite. Khác với rank — AI có thể cite #5 thay vì #1.
- **Chunk**: AI ngắt content thành đoạn nhỏ. Mỗi đoạn cần stand-alone meaningful.
- **Semantic clarity**: subject-verb-object rõ. Không pronoun ambiguous.
- **Entity-based**: AI hiểu entity (Person, Place, Thing) hơn keyword.
- **Information density**: số fact/sentence cao → dễ cite.
- **Source authority**: AI ưu tiên domain trust + author EEAT.
- **Freshness**: AI prefer content recent cho topic time-sensitive.
- **Schema reinforcement**: schema giúp AI parse + verify.
- **Answer-first format**: đoạn đầu trả lời direct, sau đó bổ sung context.

## 3. When to use
- Mọi content informational mới publish từ 2024+.
- Khi audit content cũ chưa được AI cite.
- Khi target query có AI Overview đang serve.
- Với product/brand pages — AI có "mention" brand không?

## 4. Workflow Optimize for AI

### Bước 1. Identify queries có AI surface
- Search keyword target trong Google → có AI Overview xuất hiện không?
- Test trên ChatGPT, Perplexity, Claude.
- Note: AI Overview xuất hiện thường cho query informational, khoảng 15–60% query (varies theo niche).
- Tools: Authoritas, BrightEdge, Semrush AI Overview tracker.

### Bước 2. Audit cite-ability hiện tại
- Search query → AI answer.
- Check sources cited: bạn có trong list không?
- Nếu có: anchor cite text nào? Đoạn nào của bài bạn?
- Nếu không: ai được cite? Tại sao họ thay vì bạn?
- Track cite-rate qua thời gian.

### Bước 3. Answer-first writing
Đoạn đầu (50–100 từ) phải:
- Trả lời direct câu hỏi chính trong query.
- Không "bài viết này sẽ giới thiệu...".
- Subject-verb-object rõ.
- Definition + 1 fact + 1 implication.

Ví dụ:
**Bad**:
> "Trong bài viết này, chúng tôi sẽ tìm hiểu về Core Web Vitals và tại sao chúng quan trọng cho SEO."

**Good**:
> "Core Web Vitals là 3 metric đo trải nghiệm tải trang: LCP (≤ 2.5s), INP (≤ 200ms), CLS (≤ 0.1). Google đưa Core Web Vitals vào ranking factor từ 06/2021. Trang fail Core Web Vitals trên mobile thường thua trong cụm SERP cạnh tranh, đặc biệt với query commercial."

### Bước 4. Chunk-level optimization
AI chunking content theo đoạn 100–300 từ. Mỗi đoạn phải:
- Stand-alone: đọc được mà không cần đoạn trước.
- Topic clear (H2/H3 đề cập).
- Đáp 1 câu hỏi cụ thể.
- 1 fact / 1 statistic / 1 data point.
- Source citable (link tới authority).

### Bước 5. Information density
Kỹ thuật:
- **Replace fluff với fact**: thay "Title tag rất quan trọng" với "Title tag là 1 trong 3 ranking factor chính (theo Backlinko 2022 dựa trên 11.8M SERP)."
- **Specific number > vague**: "tăng 23%" thay vì "tăng đáng kể".
- **Named entity > generic**: "Google Search Console" thay vì "công cụ phân tích".
- **Cause-and-effect rõ**: "X gây ra Y bởi Z mechanism".

### Bước 6. Entity reinforcement
- Trong bài, mention entity bằng full name lần đầu, sau đó dùng abbreviation/pronoun với context.
- Cite source authoritative (Google docs, Wikipedia, organization official).
- Schema markup:
  - `Person` cho author (sameAs LinkedIn, Twitter, Wikipedia).
  - `Organization` cho brand.
  - `Article` với `mentions` cho entity reference.
- Internal link tới glossary / definition page để Google liên kết entity.

### Bước 7. Schema cho AI
Schema giúp AI verify content:
- Article + author Person.
- FAQPage cho Q&A.
- HowTo cho step process.
- ItemList cho rank list.
- Product cho item.
- BreadcrumbList.
- Speakable (cho voice + AI):
```json
{
  "@type": "Article",
  "speakable": {
    "@type": "SpeakableSpecification",
    "xpath": ["/html/head/title", "/html/body//*[@id='summary']"]
  }
}
```

(Xem skill Schema Markup.)

### Bước 8. Original data + research
AI ưu tiên content:
- Original survey / data study.
- Statistics roundup with citation.
- Case study với metric thực.
- First-hand experience (EEAT Experience).

→ Kỳ vọng kiếm cite hơn content tổng hợp.

### Bước 9. EEAT signal mạnh
- Author bio + Person schema + sameAs.
- Reviewer / fact-checker byline.
- Last updated date.
- Source citation inline.
- About page chi tiết.
- Editorial guideline page.

(Xem skill Content Optimization.)

### Bước 10. Format hỗ trợ AI parse
- TL;DR / key takeaway box ở đầu.
- Bullet point cho list.
- Numbered step cho process.
- Comparison table.
- FAQ section cuối bài.
- Glossary nếu thuật ngữ chuyên môn nhiều.

### Bước 11. Test với AI tool
- Hỏi Perplexity / ChatGPT / Claude câu hỏi target.
- Check brand/site mention không?
- Iteration: tweak content, re-test sau 2–4 tuần.

### Bước 12. Monitor cite + traffic
- AI search referral xuất hiện trong GA4 (chatgpt.com, perplexity.ai, gemini.google.com).
- Tracker AI: Authoritas, Semrush AI Overview, BrightEdge.
- Brand mention trong AI answer (qualitative monitoring).

## 5. Template AI-Friendly Content Block

```
## {H2 Question phổ biến}

**Trả lời ngắn (50-80 từ)**:
{Direct answer with 1-2 fact + 1 number + 1 entity name}

**Tại sao điều này quan trọng**:
- {Bullet với metric}
- {Bullet với ví dụ cụ thể}
- {Bullet với consequence}

**Cách thực hiện**:
1. {Step 1 với verb-led + specific}
2. {Step 2}
3. {Step 3}

**Ví dụ thực tế**:
{1 case study brand cụ thể với metric}

**Source**:
- {Authoritative source link}
- {Original data internal}
```

## 6. KPI đo lường
- # query có AI Overview mà bạn được cite.
- AI search referral traffic (chatgpt, perplexity, gemini).
- Brand mention rate trong AI answer (qualitative).
- AI Overview position trong page (cite #1 vs #5).
- Click-through từ AI cite tới site.
- Featured Snippet retention (FS chuyển thành AI cite).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Perplexity Pro | Paid | Test cite + citation tracking |
| ChatGPT Search | Paid | Test cite |
| Authoritas | Paid | AI Overview tracker |
| Semrush AI Overview | Paid | AI Overview track |
| BrightEdge | Paid | Enterprise |
| Frase / Surfer | Paid | Brief AI-friendly format |
| Schema App | Paid | Schema scale |
| Google Search Generative Experience (Labs) | Free | Test AI Overview |
| Bing Copilot | Free | Test cite Bing |
| GA4 Source/Medium filter | Free | AI referral track |

### Prompt LLM check cite-ability
```
Bạn là Google AI Overview engine. Đọc đoạn content sau, sau đó trả lời câu hỏi "{query}". Trong câu trả lời, cite nguồn nào và đoạn cụ thể nào của content sẽ được citation? Nếu content không đủ rõ để cite, gợi ý chỉnh sửa.
[paste content + query]
```

## 8. Common mistakes
- Content fluff đầu bài "Trong thời đại số ngày nay...".
- Trả lời gián tiếp, không direct.
- Pronoun ambiguous: "Nó giúp tăng SEO" — "nó" là gì?
- Specific number thiếu → AI không có gì để cite.
- Không cite source authoritative → AI không trust.
- Không có schema → AI parse khó hơn.
- Author byline thiếu → EEAT yếu.
- Bài quá dài, không scannable → AI không locate được chunk.
- Bỏ qua FAQ section → mất cite cho query pattern question.
- Không test với AI tool → không biết hiện trạng.
- Tracking AI search referral không setup.
- Tin rằng "rank #1 = AI cite" — không đúng. AI cite phụ thuộc structure + EEAT.
- Optimize chỉ cho Google AI, bỏ qua ChatGPT/Perplexity (mỗi engine có ưu tiên riêng).
- Stuffing entity unnaturally → quality drop.
- Quên freshness signal cho topic time-sensitive.
- Không kết hợp với classic SEO — AI cite nhưng rank #50, traffic từ AI cite vẫn cần ranking signal cơ bản.

---
**Đầu ra**: content được optimize cho cả classic SERP + AI cite, có structure + EEAT + entity + schema phù hợp AI parse.
