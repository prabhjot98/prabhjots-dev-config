return {
	"prabhjot98/rekt",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>ot", "<cmd>lua require('rekt').open_test_file()<CR>")
	end,
}
