# COMPILED CONTEXT — Fast-Lane Skill Digest

> **AI assistant đọc file này TRƯỚC TIÊN mỗi phiên** thay vì tải 62 skill + 17 knowledge notes.
> Mục tiêu: bootstrap context < 5k token. Chỉ deep-dive `SKILL.md` cụ thể KHI cần workflow chi tiết.
>
> File này được duy trì thủ công. Khi `skills/` hoặc `knowledge/` thay đổi đáng kể → cập nhật ở đây.
>
> **v1.5.1 (Antigravity-ready, 2026-05-27 r2)**: Skill discovery layout:
> - Source of truth (human-friendly): `skills/<category>/<Name>/SKILL.md` (Title Case, category-nested)
> - Antigravity workspace (FLAT mirror): `.agents/skills/<skill_name>/SKILL.md`
> - Antigravity global: `~/.gemini/antigravity-cli/skills/<skill_name>/SKILL.md` (qua `scripts/install-skills-global.sh`)
>
> ⚠️ Antigravity KHÔNG recurse category subfolders — mirror PHẢI flat = 1 folder/skill, name từ frontmatter `name:`. Edit chỉ ở `skills/`, sync qua `bash scripts/sync-agents-skills.sh`.

## 0. SESSION BOOTSTRAP — 3 bước AI làm đầu phiên

```
1. ĐỌC file này (COMPILED-CONTEXT.md) → có skill router + anti-AI rules
2. NẾU task gắn với 1 dự án cụ thể:
   - Đọc projects/{project}/memory.md TRƯỚC TIÊN (cache trạng thái)
   - Chỉ đọc profile.md / topical.md / keywords-urls.md / external-sources.md NẾU memory.md không đủ context
3. NẾU cần workflow chi tiết của 1 skill → mở SKILL.md tương ứng (xem mục 2 bên dưới)
```

**Không nên**: đọc tuần tự toàn bộ `skills/` ngay đầu phiên (lãng phí 30-50k token).

## 1. PROJECT MEMORY PROTOCOL — Tránh quên giữa các phiên

Mỗi dự án có 1 file `projects/{project}/memory.md` đóng vai trò "bộ nhớ dài hạn":

| Section | Để làm gì |
|---------|-----------|
| **Project Quick Facts** | 5-10 dòng cốt lõi, thay cho việc mở `profile.md` |
| **Active Context** | Cluster đang build, content type focus, sprint goal |
| **Session History** | 10 phiên gần nhất + tasks + files |
| **Recent Articles** | 10 bài publish gần nhất |
| **Pending Tasks** | Carry-over qua phiên — không bị "quên" |
| **Key Decisions** | Quyết định đã chốt, append-only, không tranh luận lại |

**Cuối mỗi phiên, AI BẮT BUỘC chạy Session End Protocol** (xem `skills/project-memory/SKILL.md` mục 4.3):
1. Append entry vào Session History
2. Append article mới vào Recent Articles (nếu có publish)
3. Edit Active Context nếu chuyển focus
4. Edit Pending Tasks: xóa done, thêm mới
5. Append Key Decisions nếu có chốt mới
6. Commit `memory.md` cùng commit với output

## 2. SKILL ROUTER — Task → File cần đọc

### 2.1. Knowledge Notes (đọc tổng quan trước khi vào SKILL chi tiết)

| Keyword trigger | Knowledge note |
|-----------------|----------------|
| central entity, source context, topical map | `knowledge/01-seo-foundations.md` |
| keyword research, search intent, competitor, cluster | `knowledge/02-strategy.md` |
| title tag, meta description, H1, URL, internal link, image alt | `knowledge/03-on-page-seo.md` |
| blog, pillar, topic cluster, evergreen, content refresh | `knowledge/04-content-seo.md` |
| crawl, index, sitemap, schema, Core Web Vitals | `knowledge/05-technical-seo.md` |
| backlink, link building, guest post, digital PR | `knowledge/06-off-page-seo.md` |
| hreflang, multilingual, geo target | `knowledge/07-international-seo.md` |
| GA4, Search Console, rank tracking, KPI | `knowledge/08-analytics.md` |
| page speed, mobile, A/B test, conversion funnel | `knowledge/09-ux.md` |
| EEAT, helpful content, trust signal | `knowledge/10-eeat-content-quality.md` |
| entity SEO, NLP, Knowledge Graph | `knowledge/11-entity-seo.md` |
| AI Overview, ChatGPT, Perplexity, GEO, LLM | `knowledge/12-ai-seo.md` |
| topical authority, content scaling, link acquisition | `knowledge/13-growth.md` |
| GBP, Facebook, Zalo, local SEO, brand presence | `knowledge/14-brand-distribution.md` |
| anti-AI, humanize, từ cấm, giọng văn | `knowledge/15-anti-ai-content-rules.md` |
| rare attribute, phantom keywords, topical authority via context | `knowledge/16-seo-trends-2026.md` |
| project memory, session memory, context cache | `knowledge/17-project-memory.md` |

