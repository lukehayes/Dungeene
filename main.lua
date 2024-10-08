local go  = require "game.GameObject"
local Color  = require "game.gfx.Color"

local obj = go(100,200)

local img = love.image.newImageData("assets/map.png")

local map = {}


for x=1, img:getWidth() do

    local row = {}
    for y=1, img:getHeight() do
        local c = Color(img:getPixel(x-1,y-1))
        table.insert(row, c)
    end

    table.insert(map, row)
end

function love.load()
end

function love.update(dt)
end

function love.draw()

    love.graphics.setColor(
        obj.color.r,
        obj.color.g,
        obj.color.b,
        obj.color.a
    )

    love.graphics.rectangle(
        "fill",
        obj.position.x,
        obj.position.y,
        obj.size.x,
        obj.size.y
    )

    for x,row in pairs(map) do
        for y,c in pairs(row) do
            print(x,y,c)

            --love.graphics.setcolor(
                --c.r,
                --c.g,
                --c.b,
                --c.a
            --)

            --love.graphics.rectangle(
                --"fill",
                --x * 16,
                --y * 16,
                --16,
                --16
            --)
        end
    end


end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
