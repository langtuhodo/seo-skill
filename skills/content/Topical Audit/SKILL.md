# Topical Audit — Đánh giá sức khỏe nội dung theo cụm chủ đề

## 1. Purpose / Mục đích

Đánh giá chi tiết tất cả bài viết trong 1 cluster để trả lời câu hỏi: **Chủ đề này đã đủ mạnh chưa?**

- Có trùng nội dung không?
- Có thiếu bài bổ trợ quan trọng không?
- Có bài nào yếu kéo cả cluster xuống không?
- Các bài có liên kết logic với nhau không?

**Input**: Các file `.md` trong project, viết theo `projects/content-template.md`, thuộc cùng 1 cluster.

**Output**:
1. **Audit Report** — Verdict + Score từng bài + đánh giá cluster health
2. **Topical Map hoàn chỉnh** — Bản đồ toàn bộ cluster: bài đã có (score) + bài thiếu (gợi ý)
3. **Recommendations** — Danh sách hành động cụ thể theo priority

Không rewrite — việc sửa bài dùng skill Content Writing riêng.

**Benchmark**: Tiêu chuẩn nội bộ cố định (EEAT checklist + GEO checklist + Voice checklist từ `skills/content/Content Writing/SKILL.md`).

---

## 2. Core Concepts / Khái niệm cốt lõi

- **Cluster**: Nhóm bài viết cùng phục vụ 1 chủ đề. Gồm 1 pillar + N supporting articles.
- **Coverage**: Cluster đã cover đủ các khía cạnh user cần biết chưa.
- **Overlap/Cannibalization**: 2+ bài trong cluster nhắm cùng intent hoặc trùng nội dung lớn → Google không biết rank bài nào.
- **Coherence**: Các bài liên kết logic với nhau, user đọc xong bài này biết đọc bài nào tiếp.
- **Quality Floor**: Bài yếu nhất trong cluster — nếu quá yếu sẽ kéo trust cả cluster xuống.
- **Vai trò trong cluster**: Mỗi bài phải đóng góp 1 giá trị unique mà không bài nào khác trong cluster đã cover.
- **Score 100đ**: Mỗi bài được chấm trên thang 100 điểm — thay vì verdict định tính, dùng con số để so sánh và ưu tiên.

---

## 3. When to use / Khi nào dùng

- Audit cluster trước khi scale thêm content.
- Sau 6-12 tháng publish 1 cluster — kiểm tra hiệu quả.
- Khi traffic cluster stagnant hoặc decay.
- Khi muốn prune/consolidate content.
- Khi nghi ngờ cannibalization trong cluster.
- Khi muốn biết cluster đang thiếu bài bổ trợ nào.

**Khi KHÔNG dùng**:
- Cluster mới publish < 3 tháng (chưa đủ data).
- Bài đơn lẻ không thuộc cluster nào (dùng skill Content Refresh).
- Cần rewrite bài (dùng skill Content Writing).

---

## 4. Workflow — 5 Phase

---

### Phase 1: Thu thập & Validate

#### Bước 1.1. Đọc tất cả file trong cluster

Đọc các file `.md` thuộc cùng cluster. Parse **toàn bộ SEO Metadata** (blockquote đầu bài) theo `projects/content-template.md`:

```markdown
> **SEO Metadata**
> - **title**: "{Tiêu đề bài viết}"          # BẮT BUỘC
> - **slug**: "{slug-url}"                     # BẮT BUỘC
> - **meta_title**: "{SEO title 50-60 ký tự}"  # BẮT BUỘC
> - **meta_description**: "{150-160 ký tự}"   # BẮT BUỘC
> - **project**: "{tên dự án}"                 # BẮT BUỘC
> - **cluster**: "{tên cluster / head keyword}" # BẮT BUỘC
> - **role**: "pillar | supporting"            # BẮT BUỘC
> - **target_keyword**: "{keyword chính}"      # BẮT BUỘC
> - **semantic_keywords**: "{từ khóa ngữ nghĩa}"  # BẮT BUỘC
> - **search_intent**: "I | N | C | T"        # BẮT BUỘC
> - **word_count**: 0                          # BẮT BUỘC
> - **created**: "{YYYY-MM-DD}"               # BẮT BUỘC
```

