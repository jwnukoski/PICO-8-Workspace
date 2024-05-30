Explosion = {}
Explosion.__index = Explosion
Explosion.FRAMES = {192, 192, 192, 192, 193, 193, 194, 195}

function Explosion.new(x, y)
    local self = setmetatable({}, Explosion)

    self.x = x
    self.y = y
    self.alive = true
    self.frame = 0
    sfx(0)

    return self
end

function Explosion:update()
    if (not self.alive) then
        return
    end

    if (self.frame < #self.FRAMES) then
        self.frame = self.frame + 1
    else
        self:kill()
    end
end

function Explosion:draw()
    if (not self.alive) then
        return
    end

    spr(self.FRAMES[self.frame], self.x, self.y)
end

function Explosion:kill()
    self.alive = false
end