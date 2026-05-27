# Local SEO & Citations — Chinh phục tìm kiếm địa phương

## 1. Purpose / Mục đích

Xây dựng chiến lược Local SEO toàn diện để:
- Chiếm Local Pack (top 3 map) và local organic results
- Xây dựng citation profile mạnh, NAP đồng nhất 100%
- Tạo local landing pages cho từng khu vực phục vụ
- Tối ưu local keyword (geo-modified, "near me", "[dịch vụ] + [địa điểm]")
- Quản lý multi-location SEO (nếu có nhiều chi nhánh)
- Xây dựng local entity mạnh trong Knowledge Graph

> ⚠️ **Rule**: Skill này PHẢI đọc `projects/{ten-du-an}/profile.md` trước khi thực thi. Mọi output phải khớp với: tên thương hiệu, địa chỉ, khu vực phục vụ, và ngành nghề trong profile.

---

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Local SEO vs Traditional SEO

| Yếu tố | Traditional SEO | Local SEO |
|---------|----------------|-----------|
| Target | National/global | Khu vực cụ thể |
| SERP feature | Organic 10 blue links | Local Pack + organic |
| Ranking factors | Content + backlinks | Proximity + NAP + reviews |
| Keywords | Generic | Geo-modified |
| Schema | Article, Product | LocalBusiness, GeoCoordinates |
| Key signal | Domain authority | Citation consistency |

### 2.2 Local Ranking Factors (2024-2025)

```
1. GBP Signals (32%):
   - Primary category, keywords in description
   - Reviews (quantity, velocity, diversity)
   - GBP posts activity
   → Xem skill: Google Business Profile

2. On-page Signals (19%):
   - NAP on website
   - Geo-modified title tags, H1, content
   - LocalBusiness schema
   - City/service area landing pages

3. Citation Signals (13%):
   - NAP consistency across directories
   - Citation volume
   - IYP/aggregator data accuracy

4. Link Signals (15%):
   - Local backlinks (local news, chambers, sponsors)
   - Anchor text with geo terms
   - Linking domain geo-relevance

5. Review Signals (16%):
   - Review quantity + velocity
   - Review diversity (GBP + third-party)
   - Owner response rate
   - Keywords in reviews (organic)

6. Behavioral Signals (5%):
   - CTR on local results
   - Mobile clicks-to-call
   - Driving directions requests
```

### 2.3 Citation là gì

**Citation** = bất kỳ mention nào về NAP (Name, Address, Phone) của business trên internet.

| Loại | Ví dụ | Giá trị |
|------|-------|---------|
| **Structured** | Directory listing (Yelp, Yellow Pages) | Cao — NAP rõ ràng |
| **Unstructured** | Blog mention, news article | Trung bình — context signal |
| **Core** | Google, Facebook, Apple Maps, Bing | Rất cao — aggregator source |
| **Industry-specific** | Directories theo ngành | Cao — relevance signal |

### 2.4 NAP Consistency Rules

```
NAP = Name + Address + Phone

Quy tắc vàng:
- CHÍNH XÁC từng ký tự trên MỌI platform
- Không viết tắt lúc có lúc không ("Đường" vs "Đ." vs "đường")
- Không đổi format SĐT ("0901234567" vs "090 123 4567" vs "+84 901234567")
- Không thêm keyword vào tên ("Thép Bảo Tín" ≠ "Thép Bảo Tín - Ống Thép Giá Rẻ")

Format chuẩn (chọn 1 và giữ nhất quán):
  Name: [Tên chính thức trên GPKD]
  Address: [Số], [Đường], [Phường/Xã], [Quận/Huyện], [Tỉnh/TP]
  Phone: [0xx xxx xxxx] hoặc [0xx.xxx.xxxx]
```

### 2.5 Local Keyword Types

| Type | Pattern | Ví dụ | Volume |
|------|---------|-------|--------|
| **Explicit local** | [service] + [city] | "thép ống HCM" | Trung bình |
| **Implicit local** | [service] (Google infers location) | "mua thép ống" | Cao |
| **Near me** | [service] + near me/gần đây | "cửa hàng thép gần đây" | Cao |
| **Neighborhood** | [service] + [quận/phường] | "thép quận 7" | Thấp |
| **Long-tail local** | [specific service] + [location] | "ống thép đúc DN200 Bình Dương" | Thấp |

