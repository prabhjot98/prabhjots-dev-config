return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"nvimdev/lspsaga.nvim",
		"williamboman/mason.nvim",
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
	},
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo" },
	config = function()
		require("mason").setup()

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local keymap = vim.keymap
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
			keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
			keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<CR>", opts)
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
			keymap.set("n", "<leader>swd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
			keymap.set("n", "'d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
			keymap.set("n", ";d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		end

		-- Set up LSP servers using vim.lsp.config (Neovim 0.11+)
		local simple_servers = { "nil_ls", "marksman", "graphql", "tailwindcss", "eslint", "gdscript", "terraformls" }
		for _, server in ipairs(simple_servers) do
			vim.lsp.config(server, { capabilities = capabilities, on_attach = on_attach })
		end

		vim.lsp.config("lua_ls", {
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
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Enable all configured LSP servers
		vim.lsp.enable(simple_servers)
		vim.lsp.enable("lua_ls")

		-- Java LSP with nvim-jdtls
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				local jdtls = require("jdtls")

				local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
				local root_dir = require("jdtls.setup").find_root(root_markers)
				if root_dir == nil then
					return
				end

				local workspace_folder = vim.fn.stdpath("data")
					.. "/site/java/workspace-root/"
					.. vim.fn.fnamemodify(root_dir, ":p:h:t")

				local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

				local config = {
					cmd = {
						jdtls_path .. "/bin/jdtls",
						"-data",
						workspace_folder,
					},
					root_dir = root_dir,
					capabilities = capabilities,
					on_attach = on_attach,
				}

				jdtls.start_or_attach(config)
			end,
		})
	end,
}
