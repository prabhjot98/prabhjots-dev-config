local setup, dashboard = pcall(require, "dashboard-nvim")
if not setup then
  return
end

dashboard.setup({})
