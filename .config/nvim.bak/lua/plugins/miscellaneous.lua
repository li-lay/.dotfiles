-- This file consist of various plugins
return {
  -- SudaWrite
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
    config = function()
      require("colorizer").setup()
    end,
  },
  -- Marks
  {
    "chentoast/marks.nvim",
    opts = {
      excluded_filetypes = {
        "qf",
        "NvimTree",
        "Neotree",
        "toggleterm",
        "TelescopePrompt",
        "alpha",
        "netrw",
        "neo-tree",
      },
    },
  },
}
