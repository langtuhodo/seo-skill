# Content Refresh — Cập nhật nội dung

> **🛑 PRE-FLIGHT — ĐỌC TRƯỚC TIÊN, KHÔNG SKIP (v1.4 — fix bug output path)**
>
> **Trước khi refresh, AI BẮT BUỘC chạy 4 bước Path Validation (đồng bộ với Content Writing Phase -0.5):**
>
> 1. **Confirm intent là refresh** (không phải rewrite from scratch): user nói "viết lại", "refresh", "cập nhật", "tối ưu" + filename `.md` đã tồn tại → ĐÚNG là Content Refresh. Nếu user nói "viết lại hoàn toàn từ đầu" → route sang Content Writing (verdict 🟠 LÀM MỚI), KHÔNG dùng skill này.
> 2. **Locate file gốc**: tìm `{filename}` trong `projects/{project}/{writing,refresh,archive}/`. Nếu không tìm thấy → hỏi user 1 lần, KHÔNG đoán.
> 3. **Output BẮT BUỘC vào `refresh/`**: `projects/{project}/refresh/{slug-bai-cu}.md` (GIỮ NGUYÊN slug gốc của bài đã publish).
> 4. **TUYỆT ĐỐI KHÔNG** save vào:
>    - `projects/{project}/{slug}.md` (ROOT — chỉ chứa 5 file lõi) ← **bug đã ghi nhận**
>    - `projects/{project}/writing/{slug}.md` (writing/ chỉ cho bài MỚI, refresh ≠ mới)
>    - `projects/{project}/{cluster}/{slug}.md` (không nested cluster)
>
> **Anti-pattern bug đã ghi nhận**: User yêu cầu *"viết lại abc.md cho thép bảo tín"* → AI save thẳng vào `projects/thep-bao-tin/abc.md` (ROOT). **SAI**. Phải là `projects/thep-bao-tin/refresh/abc.md`. Xem chi tiết: `skills/content/Content Writing/SKILL.md` Phase -0.5.

> **Chuẩn 2026 bắt buộc**: Mỗi lần refresh là cơ hội đưa bài cũ lên chuẩn 2026. **Bài cũ chỉ rewrite meta khi refresh** (không batch update retroactive). Khi refresh: thêm Summary Chunk 40-60 chữ + Bite-sized H2 + Entity Mapping + meta_description ≤ 135 chars + ProfilePage schema cho tác giả + nhúng short-form video. Xem `knowledge/18-metadata-sop-2026.md` mục 9.

## 1. Purpose / Mục đích
Content refresh là **một trong 3 đòn bẩy SEO ROI cao nhất** (cùng với internal linking và title rewrite). Refresh đúng cách thường mang lại traffic uplift 50–200% trong 30–60 ngày, với chi phí 1/3 viết bài mới. Skill này định nghĩa khi nào, refresh thế nào, và đo lường impact.

## 2. Core Concepts / Khái niệm cốt lõi

- **Content decay**: bài giảm traffic theo thời gian do (a) đối thủ vượt, (b) Google update, (c) intent đổi, (d) outdated info.
- **Refresh ≠ Rewrite từ đầu**: refresh = update strategic. Rewrite = thay 70%+ content (rủi ro mất rank).
- **Trigger refresh**: traffic drop, position drop, info outdated, đối thủ mới.
- **Same URL, update content**: giữ URL + 301 không cần (URL không đổi).
- **lastmod signal**: update ngày `lastmod` trong sitemap + schema để Google re-crawl.
- **Compound effect**: refresh + new bài cùng tăng compound traffic.

## 3. When to use

Trigger:
- Bài rank top 10 nhưng tụt xuống top 11–30 (intent đã đổi hoặc đối thủ vượt).
- Traffic giảm ≥ 20% YoY hoặc ≥ 30% MoM.
- Bài thuộc cluster quan trọng nhưng underperform.
- Sau Google update lớn → audit cluster.
- Bài evergreen ≥ 12 tháng chưa refresh.
- Bài có data, năm, tool screenshot outdated.
- Striking distance keyword position 5–20.

