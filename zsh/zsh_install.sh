#!/bin/bash

sudo apt update
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
