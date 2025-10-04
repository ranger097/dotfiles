
-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()
config.colors = {
foreground = '#ebdbb2',
background = '#1d2021',
cursor_bg = '#3C6085',
cursor_fg = '#62728A',
cursor_border = '#6B91A0',
selection_fg = '#78A6C7',
selection_bg = '#1d2021',
scrollbar_thumb = '#A7B7C6',

}


config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {

left = 50,
right =  50,
top = 50,
bottom = 50


}


-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
--config.font = wezterm.font("SpaceMono Nerd Font Mono", {weight = "Regular",style = "Normal"})



-- Finally, return the configuration to wezterm:
return config
