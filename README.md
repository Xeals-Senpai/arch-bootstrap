# arch-bootstrap

Personal Arch Linux post-install bootstrap framework.

## Purpose

arch-bootstrap automates post-install configuration after a successful
Arch Linux installation.

It is designed to:

- Install packages
- Configure user environment
- Deploy personal dotfiles
- Configure development tools
- Install optional software
- Remain modular and idempotent

## Project Status

Planning

## Planned Structure

scripts/
├── bootstrap.sh
├── packages.sh
├── dotfiles.sh
├── fonts.sh
├── shell.sh
└── git.sh

docs/
└── README.md