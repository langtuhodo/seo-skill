# Playbook — Link Outreach

**Mục tiêu**: build outreach engine cho link building scale (50-200 outreach/tuần) với reply rate ≥ 10% + win rate ≥ 5%.

**Đầu vào**: link goal + asset list + email infrastructure.

**Đầu ra**: pipeline + sequence + tracking system.

**Skill liên quan**: Off-page/Outreach, Off-page/Link Building, Off-page/Guest Posting, Off-page/Brand Mentions, Off-page/Digital PR, Growth/Link Acquisition.

---

## Phase 1 — Setup infrastructure (Week 1)

### Email infrastructure
- Domain riêng cho outreach (vd: outreach@yourdomain.com hoặc separate `yourbrand-outreach.com` để bảo vệ main domain reputation).
- SPF / DKIM / DMARC config đúng.
- Warm-up domain 4-6 tuần trước scale (Mailwarm / Lemwarm / Smartlead built-in).
- Max send 50-80 email/day/inbox.
- Multi-inbox nếu volume cao (3-5 inbox same domain).

### Tooling
- **CRM outreach**: Pitchbox / BuzzStream / Respona.
- **Sequence**: Smartlead / Mailshake / Lemlist / Instantly.
- **Email find**: Hunter.io / Apollo / FindThatLead.
- **Email verify**: NeverBounce / ZeroBounce.
- **Prospecting**: Ahrefs / Semrush.
- **Data enrichment**: Clay / Apify.

### Tracking
- CRM pipeline column: prospect → contacted → opened → replied → negotiating → won/lost.
- KPI dashboard: send / open rate / reply rate / win rate / cost-per-link.

## Phase 2 — Asset prep (Week 1-2)

(Skill Link Acquisition.)

Mỗi campaign cần asset cụ thể để pitch:
- **Resource asset**: pillar / definitive guide / statistic page.
- **Data asset**: original survey / research report.
- **Tool asset**: free calculator / generator.
- **Template asset**: gallery / template bank.
- **Visual asset**: infographic embed.

Asset phải production-ready BEFORE outreach.

## Phase 3 — Prospect research (Week 2)

### A. Resource page outreach
1. Search query:
   - `intitle:resources "{topic}"`
   - `inurl:resources "{topic}"`
   - `"useful links" {topic}`
   - `"recommended reading" {topic}`
2. Filter site DR ≥ 30, traffic ≥ 1000.
3. Verify resource page có active updates.
4. Output: 100-300 prospect.

### B. Broken link replacement
1. Find broken link trên niche site:
   - Ahrefs Site Explorer → Outbound broken link.
   - Check My Links Chrome extension.
2. Identify your asset replacement.
3. Pitch: "I noticed broken link on {URL}, here's a working alternative."

### C. Niche edit / Link insertion
1. Identify post existing trên niche site có topic relevant.
2. Pitch insert mention/link tới mình trong existing content.
3. Higher win nếu offer value (correction, update, additional info).

### D. Guest post
1. Find site accept guest post:
   - `"write for us" {niche}`
   - `"guest post guidelines" {niche}`
   - `"contributors" {niche}`
2. Pitch 3 idea unique to their audience.
3. (Skill Guest Posting.)

### E. Listicle inclusion
1. Search "best {category}" / "top {tools}".
2. Pitch addition mình + reason (unique angle, free tier, integration).

### F. HARO / Qwoted
- Reactive PR.
- Daily check.
- Reply 20-30 query/tuần.
- Personalize per query.

### G. Statistic citation
1. Find your statistic / research cited unlinked.
2. Pitch link addition: "Thanks for citing — would you mind linking?"

## Phase 4 — Email sequence design (Week 2)

### Email 1 — Day 0 (initial)
Subject: 5-7 từ, specific, no clickbait.

Examples:
- "{Your name} — re: {their content} broken link"
- "Quick tip for {their resource page}"
- "{Specific offer} for {their site}"

Body 3-5 đoạn:
1. **Personalized opener** (1-2 câu): mention specific thing họ làm/viết.
2. **Bridge** (1 câu): connect their work với reason mình email.
3. **Value** (2-3 câu): cụ thể value mình mang lại.
4. **Ask cụ thể** (1 câu): clear single ask.
5. **Sign-off** ngắn.

