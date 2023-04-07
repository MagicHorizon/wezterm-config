local wezterm = require('wezterm')

local M = {}

M.apply = function(config)
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        config.default_prog = {
            'C:\\Users\\Seer\\.scoop\\apps\\msys2\\current\\msys2_shell.cmd',
            '-mingw64',
            '-here',
            '-use-full-path',
            '-defterm',
            '-no-start'
        }
    else
        config.default_prog = { '/bin/zsh', '-l' }
    end
end

return M