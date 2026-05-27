# Knowledge Note — Anti-AI Content Rules

**Trigger**: khi user nhắc "viết nội dung", "content writing", "anti-AI", "tránh AI", "humanize", "giọng văn", "AI detection", "Google phát hiện AI", "viết như người thật", "blacklist từ cấm".

> ⚠️ **BẮT BUỘC ĐỌC** khi viết bất kỳ nội dung nào. Rule này áp dụng cho TẤT CẢ content skills, TẤT CẢ projects, TẤT CẢ style profiles — không ngoại lệ.

## Mục đích

Hướng dẫn viết nội dung giống người thật, tránh bị Google Helpful Content System và AI detector phát hiện. Áp dụng kết hợp với style profile của từng dự án (`skills/style-mimicker/profiles/`).

## RULESET 1: TỪ CẤM — Vocabulary Blacklist

Các từ/cụm từ sau trigger AI footprint detection — **KHÔNG ĐƯỢC SỬ DỤNG**:

### 1A. Từ cấm tiếng Việt

| Nhóm | ❌ TRÁNH | ✅ THAY BẰNG | Lý do |
|------|----------|-------------|-------|
| **Cường điệu** | "Đột phá", "Cách mạng hóa" | Mô tả cụ thể kết quả thực | Cường điệu giải pháp thông thường |
| **Sáo rỗng** | "Chìa khóa" (vd: "Đây là chìa khóa để...") | Nói thẳng vào vấn đề | Pattern AI rất rõ |
| **Sáo rỗng** | "Cốt lõi" (vd: "Yếu tố cốt lõi là...") | Cụ thể hóa: "3 điều quyết định..." | Quá chung chung, AI lạm dụng |
| **Generic** | "Thúc đẩy" (vd: "Thúc đẩy doanh số") | "Tăng doanh số", "Bùng nổ doanh số" | AI dùng nhiều, vô vị |
| **Lạm dụng** | "Tối ưu hóa" (dùng >2 lần/bài) | "Cải thiện", "Điều chỉnh", "Nâng cấp" | Bị overuse trong nội dung AI |
| **Nhiệt tình giả** | "Đáng chú ý", "Thú vị thay", "Thật thú vị khi" | Trình bày thẳng thông tin | Padding không cần thiết |
| **Từ nối máy móc** | "Hơn nữa", "Ngoài ra", "Bên cạnh đó" | "Và", "Cộng thêm:", hoặc bỏ luôn | AI nối đoạn bằng mẫu cố định |
| **Kết luận** | "Tóm lại", "Nhìn chung" | "Như vậy,", "Lời khuyên là:" | AI luôn kết bằng mẫu này |

### 1B. Từ cấm tiếng Việt — MỞ RỘNG (bổ sung)

