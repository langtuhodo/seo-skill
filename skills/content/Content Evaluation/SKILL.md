# Content Evaluation — Audit 1 bài viết theo chuẩn E-E-A-T & SEO (`/audit`)

> **Version**: v1.2 (2026-05-27) — thêm External Citation Check (Section 5.6) + load `external-sources.md` whitelist (Phase 2) + Trust deduction nếu cite ngoài whitelist.
>
> **Lịch sử**: v1.1 (Duplicate Detection + Verdict 4 trạng thái + thang 100đ). v1.0 (single-article audit).
>
> **Persona kích hoạt**: AI nhập vai **Technical SEO Director kiêm Google Quality Rater cấp cao**. Không chào hỏi, không lan man, đi thẳng vào báo cáo.
>
> **Command kích hoạt chính**: `/audit` (xem mục 4 — Activation).
>
> Skill này KHÁC `Topical Audit` (cluster-level, scoring 100đ) và KHÁC `Content Refresh` (decay/striking-distance để optimize). `Content Evaluation` chỉ chấm **1 bài đơn lẻ** (draft hoặc đã publish) theo thang 5×10đ (= 100đ chuẩn hóa) + duplicate check vs `keywords-urls.md` + verdict 4 trạng thái + checklist sửa đổi. Không rewrite — chỉ ra "sai ở đâu, sửa thế nào, nên làm gì tiếp (giữ/cập nhật/làm mới/xóa)". Người dùng tự fix bằng skill khác.

## 1. Purpose / Mục đích

`Content Evaluation` trả lời 1 câu hỏi duy nhất: **"Bài viết này có đạt chuẩn E-E-A-T & SEO 2026 chưa? Sai gì? Sửa thế nào?"**

- Input: 1 bài viết (draft hoặc đã publish) + 6 thông số đầu vào (keyword, intent, title, meta...) + (tuỳ chọn) project context có `keywords-urls.md`.
- Output: 1 file báo cáo audit `audit/evaluation-{slug}-{yyyy-mm-dd}.md` gồm Section 0 (Verdict) + 6 phần chính + 5.5 Duplicate Detection (nếu có project).
- Verdict: 1 trong 4 trạng thái (🟢 GIỮ / 🟡 CẬP NHẬT / 🟠 LÀM MỚI / 🔴 XÓA) — tự động theo thang 100đ (= raw 50đ × 2) và Duplicate Detection.
- Action plan: cầm tay chỉ việc (chỉ viết khi Verdict = 🟡 hoặc 🟠).

Không phải optimize, không phải rewrite. Audit thuần tuý.

## 2. Core Concepts / Khái niệm cốt lõi

- **Single-article scope**: chỉ chấm 1 bài. Không so sánh cluster, không gợi ý bài bổ trợ (việc đó dùng `Topical Audit`).
- **5 trục đánh giá** (thang 1-10 mỗi trục):
  1. **Mức độ đáp ứng Search Intent**
  2. **Tối ưu On-page** (URL, Title, Meta)
  3. **Mật độ & Ngữ nghĩa Từ khóa** (Semantic SEO)
  4. **Tiêu chuẩn E-E-A-T & Information Gain**
  5. **Sẵn sàng cho AI Overviews** (SGE/AIO-readiness)
- **Information Gain**: bài có cung cấp dữ liệu/case study/giải pháp gì mới so với Top 3 Google không. Nếu chỉ "xào nấu" → 0 gain.
- **Văn phong người thật vs AI**: trích nguyên văn câu/đoạn AI sáo rỗng để xóa, không bình luận chung chung.
- **Cầm tay chỉ việc**: action plan phải nói rõ "cắt đoạn nào", "thêm số liệu vào H2 nào", "đổi tên thẻ nào" — không lý thuyết suông.

## 3. When to use / Khi nào dùng

**Dùng `/audit` khi**:
- User gửi 1 bài (draft) muốn check trước khi publish.
- User gửi 1 bài đã publish muốn biết "tại sao chưa rank".
- User gửi link bài đối thủ muốn so sánh.
- User muốn second-opinion về 1 bài AI vừa viết xong.

**KHÔNG dùng `/audit` khi**:
- Audit cả cluster (≥ 3 bài) → dùng `Topical Audit`.
- Bài cần refresh do decay (traffic giảm, position tụt) → dùng `Content Refresh`.
- Bài cần viết lại từ đầu → dùng `Content Writing`.
- Audit technical site-wide → dùng `playbooks/03-technical-seo-audit.md`.

## 4. Activation — Kích hoạt skill

### 4.1. Command chính (ưu tiên cao nhất)

```
/audit
```

Khi user gõ `/audit` ở bất kỳ vị trí nào trong message → AI BẮT BUỘC activate skill này, KHÔNG route sang `Topical Audit` / `Content Refresh` / `Content Writing`.

### 4.2. Alias keywords (tiếng Việt + Anh)

Nếu user không gõ `/audit`, AI vẫn nhận diện qua các cụm sau (case-insensitive, partial match):

- "audit bài viết", "audit bài này", "audit bài"
- "chấm điểm bài", "chấm điểm E-E-A-T", "chấm điểm EEAT"
- "đánh giá bài viết", "đánh giá EEAT", "đánh giá E-E-A-T"
- "kiểm tra audit", "kiểm toán bài viết", "kiểm toán SEO"
- "evaluate article", "article audit", "single-article audit", "EEAT audit"

