---
name: topic-clusters
version: 1.1.0
description: "Use this skill when the user asks about topic cluster strategy: 'topic cluster', 'cụm chủ đề', 'pillar-supporting model', 'cluster architecture'. Covers cluster design, pillar identification, supporting page mapping, internal link structure. ✅ v1.1: Article Role taxonomy v1.1 (pillar / supporting / variant) — variant = product SKU/size (vd 'ống thép đúc phi 76') có parent_url trỏ pillar + differentiator (size/SKU), SHORT general (≤120 từ) + DEEP differentiator (60-70%). Anti-pattern: bài variant nhân bản pillar."
category: content
---

# Topic Clusters — Cụm chủ đề

> **Chuẩn 2026 bắt buộc**: Topic Cluster 2026 = Entity Mapping (Vector Search thay keyword density) + Topical Context Linking (cha→con→cháu) + mỗi bài có Summary Chunk + Conversational Queries 10-20 từ. Xem `knowledge/04-content-seo.md` (Bổ sung 2026) + `knowledge/16-seo-trends-2026.md` (mục 3.7).

> **Output path 2026 (folder-scoped)**:
> - **Topical map** (sơ đồ cluster + pillar/supporting) → `projects/{project}/topical.md` (root — file lõi, giữ nguyên).
> - **Keyword research per cluster** → `projects/{project}/research/keyword-research-{cluster}.md` (subfolder `research/`).
> - **Bài viết của từng node trong cluster** (khi viết) → `projects/{project}/writing/{slug-bai}.md` (subfolder `writing/`).
>
> KHÔNG lưu output cluster trực tiếp ở root project (ngoại trừ `topical.md`). Chi tiết: `AGENTS.md` Section "GENERATE OUTPUT".

## 1. Purpose / Mục đích
Topic Cluster là **mô hình content tổ chức theo cụm**: 1 pillar + N supporting + mạng lưới internal link kết nối. Đây là "ngôn ngữ" mà Google thực sự đánh giá site (theo entity + topical authority), thay vì xem từng bài rời rạc. Site có cluster mạnh outrank site rời rạc dù DR thấp hơn.

## 2. Core Concepts / Khái niệm cốt lõi

- **Pillar**: trang trụ cột (skill Pillar Pages). DEEP toàn cluster, không vào differentiator-specific.
- **Supporting**: narrower topic trong cluster, DEEP riêng topic đó.
- **Variant** ⭐ (v1.1): bài sản phẩm theo size/SKU/model (vd `ong-thep-duc-phi-76`, `ong-thep-duc-phi-90`) — có `parent_url` trỏ về pillar + `differentiator` (size, model, SKU). **SHORT general** (≤120 từ định nghĩa + link pillar) + **DEEP differentiator** (60-70% word count vào thông số size + ứng dụng SPECIFIC).
- **Cluster topic**: tập hợp 1 pillar + nhiều supporting + N variants cùng chủ đề rộng.
- **Topical authority**: Google đánh giá site là "expert" trong 1 mảng khi đã cover toàn bộ sub-topic + có internal/external link signal.
- **Coverage depth + breadth**: depth = chi tiết mỗi bài; breadth = bao phủ sub-topic.
- **Semantic completeness**: đủ entity / sub-topic / câu hỏi mà Google expects.
- **Cluster boundary**: 1 cluster phải có ranh giới rõ. Quá rộng → nhiều cluster con; quá hẹp → cluster yếu.

### 2.1. Article Role Taxonomy v1.1 (BẮT BUỘC ghi vào `topical.md`)

Mỗi bài trong cluster PHẢI có role + (nếu variant) parent_url + differentiator:

| Role | Ký hiệu | Mục đích | Content depth | Parent_url | Differentiator |
|------|---------|----------|---------------|------------|----------------|
| pillar | 🏛️ | Hub bao quát cluster | DEEP toàn cluster (2500-4000 từ) | — | — |
| supporting | 📄 | Narrower topic trong cluster | DEEP về topic riêng (1500-2500 từ) | pillar_slug | topic_name |
| **variant** | 🧬 | **Sản phẩm theo size/SKU/model** | **SHORT general (≤120 từ + link pillar) + DEEP differentiator (400-600 từ × 2-3 section) — tổng 1200-1800 từ** | pillar_slug | size/SKU/model descriptor |

**Ví dụ cluster "Ống thép đúc" trong project thep-bao-tin**:

