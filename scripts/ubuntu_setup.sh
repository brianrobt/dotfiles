#!/bin/bash

echo "Upgrading system..."
sudo apt update
sudo apt upgrade -y

echo "Installing git..."
sudo apt install -y git
#ln .gitconfig ~/.gitconfig
#sudo ln git-tree.sh /usr/local/bin/git-tree
#sudo ln git_update_repos.sh /usr/local/bin/gitrup

echo "Installing lscolors..."
mkdir -p ~/.local/share
ln LSCOLORS.sh ~/.local/share/lscolors.sh

echo "Installing zsh..."
sudo apt install -y zsh
ln ../conf/zshrc ~/.zshrc

echo "Installing curl..."
sudo apt install -y curl

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

source ~/.bashrc
source ~/.bash_profile

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing kitty..."
sudo apt install -y kitty
mkdir -p ~/.config/kitty
ln ../conf/kitty.conf ~/.config/kitty

echo "Installing AstroVim dependencies..."
echo "Installing neovim..."
sudo apt install -y neovim

echo "Installing Node and npm..."
nvm install 22.11.0

echo "Installing tree-sitter..."
npm install tree-sitter-cli

echo "Installing xsel..."
sudo apt install -y xsel

echo "Installing Hack Nerd Font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip -d Hack Hack.zip
mkdir -p ~/.local/share/fonts
mv Hack/*.ttf ~/.local/share/fonts
sudo fc-cache -fv
rm -rf Hack

echo "Done installing AstroVim dependencies!"

echo "Installing AstroVim optional dependencies..."
echo "Installing ripgrep"
sudo apt install -y ripgrep

echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

echo "Installing go DiskUsage()..."
curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
chmod +x gdu_linux_amd64
mv gdu_linux_amd64 /usr/bin/gdu

echo "Installing bottom..."
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_amd64.deb
sudo dpkg -i bottom_0.10.2-1_amd64.deb

echo "Done installing AstroVim optional dependencies!"

echo "Installing AstroVim..."
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim

