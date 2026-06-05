# Design

## Purpose

arch-bootstrap is responsible for personal configuration.

It assumes Arch Linux has already been installed by arch-installer.

## Responsibilities

- Install user packages
- Deploy dotfiles
- Configure shell environment
- Configure desktop utilities
- Configure Git
- Apply user-selected profiles

## Non-Responsibilities

- Partitioning
- Filesystems
- Bootloaders
- Snapper
- Btrfs
- UKI generation
- Base operating system installation

These are handled by arch-installer.