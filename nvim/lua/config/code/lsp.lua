local lspconfig = require('lspconfig')
local lsp = vim.lsp

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "ts_ls", "lua_ls", "gopls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
