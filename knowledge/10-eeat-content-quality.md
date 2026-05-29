# Knowledge Note — E-E-A-T & Content Quality

**Trigger**: khi user nhắc "EEAT", "E-E-A-T", "helpful content", "content quality", "trust signal", "author authority", "expertise", "experience", hoặc khi cần đánh giá chất lượng nội dung.

## Mục đích

Đây là "rule" bắt buộc để tạo nội dung tuân thủ E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness) theo Google và các chuyên gia SEO hàng đầu thế giới như Marie Haynes, Brian Dean, Rand Fishkin. Sử dụng skill này khi tạo bài viết blog, review, hướng dẫn, hoặc bất kỳ nội dung SEO nào để tối ưu chất lượng, xây dựng niềm tin và cải thiện thứ hạng.

## Khái niệm cốt lõi

### E-E-A-T Framework (2026 — "E" đầu tiên là vũ khí)

> **Bổ sung 2026**: Trong 4 chữ E-E-A-T, chữ **E đầu tiên — Experience (Trải nghiệm thực tế)** là vũ khí duy nhất để bài viết vượt qua nội dung do AI viết. Việc gắn profile tác giả và không phóng đại tiêu đề chỉ là bề nổi.

| Yếu tố | Định nghĩa | Signal cần có |
|---------|------------|---------------|
| **Experience** ⭐ | Tác giả có trải nghiệm thực với chủ đề | Case study, ảnh gốc tác giả tự chụp, screenshot có annotation, video quá trình thực tế, "khi tôi thử nghiệm...", "thực tế tại thị trường VN cho thấy...", timeline cá nhân |
| **Expertise** | Tác giả có kiến thức chuyên sâu | Giải thích chính xác, cite nguồn uy tín, dùng thuật ngữ đúng |
| **Authoritativeness** | Tác giả/site được công nhận trong ngành | Author byline + credentials, backlink từ site uy tín, **ProfilePage schema** + sameAs LinkedIn/Twitter, được cite bởi người khác |
| **Trustworthiness** | Nội dung đáng tin cậy | Proof (số liệu, hình ảnh gốc), cite nguồn, transparent about limitations |

### Proof of Experience (bắt buộc 2026)

Mỗi bài phải có ít nhất 2 trong 4 loại Proof:

1. **Ảnh gốc (Original Image)** — tác giả tự chụp / thiết kế, có chi tiết chuyên ngành. **Từ chối hoàn toàn ảnh Stock vô hồn.**
2. **Screenshot có annotation** — chụp màn hình dữ liệu thực, mũi tên / circle highlight
3. **Video quá trình** — short-form (TikTok / YouTube Shorts) tác giả quay trực tiếp (ưu tiên nhúng để có Multimodal SEO + VideoObject schema)
4. **Quote trực tiếp từ experience** — "Khi tôi phân phối cho công trình X, lỗi thường gặp là..." — cụ thể, không generic

### Author Entity Verification (Authoritativeness 2026)

Profile tác giả dưới chân mỗi bài PHẢI có:
- Liên kết chéo **LinkedIn** + (Twitter hoặc platform chuyên ngành)
- Mã định danh rõ ràng (URL profile có tên thật, không ẩn danh)
- **Digital Footprint** về chủ đề đó trên Internet (ít nhất 3-5 bài dưới tên tác giả ở các platform khác)
- Schema **`ProfilePage`** JSON-LD gắn vào page tác giả, link `sameAs` tới tất cả platform

Thiếu 1 trong 4 → Google + LLM có thể coi bài như anonymous content → EEAT thiết hụt.

### Tiêu chuẩn "Nội dung hữu ích" của Google (Helpful Content)

**1. Nguyên tắc cốt lõi: Ưu tiên con người (People-first Content)**
Hệ thống xếp hạng của Google ưu tiên nội dung mang lại lợi ích thực sự cho người dùng, thay vì nội dung tạo ra chỉ để thao túng thứ hạng tìm kiếm. Nội dung cần thể hiện chuyên môn thực tế và giúp người đọc đạt được mục tiêu.

**2. Các câu hỏi tự đánh giá (Self-assessment Questions):**
- **Nội dung & Chất lượng:** Có cung cấp thông tin, báo cáo hay phân tích gốc (tự thực hiện) không? Có đầy đủ và toàn diện không? Tiêu đề có hữu ích và tránh phóng đại/gây sốc không? Bạn có tự tin muốn chia sẻ trang này không?
- **Giá trị gia tăng:** Nếu tham khảo từ nguồn khác, bạn có gia tăng thêm giá trị đáng kể thay vì chỉ sao chép/tóm tắt không?
- **Độ tin cậy:** Thông tin trình bày có đáng tin cậy không (có nguồn rõ ràng, bằng chứng chuyên gia, thông tin tác giả)? Nội dung có lỗi sai sự thật không?

