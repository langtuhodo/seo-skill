# Blog Content — Sản xuất nội dung blog

## 1. Purpose / Mục đích
Blog là kênh chính để chiếm TOFU/MOFU traffic, build topical authority, và nuôi dưỡng audience trước khi convert. Skill này định nghĩa **quy trình từ ý tưởng → publish → distribute → measure** cho 1 bài blog SEO chuẩn — không phải lý thuyết, mà là quy trình chạy được hằng tuần ở quy mô team.

## 2. Core Concepts / Khái niệm cốt lõi

- **Editorial calendar**: lịch publish có pillar + supporting + seasonal.
- **Content brief**: tài liệu ngắn cho writer, gồm keyword, intent, outline, USP.
- **Information gain**: bài cần có gì khác top 10.
- **Voice & style guide**: tone, persona, không từ cấm, format chuẩn.
- **Editorial workflow**: ideate → brief → draft → edit → SEO check → publish → distribute → measure → refresh.
- **Content velocity**: số bài / tuần. Không phải càng nhiều càng tốt; quality first.
- **Distribution flywheel**: blog → email → social → community → backlink → re-rank.

## 3. When to use
- Mỗi tuần / mỗi sprint sản xuất nội dung.
- Khi onboard writer mới (skill này = SOP).
- Khi audit pipeline (vì đâu publish chậm? quality không đều?).

## 3.5. Load Project Context (BẮT BUỘC nếu viết cho dự án cụ thể)

Đọc theo thứ tự ưu tiên — đồng bộ với Content Writing Phase -1 (v1.6):

