


Pawn = Class{}


function Pawn:init(x, y, world, color, id)
	self.x = x
	self.y = y
	self.xr = 0
	self.yr = 0
	self.world = world
	self.color = color	
	self.dx = 0
	self.dυ = 0
	self.id = id
end

function Pawn:update(dt)
	
	local speed = 1
	if love.keyboard.isDown(self.id) then
		if love.keyboard.isDown('right') then
			self.dx = speed
			self.x = self.x + self.dx
		elseif love.keyboard.isDown('left') then 
		   	self.dx = -speed
			self.x = self.x + self.dx	   	
		end
		if love.keyboard.isDown('up') then
			self.dy = -speed
			self.y = self.y + self.dy
		elseif love.keyboard.isDown('down') then 
		   	self.dy = speed
			self.y = self.y + self.dy	   	
		end
		--print(self.y)
	end
	self:CheckXY()
	

end

function Pawn:render()

	 
    self:ReadFromFile() 	
	

	    -- body that stores velocity and position and all fixtures
    boxBody = love.physics.newBody(self.world, self.x, self.y, 'dynamic')
    --print('Hey!!')
    -- shape that we will attach using a fixture to our body for collision detection
    boxShape = love.physics.newRectangleShape(20, 20)

    -- fixture that attaches a shape to our body
    boxFixture = love.physics.newFixture(boxBody, boxShape)

    if self.color == 'g' then
    	love.graphics.setColor(0, 1, 0, 1)
    	love.graphics.polygon('fill', boxBody:getWorldPoints(boxShape:getPoints()))
    	love.graphics.setColor(1, 1, 1, 1)
    	love.graphics.print(self.id, self.x, self.y, 0, 1.8,1.8 ,0, 0, 0, 0)
    elseif self.color == 'o' then
    	love.graphics.setColor(1, 0.647, 0, 1)
    	love.graphics.polygon('fill', boxBody:getWorldPoints(boxShape:getPoints()))
    	love.graphics.setColor(1, 1, 1, 1)
   		love.graphics.print(self.id, self.x, self.y, 0, 1.8 ,1.8 ,0, 0, 0, 0)
    end
    
    self:WriteToFile()
	
end


function Pawn:CheckXY()
	--print('I am in checkX!!!!')
		if love.keyboard.wasReleased(self.id) then	
		--if love.keyboard.wasPressed(self.id) then		
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
			end

		------------------------------------------------

			if self.x > 124 and self.x < 145 then
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
			end

		---------------------------------------------
			if self.y > 103 and self.y < 127 then
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

function Pawn:WriteToFile()

	file = io.open("C:/Users/leankyr/Desktop/moves.txt", "w")
	io.output(file)
	io.write(self.id)
	io.write("\n")
	io.write(self.x)
	io.write("\n")
	io.write(self.y)
	io.write(" ")
	io.write("\n")
	io.close(file)
end

function Pawn:ReadFromFile()
	file2 = io.open("C:/Users/leankyr/Desktop/moves.txt", "r")
	io.input(file2)
	if self.id == io.read() then
		self.xr = io.read()
		self.yr = io.read()
		 
	end
	io.close(file2)
end



