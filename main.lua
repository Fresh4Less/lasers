Gamestate = require "hump.gamestate"
Camera = require "hump.camera"
Class = require "hump.class"
vector = require "hump.vector"

Player = require "player"
Block = require "block"

local game = {}

function game:enter()
	self.cam = Camera(0, 0)
	
	self.player = Player(vector(100, 100))
	self.block = Block(vector(200, 200))
end
function game:update(dt)
	self.player:update(dt)
	self.block:update(dt)
end
function game:draw()
	self.player:draw()
	self.block:draw()
end

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
end