# External Sources — Thép Bảo Tín

> **Whitelist nguồn ngoài** mà AI được phép cite trong bài viết của dự án `thep-bao-tin`.
>
> **🛑 Nguyên tắc tối thượng v1.3** (2026-05-27):
> 1. **Domain** = whitelist (trust signal). AI chỉ cite từ domain có trong file này.
> 2. **`sample_urls` = PROOFS, KHÔNG phải URL để chèn vào bài**. Đây chỉ là ví dụ chứng minh domain có content. AI **TUYỆT ĐỐI KHÔNG paste sample_urls verbatim** vào bài.
> 3. **Khi cần cite tiêu chuẩn / topic cụ thể** (vd "ASTM A53", "TCVN 1651:2018") → AI BẮT BUỘC **web search `site:{domain} "{topic}"`** để tìm URL specific. KHÔNG bịa, KHÔNG paste sample.
> 4. Nếu search không ra → fallback: (a) plain text không link, (b) link domain root + anchor topic, (c) `<!-- TODO: verify -->`.
>
> **Lĩnh vực dự án**: Thép xây dựng — tiêu chuẩn, mác thép, vật liệu, ứng dụng.
>
> **Schema version**: v1.3 (2026-05-27) — Domain Whitelist + Specific-Page Discovery Protocol.
> **Last updated**: 2026-05-27 (upgrade từ v1.0 — annotate sample_urls + citation_rule).

---

## Tier 1 — Cơ quan chính thức / Tiêu chuẩn (ưu tiên cao nhất)

> Bộ ngành Việt Nam, tổ chức tiêu chuẩn hóa quốc tế, văn bản pháp quy. **Cite cho mã tiêu chuẩn, mác thép, giới hạn kỹ thuật.**