Không refresh khi:
- Bài còn rank top 3 stable + no decline.
- Bài news/event đã hết relevance.
- Bài duplicate trong cluster (consolidate thay vì refresh).

## 3.5. Load Project Context (BẮT BUỘC nếu refresh cho dự án cụ thể)

Content Refresh là **task lặp định kỳ** (thường hằng quý hoặc bổ sung Phantom Keywords 1 tháng/lần). Memory.md cực quan trọng vì **nếu không nhớ bài nào đã refresh, AI sẽ refresh trùng**. Đọc theo thứ tự ưu tiên — đồng bộ Content Writing Phase -1 (v1.6):

| Thứ tự | File | Mục đích | Bắt buộc? |
|--------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` ⭐ | Session History + Key Decisions → bài nào đã refresh, kết quả Win/Flat/Loss, lessons learned | ✅ ĐỌC TRƯỚC TIÊN |
| 2 | `projects/{project}/keywords-urls.md` | URL portfolio + last_refresh date → tiêu chí identify candidates | ✅ BẮT BUỘC |
| 3 | `projects/{project}/profile.md` | Brand voice → refresh phải giữ giọng nhất quán | ✅ Nếu memory.md không đủ |
| 4 | `projects/{project}/topical.md` | Cluster context → refresh phải giữ vai trò (pillar/supporting) | ✅ Nếu tồn tại |
| 5 | `projects/{project}/external-sources.md` ⭐ (v1.1) | Whitelist nguồn ngoài — khi refresh nâng EEAT Trust → chỉ cite từ whitelist này | ✅ Nếu tồn tại |

> ⚠️ Nếu `memory.md` chưa tồn tại → copy `projects/memory-template.md`, fill Quick Facts từ profile.md, áp dụng Session End Protocol cuối phiên (xem section 8.5 bên dưới). Cực kỳ quan trọng với Content Refresh vì task lặp định kỳ.
>
> Chi tiết: `skills/content/Content Writing/SKILL.md` Phase -1 + `skills/project-memory/SKILL.md`.

## 4. Workflow refresh 7 bước

### Bước 1. Identify candidates
Bộ filter:
- GA4 / GSC: traffic decline ≥ 20% trong 90 ngày so với cùng kỳ.
- GSC: position decline trung bình.
- Striking distance keyword (pos 5–20, impressions ≥ 500).
- Top 20% bài đang traffic cao nhất (refresh-first để bảo vệ).
- Bài evergreen ≥ 12 tháng tuổi.

→ Output: list 20–50 candidate per quý.

### Bước 2. Diagnose mỗi bài
Cho mỗi candidate, ghi:
- Lý do drop?
  - Đối thủ mới (Top 5 giờ là ai?)
  - Intent đổi? (SERP có format khác không?)
  - Data outdated?
  - Cannibalization (bài khác trên site đang đè)?
  - Technical issue (CWV, indexing)?
- Cluster context: bài này có thuộc cluster mạnh không?

### Bước 3. SERP re-audit
- Search keyword chính → soi top 5 hiện tại.
- Format: blog/listicle/video/tool?
- Word count?
- Ngày publish/update của top?
- Information gain mình thiếu gì?

### Bước 4. Update plan

Phân loại refresh:

**A. Light refresh (30 phút)**:
- Update số liệu, năm, screenshot.
- Update meta title/description với năm mới.
- Add 2–3 internal link.
- Update lastmod.
- Khi: bài top 3, không vấn đề lớn, chỉ refresh "recency".

**B. Medium refresh (2-4 giờ)**:
- Light + thêm 500–1000 từ section thiếu.
- Restructure outline nếu cần.
- Add visual nguyên bản.
- Add FAQ section.
- Khi: bài top 4–10 đang tụt.

**C. Heavy refresh (1 ngày)**:
- Restructure toàn bài.
- Thay đổi format nếu intent đổi (blog → listicle).
- Viết lại 50% content.
- Add tool / template / case study.
- Cập nhật toàn bộ visual.
- Khi: bài rớt khỏi top 20 nhưng cluster + URL còn giá trị.

→ Lựa chọn dựa trên ROI (effort vs traffic potential).

### Bước 5. Execute refresh

**Output path bắt buộc (2026)**: Bài refresh lưu vào subfolder `refresh/`:

```
projects/{project}/refresh/{slug-bai}.md
```

Lưu ý: GIỮ NGUYÊN slug của bài gốc (URL không đổi). Tên file trong `refresh/` chỉ là bản nháp/lưu trữ nội bộ trước khi push lên CMS. Tạo folder `refresh/` nếu chưa có.

Ví dụ:
- ✅ `projects/thep-bao-tin/refresh/thep-ong-duc-phi-127.md` (refresh bài đã publish)
- ❌ `projects/thep-bao-tin/writing/thep-ong-duc-phi-127.md` (sai — refresh KHÔNG vào `writing/`)
- ❌ `projects/thep-bao-tin/thep-ong-duc-phi-127.md` (sai — không lưu thẳng vào root)

Quy tắc:
- **GIỮ URL** — đừng đổi slug.
- **GIỮ structure tốt** — đừng xoá H2 đang rank Featured Snippet.
- Update intro 100 từ đầu cho front-load answer mới.
- Add information gain từ Bước 3.
- **⭐ Thêm Rare Attribute** vào bài cũ: thông tin hiếm, dữ liệu gốc, kinh nghiệm độc đáo mà ít người viết. Google chấm điểm cao hơn rất nhiều cho thông tin hiếm trong Knowledge Graph. Theo dõi kết quả sau 1-2 tuần.
- **Topical Context Linking**: kiểm tra mở bài + body có kết nối ngữ nghĩa với category hierarchy không? Nếu thiếu → bổ sung tự nhiên (cha → con → cháu).
- **Bổ sung semantic keywords thiếu** (chạy lại Bước 0.5 Semantic Keyword Research từ `Content Writing SKILL.md`):
  - So sánh keyword coverage hiện tại vs top 5 đối thủ mới
  - Thêm secondary/long-tail keywords mới xuất hiện (search behavior thay đổi)
  - Cập nhật LSI/semantic terms theo NLP analysis mới
  - Thêm PAA questions mới vào FAQ section
- Bổ sung entity/term thiếu (NLP audit).
- Refresh internal link IN/OUT. **Đảm bảo mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất** — loại bỏ link trùng lặp nếu có.
- **⭐ (v1.1) Refresh external citations từ whitelist**:
  - Đọc `projects/{project}/external-sources.md` nếu tồn tại
  - Enumerate external link hiện có trong bài → đối chiếu whitelist
  - Link KHÔNG có trong whitelist + không có `<!-- ad-hoc cite -->` comment → **xóa** (hoặc thay bằng link Tier 1 phù hợp từ whitelist)
  - Phần data/tiêu chuẩn chưa cite → bổ sung Tier 1 (Bộ Công Thương, TCVN, ASTM, ISO, Google Search Central…) tùy lĩnh vực project
  - Refresh year: nếu cite "Statista 2023" mà whitelist có URL Statista 2025 → update anchor + URL
  - KHÔNG bịa link mới ngoài whitelist (anti-pattern v1.1)
- Update schema (Article dateModified, BreadcrumbList nếu IA đổi).
- Update author byline + last updated date.
- **Kiểm tra + bổ sung frontmatter** theo `projects/content-template.md`: `meta_title` (50-60 ký tự) + `meta_description` (150-160 ký tự) nếu thiếu.
- Bổ sung Featured Snippet candidate đoạn nếu chưa có.

### Bước 6. Re-publish
- Update lastmod sitemap.
- Submit URL Inspection → Request Indexing.
- Internal: 3–5 bài mới link IN tới bài refresh (với anchor đa dạng).
- Distribution: email subscriber, social repost với hook "We just updated...".

### Bước 7. Measure
Baseline 28 ngày trước refresh:
- Traffic.
- Position avg.
- CTR.
- Conversion.

Post-refresh 28, 60, 90 ngày:
- Δ Traffic %.
- Δ Position avg.
- Δ CTR.
- Δ Conversion.

Phân loại result:
- Win (≥ +20% traffic).
- Flat (-10% to +10%).
- Loss (< -10%) → review xem refresh có làm sai intent không.

Lưu vào sheet để pattern-recognize loại refresh nào hiệu quả với loại bài nào.

### Bước 7.5. Phantom Keywords — Phân bổ Keyword Phụ (Định kỳ)

> **Đây là công việc THƯỜNG NHẬT**, không phải làm 1 lần. Lặp lại mỗi tháng.
> Xem chi tiết: `knowledge/16-seo-trends-2026.md` mục 2.3

**Quy trình 4 bước:**

1. **Lấy keyword phụ từ Search Console**: Vào Performance → chọn bài đang rank → xem tab Queries → lọc keyword có impressions nhưng position > 10 (chưa rank tốt). Đây là "phantom keywords" mà Google đã nhận ra bài liên quan nhưng chưa optimize đủ.

2. **Chèn keyword vào bài**: Chèn từng nhóm keyword phù hợp vào đoạn tương ứng. KHÔNG nhồi nhét. Mỗi keyword chèn vào 1 đoạn có ngữ cảnh liên quan.

3. **Submit lại**: Request Indexing qua Google Search Console + share bài lên social/newsletter (bơm traffic nhẹ).

4. **Lặp lại định kỳ**: 1 tháng/lần. Mỗi lần lấy keyword mới từ Search Console, chèn thêm vào bài.

**Kết quả mong đợi**: Traffic tăng rõ rệt sau khoảng 1 tháng.

| Bước | Công cụ | Tần suất |
|------|---------|----------|
| Lấy keyword | Google Search Console | 1 tháng/lần |
| Chèn keyword | Editor/CMS | Ngay sau khi lấy |
| Submit | GSC Request Indexing | Ngay sau khi update |
| Bơm traffic | Social/Newsletter | 1-2 ngày sau update |
| Đo lường | GSC + GA4 | Sau 4 tuần |

## 5. Template Refresh Sheet

| URL | Topic | Last refresh | Reason | Refresh type (L/M/H) | Pre traffic 28d | Pre position | Action checklist | Owner | Deadline | Post traffic 28d | Post traffic 60d | Δ % | Result (Win/Flat/Loss) | Note |

Action checklist (tick):
- [ ] SERP re-audit
- [ ] Intent verified
- [ ] Top 5 đối thủ analysed
- [ ] Outline updated
- [ ] Information gain added
- [ ] Number/year updated
- [ ] Visual updated
- [ ] Internal link IN ≥ 3 added
- [ ] Internal link OUT ≥ 3 added
- [ ] Schema dateModified
- [ ] Author byline + last updated
- [ ] Featured snippet candidate
- [ ] Submit URL Inspection
- [ ] Distribution (email, social)

## 6. KPI đo lường
- # bài refresh / quý.
- Avg traffic uplift 60 ngày sau refresh.
- Win rate (% bài có uplift ≥ 20%).
- ROI per refresh (traffic uplift × CR × deal value / hours invested).
- # striking distance keyword đẩy vào top 5.
- # Featured Snippet captured sau refresh.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Search Console | Free | Identify decay + striking distance |
| Google Analytics 4 | Free | Traffic trend per URL |
| Ahrefs Site Explorer "Top decline" | Paid | Auto-flag decay |
| Semrush Position Tracking | Paid | Position alerts |
| Surfer Audit / Frase | Paid | Re-brief content vs current SERP |
| Screaming Frog | Free/Paid | lastmod audit, schema check |
| Loom + screencast | Freemium | Document refresh decisions cho team |
| ChatGPT/Claude | Freemium | Detect outdated language, suggest section |
| Looker Studio | Free | Dashboard refresh ROI |

### Prompt LLM "find what's missing"
```
Đối với keyword "{kw}", đây là top 5 SERP hiện tại:
{paste 5 URL + heading top}

