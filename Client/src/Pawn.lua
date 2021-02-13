


Pawn = Class{}


function Pawn:init(id, x, y ,c)
	--self.x = 0
	--self.y = 0	
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
			--self.x = self.x + self.dx
		elseif love.keyboard.isDown('left') then 
		   	self.dx = -speed
			--self.x = self.x + self.dx	  
		else
		 	self.dx = 0
		 	 	
		end
		if love.keyboard.isDown('up') then
			self.dy = -speed
			--self.y = self.y + self.dy
		elseif love.keyboard.isDown('down') then 
		   	self.dy = speed
			--self.y = self.y + self.dy	  
		else 
			self.dy = 0 	
		end
		--print(self.id)
		--print(self.dx)
		--print(self.dy)
		client:send("position", {self.id, self.dx, self.dy})
	end
	--if love.math.random() > 0.99 then
		
	--end

	client:update()

end

function Pawn:render(x, y, c)

	 
    --self:ReadFromFile() 	
	

	    -- body that stores velocity and position and all fixtures
    boxBody = love.physics.newBody(self.world, x, y, 'dynamic')
    --print('Hey!!')
    -- shape that we will attach using a fixture to our body for collision detection
   boxShape = love.physics.newRectangleShape(20, 20)

    -- fixture that attaches a shape to our body
    boxFixture = love.physics.newFixture(boxBody, boxShape)

    if c == 'g' then
    	love.graphics.setColor(0, 1, 0, 1)
    	love.graphics.polygon('fill', boxBody:getWorldPoints(boxShape:getPoints()))
    	love.graphics.setColor(1, 1, 1, 1)
    	love.graphics.print(self.id, x, y, 0, 1.8,1.8 ,0, 0, 0, 0)
    elseif c == 'o' then
    	love.graphics.setColor(1, 0.647, 0, 1)
    	love.graphics.polygon('fill', boxBody:getWorldPoints(boxShape:getPoints()))
    	love.graphics.setColor(1, 1, 1, 1)
   		love.graphics.print(self.id, x, y, 0, 1.8 ,1.8 ,0, 0, 0, 0)
    end
    
    --self:WriteToFile()

end














