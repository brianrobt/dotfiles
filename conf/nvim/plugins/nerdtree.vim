
" Map NERDTree find to ctrl+f
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Show hidden files.
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
  \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

