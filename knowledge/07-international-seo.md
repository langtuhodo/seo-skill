# Knowledge Note — International SEO

**Trigger**: khi user nhắc "hreflang", "multilingual", "đa ngôn ngữ", "geo target", "localization", "ccTLD", "subdomain market", "international SEO", "expand market".

## Mục đích

Site phục vụ multi-language + multi-region cần kiến trúc đặc thù: hreflang, URL structure, content localization, geo signal, payment + currency local.

## Khái niệm cốt lõi

### Hreflang
- Reciprocal + self-reference bắt buộc (A → B và B → A)
- 3 method: HTML head, HTTP header, sitemap
- x-default: trang fallback cho user không match region nào
- Language-only (`en`) vs language-region (`en-us`, `en-gb`)

### URL Structure — Decision Tree
- **ccTLD** (`example.de`): mạnh nhất geo signal, đắt + phức tạp, mỗi domain build authority riêng
- **Subdomain** (`de.example.com`): geo signal trung bình, GSC manage riêng, authority ít transfer
- **Subfolder** (`example.com/de/`): geo signal yếu hơn nhưng share authority, đơn giản nhất — **recommend cho hầu hết**

### Multi Language — Tier Translation
- Tier 1 (20%): human translate — critical pages (Core Section, landing)
- Tier 2 (50%): AI + human edit — supporting content
- Tier 3 (30%): AI only — low-priority Outer Section

### Geo Targeting — Signal Stack
- ccTLD / subfolder / subdomain
- GSC International Targeting setting
- Hreflang tags
- Language of content
- Schema LocalBusiness
- Local payment method
- Local search engine optimization (Yandex, Baidu, Naver)

### Localization (beyond translation)
- Visual: model, font, color phù hợp văn hóa
- Format: currency, date, phone, address
- Behavioral: payment method, shipping, return policy
- Tone: formal vs informal theo culture
- Compliance: GDPR, local regulations

## Sub-skills

1. **Hreflang** — reciprocal, x-default
2. **Multi Language** — ccTLD vs subdomain vs subfolder
3. **Geo Targeting** — geo signal stack
4. **Localization** — currency, date, payment, tone

## Workflow — Expand market

1. Market validation (search demand local, competitor, payment method, regulatory)
2. Architecture decision (subfolder default)
3. Content priority phasing (Tier 1/2/3 translation)
4. Hreflang implementation + validate
5. GSC International Targeting cho subfolder/subdomain
6. Localization beyond text (currency, date, phone, address, payment, shipping)
7. Local schema (LocalBusiness, currency, region)
8. Local backlink (xem `06-off-page-seo.md`)
9. Local search engine (Yandex, Baidu, Naver, Yahoo Japan)

## Khi nào dùng

- Khi expand sang market mới
- Audit hreflang error (GSC)
- Khi traffic 1 region drop suddenly
- Khi pivot từ ccTLD → subfolder hoặc ngược lại

## Tools

- Hreflang Tags Generator + Validator (Aleyda)
- Merkle Hreflang Validator
- Screaming Frog hreflang report
- Smartcat / Crowdin / Lokalise (CAT)
- DeepL / GPT-4 (machine translation)
- GSC International Targeting

## File tham chiếu

- `skills/international/Hreflang/SKILL.md`
- `skills/international/Multi Language/SKILL.md`
- `skills/international/Geo Targeting/SKILL.md`
- `skills/international/Localization/SKILL.md`

## Common pitfall

- Hreflang non-reciprocal (A → B nhưng B không → A)
- Self-reference hreflang thiếu
- Hreflang trên page noindex
- x-default bỏ qua
- Auto-redirect theo IP → user không chọn được + Googlebot bị redirect sai
- AI translate full không edit → quality kém
- Localization chỉ dịch text — bỏ qua currency, date, payment
- Bỏ qua Yandex / Baidu / Naver cho market đó
- Tin Google Translate widget = international SEO — sai (không index client-side)
- Mỗi market chia subdomain riêng nhưng không có content riêng → thin variant