| ❌ TRÁNH | Mức lạm dụng | ✅ THAY BẰNG |
|----------|-------------|-------------|
| "Đắm chìm" (vd: "Đắm chìm trong thế giới...") | ⭐⭐⭐⭐ | Bỏ, vào thẳng nội dung |
| "Khám phá" (vd: "Hãy cùng khám phá...") | ⭐⭐⭐⭐⭐ | "Xem", "Tìm hiểu", hoặc bỏ luôn |
| "Tận dụng" (vd: "Tận dụng sức mạnh...") | ⭐⭐⭐⭐ | "Dùng", "Áp dụng" |
| "Toàn diện" (vd: "Hướng dẫn toàn diện") | ⭐⭐⭐⭐⭐ | "Đầy đủ", "Chi tiết", "Từ A-Z" |
| "Nổi bật" (vd: "Điểm nổi bật là...") | ⭐⭐⭐⭐ | Trình bày thẳng điểm đó |
| "Đa dạng" (vd: "Với sự đa dạng phong phú") | ⭐⭐⭐⭐ | Liệt kê cụ thể thay vì nói chung |
| "Không thể phủ nhận" | ⭐⭐⭐⭐ | "Thực tế cho thấy..." |
| "Đóng vai trò quan trọng" | ⭐⭐⭐⭐⭐ | Nói thẳng vai trò cụ thể |
| "Bức tranh toàn cảnh" | ⭐⭐⭐⭐ | "Tổng quan", "Nhìn chung thì" |
| "Hành trình" (vd: "Hành trình khám phá...") | ⭐⭐⭐⭐⭐ | "Quá trình", "Các bước" |
| "Nền tảng" (vd: "Xây dựng nền tảng vững chắc") | ⭐⭐⭐⭐ | "Cơ sở", hoặc cụ thể hóa |
| "Tiềm năng" (vd: "Khai phá tiềm năng") | ⭐⭐⭐⭐ | "Cơ hội", "Khả năng" cụ thể |
| "Bền vững" (vd: "Phát triển bền vững") | ⭐⭐⭐⭐ | Dùng ít, chỉ khi đúng ngữ cảnh |
| "Liền mạch" (vd: "Trải nghiệm liền mạch") | ⭐⭐⭐⭐ | "Mượt", "Không gián đoạn" |
| "Nâng tầm" (vd: "Nâng tầm trải nghiệm") | ⭐⭐⭐⭐ | "Cải thiện", "Tốt hơn" |
| "Trao quyền" | ⭐⭐⭐ | "Giúp", "Cho phép" |
| "Minh chứng" (vd: "Đây là minh chứng cho...") | ⭐⭐⭐ | "Ví dụ", "Bằng chứng" |
| "Xu hướng" (lạm dụng) | ⭐⭐⭐⭐ | Dùng ít, kèm data cụ thể |
| "Sâu sắc" (vd: "Hiểu biết sâu sắc") | ⭐⭐⭐⭐ | "Rõ ràng", "Chi tiết" |
| "Vô cùng" (vd: "Vô cùng quan trọng") | ⭐⭐⭐⭐ | "Rất", hoặc bỏ luôn |

### 1C. Từ cấm tiếng Anh (cho bài viết EN hoặc khi dùng thuật ngữ EN)

| ❌ TRÁNH | Mức lạm dụng | ✅ THAY BẰNG |
|----------|-------------|-------------|
| Delve / Delve into | ⭐⭐⭐⭐⭐ | Explore, Look at, Dig into |
| Tapestry | ⭐⭐⭐⭐⭐ | Bỏ hoàn toàn |
| Landscape (nghĩa bóng) | ⭐⭐⭐⭐⭐ | Space, Field, Market |
| Leverage | ⭐⭐⭐⭐⭐ | Use, Take advantage of |
| Crucial / Pivotal | ⭐⭐⭐⭐⭐ | Important, Key |
| Robust | ⭐⭐⭐⭐⭐ | Strong, Solid |
| Comprehensive | ⭐⭐⭐⭐⭐ | Full, Complete, Detailed |
| Seamless / Seamlessly | ⭐⭐⭐⭐⭐ | Smooth, Easy |
| Empower | ⭐⭐⭐⭐⭐ | Help, Enable |
| Streamline | ⭐⭐⭐⭐ | Simplify, Speed up |
| Navigate (nghĩa bóng) | ⭐⭐⭐⭐ | Deal with, Figure out |
| Foster | ⭐⭐⭐⭐ | Build, Grow, Encourage |
| Harness | ⭐⭐⭐⭐ | Use, Apply |
| Embark | ⭐⭐⭐⭐ | Start, Begin |
| Elevate | ⭐⭐⭐⭐ | Improve, Boost |
| Unleash | ⭐⭐⭐⭐ | Unlock, Release |
| Realm | ⭐⭐⭐⭐ | Area, Field |
| Paradigm | ⭐⭐⭐⭐ | Shift, Change, Model |
| Holistic | ⭐⭐⭐⭐ | Complete, Full, Whole |
| Groundbreaking / Revolutionary | ⭐⭐⭐ | New, First, Innovative |
| Cutting-edge / State-of-the-art | ⭐⭐⭐⭐ | Latest, Modern, Advanced |
| Advent (vd: "With the advent of AI...") | ⭐⭐⭐⭐ | Rise, Growth, Arrival |
| Myriad / Plethora | ⭐⭐⭐ | Many, Lots of, A ton of |
| Meticulous / Meticulously | ⭐⭐⭐⭐ | Careful, Detailed |
| Cornerstone / Testament | ⭐⭐⭐⭐ | Foundation, Core, Proof |

