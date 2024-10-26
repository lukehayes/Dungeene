local R      = require "game.gfx.Renderer"
local Color  = require "game.gfx.Color"
local Map    = require "game.map.Map"
require 'game.global'

local map = Map("assets/map.png")
map:buildMap()

local c = 0

function love.load()
end

function love.update(dt)
  c = c + 0.1
end

function love.draw()
  R.clear()
  map:draw()
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

