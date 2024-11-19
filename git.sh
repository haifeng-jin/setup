#!/bin/bash
# Install git
sudo apt install git

# Setup user
git config --global user.name "Haifeng Jin"
git config --global user.email "haifeng-jin@users.noreply.github.com"

# Setup SSH keys
ssh-keygen -t ed25519 -C "haifeng-jin@users.noreply.github.com"

# Install gh CLI
# Download and add the GitHub CLI GPG key
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
# Add the GitHub CLI repository    to your APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list    > /dev/null
# Update your package lists
sudo apt update
# Install the `gh` command
sudo apt install gh
gh auth login
