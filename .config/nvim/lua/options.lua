-- Hello World!
vim.cmd([[autocmd VimEnter * echo "Hello World!"]])

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=longest:full,full")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})

-- HighlightColors 1
vim.cmd([[autocmd VimEnter * HighlightColors 1]])
