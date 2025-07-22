-- Python language server
return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "setup.py",
    "requirements.txt",
    "__init__.py",
    "venv",
    ".venv",
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        -- Crucially, disable Pyright's diagnostics if Ruff handles them
        -- or specify specific diagnostics to ignore if Ruff provides them.
        -- For example, to completely ignore all diagnostics from Pyright and rely solely on Ruff:
        -- ignore = { "*" },
        -- Or to be more selective, e.g., if Ruff flags unused variables:
        -- diagnosticSeverityOverrides = {
        --     reportUnusedVariable = "none",
        --     reportMissingImports = "warning", -- You might still want this from Pyright
        -- },
        -- To avoid conflicts with Ruff's formatting and import organization:
        disableOrganizeImports = true,    -- Let Ruff handle import sorting
        -- Disable diagnostics from Pyright that Ruff will provide
        reportMissingImports = "warning", -- Pyright's strength, keep this
        reportUnusedImport = "none",      -- Ruff usually handles this
        reportUndefinedVariable = "none", -- Ruff usually handles this
        -- ... and other diagnostics you want Ruff to own.
      },
    },
    pyright = {
      -- Disable Pyright's formatting capabilities if you use Ruff or another formatter
      disableFormat = true,
    },
  },
}
