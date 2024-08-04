-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     lazy = false,
--     config = function()
--         require('gruvbox').setup({
--             terminal_colors = true, -- add neovim terminal colors
--             -- transparent_mode = true,
--         })
-- 		vim.cmd('colorscheme gruvbox')
-- 	end
-- }
return {
	"blazkowolf/gruber-darker.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruber-darker").setup({
			bold = false,
			italic = {
				strings = false,
			},
		})
		vim.cmd("colorscheme gruber-darker")
	end,
}
