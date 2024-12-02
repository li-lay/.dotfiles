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
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
    -- Venv Selector
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			-- Your options go here
			-- name = "venv",
			-- auto_refresh = false
		},
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>fvs", "<cmd>VenvSelect<cr>", desc = "Select venv" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>fvc", "<cmd>VenvSelectCached<cr>" , desc = "Select venv from cache" },
		},
	},
}
