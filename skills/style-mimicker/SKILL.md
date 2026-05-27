---
name: style-mimicker
version: 1.1.0
description: "ONLY activate this skill when the user explicitly names a style profile followed by 'style' or 'writing style'. Examples: 'BinhNN Digital writing style', 'BinhnnDigital style', 'Coffee Warmth style', 'viết theo phong cách BinhNN Digital'. Do NOT activate for generic writing or editing requests without a named style. Also activates for CAPTURE MODE: 'save this style as [Name]', 'analyze my writing style', 'lưu phong cách viết này với tên [Name]'."
category: content
related_skills:
  - skills/content/Content Writing/SKILL.md
  - skills/content/Blog Content/SKILL.md
  - skills/content/Pillar Pages/SKILL.md
  - skills/on-page/Content Optimization/SKILL.md
  - skills/ai-seo/Content Optimization/SKILL.md
---

# Style Mimicker — Sao chép & Áp dụng Phong cách Viết

## 1. Purpose / Mục đích

Skill này giúp bạn:
1. **CAPTURE MODE**: Phân tích bài viết mẫu → Trích xuất Style Profile có thể tái sử dụng
2. **APPLY MODE**: Áp dụng Style Profile đã lưu để viết nội dung mới với đúng giọng văn

**Tại sao cần skill này?**
- Mỗi dự án/thương hiệu cần giọng văn riêng biệt
- Đảm bảo tính nhất quán khi nhiều người viết cho cùng một brand
- Tránh viết AI generic — có "hồn" và cá tính riêng
- Tích hợp với Content Writing skill để đảm bảo cả EEAT + GEO + Voice

---

## 2. Tích hợp với Content Writing Workflow

**Style Mimicker là lớp cuối cùng trong quy trình viết nội dung:**

