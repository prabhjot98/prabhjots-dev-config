return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_x = { "filetype" },
        lualine_y = {},
      },
    })
  end,
}
