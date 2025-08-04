return {
	"MeanderingProgrammer/render-markdown.nvim",
	event = "BufRead",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		enabled = false,
		completions = { blink = { enabled = true } },
	},
}
