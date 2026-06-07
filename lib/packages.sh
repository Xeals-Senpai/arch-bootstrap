#!/usr/bin/env bash

read_package_file() {
    local package_file="$1"

    if [[ ! -f "${package_file}" ]]; then
        echo "Error: package file not found: ${package_file}"
        exit 1
    fi

    grep -vE '^\s*#|^\s*$' "${package_file}"
}

install_pacman_package_file() {
    local package_file="$1"

    echo "Installing packages from: ${package_file}"

    if [[ "${DRY_RUN:-false}" == "true" ]]; then
        read_package_file "${package_file}"
        return 0
    fi

    # shellcheck disable=SC2024
    sudo pacman -S --needed - < <(read_package_file "${package_file}")
}