local config = { launch_menu = {} }
config.automatically_reload_config = true
require('config.color_scheme').apply(config)
require('config.default_prog').apply(config)
require('config.environment_variables').apply(config)
require('config.key_bindings').apply(config)
require('config.launch_menu').apply(config)
require('config.mouse_bindings').apply(config)
require('config.gui_startup').apply()
require('config.tab_title').apply()
return config