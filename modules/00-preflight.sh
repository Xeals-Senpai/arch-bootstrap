#!/usr/bin/env bash

echo "[MODULE] 00-preflight"

if [[ "${EUID}" -eq 0 ]]; then
    echo "Error: do not run this script as root."
    exit 1
fi

if [[ ! -f /etc/arch-release ]]; then
    echo "Error: this script is intended for Arch Linux."
    exit 1
fi

if ! command_exists sudo; then
    echo "Error: sudo is not installed."
    exit 1
fi

if ! ping -c 1 archlinux.org >/dev/null 2>&1; then
    echo "Error: internet connection check failed."
    exit 1
fi

echo "Preflight checks passed."