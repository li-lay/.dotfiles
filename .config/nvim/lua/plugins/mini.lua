return {
  {
    "echasnovski/mini.comment",
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require('mini.ai').setup()
    end
  },
  {
    "echasnovski/mini.sessions",
    config = function()
      require('mini.sessions').setup()
    end
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = 'sa',            -- Add surrounding in Normal and Visual modes
        delete = 'sd',         -- Delete surrounding
        find = 'sf',           -- Find surrounding (to the right)
        find_left = 'sF',      -- Find surrounding (to the left)
        highlight = 'sh',      -- Highlight surrounding
        replace = 'sr',        -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
      },
    }
  }
}
