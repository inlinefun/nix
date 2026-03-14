local config         = require("config")
local resolutions    = require("resolutions")
local waywall        = require("waywall")
local util           = require("util")

local f3_safe_action = function(runnable)
    return function()
        if waywall.get_key("F3") then
            return false
        end
        runnable()
    end
end

return {
    [config.keybinds.fullscreen] = f3_safe_action(waywall.toggle_fullscreen),
    [config.keybinds.toggle_ninbot] = f3_safe_action(util.toggle_ninbot),
    [config.keybinds.tall_res] = f3_safe_action(
        function()
            resolutions.toggle_tall_res()
        end
    ),
    [config.keybinds.thin_res] = f3_safe_action(
        function()
            resolutions.toggle_thin_res()
        end
    ),
    [config.keybinds.wide_res] = f3_safe_action(
        function()
            resolutions.toggle_wide_res()
        end
    ),
}