```
Slug                          | Vai trò    | Parent URL    | Differentiator
ong-thep-duc                  | pillar     | —             | —
ong-thep-duc-tieu-chuan       | supporting | ong-thep-duc  | topic=tiêu chuẩn ASTM/JIS/TCVN
ong-thep-duc-phi-76           | variant    | ong-thep-duc  | size=DN65 (Φ76mm)
ong-thep-duc-phi-90           | variant    | ong-thep-duc  | size=DN80 (Φ90mm)
ong-thep-duc-phi-168          | variant    | ong-thep-duc  | size=DN150 (Φ168mm)
```

### 2.2. Anti-pattern: variant nhân bản pillar 🛑

Khi cluster có nhiều variant (vd 10-15 size khác nhau), AI dễ viết 10 bài variant đều có 800 từ "ống đúc là gì" + 600 từ "quy trình SX" — **nhân bản pillar**. Google detect duplicate content + Content Evaluation Section 5.7 flag 🟠 LÀM MỚI.

**Đúng**: Variant ≤120 từ general + link pillar. 60-70% word count vào thông số size cụ thể + ứng dụng SPECIFIC + bảng so sánh size + giá.

Chi tiết gating: xem `skills/content/Content Writing/SKILL.md` Phase 2.5 Role Detection.

## 3. When to use
- Khi launch site mới — cluster là cách build ngay từ đầu, không phải afterthought.
- Khi muốn rank head keyword (cluster chứ không phải trang đơn lẻ thắng head).
- Khi expand sang ngách mới.
- Khi audit content cũ rời rạc — re-organize thành cluster.

## 3.5. Load Project Context (BẮT BUỘC nếu viết cho dự án cụ thể)

Tạo topical map = quyết định kiến trúc cluster cho cả dự án. Trước khi tạo mới PHẢI biết cluster nào đã có, tránh duplicate. Đọc theo thứ tự ưu tiên — đồng bộ Content Writing Phase -1 (v1.6):

| Thứ tự | File | Mục đích | Bắt buộc? |
|--------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` ⭐ | Quick Facts + Active Context (cluster đang focus) + Key Decisions cluster-related | ✅ ĐỌC TRƯỚC TIÊN |
| 2 | `projects/{project}/topical.md` | Cluster hiện có → tránh duplicate, xác định cluster boundary | ✅ Nếu tồn tại |
| 3 | `projects/{project}/profile.md` | Business context, ICP → cluster phải map tới pain/goal thực | ✅ Nếu memory không đủ |
| 4 | `projects/{project}/keywords-urls.md` | URL đã publish — gắn vào cluster tương ứng | ✅ Nếu tồn tại |

> ⚠️ Nếu `memory.md` chưa tồn tại → copy `projects/memory-template.md`, fill Quick Facts từ profile.md, áp dụng Session End Protocol cuối phiên (xem section 8.5 bên dưới).
>
> Chi tiết: `skills/content/Content Writing/SKILL.md` Phase -1 + `skills/project-memory/SKILL.md`.

## 4. Workflow xây cluster

### Lưu trữ Output

Khi tạo topical map cho dự án, output lưu vào:
- **Sơ đồ topical map**: `projects/{project}/topical.md` (theo template `projects/topical-template.md`)
- **Danh sách keywords + URLs**: `projects/{project}/keywords-urls.md` (theo template `projects/keywords-urls-template.md`)

Các content skills khác (Content Writing, Blog, Pillar...) sẽ tự động đọc 2 file này trước khi viết bài.

### Bước 1. Chọn cluster topic
Mỗi cluster phải:
- Có 1 head keyword làm pillar (SV cao, intent rộng).
- Có ≥ 10–30 sub-topic làm supporting.
- Map vào 1 pain/goal của target audience.
- Liên kết tới offering của business (path to conversion).

### Bước 2. Map cluster — input từ Keyword Clustering + Semantic Research
- Pillar keyword (head keyword)
- Sub-cluster keyword (mỗi sub-cluster = 1 supporting)
- Cho mỗi supporting: 5–15 long-tail keyword variation
- **Semantic Keyword Map cho cluster** (xem `Content Writing SKILL.md` Bước 0.5):
  - Cluster-level LSI terms: entity/thuật ngữ chung cho toàn cluster (rải đều qua pillar + supporting)
  - Per-supporting keyword map: primary + secondary + long-tail + LSI riêng cho từng bài
  - PAA questions: phân bổ mỗi câu hỏi cho 1 bài supporting (tránh trùng lặp giữa các bài)

> **Nguyên tắc phân bổ keyword**: Pillar cover head keyword + overview LSI terms. Mỗi supporting "sở hữu" 1 secondary keyword + long-tail riêng. Không để 2 supporting cùng target 1 keyword (cannibalization).

### Bước 3. Skeleton cluster (ví dụ topic "SEO")

```
PILLAR: /guide/seo/  (head keyword: "seo")
├── Strategy
│   ├── /blog/keyword-research
│   ├── /blog/search-intent
│   ├── /blog/competitor-analysis
│   └── /blog/keyword-clustering
├── On-page
│   ├── /blog/title-tag
│   ├── /blog/meta-description
│   ├── /blog/internal-linking
│   └── /blog/image-seo
├── Technical
│   ├── /blog/crawlability
│   ├── /blog/site-speed
│   └── /blog/schema-markup
└── Off-page
    ├── /blog/link-building
    └── /blog/digital-pr
