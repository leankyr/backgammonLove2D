StartState = Class{__includes = BaseState}

function StartState:update(dt)
    if game == 'portes' then
        print('portes')
        gStateMachine:change('play')
    elseif game == 'plakwto' then
        print('plakwto')
        gStateMachine:change('play2')
    elseif game == 'feyga' then
        print('feyga')
        gStateMachine:change('play3')
    end
end
