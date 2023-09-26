return {
	"ErikAasen-RSS/variable-logger.nvim",
	config = function()
		require("variable-logger").setup({
			prefix = "🪵 - ", -- Make the log more visibl
		})
		local logger = require("variable-logger")
		vim.keymap.set("n", "<leader>vl", logger.log_variable)
	end,
}
