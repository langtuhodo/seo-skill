# Project Memory — BinhNN Digital

> **Mục đích**: Cache trạng thái dự án giữa các phiên AI để khỏi đọc lại toàn bộ profile/topical/keywords mỗi lần.
> **Cập nhật**: AI tự cập nhật ở Session End Protocol cuối mỗi phiên.
> **Source of truth**: Đây CHỈ là cache. Số liệu chính xác xem `profile.md` / `topical.md` / `keywords-urls.md`.

## Project Quick Facts

- **Domain**: binhnndigital.com
- **Industry**: Thương hiệu cá nhân — SEO Specialist + Web Developer (Full-stack: html, js, css, php)
- **Brand voice**: Confident, data-backed, provocative. Ngôi xưng "tui" (cá nhân). Có quan điểm mạnh, dùng case study thực tế.
- **Style profile**: `skills/style-mimicker/profiles/binhnn-digital.json`
- **Core clusters**: SEO on-page, Technical SEO, Keyword Research, Content Writing, Web Development cho SEO (đang khởi tạo)
- **Social proof**: 7 năm SEO + 7 năm Web Dev + 1 năm Digital Marketing; LinkedIn, Facebook, X, Pinterest
- **USP cốt lõi**: (1) Giao thoa Code chuẩn + SEO chất (2) Tự fix Technical SEO sâu mà SEOer thuần content không làm được (3) Tối ưu Core Web Vitals từ tầng code
- **Data anchoring rule**: Mỗi claim phải có số liệu hoặc case study cụ thể (VD: "47 dự án trong 3 năm, 73% traffic từ bài >8 tháng")

## Active Context

- **Cluster đang ưu tiên build**: Đang khởi tạo — chưa có cluster nào đủ trưởng thành
- **Sub-cluster đang focus**: TBD
- **Content type ưu tiên trong sprint này**: Audit website hiện tại để xác định cluster
- **Mục tiêu sprint**: Hoàn thiện audit website + đề xuất 3 cluster đầu tiên
- **Last updated**: 2026-05-27

## Session History (10 phiên gần nhất)

| Date | CLI / Model | Task Done | Files Touched | Pending Carry-over |
|------|-------------|-----------|---------------|---------------------|
| 2026-06-04 | Devin | Tối ưu copy trang chủ theo 4 dịch vụ chính (web trọn gói chủ lực + SEO tổng thể + Google Ads + Google Map) | `projects/binhnn-digital/writing/homepage-copy.md` | Bổ sung Google Map vào web + tạo trang dịch vụ chi tiết + sửa lỗi nút form `<strong>` |
| 2026-05-27 | Devin (Claude) | Khởi tạo Project Memory system cho dự án | `projects/binhnn-digital/memory.md` | Lên topical.md + keywords-urls.md đầy đủ |
| - | - | Audit website content trước đó | `website-content-audit.md` | Triển khai recommendations |

## Recent Articles Published (10 bài mới nhất)

| Date | Title | URL | Cluster | Role | Style Variant |
|------|-------|-----|---------|------|---------------|
| - | (Chưa có bài publish trong hệ thống tracking) | - | - | - | - |

> Domain mới 1 năm, DR=1. Trang đang ở giai đoạn build foundation.

## Pending Tasks

- [ ] 2026-05-27 — Tạo `topical.md` cho dự án (sơ đồ topical map)
- [ ] 2026-05-27 — Tạo `keywords-urls.md` cho dự án
- [ ] 2026-05-27 — Triển khai recommendations từ `website-content-audit.md`
- [ ] 2026-05-27 — Xác định 3 cluster ưu tiên đầu tiên dựa trên USP (Technical SEO + Web Dev cho SEO)
- [ ] 2026-06-04 — Áp copy `homepage-copy.md` lên trang chủ WordPress; thêm dịch vụ Google Map vào footer + section dịch vụ
- [ ] 2026-06-04 — Sửa lỗi nút form hiển thị raw `<strong>Gửi Yêu Cầu Tư Vấn</strong>`
- [ ] 2026-06-04 — Tạo 4 trang dịch vụ chi tiết để internal link từ trang chủ (thiet-ke-website-tron-goi, seo-tong-the, quang-cao-google-ads, dich-vu-google-map)

## Key Decisions (append-only, không xóa)

| Date | Decision | Lý do | Tác động |
|------|----------|-------|----------|
| 2026-05-15 | Ban hành style profile `binhnn-digital.json` — giọng "tui" (cá nhân), Neil Patel style, data anchoring | Thương hiệu cá nhân cần giọng khác biệt với mass content AI | Mọi bài viết BinhNN dùng "tui", có Key Takeaways box (khác Thép Bảo Tín) |
| 2026-05-15 | USP cốt lõi = Code chuẩn + SEO chất (giao thoa Web Dev + SEO) | Đây là điểm khác biệt duy nhất so với SEOer thuần content | Mọi cluster/bài viết phải tận dụng được góc này (có code snippet, có ví dụ technical sâu) |

## Session End Protocol — Checklist cho AI

```
[ ] Append entry mới vào Session History (ngày + task + files + carry-over)
[ ] Append article mới vào Recent Articles (nếu có publish)
[ ] Edit Active Context nếu chuyển cluster/style/sprint focus
[ ] Edit Pending Tasks: xóa done, thêm mới phát sinh
[ ] Append Key Decisions nếu chốt quyết định mới
[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
[ ] Commit memory.md trong cùng commit với output bài viết
```
