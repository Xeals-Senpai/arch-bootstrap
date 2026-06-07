# Workflow

This document explains how arch-bootstrap is designed to operate.

## Overview

arch-bootstrap is intended to run after a successful installation performed by arch-installer.

Typical workflow:

```text
arch-installer
    ↓
Base Arch Linux installation

arch-bootstrap
    ↓
System configuration

arch-dotfiles
    ↓
Personal user environment
```

## Intended Usage

After booting into the newly installed Arch Linux system:

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

## Runtime Flow

bootstrap.sh performs the following actions:

1. Detect repository paths.
2. Load helper libraries from `lib/`.
3. Load the selected profile from `profiles/`.
4. Print active profile configuration.
5. Execute modules from `modules/` in numeric order.

Module execution order:

```text
00-preflight
10-packages
20-aur
30-dotfiles
40-fonts
50-shell
60-desktop
70-git
90-cleanup
```

## Module Responsibilities

### 00-preflight.sh

Validates the environment before bootstrap execution.

Checks:

* Script is not running as root
* System is Arch Linux
* sudo is available
* Additional checks may be added later

Supports:

```bash
SKIP_PREFLIGHT=true
```

for development and testing.

---

### 10-packages.sh

Installs pacman packages based on the active profile.

Package files:

```text
packages/pacman-personal.txt
packages/pacman-desktop.txt
packages/pacman-development.txt
```

Features:

* Ignores comments
* Ignores blank lines
* Supports dry-run mode
* Uses `--needed`

---

### 20-aur.sh

Installs AUR packages using `yay`.

Package files:

```text
packages/aur-base.txt
packages/aur-optional.txt
```

Features:

* Profile-aware installation
* Dry-run support
* Empty file handling
* Assumes `yay` is already installed by arch-installer

---

### 30-dotfiles.sh

Manages the arch-dotfiles repository.

Repository:

```text
https://github.com/Xeals-Senpai/arch-dotfiles
```

Location:

```text
~/Git/arch-dotfiles
```

Behaviour:

```text
Repository exists?
├─ No → Clone
└─ Yes → Pull latest changes
```

---

### 40-fonts.sh

Handles font-related post-install tasks.

Responsibilities:

* Verify font packages
* Refresh font cache

Font installation itself is handled by package lists.

---

### 50-shell.sh

Handles shell-related configuration.

Responsibilities:

* Verify Zsh installation
* Verify Starship installation
* Set Zsh as the default shell

Shell configuration files are managed by arch-dotfiles.

---

### 60-desktop.sh

Handles desktop environment verification and setup.

Responsibilities:

* Verify desktop applications
* Verify desktop utilities
* Enable desktop-related services

Examples:

```text
NetworkManager
Bluetooth
```

---

### 70-git.sh

Configures Git using values stored in:

```text
config/user/user.env
```

Responsibilities:

* Configure Git username
* Configure Git email
* Configure default branch
* Configure default editor

Future expansion:

```text
SSH configuration
GitHub integration
```

---

### 90-cleanup.sh

Runs finalisation tasks.

Responsibilities:

* Refresh font cache
* Refresh desktop database
* Remove future temporary artefacts
* Display cleanup recommendations
* Display bootstrap completion status

## User Configuration

User-specific settings are stored in:

```text
config/user/user.env
```

This file is intentionally ignored by Git.

Template:

```text
config/user/user.env.example
```

Typical values:

```bash
GIT_NAME=""
GIT_EMAIL=""
DOTFILES_REPO=""
DOTFILES_DIR=""
```

## Development Workflow

Development currently occurs on Windows using Git Bash.

Testing command:

```bash
SKIP_PREFLIGHT=true DRY_RUN=true ./scripts/bootstrap.sh workstation
```

Reason:

* Windows is not Arch Linux
* Preflight would fail normally
* Dry-run allows validation of module flow

## Module Status

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

## Next Milestone

Perform the first full bootstrap run on a real Arch Linux installation and validate the complete workflow.
