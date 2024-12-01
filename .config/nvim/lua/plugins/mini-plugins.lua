-- This include all the mini-nvim I use
return {
  {
    "echasnovski/mini.ai",
    opts = {},
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.move",
    opts = {},
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {},
    config = function()
      require("mini.surround").setup()
    end,
  },
}
