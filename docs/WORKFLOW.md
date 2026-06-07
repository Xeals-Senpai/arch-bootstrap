# Workflow

This document explains how arch-bootstrap is expected to run.

## Intended Usage

arch-bootstrap is designed to run after arch-installer has completed and the machine has rebooted into the installed Arch Linux system.

Typical flow:

1. Install Arch Linux using arch-installer.
2. Reboot into the installed system.
3. Clone arch-bootstrap.
4. Run bootstrap with a selected profile.

Example:

```bash
git clone https://github.com/Xeals-Senpai/arch-bootstrap.git
cd arch-bootstrap
./scripts/bootstrap.sh workstation
```

# Runtime Flow

bootstrap.sh performs the following steps:

1. Detect repository paths.
2. Load helper libraries from `lib/`.
3. Load the selected profile from `profiles/`.
4. Print selected profile settings.
5. Execute modules from `modules/` in numbered order.

# Module Order

## 00-preflight.sh

Checks whether the system is ready for bootstrap.

Planned checks include:

- Ensure the script is not run as root.
- Ensure the system is Arch Linux.
- Ensure sudo is available.
- Ensure internet connectivity is available.

## 10-packages.sh

Selects pacman package lists based on the active profile.

Package files are stored in `packages/`.

## 20-aur.sh

Selects AUR package lists when AUR support is enabled for the active profile.

AUR installation is skipped for profiles where:

```bash
INSTALL_AUR=false
```

## 30-dotfiles.sh

Handles the arch-dotfiles repository.

Planned behaviour:

- Clone arch-dotfiles if missing.
- Pull latest changes if already present.
- Deploy configuration files.

Repository location:

```text
~/Git/arch-dotfiles
```

## 40-fonts.sh

Handles font-related post-install tasks.

Package installation happens through pacman package lists.

This module is reserved for:

- Font verification.
- Font cache rebuilds.

## 50-shell.sh

Handles shell configuration.

Planned behaviour:

- Verify Zsh.
- Verify Starship.
- Set Zsh as the default shell.
- Deploy `.zshrc`.
- Configure Starship.

## 60-desktop.sh

Handles desktop user environment configuration.

Planned behaviour:

- Verify Sway.
- Verify Waybar.
- Verify Mako.
- Verify Wofi.
- Deploy desktop configuration.

## 70-git.sh

Handles Git configuration.

Planned behaviour:

- Configure Git user name.
- Configure Git email.
- Configure default branch.
- Configure default editor.
- Prepare GitHub/SSH-related workflow later.

## 90-cleanup.sh

Runs final cleanup and summary tasks.

Planned behaviour:

- Refresh caches.
- Remove temporary files.
- Display summary.

# Development Notes

## Testing on Windows

For development on Windows, use:

```bash
SKIP_PREFLIGHT=true DRY_RUN=true ./scripts/bootstrap.sh workstation
```

Reason:

- Windows is not Arch Linux.
- Preflight checks would otherwise stop execution.
- Dry-run mode allows framework testing without making changes.
