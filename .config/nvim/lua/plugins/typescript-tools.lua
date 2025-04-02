return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({})
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		keymap.set("n", "<leader>rf", ":TSToolsRenameFile<CR>", opts) -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts) -- organize imports
		keymap.set("n", "gd", ":TSToolsGoToSourceDefinition<CR>", opts) -- go to definition
		keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
		keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<CR>", opts) -- go to type definition
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
		keymap.set("n", "<leader>swd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show workplace diagnostics
		keymap.set("n", "'d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
		keymap.set("n", ";d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	end,
}
