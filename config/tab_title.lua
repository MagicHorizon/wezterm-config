local wezterm = require('wezterm')

local GLYPH_SEMI_CIRCLE_LEFT = ''
local GLYPH_SEMI_CIRCLE_RIGHT = ''
local GLYPH_CIRCLE = ''
local GLYPH_ADMIN = 'ﱾ'

local M = {}

M.cells = {}

M.colors = {
    default = { bg = '#45475a', fg = '#1c1b19' },
    active = { bg = '#7FB4CA', fg = '#11111b' },
    hover = { bg = '#587d8c', fg = '#1c1b19' }
}

M.set_title = function(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2'):gsub('%.exe$', '')
end

M.push = function(bg, fg, attribute, text)
    table.insert(M.cells, { Background = { Color = bg } })
    table.insert(M.cells, { Foreground = { Color = fg } })
    table.insert(M.cells, { Attribute = attribute })
    table.insert(M.cells, { Text = text })
end

M.apply = function()
    wezterm.on(
        'format-tab-title',
        function(tab, tabs, panes, config, hover, max_width)
            M.cells = {}

            local bg, fg
            if tab.is_active then
                bg = M.colors.active.bg
                fg = M.colors.active.fg
            elseif hover then
                bg = M.colors.hover.bg
                fg = M.colors.hover.fg
            else
                bg = M.colors.default.bg
                fg = M.colors.default.fg
            end

            M.push(fg, bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_LEFT)
            M.push(bg, fg, { Intensity = 'Bold' }, ' ' .. M.set_title(tab.active_pane.foreground_process_name))
            M.push(bg, fg, { Intensity = 'Bold' }, ' ')
            M.push(fg, bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_RIGHT)

            return M.cells
        end
    )
end

return M