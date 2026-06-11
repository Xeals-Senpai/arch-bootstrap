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
    error "DOTFILES_REPO is not configured"
    return 1
fi

if [[ -z "${DOTFILES_DIR:-}" ]]; then
    error "DOTFILES_DIR is not configured"
    return 1
fi

info "Deploying dotfiles"

run_cmd mkdir -p "$HOME/.config"

deployed=0

if [[ -d "$DOTFILES_DIR/.config" ]]; then
    run_cmd cp -r "$DOTFILES_DIR/.config/." "$HOME/.config/"
    deployed=1
else
    warn "No .config directory found in dotfiles repo"
fi

for file in .zshrc .zshenv .zlogin; do
    if [[ -f "$DOTFILES_DIR/$file" ]]; then
        run_cmd cp "$DOTFILES_DIR/$file" "$HOME/$file"
        deployed=1
    else
        warn "Missing dotfile: $file"
    fi
done

if [[ "$deployed" -eq 1 ]]; then
    success "Dotfiles deployment complete"
else
    warn "No dotfiles were deployed"
fi
