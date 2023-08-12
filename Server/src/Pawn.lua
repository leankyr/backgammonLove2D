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

function Pawn:update(dt)
	if self.id == id then
		if dx == 1 then
			self.x = self.x + dx
			if self.x > 290 then
				self.x = 290
			end	
		elseif dx == -1 then 
			self.x = self.x + dx
			if self.x < 10 then
				self.x = 10
			end
		end
		if dy == -1 then
			self.y = self.y + dy
			if self.y < 10 then
				self.y = 10
			end
		elseif dy == 1 then 
			self.y = self.y + dy
			if self.y > 290 then
				self.y = 290
			end	   	
		end
	end
	server:setSendMode("unsequenced")
	server:sendToAll("render",{self.color, self.id, self.x, self.y})
end

