local R  = require "game.gfx.Renderer"
local Color  = require "game.gfx.Color"
require 'game.global'

local c = 0

local img   = love.image.newImageData("assets/map.png")
love.graphics.setDefaultFilter("nearest", "nearest")

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

        if Color.isWhite(c) then

            NORTH = map[x][y-1]
            if NORTH == nil then
                Renderer.drawTile(tilesheet , x,(y * TILE_SIZE) - TILE_SCALE)
            else
                love.graphics.setColor(1,1,1,1)
            end

            Renderer.drawTile(tilesheet , x,y)
        end
    end
  end

  love.graphics.rectangle("fill", 200 + math.cos(c) * 100, 200 + math.sin(c) * 100, 32,32)
end

function mapBoundsCheck(x,y, width, height)
  return x < 1 or x > width or y < 1 or y > height
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end

  if key == "space" then
    print("Space")
  end
end

