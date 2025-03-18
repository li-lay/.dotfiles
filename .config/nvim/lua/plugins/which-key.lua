return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("which-key").setup({
      icons = {
        mappings = false, -- Disable all mapping icons
      },
    })
    local wk = require("which-key")
    wk.add({

      { "<leader>b", group = "Buffer" }, -- group
      { "<leader>c", group = "Code" }, -- group
      { "<leader>h", group = "Harpoon" }, -- group
      { "<leader>f", group = "Telescope" }, -- group
      { "<leader>g", group = "Git" }, -- group
      { "<leader>q", group = "Session" }, -- group
      { "<leader>s", group = "Search" }, -- group
      { "<leader>u", group = "UI" }, -- group
      { "<leader>w", group = "Window" }, -- group
      { "<leader>x", group = "Lists" }, -- group
      { "<leader>d", group = "Debugger" }, -- group
      { "<leader>a", group = "AI" }, -- group
    })
  end,
}
