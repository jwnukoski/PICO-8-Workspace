Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x, y, xAmt, yAmt, isPlayer)
    local self = setmetatable({}, Bullet)

    self.x = x
    self.y = y
    self.xAmt = xAmt
    self.yAmt = yAmt
    self.isPlayer = isPlayer
    self.type = type
    self.alive = true

    self.color = COLOR.RED
    if self.isPlayer then
        self.color = COLOR.GRN
    end

    self.col = Collidable.new(self.x, self.y, 1, 1, true)

    return self
end

function Bullet:draw()
    -- Debug purposes only
    if not self.alive then
        return
    end

    rectfill(self.x, self.y, self.x, self.y + 2, self.color)

    self.col:draw()
end

function Bullet:update()
    if not self.alive then
        return
    end

    self.x = self.x + self.xAmt
    self.y = self.y + self.yAmt

    if self.y < 0 or self.y > SCREEN.HEIGHT then
        self.alive = false
        return
    end

    self.col:setPos(self.x, self.y)

    for i, meteor in pairs(meteors) do
        self.col:collidesWith(meteor.col, function()
            meteor:explode()
            self.alive = false
        end)
    end
    -- if self.isPlayer then
        -- Meteors. TODO: fix into 1 group of all enemies
    -- end

    -- if not self.isPlayer then
    --     self.col:collidesWith(player.col, function()
    --         player:damage()
    --         add(explosions, Explosion.new(self.x, self.y, 1, 1))
    --         self:kill()
    --     end)
    -- end
end