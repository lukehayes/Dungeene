local go  = require "game.GameObject"
local Color  = require "game.gfx.Color"

local obj = go(100,200)

local img = love.image.newImageData("assets/map.png")

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

            love.graphics.setColor(
                c.r,
                c.g,
                c.b,
                c.a
            )

            love.graphics.rectangle(
                "fill",
                x * 16,
                y * 16,
                16,
                16
            )
        end
    end


end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
