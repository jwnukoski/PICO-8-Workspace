Diver = {}
Diver.__index = Diver
Diver.SPRITE_INDEX = 17

function Diver.new(x, y, health, stopPointY)
    local self = setmetatable({}, Diver)

    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.points = health
    self.w = 8

    self.parent.dropsUpgrade = true

    self.parent.col.w = self.w
    self.parent.col.h = self.w

    self.stopPointY = stopPointY

    self.shotsTaken = 0
    self.shotsAllowed = 5

    return self
end

function Diver:draw()
    spr(Diver.SPRITE_INDEX, self.parent.x, self.parent.y, 1, 1, false, false)
end

function Diver:update()
    -- goes down mid screen
    if self.parent.y < self.stopPointY then
        self.parent:setPos(self.parent.x, self.parent.y + 1)
        return
    end

    -- shoot
    if self.shotsTaken < self.shotsAllowed then
        if SCREEN.frameInFPS == 0 then
            sfx(2)
            add(BULLETS, Bullet.new(self.parent.x, self.parent.y + 2, -1, 2, false))
            add(BULLETS, Bullet.new(self.parent.x, self.parent.y + 2, 1, 2, false))
            self.shotsTaken = self.shotsTaken + 1
            return
        end

        -- dive sfx
        if self.shotsTaken == self.shotsAllowed - 1 and SCREEN.frameInFPS == 30 then
            sfx(5)
        end
        return
    end

    -- dive
    self.parent:setPos(self.parent.x, self.parent.y + 4)
end

function Diver:kill()
    -- Nothing needs to happen here, but it must exist
end