### 2.2. Master Skills (master = bắt buộc trước task tương ứng)

| Task | Master Skill |
|------|-------------|
| Viết bất kỳ bài nào | `skills/content/Content Writing/SKILL.md` ⭐ |
| Áp dụng phong cách viết theo dự án | `skills/style-mimicker/SKILL.md` ⭐ |
| Quản lý trạng thái dự án giữa các phiên | `skills/project-memory/SKILL.md` ⭐ |
| Audit 1 bài đơn lẻ (E-E-A-T & SEO) + Duplicate Detection vs `keywords-urls.md` + External Citation Check vs `external-sources.md` + Verdict 4 trạng thái — command `/audit` v1.2 | `skills/content/Content Evaluation/SKILL.md` ⭐ |
| Audit topical (cluster-level) | `skills/content/Topical Audit/SKILL.md` |
| Tạo topical map | `skills/content/Topic Clusters/SKILL.md` |
| Brand distribution end-to-end | `playbooks/07-brand-distribution-workflow.md` |

### 2.2.1. Slash Commands (hoạt động ưu tiên cao hơn keyword match)

| Command | Skill kích hoạt | Mục đích |
|---------|-----------------|---------|
| `/audit` | `skills/content/Content Evaluation/SKILL.md` v1.2 | Audit 1 bài viết (single-article) theo E-E-A-T & SEO 2026 + Duplicate Detection (vs `keywords-urls.md` schema v1.1, 7 cột) + **External Citation Check** (vs `external-sources.md` whitelist 3-tier, v1.2) + Verdict 4 trạng thái (🟢 GIỮ / 🟡 CẬP NHẬT / 🟠 LÀM MỚI / 🔴 XÓA) trên thang 100đ → output `audit/evaluation-{slug}-{date}.md` |

**Anti-collision**: `/audit` LUÔN route đến `Content Evaluation`. KHÔNG nhầm sang `Topical Audit` (cluster-level) hay `Content Refresh` (decay-level).

### 2.3. Playbooks End-to-End (7 cái)

| Playbook | Use case |
|----------|----------|
| `playbooks/01-keyword-research-workflow.md` | Seed → cluster → roadmap |
| `playbooks/02-content-brief-workflow.md` | SERP → outline → brief |
| `playbooks/03-technical-seo-audit.md` | 14-phase audit |
| `playbooks/04-content-refresh.md` | Identify decay → refresh |
| `playbooks/05-link-outreach.md` | Prospect → sequence → win |
| `playbooks/06-ai-llm-visibility-audit.md` | 5-engine audit |
| `playbooks/07-brand-distribution-workflow.md` | GBP + FB + Zalo unified calendar |

### 2.4. Project ↔ Style Profile Mapping

| Project | Style Profile | Đặc điểm 1 dòng |
|---------|---------------|----------------|
| `thep-bao-tin` | `thep-bao-tin.json` | B2B thép, "Thép Bảo Tín/chúng tôi" + "bạn", 4 loại bài, data integrity 100% |
| `binhnn-digital` | `binhnn-digital.json` | Personal brand, "tui" (cá nhân), data anchoring, provocative |
| `hatcapherangxay` | `hatcapherangxay.json` | Cà phê, gần gũi, chia sẻ kinh nghiệm 5 năm |

## 3. CONTENT WRITING PHASES — Workflow rút gọn

