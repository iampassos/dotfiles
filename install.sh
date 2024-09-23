#!/bin/bash

echo "[INSTALL.SH] Starting install..."

DOTFILES_DIR="$HOME/.dotfiles"

PACKAGES=(git stow zsh build-essential)

echo "[PACKAGE_MANAGER] Installing packages: ${PACKAGES[*]}"
eval "sudo dnf install -y ${PACKAGES[*]}"

cd "$DOTFILES_DIR" || exit

for folder in $(ls -d */); do
    folder=${folder%/}
    echo "[STOW] Stowing $folder"
    stow -D "$folder"
    stow "$folder"
done

echo "[INSTALL.SH] Finished install!"
