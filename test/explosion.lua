Explosion = {}
Explosion.__index = Explosion
Explosion.FRAMES = {192, 192, 192, 192, 193, 193, 194, 195}

function Explosion.new(x, y, w, h)
    local self = setmetatable({}, Explosion)

    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.alive = true
    self.frame = 0

    return self
end

function Explosion:update()
    if (not self.alive) then
        return
    end

    if (self.frame < #self.FRAMES) then
        self.frame = self.frame + 1
    else
        self.alive = false
    end

    if (self.frame == 1) then
        sfx(0)
    end
end


function Explosion:draw()
    if (not self.alive) then
        return
    end

    spr(self.FRAMES[self.frame], self.x, self.y)
end