Dice = Class{}


function Dice:init()
	self.dice1 = 0
	self.dice2 = 0 
	
end

function Dice:update(dt)


end

function Dice:render()


	math.randomseed(os.time())
	

	if love.keyboard.isDown('tab') then
		 
		dice = true	
		client:setSendMode("unsequenced")
		client:send("dice", dice)
   		--dice = false
   		--client:send("dice", dice)
	end
	
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print( tostring(dice1), 75,150 , 0, 1.8, 1.8, 0, 0, 0, 0)
	love.graphics.print( tostring(dice2), 85,150 , 0, 1.8, 1.8, 0, 0, 0, 0)
   
end