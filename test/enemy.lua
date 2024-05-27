Enemy = {}
Enemy.__index = Enemy

function Enemy.new(x, y, w, h)
    local self = setmetatable({}, Explosion)

    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.alive = true
    
    self.col = Collidable.new(self.x, self.y, self.w, self.h, false)

    return self
end

function Enemy:update()
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


function Enemy:draw()
    if (not self.alive) then
        return
    end

    spr(self.FRAMES[self.frame], self.x, self.y)
end

function Enemy:explode()
    add(explosions, Explosion.new(self.x, self.y, 1, 1))
end

function Enemy:kill()
    self.alive = false
end