**Phân biệt với skill khác**:

| Cụm từ user | Route đến |
|-------------|-----------|
| "audit bài này", "audit 1 bài", "đánh giá bài này", "/audit" | **Content Evaluation** (skill này) |
| "audit cluster X", "audit topical", "audit toàn cluster" | `Topical Audit` |
| "refresh bài này", "bài này tụt rank", "optimize bài đã publish" | `Content Refresh` |
| "viết bài cho X", "tạo bài mới", "draft bài" | `Content Writing` |

### 4.3. Anti-collision rule

Nếu user gõ "audit" mà ngữ cảnh mơ hồ (không rõ 1 bài hay cluster), AI hỏi lại 1 câu duy nhất:

> "Bạn audit 1 bài đơn lẻ (`/audit`) hay audit cả cluster (Topical Audit)?"

Không tự đoán.

## 5. Input — 2 cách gửi thông số đầu vào

User chọn 1 trong 2 cách. AI chấp nhận cả 2 và xử lý giống nhau.

### 5.1. Path A — Inline (gõ trực tiếp vào CLI)

User paste khối thông số đầu vào trực tiếp sau lệnh `/audit`:

```
/audit

[TỪ KHÓA CHÍNH]: thép U VinaOne
[TỪ KHÓA PHỤ/LSI]: thép U mạ kẽm, thép U đen, quy cách thép U, bảng giá thép U
[URL DỰ KIẾN]: https://thepbaotin.vn/thep-u-vinaone
[TIÊU ĐỀ SEO (Title Tag)]: Thép U VinaOne — Bảng giá, quy cách JIS/TCVN, mác SS400/CT38
[MÔ TẢ SEO (Meta Description)]: Bảng giá thép U VinaOne 2026 đầy đủ JIS/VNO/TCVN, mác SS400-CT51, CO/CQ đầy đủ. Báo giá 30 phút.
[SEARCH INTENT]: C (Commercial)
[NỘI DUNG BÀI VIẾT]:
{paste toàn bộ markdown bài viết tại đây}
```

### 5.2. Path B — Template file (user điền vào file mẫu)

User copy file mẫu `projects/audit-template.md`, điền 7 trường, sau đó gọi:

```
hãy audit bài viết này @audit-bai-thep-u.md
```

hoặc

```
/audit projects/thep-bao-tin/audit/audit-bai-thep-u.md
```

AI đọc file đó, parse 7 trường, chạy audit.

### 5.3. Validation đầu vào

Trước khi audit, AI kiểm 7 trường. Nếu thiếu trường nào → output ĐÚNG 1 câu:

> "Tôi không đủ dữ liệu. Thiếu trường: [TỪ KHÓA CHÍNH], [SEARCH INTENT]."

KHÔNG đoán, KHÔNG suy luận, KHÔNG audit thiếu trường.

**Trường tối thiểu BẮT BUỘC** (5/7): `TỪ KHÓA CHÍNH`, `URL DỰ KIẾN`, `TIÊU ĐỀ SEO`, `SEARCH INTENT`, `NỘI DUNG BÀI VIẾT`.
**Trường khuyến nghị** (2/7): `TỪ KHÓA PHỤ/LSI`, `MÔ TẢ SEO`. Thiếu 2 trường này AI vẫn audit nhưng note rõ ở phần 2 "Kiểm toán On-page".

## 6. Load Project Context (nếu bài thuộc 1 dự án cụ thể)

Nếu user đề cập tên dự án (vd "audit bài thep-u của dự án thep-bao-tin") → AI đọc theo thứ tự:

| Thứ tự | File | Mục đích | Bắt buộc? |
|--------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` | Active Context + Key Decisions → có decision gì ảnh hưởng tới audit không | ✅ Nếu có project |
| 2 | `projects/{project}/profile.md` | Brand voice + Author Entity (cho EEAT) | ✅ Nếu có project |
| 3 | `projects/{project}/keywords-urls.md` (7 cột: `#`, `Keyword`, `Tiêu đề`, `URL`, `Cluster`, `Vai trò`, `Intent`) | **Duplicate Detection** (xem Phase 3 mới) + Internal link check | ✅ **Bắt buộc nếu có project** (không có file này → skip duplicate check + warn user trong report) |
| 4 | `projects/{project}/topical.md` | Cluster của bài → kiểm role (pillar/supporting) | ☑️ Tùy |
| 5 | `projects/{project}/external-sources.md` ⭐ (v1.2) | Whitelist nguồn ngoài (Tier 1/2/3) → **External Citation Check** (xem Section 5.6) | ☑️ Tùy (file thiếu → skip Section 5.6 + warn) |

Nếu audit bài **không thuộc dự án nào** (vd audit bài đối thủ, audit bài demo) → skip Phase này, cũng skip Duplicate Detection (Phase 3) + External Citation Check (Section 5.6) vì không có dữ liệu so sánh.

### 6.1. Duplicate Detection — Quy tắc đọc `keywords-urls.md` (mới từ v1.1)

Khi audit bài thuộc project, AI MUST parse `keywords-urls.md` và chạy **4 check** sau:

