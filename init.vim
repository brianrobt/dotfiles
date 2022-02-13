set nocompatible

call plug#begin('~/.vim/plugged')
  Plug 'sainnhe/sonokai'
  Plug 'preservim/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'glacambre/firenvim'
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

"""
""" nvim-cmp settings
"""
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
EOF

"""
""" nvim-lspconfig setup
"""

" Add pyright for python
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

lua << EOF
require'lspconfig'.ansiblels.setup{}
EOF

lua << EOF
require'lspconfig'.bashls.setup{}
EOF

lua << EOF
require'lspconfig'.clangd.setup{}
EOF

if executable('cmake-language-server')
  au User lsp_setup call lsp#register_server({
  \ 'name': 'cmake',
  \ 'cmd': {server_info->['cmake-language-server']},
  \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'build/'))},
  \ 'whitelist': ['cmake'],
  \ 'initialization_options': {
  \   'buildDirectory': 'build',
  \ }
  \})
endif

lua << EOF
require'lspconfig'.cssls.setup{}
EOF

lua << EOF
require'lspconfig'.dockerls.setup{}
EOF

lua << EOF
require'lspconfig'.eslint.setup{}
EOF

lua << EOF
require'lspconfig'.gopls.setup{}
EOF

lua << EOF
require'lspconfig'.groovyls.setup{
  cmd = { "java", "-jar", "/home/brian/workspace/groovy-language-server/build/libs/groovy-language-server-all.jar"}
}
EOF

lua << EOF
require'lspconfig'.java_language_server.setup{
  cmd = {"/usr/bin/bash", "/home/brian/workspace/java-language-server/dist/lang_server_linux.sh"}
}
EOF

lua << EOF
require'lspconfig'.jsonls.setup{}
EOF
lua << EOF
require'lspconfig'.kotlin_language_server.setup{
  cmd = {"/home/brian/workspace/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"}
}
EOF

lua << EOF
require'lspconfig'.rls.setup{
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}
EOF

lua << EOF
require'lspconfig'.rls.setup{}
EOF

lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

lua << EOF
require'lspconfig'.stylelint_lsp.setup{}
EOF

lua << EOF
require'lspconfig'.terraformls.setup{}
EOF

lua << EOF
require'lspconfig'.texlab.setup{}
EOF

lua << EOF
require'lspconfig'.tsserver.setup{}
EOF

lua << EOF
require'lspconfig'.vimls.setup{}
EOF

lua << EOF
require'lspconfig'.yamlls.setup{}
EOF

"""
""" NERDTree settings
"""

" Map NERDTree find to ctrl+f
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Show hidden files.
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
  \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"""
""" Prettier settings
"""
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1

"""
""" Misc
"""

" Trim trailing whitespace
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

autocmd BufWritePre * call TrimWhitespace()

