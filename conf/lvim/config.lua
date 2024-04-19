-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

----
-- User plugins
----
lvim.plugins = {
  { "tpope/vim-sleuth" },
  { "tpope/vim-commentary" },
}

----
-- Vim diagnostics
----
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
})

----
-- Vim options
----
vim.opt.textwidth = 100

-- Diagnostic messages will appear as a float
vim.cmd([[au CursorHold * lua vim.diagnostic.open_float(0,{scope = "cursor"})]])

----
-- LVim builtins
----
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "java",
  "javascript",
  "json",
  "latex",
  "lua",
  "python",
  "rust",
  "typescript",
  "tsx",
  "yaml",
}

----
-- LVim options
----
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.md" }

----
-- LSP servers
----
require("lvim.lsp.manager").setup("marksman")
require("lvim.lsp.manager").setup("lua_ls")
require("lvim.lsp.manager").setup("texlab")
require("lvim.lsp.manager").setup("ltex")

----
-- Linters
----
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {

}
