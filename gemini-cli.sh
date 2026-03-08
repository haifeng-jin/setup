#!/bin/bash

# Ensure .zshrc exists so NVM has a target
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

# 1. Install NVM specifically targeting .zshrc
echo "Installing NVM and targeting .zshrc..."
export PROFILE="$HOME/.zshrc"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 2. Load NVM into this current script session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 3. Install Node and Gemini
echo "Installing Node 20..."
nvm install 20
npm install @google/gemini-cli

echo "------------------------------------------"
echo "Done! NVM config has been added to ~/.zshrc"
echo "To start using it now, run: source ~/.zshrc"
