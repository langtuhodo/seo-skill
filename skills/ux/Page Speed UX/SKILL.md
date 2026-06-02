---
name: page-speed-ux
version: 1.0.0
description: "Use this skill when the user asks about page speed user experience impact: 'page speed UX', 'tốc độ tải vs UX', 'INP user frustration', 'CWV UX impact'. Covers perceived performance, skeleton screens, progressive disclosure, INP UX patterns."
category: ux
---

# Page Speed UX — Tốc độ tải dưới góc nhìn UX

## 1. Purpose / Mục đích
Page Speed không chỉ là metric kỹ thuật (Core Web Vitals — skill Site Speed) mà là **UX perception**: user cảm nhận thế nào, có tiếp tục ở lại không. Skill này tập trung vào **UX side** — tối ưu perception, smart loading, skeleton, progressive disclosure, mobile-first patterns — bổ sung cho Site Speed kỹ thuật.

## 2. Core Concepts / Khái niệm cốt lõi

- **Perceived performance**: speed user cảm thấy. Đôi khi quan trọng hơn speed thật.
- **Time to first impression**: bao lâu user thấy "có gì đó".
- **Skeleton screen**: placeholder shape thay cho spinner — giảm cognitive load.
- **Progressive disclosure**: load critical content trước, secondary sau.
- **Optimistic UI**: assume action thành công, render trước khi server confirm.
- **Lazy loading + prefetch**: cân bằng — đừng cản LCP, cũng đừng load mọi thứ ngay.
- **Network-aware**: detect 2G/3G → giảm chất lượng image, defer feature.
- **Loading state**: spinner < 1s = OK; > 1s = skeleton; > 3s = progress với context.

## 3. When to use
- Khi audit conversion drop trên mobile.
- Khi LCP/INP đã pass nhưng user vẫn complain "slow".
- Trước launch landing page mới.
- Khi build SPA/PWA.
- Khi target market network kém (Đông Nam Á, Latam, Châu Phi).

## 4. Workflow Page Speed UX

### Bước 1. Measure perception
- **First Contentful Paint** (FCP) < 1.8s.
- **LCP** < 2.5s.
- **Speed Index** < 3.4s.
- **Total Blocking Time** (TBT) < 200ms.
- **INP** < 200ms.
- **Time to Interactive** < 3.8s.
- **CLS** < 0.1.

Tools: PageSpeed Insights (lab + field), WebPageTest filmstrip, Chrome User Experience Report.

### Bước 2. Critical rendering path
- Above-the-fold content render đầu tiên.
- Inline critical CSS (≤ 14KB) cho first paint.
- Defer / async non-critical JS.
- Preload LCP image / hero font.
- Avoid blocking 3rd-party script trong critical path.

### Bước 3. Skeleton screen
Khi data fetch > 300ms, hiển thị skeleton:
- Shape giống final content (rect cho text, circle cho avatar).
- Animation shimmer subtle.
- Tránh spinner cho list — user chờ list, không spinner.
- Match màu light/dark mode.

Code:
```css
.skeleton {
  background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}
@keyframes shimmer {
  0% { background-position: -200% 0; }
  100% { background-position: 200% 0; }
}
```

### Bước 4. Progressive content
- Render structure (header, layout) trước.
- Then critical text.
- Then secondary content (sidebar, recommend).
- Then tracking pixel + chat widget.

### Bước 5. Image strategy
- LCP image: preload + fetchpriority="high" + NO lazy-load.
- Below-fold image: loading="lazy".
- WebP/AVIF + fallback.
- Width/height attribute để reserve layout (CLS).
- srcset + sizes responsive.
- Blur-up placeholder (BlurHash, LQIP).

(Xem skill Image Optimization.)

### Bước 6. Font loading
- Self-host font (Google Fonts CDN block render trên 1st visit).
- `font-display: swap` — text hiện ngay với fallback, swap khi font load.
- Preload primary weight.
- Subset chỉ glyphs dùng (giảm 70% size).
- Variable font cho 1 file thay nhiều weight.

