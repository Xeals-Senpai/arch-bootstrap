#!/usr/bin/env bash

set -euo pipefail

info "Running final cleanup"

TEMP_PATHS=(
    # Future temporary paths can be added here.
    # Example:
    # "/tmp/yay"
)

for path in "${TEMP_PATHS[@]}"; do
    if [[ -e "${path}" ]]; then
        run_cmd rm -rf "${path}"
    elif is_true "${DRY_RUN:-false}"; then
        echo "[DRY-RUN] cleanup path not present: ${path}"
    fi
done

if command_exists fc-cache; then
    run_cmd fc-cache -fv
elif is_true "${DRY_RUN:-false}"; then
    echo "[DRY-RUN] fc-cache -fv"
fi

if command_exists update-desktop-database; then
    run_cmd update-desktop-database "${HOME}/.local/share/applications"
elif is_true "${DRY_RUN:-false}"; then
    echo "[DRY-RUN] update-desktop-database ${HOME}/.local/share/applications"
fi

info "Optional manual cleanup after verifying the system:"
echo "  rm -rf ~/Git/arch-installer"
echo "  rm -rf ~/Git/arch-bootstrap"

info "Future feature:"
echo "  Optional automatic cleanup of setup repositories via user.env flag"

success "Bootstrap cleanup complete"