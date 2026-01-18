return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter")
		configs.install({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"javascript",
				"typescript",
				"tsx",
				"json",
				"yaml",
				"dockerfile",
				"lua",
				"bash",
				"c",
				"html",
				"luadoc",
				"luap",
				"query",
				"regex",
				"vim",
				"vimdoc",
				"markdown",
				"python",
			},
			auto_install = false,
		})
	end,
}