KHÔNG:
- Generic "Hi there".
- Long bio.
- Multiple ask.
- Aggressive language.

### Email 2 — Day 3 (bump)
Short reply within thread:
> "Hi {first name}, just bumping this up in case it got buried. Let me know if interested."

### Email 3 — Day 7 (alternative angle)
Different angle + value:
> "Different idea: I also have {asset 2}. Could be useful for {their use case}."

### Email 4 — Day 14 (last try, soft)
> "Last note — if not the right time, no problem. Wishing you the best on {recent project}."

### Email 5 — Day 30 (re-engage seasonal)
Nếu họ active trên Twitter/LinkedIn — re-engage qua channel khác.

## Phase 5 — Send + sequence (Week 3+)

- Per inbox: 50-80 send/day cap.
- Random delay 30-90s giữa email.
- Time zone match (avoid 3 AM their time).
- Send Tuesday-Thursday morning best (theo data outreach industry).
- Avoid Monday early + Friday afternoon.

## Phase 6 — Reply handling

### Positive reply
- Respond < 4 hour.
- Personalized.
- Provide asset link.
- Confirm next step (publish date, anchor text).

### Negotiation
- Anchor text: respect editorial.
- Don't push exact match anchor.
- Accept nofollow OK (still value).
- Reciprocal link: case-by-case (nofollow OK).
- Paid link: AVOID (Google guidelines).

### Negative reply
- Thank gracefully.
- Add to "future re-engage" list.
- Don't argue.

### No reply
- 1-2 follow-up max.
- Then mark "lost" — re-engage 6 tháng sau với different angle.

## Phase 7 — Win + tracking

Khi link live:
- Verify link placement (anchor + context).
- Update CRM "won".
- Compute cost-per-link (time + tooling).
- Add to backlink monitoring (Ahrefs alert).
- Quarterly check link still active.

## Phase 8 — Optimize sequence

A/B test:
- Subject line variant.
- Opener style.
- Length email 1.
- Sequence frequency.
- Per-vertical tone.

Track metric per variant. Iterate weekly.

## Phase 9 — Compliance + ethics

- KHÔNG buy link.
- KHÔNG private blog network (PBN).
- KHÔNG spam — respect "unsubscribe".
- GDPR / CAN-SPAM compliance: physical address footer + unsubscribe link.
- Disclose Devin/AI assist nếu pitch là editorial.

---

## Template Outreach Email — Resource page

```
Subject: Resource for {topic} on {their site}

Hi {first name},

I came across your resource page on {URL} while researching {topic} — really like how you organized {specific section}.

I noticed you have {existing relevant resource}. I recently published {your asset} which goes deeper into {specific gap, eg "actual implementation steps for {persona}"}.

Would it be a fit for the page? Happy to share the link if you'd like to take a look.

Best,
{Name}
{Title at brand}
```

## Template Outreach — Broken link

```
Subject: Broken link on {their URL}

Hi {first name},

Reading through {URL} — found a broken link in section {section name}: {broken URL → 404}.

Just a heads-up. If you're looking for a replacement, my piece on {topic} might fit: {your URL}. No pressure if not.

Either way, the broken link probably isn't ideal for your readers — figured you'd want to know.

Best,
{Name}
```

## KPI Playbook
- Send/week.
- Open rate (target ≥ 40%).
- Reply rate (target ≥ 10%).
- Win rate (target ≥ 5% on send, ≥ 30% on positive reply).
- Cost-per-link.
- Avg DR per link.
- Cumulative RD/quarter.

## Common pitfall
- Email infrastructure không setup → spam folder.
- Domain main outreach → reputation harm.
- Send 200/day inbox 1 → blacklist.
- Subject clickbait → unsubscribe.
- Generic "Hi there" → ignore.
- Multiple ask trong 1 email.
- Aggressive language.
- Quên warm-up domain → low deliverability.
- Cốc theo template không personalize → blacklist.
- Buy link → Google manual action.
- PBN → penalty.
- Disclose paid sponsor không clear → FTC violation.
- Track link manual → quên quarterly verify.
- Push exact match anchor → unnatural pattern.
- Quên track cost-per-link → ROI mù.
- Không re-engage 6 tháng — "no" có thể thành "yes" sau update.
