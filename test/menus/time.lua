MenuTime = {}
MenuTime.__index = MenuTime
MenuTime.X = SCREEN.WIDTH / 2 + 32
MenuTime.Y = SCREEN.HEIGHT

-- Constructor
function MenuTime.new()
    local self = setmetatable({}, MenuTime)
    self.time = 0
    self.alive = true
    add(MENUS, self)
    return self
end

function MenuTime:draw()
    if not self.alive then
        return
    end
    
    print(ASCII.HR_GLASS .. self.time, self.X, self.Y, COLOR.WHT)      
end

function MenuTime:update()
    if not self.alive then
        return
    end

    if not PLAYER.alive then
        self:kill()
        return
    end

    if SCREEN.frameInFPS == 0 then
        self.time = self.time + 1
    end
end

function MenuTime:kill()
    self.alive = false
end

function MenuTime:reset()
    self.time = 0
    self.alive = true
end