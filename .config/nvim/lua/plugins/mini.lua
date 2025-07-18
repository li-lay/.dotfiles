return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup({})
    require('mini.comment').setup({})
    require('mini.sessions').setup({})
    require('mini.icons').setup({})
    require('mini.indentscope').setup({ symbol = '╎', })
    require('mini.notify').setup({})
    require('mini.pairs').setup({
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    })
    require('mini.surround').setup({
      mappings = {
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        update_n_lines = 'sn',
      },
    })
    require('mini.animate').setup({
      cursor = { enable = false },
      scroll = { timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }) }
    })
    require('mini.git').setup({})
    require('mini.diff').setup({
      view = {
        style = 'sign',
        signs = { add = '+', change = '|', delete = '-' },
      }
    })
    -- Mini Clue (which-key replacement)
    local miniclue = require("mini.clue")

    miniclue.setup({
      triggers = {
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        { mode = "n", keys = "'" },
        { mode = "x", keys = "'" },
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },
      clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<Leader>h", desc = "Harpoon" },
        { mode = "n", keys = "<Leader>f", desc = "Telescope" },
        { mode = "n", keys = "<Leader>b", desc = "Buffer" },
        { mode = "n", keys = "<Leader>w", desc = "Save" },
        { mode = "n", keys = "<Leader>s", desc = "Session" },
        { mode = "n", keys = "<Leader>q", desc = "Quit" },
        { mode = "n", keys = "<Leader>y", desc = "Yank" },
      },
    })
  end
}
