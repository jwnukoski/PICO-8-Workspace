Level = {}
Level.__index = Level
Level.BACKGROUNDS = { "SKY", "SPACE" }

-- High level class. Levels have actions.
function Level.new(actions, endFrame, background)
    local self = setmetatable({}, Level)
    
    self.alive = false
    self.actions = actions -- list of actions
    self.endFrame = endFrame -- when the level is over
    self.secondsInLvl = 0

    -- Determine background
    self.background = background
    if self.background < 0 or self.background > #Level.BACKGROUNDS then
        self.background = Level.BACKGROUNDS[1]
    else
        self.background = Level.BACKGROUNDS[self.background]
    end


    return self
end

function Level:update()
    if not self.alive then
        return
    end

    if SCREEN.frameInFPS == 0 then
        self.secondsInLvl = self.secondsInLvl + 1
    end

    for _, action in ipairs(self.actions) do
        action:update(self.secondsInLvl)
    end

    if self.secondsInLvl == self.endFrame then
        self:kill()
    end
end

function Level:kill()
    for _, action in ipairs(self.actions) do
        action:kill()
    end

    self.alive = false
end

function Level:getClsColor()
    if self.background == Level.BACKGROUNDS[1] then
        return COLOR.BLU
    end

    return COLOR.BLK
end

function Level:bkgDecorFactory()
    if self.background == Level.BACKGROUNDS[1] then
        return Cloud.new(flr(rnd(SCREEN.WIDTH)), -16)
    end

    return Star.new(flr(rnd(SCREEN.WIDTH)), -8)
end

function Level:setup()
    self.secondsInLvl = 0
    self.alive = true
end