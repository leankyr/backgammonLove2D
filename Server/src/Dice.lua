Dice = Class{}


function Dice:init()
	self.dice1 = 0
	self.dice2 = 0 
	
end

function Dice:update(dt)


end

function Dice:render()


	math.randomseed(os.time())
	

	if dice == true then
		 
		self.dice1 = math.random(1,6)
		self.dice2 = math.random(1,6)	
       
	end
	dice = false
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print( tostring(self.dice1), 75,150 , 0, 1.8, 1.8, 0, 0, 0, 0)
	love.graphics.print( tostring(self.dice2), 85,150 , 0, 1.8, 1.8, 0, 0, 0, 0)
			

	

   
end