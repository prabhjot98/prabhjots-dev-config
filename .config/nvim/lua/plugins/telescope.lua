return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	priority = 1000,
	lazy = false,
	config = function()
		local telescopeActions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = telescopeActions.move_selection_previous, -- move to prev result
						["<C-j>"] = telescopeActions.move_selection_next, -- move to next result
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-lua/plenary.nvim" },
	},
}
