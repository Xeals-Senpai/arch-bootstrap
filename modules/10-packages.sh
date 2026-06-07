#!/usr/bin/env bash

echo "[MODULE] 10-packages"

echo "Personal packages:"
read_package_file "${REPO_ROOT}/packages/pacman-personal.txt"