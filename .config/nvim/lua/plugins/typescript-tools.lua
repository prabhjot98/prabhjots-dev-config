return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>rf", ":TSToolsRenameFile<CR>", opts) -- rename file and update imports
		vim.keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts) -- organize imports
		vim.keymap.set("n", "gd", ":TSToolsGoToSourceDefinition<CR>", opts) -- go to definition
	end,
}
