local go  = require "game.GameObject"

local obj = go(100,200)

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

end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
