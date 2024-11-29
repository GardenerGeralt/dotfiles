-- Pull in the wezterm API
local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme_dirs = { "/home/misha/.cache/wal/" }
config.color_scheme = 'colors'

-- This is where you actually apply your config choices
config.font = wezterm.font({
	family = "DM Mono Medium",
	-- harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})

config.keys = {
	{
		key = "q",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = true }),
	},
}

config.enable_tab_bar = false
-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- bar.apply_to_config(config)

-- Configure smart-splits
smart_splits.apply_to_config(config, {
	-- the default config is here, if you'd like to use the default keys,
	-- you can omit this configuration table parameter and just use
	-- smart_splits.apply_to_config(config)

	-- directional keys to use in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "ALT", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})

-- and finally, return the configuration to wezterm
return config
