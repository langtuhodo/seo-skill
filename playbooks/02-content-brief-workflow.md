# Playbook — Content Brief Workflow

**Mục tiêu**: từ keyword cluster → content brief đủ chi tiết để writer viết bài rank top 5.

**Đầu vào**: cluster + head keyword + intent + URL plan.

**Đầu ra**: brief 1-2 trang trong Notion/Doc + writer assigned.

**Skill liên quan**: Strategy/Search Intent, Content SEO/Blog Content, Content SEO/Topic Clusters, AI SEO/Content Optimization, AI SEO/NLP Optimization, On-page SEO (toàn bộ 7 skill).

---

## Phase 1 — SERP analysis (30 phút)

1. Search head keyword incognito country target.
2. Note SERP landscape:
   - AI Overview present? Cite source nào?
   - Featured Snippet? Format (paragraph, list, table)?
   - PAA top 4 question.
   - Top 10 organic: blog / pillar / listicle / video / forum?
   - Image Pack / Video Pack?
   - Sitelinks?
3. Top 5 result analyze:
   - Title pattern.
   - URL slug pattern.
   - Word count.
   - H2 / H3 outline.
   - Format (list, how-to, comparison, definition).
   - Visual count.
   - Schema (View source / Rich Results Test).
   - EEAT signal (author, last updated, citation).

## Phase 2 — Intent + Format decision (15 phút)

1. Dominant intent: I/N/C/T + sub-intent.
2. Format winner:
   - Listicle: top SERP toàn list "best X" / "top X".
   - How-to: top SERP toàn step-by-step.
   - Definition: "what is" / "X explained".
   - Comparison: "X vs Y".
   - Pillar: ngách rộng cần hub-and-spoke.
3. Length target = avg top 5 word count + 10-20%.
4. Visual target = avg top 5 visual + nguyên bản hơn.

## Phase 3 — Information gain (30 phút)

Information gain = giá trị mới brand mình mang lại mà top 5 chưa có:
- Original data / survey result.
- Personal experience / case study.
- Expert quote / interview.
- Visual nguyên bản (chart, diagram, screenshot).
- Tool / template download.
- Updated data 2025.
- Counterpoint / contrarian view.

Mỗi brief → ≥ 3 information gain points.

## Phase 4 — Entity research (20 phút)

(Skill NLP Optimization.)

1. Run Google NLP API trên top 3 SERP — extract entity + salience.
2. Cross-list entity → entity coverage list.
3. Mark entity nào MUST mention (salience > 0.05 ở top 3).
4. Glossary link target (entity nào có glossary page).
5. Schema mentions list.

## Phase 5 — Keyword + question (15 phút)

1. Primary keyword (head).
2. Secondary keyword 5-10 (cluster variant).
3. PAA question 4-6 → đưa vào FAQ.
4. AlsoAsked deep dive question → H2 / H3.
5. Question pattern "what / how / why / when / where / which".

## Phase 6 — Outline (30 phút)

```
H1 (≤ 60 ký tự, contain primary keyword, value-prop rõ)

Above-the-fold paragraph (50-100 từ, answer-first, AI-friendly):
- Direct answer câu hỏi chính.
- 1 statistic / fact.
- 1 entity name.

TL;DR / Key takeaway box:
- 3-5 bullet.

[Optional: TOC sticky]

H2 #1 — {Subtopic 1}
  Đoạn answer 50-80 từ.
  H3 detail #1
  H3 detail #2
  Visual: ...

H2 #2 — ...
H2 #3 — ...
...

H2 — FAQ
  H3 — Q1: ...
  H3 — Q2: ...
  ...

H2 — Conclusion / Next step
  CTA primary.
```

Cho mỗi H2:
- Subtopic + intent.
- Word count target.
- Visual idea.
- Internal link IN target (cluster sibling).
- Source citation cần.

## Phase 7 — Internal link plan

- IN ≥ 3: anchor + URL source.
- OUT ≥ 3: anchor + URL target.
- Cluster pillar link.
- Glossary link (cho entity).

## Phase 8 — Schema plan

- Article (default).
- FAQPage (nếu có FAQ section).
- HowTo (nếu tutorial).
- Product / Review (nếu commercial).
- BreadcrumbList.
- Speakable (cho AI).
- Person (author).
- Organization (publisher).

## Phase 9 — Visual plan

- Hero image (original > stock).
- Diagram / chart cho concept.
- Screenshot cho tool / process.
- Infographic embed link bait (nếu pillar).
- Video embed YouTube channel mình.
- Alt text 80-125 ký tự descriptive.

## Phase 10 — EEAT signal plan

- Author: ai viết? Person schema sameAs.
- Reviewer (optional): expert review byline.
- Original source citation inline.
- Last updated date visible.
- About page / Editorial guideline link footer.
- Original quote / experience / data.

## Phase 11 — Quality + AI guard

Brief instruct writer:
- KHÔNG paste raw AI output.
- AI assist OK cho draft 1, rewrite 50-80%.
- Voice + style guide tuân thủ.
- Source cite verify.
- Originality check: Originality.ai score < 30% AI.

## Phase 12 — Assign + timeline

- Writer (specialist > generalist).
- Editor.
- Designer.
- Deadline draft + edit + publish.
- Publish date confirmed.

---

## Template Brief (full)

```markdown
# Content Brief: {Title working}

## Meta
- Cluster: ...
- Primary keyword: ...
- Secondary keywords: ...
- Search volume: ...
- KD: ...
- Intent: ...
- Format: ...
- Target length: ... từ
- URL: /...
- Publish date: ...
- Owner writer: ...
- Owner editor: ...

## SERP analysis
- AI Overview: ...
- FS: ...
- PAA: ...
- Top 5 outline summary: ...

## Intent + Format
- Intent: ...
- Format: ...
- Why this format: ...

## Information gain (≥ 3)
1. ...
2. ...
3. ...

## Entity coverage (must mention)
- ...
- ...

## Outline
[H1, above-fold, TL;DR, H2-H3 với word target + visual + link]

## Internal link
IN:
- ...
OUT:
- ...

## Schema
- Article
- FAQPage
- ...

## Visual
- Hero: ...
- Diagram: ...
- ...

## EEAT
- Author: ...
- Last updated: ...
- Citation source: ...

## Quality guard
- AI assist OK, rewrite 50-80%
- Voice guide V2.1
- Originality < 30% AI

## Reference
- Top 5 SERP URL list
- Source authority list
```

## KPI Playbook
- # brief / sprint.
- Brief → publish cycle time.
- Bài rank top 10 sau 60 ngày từ publish (target ≥ 60%).
- Avg word count compliance.
- Editor review score (10-point rubric).

## Common pitfall
- SERP analysis qua loa — copy outline.
- Information gain bỏ qua → brief = competitor.
- Entity coverage thiếu → bài hời hợt.
- Outline vague — writer tự bịa.
- Schema không plan trước → publish thiếu.
- Author byline forget → EEAT yếu.
- AI guard không rõ → writer paste full AI.
- Timeline không realistic → brief vội.
