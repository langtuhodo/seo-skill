# Crawlability — Khả năng thu thập của bot

> **Output path 2026 (folder-scoped)**: Audit report + crawl analysis lưu vào `projects/{project}/technical/crawl-audit-{yyyy-mm-dd}.md`. robots.txt policy → `projects/{project}/technical/robots-policy.md`. Tạo folder `technical/` nếu chưa có. Chi tiết: `AGENTS.md` Section "GENERATE OUTPUT".

## 1. Purpose / Mục đích
Crawlability là **khả năng bot tìm kiếm (Googlebot, Bingbot, GPTBot, …) tiếp cận và đọc URL của site**. Không crawl được → không index → không rank, dù content có hay tới đâu. Skill này đảm bảo bot có thể vào, đi đúng hướng, không lãng phí crawl budget vào URL rác.

## 2. Core Concepts / Khái niệm cốt lõi

- **Robots.txt**: file gốc `/robots.txt`, kiểm soát User-agent nào được crawl path nào. Là "khuyến nghị" — đa số bot tốt tuân, bot xấu thì không.
- **Crawl budget**: số URL Googlebot crawl/ngày của site. Quan trọng cho site lớn (≥ 100k URL).
- **Crawl depth**: số click từ home tới URL.
- **Internal link discoverability**: URL không có link IN → bot khó tìm.
- **Sitemap**: cách phụ giúp bot khám phá URL (xem skill XML Sitemaps).
- **Status code**: 200 OK / 301 Permanent / 302 Temp / 404 Not Found / 410 Gone / 5xx Server error.
- **JS rendering**: Googlebot render JS qua "second wave"; nếu site SPA, content sau JS phải SSR/SSG hoặc dynamic rendering để bot không bỏ sót.
- **Server response time (TTFB)**: chậm → Googlebot crawl ít hơn.
- **Crawl traps**: faceted nav vô tận, calendar /next-month/next-month/…, session ID URL → ngốn budget.
- **Bot khác**: GPTBot, ClaudeBot, PerplexityBot, Bingbot — quyết định visibility trên AI Search.

## 3. When to use
- Mỗi tháng audit cho site lớn.
- Khi launch site / replatform / migrate.
- Khi GSC báo "Crawled - currently not indexed", "Discovered - currently not indexed".
- Khi traffic plateau dù content publish nhiều.
- Khi muốn kiểm soát LLM bot (allow GPTBot? hay block?).

## 4. Workflow audit + tối ưu

### Bước 1. Kiểm tra robots.txt
- Mở `https://domain.com/robots.txt`.
- Verify rule:
```
User-agent: *
Disallow: /admin/
Disallow: /cart/
Disallow: /search?
Disallow: /*?utm_*

Sitemap: https://domain.com/sitemap.xml
```
- Test quan trọng:
  - `/blog/` không bị disallow.
  - `/products/` không bị disallow.
  - File CSS/JS không bị block (Googlebot cần để render).
  - Không Disallow `/` (full site block) — sai lầm cổ điển.
- Test bằng GSC robots.txt tester (legacy) hoặc tool online.

Quyết định AI bot:
```
User-agent: GPTBot
Allow: /
# Hoặc Disallow: / nếu muốn chặn

User-agent: ClaudeBot
Allow: /

User-agent: PerplexityBot
Allow: /
```

### Bước 2. Crawl toàn site bằng Screaming Frog / Sitebulb
- Chế độ Spider, list mode (nếu site lớn → JS render mode).
- Export: status code, content-type, indexability, response time, internal/external link count.
- Filter:
  - 4xx, 5xx → fix.
  - 3xx redirect chain ≥ 2 hop → gộp.
  - Long URL ≥ 200 ký tự → review.
  - Slow URL (TTFB > 600ms) → optimize.

### Bước 3. Xử lý GSC reports
- **Pages → Why pages aren't indexed**:
  - "Discovered - currently not indexed": thiếu link IN, depth quá sâu, low quality → boost internal link, thêm vào sitemap.
  - "Crawled - currently not indexed": Google quyết định không index do quality → cải thiện content, EEAT.
  - "Page with redirect": thường là 301/302 → kiểm tra logic.
  - "Soft 404": trang trả 200 nhưng nội dung "không tìm thấy" → trả 404 thật.
  - "Blocked by robots.txt": review xem cố ý hay nhầm.
