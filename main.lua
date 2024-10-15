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
    row[y+2] = c
    --table.insert(row, c)
  end
  map[x+2] = row
  --table.insert(map, row)
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

  for x,row in ipairs(map) do
    for y,c in ipairs(row) do
      love.graphics.setColor(
        c.r,
        c.g,
        c.b,
        c.a
      )

      local scale = TILE_SIZE * TILE_SCALE

      if Color.isWhite(c) then
        local yPos = TILE_SIZE * TILE_SCALE

        -- DRAW FLOOR
        love.graphics.draw(tilesheet, tile_floor, x * scale , y * scale, 0, TILE_SCALE, TILE_SCALE)

        -- DRAW SURROUNDING WALL TILES

          if x >= 1 and x <= 12 then
            print("X is:",x, map[x], map[x+1], map[x-1], "X -1 is:", x-1)
          end

        print(mapBoundsCheck(x,y,12,12))

          NORTH = map[x][y-1]
          SOUTH = map[x][y+1]
          EAST = map[x+1][y]
          WEST = map[x-1][y]
          --local EAST = map[x+1][y]
          --local WEST = map[x-1][y]

        print(
          NORTH,
          SOUTH,
          EAST,
          WEST,
          "END OF PRINT"
        )

          if Color.isTransparent(NORTH) then
            love.graphics.draw(tilesheet, tile_wall, x * scale , y * scale - scale, 0, TILE_SCALE, TILE_SCALE)
          end

          if Color.isTransparent(SOUTH) then
            love.graphics.draw(tilesheet, tile_wall, x * scale , y * scale + scale, 0, TILE_SCALE, TILE_SCALE)
          end

          if Color.isTransparent(EAST) then
            love.graphics.draw(tilesheet, tile_wall, x * scale + scale, y * scale, 0, TILE_SCALE, TILE_SCALE)
          end

          if Color.isTransparent(WEST) then
            love.graphics.draw(tilesheet, tile_wall, x * scale - scale, y * scale, 0, TILE_SCALE, TILE_SCALE)
          end

        --R.drawTile(tiles, x,y)
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