```yaml
- name: ASTM International — Steel Standards
  domain: astm.org
  tier: 1
  ngon_ngu: en
  linh_vuc: Tiêu chuẩn thép Mỹ (cơ lý, hóa học, luyện kim)
  sample_urls:                                  # ← PROOFS — KHÔNG paste vào bài
    - https://www.astm.org/products-services/standards-and-publications/standards/steel-standards.html
    - http://regional.astm.org/industry/metals
  citation_rule: |
    Khi cần cite spec ASTM cụ thể (vd "ASTM A53", "ASTM A106", "ASTM A572 Grade 50"):
    1. Web search: site:astm.org "{spec_code}" (vd site:astm.org "A53")
    2. URL specific thường có format: https://www.astm.org/Standards/{CODE}.htm hoặc /standards/{code}
    3. Cite URL specific tìm được với anchor "[ASTM {CODE} — {tên spec}]"
    4. Nếu search không ra URL specific cho spec đó → fallback:
       (a) Plain text: "theo tiêu chuẩn ASTM {CODE}" (KHÔNG link)
       (b) Link domain root: [ASTM (xem astm.org)](https://www.astm.org) + anchor có spec code
       (c) Comment: <!-- TODO: verify specific URL for ASTM {CODE} on astm.org -->
    TUYỆT ĐỐI KHÔNG paste sample_urls (steel-standards landing page) làm cite cho spec cụ thể.
  ghi_chu: Mỗi spec (A36, A53, A106, A572, A992...) phải có URL specific riêng. Cùng 1 URL cho ≥ 2 spec = URL inflation.

- name: ISO — International Organization for Standardization
  domain: iso.org
  tier: 1
  ngon_ngu: en
  linh_vuc: Tiêu chuẩn ISO về thép cán/đúc/ống chịu áp + luyện kim
  sample_urls:                                  # ← PROOFS — KHÔNG paste vào bài
    - https://www.iso.org/committee/46232.html
    - https://www.iso.org/ics/77.html
    - https://www.iso.org/obp/ui/en/
  citation_rule: |
    Khi cần cite tiêu chuẩn ISO cụ thể (vd "ISO 17607-3:2023", "ISO 1461:2022"):
    1. Web search: site:iso.org "{ISO number}" hoặc site:iso.org "ISO {number}:{year}"
    2. URL specific thường có format: https://www.iso.org/standard/{XXXXX}.html hoặc /obp/ui/en/#iso:std:iso:{number}:ed-X:v1:en
    3. Cite URL specific với anchor "[ISO {number}:{year} — {tên tiêu chuẩn}]"
    4. Khi cite category (vd "ICS 77.140.50 Flat steel products") → dùng URL `/ics/77.html` là OK (đây là URL category gốc, không phải sample paste)
    5. Không tìm thấy URL specific → fallback (a)(b)(c) như ASTM.
  ghi_chu: ISO có format URL ổn định /standard/{ID}.html cho từng tiêu chuẩn. Cite category khác cite tiêu chuẩn cụ thể.

- name: Hiệp hội Thép Việt Nam (VSA)
  domain: vsa.com.vn
  tier: 1
  ngon_ngu: vi
  linh_vuc: Tin ngành thép VN, báo cáo, thống kê, hội thảo
  sample_urls:
    - https://vsa.com.vn
  citation_rule: |
    Khi cần cite số liệu tiêu thụ thép VN / brand chính:
    1. Web search: site:vsa.com.vn "{topic}" "{year}" (vd site:vsa.com.vn "tiêu thụ thép" "2025")
    2. Cite URL bài báo cáo/tin tức cụ thể, KHÔNG cite homepage
    3. Anchor có năm: "Theo [báo cáo VSA Q3/2025](URL_specific)..."
    4. Không tìm thấy → plain text: "theo Hiệp hội Thép Việt Nam (VSA)"
  ghi_chu: Số liệu VSA có thời điểm rõ ràng — phải cite năm/quý.

- name: Thư viện Pháp luật Việt Nam
  domain: thuvienphapluat.vn
  tier: 1
  ngon_ngu: vi
  linh_vuc: Văn bản pháp quy VN (TCVN, QCVN, thông tư về thép xây dựng)
  sample_urls:
    - https://thuvienphapluat.vn
  citation_rule: |
    Khi cần cite tiêu chuẩn Việt Nam cụ thể (vd "TCVN 1651:2018", "TCVN 6285:2008", "QCVN 7:2011"):
    1. Web search: site:thuvienphapluat.vn "{số hiệu}" "{tên ngắn}"
    2. URL specific dạng: https://thuvienphapluat.vn/TCVN/Xay-dung/TCVN-{số}-{năm}-{slug}.aspx
    3. Cite URL specific với anchor "[TCVN {số}:{năm}](URL_specific) quy định..."
    4. Không tìm thấy → fallback (a) plain text: "theo TCVN {số}:{năm}"
  ghi_chu: TCVN có URL stable theo số hiệu. KHÔNG paste homepage thuvienphapluat.vn làm cite cho TCVN cụ thể.

- name: METI Japan — Iron & Steel Standards
  domain: meti.go.jp
  tier: 1
  ngon_ngu: en | ja
  linh_vuc: Danh sách JIS sắt thép mới ban hành/sửa đổi
  sample_urls:
    - https://www.meti.go.jp/english/policy/economy/industrial_standard/index.html
  citation_rule: |
    Khi cần cite JIS spec cụ thể (vd "JIS G3101 SS400", "JIS G3192"):
    1. Web search: site:meti.go.jp "{JIS code}" hoặc Google "JIS {code}" inurl:meti.go.jp
    2. Cite URL specific với anchor "[JIS {code} — {tên spec}]"
    3. Không tìm thấy trên meti.go.jp → fallback search site:jisc.go.jp (JISC đã được include nếu user thêm)
    4. Cuối cùng → fallback (a) plain text: "tiêu chuẩn JIS {code}"
  ghi_chu: METI publish update list, JISC publish full spec. Cite từng spec từ source phù hợp.

- name: JICA — Open Report
  domain: openjicareport.jica.go.jp
  tier: 1
  ngon_ngu: en
  linh_vuc: Báo cáo open access của JICA (vd bảng tương quan JIS — TCVN)
  sample_urls:
    - https://openjicareport.jica.go.jp/pdf/11599776_02.pdf
  citation_rule: |
    Khi cite báo cáo JICA cụ thể (vd bảng tương quan SR-24, U-24):
    1. Web search: site:openjicareport.jica.go.jp "{topic}"
    2. Cite URL PDF specific (URL JICA report thường dạng /pdf/{ID}_{section}.pdf)
    3. Anchor: "[Báo cáo JICA — Bảng tương quan JIS-TCVN](URL_specific)"
    4. Không tìm thấy → plain text + tên báo cáo, KHÔNG paste sample_url.
  ghi_chu: JICA report PDF có ID stable. Cite riêng từng báo cáo.
```

