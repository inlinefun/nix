local util = require("util")

local get_shader = function(shader)
    local file = io.open(util.shaders_dir .. shader, "r")
    if not file then
        return
    end
    local data = file:read("a")
    file:close()
    return data
end

return {

}
