Object   = require "libs.classic"
local R  = require "game.gfx.Renderer"

Map = Object:extend()

function Map:new(tilesheet_path)
  self.map = {}
  self.img   = love.image.newImageData(tilesheet_path)
  love.graphics.setDefaultFilter("nearest", "nearest")
  self.width  = 10
  self.height = 10
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
        Renderer.drawTile(tilesheet, tile_floor, x,y)

        -- Draw walls here
        -- TODO Does not work if the tile is on the edge of the map.
        local NORTH = self.map[x][y-1]
        local SOUTH = self.map[x][y+1]
        local EAST = self.map[x+1][y]
        local WEST = self.map[x-1][y]

        if Color.isTransparent(NORTH) then
            Renderer.drawTile(tilesheet, tile_wall, x,y - 1)
        end

        if Color.isTransparent(SOUTH) then
            Renderer.drawTile(tilesheet, tile_wall, x,y + 1)
        end

        if Color.isTransparent(EAST) then
            Renderer.drawTile(tilesheet, tile_wall, x+1,y)
        end

        if Color.isTransparent(WEST) then
            Renderer.drawTile(tilesheet, tile_wall, x-1,y)
        end

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
