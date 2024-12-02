-- This include all the mini-nvim I use
return {
	{
		"echasnovski/mini.nvim",
		opts = {},
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
			require("mini.comment").setup()
			require("mini.pairs").setup()
			require("mini.move").setup()
		end,
	},
}
