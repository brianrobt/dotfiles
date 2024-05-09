# dotfiles

Collection of my dotfiles, redacted where necessary.

## Overview

This is a collection of the configuration files that I use on my personal development PC. I haven't
made any major updates to this repository in awhile, and am going to be updating it to add a couple
of new features, such as:

- Garuda Linux bootstrap script
- Debian bootstrap script (rework)
- Integration testing for the above bootstrap scripts

## Files

- conf
  - **[.vimrc](./conf/vimrc)**: Basic Vim config with a few useful plugins
  - **[.zshenv](./conf/zshenv)**: Zsh environment variables
  - **[.zshrc](./conf/zshrc)**: Main Zsh config file
  - **[lvim/config.lua](./conf/lvim/config.lua)**: My user config for [LunarVim](https://www.lunarvim.org/)
  - **[nvim/init.lua](./conf/nvim/init.lua)**: Basic NeoVim config with a few plugins
  - **[kitty.conf](./conf/kitty.conf)**: My config for [kitty](https://github.com/kovidgoyal/kitty) terminal
  - **[.gitconfig](./conf/gitconfig)**: My Git configuration
- utils
  - **[apg.sh](./utils/apg.sh)**: Shortcut to generate a randomized password with apg
  - **[findext.sh](./utils/findext.sh)**: Print occurrences of file extensions in a given directory,
    sorted by number of occurrences from greatest to least
  - **[findr.sh](./utils/findr.sh)**: Prints the path of a random Markdown file in the current directory
  - **[git-tree.sh](./utils/git-tree.sh)**: Prints commit history in a more human-readable format
  - **[git-update-repos.sh](/utils/git-update-repos.sh)**: Updates all local Git repositories in $HOME/workspace
- scripts
  - **[debian_setup.sh](./scripts/debian_setup.sh)** _(Unstable)_: Debian development environment
    configuration script (needs to be rewritten; use at your own risk)
  - **[plug_install.sh](./scripts/plug_install.sh)**: Installs [vim-plug](https://github.com/junegunn/vim-plug)