⚠️ Cũng hỗ trợ parse YAML frontmatter (`---`) cho các bài cũ chưa chuyển sang blockquote.

#### Bước 1.2. Validate SEO Metadata

Với mỗi file, kiểm tra:

| Kiểm tra | Quy tắc | Lỗi nếu vi phạm |
|----------|---------|------------------|
| **Trường đầy đủ** | 12 trường trên đều phải có giá trị | `THIẾU TRƯỜNG: {tên trường}` |
| **meta_title độ dài** | 50-60 ký tự, keyword đầu | `META TITLE SAI: {len} ký tự (cần 50-60)` |
| **meta_description độ dài** | 150-160 ký tự, có value-prop + CTA | `META DESC SAI: {len} ký tự (cần 150-160)` |
| **slug format** | Lowercase, chỉ dùng hyphen, không space/special chars | `SLUG SAI FORMAT: "{slug}"` |
| **role hợp lệ** | Chỉ `pillar` hoặc `supporting` | `ROLE KHÔNG HỢP LỆ: "{role}"` |
| **search_intent hợp lệ** | Chỉ `I`, `N`, `C`, hoặc `T` | `INTENT KHÔNG HỢP LỆ: "{intent}"` |
| **semantic_keywords có giá trị** | Phải có ít nhất 3 từ khóa ngữ nghĩa | `THIẾU SEMANTIC KEYWORDS` |
| **word_count khớp** | Đếm từ thực tế, sai lệch ≤ 10% | `WORD COUNT SAI: ghi {X}, thực tế {Y}` |
| **1 pillar duy nhất** | Cluster phải có đúng 1 bài role=pillar | `CLUSTER THIẾU PILLAR` hoặc `CLUSTER CÓ {N} PILLAR` |
| **cluster khớp** | Tất cả bài phải cùng giá trị `cluster` | `CLUSTER KHÔNG KHỚP: {bài} có cluster "{X}"` |

**Output**: Danh sách lỗi frontmatter (nếu có). Nếu có lỗi nghiêm trọng (thiếu role, thiếu cluster, thiếu pillar) → DỪNG, yêu cầu user fix trước.

#### Bước 1.3. Map cấu trúc cluster

Tạo bản đồ:

```
CLUSTER: {tên cluster}
├── PILLAR: {filename} — keyword: {X} — intent: {X} — {word_count} từ
├── SUPPORTING: {filename} — keyword: {X} — intent: {X} — {word_count} từ
├── SUPPORTING: {filename} — keyword: {X} — intent: {X} — {word_count} từ
└── ...
```

---

### Phase 2: Review từng bài — Scoring 100đ

Với mỗi bài trong cluster, đánh giá 6 tiêu chí. Mỗi tiêu chí có trọng số cụ thể → tổng 100 điểm.

#### Bảng trọng số

| # | Tiêu chí | Trọng số | Cách tính |
|---|----------|---------|-----------|
| 1 | Intent Match | **20đ** | ĐẠT = 20đ, KHÔNG ĐẠT = 0đ |
| 2 | EEAT | **25đ** | (X/12) × 25, làm tròn |
| 3 | GEO Readiness | **15đ** | (X/6) × 15, làm tròn |
| 4 | Giọng văn | **15đ** | (X/12) × 15, làm tròn |
| 5 | Structure | **15đ** | Theo rubric 5 bậc (0/4/8/12/15) |
| 6 | Vai trò cluster | **10đ** | CẦN THIẾT = 10đ, TRÙNG LẶP = 3đ, THỪA = 0đ |
| | **TỔNG** | **100đ** | |

#### Ngưỡng verdict

| Score | Verdict | Hành động |
|-------|---------|-----------|
| ≥ 80đ | **ĐẠT** | Giữ nguyên, chỉ minor tweak nếu cần |
| 60-79đ | **CẦN OPTIMIZE** | Sửa các tiêu chí dưới ngưỡng |
| 40-59đ | **CẦN REWRITE** | Viết lại theo Content Writing skill |
| < 40đ | **NÊN XÓA/MERGE** | Xóa hoặc gộp vào bài khác |

---

