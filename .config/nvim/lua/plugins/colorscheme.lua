return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = ...,
    config = function()
      require("gruvbox").setup({
	contrast = "hard",
      })
      vim.cmd.colorscheme "gruvbox"
    end
  },
}
