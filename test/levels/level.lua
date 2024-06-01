Level = {}
Level.__index = Level
Level.BACKGROUNDS = { "SKY", "SPACE" }

-- High level class. Levels have actions.
function Level.new(actions, endFrame, endCallback, background)
    local self = setmetatable({}, Level)
    
    self.alive = false
    self.actions = actions -- list of actions
    self.endFrame = endFrame -- when the level is over
    self.endCallback = endCallback -- what do do when level is over an no enemies are left
    self.secondsInLvl = 0

    -- Determine background
    self.background = background
    if self.background < 0 or self.background > #Level.BACKGROUNDS then
        self.background = Level.BACKGROUNDS[1]
    else
        self.background = Level.BACKGROUNDS[self.background]
    end
    log(self.background)


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

    if self.secondsInLvl >= self.endFrame and #ENEMIES == 0 then
        self:endCallback() -- not an 'action' instance, just a function
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
        return COLOR.DRK_BLU
    end

    return COLOR.BLK
end

function Level:bkgDecorFactory()
    if self.background == Level.BACKGROUNDS[1] then
        return Cloud.new(flr(rnd(SCREEN.WIDTH)), -16)
    end

    if self.background == Level.BACKGROUNDS[2] then
        return Star.new(flr(rnd(SCREEN.WIDTH)), -8)
    end
end

function Level:setup()
    self.secondsInLvl = 0
    self.alive = true
end