```

Mỗi sub-pillar (Strategy, On-page) có thể trở thành sub-pillar nhỏ → cluster cấp 2 nếu site lớn.

### Bước 4. Internal link map (must-have)
- Pillar ↔ tất cả supporting (cùng cluster).
- Supporting ↔ supporting trong cùng cluster (không phải tất cả, chọn liên quan ngữ nghĩa).
- Sub-pillar (nếu có) ↔ pillar lớn + supporting cùng nhánh.
- **⚠️ Mỗi URL nội bộ chỉ xuất hiện 1 lần duy nhất trong 1 bài viết** — lặp cùng URL ≥ 2 lần → spam risk. Supporting chỉ link về pillar 1 lần, không rải ở nhiều section.
- External link đi ra: cite authoritative source (Google docs, Search Engine Journal, Search Engine Land, Moz, Ahrefs blog).

### Bước 4.5. Topical Context Linking — Xây Topical Authority qua Context

> **⭐ QUAN TRỌNG**: Internal link chỉ mạnh 1/10 cho Topical Authority. Context + Content mới là yếu tố quyết định.
> Xem chi tiết: `knowledge/16-seo-trends-2026.md` mục 2.2

**Topical Authority không chỉ đến từ internal link**, mà từ sự liên kết ngữ nghĩa mạnh mẽ giữa các bài trong cluster với category hierarchy.

**Yêu cầu cho MỖI BÀI trong cluster:**
1. **Mở bài (first 100 words)**: Phải nhắc đến category cha → category con → chủ đề bài viết một cách tự nhiên
2. **Body**: Ít nhất 2-3 đoạn sử dụng từ đồng nghĩa, thuật ngữ liên quan để kết nối bài với cluster topic
3. **Từ ngữ**: Dùng semantic terms của cluster chung, không chỉ keyword riêng bài đó

**Ví dụ cho cluster "Ống thép đúc":**
- Bài "Tiêu chuẩn SCH40": nhắc đến "ngành ống thép công nghiệp" (cha) → "ống thép đúc" (cluster) → "schedule tiêu chuẩn Mỹ" (bài)
- Bài "Ống đúc phi 219": nhắc đến "vật liệu xây dựng" (cha) → "hệ thống đường ống" (con) → "ống đúc cỡ trung DN200" (bài)

**Checklist context linking cho cluster:**
- [ ] Pillar article nhắc đến TẤT CẢ sub-topics bằng context (không chỉ internal link)
- [ ] Mỗi supporting article nhắc đến cluster topic chung + category hierarchy
- [ ] Semantic terms của cluster (entity chung) xuất hiện đều trong tất cả bài
- [ ] Không bài nào "mồ côi" — không liên kết ngữ nghĩa với cluster

### Bước 5. Production order
Tránh viết pillar trước rồi mới supporting (link chết). Quy trình đúng:
1. Publish 5 supporting đầu tiên.
2. Publish pillar (đã có link tới supporting).
3. Publish thêm supporting còn lại (bài mới link về pillar + 2-3 supporting cũ).
4. Mỗi quý audit cluster: missing sub-topic? Bài nào underperform?

Tốc độ recommended: 1 cluster mới mỗi quý cho team 1–2 writer.

### Bước 6. Cluster completeness audit
Sau 6 tháng publish, audit cluster:
- Đối thủ cluster cùng topic có gì mình thiếu?
- PAA / "People also search" có sub-topic nào chưa cover?
- Glossary entity nào chưa có bài?
- Câu hỏi từ customer support / sales mới phát sinh?

- Bài nào thiếu Rare Attribute? (thông tin hiếm, dữ liệu gốc → Google chấm điểm Knowledge Graph cao hơn)
- Topical context linking: bài nào chưa kết nối ngữ nghĩa với category hierarchy?

→ Add to backlog, bù sub-topic + bổ sung rare attribute + topical context.

### Bước 7. Cluster expansion strategy
- **Vertical expansion**: cluster con (sub-pillar). Ví dụ pillar "SEO" → sub-pillar "Technical SEO".
- **Horizontal expansion**: cluster mới liên quan. Ví dụ "SEO" → "Content Marketing" → "Lead Gen".
- **Persona expansion**: cluster cho persona khác (ví dụ "SEO for ecommerce", "SEO for SaaS").

### Bước 8. Cluster + Programmatic SEO
Một số cluster có thể scale bằng programmatic (vd "{tool} alternative", "{city} {service}"). Xem skill Programmatic SEO.

## 5. Template Cluster Sheet

| Cluster | Pillar URL | Pillar KW | # supporting target | # supporting published | % keyword cover | Avg rank cluster | Total traffic | Conversion | Last audit |

Sub-tab cho mỗi cluster: list supporting + status + position.

## 6. KPI đo lường
- # cluster active.
- Coverage % per cluster (published / planned).
- Avg position của head keyword (pillar) per cluster.
- Total organic traffic per cluster (cohort).
- # backlink per cluster.
- Topical authority score (Ahrefs / Semrush proprietary metric).
- Conversion attribution per cluster (assisted + last-click).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Keyword Insights | Paid | Cluster generator |
| Ahrefs (Parent topic, Content Gap) | Paid | Cluster expansion |
| Semrush Topic Research | Paid | Sub-topic ideas |
| Surfer Topical Map | Paid | Map topic + clusters |
| Frase Topic Planner | Paid | Pillar + supporting plan |
| MarketMuse | Paid | Topic modeling enterprise |
| Notion / Airtable | Free | Cluster tracker |
| InLinks | Paid | Entity-based internal link auto |
| Sitebulb | Paid | Visualize cluster internal link |
| ChatGPT/Claude | Freemium | Brainstorm sub-topic, gap fill |

### Prompt LLM
```
Bạn là chiến lược gia content. Cho topic pillar "{topic}" target audience "{audience}", đề xuất:
- 1 head keyword pillar.
- 20-30 supporting article (mỗi cái: keyword, intent, outline 1 dòng).
- Phân nhánh theo nhóm (Strategy/Technical/etc).
- Internal link map ASCII tree.
Trả về dạng table + tree.
```

## 8. Common mistakes
- Viết bài rời rạc, không thuộc cluster nào.
- Pillar không có supporting cùng publish → cô lập.
- Supporting không link về pillar.
- 1 keyword bị nhiều supporting nhắm (cannibalization) — phải có Keyword Clustering làm trước.
- Cluster quá rộng (vd "Marketing") → không đủ depth, không thắng nổi.
- Cluster quá hẹp → không đủ supporting, không đáng đầu tư.
- Coverage không ưu tiên — viết bài random thay vì lấp gap quan trọng.
- Không audit cluster theo quarter → cluster outdated.
- Bỏ qua external link out → tín hiệu trust thấp hơn cluster đối thủ cite source tốt.
- Không kết nối cluster với business → traffic cao nhưng không convert.
- Toàn bộ supporting viết AI generic, cùng giọng → cluster mất EEAT + bị detector đánh dấu hàng loạt.

> ⚠️ **Anti-AI Detection**: Mỗi bài trong cluster PHẢI có giọng văn người thật, ví dụ cụ thể, quan điểm rõ ràng. Tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md` — Vocabulary Blacklist VN+EN (1A-1F), Structural Replacement (2A-2F), Humanization (3.1-3.6), Self-Correction + Red Flag Check. MỤC TIÊU: 🟢 0-2 red flags. Chi tiết: section 2.4 trong `skills/content/Content Writing/SKILL.md`.

