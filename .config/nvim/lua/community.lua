-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Themes
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.oldworld-nvim" },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  -- Editing support
  { import = "astrocommunity.editing-support.suda-vim" },
  -- Project
  { import = "astrocommunity.project.projectmgr-nvim" },
  -- Motion plugins
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.tabout-nvim" },
  { import = "astrocommunity.motion.mini-ai" },
  -- lsp
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.java"},
  { import = "astrocommunity.pack.php"},
  { import = "astrocommunity.pack.typescript"},
  -- File Explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },
  -- Completion
  { import = "astrocommunity.completion.codeium-nvim" },
  { import = "astrocommunity.completion.supermaven-nvim" },
  -- Terminal Integration
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  -- Extras
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },
}
