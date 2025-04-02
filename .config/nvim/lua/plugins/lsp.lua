return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"nvimdev/lspsaga.nvim",
	},
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo" },
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local keymap = vim.keymap
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
			keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to declaration
			keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<CR>", opts) -- go to type definition
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set("n", "<leader>swd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show workplace diagnostics
			keymap.set("n", "'d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", ";d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
		end

		lspconfig.nil_ls.setup({ capabilities = capabilities, on_attach = on_attach })
		lspconfig.marksman.setup({ capabilities = capabilities, on_attach = on_attach })

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.graphql.setup({ capabilities = capabilities, on_attach = on_attach })
		lspconfig.tailwindcss.setup({ capabilities = capabilities, on_attach = on_attach })

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			cmd = { "vscode-json-languageserver", "--stdio" },
			settings = {
				json = {
					validate = { enable = true },
				},
			},
			on_attach = on_attach,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
}
