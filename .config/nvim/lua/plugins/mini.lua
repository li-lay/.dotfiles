return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.ai').setup({})
      require('mini.comment').setup({})
      require('mini.sessions').setup({})
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
    end
}