#### Tiêu chí 1: Intent Match (20đ)

Nội dung có đúng với `search_intent` declared trong frontmatter không?

| Intent | Nội dung cần có | Dấu hiệu KHÔNG match |
|--------|----------------|----------------------|
| I (Informational) | Giải thích, hướng dẫn, kiến thức | Bài toàn quảng cáo sản phẩm |
| N (Navigational) | Dẫn đến đúng thứ user tìm | Bài lan man không đi vào trọng tâm |
| C (Commercial) | So sánh, đánh giá, giúp chọn | Bài chỉ giới thiệu 1 option, không so sánh |
| T (Transactional) | Thông tin mua hàng, giá, CTA rõ | Bài toàn lý thuyết, không có action |

**Score**: ĐẠT = 20đ | KHÔNG ĐẠT = 0đ (ghi rõ lý do)

---

#### Tiêu chí 2: EEAT (25đ)

Đánh giá theo 12-item checklist (từ `skills/content/Content Writing/SKILL.md`):

**Experience** (3 items):
- [ ] Có ít nhất 1 case study/ví dụ thực tế
- [ ] Có chi tiết cụ thể (tên, số, ngày, địa điểm)
- [ ] Có góc nhìn insider / behind the scenes

**Expertise** (3 items):
- [ ] Giải thích kỹ thuật chính xác
- [ ] Cite tiêu chuẩn/nguồn uy tín
- [ ] Không có thông tin sai

**Authoritativeness** (3 items):
- [ ] Author có tên thật + bio + credentials
- [ ] Công ty có thông tin liên hệ rõ ràng
- [ ] Có link tới profile/portfolio

**Trust** (3 items):
- [ ] Có nguồn trích dẫn cho số liệu
- [ ] Hình ảnh thực (không stock)
- [ ] Có social proof (review, testimonial)

**Score**: (X/12) × 25, làm tròn. Ví dụ: 9/12 = 19đ, 6/12 = 13đ.

**Ngưỡng tham khảo**: ≥ 17đ (8/12) = TỐT. < 17đ = CẦN CẢI THIỆN.

---

#### Tiêu chí 3: GEO Readiness (15đ)

Đánh giá theo 6-item checklist:

- [ ] 50-100 từ đầu trả lời thẳng câu hỏi (answer-first)
- [ ] Có định nghĩa rõ ràng, cite-able
- [ ] Có ít nhất 1 list/table dễ trích xuất
- [ ] Không dùng pronoun mơ hồ (nó, điều này, việc đó)
- [ ] Có original data/insight (không chỉ tổng hợp)
- [ ] Entity chính được mention đủ (không thiếu, không thừa)

**Score**: (X/6) × 15, làm tròn. Ví dụ: 5/6 = 13đ, 3/6 = 8đ.

**Ngưỡng tham khảo**: ≥ 10đ (4/6) = TỐT. < 10đ = CẦN CẢI THIỆN.

---

#### Tiêu chí 4: Giọng văn (15đ)

Đánh giá theo Voice checklist (12 items):

**Câu mở đầu section** (3 items):
- [ ] Không bắt đầu bằng "Như chúng ta đã biết..."
- [ ] Không bắt đầu bằng "Trong thời đại..."
- [ ] Không bắt đầu bằng "Điều quan trọng là..."

**Cấu trúc câu** (3 items):
- [ ] Câu trung bình < 20 từ
- [ ] Đoạn trung bình 2-4 dòng
- [ ] Không có câu > 40 từ

**Giọng điệu** (3 items):
- [ ] Có dùng "tôi", "bạn", "chúng tôi"
- [ ] Có ít nhất 1 quan điểm cá nhân
- [ ] Có ít nhất 1 câu thể hiện cảm xúc

**Chi tiết cụ thể** (3 items):
- [ ] Có tên người/công ty/địa điểm thực
- [ ] Có số liệu cụ thể (không "nhiều", "một số")
- [ ] Có ngày/thời gian cụ thể

**Score**: (X/12) × 15, làm tròn. Ví dụ: 10/12 = 13đ, 6/12 = 8đ.

**Ngưỡng tham khảo**: ≥ 10đ (8/12) = TỐT. < 10đ = CẦN CẢI THIỆN.

