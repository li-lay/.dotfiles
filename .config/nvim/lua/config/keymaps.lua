vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Life Changing --
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Stuff I want --
vim.keymap.set("n", "<leader>e", vim.cmd.Oil, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>ww", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<Leader>qw", ":wq<CR>", { desc = "Quit and save" })
vim.keymap.set("n", "<Leader>qf", ":q!<CR>", { desc = "Quit without saving" })
vim.keymap.set("n", "<Leader>qq", ":q<CR>", { desc = "Quit" })
vim.keymap.set("x", "p", '"_dP', { desc = "Paste over selected text without copying" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- LazyGit
vim.keymap.set("n", "<leader>fl", ":LazyGit<CR>", { desc = "LazyGit" })

-- Go to first char and last char of line --
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Split window --
vim.keymap.set("n", "<leader>wa", ":split<CR>", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>wf", ":vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>wl", "<C-w><", { desc = "Resize" })
vim.keymap.set("n", "<leader>wh", "<C-w>>", { desc = "Resize" })
vim.keymap.set("n", "<leader>wk", "<C-w>+", { desc = "Resize" })
vim.keymap.set("n", "<leader>wj", "<C-w>-", { desc = "Resize" })

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
vim.keymap.set("n", "<leader>yo", "<Plug>OSCYankOperator", { desc = "OSCYank the given text" })
vim.keymap.set("v", "<leader>yo", "<Plug>OSCYankVisual", { desc = "OSCYank current selection" })

-- Yank current file path/name
vim.keymap.set("n", "<leader>yf", ":let @+=expand('%')<CR>", { desc = "Yank file path" })
vim.keymap.set("n", "<leader>yF", ":let @+=expand('%:p')<CR>", { desc = "Yank full file path" })

-- Buffer navigation --
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })

-- Better indenting in visual mode --
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
