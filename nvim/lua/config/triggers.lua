vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
    if vim.fn.exists(':Format') > 0 then vim.cmd('Format') end
    vim.lsp.buf.format { async = false }
  end
})
