local keymap = vim.keymap

keymap.set("n", "U", ":redo<CR>") -- defualt vim keymap overrides
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
keymap.set("n", "x", '"_x') -- delete single character without copying into register
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>w", ":w<CR>") -- save
keymap.set("n", "<leader>x", ":x<CR>") -- save and quit

local wk = require("which-key")

wk.register({
	["<leader>"] = {
		f = {
			name = "Telescope", -- optional group name
			f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- find a file in the directory you are in
			s = { "<cmd>Telescope live_grep<cr>", "Find file with string" }, -- find files with the search string in your current directory
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- show recently opened files
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
				name = "Screen managment",
				v = { "<C-w>v", "split window vertically" },
				h = { "<C-w>s", "split window horizontally" },
				e = { "<C-w>=", "make split windows equal width & height" },
				x = { ":close<CR>", "close current split window" },
				m = { ":MaximizerToggle<CR>", "toggle split window maximization" },
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
			n = {
				name = "Neotest",
				f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test the entire file" },
				s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Display the test summary panel" },
				n = { "<cmd>lua require('neotest').run.run()<cr>", "Test the nearest test" },
			},
		},
	},
})
