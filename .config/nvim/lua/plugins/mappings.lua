return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {

          -- CheatSheet
          ["<Leader>bh"] = { function() require("nvcheatsheet").toggle() end, desc = "CheatSheet" },

          -- Code Runner
          ["<Leader>M"] = {"<cmd>CompilerOpen<cr>", desc="Code Runner"},

          -- Move lines up&&down
          ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line up" },
          ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line down" },

          -- Switch between Tmux window
          ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", desc = "Move to left window"},
          ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", desc = "Move to right window"},
          ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", desc = "Move to down window"},
          ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", desc = "Move to up window"},

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
