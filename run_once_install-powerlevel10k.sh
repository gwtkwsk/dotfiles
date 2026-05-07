#!/bin/sh

set -eu

if ! command -v git >/dev/null 2>&1; then
  echo "Cannot install Powerlevel10k: 'git' is not available" >&2
  exit 1
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
POWERLEVEL10K_DIR="$ZSH_CUSTOM/themes/powerlevel10k"

if [ ! -d "$POWERLEVEL10K_DIR" ]; then
  mkdir -p "$(dirname "$POWERLEVEL10K_DIR")"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_DIR"
fi
