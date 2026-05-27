# Mobile Optimization — Tối ưu mobile

## 1. Purpose / Mục đích
Mobile-first index của Google đã hoàn tất từ 2020 — Google chỉ crawl và rank dựa trên **phiên bản mobile** của site. Hơn 60% search là mobile (cao hơn ở SEA, India, LatAm). Skill này tập trung vào kiến trúc mobile, viewport, interaction, và UX — không chỉ "responsive CSS".

## 2. Core Concepts / Khái niệm cốt lõi

- **Mobile-first index**: phiên bản mobile = phiên bản chính Google index.
- **Responsive (1 codebase, breakpoint)** > **Adaptive (server-side detect, m. subdomain)** > **Separate mobile site**.
- **Mobile usability**: tap target, viewport, font size, content fit screen.
- **Viewport meta tag**: bắt buộc cho responsive.
- **Device fragmentation**: Android có hàng nghìn device → test mở rộng cần thiết.
- **Touch first**: hover không tồn tại; tap target ≥ 48px; gesture support.
- **Mobile network**: 4G/5G phổ biến nhưng còn nhiều 3G ở SEA, Africa.
- **Battery awareness**: animation + heavy JS tốn battery.

## 3. When to use
- Mọi site SEO — mobile là default.
- Audit khi mobile rank / conversion thua desktop.
- Trước khi launch landing page / campaign.
- Khi GSC mobile usability error.

## 4. Workflow Mobile Optimization

### Bước 1. Strategy
**Recommend: Responsive design**
- 1 URL cho desktop + mobile.
- 1 codebase, CSS breakpoint.
- Easy bảo trì + 1 SEO signal pool.

Avoid:
- Separate `m.` subdomain (legacy, complex hreflang nội bộ).
- Dynamic serving (server detect UA + serve different HTML — phức tạp + Google đôi khi cache sai).

### Bước 2. Viewport meta
Mỗi trang phải có:
```html
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
```

KHÔNG dùng:
- `user-scalable=no` (accessibility violation, blocked Lighthouse).
- `maximum-scale=1` (block user zoom).

### Bước 3. Layout responsive
- Mobile-first CSS: viết style mobile trước, breakpoint up.
- Breakpoint chuẩn: 640 / 768 / 1024 / 1280 / 1536 (Tailwind chuẩn).
- Avoid horizontal scroll — toàn bộ content fit viewport.
- Padding container ≥ 16px mobile.
- Text width ≤ 70 ký tự cho readability.

### Bước 4. Typography
- Body font ≥ 16px (smaller bị Safari auto-zoom).
- Line-height 1.5–1.7.
- Heading scale: H1 32–48, H2 24–32, H3 20–24.
- Avoid all-caps long block (đọc khó).
- Self-host font, subset, variable (xem Page Speed UX).

### Bước 5. Tap target + interaction
- Min 48×48 CSS pixel (Material Design + Apple HIG).
- Khoảng cách giữa tap target ≥ 8px.
- Active state visible (color change on tap).
- Hover-only feature: không đặt logic critical sau hover.
- Form input mobile keyboard hint:
  - `inputmode="numeric"` cho phone, OTP.
  - `inputmode="email"`.
  - `autocomplete` đúng (name, email, tel, postal-code).

### Bước 6. Navigation
- Mobile hamburger nhưng KHÔNG hide important link.
- Sticky header nhỏ ≤ 56px (đừng chiếm 30% viewport).
- Bottom navigation cho app-like sites.
- Breadcrumb: mobile có thể horizontal scroll nếu dài.
- Avoid mega-menu phức tạp trên mobile — accordion thay thế.

### Bước 7. Content priority
Mobile screen real-estate hạn chế:
- Above-the-fold: H1 + 1 paragraph + CTA.
- TL;DR / key takeaway sớm.
- Hide sidebar mobile, hoặc collapse.
- Progressive disclosure cho long content.
- Sticky CTA mobile (nhưng không che content).
- Avoid pop-up intrusive (Google penalty interstitial 2017).

