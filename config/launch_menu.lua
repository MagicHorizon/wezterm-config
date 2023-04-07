local wezterm = require('wezterm')

local M = {}

M.apply = function(config)
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        table.insert(
            config.launch_menu,
            {
                label = 'PowerShell7',
                args = {
                    'C:\\Program Files\\Powershell\\7\\pwsh.exe',
                    '-NoLogo'
                }
            }
        )
        table.insert(
            config.launch_menu,
            {
                label = 'CMD',
                args = {
                    'C:\\Windows\\System32\\cmd.exe'
                }
            }
        )
        table.insert(
            config.launch_menu,
            {
                label = 'MSYS2',
                args = {
                    'C:\\Users\\Seer\\.scoop\\apps\\msys2\\current\\msys2_shell.cmd',
                    '-mingw64',
                    '-here',
                    '-use-full-path',
                    '-defterm',
                    '-no-start'
                }
            }
        )
    end
end

return M