---

## Tier 2 — Hiệp hội / Báo chí / Nghiên cứu uy tín

> Hiệp hội ngành thép quốc tế, viện nghiên cứu vật liệu. **Cite cho case study, báo cáo thị trường, phân tích kỹ thuật.**

```yaml
- name: World Steel Association (worldsteel)
  domain: worldsteel.org
  tier: 2
  ngon_ngu: en
  linh_vuc: Báo cáo ngành thép toàn cầu, thống kê sản xuất/tiêu thụ
  sample_urls:
    - https://worldsteel.org
    - https://worldsteel.org/case-studies/education-and-training/
  citation_rule: |
    Khi cite số liệu / báo cáo worldsteel cụ thể (vd "Short Range Outlook 2025", "Steel Statistical Yearbook 2024"):
    1. Web search: site:worldsteel.org "{report name}" "{year}"
    2. Cite URL specific với năm: "[worldsteel Short Range Outlook 2025](URL_specific)"
    3. Case study kỹ thuật: site:worldsteel.org "case study" "{topic}"
    4. Không tìm thấy → plain text: "theo báo cáo worldsteel {year}"
  ghi_chu: Báo cáo worldsteel có chu kỳ năm/quý. Phải cite version đúng năm.

- name: AISI — American Iron and Steel Institute
  domain: buildusingsteel.org
  tier: 2
  ngon_ngu: en
  linh_vuc: Bộ tiêu chuẩn thiết kế kết cấu thép (S100, S200, S300, S400 Series)
  sample_urls:
    - https://www.buildusingsteel.org/aisi-design-resources/design-standards/
  citation_rule: |
    Khi cite AISI design standard cụ thể (vd "AISI S100-22", "AISI S400"):
    1. Web search: site:buildusingsteel.org "{standard code}"
    2. Cite URL specific với anchor "[AISI S{XXX} — {năm}]"
    3. Không tìm thấy → fallback (a) plain text "tiêu chuẩn AISI S{XXX}"
  ghi_chu: AISI có catalogue stable. Mỗi tiêu chuẩn S-series cần URL riêng.

- name: AHSS Insights
  domain: ahssinsights.org
  tier: 2
  ngon_ngu: en
  linh_vuc: HSLA, AHSS, giới hạn bền kéo, cấu trúc đa pha, thép ô tô
  sample_urls:
    - https://ahssinsights.org/metallurgy/defining-steels/
  citation_rule: |
    Khi cite định nghĩa HSLA / AHSS / DP / TRIP / TWIP:
    1. Web search: site:ahssinsights.org "{steel type}"
    2. Cite URL specific cho từng loại thép, KHÔNG paste landing page chung
    3. Anchor có tên loại thép: "[Định nghĩa AHSS DP800](URL)"
  ghi_chu: Site có article chi tiết cho từng loại thép. Tránh paste landing page generic.

- name: ANSI Blog — Standards
  domain: blog.ansi.org
  tier: 2
  ngon_ngu: en
  linh_vuc: Phân tích tiêu chuẩn HSLA, ASTM, ANSI
  sample_urls:
    - https://blog.ansi.org/ansi/standard-high-strength-low-alloy-hsla-steel-astm/
  citation_rule: |
    Khi cite phân tích ANSI blog về tiêu chuẩn cụ thể (vd "ASTM A572 Grade 50 analysis"):
    1. Web search: site:blog.ansi.org "{topic}"
    2. Cite URL bài blog specific với anchor có topic
    3. Bài blog ANSI thường dài + phân tích deep — preferred cho cite explanation
  ghi_chu: ANSI blog phân tích từng tiêu chuẩn riêng. Search theo topic cụ thể.

- name: Service Steel — Steel Grades Reference
  domain: servicesteel.org
  tier: 2
  ngon_ngu: en
  linh_vuc: Bảng mác thép phổ biến theo ASTM (tham khảo nhanh)
  sample_urls:
    - https://www.servicesteel.org/resources/steel-grades
  citation_rule: |
    Service Steel chỉ là tham khảo nhanh, KHÔNG dùng làm tiêu chuẩn gốc:
    1. Khi cần bảng tra mác nhanh → cite URL specific cho loại thép đó
    2. Khi cần spec gốc → cite ASTM (Tier 1) song song
    3. Anchor rõ "[Bảng tra Service Steel](URL)" để phân biệt với spec gốc
  ghi_chu: Reference site only — luôn cite spec gốc song song khi viết tiêu chuẩn.

- name: TJIBC — Steel Technical Articles
  domain: tjibc.com
  tier: 2
  ngon_ngu: en
  linh_vuc: Bài phân tích chuyên sâu mác thép (vd EN 10025 S355)
  sample_urls:
    - https://tjibc.com/news/what-is-en-10025-s355-steel-properties-applications/
  citation_rule: |
    Khi cite phân tích chuyên sâu mác thép cụ thể (vd S355 JR/J0/J2/K2):
    1. Web search: site:tjibc.com "{steel grade}"
    2. Cite URL bài specific với anchor có tên mác thép
    3. Tier 2 — preferred cho phân tích sub-grade
  ghi_chu: Cite cho phân tích chi tiết, không dùng làm tiêu chuẩn pháp lý gốc.
```

