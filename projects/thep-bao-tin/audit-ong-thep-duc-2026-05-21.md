---
title: "Topical Audit — Cluster: Ống thép đúc"
slug: "audit-ong-thep-duc-2026-05-21"
project: "Thép Bảo Tín"
type: "audit"
created: "2026-05-21"
---

# Topical Audit — Cluster: Ống thép đúc

**Ngày audit**: 2026-05-21
**Cluster**: Ống thép đúc
**Tổng file**: 36 file .md (34 active + 2 MERGED)
**Skill sử dụng**: `skills/content/Topical Audit/SKILL.md`

---

## Phase 1: Thu thập & Validate Frontmatter

### 1.1. Tổng quan file

| # | Loại | Số lượng |
|---|------|----------|
| 1 | Pillar | 1 (`ong-thep-duc.md`) |
| 2 | Supporting (active) | 33 |
| 3 | MERGED (redirect-301) | 2 (`ong-thep-duc-la-gi.md`, `ong-thep-duc-nhung-dieu-can-biet-truoc-khi-mua.md`) |
| | **Tổng** | **36** |

### 1.2. Lỗi Frontmatter

#### Lỗi toàn cục (ảnh hưởng TẤT CẢ 34 bài active)

| Lỗi | Chi tiết | Mức độ |
|------|----------|--------|
| **THIẾU TRƯỜNG: `word_count`** | 34/34 bài không có trường `word_count` | NGHIÊM TRỌNG |
| **THIẾU TRƯỜNG: `created`** | 34/34 bài không có trường `created` | NGHIÊM TRỌNG |
| **THIẾU TRƯỜNG: `semantic_keywords`** | 34/34 bài không có trường `semantic_keywords` | NGHIÊM TRỌNG |
| **ROLE KHÔNG HỢP LỆ: "Cluster Content"** | 33/34 bài dùng `"Cluster Content"` thay vì `"supporting"` | NGHIÊM TRỌNG |
| **ROLE KHÔNG HỢP LỆ: "Pillar"** | Pillar dùng `"Pillar"` thay vì `"pillar"` (lowercase) | NHẸ |

#### Lỗi riêng từng bài

| File | Lỗi | Chi tiết |
|------|------|----------|
| `ong-thep-duc.md` | INTENT KHÔNG HỢP LỆ | `"I/C"` — phải là 1 giá trị duy nhất (I, N, C, hoặc T) |
| `tieu-chuan-thep-ong-duc-sch40.md` | SLUG SAI FORMAT | `"Tiêu chuẩn ống thép đúc SCH40 | Cập nhật 2026 | Thép Bảo Tín"` — đây là title, không phải slug |
| `tieu-chuan-thep-ong-duc.md` | TITLE KHÔNG KHỚP KEYWORD | Title: "Thép Ống Đúc Phi 406 DN400 - Chất Lượng Cao, Giá Tốt Nhất" nhưng keyword: "tiêu chuẩn ống thép đúc" |
| `dia-chi-cung-cap-...` | INTENT SAI | Ghi `"I"` nhưng nội dung là trang mua hàng → nên là `"T"` |
| `gia-ong-thep-duc-trung-quoc-moi-nhat.md` | INTENT SAI | Ghi `"I"` nhưng nội dung là bảng giá mua hàng → nên là `"C"` |

#### Lỗi bài MERGED (2 bài)

| File | Lỗi |
|------|------|
| `ong-thep-duc-la-gi.md` | ROLE: "MERGED" (không hợp lệ), STATUS: "redirect-301" (không hợp lệ) |
| `ong-thep-duc-nhung-dieu-can-biet-truoc-khi-mua.md` | ROLE: "MERGED" (không hợp lệ), STATUS: "redirect-301" (không hợp lệ) |

> **Ghi chú**: 2 bài MERGED đã gộp vào pillar, đây là hành động đúng. Tuy nhiên cần đổi status thành giá trị hợp lệ hoặc xóa file khỏi cluster.

### 1.3. Map cấu trúc cluster

