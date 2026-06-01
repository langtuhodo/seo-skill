# Keywords & URLs — {Tên Dự Án}

> File này chứa danh sách TẤT CẢ keywords đã có bài viết + URL tương ứng.
> Khi viết nội dung, AI PHẢI đọc file này TRƯỚC để:
> 1. Biết keyword nào ĐÃ CÓ bài → KHÔNG viết trùng
> 2. Biết URL nào có sẵn → chèn internal link phù hợp vào bài mới
> 3. Biết bài nào là pillar/supporting → link đúng hướng
>
> **Quy tắc internal linking:**
> - Mỗi URL chỉ xuất hiện 1 lần trong 1 bài
> - Supporting → link về pillar (1 lần)
> - Pillar → link xuống mỗi supporting (1 lần)
> - Chỉ link bài CÙNG CLUSTER hoặc LIÊN QUAN NGỮ NGHĨA

## Danh sách Keywords & URLs

| # | Keyword | Tiêu đề | URL | Cluster | Vai trò | Intent |
|---|---------|---------|-----|---------|---------|--------|
| 1 | {keyword chính} | {tiêu đề SEO bài đã viết} | {full URL} | {tên cluster} | pillar | I/N/C/T |
| 2 | {keyword chính} | {tiêu đề SEO} | {full URL} | {tên cluster} | supporting | I/N/C/T |
| 3 | {keyword chính} | — | | {tên cluster} | supporting | I/N/C/T |

> **Quy ước cột Tiêu đề (mới — schema v1.1)**:
> - Điền tiêu đề SEO (Title Tag) của bài đã publish — chính xác như hiển thị trên trang.
> - Dùng để skill `/audit` cross-check trùng tiêu đề (similarity ≥ 60%) khi audit bài mới.
> - Nếu bài chưa viết (planned) → để `—`. Khi publish, AI tự cập nhật.
>
> **Quy ước Trạng thái** (đã bỏ cột Trạng thái khỏi schema 2026 — mặc định mọi entry = published):
> - Bài đã publish: 1 row với 7 cột đầy đủ
> - Bài draft/planned (hiếm khi giữ): prefix Title bằng emoji `🟡 [DRAFT]` hoặc `⏳ [PLANNED]`, hoặc giữ ngoài bảng (commented-out)

## Cách sử dụng khi viết bài

### Trước khi viết (Phase 0)
1. Đọc file này → lọc các bài **cùng cluster** với bài sắp viết
2. Lọc thêm các bài **cluster liên quan** có thể cross-link
3. Lập danh sách URL cần chèn (bài đã published — entry không có prefix `🟡` / `⏳`)

### Khi viết (Phase 3)
4. Chèn internal link tự nhiên vào body text
5. Mỗi URL chỉ 1 lần, anchor text chứa keyword
6. Supporting → link về pillar cùng cluster (bắt buộc)
7. Link ngang giữa supporting: chỉ khi ngữ nghĩa liên quan

### Khi audit bài (skill `/audit`)
8. Skill `Content Evaluation` (`/audit`) đọc file này để cross-check:
   - Trùng URL → 🔴 duplicate
   - Trùng Keyword chính → 🔴 duplicate
   - Trùng Tiêu đề ≥ 60% từ → 🟠 warn
   - Cùng Cluster + cùng Intent → 🟠 overlap (có thể merge)

### Sau khi publish
9. Cập nhật file này: thêm row mới với 7 cột — đặc biệt là cột **Tiêu đề** (cần thiết cho audit cross-check).
10. Kiểm tra các bài cũ cùng cluster → cập nhật link trỏ về bài mới (nếu phù hợp)

## Thống kê

- **Tổng keywords**: {số}
- **Số clusters**: {số}
- **Last updated**: {YYYY-MM-DD}
