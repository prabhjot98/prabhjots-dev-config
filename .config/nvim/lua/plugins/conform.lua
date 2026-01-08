return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "eslint_d", "prettierd" },
				javascriptreact = { "eslint_d", "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "biome" },
				html = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
				yaml = { "prettierd" },
				markdown = { "markdownlint" },
				graphql = { "biome" },
				handlebars = { "prettierd" },
				lua = { "stylua" },
				nix = { "alejandra" },
				gdscript = { "gdformat" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
