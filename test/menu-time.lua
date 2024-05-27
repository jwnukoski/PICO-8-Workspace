MenuTime = {}
MenuTime.__index = MenuTime
MenuTime.X = SCREEN.WIDTH / 2 + 32
MenuTime.Y = SCREEN.HEIGHT

-- Constructor
function MenuTime.new()
    local self = setmetatable({}, MenuTime)

    self.time = 0

    return self
end

function MenuTime:draw()
    if not player.alive then
        return
    end
    
    print(ASCII.HR_GLASS .. self.time, self.X, self.Y, COLOR.WHT)      
end

function MenuTime:update()
    if not player.alive then
        return
    end

    if SCREEN.frameInFPS == 0 then
        self.time = self.time + 1
    end
end