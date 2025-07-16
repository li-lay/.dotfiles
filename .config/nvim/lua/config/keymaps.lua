vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "<leader>e", vim.cmd.Oil, { desc = 'File Explorer' })
vim.keymap.set("n", "<leader>wW", "<Cmd>SudaWrite<CR>", { desc = "Sudo Write", remap = true })
vim.keymap.set("n", "<leader>f'", "<Cmd>Telescope marks<CR>", { desc = "Find marks" })
vim.keymap.set("n", "<leader>ww", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set('n', '<Leader>qw', ':wq<CR>', { desc = 'Quit and save' })
vim.keymap.set('n', '<Leader>qq', ':q!<CR>', { desc = 'Quit without saving' })
vim.keymap.set("n", "<leader>fD", function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { desc = "Toggle diagnostics virtual text" })

-- Tmux
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true, desc = "Delete current buffer" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Mini Sessions
vim.keymap.set('n', '<leader>ss', function()
  vim.cmd('lua require("mini.sessions").write(vim.fn.input("Session Name: "))')
end, { desc = 'Save Session' })
vim.keymap.set('n', '<leader>sl', function()
  require('mini.sessions').select('read', { verbose = true })
end, { desc = 'Load Session' })
vim.keymap.set('n', '<leader>sd', function()
  require('mini.sessions').select('delete', { verbose = true })
end, { desc = 'Delete Session' })
vim.api.nvim_create_user_command('SaveSession', function(opts)
  require('mini.sessions').write(opts.fargs[1])
end, { nargs = 1, desc = 'Save session with a given name' })
vim.api.nvim_create_user_command('LoadSession', function(opts)
  require('mini.sessions').read(opts.fargs[1])
end, { nargs = 1, desc = 'Load session with a given name' })
