return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		-- Disable copilot by default
		vim.g.copilot_enabled = false

		vim.api.nvim_create_user_command("CopilotToggle", function()
			local enabled = vim.g.copilot_enabled or false
			if enabled then
				vim.cmd("Copilot disable")
			else
				vim.cmd("Copilot enable")
			end
			vim.cmd("Copilot status")
		end, { nargs = 0 })

		vim.keymap.set("n", "<leader>cp", "<cmd>CopilotToggle<CR>", { noremap = true, silent = true })
	end,
}