---

## 3. When to use / Khi nào dùng

- Khi business phục vụ khách hàng tại địa phương (có địa chỉ vật lý)
- Khi muốn chiếm Local Pack cho khu vực target
- Khi cần audit/fix citation inconsistencies
- Khi mở rộng sang khu vực mới (multi-location)
- Khi nhận task "local SEO", "citation building", "NAP audit"
- Khi profile.md có service_area hoặc multiple locations
- Khi keyword research cho thấy local intent queries

---

## 4. Workflow

### Bước 1: Đọc Project Profile

```
Đọc: projects/{ten-du-an}/profile.md
Trích xuất:
- Tên thương hiệu (chính xác theo GPKD)
- Địa chỉ trụ sở chính (full format)
- Các chi nhánh (nếu có)
- Số điện thoại (format chuẩn)
- Website URL
- Khu vực phục vụ (service area)
- Ngành nghề / lĩnh vực
- Competitors địa phương
```

### Bước 2: Local Keyword Research

```
Quy trình:

1. Seed keywords:
   - [Dịch vụ/sản phẩm chính] + [Thành phố]
   - [Dịch vụ/sản phẩm chính] + [Quận]
   - [Dịch vụ/sản phẩm chính] + "gần đây"/"near me"

2. Expand:
   - Google Suggest: gõ "[service] [city]" → xem suggestions
   - Google Maps: search service → xem related searches
   - GSC: filter queries có chứa geo terms
   - Ahrefs/Semrush: filter keywords by location

3. Classify:
   | Keyword | SV | KD | Intent | Page Type |
   |---------|----|----|--------|-----------|
   | [service] [city] | | | C/T | Service page |
   | [service] gần đây | | | T | Homepage/location |
   | [service] [district] | | | C/T | Location page |
   | giá [service] [city] | | | C | Pricing page |

4. Map to pages:
   - Homepage: [brand] + [primary service] + [city]
   - Service pages: [specific service] + [city]
   - Location pages: [service] + [district/area]
   - Blog: [informational local queries]
```

### Bước 3: Citation Audit

**Phase A: Tìm citations hiện tại**

```
Tools:
- BrightLocal Citation Tracker
- Whitespark Local Citation Finder
- Manual search: "[Business Name]" "[Phone]" "[Address]"

Check platforms (VN market):
Core:
  ☐ Google Business Profile
  ☐ Facebook Page
  ☐ Zalo OA
  ☐ Apple Maps (Maps Connect)
  ☐ Bing Places

Aggregators:
  ☐ Foursquare / Swarm
  ☐ Data.com
  ☐ Factual (now Foursquare)

General Directories:
  ☐ Yellow Pages Vietnam (yp.vn)
  ☐ Hotdeal.vn
  ☐ Cốc Cốc Maps
  ☐ Wemap
  ☐ Trang Vàng (trangvang.com.vn)
  ☐ Vietnam Business Directory
  ☐ Yelp (nếu applicable)

Industry-specific (tùy ngành):
  ☐ [Directory 1 theo ngành]
  ☐ [Directory 2 theo ngành]
  ☐ [Directory 3 theo ngành]

Social/Review:
  ☐ TripAdvisor (F&B, hospitality)
  ☐ Foody.vn (F&B)
  ☐ Shopee/Lazada (retail)
  ☐ Batdongsan.com.vn (BĐS)
```

**Phase B: Audit NAP consistency**

```
Tạo bảng audit:

| Platform | Name | Address | Phone | URL | Status |
|----------|------|---------|-------|-----|--------|
| GBP | ✅/❌ | ✅/❌ | ✅/❌ | ✅/❌ | Active/Claimed |
| Facebook | ✅/❌ | ✅/❌ | ✅/❌ | ✅/❌ | Active/Claimed |
| Zalo OA | ✅/❌ | ✅/❌ | ✅/❌ | ✅/❌ | Active/Claimed |
| ... | | | | | |

Scoring:
- 100% match = ✅
- Partial match (viết tắt, format khác) = ⚠️
- Wrong/outdated = ❌
- Not listed = ➖

Target: 100% ✅ trên tất cả platforms
```

**Phase C: Fix inconsistencies**

