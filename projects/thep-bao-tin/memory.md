# Project Memory — Thép Bảo Tín

> **Mục đích**: Cache trạng thái dự án giữa các phiên AI để khỏi đọc lại toàn bộ profile/topical/keywords mỗi lần.
> **Cập nhật**: AI tự cập nhật ở Session End Protocol cuối mỗi phiên.
> **Source of truth**: Đây CHỈ là cache. Số liệu chính xác xem `profile.md` / `topical.md` / `keywords-urls.md`.

## Project Quick Facts

- **Domain**: thepbaotin.com
- **Industry**: Phân phối & nhập khẩu ống thép, thép hình, thép hộp, phụ kiện đường ống, vật tư PCCC (B2B)
- **Brand voice**: Chuyên gia ngành thép B2B. Ngôi xưng "Thép Bảo Tín / chúng tôi" + "bạn / quý khách hàng / nhà thầu". KHÔNG dùng "tui / mình / ta".
- **Style profile**: `skills/style-mimicker/profiles/thep-bao-tin.json` — 4 loại bài: Kiến thức / Sản phẩm / So sánh / Dự án
- **Core clusters**: Ống thép đúc, ống thép mạ kẽm, ống thép đen, thép hình, thép tấm, thép hộp, mặt bích, van công nghiệp
- **Hotline / Liên hệ**: 0932 059 176 · bts@thepbaotin.com
- **USP cốt lõi**: (1) Nhập trực tiếp từ nhà máy, không qua trung gian (2) Giá gốc, hóa đơn VAT (3) CO/CQ đầy đủ + chế độ đồng kiểm
- **Data integrity rule**: TUYỆT ĐỐI KHÔNG đổi số liệu kỹ thuật (giá, quy cách, mác thép, tiêu chuẩn). Diễn đạt được thay, số liệu giữ 100%.

## Active Context

- **Cluster đang ưu tiên build**: Thép Hình (mở rộng từ Ống thép đúc)
- **Sub-cluster đang focus**: Thép U / V / H Vinaone
- **Content type ưu tiên trong sprint này**: Sản phẩm (type B) — bảng giá + quy cách + sai lầm khi mua
- **Mục tiêu sprint**: Hoàn thiện bộ bài sản phẩm Vinaone cho cluster Thép Hình theo phong cách Thép Bảo Tín
- **Last updated**: 2026-05-27

## Session History (10 phiên gần nhất)

| Date | CLI / Model | Task Done | Files Touched | Pending Carry-over |
|------|-------------|-----------|---------------|---------------------|
| 2026-05-27 | Devin (Claude) | Viết lại bài thép U Vinaone theo phong cách Thép Bảo Tín (test bộ skill) + khởi tạo Project Memory system | `thep-u-vinaone-thep-bao-tin-style.md` (output ngoài repo), `skills/project-memory/SKILL.md`, `projects/memory-template.md` | - |
| 2026-05-21 | - | Audit cluster ống thép đúc + ban hành phong cách Thép Bảo Tín (`thep-bao-tin.json`) + chuẩn 12 trường SEO Metadata | `audit-ong-thep-duc-2026-05-21.md`, `thep-bao-tin.json` | - |

## Recent Articles Published (10 bài mới nhất)

| Date | Title | URL | Cluster | Role | Style Variant |
|------|-------|-----|---------|------|---------------|
| 2026-05-21 | Ống thép đúc là gì | https://thepbaotin.com/ong-thep-duc/ | Ống thép đúc | pillar | Kiến thức (type A) |
| 2026-05-21 | Phân biệt ống đúc và ống hàn | https://thepbaotin.com/so-sanh-giua-ong-thep-duc-va-ong-thep-han/ | Ống thép đúc | supporting | So sánh (type C) |
| 2026-05-21 | Cách bảo quản ống thép đúc | https://thepbaotin.com/cach-bao-quan-ong-thep-duc/ | Ống thép đúc | supporting | Kiến thức (type A) |
| - | Thép U VinaOne (bài cũ trên site, đã có) | https://thepbaotin.com/thep-u-vinaone/ | Thép Hình | supporting | Sản phẩm (type B) — sẽ rewrite |

> Danh sách đầy đủ: xem `keywords-urls.md` (497 dòng, 230+ bài).

## Pending Tasks

- [ ] 2026-05-27 — Áp dụng bản rewrite `thep-u-vinaone` (style Thép Bảo Tín) lên site nếu user duyệt
- [ ] 2026-05-27 — Mở rộng pattern bài sản phẩm cho các quy cách Vinaone khác (thép V, thép hộp Vinaone, ống thép đen Vinaone)
- [ ] 2026-05-21 — Hoàn thiện audit recommendations cho cluster ống thép đúc (carry-over từ audit ngày 2026-05-21)

## Key Decisions (append-only, không xóa)

| Date | Decision | Lý do | Tác động |
|------|----------|-------|----------|
| 2026-05-21 | Ban hành style profile `thep-bao-tin.json` với 4 loại bài (Kiến thức / Sản phẩm / So sánh / Dự án) | B2B thép cần phân biệt loại bài rõ ràng, không thể dùng 1 style cho mọi case | Mọi bài viết Thép Bảo Tín từ 2026-05-21 trở đi phải xác định content type TRƯỚC khi viết |
| 2026-05-21 | Cấm thay đổi số liệu kỹ thuật 100% (`data_integrity_rule`) | Sai 1 số liệu → mất uy tín B2B + ảnh hưởng quyết định mua hàng triệu đồng | Bảng giá, quy cách, mác thép, tiêu chuẩn — giữ nguyên bản gốc; diễn đạt được thay |
| 2026-05-21 | Bỏ Key Takeaways box, em dash (—), horizontal rule (---) trong bài Thép Bảo Tín | Pattern AI generic, không phù hợp giọng chuyên gia B2B | Áp dụng cho mọi bài. Phân biệt với BinhNN (vẫn dùng Key Takeaways) |
| 2026-05-21 | Ngôi xưng "Thép Bảo Tín / chúng tôi" + "bạn / nhà thầu", CẤM "tui / mình / ta" | Giọng công ty B2B uy tín, không phải blogger cá nhân | Áp dụng toàn bộ project |

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
