#!/bin/sh

set -eu

GHOSTTY_DIR="$HOME/.config/ghostty"
SHADERS_DIR="$GHOSTTY_DIR/shaders"

mkdir -p "$GHOSTTY_DIR"

if [ ! -d "$SHADERS_DIR" ]; then
  git clone https://github.com/sahaj-b/ghostty-cursor-shaders "$SHADERS_DIR"
fi
