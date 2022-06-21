filetype plugin indent on

set termguicolors
set background=dark
"colorscheme sonokai
set t_Co=256

" Turn on line numbers.
set number

" Enable intelligent indentation.
set autoindent
set smartindent

" Set backspace for certain characters.
set backspace=indent,eol,start

" Set textwidth to be 72 and visual ruler to be +1 from that.
set cc=100

" Use spaces instead of tabs.
set tabstop=2
set shiftwidth=2
set expandtab
set breakindent

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'godlygeek/tabular'
  Plug 'airblade/vim-gitgutter'
  Plug 'andreypopp/vim-colors-plain'
  Plug 'sainnhe/sonokai'
call plug#end()

set background=dark
colorscheme sonokai
