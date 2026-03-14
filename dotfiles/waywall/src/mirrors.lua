local helpers = require("waywall.helpers")
local config = require("config")

-- base pie chart
helpers.res_mirror(
    {
        src = { x = 10, y = 680, w = 320, h = 170, },
        dst = {
            x = config.mirrors.pie_chart.x,
            y = config.mirrors.pie_chart.y,
            w = config.mirrors.pie_chart.scale * 320,
            h = config.mirrors.pie_chart.scale * 170,
        },
    },
    config.resolutions.thin.width,
    config.resolutions.thin.height
)

-- entity counter
helpers.res_mirror(
    {
        src = { x = 13, y = 37, w = 37, h = 9 },
        dst = {
            x = config.mirrors.entity_count.x,
            y = config.mirrors.entity_count.y,
            w = config.mirrors.entity_count.scale * 37,
            h = config.mirrors.entity_count.scale * 9
        },
        color_key = config.mirrors.entity_count.color and {
            input = "#dddddd",
            output = config.mirrors.entity_count.color
        } or nil,
    },
    config.resolutions.thin.width,
    config.resolutions.thin.height
)
-- -- entity counter, color_key for when in screen
-- helpers.res_mirror(
--     {
--         src = { x = 13, y = 37, w = 37, h = 9 },
--         dst = {
--             x = config.mirrors.entity_count.x,
--             y = config.mirrors.entity_count.y,
--             w = config.mirrors.entity_count.scale * 37,
--             h = config.mirrors.entity_count.scale * 9
--         },
--         color_key = config.mirrors.entity_count.color and {
--             input = "#414141",
--             output = config.mirrors.entity_count.color
--         } or nil
--     },
--     config.resolutions.thin.width,
--     config.resolutions.thin.height
-- )

-- eye measure
helpers.res_mirror(
    {
        src = { x = 162, y = 7902, w = 60, h = 580 },
        dst = { x = 30, y = 340, w = 700, h = 400 }
    },
    config.resolutions.tall.width,
    config.resolutions.tall.height
)
