Small = {}
Small.__index = Small

function Small.new(parent)
    local self = setmetatable({}, Explosion)
    self.parent = parent
    self.health = 5
    -- can set col here
    -- self.parent.col.w = ...

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
    add(explosions, Explosion.new(self.parent.x, self.parent.y))
end


function Small:draw()
    spr(17, self.parent.x, self.parent.y, 8, 8)
end

function Small:kill()
end