### 1D. Từ formal thay bằng từ đời thường (EN)

| ❌ AI dùng | ✅ Người thật dùng |
|-----------|-------------------|
| Utilize | Use |
| Facilitate | Help |
| Implement | Do / Set up |
| Commence | Start / Begin |
| Endeavor | Try / Attempt |
| Subsequently | Then / After that |
| Paramount | Really important |
| Elucidate | Explain / Clear up |
| Aforementioned | That / The one I mentioned |
| Pertaining to | About / Related to |
| Notwithstanding | Despite / Even though |
| Ameliorate | Improve / Fix |
| Juxtapose | Compare |
| Delineate | Outline / Describe |
| Culminate | End up / Lead to |

### 1E. Cụm tính từ kép AI hay dùng (EN)

```
❌ ever-evolving          →  ✅ always changing
❌ fast-paced             →  ✅ quick, busy
❌ thought-provoking      →  ✅ interesting
❌ forward-thinking       →  ✅ smart, ahead of the curve
❌ game-changing          →  ✅ big deal, important
❌ awe-inspiring          →  ✅ impressive
❌ all-encompassing       →  ✅ covers everything
❌ data-driven            →  ✅ based on data (dùng ít)
❌ results-oriented       →  ✅ focused on results
❌ user-centric           →  ✅ built for users
```

### 1F. Filler words AI hay chêm (EN + VN)

```
❌ Essentially / Về cơ bản (dùng quá nhiều)
❌ Fundamentally / Về bản chất
❌ Particularly / Đặc biệt (lạm dụng)
❌ Significantly / Đáng kể
❌ Additionally / Ngoài ra
❌ Subsequently / Sau đó
❌ Consequently / Do đó
❌ Ultimately / Cuối cùng
❌ Undoubtedly / Chắc chắn
❌ Arguably / Có thể nói
❌ Remarkably / Đáng chú ý
❌ Notably / Đáng lưu ý
❌ Increasingly / Ngày càng
```

> **Quy tắc**: Filler words không thêm giá trị cho câu. Nếu bỏ filler mà câu vẫn đúng nghĩa → BỎ.

## RULESET 2: CÂU MỞ ĐẦU / CHUYỂN TIẾP / KẾT THÚC — Structural Replacement

### 2A. Câu mở đầu BÀI VIẾT — PHẢI THAY THẾ

**Tiếng Việt:**

| ❌ TRÁNH (AI formula) | ✅ DÙNG (Human-like) |
|----------------------|---------------------|
| "Trong thế giới/kỷ nguyên số ngày nay..." | Vào thẳng vấn đề người đọc đang gặp |
| "Không thể phủ nhận rằng..." | "Thực tế cho thấy...", "Rất nhiều người gặp phải..." |
| "Hành trình khám phá..." | "Quá trình", "Các bước thực hiện" |
| "Như chúng ta đã biết..." | Đưa bằng chứng trực tiếp, không giả định reader đã biết |
| "Trong bài viết này, chúng ta sẽ..." | Tạo hook hấp dẫn, gợi ý giải pháp |
| "Điều quan trọng cần lưu ý là..." | Tách paragraph mới hoặc dùng bullet point để nhấn mạnh |
| "Trong bối cảnh [chủ đề] không ngừng phát triển..." | Nêu vấn đề cụ thể, có data |
| "Trong thời đại công nghệ 4.0..." | Nêu pain point thực tế |
| "Bạn đã bao giờ tự hỏi...?" | Dùng ít, chỉ khi thực sự là câu hỏi reader đang nghĩ |
| "[Chủ đề] đang trở thành xu hướng không thể bỏ qua..." | Đưa số liệu chứng minh |
| "Hãy tưởng tượng một thế giới nơi mà..." | Kể case thực, không cần tưởng tượng |
| "Dù bạn là người mới bắt đầu hay đã có kinh nghiệm..." | Xác định rõ target audience |
| "Hãy cùng đắm chìm vào thế giới của..." | Bỏ, vào thẳng nội dung |
| "Khi nói đến [chủ đề], điều đầu tiên chúng ta nghĩ tới là..." | Nói luôn điều đó, không vòng vo |

