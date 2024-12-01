return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"clangd",
					"html",
					"jdtls",
					"marksman",
					"basedpyright",
				},
			})
		end,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local function setup_servers()
				-- List of servers you want to auto-setup
				local servers = { "html", "basedpyright", "cssls", "clangd", "jsonls", "jdtls", "lua_ls", "marksman" }

				for _, server in ipairs(servers) do
					lspconfig[server].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							-- Custom on_attach logic, if needed
							-- Example: Mappings, diagnostics, etc.
							print("Attached to " .. client.name)
						end,
						-- Add any default settings you want here
					})
				end
			end

			-- Automatically set up servers
			setup_servers()

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
		end,
	},
}
