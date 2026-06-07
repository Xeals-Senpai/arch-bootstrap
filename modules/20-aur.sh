#!/usr/bin/env bash

set -euo pipefail

info "Installing AUR packages"

AUR_FILES=(
    "${REPO_ROOT}/packages/aur-base.txt"
)

if [[ "${INSTALL_AUR_OPTIONAL:-false}" == "true" ]]; then
    AUR_FILES+=("${REPO_ROOT}/packages/aur-optional.txt")
fi

AUR_PACKAGES=()

for aur_file in "${AUR_FILES[@]}"; do
    info "Reading AUR packages from: ${aur_file}"

    while IFS= read -r package; do
        AUR_PACKAGES+=("${package}")
    done < <(read_package_file "${aur_file}")
done

if [[ "${#AUR_PACKAGES[@]}" -eq 0 ]]; then
    warn "No AUR packages selected"
    return 0
fi

info "AUR packages selected:"
printf '%s\n' "${AUR_PACKAGES[@]}"

if ! command_exists yay && ! is_true "${DRY_RUN:-false}"; then
    warn "yay is not installed"
    warn "Skipping AUR package installation"
    return 0
fi

run_cmd yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

success "AUR package installation complete"