function love.load()
end

function love.update(dt)
end

function love.draw()
function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end