**Lưu ý**: Nếu có ≥ 3 câu mở đầu AI generic → tự động trừ thêm 3đ.

---

#### Tiêu chí 5: Structure (15đ)

Đánh giá theo rubric 5 bậc:

| Score | Điều kiện |
|-------|-----------|
| **15đ** | Có đúng 1 H1 + H2/H3 logic + mỗi section có nội dung thực + scannable (list/table/bold) + độ dài phù hợp intent |
| **12đ** | Đạt 4/5 điều kiện trên |
| **8đ** | Đạt 3/5 điều kiện |
| **4đ** | Đạt 2/5 điều kiện |
| **0đ** | Đạt ≤ 1/5 điều kiện |

5 điều kiện chi tiết:
1. Có đúng 1 H1 (trùng hoặc gần trùng `title` trong frontmatter)
2. H2/H3 hierarchy logic (không nhảy cấp)
3. Mỗi H2 section có nội dung thực (không chỉ 1-2 câu)
4. Scannable: có list, table, bold key points
5. Độ dài phù hợp intent (I: ≥ 800 từ, C: ≥ 1000 từ, T: ≥ 500 từ, N: linh hoạt)

---

#### Tiêu chí 6: Vai trò trong cluster (10đ)

Đánh giá bài này trong context cả cluster:

- **Đóng góp unique**: Bài này cung cấp thông tin/góc nhìn gì mà không bài nào khác trong cluster đã cover?
- **Overlap check**: Có trùng nội dung đáng kể (> 30% ý chính) với bài khác trong cluster không?
- **Cần thiết**: Nếu xóa bài này, cluster có mất thông tin quan trọng không?

**Score**:

| Verdict | Score | Điều kiện |
|---------|-------|-----------|
| **CẦN THIẾT** | 10đ | Đóng góp unique, không trùng đáng kể |
| **TRÙNG LẶP** | 3đ | Overlap > 30% với bài khác (ghi rõ bài nào) → nên merge |
| **THỪA** | 0đ | Không đóng góp thêm giá trị, cluster không mất gì nếu xóa |

---

### Phase 2 Output: Scorecard từng bài

Tổng hợp 6 tiêu chí → score + verdict cho mỗi bài:

```
{filename} — SCORE: {X}/100 — Verdict: {VERDICT}
├── Intent Match:    {X}/20  — {ĐẠT/KHÔNG ĐẠT}
├── EEAT:            {X}/25  — {X}/12 items
├── GEO:             {X}/15  — {X}/6 items
├── Giọng văn:       {X}/15  — {X}/12 items
├── Structure:       {X}/15  — {rubric level}
└── Vai trò cluster: {X}/10  — {CẦN THIẾT/TRÙNG/THỪA}
```

---

### Phase 3: Đánh giá tổng thể Cluster

Từ kết quả Phase 2, đánh giá 4 chiều:

#### 3.1. Coverage — Đủ chưa?

**Phân tích từ nội dung pillar để tìm subtopic thiếu:**

1. **Đọc pillar → extract H2/H3**: Mỗi H2/H3 trong pillar thường đại diện 1 subtopic. Liệt kê tất cả.
2. **Map supporting → subtopic**: Mỗi supporting đã cover subtopic nào trong pillar?
3. **Tìm subtopic chưa có supporting**:
   - H2/H3 nào trong pillar chỉ nhắc qua (< 200 từ) mà CHƯA có bài supporting đi sâu?
   - Subtopic nào đáng lẽ cần bài riêng nhưng chỉ là 1 đoạn ngắn trong pillar?

4. **Intent coverage matrix**:

| Intent | Số bài | Đủ chưa? |
|--------|--------|----------|
| I (Informational) | {N} | ≥ 3 bài = TỐT |
| N (Navigational) | {N} | ≥ 1 bài nếu relevant |
| C (Commercial) | {N} | ≥ 1 bài = TỐT |
| T (Transactional) | {N} | ≥ 1 bài nếu có conversion path |

5. **User Journey gaps**: 
   - **Awareness**: Có bài giải thích khái niệm cơ bản không? (người mới)
   - **Consideration**: Có bài so sánh, đánh giá không? (người đang chọn)
   - **Decision**: Có bài hỗ trợ ra quyết định không? (người sẵn sàng hành động)

