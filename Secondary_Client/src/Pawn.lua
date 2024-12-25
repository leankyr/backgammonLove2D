Pawn = Class{}

function Pawn:init(id, x, y ,c)
	self.dx = 0
	self.dy = 0

	self.x = x
	self.y = y
	self.c = c
	self.id = id
	self.captured = false
	self.world = love.physics.newWorld(0, 0)
end

function Pawn:update()
	local cursorX
	local cursorY
	local bool
	if love.mouse.isDown(1) then
		cursorX = love.mouse.getX() * (VIRTUAL_WIDTH/WINDOW_WIDTH)
		cursorY = love.mouse.getY() * (VIRTUAL_HEIGHT/WINDOW_HEIGHT)
		bool = self:pickPawn(cursorX, cursorY)
	end
	if bool and self.captured then
		local x, y = love.mouse.getPosition()
		self.x = x * (VIRTUAL_WIDTH/WINDOW_HEIGHT)
		self.y = y * (VIRTUAL_HEIGHT/WINDOW_HEIGHT)
		client:setSendMode("reliable")
		client:send("position", {self.id, self.x, self.y})
		client:update()

	end
end

function Pawn:render(x, y, c)
	self.x = x
	self.y = y
	if(self.x ~= nil and self.y ~= nil) then
		boxBody = love.physics.newBody(self.world, self.x, self.y, 'dynamic')
		circle = love.physics.newCircleShape( self.x, self.y, PAWN_RADIUS )
		boxFixture = love.physics.newFixture(boxBody, circle)

		if c == 'g' then
			love.graphics.setColor(0, 1, 0, 1)
			love.graphics.ellipse('fill', self.x, self.y, PAWN_RADIUS, PAWN_RADIUS, 100)
			-- 			love.graphics.setColor(1, 1, 1, 1)
			-- 			love.graphics.print(self.id, self.x, self.y, 0, 1.8,1.8 ,0, 0, 0, 0)
		elseif c == 'o' then
			love.graphics.setColor(1, 0.647, 0, 1)
			love.graphics.ellipse('fill', self.x, self.y, PAWN_RADIUS, PAWN_RADIUS, 100)
			-- 			love.graphics.setColor(1, 1, 1, 1)
			-- 			love.graphics.print(self.id, self.x, self.y, 0, 1.8 ,1.8 ,0, 0, 0, 0)
		end
	end
end

function Pawn:pickPawn(cX, cY)
	if(self.x ~= nil and self.y ~= nil) then
		if (self.x - PAWN_RADIUS < cX and cX < self.x + PAWN_RADIUS) and (self.y - PAWN_RADIUS < cY and cY < self.y + PAWN_RADIUS) then
			self.captured = true
			return true
		end
		return false
	end
end

function Pawn:checkXY()
	local finalX
	local finalY
	if self.x > 245 and self.x < 265 then
		finalX = 255
	elseif self.x > 224 and self.x < 245 then
		finalX = 234
	elseif self.x > 203 and self.x < 224 then
		finalX = 213
	elseif self.x > 182 and self.x < 203 then
		finalX = 192
	elseif self.x > 161 and self.x < 182 then
		finalX = 171
	elseif self.x > 140 and self.x < 161 then
		finalX = 150
	elseif self.x > 124 and self.x < 145 then
		finalX = 134
	elseif self.x > 103 and self.x < 124 then
		finalX = 113
	elseif self.x > 82 and self.x < 103 then
		finalX = 92
	elseif self.x > 60 and self.x < 82 then
		finalX = 70
	elseif self.x > 39 and self.x < 60 then
		finalX = 48
	elseif self.x > 18 and self.x < 39 then
		finalX = 27
	end
	------------------------------------------------

	if self.y > 268 and self.y < 290 then
		finalY = 278
	elseif self.y > 244 and self.y < 268 then
		finalY = 254
	elseif self.y > 220 and self.y < 244 then
		finalY = 230
	elseif self.y > 196 and self.y < 220 then
		finalY = 206
	elseif self.y > 170 and self.y < 196 then
		finalY = 182
	elseif self.y > 103 and self.y < 127 then
		finalY = 113
	elseif self.y > 79 and self.y < 103 then
		finalY = 89
	elseif self.y > 55 and self.y < 79 then
		finalY = 65
	elseif self.y > 31 and self.y < 55 then
		finalY = 41
	elseif self.y > 5 and self.y < 31 then
		finalY = 17
	end
	return finalX, finalY
end
