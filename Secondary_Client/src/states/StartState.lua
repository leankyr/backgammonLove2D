StartState = Class{__includes = BaseState}

-- whether we're highlighting "Start" or "High Scores"
local highlighted = 1

function StartState:update(dt)
    -- toggle highlighted option if we press an arrow key up or down

    -- we no longer have this globally, so include here
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end


    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateMachine:change('play')
        end
    end
end

function StartState:render()
    -- title
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("Backgamon", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')
    
    -- instructions
    love.graphics.setFont(gFonts['medium'])
    -- again we get the same set color bug here as before
    -- if we're highlighting 1, render that option blue
    if highlighted == 1 then
        love.graphics.setColor(103/255, 255/255, 255/255, 255/255)
    end
    love.graphics.printf("play", 0, VIRTUAL_HEIGHT / 2 + 60,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
end