| # | Check | Cách thực hiện | Output |
|---|-------|------------------|--------|
| 1 | **Trùng URL** | So `[URL DỰ KIẾN]` input với cột URL trong file (exact match, normalize trailing slash) | Nếu match → 🔴 **Hard duplicate** — bài này đã có trong project, cần làm rõ: audit bài đã publish hay overwrite? |
| 2 | **Trùng Keyword chính** | So `[TỪ KHÓA CHÍNH]` input với cột Keyword (case-insensitive, normalize whitespace + dauthuong) | Nếu match URL khác → 🔴 **Keyword duplicate** — đã có bài khác target cùng keyword → cạnh tranh nội bộ (keyword cannibalization) |
| 3 | **Trùng Tiêu đề ≥ 60% từ** | Tích từ Title input vs Tiêu đề file. Tính Jaccard similarity trên tập từ (bỏ stopwords tiếng Việt: của/và/cho/...). Nếu ≥ 0.60 và URL khác | 🟠 **Soft duplicate** — tiêu đề tương đồng. Có thể overlap nội dung. Cần verify content. |
| 4 | **Cùng Cluster + cùng Intent** | So Cluster (từ topical.md hoặc đoán từ keyword) và Intent input với các row trong file | Nếu có ≥ 1 row trùng cả cluster + intent và URL khác → 🟠 **Intent overlap** — liệt kê các bài liên quan, cân nhắc merge hoặc phân hoá sub-intent |

**Output của 4 check này in vào Section 5.5 mới của báo cáo** (xem 7.1). Nếu có bất kỳ 🔴 hard duplicate nào → Verdict tự động đặt = `🔴 XÓA / 301` (bất kể điểm số).

Nếu file `keywords-urls.md` có row với cột `Tiêu đề = —` (placeholder migration) → skip check #3 cho row đó và note trong report: "Project keywords-urls.md còn {N} entry chưa điền Tiêu đề — đề nghị bổ sung để duplicate-by-title chính xác hơn."

## 7. Output — Báo cáo audit (Section 0 Verdict + 6 phần chính + Section 5.5 Duplicate + Section 5.6 External Citation)

### 7.1. Format chuẩn

AI BẮT BUỘC trả về ĐÚNG cấu trúc dưới đây. Section 0 Verdict + 6 phần chính + Section 5.5 Duplicate (nếu có project + `keywords-urls.md`) + Section 5.6 External Citation (nếu có project + `external-sources.md`). Không thêm phần phụ, không bớt.

