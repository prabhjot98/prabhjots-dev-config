return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			ui = {
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
		})
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
}
