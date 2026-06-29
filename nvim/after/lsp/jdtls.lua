return {
  handlers = {
    ['language/status'] = function(_, result)
      vim.print('***')
    end,
    ['$/progress'] = function(_, result, ctx)
      vim.print('---')
    end,
  },
}
