#!/usr/bin/env bash
set -euo pipefail

home_dir="${HOME:?HOME is not set}"

# Add absolute paths or directory prefixes to skip in apply.
exclude_paths=(
  "$home_dir/.gitconfig"
  "$home_dir/.ssh"
)

declare -a targets=()

while IFS= read -r target; do
  skip_target=0

  for excluded in "${exclude_paths[@]}"; do
    case "$target" in
      "$excluded" | "$excluded/"*)
        skip_target=1
        break
        ;;
    esac
  done

  if [ "$skip_target" -eq 1 ]; then
    continue
  fi

  targets+=("$target")
done < <(chezmoi managed --path-style absolute)

if [ "${#targets[@]}" -eq 0 ]; then
  echo "No managed targets to apply after exclusions."
  exit 0
fi

chezmoi apply "$@" -- "${targets[@]}"
