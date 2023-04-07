local wezterm = require('wezterm')

local M = {}

M.font = function(params)
    return wezterm.font_with_fallback({
        'CaskaydiaCove Nerd Font Mono',
        'HarmonyOS Sans SC'
    }, params)
end

M.apply = function(config)
    config.color_scheme = 'Palenight (Gogh)'

    config.font = M.font()
    config.font_size = 20
    config.font_rules = {
        { intensity = 'Half', font = M.font() },
        { italic = true, font = M.font({ italic = true }) },
        { intensity = 'Bold', font = M.font({ bold = true }) },
        { italic = true, intensity = 'Bold', font = M.font({ bold = true, italic = true }) }
    }

    config.default_cursor_style = "BlinkingBar"
    config.cursor_blink_rate = 500
    config.cursor_blink_ease_in = 'Linear'
    config.cursor_blink_ease_out = 'Linear'

    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true
    config.hide_tab_bar_if_only_one_tab = true
end

return M