---

## Tier 3 — Tham khảo bách khoa / Tài liệu nghiên cứu cá nhân

> Wikipedia (tổng quan khái niệm), tài liệu Scribd/Academia.edu của chuyên gia. **Cite cho định nghĩa khái niệm, KHÔNG dùng làm tiêu chuẩn pháp lý.**

```yaml
- name: Wikipedia (EN)
  domain: en.wikipedia.org
  tier: 3
  ngon_ngu: en
  linh_vuc: Tổng quan khái niệm mác thép (vd ý nghĩa ký hiệu, lịch sử)
  sample_urls:
    - https://en.wikipedia.org/wiki/Steel_grades
  citation_rule: |
    CHỈ dùng Wikipedia cho định nghĩa khái niệm, KHÔNG cite làm tiêu chuẩn:
    1. Khi cần định nghĩa concept (vd "Steel grades naming convention"):
       Web search: site:en.wikipedia.org "{concept}"
    2. Cite URL specific cho từng concept
    3. Đối với spec/tiêu chuẩn pháp lý → BẮT BUỘC dùng Tier 1 (ASTM/ISO/TCVN), KHÔNG Wikipedia
  ghi_chu: Tier 3 — chỉ định nghĩa khái niệm. Không thay thế cho tiêu chuẩn.

- name: Scribd — Steel Reference Documents
  domain: scribd.com
  tier: 3
  ngon_ngu: en
  linh_vuc: Tài liệu PDF tham khảo (vd S355 cross-standard properties)
  sample_urls:
    - (URL cụ thể Scribd S355 — user fill khi có)
  citation_rule: |
    Scribd là user-uploaded content — chỉ cite khi tài liệu là PDF của tổ chức uy tín:
    1. Verify tài liệu có publisher rõ ràng (vd ArcelorMittal datasheet)
    2. Khi có thể tìm bản gốc trên site publisher → ƯU TIÊN bản gốc, KHÔNG Scribd
    3. Anchor rõ "[Scribd — {tên tài liệu}](URL)" + ghi rõ publisher
  ghi_chu: Last-resort source. Ưu tiên publisher gốc nếu có.
```

