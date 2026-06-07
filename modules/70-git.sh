#!/usr/bin/env bash

set -euo pipefail

USER_ENV="${REPO_ROOT}/config/user/user.env"

info "Configuring Git"

if [[ ! -f "${USER_ENV}" ]]; then
    warn "User config not found: ${USER_ENV}"
    warn "Copy config/user/user.env.example to config/user/user.env and customise it."
    return 0
fi

# shellcheck source=/dev/null
source "${USER_ENV}"

if [[ -n "${GIT_NAME:-}" ]]; then
    run_cmd git config --global user.name "${GIT_NAME}"
fi

if [[ -n "${GIT_EMAIL:-}" ]]; then
    run_cmd git config --global user.email "${GIT_EMAIL}"
fi

if [[ -n "${GIT_DEFAULT_BRANCH:-}" ]]; then
    run_cmd git config --global init.defaultBranch "${GIT_DEFAULT_BRANCH}"
fi

if [[ -n "${GIT_EDITOR:-}" ]]; then
    run_cmd git config --global core.editor "${GIT_EDITOR}"
fi

success "Git configuration complete"