> ⚠️ **Markdown Rule**: KHÔNG dùng `---` (horizontal rule / thẻ `<hr>`) trong bài viết output. Dùng heading (`##`, `###`) để tách section, hoặc 1 dòng trống.

## 8.5. Session End Protocol — Update Memory (BẮT BUỘC cuối phiên)

Tạo topical map là Key Decision lớn cho cả dự án → PHẢI update `projects/{project}/memory.md` (checklist 7 điểm — đồng bộ Content Writing Phase 7):

```
[ ] Append Session History (date, CLI/model, "tạo/cập nhật topical map cluster X", files touched)
[ ] Append Recent Articles (KHÔNG áp dụng — topical map không phải article)
[ ] Edit Active Context — "Cluster đang focus: {tên cluster mới}, production order: 5 supporting trước → pillar"
[ ] Edit Pending Tasks — append từng supporting cần viết theo production order
[ ] Append Key Decisions — cluster boundary, head keyword pillar, số supporting dự kiến, internal link strategy
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi (hiếm)
[ ] Commit memory.md trong cùng commit với topical.md / keywords-urls.md
```

Chi tiết: `skills/project-memory/SKILL.md` + `skills/content/Content Writing/SKILL.md` Phase 7.

---
**Đầu ra**: Cluster Map có pillar + supporting + internal link plan + production schedule + audit cadence.
