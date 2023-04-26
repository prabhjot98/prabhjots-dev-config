local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("lazy").setup(
	"plugins",
	{ ui = { border = "rounded", size = { width = 0.5, height = 0.7 } }, defaults = {
		lazy = false,
	} }
)
require("core.keymaps")