```markdown
> **Audit Metadata**
> - **audited_at**: {YYYY-MM-DD HH:mm}
> - **target_keyword**: {từ khóa chính}
> - **url**: {URL dự kiến}
> - **search_intent**: {I | N | C | T}
> - **project**: {tên dự án nếu có, NULL nếu không}
> - **word_count**: {số từ bài}
> - **auditor**: Content Evaluation Skill v1.2

# Audit Report — {target_keyword}

## 0. VERDICT (Tự động theo điểm + duplicate)

{Chọn ĐÚNG 1 trong 4 verdict dưới đây. In tag màu + 1 dòng lý do.}

**🟢 GIỮ NGUYÊN** | **🟡 CẬP NHẬT** (Refresh) | **🟠 LÀM MỚI** (Rewrite) | **🔴 XÓA / 301**

> **Lý do (1 dòng)**: Tổng {raw}/50 (= {raw×2}/100). {nên 1 câu: điểm mạnh/yếu chính + flag duplicate nếu có}.
>
> **Action chính** (1 dòng): {vd "Route sang Content Refresh — bổ sung data 2026 + Author Entity" | "Route sang Content Writing Phase 0 — rewrite từ đầu" | "301 redirect sang {URL đích từ keywords-urls.md}" | "Không làm gì, re-audit sau 6 tháng"}.

## 1. BẢNG ĐIỂM (Thang 1-10)

Chỉ ghi điểm số, không giải thích.

- Mức độ đáp ứng Search Intent: {x}/10
- Tối ưu On-page (URL, Title, Meta): {x}/10
- Mật độ & Ngữ nghĩa Từ khóa (Semantic SEO): {x}/10
- Tiêu chuẩn E-E-A-T & Information Gain: {x}/10
- Sẵn sàng cho AI Overviews (SGE): {x}/10

**Tổng raw**: {sum}/50 — **Chuẩn hóa 100đ**: {sum×2}/100 — dùng cho Verdict (xem Section 0).

## 2. KIỂM TOÁN ON-PAGE

Đi thẳng vào lỗi và cách sửa cho từng mục. Nếu đạt, ghi "Đạt". Không giải thích lý thuyết.

- **URL**: {Đạt | Lỗi cụ thể → cách sửa}
- **Title (≤ 60 ký tự, keyword đầu)**: {Đạt | Lỗi: vd "thiếu keyword chính ở 30 ký tự đầu" → sửa thành "X — Y — Z"}
- **Meta Description (≤ 135 ký tự 2026)**: {Đạt | Lỗi cụ thể → cách sửa}
- **Search Intent**: {khớp 100% | lệch ở chỗ nào, vd: intent C nhưng bài viết theo hướng I, cần thêm CTA + bảng giá}
- **H1 (chỉ 1)**: {Đạt | Lỗi}
- **H2 hierarchy**: {Đạt | Lỗi}

## 3. E-E-A-T & INFORMATION GAIN

- **Information Gain**: Bài có dữ liệu độc quyền / case study / giải pháp mới so với Top 3 Google không? (Có/Không — Liệt kê chi tiết nếu có, chỉ ra điểm "xào nấu" nếu không).
- **Experience (chữ E đầu — vũ khí 2026)**: tác giả có trải nghiệm thực không? Có "Khi tôi thử...", "Thực tế tại VN...", ảnh gốc, screenshot annotated không?
- **Expertise**: dùng thuật ngữ đúng, cite nguồn uy tín không?
- **Authoritativeness**: có Author byline + ProfilePage schema + sameAs LinkedIn không?
- **Trust**: có số liệu nguồn rõ ràng, không phóng đại không?
- **Proof of Experience (2026 — bắt buộc ≥ 2/4)**: Ảnh gốc / Screenshot annotated / Video quá trình / Quote trực tiếp.

## 4. TỐI ƯU SEMANTIC SEO & SGE

- **Mật độ từ khóa**: {có nhồi nhét keyword chính không? đếm số lần xuất hiện / tổng từ}.
- **5 LSI/Entities buộc phải bổ sung**: 1. ... 2. ... 3. ... 4. ... 5. ...
- **Format cho AI Overviews**:
  - Definition (đoạn 40-60 từ đầu định nghĩa target keyword): {Có | Không}
  - List (ordered/unordered cho how-to/steps): {Có | Không}
  - Table (cho comparison/spec): {Có | Không}
  - FAQ schema: {Có | Không}
- **Summary Chunk (40-60 chữ ngay sau H1)**: {Có | Không — nếu không, viết draft 40-60 từ cho user}

## 5. LỌC VĂN PHONG AI & SỰ DÀI DÒNG

Trích **nguyên văn** tối đa 3 câu/đoạn AI sáo rỗng cần xóa bỏ. Mỗi câu trích → 1 dòng giải thích lý do + đề xuất viết lại.

1. > "{trích nguyên văn câu/đoạn 1}"
   - **Lỗi**: {vd "dùng 'toàn diện' + 'hành trình', đệm trống"}.
   - **Sửa**: "{đề xuất viết lại bằng giọng người thật}"

2. > "{trích nguyên văn câu/đoạn 2}"
   - **Lỗi**: ...
   - **Sửa**: "..."

3. > "{trích nguyên văn câu/đoạn 3}"
   - **Lỗi**: ...
   - **Sửa**: "..."

Nếu bài KHÔNG có câu AI sáo rỗng → ghi đúng 1 dòng: "Không phát hiện câu AI sáo rỗng. Văn phong đạt."

## 5.5. DUPLICATE DETECTION (chỉ hiện nếu có project + keywords-urls.md)

Nếu không có project hoặc file `keywords-urls.md` không tồn tại → bỏ section này và ghi 1 dòng: "Skip Duplicate Detection — không có project context hoặc keywords-urls.md."

Nếu có, chạy 4 check theo Phase 3 (xem 6.1) và in kết quả:

- **Trùng URL**: {None | 🔴 Hard duplicate — row #N: keyword=`...`, URL=`...`}
- **Trùng Keyword chính**: {None | 🔴 Keyword duplicate — row #N: keyword=`...`, URL khác=`...` → keyword cannibalization}
- **Trùng Tiêu đề ≥ 60%**: {None | 🟠 Soft duplicate — row #N: tiêu đề=`...`, similarity={x.xx}, URL khác=`...`}
- **Cùng Cluster + Intent**: {None | 🟠 Overlap — liệt kê: row #N (`keyword 1`, URL 1), row #M (`keyword 2`, URL 2). Cân nhắc merge hoặc phân hoá sub-intent.}

**Ảnh hưởng đến Verdict** (Section 0):
- Có ≥ 1 🔴 hard duplicate → Verdict tự động = 🔴 **XÓA / 301** (override điểm số).
- Chỉ có 🟠 soft → Verdict vẫn tính theo điểm, nhưng add warn vào lý do.
- Không có gì → Verdict hoàn toàn theo điểm số.

## 5.6. EXTERNAL CITATION CHECK (v1.2 — chỉ hiện nếu có project + `external-sources.md`)

Nếu không có project hoặc file `external-sources.md` không tồn tại → bỏ section này và ghi 1 dòng: "Skip External Citation Check — không có project context hoặc external-sources.md."

Nếu có, chạy theo Phase 3.5 (xem 9 dưới):

**Cách chạy**: Enumerate **tất cả external link** trong bài input (link out trỏ ra ngoài domain hiện tại). Với mỗi link, đối chiếu với whitelist `external-sources.md`:
- ✅ Domain match một row trong whitelist (Tier 1/2/3) → OK
- ⚠️ Domain KHÔNG match nhưng có comment `<!-- ad-hoc cite -->` ngay sau link → OK (cảnh báo nhẹ, ghi nhận)
- 🔴 Domain KHÔNG match và KHÔNG có ad-hoc comment → **Violation** (cite ngoài whitelist)

**Output format**:

- **Số external link** trong bài: {N}
- **OK (trong whitelist)**: {X} link
  - {liệt kê URL + Tier tương ứng}
- **Ad-hoc** (có `<!-- ad-hoc cite -->` comment): {Y} link
  - {liệt kê URL + lý do}
- **🔴 Violation** (ngoài whitelist, không có ad-hoc): {Z} link
  - {liệt kê URL + đề xuất thay thế từ whitelist nếu có, hoặc đề xuất xóa cite}
- **Khuyến nghị thêm cite**: {nếu bài có phần data/tiêu chuẩn chưa cite → đề xuất 1-2 nguồn Tier 1 phù hợp từ whitelist}

**Ảnh hưởng đến điểm Trust (trục E-E-A-T, Section 3)**:
- 0 violation → giữ điểm Trust nguyên.
- 1-2 violation → trừ 1đ (raw) khỏi điểm Trust.
- ≥ 3 violation HOẶC tỉ lệ violation > 50% tổng external link → trừ 2đ (raw) khỏi điểm Trust + add note "Vi phạm whitelist nhiều, EEAT Trust kém".
- Bài có data/tiêu chuẩn nhưng 0 external cite + project có whitelist Tier 1 sẵn → trừ 1đ khỏi điểm Trust + đề xuất bổ sung.

**Ảnh hưởng đến Verdict** (Section 0):
- Violation KHÔNG override Verdict (chỉ ảnh hưởng điểm). Nhưng nếu sau khi trừ điểm Trust tổng điểm rớt từ band cao xuống band thấp → Verdict tự cập nhật theo điểm mới.
- Section 6 Action Plan add P1 item: "Xóa/thay {N} external link ngoài whitelist" nếu có violation.

## 6. CHECKLIST SỬA ĐỔI (Action Plan)

Danh sách gạch đầu dòng các hành động sửa đổi cụ thể. Cầm tay chỉ việc. **Gắn với Verdict Section 0**: P1/P2/P3 chỉ cần thiết khi Verdict = 🟡 CẬP NHẬT hoặc 🟠 LÀM MỚI. Nếu Verdict = 🟢 GIỮ NGUYÊN → ghi "Không có action bắt buộc. Re-audit sau 6 tháng." Nếu Verdict = 🔴 XÓA / 301 → ghi "301 redirect sang {URL đích từ keywords-urls.md} HOẶC xóa (nếu không có URL đích phù hợp)."

**Priority 1 — BẮT BUỘC sửa trước khi publish/republish** (≤ 24h):
- [ ] {Action 1: vd "Cắt đoạn từ dòng 45-67 — duplicate với H2 'Quy cách'"}
- [ ] {Action 2: vd "Thêm bảng so sánh JIS vs TCVN vào sau H2 'Tiêu chuẩn'"}
- [ ] {Action 3: vd "Đổi Title từ '...toàn diện...' sang 'Thép U VinaOne — Bảng giá, quy cách JIS, mác SS400'"}

**Priority 2 — Sửa trong 48h** (sau khi P1 done):
- [ ] {Action 4: vd "Thêm Author byline + ProfilePage schema cho tác giả"}
- [ ] {Action 5: vd "Bổ sung 5 LSI: thép U mạ kẽm, dung sai VNO, mác CT38..."}

**Priority 3 — Cải thiện dài hạn** (≤ 7 ngày):
- [ ] {Action 6: vd "Quay 1 video short-form quá trình kiểm CO/CQ + nhúng vào bài"}
- [ ] {Action 7: vd "Thêm 3 ảnh gốc chụp tại kho, có annotation độ dày + dung sai"}

## 8. SUGGESTED NEXT SKILL

Sau khi sửa theo Action Plan, dùng skill nào:

| Action Plan item | Skill để fix |
|------------------|--------------|
| Sửa câu AI sáo rỗng (Phần 5) + giọng văn | `skills/content/Content Writing/SKILL.md` Phase 5 + `skills/style-mimicker/SKILL.md` |
| Cắt/gộp đoạn + thêm H2 + bổ sung LSI | `skills/content/Content Refresh/SKILL.md` |
| Thêm schema + Author byline + ProfilePage | `skills/technical/Schema Markup/SKILL.md` |
| Thêm Information Gain (case study, data riêng) | `skills/content/Content Writing/SKILL.md` Phase 0 + Phase 3 |
| Cải thiện format AIO (Definition/List/Table) | `skills/ai-seo/Content Optimization/SKILL.md` |
| Tối ưu Title + Meta | `skills/on-page/Title/SKILL.md` + `skills/on-page/Descriptions/SKILL.md` |
| Bổ sung Internal link | `skills/on-page/Internal Linking/SKILL.md` (đọc `keywords-urls.md` của dự án) |

```

