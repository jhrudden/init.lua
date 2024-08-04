return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			local oil = require("oil")
			oil.setup({
				columns = { "icon" },
				keymap = {
					["<C-h>"] = false,
				},
				delete_to_trash = true,
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "<leader>-", oil.toggle_float, { desc = "Open parent dir in floating window" })
		end,
	},
}
