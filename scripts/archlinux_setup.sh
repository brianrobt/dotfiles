#!/usr/bin/zsh

sudo pacman -Syu --noconfirm vim neovim base-devel curl github-cli zsh eza

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