```
CLUSTER: Ống thép đúc
├── PILLAR: ong-thep-duc.md — keyword: "ống thép đúc" — intent: I/C — ~2889 từ — published
│
├── SUPPORTING (Bài kích thước phi — 18 bài):
│   ├── ong-thep-duc-phi-21-bang-gia-va-quy-cach.md — "ống thép đúc phi 21" — I — ~338 từ
│   ├── ong-thep-duc-phi-27.md — "ống thép đúc phi 27" — I — ~351 từ
│   ├── ong-duc-phi-34-dn25.md — "Ống thép đúc phi 34" — I — ~407 từ
│   ├── thep-ong-duc-phi-42-dn32.md — "ống thép đúc phi 42" — I — ~283 từ
│   ├── thep-ong-duc-phi-48-dn40.md — "ống thép đúc phi 48" — I — ~518 từ
│   ├── ong-thep-duc-phi-60.md — "ống thép đúc phi 60" — I — ~888 từ
│   ├── thep-ong-duc-phi-76-dn-65.md — "ống thép đúc phi 76" — I — ~492 từ
│   ├── thep-ong-duc-phi-90-dn80.md — "ống thép đúc phi 90" — I — ~264 từ
│   ├── thep-ong-duc-phi-127.md — "ống thép đúc phi 127" — I — ~1601 từ
│   ├── thep-ong-duc-phi-141-dn125.md — "ống thép đúc phi 141" — I — ~929 từ
│   ├── thep-ong-duc-phi-168-dn150.md — "ống thép đúc phi 168" — I — ~424 từ
│   ├── thep-ong-duc-phi-219-dn200.md — "ống thép đúc phi 219" — I — ~831 từ
│   ├── thep-ong-duc-phi-273-dn250.md — "ống thép đúc phi 273" — I — ~318 từ
│   ├── thep-ong-duc-phi-325-dn300.md — "ống thép đúc phi 325" — I — ~527 từ
│   ├── thep-ong-duc-phi-355-dn350.md — "ống thép đúc phi 355" — I — ~499 từ
│   ├── thep-ong-duc-phi-406-dn400.md — "ống thép đúc phi 406" — I — ~474 từ
│   ├── ong-thep-duc-phi-508-dn500-tieu-chuan-astm-a106-grade-b.md — "ống thép đúc phi 508" — I — ~1370 từ
│   └── thep-ong-duc-phi-610.md — "ống thép đúc phi 610" — I — ~1459 từ
│
├── SUPPORTING (Bài tiêu chuẩn — 8 bài):
│   ├── tieu-chuan-thep-ong-duc.md — "tiêu chuẩn ống thép đúc" — I — ~3620 từ
│   ├── tieu-chuan-thep-ong-duc-sch40.md — "tiêu chuẩn ống thép đúc SCH40" — I — ~4402 từ
│   ├── tieu-chuan-ong-thep-duc-sch80.md — "tiêu chuẩn ống thép đúc sch80" — I — ~2459 từ
│   ├── tieu-chuan-astm-a106-cho-ong-thep-duc.md — "tiêu chuẩn astm a106" — I — ~2142 từ
│   ├── tieu-chuan-astm-a53-cho-ong-thep.md — "Tiêu chuẩn ASTM A53" — I — ~2673 từ
│   ├── tieu-chuan-api-5l.md — "tiêu chuẩn API 5L" — I — ~2547 từ
│   ├── tieu-chuan-din-en-cho-ong-thep-duc.md — "tiêu chuẩn Din" — I — ~1201 từ
│   └── tieu-chuan-gb-t-700-tieu-chuan-cong-nghiep-trung-quoc.md — "tiêu chuẩn gb t 700" — I — ~3034 từ
│
├── SUPPORTING (Bài kiến thức/so sánh — 5 bài):
│   ├── so-sanh-giua-ong-thep-duc-va-ong-thep-han.md — "phân biệt ống đúc và ống hàn" — I — ~1575 từ
│   ├── quy-trinh-san-xuat-ong-duc-va-ong-han.md — "quy trình sản xuất ống đúc" — I — ~2013 từ
│   ├── cach-bao-quan-ong-thep-duc.md — "Cách bảo quản Ống thép đúc" — I — ~1446 từ
│   ├── ong-thep-duc-hoa-phat-co-san-xuat-khong.md — "ống thép đúc hòa phát" — I — ~1751 từ
│   └── phu-kien-ong-thep-duc-gom-co-nhung-loai-nao.md — "phụ kiện ống thép đúc" — I — ~8654 từ
│
├── SUPPORTING (Bài thương mại — 2 bài):
│   ├── gia-ong-thep-duc-trung-quoc-moi-nhat.md — "giá ống thép đúc" — I(→C) — ~3204 từ
│   └── dia-chi-cung-cap-ong-thep-duc-tai-ha-noi-chat-luong-uy-tin.md — "mua ống thép đúc tại hà nội" — I(→T) — ~1134 từ
│
├── MERGED:
│   ├── ong-thep-duc-la-gi.md → redirect 301 → ong-thep-duc
│   └── ong-thep-duc-nhung-dieu-can-biet-truoc-khi-mua.md → redirect 301 → ong-thep-duc
```

---

## Phase 2: Review từng bài — Scoring 100đ

### PILLAR

| File | Intent (20) | EEAT (25) | GEO (15) | Voice (15) | Structure (15) | Role (10) | **TOTAL** | **Verdict** |
|------|:-----------:|:---------:|:--------:|:----------:|:--------------:|:---------:|:---------:|:-----------:|
| `ong-thep-duc.md` | 20 | 19 | 13 | 13 | 15 | 10 | **90đ** | **ĐẠT** |

**Chi tiết pillar:**
- **Intent 20/20**: ĐẠT — Cover toàn diện: định nghĩa, phân loại, tiêu chuẩn, giá, cách chọn, ứng dụng
- **EEAT 19/25** (9/12): Case study thực (85 tấn cho nhà máy nhiệt điện Bình Dương), thông tin liên hệ công ty, số liệu cụ thể. Thiếu: author bio, social proof, link profile
- **GEO 13/15** (5/6): Answer-first tốt, định nghĩa rõ, nhiều table. Thiếu: original data insight sâu hơn
- **Voice 13/15** (10/12): Giọng tự nhiên, dùng "chúng tôi", có quan điểm. Vài câu hơi dài
- **Structure 15/15**: H1 đúng, H2/H3 logic, scannable (table, list, bold), độ dài phù hợp (~2889 từ)
- **Role 10/10**: CẦN THIẾT — Hub page chính của cluster

---

### SUPPORTING — Bài kiến thức / so sánh (5 bài)

| File | Intent (20) | EEAT (25) | GEO (15) | Voice (15) | Structure (15) | Role (10) | **TOTAL** | **Verdict** |
|------|:-----------:|:---------:|:--------:|:----------:|:--------------:|:---------:|:---------:|:-----------:|
| `so-sanh-giua-ong-thep-duc-va-ong-thep-han.md` | 20 | 13 | 10 | 10 | 12 | 10 | **75đ** | CẦN OPTIMIZE |
| `quy-trinh-san-xuat-ong-duc-va-ong-han.md` | 20 | 13 | 10 | 8 | 12 | 10 | **73đ** | CẦN OPTIMIZE |
| `cach-bao-quan-ong-thep-duc.md` | 20 | 10 | 8 | 10 | 12 | 10 | **70đ** | CẦN OPTIMIZE |
| `ong-thep-duc-hoa-phat-co-san-xuat-khong.md` | 20 | 10 | 8 | 10 | 12 | 10 | **70đ** | CẦN OPTIMIZE |
| `phu-kien-ong-thep-duc-gom-co-nhung-loai-nao.md` | 20 | 15 | 10 | 10 | 15 | 10 | **80đ** | ĐẠT |

---

### SUPPORTING — Bài tiêu chuẩn (8 bài)

| File | Intent (20) | EEAT (25) | GEO (15) | Voice (15) | Structure (15) | Role (10) | **TOTAL** | **Verdict** |
|------|:-----------:|:---------:|:--------:|:----------:|:--------------:|:---------:|:---------:|:-----------:|
| `tieu-chuan-thep-ong-duc.md` | 0 | 13 | 10 | 8 | 12 | 3 | **46đ** | CẦN REWRITE |
| `tieu-chuan-thep-ong-duc-sch40.md` | 20 | 15 | 13 | 8 | 15 | 10 | **81đ** | ĐẠT |
| `tieu-chuan-ong-thep-duc-sch80.md` | 20 | 13 | 10 | 8 | 12 | 10 | **73đ** | CẦN OPTIMIZE |
| `tieu-chuan-astm-a106-cho-ong-thep-duc.md` | 20 | 13 | 10 | 8 | 12 | 10 | **73đ** | CẦN OPTIMIZE |
| `tieu-chuan-astm-a53-cho-ong-thep.md` | 20 | 13 | 10 | 8 | 12 | 10 | **73đ** | CẦN OPTIMIZE |
| `tieu-chuan-api-5l.md` | 20 | 13 | 10 | 8 | 12 | 10 | **73đ** | CẦN OPTIMIZE |
| `tieu-chuan-din-en-cho-ong-thep-duc.md` | 20 | 10 | 10 | 6 | 8 | 10 | **64đ** | CẦN OPTIMIZE |
| `tieu-chuan-gb-t-700-tieu-chuan-cong-nghiep-trung-quoc.md` | 20 | 13 | 10 | 6 | 12 | 10 | **71đ** | CẦN OPTIMIZE |

**Ghi chú `tieu-chuan-thep-ong-duc.md`**: Intent = 0đ vì title hoàn toàn sai — title nói "Phi 406 DN400" nhưng keyword và nội dung là về tiêu chuẩn tổng hợp. Role = TRÙNG LẶP (3đ) vì overlap >30% với pillar (phần tiêu chuẩn trong pillar đã cover tương tự).

---

### SUPPORTING — Bài thương mại (2 bài)

| File | Intent (20) | EEAT (25) | GEO (15) | Voice (15) | Structure (15) | Role (10) | **TOTAL** | **Verdict** |
|------|:-----------:|:---------:|:--------:|:----------:|:--------------:|:---------:|:---------:|:-----------:|
| `gia-ong-thep-duc-trung-quoc-moi-nhat.md` | 20 | 15 | 13 | 8 | 12 | 10 | **78đ** | CẦN OPTIMIZE |
| `dia-chi-cung-cap-ong-thep-duc-tai-ha-noi...` | 20 | 17 | 10 | 13 | 12 | 10 | **82đ** | ĐẠT |

**Ghi chú**: Dù intent declared là "I", nội dung thực tế phù hợp cho C (giá) và T (mua). Chấm intent = ĐẠT dựa trên nội dung thực tế, nhưng ghi nhận frontmatter cần sửa.

---

### SUPPORTING — Bài kích thước phi (18 bài)

#### Nhóm A: Bài đủ dài, có nội dung thực (≥800 từ) — 6 bài

| File | Intent (20) | EEAT (25) | GEO (15) | Voice (15) | Structure (15) | Role (10) | **TOTAL** | **Verdict** |
|------|:-----------:|:---------:|:--------:|:----------:|:--------------:|:---------:|:---------:|:-----------:|
| `thep-ong-duc-phi-127.md` (~1601 từ) | 20 | 10 | 8 | 8 | 12 | 10 | **68đ** | CẦN OPTIMIZE |
| `thep-ong-duc-phi-610.md` (~1459 từ) | 20 | 10 | 8 | 6 | 12 | 10 | **66đ** | CẦN OPTIMIZE |
| `ong-thep-duc-phi-508...` (~1370 từ) | 20 | 10 | 8 | 8 | 12 | 10 | **68đ** | CẦN OPTIMIZE |
| `thep-ong-duc-phi-141...` (~929 từ) | 20 | 8 | 8 | 6 | 8 | 10 | **60đ** | CẦN OPTIMIZE |
| `ong-thep-duc-phi-60.md` (~888 từ) | 20 | 8 | 8 | 6 | 12 | 10 | **64đ** | CẦN OPTIMIZE |
| `thep-ong-duc-phi-219...` (~831 từ) | 20 | 8 | 8 | 8 | 8 | 10 | **62đ** | CẦN OPTIMIZE |

#### Nhóm B: Bài ngắn / mỏng (<800 từ) — 12 bài

