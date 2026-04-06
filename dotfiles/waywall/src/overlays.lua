local helpers = require("waywall.helpers")
local config = require("config")

local util = require("util")

helpers.res_image(
    util.eye_measure_overlay,
    {
        dst = { x = 30, y = 340, w = 700, h = 400 }
    },
    config.resolutions.tall.width,
    config.resolutions.tall.height
)
