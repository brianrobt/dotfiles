return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = {
        enable = true,
      },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gpg",
        "groovy",
        "helm",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "kusto",
        "latex",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "properties",
        "python",
        "regex",
        "rst",
        "ruby",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "terraform",
        "tmux",
        "toml",
        "typescript",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
