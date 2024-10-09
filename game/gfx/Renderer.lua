Object   = require "libs.classic"
local Color  = require "game.gfx.Color"
local tileScale = 3
local tileSize = 16 * tileScale


Renderer = Object:extend()

function Renderer:new()
end

function Renderer:__tostring()
    return "Renderer class"
end

-- STATIC METHODS
--
function Renderer.clear(color)

    color = color or Color.BLACK()

    love.graphics.setBackgroundColor(
        color.r,
        color.g,
        color.b,
        color.a
    )
end

function Renderer.drawTile(tilesheet, x,y)
    love.graphics.draw(tilesheet, x * tileSize,y * tileSize,0, tileScale, tileScale)
end

return Renderer
