# Project Memory — Bộ nhớ ngữ cảnh dự án giữa các phiên AI

> **Output path 2026 (folder-scoped)**:
> - **memory.md đang dùng** → `projects/{project}/memory.md` (root project, file lõi — KHÔNG đổi)
> - **memory rotation (khi Session History > 10 entries)** → `projects/{project}/archive/memory-{YYYY-MM}.md` (subfolder `archive/`)
>
> Tạo folder `archive/` lần đầu khi cần rotate. Memory archive là append-only, dùng để tra cứu lịch sử dài hạn khi cần. Chi tiết workflow rotation: section 4.4 bên dưới.

## 1. Purpose / Mục đích

Skill này giải quyết 2 vấn đề kinh điển khi dùng CLI AI (Claude Code, Cursor, Codex, Gemini CLI) cho dự án dài hạn:

| Vấn đề | Hậu quả | Giải pháp của skill này |
|--------|---------|-------------------------|
| **A. Mỗi phiên đọc lại toàn bộ skill** (60 skill + 16 knowledge) | Tốn ~30-50k token mỗi phiên chỉ để bootstrap context | Đọc `COMPILED-CONTEXT.md` (~3-5k token) thay thế, chỉ deep-dive skill cụ thể khi cần |
| **B. AI không nhớ gì giữa các phiên** | Mỗi lần mở CLI lại phải kể lại đã làm gì, đã quyết gì | Đọc `projects/{ten-du-an}/memory.md` — AI tự cập nhật cuối phiên |

**Nguyên tắc**: Memory KHÔNG thay thế `profile.md` / `topical.md` / `keywords-urls.md`. Memory là **lớp tóm tắt mỏng** ghi lại **tiến trình thời gian** (đã làm gì, đã chốt gì, còn pending gì) — phần mà 3 file kia không có.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1. Hai lớp bộ nhớ

```
LỚP 1 — COMPILED-CONTEXT.md (Repo-level Digest)
└── Nén toàn bộ skill router + Anti-AI rules + Phase workflow
└── Mỗi phiên AI đọc file này thay vì 60 skill files
└── Static — chỉ update khi skill thay đổi (manual hoặc script)

LỚP 2 — projects/{project}/memory.md (Project-level State)
└── Trạng thái dự án theo thời gian
└── AI cập nhật mỗi phiên (Session End Protocol)
└── Dynamic — append-only log + active context section
```

### 2.2. Memory.md gồm 6 section bắt buộc

| Section | Nội dung | Cập nhật |
|---------|----------|----------|
| **Session History** | Log 10 phiên gần nhất: ngày, task, files | Append-only |
| **Active Context** | Cluster đang build, style profile, content type focus | Overwrite |
| **Recent Articles Published** | 10 bài gần nhất: title, URL, cluster, role, date | Append, giữ 10 |
| **Pending Tasks** | Task chưa xong, được carry-over qua phiên | Edit |
| **Key Decisions** | Quyết định kỹ thuật/style đã chốt | Append-only |
| **Project Quick Facts** | Cache 5-10 dòng từ profile.md để khỏi mở profile | Overwrite khi profile đổi |

### 2.3. Phân biệt với các file dự án khác

| File | Loại dữ liệu | Cập nhật |
|------|-------------|----------|
| `profile.md` | Tĩnh: brand, domain, USP, ICP | Hiếm khi |
| `topical.md` | Tĩnh: sơ đồ topical map | Khi mở cluster mới |
| `keywords-urls.md` | Bán động: danh sách URL đã publish | Sau mỗi bài publish |
| `memory.md` | Động: trạng thái thời gian + tiến trình | Sau mỗi phiên |

## 3. When to use / Khi nào dùng

### Dùng skill này khi:
- Dự án có ≥ 5 phiên làm việc (đủ dài để cần bộ nhớ)
- Có nhiều bài viết publish theo thời gian
- AI hay "quên" pending tasks giữa các phiên
- Cần giảm token bootstrap mỗi phiên

### KHÔNG cần dùng khi:
- Phiên 1 lần, làm 1 task xong rời
- Dự án mới khởi tạo, chưa có bài viết nào

## 4. Workflow / Quy trình triển khai

### 4.1. Khởi tạo memory.md cho dự án mới

```
1. Copy projects/memory-template.md → projects/{project}/memory.md
2. Điền "Project Quick Facts" từ profile.md (~5-10 dòng)
3. Điền "Active Context" với cluster đang ưu tiên
4. Để trống Session History, Recent Articles, Pending, Decisions
   → Sẽ tự bồi đắp qua các phiên sau
```

