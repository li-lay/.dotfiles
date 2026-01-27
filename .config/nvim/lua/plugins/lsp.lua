return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    -- 1. Mason setup remains necessary for PATH management
    require("mason").setup()

    -- 2. Capabilities for blink.cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- 3. Define server configurations using the new 0.11+ API
    local servers = {
      lua_ls = {},
      vtsls = {},
      basedpyright = {},
      tailwindcss = {},
      jsonls = {},
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "*.yaml",
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.yml",
              ["https://json.schemastore.org/github-action.json"] = "/.github/action.yml",
            },
          },
        },
      },
    }

    -- 4. Apply configs and Enable
    for name, config in pairs(servers) do
      config.capabilities = capabilities
      -- New 0.11 way: Set the config, then enable it
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end

    -- 5. LspAttach (Standard native logic)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Definition")
        map("gr", vim.lsp.buf.references, "References")
        map("K", vim.lsp.buf.hover, "Hover")

        -- 0.11 specific highlight logic
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight") then
          local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = group,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- 6. Clean Diagnostic Config
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded" },
      virtual_text = { spacing = 2, source = "if_many" },
    })
  end,
}
