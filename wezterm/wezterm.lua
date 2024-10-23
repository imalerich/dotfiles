local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- general
config.enable_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }

-- font & theme
config.color_scheme = 'Tokyo Night'
config.font_size = 14
config.font = wezterm.font('FiraCode Nerd Font')
config.harfbuzz_features = {"ss02", "cv24"} -- alts for <= >=, !=

-- background
config.window_background_opacity = 0.87
config.colors = {
  foreground = '#A9B1D6',
  background = '#13141E',
}

-- disable the terminal bell
config.audible_bell = "Disabled"

config.keys = {
  {
    key = '/',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = '@',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1)
  }
}

return config
