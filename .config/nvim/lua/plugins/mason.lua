return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	build = ":MasonUpdate",
	config = function()
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
				"jsonls",
				"lua_ls",
				"tailwindcss",
				"tsserver",
				"yamlls",
			},
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
