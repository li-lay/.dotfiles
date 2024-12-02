-- This file consist of various plugins
return {
	-- SudaWrite
	{
		"lambdalisue/suda.vim",
		cmd = { "SudaRead", "SudaWrite" },
	},
	-- Indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
	-- Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
		config = function()
			require("colorizer").setup()
		end,
	},
	-- Marks
	{
		"chentoast/marks.nvim",
		opts = {
			excluded_filetypes = {
				"qf",
				"NvimTree",
				"toggleterm",
				"TelescopePrompt",
				"alpha",
				"netrw",
				"neo-tree",
			},
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
}
