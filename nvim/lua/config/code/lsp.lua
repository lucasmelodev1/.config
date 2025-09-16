local lspconfig = require('lspconfig')
local lsp = vim.lsp

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "ts_ls", "lua_ls", "gopls", "gdscript" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

lspconfig.gdscript.setup {
    cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
    filetypes = { "gd", "gdscript", "gdscript3" },
}

local signs = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
}

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN]  = signs.Warn,
            [vim.diagnostic.severity.HINT]  = signs.Hint,
            [vim.diagnostic.severity.INFO]  = signs.Info,
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
        },
    },
})

-- Show diagnostics in a floating window
vim.keymap.set("n", "<leader>ld", function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
end, { desc = "Show diagnostics" })

-- Rename symbol under cursor
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP: Rename" })
