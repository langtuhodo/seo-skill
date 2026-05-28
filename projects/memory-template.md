# Project Memory — Template

> Copy file này thành `projects/{ten-du-an}/memory.md` cho mỗi dự án. AI đọc file này TRƯỚC TIÊN ở Phase -1 và cập nhật cuối mỗi phiên (Session End Protocol).
>
> Đầy đủ quy trình: xem `skills/project-memory/SKILL.md`

---

# Project Memory — {Tên dự án}

> **Mục đích**: Cache trạng thái dự án giữa các phiên AI để khỏi đọc lại toàn bộ profile/topical/keywords mỗi lần.
> **Cập nhật**: AI tự cập nhật ở Session End Protocol cuối mỗi phiên.
> **Source of truth**: Đây CHỈ là cache. Số liệu chính xác xem `profile.md` / `topical.md` / `keywords-urls.md`.

## Project Quick Facts

Cache 5-10 dòng quan trọng nhất từ `profile.md` để AI không cần mở file kia cho task đơn giản.

- **Domain**: {domain}
- **Industry**: {industry / niche}
- **Brand voice**: {1 dòng — VD: "Chuyên gia ngành thép B2B, chúng tôi/bạn, không dùng tui/mình"}
- **Style profile**: `skills/style-mimicker/profiles/{file}.json`
- **Core clusters**: {3-5 cluster ưu tiên cao nhất, phân cách bằng dấu phẩy}
- **Hotline / Liên hệ**: {hotline + email nếu cần CTA}
- **USP cốt lõi** (top 3): {3 điểm khác biệt}

> Cập nhật section này CHỈ khi `profile.md` thay đổi.

## Active Context

Trạng thái "đang làm gì" của dự án TẠI THỜI ĐIỂM HIỆN TẠI.

- **Cluster đang ưu tiên build**: {VD: "Ống thép đúc"}
- **Sub-cluster đang focus**: {VD: "Tiêu chuẩn ASTM A106"}
- **Content type ưu tiên trong sprint này**: {Kiến thức / Sản phẩm / So sánh / Dự án}
- **Mục tiêu sprint**: {1-2 dòng — VD: "Hoàn thiện 5 bài supporting cho cluster Ống thép đúc trong tháng 5"}
- **Last updated**: {YYYY-MM-DD}

> Cập nhật khi chuyển trọng tâm sang cluster/sub-cluster khác.

## Session History (10 phiên gần nhất)

Append 1 dòng mỗi phiên. Giữ tối đa 10. Khi đầy → archive vào `memory-archive-{YYYY-QN}.md`.

| Date | CLI / Model | Task Done | Files Touched | Pending Carry-over |
|------|-------------|-----------|---------------|---------------------|
| {YYYY-MM-DD} | {Claude Code / Cursor / Codex} | {1-2 dòng tóm tắt} | {file1.md, file2.md} | {task chưa xong} |

## Recent Articles Published (10 bài mới nhất)

Append khi có bài publish. Giữ 10. Danh sách đầy đủ ở `keywords-urls.md`.

| Date | Title | URL | Cluster | Role | Style Variant |
|------|-------|-----|---------|------|---------------|
| {YYYY-MM-DD} | {tiêu đề} | {/slug} | {cluster} | pillar/supporting | {VD: "Bài sản phẩm — type B"} |

## Pending Tasks (carry-over giữa phiên)

Task chưa xong, AI ghi nhớ qua các phiên. Format checkbox + ngày tạo + lý do pending nếu có.

- [ ] {YYYY-MM-DD} — {Mô tả task} — Lý do pending: {nếu có}
- [ ] {YYYY-MM-DD} — {Mô tả task}

> Khi task done → chuyển vào "Task Done" của Session History entry mới, KHÔNG xóa khỏi đây nếu chưa done thật.

## Key Decisions (append-only, không xóa)

Quyết định kỹ thuật/style đã chốt. Tránh lặp lại tranh luận qua các phiên.

| Date | Decision | Lý do | Tác động |
|------|----------|-------|----------|
| {YYYY-MM-DD} | {VD: "Mác thép default cho cluster A là SS400"} | {Lý do ngắn} | {Áp dụng cho bài nào / scope nào} |

## Session End Protocol — Checklist cho AI

Trước khi report completion cho user, AI BẮT BUỘC:

```
[ ] Append entry mới vào Session History (ngày + task + files + carry-over)
[ ] Append article mới vào Recent Articles (nếu có publish)
[ ] Edit Active Context nếu chuyển cluster/style/sprint focus
[ ] Edit Pending Tasks: xóa done, thêm mới phát sinh
[ ] Append Key Decisions nếu chốt quyết định mới
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md trong cùng commit với output bài viết
```
