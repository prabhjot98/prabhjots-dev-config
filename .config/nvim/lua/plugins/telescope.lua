return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	config = function()
		local telescopeActions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = telescopeActions.move_selection_previous, -- move to prev result
						["<C-j>"] = telescopeActions.move_selection_next, -- move to next result
						["<C-q>"] = telescopeActions.send_selected_to_qflist + telescopeActions.open_qflist, -- send selected to quickfixlist
					},
				},
				layout_config = { height = 0.9, width = 0.9 },
			},
		})
		telescope.load_extension("fzf")
	end,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{ "nvim-lua/plenary.nvim" },
	},
}