**Verdict**: ĐỦ / THIẾU (liệt kê subtopic cần bổ sung + lý do + keyword gợi ý + intent)

---

#### 3.2. Overlap — Có trùng không?

Từ kết quả Tiêu chí 6 (Phase 2):

**Phát hiện trùng lặp bằng 3 lớp kiểm tra:**

1. **Keyword overlap**: 2+ bài target cùng keyword hoặc keyword rất gần nhau
2. **Intent overlap**: 2+ bài cùng intent nhắm vào cùng 1 câu hỏi của user
3. **Content overlap**: 2+ bài trùng > 30% ý chính (đọc nội dung, so sánh các H2/H3 sections)

Với mỗi cặp trùng:
- Bài nào mạnh hơn (score cao hơn, đầy đủ hơn)?
- Recommend: MERGE bài yếu vào bài mạnh, hay XÓA 1 bài?

**Verdict**: KHÔNG TRÙNG / CÓ TRÙNG (liệt kê cặp + recommendation)

---

#### 3.3. Coherence — Liên kết logic không?

Kiểm tra:
- Pillar có nhắc đến / link đến tất cả supporting không?
- Supporting có link ngược về pillar không?
- User đọc xong 1 bài có biết đọc bài nào tiếp theo không?
- Thứ tự đọc có logic không (từ tổng quan → chi tiết, từ cơ bản → nâng cao)?

**Verdict**: TỐT / CẦN CẢI THIỆN (ghi rõ link thiếu, flow bị đứt ở đâu)

---

#### 3.4. Quality Floor — Bài yếu nhất

- Bài nào có score thấp nhất? Score bao nhiêu?
- Bài yếu nhất ảnh hưởng thế nào đến trust cả cluster?
- Ưu tiên fix bài nào trước?

**Verdict**: CHẤP NHẬN ĐƯỢC (bài thấp nhất ≥ 60đ) / CÓ VẤN ĐỀ (có bài < 60đ)

---

### Phase 3 Output: Cluster Health

Tổng hợp 4 chiều + metrics → đánh giá sức khỏe cluster:

| Metric | Giá trị |
|--------|---------|
| **Avg Score** | {X}đ/100 |
| **Score thấp nhất** | {X}đ ({filename}) |
| **Score cao nhất** | {X}đ ({filename}) |
| **Số bài ĐẠT (≥80đ)** | {N}/{total} |
| **Số bài CẦN OPTIMIZE (60-79đ)** | {N} |
| **Số bài CẦN REWRITE (40-59đ)** | {N} |
| **Số bài NÊN XÓA/MERGE (<40đ)** | {N} |
| **Số cặp trùng lặp** | {N} |
| **Số subtopic thiếu** | {N} |

| Cluster Health | Điều kiện |
|----------------|-----------|
| **MẠNH** | Avg ≥ 75đ + Coverage đủ + Không trùng + Coherence tốt + Quality floor ≥ 60đ |
| **TRUNG BÌNH** | Avg 60-74đ HOẶC 1-2 chiều có vấn đề nhẹ (thiếu 1-2 subtopic, hoặc 1 cặp trùng, hoặc vài link thiếu) |
| **YẾU** | Avg < 60đ HOẶC ≥ 2 chiều có vấn đề nghiêm trọng (thiếu nhiều subtopic, nhiều bài trùng, flow rời rạc, nhiều bài < 40đ) |

---

### Phase 4: Recommendations

Output danh sách hành động cụ thể, sắp theo priority:

#### Priority 1: Fix ngay (ảnh hưởng lớn nhất)
- Merge các bài trùng lặp (chỉ rõ bài nào merge vào bài nào + lý do)
- Xóa bài thừa (nếu có, kèm lý do)
- Fix lỗi frontmatter nghiêm trọng (nếu Phase 1 phát hiện)

#### Priority 2: Optimize (cải thiện chất lượng)
- Bài nào cần optimize, sửa tiêu chí nào cụ thể, score hiện tại → score mục tiêu
- Bài nào cần rewrite hoàn toàn (dùng `skills/content/Content Writing/SKILL.md`)

