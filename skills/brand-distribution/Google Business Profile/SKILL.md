# Google Business Profile — Phủ thương hiệu trên Google Maps & Local Pack

## 1. Purpose / Mục đích

Tối ưu Google Business Profile (GBP) để:
- Chiếm vị trí Local Pack (top 3 map) cho khu vực trụ sở chính
- Tăng brand visibility trên Google Maps, Google Search, AI Overview
- Tạo trust signal mạnh cho entity thương hiệu (Knowledge Panel ready)
- Drive traffic + leads từ local search (near me, "[ngành] + [địa điểm]")
- Hỗ trợ EEAT: chứng minh business thực, có địa chỉ, có review

> ⚠️ **Rule**: Skill này PHẢI đọc `projects/{ten-du-an}/profile.md` trước khi thực thi. Mọi output phải khớp với: tên thương hiệu, ngành, địa chỉ trụ sở, tone of voice, và mục tiêu SEO trong profile.

> ⚠️ **QUAN TRỌNG**: Skill này tuân thủ theo **Quy tắc chính thức của Google** (xem `knowledge/14-brand-distribution.md` — section "Google Business Profile — Quy tắc chính thức từ Google"). Mọi hành động vi phạm → đình chỉ hồ sơ.

---

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 GBP là gì trong hệ sinh thái SEO

- **Local Pack**: 3 kết quả bản đồ hiển thị trên SERP cho local intent query
- **Knowledge Panel**: Bảng thông tin bên phải SERP — GBP là nguồn dữ liệu chính
- **NAP Consistency**: Name, Address, Phone — phải đồng nhất trên mọi platform
- **Entity Signal**: GBP xác nhận entity thương hiệu tồn tại trong thế giới thực

### 2.2 Ranking Factors cho GBP

| Factor | Trọng số | Giải thích |
|--------|----------|------------|
| Relevance | 30% | Category + keyword trong profile khớp với query |
| Distance | 25% | Khoảng cách từ user đến business |
| Prominence | 45% | Reviews, citations, backlinks, brand mentions |

### 2.3 Content Types trên GBP

| Type | Mục đích | Tần suất khuyến nghị |
|------|----------|---------------------|
| **Update** | Tin tức, thông báo, chia sẻ kiến thức | 2-3/tuần |
| **Offer** | Khuyến mãi, ưu đãi có thời hạn | 1-2/tuần (nếu có) |
| **Event** | Sự kiện, workshop, webinar | Khi có event |
| **Product** | Showcase sản phẩm/dịch vụ | Cập nhật khi có mới |
| **Photo/Video** | Hình ảnh thực tế, behind-the-scenes | 3-5/tuần |
| **Q&A** | Hỏi đáp — self-seed câu hỏi phổ biến | Setup 10-20 câu ban đầu |

### 2.4 Native-first Content Philosophy

GBP content KHÔNG phải copy từ website. Mỗi post phải:
- Viết riêng cho context "người đang tìm trên Maps"
- Ngắn gọn, actionable, có CTA rõ ràng
- Tận dụng visual (ảnh thực, không stock photo)
- Phù hợp với micro-moment: "Tôi muốn đi", "Tôi muốn mua", "Tôi muốn biết"

---

## 3. When to use / Khi nào dùng

- Khi business có địa chỉ vật lý (trụ sở, showroom, văn phòng)
- Khi muốn chiếm Local Pack cho khu vực trụ sở chính
- Khi xây dựng entity thương hiệu (Knowledge Panel)
- Khi nhận task "phủ thương hiệu" hoặc "local SEO"
- Khi profile.md có thông tin địa chỉ, khu vực target

---

## 4. Workflow

### Bước 1: Đọc Project Profile

```
Đọc: projects/{ten-du-an}/profile.md
Trích xuất:
- Tên thương hiệu (chính xác)
- Ngành / lĩnh vực
- Địa chỉ trụ sở chính
- Số điện thoại
- Website URL
- Tone of voice
- Sản phẩm/dịch vụ chính
- Đối tượng khách hàng
- Khu vực phục vụ
```

### Bước 2: Audit GBP hiện tại (nếu đã có)

Checklist audit 20 điểm:

