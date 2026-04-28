#!/bin/sh

set -eu

GHOSTTY_DIR="$HOME/.config/ghostty"
SHADERS_DIR="$GHOSTTY_DIR/shaders"

mkdir -p "$GHOSTTY_DIR"

if [ ! -d "$SHADERS_DIR" ]; then
  if ! command -v git >/dev/null 2>&1; then
    echo "Cannot install Ghostty cursor shaders: 'git' is not available" >&2
    exit 1
  fi

  git clone https://github.com/sahaj-b/ghostty-cursor-shaders "$SHADERS_DIR"
fi