| Phase | Mục đích | Output cốt lõi |
|-------|----------|----------------|
| **-2** (v1.3) | Detect Project/Style → Fallback `_demo` | Nếu không detect được project name + không có style profile name → load `projects/_demo/style-guide.md`, SKIP toàn bộ Phase -1 + Phase 5 + Phase 6, output đặt trong `projects/_demo/writing/{yyyy-mm-dd}-{slug}.md` |
| **-1** | Load Project Context (skip nếu Phase -2 rơi `_demo`) | Đọc `memory.md` trước, rồi `profile.md` / `topical.md` / `keywords-urls.md` / `external-sources.md` (whitelist nguồn ngoài, v1.2) |
| **0** | Competitor Research + Semantic Keywords | Top 10 SERP, Information Gain, Keyword Map (primary/secondary/long-tail/LSI/PAA), Rare Attribute |
| **1** | User Research | Trả lời 4 câu hỏi tâm lý (xem mục 4) |
| **2** | Outline theo User Journey | Cấu trúc H2/H3 theo hành trình tâm lý, không theo "là gì → tại sao → cách làm" |
| **3** | Viết Draft | Hook 100 từ đầu + Topical Context Linking (cha→con→cháu) + Rare Attribute + giải quyết vấn đề |
| **4** | EEAT + GEO + Rare Attribute + Topical Context Check | 7-point keyword coverage check |
| **5** | Voice Polish + Style Mimicker | Áp dụng style profile, chạy 4 Rulesets Anti-AI |
| **6** | Internal Link + SEO Meta Check | Chèn link từ `keywords-urls.md` (mỗi URL 1 lần), SEO Metadata blockquote 12 trường |
| **7 (Session End)** | Update Memory | Append vào `projects/{project}/memory.md` (Session End Protocol) |

Workflow chi tiết: `skills/content/Content Writing/SKILL.md`.

## 4. USER PSYCHOLOGY — 4 câu hỏi BẮT BUỘC

Trước khi viết bất kỳ bài nào, trả lời 4 câu này:

1. **Họ đang gặp vấn đề gì?** (pain point cụ thể)
2. **Họ đang sợ điều gì?** (rào cản tâm lý / rủi ro)
3. **Họ muốn được tư vấn/hỏi đáp gì?** (câu hỏi trong đầu họ)
4. **Họ cần đọc gì để ra quyết định?** (output cần thiết: bảng so sánh, checklist, bảng giá, case study)

⚠️ Đây là research **NỘI BỘ**. KHÔNG đưa các câu trả lời này vào bài viết output.

## 5. ANTI-AI RULES — 4 Rulesets RÚT GỌN

Mục tiêu: bài đạt 🟢 0-2 red flags. Chi tiết: `knowledge/15-anti-ai-content-rules.md`.

### Ruleset 1 — Từ cấm (blacklist)

**VN core (luôn cấm):**
Đột phá · Cách mạng hóa · Chìa khóa (để) · Cốt lõi (là) · Thúc đẩy · Tận dụng · Đáng chú ý · Thú vị thay · Hơn nữa · Ngoài ra · Bên cạnh đó · Tóm lại · Nhìn chung

**VN extended:**
Đắm chìm · Khám phá (hãy cùng) · Toàn diện · Nổi bật · Đa dạng · Đóng vai trò quan trọng · Hành trình · Nền tảng vững chắc · Liền mạch · Nâng tầm · Trao quyền · Minh chứng · Không thể phủ nhận · Sâu sắc

**EN top banned:**
Delve · Tapestry · Landscape (nghĩa bóng) · Leverage · Robust · Comprehensive · Seamless · Empower · Streamline · Holistic · Paradigm · Groundbreaking · Cutting-edge · Myriad · Plethora

**EN filler:**
Essentially · Fundamentally · Significantly · Additionally · Ultimately · Undoubtedly · Arguably · Remarkably

### Ruleset 2 — Mẫu câu cấm

