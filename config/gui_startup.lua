local wezterm = require('wezterm')

local M = {}

M.apply = function()
    wezterm.on(
        'gui-startup',
        function(cmd)
            local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
            window:gui_window():maximize()
        end
    )
end

return M