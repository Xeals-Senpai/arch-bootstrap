#!/usr/bin/env bash

echo "[MODULE] 10-packages"

PACMAN_PACKAGE_FILES=(
    "${REPO_ROOT}/packages/pacman-personal.txt"
)

if is_true "${INSTALL_FILEMANAGER}" || is_true "${INSTALL_SOCIAL}" || is_true "${INSTALL_BLUETOOTH}"; then
    PACMAN_PACKAGE_FILES+=("${REPO_ROOT}/packages/pacman-desktop.txt")
fi

if is_true "${INSTALL_DEVELOPMENT}"; then
    PACMAN_PACKAGE_FILES+=("${REPO_ROOT}/packages/pacman-development.txt")
fi

echo "Pacman package files selected:"

for package_file in "${PACMAN_PACKAGE_FILES[@]}"; do
    echo "  - ${package_file}"
done

echo
echo "Pacman packages selected:"

for package_file in "${PACMAN_PACKAGE_FILES[@]}"; do
    install_pacman_package_file "${package_file}"
done