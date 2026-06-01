# `_demo` — Fallback cho Ad-hoc Content

Thư mục này là **fallback mode** khi AI nhận yêu cầu viết bài mà KHÔNG có:
- Tên project (vd "viết cho thep-bao-tin")
- Tên style profile (vd "viết theo phong cách BinhnnDigital")

→ AI sẽ activate `_demo` mode và dùng style guide ở thư mục này.

## Cấu trúc

```
projects/_demo/
├── README.md             ← File này (hướng dẫn)
├── style-guide.md        ← Style guide tiếng Việt (đọc TRƯỚC khi viết)
├── style-guide-en.md     ← Bản tiếng Anh gốc (reference, do user cung cấp)
├── writing/              ← Output: bài viết ad-hoc → {yyyy-mm-dd}-{slug}.md
├── refresh/              ← Output: refresh ad-hoc → {yyyy-mm-dd}-{slug}.md
└── audit/                ← Output: audit ad-hoc → {yyyy-mm-dd}-{slug}.md
```

## File CỐ TÌNH không có ở `_demo`

| File | Lý do thiếu |
|------|-------------|
| `memory.md` | Không có project context → không có lịch sử để track |
| `profile.md` | Không có brand voice / target audience cố định |
| `topical.md` | Không có topic cluster cố định |
| `keywords-urls.md` | Không có internal link map → AI sẽ SKIP internal link suggestion |
| `external-sources.md` | Không có whitelist domain → AI sẽ cite generic (Wikipedia, .gov, .edu, hãng lớn) và note "ad-hoc cite — user review" |

## Quy tắc đặt tên file output

| Thư mục | Pattern | Ví dụ |
|---------|---------|-------|
| `writing/` | `{yyyy-mm-dd}-{slug}.md` | `2026-05-27-cach-toi-uu-website-toc-do.md` |
| `refresh/` | `{yyyy-mm-dd}-{slug}.md` | `2026-05-27-refresh-bai-cu-ve-seo-onpage.md` |
| `audit/` | `{yyyy-mm-dd}-{slug}.md` | `2026-05-27-audit-bai-ve-thep-hoa-phat.md` |

**Date prefix** dùng để sort chronological vì không có topic cluster gom theo chủ đề.

## Khi nào KHÔNG fallback `_demo`

- User mention tên project → load project context
- User mention tên style profile → load style mimicker
- Session đang có project active (memory.md đã load) → tiếp tục dùng project context
- `/audit` URL thuộc project trong `keywords-urls.md` của project nào đó → load project context đó

## Cross-reference

- `knowledge/15-anti-ai-content-rules.md` — anti-AI rule GLOBAL (áp dụng cho MỌI project, kể cả `_demo`)
- `projects/_demo/style-guide.md` — anti-AI rule + phong cách MẶC ĐỊNH cho `_demo` (chi tiết hơn, có bảng AI-isms tiếng Việt riêng)
- `skills/content/Content Writing/SKILL.md` — Phase 0.5 detect project/style → fallback `_demo`
- `skills/content/Content Evaluation/SKILL.md` — `/audit` mode ad-hoc dùng style guide `_demo`
- `skills/style-mimicker/SKILL.md` — nếu không chỉ định style → check `_demo/style-guide.md`
- `skills/project-memory/SKILL.md` — Session End: ad-hoc không cập nhật memory project nào
