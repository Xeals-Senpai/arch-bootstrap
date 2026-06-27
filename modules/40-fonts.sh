#!/usr/bin/env bash

set -euo pipefail

info "Configuring fonts"

FONT_PACKAGES=(
    "noto-fonts"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "ttf-jetbrains-mono-nerd"
)

for package in "${FONT_PACKAGES[@]}"; do
    if command_exists pacman && pacman -Q "${package}" >/dev/null 2>&1; then
        success "Font package installed: ${package}"
    elif is_true "${DRY_RUN:-false}"; then
        echo "[DRY-RUN] verify font package: ${package}"
    else
        warn "Font package not installed: ${package}"
    fi
done

if command_exists fc-cache; then
    run_cmd fc-cache -fv
elif is_true "${DRY_RUN:-false}"; then
    echo "[DRY-RUN] fc-cache -fv"
else
    warn "fc-cache is not available"
fi

success "Font configuration complete"