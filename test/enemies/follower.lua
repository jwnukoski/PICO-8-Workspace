Follower = {}
Follower.__index = Follower
Follower.SPRITE_INDEX = 33

function Follower.new(x, y, health, stopPointY, dropsUpgrade)
    local self = setmetatable({}, Follower)

    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.points = health
    self.w = 16

    self.parent.dropsUpgrade = dropsUpgrade or false

    self.parent.col.w = self.w
    self.parent.col.h = self.w

    self.stopPointY = stopPointY or 32

    add(ENEMIES, self.parent)

    return self
end

function Follower:draw()
    spr(Follower.SPRITE_INDEX, self.parent.x, self.parent.y, 2, 2, false, false)
end

function Follower:update()
    if self.parent.y < self.stopPointY then
        self.parent:setPos(self.parent.x, self.parent.y + 2)
        return
    end

    -- shoot
    if SCREEN.frameInFPS == 0 or SCREEN.frameInFPS == 5 or SCREEN.frameInFPS == 10 or SCREEN.frameInFPS == 15 then
            sfx(2)
            Bullet.new(self.parent.x + 13, self.parent.y + 8, 1, 1, false)
            Bullet.new(self.parent.x - 4, self.parent.y + 8, -1, 1, false)
            Bullet.new(self.parent.x + 4, self.parent.y + 10, 0, 1, false)
    end

    -- move
    if self.parent.x < PLAYER.x - 4 then
        self.parent:setPos(self.parent.x + 1, self.parent.y)
    elseif self.parent.x > PLAYER.x - 4 then
        self.parent:setPos(self.parent.x - 1, self.parent.y)
    end
end

function Follower:kill()
    -- Nothing needs to happen here, but it must exist
end