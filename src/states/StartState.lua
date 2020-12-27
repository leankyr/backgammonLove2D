StartState = Class{__includes = BaseState}

-- whether we're highlighting "Start" or "High Scores"
local highlighted = 1

function StartState:update(dt)
    -- toggle highlighted option if we press an arrow key up or down
    if love.keyboard.wasPressed('up') then 
        if highlighted == 1 then
            highlighted = 3
        elseif highlighted == 2 then
            highlighted = 1
        else 
            highlighted = 2
        end   
    end

    if love.keyboard.wasPressed('down') then 
        if highlighted == 1 then
            highlighted = 2
        elseif highlighted == 2 then
            highlighted = 3
        else 
            highlighted = 1
        end   
    end





    -- we no longer have this globally, so include here
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end


    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateMachine:change('play')
        elseif highlighted == 2 then
            gStateMachine:change('play2')
        elseif highlighted == 3 then
            gStateMachine:change('play3')
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
    love.graphics.printf("Portes", 0, VIRTUAL_HEIGHT / 2 + 60,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

    -- render option 2 blue if we're highlighting that one
    if highlighted == 2 then
        love.graphics.setColor(103/255, 255/255, 255/255, 255/255)
    end
    love.graphics.printf("Plakwto", 0, VIRTUAL_HEIGHT / 2 + 80,
        VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

    if highlighted == 3 then
        love.graphics.setColor(103/255, 255/255, 255/255, 255/255)
    end
    love.graphics.printf("Feuga", 0, VIRTUAL_HEIGHT / 2 + 100,
        VIRTUAL_WIDTH, 'center')


    -- reset the color
    love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
end
