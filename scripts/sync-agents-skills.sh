#!/usr/bin/env bash
# sync-agents-skills.sh — Sync `skills/` → `.agents/skills/` for Antigravity discovery.
#
# Source of truth: skills/<category>/<Name>/SKILL.md (Title Case, human-friendly)
# Antigravity discovers from: .agents/skills/<name>/SKILL.md (lowercase, hyphenated)
#
# This script:
#   1. Rsyncs skills/ → .agents/skills/ (preserves SKILL.md content as-is)
#   2. Also mirrors AGENTS.md → .agents/AGENTS.md (Antigravity reads both)
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

mkdir -p "${DST}"

if command -v rsync >/dev/null 2>&1; then
    rsync -a --delete \
        --exclude=".DS_Store" \
        --exclude="*.swp" \
        "${SRC}/" "${DST}/"
    echo "[OK] rsync ${SRC}/ → ${DST}/"
else
    # Fallback: cp -r (less efficient, no delete)
    rm -rf "${DST}"
    cp -r "${SRC}" "${DST}"
    echo "[OK] cp -r ${SRC} → ${DST} (rsync not available; orphans not cleaned)"
fi

# Mirror AGENTS.md → .agents/AGENTS.md so Antigravity finds it inline
cp "${REPO_ROOT}/AGENTS.md" "${REPO_ROOT}/.agents/AGENTS.md"
echo "[OK] cp AGENTS.md → .agents/AGENTS.md"

echo ""
echo "Skills synced to Antigravity discovery path."
echo "Next: commit .agents/ + verify 'agy' picks up skills via Progressive Disclosure."
