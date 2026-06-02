---
name: localization
version: 1.0.0
description: "Use this skill when the user asks about content localization: 'localization', 'bản địa hoá nội dung', 'dịch + adapt content', 'culture adaptation'. Covers translation vs localization, cultural adaptation, locale-specific keyword research."
category: international
---

# Localization — Bản địa hoá nội dung & trải nghiệm

## 1. Purpose / Mục đích
Localization đi xa hơn dịch text — là **adapt content + UX + offering theo văn hoá, hành vi, kỳ vọng của thị trường target**. Site dịch tốt vẫn có thể fail nếu hình ảnh, tone, ví dụ, payment, hoặc UX không match. Localization là multiplier biến traffic local thành revenue.

## 2. Core Concepts / Khái niệm cốt lõi

- **Translation ⊂ Localization**: dịch chỉ là 1 mảnh.
- **Cultural fit**: humour, idiom, color, model trong ảnh, holiday calendar.
- **Format**: ngày, giờ, tiền, đơn vị, số phone.
- **Buyer behavior**: phương thức thanh toán ưu tiên (Momo VN, Alipay TQ, Pix BR), shipping kỳ vọng, return policy.
- **Trust signal local**: review từ user local, certification địa phương, partnership địa phương.
- **Tone & register**: VN có sự khác biệt formal/informal mạnh; Japan có keigo; Đức formal hơn US.
- **Local SERP behavior**: cùng keyword khác tỉ lệ click vs scroll, video vs blog, AI Overview adoption.

## 3. When to use
- Sau khi technical hreflang + URL strategy đã đúng.
- Trước khi launch market mới — checklist localization là điều kiện đủ.
- Khi audit market underperform (traffic OK nhưng conversion thấp).

## 4. Workflow Localization

### Bước 1. Audit "translatable layer" (text)
- Source content lock.
- Translation memory + glossary brand.
- Tier translation: human (Tier 1) / AI + edit (Tier 2) / AI (Tier 3).
- Editor native review tone + cultural.

### Bước 2. Visual localization
- Ảnh model: nhân vật trong ảnh phù hợp ethnicity, fashion, setting.
- Ảnh UI/screenshot: dùng phiên bản UI ngôn ngữ tương ứng.
- Icon: 1 số icon có nghĩa khác giữa văn hoá (vd palm-up Vietnam vs Mỹ).
- Color: red = lucky China, danger US.
- Typography: font support diacritics (VN), CJK, Arabic RTL.
- RTL layout (Arabic, Hebrew): mirror toàn UI.

### Bước 3. Format localization
- Currency: VND, USD, EUR, JPY (no decimal cho JPY).
- Date: DD/MM/YYYY vs MM/DD/YYYY vs YYYY-MM-DD.
- Time: 12h vs 24h.
- Decimal: 1,234.56 vs 1.234,56.
- Phone format: +84 ... cho VN, +1 ... cho US.
- Address: format theo postal standard (Japan: postal code → prefecture → city → street).

### Bước 4. Behavioral / commerce localization
- Phương thức thanh toán:
  - VN: Momo, ZaloPay, VNPAY, COD.
  - JP: konbini, LINE Pay, Pay-easy.
  - BR: Pix, Boleto.
  - DE: SEPA, Sofort, Klarna.
  - CN: WeChat Pay, Alipay.
- Shipping: SLA, carrier, packaging.
- Return policy theo law.
- Tax: include/exclude VAT, GST, sales tax.
- Loyalty / coupon model phù hợp văn hoá.

### Bước 5. Tone & voice
- Persona local: voice của brand trong ngôn ngữ này như thế nào?
- Formal vs informal:
  - VN: "anh/chị" vs "bạn".
  - JP: keigo vs casual.
  - DE: Sie vs du.
  - ES: usted vs tú.
- Idiom + slang: dùng đúng generation, đúng ngữ cảnh.
- Humour: KHÔNG translate humor — refresh humor cho văn hoá target.
- Brand name: pronunciation, có cần Romanization không?

