Small = {}
Small.__index = Small

function Small.new(parent)
    local self = setmetatable({}, Explosion)
    self.parent = parent
    self.health = 5
    return self
end

function Small:update()
    self.parent.col:setPos(self.x, self.y)
end

function Small:hurt()
    self.enemyType:hurt(self)
    self:explode()

    if (self.enemyType.health <= 0) then
        self:kill()
    end
end

function Small:explode()
    add(explosions, Explosion.new(self.enemyType.x, self.enemyType.y))
end


function Small:draw()
    spr(17, self.enemyType.x, self.enemyType.y, self.w, self.h)
end

function Small:kill()
end