return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = ...,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd.colorscheme "gruvbox"
      vim.cmd("highlight SignColumn guibg=NONE")
    end
  },
}
