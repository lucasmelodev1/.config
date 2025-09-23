local wezterm = require "wezterm"
local config = wezterm.config_builder()

wezterm.on("gui-startup", function()
    local _tab, _pane, window = wezterm.mux.spawn_window {}
    window:gui_window():maximize()
end)

config.font_size = 13
config.line_height = 1.4
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
config.enable_wayland = false

return config
