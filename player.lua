Class = require "hump.class"
vector = require "hump.vector"

Player = Class {
	init = function(self, pos) 
		self.pos = pos
		self.direction = vector(1, 0)
	end
}
function Player:update(dt)
	local mousePosition = vector(love.mouse.getPosition())
	
	self.direction = (mousePosition - self.pos):normalized()
end
function Player:draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", self.pos.x, self.pos.y, 10)
	
	local endpoint = self.pos + 20 * self.direction
	love.graphics.line(self.pos.x, self.pos.y, endpoint.x, endpoint.y)
end

return Player