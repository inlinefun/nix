local colors = require("colors")

return {
    keybinds = {
        tall_res = "F4",
        thin_res = "Alt_L",
        wide_res = "C",
        toggle_remaps = "Ctrl-T",
        toggle_ninbot = "*-H",
        fullscreen = "F11",
    },
    input = {
        keyboard = {
            repeat_rate = 30,
            repeat_delay = 400,
        },
        mouse = {
            -- minecraft sens = 0.02291165,
            regular_sensitivity = 8.19450792821915,
            boat_eye_sensitivity = 0.5527966030399928,
        },
    },
    -- resolution values from https://github.com/arjuncgore/waywall_generic_config
    resolutions = {
        normal = {
            width = 0,
            height = 0,
        },
        tall = {
            -- do NOT the values
            width = 384,
            height = 16384,
        },
        thin = {
            width = 340,
            height = 1080
        },
        wide = {
            width = 1920,
            height = 320,
        },
    },
    mirrors = {
        entity_count = {
            x = 10,
            y = 10,
            scale = 5,
            color = colors.on_background
        },
        pie_chart = {
            x = 1250,
            y = 415,
            scale = 1.5,
            color = colors.primary
        },
        pie_chart_labels = {
            x = 20,
            y = 500,
            scale = 2,
            color = colors.on_background
        },
    }
}
