--[[
init.lua

Author: Brian Thompson

Neovim configuration.
]]--

----
-- Key bindings
----

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

----
-- Options
----

vim.opt.smarttab = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.cc = "80"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

----
-- Plugins
----

-- Installs lazy.nvim if it's not installed; loads it if it's installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "sainnhe/sonokai"
})

----
-- Globals
----

vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1

----
-- Commands
----

vim.cmd("colorscheme sonokai")
