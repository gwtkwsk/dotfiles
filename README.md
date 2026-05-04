# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

1. Copy `.chezmoidata.yaml.example` to `.chezmoidata.yaml` and set machine-specific values such as `theme`, `git.user.name`, and `git.user.email`.
2. Install `chezmoi`.
3. Install the Bitwarden CLI as `bw`, sign in with `bw login` (or your usual SSO flow), and unlock the vault in the shell that will run chezmoi:

   ```sh
   export BW_SESSION="$(bw unlock --raw)"
   ```

4. Keep that shell unlocked while running `chezmoi apply` or `./chezmoi-apply-fast.sh`.

## Machine-specific Git identity

If you want a different Git name or email per machine, set it in the local, gitignored `.chezmoidata.yaml` file:

```yaml
git:
  user:
    name: Jane Doe
    email: jane@company.example
```

This works well for keeping a work identity on a MacBook and a personal identity on Linux or Windows. `dot_gitconfig.tmpl` reads `git.user.name` and `git.user.email` directly from `.chezmoidata.yaml`, so each machine must define its own values there.

## Bitwarden prerequisites

Some templates read secrets directly from Bitwarden. The vault must be unlocked, and the following item and attachment names must exist exactly as written:

| Bitwarden item | Required data | Used by |
| --- | --- | --- |
| `github.com gwtkwsk` | Attachments `id_github_gwtkwsk_ed25519` and `id_github_gwtkwsk_ed25519.pub` | `private_dot_ssh/private_id_github_gwtkwsk_ed25519*.tmpl` |
| `github.com grzegorzwitkowski` | Attachments `id_github_grzegorzwitkowski_ed25519` and `id_github_grzegorzwitkowski_ed25519.pub` | `private_dot_ssh/private_id_github_grzegorzwitkowski_ed25519*.tmpl` |

If any of these entries are missing, chezmoi cannot render the affected templates correctly.
