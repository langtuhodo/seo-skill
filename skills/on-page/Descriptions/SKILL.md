# Meta Description — Mô tả meta

## 1. Purpose / Mục đích
Meta description **không phải ranking factor trực tiếp**, nhưng là yếu tố quyết định **CTR thứ 2 sau title**. Meta tốt = thêm 5–15% CTR so với Google tự generate. Skill này tập trung vào persuasion + SERP differentiation, không phải nhồi keyword.

## 2. Core Concepts / Khái niệm cốt lõi

- **Pixel/Char limit**: ~155–160 ký tự Latin desktop, ~120 mobile. Tiếng Việt có dấu nên giữ ~120–140.
- **Google rewrite**: ~70% meta bị Google rewrite (cao hơn title). Lý do: meta không trả lời query cụ thể, thiếu context, hoặc Google muốn extract đoạn khớp query hơn.
- **Bold matching**: keyword trong query được Google bold trong snippet → tăng CTR. Đảm bảo description chứa keyword chính + biến thể.
- **Action language**: meta là mini-ad. Phải có verb + benefit + urgency/USP.
- **Khác title**: title tả "đây là trang gì", description tả "bạn sẽ đạt được gì khi click".

## 3. When to use
- Mỗi trang publish mới.
- Mỗi trang quan trọng (money page, pillar) — luôn có meta thủ công, không để CMS auto.
- Khi GSC cho thấy CTR thấp dù title ổn.
- Khi Google đang rewrite meta theo cách không có lợi.

## 4. Workflow viết meta description

### Bước 1. Xác định mục tiêu CTR
- Trang TOFU (informational): mục tiêu = subscribe/đọc tiếp → meta nhấn "bạn sẽ học được gì".
- Trang MOFU (commercial): mục tiêu = compare → meta nhấn USP, dữ liệu so sánh.
- Trang BOFU (transactional): mục tiêu = mua/đăng ký → meta nhấn benefit + CTA.

### Bước 2. Công thức viết
**Công thức 1** — Promise + Proof + CTA
> "Học cách [làm X] với [phương pháp Y] đã giúp [Z khách hàng]. [Tải template miễn phí]."

**Công thức 2** — Pain + Solution + Differentiator
> "Mệt vì [pain point]? [Tool/method] giúp bạn [solution] mà không cần [trade-off thường gặp]. Xem ngay."

**Công thức 3** — Numbered Specifics (best cho listicle)
> "12 chiến thuật SEO 2025 đã được test trên 200+ site VN. Tăng traffic 30% trong 90 ngày — kèm checklist tải miễn phí."

**Công thức 4** — Question echo (echo lại query của user)
> "{Câu hỏi của user}? Hướng dẫn từ chuyên gia 10 năm: [3 bullet ngắn]. Cập nhật {tháng/năm}."

### Bước 3. Inject keyword tự nhiên
- Keyword chính 1 lần.
- 1–2 biến thể long-tail (dạng query thường dùng).
- KHÔNG nhồi 3+ keyword giống nhau.

### Bước 4. Differentiate với top 10
- Đọc 10 meta đối thủ → tránh ngôn từ giống hệt.
- Tìm angle khác: persona ("dành cho freelancer"), trade-off ("không cần code"), authority ("từ chuyên gia 10 năm"), data ("đã test trên 100 site").

### Bước 5. Mobile preview
- Chrome DevTools mobile mode + tool simulator.
- 120 ký tự đầu là phần ai-cũng-thấy → câu chính phải nằm trong 120 ký tự đầu.

### Bước 6. Audit định kỳ
- 28 ngày sau publish: GSC → query nào Google bold? Có nên rewrite để bold thêm không?
- Trang nào CTR < benchmark → rewrite.

## 5. Template thư viện meta theo loại trang

**Blog How-to**:
> Hướng dẫn [làm X] [năm] dành cho [persona]: [3 bước/3 ý nổi bật]. Kèm [template/example/checklist] miễn phí.

**Listicle**:
> [Số] [thứ] tốt nhất cho [persona] năm [year]. So sánh giá, ưu điểm, hạn chế. Cập nhật [tháng/year].

**Comparison**:
> [A] vs [B]: so sánh [tính năng/giá/usability] dựa trên [tiêu chí]. Lựa chọn nào phù hợp với [persona]?

**Product/Service**:
> [Sản phẩm] giúp [audience] [outcome] trong [timeframe]. [USP] + [social proof]. Dùng thử miễn phí.

**Pillar**:
> Tất cả những gì bạn cần biết về [topic]: [4-5 sub-topic chính]. Cập nhật [year], do [expert/team] biên soạn.

## 6. KPI đo lường
- CTR uplift sau rewrite.
- % trang có meta thủ công / total.
- % meta bị Google rewrite / total (mục tiêu < 50%).
- # SERP impressions tăng nhờ bold-matching.
- Bounce rate tương quan: meta đúng kỳ vọng → bounce thấp.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Search Console | Free | CTR data, query bold matching |
| Yoast / RankMath | Free | Inline preview |
| Mangools SERP Simulator | Freemium | Pixel + mobile preview |
| Screaming Frog | Free/Paid | Audit dup/empty meta toàn site |
| ChatGPT/Claude | Freemium | Generate 10 meta candidates |
| Surfer / Frase | Paid | NLP suggest từ top 10 |

### Prompt LLM
```
Bạn là SEO copywriter. Viết 5 meta description cho URL: "{url}", target keyword "{keyword}", intent "{intent}". Yêu cầu:
- 130-150 ký tự (đếm cả khoảng trắng).
- Chứa keyword chính 1 lần, 1 biến thể.
- Có CTA cụ thể.
- Khác hẳn 5 meta sau (paste 5 meta đối thủ).
Trả về bảng: meta | char count | hook chính.
```

## 8. Common mistakes
- Bỏ trống meta → Google tự generate, thường không tối ưu.
- Sao chép intro làm meta → không persuasive.
- Nhồi keyword → bị rewrite hoặc trông spam.
- Quá dài → bị cut, mất CTA.
- Quá ngắn (< 70 ký tự) → bỏ phí real estate trên SERP.
- Meta giống nhau trên nhiều trang (pattern templated mà không tuỳ biến).
- Hứa quá → bounce cao + Google học và rewrite.
- Không có CTA hoặc CTA mơ hồ ("đọc thêm" thay vì "tải checklist miễn phí").

---
**Đầu ra**: mỗi URL có meta thủ công, được tracked CTR, có version history khi rewrite.