**Tiếng Anh:**

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "In today's fast-paced world..." | State the specific problem |
| "In the ever-evolving landscape of..." | Name the actual change happening |
| "In today's digital age..." | Skip, go straight to the point |
| "Have you ever wondered...?" | Use sparingly, only if genuinely provocative |
| "It's no secret that..." | Just state the fact |
| "Whether you're a seasoned professional or just starting out..." | Pick your target reader |
| "Picture this: ..." | Tell a real story instead |
| "Imagine a world where..." | Describe reality instead |
| "With the advent of [technology]..." | Name the specific tech and its real impact |
| "Gone are the days when..." | Say what's happening NOW |
| "The importance of [topic] cannot be overstated." | Show why with data, don't just claim |

### 2B. Câu mở đầu ĐOẠN VĂN — TRÁNH

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "Trước hết và quan trọng nhất..." | Nói luôn điều quan trọng |
| "Đáng chú ý rằng..." | Trình bày thẳng thông tin |
| "Điều thú vị là..." | Bỏ, nội dung tự nói lên |
| "Một trong những khía cạnh quan trọng của..." | Nói cụ thể khía cạnh nào |
| "Về cốt lõi..." | Vào thẳng điểm chính |
| "Nói một cách đơn giản..." | Giải thích đơn giản luôn |
| "Nhìn lại một cách tổng thể..." | Nêu nhận xét cụ thể |

### 2C. Câu chuyển đoạn — TRÁNH

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "Với điều đó trong đầu..." | Bắt đầu ý mới trực tiếp |
| "Điều này đưa chúng ta đến..." | Vào thẳng topic tiếp theo |
| "Bây giờ chúng ta đã thiết lập..." | Bỏ, reader đang đọc rồi |
| "Chuyển sang..." | Dùng heading mới |
| "Hãy xem xét kỹ hơn..." | Đi thẳng vào chi tiết |
| "Nhưng đó chưa phải là tất cả..." | "Và còn nữa:" hoặc bỏ |
| "Hơn nữa...", "Ngoài ra...", "Bên cạnh đó..." | "Và", "Cộng thêm:", hoặc bỏ |
| "Quan trọng không kém..." | Nói luôn điểm quan trọng |
| "Như đã đề cập trước đó..." | Bỏ, hoặc link nội bộ nếu cần |
| "Để minh họa cho điểm này..." | Đưa ví dụ luôn |

### 2D. Câu đệm / Filler — XÓA BỎ

| ❌ BỎ HOÀN TOÀN | Lý do |
|-----------------|-------|
| "Không cần phải nói rằng..." | Nếu không cần nói thì đừng nói |
| "Không cần nói thêm..." | Padding thuần |
| "Cuối cùng thì..." | Đi thẳng vào kết luận |
| "Khi mọi thứ đã nói và làm xong..." | Rườm rà |
| "Nói ngắn gọn..." | Nói ngắn gọn luôn |
| "Nói cách khác..." | Viết rõ từ đầu |
| "Cụ thể hơn..." | Cụ thể luôn |