- Mở bài: "Trong thế giới/kỷ nguyên số ngày nay...", "Không thể phủ nhận rằng...", "Như chúng ta đã biết...", "Trong bài viết này, chúng ta sẽ..."
- Đệm: "Với điều đó trong đầu...", "Điều này đưa chúng ta đến...", "Hãy xem xét kỹ hơn..."
- Kết bài: "Tóm lại,...", "Kết luận lại,...", "Hy vọng bài viết đã mang đến cho bạn cái nhìn toàn diện..."
- CTA rập khuôn: "Hãy chia sẻ ý kiến trong phần bình luận!", "Đăng ký để nhận thêm nhiều nội dung giá trị!"

### Ruleset 3 — Pattern VN đặc trưng AI

- Lạm dụng "sự" + danh từ → dùng động từ
- Dùng "được" quá nhiều → viết chủ động
- "không chỉ...mà còn" lặp → tách câu
- Lạm dụng "một cách" → bỏ
- "Hãy" mệnh lệnh liên tục → "Bạn nên..."
- Em dash (—) tạo rhythm break → dấu phẩy hoặc tách câu

### Ruleset 4 — Self-Correction Workflow (chạy trước khi giao bài)

1. **Find & Replace**: Quét bài, xóa/thay từ cấm (Ruleset 1)
2. **Tone Check**: Đúng giọng theo style profile dự án chưa?
3. **Data Integrity**: Số liệu kỹ thuật khớp 100% với bản gốc? (đặc biệt với Thép Bảo Tín)
4. **Content Type Check**: Đúng loại bài (A/B/C/D nếu Thép Bảo Tín)?
5. **Red Flag Check**: Đếm flags, mục tiêu 🟢 0-2

### 10 Red Flags

```
1. Dùng "delve" / "landscape" / "comprehensive"
2. Mở + kết bài đều câu hỏi tu từ
3. Liệt kê đúng 5/10 tips đều đặn
4. Đoạn văn đều đặn cùng độ dài
5. Quá hoàn hảo, không có nuance/caveat
6. Thiếu dẫn nguồn/tiêu chuẩn cụ thể
7. Filler: "it is important to note"
8. Title: "Ultimate Guide" / "Deep Dive"
9. Có Key Takeaways box (cho dự án không cho phép)
10. Dùng em dash (—) nhiều lần
```

### Format cấm tuyệt đối

- KHÔNG dùng `---` (horizontal rule) trong nội dung bài viết — chỉ dùng trong cú pháp bảng `| --- |`
- KHÔNG dùng YAML frontmatter (`---` mở/đóng đầu file) — dùng blockquote `>` cho SEO Metadata
- KHÔNG dùng em dash (`—`) — thay bằng dấu phẩy, chấm phẩy, hoặc tách câu

## 6. SEO METADATA BLOCKQUOTE — 12 trường chuẩn

Đầu bài viết, BẮT BUỘC:

```markdown
> **SEO Metadata**
> - **title**: "Tiêu đề bài viết"
> - **slug**: "slug-url"
> - **meta_title**: "SEO title 50-60 ký tự, keyword đầu, brand cuối"
> - **meta_description**: "150-160 ký tự, value-prop + CTA"
> - **project**: "tên dự án"
> - **cluster**: "tên cluster"
> - **role**: "pillar | supporting"
> - **target_keyword**: "keyword chính"
> - **semantic_keywords**: "từ khóa ngữ nghĩa, phân cách bằng phẩy"
> - **search_intent**: "I | N | C | T"
> - **word_count**: 0
> - **created**: "YYYY-MM-DD"

# Tiêu đề H1
```

## 7. SEO TRENDS 2026 — 3 chiến thuật cốt lõi

| Chiến thuật | Áp dụng khi viết |
|-------------|-------------------|
| **Rare Attribute** | Mỗi bài có ≥ 1-2 thông tin hiếm: kinh nghiệm dự án thực, dữ liệu gốc, case study sai lầm |
| **Topical Context Linking** | Mở bài (100 từ đầu) nhắc category hierarchy cha → con → cháu tự nhiên |
| **Phantom Keywords** | Content Refresh — lấy keyword phụ từ Search Console, chèn vào bài đang rank, định kỳ 1 tháng/lần |

Chi tiết: `knowledge/16-seo-trends-2026.md`.

## 8. INTERNAL LINKING — Quy tắc

