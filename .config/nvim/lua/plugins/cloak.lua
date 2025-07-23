return {
	{
		"laytan/cloak.nvim",
		event = "BufReadPre",
		opts = {
			patterns = {
				{
					file_pattern = { ".env*", ".dev.vars" },
					cloak_pattern = "=.+",
					replace = nil,
				},
			},
		},
	},
}
