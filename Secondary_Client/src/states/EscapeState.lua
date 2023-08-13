EscapeState = Class{__includes = BaseState}

function EscapeState:init()
    -- nothing to initialize
end

function EscapeState:update()
    gStateMachine:change('start')
end