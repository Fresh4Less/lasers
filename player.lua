Class = require "hump.class"
vector = require "hump.vector"

Player = Class {
	init = function(self, pos, walls) 
		self.pos = pos
		self.walls = walls
		self.direction = vector(1, 0)
	end
}
function Player:update(dt)
	local mousePosition = vector(love.mouse.getPosition())
	
	self.direction = (mousePosition - self.pos):normalized()

	self.laserPositions = {}
	self.laserEndpoints = {}
	self.laserVectors = {}
	self.laserTs = {}
	self.laserDirections = {}

	local currentPos = self.pos + 8 * self.direction
	local currentDirection = self.direction
	print("----")
	local oldPos, oldVec
	for _ = 1, 3 do
		local closestPos, closestVec, closestT
		for _, block in ipairs(self.walls) do
			local pos = block.pos
			for _, vec in ipairs(block.shape) do
				local cross = currentDirection:cross(vec)
				if cross ~= 0 then
					local t = ((pos - currentPos):cross(vec) / cross)
					local u = ((pos - currentPos):cross(currentDirection) / cross)
					local intersection = currentPos + (t * currentDirection)
					if u >= 0 and u <= 1 and t > .1 then
						if (not closestPos and not closestVec and not closestT) or t < closestT then
							closestPos = pos
							closestVec = vec
							closestT = t
						end
					end
				end
				pos = pos + vec
			end
		end
		if closestPos and closestVec and closestT then
			oldPos = closestPos
			oldVec = closestVec
			table.insert(self.laserPositions, currentPos)
			table.insert(self.laserEndpoints, closestPos)
			table.insert(self.laserVectors, closestVec)
			table.insert(self.laserTs, closestT)
			table.insert(self.laserDirections, currentDirection)
			currentPos = currentPos + currentDirection * closestT
			currentDirection = (-currentDirection):mirrorOn(closestVec:perpendicular():normalize_inplace())
			print(currentPos, currentDirection, closestT)
		else
			break
		end
	end
end
function Player:draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("line", self.pos.x, self.pos.y, 8, 16)

	for i, _ in ipairs(self.laserPositions) do
		local endpoint = self.laserPositions[i] + self.laserTs[i] * self.laserDirections[i]
		love.graphics.line(self.laserPositions[i].x, self.laserPositions[i].y, endpoint.x, endpoint.y)
	end
end

return Player