# Knowledge Note — Technical SEO

**Trigger**: khi user nhắc "technical SEO", "crawl", "index", "robots.txt", "sitemap", "canonical", "schema", "structured data", "Core Web Vitals", "site speed", "Lighthouse", "log analysis", "GSC indexing issue".

## Mục đích

Đảm bảo Googlebot crawl + index đúng trang đúng nội dung + người dùng tải nhanh + Google parse được entity. Infrastructure layer — nếu technical sai, content hay mấy cũng không rank.

## Khái niệm cốt lõi

### Crawlability
- robots.txt: syntax đúng, không block css/js/image
- robots meta: index/noindex, follow/nofollow
- Crawl budget: tối ưu cho site lớn, tránh waste (parameter, facet, internal search)
- Server log analysis: biết Googlebot crawl gì, bao nhiêu, tần suất
- Bot policy: allow/disallow cho AI bots (GPTBot, ClaudeBot, PerplexityBot)

### Indexing
- index/noindex strategy: chỉ index trang có giá trị
- GSC Coverage report: Valid / Excluded / Error
- Discovered-not-indexed: thường do thin content hoặc crawl budget
- Crawled-not-indexed: thường do quality issue
- Soft 404: trang trả 200 nhưng content trống/thin

### Site Speed — Core Web Vitals
- **LCP** (Largest Contentful Paint) < 2.5s — tốc độ load element lớn nhất
- **INP** (Interaction to Next Paint) < 200ms — responsiveness
- **CLS** (Cumulative Layout Shift) < 0.1 — visual stability
- TTFB < 800ms
- Field data (CrUX) > Lab data (Lighthouse) — field mới là ranking signal

### Schema Markup
- JSON-LD format (không Microdata)
- Types: Article, FAQ, HowTo, Product, Breadcrumb, Organization, Person, LocalBusiness
- sameAs: link entity tới Wikipedia, LinkedIn, social profiles
- Validation: Rich Results Test + Schema.org Validator
- Speakable: cho AI/voice search

### Canonical Tags
- Self-referential canonical trên mọi URL primary
- Consolidate URL variants: http/https, www/non-www, trailing slash, parameters
- Cross-domain canonical khi syndicate content
- Không canonical tới homepage (lỗi phổ biến)

### XML Sitemaps
- ≤ 50,000 URL/file, ≤ 50MB uncompressed
- lastmod accurate (= last edit date thực, không auto-generate)
- Multi sitemap by content type (post, page, product, video, news)
- Chỉ chứa URL canonical, indexable, 200
- Submit GSC + Bing Webmaster

## Sub-skills

1. **Crawlability** — robots.txt, crawl budget, log analysis
2. **Indexing** — index/noindex, GSC Coverage
3. **Site Speed** — Core Web Vitals (LCP/INP/CLS)
4. **Schema Markup** — JSON-LD Article/FAQ/Product/Organization
5. **Canonical Tags** — consolidate URL variants
6. **XML Sitemaps** — lastmod, multi sitemap

## Workflow — Technical audit

1. Crawl site (Screaming Frog / Sitebulb)
2. Compare sitemap vs index (GSC Coverage)
3. Check robots.txt + AI bot policy
4. Run Lighthouse + PSI + WebPageTest 5 critical URL
5. Schema validator (Rich Results Test, Schema.org)
6. Canonical audit (cross-domain, parameter, http/https, www)
7. Sitemap submit GSC + Bing Webmaster
8. Server log analysis (tìm crawl waste)
9. Document issue + priority fix (Critical/High/Medium/Low)

## Khi nào dùng

- Bắt đầu dự án — bắt buộc audit technical
- Sau migration / redesign
- Quarterly audit
- Khi GSC report error
- Khi traffic drop suddenly (technical issue có thể là root cause)

## Tools

- Screaming Frog / Sitebulb (crawler)
- GSC (Coverage, Inspection, Crawl Stats, Sitemap)
- Bing Webmaster Tools
- Lighthouse / PSI / WebPageTest
- Schema App / RankMath (schema)
- Rich Results Test / Schema.org Validator
- Cloudflare / Cloudways (CDN, TTFB)
- GoAccess / Screaming Frog Log Analyzer

## File tham chiếu

- `skills/technical/Crawlability/SKILL.md`
- `skills/technical/Indexing/SKILL.md`
- `skills/technical/Site Speed/SKILL.md`
- `skills/technical/Schema Markup/SKILL.md`
- `skills/technical/Canonical Tags/SKILL.md`
- `skills/technical/XML Sitemaps/SKILL.md`

## Common pitfall

- Disallow css/js/image trong robots.txt → Google không render
- Noindex quên gỡ sau staging
- Canonical tự-tham chiếu sai (canonical tới homepage)
- Sitemap chứa URL noindex / 404 / canonical to other
- Schema HowTo / FAQ trên trang không phù hợp → manual action
- Bỏ qua Core Web Vitals mobile field (chỉ nhìn lab)
- LCP image lazy-load → score 5s+
- Crawl budget waste do facet / search internal / parameter
- lastmod sitemap auto-generate hàng ngày → Google mất trust
- Bỏ qua AI bot policy → mất LLM visibility
