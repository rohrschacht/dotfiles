#!/usr/bin/zsh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# ================================================================================
# Install essential software for the setup:
#     - zsh (already installed for this script)
#     - stow
#     - tmux
#     - alacritty
#     - eza
#     - fd
#     - ripgrep
#     - rofi (wayland)
# ================================================================================

sudo zypper install stow tmux alacritty eza fd ripgrep rofi-wayland

stow alacritty
stow ideavim
stow rofi
stow tmux

zsh ./init-oh-my-zsh.zsh

