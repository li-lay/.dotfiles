return {
  "supermaven-inc/supermaven-nvim",
  opts = function()
    require("supermaven-nvim.completion_preview").suggestion_group = "SupermavenSuggestion"
    LazyVim.cmp.actions.ai_accept = function()
      local suggestion = require("supermaven-nvim.completion_preview")
      if suggestion.has_suggestion() then
        LazyVim.create_undo()
        vim.schedule(function()
          suggestion.on_accept_suggestion()
        end)
        return true
      end
    end
  end,
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",
      },
      ignore_filetypes = {}, -- or { "cpp", }
      color = {
        suggestion_color = "#666666",
        cterm = 244,
      },
      log_level = "info", -- set to "off" to disable logging completely
    })
  end,
}
