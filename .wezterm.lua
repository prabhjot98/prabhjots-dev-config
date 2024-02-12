local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
local OPACITY = 0.9

config.color_scheme = "OneDark (base16)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 16
config.max_fps = 200
config.window_background_opacity = OPACITY
config.window_decorations = "RESIZE"
config.default_workspace = "home"
config.animation_fps = 60

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.status_update_interval = 1000
config.show_new_tab_button_in_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

local LEFT_SEPERATOR = wezterm.nerdfonts.ple_left_half_circle_thick
local RIGHT_SEPERATOR = wezterm.nerdfonts.ple_right_half_circle_thick

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir.file_path or ""
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

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

config.keys = {
	{
		key = "'",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})

return config
