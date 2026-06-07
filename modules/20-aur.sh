#!/usr/bin/env bash

echo "[MODULE] 20-aur"

if ! is_true "${INSTALL_AUR}"; then
    echo "AUR disabled for this profile."
    return 0
fi

AUR_PACKAGE_FILES=(
    "${REPO_ROOT}/packages/aur-base.txt"
    "${REPO_ROOT}/packages/aur-optional.txt"
)

echo "AUR package files selected:"

for package_file in "${AUR_PACKAGE_FILES[@]}"; do
    echo "  - ${package_file}"
done

echo
echo "AUR packages selected:"

for package_file in "${AUR_PACKAGE_FILES[@]}"; do
    install_aur_package_file "${package_file}"
done