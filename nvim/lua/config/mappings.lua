local key = vim.keymap.set

key("n", "<leader>y", '"+y')
key("n", "<leader>e", "<Cmd>Explore<CR>")
key("n", "<leader>f", "<Cmd>Telescope find_files<CR>")
-- fimd hidden find_files
key("n", "<leader>h", "<Cmd>Telescope find_files hidden=true<CR>")
key("n", "<leader>g", "<Cmd>Telescope live_grep<CR>")
key("n", "<leader>in", vim.diagnostic.goto_next)
key("n", "<leader>ip", vim.diagnostic.goto_prev)

key("n", "<leader>xx", function() require("trouble").toggle() end)
key("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
key("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
key("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
key("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
key("n", "gR", function() require("trouble").toggle("lsp_references") end)
