# UX Design — Thiết kế trải nghiệm cho SEO

## 1. Purpose / Mục đích
UX Design ảnh hưởng SEO **gián tiếp nhưng mạnh**: bounce rate, dwell time, pogo-sticking, scroll depth, CTR — đều là tín hiệu user satisfaction Google quan sát. Site có technical + content tốt nhưng UX kém → vẫn thua. Skill này tập trung vào **UX principles ảnh hưởng SEO**: scannability, hierarchy, navigation, cognitive load.

## 2. Core Concepts / Khái niệm cốt lõi

- **F-pattern / Z-pattern reading**: user scan, không đọc từng từ.
- **Scannability**: heading, bullet, bold, visual break.
- **Cognitive load**: số lựa chọn + complexity → user ra quyết định nhanh khi thấp.
- **Visual hierarchy**: ưu tiên visual quy định flow đọc.
- **Whitespace**: breathing room → professional + readable.
- **Above-the-fold**: 1st screen quyết định ở/đi.
- **CTR (search) → bounce (site) → return (Google)**: pogo-sticking signal Google biết.
- **Dwell time / engaged time**: proxy cho satisfaction.
- **Information architecture**: cách nội dung tổ chức + nav.
- **Accessibility (a11y)**: contrast, ARIA, keyboard, screen reader — vừa moral vừa SEO indirect.

## 3. When to use
- Khi rank tốt nhưng bounce cao + pogo-sticking.
- Khi audit cluster: bài rank top 5 nhưng traffic không convert.
- Trước khi launch template mới (blog, pricing, landing).
- Khi redesign site.
- Khi accessibility audit cần.

## 4. Workflow UX Design ảnh hưởng SEO

### Bước 1. User research
- Persona: ai đến site? Mục tiêu gì?
- Job to be done (JTBD): user hire site giải quyết job gì?
- Customer interview: 5–10 user phỏng vấn.
- Survey: Typeform / SurveyMonkey.
- Search query analysis: query → intent → expectation.

### Bước 2. Information architecture
- Site map flat ≤ 3 click depth từ home.
- Tree test: card sort + Treejack.
- Category clear: user nhìn vào nav đoán đúng nhóm.
- URL structure phản ánh IA (skill URL Structure).

### Bước 3. Page-level hierarchy
Above-the-fold (mobile + desktop):
- H1 ngắn, value-prop rõ.
- 1 paragraph (≤ 30 từ) explain.
- 1 visual hero (illustrate + brand).
- 1 primary CTA.
- Optional: trust signal (logo, review).

Below fold:
- Section by section, mỗi section 1 ý.
- Whitespace giữa section ≥ 80px.
- Visual / video chia đoạn.

### Bước 4. Scannability
- H2 mỗi 200-300 từ.
- Bullet thay paragraph khi list.
- Bold key phrase (sparingly).
- Pull quote / callout box cho insight.
- TL;DR / key takeaway box ở đầu.
- Numbered step cho process.

### Bước 5. Visual hierarchy
- Size: H1 > H2 > H3 > body (3:2:1.5:1 ratio).
- Weight: bold cho heading + key.
- Color: primary brand cho CTA, neutral cho body.
- Position: critical above fold.
- Contrast: ≥ 4.5:1 cho text body.
- Icon + emoji sparingly.

### Bước 6. Navigation
- Top nav ≤ 7 item.
- Logo top-left → home (universal).
- Breadcrumb cho deep page.
- Sticky header gọn.
- Footer có sitemap, legal, newsletter.
- Sidebar TOC cho long-form (sticky).
- Related article cuối bài.
- Search bar visible cho site có nhiều content.

### Bước 7. CTA design
- Primary CTA verb-led ("Đăng ký miễn phí" thay vì "Submit").
- Color contrast với background.
- Repeat 2-3 lần trên long page (top, middle, bottom).
- Sticky mobile CTA (không che content).
- Microcopy bên cạnh giảm friction ("No credit card required").

### Bước 8. Content blocks ảnh hưởng SEO
- **TL;DR box**: front-load answer → Featured Snippet candidate.
- **FAQ accordion**: schema FAQ + scannable.
- **Comparison table**: HowTo / ItemList schema-able.
- **Code block**: dev-focused, copy button.
- **Callout box**: visual break + emphasis.
- **Author bio**: EEAT signal.
- **Last updated date**: freshness signal.
- **Related articles**: internal link + reduce bounce.

