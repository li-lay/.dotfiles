-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "cpp",
      "html",
      "css",
      "javascript",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
