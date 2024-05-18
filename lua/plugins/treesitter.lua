local config = function()
	require("nvim-treesitter.configs").setup({
		build = ":TSUpdate",
		indent = {
			enable = true,
		},
		ensure_installed = {
			"c",
			"lua",
			"markdown",
			"json",
			"yaml",
			"bash",
			"gitignore",
			"python",
			"javascript",
			"typescript",
			"html",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
			"typescript",
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
