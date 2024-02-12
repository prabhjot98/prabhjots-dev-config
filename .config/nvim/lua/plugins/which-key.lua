return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			window = {
				position = "bottom",
				winblend = 1,
			},
			layout = {
				align = "center",
			},
		})
	end,
}
