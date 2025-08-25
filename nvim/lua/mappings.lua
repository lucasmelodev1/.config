require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- helpers
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<C-BS>", "<C-w>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Move to left window in tmux" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Move to right window in tmux" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Move to up window in tmux" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Move to down window in tmux" })


-- Trouble (Diagnostics) navigation
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

