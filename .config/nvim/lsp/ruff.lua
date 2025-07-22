return {
  cmd = { "ruff-lsp" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "ruff.toml",
    ".ruff_cache",
    "setup.py",
    "requirements.txt",
    "__init__.py",
    "venv",
    ".venv",

  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  init_options = {},
  on_attach = function(client, bufnr)
    if client.name == 'ruff_lsp' then
      -- Disable capabilities in Ruff that Pyright will provide.
      -- This avoids duplicate or conflicting information.
      client.server_capabilities.hoverProvider = false -- Pyright usually provides better hover
      client.server_capabilities.definitionProvider = false
      client.server_capabilities.typeDefinitionProvider = false
      client.server_capabilities.implementationProvider = false
      client.server_capabilities.referencesProvider = false
      client.server_capabilities.documentSymbolProvider = false
      client.server_capabilities.workspaceSymbolProvider = false
      client.server_capabilities.codeLensProvider = false
      client.server_capabilities.completionProvider = false -- Pyright provides more comprehensive completions

      -- Ensure Ruff *does* provide formatting and diagnostics
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
      -- If you want Ruff to handle ALL diagnostics:
      -- client.server_capabilities.diagnosticProvider = {
      --     interFileDependencies = false,
      --     workspaceDiagnostics = true,
      -- }
    end
  end,
}
