require 'src/Dependencies'

--[[
    Called just once at the beginning of the game; used to set up
    game objects, variables, etc. and prepare the game world.
]]
function love.load()
    -- Creating a server on any IP, port 22122
    server = sock.newServer("*", 27002, 10, 3, 10000000,10000000)

    ip = server:getSocketAddress()
    print (ip)
    server:setSerialization(bitser.dumps, bitser.loads)
    -- Called when someone connects to the server
   server:on("connect", function(data, client)
    
        -- Send a message back to the connected client
        local msg = "Hello from the server!"
        client:send("hello", msg)
    end)

    server:on("greeting", function(data, client)
    server:setSerialization(bitser.dumps, bitser.loads)
        -- Send a message back to the connected client   
        local msg = data     
       print("The client sent: " .. msg)
    end)


    server:on("position", function(data, client)
    server:setSerialization(bitser.dumps, bitser.loads)
    --    -- Send a message back to the connected client

        id = data[1]
        dx = data[2]
        dy = data[3]
     end)

    server:on("escape", function(data, client)
        escape = data
    end)

    server:on("dice", function(data, client)
    server:setSerialization(bitser.dumps, bitser.loads)
        -- Send a message back to the connected client   
         dice = data     
       print("The client sent that dice is: ", dice)
    end)

    server:on("game", function(data, client)
        server:setSerialization(bitser.dumps, bitser.loads)
        -- Send a message back to the connected client
        game = data[1]
        print("The game is:", game)
    end)


    -- seed the RNG so that calls to random are always random
    math.randomseed(os.time())

    -- the state machine we'll be using to transition between various states
    -- in our game instead of clumping them together in our update and draw
    -- methods
    --
    -- our current game state can be any of the following:
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
         ['play'] = function() return PlayState() end,
         ['play2'] = function() return PlayState2() end,
         ['play3'] = function() return PlayState3() end
    }
    gStateMachine:change('start')
end


function love.update(dt)
    -- this time, we pass in dt to the state object we're currently using
    gStateMachine:update(dt)
   server:update()
end


