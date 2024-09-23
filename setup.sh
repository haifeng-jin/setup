# Bash
wget https://gist.githubusercontent.com/haifeng-jin/bd7aff7f2cb4db897a6b9341bc1d9025/raw -O ~/.bashrc

# Conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc

# Git
sudo apt install git
git config --global user.name "Haifeng Jin"
git config --global user.email "haifeng-jin@users.noreply.github.com"
conda install -c conda-forge gh
gh auth login

# Docker
sudo apt update
sudo apt remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker ${USER}

# Config Vim
git clone https://github.com/haifeng-jin/vim-config.git .vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa

# Tmux
sudo apt install tmux tmuxp htop

# SSH ssh-keygen -t ed25519 -C "haifeng-jin@users.noreply.github.com"
