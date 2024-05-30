MenuText = {}
MenuText.__index = MenuText

-- Constructor
function MenuText.new(x, y, text, color, time)
    local self = setmetatable({}, MenuText)
    self.x = x
    self.y = y
    self.text = text
    self.color = color
    self.time = time or 0
    self.counter = 0
    self.alive = true
    add(menus, self)
    return self
end

function MenuText:draw()
    if not self.alive then
        return
    end

    print(self.text, self.x, self.y, self.color)
end

function MenuText:update()
    if not self.alive then
        return
    end
    
    if (self.time == 0) then
        return
    end

    self.counter = self.counter + 1
    if (self.counter >= self.time) then
        self:kill()
    end
end

function MenuText:reset()
    self.text = ""
    self.color = COLOR.WHT
end

function MenuText:kill()
    self.alive = false
end