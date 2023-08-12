Dice = Class{}


function Dice:init()
	self.dice1 = 0
	self.dice2 = 0 
	
end

function Dice:update(dt)
	math.randomseed(os.time())


	if dice == true then

		self.dice1 = math.random(1,6)
		self.dice2 = math.random(1,6)

	end
	dice = false

	server:setSendMode("unsequenced")
	server:sendToAll("render_dice",{self.dice1, self.dice2})

end