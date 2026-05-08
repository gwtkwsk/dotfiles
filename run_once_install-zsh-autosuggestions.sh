#!/bin/sh

set -eu

if ! command -v git >/dev/null 2>&1; then
  echo "Cannot install zsh-autosuggestions: 'git' is not available" >&2
  exit 1
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"

if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
  mkdir -p "$(dirname "$ZSH_AUTOSUGGESTIONS_DIR")"
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_AUTOSUGGESTIONS_DIR"
fi
