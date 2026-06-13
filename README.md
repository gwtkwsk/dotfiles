# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

1. Copy `.chezmoidata.yaml.example` to `.chezmoidata.yaml` and set machine-specific values such as `theme`, `prompt_engine`, `git.user.name`, and `git.user.email`.
2. Install `chezmoi`.
3. Manually create any SSH keys you want to use on this machine.
4. Run `chezmoi apply` or `./chezmoi-apply-fast.sh`.

## Machine-specific Git identity

If you want a different Git name or email per machine, set it in the local, gitignored `.chezmoidata.yaml` file:

```yaml
git:
  user:
    name: Jane Doe
    email: jane@company.example
```

This works well for keeping a work identity on a MacBook and a personal identity on Linux or Windows. `dot_gitconfig.tmpl` reads `git.user.name` and `git.user.email` directly from `.chezmoidata.yaml`, so each machine must define its own values there.

## Machine-specific prompt engine

Set the shell prompt renderer in the local, gitignored `.chezmoidata.yaml` file:

```yaml
prompt_engine: starship
starship_preset: catppuccin-powerline
```

Supported values are `powerlevel10k`, `starship`, and `none`. `none` disables external prompt engines and falls back to the default Oh My Zsh theme. `dot_zshrc.tmpl` reads this value from `.chezmoidata.yaml` when rendering the shell config.

Powerlevel10k is installed automatically by `run_once_install-powerlevel10k.sh` into `${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`. Add and maintain your own `~/.p10k.zsh` separately if you use `prompt_engine: powerlevel10k`.

When `prompt_engine: starship` is enabled, choose a Starship config with `starship_preset`. Supported values are `theme`, `catppuccin-powerline`, and `nerd-font-symbols`. The `theme` value keeps the preset attached to the selected `theme`; `nerd-font-symbols` preserves the existing symbol-only preset. Set `starship_palette` to override the palette used by presets that define Catppuccin palettes.

`zsh-autosuggestions` and `zsh-syntax-highlighting` are installed as Oh My Zsh custom plugins by `run_once_install-zsh-autosuggestions.sh` and `run_once_install-zsh-syntax-highlighting.sh` into `${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/`. `dot_zshrc.tmpl` enables them via the `plugins=(...)` array, so no system package or per-OS path is required.

## WezTerm on WSL

If `.chezmoidata.yaml` sets `is_wsl: true`, set `windows_home` to your Windows home directory, for example `/mnt/c/Users/YourWindowsUser`. `chezmoi apply` then renders the repo's WezTerm config to `{{ windows_home }}/.wezterm.lua` instead of `~/.wezterm.lua`, keeps the Windows-side entrypoint, and starts in the `WSL:FedoraLinux-44` domain while still using the repo's theme preset.

## SSH keys

This repo does not create or retrieve SSH keys. Create the key files manually before adding their names to `.chezmoidata.yaml`.

Simple entries derive the SSH host alias, clone helper alias, and private key path from `name`:

| `.chezmoidata.yaml` value | Private key path | SSH host alias | Clone helper |
| --- | --- | --- | --- |
| `account_a` | `~/.ssh/id_account_a_ed25519` | `github.com_account_a` | `gitcl_account_a` |

For example:

```sh
ssh-keygen -t ed25519 -f ~/.ssh/id_account_a_ed25519 -C "account-a"
```

```yaml
ssh_keys:
  - account_a
  - name: account_b
    identity_file: ~/.ssh/id_account_b_ed25519
    host: github.com_account_b
    hostname: github.com
    user: git
    clone_alias: gitcl_account_b
```