### Bước 6. Local content + topical
- Local case study, customer story, testimonial.
- Local data, statistics, partner.
- Local event / holiday content (Tết, Mid-Autumn, Kingsday, Diwali).
- Local controversy / sensitive topic — avoid hoặc treat carefully.
- SEO keyword local (đôi khi khác direct translation).

### Bước 7. UX localization
- Form field order: name first/last theo locale.
- Address input: postcode auto-fill (UK, JP, KR).
- Time zone aware (event scheduling).
- Phone input prefix.
- Trust badge local (Visa/Mastercard universal nhưng thêm Momo/Alipay tuỳ market).
- Accessibility: lang attribute, screen reader local.

### Bước 8. Compliance + legal
- GDPR (EU): cookie consent, data subject rights.
- CCPA (California).
- LGPD (Brazil).
- VAT/GST/Tax invoice.
- Local advertising law (vd: ngành dược, tài chính, casino).
- Age gating cho alcohol/tobacco.
- Term & conditions theo law local.

### Bước 9. Local SEO content
- Local kw research (tool DB local: Ahrefs VN, Semrush BR).
- Soi top 10 SERP local: format khác?
- Adapt content theo SERP intent.
- Local citation + backlink.

### Bước 10. Validate + iterate
- Native user test: 5–10 user local đánh giá content.
- A/B test landing page localized vs translated.
- Heatmap local user behavior (Hotjar / Microsoft Clarity).
- Conversion rate per market — gap → audit localization.

## 5. Template Localization Checklist (per market)

- [ ] Translation tier matrix
- [ ] Glossary brand
- [ ] Native editor review
- [ ] Image with local model/setting
- [ ] UI screenshot local language
- [ ] Color cultural fit
- [ ] Typography support
- [ ] RTL nếu cần
- [ ] Currency, date, time, number format
- [ ] Phone + address format
- [ ] Local payment method
- [ ] Shipping policy
- [ ] Return policy
- [ ] VAT/Tax handled
- [ ] Voice + tone defined
- [ ] Local case study + testimonial
- [ ] Local holiday/event content
- [ ] GDPR/CCPA/LGPD compliance
- [ ] Local backlink + citation
- [ ] GBP local
- [ ] Native user test
- [ ] Conversion per-market track

## 6. KPI đo lường
- Conversion rate per market vs baseline source language.
- AOV per market.
- Bounce rate per market.
- Cart abandonment per market.
- Translation freshness ratio.
- # localization defect raised by user (CS ticket).
- Time-to-launch new market.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Smartcat / Crowdin / Lokalise | Paid | TMS + glossary + workflow |
| Phrase | Paid | Enterprise localization |
| DeepL Pro / GPT-4 / Claude | Freemium/Paid | AI translate |
| Wordable / Smartling | Paid | Sync CMS |
| Hotjar / Clarity | Freemium | UX behavior per market |
| Stripe / Adyen / 2C2P | Paid | Payment local |
| Geolocation API (ipinfo, ipapi) | Freemium | Detect (suggest, không redirect) |
| User testing platform local (UserTesting.com, Maze) | Paid | Native QA |
| Native freelancer (Upwork, Toptal) | Paid | Editor / proofreader |
| Notion / Coda | Free | Localization handbook |

## 8. Common mistakes
- Coi "translate" = "localize" → conversion thấp.
- Dùng 1 ảnh model US cho toàn site VN/JP → user không nhận diện.
- Không đổi format date/currency.
- Không support payment local → bounce checkout.
- Translate humor word-for-word → confusing.
- Tone formal/informal sai (VN ép "you" thành "bạn" cho audience C-level → kém professional).
- Bỏ qua RTL cho Arabic.
- Compliance text generic không theo law local → legal risk.
- Holiday/seasonal campaign sai timezone.
- Brand name không kiểm tra pronunciation / negative meaning local (vd brand "X" nghĩa thô tục ngôn ngữ Y).
- Không có editor native — text dịch đúng nhưng đọc lủng củng.
- Không track conversion per-market → invisible problem.
- Quên test với user thật trước khi launch.

---
**Đầu ra**: Localization Handbook per market + checklist + audit + iterating với user feedback local.
