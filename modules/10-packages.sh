#!/usr/bin/env bash

set -euo pipefail

info "Profile: ${PROFILE}"
info "Installing pacman packages"

PACKAGE_FILES=(
    "${REPO_ROOT}/packages/pacman-personal.txt"
)

if [[ "${INSTALL_DESKTOP:-false}" == "true" ]]; then
    PACKAGE_FILES+=("${REPO_ROOT}/packages/pacman-desktop.txt")
fi

if [[ "${INSTALL_DEVELOPMENT:-false}" == "true" ]]; then
    PACKAGE_FILES+=("${REPO_ROOT}/packages/pacman-development.txt")
fi

PACKAGES=()

for package_file in "${PACKAGE_FILES[@]}"; do
    info "Reading packages from: ${package_file}"

    while IFS= read -r package; do
        PACKAGES+=("${package}")
    done < <(read_package_file "${package_file}")
done

if [[ "${#PACKAGES[@]}" -eq 0 ]]; then
    warn "No pacman packages selected"
    exit 0
fi

info "Pacman packages selected:"
printf '%s\n' "${PACKAGES[@]}"

run_cmd sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

success "Pacman package installation complete"