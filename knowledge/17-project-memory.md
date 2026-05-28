# Knowledge Note 17 — Project Memory & Compiled Context

> **Trigger keywords**: project memory, session memory, context cache, COMPILED-CONTEXT, memory.md, session end protocol, ghi nhớ ngữ cảnh, bộ nhớ dự án, bộ nhớ AI, persistent memory, giảm token bootstrap, lưu trạng thái dự án

## Mục đích nhóm

Giải 2 vấn đề kinh điển khi dùng CLI AI (Claude Code, Cursor, Codex CLI, Gemini CLI) cho dự án dài hạn:

1. **Lãng phí token bootstrap mỗi phiên** — mỗi phiên AI mở lại 60 skill + 16 knowledge = 30-50k token chỉ để "biết phải làm gì"
2. **Quên giữa các phiên** — AI không nhớ phiên trước đã làm gì, đã chốt gì, còn pending gì

## Kiến trúc 2 lớp

```
LỚP 1 — COMPILED-CONTEXT.md (Repo-level Digest)
└── Nén toàn bộ skill router + Anti-AI rules + Phase workflow
└── ~4k token, đọc thay vì 60 skill files
└── Static — chỉ update khi skill thay đổi

LỚP 2 — projects/{project}/memory.md (Project-level State)
└── Bộ nhớ thời gian: đã làm gì, chốt gì, pending gì
└── ~1-2k token, AI cập nhật mỗi phiên (Session End Protocol)
└── Dynamic — append + edit qua từng phiên
```

## Sub-skill list

- `skills/project-memory/SKILL.md` — Định nghĩa hệ thống + 6 section của memory.md + Session End Protocol + bảo trì

## File template

- `projects/memory-template.md` — copy template thành memory.md cho dự án mới
- `COMPILED-CONTEXT.md` (root) — digest gọn cho mọi phiên

## Workflow tổng

### Đầu phiên (Session Bootstrap)

```
1. AI đọc COMPILED-CONTEXT.md → có skill router + anti-AI rules + phase workflow
2. NẾU task gắn dự án cụ thể:
   a. Đọc projects/{project}/memory.md TRƯỚC TIÊN
   b. Quick Facts → biết brand/voice/USP
   c. Active Context → biết cluster đang ưu tiên
   d. Pending Tasks → biết task carry-over
   e. Recent Articles → biết bài vừa publish
3. CHỈ deep-dive vào profile.md / topical.md / keywords-urls.md / SKILL.md cụ thể khi memory không đủ context
```

### Cuối phiên (Session End Protocol)

Trước khi report task completion cho user, AI BẮT BUỘC chạy 7 bước trên memory.md:

```
[ ] Append entry vào Session History (ngày + task + files + carry-over)
[ ] Append article mới vào Recent Articles (nếu có publish)
[ ] Edit Active Context nếu chuyển cluster/style/sprint focus
[ ] Edit Pending Tasks: xóa done, thêm mới phát sinh
[ ] Append Key Decisions nếu chốt quyết định mới
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md trong cùng commit với output
```

## 6 section bắt buộc trong memory.md

| Section | Loại update | Mục đích |
|---------|-------------|----------|
| **Project Quick Facts** | Overwrite (hiếm khi) | Cache 5-10 dòng cốt lõi từ profile.md |
| **Active Context** | Overwrite | Trạng thái "đang làm gì" của dự án hiện tại |
| **Session History** | Append, giữ 10 | Log phiên gần nhất |
| **Recent Articles** | Append, giữ 10 | Bài publish gần nhất |
| **Pending Tasks** | Edit | Task carry-over giữa phiên |
| **Key Decisions** | Append-only | Quyết định kỹ thuật/style — không tranh luận lại |

## Tools & convention

- Markdown thuần, không cần infra ngoài
- `git diff HEAD~1` để scan file đã thay đổi → autofill Session History
- Trim Session History sau 10 entries → archive `memory-archive-{YYYY-QN}.md`
- Key Decisions KHÔNG BAO GIỜ trim (đây là bộ nhớ dài hạn)

## Pitfall

| Pitfall | Đúng |
|---------|------|
| Coi memory.md là source of truth | Memory chỉ là cache. `topical.md` + `keywords-urls.md` mới là source of truth |
| Đưa quá nhiều chi tiết vào memory (thành bản sao profile.md) | Memory là tóm tắt mỏng — link tới profile.md cho chi tiết |
| Quên Session End Protocol | Phiên sau AI lại "quên", phải tái dựng context từ đầu |
| Cập nhật memory.md giữa phiên | Chỉ cập nhật cuối phiên, tránh dirty state khi rollback |
| Đọc memory.md nhưng không đọc COMPILED-CONTEXT.md | Cả 2 cần đọc đầu phiên. COMPILED = skill, MEMORY = trạng thái |
| Append vô hạn Session History | Trim sau 10 entries, archive vào file riêng |

## Reference

- Chi tiết workflow + 6 section: `skills/project-memory/SKILL.md`
- Template: `projects/memory-template.md`
- Digest skill toàn repo: `COMPILED-CONTEXT.md`
- Ví dụ memory.md thực tế: `projects/thep-bao-tin/memory.md`, `projects/binhnn-digital/memory.md`