### Bước 7. JS optimization for INP
- Code split (dynamic import).
- Tree-shake.
- Defer 3rd party (analytics, chat) đến idle.
- Remove unused dependency.
- Web worker cho heavy compute.
- Long task < 50ms (chunk lên).

### Bước 8. Network-aware design
- `navigator.connection.effectiveType` → 2G/3G/4G/wifi.
- 2G/3G → load image low-res, disable autoplay video, simplify animation.
- Save-Data header: respect.

### Bước 9. Optimistic UI
Cho action user (vote, like, comment):
- Update UI ngay khi click.
- Send request background.
- Rollback nếu fail (rare).
- Loading state chỉ khi > 1s.

### Bước 10. Mobile-first patterns
- Tap target ≥ 48px.
- Avoid hover-only interaction.
- Sticky header reasonable, không quá dày.
- Bottom navigation cho mobile native feel.
- Swipe gesture support.
- Pull-to-refresh.

### Bước 11. Loading states
| Time | State |
|---|---|
| < 100ms | Instant feel — no state |
| 100ms–1s | Spinner subtle |
| 1s–3s | Skeleton |
| 3s–10s | Progress bar / step indicator |
| > 10s | Email when ready, allow background |

### Bước 12. A/B test perception
- Hypothesis: skeleton vs spinner conversion?
- Run test 2 tuần.
- Measure: bounce, conversion, time on page, complaint CS.

## 5. Template Page Speed UX Checklist

- [ ] LCP < 2.5s (mobile field)
- [ ] FCP < 1.8s
- [ ] INP < 200ms
- [ ] CLS < 0.1
- [ ] Critical CSS inline
- [ ] LCP image preload + no lazy
- [ ] Skeleton cho list / cards
- [ ] Font self-host + swap + preload
- [ ] Below-fold lazy load
- [ ] 3rd party defer to idle
- [ ] Network-aware degradation
- [ ] Tap target ≥ 48px mobile
- [ ] Loading state ≤ 1s = spinner; > 1s = skeleton
- [ ] Optimistic UI cho user action
- [ ] A/B test perception change

## 6. KPI đo lường
- LCP / INP / CLS (field).
- Bounce rate per page.
- Avg engagement time.
- Conversion rate per device.
- Drop-off at first interaction.
- User-perceived speed survey (NPS).
- Refund / complaint mention "slow".

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| PageSpeed Insights | Free | Lab + field |
| WebPageTest | Freemium | Filmstrip + frame analysis |
| Chrome DevTools Performance | Free | Profile timeline |
| Lighthouse CI | Free | Regression test |
| Calibre | Paid | Continuous monitoring |
| SpeedCurve | Paid | Real-user + competitor |
| Sentry / Datadog RUM | Paid | Real-user monitoring |
| Hotjar / Microsoft Clarity | Freemium | UX recording |
| Storybook + skeleton library (react-loading-skeleton) | Free | Implement skeleton |
| Plaiceholder (LQIP) / BlurHash | Free | Blur-up |
| Cloudflare / Fastly Image Resizing | Paid | On-the-fly |

## 8. Common mistakes
- Tối ưu lab speed nhưng UX cảm giác chậm → user không care kết quả Lighthouse.
- Spinner cho mọi loading → frustration.
- Skeleton sai shape, jarring khi swap.
- Không preload LCP image.
- Font block render ≥ 1s → FOIT (Flash of Invisible Text).
- 3rd-party tag ngay đầu page → block.
- Lazy-load LCP image → LCP score 5s+.
- CLS spike khi font swap không reserve space.
- Đo speed chỉ desktop wifi, không mobile 4G real.
- Tap target nhỏ < 48px → mis-tap mobile.
- Optimistic UI nhưng không rollback khi fail → data lệch.
- Spinner full-screen overlay block tương tác → user thoát.
- Auto-play video trên mobile data → tốn data, bounce.
- Network-aware không implement → user 2G nhận trải nghiệm same wifi.
- A/B test perception bằng metric kỹ thuật, không phải UX outcome.

---
**Đầu ra**: site nhanh ở metric + cảm giác nhanh ở UX → giảm bounce, tăng conversion, đặc biệt mobile + emerging market.
