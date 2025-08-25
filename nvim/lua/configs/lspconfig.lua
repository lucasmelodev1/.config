require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gdscript" }
vim.lsp.enable(servers)

vim.lsp.config("gdscript", {
  name = "godot",
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
})

-- read :h vim.lsp.config for changing options of lsp servers 
