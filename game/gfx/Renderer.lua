Object          = require "libs.classic"
local Color     = require "game.gfx.Color"
require 'game.global'

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

function Renderer.setColor(color)
    love.graphics.setColor(
        color.r,
        color.g,
        color.b,
        color.a
    )
end

function Renderer.draw(gameObject)

    love.graphics.rectangle(
        "fill",
        gameObject.position.x,
        gameObject.position.y,
        gameObject.size.x,
        gameObject.size.y
    )
end

function Renderer.drawTile(tilesheet, tile_type, x,y)
    love.graphics.draw(tilesheet, tile_type, x * TILE_SCALE, y * TILE_SCALE, 0, TILE_MULT, TILE_MULT)
end

return Renderer
