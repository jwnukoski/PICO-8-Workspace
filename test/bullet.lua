Bullet = {}
Bullet.__index = Bullet
Bullet.E_IDS = {224, 225}

function Bullet.new(x, y, xAmt, yAmt, isPlayer)
    local self = setmetatable({}, Bullet)

    self.x = x
    self.y = y
    self.xAmt = xAmt
    self.yAmt = yAmt
    self.isPlayer = isPlayer
    self.type = type
    self.alive = true
    self.frameId = 1

    if self.isPlayer then
        self.col = Collidable.new(self.x, self.y, 1, 2)
    else
        self.col = Collidable.new(self.x, self.y, 8, 8)
    end

    return self
end

function Bullet:draw()
    -- Debug purposes only
    if not self.alive then
        return
    end

    if (self.isPlayer) then
        rectfill(self.x, self.y, self.x, self.y + 2, COLOR.GRN)
    end

    if (not self.isPlayer) then
        spr(Bullet.E_IDS[self.frameId], self.x, self.y)
    end

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

    -- collision with player
    if not self.isPlayer then
        self.col:collidesWith(player.col, function()
            player:damage()
            self:kill()
        end)
    end

    -- flash effect
    if not self.isPlayer and SCREEN.frameInFPS == 0 then
        if self.frameId == 1 then
            self.frameId = 2
        else
            self.frameId = 1
        end
    end
end

function Bullet:kill()
    self.alive = false
    self.col:kill()
end