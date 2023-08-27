return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.install").update({ with_sync = true })
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"rust",
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
		})
	end,
}
