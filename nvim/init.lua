-- Preferences
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs & Indentation
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4 -- Number of spaces for auto-indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Insert indents automatically

-- Line Numbers
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Turn on relative numbers
vim.opt.signcolumn = "yes" -- Always show the sign column (for LSP)
vim.opt.numberwidth = 4 -- Set a minimum width for the number column

-- Search Behavior
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- ...unless the search has a capital letter
vim.opt.hlsearch = false -- Don't keep previous search highlighted

-- UI Polish
vim.opt.cursorline = true -- Highlight the line the cursor is on
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor when scrolling
vim.opt.updatetime = 250

-- QOL
vim.opt.colorcolumn = "120"
vim.opt.undofile = true -- Save undo history in file
vim.opt.inccommand = "split" -- Shows a live preview of :%s/find/replace/ in a small split window as you type it.
vim.opt.clipboard = "unnamedplus" -- Sync clipboard

-- File editor
vim.keymap.set("n", "<leader>e", ":Ex<CR>")

-- Treesitter auto update
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

-- Plugins
vim.pack.add({
    "https://github.com/Mofiqul/adwaita.nvim",
    "https://github.com/ibhagwan/fzf-lua",
	{
	  src = 'https://github.com/Saghen/blink.cmp',
	  name = 'blink.cmp',
	  version = vim.version.range('1.x')
  	},
	"https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/Aietes/esp32.nvim",
})

require("esp32").setup()

-- Treesitter
require('nvim-treesitter').install { 'go', 'typescript', 'jsx', 'tsx', 'rust', 'c', 'cpp' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'ts', 'js', 'tsx', 'jsx', 'rs', 'c', 'cpp' }, -- Change to add new filetypes supported by treesitter
  callback = function() vim.treesitter.start() end,
})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Indentation

-- Colorscheme
vim.cmd('colorscheme adwaita')

-- Fuzzy Find
local fzf = require("fzf-lua")
fzf.setup({
    {"ivy", "borderless"},
    defaults = {
        git_icons = false,
        file_icons = false,
        color_icons = false,
    },
    files = {
        cmd = "fd --type f --hidden --exclude .git --exclude build --exclude managed_components --exclude build.clang --exclude .cache --exclude target",
    },
})

vim.keymap.set("n", "<leader>s", fzf.files) -- go to files
vim.keymap.set("n", "<leader>g", fzf.live_grep) -- go to files
fzf.register_ui_select() -- makes lsp bindings use fzf-lua ui
vim.keymap.set('n', 'grr', fzf.lsp_references) -- makes the find references use fzf-lua ui, since 
                                               -- the .register_ui_select() command does not work on it
vim.keymap.set({'v', 'n'}, '<leader>ca', vim.lsp.buf.code_action)

-- Autocomplete
require("blink.cmp").setup()

-- LSP
vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities()
})

vim.lsp.config('clangd', {
    init_options = {
        fallbackFlags = { '-std=c++20' }
    },
})

vim.lsp.enable({
    'lua_ls',
    'gopls',
    'ts_ls',
    'biome',
    'rust_analyzer',
    'clangd',
})

-- LSP show diagnostics bubble when navigating to it
vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_next({ float = true })
end, { desc = "Go to next diagnostic" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev({ float = true })
end, { desc = "Go to previous diagnostic" })

-- LSP format
vim.keymap.set("n", "<leader>w", function()
  -- 1. Format th buffer using Biome
  vim.lsp.buf.format({
    async = false,
    timeout_ms = 1000,
  })

  vim.cmd("write")
end, { desc = "LSP Format and Save" })
