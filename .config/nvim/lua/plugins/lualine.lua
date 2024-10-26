return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "|",
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" } },
				},
				lualine_b = { "diagnostics" },
				lualine_c = {},
				lualine_x = {
					"searchcount",
					{
						function() -- this is for displaying the macro you are recording
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end -- not recording
							return "recording to " .. reg
						end,
					},
				},
				lualine_y = { { "location", separator = { left = "" } } },
				lualine_z = { { "filename", separator = { right = "" } } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "fzf", "lazy", "mason", "nvim-tree", "trouble", "man", "quickfix" },
		})
	end,
}
