return {
  'hrsh7th/nvim-cmp',
  config = function(_)
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    cmp.setup({
      completion = { completeopt = 'menu,preview,menuone,noinsert' },
      -- if desired, choose another keymap-preset:
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      -- optionally, add more completion-sources:
      sources = cmp.config.sources({ { name = 'nvim_lsp' } }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
    })
  end,
}
