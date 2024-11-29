-- NOTE: This is for theme
return {
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("miasma")
		end,
	},
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = true,
	-- 	opts = ...,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },
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
