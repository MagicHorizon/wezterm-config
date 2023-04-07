local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

M.apply = function(config)
    config.keys =  {
        {
            key = 'l',
            mods = 'ALT',
            action = act.ShowLauncher
        }
    }
end

return M