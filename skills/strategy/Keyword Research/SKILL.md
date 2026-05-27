# Keyword Research — Nghiên cứu từ khoá

## 1. Purpose / Mục đích
Keyword Research là bước **xác định nhu cầu tìm kiếm thật** mà người dùng đang gõ vào Google/Bing/AI search, từ đó chọn ra các truy vấn (queries) đáng đầu tư nội dung. Một bộ keyword tốt là bản đồ giúp toàn bộ chiến lược SEO (content, on-page, internal link, link building) bám vào nhu cầu người dùng có thật, có volume, và có khả năng chuyển đổi — thay vì viết theo cảm tính.

Skill này trả lời 3 câu hỏi:
- Người dùng tìm gì quanh chủ đề X?
- Truy vấn nào đáng làm trước (ưu tiên theo volume, intent, độ khó)?
- Chúng ta có cơ hội xếp hạng thực tế (realistic ranking opportunity) không?

## 2. Core Concepts / Khái niệm cốt lõi

- **Seed keyword**: từ khoá hạt nhân (ví dụ "cà phê", "crm", "running shoes") để mở rộng.
- **Long-tail keyword**: truy vấn dài, cụ thể (≥ 4 từ), volume thấp nhưng intent rõ và dễ rank.
- **Search Volume (SV)**: số lần search/tháng (Google Keyword Planner, Ahrefs, Semrush). Lưu ý SV của Vietnam thường bị làm tròn — chỉ dùng để so sánh tương đối.
- **Keyword Difficulty (KD)**: ước lượng độ khó SEO 0–100 dựa trên backlink profile của top 10. Mỗi tool có công thức riêng — đừng so sánh chéo Ahrefs KD vs Semrush KD.
- **Search Intent**: 4 nhóm (Informational, Navigational, Commercial, Transactional). Xem skill `Search Intent`.
- **SERP features**: featured snippet, PAA, video, image pack, local pack — quyết định CTR thực tế.
- **Keyword cannibalization**: 2+ trang cùng nhắm 1 keyword → site tự chia rẽ thứ hạng. Phòng ngừa bằng Keyword Clustering.
- **Topical authority**: Google đánh giá site theo cụm chủ đề. Research keyword phải có tư duy **cụm**, không phải từ rời rạc.

## 3. When to use / Khi nào dùng
- Trước khi launch website / blog mới.
- Trước mỗi quý content planning.
- Khi expand sang ngách mới, ngôn ngữ mới, thị trường mới.
- Khi traffic plateau — research lại để tìm gap.
- Trước khi viết bất kỳ pillar page hoặc money page nào.

Không cần làm lại research nếu chỉ refresh 1 bài cũ — chỉ cần check truy vấn mới phát sinh trong GSC (xem `Content Refresh`).

## 4. Workflow / Quy trình 7 bước

### Bước 1. Định nghĩa target audience & business outcome
- Persona: ai đọc? trình độ? pain point?
- Outcome: bài này phục vụ funnel nào (TOFU/MOFU/BOFU)?
- Sản phẩm/dịch vụ liên quan: nội dung phải kết nối được tới offering, tránh viết "vô danh".

### Bước 2. Brainstorm seed keywords
Lấy từ:
- Tên sản phẩm/dịch vụ và biến thể.
- Câu hỏi khách hàng hỏi sales/CS (audit chat log, Zendesk).
- Tên đối thủ + "alternative", "vs", "review", "pricing".
- Reddit, Quora, Facebook Group cùng ngách (search "site:reddit.com {topic}").
- Auto-suggest Google, Youtube, Amazon, TikTok.

Mục tiêu: 20–50 seed.

### Bước 3. Mở rộng bằng tools
- **Google Keyword Planner** (free, cần Google Ads account): SV, range, gợi ý.
- **Ahrefs Keywords Explorer**: matching terms, questions, also rank for, parent topic.
- **Semrush Keyword Magic Tool**: filter intent, SERP features.
- **AnswerThePublic / AlsoAsked**: câu hỏi dạng who/what/when/where/why/how.
- **Keyword Sheeter, Keyword Tool.io**: scrape autosuggest hàng loạt.
- **Google Search Console (nếu site đã có data)**: queries có impression > 50, CTR thấp = mỏ vàng.

