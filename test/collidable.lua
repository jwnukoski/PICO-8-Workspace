Collidable = {}
Collidable.__index = Collidable
Collidable.DEBUG = false -- show bounds or not

-- Constructor
function Collidable.new(x, y, w, h, xOffset, yOffset)
    local self = setmetatable({}, Collidable)

    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.xOffset = xOffset or 0
    self.yOffset = yOffset or 0
    self.alive = true

    add(collidables, self)
    self:setPos(x, y)

    return self
end

function Collidable:setPos(x, y)
    if not self.alive then
        return
    end

    self.x = x + self.xOffset
    self.y = y + self.yOffset
end

-- Method to check if the collidable instance collides with another instance. Accepts as callback on collision.
function Collidable:collidesWith(other, callback)
    if (not self.alive) or (not other.alive) then
        return false
    end
    
    local collided = self.x < (other.x + other.w - other.xOffset) and
        (self.x + self.w - self.xOffset) > other.x and
        self.y < (other.y + other.h - other.yOffset) and
        (self.y + self.h - self.yOffset) > other.y

    if collided then
        callback()
    end

    return collided
end

function Collidable:draw()
    -- Debug purposes only
    if (not Collidable.DEBUG) or (not self.alive) then
        return
    end

    rect(self.x, self.y, self.x + self.w, self.y + self.h, COLOR.RED)
end

function Collidable:kill()
    self.alive = false
    self.visible = false
end