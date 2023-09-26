return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			layout = {
				align = "center",
			},
		})
	end,
}
