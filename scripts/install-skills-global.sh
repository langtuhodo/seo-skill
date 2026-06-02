#!/usr/bin/env bash
# install-skills-global.sh — Cài skills vào ~/.agents/skills/ để Antigravity CLI dùng global.
#
# Antigravity CLI tự discovery từ 2 path:
#   - Repo-level: <repo>/.agents/skills/  (workspace skills, ưu tiên cao)
#   - Global:     ~/.agents/skills/        (shared across projects)
#
# Script này cài source-of-truth `skills/` của repo này vào ~/.agents/skills/
# (lưu vào subfolder `seo-skill/` để tránh conflict với skills khác user có sẵn).
#
# Usage:
#   bash scripts/install-skills-global.sh         # install + symlink (default)
#   bash scripts/install-skills-global.sh --copy  # copy thay vì symlink (Windows-safe)
#   bash scripts/install-skills-global.sh --uninstall
#
# Idempotent — chạy lại OK.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REPO_ROOT}/skills"
GLOBAL_DIR="${HOME}/.agents/skills"
NAMESPACE="seo-skill"
TARGET="${GLOBAL_DIR}/${NAMESPACE}"

MODE="symlink"
for arg in "$@"; do
    case "${arg}" in
        --copy) MODE="copy" ;;
        --uninstall) MODE="uninstall" ;;
        --help|-h)
            sed -n '1,/^set -euo/p' "$0" | sed 's/^# \?//; /^!\/.*/d'
            exit 0
            ;;
    esac
done

if [ ! -d "${SRC}" ]; then
    echo "ERROR: source not found: ${SRC}" >&2
    exit 1
fi

case "${MODE}" in
    uninstall)
        if [ -e "${TARGET}" ] || [ -L "${TARGET}" ]; then
            rm -rf "${TARGET}"
            echo "[OK] removed ${TARGET}"
        else
            echo "[SKIP] not installed: ${TARGET}"
        fi
        ;;
    symlink)
        mkdir -p "${GLOBAL_DIR}"
        if [ -L "${TARGET}" ]; then
            rm "${TARGET}"
        elif [ -d "${TARGET}" ]; then
            echo "[WARN] ${TARGET} is a directory (previously copied); removing"
            rm -rf "${TARGET}"
        fi
        ln -s "${SRC}" "${TARGET}"
        echo "[OK] symlinked ${SRC} → ${TARGET}"
        echo "     Antigravity CLI discovers skills at ${TARGET}/<Skill>/SKILL.md"
        ;;
    copy)
        mkdir -p "${GLOBAL_DIR}"
        if command -v rsync >/dev/null 2>&1; then
            rsync -a --delete \
                --exclude=".DS_Store" \
                --exclude="*.swp" \
                "${SRC}/" "${TARGET}/"
        else
            rm -rf "${TARGET}"
            cp -r "${SRC}" "${TARGET}"
        fi
        echo "[OK] copied ${SRC} → ${TARGET}"
        echo "     Re-run this script after editing source skills/ to re-sync."
        ;;
esac
