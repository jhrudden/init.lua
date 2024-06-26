-- Double escape to terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set("n", ",st", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
