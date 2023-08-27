local keymap = vim.keymap

keymap.set("n", "U", ":redo<CR>") -- defualt vim keymap overrides
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
keymap.set("n", "x", '"_x') -- delete single character without copying into register
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>w", ":w<CR>") -- save
keymap.set("n", "<leader>x", ":x<CR>") -- save and quit
keymap.set("n", "<leader>l", ":LazyGit<CR>") -- save and quit

local wk = require("which-key")

wk.register({
	["<leader>"] = {
		f = {
			name = "Telescope", -- optional group name
			f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- find a file in the directory you are in
			s = { "<cmd>Telescope live_grep<cr>", "Find file with string" }, -- find files with the search string in your current directory
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- show recently opened files
			h = { "<cmd>Telescope find_files hidden=true<cr>", "Find hidden file" }, -- find a hidden file
		},
		{
			g = {
				name = "Git",
				s = { "<cmd>Telescope git_status<cr>", "Git Status" },
				b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
			},
		},
		{
			s = {
				name = "",
				v = { "<C-w>v", "split window vertically" },
				h = { "<C-w>s", "split window horizontally" },
				e = { "<C-w>=", "make split windows equal width & height" },
				x = { ":close<CR>", "close current split window" },
				m = { ":MaximizerToggle<CR>", "toggle split window maximization" },
				s = { "<cmd>Telescope spell_suggest<cr>", "Spell Check" },
			},
		},
		{
			t = {
				name = "Tab managment",
				o = { ":tabnew<CR>", "open new tab" },
				x = { ":tabclose<CR>", "close current tab" },
				n = { ":tabn<CR>", " go to next tab" },
				p = { ":tabp<CR>", " go to previous tab" },
			},
		},
		{
			d = {
				name = "Diffview",
				o = { ":DiffviewOpen<CR>", "Diffview Open" },
				c = { ":DiffviewClose<CR>", "Diffview Close" },
				h = { ":DiffviewFileHistory<CR>", "Diffview view file history" },
				r = { ":DiffviewRefresh<CR>", "Diffview refresh" },
			},
		},
	},
})