```
┌─────────────────────────────────────────────────────────────────┐
│                    WORKFLOW VIẾT NỘI DUNG                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Phase 0: COMPETITOR RESEARCH ← Content Writing Skill           │
│  Phase 1: USER RESEARCH       ← Content Writing Skill           │
│  Phase 2: OUTLINE             ← Content Writing Skill           │
│  Phase 3: VIẾT DRAFT          ← Content Writing Skill           │
│  Phase 4: EEAT & GEO CHECK    ← Content Writing Skill           │
│  Phase 5: VOICE POLISH        ← **STYLE MIMICKER SKILL**        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Khi nào kích hoạt Style Mimicker?**
- Sau khi đã có draft từ Content Writing skill
- Khi user chỉ định tên profile cụ thể (VD: "viết theo phong cách BinhNN Digital")
- Khi cần đảm bảo giọng văn nhất quán cho một dự án

---

## 3. Project-Style Mapping

Mỗi dự án trong `projects/` có thể được gán một Style Profile mặc định:

| Project | Style Profile | File |
|---------|---------------|------|
| thep-bao-tin | ThepBaoTin | `profiles/thep-bao-tin.json` |
| binhnn-digital | BinhnnDigital | `profiles/binhnn-digital.json` |
| hatcapherangxay | HatCaPheRangXay | `profiles/hatcapherangxay.json` |

**Auto-apply rule**: Khi viết content cho một project đã có style mapping, tự động áp dụng style profile tương ứng (trừ khi user chỉ định khác).

---

---

## ⚠️ Activation Rule (MANDATORY)

This skill has **explicit opt-in only** activation. It must NOT be triggered by generic writing or editing requests.

### ✅ ACTIVATE when the user's message contains:
- **A named Style Profile + the word `style` or `writing style`**
  - `"BinhNN Digital writing style"` → ACTIVATE with profile `binhnn-digital`
  - `"BinhnnDigital style"` → ACTIVATE with profile `binhnn-digital`
  - `"Coffee Warmth style"` → ACTIVATE with profile `coffee-warmth`
  - `"viết theo phong cách BinhNN Digital"` → ACTIVATE
  - `"dùng phong cách [Name]"` → ACTIVATE
- **A CAPTURE command** with a named target:
  - `"save this style as [Name]"` → CAPTURE MODE
  - `"analyze my writing style and save as [Name]"` → CAPTURE MODE
  - `"lưu phong cách viết này với tên [Name]"` → CAPTURE MODE

### ❌ DO NOT ACTIVATE for:
- `"write an article about SEO"` — no style name specified
- `"rewrite this paragraph"` — no style name specified
- `"edit this copy"` — use `copy-editing` skill instead
- `"mimic this style"` (without naming a saved profile) — ask user to name the style first

### 🤔 If style name is ambiguous:
If there is a style-like name in the request but no profile JSON exists for it, ask:
> "I don't have a saved profile for '[Name]'. Would you like me to:
> A) Capture a new style profile named '[Name]' (paste a sample article), or
> B) List your currently saved style profiles?"

---

## CAPTURE MODE — How to Save a New Style

> ⚠️ **GLOBAL RULE**: Khi tạo profile mới, PHẢI bao gồm `vocabulary_blacklist`, `structural_blacklist`, và `self_correction_checklist` sections theo `knowledge/15-anti-ai-content-rules.md`. Đây là rule chung áp dụng cho TẤT CẢ profiles — không ngoại lệ.

Trigger: User pastes an article and says something like "save this style as [Name]" or "analyze my writing style".

### Step 1: Receive Sample Content
Ask the user if needed:
> "Please paste the article(s) you want me to learn from. The more samples you provide (2-3 is ideal), the more accurate the style fingerprint will be."

### Step 2: Analyze the 9 Style Dimensions

Analyze the pasted content across all 9 dimensions:

| # | Dimension | What to Look For |
|---|-----------|-----------------|
| 1 | **Sentence Length** | Average sentence length. Short & punchy (<12 words)? Long & detailed (>25 words)? Mixed rhythm? |
| 2 | **Vocabulary Level** | Everyday casual / Technical expert / Academic / Colloquial / Street-smart Vietnamese |
| 3 | **Tone** | Warm, friendly / Authoritative, direct / Conversational / Formal / Provocative / Storytelling |
| 4 | **Point of View** | First (Tôi/Chúng tôi), Second (Bạn), Third, or Mixed |
| 5 | **Structure Pattern** | Narrative story → insight / Data point → explanation / Problem → solution / List-heavy / Q&A |
| 6 | **Hook Style** | Opens with: Bold claim / Question / Story / Statistic / Controversial statement / Personal anecdote |
| 7 | **Transitions** | Uses connectors like: "Nhưng...", "Thực tế là...", "Và đây là điều thú vị:", "Look—", "Here's the thing:" |
| 8 | **Closing Style** | Ends with: Call to action / Open question / Inspirational quote / Summary / Cliffhanger |
| 9 | **Language Mix** | Pure English / Pure Vietnamese / VI-EN code-switching pattern / Technical terms kept in EN |

### Step 3: Assign a Field Category

Identify which field this style best fits. Choose one or more:
- `digital-marketing` — Data, tactics, SEO, growth hacking
- `lifestyle-fb` — Food & Beverage, travel, personal brand
- `tech-review` — Gadgets, software, specs comparison
- `brand-strategy` — Agency, brand building, B2B
- `social-casual` — Facebook/TikTok posts, community, casual VN
- `thought-leadership` — LinkedIn, B2B insight, opinion pieces
- `ecommerce` — Shopee/Lazada product descriptions, promotions
- `saas-startup` — SaaS, product, growth metrics

### Step 4: Name and Save the Style Profile

Ask: "What would you like to name this style? (e.g., 'Binhnn Digital', 'Coffee Warmth', 'Saigon Tech Voice')"

Then generate the Style Profile in this JSON format for saving:

```json
{
  "style_name": "Binhnn Digital",
  "field_category": ["digital-marketing", "thought-leadership"],
  "created_at": "YYYY-MM-DD",
  "sample_source": "User-provided article",
  "fingerprint": {
    "sentence_length": "Mixed — Short punchy sentences (8-12 words) for hooks, longer for explanations (20-25 words)",
    "vocabulary_level": "Casual-professional; technical SEO terms kept in EN; everyday VN language",
    "tone": "Confident, direct, occasionally provocative; warm undertone",
    "point_of_view": "Second-person (Bạn) dominant; occasional First-person for credibility",
    "structure_pattern": "Data/claim → Explanation → Practical tip → Internal link bridge",
    "hook_style": "Opens with a bold claim or a question that challenges status quo",
    "transitions": "Uses: 'Nhưng thực ra...', 'Điều này có nghĩa là...', 'Here's the thing:', 'Nói thẳng ra là'",
    "closing_style": "Direct CTA or a thought-provoking open question",
    "language_mix": "70% Vietnamese, 30% English technical terms (SEO, CRO, CTR, etc.)"
  },
  "example_phrases": [
    "Nói thẳng ra là: hầu hết các bài viết về [topic] đang làm sai.",
    "Đây không phải lý thuyết — đây là thứ tôi đã test và saw results.",
    "Trước khi bắt đầu, hãy tự hỏi bản thân: [question]?"
  ],
  "vocabulary_blacklist": {
    "description": "Từ cấm theo knowledge/15-anti-ai-content-rules.md (Ruleset 1) — áp dụng cho MỌI profile.",
    "cuong_dieu": ["Đột phá", "Cách mạng hóa"],
    "sao_rong": ["Chìa khóa (để...)", "Cốt lõi (là...)"],
    "generic_verbs": ["Thúc đẩy"],
    "overuse": ["Tối ưu hóa (dùng >2 lần/bài)"],
    "nhiet_tinh_gia": ["Đáng chú ý", "Thú vị thay", "Thật thú vị khi"],
    "tu_noi_may_moc": ["Hơn nữa", "Ngoài ra", "Bên cạnh đó"],
    "ket_luan_template": ["Tóm lại", "Nhìn chung"]
  },
  "structural_blacklist": {
    "description": "Mẫu câu cấm theo knowledge/15-anti-ai-content-rules.md (Ruleset 2).",
    "banned_patterns": [
      "Trong thế giới/kỷ nguyên số ngày nay...",
      "Không thể phủ nhận rằng...",
      "Như chúng ta đã biết...",
      "Trong bài viết này, chúng ta sẽ...",
      "Điều quan trọng cần lưu ý là...",
      "Tóm lại,...", "Kết luận lại,..."
    ]
  },
  "self_correction_checklist": {
    "description": "Ruleset 4 — chạy trước khi giao bài.",
    "step_1_find_replace": "Quét bài tìm từ cấm + mẫu câu cấm. Xóa/thay thế.",
    "step_2_tone_adjustment": "Giọng văn PHẢI giống đồng nghiệp thân thiện, KHÔNG giống giáo sư.",
    "step_3_detail_enrichment": "Mỗi bài PHẢI có 1-2 ví dụ thực tế VN cụ thể."
  },
  "avoid": [
    "Passive voice constructions",
    "Overly formal Vietnamese ('kính thưa', 'xin trân trọng')",
    "Buzzwords without explanation ('synergy', 'leverage', 'optimize' alone)",
    "Dùng từ cường điệu: 'Đột phá', 'Cách mạng hóa' (Ruleset 1)",
    "Dùng từ nối máy móc: 'Hơn nữa', 'Ngoài ra', 'Bên cạnh đó' (Ruleset 1)",
    "Mở bài bằng mẫu AI: 'Trong thời đại số...', 'Không thể phủ nhận...' (Ruleset 2)",
    "Kết bài bằng 'Tóm lại,...', 'Nhìn chung,...' (Ruleset 1+2)"
  ]
}
```

> **Save instruction**: Tell the user to save this JSON as `skills/style-mimicker/profiles/[style-name-slug].json` (e.g., `binhnn-digital.json`).

---

## APPLY MODE — How to Use a Saved Style

> ⚠️ **GLOBAL RULE**: Bất kể dùng profile nào (hiện tại hoặc mới tạo), TẤT CẢ nội dung đều PHẢI tuân thủ 4 Rulesets trong `knowledge/15-anti-ai-content-rules.md`. Rule này áp dụng cho MỌI dự án, MỌI profile — không ngoại lệ.

Trigger: User says "write [content] in Binhnn Digital style" or "apply [Style Name] style" while using another writing skill.

### Integration with Other Writing Skills

When this skill is combined with any of the following, load the named Style Profile first, then instruct the output to match the fingerprint:

| Writing Skill | How Style Mimicker Integrates |
|---|---|
| `copywriting` | Apply style to headlines, body copy, CTAs. Match sentence rhythm and tone. |
| `copy-editing` | Use style as the editing target. Rewrite toward the style's dimensions, not generic "good writing". |
| `email-sequence` | Apply opening hook style, transitions, and closing CTA style from the profile. |
| `social-content` | Match vocabulary level, VN/EN ratio, hook style for the specific platform (FB, LinkedIn, TikTok). |
| `page-cro` | Maintain conversion principles (from page-cro) while layering the voice/tone from the style profile. |
| `popup-cro` | Apply tone and CTA closing style from the profile to popup copy. |
| `launch-strategy` | Use the hook style and structure for launch announcements. |
| `content-strategy` | Use the style as the editorial voice guideline for the entire content plan. |

### Step-by-Step Application

1. **Load Profile**: Ask "Which style profile should I use?" if not specified.
2. **Read the fingerprint**: Internalize all 9 dimensions before writing a single word.
3. **Load Anti-AI Rules**: Đọc `knowledge/15-anti-ai-content-rules.md` — 4 Rulesets bắt buộc cho MỌI profile.
4. **Draft content** using the other skill's framework (e.g., `copywriting` structure).
5. **Apply the voice layer**:
   - Replace generic transitions with the profile's `transitions` list.
   - Match sentence rhythm to the `sentence_length` spec.
   - Adjust vocabulary to match `vocabulary_level`.
   - Open with the `hook_style` defined in the profile.
   - Close with the `closing_style` defined in the profile.
6. **Avoid list check**: Verify none of the `avoid` patterns appear in the output.
6.5. **Rare Attribute & Topical Context** (nếu profile có `rare_attribute_guidance` + `topical_context_linking`):
   - Kiểm tra bài có ít nhất 1-2 rare attributes theo nguồn được định nghĩa trong profile
   - Kiểm tra mở bài + body có context linking với category hierarchy theo profile
   - Xem: `knowledge/16-seo-trends-2026.md`
7. **Anti-AI Self-Correction (Ruleset 4)**: Chạy 3 bước bắt buộc trước khi giao bài:
   - **Find & Replace**: Quét toàn bộ bài tìm từ cấm (Ruleset 1) + mẫu câu cấm (Ruleset 2). Xóa/thay thế.
   - **Tone Adjustment**: Giọng văn KHÔNG giống giáo sư hoặc phát ngôn viên. PHẢI giống đồng nghiệp/người thật chia sẻ kinh nghiệm.
   - **Detail Enrichment**: Mỗi bài PHẢI có ít nhất 1-2 ví dụ thực tế cụ thể (ưu tiên VN).
8. **Self-review**: Read the draft aloud (mentally). Does it sound like the original author?

### Style Adherence Checklist

Before delivering output, confirm:
- [ ] Opening hook matches profile's `hook_style`
- [ ] Sentence rhythms match `sentence_length` profile
- [ ] VN/EN ratio matches `language_mix`
- [ ] Signature transitions/phrases are naturally woven in
- [ ] None of the `avoid` items appear
- [ ] Closing ends in the specified `closing_style`
- [ ] **Anti-AI**: Không có từ cấm nào trong Ruleset 1 (`knowledge/15-anti-ai-content-rules.md`)
- [ ] **Anti-AI**: Không mở đầu/chuyển tiếp bằng mẫu câu cấm trong Ruleset 2
- [ ] **Anti-AI**: Câu có biến thiên độ dài (ngắn xen dài) — Ruleset 3
- [ ] **Anti-AI**: Có kinh nghiệm cá nhân + lập trường rõ ràng + ví dụ cụ thể

---

## Multi-Style Blending (Advanced)

Users can combine two styles for hybrid output:

> "Write this article blending 70% Binhnn Digital and 30% Coffee Warmth style."

When blending:
- Take the structure/framework from the primary style (70%).
- Borrow tone/vocabulary warmth from the secondary style (30%).
- Do NOT mix hook styles — use the primary style's hook.

---

## Python Helper: Profile Manager

Use this script to list, load, and apply profiles:

```python
import json
import os

