local Ship = {}
Ship.__index = Ship

function Ship.new(location)
  local self = setmetatable({}, Ship)

  self.location = location
  self.shipImage = love.graphics.newImage('images/pirate.png')

  return self
end

function Ship:draw()
  love.graphics.draw(self.shipImage, self.location.x, self.location.y)
end

return Ship
