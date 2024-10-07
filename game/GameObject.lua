Object = require "libs.classic"
local V2 = require "game.math.Vector2"

GameObject = Object:extend()

function GameObject:new(x,y)
    self.name = "GameObject"
    self.position = V2(x,y)
    self.size     = V2(8,8)
    self.color    = {r=0,g=1,b=0,a=1}
end


return GameObject
