Action = {}
Action.__index = Action

-- Level action based on frame timing. Acts as a timed callback.
function Action.new(frame, action)
    local self = setmetatable({}, Action)

    self.frame = frame
    self.action = action
    self.alive = true

    return self
end

function Action:update(secondsInLvl)
    if not self.alive then
        return
    end

    if self.frame == secondsInLvl then
        self:action()
        log("CALL " .. self.frame)
        log("with " .. SCREEN.frameInFPS)
        self:kill()
    end
end

function Action:kill()
    self.alive = false
end