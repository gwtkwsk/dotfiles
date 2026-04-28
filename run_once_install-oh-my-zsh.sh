#!/bin/sh

set -eu

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  if ! command -v curl >/dev/null 2>&1; then
    echo "Cannot install Oh My Zsh: 'curl' is not available" >&2
    exit 1
  fi

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
