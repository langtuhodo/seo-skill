# Playbook — Technical SEO Audit

**Mục tiêu**: full technical audit + priority fix list trong 1-2 tuần.

**Đầu vào**: domain + GSC + Bing Webmaster + crawl tool + log access (nếu có).

**Đầu ra**: report 30+ findings với priority + fix instruction.

**Skill liên quan**: Technical SEO toàn bộ 6 skill + UX/Page Speed UX + UX/Mobile Optimization + AI SEO/LLM Visibility.

---

## Phase 1 — Setup (Day 1)

1. Verify GSC + Bing Webmaster property.
2. Cấu hình crawl tool: Screaming Frog / Sitebulb.
   - User-agent: Googlebot Smartphone.
   - Render JS: yes (nếu site SPA).
   - Crawl rate phù hợp server.
3. Export 16 tháng GSC data → BigQuery.
4. Server log access: 30 ngày gần nhất.
5. CDN log (Cloudflare / Fastly).

## Phase 2 — Crawlability (Day 1-2)

Check:
- [ ] robots.txt syntax + content.
- [ ] AI bot policy: GPTBot, ClaudeBot, PerplexityBot, Google-Extended, applebot-extended.
- [ ] Disallow paths không quá restrictive.
- [ ] Sitemap reference trong robots.txt.
- [ ] Crawl depth ≤ 3 từ home cho 80% URL.
- [ ] Orphan pages count.
- [ ] Internal redirects chain (≥ 3 hop = bad).
- [ ] 4xx/5xx error count.
- [ ] Crawl budget waste (parameter URL, internal search, facet).
- [ ] Server log: bot crawl distribution per content type.

Tools: Screaming Frog Custom Search, GoAccess log analyzer, GSC Crawl Stats.

## Phase 3 — Indexing (Day 2-3)

Check:
- [ ] GSC Coverage report: Valid / Excluded / Error count.
- [ ] Discovered – currently not indexed: list URL.
- [ ] Crawled – currently not indexed: list URL (check thin/duplicate).
- [ ] Soft 404.
- [ ] Index bloat: index URL count vs unique content URL.
- [ ] Noindex audit: page nào noindex? đúng ý?
- [ ] Unwanted indexed: dev/staging/internal page bị index?
- [ ] Compare sitemap URL vs GSC indexed.

Action plan per category.

## Phase 4 — Site Speed + CWV (Day 3-4)

Check:
- [ ] LCP mobile field 75th percentile < 2.5s (CrUX).
- [ ] INP mobile field < 200ms.
- [ ] CLS < 0.1.
- [ ] TTFB < 800ms.
- [ ] Lighthouse mobile score 5 critical URL.
- [ ] WebPageTest filmstrip top 5 URL.
- [ ] LCP image preload + no lazy.
- [ ] Critical CSS inline.
- [ ] JS bundle size + tree-shaking.
- [ ] 3rd party tag impact.
- [ ] Font loading strategy.
- [ ] CDN config + cache header.
- [ ] HTTP/2 hoặc HTTP/3.
- [ ] Compression (Brotli > gzip).

Tools: PageSpeed Insights, WebPageTest, Lighthouse CI, Chrome UX Report API.

## Phase 5 — Mobile (Day 4)

Check:
- [ ] Viewport meta đúng.
- [ ] Tap target ≥ 48px.
- [ ] Font ≥ 16px body.
- [ ] No horizontal scroll.
- [ ] No `user-scalable=no`.
- [ ] No intrusive interstitial.
- [ ] Real device test ≥ 5 device.
- [ ] Mobile-first indexing đã active (GSC).

Tools: BrowserStack, Mobile-Friendly Test (deprecated nhưng vẫn check), Lighthouse mobile.

## Phase 6 — Schema + Structured Data (Day 4-5)

Check:
- [ ] Article schema valid + đủ field.
- [ ] FAQPage schema (chỉ trang FAQ thực).
- [ ] HowTo schema (chỉ tutorial).
- [ ] Product schema (e-com).
- [ ] BreadcrumbList.
- [ ] Organization sameAs (Wikipedia, LinkedIn, Twitter, ...).
- [ ] Person sameAs cho author.
- [ ] LocalBusiness (nếu local).
- [ ] WebSite + SearchAction.
- [ ] Speakable (cho AI).
- [ ] Schema test 20 URL critical: Rich Results Test pass.
- [ ] GSC Enhancements report: error count.

Tools: Schema.org Validator, Rich Results Test, GSC Enhancements.

## Phase 7 — Canonical + Duplicate (Day 5)

Check:
- [ ] Self-referential canonical mọi URL primary.
- [ ] Cross-domain canonical hợp lý.
- [ ] http vs https canonical.
- [ ] www vs non-www.
- [ ] Trailing slash consistency.
- [ ] Parameter URL canonical → clean URL.
- [ ] Pagination: canonical self (Google 2019+) hoặc rel prev/next bỏ.
- [ ] Duplicate content cluster (Screaming Frog Near Duplicate).
- [ ] Cannibalization keyword (multiple URL rank cùng keyword).

## Phase 8 — Sitemap (Day 5)