| File | Từ | Intent (20) | EEAT (25) | GEO (15) | Voice (15) | Struct (15) | Role (10) | **TOTAL** | **Verdict** |
|------|:--:|:-----------:|:---------:|:--------:|:----------:|:-----------:|:---------:|:---------:|:-----------:|
| `thep-ong-duc-phi-325...` | 527 | 20 | 6 | 5 | 5 | 8 | 3 | **47đ** | CẦN REWRITE |
| `thep-ong-duc-phi-48...` | 518 | 20 | 6 | 5 | 5 | 8 | 3 | **47đ** | CẦN REWRITE |
| `thep-ong-duc-phi-355...` | 499 | 20 | 6 | 5 | 5 | 8 | 3 | **47đ** | CẦN REWRITE |
| `thep-ong-duc-phi-76...` | 492 | 20 | 6 | 5 | 5 | 8 | 3 | **47đ** | CẦN REWRITE |
| `thep-ong-duc-phi-406...` | 474 | 20 | 6 | 5 | 5 | 8 | 3 | **47đ** | CẦN REWRITE |
| `thep-ong-duc-phi-168...` | 424 | 20 | 6 | 5 | 4 | 4 | 3 | **42đ** | CẦN REWRITE |
| `ong-duc-phi-34-dn25.md` | 407 | 20 | 6 | 5 | 4 | 4 | 3 | **42đ** | CẦN REWRITE |
| `ong-thep-duc-phi-27.md` | 351 | 20 | 4 | 5 | 4 | 4 | 3 | **40đ** | CẦN REWRITE |
| `ong-thep-duc-phi-21...` | 338 | 20 | 4 | 5 | 4 | 4 | 3 | **40đ** | CẦN REWRITE |
| `thep-ong-duc-phi-273...` | 318 | 20 | 4 | 5 | 4 | 4 | 3 | **40đ** | CẦN REWRITE |
| `thep-ong-duc-phi-42...` | 283 | 20 | 4 | 3 | 4 | 4 | 3 | **38đ** | NÊN XÓA/MERGE |
| `thep-ong-duc-phi-90...` | 264 | 20 | 4 | 3 | 4 | 4 | 3 | **38đ** | NÊN XÓA/MERGE |

**Ghi chú nhóm phi**:
- **Role = TRÙNG LẶP (3đ)** cho 12 bài ngắn: Tất cả đều có cấu trúc gần giống nhau (thông số kỹ thuật + bảng giá + CTA). Overlap giữa các bài >30% ý chính. Mỗi bài chỉ khác nhau ở con số phi/DN.
- **Role = CẦN THIẾT (10đ)** cho 6 bài dài: Có nội dung bổ sung giá trị (giải thích ứng dụng, tính toán trọng lượng, case study).

---

### Tổng hợp Phase 2

| Verdict | Số bài | Tỷ lệ |
|---------|--------|--------|
| **ĐẠT** (≥80đ) | 4 | 12% |
| **CẦN OPTIMIZE** (60-79đ) | 17 | 50% |
| **CẦN REWRITE** (40-59đ) | 11 | 32% |
| **NÊN XÓA/MERGE** (<40đ) | 2 | 6% |
| **TỔNG** | **34** | 100% |

---

## Phase 3: Đánh giá tổng thể Cluster

### 3.1. Coverage — Đủ chưa?

**Subtopics trong Pillar (H2/H3):**

| # | H2/H3 trong Pillar | Có bài supporting? | Supporting file |
|---|---------------------|:-------------------:|-----------------|
| 1 | Ống thép đúc là gì? | Đã MERGE | `ong-thep-duc-la-gi.md` → pillar |
| 2 | Phân loại (theo quy trình, vật liệu, ứng dụng) | Không | — |
| 3 | Kích thước & thông số kỹ thuật | CÓ (18 bài phi) | Phi 21–610 |
| 4 | Tiêu chuẩn (ASTM, API, SCH...) | CÓ (8 bài) | tieu-chuan-*.md |
| 5 | Bảng giá | CÓ | `gia-ong-thep-duc-trung-quoc-moi-nhat.md` |
| 6 | Cách chọn ống phù hợp | Một phần | `ong-thep-duc-nhung-dieu-can-biet-truoc-khi-mua.md` → MERGED |
| 7 | Ứng dụng thực tế | Không | — |
| 8 | Quy trình sản xuất | CÓ | `quy-trinh-san-xuat-ong-duc-va-ong-han.md` |
| 9 | Cách bảo quản | CÓ | `cach-bao-quan-ong-thep-duc.md` |
| 10 | Mua ở đâu? | CÓ | `dia-chi-cung-cap...` |
| 11 | So sánh ống đúc vs ống hàn | CÓ | `so-sanh-giua-ong-thep-duc-va-ong-thep-han.md` |

**Intent coverage matrix:**

| Intent | Số bài | Đủ chưa? |
|--------|:------:|----------|
| I (Informational) | 32 | ĐÃ DƯ — quá tập trung vào I |
| N (Navigational) | 0 | OK (không cần thiết cho cluster này) |
| C (Commercial) | 1 (gia-ong-thep-duc) | THIẾU — cần ≥ 2 bài so sánh/đánh giá |
| T (Transactional) | 1 (dia-chi-cung-cap) | THIẾU — cần thêm bài cho các khu vực khác |

**User Journey gaps:**

| Giai đoạn | Có? | Chi tiết |
|-----------|:---:|---------|
| **Awareness** (khái niệm) | CÓ | Pillar + nhiều bài kiến thức |
| **Consideration** (so sánh, đánh giá) | YẾU | Chỉ 1 bài so sánh, thiếu bài "ống đúc vs ống inox", "chọn tiêu chuẩn nào?" |
| **Decision** (hành động mua) | YẾU | Chỉ 1 bài giá + 1 bài địa chỉ. Thiếu bài HCM, PCCC, dầu khí |

**Subtopic THIẾU:**

