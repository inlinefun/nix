local helpers = require("waywall.helpers")
local config = require("config")

local toggle_tall_res = helpers.toggle_res(
    config.resolutions.tall.width,
    config.resolutions.tall.height,
    config.input.mouse.boat_eye_sensitivity
)
local toggle_thin_res = helpers.toggle_res(
    config.resolutions.thin.width,
    config.resolutions.thin.height,
    config.input.mouse.regular_sensitivity
)
local toggle_wide_res = helpers.toggle_res(
    config.resolutions.wide.width,
    config.resolutions.wide.height,
    config.input.mouse.regular_sensitivity
)

return {
    toggle_tall_res = toggle_tall_res,
    toggle_thin_res = toggle_thin_res,
    toggle_wide_res = toggle_wide_res,
}
