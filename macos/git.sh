#!/bin/bash
set -euo pipefail

# Install git via Homebrew if not already present (Xcode CLT provides one, but brew's is newer)
if ! command -v git &> /dev/null; then
    brew install git
fi

git config --global user.name "Haifeng Jin"
git config --global user.email "haifeng-jin@users.noreply.github.com"

if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "haifeng-jin@users.noreply.github.com"
fi

if ! command -v gh &> /dev/null; then
    brew install gh
fi

if ! gh auth status &> /dev/null; then
    gh auth login
fi

gh config set editor vim
git config --global core.editor "vim"
git config --global push.autoSetupRemote true
git config --global pull.rebase true
