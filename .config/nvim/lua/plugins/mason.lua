return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "nvimdev/lspsaga.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim",
    "simrat39/rust-tools.nvim",
  },
  build = ":MasonUpdate",
  config = function()
    require("lspsaga").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "cucumber_language_server",
        "dockerls",
        "bashls",
        "eslint",
        "graphql",
        "html",
        "gopls",
        "lua_ls",
        "tailwindcss",
        "tsserver",
        "yamlls",
      },
      automatic_installation = true, -- not the same as ensure_installed
    })
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }
      -- set keybinds
      keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)                              -- show definition, references
      keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)                     -- go to declaration
      keymap.set("n", "gtd", "<cmd>Lspsaga goto_type_definition<CR>", opts)               -- go to type definition
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)                 -- see available code actions
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                      -- smart rename
      keymap.set("n", "<leader>swd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show workplace diagnostics
      keymap.set("n", "'d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)                -- jump to previous diagnostic in buffer
      keymap.set("n", ";d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)                -- jump to next diagnostic in buffer
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                            -- show documentation for what is under cursor
    end

    local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end


    require("mason-lspconfig").setup_handlers {
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end,
      ["rust_analyzer"] = function()
        require("rust-tools").setup({
          server = {
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
              vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.rs",
                callback = function()
                  vim.lsp.buf.format({ timeout_ms = 200 })
                end,
                group = format_sync_grp,
              })
              local rt = require("rust-tools")
              -- Hover actions
              vim.keymap.set("n", "<leader>asd", rt.hover_actions.hover_actions, { buffer = bufnr })
              -- Code action groups
              vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy",
                },
              },
              codeActionOnSave = {
                enable = true,
                mode = "all",
              },
            },
          },
          tools = {
            inlay_hints = {
              auto = true,
            },
          },
          capabilities = capabilities,
        })
      end,
      ["tsserver"] = function()
        require("typescript-tools").setup({
          settings = {
            tsserver_file_preferences = {
              includeInlayParameterNameHints = "all",
              includeCompletionsForModuleExports = true,
              quotePreference = "auto",
            },
            tsserver_format_options = {
              allowIncompleteCompletions = false,
              allowRenameOfImportPath = false,
            },
          },
        })
        local opts = { noremap = true, silent = true }
        keymap.set("n", "<leader>rf", ":TSToolsRenameFile<CR>", opts)          -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TSToolsSortImports<CR>", opts)         -- organize imports
        keymap.set("n", "<leader>ru", ":TSToolsRemoveUnusedImports<CR>", opts) -- remove unused variables
        keymap.set("n", "gd", ":TSToolsGoToSourceDefinition<CR>", opts)        -- go to definition
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })
      end,
      ["gopls"] = function()
        lspconfig["gopls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = util.root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              completeUnimported = true,
              analyses = {
                unusedparams = true,
              },
            },
          },
        })
      end,
      ["prettierd"] = function()
        lspconfig["prettierd"].setup({})
      end
    }
  end,
}
