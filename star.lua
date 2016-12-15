local Star = {}
Star.__index = Star

function Star.new(size, location, screenSize)
  local self = setmetatable({}, Star)

  self.radius = size
  self.color = {255, 255, 255}
  self.location = location
  self.y = location.y
  self.x = location.x
  self.screenSize = screenSize
  self.speed = 100
  self.warp = false

  return self
end

function Star:draw()
  love.graphics.setColor(self.color[1], self.color[2], self.color[3])
  love.graphics.circle('fill', self.x, math.floor(self.y), self.radius)
end

function Star:update(dt)
  self.y = self.y + self.speed * dt

  if self.y >= self.screenSize.height + 10 then
    self.y = self.y - self.screenSize.height - math.random(5, 20)
    self.x = math.random(0, self.screenSize.width)
  end
end

function Star:toggleWarp()
  if not self.warp then
    self.speed = 1000
    self.warp = true
  else
    self.speed = 100
    self.warp = false
  end
end

function Star:keypressed(key, scancode, isrepeat)
  if scancode == 'space' then
    self:toggleWarp()
  end
end

return Star
