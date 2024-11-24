local R      = require "game.gfx.Renderer"
local Color  = require "game.gfx.Color"
local Map    = require "game.map.Map"
require 'game.global'

local map = Map("assets/map.png")
map:buildMap()

function love.load()
end

function love.update(dt)
end

function love.draw()
  R.clear()
  map:draw()
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end

  if key == "space" then
    print("Space")
  end
end

