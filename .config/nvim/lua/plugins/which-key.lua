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
      { "<leader>h", group = "Harpoon" },   -- group
      { "<leader>f", group = "Telescope" }, -- group
      { "<leader>b", group = "Buffer" },    -- group
      { "<leader>w", group = "Save" },      -- group
      { "<leader>s", group = "Session" },   -- group
      { "<leader>q", group = "Quit" },      -- group
    })
  end,
}
