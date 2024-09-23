# Install zsh
sudo apt install zsh

# Install oh-my-zsh
sudo apt install wget
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Setup theme to pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "fpath+=($HOME/.zsh/pure)" >> .zshrc
echo "autoload -U promptinit; promptinit" >> .zshrc
echo "prompt pure" >> .zshrc