### Bước 9. Reduce cognitive load
- Hick's Law: ≤ 7 lựa chọn navigation.
- Miller's Law: working memory 7 ± 2.
- Form: chỉ field cần thiết.
- Pricing: 3 tier (most-popular highlighted).
- Choice paralysis → curation thay infinite list.
- Default sane: pre-fill, auto-select recommended.

### Bước 10. Trust + social proof
- Logo wall ("Trusted by ...").
- Review rating + count (Schema Review/AggregateRating).
- Testimonial với ảnh + name + title (specific > generic).
- Case study button.
- Press mention "As featured in".
- Security badge (Stripe, SSL).
- Real person photo (founder, support team).

### Bước 11. Accessibility
- Color contrast ≥ 4.5:1 (text), 3:1 (UI).
- Alt text image (skill Image Optimization).
- Keyboard navigation (Tab order logical).
- ARIA label cho interactive component.
- Screen reader test (NVDA, VoiceOver).
- Form label associated.
- Focus indicator visible.
- Avoid `outline: none` không thay thế.
- Caption cho video.

A11y tools: axe DevTools, WAVE, Lighthouse Accessibility audit, Pa11y CI.

### Bước 12. Test + iterate
- Heatmap: Hotjar / Clarity.
- Session recording.
- A/B test (skill A/B Testing).
- Usability test (5 user task-based).
- SUS / NPS survey.
- GSC + GA4: bounce, engagement, conversion change.

## 5. Template UX Audit Checklist

- [ ] Above-the-fold value-prop clear ≤ 5s
- [ ] H1 + 1 paragraph + 1 CTA visible
- [ ] H2 mỗi 200-300 từ
- [ ] TL;DR / key takeaway box
- [ ] FAQ section + schema
- [ ] Author bio + EEAT
- [ ] Last updated date
- [ ] Related article cuối bài
- [ ] Top nav ≤ 7 item
- [ ] Breadcrumb
- [ ] Sticky CTA mobile
- [ ] Color contrast ≥ 4.5:1
- [ ] Keyboard nav OK
- [ ] Form 1 column + label associated
- [ ] Pricing ≤ 3 tier highlighted
- [ ] Trust signal (logo, review)
- [ ] Heatmap + recording running
- [ ] A11y Lighthouse > 95

## 6. KPI đo lường
- Bounce rate per page.
- Engagement rate.
- Avg session duration.
- Scroll depth (50/75/100 event).
- Conversion rate per page.
- Pogo-sticking proxy (return to SERP within 30s).
- Heatmap click distribution.
- A11y Lighthouse score.
- Customer satisfaction (CSAT) post-visit.

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Figma | Freemium | Design |
| Hotjar / Microsoft Clarity | Freemium | Heatmap + recording |
| Maze / UserTesting | Paid | Usability test |
| Optimal Workshop (Treejack) | Paid | IA test |
| axe DevTools / WAVE | Free | A11y audit |
| Pa11y CI | Free | A11y CI |
| Stark | Freemium | Contrast checker |
| FullStory | Paid | Session replay enterprise |
| Lookback / Dovetail | Paid | User interview |
| Typeform / Tally | Freemium | Survey |
| Google Optimize (deprecated 2023) → VWO / Convert / GrowthBook | Paid/Free | A/B test |

## 8. Common mistakes
- Above-the-fold quá nhiều thứ (5 CTA, slider, badge) → choice paralysis.
- H1 không clear value-prop → user bounce.
- Body text < 16px → đọc khó.
- Color contrast 3:1 → không pass a11y.
- Auto-play video full-screen → bounce.
- Form 10 field cho lead form đơn giản.
- Pop-up exit-intent ngay khi vào page.
- Hover-only menu trên mobile.
- Footer thiếu sitemap, legal.
- Search bar ẩn trong icon nhỏ.
- Breadcrumb thiếu cho deep page.
- TL;DR / FAQ không có → mất Featured Snippet + scannability.
- Trust signal generic ("trusted by thousands") không có proof.
- Animation overdone → distract + tốn battery.
- Thay đổi UX không A/B test → không biết hiệu quả.
- Bỏ qua a11y → 15-20% audience excluded.
- Designer làm UX không cùng SEO → final design conflict structure (vd H1 → div, button → image without alt).

---
**Đầu ra**: UX framework cho mọi template (blog, landing, pillar, pricing) với scannability + hierarchy + a11y + trust → giảm bounce + tăng dwell time + tăng conversion → indirect SEO uplift.
