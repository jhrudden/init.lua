local function findFilesInConfig()
    local builtin = require('telescope.builtin')
    builtin.find_files { cwd = vim.fn.stdpath "config" }
end

local keys = {
	{ "<releader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer search" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>fd", "<cmd>Telescope find_files<cr>", desc = "Find All Files (Curr Working Dir)" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Tags" },
	{ "<leader>fj", "<cmd>Telescope command_history<cr>", desc = "History" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Word (Current Working Dir" },
	{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word Under Cursor" },
    {"<leader>mc", findFilesInConfig, desc = "Search Files Nvim Config"},
}

local config = function()
    local telescope = require('telescope')
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
                n = {
                    ["q"] = "close",
                },
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
                hidden = true,
            },
        },
        extensions = {
			"fzf",
		},
    })
    telescope.load_extension("fzf")
end

return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.6',
    lazy = true,
    dependencies = { 
        {'nvim-lua/plenary.nvim'},
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
		},
    },
    config = config,
    keys = keys
}
