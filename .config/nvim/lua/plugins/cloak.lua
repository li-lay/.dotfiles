return {
	{
		"laytan/cloak.nvim",
		event = "BufReadPre",
		opts = {
			patterns = {
				{
					file_pattern = { ".env*", ".dev.vars", "terraform.tfvars" },
					cloak_pattern = "=.+",
					replace = nil,
				},
			},
		},
	},
}
