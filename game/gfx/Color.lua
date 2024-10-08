Object   = require "libs.classic"
local V2 = require "game.math.Vector2"

Color = Object:extend()

function Color:new(r,g,b,a)
    self.r = r or 1
    self.g = g or 0
    self.b = b or 1
    self.a = a or 1
end

function Color:__tostring()
    return "Color: {R=" .. self.r ..
            ", G=" .. self.g .. "" ..
            ", B=" .. self.b .. "" ..
            ", A=" .. self.a .. "}"
end

return Color
