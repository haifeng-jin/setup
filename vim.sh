#!/bin/bash
# Download my vim config
git clone https://github.com/haifeng-jin/vim-config.git ~/.vim

# Download the vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the plugins
vim +PlugInstall +qa
