# Multi Language — Đa ngôn ngữ

## 1. Purpose / Mục đích
Skill này tập trung vào **chiến lược + kiến trúc đa ngôn ngữ** (architecture + content strategy + technical setup), trước khi đi vào hreflang chi tiết. Quyết định kiến trúc sai từ đầu là một trong những nợ kỹ thuật đắt nhất trong SEO — migration sau đó tốn 6–12 tháng và mất 30–60% traffic.

## 2. Core Concepts / Khái niệm cốt lõi

- **Translation vs Localization**: dịch từng từ vs adapt văn hoá, đơn vị tiền, ví dụ, format ngày, idiom.
- **URL strategy** (3 lựa chọn):
  - ccTLD (example.vn, example.de): geo signal mạnh nhất, audience trust cao, nhưng cost domain + chia rẽ authority + bảo trì khó.
  - Subdomain (vi.example.com): tách như site riêng, kế thừa root authority phần nào.
  - Subfolder (example.com/vi/): kế thừa toàn bộ authority root, dễ bảo trì → recommend cho hầu hết case.
- **Geo targeting** vs **Language targeting**: cùng 1 ngôn ngữ có thể nhắm nhiều country (en-US vs en-GB). Khác content (giá, currency, ví dụ địa phương).
- **Auto-translate**: KHÔNG dùng cho content mà Google index. Auto-translate được Google flag là "low quality".
- **AI-translate + human review**: pattern hiện tại — fast + đủ chất lượng nếu có editor native review.

## 3. When to use
- Khi launch thị trường mới.
- Khi audit kiến trúc multi-language hiện tại.
- Trước khi commit resource lớn vào localization.

## 4. Workflow

### Bước 1. Validate market
Trước khi build:
- Search demand cho ngách trong country target (Ahrefs / Semrush / GKP với location filter).
- Competitive landscape (đối thủ local).
- Pay-per-click cost (proxy cho commercial intent).
- Business model fit (payment, shipping, support local).
- Legal compliance (GDPR EU, dữ liệu CN, …).

Nếu không có pathway từ traffic → revenue ở thị trường đó → không launch.

### Bước 2. Chọn URL strategy

| Strategy | Pro | Con | When |
|---|---|---|---|
| ccTLD | Geo signal mạnh, brand local | Cost cao, bảo trì khó, chia rẽ authority | Brand đã lớn, mỗi country có pháp nhân riêng |
| Subdomain | Tách logic, dễ phân quyền team | Yếu hơn root domain, treat như site mới | Khi cần phân quyền team / infrastructure tách |
| Subfolder | Inherit authority, easy migration, ngân sách thấp | Geo signal yếu hơn ccTLD | Default recommend cho ≤ 5 thị trường |

Hybrid: ccTLD cho 2 thị trường lớn nhất + subfolder cho phần còn lại.

### Bước 3. Folder/URL structure

Subfolder pattern:
```
example.com/                  → en (default)
example.com/vi/               → tiếng Việt
example.com/ja/               → tiếng Nhật
example.com/es-mx/            → Spanish-Mexico
example.com/es-es/            → Spanish-Spain
```

Quy tắc:
- Mã ngôn ngữ + region khi cần (es-mx vs es-es).
- Mọi URL đối xứng: `/blog/seo` ↔ `/vi/blog/seo` ↔ `/ja/blog/seo`.
- Slug có thể dịch (`/vi/cach-viet-title-tag`) → tốt hơn cho local CTR, nhưng phức tạp redirect khi đổi.

### Bước 4. Translation strategy

**Tier 1 content** (top page, money page, pillar):
- Human-translated bởi native speaker chuyên ngành.
- Editor review.
- Adapt cultural, ví dụ local.

**Tier 2 content** (supporting blog):
- AI-translate (DeepL, GPT-4) + native human edit.
- Quality gate: native reader feedback test.

**Tier 3 content** (pSEO, low-priority):
- AI-translate full.
- Sample QA random.

Đừng dùng Google Translate widget client-side — đó không phải localization, là noindex bẫy.

