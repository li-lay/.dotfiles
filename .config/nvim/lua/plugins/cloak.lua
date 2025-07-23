return {
	{
		"laytan/cloak.nvim",
		event = "BufReadPre",
		opts = {
			patterns = {
				{
					file_pattern = ".env*",
					cloak_pattern = "=.+",
					replace = nil,
				},
				{
					file_pattern = "auth.json",
					cloak_pattern = ":.+",
					replace = nil,
				},
				{
					file_pattern = ".dev.vars",
					cloak_pattern = "=.+",
					replace = nil,
				},
			},
		},
	},
}