### 2E. Câu kết luận — PHẢI THAY THẾ

**Tiếng Việt:**

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "Tóm lại, [chủ đề] không chỉ là... mà còn là..." | "Như vậy,", "Lời khuyên là:" |
| "Như chúng ta đã thấy qua bài viết này..." | Bỏ, đi thẳng vào recommendation |
| "Hy vọng bài viết đã mang đến cho bạn cái nhìn toàn diện..." | Bỏ hoàn toàn |
| "Hãy bắt đầu hành trình [chủ đề] của bạn ngay hôm nay!" | CTA cụ thể: liên hệ, đọc thêm, thử |
| "Tương lai của [chủ đề] đang rộng mở..." | Nêu action cụ thể reader nên làm |
| "Bạn đã sẵn sàng chưa? Hãy hành động ngay!" | CTA cụ thể với link |
| "Chúc bạn thành công trên hành trình [chủ đề]!" | Bỏ |

**Tiếng Anh:**

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "In conclusion, [topic] is a powerful tool that..." | Skip "In conclusion", restate thesis directly |
| "As we've explored in this article..." | Don't reference the article itself |
| "The future of [topic] is bright..." | Give specific prediction with reasoning |
| "The possibilities are endless." | Name 2-3 specific next steps |
| "So, what are you waiting for?" | Specific CTA |
| "Embracing [topic] is no longer optional — it's essential." | Show evidence, don't just claim |

### 2F. CTA rập khuôn — TRÁNH

| ❌ TRÁNH | ✅ THAY BẰNG |
|----------|-------------|
| "Bạn nghĩ sao? Hãy chia sẻ ý kiến trong phần bình luận!" | Đặt câu hỏi cụ thể liên quan đến nội dung |
| "Nếu thấy hữu ích, đừng quên chia sẻ bài viết nhé!" | Bỏ hoặc tích hợp tự nhiên |
| "Đăng ký để nhận thêm nhiều nội dung giá trị!" | CTA cụ thể: "Đọc tiếp bài [tên bài] để..." |
| "Bạn đã sẵn sàng? Nhấn vào link bên dưới!" | Inline link tự nhiên trong câu |

## RULESET 3: HÀNH VI VIẾT — Humanization Patterns

### 3.1. Biến thiên độ dài câu (Sentence Length Variation)
- **KHÔNG** viết các đoạn mà câu đều có độ dài tương đương và cấu trúc Chủ-Vị-Bổ cứng nhắc
- **PHẢI** xen kẽ: câu cực ngắn (3-5 từ) + câu mô tả dài hơn (15-25 từ)
- Dùng câu hỏi tu từ conversational xen giữa đoạn

```
✅ "Traffic giảm 40% trong 2 tuần. Không ai biết tại sao.
   Cuối cùng team mình phát hiện ra nguyên nhân là Google vừa cập nhật
   thuật toán đánh giá nội dung AI — và 70% bài trên site là AI viết."

❌ "Traffic của website đã giảm đáng kể trong khoảng thời gian hai tuần.
   Đội ngũ đã tiến hành điều tra nguyên nhân và phát hiện vấn đề.
   Google đã cập nhật thuật toán để đánh giá nội dung AI."
```

### 3.2. Anti-Listing Protocol
- **KHÔNG** tự động chia content thành "1. Mở đầu, 2. Nội dung, 3. Kết luận" máy móc
- **KHÔNG** viết "Bước 1, Bước 2, Bước 3" khô khan trừ khi prompt yêu cầu rõ ràng
- **PHẢI** tích hợp kịch bản thực tế và storytelling thay vì liệt kê lý thuyết suông
- **KHÔNG** luôn liệt kê đúng 3, 5, 7 hoặc 10 điểm (AI thích số lẻ/tròn) — số lẻ tự nhiên OK (4, 6, 8, 11...)
- **KHÔNG** viết bullet points quá cân đối (mỗi bullet gần cùng độ dài)

