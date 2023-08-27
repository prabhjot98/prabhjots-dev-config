return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				beacon = true,
				cmp = true,
				fidget = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				lsp_saga = true,
				neotest = true,
				neotree = true,
				nvimtree = true,
				telescope = {
					enabled = true,
				},
				treesitter = true,
				mason = true,
				notify = true,
				markdown = true,
				leap = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