### Bước 5. Localization beyond text
- Currency.
- Date format (DD/MM/YYYY vs MM/DD/YYYY).
- Decimal/thousand separator (1,000.50 vs 1.000,50).
- Phone format.
- Address.
- Image (model + setting trông local).
- Tone (formal Japanese vs casual VN).
- Color cultural meaning.
- Holiday + seasonal campaign theo locale.

### Bước 6. Technical setup
- Server-side detect Accept-Language → KHÔNG auto-redirect (Google Bot crawl từ US, sẽ bị redirect sai).
- Recommend: trang home có language picker + cookie nhớ choice.
- Hreflang full implement (skill Hreflang).
- XML Sitemap riêng cho mỗi language hoặc gộp với hreflang trong 1 sitemap.
- robots.txt cùng 1 file (root).
- GSC: 1 property cho mỗi language (subfolder vẫn cùng property root, set International Targeting cho từng folder qua hreflang).

### Bước 7. Content priority
Đừng dịch toàn site ngày 1. Priority:
1. Home + product/service core.
2. Top 20% blog post theo traffic.
3. Pillar / pricing / about / contact.
4. FAQ + customer support content.
5. Toàn bộ blog (long-term).

### Bước 8. Translation workflow
- Source content lock (không sửa) trước khi gửi dịch.
- Translation memory (CAT tool: Smartcat, Crowdin, Lokalise) cho consistency.
- Glossary brand term (giữ nguyên hoặc dịch chuẩn).
- QA: native review + functional test (button label fit UI).
- Publish + add hreflang.
- Refresh cùng cadence với source language.

### Bước 9. Local SEO + content
- Local keyword research (term local có thể khác direct translation — vd "SEO" giữ nguyên ở VN nhưng "tối ưu công cụ tìm kiếm" rare).
- Local backlink (từ site .vn, .de — tin signal local).
- Local social account.
- Local Google Business Profile nếu có physical office.

### Bước 10. Audit
Quarterly:
- Per-language traffic breakdown.
- Per-language conversion rate.
- Hreflang error.
- Translation freshness (source updated nhưng các version chưa).

## 5. Template Multi-Language Strategy Doc

```
Languages launching: ...
URL strategy: ccTLD / Subdomain / Subfolder
Content priority phase 1: ...
Translation tier matrix: ...
Localization checklist (currency, date, ...): ...
Hreflang plan: ...
GSC property setup: ...
KPI per market: traffic / conversion / RD / brand search
Maintenance cadence: weekly content sync, quarterly audit
```

## 6. KPI đo lường
- # market launched.
- Per-market organic traffic.
- Per-market revenue / conversion.
- Translation freshness ratio.
- Hreflang error count.
- Per-market RD growth.
- Brand search volume per market.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Smartcat / Crowdin / Lokalise / Phrase | Paid | TMS / translation memory |
| DeepL Pro | Paid | AI translation |
| ChatGPT/Claude | Freemium | Draft + cultural adapt |
| Native human reviewer (Upwork, Hubstaff Talent) | Paid | Quality gate |
| Ahrefs / Semrush localized database | Paid | Local keyword |
| GSC | Free | Per-folder traffic |
| Wordable | Paid | Sync Google Doc → CMS |
| Wix Multilingual / Weglot / WPML | Paid | Plug-in approach (cảnh báo: đôi khi tạo URL kém) |

## 8. Common mistakes
- Auto-translate widget toàn site → low quality + noindex risk.
- Subdomain bị treat như site mới mà không có content + link plan riêng.
- Mỗi market rebuild from scratch không reuse asset.
- Quên localization beyond text (currency, date) → trust drop.
- Auto-redirect theo IP → Googlebot bị redirect sai.
- Dịch URL slug rồi đổi tiếp → nợ redirect.
- Quên hreflang → cannibalization giữa version.
- Mỗi version self-canonical về language khác → loại nhau khỏi index.
- Launch market mà không có local backlink / social.
- Bỏ qua local search engine (Yandex Russia, Baidu China, Naver Korea) ở thị trường relevant.
- Translate content nhưng không update khi source thay đổi.
- Không có editor native — content lủng củng → trust kém.
- Sử dụng ccTLD nhưng không có pháp nhân local → khó claim ownership.

---
**Đầu ra**: chiến lược multi-language end-to-end với architecture + content priority + workflow + KPI per market.
