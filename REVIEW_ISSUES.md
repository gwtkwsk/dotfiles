# Review Issues

Use this file to track progress while addressing the repository review findings.

- [x] Make chezmoi run scripts executable
  - Files: `run_once_install-oh-my-zsh.sh`, `run_onchange_after_cleanup-gnome-keyring.sh.tmpl`, `run_onchange_after_install-yazi-packages.sh.tmpl`
  - Chezmoi run scripts must be executable, otherwise they will not run during `chezmoi apply`.

- [x] Replace hardcoded home directory paths
  - File: `dot_zshrc`
  - Replace `/home/grzegorz` path entries with `$HOME` so the dotfiles are portable across users and machines.

- [ ] Add strict error handling to run scripts
  - Files: `run_once_install-oh-my-zsh.sh`, `run_once_before_install-ghostty-cursor-shaders.sh`, `run_once_install-tpm.sh`
  - Add `set -eu` so failed commands stop the script instead of leaving partial installs.

- [ ] Quote command substitutions in gnome-keyring setup
  - File: `dot_zshrc.d/gnome-keyring.zsh`
  - Quote `eval` command substitutions to improve shell safety.

- [ ] Add a `.chezmoiversion` file
  - File: `.chezmoiversion`
  - Pin the minimum supported chezmoi version so incompatible older versions fail clearly.

- [ ] Add dependency checks before using `git` and `curl`
  - Files: `run_once_install-oh-my-zsh.sh`, `run_once_before_install-ghostty-cursor-shaders.sh`, `run_once_install-tpm.sh`
  - Check required commands are available before using them, and fail or skip with a clear message.

- [ ] Guard `ssh-add` calls with key existence checks
  - File: `dot_zshrc`
  - Check private key files exist before calling `ssh-add` to avoid silent failures on fresh systems.

- [ ] Document Bitwarden prerequisites
  - File: `README.md`
  - Document required Bitwarden CLI setup, vault unlock state, and expected item or attachment names used by templates.
