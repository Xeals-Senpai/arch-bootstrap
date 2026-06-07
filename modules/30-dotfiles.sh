#!/usr/bin/env bash

echo "[MODULE] 30-dotfiles"

DOTFILES_REPO="https://github.com/Xeals-Senpai/arch-dotfiles.git"
DOTFILES_DIR="${HOME}/Git/arch-dotfiles"

echo "Dotfiles repository:"
echo "  ${DOTFILES_REPO}"

echo
echo "Repository location:"
echo "  ${DOTFILES_DIR}"

echo
echo "Planned actions:"

if [[ -d "${DOTFILES_DIR}" ]]; then
    echo "  - Repository exists"
    echo "  - Pull latest changes"
else
    echo "  - Repository missing"
    echo "  - Clone repository"
fi

echo "  - Deploy .config files"
echo "  - Deploy Zsh configuration"
echo "  - Deploy Starship configuration"
echo "  - Deploy Kitty configuration"
echo "  - Deploy Neovim configuration"
echo "  - Deploy Waybar configuration"