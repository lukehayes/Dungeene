Object = require "libs.classic"

Vector2 = Object:extend()

function Vector2:new(x, y)
    self.x = x
    self.y = y
end

function Vector2:__tostring()
    return "Vector2: " .. self.x .. " " .. self.y
end


return Vector2
