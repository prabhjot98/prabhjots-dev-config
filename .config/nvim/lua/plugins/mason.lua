return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"nvimdev/lspsaga.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
	},
	build = ":MasonUpdate",
	config = function()
		require("lspsaga").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"cssls",
				"cucumber_language_server",
				"dockerls",
				"bashls",
				"eslint",
				"graphql",
				"html",
				"gopls",
				"lua_ls",
				"tailwindcss",
				"yamlls",
			},
			automatic_installation = true, -- not the same as ensure_installed
		})
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- set keybinds
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

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		require("mason-lspconfig").setup_handlers({
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			["rust_analyzer"] = function() end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
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
			end,
			["graphql"] = function()
				lspconfig["graphql"].setup({})
			end,
		})
	end,
}
