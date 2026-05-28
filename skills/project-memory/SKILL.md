# Project Memory — Bộ nhớ ngữ cảnh dự án giữa các phiên AI

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

**Trước khi report task completion cho user**, AI BẮT BUỘC:

```
1. SCAN PHIÊN VỪA LÀM:
   - Đã viết/sửa file nào? (git status / commit log)
   - Đã chốt quyết định gì? (style, kỹ thuật, hướng đi)
   - Còn pending gì? (TODO, follow-up)

2. UPDATE memory.md (chỉ section thay đổi):
   - Append 1 entry mới vào Session History
   - Append article mới vào Recent Articles (nếu publish)
   - Edit Active Context nếu chuyển cluster/style
   - Append Key Decisions nếu chốt mới
   - Edit Pending Tasks: xóa done, thêm mới

3. COMMIT memory.md cùng với output:
   - Memory.md đi cùng commit chứa bài viết/output
   - Không commit riêng

4. INFORM user:
   - "Đã cập nhật memory.md: {section_thay_doi}"
```

### 4.4. Bảo trì memory.md — Khi nào nên trim

| Trigger | Hành động |
|---------|-----------|
| Session History > 10 entries | Giữ 10 mới nhất, archive cũ vào `memory-archive-{YYYY-Q1}.md` |
| Recent Articles > 10 entries | Giữ 10 mới nhất, danh sách đầy đủ ở `keywords-urls.md` |
| Pending Tasks > 30 days old | Đánh dấu stale, hỏi user có còn ưu tiên không |
| Key Decisions không bao giờ trim | Đây là "trí nhớ dài hạn", giữ vĩnh viễn |

## 5. Template / Checklist

### Template memory.md
Xem: `projects/memory-template.md`

### Session End Checklist (5 điểm)

```
[ ] Đã append entry mới vào Session History?
[ ] Đã cập nhật Recent Articles nếu có bài mới publish?
[ ] Đã cập nhật Active Context nếu chuyển cluster/style?
[ ] Đã edit Pending Tasks (xóa done + thêm mới)?
[ ] Đã commit memory.md trong cùng commit với output?
```

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
| Append vô hạn Session History | Trim sau 10 entries, archive vào file riêng |
| Coi memory.md là source of truth | Memory chỉ là cache. `topical.md` + `keywords-urls.md` mới là source of truth |
| Cập nhật memory.md ở giữa phiên | Chỉ cập nhật cuối phiên (Session End), tránh memory dirty khi rollback |
| Đọc memory.md nhưng không đọc COMPILED-CONTEXT.md | Cả 2 bắt buộc đầu phiên. COMPILED = skill, MEMORY = trạng thái |