Check:
- [ ] Sitemap submit GSC + Bing.
- [ ] ≤ 50,000 URL / file, ≤ 50MB uncompressed.
- [ ] Multi sitemap by content type (post, page, product, video, news).
- [ ] lastmod accurate (= last edit date thực).
- [ ] Chỉ chứa URL canonical, indexable, 200.
- [ ] Index sitemap (sitemap.xml index file).
- [ ] Image sitemap.
- [ ] News sitemap (nếu eligible).
- [ ] Video sitemap (nếu video).

## Phase 9 — Internal Linking + IA (Day 6)

Check:
- [ ] Click depth ≤ 3 từ home cho 80% URL.
- [ ] Orphan pages.
- [ ] PageRank flow (Screaming Frog Internal PageRank).
- [ ] Cluster pillar ↔ supporting đầy đủ.
- [ ] Anchor descriptive (not "click here", "read more").
- [ ] Breadcrumb có + schema.
- [ ] Sitelinks search box eligible (WebSite + SearchAction).
- [ ] Footer sitemap.

## Phase 10 — Security + HTTPS (Day 6)

Check:
- [ ] HTTPS sitewide.
- [ ] HSTS header + preload (optional).
- [ ] No mixed content.
- [ ] SSL cert valid.
- [ ] CSP header (security).
- [ ] X-Robots-Tag header (nếu dùng).

## Phase 11 — International (nếu có) (Day 7)

(Xem playbook hoặc skill International SEO.)
- Hreflang reciprocal + self-reference.
- x-default.
- ccTLD vs subdomain vs subfolder consistency.
- GSC International Targeting (subfolder/subdomain).
- Local language detection.

## Phase 12 — AI Bot + LLM Visibility (Day 7)

(Skill LLM Visibility.)
- robots.txt allow GPTBot, ClaudeBot, PerplexityBot, Google-Extended, applebot-extended.
- Bot crawl log per UA.
- Brand mention test 5 LLM × 10 prompt.
- Wikipedia / Wikidata entity check.
- Schema sameAs đầy đủ.

## Phase 13 — Report + Prioritize (Day 8-10)

Format finding:

| ID | Finding | Severity | Effort | Impact | Skill ref | Fix instruction | Owner | Status |

Severity:
- Critical: blocking index, security, data loss → fix ngay.
- High: ranking impact, CWV fail → fix tuần này.
- Medium: optimization opportunity → quarter.
- Low: nice-to-have → backlog.

Effort: hours estimate.

Impact: keyword + traffic estimate.

Output: 30-100 finding sorted by ICE / RICE.

## Phase 14 — Action plan + tracking (Day 10+)

- Critical: fix < 7 ngày.
- High: fix < 30 ngày.
- Medium: quarter.
- Tracking: Notion / Airtable / Linear.
- Re-audit: 3 tháng / 6 tháng.

---

## Template Audit Checklist

```
## Technical SEO Audit — {Domain} — {Date}

### Crawlability
- [ ] robots.txt OK
- [ ] AI bot allow
- [ ] No restrictive disallow
- [ ] Crawl depth ≤ 3
- [ ] Orphan: ...
- [ ] Redirect chain: ...
- [ ] 4xx: ... 5xx: ...

### Indexing
- [ ] GSC Coverage: Valid X / Error Y
- [ ] Discovered NOT indexed: ...
- [ ] Crawled NOT indexed: ...
- [ ] Soft 404: ...
- [ ] Unwanted indexed: ...

### Site Speed (mobile field)
- [ ] LCP: ...
- [ ] INP: ...
- [ ] CLS: ...
- [ ] TTFB: ...

### Mobile
- [ ] Viewport ✓
- [ ] Tap target ✓
- [ ] Font ≥ 16px ✓

### Schema
- [ ] Article valid
- [ ] FAQPage valid
- [ ] Organization sameAs
- [ ] GSC Enhancements error: ...

### Canonical
- [ ] Self-ref ✓
- [ ] Cross-domain audit ✓
- [ ] http/https ✓

### Sitemap
- [ ] Submit ✓
- [ ] lastmod accurate ✓
- [ ] Multi-type ✓

### Internal Linking
- [ ] Orphan: ...
- [ ] Click depth: ...

### Security
- [ ] HTTPS ✓
- [ ] HSTS ✓

### International (if applicable)
- [ ] Hreflang ✓

### AI Bot
- [ ] GPTBot allow ✓
- [ ] ClaudeBot allow ✓
- [ ] LLM brand test: ...

### Findings (count)
- Critical: ...
- High: ...
- Medium: ...
- Low: ...
```

## KPI Playbook
- # finding identified.
- # critical fixed in 7 ngày.
- # high fixed in 30 ngày.
- CWV mobile improvement post-fix.
- GSC error count reduction.
- Index coverage % increase.

## Common pitfall
- Audit không có log analysis → không biết Googlebot crawl gì.
- Crawl JS off → SPA site missing data.
- CrUX field skip → chỉ lab data.
- Schema test 1 URL → bỏ qua bulk validation.
- Findings không priority → fix random.
- Re-audit không schedule → drift.
- Bỏ qua AI bot policy 2024+.
- Bỏ qua Bing + Yandex / Baidu nếu market relevant.
- Sitemap submit nhưng không monitor lastmod.
- Disavow trong audit list — separate process, không nên bulk disavow.
