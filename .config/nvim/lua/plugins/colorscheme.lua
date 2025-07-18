return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = ...,
    event = 'VeryLazy',
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd.colorscheme "gruvbox"
      vim.cmd("highlight SignColumn guibg=NONE")
    end
  },
}
