#!/usr/bin/env bash

read_package_file() {
    local package_file="$1"

    if [[ ! -f "${package_file}" ]]; then
        echo "Error: package file not found: ${package_file}"
        exit 1
    fi

    grep -vE '^\s*#|^\s*$' "${package_file}"
}