| # | Subtopic gợi ý | Keyword | Intent | Lý do thiếu |
|---|-----------------|---------|--------|-------------|
| 1 | Ứng dụng ống thép đúc trong PCCC | ống thép đúc pccc | I | Pillar nhắc PCCC nhưng chưa có bài đi sâu |
| 2 | Ứng dụng ống thép đúc trong dầu khí | ống thép đúc dầu khí | I | Pillar nhắc nhưng chưa có bài riêng |
| 3 | Ống thép đúc inox vs carbon | ống thép đúc inox | C | Pillar phân loại nhưng chưa có bài so sánh |
| 4 | Ống thép đúc mạ kẽm | ống thép đúc mạ kẽm | I | Pillar nhắc nhưng chưa có bài riêng |
| 5 | Cách tính trọng lượng ống thép đúc | cách tính trọng lượng ống thép đúc | I | Nhiều bài phi có bảng trọng lượng nhưng thiếu bài hướng dẫn tổng hợp |
| 6 | Mua ống thép đúc ở HCM | mua ống thép đúc tphcm | T | Chỉ có bài Hà Nội, thiếu HCM (trụ sở chính) |
| 7 | Ống thép đúc chịu nhiệt (boiler grade) | ống thép đúc chịu nhiệt | I | Ứng dụng quan trọng, pillar nhắc nhưng chưa có bài |
| 8 | Cách đọc ký hiệu ống thép đúc | cách đọc ký hiệu ống thép | I | Pillar có phần ký hiệu nhưng ngắn, user hay tìm |

**Verdict Coverage**: THIẾU — thiếu 8 subtopic quan trọng, quá tập trung vào bài kích thước phi mà thiếu bài ứng dụng và Consideration/Decision.

---

### 3.2. Overlap — Có trùng không?

**Cặp trùng lặp phát hiện:**

| # | Bài A | Bài B | Loại trùng | Mức độ | Recommendation |
|---|-------|-------|------------|--------|----------------|
| 1 | `tieu-chuan-thep-ong-duc.md` (tổng hợp tiêu chuẩn) | Phần "Tiêu chuẩn" trong Pillar | Content overlap ~40% | CAO | MERGE vào pillar hoặc rewrite hoàn toàn (title sai) |
| 2 | 12 bài phi ngắn (<800 từ) | Lẫn nhau | Keyword overlap + Content overlap | CAO | Gộp thành 3-4 bài theo nhóm kích thước |
| 3 | `quy-trinh-san-xuat-ong-duc-va-ong-han.md` | `so-sanh-giua-ong-thep-duc-va-ong-thep-han.md` | Content overlap ~25% | NHẸ | Giữ cả 2, nhưng phân biệt rõ hơn (1 về quy trình, 1 về chọn mua) |

**Chi tiết bài phi trùng**: 12 bài phi ngắn có cùng template: (1) Intro → (2) Thông số kỹ thuật → (3) Bảng giá → (4) CTA. Chỉ khác nhau con số. Đề xuất gộp thành:
- Bài 1: "Ống thép đúc phi nhỏ (DN15–DN40): phi 21, 27, 34, 42, 48" 
- Bài 2: "Ống thép đúc phi trung (DN65–DN150): phi 76, 90, 127, 141, 168"
- Bài 3: "Ống thép đúc phi lớn (DN200–DN400): phi 219, 273, 325, 355, 406"

**Verdict Overlap**: CÓ TRÙNG — 12 bài phi ngắn gần như clone template + 1 bài tiêu chuẩn trùng pillar.

---

### 3.3. Coherence — Liên kết logic không?

| Kiểm tra | Kết quả |
|----------|---------|
| Pillar link đến supporting? | CÓ — Pillar có link đến các bài tiêu chuẩn, so sánh, quy trình, giá |
| Supporting link về pillar? | MỘT PHẦN — Nhiều bài có link về trang sản phẩm (thepbaotin.com/san-pham/ong-thep-duc/) nhưng không link về bài pillar .md |
| User biết đọc bài nào tiếp? | YẾU — Chỉ vài bài có "Xem thêm" section. Phần lớn bài phi không link cross nhau |
| Flow logic? | TRUNG BÌNH — Tổng quan → chi tiết OK, nhưng thiếu navigation giữa các bài phi |

**Verdict Coherence**: CẦN CẢI THIỆN — Pillar làm hub tốt, nhưng supporting articles thiếu internal links lẫn nhau.

---

### 3.4. Quality Floor — Bài yếu nhất

- **Bài thấp nhất**: `thep-ong-duc-phi-42-dn32.md` và `thep-ong-duc-phi-90-dn80.md` — **38đ** (NÊN XÓA/MERGE)
- **Lý do**: Chỉ ~264-283 từ, gần như chỉ có thông số + bảng giá, không có nội dung giá trị
- **Ảnh hưởng**: Kéo avg score cluster xuống, có thể ảnh hưởng trust với Google nếu quá nhiều thin content pages

**Verdict Quality Floor**: CÓ VẤN ĐỀ — 2 bài <40đ + 11 bài cần rewrite (40-59đ)

---

### Phase 3 Output: Cluster Health

| Metric | Giá trị |
|--------|---------|
| **Avg Score** | **58đ/100** |
| **Score thấp nhất** | 38đ (`thep-ong-duc-phi-42-dn32.md`, `thep-ong-duc-phi-90-dn80.md`) |
| **Score cao nhất** | 90đ (`ong-thep-duc.md` — pillar) |
| **Số bài ĐẠT (≥80đ)** | 4/34 (12%) |
| **Số bài CẦN OPTIMIZE (60-79đ)** | 17/34 (50%) |
| **Số bài CẦN REWRITE (40-59đ)** | 11/34 (32%) |
| **Số bài NÊN XÓA/MERGE (<40đ)** | 2/34 (6%) |
| **Số cặp trùng lặp** | 3 (1 với pillar + 12 bài phi lẫn nhau + 1 cặp quy trình/so sánh nhẹ) |
| **Số subtopic thiếu** | 8 |

### Cluster Health: YẾU

**Lý do**: Avg < 60đ + Coverage thiếu 8 subtopic + 12+ bài trùng lặp nặng + 13 bài cần rewrite/xóa.

