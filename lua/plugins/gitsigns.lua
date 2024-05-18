return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			map("n", "]h", gs.next_hunk, "Next hunk")
			map("n", "[h", gs.prev_hunk, "Prev hunk")

			map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "toggle line blame")

			map("n", "<leader>hd", gs.diffthis, "Diff this file")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "Diff this ~")
		end,
	},
}
