-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Themes
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.oldworld-nvim" },
  { import = "astrocommunity.colorscheme.vim-moonfly-colors" },
  { import = "astrocommunity.colorscheme.poimandres-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  -- Editing support
  { import = "astrocommunity.editing-support.suda-vim" },
  -- Project
  { import = "astrocommunity.project.projectmgr-nvim" },
  -- Motion plugins
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.tabout-nvim" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.harpoon" },
  -- lsp
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.java"},
  { import = "astrocommunity.pack.php"},
  { import = "astrocommunity.pack.rust"},
  { import = "astrocommunity.pack.typescript"},
  -- File Explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },
  -- Completion
  -- { import = "astrocommunity.completion.codeium-nvim" },
  { import = "astrocommunity.completion.supermaven-nvim" },
  -- Terminal Integration
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  -- Code runner
  { import = "astrocommunity.code-runner.compiler-nvim"},
  -- Extras
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },
  { import = "astrocommunity.workflow.hardtime-nvim"}
}
