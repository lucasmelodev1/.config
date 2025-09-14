local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- for vsnip
      -- For other snippet engines, uncomment the line below:
      -- require("luasnip").lsp_expand(args.body)
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" }, -- vsnip source
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

-- Use path + cmdline source for ':'
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})
