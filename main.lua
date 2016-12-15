function love.load()
  Star = require('star')
  Ship = require('ship')

  local screenSize = {
    height = love.graphics.getHeight(),
    width = love.graphics.getWidth()
  }
  stars = generateStars(1000, Star, screenSize)
  ship = Ship.new({x = 368, y = 500})
end

function love.draw()
  drawStars(stars)
  ship:draw()
end

function love.update(dt)
  for i,v in ipairs(stars) do
    v:update(dt)
  end
end

function love.keypressed(key, scancode, isrepeat)
  for i,v in ipairs(stars) do
    v:keypressed(key, scancode, isrepeat)
  end
end

function drawStars(stars)
  for i,v in ipairs(stars) do
    v:draw()
  end
end

function generateStars(numStars, Star, screenSize)
  local result = {}

  for i=1,numStars do
    local size = math.random(1, 5)
    local x = math.random(0, 800)
    local y = math.random(0, 600)

    table.insert(result, Star.new(1, {x = x, y = y}, screenSize))
  end

  return result
end
