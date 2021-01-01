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
		client:send("dice", dice)
   		--dice = false
   		--client:send("dice", dice)
	end
		
   
end