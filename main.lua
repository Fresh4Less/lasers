Gamestate = require "hump.gamestate"
Camera = require "hump.camera"
Class = require "hump.class"
vector = require "hump.vector"

Player = require "player"
Block = require "block"

local game = {}

function game:enter()
	self.cam = Camera(0, 0)
	
	self.walls = {}

	self.player = Player(vector(100, 100), self.walls)

	table.insert(self.walls, Block(vector(200, 200), vector(32, 32)))
	table.insert(self.walls, Block(vector(0, 0), vector(800, 600)))
end
function game:update(dt)
	self.player:update(dt)

	for i,block in ipairs(self.walls) do
		block:update(dt)
	end
end
function game:draw()
	self.player:draw()
	for i,block in ipairs(self.walls) do
		block:draw(dt)
	end
end

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
end