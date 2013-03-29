Class = require "hump.class"
vector = require "hump.vector"

Block = Class {
	init = function(self, pos) 
		self.pos = pos
	end
}
function Block:update(dt)

end
function Block:draw()
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", self.pos.x, self.pos.y, 32, 32)
end

return Block