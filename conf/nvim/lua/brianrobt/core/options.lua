vim.cmd "let g:netrw_liststyle = 3"

local opt = vim.opt

--opt.relativenumber = true
opt.number = true
opt.colorcolumn = "100"

-- tabs && indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
--opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- Custom filetypes

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = ".yamlfmt",
  command = "set filetype=yaml",
})

-- vim.api.nvim_create_autocmd("BufWrite", {
-- 	command = "FileType python yaml setlocal shiftwidth=2 softtabstop=2 expandtab autoindent",
-- })

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for certain colorschemes to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace to indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
