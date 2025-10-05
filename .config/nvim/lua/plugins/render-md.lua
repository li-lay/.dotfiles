return {
	"MeanderingProgrammer/render-markdown.nvim",
	event = "BufRead",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		enabled = true,
		completions = { blink = { enabled = true } },
		file_types = { "markdown", "Avante" },
	},
	ft = { "markdown", "Avante" },
}
