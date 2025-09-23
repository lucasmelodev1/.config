-- Indentation
vim.opt.tabstop = 2        -- Number of spaces tabs count for
vim.opt.shiftwidth = 2     -- Number of spaces to use for each step of indent
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart auto-indenting on new lines

-- Line numbers
vim.opt.number = true         -- Show absolute line number on the current line
vim.opt.relativenumber = true -- Show relative numbers on other lines

-- Padding
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 4

-- Show a vertical line at column 100
vim.opt.colorcolumn = "100"
vim.cmd("highlight ColorColumn guibg=#2c2c2c ctermbg=236")

-- At least 8 lines will be shown below the cursor
vim.opt.scrolloff = 8