#### Priority 3: Bổ sung (lấp gap)
- Subtopic nào cần viết thêm, với đầy đủ thông tin:

```yaml
# Gợi ý bài mới
title: "{Tiêu đề gợi ý}"
slug: "{slug gợi ý}"
cluster: "{tên cluster}"
role: "supporting"
target_keyword: "{keyword gợi ý}"
search_intent: "{I|N|C|T}"
lý_do: "{Tại sao cluster cần bài này}"
```

#### Priority 4: Liên kết (tăng coherence)
- Link nào cần thêm (từ bài nào → bài nào)
- Flow đọc cần điều chỉnh thế nào
- **Kiểm tra internal link dedup**: mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất trong bài — loại bỏ link trùng lặp nếu phát hiện

---

### Phase 5: Output — Topical Map hoàn chỉnh

Sau khi audit xong, tổng hợp thành **Topical Map** cho toàn bộ cluster:

```markdown
## Topical Map: {Cluster Name}

**Cluster Health**: {MẠNH / TRUNG BÌNH / YẾU}
**Avg Score**: {X}đ/100
**Tổng bài**: {N} hiện có + {N} cần viết thêm

---

### PILLAR
| File | Score | Verdict | Keyword | Intent |
|------|-------|---------|---------|--------|
| {filename} | {X}đ | {verdict} | {keyword} | {intent} |

### SUPPORTING — ĐÃ CÓ
| File | Score | Verdict | Keyword | Intent | Ghi chú |
|------|-------|---------|---------|--------|---------|
| {filename} | {X}đ | ĐẠT | {keyword} | I | |
| {filename} | {X}đ | CẦN OPTIMIZE | {keyword} | C | Thiếu EEAT |
| {filename} | {X}đ | MERGE → {target} | {keyword} | I | Trùng với {bài} |

### SUPPORTING — CẦN VIẾT THÊM
| Tiêu đề gợi ý | Keyword | Intent | Lý do |
|----------------|---------|--------|-------|
| {title} | {keyword} | I | Pillar nhắc nhưng chưa có bài đi sâu |
| {title} | {keyword} | C | Thiếu bài so sánh cho giai đoạn Consideration |

### CLUSTER METRICS
- Coverage: {X}/{Y} subtopics ({X}%)
- Overlap: {N} cặp trùng
- Coherence: {TỐT / CẦN CẢI THIỆN}
- Quality Floor: {X}đ ({filename})
```

---

## 5. Template — Audit Report Output

