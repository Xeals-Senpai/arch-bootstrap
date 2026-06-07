#!/usr/bin/env bash

set -euo pipefail

info "Configuring shell"

if ! command_exists zsh && ! is_true "${DRY_RUN:-false}"; then
    warn "zsh is not installed"
    warn "Skipping shell configuration"
    return 0
fi

if command_exists zsh; then
    success "zsh is installed"
    ZSH_PATH="$(command -v zsh)"
else
    warn "zsh is not installed, using dry-run placeholder path"
    ZSH_PATH="/usr/bin/zsh"
fi

if command_exists starship; then
    success "starship is installed"
else
    info "starship not detected"
fi

if is_true "${DRY_RUN:-false}"; then
    echo "[DRY-RUN] chsh -s ${ZSH_PATH}"
else
    CURRENT_SHELL="$(getent passwd "${USER}" | cut -d: -f7)"

    if [[ "${CURRENT_SHELL}" != "${ZSH_PATH}" ]]; then
        run_cmd chsh -s "${ZSH_PATH}"
    else
        info "zsh is already the default shell"
    fi
fi

success "Shell configuration complete"