local opt = vim.opt

-- set the mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- undo persistence after closing a file
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.config/nvim/.undo//")

-- line numbers
opt.relativenumber = true -- show relative line numbers, disable this if you don't like it
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping, enable this if you really like wrapped lines

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true -- move to your search as you write it
opt.hlsearch = true -- highlight my search

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
-- turn on termguicolors for colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.numberwidth = 3

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- view settings
opt.scrolloff = 4

-- update time
opt.updatetime = 200

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.autowrite = true -- Enable auto write

opt.conceallevel = 3 -- Hide * markup for bold and italic

opt.showmode = false
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
