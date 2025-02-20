-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Solarized Dark (Gogh)'
config.font = wezterm.font 'AnonymicePro Nerd Font'
config.font_size = 24.0

-- and finally, return the configuration to wezterm
return config