```
Priority order:
1. Core platforms (Google, Facebook, Zalo, Apple, Bing) — fix NGAY
2. Aggregators (Foursquare, Data.com) — fix trong tuần 1
3. General directories — fix trong tuần 2-3
4. Industry-specific — fix trong tháng 1

Cách fix:
- Claim listing nếu chưa claim
- Update NAP về format chuẩn
- Remove duplicate listings
- Report fake/spam listings
```

### Bước 4: Citation Building

```
Chiến lược xây citation mới:

Phase 1 (Tuần 1-2): Core + Aggregators
- Claim/create tất cả core platforms
- Submit to aggregators (data flows downstream)
- Target: 10-15 citations

Phase 2 (Tuần 3-4): General Directories
- Submit to general directories VN
- Ensure NAP exact match
- Target: 15-25 citations

Phase 3 (Tháng 2): Industry-specific
- Research directories theo ngành
- Submit with full profile (description, photos, categories)
- Target: 5-10 citations

Phase 4 (Ongoing): Unstructured Citations
- Guest posts on local blogs
- Local news mentions
- Sponsorship/partnership mentions
- Event listings

Velocity: 5-10 citations/tuần (tự nhiên, không spam)
```

### Bước 5: Local Landing Pages

**Khi nào cần location pages**:
- Business phục vụ nhiều quận/huyện/tỉnh
- Có nhiều chi nhánh
- Muốn rank cho "[service] + [location]" keywords

**Template — Service Area Page**:

```markdown
---
title: "[Service] tại [Location] — [Brand]"
slug: "[service]-[location]"
schema: LocalBusiness + Service + AreaServed
---

# [Service] tại [Location]

[Đoạn mở 50-100 từ: giới thiệu service + location context]

## Dịch vụ [Service] tại [Location]

[Mô tả service cụ thể cho khu vực này]
- Đặc điểm khu vực (nếu relevant)
- Kinh nghiệm phục vụ tại đây
- Số khách hàng/dự án tại khu vực

## Tại sao chọn [Brand] tại [Location]?

[USP + local proof]
- Khoảng cách / thời gian phục vụ
- Case study local
- Đội ngũ phục vụ khu vực

## Bảng giá [Service] tại [Location]

[Pricing table nếu applicable]

## Khách hàng tại [Location] nói gì

[Testimonials từ khách hàng khu vực]

## Liên hệ

[NAP block]
[Google Maps embed]
[CTA: Gọi ngay / Đặt lịch / Nhắn Zalo]
```

**Quy tắc quan trọng**:
- Mỗi location page phải có **unique content** (không chỉ đổi tên thành phố)
- Thêm local proof: case study, testimonial, ảnh dự án tại khu vực
- Embed Google Maps với pin chính xác
- Internal link từ homepage + service pages
- KHÔNG tạo hàng trăm thin location pages (Google penalize)

**Quality gate**:
- Minimum 500 từ unique content per page
- Ít nhất 1 local proof element (case study, review, photo)
- Schema LocalBusiness + AreaServed
- Unique meta title + description

### Bước 6: Local Schema Markup Library

**LocalBusiness (base)**:
```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "@id": "{website}/#localbusiness",
  "name": "{Business Name}",
  "image": "{logo URL}",
  "url": "{website}",
  "telephone": "{phone}",
  "priceRange": "{$$}",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "{số + đường}",
    "addressLocality": "{quận/huyện}",
    "addressRegion": "{tỉnh/TP}",
    "postalCode": "{mã bưu chính}",
    "addressCountry": "VN"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "{lat}",
    "longitude": "{lng}"
  },
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],
      "opens": "08:00",
      "closes": "17:30"
    }
  ],
  "sameAs": [
    "{Facebook URL}",
    "{Zalo OA URL}",
    "{Other profiles}"
  ],
  "areaServed": [
    {
      "@type": "City",
      "name": "{Thành phố}"
    },
    {
      "@type": "AdministrativeArea",
      "name": "{Quận/Huyện}"
    }
  ]
}
```

**LocalBusiness Subtypes** (chọn đúng type):

