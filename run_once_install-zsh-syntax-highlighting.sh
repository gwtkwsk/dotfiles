#!/bin/sh

set -eu

if ! command -v git >/dev/null 2>&1; then
  echo "Cannot install zsh-syntax-highlighting: 'git' is not available" >&2
  exit 1
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
ZSH_SYNTAX_HIGHLIGHTING_DIR="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

if [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
  mkdir -p "$(dirname "$ZSH_SYNTAX_HIGHLIGHTING_DIR")"
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_HIGHLIGHTING_DIR"
fi
