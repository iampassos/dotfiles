#!/bin/bash

echo "[INSTALL.SH] Starting install..."

DOTFILES_DIR="$HOME/.dotfiles"

PACKAGES=(stow zsh)

echo "[PACKAGE_MANAGER] Installing packages: ${PACKAGES[*]}"
eval "sudo dnf install -y ${PACKAGES[*]}"

chsh -s $(which zsh)
echo "[SYSTEM] Set zsh as default shell"

cd "$DOTFILES_DIR" || exit

for folder in $(ls -d */); do
    folder=${folder%/}
    echo "[STOW] Stowing $folder"
    stow -D "$folder"
    stow "$folder"
done

echo "[INSTALL.SH] Finished install!"
