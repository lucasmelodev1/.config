local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.telescope"),
  require("plugins.telescope-fzf"),
  require("plugins.codeium"),
  require("plugins.comment"),
  require("plugins.autopairs"),
  require("plugins.lspconfig"),
  require("plugins.luasnip"),
  require("plugins.cmp"),
  require("plugins.formatter"),
  require("plugins.treesitter"),
  require("plugins.trouble"),
  require("plugins.rose-pine"),
  require("plugins.lualine"),
})
