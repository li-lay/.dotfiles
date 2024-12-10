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
      disabled_filetypes = { "NvimTree", "Neotree" },
    },
    sections = {
      lualine_a = { "mode" },
      -- lualine_b = { "branch", "diff", "diagnostics" },
      lualine_b = { "branch", "diagnostics" },
      lualine_c = { "filename" },
      -- lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { { "datetime", style = "%I:%M" } },
    },
  },
}
