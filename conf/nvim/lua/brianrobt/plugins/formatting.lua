return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "yamlfmt" },
				markdown = { "markdownlint" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			-- formatters = {
			-- 	yamlfmt = {
			-- 		command = "/usr/local/bin/yamlfmt",
			-- 		args = { "$FILENAME" },
			-- 		stdin = false,
			-- 	},
			-- },
			format_on_save = function(bufnr)
				-- Disable autoformat on certain filetypes
				local ignore_filetypes = {}
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