---

## Phase 4: Recommendations

### Priority 1: Fix ngay (ảnh hưởng lớn nhất)

#### 1.1. Fix frontmatter toàn bộ cluster
- Thêm `word_count`, `created`, `semantic_keywords` cho tất cả 34 bài
- Đổi `role: "Cluster Content"` → `role: "supporting"` (33 bài)
- Đổi `role: "Pillar"` → `role: "pillar"` (1 bài)
- Fix pillar intent: `"I/C"` → `"I"` (hoặc `"C"` tùy mục tiêu chính)
- Fix slug `tieu-chuan-thep-ong-duc-sch40.md`: `"Tiêu chuẩn ống thép đúc SCH40 | Cập nhật 2026 | Thép Bảo Tín"` → `"tieu-chuan-ong-thep-duc-sch40"`
- Fix title `tieu-chuan-thep-ong-duc.md`: Đổi title cho khớp keyword "tiêu chuẩn ống thép đúc"
- Fix intent: `gia-ong-thep-duc...` → `"C"`, `dia-chi-cung-cap...` → `"T"`
- Xử lý 2 file MERGED: Xóa khỏi thư mục hoặc đổi status thành giá trị hợp lệ

#### 1.2. Gộp 12 bài phi ngắn (<800 từ) thành 3 bài
Hiện tại 12 bài rất mỏng, overlap cao. Gộp thành:

| Bài mới | Gộp từ | Target keyword |
|---------|--------|----------------|
| Ống thép đúc phi nhỏ (DN15–DN40) | phi-21, phi-27, phi-34, phi-42, phi-48 | ống thép đúc phi nhỏ |
| Ống thép đúc phi trung (DN65–DN150) | phi-76, phi-90, phi-127, phi-141, phi-168 | ống thép đúc phi 76, phi 90... |
| Ống thép đúc phi lớn (DN200–DN400) | phi-219, phi-273, phi-325, phi-355, phi-406 | ống thép đúc phi lớn |

> Giữ nguyên 3 bài phi có nội dung tốt: phi-508 (1370 từ), phi-610 (1459 từ), phi-60 (888 từ) — optimize thêm.

#### 1.3. Xử lý `tieu-chuan-thep-ong-duc.md`
- Title sai hoàn toàn → rewrite title + nội dung cho đúng keyword "tiêu chuẩn ống thép đúc"
- Hoặc MERGE vào pillar (vì pillar đã có section tiêu chuẩn khá tốt)

---

### Priority 2: Optimize (cải thiện chất lượng)

| File | Score hiện tại | Cần sửa | Score mục tiêu |
|------|:--------------:|---------|:--------------:|
| `so-sanh-giua-ong-thep-duc-va-ong-thep-han.md` | 75đ | Thêm EEAT (case study, tên chuyên gia), GEO (answer-first) | 85đ |
| `quy-trinh-san-xuat-ong-duc-va-ong-han.md` | 73đ | Thêm voice (quá giáo khoa), EEAT (ví dụ thực), cải thiện cấu trúc | 82đ |
| `cach-bao-quan-ong-thep-duc.md` | 70đ | Thêm EEAT (số liệu, case), GEO (answer-first), cập nhật hình | 80đ |
| `ong-thep-duc-hoa-phat-co-san-xuat-khong.md` | 70đ | Thêm EEAT, cải thiện GEO (answer-first ngay đoạn 1) | 80đ |
| `gia-ong-thep-duc-trung-quoc-moi-nhat.md` | 78đ | Fix intent frontmatter, thêm voice, thêm so sánh giá theo thương hiệu | 85đ |
| 8 bài tiêu chuẩn | 64-81đ | Thêm voice (bớt giáo khoa), thêm EEAT (ví dụ dự án thực), sửa slug/title | 75-85đ |
| 6 bài phi dài | 60-68đ | Thêm EEAT, cải thiện voice, thêm nội dung ứng dụng | 75-80đ |

---

### Priority 3: Bổ sung (lấp gap)

```yaml
# Gợi ý bài mới 1
title: "Ứng dụng ống thép đúc trong hệ thống PCCC"
slug: "ung-dung-ong-thep-duc-trong-pccc"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "ống thép đúc pccc"
search_intent: "I"
lý_do: "Pillar nhắc PCCC là ứng dụng chính nhưng chưa có bài đi sâu. PCCC yêu cầu tiêu chuẩn riêng."

# Gợi ý bài mới 2
title: "Ống thép đúc trong ngành dầu khí — Tiêu chuẩn và yêu cầu"
slug: "ong-thep-duc-nganh-dau-khi"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "ống thép đúc dầu khí"
search_intent: "I"
lý_do: "Dầu khí là ứng dụng số 1 của ống đúc. Pillar nhắc nhưng cần bài riêng cho kỹ sư dầu khí."

# Gợi ý bài mới 3
title: "So sánh ống thép đúc inox và ống thép đúc carbon"
slug: "so-sanh-ong-thep-duc-inox-va-carbon"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "ống thép đúc inox"
search_intent: "C"
lý_do: "Thiếu bài Consideration — giúp user chọn giữa 2 loại vật liệu."

# Gợi ý bài mới 4
title: "Mua ống thép đúc ở TP.HCM — Kho hàng sẵn, giao nhanh"
slug: "mua-ong-thep-duc-tphcm"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "mua ống thép đúc tphcm"
search_intent: "T"
lý_do: "Trụ sở chính ở HCM nhưng chưa có bài local cho khu vực này."

# Gợi ý bài mới 5
title: "Ống thép đúc chịu nhiệt — Loại nào chịu được trên 400°C?"
slug: "ong-thep-duc-chiu-nhiet"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "ống thép đúc chịu nhiệt"
search_intent: "I"
lý_do: "Ứng dụng nồi hơi là thế mạnh Thép Bảo Tín. Cần bài chuyên sâu cho boiler grade."

# Gợi ý bài mới 6
title: "Cách tính trọng lượng ống thép đúc — Công thức và bảng tra"
slug: "cach-tinh-trong-luong-ong-thep-duc"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "cách tính trọng lượng ống thép đúc"
search_intent: "I"
lý_do: "Nhiều bài phi có bảng trọng lượng riêng lẻ. Cần 1 bài tổng hợp với công thức + calculator."

# Gợi ý bài mới 7
title: "Ống thép đúc mạ kẽm — Đặc điểm, giá và ứng dụng"
slug: "ong-thep-duc-ma-kem"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "ống thép đúc mạ kẽm"
search_intent: "I"
lý_do: "Pillar phân loại nhưng chưa có bài riêng. Mạ kẽm là biến thể phổ biến."

# Gợi ý bài mới 8
title: "Cách đọc ký hiệu ống thép đúc (DN, NPS, SCH, Phi)"
slug: "cach-doc-ky-hieu-ong-thep-duc"
cluster: "Ống thép đúc"
role: "supporting"
target_keyword: "ký hiệu ống thép đúc"
search_intent: "I"
lý_do: "Pillar có phần ngắn về ký hiệu. User mới hay nhầm DN/NPS/Phi. Cần bài hướng dẫn chi tiết."
```