### 3.3. First-Person E-E-A-T Injection
Bài viết PHẢI có góc nhìn người thật — dùng ngôi thứ nhất:
- "Theo trải nghiệm của tôi tại dự án X..."
- "Tôi đã thử nghiệm và nhận thấy..."
- "Đội ngũ của chúng tôi đã làm..."
- "Tui từng mắc sai lầm này — và phải mất 3 tháng để fix..."

> Lưu ý: cách xưng hô (tui/tôi/mình) tuân theo style profile của từng dự án.

### 3.4. Pattern tiếng Việt đặc trưng AI — PHẢI TRÁNH

| Pattern AI | Ví dụ | Cách sửa |
|-----------|-------|----------|
| **Câu dài xuyên suốt, ít ngắt** | "Trong bối cảnh thế giới không ngừng phát triển với sự ra đời của nhiều công nghệ mới, việc cập nhật kiến thức và kỹ năng trở nên vô cùng quan trọng đối với mỗi cá nhân." | Tách thành 2-3 câu ngắn |
| **Lạm dụng "sự" + danh từ** | "Sự phát triển", "sự thay đổi", "sự quan trọng" | Dùng động từ: "phát triển nhanh", "thay đổi liên tục" |
| **Dùng "được" quá nhiều** | "Được biết đến", "được đánh giá", "được xem là" | Viết chủ động: "mọi người biết đến", "chuyên gia đánh giá" |
| **"không chỉ...mà còn"** | "Không chỉ giúp bạn tiết kiệm thời gian mà còn nâng cao hiệu suất" | Tách thành 2 câu đơn giản |
| **Lạm dụng "một cách"** | "Một cách hiệu quả", "một cách toàn diện", "một cách chuyên nghiệp" | Bỏ: "hiệu quả hơn", "chuyên nghiệp hơn" |
| **Dùng "Hãy" mệnh lệnh** | "Hãy nhớ rằng...", "Hãy bắt đầu...", "Hãy tưởng tượng..." | Dùng giọng đề xuất nhẹ: "Bạn nên...", "Thử..." |
| **Tone giảng dạy / thầy cô** | Luôn ở vị trí người hướng dẫn, ít ngang hàng | Viết ngang hàng, như chia sẻ giữa đồng nghiệp |

### 3.5. Pattern tiếng Anh đặc trưng AI — PHẢI TRÁNH

| Pattern AI | Ví dụ | Cách sửa |
|-----------|-------|----------|
| **Overuse passive voice** | "It should be noted that...", "It can be observed that..." | Viết chủ động |
| **Excessive hedging** | "It could potentially...", "This might perhaps..." | Nói thẳng, hoặc dùng "probably" 1 lần |
| **Paired conjunctions lặp** | "Not only...but also" 2+ lần/bài | Dùng tối đa 1 lần/bài |
| **Gerund phrases mở đầu** | "Leveraging technology...", "By implementing..." | Bắt đầu câu bằng subject |
| **"the" trước abstract nouns** | "The innovation", "The technology" (không cần) | Bỏ "the" khi không cần |
| **Quá nhiều hedging** | "It's important to note...", "It's worth mentioning..." | Bỏ, nói thẳng |
| **Số liệu mơ hồ** | "Research suggests...", "Studies have shown..." | Dẫn nguồn cụ thể: "Theo [tên nghiên cứu], [năm]..." |

### 3.6. Giọng văn AI vs Giọng văn Người — PHẢI NHỚ

