local wezterm = require("wezterm")
local helpers = require("utils/helpers")
local w = require("utils/wallpaper")

local act = wezterm.action
local wallpapers_glob = os.getenv("HOME") .. "/pictures/ai-generated/**"
local config = { }

local colors = {
  text = "#cdd6f4",
  blue = "#89b4fa",
  red = "#f38ba8",
  peach = "#fab387",
  teal = "#94e2d5",
  green = "#a6e3a1",
}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11
-- config.background = { w.get_wallpaper(wallpapers_glob) }
config.color_scheme = "Catppuccin Mocha"

-- window config
config.window_decorations = "NONE"
config.window_padding = { left = 5, right = 5, top = 1, bottom = 1 }
config.window_close_confirmation = "NeverPrompt"
config.window_frame = { active_titlebar_bg = "#090909" }
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.65 }

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_max_width = 25
config.switch_to_last_active_tab_when_closing_tab = true
config.colors = {
  tab_bar = {
    background = "none",
    active_tab = {
      bg_color = colors.peach,
      fg_color = "#000000",
    },
  }
}

-- keybindings
config.leader = { mods = "CTRL", key = " ", timeout_milliseconds = 3000 }
config.keys = {
	{ mods = "CTRL", key = "h", action = act.ActivatePaneDirection("Left") },
	{ mods = "CTRL", key = "j", action = act.ActivatePaneDirection("Down") },
	{ mods = "CTRL", key = "k", action = act.ActivatePaneDirection("Up") },
	{ mods = "CTRL", key = "l", action = act.ActivatePaneDirection("Right") },
	{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "x", action = act.CloseCurrentPane({ confirm = true }) },
	{ mods = "LEADER", key = "p", action = act.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "n", action = act.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "\\", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ mods = "LEADER", key = "RightArrow", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ mods = "LEADER", key = "DownArrow", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ mods = "LEADER", key = "UpArrow", action = act.AdjustPaneSize({ "Up", 5 }) },
}
-- leader + number to activate that tab
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i),
	})
end

config.status_update_interval = 1000

wezterm.on("update-right-status", function(window, pane)
	-- local cwd = " " .. pane:get_current_working_dir() .. " " -- remove file:// uri prefix
  local cwd = " " .. helpers.get_cwd(pane) .. " "
	local date = " 󰃲 " .. wezterm.strftime(" %a %b %-d %H:%M ")
	local hostname = "  " .. wezterm.hostname() .. " "
	local prefix = ""

  wezterm.log_info(cwd)

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) .. " " -- ocean wave
	end

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#f38ba8" } },
		{ Text = prefix },
	}))

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = colors.red } },  { Background = { Color = "none" } },      { Text = "" },
		{ Foreground = { Color = "#000000" } },   { Background = { Color = colors.red } },  { Text = cwd },
		{ Foreground = { Color = colors.teal } }, { Background = { Color = colors.red } },  { Text = "" },
		{ Foreground = { Color = "#000000" } },   { Background = { Color = colors.teal } }, { Text = hostname },
		{ Foreground = { Color = colors.blue } }, { Background = { Color = colors.teal } }, { Text = "" },
		{ Foreground = { Color = "#000000" } },   { Background = { Color = colors.blue } }, { Text = date },
	}))
end)

return config
