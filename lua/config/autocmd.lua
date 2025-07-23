local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Set terminal buffer settings
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
	end,
})

-- Attach LSP keybindings to buffer on attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = args.buf, silent = true }

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP references"
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Show LSP definition"
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP type definition"
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "Smart Rename"
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

		opts.desc = "Show code actions"
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Show documentation"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		vim.keymap.set("n", "<leader>rs", "<cmd>:LspRestart<CR>", opts)

		-- Diagnostics (jumping to warnings)
		opts.desc = "Show line diagnostics"
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Go to next diagnostics"
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next)

		opts.desc = "Go to prev diagnostics"
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
	end,
})
