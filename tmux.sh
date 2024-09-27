# Install tmux
sudo apt install tmux

# Copy the config
cp tmux.conf ~/.tmux.conf

# Install the TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install the plugins
~/.tmux/plugins/tpm/bin/install_plugins
