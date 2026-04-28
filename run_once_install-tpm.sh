#!/bin/sh

set -eu

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  if ! command -v git >/dev/null 2>&1; then
    echo "Cannot install tmux TPM: 'git' is not available" >&2
    exit 1
  fi

  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
