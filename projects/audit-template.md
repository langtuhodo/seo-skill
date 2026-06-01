# Audit Input Template — Content Evaluation (`/audit`)

> Copy file này, đổi tên thành tên bài cần audit (vd `audit-thep-u-vinaone.md`), điền 7 thông số đầu vào bên dưới, sau đó gửi cho AI:
>
> ```
> hãy audit bài viết này @audit-thep-u-vinaone.md
> ```
>
> hoặc
>
> ```
> /audit @audit-thep-u-vinaone.md
> ```
>
> AI sẽ chạy skill `skills/content/Content Evaluation/SKILL.md` và xuất file báo cáo `audit/evaluation-{slug}-{yyyy-mm-dd}.md`.

---

**[THÔNG SỐ ĐẦU VÀO]**

[TỪ KHÓA CHÍNH]: 

[TỪ KHÓA PHỤ/LSI]: 

[URL DỰ KIẾN]: 

[TIÊU ĐỀ SEO (Title Tag)]: 

[MÔ TẢ SEO (Meta Description)]: 

[SEARCH INTENT]: 

[NỘI DUNG BÀI VIẾT]:

```
{Paste toàn bộ markdown bài viết tại đây — giữ nguyên SEO Metadata blockquote 12 trường nếu có, giữ nguyên cấu trúc H1/H2/H3, bảng, hình}
```

---

## Ghi chú điền form

- **TỪ KHÓA CHÍNH**: 1 keyword duy nhất (target_keyword). Vd: "thép U VinaOne".
- **TỪ KHÓA PHỤ/LSI**: 5-10 keyword ngữ nghĩa, phân cách bằng dấu phẩy. Vd: "thép U mạ kẽm, thép U đen, quy cách thép U, bảng giá thép U, dung sai VNO".
- **URL DỰ KIẾN**: full URL (https://...) hoặc chỉ slug. Vd: "https://thepbaotin.vn/thep-u-vinaone".
- **TIÊU ĐỀ SEO (Title Tag)**: SEO title 50-60 ký tự (chuẩn 2026 < 550 pixels). Vd: "Thép U VinaOne — Bảng giá, quy cách JIS/TCVN, mác SS400".
- **MÔ TẢ SEO (Meta Description)**: ≤ 135 ký tự (chuẩn 2026 mobile-first). Vd: "Bảng giá thép U VinaOne 2026, JIS/VNO/TCVN, SS400-CT51, CO/CQ đầy đủ. Báo giá 30 phút."
- **SEARCH INTENT**: 1 ký tự — I (Informational) / N (Navigational) / C (Commercial) / T (Transactional).
- **NỘI DUNG BÀI VIẾT**: Paste toàn bộ markdown. Giữ nguyên SEO Metadata blockquote 12 trường (xem `projects/content-template.md`).

## Validation — nếu thiếu trường, AI sẽ báo lỗi

Trường tối thiểu BẮT BUỘC (5/7):
- ✅ TỪ KHÓA CHÍNH
- ✅ URL DỰ KIẾN
- ✅ TIÊU ĐỀ SEO
- ✅ SEARCH INTENT
- ✅ NỘI DUNG BÀI VIẾT

Trường khuyến nghị (2/7):
- ☑️ TỪ KHÓA PHỤ/LSI (nếu thiếu, AI vẫn audit nhưng note ở Phần 4 Semantic SEO)
- ☑️ MÔ TẢ SEO (nếu thiếu, AI sẽ ghi "Meta description không cung cấp" trong Phần 2)

Thiếu 1 trong 5 trường BẮT BUỘC → AI trả về đúng 1 câu: `"Tôi không đủ dữ liệu. Thiếu trường: [...]"` và dừng.

---

## (v1.1) Yêu cầu Project Context — Duplicate Detection

Nếu bài audit thuộc 1 dự án (có folder `projects/{project}/`), AI sẽ **tự động đọc thêm** `projects/{project}/keywords-urls.md` để chạy Duplicate Detection 4 check:

| Check | So sánh | Verdict ảnh hưởng |
|-------|---------|-------------------|
| 1. Trùng URL | URL input vs cột URL | 🔴 Hard duplicate → override Verdict thành `🔴 XÓA / 301` |
| 2. Trùng Keyword chính | Từ khóa input vs cột Keyword | 🔴 Keyword cannibalization → override Verdict thành `🔴 XÓA / 301` |
| 3. Trùng Tiêu đề ≥ 60% | Jaccard similarity Title input vs cột Tiêu đề | 🟠 Soft duplicate → cảnh báo trong Section 5.5 |
| 4. Cùng Cluster + Intent | Cluster + Intent input vs cột Cluster + Intent | 🟠 Overlap → cảnh báo |

**Để Duplicate Detection chạy chính xác**:
- File `keywords-urls.md` phải dùng schema v1.1 (7 cột): `| # | Keyword | Tiêu đề | URL | Cluster | Vai trò | Intent |`.
- Cột Tiêu đề phải điền tiêu đề SEO thực tế của bài đã publish. Nếu để `—` (placeholder), check #3 sẽ skip cho row đó.
- Khi audit bài mới đã publish, AI sẽ tự append entry mới vào `keywords-urls.md` (xem Section 12 trong SKILL).

**Nếu bài audit KHÔNG thuộc dự án nào** (ad-hoc audit): AI bỏ qua Duplicate Detection và ghi 1 dòng note trong report.
