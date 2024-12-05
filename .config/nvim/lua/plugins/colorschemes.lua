-- NOTE: This is for theme
return {
	-- {
	-- 	"xero/miasma.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("miasma")
	-- 	end,
	-- },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = ...,
		config = function()
			require("gruvbox").setup({
				palette_overrides = {
					dark0 = "#1f1f1f", -- override background
				},
				overrides = {
					SignColumn = { bg = "#1f1f1f" },
				},
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	-- {
	-- 	"Everblush/nvim",
	--    name = 'everblush',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("everblush")
	-- 	end,
	-- },
	-- {
	-- 	"slugbyte/lackluster.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		-- vim.cmd.colorscheme("lackluster")
	-- 		-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
	-- 		vim.cmd.colorscheme("lackluster-mint")
	-- 	end,
	-- },
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	--    name = 'moonfly',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("moonfly")
	-- 	end,
	-- },
}