| Đặc điểm AI | Cách người viết |
|-------------|-----------------|
| Quá trung lập — "Both options have their merits" | Có lập trường: "Tui chọn A, và đây là lý do" |
| Hedge quá nhiều — "It's arguably...", "Perhaps..." | Nói thẳng: "Đây là sự thật", "Tui tin là..." |
| Lạc quan thái quá — mọi thứ đều tích cực | Có nuance: mặt tốt + mặt xấu + caveat |
| Formal không cần thiết — "Utilize" thay "Use" | Dùng từ đơn giản, gần gũi |
| Liệt kê quá đều — 3-5 items cùng độ dài | Vary length, có item dài có item ngắn |
| Thiếu humor — nghiêm túc xuyên suốt | Thêm chút hài hước tự nhiên khi phù hợp |
| Đồng thuận mọi phía | Đứng hẳn một bên, giải thích tại sao |
| Quá hoàn hảo — không lỗi chính tả, không imperfection | Ngôn ngữ tự nhiên, cho phép informal |

## RULESET 4: TỰ KIỂM TRA — Final Self-Correction

**Trước khi hoàn thành bài viết**, bắt buộc chạy 3 bước kiểm tra:

### Bước 1: Find & Replace
- Quét toàn bộ bài tìm từ cấm ở Ruleset 1 (1A đến 1F) + mẫu câu ở Ruleset 2 (2A đến 2F)
- Xóa hoặc thay thế bằng cách viết tự nhiên
- Đặc biệt kiểm tra: "delve", "landscape", "comprehensive", "seamless" (EN) + "đột phá", "chìa khóa", "hành trình", "toàn diện" (VN)

### Bước 2: Tone Adjustment
- Giọng văn **KHÔNG ĐƯỢC** giống giáo sư hoặc phát ngôn viên
- Giọng văn **PHẢI** giống đồng nghiệp thân thiện đang chia sẻ kinh nghiệm thực
- Dùng lối nói bình dân, gần gũi (tuân theo style profile)

### Bước 3: Detail Enrichment
- Mỗi bài **PHẢI** có ít nhất 1-2 ví dụ thực tế cụ thể (ưu tiên thị trường VN)
- Tên thương hiệu thật, số liệu thật, hoặc kịch bản "bài học thất bại" (lessons learned)
- Mục đích: xây Trust + Expertise theo E-E-A-T

## RED FLAGS — 10 Dấu Hiệu Cảnh Báo AI

> Nếu bài viết có 3+ dấu hiệu dưới đây → XÁC SUẤT CAO bị phát hiện AI:

| # | Red Flag | Ví dụ |
|---|----------|-------|
| 1 | Dùng "delve" / "landscape" / "tapestry" | "Let's delve into the landscape of..." |
| 2 | Mở bài + kết bài đều dùng câu hỏi tu từ | "Have you ever...?" mở + "What are you waiting for?" kết |
| 3 | Liệt kê đúng 5 hoặc 10 tips/steps (con số "đẹp") | "10 Tips to...", "5 Steps to..." |
| 4 | Mỗi đoạn văn có độ dài gần giống nhau (±1-2 câu) | Đều đặn 3-4 câu/đoạn xuyên suốt bài |
| 5 | Không có MỘT lỗi chính tả hoặc ngữ pháp nào — quá hoàn hảo | Văn bản "sterile" |
| 6 | Dùng "landscape" khi không nói về phong cảnh thực | "The SEO landscape is evolving" |
| 7 | "Not only...but also" xuất hiện 2+ lần | Pattern quá rõ ràng |
| 8 | Thiếu hoàn toàn hyperlinks hoặc dẫn nguồn cụ thể | Nói "studies show" mà không link |
| 9 | Dùng "it's important to note" hoặc "it's worth mentioning" | Filler không cần thiết |
| 10 | Tiêu đề chứa "Ultimate Guide", "Everything You Need to Know", "A Deep Dive" | AI title template |

## Bảng phân loại mức độ AI

| Mức độ | Số dấu hiệu | Đánh giá |
|--------|-------------|----------|
| 🟢 Tự nhiên | 0-2 dấu hiệu | Có thể là người viết |
| 🟡 Nghi ngờ | 3-5 dấu hiệu | AI hỗ trợ, đã chỉnh sửa |
| 🟠 Khả năng cao | 6-8 dấu hiệu | AI viết, ít chỉnh sửa |
| 🔴 Chắc chắn AI | 9+ dấu hiệu | AI viết nguyên bản |

