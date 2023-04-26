return {
	"j-hui/fidget.nvim", -- LSP status widget
	config = function()
		require("fidget").setup({
			window = {
				blend = 0,
			},
		})
	end,
}
