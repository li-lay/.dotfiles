---@diagnostic disable: undefined-global
-- Hello World!
vim.cmd([[autocmd VimEnter * echo "Hello World!"]])

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=longest:full,full")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false            -- Don't show the mode, since it's already in the status line
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})
