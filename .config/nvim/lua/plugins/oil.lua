return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  event = 'VeryLazy',
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
