#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

echo "🔧 Installing dotfiles from: $REPO_ROOT"
echo "📦 Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

backup_if_exists() {
  local target="$1"
  local filename="$(basename "$target")"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "📦 Backing up $target"
    mv "$target" "$BACKUP_DIR/$filename"
  fi
}

install_copy() {
  local src="$1"
  local dest="$2"

  echo "➡️  Installing $dest"
  mkdir -p "$(dirname "$dest")"
  cp -r "$src" "$dest"
}

ask_install() {
  local name="$1"
  read -p "Install $name? (y/n): " -n 1 -r
  echo
  [[ $REPLY =~ ^[Yy]$ ]]
}

########################
# Zsh
########################

if ask_install "Zsh (.zshrc)"; then
  ZSHRC_SRC="$REPO_ROOT/.zshrc"
  ZSHRC_DEST="$HOME/.zshrc"

  if [ -f "$ZSHRC_SRC" ]; then
    backup_if_exists "$ZSHRC_DEST"
    install_copy "$ZSHRC_SRC" "$ZSHRC_DEST"
  else
    echo "⚠️  No .zshrc found in repo, skipping"
  fi
fi

########################
# Neovim
########################

if ask_install "Neovim config"; then
  NVIM_SRC="$REPO_ROOT/nvim"
  NVIM_DEST="$HOME/.config/nvim"

  if [ -d "$NVIM_SRC" ]; then
    backup_if_exists "$NVIM_DEST"
    install_copy "$NVIM_SRC" "$NVIM_DEST"
  else
    echo "⚠️  No nvim directory found, skipping"
  fi
fi

########################
# Tmux
########################

if ask_install "Tmux (.tmux.conf)"; then
  TMUX_SRC="$REPO_ROOT/tmux.conf"
  TMUX_DEST="$HOME/.tmux.conf"

  if [ -f "$TMUX_SRC" ]; then
    backup_if_exists "$TMUX_DEST"
    install_copy "$TMUX_SRC" "$TMUX_DEST"
  else
    echo "⚠️  No tmux.conf found in repo, skipping"
  fi
fi

echo
echo "✅ Dotfiles installed successfully!"
echo "📂 Backups stored at: $BACKUP_DIR"
