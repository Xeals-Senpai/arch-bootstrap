#!/usr/bin/env bash

load_user_env() {
    local user_env="$REPO_ROOT/config/user/user.env"

    if [[ ! -f "$user_env" ]]; then
        error "User config not found: $user_env"
        warn "Copy config/user/user.env.example to config/user/user.env and customise it."
        exit 1
    fi

    # shellcheck source=/dev/null
    source "$user_env"
}

validate_user_env() {
    local required_vars=(
        GIT_NAME
        GIT_EMAIL
        GIT_DEFAULT_BRANCH
        GIT_EDITOR
        DOTFILES_REPO
        DOTFILES_DIR
    )

    local missing=0

    for var in "${required_vars[@]}"; do
        if [[ -z "${!var:-}" ]]; then
            error "Required user.env value missing: $var"
            missing=1
        fi
    done

    if [[ "$missing" -eq 1 ]]; then
        warn "Edit config/user/user.env before running bootstrap."
        exit 1
    fi
}