-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.


config.background = {



}

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {

left = 70,
right =  70,
top = 70,
bottom = 70


}


-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.font = wezterm.font("SpaceMono Nerd Font Mono", {weight = "Regular",style = "Normal"})

config.color_scheme = 'rebecca'     

-- Finally, return the configuration to wezterm:
return config