PROFILES_DIR = "skills/style-mimicker/profiles"

def list_profiles():
    """Lists all saved style profiles."""
    profiles = [f.replace(".json", "") for f in os.listdir(PROFILES_DIR) if f.endswith(".json")]
    print("📚 Available Style Profiles:")
    for p in profiles:
        print(f"  - {p}")
    return profiles

def load_profile(style_name_slug):
    """Loads a style profile by slug (e.g., 'binhnn-digital')."""
    path = os.path.join(PROFILES_DIR, f"{style_name_slug}.json")
    if not os.path.exists(path):
        print(f"❌ Profile not found: {style_name_slug}")
        return None
    with open(path, "r", encoding="utf-8") as f:
        profile = json.load(f)
    print(f"✅ Loaded style: {profile['style_name']}")
    return profile

def apply_style_instructions(profile):
    """Generates a system prompt injection based on the profile."""
    fp = profile["fingerprint"]
    instruction = f"""
[STYLE PROFILE: {profile['style_name']}]
You must write ALL content following these rules:
- Sentence length: {fp['sentence_length']}
- Vocabulary: {fp['vocabulary_level']}
- Tone: {fp['tone']}
- Point of view: {fp['point_of_view']}
- Structure: {fp['structure_pattern']}
- Hook: {fp['hook_style']}
- Transitions to use: {', '.join(fp['transitions'].split(';')[:3])}
- Closing style: {fp['closing_style']}
- Language mix: {fp['language_mix']}
- AVOID: {', '.join(profile.get('avoid', []))}

Signature phrases to weave in naturally:
{chr(10).join(f"  → {p}" for p in profile.get('example_phrases', []))}
"""
    return instruction.strip()

