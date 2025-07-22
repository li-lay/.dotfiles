-- Formatter
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      python = {
        "ruff_fix",
        "ruff_format",
        "ruff_organize_imports", },
      lua = { "stylua" },
      markdown = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 2500,
      lsp_fallback = true,
    },
  },
  vim.keymap.set({ "n", "x" }, "<leader>fm", function()
    require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
  end, { desc = "Format current buffer" }),
}