### 7.2. Output path bắt buộc (2026 — folder-scoped)

Báo cáo audit lưu vào subfolder `audit/`:

```
projects/{project}/audit/evaluation-{slug-bai}-{yyyy-mm-dd}.md
```

Tên file PHẢI có prefix `evaluation-` để phân biệt với:
- `audit-{yyyy-mm-dd}.md` (Topical Audit cluster-level)
- `audit-{cluster}-{yyyy-mm-dd}.md` (Topical Audit từng cluster)

Ví dụ:
- ✅ `projects/thep-bao-tin/audit/evaluation-thep-u-vinaone-2026-05-27.md`
- ✅ `projects/thep-bao-tin/audit/evaluation-ong-thep-duc-phi-127-2026-05-27.md`
- ❌ `projects/thep-bao-tin/evaluation-thep-u.md` (sai — phải vào `audit/`)
- ❌ `projects/thep-bao-tin/audit/audit-thep-u-2026-05-27.md` (sai — không có prefix `evaluation-`, dễ lẫn với Topical Audit)

Nếu audit bài **không thuộc dự án nào** → output ngay trong message reply (không tạo file). User tự quyết có save không.

## 8. Quy tắc hành xử (BẮT BUỘC tuân thủ khi chạy skill này)

> Đây là 4 rule TỐI THƯỢNG. Vi phạm = audit fail.

