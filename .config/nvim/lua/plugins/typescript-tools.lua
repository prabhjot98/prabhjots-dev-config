return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({})
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		-- TypeScript-specific keymaps (general LSP keymaps are in lsp.lua)
		keymap.set("n", "<leader>rf", ":TSToolsRenameFile<CR>", opts) -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts) -- organize imports
		keymap.set("n", "<leader>ai", ":TSToolsAddMissingImports<CR>", opts) -- add missing imports
		keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts) -- remove unused imports
		keymap.set("n", "gd", ":TSToolsGoToSourceDefinition<CR>", opts) -- go to source definition (better for TS than LSP)
	end,
}