---

## Bảng tổng quan (digest — tra cứu nhanh)

> Bảng dưới là digest của YAML block bên trên. **YAML là source of truth**. Khi xung đột → YAML chuẩn.

### Tier 1 (6 nguồn)
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | ASTM Steel Standards | astm.org | Tiêu chuẩn thép Mỹ | en |
| 2 | ISO | iso.org | Tiêu chuẩn quốc tế | en |
| 3 | Hiệp hội Thép VN (VSA) | vsa.com.vn | Số liệu ngành VN | vi |
| 4 | Thư viện Pháp luật VN | thuvienphapluat.vn | TCVN/QCVN | vi |
| 5 | METI Japan | meti.go.jp | JIS sắt thép | en/ja |
| 6 | JICA Open Report | openjicareport.jica.go.jp | Báo cáo JICA | en |

### Tier 2 (6 nguồn)
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | worldsteel | worldsteel.org | Báo cáo ngành toàn cầu | en |
| 2 | AISI | buildusingsteel.org | Tiêu chuẩn thiết kế kết cấu | en |
| 3 | AHSS Insights | ahssinsights.org | HSLA / AHSS phân tích | en |
| 4 | ANSI Blog | blog.ansi.org | Phân tích tiêu chuẩn | en |
| 5 | Service Steel | servicesteel.org | Bảng tra mác nhanh | en |
| 6 | TJIBC | tjibc.com | Phân tích sub-grade | en |

### Tier 3 (2 nguồn)
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | Wikipedia EN | en.wikipedia.org | Định nghĩa khái niệm | en |
| 2 | Scribd | scribd.com | PDF tham khảo | en |

---

## Quy tắc cite (AI BẮT BUỘC tuân thủ — v1.3)

### Per-citation workflow (BẮT BUỘC khi cite topic cụ thể)

```
Step 1: Identify topic cần cite (vd "ASTM A53", "TCVN 1651:2018", "Short Range Outlook 2025")
Step 2: Match domain trong whitelist Tier 1/2/3 phù hợp
Step 3: Web search: site:{domain} "{topic}"
Step 4a: ✅ Tìm thấy URL specific → cite URL đó + anchor có tên topic
Step 4b: ❌ Không tìm thấy → fallback:
   (a) Plain text: "tiêu chuẩn ASTM A53" (an toàn nhất)
   (b) Link domain root: [ASTM (xem astm.org)](https://www.astm.org) + anchor có topic
   (c) <!-- TODO: verify specific URL for ASTM A53 on astm.org -->
Step 5: TUYỆT ĐỐI KHÔNG paste sample_urls vào bài
Step 6: Log vào Session History (memory.md)
```

### Quy tắc chung

1. **CHỈ cite domain từ whitelist này**. Nguồn ngoài → AI **BỎ QUA**, **KHÔNG bịa link**.
2. **Anchor text** chứa tên topic cụ thể (vd spec code "ASTM A53") hoặc tên nguồn:
   - ✅ "Theo [TCVN 1651:2018](url_specific), thép cốt bê tông..."
   - ✅ "Báo cáo [worldsteel 2025](url_specific) cho thấy..."
   - ❌ "Xem [tại đây](url)"
   - ❌ "[ASTM](https://www.astm.org/products-services/standards-and-publications/standards/steel-standards.html)" ← sample URL, không match topic
3. **Số lượng**: 2-5 external link/bài. Bài pillar có thể 5-7. Spam (>10) → giảm trust signal.
4. **Ưu tiên Tier**:
   - **Tier 1** cho mác thép, tiêu chuẩn (TCVN/ASTM/JIS/ISO/EN), văn bản pháp quy.
   - **Tier 2** cho báo cáo thị trường (worldsteel, AISI), case study kỹ thuật.
   - **Tier 3** chỉ cho định nghĩa khái niệm chung (Wikipedia).
