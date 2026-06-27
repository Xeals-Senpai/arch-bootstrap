# arch-bootstrap

Personal Arch Linux post-install bootstrap framework.

## Purpose

`arch-bootstrap` is designed to run after `arch-installer`.

It handles personal post-install configuration, including package installation, dotfile deployment, shell configuration, font installation, Git configuration, and optional user environment setup.

## Project Relationship

```
arch-installer
    ↓
arch-bootstrap
    ↓
arch-dotfiles
```

* `arch-installer` installs the base Arch Linux system.
* `arch-bootstrap` configures the installed system after first boot.
* `arch-dotfiles` stores personal user configuration files.

## Goals

* Install personal packages
* Install optional AUR packages
* Deploy dotfiles
* Configure the shell environment
* Configure desktop utilities
* Configure Git
* Configure user-specific settings
* Support multiple deployment profiles
* Remain modular
* Remain idempotent
* Stay suitable for current and future machines

## Repository Structure

```
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
```

## Usage

After booting into a freshly installed Arch Linux system:

```bash
git clone https://github.com/Xeals-Senpai/arch-bootstrap.git
cd arch-bootstrap

cp config/user/user.env.example config/user/user.env
nvim config/user/user.env

./scripts/bootstrap.sh workstation
```

Available profiles:

```text
default
workstation
laptop
server
```

## Current Status

Project Status: Feature Complete (Validated)

arch-bootstrap has been successfully validated on a real Arch Linux installation using the complete workflow:

```
arch-installer
    ↓
First Boot
    ↓
arch-bootstrap
    ↓
arch-dotfiles
    ↓
Automatic Sway Session
```

Validation confirmed:

* Pacman package installation
* AUR package installation
* Dotfile deployment
* Automatic dotfile repository cloning
* Font configuration
* Zsh and Starship configuration
* Desktop configuration
* Git configuration
* Profile-based deployment

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

* Real hardware validation
* Profile-based deployment
* Dry-run support
* User configuration via `user.env`
* Pacman package installation
* AUR package installation
* Automatic dotfile repository cloning
* Dotfiles deployment
* Font configuration
* Shell configuration
* Desktop configuration
* Git configuration
* Cleanup and finalisation

## Documentation

Additional documentation is available in the `docs/` directory:

* DESIGN.md
* MODULES.md
* PROFILES.md
* WORKFLOW.md

## Future Development

Future work will focus on:

* Additional profile refinement
* Quality-of-life improvements
* New optional modules
* Documentation updates
* Continued validation on additional hardware

## License

MIT License
