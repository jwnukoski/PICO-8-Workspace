Bullet = {}
Bullet.__index = Bullet
Bullet.E_IDS = {224, 225, 226, 227}
Bullet.P_IDS = {240, 241, 242, 243}
Bullet.COL_OFFSET = 2

function Bullet.new(x, y, xAmt, yAmt, isPlayer)
    local self = setmetatable({}, Bullet)

    self.x = x
    self.y = y
    self.xAmt = xAmt
    self.yAmt = yAmt
    self.isPlayer = isPlayer
    self.alive = true
    self.frameId = 1
    self.col = Collidable.new(self.x, self.y , 4, 4, Bullet.COL_OFFSET, Bullet.COL_OFFSET)

    add(BULLETS, self)

    return self
end

function Bullet:draw()
    -- Debug purposes only
    if not self.alive then
        return
    end

    if (self.isPlayer) then
        spr(Bullet.P_IDS[self.frameId], self.x, self.y)
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

    -- offscreen
    if (self.y < -8 or self.y > SCREEN.HEIGHT) or (self.x < -8 or self.y > SCREEN.WIDTH) then
        self.alive = false
        return
    end

    -- move collision
    self.col:setPos(self.x, self.y)

    -- animation
    if (SCREEN.frameInFPS == 5 or SCREEN.frameInFPS == 10 or SCREEN.frameInFPS == 15 or SCREEN.frameInFPS == 20 or SCREEN.frameInFPS == 25 or SCREEN.frameInFPS == 30) then
        if self.frameId < #Bullet.E_IDS then
            self.frameId = self.frameId + 1
        else
            self.frameId = 1
        end
    end
end

function Bullet:kill()
    self.alive = false
    self.col:kill()
end