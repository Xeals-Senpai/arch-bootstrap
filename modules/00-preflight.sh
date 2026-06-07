#!/usr/bin/env bash

echo "[MODULE] 00-preflight"

if [[ "${SKIP_PREFLIGHT:-false}" == "true" ]]; then
    echo "Skipping preflight checks."
    return 0
fi

if ! check_not_root; then
    echo "Error: do not run as root."
    exit 1
fi

if ! check_arch_linux; then
    echo "Error: this script is intended for Arch Linux."
    exit 1
fi

if ! check_sudo; then
    echo "Error: sudo is not installed."
    exit 1
fi

echo "Preflight checks passed."