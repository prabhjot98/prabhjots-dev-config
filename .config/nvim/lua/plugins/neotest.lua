local neotest_setup, neotest = pcall(require, "neotest")
if not neotest_setup then
  return
end

local neotestJest_setup, neotestJest = pcall(require, "neotest-jest")
if not neotestJest_setup then
  return
end

local neotestVimTest_setup, neotestVimTest = pcall(require, "neotest-vim-test")
if not neotestVimTest_setup then
  return
end

local neotestPlenary_setup, neotestPlenary = pcall(require, "neotest-plenary")
if not neotestPlenary_setup then
  return
end

neotest.setup({
  adapters = {
    neotestJest({
      dap = { justMyCode = false },
    }),
    neotestPlenary,
    neotestVimTest({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
