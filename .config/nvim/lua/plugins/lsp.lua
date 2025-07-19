return {
  -- Mason LSP manager
  {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  -- Mason LSP Config bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "lua_ls",
          "jsonls",
          "html",
          "cssls",
          "tailwindcss",
          "ruff",
          "dockerls",
          "ts_ls",
          "yamlls",
        },
      })
    end,
  },
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              version = "LuaJIT",
            },
            diagnostics = {
              -- Make the server aware of Neovim globals
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Configure visual diagnostics
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then
            return
          end

          -- Keybindings for LSP functions
          local bufopts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
          -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
          -- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)

          if vim.bo.filetype == "lua" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end,
  },
  -- completion source
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
    },
  },
  -- Formatter
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        python = { "ruff" },
        lua = { "stylua" },
        markdown = { "marksman" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
    vim.keymap.set({ "n", "x" }, "<leader>fm", function()
      require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { desc = "Format current buffer" }),
  },
}
