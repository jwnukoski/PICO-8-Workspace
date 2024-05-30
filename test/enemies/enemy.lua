Enemy = {}
Enemy.__index = Enemy

function Enemy.new(x, y, child)
    local self = setmetatable({}, Enemy)

    self.x = x
    self.y = y
    self.child = child
    self.alive = true

    self.col = Collidable.new(self.x, self.y, 8, 8)

    add(enemies, self)

    return self
end

function Enemy:update()
    if (not self.alive) then
        return
    end

    -- offscreen
    if (self.y > SCREEN.HEIGHT) then
        self:kill(false)
    end

    -- collision with player
    self.col:collidesWith(player.col, function()
        player:damage()
        self:hurt(false) -- dont count as good
    end)

    -- collision with player bullet
    for i, bullet in pairs(bullets) do
        if bullet.isPlayer then
            self.col:collidesWith(bullet.col, function()
                bullet:kill()
                self:hurt(true)
            end)
        end
    end

    self.child:update()
end

function Enemy:hurt(fromPlayer)
    if (not self.alive) then
        return
    end

    self:explode()
    self.child.health = self.child.health - 1

    if (self.child.health <= 0) then
        self:kill(fromPlayer)
    end
end

function Enemy:setPos(x, y)
    if (not self.alive) then
        return
    end

    self.x = x
    self.y = y
    self.col:setPos(self.x, self.y)
end

function Enemy:explode()
    if self.child.w ~= 8 then
        local offset = self.child.w / 3
        add(explosions, Explosion.new(self.x + offset, self.y + offset))
        return
    end
    
    add(explosions, Explosion.new(self.x, self.y))
end


function Enemy:draw()
    if (not self.alive) then
        return
    end

    self.col:draw()
    self.child:draw()
end

function Enemy:kill(killedByPlayer)
    local killedByPlayer = killedByPlayer or false
    
    if killedByPlayer then
        -- score = score + 1
    end

    self.child:kill()
    self.col:kill()
    self.alive = false
end