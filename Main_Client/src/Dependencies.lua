-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
--
-- https://github.com/Ulydev/push
push = require 'lib/push'
-- https://github.com/camchenry/sock.lua
sock = require 'lib/sock'
-- https://github.com/gvx/bitser
bitser = require 'lib/bitser'
--binser = require "spec.binser"
-- the "Class" library we're using will allow us to represent anything in
-- our game as code, rather than keeping track of many disparate variables and
-- methods
--
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

-- a few global constants, centralized
require 'src/constants'

-- a basic StateMachine class which will allow us to transition to and from
-- game states smoothly and avoid monolithic code in one file


require 'src/Pawn'

require 'src/StateMachine'
require 'src/Dice'
-- each of the individual states our game can be in at once; each state has
-- its own update and render methods that can be called by our state machine
-- each frame, to avoid bulky code in main.lua
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/Move'
require 'src/states/EscapeState'