return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = 'Fzf text current buffer' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'List all diagnostics' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Colorscheme' })
    vim.keymap.set('n', '<leader>fy', builtin.registers, { desc = 'Inspect Vim registers.' })
  end
}
