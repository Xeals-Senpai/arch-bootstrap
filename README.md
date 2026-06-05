# arch-bootstrap

Personal Arch Linux post-install bootstrap framework.

## Purpose

`arch-bootstrap` is designed to run after `arch-installer`.

It handles personal post-install configuration, including package installation,
dotfile deployment, shell configuration, font installation, Git configuration,
and optional user environment setup.

## Project Relationship

    arch-installer
        ↓
    arch-bootstrap
        ↓
    arch-dotfiles

- `arch-installer` installs the base Arch Linux system.
- `arch-bootstrap` configures the installed system after first boot.
- `arch-dotfiles` stores personal user configuration files.

## Goals

- Install personal packages
- Install optional AUR packages
- Deploy dotfiles
- Install fonts
- Configure Zsh
- Install Zsh plugins
- Configure Starship
- Configure Git
- Configure Mako
- Configure Wofi
- Configure the user environment
- Remain modular
- Remain idempotent
- Stay suitable for current and future machines

## Planned Structure

    arch-bootstrap/
    ├── config/
    ├── docs/
    ├── lib/
    ├── modules/
    ├── packages/
    ├── profiles/
    ├── scripts/
    │   └── bootstrap.sh
    ├── .gitattributes
    ├── .gitignore
    ├── LICENSE
    └── README.md

## Current Status

Foundation stage.