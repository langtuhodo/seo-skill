# External Sources — {Tên dự án}

> **Whitelist nguồn ngoài** mà AI được phép cite (làm external link / dẫn nguồn số liệu) trong bài viết của dự án này.
>
> **Nguyên tắc tối thượng**: Nếu nguồn KHÔNG có trong file này → AI **KHÔNG TỰ THÊM**, **KHÔNG BỊA URL**. Bỏ qua hoặc xóa câu cần cite.
>
> **Schema version**: v1.0 (2026-05-27)
>
> File này đọc bởi: `/audit` (Content Evaluation), `Content Writing`, `Content Refresh`. Cập nhật thủ công bởi user (AI chỉ suggest, KHÔNG tự append).

---

## Tier 1 — Cơ quan chính thức / Tiêu chuẩn (ưu tiên cao nhất)

> Bộ ngành, hiệp hội cấp quốc gia, tổ chức tiêu chuẩn hóa, văn bản pháp quy. **Cite cho data, tiêu chuẩn, định nghĩa pháp lý.**

| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|-----------|--------|----------|----------|---------|
| 1 | {Tên tổ chức} | {domain.gov / .org chính thức} | {chuyên ngành} | vi / en | {ghi chú cite gì} |

---

## Tier 2 — Hiệp hội / Báo chí / Nghiên cứu uy tín

> Hiệp hội ngành quốc tế, báo chí chính thống, viện nghiên cứu, học viện. **Cite cho case study, báo cáo thị trường, phân tích chuyên sâu.**

| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|-----------|--------|----------|----------|---------|
| 1 | {Tên hiệp hội/báo} | {domain} | {chuyên ngành} | vi / en | {ghi chú cite gì} |

---

## Tier 3 — Chuyên gia / Expert cá nhân

> Cá nhân có authority kiểm chứng được trong lĩnh vực (founder, lead researcher, certified expert). **Cite cho quote, phương pháp luận, framework đặc trưng.**

| # | Tên chuyên gia | Profile URL | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|----------------|-------------|----------|----------|---------|
| 1 | {Tên đầy đủ} | {URL profile chính thức} | {chuyên ngành} | vi / en | {ghi chú cite gì} |

---

## Quy tắc cite (AI BẮT BUỘC tuân thủ)

1. **CHỈ cite từ whitelist này**. Nguồn ngoài → AI **BỎ QUA**, **KHÔNG bịa link**. Nếu câu cần cite mà không có nguồn phù hợp → viết lại câu để không cần cite, hoặc xóa câu đó.
2. **Anchor text** phải chứa tên nguồn hoặc claim cụ thể, KHÔNG dùng "click here", "tại đây":
   - ✅ "Theo [Statista 2025](url), thị trường thép...", "Tiêu chuẩn [TCVN 6285:2008](url) quy định..."
   - ❌ "Xem [tại đây](url) để biết thêm"
3. **Số lượng khuyến nghị**: 2-5 external link/bài. Spam (>10) → giảm trust signal.
4. **Format markdown**: `[anchor](URL)` cho web. Nếu output HTML: `<a href="URL" rel="noopener" target="_blank">anchor</a>`.
5. **Ưu tiên Tier**:
   - **Tier 1** cho data/số liệu/tiêu chuẩn pháp lý (vd "TCVN 6285:2008", "theo Bộ Công Thương")
   - **Tier 2** cho case study/báo cáo ngành (vd "báo cáo Statista 2025")
   - **Tier 3** cho quote/phương pháp luận (vd "framework Skyscraper của Brian Dean")
6. **Mỗi bài KHUYẾN NGHỊ** có ít nhất 1 cite Tier 1 nếu nội dung có data hoặc tiêu chuẩn pháp lý. Bài content marketing thuần (vd "5 mẹo viết blog") không bắt buộc Tier 1.
7. **Verify link** trước khi cite: nếu link 404 / redirect lạ → skip, ghi log vào Session History để user fix `external-sources.md`.

---

## Filter rules — Khi user tự thêm nguồn mới vào whitelist

Trước khi thêm 1 nguồn mới vào file này, user kiểm tra 4 tiêu chí:

1. **Domain authority**:
   - ✅ `.gov`, `.edu`, `.org` (cơ quan, đại học, phi lợi nhuận)
   - ✅ Hãng lớn được công nhận: Google, Microsoft, HubSpot, ASTM, ISO, worldsteel, Moz
   - ⚠️ `.com` blog cá nhân: chỉ accept nếu chuyên gia có credential rõ (vd Brian Dean, Neil Patel)
   - ❌ Site bán hàng nội dung mỏng, không có About page

2. **About page + author profile**:
   - ✅ Có thông tin tác giả thật, kinh nghiệm, contact
   - ❌ Anonymous, không có profile

3. **Cộng đồng chuyên môn công nhận**:
   - ✅ Được trích dẫn trong khóa học uy tín (HubSpot Academy, Coursera, Moz)
   - ✅ Có nhiều backlink từ site .edu / .gov
   - ❌ Chỉ self-promotion, không có third-party reference

4. **Có link tới nguồn gốc/tiêu chuẩn**:
   - ✅ Khi cite số liệu → link tới báo cáo gốc
   - ❌ Cite số liệu "Studies show..." không có nguồn → red flag

---

## Workflow tích hợp với skill

### Khi viết bài (`Content Writing`)
1. **Phase 0 Research**: AI đọc `external-sources.md` (nếu file tồn tại trong project).
2. **Phase 3 Drafting**: Khi viết câu có claim/data → AI lookup whitelist → chọn nguồn phù hợp Tier → chèn anchor.
3. **Phase 4 EEAT Check**: Verify mỗi external link trong bài đều thuộc whitelist. Link ngoài → flag để user review.

### Khi audit bài (`/audit` — Content Evaluation v1.2+)
1. **Phase 2 Load**: AI đọc `external-sources.md` cùng với `keywords-urls.md`.
2. **Phase 5 EEAT/Trust check**: Enumerate tất cả external link trong bài input → đối chiếu whitelist → đếm số link OK / số link ngoài whitelist.
3. **Section 5.5 (mới)**: Báo cáo "External Citation Check":
   - ✅ Đã cite từ whitelist: X link
   - ⚠️ Cite ngoài whitelist: Y link (list URL)
   - ⚠️ Khuyến nghị: thêm cite Tier 1 cho phần có data nhưng chưa cite

### Khi refresh bài (`Content Refresh`)
1. Khi tăng EEAT Trust score → ưu tiên bổ sung Tier 1 cite cho phần data.

### Khi audit không có project context (ad-hoc)
- Skill bỏ qua bước này. Verdict tính thuần từ rubric.

---

## Backward compatibility

- File này **không bắt buộc**. Project chưa có `external-sources.md` → skill cũ chạy như cũ (không cross-check).
- File `external-sources.md` để **trống** (0 nguồn) → skill cảnh báo "Project chưa fill whitelist" nhưng vẫn chạy.
- Nếu user muốn cite ngoài whitelist 1 lần → comment ngay sau line cite: `<!-- ad-hoc cite, không thêm vào whitelist -->` → skill skip warning row đó.

---

## Suy nghĩ về maintenance

- File này thuộc về user, AI **KHÔNG TỰ THÊM** entry mới.
- Sau mỗi phiên, nếu AI dùng nguồn ngoài whitelist → Session End suggest user thêm vào (nếu đáng tin) hoặc xóa cite đó (nếu không đáng tin).
- Khuyến nghị review whitelist 6 tháng/lần (xóa nguồn lỗi 404, thêm nguồn mới).
