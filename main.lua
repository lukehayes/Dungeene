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

                local NORTH = map[x][y-1]
                local SOUTH = map[x][y+1]
                local EAST = map[x+1][y]
                local WEST = map[x-1][y]

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

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end

  if key == "space" then
      print("Space")
  end
end

