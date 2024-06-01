Spinner = {}
Spinner.__index = Spinner
Spinner.SPRITE_INDEX = 35

function Spinner.new(x, y, health, stopPointY, dropsUpgrade)
    local self = setmetatable({}, Spinner)

    self.parent = Enemy.new(x, y, self)
    self.health = health
    self.points = health
    self.w = 16

    self.parent.dropsUpgrade = dropsUpgrade or false

    self.parent.col.w = self.w
    self.parent.col.h = self.w

    self.stopPointY = stopPointY

    add(ENEMIES, self.parent)

    return self
end

function Spinner:draw()
    -- spr(Spinner.SPRITE_INDEX, self.parent.x, self.parent.y, 1, 1, false, false)
end

function Spinner:update()
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

function Spinner:kill()
    -- Nothing needs to happen here, but it must exist
end