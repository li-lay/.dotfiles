return {
  cmd = {
    "typescript-language-server",
    "--stdio",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
  },
  root_markers = {
    ".git",
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
