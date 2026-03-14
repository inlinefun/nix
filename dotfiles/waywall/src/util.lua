local helpers = require("waywall.helpers")
local waywall = require("waywall")

local home_dir = os.getenv("HOME")
local waywall_root = home_dir .. "/.config/waywall"
local assets_dir = waywall_root .. "/assets/"
local shaders_dir = waywall_root .. "/shaders/"
local eye_measure_overlay = assets_dir .. "eye_measure_overlay.png"
local ninjabrain_bot_path = assets_dir .. "ninjabrain_bot.jar"

local is_ninbot_running = function()
    local handle = io.popen("pgrep -f 'ninjabrain_bot.*jar'")
    if not handle then
        return
    end
    local result = handle:read("*l")
    handle:close()
    return result ~= nil
end

local toggle_ninbot = function()
    if is_ninbot_running() then
        helpers.toggle_floating()
    else
        waywall.exec("java -Dawt.useSystemAAFontSettings=on -jar " .. ninjabrain_bot_path)
        waywall.show_floating(true)
        print("started ninbot")
    end
end

return {
    toggle_ninbot = toggle_ninbot,
    eye_measure_overlay = eye_measure_overlay,
    shaders_dir = shaders_dir,
}
