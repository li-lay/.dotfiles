return {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  config = function ()
    require("colorizer").setup()
  end
}
