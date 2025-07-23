return {
	{
		"sainnhe/gruvbox-material",
		event = "VimEnter",
		config = function()
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_float_style = "dim"
			vim.g.gruvbox_material_sign_column_background = "none"
			vim.g.gruvbox_material_statusline_style = "original"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
