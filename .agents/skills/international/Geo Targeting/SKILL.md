---
name: geo-targeting
version: 1.0.0
description: "Use this skill when the user asks about geo targeting / nhắm địa lý: 'geo targeting', 'ccTLD vs subfolder', 'target user theo quốc gia', 'international SEO geo'. Covers ccTLD vs subfolder vs subdomain, GSC geo settings, hreflang interplay."
category: international
---

# Geo Targeting — Nhắm mục tiêu địa lý

## 1. Purpose / Mục đích
Geo targeting đảm bảo content hiển thị **đúng người ở đúng khu vực**. Kết hợp giữa hreflang (skill riêng), URL strategy (Multi Language), và các tín hiệu phụ (server location, currency, contact, schema). Làm tốt → tỉ lệ chuyển đổi địa phương tăng cao + ranking local. Làm kém → 1 user UK nhận page hiển thị giá USD.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Tín hiệu địa lý mà Google dùng
- ccTLD (.vn, .uk, .de) — strongest.
- GSC International Targeting (manual set country cho subdomain/subfolder).
- Hreflang `lang-region`.
- Server IP location (yếu, dùng CDN làm noisy).
- Local language + currency + address + phone.
- Backlink từ domain local.
- Local business citations + Google Business Profile.
- Schema LocalBusiness, PostalAddress, GeoCoordinates.
- Hosting on local TLD vs international.

### 2.2 Geo vs Language
- **Geo**: country target.
- **Language**: ngôn ngữ.
- 1 ngôn ngữ → nhiều country (en cho US, UK, AU).
- 1 country → nhiều ngôn ngữ (Switzerland: de, fr, it, en).

### 2.3 Local SEO subset
Local SEO (Google Business Profile, local pack) là phần con của Geo Targeting cho business có physical location.

## 3. When to use
- Site phục vụ ≥ 2 country.
- E-commerce với pricing / currency theo region.
- SaaS có pháp nhân và payment local khác nhau.
- Service business có nhiều physical location.
- Chuỗi thương hiệu với từng cửa hàng có URL riêng.

## 4. Workflow Geo Targeting

### Bước 1. Country list + ưu tiên
- Top 5 country có demand + revenue potential.
- Map mỗi country → URL strategy (ccTLD / subdomain / subfolder).
- Quyết định: 1 country = 1 version, hay merge cluster country (vd "Latam" gộp).

### Bước 2. URL + Hreflang
- Theo skill Multi Language + Hreflang.
- Đảm bảo mỗi country có URL riêng (kể cả cùng ngôn ngữ).
  - `/en-us/`, `/en-gb/`, `/en-au/`, `/en-ca/`.

### Bước 3. GSC International Targeting
- Cho mỗi property (subfolder hoặc subdomain): Search Console → Legacy Tools → International Targeting → set country.
- ccTLD tự inherit country, không cần set.

### Bước 4. Tín hiệu địa lý on-page

Mỗi country page có:
- **Currency**: hiển thị giá đúng tiền tệ địa phương + dropdown chuyển.
- **Phone**: số điện thoại local format đúng.
- **Address**: physical address (nếu có), zip code, city.
- **Schema LocalBusiness / PostalAddress / GeoCoordinates**:
```json
{
  "@type": "LocalBusiness",
  "name": "Brand VN",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Đường ABC",
    "addressLocality": "Hồ Chí Minh",
    "postalCode": "700000",
    "addressCountry": "VN"
  },
  "telephone": "+84-...",
  "geo": { "@type": "GeoCoordinates", "latitude": "10.77", "longitude": "106.69" }
}
```
- Local language + idiom.
- Local case study + testimonial.
- Compliance text (VAT, GST, GDPR theo region).

### Bước 5. Hosting + CDN
- CDN (Cloudflare, Fastly, Akamai) — phục vụ từ edge location gần user → tốc độ.
- Server primary ở 1 location ổn định (đừng overengineering với multi-region database trừ khi cần thật).
- Cảnh báo: CDN không thay đổi geo signal cho Google. Google detect dựa server IP của origin, nhưng signal này yếu so với hreflang + ccTLD.

