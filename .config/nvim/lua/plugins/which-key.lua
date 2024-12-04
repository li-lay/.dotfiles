return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	-- keys = {
	-- 	{
	-- 		"<leader>?",
	-- 		function()
	-- 			require("which-key").show({ global = false })
	-- 		end,
	-- 		desc = "All Local Keymaps (which-key)",
	-- 	},
	-- },
	config = function()
		require("which-key").setup({
			icons = {
				mappings = false, -- Disable all mapping icons
			},
		})
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", desc = "Switch Buffer", mode = "n" },

			{ "<leader>s", desc = "Search forward", mode = "n" },
			{ "<leader>S", desc = "Search backward", mode = "n" },

			{ "<leader>d", group = "Debugger" }, -- group
			{ "<leader>p", group = "Project" }, -- group
			{ "<leader>h", group = "Harpoon" }, -- group

			{ "<leader>f", group = "Telescope" }, -- group
			{ "<leader>fc", desc = "Format code", mode = "n" },

			-- { "<leader>f1", hidden = true }, -- hide this keymap
			{
				-- Nested mappings are allowed and can be added in any order
				-- Most attributes can be inherited or overridden on any level
				-- There's no limit to the depth of nesting
				mode = { "n", "v" }, -- NORMAL and VISUAL mode
				{ "<leader>q", desc = "Quit" }, -- no need to specify mode since it's inherited
				{ "<leader>w", desc = "Write" },
			},
		})
	end,
}