> **MỤC TIÊU: Mọi bài viết phải đạt mức 🟢 Tự nhiên (0-2 dấu hiệu).**

## 10 Mẹo viết "Người" hơn

1. **Kể chuyện cá nhân thật** — "Tôi từng thất bại khi...", "Lần đầu tôi thử..."
2. **Dùng slang / ngôn ngữ đời thường** — "Nói thật là...", "Mình từng nghĩ vậy nhưng..."
3. **Có quan điểm rõ ràng, thậm chí gây tranh cãi** — AI không dám controversial
4. **Viết câu ngắn, đứt gãy** — "Sai. Hoàn toàn sai."
5. **Tự mâu thuẫn rồi giải thích** — "Tôi biết điều này nghe vô lý, nhưng..."
6. **Dùng ví dụ cực kỳ cụ thể** — Tên, ngày, địa điểm, con số chính xác
7. **Thể hiện cảm xúc thật** — Bực mình, hào hứng, thất vọng, ngạc nhiên
8. **Viết lộn xộn có chủ đích** — Không phải lúc nào cũng cần bullet points
9. **Reference văn hóa đại chúng** — Phim, nhạc, meme, trend hiện tại
10. **Dám nói "Tôi không biết"** — AI hiếm khi thừa nhận giới hạn

## Cấu trúc bài AI điển hình — TRÁNH SAO CHÉP

```
❌ Cấu trúc AI điển hình (ĐỪNG LÀM):
├── Mở bài tổng quát (2-3 đoạn) + hook câu hỏi
├── "What is [Topic]?" — Luôn bắt đầu bằng định nghĩa
├── "Why [Topic] Matters" — 3-5 lý do, mỗi lý do 1 đoạn
├── "Key Benefits" — Bullet points
├── "How to [Action]" — Bước 1, 2, 3 tuần tự
├── "Best Practices / Tips" — 5-10 tips
├── "Common Mistakes" — Danh sách cảnh báo
├── "Future of [Topic]" — Dự đoán lạc quan
└── Kết luận + CTA generic
```

> **Cách khác biệt**: Bắt đầu bằng case thực, xen kẽ storytelling + data + opinion. Không cần follow template cố định. Mỗi bài có cấu trúc riêng phù hợp với nội dung.

## Checklist nhanh — Trước khi giao bài

- [ ] Không có từ cấm nào trong Ruleset 1 (1A-1F)?
- [ ] Không mở đầu bằng mẫu AI ở Ruleset 2 (2A)?
- [ ] Không có câu chuyển đoạn template (2C)?
- [ ] Không kết luận bằng mẫu AI (2E)?
- [ ] Không có CTA rập khuôn (2F)?
- [ ] Câu có biến thiên độ dài (ngắn xen dài)?
- [ ] Không viết bullet points quá đều tăm tắp?
- [ ] Có ít nhất 2-3 đoạn kinh nghiệm cá nhân/case study?
- [ ] Có quan điểm/lập trường rõ ràng (không trung lập hoàn toàn)?
- [ ] Giọng văn đúng style profile của dự án?
- [ ] Có ví dụ cụ thể VN (tên, số liệu, thương hiệu)?
- [ ] Kết luận không dùng "Tóm lại" / "Nhìn chung"?
- [ ] Không dùng filler words thừa (1F)?
- [ ] Mục tiêu: 🟢 Tự nhiên (0-2 red flags)?

## Cross-reference

- **Skill chính**: `skills/content/Content Writing/SKILL.md` (section 2.4)
- **Style profiles**: `skills/style-mimicker/profiles/` — PHẢI đọc trước khi viết
- **EEAT framework**: `knowledge/10-eeat-content-quality.md`
- **Content SEO**: `knowledge/04-content-seo.md`
