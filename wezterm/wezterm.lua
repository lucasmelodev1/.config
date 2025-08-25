local wezterm = require "wezterm"
local config = wezterm.config_builder()

wezterm.on("gui-startup", function()
  local tab, pane, window = wezterm.mux.spawn_window{}
  window:gui_window():maximize()
end)

config.font_size = 12
config.line_height = 1.5
config.font =
  wezterm.font('MonaspiceNe Nerd Font', { weight = 'Medium' })

config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true

return config
