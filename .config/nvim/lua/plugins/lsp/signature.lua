local setup, lspSignatureSetup = pcall(require, "lsp_signature")
if not setup then
  return
end

lspSignatureSetup.setup()
