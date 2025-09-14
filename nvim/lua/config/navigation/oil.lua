local oil = require("oil")

oil.setup({
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set('n', '-', function()
  oil.open()
  vim.wait(1000, function()
    return oil.get_cursor_entry() ~= nil
  end)
  if oil.get_cursor_entry() then
    oil.open_preview({ vertical = true, split = "belowright" })
  end
end)