- Mỗi URL nội bộ xuất hiện DUY NHẤT 1 LẦN trong 1 bài viết
- Anchor descriptive, chứa keyword tự nhiên (KHÔNG dùng "click here", "xem thêm")
- Supporting → 1 link về pillar
- Pillar → link xuống mỗi supporting 1 lần
- Link ngang trong cùng cluster: chỉ khi thực sự liên quan ngữ nghĩa

## 8.5. INTENT DISAMBIGUATION — Quick Reference (v1.4 — fix bug output path)

> Trước khi tạo file output, AI BẮT BUỘC map intent → skill → subfolder. KHÔNG mặc định "viết lại" = Content Writing → tránh bug save vào root project.

| Cụm từ user nói | Skill kích hoạt | Subfolder | Filename pattern |
|----------------|------------------|-----------|------------------|
| "viết bài mới", "viết bài", "tạo bài" về X | Content Writing | `writing/` | `{slug-tieu-de}.md` |
| "viết lại {file}.md", "refresh {file}.md", "cập nhật {file}.md", "tối ưu lại {file}.md" | **Content Refresh** (mặc định khi mơ hồ) | `refresh/` | GIỮ slug gốc: `{slug-bai-cu}.md` |
| "rewrite từ đầu {file}.md", "viết lại hoàn toàn từ đầu" | Content Writing (verdict 🟠 LÀM MỚI) | `writing/` HOẶC `refresh/{slug}-v2.md` | hỏi user |
| "/audit {URL}", "audit {file}.md", "đánh giá bài X" | Content Evaluation | `audit/` | `audit-{yyyy-mm-dd}-{slug}.md` |
| "viết brief", "brief cho bài X" | Content Writing (Brief mode) | `research/` | `brief-{slug-tieu-de}.md` |
| "keyword research" | Keyword Research | `research/` | `keyword-research.md` hoặc `keyword-research-{cluster}.md` |
| "audit cluster", "topical audit" | Topical Audit | `audit/` | `audit-{cluster}-{yyyy-mm-dd}.md` |
| "schema {Type}", "tạo JSON-LD" | Schema Markup | `technical/` | `schema-{Type}.json` |

**Locate file gốc khi user đề cập filename**:
1. Search `projects/{project}/{writing,refresh,research,audit,archive}/{filename}`
2. KHÔNG tìm thấy → hỏi user 1 lần, KHÔNG đoán
3. Tìm thấy ở ROOT `projects/{project}/{filename}` → WARN file legacy sai vị trí, đề xuất MOVE sang `writing/` trước khi refresh

**Bug đã ghi nhận** (v1.4): User yêu cầu *"viết lại abc.md cho thép bảo tín"* → AI save thẳng vào `projects/thep-bao-tin/abc.md` (ROOT). **SAI**. Phải là `projects/thep-bao-tin/refresh/abc.md`. Xem chi tiết: `skills/content/Content Writing/SKILL.md` Phase -0.5 + `skills/content/Content Refresh/SKILL.md` PRE-FLIGHT.

## 9. PROJECT FOLDER STRUCTURE (2026 — folder-scoped)

```
projects/
├── _demo/               ⭐ (v1.3) Fallback cho ad-hoc content (KHÔNG project + KHÔNG style)
│   ├── README.md        ← Hướng dẫn cấu trúc + quy tắc đặt tên
│   ├── style-guide.md   ← ~875 dòng anti-AI rule + bảng AI-isms tiếng Việt + tiếng Anh
│   ├── style-guide-en.md← Bản tiếng Anh gốc (reference)
│   ├── writing/{yyyy-mm-dd}-{slug}.md   ← Output ad-hoc content
│   ├── refresh/{yyyy-mm-dd}-{slug}.md   ← Output ad-hoc refresh
│   └── audit/{yyyy-mm-dd}-{slug}.md     ← Output ad-hoc audit (bài ngoài project)
│
└── {ten-du-an}/         ← Project thật (Vd: thep-bao-tin, binhnn-digital, hatcapherangxay)
    ├── memory.md            ← Bộ nhớ giữa các phiên (đọc TRƯỚC TIÊN, file lõi root)
    ├── profile.md           ← Brand voice + USP + business context (file lõi root)
    ├── topical.md           ← Sơ đồ topical map (file lõi root)
    ├── keywords-urls.md     ← Keyword + URL đã publish (file lõi root)
    ├── external-sources.md  ← (v1.2) Whitelist nguồn ngoài 3-tier (cơ quan / báo chí / chuyên gia) — tùy chọn
    │
    ├── writing/             ⭐ Bài viết MỚI (blog/pillar/supporting/tools/evergreen/pSEO)
    ├── refresh/             ⭐ Bài REFRESH/optimize content cũ
    ├── research/            ⭐ Keyword research + Content brief
    ├── audit/               ⭐ Topical + Content audit
    ├── technical/           ⭐ Technical SEO audit + JSON-LD schema snippets
    ├── brand-distribution/  GBP / FB / Zalo plans (giữ nguyên)
    └── archive/             ⭐ Memory rotation + lưu trữ
```