# Example usage:
# profile = load_profile("binhnn-digital")
# instructions = apply_style_instructions(profile)
# print(instructions)
```

---

## Example: Capturing a Style

**User says**: "Phân tích phong cách viết bài này và lưu lại với tên 'Binhnn Digital'"

**AI Response flow**:
1. Reads the article and runs the 9-dimension analysis.
2. Identifies: Digital Marketing category, confident/direct tone, VI+EN mixed, opens with bold claims.
3. Generates the JSON profile.
4. Instructs user: "Save this to `skills/style-mimicker/profiles/binhnn-digital.json`"

---

## Example: Applying a Style

**User says**: "Viết email ra mắt sản phẩm này theo phong cách Binhnn Digital"

**AI does**:
1. Loads `binhnn-digital.json` profile.
2. Activates the `email-sequence` skill framework.
3. Applies the style layer on top.
4. Delivers: an email that follows email-sequence structure BUT sounds exactly like Binhnn Digital.

---

## Hỗ trợ tiếng Việt

### Tóm tắt kỹ năng
Skill này có 2 chế độ:
1. **Chế độ Học (CAPTURE)**: Paste bài viết mẫu → AI phân tích phong cách → Lưu thành profile có tên (VD: "Binhnn Digital").
2. **Chế độ Áp dụng (APPLY)**: Khi viết nội dung mới, gọi tên profile để AI tự động viết theo đúng phong cách đó.

### Các prompt tiếng Việt
- "Phân tích phong cách bài viết này và lưu với tên 'Binhnn Digital'."
- "Viết bài blog về [chủ đề] theo phong cách Binhnn Digital."
- "Kết hợp skill copywriting + phong cách 'Coffee Warmth' để viết landing page này."
- "Liệt kê các phong cách tôi đã lưu."
- "Viết email newsletter này theo 70% Binhnn Digital + 30% Saigon Tech Voice."

---

## Related Skills (Integration Partners)

By design, this skill does NOT write content independently. It always pairs with:

| Skill | Path | Cách tích hợp |
|-------|------|---------------|
| **Content Writing** | `skills/content/Content Writing/SKILL.md` | Áp dụng style ở Phase 5 (Voice Polish) |
| **Blog Content** | `skills/content/Blog Content/SKILL.md` | Giọng văn cho blog posts |
| **Pillar Pages** | `skills/content/Pillar Pages/SKILL.md` | Giọng văn cho mega-guides |
| **Content Optimization** | `skills/on-page/Content Optimization/SKILL.md` | Tối ưu on-page giữ đúng voice |
| **AI Content Optimization** | `skills/ai-seo/Content Optimization/SKILL.md` | GEO-ready với đúng giọng văn |

### Workflow tích hợp với Content Writing

```
1. User yêu cầu: "Viết bài về [topic] cho [project]"

2. AI kiểm tra:
   └── Project có style mapping không?
   └── Có → Load style profile tương ứng
   └── Không → Hỏi user hoặc dùng style mặc định

3. Chạy Content Writing workflow:
   └── Phase 0: Competitor Research
   └── Phase 1: User Psychology
   └── Phase 2: Outline
   └── Phase 3: Draft
   └── Phase 4: EEAT & GEO Check

4. Chạy Style Mimicker:
   └── Load fingerprint từ profile
   └── Apply voice layer lên draft
   └── Check adherence checklist
   └── Output: Bài viết hoàn chỉnh với đúng giọng văn
```

---

## Lưu trữ Style Profiles

Tất cả profiles được lưu tại: `skills/style-mimicker/profiles/`

```
profiles/
├── .gitkeep
├── binhnn-digital.json      # Digital marketing, thought leadership
├── thep-bao-tin.json        # B2B thép, PCCC (Thép Bảo Tín)
├── hatcapherangxay.json     # Coffee culture, lifestyle
└── [new-profile].json       # Thêm profile mới tại đây
```

### Naming convention
- File name: `{style-name-slug}.json` (lowercase, hyphen)
- Ví dụ: "BinhNN Digital" → `binhnn-digital.json`
