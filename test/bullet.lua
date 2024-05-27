Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x, y, xAmt, yAmt, isPlayer, type)
    local self = setmetatable({}, Bullet)

    self.x = x
    self.y = y
    self.xAmt = xAmt
    self.yAmt = yAmt
    self.isPlayer = isPlayer
    self.type = type
    self.alive = true

    self.spriteIndex = 209
    if (self.type == "player") then
        self.spriteIndex = 208
    end

    return self
end

function Bullet:draw()
    -- Debug purposes only
    if (not self.visible) or (not self.alive) then
        return
    end

    rect(self.x, self.y, self.x + self.w, self.y + self.h, COLOR.RED)
end

function Bullet:kill()
    self.alive = false
    self.visible = false
end