| Ngành | Schema Type |
|-------|-------------|
| Nhà hàng, quán ăn | Restaurant, FoodEstablishment |
| Khách sạn | Hotel, LodgingBusiness |
| Bệnh viện, phòng khám | MedicalBusiness, Physician |
| Luật sư | LegalService, Attorney |
| Bất động sản | RealEstateAgent |
| Sửa chữa | HomeAndConstructionBusiness |
| Spa, salon | HealthAndBeautyBusiness |
| Gym, fitness | SportsActivityLocation |
| Cửa hàng retail | Store, ShoppingCenter |
| Công ty B2B | ProfessionalService |
| Giáo dục | EducationalOrganization |
| Ô tô | AutoRepair, AutoDealer |

**Service schema** (cho từng dịch vụ):
```json
{
  "@type": "Service",
  "name": "{Tên dịch vụ}",
  "description": "{Mô tả}",
  "provider": {"@id": "{website}/#localbusiness"},
  "areaServed": {
    "@type": "City",
    "name": "{Thành phố}"
  },
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "{Tên catalog}",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "{Service variant}"
        }
      }
    ]
  }
}
```

**Multi-location schema** (cho nhiều chi nhánh):
```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "@id": "{website}/#organization",
  "name": "{Brand}",
  "url": "{website}",
  "subOrganization": [
    {
      "@type": "LocalBusiness",
      "name": "{Brand} - Chi nhánh {Location 1}",
      "address": {...},
      "geo": {...}
    },
    {
      "@type": "LocalBusiness",
      "name": "{Brand} - Chi nhánh {Location 2}",
      "address": {...},
      "geo": {...}
    }
  ]
}
```

### Bước 7: Local Link Building

```
Chiến lược backlink địa phương:

Tier 1 — High Authority Local:
- Báo địa phương (VnExpress local, Tuổi Trẻ, Thanh Niên)
- Hiệp hội ngành nghề địa phương
- Phòng Thương mại (VCCI chi nhánh)
- Cổng thông tin chính quyền (.gov.vn)
- Đại học/trường học địa phương

Tier 2 — Community:
- Blog/website địa phương
- Event sponsors (tài trợ sự kiện local)
- Charity/CSR activities
- Local business partnerships
- Chamber of commerce

Tier 3 — Directories & Listings:
- Industry directories
- Local business directories
- Review sites
- Maps & navigation apps

Tactics:
1. Sponsor local events → link từ event page
2. Tài trợ học bổng → link từ .edu
3. Viết guest post cho báo địa phương
4. Tạo local resource (guide, map, data) → earn links
5. Partnership cross-promotion với business local khác
6. HARO/báo chí: trả lời phỏng vấn về ngành tại địa phương
```

### Bước 8: Review Management (Multi-platform)

```
Platforms cần quản lý review:

Primary:
- Google Business Profile (quan trọng nhất)
- Facebook Page

Secondary (tùy ngành):
- TripAdvisor (F&B, hospitality)
- Foody.vn (F&B)
- Booking.com (hospitality)
- Shopee/Lazada (retail)
- Batdongsan.com.vn (BĐS)
- TopDev/ITviec (tech/recruitment)

Strategy:
1. Monitor tất cả platforms (setup alerts)
2. Reply 100% reviews trên mọi platform (< 24h)
3. Diversify review sources (không chỉ GBP)
4. Track sentiment across platforms
5. Address negative reviews: Acknowledge → Solution → Offline

Review generation workflow:
- Sau giao dịch thành công → gửi link review (GBP primary)
- Rotate platforms: tháng 1 focus GBP, tháng 2 focus Facebook...
- KHÔNG incentivize (vi phạm policy)
- Target: +5 reviews/tháng/platform
```

### Bước 9: Multi-location Strategy

```
Khi business có nhiều chi nhánh:

1. URL Structure:
   Option A: /locations/{city}/ (recommended)
   Option B: /chi-nhanh/{city}/
   Option C: Subdomain: {city}.brand.com (không khuyến nghị)

2. Mỗi location cần:
   - Dedicated landing page (unique content)
   - Riêng GBP listing
   - Riêng NAP
   - Riêng schema LocalBusiness
   - Riêng reviews
   - Riêng local citations

3. Centralized management:
   - 1 Organization schema (parent)
   - Multiple LocalBusiness (children)
   - Consistent branding, khác local proof
   - Shared service pages, unique location pages

4. Tránh:
   - Duplicate content giữa location pages
   - Cùng phone number cho nhiều locations
   - Thiếu unique local signals per location
```

### Bước 10: Local Rank Tracking & Measurement

