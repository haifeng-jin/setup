#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# Determine the directory where this script is located for relative path resolution.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Update package lists and install zsh and wget.
sudo apt-get update
sudo apt-get install -y zsh wget

# Install Oh My Zsh in unattended mode to avoid interactive prompts.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
fi

# Create custom zsh directory and install the 'pure' prompt theme.
mkdir -p "$HOME/.zsh"
if [ ! -d "$HOME/.zsh/pure" ]; then
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

# Install the zsh-autosuggestions plugin into the Oh My Zsh custom plugins folder.
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Deploy the personal .zshrc configuration file.
cp "$SCRIPT_DIR/zshrc" ~/.zshrc
