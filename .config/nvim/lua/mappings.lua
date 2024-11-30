-- Mappings
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Sudo
vim.keymap.set("n", "<leader>W", "<Cmd>SudaWrite<CR>")

-- Oil as file explorer
vim.keymap.set("n", "<leader>e", "<Cmd>Oil<CR>")

-- Save
vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>")

-- Save and quit
vim.keymap.set("n", "<leader>q", "<Cmd>wq<CR>")

-- Close buffer
vim.keymap.set("n", "<leader>c", "<Cmd>bd<CR>")

-- Clear highlight
vim.keymap.set("n", "<leader>hc", "<Cmd>noh<CR>")

-- Open Nvim-Tree
vim.keymap.set("n", "<leader>O", "<Cmd>NvimTreeToggle<CR>")
