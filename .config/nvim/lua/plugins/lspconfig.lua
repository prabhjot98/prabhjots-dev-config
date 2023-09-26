return {
	"neovim/nvim-lspconfig", -- easily configure language servers
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
		"onsails/lspkind.nvim",
		"simrat39/rust-tools.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local typescript = require("typescript")
		local rt = require("rust-tools")

		local keymap = vim.keymap

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
			keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to declaration
			keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<CR>", opts) -- go to type definition
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set("n", "<leader>swd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show workplace diagnostics
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

			-- typescript specific keymaps (e.g. rename file and update imports)
			if client.name == "tsserver" then
				keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
				keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
				keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
				keymap.set("n", "gd", ":TypescriptGoToSourceDefinition<CR>") -- go to definition
			end

			if client.name == "rust_analyzer" then
				local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = "*.rs",
					callback = function()
						vim.lsp.buf.format({ timeout_ms = 200 })
					end,
					group = format_sync_grp,
				})
				-- Hover actions
				vim.keymap.set("n", "<leader>asd", rt.hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			end
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure rust server
		rt.setup({
			server = {
				on_attach = on_attach,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
					codeActionOnSave = {
						enable = true,
						mode = "all",
					},
				},
			},
			tools = {
				inlay_hints = {
					auto = false,
				},
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		typescript.setup({
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
			},
		})

		lspconfig["eslint"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				codeActionOnSave = {
					enable = true,
					mode = "all",
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- config go server
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		-- configure lua server (with special settings)
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
}
