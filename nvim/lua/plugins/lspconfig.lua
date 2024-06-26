return {
  -- use official lspconfig package (and enable completion):
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      -- following keymap is based on both lspconfig and lsp-zero.nvim:
      -- - https://github.com/neovim/nvim-lspconfig/blob/fd8f18fe819f1049d00de74817523f4823ba259a/README.md?plain=1#L79-L93
      -- - https://github.com/VonHeikemen/lsp-zero.nvim/blob/18a5887631187f3f7c408ce545fd12b8aeceba06/lua/lsp-zero/server.lua#L285-L298
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)   -- lspconfig: <space>ca; lsp-zero: <F4>
      -- vim.keymap.set('n', '<leader>'   , function() vim.lsp.buf.format { async = true } end, bufopts) -- lspconfig: <space>f
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)        -- lspconfig: <space>rn; lsp-zero: <F2>
    end
    local lspconfig = require('lspconfig')
    -- enable both language-servers for both eslint and typescript:
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              'vim',
              'require'
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
    for _, server in pairs({ 'eslint', 'tsserver', 'tailwindcss', 'sqlls', 'gopls', 'astro', 'dartls' }) do
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
      })
    end
  end,
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'lua', 'sql', 'mysql', 'go', 'gomod', 'gowork', 'gotmpl', 'astro', 'astro-markdown', 'markdown', 'mdx', 'dart' },
}
