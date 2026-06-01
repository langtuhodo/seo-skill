# External Sources — Hạt Cà Phê Rang Xay

> **Whitelist nguồn ngoài** mà AI được phép cite trong bài viết của dự án `hatcapherangxay`.
>
> **Nguyên tắc tối thượng**: Nếu nguồn KHÔNG có trong file này → AI **KHÔNG TỰ THÊM**, **KHÔNG BỊA URL**. Bỏ qua hoặc xóa câu cần cite.
>
> **Lĩnh vực dự án**: Cà phê — sản phẩm, trồng trọt, rang xay, văn hóa cà phê Việt Nam.
>
> **Schema version**: v1.0 (2026-05-27)
> **Last updated**: 2026-05-27 (skeleton — user chưa fill)

---

## Tier 1 — Cơ quan chính thức / Tiêu chuẩn (ưu tiên cao nhất)

> Bộ Nông nghiệp & PTNT VN, Hiệp hội Cà phê & Ca cao Việt Nam, tiêu chuẩn quốc gia / quốc tế. **Cite cho số liệu xuất khẩu, tiêu chuẩn TCVN/ISO về cà phê, quy chuẩn pháp lý.**

| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|-----------|--------|----------|----------|---------|
| _Chưa fill — user bổ sung khi sẵn sàng_ | | | | | |

**Gợi ý ứng viên** (user verify + thêm):
- Bộ Nông nghiệp và Phát triển Nông thôn — mard.gov.vn
- Hiệp hội Cà phê & Ca cao Việt Nam (VICOFA) — vicofa.org.vn
- International Coffee Organization (ICO) — ico.org
- Specialty Coffee Association (SCA) — sca.coffee
- TCVN 4193:2014 (Cà phê nhân — Yêu cầu kỹ thuật) — thuvienphapluat.vn

---

## Tier 2 — Hiệp hội / Báo chí / Nghiên cứu uy tín

> Báo chí nông nghiệp uy tín, viện nghiên cứu cà phê, báo cáo thị trường. **Cite cho case study, báo cáo xuất khẩu, phân tích thị trường.**

| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|-----------|--------|----------|----------|---------|
| _Chưa fill — user bổ sung khi sẵn sàng_ | | | | | |

**Gợi ý ứng viên** (user verify + thêm):
- Viện Khoa học Kỹ thuật Nông Lâm nghiệp Tây Nguyên (WASI) — wasi.org.vn
- Coffee Quality Institute (CQI) — coffeeinstitute.org
- World Coffee Research — worldcoffeeresearch.org
- VnExpress chuyên mục Kinh doanh — Nông nghiệp
- Báo Nông Nghiệp Việt Nam — nongnghiep.vn

---

## Tier 3 — Chuyên gia / Expert cá nhân

> Chuyên gia rang xay, barista có chứng chỉ Q Grader, sommelier cà phê. **Cite cho phương pháp luận, framework đặc trưng.**

| # | Tên chuyên gia | Profile URL | Lĩnh vực | Ngôn ngữ | Ghi chú |
|---|----------------|-------------|----------|----------|---------|
| _Chưa fill — user bổ sung khi sẵn sàng_ | | | | | |

**Gợi ý ứng viên** (user verify + thêm):
- Q Graders Việt Nam có profile trên CQI website
- James Hoffmann — World Barista Champion 2007, kênh YouTube + sách
- Scott Rao — coffee consultant, sách rang xay
- Trish Rothgeb — co-founder Wrecking Ball Coffee

---

## Quy tắc cite (AI BẮT BUỘC tuân thủ)

1. **CHỈ cite từ whitelist này**. File hiện đang **trống** → AI BỎ QUA mọi external citation cho project này cho đến khi user fill.
2. **Anchor text** chứa tên nguồn hoặc claim cụ thể (xem template).
3. **Số lượng**: 2-5 external link/bài khi đã có whitelist.
4. **Ưu tiên Tier 1** cho số liệu xuất khẩu, tiêu chuẩn cà phê, quy chuẩn pháp lý.
5. **Format**: markdown `[anchor](URL)` hoặc HTML `<a href="URL" rel="noopener" target="_blank">anchor</a>`.

---

## Filter rules — User tự thêm nguồn mới

1. **Domain**:
   - ✅ `.gov.vn` (Bộ NN&PTNT), `.org.vn` (hiệp hội VN), `.gov` (cơ quan nước ngoài)
   - ✅ `.org` quốc tế: ICO, SCA, CQI, World Coffee Research
   - ⚠️ `.com` blog cá nhân: chỉ accept khi chuyên gia có chứng chỉ Q Grader / WBC / Barista certification verify được
   - ❌ Blog bán cà phê nội dung mỏng, không có About page
2. **About page**: có thông tin tổ chức/chuyên gia thật, kinh nghiệm verify được
3. **Cộng đồng công nhận**: được cite trong nghiên cứu khoa học, có speaker tại hội nghị cà phê quốc tế
4. **Có link tới nguồn gốc**: khi cite số liệu → có dẫn báo cáo gốc của ICO/USDA/Bộ NN

---

## Backward compatibility

- File **không bắt buộc**. Hiện trạng skeleton trống → skill cảnh báo "hatcapherangxay chưa fill whitelist" và **SKIP** external citation check cho project này.
- Khi user fill → skill tự động enable check ở phiên kế tiếp.

---

## Maintenance

- AI **KHÔNG tự thêm** entry. User maintain thủ công.
- Khi user fill → bỏ block "Chưa fill — user bổ sung" và xóa block "Gợi ý ứng viên" tương ứng.
- Review 6 tháng/lần.

## Pending — chờ user bổ sung

- Toàn bộ Tier 1, Tier 2, Tier 3 (file đang skeleton)
- Xác định ngôn ngữ ưu tiên: tiếng Việt (Bộ NN, VICOFA) hay tiếng Anh (ICO, SCA)
- Liệt kê các giống cà phê đặc sản VN (Arabica Cầu Đất, Catimor, Robusta…) — cite từ WASI hoặc nguồn nông học chính thức
