-- This file consist of various plugins
return {
  -- Help SSH copy to clipboard
  {
    "ojroques/vim-oscyank",
  },
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
  -- Search/Replace
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>fr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
  },
  -- The Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  }
}
