---
name: schema-markup
version: 1.0.0
description: "Use this skill when the user asks to add JSON-LD / schema markup: 'schema Article', 'JSON-LD FAQ', 'tạo schema markup', 'structured data {Type}'. Covers schema.org types (Article, FAQPage, Product, LocalBusiness, HowTo, Review, BreadcrumbList), JSON-LD generation, validation. Output: projects/{project}/technical/schema-{Type}.json."
category: technical
---

# Schema Markup — Dữ liệu có cấu trúc

> **Output path 2026 (folder-scoped)**:
> - **JSON-LD snippets** → `projects/{project}/technical/schema-{Type}.json` (Article, FAQPage, Product, Organization, BreadcrumbList, ProfilePage, SoftwareApplication...)
> - **Schema strategy document** → `projects/{project}/technical/schema-strategy.md`
>
> Tạo folder `technical/` nếu chưa có. KHÔNG lưu schema-*.json hoặc audit technical trực tiếp ở root project. Chi tiết: `AGENTS.md` Section "GENERATE OUTPUT".

## 1. Purpose / Mục đích
Schema (structured data) cho phép Google + AI Search hiểu content theo **entity + relationship**, kích hoạt **rich result** (FAQ, How-to, Review star, Product price, Recipe, Breadcrumb, Organization knowledge panel). Schema không phải ranking factor trực tiếp nhưng (1) tăng CTR 10–30% nhờ rich snippet, (2) giúp AI Overview / LLM cite content chính xác, (3) là tín hiệu chuyên nghiệp + EEAT.

## 2. Core Concepts / Khái niệm cốt lõi

- **Schema.org**: vocabulary chuẩn được Google/Bing/Yandex hỗ trợ.
- **Format**: JSON-LD (recommend), Microdata, RDFa. Google ưu tiên JSON-LD trong `<head>`.
- **Type quan trọng** cho SEO:
  - `Organization` / `LocalBusiness`
  - `WebSite` (Sitelinks search box)
  - `BreadcrumbList`
  - `Article` / `BlogPosting` / `NewsArticle`
  - `Product` + `Offer` + `AggregateRating` + `Review`
  - `Recipe`, `HowTo`, `FAQPage`, `QAPage`
  - `Person` (author)
  - `VideoObject`
  - `Event`, `JobPosting`, `Course`
  - `Service`
- **Eligible for rich result**: chỉ một số type được Google hiển thị rich result. Xem Google Search Gallery.
- **2023–2024 changes**: FAQ rich result chỉ còn cho gov/health authoritative; HowTo bị giảm hiển thị. Vẫn nên implement cho semantic understanding.
- **AI/LLM**: schema giúp model tổng hợp dữ liệu chính xác — đặc biệt entity (sameAs, identifier).

## 3. When to use
- Mỗi loại trang nên có schema phù hợp.
- Khi muốn capture rich result.
- Khi xây entity authority cho brand (Organization + sameAs).
- Khi audit site phát hiện thiếu schema cơ bản.

## 4. Workflow implement

### Bước 1. Map schema theo loại trang
| Loại trang | Schema chính | Schema phụ |
|---|---|---|
| Home | WebSite + Organization | Breadcrumb |
| Blog | Article/BlogPosting + Person (author) + Breadcrumb | FAQPage nếu có Q&A |
| Pillar guide | Article + HowTo (nếu step) + FAQPage + Breadcrumb | |
| Product | Product + Offer + AggregateRating + Review + Breadcrumb | |
| Category | CollectionPage + ItemList + Breadcrumb | |
| Local business | LocalBusiness + PostalAddress + GeoCoordinates + OpeningHoursSpecification | |
| Recipe | Recipe + Person (author) + AggregateRating + VideoObject | |
| Review | Review + ItemReviewed | |
| FAQ page | FAQPage | |
| Comparison | Article + (Product) per item | |
| Video page | VideoObject + Article | |
| Job | JobPosting | |
| Course | Course | |

### Bước 2. JSON-LD template

**Organization** (đặt trên home + có thể trên mọi trang qua global script):
```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Tên Brand",
  "url": "https://example.com",
  "logo": "https://example.com/logo.png",
  "sameAs": [
    "https://www.facebook.com/...",
    "https://www.linkedin.com/company/...",
    "https://twitter.com/...",
    "https://www.youtube.com/@..."
  ],
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "+84...",
    "contactType": "customer service",
    "areaServed": "VN",
    "availableLanguage": ["vi", "en"]
  }
}
```

