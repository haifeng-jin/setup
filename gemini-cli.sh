#!/bin/bash

# Ensure .zshrc exists so NVM has a target
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

# 1. Install NVM
echo "Installing NVM..."
export PROFILE="$HOME/.zshrc"
# We still set NVM_DIR for the installer so it knows where to go, 
# but we won't manually load it in this bash script.
export NVM_DIR="$HOME/.config/nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 2. Delegate the rest to ZSH
# This "sources" your updated .zshrc automatically and runs the installs
echo "Refreshing environment and finishing installation in ZSH..."
zsh -i -c "nvm install 20 && nvm alias default 20 && npm install @google/gemini-cli"

echo "------------------------------------------"
echo "Done! Gemini CLI is installed."

# 3. Final Interaction: Restart the shell for the user
if [[ -t 0 ]]; then
    read -p "Would you like to enter your new refreshed shell now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        exec zsh
    fi
fi

echo "To start using it, run: source ~/.zshrc"
