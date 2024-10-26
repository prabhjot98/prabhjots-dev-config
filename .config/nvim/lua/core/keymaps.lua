local keymap = vim.keymap

local opts = { noremap = true, silent = true }

keymap.set("n", "<A-h>", require("smart-splits").resize_left)
keymap.set("n", "<A-j>", require("smart-splits").resize_down)
keymap.set("n", "<A-k>", require("smart-splits").resize_up)
keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

keymap.set("n", "U", ":redo<CR>", opts) -- defualt vim keymap overrides
keymap.set("n", "<leader>nh", ":nohl<CR>", opts) -- clear search highlights
keymap.set("n", "x", '"_x', opts) -- delete single character without copying into register
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts) -- toggle file explorer
keymap.set("n", "<leader>w", ":w<CR>", opts) -- save
keymap.set("n", "<leader>x", ":x<CR>", opts) -- save and quit
keymap.set("n", "<leader>l", ":LazyGit<CR>", opts) -- open lazygit

keymap.del("n", "gc")
keymap.del("n", "gb")

local wk = require("which-key")

wk.add({
	{ "<leader>f", group = "Telescope" }, -- Group for telescope commands
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find file with string" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find hidden file" },

	{ "<leader>g", group = "Git" }, -- Group for git commands
	{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },

	{ "<leader>s", group = "Splits" }, -- Group for window split commands
	{ "<leader>sv", "<C-w>v", desc = "Split window vertically" },
	{ "<leader>sh", "<C-w>s", desc = "Split window horizontally" },
	{ "<leader>se", "<C-w>=", desc = "Make split windows equal width & height" },
	{ "<leader>sx", ":close<CR>", desc = "Close current split window" },
	{ "<leader>sm", ":MaximizerToggle<CR>", desc = "Toggle split window maximization" },
	{ "<leader>ss", "<cmd>Telescope spell_suggest<cr>", desc = "Spell Check" },

	{ "<leader>t", group = "Tab Management" }, -- Group for tab commands
	{ "<leader>to", ":tabnew<CR>", desc = "Open new tab" },
	{ "<leader>tx", ":tabclose<CR>", desc = "Close current tab" },
	{ "<leader>tn", ":tabn<CR>", desc = "Go to next tab" },
	{ "<leader>tp", ":tabp<CR>", desc = "Go to previous tab" },

	{ "<leader>d", group = "Diffview" }, -- Group for Diffview commands
	{ "<leader>do", ":DiffviewOpen<CR>", desc = "Diffview Open" },
	{ "<leader>dc", ":DiffviewClose<CR>", desc = "Diffview Close" },
	{ "<leader>dh", ":DiffviewFileHistory<CR>", desc = "Diffview view file history" },
	{ "<leader>dr", ":DiffviewRefresh<CR>", desc = "Diffview refresh" },
}, opts)