**3. Những dấu hiệu cảnh báo cần tránh (Search-engine-first Content):**
- Tạo nội dung về quá nhiều chủ đề khác nhau chỉ với hy vọng "lên top".
- Sử dụng tự động hóa trên phạm vi rộng để sản xuất hàng loạt.
- Chủ yếu tóm tắt nội dung người khác mà không thêm giá trị (Zero information gain).
- Viết về chủ đề đang trend để câu traffic dù không có chuyên môn thực tế.
- Hứa hẹn trả lời câu hỏi thực ra chưa có đáp án.
- Thay đổi ngày tháng trên trang để trông có vẻ "mới" mà không cập nhật nội dung thực tế.

### Content Quality Rules — Bắt buộc

**PHẢI có:**
- Author byline + credentials rõ ràng + ProfilePage schema (2026)
- Last-updated date visible
- Cite nguồn khi đề cập số liệu/nghiên cứu
- Case study / ví dụ thực tế (không generic)
- Answer-first: trả lời câu hỏi chính trong 50-100 từ đầu (summary chunk để AI Overview trích dẫn)
- Original insight / data mà đối thủ không có
- Ít nhất 2/4 Proof of Experience (ảnh gốc / screenshot annotation / video / quote experience)
- Giọng văn ngôi 1 ("Tôi/Chúng tôi") kết hợp từ miêu tả cảm quan ("khi tôi thử nghiệm...")

**KHÔNG được:**
- Copy structure + thay chữ từ top 10
- Dùng số liệu không cite nguồn
- Viết về topic không có experience/expertise
- Generic filler ("Trong thời đại số ngày nay...")
- AI generate full không edit → footprint detect
- Dùng ảnh stock vô hồn thay vì ảnh gốc (2026 → EEAT “E” fail)
- Tác giả ẩn danh / không có LinkedIn / Digital Footprint → mất Author Entity

### Khung "Who – How – Why" (Sự minh bạch theo Google)
Để minh bạch và xây dựng lòng tin, Google khuyến nghị làm rõ 3 yếu tố này trong nội dung:
- **Who (Ai):** Ai là người tạo ra nội dung? Ghi rõ tên tác giả và thông tin tiểu sử để độc giả biết về chuyên môn của họ.
- **How (Cách thức):** Nội dung được tạo ra như thế nào? (VD: quy trình thử nghiệm, nguồn tài liệu, có sử dụng AI hỗ trợ không). Nếu dùng AI để tạo nội dung, hãy công bố rõ ràng.
- **Why (Lý do):** Tại sao nội dung này tồn tại? Mục đích chính PHẢI LÀ giúp đỡ mọi người. Nếu mục đích là để thao túng thứ hạng, đó là vi phạm chính sách.

Mỗi bài nếu trả lời rõ 3 câu này → tăng mạnh độ Trust.

### YMYL (Your Money Your Life)
- Topics ảnh hưởng sức khỏe, tài chính, an toàn, pháp luật
- Google đánh giá E-E-A-T nghiêm ngặt hơn cho YMYL
- Bắt buộc: cite nguồn chính thức, author có credentials, review bởi expert

## Workflow — EEAT Check per article (cập nhật 2026)

1. Verify author có experience/expertise với topic + **Digital Footprint có thực**
2. Check author byline + credentials hiển thị trên page
3. Check **`ProfilePage` schema** + `sameAs` links (LinkedIn / Twitter / báo chí)
4. Verify mọi số liệu có cite nguồn
5. Check có ít nhất 2/4 **Proof of Experience** (ảnh gốc / screenshot / video / quote)
6. Check answer-first (50-100 từ đầu = Summary Chunk cho AI Overview)
7. Check information gain vs top 10 + **vs AI Overview** (có gì mới AI không tự sinh được?)
8. Check last-updated date visible
9. Check không có generic filler / AI footprint / ảnh stock
10. Check giọng văn ngôi 1 ("Tôi/Chúng tôi" + miêu tả cảm quan)
11. YMYL check: nếu topic YMYL → verify expert review

## Khi nào dùng

- **Trước khi publish bất kỳ bài nào** — checklist bắt buộc
- Khi review draft content
- Khi audit bài underperform
- Khi Google update ảnh hưởng traffic (thường liên quan content quality)
- Khi brief writer

## Tools

- Google NLP API (entity + salience check)
- Originality.ai / GPTZero (AI footprint detect)
- Surfer / Frase (content score, entity coverage)
- Schema App / RankMath (Person schema)
- GSC (performance per author, per cluster)

## File tham chiếu

- `skills/content/Content Writing/SKILL.md` (EEAT checklist + GEO checklist + voice checklist)
- `skills/on-page/Content Optimization/SKILL.md`
- `skills/ai-seo/Content Optimization/SKILL.md`

## Common pitfall

- EEAT chỉ là "thêm author bio" → thiếu experience signal thực
- Cite nguồn nhưng nguồn outdated / low-quality
- Case study generic ("một khách hàng của chúng tôi") → không convincing
- Author không có expertise nhưng viết YMYL topic
- Helpful content = "viết dài hơn đối thủ" → sai, quality > length
- Information gain = 0 → bài chỉ tổng hợp lại top 10
- AI generate + thêm author name → vẫn thiếu experience signal
- Bỏ qua last-updated date → Google không biết content fresh
- Trust signal chỉ ở 1 bài → cần site-wide (About, Contact, Privacy, author pages)
- Không monitor Google updates → không biết khi nào quality bar thay đổi
