# Site Speed — Tốc độ tải trang & Core Web Vitals

## 1. Purpose / Mục đích
Site speed ảnh hưởng đồng thời ranking (Core Web Vitals là confirmed signal), CTR, conversion, crawl efficiency. Mỗi 100ms LCP giảm = ~1% conversion (Amazon, Akamai test). Skill này tập trung tối ưu **3 chỉ số CWV chính (LCP, INP, CLS)** + workflow audit thực tế.

## 2. Core Concepts / Khái niệm cốt lõi

### 2.1 Core Web Vitals (2024+)
- **LCP (Largest Contentful Paint)**: thời gian render element lớn nhất (thường ảnh hero hoặc heading lớn). Tốt: ≤ 2.5s; Poor: > 4s.
- **INP (Interaction to Next Paint)** — thay FID từ 03/2024: thời gian phản hồi tương tác. Tốt: ≤ 200ms; Poor: > 500ms.
- **CLS (Cumulative Layout Shift)**: tổng thay đổi layout không mong đợi. Tốt: ≤ 0.1; Poor: > 0.25.

### 2.2 Hỗ trợ
- **TTFB (Time to First Byte)**: server + network. Tốt < 600ms.
- **FCP (First Contentful Paint)**: lần đầu thấy nội dung. Tốt < 1.8s.
- **TBT (Total Blocking Time)**: thay thế trong lab cho INP.

### 2.3 Lab vs Field
- **Lab data** (Lighthouse): test 1 lần, môi trường chuẩn, không phản ánh user thật.
- **Field data** (CrUX, GSC): từ Chrome user thật trong 28 ngày — đây mới là cái Google dùng cho ranking.
→ Tối ưu cho **p75 mobile field data** mới có giá trị thực.

### 2.4 Critical rendering path
HTML → parse → CSS → JS → render. Bất cứ asset nào block là kẻ thù LCP.

## 3. When to use
- Mỗi quý audit toàn site.
- Sau redesign / replatform / theme update.
- Khi GSC Core Web Vitals report đỏ.
- Trước Google update lớn.
- Khi conversion plateau dù traffic đủ.

## 4. Workflow tối ưu

### Bước 1. Đo baseline
- PageSpeed Insights (PSI) cho 5–10 trang quan trọng (home, category, top product, top blog, pillar).
- GSC Core Web Vitals report → URL groups status.
- WebPageTest cho deep dive (waterfall).
- Real User Monitoring: GA4 web vitals events, Cloudflare Analytics, SpeedCurve, Calibre, DebugBear.

### Bước 2. Tối ưu LCP

LCP element thường là: ảnh hero, heading H1 đầu trang, hoặc background-image.

Hành động:
- **Preload LCP image**: `<link rel="preload" as="image" href="/hero.webp" fetchpriority="high">`.
- KHÔNG lazy-load LCP image. Set `loading="eager" fetchpriority="high"`.
- Server-side render content, tránh fetch JS rồi mới render.
- Dùng CDN cho asset tĩnh.
- Compress + serve WebP/AVIF.
- Inline critical CSS (above-the-fold).
- Defer/async non-critical JS (`<script defer>`, `<script async>`).
- TTFB < 600ms: cache, edge compute, faster hosting.
- Reduce render-blocking resources.
- HTTP/2 hoặc HTTP/3.

### Bước 3. Tối ưu INP

INP đo độ trễ tương tác thật (click, tap, key).

Hành động:
- Cắt JS bundle: code splitting, route-based.
- Loại bỏ third-party JS không cần (chat widget, heatmap, A/B test) hoặc lazy-load.
- Dùng `requestIdleCallback`, `requestAnimationFrame` cho task không cấp bách.
- Web Worker cho heavy computation.
- Tránh long task ≥ 50ms trên main thread.
- Debounce/throttle event handler.
- Hydrate hợp lý (partial / island hydration cho framework như Astro, Qwik, React Server Components).

### Bước 4. Tối ưu CLS

Hành động:
- Set `width` & `height` cho mọi `<img>`, `<video>`, `<iframe>`.
- Reserve space cho ad slot, embed.
- Tránh insert content above existing content (banner, popup).
- Font display: `swap` + preload font + size-adjust để tránh FOUT shift.
- Skeleton screen cho async content.
- Tránh CSS animation thay đổi layout (dùng transform thay vì width/top).

### Bước 5. Backend / Hosting
- Cache layer (Varnish, Cloudflare cache rules).
- Database query optimization, N+1 fix.
- Object cache (Redis, Memcached).
- Static export nếu content ít đổi (SSG).
- Compress: Gzip/Brotli.
- Hosting tier phù hợp; tránh shared hosting cho site traffic ≥ 50k/mo.

### Bước 6. Third-party JS audit
- List tất cả third-party script (analytics, ads, chat, A/B, tag manager).
- Cho mỗi script: cần thiết? lazy được? defer được? thay thế nhẹ hơn?
- GTM container nặng → tối giản tag, dùng server-side GTM.
- Replace Google Fonts CDN bằng self-host nếu cần.

### Bước 7. Validate + monitor
- Sau fix, đợi 28 ngày để CrUX data refresh.
- Set alert: PSI score giảm > 10 điểm → notify Slack.
- Track p75 LCP/INP/CLS theo template/route.
- Regression test mỗi deploy lớn.

## 5. Template Audit Sheet

| URL | Template | LCP (mobile p75) | INP (p75) | CLS (p75) | TTFB | LCP element | Top blocker | Action | Owner | Status |

## 6. KPI đo lường
- % URL "Good" trong GSC CWV report.
- p75 LCP / INP / CLS theo template.
- Avg TTFB.
- Conversion rate tương quan (trang fast > slow).
- Bounce rate vs LCP.
- Lighthouse performance score (≥ 90 mobile).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| PageSpeed Insights | Free | Lab + field nhanh |
| Lighthouse (Chrome DevTools) | Free | Deep audit local |
| WebPageTest | Free | Waterfall, multi-location |
| GSC Core Web Vitals | Free | Field data toàn site |
| Chrome UX Report (CrUX) | Free | BigQuery raw |
| SpeedCurve / Calibre / DebugBear | Paid | RUM + synthetic monitoring |
| Cloudflare Web Analytics | Free | Privacy-friendly RUM |
| Sentry / Datadog RUM | Paid | RUM doanh nghiệp |
| Lighthouse CI | Free | CI/CD regression check |
| Image CDN (Cloudinary, Cloudflare Images) | Paid | Auto image perf |

## 8. Common mistakes
- Tối ưu lab score 100/100 mà field vẫn đỏ → user thật khác môi trường lab.
- Lazy-load LCP image → LCP tăng.
- Quên width/height image → CLS spike.
- Add 5–10 third-party script không kiểm soát.
- Đổi theme đẹp nhưng JS nặng → INP đỏ.
- Cache không invalidate sau deploy → user thấy version cũ.
- Đo baseline xong fix mà không re-measure → không biết hiệu quả.
- Cố sửa CWV cho 1 URL trong khi vấn đề nằm ở template (1 fix hệ thống tối ưu hơn 100 fix lẻ).
- Bỏ qua INP vì mới (từ 2024) — nhiều site đã rớt rank vì INP.
- Block CSS/JS qua robots.txt làm Googlebot không render được layout → CLS field data sai.

---
**Đầu ra**: dashboard CWV theo template, runbook tối ưu LCP/INP/CLS, integration CI để regression không pass.
