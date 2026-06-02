# `.agents/` — Antigravity CLI / IDE Discovery Path

> **⚠️ Auto-generated mirror — DO NOT EDIT FILES HERE DIRECTLY.**

Antigravity CLI (`agy`) and Antigravity IDE auto-discover skills from `.agents/skills/<skill_name>/SKILL.md` (Progressive Disclosure).

**Important**: Antigravity expects a FLAT layout (`<skill_name>` directly under `.agents/skills/`). It does NOT recurse into category subfolders. The mirror here is therefore flattened from the canonical source — `<skill_name>` is taken from each SKILL.md's YAML frontmatter `name:` field.

| Source (edit here) | Mirror (Antigravity reads) |
|--------------------|----------------------------|
| `../skills/<category>/<Name>/SKILL.md` | `.agents/skills/<frontmatter-name>/SKILL.md` |
| `../AGENTS.md` | `.agents/AGENTS.md` |

Example: `../skills/content/Content Writing/SKILL.md` (frontmatter `name: content-writing`) → `.agents/skills/content-writing/SKILL.md`.

## How to sync

After editing any skill in `../skills/`:

```bash
bash ../scripts/sync-agents-skills.sh
```

This re-builds `.agents/skills/<name>/` flat layout from `../skills/` and copies `../AGENTS.md` → `./AGENTS.md`. Idempotent (wipes and rebuilds).

## Why two paths exist

- **`../skills/<category>/<Name>/`** (Title Case, category-nested) — canonical source-of-truth, easy to navigate manually.
- **`.agents/skills/<skill_name>/`** (lowercase-hyphenated, flat) — Antigravity discovery convention; auto-loaded by `agy` for intent-matched Progressive Disclosure.

Per Antigravity codelab + actual `/skills` runtime behavior (2026-05): skills moved from `.gemini/skills/` → `.agents/skills/`. We keep `skills/` as the source-of-truth, and mirror to `.agents/skills/` for Antigravity discoverability.

## Global install (Antigravity CLI)

Antigravity CLI's `/skills` command lists 3 discovery paths:
- **Workspace**: this directory (`.agents/skills/<name>/SKILL.md`)
- **Global**: `~/.gemini/antigravity-cli/skills/<name>/SKILL.md`
- **Shared** (legacy Gemini CLI compat): `~/.gemini/skills/<name>/SKILL.md`

To install these 62 skills globally (available across ALL projects):

```bash
bash ../scripts/install-skills-global.sh              # symlink to global (default)
bash ../scripts/install-skills-global.sh --copy       # copy instead (Windows-safe)
bash ../scripts/install-skills-global.sh --shared     # also install to ~/.gemini/skills/ (Gemini CLI compat)
bash ../scripts/install-skills-global.sh --uninstall  # gỡ tất cả symlink/copy do script tạo
```

Verify with `agy /skills` — expect 62 skills listed.
