return {
  "folke/tokyonight.nvim", -- preferred colorscheme
  lazy = false,
  priority = 999,
  config = function()
    require("tokyonight").setup({
      style = "night",
      lualine_bold = true,
    })
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}
