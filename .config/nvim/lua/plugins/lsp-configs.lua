return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function ()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "html",
          "jdtls",
          "marksman",
          "basedpyright",
        }
      })
    end,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- html
      lspconfig.html.setup({
        capabilities = capabilities
      })
      -- css
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- c, cpp
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      -- json
      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      -- java
      lspconfig.jdtls.setup({
        capabilities = capabilities
      })
      -- python
      lspconfig.basedpyright.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
    end,
  },
}
