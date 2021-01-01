PlayState2 = Class{__includes = BaseState}

function PlayState2:init()
	self.world = love.physics.newWorld(0, 0)
    print("I am in PlayState2")		
    self.pawnG1 = Pawn(25, 278, self.world, 'g','p')
    self.pawnG2 = Pawn(25, 254, self.world, 'g','q')

    self.pawnG11 = Pawn(25, 278, self.world, 'g','r')
    self.pawnG12 = Pawn(25, 254, self.world, 'g','s')
    self.pawnG13 = Pawn(25, 230, self.world, 'g','t')
    self.pawnG14 = Pawn(25, 206, self.world, 'g','u')
    self.pawnG15 = Pawn(25, 182, self.world, 'g','v')

    self.pawnG3 = Pawn(25, 278, self.world, 'g','z')
    self.pawnG4 = Pawn(25, 254, self.world, 'g','1')
    self.pawnG5 = Pawn(25, 230, self.world, 'g','2')
    self.pawnG6 = Pawn(25, 206, self.world, 'g','3')
    self.pawnG7 = Pawn(25, 182, self.world, 'g','4')

    self.pawnG8 = Pawn(25, 230, self.world, 'g','w')
    self.pawnG9 = Pawn(25, 206, self.world, 'g','x')
    self.pawnG10 = Pawn(25, 182, self.world, 'g','y')
    
    self.Dice = Dice()

	self.pawnO1 = Pawn(25, 17, self.world, 'o','a')
    self.pawnO2 = Pawn(25, 41, self.world, 'o','b')

    self.pawnO11 = Pawn(25, 17, self.world, 'o','c')
    self.pawnO12 = Pawn(25, 41, self.world, 'o','d')
    self.pawnO13 = Pawn(25, 65, self.world, 'o','e')
    self.pawnO14 = Pawn(25, 89, self.world, 'o','f')
    self.pawnO15 = Pawn(25, 113, self.world, 'o','g')


    self.pawnO3 = Pawn(25, 17, self.world, 'o','k')
    self.pawnO4 = Pawn(25, 41, self.world, 'o','l')
    self.pawnO5 = Pawn(25, 65, self.world, 'o','m')
    self.pawnO6 = Pawn(25, 89, self.world, 'o','n')
    self.pawnO7 = Pawn(25, 113, self.world, 'o','o')
    
    self.pawnO8 = Pawn(25, 65, self.world, 'o','h')
    self.pawnO9 = Pawn(25, 89, self.world, 'o','i')
    self.pawnO10 = Pawn(25, 113, self.world, 'o','j')

    

      

end

function PlayState2:update(dt)
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

function PlayState2:render()
    -- render pawn
    self.pawnG1:render()  
    self.pawnG2:render()
    self.pawnG3:render()  
    self.pawnG4:render()
    self.pawnG5:render()  
    self.pawnG6:render()
    self.pawnG7:render()  
    self.pawnG8:render()  
    self.pawnG9:render()
    self.pawnG10:render()
    self.pawnG11:render()
    self.pawnG12:render()  
    self.pawnG13:render()  
    self.pawnG14:render()
    self.pawnG15:render()  
    

   self.Dice:render()


    self.pawnO1:render()  
    self.pawnO2:render()
    self.pawnO3:render()  
    self.pawnO4:render()
    self.pawnO5:render() 
    self.pawnO6:render()
    self.pawnO7:render()
    self.pawnO8:render() 
    self.pawnO9:render()
    self.pawnO10:render()
    self.pawnO11:render()
    self.pawnO12:render()
    self.pawnO13:render() 
    self.pawnO14:render()
    self.pawnO15:render()

    


end