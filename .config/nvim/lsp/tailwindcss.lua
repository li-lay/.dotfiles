return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "rescript",
    "eruby",
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.cjs",
    "package.json",
    ".git",
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    tailwindcss = {
      classAttributes = {
        "class", "className", "classList", "ngClass",
        -- Add other attributes your framework uses, e.g., for Vue:
        -- "v-bind:class", ":class"
      },
      includeLanguages = {
        typescript = "javascript",
        typescriptreact = "javascriptreact",
        javascript = "javascript",
        javascriptreact = "javascriptreact",
        html = "html",
        css = "css",
        vue = "html",
        svelte = "html",
        rescript = "html",
        eruby = "html",
      },
      -- Optional: Configure linting for Tailwind CSS
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
      },
    },
  },
}