### Bước 8. Image + video mobile
- Responsive image: srcset + sizes.
- LCP image preload.
- Avoid auto-play video sound (UX + battery).
- Video lazy-load khi visible.
- Image dimension match content area (avoid tiny image stretch hoặc huge image scale down).

### Bước 9. Form + checkout mobile
- 1 column form.
- Big tap target.
- Auto-advance khi field complete (OTP, postal).
- Show keyboard match input type.
- Validation inline.
- Save state khi user nav away.
- Pay với Apple Pay / Google Pay 1-tap.

### Bước 10. Performance mobile
- LCP < 2.5s mobile field.
- INP < 200ms (mobile CPU yếu hơn desktop 4x).
- 3G test: Lighthouse Slow 3G profile.
- Bundle size < 200KB JS (gzip) cho lower-end Android.
- Lazy-load + code split aggressive.

### Bước 11. PWA option
Nếu phù hợp:
- Service worker offline cache.
- Add to Home Screen.
- Push notification (cẩn thận).
- Web Push for re-engage.
- Manifest.json đầy đủ.

### Bước 12. Test
- Real device test ≥ 5 device (iPhone SE, iPhone 15, Galaxy mid-range, low-end Android).
- BrowserStack / LambdaTest cloud device.
- Chrome DevTools device emulation (rough preview).
- Field data: Chrome UX Report theo device.
- GSC Mobile Usability report (note: deprecated 2023, dùng Pages report + Lighthouse).
- Lighthouse Mobile mode mỗi deploy.

## 5. Template Mobile Audit Checklist

- [ ] Viewport meta đúng
- [ ] Responsive CSS, no horizontal scroll
- [ ] Body font ≥ 16px
- [ ] Tap target ≥ 48px
- [ ] Inputmode + autocomplete
- [ ] Hamburger không hide critical nav
- [ ] Sticky header ≤ 56px
- [ ] LCP image preload
- [ ] LCP < 2.5s mobile field
- [ ] INP < 200ms
- [ ] CLS < 0.1
- [ ] Bundle JS gzip ≤ 200KB
- [ ] No intrusive interstitial
- [ ] Form 1 column + auto-advance
- [ ] Apple Pay / Google Pay
- [ ] Test 5+ real device
- [ ] BrowserStack cloud test
- [ ] Lighthouse mobile mode CI
- [ ] PWA (optional)

## 6. KPI đo lường
- Mobile vs Desktop conversion gap.
- Mobile bounce rate.
- Mobile LCP / INP / CLS.
- Mobile usability error count (GSC).
- Mobile organic traffic share.
- Mobile session duration.
- Mobile revenue / device.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Chrome DevTools Device Mode | Free | Quick preview |
| BrowserStack / LambdaTest | Paid | Real device cloud |
| Lighthouse mobile | Free | Audit |
| PageSpeed Insights | Free | Field + lab |
| GSC Pages report | Free | Mobile-specific issue |
| Hotjar / Clarity | Freemium | Mobile heatmap + recording |
| Storybook | Free | Component test responsive |
| Tailwind CSS | Free | Mobile-first utility |
| Cypress / Playwright mobile viewport | Free | E2E mobile flow |
| Sentry RUM mobile | Paid | Real-user error |

## 8. Common mistakes
- `user-scalable=no` block zoom.
- Font 12px → Safari auto-zoom + accessibility fail.
- Tap target < 32px → mis-tap.
- Hamburger hide quan trọng nav.
- Pop-up full-screen intrusive → Google penalty.
- Hover-only menu hỏng mobile.
- Form 2 column trên mobile → field tràn.
- Input không có inputmode → keyboard sai.
- Image lớn không srcset → tốn data 3G.
- Video autoplay sound → UX kém + bị browser block.
- Test chỉ Chrome DevTools, không real device.
- Mobile speed chỉ test wifi.
- Sticky header chiếm 30% viewport.
- Footer dài bất tận → user mất phương hướng.
- Bỏ qua mobile orientation landscape (1 số user).
- Avoid PWA khi audience expect app-like (nice-to-have, không phải must).

---
**Đầu ra**: mobile UX matching mobile-first index — tap target, performance, form, content priority đầy đủ → conversion mobile ngang/cao hơn desktop.
