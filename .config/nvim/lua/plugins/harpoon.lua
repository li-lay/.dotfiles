return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon").setup()

    harpoon:setup()

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add to harpoon list" })
    vim.keymap.set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon list" })
    vim.keymap.set("n", "<leader>hh", function()
      harpoon:list():select(1)
    end, { desc = "Switch to 1" })
    vim.keymap.set("n", "<leader>hj", function()
      harpoon:list():select(2)
    end, { desc = "Switch to 2" })
    vim.keymap.set("n", "<leader>hk", function()
      harpoon:list():select(3)
    end, { desc = "Switch to 3" })
    vim.keymap.set("n", "<leader>hl", function()
      harpoon:list():select(4)
    end, { desc = "Switch to 4" })
    vim.keymap.set("n", "<leader>h;", function()
      harpoon:list():select(5)
    end, { desc = "Switch to 5" })
  end,
}
