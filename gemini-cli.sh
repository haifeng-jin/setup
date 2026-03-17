#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# Ensure .bashrc exists so NVM has a target to write its configuration to.
if [ ! -f "$HOME/.bashrc" ]; then
    touch "$HOME/.bashrc"
fi

export NVM_DIR="$HOME/.nvm"

# Install NVM (Node Version Manager) if it's not already installed.
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    echo "Installing NVM..."
    export PROFILE="$HOME/.bashrc"
    # Download and run the official NVM installer script.
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    echo "NVM already installed. Skipping."
fi

# Load NVM into the current shell session
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js 20 and Gemini CLI
echo "Installing Node.js 20 and Gemini CLI..."
nvm install 20
nvm alias default 20
npm install -g @google/gemini-cli

echo "------------------------------------------"
echo "Done! Gemini CLI is installed."

# Final Interaction: Offer to switch to the new Bash shell immediately.
if [[ -t 0 ]]; then
    read -p "Would you like to enter your new refreshed shell now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        exec bash
    fi
fi

echo "To start using it, run: source ~/.bashrc"
