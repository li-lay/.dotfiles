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
-- vim.keymap.set("n", "<leader>hc", "<Cmd>noh<CR>")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>fq', vim.diagnostic.setloclist, { desc = 'Open quickfix diagnostic' })

-- Open Nvim-Tree
vim.keymap.set("n", "<leader>O", "<Cmd>NvimTreeToggle<CR>")

-- Markdown preview
vim.keymap.set("n", "<leader>M", "<Cmd>MarkdownPreviewToggle<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fH", "<Cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>f'", "<Cmd>Telescope marks<CR>")
vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ft", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")

-- Dap
vim.keymap.set("n", "<leader>db", "<Cmd>DapToggleBreakpoint<CR>", { desc = 'Add breakpoint'})
vim.keymap.set("n", "<leader>dr", "<Cmd>DapContinue<CR>", { desc = 'Start/Continue the debugger'})