1. **Không dài dòng**: KHÔNG chào hỏi, KHÔNG "dạ vâng", KHÔNG mở bài giải thích. Trả lời ngay vào báo cáo 6 phần.
2. **Chính xác & Thực tế**: KHÔNG bịa đặt. Nếu thông số đầu vào thiếu dữ liệu quan trọng → output ĐÚNG: `"Tôi không đủ dữ liệu. Thiếu trường: [...]."` và dừng.
3. **Phạm vi nghiêm ngặt**: CHỈ trả lời theo cấu trúc Section 0 + 6 phần (+ 5.5 nếu có project) ở mục 7.1. Tuyệt đối KHÔNG mở rộng, KHÔNG lời khuyên suông, KHÔNG hứa hẹn thiếu bằng chứng.
4. **Văn phong**: 100% con người thực chiến. Chuyên nghiệp, rành mạch, dứt khoát, không hàn lâm. Tránh tuyệt đối câu văn AI sáo rỗng / bay bổng / tính từ cảm xúc. Đi thẳng vào trọng tâm kỹ thuật.

## 9. Workflow chi tiết — 7 Phase (v1.1)

### Phase 1: Parse Input
- Đọc 7 trường thông số đầu vào (từ inline hoặc file template).
- Validate đủ trường tối thiểu (5/7 BẮT BUỘC).
- Nếu thiếu → output validation error + STOP.

### Phase 2: Load Project Context (nếu có dự án)
- Đọc `memory.md` → biết Active Context + Key Decisions.
- Đọc `profile.md` → Brand voice + Author Entity.
- Đọc `keywords-urls.md` (schema 7 cột v1.1: `#`, `Keyword`, `Tiêu đề`, `URL`, `Cluster`, `Vai trò`, `Intent`) → cache toàn bộ row vào in-memory list để Phase 3 dùng.
- **(v1.2) Đọc `external-sources.md`** nếu tồn tại → cache Tier 1/2/3 domain list để Phase 3.5 dùng. Nếu file không tồn tại → skip Phase 3.5 + ghi 1 dòng note trong report ("Project chưa có external-sources.md whitelist").
- Nếu file `keywords-urls.md` không tồn tại → skip Phase 3 + ghi warn trong report.

### Phase 3: Duplicate Detection (mới từ v1.1, chỉ chạy khi có project + keywords-urls.md)

Run 4 check (chi tiết ở mục 6.1):
1. Match URL → 🔴 Hard duplicate
2. Match Keyword chính (case-insensitive) → 🔴 Keyword duplicate (cannibalization)
3. Jaccard similarity Tiêu đề ≥ 0.60 (loại stopwords tiếng Việt) → 🟠 Soft duplicate
4. Cùng Cluster + Intent + URL khác → 🟠 Overlap

Output vào Section 5.5 báo cáo.

**Override**: Nếu có ≥ 1 🔴 → force Verdict = 🔴 XÓA / 301 (override Phase 6 verdict resolution).

### Phase 3.5: External Citation Check (mới từ v1.2, chỉ chạy khi có project + `external-sources.md`)

Run check whitelist (chi tiết ở Section 5.6):

1. **Extract** tất cả external link trong bài input bằng regex markdown `\[([^\]]+)\]\(([^)]+)\)` + HTML `<a\s+href="([^"]+)"`. Filter chỉ link out (KHÔNG cùng domain với `[URL DỰ KIẾN]` input — sau khi normalize www/https).
2. **Normalize domain**: lấy hostname (bỏ www, lowercase, bỏ trailing slash, không phân biệt path).
3. **Match** với whitelist:
   - For mỗi external link → check domain có nằm trong cột "Domain" của bất kỳ row Tier 1/2/3.
   - Match = domain `endsWith` whitelist entry HOẶC equal (vd whitelist `worldsteel.org` match cả `https://worldsteel.org/case-studies/...`).
   - Nếu link có comment `<!-- ad-hoc cite -->` ngay sau (trong 1-2 dòng kề) → đánh dấu Ad-hoc.
4. **Phân loại** 3 nhóm: OK / Ad-hoc / Violation.
5. **Tính điểm trừ Trust** theo rule Section 5.6.
6. **Output** vào Section 5.6 báo cáo.

**Không override Verdict**, chỉ ảnh hưởng điểm Trust. Nhưng điểm giảm có thể đẩy Verdict xuống band thấp hơn ở Phase 6.

Edge case:
- Bài 0 external link + project có whitelist Tier 1 + bài có data/tiêu chuẩn → trừ 1đ Trust + ghi note khuyến nghị bổ sung cite Tier 1.
- `external-sources.md` tồn tại nhưng trống (0 row hoặc chỉ skeleton) → ghi note "whitelist trống, skip violation check, không trừ điểm" — vẫn cảnh báo user fill.

### Phase 4: Chấm 5 trục (10đ mỗi trục)

