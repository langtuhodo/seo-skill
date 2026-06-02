#!/usr/bin/env bash
# install-skills-global.sh — Cài skills vào path global của Antigravity CLI.
#
# Per Antigravity output `/skills` command, có 3 discovery path:
#   - Workspace: <repo>/.agents/skills/<skill_name>/SKILL.md      (auto, repo-level)
#   - Global:    ~/.gemini/antigravity-cli/skills/<skill_name>/   (script này)
#   - Shared:    ~/.gemini/skills/<skill_name>/                   (Gemini CLI legacy)
#
# Antigravity expect FLAT layout: 1 folder per skill, name = frontmatter `name:`.
# Source: <repo>/.agents/skills/<skill_name>/  (đã được flatten bởi sync-agents-skills.sh)
#
# Usage:
#   bash scripts/install-skills-global.sh              # symlink to global (default)
#   bash scripts/install-skills-global.sh --copy       # copy thay vì symlink
#   bash scripts/install-skills-global.sh --shared     # cài thêm vào ~/.gemini/skills/ (Gemini-CLI compat)
#   bash scripts/install-skills-global.sh --uninstall  # gỡ tất cả symlink/copy do script tạo
#
# Idempotent — chạy lại OK.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REPO_ROOT}/.agents/skills"

GLOBAL_DIR="${HOME}/.gemini/antigravity-cli/skills"
SHARED_DIR="${HOME}/.gemini/skills"
MARK_FILE=".installed-by-seo-skill"  # marker để uninstall không xoá nhầm skill khác

MODE="symlink"
TARGET_DIRS=("${GLOBAL_DIR}")
for arg in "$@"; do
    case "${arg}" in
        --copy)      MODE="copy" ;;
        --shared)    TARGET_DIRS+=("${SHARED_DIR}") ;;
        --uninstall) MODE="uninstall" ;;
        --help|-h)
            sed -n '1,/^set -euo/p' "$0" | sed 's/^# \?//; /^!\/.*/d'
            exit 0
            ;;
        *) echo "Unknown arg: ${arg}" >&2; exit 2 ;;
    esac
done

if [ ! -d "${SRC}" ]; then
    echo "ERROR: source not found: ${SRC}" >&2
    echo "  Run 'bash scripts/sync-agents-skills.sh' first to build .agents/skills/" >&2
    exit 1
fi

# Đếm skill source để log
SKILL_COUNT=$(find "${SRC}" -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ')
echo "Source: ${SRC} (${SKILL_COUNT} skills)"

install_to() {
    local dst_root="$1"
    mkdir -p "${dst_root}"
    local n=0
    for src_skill in "${SRC}"/*/; do
        local nm
        nm="$(basename "${src_skill%/}")"
        local dst="${dst_root}/${nm}"

        # Nếu target tồn tại do user (không có marker) → cảnh báo, skip
        if [ -e "${dst}" ] && [ ! -L "${dst}" ] && [ ! -f "${dst}/${MARK_FILE}" ]; then
            echo "  [SKIP] ${dst} (đã tồn tại, không phải do script này tạo)"
            continue
        fi

        # Clean cũ
        rm -rf "${dst}"

        if [ "${MODE}" = "symlink" ]; then
            ln -s "${src_skill%/}" "${dst}"
        else
            cp -r "${src_skill%/}" "${dst}"
            touch "${dst}/${MARK_FILE}"
        fi
        n=$((n + 1))
    done
    echo "  [OK] ${n} skills → ${dst_root}/<name>/"
}

uninstall_from() {
    local dst_root="$1"
    if [ ! -d "${dst_root}" ]; then
        echo "  [SKIP] ${dst_root} (không tồn tại)"
        return
    fi
    local n=0
    for src_skill in "${SRC}"/*/; do
        local nm
        nm="$(basename "${src_skill%/}")"
        local dst="${dst_root}/${nm}"
        if [ -L "${dst}" ]; then
            local link_target
            link_target="$(readlink "${dst}")"
            if [[ "${link_target}" == "${SRC}/"* ]]; then
                rm -f "${dst}"
                n=$((n + 1))
            fi
        elif [ -f "${dst}/${MARK_FILE}" ]; then
            rm -rf "${dst}"
            n=$((n + 1))
        fi
    done
    echo "  [OK] removed ${n} skills from ${dst_root}/"
}

case "${MODE}" in
    uninstall)
        for d in "${GLOBAL_DIR}" "${SHARED_DIR}"; do uninstall_from "${d}"; done
        ;;
    symlink|copy)
        echo "Mode: ${MODE}"
        for d in "${TARGET_DIRS[@]}"; do install_to "${d}"; done
        echo ""
        echo "Verify với 'agy' (chạy ở thư mục bất kỳ, không cần ở repo):"
        echo "  agy /skills    # expect ${SKILL_COUNT} skills"
        ;;
esac