---

### Priority 4: Liên kết (tăng coherence)

**Internal links cần thêm:**

| Từ bài | → Đến bài | Anchor gợi ý |
|--------|-----------|---------------|
| Mỗi bài phi | → Pillar | "Tìm hiểu tổng quan về ống thép đúc" |
| Mỗi bài phi | → Bài giá | "Xem bảng giá ống thép đúc cập nhật" |
| Mỗi bài tiêu chuẩn | → Pillar | "Xem tất cả tiêu chuẩn ống thép đúc" |
| Pillar | → Bài tiêu chuẩn tổng hợp | "Xem chi tiết tất cả tiêu chuẩn" |
| Bài so sánh | → Bài quy trình sản xuất | "Xem quy trình sản xuất ống đúc vs ống hàn" |
| Bài PCCC (mới) | → Bài tiêu chuẩn ASTM A53 | "Tiêu chuẩn phổ biến cho hệ thống PCCC" |
| Bài giá | → Bài mua ở đâu | "Xem địa chỉ cung cấp ống thép đúc uy tín" |

**Flow đọc đề xuất:**
```
Pillar (tổng quan) 
  → Phân loại (inox vs carbon vs mạ kẽm)
  → Tiêu chuẩn (chọn tiêu chuẩn nào?)
  → Kích thước (phi nhỏ/trung/lớn)
  → Ứng dụng (PCCC / dầu khí / chịu nhiệt)
  → Giá
  → Mua ở đâu
```

---

## Phase 5: Topical Map — Ống thép đúc

**Cluster Health**: **YẾU**
**Avg Score**: **58đ/100**
**Tổng bài**: 34 hiện có + 8 cần viết thêm

---

### PILLAR

| File | Score | Verdict | Keyword | Intent |
|------|:-----:|---------|---------|:------:|
| `ong-thep-duc.md` | **90đ** | ĐẠT | ống thép đúc | I |

### SUPPORTING — ĐÃ CÓ