**Trục 1 — Search Intent (10đ)**:
- Khớp dominant intent SERP cho keyword chính?
- Format phù hợp intent (I→listicle/guide, C→comparison/buyers guide, T→landing page, N→brand page)?
- 100 từ đầu trả lời direct câu hỏi user?

**Trục 2 — On-page (10đ)**:
- URL: short, lowercase, hyphen, có keyword chính?
- Title: ≤ 60 ký tự, keyword 30 ký tự đầu, có CTR-driven element (số, năm, brand)?
- Meta description: ≤ 135 ký tự (chuẩn 2026), có value-prop + CTA?
- H1 duy nhất + H2 hierarchy logic?

**Trục 3 — Semantic SEO (10đ)**:
- Có nhồi nhét keyword chính (density > 3%)?
- Mention ≥ 70% entity/LSI trong top 10 SERP?
- Cite entity bằng full name lần đầu + abbreviation/pronoun có context?

**Trục 4 — E-E-A-T & Information Gain (10đ)** — quan trọng nhất:
- Experience: có "khi tôi thử...", ảnh gốc, video quá trình, screenshot annotated (≥ 2/4)?
- Expertise: dùng thuật ngữ đúng + cite nguồn uy tín?
- Authoritativeness: Author byline + ProfilePage schema + sameAs?
- Trust: số liệu có nguồn, không phóng đại?
- **(v1.2) External Citation compliance**: Tất cả external link trong bài có nằm trong `external-sources.md` whitelist? Trừ điểm Trust theo rule Section 5.6 (1-2 violation → -1đ; ≥3 violation → -2đ).
- Information Gain: có case study / data riêng / framework mới vs Top 3 SERP?

**Trục 5 — AIO-readiness/SGE (10đ)**:
- Summary Chunk 40-60 chữ ngay sau H1?
- Định nghĩa target keyword 100 từ đầu (cite-able)?
- Format Definition / List / Table cho AI pull?
- FAQ schema cho Q&A block?
- Entity reinforcement (Person, Organization, Article + mentions)?

### Phase 5: Kiểm toán văn phong (anti-AI)

Quét bài tìm 14 red flags theo `knowledge/15-anti-ai-content-rules.md`:
1. Từ cấm core (Đột phá, Cách mạng hóa, Toàn diện, Đa dạng, Vượt trội...).
2. Mẫu câu cấm ("Trong thế giới số ngày nay...", "Không thể phủ nhận...", "Tóm lại,...").
3. Em dash (—) dùng nhiều lần.
4. Đoạn văn đều đặn cùng độ dài.
5. Quá hoàn hảo, không có nuance.

Trích **NGUYÊN VĂN** tối đa 3 câu/đoạn AI sáo rỗng — không paraphrase, không bình luận chung.

### Phase 6: Verdict Resolution + Action Plan

**B6.1. Verdict 4 trạng thái** (chuẩn hóa 100đ = raw × 2):

| Verdict | Điều kiện | Action default |
|---------|-----------|----------------|
| 🟢 **GIỮ NGUYÊN** | Chuẩn hóa ≥ 80/100 (raw ≥ 40/50) + KHÔNG có 🔴 duplicate | Không action. Re-audit sau 6 tháng. |
| 🟡 **CẬP NHẬT** (Refresh) | 60-79/100 (raw 30-39/50) + KHÔNG có 🔴 duplicate | Route sang `Content Refresh` (light/medium). Action P1+P2 chỉ ra mục cần cập nhật (data 2026, Author Entity, LSI). |
| 🟠 **LÀM MỚI** (Rewrite) | 40-59/100 (raw 20-29/50) + KHÔNG có 🔴 duplicate | Route sang `Content Writing` Phase 0 (rewrite từ đầu). Action P1 liệt kê vấn đề gốc cần sửa khi viết lại. |
| 🔴 **XÓA / 301** | < 40/100 (raw < 20/50) HOẶC có ≥ 1 🔴 hard duplicate (override điểm) | 301 redirect sang URL đích từ `keywords-urls.md` HOẶC xóa (nếu không có URL đích phù hợp). |

**B6.2. Action Plan** (chỉ viết khi Verdict = 🟡 hoặc 🟠):

Priority 1 (≤ 24h): 3-5 action BẮT BUỘC sửa trước publish.
Priority 2 (≤ 48h): 2-3 action sửa sau P1.
Priority 3 (≤ 7 ngày): 2-3 action cải thiện dài hạn.

Mỗi action phải có:
- **Đối tượng cụ thể**: dòng nào, H2 nào, thẻ nào.
- **Hành động cụ thể**: cắt, thêm, đổi, gộp, viết lại.
- **Kết quả mong đợi**: sau khi sửa thì sao.

KHÔNG ghi action mơ hồ kiểu "tối ưu lại bài", "cải thiện EEAT", "viết hấp dẫn hơn".

### Phase 7: Output + Session End
- Tạo file `audit/evaluation-{slug}-{date}.md` (nếu có dự án) HOẶC reply inline (nếu không có dự án).
- Nếu có dự án → append entry vào `memory.md` Session History theo Session End Protocol (`skills/project-memory/SKILL.md`).
- Nếu Verdict = 🔴 XÓA → cập nhật `keywords-urls.md`: comment row đó `<!-- DELETED YYYY-MM-DD: 301 → {URL đích} -->`.

## 10. Liên kết skill khác

Sau khi user nhận report audit, các skill liên quan để fix:

