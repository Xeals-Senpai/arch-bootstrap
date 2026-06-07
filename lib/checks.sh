#!/usr/bin/env bash

check_not_root() {
    [[ "${EUID}" -ne 0 ]]
}

check_arch_linux() {
    [[ -f /etc/arch-release ]]
}

check_sudo() {
    command_exists sudo
}