```
Tracking setup:

1. Keyword tracking (geo-specific):
   - Track từ location chính xác (quận, thành phố)
   - Dùng tool hỗ trợ geo-grid: LocalFalcon, Local Viking
   - Track cả Local Pack + organic positions

2. Grid-based tracking:
   - Chia khu vực thành grid 5x5 hoặc 7x7
   - Track ranking tại mỗi điểm grid
   - Identify strong/weak zones
   - Adjust strategy per zone

3. Metrics dashboard:

   Weekly:
   - Local Pack position (target keywords)
   - GBP views + actions
   - New citations added
   - Review count + rating

   Monthly:
   - Citation consistency score
   - Local organic traffic (GA4, filter by city)
   - Phone calls + directions from GBP
   - Local keyword rankings trend
   - Competitor comparison

   Quarterly:
   - Citation growth vs competitors
   - Local market share (Share of Local Voice)
   - ROI: local traffic → leads → revenue
```

---

## 5. Template

```markdown
# Local SEO Strategy — {Tên dự án}

## Business Info
- Name: {từ profile.md — chính xác theo GPKD}
- Address: {full format chuẩn}
- Phone: {format chuẩn}
- Website: {URL}
- Service Area: {khu vực phục vụ}
- Locations: {số chi nhánh}

## NAP Standard Format
```
Name: {exact}
Address: {exact format}
Phone: {exact format}
```

## Citation Audit
- Total citations found: __
- Consistent (✅): __
- Inconsistent (⚠️❌): __
- Missing from core platforms: __
- Consistency Score: __% 

## Citation Building Plan
| Phase | Timeline | Platforms | Target |
|-------|----------|-----------|--------|
| Core | Week 1-2 | | 10-15 |
| General | Week 3-4 | | 15-25 |
| Industry | Month 2 | | 5-10 |
| Unstructured | Ongoing | | 2-3/month |

## Local Keywords
| Keyword | SV | KD | Intent | Target Page |
|---------|----|----|--------|-------------|
| | | | | |

## Location Pages Plan
| Location | URL | Status | Unique Content |
|----------|-----|--------|----------------|
| | | | |

## Schema Implementation
- [ ] LocalBusiness (homepage)
- [ ] GeoCoordinates
- [ ] OpeningHours
- [ ] AreaServed
- [ ] Service (per service page)
- [ ] Multi-location (if applicable)

## Local Link Building
| Target | Type | Status | DA |
|--------|------|--------|-----|
| | | | |

## Review Strategy
| Platform | Current Reviews | Rating | Target 3M |
|----------|----------------|--------|-----------|
| GBP | | | |
| Facebook | | | |
| {Industry} | | | |

## KPI Targets
| Metric | Current | Target 1M | Target 3M | Target 6M |
|--------|---------|-----------|-----------|-----------|
| Citation Score | | | | |
| Local Pack (top 3) | | | | |
| Local organic traffic | | | | |
| Reviews (total) | | | | |
| Calls from GBP | | | | |
```

---

## 6. KPI đo lường

| Metric | Target | Cách đo |
|--------|--------|---------|
| NAP Consistency Score | 100% | BrightLocal / manual audit |
| Local Pack Position | Top 3 cho 10 keywords chính | LocalFalcon / geo-specific tracker |
| Citation Count | > competitor median | BrightLocal / Whitespark |
| Local Organic Traffic | +25% QoQ | GA4 (filter by city/region) |
| Total Reviews (all platforms) | +10/tháng | Manual tracking |
| Average Rating | ≥ 4.5 across platforms | Manual tracking |
| GBP Actions (calls + directions) | +20% MoM | GBP Insights |
| Local Keyword Rankings | +30% keywords in top 10 | Rank tracker |
| Location Page Traffic | +50% in 3 months | GA4 per page |
| Local Backlinks | +3-5/tháng | Ahrefs (filter by geo) |

---

## 7. Tools đề xuất

| Tool | Giá | Use case |
|------|-----|----------|
| BrightLocal | $39/mo | Citation audit, tracking, building |
| Whitespark | $20/mo | Citation finder, rank tracker |
| LocalFalcon | $25/mo | Grid-based rank tracking |
| Local Viking | $20/mo | GBP management, rank grid |
| Semrush Listing Management | $40/mo | NAP sync automation |
| Yext | $199/mo | Enterprise citation management |
| Google Search Console | $0 | Local keyword data |
| Google Analytics 4 | $0 | Local traffic analysis |
| Screaming Frog | $259/yr | Schema validation, site audit |
| Schema Markup Validator | $0 | Test structured data |
| Google Rich Results Test | $0 | Validate schema |