| # | Hạng mục | Check |
|---|----------|-------|
| 1 | Business name = biển hiệu + giấy tờ (không keyword stuffing/tagline/giờ mở cửa) | ☐ |
| 2 | Primary category chính xác (nguyên tắc "IS" not "HAS") | ☐ |
| 3 | Secondary categories đầy đủ (max 9) | ☐ |
| 4 | Địa chỉ chính xác, pin đúng vị trí | ☐ |
| 5 | Số điện thoại khớp NAP | ☐ |
| 6 | Website URL đúng | ☐ |
| 7 | Giờ mở cửa cập nhật | ☐ |
| 8 | Description tối ưu (750 chars, keyword + value prop) | ☐ |
| 9 | Products/Services đầy đủ | ☐ |
| 10 | Photos > 20 ảnh (exterior, interior, team, product) | ☐ |
| 11 | Logo + cover photo chất lượng | ☐ |
| 12 | Reviews > 10, rating > 4.0 | ☐ |
| 13 | Owner reply 100% reviews | ☐ |
| 14 | Q&A có seed questions | ☐ |
| 15 | Posts đăng đều (< 7 ngày/post) | ☐ |
| 16 | Attributes đầy đủ | ☐ |
| 17 | Booking/appointment link (nếu applicable) | ☐ |
| 18 | Messaging enabled | ☐ |
| 19 | Service area defined | ☐ |
| 20 | UTM tracking trên website link | ☐ |

### Bước 3: Tối ưu Profile Foundation

**Business Description** (750 ký tự max):
```
[Câu 1: Tên + ngành + USP chính]
[Câu 2-3: Sản phẩm/dịch vụ core + đối tượng phục vụ]
[Câu 4: Khu vực phục vụ + kinh nghiệm]
[Câu 5: CTA hoặc differentiator]

Quy tắc:
- Keyword chính trong 50 từ đầu
- KHÔNG dùng: "tốt nhất", "số 1", "hàng đầu" (vi phạm guidelines)
- CÓ: số liệu cụ thể, năm thành lập, số khách hàng
- KHÔNG chèn SĐT vào nội dung văn bản ("Phone Stuffing") — dùng nút "Gọi ngay" chính thức
```

**Category Strategy**:
```
Nguyên tắc "IS" vs "HAS": Chọn d.nghiệp LÀ gì (Golf Resort), không phải CÓ gì (Hồ bơi)
Chọn category cụ thể nhất — Google tự mở rộng danh mục cha

Primary: [Category sát nhất với core business]
Secondary (chọn 3-5 relevant):
- [Category 2]
- [Category 3]
- [Category 4]
```

### Bước 4: Content Calendar — GBP Posts

**Framework tần suất**:
- Minimum: 2 posts/tuần (để profile không "chết")
- Recommended: 4-5 posts/tuần
- Maximum: 1 post/ngày (không spam)

**Calendar mẫu — Tuần chuẩn**:

| Thứ | Content Type | Chủ đề | CTA |
|-----|-------------|--------|-----|
| T2 | Update | Tips/kiến thức ngành | "Tìm hiểu thêm" → blog |
| T3 | Photo | Behind-the-scenes / team | — |
| T4 | Offer/Product | Highlight sản phẩm/dịch vụ | "Gọi ngay" / "Đặt lịch" |
| T5 | Update | Case study / kết quả | "Liên hệ tư vấn" |
| T6 | Photo/Video | Khách hàng / testimonial | — |
| T7 | Event/Update | Recap tuần / tin ngành | "Xem chi tiết" |

**Cấu trúc 1 GBP Post**:
```
[Dòng 1: Hook — câu hỏi hoặc số liệu gây chú ý] (< 80 ký tự)
[Dòng 2-3: Nội dung chính — giá trị, thông tin, offer]
[Dòng 4: CTA rõ ràng]

+ 1 ảnh chất lượng (1200x900px min, ảnh thực)
+ Link (nếu có) với UTM: ?utm_source=gbp&utm_medium=post&utm_campaign={slug}
```

### Bước 4.5: Load Anti-AI Rules + Style Profile