### 4.2. Session Bootstrap Protocol — AI làm gì đầu phiên

**Khi user trigger task cho 1 dự án cụ thể**, AI THỰC HIỆN THEO THỨ TỰ:

```
Bước 1: Đọc COMPILED-CONTEXT.md (luôn luôn, mọi task)
        → Lấy skill router, anti-AI rules, phase workflow

Bước 2: Detect project → projects/{project}/memory.md
        → Đọc TRƯỚC TIÊN (nhỏ, nhanh, có context tổng quan)
        → Quick Facts → biết brand voice/USP
        → Active Context → biết cluster đang ưu tiên
        → Pending Tasks → biết task chưa xong
        → Recent Articles → biết bài nào vừa publish

Bước 3: Chỉ đọc các file sau NẾU memory.md không đủ:
        - profile.md (khi cần USP/business context chi tiết)
        - topical.md (khi cần xác định cluster/role cho bài mới)
        - keywords-urls.md (khi cần internal link cụ thể)
        - SKILL.md cụ thể (khi cần workflow chi tiết của 1 skill)
```

**Kết quả**: Token bootstrap giảm từ ~30-50k xuống ~5-8k cho task thường gặp.

### 4.3. Session End Protocol — AI làm gì cuối phiên

**Trước khi report task completion cho user**, AI BẮT BUỘC chạy checklist 7 điểm (đồng bộ với Content Writing Phase 7):

```
1. SCAN PHIÊN VỪA LÀM:
   - Đã viết/sửa file nào? (git status / commit log)
   - Đã chốt quyết định gì? (style, kỹ thuật, hướng đi)
   - Còn pending gì? (TODO, follow-up)

2. UPDATE memory.md — checklist 7 điểm:
   1) Append entry mới vào Session History (date, CLI/model, task done, files touched, pending carry-over)
   2) Append article vừa publish vào Recent Articles (date, title, URL, cluster, role) — bỏ qua nếu task không publish (audit / keyword research / setup...)
   3) Edit Active Context (cluster đang ưu tiên, content type focus, last_updated)
   4) Edit Pending Tasks (xóa done, thêm mới phát sinh)
   5) Append Key Decisions (style / kỹ thuật / cluster boundary / merge-delete decisions đã chốt phiên này) — KHÔNG bỏ qua, cực quan trọng cho audit + refresh
   6) Refresh Quick Facts CHỈ KHI profile.md đổi (80% case: KHÔNG cần)
   7) Commit memory.md trong cùng commit với bài viết/output (tránh memory dirty)

2.5. UPDATE keywords-urls.md (nếu phiên vừa publish bài mới HOẶC audit ra Verdict 🔴 XÓA):
   - **Publish bài mới**: append row 7 cột vào cluster tương ứng:
     `| # | Keyword | Tiêu đề | URL | Cluster | Vai trò | Intent |`
     Lấy `Tiêu đề` = Title Tag thực tế của bài vừa publish. KHÔNG để `—` nếu bài đã publish.
   - **Audit Verdict = 🔴 XÓA / 301**: comment row tương ứng:
     `<!-- DELETED YYYY-MM-DD: 301 → {URL đích} -->`
     KHÔNG xóa row khỏi file (giữ lịch sử).
   - **Audit Verdict = 🟢/🟡/🟠**: không sửa `keywords-urls.md`, chỉ log vào Session History.
   - **Backward compat**: Nếu file vẫn schema cũ (8 cột có Trạng thái) → cảnh báo user migrate sang v1.1 (7 cột, bỏ Trạng thái + thêm Tiêu đề).

2.6. (v1.2) ĐỀ XUẤT cập nhật external-sources.md (nếu phiên có dùng/phát hiện nguồn ngoài whitelist):
   - **Phiên Content Writing/Refresh dùng nguồn không có trong whitelist** (vì project chưa fill, hoặc user paste link mới): AI hỏi user xác nhận trước khi cite. Nếu user đồng ý dùng → ghi vào Session History "Pending: thêm {domain} vào external-sources.md".
   - **Phiên Content Evaluation phát hiện violation**: append vào Pending Tasks: "Review {N} URL ngoài whitelist (xem audit report Section 5.6)".
   - **AI KHÔNG TỰ APPEND** vào `projects/{project}/external-sources.md`. User phải tự thêm thủ công sau khi review.
   - Nếu project chưa có file `external-sources.md` → suggest 1 lần ở Session End: "Cân nhắc tạo `projects/{project}/external-sources.md` từ `projects/external-sources-template.md` để enable External Citation Check (Phase 3.5)."

