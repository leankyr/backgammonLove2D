PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.world = love.physics.newWorld(0, 0)
  self.pawnG1 = Pawn('p')  
  self.pawnG2 = Pawn('q')

  self.pawnG3 = Pawn('r')
  self.pawnG4 = Pawn('s')
  self.pawnG5 = Pawn('t')
  self.pawnG6 = Pawn('u')
  self.pawnG7 = Pawn('v')

  self.pawnG8 = Pawn('w')
  self.pawnG9 = Pawn('x')
  self.pawnG10 = Pawn('y')
  self.pawnG11 = Pawn('z')
  self.pawnG12 = Pawn('1')

  self.pawnG13 = Pawn('2')
  self.pawnG14 = Pawn('3')
  self.pawnG15 = Pawn('4')

  self.Dice = Dice()

  self.pawnO1 = Pawn('a')  
  self.pawnO2 = Pawn('b')

  self.pawnO3 = Pawn('c')
  self.pawnO4 = Pawn('d')
  self.pawnO5 = Pawn('e')
  self.pawnO6 = Pawn('f')
  self.pawnO7 = Pawn('g')

  self.pawnO8 = Pawn('h')
  self.pawnO9 = Pawn('i')
  self.pawnO10 = Pawn('j')
  self.pawnO11 = Pawn('k')
  self.pawnO12 = Pawn('l')
 
  self.pawnO13 = Pawn('m')
  self.pawnO14 = Pawn('n')
  self.pawnO15 = Pawn('o')
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

   if love.keyboard.wasPressed('escape') then
      gStateMachine:change('escape')
   end

end

function PlayState:render()
    -- render dice
   self.pawnG1:render(px['p'], py['p'], 'g')
   self.pawnG2:render(px['q'], py['q'], 'g')
   self.pawnG3:render(px['r'], py['r'], 'g')
   self.pawnG4:render(px['s'], py['s'], 'g')
   self.pawnG5:render(px['t'], py['t'], 'g')
   self.pawnG6:render(px['u'], py['u'], 'g')
   self.pawnG7:render(px['v'], py['v'], 'g')
   self.pawnG8:render(px['w'], py['w'], 'g')
   self.pawnG9:render(px['x'], py['x'], 'g')
   self.pawnG10:render(px['y'], py['y'], 'g')
   self.pawnG11:render(px['z'], py['z'], 'g')
   self.pawnG12:render(px['1'], py['1'], 'g')
   self.pawnG13:render(px['2'], py['2'], 'g')
   self.pawnG14:render(px['3'], py['3'], 'g')
   self.pawnG15:render(px['4'], py['4'], 'g')

    self.Dice:render()

    self.pawnO1:render(px['a'], py['a'], 'o')
    self.pawnO2:render(px['b'], py['b'], 'o')
    self.pawnO3:render(px['c'], py['c'], 'o')
    self.pawnO4:render(px['d'], py['d'], 'o')
    self.pawnO5:render(px['e'], py['e'], 'o')
    self.pawnO6:render(px['f'], py['f'], 'o')
    self.pawnO7:render(px['g'], py['g'], 'o')
    self.pawnO8:render(px['h'], py['h'], 'o')
    self.pawnO9:render(px['i'], py['i'], 'o')
    self.pawnO10:render(px['j'], py['j'], 'o')
    self.pawnO11:render(px['k'], py['k'], 'o')
    self.pawnO12:render(px['l'], py['l'], 'o')
    self.pawnO13:render(px['m'], py['m'], 'o')
    self.pawnO14:render(px['n'], py['n'], 'o')
    self.pawnO15:render(px['o'], py['o'], 'o')
end