Star = {}
Star.__index = Star

function Star.new(x, y)
    local self = setmetatable({}, Star)

    self.x = x
    self.y = y
    self.alive = true
    
    -- Cheap distance effect
    self.speed = flr(rnd(3)) + 1
    
    self.color = COLOR.DRK_GRY
    if (self.speed == 2) then
        self.color = COLOR.LGT_GRY
    elseif (self.speed == 3) then
        self.color = COLOR.WHT
    end

    return self
end

function Star:draw()
    if not self.alive then
        return
    end

    rectfill(self.x, self.y, self.x, self.y, self.color)
end

function Star:update()
    if not self.alive then
        return
    end

    self.y = self.y + self.speed

    if self.y > SCREEN.HEIGHT then
        self:kill()
    end
end

function Star:kill()
    self.alive = false
end