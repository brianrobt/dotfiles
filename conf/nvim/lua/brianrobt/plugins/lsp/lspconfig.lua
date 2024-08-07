return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		-- Disable virtual text
		vim.diagnostic.config({
			virtual_text = false,
		})

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local ns = vim.api.nvim_create_namespace("CurlineDiag")

		vim.opt.updatetime = 100

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"

				-- Displays virtual text for current line
				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = ev.buf,
					callback = function()
						pcall(vim.api.nvim_buf_clear_namespace, ev.buf, ns, 0, -1)
						local hi = { "Error", "Warn", "Info", "Hint" }
						local curline = vim.api.nvim_win_get_cursor(0)[1]
						local diagnostics = vim.diagnostic.get(ev.buf, { lnum = curline - 1 })
						local virt_texts = { { (" "):rep(4) } }
						for _, diag in ipairs(diagnostics) do
							virt_texts[#virt_texts + 1] = { diag.message, "Diagnostic" .. hi[diag.severity] }
						end
						vim.api.nvim_buf_set_extmark(ev.buf, ns, curline - 1, 0, {
							virt_text = virt_texts,
							hl_mode = "combine",
						})
					end,
				})

				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			-- ["yamlls"] = function()
			-- 	lspconfig["yamlls"].setup({
			--
			-- 		capabilities = capabilities,
			-- 		root_dir = lspconfig.util.find_git_ancestor,
			-- 		single_file_support = true,
			-- 		settings = {
			-- 			filetypes = {},
			-- 			redhat = { telemetry = { enabled = false } },
			-- 			yaml = {
			-- 				schemaStore = {
			-- 					enable = false,
			-- 					url = "",
			-- 				},
			-- 				schemas = require("schemastore").yaml.schemas({
			-- 					replace = {
			-- 						["Markdownlint"] = {
			-- 							description = "Markdownlint overridden",
			-- 							fileMatch = ".markdownlint.y*l",
			-- 							name = "Markdownlint",
			-- 							url = "https://raw.githubusercontent.com/DavidAnson/markdownlint/main/schema/markdownlint-config-schema.json",
			-- 						},
			-- 						-- ["Azure Pipelines"] = {
			-- 						-- 	description = "Azure Pipelines overridden",
			-- 						-- 	fileMatch = {
			-- 						-- 		"azure-pipeline*.y*l",
			-- 						-- 		"tasks/*.y*l",
			-- 						-- 		"jobs/*.y*l",
			-- 						-- 		"stages/*.y*l",
			-- 						-- 	},
			-- 						-- 	name = "Azure Pipelines",
			-- 						-- 	url = "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json",
			-- 						-- },
			-- 					},
			-- 					ignore = {
			-- 						"Azure Pipelines",
			-- 						--	"Markdownlint",
			-- 					},
			-- 				}),
			-- 				validate = { enable = true },
			-- 				completion = { enable = true },
			-- 				editor = {
			-- 					tabSize = 2,
			-- 				},
			-- 			},
			-- 		},
			-- 	})
			-- end,
			-- ["azure_pipelines_ls"] = function()
			-- 	lspconfig["azure_pipelines_ls"].setup({
			-- 		capabilities = capabilities,
			-- 		root_dir = lspconfig.util.find_git_ancestor,
			-- 		settings = {
			-- 			yaml = {
			-- 				schemaStore = {
			-- 					enable = false,
			-- 					url = "",
			-- 				},
			-- 				schemas = require("schemastore").yaml.schemas({
			-- 					replace = {
			-- 						["Azure Pipelines"] = {
			-- 							description = "Azure Pipelines overridden",
			-- 							fileMatch = {
			-- 								"/azure-pipeline*.y*l",
			-- 								"tasks/*.y*l",
			-- 								"stages/*.y*l",
			-- 								"jobs/*.y*l",
			-- 							},
			-- 							name = "Azure Pipelines",
			-- 							url = "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json",
			-- 						},
			-- 					},
			-- 				}),
			-- 			},
			-- 		},
			-- 	})
			-- end,
			["terraformls"] = function()
				lspconfig["terraformls"].setup({
					capabilities = capabilities,
				})
			end,
		})
	end,
}
