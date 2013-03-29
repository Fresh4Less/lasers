Gamestate = require "hump.gamestate"
Camera = require "hump.camera"

local game = {}

function game:enter()
	self.cam = Camera(0, 0)
end
function game:update()
	
end
function game:draw()
	
end

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(game)
end

Player = Class {
	init = function(self, pos) {
		self.pos = pos
	}
}
function Player:update(dt) {

}
function Player:draw() {

}