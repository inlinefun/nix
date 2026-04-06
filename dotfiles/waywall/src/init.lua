-- load before mirrors and overlays which make use of the shader
local shaders = require("shaders")

require("mirrors")
require("overlays")

return {
    actions = require("actions"),
    input = require("input"),
    theme = require("appearance"),
    shaders = shaders,
}
