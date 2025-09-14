local wezterm = require "wezterm"
local config = wezterm.config_builder()

wezterm.on("gui-startup", function()
    local tab, pane, window = wezterm.mux.spawn_window {}
    window:gui_window():maximize()
end)

config.font_size = 14
config.line_height = 1.5
config.font = wezterm.font('Jetbrains Mono NF', { weight = 'Medium' })
config.harfbuzz_features = {
    'ss01',
    'ss02',
    'ss03',
    'ss04',
    'ss05',
    'ss06',
    'ss07',
    'ss08',
    'ss09',
    'ss10',
    'liga',
}

config.color_scheme = "Catppuccin Mocha"

config.front_end = "OpenGL"

config.hide_tab_bar_if_only_one_tab = true

-- config.window_padding = {
--     left = 0,
--     right = 0,
--     top = 0,
--     bottom = 0,
-- }

return config
