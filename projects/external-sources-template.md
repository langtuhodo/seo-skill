# External Sources — {Tên dự án}

> **Whitelist nguồn ngoài** mà AI được phép cite (làm external link / dẫn nguồn số liệu) trong bài viết của dự án này.
>
> **Nguyên tắc tối thượng v1.3** (2026-05-27):
> 1. **Domain = whitelist** (trust signal). Domain trong file này = nguồn được phép cite.
> 2. **sample_urls = PROOFS, KHÔNG phải URL để chèn vào bài**. Đây là ví dụ chứng minh domain có authority. AI **TUYỆT ĐỐI KHÔNG paste sample_urls verbatim** vào bài.
> 3. **Khi cần cite topic cụ thể** (vd "ASTM A53", "TCVN 1651:2018") → AI BẮT BUỘC **web search `site:{domain} "{topic}"`** để tìm URL specific. KHÔNG bịa, KHÔNG paste sample.
> 4. Nếu search không ra URL specific → fallback 1 trong 3: (a) plain text không link, (b) link domain root + anchor tả topic, (c) `<!-- TODO: verify URL for {topic} on {domain} -->`.
>
> **Schema version**: v1.3 (2026-05-27) — Domain Whitelist + Specific-Page Discovery Protocol.
>
> File này đọc bởi: `/audit` (Content Evaluation v1.5+), `Content Writing` v1.7+, `Content Refresh` v1.6+. Cập nhật thủ công bởi user (AI chỉ suggest, KHÔNG tự append).

---

## ⚠️ Đọc trước khi dùng file này — Schema v1.3 vs v1.0

| Aspect | v1.0 (2026-05-27) — DEPRECATED | v1.3 (2026-05-27) — HIỆN HÀNH |
|--------|--------------------------------|-------------------------------|
| URL trong file | Cột "Domain" chứa URL đầy đủ → AI paste vào bài | Cột `domain` chỉ host (vd `astm.org`), `sample_urls` là proofs |
| AI cite | Paste URL từ file → fabrication khi không match topic | Web search `site:{domain} "{topic}"` để tìm URL specific cho từng cite |
| Per-source rule | Generic (tier 1 cho data) | `citation_rule` riêng cho từng source (vd ASTM cite spec → search astm.org) |
| Audit (`/audit`) | Match domain → OK | Match `sample_urls` verbatim → flag "sample paste fabrication" |

**Migration**: File v1.0 vẫn chạy được với skill v1.5+ (backward compat), nhưng warn user upgrade sang v1.3 để có anti-fabrication protection.

---

## Tier 1 — Cơ quan chính thức / Tiêu chuẩn (ưu tiên cao nhất)

> Bộ ngành, hiệp hội cấp quốc gia, tổ chức tiêu chuẩn hóa, văn bản pháp quy. **Cite cho data, tiêu chuẩn, định nghĩa pháp lý.**

```yaml
- name: {Tên tổ chức}
  domain: {host.gov / host.org chính thức}       # ← WHITELIST level — chỉ host, KHÔNG path
  tier: 1
  ngon_ngu: vi | en
  linh_vuc: {chuyên ngành}
  sample_urls:                                    # ← PROOFS — chứng minh domain có content. KHÔNG paste vào bài.
    - {URL ví dụ 1 — minh hoạ domain authority}
    - {URL ví dụ 2 — minh hoạ}
  citation_rule: |
    Khi cần cite {loại nội dung} cụ thể (vd "{topic example}"):
    1. Web search: site:{domain} "{topic}"
    2. Dùng URL specific tìm được → cite URL đó
    3. Nếu không tìm thấy URL specific → fallback:
       (a) Plain text không link: "tiêu chuẩn {topic} (theo {Tên tổ chức})"
       (b) Link domain root: [{Tên tổ chức}](https://{domain}) + anchor mô tả topic
       (c) Comment: <!-- TODO: verify specific URL for {topic} on {domain} -->
    TUYỆT ĐỐI KHÔNG paste sample_urls vào bài.
  ghi_chu: {dùng khi nào}
```

---

## Tier 2 — Hiệp hội / Báo chí / Nghiên cứu uy tín

> Hiệp hội ngành quốc tế, báo chí chính thống, viện nghiên cứu, học viện. **Cite cho case study, báo cáo thị trường, phân tích chuyên sâu.**

```yaml
- name: {Tên hiệp hội / báo}
  domain: {host}
  tier: 2
  ngon_ngu: vi | en
  linh_vuc: {chuyên ngành}
  sample_urls:
    - {URL ví dụ — minh hoạ}
  citation_rule: |
    Khi cite số liệu / case study:
    1. Web search: site:{domain} "{topic + year nếu có}"
    2. Verify số liệu match với năm cite trong bài
    3. Nếu là báo cáo có DOI / version → cite version đầy đủ (vd "Statista 2025 Q3 — Steel Demand Report")
    4. Không tìm thấy → fallback (a)(b)(c) như Tier 1
  ghi_chu: {dùng khi nào}
```

