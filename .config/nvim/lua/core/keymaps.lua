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

keymap.set("n", "U", ":redo<CR>", opts)                           -- defualt vim keymap overrides
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)                  -- clear search highlights
keymap.set("n", "x", '"_x', opts)                                 -- delete single character without copying into register
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts) -- toggle file explorer
keymap.set("n", "<leader>w", ":w<CR>", opts)                      -- save
keymap.set("n", "<leader>x", ":x<CR>", opts)                      -- save and quit
keymap.set("n", "<leader>l", ":LazyGit<CR>", opts)                -- open lazygit

local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "Telescope",                                                      -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "Find File" },                    -- find a file in the directory you are in
      s = { "<cmd>Telescope live_grep<cr>", "Find file with string" },         -- find files with the search string in your current directory
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },               -- show recently opened files
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
}, opts)
