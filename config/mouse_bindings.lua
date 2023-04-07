local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

M.apply = function(config)
    config.mouse_bindings = {
        {
            event = { Down = { streak = 1, button = 'Right' } },
            mods = 'NONE',
            action = act { PasteFrom = 'Clipboard' }
        },
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'NONE',
            action = act.CompleteSelection 'ClipboardAndPrimarySelection',
        },
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = act.OpenLinkAtMouseCursor,
        }
    }
end

return M