**Article + Author + Publisher**:
```json
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "Tiêu đề bài",
  "description": "Mô tả ngắn",
  "image": ["https://.../1x1.jpg","https://.../4x3.jpg","https://.../16x9.jpg"],
  "datePublished": "2025-01-15T08:00:00+07:00",
  "dateModified": "2025-04-20T10:00:00+07:00",
  "author": {
    "@type": "Person",
    "name": "Nguyen Van A",
    "url": "https://example.com/author/nguyen-van-a",
    "sameAs": ["https://linkedin.com/in/...", "https://twitter.com/..."]
  },
  "publisher": {
    "@type": "Organization",
    "name": "Tên Brand",
    "logo": { "@type": "ImageObject", "url": "https://example.com/logo.png" }
  },
  "mainEntityOfPage": "https://example.com/blog/slug"
}
```

**Product + Offer + Review**:
```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Tên sản phẩm",
  "image": ["..."],
  "description": "...",
  "sku": "SKU123",
  "brand": { "@type": "Brand", "name": "BrandX" },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/p/...",
    "priceCurrency": "VND",
    "price": "1290000",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "reviewCount": "128"
  }
}
```

**Breadcrumb**:
```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://example.com/" },
    { "@type": "ListItem", "position": 2, "name": "Blog", "item": "https://example.com/blog/" },
    { "@type": "ListItem", "position": 3, "name": "SEO", "item": "https://example.com/blog/seo/" }
  ]
}
```

**FAQPage**:
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Schema có giúp tăng rank không?",
      "acceptedAnswer": { "@type": "Answer", "text": "Schema không phải ranking factor trực tiếp..." }
    }
  ]
}
```

### Bước 3. Validate
- **Schema.org Validator**: validator.schema.org.
- **Google Rich Results Test**: search.google.com/test/rich-results.
- **GSC → Enhancements** (Article, Product, FAQ, Breadcrumb, Sitelinks search box).
- Test trên cả URL live + raw HTML.

### Bước 4. Implementation patterns
- **Static**: hard-code JSON-LD trong template (Next.js `Head`, WordPress functions.php).
- **Plugin**: Yoast, RankMath, Schema Pro (WordPress).
- **Tag Manager**: trong GTM với Custom HTML — OK nhưng chậm hơn.
- **Programmatic** (cho ecommerce ≥ 1000 SKU): generate từ database ra JSON-LD.

### Bước 5. Entity SEO + Knowledge Graph
- Đảm bảo Organization có `sameAs` đầy đủ social + Wikipedia nếu có + Crunchbase.
- Person (founder, key author) có Wikidata entry, LinkedIn, GitHub, Twitter — link qua sameAs.
- Đăng ký Google Knowledge Panel (suggest edit) khi đã có entity authority.
- Brand mention không link cũng là tín hiệu — kết hợp với Off-page SEO.

### Bước 6. Audit định kỳ
- Mỗi tháng GSC Enhancements: error giảm về 0.
- Schema còn relevant với content? (FAQ schema cho trang không có FAQ là vi phạm guideline → manual action).
- Cập nhật khi Google đổi spec (theo dõi Google Search Central Blog).

## 5. Template Audit Sheet

| URL | Template | Schema present | Schema missing | Validation status | Rich result eligible | GSC error count | Action |

## 6. KPI đo lường
- # URL có schema đúng / total (mục tiêu 100% theo template policy).
- # GSC enhancement error.
- # rich result impression trong GSC (Performance → Search appearance).
- CTR rich result vs non-rich.
- # Knowledge panel claimed.
- AI Overview citation count (manual track).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Rich Results Test | Free | Validation chính |
| Schema.org Validator | Free | Validation theo spec gốc |
| GSC Enhancements | Free | Track error toàn site |
| Schema Pro / Yoast / RankMath | Paid/Free | WP automation |
| Merkle Schema Generator | Free | Quick generate JSON-LD |
| Schema App | Paid | Enterprise schema management |
| Screaming Frog (Custom Extraction + Schema validation) | Paid | Audit toàn site |
| Wikidata, Crunchbase | Free | Entity sameAs source |
| ChatGPT/Claude | Freemium | Generate JSON-LD nhanh |

### Prompt LLM
```
Sinh JSON-LD schema cho 1 trang loại "{type}" với data sau:
{paste data}
Yêu cầu validate Google Rich Results spec mới nhất, dùng @context "https://schema.org", trả về JSON đầy đủ, không markdown.
```

## 8. Common mistakes
- Schema không khớp content (FAQ schema mà page không có FAQ visible) → vi phạm guideline.
- Mark schema cho aggregate rating fake → manual action.
- Schema trên 1 vài URL nhưng inconsistent.
- Sai @type (Article cho product page).
- Thiếu required field → không eligible rich result.
- Không update dateModified khi refresh content.
- Multiple schema cùng @type khác data trên 1 trang → conflict.
- Quên BreadcrumbList — đây là rich result phổ biến + dễ implement.
- Bỏ qua Person/Organization sameAs → mất cơ hội Knowledge Graph.
- Plugin tạo schema lỗi → không validate trước khi deploy.

---
**Đầu ra**: schema policy theo template, JSON-LD generated tự động, GSC Enhancements clean.
