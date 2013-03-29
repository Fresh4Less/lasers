Class = require "hump.class"
vector = require "hump.vector"

Block = Class {
	init = function(self, pos, size) 
		self.pos = pos
        self.shape = { vector(size.x, 0), vector(0, size.y), vector(-size.x, 0), vector(0, -size.y) }
        self.size = size
	end
}
function Block:update(dt)

end
function Block:draw()
	love.graphics.setColor(0, 0, 255)
	
    local pos = self.pos
    local verts = {}
    for i, v in ipairs(self.shape) do
        table.insert(verts, pos.x)
        table.insert(verts, pos.y)
        pos = pos + v
    end

    love.graphics.polygon("line", verts)
end

return Block