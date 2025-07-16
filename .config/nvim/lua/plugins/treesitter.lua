return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = { "javascript", "typescript", "tsx", "json", "css", "html", "yaml", "lua", "dockerfile", "gitignore", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      auto_install = false,
    })
  end
}
