local go  = require "game.GameObject"
local R  = require "game.gfx.Renderer"
local Color  = require "game.gfx.Color"

local obj = go(100,200)

local img = love.image.newImageData("assets/map.png")
local tiles = love.graphics.newImage("assets/tilesheet.png", {})

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
                    R.drawTile(tiles, x,y)
                end
            end
        end
    end

end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
