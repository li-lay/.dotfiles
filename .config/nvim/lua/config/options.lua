-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = true -- Wrap lines
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor

-- Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.completeopt = "menuone,noinsert" -- Completion options
vim.o.background = "dark" -- Set background color
vim.cmd("colorscheme retrobox") -- Set colorscheme
vim.opt.laststatus = 3

-- File handling
-- Create a central location for all "Vim State" files
local prefix = vim.fn.expand("~/.local/state/nvim/")

-- Create directories if they don't exist (prevents errors)
for _, dir in ipairs({ "undo", "backup", "swap" }) do
	vim.fn.mkdir(prefix .. dir, "p")
end

vim.opt.backup = true -- Create backup files
vim.opt.writebackup = true -- Create backup before writing
vim.opt.swapfile = true -- Create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.directory = prefix .. "swap//"
vim.opt.undodir = prefix .. "undo"
vim.opt.backupdir = prefix .. "backup"
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save
vim.opt.confirm = true -- Confirm on exit

-- Behavior settings
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "UTF-8" -- Set encoding
vim.opt.clipboard = "unnamedplus" -- Default yank/paste use system clipboard

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
