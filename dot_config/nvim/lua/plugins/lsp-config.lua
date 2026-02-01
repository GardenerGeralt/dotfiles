return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("lua_ls", {
			    capabilites = capabilities,
			})
			vim.lsp.config("pyright", {
			    capabilites = capabilities,
			})
			vim.lsp.config("rust_analyzer", {
			    capabilites = capabilities,
			})
			-- vim.lsp.enable("lua_ls")
			-- vim.lsp.enable("pyright")
			-- vim.lsp.enable("rust_analyzer")
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
		end,
	},
}
