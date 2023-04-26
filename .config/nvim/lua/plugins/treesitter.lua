return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"p00f/nvim-ts-rainbow",
	},
	config = function()
		require("nvim-treesitter.install").update({ with_sync = true })
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
			},
			auto_install = true,
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
