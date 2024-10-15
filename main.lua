local R  = require "game.gfx.Renderer"
local Color  = require "game.gfx.Color"

require 'game.global'

local c = 0

love.graphics.setDefaultFilter("nearest", "nearest")

local img   = love.image.newImageData("assets/map.png")
local tiles = love.graphics.newImage("assets/tilesheet.png", {})

local floor = love.graphics.newQuad( 0, 0, TILE_SIZE, TILE_SIZE, tiles)
local wall  = love.graphics.newQuad( 16, 0, TILE_SIZE, TILE_SIZE, tiles)

local map = {}
for x=0, img:getWidth() -1 do
    local row = {}
    for y=0, img:getHeight() -1 do
        local c = Color(img:getPixel(x,y))
        table.insert(row, c)
    end
    table.insert(map, row)
end
function love.load()
end

function love.update(dt)
    c = c + 0.1
end

function love.draw()
    R.clear()

    for x,row in pairs(map) do
        for y,c in pairs(row) do

            love.graphics.setColor(
                c.r,
                c.g,
                c.b,
                c.a
            )

            if Color.isTransparent(c) ~= nil then
                if Color.isWhite(c) then
                    local yPos = TILE_SIZE * TILE_SCALE
                    love.graphics.draw(tiles, floor, x * (TILE_SIZE * TILE_SCALE) , y * (TILE_SIZE * TILE_SCALE), 0, TILE_SCALE, TILE_SCALE)
                     --R.drawTile(tiles, x,y)
                end
            end
        end
    end

    love.graphics.rectangle("fill", 200 + math.cos(c) * 100, 200 + math.sin(c) * 100, 32,32)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end

  if key == "space" then
      print("Space")
  end
end

