local set = vim.keymap.set

-- Split Navigation
set("n", "<c-j>", "<c-w><c-j>") -- Navigate Down
set("n", "<c-k>", "<c-w><c-k>") -- Navigate Up
set("n", "<c-l>", "<c-w><c-l>") -- Navigate Right
set("n", "<c-h>", "<c-w><c-h>") -- Navigate Left

-- Split resizing
---- resize horizontally
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")

---- resize vertically
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Split Focusing
set("n", "<M-f>", "<C-w>|<C-w>_")
set("n", "<M-u>", "<C-w>=")

-- Fast Execution (helpful for fast config iteration for nvim)
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Indentation
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Commenting
vim.api.nvim_set_keymap("n", "+++", "gcc", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "+++", "gcc", { noremap = false, silent = true })

-- LSP operations
set("n", "K", vim.lsp.buf.hover, { desc = "Reveal Documentation" })
