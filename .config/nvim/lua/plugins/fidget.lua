local setup, fidgetSetup = pcall(require, "fidget")
if not setup then
  return
end

fidgetSetup.setup()