```
BẮT BUỘC trước khi viết GBP posts:

1. Đọc: knowledge/15-anti-ai-content-rules.md
   - Áp dụng Ruleset 1-4 cho mọi GBP post text
   - GBP posts ngắn (80-200 ký tự) nhưng VẪN phải tránh từ cấm

2. Load Style Profile:
   - Đọc projects/{ten-du-an}/profile.md → "Style profile" path
   - Áp dụng tone of voice phù hợp cho GBP (ngắn gọn, hành động)

3. Lưu ý cho GBP:
   - KHÔNG dùng từ cấm Ruleset 1 trong post text
   - KHÔNG dùng mẫu câu AI Ruleset 2
   - GBP hook phải trực tiếp, KHÔNG dùng "Trong thế giới số..."
   - CTA theo style profile (hotline, email, form...)
```

### Bước 5: Review Strategy

**Mục tiêu**: Tăng số lượng + chất lượng review một cách organic

```
Chiến lược:
1. Tạo short link review: g.page/{business}/review
2. Gửi link sau mỗi giao dịch thành công (email/SMS/Zalo)
3. Reply MỌI review trong < 24h:
   - Review tốt: Cảm ơn + nhắc lại điểm họ khen + mời quay lại
   - Review xấu: Xin lỗi + giải pháp cụ thể + mời liên hệ trực tiếp
4. KHÔNG incentivize reviews (vi phạm Google policy)
5. Target: +5 reviews/tháng minimum

⚠️ QUY TẮC GOOGLE VỀ REVIEW (non-negotiable):
- CẤM dùng tiền, giảm giá, quà tặng để đổi lấy đánh giá
- CẤM yêu cầu khách chỉnh sửa/xóa đánh giá tiêu cực bằng ưu đãi
- CẤM dùng nhiều tài khoản, trình giả lập để tạo review ảo
- CẤM đăng nội dung tiêu cực về đối thủ nhằm hạ uy tín
- Review phải dựa trên trải nghiệm THỰC TẾ tại địa điểm
Vi phạm bất kỳ điều nào → đình chỉ hồ sơ + tước quyền truy cập
```

### Bước 6: Q&A Optimization

```
Self-seed 10-20 câu hỏi phổ biến:
- Giờ mở cửa / địa chỉ chính xác
- Có parking không?
- Giá range bao nhiêu?
- Có ship/giao hàng không?
- Chấp nhận thanh toán gì?
- Bảo hành như thế nào?
- Có tư vấn miễn phí không?
- [Câu hỏi specific theo ngành từ profile.md]

Format trả lời: Ngắn gọn, có số liệu, có CTA nếu phù hợp.
```

### Bước 7: Photo & Video Strategy

```
Minimum photo set (20+ ảnh):
- Exterior: 3-5 (mặt tiền, biển hiệu, parking)
- Interior: 5-7 (không gian, setup, atmosphere)
- Team: 3-5 (nhân viên, founder, working)
- Product/Service: 5-10 (sản phẩm thực, đang phục vụ)
- Customer: 3-5 (khách hàng thực, có consent)

Quy tắc:
- Ảnh THỰC, không stock photo
- Geo-tag ảnh với tọa độ business
- Filename: {keyword}-{business-name}-{location}.jpg
- Alt text tự động từ filename
- Upload 3-5 ảnh mới/tuần
```

### Bước 8: Local Citation & NAP Sync

```
NAP phải đồng nhất trên:
- Website (footer, contact page, schema LocalBusiness)
- GBP
- Facebook
- Zalo OA
- Directories: Foursquare, Yelp, Yellow Pages VN, Hotdeal, etc.
- Industry-specific directories

Format chuẩn:
  Tên: [Tên chính xác từ profile.md]
  Địa chỉ: [Số nhà], [Đường], [Phường/Xã], [Quận/Huyện], [Tỉnh/TP]
  SĐT: [Format: 0xx xxx xxxx]
```

### Bước 9: Schema Markup hỗ trợ

