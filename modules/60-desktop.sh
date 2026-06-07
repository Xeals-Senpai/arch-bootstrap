#!/usr/bin/env bash

set -euo pipefail

info "Configuring desktop environment"

DESKTOP_COMMANDS=(
    "sway"
    "waybar"
    "mako"
    "wofi"
    "kitty"
    "nmcli"
    "nm-applet"
    "bluetoothctl"
)

for command in "${DESKTOP_COMMANDS[@]}"; do
    if command_exists "${command}"; then
        success "Found: ${command}"
    elif is_true "${DRY_RUN:-false}"; then
        echo "[DRY-RUN] verify command: ${command}"
    else
        warn "Missing command: ${command}"
    fi
done

SERVICES=(
    "NetworkManager.service"
    "bluetooth.service"
)

for service in "${SERVICES[@]}"; do
    if is_true "${DRY_RUN:-false}"; then
        echo "[DRY-RUN] sudo systemctl enable --now ${service}"
    else
        run_cmd sudo systemctl enable --now "${service}"
    fi
done

success "Desktop environment configuration complete"