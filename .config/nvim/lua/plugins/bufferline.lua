return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				show_buffer_close_icons = false,
				show_close_icon = false,
				mode = "tabs",
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
