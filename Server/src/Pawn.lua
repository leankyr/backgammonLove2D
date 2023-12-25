Pawn = Class{}


function Pawn:init(x, y, world, color, id)
	self.x = x
	self.y = y
	self.world = world
	self.color = color	
	self.dx = 0
	self.dυ = 0
	self.id = id
end

function Pawn:update()
	if (self.id == id) then
		if (self. x ~= x or self.y ~= y) then
			self.x = x
			self.y = y
		end
	end
	server:setSendMode("reliable")
	server:sendToAll("render",{self.color, self.id, self.x, self.y})
end

