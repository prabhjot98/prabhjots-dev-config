local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
local OPACITY = 0.9

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 18
config.max_fps = 150
config.window_background_opacity = OPACITY
config.window_decorations = "RESIZE"
config.default_workspace = "home"
config.animation_fps = 30

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.show_new_tab_button_in_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.line_height = 0.9
config.colors = {
	tab_bar = {
		background = "rgba(26, 27, 38, " .. OPACITY .. ")",
	},
}

local LEFT_SEPERATOR = wezterm.nerdfonts.ple_left_half_circle_thick
local RIGHT_SEPERATOR = wezterm.nerdfonts.ple_right_half_circle_thick

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir or ""
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local cwd = wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = get_current_working_dir(tab) },
	})

	return {
		{ Text = LEFT_SEPERATOR .. cwd .. RIGHT_SEPERATOR },
	}
end)

return config