3. INFORM user:
   - "Đã cập nhật memory.md: {section_thay_doi}" + (nếu có) "keywords-urls.md: thêm {N} entry / mở {N} entry xóa" + (v1.2, nếu có) "Pending external-sources.md: {N} domain chờ user review".
```

> ⭐ **Source of truth**: Checklist 7 điểm này khớp từng điểm với `skills/content/Content Writing/SKILL.md` Phase 7 và với Session End block trong tất cả sub-skill content (Blog / Pillar / Topic Clusters / Tools / Evergreen / pSEO / Refresh / Audit — section 8.5 hoặc Phase 6 của mỗi skill).

### 4.4. Bảo trì memory.md — Khi nào nên trim

| Trigger | Hành động |
|---------|-----------|
| Session History > 10 entries | Giữ 10 mới nhất, archive cũ vào `projects/{project}/archive/memory-{YYYY-MM}.md` (subfolder `archive/`, 2026 standard) |
| Recent Articles > 10 entries | Giữ 10 mới nhất, danh sách đầy đủ ở `keywords-urls.md` |
| Pending Tasks > 30 days old | Đánh dấu stale, hỏi user có còn ưu tiên không |
| Key Decisions không bao giờ trim | Đây là "trí nhớ dài hạn", giữ vĩnh viễn |

## 5. Template / Checklist

### Template memory.md
Xem: `projects/memory-template.md`

### Session End Checklist (7 điểm — source of truth)

```
[ ] (1) Đã append entry mới vào Session History (date, CLI/model, task done, files touched, pending carry-over)?
[ ] (2) Đã cập nhật Recent Articles nếu có bài mới publish (date, title, URL, cluster, role)?
[ ] (3) Đã edit Active Context (cluster đang ưu tiên, content type focus, last_updated)?
[ ] (4) Đã edit Pending Tasks (xóa done + thêm mới phát sinh)?
[ ] (5) Đã append Key Decisions (style / kỹ thuật / cluster boundary / merge-delete đã chốt phiên này)?
[ ] (6) Refresh Quick Facts CHỈ KHI profile.md đổi (80% case: skip)?
[ ] (7) Đã commit memory.md trong cùng commit với output?
[ ] (v1.1, có điều kiện) Nếu phiên vừa publish bài → đã append entry 7 cột vào `keywords-urls.md`?
[ ] (v1.1, có điều kiện) Nếu Audit Verdict = 🔴 XÓA → đã comment row + ghi 301 đích vào `keywords-urls.md`?
```

> Checklist này là **source of truth** — mọi sub-skill content (Blog / Pillar / Topic / Tools / Evergreen / pSEO / Refresh / Audit) và Content Writing Phase 7 phải khớp 7 điểm này.

## 6. KPI đo lường

| KPI | Mục tiêu | Cách đo |
|-----|---------|---------|
| **Token bootstrap mỗi phiên** | < 8k token | So sánh trước/sau khi có COMPILED-CONTEXT |
| **% phiên cần đọc profile.md lại** | < 30% | Memory Quick Facts đủ cho 70% case |
| **Tỷ lệ pending tasks bị quên** | 0% | Đếm task đã chốt nhưng phiên sau không xuất hiện trong memory |
| **Memory.md cập nhật mỗi phiên dự án** | 100% | AI phải update mỗi phiên |

## 7. Tools đề xuất

- **git diff HEAD~1** — scan file đã thay đổi trong phiên để autofill Session History
- **wc -w** — đếm word count của memory.md để biết khi cần trim
- Không cần tool ngoài. Mọi thứ là markdown file.

## 8. Common Mistakes / Sai lầm thường gặp

| Sai lầm | Đúng |
|--------|------|
| Quên cập nhật memory.md cuối phiên | Treat Session End như checklist bắt buộc |
| Đưa quá nhiều chi tiết vào memory (thành bản sao của profile.md) | Memory là **tóm tắt mỏng** — link tới profile.md cho chi tiết |
| Quick Facts dài hơn 15 dòng | Giới hạn 10 dòng. Nếu cần nhiều, đọc profile.md |
| Append vô hạn Session History | Trim sau 10 entries, archive vào `archive/memory-{YYYY-MM}.md` |
| Coi memory.md là source of truth | Memory chỉ là cache. `topical.md` + `keywords-urls.md` mới là source of truth |
| Cập nhật memory.md ở giữa phiên | Chỉ cập nhật cuối phiên (Session End), tránh memory dirty khi rollback |
| Đọc memory.md nhưng không đọc COMPILED-CONTEXT.md | Cả 2 bắt buộc đầu phiên. COMPILED = skill, MEMORY = trạng thái |
