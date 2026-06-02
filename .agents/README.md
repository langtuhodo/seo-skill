# `.agents/` — Antigravity CLI / IDE Discovery Path

> **⚠️ Auto-generated mirror — DO NOT EDIT FILES HERE DIRECTLY.**

Antigravity CLI (`agy`) and Antigravity IDE auto-discover skills from `.agents/skills/<name>/SKILL.md` (Progressive Disclosure). This directory is a **mirror** of the source-of-truth:

| Source (edit here) | Mirror (Antigravity reads) |
|--------------------|----------------------------|
| `../skills/<category>/<Name>/SKILL.md` | `.agents/skills/<category>/<Name>/SKILL.md` |
| `../AGENTS.md` | `.agents/AGENTS.md` |

## How to sync

After editing any skill in `../skills/`:

```bash
bash ../scripts/sync-agents-skills.sh
```

This re-copies `../skills/` → `./skills/` and `../AGENTS.md` → `./AGENTS.md`. Idempotent.

## Why both paths exist

- **`../skills/`** (Title Case, human-friendly) — canonical source-of-truth, easy to navigate manually.
- **`.agents/skills/`** (Antigravity discovery convention) — auto-loaded by `agy` for intent-matched Progressive Disclosure.

Per [Antigravity migration guide](https://avinashsangle.com/blog/gemini-cli-to-antigravity-cli-guide): skills moved from `.gemini/skills/` to `.agents/skills/` in May 2026. We keep `skills/` as the source-of-truth for clarity, and mirror to `.agents/skills/` for Antigravity discoverability.

## Global install

To make these skills available across ALL projects (via `~/.agents/skills/`):

```bash
bash ../scripts/install-skills-global.sh           # symlinks (default)
bash ../scripts/install-skills-global.sh --copy    # copies (Windows-safe)
bash ../scripts/install-skills-global.sh --uninstall
```
