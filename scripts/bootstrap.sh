#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# shellcheck disable=SC1091
source "${REPO_ROOT}/lib/logging.sh"
# shellcheck disable=SC1091
source "${REPO_ROOT}/lib/common.sh"
# shellcheck disable=SC1091
source "${REPO_ROOT}/lib/packages.sh"
# shellcheck disable=SC1091
source "${REPO_ROOT}/lib/checks.sh"
# shellcheck disable=SC1091
source "${REPO_ROOT}/lib/user-env.sh"

load_user_env
validate_user_env

PROFILE="${1:-default}"
PROFILE_FILE="${REPO_ROOT}/profiles/${PROFILE}.conf"

echo
echo "arch-bootstrap"
echo "=============="
echo

if [[ ! -f "${PROFILE_FILE}" ]]; then
    echo "Error: profile not found: ${PROFILE}"
    echo
    echo "Available profiles:"
    find "${REPO_ROOT}/profiles" -maxdepth 1 -name "*.conf" -exec basename {} .conf \;
    exit 1
fi

echo "Using profile: ${PROFILE}"
echo "Loading: ${PROFILE_FILE}"
echo

# shellcheck source=/dev/null
source "${PROFILE_FILE}"

echo "Profile settings:"
echo "  INSTALL_BLUETOOTH=${INSTALL_BLUETOOTH}"
echo "  INSTALL_SSH=${INSTALL_SSH}"
echo "  INSTALL_SOCIAL=${INSTALL_SOCIAL}"
echo "  INSTALL_SPOTIFY=${INSTALL_SPOTIFY}"
echo "  INSTALL_WHATSAPP=${INSTALL_WHATSAPP}"
echo "  INSTALL_FILEMANAGER=${INSTALL_FILEMANAGER}"
echo "  INSTALL_DEVELOPMENT=${INSTALL_DEVELOPMENT}"
echo "  INSTALL_POWERTOOLS=${INSTALL_POWERTOOLS}"
echo "  INSTALL_AUR=${INSTALL_AUR}"
echo "  INSTALL_AUR_OPTIONAL=${INSTALL_AUR_OPTIONAL}"
echo "  INSTALL_DESKTOP=${INSTALL_DESKTOP}"
echo

echo "Planned module order:"
echo "  00-preflight"
echo "  10-packages"
echo "  20-aur"
echo "  30-dotfiles"
echo "  40-fonts"
echo "  50-shell"
echo "  60-desktop"
echo "  70-git"
echo "  90-cleanup"
echo

echo
echo "Executing modules..."
echo

for module in "${REPO_ROOT}"/modules/*.sh; do
    # shellcheck disable=SC1090
    source "${module}"
    echo
done

echo
echo "Bootstrap complete."
echo

echo
success "Bootstrap completed successfully"
echo
echo "Next steps:"
echo "  1. Log out and log back in"
echo "  2. Confirm Sway starts automatically"
echo "  3. Check Waybar, Kitty, Wofi, Mako, and Git"
echo
echo "Useful checks:"
echo "  echo \$SHELL"
echo "  git --no-pager config --global --list"
echo "  ls -la ~/.config"
echo