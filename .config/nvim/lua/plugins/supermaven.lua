return {
  "supermaven-inc/supermaven-nvim",
  opts = {},
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-h>",
      },
      ignore_filetypes = { }, -- or { "cpp", }
      color = {
        suggestion_color = "#666666",
        cterm = 244,
      },
      log_level = "info",             -- set to "off" to disable logging completely
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false,        -- disables built in keymaps for more manual control
      condition = function()
        return false
      end,
    })
  end,
}