```markdown
---
title: "Topical Audit — {Cluster Name}"
project: "{project}"
type: "topical-audit"
created: "{YYYY-MM-DD}"
cluster_keyword: "{head keyword}"
cluster_health: "{MẠNH | TRUNG BÌNH | YẾU}"
avg_score: {X}
total_articles: {N}
articles_pass: {N}
articles_optimize: {N}
articles_rewrite: {N}
articles_merge_delete: {N}
subtopics_missing: {N}
---

# Topical Audit: {Cluster Name}

## Tổng quan

- **Cluster health**: {MẠNH / TRUNG BÌNH / YẾU}
- **Avg score**: {X}đ/100
- **Tổng bài**: {N} (Pillar: {N}, Supporting: {N})
- **Verdict**: ĐẠT {N} | CẦN OPTIMIZE {N} | CẦN REWRITE {N} | MERGE {N} | XÓA {N}
- **Subtopic thiếu**: {N} bài cần viết thêm

---

## Frontmatter Validation

| File | Status | Lỗi (nếu có) |
|------|--------|---------------|
| {filename} | ✓ OK | |
| {filename} | ✗ LỖI | {mô tả lỗi} |

---

## Review từng bài

### {filename} — Score: {X}/100 — Verdict: {VERDICT}

| Tiêu chí | Score | Chi tiết |
|----------|-------|----------|
| Intent Match | {X}/20 | {ĐẠT/KHÔNG ĐẠT — lý do} |
| EEAT | {X}/25 | {X}/12 items — Thiếu: {items} |
| GEO | {X}/15 | {X}/6 items — Thiếu: {items} |
| Giọng văn | {X}/15 | {X}/12 items — Vấn đề: {mô tả} |
| Structure | {X}/15 | {rubric level — vấn đề} |
| Vai trò cluster | {X}/10 | {CẦN THIẾT/TRÙNG/THỪA — giải thích} |

**Tóm tắt**: {1-2 câu mô tả vấn đề chính của bài này}

---

(Lặp lại cho mỗi bài)

---

## Đánh giá tổng thể Cluster

### Coverage
- **Verdict**: {ĐỦ / THIẾU}
- {Mô tả: cluster đã cover những gì, thiếu gì}
- **Subtopics thiếu**:
  - {subtopic} — keyword: {X} — intent: {X} — lý do: {X}

### Overlap
- **Verdict**: {KHÔNG TRÙNG / CÓ TRÙNG}
- {Liệt kê cặp trùng nếu có + recommendation}

### Coherence
- **Verdict**: {TỐT / CẦN CẢI THIỆN}
- {Mô tả flow, link thiếu}

### Quality Floor
- **Verdict**: {CHẤP NHẬN ĐƯỢC / CÓ VẤN ĐỀ}
- {Bài yếu nhất: {filename} — {X}đ — impact}

---

## Topical Map hoàn chỉnh

(Phase 5 output — bảng tổng hợp bài có + bài thiếu)

---

## Recommendations

### Priority 1: Fix ngay
- [ ] {action cụ thể}

### Priority 2: Optimize
- [ ] {bài} ({X}đ) — sửa: {tiêu chí cụ thể} → mục tiêu: {Y}đ

### Priority 3: Bổ sung
- [ ] Viết thêm: {subtopic} — keyword: {X} — intent: {X} — lý do: {X}

### Priority 4: Liên kết
- [ ] Thêm link: {bài A} → {bài B}
```

---

## 6. Common Mistakes

1. **Đánh giá bài riêng lẻ mà quên context cluster** → bài có thể tốt nhưng trùng với bài khác = vẫn là vấn đề.
2. **Chỉ nhìn chất lượng, bỏ qua coverage** → cluster toàn bài tốt nhưng thiếu subtopic quan trọng = vẫn yếu.
3. **Recommend xóa bài mà không check vai trò** → bài score thấp nhưng là bài duy nhất cover 1 subtopic = không nên xóa, nên rewrite.
4. **Merge mà không chỉ rõ direction** → phải nói rõ bài nào giữ, bài nào gộp vào.
5. **Đánh giá EEAT quá lỏng** → "có 1 ví dụ" không đủ, ví dụ phải có chi tiết cụ thể (tên, số, ngày).
6. **Bỏ qua giọng văn** → bài đủ thông tin nhưng đọc như AI generate = vẫn cần optimize.
7. **Không đánh giá coherence** → mỗi bài tốt riêng nhưng không link với nhau = cluster rời rạc, user không navigate được.
8. **Không validate frontmatter** → thiếu trường hoặc sai format → audit không chính xác, output không chuẩn.
9. **Chỉ report mà không gợi ý bài thiếu** → user biết thiếu nhưng không biết nên viết gì → skill phải output gợi ý cụ thể.

---

## 7. Tích hợp với các skill khác

| Khi cần | Dùng skill |
|---------|-----------|
| Rewrite bài sau audit | `skills/content/Content Writing/SKILL.md` |
| Viết subtopic mới (bổ sung gap) | `skills/content/Content Writing/SKILL.md` |
| Kiểm tra intent classification | `skills/strategy/Search Intent/SKILL.md` |
| Cấu trúc cluster chuẩn | `skills/content/Topic Clusters/SKILL.md` |
| Đánh giá internal link chi tiết | `skills/on-page/Internal Linking/SKILL.md` |
| Refresh bài đơn lẻ (không thuộc cluster) | `skills/content/Content Refresh/SKILL.md` |
| Phân tích keyword cho bài thiếu | `skills/strategy/Keyword Research/SKILL.md` |

---

**Đầu ra**: Audit report `.md` với score từng bài (100đ) + topical map hoàn chỉnh (bài có + bài thiếu) + đánh giá cluster health + recommendations có priority. Skill này KHÔNG rewrite — chỉ chẩn đoán, chấm điểm, và đề xuất.
