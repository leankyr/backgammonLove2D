require 'src/Dependencies'

--[[
    Called just once at the beginning of the game; used to set up
    game objects, variables, etc. and prepare the game world.
]]
function love.load()
    -- Creating a server on any IP, port 22122
    --server = sock.newServer("localhost", 27002, 10, 3, 10000000,10000000)
    server = sock.newServer("*", 27002, 10, 3, 10000000,10000000)
    --server = sock.newServer("172.19.224.1", 22122, 10, 2)
    --server = sock.newServer("192.168.1.13", 22122)
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

    -- a table we'll use to keep track of which keys have been pressed this
    -- frame, to get around the fact that LÖVE's default callback won't let us
    -- test for input from within other functions
end

--[[
    Called whenever we change the dimensions of our window, as by dragging
    out its bottom corner, for example. In this case, we only need to worry
    about calling out to `push` to handle the resizing. Takes in a `w` and
    `h` variable representing width and height, respectively.
]]
--function love.resize(w, h)
--    push:resize(w, h)
--end

--[[
    Called every frame, passing in `dt` since the last frame. `dt`
    is short for `deltaTime` and is measured in seconds. Multiplying
    this by any changes we wish to make in our game will allow our
    game to perform consistently across all hardware; otherwise, any
    changes we make will be applied as fast as possible and will vary
    across system hardware.
]]

function love.update(dt)
    -- this time, we pass in dt to the state object we're currently using
    gStateMachine:update(dt)
   server:update()
end