**Quy tắc**: 5 file lõi (`memory.md`, `profile.md`, `topical.md`, `keywords-urls.md`, `external-sources.md`) ở ROOT mỗi project. Mọi output khác PHẢI vào subfolder. KHÔNG lưu `{slug}.md` trực tiếp ở root project. File `external-sources.md` (v1.2) tùy chọn — không có → skip External Citation Check. **Fallback `_demo` (v1.3)**: kích hoạt khi không detect được project name + không có style profile name → output đặt trong `projects/_demo/{writing|refresh|audit}/{yyyy-mm-dd}-{slug}.md`, KHÔNG cập nhật memory project nào.

Naming convention output (full path):

| Deliverable | Path |
|-------------|------|
| Bài viết mới | `projects/{project}/writing/{slug-tieu-de}.md` |
| Bài viết ad-hoc (v1.3, không project) | `projects/_demo/writing/{yyyy-mm-dd}-{slug}.md` |
| Bài refresh | `projects/{project}/refresh/{slug-tieu-de}.md` |
| Keyword research | `projects/{project}/research/keyword-research.md` hoặc `research/keyword-research-{cluster}.md` |
| Content brief | `projects/{project}/research/brief-{slug-tieu-de}.md` |
| Topical/content audit | `projects/{project}/audit/audit-{yyyy-mm-dd}.md` |
| Technical audit | `projects/{project}/technical/audit-{yyyy-mm-dd}.md` |
| JSON-LD schema | `projects/{project}/technical/schema-{Type}.json` |
| Weekly plan brand | `projects/{project}/brand-distribution/plan-tuan-{X}-thang-{M}-{YYYY}.md` |
| Memory rotation | `projects/{project}/archive/memory-{YYYY-MM}.md` |

## 10. SESSION END PROTOCOL — Bắt buộc cuối phiên

Trước khi report task completion cho user:

```
[ ] Đã append entry vào projects/{project}/memory.md → Session History?
[ ] Đã update Recent Articles nếu có publish?
[ ] Đã update Active Context nếu chuyển cluster/focus?
[ ] Đã update Pending Tasks (xóa done, thêm mới)?
[ ] Đã append Key Decisions nếu chốt quyết định mới?
[ ] Đã commit memory.md trong cùng commit với output?
```

Chi tiết: `skills/project-memory/SKILL.md`.

## 11. WHAT NOT TO DO (chống lãng phí token)

| Hành vi | Tại sao tránh |
|---------|---------------|
| Đọc toàn bộ `skills/**/*.md` đầu phiên | Lãng phí 30-50k token. Đọc COMPILED-CONTEXT + memory là đủ cho 80% task |
| Đọc lại `profile.md` mỗi phiên dù không cần | Quick Facts trong memory.md đã đủ. Chỉ mở khi cần USP chi tiết |
| Đọc `keywords-urls.md` toàn bộ khi chỉ cần 5 URL | Dùng grep filter theo cluster |
| Đọc cả 16 knowledge notes | Chỉ đọc note theo trigger keyword (mục 2.1) |
| Bỏ qua Session End Protocol | Phiên sau AI lại "quên", phải tốn token tái dựng context |

---

*COMPILED-CONTEXT v1.0 — Thay thế bootstrap 30-50k token bằng ~4k token. Cập nhật khi skill/knowledge thay đổi đáng kể.*
