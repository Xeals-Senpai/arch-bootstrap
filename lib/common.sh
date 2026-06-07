#!/usr/bin/env bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

is_true() {
    [[ "${1:-false}" == "true" ]]
}

run_cmd() {
    if is_true "${DRY_RUN:-false}"; then
        echo "[DRY-RUN] $*"
    else
        "$@"
    fi
}