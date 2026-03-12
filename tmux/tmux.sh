#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# Determine the directory where this script is located for relative path resolution.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Update package lists and install tmux.
sudo apt-get update
sudo apt-get install -y tmux

# Deploy the personal .tmux.conf configuration file.
cp "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf

# Install the Tmux Plugin Manager (TPM) if it's missing.
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Automatically download and install all plugins listed in the .tmux.conf.
~/.tmux/plugins/tpm/bin/install_plugins