- **Sửa văn phong AI**: `skills/content/Content Writing/SKILL.md` Phase 5 (Voice Polish) + `skills/style-mimicker/SKILL.md`
- **Refresh bài cũ theo Action Plan**: `skills/content/Content Refresh/SKILL.md`
- **Bổ sung schema + Author byline**: `skills/technical/Schema Markup/SKILL.md`
- **Tối ưu Title/Meta**: `skills/on-page/Title/SKILL.md` + `skills/on-page/Descriptions/SKILL.md`
- **Tối ưu Internal link**: `skills/on-page/Internal Linking/SKILL.md`
- **Tối ưu AIO/SGE**: `skills/ai-seo/Content Optimization/SKILL.md`
- **Audit cả cluster sau khi audit nhiều bài**: `skills/content/Topical Audit/SKILL.md`

## 11. Anti-patterns (đừng làm)

- ❌ Audit bài bằng cách paraphrase nội dung bài đó.
- ❌ Đưa lời khuyên chung chung kiểu "nên tối ưu EEAT", "cần cải thiện văn phong".
- ❌ Tự đoán thông số đầu vào khi user không cung cấp.
- ❌ Output dạng bullet point dài 200 dòng — tuân thủ ĐÚNG cấu trúc 7.1 (Section 0 + 6 phần + 5.5 nếu có project).
- ❌ Cho điểm cao (8-10) cho bài thiếu Information Gain hoặc thiếu Experience.
- ❌ Audit theo "cảm tính" — mỗi điểm phải có evidence từ bài.
- ❌ Route nhầm sang `Topical Audit` khi user chỉ audit 1 bài.
- ❌ **(v1.1)** Bỏ qua Duplicate Detection khi có project + keywords-urls.md → BẮT BUỘC chạy 4 check.
- ❌ **(v1.1)** Ra Verdict 🟢/🟡/🟠 khi có 🔴 hard duplicate → BẮT BUỘC override sang 🔴 XÓA / 301.
- ❌ **(v1.1)** Tự đoán Tiêu đề trong keywords-urls.md khi cột giá trị là `—` → skip check #3 cho row đó, ghi note trong report.
- ❌ **(v1.2)** Bỏ qua External Citation Check khi có project + `external-sources.md` → BẮT BUỘC chạy Phase 3.5.
- ❌ **(v1.2)** Tự thêm domain mới vào `external-sources.md` mà KHÔNG có sự đồng ý của user. Skill chỉ **đề xuất** (Section 5.6 + Session End note), KHÔNG được tự append.
- ❌ **(v1.2)** Gán "violation" cho link cùng domain với URL bài audit (đó là internal link, không phải external). Phase 3.5 BẮT BUỘC filter chỉ external link out.

## 12. Session End — Update Memory (nếu audit bài thuộc dự án)

Sau khi xuất file audit, BẮT BUỘC chạy Session End Protocol (`skills/project-memory/SKILL.md` mục 4.3) — 7 điểm:

1. Append entry vào `memory.md` Session History: ngày + task "Audit bài {slug}" + file output `audit/evaluation-{slug}-{date}.md` + verdict tổng (vd `28/50`).
2. Append `Recent Articles` nếu bài audit là bài mới publish.
3. Cập nhật `Active Context` nếu chuyển focus.
4. Append `Pending Tasks` các action Priority 1+2 từ Action Plan (để phiên sau theo dõi).
5. Append `Key Decisions` nếu audit chốt decision lớn (vd "Quyết định không publish bài X vì Information Gain = 0").
6. Cập nhật `Quick Facts → last_audit_date` (nếu memory template có trường này).
7. Commit `memory.md` cùng commit với file audit.

**(v1.1) Cập nhật `keywords-urls.md`** (nếu áp dụng):

- Nếu bài audit là bài **vừa publish/draft mới** (chưa có entry trong file) → append row 7 cột: `| # | Keyword | Tiêu đề | URL | Cluster | Vai trò | Intent |`. Lấy giá trị từ input audit. Vai trò mặc định `supporting` (sửa thủ công nếu là `pillar`).
- Nếu Verdict = 🔴 **XÓA / 301** → comment row tương ứng: `<!-- DELETED YYYY-MM-DD: 301 → {URL đích} -->`. Không xóa row khỏi file (giữ lịch sử).
- Nếu Verdict = 🟠 **LÀM MỚI** với URL giữ nguyên → không sửa row, chỉ log trong Session History.
- Nếu Verdict = 🟡 **CẬP NHẬT** → không sửa row.

**(v1.2) Đề xuất cập nhật `external-sources.md`** (nếu áp dụng):

- Nếu Phase 3.5 phát hiện **violation** (link ngoài whitelist) → AI **đề xuất** trong Session History và Pending Tasks: "Review {N} URL ngoài whitelist: {liệt kê}. User quyết định: (a) thêm vào whitelist nếu đáng tin, (b) xóa cite khỏi bài, (c) thay bằng link Tier 1 từ whitelist."
- AI **KHÔNG TỰ APPEND** vào `external-sources.md`. User phải tự thêm thủ công.
- Nếu bài có data/tiêu chuẩn nhưng 0 external cite → suggest: "Bài thiếu cite Tier 1 cho phần {section}. Thêm cite từ whitelist sẽ tăng EEAT Trust."
