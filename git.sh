#!/bin/bash
# Enable strict mode: exit on error (-e), treat unset variables as error (-u), 
# and ensure pipeline failures are captured (-o pipefail).
set -euo pipefail

# Update package lists and install git
sudo apt-get update
sudo apt-get install -y git

# Configure global git user identity
git config --global user.name "Haifeng Jin"
git config --global user.email "haifeng-jin@users.noreply.github.com"

# Generate a new SSH key using Ed25519 algorithm if it doesn't already exist.
# This will prompt for a passphrase.
if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "haifeng-jin@users.noreply.github.com"
fi

# Install the GitHub CLI (gh) if it's not already in the system PATH
if ! command -v gh &> /dev/null; then
    # Download the GitHub CLI GPG key for package verification
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    # Add the official GitHub CLI repository to the APT sources list
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    # Refresh package lists and install the gh CLI
    sudo apt-get update
    sudo apt-get install -y gh
fi

# Check authentication status; if not logged in, trigger the interactive login flow
if ! gh auth status &> /dev/null; then
    gh auth login
fi

# Configure preferred tools and default git behaviors
gh config set editor vim
git config --global core.editor "vim"
git config --global push.autoSetupRemote true
git config --global pull.rebase true