5. **Mỗi bài kỹ thuật** (về tiêu chuẩn, mác thép, ứng dụng) BẮT BUỘC có ít nhất 1 Tier 1 cite **URL specific** (không phải sample paste).
6. **Mỗi bài thương mại** (báo giá, so sánh sản phẩm) khuyến nghị 1 Tier 2 cite (số liệu thị trường).
7. **Format**: markdown `[anchor](URL)`. HTML: `<a href="URL" rel="noopener" target="_blank">anchor</a>`.

### Anti-pattern thường mắc (BẮT BUỘC tránh)

| ❌ Sai | ✅ Đúng |
|--------|--------|
| Cite ASTM A53 với URL `astm.org/products-services/standards-and-publications/standards/steel-standards.html` (sample paste) | Search `site:astm.org A53` → cite URL specific A53 |
| Cite cả A53, A106, A572 cùng 1 URL (URL inflation) | Mỗi spec 1 URL specific riêng |
| Cite TCVN 1651:2018 bằng URL homepage `thuvienphapluat.vn` | Search `site:thuvienphapluat.vn "TCVN 1651:2018"` → cite URL bài specific |
| Anchor "[ASTM Steel Standards](URL)" cho cite ASTM A53 | Anchor "[ASTM A53 — Standard Specification for Pipe](URL)" |

---

## Filter rules — User tự thêm nguồn mới

Trước khi thêm 1 nguồn mới vào file này, kiểm tra 4 tiêu chí:

1. **Domain**:
   - ✅ `.gov.vn`, `.gov`, `.edu`, `.org`, `.org.vn`
   - ✅ Hãng lớn: ASTM, ISO, JIS, EN, worldsteel, AISI, VSA, JICA, JFE, Nippon Steel, ArcelorMittal
   - ⚠️ `.com` chỉ accept khi là chuyên gia/tổ chức có credential (AHSS Insights, ANSI blog)
   - ❌ Blog bán thép nội dung mỏng, không có About page
2. **About page**: có thông tin tổ chức / chuyên gia thật, không anonymous
3. **Cộng đồng công nhận**: được cite trong tài liệu kỹ thuật khác, có backlink từ .edu/.gov
4. **Link tới nguồn gốc**: khi cite số liệu → có dẫn nguồn báo cáo gốc, không chỉ "theo nghiên cứu"

---

## Backward compatibility

- File này **không bắt buộc** với skill cũ. Nếu xóa → skill chạy như chưa có (skip whitelist check).
- File trống (0 nguồn) → skill cảnh báo "thep-bao-tin chưa fill whitelist" nhưng vẫn chạy.
- Schema v1.0 (legacy bảng URL đầy đủ) → skill v1.5+ vẫn parse được nhưng warn upgrade sang v1.3.

---

## Maintenance

- AI **KHÔNG tự thêm** entry mới. Chỉ user thêm thủ công.
- Sau phiên có cite ngoài whitelist → AI Session End suggest user review.
- Khi user fill domain mới → AI assist viết `citation_rule` cho source đó (nếu user yêu cầu).
- Review 6 tháng/lần (xóa link 404, thêm nguồn mới, cập nhật sample_urls).

## Pending — chờ user bổ sung

- Hiệp hội kết cấu thép Việt Nam (nếu có)
- Tạp chí Vietnam Engineering / KH-CN
- Trang chính thức của các hãng thép lớn (Hòa Phát, Pomina, Việt Đức) — nếu user muốn cite số liệu hãng
- Số hiệu cụ thể của các TCVN/QCVN liên quan thép (sample_urls bổ sung cho `thuvienphapluat.vn`)
- JISC (Japanese Industrial Standards Committee) — để cite JIS spec gốc song song với METI
