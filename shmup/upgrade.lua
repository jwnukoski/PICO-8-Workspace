Upgrade = {}
Upgrade.__index = Upgrade
Upgrade.FRAMES = {208, 209}
Upgrade.SPEED = 1
Upgrade.FLASH_MAX = 10

function Upgrade.new(x, y)
    local self = setmetatable({}, Upgrade)

    self.x = x
    self.y = y
    self.alive = true
    self.spriteFrame = 1
    self.flashCount = 0
    self.inFlash = false

    self.col = Collidable.new(self.x, self.y, 8, 8)

    return self
end

function Upgrade:draw()
    if not self.alive then
        return
    end

    spr(Upgrade.FRAMES[self.spriteFrame], self.x, self.y, 1, 1, false, false)

    self.col:draw()
end

function Upgrade:update()
    if not self.alive then
        return
    end

    -- Move
    self.y = self.y + Upgrade.SPEED

    -- Off screen
    if self.y > SCREEN.HEIGHT then
        self:kill()
    end

    -- Collision with player
    self.col:setPos(self.x, self.y)
    self.col:collidesWith(PLAYER.col, function()
        PLAYER:upgrade()
        MenuText.new(self.x, self.y, "upgrade", COLOR.YLW, SCREEN.FPS)
        self:kill()
    end)

    self:flash()
end

function Upgrade:flash()
    if self.flashCount >= Upgrade.FLASH_MAX then
        self.inFlash = not self.inFlash
        self.flashCount = 0
    else
        self.flashCount = self.flashCount + 1
    end

    if self.inFlash then
        self.spriteFrame = 2
    else
        self.spriteFrame = 1
    end
end

function Upgrade:kill()
    self.col:kill()
    self.alive = false
end