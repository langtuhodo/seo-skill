# Tránh Văn AI — Audit & Viết Lại (Phong Cách Mặc Định _demo)

> File này là **style guide fallback** cho mọi yêu cầu viết bài KHÔNG gắn project + KHÔNG chỉ định style. AI sẽ đọc file này như tài liệu huấn luyện chính khi rơi vào chế độ `_demo`.
>
> Bản tiếng Anh gốc (do user cung cấp): xem `style-guide-en.md` cùng thư mục. Bản tiếng Việt này dịch + bổ sung bảng từ vựng AI-isms tiếng Việt riêng — chỉ áp dụng cho `_demo`, KHÔNG ghi đè `knowledge/15-anti-ai-content-rules.md`.

Bạn đang biên tập nội dung để loại bỏ các đặc trưng viết của AI ("AI-isms") — những dấu hiệu khiến văn bản đọc như máy sinh ra thay vì người viết.

## File này là gì và KHÔNG phải là gì

Đây là **công cụ kiểm tra chất lượng viết**, KHÔNG phải bản phán quyết "AI hay người". Các pattern liệt kê ở đây xuất hiện trong output của LLM nhiều hơn 5-20 lần so với văn người — nhưng người viết khi mệt, viết dưới sức ép deadline, viết thể loại lạ, hoặc viết bằng ngôn ngữ thứ hai cũng tạo ra cùng hình thức này. Các nghiên cứu độc lập về AI detector thương mại đã đo được tỉ lệ false-positive trên 60% với người viết tiếng Anh không phải bản xứ (Liang et al., Stanford, *Patterns* 2023), tỉ lệ phân loại sai >70% với detector mã nguồn mở (Jabarian & Imas, BFI Working Paper 2025-116), và adversarial paraphrase làm độ chính xác detection giảm ~88% (arXiv:2506.07001, 2025).

Các pattern này hữu ích như **tín hiệu** — vừa để bạn dọn dẹp bài viết của mình, vừa để đánh giá liệu một bài có vẻ máy sinh hay không. Nhưng đừng dùng chúng làm căn cứ duy nhất cho quyết định quan trọng (liêm chính học thuật, tuyển dụng, xuất bản, gán tác giả). Một số rule ở đây cũng bắt nhầm bài viết của người viết ngôn ngữ thứ hai, người viết deadline gấp, và thể loại kỹ thuật vốn dĩ phải nén từ vựng. Hãy kết hợp tín hiệu với ngữ cảnh: ai viết, thể loại gì, giọng văn thường ngày của người viết ra sao, có bằng chứng nào khác không.

Tóm lại: **tín hiệu, không phải bằng chứng**. Đáng để hành động, không đáng để hủy hoại một ngày của ai đó.

## Khi nào kích hoạt `_demo` fallback

AI rơi vào chế độ `_demo` khi và CHỈ khi cả 2 điều kiện sau đều đúng:

1. **Không có project name** trong yêu cầu (user không nói "viết cho thep-bao-tin", "binhnn-digital", "hatcapherangxay"... và không có context project nào đang active)
2. **Không có style name** trong yêu cầu (user không nói "viết theo phong cách X", "dùng style profile Y"...)

Khi rơi vào fallback:

| Hành vi | Áp dụng cho `_demo` |
|---------|---------------------|
| Output file path | `projects/_demo/writing/{yyyy-mm-dd}-{slug}.md` (date prefix vì không có cluster) |
| Style guide | File này (`projects/_demo/style-guide.md`) — đọc TRƯỚC khi viết |
| Internal link | **SKIP toàn bộ** (không có `keywords-urls.md`) |
| External cite | **SKIP whitelist check** (không có `external-sources.md`); chỉ cite nguồn rõ ràng nổi tiếng (Wikipedia, .gov, .edu, hãng lớn) và ghi note "ad-hoc citation — user review trước khi publish" |
| EEAT Author Entity | Bỏ qua (không có author context của project) |
| Brand voice | Bỏ qua (không có brand) — dùng neutral Vietnamese register theo file này |
| memory.md update | **KHÔNG cập nhật** memory bất kỳ project nào — ad-hoc không thuộc project |
| Session End | Log ngắn gọn vào response: "Đã viết ad-hoc tại `_demo/writing/{file}`. Không cập nhật memory project nào." |

## Modes

Skill này hoạt động ở một trong ba chế độ:

**`rewrite`** (mặc định) — Đánh dấu AI-isms và viết lại nội dung để sửa.

**`detect`** — Chỉ đánh dấu AI-isms, không viết lại. Dùng chế độ này khi:
- Người viết muốn xem cái gì bị flag và tự quyết định sửa
- Pattern bị flag có thể là cố ý (AI pattern không phải lúc nào cũng xấu — đôi khi hiệu quả với liều lượng nhỏ)
- Bạn đang audit văn bản không muốn bị thay đổi (nội dung đã xuất bản, bài người khác, tài liệu tham khảo)
- Bạn muốn scan nhanh, không chờ rewrite đầy đủ

**`edit`** — Chỉnh sửa file trực tiếp thay vì trả về văn bản đã viết lại. Dùng khi người viết chỉ vào file ("dọn `draft.md`", "fix AI-isms trong file này trực tiếp") và muốn file đó được sửa, không phải bản copy paste lại. Chỉnh **tối thiểu, có chủ đích** bằng Edit tool — chỉ sửa span bị flag, không sửa toàn bộ tài liệu. **Giữ nguyên đoạn đã human**: paragraph nào không có tell → không động. **Không sửa quote, code block, hoặc văn gán cho người khác** — flag chúng thay vì viết lại. File lớn → confirm section nào cần dọn trước khi sửa. Sửa xong → đọc lại file và confirm các pattern đã được resolve.

Trigger detect mode khi user nói "detect", "flag thôi", "audit thôi", "chỉ flag", "scan", "có AI pattern gì trong này", hoặc tương tự. Trigger edit mode khi user nêu tên file và yêu cầu fix/dọn tại chỗ. Default `rewrite` nếu không chỉ định.

**Cách gọi.** Ngôn ngữ tự nhiên là đủ ("viết lại với giọng blunt cho LinkedIn", "edit `post.md` tại chỗ", "scan này thôi, đừng viết lại"). Power user có thể truyền option: `[--mode rewrite|detect|edit]`, `[--voice casual|professional|technical|warm|blunt]`, `[--context linkedin|blog|technical-blog|investor-email|docs|casual]`, `[--file PATH]`, `[--iterate N]` (max 2).

**Lặp đến hội tụ (tùy chọn).** Rewrite mode đã chạy 1 corrective second pass (xem Output format) — pass đó *là* pass 2, nên `--iterate` không cộng dồn lên trên. Khi người viết yêu cầu "lặp đi", "tiếp tục đến khi sạch", hoặc pass `--iterate N`, lặp chu trình audit→rewrite đến khi không còn pattern hoặc đạt **N pass**. Giới hạn **N=2**: 1 rewrite + 1 corrective pass đã sạch flagged pattern; pass thứ 3 tốn full regeneration mà hiếm khi tìm thấy thêm. Báo cáo đã chạy bao nhiêu pass ("hội tụ sau 2 pass").

---

Ở chế độ **rewrite**, nhiệm vụ của bạn:

1. **Audit**: chỉ ra mọi AI-ism có mặt, trích dẫn text cụ thể
2. **Rewrite**: trả về bản sạch, đã loại mọi AI-ism
3. **Diff summary**: liệt kê ngắn những gì đã thay đổi và lý do

Ở chế độ **detect**:

1. **Audit**: như trên
2. **Assess**: chú thích flag nào là vấn đề rõ ràng vs pattern có thể cố ý hoặc hiệu quả trong ngữ cảnh

Ở chế độ **edit**:

1. **Đọc** file người viết nêu tên
2. **Edit tại chỗ**: áp minimal, targeted fix vào các span bị flag, để nguyên đoạn human
3. **Verify**: đọc lại file, confirm các pattern đã resolve, báo cáo những gì đã sửa

---

## Cần loại bỏ hoặc sửa

### Formatting (định dạng)

