#!/usr/bin/env bash

set -euo pipefail

USER_ENV="${REPO_ROOT}/config/user/user.env"

info "Deploying dotfiles"

if [[ ! -f "${USER_ENV}" ]]; then
    warn "User config not found"
    return 0
fi

# shellcheck source=/dev/null
source "${USER_ENV}"

if [[ -z "${DOTFILES_REPO:-}" ]]; then
    warn "DOTFILES_REPO not configured"
    return 0
fi

if [[ -z "${DOTFILES_DIR:-}" ]]; then
    warn "DOTFILES_DIR not configured"
    return 0
fi

if [[ ! -d "${DOTFILES_DIR}/.git" ]]; then
    run_cmd git clone "${DOTFILES_REPO}" "${DOTFILES_DIR}"
else
    run_cmd git -C "${DOTFILES_DIR}" pull
fi

success "Dotfiles deployment complete"