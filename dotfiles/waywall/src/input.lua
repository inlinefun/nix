local config = require("config")

return {
    repeat_rate = config.input.keyboard.repeat_rate,
    repeat_delay = config.input.keyboard.repeat_delay,
    sensitivity = config.input.mouse.regular_sensitivity,
    remaps = require("remaps")
}