---

## 8. Common mistakes

- **NAP không đồng nhất**: Sai 1 ký tự giữa platforms = Google confused → giảm ranking
- **Keyword stuffing tên business**: Thêm keyword vào business name trên directories → bị remove
- **Thin location pages**: Tạo 50 pages chỉ đổi tên thành phố → Google penalize
- **Bỏ qua aggregators**: Foursquare/Data.com feed data cho hàng trăm sites downstream
- **Chỉ focus GBP reviews**: Cần diversify review sources (Facebook, industry sites)
- **Không có geo schema**: Thiếu GeoCoordinates = Google không biết chính xác vị trí
- **Citation velocity quá nhanh**: 100 citations/tuần = unnatural → có thể bị flag
- **Duplicate GBP listings**: Nhiều listing cho cùng 1 location → dilute signals
- **Không track grid-based**: Ranking khác nhau tùy vị trí user → cần track theo grid
- **Ignore local link building**: Chỉ build citations mà không có local backlinks = thiếu prominence
- **Copy content giữa location pages**: Mỗi page cần unique local proof
- **Không claim listings**: Để unclaimed = ai cũng có thể suggest edits sai
- **Dùng P.O. Box / văn phòng ảo cho GBP**: Vi phạm chính sách Google → đình chỉ hồ sơ
- **Incentivized reviews**: Dùng tiền/giảm giá/quà để đổi review → vi phạm Google nghiêm trọng
- **SAB vượt quá 2 giờ lái xe**: Google giới hạn service area cho doanh nghiệp phục vụ tại chỗ

> Xem chi tiết quy tắc Google: `knowledge/14-brand-distribution.md` — section "⚠️ Google Business Profile — Quy tắc chính thức từ Google"

---

## 9. Liên kết Skills

| Skill liên quan | Mối liên hệ |
|----------------|-------------|
| Google Business Profile | GBP optimization (complementary, không overlap) |
| Facebook Content | Facebook as citation + review platform |
| Zalo OA | Zalo as citation + local signal |
| Schema Markup | Technical implementation của LocalBusiness schema |
| Content Writing | Viết unique content cho location pages |
| Anti-AI Content Rules | `knowledge/15-anti-ai-content-rules.md` — áp dụng cho location pages content |
| Keyword Research | Local keyword research methodology |
| Link Building | Local link building strategies |
| Brand Mentions | Unstructured citations = brand mentions |
| NLP Optimization | Local entity salience |
| Competitor Analysis | Local competitor citation/link gap |

---

## 10. Tích hợp với Project Profile

Skill này **bắt buộc** đọc `projects/{ten-du-an}/profile.md` và map:

| Profile field | Local SEO element |
|---------------|-------------------|
| `brand_name` | NAP Name (chính xác, không thêm bớt) |
| `address` | NAP Address (format chuẩn hóa) |
| `phone` | NAP Phone (format nhất quán) |
| `website` | Citation URL |
| `service_area` | AreaServed schema + location pages |
| `locations` | Multi-location strategy |
| `industry` | Industry-specific directories |
| `competitors` | Citation gap analysis |
| `target_audience` | Local keyword intent |

---

## 11. Phân biệt với skill Google Business Profile

| Yếu tố | Local SEO & Citations | Google Business Profile |
|---------|----------------------|------------------------|
| Scope | Toàn bộ local presence | Chỉ GBP platform |
| Focus | Citations, NAP, local pages, schema | GBP posts, reviews, Q&A |
| Output | Citation plan + location pages | GBP optimization plan |
| Khi nào dùng | Strategy tổng thể local | Tối ưu GBP cụ thể |

→ Dùng **cả hai** khi làm local SEO toàn diện. GBP skill là subset của Local SEO strategy.

---

**Đầu ra**: Local SEO Strategy hoàn chỉnh bao gồm: NAP standard, citation audit + building plan, local keyword map, location pages plan, schema library, local link building strategy, review management, và KPI targets — tất cả khớp với project profile và không overlap với GBP skill.
