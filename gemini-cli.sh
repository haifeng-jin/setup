#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# Ensure .zshrc exists so NVM has a target to write its configuration to.
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

# Install NVM (Node Version Manager) if it's not already installed.
if [ ! -d "$HOME/.config/nvm" ]; then
    echo "Installing NVM..."
    export PROFILE="$HOME/.zshrc"
    # Set NVM_DIR to a hidden config directory.
    export NVM_DIR="$HOME/.config/nvm"
    # Download and run the official NVM installer script.
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    echo "NVM already installed. Skipping."
fi

# Delegate the installation of Node.js and Gemini CLI to ZSH.
# This ensures that the newly updated .zshrc (with NVM paths) is sourced 
# and that tools are installed in the correct environment.
echo "Refreshing environment and finishing installation in ZSH..."
zsh -i -c "nvm install 20 && nvm alias default 20 && npm install -g @google/gemini-cli"

echo "------------------------------------------"
echo "Done! Gemini CLI is installed."

# Final Interaction: Offer to switch to the new ZSH shell immediately.
if [[ -t 0 ]]; then
    read -p "Would you like to enter your new refreshed shell now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        exec zsh
    fi
fi

echo "To start using it, run: source ~/.zshrc"
