return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function() -- import mason plugin safely
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")

    mason.setup({
      PATH = "prepend", -- skip causes errors idk why
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "cssls",
        "cucumber_language_server",
        "dockerls",
        "bashls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "tailwindcss",
        "tsserver",
        "yamlls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    })
  end,
}