Xuất ra master list (Google Sheet), giữ cột: keyword, SV, KD, intent, parent topic, source, SERP features.

### Bước 4. Lọc bỏ rác
Loại keyword:
- SV = 0 và không có biến thể trong cluster.
- Brand đối thủ mà mình không có cơ hội (trừ khi làm "X alternative").
- Trùng lặp ngữ nghĩa (sẽ được gộp ở bước Clustering).
- Off-topic, không khớp business.

### Bước 5. Đánh giá độ khó & cơ hội
Với mỗi keyword:
- Soi top 10 SERP thật (đừng tin KD của tool một chiều).
- Domain rating của top 10 trung bình bao nhiêu? Site mình có tiệm cận?
- Top 10 có forum/UGC không? (Reddit, Quora) → cơ hội lớn vì content chất lượng thấp.
- Có SERP feature nào (FS, PAA, Video) → cơ hội hoặc rủi ro chiếm CTR.
- "Parent topic" — Ahrefs cho biết keyword này nằm trong cluster nào.

Cho điểm 1–5: **Opportunity = (SV × Intent score × Conversion potential) / KD**.

### Bước 6. Phân nhóm theo intent + funnel
- TOFU (Informational): "what is X", "how to Y" → blog, video.
- MOFU (Commercial): "best X", "X vs Y", "X for Z" → comparison, listicle.
- BOFU (Transactional): "buy X", "X pricing", "X tool" → landing page, product page.
- Navigational: brand queries → đảm bảo home/brand page rank #1.

### Bước 7. Output → Keyword Map
Mỗi keyword/cluster → 1 URL target (1 URL có thể nhắm nhiều keyword cùng cluster). Đây là input cho Content Plan, Topic Clusters, Pillar Pages.

## 5. Template Google Sheet (cột bắt buộc)
| Keyword | SV | KD | Intent | Funnel | Parent Topic | SERP Features | Top 10 avg DR | Current Rank | Target URL | Priority (1-5) | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|

## 6. KPI đo lường
- Số keyword được map vào content plan / quý.
- % keyword có cơ hội rank top 20 trong 6 tháng (kiểm tra qua Rank Tracking).
- Tỉ lệ keyword đã có content / total mapped.
- Organic traffic theo cluster (group by parent topic trong GSC).
- Search visibility (Ahrefs/Semrush) toàn site.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Keyword Planner | Free | Volume, gợi ý, ổn định nhất cho VN |
| Google Search Console | Free | Mining queries từ data thật của site mình |
| Ahrefs Keywords Explorer | Paid | KD, parent topic, traffic potential |
| Semrush Keyword Magic | Paid | Intent filter, SERP feature filter |
| Keyword Insights | Paid | Clustering tự động bằng SERP overlap |
| AnswerThePublic | Freemium | Câu hỏi long-tail |
| AlsoAsked | Freemium | PAA tree |
| Keyword Tool.io | Freemium | Autosuggest YouTube/Amazon/TikTok |
| Glimpse / Google Trends | Free | Trend, tính mùa vụ |
| ChatGPT/Claude (LLM) | Freemium | Brainstorm seed, phân loại intent hàng loạt |

## 8. Common mistakes
- Chỉ chọn keyword theo SV mà bỏ qua intent → traffic không convert.
- Tin tuyệt đối vào KD của 1 tool, không soi SERP thật.
- Research rời rạc, không nhóm cluster → cannibalization.
- Bỏ qua long-tail vì SV thấp → mất 80% cơ hội rank nhanh.
- Không kiểm tra SERP feature → viết bài 3000 chữ trong khi top là video/PAA.
- Không update keyword list định kỳ — search behavior thay đổi liên tục, đặc biệt sau khi AI Overviews phổ biến.
- Quên check brand đối thủ và SKAGs — bỏ lỡ keyword "alternative", "vs", "review".

---
**Đầu ra của skill này** là bảng Keyword Map sẵn sàng cho Content Plan, Topic Clusters, và Pillar Pages.