### Bước 6. Local link + citation
- Build backlink từ site local (VN: VnExpress, Tinh Tế; UK: BBC, Guardian).
- Citations: Yelp, TripAdvisor, local directories, Yellow Pages địa phương, ngành-specific.
- Google Business Profile cho mỗi physical location.
- Local press / community partnership.

### Bước 7. Local search engine ngoài Google
- **Russia**: Yandex Webmaster + Yandex.Metrica.
- **China**: Baidu Webmaster (cần ICP license, server in China tốt).
- **Korea**: Naver Webmaster.
- **Czech**: Seznam.
- Mỗi search engine có guideline + tag riêng (vd Yandex hỗ trợ `Geo` meta tag).

### Bước 8. Geo IP rules cẩn thận
- KHÔNG redirect tự động theo IP — Googlebot bị redirect sai.
- Có thể: language picker tự highlight option theo IP, nhưng giữ user choice + cookie.
- Cloaking detect: serving khác content cho Googlebot vs user → vi phạm guidelines.

### Bước 9. Validate
- VPN test: connect VPN tới country target → search keyword → kiểm tra URL hiển thị.
- Ads Preview Tool: Google Ads → Diagnose → simulate location.
- GSC: Performance → filter Country → so sánh impression/click theo country.
- Lighthouse + GTmetrix multi-location test.

## 5. Template Country Setup Checklist

- [ ] URL strategy quyết định
- [ ] Hreflang implement
- [ ] GSC International Targeting set
- [ ] Currency local hiển thị
- [ ] Phone + address local
- [ ] LocalBusiness schema
- [ ] Local payment method
- [ ] Local language content (≥ Tier 1)
- [ ] Local backlink/citation plan
- [ ] GBP nếu có physical
- [ ] CDN serve edge location
- [ ] Local search engine submit (nếu relevant)
- [ ] Compliance text (GDPR, VAT, ...)
- [ ] VPN test verify đúng version

## 6. KPI đo lường
- Per-country organic traffic.
- Per-country conversion + AOV.
- Per-country RD growth.
- Local pack ranking (cho business có physical).
- Branded search per country.
- Bounce rate per country (proxy cho geo mismatch).
- # citation per country.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| GSC International Targeting | Free | Set country |
| Google Business Profile | Free | Local pack |
| Yext / BrightLocal / Whitespark | Paid | Citation management |
| Ahrefs / Semrush per-country DB | Paid | Local keyword + RD |
| Yandex Webmaster, Baidu Webmaster, Naver Webmaster | Free | Region-specific SE |
| GTmetrix (multi-location) | Freemium | Speed per region |
| BrowserStack / VPN | Paid | Test from country |
| Schema App / RankMath | Paid/Free | LocalBusiness schema |
| Moz Local | Paid | NAP consistency |
| Google Ads Preview & Diagnosis | Free | Simulate location |

## 8. Common mistakes
- Auto-redirect theo IP → Googlebot lệch.
- 1 page, hiển thị 5 currency theo dropdown nhưng URL không đổi → Google không phân biệt được country.
- ccTLD nhưng không có content local → site rỗng.
- GSC International Targeting set sai (vd set US cho property /vi/).
- Subdomain thiếu hreflang → 2 domain phân biệt nhưng Google không liên kết.
- LocalBusiness schema khai address fake để rank local.
- Hosting trên server xa target → TTFB cao + signal yếu (subordinate to hreflang).
- Bỏ qua local search engine Trung Quốc, Hàn Quốc khi target market đó.
- Citation NAP (Name, Address, Phone) không đồng bộ giữa các directory → trust giảm.
- Quên local payment method → bounce ở checkout.
- Compliance text thiếu (GDPR cookie banner, VAT included EU).
- Cloak Googlebot khác user → manual action.

---
**Đầu ra**: country playbook đầy đủ với URL + hreflang + on-page geo signal + citation + GBP + monitoring per region.
