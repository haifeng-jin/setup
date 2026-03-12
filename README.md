# Linux Setup Scripts

A collection of scripts to automate the setup of a new Linux environment.

## Usage

Each script is independent and can be run separately:

- `bash git.sh`: Installs Git and GitHub CLI, configures user identity and SSH keys.
- `bash conda.sh`: Installs Miniconda and initializes it for Bash and Zsh.
- `bash vim.sh`: Sets up a custom Vim configuration with a plugin manager.
- `bash zsh/zsh.sh`: Installs Zsh, Oh My Zsh, Pure theme, and essential plugins.
- `bash tmux/tmux.sh`: Installs Tmux and the Tmux Plugin Manager (TPM).
- `bash gemini-cli.sh`: Installs NVM, Node.js, and the Gemini CLI.

## Design Principles

- **Idempotency**: All scripts can be safely run multiple times without causing side effects or errors.
- **Strict Mode**: Scripts use `set -euo pipefail` for better error handling and reliability.
- **Non-Interactive (where possible)**: Installations are automated to minimize manual input, though some steps like SSH key generation or GitHub authentication may still require interaction.
