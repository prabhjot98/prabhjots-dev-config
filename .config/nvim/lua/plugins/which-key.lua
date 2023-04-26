return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			window = {
				position = "bottom",
				winblend = 10,
			},
			layout = {
				align = "center",
			},
		})
	end,
}
