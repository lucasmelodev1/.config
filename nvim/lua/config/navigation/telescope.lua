local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        path_display = {
            "filename_first",
        },
        -- Make it full screen
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.5,
          },
        },
        sorting_strategy = "ascending",
        borderchars = {
            prompt  = { " ", " ", " ", " ", " ", " ", " ", " " },
            results = { " ", " ", " ", " ", " ", " ", " ", " " },
            preview = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
        --
    },
})

telescope.load_extension('fzf')
require('telescope-all-recent').setup({})

local map = vim.keymap.set

map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
map('n', '<leader>fc', builtin.commands, { desc = 'Telescope commands' })
map('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope LSP references' })
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope LSP diagnostics' })

