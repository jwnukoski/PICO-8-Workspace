MenuGameCompleted = {}
MenuGameCompleted.__index = MenuGameCompleted

-- Constructor
function MenuGameCompleted.new()
    local self = setmetatable({}, MenuGameCompleted)
    self.x = x
    self.y = y
    self.text = text
    self.color = color
    self.time = time or 0
    self.counter = 0
    self.alive = true
    add(MENUS, self)
    return self
end

function MenuGameCompleted:draw()
    if not self.alive then
        return
    end

    
end

function MenuGameCompleted:update()
    if not self.alive then
        return
    end
    
    if (SCREEN.frameInFPS == 0) then
        self.counter = self.counter + 1
        return
    end

    PLAYER:kill()
end

function MenuGameCompleted:reset()
    self.text = ""
    self.color = COLOR.WHT
end

function MenuGameCompleted:kill()
    self.alive = false
end