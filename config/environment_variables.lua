local wezterm = require('wezterm')

local M = {}

M.apply = function(config)
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        config.set_environment_variables = {
            PATH = os.getenv('PATH')
        }
    else
        config.set_environment_variables = {
            PATH = os.getenv('PATH') .. ':/usr/local/bin'
        }
    end
end

return M