return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = { theme = 'dropdown' },
        buffers = { theme = 'dropdown' },
        help_tags = { theme = 'dropdown' },
        keymaps = { theme = 'dropdown' },
        colorscheme = { theme = 'dropdown', enable_preview = true, },
        diagnostics = { theme = 'ivy', previewer = false },
        current_buffer_fuzzy_find = { theme = 'dropdown' },
        registers = { theme = 'dropdown' },
        marks = { theme = 'dropdown' },
      },
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = 'Fzf text current buffer' })
    vim.keymap.set('n', '<leader>fD', builtin.diagnostics, { desc = 'List all diagnostics' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Colorscheme' })
    vim.keymap.set('n', '<leader>fy', builtin.registers, { desc = 'Inspect Vim registers.' })
    vim.keymap.set('n', '<leader>fv', builtin.treesitter, { desc = 'Lists Function names, variables, from Treesitter!' })
    vim.keymap.set("n", "<leader>f'", builtin.marks, { desc = "Find marks" })

    vim.keymap.set("n", "<leader>fp", function()
      local new_config = not vim.diagnostic.config().virtual_text
      vim.diagnostic.config({ virtual_text = new_config })
    end, { desc = "Toggle diagnostics virtual text" })

    vim.keymap.set('n', '<leader>fd', function()
      builtin.diagnostics({
        bufnr = 0,
      })
    end, { desc = 'Telescope current buffer diagnostics' })
  end
}
