return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			-- You can customize some of the format options for the filetype (:help conform.format)
			-- Conform will run the first available formatter
			-- Conform will run multiple formatters sequentially
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				cpp = { "clang-format" },
				java = { "google-java-format" },
			},
		})
	end,
}
