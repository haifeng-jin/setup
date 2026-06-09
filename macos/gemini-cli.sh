#!/bin/bash
set -euo pipefail

if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

export NVM_DIR="$HOME/.nvm"

if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    echo "Installing NVM..."
    export PROFILE="$HOME/.zshrc"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    echo "NVM already installed. Skipping."
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node.js 20 and Gemini CLI..."
nvm install 20
nvm alias default 20
npm install -g @google/gemini-cli

echo "------------------------------------------"
echo "Done! Gemini CLI is installed."
echo "To start using it, run: source ~/.zshrc"