Đảm bảo website có schema `LocalBusiness` khớp với GBP:

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "{Tên từ profile.md}",
  "image": "{URL logo}",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "{Địa chỉ}",
    "addressLocality": "{Quận/Huyện}",
    "addressRegion": "{Tỉnh/TP}",
    "postalCode": "{Mã bưu chính}",
    "addressCountry": "VN"
  },
  "telephone": "{SĐT}",
  "url": "{Website}",
  "openingHours": "{Giờ mở cửa}",
  "sameAs": [
    "{Facebook URL}",
    "{Zalo OA URL}",
    "{Các profile khác}"
  ]
}
```

(Xem skill Schema Markup để implement chi tiết.)

### Bước 10: Đo lường & Tối ưu

```
Weekly check:
- Views (Search + Maps)
- Actions (calls, directions, website clicks)
- Photo views vs competitors
- New reviews + rating trend

Monthly:
- Post performance (views, clicks per post type)
- Keyword queries triggering profile
- Local Pack position cho target keywords
- Conversion: GBP actions → actual leads/sales
```

---

## 5. Template

```markdown
# GBP Optimization Plan — {Tên dự án}

## Profile Info
- Business Name: {từ profile.md}
- Primary Category: {category}
- Secondary Categories: {list}
- Address: {địa chỉ đầy đủ}
- Phone: {SĐT}
- Website: {URL}
- Service Area: {khu vực}

## Audit Score: __/20

## Priority Actions
1. {Action 1 — impact cao nhất}
2. {Action 2}
3. {Action 3}

## Content Calendar — Tháng {MM/YYYY}
| Tuần | T2 | T3 | T4 | T5 | T6 | T7 |
|------|----|----|----|----|----|----|
| W1   |    |    |    |    |    |    |
| W2   |    |    |    |    |    |    |
| W3   |    |    |    |    |    |    |
| W4   |    |    |    |    |    |    |

## Review Strategy
- Current: __ reviews, __ rating
- Target 3 tháng: __ reviews, __ rating
- Tactics: {list}