- **Crawl Stats** (Settings → Crawl stats):
  - Avg requests/day, avg response time.
  - Type breakdown: HTML, JS, CSS, image.
  - Spike trong response time = vấn đề server.
  - Xu hướng giảm = Google đang giảm interest hoặc site có vấn đề.

### Bước 4. Crawl budget optimization (cho site ≥ 100k URL)
- Đảm bảo URL chính trong sitemap.
- Block crawl traps: faceted filter combinations, search results, session ID, calendar infinite.
- Dùng `nofollow` trên internal link không quan trọng (login, cart, sort options).
- Pagination + infinite scroll: SSR + sitemap đầy đủ.
- Soft 404 → 404/410.
- Cleanup low-quality URL bằng noindex hoặc consolidate.
- Theo dõi log file (server log) để xem Googlebot thực sự crawl gì.

### Bước 5. Log file analysis
- Export server log 30 ngày (Cloudflare, Nginx, Apache).
- Filter Googlebot (verify IP).
- Phân tích:
  - URL nào Googlebot crawl nhiều nhất? Có phải URL quan trọng?
  - URL quan trọng nào Googlebot ít crawl?
  - Status code phân bố?
  - Response time trung bình?
- Tools: Screaming Frog Log File Analyser, Botify, Oncrawl, Splunk.

### Bước 6. JS rendering check
- Nếu SPA / heavy JS:
  - Verify với "View rendered HTML" trong GSC URL Inspection.
  - Critical content (title, H1, body) phải có trong rendered HTML.
  - SSR/SSG (Next.js, Nuxt, Astro) > client-only render.
  - Dynamic rendering (Prerender.io) cho legacy SPA.
- Test với `?_escaped_fragment_=` legacy không còn cần.

### Bước 7. Internal link & depth
- Đảm bảo URL quan trọng ≤ 3 click depth.
- Audit orphan page (xem skill Internal Linking).
- HTML sitemap (footer "all pages") cho site nhỏ.

## 5. Template Crawl Audit Checklist

- [ ] robots.txt syntactically valid
- [ ] Không Disallow /
- [ ] CSS/JS không bị block
- [ ] Sitemap khai báo trong robots.txt
- [ ] AI bot policy quyết định rõ
- [ ] # 4xx URL trong crawl = 0 cho URL quan trọng
- [ ] # 5xx URL = 0
- [ ] # redirect chain ≥ 2 hop = 0
- [ ] Soft 404 đã fix
- [ ] Crawl traps đã block
- [ ] GSC Crawl Stats stable, response time < 600ms
- [ ] Important URL trong log có Googlebot hit ≥ 1/tuần
- [ ] JS-rendered content verified

## 6. KPI đo lường
- Crawl budget utilization: # URL quan trọng được crawl / total Googlebot request.
- # URL "Discovered - not indexed" giảm.
- Avg server response time với Googlebot < 500ms.
- # crawl error (5xx) trong GSC.
- % URL critical có log hit / 30 ngày.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Search Console (Pages, Crawl Stats) | Free | Diagnostic chính |
| Screaming Frog | Free/Paid | Site crawl |
| Sitebulb | Paid | Visualization |
| Screaming Frog Log Analyser | Paid | Log file |
| Botify, Oncrawl, JetOctopus | Paid (enterprise) | Crawl + log analytics |
| Cloudflare logs / Nginx access log | Free | Raw log source |
| Robots.txt Validator (Google legacy + community) | Free | Test rules |
| URL Inspection API | Free (limit) | Verify rendered HTML hàng loạt |
| Bing Webmaster Tools | Free | Bing-specific crawl issue |

## 8. Common mistakes
- Disallow /wp-content/uploads/ → block image hoặc CSS.
- Bỏ sitemap khỏi robots.txt.
- Block /search? nhưng có internal link tới search → tạo "blocked by robots" lỗi.
- Để JS-only render mà không SSR → content vô hình với crawler.
- Để session ID trong URL → infinite duplicate.
- Không monitor Crawl Stats → spike server lỗi nhiều ngày mới biết.
- Block GPTBot/ClaudeBot mà không quyết định chiến lược AI visibility.
- Faceted nav không noindex → triệu URL rác.
- Thay đổi robots.txt mà không version control → ai đó push lỗi gây tắt index.
- Không phân biệt "crawled not indexed" (quality issue) vs "blocked" (technical) → fix sai chỗ.

---
**Đầu ra**: robots.txt sạch, crawl budget tối ưu, GSC reports clean, log analysis định kỳ.
