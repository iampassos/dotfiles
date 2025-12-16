#!/usr/bin/env bash
set -euo pipefail

sudo dnf upgrade --refresh -y

sudo dnf install -y git vim stow zsh tmux fzf fd-find ripgrep bat zip unzip vlc htop @development-tools
sudo dnf install -y wl-clipboard waybar mako gammastep grimshot xdg-desktop-portal-wlr

[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sudo dnf install -y flatpak 
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub us.zoom.Zoom

curl -fsS https://dl.brave.com/install.sh | sh

command -v rustc >/dev/null 2>&1 || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"
command -v bob >/dev/null 2>&1 || cargo install bob-nvim
bob use nightly

sudo dnf copr enable scottames/ghostty -y
sudo dnf install ghostty -y

[ -d "$HOME/.config/sway" ] && rm -rf "$HOME/.config/sway"
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.default"
[ ! -d "$HOME/.dotfiles" ] && git clone https://github.com/iampassos/dotfiles "$HOME/.dotfiles"
[ -d "$HOME/.dotfiles" ] && cd "$HOME/.dotfiles" && stow . && cd "$HOME"

cd "$HOME/Downloads"
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
git sparse-checkout add patched-fonts/Noto
./install.sh
sudo fc-cache -fv

[ "$SHELL" != "$(which zsh)" ] && chsh -s $(which zsh)
