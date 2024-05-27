Collidable = {}
Collidable.__index = Collidable

-- Constructor
function Collidable.new(x, y, w, h, visible)
    local self = setmetatable({}, Collidable)

    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.visible = visible or false
    self.alive = true

    return self
end

function Collidable:setPos(x, y)
    if not self.alive then
        return
    end

    self.x = x
    self.y = y
end

-- Method to check if the collidable instance collides with another instance. Accepts as callback on collision.
function Collidable:collidesWith(other, callback)
    if (not self.alive) or (not other.alive) then
        return false
    end

    local collided = self.x < (other.x + other.w) and
        (self.x + self.w) > other.x and
        self.y < (other.y + other.h) and
        (self.y + self.h) > other.y

    if collided then
        log("Collided")
        callback()
    end

    return collided
end

function Collidable:draw()
    -- Debug purposes only
    if (not self.visible) or (not self.alive) then
        return
    end

    rect(self.x, self.y, self.x + self.w, self.y + self.h, COLOR.RED)
end

function Collidable:kill()
    self.alive = false
    self.visible = false
end