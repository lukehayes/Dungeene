Object   = require "libs.classic"
local R  = require "game.gfx.Renderer"

Map = Object:extend()

function Map:new(tilesheet_path)
  self.map = {}
  self.img   = love.image.newImageData(tilesheet_path)
  love.graphics.setDefaultFilter("nearest", "nearest")
end

function Map:buildMap()
  for x=0, self.img:getWidth() -1 do

    local row = {}

    for y=0, self.img:getHeight() -1 do
      local c = Color(self.img:getPixel(x,y))
      table.insert(row, c)
    end
    table.insert(self.map, row)
  end
end

function Map:draw()
  for x,row in pairs(self.map) do
    for y,c in pairs(row) do
      if Color.isWhite(c) then
        Renderer.drawTile(tilesheet , x,y)
      end
    end
  end
end

function Map:printMap()
  for x,row in pairs(map) do
    for y,c in pairs(row) do
      if Color.isWhite(c) then
        io.write("o")
      else
        io.write(".")
      end
    end
    io.write("\n")
  end
end

return Map
