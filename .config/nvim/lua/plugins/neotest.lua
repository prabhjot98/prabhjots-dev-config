return {
  "nvim-neotest/neotest", -- interacting with tests
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-vim-test",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          dap = { justMyCode = false },
          jestCommand = "jest --watch ",
        }),
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" },
        }),
      },
    })
  end,
  lazy = true,
}
