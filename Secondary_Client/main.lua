require 'src/Dependencies'



--[[
    Called just once at the beginning of the game; used to set up
    game objects, variables, etc. and prepare the game world.
]]
function love.load()
        -- Creating a new client on localhost:22122
    client = sock.newClient("localhost", 27002)
    --client = sock.newClient("172.19.224.1", 22122)
    --client = sock.newClient("25.74.149.78", 22122)
    --client = sock.newClient("192.168.1.13", 27002)

    client:setSerialization(bitser.dumps, bitser.loads)
    -- Creating a client to connect to some ip address
    --client = sock.newClient("198.51.100.0", 22122)

    -- Called when a connection is made to the server
    client:on("connect", function(data)
        print("Client connected to the server.")
    end)
    
    -- Called when the client disconnects from the server
    client:on("disconnect", function(data)
        print("Client disconnected from the server.")
    end)

    -- Custom callback, called whenever you send the event from the server
    client:on("hello", function(msg)
        print("The server replied: " .. msg)

    end)
    pi = {}    
    px = {}
    py = {}   
    pc = {}
    client:on("render", function(data)


    color = data[1]
    pi[data[2]] = data[2]
    px[data[2]] = data[3]
    py[data[2]] = data[4]
    

    end)
    
    client:on("render_dice", function(data)

    dice1 = data[1]
    dice2 = data[2]    

    end)

    client:connect()
    client:send("greeting", "Hello, my name is George!.")


-----------------------------------------------------------------------
-----------------------------------------------------------------------

    -- set love's default filter to "nearest-neighbor", which essentially
    -- means there will be no filtering of pixels (blurriness), which is
    -- important for a nice crisp, 2D look
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- seed the RNG so that calls to random are always random
    math.randomseed(os.time())

    -- set the application title bar
    love.window.setTitle('Backgamon')

    -- initialize our nice-looking retro text fonts
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    love.graphics.setFont(gFonts['small'])

    -- load up the graphics we'll be using throughout our states
    gTextures = {
        ['background'] = love.graphics.newImage('graphics/board.png'),
    }
    
 -- initialize our virtual resolution, which will be rendered within our
    -- actual window no matter its dimensionsi
    -- these constant values are kept in a seperate file
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    -- the state machine we'll be using to transition between various states
    -- in our game instead of clumping them together in our update and draw
    -- methods
    --
    -- our current game state can be any of the following:
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
         ['move'] = function() return PlayState() end
        -- ['play2'] = function() return PlayState2() end,
        -- ['play3'] = function() return PlayState3() end
    }
    gStateMachine:change('start')

    -- a table we'll use to keep track of which keys have been pressed this
    -- frame, to get around the fact that LÖVE's default callback won't let us
    -- test for input from within other functions
    love.keyboard.keysPressed = {}
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
    --world:update(dt)

    -- reset keys pressed
    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
    love.mouse.keysPressed = {}
    
    --client:send("greeting", "Hello, my name is George!")
    --client:send("isShooting", true)
    --client:send("position", {"o", 465.3, 50})
    client:update()



end

--[[
    A callback that processes key strokes as they happen, just the once.
    Does not account for keys that are held down, which is handled by a
    separate function (`love.keyboard.isDown`). Useful for when we want
    things to happen right away, just once, like when we want to quit.
]]

--[[
    A custom function that will let us test for individual keystrokes outside
    of the default `love.keypressed` callback, since we can't call that logic
    elsewhere by default.
]]

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true
end

function love.keyreleased(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysReleased[key] = true
end

----------------------------------------------
--[[
function love.mousepressed(x, y, key)
    love.mouse.keysPressed[key] = true
end

function love.mousereleased(x, y, key)
    love.mouse.keysReleased[key] = true 
end
--]]
-------------------------------------------
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end


-------------------------------------------

function love.keyboard.wasReleased(key)
    return love.keyboard.keysReleased[key]
end

function love.keyboard.wasReleased(key)
    if love.keyboard.keysReleased[key] then
        return true
    else
        return false
    end
end

----------------------------
--[[
function love.mouse.wasPressed(key)
    return love.mouse.keysPressed[key]
end

function love.mouse.wasReleased(key)
    return love.mouse.keysReleased[key]
end
--]]

--[[
    Called each frame after update; is responsible simply for
    drawing all of our game objects and more to the screen.
]]
function love.draw()
    -- begin drawing with push, in our virtual resolution
    -- push:apply('start') !! this one was deprecated !!
    push:start()

    -- background should be drawn regardless of state, scaled to fit our
    -- virtual resolution
    local backgroundWidth = gTextures['background']:getWidth()
    local backgroundHeight = gTextures['background']:getHeight()

    love.graphics.draw(gTextures['background'], 
        -- draw at coordinates 0, 0
        0, 0, 
        -- no rotation
        0,
        -- scale factors on X and Y axis so it fills the screen
        VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))
    
    -- use the state machine to defer rendering to the current state we're in
    gStateMachine:render()
    
    -- display FPS for debugging; simply comment out to remove
    displayFPS()
    
    push:finish()
    -- push:apply('end')
end

--[[
    Renders the current FPS.
]]
function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end
