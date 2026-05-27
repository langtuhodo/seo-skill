# Brand Mentions — Theo dõi & chuyển hoá nhắc tên thương hiệu

## 1. Purpose / Mục đích
Brand mention (nhắc tên brand) là **tín hiệu SEO + reputation kép**:
- **Linked mention**: backlink trực tiếp.
- **Unlinked mention**: tín hiệu authority (Google detect, dùng cho EEAT + entity), và là cơ hội outreach để **convert thành linked mention**.
- **Sentiment mention**: tín hiệu reputation, ảnh hưởng branded SERP và chiến lược crisis.

Skill này định nghĩa cách monitor mention 24/7, ưu tiên xử lý, và tận dụng cho SEO + brand.

## 2. Core Concepts / Khái niệm cốt lõi

- **Linked vs Unlinked**: phân loại đầu tiên.
- **Sentiment**: positive / neutral / negative.
- **Source quality**: Tier 1 báo lớn, Tier 2 vertical, Tier 3 niche, Tier 4 forum/social/UGC.
- **Branded query**: search "{brand}" trên Google → SERP top 10 = "branded SERP". Cần kiểm soát.
- **Implied link**: brand mention không link, nhưng Google vẫn coi là tín hiệu (theo nhiều patent + statement).
- **Reverse search**: brand mention trong source xa lạ có thể tiết lộ link building cơ hội.

## 3. When to use
- Setup ngay từ ngày 1 launch brand → monitor mọi mention từ đầu.
- Continuous — không có kết thúc.
- Trong / sau crisis (PR negative).
- Sau campaign Digital PR — track lan tỏa.
- Khi branded SERP có URL không thuộc kiểm soát rank cao.

## 4. Workflow

### Bước 1. Setup monitoring stack
Layered:
- **Free**: Google Alerts + Bing Alerts cho brand name + variants + founder name + product name.
- **Social**: Mention, Brand24, Talkwalker, Hootsuite Insights.
- **Backlink alerts**: Ahrefs Alerts (new mention), Semrush Brand Monitoring.
- **Reddit/Forum**: F5Bot (free), keyword search Reddit.
- **News API**: NewsAPI.org / GDELT.
- **Reviews**: G2, Capterra, Trustpilot, App Store, Play Store.
- **Internal CRM**: salesforce flag mention từ CS/sales.

Frequency: daily digest + realtime cho keyword crisis-sensitive.

### Bước 2. Triage quy trình
Mỗi mention:
- **Source tier?**
- **Linked / Unlinked?**
- **Sentiment?**
- **Action**:
  - Tier 1–2 + unlinked + positive/neutral → outreach convert link (priority).
  - Tier 1–2 + linked → thank you + amplify share.
  - Tier 4 + negative → engagement reply theo guidelines.
  - Spam/scraper → ignore hoặc disavow nếu site toxic.
  - Inaccurate mention → outreach correction.

### Bước 3. Convert unlinked → linked
Quy trình:
- Identify mention.
- Tìm contact (author / editor).
- Pitch ngắn:
```
Cảm ơn vì nhắc tên {brand} trong bài "{title}". Để độc giả tiện tham khảo, bạn có thể link tới {target URL} không? Đây là source gốc cho dữ liệu/tool/quote bạn cite.
```
- Win rate: 20–40% (cao hơn cold outreach vì đã có touchpoint).

### Bước 4. Brand-controlled SERP (Online Reputation Management)
Search "{brand name}" → top 10 nên là:
1. Home page #1
2. Sitelinks (Wikipedia, About, Blog, Product, Pricing)
3. Social profiles (LinkedIn, Twitter, Facebook, YouTube)
4. Knowledge Panel (Organization schema)
5. Top reviews (G2, Trustpilot positive)

Kiểm soát:
- Schema Organization + sameAs đầy đủ social.
- Content trên social profiles updated.
- Reviews positive (xin từ customers thật).
- Block low-quality satellite (đôi khi mua domain similar để redirect về home).
- Wikipedia entry (cần notability).
- Crunchbase / LinkedIn Company / G2 / Capterra / AngelList → claim profile.

### Bước 5. Negative mention handling
Process:
- Verify accuracy.
- Reply quick (≤ 24h) — empathic, không defensive.
- Offer solution / DM private để giải quyết.
- Nếu false / defamation → legal channel.
- Đừng đôi co công khai.
- Document để training cho team CS.

### Bước 6. Amplify positive mention
- Share bài lên social brand.
- "As featured in" trên homepage.
- Quote vào landing page (với credit + link).
- Internal newsletter cho team motivate.

### Bước 7. Insight loop
Mỗi tháng:
- Top topic người ta nhắc tên brand cùng?
- Persona nào đang mention?
- Geographic spread?
- Sentiment trend?
→ Input cho marketing, product, content.

## 5. Template Mention Tracker

| Date | Source | URL | Tier | Sentiment | Linked? | Anchor (if linked) | Action | Outreach status | Outcome |

## 6. KPI đo lường
- Mention volume / tháng.
- Sentiment ratio (positive : neutral : negative).
- Link conversion rate (unlinked → linked).
- # Tier 1 mention / quý.
- Branded SERP control: # URL trong top 10 thuộc kiểm soát.
- Avg response time cho negative mention.
- Branded search volume (Google Trends).

## 7. Tools đề xuất

| Tool | Giá | Use case |
|---|---|---|
| Google Alerts / Bing Alerts | Free | Baseline |
| Mention / Brand24 / Talkwalker | Paid | Realtime + sentiment |
| Ahrefs Alerts | Paid | Backlink mention |
| Semrush Brand Monitoring | Paid | Mention + sentiment |
| F5Bot | Free | Reddit/forum keyword |
| BuzzSumo | Paid | Mention + influencer |
| Hootsuite / Sprout | Paid | Social listening |
| Reputation.com | Paid | Enterprise ORM |
| NewsAPI / GDELT | Paid/Free | News programmatic |
| Reviewshake | Paid | Review aggregator |
| Hunter.io / Apollo | Paid | Tìm contact để outreach link convert |

## 8. Common mistakes
- Setup alert mà không có quy trình triage → noise mà không action.
- Bỏ qua unlinked mention → mất 30–40% link cơ hội.
- Reply negative public defensive → escalate.
- Không claim social profile / G2 / Trustpilot → mất control branded SERP.
- Wikipedia tự edit khi chưa có notability → bị remove + footprint.
- Outreach link convert template generic → low win rate.
- Không integrate mention với CRM marketing → insight chết.
- Brand spelling variation không cover (vd "VinFast" + "Vin Fast" + "vinfast") → miss mention.
- Founder name không monitor → personal brand link bỏ phí.
- Crisis mà không có pre-defined response playbook → improvise + sai sai.
- Quên schema Organization sameAs → Knowledge Panel không trigger.
- Track volume mà không track quality → toàn social spam mention vô giá trị.

---
**Đầu ra**: monitoring 24/7 + triage SOP + link convert pipeline + branded SERP control.