Đây là bài hiện tại của tôi:
{paste content}

Phân tích:
1. Top 5 cover gì mà bài tôi thiếu?
2. Sub-intent / PAA mới nào nên thêm?
3. Format / depth mismatch?
4. 5 hành động cụ thể để refresh.
```

## 8. Common mistakes

### Sai về Rare Attribute & Phantom Keywords
- ❌ Refresh bài nhưng chỉ update số liệu, không thêm rare attribute → vẫn thua đối thủ có thông tin hiếm
- ❌ Không chạy Phantom Keywords định kỳ → bỏ lỡ hàng trăm keyword phụ mà Google đã nhận ra
- ❌ Nhồi phantom keywords vào 1 đoạn → spam, phản tác dụng
- ❌ Không check topical context linking khi refresh → bài "mồ côi" không liên kết ngữ nghĩa với cluster
- Refresh = đổi date không đổi content → Google detect, trust drop.
- Đổi URL khi refresh → mất rank.
- Xoá H2 đang giữ Featured Snippet.
- Rewrite từ 0 thay vì update strategic → mất rank thay vì uplift.
- Không baseline trước → không đo được ROI.
- Refresh hàng loạt cùng lúc → khó attribute.
- Bỏ qua internal link IN — không reinforce signal.
- Quên schema dateModified → Google không nhận tín hiệu freshness.
- Không refresh distribution (email, social) → user không biết bài đã update.
- Refresh sai bài (light cho bài cần heavy, hoặc ngược lại).
- Không track post-result → không học pattern.
- Refresh nhưng vẫn giữ giọng AI generic → cơ hội nâng EEAT bị bỏ phí.
- **(v1.1) Bịa URL nguồn ngoài khi refresh EEAT Trust** — AI tự thêm URL Statista/Wikipedia mà không có trong `external-sources.md`. **CHỈ cite từ whitelist project**; thiếu → để trống hoặc thay claim.
- **(v1.1) Không xóa link 404/ngoài whitelist trong bài cũ khi refresh** — link cũ broken/spam giữ lại = giảm Trust signal. Bước 5 BẮT BUỘC check enumerate external link.

> ⚠️ **Anti-AI Detection**: Khi refresh, đây là cơ hội tốt nhất để humanize nội dung — thêm kinh nghiệm cá nhân, case study mới, quan điểm rõ ràng. Tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), loại bỏ từ cấm + mẫu câu AI, Self-Correction + Red Flag Check. MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: section 2.4 trong `skills/content/Content Writing/SKILL.md`.

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

## 8.5. Session End Protocol — Update Memory (BẮT BUỘC cuối phiên)

Content Refresh là task lặp định kỳ → **không persist kết quả = không học được pattern nào hiệu quả**. Update `projects/{project}/memory.md` (checklist 7 điểm — đồng bộ Content Writing Phase 7):

```
[ ] Append Session History (date, CLI/model, "refresh {URL slug} — type Light/Medium/Heavy", files touched)
[ ] Append Recent Articles — KHÔNG thêm URL mới (URL cũ); thay vào ghép note vào entry hiện có "refreshed YYYY-MM-DD type=L/M/H"
[ ] Edit Active Context — "Đang refresh batch {sprint}, top decay {N} bài"
[ ] Edit Pending Tasks — schedule measure 28/60/90 ngày, schedule Phantom Keywords 1 tháng/lần
[ ] Append Key Decisions — type refresh, bài nào **đã refresh** (tránh trùng phiên sau), result Win/Flat/Loss khi có
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md cùng commit với bài refresh
```

> ⭐ **Quan trọng với Refresh**: Key Decisions PHẢI ghi rõ "Đã refresh: {URL} — {date} — type — result" để phiên sau AI biết không refresh lại bài đó trong vòng 6 tháng (trừ khi traffic tiếp tục decay).

Chi tiết: `skills/project-memory/SKILL.md` + `skills/content/Content Writing/SKILL.md` Phase 7.

---
**Đầu ra**: refresh backlog quarterly, win rate ≥ 60%, contribute lớn vào tổng growth không cần publish thêm bài mới.
