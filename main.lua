local R      = require "game.gfx.Renderer"
local Color  = require "game.gfx.Color"
local Map    = require "game.map.Map"
require 'game.global'

local SPACE = 20
local grid = {
  {1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,1,1,1,1,1,1,1,1,1}
}

function GridDraw(grid)

  for x = 1, 10 - 1, 1 do
    for y = 1, 10 - 1, 1 do

      local cell = grid[x][y]

      if cell == 0 then
        love.graphics.rectangle('line', x * SPACE,y * SPACE,10,10)
      else
        love.graphics.rectangle('fill', x * SPACE,y * SPACE,10,10)
      end
    end
  end
end



function love.load()
end

function love.update(dt)
end

function love.draw()
  R.clear()

  GridDraw(grid)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end

  if key == "space" then
    print("Space")
  end
end

