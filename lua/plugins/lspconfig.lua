return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		-------------------------------------------------
		-- basic Mason UI
		-------------------------------------------------
		require("mason").setup({
			ui = {
				icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
			},
		})

		-------------------------------------------------
		-- capabilities offered to every LSP
		-------------------------------------------------
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		-------------------------------------------------
		-- Mason‑lspconfig (v2+) – install & configure
		-------------------------------------------------
		require("mason-lspconfig").setup({
			-- 1) binaries Mason should make sure are installed
			ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "ts_ls" },

			-- 2) how to start each server
			handlers = {
				-- default for every server we didn’t override below
				function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end,

				-- ‑‑‑‑‑ custom Pyright ------------------------------------------------
				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
						settings = {
							python = {
								pythonPath = vim.fn.exepath("python"),
								venvPath = ".",
							},
						},
					})
				end,

				-- ‑‑‑‑‑ custom Lua LS -----------------------------------------------
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,
			},
		})

		-------------------------------------------------
		-- Formatters / linters (non‑LSP)
		-------------------------------------------------
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"ruff",
				"pylint",
				"eslint_d",
				"luacheck",
			},
		})
	end,
}
