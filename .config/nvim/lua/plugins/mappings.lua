return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {

          -- CheatSheet
          ["<Leader>H"] = { function() require("nvcheatsheet").toggle() end, desc = "CheatSheet" },

          -- Move lines up&&down (use mini-move instead now)
          -- ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line up" },
          -- ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line down" },

          -- Oil
          ["<Leader>e"] = { "<cmd>Oil<cr>", desc = "Oil" },

          -- Neo-tree
          ["<Leader>O"] = { "<cmd>Neotree toggle<cr>", desc = "File explorer" },

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
