return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = ...,
    config = function()
      require("gruvbox").setup({
        palette_overrides = {
          dark0 = "#1f1f1f", -- override background
        },
        overrides = {
          SignColumn = { bg = "#1f1f1f" },
        },
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
