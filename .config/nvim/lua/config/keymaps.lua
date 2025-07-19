vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Life Changing --
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Stuff I want --
vim.keymap.set("n", "<leader>e", vim.cmd.Oil, { desc = 'File Explorer' })
vim.keymap.set("n", "<leader>ww", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set('n', '<Leader>qw', ':wq<CR>', { desc = 'Quit and save' })
vim.keymap.set('n', '<Leader>qf', ':q!<CR>', { desc = 'Quit without saving' })
vim.keymap.set('n', '<Leader>qq', ':q<CR>', { desc = 'Quit' })

-- Tmux --
local function move_or_tmux(key)
  local dir_map = {
    ["<C-h>"] = { win_cmd = "h", tmux_cmd = "L" },
    ["<C-j>"] = { win_cmd = "j", tmux_cmd = "D" },
    ["<C-k>"] = { win_cmd = "k", tmux_cmd = "U" },
    ["<C-l>"] = { win_cmd = "l", tmux_cmd = "R" },
  }

  return function()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. dir_map[key].win_cmd)

    if vim.api.nvim_get_current_win() == current_win then
      -- Didn't move in Neovim, fallback to tmux
      vim.fn.system({ "tmux", "select-pane", "-" .. dir_map[key].tmux_cmd })
    end
  end
end
vim.keymap.set("n", "<C-h>", move_or_tmux("<C-h>"), { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", move_or_tmux("<C-j>"), { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", move_or_tmux("<C-k>"), { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", move_or_tmux("<C-l>"), { noremap = true, silent = true })

-- Yank --
-- OSC Yank
vim.keymap.set('n', '<leader>yo', '<Plug>OSCYankOperator', { desc = "OSCYank the given text" })
vim.keymap.set('v', '<leader>yo', '<Plug>OSCYankVisual', { desc = "OSCYank current selection" })
-- To delete without yanking to any register (the black hole register)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
-- Yank current file path/name
vim.keymap.set("n", "<leader>yf", ":let @+=expand('%')<CR>", { desc = "Yank file path" })
vim.keymap.set("n", "<leader>yF", ":let @+=expand('%:p')<CR>", { desc = "Yank full file path" })

-- Paste --
vim.keymap.set('x', 'p', '"_dP', { desc = "Paste over selected text without copying" })

-- Buffer navigation --
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true, desc = "Delete current buffer" })

-- Move lines up/down --
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
local function move_or_tmux(key)
  local dir_map = {
    ["<C-h>"] = { win_cmd = "h", tmux_cmd = "L" },
    ["<C-j>"] = { win_cmd = "j", tmux_cmd = "D" },
    ["<C-k>"] = { win_cmd = "k", tmux_cmd = "U" },
    ["<C-l>"] = { win_cmd = "l", tmux_cmd = "R" },
  }

  return function()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. dir_map[key].win_cmd)

    if vim.api.nvim_get_current_win() == current_win then
      -- Didn't move in Neovim, fallback to tmux
      vim.fn.system({ "tmux", "select-pane", "-" .. dir_map[key].tmux_cmd })
    end
  end
end

-- Bind the keys
vim.keymap.set("n", "<C-h>", move_or_tmux("<C-h>"), { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", move_or_tmux("<C-j>"), { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", move_or_tmux("<C-k>"), { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", move_or_tmux("<C-l>"), { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode --
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Mini Sessions --
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
