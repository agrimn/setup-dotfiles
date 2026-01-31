#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

echo "🔧 Installing dotfiles from: $REPO_ROOT"
echo "📦 Backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

backup_if_exists() {
  local target="$1"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "📦 Backing up $target"
    mkdir -p "$BACKUP_DIR/$(dirname "$target")"
    mv "$target" "$BACKUP_DIR/$target"
  fi
}

install_copy() {
  local src="$1"
  local dest="$2"

  echo "➡️  Installing $dest"
  mkdir -p "$(dirname "$dest")"
  cp -r "$src" "$dest"
}

########################
# Zsh
########################

ZSHRC_SRC="$REPO_ROOT/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"

if [ -f "$ZSHRC_SRC" ]; then
  backup_if_exists "$ZSHRC_DEST"
  install_copy "$ZSHRC_SRC" "$ZSHRC_DEST"
else
  echo "⚠️  No .zshrc found in repo, skipping"
fi

########################
# Neovim
########################

NVIM_SRC="$REPO_ROOT/nvim"
NVIM_DEST="$HOME/.config/nvim"

if [ -d "$NVIM_SRC" ]; then
  backup_if_exists "$NVIM_DEST"
  install_copy "$NVIM_SRC" "$NVIM_DEST"
else
  echo "⚠️  No nvim directory found, skipping"
fi

echo
echo "✅ Dotfiles installed successfully!"
echo "📂 Backups stored at: $BACKUP_DIR"
