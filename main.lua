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

--for x,row in ipairs(map) do
--for y,c in ipairs(row) do
----print(x,y)
--end
--end

--print("------------")

function love.load()
end

function love.update(dt)
  c = c + 0.1
end

function love.draw()

  R.clear()

  for x,row in pairs(map) do
    for y,c in pairs(row) do

        local xIsOne = (x == 1)
        local xIsMax = (x == img:getWidth())
        local yIsOne = (y == 1)
        local yIsMax = (y == img:getHeight())


        if xIsOne then
          WEST = map[1][y]
        else
          WEST = map[x-1][y]
        end

        if xIsMax and not xIsOne then
          WEST = map[x][y]
        else
          WEST = map[x-1][y]
        end



    end
  end
  print("--------------")

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

