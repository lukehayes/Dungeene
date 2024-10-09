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

function Color.isTransparent(color)

    return (color.r == 0 and
            color.g == 0 and
            color.b == 0 and
            color.a == 0)
            or false

end

function Color.isWhite(color)

    return (color.r == 1 and
            color.g == 1 and
            color.b == 1 and
            color.a == 1)
            or false

end

function Color.isBlack(color)

    return (color.r == 0 and
            color.g == 0 and
            color.b == 0 and
            color.a == 1)
            or false
end


-- STATIC COLORS
--
function Color.WHITE()
    return Color(1,1,1,1)
end

function Color.BLACK()
    return Color(0,0,0,1)
end

return Color
