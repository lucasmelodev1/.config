local lualine = require('lualine')

local hl = vim.api.nvim_get_hl_by_name("Normal", true)

local function dec_to_hex(dec)
  return string.format("#%06x", dec or 0)
end

local normal_bg = dec_to_hex(hl.background)
local normal_fg = dec_to_hex(hl.foreground)

lualine.setup({
    options = {
        theme = {
            normal = { c = { fg = normal_fg, bg = normal_bg } },
            insert = { c = { fg = normal_fg, bg = normal_bg } },
            visual = { c = { fg = normal_fg, bg = normal_bg } },
            replace = { c = { fg = normal_fg, bg = normal_bg } },
            command = { c = { fg = normal_fg, bg = normal_bg } },
        },
        section_separators = "",
        component_separators = "",
    },
    sections = {
        lualine_a = {},
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },

        lualine_x = { "diagnostics" },
        lualine_y = { "encoding", "filetype" },
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = {},
        lualine_z = {},
    },
})

