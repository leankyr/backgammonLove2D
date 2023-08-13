EscapeState = Class{__includes = BaseState}

function EscapeState:init()
    -- nothing to initialize
end

function EscapeState:update()
    client:setSendMode("unsequenced")
    client:send("escape", {true})
    gStateMachine:change('start')
end