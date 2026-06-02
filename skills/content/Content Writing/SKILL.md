---
name: content-writing
version: 1.4.0
description: "Use this skill when the user asks to write NEW content / article / blog post: 'viết bài mới', 'viết bài về X', 'tạo bài viết', 'write new article'. Activates Phase -0.5 Intent Disambiguation + Output Path Resolution (4-step pre-flight). If user says 'viết lại' + filename → route to content-refresh instead. Output: projects/{project}/writing/{slug}.md."
category: content
---

# Content Writing — Viết nội dung có hồn, giải quyết đúng vấn đề người đọc

> **🛑 PRE-FLIGHT — ĐỌC TRƯỚC TIÊN, KHÔNG SKIP (v1.4 — fix bug output path)**
>
> **Trước khi gõ output đầu tiên, AI BẮT BUỘC chạy 4 bước Path Validation:**
>
> 1. **Intent Disambiguation**: User nói "viết mới" / "viết lại" / "refresh" / "cập nhật" / "rewrite" / "tối ưu"? Map theo bảng [Intent Routing](#phase--05-intent-disambiguation--output-path-resolution-v14) ở Phase -0.5 dưới đây.
> 2. **Locate existing file**: Nếu user đề cập filename (`abc.md`, `ong-thep-duc.md`...) → tìm trong `projects/{project}/{writing,refresh,research,audit,archive}/` (KHÔNG đoán, KHÔNG tự tạo). Nếu không tìm thấy → hỏi user 1 lần.
> 3. **Resolve subfolder target**: `writing/` (bài mới) hay `refresh/` (optimize cũ) hay `audit/` (đánh giá) hay `research/` (brief)? Default khi mơ hồ: xem bảng Phase -0.5.
> 4. **Verify final path**: Path PHẢI là `projects/{project}/{subfolder}/{slug}.md`. **TUYỆT ĐỐI KHÔNG** save vào:
>    - `projects/{project}/{slug}.md` (root project — chỉ chứa 5 file lõi `memory.md` / `profile.md` / `topical.md` / `keywords-urls.md` / `external-sources.md`)
>    - `projects/{project}/{cluster}/{slug}.md` (nested cluster ngoài subfolder cho phép)
>    - `projects/{slug}.md` (root `projects/` — không project)
>
> **Anti-pattern bug đã ghi nhận**: User yêu cầu "viết lại abc.md cho thép bảo tín" → AI save thẳng vào `projects/thep-bao-tin/abc.md` (ROOT). **SAI** — phải là `projects/thep-bao-tin/refresh/abc.md`.

## 1. Purpose / Mục đích

Skill này định nghĩa **cách viết nội dung thực sự hữu ích** — không phải viết cho Google, mà viết cho con người đang có vấn đề cần giải quyết. Trước khi gõ một chữ, bạn phải hiểu:

- Người này đang **gặp vấn đề gì**?
- Họ đang **sợ điều gì**?
- Họ muốn được **tư vấn hay hỏi đáp gì**?
- Họ cần **đọc gì để ra quyết định** tiếp theo?

Nội dung đạt chuẩn phải: **EEAT mạnh + GEO-ready + giải quyết đúng pain point + có giọng văn riêng** — không phải bài AI generic mà bất kỳ tool nào cũng generate được.

---

## ⚠️ QUY TẮC QUAN TRỌNG

### Phân biệt NỘI BỘ vs OUTPUT

| Loại | Mục đích | Xuất hiện trong bài viết? |
|------|----------|---------------------------|
| **User Psychology Brief** | Research nội bộ, hiểu người đọc | ❌ KHÔNG BAO GIỜ |
| **Competitor Analysis** | Research nội bộ, tìm information gain | ❌ KHÔNG BAO GIỜ |
| **Content Brief** | Hướng dẫn cho writer | ❌ KHÔNG BAO GIỜ |
| **Bài viết hoàn chỉnh** | Nội dung cho người đọc | ✅ ĐÂY LÀ OUTPUT |

**User Psychology Brief, Competitor Analysis, Content Brief là tài liệu nội bộ — TUYỆT ĐỐI KHÔNG đưa vào bài viết hoàn chỉnh.**

### Quy tắc Markdown — KHÔNG dùng `---` trong bài viết

- **TUYỆT ĐỐI KHÔNG** dùng `---` (horizontal rule / thẻ `<hr>`) trong nội dung bài viết output.
- `---` khi render Markdown tạo đường kẻ ngang xấu, gây rối bố cục bài viết trên website.
- **Cách tách section đúng**: Dùng heading (`##`, `###`) để phân chia nội dung. Heading tự tạo khoảng cách visual rõ ràng.
- Nếu cần tách 2 phần nội dung mà không dùng heading → dùng 1 dòng trống (blank line) là đủ.

| ❌ SAI | ✅ ĐÚNG |
|-------|--------|
| Dùng `---` giữa các section | Dùng heading `##` / `###` để tách section |
| Dùng `---` trước/sau bảng, quote | 1 dòng trống trước/sau bảng, quote |
| Dùng `---` cuối bài trước FAQ | Dùng `## FAQ` heading — không cần `---` |

### Quy tắc Internal Linking trong bài viết

- **Mỗi URL nội bộ chỉ xuất hiện DUY NHẤT 1 LẦN** trong 1 bài viết. Lặp lại cùng URL ≥ 2 lần → Google có thể đánh giá là spam pattern.
- Anchor text descriptive, chứa keyword tự nhiên (không dùng "click here", "xem thêm").
- Supporting article → 1 link về pillar. KHÔNG link về pillar 2-3 lần ở các section khác nhau.
- Pillar article → link xuống mỗi supporting 1 lần duy nhất.
- Link ngang giữa supporting trong cùng cluster: chỉ khi thực sự liên quan ngữ nghĩa, mỗi URL 1 lần.

| ❌ SAI | ✅ ĐÚNG |
|-------|--------|
| Link về pillar ở đoạn 1 + FAQ + kết luận (3 lần cùng URL) | Link về pillar 1 lần ở vị trí tự nhiên nhất |
| Cùng URL xuất hiện 2 lần với anchor text khác nhau | Mỗi URL chỉ 1 link, chọn anchor tốt nhất |
| Nhồi 5+ internal links trong 1 đoạn ngắn | Rải đều, tự nhiên, mỗi URL 1 lần |

### Quy tắc ngôn ngữ

- **Viết bằng tiếng Việt** — tự nhiên, dễ hiểu
- **Chỉ giữ tiếng Anh** cho: tiêu chuẩn kỹ thuật (TCVN, ASTM, JIS, ISO), thuật ngữ SEO chuyên môn (EEAT, schema, canonical)
- **KHÔNG dùng tiếng Anh** cho: từ thông thường có tiếng Việt tương đương

| ❌ Tránh | ✅ Dùng |
|---------|--------|
| scrap | phế liệu |
| red flags | dấu hiệu cần tránh |
| checklist | danh sách kiểm tra |
| tips | mẹo / lưu ý |
| insight | góc nhìn / nhận định |
| pain point | vấn đề / nỗi lo |
| case study | ví dụ thực tế / câu chuyện thực |
| EAF (Electric Arc Furnace) | lò điện hồ quang |
| BOF (Basic Oxygen Furnace) | lò thổi oxy |

---

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1. User Psychology Framework — 4 câu hỏi bắt buộc

Trước khi viết BẤT KỲ bài nào, phải trả lời 4 câu hỏi:

| # | Câu hỏi | Mục đích | Ví dụ (keyword: "ống thép đúc") |
|---|---------|----------|--------------------------------|
| 1 | **Họ đang gặp vấn đề gì?** | Xác định pain point thực | Cần mua ống thép cho công trình nhưng không biết loại nào phù hợp, sợ mua nhầm hàng kém chất lượng |
| 2 | **Họ đang sợ điều gì?** | Hiểu nỗi lo, rào cản | Sợ bị lừa giá, sợ hàng Trung Quốc đội lốt, sợ không đúng tiêu chuẩn kỹ thuật, sợ công trình gặp sự cố |
| 3 | **Họ muốn được tư vấn/hỏi đáp gì?** | Xác định câu hỏi trong đầu họ | Ống đúc khác ống hàn thế nào? Giá bao nhiêu là hợp lý? Mua ở đâu uy tín? Tiêu chuẩn nào cần đạt? |
| 4 | **Họ cần đọc gì để ra quyết định?** | Xác định output cần thiết | Bảng so sánh, checklist chọn hàng, bảng giá tham khảo, danh sách nhà cung cấp uy tín, case study công trình thực |

### 2.2. EEAT thực chiến (không phải lý thuyết)

| Yếu tố | Cách thể hiện trong bài | SAI (đừng làm) |
|--------|------------------------|----------------|
| **Experience** | Kể chuyện thực: "Tôi đã tư vấn cho 50+ công trình...", "Khách hàng A gặp tình huống này..." | Viết chung chung không có case cụ thể |
| **Expertise** | Giải thích kỹ thuật dễ hiểu, dùng số liệu chính xác, cite tiêu chuẩn (TCVN, ASTM, JIS) | Copy Wikipedia, không hiểu mình đang viết gì |
| **Authoritativeness** | Author có tên thật + bio + ảnh + LinkedIn, công ty có địa chỉ + SĐT + giấy phép | Không có author, không có thông tin công ty |
| **Trust** | Có nguồn trích dẫn (từ `external-sources.md` của project), có hình ảnh thực, có review khách hàng, có chính sách rõ ràng | Hứa hẹn không căn cứ, hình stock photo, **bịa URL nguồn không có trong whitelist** |

> **(v1.1) External Citation Rule — BẮT BUỘC**:
> - Nếu project có file `projects/{project}/external-sources.md` (whitelist nguồn ngoài) → AI **CHỈ cite từ whitelist này**, KHÔNG tự thêm URL từ ngoài.
> - Nếu câu cần cite mà không có nguồn phù hợp trong whitelist → viết lại câu để không cần cite, HOẶC để TODO `<!-- TODO: cite source (chưa có trong whitelist) -->` cho user fill sau.
> - Ưu tiên Tier 1 (cơ quan chính thức/tiêu chuẩn) cho data/tiêu chuẩn; Tier 2 (báo cáo/case study) cho thị trường; Tier 3 (chuyên gia) cho quote/framework.
> - Anchor text chứa tên nguồn cụ thể, KHÔNG dùng "click here", "tại đây".
> - Chi tiết workflow + schema 3-tier: xem `projects/external-sources-template.md`.

### 2.3. GEO — Generative Engine Optimization

Để AI (ChatGPT, Gemini, Perplexity) cite được bài:

| Nguyên tắc | Cách làm |
|------------|----------|
| **Answer-first** | 50-100 từ đầu tiên phải trả lời thẳng câu hỏi, không vòng vo |
| **Định nghĩa rõ ràng** | "Ống thép đúc là [định nghĩa]. Khác với ống hàn ở [điểm khác biệt]." |
| **Cấu trúc cite-able** | Dùng list, table, numbered steps — AI dễ trích xuất |
| **Entity rõ ràng** | Subject-Verb-Object rõ, không dùng "nó", "điều này" mơ hồ |
| **Original data** | Số liệu riêng, khảo sát riêng, case study riêng — AI ưu tiên nguồn gốc |

### 2.4. Giọng văn có hồn — Tránh bị Google phát hiện AI viết

> ⚠️ **QUAN TRỌNG**: Nội dung phải vượt qua cả AI detector lẫn đánh giá chất lượng của Google. Bài viết phải đọc lên như NGƯỜI THẬT viết — có cá tính, có kinh nghiệm, có quan điểm rõ ràng.
>
> 📖 **Chi tiết đầy đủ**: `knowledge/15-anti-ai-content-rules.md` — 4 Rulesets + Red Flags + Checklist.

#### Vocabulary Blacklist — TỪ CẤM (Ruleset 1)

**Tiếng Việt — Từ cấm chính (1A):**

| Nhóm | ❌ TRÁNH | ✅ THAY BẰNG |
|------|----------|-------------|
| **Cường điệu** | "Đột phá", "Cách mạng hóa" | Mô tả cụ thể kết quả thực |
| **Sáo rỗng** | "Chìa khóa", "Cốt lõi" | Nói thẳng: "3 điều quyết định..." |
| **Generic** | "Thúc đẩy" (doanh số) | "Tăng doanh số", "Bùng nổ doanh số" |
| **Lạm dụng** | "Tối ưu hóa" (dùng >2 lần/bài) | "Cải thiện", "Điều chỉnh", "Nâng cấp" |
| **Nhiệt tình giả** | "Đáng chú ý", "Thú vị thay", "Thật thú vị khi" | Trình bày thẳng thông tin |
| **Từ nối máy móc** | "Hơn nữa", "Ngoài ra", "Bên cạnh đó" | "Và", "Cộng thêm:", hoặc bỏ luôn |
| **Kết luận template** | "Tóm lại", "Nhìn chung" | "Như vậy,", "Lời khuyên là:" |

**Tiếng Việt — Mở rộng (1B):**

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "Đắm chìm", "Khám phá", "Tận dụng" | "Xem", "Tìm hiểu", "Dùng" |
| "Toàn diện", "Nổi bật", "Đa dạng" | "Đầy đủ", "Chi tiết", cụ thể hóa |
| "Đóng vai trò quan trọng", "Bức tranh toàn cảnh" | Nói thẳng vai trò cụ thể |
| "Hành trình", "Nền tảng", "Tiềm năng" | "Quá trình", "Cơ sở", "Cơ hội" |
| "Liền mạch", "Nâng tầm", "Trao quyền" | "Mượt", "Cải thiện", "Giúp" |
| "Minh chứng", "Vô cùng", "Sâu sắc" | "Ví dụ", "Rất"/bỏ, "Rõ ràng" |

**Tiếng Anh — Từ AI lạm dụng nhất (1C):**

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| Delve, Tapestry, Landscape (nghĩa bóng) | Explore, Look at; bỏ; Space, Market |
| Leverage, Robust, Comprehensive, Seamless | Use; Strong; Full, Complete; Smooth |
| Empower, Streamline, Foster, Harness | Help, Enable; Simplify; Build; Use |
| Elevate, Unleash, Embark, Realm | Improve; Unlock; Start; Area |
| Holistic, Paradigm, Groundbreaking | Complete; Shift; New, Innovative |
| Cutting-edge, Advent, Myriad, Plethora | Latest; Rise; Many; Lots of |
| Meticulous, Cornerstone, Testament | Careful; Foundation; Proof |

**Từ formal → từ đời thường (1D):**
`Utilize→Use`, `Facilitate→Help`, `Implement→Do`, `Subsequently→Then`, `Paramount→Really important`, `Elucidate→Explain`, `Ameliorate→Improve`, `Culminate→End up`

**Filler words — BỎ nếu câu vẫn đúng nghĩa (1F):**
`Essentially`, `Fundamentally`, `Particularly`, `Significantly`, `Additionally`, `Subsequently`, `Consequently`, `Ultimately`, `Undoubtedly`, `Arguably`, `Remarkably`, `Notably`, `Increasingly`

#### Câu mở đầu / chuyển tiếp / kết thúc — MẪU CÂU CẤM (Ruleset 2)

**Mở đầu bài viết (2A):**

| ❌ TRÁNH (AI formula) | ✅ DÙNG (Human-like) |
|----------------------|---------------------|
| "Trong thế giới/kỷ nguyên số ngày nay..." | Vào thẳng vấn đề người đọc đang gặp |
| "Không thể phủ nhận rằng..." | "Thực tế cho thấy..." |
| "Trong bối cảnh [chủ đề] không ngừng phát triển..." | Nêu vấn đề cụ thể, có data |
| "Bạn đã bao giờ tự hỏi...?" | Dùng ít, chỉ khi thực sự provocative |
| "Hãy cùng đắm chìm vào thế giới của..." | Bỏ, vào thẳng nội dung |
| "In today's fast-paced world..." | State the specific problem |
| "In the ever-evolving landscape of..." | Name the actual change |
| "With the advent of [technology]..." | Name specific tech + real impact |

**Chuyển đoạn (2C) — TRÁNH:**
`"Với điều đó trong đầu..."`, `"Điều này đưa chúng ta đến..."`, `"Hãy xem xét kỹ hơn..."`, `"Hơn nữa/Ngoài ra/Bên cạnh đó"` → Bắt đầu ý mới trực tiếp, dùng heading mới.

**Kết bài (2E) — TRÁNH:**
`"Tóm lại, [chủ đề] không chỉ là... mà còn..."`, `"Hy vọng bài viết đã mang đến..."`, `"Tương lai đang rộng mở..."`, `"The possibilities are endless"` → Restate thesis ngắn gọn + CTA cụ thể.

**CTA (2F) — TRÁNH:**
`"Chia sẻ ý kiến trong bình luận!"`, `"Đăng ký nhận nội dung giá trị!"` → Đặt câu hỏi cụ thể hoặc CTA inline tự nhiên.

#### Dấu hiệu bài AI (10 RED FLAGS — TUYỆT ĐỐI TRÁNH)

| # | Red Flag | Ví dụ | Tại sao bị phát hiện |
|---|----------|-------|---------------------|
| 1 | **Từ AI đặc trưng** | "delve", "landscape", "tapestry", "comprehensive" | Từ #1 bị AI lạm dụng |
| 2 | **Mở + kết bài câu hỏi tu từ** | "Have you ever...?" mở + "What are you waiting for?" kết | Pattern template |
| 3 | **Liệt kê số đẹp** | Đúng 5 hoặc 10 tips/steps | AI thích số tròn/lẻ |
| 4 | **Đoạn đều đặn** | Mỗi đoạn đều 3-4 câu, cùng độ dài | Người thật viết không đều |
| 5 | **Quá hoàn hảo** | Không có 1 lỗi chính tả, ngữ pháp nào | Văn bản "sterile" |
| 6 | **"landscape" nghĩa bóng** | "The SEO landscape is evolving" | AI dùng mọi nơi |
| 7 | **"Not only...but also" 2+ lần** | Paired conjunctions lặp lại | Pattern quá rõ ràng |
| 8 | **Thiếu dẫn nguồn** | "Studies show...", "Research suggests..." mà không link | AI bịa nguồn |
| 9 | **Filler phrases** | "It's important to note...", "It's worth mentioning..." | Padding thừa |
| 10 | **Title template** | "Ultimate Guide", "Everything You Need to Know", "A Deep Dive" | AI title format |

> **MỤC TIÊU: 🟢 Tự nhiên (0-2 red flags).** Nếu 3+ → phải sửa lại.

#### Pattern VN đặc trưng AI — PHẢI TRÁNH

| Pattern | Cách sửa |
|---------|----------|
| Câu dài xuyên suốt, ít ngắt | Tách thành 2-3 câu ngắn |
| Lạm dụng "sự" + danh từ ("Sự phát triển", "sự thay đổi") | Dùng động từ: "phát triển nhanh" |
| Dùng "được" quá nhiều ("được đánh giá", "được xem là") | Viết chủ động |
| Cấu trúc "không chỉ...mà còn" lặp lại | Tách thành 2 câu |
| Lạm dụng "một cách" ("một cách hiệu quả") | Bỏ: "hiệu quả hơn" |
| Dùng "Hãy" mệnh lệnh liên tục | Giọng đề xuất: "Bạn nên...", "Thử..." |
| Tone giảng dạy / thầy cô | Viết ngang hàng, chia sẻ giữa đồng nghiệp |

#### 10 kỹ thuật Humanization (BẮT BUỘC) — Ruleset 3

**1. Kinh nghiệm cá nhân (ít nhất 2-3 đoạn/bài DEEP)**
```
✅ "Tháng 3/2026, team mình audit website 1,200 trang — gộp 47 bài thin content,
   kết quả: organic traffic tăng 23% trong 60 ngày."
❌ "Nhiều doanh nghiệp đã nhận thấy hiệu quả đáng kể khi thực hiện content audit."
```

**2. Nhịp viết không đều (rhythm breaks)**
- Xen kẽ câu cực ngắn (3-5 từ) với câu trung bình (15-25 từ)
- Thỉnh thoảng dùng 1 đoạn chỉ có 1 câu để nhấn mạnh
- Dùng fragments: "Sai.", "Không hẳn.", "Và đây là lý do."
- Bắt đầu câu bằng "Và" hoặc "Nhưng" — AI thường tránh điều này
- Dùng câu hỏi tu từ conversational xen giữa đoạn

**3. Quan điểm rõ ràng (PHẢI có lập trường)**
```
✅ "GEO không thay thế SEO. Nhưng nếu bạn bỏ qua GEO năm 2026,
   bạn đang nhường visibility cho đối thủ — và có thể không lấy lại được."
❌ "GEO và SEO đều quan trọng và có vai trò riêng trong chiến lược digital marketing."
```

**4. Chi tiết cụ thể thay vì nói chung**
- Tên người, tên công ty, tên dự án cụ thể
- Số liệu cụ thể: "23%", "1,200 trang", "60 ngày" — không phải "đáng kể", "nhiều", "nhanh chóng"
- Timeline cụ thể: tháng, năm, mốc thời gian
- Đơn vị VN: triệu/tỷ VNĐ, m², kg

**5. Ngôn ngữ tự nhiên, không hoàn hảo**
- Dùng dấu '—' giữa câu để thêm suy nghĩ bất chợt
- Câu hỏi tu từ: "Nghe quen không?", "Bạn có thấy pattern này không?"
- Dùng "..." cho suspense
- Parenthetical asides (ghi chú trong ngoặc — như đang nói nhỏ với reader)

**6. Cultural markers VN**
- Ví dụ thị trường VN: giá, thương hiệu, xu hướng local
- Tools/platforms VN: Zalo, Shopee, Cốc Cốc
- So sánh cách doanh nghiệp VN thường làm vs best practice
- Đơn vị VN (triệu VNĐ, m², kg)

**7. Tuân thủ phong cách viết của từng profile**
- **BẮT BUỘC** đọc style profile trong `skills/style-mimicker/profiles/` trước khi viết
- Áp dụng đúng giọng văn, cách xưng hô, mức độ formal/casual của từng dự án
- Xem `skills/style-mimicker/SKILL.md` cho workflow chi tiết

**8. Anti-Listing Protocol**
- **KHÔNG** tự động chia content thành "1. Mở đầu, 2. Nội dung, 3. Kết luận" máy móc
- **KHÔNG** viết "Bước 1, Bước 2, Bước 3" khô khan trừ khi thực sự cần thiết
- **KHÔNG** luôn liệt kê đúng 3, 5, 7, 10 điểm — số tự nhiên OK (4, 6, 8, 11...)
- **KHÔNG** viết bullet points quá cân đối (mỗi bullet gần cùng độ dài)
- Tích hợp kịch bản thực tế và storytelling thay vì liệt kê lý thuyết suông

**9. Tránh giọng văn AI (Ruleset 3.6)**
- KHÔNG trung lập tuyệt đối — phải có lập trường
- KHÔNG hedge quá nhiều ("arguably", "perhaps", "có lẽ")
- KHÔNG lạc quan thái quá — phải có nuance + caveat
- KHÔNG formal không cần thiết — dùng từ đơn giản
- KHÔNG đồng thuận mọi phía — đứng hẳn một bên

**10. Dám nói "Tôi không biết"**
- AI hiếm khi thừa nhận giới hạn
- Người thật có thể tự mâu thuẫn rồi giải thích: "Tôi biết điều này nghe vô lý, nhưng..."
- Thể hiện cảm xúc thật: bực mình, hào hứng, thất vọng, ngạc nhiên

#### Self-Correction — Tự kiểm tra trước khi giao bài (Ruleset 4)

**Bước 1: Find & Replace** — Quét bài tìm từ cấm (Ruleset 1: 1A-1F) + mẫu câu cấm (Ruleset 2: 2A-2F). Đặc biệt kiểm tra: "delve", "landscape", "comprehensive" (EN) + "đột phá", "chìa khóa", "hành trình", "toàn diện", "khám phá" (VN). Xóa/thay thế.

**Bước 2: Tone Adjustment** — Giọng văn KHÔNG ĐƯỢC giống giáo sư hoặc phát ngôn viên. PHẢI giống đồng nghiệp thân thiện chia sẻ kinh nghiệm. Kiểm tra: không hedge quá nhiều, không formal không cần thiết, không trung lập tuyệt đối.

**Bước 3: Detail Enrichment** — Mỗi bài PHẢI có ít nhất 1-2 ví dụ thực tế cụ thể (ưu tiên VN): tên thương hiệu thật, số liệu thật, hoặc kịch bản "bài học thất bại".

**Bước 4: Red Flag Check** — Đếm số red flags (xem bảng 10 RED FLAGS). MỤC TIÊU: 🟢 0-2 red flags. Nếu ≥ 3 → sửa lại.

### 2.5. Kỹ thuật trình bày (Presentation Techniques)

> Học từ cách trình bày của Neil Patel — áp dụng cho format bài viết.

**Key Takeaways box (BẮT BUỘC cho bài DEEP và MEDIUM-DEEP):**
- Đặt ngay sau H1, trước nội dung chính
- 3-5 bullet tóm tắt insight quan trọng nhất
- Mỗi bullet là 1 câu hoàn chỉnh, actionable
- Giúp reader scan nhanh + AI dễ trích xuất

**Answer-first mỗi section:**
- Mỗi H2/H3 mở đầu bằng câu trả lời trực tiếp (1-2 câu)
- SAU ĐÓ mới giải thích chi tiết

**Visual evidence:**
- Sau mỗi claim quan trọng, chèn visual (bảng/chart/screenshot)
- Ưu tiên ảnh thực, data thực — KHÔNG stock photo

**Comparison tables:**
- Khi so sánh 2+ khái niệm → LUÔN dùng bảng thay vì prose
- Headers rõ ràng, cells ngắn gọn

**Bold-statement pattern (cho Common Mistakes/Tips):**
- **Bold statement.** Giải thích ngắn 2-3 câu.
- Ví dụ: **Tối ưu cho máy mà quên người đọc.** Nếu bài viết đọc lên nghe như viết cho thuật toán, bạn đã đi quá xa.

---

## 3. When to use / Khi nào dùng

- **Trước khi viết BẤT KỲ bài content nào** — skill này là bước 0
- Khi brief writer (bắt buộc trả lời 4 câu hỏi)
- Khi review bài draft (check xem đã giải quyết đúng vấn đề chưa)
- Khi audit content cũ không convert

---

## 4. Workflow viết nội dung có hồn

### Phase -2: Detect Project/Style — Fallback `_demo` (BẮT BUỘC, v1.3)

**Trước khi load project context, AI PHẢI detect 2 thứ:**

1. **Có project name trong yêu cầu?** (user nói "viết cho thep-bao-tin", "binhnn-digital", "hatcapherangxay"... hoặc session có project active)
2. **Có style name trong yêu cầu?** (user nói "viết theo phong cách [Name]", "dùng style profile [Name]"...)

#### Decision tree

```
Nếu CÓ project name:
  → Phase -1: Load projects/{project}/ context (memory.md → profile.md → topical.md → keywords-urls.md → external-sources.md)
  → Phase 0 → ... → Phase 5 (Style Mimicker nếu có style profile mapping)
  → Output: projects/{project}/writing/{cluster-or-slug}.md

Nếu KHÔNG có project name NHƯNG CÓ style name:
  → Phase -1: Skip project context load; chỉ load style profile từ skills/style-mimicker/profiles/{name}.json
  → Phase 0 → ... → Phase 5
  → Output: projects/_demo/writing/{yyyy-mm-dd}-{slug}.md
  → Note cuối bài: "Ad-hoc content với style {name} — không thuộc project."

Nếu KHÔNG project + KHÔNG style → FALLBACK `_demo` mode:
  → Phase -1: Load projects/_demo/style-guide.md (anti-AI rule + bảng AI-isms tiếng Việt riêng)
  → SKIP: memory.md, profile.md, topical.md, keywords-urls.md, external-sources.md
  → Phase 0: Competitor Research vẫn chạy (cần PAA, top 10 SERP nếu user cho keyword)
  → Phase 1-4: viết bình thường, apply style guide _demo
  → Phase 5 (Style Mimicker): SKIP (không có style chỉ định)
  → Phase 6 (Internal Linking): SKIP (không có keywords-urls.md)
  → Phase 3 (External Cite): SKIP whitelist; chỉ cite generic source (Wikipedia, .gov, .edu, hãng lớn) và ghi note "Ad-hoc cite — user review trước publish"
  → Output: projects/_demo/writing/{yyyy-mm-dd}-{slug}.md
  → Note cuối bài: "Ad-hoc content — không thuộc project. Style guide: _demo. User review trước khi publish."
  → Session End: KHÔNG cập nhật memory.md của bất kỳ project nào
```

> ⚠️ **Quan trọng**: Khi rơi vào `_demo` mode, AI **KHÔNG được tự đoán** project nào để gán. Nếu user không nói rõ → mặc định `_demo`. Nếu cần xác nhận → hỏi user 1 lần: "Bài này thuộc project nào, hay viết ad-hoc (`_demo`)?"

#### Cross-reference

- File chính của `_demo`: `projects/_demo/style-guide.md` (~875 dòng, bảng AI-isms tiếng Việt + tiếng Anh)
- README hướng dẫn: `projects/_demo/README.md`
- Source EN gốc do user cung cấp: `projects/_demo/style-guide-en.md` (chỉ reference, không edit)

---

### Phase -0.5: Intent Disambiguation + Output Path Resolution (v1.4 — fix bug output path)

> **Bug đã ghi nhận**: User yêu cầu *"viết lại abc.md cho thép bảo tín"* → AI save thẳng vào `projects/thep-bao-tin/abc.md` (ROOT). SAI. Phải là `projects/thep-bao-tin/refresh/abc.md`.
>
> Phase này **bắt buộc chạy sau Phase -2 (detect project/style)** và **trước Phase -1 (load context)**, để xác định ĐÚNG skill + ĐÚNG subfolder trước khi tốn thời gian load context.

#### Bước 1. Intent Disambiguation — Map câu yêu cầu của user sang skill

Quét request của user theo bảng dưới (case-insensitive, match cụm từ gần đúng). **Skill kích hoạt → quyết định subfolder output**:

| Cụm từ user nói | Skill kích hoạt | Subfolder output |
|----------------|------------------|------------------|
| "viết bài mới", "viết bài", "tạo bài" về X | **Content Writing** | `writing/` |
| "viết pillar", "viết bài chủ đề" | Content Writing + Pillar Pages | `writing/` |
| "viết lại {file}.md" (file đã tồn tại) | **Content Refresh** (mặc định) | `refresh/` |
| "refresh {file}.md", "refresh bài X" | Content Refresh | `refresh/` |
| "cập nhật {file}.md", "update bài X" | Content Refresh | `refresh/` |
| "tối ưu lại {file}.md", "optimize bài X" | Content Refresh | `refresh/` |
| "rewrite từ đầu {file}.md", "viết lại hoàn toàn từ đầu" | Content Writing (verdict 🟠 LÀM MỚI) | `writing/` (ghi đè) HOẶC `refresh/{slug}-v2.md` (giữ bản cũ) — hỏi user |
| "audit {file}.md", "/audit {URL}", "đánh giá bài X" | **Content Evaluation** | `audit/` |
| "viết brief", "brief cho bài X" | Content Writing (Brief mode) | `research/` |
| "keyword research", "nghiên cứu từ khóa" | Keyword Research | `research/` |
| "audit cluster", "topical audit" | Topical Audit | `audit/` |
| "schema {Type}", "tạo JSON-LD" | Schema Markup | `technical/` |

**Default khi mơ hồ**: Nếu user nói cụm chứa "viết lại"/"refresh"/"cập nhật" + filename `.md` đã tồn tại trong project → **mặc định Content Refresh + `refresh/` subfolder**. KHÔNG mặc định Content Writing → tránh ghi đè bài đã publish + tránh save vào root.

#### Bước 2. Locate Existing File (BẮT BUỘC nếu user đề cập filename)

Nếu request chứa filename (vd `abc.md`, `ong-thep-duc.md`), AI PHẢI tìm file đó **TRƯỚC KHI** quyết định path output:

```
Search trong các subfolder theo thứ tự:
1. projects/{project}/writing/{filename}        → bài đã publish, đang muốn refresh → output refresh/{filename}
2. projects/{project}/refresh/{filename}        → bản refresh trước đó, lần này refresh tiếp → output refresh/{filename} (ghi đè bản cũ)
3. projects/{project}/research/brief-{filename} → đây là brief, không phải bài → CHẶN, hỏi user "Refresh brief hay refresh bài viết?"
4. projects/{project}/archive/                  → bài đã archive → CHẶN, hỏi user "Restore từ archive hay viết bài mới cùng tên?"
5. projects/{project}/{filename} (ROOT)         → ⚠️ FILE LEGACY SAI VỊ TRÍ — user phải move sang writing/ trước, KHÔNG viết đè vào root
```

Nếu **KHÔNG tìm thấy** ở bất kỳ subfolder nào:
- Hỏi user 1 lần: *"Không tìm thấy `{filename}` trong `projects/{project}/`. Bạn muốn: (a) viết bài mới với slug `{filename}` → `writing/{filename}`, (b) bạn nhập sai tên file, gõ lại cho đúng?"*
- **KHÔNG tự đoán + KHÔNG tự tạo trong root**

Nếu tìm thấy **ở root** (case 5):
- WARN user: *"File `{filename}` đang nằm sai vị trí ở `projects/{project}/{filename}` (legacy bug). Trước khi refresh, mình sẽ MOVE file sang `projects/{project}/writing/{filename}` (giữ slug, giữ content) rồi mới refresh sang `refresh/{filename}`. Đồng ý không?"*

#### Bước 3. Resolve Subfolder Target

Sau Bước 1+2, AI có đủ thông tin để chốt subfolder:

| Case | Subfolder | Filename pattern |
|------|-----------|------------------|
| Content Writing — bài mới (chưa có file) | `writing/` | `{slug-tieu-de}.md` |
| Content Refresh — bài đã publish ở `writing/` | `refresh/` | giữ NGUYÊN slug gốc: `{slug-bai-cu}.md` |
| Content Refresh — refresh tiếp lần 2 (đã có `refresh/X.md`) | `refresh/` | ghi đè `{slug-bai-cu}.md` (hoặc `{slug-bai-cu}-v2.md` nếu user yêu cầu giữ lịch sử) |
| Content Evaluation — audit bài đơn | `audit/` | `audit-{yyyy-mm-dd}-{slug}.md` |
| Brief trước khi viết | `research/` | `brief-{slug-tieu-de}.md` |
| `_demo` mode (Phase -2 fallback) | `_demo/{writing\|refresh\|audit}/` | `{yyyy-mm-dd}-{slug}.md` |

#### Bước 4. Final Path Validation (BẮT BUỘC trước khi tạo file)

Trước khi gọi tool tạo file output, AI **PHẢI** tự verify path khớp 1 trong 5 pattern hợp lệ:

```
✅ projects/{project}/writing/{slug}.md          ← bài mới
✅ projects/{project}/refresh/{slug}.md          ← bài refresh (GIỮ slug gốc)
✅ projects/{project}/audit/audit-{date}-{slug}.md  ← audit bài đơn
✅ projects/{project}/research/brief-{slug}.md   ← brief
✅ projects/_demo/{writing|refresh|audit}/{yyyy-mm-dd}-{slug}.md  ← _demo fallback
```

```
❌ projects/{project}/{slug}.md                  ← SAI: root project chỉ chứa 5 file lõi
❌ projects/{project}/{cluster}/{slug}.md        ← SAI: không nested cluster ngoài subfolder
❌ projects/{slug}.md                            ← SAI: root projects/ không có file viết
❌ {slug}.md (root repo)                         ← SAI: không tạo file ở root repo
```

Nếu path final KHÔNG khớp ✅ pattern hợp lệ → **DỪNG, không tạo file, fix lại path**.

---

### Phase -1: Load Project Context — BẮT BUỘC (nếu viết cho dự án cụ thể)

**Trước khi bắt đầu research, PHẢI đọc file dự án theo thứ tự ưu tiên:**

| Thứ tự | File | Mục đích | Bắt buộc? |
|-------|------|----------|-----------|
| 1 | `projects/{project}/memory.md` ⭐ | Quick Facts + Active Context + Pending Tasks + Recent Articles + Key Decisions → 80% context AI cần | ✅ ĐỌC TRƯỚC TIÊN |
| 2 | `projects/{project}/profile.md` | Chủ thể, brand voice, business context (chi tiết) | ✅ Nếu memory.md không đủ |
| 3 | `projects/{project}/topical.md` | Topical map, cluster hierarchy, role (pillar/supporting) | ✅ (nếu tồn tại) |
| 4 | `projects/{project}/keywords-urls.md` | Keywords đã publish → chèn internal link | ✅ (nếu tồn tại) |

**Tại sao đọc memory.md trước**: Memory.md cache 80% context AI cần để bắt đầu (brand voice 1 dòng, cluster đang focus, style profile, pending tasks). Chỉ mở profile.md/topical.md/keywords-urls.md khi memory.md không đủ. Điều này giảm bootstrap từ ~30k token xuống ~5k token cho task thường gặp.

**Từ memory.md xác định:**
1. Quick Facts → brand voice cốt lõi, ngôi xưng, hotline
2. Active Context → cluster đang ưu tiên build → bài này khuớp cluster đó?
3. Pending Tasks → có task liên quan bài này chưa?
4. Recent Articles → tránh trùng với bài vừa publish
5. Key Decisions → có style/kỹ thuật nào đã chốt không được vi phạm?

**Từ topical.md xác định:**
1. Bài viết thuộc **cluster nào**?
2. Vai trò: **pillar** hay **supporting**?
3. **Category hierarchy** (cha → con → cháu) cho Topical Context Linking
4. Các bài liên quan trong cluster → nên link đến

**Từ keywords-urls.md xác định:**
1. Lọc bài **cùng cluster** có trạng thái ✅ published → chèn internal link
2. Lọc bài **cluster liên quan** có thể cross-link
3. **Pillar URL** của cluster → supporting PHẢI link về (1 lần)
4. Tránh viết trùng keyword đã có bài

> ⚠️ Nếu `topical.md` hoặc `keywords-urls.md` chưa tồn tại → ghi nhận và tiếp tục. Nhưng sau khi bài publish → CẬP NHẬT `keywords-urls.md` với keyword + URL mới.
>
> ⚠️ Nếu `memory.md` chưa tồn tại → copy `projects/memory-template.md` tạo mới và fill Quick Facts từ profile.md. Sau đó áp dụng Session End Protocol cuối phiên (xem Phase 7 bên dưới).

### Phase 0: Competitor Research (20 phút) — BẮT BUỘC

**Trước khi viết bất kỳ bài nào, phải phân tích top 10 Google cho keyword target.**

#### Bước 0.1. Thu thập top 10 SERP

```markdown
## Competitor Analysis (NỘI BỘ - KHÔNG XUẤT HIỆN TRONG BÀI)

**Keyword**: [keyword target]
**Ngày phân tích**: [YYYY-MM-DD]

### Top 10 Google

| # | URL | Tiêu đề | Độ dài | Điểm mạnh | Điểm yếu |
|---|-----|---------|--------|-----------|----------|
| 1 | | | | | |
| 2 | | | | | |
| ... | | | | | |
```

#### Bước 0.2. Phân tích cấu trúc nội dung

Với mỗi bài top 5, ghi nhận:
- **Cấu trúc H2/H3**: Họ chia bài thành những phần nào?
- **Định dạng**: Có bảng, list, hình ảnh, video không?
- **Độ sâu**: Giải thích chi tiết hay chỉ lướt qua?
- **Góc tiếp cận**: Viết cho ai? Giọng điệu thế nào?
- **CTA**: Họ muốn người đọc làm gì sau khi đọc?

#### Bước 0.3. Xác định Information Gain + Rare Attribute + AI Overview SERP

Trả lời 5 câu hỏi (bổ sung 2026):

| Câu hỏi | Ghi chú |
|---------|---------|
| **Top 10 đang thiếu gì?** | Câu hỏi nào chưa được trả lời? Góc nhìn nào bị bỏ qua? |
| **AI Overview đang tổng hợp ý nào?** ⭐ 2026 | Search target_keyword ẩn danh (incognito) → note 5-7 ý AI Overview đã đưa ra → dàn ý phải bao phủ + thêm 1-2 ý AI không tự sinh được |
| **Mình có gì họ không có?** | Kinh nghiệm thực, số liệu riêng, góc nhìn chuyên gia, ví dụ cụ thể |
| **Mình sẽ làm tốt hơn ở đâu?** | Cấu trúc rõ hơn, giải thích dễ hiểu hơn, cập nhật hơn |
| **⭐ Rare Attribute nào mình có?** | Thông tin hiếm, dữ liệu gốc, kinh nghiệm độc đáo mà ít ai viết |

> **2026 — Information Gain = ý mới so với AI Overview**, không chỉ so với Top 10 nữa. Nếu AI Overview đã tổng hợp đúng ý bạn định viết → bài bạn sẽ bị AI trích dẫn nhưng không được click → zero-click. Phải thêm góc AI không tự sinh được (kinh nghiệm thực chiến, dữ liệu nội bộ, case study có ảnh+video).
>
> Chi tiết Anonymous AI Overview Analysis: `knowledge/16-seo-trends-2026.md` mục 3.7.

> **Rare Attribute** là thông tin hiếm, độc đáo, ít người viết nhưng có giá trị thực và xác thực. Google thu thập các attribute này để xây dựng Knowledge Graph — được chấm điểm cao hơn rất nhiều so với thông tin phổ biến.
>
> **Ví dụ**:
> - Common: "Ống thép mạ kẽm chống ăn mòn tốt"
> - Rare: "Theo kinh nghiệm cung cấp cho 50+ dự án KCN, ống mạ kẽm BS 1387 Class B có tuổi thọ 15-20 năm trong môi trường pH 6.5-8.5, giảm còn 8-10 năm khi pH dưới 6.0"
>
> **Quy tắc**: Mỗi bài phải có ít nhất 1-2 rare attributes. Nếu không có dữ liệu thực → đánh dấu `[CẦN BỔ SUNG RARE ATTRIBUTE]` để editor thêm sau.
> Xem chi tiết: `knowledge/16-seo-trends-2026.md` mục 2.1

#### Bước 0.4. Ghi nhận Pattern

```markdown
### Pattern từ top 10

**Cấu trúc phổ biến**:
- H2 thường có: [liệt kê]
- Độ dài trung bình: [số từ]
- Định dạng hay dùng: [bảng/list/hình]

**Câu hỏi PAA (People Also Ask)**:
- [câu hỏi 1]
- [câu hỏi 2]
- [câu hỏi 3]

**Khoảng trống nội dung (Content Gap)**:
- [gap 1]
- [gap 2]
- [gap 3]

**Chiến lược của mình**:
- Giữ: [những gì top 10 làm tốt, mình cũng cần có]
- Bỏ: [những gì không cần thiết]
- Thêm: [information gain của mình]
```

#### Bước 0.5. Semantic Keyword Research — BẮT BUỘC

**Mục đích**: Thu thập từ khóa ngữ nghĩa (semantic keywords), từ khóa đuôi dài (long-tail), và các từ/cụm từ liên quan (LSI — Latent Semantic Indexing) để bài viết cover đầy đủ chủ đề, giúp Google hiểu rõ topical depth.

**Quy trình 4 bước:**

**B1. Extract keywords từ top 5 SERP**
- Dùng Surfer/Frase/Clearscope: chạy NLP analysis cho keyword target → lấy danh sách entity/terms mà top 5 đang dùng
- Nếu không có tool: đọc kỹ top 5, ghi lại các thuật ngữ, cụm từ, entity được nhắc đi nhắc lại

**B2. Thu thập từ Google**
- **Google Autocomplete**: gõ keyword chính + xem gợi ý → đây là long-tail thực tế
- **People Also Ask (PAA)**: ghi lại tất cả câu hỏi liên quan → dùng cho FAQ hoặc H2/H3
- **Related Searches**: cuộn xuống cuối trang Google → lấy cụm từ liên quan
- **Google Search Console**: nếu đã có bài cũ → xem queries đang nhận impressions

**B3. Phân loại Keyword Map**

```markdown
### Keyword Map (NỘI BỘ)

**Primary Keyword** (1 keyword):
- [keyword chính] — SV: [xxx] — Intent: [I/N/C/T]

**Secondary Keywords** (3-5 keywords):
- [keyword phụ 1] — SV: [xxx]
- [keyword phụ 2] — SV: [xxx]
- [keyword phụ 3] — SV: [xxx]

**Long-tail Keywords** (5-10 keywords):
- [long-tail 1] — SV: [xxx]
- [long-tail 2] — SV: [xxx]
- [long-tail 3] — SV: [xxx]

**LSI / Semantic Terms** (10-20 terms):
- [term liên quan 1]
- [term liên quan 2]
- [term liên quan 3]
(Đây là các entity, thuật ngữ, khái niệm mà Google expects khi nói về chủ đề này)

**PAA Questions** (5-8 câu):
- [câu hỏi PAA 1]
- [câu hỏi PAA 2]
- [câu hỏi PAA 3]
```

**B4. Lập kế hoạch phân bổ keywords**

| Vị trí trong bài | Keyword nào | Cách chèn |
|-------------------|-------------|-----------|
| Title (H1) | Primary keyword | Đặt gần đầu, tự nhiên |
| Meta title | Primary + brand | 50-60 ký tự, **<550 pixels** (2026) |
| Meta description | Primary + secondary | **≤ 135 ký tự** (2026, mobile-first), có imperative CTA |
| Summary chunk (sau H1) ⭐ | Primary | 40-60 chữ, trả lời trực diện, cho AI Overview trích dẫn |
| First 100 words | Primary keyword | Trong câu trả lời answer-first |
| H2 headings | Secondary keywords | 2-3 H2 chứa secondary keyword |
| H3 headings | Long-tail keywords | FAQ, sub-sections |
| Body text | LSI/semantic terms + entities | Rải tự nhiên, không nhồi. **Entity Mapping** thay mật độ (2026) |
| Image alt text | Primary/secondary | Mô tả ảnh + keyword tự nhiên |
| FAQ section | PAA questions + **Conversational Queries** 10-20 từ (2026) | Trả lời trực tiếp từng câu |
| Anchor text internal links | Secondary/long-tail | Descriptive, chứa keyword |

> **Bổ sung 2026 — Entity Mapping**: Trước khi viết, liệt kê **5-10 entity chính** (thực thể) liên quan target_keyword — người, tổ chức, sản phẩm, khái niệm chuyên ngành, địa điểm. Chèn entity tự nhiên vào body → Google dùng Vector Search hiểu ngữ cảnh sâu, không đếm keyword density nữa. Ghi entities vào frontmatter blockquote (xem Phase 6).

> ⚠️ **KHÔNG NHỒI KEYWORD**. Keyword density không có con số cố định. Quy tắc: đọc lại bài — nếu keyword lặp đến mức gượng ép → cắt bớt. Dùng biến thể (synonym, related terms) thay vì lặp cùng 1 cụm từ.

> **Nguyên tắc "đọc to"**: Đọc to đoạn văn. Nếu nghe không tự nhiên khi nói chuyện → viết lại. Keyword phải chảy trong câu, không phải "cắm" vào.

---

### Phase 1: User Research (30 phút)

#### Bước 1.1. Trả lời 4 câu hỏi tâm lý

```markdown
## User Psychology Brief (NỘI BỘ - KHÔNG XUẤT HIỆN TRONG BÀI)

**Keyword target**: [keyword]
**Persona**: [ai đang search? vai trò? trình độ?]

### 1. Họ đang gặp vấn đề gì?
- [Pain point 1]
- [Pain point 2]
- [Pain point 3]

### 2. Họ đang sợ điều gì?
- [Fear 1]
- [Fear 2]
- [Fear 3]

### 3. Họ muốn được tư vấn/hỏi đáp gì?
- [Question 1]
- [Question 2]
- [Question 3]

### 4. Họ cần đọc gì để ra quyết định?
- [Decision support 1]
- [Decision support 2]
- [Decision support 3]
```

#### Bước 1.2. Mining insight từ nguồn thực

| Nguồn | Cách khai thác |
|-------|----------------|
| **Google "People Also Ask"** | Câu hỏi thực người dùng đang hỏi |
| **Reddit/Facebook Group** | Search "[keyword] site:reddit.com" — đọc comment, không chỉ post |
| **Review sản phẩm** | Đọc review 1-3 sao để hiểu pain point |
| **Sales/CS team** | Hỏi: "Khách hay hỏi gì? Hay lo lắng gì?" |
| **Competitor comment** | Đọc comment bài competitor — họ hỏi gì thêm? |
| **YouTube comment** | Video cùng chủ đề — comment thường raw và thật |

#### Bước 1.3. Xác định Information Gain

Sau khi đọc top 5 SERP, trả lời:
- Top 5 đang thiếu gì?
- Mình có gì họ không có? (data, case study, góc nhìn, kinh nghiệm)
- Mình sẽ làm tốt hơn ở điểm nào?

---

### Phase 2: Outline theo User Journey (20 phút)

Outline không theo "H2 là gì, H2 tại sao, H2 cách làm" — mà theo **hành trình tâm lý người đọc**:

```markdown
## Outline Template

### Hook (100 từ đầu)
- Gọi tên vấn đề họ đang gặp
- Cho họ biết bài này sẽ giải quyết được
- TL;DR 3-5 bullet

### Phần 1: Giải đáp nỗi sợ lớn nhất
- Địa chỉ hóa fear #1
- Đưa ra giải pháp/cách phòng tránh
- Ví dụ thực tế

### Phần 2: Trả lời câu hỏi quan trọng nhất
- Question #1 từ research
- Trả lời thẳng + giải thích
- So sánh/bảng nếu cần

### Phần 3: Hướng dẫn ra quyết định
- Checklist/criteria
- Bảng so sánh options
- Red flags cần tránh

### Phần 4: Proof & Trust
- Case study thực
- Số liệu/data
- Social proof

### CTA
- Next step rõ ràng
- Giảm friction
```

---

### Phase 3: Viết Draft (60-90 phút)

#### Nguyên tắc viết

**0. Summary Chunk 40-60 chữ cho AI Overview (⭐ bắt buộc 2026)**

Ngay sau H1 + SEO Metadata blockquote, trước H2 đầu tiên, chèn 1 **Summary Chunk 40-60 chữ** trả lời trực diện target_keyword. Mục đích: AI Overview / ChatGPT / Perplexity trích dẫn làm nguồn.

```markdown
# {Tiêu đề H1}

> **SEO Metadata** ... (blockquote)

> **Tóm tắt nhanh** (cho AI Overview):
> Thép hình U VinaOne là dạng thép định hình mặt cắt chữ U, dùng làm khung kết cấu công nghiệp. Có 3 mác phổ biến (SS400/SS540/CT38), quy cách 50x40 đến 250x90, dung sai JIS G3192 hoặc TCVN 7571. Liên hệ Thép Bảo Tín báo giá đại lý.

## {H2 đầu tiên}
...
```

Đặc điểm Summary Chunk:
- 40-60 chữ (~50 chữ là chuẩn)
- Trả lời trực diện câu hỏi chính (intent của target_keyword)
- Chứa 1-2 entity quan trọng + brand
- KHÔNG dùng câu mở "Trong bài viết này...", "Hãy cùng tìm hiểu..."

Mỗi H2 quan trọng (ít nhất 3 H2 đầu) cũng cần có 1 **Bite-sized answer < 50 chữ** + list/bảng ngay sau → AI Overview dễ trích dẫn từng section.

**1. Hook trong 100 từ đầu**

❌ SAI:
> "Trong ngành xây dựng hiện nay, việc lựa chọn vật liệu phù hợp đóng vai trò vô cùng quan trọng. Ống thép đúc là một trong những loại vật liệu được sử dụng phổ biến..."

✅ ĐÚNG:
> "Bạn đang cần mua ống thép đúc cho công trình nhưng không biết chọn loại nào? Sợ mua phải hàng kém chất lượng, giá bị đội? Tôi hiểu — đây là nỗi lo của 90% khách hàng khi liên hệ với chúng tôi lần đầu.
>
> Trong bài này, tôi sẽ chia sẻ:
> - Cách phân biệt ống đúc thật vs giả
> - Bảng giá tham khảo 2024 (cập nhật tháng này)
> - 5 tiêu chí chọn nhà cung cấp uy tín"

**2. Topical Context Linking (Topical Authority)**

Mỗi bài phải có ít nhất 2-3 đoạn chứa context linking tự nhiên với category hierarchy. Đặc biệt quan trọng ở mở bài (first 100 words).

**Cách làm**: Dùng từ đồng nghĩa và ngữ cảnh để kết nối bài viết với:
- Category cha (lĩnh vực lớn)
- Category con (nhóm chủ đề)
- Category cháu (chủ đề cụ thể)

❗ Internal link chỉ mạnh 1/10 cho Topical Authority. Context + Content mới là yếu tố quyết định.

❌ SAI:
> Viết bài "Ống thép mạ kẽm" mà không nhắc gì đến ngành vật liệu xây dựng hay hệ thống PCCC

✅ ĐÚNG:
> "Trong ngành vật liệu xây dựng, ống thép mạ kẽm là lựa chọn phổ biến cho hệ thống PCCC nhà xưởng công nghiệp..."

Xem chi tiết: `knowledge/16-seo-trends-2026.md` mục 2.2

**3. Mỗi section giải quyết 1 vấn đề cụ thể**

Không viết để "có đủ H2". Mỗi H2 phải trả lời được: "Đọc xong phần này, người đọc giải quyết được gì?"

**4. Specificity > Generic**

❌ SAI:
> "Ống thép đúc có nhiều ưu điểm như độ bền cao, chịu áp lực tốt, tuổi thọ dài..."

✅ ĐÚNG:
> "Ống thép đúc SCH40 chịu được áp suất 150 bar ở nhiệt độ 200°C — gấp 3 lần ống hàn cùng kích thước. Với công trình dầu khí, đây là yêu cầu bắt buộc theo TCVN 6156:1996."

**5. Có người thật đằng sau**

❌ SAI:
> "Nên lựa chọn nhà cung cấp uy tín để đảm bảo chất lượng sản phẩm."

✅ ĐÚNG:
> "Năm ngoái, tôi tư vấn cho một công trình ở Bình Dương. Họ đã mua ống từ một đơn vị giá rẻ hơn 15%. Kết quả? 3 tháng sau phải thay toàn bộ vì không đạt chuẩn chịu nhiệt. Chi phí thay thế + dừng công trình: gấp 4 lần số tiền tiết kiệm ban đầu."

**6. Dùng format hỗ trợ quyết định**

- **Bảng so sánh**: khi có nhiều options
- **Checklist**: khi cần kiểm tra nhiều tiêu chí
- **Decision tree**: khi có nhiều trường hợp
- **Calculator/công thức**: khi cần tính toán
- **Timeline**: khi có quy trình theo thời gian

---

### Phase 4: EEAT & GEO Check (15 phút)

#### EEAT Checklist (nâng cấp 2026 — "E" là vũ khí)

```markdown
## EEAT Check

### Experience ⭐ (vu khi 2026)
- [ ] Có ít nhất 1 case study/ví dụ thực tế
- [ ] Có chi tiết cụ thể (tên, số, ngày, địa điểm)
- [ ] Có "behind the scenes" / góc nhìn insider
- [ ] Giọng văn ngôi 1 ("Tôi/Chúng tôi") + miêu tả cảm quan ("Khi tôi thử nghiệm...", "Thực tế tại thị trường VN...")
- [ ] **Proof of Experience — ít nhất 2/4 loại**:
  - [ ] Ảnh gốc (Original Image) tác giả tự chụp/thiết kế (KHÔNG stock)
  - [ ] Screenshot có annotation (mũi tên / circle highlight dữ liệu thực)
  - [ ] Short-form video tác giả tự quay (TikTok/YouTube Shorts) nhúng trong bài
  - [ ] Quote trực tiếp từ experience (cụ thể dự án, không generic)

### Expertise
- [ ] Giải thích kỹ thuật chính xác
- [ ] Cite tiêu chuẩn/nguồn uy tín
- [ ] (v1.1) **Mọi external link đều từ `external-sources.md` whitelist** — KHÔNG có URL ngoài whitelist (kể cả khi AI "tưởng đúng")
- [ ] (v1.1) Mỗi bài kỹ thuật/data có ≥ 1 cite Tier 1 (cơ quan chính thức/tiêu chuẩn)
- [ ] Không có thông tin sai

### Authoritativeness (bổ sung 2026 — Author Entity)
- [ ] Author có tên thật + bio + credentials
- [ ] Công ty có thông tin liên hệ rõ ràng
- [ ] **`ProfilePage` schema JSON-LD** gắn vào page tác giả (sameAs LinkedIn/Twitter)
- [ ] Author có **Digital Footprint** về chủ đề đó (ít nhất 3-5 bài dưới tên tác giả ở platform khác)
- [ ] Link author tới profile/portfolio

### Trust
- [ ] Có nguồn trích dẫn cho số liệu
- [ ] Hình ảnh thực (KHÔNG stock — EEAT "E" 2026)
- [ ] Có social proof (review, testimonial)
- [ ] Chính sách rõ ràng (nếu là trang bán hàng)
```

#### GEO Checklist (nâng cấp 2026 — AI Overview ready)

```markdown
## GEO Check (AI Citation Ready)

- [ ] 50-100 từ đầu trả lời thẳng câu hỏi
- [ ] **Summary Chunk 40-60 chữ sau H1** (trước H2 đầu tiên) — cho AI Overview trích dẫn
- [ ] Mỗi H2 quan trọng có Bite-sized answer < 50 chữ + list/bảng
- [ ] Có định nghĩa rõ ràng, cite-able
- [ ] Có ít nhất 1 list/table dễ trích xuất
- [ ] Không dùng pronoun mơ hồ (nó, điều này, việc đó)
- [ ] Có original data/insight (không chỉ tổng hợp)
- [ ] Entity chính được mention đủ (Entity Mapping 5-10 entity)
- [ ] Đã phân tích AI Overview SERP ẩn danh trước khi viết
- [ ] Conversational Queries 10-20 từ được trả lời (FAQ dạng hội thoại)

## Multimodal Check (2026)
- [ ] Bài có ít nhất 1 short-form video (TikTok/YouTube Shorts) do business tự sản xuất — hoặc đánh dấu `[CẦN BỔ SUNG VIDEO]`
- [ ] Ảnh trong bài là Original Image, không stock
- [ ] Nếu nhúng video → có schema `VideoObject` + caption + thumbnail

## INP Check (Core Web Vitals 2026)
- [ ] FAQ accordion / TOC menu / nhúng video — INP < 200ms
- [ ] Không dependency JS block main thread
- [ ] Test bằng Chrome DevTools → PageSpeed Insights

## Rare Attribute Check
- [ ] Có ít nhất 1-2 rare attributes (thông tin hiếm, dữ liệu gốc, kinh nghiệm độc đáo)
- [ ] Rare attribute có giá trị thực và xác thực (đúng sự thật, không bịa)
- [ ] Nếu không có dữ liệu → đánh dấu `[CẦN BỔ SUNG RARE ATTRIBUTE]`

## Topical Context Check
- [ ] Mở bài có context linking với category hierarchy (cha → con → cháu)
- [ ] Body có ít nhất 2-3 đoạn kết nối ngữ nghĩa với cluster/category
- [ ] Liên kết tự nhiên, không gượng ép

## Keyword Coverage Check
- [ ] Primary keyword xuất hiện trong: H1, first 100 words, meta_title, meta_description
- [ ] Secondary keywords: 2-3 cái xuất hiện trong H2 headings
- [ ] Long-tail keywords: xuất hiện trong H3/FAQ sections
- [ ] LSI/semantic terms: rải tự nhiên trong body (đọc to không gượng)
- [ ] PAA questions: ít nhất 3-5 câu được trả lời (trong FAQ hoặc body)
- [ ] Không nhồi keyword: đọc lại, nếu cùng cụm từ lặp > 3 lần/1000 từ → thay biến thể
- [ ] Image alt text có chứa keyword phù hợp (mô tả ảnh + keyword tự nhiên)

## Metadata 2026 Check (xem `knowledge/18-metadata-sop-2026.md`)
- [ ] meta_title: 50-60 ký tự + < 550 pixels (test SERP Simulator)
- [ ] meta_title theo 1 trong 4 mẫu intent (Info / How-to / Product / Comparison)
- [ ] meta_description: ≤ 135 ký tự (mobile-first), imperative CTA cuối
- [ ] Tránh ALL-CAPS, dùng `&` thay `and`, dùng `:` hoặc `\|` thay `-` `—`
- [ ] Title-H1 alignment (lệch → bounce ↑)
- [ ] meta blockquote chứa thêm: summary_chunk + entities + author (ProfilePage URL) + embed_video_url + aio_readiness
```

---

### Phase 5: Voice & Tone Polish (15 phút)

#### Checklist giọng văn

```markdown
## Voice Check — Tránh AI Generic

### Câu mở đầu section
- [ ] Không bắt đầu bằng "Như chúng ta đã biết..."
- [ ] Không bắt đầu bằng "Trong thời đại..."
- [ ] Không bắt đầu bằng "Điều quan trọng là..."

### Cấu trúc câu
- [ ] Câu trung bình < 20 từ
- [ ] Đoạn trung bình 2-4 dòng
- [ ] Không có câu > 40 từ

### Giọng điệu
- [ ] Có dùng "tôi", "bạn", "chúng tôi"
- [ ] Có ít nhất 1 quan điểm cá nhân
- [ ] Có ít nhất 1 câu thể hiện cảm xúc

### Chi tiết cụ thể
- [ ] Có tên người/công ty/địa điểm thực
- [ ] Có số liệu cụ thể (không "nhiều", "một số")
- [ ] Có ngày/thời gian cụ thể
```

#### Từ/cụm từ cần thay thế

| ❌ Tránh | ✅ Thay bằng |
|---------|-------------|
| "Như chúng ta đã biết" | [Xóa, vào thẳng vấn đề] |
| "Điều quan trọng cần lưu ý" | "Lưu ý:" hoặc [Xóa] |
| "Trong thời đại số ngày nay" | [Xóa] |
| "một số", "nhiều", "một vài" | Số cụ thể: "3", "47%", "hơn 100" |
| "rất", "vô cùng", "cực kỳ" | [Xóa hoặc thay bằng số liệu] |
| "Tóm lại, có thể thấy rằng" | "Tóm lại:" |
| "được sử dụng rộng rãi" | "X% công trình sử dụng" |

---

## 5. Template — Content Brief có User Psychology

```markdown
# Content Brief (NỘI BỘ - KHÔNG XUẤT HIỆN TRONG BÀI)

## Meta
- **Keyword target**: 
- **Search volume**: 
- **Intent**: [Informational / Commercial / Transactional]
- **Funnel**: [TOFU / MOFU / BOFU]
- **URL slug**: 
- **Word count**: 
- **Author**: 
- **Deadline**: 

## User Psychology (BẮT BUỘC)

### 1. Họ đang gặp vấn đề gì?
- 
- 
- 

### 2. Họ đang sợ điều gì?
- 
- 
- 

### 3. Họ muốn được tư vấn/hỏi đáp gì?
- 
- 
- 

### 4. Họ cần đọc gì để ra quyết định?
- 
- 
- 

## Keyword Map (BẮT BUỘC)

### Primary Keyword
- [keyword chính] — SV: [xxx] — Intent: [I/N/C/T]

### Secondary Keywords (3-5)
- [keyword phụ 1] — SV: [xxx] — Dùng ở: [H2/body/meta]
- [keyword phụ 2] — SV: [xxx] — Dùng ở: [H2/body/meta]
- [keyword phụ 3] — SV: [xxx] — Dùng ở: [H2/body/meta]

### Long-tail Keywords (5-10)
- [long-tail 1] — SV: [xxx] — Dùng ở: [H3/FAQ/body]
- [long-tail 2] — SV: [xxx] — Dùng ở: [H3/FAQ/body]

### LSI / Semantic Terms (10-20)
- [entity/term 1], [entity/term 2], [entity/term 3], ...
(Các thuật ngữ Google expects khi nói về chủ đề này — rải tự nhiên trong body)

### PAA Questions (5-8)
- [câu hỏi 1] → Dùng cho: [FAQ / H3]
- [câu hỏi 2] → Dùng cho: [FAQ / H3]

## Information Gain
Top 5 SERP đang thiếu gì? Mình sẽ làm tốt hơn ở đâu?
- 
- 
- 

## Outline (theo User Journey)

### Hook (100 từ)
- Gọi tên vấn đề
- Promise giải quyết
- TL;DR bullets

### Section 1: [Giải đáp fear chính]


### Section 2: [Trả lời question quan trọng nhất]


### Section 3: [Hỗ trợ ra quyết định]


### Section 4: [Proof & Trust]


### CTA


## EEAT Elements
- **Experience**: [Case study/ví dụ sẽ dùng]
- **Expertise**: [Tiêu chuẩn/nguồn sẽ cite]
- **Author**: [Tên + credentials]
- **Trust signals**: [Review/testimonial/hình ảnh thực]

## GEO Elements
- **Definition cite-able**: 
- **List/table chính**: 
- **Original data**: 

## Internal Links
- IN (từ bài cũ): 
- OUT (tới bài liên quan): 
- ⚠️ **MỖI URL CHỈ XUẤT HIỆN 1 LẦN TRONG BÀI** — không lặp lại cùng link

## Visuals cần
- 
- 
- 
```

---

## 6. KPI đo lường

| KPI | Target | Cách đo |
|-----|--------|---------|
| **Engagement rate** | > 60% | GA4 engaged sessions |
| **Scroll depth** | > 70% | GA4 scroll event |
| **Time on page** | > 3 phút | GA4 engagement time |
| **Bounce rate** | < 40% | GA4 |
| **Conversion rate** | > 2% | GA4 goals |
| **AI citation** | Được cite | Manual test 5 LLM |
| **Featured snippet** | Capture | GSC |
| **Position 28d** | Top 10 | GSC |

---

## 7. Tools đề xuất

| Tool | Giá | Use case |
|------|-----|----------|
| **AnswerThePublic** | Freemium | Mining câu hỏi người dùng |
| **AlsoAsked** | Freemium | PAA tree |
| **Google Autocomplete** | Free | Long-tail keyword từ gợi ý Google |
| **Google Related Searches** | Free | LSI/semantic terms từ cuối trang Google |
| **Ahrefs/Semrush** | Paid | Keyword research, Related Terms, Content Gap |
| **Surfer/Frase/Clearscope** | Paid | NLP entity check + semantic keyword suggestions |
| **Google Search Console** | Free | Queries đang nhận impressions (keyword thực tế) |
| **Reddit/Facebook search** | Free | Insight thực từ community |
| **Hotjar/Clarity** | Freemium | Xem user đọc đến đâu, click gì |
| **Hemingway Editor** | Free | Check readability, câu dài |
| **ChatGPT/Claude** | Freemium | Brainstorm, không dùng để viết final |
| **Grammarly** | Freemium | Grammar + tone |

---

## 8. Common mistakes

### Sai về Competitor Research & Keywords
- ❌ Không research, viết theo cảm tính
- ❌ Copy cấu trúc top 1 mà không hiểu tại sao
- ❌ Không tìm information gain, viết y hệt đối thủ
- ❌ Bỏ qua PAA (People Also Ask)
- ❌ Không làm Semantic Keyword Research → bài thiếu topical depth, Google không hiểu bài nói về gì
- ❌ Nhồi keyword chính 10+ lần trong 1,500 từ → spam, bị phạt
- ❌ Chỉ dùng primary keyword, không có secondary/long-tail/LSI → bỏ lỡ hàng trăm queries liên quan
- ❌ Bỏ qua keyword trong H2/H3, image alt text, meta description → mất cơ hội rank

### Sai về Rare Attribute & Topical Context
- ❌ Bài viết toàn thông tin phổ biến (common), không có dữ liệu gốc hoặc kinh nghiệm riêng
- ❌ Không có context linking với category hierarchy → Google không hiểu bài thuộc topic nào
- ❌ Chỉ dựa vào internal link để xây Topical Authority (internal link chỉ mạnh 1/10)
- ❌ Nhồi context linking không tự nhiên → đọc gượng ép

### Sai về User Psychology
- ❌ Không research, viết theo assumption
- ❌ Viết cho "người đọc chung chung" thay vì persona cụ thể
- ❌ Không hiểu fear/pain point, chỉ liệt kê feature
- ❌ Không có decision support, chỉ có thông tin

### Sai về EEAT
- ❌ Không có case study/ví dụ thực
- ❌ Author ẩn danh hoặc không có credentials
- ❌ Số liệu không có nguồn
- ❌ Hình ảnh stock thay vì hình thực
- ❌ **(v1.1) Bịa URL nguồn không có trong `external-sources.md` whitelist** — AI tự fabricate domain, paragraph 404, hoặc trộn URL không tồn tại. ABS phải cite **CHỈ** từ whitelist project; thiếu nguồn → viết lại câu hoặc để TODO comment.
- ❌ Cite nguồn không phù hợp Tier (vd dùng Wikipedia làm tiêu chuẩn pháp lý thay vì TCVN)

### Sai về GEO
- ❌ Vòng vo 200 từ mới vào vấn đề
- ❌ Không có định nghĩa rõ ràng
- ❌ Dùng pronoun mơ hồ
- ❌ Không có list/table cite-able

### Sai về Voice
- ❌ Viết như AI: dài dòng, generic, không có quan điểm
- ❌ Không có người thật đằng sau
- ❌ Không có chi tiết cụ thể
- ❌ Câu quá dài, đoạn quá dài

### Sai về Internal Linking
- ❌ Cùng URL xuất hiện 2-3 lần trong bài → spam risk
- ❌ Link về pillar ở cả đầu bài, giữa bài, và cuối bài (cùng URL)
- ❌ Anchor text quá giống nhau cho tất cả internal links
- ❌ Nhồi >5 internal links trong 1 section ngắn

### Sai về Markdown & SEO Metadata
- ❌ Dùng `---` (horizontal rule) trong bài viết — tạo thẻ `<hr>` gây rối layout
- ❌ Dùng YAML frontmatter (`---`) thay vì blockquote (`>`) — hiển thị chữ rất to khi render
- ❌ Thiếu `meta_title` và `meta_description` trong SEO Metadata
- ❌ (2026) meta_description vượt 135 ký tự / dùng `-` `—` thay vì `:` `\|` / dùng ALL-CAPS
- ❌ (2026) Thiếu summary_chunk 40-60 chữ đầu bài → AI Overview không trích dẫn
- ❌ (2026) Dùng ảnh stock thay vì Original Image → EEAT "E" fail
- ❌ (2026) Thiếu ProfilePage schema cho tác giả → mất Author Entity
- ❌ Dùng `title` (H1) làm title tag luôn — meta_title phải riêng, tối ưu cho SERP
- ❌ Meta description > 160 ký tự hoặc không có CTA
- ❌ Thiếu các trường bắt buộc: slug, cluster, role, target_keyword, semantic_keywords, search_intent

### Sai về Output
- ❌ Đưa User Psychology Brief vào bài viết hoàn chỉnh
- ❌ Đưa Competitor Analysis vào bài viết hoàn chỉnh
- ❌ Dùng tiếng Anh cho từ thông thường (scrap, tips, checklist)
- ❌ Không phân biệt tài liệu nội bộ vs output cho người đọc

---

## 9. Ví dụ thực tế

### Input: Keyword "ống thép đúc"

#### User Psychology Brief

```markdown
**Persona**: Kỹ sư/quản lý mua hàng công trình xây dựng, dầu khí

### 1. Họ đang gặp vấn đề gì?
- Cần mua ống thép cho công trình nhưng không rành về chủng loại
- Không biết phân biệt ống đúc vs ống hàn
- Không biết giá thị trường, sợ bị hét giá
- Cần đảm bảo đúng tiêu chuẩn kỹ thuật cho dự án

### 2. Họ đang sợ điều gì?
- Sợ mua phải hàng Trung Quốc kém chất lượng đội lốt hàng tốt
- Sợ không đạt tiêu chuẩn, công trình bị reject khi nghiệm thu
- Sợ bị lừa giá (mua đắt hơn thị trường)
- Sợ giao hàng chậm, ảnh hưởng tiến độ

### 3. Họ muốn được tư vấn gì?
- Ống đúc khác ống hàn thế nào? Khi nào dùng loại nào?
- Giá ống đúc hiện tại bao nhiêu? (theo size, theo loại)
- Tiêu chuẩn nào cần đạt? (TCVN, ASTM, JIS)
- Mua ở đâu uy tín? Cách kiểm tra hàng thật/giả?

### 4. Họ cần đọc gì để ra quyết định?
- Bảng so sánh ống đúc vs ống hàn (ưu nhược điểm, ứng dụng)
- Bảng giá tham khảo theo size phổ biến
- Checklist kiểm tra chất lượng khi nhận hàng
- Danh sách nhà cung cấp uy tín + cách verify
```

#### Hook mẫu (100 từ đầu)

> **Ống thép đúc là gì? Đây là loại ống được sản xuất bằng phương pháp đúc liền khối, không có mối hàn, chịu được áp suất cao gấp 2-3 lần ống hàn thông thường.**
>
> Nếu bạn đang tìm mua ống thép đúc cho công trình và lo lắng về:
> - Làm sao phân biệt hàng thật vs hàng kém chất lượng?
> - Giá bao nhiêu là hợp lý? (tránh bị hét giá)
> - Tiêu chuẩn nào cần đạt để nghiệm thu?
>
> Bài viết này sẽ giải đáp tất cả — từ góc nhìn của người đã tư vấn cho 200+ công trình trong 8 năm qua.

---

**Đầu ra của skill này**: Mỗi bài content đều bắt đầu từ Competitor Research + User Psychology Brief (nội bộ), viết đúng vấn đề người đọc cần, có giọng văn riêng, đạt chuẩn EEAT + GEO. **Bài viết hoàn chỉnh KHÔNG chứa các phần research nội bộ.**

### ⚠️ SEO Metadata bắt buộc cho bài viết hoàn chỉnh (chuẩn 2026)

Mỗi bài viết output **phải có** block SEO Metadata dạng blockquote đầu bài, theo `projects/content-template.md`:

```markdown
> **SEO Metadata**
> - **title**: "{Tiêu đề bài viết — H1}"
> - **slug**: "{slug-url}"
> - **meta_title**: "{Title tag 50-60 ký tự, <550 pixels, theo 1/4 mẫu intent}"
> - **meta_description**: "{Mô tả ≤ 135 ký tự (2026, mobile-first), value-prop + imperative CTA}"
> - **project**: "{tên dự án}"
> - **cluster**: "{tên cluster / head keyword}"
> - **role**: "pillar | supporting"
> - **target_keyword**: "{keyword chính}"
> - **semantic_keywords**: "{từ khóa ngữ nghĩa liên quan, phân cách bằng dấu phẩy}"
> - **search_intent**: "I | N | C | T"
> - **word_count**: {số từ thực tế}
> - **created**: "{YYYY-MM-DD}"
> - **summary_chunk**: "{40-60 chữ trả lời trực diện target_keyword — cho AI Overview}"
> - **entities**: "{5-10 entity chính, phân cách bằng dấu phẩy}"
> - **author**: "{Tên tác giả} | {URL ProfilePage / LinkedIn}"
> - **embed_video_url**: "{TikTok/Shorts URL nếu có, '' nếu không}"
> - **aio_readiness**: "true | false"
```

⚠️ **KHÔNG dùng YAML frontmatter** (`---` mở/đóng) — khi render Markdown sẽ hiển thị chữ rất to. Dùng blockquote (`>`) để metadata hiển thị đẹp.

⚠️ **5 trường 2026 mới thêm** (summary_chunk + entities + author + embed_video_url + aio_readiness) là bắt buộc cho bài mới. Bài cũ chỉ bổ sung khi refresh.

### ⚠️ Output path bắt buộc (2026 — folder-scoped)

**Bài viết MỚI** → lưu vào subfolder `writing/`:

```
projects/{project}/writing/{slug-tieu-de}.md
```

KHÔNG lưu trực tiếp `projects/{project}/{slug}.md` (root). Root chỉ chứa 4 file lõi: `memory.md`, `profile.md`, `topical.md`, `keywords-urls.md`.

Ví dụ:
- ✅ `projects/thep-bao-tin/writing/ong-thep-duc-la-gi.md`
- ✅ `projects/thep-bao-tin/writing/thep-u-vinaone.md`
- ❌ `projects/thep-bao-tin/ong-thep-duc-la-gi.md` (sai — bài viết phải vào `writing/`)
- ❌ `projects/thep-bao-tin/ong-thep-duc/thep-ong-duc-phi-127.md` (sai — không nested cluster trong `writing/`)

Tạo folder `writing/` nếu chưa tồn tại (lần đầu tiên project có bài viết).

Trường hợp đặc biệt:
- **Refresh** (bài đã publish, optimize lại) → `projects/{project}/refresh/{slug}.md` (xem `skills/content/Content Refresh/SKILL.md`)
- **Brief** (content brief trước khi viết) → `projects/{project}/research/brief-{slug}.md`

Tham chiếu chuẩn: `AGENTS.md` Section "GENERATE OUTPUT" + `COMPILED-CONTEXT.md` mục 9.

### ⚠️ Sau khi publish — Cập nhật keywords-urls.md

Sau khi bài viết hoàn chỉnh và publish, **BẮT BUỘC** cập nhật `projects/{project}/keywords-urls.md`:
1. Thêm row mới: keyword + URL + cluster + vai trò + search intent + trạng thái ✅ published
2. Kiểm tra các bài cũ cùng cluster → cập nhật internal link trỏ về bài mới (nếu ngữ nghĩa phù hợp)

**Lưu ý quan trọng (2026):**
- `meta_title` ≠ `title`. Title là H1 hiển thị trên trang (Title-H1 alignment). Meta title là title tag hiển thị trên SERP + làm **AI Anchor Text** khi LLM trích dẫn.
- `meta_title`: 50-60 ký tự + **< 550 pixels** (test Semrush SERP Simulator). Theo 1 trong 4 mẫu intent: Info / How-to / Product / Comparison. Keyword 1 lần duy nhất.
- `meta_description`: **≤ 135 ký tự** (2026, mobile-first). Tránh ALL-CAPS. Dùng `&` thay `and`, `:` hoặc `\|` thay `-` `—`. Imperative CTA cuối. Không keyword stuff.
- `summary_chunk`: 40-60 chữ, trả lời trực diện, render trong bài dưới dạng blockquote `> **Tóm tắt nhanh**:` ngay sau H1.
- `entities`: liệt kê Entity Mapping (5-10 entity chính) — Google dùng Vector Search.
- `author`: tên thật + URL ProfilePage / LinkedIn (Author Entity verify).
- `embed_video_url`: short-form video tự sản xuất — bắt buộc cho Multimodal SEO 2026 (nếu chưa có → đánh dấu `[CẦN BỔ SUNG VIDEO]`).
- `aio_readiness`: `true` nếu đã đủ summary_chunk + bite-sized H2 + ProfilePage schema + video; ngược lại `false`.

Xem chi tiết Metadata SOP 2026: `knowledge/18-metadata-sop-2026.md`.

---

## 10. Tóm tắt Workflow

```
┌─────────────────────────────────────────────────────────────────┐
│                    WORKFLOW VIẾT NỘI DUNG                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Phase -1: LOAD PROJECT CONTEXT (5 phút)                          │
│  └── Đọc profile.md + topical.md + keywords-urls.md              │
│  └── Xác định cluster, role, hierarchy, internal links sẵn có    │
│                         ↓                                       │
│  Phase 0: COMPETITOR RESEARCH + SEMANTIC KEYWORDS (30 phút)      │
│  └── Phân tích top 10 Google → Tìm information gain             │
│  └── Xác định Rare Attribute (thông tin hiếm, dữ liệu gốc)        │
│  └── Semantic Keyword Research → Keyword Map (primary/secondary/ │
│      long-tail/LSI/PAA)                                          │
│                         ↓                                       │
│  Phase 1: USER RESEARCH (30 phút)                               │
│  └── 4 câu hỏi tâm lý → Hiểu người đọc                          │
│                         ↓                                       │
│  Phase 2: OUTLINE (20 phút)                                     │
│  └── Cấu trúc theo user journey                                 │
│                         ↓                                       │
│  Phase 3: VIẾT DRAFT (60-90 phút)                               │
│  └── Hook → Topical Context → Rare Attribute → Giải quyết vấn đề │
│                         ↓                                       │
│  Phase 4: EEAT & GEO CHECK + RARE ATTRIBUTE CHECK (15 phút)     │
│  └── EEAT + GEO + Rare Attribute + Topical Context Check          │
│                         ↓                                       │
│  Phase 5: VOICE POLISH (15 phút)                                │
│  └── Loại bỏ câu AI generic, thêm giọng văn riêng               │
│  └── **→ Tích hợp Style Mimicker nếu có profile**               │
│                         ↓                                       │
│  Phase 6: INTERNAL LINK & SEO META CHECK (10 phút)              │
│  └── Chèn link từ keywords-urls.md, mỗi URL 1 lần duy nhất     │
│  └── SEO Metadata blockquote đầy đủ: meta_title + meta_description│
│                         ↓                                       │
│  Phase 7: SESSION END PROTOCOL — UPDATE MEMORY (5 phút) ⭐      │
│  └── Append entry vào projects/{project}/memory.md             │
│  └── Append article mới vào Recent Articles                    │
│  └── Edit Active Context + Pending Tasks                       │
│  └── Append Key Decisions nếu có chốt mới                      │
│  └── Commit memory.md CÙNG commit với bài viết                 │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  ⚠️ OUTPUT = Bài viết hoàn chỉnh + memory.md đã update         │
│  ❌ KHÔNG xuất: User Psychology Brief, Competitor Analysis      │
└─────────────────────────────────────────────────────────────────┘
```

### Phase 7 chi tiết: Session End Protocol — Update Memory

**Sau khi hoàn thành bài (Phase 0-6), AI BẮT BUỘC update `projects/{project}/memory.md` trước khi report completion cho user.**

Checklist 7 điểm:

```
[ ] Append entry mới vào Session History
    - Date: YYYY-MM-DD
    - CLI / Model: {Claude Code | Cursor | Codex | Gemini CLI}
    - Task Done: 1-2 dòng tóm tắt
    - Files Touched: file1.md, file2.md
    - Pending Carry-over: task chưa xong (nếu có)

[ ] Append article vừa viết vào Recent Articles
    - Date, Title, URL dự kiến, Cluster, Role, Style Variant

[ ] Edit Active Context
    - Cập nhật cluster đang ưu tiên nếu chuyển
    - Cập nhật content type focus của sprint
    - Cập nhật last_updated

[ ] Edit Pending Tasks
    - Xóa task vừa done
    - Thêm task mới phát sinh

[ ] Append Key Decisions nếu có chốt mới
    - Quyết định kỹ thuật/style đã chốt để không phải tranh luận lại

[ ] Refresh Quick Facts CHỈ KHI profile.md đổi
    - 80% case: KHÔNG cần update

[ ] Commit memory.md trong cùng commit với bài viết
    - Tránh memory dirty khi rollback bài viết
```

Mục đích: phiên tiếp theo mở CLI → AI đọc memory.md → có ngay context vừa chốt → không hỏi lại, không read lại profile.md / skill files.

Workflow chi tiết + bảo trì memory.md: `skills/project-memory/SKILL.md`.

---

## 11. Tích hợp với Style Mimicker

Khi viết cho một dự án cụ thể, Phase 5 (Voice Polish) sẽ sử dụng Style Profile tương ứng.

**Xem chi tiết**: `skills/style-mimicker/SKILL.md`

### Project-Style Mapping

| Project | Style Profile | Đặc điểm giọng văn |
|---------|---------------|-------------------|
| thep-bao-tin | ThepBaoTin | Chuyên gia ngành thép, B2B, tùy biến 4 loại bài (kiến thức/sản phẩm/so sánh/dự án) |
| binhnn-digital | BinhnnDigital | Confident, data-backed, provocative, VI-EN mix |
| hatcapherangxay | HatCaPheRangXay | Gần gũi, đam mê, chia sẻ kinh nghiệm 5 năm |

### Workflow khi có Style Profile

```
1. Hoàn thành Phase 0-4 của Content Writing
2. Load Style Profile từ skills/style-mimicker/profiles/
3. Áp dụng fingerprint:
   - sentence_length
   - vocabulary_level
   - tone
   - hook_style
   - transitions
   - closing_style
4. Check adherence với avoid list
5. Output: Bài viết với đúng giọng văn của dự án
```
