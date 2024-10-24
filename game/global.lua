TILE_SIZE  = 16
TILE_MULT  = 3
TILE_SCALE = TILE_SIZE * TILE_MULT

love.graphics.setDefaultFilter("nearest", "nearest")
tilesheet  = love.graphics.newImage("assets/tilesheet.png", {})
tile_floor = love.graphics.newQuad( 0, 0, TILE_SIZE, TILE_SIZE, tilesheet)
tile_wall  = love.graphics.newQuad( 16, 0, TILE_SIZE, TILE_SIZE, tilesheet)
