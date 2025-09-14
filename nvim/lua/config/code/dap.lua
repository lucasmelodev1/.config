local dap = require('dap')
local ui = require('dapui')

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF5555" }) -- Catppuccin red-ish

-- Define the sign with Nerd Font icon
vim.fn.sign_define("DapBreakpoint", {
  text = "",  -- nf-fa-circle
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})

local map = vim.keymap.set

map('n', '<leader>b', dap.toggle_breakpoint)
map('n', '<space>?', function()
    ui.eval(nil, { enter = true })
end)

map("n", "<F1>", dap.continue)
map("n", "<F2>", dap.step_into)
map("n", "<F3>", dap.step_over)
map("n", "<F4>", dap.step_out)
map("n", "<F5>", dap.step_back)
map("n", "<F13>", dap.restart)
