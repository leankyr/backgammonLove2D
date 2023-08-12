PlayState3 = Class{__includes = BaseState}

function PlayState3:init()
    self.world = love.physics.newWorld(0, 0)
    self.pawnG1 = Pawn(279, 278, self.world, 'g','p')
    self.pawnG2 = Pawn(279, 254, self.world, 'g','q')

    self.pawnG11 = Pawn(279, 278, self.world, 'g','r')
    self.pawnG12 = Pawn(279, 254, self.world, 'g','s')
    self.pawnG13 = Pawn(279, 230, self.world, 'g','t')
    self.pawnG14 = Pawn(279, 206, self.world, 'g','u')
    self.pawnG15 = Pawn(279, 182, self.world, 'g','v')

    self.pawnG3 = Pawn(279, 278, self.world, 'g','z')
    self.pawnG4 = Pawn(279, 254, self.world, 'g','1')
    self.pawnG5 = Pawn(279, 230, self.world, 'g','2')
    self.pawnG6 = Pawn(279, 206, self.world, 'g','3')
    self.pawnG7 = Pawn(279, 182, self.world, 'g','4')

    self.pawnG8 = Pawn(279, 230, self.world, 'g','w')
    self.pawnG9 = Pawn(279, 206, self.world, 'g','x')
    self.pawnG10 = Pawn(279, 182, self.world, 'g','y')
    
    self.Dice = Dice()

	self.pawnO1 = Pawn(27, 17, self.world, 'o','a')
    self.pawnO2 = Pawn(27, 41, self.world, 'o','b')

    self.pawnO11 = Pawn(27, 17, self.world, 'o','c')
    self.pawnO12 = Pawn(27, 41, self.world, 'o','d')
    self.pawnO13 = Pawn(27, 65, self.world, 'o','e')
    self.pawnO14 = Pawn(27, 89, self.world, 'o','f')
    self.pawnO15 = Pawn(27, 113, self.world, 'o','g')


    self.pawnO3 = Pawn(27, 17, self.world, 'o','k')
    self.pawnO4 = Pawn(27, 41, self.world, 'o','l')
    self.pawnO5 = Pawn(27, 65, self.world, 'o','m')
    self.pawnO6 = Pawn(27, 89, self.world, 'o','n')
    self.pawnO7 = Pawn(27, 113, self.world, 'o','o')
    
    self.pawnO8 = Pawn(27, 65, self.world, 'o','h')
    self.pawnO9 = Pawn(27, 89, self.world, 'o','i')
    self.pawnO10 = Pawn(27, 113, self.world, 'o','j')
end

function PlayState3:update(dt)
	self.pawnG1:update(dt) 
    self.pawnG2:update(dt)
    self.pawnG3:update(dt)  
    self.pawnG4:update(dt)
    self.pawnG5:update(dt)
    self.pawnG6:update(dt)
    self.pawnG7:update(dt)
    self.pawnG8:update(dt)
    self.pawnG9:update(dt)
    self.pawnG10:update(dt)
    self.pawnG11:update(dt)
    self.pawnG12:update(dt)
    self.pawnG13:update(dt)
    self.pawnG14:update(dt)
    self.pawnG15:update(dt)

    self.Dice:update(dt)

    self.pawnO1:update(dt) 
    self.pawnO2:update(dt)
    self.pawnO3:update(dt)  
    self.pawnO4:update(dt)
    self.pawnO5:update(dt)
    self.pawnO6:update(dt)
    self.pawnO7:update(dt)
    self.pawnO8:update(dt)
    self.pawnO9:update(dt)
    self.pawnO10:update(dt)
    self.pawnO11:update(dt)
    self.pawnO12:update(dt)
    self.pawnO13:update(dt)
    self.pawnO14:update(dt)
    self.pawnO15:update(dt)
end
