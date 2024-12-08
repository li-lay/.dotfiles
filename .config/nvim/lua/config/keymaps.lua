-- My keymaps
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "<leader>W", "<Cmd>SudaWrite<CR>", { desc = "Sudo Write", remap = true })
vim.keymap.set("n", "<leader>f'", "<Cmd>Telescope marks<CR>", { desc = "Find marks" })

-- ZenMode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")

-- disable default keymaps
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>?")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>,")
vim.keymap.del("n", "<leader>.")
vim.keymap.del("n", "<leader>S")
vim.keymap.del("n", "<leader><leader>")
