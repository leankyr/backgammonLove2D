Pawn = Class{}

function Pawn:init(id, x, y ,c)
	self.dx = 0
	self.dy = 0

	self.x = x
	self.y = y 
	self.c = c
	self.id = id
	self.world = love.physics.newWorld(0, 0)
end

function Pawn:update(dt)
	local speed = 1
	if love.keyboard.isDown(self.id) then
		if love.keyboard.isDown('right') then
			self.dx = speed
		elseif love.keyboard.isDown('left') then
		   	self.dx = -speed
		else
		 	self.dx = 0
		 	 	
		end
		if love.keyboard.isDown('up') then
			self.dy = -speed
		elseif love.keyboard.isDown('down') then
		   	self.dy = speed
		else
			self.dy = 0 	
		end
		client:setSendMode("unsequenced")
		client:send("position", {self.id, self.dx, self.dy})
	end
	client:update()
end

function Pawn:render(x, y, c)
	self.x = x
	self.y = y

	-- body that stores velocity and position and all fixtures
	if(self. x ~= nil and self.y ~= nil) then
		boxBody = love.physics.newBody(self.world, self.x, self.y, 'dynamic')
		-- shape that we will attach using a fixture to our body for collision detection
		--boxShape = love.physics.newRectangleShape(20, 20)
		circle = love.physics.newCircleShape( self.x, self.y, 12 )
		-- fixture that attaches a shape to our body
		--boxFixture = love.physics.newFixture(boxBody, boxShape)
		boxFixture = love.physics.newFixture(boxBody, circle)

		if c == 'g' then
			love.graphics.setColor(0, 1, 0, 1)
			--love.graphics.polygon('fill', boxBody:getWorldPoints(boxShape:getPoints()))
			love.graphics.ellipse('fill', self.x, self.y, 12, 12, 100)
			love.graphics.setColor(1, 1, 1, 1)
			love.graphics.print(self.id, self.x, self.y, 0, 1.8,1.8 ,0, 0, 0, 0)
		elseif c == 'o' then
			love.graphics.setColor(1, 0.647, 0, 1)
			--love.graphics.polygon('fill', boxBody:getWorldPoints(boxShape:getPoints()))
			love.graphics.ellipse('fill', self.x, self.y, 12, 12, 100)
			love.graphics.setColor(1, 1, 1, 1)
			love.graphics.print(self.id, self.x, self.y, 0, 1.8 ,1.8 ,0, 0, 0, 0)
		end
	end
end


function Pawn:CheckXY()
	if love.keyboard.wasReleased(self.id) then
		print("I am in was released block")
		if self.x > 245 and self.x < 265 then
			self.x = 255
		elseif self.x > 224 and self.x < 245 then
			self.x = 234
		elseif self.x > 203 and self.x < 224 then
			self.x = 213
		elseif self.x > 182 and self.x < 203 then
			self.x = 192
		elseif self.x > 161 and self.x < 182 then
			self.x = 171
		elseif self.x > 140 and self.x < 161 then
			self.x = 150
		elseif self.x > 124 and self.x < 145 then
			self.x = 134
		elseif self.x > 103 and self.x < 124 then
			self.x = 113
		elseif self.x > 82 and self.x < 103 then
			self.x = 92
		elseif self.x > 60 and self.x < 82 then
			self.x = 70
		elseif self.x > 39 and self.x < 60 then
			self.x = 48
		elseif self.x > 18 and self.x < 39 then
			self.x = 27
		end

	------------------------------------------------

		if self.y > 268 and self.y < 290 then
			self.y = 278
		elseif self.y > 244 and self.y < 268 then
			self.y = 254
		elseif self.y > 220 and self.y < 244 then
			self.y = 230
		elseif self.y > 196 and self.y < 220 then
			self.y = 206
		elseif self.y > 170 and self.y < 196 then
			self.y = 182
		elseif self.y > 103 and self.y < 127 then
			self.y = 113
		elseif self.y > 79 and self.y < 103 then
			self.y = 89
		elseif self.y > 55 and self.y < 79 then
			self.y = 65
		elseif self.y > 31 and self.y < 55 then
			self.y = 41
		elseif self.y > 5 and self.y < 31 then
			self.y = 17
		end
	end
end











