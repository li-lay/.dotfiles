-- NOTE: Lualine is a statusline
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = true,
      -- theme = "seoul256",
      theme = "gruvbox",
      -- theme = "gruvbox-material",
      -- theme = "codedark",
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },

  specs = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts) opts.statusline = nil end,
    },
  },
}
