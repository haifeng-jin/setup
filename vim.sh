#!/bin/bash
# Enable strict mode: exit on error, handle unset variables, and capture pipe failures.
set -euo pipefail

# Download personal vim configuration. 
# If ~/.vim exists but isn't a git repository, remove it and clone fresh.
if [ ! -d ~/.vim/.git ]; then
    rm -rf ~/.vim
    git clone https://github.com/haifeng-jin/vim-config.git ~/.vim
fi

# Download the vim-plug plugin manager if it's missing.
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Run vim in non-interactive mode to install all plugins defined in the config.
vim +PlugInstall +qa
