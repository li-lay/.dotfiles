return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VeryLazy",
  config = function()
    local simple_modules = {
      ai = {},
      git = {},
      comment = {},
      icons = {},
      move = {},
      pairs = {},
      notify = {},
      bracketed = {},
      trailspace = {},
      tabline = {},
      extra = {},
    }
    for mod, opts in pairs(simple_modules) do
      require("mini." .. mod).setup(opts)
    end

    -- Modules with specific logic or keymaps
    require("mini.indentscope").setup({ symbol = "╎" })

    require("mini.files").setup({})
    vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "Explorer" })

    require("mini.jump2d").setup({})
    vim.keymap.set("n", "<leader>fj", "<cmd>lua MiniJump2d.start()<CR>", { desc = "Jump 2D" })

    require("mini.pick").setup({})
    require("mini.extra").setup({})
    local pick = function(source) return function() require("mini.pick").builtin[source]() end end
    local extra = function(source, opts)
      return function() require("mini.extra").pickers[source](opts or {}) end
    end
    vim.keymap.set("n", "<leader>ff", pick("files"), { desc = "Files" })
    vim.keymap.set("n", "<leader>fg", pick("grep_live"), { desc = "Grep" })
    vim.keymap.set("n", "<leader>fb", pick("buffers"), { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", pick("help"), { desc = "Help Tags" })

    -- Extra Pickers
    vim.keymap.set("n", "<leader>fl", extra("lsp", { scope = "document_symbol" }), { desc = "LSP Symbols" })
    vim.keymap.set("n", "<leader>fd", extra("diagnostic"), { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>ft", extra("treesitter"), { desc = "Tree-sitter" })
    vim.keymap.set("n", "<leader>fc", extra("colorschemes"), { desc = "Colorschemes" })
    vim.keymap.set("n", "<leader>fk", extra("keymaps"), { desc = "Keymaps" })
    vim.keymap.set("n", "<leader>f'", extra("marks"), { desc = "Marks" })
    vim.keymap.set("n", "<leader>fr", extra("registers"), { desc = "Registers" })
    -- GitOps
    vim.keymap.set("n", "<leader>gc", extra("git_commits"), { desc = "Git Get Commits" })
    vim.keymap.set("n", "<leader>gb", extra("git_branches"), { desc = "Git Branches" })
    vim.keymap.set("n", "<leader>gf", extra("git_files"), { desc = "Git Files" })
    vim.keymap.set("n", "<leader>gh", extra("git_hunks"), { desc = "Git Hunks" })
    vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { desc = "Git Diff", silent = true })
    vim.keymap.set("n", "<leader>gC", ":Git commit<CR>", { desc = "Git Commit", silent = true })
    vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", { desc = "Git Pull", silent = true })

    require("mini.surround").setup({
      mappings = { add = "sa", delete = "sd", find = "sf", find_left = "sF", highlight = "sh", replace = "sr", update_n_lines = "sn" },
    })

    require("mini.diff").setup({
      view = { style = "sign", signs = { add = "+", change = "|", delete = "-" } },
    })
    vim.keymap.set("n", "<leader>go", function() require("mini.diff").toggle_overlay(0) end,
      { desc = "Git Diff Overlay" })

    -- Complex Modules (Mini.Clue, Hipatterns, Statusline)
    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = "n", keys = "z" },
      },
      clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<Leader>f", desc = "+Finder" },
        { mode = "n", keys = "<Leader>q", desc = "+Quit" },
        { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
        { mode = "n", keys = "<Leader>w", desc = "+Window" },
        { mode = "n", keys = "<Leader>y", desc = "+Yank" },
        { mode = "n", keys = "<Leader>g", desc = "+Git" },
      },
    })

    -- Statusline
    require("mini.statusline").setup({
      content = {
        active = function()
          local ms = require("mini.statusline")
          local mode, mode_hl = ms.section_mode({ trunc_width = 120 })
          local git = ms.section_git({ trunc_width = 40 })
          local diag = ms.section_diagnostics({ trunc_width = 75 })
          local file = ms.section_filename({ trunc_width = 4000 })
          local icon = require("mini.icons").get("filetype", vim.bo.filetype)
          return ms.combine_groups({
            { hl = mode_hl,                 strings = { mode:upper() } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diag } },
            "%<", { hl = "MiniStatuslineFilename", strings = { file } },
            "%=", { hl = "MiniStatuslineFileinfo", strings = { icon .. " " .. vim.bo.filetype } },
            { hl = mode_hl,                  strings = { os.date("%I:%M%p") } },
          })
        end,
      },
    })

    -- Hipatterns & Snippets
    require("mini.hipatterns").setup({
      highlighters = {
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    })

    require("mini.snippets").setup({ snippets = { require("mini.snippets").gen_loader.from_lang() } })
  end,
}