---

## Tier 3 — Chuyên gia / Expert cá nhân

> Cá nhân có authority kiểm chứng được trong lĩnh vực (founder, lead researcher, certified expert). **Cite cho quote, phương pháp luận, framework đặc trưng.**

```yaml
- name: {Tên đầy đủ}
  domain: {host profile chính thức}
  tier: 3
  ngon_ngu: vi | en
  linh_vuc: {chuyên ngành}
  sample_urls:
    - {URL profile chính / blog cá nhân}
    - {URL bài viết / talk minh hoạ authority}
  citation_rule: |
    Khi cite quote / framework của chuyên gia:
    1. Web search: site:{domain} "{framework name | topic}"
    2. Hoặc Google: "{Tên expert}" "{quote/framework}" → tìm bài gốc
    3. Cite URL bài gốc + anchor có tên expert (vd [Brian Dean — Skyscraper Technique](URL))
    4. Không tìm thấy bài gốc → fallback (a) plain text + tên expert, KHÔNG bịa URL
  ghi_chu: {dùng cho framework gì}
```

---

## Bảng tổng quan (legacy table format — tham khảo nhanh, không phải nguồn gốc)

> Bảng dưới đây là **digest** của các YAML block bên trên cho phép user/AI tra cứu nhanh. **Nguồn gốc là YAML block**. Khi xung đột → YAML là chuẩn.

### Tier 1
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | {Tên tổ chức} | {host} | {chuyên ngành} | vi / en |

### Tier 2
| # | Tên nguồn | Domain | Lĩnh vực | Ngôn ngữ |
|---|-----------|--------|----------|----------|
| 1 | {Tên hiệp hội/báo} | {host} | {chuyên ngành} | vi / en |

### Tier 3
| # | Tên chuyên gia | Domain | Lĩnh vực | Ngôn ngữ |
|---|----------------|--------|----------|----------|
| 1 | {Tên đầy đủ} | {host profile} | {chuyên ngành} | vi / en |

---

## Quy tắc cite (AI BẮT BUỘC tuân thủ — v1.3)

### Per-citation workflow (BẮT BUỘC khi AI cần cite topic cụ thể)

```
Step 1: Identify topic cụ thể cần cite (vd "ASTM A53", "TCVN 6285:2008", "Skyscraper Technique")
Step 2: Match domain trong whitelist Tier 1/2/3 (xác định domain phù hợp với topic)
Step 3: Web search: site:{domain} "{topic}"
Step 4a: ✅ Tìm thấy URL specific → cite URL đó với anchor có tên topic
Step 4b: ❌ Không tìm thấy → fallback 1 trong 3:
   (a) Plain text không link: "theo tiêu chuẩn ASTM A53"  ← AN TOÀN NHẤT
   (b) Link domain root: [ASTM A53 (xem astm.org)](https://www.astm.org) + anchor có tên topic
   (c) Comment: <!-- TODO: verify specific URL for ASTM A53 on astm.org -->
Step 5: KHÔNG ĐƯỢC: paste sample_urls từ file này vào bài (đó là proof of authority, không phải citation)
Step 6: Log citation vào Session History (project memory.md) để audit sau
```

### Quy tắc chung

1. **CHỈ cite domain từ whitelist này**. Domain ngoài whitelist → AI **BỎ QUA**, **KHÔNG bịa link**. Nếu câu cần cite mà không có domain phù hợp → viết lại câu để không cần cite, hoặc xóa câu.
2. **Anchor text** phải chứa tên topic cụ thể hoặc tên nguồn, KHÔNG dùng "click here", "tại đây":
   - ✅ "Theo [ASTM A53 — Steel Pipe Specification](URL_specific), ống thép...", "Tiêu chuẩn [TCVN 6285:2008](URL_specific) quy định..."
   - ❌ "Xem [tại đây](URL) để biết thêm"
   - ❌ "Theo [ASTM](https://www.astm.org/products-services/standards-and-publications/standards/steel-standards.html)" ← sample URL paste, không match topic cụ thể
3. **Số lượng khuyến nghị**: 2-5 external link/bài. Spam (>10) → giảm trust signal.
4. **Format markdown**: `[anchor](URL)` cho web. Nếu output HTML: `<a href="URL" rel="noopener" target="_blank">anchor</a>`.
5. **Ưu tiên Tier**:
   - **Tier 1** cho data/số liệu/tiêu chuẩn pháp lý (vd "TCVN 6285:2008", "theo Bộ Công Thương")
   - **Tier 2** cho case study/báo cáo ngành (vd "báo cáo Statista 2025")
   - **Tier 3** cho quote/phương pháp luận (vd "framework Skyscraper của Brian Dean")
