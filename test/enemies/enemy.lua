Enemy = {}
Enemy.__index = Enemy

function Enemy.new(x, y, child)
    local self = setmetatable({}, Enemy)

    self.x = x
    self.y = y
    self.alive = true
    self.child = child

    -- defaults. accordingly in enemy type
    self.col = Collidable.new(self.x, self.y, self.child.w, self.child.h, false)

    return self
end

function Enemy:update()
    if (not self.alive) then
        return
    end

    self.col:collidesWith(player.col, function()
        player:damage()
        self:hurt()
    end)

    self.child:update()
end

function Enemy:hurt()
    if (not self.alive) then
        return
    end

    self:explode()
    self.child.health = self.child.health - 1

    if (self.child.health <= 0) then
        self:kill(true)
    end
end

function Enemy:explode()
    local offset = self.child.w / 3
    add(explosions, Explosion.new(self.child.x + offset, self.enemyType.y + offset))
end


function Enemy:draw()
    if (not self.alive) then
        return
    end

    self.child:draw()
end

function Enemy:kill(killedByPlayer)
    local killedByPlayer = killedByPlayer or false
    self.child:kill()
    self.col:kill()
    self.alive = false
end