PlayState = Class{__includes = BaseState}

function PlayState:init()
	
  self.world = love.physics.newWorld(0, 0)
  self.pawnG1 = Pawn('p')  
  self.pawnG2 = Pawn('q')

  self.pawnG11 = Pawn('r')
  self.pawnG12 = Pawn('s')
  self.pawnG13 = Pawn('t')
  self.pawnG14 = Pawn('u')
  self.pawnG15 = Pawn('v')

  self.pawnG3 = Pawn('z')
  self.pawnG4 = Pawn('1')
  self.pawnG5 = Pawn('2')
  self.pawnG6 = Pawn('3')
  self.pawnG7 = Pawn('4')

  self.pawnG8 = Pawn('w')
  self.pawnG9 = Pawn('x')
  self.pawnG10 = Pawn('y')
 

  self.Dice = Dice()

  self.pawnO1 = Pawn('a')  
  self.pawnO2 = Pawn('b')

  self.pawnO11 = Pawn('c')
  self.pawnO12 = Pawn('d')
  self.pawnO13 = Pawn('e')
  self.pawnO14 = Pawn('f')
  self.pawnO15 = Pawn('g')

  self.pawnO3 = Pawn('k')
  self.pawnO4 = Pawn('l')
  self.pawnO5 = Pawn('m')
  self.pawnO6 = Pawn('n')
  self.pawnO7 = Pawn('o')
 
  self.pawnO8 = Pawn('h')
  self.pawnO9 = Pawn('i')
  self.pawnO10 = Pawn('j')


      

end

function PlayState:update(dt)
	
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
   
   --self.Dice:update(dt)

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

function PlayState:render()
    -- render dice
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


    


end