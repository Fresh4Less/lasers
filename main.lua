Gamestate = require "hump.gamestate"
Camera = require "hump.camera"
Class = require "hump.class"
vector = require "hump.vector"

Player = require "player"
Block = require "block"

local game = {}

function game:enter()
	self.cam = Camera(0, 0)
	
	self.player = Player(vector(0, 0))
	self.block = Block(vector(0, 0))
end
function game:update()
	
end
function game:draw()
	
end

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
end