| Thứ tự | File | Mục đích | Bắt buộc? |
|--------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` ⭐ | Quick Facts + Active Context + Pending Tasks + Recent Articles + Key Decisions → 80% context AI cần | ✅ ĐỌC TRƯỚC TIÊN |
| 2 | `projects/{project}/profile.md` | Brand voice, business context (chi tiết) | ✅ Nếu memory.md không đủ |
| 3 | `projects/{project}/topical.md` | Cluster hierarchy, role (pillar/supporting) | ✅ (nếu tồn tại) |
| 4 | `projects/{project}/keywords-urls.md` | Keywords đã publish → chèn internal link | ✅ (nếu tồn tại) |

> ⚠️ Nếu `memory.md` chưa tồn tại → copy `projects/memory-template.md`, fill Quick Facts từ profile.md, áp dụng Session End Protocol cuối phiên (xem section 8.5 bên dưới).
>
> Chi tiết: `skills/content/Content Writing/SKILL.md` Phase -1 + `skills/project-memory/SKILL.md`.

## 4. Workflow 9 bước

### Bước 1. Ideation
Sources:
- Keyword Map (skill Keyword Research) — pull keyword chưa có content.
- GSC queries có impression nhưng URL chưa cover.
- Customer support tickets (Pain → Topic).
- Sales objection list.
- Reddit/Quora/Group thread.
- Competitor content gap.
- Seasonal trend (Google Trends, Glimpse).
- AI tool: ChatGPT/Claude với prompt persona-based.

Mỗi tuần backlog ≥ 20 idea, sprint pick top 5–10.

### Bước 2. Validate idea
Mỗi idea check:
- Keyword target có SV ≥ ngưỡng?
- Intent match site mình?
- Bài cùng cluster đã có?
- Cơ hội rank thực tế (KD + DR site mình)?
- Có original angle / data / case không?

→ Drop idea nếu không pass.

### Bước 3. Content Brief
Brief gọn 1–2 trang gồm:
- Title working version
- **Keyword Map** (BẮT BUỘC — xem `Content Writing SKILL.md` Bước 0.5):
  - Primary keyword (1 keyword chính)
  - Secondary keywords (3-5 keywords phụ → dùng cho H2, meta)
  - Long-tail keywords (5-10 → dùng cho H3, FAQ)
  - LSI/Semantic terms (10-20 entity/thuật ngữ liên quan → rải trong body)
  - PAA questions (5-8 câu → dùng cho FAQ hoặc H3)
- Target keyword + secondary
- Intent + funnel
- URL slug đề xuất
- Word count range
- Top 3 SERP competitor URL
- Information gain (3 điểm sẽ làm tốt hơn)
- Outline H1-H3 (**H2 chứa secondary keyword, H3 chứa long-tail khi tự nhiên**)
- Entity/term phải cover (từ Keyword Map + NLP analysis)
- Internal link IN + OUT
- Visual cần (4–6 visual nguyên bản)
- CTA
- Author + reviewer
- Deadline

(Xem Playbook Content Brief Workflow.)

### Bước 4. Drafting
Quy tắc:
- Front-load answer 100 từ đầu.
- Active voice, "bạn"/"chúng ta".
- Câu ngắn, đoạn 2–4 dòng.
- 1 ý / đoạn.
- Specificity > generic.
- Original screenshot, anecdote, mini case study.
- Tránh fluff, tránh "as we all know".

Speed target: writer mid-level: 1500–2000 từ / ngày sau khi brief đủ.

### Bước 5. Edit (2 lượt)

**Lượt 1 — Content edit**:
- Đúng intent? Đúng audience?
- Information gain rõ?
- Logic flow hợp lý?
- Câu chuyện có hook + payoff?
- Có ví dụ + data?

**Lượt 2 — Copy edit**:
- Grammar, typo.
- Voice/style consistency.
- Số liệu cite đúng.
- Link check.
- Image caption + alt.

### Bước 6. SEO check (xem skill Content Optimization)
- Title tag tối ưu (**chứa primary keyword gần đầu**).
- Meta description (**chứa primary + secondary keyword, 150-160 ký tự**).
- H1-H3 structure (**H2 chứa secondary keywords, H3 chứa long-tail**).
- **Keyword coverage check**: primary keyword trong first 100 words + H1; secondary trong H2; LSI terms rải trong body; PAA trong FAQ.
- **Không nhồi keyword**: đọc to — nếu keyword lặp gượng ép → thay bằng biến thể/synonym.
- Keyword & entity coverage (NLP check nếu có Surfer/Frase).
- Image alt text **chứa keyword phù hợp** (mô tả ảnh + keyword tự nhiên).
- Internal link IN ≥ 3, OUT ≥ 3 (**mỗi URL khác nhau, không lặp cùng URL**).
- **⚠️ Mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất trong bài** — không lặp cùng URL ≥ 2 lần (để tránh spam pattern).
- Anchor text descriptive, không dùng "click here" / "xem thêm".
- Schema (Article + Person + FAQ nếu có).
- URL clean.
- Image optimized.
- Featured snippet candidate đoạn.
- Author bio + last updated.
- **Frontmatter đầy đủ theo `projects/content-template.md`** — bao gồm `meta_title` (50-60 ký tự) + `meta_description` (150-160 ký tự).

### Bước 7. Publish
- Schedule giờ peak audience (VN: 8h–10h sáng hoặc 20h–22h).
- Submit URL Inspection → Request Indexing.
- Add to sitemap (auto).
- Internal link: 3 bài cũ liên quan thêm link IN tới bài mới trong 7 ngày.
- Update related articles module.

### Bước 8. Distribution
- Email newsletter (open ≥ 30%).
- Social: LinkedIn, Twitter/X, Facebook, Threads, TikTok (carousel/short script repurpose).
- Community: Reddit subreddit phù hợp, Slack/Discord, Facebook Group, Skool.
- Outreach: ping 5–10 người được mention trong bài.
- Repurpose: video YouTube short, infographic, Twitter thread, LinkedIn carousel.
- Internal: Slack/Discord team, sales/CS biết để dùng.

### Bước 9. Measure & iterate
- 28 ngày: GSC position, impression, CTR.
- 60 ngày: traffic, conversion.
- 90 ngày: backlink, mention.
- 6 tháng: refresh nếu cần.
- Track theo cohort theo tháng publish.

## 5. Template Sheet — Editorial Calendar

| Slot | Title | Cluster | Pillar (Y/N) | Target KW | Intent | Word count | Author | Editor | Status (idea/brief/draft/edit/SEO/published/distributed) | Publish date | Distribution channels | Position 28d | Traffic 60d | Notes |

## 6. KPI đo lường
- # bài publish / tuần.
- # bài rank top 10 trong 60 ngày / total publish.
- Avg position 28 ngày.
- Avg traffic / bài 60 ngày.
- # backlink kiếm được / bài 90 ngày.
- Conversion rate inline CTA.
- Time-to-publish per article (idea → publish).
- Content quality score (rubric review nội bộ).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Notion / Airtable / Asana | Freemium | Editorial calendar |
| Google Docs / Coda | Free | Draft + comment |
| Grammarly / Hemingway | Freemium | Edit copy |
| Surfer / Frase / Clearscope | Paid | Brief + content score |
| Ahrefs Content Explorer | Paid | Idea + competitor angle |
| AnswerThePublic, AlsoAsked | Freemium | Sub-topic mining |
| ChatGPT/Claude | Freemium | Outline, draft assist (review trước publish) |
| Canva / Figma | Freemium | Visual nguyên bản |
| Loom | Freemium | Record explainer + embed |
| Beehiiv / ConvertKit / Mailchimp | Freemium | Newsletter |
| Buffer / Hypefury | Freemium | Distribution social |

## 7.5. Rare Attribute & Topical Context (SEO Trends 2026)

> Áp dụng cho MỌI bài blog. Xem chi tiết: `knowledge/16-seo-trends-2026.md`

- **Rare Attribute**: Mỗi bài blog phải có ít nhất 1-2 thông tin hiếm (dữ liệu gốc, kinh nghiệm thực tế, insight độc đáo). Nếu không có → đánh dấu `[CẦN BỔ SUNG RARE ATTRIBUTE]`
- **Topical Context Linking**: Mở bài + body phải kết nối ngữ nghĩa với category hierarchy (cha → con → cháu). Internal link chỉ mạnh 1/10 cho Topical Authority
- **Post-publish**: Chạy Phantom Keywords từ Search Console mỗi tháng (xem `Content Refresh SKILL.md` Bước 7.5)

## 8. Common mistakes
- Publish bừa không có brief → bài lệch intent.
- Chạy theo volume, content thin → tổn hại quality signal toàn site.
- Draft quá dài, fluff → loãng + dwell time thấp.
- Không có editor — writer self-edit → blind spot.
- Không distribute, chỉ "publish and pray".
- Không track per article → không học được pattern.
- Không refresh sau 6 tháng → bài chết dần.
- Dùng AI generate full bài không edit → spam content, vi phạm Helpful Content.
- Không có voice/style guide → mỗi writer 1 tone, brand không nhất quán.
- Bỏ qua internal link IN sau publish — cơ hội rank nhanh bị bỏ phí.
- Viết AI generic (mở bài template, đoạn đều đặn, không ví dụ cụ thể) → bị Google/detector nhận diện → giảm ranking.
- Thiếu Key Takeaways box đầu bài → mất cơ hội AI citation + reader bounce cao.

> ⚠️ **Anti-AI Detection**: Mọi bài blog PHẢI tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), Structural Replacement (2A-2F), Humanization Patterns (3.1-3.6), Self-Correction + Red Flag Check (Ruleset 4). MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: `skills/content/Content Writing/SKILL.md` (section 2.4). Đọc style profile trước khi viết.

## 8.5. Session End Protocol — Update Memory (BẮT BUỘC cuối phiên)

Trước khi report task completion cho user, AI BẮT BUỘC update `projects/{project}/memory.md` (checklist 7 điểm — đồng bộ Content Writing Phase 7):

```
[ ] Append entry mới vào Session History (date, CLI/model, task done, files touched, pending carry-over)
[ ] Append article vừa publish vào Recent Articles (date, title, URL, cluster, role)
[ ] Edit Active Context (cluster đang ưu tiên, content type focus, last_updated)
[ ] Edit Pending Tasks (xóa done, thêm mới phát sinh)
[ ] Append Key Decisions (style/kỹ thuật đã chốt phiên này)
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi (80% case: KHÔNG cần)
[ ] Commit memory.md trong cùng commit với bài viết (tránh memory dirty)
```

Chi tiết: `skills/project-memory/SKILL.md` + `skills/content/Content Writing/SKILL.md` Phase 7.

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.
**Đầu ra**: editorial calendar chạy đều, mỗi bài đi qua brief + workflow + measure, content quality + velocity tăng theo thời gian.
