#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh is pre-installed on macOS; just ensure it's the default shell
if [ "$SHELL" != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

mkdir -p "$HOME/.zsh"
if [ ! -d "$HOME/.zsh/pure" ]; then
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

cp "$SCRIPT_DIR/../../zsh/zshrc" ~/.zshrc
