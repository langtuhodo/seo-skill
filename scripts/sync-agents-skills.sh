#!/usr/bin/env bash
# sync-agents-skills.sh — Sync `skills/` → `.agents/skills/` for Antigravity discovery.
#
# Antigravity expects a FLAT layout:
#   .agents/skills/<skill_name>/SKILL.md
# where <skill_name> = the `name:` field from each SKILL.md's YAML frontmatter.
#
# IMPORTANT: Antigravity does NOT recurse into category subfolders. A nested
# layout like `.agents/skills/<category>/<Name>/SKILL.md` is invisible to it.
#
# Source of truth (canonical, human-friendly Title Case + category nesting):
#   skills/<category>/<Name>/SKILL.md
#
# This script:
#   1. Extracts `name:` from each SKILL.md frontmatter
#   2. Rebuilds `.agents/skills/<name>/` as a flat mirror of each skill folder
#   3. Mirrors AGENTS.md → .agents/AGENTS.md so Antigravity finds it inline
#
# Run after editing any SKILL.md in skills/. Idempotent.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REPO_ROOT}/skills"
DST="${REPO_ROOT}/.agents/skills"

if [ ! -d "${SRC}" ]; then
    echo "ERROR: source not found: ${SRC}" >&2
    exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
    echo "ERROR: python3 is required for frontmatter parsing" >&2
    exit 1
fi

# Wipe + rebuild flat .agents/skills (idempotent guarantee)
rm -rf "${DST}"
mkdir -p "${DST}"

# Python does the heavy lifting: parse YAML frontmatter, build flat mirror.
python3 - "${SRC}" "${DST}" << 'PY'
import os, sys, shutil, glob, re

SRC, DST = sys.argv[1], sys.argv[2]
moved, skipped = 0, []

def parse_name(path):
    """Extract `name:` from YAML frontmatter. Falls back to dirname if missing."""
    try:
        with open(path, encoding="utf-8") as fh:
            text = fh.read()
        if not text.startswith("---"):
            return None
        end = text.index("\n---", 4)
        fm = text[4:end]
        m = re.search(r"^\s*name:\s*([A-Za-z0-9_\-]+)\s*$", fm, re.MULTILINE)
        return m.group(1) if m else None
    except Exception:
        return None

seen = {}
for src_skill in sorted(glob.glob(os.path.join(SRC, "**/SKILL.md"), recursive=True)):
    nm = parse_name(src_skill) or os.path.basename(os.path.dirname(src_skill)).lower().replace(" ", "-")
    if nm in seen:
        skipped.append((src_skill, f"name collision with {seen[nm]}"))
        continue
    seen[nm] = src_skill
    src_dir = os.path.dirname(src_skill)
    dst_dir = os.path.join(DST, nm)
    shutil.copytree(src_dir, dst_dir,
                    ignore=shutil.ignore_patterns(".DS_Store", "*.swp"))
    moved += 1

print(f"[OK] flattened {moved} skills → {DST}/<name>/SKILL.md")
for f, reason in skipped:
    print(f"  [SKIP] {f}: {reason}", file=sys.stderr)
if skipped:
    sys.exit(2)
PY

# Mirror AGENTS.md → .agents/AGENTS.md so Antigravity finds it inline
cp "${REPO_ROOT}/AGENTS.md" "${REPO_ROOT}/.agents/AGENTS.md"
echo "[OK] cp AGENTS.md → .agents/AGENTS.md"

echo ""
echo "Skills synced to Antigravity workspace discovery path:"
echo "  ${DST}/<skill_name>/SKILL.md"
echo ""
echo "Verify with: agy skills list  (expect 62 skills)"