| File | Score | Verdict | Keyword | Intent | Ghi chú |
|------|:-----:|---------|---------|:------:|---------|
| `dia-chi-cung-cap-ong-thep-duc-tai-ha-noi...` | 82đ | ĐẠT | mua ống thép đúc tại hà nội | T | Fix intent frontmatter |
| `tieu-chuan-thep-ong-duc-sch40.md` | 81đ | ĐẠT | tiêu chuẩn ống thép đúc SCH40 | I | Fix slug |
| `phu-kien-ong-thep-duc-gom-co-nhung-loai-nao.md` | 80đ | ĐẠT | phụ kiện ống thép đúc | I | |
| `gia-ong-thep-duc-trung-quoc-moi-nhat.md` | 78đ | CẦN OPTIMIZE | giá ống thép đúc | C | Fix intent frontmatter |
| `so-sanh-giua-ong-thep-duc-va-ong-thep-han.md` | 75đ | CẦN OPTIMIZE | phân biệt ống đúc và ống hàn | I | Thêm EEAT |
| `quy-trinh-san-xuat-ong-duc-va-ong-han.md` | 73đ | CẦN OPTIMIZE | quy trình sản xuất ống đúc | I | Thêm voice |
| `tieu-chuan-ong-thep-duc-sch80.md` | 73đ | CẦN OPTIMIZE | tiêu chuẩn ống thép đúc sch80 | I | |
| `tieu-chuan-astm-a106-cho-ong-thep-duc.md` | 73đ | CẦN OPTIMIZE | tiêu chuẩn astm a106 | I | |
| `tieu-chuan-astm-a53-cho-ong-thep.md` | 73đ | CẦN OPTIMIZE | Tiêu chuẩn ASTM A53 | I | |
| `tieu-chuan-api-5l.md` | 73đ | CẦN OPTIMIZE | tiêu chuẩn API 5L | I | |
| `tieu-chuan-gb-t-700...` | 71đ | CẦN OPTIMIZE | tiêu chuẩn gb t 700 | I | |
| `cach-bao-quan-ong-thep-duc.md` | 70đ | CẦN OPTIMIZE | Cách bảo quản Ống thép đúc | I | |
| `ong-thep-duc-hoa-phat-co-san-xuat-khong.md` | 70đ | CẦN OPTIMIZE | ống thép đúc hòa phát | I | |
| `thep-ong-duc-phi-127.md` | 68đ | CẦN OPTIMIZE | ống thép đúc phi 127 | I | |
| `ong-thep-duc-phi-508...` | 68đ | CẦN OPTIMIZE | ống thép đúc phi 508 | I | |
| `thep-ong-duc-phi-610.md` | 66đ | CẦN OPTIMIZE | ống thép đúc phi 610 | I | |
| `tieu-chuan-din-en...` | 64đ | CẦN OPTIMIZE | tiêu chuẩn Din | I | |
| `ong-thep-duc-phi-60.md` | 64đ | CẦN OPTIMIZE | ống thép đúc phi 60 | I | |
| `thep-ong-duc-phi-219...` | 62đ | CẦN OPTIMIZE | ống thép đúc phi 219 | I | |
| `thep-ong-duc-phi-141...` | 60đ | CẦN OPTIMIZE | ống thép đúc phi 141 | I | |
| `thep-ong-duc-phi-325...` | 47đ | MERGE | ống thép đúc phi 325 | I | Gộp vào bài "phi lớn" |
| `thep-ong-duc-phi-48...` | 47đ | MERGE | ống thép đúc phi 48 | I | Gộp vào bài "phi nhỏ" |
| `thep-ong-duc-phi-355...` | 47đ | MERGE | ống thép đúc phi 355 | I | Gộp vào bài "phi lớn" |
| `thep-ong-duc-phi-76...` | 47đ | MERGE | ống thép đúc phi 76 | I | Gộp vào bài "phi trung" |
| `thep-ong-duc-phi-406...` | 47đ | MERGE | ống thép đúc phi 406 | I | Gộp vào bài "phi lớn" |
| `tieu-chuan-thep-ong-duc.md` | 46đ | REWRITE | tiêu chuẩn ống thép đúc | I | Title sai, trùng pillar |
| `thep-ong-duc-phi-168...` | 42đ | MERGE | ống thép đúc phi 168 | I | Gộp vào bài "phi trung" |
| `ong-duc-phi-34-dn25.md` | 42đ | MERGE | Ống thép đúc phi 34 | I | Gộp vào bài "phi nhỏ" |
| `ong-thep-duc-phi-27.md` | 40đ | MERGE | ống thép đúc phi 27 | I | Gộp vào bài "phi nhỏ" |
| `ong-thep-duc-phi-21...` | 40đ | MERGE | ống thép đúc phi 21 | I | Gộp vào bài "phi nhỏ" |
| `thep-ong-duc-phi-273...` | 40đ | MERGE | ống thép đúc phi 273 | I | Gộp vào bài "phi lớn" |
| `thep-ong-duc-phi-42...` | 38đ | XÓA/MERGE | ống thép đúc phi 42 | I | Gộp vào bài "phi nhỏ" |
| `thep-ong-duc-phi-90...` | 38đ | XÓA/MERGE | ống thép đúc phi 90 | I | Gộp vào bài "phi trung" |

### SUPPORTING — CẦN VIẾT THÊM

| # | Tiêu đề gợi ý | Keyword | Intent | Lý do |
|---|----------------|---------|:------:|-------|
| 1 | Ứng dụng ống thép đúc trong hệ thống PCCC | ống thép đúc pccc | I | Pillar nhắc nhưng chưa có bài đi sâu |
| 2 | Ống thép đúc trong ngành dầu khí | ống thép đúc dầu khí | I | Ứng dụng #1, cần bài chuyên sâu |
| 3 | So sánh ống thép đúc inox và carbon | ống thép đúc inox | C | Thiếu bài Consideration |
| 4 | Mua ống thép đúc ở TP.HCM | mua ống thép đúc tphcm | T | Trụ sở chính ở HCM, thiếu bài local |
| 5 | Ống thép đúc chịu nhiệt — Boiler grade | ống thép đúc chịu nhiệt | I | Thế mạnh Thép Bảo Tín |
| 6 | Cách tính trọng lượng ống thép đúc | cách tính trọng lượng ống thép đúc | I | Nhu cầu tìm kiếm cao |
| 7 | Ống thép đúc mạ kẽm | ống thép đúc mạ kẽm | I | Pillar nhắc, chưa có bài riêng |
| 8 | Cách đọc ký hiệu ống thép (DN, NPS, SCH, Phi) | ký hiệu ống thép đúc | I | User mới hay nhầm, cần hướng dẫn |

### CLUSTER METRICS

- **Coverage**: 11/19 subtopics (58%) — thiếu 8 subtopic
- **Overlap**: 13 bài trùng (12 bài phi ngắn + 1 bài tiêu chuẩn tổng hợp)
- **Coherence**: CẦN CẢI THIỆN — pillar hub tốt nhưng supporting thiếu cross-link
- **Quality Floor**: 38đ (`thep-ong-duc-phi-42-dn32.md`)

---

## Tổng kết

| Hạng mục | Đánh giá |
|----------|----------|
| **Cluster Health** | **YẾU** |
| **Avg Score** | **58đ/100** |
| **Vấn đề #1** | Frontmatter sai toàn bộ (thiếu 3 trường, role sai) |
| **Vấn đề #2** | 12 bài phi ngắn thin content, overlap nặng |
| **Vấn đề #3** | Thiếu bài Consideration/Decision (quá tập trung Informational) |
| **Hành động ưu tiên** | Fix frontmatter → Gộp bài phi → Viết 8 bài mới |

**Nếu thực hiện đầy đủ recommendations**, dự kiến:
- Cluster giảm từ 34 bài → ~25 bài (gộp 12 bài phi thành 3)
- Thêm 8 bài mới → tổng ~33 bài
- Avg score mục tiêu: **75-80đ/100**
- Cluster Health: **TRUNG BÌNH → MẠNH**