## KPI Targets
| Metric | Current | Target 1M | Target 3M |
|--------|---------|-----------|-----------|
| Views/month | | | |
| Actions/month | | | |
| Reviews | | | |
| Local Pack position | | | |
```

---

## 6. KPI đo lường

| Metric | Target | Cách đo |
|--------|--------|---------|
| GBP Views (Search + Maps) | +30% MoM trong 3 tháng đầu | GBP Insights |
| Actions (calls + directions + clicks) | +20% MoM | GBP Insights |
| Local Pack position | Top 3 cho 5 keyword chính | Local rank tracker |
| Review count | +5/tháng minimum | GBP dashboard |
| Average rating | ≥ 4.5 | GBP dashboard |
| Post engagement | > 50 views/post | GBP Insights |
| Photo views | > competitor median | GBP Insights |
| NAP consistency score | 100% across platforms | Audit manual / BrightLocal |

---

## 7. Tools đề xuất

| Tool | Giá | Use case |
|------|-----|----------|
| Google Business Profile (free) | $0 | Quản lý profile, posts, insights |
| BrightLocal | $39/mo | Local rank tracking, citation audit |
| Whitespark | $20/mo | Citation building, local rank |
| LocalFalcon | $25/mo | Heatmap ranking theo grid |
| Canva | Free/$13mo | Thiết kế ảnh GBP posts |
| Google Sheets | $0 | Content calendar, tracking |
| Semrush Listing Management | $40/mo | NAP sync tự động |

---

## 8. Common mistakes

- **Keyword stuffing tên business**: "Thép Bảo Tín - Ống Thép Đúc Giá Rẻ HCM" → vi phạm, bị suspend
- **Dùng stock photo**: Google ưu tiên ảnh thực, stock photo giảm trust
- **Không reply review**: Đặc biệt review tiêu cực — mất cơ hội recovery
- **Post quá ít**: Profile "chết" nếu > 2 tuần không post
- **Copy content từ website**: GBP post cần native, ngắn, actionable
- **Không track UTM**: Không biết GBP drive bao nhiêu traffic/leads
- **NAP không đồng nhất**: Sai 1 ký tự = Google không confirm entity
- **Chọn sai primary category**: Ảnh hưởng trực tiếp đến relevance ranking
- **Không seed Q&A**: Để người lạ hỏi/trả lời sai thông tin
- **Ignore attributes**: Bỏ qua accessibility, payment methods, amenities
- **Incentivized reviews**: Dùng tiền/giảm giá/quà tặng đổi review → vi phạm chính sách Google nghiêm trọng
- **Phone Stuffing**: Chèn SĐT vào nội dung post → bị bot từ chối, dùng nút "Gọi ngay" thay vì
- **Dùng P.O. Box / văn phòng ảo**: Vi phạm chính sách địa chỉ → đình chỉ
- **Link giao dịch không chuẩn**: Link rút gọn, yêu cầu CAPTCHA/đăng nhập, HTTP 4xx/5xx → bị xóa bởi bot Google
- **Đổi tên hồ sơ cũ sang ngành mới**: Phải tạo hồ sơ mới khi thay đổi bản chất dịch vụ (identity change)

---

## 9. Liên kết Skills

| Skill liên quan | Mối liên hệ |
|----------------|-------------|
| Schema Markup | LocalBusiness schema hỗ trợ GBP entity |
| Content Writing | Áp dụng User Psychology cho GBP posts |
| Style Mimicker | Giữ consistent voice cho GBP posts — load style profile trước khi viết |
| Anti-AI Content Rules | `knowledge/15-anti-ai-content-rules.md` — tránh từ cấm trong post text |
| Brand Mentions | Monitor mentions → strengthen NAP |
| NLP Optimization | Entity salience cho business name |
| Topical Authority | GBP posts reinforce topical signals |
| Facebook Content | Cross-platform NAP consistency |
| Zalo OA | Cross-platform NAP consistency |

---

## 10. Tích hợp với Project Profile

Skill này **bắt buộc** đọc `projects/{ten-du-an}/profile.md` và map:

| Profile field | GBP element |
|---------------|-------------|
| `brand_name` | Business Name (chính xác, không thêm keyword) |
| `industry` | Primary + Secondary Categories |
| `address` | Address + Pin location |
| `phone` | Phone number |
| `website` | Website URL |
| `tone_of_voice` | Giọng văn trong Posts + Review replies |
| `products_services` | Products/Services section |
| `target_audience` | Định hướng content posts |
| `service_area` | Service Area setting |
| `competitors` | Benchmark photo views, review count |

---

---

## 11. Google Compliance Checklist

Khi tạo hoặc tối ưu GBP cho bất kỳ dự án nào, **PHẢI kiểm tra** các điểm sau:

| # | Kiểm tra | Quy tắc | ✅/❌ |
|---|----------|---------|------|
| 1 | Tên d.nghiệp = biển hiệu + giấy tờ | Không chèn keyword, giờ mở cửa, tagline | ☐ |
| 2 | Category theo "IS" not "HAS" | Chọn d.nghiệp LÀ gì, cụ thể nhất | ☐ |
| 3 | Địa chỉ thực, không P.O. Box | Không văn phòng ảo | ☐ |
| 4 | SAB ≤ 2 giờ lái xe | Nếu là d.nghiệp phục vụ tại chỗ | ☐ |
| 5 | Review không incentivized | Không tiền/giảm giá/quà đổi review | ☐ |
| 6 | Không phone stuffing | SĐT dùng nút chính thức, không chèn vào text | ☐ |
| 7 | Link giao dịch chuẩn | HTTP 200, không CAPTCHA, không link rút gọn | ☐ |
| 8 | Content không vi phạm | Không harassment, hate speech, NSFW | ☐ |
| 9 | Hàng hóa hạn chế tuân thủ | Không link mua, mã giảm giá cho hàng kiểm soát | ☐ |
| 10 | Quyền sở hữu rõ ràng | Chủ d.nghiệp giữ Owner, agency chỉ là Manager | ☐ |

> Xem chi tiết: `knowledge/14-brand-distribution.md` — section "⚠️ Google Business Profile — Quy tắc chính thức từ Google"

---

**Đầu ra**: GBP Optimization Plan hoàn chỉnh bao gồm: audit score, priority actions, content calendar 1 tháng, review strategy, Google compliance checklist, và KPI targets — tất cả khớp với project profile và tuân thủ chính sách Google.
