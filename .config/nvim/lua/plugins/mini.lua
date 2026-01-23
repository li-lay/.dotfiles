return {
	"echasnovski/mini.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.ai").setup({})
		require("mini.comment").setup({})
		require("mini.icons").setup({})
		require("mini.indentscope").setup({ symbol = "╎" })
		require("mini.move").setup({})
		require("mini.pairs").setup({})
		require("mini.notify").setup({})

		require("mini.jump2d").setup({
			vim.keymap.set("n", "<leader>fj", ":lua MiniJump2d.start()<CR>", { desc = "Jump2d" }),
		})

		require("mini.files").setup({
			vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "File Explorer" }),
		})

		require("mini.pick").setup({
			vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" }),
			vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Live grep" }),
			vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Buffers" }),
			vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Help tags" }),
			vim.keymap.set("n", "<leader>fp", ":Pick resume<CR>", { desc = "Resume last pick" }),
		})

		require("mini.surround").setup({
			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",
			},
		})

		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "+", change = "|", delete = "-" },
			},
		})

		-- Mini Clue (which-key replacement)
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },
				{ mode = "n", keys = "'" },
				{ mode = "x", keys = "'" },
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},
			clues = {
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.z(),
				{ mode = "n", keys = "<Leader>f", desc = "Picker" },
				{ mode = "n", keys = "<Leader>b", desc = "Buffer" },
				{ mode = "n", keys = "<Leader>w", desc = "Window" },
				{ mode = "n", keys = "<Leader>y", desc = "Yank" },
			},
		})

		-- statusline
		require("mini.statusline").setup({
			content = {
				active = function()
					local MiniStatusline = require("mini.statusline")
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local filename = MiniStatusline.section_filename({ trunc_width = 4000 }) -- with long cause I want short filename
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local time = os.date("%I:%M%p")
					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode:upper() } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{
							hl = "MiniStatuslineFileinfo",
							strings = {
								vim.bo.filetype ~= ""
									and require("mini.icons").get("filetype", vim.bo.filetype)
										.. " "
										.. vim.bo.filetype,
							},
						},
						-- { hl = mode_hl,                  strings = { "%l:%v" } },
						{ hl = mode_hl, strings = { time } },
					})
				end,
			},
			use_icons = true,
		})

		-- Colorizer
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- Snippets
		local gen_loader = require("mini.snippets").gen_loader
		require("mini.snippets").setup({
			snippets = {
				gen_loader.from_lang(),
			},
		})
	end,
}
