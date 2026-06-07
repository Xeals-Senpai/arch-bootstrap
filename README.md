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

## Repository Structure

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

Project status: Feature Complete (Pre-Validation)

### Implemented Modules

| Module       | Status   |
| ------------ | -------- |
| 00-preflight | Complete |
| 10-packages  | Complete |
| 20-aur       | Complete |
| 30-dotfiles  | Complete |
| 40-fonts     | Complete |
| 50-shell     | Complete |
| 60-desktop   | Complete |
| 70-git       | Complete |
| 90-cleanup   | Complete |

### Implemented Features

* Profile-based deployment
* Dry-run support
* User configuration via `user.env`
* Pacman package installation
* AUR package installation
* Dotfiles deployment
* Font configuration
* Shell configuration
* Desktop configuration
* Git configuration
* Cleanup and finalisation

### Next Milestone

Perform the first full bootstrap run on a real Arch Linux installation and validate the complete workflow.
