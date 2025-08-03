-- Formatter
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "black", "isort" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	vim.keymap.set({ "n", "x" }, "<leader>fm", function()
		require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
	end, { desc = "Format current buffer" }),
}
