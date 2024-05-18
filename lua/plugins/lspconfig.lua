return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")

		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"pyright",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"luacheck",
			},
		})

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(args)
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = args.buf, silent = true }

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Show LSP definition"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definition<CR>", opts)

				opts.desc = "Show LSP type definition"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definition<CR>", opts)

				opts.desc = "Smart Rename"
				keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

				opts.desc = "Show code actions"
				keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Show documentation"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", "<cmd>:LspRestart<CR>", opts)

				-- Diagnostics (jumping to warnings)
				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to next diagnostics"
				keymap.set("n", "[d", vim.diagnostic.goto_next)

				opts.desc = "Go to prev diagnostics"
				keymap.set("n", "]d", vim.diagnostic.goto_prev)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end, -- Add additional custom configs here
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
