set nocompatible

call plug#begin('~/.vim/plugged')

  " A visual Git plugin to see what has changed in each file.
  Plug 'airblade/vim-gitgutter'

  " Colorful rainbow bracket matching.
  Plug 'luochen1990/rainbow'

  " A color scheme based on monokai.
  Plug 'tomasr/molokai'

  " Markdown plugin.
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " tmux plugin.
"  Plug 'tmux-plugins/vim-tmux'

  " Fuzzy file finder.
  Plug 'junegunn/fzf', { 'do': { ->fzf#install() } }

  Plug 'ewilazarus/preto'

  Plug 'phucngodev/mono'

  " Code completion.
"  Plug 'ycm-core/youcompleteme'

  " Syntax checking through external syntax checkers.
  Plug 'vim-syntastic/syntastic'

  " Kitty syntax highlighting
  Plug 'fladson/vim-kitty'

  Plug 'yous/vim-open-color'

  " Go language server
"  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Groovy language server
"  Plug 'GroovyLanguageServer/groovy-language-server'

  Plug 'connorholyday/vim-snazzy'

  Plug 'wadackel/vim-dogrun'

  Plug 'NLKNguyen/papercolor-theme'

  Plug 'sainnhe/sonokai'

  Plug 'sheerun/vim-polyglot'

  Plug 'panozzaj/vim-autocorrect'

  Plug 'itchyny/lightline.vim'

"  Plug 'preservim/nerdtree'

  Plug 'xuyuanp/nerdtree-git-plugin'

  Plug 'ryanoasis/vim-devicons'

  Plug 'scrooloose/nerdtree-project-plugin'

  Plug 'tpope/vim-fugitive'

"  Plug 'neovim/nvim-lspconfig'

  Plug 'hashicorp/terraform-ls'

  Plug 'hrsh7th/nvim-cmp'

  Plug 'w0rp/ale'

  Plug 'amperser/proselint'

  Plug 'z0mbix/vim-shfmt'

  Plug 'arcticicestudio/nord-vim'
call plug#end()

filetype plugin indent on

" Enable syntax highlighting.
syntax on

"if executable('terraform-ls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'terraform-ls',
"        \ 'cmd': {server_info->['terraform-ls', 'serve']},
"        \ 'whitelist': ['terraform'],
"        \ })
"endif

"if has('termguicolors')
"  set termguicolors
"endif

colorscheme sonokai
"set t_Co=256

" Turn on line numbers.
set number

" Enable intelligent indentation.
set autoindent
set smartindent

" Set backspace for certain characters.
set backspace=indent,eol,start

" Set textwidth to be 72 and visual ruler to be +1 from that.
set textwidth=80
set cc=+1

" Use spaces instead of tabs.
set tabstop=2
set shiftwidth=2
set expandtab
set breakindent

" Disable Background Color Erase (BCE) indefinitely, so that color
" schemes work properly when Vim is used inside tmux or GNU.
set t_ut=

"""
""" vim-markdown settings.
"""

" Disable folding.
let g:vim_markdown_folding_disabled = 1
" Disable concealing.
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" Fix indentation.
let g:vim_markdown_new_list_item_indent = 0
" Follow anchors.
let g:vim_markdown_follow_anchor = 1
" Do not automatically insert bullet points.
let g:vim_markdown_auto_insert_bullets = 0
" Fenced code block languages
let g:vim_markdown_fenced_languages = ['sh=sh']
" Syntax extensions
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

"""
""" vim-go settings
"""

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"""
""" vim-prettier settings
"""

" Allow auto formatting for files without @format or @prettier tag
let g:prettier#autoformat_require_pragma = 0

" Run vim-prettier also after changing text or leaving insert mode
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,
  \ *.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

" Turn on spell checking
"set spell spelllang=en_us
" Only spellcheck markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

"""
""" vim-syntastic settings
"""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_markdown_checkers = ['proselint']

"""
""" NERDTree settings
"""

" Map NERDTree find to ctrl+f
"nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree | wincmd p

" Show hidden files.
"let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
"  \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"""
""" lightline.vim
"""
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

""" ALE settings
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'markdown': ['prettier'],
  \   'python': ['prettier'],
  \   'bash': ['shfmt'],
  \   'javascript': ['eslint', 'prettier'],
  \}
