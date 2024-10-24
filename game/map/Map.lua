Object   = require "libs.classic"
local R  = require "game.gfx.Renderer"

Map = Object:extend()

function Map:new(tilesheet_path)
  self.map = {}
  self.img   = love.image.newImageData(tilesheet_path)
  love.graphics.setDefaultFilter("nearest", "nearest")
end

function Map:draw()
  for x,row in pairs(map) do
    for y,c in pairs(row) do
      if Color.isWhite(c) then
        Renderer.drawTile(tilesheet , x,y)
      end
    end
  end
end

return Map