- **Gạch ngang dài (— và --)**: Thay bằng dấu phẩy, dấu chấm, dấu ngoặc đơn, hoặc tách thành hai câu. **Mục tiêu: 0**. Hard max: 1 trên 1.000 từ. Áp dụng cho cả heading và title, không chỉ body prose. Bắt cả Unicode em dash (—) và double-hyphen (--).
- **Lạm dụng in đậm**: Bỏ in đậm khỏi phần lớn cụm. Tối đa 1 cụm in đậm mỗi section lớn, hoặc không có. Nếu cụm đủ quan trọng để bold → restructure câu để dẫn đầu bằng nó.
- **Emoji trong heading**: Loại bỏ hoàn toàn. Không `## 🚀 Điều này nghĩa là gì`. Ngoại lệ: bài social có thể dùng 1-2 emoji tiết kiệm — cuối dòng, không bao giờ giữa câu.
- **Lạm dụng bullet list**: Convert những section bullet-nặng thành prose paragraph. Bullet chỉ cho nội dung thực sự list-like (so sánh tính năng, hướng dẫn step-by-step, parameter API).
- **Dấu nháy curly (" " ' ') và apostrophe**: Curly quote là **tín hiệu yếu** dán-từ-chat — chỉ có ý nghĩa trong ngữ cảnh plain-text như code comment, commit message, draft plaintext, nơi không có auto-curl. Coi là chứng cứ phụ, không bao giờ kết luận: Word, Google Docs, macOS, iOS đều auto-curl mặc định nên phần lớn văn người cũng có. Không flag curly apostrophe (U+2019) đứng một mình. Thay bằng straight quote trong plain-text/code; để nguyên trong publication hoàn chỉnh và punctuation đúng locale (Pháp « », Đức „ ").

### Cấu trúc câu

- **"Không phải X — mà là Y" / "Không phải về X, mà là về Y"**: Viết lại thành câu khẳng định trực tiếp. Tối đa 1 lần/bài, và chỉ khi nó phục vụ luận điểm.
- **Cường điệu rỗng**: Cắt `thật sự`, `quả thực`, `chân thực`, `nói thẳng ra`, `nói thật`, `cần lưu ý rằng`. Nói thẳng sự kiện.
- **Khen mơ hồ ("đáng [động từ]")**: Cắt hoặc thay `đáng đọc`, `đáng để ý`, `đáng xem`, `đáng khám phá`, `đáng thử`, `đáng dành thời gian`. Những cụm này thay một "thumbs up" generic cho một lý do cụ thể. Hãy nói *tại sao* nó quan trọng.
- **Hedging**: Cắt `có lẽ`, `có thể tiềm năng`, `cần lưu ý rằng`, `nói rõ ràng`. Nói thẳng luận điểm.
- **Thiếu câu cầu nối**: Mỗi paragraph nên kết nối với cái trước. Nếu paragraph có thể xáo trộn thứ tự mà reader không nhận ra → thiếu connective tissue.
- **Quy luật bộ 3 cưỡng bức**: Vary grouping. Dùng 2 items, 4 items, hoặc một câu đầy đủ thay vì bộ ba. Tối đa 1 pattern "tính từ, tính từ, và tính từ" mỗi bài.

---

### Từ và cụm cần thay — TIẾNG VIỆT

> Đây là bảng AI-isms tiếng Việt **bổ sung riêng cho `_demo`** — research từ corpus AI tiếng Việt phổ biến (ChatGPT, Gemini, Claude output cho prompt Việt) + kinh nghiệm content marketing VN. Cross-reference với `knowledge/15-anti-ai-content-rules.md` (file global cho mọi project).

#### Tier 1 (VN) — Luôn thay thế

| ❌ Thay | ✅ Bằng |
|---|---|
| đắm chìm / đắm mình vào | (bỏ, vào thẳng nội dung) |
| khám phá (khi mở bài: "Hãy cùng khám phá...") | "Xem", "Tìm hiểu", "Nhìn vào" |
| tận dụng | "dùng", "áp dụng" |
| toàn diện ("hướng dẫn toàn diện") | "đầy đủ", "chi tiết", "từ A-Z" |
| đột phá / cách mạng hóa | (mô tả cụ thể cái gì đã thay đổi) |
| chìa khóa ("đây là chìa khóa để...") | Nói thẳng vào vấn đề |
| cốt lõi ("yếu tố cốt lõi là...") | "3 điều quyết định...", "Yếu tố chính:" |
| đóng vai trò quan trọng | Nói thẳng vai trò cụ thể |
| nâng tầm ("nâng tầm trải nghiệm") | "cải thiện", "tốt hơn" |
| liền mạch ("trải nghiệm liền mạch") | "mượt", "không gián đoạn" |
| bức tranh toàn cảnh | "tổng quan", "nhìn chung" |
| hành trình ("hành trình khám phá...") | "quá trình", "các bước" |
| sâu sắc ("hiểu biết sâu sắc") | "rõ ràng", "chi tiết" |
| trao quyền | "giúp", "cho phép" |
| minh chứng ("đây là minh chứng cho...") | "ví dụ", "bằng chứng" |
| thúc đẩy ("thúc đẩy doanh số") | "tăng", "đẩy mạnh" (cụ thể) |
| tối ưu hóa (lạm dụng) | "cải thiện", "điều chỉnh", "nâng cấp" |
| không thể phủ nhận | "thực tế cho thấy..." |
| đáng chú ý / thú vị thay / thật thú vị khi | Bỏ, để nội dung tự nói lên |
| trong thời đại số / kỷ nguyên 4.0 / thời đại công nghệ hiện nay | Vào thẳng pain point cụ thể |
| như chúng ta đã biết | Đưa bằng chứng trực tiếp |
| trong bài viết này, chúng ta sẽ... | Tạo hook hấp dẫn, gợi ý giải pháp |
| điều quan trọng cần lưu ý là... | Tách paragraph hoặc bullet để nhấn mạnh |
| hơn nữa / ngoài ra / bên cạnh đó | "và", "cộng thêm:", hoặc bỏ luôn |
| tóm lại / nhìn chung | "Như vậy,", "Lời khuyên là:" |
| hy vọng bài viết hữu ích | (bỏ hoàn toàn) |
| chúc bạn thành công | (bỏ hoàn toàn) |
| bạn đã sẵn sàng chưa? Hãy hành động ngay! | CTA cụ thể với link |

#### Tier 2 (VN) — Flag khi 2+ xuất hiện cùng 1 paragraph

| ❌ Thay | ✅ Bằng |
|---|---|
| nổi bật ("điểm nổi bật là...") | Trình bày thẳng điểm đó |
| đa dạng / phong phú | Liệt kê cụ thể |
| ấn tượng | Tả cụ thể cái gì ấn tượng |
| hoàn hảo | Mô tả gì khiến nó hoàn hảo |
| tuyệt vời / xuất sắc | Cụ thể (vd: "tăng 40% conversion") |
| mạnh mẽ | "mạnh", hoặc cụ thể (vd: "8 core CPU") |
| linh hoạt | Mô tả cách linh hoạt |
| đáng giá | Nói tại sao đáng |
| nền tảng ("xây dựng nền tảng vững chắc") | "cơ sở", hoặc cụ thể |
| tiềm năng ("khai phá tiềm năng") | "cơ hội", "khả năng" cụ thể |
| bền vững (lạm dụng) | Chỉ dùng khi đúng ngữ cảnh môi trường |
| chất lượng cao | Cite metric cụ thể |
| đáp ứng nhu cầu | Mô tả nhu cầu nào |
| giải pháp tối ưu | Nói giải pháp nào, tại sao tối ưu |
| đa năng | Liệt kê chức năng cụ thể |
| thân thiện | "Thân thiện với ai", "Dễ dùng vì..." |
| tiện lợi | "Tiết kiệm bao nhiêu phút/click" |
| uy tín | Dẫn chứng (số năm, số khách, giấy phép) |
| trải nghiệm | Mô tả trải nghiệm gì cụ thể |

#### Tier 3 (VN) — Flag khi density cao (≥3% tổng từ)

| Từ | Hành động |
|---|---|
| rất / vô cùng / hết sức | Cắt phần lớn, giữ tối đa 1 lần/bài |
| thật sự / hoàn toàn / tuyệt đối | Cắt phần lớn |
| đáng kể | Thay bằng số liệu cụ thể |
| đặc biệt (lạm dụng) | Cắt phần lớn |
| ngày càng | Cite trend cụ thể |
| rõ ràng / cụ thể (filler) | Cắt khi không cần |
| chính xác / chính là (filler) | Cắt khi không cần |
| được (lạm dụng passive) | Viết chủ động |
| sự + danh từ ("sự phát triển", "sự thay đổi") | Dùng động từ: "phát triển nhanh", "thay đổi liên tục" |
| một cách + tính từ ("một cách hiệu quả") | Bỏ: "hiệu quả" |

#### Tier 3 phrases (VN) — Boilerplate cụm cần flag

Cụm nhiều từ riêng lẻ vô hại nhưng stack mạnh trong văn AI. Flag khi **2+ lần lặp cụm giống nhau** *hoặc* **3+ cụm khác nhau từ bảng này trong 1 bài** (cluster rule):

| Cụm | Cách sửa |
|---|---|
| trong bối cảnh [topic] không ngừng phát triển | Nêu vấn đề cụ thể, có data |
| [topic] đang trở thành xu hướng không thể bỏ qua | Đưa số liệu chứng minh |
| dù bạn là người mới bắt đầu hay đã có kinh nghiệm | Xác định rõ target audience, không "false breadth" |
| hãy tưởng tượng một thế giới nơi mà... | Kể case thực, không cần tưởng tượng |
| khi nói đến [topic], điều đầu tiên chúng ta nghĩ tới là... | Nói luôn điều đó, không vòng vo |
| trước hết và quan trọng nhất | Nói luôn điều quan trọng |
| một trong những khía cạnh quan trọng của... | Nói cụ thể khía cạnh nào |
| về cốt lõi / về cơ bản / về bản chất | Vào thẳng điểm chính |
| nói một cách đơn giản | Giải thích đơn giản luôn |
| với điều đó trong đầu | Bắt đầu ý mới trực tiếp |
| điều này đưa chúng ta đến... | Vào thẳng topic tiếp theo |
| nhưng đó chưa phải là tất cả | "Và còn nữa:" hoặc bỏ |
| như đã đề cập trước đó | Bỏ, hoặc link nội bộ nếu cần |
| để minh họa cho điểm này | Đưa ví dụ luôn |
| không cần phải nói rằng | Nếu không cần nói thì đừng nói |
| khi mọi thứ đã nói và làm xong | Rườm rà — bỏ |
| như chúng ta đã thấy qua bài viết này | Bỏ, đi thẳng vào recommendation |
| tương lai của [topic] đang rộng mở | Nêu action cụ thể reader nên làm |

#### Template phrases (VN) — Cấu trúc lắp ráp cần tránh

Những cấu trúc "lắp slot" báo hiệu câu được sinh ra, không phải viết ra. Nếu cụm có chỗ trống để thay danh từ/tính từ mà vẫn nghe giống nhau → quá generic.

- "**[tính từ] hành trình tới [tính từ] tương lai của [ngành]**" → mô tả capability cụ thể, benchmark, hoặc kết quả
- "**Không chỉ X mà còn Y**" (lạm dụng — tối đa 1 lần/bài) → tách thành 2 câu đơn
- "**X chính là chìa khóa để Y**" → nói thẳng X làm gì cho Y
- "**Sự kết hợp hoàn hảo giữa X và Y**" → mô tả cụ thể sự kết hợp
- "**Mang đến trải nghiệm X**" → nói trải nghiệm X là gì
- "**Đảm bảo X và Y**" → cite cách đảm bảo (cam kết, hợp đồng, SLA)
- "**Dù bạn là [X] hay [Y]**" → "false breadth", chọn 1 audience thực tế
- "**Tôi gần đây đã có vinh hạnh được [verb]**" → social/review pattern AI, nói luôn việc xảy ra: "Tôi đã nói chuyện với", "Tôi đã đọc", "Tôi đã tham dự"

#### Câu chuyển đoạn (VN) — Cần bỏ hoặc viết lại

- "**Hơn nữa / Bên cạnh đó / Ngoài ra**" → restructure để kết nối hiển nhiên, hoặc dùng "và", "cộng thêm:"
- "**Trong thời đại [X] / Trong kỷ nguyên mà**" → cắt hoặc nêu context cụ thể
- "**Đáng lưu ý là / Đáng chú ý là / Đáng để ý là**" → nói thẳng sự kiện
- "**Đây là phần thú vị / Điều đặc biệt nằm ở đây / Điểm nổi bật là**" → reader-steering frame. Để nội dung tự signal tầm quan trọng. Nếu cần lead-in → cụ thể hóa: "Con số doanh thu này quan trọng vì..."
- "**Tóm lại / Nhìn chung / Để kết luận**" → kết luận nên hiển nhiên từ nội dung
- "**Khi nói đến / Đối với**" → nói thẳng về thứ đó
- "**Cuối cùng thì / Sau cùng thì**" → cắt
- "**Nói như vậy / Nói như thế / Đã nói như vậy**" → cắt hoặc dùng "nhưng", "tuy nhiên" (đừng lạm dụng cái nào)

---

### Từ và cụm cần thay — TIẾNG ANH

Khi viết bài có thuật ngữ kỹ thuật tiếng Anh hoặc bài hỗn hợp Việt-Anh, áp dụng cả bảng tiếng Anh sau.

Từ được chia 3 tier theo độ tin cậy là tín hiệu AI. Cách phân tier — adapted from [brandonwise/humanizer](https://github.com/brandonwise/humanizer)'s vocabulary research — giảm false positive cho từ tự nhiên đứng riêng nhưng đáng ngờ khi cluster.

- **Tier 1 — Luôn flag.** Xuất hiện 5-20× nhiều hơn trong văn AI so với văn người. Thay ngay.
- **Tier 2 — Flag khi cluster.** Riêng lẻ thì OK, nhưng 2+ cùng 1 paragraph là tín hiệu mạnh.
- **Tier 3 — Flag theo density.** Từ thường, AI lạm dụng. Chỉ flag khi chiếm 3%+ tổng từ.

#### Tier 1 (EN) — Luôn thay

| Replace | With |
|---|---|
| delve / delve into | explore, dig into, look at |
| landscape (metaphor) | field, space, industry, world |
| tapestry | (describe the actual complexity) |
| realm | area, field, domain |
| paradigm | model, approach, framework |
| embark | start, begin |
| beacon | (rewrite entirely) |
| testament to | shows, proves, demonstrates |
| robust | strong, reliable, solid |
| comprehensive | thorough, complete, full |
| cutting-edge | latest, newest, advanced |
| leverage (verb) | use |
| pivotal | important, key, critical |
| underscores | highlights, shows |
| meticulous / meticulously | careful, detailed, precise |
| seamless / seamlessly | smooth, easy, without friction |
| game-changer / game-changing | describe what specifically changed |
| utilize | use |
| watershed moment | turning point, shift |
| nestled | is located, sits, is in |
| vibrant | (describe what makes it active, or cut) |
| thriving | growing, active (or cite a number) |
| showcasing | showing, demonstrating (or cut) |
| deep dive / dive into | look at, examine, explore |
| unpack / unpacking | explain, break down, walk through |
| bustling | busy, active (or cite what makes it busy) |
| intricate / intricacies | complex, detailed |
| ever-evolving | changing, growing |
| daunting | hard, difficult |
| holistic / holistically | complete, full, whole |
| actionable | practical, useful, concrete |
| impactful | effective, significant |
| learnings | lessons, findings, takeaways |
| thought leader / thought leadership | expert, authority |
| best practices | what works, proven methods |
| at its core | (cut — just state the thing) |
| synergy / synergies | (describe the actual combined effect) |
| in order to | to |
| due to the fact that | because |
| serves as | is |
| features (verb) | has, includes |
| boasts | has |
| commence | start, begin |
| ascertain | find out, determine |
| endeavor | effort, attempt, try |
| symphony (metaphor) | (describe the coordination) |
| embrace (metaphor) | adopt, accept, use |

#### Tier 2 (EN) — Flag khi 2+ trong cùng paragraph

| Replace | With |
|---|---|
| harness | use, take advantage of |
| navigate / navigating | work through, handle |
| foster | encourage, support, build |
| elevate | improve, raise, strengthen |
| unleash | release, enable, unlock |
| streamline | simplify, speed up |
| empower | enable, let, allow |
| bolster | support, strengthen |
| spearhead | lead, drive, run |
| resonate / resonates with | connect with, appeal to |
| revolutionize | change, transform |
| facilitate / facilitates | enable, help, allow |
| underpin | support, form the basis of |
| nuanced | specific, subtle |
| crucial | important, key, necessary |
| multifaceted | (describe the actual facets) |
| ecosystem (metaphor) | system, community, network |
| myriad | many, numerous |
| plethora | many, a lot of |
| encompass | include, cover, span |
| catalyze | start, trigger, accelerate |
| reimagine | rethink, redesign |
| galvanize | motivate, rally, push |
| augment | add to, expand |
| cultivate | build, develop, grow |
| illuminate | clarify, explain |
| elucidate | explain, clarify |
| juxtapose | compare, contrast |
| transformative / transformation | (describe what changed) |
| cornerstone | foundation, basis |
| paramount | most important, top priority |
| poised (to) | ready, set, about to |
| burgeoning | growing, emerging |
| nascent | new, early-stage |
| quintessential | typical, classic |
| overarching | main, central, broad |
| underpinning | basis, foundation |

#### Tier 3 (EN) — Flag khi density cao

| Word | Action |
|---|---|
| significant / significantly | Replace some with specifics: numbers, comparisons |
| innovative / innovation | Describe what's actually new |
| effective / effectively | Say how or cite a metric |
| dynamic / dynamics | Name the actual forces |
| scalable / scalability | Describe what scales |
| compelling | Say why it compels |
| unprecedented | Name the precedent it breaks |
| exceptional / exceptionally | Cite what makes it an exception |
| remarkable / remarkably | Say what's worth remarking on |
| sophisticated | Describe the sophistication |
| instrumental | Say what role it played |
| world-class / state-of-the-art / best-in-class | Cite a benchmark |

#### Tier 3 phrases (EN) — Multi-word boilerplate

Cụm nhiều từ vô hại riêng lẻ nhưng stack mạnh trong AI content (crypto, web3, DePIN, AI/infra review là kẻ phạm nhiều nhất). Flag khi **2+ lần dùng cùng cụm** (per-phrase rule), *plus* **cluster rule**: 3+ cụm khác nhau trong 1 bài là tín hiệu mạnh dù mỗi cụm chỉ xuất hiện 1 lần — đó là hình LLM khi vary boilerplate để có vẻ ít lặp.

| Phrase | What to do |
|---|---|
| emerging sector / emerging space | Name the actual sector |
| the integration of (X with Y) | Describe what's being integrated |
| the intersection of (X and Y) | Pick the specific overlap |
| community-driven | Name what the community does |
| long-term sustainability | Cite the time horizon |
| user engagement | Name the action |
| decentralized compute | Specify the architecture |
| (sustainable) reward emissions | Cite the emission schedule |
| tokenized incentive structures | Describe the actual mechanism |
| designed for long-term [X] | Cut "designed for" — then state the property |

---

### Pattern tiếng Việt đặc trưng — PHẢI TRÁNH

Đây là pattern AI **đặc thù tiếng Việt** (không có tương đương EN). Bổ sung cho `_demo` từ research corpus AI Việt:

| Pattern | Ví dụ AI | Cách sửa |
|---|---|---|
| **Lạm dụng "sự" + danh từ** | "sự phát triển", "sự thay đổi", "sự quan trọng" | Dùng động từ trực tiếp: "phát triển nhanh", "thay đổi liên tục" |
| **Lạm dụng "được" passive** | "được biết đến", "được đánh giá", "được xem là" | Viết chủ động: "mọi người biết đến", "chuyên gia đánh giá" |
| **Lạm dụng "một cách" + tính từ** | "một cách hiệu quả", "một cách toàn diện", "một cách chuyên nghiệp" | Bỏ "một cách": "hiệu quả hơn", "chuyên nghiệp hơn" |
| **"Không chỉ... mà còn..." lặp** | "Không chỉ X mà còn Y" 2+ lần/bài | Tối đa 1 lần/bài, tách thành 2 câu đơn |
| **"Hãy" mệnh lệnh** | "Hãy nhớ rằng...", "Hãy bắt đầu...", "Hãy tưởng tượng..." | Giọng đề xuất nhẹ: "Bạn nên...", "Thử..." |
| **Tone giảng dạy / thầy cô** | Luôn ở vị trí người hướng dẫn | Viết ngang hàng, như chia sẻ giữa đồng nghiệp |
| **Câu dài xuyên suốt, ít ngắt** | "Trong bối cảnh thế giới không ngừng phát triển với sự ra đời của nhiều công nghệ mới..." | Tách 2-3 câu ngắn |
| **Quá nhiều "thì, là, mà"** | "Điều mà tôi muốn nói là..." | Cắt: "Tôi muốn nói:" |
| **Lạm dụng "và/hoặc/cũng như"** trong 1 câu | Đại lượng cao | Tách thành câu riêng |
| **Phép song hành 3-thành-phần** ("X, Y, và Z") liên tục | "nhanh chóng, hiệu quả, và tiết kiệm" lặp đi lặp lại | Vary: 2 items hoặc 4 items, hoặc câu đầy đủ |

### Câu mở đầu bài (VN) — TRÁNH

| ❌ Tránh | ✅ Dùng |
|---|---|
| "Trong thời đại số ngày nay..." | Vào thẳng vấn đề người đọc đang gặp |
| "Trong bối cảnh hiện nay..." | Nêu pain point cụ thể |
| "Trong thời đại công nghệ 4.0..." | Nêu pain point thực tế |
| "Như chúng ta đã biết..." | Đưa bằng chứng trực tiếp |
| "Trong bài viết này, chúng ta sẽ..." | Tạo hook hấp dẫn |
| "Hãy cùng đắm chìm vào thế giới của..." | Bỏ, vào thẳng nội dung |
| "Bạn đã bao giờ tự hỏi...?" | Dùng tiết kiệm |
| "Hãy tưởng tượng một thế giới nơi mà..." | Kể case thực |
| "[Chủ đề] đang trở thành xu hướng không thể bỏ qua..." | Đưa số liệu chứng minh |

### Câu kết luận (VN) — TRÁNH

| ❌ Tránh | ✅ Dùng |
|---|---|
| "Tóm lại, [chủ đề] không chỉ là... mà còn là..." | "Như vậy,", "Lời khuyên là:" |
| "Như chúng ta đã thấy qua bài viết này..." | Bỏ, đi thẳng vào recommendation |
| "Hy vọng bài viết đã mang đến cho bạn cái nhìn toàn diện..." | Bỏ hoàn toàn |
| "Hãy bắt đầu hành trình [chủ đề] của bạn ngay hôm nay!" | CTA cụ thể: liên hệ, đọc thêm, thử |
| "Tương lai của [chủ đề] đang rộng mở..." | Nêu action cụ thể reader nên làm |
| "Bạn đã sẵn sàng chưa? Hãy hành động ngay!" | CTA cụ thể với link |
| "Chúc bạn thành công trên hành trình..." | Bỏ |

### CTA rập khuôn (VN) — TRÁNH

| ❌ Tránh | ✅ Dùng |
|---|---|
| "Bạn nghĩ sao? Hãy chia sẻ ý kiến trong phần bình luận!" | Đặt câu hỏi cụ thể liên quan đến nội dung |
| "Nếu thấy hữu ích, đừng quên chia sẻ bài viết nhé!" | Bỏ hoặc tích hợp tự nhiên |
| "Đăng ký để nhận thêm nhiều nội dung giá trị!" | CTA cụ thể: "Đọc tiếp bài [tên] để..." |
| "Bạn đã sẵn sàng? Nhấn vào link bên dưới!" | Inline link tự nhiên trong câu |

---

### Vấn đề cấu trúc (đa ngôn ngữ)

- **Độ dài paragraph đồng đều**: Vary có chủ ý. Bao gồm vài paragraph 1-2 câu và vài paragraph dài hơn. Nếu mọi paragraph cùng size → sửa.
- **Mở bài công thức**: Nếu bài mở bằng broad context trước khi vào điểm chính ("Trong thế giới đang phát triển nhanh chóng của..."), viết lại để lead bằng tin/insight. Context có thể đến sau.
- **Ngữ pháp quá sạch**: Đừng mài hết cá tính. Sentence fragment có chủ đích, câu bắt đầu bằng "Và" hoặc "Nhưng", comma splice cho hiệu ứng — nếu giọng tự nhiên dùng chúng, giữ lại.

### Cường điệu tầm quan trọng

- Cụm "đánh dấu một bước ngoặt trong sự tiến hóa của..." hoặc "khoảnh khắc lịch sử cho ngành" inflate sự kiện thường thành "lịch sử". Nói cái gì đã xảy ra và để reader tự đánh giá tầm quan trọng.
- Nếu câu vẫn work sau khi xóa mệnh đề inflation → xóa nó.

### Kết bài tương lai-generic

- "Có thể trở thành một trong những narrative quan trọng nhất của chu kỳ thị trường tới", "có thể trở thành xu hướng định hình của thập kỷ tới", "đang sẵn sàng trở thành chương lớn tiếp theo của [X]". AI default về shape này khi cần kết câu mà không commit vào claim falsifiable. Closer này grammatically là dự đoán nhưng không có nội dung testable.
- Pattern: modal (có thể / sẽ / có khả năng / sẵn sàng) + "trở thành" + (một trong) [tính từ nhất] + (narrative / câu chuyện / xu hướng / chủ đề / chương / phong trào / lực lượng).
- Sửa: chọn version falsifiable. "Giá DePIN compute có thể vượt AWS spot cho embarrassingly parallel workload đến 2027" là dự đoán. "Sự giao thoa giữa AI và DePIN có thể trở thành narrative quan trọng nhất" thì không.

### Dự đoán stack hedge

- Stack modal với hedge adverb: "có thể tiềm năng tạo ra", "có thể eventually unlock", "có thể ultimately thay đổi". Từ riêng lẻ thì OK; stack là tell. Mỗi hedge hủy hedge tiếp theo, để lại câu khẳng định không gì mà nghe có vẻ cẩn trọng.
- Sửa: chọn một. Nếu ý "có thể tạo ra" → nói thế. Nếu ý "có tiềm năng tạo ra" → nói thế. Cả hai cùng nhau là filler.

### Cường điệu "thực sự/đích thực"

- "On-chain tokenomic thực sự", "reward sustainability đích thực", "utility chân chính", "product-market fit thực sự". Dùng `thực sự` / `đích thực` / `chân chính` / `thực` như intensifier rỗng trên danh từ trừu tượng ngụ ý phần còn lại của field là giả/hời hợt — mà không tên thứ gì làm cho instance này là thực.
- **Ngoại lệ — contrast được nêu tên:** Nếu câu nêu rõ phiên bản giả/hời hợt là gì → giữ. "On-chain settlement thực sự, không phải bridged IOU" hoặc "doanh thu thực từ khách trả tiền, không phải grant" là contrastive writing trung thực. AI tell là contrast không nêu.
- Sửa khi không nêu contrast: bỏ tính từ và thêm claim cụ thể. "Reward sustainability" → "rewards funded from $X/mo in fees rather than emissions."

### Hashtag stuffing

- Block hashtag dài (6+ hashtag trên 1 short post) gần universal trong AI-generated social content và hiếm trong post người. Block thường mix project-specific tag với category tag rộng (#AI #Crypto #Web3 #Innovation) — category tag không giúp gì discoverability và đọc như bot output.
- **Vì sao 6?** Empirical floor. LinkedIn và X organic engagement plateau hoặc giảm sau 3-5 tag; post người vượt 5 thường là launch post đổi reach lấy engagement, trong khi LLM-generated default 10-15. 6 là threshold mà false positive trên human use bắt đầu rớt dưới false negative trên AI output. Detector treat 6+ là hard flag; spec treat 5+ là soft tell đáng nhìn lại trên `linkedin` và `investor-email` profile.
- Sửa: 2-3 tag cụ thể max, hoặc không. Nếu hashtag không giúp reader tìm related work → filler.

### Bullet list các noun phrase trần

- List 5+ bullet liên tiếp mỗi item là cụm tính-từ-danh-từ ngắn (≤6 từ) không có động từ. "Stable mining efficiency / Reliable pool connectivity / Optimized RandomX performance / Low failed share rates / Effective hardware utilization / Consistent thermal stability." Đọc như marketing one-pager vì đó là shape LLM default khi summarize features.
- Tell là *symmetry*: mỗi item cùng shape ngữ pháp, cùng độ dài, không item nào claim cái gì checkable. List quan sát thật sẽ có độ dài khác nhau, đôi khi có verb, ít nhất 1 item không fit pattern.
- Sửa: convert thành prose paragraph, hoặc rewrite items thành full claim ("Failed share giữ dưới 1% xuyên suốt 12-hour run" beat "Low failed share rates"). Nếu list thực sự là form đúng → vary items để mỗi item carry shape thông tin khác.
- Rule này **không** apply cho list nội dung thật (changelog, todo list, parameter doc, ingredient list) nơi noun phrase trần là form đúng. Detector key vào absence of finite verb để phân biệt — nhưng trong audit prose, hỏi liệu bullet đang summarize claim (rewrite) hay enumerate item (giữ).

### Tránh copula

- AI text tránh "là" và "có" bằng cách substitute động từ fancier: "đóng vai trò", "trình bày", "thể hiện", "đại diện cho", "tự hào sở hữu". Nghe như press release.
- Default về "là" hoặc "có" trừ khi động từ cụ thể hơn thực sự thêm nghĩa.

### Synonym cycling

- AI rotate synonym để tránh lặp từ: "developer... kỹ sư... practitioner... builder" trong cùng paragraph. Người viết lặp từ rõ nhất.
- Nếu cùng danh từ hay động từ xuất hiện 3 lần trong paragraph và đó là từ đúng → giữ cả 3. Vary cưỡng bức đọc như abuse thesaurus.

### Vague attribution

- "Chuyên gia cho rằng", "Nghiên cứu chỉ ra", "Nhiều nghiên cứu đã chứng minh", "Các lãnh đạo ngành đồng ý" — mà không nêu tên expert, study, hay leader. Hoặc cite specific source, hoặc bỏ attribution và state claim trực tiếp.

### Filler phrase

- Strip padding cơ học không thêm nghĩa:
  - "Cần lưu ý rằng" → (chỉ state nó)
  - "Về mặt" → (rewrite)
  - "Sự thật là" → (cut hoặc state claim)
- Note: "Để mà", "Do thực tế là", "Cuối cùng thì" đã cover trong bảng từ và section transition phía trên — không duplicate rule.

### Kết luận generic

- "Tương lai trông sáng", "Chỉ thời gian mới trả lời", "Một điều chắc chắn", "Khi chúng ta tiến lên" — filler ngụy trang kết luận. Cắt. Nếu bài cần closing thought → cụ thể cho luận điểm.

### Artifact chatbot

- "Hy vọng giúp được bạn!", "Chắc chắn rồi!", "Tuyệt đối!", "Câu hỏi hay!", "Cứ liên hệ", "Cho tôi biết nếu cần gì khác" — tic conversation từ chat interface, không phải writing. Xóa hoàn toàn.
- Watch for: "Trong bài viết này, chúng ta sẽ explore..." hoặc "Let's dive in!" / "Hãy cùng bắt đầu nào!" — meta-narration AI. Cắt hoặc rewrite với opening trực tiếp.

### Cấu trúc "Hãy" / "Let's"

- "Hãy explore", "Hãy take a look", "Hãy break this down", "Hãy examine" — AI dùng "hãy" như opener false-collaborative để ease vào topic. Filler delay actual point. Vào thẳng point. Pattern rộng hơn — flag bất kỳ "hãy + verb" function như transition thay vì invitation thật.

### Notability name-dropping

- AI pile prestigious citation để manufacture credibility: "được cite trong VnExpress, Tuổi Trẻ, Thanh Niên, và CafeBiz." Nếu nguồn matter → dùng với context: "Trong interview với VnExpress 2024, cô ấy lập luận..." Một reference cụ thể beat 4 name-drop.

### Superficial -ing analysis

- Chuỗi present participle dùng như pseudo-analysis: "symbolizing the region's commitment to progress, reflecting decades of investment, and showcasing a new era of collaboration." Nói gì không. Replace bằng fact cụ thể hoặc bỏ.
- Same move không có -ing: declarative "meaning-telling" gloss subject thường như profound — "điều này đại diện cho a broader shift", "decision symbolizes commitment to excellence", "nó nói lên một xu hướng lớn". Nếu significance thật → show với hậu quả cụ thể; nếu không → cắt.

### Ngôn ngữ promotional

- AI default về tourism-brochure prose: "tọa lạc giữa chân đồi tráng lệ", "trung tâm sôi động của đổi mới", "hệ sinh thái phát triển mạnh". Replace bằng mô tả thường: "là một thị trấn ở vùng Gonder", "có 12 startup". Nếu bạn không nói thế trong hội thoại → cắt.

### Thách thức công thức

- "Bất chấp thách thức, [subject] tiếp tục thrive" hoặc "Dù đối mặt với headwind, tổ chức vẫn resilient." Non-statement. Tên cái thách thức thực và phản ứng thực, hoặc bỏ.

### Phạm vi giả

- AI tạo breadth giả bằng pair extreme không liên quan: "từ Big Bang đến dark matter", "từ văn minh cổ đại đến startup hiện đại". Sound sweeping but say nothing. Liệt kê topic thực hoặc pick một cái matter.

### Bullet header-lặp

- Bullet list mỗi item start với bold header lặp: "**Performance:** Performance được cải thiện bởi..." Strip bold header và viết point trực tiếp. Nếu list item cần header → có lẽ nên là paragraph.

### Heading title-case

- AI over-capitalize heading: "Strategic Negotiations And Key Partnerships" thay vì "Strategic negotiations and key partnerships". Dùng sentence case cho subheading. Title case chỉ cho title chính của bài, nếu có.

### Lạm dụng hyphenated-pair

- AI stack compound modifier: "a high-quality, well-architected, future-proof solution." Hai vấn đề khác nhau. Một, density — string hyphenated adjective pile lên 1 noun; cắt về modifier thực sự matter. Hai, lỗi attributive/predicate: compound hyphenate *trước* noun ("a high-quality report") nhưng không *sau* linking verb ("the report is high quality", không hyphen). AI thường hyphenate predicate; fix về 2 từ.

### Disclaimer cutoff

- "Trong khi specific detail bị giới hạn dựa trên thông tin available", "Tính đến last update của tôi", "Tôi không có access real-time data". Đây là model limitation rò rỉ vào prose. Hoặc tìm thông tin hoặc xóa hedge. Đừng bao giờ publish câu thừa nhận writer không look up.

### Speculative gap-filling

- Khi model thiếu fact, fill gap với speculation hedged ngụy trang background: "duy trì profile public tương đối thấp", "được tin là đã", "có lẽ bắt đầu career tại", "có vẻ đã học". Đây là đoán formatted như statement. Phân biệt với cutoff disclaimer (admit gap) — cái này hide gap behind plausible-sounding filler, tệ hơn vì reader không phân biệt được biết thật vs invented. Cắt speculation hoặc replace bằng fact có nguồn.

### Placeholder chưa điền

- Bracketed slot-filler đáng lẽ phải replace trước publish: `[Tên của bạn]`, `[INSERT SOURCE URL]`, `[Mô tả section cụ thể]`, `2025-XX-XX`, `<!-- Thêm citation nếu có -->`. Đây là bằng chứng gần như chắc chắn AI-generated boilerplate paste mà không edit. Người dùng placeholder trong template, nhưng hiếm khi ship.
- Catch shape rõ ràng: `\[(?:Your|Insert|Add|Enter|Describe|Specify|Choose|Tên|Mô tả|Điền)[^\]]+\]`, `\b\d{4}-XX-XX\b`, HTML/Markdown comment với placeholder verb (`add`, `fill in`, `todo`, `insert`, `điền`).

### Rò rỉ markup citation chatbot

- Internal citation token rò rỉ khi text copy-paste từ chat UI: `citeturn0search0`, `contentReference[oaicite:0]{index=0}`, `oai_citation`, `[attached_file:1]`, `grok_card`. Đây không phải pattern — fingerprint. Presence của chúng là proof text generated bởi tool chat cụ thể và paste không cleanup.
- Fix mechanical: strip mọi markup token. Nếu citation có nghĩa → replace bằng real reference. Đừng try humanize markup — xóa.

### Tracking parameter AI-tool

- Tracking parameter AI tool auto-append vào URL chúng generate, survive copy-paste: `utm_source=chatgpt.com`, `utm_source=copilot.com`, `utm_source=openai`, `utm_source=claude.ai`, `utm_source=perplexity.ai`, `referrer=grok.com`. Same logic citation markup leak — presence của parameter là signature, không cần care text xung quanh đọc thế nào.
- Fix: strip parameter khỏi mọi URL. Giữ URL nếu link meaningful; lose parameter hoàn toàn.

### Cường điệu novelty

- AI text treat established concept như speaker invented/discovered: "Anh ấy introduce một term", "Cô ấy coin the phrase", "một concept không ai naming", "một failure mode không ai talks about". Thực tế, hầu hết idea là application của concept hiện có, không phải invention.
- Hai vấn đề. Một, factually risky: nếu concept đã có Wikipedia page hoặc conference talk năm ngoái → claim novelty làm writer look uninformed. Hai, flatter subject theo cách đọc promotional thay vì analytical.
- Fix: mô tả người *làm gì với* concept, không phải họ discover. "Michel walked through cách context poisoning works in practice" thay vì "Michel introduce term tôi chưa nghe: context poisoning". Nếu không chắc novel → assume không và frame accordingly.
- Pattern liên quan để flag: "failure mode không ai naming", "vấn đề không ai talks about", "insight mọi người đang missing", "điều không ai tell bạn về". Đây là framing engagement-bait claim scarcity của knowledge không tồn tại.

### Hook engagement infomercial

- Hook fragment punchy tee up reveal: "Bí mật?", "Twist?", "Đây là điều quan trọng.", "Plot twist:", "Phần tốt nhất?", "Kết quả?". AI dùng để fake momentum và manufacture suspense quanh thông tin thường — prose equivalent của infomercial khuya.
- Phân biệt với rhetorical question opener (stall trước point) và chatbot artifact (perform helpfulness): đây là mid-flow teaser pad rhythm. Fix là xóa hook và state thing. "Bí mật? Chỉ hoạt động cuối tuần." trở thành "Chỉ hoạt động cuối tuần."

### Flatline cảm xúc

- AI claim emotion như structural crutch không convey through writing: "Điều surprised tôi nhất là", "Tôi fascinated khi discover", "Điều đã struck tôi là", "Tôi excited khi learn", "Phần interesting nhất". Và variant section-header trần: "Phần interesting của project:" / "Điều interesting ở đây:" / "Aspect interesting:". Form header drop "nhất" nhưng làm cùng job — pre-announce significance mà writing không earn.
- Hai vấn đề. Một, tell-don't-show: nếu thứ genuinely surprising → reader nên feel từ content, không từ writer announce. Hai, các cụm này massively overused như list intro và transition. Filler mặc emotion costume.
- Pattern này không phải lúc nào cũng AI. Cũng là dấu lazy human writing on autopilot. Flag dù sao.
- Fix không phải "đừng bao giờ nói surprised". Là: nếu claim emotion → writing xung quanh nên earn. Otherwise cắt claim và present thing trực tiếp.
- Pattern liên quan: "hit differently" / "đánh khác hẳn". AI dùng colloquialism trendy như shortcut để sound relatable mà không earn emotional beat. Nếu thứ genuinely affect bạn → mô tả how. Otherwise cắt.

### Cấu trúc nhượng bộ giả

- "Mặc dù X impressive, Y vẫn là thách thức" hoặc "Dù X đã strides, Y vẫn là open question". AI dùng để sound balanced mà không actually weigh. Cả 2 nửa đều mơ hồ. Hoặc make concession specific (name impressive thật, name thách thức thật) hoặc pick một bên và lập luận.

### Câu hỏi tu từ mở đầu

- "Nhưng điều này có nghĩa gì cho developer?" / "Vậy tại sao bạn nên care?" / "Tiếp theo là gì?" — AI dùng câu hỏi tu từ để stall trước actual point. Nếu biết answer → nói luôn. Câu hỏi tu từ earn bằng setup mạnh, không drop như section transition.

### Hedging trong dấu ngoặc

- "(và, increasingly, Z)" / "(hoặc, more precisely, Y)" / "(và perhaps more importantly, W)" — AI insert parenthetical aside để sound nuanced mà không commit. Nếu aside matter → cho nó câu riêng. Nếu không → cắt.

### Inflate numbered list

- "3 điều rút ra chính" / "5 things to know" / "Top 7 cái" — AI default numbered list vì structurally safe. Chỉ dùng numbered list khi content genuinely có discrete, parallel item. Nếu pad để hit number → list không nên tồn tại.

### Artifact chuỗi reasoning

- "Hãy nghĩ step by step", "Breaking this down", "Để approach systematic", "Step 1:", "Đây là thought process của tôi", "Đầu tiên, let's consider", "Working through this logically" — artifact chain-of-thought reasoning leak vào published prose. Reader không cần xem scaffolding. State conclusion, rồi evidence.

### Tone nịnh

- "Câu hỏi tuyệt vời!", "Excellent point!", "Bạn nói đúng hoàn toàn!", "Đó là một observation insightful" — reward conversation từ chat interface, không phải writing. Remove entirely.
- Phân biệt với chatbot artifact: nịnh specifically validate reader/questioner thay vì chỉ perform helpfulness.

### Vòng acknowledgment

- "Bạn đang hỏi về", "Câu hỏi liệu", "Để trả lời câu hỏi của bạn", "Đó là câu hỏi tuyệt vời. The..." — AI restate prompt trước khi trả lời. Trong writing → pure filler. Reader biết họ hỏi gì. Trả lời luôn.

### Cụm confidence calibration

- "Cần lưu ý rằng", "Interestingly", "Đáng ngạc nhiên", "Importantly", "Đáng kể", "Notably", "Chắc chắn", "Không nghi ngờ", "Không một chút nghi ngờ" — AI dùng để signal reader nên feel thế nào về fact thay vì để fact tự nói.
- "Đây là phần interesting", "Đây là interesting part", "Đây là parts tôi thấy interesting" — reader-steering cue pre-interpret importance. Work khi followed bởi data genuinely surprising; fail khi introduce restatement of obvious thing.
- Một "notably" trong bài 2.000 từ là OK. Ba lần trong 500 từ là AI-style emphasis stacking. Flag theo density.

### Self-labeling significance

- Sau khi liệt kê hoặc mô tả vài item, writer point back vào một và label là contrarian / clever / surprising / counterintuitive / key: "Move cuối là contrarian", "Đây là phần interesting", "Bullet thứ 3 là real story", "Đây là chỗ trở nên clever", "Bit cuối là counterintuitive".
- Label làm việc mà content lẽ ra phải làm. Nếu move genuinely contrarian → reader nhận ra từ mô tả; nếu không recognize không có label → label không earn.
- Fix: cắt câu labeling và để explanation theo sau làm việc trực tiếp. Hoặc restructure để item bạn muốn highlight position đầu hoặc expand với specific, làm label redundant.

### Cấu trúc quá nhiều

- Quá nhiều heading trong text ngắn: hơn 3 heading dưới 300 từ gần như luôn là AI try look organized. Merge section hoặc dùng prose transition.
- Quá nhiều bullet item: 8+ bullet point dưới 200 từ → content nên là paragraph, không phải list.
- Section header công thức: "Tổng quan", "Điểm chính", "Tóm tắt", "Kết luận", "Giới thiệu" — default AI scaffolding. Dùng header tell reader cụ thể về cái gì follow.

### Rhythm và uniformity

Đây không phải vấn đề từng từ/cụm — pattern trong cách text flow tổng thể. Văn AI metronomic; văn người có rhythm vary.

**Cấu trúc là tín hiệu detection #1.** AI detection tool (gồm Pangram, train classifier trên 28M document người) weight regular structural cao hơn vocabulary. Sentence construction nhất quán, pacing đồng đều, phrasing symmetric khó mask hơn swap vài flagged word. Fix mọi từ Tier 1 mà để rhythm nguyên → text vẫn đọc như AI.

- **Sentence length uniformity**: Nếu phần lớn câu 15-25 từ → robotic. Mix câu ngắn punchy (3-8 từ) với câu dài flowing (20+). Fragment work. Câu hỏi break monotony.
- **Paragraph length uniformity**: Mỗi paragraph 3-5 câu cùng size → vary có chủ ý. Vài paragraph nên là 1 câu. Vài paragraph nên dài hơn.
- **Vocabulary repetition vs synonym cycling**: AI hoặc lặp cùng từ mechanical, hoặc cycle synonym conspicuous. Người writer lặp khi từ đúng, vary khi tự nhiên — không công thức.
- **Read-aloud test**: Nếu text sound như text-to-speech engine đọc không weird → probably quá uniform. Văn người có rhythm resist robotic delivery.
- **Thiếu first-person**: Nơi phù hợp, writer nên có opinion, preference, reaction. AI relentlessly neutral. Nếu bài supposed có voice mà thiếu "tôi nghĩ", "theo kinh nghiệm tôi", hoặc stated preference → AI tell.
- **Over-polishing**: Aggressively edit out mọi irregularity có thể push human writing *về phía* AI statistical profile. Disfluency tự nhiên, word choice idiosyncratic, pacing uneven là cái giữ text out of "AI-generated" classification. Đừng mài hết cá tính theo đuổi clean prose.

### Vocabulary diversity (stylometric)

Bài dài (200+ từ), nhìn vocabulary text thực sự dùng. Type-token ratio (TTR) — distinct word type chia tổng token — là stylometric signal cổ điển dễ đọc bằng mắt. Human prose ở độ dài này thường rơi khoảng 0.50-0.65 tiếng Anh; tiếng Việt do tính chất từ ghép có thể thấp hơn (~0.40-0.55). AI text trend flatter, đôi khi drift dưới 0.35 khi model lock vào vocabulary loop nhỏ.

TTR rất thấp không phải proof AI authorship — topic hẹp, technical reference, second-language writing đều legitimately compress vocabulary. Nhưng trên general prose mong đợi range (essay, article, social >200 từ), TTR dưới 0.35 đáng look lại. Fix hiếm khi là thesaurus text; mà broaden *cái gì* — name thing cụ thể, cite case cụ thể, replace abstract noun re-use bằng concrete instance.

### Paragraph-reshuffle immunity (structure test)

- Diagnostic writer-side, không phải regex: bạn có thể swap 2 body paragraph mà không break bài không? Nếu order không matter → bạn viết list of points, không phải argument build. Văn AI thường fail — mỗi paragraph self-contained module không có load-bearing connection.
- Fix là structural, không lexical: establish through-line mà mỗi paragraph depend vào cái trước. Nếu paragraph genuinely independent → quyết định bài nên là explicit list, hoặc thiếu thesis.

### Treadmill effect / low information density (content test)

- Writer-side test khác: đọc mỗi paragraph và hỏi "thực sự có gì mới ở đây?" Văn AI thường restate premise bằng từ mới thay vì advance — nhiều motion, không distance covered. Tell là bạn có thể cắt 40-60% mà không mất thông tin.
- Fix: với mỗi paragraph, name một fact, claim, hoặc turn nó contribute. Nếu không có → cắt. Nếu có → lead bằng nó và drop throat-clearing.

### Khi nào rewrite from scratch vs patch

Nếu text có 5+ flagged vocabulary hit qua nhiều category, 3+ distinct pattern category triggered, và uniform sentence/paragraph length → patching individual phrase không fix — structure itself là AI-generated. Advise full rewrite: state core point trong 1 câu, rồi rebuild from there.

---

## Severity tier

Không phải mọi AI-ism bằng nhau. Khi quick pass hoặc triage tài liệu lớn → priority theo tier:

### P0 — Killer credibility (sửa ngay)
- Cutoff disclaimer ("Tính đến last update")
- Chatbot artifact ("Hy vọng giúp được bạn!", "Câu hỏi tuyệt vời!")
- Vague attribution không source ("Chuyên gia cho rằng")
- Significance inflation trên sự kiện thường
- Hashtag stuffing trên `linkedin` và `investor-email` post (severity vary theo profile)

### P1 — Mùi AI rõ (sửa trước publish)
- Vi phạm word list (delve, tận dụng, comprehensive, toàn diện, đột phá, robust...)
- Template phrase và slot-fill construction
- Opener "Hãy" / "Let's"
- Synonym cycling trong paragraph
- Opening công thức ("Trong thế giới đang phát triển nhanh chóng của...")
- Lạm dụng bold
- Em dash frequency (trên 1/1000 từ)
- Future-narrative closer generic
- Hedge-stacked prediction ("có thể tiềm năng", "có thể eventually")
- Cường điệu "thực sự / đích thực" trên abstract noun
- Bullet list noun phrase trần (5+ item ngắn adj+noun, không verb)
- Tier 3 phrase clustering (≥3 cụm boilerplate distinct trong 1 bài)

### P2 — Polish stylistic (sửa khi có thời gian)
- Generic conclusion ("Tương lai trông sáng")
- Compulsive rule of three
- Uniform paragraph length
- Copula avoidance (đóng vai trò, trình bày, sở hữu)
- Transition phrase (Hơn nữa, Ngoài ra, Bên cạnh đó)
- Hashtag stuffing (profile `blog`/`technical-blog`)
- Tier 3 phrase repetition (single phrase ≥2× — fine isolation, suspect stack)

Dùng P0+P1 cho quick pass. Full audit cover cả 3 tier.

---

## Self-reference escape hatch

Khi viết *về* AI writing pattern (blog post, tutorial, skill documentation như file này), quoted example exempt khỏi flagging. Text trong dấu nháy, code block, hoặc explicitly marked như illustrative ("ví dụ, AI có thể viết...") không nên rewrite. Chỉ flag pattern xuất hiện trong prose của author, không phải trong cited example of bad writing.

---

## Context profile

Pass context hint tùy chọn để adjust strictness rule. Nếu không context specified → auto-detect từ content cue (short + hashtag = social, code block = technical, salutation = email, default = blog).

### Profile definition

- **`linkedin`** — Short-form social. Punchy fragment, visual formatting matter.
- **`blog`** — Default. Standard long-form prose. Mọi rule apply full strength.
- **`technical-blog`** — Long-form với code, architecture, API. Thuật ngữ technical được pass.
- **`investor-email`** — Audience high-trust. Tighten mọi thứ; promotional language là risk lớn nhất.
- **`docs`** — Documentation, README, guide. Clarity over voice.
- **`casual`** — Slack message, internal note, quick reply. Chỉ catch worst offender.

### Tolerance matrix

Rule không listed trong table apply full strength qua mọi profile.

| Rule | linkedin | blog | technical-blog | investor-email | docs | casual |
|------|----------|------|----------------|----------------|------|--------|
| Em dash | relaxed (2/post OK) | strict | strict | strict | relaxed | skip |
| Lạm dụng bold | relaxed (bold hook OK) | strict | strict | strict | relaxed | skip |
| Emoji trong header | relaxed (1-2 end-of-line) | strict | strict | strict | skip | skip |
| Bullet quá nhiều | skip (list work trên LinkedIn) | strict | relaxed (technical list OK) | strict | skip (list là doc) | skip |
| Hedging | strict | strict | relaxed ("có thể" accurate trong technical) | strict | relaxed | skip |
| Word table (full list) | strict | strict | **partial** (xem dưới) | strict | relaxed | P0 only |
| Promotional language | relaxed (some sell expected) | strict | strict | **extra strict** | strict | skip |
| Significance inflation | strict | strict | strict | **extra strict** | relaxed | skip |
| Copula avoidance | skip | strict | relaxed | strict | skip | skip |
| Uniform paragraph length | skip (short-form) | strict | strict | strict | relaxed | skip |
| Numbered list inflation | relaxed | strict | relaxed | strict | skip | skip |
| Câu hỏi tu từ | relaxed (1 hook OK) | strict | strict | strict | strict | skip |
| Transition phrase | skip (short-form) | strict | strict | strict | relaxed | skip |
| Generic conclusion | skip | strict | strict | **extra strict** | skip | skip |
| Hashtag stuffing | strict | strict | strict | **extra strict** | skip (doc không hashtag) | skip |
| Bullet-NP list | strict | strict | relaxed (technical option OK) | strict | relaxed (parameter list OK) | skip |
| Tier 3 phrase clustering | strict | strict | strict | **extra strict** | relaxed | skip |
| Future-narrative closer | strict | strict | strict | **extra strict** | skip | skip |
| Hedge-stacked prediction | strict | strict | relaxed ("có thể" hedged accuracy) | **extra strict** | relaxed | skip |
| Cường điệu "thực sự" | strict | strict | strict | **extra strict** | relaxed | skip |

**Technical-blog word table exception**: Các term có legitimate technical meaning, không nên flag trong technical context: `robust`, `comprehensive`, `seamless`, `ecosystem`, `leverage` (khi discussing actual platform leverage/API), `facilitate`, `underpin`, `streamline`. Vẫn flag: `delve`, `tapestry`, `beacon`, `embark`, `testament to`, `game-changer`, `harness`.

**"Extra strict"** nghĩa là: flag cả borderline instance. Trong investor email, 1 "thriving ecosystem" có thể undermine cả message.

**"Skip"** nghĩa là: không audit category này cho profile này. Rule không apply hoặc không đáng edit.

### Auto-detection cue

Khi không context specified, infer từ signal:

| Signal | Inferred context |
|--------|------------------|
| Dưới 300 từ + hashtag hoặc mention | `linkedin` |
| Code block, API reference, technical architecture | `technical-blog` |
| Salutation ("Chào [name]", "Kính gửi") + investor/fundraising language | `investor-email` |
| Step-by-step instruction, parameter doc, README structure | `docs` |
| Không strong signal | `blog` (safest default — mọi rule apply) |

Nếu auto-detection feel sai → say profile bạn dùng và why. User có thể override.

---

## Voice profile

Context profile (trên) set *how strict* cho audience. Voice profile set *how prose nên sound* — persona. Là axis độc lập: viết blunt cho blog hoặc warm cho doc. Voice **tùy chọn** — nếu writer không name → infer từ register hiện có của input và đừng impose persona lên text đã có voice.

Mỗi profile là set target cụ thể, không phải vibe:

- **`casual`** — Contraction throughout; absence đọc stiff. Câu ngắn (target ≤14 từ trung bình); fragment OK. Ít nhất 1 first-person hoặc concrete-anecdote touch. Near-zero jargon. Giữ warm hedge ("thật là", "tui nghĩ") nhưng cắt corporate ("cần lưu ý rằng"). *Blog post, social, community.*
- **`professional`** — Active voice phần lớn câu. Vary sentence length; tránh 3 câu liên tiếp trong vài từ nhau. 1 concrete claim mỗi paragraph (1 số, 1 tên, 1 ngày), không "chuyên gia nói". Make ask explicit. Low tolerance hedge. *LinkedIn, investor email, sponsor pitch.*
- **`technical`** — Prefer plain copula ("X là Y") hơn substitute inflated ("đóng vai trò", "minh chứng cho"). 1 idea mỗi câu; imperative mood cho instruction. Jargon OK nhưng define on first use. Table và list chỉ nơi content genuinely list-shaped, không decoration. *Doc, technical blog.*
- **`warm`** — Address reader trực tiếp ("bạn") và acknowledge ít nhất 1 lần. Cắt intensifier ("rất", "thật sự", "vô cùng") thay bằng verb mạnh hơn. Không performative-empathy opener ("Tôi hoàn toàn hiểu cảm giác của bạn"). Câu vừa (15-20 từ) cho cadence unhurried. *Mentorship, onboarding, thank-you.*
- **`blunt`** — Lead bằng claim; cắt "Cần lưu ý rằng" windup. Em dash rare; dùng dấu chấm cho emphasis. Không pad để hit rule of three. Near-zero hedge; flag "có thể / có khả năng / tiềm năng" stack. Câu declarative ngắn, thỉnh thoảng câu dài cho contrast. *Decision memo, thought leadership, hard feedback.*

**Calibrate to sample (tùy chọn).** Nếu writer cho sample writing của họ ("match voice của tôi — đây là post"), analyze pattern sentence-length, contraction rate, paragraph opening, recurring word choice, rồi match thay vì named profile. Đừng "upgrade" vocabulary họ: nếu họ viết "đồ" và "thứ" → giữ register.

**Voice compose với context thế nào.** Voice set target; context set how hard enforce. Voice *target* luôn apply, kể cả nơi context profile sẽ skip category — `technical` voice vẫn prefer plain copula trong `casual` context inhe otherwise ignore copula avoidance. Nơi cả 2 axis govern cùng rule và agree → reinforce: `blunt` voice want near-zero em dash và `blog` context đã strict → hard edit. Nơi disagree → resolve về **stricter**: `warm` voice trên `docs` vẫn không get decorative table. Default pairing sensible: casual↔casual, professional↔linkedin/investor-email, technical↔docs/technical-blog.

---

## Output format

### Rewrite mode (default)

Trả về 4 section:

**1. Issues found**
Bulleted list mọi AI-ism identified, với text vi phạm quoted.

**2. Rewritten version**
Full rewritten content. Preserve original structure, intent, mọi technical detail. Chỉ thay đổi cái guideline require.

**3. What changed**
Brief summary những edit major. Không phải mọi từ, chỉ thay đổi meaningful.

**4. Second-pass audit**
Re-read rewritten version từ section 2. Identify mọi AI tell còn survive first pass — transition recycle, inflation lingering, copula avoidance, filler phrase, hoặc gì khác từ category trên. Fix, return corrected text inline, note what changed in this pass. Nếu rewrite clean → say so.

### Detect mode

Trả về 2 section:

**1. Issues found**
Bulleted list mọi AI-ism identified, với text vi phạm quoted. Group theo severity (P0, P1, P2).

**2. Assessment**
Cho mỗi flag, note nó là vấn đề rõ ràng hay judgment call. Một số AI-associated pattern là technique writing effective — uniform paragraph length là vấn đề, nhưng "tuy nhiên" well-placed thì không. Call out flag nào writer definitely fix vs flag nào worth a second look nhưng might fine in context. Nếu text clean → say so.

### Edit mode

Sau khi edit file in place, trả về short report — không full file:

**1. Edits made**
Bulleted list change, mỗi cái với file location và before → after. Chỉ span bạn touched.

**2. Verification**
Confirm bạn re-read file và flagged pattern resolved. Note gì bạn deliberately leave alone vì đã human hoặc intentional.

---

## Tone calibration

Goal là writing sound như người viết. Trực tiếp. Cụ thể. Writing nên demonstrate confidence, không assert.

5 principle cho human-sounding rewrite:

1. **Vary sentence length** — mix ngắn với dài. Fragment OK.
2. **Cụ thể** — replace claim mơ hồ bằng số, tên, ngày, ví dụ.
3. **Có voice** — nơi phù hợp, dùng first person, state preference, show reaction.
4. **Cắt neutrality** — người có opinion. Nếu bài supposed take position → take it.
5. **Earn emphasis** — đừng tell reader thứ gì interesting. Make it interesting.

Nếu original writing đã strong → say so và chỉ cut khi cần. Đừng over-edit cho sự edit.

Replacement table cung cấp default, không mandate. Nếu flagged word clearly là choice đúng trong context → preserve.

---

## Workflow tích hợp cho `_demo`

Khi AI rơi vào fallback `_demo`:

```
1. Detect: không project + không style → activate _demo mode
2. Load: đọc projects/_demo/style-guide.md (file này)
3. Plan: 
   - Chọn voice profile (default: professional nếu không chỉ định)
   - Chọn context profile (default: blog nếu không chỉ định)
4. Research: 
   - PAA (People Also Ask) từ Google nếu user cung cấp keyword
   - Top 10 Google cho keyword target (Phase 0 Content Writing)
5. Write:
   - Apply mọi rule severity P0+P1 trong style guide
   - SKIP internal link (không có keywords-urls.md)
   - SKIP external whitelist (không có external-sources.md); chỉ cite nguồn rõ ràng (Wikipedia, .gov, .edu, hãng lớn)
6. Self-audit: chạy detect mode trên bản nháp, fix P0+P1 còn lại
7. Output: 
   - Path: projects/_demo/writing/{yyyy-mm-dd}-{slug}.md
   - Header: ngày, voice profile, context profile dùng
   - Note cuối: "Ad-hoc content — không thuộc project. Style guide: _demo. User review trước khi publish."
8. Session End:
   - KHÔNG cập nhật memory.md của bất kỳ project nào
   - Log ngắn trong response: "Đã viết ad-hoc tại _demo/writing/{file}.md"
```

## Khi nào KHÔNG fallback `_demo`

- User mention project name (vd "viết cho thep-bao-tin") → load project context
- User mention style name (vd "viết theo phong cách BinhnnDigital") → load style profile
- User đang ở phiên có project active (memory.md đã load) → tiếp tục dùng project context
- Bài audit `/audit` với URL thuộc project trong `keywords-urls.md` → load project context

## Cross-reference

- **Knowledge file global**: `knowledge/15-anti-ai-content-rules.md` — anti-AI rule áp dụng cho MỌI project. File `_demo/style-guide.md` này không thay thế mà **bổ sung** cho `_demo` mode.
- **Skill chính**: `skills/content/Content Writing/SKILL.md` — Phase 0.5 detect project/style, fallback `_demo`
- **Skill audit**: `skills/content/Content Evaluation/SKILL.md` — `/audit` mode ad-hoc dùng style guide này thay vì project context
- **Source EN**: `projects/_demo/style-guide-en.md` — bản tiếng Anh gốc do user cung cấp (preserve để reference)
