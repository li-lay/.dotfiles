return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- Move lines up&&down
          ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line up" },
          ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line down" },

          -- Move cursor to the beginning||end
          ["H"] = { "^", desc = "Move cursor to the beginning of line" },
          ["L"] = { "$", desc = "Move cursor to the end of line" },
        },
        i = {
          -- Can't live without
          ["kj"] = { "<esc>", desc = "Quick exit to normal mode" },
          ["jk"] = { "<esc>", desc = "Quick exit to normal mode" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
