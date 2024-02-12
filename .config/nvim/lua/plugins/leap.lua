return {
  "ggandor/leap.nvim",

  config = function()
    vim.keymap.set({ "n", "x", "o" }, "s", function()
      local current_window = vim.fn.win_getid()
      require("leap").leap({ target_windows = { current_window } })
    end)
    require('leap').opts.safe_labels = {}
  end,
}