6. **Mỗi bài KHUYẾN NGHỊ** có ít nhất 1 cite Tier 1 nếu nội dung có data hoặc tiêu chuẩn pháp lý. Bài content marketing thuần (vd "5 mẹo viết blog") không bắt buộc Tier 1.
7. **Verify link** trước khi cite: nếu link 404 / redirect lạ → skip, ghi log vào Session History để user fix `external-sources.md`.

---

## Anti-pattern — Những lỗi AI thường mắc (BẮT BUỘC tránh)

| ❌ Anti-pattern | ✅ Đúng |
|----------------|--------|
| Paste `sample_urls` verbatim cho mọi cite ASTM (vd cùng 1 URL ASTM steel-standards landing cho cả A53, A106, A572) | Web search `site:astm.org A53` → cite URL specific A53. Web search `site:astm.org A106` → cite URL specific A106. |
| 1 URL cite cho ≥ 2 topic khác nhau trong cùng bài (URL inflation) | Mỗi topic 1 URL specific riêng. Nếu cùng URL → flag inflation. |
| Anchor text không match topic semantic (vd anchor "tiêu chuẩn thép" cho URL `astm.org/page-about-steel-standards-overview`) | Anchor match semantic: "ASTM A53 Steel Pipe Specification" cho URL `astm.org/Standards/A53.htm` |
| Bịa URL cho topic không tồn tại trong sample_urls và không tìm được qua search | Fallback (a) plain text, hoặc (c) TODO comment cho user verify |

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

## Workflow tích hợp với skill (v1.3)

### Khi viết bài (`Content Writing` v1.7+)
1. **Phase -1 Load Context**: AI đọc `external-sources.md` (nếu file tồn tại trong project) → cache toàn bộ domain whitelist + citation_rule.
2. **Phase 3 Drafting**: Khi gặp câu cần cite topic cụ thể → AI **PHẢI** thực thi per-citation workflow (web search `site:{domain} "{topic}"`) trước khi chèn link.
3. **Phase 4 EEAT Check**: Verify mỗi external link đều thuộc whitelist domain + không phải sample_url paste verbatim. Link ngoài / sample paste → flag để user review.

### Khi audit bài (`/audit` — Content Evaluation v1.5+)
1. **Phase 6.5 Load**: AI đọc `external-sources.md` cùng với `keywords-urls.md`.
2. **Section 5.6 External Citation Check** chạy 4 check:
   - ✅ Domain match whitelist + URL specific (không phải sample) → pass
   - ❌ URL trùng verbatim với `sample_urls[]` → flag "sample paste fabrication"
   - ❌ Cùng 1 URL dùng cho ≥ 2 topic khác nhau trong bài → flag "URL inflation"
   - ❌ Anchor text không match URL semantically → flag "anchor mismatch"

### Khi refresh bài (`Content Refresh` v1.6+)
1. Khi tăng EEAT Trust score → ưu tiên replace sample_url paste bằng URL specific (qua web search).
2. Khi cập nhật data outdated → verify URL specific vẫn live, nếu không thì fallback plain text.

### Khi audit không có project context (ad-hoc)
- Skill bỏ qua bước này. Verdict tính thuần từ rubric.

---

## Backward compatibility

- File này **không bắt buộc**. Project chưa có `external-sources.md` → skill cũ chạy như cũ (không cross-check).
- File `external-sources.md` để **trống** (0 nguồn) → skill cảnh báo "Project chưa fill whitelist" nhưng vẫn chạy.
- File **schema v1.0** (legacy bảng URL đầy đủ) → skill v1.5+ vẫn parse được nhưng warn "Whitelist còn schema v1.0, recommend upgrade v1.3 để có anti-fabrication protection". AI dùng cột "Domain" làm host (extract host từ URL nếu cần) và cảnh báo khi paste verbatim.
- Nếu user muốn cite ngoài whitelist 1 lần → comment ngay sau line cite: `<!-- ad-hoc cite, không thêm vào whitelist -->` → skill skip warning row đó.

---

## Maintenance

- File này thuộc về user, AI **KHÔNG TỰ THÊM** entry mới.
- Sau mỗi phiên, nếu AI dùng nguồn ngoài whitelist → Session End suggest user thêm vào (nếu đáng tin) hoặc xóa cite đó (nếu không đáng tin).
- Khi user fill domain mới → AI assist viết `citation_rule` cho source đó (nếu user yêu cầu).
- Khuyến nghị review whitelist 6 tháng/lần (xóa nguồn lỗi 404, thêm nguồn mới, cập nhật sample_urls cho chính xác).
